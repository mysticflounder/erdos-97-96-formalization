import hashlib
import itertools

import pytest

from census.p97_search.freshthird_qfiber_three_carrier_cnf_v1 import (
    FreshThirdCarrierCnfEncoding,
    FreshThirdCarrierCnfError,
    _canonical_json,
)
from census.p97_search.freshthird_qfiber_three_carrier_query_v1 import (
    FALSE_CLAIMS,
    RESULT_SCHEMA,
    ROLES,
    source_manifest,
)
from census.p97_search.freshthird_qfiber_three_carrier_source_total_v3 import (
    CAP_COUNT,
    CLAUSE_TAGS,
    CONSTRAINT_GROUPS,
    PHASE_COUNT,
    PROFILE,
    QUERY_SCHEMA,
    SCHEMA,
    FreshThirdCarrierSourceTotalCnfEncoding,
    direct_forbidden_instance_count,
    dry_run_manifest,
    monotone_phase_witness,
)


def _clauses_hold(
    clauses: tuple[tuple[int, ...], ...], values: dict[int, bool]
) -> bool:
    return all(
        any(values[abs(literal)] == (literal > 0) for literal in clause)
        for clause in clauses
    )


def _result_stub(
    encoding: FreshThirdCarrierSourceTotalCnfEncoding,
    signature: dict[str, object] | None = None,
) -> dict[str, object]:
    signature = {} if signature is None else signature
    manifest = encoding.encoding_manifest()
    return {
        "schema": RESULT_SCHEMA,
        "query_schema": QUERY_SCHEMA,
        "boundary_index": encoding.boundary_index,
        "source_manifest_sha256": hashlib.sha256(
            _canonical_json(source_manifest())
        ).hexdigest(),
        "constraint_groups": list(CONSTRAINT_GROUPS),
        "encoding_manifest": manifest,
        "encoding_manifest_sha256": hashlib.sha256(
            _canonical_json(manifest)
        ).hexdigest(),
        "status": "SAT_ABSTRACTION",
        "model_signature": signature,
        "model_signature_sha256": hashlib.sha256(
            _canonical_json(signature)
        ).hexdigest(),
        "claims": FALSE_CLAIMS,
    }


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


def test_membership_xor_clauses_have_the_exact_truth_table() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(0)
    start = encoding.cap_start(0)
    middle = encoding.cap_phase(ROLES[0], 0, 1)
    member = encoding.in_cap(ROLES[0], 0)
    clauses = (
        (start, middle, -member),
        (start, -middle, member),
        (-start, middle, member),
        (-start, -middle, -member),
    )
    assert all(clause in encoding.clauses for clause in clauses)
    for start_value, middle_value, member_value in itertools.product(
        (False, True), repeat=3
    ):
        values = {
            start: start_value,
            middle: middle_value,
            member: member_value,
        }
        assert _clauses_hold(clauses, values) == (
            member_value == (start_value ^ middle_value)
        )


def test_same_and_before_clauses_match_phase_semantics() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(0)
    left, right = ROLES[:2]
    same = encoding.same(left, right)
    before = encoding.before(left, right)

    for phase in range(PHASE_COUNT):
        left_phase = encoding.cap_phase(left, 0, phase)
        right_phase = encoding.cap_phase(right, 0, phase)
        clauses = (
            (-same, -left_phase, right_phase),
            (-same, left_phase, -right_phase),
        )
        assert all(clause in encoding.clauses for clause in clauses)
        for same_value, left_value, right_value in itertools.product(
            (False, True), repeat=3
        ):
            values = {
                same: same_value,
                left_phase: left_value,
                right_phase: right_value,
            }
            assert _clauses_hold(clauses, values) == (
                not same_value or left_value == right_value
            )

    monotone_clauses = tuple(
        (
            -before,
            -encoding.cap_phase(left, 0, left_phase),
            -encoding.cap_phase(right, 0, right_phase),
        )
        for left_phase in range(PHASE_COUNT)
        for right_phase in range(left_phase)
    )
    assert all(clause in encoding.clauses for clause in monotone_clauses)
    for before_value in (False, True):
        for left_value, right_value in itertools.product(
            range(PHASE_COUNT), repeat=2
        ):
            values = {before: before_value}
            values.update(
                {
                    encoding.cap_phase(left, 0, phase): phase == left_value
                    for phase in range(PHASE_COUNT)
                }
            )
            values.update(
                {
                    encoding.cap_phase(right, 0, phase): phase == right_value
                    for phase in range(PHASE_COUNT)
                }
            )
            assert _clauses_hold(monotone_clauses, values) == (
                not before_value or left_value <= right_value
            )


def test_source_total_manifest_is_fresh_and_imports_no_learned_stream() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(1)
    manifest = encoding.encoding_manifest()
    variable_map = encoding.variable_map()

    assert manifest["schema"] == SCHEMA
    assert manifest["profile"] == PROFILE
    assert manifest["learned_stream_imported"] is False
    assert manifest["logical_forbidden_instances"] == direct_forbidden_instance_count()
    assert set(CLAUSE_TAGS).issubset(manifest["clause_counts"])
    assert manifest["clause_counts"].keys() == encoding.clause_counts.keys()
    assert CONSTRAINT_GROUPS[-1] == "source_total_no_alternating_cap"
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


@pytest.mark.parametrize(
    ("field", "bad_value", "message"),
    (
        ("schema", "tampered", "schema mismatch"),
        ("boundary_index", 3, "boundary index mismatch"),
        ("constraint_groups", [], "constraint groups mismatch"),
        ("encoding_manifest_sha256", "0" * 64, "encoding manifest hash mismatch"),
    ),
)
def test_replay_rejects_metadata_tampering(
    field: str, bad_value: object, message: str
) -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(0)
    result = _result_stub(encoding)
    result[field] = bad_value
    replay = encoding.replay_result(result, timeout_ms=100)
    assert replay.accepted is False
    assert message in replay.detail


def test_replay_explicitly_rejects_an_alternating_cap_signature() -> None:
    encoding = FreshThirdCarrierSourceTotalCnfEncoding(0)
    signature: dict[str, object] = {
        "point_classes": {role: index for index, role in enumerate(ROLES)},
        "order": {role: index for index, role in enumerate(ROLES)},
        "in_cap": {role: [False, False, False] for role in ROLES},
    }
    in_cap = signature["in_cap"]
    assert type(in_cap) is dict
    for index, role in enumerate(ROLES[:4]):
        in_cap[role][0] = index % 2 == 0

    replay = encoding.replay_result(_result_stub(encoding, signature), timeout_ms=100)
    assert replay.accepted is False
    assert replay.detail == "source-total replay found an alternating cap"


def test_direct_instance_count_rejects_negative_role_count() -> None:
    with pytest.raises(ValueError, match="nonnegative"):
        direct_forbidden_instance_count(-1)
