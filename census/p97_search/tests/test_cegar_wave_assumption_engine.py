from __future__ import annotations

import hashlib
import json
import os
import stat
from dataclasses import replace
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_cegar_assumption_engine as engine
from census.p97_search.cegar_wave_assumption_profiles import (
    CHILD45_SCHEMA,
    assumption_campaign_metadata,
    parse_assumption_campaign_profile,
)
from census.p97_search.phase3_cegar_assumption_engine import (
    CELLS_UNSAT_DISCOVERY_ONLY,
    INCONCLUSIVE,
    PARENT_TERMINAL_DISCOVERY_ONLY,
    SAT_SEMANTIC_REPLAYED,
    AssumptionCnfEngineError,
    AssumptionCnfWaveEngine,
    inspect_assumption_cnf_engine_output,
    validate_assumption_cnf_engine_output,
)
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    canonical_json_bytes,
)
from census.p97_search.phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    AdapterRegistration,
    ArtifactReference,
    AssumptionCnfBinding,
    WaveControl,
)
from census.p97_search.phase3_piqd_assumption_campaign import (
    AssumptionCampaignResult,
    CampaignReceipt,
    CnfStreamIdentity,
)
from census.p97_search.phase3_piqd_driver import DriverPolicy

ROOT = Path(__file__).resolve().parents[3]
PROFILE_PATH = ROOT / "census/p97_search/exact17_child44_nextcenter_cells_v1.json"
SESSION_ID = "11111111-1111-4111-8111-111111111111"


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _registration() -> dict[str, Any]:
    return engine._expected_registration()


def _manifest(profile, producer: bytes, variable_map: bytes) -> dict[str, Any]:
    return {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "assumption-child44-fixture",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.fixtureLeaf",
            "ingress_hypotheses_sha256": "1" * 64,
            "finite_schema": "p97-exact17-child44-nextcenter-cells/v1",
            "cardinality_scope": "one finite exact-17 source partition",
            "source_theorem": "Problem97.fixtureSource",
        },
        "encoding": {
            "cnf_sha256": profile.parent_sha256,
            "variable_map_sha256": _sha(variable_map),
            "producer_manifest_sha256": _sha(producer),
            "num_variables": profile.variables,
            "num_clauses": profile.clauses,
            "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "sat",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": "2" * 64,
            "seed": 97,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }


def _fixture(tmp_path: Path) -> tuple[WaveControl, AssumptionCnfBinding]:
    profile_raw = PROFILE_PATH.read_bytes()
    profile = parse_assumption_campaign_profile(profile_raw)
    producer = canonical_json_bytes({"producer": "fixture"})
    variable_map = canonical_json_bytes({"map": "fixture"})
    manifest = _manifest(profile, producer, variable_map)
    manifest_raw = canonical_json_bytes(manifest)
    reference = ArtifactReference("fixture", "a" * 64, 1 << 30)
    control = WaveControl(
        value={"fixture": True},
        manifest=reference,
        cnf=reference,
        producer_manifest=reference,
        variable_map=reference,
        policy=DriverPolicy(requested_core_limit=1),
        registration=AdapterRegistration(
            ASSUMPTION_CNF,
            ASSUMPTION_CNF_PIQD_ADAPTER,
            ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
            ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
            permits_campaign=True,
        ),
        canonical_bytes=canonical_json_bytes({"control": "fixture"}),
        campaign=reference,
    )
    parent_path = (tmp_path / "package" / "parent.cnf").resolve()
    identity = CnfStreamIdentity(
        sha256=profile.parent_sha256,
        num_bytes=profile.parent_byte_count,
        num_vars=profile.variables,
        num_clauses=profile.clauses,
        max_var=profile.variables,
        journal_sha256="3" * 64,
        journal_bytes=profile.parent_byte_count,
        all_variables_used=True,
        source_dev=7,
        source_ino=11,
        path_chain=((1, 2), (3, 4)),
    )
    binding = AssumptionCnfBinding(
        control=control,
        wave_manifest=manifest,
        wave_manifest_bytes=manifest_raw,
        parent_path=parent_path,
        parent_identity=identity,
        producer_manifest=producer,
        variable_map=variable_map,
        campaign=profile,
        campaign_bytes=profile_raw,
    )
    return control, binding


