from __future__ import annotations

import hashlib
import json
import os
import threading
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path
from typing import Any

import pytest

from census.global_confinement import piqd_singular_backend as subject

SCRIPT = b'print("P97_EQUALITY_IDEAL_VERDICT_BEGIN");\nprint(0);\n'
STDOUT = b"P97_EQUALITY_IDEAL_VERDICT_BEGIN\n0\n"
STDERR = b""


def sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def queued(run_id: str, request: dict[str, object]) -> dict[str, object]:
    return {
        "id": run_id,
        "project": request["project"],
        "request_id": request["request_id"],
        "request_sha256": subject._request_sha256(
            request["project"],
            request["script_blob_hash"],
            request["source"],
            request["profile"],
            request["timeout_s"],
        ),
        "script_blob_hash": request["script_blob_hash"],
        "source": request["source"],
        "profile": request["profile"],
        "timeout_s": request["timeout_s"],
        "state": "queued",
        "run_status": None,
        "exit_code": None,
        "argv": None,
        "binary_path": None,
        "binary_sha256": None,
        "env_sha256": None,
        "stdout_blob_hash": None,
        "stderr_blob_hash": None,
        "stdout_truncated": None,
        "stderr_truncated": None,
        "attested_processes": None,
        "attestation_basis": None,
        "result_sha256": None,
        "wall_ms": None,
        "created_at": 100,
        "started_at": None,
        "finished_at": None,
    }


def finished(initial: dict[str, object], status: str = "RAN") -> dict[str, object]:
    run = dict(initial)
    run.update(
        {
            "state": "finished",
            "run_status": status,
            "exit_code": 0,
            "argv": [
                *subject.ARGV_PREFIX,
                f"/var/lib/piqd/singular/{run['id']}/script.sing",
            ],
            "binary_path": "/opt/homebrew/bin/Singular",
            "binary_sha256": "1" * 64,
            "env_sha256": "2" * 64,
            "stdout_blob_hash": sha(STDOUT),
            "stderr_blob_hash": sha(STDERR),
            "stdout_truncated": False,
            "stderr_truncated": False,
            "attested_processes": 1,
            "attestation_basis": subject.STARTED_ATTESTATION,
            "wall_ms": 12,
            "started_at": 101,
            "finished_at": 102,
        }
    )
    run["result_sha256"] = subject._result_sha256(run)
    return run


def did_not_start(initial: dict[str, object]) -> dict[str, object]:
    run = dict(initial)
    run.update(
        {
            "state": "finished",
            "run_status": "DID_NOT_START",
            "argv": [
                *subject.ARGV_PREFIX,
                f"/var/lib/piqd/singular/{run['id']}/script.sing",
            ],
            "binary_path": None,
            "binary_sha256": None,
            "stdout_truncated": False,
            "stderr_truncated": False,
            "attested_processes": 0,
            "attestation_basis": subject.DID_NOT_START_ATTESTATION,
            "wall_ms": 1,
            "started_at": 101,
            "finished_at": 102,
        }
    )
    run["result_sha256"] = subject._result_sha256(run)
    return run


def ran_with_nonzero_exit(run: dict[str, object]) -> None:
    run["exit_code"] = 9
    run["result_sha256"] = subject._result_sha256(run)


class FakeState:
    def __init__(self) -> None:
        self.blobs: dict[str, bytes] = {}
        self.runs: dict[str, dict[str, object]] = {}
        self.requests: dict[tuple[str, str], str] = {}
        self.posts = 0
        self.status = "RAN"
        self.mutate: Any = None
        self.bad_stdout = False
        self.bad_put_pair = False
        self.last_request: dict[str, object] | None = None


class Handler(BaseHTTPRequestHandler):
    protocol_version = "HTTP/1.0"
    server_version = "fake-piqd"

    @property
    def state(self) -> FakeState:
        return self.server.state  # type: ignore[attr-defined]

    def log_message(self, format: str, *args: object) -> None:
        pass

    def body(self) -> bytes:
        return self.rfile.read(int(self.headers.get("Content-Length", "0")))

    def reply(self, status: int, body: bytes, content_type: str) -> None:
        self.send_response(status)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def json_reply(self, status: int, value: object) -> None:
        self.reply(
            status,
            json.dumps(value, separators=(",", ":")).encode(),
            "application/json",
        )

    def do_PUT(self) -> None:
        digest = self.path.removeprefix("/blobs/")
        body = self.body()
        existed = digest in self.state.blobs
        self.state.blobs[digest] = body
        self.json_reply(
            200 if existed else 201,
            {
                "hash": digest,
                "bytes": len(body),
                "already_present": existed or self.state.bad_put_pair,
            },
        )

    def do_POST(self) -> None:
        assert self.path == "/singular/runs"
        self.state.posts += 1
        request = json.loads(self.body())
        assert set(request) == subject.REQUEST_KEYS
        self.state.last_request = request
        key = (request["project"], request["request_id"])
        if key in self.state.requests:
            run_id = self.state.requests[key]
            self.json_reply(200, {"replayed": True, **self.state.runs[run_id]})
            return
        run_id = "12345678-1234-4234-8234-123456789abc"
        run = queued(run_id, request)
        self.state.requests[key] = run_id
        self.state.runs[run_id] = run
        self.json_reply(202, {"replayed": False, **run})

    def do_GET(self) -> None:
        parts = self.path.split("/")
        run_id = parts[3]
        run = self.state.runs[run_id]
        if len(parts) == 4:
            if run["state"] != "finished":
                terminal = (
                    did_not_start(run)
                    if self.state.status == "DID_NOT_START"
                    else finished(run, self.state.status)
                )
                self.state.runs[run_id] = terminal
                run = terminal
            value = dict(run)
            if self.state.mutate is not None:
                self.state.mutate(value)
            self.json_reply(200, value)
        elif parts[4] == "script":
            self.reply(200, SCRIPT, "application/octet-stream")
        elif parts[4] == "stdout":
            body = b"corrupt" if self.state.bad_stdout else STDOUT
            self.reply(200, body, "application/octet-stream")
        else:
            self.reply(200, STDERR, "application/octet-stream")


