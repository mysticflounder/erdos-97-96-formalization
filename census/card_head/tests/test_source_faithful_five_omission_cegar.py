from __future__ import annotations

import hashlib
import json
import shutil
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

from census.card_head.exact12_v14_cell_run import cnf_assignment_satisfies
from census.card_head.sat_encoding import solve_cadical
from census.card_head.source_faithful_five_omission_cegar import (
    FiveOmissionCegarError,
    _append_record,
    _artifact_no_follow,
    _journal_replay_matches,
    _make_record,
    _new_instance,
    _solve_persisted_cadical,
    _tool_manifest,
    _write_regular_bytes,
    detect_structural_certificate,
    learned_clause_for_certificate,
    replay_journal,
)
from census.card_head.tests.test_source_faithful_five_omission import SAT_CUBE


@unittest.skipUnless(shutil.which("cadical"), "CaDiCaL is required")
class SourceFaithfulFiveOmissionCegarTests(unittest.TestCase):
    @staticmethod
    def _force_known_witness(instance: object) -> None:
        for center, candidate in SAT_CUBE.items():
            candidate_index = instance.candidate_index(center, candidate)
            instance.cnf.add_clause(
                (instance.choice_variables[(center, candidate_index)],)
            )
        instance.cnf.add_clause((instance.blocker_variables[9],))
        for center in (0, 1, 2, 3, 4):
            instance.cnf.add_clause((instance.center_variables[center],))

    def test_record_replays_and_rejects_shape_or_truncation_tampering(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            instance = _new_instance(2)
            self._force_known_witness(instance)
            base_formula_sha256 = hashlib.sha256(
                instance.dimacs().encode("utf-8")
            ).hexdigest()
            result = solve_cadical(
                instance,
                root / "witness.cnf",
                timeout_seconds=30,
                nice=10,
            )
            self.assertEqual(result.verdict, "SAT")
            self.assertIsNotNone(result.positive_variables)
            positive = result.positive_variables
            assert positive is not None
            self.assertTrue(
                cnf_assignment_satisfies(
                    instance.cnf.clauses,
                    positive,
                    n_variables=instance.cnf.n_variables,
                )
            )
            cube, boundary = instance.decode_model_and_boundary(positive)
            certificate = detect_structural_certificate(cube, n=12)
            self.assertIsNotNone(certificate)
            assert certificate is not None
            clause = learned_clause_for_certificate(instance, certificate)
            detector_contract_sha256 = "0" * 64
            formula_contract_sha256 = "1" * 64
            record = _make_record(
                index=0,
                parent_sha256="",
                raw_base_formula_sha256=base_formula_sha256,
                base_formula_sha256=base_formula_sha256,
                shared_bank_document_sha256=None,
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=2,
                cube=cube,
                witness=boundary,
                positive_variables=positive,
                certificate=certificate,
                learned_clause=clause,
            )
            journal = root / "journal.jsonl"
            journal.touch()
            _append_record(journal, record)

            replay_instance = _new_instance(2)
            self._force_known_witness(replay_instance)
            count, parent, clauses = replay_journal(
                replay_instance,
                journal,
                raw_base_formula_sha256=base_formula_sha256,
                base_formula_sha256=base_formula_sha256,
                shared_bank_document_sha256=None,
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=2,
            )
            self.assertEqual(count, 1)
            self.assertEqual(parent, record["record_sha256"])
            self.assertEqual(clauses, frozenset({clause}))

            seeded_instance = _new_instance(2)
            self._force_known_witness(seeded_instance)
            seeded_raw_sha256 = hashlib.sha256(
                seeded_instance.dimacs().encode("utf-8")
            ).hexdigest()
            absent_variable = next(
                variable
                for variable in range(1, seeded_instance.cnf.n_variables + 1)
                if variable not in positive
            )
            benign_bootstrap_clause = (-absent_variable,)
            seeded_instance.cnf.add_clause(benign_bootstrap_clause)
            seeded_effective_sha256 = hashlib.sha256(
                seeded_instance.dimacs().encode("utf-8")
            ).hexdigest()
            seeded_bank_sha256 = "3" * 64
            seeded_record = _make_record(
                index=0,
                parent_sha256="",
                raw_base_formula_sha256=seeded_raw_sha256,
                base_formula_sha256=seeded_effective_sha256,
                shared_bank_document_sha256=seeded_bank_sha256,
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=2,
                cube=cube,
                witness=boundary,
                positive_variables=positive,
                certificate=certificate,
                learned_clause=clause,
            )
            seeded_path = root / "seeded-local.jsonl"
            seeded_path.touch()
            _append_record(seeded_path, seeded_record)
            seeded_count, seeded_parent, seeded_clauses = replay_journal(
                seeded_instance,
                seeded_path,
                raw_base_formula_sha256=seeded_raw_sha256,
                base_formula_sha256=seeded_effective_sha256,
                shared_bank_document_sha256=seeded_bank_sha256,
                bootstrap_clauses=(benign_bootstrap_clause,),
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=2,
            )
            self.assertEqual(seeded_count, 1)
            self.assertEqual(seeded_parent, seeded_record["record_sha256"])
            self.assertEqual(
                seeded_clauses, frozenset({benign_bootstrap_clause, clause})
            )

            bootstrap_instance = _new_instance(2)
            self._force_known_witness(bootstrap_instance)
            raw_base_sha256 = hashlib.sha256(
                bootstrap_instance.dimacs().encode("utf-8")
            ).hexdigest()
            bootstrap_instance.cnf.add_clause(clause)
            effective_base_sha256 = hashlib.sha256(
                bootstrap_instance.dimacs().encode("utf-8")
            ).hexdigest()
            shared_bank_sha256 = "2" * 64
            duplicate_record = _make_record(
                index=0,
                parent_sha256="",
                raw_base_formula_sha256=raw_base_sha256,
                base_formula_sha256=effective_base_sha256,
                shared_bank_document_sha256=shared_bank_sha256,
                formula_contract_sha256=formula_contract_sha256,
                detector_contract_sha256=detector_contract_sha256,
                deleted_label=2,
                cube=cube,
                witness=boundary,
                positive_variables=positive,
                certificate=certificate,
                learned_clause=clause,
            )
            duplicate_path = root / "bootstrap-duplicate.jsonl"
            duplicate_path.touch()
            _append_record(duplicate_path, duplicate_record)
            with self.assertRaisesRegex(
                FiveOmissionCegarError, "learned clause failed replay"
            ):
                replay_journal(
                    bootstrap_instance,
                    duplicate_path,
                    raw_base_formula_sha256=raw_base_sha256,
                    base_formula_sha256=effective_base_sha256,
                    shared_bank_document_sha256=shared_bank_sha256,
                    bootstrap_clauses=(clause,),
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

            missing_bootstrap_instance = _new_instance(2)
            self._force_known_witness(missing_bootstrap_instance)
            missing_base_sha256 = hashlib.sha256(
                missing_bootstrap_instance.dimacs().encode("utf-8")
            ).hexdigest()
            empty_journal = root / "empty.jsonl"
            empty_journal.touch()
            with self.assertRaisesRegex(
                FiveOmissionCegarError, "not installed in the effective base formula"
            ):
                replay_journal(
                    missing_bootstrap_instance,
                    empty_journal,
                    raw_base_formula_sha256=missing_base_sha256,
                    base_formula_sha256=missing_base_sha256,
                    shared_bank_document_sha256=shared_bank_sha256,
                    bootstrap_clauses=(clause,),
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

            malformed = dict(record)
            malformed["unexpected"] = True
            malformed_path = root / "malformed.jsonl"
            malformed_path.write_text(
                json.dumps(malformed, sort_keys=True, separators=(",", ":")) + "\n",
                encoding="utf-8",
            )
            malformed_instance = _new_instance(2)
            self._force_known_witness(malformed_instance)
            with self.assertRaisesRegex(FiveOmissionCegarError, "malformed"):
                replay_journal(
                    malformed_instance,
                    malformed_path,
                    raw_base_formula_sha256=base_formula_sha256,
                    base_formula_sha256=base_formula_sha256,
                    shared_bank_document_sha256=None,
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

            truncated_path = root / "truncated.jsonl"
            truncated_path.write_bytes(journal.read_bytes().rstrip(b"\n"))
            truncated_instance = _new_instance(2)
            self._force_known_witness(truncated_instance)
            with self.assertRaisesRegex(FiveOmissionCegarError, "truncated"):
                replay_journal(
                    truncated_instance,
                    truncated_path,
                    raw_base_formula_sha256=base_formula_sha256,
                    base_formula_sha256=base_formula_sha256,
                    shared_bank_document_sha256=None,
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

            bounded_instance = _new_instance(2)
            self._force_known_witness(bounded_instance)
            with (
                patch(
                    "census.card_head.source_faithful_five_omission_cegar."
                    "MAX_JOURNAL_TOTAL_BYTES",
                    len(journal.read_bytes()) - 1,
                ),
                self.assertRaisesRegex(FiveOmissionCegarError, "total size bound"),
            ):
                replay_journal(
                    bounded_instance,
                    journal,
                    raw_base_formula_sha256=base_formula_sha256,
                    base_formula_sha256=base_formula_sha256,
                    shared_bank_document_sha256=None,
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

            count_bounded_instance = _new_instance(2)
            self._force_known_witness(count_bounded_instance)
            with (
                patch(
                    "census.card_head.source_faithful_five_omission_cegar."
                    "MAX_JOURNAL_RECORDS",
                    0,
                ),
                self.assertRaisesRegex(FiveOmissionCegarError, "record-count bound"),
            ):
                replay_journal(
                    count_bounded_instance,
                    journal,
                    raw_base_formula_sha256=base_formula_sha256,
                    base_formula_sha256=base_formula_sha256,
                    shared_bank_document_sha256=None,
                    formula_contract_sha256=formula_contract_sha256,
                    detector_contract_sha256=detector_contract_sha256,
                    deleted_label=2,
                )

    def test_journal_replay_binds_reconstructed_formula_bytes(self) -> None:
        live_instance = _new_instance(2)
        current_formula_sha256 = hashlib.sha256(
            live_instance.dimacs().encode("utf-8")
        ).hexdigest()
        replay_instance = _new_instance(2)

        arguments = {
            "audit_count": 0,
            "audit_parent": "",
            "audit_seen": (),
            "record_count": 0,
            "parent_sha256": "",
            "seen_clauses": (),
            "current_formula_sha256": current_formula_sha256,
        }
        self.assertTrue(_journal_replay_matches(replay_instance, **arguments))

        replay_instance.cnf.add_clause((1,))
        self.assertFalse(_journal_replay_matches(replay_instance, **arguments))


class SourceFaithfulFiveOmissionCustodyTests(unittest.TestCase):
    @unittest.skipUnless(
        shutil.which("nice") and shutil.which("cadical") and shutil.which("drat-trim"),
        "nice, CaDiCaL, and drat-trim are required",
    )
    def test_terminal_proof_replays_against_descriptor_bound_cnf(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            cnf_path = root / "terminal.cnf"
            cnf_bytes = b"p cnf 1 2\n1 0\n-1 0\n"
            artifact = _write_regular_bytes(cnf_path, cnf_bytes, create=True)
            result = _solve_persisted_cadical(
                _new_instance(2),
                cnf_path,
                artifact["sha256"],
                timeout_seconds=10,
                nice=10,
                tool_manifest=_tool_manifest(),
                proof_path=root / "terminal.drat",
            )
            self.assertEqual(result.verdict, "UNSAT")
            self.assertTrue(result.proof_verified)

    def test_regular_writer_is_create_only_and_rejects_symlinks(self) -> None:
        with tempfile.TemporaryDirectory() as temporary:
            root = Path(temporary)
            target = root / "artifact.bin"
            artifact = _write_regular_bytes(target, b"bound bytes", create=True)
            self.assertEqual(artifact, _artifact_no_follow(target))
            with self.assertRaisesRegex(FiveOmissionCegarError, "unsafe"):
                _write_regular_bytes(target, b"replacement", create=True)

            link = root / "link.bin"
            link.symlink_to(target)
            with self.assertRaises(FiveOmissionCegarError):
                _artifact_no_follow(link)
            with self.assertRaisesRegex(FiveOmissionCegarError, "unsafe"):
                _write_regular_bytes(link, b"replacement", create=False)
            self.assertEqual(target.read_bytes(), b"bound bytes")

    def test_replay_rejects_malformed_contract_digest_before_opening(self) -> None:
        instance = _new_instance(2)
        base_formula_sha256 = hashlib.sha256(
            instance.dimacs().encode("utf-8")
        ).hexdigest()
        with self.assertRaisesRegex(FiveOmissionCegarError, "malformed or stale"):
            replay_journal(
                instance,
                Path("does-not-need-to-exist.jsonl"),
                raw_base_formula_sha256=base_formula_sha256,
                base_formula_sha256=base_formula_sha256,
                shared_bank_document_sha256=None,
                formula_contract_sha256="not-a-digest",
                detector_contract_sha256="0" * 64,
                deleted_label=2,
            )


if __name__ == "__main__":
    unittest.main()
