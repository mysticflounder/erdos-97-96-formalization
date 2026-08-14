from __future__ import annotations

import hashlib
import json
from dataclasses import FrozenInstanceError, dataclass, replace
from pathlib import Path

import pytest

from census.p97_search import cegar_wave_assumption_profiles as profiles
from census.p97_search.cegar_wave_assumption_profiles import (
    CHILD44_PROFILE_ID,
    CHILD44_SCHEMA,
    AssumptionProfileError,
    assumption_campaign_metadata,
    parse_assumption_campaign_profile,
    replay_sat,
)

ROOT = Path(__file__).resolve().parents[3]
PROFILE_PATH = ROOT / "census/p97_search/exact17_child44_nextcenter_cells_v1.json"


def _raw() -> bytes:
    return PROFILE_PATH.read_bytes()


def _payload() -> dict[str, object]:
    return json.loads(_raw())


def _encoded(payload: dict[str, object]) -> bytes:
    return json.dumps(payload, sort_keys=True, separators=(",", ":")).encode("ascii")


def _profile():
    return parse_assumption_campaign_profile(_raw())


@dataclass(frozen=True)
class _Source:
    rows: tuple[tuple[int, ...], ...]
    next_center: int


@dataclass(frozen=True)
class _Evidence:
    status: str
    exact_evidence: bytes


@dataclass(frozen=True)
class _Replay:
    schema: str
    cell_id: str
    assumptions: tuple[int, ...]
    parent_sha256: str
    parent_bytes: int
    parent_variables: int
    parent_clauses: int
    assignment_sha256: str
    source_model: _Source
    kalmanson: _Evidence
    result_sha256: str


def _fake_result(profile, cell, assignment):
    return _Replay(
        schema="p97-exact17-child44-assumption-sat-replay/v1",
        cell_id=cell.id,
        assumptions=cell.assumptions,
        parent_sha256=profile.parent_sha256,
        parent_bytes=profile.parent_byte_count,
        parent_variables=profile.variables,
        parent_clauses=profile.clauses,
        assignment_sha256=hashlib.sha256(b"assignment").hexdigest(),
        source_model=_Source(rows=((1, 2, 3, 4),), next_center=cell.next_center),
        kalmanson=_Evidence(
            status="LINEARLY_INFEASIBLE", exact_evidence=b'{"ok":true}'
        ),
        result_sha256=hashlib.sha256(b"result").hexdigest(),
    )


def test_parses_reviewed_profile_and_binds_exact_raw_digest() -> None:
    profile = _profile()
    assert profile.schema == CHILD44_SCHEMA
    assert profile.profile_id == CHILD44_PROFILE_ID
    assert profile.raw_sha256 == hashlib.sha256(_raw()).hexdigest()
    assert profile.variables == 308
    assert profile.clauses == 5_848_820
    assert profile.parent_byte_count == 291_704_790
    assert tuple(cell.next_center for cell in profile.cells) == (
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        12,
        13,
        14,
        15,
        16,
    )


def test_optional_canary_is_not_required_or_retained() -> None:
    payload = _payload()
    del payload["first_canary"]
    profile = parse_assumption_campaign_profile(_encoded(payload))
    metadata = assumption_campaign_metadata(profile)
    assert "first_canary" not in metadata
    assert "path" not in repr(metadata)


def test_duplicate_json_key_is_rejected_before_schema_dispatch() -> None:
    raw = b'{"schema":"p97-exact17-child44-nextcenter-cells/v1","schema":"x"}'
    with pytest.raises(AssumptionProfileError, match="duplicate JSON key: schema"):
        parse_assumption_campaign_profile(raw)


@pytest.mark.parametrize(
    ("mutation", "message"),
    [
        (lambda value: value.__setitem__("extra", 1), "profile keys drifted"),
        (
            lambda value: value["parent"].__setitem__("variables", True),
            "parent.variables must be a positive builtin int",
        ),
        (
            lambda value: value["solver"].__setitem__("timeout_ms", False),
            "solver.timeout_ms must be a positive builtin int",
        ),
        (
            lambda value: value["cells"][0].__setitem__("assumptions", [True]),
            "assumptions.*builtin int",
        ),
    ],
)
def test_exact_keys_and_builtin_types_are_enforced(mutation, message: str) -> None:
    payload = _payload()
    mutation(payload)
    with pytest.raises(AssumptionProfileError, match=message):
        parse_assumption_campaign_profile(_encoded(payload))


def test_unknown_schema_is_rejected_by_closed_registry() -> None:
    payload = _payload()
    payload["schema"] = "p97-user-import-callback/v1"
    with pytest.raises(
        AssumptionProfileError, match="unknown assumption campaign schema"
    ):
        parse_assumption_campaign_profile(_encoded(payload))


def test_cell_order_and_complete_coverage_are_closed() -> None:
    payload = _payload()
    payload["cells"][0], payload["cells"][1] = payload["cells"][1], payload["cells"][0]
    with pytest.raises(AssumptionProfileError, match="canonical ordered"):
        parse_assumption_campaign_profile(_encoded(payload))


def test_duplicate_cell_identity_is_rejected() -> None:
    payload = _payload()
    payload["cells"][1] = payload["cells"][0]
    with pytest.raises(AssumptionProfileError, match="canonical ordered"):
        parse_assumption_campaign_profile(_encoded(payload))