class FakeSession:
    def __init__(
        self,
        binding: AssumptionCnfBinding,
        statuses: list[tuple[str, tuple[int, ...] | None]],
        *,
        close_error: bool = False,
        solve_error: bool = False,
    ) -> None:
        self.binding = binding
        self.statuses = statuses
        self.close_error = close_error
        self.solve_error = solve_error
        self.session_id = SESSION_ID
        self.pending_request_id = None
        self.solves: list[tuple[object, str]] = []
        self.close_calls = 0
        self.recover_calls = 0

    def solve(self, cell, *, request_id: str) -> AssumptionCampaignResult:
        if self.solve_error:
            raise RuntimeError("solve failed")
        self.solves.append((cell, request_id))
        index = len(self.solves)
        status, core = self.statuses[min(index - 1, len(self.statuses) - 1)]
        if status == "UNSAT" and core == (0,):
            core = cell.assumptions
        assignment = tuple(range(1, 309)) if status == "SAT" else ()
        request_sha = hashlib.sha256(f"request-{index}".encode()).hexdigest()
        result_sha = hashlib.sha256(f"result-{index}".encode()).hexdigest()
        scope = {
            "SAT": "sat-witness-replayed",
            "UNKNOWN": "inconclusive",
            "UNSAT": "terminal-discovery-only" if core == () else "cell-discovery-only",
        }[status]
        receipt = CampaignReceipt(
            session_id=self.session_id,
            solve_index=index,
            base_clauses=self.binding.parent_identity.num_clauses,
            base_bytes=self.binding.parent_identity.journal_bytes,
            base_sha256=self.binding.parent_identity.journal_sha256,
            assumptions=cell.assumptions,
            status=status,
            model_recorded=status == "SAT",
            result_sha256=result_sha,
            request_id=request_id,
            request_sha256=request_sha,
            conflict_limit=self.binding.campaign.conflict_limit,
            timeout_ms=self.binding.campaign.timeout_ms,
            interrupted_by=None,
            core=core,
            at=index,
        )
        return AssumptionCampaignResult(
            session_id=self.session_id,
            cell_id=cell.cell_id,
            assumptions=cell.assumptions,
            status=status,
            assignment=assignment,
            core=core,
            discovery_scope=scope,
            solve_index=index,
            request_id=request_id,
            request_sha256=request_sha,
            result_sha256=result_sha,
            replayed=False,
            parent_sha256=self.binding.campaign.parent_sha256,
            export_sha256=self.binding.campaign.parent_sha256,
            receipt=receipt,
            source_replayed=True,
        )

    def close(self) -> None:
        self.close_calls += 1
        if self.close_error:
            raise RuntimeError("close failed")

    def recover_first_result(
        self, cell, *, request_id: str
    ) -> AssumptionCampaignResult:
        self.recover_calls += 1
        return replace(self.solve(cell, request_id=request_id), replayed=True)

    def recover_first_cell(self, cell, *, request_id: str) -> AssumptionCampaignResult:
        return self.recover_first_result(cell, request_id=request_id)


def _semantic(binding, cell) -> dict[str, Any]:
    child45 = binding.campaign.schema == CHILD45_SCHEMA
    result = {
        "schema": (
            "p97-exact17-child45-assumption-sat-replay/v1"
            if child45
            else "p97-exact17-child44-assumption-sat-replay/v1"
        ),
        "cell_id": cell.id,
        "assumptions": list(cell.assumptions),
        "parent_sha256": (
            binding.campaign.source_parent_sha256
            if child45
            else binding.campaign.parent_sha256
        ),
        "parent_bytes": (
            binding.campaign.source_parent_byte_count
            if child45
            else binding.campaign.parent_byte_count
        ),
        "parent_variables": (
            binding.campaign.source_parent_variables
            if child45
            else binding.campaign.variables
        ),
        "parent_clauses": (
            binding.campaign.source_parent_clauses
            if child45
            else binding.campaign.clauses
        ),
        "assignment_sha256": "5" * 64,
        "source_model": {"next_center": cell.next_center},
        "source_predicates": ["source-total"],
        "replay_sha256": "6" * 64,
        "kalmanson": {
            "status": "LINEARLY_INFEASIBLE",
            "refinement_disposition": "EXACT_WEIGHTED_CERTIFICATE_READY",
        },
        "result_sha256": "4" * 64,
    }
    if child45:
        result.update(
            {
                "root_sha256": binding.campaign.parent_sha256,
                "root_bytes": binding.campaign.parent_byte_count,
                "root_variables": binding.campaign.variables,
                "root_clauses": binding.campaign.clauses,
                "suffix_sha256": engine._CHILD45_SUFFIX_SHA256,
            }
        )
    unsigned = {
        "schema": "p97-assumption-cnf-sat-result/v1",
        "profile_sha256": binding.campaign.raw_sha256,
        "result": result,
    }
    return {**unsigned, "serialization_sha256": _sha(canonical_json_bytes(unsigned))}


