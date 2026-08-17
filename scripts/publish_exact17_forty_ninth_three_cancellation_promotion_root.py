"""Create-once publication for the two eight-hit V49 cancellation child."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import publish_exact17_weighted_successor_model_root as _base
import validate_exact17_forty_ninth_three_cancellation_promotion_export as validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = ROOT / (
    "scratch/runs/exact17-forty-ninth-three-cancellations-20260817/export-v1"
)
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
PUBLISHER_PATH = Path(__file__).resolve()

VALIDATOR_SOURCE_COMMIT = "13999539aea0f5abde3bfcdb28bfcf7581ec41f0"
VALIDATOR_SHA256 = "2f437729b6a5291c3f2e12470baa1e85f41a977342413754df47aa8e68d48c35"
VALIDATOR_BYTES = 5438
RECEIPT_SCHEMA = "p97-exact17-forty-ninth-three-cancellation-promotion-receipt/v1"
COVERAGE_SCHEMA = "p97-exact17-forty-ninth-three-cancellation-promotion-coverage/v1"
AUDIT_SCHEMA = "p97-exact17-forty-ninth-three-cancellation-promotion-audit/v1"

PublicationPaths = _base.PublicationPaths
PublisherBaseline = _base.PublisherBaseline
CandidateReservation = _base.CandidateReservation
_run_lean = _base._run_lean

PRODUCTION_PATHS = PublicationPaths(
    parent=validator.PARENT_PATH,
    child=validator.CHILD_PATH,
    receipt=RECEIPT_PATH,
    audit_report=AUDIT_REPORT_PATH,
    coverage_ledger=COVERAGE_LEDGER_PATH,
    validator_script=VALIDATOR_PATH,
    publisher_script=PUBLISHER_PATH,
    lean_root=validator.LEAN_ROOT_PATH,
    lean_export=validator.LEAN_EXPORT_PATH,
    parent_lean_root=validator.PARENT_LEAN_ROOT_PATH,
    parent_lean_export=validator.PARENT_LEAN_EXPORT_PATH,
    source_bridge=validator.SOURCE_BRIDGE_PATH,
)


def _configure_base() -> None:
    _base.validator = validator
    _base.VALIDATOR_SOURCE_COMMIT = VALIDATOR_SOURCE_COMMIT
    _base.VALIDATOR_SHA256 = VALIDATOR_SHA256
    _base.VALIDATOR_BYTES = VALIDATOR_BYTES
    _base.RECEIPT_SCHEMA = RECEIPT_SCHEMA
    _base.COVERAGE_SCHEMA = COVERAGE_SCHEMA
    _base.AUDIT_SCHEMA = AUDIT_SCHEMA


def _validation(paths: PublicationPaths, child: Path) -> dict[str, object]:
    return validator._validate_export(paths.parent, child, check_support=True)


def coverage_ledger(
    validation: dict[str, object], baseline: PublisherBaseline
) -> dict[str, Any]:
    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": "exact17-forty-ninth-three-cancellation-promotion",
        "source": {
            "commit": validator.SOURCE_COMMIT,
            "baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "lean_root_sha256": validator.LEAN_ROOT_SHA256,
            "lean_export_sha256": validator.LEAN_EXPORT_SHA256,
            "theorem": "Problem97.ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion.sourceAssign_extendedFortyNinthThreeCancellationPromotionCnf",
            "terminal_adapter": "Problem97.ATailBlockerVExactSeventeenFortyNinthThreeCancellationPromotion.false_of_sourceRealization_of_extendedFortyNinthThreeCancellationPromotionCnf_unsat",
        },
        "parent": validation["parent"],
        "child": validation["child"],
        "enumeration": {
            "occurrences": validator.OCCURRENCES,
            "named_orders": 2,
            "orientations": 2,
            "clauses_per_occurrence": validator.CLAUSES_PER_OCCURRENCE,
            "clauses": validator.SUFFIX_CLAUSES,
            "ordered_suffix_sha256": validator.EXPECTED_SUFFIX_SHA256,
            "parent_subsumption_census": validation["parent_subsumption_census"],
        },
        "tooling": {
            "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
            "validator_sha256": VALIDATOR_SHA256,
            "validator_bytes": VALIDATOR_BYTES,
            "publisher_source_commit": baseline.source_commit,
            "publisher_sha256": baseline.sha256,
            "publisher_bytes": baseline.bytes,
        },
        "claims": {
            "source_entitlement": True,
            "theorem_coverage": True,
            "exact17_closure": False,
            "lean_closure": False,
            "universal_lift": False,
        },
    }


def publish(
    paths: PublicationPaths = PRODUCTION_PATHS,
    publisher_baseline: PublisherBaseline | None = None,
) -> dict[str, Any]:
    _configure_base()
    publisher_binding = _base._require_publisher_provenance(paths, publisher_baseline)
    _base._require_source_commit(paths)
    outputs = (paths.child, paths.audit_report, paths.coverage_ledger, paths.receipt)
    for directory in {path.parent for path in outputs}:
        _base._ensure_real_directory(directory)
    for path in outputs:
        _base._assert_absent(path)
    reservation: CandidateReservation | None = None
    published: list[tuple[Path, int, int]] = []
    try:
        reservation = _base._reserve_candidate(paths.child.parent)
        _base._assert_candidate_binding(reservation)
        _run_lean(reservation.candidate, paths)
        _base._assert_candidate_binding(reservation)
        candidate_validation = _validation(paths, reservation.candidate)
        _base._assert_candidate_binding(reservation)
        _base._bind_candidate_validation(reservation, candidate_validation)
        _base._fsync_candidate(reservation)
        identity = _base._publish_candidate(reservation, paths.child)
        published.append((paths.child, *identity))
        _base._close_reservation(reservation)
        final_validation = _validation(paths, paths.child)
        audit = {
            "schema": AUDIT_SCHEMA,
            "status": "PASS",
            "validation": final_validation,
        }
        audit_id = _base._write_exclusive_readonly(
            paths.audit_report, _base.canonical_json_bytes(audit)
        )
        published.append((paths.audit_report, *audit_id))
        ledger = coverage_ledger(final_validation, publisher_baseline)
        ledger_bytes = _base.canonical_json_bytes(ledger)
        ledger_id = _base._write_exclusive_readonly(paths.coverage_ledger, ledger_bytes)
        published.append((paths.coverage_ledger, *ledger_id))
        receipt = {
            "schema": RECEIPT_SCHEMA,
            "status": "PASS",
            "publication_state": "PROVISIONED",
            "profile_id": "exact17-forty-ninth-three-cancellation-promotion",
            "source_commit": validator.SOURCE_COMMIT,
            "source_baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "validator_source_commit": VALIDATOR_SOURCE_COMMIT,
            "publisher_source_commit": publisher_baseline.source_commit,
            "parent": final_validation["parent"],
            "child": final_validation["child"],
            "ordered_suffix": final_validation["suffix"],
            "parent_subsumption_census": final_validation["parent_subsumption_census"],
            "artifacts": {
                "parent_cnf": _base._artifact(paths.parent),
                "child_cnf": _base._artifact(paths.child),
                "lean_root": _base._artifact(paths.lean_root),
                "lean_export": _base._artifact(paths.lean_export),
                "validator": _base._artifact(paths.validator_script),
                "publisher": publisher_binding,
                "audit": _base._artifact(paths.audit_report),
                "coverage_ledger": _base._artifact(paths.coverage_ledger),
            },
            "coverage_ledger_sha256": hashlib.sha256(ledger_bytes).hexdigest(),
            "policy": {
                "direct_lean_export": True,
                "exact_parent_body_prefix": True,
                "independent_suffix_replay": True,
                "complete_parent_subsumption_census": True,
                "final_child_revalidated": True,
                "create_once": True,
            },
        }
        receipt_id = _base._write_exclusive_readonly(
            paths.receipt, _base.canonical_json_bytes(receipt)
        )
        published.append((paths.receipt, *receipt_id))
        return receipt
    except Exception as error:
        if reservation is not None and not reservation.closed:
            try:
                _base._close_reservation(reservation)
            except (OSError, ValueError) as cleanup_error:
                error.add_note(f"publication rollback warning: {cleanup_error}")
        for path, device, inode in reversed(published):
            try:
                _base._remove_created(path, device, inode)
            except (OSError, ValueError) as cleanup_error:
                error.add_note(f"publication rollback warning: {cleanup_error}")
        raise


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--publisher-source-commit", required=True)
    parser.add_argument("--publisher-sha256", required=True)
    parser.add_argument("--publisher-bytes", required=True, type=int)
    args = parser.parse_args(argv)
    baseline = PublisherBaseline(
        args.publisher_source_commit, args.publisher_sha256, args.publisher_bytes
    )
    print(json.dumps(publish(publisher_baseline=baseline), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
