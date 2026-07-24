# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

from pathlib import Path
import tempfile
import unittest

import attest_checkpointed_rup_replay as subject
import materialize_checkpointed_rup as package_tools


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


class ReplayAttestationTest(unittest.TestCase):
    def make_fixture(self, root: Path) -> dict[str, object]:
        cnf_path = root / "input.cnf"
        lrat_path = root / "input.lrat"
        checker_path = root / "CheckpointedRup.lean"
        replay_report = root / "replay.txt"
        axiom_report = root / "axioms.txt"
        cnf_path.write_text(CNF, encoding="ascii")
        lrat_path.write_text(PURE_RUP, encoding="ascii")
        checker_path.write_text(
            "theorem replayed : True := by trivial\n",
            encoding="utf-8",
        )
        replay_report.write_text(
            "Lean replay command exited 0.\n",
            encoding="utf-8",
        )
        axiom_report.write_text(
            "axioms: [propext, Classical.choice, Quot.sound]\n",
            encoding="utf-8",
        )
        package_dir = root / "package"
        manifest = package_tools.materialize(
            cnf_path=cnf_path,
            lrat_path=lrat_path,
            output_dir=package_dir,
            second_shard_first_addition=5,
            checker_path=checker_path,
        )

        def local_artifact(path: Path) -> dict[str, object]:
            return {
                "path": path.name,
                "sha256": package_tools.sha256(path),
                "byte_count": path.stat().st_size,
            }

        return {
            "schema": subject.SCHEMA,
            "package": {
                "path": package_dir.name,
                "package_sha256": manifest["package_sha256"],
            },
            "checker": local_artifact(checker_path),
            "replay_inputs": {
                label: {
                    "sha256": artifact["sha256"],
                    "byte_count": artifact["byte_count"],
                }
                for label, artifact in manifest["artifacts"].items()
            },
            "theorem": "Problem97.CheckpointedRup.p5ExactTwoUnsat",
            "result": {
                "status": "PASS",
                "invocation": "lake env lean P5ExactTwoReplay.lean",
                "report": local_artifact(replay_report),
            },
            "axiom_audit": {
                "status": "PASS",
                "theorem": "Problem97.CheckpointedRup.p5ExactTwoUnsat",
                "invocation": "#print axioms "
                "Problem97.CheckpointedRup.p5ExactTwoUnsat",
                "observed_axioms": [
                    "Classical.choice",
                    "Quot.sound",
                    "propext",
                ],
                "forbidden_axioms_absent": ["sorryAx"],
                "report": local_artifact(axiom_report),
            },
        }

    def test_produces_and_verifies_canonical_digest(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            record = self.make_fixture(root)
            digest = subject.validate_replay_record(record, base_dir=root)
            record["attestation_sha256"] = digest
            self.assertEqual(
                subject.validate_replay_record(record, base_dir=root),
                digest,
            )

    def test_rejects_package_digest_mismatch(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            record = self.make_fixture(root)
            record["package"]["package_sha256"] = "0" * 64
            with self.assertRaisesRegex(
                subject.AttestationError,
                "package SHA-256 does not match",
            ):
                subject.validate_replay_record(record, base_dir=root)

    def test_rejects_replay_input_artifact_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            record = self.make_fixture(root)
            record["replay_inputs"]["shard_2_lrat"]["sha256"] = "0" * 64
            with self.assertRaisesRegex(
                subject.AttestationError,
                "replay input artifact drift",
            ):
                subject.validate_replay_record(record, base_dir=root)

    def test_rejects_checker_drift(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            record = self.make_fixture(root)
            (root / "CheckpointedRup.lean").write_text(
                "theorem changed : False := by contradiction\n",
                encoding="utf-8",
            )
            with self.assertRaisesRegex(
                subject.AttestationError,
                "Lean checker (byte-count|SHA-256) drift",
            ):
                subject.validate_replay_record(record, base_dir=root)

    def test_rejects_self_hashed_checker_not_bound_by_package(self) -> None:
        with tempfile.TemporaryDirectory() as raw_root:
            root = Path(raw_root)
            record = self.make_fixture(root)
            other_checker = root / "OtherCheckpointedRup.lean"
            other_checker.write_text(
                "theorem alternate : True := by trivial\n",
                encoding="utf-8",
            )
            record["checker"] = {
                "path": other_checker.name,
                "sha256": package_tools.sha256(other_checker),
                "byte_count": other_checker.stat().st_size,
            }
            with self.assertRaisesRegex(
                subject.AttestationError,
                "Lean checker does not match package manifest",
            ):
                subject.validate_replay_record(record, base_dir=root)


if __name__ == "__main__":
    unittest.main()
