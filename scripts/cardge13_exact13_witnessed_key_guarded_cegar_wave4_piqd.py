#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Continue exact13 guarded witnessed-Key CEGAR in a fresh PIQD session.

Wave3's guarded root and final 16,000-cut bank are immutable inputs.  This
launcher independently replays every imported path, zero projection, atom
set, and clause, records the historical parent partition without rewriting it
as StrongValid, then delegates the bounded SAT loop to the audited wave1
session machinery.  The result is formula-scoped discovery evidence only.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path

import cardge13_exact13_witnessed_key_cegar_wave1_piqd as wave1
import cardge13_exact13_witnessed_key_guarded_cegar_wave3_piqd as wave3
import cardge13_exact13_witnessed_key_root_piqd as root
import check_exact13_guarded_boundary as boundary

LANE = "exact13-witnessed-key-guarded-cegar-wave4-20260906"
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
WAVE3_RUN = Path("scratch/runs/exact13-witnessed-key-guarded-cegar-wave3-20260906/run-0001")
WAVE2_RUN = Path("scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/run-0001")
WAVE1_SCRIPT = Path("scripts/cardge13_exact13_witnessed_key_cegar_wave1_piqd.py")
STRONG_SOURCE = Path(
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "CardGeThirteenExact13StrongSourceCoverage.lean"
)
WAVE3_ROOT_SHA256 = "238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f"
WAVE3_BANK_SHA256 = "2320eefd2a89c5738d437620989bdbeaf0de8e19177c8e5b1cb8fd5117f97c7b"
WAVE2_ROOT_SHA256 = "22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a"
IMPORTED_CUT_COUNT = 16_000
WAVE2_CUT_COUNT = 6_000
WAVE3_CUT_COUNT = 10_000
EXPECTED_GUARDED_COUNT = 1_815
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 31_283
EXPECTED_WAVE2_OUTSIDE_STRONGVALID = 4_431
EXPECTED_WAVE2_STRONGVALID = 1_569
EXPECTED_WAVE3_STRONGVALID = 10_000
BASE_HEAD = "282a1be8ef87359ad671ecd5afd0ecd8e38a35fd"

SCHEMA = "cardge13-exact13-witnessed-key-guarded-cegar-wave4-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-witnessed-key-effective-root-wave4/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state-wave4/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody-wave4/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration-wave4/v1"
NO_EXACT_KEY_ENUMERATION_BLOCKS = True
NO_EXISTENTIAL_WITNESS_CUT_VARIABLES = True


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def seal(value: dict[str, object]) -> dict[str, object]:
    unsigned = {key: item for key, item in value.items() if key != "event_sha256"}
    return {**unsigned, "event_sha256": sha256(canonical(unsigned))}


def reseal(value: dict[str, object]) -> dict[str, object]:
    return seal(value)


def write_once(path: Path, payload: bytes) -> None:
    if path.exists():
        if path.read_bytes() != payload:
            raise wave1.AuditError(f"immutable artifact drift: {path}")
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)


def _without_comments(payload: bytes) -> bytes:
    return b"\n".join(line for line in payload.splitlines() if not line.startswith(b"c ")) + b"\n"


def guarded_cnf() -> tuple[root.Cnf, dict[str, object]]:
    cnf, projection = root.emit_root()
    clauses = wave3.guarded_clauses(cnf)
    if len(clauses) != EXPECTED_GUARDED_COUNT:
        raise wave1.AuditError("guarded clause count drifted")
    for clause in clauses:
        cnf.add(*clause)
    if len(cnf.names) != EXPECTED_ROOT_VARIABLES or len(cnf.clauses) != EXPECTED_ROOT_CLAUSES:
        raise wave1.AuditError("guarded root dimensions drifted")
    return cnf, projection