def _rewrite(output: Path, envelope: dict[str, Any], *, canonical: bool = True) -> None:
    unsigned = {
        key: value for key, value in envelope.items() if key != "envelope_sha256"
    }
    envelope["envelope_sha256"] = _sha(canonical_json_bytes(unsigned))
    raw = (
        canonical_json_bytes(envelope) + b"\n"
        if canonical
        else json.dumps(envelope, indent=2).encode() + b"\n"
    )
    output.write_bytes(raw)
    os.chmod(output, 0o600)


def _make_engine(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    statuses: list[tuple[str, tuple[int, ...] | None]],
    *,
    close_error: bool = False,
    solve_error: bool = False,
    replay_error: bool = False,
    child45: bool = False,
    existing_session_id: str | None = None,
):
    control, binding = _fixture(tmp_path)
    if child45:
        source_identity = binding.parent_identity
        root_identity = replace(
            source_identity,
            sha256="3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
            num_bytes=291_704_992,
            num_clauses=5_848_824,
            journal_sha256="4" * 64,
            journal_bytes=291_704_973,
        )
        profile = replace(
            binding.campaign,
            schema=CHILD45_SCHEMA,
            profile_id="exact17-child45-nextcenter",
            parent_job_id="8726dcec-978e-4fdc-8ca0-c33d14197c81",
            producer_manifest_sha256=(
                "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
            ),
            parent_sha256=root_identity.sha256,
            parent_byte_count=root_identity.num_bytes,
            clauses=root_identity.num_clauses,
            source_parent_path=(
                "scratch/exact17-lean-to-sat/"
                "exact17-forty-fourth-root-forty-third-model-refinements.cnf"
            ),
            source_parent_sha256=source_identity.sha256,
            source_parent_variables=source_identity.num_vars,
            source_parent_clauses=source_identity.num_clauses,
            source_parent_byte_count=source_identity.num_bytes,
        )
        binding = replace(
            binding,
            parent_identity=root_identity,
            campaign=profile,
            source_parent_path=(
                tmp_path / "scratch/exact17-lean-to-sat/"
                "exact17-forty-fourth-root-forty-third-model-refinements.cnf"
            ).resolve(),
            source_parent_identity=source_identity,
        )
    output_parent = tmp_path / "published"
    output_parent.mkdir(parents=True)
    output = output_parent / "engine.json"
    fake = FakeSession(
        binding, statuses, close_error=close_error, solve_error=solve_error
    )
    factories: list[dict[str, Any]] = []

    monkeypatch.setattr(engine, "bind_assumption_cnf", lambda *_args: binding)
    monkeypatch.setattr(
        engine,
        "stream_parent_identity",
        lambda path: (
            binding.source_parent_identity
            if child45 and path == binding.source_parent_path
            else binding.parent_identity
        ),
    )

    def factory(**kwargs):
        factories.append(kwargs)
        return fake

    def replay(profile, *, parent_cnf_path, source_parent_cnf_path, assignment, cell):
        assert profile is binding.campaign
        assert parent_cnf_path == binding.parent_path
        if child45:
            assert source_parent_cnf_path == binding.source_parent_path
        else:
            assert source_parent_cnf_path is None
        assert assignment == tuple(range(1, 309))
        if replay_error:
            raise RuntimeError("semantic replay failed")
        return _semantic(binding, cell)

    monkeypatch.setattr(engine, "replay_sat", replay)
    instance = AssumptionCnfWaveEngine(
        control=control,
        package_root=(tmp_path / "package").resolve(),
        output_path=output.resolve(),
        base_url="http://piqd.invalid",
        solver_signature="fixture-signature",
        transport=object(),
        export_digest=object(),
        job_blob_digest=object(),
        session_factory=factory,
        existing_session_id=existing_session_id,
        execution_registration=_registration(),
    )
    return instance, output.resolve(), binding, fake, factories


