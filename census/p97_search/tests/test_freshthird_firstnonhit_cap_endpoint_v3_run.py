from __future__ import annotations

import json
from collections.abc import Callable
from functools import cache
from pathlib import Path

import pytest

import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3 as emitter
import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3_run as runner


def _process(
    name: str,
    command: list[str],
    returncode: int,
    stdout: bytes,
) -> runner.ProcessResult:
    return runner.ProcessResult(
        name=name,
        command=tuple(command),
        status="COMPLETED",
        returncode=returncode,
        elapsed_ms=1,
        stdout=stdout,
        stderr=b"",
    )


def test_dry_run_has_no_process_call(monkeypatch: pytest.MonkeyPatch) -> None:
    bundle = emitter.Bundle(b"", b"", b"", b"")
    monkeypatch.setattr(runner.emitter, "emit_bundle", lambda n: bundle)
    monkeypatch.setattr(
        runner.emitter,
        "validate_bundle",
        lambda value: {
            "variables": 93075,
            "clauses": 445258,
            "cnf_sha256": runner.INDEPENDENT_AUDIT["cnf_sha256_reproduced"],
            "predecessor": {},
            "clause_delta": {},
        },
    )
    monkeypatch.setattr(runner, "_predecessor_model_control", dict)
    monkeypatch.setattr(
        runner,
        "_run_process",
        lambda *args, **kwargs: pytest.fail("dry-run called a process"),
    )

    result = runner.dry_run(None, 60, False)

    assert result["mode"] == "DRY_RUN"
    assert result["launch"] is False
    assert result["solver_calls"] == 0
    assert result["source_total"] is False
    assert result["all_emitted_hard_clauses_source_mapped"] is True
    assert result["independent_audit"]["status"] == "APPROVED"
    assert result["no_cegar_successor"] is True
    assert result["theorem_bank_search"] is False


def test_checkpoint_leaves_proposed_root_unregistered() -> None:
    relative = f"{runner.RUN_PREFIX}n17-one-shot-audit-approved"
    assert runner._registration_status(relative) is False
    assert runner._registration_status(f"{runner.RUN_PREFIX}different-run") is False


@pytest.mark.parametrize(
    ("returncode", "expected"),
    [(10, "SAT"), (20, "UNSAT"), (0, "UNKNOWN"), (None, "UNKNOWN"), (1, "ERROR")],
)
def test_cadical_exit_code_classification(
    returncode: int | None, expected: str
) -> None:
    assert runner._classify_cadical(returncode) == expected


def test_complete_model_parser_and_malformed_controls() -> None:
    assert runner.parse_complete_model(b"s SATISFIABLE\nv 1 -2 3 0\n", 3) == {
        1: True,
        2: False,
        3: True,
    }
    with pytest.raises(runner.RunnerError, match="incomplete"):
        runner.parse_complete_model(b"v 1 -2 0\n", 3)
    with pytest.raises(runner.RunnerError, match="conflicting"):
        runner.parse_complete_model(b"v 1 -1 0\n", 1)
    with pytest.raises(runner.RunnerError, match="out of range"):
        runner.parse_complete_model(b"v 2 0\n", 1)
    with pytest.raises(runner.RunnerError, match="malformed model token"):
        runner.parse_complete_model(b"v nope 0\n", 1)


