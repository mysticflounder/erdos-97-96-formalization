from __future__ import annotations

import unittest
from dataclasses import replace
from itertools import islice

from census.card_head.b1_exact12_static_equality import (
    canonical_extension_assignment,
    canonical_extension_satisfies_delta,
    install_static_equality_extension,
)
from census.card_head.b1_exact12_static_geometry import (
    EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
    EXPECTED_GEOMETRY_CLAUSES,
    EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES,
    EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES,
    EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES,
    EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES,
    EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES,
    SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES,
    SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES,
    SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES,
    SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES,
    SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES,
    SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES,
    STATIC_GEOMETRY_SCHEMA,
    B1Exact12StaticGeometryError,
    canonical_geometry_satisfies_delta,
    install_static_geometry_extension,
)
from census.card_head.b1_exact12_structural import (
    B1SourceSafeCoverInstance,
    cells,
    compile_cell,
    source_safe_cube_ok,
)
from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import CoverInstance

PROFILE = (5, 5, 5)
WAVE_FOUR_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 6, 8),
    6: (0, 1, 8, 11),
    7: (0, 5, 9, 11),
    8: (1, 7, 9, 11),
    9: (2, 5, 10, 11),
    10: (2, 7, 8, 9),
    11: (2, 3, 8, 10),
}
WAVE_SEVEN_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 7, 9),
    6: (0, 1, 5, 11),
    7: (0, 6, 8, 10),
    8: (1, 2, 7, 9),
    9: (1, 4, 8, 11),
    10: (2, 5, 8, 9),
    11: (3, 4, 7, 8),
}
WAVE_NINE_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 7, 9),
    6: (0, 1, 5, 11),
    7: (0, 8, 10, 11),
    8: (1, 2, 7, 9),
    9: (1, 4, 10, 11),
    10: (2, 5, 8, 11),
    11: (2, 3, 8, 9),
}
WAVE_ELEVEN_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 8, 9),
    6: (0, 1, 5, 11),
    7: (0, 8, 10, 11),
    8: (1, 2, 7, 9),
    9: (1, 4, 8, 10),
    10: (2, 5, 8, 11),
    11: (5, 6, 9, 10),
}
WAVE_THIRTEEN_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 8, 9),
    6: (0, 1, 5, 11),
    7: (0, 8, 10, 11),
    8: (1, 2, 7, 9),
    9: (1, 4, 8, 10),
    10: (3, 5, 7, 9),
    11: (2, 3, 5, 8),
}
WAVE_FIFTEEN_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 4, 8, 9),
    6: (0, 1, 5, 11),
    7: (0, 8, 10, 11),
    8: (1, 2, 7, 9),
    9: (1, 4, 10, 11),
    10: (2, 5, 8, 11),
    11: (2, 3, 8, 9),
}
WAVE_SEVENTEEN_CUBE = {
    0: (1, 3, 4, 6),
    1: (0, 2, 6, 7),
    2: (0, 1, 9, 10),
    3: (0, 2, 4, 5),
    4: (1, 5, 7, 8),
    5: (0, 7, 8, 9),
    6: (0, 1, 5, 11),
    7: (0, 8, 10, 11),
    8: (1, 2, 7, 9),
    9: (1, 4, 10, 11),
    10: (2, 5, 8, 11),
    11: (2, 3, 8, 9),
}


def wave_four_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_FOUR_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_seven_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_SEVEN_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_nine_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_NINE_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_eleven_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_ELEVEN_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_thirteen_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_THIRTEEN_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_fifteen_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_FIFTEEN_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def wave_seventeen_equality_fixture():
    cell = next(islice(cells(profiles=(PROFILE,), class_cards=(5,)), 1, 2))
    instance = B1SourceSafeCoverInstance.__new__(B1SourceSafeCoverInstance)
    CoverInstance.__init__(
        instance,
        build_model(12, PROFILE),
        candidate_provider=lambda _model, center: (WAVE_SEVENTEEN_CUBE[center],),
        cube_validator=source_safe_cube_ok,
    )
    compiled = compile_cell(instance, cell)
    equality_layout = install_static_equality_extension(instance, compiled)
    return instance, compiled, equality_layout