def guarded_initial_root(
    run_root: Path, source: Path, producer_commit: str
) -> tuple[root.Cnf, dict[str, object], dict[str, object]]:
    cnf, projection = guarded_cnf()
    source_root = WAVE3_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    root_bytes = source_root.read_bytes()
    if sha256(root_bytes) != WAVE3_ROOT_SHA256:
        raise wave1.AuditError("wave3 guarded root digest drifted")
    if _without_comments(root_bytes) != cnf.dimacs():
        raise wave1.AuditError("wave3 guarded root clauses differ from regenerated root")
    imported = run_root / "artifacts/imported-wave3-guarded-root.cnf"
    artifact = run_root / "artifacts/exact13-witnessed-key-effective-root.cnf"
    write_once(imported, root_bytes)
    write_once(artifact, root_bytes)
    if imported != artifact and imported.read_bytes() != artifact.read_bytes():
        raise wave1.AuditError("wave3 root import is not exact")
    normalized, normalization = root.normalize_for_piqd_session(root_bytes)
    map_path = run_root / "artifacts/exact13-witnessed-key-effective-root.map.json"
    write_once(map_path, canonical({
        "schema": ROOT_SCHEMA,
        "variables": len(cnf.names),
        "clauses": len(cnf.clauses),
        "guarded_clause_count": EXPECTED_GUARDED_COUNT,
        "imported_wave3_root_sha256": WAVE3_ROOT_SHA256,
        "new_variables": 0,
        "projection": projection,
        "root_is_wave3_byte_identity": True,
    }) + b"\n")
    report = seal({
        "schema": ROOT_SCHEMA,
        "producer_commit": producer_commit,
        "source_path": str(source),
        "source_sha256": sha256(source.read_bytes()),
        "strong_source_coverage_sha256": sha256(STRONG_SOURCE.read_bytes()),
        "inherited_wave3_root": str(imported),
        "inherited_root_sha256": WAVE3_ROOT_SHA256,
        "inherited_clause_count": EXPECTED_ROOT_CLAUSES,
        "root_static_corrections_preserved": True,
        "guarded_clause_count": EXPECTED_GUARDED_COUNT,
        "new_variables": 0,
        "cnf": str(artifact),
        "cnf_bytes": len(root_bytes),
        "emitted_cnf_bytes": len(root_bytes),
        "emitted_cnf_sha256": WAVE3_ROOT_SHA256,
        "piqd_normalized_journal_bytes": len(normalized),
        "piqd_normalized_journal_sha256": sha256(normalized),
        "normalization": normalization,
        "normalization_relation_verified": True,
        "map": str(map_path),
        "map_sha256": sha256(map_path.read_bytes()),
        "variables": len(cnf.names),
        "clauses": len(cnf.clauses),
        "exact_key_valid_root": True,
        "only_mandatory_guarded_clauses_appended": True,
        "no_metric_or_learned_conflicts": True,
    })
    wave1.atomic_json(run_root / "events/effective-root.json", report)
    return cnf, projection, {**report, "cnf_bytes": root_bytes}


def _source_path(raw: object, source_root: Path, label: str) -> Path:
    path = Path(str(raw))
    resolved = (Path.cwd() / path).resolve() if not path.is_absolute() else path.resolve()
    if not resolved.is_relative_to(source_root.resolve()):
        raise wave1.AuditError(f"{label} escapes immutable wave3 run root: {path}")
    return resolved


def source_bindings(source: Path) -> dict[str, str]:
    paths = (
        source, STRONG_SOURCE, Path(__file__), Path(wave3.__file__), Path(root.__file__),
        WAVE1_SCRIPT, Path(wave1.paths.__file__), Path(wave1.pairs.__file__),
        Path(wave1.legacy.__file__), Path(boundary.__file__),
        Path("scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py"),
    )
    relative = {str(path.resolve().relative_to(Path.cwd())) for path in paths}
    return {path: sha256(Path(path).read_bytes()) for path in sorted(relative)}


def update_run_manifest(run_root: Path, source: Path) -> None:
    path = run_root / "run_manifest.json"
    value = json.loads(path.read_text()) if path.exists() else {
        "schema": "worktree-run-manifest/v1",
        "lane_id": LANE,
        "run_id": "run-0001",
        "root": str(run_root),
        "owner": LANE,
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "input_digests": {
            str(WAVE3_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"): WAVE3_ROOT_SHA256,
            str(WAVE3_RUN / "events/cut-bank.jsonl"): WAVE3_BANK_SHA256,
        },
    }
    if value.get("base_head") != BASE_HEAD:
        raise wave1.AuditError("run manifest base_head is not the resolved pushed HEAD")
    value.setdefault("created_utc", time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime()))
    value["source_digests"] = source_bindings(source)
    value["manifest_sha256"] = sha256(canonical({k: v for k, v in value.items() if k != "manifest_sha256"}))
    run_root.mkdir(parents=True, exist_ok=True)
    path.write_bytes(canonical(value) + b"\n")


