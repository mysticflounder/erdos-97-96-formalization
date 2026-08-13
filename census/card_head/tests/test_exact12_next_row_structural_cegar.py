from __future__ import annotations

import copy
import hashlib
import io
import os
import stat
import unittest
from pathlib import Path
from tempfile import TemporaryDirectory
from unittest import mock

from census.card_head.candidate_surface import build_model
from census.card_head.exact12_next_row_structural_cegar import (
    DEFAULT_PIQD_BASE_URL,
    LEGACY_RECORD_SCHEMA,
    NEXT_ROW_LEAN_TERMINAL_CONSUMER,
    STRUCTURAL_CERTIFICATE_KIND,
    STRUCTURAL_CERTIFICATE_SCHEMA,
    Exact12NextRowStructuralCegarError,
    _canonical_cube,
    _canonical_json_bytes,
    _certificate_consumer,
    _cnf_sha256,
    _detector_manifest,
    _make_record,
    _recapture_terminal_artifact,
    _replay_sat_witness,
    _reserve_terminal_artifact,
    detect_admitted_cut,
    detect_structural_certificate,
    learned_clause_for_certificate,
    main,
    replay_journal,
    run_structural_cegar,
    validate_structural_certificate,
)
from census.card_head.exact12_next_row_valuation import cells, compile_cell
from census.card_head.exact12_v14_ordered_cut_adapter import AdmittedCut
from census.card_head.sat_encoding import CadicalResult, solve_cadical
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)

CELL0_CUBE = {
    0: [1, 2, 3, 4],
    1: [0, 2, 6, 8],
    2: [0, 1, 10, 11],
    3: [0, 1, 4, 5],
    4: [0, 2, 3, 5],
    5: [0, 3, 4, 6],
    6: [0, 7, 8, 10],
    7: [1, 3, 6, 8],
    8: [1, 5, 6, 9],
    9: [1, 2, 7, 8],
    10: [0, 7, 9, 11],
    11: [1, 7, 9, 10],
}