def test_sat_campaign_replays_all_cells_and_publishes_once(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, binding, fake, factories = _make_engine(
        tmp_path, monkeypatch, [("SAT", None)]
    )
    result = instance.run()
    assert result.classification == SAT_SEMANTIC_REPLAYED
    assert len(fake.solves) == 13
    assert fake.close_calls == 1
    assert len(factories) == 1
    assert factories[0]["existing_session_id"] is None
    assert fake.recover_calls == 0
    assert factories[0]["spec"].producer_job_status == "completed"
    assert factories[0]["spec"].descriptor_root
    assert stat.S_IMODE(output.stat().st_mode) == 0o600
    envelope = inspect_assumption_cnf_engine_output(output)
    assert envelope["campaign"] == assumption_campaign_metadata(binding.campaign)
    assert envelope["summary"] == {
        "total_cells": 13,
        "attempted": 13,
        "sat": 13,
        "unsat": 0,
        "unknown": 0,
        "not_run": 0,
        "classification": SAT_SEMANTIC_REPLAYED,
    }
    assert len({record["request_id"] for record in envelope["cells"]}) == 13


def test_existing_session_is_passed_once_and_recovers_first_cell_without_fresh_create(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    result = instance.run()
    assert result.classification == SAT_SEMANTIC_REPLAYED
    assert len(fake.solves) == 13
    assert fake.recover_calls == 1
    assert len(fake.solves) - fake.recover_calls == 12
    assert fake.close_calls == 1
    assert len(factories) == 1
    assert factories[0]["existing_session_id"] == SESSION_ID
    assert factories[0]["http_timeout_seconds"] == 930
    assert output.exists()
    assert inspect_assumption_cnf_engine_output(output)["close_observed"] is True


@pytest.mark.parametrize(
    ("close_error", "expected_calls"),
    [(RuntimeError("close failed"), 1), (TimeoutError("close timed out"), 2)],
)
def test_existing_session_close_failure_prevents_publication(
    close_error: Exception,
    expected_calls: int,
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    instance, output, _binding, fake, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    close_calls = 0

    def fail_close() -> None:
        nonlocal close_calls
        close_calls += 1
        raise close_error

    fake.close = fail_close
    with pytest.raises(AssumptionCnfEngineError, match="campaign close failed"):
        instance.run()
    assert close_calls == expected_calls
    assert not output.exists()


def test_existing_session_requires_absent_output_before_session_adoption(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    output.write_bytes(b"occupied")
    with pytest.raises(AssumptionCnfEngineError, match="absent output"):
        instance.run()
    assert fake.solves == []
    assert factories == []


def test_existing_session_rejects_zero_receipt_prefix_without_closing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )

    def reject_zero(*_args, **_kwargs):
        raise RuntimeError("first-result recovery requires exactly one adopted solve")

    fake.recover_first_result = reject_zero
    with pytest.raises(AssumptionCnfEngineError, match="campaign aborted"):
        instance.run()
    assert len(factories) == 1
    assert fake.solves == []
    assert fake.close_calls == 0
    assert not output.exists()


def test_existing_session_rejects_foreign_first_receipt_without_closing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )

    def recover_foreign(cell, *, request_id: str):
        fake.recover_calls += 1
        return replace(
            fake.solve(cell, request_id=request_id),
            cell_id="foreign-cell",
            replayed=True,
        )

    fake.recover_first_result = recover_foreign
    with pytest.raises(AssumptionCnfEngineError, match="campaign aborted"):
        instance.run()
    assert fake.close_calls == 0
    assert not output.exists()


def test_existing_session_rejects_skipped_first_receipt_without_closing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )

    def recover_skipped(cell, *, request_id: str):
        fake.recover_calls += 1
        result = fake.solve(cell, request_id=request_id)
        return replace(
            result,
            solve_index=2,
            receipt=replace(result.receipt, solve_index=2),
            replayed=True,
        )

    fake.recover_first_result = recover_skipped
    with pytest.raises(AssumptionCnfEngineError, match="campaign aborted"):
        instance.run()
    assert fake.close_calls == 0
    assert not output.exists()


@pytest.mark.parametrize("wrong_stage", ["recovered", "continuation"])
def test_existing_session_rejects_reordered_campaign_cell_without_closing(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    wrong_stage: str,
) -> None:
    instance, output, binding, fake, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    if wrong_stage == "recovered":
        original = fake.recover_first_result

        def crossed_recovery(cell, *, request_id):
            return replace(
                original(cell, request_id=request_id),
                cell_id=binding.campaign.cells[1].id,
            )

        fake.recover_first_result = crossed_recovery
    else:
        original = fake.solve

        def crossed_continuation(cell, *, request_id):
            result = original(cell, request_id=request_id)
            if cell.cell_id == binding.campaign.cells[1].id:
                return replace(result, cell_id=binding.campaign.cells[2].id)
            return result

        fake.solve = crossed_continuation
    with pytest.raises(AssumptionCnfEngineError, match="campaign aborted"):
        instance.run()
    assert fake.close_calls == 0
    assert not output.exists()


def test_existing_session_is_closed_before_output_publication_is_attempted(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, _factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    monkeypatch.setattr(
        engine,
        "_write_once",
        lambda *_args, **_kwargs: (_ for _ in ()).throw(
            AssumptionCnfEngineError("injected output failure")
        ),
    )
    with pytest.raises(AssumptionCnfEngineError, match="injected output failure"):
        instance.run()
    assert fake.close_calls == 1
    assert not output.exists()


@pytest.mark.parametrize(
    "existing_session_id",
    [
        "11111111-1111-4111-8111-11111111111A",
        "{11111111-1111-4111-8111-111111111111}",
        "11111111111141118111111111111111",
        "not-a-uuid",
    ],
)
def test_existing_session_requires_exact_canonical_uuid_before_binding(
    existing_session_id: str,
    tmp_path: Path,
) -> None:
    control, _binding = _fixture(tmp_path)
    with pytest.raises(AssumptionCnfEngineError, match="canonical UUID"):
        AssumptionCnfWaveEngine(
            control=control,
            package_root=tmp_path.resolve(),
            output_path=(tmp_path / "output.json").resolve(),
            base_url="http://invalid",
            solver_signature="fixture",
            existing_session_id=existing_session_id,
            execution_registration=_registration(),
        )


def test_existing_session_rejects_crossed_factory_identity_before_solving(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, _binding, fake, factories = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        existing_session_id=SESSION_ID,
    )
    fake.session_id = "22222222-2222-4222-8222-222222222222"
    with pytest.raises(AssumptionCnfEngineError, match="session identity"):
        instance.run()
    assert len(factories) == 1
    assert factories[0]["existing_session_id"] == SESSION_ID
    assert fake.solves == []
    assert fake.close_calls == 0
    assert not output.exists()


def test_child45_output_dispatches_and_validates_root_source_parent_contract(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    instance, output, binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("SAT", None)], child45=True
    )
    instance.run()
    envelope = inspect_assumption_cnf_engine_output(output)
    result = envelope["cells"][0]["semantic_replay"]["result"]
    assert result["schema"] == "p97-exact17-child45-assumption-sat-replay/v1"
    assert result["parent_sha256"] == binding.campaign.source_parent_sha256
    assert result["root_sha256"] == binding.campaign.parent_sha256
    accepted = validate_assumption_cnf_engine_output(
        binding.control, instance.package_root, output
    )
    assert accepted["summary"]["sat"] == 13


@pytest.mark.parametrize(
    ("field", "replacement"),
    [
        ("parent_sha256", "0" * 64),
        ("parent_bytes", 1),
        ("parent_variables", 1),
        ("parent_clauses", 1),
        ("root_sha256", "0" * 64),
        ("root_bytes", 1),
        ("root_variables", 1),
        ("root_clauses", 1),
        ("suffix_sha256", "0" * 64),
    ],
)
def test_child45_offline_validation_rejects_crossed_source_or_root(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    field: str,
    replacement: str | int,
) -> None:
    instance, output, binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("SAT", None)], child45=True
    )
    instance.run()
    envelope = json.loads(output.read_bytes())
    semantic = envelope["cells"][0]["semantic_replay"]
    semantic["result"][field] = replacement
    unsigned = {
        key: value for key, value in semantic.items() if key != "serialization_sha256"
    }
    semantic["serialization_sha256"] = _sha(canonical_json_bytes(unsigned))
    _rewrite(output, envelope)
    with pytest.raises(
        AssumptionCnfEngineError,
        match="Child45 semantic",
    ):
        validate_assumption_cnf_engine_output(
            binding.control, instance.package_root, output
        )


