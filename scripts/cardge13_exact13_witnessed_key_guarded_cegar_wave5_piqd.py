#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
"""Continue the exact13 guarded witnessed-Key CEGAR frontier for wave5.

Wave4 is an audited producer.  This thin successor adapter pins wave4's final
36,000-cut bank by hash, preserves its corrected guarded root and historical
parent partition, then delegates the live PIQD loop to the audited machinery.
The result is formula-scoped solver discovery evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave4_piqd as wave4

LANE = "exact13-witnessed-key-guarded-cegar-wave5-20260906"
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
WAVE4_RUN = Path("scratch/runs/exact13-witnessed-key-guarded-cegar-wave4-20260906/run-0001")
WAVE4_ROOT_SHA256 = "238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f"
WAVE4_BANK_SHA256 = "2c1607d847dcb1417a067419b3494d285d52cc2bd98337099993bbb3d19a3e90"
IMPORTED_CUT_COUNT = 36_000
WAVE2_CUT_COUNT = 6_000
WAVE4_NEW_CUT_COUNT = 20_000
EXPECTED_GUARDED_COUNT = 1_815
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 31_283
EXPECTED_WAVE2_OUTSIDE_STRONGVALID = 4_431
EXPECTED_WAVE2_STRONGVALID = 1_569
EXPECTED_WAVE4_STRONGVALID = 30_000
BASE_HEAD = "ba3806303ddfd3b9a23e885367baa440e07427f8"

SCHEMA = "cardge13-exact13-witnessed-key-guarded-cegar-wave5-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-witnessed-key-effective-root-wave5/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state-wave5/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody-wave5/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration-wave5/v1"
NO_EXACT_KEY_ENUMERATION_BLOCKS = True
NO_EXISTENTIAL_WITNESS_CUT_VARIABLES = True

# These aliases are intentional: regression tests and audit consumers inspect
# the exact root implementation used by the delegated producer.
root = wave4.root
wave3 = wave4.wave3
guarded_cnf = wave4.guarded_cnf


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def reseal(value: dict[str, object]) -> dict[str, object]:
    return wave4.reseal(value)


def source_bindings(source: Path) -> dict[str, str]:
    paths = (
        source,
        wave4.STRONG_SOURCE,
        Path(__file__),
        Path(wave4.__file__),
        Path(wave4.wave3.__file__),
        Path(wave4.root.__file__),
        wave4.WAVE1_SCRIPT,
        Path(wave4.wave1.paths.__file__),
        Path(wave4.wave1.pairs.__file__),
        Path(wave4.wave1.legacy.__file__),
        Path(wave4.boundary.__file__),
        Path("scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py"),
    )
    relative = {str(path.resolve().relative_to(Path.cwd())) for path in paths}
    return {path: sha256(Path(path).read_bytes()) for path in sorted(relative)}


def configure_delegate() -> None:
    """Install wave5 names and root hooks into the audited wave1 runner."""
    wave4.wave1.SCHEMA = SCHEMA
    wave4.wave1.ROOT_REPAIR_SCHEMA = ROOT_SCHEMA
    wave4.wave1.MIGRATION_SCHEMA = MIGRATION_SCHEMA
    wave4.wave1.STATE_SCHEMA = STATE_SCHEMA
    wave4.wave1.CUSTODY_SCHEMA = CUSTODY_SCHEMA
    wave4.wave1.DEFAULT_RUN_ROOT = RUN_ROOT
    wave4.wave1.__file__ = str(Path(__file__).resolve())
    wave4.wave1.initial_root = wave4.guarded_initial_root
    wave4.wave1.source_bindings = source_bindings


def configure_wave4_adapter() -> None:
    """Retarget wave4's immutable-input globals to the wave4 final bank."""
    wave4.LANE = LANE
    wave4.RUN_ROOT = RUN_ROOT
    wave4.WAVE3_RUN = WAVE4_RUN
    wave4.WAVE3_ROOT_SHA256 = WAVE4_ROOT_SHA256
    wave4.WAVE3_BANK_SHA256 = WAVE4_BANK_SHA256
    wave4.IMPORTED_CUT_COUNT = IMPORTED_CUT_COUNT
    wave4.WAVE3_CUT_COUNT = WAVE4_NEW_CUT_COUNT + WAVE2_CUT_COUNT
    wave4.WAVE2_CUT_COUNT = WAVE2_CUT_COUNT
    wave4.EXPECTED_WAVE3_STRONGVALID = EXPECTED_WAVE4_STRONGVALID
    wave4.BASE_HEAD = BASE_HEAD
    wave4.SCHEMA = SCHEMA
    wave4.ROOT_SCHEMA = ROOT_SCHEMA
    wave4.STATE_SCHEMA = STATE_SCHEMA
    wave4.CUSTODY_SCHEMA = CUSTODY_SCHEMA
    wave4.MIGRATION_SCHEMA = MIGRATION_SCHEMA
    wave4.source_bindings = source_bindings


