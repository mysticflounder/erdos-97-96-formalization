from __future__ import annotations

import unittest

import sympy as sp

from census.atail_force import producer_geometry as geometry
from census.atail_force import producer_surface as surface


def _blueprint() -> geometry.GeometryBlueprint:
    labels = ("s", "a1", "u", "a2", "v", "w")
    return geometry.GeometryBlueprint(
        case_id="smoke-654",
        labels=labels,
        cyclic_order=labels,
        surplus_apex="s",
        opp_apex1="a1",
        opp_apex2="a2",
        surplus_cap=frozenset(("a1", "u", "a2")),
        opp_cap1=frozenset(("a2", "v", "s")),
        opp_cap2=frozenset(("s", "w", "a1")),
        exact_classes=(
            geometry.ExactClassSpec("a1", "a1_r0", ("u", "v", "w")),
            geometry.ExactClassSpec("a2", "a2_r0", ("u", "v")),
        ),
        pinned_k4_rows=(
            geometry.PinnedK4Row("s", "row_s", ("a1", "u", "a2", "v")),
        ),
    )


def _surface_assignment() -> tuple[
    surface.ProducerCase, surface.ApexClassAssignment
]:
    case = surface.case_by_id("card11_profile_554")
    off = surface.off_surplus_labels(case)
    surplus_interior = surface.frame_for_case(case).ints["S"][0]
    first = tuple(sorted((off[0], off[1], off[2], off[3], surplus_interior)))
    second = tuple(sorted((off[0], off[4], off[5], surplus_interior)))
    first_exact = surface.ExactApexClass("opp_apex1", case.opp_apex1, first)
    second_exact = surface.ExactApexClass("opp_apex2", case.opp_apex2, second)
    return case, surface.ApexClassAssignment(
        opp_apex1_exact=first_exact,
        opp_apex2_exact=second_exact,
        opp_apex1_selected_four=next(surface.iter_selected_four_witnesses(first_exact)),
        opp_apex2_selected_four=next(surface.iter_selected_four_witnesses(second_exact)),
    )


class ProducerGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.system = geometry.build_geometry_system(_blueprint())

    def test_emits_every_milestone_two_family_with_unique_names(self) -> None:
        families = {atom.family for atom in self.system.atoms}
        self.assertEqual(
            families,
            {
                "gauge",
                "distinctness",
                "strict-convex-order",
                "mec",
                "mec-boundary",
                "mec-disk",
                "mec-nonobtuse",
                "cap-iff-sign",
                "exact-apex-filter",
                "pinned-global-k4",
                "target-negation",
            },
        )
        self.assertEqual(len(self.system.atom_names()), len(set(self.system.atom_names())))

    def test_exact_filters_are_iff_not_selected_subsets(self) -> None:
        atoms = {
            atom.name: atom for atom in self.system.atoms
            if atom.family == "exact-apex-filter"
        }
        self.assertEqual(atoms["EXACT_FILTER_a1_r0_u"].relation, "eq")
        self.assertEqual(atoms["EXACT_FILTER_a1_r0_s"].relation, "ne")
        self.assertEqual(atoms["EXACT_FILTER_a1_r0_a2"].relation, "ne")

    def test_cap_membership_is_encoded_in_both_directions(self) -> None:
        atoms = {atom.name: atom for atom in self.system.atoms}
        self.assertEqual(atoms["CAP_IFF_SURPLUS_u"].relation, "ge")
        self.assertEqual(atoms["CAP_IFF_SURPLUS_v"].relation, "gt")
        self.assertIn("OnArcOpposite", atoms["CAP_IFF_SURPLUS_u"].lean_source)

    def test_target_negation_is_pairwise_joint_fiber_injectivity(self) -> None:
        target = [atom for atom in self.system.atoms if atom.family == "target-negation"]
        off_count = len(_blueprint().labels) - len(_blueprint().surplus_cap)
        self.assertEqual(len(target), off_count * (off_count - 1) // 2)
        self.assertTrue(all(atom.relation == "or_ne" for atom in target))
        self.assertTrue(all(len(atom.polynomials) == 2 for atom in target))

    def test_omitted_ledger_preserves_known_model_boundary(self) -> None:
        text = "\n".join(self.system.omitted_ledger)
        self.assertIn("hNoM44", text)
        self.assertIn("CounterexampleData.packet", text)
        self.assertIn("CriticalShellSystem.centerAt", text)
        self.assertIn("live U3/U5", text)
        self.assertIn("no-removable", text)

    def test_named_atom_rejects_wrong_arity(self) -> None:
        x = sp.Symbol("x", real=True)
        with self.assertRaises(geometry.GeometryError):
            geometry.NamedPolynomialAtom("BAD", "test", "or_ne", (x,), "test")

    def test_z3_builder_tracks_atoms_and_smoke_gate_passes(self) -> None:
        enabled = {
            "GAUGE_a1_X",
            "GAUGE_a1_Y",
            "GAUGE_a2_X",
            "GAUGE_a2_Y",
            "DISTINCT_a1_a2",
        }
        result = geometry.run_z3_bounded(self.system, enabled, timeout_ms=1_000)
        self.assertEqual(result["status"], "SAT")
        self.assertIn("not a Lean proof", result["evidence_scope"])
        self.assertTrue(geometry.z3_smoke_gate()["passed"])
        with self.assertRaises(geometry.GeometryError):
            geometry.build_z3_solver(
                self.system, enabled, timeout_ms=geometry.MAX_Z3_TIMEOUT_MS + 1
            )

    def test_cvc5_contract_is_named_qfnra_without_running_solver(self) -> None:
        enabled = {"GAUGE_a1_X", "TARGET_NO_JOINT_s_v"}
        smt2 = geometry.build_cvc5_smt2(self.system, enabled)
        self.assertTrue(smt2.startswith("(set-logic QF_NRA)\n"))
        self.assertIn(":produce-unsat-cores true", smt2)
        self.assertIn(":named |GAUGE_a1_X|", smt2)
        self.assertIn(":named |TARGET_NO_JOINT_s_v|", smt2)
        self.assertIn("(check-sat)", smt2)
        self.assertIn("(get-unsat-core)", smt2)
        with self.assertRaises(geometry.GeometryError):
            geometry.run_cvc5_bounded(
                self.system,
                enabled,
                timeout_seconds=geometry.MAX_CVC5_TIMEOUT_SECONDS + 1,
            )

    def test_cvc5_serializes_constant_polynomial(self) -> None:
        self.assertEqual(geometry._poly_to_smt2(sp.Integer(0)), "0.0")
        self.assertEqual(geometry._poly_to_smt2(sp.Rational(1, 2)), "(/ 1.0 2.0)")

    def test_invalid_blueprint_fails_closed(self) -> None:
        base = _blueprint()
        bad = geometry.GeometryBlueprint(
            **{**base.__dict__, "cyclic_order": base.cyclic_order[:-1]}
        )
        with self.assertRaises(geometry.GeometryError):
            geometry.build_geometry_system(bad)

    def test_consumes_validated_producer_surface_assignment(self) -> None:
        case, assignment = _surface_assignment()
        blueprint = geometry.blueprint_from_surface(case, assignment)
        self.assertEqual(blueprint.case_id, case.case_id)
        self.assertEqual(len(blueprint.labels), case.cardinality)
        self.assertEqual(blueprint.opp_apex1, str(case.opp_apex1))
        self.assertEqual(blueprint.opp_apex2, str(case.opp_apex2))
        self.assertEqual(
            [len(exact.members) for exact in blueprint.exact_classes],
            [5, 4],
        )
        system = geometry.build_case_geometry(case, assignment)
        self.assertTrue(any(atom.family == "target-negation" for atom in system.atoms))
        self.assertEqual(
            len([atom for atom in system.atoms if atom.family == "pinned-global-k4"]),
            10,
        )

    def test_surface_assignment_violating_target_negation_is_rejected(self) -> None:
        case = surface.case_by_id("card12_profile_654")
        off = surface.off_surplus_labels(case)
        surplus_interior = surface.frame_for_case(case).ints["S"][0]
        first = tuple(sorted((off[0], off[1], off[2], off[3], surplus_interior)))
        second = tuple(sorted((off[0], off[1], off[4], surplus_interior)))
        first_exact = surface.ExactApexClass("opp_apex1", case.opp_apex1, first)
        second_exact = surface.ExactApexClass("opp_apex2", case.opp_apex2, second)
        assignment = surface.ApexClassAssignment(
            first_exact,
            second_exact,
            next(surface.iter_selected_four_witnesses(first_exact)),
            next(surface.iter_selected_four_witnesses(second_exact)),
        )
        with self.assertRaises(geometry.GeometryError):
            geometry.blueprint_from_surface(case, assignment)


if __name__ == "__main__":
    unittest.main()
