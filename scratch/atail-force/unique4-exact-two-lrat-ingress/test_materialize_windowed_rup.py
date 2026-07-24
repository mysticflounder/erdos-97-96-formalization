# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import json
from pathlib import Path
import tempfile
import unittest

import materialize_checkpointed_rup as base
import materialize_windowed_rup as subject


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

START_CLAUSES = {1: (1, 2), 2: (-1,), 3: (-2,)}


class MaterializeWindowedRupTest(unittest.TestCase):
    def build_parent(self, root: Path, name: str = "parent") -> Path:
        cnf_path = root / "input.cnf"
        lrat_path = root / "input.lrat"
        root.mkdir(parents=True, exist_ok=True)
        cnf_path.write_text(CNF, encoding="ascii")
        lrat_path.write_text(PURE_RUP, encoding="ascii")
        output = root / name
        base.materialize(
            cnf_path=cnf_path,
            lrat_path=lrat_path,
            output_dir=output,
            second_shard_first_addition=5,
        )
        return output

    def window(
        self,
        root: Path,
        name: str = "windows",
        *,
        parent: Path | None = None,
        max_actions: int = subject.DEFAULT_MAX_ACTIONS,
        max_lrat_bytes: int = subject.DEFAULT_MAX_LRAT_BYTES,
    ) -> Path:
        if parent is None:
            parent = self.build_parent(root)
        output = root / name
        subject.materialize_windows(
            package_dir=parent,
            output_dir=output,
            max_actions=max_actions,
            max_lrat_bytes=max_lrat_bytes,
        )
        return output

    def run_windower(
        self,
        root: Path,
        lines: str,
        *,
        terminal: bool = False,
        max_actions: int = 100,
        max_lrat_bytes: int = 1 << 20,
    ) -> subject.ShardWindower:
        stage = root / "stage"
        (stage / "checkpoints").mkdir(parents=True)
        lrat_path = root / "shard.lrat"
        lrat_path.write_text(lines, encoding="ascii")
        windower = subject.ShardWindower(
            shard_label="shard-t",
            variable_count=2,
            start_clauses=dict(START_CLAUSES),
            first_addition_id=4,
            stage_dir=stage,
            checkpoints_dir=stage / "checkpoints",
            caps_max_actions=max_actions,
            caps_max_lrat_bytes=max_lrat_bytes,
            shard_to_global=lambda shard_id: shard_id,
            terminal=terminal,
            first_checkpoint_index=0,
        )
        windower.run(lrat_path)
        windower.finish()
        return windower

    def test_windows_tiny_package_with_unit_action_cap(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            manifest = json.loads(
                (output / "manifest.json").read_text(encoding="utf-8")
            )
            self.assertEqual(manifest["counts"]["windows"], 3)
            self.assertEqual(manifest["counts"]["checkpoints"], 4)
            self.assertEqual(manifest["counts"]["shard_1"]["windows"], 2)
            self.assertEqual(manifest["counts"]["shard_2"]["windows"], 1)
            self.assertEqual(
                manifest["numbering"]["shard_boundary_checkpoint"],
                2,
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0000.cnf").read_text(
                    encoding="ascii"
                ),
                CNF,
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0001.cnf").read_text(
                    encoding="ascii"
                ),
                "p cnf 2 4\n1 2 0\n-1 0\n-2 0\n2 0\n",
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0002.cnf").read_text(
                    encoding="ascii"
                ),
                "p cnf 2 2\n-2 0\n2 0\n",
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0003.cnf").read_text(
                    encoding="ascii"
                ),
                "p cnf 2 3\n-2 0\n2 0\n0\n",
            )
            self.assertEqual(
                (output / "shard-1/window-0001/actions.lrat").read_text(
                    encoding="ascii"
                ),
                "4 2 0 1 2 0\n",
            )
            self.assertEqual(
                (output / "shard-1/window-0002/actions.lrat").read_text(
                    encoding="ascii"
                ),
                "1 d 1 2 0\n",
            )
            self.assertEqual(
                (output / "shard-2/window-0001/actions.lrat").read_text(
                    encoding="ascii"
                ),
                "3 0 1 2 0\n",
            )
            self.assertEqual(
                (output / "shard-1/window-0001/map.tsv").read_text(
                    encoding="ascii"
                ),
                subject.MAP_HEADER
                + "\n1\t1\t1\n2\t2\t2\n3\t3\t3\n4\t4\t4\n",
            )
            self.assertEqual(
                (output / "shard-2/window-0001/map.tsv").read_text(
                    encoding="ascii"
                ),
                subject.MAP_HEADER + "\n1\t1\t3\n2\t2\t4\n3\t3\t5\n",
            )
            shard_1 = manifest["windows"]["shard_1"]
            shard_2 = manifest["windows"]["shard_2"]
            self.assertEqual(
                shard_1[0]["end_checkpoint"],
                shard_1[1]["start_checkpoint"],
            )
            self.assertEqual(
                shard_1[1]["end_checkpoint"],
                shard_2[0]["start_checkpoint"],
            )
            self.assertEqual(shard_1[0]["role"], "rebase")
            self.assertEqual(shard_2[0]["role"], "terminal")
            subject.verify_windowed_package(output)

    def test_default_caps_yield_one_window_per_shard(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            output = self.window(root, parent=parent)
            manifest = json.loads(
                (output / "manifest.json").read_text(encoding="utf-8")
            )
            self.assertEqual(manifest["counts"]["shard_1"]["windows"], 1)
            self.assertEqual(manifest["counts"]["shard_2"]["windows"], 1)
            self.assertEqual(manifest["counts"]["checkpoints"], 3)
            self.assertEqual(
                manifest["numbering"]["shard_boundary_checkpoint"],
                1,
            )
            self.assertEqual(
                (output / "shard-1/window-0001/actions.lrat").read_bytes(),
                (parent / "shard-1.lrat").read_bytes(),
            )
            self.assertEqual(
                (output / "shard-2/window-0001/actions.lrat").read_bytes(),
                (parent / "shard-2.lrat").read_bytes(),
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0000.cnf").read_bytes(),
                (parent / "start.cnf").read_bytes(),
            )
            self.assertEqual(
                (output / "checkpoints/checkpoint-0001.cnf").read_bytes(),
                (parent / "checkpoint.cnf").read_bytes(),
            )
            subject.verify_windowed_package(output)

    def test_outputs_are_deterministic(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            first = self.window(root, "first", parent=parent, max_actions=1)
            second = self.window(root, "second", parent=parent, max_actions=1)
            self.assertEqual(
                (first / "manifest.json").read_bytes(),
                (second / "manifest.json").read_bytes(),
            )
            for record in json.loads(
                (first / "manifest.json").read_text(encoding="utf-8")
            )["checkpoints"]:
                self.assertEqual(
                    (first / record["path"]).read_bytes(),
                    (second / record["path"]).read_bytes(),
                )

    def test_package_digest_is_relocation_stable(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            left = self.window(root / "left", max_actions=1)
            right = self.window(root / "right", max_actions=1)
            left_payload = subject.verify_windowed_package(left)
            right_payload = subject.verify_windowed_package(right)
            self.assertEqual(
                left_payload["package_sha256"],
                right_payload["package_sha256"],
            )

    def test_rejects_nonpositive_caps(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "max-actions",
            ):
                subject.materialize_windows(
                    package_dir=parent,
                    output_dir=root / "bad-actions",
                    max_actions=0,
                )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "max-lrat-bytes",
            ):
                subject.materialize_windows(
                    package_dir=parent,
                    output_dir=root / "bad-bytes",
                    max_lrat_bytes=0,
                )

    def test_rejects_single_action_exceeding_byte_cap(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "exceeds the window byte cap",
            ):
                subject.materialize_windows(
                    package_dir=parent,
                    output_dir=root / "windows",
                    max_lrat_bytes=4,
                )
            self.assertFalse((root / "windows").exists())

    def test_byte_cap_produces_whole_line_windows(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_lrat_bytes=12)
            manifest = json.loads(
                (output / "manifest.json").read_text(encoding="utf-8")
            )
            self.assertEqual(manifest["counts"]["shard_1"]["windows"], 2)
            self.assertEqual(manifest["counts"]["shard_2"]["windows"], 1)
            for shard in manifest["windows"].values():
                for record in shard:
                    actions = record["artifacts"]["actions_lrat"]
                    self.assertLessEqual(actions["byte_count"], 12)
                    text = (output / actions["path"]).read_text(
                        encoding="ascii"
                    )
                    self.assertTrue(text.endswith("\n"))
            subject.verify_windowed_package(output)

    def test_rejects_existing_output_dir(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            output = self.window(root, parent=parent)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "refusing to overwrite",
            ):
                subject.materialize_windows(
                    package_dir=parent,
                    output_dir=output,
                )

    def test_rejects_parent_package_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            with (parent / "shard-2.lrat").open("a", encoding="ascii") as f:
                f.write("1 d 1 0\n")
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "byte-count drift",
            ):
                subject.materialize_windows(
                    package_dir=parent,
                    output_dir=root / "windows",
                )

    def test_rejects_inactive_hint(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "RUP hint 1 is inactive",
            ):
                self.run_windower(
                    Path(raw_root),
                    "1 d 1 0\n4 2 0 1 3 0\n",
                )

    def test_rejects_unseen_deletion(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "unseen clause 9",
            ):
                self.run_windower(Path(raw_root), "1 d 9 0\n")

    def test_rejects_repeated_deletion(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "inactive clause 1",
            ):
                self.run_windower(Path(raw_root), "1 d 1 0\n1 d 1 0\n")

    def test_rejects_non_dense_addition_id(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "non-dense addition id",
            ):
                self.run_windower(Path(raw_root), "5 2 0 1 2 0\n")

    def test_rejects_noncanonical_spelling(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "noncanonical addition spelling",
            ):
                self.run_windower(Path(raw_root), "4  2 0 1 2 0\n")

    def test_rejects_empty_clause_in_nonterminal_shard(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "empty clause occurs in non-terminal",
            ):
                self.run_windower(Path(raw_root), "4 0 1 2 3 0\n")

    def test_rejects_missing_terminal_empty_clause(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "exactly one empty clause",
            ):
                self.run_windower(
                    Path(raw_root),
                    "4 2 0 1 2 0\n",
                    terminal=True,
                )

    def test_rejects_action_after_empty_clause(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "action follows the empty clause",
            ):
                self.run_windower(
                    Path(raw_root),
                    "4 0 1 2 3 0\n1 d 1 0\n",
                    terminal=True,
                )

    def test_verifier_rejects_window_and_checkpoint_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            parent = self.build_parent(root)
            action_output = self.window(
                root, "action-drift", parent=parent, max_actions=1
            )
            with (
                action_output / "shard-1/window-0001/actions.lrat"
            ).open("a", encoding="ascii") as f:
                f.write("1 d 3 0\n")
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "byte-count drift",
            ):
                subject.verify_windowed_package(action_output)

            checkpoint_output = self.window(
                root, "checkpoint-drift", parent=parent, max_actions=1
            )
            path = checkpoint_output / "checkpoints/checkpoint-0001.cnf"
            path.write_text(
                "p cnf 2 4\n1 2 0\n-1 0\n-2 0\n1 0\n",
                encoding="ascii",
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "SHA-256 drift",
            ):
                subject.verify_windowed_package(checkpoint_output)

    def test_verifier_rejects_manifest_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            manifest_path = output / "manifest.json"
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            payload["counts"]["windows"] += 1
            manifest_path.write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "package SHA-256 drift",
            ):
                subject.verify_windowed_package(output)

    def test_verifier_rejects_decoupled_shared_checkpoint(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            manifest_path = output / "manifest.json"
            payload = json.loads(manifest_path.read_text(encoding="utf-8"))
            payload["windows"]["shard_1"][1]["start_checkpoint"] = 0
            payload["package_sha256"] = subject.compute_package_digest(
                payload
            )
            manifest_path.write_text(
                json.dumps(payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "does not share the previous window's canonical checkpoint",
            ):
                subject.verify_windowed_package(output)

    def test_map_authentication_rejects_noninjective_global_ids(self) -> None:
        with self.assertRaisesRegex(
            subject.MaterializationError,
            "not injective",
        ):
            subject.authenticate_window_map(
                [(1, 1, 7), (2, 2, 7)],
                label="test map",
                start_shard_ids=[1, 2],
                addition_shard_ids=[],
            )

    def rehash_manifest(self, output: Path, mutate) -> None:
        """Apply a coordinated tamper: mutate, then recompute the digest."""

        manifest_path = output / "manifest.json"
        payload = json.loads(manifest_path.read_text(encoding="utf-8"))
        mutate(payload)
        payload["package_sha256"] = subject.compute_package_digest(payload)
        manifest_path.write_text(
            json.dumps(payload, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )

    def refresh_artifact(self, output: Path, record: dict) -> None:
        path = output / record["path"]
        record["sha256"] = base.sha256(path)
        record["byte_count"] = path.stat().st_size

    def test_replay_rejects_rehashed_end_checkpoint_reorder(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            (output / "checkpoints/checkpoint-0001.cnf").write_text(
                "p cnf 2 4\n1 2 0\n-2 0\n-1 0\n2 0\n",
                encoding="ascii",
            )
            self.rehash_manifest(
                output,
                lambda payload: self.refresh_artifact(
                    output, payload["checkpoints"][1]
                ),
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "does not replay to its shared end checkpoint",
            ):
                subject.verify_windowed_package(output)

    def test_replay_rejects_rehashed_action_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            (output / "shard-1/window-0002/actions.lrat").write_text(
                "1 d 1 3 0\n",
                encoding="ascii",
            )
            self.rehash_manifest(
                output,
                lambda payload: self.refresh_artifact(
                    output,
                    payload["windows"]["shard_1"][1]["artifacts"][
                        "actions_lrat"
                    ],
                ),
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "does not replay to its shared end checkpoint",
            ):
                subject.verify_windowed_package(output)

    def test_replay_rejects_rehashed_hint_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            (output / "shard-1/window-0001/actions.lrat").write_text(
                "4 2 0 1 4 0\n",
                encoding="ascii",
            )
            self.rehash_manifest(
                output,
                lambda payload: self.refresh_artifact(
                    output,
                    payload["windows"]["shard_1"][0]["artifacts"][
                        "actions_lrat"
                    ],
                ),
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "not earlier than addition",
            ):
                subject.verify_windowed_package(output)

    def test_map_rejects_rehashed_shard_id_tamper(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            output = self.window(root, max_actions=1)
            (output / "shard-2/window-0001/map.tsv").write_text(
                subject.MAP_HEADER + "\n1\t1\t3\n2\t5\t4\n3\t3\t5\n",
                encoding="ascii",
            )
            self.rehash_manifest(
                output,
                lambda payload: self.refresh_artifact(
                    output,
                    payload["windows"]["shard_2"][0]["artifacts"]["map"],
                ),
            )
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "shard-local id drift",
            ):
                subject.verify_windowed_package(output)

    def test_map_rejects_rehashed_global_id_tampers(self) -> None:
        cases = {
            "addition-offset": (
                subject.MAP_HEADER + "\n1\t1\t3\n2\t2\t4\n3\t3\t7\n",
                "global id drift",
            ),
            "checkpoint-range": (
                subject.MAP_HEADER + "\n1\t1\t9\n2\t2\t4\n3\t3\t5\n",
                "global id out of range",
            ),
        }
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            for name, (map_text, message) in cases.items():
                with self.subTest(name=name):
                    output = self.window(root / name, max_actions=1)
                    (output / "shard-2/window-0001/map.tsv").write_text(
                        map_text,
                        encoding="ascii",
                    )
                    self.rehash_manifest(
                        output,
                        lambda payload: self.refresh_artifact(
                            output,
                            payload["windows"]["shard_2"][0]["artifacts"][
                                "map"
                            ],
                        ),
                    )
                    with self.assertRaisesRegex(
                        subject.MaterializationError,
                        message,
                    ):
                        subject.verify_windowed_package(output)

    def test_verifier_rejects_rehashed_count_and_span_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            count_output = self.window(root / "counts", max_actions=1)

            def bump_hints(payload: dict) -> None:
                payload["windows"]["shard_1"][0]["counts"]["hints"] += 1

            self.rehash_manifest(count_output, bump_hints)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "recorded counts drift from the replayed actions",
            ):
                subject.verify_windowed_package(count_output)

            span_output = self.window(root / "span", max_actions=1)

            def stretch_span(payload: dict) -> None:
                payload["windows"]["shard_1"][0]["numbering"][
                    "addition_shard_ids"
                ] = [4, 5]

            self.rehash_manifest(span_output, stretch_span)
            with self.assertRaisesRegex(
                subject.MaterializationError,
                "addition shard-id span drift",
            ):
                subject.verify_windowed_package(span_output)


if __name__ == "__main__":
    unittest.main()
