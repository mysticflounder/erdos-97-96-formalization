#!/usr/bin/env python3
"""Run the exact13 third-apex guarded CEGAR successor through PIQD only.

Wave7 imports the independently replayed Wave6 partial bank, reconstructs the
old guarded root, appends exactly the 550 source-entitled third-apex clauses,
and runs the audited PIQD loop on a fresh output namespace.  The new static
clauses use both blocker-row guards and introduce no variables.  All results
remain formula-scoped discovery evidence.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path

import cardge13_exact13_witnessed_key_guarded_cegar_wave6_piqd as wave6

LANE = "exact13-third-apex-guarded-cegar-wave7-20260906"
RUN_ROOT = Path("scratch/runs") / LANE / "run-0001"
BASE_HEAD = "427d96c66139235abc05ce12edbca3845c4d1b4e"
WAVE6_REPLAY_COMMIT = "31ffc3a38"
SOURCE = Path("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ThirdApexSourceCoverage.lean")
SOURCE_SHA256 = "45bc7b77df0d110237f79ccc27ba0458a45390129a7233ecead117cc5b98edce"
WAVE6_REPLAY_AUDIT = Path("docs/audits/2026-09-06-exact13-wave6-partial-replay.md")
WAVE6_REPLAY_RECEIPT = Path("scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/partial-replay-receipt.json")
WAVE6_RUN = Path("scratch/runs/exact13-witnessed-key-guarded-cegar-wave6-20260906/run-0001")
WAVE6_BANK = Path("scratch/runs/exact13-wave6-partial-replay-20260906/run-0001/artifacts/immutable-wave6-partial-bank.jsonl")
WAVE6_ROOT_SHA256 = "238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f"
WAVE6_BANK_SHA256 = "2f18fb2f8930767e641049286dbe40da7d6fb0b8543f20fc8abd519483c8b8c2"
WAVE6_RECEIPT_SHA256 = "328919a9ff0501621231094fd529b1ec4f15b6c3f75af7140549d2d5d12f3c11"
WAVE6_IMPORT_REPLAY_SHA256 = "3a01167ee3307cf7d6401e1144c77114a03416e760fe2f34c56a97f593060372"
IMPORTED_CUT_COUNT = 63_509
THIRD_APEX_CLAUSE_COUNT = 550
EXPECTED_VARIABLES = 432
EXPECTED_BASE_CLAUSES = 31_283
EXPECTED_TOTAL_CLAUSES = EXPECTED_BASE_CLAUSES + THIRD_APEX_CLAUSE_COUNT
EXPECTED_STRICT_FORMS = 1_430

SCHEMA = "cardge13-exact13-third-apex-guarded-cegar-wave7-piqd/v1"
ROOT_SCHEMA = "cardge13-exact13-third-apex-guarded-root-wave7/v1"
MODEL_SCHEMA = "cardge13-exact13-third-apex-model-wave7/v1"

w5 = wave6.wave5
w4 = w5.wave4
w1 = w4.wave1
root = wave6.root
ORIGINAL_ADMITTED_CUT = w1.admitted_cut
ORIGINAL_REPLAY_ASSIGNMENT = root.replay_assignment


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def _without_comments(value: bytes) -> bytes:
    lines = value.splitlines(keepends=True)
    if len(lines) < 4 or not all(line.startswith(b"c ") for line in lines[:3]):
        raise w1.AuditError("Wave6 root does not have the expected comment prefix")
    if not lines[3].startswith(b"p cnf "):
        raise w1.AuditError("Wave6 root header is missing")
    return b"\n".join(line.rstrip(b"\n") for line in lines[3:]) + b"\n"


def third_apex_guard_clauses(cnf: root.Cnf) -> list[tuple[int, ...]]:
    """Return the 550 source-row and target-G2 guarded clauses."""
    names = cnf.names
    clauses: list[tuple[int, ...]] = []
    for center in range(3, 13):
        points = [point for point in root.LABELS if point not in (2, center)]
        for left, right in itertools.combinations(points, 2):
            clauses.append((
                names[f"is_b0_{center}"], names[f"is_b1_{center}"],
                names["is_b0_2"], names["is_b1_2"],
                -names[f"m_G{center}_2"], -names[f"m_G{center}_{left}"],
                -names[f"m_G{center}_{right}"], -names[f"m_G2_{left}"],
                -names[f"m_G2_{right}"],
            ))
    return clauses


def third_apex_violations(key: dict[str, object]) -> list[dict[str, object]]:
    rows = {name: root.raw_support(key, name) for name in root.ROWS}
    roles = key.get("roles")
    if not isinstance(roles, dict):
        raise w1.AuditError("Key roles are malformed")
    blockers = {int(roles["b0"]), int(roles["b1"])}
    for center in blockers & set(root.GLOBAL_CENTERS):
        rows[f"G{center}"] = set()
    failures = []
    for center in root.GLOBAL_CENTERS:
        overlap = sorted(rows[f"G{center}"] & rows["G2"])
        if 2 in rows[f"G{center}"] and len(overlap) > 1:
            failures.append({"center": center, "target": 2, "intersection": overlap})
    return failures


def _source_bindings(source: Path) -> dict[str, str]:
    paths = {
        source, WAVE6_REPLAY_AUDIT, WAVE6_REPLAY_RECEIPT, WAVE6_BANK,
        Path(__file__), Path(wave6.__file__), Path(w5.__file__), Path(w4.__file__),
        Path(w1.__file__), Path(root.__file__),
        Path("lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13StrongSourceCoverage.lean"),
        Path("scripts/audit_exact13_wave6_partial_replay.py"),
    }
    relative = sorted(str(path.resolve().relative_to(Path.cwd())) for path in paths)
    return {path: sha256(Path(path).read_bytes()) for path in relative}


def _input_digests() -> dict[str, str]:
    return {
        str(WAVE6_REPLAY_AUDIT): sha256(WAVE6_REPLAY_AUDIT.read_bytes()),
        str(WAVE6_REPLAY_RECEIPT): sha256(WAVE6_REPLAY_RECEIPT.read_bytes()),
        str(WAVE6_BANK): sha256(WAVE6_BANK.read_bytes()),
        str(WAVE6_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"): WAVE6_ROOT_SHA256,
    }


def update_run_manifest(run_root: Path, source: Path) -> None:
    path = run_root / "run_manifest.json"
    value: dict[str, object] = {
        "schema": "worktree-run-manifest/v1", "lane_id": LANE, "run_id": "run-0001",
        "root": str(run_root), "owner": LANE, "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "input_digests": _input_digests(), "source_digests": _source_bindings(source),
        "created_utc": "2026-09-07T02:16:37Z",
    }
    if path.exists():
        prior = json.loads(path.read_text())
        if prior.get("base_head") != BASE_HEAD or prior.get("input_digests") != value["input_digests"]:
            raise w1.AuditError("Wave7 run manifest provenance drifted")
        if (run_root / "events/state.json").exists():
            raise w1.AuditError("cannot rewrite a Wave7 manifest after worker state exists")
        value = prior
        value["source_digests"] = _source_bindings(source)
    value["manifest_sha256"] = sha256(canonical({k: v for k, v in value.items() if k != "manifest_sha256"}))
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(canonical(value) + b"\n")


def third_apex_initial_root(run_root: Path, source: Path, producer_commit: str):
    base_cnf, projection = wave6.guarded_cnf()
    if (len(base_cnf.names), len(base_cnf.clauses)) != (EXPECTED_VARIABLES, EXPECTED_BASE_CLAUSES):
        raise w1.AuditError("historical guarded root dimensions drifted")
    old_root = WAVE6_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    old_bytes = old_root.read_bytes()
    if sha256(old_bytes) != WAVE6_ROOT_SHA256 or _without_comments(old_bytes) != base_cnf.dimacs():
        raise w1.AuditError("Wave6 guarded root replay drifted")
    clauses = third_apex_guard_clauses(base_cnf)
    if len(clauses) != THIRD_APEX_CLAUSE_COUNT:
        raise w1.AuditError("third-apex clause count drifted")
    before = len(base_cnf.names)
    for clause in clauses:
        base_cnf.add(*clause)
    if len(base_cnf.names) != before or len(base_cnf.clauses) != EXPECTED_TOTAL_CLAUSES:
        raise w1.AuditError("third-apex root added variables or wrong clause count")
    root_bytes = base_cnf.dimacs(("exact13 third-apex guarded root", "source theorem: CardGeThirteenExact13ThirdApexSourceCoverage", "both blocker-row activation guards"))
    normalized, normalization = root.normalize_for_piqd_session(root_bytes)
    artifact = run_root / "artifacts/exact13-third-apex-guarded-root.cnf"
    inherited = run_root / "artifacts/inherited-wave6-guarded-root.cnf"
    map_path = run_root / "artifacts/exact13-third-apex-guarded-root.map.json"
    w1.write_once(inherited, old_bytes)
    w1.write_once(artifact, root_bytes)
    w1.write_once(map_path, canonical({
        "schema": ROOT_SCHEMA, "variables": len(base_cnf.names), "clauses": len(base_cnf.clauses),
        "inherited_root_sha256": WAVE6_ROOT_SHA256, "third_apex_clause_count": len(clauses),
        "new_variables": 0, "source_theorem": str(source), "source_theorem_sha256": sha256(source.read_bytes()),
        "both_source_row_and_target_g2_guards": True, "projection": projection,
    }) + b"\n")
    report = w1.seal({
        "schema": ROOT_SCHEMA, "producer_commit": producer_commit, "source_path": str(source),
        "source_sha256": sha256(source.read_bytes()), "inherited_root_sha256": WAVE6_ROOT_SHA256,
        "inherited_root": str(inherited), "cnf": str(artifact), "map": str(map_path),
        "map_sha256": sha256(map_path.read_bytes()), "variables": len(base_cnf.names),
        "clauses": len(base_cnf.clauses), "third_apex_clause_count": len(clauses),
        "new_variables": 0, "both_activation_guards": True, "emitted_cnf_sha256": sha256(root_bytes),
        "cnf_bytes": len(root_bytes), "piqd_normalized_journal_sha256": sha256(normalized),
        "piqd_normalized_journal_bytes": len(normalized), "normalization": normalization,
        "source_clause_entitlement": "CardGeThirteenExact13ThirdApexSourceCoverage",
        "formula_scoped_only": True,
    })
    w1.atomic_json(run_root / "events/effective-root.json", report)
    return base_cnf, projection, {**report, "cnf_bytes": root_bytes}


def _safe_source(path_value: object, label: str) -> Path:
    path = Path(str(path_value)).resolve()
    if not path.is_relative_to(WAVE6_RUN.resolve()):
        raise w1.AuditError(f"{label} escapes Wave6 source run")
    return path


def import_wave6_partial(run_root: Path, cnf: root.Cnf, projection: dict[str, object]) -> dict[str, object]:
    event_path = run_root / "events/wave6-import-replay.json"
    live_bank = run_root / "events/cut-bank.jsonl"
    if event_path.exists() and live_bank.exists():
        prior = json.loads(event_path.read_text())
        w1._verify_seal(prior, str(event_path))
        if prior.get("source_bank_sha256") == WAVE6_BANK_SHA256 and prior.get("imported_cut_count") == IMPORTED_CUT_COUNT and prior.get("all_imported_relations_replayed") is True and sha256(live_bank.read_bytes()) == WAVE6_BANK_SHA256:
            return prior
        raise w1.AuditError("existing Wave7 import replay is not resumably sealed")
    receipt = json.loads(WAVE6_REPLAY_RECEIPT.read_text())
    w1._verify_seal(receipt, str(WAVE6_REPLAY_RECEIPT))
    if sha256(WAVE6_REPLAY_RECEIPT.read_bytes()) != WAVE6_RECEIPT_SHA256:
        raise w1.AuditError("Wave6 replay receipt hash drifted")
    if receipt.get("source_tree_digest") != "fe3c26626f15f74223a5404c68f9a71507aa57838b3d77e7e7769c9a59cc2849":
        raise w1.AuditError("Wave6 replay source tree digest drifted")
    if receipt.get("copied_bank_sha256") != WAVE6_BANK_SHA256 or receipt.get("copied_bank_count") != IMPORTED_CUT_COUNT:
        raise w1.AuditError("Wave6 partial bank receipt drifted")
    records = w1.load_bank(WAVE6_BANK)
    if len(records) != IMPORTED_CUT_COUNT or sha256(WAVE6_BANK.read_bytes()) != WAVE6_BANK_SHA256:
        raise w1.AuditError("Wave6 partial bank bytes/count drifted")
    base_cnf, base_projection = wave6.guarded_cnf()
    if base_projection != projection:
        raise w1.AuditError("Wave6 projection drifted")
    historical_cnf, historical_projection = root.emit_root()
    historical_root = w4.WAVE2_RUN / "artifacts/exact13-witnessed-key-effective-root.cnf"
    if sha256(historical_root.read_bytes()) != w4.WAVE2_ROOT_SHA256 or _without_comments(historical_root.read_bytes()) != historical_cnf.dimacs():
        raise w1.AuditError("historical Wave2 parent root replay drifted")
    if historical_projection != base_projection:
        raise w1.AuditError("historical projection drifted")
    old_root_replays = strong_replays = zero_replays = 0
    for index, record in enumerate(records):
        if record.get("index") != index or record.get("kind") not in {"transitive-incidence-path", "two-form-incidence-path"}:
            raise w1.AuditError(f"imported cut identity drifted at {index}")
        cert_path = _safe_source(record.get("certificate"), f"cut {index} certificate")
        if sha256(cert_path.read_bytes()) != record.get("certificate_sha256"):
            raise w1.AuditError(f"imported certificate hash drifted at {index}")
        cert = json.loads(cert_path.read_text())
        w1._verify_seal(cert, f"imported certificate {index}")
        model_path = _safe_source(cert.get("parent_model"), f"cut {index} parent")
        if sha256(model_path.read_bytes()) != cert.get("parent_model_sha256"):
            raise w1.AuditError(f"imported parent hash drifted at {index}")
        model = json.loads(model_path.read_text())
        w1._verify_seal(model, f"imported model {index}")
        raw_path = _safe_source(model.get("raw_solve"), f"model {index} raw solve")
        if sha256(raw_path.read_bytes()) != model.get("raw_solve_sha256"):
            raise w1.AuditError(f"imported raw solve hash drifted at {index}")
        solved = json.loads(raw_path.read_text())
        if solved.get("status") != "SAT":
            raise w1.AuditError(f"imported model {index} is not SAT")
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, base_projection)
        checks = root.replay_assignment(assignment, key, base_projection)
        parent_cnf = historical_cnf if index < 6_000 else base_cnf
        if not parent_cnf.satisfied(assignment) or checks.get("Valid") is not True:
            raise w1.AuditError(f"imported model {index} fails root or Key.Valid")
        old_root_replays += 1
        if not w4.boundary.guarded_violations(key):
            strong_replays += 1
        conflict = cert.get("conflict")
        literals, admission = ORIGINAL_ADMITTED_CUT(conflict, w1.key_cell(key), root.ORDERS[int(key["orientation"] == "mirror")], assignment, base_cnf)
        if list(literals) != record.get("clause") or admission.get("atoms") != record.get("atoms"):
            raise w1.AuditError(f"imported cut reconstruction drifted at {index}")
        replay = admission.get("semantic_replay", {})
        if replay.get("zero_projected_sum_replayed") is not True or replay.get("path_step_count", 0) <= 0:
            raise w1.AuditError(f"imported cut zero-sum/path replay missing at {index}")
        zero_replays += 1
    immutable = run_root / "artifacts/immutable-wave6-partial-bank.jsonl"
    live = run_root / "events/cut-bank.jsonl"
    w1.write_once(immutable, WAVE6_BANK.read_bytes())
    w1.write_once(live, WAVE6_BANK.read_bytes())
    report = w1.seal({
        "schema": f"{SCHEMA}/wave6-import/v1", "source_replay_commit": WAVE6_REPLAY_COMMIT,
        "source_receipt": str(WAVE6_REPLAY_RECEIPT), "source_receipt_sha256": WAVE6_RECEIPT_SHA256,
        "source_bank": str(WAVE6_BANK), "source_bank_sha256": WAVE6_BANK_SHA256,
        "imported_cut_count": len(records), "replayed_model_count": old_root_replays,
        "strongvalid_replays": strong_replays, "zero_sum_replays": zero_replays,
        "source_path_replays": len(records), "certificate_replays": len(records),
        "historical_parent_semantics_preserved": True, "historical_parent_partition": {"first_6000_outside": 4431, "first_6000_strongvalid": 1569, "later_strongvalid": 57000},
        "third_apex_root_is_successor_not_imported_parent": True,
        "all_imported_relations_replayed": True, "formula_scoped_only": True,
    })
    w1.atomic_json(run_root / "events/wave6-import-replay.json", report)
    return report


def install_new_model_guard() -> None:
    def replay(assignment: set[int], key: dict[str, object], projection: dict[str, object]):
        result = ORIGINAL_REPLAY_ASSIGNMENT(assignment, key, projection)
        if result.get("Valid") is True and w4.boundary.guarded_violations(key):
            raise w1.AuditError("new model fails GlobalOneBoundaryValid")
        if result.get("Valid") is True and third_apex_violations(key):
            raise w1.AuditError("new model fails GlobalThirdApexValid")
        return result
    root.replay_assignment = replay


def admit_with_f1_f7(conflict, cell, order, assignment, cnf):
    literals, admission = ORIGINAL_ADMITTED_CUT(conflict, cell, order, assignment, cnf)
    admission = dict(admission)
    admission["f1_f7_evidence"] = {
        "F1_parent_exactness": {"root_sha256": sha256(cnf.dimacs()), "assignment_positive_literals": len(assignment)},
        "F2_child_exactness": {"append_only": True, "clause": list(literals)},
        "F3_current_model_elimination": bool(admission.get("current_model_eliminated")),
        "F4_source_preservation": admission.get("semantic_replay", {}).get("universal_incidence_justification"),
        "F5_child_semantic_bridge": "inherited canonical decoder and source-row contract; formula-scoped",
        "F6_witness_connection": conflict,
        "F7_strict_progress": bool(admission.get("current_model_eliminated")),
    }
    return literals, admission


def verify_new_models(run_root: Path, cnf: root.Cnf, projection: dict[str, object], root_sha256: str) -> dict[str, object]:
    paths = sorted((p for p in (run_root / "events/models").glob("model-*.json") if int(p.stem.split("-")[-1]) >= IMPORTED_CUT_COUNT), key=lambda p: int(p.stem.split("-")[-1]))
    for path in paths:
        model = json.loads(path.read_text())
        w1._verify_seal(model, str(path))
        raw = Path(str(model["raw_solve"])).resolve()
        if not raw.is_relative_to(run_root.resolve()):
            raise w1.AuditError("new model raw solve escapes Wave7 run")
        solved = json.loads(raw.read_text())
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if model.get("root_emitted_sha256") != root_sha256 or not cnf.satisfied(assignment) or checks.get("Valid") is not True or w4.boundary.guarded_violations(key) or third_apex_violations(key):
            raise w1.AuditError(f"new model semantic replay failed: {path}")
        if model.get("projected_key") != key:
            raise w1.AuditError(f"selected decoder replay drifted: {path}")
    result = {"schema": f"{SCHEMA}/new-model-replay/v1", "new_model_count": len(paths), "guarded_root_replays": len(paths), "key_valid_replays": len(paths), "global_one_boundary_valid_replays": len(paths), "global_third_apex_valid_replays": len(paths), "third_apex_strongvalid_replays": len(paths), "selected_decoder_replays": len(paths), "all_new_models_pass": True}
    w1.atomic_json(run_root / "events/new-model-third-apex-strongvalid-replay.json", w1.seal(result))
    return result


def configure() -> None:
    wave6.configure_delegate()
    w5.LANE = LANE; w5.RUN_ROOT = RUN_ROOT; w5.WAVE4_RUN = WAVE6_RUN
    w5.WAVE4_ROOT_SHA256 = WAVE6_ROOT_SHA256; w5.WAVE4_BANK_SHA256 = WAVE6_BANK_SHA256
    w5.IMPORTED_CUT_COUNT = IMPORTED_CUT_COUNT; w5.WAVE4_NEW_CUT_COUNT = 7_509
    w5.BASE_HEAD = BASE_HEAD; w5.SCHEMA = SCHEMA; w5.ROOT_SCHEMA = ROOT_SCHEMA
    w5.STATE_SCHEMA = f"{SCHEMA}/state"; w5.CUSTODY_SCHEMA = f"{SCHEMA}/custody"; w5.MIGRATION_SCHEMA = f"{SCHEMA}/migration"
    w4.WAVE3_RUN = WAVE6_RUN; w4.WAVE3_ROOT_SHA256 = WAVE6_ROOT_SHA256; w4.WAVE3_BANK_SHA256 = WAVE6_BANK_SHA256
    w4.IMPORTED_CUT_COUNT = IMPORTED_CUT_COUNT; w4.WAVE3_CUT_COUNT = 7_509; w4.BASE_HEAD = BASE_HEAD
    w4.SCHEMA = SCHEMA; w4.ROOT_SCHEMA = ROOT_SCHEMA; w4.STATE_SCHEMA = w5.STATE_SCHEMA; w4.CUSTODY_SCHEMA = w5.CUSTODY_SCHEMA; w4.MIGRATION_SCHEMA = w5.MIGRATION_SCHEMA
    w5.source_bindings = _source_bindings; w4.source_bindings = _source_bindings; w1.source_bindings = _source_bindings
    w4.update_run_manifest = update_run_manifest; w4.guarded_initial_root = third_apex_initial_root
    w4.import_wave3_frontier = import_wave6_partial; w4.install_new_model_guard = install_new_model_guard; w4.verify_new_models = verify_new_models
    w1.admitted_cut = admit_with_f1_f7


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.producer_commit != BASE_HEAD:
        raise w1.AuditError("Wave7 requires producer commit 427d96c66")
    actual = subprocess.run(["git", "rev-parse", "HEAD"], capture_output=True, text=True, check=True).stdout.strip()
    ancestry = subprocess.run(["git", "merge-base", "--is-ancestor", BASE_HEAD, "HEAD"], check=False)
    if ancestry.returncode != 0:
        raise w1.AuditError(f"recorded base {BASE_HEAD} is not an ancestor of current HEAD {actual}")
    if args.additional_refinements < 0:
        raise ValueError("additional refinement budget must be nonnegative")
    configure()
    wave6.ACTIVE_DIAGNOSTIC_ROOT = RUN_ROOT; wave6.ACTIVE_CONE_SOLVER = args.cone_solver; wave6.ACTIVE_CONE_TIMEOUT_MS = args.solve_timeout_ms
    w1.run_piqc = wave6._isolated_run_piqc; w1.export_piqd_session = wave6._isolated_export_piqd_session
    w1.find_conflict = wave6.find_conflict_after_complete_diagnostic; w1.full_cone_diagnostic = wave6.full_cone_diagnostic
    delegated_run = w5.subprocess.run
    def recorded_base_head(command, *delegated_args, **delegated_kwargs):
        if command == ["git", "rev-parse", "HEAD"]:
            return subprocess.CompletedProcess(command, 0, stdout=f"{BASE_HEAD}\n", stderr="")
        return delegated_run(command, *delegated_args, **delegated_kwargs)
    w5.subprocess.run = recorded_base_head
    try:
        result = dict(w5.run(args))
    finally:
        w5.subprocess.run = delegated_run
    result.update({
        "base_head": BASE_HEAD, "execution_head": actual, "source_theorem": str(SOURCE), "source_theorem_sha256": SOURCE_SHA256,
        "wave6_replay_commit": WAVE6_REPLAY_COMMIT, "wave6_bank_sha256": WAVE6_BANK_SHA256,
        "third_apex_clause_count": THIRD_APEX_CLAUSE_COUNT, "third_apex_no_new_variables": True,
        "strict_form_count": EXPECTED_STRICT_FORMS, "configured_loop_wall_seconds": args.wall_seconds,
        "additional_refinement_budget": args.additional_refinements, "solve_timeout_ms": args.solve_timeout_ms,
        "claim_boundary": "solver-only formula-scoped discovery; no closure, UNSAT, Lean, or promotion claim",
        "root_identity": {"variables": EXPECTED_VARIABLES, "clauses": EXPECTED_TOTAL_CLAUSES, "third_apex_clauses": THIRD_APEX_CLAUSE_COUNT, "sha256": result.get("root_emitted_sha256")},
    })
    w1.atomic_json(RUN_ROOT / "events/run.json", w1.reseal(result))
    return result


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=SOURCE); parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=w1.DEFAULT_SOLVER); parser.add_argument("--cone-solver", default=w1.DEFAULT_CONE_SOLVER)
    parser.add_argument("--additional-refinements", type=int, default=20_000); parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=3600.0); parser.add_argument("--finalize-existing", action="store_true")
    return parser.parse_args()


if __name__ == "__main__":
    arguments = parse_args()
    if arguments.finalize_existing:
        raise SystemExit("finalize-existing is not supported for a fresh Wave7 lane")
    print(canonical(run(arguments)).decode())