def import_wave3_frontier(run_root: Path, cnf: root.Cnf, projection: dict[str, object]) -> dict[str, object]:
    source_root = WAVE3_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    source_bank = WAVE3_RUN / "events/cut-bank.jsonl"
    if sha256(source_root.read_bytes()) != WAVE3_ROOT_SHA256:
        raise wave1.AuditError("immutable wave3 root hash mismatch")
    if sha256(source_bank.read_bytes()) != WAVE3_BANK_SHA256:
        raise wave1.AuditError("immutable wave3 bank hash mismatch")
    records = wave1.load_bank(source_bank)
    if len(records) != IMPORTED_CUT_COUNT:
        raise wave1.AuditError("wave3 bank is not exactly 16,000 cuts")
    immutable_bank = run_root / "artifacts/immutable-imported-wave3-final-bank.jsonl"
    write_once(immutable_bank, source_bank.read_bytes())
    source_root_resolved = WAVE3_RUN.resolve()
    historical_cnf, _historical_projection = root.emit_root()
    if len(historical_cnf.clauses) != 29_468:
        raise wave1.AuditError("historical wave2 root dimensions drifted")
    historical_root = WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    if sha256(historical_root.read_bytes()) != WAVE2_ROOT_SHA256:
        raise wave1.AuditError("historical wave2 parent root hash drifted")
    if _without_comments(historical_root.read_bytes()) != historical_cnf.dimacs():
        raise wave1.AuditError("historical wave2 parent root clauses drifted")
    final_rows: list[dict[str, object]] = []
    outside_wave2 = strong_wave2 = strong_wave3 = zero_checks = 0
    for index, record in enumerate(records):
        if record.get("index") != index:
            raise wave1.AuditError(f"wave3 cut index drifted at {index}")
        cert_source = _source_path(record.get("certificate"), source_root_resolved, f"cut {index}")
        if sha256(cert_source.read_bytes()) != record.get("certificate_sha256"):
            raise wave1.AuditError(f"wave3 cut {index} certificate hash mismatch")
        cert = json.loads(cert_source.read_text())
        wave1._verify_seal(cert, f"wave3 cut {index}")
        if cert.get("index") != index:
            raise wave1.AuditError(f"wave3 certificate index drifted at {index}")
        model_source = _source_path(cert.get("parent_model"), source_root_resolved, f"cut {index} parent")
        if sha256(model_source.read_bytes()) != cert.get("parent_model_sha256"):
            raise wave1.AuditError(f"wave3 cut {index} parent-model hash mismatch")
        model = json.loads(model_source.read_text())
        wave1._verify_seal(model, f"wave3 model {index}")
        raw_source = _source_path(model.get("raw_solve"), source_root_resolved, f"model {index} raw solve")
        if sha256(raw_source.read_bytes()) != model.get("raw_solve_sha256"):
            raise wave1.AuditError(f"wave3 model {index} raw-solve hash mismatch")
        solved = json.loads(raw_source.read_text())
        if solved.get("status") != "SAT":
            raise wave1.AuditError(f"wave3 model {index} is not SAT")
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        parent_cnf = historical_cnf if index < WAVE2_CUT_COUNT else cnf
        if not parent_cnf.satisfied(assignment) or checks.get("Valid") is not True:
            raise wave1.AuditError(f"wave3 parent {index} fails its historical root or Key.Valid")
        violations = boundary.guarded_violations(key)
        if index < WAVE2_CUT_COUNT:
            if violations:
                outside_wave2 += 1
            else:
                strong_wave2 += 1
        else:
            if violations:
                raise wave1.AuditError(f"wave3 cut parent {index} is not StrongValid")
            strong_wave3 += 1
        conflict = cert.get("conflict")
        if not isinstance(conflict, dict):
            raise wave1.AuditError(f"wave3 cut {index} conflict is malformed")
        cell = wave1.key_cell(key)
        order = root.ORDERS[int(key["orientation"] == "mirror")]
        literals, admission = wave1.admitted_cut(conflict, cell, order, assignment, cnf)
        if list(literals) != record.get("clause") or admission.get("atoms") != record.get("atoms"):
            raise wave1.AuditError(f"wave3 cut {index} failed clause/atom reconstruction")
        if admission["semantic_replay"].get("zero_projected_sum_replayed") is not True:
            raise wave1.AuditError(f"wave3 cut {index} zero projection was not replayed")
        zero_checks += 1
        raw_destination = run_root / "events/piqd" / f"imported-{index:04d}.json"
        write_once(raw_destination, raw_source.read_bytes())
        model_value = {key_: item for key_, item in model.items() if key_ != "event_sha256"}
        model_value.update({
            "raw_solve": str(raw_destination),
            "raw_solve_sha256": sha256(raw_destination.read_bytes()),
            "historical_parent_root_emitted_sha256": model.get("root_emitted_sha256"),
            "root_emitted_sha256": WAVE3_ROOT_SHA256,
            "historical_parent_model": str(model_source),
        })
        model_destination = run_root / "events/models" / f"imported-{index:04d}.json"
        write_once(model_destination, canonical(seal(model_value)) + b"\n")
        cert_value = {key_: item for key_, item in cert.items() if key_ != "event_sha256"}
        cert_value.update({
            "parent_model": str(model_destination),
            "parent_model_sha256": sha256(model_destination.read_bytes()),
            "historical_parent_model": str(model_source),
        })
        cert_destination = run_root / "events/cuts" / f"imported-{index:04d}.json"
        write_once(cert_destination, canonical(seal(cert_value)) + b"\n")
        final_rows.append({
            "index": index,
            "kind": record["kind"],
            "atoms": record["atoms"],
            "clause": record["clause"],
            "certificate": str(cert_destination),
            "certificate_sha256": sha256(cert_destination.read_bytes()),
        })
    final_bank = run_root / "events/cut-bank.jsonl"
    final_bytes = b"".join(canonical(row) + b"\n" for row in final_rows)
    write_once(final_bank, final_bytes)
    if (outside_wave2, strong_wave2, strong_wave3, zero_checks) != (
        EXPECTED_WAVE2_OUTSIDE_STRONGVALID, EXPECTED_WAVE2_STRONGVALID,
        EXPECTED_WAVE3_STRONGVALID, IMPORTED_CUT_COUNT,
    ):
        raise wave1.AuditError("historical StrongValid parent partition drifted")
    report = seal({
        "schema": MIGRATION_SCHEMA,
        "source_root": str(source_root),
        "source_root_sha256": WAVE3_ROOT_SHA256,
        "historical_wave2_parent_root_sha256": WAVE2_ROOT_SHA256,
        "historical_wave2_parent_root": str(historical_root),
        "imported_root": str(run_root / "artifacts/imported-wave3-guarded-root.cnf"),
        "imported_root_sha256": sha256((run_root / "artifacts/imported-wave3-guarded-root.cnf").read_bytes()),
        "immutable_imported_bank": str(immutable_bank),
        "immutable_imported_bank_sha256": sha256(immutable_bank.read_bytes()),
        "final_live_bank": str(final_bank),
        "final_live_bank_sha256": sha256(final_bank.read_bytes()),
        "imported_cut_count": IMPORTED_CUT_COUNT,
        "revalidated_cut_count": zero_checks,
        "all_paths_resolved_under_immutable_wave3_root": True,
        "all_zero_projections_replayed": True,
        "all_atoms_and_clauses_reconstructed": True,
        "first_6000_parent_partition": {
            "outside_StrongValid": outside_wave2,
            "StrongValid": strong_wave2,
        },
        "last_10000_cut_parent_partition": {"StrongValid": strong_wave3},
        "cut_soundness_scope": "universal incidence replay; old parent StrongValid is not an antecedent",
        "historical_parent_StrongValid_not_required_for_cut_soundness": True,
        "imported_immutable_and_live_bank_paths_distinct": immutable_bank.resolve() != final_bank.resolve(),
        "imported_immutable_and_live_bank_hashes_distinct": sha256(immutable_bank.read_bytes()) != sha256(final_bank.read_bytes()),
    })
    wave1.atomic_json(run_root / "events/wave3-import-replay.json", report)
    return report