@pytest.fixture
def fake() -> tuple[FakeState, str]:
    state = FakeState()
    server = HTTPServer(("127.0.0.1", 0), Handler)
    server.state = state  # type: ignore[attr-defined]
    thread = threading.Thread(target=server.serve_forever, daemon=True)
    thread.start()
    try:
        yield state, f"http://127.0.0.1:{server.server_port}"
    finally:
        server.shutdown()
        thread.join()
        server.server_close()


def execute(base_url: str, output: Path) -> subject.SingularExecutionResult:
    return subject.PiqdSingularRunner(
        base_url, poll_interval_s=0.01, max_poll_s=2
    ).execute(
        SCRIPT,
        source="census/global_confinement/equality_ideal_probe.py",
        project="erdos-97-96",
        request_id="equality-probe-7",
        timeout_s=60,
        output_directory=output,
        source_context={"packet_index": 7, "rows_sha256": "a" * 64},
    )


def test_public_boundaries_reject_hostile_containers_before_transport(
    tmp_path: Path,
) -> None:
    runner = subject.PiqdSingularRunner("http://127.0.0.1:1")
    native_path_type = type(Path())

    class HostilePath(native_path_type):
        def __fspath__(self) -> str:
            raise AssertionError("hostile path hook ran")

        @property
        def parts(self) -> tuple[str, ...]:
            raise AssertionError("hostile path hook ran")

    class HostileMapping(dict[str, object]):
        def __iter__(self) -> object:
            raise AssertionError("hostile mapping hook ran")

        def items(self) -> object:
            raise AssertionError("hostile mapping hook ran")

        def values(self) -> object:
            raise AssertionError("hostile mapping hook ran")

    hostile_target = tmp_path / "hostile-path"
    hostile_path = HostilePath(str(hostile_target))
    with pytest.raises(subject.PiqdSingularCustodyError, match="exact native Path"):
        runner.execute(
            SCRIPT,
            source="source",
            project="project",
            request_id="hostile-path",
            timeout_s=1,
            output_directory=hostile_path,
            source_context={},
        )
    with pytest.raises(subject.PiqdSingularCustodyError, match="builtin dict"):
        runner.execute(
            SCRIPT,
            source="source",
            project="project",
            request_id="hostile-mapping",
            timeout_s=1,
            output_directory=tmp_path / "hostile-mapping",
            source_context=HostileMapping(packet=1),
        )
    with pytest.raises(subject.PiqdSingularCustodyError, match="exact native Path"):
        subject.validate_artifact_directory(hostile_path)
    assert not hostile_target.exists()
    assert not (tmp_path / "hostile-mapping").exists()


def test_one_worker_fake_success_offline_validation_and_no_math_verdict(
    fake: tuple[FakeState, str], tmp_path: Path, capsys: pytest.CaptureFixture[str]
) -> None:
    state, base_url = fake
    result = execute(base_url, tmp_path / "run")
    assert result.run_status == "RAN"
    assert result.stdout == STDOUT
    assert result.stderr == STDERR
    assert result.stdout_sha256 == sha(STDOUT)
    assert result.stderr_sha256 == sha(STDERR)
    assert result.script_sha256 == sha(SCRIPT)
    assert subject.validate_artifact_directory(tmp_path / "run") == result
    manifest = json.loads(result.manifest_path.read_bytes())
    assert manifest["claims"] == subject.CLAIMS
    assert manifest["claims"]["mathematical_verdict"] is False
    assert manifest["source_context"] == {
        "packet_index": 7,
        "rows_sha256": "a" * 64,
    }
    assert state.last_request == manifest["request"]
    assert state.last_request["source"].endswith(result.source_context_sha256)
    assert state.posts == 1
    assert subject.main(["--check", os.fspath(tmp_path / "run")]) == 0
    assert json.loads(capsys.readouterr().out)["mathematical_verdict"] is None


