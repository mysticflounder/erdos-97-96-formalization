"""Focused tests for the D-R two-radius named-role quotient encoder."""

from __future__ import annotations

import dataclasses
import hashlib
import json
import unittest
from fractions import Fraction

from census.card_head import dr_two_radius_quotient as quotient


def _values_for(cell: quotient.QuotientCell, points: dict[str, tuple[Fraction, Fraction]], center: tuple[Fraction, Fraction], rr: Fraction) -> dict[str, Fraction]:
    labels = quotient.carrier_labels(cell)
    values: dict[str, Fraction] = {}
    for index, label in enumerate(labels):
        x, y = points[label]
        values[f"x_{index}"] = x
        values[f"y_{index}"] = y
    values["ox"], values["oy"] = center
    values["rr"] = rr
    return values


class CellRules(unittest.TestCase):
    def test_generic_cells_validate_and_cover_labels(self) -> None:
        for role in ("X", "Y", "Z"):
            cell = quotient.generic_cell(f"generic-{role.lower()}", role)
            labels = quotient.validate_cell(cell)
            self.assertEqual(labels[:3], ("a2", "a1", "a3"))
            self.assertEqual(len(labels), 24 if role == "Z" else 20)
            self.assertEqual(sorted(quotient.cyclic_order(cell)), sorted(labels))

    def test_interior_pair_must_lie_in_cap_one(self) -> None:
        cell = quotient.generic_cell()
        placement = dict(cell.placement)
        placement["U0"], placement["U2"] = "I2", "I1"
        order = {
            "Is": cell.interior_order["Is"],
            "I1": tuple("U2" if x == "U0" else x for x in cell.interior_order["I1"]),
            "I2": tuple("U0" if x == "U2" else x for x in cell.interior_order["I2"]),
        }
        bad = dataclasses.replace(cell, placement=placement, interior_order=order)
        with self.assertRaisesRegex(quotient.DRQuotientError, "interior_q"):
            quotient.validate_cell(bad)

    def test_adjacent_cap_one_hit_bound_for_second_apex_classes(self) -> None:
        cell = quotient.generic_cell()
        placement = dict(cell.placement)
        placement["X3"] = "Is"
        order = {
            "Is": cell.interior_order["Is"] + ("X3",),
            "I1": tuple(x for x in cell.interior_order["I1"] if x != "X3"),
            "I2": cell.interior_order["I2"],
        }
        bad = dataclasses.replace(cell, placement=placement, interior_order=order)
        with self.assertRaisesRegex(quotient.DRQuotientError, "at most one point in each cap adjacent to a2"):
            quotient.validate_cell(bad)

    def test_frontier_pair_outside_surplus_cap(self) -> None:
        cell = quotient.generic_cell()
        bad = dataclasses.replace(cell, q_slot=3, w_slot=1)
        with self.assertRaisesRegex(quotient.DRQuotientError, "outside the surplus cap"):
            quotient.validate_cell(bad)

    def test_order_must_be_permutation_of_placement(self) -> None:
        cell = quotient.generic_cell()
        order = dict(cell.interior_order)
        order["Is"] = order["Is"][:-1]
        bad = dataclasses.replace(cell, interior_order=order)
        with self.assertRaisesRegex(quotient.DRQuotientError, "permutation"):
            quotient.validate_cell(bad)

    def test_payload_roundtrip(self) -> None:
        cell = quotient.generic_cell("generic-z", "Z")
        again = quotient.cell_from_payload(json.loads(json.dumps(cell.payload())))
        self.assertEqual(again, cell)