def qcritical_clause(equality_layout, labels):
    p, q, t1, t2, t3, a = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    pt1 = edge(p, t1)
    pt3 = edge(p, t3)
    return tuple(
        -relation(left, right)
        for left, right in (
            (pt1, pt3),
            (pt1, edge(p, q)),
            (pt1, edge(t1, t2)),
            (pt1, edge(t1, q)),
            (edge(t2, p), edge(t2, t1)),
            (pt3, edge(t3, t2)),
            (pt3, edge(t3, a)),
            (edge(a, p), edge(a, q)),
        )
    )


def anchor_clause(equality_layout, labels):
    p, q, t, u, v, a, b = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    pq = edge(p, q)
    up = edge(u, p)
    return tuple(
        -relation(left, right)
        for left, right in (
            (edge(p, u), pq),
            (edge(p, v), pq),
            (edge(p, a), pq),
            (edge(q, t), pq),
            (edge(q, a), pq),
            (edge(q, b), pq),
            (edge(t, q), edge(t, p)),
            (edge(u, t), up),
            (edge(u, v), up),
            (edge(v, b), edge(v, q)),
            (edge(b, a), edge(b, p)),
        )
    )


def interlock_clause(equality_layout, labels):
    p, q, t, u, v, a, b = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    pq = edge(p, q)
    up = edge(u, p)
    vq = edge(v, q)
    ap = edge(a, p)
    return tuple(
        -relation(left, right)
        for left, right in (
            (pq, edge(p, u)),
            (pq, edge(q, t)),
            (pq, edge(q, b)),
            (edge(t, p), edge(t, q)),
            (up, edge(u, t)),
            (up, edge(u, v)),
            (up, edge(u, a)),
            (vq, edge(v, a)),
            (vq, edge(v, b)),
            (ap, edge(a, v)),
            (ap, edge(a, b)),
        )
    )


def five_row_interlock_clause(equality_layout, labels):
    p, q, t, u, v, a = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    tp = edge(t, p)
    uq = edge(u, q)
    vq = edge(v, q)
    return tuple(
        -relation(left, right)
        for left, right in (
            (edge(q, p), edge(q, t)),
            (tp, edge(t, q)),
            (tp, edge(t, v)),
            (tp, edge(t, a)),
            (uq, edge(u, t)),
            (uq, edge(u, v)),
            (vq, edge(v, u)),
            (vq, edge(v, a)),
            (edge(a, t), edge(a, u)),
        )
    )


def seven_row_interlock_clause(equality_layout, labels):
    p, q, t, u, v, a, b = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    pq = edge(p, q)
    uq = edge(u, q)
    aq = edge(a, q)
    bq = edge(b, q)
    return tuple(
        -relation(left, right)
        for left, right in (
            (pq, edge(p, u)),
            (pq, edge(q, t)),
            (pq, edge(q, v)),
            (edge(t, p), edge(t, b)),
            (uq, edge(u, v)),
            (uq, edge(u, a)),
            (edge(v, p), edge(v, a)),
            (aq, edge(a, t)),
            (aq, edge(a, b)),
            (bq, edge(b, u)),
            (bq, edge(b, a)),
        )
    )


def six_row_interlock_clause(equality_layout, labels):
    p, q, t, u, a, b = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    qp = edge(q, p)
    aq = edge(a, q)
    return tuple(
        -relation(left, right)
        for left, right in (
            (qp, edge(q, a)),
            (qp, edge(q, t)),
            (edge(p, q), edge(p, u)),
            (edge(u, q), edge(u, p)),
            (aq, edge(a, u)),
            (aq, edge(a, t)),
            (aq, edge(a, b)),
            (edge(t, p), edge(t, b)),
            (edge(b, q), edge(b, t)),
        )
    )


def equilateral_median_interlock_clause(equality_layout, labels):
    p, q, t, a, v, b, u = labels
    edge_index = {edge: index for index, edge in enumerate(equality_layout.edges)}

    def edge(left: int, right: int) -> int:
        return edge_index[tuple(sorted((left, right)))]

    def relation(first: int, second: int) -> int:
        return equality_layout.relation_variables[tuple(sorted((first, second)))]

    tp = edge(t, p)
    qp = edge(q, p)
    vt = edge(v, t)
    bq = edge(b, q)
    uq = edge(u, q)
    return tuple(
        -relation(left, right)
        for left, right in (
            (tp, edge(t, q)),
            (qp, edge(q, t)),
            (qp, edge(q, v)),
            (qp, edge(q, b)),
            (edge(a, t), edge(a, q)),
            (vt, edge(v, b)),
            (vt, edge(v, u)),
            (bq, edge(b, a)),
            (bq, edge(b, u)),
            (uq, edge(u, a)),
            (uq, edge(u, v)),
        )
    )


