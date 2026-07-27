# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from pathlib import Path
import tempfile
import unittest

import emit_windowed_rup_replay_package as subject
import materialize_checkpointed_rup as base
import materialize_windowed_rup as windows


CNF = "p cnf 2 3\n1 2 0\n-1 0\n-2 0\n"
PURE_RUP = "4 2 0 1 2 0\n1 d 1 2 0\n5 0 3 4 0\n"
MULTI_RUP = "4 2 0 1 2 0\n5 2 0 3 4 0\n6 0 3 5 0\n"


class EmitWindowedRupReplayPackageTest(unittest.TestCase):
    def package(self, root: Path, *, max_actions: int = 1) -> Path:
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
            max_actions=max_actions,
            max_lrat_bytes=1 << 20,
        )
        return package

    def test_emits_shared_checkpoints_and_unique_windows(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            output = root / "replay"
            manifest = subject.emit(package, output)

            self.assertEqual(manifest["counts"]["n"], 3)
            self.assertEqual(manifest["counts"]["windows"], 3)
            self.assertEqual(
                manifest["trust_profile"],
                {
                    "audit_status": subject.TRUST_AUDIT_STATUS,
                    "allowed_axioms": subject.EXPECTED_TRUST_AXIOMS,
                },
            )
            self.assertEqual(
                manifest["epistemic_status"],
                subject.EPISTEMIC_STATUS,
            )
            checkpoint_modules = sorted(
                (output / "WindowedRupReplay/Checkpoint").glob("*.lean")
            )
            self.assertEqual(
                [path.name for path in checkpoint_modules],
                ["C0000.lean", "C0001.lean", "C0002.lean"],
            )
            self.assertFalse(
                (output / "WindowedRupReplay/Checkpoint/C0003.lean").exists()
            )
            self.assertEqual(
                sorted(
                    path.name
                    for path in (
                        output / "WindowedRupReplay/Shard1"
                    ).glob("*.lean")
                ),
                ["W0001.lean", "W0002.lean"],
            )
            self.assertEqual(
                sorted(
                    path.name
                    for path in (
                        output / "WindowedRupReplay/Shard2"
                    ).glob("*.lean")
                ),
                ["W0001.lean"],
            )
            first = (
                output / "WindowedRupReplay/Shard1/W0001.lean"
            ).read_text(encoding="utf-8")
            second = (
                output / "WindowedRupReplay/Shard1/W0002.lean"
            ).read_text(encoding="utf-8")
            self.assertIn(
                "Checkpoint.C0000.text actionText", first
            )
            self.assertIn("Checkpoint.C0001.text = true", first)
            self.assertIn(
                "Checkpoint.C0001.text actionText", second
            )
            self.assertIn("Checkpoint.C0002.text = true", second)
            self.assertIn("private def actionText", first)
            self.assertIn("native_decide", first)
            self.assertNotIn("map.tsv", "\n".join(
                path.as_posix() for path in output.rglob("*")
            ))

    def test_terminal_shape_and_shallow_composition(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "replay"
            subject.emit(self.package(root), output)
            terminal = (
                output / "WindowedRupReplay/Shard2/W0001.lean"
            ).read_text(encoding="utf-8")
            self.assertIn(
                "import WindowedRupReplay.Checkpoint.C0002", terminal
            )
            self.assertNotIn("Checkpoint.C0003", terminal)
            self.assertIn("checkTerminalText", terminal)
            self.assertIn("Unsatisfiable", terminal)

            shard_1 = (
                output / "WindowedRupReplay/Shard1.lean"
            ).read_text(encoding="utf-8")
            shard_2 = (
                output / "WindowedRupReplay/Shard2.lean"
            ).read_text(encoding="utf-8")
            compose = (
                output / "WindowedRupReplay/Compose.lean"
            ).read_text(encoding="utf-8")
            self.assertIn(
                "composeRebaseText throughW0001 W0002.sound",
                shard_1,
            )
            self.assertIn("W0001.sound", shard_2)
            self.assertNotIn("closeRebaseText", shard_2)
            self.assertEqual(
                [
                    line
                    for line in compose.splitlines()
                    if line.startswith("import ")
                ],
                [
                    "import WindowedRupReplay.Shard1",
                    "import WindowedRupReplay.Shard2",
                ],
            )
            self.assertIn(
                "closeRebaseText Shard1.sound Shard2.sound", compose
            )
            for source in (shard_1, shard_2, compose):
                self.assertNotIn("native_decide", source)
                self.assertNotIn("checkRebaseText", source)
                self.assertNotIn("checkTerminalText", source)
                self.assertNotIn("parseDimacs", source)
                self.assertNotIn("parseActions", source)

    def test_shard_two_rebase_chain_closes_with_terminal(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = root / "replay"
            subject.emit(
                self.package(root, max_actions=1),
                output,
            )
            # Use two shard-2 additions, yielding a rebase plus terminal.
            other_root = root / "other"
            other_root.mkdir()
            cnf = other_root / "input.cnf"
            lrat = other_root / "input.lrat"
            cnf.write_text(CNF, encoding="ascii")
            lrat.write_text(MULTI_RUP, encoding="ascii")
            parent = other_root / "parent"
            base.materialize(
                cnf_path=cnf,
                lrat_path=lrat,
                output_dir=parent,
                second_shard_first_addition=5,
            )
            package = other_root / "windows"
            windows.materialize_windows(
                package_dir=parent,
                output_dir=package,
                max_actions=1,
                max_lrat_bytes=1 << 20,
            )
            other_output = other_root / "replay"
            subject.emit(package, other_output)
            shard_2 = (
                other_output / "WindowedRupReplay/Shard2.lean"
            ).read_text(encoding="utf-8")
            self.assertIn("theorem throughW0001", shard_2)
            self.assertIn(
                "closeRebaseText throughW0001 W0002.sound", shard_2
            )

    def test_deterministic_refuses_overwrite_and_verifies(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            first = root / "first"
            second = root / "second"
            first_manifest = subject.emit(package, first)
            second_manifest = subject.emit(package, second)
            self.assertEqual(first_manifest, second_manifest)
            first_paths = sorted(
                path.relative_to(first)
                for path in first.rglob("*")
                if path.is_file()
            )
            second_paths = sorted(
                path.relative_to(second)
                for path in second.rglob("*")
                if path.is_file()
            )
            self.assertEqual(first_paths, second_paths)
            for relative in first_paths:
                self.assertEqual(
                    (first / relative).read_bytes(),
                    (second / relative).read_bytes(),
                )
            verified = subject.verify_replay_package(first)
            self.assertEqual(
                verified["replay_package_sha256"],
                first_manifest["replay_package_sha256"],
            )
            with self.assertRaises(subject.ReplayPackageError):
                subject.emit(package, first)

    def test_rejects_file_manifest_and_path_tampering(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)

            data_output = root / "data-tamper"
            subject.emit(package, data_output)
            action = (
                data_output
                / "data/shard-1/window-0001/actions.lrat"
            )
            action.write_text("corrupt\n", encoding="ascii")
            with self.assertRaises(subject.ReplayPackageError):
                subject.verify_replay_package(data_output)

            manifest_output = root / "manifest-tamper"
            subject.emit(package, manifest_output)
            manifest_path = (
                manifest_output / subject.MANIFEST_NAME
            )
            manifest = json.loads(
                manifest_path.read_text(encoding="utf-8")
            )
            manifest["counts"]["n"] = 999
            manifest_path.write_text(
                json.dumps(manifest, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaises(subject.ReplayPackageError):
                subject.verify_replay_package(manifest_output)

            path_output = root / "path-tamper"
            subject.emit(package, path_output)
            (path_output / "unexpected.txt").write_text(
                "unexpected", encoding="ascii"
            )
            with self.assertRaises(subject.ReplayPackageError):
                subject.verify_replay_package(path_output)

    def test_rejects_rehashed_forbidden_lean_source(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            package = self.package(root)
            output = root / "rehashed-source-tamper"
            subject.emit(package, output)
            common_path = output / "WindowedRupReplay/Common.lean"
            common_path.write_text(
                common_path.read_text(encoding="utf-8")
                + "\naxiom injected : False\n",
                encoding="utf-8",
            )
            manifest_path = output / subject.MANIFEST_NAME
            manifest = json.loads(
                manifest_path.read_text(encoding="utf-8")
            )
            common_record = next(
                record
                for record in manifest["lean_sources"]
                if record["path"] == "WindowedRupReplay/Common.lean"
            )
            common_record["byte_count"] = common_path.stat().st_size
            common_record["sha256"] = subject._sha256(common_path)
            manifest["replay_package_sha256"] = (
                subject.compute_replay_package_digest(manifest)
            )
            manifest_path.write_text(
                json.dumps(manifest, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.ReplayPackageError, "forbidden token axiom"
            ):
                subject.verify_replay_package(output)


if __name__ == "__main__":
    unittest.main()
