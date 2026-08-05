from __future__ import annotations

import json

import pytest
import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v35 as v35
import v37_endpoint_frontier_adjacent_singleton_pilot as v37
import v38_pinned_seed_center_multiplicity_canary as v38
import z3


@pytest.fixture(scope="module")
def encoding() -> v38.Encoding:
    return v38.Encoding(
        v35.Case("fresh", "DDD", 0, 2, 1),
        timeout_ms=10_000,
        seed=1,
        pairwise=True,
        force_producer=True,
    )


@pytest.fixture(scope="module")
def predecessor() -> v37.Encoding:
    return v37.Encoding(
        v35.Case("fresh", "DDD", 0, 2, 1),
        timeout_ms=1_000,
        seed=1,
        pairwise=True,
        force_producer=True,
    )


@pytest.fixture(scope="module")
def full_solver(encoding: v38.Encoding) -> z3.Solver:
    solver, _smt2 = encoding.make_solver()
    return solver


def constraint_sequence(encoding: v8.Encoding) -> list[z3.BoolRef]:
    return [
        constraint
        for constraints in encoding.groups.values()
        for constraint in constraints
    ]


def test_exact_pinned_center_and_physical_shell_inventory(
    encoding: v38.Encoding,
) -> None:
    assert len(encoding.endpoint_seed_center) == 15
    assert {
        str(pin) for pin in encoding.endpoint_seed_center.values()
    } == {f"endpoint_seed_center_{center}" for center in range(15)}
    assert len(encoding.groups[v38.PINNED_CENTER_FAMILY]) == 16
    assert len(encoding.endpoint_seed_shell_caps) == 210
    assert len(encoding.groups[v38.PINNED_SHELL_CAP_FAMILY]) == 210
    assert all(
        center != representative
        for center, representative in encoding.endpoint_seed_shell_caps
    )
    assert all(
        "Real" in v12.free_constant_sort_names(constraint)
        for constraint in encoding.groups[v38.PINNED_SHELL_CAP_FAMILY]
    )

    pins = list(encoding.endpoint_seed_center.values())
    selector_constraints = encoding.groups[v38.PINNED_CENTER_FAMILY]
    assert selector_constraints[0].sexpr() == v8.exactly(pins, 1).sexpr()
    expected_memberships = {
        z3.Implies(pin, encoding.endpoint_seed[center]).sexpr()
        for center, pin in encoding.endpoint_seed_center.items()
    }
    assert {constraint.sexpr() for constraint in selector_constraints[1:]} == (
        expected_memberships
    )

    expected_caps = {}
    for center, pinned in encoding.endpoint_seed_center.items():
        for representative in v8.POINTS:
            if representative == center:
                continue
            members = [
                z3.And(
                    encoding.endpoint_seed[point],
                    encoding.d(center, point)
                    == encoding.d(center, representative),
                )
                for point in v8.POINTS
                if point != center
            ]
            expected_caps[center, representative] = z3.Implies(
                pinned, v8.at_most(members, 3)
            ).sexpr()
    assert {
        key: constraint.sexpr()
        for key, constraint in encoding.endpoint_seed_shell_caps.items()
    } == expected_caps


def test_semantic_boolean_delta_is_exactly_the_fifteen_pins(
    encoding: v38.Encoding,
    predecessor: v37.Encoding,
) -> None:
    old_names = {
        str(bit)
        for bit in v16.collect_semantic_bools(constraint_sequence(predecessor))
    }
    new_names = {
        str(bit)
        for bit in v16.collect_semantic_bools(constraint_sequence(encoding))
    }
    assert len(old_names) == 1_076
    assert len(new_names) == 1_091
    assert new_names - old_names == {
        f"endpoint_seed_center_{center}" for center in v8.POINTS
    }


def test_trackers_and_worktree_provenance_are_exact(
    encoding: v38.Encoding,
    predecessor: v37.Encoding,
    full_solver: z3.Solver,
) -> None:
    predecessor_solver, _predecessor_smt2 = predecessor.make_solver()
    expected = v38.expected_tracker_names(encoding)
    actual = v38.tracker_names(full_solver)
    predecessor_trackers = v38.tracker_names(predecessor_solver)
    assert actual == expected
    assert actual == predecessor_trackers | {
        f"track_{v38.PINNED_CENTER_FAMILY}",
        f"track_{v38.PINNED_SHELL_CAP_FAMILY}",
    }
    assert len(actual) == len(predecessor_trackers) + 2
    assert f"track_{v38.PINNED_CENTER_FAMILY}" in actual
    assert f"track_{v38.PINNED_SHELL_CAP_FAMILY}" in actual

    provenance = v38.source_provenance()
    assert provenance["schema_version"] == 38
    assert v38.verify_source_provenance(provenance) == provenance
    schema = json.loads(v38.SCHEMA_PATH.read_text())
    assert schema["schema_version"] == 38
    assert schema["new_family_counts"] == provenance["new_family_counts"]
    assert schema["lean_theorems"] == provenance["lean_theorems"]


def test_pinned_center_excludes_first_apex_and_shared_blocker(
    encoding: v38.Encoding,
    full_solver: z3.Solver,
) -> None:
    full_solver.push()
    full_solver.add(encoding.endpoint_seed_center[v8.APICES[0]])
    assert full_solver.check() == z3.unsat
    full_solver.pop()

    kept = encoding.case.kept
    full_solver.push()
    full_solver.add(
        z3.Or(
            *(
                z3.And(
                    encoding.endpoint_seed_center[center],
                    encoding.block[kept, center],
                )
                for center in v8.POINTS
            )
        )
    )
    assert full_solver.check() == z3.unsat
    full_solver.pop()


def test_boolean_relaxation_excludes_every_physical_shell_cap(
    encoding: v38.Encoding,
    predecessor: v37.Encoding,
) -> None:
    _solver, audit = v12.build_boolean_relaxation(
        encoding, timeout_ms=1_000, seed=1
    )
    _old_solver, old_audit = v12.build_boolean_relaxation(
        predecessor, timeout_ms=1_000, seed=1
    )
    assert audit.included_by_family[v38.PINNED_CENTER_FAMILY] == 16
    assert audit.included_by_family.get(v38.PINNED_SHELL_CAP_FAMILY, 0) == 0
    assert audit.excluded_by_family[v38.PINNED_SHELL_CAP_FAMILY] == 210
    assert audit.included_total == 8_937
    assert audit.included_total - old_audit.included_total == 16
    assert audit.excluded_total - old_audit.excluded_total == 210
    assert (
        audit.excluded_sort_counts["Real"]
        - old_audit.excluded_sort_counts["Real"]
        == 210
    )


def test_cli_is_bounded_to_one_short_canonical_case() -> None:
    args = v38.parser().parse_args([])
    assert args.timeout_ms == 20_000
    assert v38.CANONICAL_CASE.case_id == "fresh_DDD_k0_d2_f1"
    with pytest.raises(ValueError, match="timeout must be between"):
        v38.probe_canonical_case(0)
    with pytest.raises(ValueError, match="timeout must be between"):
        v38.probe_canonical_case(v38.MAX_DIAGNOSTIC_TIMEOUT_MS + 1)