def test_smoke_gate_runs_sat_then_checked_unsat(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    calls: list[str] = []

    def fake_run(
        name: str, command: list[str], timeout_seconds: int
    ) -> runner.ProcessResult:
        assert timeout_seconds > 0
        calls.append(name)
        if name == "smoke-sat":
            return _process(name, command, 10, b"s SATISFIABLE\nv 1 0\n")
        if name == "smoke-unsat":
            Path(command[-1]).write_bytes(b"drat-proof")
            return _process(name, command, 20, b"s UNSATISFIABLE\n")
        if name == "smoke-unsat-drat-trim":
            return _process(name, command, 0, b"s VERIFIED\n")
        raise AssertionError(name)

    monkeypatch.setattr(runner, "_run_process", fake_run)
    identities = {
        "cadical": {"path": "/fake/cadical"},
        "drat": {"path": "/fake/drat-trim"},
    }

    receipts = runner._run_smokes(
        tmp_path, identities["cadical"], identities["drat"]
    )

    assert calls == ["smoke-sat", "smoke-unsat", "smoke-unsat-drat-trim"]
    assert len(receipts) == 3
    assert (tmp_path / "smoke-unsat.drat").read_bytes() == b"drat-proof"
    assert not (tmp_path / ".smoke-unsat.drat.inprogress").exists()


@pytest.mark.parametrize("verdict", ["SAT", "UNSAT", "ERROR"])
def test_run_once_has_one_production_call_and_terminal_validation(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, verdict: str
) -> None:
    root = tmp_path / "fresh-run"
    bundle = emitter.Bundle(b"cnf", b"map", b"sources", b"manifest")
    manifest = {
        "variables": 93075,
        "clauses": 445258,
        "cnf_sha256": runner.INDEPENDENT_AUDIT["cnf_sha256_reproduced"],
        "manifest_sha256": "encoding-manifest",
        "source_total": False,
        "predecessor": {},
        "clause_delta": {},
    }
    calls: list[str] = []
    model_checks: list[bool] = []
    proof_checks: list[bool] = []
    monkeypatch.setattr(
        runner, "_normalize_run_root", lambda path: (root, f"{runner.RUN_PREFIX}fresh-run")
    )
    monkeypatch.setattr(runner, "_registration_status", lambda relative: True)
    monkeypatch.setattr(runner.emitter, "emit_bundle", lambda n: bundle)
    monkeypatch.setattr(runner.emitter, "validate_bundle", lambda value: manifest)
    monkeypatch.setattr(
        runner,
        "_binary_identity",
        lambda name, required: {"path": f"/fake/{name}"} if required else None,
    )
    monkeypatch.setattr(
        runner,
        "_initial_manifest",
        lambda *args: runner._self_hashed(
            {
                "schema": runner.RUN_SCHEMA,
                "status": "RUNNING",
                "source_total": False,
                "all_emitted_hard_clauses_source_mapped": True,
                "independent_audit": runner.INDEPENDENT_AUDIT,
                "source_hashes": {},
                "binaries": {},
            },
            "run_manifest_sha256",
        ),
    )
    monkeypatch.setattr(runner, "_write_bundle", lambda *args: None)
    monkeypatch.setattr(runner, "_record_binary_versions", lambda *args: ([], {}))
    monkeypatch.setattr(runner, "_run_smokes", lambda *args: [])

    def fake_process(
        name: str, command: list[str], timeout_seconds: int
    ) -> runner.ProcessResult:
        assert (root / "run-manifest.json").is_file()
        calls.append(name)
        returncode = {"SAT": 10, "UNSAT": 20, "ERROR": 1}[verdict]
        return _process(name, command, returncode, b"model")

    monkeypatch.setattr(runner, "_run_process", fake_process)
    monkeypatch.setattr(runner, "_record_process", lambda *args: {})
    monkeypatch.setattr(
        runner,
        "validate_model",
        lambda *args: model_checks.append(True) or {"checked": True},
    )
    monkeypatch.setattr(
        runner,
        "_check_drat",
        lambda *args: (
            proof_checks.append(True) or {},
            {"checked": True},
        ),
    )
    monkeypatch.setattr(
        runner,
        "_terminal_receipt",
        lambda root, manifest_hash, status, result, processes: {
            "status": status,
            "result": result,
        },
    )

    result = runner.run_once(root, timeout_seconds=60, cross_check=False)

    assert result["status"] == verdict
    assert result["result"]["verdict"] == verdict
    assert calls == ["production-cadical"]
    assert model_checks == ([True] if verdict == "SAT" else [])
    assert proof_checks == ([True] if verdict == "UNSAT" else [])


@pytest.mark.parametrize(
    ("failure_stage", "expected_processes"),
    [
        ("version", {"cadical-version"}),
        ("smoke", {"cadical-version", "smoke-sat"}),
        (
            "drat",
            {
                "cadical-version",
                "smoke-sat",
                "smoke-unsat",
                "smoke-unsat-drat-trim",
            },
        ),
    ],
)
def test_partial_helper_failure_captures_all_processes_and_reenters_zero_call(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    failure_stage: str,
    expected_processes: set[str],
) -> None:
    root = tmp_path / f"failed-{failure_stage}"
    bundle = _terminal_bundle()
    monkeypatch.setattr(
        runner,
        "_normalize_run_root",
        lambda path: (root, f"{runner.RUN_PREFIX}failed-{failure_stage}"),
    )
    monkeypatch.setattr(runner, "_registration_status", lambda relative: True)
    monkeypatch.setattr(runner.emitter, "emit_bundle", lambda n: bundle)

    def fake_process(
        name: str, command: list[str], timeout_seconds: int
    ) -> runner.ProcessResult:
        assert timeout_seconds > 0
        if name == "cadical-version":
            if failure_stage == "version":
                return _process(name, command, 1, b"")
            return _process(name, command, 0, b"cadical-test\n")
        if name == "smoke-sat":
            if failure_stage == "smoke":
                return _process(name, command, 1, b"s UNKNOWN\n")
            return _process(name, command, 10, b"s SATISFIABLE\nv 1 0\n")
        if name == "smoke-unsat":
            Path(command[-1]).write_bytes(b"drat-proof")
            return _process(name, command, 20, b"s UNSATISFIABLE\n")
        if name == "smoke-unsat-drat-trim":
            assert failure_stage == "drat"
            return _process(name, command, 1, b"s NOT VERIFIED\n")
        raise AssertionError(name)

    monkeypatch.setattr(runner, "_run_process", fake_process)
    with pytest.raises(runner.RunnerError):
        runner.run_once(root, timeout_seconds=60, cross_check=False)

    receipt = json.loads((root / "terminal-receipt.json").read_bytes())
    assert type(receipt) is dict
    processes = receipt["processes"]
    assert type(processes) is list
    assert {row["name"] for row in processes} == expected_processes
    monkeypatch.setattr(
        runner,
        "_run_process",
        lambda *args, **kwargs: pytest.fail("FAILED terminal reentry called a process"),
    )
    reentry = runner.terminal_reentry(root)
    assert reentry["status"] == "FAILED"
    assert reentry["solver_calls"] == 0


def test_process_receipt_write_failure_quarantines_unpaired_streams(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    original_write = runner._write_new

    def fail_receipt(path: Path, data: bytes) -> None:
        if path.name == "unit-process.process.json":
            raise runner.RunnerError("injected receipt write failure")
        original_write(path, data)

    monkeypatch.setattr(runner, "_write_new", fail_receipt)
    process = _process("unit-process", ["/fake/process"], 0, b"stdout")
    with pytest.raises(runner.RunnerError, match="injected receipt write failure"):
        runner._record_process(tmp_path, process)
    assert not (tmp_path / "unit-process.stdout").exists()
    assert not (tmp_path / "unit-process.stderr").exists()
    assert (tmp_path / "partial-unreceipted-unit-process.stdout").is_file()
    assert (tmp_path / "partial-unreceipted-unit-process.stderr").is_file()
    assert runner._recorded_process_summaries(tmp_path) == []


def test_process_reconstruction_rejects_orphan_stream(tmp_path: Path) -> None:
    (tmp_path / "orphan.stdout").write_bytes(b"orphan")
    with pytest.raises(runner.RunnerError, match="not receipt-paired"):
        runner._recorded_process_summaries(tmp_path)


def _synthetic_model_bundle(
    *, clause_control: bool = True
) -> tuple[emitter.Bundle, bytes, int]:
    n = 4
    variables: list[dict[str, object]] = []
    values: dict[int, bool] = {}

    def add(role: str, value: bool) -> int:
        identifier = len(variables) + 1
        variables.append({"id": identifier, "role": role})
        values[identifier] = value
        return identifier

    for source in range(n):
        for center in range(n):
            add(f"blocker/{source}/{center}", center == (source + 1) % n)
    for role in emitter.ROLES:
        for index in range(n):
            add(f"role/{role}/{index}", index == 0)
    for source in range(n):
        for x in range(n):
            add(f"row/{source}/{x}", True)
    cap_values = iter([True] * 7 + [False] * 5)
    for x in range(n):
        for cap in range(3):
            add(f"cap/{x}/{cap}", next(cap_values))
    for x in range(n):
        add(f"escape/support/{x}", True)
    for x in range(n):
        add(f"escape/witness/{x}", x == 0)
    for x in range(n):
        add(f"named_row/{emitter.Q1}/{x}", x < 2)
    for arm in ("same", "omission"):
        add(f"first_interaction/{arm}", arm == "same")
    for arm in ("same", "omission", "different_cap", "same_cap"):
        add(f"second_interaction/{arm}", arm == "same")
    add("hingress/retained", False)
    add("hingress/common_payload_free", True)
    control = add("model/control", clause_control)
    clauses = [
        {
            "id": 1,
            "family": "encoding_logic",
            "role": "model/control/clause",
            "literals": [control],
        }
    ]
    mapping = json.dumps(
        {"variables": variables, "clauses": clauses},
        sort_keys=True,
        separators=(",", ":"),
    ).encode()
    literals = [str(identifier if value else -identifier) for identifier, value in values.items()]
    stdout = ("v " + " ".join(literals) + " 0\n").encode()
    return emitter.Bundle(b"", mapping, b"", b""), stdout, len(variables)


def test_model_validator_checks_all_clauses_and_semantic_readback(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    bundle, stdout, count = _synthetic_model_bundle()
    monkeypatch.setattr(
        runner.emitter,
        "validate_bundle",
        lambda value: {"variables": count, "n": 4},
    )

    summary = runner.validate_model(bundle, stdout)

    assert summary["all_emitted_clauses_satisfied"] is True
    assert summary["row_cards"] == [4, 4, 4, 4]
    assert summary["cap_sum"] == 7
    assert summary["escape_q_overlap"] == 2
    assert summary["source_total"] is False


def test_model_validator_rejects_falsified_clause(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    bundle, stdout, count = _synthetic_model_bundle(clause_control=False)
    monkeypatch.setattr(
        runner.emitter,
        "validate_bundle",
        lambda value: {"variables": count, "n": 4},
    )
    with pytest.raises(runner.RunnerError, match="falsifies clause"):
        runner.validate_model(bundle, stdout)


@cache
def _terminal_bundle() -> emitter.Bundle:
    return emitter.emit_bundle(17)


def _make_terminal_root(root: Path) -> None:
    root.mkdir()
    source_paths = {
        "encoder": Path(emitter.__file__).resolve(),
        "predecessor_encoder": Path(runner.predecessor_emitter.__file__).resolve(),
        "runner": Path(runner.__file__).resolve(),
        "checkpoint": runner._repo_root() / runner.CHECKPOINT_RELATIVE,
    }
    source_hashes = {}
    for name, path in source_paths.items():
        data = path.read_bytes()
        source_hashes[name] = {
            "path": str(path.relative_to(runner._repo_root())),
            "sha256": runner._sha256(data),
            "size": len(data),
        }
    bundle = _terminal_bundle()
    encoding_manifest = emitter.validate_bundle(bundle)
    binaries = {
        "cadical": runner._binary_identity("cadical", required=True),
        "drat_trim": runner._binary_identity("drat-trim", required=True),
        "kissat": None,
    }
    manifest = runner._self_hashed(
        {
            "schema": runner.RUN_SCHEMA,
            "status": "RUNNING",
            "n": runner.PRODUCTION_N,
            "source_total": False,
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": runner.INDEPENDENT_AUDIT,
            "query_is_separate_assumption": True,
            "exactly_one_production_wave": True,
            "no_cegar_successor": True,
            "theorem_bank_search_planned": False,
            "encoding": runner._encoding_summary(encoding_manifest),
            "predecessor_model_control": runner._predecessor_model_control(),
            "source_hashes": source_hashes,
            "binaries": binaries,
        },
        "run_manifest_sha256",
    )
    manifest_data = runner._canonical_json(manifest)
    runner._write_new(root / "run-manifest.json", manifest_data)
    runner._write_new(root / "problem.cnf", bundle.cnf)
    runner._write_new(root / "problem.map.json", bundle.variable_map)
    runner._write_new(root / "problem.sources.json", bundle.sources)
    runner._write_new(root / "problem.manifest.json", bundle.manifest)
    runner._write_new(root / "artifact", b"immutable\n")
    runner._terminal_receipt(
        root,
        runner._sha256(manifest_data),
        "FAILED",
        {"verdict": None, "reason": "synthetic terminal fixture"},
        [],
    )


def test_terminal_reentry_makes_zero_process_calls(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    monkeypatch.setattr(
        runner,
        "_run_process",
        lambda *args, **kwargs: pytest.fail("terminal reentry called a process"),
    )

    result = runner.terminal_reentry(root)

    assert result["status"] == "FAILED"
    assert result["terminal_reentry"] is True
    assert result["solver_calls"] == 0


def test_run_once_terminal_reentry_precedes_binary_discovery(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    monkeypatch.setattr(
        runner,
        "_normalize_run_root",
        lambda path: (root, f"{runner.RUN_PREFIX}registered-run"),
    )
    monkeypatch.setattr(runner, "_registration_status", lambda relative: True)
    monkeypatch.setattr(
        runner,
        "_binary_identity",
        lambda *args, **kwargs: pytest.fail("reentry discovered a binary"),
    )

    result = runner.run_once(root, timeout_seconds=60, cross_check=False)

    assert result["solver_calls"] == 0


def test_terminal_reentry_rejects_mutated_artifact(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    (root / "artifact").write_bytes(b"mutated\n")
    with pytest.raises(runner.RunnerError, match="inventory"):
        runner.terminal_reentry(root)


def _rebind_terminal_manifest(
    root: Path, mutate: Callable[[dict[str, object]], None]
) -> None:
    manifest = json.loads((root / "run-manifest.json").read_bytes())
    assert type(manifest) is dict
    mutate(manifest)
    manifest.pop("run_manifest_sha256")
    rebound = runner._self_hashed(manifest, "run_manifest_sha256")
    manifest_data = runner._canonical_json(rebound)
    (root / "run-manifest.json").write_bytes(manifest_data)
    receipt = json.loads((root / "terminal-receipt.json").read_bytes())
    assert type(receipt) is dict
    (root / "terminal-receipt.json").unlink()
    runner._terminal_receipt(
        root,
        runner._sha256(manifest_data),
        receipt["status"],
        receipt["result"],
        receipt["processes"],
    )


def test_terminal_reentry_rejects_rebound_encoding_metadata(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)

    def mutate(manifest: dict[str, object]) -> None:
        encoding = manifest["encoding"]
        assert type(encoding) is dict
        encoding["clauses"] = 445257

    _rebind_terminal_manifest(root, mutate)
    with pytest.raises(runner.RunnerError, match="encoding metadata"):
        runner.terminal_reentry(root)


def test_terminal_reentry_rejects_relabelled_executable_source(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)

    def mutate(manifest: dict[str, object]) -> None:
        sources = manifest["source_hashes"]
        assert type(sources) is dict
        sources["encoder"], sources["runner"] = sources["runner"], sources["encoder"]

    _rebind_terminal_manifest(root, mutate)
    with pytest.raises(runner.RunnerError, match="source path is not canonical"):
        runner.terminal_reentry(root)


@pytest.mark.parametrize(
    ("field", "bad_value"),
    [("n", 18), ("theorem_bank_search_planned", True)],
)
def test_terminal_reentry_rejects_rebound_top_level_scope(
    tmp_path: Path, field: str, bad_value: object
) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    _rebind_terminal_manifest(root, lambda manifest: manifest.__setitem__(field, bad_value))
    with pytest.raises(runner.RunnerError, match="boundary mismatch"):
        runner.terminal_reentry(root)


def test_terminal_reentry_rejects_removed_required_binary(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)

    def mutate(manifest: dict[str, object]) -> None:
        binaries = manifest["binaries"]
        assert type(binaries) is dict
        binaries.pop("cadical")

    _rebind_terminal_manifest(root, mutate)
    with pytest.raises(runner.RunnerError, match="binary inventory"):
        runner.terminal_reentry(root)


def test_terminal_reentry_rejects_rebound_failed_receipt_as_sat(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    receipt = json.loads((root / "terminal-receipt.json").read_bytes())
    assert type(receipt) is dict
    receipt["status"] = "SAT"
    receipt.pop("terminal_receipt_sha256")
    rebound = runner._self_hashed(receipt, "terminal_receipt_sha256")
    (root / "terminal-receipt.json").write_bytes(runner._canonical_json(rebound))
    with pytest.raises(runner.RunnerError, match="success process/result evidence"):
        runner.terminal_reentry(root)


@pytest.mark.parametrize(("status", "process_status"), [("UNKNOWN", "TIMEOUT"), ("ERROR", "COMPLETED")])
def test_terminal_reentry_accepts_unknown_and_error_without_process_call(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    status: str,
    process_status: str,
) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    (root / "terminal-receipt.json").unlink()
    process = runner.ProcessResult(
        name="production-cadical",
        command=("/fake/cadical",),
        status=process_status,
        returncode=None if status == "UNKNOWN" else 1,
        elapsed_ms=1,
        stdout=b"",
        stderr=b"timeout" if status == "UNKNOWN" else b"error",
    )
    summary = runner._record_process(root, process)
    manifest_data = (root / "run-manifest.json").read_bytes()
    runner._terminal_receipt(
        root,
        runner._sha256(manifest_data),
        status,
        {"verdict": status, "reason": "production solver was nonterminal or errored"},
        [summary],
    )
    monkeypatch.setattr(
        runner,
        "_run_process",
        lambda *args, **kwargs: pytest.fail("terminal reentry called a process"),
    )
    result = runner.terminal_reentry(root)
    assert result["status"] == status
    assert result["solver_calls"] == 0


def test_terminal_reentry_rejects_unknown_relabel_of_sat_process(tmp_path: Path) -> None:
    root = tmp_path / "terminal"
    _make_terminal_root(root)
    (root / "terminal-receipt.json").unlink()
    summary = runner._record_process(
        root,
        runner.ProcessResult(
            name="production-cadical",
            command=("/fake/cadical",),
            status="COMPLETED",
            returncode=10,
            elapsed_ms=1,
            stdout=b"s SATISFIABLE\n",
            stderr=b"",
        ),
    )
    manifest_data = (root / "run-manifest.json").read_bytes()
    runner._terminal_receipt(
        root,
        runner._sha256(manifest_data),
        "UNKNOWN",
        {"verdict": "UNKNOWN", "reason": "relabelled"},
        [summary],
    )
    with pytest.raises(runner.RunnerError, match="nonterminal solver receipt evidence"):
        runner.terminal_reentry(root)


def test_launch_fails_before_encoding_when_root_is_unregistered(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    monkeypatch.setattr(
        runner,
        "_normalize_run_root",
        lambda path: (tmp_path / "not-created", f"{runner.RUN_PREFIX}not-registered"),
    )
    monkeypatch.setattr(runner, "_registration_status", lambda relative: False)
    monkeypatch.setattr(
        runner.emitter,
        "emit_bundle",
        lambda n: pytest.fail("unregistered launch encoded a formula"),
    )
    with pytest.raises(runner.RunnerError, match="not registered"):
        runner.run_once(tmp_path, timeout_seconds=60, cross_check=False)


def test_process_wrapper_uses_check_false_and_hard_timeout(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    observed: dict[str, object] = {}

    def fake_run(command: list[str], **kwargs: object) -> object:
        observed.update(kwargs)
        return subprocess_result(command)

    def subprocess_result(command: list[str]) -> object:
        class Result:
            returncode = 10
            stdout = b"v 1 0\n"
            stderr = b""

        return Result()

    monkeypatch.setattr(runner.subprocess, "run", fake_run)
    result = runner._run_process("control", ["cadical", "input.cnf"], 7)
    assert result.returncode == 10
    assert observed == {"capture_output": True, "check": False, "timeout": 7}


def test_main_returns_nonzero_for_unknown_terminal(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    monkeypatch.setattr(
        runner,
        "run_once",
        lambda *args, **kwargs: {"status": "UNKNOWN", "solver_calls": 1},
    )
    assert runner.main(["--launch", "--run-root", "unused", "--timeout-seconds", "1"]) == 2
    assert json.loads(capsys.readouterr().out)["status"] == "UNKNOWN"
