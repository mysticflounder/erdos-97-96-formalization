# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

from pathlib import Path
import tempfile
import unittest

import emit_checkpointed_rup_replay as subject
import materialize_checkpointed_rup


CNF = """\
p cnf 2 3
1 2 0
-1 0
-2 0
"""

PURE_RUP = """\
4 2 0 1 2 0
1 d 1 2 0
5 0 3 4 0
"""


class EmitCheckpointedRupReplayTest(unittest.TestCase):
    def materialize_package(self, root: Path) -> Path:
        cnf = root / "input.cnf"
        lrat = root / "input.lrat"
        cnf.write_text(CNF, encoding="ascii")
        lrat.write_text(PURE_RUP, encoding="ascii")
        package = root / "package"
        materialize_checkpointed_rup.materialize(
            cnf_path=cnf,
            lrat_path=lrat,
            output_dir=package,
            second_shard_first_addition=5,
        )
        return package

    def test_emission_is_deterministic_and_derives_n(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.materialize_package(root)
            first = root / "first"
            second = root / "second"
            first_result = subject.emit(package, first)
            second_result = subject.emit(package, second)
            self.assertEqual(first_result["n"], 3)
            self.assertEqual(first_result["n"], second_result["n"])
            self.assertEqual(first_result["package_sha256"], second_result["package_sha256"])
            for relative in (
                "start.cnf",
                "checkpoint.cnf",
                "shard-1.lrat",
                "shard-2.lrat",
                "CheckpointedRupReplay/Common.lean",
                "CheckpointedRupReplay/First.lean",
                "CheckpointedRupReplay/Second.lean",
                "CheckpointedRupReplay/Compose.lean",
            ):
                self.assertEqual((first / relative).read_bytes(), (second / relative).read_bytes())

    def test_shards_have_independent_inputs_and_compose_without_replay(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "replay"
            subject.emit(self.materialize_package(root), output)
            common = (output / "CheckpointedRupReplay/Common.lean").read_text(encoding="utf-8")
            first = (output / "CheckpointedRupReplay/First.lean").read_text(encoding="utf-8")
            second = (output / "CheckpointedRupReplay/Second.lean").read_text(encoding="utf-8")
            compose = (output / "CheckpointedRupReplay/Compose.lean").read_text(encoding="utf-8")
            self.assertIn('include_str "../start.cnf"', common)
            self.assertIn('include_str "../checkpoint.cnf"', common)
            self.assertEqual(first.count("include_str"), 1)
            self.assertIn('include_str "../shard-1.lrat"', first)
            self.assertNotIn("shard-2.lrat", first)
            self.assertIn("set_option maxHeartbeats 0 in", first)
            self.assertIn("set_option maxRecDepth 2000000 in", first)
            self.assertIn("unfold n startText firstText checkpointText", first)
            self.assertIn("  decide", first)
            self.assertEqual(second.count("include_str"), 1)
            self.assertIn('include_str "../shard-2.lrat"', second)
            self.assertNotIn("shard-1.lrat", second)
            self.assertIn("set_option maxHeartbeats 0 in", second)
            self.assertIn("set_option maxRecDepth 2000000 in", second)
            self.assertIn("unfold n checkpointText secondText", second)
            self.assertIn("  decide", second)
            self.assertIn("import CheckpointedRupReplay.First", compose)
            self.assertIn("import CheckpointedRupReplay.Second", compose)
            self.assertIn("checkSeparateText_sound", compose)
            self.assertNotIn("include_str", compose)
            for source in (common, first, second, compose):
                for token in subject.FORBIDDEN_GENERATED_TOKENS:
                    self.assertNotIn(token, source.lower())

    def test_refuses_overwrite(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "replay"
            output.mkdir()
            sentinel = output / "preserve.txt"
            sentinel.write_text("keep", encoding="utf-8")
            with self.assertRaises(subject.ReplayEmissionError):
                subject.emit(self.materialize_package(root), output)
            self.assertEqual(sentinel.read_text(encoding="utf-8"), "keep")

    def test_rejects_package_artifact_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.materialize_package(root)
            (package / "start.cnf").write_text("p cnf 1 1\n1 0\n", encoding="ascii")
            output = root / "replay"
            with self.assertRaises(materialize_checkpointed_rup.MaterializationError):
                subject.emit(package, output)
            self.assertFalse(output.exists())


if __name__ == "__main__":
    unittest.main()
