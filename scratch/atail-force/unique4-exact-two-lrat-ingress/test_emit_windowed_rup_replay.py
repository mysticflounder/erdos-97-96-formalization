# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

from pathlib import Path
import tempfile
import unittest

import emit_windowed_rup_replay as subject
import materialize_checkpointed_rup as base
import materialize_windowed_rup as windows


CNF = "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
PURE_RUP = "4 2 0 1 2 0\n1 d 1 2 0\n5 0 3 4 0\n"


class EmitWindowedRupReplayTest(unittest.TestCase):
    def package(self, root: Path) -> Path:
        cnf = root / "input.cnf"
        lrat = root / "input.lrat"
        cnf.write_text(CNF, encoding="ascii")
        lrat.write_text(PURE_RUP, encoding="ascii")
        parent = root / "parent"
        base.materialize(
            cnf_path=cnf,
            lrat_path=lrat,
            output_dir=parent,
            second_shard_first_addition=5,
        )
        package = root / "windows"
        windows.materialize_windows(
            package_dir=parent,
            output_dir=package,
            max_actions=1,
            max_lrat_bytes=1 << 20,
        )
        return package

    def test_emits_selected_rebase_window(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            output = root / "replay"
            result = subject.emit(
                package, output, shard=1, window=1
            )
            self.assertEqual(result["role"], "rebase")
            self.assertEqual(result["start_checkpoint"], 0)
            self.assertEqual(result["end_checkpoint"], 1)
            self.assertEqual(
                (output / "start.cnf").read_bytes(),
                (package / "checkpoints/checkpoint-0000.cnf").read_bytes(),
            )
            self.assertEqual(
                (output / "end.cnf").read_bytes(),
                (package / "checkpoints/checkpoint-0001.cnf").read_bytes(),
            )
            common = (
                output / "WindowedRupReplay/Common.lean"
            ).read_text(encoding="utf-8")
            window = (
                output / "WindowedRupReplay/Window.lean"
            ).read_text(encoding="utf-8")
            self.assertIn('include_str "../start.cnf"', common)
            self.assertIn('include_str "../actions.lrat"', common)
            self.assertIn('include_str "../end.cnf"', common)
            self.assertEqual(common.count("set_option maxHeartbeats 0 in"), 2)
            self.assertIn("Option.eq_some_of_isSome startIsSome", common)
            self.assertIn("Option.eq_some_of_isSome finishIsSome", common)
            self.assertIn("checkRebaseText", window)
            self.assertIn("checkRebaseText_sound_of_parse", window)

    def test_emits_terminal_window_with_terminal_checker(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "replay"
            result = subject.emit(
                self.package(root), output, shard=2, window=1
            )
            self.assertEqual(result["role"], "terminal")
            window = (
                output / "WindowedRupReplay/Window.lean"
            ).read_text(encoding="utf-8")
            self.assertIn("checkTerminalText", window)
            self.assertIn("checkTerminalText_sound_of_parse", window)
            self.assertNotIn("checkRebaseText", window)

    def test_is_deterministic_and_refuses_overwrite(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            first = root / "first"
            second = root / "second"
            subject.emit(package, first, shard=1, window=2)
            subject.emit(package, second, shard=1, window=2)
            for relative in (
                "start.cnf",
                "actions.lrat",
                "end.cnf",
                "WindowedRupReplay/Common.lean",
                "WindowedRupReplay/Window.lean",
            ):
                self.assertEqual(
                    (first / relative).read_bytes(),
                    (second / relative).read_bytes(),
                )
            with self.assertRaises(subject.WindowReplayEmissionError):
                subject.emit(package, first, shard=1, window=2)

    def test_rejects_out_of_range_selection(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            with self.assertRaises(subject.WindowReplayEmissionError):
                subject.emit(
                    self.package(root),
                    root / "replay",
                    shard=1,
                    window=99,
                )


if __name__ == "__main__":
    unittest.main()
