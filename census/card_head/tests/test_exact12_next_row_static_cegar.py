from __future__ import annotations

import copy
import json
import unittest
from contextlib import contextmanager
from pathlib import Path
from tempfile import TemporaryDirectory
from types import SimpleNamespace
from unittest import mock

from census.card_head.exact12_next_row_static_cegar import (
    DEFAULT_PIQD_BASE_URL,
    DETECTOR_CONTRACT,
    JOB_SCHEMA,
    LEAN_INGRESS_THEOREM,
    RECORD_SCHEMA,
    RUN_SCHEMA,
    SOURCE_ORDER_CERTIFICATE_KIND,
    SOURCE_ORDER_DETECTOR_STAGE,
    SOURCE_ORDER_INSTALLATION_SCHEMA,
    SURVIVOR_SCHEMA,
    TERMINAL_PROMOTION_STATUS,
    Exact12NextRowStaticCegarError,
    _authenticate_persisted_contracts,
    _build_job,
    _cnf_sha256,
    _make_record,
    _make_survivor,
    _sha256_json,
    detect_typed_source_order_cut,
    main,
    materialize_positive_membership_static_cell,
    materialize_static_cell,
    replay_journal,
    replay_static_convex_sat_witness,
    run_static_cegar,
)
from census.card_head.exact12_v14_ordered_cut_adapter import AdmittedCut
from census.card_head.sat_encoding import CadicalResult, EncodingError

from .test_exact12_next_row_static_convex import PERP_BISECTOR_CANARY
from .test_exact12_next_row_static_equality import (
    DETECTOR_CLEAN_CUBE,
    DUPLICATE_CENTER_CUBE,
)
from .test_exact12_next_row_static_geometry import EQUILATERAL_BISECTOR_CANARY

REPO_ROOT = Path(__file__).resolve().parents[3]
FAKE_BANK = {
    "schema": "p97_rigid221_exact12_source_order_positive_bank.v3",
    "bank_sha256": "f" * 64,
    "entries": [{}],
}
FAKE_MEMBERSHIP_BANK = {
    "schema": "p97_rigid221_exact12_three_triad_membership_bank.v1",
    "bank_sha256": "e" * 64,
    "cut_id": "three-triad-cell1-after-block-spanning-family.v1",
    "block_spanning_family_bank": {
        "family_id": "block-spanning-a6789-xc345-distinct.v1",
    },
    "entries": [{}],
}


class _FakePreparedSourceOrderBank:
    def __init__(self, instance) -> None:
        self.instance = instance
        self.entries = (SimpleNamespace(learned_clause=(1,)),)

    def snapshot(self):
        return copy.deepcopy(FAKE_BANK)


def _fake_prepare_source_order_bank(instance, _bank):
    return _FakePreparedSourceOrderBank(instance)


def _fake_attest_source_order_bank(instance, _prepared):
    if not instance.cnf.clauses or instance.cnf.clauses[-1] != (1,):
        raise Exact12NextRowStaticCegarError("fake source-order bank is not installed")
    base = copy.deepcopy(instance)
    base.cnf.clauses = list(base.cnf.clauses[:-1])
    return {
        "schema": SOURCE_ORDER_INSTALLATION_SCHEMA,
        "bank_sha256": FAKE_BANK["bank_sha256"],
        "base_n_variables": instance.cnf.n_variables,
        "base_n_clauses": len(base.cnf.clauses),
        "base_cnf_sha256": _cnf_sha256(base),
        "suffix_n_clauses": 1,
        "suffix_sha256": "c" * 64,
        "final_n_variables": instance.cnf.n_variables,
        "final_n_clauses": len(instance.cnf.clauses),
        "final_cnf_sha256": _cnf_sha256(instance),
        "installation_sha256": "d" * 64,
    }


def _fake_install_source_order_bank(instance, prepared):
    if prepared.instance is not instance:
        raise Exact12NextRowStaticCegarError("fake prepared-bank identity drifted")
    instance.cnf.add_clause((1,))
    return _fake_attest_source_order_bank(instance, prepared)