def run(args: argparse.Namespace) -> dict[str, object]:
    configure_wave4_adapter()
    configure_delegate()
    if args.producer_commit != BASE_HEAD:
        raise wave4.wave1.AuditError("wave5 requires the authenticated pushed HEAD ba3806303")
    actual_head = subprocess.run(
        ["git", "rev-parse", "HEAD"], capture_output=True, text=True, check=True
    ).stdout.strip()
    if actual_head != BASE_HEAD:
        raise wave4.wave1.AuditError(f"resolved HEAD drifted: {actual_head}")
    if args.additional_refinements < 0:
        raise ValueError("additional refinement budget must be nonnegative")

    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    wave4.update_run_manifest(RUN_ROOT, args.source)
    cnf, projection, root_report = wave4.guarded_initial_root(
        RUN_ROOT, args.source, args.producer_commit
    )
    import_report = wave4.import_wave3_frontier(RUN_ROOT, cnf, projection)
    import_report.update({
        "source_wave": 4,
        "source_final_cut_count": IMPORTED_CUT_COUNT,
        "source_final_bank_sha256": WAVE4_BANK_SHA256,
        "historical_parent_partition_preserved": True,
    })
    args.run_root = RUN_ROOT
    args.max_refinements = IMPORTED_CUT_COUNT + args.additional_refinements
    args.finalize_retained_budget = False
    wave4.install_new_model_guard()
    report = wave4.wave1.run(args)
    new_models = wave4.verify_new_models(RUN_ROOT, cnf, projection, WAVE4_ROOT_SHA256)
    report.update({
        "wave4_import": import_report,
        "wave4_cut_count": WAVE4_NEW_CUT_COUNT,
        "wave2_cut_count": WAVE2_CUT_COUNT,
        "imported_cut_count": IMPORTED_CUT_COUNT,
        "additional_refinement_budget": args.additional_refinements,
        "guarded_clause_count": EXPECTED_GUARDED_COUNT,
        "guarded_model_parent_partition": import_report["first_6000_parent_partition"],
        "wave4_strongvalid_parent_count": import_report["last_10000_cut_parent_partition"]["StrongValid"],
        "new_model_strongvalid_replay": new_models,
        "wave_data_generalization_checkpoint": {
            "wave": 5,
            "reviewed_new_models": new_models["new_model_count"],
            "reviewed_new_cuts": max(0, int(report["refinement_count"]) - IMPORTED_CUT_COUNT),
            "candidate_general_theorem": None,
            "outcome": "no stable new theorem candidate; retain formula-scoped cut schema",
        },
        "claim_boundary": "solver-only formula-scoped discovery; no Lean theorem or promoted UNSAT claim",
        "no_exact_key_enumeration_blocks": NO_EXACT_KEY_ENUMERATION_BLOCKS,
        "no_existential_witness_cut_variables": NO_EXISTENTIAL_WITNESS_CUT_VARIABLES,
        "root_identity": {
            "variables": EXPECTED_ROOT_VARIABLES,
            "clauses": EXPECTED_ROOT_CLAUSES,
            "sha256": WAVE4_ROOT_SHA256,
        },
    })
    return wave4.finalize_terminal_artifacts(report, root_report, import_report, args.source)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=wave4.wave1.DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=wave4.wave1.DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=wave4.wave1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=20_000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0)
    parser.add_argument("--finalize-existing", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    arguments = parse_args()
    configure_wave4_adapter()
    configure_delegate()
    result = wave4.finalize_existing_run(arguments.source) if arguments.finalize_existing else run(arguments)
    print(canonical({key: result.get(key) for key in (
        "status", "root_variables", "root_clauses", "imported_cut_count",
        "refinement_count", "one_form_cuts", "two_form_cuts",
        "solve_count_this_invocation", "wall_elapsed_seconds",
    )}).decode())
