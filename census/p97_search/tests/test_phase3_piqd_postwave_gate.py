from __future__ import annotations

import hashlib
import json
from pathlib import Path
from typing import Any

import pytest

import census.p97_search.phase3_piqd_postwave_gate as postwave_gate
from census.p97_search.phase3_piqd_postwave_gate import (
    LEAN_CORPUS,
    LEGACY_BOOTSTRAP_ORDINAL,
    LEGACY_BOOTSTRAP_RESULTS_SNAPSHOT,
    LEGACY_BOOTSTRAP_ROLES,
    REFINEMENT_STATUS,
    SCHEMA,
    STATUS,
    THEOREM_BANK_PATHS,
    PostwaveGateError,
    canonical_json_bytes,
    load_postwave_authorization,
    load_postwave_lineage,
    load_postwave_receipt,
    validate_postwave_receipt,
    validate_postwave_successor,
    write_postwave_receipt,
)
from census.p97_search.phase3_piqd_theorem_gated_discovery import (
    TheoremGatedDiscoveryError,
    run_authorized_successor,
)


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _write(root: Path, relative: str, data: bytes) -> dict[str, str]:
    path = root / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)
    return {"path": relative, "sha256": _sha(data)}


def _json(root: Path, relative: str, value: Any) -> dict[str, str]:
    return _write(root, relative, json.dumps(value, sort_keys=True).encode())


def _fixture(root: Path, *, no_lift: bool = False) -> dict[str, Any]:
    banks = [
        _write(root, relative, f"bank:{relative}\n".encode())
        for relative in sorted(THEOREM_BANK_PATHS)
    ]
    input_root = _write(root, "artifacts/input.cnf", b"p cnf 3 1\n1 0\n")
    model = _json(root, "artifacts/model.json", {"vars": 3, "model": [1, -2, 3]})
    solve = _json(
        root,
        "artifacts/solve.json",
        {
            "model_literals": 3,
            "session_before": {
                "id": "11111111-1111-4111-8111-111111111111",
                "lane": "sat",
                "state": "live",
                "last_assumption_free": True,
                "clauses": 1,
                "declared_num_vars": 3,
                "max_var": 3,
                "solver_sha256": "a" * 64,
                "solves": 4,
            },
            "solve_response": {"status": "SAT", "solve_index": 5},
        },
    )
    analysis = _json(
        root,
        "artifacts/analysis.json",
        {
            "cnf_assignment_verified": True,
            "piqd_model_total": True,
            "inputs": {
                "cnf_sha256": input_root["sha256"],
                "model_sha256": model["sha256"],
            },
        },
    )
    search = _write(root, "artifacts/search.txt", b"theorem hit one\ntheorem hit two\n")
    legacy_artifacts = {
        "legacy-results-index": _write(
            root,
            LEGACY_BOOTSTRAP_RESULTS_SNAPSHOT,
            b"legacy waves 1 through 48\n",
        ),
        "accumulated-family-receipt": _write(
            root, "artifacts/accumulated.json", b"{}\n"
        ),
        "wave46-search-log": _write(root, "artifacts/wave46.txt", b"wave46\n"),
        "wave47-search-log": _write(root, "artifacts/wave47.txt", b"wave47\n"),
    }

    if no_lift:
        outcome: dict[str, Any] = {
            "kind": "no-justified-lift",
            "reason": "no source-entitled reusable consumer was found",
            "proposed_refinement_count": 0,
        }
    else:
        fragment = _write(root, "artifacts/refinement.cnf", b"-1 2 0\n")
        successor = _write(root, "artifacts/successor.cnf", b"p cnf 3 2\n1 0\n-1 2 0\n")
        producer = _write(root, "producer.py", b"# source producer\n")
        consumer = "Problem97.Example.false_of_pattern"
        refinement = _json(
            root,
            "artifacts/refinement.json",
            {
                "status": REFINEMENT_STATUS,
                "lean_consumer": consumer,
                "fragment": fragment["path"],
                "fragment_sha256": fragment["sha256"],
                "output_root": successor["path"],
                "output_root_sha256": successor["sha256"],
                "inputs": {
                    "root_sha256": input_root["sha256"],
                    "model_sha256": model["sha256"],
                    "gate_report_sha256": analysis["sha256"],
                },
                "source_hashes": {producer["path"]: producer["sha256"]},
            },
        )
        outcome = {
            "kind": "reusable-theorem",
            "lean_consumer": consumer,
            "source_producer": producer["path"],
            "refinement_receipt": refinement,
            "refinement_fragment": fragment,
            "successor_root": successor,
        }

    reusable = not no_lift
    return {
        "schema": SCHEMA,
        "status": STATUS,
        "lane": "exact17-rigid221-lazy",
        "wave": {"ordinal": LEGACY_BOOTSTRAP_ORDINAL, "label": "wave48"},
        "artifacts": {
            "input_root": input_root,
            "solve_receipt": solve,
            "model": model,
            "source_analysis": analysis,
        },
        "history": {
            "mode": "legacy-bootstrap",
            "first_wave": 1,
            "last_wave": LEGACY_BOOTSTRAP_ORDINAL,
            "evidence": [
                {"role": role, "artifact": legacy_artifacts[role]}
                for role in sorted(LEGACY_BOOTSTRAP_ROLES)
            ],
        },
        "search": {
            "artifact": search,
            "corpus": LEAN_CORPUS,
            "queries": ["general obstruction matching the current model"],
            "results_examined": 2,
            "current_wave_checked": True,
            "accumulated_history_checked": True,
            "theorem_banks": banks,
        },
        "outcome": outcome,
        "claims": {
            "finite_theorem_search": True,
            "source_backed_refinement": reusable,
            "successor_authorized": reusable,
            "universal_closure": False,
            "theorem_closure": False,
        },
    }