def _fake_clone_installed_source_order_bank(instance, prepared):
    _fake_attest_source_order_bank(instance, prepared)
    clone = copy.deepcopy(instance)
    return clone, _FakePreparedSourceOrderBank(clone)


@contextmanager
def _fake_source_order_pipeline():
    with (
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar.build_source_order_bank",
            return_value=FAKE_BANK,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "prepare_proof_backed_source_order_bank",
            side_effect=_fake_prepare_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "install_prepared_source_order_bank",
            side_effect=_fake_install_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "attest_prepared_source_order_bank_installed",
            side_effect=_fake_attest_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "clone_installed_source_order_bank",
            side_effect=_fake_clone_installed_source_order_bank,
        ),
        mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "attest_source_order_bank_live_sources"
        ),
    ):
        yield


def typed_cut() -> AdmittedCut:
    return AdmittedCut(
        certificate_kind=SOURCE_ORDER_CERTIFICATE_KIND,
        certificate_schema="proof-backed-schema.v1",
        detector_stage=SOURCE_ORDER_DETECTOR_STAGE,
        certificate={
            "generated_lean_nogood": {
                "nogood_declaration": "Problem97.Generated.nogood",
                "source_path": "lean/Generated.lean",
            }
        },
        learned_clause=(-1,),
        bank_index=7,
    )


