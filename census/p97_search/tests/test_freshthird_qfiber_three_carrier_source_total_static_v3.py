from __future__ import annotations

import hashlib
import subprocess
from pathlib import Path
from typing import ClassVar

import pytest

import census.p97_search.freshthird_qfiber_three_carrier_source_total_static_v3 as runner


class _Replay:
    def __init__(self, accepted: bool) -> None:
        self.accepted = accepted
        self.detail = "accepted" if accepted else "source replay rejected"


class _FakeEncoding:
    num_vars = 2
    replay_accepted: ClassVar[bool] = True

    def __init__(self, boundary_index: int) -> None:
        self.boundary_index = boundary_index

    def cnf_bytes(self) -> bytes:
        return f"c boundary {self.boundary_index}\np cnf 2 1\n1 -2 0\n".encode()

    def variable_map(self) -> dict[str, object]:
        return {
            "schema": runner.ENCODING_SCHEMA,
            "boundary_index": self.boundary_index,
            "num_variables": self.num_vars,
            "variables": {"1": ["x"], "2": ["y"]},
        }

    def encoding_manifest(self) -> dict[str, object]:
        variable_map = runner._canonical_json(self.variable_map())
        return {
            "schema": runner.ENCODING_SCHEMA,
            "boundary_index": self.boundary_index,
            "source_theorem": runner.SOURCE_THEOREM,
            "cnf_sha256": hashlib.sha256(self.cnf_bytes()).hexdigest(),
            "variable_map_sha256": hashlib.sha256(variable_map).hexdigest(),
        }

    def validate_source_total_assignment(self, assignment) -> None:
        if assignment != {1: True, 2: False}:
            raise runner.FreshThirdCarrierCnfError("fake assignment rejected")

    def result_from_assignment(self, assignment) -> dict[str, object]:
        return {
            "boundary_index": self.boundary_index,
            "assignment": {str(key): value for key, value in assignment.items()},
        }

    def replay_result(self, result, *, timeout_ms: int) -> _Replay:
        assert result["boundary_index"] == self.boundary_index
        assert timeout_ms == runner.REPLAY_TIMEOUT_MS
        return _Replay(self.replay_accepted)


class _RejectingEncoding(_FakeEncoding):
    replay_accepted = False