class Journal(unittest.TestCase):
    def test_generic_x_counts_and_determinism(self) -> None:
        cell = quotient.generic_cell()
        commands, counts = quotient.build_journal(cell)
        again, _ = quotient.build_journal(cell)
        self.assertEqual(commands, again)
        self.assertEqual(commands[0], "(set-logic QF_NRA)")
        self.assertEqual(sum(1 for c in commands if c.startswith("(declare-fun")), 43)
        self.assertFalse(any("check-sat" in c or "get-" in c for c in commands))
        self.assertEqual(
            counts,
            {
                "bisector": 14,
                "cap_exclusion": 34,
                "cap_membership": 17,
                "convexity": 360,
                "distinctness": 190,
                "gauge": 4,
                "mec_boundary": 3,
                "mec_enclosing": 20,
                "nonobtuse": 3,
                "row_equalities": 12,
                "row_exactness": 60,
                "total": 717,
            },
        )

    def test_full_system_control_adds_one_atom(self) -> None:
        cell = quotient.generic_cell()
        base = quotient.atom_counts(quotient.build_atoms(cell))
        counts = quotient.atom_counts(quotient.build_atoms(cell, "five-at-second-apex"))
        self.assertEqual(counts["control"], 1)
        self.assertEqual(counts["total"], base["total"] + 1)
        self.assertEqual({k: v for k, v in counts.items() if k not in {"control", "total"}}, {k: v for k, v in base.items() if k != "total"})

    def test_reduced_controls_are_tiny(self) -> None:
        cell = quotient.generic_cell()
        self.assertEqual(
            quotient.atom_counts(quotient.build_atoms(cell, "duplicate-center")),
            {"distinctness": 10, "gauge": 4, "row_equalities": 4, "total": 18},
        )
        self.assertEqual(
            quotient.atom_counts(quotient.build_atoms(cell, "small-sat")),
            {"convexity": 15, "distinctness": 10, "gauge": 4, "row_equalities": 2, "total": 31},
        )
        # Reduced controls declare only the coordinates their atoms mention.
        self.assertEqual(len(quotient.variable_terms(cell, "duplicate-center")), 12)
        self.assertEqual(len(quotient.variable_terms(cell, "small-sat")), 10)
        self.assertEqual(len(quotient.variable_terms(cell, "none")), 43)

    def test_small_sat_control_has_a_hand_witness(self) -> None:
        # CCW pentagon a1=(1,0), a2=(0,0), X0=(-3/5,-4/5), X1=(0,-1), X2=(3/5,-4/5);
        # X0, X1, X2 at distance 1 from a2.
        cell = quotient.generic_cell()
        labels = quotient.carrier_labels(cell)
        index = {label: i for i, label in enumerate(labels)}
        values = {f"{axis}_{i}": Fraction(0) for i in range(len(labels)) for axis in ("x", "y")}
        values.update({"ox": Fraction(0), "oy": Fraction(0), "rr": Fraction(1)})
        witness = {
            "a1": (Fraction(1), Fraction(0)),
            "a2": (Fraction(0), Fraction(0)),
            "X0": (Fraction(-3, 5), Fraction(-4, 5)),
            "X1": (Fraction(0), Fraction(-1)),
            "X2": (Fraction(3, 5), Fraction(-4, 5)),
        }
        for label, (x, y) in witness.items():
            values[f"x_{index[label]}"], values[f"y_{index[label]}"] = x, y
        accepted, evidence = quotient.replay_atoms(cell, "small-sat", values)
        self.assertTrue(accepted, evidence)
        self.assertEqual(evidence["total"], 31)
        # Reflecting X1 to (0, 1) breaks the CCW convex order.
        values[f"y_{index['X1']}"] = Fraction(1)
        accepted, evidence = quotient.replay_atoms(cell, "small-sat", values)
        self.assertFalse(accepted)
        self.assertEqual(evidence["reason"], "convexity")

    def test_witness_search_returns_replayed_cell(self) -> None:
        # Restart 0 starts from the published witness parameters and must replay.
        found = quotient.witness_search(seed=1, trials=1, cell_id="test-witness")
        self.assertIsNotNone(found)
        assert found is not None
        cell, values, evidence = found
        accepted, replay = quotient.replay_atoms(cell, "none", values)
        self.assertTrue(accepted)
        self.assertEqual(replay["total"], quotient.atom_counts(quotient.build_atoms(cell))["total"])
        self.assertEqual(evidence["restart"], 0)

    def test_published_witness_replays_exactly(self) -> None:
        path = quotient.REPOSITORY_ROOT / "certificates" / "p97_dr_two_radius" / "witness-x-exact-witness.json"
        payload = json.loads(path.read_text())
        self.assertEqual(payload["schema"], "p97-dr-two-radius-quotient-exact-witness/v1")
        cell = quotient.cell_from_payload(payload["cell"])
        labels = quotient.validate_cell(cell)
        values = {}
        for position, label in enumerate(labels):
            values[f"x_{position}"] = Fraction(payload["coordinates"][label]["x"])
            values[f"y_{position}"] = Fraction(payload["coordinates"][label]["y"])
        values["ox"] = Fraction(payload["mec_center"]["x"])
        values["oy"] = Fraction(payload["mec_center"]["y"])
        values["rr"] = Fraction(payload["mec_squared_radius"])
        accepted, replay = quotient.replay_atoms(cell, "none", values)
        self.assertTrue(accepted, replay)
        self.assertEqual(replay["checks"], payload["replay"]["checks"])
        self.assertEqual(replay["total"], 717)
        readback = quotient.omitted_fact_readback(cell, values)
        self.assertTrue(readback["no_five_at_second_apex"]["holds"])
        self.assertTrue(readback["unique_four_radius_at_first_apex"]["holds"])
        self.assertTrue(readback["first_blocker_unique_four"]["holds"])
        self.assertEqual(readback, payload["omitted_fact_readback"])
        self.assertFalse(payload["promotion_eligible"])

    def test_every_ledger_family_is_asserted_or_structural(self) -> None:
        cell = quotient.generic_cell()
        families = set(quotient.atom_counts(quotient.build_atoms(cell))) - {"total"}
        ledger = {entry["family"] for entry in quotient.SOURCE_CLAUSE_LEDGER}
        self.assertTrue(families <= ledger, families - ledger)
        self.assertEqual(ledger - families, {"source_in_first_row", "structural_cell_rules"})
        for entry in quotient.SOURCE_CLAUSE_LEDGER:
            self.assertTrue(entry["lean_sources"], entry["family"])