def test_identity_fields_are_exact_and_ordered() -> None:
    payload = _payload()
    payload["identity_fields"] = list(reversed(payload["identity_fields"]))
    with pytest.raises(AssumptionProfileError, match="identity fields drifted"):
        parse_assumption_campaign_profile(_encoded(payload))


def test_result_contract_cannot_promote_proofless_unsat() -> None:
    payload = _payload()
    payload["result_contract"]["unsat"] = "UNSAT closes the cell"
    with pytest.raises(AssumptionProfileError, match="finite/discovery-only"):
        parse_assumption_campaign_profile(_encoded(payload))


def test_metadata_is_canonical_and_retains_no_parent_bytes() -> None:
    metadata = assumption_campaign_metadata(_profile())
    assert metadata["parent"] == {
        "job_id": "f717c352-2456-412a-ae45-d910f47d3e94",
        "sha256": "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9",
        "producer_manifest_sha256": "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048",
        "variables": 308,
        "clauses": 5_848_820,
        "bytes": 291_704_790,
    }
    assert len(metadata["cells"]) == 13
    assert isinstance(json.dumps(metadata, sort_keys=True), str)


def test_constructed_profile_cannot_cross_registered_solver_identity() -> None:
    crossed = replace(_profile(), solver_sha256="0" * 64)
    with pytest.raises(AssumptionProfileError, match="not a registered reviewed value"):
        assumption_campaign_metadata(crossed)


def test_replay_uses_exact_public_callback_arguments_and_serializes(
    monkeypatch, tmp_path: Path
) -> None:
    profile = _profile()
    cell = profile.cells[0]
    assignment = tuple(range(1, 309))
    parent = (tmp_path / "parent.cnf").resolve()
    observed = {}

    def fake(**kwargs):
        observed.update(kwargs)
        return _fake_result(profile, cell, assignment)

    monkeypatch.setitem(profiles._REPLAY_REGISTRY, "child44", fake)
    envelope = replay_sat(
        profile,
        parent_cnf_path=parent,
        assignment=assignment,
        cell=cell,
    )
    assert observed == {
        "parent_cnf_path": parent,
        "assignment": assignment,
        "cell_id": "next-center-00",
        "assumptions": (290,),
        "expected_parent_sha256": profile.parent_sha256,
    }
    assert envelope["profile_sha256"] == profile.raw_sha256
    assert envelope["result"]["source_model"]["rows"] == [[1, 2, 3, 4]]
    assert envelope["result"]["kalmanson"]["exact_evidence"] == {
        "base64": "eyJvayI6dHJ1ZX0=",
        "sha256": hashlib.sha256(b'{"ok":true}').hexdigest(),
    }
    digest = envelope.pop("serialization_sha256")
    assert digest == hashlib.sha256(profiles.canonical_json_bytes(envelope)).hexdigest()


def test_replay_rejects_crossed_cell_before_callback(
    monkeypatch, tmp_path: Path
) -> None:
    profile = _profile()
    crossed = replace(profile.cells[0], assumptions=(291,))
    called = False

    def fake(**_kwargs):
        nonlocal called
        called = True

    monkeypatch.setitem(profiles._REPLAY_REGISTRY, "child44", fake)
    with pytest.raises(AssumptionProfileError, match="crossed"):
        replay_sat(
            profile,
            parent_cnf_path=(tmp_path / "parent.cnf").resolve(),
            assignment=tuple(range(1, 309)),
            cell=crossed,
        )
    assert not called


def test_replay_callback_exception_is_fail_closed(monkeypatch, tmp_path: Path) -> None:
    profile = _profile()

    def fail(**_kwargs):
        raise RuntimeError("decoder bug")

    monkeypatch.setitem(profiles._REPLAY_REGISTRY, "child44", fail)
    with pytest.raises(
        AssumptionProfileError, match="exact SAT replay failed"
    ) as caught:
        replay_sat(
            profile,
            parent_cnf_path=(tmp_path / "parent.cnf").resolve(),
            assignment=tuple(range(1, 309)),
            cell=profile.cells[0],
        )
    assert isinstance(caught.value.__cause__, RuntimeError)


def test_replay_rejects_crossed_result_identity(monkeypatch, tmp_path: Path) -> None:
    profile = _profile()
    cell = profile.cells[0]
    assignment = tuple(range(1, 309))
    crossed = replace(_fake_result(profile, cell, assignment), cell_id="next-center-01")
    monkeypatch.setitem(profiles._REPLAY_REGISTRY, "child44", lambda **_kwargs: crossed)
    with pytest.raises(AssumptionProfileError, match="result crossed"):
        replay_sat(
            profile,
            parent_cnf_path=(tmp_path / "parent.cnf").resolve(),
            assignment=assignment,
            cell=cell,
        )


def test_replay_rejects_non_total_or_bool_assignments(tmp_path: Path) -> None:
    profile = _profile()
    for assignment in (tuple(range(1, 308)), (True,) + tuple(range(2, 309))):
        with pytest.raises(AssumptionProfileError, match="canonical total"):
            replay_sat(
                profile,
                parent_cnf_path=(tmp_path / "parent.cnf").resolve(),
                assignment=assignment,
                cell=profile.cells[0],
            )


def test_profile_and_cells_are_frozen() -> None:
    profile = _profile()
    with pytest.raises(FrozenInstanceError):
        profile.variables = 1
    with pytest.raises(FrozenInstanceError):
        profile.cells[0].assumptions = (1,)
    assert isinstance(profile.cells, tuple)
    assert isinstance(profile.result_contract, tuple)