def verify_new_models(run_root: Path, cnf: root.Cnf, projection: dict[str, object], root_sha256: str) -> dict[str, object]:
    paths = sorted(
        (path for path in (run_root / "events/models").glob("model-*.json")
         if int(path.stem.split("-")[-1]) >= IMPORTED_CUT_COUNT),
        key=lambda path: int(path.stem.split("-")[-1]),
    )
    for path in paths:
        model = json.loads(path.read_text())
        wave1._verify_seal(model, str(path))
        raw_path = Path(str(model["raw_solve"])).resolve()
        if not raw_path.is_relative_to(run_root.resolve()):
            raise wave1.AuditError(f"new model raw solve escapes wave4 run root: {raw_path}")
        solved = json.loads(raw_path.read_text())
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if model.get("root_emitted_sha256") != root_sha256:
            raise wave1.AuditError(f"new model root binding drifted: {path}")
        if not cnf.satisfied(assignment) or checks.get("Valid") is not True:
            raise wave1.AuditError(f"new model fails guarded root or Key.Valid: {path}")
        if boundary.guarded_violations(key):
            raise wave1.AuditError(f"new model fails GlobalOneBoundaryValid: {path}")
    result = {
        "schema": "cardge13-exact13-witnessed-key-guarded-model-replay-wave4/v1",
        "new_model_count": len(paths),
        "guarded_root_replays": len(paths),
        "key_valid_replays": len(paths),
        "global_one_boundary_valid_replays": len(paths),
        "strong_valid_replays": len(paths),
        "all_new_models_pass": True,
        "historical_imported_parents_excluded": True,
    }
    wave1.atomic_json(run_root / "events/new-model-strongvalid-replay.json", seal(result))
    return result