class Exact12NextRowStaticCegarTest(unittest.TestCase):
    @classmethod
    def setUpClass(cls) -> None:
        cls.instance, cls.compiled, cls.layout = materialize_static_cell(0)
        (
            cls.membership_instance,
            cls.membership_compiled,
            cls.membership_layout,
            cls.membership_bank,
        ) = materialize_positive_membership_static_cell(REPO_ROOT, 1)

    def test_job_binds_the_post_static_formula_and_marks_terminal_ingress_ready(
        self,
    ) -> None:
        instance = copy.deepcopy(self.membership_instance)
        prepared = _fake_prepare_source_order_bank(instance, FAKE_BANK)
        _fake_install_source_order_bank(instance, prepared)
        with _fake_source_order_pipeline():
            job = _build_job(
                REPO_ROOT,
                self.membership_compiled,
                self.membership_layout,
                instance,
                self.membership_bank,
                FAKE_BANK,
                prepared,
            )

        self.assertEqual(job["cnf"]["sha256"], _cnf_sha256(instance))
        self.assertEqual(job["schema"], JOB_SCHEMA)
        self.assertIn("static convex extension", job["scope"])
        self.assertEqual(
            job["static_convex_manifest"], self.membership_layout.manifest()
        )
        self.assertEqual(job["terminal_promotion_status"], TERMINAL_PROMOTION_STATUS)
        self.assertEqual(job["lean_ingress_theorem"], LEAN_INGRESS_THEOREM)
        self.assertTrue(job["lean_terminal_ingress_ready"])
        self.assertEqual(job["cnf"]["variables"], instance.cnf.n_variables)
        self.assertEqual(job["cnf"]["clauses"], len(instance.cnf.clauses))
        self.assertEqual(
            job["positive_membership_bank"]["sha256"],
            self.membership_bank["bank_sha256"],
        )
        self.assertIn(
            "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
            {entry["path"] for entry in job["sources"]},
        )
        self.assertIn(
            (
                "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                "GenericPerpBisectorNogoodCertificate.lean"
            ),
            {entry["path"] for entry in job["sources"]},
        )
        self.assertIn(
            (
                "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
                "ExactTwelveRigid221StaticConvexSourceOrderConsumer.lean"
            ),
            {entry["path"] for entry in job["sources"]},
        )

    def test_source_order_bank_is_the_only_dynamic_admission(self) -> None:
        expected = typed_cut()
        with (
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_proof_backed_source_order_cut",
                return_value=expected,
            ),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_structural_certificate"
            ) as structural,
        ):
            admitted, status, certificate = detect_typed_source_order_cut(
                self.instance, DETECTOR_CLEAN_CUBE, source_order_bank={}
            )

        self.assertEqual(admitted, expected)
        self.assertEqual(status, "SOURCE_ORDER_CUT")
        self.assertIsNone(certificate)
        structural.assert_not_called()

    def test_static_duplicate_hit_is_a_formula_invariant_failure(self) -> None:
        with mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "detect_proof_backed_source_order_cut",
            return_value=None,
        ):
            admitted, status, certificate = detect_typed_source_order_cut(
                self.instance, DUPLICATE_CENTER_CUBE, source_order_bank={}
            )

        self.assertIsNone(admitted)
        self.assertEqual(status, "STATIC_CONVEX_INVARIANT_FAILED")
        assert certificate is not None
        self.assertEqual(certificate["stage"], "equality-duplicate-center")

    def test_static_equilateral_hit_is_a_formula_invariant_failure(self) -> None:
        with mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "detect_proof_backed_source_order_cut",
            return_value=None,
        ):
            admitted, status, certificate = detect_typed_source_order_cut(
                self.instance,
                EQUILATERAL_BISECTOR_CANARY,
                source_order_bank={},
            )

        self.assertIsNone(admitted)
        self.assertEqual(status, "STATIC_CONVEX_INVARIANT_FAILED")
        assert certificate is not None
        self.assertEqual(
            certificate["stage"],
            "equality-equilateral-bisector-collision",
        )

    def test_static_perpendicular_hit_is_a_formula_invariant_failure(self) -> None:
        with mock.patch(
            "census.card_head.exact12_next_row_static_cegar."
            "detect_proof_backed_source_order_cut",
            return_value=None,
        ):
            admitted, status, certificate = detect_typed_source_order_cut(
                self.instance,
                PERP_BISECTOR_CANARY,
                source_order_bank={},
            )

        self.assertIsNone(admitted)
        self.assertEqual(status, "STATIC_CONVEX_INVARIANT_FAILED")
        assert certificate is not None
        self.assertEqual(
            certificate["stage"],
            "equality-perpendicular-bisector-convex",
        )

    def test_other_structural_stage_is_preserved_but_not_admitted(self) -> None:
        certificate = {"stage": "equality-three-triad-collision"}
        with (
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_proof_backed_source_order_cut",
                return_value=None,
            ),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_structural_certificate",
                return_value=certificate,
            ),
        ):
            admitted, status, observed = detect_typed_source_order_cut(
                self.instance, DETECTOR_CLEAN_CUBE, source_order_bank={}
            )

        self.assertIsNone(admitted)
        self.assertEqual(status, "UNADMITTED_STRUCTURAL_SURVIVOR")
        self.assertEqual(observed, certificate)

    def test_record_authenticates_cut_binding_but_claims_no_formula_consumer(
        self,
    ) -> None:
        cut = typed_cut()
        record = _make_record(
            index=0,
            parent_sha256="a" * 64,
            job_id="a" * 64,
            detector_contract_sha256="b" * 64,
            static_convex_manifest_sha256=_sha256_json(self.layout.manifest()),
            cell_index=0,
            positive_membership_bank_sha256="e" * 64,
            positive_membership_family_id=FAKE_MEMBERSHIP_BANK[
                "block_spanning_family_bank"
            ]["family_id"],
            three_triad_membership_cut_id=FAKE_MEMBERSHIP_BANK["cut_id"],
            source_order_bank_sha256="c" * 64,
            admitted_cut=cut,
            pre_cut_cnf_sha256=_cnf_sha256(self.instance),
            post_cut_cnf_sha256="d" * 64,
            cube=DETECTOR_CLEAN_CUBE,
            positive_variables=(1,),
            n_variables=self.instance.cnf.n_variables,
        )

        self.assertEqual(record["schema"], RECORD_SCHEMA)
        self.assertEqual(
            record["generated_lean_nogood"]["nogood_declaration"],
            "Problem97.Generated.nogood",
        )
        self.assertEqual(record["terminal_formula_consumer"], LEAN_INGRESS_THEOREM)
        self.assertEqual(record["terminal_promotion_status"], TERMINAL_PROMOTION_STATUS)

        structural = copy.deepcopy(cut)
        object.__setattr__(structural, "certificate_kind", "structural")
        with self.assertRaisesRegex(
            Exact12NextRowStaticCegarError, "restricted to typed source-order"
        ):
            _make_record(
                index=0,
                parent_sha256="a" * 64,
                job_id="a" * 64,
                detector_contract_sha256="b" * 64,
                static_convex_manifest_sha256="e" * 64,
                cell_index=0,
                positive_membership_bank_sha256="e" * 64,
                positive_membership_family_id=FAKE_MEMBERSHIP_BANK[
                    "block_spanning_family_bank"
                ]["family_id"],
                three_triad_membership_cut_id=FAKE_MEMBERSHIP_BANK["cut_id"],
                source_order_bank_sha256="c" * 64,
                admitted_cut=structural,
                pre_cut_cnf_sha256="d" * 64,
                post_cut_cnf_sha256="e" * 64,
                cube=DETECTOR_CLEAN_CUBE,
                positive_variables=(1,),
                n_variables=self.instance.cnf.n_variables,
            )

    def test_survivor_is_deterministic_and_bound_to_the_static_formula(self) -> None:
        replay = {
            "candidate": True,
            "added_constraints": True,
            "exact_cnf": True,
            "canonical_static_extension": True,
        }
        survivor = _make_survivor(
            job_id="a" * 64,
            cell_index=0,
            local_iteration=3,
            layout=self.layout,
            positive_membership_bank=FAKE_MEMBERSHIP_BANK,
            classification="UNADMITTED_STRUCTURAL_SURVIVOR",
            cube=DETECTOR_CLEAN_CUBE,
            positive_variables=(1,),
            n_variables=self.instance.cnf.n_variables,
            cnf_sha256=_cnf_sha256(self.instance),
            replay=replay,
            structural={"stage": "equality-three-triad-collision"},
        )
        duplicate = _make_survivor(
            job_id="a" * 64,
            cell_index=0,
            local_iteration=3,
            layout=self.layout,
            positive_membership_bank=FAKE_MEMBERSHIP_BANK,
            classification="UNADMITTED_STRUCTURAL_SURVIVOR",
            cube={str(center): row for center, row in DETECTOR_CLEAN_CUBE.items()},
            positive_variables=[1],
            n_variables=self.instance.cnf.n_variables,
            cnf_sha256=_cnf_sha256(self.instance),
            replay=replay,
            structural={"stage": "equality-three-triad-collision"},
        )

        self.assertEqual(survivor, duplicate)
        self.assertEqual(survivor["schema"], SURVIVOR_SCHEMA)
        self.assertEqual(
            survivor["static_convex_manifest_sha256"],
            _sha256_json(self.layout.manifest()),
        )
        body = dict(survivor)
        observed_sha256 = body.pop("survivor_sha256")
        self.assertEqual(observed_sha256, _sha256_json(body))

    def test_sat_replay_rejects_an_incomplete_assignment(self) -> None:
        with self.assertRaisesRegex(EncodingError, "selects"):
            replay_static_convex_sat_witness(
                self.instance,
                self.compiled,
                self.layout,
                DETECTOR_CLEAN_CUBE,
                {1},
            )

    def test_replay_journal_empty_stream_is_transactional(self) -> None:
        instance = copy.deepcopy(self.membership_instance)
        prepared = _fake_prepare_source_order_bank(instance, FAKE_BANK)
        _fake_install_source_order_bank(instance, prepared)
        with TemporaryDirectory() as raw:
            journal = Path(raw) / "journal.jsonl"
            journal.touch()
            with _fake_source_order_pipeline():
                replayed = replay_journal(
                    instance,
                    self.membership_compiled,
                    self.membership_layout,
                    journal,
                    repo_root=REPO_ROOT,
                    job_id="a" * 64,
                    detector_contract_sha256="b" * 64,
                    cell_index=1,
                    positive_membership_bank=self.membership_bank,
                    source_order_bank=FAKE_BANK,
                    prepared_source_order_bank=prepared,
                )
        self.assertEqual(replayed, (0, "a" * 64, frozenset()))

    def test_replay_journal_rejects_membership_family_drift(self) -> None:
        instance = copy.deepcopy(self.membership_instance)
        prepared = _fake_prepare_source_order_bank(instance, FAKE_BANK)
        _fake_install_source_order_bank(instance, prepared)
        record = _make_record(
            index=0,
            parent_sha256="a" * 64,
            job_id="a" * 64,
            detector_contract_sha256="b" * 64,
            static_convex_manifest_sha256=_sha256_json(
                self.membership_layout.manifest()
            ),
            cell_index=1,
            positive_membership_bank_sha256=self.membership_bank["bank_sha256"],
            positive_membership_family_id=self.membership_bank[
                "block_spanning_family_bank"
            ]["family_id"],
            three_triad_membership_cut_id=self.membership_bank["cut_id"],
            source_order_bank_sha256=FAKE_BANK["bank_sha256"],
            admitted_cut=typed_cut(),
            pre_cut_cnf_sha256=_cnf_sha256(instance),
            post_cut_cnf_sha256="d" * 64,
            cube=DETECTOR_CLEAN_CUBE,
            positive_variables=(1,),
            n_variables=instance.cnf.n_variables,
        )
        record["positive_membership_family_id"] = "drifted-family.v1"
        body = dict(record)
        body.pop("record_sha256")
        record["record_sha256"] = _sha256_json(body)
        with TemporaryDirectory() as raw:
            journal = Path(raw) / "journal.jsonl"
            journal.write_text(
                json.dumps(record, sort_keys=True, separators=(",", ":")) + "\n",
                encoding="utf-8",
            )
            with (
                _fake_source_order_pipeline(),
                self.assertRaisesRegex(
                    Exact12NextRowStaticCegarError, "chain authentication"
                ),
            ):
                replay_journal(
                    instance,
                    self.membership_compiled,
                    self.membership_layout,
                    journal,
                    repo_root=REPO_ROOT,
                    job_id="a" * 64,
                    detector_contract_sha256="b" * 64,
                    cell_index=1,
                    positive_membership_bank=self.membership_bank,
                    source_order_bank=FAKE_BANK,
                    prepared_source_order_bank=prepared,
                )

    def test_untrusted_solver_cannot_promote_true_proof_verified(self) -> None:
        def untrusted_solver(instance, cnf_path, proof_path=None, **_kwargs):
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            if proof_path is not None:
                proof_path.write_text("c untrusted\n", encoding="ascii")
            return CadicalResult(
                verdict="UNSAT",
                cube=None,
                returncode=20,
                proof_verified=True,
                stdout_tail="",
            )

        with (
            TemporaryDirectory() as raw,
            _fake_source_order_pipeline(),
        ):
            summary = run_static_cegar(
                REPO_ROOT,
                Path(raw) / "run",
                1,
                max_iterations=1,
                solver=untrusted_solver,
            )

        self.assertEqual(summary["status"], "DISCOVERY_UNSAT_UNVERIFIED")
        self.assertFalse(summary["terminal_proof_verified"])
        self.assertIn("authenticated solver/certifier boundary", summary["error"])

    def test_fake_certifier_promotes_only_to_pending_lean_terminal_certificate(
        self,
    ) -> None:
        def fake_solver(instance, cnf_path, proof_path=None, **_kwargs):
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            if proof_path is not None:
                proof_path.write_text("c fake authenticated DRAT\n", encoding="ascii")
            return CadicalResult(
                verdict="UNSAT",
                cube=None,
                returncode=20,
                proof_verified=False,
                stdout_tail="",
            )

        def fake_certifier(instance, terminal_path, proof_path, terminal):
            return (
                terminal.verdict == "UNSAT"
                and terminal_path.is_file()
                and proof_path.is_file()
            )

        with (
            TemporaryDirectory() as raw,
            _fake_source_order_pipeline(),
        ):
            summary = run_static_cegar(
                REPO_ROOT,
                Path(raw) / "run",
                1,
                max_iterations=1,
                solver=fake_solver,
                terminal_proof_certifier=fake_certifier,
            )

        self.assertEqual(summary["status"], TERMINAL_PROMOTION_STATUS)
        self.assertEqual(
            summary["status"],
            "UNSAT_DRAT_VERIFIED_AWAITING_LEAN_TERMINAL_CERTIFICATE",
        )
        self.assertTrue(summary["lean_terminal_ingress_ready"])
        self.assertTrue(summary["terminal_proof_verified"])
        self.assertIn("no aggregate coverage", summary["scope"])
        self.assertIn("universal lift", summary["scope"])
        self.assertIn("live closure", summary["scope"])

    def test_tampered_persisted_job_fails_final_contract_validation(self) -> None:
        def fake_solver(instance, cnf_path, **_kwargs):
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            return CadicalResult(
                verdict="SAT",
                cube=DETECTOR_CLEAN_CUBE,
                returncode=10,
                proof_verified=False,
                stdout_tail="",
                positive_variables=frozenset({1}),
            )

        from census.card_head import exact12_next_row_static_cegar as runner

        real_write_json = runner._write_json

        def tampering_write_json(path: Path, value):
            real_write_json(path, value)
            if path.name == "job.json":
                tampered = json_load(path)
                tampered["cnf"]["clauses"] += 1
                real_write_json(path, tampered)

        certificate = {"stage": "equality-three-triad-collision", "rows": []}
        replay = {
            "candidate": True,
            "added_constraints": True,
            "exact_cnf": True,
            "canonical_static_extension": True,
        }
        with (
            TemporaryDirectory() as raw,
            _fake_source_order_pipeline(),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "replay_static_convex_sat_witness",
                return_value=(DETECTOR_CLEAN_CUBE, frozenset({1}), replay),
            ),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_proof_backed_source_order_cut",
                return_value=None,
            ),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar."
                "detect_structural_certificate",
                return_value=certificate,
            ),
            mock.patch(
                "census.card_head.exact12_next_row_static_cegar._write_json",
                side_effect=tampering_write_json,
            ),
        ):
            summary = run_static_cegar(
                REPO_ROOT,
                Path(raw) / "run",
                1,
                max_iterations=1,
                solver=fake_solver,
            )

        self.assertEqual(summary["status"], "ARTIFACT_REPLAY_FAILED")
        self.assertIn("job.json", summary["error"])

    def test_tampered_detector_contract_fails_hash_and_content_validation(self) -> None:
        instance = copy.deepcopy(self.membership_instance)
        prepared = _fake_prepare_source_order_bank(instance, FAKE_BANK)
        _fake_install_source_order_bank(instance, prepared)
        with _fake_source_order_pipeline():
            job = _build_job(
                REPO_ROOT,
                self.membership_compiled,
                self.membership_layout,
                instance,
                self.membership_bank,
                FAKE_BANK,
                prepared,
            )
        detector_payload = {"contract": DETECTOR_CONTRACT, "sources": []}
        detector_sha256 = _sha256_json(detector_payload)
        with TemporaryDirectory() as raw:
            root = Path(raw)
            job_path = root / "job.json"
            detector_path = root / "detector_contract.json"
            job_path.write_text(json.dumps(job), encoding="utf-8")
            detector_path.write_text(
                json.dumps({**detector_payload, "sha256": detector_sha256}),
                encoding="utf-8",
            )
            detector = json_load(detector_path)
            detector["contract"] = "tampered"
            detector_path.write_text(json.dumps(detector), encoding="utf-8")
            with self.assertRaisesRegex(
                Exact12NextRowStaticCegarError, "detector_contract.json"
            ):
                _authenticate_persisted_contracts(
                    job_path,
                    job,
                    detector_path,
                    detector_payload,
                    detector_sha256,
                )

    def test_runner_stops_on_untyped_stage_and_preserves_survivor(self) -> None:
        certificate = {"stage": "equality-three-triad-collision", "rows": []}

        def fake_solver(instance, cnf_path, **_kwargs):
            cnf_path.write_text(instance.dimacs(), encoding="ascii")
            return CadicalResult(
                verdict="SAT",
                cube=DETECTOR_CLEAN_CUBE,
                returncode=10,
                proof_verified=False,
                stdout_tail="",
                positive_variables=frozenset({1}),
            )

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            replay = {
                "candidate": True,
                "added_constraints": True,
                "exact_cnf": True,
            }
            with (
                _fake_source_order_pipeline(),
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar."
                    "replay_static_convex_sat_witness",
                    return_value=(DETECTOR_CLEAN_CUBE, frozenset({1}), replay),
                ),
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar."
                    "detect_proof_backed_source_order_cut",
                    return_value=None,
                ),
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar."
                    "detect_structural_certificate",
                    return_value=certificate,
                ),
            ):
                summary = run_static_cegar(
                    REPO_ROOT,
                    workdir,
                    1,
                    max_iterations=1,
                    solver=fake_solver,
                )

            self.assertEqual(summary["status"], "UNADMITTED_STRUCTURAL_SURVIVOR")
            self.assertEqual(summary["schema"], RUN_SCHEMA)
            self.assertEqual(summary["records"], 0)
            self.assertTrue(summary["lean_terminal_ingress_ready"])
            survivor = json_load(workdir / "survivor.json")
            self.assertEqual(survivor["unadmitted_structural_certificate"], certificate)

    def test_cli_defaults_to_cell1_piqd_with_sequential_single_worker(self) -> None:
        from census.card_head import exact12_next_row_static_piqd as piqd

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar.run_static_cegar",
                    side_effect=AssertionError("default route reached legacy-local"),
                ),
                mock.patch.object(
                    piqd,
                    "run_exact12_static_piqd",
                    return_value={"status": "UNKNOWN"},
                ) as routed,
            ):
                self.assertEqual(main(["--workdir", str(workdir)]), 0)

        routed.assert_called_once()
        kwargs = routed.call_args.kwargs
        self.assertEqual(routed.call_args.args[1], workdir)
        self.assertEqual(kwargs["piqd_base_url"], DEFAULT_PIQD_BASE_URL)
        self.assertEqual(kwargs["piqd_journal_root"], workdir / "piqd-discovery")
        self.assertEqual(kwargs["workers"], 1)
        self.assertEqual(kwargs["parallel_mode"], "sequential")

    def test_cli_legacy_local_discovery_requires_explicit_selection(self) -> None:
        from census.card_head import exact12_next_row_static_piqd as piqd

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar.run_static_cegar",
                    return_value={"status": "UNKNOWN"},
                ) as local,
                mock.patch.object(
                    piqd,
                    "run_exact12_static_piqd",
                    side_effect=AssertionError("legacy-local constructed PIQD"),
                ),
            ):
                self.assertEqual(
                    main(
                        [
                            "--workdir",
                            str(workdir),
                            "--solver-backend",
                            "legacy-local",
                        ]
                    ),
                    0,
                )

        local.assert_called_once()

    def test_cli_rejects_parallel_workers_before_routing(self) -> None:
        with TemporaryDirectory() as raw, self.assertRaises(SystemExit):
            main(["--workdir", str(Path(raw) / "run"), "--workers", "2"])

    def test_default_piqd_construction_failure_has_no_local_fallback(self) -> None:
        from census.card_head import exact12_next_row_static_piqd as piqd

        with TemporaryDirectory() as raw:
            workdir = Path(raw) / "run"
            with (
                mock.patch(
                    "census.card_head.exact12_next_row_static_cegar.run_static_cegar",
                    side_effect=AssertionError("PIQD failure fell back to local"),
                ),
                mock.patch.object(
                    piqd,
                    "run_exact12_static_piqd",
                    side_effect=piqd.Exact12NextRowStaticPiqdError(
                        "synthetic PIQD construction failure"
                    ),
                ),
                self.assertRaises(SystemExit),
            ):
                main(["--workdir", str(workdir)])


def json_load(path: Path):
    import json

    return json.loads(path.read_text(encoding="utf-8"))


if __name__ == "__main__":
    unittest.main()
