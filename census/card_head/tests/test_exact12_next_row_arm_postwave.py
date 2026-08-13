from __future__ import annotations

import json
import os
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory

from census.card_head.exact12_next_row_arm_cell_run import (
    JOB_SCHEMA,
    _artifact,
    _json_sha256,
    _write_json,
)
from census.card_head.exact12_next_row_arm_postwave import (
    Exact12NextRowArmPostwaveError,
    ProofCheckResult,
    _cell_dir,
    _verify_job,
    _verify_terminal_proof,
)


class Exact12NextRowArmPostwaveTest(unittest.TestCase):
    def test_terminal_proof_requires_independent_exact_verified_line(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            cnf = root / "terminal.cnf"
            proof = root / "terminal.drat"
            cnf.write_bytes(b"p cnf 0 1\n0\n")
            proof.write_bytes(b"0\n")

            _verify_terminal_proof(
                cnf,
                proof,
                checker_runner=lambda *_args: ProofCheckResult(True, 0, "s VERIFIED\n"),
            )
            for result in (
                ProofCheckResult(False, 0, "s VERIFIED\n"),
                ProofCheckResult(True, 1, "s VERIFIED\n"),
                ProofCheckResult(True, 0, "VERIFIED\n"),
            ):
                with self.assertRaisesRegex(
                    Exact12NextRowArmPostwaveError, "independent drat-trim"
                ):
                    _verify_terminal_proof(
                        cnf,
                        proof,
                        checker_runner=lambda *_args, result=result: result,
                    )

    def test_cell_directory_accepts_one_supported_padding(self) -> None:
        with TemporaryDirectory() as temporary:
            wave_dir = Path(temporary)
            os.chmod(wave_dir, 0o700)
            padded = wave_dir / "cell-0007"
            padded.mkdir()
            os.chmod(padded, 0o700)
            self.assertEqual(_cell_dir(wave_dir, 7), padded)

            (wave_dir / "cell-07").mkdir()
            os.chmod(wave_dir / "cell-07", 0o700)
            with self.assertRaisesRegex(
                Exact12NextRowArmPostwaveError, "2 candidate directories"
            ):
                _cell_dir(wave_dir, 7)

    def test_job_replay_binds_arm_ordinal_and_hashes(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            payload = {
                "schema": JOB_SCHEMA,
                "arm_cell_index": 7,
                "scope": "test",
            }
            job = {**payload, "job_id": _json_sha256(payload)}
            job_path = cell_dir / "job.json"
            _write_json(job_path, job)
            summary = {
                "artifacts": {"job": _artifact(job_path)},
                "job_id": job["job_id"],
                "job_sha256": _json_sha256(job),
            }
            self.assertEqual(
                _verify_job(cell_dir, summary, arm_cell_index=7),
                job,
            )
            with self.assertRaisesRegex(
                Exact12NextRowArmPostwaveError, "job binding failed"
            ):
                _verify_job(cell_dir, summary, arm_cell_index=8)

    def test_job_replay_rejects_symlinked_file(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            payload = {"schema": JOB_SCHEMA, "arm_cell_index": 7, "scope": "test"}
            job = {**payload, "job_id": _json_sha256(payload)}
            target = root / "target.json"
            _write_json(target, job)
            link = root / "job.json"
            link.symlink_to(target)
            summary = {
                "artifacts": {"job": _artifact(link)},
                "job_id": job["job_id"],
                "job_sha256": _json_sha256(job),
            }
            with self.assertRaisesRegex(Exact12NextRowArmPostwaveError, "symlink"):
                _verify_job(root, summary, arm_cell_index=7)

    def test_job_replay_rejects_hardlinked_file(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            payload = {"schema": JOB_SCHEMA, "arm_cell_index": 7, "scope": "test"}
            job = {**payload, "job_id": _json_sha256(payload)}
            target = root / "target.json"
            _write_json(target, job)
            alias = root / "job.json"
            os.link(target, alias)
            summary = {
                "artifacts": {"job": _artifact(alias)},
                "job_id": job["job_id"],
                "job_sha256": _json_sha256(job),
            }
            with self.assertRaisesRegex(Exact12NextRowArmPostwaveError, "hard-linked"):
                _verify_job(root, summary, arm_cell_index=7)

    def test_job_replay_rejects_noncanonical_bytes(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            payload = {"schema": JOB_SCHEMA, "arm_cell_index": 7, "scope": "test"}
            job = {**payload, "job_id": _json_sha256(payload)}
            job_path = root / "job.json"
            job_path.write_text(json.dumps(job) + "\n", encoding="utf-8")
            summary = {
                "artifacts": {"job": _artifact(job_path)},
                "job_id": job["job_id"],
                "job_sha256": _json_sha256(job),
            }
            with self.assertRaisesRegex(Exact12NextRowArmPostwaveError, "canonical"):
                _verify_job(root, summary, arm_cell_index=7)

    def test_cell_directory_rejects_mutable_mode_and_ancestor_link(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            os.chmod(root, 0o755)
            (root / "cell-0007").mkdir()
            os.chmod(root / "cell-0007", 0o700)
            with self.assertRaisesRegex(Exact12NextRowArmPostwaveError, "0700"):
                _cell_dir(root, 7)

            secure = root / "secure"
            secure.mkdir()
            os.chmod(secure, 0o700)
            real = secure / "real"
            real.mkdir()
            os.chmod(real, 0o700)
            alias = secure / "alias"
            alias.symlink_to(real, target_is_directory=True)
            with self.assertRaisesRegex(Exact12NextRowArmPostwaveError, "symlink"):
                _cell_dir(alias, 7)


if __name__ == "__main__":
    unittest.main()
