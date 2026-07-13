from __future__ import annotations

import hashlib
import json
import unittest

from census.atail_force import separator_pilot as pilot


class SeparatorPilotTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.manifest = pilot._read_manifest(pilot.DEFAULT_MANIFEST)

    def test_manifest_selects_one_bounded_case_per_size_stratum(self) -> None:
        cases = self.manifest["cases"]
        self.assertEqual(len(cases), 7)
        self.assertEqual(
            [case["interior_points"] for case in cases],
            list(range(6, 13)),
        )
        self.assertEqual(
            self.manifest["policy"]["timeout_seconds_per_case"],
            20,
        )
        self.assertEqual(self.manifest["policy"]["engine_threads"], 1)

    def test_committed_manifest_is_immutable_and_bound_to_results(self) -> None:
        results = json.loads(pilot.DEFAULT_RESULTS.read_text(encoding="utf-8"))
        self.assertEqual(
            results["manifest_sha256"],
            self.manifest["manifest_sha256"],
        )
        results_by_case = {row["case_id"]: row for row in results["results"]}
        for case in self.manifest["cases"]:
            input_text = pilot.build_msolve_input(case)
            digest = hashlib.sha256(input_text.encode("utf-8")).hexdigest()
            self.assertEqual(digest, results_by_case[case["case_id"]]["input_sha256"])

    def test_emitted_input_has_every_rabinowitsch_equation(self) -> None:
        case = self.manifest["cases"][0]
        content = pilot.build_msolve_input(case)
        lines = content.splitlines()
        self.assertEqual(lines[1], "0")
        self.assertEqual(
            len(lines[0].split(",")),
            case["augmented_variables"],
        )
        separator_variables = [
            variable
            for variable in lines[0].split(",")
            if variable.startswith("sep_inv_")
        ]
        self.assertEqual(len(separator_variables), case["separators"])
        for variable in separator_variables:
            self.assertIn(variable, content)
        self.assertEqual(content.count(",\n") + 1, case["augmented_equalities"])

    def test_output_parser_is_fail_closed(self) -> None:
        self.assertEqual(pilot._classify("[-1]\n", 0), "C_EMPTY_PROPOSAL")
        self.assertEqual(
            pilot._classify("[1,3,-1,[]]\n", 0),
            "POSITIVE_DIMENSION_SIGNAL",
        )
        self.assertEqual(pilot._classify("[0,1]\n", 0), "ZERO_DIMENSION_SIGNAL")
        self.assertEqual(pilot._classify("[-1]\n", 2), "ERROR")
        self.assertEqual(pilot._classify("surprise", 0), "UNPARSED")


if __name__ == "__main__":
    unittest.main()