class Replay(unittest.TestCase):
    def test_gauge_and_mec_atoms_replay_exactly(self) -> None:
        # Only the gauge, MEC, and nonobtuse families are exercised: a right
        # isosceles Moser triangle on the circle with centre (1/2, -1/2).
        cell = quotient.generic_cell()
        atoms = [atom for atom in quotient.build_atoms(cell) if atom[0] in {"gauge", "mec_boundary", "nonobtuse"}]
        labels = quotient.carrier_labels(cell)
        values = {f"{axis}_{i}": Fraction(0) for i in range(len(labels)) for axis in ("x", "y")}
        values.update({"x_1": Fraction(1), "x_2": Fraction(1), "y_2": Fraction(-1)})
        values.update({"ox": Fraction(1, 2), "oy": Fraction(-1, 2), "rr": Fraction(1, 2)})
        for family, relation, expr in atoms:
            self.assertTrue(quotient._holds(relation, quotient._evaluate(expr, values)), family)
        values["rr"] = Fraction(1)
        self.assertFalse(all(quotient._holds(r, quotient._evaluate(e, values)) for _f, r, e in atoms))

    def test_replay_rejects_wrong_gauge(self) -> None:
        cell = quotient.generic_cell()
        values = _values_for(
            cell,
            {label: (Fraction(i), Fraction(i * i)) for i, label in enumerate(quotient.carrier_labels(cell))},
            (Fraction(0), Fraction(0)),
            Fraction(1),
        )
        accepted, evidence = quotient.replay_atoms(cell, "none", values)
        self.assertFalse(accepted)
        self.assertEqual(evidence["reason"], "gauge")

    def test_smt_printer_matches_evaluator_on_signed_area(self) -> None:
        expr = quotient._signed_area(0, 1, 2)
        self.assertEqual(
            quotient._smt(expr),
            "(- (* (- x_1 x_0) (- y_2 y_0)) (* (- x_2 x_0) (- y_1 y_0)))",
        )
        values = {"x_0": Fraction(0), "y_0": Fraction(0), "x_1": Fraction(1), "y_1": Fraction(0), "x_2": Fraction(0), "y_2": Fraction(1)}
        self.assertEqual(quotient._evaluate(expr, values), Fraction(1))