class Exact12NextRowStructuralCegarTest(unittest.TestCase):
    def setUp(self) -> None:
        self.instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        self.compiled = compile_cell(self.instance, cells()[0])

    def _certificate(self) -> dict[str, object]:
        certificate = detect_structural_certificate(CELL0_CUBE)
        self.assertIsNotNone(certificate)
        assert certificate is not None
        return certificate

    def _journal_record(
        self,
        *,
        index: int,
        parent_sha256: str,
        bank_sha256: str,
        clause: tuple[int, ...],
        instance: SourceFaithfulCoverInstance,
    ) -> dict[str, object]:
        certificate = self._certificate()
        admitted = AdmittedCut(
            certificate_kind=STRUCTURAL_CERTIFICATE_KIND,
            certificate_schema=STRUCTURAL_CERTIFICATE_SCHEMA,
            detector_stage=str(certificate["stage"]),
            certificate=certificate,
            learned_clause=clause,
        )
        return _make_record(
            index=index,
            parent_sha256=parent_sha256,
            job_id="a" * 64,
            detector_contract_sha256="d" * 64,
            cell_index=0,
            source_order_bank_sha256=bank_sha256,
            admitted_cut=admitted,
            pre_cut_cnf_sha256=_cnf_sha256(instance),
            post_cut_cnf_sha256=hashlib.sha256(
                instance.dimacs((clause,)).encode("ascii")
            ).hexdigest(),
            cube=CELL0_CUBE,
            positive_variables=(1, 2),
            n_variables=instance.cnf.n_variables,
        )

    def test_detects_replayable_exact_false_duplicate_center_cut(self) -> None:
        certificate = self._certificate()

        self.assertEqual(certificate["stage"], "equality-duplicate-center")
        self.assertEqual(certificate["core"], {"triple": [0, 1, 4], "centers": [2, 3]})
        self.assertTrue(validate_structural_certificate(certificate))
        self.assertTrue(all(row["exact"] is False for row in certificate["rows"]))

    def test_learned_clause_uses_only_selected_choice_variables(self) -> None:
        certificate = self._certificate()
        clause = learned_clause_for_certificate(self.instance, certificate)
        selected = {
            self.instance.choice_variables[
                (
                    center,
                    self.instance.candidate_index(center, CELL0_CUBE[center]),
                )
            ]
            for center in range(12)
        }

        self.assertEqual(clause, (-1, -55, -175, -525))
        self.assertTrue(all(-literal in selected for literal in clause))

    def test_tagged_detector_preserves_structural_first_order(self) -> None:
        with mock.patch(
            "census.card_head.exact12_next_row_structural_cegar."
            "detect_proof_backed_source_order_cut"
        ) as ordered:
            admitted = detect_admitted_cut(
                self.instance, CELL0_CUBE, source_order_bank={}
            )

        self.assertIsInstance(admitted, AdmittedCut)
        assert admitted is not None
        self.assertEqual(
            admitted.certificate_kind, "structural_metric_core_exact_false"
        )
        self.assertEqual(admitted.detector_stage, "equality-duplicate-center")
        ordered.assert_not_called()

    def test_tagged_detector_reaches_source_order_only_after_structural_miss(
        self,
    ) -> None:
        expected = AdmittedCut(
            certificate_kind="source_order_positive_coverage",
            certificate_schema="schema",
            detector_stage="source-order-positive-coverage",
            certificate={"generated_lean_nogood": {}},
            learned_clause=(-1,),
            bank_index=56,
        )
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "detect_structural_certificate",
                return_value=None,
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "detect_proof_backed_source_order_cut",
                return_value=expected,
            ) as ordered,
        ):
            admitted = detect_admitted_cut(
                self.instance, CELL0_CUBE, source_order_bank={"bank": True}
            )

        self.assertEqual(admitted, expected)
        ordered.assert_called_once()

    def test_source_order_record_names_next_row_terminal_consumer(self) -> None:
        admitted = AdmittedCut(
            certificate_kind="source_order_positive_coverage",
            certificate_schema="schema",
            detector_stage="source-order-positive-coverage",
            certificate={
                "generated_lean_nogood": {
                    "terminal_consumer_declaration": "Problem97.LegacyV14.consumer"
                }
            },
            learned_clause=(-1,),
            bank_index=56,
        )

        self.assertEqual(
            _certificate_consumer(admitted), NEXT_ROW_LEAN_TERMINAL_CONSUMER
        )

    def test_structural_record_does_not_claim_direct_lean_consumer(self) -> None:
        admitted = AdmittedCut(
            certificate_kind=STRUCTURAL_CERTIFICATE_KIND,
            certificate_schema=STRUCTURAL_CERTIFICATE_SCHEMA,
            detector_stage="equality-duplicate-center",
            certificate=self._certificate(),
            learned_clause=(-1,),
            bank_index=None,
        )

        self.assertIsNone(_certificate_consumer(admitted))

    def test_exact_true_certificate_is_rejected(self) -> None:
        certificate = copy.deepcopy(self._certificate())
        certificate["rows"][0]["exact"] = True

        self.assertFalse(validate_structural_certificate(certificate))
        with self.assertRaisesRegex(
            Exact12NextRowStructuralCegarError, "invalid certificate"
        ):
            learned_clause_for_certificate(self.instance, certificate)

    def test_duplicate_certificate_center_is_rejected(self) -> None:
        certificate = copy.deepcopy(self._certificate())
        certificate["rows"][1]["center"] = certificate["rows"][0]["center"]

        self.assertFalse(validate_structural_certificate(certificate))
        with self.assertRaisesRegex(
            Exact12NextRowStructuralCegarError, "invalid certificate"
        ):
            learned_clause_for_certificate(self.instance, certificate)

    def test_reported_cube_must_equal_assignment_decoding(self) -> None:
        decoded = copy.deepcopy(CELL0_CUBE)
        decoded[0] = [1, 2, 3, 5]
        with (
            mock.patch.object(self.instance, "decode_model", return_value=decoded),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "differs from the cube decoded"
            ),
        ):
            _replay_sat_witness(
                self.instance,
                self.compiled,
                CELL0_CUBE,
                (1,),
            )

    def test_cube_parser_rejects_noncanonical_or_incomplete_rows(self) -> None:
        canonical = _canonical_cube(CELL0_CUBE)
        self.assertEqual(canonical["0"], [1, 2, 3, 4])

        incomplete = dict(CELL0_CUBE)
        del incomplete[11]
        with self.assertRaisesRegex(Exact12NextRowStructuralCegarError, "omits"):
            _canonical_cube(incomplete)

        noncanonical = {str(center): row for center, row in CELL0_CUBE.items()}
        noncanonical["00"] = noncanonical.pop("0")
        with self.assertRaisesRegex(Exact12NextRowStructuralCegarError, "center"):
            _canonical_cube(noncanonical)

    def test_detector_manifest_authenticates_declared_bytes(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            source = root / "detector.py"
            payload = b"DETECTOR = True\n"
            source.write_bytes(payload)
            with mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.DETECTOR_PATHS",
                ("detector.py",),
            ):
                self.assertEqual(
                    _detector_manifest(root),
                    [
                        {
                            "path": "detector.py",
                            "bytes": len(payload),
                            "sha256": hashlib.sha256(payload).hexdigest(),
                        }
                    ],
                )

    def test_detector_manifest_rejects_symlinks(self) -> None:
        with TemporaryDirectory() as temporary:
            root = Path(temporary)
            target = root / "real.py"
            target.write_text("DETECTOR = True\n", encoding="ascii")
            (root / "detector.py").symlink_to(target)
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_structural_cegar.DETECTOR_PATHS",
                    ("detector.py",),
                ),
                self.assertRaisesRegex(Exact12NextRowStructuralCegarError, "symlink"),
            ):
                _detector_manifest(root)

    def test_journal_rejects_partial_and_non_strict_json(self) -> None:
        kwargs = {
            "repo_root": Path.cwd(),
            "job_id": "a" * 64,
            "detector_contract_sha256": "d" * 64,
            "cell_index": 0,
            "source_order_bank": {},
        }
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "newline terminated"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(b"{}"),
                **kwargs,
            )
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(Exact12NextRowStructuralCegarError, "strict JSON"),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(b'{"schema":1,"schema":2}\n'),
                **kwargs,
            )

    def test_journal_rejects_legacy_v2_without_explicit_migration(self) -> None:
        kwargs = {
            "repo_root": Path.cwd(),
            "job_id": "a" * 64,
            "detector_contract_sha256": "d" * 64,
            "cell_index": 0,
            "source_order_bank": {},
        }
        payload = (f'{{"schema":"{LEGACY_RECORD_SCHEMA}"}}\n').encode("ascii")
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "explicit migration"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(payload),
                **kwargs,
            )

    def test_journal_rejects_legacy_v3_without_explicit_migration(self) -> None:
        payload = b'{"schema":"p97_rigid221_exact12_next_row_tagged_cut.v3"}\n'
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "explicit migration"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(payload),
                repo_root=Path.cwd(),
                job_id="a" * 64,
                detector_contract_sha256="d" * 64,
                cell_index=0,
                source_order_bank={},
            )

    def test_journal_rejects_legacy_v4_without_explicit_migration(self) -> None:
        payload = b'{"schema":"p97_rigid221_exact12_next_row_tagged_cut.v4"}\n'
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "explicit migration"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(payload),
                repo_root=Path.cwd(),
                job_id="a" * 64,
                detector_contract_sha256="d" * 64,
                cell_index=0,
                source_order_bank={},
            )

    def test_journal_binds_exact_source_order_bank_digest(self) -> None:
        record = self._journal_record(
            index=0,
            parent_sha256="a" * 64,
            bank_sha256="c" * 64,
            clause=(-1,),
            instance=self.instance,
        )
        payload = _canonical_json_bytes(record) + b"\n"
        original_sha256 = _cnf_sha256(self.instance)
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "chain authentication"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(payload),
                repo_root=Path.cwd(),
                job_id="a" * 64,
                detector_contract_sha256="d" * 64,
                cell_index=0,
                source_order_bank={},
            )
        self.assertEqual(_cnf_sha256(self.instance), original_sha256)


