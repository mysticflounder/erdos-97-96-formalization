#!/usr/bin/env python3
"""Continue the authenticated exact-13 witnessed-Key PIQD frontier.

This is a fresh wave namespace.  It imports wave 1's corrected root and all
1,000 source-sound cuts, then delegates SAT-session mechanics and the
independent Key.Valid/path replay to the audited wave-1 implementation.  The
result is solver-only discovery evidence; it is not a Lean or promotion claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any

import cardge13_exact13_witnessed_key_cegar_wave1_piqd as wave1
import cardge13_exact13_witnessed_key_root_piqd as root

LANE = "exact13-witnessed-key-cegar-wave2-20260906"
WAVE1_RUN = Path(
    "scratch/runs/exact13-witnessed-key-cegar-wave1-20260906/run-0001"
)
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
WAVE1_ROOT_SHA256 = (
    "a93163e7342405bad06772269ea8f54726c1fabd4467e55d4a6efecd4c87181f"
)
WAVE1_JOURNAL_SHA256 = (
    "b9de440ef5a6856a6b0cebbe5f7e5e3b66ad983019c3cfaabf5774a3fb696080"
)
WAVE1_BANK_SHA256 = (
    "ab759ceba74daf8d3cc3eb06daf18e8144e88098ae1a48b5df33d7f3ba06906f"
)
WAVE1_CUT_COUNT = 1000

SCHEMA = "cardge13-exact13-witnessed-key-cegar-wave2-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-witnessed-key-effective-root-wave2/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration-wave2/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state-wave2/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody-wave2/v1"
NO_EXACT_KEY_ENUMERATION_BLOCKS = True
NO_EXISTENTIAL_WITNESS_CUT_VARIABLES = True


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def reseal(value: dict[str, object]) -> dict[str, object]:
    """Replace any inherited seal before computing the current event seal."""
    unsigned = dict(value)
    unsigned.pop("event_sha256", None)
    return wave1.seal(unsigned)


def _configure_wave1_delegate() -> None:
    """Give the audited delegate the wave-2 schema and producer identity."""
    wave1.SCHEMA = SCHEMA
    wave1.ROOT_REPAIR_SCHEMA = ROOT_SCHEMA
    wave1.MIGRATION_SCHEMA = MIGRATION_SCHEMA
    wave1.STATE_SCHEMA = STATE_SCHEMA
    wave1.CUSTODY_SCHEMA = CUSTODY_SCHEMA
    wave1.DEFAULT_RUN_ROOT = RUN_ROOT
    wave1.__file__ = str(Path(__file__).resolve())


def source_bindings(source: Path) -> dict[str, str]:
    paths = (
        source,
        Path(__file__),
        Path(root.__file__),
        Path(wave1.paths.__file__),
        Path(wave1.pairs.__file__),
        Path(wave1.legacy.__file__),
        Path("scripts/cardge13_exact13_witnessed_key_cegar_wave1_piqd.py"),
    )
    relative = {
        str(path.resolve().relative_to(Path.cwd())) if path.is_absolute() else str(path)
        for path in paths
    }
    return {path: sha256(Path(path).read_bytes()) for path in sorted(relative)}


def _copy_resealed(source: Path, destination: Path, *, updates: dict[str, Any]) -> str:
    value = json.loads(source.read_text())
    if not isinstance(value, dict):
        raise wave1.AuditError(f"imported artifact is not an object: {source}")
    value.pop("event_sha256", None)
    value.update(updates)
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_bytes(wave1.canonical(wave1.seal(value)) + b"\n")
    return sha256(destination.read_bytes())


def import_wave1_frontier(
    run_root: Path, *, rebound_root_sha256: str | None = None
) -> dict[str, object]:
    """Copy and rebind the complete authenticated wave-1 frontier."""
    source_root = WAVE1_RUN / "artifacts" / "exact13-witnessed-key-effective-root.cnf"
    source_bank = WAVE1_RUN / "events" / "cut-bank.jsonl"
    if sha256(source_root.read_bytes()) != WAVE1_ROOT_SHA256:
        raise wave1.AuditError("wave1 effective root digest drifted")
    if sha256(source_bank.read_bytes()) != WAVE1_BANK_SHA256:
        raise wave1.AuditError("wave1 cut-bank digest drifted")
    records = wave1.load_bank(source_bank)
    if len(records) != WAVE1_CUT_COUNT:
        raise wave1.AuditError("wave1 cut-bank count is not exactly 1,000")

    imported_root = run_root / "artifacts" / "imported-wave1-effective-root.cnf"
    wave1.write_once(imported_root, source_root.read_bytes())
    if imported_root.read_bytes() != source_root.read_bytes():
        raise wave1.AuditError("imported wave1 root is not byte-identical")
    bank_path = run_root / "events" / "cut-bank.jsonl"
    imported_rows: list[dict[str, object]] = []
    for index, record in enumerate(records):
        cert_source = Path(str(record["certificate"]))
        cert = json.loads(cert_source.read_text())
        model_source = Path(str(cert["parent_model"]))
        model = json.loads(model_source.read_text())
        raw_source = Path(str(model["raw_solve"]))
        raw_destination = run_root / "events" / "piqd" / f"imported-{index:04d}.json"
        wave1.write_once(raw_destination, raw_source.read_bytes())
        model_destination = run_root / "events" / "models" / f"imported-{index:04d}.json"
        model_digest = _copy_resealed(
            model_source,
            model_destination,
            updates={
                "raw_solve": str(raw_destination),
                **(
                    {"root_emitted_sha256": rebound_root_sha256}
                    if rebound_root_sha256 is not None
                    else {}
                ),
            },
        )
        cert_destination = run_root / "events" / "cuts" / f"imported-{index:04d}.json"
        cert_digest = _copy_resealed(
            cert_source,
            cert_destination,
            updates={
                "parent_model": str(model_destination),
                "parent_model_sha256": model_digest,
            },
        )
        imported = dict(record)
        imported["certificate"] = str(cert_destination)
        imported["certificate_sha256"] = cert_digest
        imported_rows.append(imported)
    bank_path.parent.mkdir(parents=True, exist_ok=True)
    bank_path.write_bytes(b"".join(wave1.canonical(row) + b"\n" for row in imported_rows))
    if len(imported_rows) != WAVE1_CUT_COUNT:
        raise wave1.AuditError("wave1 import did not retain all cut rows")
    return {
        "source_root": str(source_root),
        "source_root_sha256": sha256(source_root.read_bytes()),
        "imported_root": str(imported_root),
        "imported_root_sha256": sha256(imported_root.read_bytes()),
        "source_normalized_journal_sha256": WAVE1_JOURNAL_SHA256,
        "source_bank": str(source_bank),
        "source_bank_sha256": WAVE1_BANK_SHA256,
        "imported_bank": str(bank_path),
        "imported_bank_sha256": sha256(bank_path.read_bytes()),
        "imported_cut_count": len(imported_rows),
        "parent_models_rebound": len(imported_rows),
        "raw_solve_records_rebound": len(imported_rows),
        "all_paths_rewritten_and_resealed": True,
    }


def update_run_manifest(run_root: Path, source: Path) -> None:
    manifest_path = run_root / "run_manifest.json"
    value = json.loads(manifest_path.read_text())
    if not isinstance(value, dict):
        raise wave1.AuditError("run manifest is malformed")
    value["source_digests"] = source_bindings(source) | {
        "scripts/cardge13_exact13_witnessed_key_cegar_wave1_piqd.py": sha256(
            Path("scripts/cardge13_exact13_witnessed_key_cegar_wave1_piqd.py").read_bytes()
        )
    }
    value["manifest_sha256"] = sha256(
        canonical({key: item for key, item in value.items() if key != "manifest_sha256"})
    )
    manifest_path.write_bytes(canonical(value) + b"\n")


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.producer_commit != "be28c8c1c44f57a69009f33da061062f70207ff4":
        raise wave1.AuditError("wave2 must run from the authenticated pushed HEAD")
    _configure_wave1_delegate()
    args.run_root = RUN_ROOT
    args.max_refinements = WAVE1_CUT_COUNT + args.additional_refinements
    args.finalize_retained_budget = False
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    update_run_manifest(RUN_ROOT, args.source)
    # Generate the corrected root once before seeding state; the delegate then
    # repeats write-once generation and performs its full migration replay.
    _cnf, _projection, root_report = wave1.initial_root(
        RUN_ROOT, args.source, args.producer_commit
    )
    if root_report["piqd_normalized_journal_sha256"] != WAVE1_JOURNAL_SHA256:
        raise wave1.AuditError("wave2 normalized root journal identity drifted")
    import_report = import_wave1_frontier(
        RUN_ROOT, rebound_root_sha256=str(root_report["emitted_cnf_sha256"])
    )
    bindings = source_bindings(args.source)
    state = wave1.seal({
        "schema": STATE_SCHEMA,
        "status": "IMPORTED_WAVE1_FRONTIER",
        "sessions": [],
        "active_session": None,
        "refinement_count": WAVE1_CUT_COUNT,
        "source_bindings": bindings,
        "root_emitted_sha256": root_report["inherited_root_sha256"],
        "root_piqd_normalized_sha256": WAVE1_JOURNAL_SHA256,
    })
    wave1.atomic_json(RUN_ROOT / "events" / "state.json", state)
    report = wave1.run(args)
    report["wave1_import"] = import_report
    report["additional_refinement_budget"] = args.additional_refinements
    report["wave1_cut_count"] = WAVE1_CUT_COUNT
    report["claim_boundary"] = "solver-only discovery; no Lean theorem or promoted UNSAT claim"
    report["no_exact_key_enumeration_blocks"] = NO_EXACT_KEY_ENUMERATION_BLOCKS
    report["no_existential_witness_cut_variables"] = NO_EXISTENTIAL_WITNESS_CUT_VARIABLES
    wave1.atomic_json(RUN_ROOT / "events" / "run.json", reseal(report))
    return report


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=wave1.DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=wave1.DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=wave1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=5000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    if args.additional_refinements < 0:
        raise ValueError("additional refinement budget must be nonnegative")
    report = run(args)
    print(wave1.canonical({
        "status": report["status"],
        "root_variables": report["root_variables"],
        "root_clauses": report["root_clauses"],
        "wave1_cuts": report["wave1_cut_count"],
        "total_cuts": report["refinement_count"],
        "additional_cuts": report["refinement_count"] - WAVE1_CUT_COUNT,
        "one_form_cuts": report["one_form_cuts"],
        "two_form_cuts": report["two_form_cuts"],
        "solve_count": report["solve_count_this_invocation"],
        "wall_elapsed_seconds": report["wall_elapsed_seconds"],
    }).decode())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