def finalize_terminal_artifacts(
    report: dict[str, object], root_report: dict[str, object],
    import_report: dict[str, object], source: Path,
) -> dict[str, object]:
    """Reseal post-session bindings after the live bank reaches terminal size."""
    final_bank = RUN_ROOT / "events/cut-bank.jsonl"
    final_hash = sha256(final_bank.read_bytes())
    import_report = dict(import_report)
    import_report["final_live_bank"] = str(final_bank)
    import_report["final_live_bank_sha256"] = final_hash
    import_report["final_live_bank_record_count"] = sum(1 for _line in final_bank.open())
    import_report["final_live_bank_hash_bound_after_session"] = True
    wave1.atomic_json(RUN_ROOT / "events/wave3-import-replay.json", seal(import_report))
    state = json.loads((RUN_ROOT / "events/state.json").read_text())
    custody_path = RUN_ROOT / "events/piqd-custody.json"
    custody = json.loads(custody_path.read_text())
    receipts_path = RUN_ROOT / "events/piqd-receipts.json"
    receipts = json.loads(receipts_path.read_text())
    wave1.atomic_json(receipts_path, seal(receipts))
    custody["receipt_sha256"] = sha256(receipts_path.read_bytes())
    close_receipt = state.get("last_session_closed")
    custody["session_closed"] = isinstance(close_receipt, dict) and close_receipt.get("state") == "closed"
    custody["close_receipt"] = close_receipt
    custody["close_receipt_sha256"] = sha256(canonical(close_receipt)) if close_receipt is not None else None
    wave1.atomic_json(custody_path, seal(custody))
    report = dict(report)
    report.update({
        "wave3_import": import_report,
        "final_live_bank_sha256": final_hash,
        "final_live_bank_record_count": import_report["final_live_bank_record_count"],
        "piqd_session_closed": custody["session_closed"],
        "piqd_close_receipt_sha256": custody["close_receipt_sha256"],
        "source_bindings": source_bindings(source),
        "root_report_sha256": sha256(canonical({k: v for k, v in root_report.items() if k != "cnf_bytes"})),
    })
    wave1.atomic_json(RUN_ROOT / "events/run.json", reseal(report))
    update_run_manifest(RUN_ROOT, source)
    return report


def finalize_existing_run(source: Path) -> dict[str, object]:
    """Repair post-session seals/bindings only; never invokes PIQD."""
    if not (RUN_ROOT / "events/run.json").exists():
        raise wave1.AuditError("completed wave4 run event is missing")
    return finalize_terminal_artifacts(
        json.loads((RUN_ROOT / "events/run.json").read_text()),
        json.loads((RUN_ROOT / "events/effective-root.json").read_text()),
        json.loads((RUN_ROOT / "events/wave3-import-replay.json").read_text()),
        source,
    )


