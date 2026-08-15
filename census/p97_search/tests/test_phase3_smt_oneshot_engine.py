from __future__ import annotations

import hashlib
import os
from pathlib import Path

import pytest

from census.p97_search.phase3_cegar_wave import canonical_json_bytes
from census.p97_search.phase3_cegar_wave_control import (
    CONTROL_SCHEMA_V5,
    SMT_ONESHOT,
    SMT_ONESHOT_PIQD_ADAPTER,
    SMT_ONESHOT_PIQD_ADAPTER_SCHEMA_V1,
    SMT_ONESHOT_SEMANTIC_VALIDATOR_V1,
    SmtOneshotControl,
    load_wave_control,
)
from census.p97_search.phase3_piqd_smt_source_adapter import (
    FALSE_CLAIMS,
    SemanticVerification,
    SourceSemanticQuery,
)
from census.p97_search.phase3_smt_oneshot_engine import (
    ENGINE_FALSE_CLAIMS,
    SmtOneshotEngineError,
    SmtOneshotSemanticProfile,
    SmtOneshotWaveEngine,
    inspect_smt_oneshot_engine_output_structure,
    validate_smt_oneshot_engine_output,
)

DESCRIPTOR_SCHEMA = "test-smt-oneshot-query/v1"
SOLVER_PROFILE_SCHEMA = "test-smt-oneshot-profile/v1"
PROFILE_IDENTITY = ("test-smt-profile", "1")
REGISTRATION = {"schema": "test-registration/v1"}


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _packet(root: Path) -> tuple[SmtOneshotControl, Path]:
    root.mkdir()
    source = b"producer-source\n"
    smt2 = b"(set-logic QF_LIA)\n(declare-const x Int)\n(assert (= x 1))\n"
    (root / "source.bin").write_bytes(source)
    (root / "query.smt2").write_bytes(smt2)
    semantic = {"expected": 1}
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {"id": "test-producer", "version": "1"},
        "semantic_verifier": {
            "id": PROFILE_IDENTITY[0],
            "version": PROFILE_IDENTITY[1],
        },
        "stage_id": "stage",
        "query_id": "query",
        "sources": [
            {"path": "source.bin", "bytes": len(source), "sha256": _sha(source)}
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(canonical_json_bytes(semantic)),
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(smt2),
            "sha256": _sha(smt2),
        },
        "variables": [{"id": "x", "term": "x", "sort": "Int"}],
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": ["x"],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA,
            "solvers": ["z3"],
            "timeout_ms": 1000,
        },
    }
    descriptor_bytes = canonical_json_bytes(descriptor) + b"\n"
    (root / "descriptor.json").write_bytes(descriptor_bytes)
    control_value = {
        "schema": CONTROL_SCHEMA_V5,
        "wave_kind": SMT_ONESHOT,
        "adapter_id": SMT_ONESHOT_PIQD_ADAPTER,
        "adapter_schema": SMT_ONESHOT_PIQD_ADAPTER_SCHEMA_V1,
        "package": {
            "descriptor": {
                "path": "descriptor.json",
                "sha256": _sha(descriptor_bytes),
                "max_bytes": 4096,
            }
        },
        "semantic_validator": SMT_ONESHOT_SEMANTIC_VALIDATOR_V1,
        "smt_semantic_profile": {
            "id": PROFILE_IDENTITY[0],
            "version": PROFILE_IDENTITY[1],
        },
    }
    control = load_wave_control(canonical_json_bytes(control_value))
    assert type(control) is SmtOneshotControl
    return control, root


def _profile(*, reject_query: bool = False) -> SmtOneshotSemanticProfile:
    def validate(query: SourceSemanticQuery) -> SourceSemanticQuery:
        if reject_query:
            raise ValueError("rejected")
        return query

    def verify(
        query: SourceSemanticQuery, solver: str, model: str, values: str
    ) -> SemanticVerification:
        assert query.descriptor["semantic_input"] == {"expected": 1}
        return SemanticVerification(
            accepted=solver == "z3" and values == "((x 1))",
            evidence={"model": _sha(model.encode()), "value": 1},
        )

    return SmtOneshotSemanticProfile(
        identity=PROFILE_IDENTITY,
        descriptor_schema=DESCRIPTOR_SCHEMA,
        solver_profile_schema=SOLVER_PROFILE_SCHEMA,
        solver="z3",
        query_validator=validate,
        semantic_verifier=verify,
    )