def test_nonempty_unsat_cores_remain_cell_discovery(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNSAT", (0,))]
    )
    result = instance.run()
    assert result.classification == CELLS_UNSAT_DISCOVERY_ONLY
    assert len(fake.solves) == 13
    assert all(record["core"] for record in result.envelope["cells"])
    assert output.exists()


def test_empty_core_stops_and_marks_remaining_not_run(
    tmp_path: Path, monkeypatch
) -> None:
    instance, _output, _binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNSAT", ())]
    )
    result = instance.run()
    assert result.classification == PARENT_TERMINAL_DISCOVERY_ONLY
    assert len(fake.solves) == 1
    assert result.envelope["summary"]["not_run"] == 12
    assert all(record["state"] == "NOT_RUN" for record in result.envelope["cells"][1:])


def test_unknown_is_inconclusive(tmp_path: Path, monkeypatch) -> None:
    instance, _output, _binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    result = instance.run()
    assert result.classification == INCONCLUSIVE
    assert len(fake.solves) == 13


def test_lost_solve_and_close_responses_use_authenticated_reconciliation(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    original_solve = fake.solve
    original_close = fake.close
    pending: dict[str, object] = {}
    retry_calls = 0

    def lose_solve(cell, *, request_id: str):
        pending.update(cell=cell, request_id=request_id)
        fake.pending_request_id = request_id
        raise OSError("both identical solve responses were lost")

    def retry_pending():
        nonlocal retry_calls
        retry_calls += 1
        fake.pending_request_id = None
        return original_solve(pending["cell"], request_id=pending["request_id"])

    close_calls = 0

    def lose_close_once():
        nonlocal close_calls
        close_calls += 1
        if close_calls == 1:
            raise OSError("close response lost")
        original_close()

    fake.solve = lose_solve  # type: ignore[method-assign]
    fake.retry_pending = retry_pending  # type: ignore[attr-defined]
    fake.close = lose_close_once  # type: ignore[method-assign]
    result = instance.run()
    assert result.classification == INCONCLUSIVE
    assert output.exists()
    assert retry_calls == 13
    assert close_calls == 2
    assert fake.close_calls == 1


def test_final_parent_recapture_rejects_post_solve_identity_change(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    calls = 0

    def recapture(_path: Path) -> CnfStreamIdentity:
        nonlocal calls
        calls += 1
        if calls == 1:
            return binding.parent_identity
        return replace(binding.parent_identity, source_ino=12)

    monkeypatch.setattr(engine, "stream_parent_identity", recapture)
    with pytest.raises(AssumptionCnfEngineError, match="identity changed"):
        instance.run()
    assert calls == 2
    assert fake.close_calls == 1
    assert not output.exists()


def test_recapture_parent_rejects_source_parent_identity_change(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _control, binding = _fixture(tmp_path)
    source_path = (tmp_path / "package" / "source-parent.cnf").resolve()
    source_identity = replace(binding.parent_identity, source_ino=13)
    binding = replace(
        binding,
        source_parent_path=source_path,
        source_parent_identity=source_identity,
    )

    def recapture(path: Path) -> CnfStreamIdentity:
        if path == binding.parent_path:
            return binding.parent_identity
        if path == source_path:
            return replace(source_identity, source_ino=14)
        raise AssertionError(f"unexpected CNF path: {path}")

    monkeypatch.setattr(engine, "stream_parent_identity", recapture)
    with pytest.raises(AssumptionCnfEngineError, match="source-parent.*changed"):
        engine._recapture_parent(binding)


@pytest.mark.parametrize("failure", ["replay", "close", "solve", "session"])
def test_errors_abort_without_publication(
    tmp_path: Path, monkeypatch, failure: str
) -> None:
    instance, output, _binding, fake, _ = _make_engine(
        tmp_path,
        monkeypatch,
        [("SAT", None)],
        replay_error=failure == "replay",
        close_error=failure == "close",
        solve_error=failure == "solve",
    )
    if failure == "session":
        instance.session_factory = lambda **_kwargs: (_ for _ in ()).throw(
            RuntimeError("session failed")
        )
    with pytest.raises(AssumptionCnfEngineError):
        instance.run()
    assert not output.exists()
    assert fake.close_calls == (0 if failure == "session" else 1)


def test_create_once_and_symlink_output_are_rejected(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    output.write_text("occupied")
    with pytest.raises(AssumptionCnfEngineError, match="already exists"):
        instance.run()
    second = tmp_path / "second"
    symlink_instance, symlink_output, _binding, _fake, _ = _make_engine(
        second, monkeypatch, [("UNKNOWN", None)]
    )
    target = symlink_output.parent / "target"
    target.write_text("target")
    symlink_output.symlink_to(target)
    with pytest.raises(AssumptionCnfEngineError, match="already exists"):
        symlink_instance.run()


def test_inspect_rejects_hardlink_and_tamper(tmp_path: Path, monkeypatch) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    instance.run()
    alias = output.parent / "alias.json"
    os.link(output, alias)
    with pytest.raises(AssumptionCnfEngineError, match="capture"):
        inspect_assumption_cnf_engine_output(output)
    alias.unlink()
    envelope = json.loads(output.read_bytes())
    envelope["summary"]["unknown"] = 0
    output.write_bytes(canonical_json_bytes(envelope) + b"\n")
    os.chmod(output, 0o600)
    with pytest.raises(AssumptionCnfEngineError, match="self-hash"):
        inspect_assumption_cnf_engine_output(output)


def test_validate_rebinds_offline_without_replay_or_transport(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("SAT", None)]
    )
    instance.run()
    calls = 0

    def binder(*_args):
        nonlocal calls
        calls += 1
        return binding

    monkeypatch.setattr(engine, "bind_assumption_cnf", binder)
    monkeypatch.setattr(
        engine,
        "replay_sat",
        lambda *_args, **_kwargs: (_ for _ in ()).throw(AssertionError("reran replay")),
    )
    accepted = validate_assumption_cnf_engine_output(
        binding.control, instance.package_root, output
    )
    assert accepted["summary"]["sat"] == 13
    assert calls == 1


def test_validate_rejects_crossed_package_binding(tmp_path: Path, monkeypatch) -> None:
    instance, output, binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    instance.run()
    crossed = replace(binding, variable_map=b'{"crossed":true}')
    monkeypatch.setattr(engine, "bind_assumption_cnf", lambda *_args: crossed)
    with pytest.raises(AssumptionCnfEngineError, match="current package"):
        validate_assumption_cnf_engine_output(
            binding.control, instance.package_root, output
        )


def test_validate_rejects_crossed_control_request_ids(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    instance.run()
    crossed_control = replace(binding.control, canonical_bytes=b'{"crossed":true}')
    crossed = replace(binding, control=crossed_control)
    monkeypatch.setattr(engine, "bind_assumption_cnf", lambda *_args: crossed)
    with pytest.raises(AssumptionCnfEngineError, match="current control"):
        validate_assumption_cnf_engine_output(
            crossed_control, instance.package_root, output
        )


def test_constructor_rejects_crossed_registration_and_relative_paths(
    tmp_path: Path,
) -> None:
    control, _binding = _fixture(tmp_path)
    registration = _registration()
    registration["registration"]["permits_terminal_proof"] = True
    with pytest.raises(AssumptionCnfEngineError, match="execution registration"):
        AssumptionCnfWaveEngine(
            control=control,
            package_root=tmp_path.resolve(),
            output_path=(tmp_path / "output.json").resolve(),
            base_url="http://invalid",
            solver_signature="fixture",
            execution_registration=registration,
        )
    with pytest.raises(AssumptionCnfEngineError, match="package_root"):
        AssumptionCnfWaveEngine(
            control=control,
            package_root=Path("relative"),
            output_path=(tmp_path / "output.json").resolve(),
            base_url="http://invalid",
            solver_signature="fixture",
            execution_registration=_registration(),
        )


def test_inspect_rejects_not_run_without_prior_terminal_unsat(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    instance.run()
    envelope = json.loads(output.read_bytes())
    envelope["cells"] = [
        {
            "state": "NOT_RUN",
            "cell_id": record["cell_id"],
            "assumptions": record["assumptions"],
            "reason": "parent-terminal-discovery-only",
        }
        for record in envelope["cells"]
    ]
    envelope["summary"] = {
        "total_cells": 13,
        "attempted": 0,
        "sat": 0,
        "unsat": 0,
        "unknown": 0,
        "not_run": 13,
        "classification": CELLS_UNSAT_DISCOVERY_ONLY,
    }
    _rewrite(output, envelope)
    with pytest.raises(AssumptionCnfEngineError, match="NOT_RUN"):
        inspect_assumption_cnf_engine_output(output)


def test_inspect_requires_canonical_json_even_with_valid_self_hash(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    instance.run()
    envelope = json.loads(output.read_bytes())
    _rewrite(output, envelope, canonical=False)
    with pytest.raises(AssumptionCnfEngineError, match="canonical JSON"):
        inspect_assumption_cnf_engine_output(output)


def test_malformed_created_session_is_closed_once(tmp_path: Path, monkeypatch) -> None:
    instance, output, _binding, fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    fake.session_id = "not-a-uuid"
    with pytest.raises(AssumptionCnfEngineError, match="session identity"):
        instance.run()
    assert fake.close_calls == 1
    assert not output.exists()


def test_malformed_campaign_is_rejected_before_session_creation(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, binding, _fake, factories = _make_engine(
        tmp_path, monkeypatch, [("UNKNOWN", None)]
    )
    crossed_profile = replace(binding.campaign, cells=binding.campaign.cells[:-1])
    crossed = replace(binding, campaign=crossed_profile)
    monkeypatch.setattr(engine, "bind_assumption_cnf", lambda *_args: crossed)
    with pytest.raises(AssumptionCnfEngineError, match="metadata failed closed"):
        instance.run()
    assert factories == []
    assert not output.exists()


def test_inspect_rejects_receipt_and_semantic_digest_crossing(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("SAT", None)]
    )
    instance.run()
    envelope = json.loads(output.read_bytes())
    clean = json.loads(json.dumps(envelope))
    envelope["cells"][0]["receipt"]["core"] = [290]
    _rewrite(output, envelope)
    with pytest.raises(AssumptionCnfEngineError, match="result/receipt"):
        inspect_assumption_cnf_engine_output(output)
    clean["cells"][0]["semantic_result_sha256"] = "0" * 64
    _rewrite(output, clean)
    with pytest.raises(AssumptionCnfEngineError, match="semantic replay result"):
        inspect_assumption_cnf_engine_output(output)


def test_inspect_rejects_rehashed_noncanonical_unsat_core(
    tmp_path: Path, monkeypatch
) -> None:
    instance, output, _binding, _fake, _ = _make_engine(
        tmp_path, monkeypatch, [("UNSAT", (0,))]
    )
    instance.run()
    envelope = json.loads(output.read_bytes())
    literal = envelope["cells"][0]["core"][0]
    envelope["cells"][0]["core"] = [literal, literal]
    envelope["cells"][0]["receipt"]["core"] = [literal, literal]
    _rewrite(output, envelope)
    with pytest.raises(AssumptionCnfEngineError, match="canonical assumption subset"):
        inspect_assumption_cnf_engine_output(output)


def test_recapture_fails_closed_when_source_parent_disappears(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    _control, binding = _fixture(tmp_path)
    crossed = replace(
        binding,
        source_parent_path=(tmp_path / "package" / "source-parent.cnf").resolve(),
        source_parent_identity=binding.parent_identity,
    )
    calls = 0

    def recapture(_path: Path) -> CnfStreamIdentity:
        nonlocal calls
        calls += 1
        if calls == 1:
            return binding.parent_identity
        raise OSError("source parent is missing or symlinked")

    monkeypatch.setattr(engine, "stream_parent_identity", recapture)
    with pytest.raises(
        AssumptionCnfEngineError, match="source-parent CNF recapture failed"
    ):
        engine._recapture_parent(crossed)