class Stage(unittest.TestCase):
    def test_prepare_stage_authenticates_and_binds_counts(self) -> None:
        cell = quotient.generic_cell()
        prepared = quotient.prepare_stage(cell, "none", timeout_ms=1000)
        descriptor = prepared.query.descriptor
        self.assertEqual(descriptor["schema"], quotient.DESCRIPTOR_SCHEMA)
        self.assertEqual(descriptor["semantic_input"]["constraint_counts"]["total"], 717)
        self.assertEqual(len(descriptor["variables"]), 43)
        self.assertEqual(prepared.source_record["claims"], quotient.FALSE_CLAIMS)
        self.assertFalse(prepared.source_record["promotion_eligible"])
        self.assertEqual(
            hashlib.sha256(prepared.query.journal_smt2).hexdigest(),
            descriptor["original_smt2"]["sha256"],
        )

    def test_verify_rejects_count_drift(self) -> None:
        cell = quotient.generic_cell()
        prepared = quotient.prepare_stage(cell, "none", timeout_ms=1000)
        descriptor = json.loads(prepared.query.descriptor_bytes)
        descriptor["semantic_input"]["constraint_counts"]["total"] = 1
        query = dataclasses.replace(prepared.query, descriptor=descriptor)
        with self.assertRaisesRegex(quotient.DRQuotientError, "not authenticated"):
            quotient.verify_sat_model(query, "z3", "(model)", "((x_0 0))")

    def test_compact_result_rejects_sat_without_replay(self) -> None:
        cell = quotient.generic_cell()
        prepared = quotient.prepare_stage(cell, "none", timeout_ms=1000)
        with self.assertRaisesRegex(quotient.DRQuotientError, "semantic replay"):
            quotient._compact_result(prepared, {"raw_status": "SAT", "effective_status": "SAT"}, quotient.REPOSITORY_ROOT)
        with self.assertRaisesRegex(quotient.DRQuotientError, "semantic replay"):
            rejected = {"accepted": False, "evidence": {"reason": "convexity", "atom_index": 3}}
            quotient._compact_result(
                prepared,
                {"raw_status": "SAT", "effective_status": "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", "semantic_replay": rejected},
                quotient.REPOSITORY_ROOT,
            )
        algebraic = {"accepted": False, "evidence": {"reason": "non-rational-readback", "detail": "root-obj"}}
        result = quotient._compact_result(
            prepared,
            {"raw_status": "SAT", "effective_status": "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED", "semantic_replay": algebraic},
            quotient.REPOSITORY_ROOT,
        )
        self.assertEqual(result["classification"], "Z3_SAT_ALGEBRAIC_MODEL_NOT_RATIONALLY_REPLAYED_DIAGNOSTIC")
        self.assertEqual(result["status"], "SAT")
        result = quotient._compact_result(prepared, {"raw_status": "UNSAT", "effective_status": "UNSAT"}, quotient.REPOSITORY_ROOT)
        self.assertEqual(result["classification"], "Z3_UNSAT_QUOTIENT_SCOPE_DIAGNOSTIC_NOT_CERTIFIED")
        self.assertFalse(result["promotion_eligible"])

    def test_manifest_self_hash_matches_hygiene_convention(self) -> None:
        sample = {"schema": "x", "b": [1, 2], "a": {"k": "v"}}
        expected = hashlib.sha256(json.dumps(sample, ensure_ascii=True, sort_keys=True, separators=(",", ":")).encode()).hexdigest()
        self.assertEqual(quotient._manifest_self_hash({**sample, "manifest_sha256": "stale"}), expected)


if __name__ == "__main__":
    unittest.main()