def _two_receipt_lineage(root: Path) -> tuple[Path, Path]:
    predecessor = _fixture(root)
    predecessor_relative = "artifacts/wave48-postwave.json"
    predecessor_path = root / predecessor_relative
    predecessor_path.write_bytes(canonical_json_bytes(predecessor) + b"\n")
    predecessor_artifact = {
        "path": predecessor_relative,
        "sha256": _sha(predecessor_path.read_bytes()),
    }

    input_root = predecessor["outcome"]["successor_root"]
    model = _json(
        root, "artifacts/wave49-model.json", {"vars": 3, "model": [1, 2, 3]}
    )
    solve = _json(
        root,
        "artifacts/wave49-solve.json",
        {
            "model_literals": 3,
            "session_before": {
                "id": "11111111-1111-4111-8111-111111111111",
                "lane": "sat",
                "state": "live",
                "last_assumption_free": True,
                "clauses": 2,
                "declared_num_vars": 3,
                "max_var": 3,
                "solver_sha256": "a" * 64,
                "solves": 5,
            },
            "solve_response": {"status": "SAT", "solve_index": 6},
        },
    )
    analysis = _json(
        root,
        "artifacts/wave49-analysis.json",
        {
            "cnf_assignment_verified": True,
            "piqd_model_total": True,
            "inputs": {
                "cnf_sha256": input_root["sha256"],
                "model_sha256": model["sha256"],
            },
        },
    )
    search = _write(
        root,
        "artifacts/wave49-search.txt",
        b"theorem bank checked\ncurrent model checked\n",
    )
    current = {
        "schema": SCHEMA,
        "status": STATUS,
        "lane": predecessor["lane"],
        "wave": {"ordinal": 49, "label": "wave49"},
        "artifacts": {
            "input_root": input_root,
            "solve_receipt": solve,
            "model": model,
            "source_analysis": analysis,
        },
        "history": {
            "mode": "predecessor-receipt",
            "first_wave": 1,
            "last_wave": 49,
            "evidence": [
                {
                    "role": "predecessor-theorem-search-receipt",
                    "artifact": predecessor_artifact,
                }
            ],
        },
        "search": {
            "artifact": search,
            "corpus": LEAN_CORPUS,
            "queries": ["general obstruction matching the current model"],
            "results_examined": 2,
            "current_wave_checked": True,
            "accumulated_history_checked": True,
            "theorem_banks": predecessor["search"]["theorem_banks"],
        },
        "outcome": {
            "kind": "no-justified-lift",
            "reason": "no source-entitled reusable consumer was found",
            "proposed_refinement_count": 0,
        },
        "claims": {
            "finite_theorem_search": True,
            "source_backed_refinement": False,
            "successor_authorized": False,
            "universal_closure": False,
            "theorem_closure": False,
        },
    }
    current_path = root / "artifacts/wave49-postwave.json"
    current_path.write_bytes(canonical_json_bytes(current) + b"\n")
    return predecessor_path, current_path