class Exact12NextRowStructuralDiscoveryRoutingTest(unittest.TestCase):
    @staticmethod
    def _run_with_discovery(
        workdir: Path,
        discovery_result: CadicalResult,
        terminal_solver,
    ) -> tuple[dict[str, object], list[object]]:
        proof_paths: list[object] = []

        def discovery(instance, cnf_path, **kwargs):
            proof_paths.append(kwargs["proof_path"])
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            return discovery_result

        def factory(_request):
            return discovery

        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "build_source_order_bank",
                return_value={},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "snapshot_source_order_bank",
                return_value={"bank_sha256": "b" * 64},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
        ):
            summary = run_structural_cegar(
                Path.cwd(),
                workdir,
                0,
                max_iterations=1,
                solver=terminal_solver,
                discovery_solver_factory=factory,
                _schedule=(object(),),
                _compile_selected_cell=lambda *_args: object(),
                _build_selected_job=lambda *_args: {"job_id": "a" * 64},
                _detector_paths=(),
            )
        return summary, proof_paths

    def test_observational_piqd_unsat_runs_one_fresh_local_terminal_proof(self) -> None:
        terminal_calls: list[tuple[Path, int, int]] = []

        def terminal(instance, cnf_path, **kwargs):
            cnf_fd = kwargs["cnf_fd"]
            proof_fd = kwargs["proof_fd"]
            terminal_calls.append((kwargs["proof_path"], cnf_fd, proof_fd))
            os.fstat(cnf_fd)
            os.fstat(proof_fd)
            cnf = instance.dimacs().encode("ascii")
            os.ftruncate(cnf_fd, 0)
            os.pwrite(cnf_fd, cnf, 0)
            os.fsync(cnf_fd)
            os.ftruncate(proof_fd, 0)
            os.pwrite(proof_fd, b"synthetic proof", 0)
            os.fsync(proof_fd)
            return CadicalResult("UNSAT", None, 20, True, "")

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            summary, proof_paths = self._run_with_discovery(
                workdir,
                CadicalResult("UNSAT", None, 20, False, "observational"),
                terminal,
            )
            lock_path = workdir / ".exact12_next_row_cell_run.lock"
            self.assertTrue(lock_path.is_file())
            self.assertEqual(stat.S_IMODE(lock_path.stat().st_mode), 0o600)

        self.assertEqual(proof_paths, [None])
        self.assertEqual(len(terminal_calls), 1)
        self.assertEqual(terminal_calls[0][0], workdir / "terminal.drat")
        with self.assertRaises(OSError):
            os.fstat(terminal_calls[0][1])
        with self.assertRaises(OSError):
            os.fstat(terminal_calls[0][2])
        self.assertEqual(summary["status"], "UNSAT_DRAT_VERIFIED")
        self.assertTrue(summary["terminal_proof_verified"])

    def test_terminal_reservation_rejects_rebind_without_cleanup(self) -> None:
        with TemporaryDirectory() as raw:
            path = Path(raw) / "terminal.cnf"
            descriptor, anchor = _reserve_terminal_artifact(path)
            try:
                metadata = os.fstat(descriptor)
                self.assertTrue(stat.S_ISREG(metadata.st_mode))
                self.assertEqual(stat.S_IMODE(metadata.st_mode), 0o600)
                self.assertEqual((metadata.st_dev, metadata.st_ino), anchor)
                replacement = Path(raw) / "replacement.cnf"
                replacement.write_text("hostile\n", encoding="ascii")
                os.replace(replacement, path)
                with self.assertRaisesRegex(
                    Exact12NextRowStructuralCegarError, "rebound"
                ):
                    _recapture_terminal_artifact(path, descriptor, anchor)
                self.assertEqual(path.read_text(encoding="ascii"), "hostile\n")
            finally:
                os.close(descriptor)

    def test_terminal_child_path_replacement_cannot_redirect_held_cnf(self) -> None:
        inherited: list[tuple[int, int]] = []
        hostile = b"hostile replacement\n"

        def child(command, **kwargs):
            cnf_fd, proof_fd = kwargs["pass_fds"]
            inherited.append((cnf_fd, proof_fd))
            if "cadical" in command:
                self.assertEqual(command[-2], f"/dev/fd/{cnf_fd}")
                self.assertEqual(command[-1], f"/dev/fd/{proof_fd}")
                self.assertTrue(os.pread(cnf_fd, 6, 0).startswith(b"p cnf "))
                replacement = workdir / "replacement.cnf"
                replacement.write_bytes(hostile)
                os.replace(replacement, workdir / "terminal.cnf")
                os.pwrite(proof_fd, b"synthetic proof", 0)
                return mock.Mock(returncode=20, stdout="s UNSATISFIABLE\n", stderr="")
            self.assertEqual(command[-2], f"/dev/fd/{cnf_fd}")
            self.assertEqual(command[-1], f"/dev/fd/{proof_fd}")
            return mock.Mock(returncode=0, stdout="s VERIFIED\n", stderr="")

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with mock.patch(
                "census.card_head.sat_encoding.subprocess.run", side_effect=child
            ):
                summary, proof_paths = self._run_with_discovery(
                    workdir,
                    CadicalResult("UNSAT", None, 20, False, "observational"),
                    solve_cadical,
                )
            self.assertEqual((workdir / "terminal.cnf").read_bytes(), hostile)

        self.assertEqual(proof_paths, [None])
        self.assertEqual(len(inherited), 2)
        self.assertEqual(inherited[0], inherited[1])
        self.assertEqual(summary["status"], "DISCOVERY_UNSAT_UNVERIFIED")
        self.assertIn("rebound", summary["error"])
        with self.assertRaises(OSError):
            os.fstat(inherited[0][0])
        with self.assertRaises(OSError):
            os.fstat(inherited[0][1])

    def test_terminal_timeout_closes_both_reservations(self) -> None:
        inherited: list[tuple[int, int]] = []

        def terminal(instance, _cnf_path, **kwargs):
            cnf_fd = kwargs["cnf_fd"]
            proof_fd = kwargs["proof_fd"]
            inherited.append((cnf_fd, proof_fd))
            os.pwrite(cnf_fd, instance.dimacs().encode("ascii"), 0)
            return CadicalResult("TIMEOUT", None, None, False, "timeout")

        with TemporaryDirectory() as raw:
            summary, proof_paths = self._run_with_discovery(
                Path(raw) / "run",
                CadicalResult("UNSAT", None, 20, False, "observational"),
                terminal,
            )

        self.assertEqual(proof_paths, [None])
        self.assertEqual(len(inherited), 1)
        self.assertEqual(summary["status"], "DISCOVERY_UNSAT_UNVERIFIED")
        for descriptor in inherited[0]:
            with self.assertRaises(OSError):
                os.fstat(descriptor)

    def test_rebound_proof_path_cannot_be_promoted_or_deleted(self) -> None:
        hostile = b"hostile proof replacement\n"

        def terminal(instance, _cnf_path, **kwargs):
            cnf_fd = kwargs["cnf_fd"]
            proof_fd = kwargs["proof_fd"]
            os.pwrite(cnf_fd, instance.dimacs().encode("ascii"), 0)
            os.pwrite(proof_fd, b"synthetic proof", 0)
            replacement = kwargs["proof_path"].with_name("replacement.drat")
            replacement.write_bytes(hostile)
            os.replace(replacement, kwargs["proof_path"])
            return CadicalResult("UNSAT", None, 20, True, "")

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            summary, proof_paths = self._run_with_discovery(
                workdir,
                CadicalResult("UNSAT", None, 20, False, "observational"),
                terminal,
            )
            self.assertEqual((workdir / "terminal.drat").read_bytes(), hostile)

        self.assertEqual(proof_paths, [None])
        self.assertEqual(summary["terminal_cnf_sha256"], summary["discovery_cnf_sha256"])
        self.assertEqual(summary["status"], "DISCOVERY_UNSAT_UNVERIFIED")
        self.assertIn("terminal.drat", summary["error"])
        self.assertIn("rebound", summary["error"])

    def test_piqd_unknown_has_no_local_solver_fallback(self) -> None:
        with TemporaryDirectory() as raw:
            summary, proof_paths = self._run_with_discovery(
                Path(raw) / "run",
                CadicalResult("UNKNOWN", None, 1, False, "synthetic unknown"),
                mock.Mock(side_effect=AssertionError("local fallback")),
            )

        self.assertEqual(proof_paths, [None])
        self.assertEqual(summary["status"], "UNKNOWN")
        self.assertIsNone(summary["terminal_verdict"])

    def test_cli_defaults_to_piqd_sequential_single_worker(self) -> None:
        from census.card_head import exact12_next_row_structural_piqd as piqd

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_structural_cegar."
                    "run_structural_cegar",
                    side_effect=AssertionError("default route reached legacy-local"),
                ),
                mock.patch.object(
                    piqd,
                    "run_exact12_next_row_structural_piqd",
                    return_value={"status": "UNKNOWN"},
                ) as routed,
            ):
                self.assertEqual(
                    main(["--workdir", str(workdir), "--cell-index", "0"]), 2
                )

        kwargs = routed.call_args.kwargs
        self.assertEqual(kwargs["piqd_base_url"], DEFAULT_PIQD_BASE_URL)
        self.assertEqual(kwargs["piqd_journal_root"], workdir / "piqd-discovery")
        self.assertEqual(kwargs["workers"], 1)
        self.assertEqual(kwargs["parallel_mode"], "sequential")

    def test_cli_legacy_local_requires_explicit_selection(self) -> None:
        from census.card_head import exact12_next_row_structural_piqd as piqd

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_structural_cegar."
                    "run_structural_cegar",
                    return_value={"status": "UNKNOWN"},
                ) as local,
                mock.patch.object(
                    piqd,
                    "run_exact12_next_row_structural_piqd",
                    side_effect=AssertionError("legacy-local constructed PIQD"),
                ),
            ):
                self.assertEqual(
                    main(
                        [
                            "--workdir",
                            str(workdir),
                            "--cell-index",
                            "0",
                            "--solver-backend",
                            "legacy-local",
                        ]
                    ),
                    2,
                )

        local.assert_called_once()

    def test_default_piqd_failure_has_no_local_fallback(self) -> None:
        from census.card_head import exact12_next_row_structural_piqd as piqd

        with (
            TemporaryDirectory() as raw,
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "run_structural_cegar",
                side_effect=AssertionError("PIQD failure fell back to local"),
            ),
            mock.patch.object(
                piqd,
                "run_exact12_next_row_structural_piqd",
                side_effect=piqd.Exact12NextRowStructuralPiqdError(
                    "synthetic PIQD error"
                ),
            ),
            self.assertRaises(SystemExit),
        ):
            main(
                [
                    "--workdir",
                    str(Path(raw) / "run"),
                    "--cell-index",
                    "0",
                ]
            )


