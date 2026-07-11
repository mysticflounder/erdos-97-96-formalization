# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import importlib.util
import json
import tempfile
import unittest
from pathlib import Path


ROOT = Path(__file__).parents[3]
SCRIPT = ROOT / "scripts" / "census554-general-n-core-miner.py"
RESULTS = ROOT / "certificates" / "census554_general_n_core_mining.json"
BANK = ROOT / "scratch" / "census-554" / "bank.jsonl"
STRUCTURAL_BANK = (
    ROOT / "lean" / "Erdos9796Proof" / "P97" / "Census554" / "Bank"
    / "EqualityCore.lean"
)

spec = importlib.util.spec_from_file_location("census554_core_miner", SCRIPT)
assert spec is not None and spec.loader is not None
miner = importlib.util.module_from_spec(spec)
spec.loader.exec_module(miner)


def pattern(rows: dict[int, list[int]]):
    return miner.normalized_pattern({
        "pattern": {str(center): mask for center, mask in rows.items()}
    })


class GeneralNCoreMinerTests(unittest.TestCase):
    def test_duplicate_center_core(self) -> None:
        motif = pattern({
            1: [0, 3],
            2: [1, 3],
            3: [1, 2],
            4: [0, 2, 3],
        })
        witnesses = miner.core_witnesses(motif)
        self.assertTrue(witnesses["duplicate_center"])
        self.assertEqual(miner.primary_status(witnesses), "duplicate-center")

    def test_equal_k4_core(self) -> None:
        motif = pattern({
            0: [1, 2],
            1: [0, 2, 3],
            3: [0, 1, 2],
        })
        witnesses = miner.core_witnesses(motif)
        self.assertTrue(witnesses["equal_k4"])
        self.assertEqual(miner.primary_status(witnesses), "equal-K4")

    def test_equilateral_bisector_core(self) -> None:
        motif = pattern({
            0: [1, 2],
            1: [0, 3, 4],
            3: [0, 1, 2],
            4: [2, 3],
        })
        witnesses = miner.core_witnesses(motif)
        self.assertTrue(witnesses["equilateral_bisector"])
        self.assertEqual(
            miner.primary_status(witnesses), "equilateral-bisector"
        )

    def test_three_triad_core(self) -> None:
        motif = pattern({
            0: [1, 2],
            1: [0, 3],
            2: [1, 3, 4],
            4: [0, 1, 3],
        })
        witnesses = miner.core_witnesses(motif)
        self.assertTrue(witnesses["three_triad"])
        self.assertEqual(miner.primary_status(witnesses), "three-triad")

    def test_canonical_key_ignores_support_labels(self) -> None:
        left = pattern({0: [1, 2], 1: [0, 2, 3], 3: [0, 1, 2]})
        right = pattern({7: [2, 9], 2: [7, 9, 4], 4: [7, 2, 9]})
        self.assertEqual(miner.canonical_key(left), miner.canonical_key(right))

    def test_three_triad_emitter(self) -> None:
        row = {
            "pid": "pat_00187",
            "pattern": {
                "0": [1, 2],
                "1": [0, 3],
                "2": [1, 3, 4],
                "4": [0, 1, 3],
            },
            "n_orbit": 1,
            "kill": "fixture",
        }
        with tempfile.TemporaryDirectory() as directory:
            lean_bank_dir = Path(directory)
            (lean_bank_dir / "Pat00187.lean").write_text("")
            rendered = miner.render_equal_k4_bank([row], lean_bank_dir)
        self.assertIn(
            "import Erdos9796Proof.P97.Census554.ThreeTriadCollision",
            rendered,
        )
        self.assertIn(
            "private def threeTriadCore_pat00187 : "
            "ThreeTriadCollisionCore pat00187",
            rendered,
        )
        self.assertIn("hAB := by decide", rendered)
        self.assertIn(
            "isDead_pat00187_of_threeTriadCore : IsDead pat00187",
            rendered,
        )

    def test_orbit_counts_deduplicate_pids(self) -> None:
        rows = [
            {"pid": "pat_00003", "n_orbit": 36},
            {"pid": "pat_00003", "n_orbit": 36},
        ]
        counts = miner.status_counts(
            rows, ["equilateral-bisector", "equilateral-bisector"]
        )
        self.assertEqual(
            counts["unique_pid_role_labeled_orbit_instances"]
                ["equilateral-bisector"],
            36,
        )
        self.assertEqual(
            counts["row_weighted_role_labeled_orbit_instances"]
                ["equilateral-bisector"],
            72,
        )

    def test_saved_summary_and_markdown(self) -> None:
        artifact = json.loads(RESULTS.read_text())
        source = artifact["source"]
        self.assertEqual(
            artifact["bank"]["bank_rows"],
            {
                "duplicate-center": 1148,
                "equal-K4": 283,
                "equilateral-bisector": 1116,
                "three-triad": 230,
                "other": 2855,
            },
        )
        self.assertEqual(
            artifact["generated_lean_bank"]["counts"],
            {
                "duplicate-center": 0,
                "equal-K4": 12,
                "equilateral-bisector": 2,
                "three-triad": 0,
                "other": 7,
            },
        )
        self.assertEqual(source["row_limit"], 5632)
        raw = miner.prefix_rows(BANK.read_bytes(), source["row_limit"])
        rebuilt = miner.analyze(
            raw,
            bank_path=Path(source["bank"]),
            lean_bank_dir=Path(source["lean_bank_dir"]),
            prefix_checkpoint=source["prefix_checkpoint"],
            recent_count=source["recent_count"],
            top_limit=12,
            row_limit=source["row_limit"],
        )
        # The artifact is JSON; histogram keys become strings when persisted.
        rebuilt = json.loads(json.dumps(rebuilt, sort_keys=True))
        rebuilt["generated_at"] = artifact["generated_at"]
        self.assertEqual(rebuilt, artifact)
        self.assertEqual(
            miner.markdown(artifact), RESULTS.with_suffix(".md").read_text()
        )
        rows = [json.loads(line) for line in raw.splitlines() if line.strip()]
        self.assertEqual(
            miner.render_equal_k4_bank(rows, Path(source["lean_bank_dir"])),
            STRUCTURAL_BANK.read_text(),
        )


if __name__ == "__main__":
    unittest.main()