@pytest.fixture
def custody(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> tuple[Path, dict[str, object], dict[str, object]]:
    repo = tmp_path / "repo"
    module = repo / runner.PHASE_INGRESS_PATH
    module.parent.mkdir(parents=True)
    module.write_text("theorem phaseIngress : True := by trivial\n")
    module_sha = hashlib.sha256(module.read_bytes()).hexdigest()
    snapshot: dict[str, object] = {
        "schema": runner.SOURCE_SNAPSHOT_SCHEMA,
        "repo_head": "0" * 40,
        "aggregate_sha256": "1" * 64,
        "content_aggregate_sha256": "2" * 64,
        "lean_toolchain_sha256": "3" * 64,
        "inputs": {
            "source_path": runner.DEFAULT_SOURCE,
            "query_path": runner.QUERY_PATH,
            "cnf_adapter_path": runner.SOURCE_TOTAL_PATH,
            "cegar_runner_path": runner.RUNNER_PATH,
            "python_paths": sorted(
                (runner.PREDECESSOR_CNF_PATH, runner.PROVENANCE_PATH)
            ),
            "support_paths": [runner.PHASE_INGRESS_PATH],
        },
        "rows": [
            {
                "kind": "source_support",
                "path": runner.PHASE_INGRESS_PATH,
                "sha256": module_sha,
                "porcelain_status": "",
            }
        ],
    }

    def verify_snapshot(repo_root, expected):
        assert Path(repo_root).resolve() == repo.resolve()
        if expected != snapshot:
            raise runner.SourceTotalStaticError("test source drift")
        return snapshot

    def archive_snapshot(repo_root, expected, destination):
        assert expected == snapshot
        destination.mkdir(parents=True, exist_ok=False)
        archived = []
        for row in snapshot["rows"]:
            if not row["porcelain_status"]:
                continue
            data = (repo / row["path"]).read_bytes()
            archive_path = destination / row["path"]
            archive_path.parent.mkdir(parents=True, exist_ok=True)
            archive_path.write_bytes(data)
            archived.append(
                {
                    "path": row["path"],
                    "sha256": row["sha256"],
                    "porcelain_status": row["porcelain_status"],
                }
            )
        manifest = {
            "schema": f"{runner.SOURCE_SNAPSHOT_SCHEMA}/nonclean-archive/v1",
            "source_aggregate_sha256": snapshot["aggregate_sha256"],
            "archived": archived,
        }
        (destination / "manifest.json").write_bytes(runner._canonical_json(manifest))
        return manifest

    monkeypatch.setattr(runner, "verify_snapshot", verify_snapshot)
    monkeypatch.setattr(runner, "archive_nonclean_snapshot_rows", archive_snapshot)
    monkeypatch.setattr(
        runner, "FreshThirdCarrierSourceTotalCnfEncoding", _FakeEncoding
    )

    receipt: dict[str, object] = {
        "schema": runner.PHASE_INGRESS_RECEIPT_SCHEMA,
        "repo_head": snapshot["repo_head"],
        "source_aggregate_sha256": snapshot["aggregate_sha256"],
        "lean_toolchain_sha256": snapshot["lean_toolchain_sha256"],
        "module_path": runner.PHASE_INGRESS_PATH,
        "module_name": runner.PHASE_INGRESS_MODULE,
        "module_sha256": module_sha,
        "theorem": runner.PHASE_INGRESS_THEOREM,
        "build": {
            "status": "PASSED",
            "exit_code": 0,
            "command": list(runner.PHASE_INGRESS_BUILD_COMMAND),
            "module_sha256": module_sha,
            "lean_toolchain_sha256": snapshot["lean_toolchain_sha256"],
        },
        "axiom_audit": {
            "status": "PASSED",
            "theorem": runner.PHASE_INGRESS_THEOREM,
            "axioms": list(runner.PHASE_INGRESS_AXIOMS),
            "unexpected_axioms": [],
        },
    }
    return repo, snapshot, receipt


def _out(repo: Path, run_id: str) -> Path:
    return repo / "scratch" / "runs" / runner.LANE_ID / run_id


def _sat_solver(calls: list[tuple[tuple[str, ...], int, Path]]):
    def solve(command, timeout, repo_root):
        calls.append((tuple(command), timeout, repo_root))
        return subprocess.CompletedProcess(
            command, 10, b"s SATISFIABLE\nv 1 -2 0\n", b""
        )

    return solve


def test_plan_authenticates_all_four_static_artifact_triples_without_solver_calls(
    custody,
) -> None:
    repo, snapshot, _ = custody
    plan = runner.plan_wave(repo_root=repo, source_snapshot=snapshot)

    assert plan["solver_calls"] == 0
    assert plan["launch_eligible"] is False
    assert plan["boundary_cells"] == [0, 1, 2, 3]
    assert len(plan["cells"]) == 4
    assert plan["source_theorem_source"] == {
        "module_path": runner.QUERY_PATH,
        "module_name": runner.SOURCE_THEOREM_MODULE,
        "theorem": runner.SOURCE_THEOREM_FULL_NAME,
    }
    for index, cell in enumerate(plan["cells"]):
        assert cell["boundary_index"] == index
        assert len(cell["cnf"]["sha256"]) == 64
        assert len(cell["variable_map"]["sha256"]) == 64
        assert len(cell["encoding_manifest"]["sha256"]) == 64
        assert cell["encoding_manifest"]["content"]["source_theorem"] == (
            runner.SOURCE_THEOREM
        )


def test_launch_is_gated_without_explicit_phase_ingress_receipt(custody) -> None:
    repo, snapshot, _ = custody
    output = _out(repo, "missing-receipt")
    with pytest.raises(runner.SourceTotalStaticError, match="explicit built"):
        runner.run_wave(output, source_snapshot=snapshot, repo_root=repo)
    assert not output.exists()


def test_launch_refuses_a_preexisting_empty_root(custody) -> None:
    repo, snapshot, receipt = custody
    output = _out(repo, "preexisting")
    output.mkdir(parents=True)
    with pytest.raises(runner.SourceTotalStaticError, match="pre-existing"):
        runner.run_wave(
            output,
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=_sat_solver([]),
            repo_root=repo,
        )


def test_complete_sat_models_make_four_custodied_calls_and_reenter_without_calls(
    custody,
) -> None:
    repo, snapshot, receipt = custody
    calls: list[tuple[tuple[str, ...], int, Path]] = []
    output = _out(repo, "sat")
    first = runner.run_wave(
        output,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=_sat_solver(calls),
        repo_root=repo,
    )

    assert len(calls) == 4
    assert all(
        timeout == 30 and custody_root == repo for _, timeout, custody_root in calls
    )
    assert first["statuses"] == {str(index): "SAT_ABSTRACTION" for index in range(4)}
    assert first["solver_calls"] == 4
    artifact_paths = {row["path"] for row in first["artifact_inventory"]}
    assert all(
        forbidden not in path
        for path in artifact_paths
        for forbidden in ("step-", "cut", "certificate", "parent")
    )

    second_calls = 0

    def forbidden_solver(command, timeout, repo_root):
        nonlocal second_calls
        second_calls += 1
        raise AssertionError("terminal re-entry called the solver")

    second = runner.run_wave(
        output,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=forbidden_solver,
        repo_root=repo,
    )
    assert second == first
    assert second_calls == 0


def test_sat_replay_rejection_is_conservative_terminal_status(
    custody, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, snapshot, receipt = custody
    monkeypatch.setattr(
        runner, "FreshThirdCarrierSourceTotalCnfEncoding", _RejectingEncoding
    )
    result = runner.run_wave(
        _out(repo, "replay-rejected"),
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=_sat_solver([]),
        repo_root=repo,
    )
    assert result["status"] == "SAT_REPLAY_REJECTED"
    cell = runner._read_canonical_json(
        _out(repo, "replay-rejected") / "cell-0" / "result.json", "result"
    )
    assert cell["semantic_replay"]["accepted"] is False


def test_malformed_sat_model_fails_closed_after_one_solver_call(custody) -> None:
    repo, snapshot, receipt = custody
    calls = 0

    def malformed(command, timeout, repo_root):
        nonlocal calls
        calls += 1
        return subprocess.CompletedProcess(command, 10, b"s SATISFIABLE\nv 1 0\n", b"")

    output = _out(repo, "malformed")
    with pytest.raises(runner.SourceTotalStaticError, match="incomplete"):
        runner.run_wave(
            output,
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=malformed,
            repo_root=repo,
        )
    assert calls == 1
    assert (
        runner._read_canonical_json(output / "manifest.json", "manifest")["run_state"]
        == "RUNNING"
    )


@pytest.mark.parametrize("returncode", (None, True, "10"))
def test_malformed_solver_return_code_fails_closed(
    custody, returncode: object
) -> None:
    repo, snapshot, receipt = custody
    calls = 0

    def malformed(command, timeout, repo_root):
        nonlocal calls
        calls += 1
        return subprocess.CompletedProcess(command, returncode, b"", b"")

    with pytest.raises(runner.SourceTotalStaticError, match="return code"):
        runner.run_wave(
            _out(repo, f"returncode-{returncode!s}"),
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=malformed,
            repo_root=repo,
        )
    assert calls == 1


@pytest.mark.parametrize(
    "artifact", ("input.cnf", "variable-map.json", "encoding-manifest.json")
)
def test_solver_callback_cannot_mutate_custodied_input(custody, artifact: str) -> None:
    repo, snapshot, receipt = custody

    def mutate(command, timeout, repo_root):
        (Path(command[-1]).parent / artifact).write_bytes(b"tampered during callback")
        return subprocess.CompletedProcess(command, 20, b"s UNSATISFIABLE\n", b"")

    with pytest.raises(runner.SourceTotalStaticError, match=f"{artifact} drifted"):
        runner.run_wave(
            _out(repo, f"mutated-{artifact}"),
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=mutate,
            repo_root=repo,
        )


def test_real_solver_wrapper_records_the_process_timeout_grace(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    observed: dict[str, object] = {}

    def timeout_run(command, **kwargs):
        observed.update(kwargs)
        raise subprocess.TimeoutExpired(command, kwargs["timeout"])

    monkeypatch.setattr(runner.subprocess, "run", timeout_run)
    completed = runner._run_solver(("cadical", "input.cnf"), 30, tmp_path)
    assert observed["timeout"] == 30 + runner.PROCESS_TIMEOUT_GRACE_SECONDS
    assert completed.returncode == -1


@pytest.mark.parametrize(
    ("returncode", "stdout", "expected"),
    [
        (20, b"s UNSATISFIABLE\n", "UNSAT_SOURCE_TOTAL_RELAXATION"),
        (0, b"s UNKNOWN\n", "UNKNOWN"),
    ],
)
def test_unsat_and_unknown_statuses_are_exact_and_use_four_calls(
    custody, returncode: int, stdout: bytes, expected: str
) -> None:
    repo, snapshot, receipt = custody
    calls = 0

    def solve(command, timeout, repo_root):
        nonlocal calls
        calls += 1
        return subprocess.CompletedProcess(command, returncode, stdout, b"")

    result = runner.run_wave(
        _out(repo, expected.lower()),
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=solve,
        repo_root=repo,
    )
    assert calls == 4
    assert result["status"] == expected
    assert result["statuses"] == {str(index): expected for index in range(4)}


@pytest.mark.parametrize(
    "relative",
    ("input.cnf", "variable-map.json", "encoding-manifest.json", "result.json"),
)
def test_terminal_reentry_regenerates_and_rejects_tampered_artifacts(
    custody, relative: str
) -> None:
    repo, snapshot, receipt = custody
    output = _out(repo, f"tamper-{relative.replace('.', '-')}")
    runner.run_wave(
        output,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=_sat_solver([]),
        repo_root=repo,
    )
    target = output / "cell-0" / relative
    target.write_bytes(target.read_bytes() + b"tamper")

    with pytest.raises(
        runner.SourceTotalStaticError, match="inventory|drifted|canonical"
    ):
        runner.run_wave(
            output,
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=lambda *_: (_ for _ in ()).throw(
                AssertionError("solver called")
            ),
            repo_root=repo,
        )


def test_source_drift_between_solver_calls_and_postflight_fails_closed(
    custody, monkeypatch: pytest.MonkeyPatch
) -> None:
    repo, snapshot, receipt = custody
    drifted = False

    def verify(repo_root, expected):
        if drifted:
            raise runner.SourceTotalStaticError("deliberate source drift")
        return snapshot

    monkeypatch.setattr(runner, "verify_snapshot", verify)
    calls = 0

    def solve(command, timeout, repo_root):
        nonlocal calls, drifted
        calls += 1
        if calls == 4:
            drifted = True
        return subprocess.CompletedProcess(command, 20, b"s UNSATISFIABLE\n", b"")

    with pytest.raises(runner.SourceTotalStaticError, match="postflight.*drift"):
        runner.run_wave(
            _out(repo, "source-drift"),
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=solve,
            repo_root=repo,
        )
    assert calls == 4


def test_receipt_requires_passed_build_and_axiom_audit(custody) -> None:
    repo, snapshot, receipt = custody
    malformed = dict(receipt)
    malformed["axiom_audit"] = {
        **receipt["axiom_audit"],
        "unexpected_axioms": ["sorryAx"],
    }
    with pytest.raises(runner.SourceTotalStaticError, match="axiom audit"):
        runner.run_wave(
            _out(repo, "bad-receipt"),
            source_snapshot=snapshot,
            phase_ingress_receipt=malformed,
            solver_runner=_sat_solver([]),
            repo_root=repo,
        )


@pytest.mark.parametrize(
    ("field", "value"),
    (
        ("build_command", ["lake", "env", "lean", runner.PHASE_INGRESS_PATH]),
        ("build_exit_code", False),
        ("axioms", [*runner.PHASE_INGRESS_AXIOMS, "sorryAx"]),
    ),
)
def test_receipt_rejects_unbound_commands_and_unapproved_axioms(
    custody, field: str, value: object
) -> None:
    repo, snapshot, receipt = custody
    malformed = dict(receipt)
    if field.startswith("build_"):
        malformed["build"] = {
            **receipt["build"],
            field.removeprefix("build_"): value,
        }
    else:
        malformed["axiom_audit"] = {**receipt["axiom_audit"], "axioms": value}
    with pytest.raises(runner.SourceTotalStaticError, match="build receipt|axiom audit"):
        runner.run_wave(
            _out(repo, f"bad-{field}"),
            source_snapshot=snapshot,
            phase_ingress_receipt=malformed,
            solver_runner=_sat_solver([]),
            repo_root=repo,
        )


def test_nonclean_snapshot_rows_are_archived_and_revalidated(custody) -> None:
    repo, snapshot, receipt = custody
    snapshot["rows"][0]["porcelain_status"] = "?? " + runner.PHASE_INGRESS_PATH
    output = _out(repo, "nonclean-archive")

    result = runner.run_wave(
        output,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=lambda command, timeout, repo_root: subprocess.CompletedProcess(
            command, 20, b"s UNSATISFIABLE\n", b""
        ),
        repo_root=repo,
    )

    assert result["source_archive"]["archived"] == [
        {
            "path": runner.PHASE_INGRESS_PATH,
            "sha256": snapshot["rows"][0]["sha256"],
            "porcelain_status": "?? " + runner.PHASE_INGRESS_PATH,
        }
    ]
    assert (output / "source-nonclean" / runner.PHASE_INGRESS_PATH).is_file()


def test_terminal_reentry_rejects_symlinked_directory_artifacts(custody) -> None:
    repo, snapshot, receipt = custody
    output = _out(repo, "symlink-artifact")
    runner.run_wave(
        output,
        source_snapshot=snapshot,
        phase_ingress_receipt=receipt,
        solver_runner=lambda command, timeout, repo_root: subprocess.CompletedProcess(
            command, 20, b"s UNSATISFIABLE\n", b""
        ),
        repo_root=repo,
    )
    (output / "symlink-directory").symlink_to(repo, target_is_directory=True)
    with pytest.raises(runner.SourceTotalStaticError, match="unsupported output"):
        runner.run_wave(
            output,
            source_snapshot=snapshot,
            phase_ingress_receipt=receipt,
            solver_runner=lambda *_: (_ for _ in ()).throw(
                AssertionError("solver called")
            ),
            repo_root=repo,
        )