class B1Exact12StaticGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance, cls.compiled, cls.equality_layout = wave_four_fixture()
        cls.geometry_layout = install_static_geometry_extension(
            cls.instance, cls.compiled, cls.equality_layout
        )

    def test_installs_frozen_geometry_suffix(self) -> None:
        layout = self.geometry_layout
        self.assertEqual(layout.added_variables, 0)
        self.assertEqual(
            layout.equilateral_bisector_clauses,
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES,
        )
        self.assertEqual(
            layout.qcritical_aux_center_clauses,
            EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES,
        )
        self.assertEqual(
            layout.seven_point_six_row_anchor_clauses,
            EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES,
        )
        self.assertEqual(
            layout.seven_point_six_row_interlock_clauses,
            EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            layout.six_point_five_row_interlock_clauses,
            EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            layout.seven_point_seven_row_interlock_clauses,
            EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            layout.six_point_six_row_interlock_clauses,
            EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            layout.seven_point_equilateral_median_interlock_clauses,
            EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES,
        )
        self.assertEqual(layout.added_clauses, EXPECTED_GEOMETRY_CLAUSES)

        manifest = layout.manifest()
        self.assertEqual(STATIC_GEOMETRY_SCHEMA, "p97_b1_exact12_static_geometry.v8")
        self.assertEqual(manifest["schema"], STATIC_GEOMETRY_SCHEMA)
        self.assertFalse(manifest["promotion_eligible"])
        self.assertEqual(
            manifest["counts"]["total_geometry_clauses"],
            EXPECTED_GEOMETRY_CLAUSES,
        )
        self.assertEqual(
            manifest["counts"]["seven_point_seven_row_interlock_clauses"],
            EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            manifest["counts"]["six_point_six_row_interlock_clauses"],
            EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            manifest["counts"][
                "seven_point_equilateral_median_interlock_clauses"
            ],
            EXPECTED_SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_CLAUSES,
        )
        self.assertEqual(
            manifest["source_clause_ledger"][0]["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_equilateralBisectorCollisionCore",
        )
        qcritical_ledger = manifest["source_clause_ledger"][1]
        self.assertEqual(
            qcritical_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_equilateralChainBisectorCore",
        )
        self.assertEqual(
            qcritical_ledger["certificate_interface"],
            "Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate."
            "nonempty_equilateralChainBisectorCore_of_positiveCheck",
        )
        self.assertEqual(
            qcritical_ledger["underlying_metric_kernel"],
            "Problem97.u5_qcritical_aux_center_metric_incompatibility",
        )
        self.assertIn("generic labeled ingress", manifest["scope"])
        self.assertFalse(qcritical_ledger["promotion_eligible"])
        anchor_ledger = manifest["source_clause_ledger"][2]
        self.assertEqual(
            anchor_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sevenPointSixRowAnchorCollisionCore",
        )
        self.assertEqual(
            anchor_ledger["finite_label_instances"],
            SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES,
        )
        self.assertFalse(anchor_ledger["promotion_eligible"])
        interlock_ledger = manifest["source_clause_ledger"][3]
        self.assertEqual(
            interlock_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sevenPointSixRowInterlockCollisionCore",
        )
        self.assertEqual(
            interlock_ledger["finite_label_instances"],
            SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES,
        )
        self.assertFalse(interlock_ledger["promotion_eligible"])
        five_row_interlock_ledger = manifest["source_clause_ledger"][4]
        self.assertEqual(
            five_row_interlock_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sixPointFiveRowInterlockCollisionCore",
        )
        self.assertEqual(
            five_row_interlock_ledger["finite_label_instances"],
            SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES,
        )
        self.assertFalse(five_row_interlock_ledger["promotion_eligible"])
        seven_row_interlock_ledger = manifest["source_clause_ledger"][5]
        self.assertEqual(
            seven_row_interlock_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sevenPointSevenRowInterlockCollisionCore",
        )
        self.assertEqual(
            seven_row_interlock_ledger["finite_label_instances"],
            SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES,
        )
        self.assertEqual(
            seven_row_interlock_ledger["relation_equalities"],
            (
                "pq=pu",
                "qp=qt",
                "qp=qv",
                "tp=tb",
                "uq=uv",
                "uq=ua",
                "vp=va",
                "aq=at",
                "aq=ab",
                "bq=bu",
                "bq=ba",
            ),
        )
        self.assertFalse(seven_row_interlock_ledger["promotion_eligible"])
        six_row_interlock_ledger = manifest["source_clause_ledger"][6]
        self.assertEqual(
            six_row_interlock_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sixPointSixRowInterlockCollisionCore",
        )
        self.assertEqual(
            six_row_interlock_ledger["finite_label_instances"],
            SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES,
        )
        self.assertEqual(
            six_row_interlock_ledger["relation_equalities"],
            (
                "qp=qa",
                "qp=qt",
                "pq=pu",
                "uq=up",
                "aq=au",
                "aq=at",
                "aq=ab",
                "tp=tb",
                "bq=bt",
            ),
        )
        self.assertFalse(six_row_interlock_ledger["promotion_eligible"])
        equilateral_median_ledger = manifest["source_clause_ledger"][7]
        self.assertEqual(
            equilateral_median_ledger["source_theorem"],
            "Problem97.Census554.EqualityCore."
            "not_realizes_of_sevenPointEquilateralMedianInterlockCollisionCore",
        )
        self.assertEqual(
            equilateral_median_ledger["finite_label_instances"],
            SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES,
        )
        self.assertEqual(
            equilateral_median_ledger["relation_equalities"],
            (
                "tp=tq",
                "qp=qt",
                "qp=qv",
                "qp=qb",
                "at=aq",
                "vt=vb",
                "vt=vu",
                "bq=ba",
                "bq=bu",
                "uq=ua",
                "uq=uv",
            ),
        )
        self.assertFalse(equilateral_median_ledger["promotion_eligible"])
        self.assertIn(
            "finite_seven_point_seven_row_interlock_collision_nogood",
            manifest["included_rules"],
        )
        self.assertIn(
            "finite_six_point_six_row_interlock_collision_nogood",
            manifest["included_rules"],
        )
        self.assertIn(
            "finite_seven_point_equilateral_median_interlock_collision_nogood",
            manifest["included_rules"],
        )
        self.assertIn(
            "all_injective_seven_point_seven_row_interlock_instances",
            manifest["omitted_rules"],
        )
        self.assertIn(
            "all_injective_six_point_six_row_interlock_instances",
            manifest["omitted_rules"],
        )
        self.assertIn(
            "all_injective_seven_point_equilateral_median_interlock_instances",
            manifest["omitted_rules"],
        )
        self.assertEqual(len(manifest["manifest_sha256"]), 64)

    def test_clause_families_are_canonical_and_duplicate_free(self) -> None:
        layout = self.geometry_layout
        equilateral = layout.geometry_clause_delta[
            :EXPECTED_EQUILATERAL_BISECTOR_CLAUSES
        ]
        qcritical_end = (
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES
            + EXPECTED_QCRITICAL_AUX_CENTER_CLAUSES
        )
        qcritical = layout.geometry_clause_delta[
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES:qcritical_end
        ]
        anchor_end = qcritical_end + EXPECTED_SEVEN_POINT_SIX_ROW_ANCHOR_CLAUSES
        anchor = layout.geometry_clause_delta[qcritical_end:anchor_end]
        interlock_end = anchor_end + EXPECTED_SEVEN_POINT_SIX_ROW_INTERLOCK_CLAUSES
        interlock = layout.geometry_clause_delta[anchor_end:interlock_end]
        five_row_interlock_end = (
            interlock_end + EXPECTED_SIX_POINT_FIVE_ROW_INTERLOCK_CLAUSES
        )
        five_row_interlock = layout.geometry_clause_delta[
            interlock_end:five_row_interlock_end
        ]
        seven_row_interlock_end = (
            five_row_interlock_end
            + EXPECTED_SEVEN_POINT_SEVEN_ROW_INTERLOCK_CLAUSES
        )
        seven_row_interlock = layout.geometry_clause_delta[
            five_row_interlock_end:seven_row_interlock_end
        ]
        six_row_interlock_end = (
            seven_row_interlock_end
            + EXPECTED_SIX_POINT_SIX_ROW_INTERLOCK_CLAUSES
        )
        six_row_interlock = layout.geometry_clause_delta[
            seven_row_interlock_end:six_row_interlock_end
        ]
        equilateral_median_interlock = layout.geometry_clause_delta[
            six_row_interlock_end:
        ]
        self.assertEqual(len(equilateral), 95_040)
        self.assertEqual(len(qcritical), 665_280)
        self.assertEqual(len(anchor), 1)
        self.assertEqual(len(interlock), 1)
        self.assertEqual(len(five_row_interlock), 1)
        self.assertEqual(len(seven_row_interlock), 1)
        self.assertEqual(len(six_row_interlock), 1)
        self.assertEqual(len(equilateral_median_interlock), 1)
        self.assertTrue(
            all(
                len(clause) == 6 and all(literal < 0 for literal in clause)
                for clause in equilateral
            )
        )
        self.assertTrue(
            all(
                len(clause) == 8 and all(literal < 0 for literal in clause)
                for clause in qcritical
            )
        )
        self.assertEqual(
            qcritical[0],
            qcritical_clause(self.equality_layout, (0, 1, 2, 3, 4, 5)),
        )
        self.assertEqual(
            anchor[0],
            anchor_clause(
                self.equality_layout,
                SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES[0],
            ),
        )
        self.assertEqual(len(anchor[0]), 11)
        self.assertTrue(all(literal < 0 for literal in anchor[0]))
        self.assertEqual(
            interlock[0],
            interlock_clause(
                self.equality_layout,
                SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES[0],
            ),
        )
        self.assertEqual(len(interlock[0]), 11)
        self.assertTrue(all(literal < 0 for literal in interlock[0]))
        self.assertEqual(
            five_row_interlock[0],
            five_row_interlock_clause(
                self.equality_layout,
                SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES[0],
            ),
        )
        self.assertEqual(len(five_row_interlock[0]), 9)
        self.assertTrue(all(literal < 0 for literal in five_row_interlock[0]))
        self.assertEqual(
            seven_row_interlock[0],
            seven_row_interlock_clause(
                self.equality_layout,
                SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES[0],
            ),
        )
        self.assertEqual(len(seven_row_interlock[0]), 11)
        self.assertTrue(all(literal < 0 for literal in seven_row_interlock[0]))
        self.assertEqual(
            six_row_interlock[0],
            six_row_interlock_clause(
                self.equality_layout,
                SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES[0],
            ),
        )
        self.assertEqual(len(six_row_interlock[0]), 9)
        self.assertTrue(all(literal < 0 for literal in six_row_interlock[0]))
        self.assertEqual(
            equilateral_median_interlock[0],
            equilateral_median_interlock_clause(
                self.equality_layout,
                SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES[0],
            ),
        )
        self.assertEqual(len(equilateral_median_interlock[0]), 11)
        self.assertTrue(
            all(literal < 0 for literal in equilateral_median_interlock[0])
        )
        self.assertEqual(
            len(layout.geometry_clause_delta), len(set(layout.geometry_clause_delta))
        )

    def test_wave_four_core_hits_qcritical_aux_center_clause(self) -> None:
        equality = self.equality_layout
        witness_clause = qcritical_clause(equality, (0, 6, 1, 2, 3, 5))
        qcritical = self.geometry_layout.geometry_clause_delta[
            EXPECTED_EQUILATERAL_BISECTOR_CLAUSES:
        ]
        self.assertIn(witness_clause, qcritical)
        positive = canonical_extension_assignment(
            self.instance,
            self.compiled,
            equality,
            WAVE_FOUR_CUBE,
            allow_appended_clauses=True,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))
        self.assertTrue(
            all(
                any(-literal not in positive for literal in clause)
                for clause in self.geometry_layout.geometry_clause_delta[
                    :EXPECTED_EQUILATERAL_BISECTOR_CLAUSES
                ]
            )
        )
        self.assertTrue(
            canonical_extension_satisfies_delta(
                self.instance,
                self.compiled,
                equality,
                WAVE_FOUR_CUBE,
                allow_appended_clauses=True,
            )
        )
        self.assertFalse(
            canonical_geometry_satisfies_delta(
                self.instance,
                self.compiled,
                equality,
                self.geometry_layout,
                WAVE_FOUR_CUBE,
            )
        )

    def test_wave_seven_core_hits_finite_anchor_clause(self) -> None:
        instance, compiled, equality = wave_seven_equality_fixture()
        witness_clause = anchor_clause(
            equality,
            SEVEN_POINT_SIX_ROW_ANCHOR_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_SEVEN_CUBE,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))

    def test_wave_nine_core_hits_finite_interlock_clause(self) -> None:
        instance, compiled, equality = wave_nine_equality_fixture()
        witness_clause = interlock_clause(
            equality,
            SEVEN_POINT_SIX_ROW_INTERLOCK_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_NINE_CUBE,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))

    def test_wave_eleven_core_hits_finite_five_row_interlock_clause(self) -> None:
        instance, compiled, equality = wave_eleven_equality_fixture()
        witness_clause = five_row_interlock_clause(
            equality,
            SIX_POINT_FIVE_ROW_INTERLOCK_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_ELEVEN_CUBE,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))

    def test_wave_thirteen_core_hits_finite_seven_row_interlock_clause(self) -> None:
        instance, compiled, equality = wave_thirteen_equality_fixture()
        witness_clause = seven_row_interlock_clause(
            equality,
            SEVEN_POINT_SEVEN_ROW_INTERLOCK_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_THIRTEEN_CUBE,
        )
        self.assertTrue(all(-literal in positive for literal in witness_clause))

    def test_wave_fifteen_survivor_activates_both_later_kernel_clauses(
        self,
    ) -> None:
        instance, compiled, equality = wave_fifteen_equality_fixture()
        geometry = install_static_geometry_extension(instance, compiled, equality)
        witness_clause = six_row_interlock_clause(
            equality,
            SIX_POINT_SIX_ROW_INTERLOCK_INSTANCES[0],
        )
        later_clause = equilateral_median_interlock_clause(
            equality,
            SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_FIFTEEN_CUBE,
            allow_appended_clauses=True,
        )
        activated_clauses = tuple(
            clause
            for clause in geometry.geometry_clause_delta
            if all(-literal in positive for literal in clause)
        )

        self.assertEqual(geometry.geometry_clause_delta[-2], witness_clause)
        self.assertEqual(len(witness_clause), 9)
        self.assertTrue(all(literal < 0 for literal in witness_clause))
        self.assertEqual(activated_clauses, (witness_clause, later_clause))

    def test_wave_seventeen_survivor_activates_exactly_new_interlock_clause(
        self,
    ) -> None:
        instance, compiled, equality = wave_seventeen_equality_fixture()
        geometry = install_static_geometry_extension(instance, compiled, equality)
        witness_clause = equilateral_median_interlock_clause(
            equality,
            SEVEN_POINT_EQUILATERAL_MEDIAN_INTERLOCK_INSTANCES[0],
        )
        positive = canonical_extension_assignment(
            instance,
            compiled,
            equality,
            WAVE_SEVENTEEN_CUBE,
            allow_appended_clauses=True,
        )
        activated_clauses = tuple(
            clause
            for clause in geometry.geometry_clause_delta
            if all(-literal in positive for literal in clause)
        )

        self.assertEqual(geometry.geometry_clause_delta[-1], witness_clause)
        self.assertEqual(len(witness_clause), 11)
        self.assertTrue(all(literal < 0 for literal in witness_clause))
        self.assertEqual(activated_clauses, (witness_clause,))

    def test_install_and_replay_fail_closed_on_drift(self) -> None:
        with self.assertRaisesRegex(B1Exact12StaticGeometryError, "already installed"):
            install_static_geometry_extension(
                self.instance, self.compiled, self.equality_layout
            )
        with self.assertRaisesRegex(B1Exact12StaticGeometryError, "hashes"):
            canonical_geometry_satisfies_delta(
                self.instance,
                self.compiled,
                self.equality_layout,
                replace(self.geometry_layout, final_cnf_sha256="0" * 64),
                WAVE_FOUR_CUBE,
            )


if __name__ == "__main__":
    unittest.main()