def test_reusable_theorem_authorizes_only_bound_successor(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    authorization = validate_postwave_receipt(receipt, repo_root=tmp_path)
    assert authorization.successor_authorized
    assert authorization.wave_ordinal == LEGACY_BOOTSTRAP_ORDINAL
    assert authorization.source_session_id == "11111111-1111-4111-8111-111111111111"
    assert authorization.source_solve_index == 5
    assert authorization.source_solver_sha256 == "a" * 64
    assert authorization.lean_consumer == "Problem97.Example.false_of_pattern"
    assert authorization.admitted_clauses == ((-1, 2),)


def test_authorization_loader_returns_validated_authorization(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    output.write_bytes(canonical_json_bytes(receipt) + b"\n")
    authorization = load_postwave_authorization(output, repo_root=tmp_path)
    assert authorization.successor_authorized
    assert authorization.admitted_clauses == ((-1, 2),)


def test_declared_variable_universe_may_exceed_observed_max(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    solve_path = tmp_path / receipt["artifacts"]["solve_receipt"]["path"]
    solve = json.loads(solve_path.read_text())
    solve["session_before"]["max_var"] = 1
    solve_path.write_text(json.dumps(solve, sort_keys=True))
    receipt["artifacts"]["solve_receipt"]["sha256"] = _sha(solve_path.read_bytes())

    authorization = validate_postwave_receipt(receipt, repo_root=tmp_path)

    assert authorization.successor_authorized


def test_detached_assumption_free_session_is_resumable(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    solve_path = tmp_path / receipt["artifacts"]["solve_receipt"]["path"]
    solve = json.loads(solve_path.read_text())
    solve["session_before"]["state"] = "detached"
    solve_path.write_text(json.dumps(solve, sort_keys=True))
    receipt["artifacts"]["solve_receipt"]["sha256"] = _sha(solve_path.read_bytes())

    authorization = validate_postwave_receipt(receipt, repo_root=tmp_path)

    assert authorization.successor_authorized


def test_closed_session_is_not_resumable(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    solve_path = tmp_path / receipt["artifacts"]["solve_receipt"]["path"]
    solve = json.loads(solve_path.read_text())
    solve["session_before"]["state"] = "closed"
    solve_path.write_text(json.dumps(solve, sort_keys=True))
    receipt["artifacts"]["solve_receipt"]["sha256"] = _sha(solve_path.read_bytes())

    with pytest.raises(PostwaveGateError, match="resumable assumption-free"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_clause_admission_failure_is_a_gate_error(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    receipt = _fixture(tmp_path)

    def reject_clause(**_kwargs: Any) -> None:
        from census.p97_search.phase3_piqd_clause_admission import (
            ClauseAdmissionError,
        )

        raise ClauseAdmissionError("candidate is redundant")

    monkeypatch.setattr(
        "census.p97_search.phase3_piqd_postwave_gate.audit_clause_admission",
        reject_clause,
    )
    with pytest.raises(PostwaveGateError, match="failed clause admission"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_no_lift_completes_review_but_stops_successor(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path, no_lift=True)
    authorization = validate_postwave_receipt(receipt, repo_root=tmp_path)
    assert authorization.outcome == "no-justified-lift"
    assert not authorization.successor_authorized
    assert authorization.successor_root_sha256 is None


def test_requires_full_theorem_bank_registry_and_both_search_scopes(
    tmp_path: Path,
) -> None:
    receipt = _fixture(tmp_path)
    receipt["search"]["theorem_banks"].pop()
    with pytest.raises(PostwaveGateError, match="complete canonical"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)

    receipt = _fixture(tmp_path)
    receipt["search"]["accumulated_history_checked"] = False
    with pytest.raises(PostwaveGateError, match="accumulated_history_checked"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_rejects_unbound_model_or_model_specific_refinement(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    receipt["artifacts"]["model"]["sha256"] = "0" * 64
    with pytest.raises(PostwaveGateError, match="SHA-256"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)

    receipt = _fixture(tmp_path)
    refinement_path = tmp_path / receipt["outcome"]["refinement_receipt"]["path"]
    refinement = json.loads(refinement_path.read_text())
    refinement["status"] = "not-source-backed"
    refinement_path.write_text(json.dumps(refinement, sort_keys=True))
    receipt["outcome"]["refinement_receipt"]["sha256"] = _sha(
        refinement_path.read_bytes()
    )
    with pytest.raises(PostwaveGateError, match="source-backed"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_independently_rejects_model_that_falsifies_root(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    model_artifact = receipt["artifacts"]["model"]
    model_path = tmp_path / model_artifact["path"]
    model_path.write_text(json.dumps({"vars": 3, "model": [-1, -2, 3]}, sort_keys=True))
    model_artifact["sha256"] = _sha(model_path.read_bytes())
    with pytest.raises(PostwaveGateError, match="does not satisfy input root clause 1"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_rejects_same_size_successor_with_wrong_clause_body(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    outcome = receipt["outcome"]
    successor_path = tmp_path / outcome["successor_root"]["path"]
    successor_path.write_bytes(b"p cnf 3 2\n1 0\n-2 3 0\n")
    successor_sha = _sha(successor_path.read_bytes())
    outcome["successor_root"]["sha256"] = successor_sha

    refinement_artifact = outcome["refinement_receipt"]
    refinement_path = tmp_path / refinement_artifact["path"]
    refinement = json.loads(refinement_path.read_text())
    refinement["output_root_sha256"] = successor_sha
    refinement_path.write_text(json.dumps(refinement, sort_keys=True))
    refinement_artifact["sha256"] = _sha(refinement_path.read_bytes())

    with pytest.raises(
        PostwaveGateError, match="not exactly input root plus refinement"
    ):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_legacy_bootstrap_is_only_the_exact_wave48_migration(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    receipt["wave"] = {"ordinal": 49, "label": "wave49"}
    receipt["history"]["last_wave"] = 49
    with pytest.raises(PostwaveGateError, match="exact wave-48 migration"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)

    receipt = _fixture(tmp_path)
    receipt["history"]["evidence"].pop()
    with pytest.raises(PostwaveGateError, match="exact pre-gate evidence set"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_legacy_bootstrap_rejects_mutable_results_index(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    mutable = _write(
        tmp_path,
        "scratch/p97-exact17-piqd-wave6-canary-v1/RESULTS.md",
        b"mutable campaign log\n",
    )
    for entry in receipt["history"]["evidence"]:
        if entry["role"] == "legacy-results-index":
            entry["artifact"] = mutable
            break

    with pytest.raises(PostwaveGateError, match="immutable wave-48 results snapshot"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_artifact_path_cannot_traverse_symlinked_parent(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    real = tmp_path / "real"
    real.mkdir()
    (real / "input.cnf").write_bytes(b"p cnf 3 1\n1 0\n")
    (tmp_path / "linked").symlink_to(real, target_is_directory=True)
    receipt["artifacts"]["input_root"] = {
        "path": "linked/input.cnf",
        "sha256": _sha((real / "input.cnf").read_bytes()),
    }
    with pytest.raises(PostwaveGateError, match="must not traverse a symlink"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_rejects_source_drift_after_refinement_receipt(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    (tmp_path / receipt["outcome"]["source_producer"]).write_text("# drifted\n")
    with pytest.raises(PostwaveGateError, match="SHA-256"):
        validate_postwave_receipt(receipt, repo_root=tmp_path)


def test_canonical_receipt_round_trip(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    authorization = write_postwave_receipt(receipt, output=output, repo_root=tmp_path)
    assert authorization.successor_authorized
    assert output.read_bytes() == canonical_json_bytes(receipt) + b"\n"
    assert load_postwave_receipt(output, repo_root=tmp_path) == receipt


def test_writer_fails_fast_when_receipt_lock_is_held(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    lock_path = postwave_gate._receipt_lock_path(output)
    lock_path.parent.mkdir(parents=True, exist_ok=True)

    with lock_path.open("w+") as stream:
        stream.write("pid=12345\n")
        stream.flush()
        postwave_gate.fcntl.flock(
            stream.fileno(), postwave_gate.fcntl.LOCK_EX | postwave_gate.fcntl.LOCK_NB
        )
        with pytest.raises(PostwaveGateError, match="already active.*pid=12345"):
            write_postwave_receipt(receipt, output=output, repo_root=tmp_path)


def test_reader_fails_fast_when_receipt_lock_is_held(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    output.write_bytes(canonical_json_bytes(receipt) + b"\n")
    lock_path = postwave_gate._receipt_lock_path(output)

    with lock_path.open("w+") as stream:
        stream.write("pid=67890\n")
        stream.flush()
        postwave_gate.fcntl.flock(
            stream.fileno(), postwave_gate.fcntl.LOCK_EX | postwave_gate.fcntl.LOCK_NB
        )
        with pytest.raises(PostwaveGateError, match="already active.*pid=67890"):
            load_postwave_authorization(output, repo_root=tmp_path)


def test_cold_lineage_validates_each_receipt_once(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _predecessor_path, current_path = _two_receipt_lineage(tmp_path)
    original = postwave_gate._validate_postwave_receipt_local
    waves: list[int] = []

    def counted(*args: Any, **kwargs: Any) -> Any:
        receipt = args[0] if args else kwargs["receipt"]
        waves.append(receipt["wave"]["ordinal"])
        return original(*args, **kwargs)

    monkeypatch.setattr(
        postwave_gate, "_validate_postwave_receipt_local", counted
    )
    lineage = load_postwave_lineage(current_path, repo_root=tmp_path)

    assert waves == [48, 49]
    assert tuple(token.wave_ordinal for token in lineage.receipts) == (48, 49)


def test_incremental_successor_reuses_validated_prefix(tmp_path: Path) -> None:
    predecessor_path, current_path = _two_receipt_lineage(tmp_path)
    predecessor = load_postwave_lineage(
        predecessor_path, repo_root=tmp_path
    ).latest

    current = validate_postwave_successor(
        predecessor, current_path, repo_root=tmp_path
    )

    assert current.wave_ordinal == 49
    assert not current.authorization.successor_authorized


def test_incremental_successor_rejects_mutated_predecessor(tmp_path: Path) -> None:
    predecessor_path, current_path = _two_receipt_lineage(tmp_path)
    predecessor = load_postwave_lineage(
        predecessor_path, repo_root=tmp_path
    ).latest
    predecessor_path.write_bytes(predecessor_path.read_bytes() + b"\n")

    with pytest.raises(PostwaveGateError, match="changed on disk"):
        validate_postwave_successor(predecessor, current_path, repo_root=tmp_path)


def test_noncanonical_receipt_fails_closed(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    output.write_text(json.dumps(receipt, indent=2))
    with pytest.raises(PostwaveGateError, match="not canonical"):
        load_postwave_receipt(output, repo_root=tmp_path)


def test_real_receipt_loader_drives_controller_without_mock(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    output.write_bytes(canonical_json_bytes(receipt) + b"\n")

    class Runner:
        session_id = "11111111-1111-4111-8111-111111111111"
        solve_count = 5
        solver_sha256 = "a" * 64
        exported_cnf_sha256 = receipt["artifacts"]["input_root"]["sha256"]
        closed = False

        def append_clauses(self, clauses: Any) -> int:
            assert tuple(map(tuple, clauses)) == ((-1, 2),)
            self.exported_cnf_sha256 = receipt["outcome"]["successor_root"]["sha256"]
            return 1

        def solve(self, **_kwargs: Any) -> str:
            return "SAT"

        def close(self) -> None:
            self.closed = True

    runner = Runner()
    authorization, result = run_authorized_successor(
        runner, postwave_receipt=output, repo_root=tmp_path
    )
    assert authorization.wave_ordinal == LEGACY_BOOTSTRAP_ORDINAL
    assert result == "SAT"
    assert not runner.closed


def test_controller_rejects_solver_binary_mismatch(tmp_path: Path) -> None:
    receipt = _fixture(tmp_path)
    output = tmp_path / "artifacts/postwave.json"
    output.write_bytes(canonical_json_bytes(receipt) + b"\n")

    class Runner:
        session_id = "11111111-1111-4111-8111-111111111111"
        solve_count = 5
        solver_sha256 = "b" * 64
        exported_cnf_sha256 = receipt["artifacts"]["input_root"]["sha256"]
        closed = False

        def append_clauses(self, _clauses: Any) -> int:
            raise AssertionError("solver mismatch must fail before append")

        def solve(self, **_kwargs: Any) -> str:
            raise AssertionError("solver mismatch must fail before solve")

        def close(self) -> None:
            self.closed = True

    with pytest.raises(TheoremGatedDiscoveryError, match="solver binary"):
        run_authorized_successor(Runner(), postwave_receipt=output, repo_root=tmp_path)
