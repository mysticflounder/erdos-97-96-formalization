import itertools

import pytest

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import ROLES
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    CAP_COUNT,
    PHASE_COUNT,
    PROFILE,
    SCHEMA,
    FreshThirdCarrierSourceTotalCnfEncoding,
    direct_forbidden_instance_count,
    dry_run_manifest,
    monotone_phase_witness,
)


def _contains_alternating_subsequence(values: tuple[bool, ...]) -> bool:
    return any(
        values[a] == values[c] and values[b] == values[d] and values[a] != values[b]
        for a, b, c, d in itertools.combinations(range(len(values)), 4)
    )


def test_monotone_phase_witness_is_exact_through_eight_roles() -> None:
    for size in range(9):
        for values in itertools.product((False, True), repeat=size):
            witness = monotone_phase_witness(values)
            assert (witness is None) == _contains_alternating_subsequence(values)
            if witness is None:
                continue
            start, phases = witness
            assert list(phases) == sorted(phases)
            assert all(phase in range(PHASE_COUNT) for phase in phases)
            assert tuple(start ^ (phase == 1) for phase in phases) == values


def test_monotone_phase_witness_rejects_non_booleans() -> None:
    with pytest.raises(TypeError, match="only bool"):
        monotone_phase_witness((False, 1))  # type: ignore[arg-type]


def test_source_total_clause_and_variable_budget() -> None:
    base = FreshThirdCarrierCnfEncoding(0)
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(0)
    role_count = len(ROLES)
    expected_aux_variables = CAP_COUNT + role_count * CAP_COUNT * PHASE_COUNT
    expected_exact = role_count * CAP_COUNT * 4
    expected_membership = role_count * CAP_COUNT * 4
    expected_same = role_count * (role_count - 1) // 2 * CAP_COUNT * PHASE_COUNT * 2
    expected_monotone = role_count * (role_count - 1) * CAP_COUNT * 3

    assert encoding.num_vars == base.num_vars + expected_aux_variables
    assert encoding.clause_counts["NOALT-PHASE-EXACT"] == expected_exact
    assert encoding.clause_counts["NOALT-MEMBERSHIP"] == expected_membership
    assert encoding.clause_counts["NOALT-SAME"] == expected_same
    assert encoding.clause_counts["NOALT-MONOTONE"] == expected_monotone
    assert len(encoding.clauses) == len(base.clauses) + (
        expected_exact + expected_membership + expected_same + expected_monotone
    )


def test_source_total_manifest_is_fresh_and_imports_no_learned_stream() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(1)
    manifest = encoding.encoding_manifest()
    variable_map = encoding.variable_map()

    assert manifest["schema"] == SCHEMA
    assert manifest["profile"] == PROFILE
    assert manifest["learned_stream_imported"] is False
    assert manifest["logical_forbidden_instances"] == direct_forbidden_instance_count()
    assert variable_map["schema"] == SCHEMA
    assert variable_map["num_variables"] == encoding.num_vars


def test_dry_run_manifest_is_launch_blocked() -> None:
    manifest = dry_run_manifest(2)
    assert manifest["launch_eligible"] is False
    assert manifest["encoding"]["boundary_index"] == 2


def test_source_total_schema_rejects_iterative_cuts() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(3)
    with pytest.raises(FreshThirdCarrierCnfError, match="rejects iterative"):
        encoding.cnf_bytes(((1,),))


def test_direct_instance_count_rejects_negative_role_count() -> None:
    with pytest.raises(ValueError, match="nonnegative"):
        direct_forbidden_instance_count(-1)