def _install(fd: int, name: str, payload: bytes) -> dict[str, object]:
    artifact_fd = os.open(name, os.O_WRONLY | os.O_CREAT | os.O_EXCL, 0o400, dir_fd=fd)
    try:
        os.write(artifact_fd, payload)
    finally:
        os.close(artifact_fd)
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def test_sat_run_publishes_and_offline_replays_exact_source_semantics(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, root = _packet(tmp_path / "packet")
    profile = _profile()
    calls: list[str] = []

    def fake_run(query: SourceSemanticQuery, **kwargs: object) -> dict[str, object]:
        calls.append(kwargs["solver"])
        solve = {
            "status": "SAT",
            "model": "(model (define-fun x () Int 1))",
            "values": "((x 1))",
        }
        solve_raw = canonical_json_bytes(solve) + b"\n"
        semantic = profile.semantic_verifier(
            query, "z3", solve["model"], solve["values"]
        )
        semantic_row = {
            "accepted": semantic.accepted,
            "evidence": semantic.evidence,
            "verifier": query.descriptor["semantic_verifier"],
            "model_sha256": _sha(solve["model"].encode()),
            "values_sha256": _sha(solve["values"].encode()),
        }
        return {
            "solver": "z3",
            "raw_status": "SAT",
            "effective_status": "SAT_SEMANTICALLY_REPLAYED",
            "semantic_replay": semantic_row,
            "artifacts": {
                "solve": _install(kwargs["output_fd"], "z3.solve.json", solve_raw)
            },
            "claims": dict(FALSE_CLAIMS),
        }

    monkeypatch.setattr(
        "census.p97_search.phase3_smt_oneshot_engine.run_authenticated_single_solver_query",
        fake_run,
    )
    output = tmp_path / "output"
    result = SmtOneshotWaveEngine(
        control=control,
        package_root=root,
        output_path=output,
        base_url="http://unused.invalid",
        semantic_profile=profile,
        transport=object(),
        execution_registration=REGISTRATION,
    ).run()
    assert calls == ["z3"]
    assert result.classification == "SAT_SEMANTICALLY_REPLAYED"
    assert inspect_smt_oneshot_engine_output_structure(output) == result.envelope
    assert (
        validate_smt_oneshot_engine_output(
            control,
            root,
            output,
            semantic_profile=profile,
            execution_registration=REGISTRATION,
        )
        == result.envelope
    )


def test_query_validator_rejects_before_staging_or_transport(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, root = _packet(tmp_path / "packet")
    touched = False

    def forbidden(*args: object, **kwargs: object) -> object:
        nonlocal touched
        touched = True
        raise AssertionError("transport boundary reached")

    monkeypatch.setattr(
        "census.p97_search.phase3_smt_oneshot_engine.run_authenticated_single_solver_query",
        forbidden,
    )
    output = tmp_path / "output"
    with pytest.raises(SmtOneshotEngineError, match="query validator rejected"):
        SmtOneshotWaveEngine(
            control=control,
            package_root=root,
            output_path=output,
            base_url="http://unused.invalid",
            semantic_profile=_profile(reject_query=True),
            transport=object(),
            execution_registration=REGISTRATION,
        ).run()
    assert touched is False
    assert not output.exists()


@pytest.mark.parametrize(
    ("raw_status", "classification"),
    [
        ("UNSAT", "UNSAT_DISCOVERY_ONLY"),
        ("UNKNOWN", "INCONCLUSIVE_UNKNOWN"),
        (None, "INCONCLUSIVE_TRANSPORT_LOSS"),
    ],
)
def test_non_sat_boundaries_are_diagnostic_and_never_call_semantic_replay(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    raw_status: str | None,
    classification: str,
) -> None:
    control, root = _packet(tmp_path / "packet")
    profile = _profile()

    def forbidden_semantics(*args: object) -> SemanticVerification:
        raise AssertionError("non-SAT semantic replay was invoked")

    profile = SmtOneshotSemanticProfile(
        identity=profile.identity,
        descriptor_schema=profile.descriptor_schema,
        solver_profile_schema=profile.solver_profile_schema,
        solver=profile.solver,
        query_validator=profile.query_validator,
        semantic_verifier=forbidden_semantics,
    )

    def fake_run(*args: object, **kwargs: object) -> dict[str, object]:
        return {
            "solver": "z3",
            "raw_status": raw_status,
            "effective_status": classification,
            "semantic_replay": None,
            "artifacts": {},
            "claims": dict(FALSE_CLAIMS),
        }

    monkeypatch.setattr(
        "census.p97_search.phase3_smt_oneshot_engine.run_authenticated_single_solver_query",
        fake_run,
    )
    result = SmtOneshotWaveEngine(
        control=control,
        package_root=root,
        output_path=tmp_path / "output",
        base_url="http://unused.invalid",
        semantic_profile=profile,
        transport=object(),
        execution_registration=REGISTRATION,
    ).run()
    assert result.classification == classification
    assert result.envelope["claims"] == ENGINE_FALSE_CLAIMS


def test_v5_control_rejects_executable_surface(tmp_path: Path) -> None:
    control, _ = _packet(tmp_path / "packet")
    value = dict(control.value)
    value["shell"] = ["z3", "query.smt2"]
    with pytest.raises(Exception, match="inexact keys"):
        load_wave_control(canonical_json_bytes(value))
