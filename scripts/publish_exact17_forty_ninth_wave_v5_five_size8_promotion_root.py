"""Create-once publication adapter for the V49 wave-v5 five-support child."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

import publish_exact17_forty_ninth_wave_v4_three_zero_atom_promotion_root as _base
import validate_exact17_forty_ninth_wave_v5_five_size8_promotion_export as validator

ROOT = Path(__file__).resolve().parents[1]
PACKAGE_ROOT = (
    ROOT / "scratch/runs/exact17-forty-ninth-wave-v5-five-size8-20260817/export-v1"
)
RECEIPT_PATH = PACKAGE_ROOT / "export-receipt.json"
AUDIT_REPORT_PATH = PACKAGE_ROOT / "independent-audit-report.json"
COVERAGE_LEDGER_PATH = PACKAGE_ROOT / "coverage-ledger.json"
VALIDATOR_PATH = Path(validator.__file__).resolve()
PUBLISHER_PATH = Path(__file__).resolve()

VALIDATOR_SOURCE_COMMIT = "01c4f98853991a5fc0412907d0010663418f1b20"
VALIDATOR_SHA256 = "13c63ecde0e633c07027c323fcccb3224e029a574610afbdc4484e48d8f9c3b3"
VALIDATOR_BYTES = 12_914
RECEIPT_SCHEMA = "p97-exact17-forty-ninth-wave-v5-five-size8-promotion-receipt/v1"
COVERAGE_SCHEMA = "p97-exact17-forty-ninth-wave-v5-five-size8-promotion-coverage/v1"
AUDIT_SCHEMA = "p97-exact17-forty-ninth-wave-v5-five-size8-promotion-audit/v1"

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
    _base.PRODUCTION_PATHS = PRODUCTION_PATHS
    _base.coverage_ledger = coverage_ledger
    _base._configure_base()


def coverage_ledger(
    validation: dict[str, object], baseline: PublisherBaseline
) -> dict[str, Any]:
    census = validation["parent_subsumption_census"]
    return {
        "schema": COVERAGE_SCHEMA,
        "status": "PASS",
        "profile_id": "exact17-forty-ninth-wave-v5-five-size8-promotion",
        "source": {
            "commit": validator.SOURCE_COMMIT,
            "baseline_sha256": validator.SOURCE_BASELINE_SHA256,
            "lean_root_sha256": validator.LEAN_ROOT_SHA256,
            "lean_export_sha256": validator.LEAN_EXPORT_SHA256,
            "theorem": "Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion.sourceAssign_extendedFortyNinthWaveV5FiveSize8PromotionCnf",
            "terminal_adapter": "Problem97.ATailBlockerVExactSeventeenFortyNinthWaveV5FiveSize8Promotion.false_of_sourceRealization_of_extendedFortyNinthWaveV5FiveSize8PromotionCnf_unsat",
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
            "parent_subsumption_census": census,
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
    return _base.publish(paths=paths, publisher_baseline=publisher_baseline)


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
