"""Regression tests for the v5 CEGAR artifacts and source contract."""

from __future__ import annotations

import json
import sys
import unittest
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))
import run_wave as W
import verify_wave as V


class EqualityPathV5Tests(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.results = json.loads((ROOT / "results.json").read_text())

    def test_all_eight_tags_terminal_and_clean(self) -> None:
        self.assertEqual(len(self.results["tags"]), 8)
        self.assertEqual(
            {item["classification"] for item in self.results["tags"]},
            {"DUAL_SAT_VALIDATED_EQUALITY_CLEAN"},
        )
        self.assertFalse(V.verify())

    def test_nonexact_rows_never_supply_offsupport(self) -> None:
        self.assertEqual(
            set(W.EXACT_ROWS), {"PRow", "PRhoRow", "S0Row", "S1Row", "DBRow"}
        )
        for item in self.results["tags"]:
            for cut in item["cuts"]:
                negative = [
                    atom
                    for atom in cut["source_atoms"]
                    if atom["kind"] == "support" and not atom["value"]
                ]
                self.assertTrue(negative)
                self.assertTrue(all(atom["name"] in W.EXACT_ROWS for atom in negative))

    def test_drop_one_path_fact_is_rejected(self) -> None:
        cuts = [cut for item in self.results["tags"] for cut in item["cuts"]]
        self.assertGreater(len(cuts), 0)
        for cut in cuts:
            item = next(
                item
                for item in self.results["tags"]
                if item["tag"] == cut["cut_id"].rsplit("-cut-", 1)[0]
            )
            tag = next(tag for tag in W.V2.TAGS if tag.name == item["tag"])
            path = (
                ROOT
                / "artifacts"
                / tag.name
                / f"candidate_{cut['candidate_iteration']:03d}.{cut['discovery_solver']}.model.json"
            )
            model = V.semantic_to_flat(json.loads(path.read_text()))
            self.assertFalse(W.validate_cut(cut, model))
            for index in range(len(cut["source_atoms"])):
                altered = dict(cut)
                altered["source_atoms"] = (
                    cut["source_atoms"][:index] + cut["source_atoms"][index + 1 :]
                )
                self.assertTrue(W.validate_cut(altered, model))

    def test_dual_solver_controls(self) -> None:
        for name, control in self.results["controls"].items():
            for solver in ("z3", "cvc5"):
                self.assertEqual(
                    control["solvers"][solver]["status"],
                    control["expected"],
                    f"{name}/{solver}",
                )

    def test_every_smt_has_one_check_sat(self) -> None:
        for path in ROOT.glob("artifacts/**/*.smt2"):
            self.assertEqual(path.read_text().count("(check-sat)"), 1, str(path))


if __name__ == "__main__":
    unittest.main()