class Exact12NextRowStructuralTransactionalReplayTest(unittest.TestCase):
    _certificate = Exact12NextRowStructuralCegarTest._certificate
    _journal_record = Exact12NextRowStructuralCegarTest._journal_record

    def setUp(self) -> None:
        self.instance = SourceFaithfulCoverInstance(
            build_model(12, SOURCE_FAITHFUL_PYTHON_PROFILE)
        )
        self.compiled = compile_cell(self.instance, cells()[0])

    def test_failed_later_record_does_not_partially_install_earlier_cut(self) -> None:
        bank_sha256 = "b" * 64
        clause0 = (-1,)
        clause1 = (-2,)
        record0 = self._journal_record(
            index=0,
            parent_sha256="a" * 64,
            bank_sha256=bank_sha256,
            clause=clause0,
            instance=self.instance,
        )
        shadow = copy.deepcopy(self.instance)
        shadow.cnf.add_clause(clause0)
        record1 = self._journal_record(
            index=1,
            parent_sha256=str(record0["record_sha256"]),
            bank_sha256=bank_sha256,
            clause=clause1,
            instance=shadow,
        )
        payload = b"".join(
            (
                _canonical_json_bytes(record0) + b"\n",
                _canonical_json_bytes(record1) + b"\n",
            )
        )
        original_sha256 = _cnf_sha256(self.instance)
        with (
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.snapshot_source_order_bank",
                return_value={"bank_sha256": bank_sha256},
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar."
                "attest_source_order_bank_live_sources"
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar._replay_sat_witness",
                return_value=(CELL0_CUBE, frozenset({1, 2}), {}),
            ),
            mock.patch(
                "census.card_head.exact12_next_row_structural_cegar.replay_tagged_cut",
                side_effect=(clause0, (-3,)),
            ),
            self.assertRaisesRegex(
                Exact12NextRowStructuralCegarError, "formula or learned clause drifted"
            ),
        ):
            replay_journal(
                self.instance,
                self.compiled,
                io.BytesIO(payload),
                repo_root=Path.cwd(),
                job_id="a" * 64,
                detector_contract_sha256="d" * 64,
                cell_index=0,
                source_order_bank={},
            )
        self.assertEqual(_cnf_sha256(self.instance), original_sha256)


if __name__ == "__main__":
    unittest.main()