def configure_delegate() -> None:
    wave1.SCHEMA = SCHEMA
    wave1.ROOT_REPAIR_SCHEMA = ROOT_SCHEMA
    wave1.MIGRATION_SCHEMA = MIGRATION_SCHEMA
    wave1.STATE_SCHEMA = STATE_SCHEMA
    wave1.CUSTODY_SCHEMA = CUSTODY_SCHEMA
    wave1.DEFAULT_RUN_ROOT = RUN_ROOT
    wave1.__file__ = str(Path(__file__).resolve())
    wave1.initial_root = guarded_initial_root
    wave1.source_bindings = source_bindings


def install_new_model_guard() -> None:
    original = root.replay_assignment

    def replay(assignment: set[int], key: dict[str, object], projection: dict[str, object]) -> dict[str, object]:
        result = original(assignment, key, projection)
        if result.get("Valid") is True and boundary.guarded_violations(key):
            raise wave1.AuditError("new SAT model is not GlobalOneBoundaryValid")
        return result

    root.replay_assignment = replay


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.producer_commit != BASE_HEAD:
        raise wave1.AuditError("wave4 must run from the authenticated pushed HEAD 282a1be8e")
    actual_head = subprocess.run(["git", "rev-parse", "HEAD"], capture_output=True, text=True, check=True).stdout.strip()
    if actual_head != BASE_HEAD:
        raise wave1.AuditError(f"resolved HEAD drifted: {actual_head}")
    if args.additional_refinements < 0:
        raise ValueError("additional refinement budget must be nonnegative")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    update_run_manifest(RUN_ROOT, args.source)
    configure_delegate()
    cnf, projection, root_report = guarded_initial_root(RUN_ROOT, args.source, args.producer_commit)
    import_report = import_wave3_frontier(RUN_ROOT, cnf, projection)
    args.run_root = RUN_ROOT
    args.max_refinements = IMPORTED_CUT_COUNT + args.additional_refinements
    args.finalize_retained_budget = False
    install_new_model_guard()
    report = wave1.run(args)
    new_models = verify_new_models(RUN_ROOT, cnf, projection, WAVE3_ROOT_SHA256)
    report.update({
        "wave3_import": import_report,
        "wave3_cut_count": WAVE3_CUT_COUNT,
        "wave2_cut_count": WAVE2_CUT_COUNT,
        "imported_cut_count": IMPORTED_CUT_COUNT,
        "additional_refinement_budget": args.additional_refinements,
        "guarded_clause_count": EXPECTED_GUARDED_COUNT,
        "guarded_model_parent_partition": import_report["first_6000_parent_partition"],
        "wave3_strongvalid_parent_count": import_report["last_10000_cut_parent_partition"]["StrongValid"],
        "new_model_strongvalid_replay": new_models,
        "wave_data_generalization_checkpoint": {
            "wave": 4,
            "reviewed_new_models": new_models["new_model_count"],
            "reviewed_new_cuts": max(0, int(report["refinement_count"]) - IMPORTED_CUT_COUNT),
            "candidate_general_theorem": None,
            "outcome": "no stable new theorem candidate; retain formula-scoped cut schema",
        },
        "claim_boundary": "solver-only formula-scoped discovery; no Lean theorem or promoted UNSAT claim",
        "no_exact_key_enumeration_blocks": NO_EXACT_KEY_ENUMERATION_BLOCKS,
        "no_existential_witness_cut_variables": NO_EXISTENTIAL_WITNESS_CUT_VARIABLES,
        "root_identity": {"variables": EXPECTED_ROOT_VARIABLES, "clauses": EXPECTED_ROOT_CLAUSES, "sha256": WAVE3_ROOT_SHA256},
    })
    return finalize_terminal_artifacts(report, root_report, import_report, args.source)


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=wave1.DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=wave1.DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=wave1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=20_000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0)
    parser.add_argument("--finalize-existing", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    arguments = parse_args()
    result = finalize_existing_run(arguments.source) if arguments.finalize_existing else run(arguments)
    print(canonical({key: result.get(key) for key in (
        "status", "root_variables", "root_clauses", "imported_cut_count",
        "refinement_count", "one_form_cuts", "two_form_cuts",
        "solve_count_this_invocation", "wall_elapsed_seconds",
    )}).decode())
