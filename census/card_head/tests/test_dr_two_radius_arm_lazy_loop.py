"""Tests for the pure parts of the D-R card-13 arm lazy-core loop (no piqc calls)."""

from __future__ import annotations

from functools import cache

import numpy as np

from census.card_head import dr_two_radius_arm_lazy_loop as loop
from census.card_head import dr_two_radius_arm_structural as arm

SIX_LABEL_CORE = "six_point_two_circle_order"
PROFILE = arm.profile_for(13, "secondOpposite")


@cache
def _eager_build():
    """Generic card-13 CNF whose only selectable family is the six-label core (built once)."""

    cnf, layout = arm.build(PROFILE, mode="generic", families=(SIX_LABEL_CORE,), ingress=False)
    eager = {clause for family, clause in zip(cnf.families, cnf.clauses, strict=True) if family == SIX_LABEL_CORE}
    return cnf, layout, eager


def _equal(layout: arm.Layout):
    def equal(first: int, second: int) -> int:
        return layout.relation_variables[(min(first, second), max(first, second))]

    return equal


def _same(layout: arm.Layout):
    edge_index = arm._tables(layout.profile).edge_index
    equal = _equal(layout)

    def same(center: int, a: int, b: int) -> int:
        return equal(edge_index[(min(center, a), max(center, a))], edge_index[(min(center, b), max(center, b))])

    return same


def test_generic_cores_are_all_checked() -> None:
    assert len(arm.GENERIC_CORES) == len(arm.EAGER_CORES) + len(arm.LAZY_CORES)
    assert SIX_LABEL_CORE in arm.EAGER_CORES
    assert len(arm.GENERIC_CORES[SIX_LABEL_CORE]["labels"]) == 6


def test_violated_instance_clause_is_the_eager_clause() -> None:
    cnf, layout, eager = _eager_build()
    assert eager
    instance = tuple(int(v) for v in arm.core_instances(PROFILE, SIX_LABEL_CORE)[0])
    planted = arm.core_clause(PROFILE, SIX_LABEL_CORE, instance, _equal(layout))
    assignment = [-v for v in range(1, cnf.n_variables + 1)]
    for literal in planted:
        assignment[abs(literal) - 1] = abs(literal)
    matrix = arm.relation_matrix(layout, assignment)
    counts, clauses = loop.violated_clauses(layout, matrix)
    assert counts[SIX_LABEL_CORE] >= 1
    produced = clauses[SIX_LABEL_CORE]
    assert loop._normalize(planted) in produced
    # every lazy clause of the six-label core is an eager clause, byte for byte
    for clause in produced:
        assert clause in eager
    # and every produced clause is falsified by the model it came from
    truth = {abs(l): l > 0 for l in assignment}
    for name, cs in clauses.items():
        assert name in arm.GENERIC_CORES
        for clause in cs:
            assert not any(truth[abs(l)] == (l > 0) for l in clause)


def test_violated_clauses_dedupe_across_calls() -> None:
    cnf, layout, _ = _eager_build()
    instance = tuple(int(v) for v in arm.core_instances(PROFILE, SIX_LABEL_CORE)[0])
    planted = arm.core_clause(PROFILE, SIX_LABEL_CORE, instance, _equal(layout))
    assignment = [-v for v in range(1, cnf.n_variables + 1)]
    for literal in planted:
        assignment[abs(literal) - 1] = abs(literal)
    matrix = arm.relation_matrix(layout, assignment)
    seen: set[frozenset[int]] = set()
    _, first = loop.violated_clauses(layout, matrix, seen)
    _, second = loop.violated_clauses(layout, matrix, seen)
    assert first and not second


