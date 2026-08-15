from __future__ import annotations

import hashlib
import shutil
import subprocess
from pathlib import Path

import pytest

import census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 as cnf_module
from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    CAP_ALTERNATION_SOURCE_THEOREM,
    CNF_SCHEMA,
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    BLOCKER_CENTERS,
    BOUNDARY_FAN_BLOCKER_CENTERS,
    ROLES,
    ROWS,
)


@pytest.fixture(scope="module")
def encoding() -> FreshThirdCarrierCnfEncoding:
    return FreshThirdCarrierCnfEncoding(0)


def _cap_signature(bits: tuple[bool, ...]) -> dict[str, object]:
    assert len(bits) == len(ROLES)
    return {
        "point_classes": {role: i for i, role in enumerate(ROLES)},
        "order": {role: i for i, role in enumerate(ROLES)},
        "in_cap": {
            role: [bits[i], not bits[i], False] for i, role in enumerate(ROLES)
        },
    }


def test_boundary_index_is_fail_closed() -> None:
    with pytest.raises(FreshThirdCarrierCnfError, match="boundary_index"):
        FreshThirdCarrierCnfEncoding(4)


def test_cnf_and_variable_map_are_deterministic(
    encoding: FreshThirdCarrierCnfEncoding,
) -> None:
    raw = encoding.cnf_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    duplicate = FreshThirdCarrierCnfEncoding(0)
    assert hashlib.sha256(duplicate.cnf_bytes()).hexdigest() == digest
    assert raw.startswith(
        f"c {CNF_SCHEMA} boundary-index=0\np cnf ".encode("ascii")
    )
    variable_map = encoding.variable_map()
    assert variable_map["num_variables"] == encoding.num_vars
    assert variable_map["semantic_variables"] == len(encoding.semantic_vars)
    assert variable_map["variables"]["1"] == ["same", 0, 0]


def test_cap_alternation_cut_is_semantic_and_source_named(
    encoding: FreshThirdCarrierCnfEncoding,
) -> None:
    bits = (True, False, True, False, *(False for _ in ROLES[4:]))
    signature = _cap_signature(bits)
    refinement = encoding.cap_alternation_refinement_from_signature(signature)
    assert refinement is not None
    assert refinement.cap == 0
    assert refinement.roles == ROLES[:4]
    assert refinement.membership == (True, False, True, False)
    assert len(refinement.clause) == 7
    assert all(abs(lit) in encoding.semantic_vars for lit in refinement.clause)
    assert refinement.record()["source_theorem"] == CAP_ALTERNATION_SOURCE_THEOREM


def test_wraparound_cap_interval_does_not_generate_a_cut(
    encoding: FreshThirdCarrierCnfEncoding,
) -> None:
    bits = tuple(i < 2 or i >= len(ROLES) - 2 for i in range(len(ROLES)))
    assert (
        encoding.cap_alternation_refinement_from_signature(_cap_signature(bits))
        is None
    )


def test_external_clause_literals_are_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
) -> None:
    with pytest.raises(FreshThirdCarrierCnfError, match="external clause"):
        encoding.cnf_bytes(((0,),))
    with pytest.raises(FreshThirdCarrierCnfError, match="external clause"):
        encoding.cnf_bytes(((encoding.num_vars + 1,),))


def test_result_metadata_is_fail_closed(
    encoding: FreshThirdCarrierCnfEncoding,
) -> None:
    replay = encoding.replay_result({})
    assert replay.accepted is False
    assert replay.detail == "result schema mismatch"


def test_semantic_replay_rejection_stays_rejected(
    monkeypatch: pytest.MonkeyPatch, encoding: FreshThirdCarrierCnfEncoding
) -> None:
    monkeypatch.setattr(encoding, "_validate_result_metadata", lambda _result: None)

    def reject(_result: object, *, timeout_ms: int) -> None:
        del timeout_ms
        raise ValueError("independent replay rejected")

    monkeypatch.setattr(cnf_module, "replay_sat_result", reject)
    replay = encoding.replay_result({})
    assert replay.accepted is False
    assert replay.detail == "independent replay rejected"


def test_cadical_model_decodes_and_validates(
    tmp_path: Path, encoding: FreshThirdCarrierCnfEncoding
) -> None:
    cadical = shutil.which("cadical")
    if cadical is None:
        pytest.skip("CaDiCaL is not installed")
    cnf_path = tmp_path / "cell-0.cnf"
    cnf_path.write_bytes(encoding.cnf_bytes())
    result = subprocess.run(
        [cadical, "-q", "-t", "30", str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=35,
        check=False,
    )
    assert result.returncode == 10
    assignment: dict[int, bool] = {}
    for line in result.stdout.splitlines():
        if line.startswith("v "):
            for token in line.split()[1:]:
                literal = int(token)
                if literal:
                    assignment[abs(literal)] = literal > 0
    encoding.validate(assignment)
    signature = encoding.model_signature(assignment)
    assert set(signature["point_classes"]) == set(ROLES)
    assert set(signature["order"]) == set(ROLES)
    assert set(signature["radius_classes"]) == {
        center for _origin, _slots, center in ROWS.values()
    }
    assert set(signature["has_four_after_deleting"]) == {
        "pinnedCenter",
        *BLOCKER_CENTERS,
        "freshCenter",
        "boundaryBlockerCenter",
        *BOUNDARY_FAN_BLOCKER_CENTERS,
    }
    assert len(encoding.blocking_clause(assignment)) == len(encoding.semantic_vars)
    result_record = encoding.result_from_assignment(assignment)
    manifest = result_record["encoding_manifest"]
    assert manifest["cnf_sha256"] == hashlib.sha256(encoding.cnf_bytes()).hexdigest()
    assert manifest["variable_map_sha256"] == hashlib.sha256(
        cnf_module._canonical_json(encoding.variable_map())
    ).hexdigest()