def test_idempotent_post_replays_without_a_second_run(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake
    first = execute(base_url, tmp_path / "first")
    second = execute(base_url, tmp_path / "second")
    assert first.run_id == second.run_id
    assert second.replayed is True
    assert len(state.runs) == 1
    assert state.posts == 2


def test_blob_put_pair_and_utf8_inputs_fail_closed(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake
    state.bad_put_pair = True
    with pytest.raises(subject.PiqdSingularCustodyError, match="already_present"):
        execute(base_url, tmp_path / "bad-put")
    with pytest.raises(subject.PiqdSingularCustodyError, match="UTF-8"):
        subject.PiqdSingularRunner(base_url).execute(
            SCRIPT,
            source="bad\ud800",
            project="p",
            request_id="r",
            timeout_s=1,
            output_directory=tmp_path / "bad-utf8",
            source_context={},
        )


@pytest.mark.parametrize(
    "mutation",
    [
        lambda run: run.update({"unknown": 1}),
        lambda run: run.update({"attested_processes": True}),
        lambda run: run.update({"argv": ["Singular", "script.sing"]}),
        lambda run: run.update({"request_sha256": "0" * 64}),
        lambda run: run.update({"result_sha256": "0" * 64}),
        ran_with_nonzero_exit,
    ],
)
def test_strict_runview_and_hashes_fail_closed(
    fake: tuple[FakeState, str], tmp_path: Path, mutation: Any
) -> None:
    state, base_url = fake
    state.mutate = mutation
    with pytest.raises(subject.PiqdSingularCustodyError):
        execute(base_url, tmp_path / "run")


def test_retrieved_stream_must_match_receipt_hash(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake
    state.bad_stdout = True
    with pytest.raises(subject.PiqdSingularCustodyError, match="receipt hash"):
        execute(base_url, tmp_path / "run")


def test_truncated_stream_requires_a_full_retained_prefix(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake

    def claim_short_truncation(run: dict[str, object]) -> None:
        run["stdout_truncated"] = True
        run["result_sha256"] = subject._result_sha256(run)

    state.mutate = claim_short_truncation
    with pytest.raises(subject.PiqdSingularCustodyError, match="16 MiB"):
        execute(base_url, tmp_path / "run")
    assert not (tmp_path / "run").exists()


def test_did_not_start_requires_exact_zero_attestation_and_has_no_streams(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake
    state.status = "DID_NOT_START"
    result = execute(base_url, tmp_path / "valid")
    assert result.run_status == "DID_NOT_START"
    assert result.stdout is None and result.stderr is None
    assert result.stdout_path is None and result.stderr_path is None

    state.requests.clear()
    state.runs.clear()
    state.mutate = lambda run: run.update(
        {"attested_processes": None, "attestation_basis": None}
    )
    with pytest.raises(subject.PiqdSingularCustodyError, match="zero-process"):
        execute(base_url, tmp_path / "malformed")


def test_interrupted_is_always_inconclusive_and_null_is_not_zero(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    state, base_url = fake
    state.status = "INTERRUPTED"

    def interrupted(run: dict[str, object]) -> None:
        for name in (
            "exit_code",
            "argv",
            "binary_path",
            "binary_sha256",
            "env_sha256",
            "stdout_blob_hash",
            "stderr_blob_hash",
            "stdout_truncated",
            "stderr_truncated",
            "attested_processes",
            "attestation_basis",
            "result_sha256",
            "wall_ms",
        ):
            run[name] = None

    state.mutate = interrupted
    with pytest.raises(subject.PiqdSingularCustodyError, match="INTERRUPTED"):
        execute(base_url, tmp_path / "run")


def test_publication_is_create_once_and_rejects_symlink_parent(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    _, base_url = fake
    execute(base_url, tmp_path / "run")
    with pytest.raises(
        subject.PiqdSingularCustodyError, match="must not already exist"
    ):
        execute(base_url, tmp_path / "run")
    real = tmp_path / "real"
    real.mkdir()
    link = tmp_path / "link"
    link.symlink_to(real, target_is_directory=True)
    with pytest.raises(subject.PiqdSingularCustodyError, match="unsafe"):
        execute(base_url, link / "run")


def test_script_cap_and_artifact_tamper_fail_closed(
    fake: tuple[FakeState, str], tmp_path: Path
) -> None:
    _, base_url = fake
    runner = subject.PiqdSingularRunner(base_url)
    with pytest.raises(subject.PiqdSingularCustodyError, match="16 MiB"):
        runner.execute(
            b"x" * (subject.MAX_SCRIPT_BYTES + 1),
            source="x",
            project="p",
            request_id="r",
            timeout_s=1,
            output_directory=tmp_path / "large",
            source_context={},
        )
    result = execute(base_url, tmp_path / "run")
    os.chmod(tmp_path / "run", 0o700)
    os.chmod(result.stdout_path, 0o600)
    result.stdout_path.write_bytes(b"changed")
    os.chmod(result.stdout_path, 0o400)
    os.chmod(tmp_path / "run", 0o500)
    with pytest.raises(subject.PiqdSingularCustodyError):
        subject.validate_artifact_directory(tmp_path / "run")