def _survivor_model():
    cnf, layout, _ = _eager_build()
    same = _same(layout)
    assignment = [-v for v in range(1, cnf.n_variables + 1)]

    def on(v: int) -> None:
        assignment[v - 1] = v

    x_members, y_members, u_members = (1, 6, 8, 9), (3, 7, 10, 11), (3, 6, 7, 8)
    for z in x_members:
        on(layout.x[z])
    for z in y_members:
        on(layout.y[z])
    for z in u_members:
        on(layout.u[z])
    chi = {z: (arm.A1 if z in u_members else 3) for z in PROFILE.labels}
    for z, c in chi.items():
        on(layout.chi[(z, c)])
    # classes: at A1 the class U; at 3 the class {0, 1, 2, 4} and the triple {5, 9, 10}
    for center, klass in ((arm.A1, u_members), (3, (0, 1, 2, 4)), (3, (5, 9, 10))):
        for a in klass:
            for b in klass:
                if a < b:
                    on(same(center, a, b))
    return cnf, layout, assignment, (x_members, y_members, u_members, chi)


def test_signature_encoding() -> None:
    _, layout, assignment, (x_members, y_members, u_members, chi) = _survivor_model()
    signature = loop.signature_of(layout, assignment)
    assert (signature.x, signature.y, signature.u) == (x_members, y_members, u_members)
    assert dict(signature.chi) == chi
    classes = dict(signature.classes)
    assert classes[arm.A1] == (u_members,)
    assert set(classes[3]) == {(0, 1, 2, 4), (5, 9, 10)}
    assert all(len(k) >= 3 for ks in classes.values() for k in ks)
    assert classes[arm.A2] == ()
    payload = signature.payload(PROFILE)
    assert payload["x"] == ["A1", "I1:6:q", "I2:8", "I2:9"]
    assert payload["u"] == ["Is:3", "I1:6:q", "I1:7:w", "I2:8"]
    assert payload["chi"]["A2"] == "Is:3" and payload["chi"]["I1:7:w"] == "A1"
    assert payload["classes"]["Is:3"] == [["A2", "A1", "A3", "Is:4"], ["Is:5", "I2:9", "I2:10"]]
    assert payload["classes"]["A2"] == []
    assert payload["raw"]["x"] == list(x_members)
    assert payload["raw"]["classes"]["3"] == [[0, 1, 2, 4], [5, 9, 10]]


def test_label_names_cover_the_profile() -> None:
    names = [loop.label_name(PROFILE, z) for z in PROFILE.labels]
    assert names[:3] == ["A2", "A1", "A3"]
    assert names[3:6] == ["Is:3", "Is:4", "Is:5"]
    assert names[6:8] == ["I1:6:q", "I1:7:w"]
    assert names[8:] == ["I2:8", "I2:9", "I2:10", "I2:11", "I2:12"]
    assert len(set(names)) == PROFILE.card


def test_blocking_clause_shape() -> None:
    _, layout, assignment, (x_members, y_members, u_members, _) = _survivor_model()
    signature = loop.signature_of(layout, assignment)
    clause = loop.blocking_clause(layout, signature)
    assert all(l < 0 for l in clause)
    assert len(clause) == len(x_members) + len(y_members) + len(u_members) + PROFILE.card
    assert clause == tuple(sorted(clause, key=abs))
    selectors = set(layout.x.values()) | set(layout.y.values()) | set(layout.u.values()) | set(layout.chi.values())
    assert {abs(l) for l in clause} <= selectors
    truth = {abs(l): l > 0 for l in assignment}
    # falsified by exactly this model ...
    assert not any(truth[abs(l)] == (l > 0) for l in clause)
    # ... and satisfied once one pinned selector flips
    flipped = dict(truth)
    flipped[abs(clause[0])] = False
    assert any(flipped[abs(l)] == (l > 0) for l in clause)


def test_relation_matrix_is_symmetric_boolean() -> None:
    _, layout, assignment, _ = _survivor_model()
    matrix = arm.relation_matrix(layout, assignment)
    assert matrix.dtype == np.bool_
    assert np.array_equal(matrix, matrix.T)
    assert matrix.shape == (len(layout.edges), len(layout.edges))
