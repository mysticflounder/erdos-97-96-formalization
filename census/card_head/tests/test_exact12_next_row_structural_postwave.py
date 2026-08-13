from __future__ import annotations

import os
import unittest
from collections import Counter, defaultdict
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest.mock import patch

from census.card_head.exact12_next_row_cell_run import _artifact
from census.card_head.exact12_next_row_structural_postwave import (
    Exact12NextRowStructuralPostwaveError,
    _aggregate_record,
    _counter_payload,
    _sha256_file,
    _verify_artifact,
    _verify_drat,
    _verify_terminal_artifacts,
)


def _terminal_fixture(cell_dir: Path) -> tuple[dict[str, object], str]:
    cnf = cell_dir / "discovery.cnf"
    terminal = cell_dir / "terminal.cnf"
    proof = cell_dir / "terminal.drat"
    cnf.write_bytes(b"p cnf 1 0\n")
    terminal.write_bytes(cnf.read_bytes())
    proof.write_bytes(b"proof\n")
    cnf_sha256 = _sha256_file(cnf)
    summary: dict[str, object] = {
        "artifacts": {
            "discovery_cnf": _artifact(cnf),
            "terminal_cnf": _artifact(terminal),
            "proof": _artifact(proof),
        },
        "discovery_verdict": "UNSAT",
        "terminal_verdict": "UNSAT",
        "terminal_proof_verified": True,
        "discovery_cnf_sha256": cnf_sha256,
        "terminal_cnf_sha256": cnf_sha256,
        "reconstructed_cnf_sha256": cnf_sha256,
    }
    return summary, cnf_sha256


