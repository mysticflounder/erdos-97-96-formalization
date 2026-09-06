#!/usr/bin/env python3
"""Run the exact-13 witnessed-Key guarded PIQD CEGAR wave 3.

The producer preserves the corrected wave-2 root and appends only the three
guarded global-intersection clause families.  Wave-2 projected incidence cuts
are imported and replayed against the old root before a fresh PIQD session is
started.  This remains solver-only discovery evidence; it is not a Lean
closure or promotion claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import time
from pathlib import Path

import cardge13_exact13_witnessed_key_cegar_wave1_piqd as wave1
import cardge13_exact13_witnessed_key_root_piqd as root
import check_exact13_guarded_boundary as boundary

LANE = "exact13-witnessed-key-guarded-cegar-wave3-20260906"
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
WAVE2_RUN = Path("scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/run-0001")
WAVE1_PRODUCER = Path(wave1.__file__)
STRONG_SOURCE = Path(
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "CardGeThirteenExact13StrongSourceCoverage.lean"
)
WAVE2_ROOT_SHA256 = "22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a"
WAVE2_BANK_SHA256 = "f5145fb2af3725486b29690fb7015c2723fbeca8d47262b6730bad739e141af5"
WAVE2_CUT_COUNT = 6000
WAVE2_MODEL_COUNT = 6001
GUARDED_BOUNDARY_COMMIT = "068d26ee03486b9f30160a6c6d0a42ab9ba7e6e0"
EXPECTED_GUARDED_COUNT = 1815
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 31283
EXPECTED_ELIMINATED_MODELS = 4432
EXPECTED_RETAINED_MODELS = 1569
EXPECTED_IMPORTED_ELIMINATED_MODELS = 4431
EXPECTED_IMPORTED_RETAINED_MODELS = 1569

SCHEMA = "cardge13-exact13-witnessed-key-guarded-cegar-wave3-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-witnessed-key-effective-root-wave3/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state-wave3/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody-wave3/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration-wave3/v1"
NO_EXACT_KEY_ENUMERATION_BLOCKS = True
NO_EXISTENTIAL_WITNESS_CUT_VARIABLES = True


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def seal(value: dict[str, object]) -> dict[str, object]:
    result = dict(value)
    result.pop("event_sha256", None)
    result["event_sha256"] = sha256(canonical(result))
    return result


def reseal(value: dict[str, object]) -> dict[str, object]:
    return wave1.seal({key: item for key, item in value.items() if key != "event_sha256"})


def _write_once(path: Path, data: bytes) -> None:
    if path.exists():
        if path.read_bytes() != data:
            raise wave1.AuditError(f"write-once artifact drifted: {path}")
        return
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(data)


def guarded_clauses(cnf: root.Cnf, *, nontrivial: bool = True) -> list[tuple[int, ...]]:
    """Return exactly the active b0/b1 guarded K,L,T intersection clauses."""
    clauses: list[tuple[int, ...]] = []
    for center in root.GLOBAL_CENTERS:
        guard = (cnf.names[f"is_b0_{center}"], cnf.names[f"is_b1_{center}"])
        for apex, row in ((0, "K"), (0, "L"), (1, "T")):
            for left in root.LABELS:
                for right in root.LABELS:
                    if left >= right:
                        continue
                    if nontrivial and (apex in (left, right) or center in (left, right)):
                        continue
                    clauses.append(
                        (*guard,
                         -cnf.names[f"m_G{center}_{apex}"],
                         -cnf.names[f"m_G{center}_{left}"],
                         -cnf.names[f"m_G{center}_{right}"],
                         -cnf.names[f"m_{row}_{left}"],
                         -cnf.names[f"m_{row}_{right}"],)
                    )
    return clauses


def _current_root() -> tuple[root.Cnf, dict[str, object], bytes]:
    cnf, projection = root.emit_root()
    old_path = WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    old_bytes = old_path.read_bytes()
    if sha256(old_bytes) != WAVE2_ROOT_SHA256:
        raise wave1.AuditError("wave2 effective root digest drifted")
    old_body = b"\n".join(line for line in old_bytes.splitlines() if not line.startswith(b"c ")) + b"\n"
    if old_body != cnf.dimacs():
        raise wave1.AuditError("wave2 root clauses differ from regenerated corrected root")
    return cnf, projection, old_bytes


def guarded_initial_root(
    run_root: Path, source: Path, producer_commit: str
) -> tuple[root.Cnf, dict[str, object], dict[str, object]]:
    cnf, projection, old_bytes = _current_root()
    clauses = guarded_clauses(cnf)
    if len(clauses) != EXPECTED_GUARDED_COUNT:
        raise wave1.AuditError("guarded schema count drifted")
    old_count = len(cnf.clauses)
    for clause in clauses:
        cnf.add(*clause)
    if len(cnf.names) != EXPECTED_ROOT_VARIABLES or len(cnf.clauses) != EXPECTED_ROOT_CLAUSES:
        raise wave1.AuditError("guarded root dimensions drifted")
    imported = run_root / "artifacts/imported-wave2-effective-root.cnf"
    _write_once(imported, old_bytes)
    emitted = cnf.dimacs((ROOT_SCHEMA, f"producer={Path(__file__).name}", f"producer_commit={producer_commit}"))
    artifact = run_root / "artifacts/exact13-witnessed-key-effective-root.cnf"
    _write_once(artifact, emitted)
    map_path = run_root / "artifacts/exact13-witnessed-key-effective-root.map.json"
    _write_once(map_path, canonical({
        "schema": ROOT_SCHEMA,
        "variables": len(cnf.names),
        "old_corrected_root_clauses": old_count,
        "guarded_clause_count": len(clauses),
        "clauses": len(cnf.clauses),
        "projection": projection,
        "guarded_clause_families": ["G_c/K/apex0", "G_c/L/apex0", "G_c/T/apex1"],
        "new_variables": 0,
    }) + b"\n")
    normalized, normalization = root.normalize_for_piqd_session(emitted)
    report = seal({
        "schema": ROOT_SCHEMA,
        "producer_commit": producer_commit,
        "source_path": str(source),
        "source_sha256": sha256(source.read_bytes()),
        "strong_source_coverage_sha256": sha256(STRONG_SOURCE.read_bytes()),
        "inherited_root_sha256": WAVE2_ROOT_SHA256,
        "inherited_root": str(imported),
        "inherited_clause_count": old_count,
        "root_static_corrections_preserved": True,
        "guarded_clause_count": len(clauses),
        "guarded_clause_count_nontrivial": len(guarded_clauses(cnf)),
        "new_variables": 0,
        "cnf": str(artifact),
        "cnf_bytes": len(emitted),
        "emitted_cnf_bytes": len(emitted),
        "emitted_cnf_sha256": sha256(emitted),
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
    return cnf, projection, {**report, "cnf_bytes": emitted}


def source_bindings(source: Path) -> dict[str, str]:
    paths = (source, STRONG_SOURCE, Path(__file__), Path(root.__file__), WAVE1_PRODUCER,
             Path(wave1.paths.__file__), Path(wave1.pairs.__file__),
             Path(wave1.legacy.__file__), Path(boundary.__file__),
             Path("scripts/cardge13_exact13_witnessed_key_cegar_wave2_piqd.py"))
    relative = set()
    for path in paths:
        resolved = path.resolve()
        relative.add(str(resolved.relative_to(Path.cwd())))
    return {path: sha256(Path(path).read_bytes()) for path in sorted(relative)}


def checker_commit_available() -> bool:
    result = subprocess.run(["git", "cat-file", "-e", GUARDED_BOUNDARY_COMMIT + "^{commit}"],
                            capture_output=True, check=False)
    return result.returncode == 0


def import_wave2_frontier(
    run_root: Path, checker_report: dict[str, object] | None = None
) -> dict[str, object]:
    source_root = WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    source_bank = WAVE2_RUN / "events/cut-bank.jsonl"
    if sha256(source_root.read_bytes()) != WAVE2_ROOT_SHA256:
        raise wave1.AuditError("wave2 root import digest drifted")
    if sha256(source_bank.read_bytes()) != WAVE2_BANK_SHA256:
        raise wave1.AuditError("wave2 cut bank digest drifted")
    records = wave1.load_bank(source_bank)
    if len(records) != WAVE2_CUT_COUNT:
        raise wave1.AuditError("wave2 cut bank is not exactly 6,000 records")
    _write_once(run_root / "artifacts/immutable-imported-wave2-cut-bank.jsonl", source_bank.read_bytes())
    bank_rows: list[dict[str, object]] = []
    old_cnf, projection = root.emit_root()
    checked = 0
    imported_guarded_violations = 0
    imported_guarded_survivors = 0
    for index, record in enumerate(records):
        cert_source = Path(str(record["certificate"]))
        cert = json.loads(cert_source.read_text())
        model_source = Path(str(cert["parent_model"]))
        model = json.loads(model_source.read_text())
        raw_source = Path(str(model["raw_solve"]))
        raw_destination = run_root / "events/piqd" / f"imported-{index:04d}.json"
        _write_once(raw_destination, raw_source.read_bytes())
        model_destination = run_root / "events/models" / f"imported-{index:04d}.json"
        model_value = dict(model)
        model_value.pop("event_sha256", None)
        model_value.update({"raw_solve": str(raw_destination), "root_emitted_sha256": WAVE2_ROOT_SHA256})
        _write_once(model_destination, canonical(seal(model_value)) + b"\n")
        cert_destination = run_root / "events/cuts" / f"imported-{index:04d}.json"
        cert_value = dict(cert)
        cert_value.pop("event_sha256", None)
        cert_value.update({"parent_model": str(model_destination),
                           "parent_model_sha256": sha256(model_destination.read_bytes())})
        _write_once(cert_destination, canonical(seal(cert_value)) + b"\n")
        assignment = root.parse_assignment(json.loads(raw_destination.read_text())["model"])
        key = root.key_from_assignment(assignment, projection)
        if not old_cnf.satisfied(assignment) or root.replay_assignment(assignment, key, projection)["Valid"] is not True:
            raise wave1.AuditError(f"wave2 parent model {index} fails old Key.Valid replay")
        if boundary.guarded_violations(key):
            imported_guarded_violations += 1
        else:
            imported_guarded_survivors += 1
        conflict = cert_value.get("conflict")
        if not isinstance(conflict, dict):
            raise wave1.AuditError(f"wave2 cut {index} has no conflict")
        literals, admission = wave1.admitted_cut(conflict, wave1.key_cell(key),
                                                 root.ORDERS[int(key["orientation"] == "mirror")],
                                                 assignment, old_cnf)
        if list(literals) != record["clause"] or admission["atoms"] != record["atoms"]:
            raise wave1.AuditError(f"wave2 cut {index} failed independent clause replay")
        bank_rows.append({"index": index, "kind": record["kind"], "atoms": record["atoms"],
                          "clause": record["clause"], "certificate": str(cert_destination),
                          "certificate_sha256": sha256(cert_destination.read_bytes())})
        checked += 1
    bank_path = run_root / "events/cut-bank.jsonl"
    imported_bytes = b"".join(canonical(row) + b"\n" for row in bank_rows)
    if bank_path.exists():
        existing = wave1.load_bank(bank_path)
        if len(existing) < WAVE2_CUT_COUNT or existing[:WAVE2_CUT_COUNT] != bank_rows:
            raise wave1.AuditError("existing final bank does not preserve imported wave2 rows")
    else:
        _write_once(bank_path, imported_bytes)
    if len(bank_rows) != WAVE2_CUT_COUNT:
        raise wave1.AuditError("imported wave2 bank count drifted")
    if checker_report is None:
        checker_report = boundary.replay_run(WAVE2_RUN)
    if (imported_guarded_violations, imported_guarded_survivors) != (
        EXPECTED_IMPORTED_ELIMINATED_MODELS, EXPECTED_IMPORTED_RETAINED_MODELS
    ):
        raise wave1.AuditError("imported-parent guarded partition drifted")
    if (checker_report["guarded_violation_model_count"], checker_report["guarded_survivor_count"]) != (EXPECTED_ELIMINATED_MODELS, EXPECTED_RETAINED_MODELS):
        raise wave1.AuditError("guarded-boundary retained-model partition drifted")
    wave1.atomic_json(run_root / "events/guarded-boundary-report.json", seal({
        **checker_report,
        "checker_commit": GUARDED_BOUNDARY_COMMIT,
        "checker_commit_available": checker_commit_available(),
        "source_bank_sha256": WAVE2_BANK_SHA256,
        "source_root_sha256": WAVE2_ROOT_SHA256,
    }))
    replay = seal({"schema": MIGRATION_SCHEMA, "source_bank_sha256": WAVE2_BANK_SHA256,
                   "imported_bank": str(
                       run_root / "artifacts/immutable-imported-wave2-cut-bank.jsonl"
                   ),
                   "imported_bank_sha256": sha256(
                       (run_root / "artifacts/immutable-imported-wave2-cut-bank.jsonl").read_bytes()
                   ),
                   "final_bank": str(bank_path),
                   "final_bank_sha256": sha256(bank_path.read_bytes()),
                   "revalidated_cut_count": checked,
                   "all_projected_provider_atoms": True,
                   "no_witness_atoms": True,
                   "all_old_root_and_key_valid_replays_pass": True,
                   "imported_guarded_violation_count": imported_guarded_violations,
                   "imported_guarded_survivor_count": imported_guarded_survivors,
                   "imported_partition_matches_expected": (
                       imported_guarded_violations == EXPECTED_IMPORTED_ELIMINATED_MODELS
                       and imported_guarded_survivors == EXPECTED_IMPORTED_RETAINED_MODELS
                   ),
                   "all_clause_semantics_replayed": True})
    wave1.atomic_json(run_root / "events/wave2-import-replay.json", replay)
    return {"source_root_sha256": WAVE2_ROOT_SHA256, "source_bank_sha256": WAVE2_BANK_SHA256,
            "imported_root": str(run_root / "artifacts/imported-wave2-effective-root.cnf"),
            "imported_bank": str(run_root / "artifacts/immutable-imported-wave2-cut-bank.jsonl"),
            "imported_bank_sha256": sha256(
                (run_root / "artifacts/immutable-imported-wave2-cut-bank.jsonl").read_bytes()
            ),
            "final_bank": str(bank_path),
            "final_bank_sha256": sha256(bank_path.read_bytes()),
            "imported_cut_count": checked, "revalidated_cut_count": checked,
            "imported_guarded_violation_count": imported_guarded_violations,
            "imported_guarded_survivor_count": imported_guarded_survivors,
            "guarded_boundary_report": checker_report,
            "checker_commit": GUARDED_BOUNDARY_COMMIT,
            "checker_commit_available": checker_commit_available()}


def independent_imported_parent_partition() -> dict[str, int]:
    """Recompute the 6,000-parent guarded partition without importing files."""
    cnf, projection = root.emit_root()
    violations = survivors = 0
    model_paths = sorted(
        (WAVE2_RUN / "events/models").glob("*.json"),
        key=lambda path: int(path.stem.split("-")[-1]),
    )
    model_paths = [
        path for path in model_paths if int(path.stem.split("-")[-1]) < WAVE2_CUT_COUNT
    ]
    if len(model_paths) != WAVE2_CUT_COUNT:
        raise wave1.AuditError("wave2 imported-parent model set is incomplete")
    for path in model_paths:
        model = json.loads(path.read_text())
        solved = json.loads(Path(str(model["raw_solve"])).read_text())
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        if not cnf.satisfied(assignment) or root.replay_assignment(assignment, key, projection)["Valid"] is not True:
            raise wave1.AuditError(f"imported parent fails Key.Valid replay: {path}")
        if boundary.guarded_violations(key):
            violations += 1
        else:
            survivors += 1
    return {"imported_guarded_violation_count": violations,
            "imported_guarded_survivor_count": survivors}


def update_run_manifest(run_root: Path, source: Path, producer_commit: str) -> None:
    path = run_root / "run_manifest.json"
    if path.exists():
        value = json.loads(path.read_text())
    else:
        value = {"schema": "worktree-run-manifest/v1", "lane_id": LANE, "run_id": "run-0001",
                 "root": str(run_root), "owner": LANE, "base_head": producer_commit,
                 "output_classes": ["artifacts", "events", "tmp"],
                 "input_digests": {str(WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"): WAVE2_ROOT_SHA256,
                                   str(WAVE2_RUN / "events/cut-bank.jsonl"): WAVE2_BANK_SHA256},
                 "created_utc": time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())}
    value["source_digests"] = source_bindings(source)
    value["manifest_sha256"] = sha256(canonical({k: v for k, v in value.items() if k != "manifest_sha256"}))
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(canonical(value) + b"\n")


def verify_new_models(
    run_root: Path, cnf: root.Cnf, projection: dict[str, object], root_sha256: str
) -> dict[str, object]:
    """Replay every wave-3 SAT model against guarded root and StrongValid."""
    model_dir = run_root / "events/models"
    paths = [model_dir / f"model-{index:04d}.json" for index in range(WAVE2_CUT_COUNT, 16001)]
    if len(paths) != 10001 or any(not path.exists() for path in paths):
        raise wave1.AuditError("new wave3 model certificate set is incomplete")
    for index, model_path in enumerate(paths, start=WAVE2_CUT_COUNT):
        model = json.loads(model_path.read_text())
        raw_path = Path(str(model["raw_solve"]))
        solved = json.loads(raw_path.read_text())
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if model.get("root_emitted_sha256") != root_sha256:
            raise wave1.AuditError(f"new model {index} has the wrong guarded root binding")
        if not cnf.satisfied(assignment) or checks.get("Valid") is not True:
            raise wave1.AuditError(f"new model {index} fails guarded Key.Valid replay")
        if boundary.guarded_violations(key):
            raise wave1.AuditError(f"new model {index} fails guarded StrongValid replay")
    return {"schema": "cardge13-exact13-witnessed-key-guarded-model-replay/v1",
            "new_model_count": len(paths), "guarded_root_replays": len(paths),
            "key_valid_replays": len(paths),
            "strong_valid_replays": len(paths), "all_new_models_pass": True,
            "historical_imported_parents_excluded": True}


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


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.producer_commit != "cfd6eed3abd136093d6fa6d7c912b02bdbfa5671":
        raise wave1.AuditError("wave3 must run from authenticated pushed HEAD cfd6eed3a")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    update_run_manifest(RUN_ROOT, args.source, args.producer_commit)
    boundary_report = boundary.replay_run(WAVE2_RUN)
    configure_delegate()
    import_report = import_wave2_frontier(RUN_ROOT, boundary_report)
    _cnf, _projection, root_report = guarded_initial_root(RUN_ROOT, args.source, args.producer_commit)
    if root_report["clauses"] != EXPECTED_ROOT_CLAUSES:
        raise wave1.AuditError("guarded root clause count is not 31,283")
    state = seal({"schema": STATE_SCHEMA, "status": "IMPORTED_WAVE2_FRONTIER",
                  "sessions": [], "active_session": None, "refinement_count": WAVE2_CUT_COUNT,
                  "source_bindings": source_bindings(args.source),
                  "root_emitted_sha256": root_report["emitted_cnf_sha256"],
                  "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
                  "guarded_boundary_report": boundary_report})
    wave1.atomic_json(RUN_ROOT / "events/state.json", state)
    args.run_root = RUN_ROOT
    args.max_refinements = WAVE2_CUT_COUNT + args.additional_refinements
    args.finalize_retained_budget = False
    report = wave1.run(args)
    _guarded_cnf, guarded_projection = root.emit_root()
    for clause in guarded_clauses(_guarded_cnf):
        _guarded_cnf.add(*clause)
    new_model_replay = verify_new_models(
        RUN_ROOT, _guarded_cnf, guarded_projection, str(report["root_emitted_sha256"])
    )
    wave1.atomic_json(RUN_ROOT / "events/new-model-strongvalid-replay.json",
                     seal(new_model_replay))
    report.update({"wave2_import": import_report, "wave2_cut_count": WAVE2_CUT_COUNT,
                   "additional_refinement_budget": args.additional_refinements,
                   "guarded_boundary_report": boundary_report,
                   "guarded_clause_count": EXPECTED_GUARDED_COUNT,
                   "guarded_model_elimination_count": EXPECTED_ELIMINATED_MODELS,
                   "guarded_model_survivor_count": EXPECTED_RETAINED_MODELS,
                   "new_model_strongvalid_replay": new_model_replay,
                   "claim_boundary": "solver-only formula-scoped discovery; no Lean theorem or promoted UNSAT claim",
                   "no_exact_key_enumeration_blocks": NO_EXACT_KEY_ENUMERATION_BLOCKS,
                   "no_existential_witness_cut_variables": NO_EXISTENTIAL_WITNESS_CUT_VARIABLES})
    wave1.atomic_json(RUN_ROOT / "events/run.json", reseal(report))
    return report


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=wave1.DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=wave1.DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=wave1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=10000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0)
    return parser.parse_args()


if __name__ == "__main__":
    result = run(parse_args())
    print(canonical({key: result.get(key) for key in ("status", "root_variables", "root_clauses",
        "wave2_cut_count", "refinement_count", "one_form_cuts", "two_form_cuts",
        "solve_count_this_invocation", "wall_elapsed_seconds")}).decode())
