from __future__ import annotations

import json
import os
import urllib.parse
from collections.abc import Callable
from pathlib import Path
from typing import Any

import pytest

from census.card_head.sat_encoding import CadicalResult, EncodingError
from census.f_gamma import encoding
from census.f_gamma.encoding import FGammaInstance
from census.f_gamma.piqd_adapter import (
    EVIDENCE_CLASSIFICATION,
    PIQD_PROJECT,
    FGammaPiqdAdapterError,
    FGammaPiqdBaseDiscovery,
    make_f_gamma_piqd_base_discovery,
)
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
)
from census.p97_search.phase3_piqd_oracle import (
    HttpResponse,
    MultipartBody,
    raw_dimacs_identity,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_static_solver_runner import StaticSolverResult

POSITIVE = frozenset({1, 2, 5, 6, 14})
TOTAL_MODEL = [
    variable if variable in POSITIVE else -variable for variable in range(1, 24)
]


class FakePiqd:
    def __init__(
        self,
        *,
        result: str = "SAT",
        assignment: list[object] | None = None,
    ) -> None:
        self.result = result
        self.assignment = TOTAL_MODEL if assignment is None else assignment
        self.job_id = "f-gamma-static-job-001"
        self.cnf = b""
        self.producer = b""
        self.stored_cnf: bytes | None = None
        self.calls: list[tuple[str, str]] = []
        self.fail_at: tuple[str, str] | None = None
        self.wrong_identity = False
        self.raw_status_body: bytes | None = None
        self.hook: Callable[[str, str], None] | None = None

    @staticmethod
    def _json(value: dict[str, Any]) -> HttpResponse:
        return HttpResponse(
            200,
            canonical_json_bytes(value),
            {"Content-Type": "application/json"},
        )

    def __call__(
        self,
        method: str,
        url: str,
        body: bytes | MultipartBody | None,
        _headers: object,
    ) -> HttpResponse:
        parsed = urllib.parse.urlsplit(url)
        path = parsed.path + (f"?{parsed.query}" if parsed.query else "")
        self.calls.append((method, path))
        if self.hook is not None:
            self.hook(method, path)
        if self.fail_at == (method, path):
            raise OSError("injected daemon failure")

        cnf_hash = sha256_bytes(self.cnf)
        producer_hash = sha256_bytes(self.producer)
        identity = raw_dimacs_identity(
            backend="cadical",
            solver_profile="sat",
            cnf_sha256=cnf_hash,
            producer_manifest_sha256=producer_hash,
            requested_core_limit=1,
        )
        if method == "POST" and path == "/jobs/prepare-cnf":
            assert isinstance(body, bytes)
            assert self.cnf in body
            assert self.producer in body
            num_vars, num_clauses = scan_dimacs(self.cnf)
            return self._json(
                {
                    "job_id": self.job_id,
                    "cnf_blob_hash": cnf_hash,
                    "identity_hash": "0" * 64 if self.wrong_identity else identity,
                    "num_vars": num_vars,
                    "num_clauses": num_clauses,
                    "preview": "",
                    "existing": False,
                    "requested_core_limit": 1,
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/cnf":
            return HttpResponse(
                200,
                self.cnf if self.stored_cnf is None else self.stored_cnf,
                {"Content-Type": "application/octet-stream"},
            )
        if method == "POST" and path == f"/jobs/confirm?job_id={self.job_id}":
            return self._json({"job_id": self.job_id, "status": "confirmed"})
        if method == "GET" and path == f"/jobs/{self.job_id}":
            if self.raw_status_body is not None:
                return HttpResponse(
                    200,
                    self.raw_status_body,
                    {"Content-Type": "application/json"},
                )
            return self._json(
                {
                    "id": self.job_id,
                    "status": "completed",
                    "result": self.result,
                    "requested_core_limit": 1,
                    "progress": {"solver_started": True},
                    "attested_solver_processes": 1,
                    "attestation_basis": "SINGLE_PROCESS_NO_PARALLEL_FLAG",
                }
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/model":
            return self._json(
                {
                    "job_id": self.job_id,
                    "result": "SAT",
                    "num_assigned": len(self.assignment),
                    "assignment": self.assignment,
                }
            )
        if method == "GET" and path.startswith(f"/jobs/{self.job_id}/log?"):
            payload = f"s {self.result}\n".encode()
            return HttpResponse(
                200,
                payload,
                {
                    "Content-Type": "text/plain; charset=utf-8",
                    "X-Log-Size-Bytes": str(len(payload)),
                },
            )
        if method == "GET" and path == f"/jobs/{self.job_id}/proof":
            raise AssertionError("observational discovery must not fetch a proof")
        raise AssertionError((method, path))


def _discovery(tmp_path: Path, api: FakePiqd) -> FGammaPiqdBaseDiscovery:
    discovery = make_f_gamma_piqd_base_discovery(
        base_url="http://piqd.invalid",
        journal_root=tmp_path / "piqd",
        transport=api,
        sleep=lambda _seconds: None,
    )
    api.cnf = discovery.bundle.cnf_bytes
    api.producer = discovery.bundle.producer_manifest_bytes
    return discovery


def _run(discovery: FGammaPiqdBaseDiscovery, tmp_path: Path) -> CadicalResult:
    query_dir = tmp_path / "query"
    query_dir.mkdir(exist_ok=True)
    return discovery(FGammaInstance(), query_dir / "base.cnf", 7)


def _captured_static_result(
    discovery: FGammaPiqdBaseDiscovery, tmp_path: Path
) -> tuple[StaticSolverResult, Path]:
    query_dir = tmp_path / "captured-query"
    query_dir.mkdir(parents=True)
    query_path = query_dir / "base.cnf"
    query_path.write_bytes(discovery.bundle.cnf_bytes)
    observed = discovery.runner(query_path, 7, None)
    assert observed.verdict == "SAT"
    receipt = json.loads(observed.stdout)
    return observed, Path(receipt["attempt_directory"])


def _replay_discovery(
    discovery: FGammaPiqdBaseDiscovery, observed: StaticSolverResult
) -> FGammaPiqdBaseDiscovery:
    return FGammaPiqdBaseDiscovery(
        runner=lambda _path, _timeout, _proof: observed,
        bundle=discovery.bundle,
        attempt_root=discovery.attempt_root,
    )


def _resign(value: dict[str, Any], hash_field: str) -> None:
    unsigned = dict(value)
    unsigned.pop(hash_field, None)
    value[hash_field] = sha256_json(unsigned)


def _rewrite_receipt_and_custody(attempt_dir: Path, receipt: dict[str, Any]) -> str:
    _resign(receipt, "receipt_sha256")
    receipt_bytes = canonical_json_bytes(receipt) + b"\n"
    receipt_path = attempt_dir / "solver-receipt.json"
    receipt_path.write_bytes(receipt_bytes)
    custody_path = attempt_dir / "custody-seal.json"
    custody = json.loads(custody_path.read_bytes())
    custody.update(
        {
            "receipt_sha256": receipt["receipt_sha256"],
            "receipt_file_sha256": sha256_bytes(receipt_bytes),
            "receipt_file_size": len(receipt_bytes),
        }
    )
    _resign(custody, "custody_seal_sha256")
    custody_path.write_bytes(canonical_json_bytes(custody) + b"\n")
    return receipt_bytes.decode()


def _replace_artifact(
    attempt_dir: Path, old_digest: str, payload: bytes
) -> tuple[str, dict[str, Any]]:
    new_digest = sha256_bytes(payload)
    artifact_dir = attempt_dir / "attempt.jsonl.artifacts"
    target = artifact_dir / old_digest
    target.write_bytes(payload)
    target.rename(artifact_dir / new_digest)
    custody_path = attempt_dir / "custody-seal.json"
    custody = json.loads(custody_path.read_bytes())
    for entry in custody["inventory"]["artifacts"]:
        if entry["sha256"] == old_digest:
            entry["sha256"] = new_digest
            entry["size"] = len(payload)
            break
    else:
        raise AssertionError("artifact is absent from custody")
    custody["inventory"]["artifacts"].sort(key=lambda entry: entry["sha256"])
    return new_digest, custody


def _rewrite_journal_driver_receipt_custody(
    attempt_dir: Path,
    receipt: dict[str, Any],
    custody: dict[str, Any],
    records: list[dict[str, Any]],
) -> str:
    _resign(records[-1], "record_sha256")
    journal_bytes = b"".join(canonical_json_bytes(record) + b"\n" for record in records)
    (attempt_dir / "attempt.jsonl").write_bytes(journal_bytes)
    driver_path = attempt_dir / "attempt.jsonl.seal.json"
    driver = json.loads(driver_path.read_bytes())
    driver["record_count"] = len(records)
    driver["terminal_attempt_sha256"] = records[-1]["record_sha256"]
    driver["journal_sha256"] = sha256_bytes(journal_bytes)
    _resign(driver, "seal_sha256")
    driver_bytes = canonical_json_bytes(driver) + b"\n"
    driver_path.write_bytes(driver_bytes)
    receipt["terminal_record_sha256"] = records[-1]["record_sha256"]
    receipt["journal_record_count"] = len(records)
    receipt["seal_sha256"] = driver["seal_sha256"]
    custody["inventory"].update(
        {
            "journal_sha256": sha256_bytes(journal_bytes),
            "journal_size": len(journal_bytes),
            "driver_seal_sha256": sha256_bytes(driver_bytes),
        }
    )
    custody_path = attempt_dir / "custody-seal.json"
    custody_path.write_bytes(canonical_json_bytes(custody) + b"\n")
    stdout = _rewrite_receipt_and_custody(attempt_dir, receipt)
    # The receipt helper reloaded custody before its receipt update; preserve all
    # journal/artifact inventory mutations and rebind the new receipt once more.
    current = json.loads(custody_path.read_bytes())
    current["inventory"] = custody["inventory"]
    receipt_bytes = stdout.encode()
    current.update(
        {
            "receipt_sha256": receipt["receipt_sha256"],
            "receipt_file_sha256": sha256_bytes(receipt_bytes),
            "receipt_file_size": len(receipt_bytes),
        }
    )
    _resign(current, "custody_seal_sha256")
    custody_path.write_bytes(canonical_json_bytes(current) + b"\n")
    return stdout


def test_sat_replays_total_model_and_canonical_decode(tmp_path: Path) -> None:
    api = FakePiqd()
    discovery = _discovery(tmp_path, api)

    result = _run(discovery, tmp_path)

    assert result.verdict == "SAT"
    assert result.positive_variables == POSITIVE
    assert result.cube == {"K(s1)": ["s1", "s2", "e", "o"], "K(g)": ["g"]}
    assert (
        discovery.bundle.num_variables,
        discovery.bundle.num_clauses,
        len(discovery.bundle.cnf_bytes),
        discovery.bundle.cnf_sha256,
    ) == (
        23,
        27,
        235,
        "e09d43157d638a381902dba2979dc80f4ee1d1f1e5021dc0e65f519765c49be5",
    )
    assert (
        json.loads(discovery.bundle.descriptor_bytes)["evidence_classification"]
        == EVIDENCE_CLASSIFICATION
    )
    producer = json.loads(discovery.bundle.producer_manifest_bytes)
    assert producer["variable_map_sha256"] == discovery.bundle.variable_map_sha256
    assert json.loads(discovery.bundle.source_manifest_bytes)["claims"] == {
        "source_entitlement": False,
        "theorem_coverage": False,
        "universal_lift": False,
        "lean_closure": False,
    }
    targets = [path for _method, path in api.calls]
    assert f"/jobs/{api.job_id}/cnf" in targets
    assert f"/jobs/{api.job_id}/model" in targets
    assert any(path.startswith(f"/jobs/{api.job_id}/log?") for path in targets)
    assert all(not path.endswith("/proof") for path in targets)


@pytest.mark.parametrize("result", ["UNKNOWN", "UNSAT"])
def test_non_sat_is_fail_closed_without_proof_or_fallback(
    tmp_path: Path, result: str
) -> None:
    api = FakePiqd(result=result)
    discovery = _discovery(tmp_path, api)

    with pytest.raises(FGammaPiqdAdapterError, match="failed closed"):
        _run(discovery, tmp_path)

    assert all(not path.endswith("/proof") for _method, path in api.calls)
    if result == "UNSAT":
        assert all(not path.endswith("/model") for _method, path in api.calls)


def test_daemon_failure_is_fail_closed(tmp_path: Path) -> None:
    api = FakePiqd()
    api.fail_at = ("POST", "/jobs/prepare-cnf")
    discovery = _discovery(tmp_path, api)

    with pytest.raises(FGammaPiqdAdapterError, match="failed closed"):
        _run(discovery, tmp_path)


@pytest.mark.parametrize(
    "assignment",
    [
        TOTAL_MODEL[:-1],
        TOTAL_MODEL[:-1] + [22],
        TOTAL_MODEL[:-1] + [24],
        TOTAL_MODEL[:-1] + [True],
        list(range(1, 24)),
    ],
    ids=["partial", "duplicate", "out-of-range", "boolean", "falsifies-cnf"],
)
def test_wrong_or_non_total_model_is_rejected(
    tmp_path: Path, assignment: list[object]
) -> None:
    discovery = _discovery(tmp_path, FakePiqd(assignment=assignment))

    with pytest.raises(FGammaPiqdAdapterError, match="failed closed"):
        _run(discovery, tmp_path)


def test_identity_and_cnf_readback_tampering_are_rejected(tmp_path: Path) -> None:
    wrong_identity = FakePiqd()
    wrong_identity.wrong_identity = True
    with pytest.raises(FGammaPiqdAdapterError, match="failed closed"):
        _run(_discovery(tmp_path / "identity", wrong_identity), tmp_path / "identity")

    crossed_cnf = FakePiqd()
    discovery = _discovery(tmp_path / "cnf", crossed_cnf)
    crossed_cnf.stored_cnf = discovery.bundle.cnf_bytes + b"c crossed readback\n"
    with pytest.raises(FGammaPiqdAdapterError, match="failed closed"):
        _run(discovery, tmp_path / "cnf")


def test_noncanonical_receipt_json_is_rejected(tmp_path: Path) -> None:
    api = FakePiqd()
    discovery = _discovery(tmp_path, api)
    assignment = {literal: literal in POSITIVE for literal in range(1, 24)}

    def noncanonical_runner(
        _path: Path, _timeout_seconds: int, _proof_path: Path | None
    ) -> StaticSolverResult:
        return StaticSolverResult(
            verdict="SAT",
            assignment=assignment,
            returncode=10,
            stdout=json.dumps({"crossed": True}, indent=2) + "\n",
        )

    crossed = FGammaPiqdBaseDiscovery(
        runner=noncanonical_runner,
        bundle=discovery.bundle,
        attempt_root=discovery.attempt_root,
    )

    with pytest.raises(FGammaPiqdAdapterError, match="not a canonical JSON object"):
        _run(crossed, tmp_path)


@pytest.mark.parametrize(
    "name",
    [
        "variable-map.json",
        "adapter-descriptor.json",
        "source-manifest.json",
        "producer-manifest.json",
        "source-00-encoding.py",
        "base.cnf",
    ],
)
def test_local_map_cnf_source_and_manifest_tampering_is_rejected(
    tmp_path: Path, name: str
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    target = discovery.bundle.directory / name
    target.write_bytes(target.read_bytes() + b" ")

    with pytest.raises(FGammaPiqdAdapterError, match="custody bundle changed"):
        _run(discovery, tmp_path)


def test_crossed_query_symlink_is_rejected(tmp_path: Path) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    query_dir = tmp_path / "query"
    query_dir.mkdir()
    outside = tmp_path / "outside.cnf"
    outside.write_bytes(discovery.bundle.cnf_bytes)
    (query_dir / "base.cnf").symlink_to(outside)

    with pytest.raises(FGammaPiqdAdapterError, match="cannot safely open"):
        discovery(FGammaInstance(), query_dir / "base.cnf", 7)


@pytest.mark.parametrize("link_kind", ["symlink", "hardlink"])
def test_custody_links_are_rejected(tmp_path: Path, link_kind: str) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    target = discovery.bundle.variable_map_path
    outside = tmp_path / "outside-map.json"
    outside.write_bytes(target.read_bytes())
    target.unlink()
    if link_kind == "symlink":
        target.symlink_to(outside)
    else:
        os.link(outside, target)

    with pytest.raises(FGammaPiqdAdapterError):
        _run(discovery, tmp_path)


def test_during_run_custody_substitution_is_rejected(tmp_path: Path) -> None:
    api = FakePiqd()
    discovery = _discovery(tmp_path, api)
    target = discovery.bundle.descriptor_path
    fired = False

    def substitute(method: str, path: str) -> None:
        nonlocal fired
        if not fired and method == "POST" and path == "/jobs/prepare-cnf":
            fired = True
            replacement = target.with_suffix(".replacement")
            replacement.write_bytes(target.read_bytes())
            os.replace(replacement, target)

    api.hook = substitute
    with pytest.raises(FGammaPiqdAdapterError, match="custody bundle identity changed"):
        _run(discovery, tmp_path)


def test_restart_reuses_create_once_input_bundle(tmp_path: Path) -> None:
    api1 = FakePiqd()
    first = _discovery(tmp_path, api1)
    before = {
        path.name: (path.stat().st_ino, path.stat().st_mtime_ns)
        for path in first.bundle.directory.iterdir()
    }

    api2 = FakePiqd()
    second = _discovery(tmp_path, api2)

    assert second.bundle.directory == first.bundle.directory
    assert before == {
        path.name: (path.stat().st_ino, path.stat().st_mtime_ns)
        for path in second.bundle.directory.iterdir()
    }
    assert _run(second, tmp_path).verdict == "SAT"


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("attempt", True),
        ("attempt", 0.0),
        ("journal_record_count", False),
        ("terminal_status_raw_size", 1.0),
        ("endpoint_trace", {}),
        ("terminal_status", []),
        ("claims", []),
        ("job_identity", []),
    ],
)
def test_resigned_receipt_rejects_builtin_type_holes(
    tmp_path: Path, field: str, value: object
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, _attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt = json.loads(observed.stdout)
    receipt[field] = value
    _resign(receipt, "receipt_sha256")
    crossed = StaticSolverResult(
        verdict="SAT",
        assignment=observed.assignment,
        returncode=10,
        stdout=(canonical_json_bytes(receipt) + b"\n").decode(),
    )
    with pytest.raises(FGammaPiqdAdapterError):
        _run(_replay_discovery(discovery, crossed), tmp_path)


def test_resigned_receipt_rejects_extra_key_and_crossed_endpoint(
    tmp_path: Path,
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, _attempt_dir = _captured_static_result(discovery, tmp_path)
    for mutation in ("extra", "endpoint"):
        receipt = json.loads(observed.stdout)
        if mutation == "extra":
            receipt["extra"] = False
        else:
            receipt["endpoint_trace"][-1]["target"] = (
                "/jobs/crossed/log?from=0&max=1048576"
            )
        _resign(receipt, "receipt_sha256")
        crossed = StaticSolverResult(
            verdict="SAT",
            assignment=observed.assignment,
            returncode=10,
            stdout=(canonical_json_bytes(receipt) + b"\n").decode(),
        )
        with pytest.raises(FGammaPiqdAdapterError):
            _run(_replay_discovery(discovery, crossed), tmp_path)


def test_deep_and_oversized_receipts_fail_closed(tmp_path: Path) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    assignment = {variable: variable in POSITIVE for variable in range(1, 24)}
    deep_stdout = '{"x":' + "[" * 40 + "0" + "]" * 40 + "}\n"
    oversized_stdout = '{"x":"' + "a" * (1024 * 1024) + '"}\n'
    for stdout in (deep_stdout, oversized_stdout):
        crossed = StaticSolverResult(
            verdict="SAT", assignment=assignment, returncode=10, stdout=stdout
        )
        with pytest.raises(FGammaPiqdAdapterError):
            _run(_replay_discovery(discovery, crossed), tmp_path)


def test_assignment_mapping_subclass_is_rejected(tmp_path: Path) -> None:
    class AssignmentSubclass(dict[int, bool]):
        pass

    discovery = _discovery(tmp_path, FakePiqd())
    observed, _attempt_dir = _captured_static_result(discovery, tmp_path)
    crossed = StaticSolverResult(
        verdict="SAT",
        assignment=AssignmentSubclass(observed.assignment),
        returncode=10,
        stdout=observed.stdout,
    )
    with pytest.raises(
        FGammaPiqdAdapterError, match="assignment container is malformed"
    ):
        _run(_replay_discovery(discovery, crossed), tmp_path)


def test_injected_runner_object_and_result_subclass_are_rejected(
    tmp_path: Path,
) -> None:
    class ResultSubclass(StaticSolverResult):
        pass

    discovery = _discovery(tmp_path, FakePiqd())
    observed, _attempt_dir = _captured_static_result(discovery, tmp_path)
    values: tuple[object, ...] = (
        object(),
        ResultSubclass(
            verdict=observed.verdict,
            assignment=observed.assignment,
            returncode=observed.returncode,
            stdout=observed.stdout,
            stderr=observed.stderr,
        ),
    )
    for value in values:
        crossed = FGammaPiqdBaseDiscovery(
            runner=lambda _path, _timeout, _proof, value=value: value,  # type: ignore[arg-type,return-value]
            bundle=discovery.bundle,
            attempt_root=discovery.attempt_root,
        )
        with pytest.raises(FGammaPiqdAdapterError, match="non-exact"):
            _run(crossed, tmp_path)


def test_injected_runner_exception_is_normalized(tmp_path: Path) -> None:
    class UnexpectedRunnerError(Exception):
        pass

    def raise_unexpected(_path: Path, _timeout: int, _proof: Path | None) -> object:
        raise UnexpectedRunnerError("untrusted runner detail")

    discovery = _discovery(tmp_path, FakePiqd())
    crossed = FGammaPiqdBaseDiscovery(
        runner=raise_unexpected,  # type: ignore[arg-type]
        bundle=discovery.bundle,
        attempt_root=discovery.attempt_root,
    )
    with pytest.raises(
        FGammaPiqdAdapterError, match="runner raised an unexpected exception"
    ) as caught:
        _run(crossed, tmp_path)
    assert type(caught.value.__cause__) is UnexpectedRunnerError


@pytest.mark.parametrize(
    "overrides",
    [
        {"verdict": 10},
        {"verdict": "CROSSED"},
        {"assignment": []},
        {"returncode": True},
        {"returncode": 10.0},
        {"stdout": b""},
        {"stderr": None},
    ],
)
def test_exact_result_with_malformed_fields_is_normalized(
    tmp_path: Path, overrides: dict[str, object]
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, _attempt_dir = _captured_static_result(discovery, tmp_path)
    fields: dict[str, object] = {
        "verdict": observed.verdict,
        "assignment": observed.assignment,
        "returncode": observed.returncode,
        "stdout": observed.stdout,
        "stderr": observed.stderr,
        **overrides,
    }
    crossed_result = StaticSolverResult(**fields)  # type: ignore[arg-type]
    crossed = FGammaPiqdBaseDiscovery(
        runner=lambda _path, _timeout, _proof: crossed_result,
        bundle=discovery.bundle,
        attempt_root=discovery.attempt_root,
    )
    with pytest.raises(FGammaPiqdAdapterError, match="malformed"):
        _run(crossed, tmp_path)


def test_resigned_terminal_status_substitution_is_rejected(tmp_path: Path) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt = json.loads(observed.stdout)
    receipt["terminal_status"]["id"] = "crossed-job"
    stdout = _rewrite_receipt_and_custody(attempt_dir, receipt)
    crossed = StaticSolverResult(
        verdict="SAT", assignment=observed.assignment, returncode=10, stdout=stdout
    )
    with pytest.raises(FGammaPiqdAdapterError, match="terminal_status.id"):
        _run(_replay_discovery(discovery, crossed), tmp_path)


def test_rehashed_model_journal_seal_substitution_is_rejected(tmp_path: Path) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt = json.loads(observed.stdout)
    crossed_model = {
        "job_id": receipt["job_id"],
        "result": "SAT",
        "num_assigned": 23,
        "assignment": [
            -literal if abs(literal) == 14 else literal for literal in TOTAL_MODEL
        ],
    }
    new_model_hash, custody = _replace_artifact(
        attempt_dir,
        receipt["model_response_sha256"],
        canonical_json_bytes(crossed_model),
    )
    records = [
        json.loads(line)
        for line in (attempt_dir / "attempt.jsonl").read_bytes().splitlines()
    ]
    records[-1]["artifacts"]["model_sha256"] = new_model_hash
    receipt["model_response_sha256"] = new_model_hash
    stdout = _rewrite_journal_driver_receipt_custody(
        attempt_dir, receipt, custody, records
    )
    crossed = StaticSolverResult(
        verdict="SAT", assignment=observed.assignment, returncode=10, stdout=stdout
    )
    with pytest.raises(FGammaPiqdAdapterError, match="crossed runner assignment"):
        _run(_replay_discovery(discovery, crossed), tmp_path)


def test_rehashed_terminal_event_and_driver_seal_substitution_is_rejected(
    tmp_path: Path,
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt = json.loads(observed.stdout)
    records = [
        json.loads(line)
        for line in (attempt_dir / "attempt.jsonl").read_bytes().splitlines()
    ]
    old_checkpoint = records[-1]["artifacts"]["checkpoint_sha256"]
    event = json.loads(
        (attempt_dir / "attempt.jsonl.artifacts" / old_checkpoint).read_bytes()
    )
    event["job_id"] = "crossed-job"
    new_checkpoint, custody = _replace_artifact(
        attempt_dir, old_checkpoint, canonical_json_bytes(event)
    )
    records[-1]["artifacts"]["checkpoint_sha256"] = new_checkpoint
    stdout = _rewrite_journal_driver_receipt_custody(
        attempt_dir, receipt, custody, records
    )
    crossed = StaticSolverResult(
        verdict="SAT", assignment=observed.assignment, returncode=10, stdout=stdout
    )
    with pytest.raises(FGammaPiqdAdapterError, match="terminal event job_id"):
        _run(_replay_discovery(discovery, crossed), tmp_path)


def test_receipt_inode_and_resigned_custody_crossing_are_rejected(
    tmp_path: Path,
) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt_path = attempt_dir / "solver-receipt.json"
    replacement = receipt_path.with_suffix(".replacement")
    replacement.write_bytes(receipt_path.read_bytes())
    os.replace(replacement, receipt_path)
    with pytest.raises(FGammaPiqdAdapterError, match="receipt_inode"):
        _run(_replay_discovery(discovery, observed), tmp_path)

    # A self-consistent custody-seal hash still cannot cross the exact retry policy.
    custody_path = attempt_dir / "custody-seal.json"
    custody = json.loads(custody_path.read_bytes())
    custody["receipt_device"] = receipt_path.stat().st_dev
    custody["receipt_inode"] = receipt_path.stat().st_ino
    custody["retry_policy"] = "CROSSED_POLICY"
    _resign(custody, "custody_seal_sha256")
    custody_path.write_bytes(canonical_json_bytes(custody) + b"\n")
    with pytest.raises(FGammaPiqdAdapterError, match="retry_policy"):
        _run(_replay_discovery(discovery, observed), tmp_path)


@pytest.mark.parametrize("link_kind", ["symlink", "hardlink"])
def test_attempt_artifact_links_are_rejected(tmp_path: Path, link_kind: str) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    observed, attempt_dir = _captured_static_result(discovery, tmp_path)
    receipt = json.loads(observed.stdout)
    target = attempt_dir / "attempt.jsonl.artifacts" / receipt["model_response_sha256"]
    outside = tmp_path / "outside-model.json"
    outside.write_bytes(target.read_bytes())
    target.unlink()
    if link_kind == "symlink":
        target.symlink_to(outside)
    else:
        os.link(outside, target)
    with pytest.raises(FGammaPiqdAdapterError):
        _run(_replay_discovery(discovery, observed), tmp_path)


def test_run_smoke_injects_only_base_and_keeps_local_drat_gates(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    base_calls: list[Path] = []
    local_calls: list[tuple[Path, Path | None, object]] = []

    def base_discovery(
        instance: FGammaInstance, path: Path, timeout_seconds: int
    ) -> CadicalResult:
        assert timeout_seconds == 11
        base_calls.append(path)
        return CadicalResult(
            verdict="SAT",
            cube=instance.decode_model(POSITIVE),
            returncode=10,
            proof_verified=False,
            stdout_tail="piqd",
            positive_variables=POSITIVE,
        )

    def local_solver(
        _instance: FGammaInstance,
        cnf_path: Path,
        *,
        extra_clauses: object = (),
        timeout_seconds: int,
        proof_path: Path | None = None,
    ) -> CadicalResult:
        assert timeout_seconds == 11
        local_calls.append((cnf_path, proof_path, extra_clauses))
        return CadicalResult(
            verdict="UNSAT",
            cube=None,
            returncode=20,
            proof_verified=True,
            stdout_tail="local drat",
            positive_variables=None,
        )

    monkeypatch.setattr(encoding.shutil, "which", lambda _command: "/tool")
    monkeypatch.setattr(encoding, "solve_cadical", local_solver)

    result = encoding.run_smoke(
        tmp_path, timeout_seconds=11, base_discovery=base_discovery
    )

    assert result["base"].verdict == "SAT"
    assert base_calls == [tmp_path / "f_gamma_base.cnf"]
    assert len(local_calls) == 2
    assert all(proof_path is not None for _path, proof_path, _clauses in local_calls)
    assert all(clauses for _path, _proof_path, clauses in local_calls)


def test_injected_base_does_not_preflight_local_tools(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    def unavailable(_command: str) -> None:
        return None

    def fail_base(
        _instance: FGammaInstance, _path: Path, _timeout_seconds: int
    ) -> CadicalResult:
        raise EncodingError("PIQD unavailable")

    monkeypatch.setattr(encoding.shutil, "which", unavailable)
    with pytest.raises(EncodingError, match="PIQD unavailable"):
        encoding.run_smoke(tmp_path, base_discovery=fail_base)


def test_descriptor_claims_and_project_are_explicit(tmp_path: Path) -> None:
    discovery = _discovery(tmp_path, FakePiqd())
    descriptor = json.loads(discovery.bundle.descriptor_bytes)

    assert PIQD_PROJECT == "erdos-97-96-formalization/f-gamma-base"
    assert descriptor["claims"] == {
        "aggregate_claim": False,
        "counterexample_claim": False,
        "independent_third_party_readback": False,
        "lean_closure": False,
        "source_entitlement": False,
        "theorem_claim": False,
        "theorem_coverage": False,
        "universal_claim": False,
        "universal_lift": False,
    }