class Exact12NextRowStructuralPostwaveTest(unittest.TestCase):
    def test_drat_replay_requires_exact_verified_line(self) -> None:
        with patch(
            "census.card_head.exact12_next_row_structural_postwave.subprocess.run",
            return_value=SimpleNamespace(returncode=0, stdout="s VERIFIED\n"),
        ):
            self.assertTrue(_verify_drat(Path("input.cnf"), Path("proof.drat")))
        with patch(
            "census.card_head.exact12_next_row_structural_postwave.subprocess.run",
            return_value=SimpleNamespace(returncode=0, stdout="VERIFIED\n"),
        ):
            self.assertFalse(_verify_drat(Path("input.cnf"), Path("proof.drat")))

    def test_terminal_claim_requires_independent_drat_replay(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "independent drat-trim"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                    proof_verifier=lambda _cnf, _proof: False,
                )
            _verify_terminal_artifacts(
                cell_dir,
                summary,
                status="UNSAT_DRAT_VERIFIED",
                reconstructed_cnf_sha256=cnf_sha256,
                proof_verifier=lambda _cnf, _proof: True,
            )

    def test_aggregate_record_preserves_theorem_family_metadata(self) -> None:
        stages: Counter[str] = Counter()
        minimum_rows: Counter[int] = Counter()
        certificate_rows: Counter[int] = Counter()
        maximum_paths: Counter[int] = Counter()
        side_conditions: Counter[str] = Counter()
        core_shapes: Counter[tuple[str, str]] = Counter()
        stage_cells: dict[str, set[int]] = defaultdict(set)
        proof_hashes: set[str] = set()
        nogood_hashes: set[str] = set()
        certificate_kinds: Counter[str] = Counter()
        source_order_bank_indices: Counter[int] = Counter()
        source_order_rules: Counter[str] = Counter()
        source_order_consumers: Counter[str] = Counter()
        record = {
            "certificate_kind": "structural_metric_core_exact_false",
            "detector_stage": "equality-duplicate-center",
            "certificate": {
                "minimum": {"minimum_row_count": 3},
                "rows": [{}, {}, {}],
                "side_conditions": ["distinct-centers"],
                "core": {"centers": [2, 3], "triple": [0, 1, 4]},
                "max_closure_path_length": 2,
                "proof_sha256": "a" * 64,
                "nogood_sha256": "b" * 64,
                "direct_row_equality_replay": True,
            },
        }

        _aggregate_record(
            record,
            cell_index=7,
            stages=stages,
            minimum_rows=minimum_rows,
            certificate_rows=certificate_rows,
            maximum_paths=maximum_paths,
            side_conditions=side_conditions,
            core_shapes=core_shapes,
            stage_cells=stage_cells,
            proof_hashes=proof_hashes,
            nogood_hashes=nogood_hashes,
            certificate_kinds=certificate_kinds,
            source_order_bank_indices=source_order_bank_indices,
            source_order_rules=source_order_rules,
            source_order_consumers=source_order_consumers,
        )

        self.assertEqual(stages, Counter({"equality-duplicate-center": 1}))
        self.assertEqual(minimum_rows, Counter({3: 1}))
        self.assertEqual(certificate_rows, Counter({3: 1}))
        self.assertEqual(maximum_paths, Counter({2: 1}))
        self.assertEqual(stage_cells, {"equality-duplicate-center": {7}})
        self.assertEqual(proof_hashes, {"a" * 64})
        self.assertEqual(nogood_hashes, {"b" * 64})
        self.assertEqual(
            certificate_kinds, Counter({"structural_metric_core_exact_false": 1})
        )
        self.assertFalse(source_order_bank_indices)
        self.assertEqual(_counter_payload(minimum_rows, key="rows"), [{"rows": 3, "count": 1}])

    def test_aggregate_record_preserves_source_order_metadata(self) -> None:
        stages: Counter[str] = Counter()
        minimum_rows: Counter[int] = Counter()
        certificate_rows: Counter[int] = Counter()
        maximum_paths: Counter[int] = Counter()
        side_conditions: Counter[str] = Counter()
        core_shapes: Counter[tuple[str, str]] = Counter()
        stage_cells: dict[str, set[int]] = defaultdict(set)
        proof_hashes: set[str] = set()
        nogood_hashes: set[str] = set()
        certificate_kinds: Counter[str] = Counter()
        source_order_bank_indices: Counter[int] = Counter()
        source_order_rules: Counter[str] = Counter()
        source_order_consumers: Counter[str] = Counter()
        record = {
            "certificate_kind": "source_order_positive_coverage",
            "detector_stage": "source-order-positive-coverage",
            "source_order_bank_index": 56,
            "general_lean_consumer": "Problem97.Example.consumer",
            "certificate": {
                "coverage": [
                    {"rule": "convex-five-point-common-orientation"},
                    {"rule": "selected-rows-kalmanson"},
                ]
            },
        }

        _aggregate_record(
            record,
            cell_index=3,
            stages=stages,
            minimum_rows=minimum_rows,
            certificate_rows=certificate_rows,
            maximum_paths=maximum_paths,
            side_conditions=side_conditions,
            core_shapes=core_shapes,
            stage_cells=stage_cells,
            proof_hashes=proof_hashes,
            nogood_hashes=nogood_hashes,
            certificate_kinds=certificate_kinds,
            source_order_bank_indices=source_order_bank_indices,
            source_order_rules=source_order_rules,
            source_order_consumers=source_order_consumers,
        )

        self.assertEqual(
            certificate_kinds, Counter({"source_order_positive_coverage": 1})
        )
        self.assertEqual(source_order_bank_indices, Counter({56: 1}))
        self.assertEqual(
            source_order_rules,
            Counter(
                {
                    "convex-five-point-common-orientation": 1,
                    "selected-rows-kalmanson": 1,
                }
            ),
        )
        self.assertEqual(
            source_order_consumers, Counter({"Problem97.Example.consumer": 1})
        )
        self.assertFalse(minimum_rows)

    def test_artifact_authentication_rejects_symlink(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary) / "cell-0"
            cell_dir.mkdir()
            target = cell_dir / "real.json"
            target.write_text("{}\n", encoding="ascii")
            artifact = cell_dir / "job.json"
            artifact.symlink_to(target)
            summary = {
                "artifacts": {
                    "job": {
                        "path": "job.json",
                        "bytes": target.stat().st_size,
                        "sha256": "0" * 64,
                    }
                }
            }

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "symlink"
            ):
                _verify_artifact(
                    cell_dir,
                    summary,
                    key="job",
                    filename="job.json",
                    required=True,
                )

    def test_artifact_authentication_rejects_hardlink(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary) / "cell-0"
            cell_dir.mkdir()
            target = cell_dir / "real.json"
            target.write_text("{}\n", encoding="ascii")
            artifact = cell_dir / "job.json"
            os.link(target, artifact)
            summary = {"artifacts": {"job": _artifact(artifact)}}

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "hard-linked"
            ):
                _verify_artifact(
                    cell_dir,
                    summary,
                    key="job",
                    filename="job.json",
                    required=True,
                )

    def test_terminal_claim_requires_all_artifacts(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            (cell_dir / "terminal.drat").unlink()

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "proof.*missing"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

    def test_terminal_claim_rejects_tampered_proof_metadata(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            artifacts = summary["artifacts"]
            assert isinstance(artifacts, dict)
            proof = artifacts["proof"]
            assert isinstance(proof, dict)
            proof["sha256"] = "0" * 64

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "proof.*authentication"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

    def test_terminal_claim_rejects_tampered_cnf_bytes(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            (cell_dir / "terminal.cnf").write_bytes(b"p cnf 1 1\n1 0\n")

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "terminal_cnf.*authentication"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

    def test_terminal_claim_rejects_stale_cnf_digest_and_verdict(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            summary["terminal_cnf_sha256"] = "0" * 64
            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "CNF bytes or metadata"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            summary["terminal_proof_verified"] = False
            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "verdict.*metadata"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            summary["terminal_verdict"] = "SAT"
            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "verdict.*metadata"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

    def test_terminal_claim_requires_terminal_cnf(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            (cell_dir / "terminal.cnf").unlink()

            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "terminal_cnf.*missing"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="UNSAT_DRAT_VERIFIED",
                    reconstructed_cnf_sha256=cnf_sha256,
                )

    def test_nonterminal_claim_rejects_stale_terminal_artifacts(self) -> None:
        with TemporaryDirectory() as temporary:
            cell_dir = Path(temporary)
            summary, cnf_sha256 = _terminal_fixture(cell_dir)
            summary["terminal_verdict"] = None
            summary["terminal_proof_verified"] = False
            summary["terminal_cnf_sha256"] = None
            with self.assertRaisesRegex(
                Exact12NextRowStructuralPostwaveError, "stale terminal_cnf"
            ):
                _verify_terminal_artifacts(
                    cell_dir,
                    summary,
                    status="ITERATION_LIMIT",
                    reconstructed_cnf_sha256=cnf_sha256,
                )


if __name__ == "__main__":
    unittest.main()
