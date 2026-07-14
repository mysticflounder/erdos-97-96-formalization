from __future__ import annotations

import unittest

from census.atail_force import producer_probe
from census.atail_force import producer_surface


class ProducerProbeTests(unittest.TestCase):
    def test_first_assignment_is_valid_and_negates_target(self) -> None:
        for case in producer_surface.PRODUCER_CASES:
            assignment = producer_probe.first_negated_assignment(case)
            producer_surface.validate_assignment(case, assignment)
            self.assertTrue(
                producer_surface.no_shared_off_surplus_pair(case, assignment)
            )

    def test_metric_rows_are_exact_full_classes(self) -> None:
        case = producer_surface.PRODUCER_CASES[0]
        assignment = producer_probe.first_negated_assignment(case)
        rows = producer_probe._metric_rows(assignment)
        self.assertEqual(len(rows), 2)
        self.assertTrue(all(row.exact for row in rows))
        self.assertEqual(
            [len(row.support) for row in rows],
            [len(assignment.opp_apex1_exact.support), len(assignment.opp_apex2_exact.support)],
        )

    def test_bank_clean_assignment_has_no_formalized_match(self) -> None:
        case = producer_surface.PRODUCER_CASES[0]
        assignment = producer_probe.first_bank_clean_negated_assignment(case)
        self.assertFalse(
            producer_probe.producer_bank.scan_all_formalized_cores(
                producer_probe._metric_rows(assignment),
                case.cardinality,
                producer_probe._canonical_order(case),
            )
        )

    def test_named_core_parser_ignores_solver_syntax(self) -> None:
        case = producer_surface.PRODUCER_CASES[0]
        assignment = producer_probe.first_bank_clean_negated_assignment(case)
        system = producer_probe.producer_geometry.build_case_geometry(case, assignment)
        name = system.atom_names()[0]
        result = {"status": "UNSAT", "stdout": f"unsat\n(\n{name}\nUNKNOWN_NAME\n)\n"}
        self.assertEqual(producer_probe.named_core_from_cvc5(system, result), (name,))
        self.assertEqual(
            producer_probe.named_core_from_cvc5(system, {"status": "SAT"}), ()
        )


if __name__ == "__main__":
    unittest.main()
