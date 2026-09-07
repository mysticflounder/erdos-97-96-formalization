#!/usr/bin/env python3
"""Read-only replay audit for the interrupted exact13 wave6 frontier.

The audit authenticates the retained wave6 bank and replays every retained
certificate in memory.  It never invokes PIQD or a solver.  Its output is a
formula-scoped interruption receipt; it is not a terminal or UNSAT result.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import shutil
from collections.abc import Iterable
from pathlib import Path

import cardge13_exact13_witnessed_key_cegar_wave1_piqd as wave1
import cardge13_exact13_witnessed_key_guarded_cegar_wave6_piqd as wave6
import cardge13_exact13_witnessed_key_root_piqd as root
import check_exact13_guarded_boundary as boundary

SOURCE_RUN = Path("scratch/runs/exact13-witnessed-key-guarded-cegar-wave6-20260906/run-0001")
OUTPUT_RUN = Path("scratch/runs/exact13-wave6-partial-replay-20260906/run-0001")
EXPECTED_ROOT_SHA256 = "238003d365089adf8e2ad00e4fa181e2972b34e68a34c550532901b05472ed5f"
EXPECTED_IMPORTED_BANK_SHA256 = "ed2bf13c87c5969be1b3ff45711a37fd7fc2346dfb1402122549141088f74f11"
EXPECTED_LIVE_BANK_SHA256 = "2f18fb2f8930767e641049286dbe40da7d6fb0b8543f20fc8abd519483c8b8c2"
EXPECTED_ROOT_VARIABLES = 432
EXPECTED_ROOT_CLAUSES = 31_283
EXPECTED_GUARDED_CLAUSES = 1_815
IMPORTED_COUNT = 56_000
NEW_COUNT = 7_509
TOTAL_COUNT = IMPORTED_COUNT + NEW_COUNT
EXPECTED_STATE_COUNT = 63_508
EXPECTED_SESSION = "5ead1a60-d97d-4c52-a6e5-20c13b1ad097"
BASE_HEAD = "fd020fbb3255253b07ffc8229ca6b2c7883ff1d1"
AUDIT_LANE_BASE_HEAD = "9852eb8cb5f8283d7f5a8e0d06508590c45934bc"
EXPECTED_IMPORT_REPLAY_SHA256 = "3a01167ee3307cf7d6401e1144c77114a03416e760fe2f34c56a97f593060372"
EXPECTED_IMPORT_REPLAY_EVENT_SHA256 = "3cf7f9e3ed1df6809a17b1117833aad49e4529fc1d4687a2a494f1637f747099"
EXPECTED_CUT_KINDS = {"transitive-incidence-path", "two-form-incidence-path"}


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def reseal(value: dict[str, object]) -> dict[str, object]:
    unsigned = {key: item for key, item in value.items() if key != "event_sha256"}
    result = dict(unsigned)
    result["event_sha256"] = sha256_bytes(canonical(unsigned))
    return result


def verify_seal(value: dict[str, object], label: str) -> None:
    recorded = value.get("event_sha256")
    unsigned = {key: item for key, item in value.items() if key != "event_sha256"}
    if recorded != sha256_bytes(canonical(unsigned)):
        raise ValueError(f"{label} self-hash drifted")


def verify_digest(path: Path, expected: str, label: str) -> None:
    actual = sha256_bytes(path.read_bytes())
    if actual != expected:
        raise ValueError(f"{label} digest drifted: {actual} != {expected}")


def snapshot_tree(root_path: Path) -> dict[str, str]:
    if not root_path.is_dir():
        raise ValueError(f"missing retained run root: {root_path}")
    return {
        str(path.relative_to(root_path)): sha256_bytes(path.read_bytes())
        for path in sorted(path for path in root_path.rglob("*") if path.is_file())
    }


def _raw_rows(key: dict[str, object]) -> dict[str, set[int]]:
    return {name: root.raw_support(key, name) for name in root.ROWS}


def third_apex_violations(key: dict[str, object]) -> list[dict[str, object]]:
    """Replay the proposed raw third-apex guard on a decoded Key.

    Global rows at either blocker center are inactive and therefore treated as
    empty.  Supports in ``supportOf`` are positional; ``root.raw_support``
    maps them back through the direct/mirror order before this test.
    """
    rows = _raw_rows(key)
    roles = key.get("roles")
    if not isinstance(roles, dict):
        raise TypeError("malformed Key roles")
    blockers = {int(roles["b0"]), int(roles["b1"])}
    for center in blockers & set(root.GLOBAL_CENTERS):
        rows[f"G{center}"] = set()
    result = []
    for center in root.GLOBAL_CENTERS:
        support = rows[f"G{center}"]
        intersection = sorted(support & rows["G2"])
        if 2 in support and len(intersection) > 1:
            result.append({"center": center, "apex": 2, "target": "G2", "intersection": intersection})
    return result


def third_apex_guard_clauses(cnf: root.Cnf) -> list[tuple[int, ...]]:
    """Build the 550 guarded clauses for the proposed raw third apex test."""
    names = cnf.names
    clauses = []
    for center in range(3, 13):
        pair_points = [point for point in root.LABELS if point not in (2, center)]
        for left, right in itertools.combinations(pair_points, 2):
            clauses.append((
                names[f"is_b0_{center}"], names[f"is_b1_{center}"],
                names["is_b0_2"], names["is_b1_2"],
                -names[f"m_G{center}_2"], -names[f"m_G{center}_{left}"],
                -names[f"m_G{center}_{right}"], -names[f"m_G2_{left}"],
                -names[f"m_G2_{right}"],
            ))
    return clauses


def violated_clauses(assignment: set[int], clauses: Iterable[tuple[int, ...]]) -> int:
    return sum(
        1 for clause in clauses
        if all((literal > 0) != (abs(literal) in assignment) for literal in clause)
    )


def _load_json(path: Path) -> dict[str, object]:
    value = json.loads(path.read_text())
    if not isinstance(value, dict):
        raise TypeError(f"JSON object required: {path}")
    return value


def _under(path: Path, root_path: Path, label: str) -> Path:
    resolved = path.resolve()
    try:
        resolved.relative_to(root_path.resolve())
    except ValueError as exc:
        raise ValueError(f"{label} escapes retained run: {path}") from exc
    return resolved


def _reject_overlap(source: Path, output: Path) -> None:
    source_resolved, output_resolved = source.resolve(), output.resolve()
    if (source_resolved == output_resolved
            or source_resolved.is_relative_to(output_resolved)
            or output_resolved.is_relative_to(source_resolved)):
        raise ValueError("audit output overlaps retained input tree")


def expected_raw_solve_index(model_index: int) -> int:
    if not IMPORTED_COUNT <= model_index < TOTAL_COUNT:
        raise ValueError(f"model index is outside new wave6 additions: {model_index}")
    return model_index - IMPORTED_COUNT + 1


def verify_raw_solve_index(raw_index: object, model_index: int) -> None:
    if raw_index != expected_raw_solve_index(model_index):
        raise ValueError(f"raw solve index drifted at {model_index}")


def validate_new_cut_kind(kind: object, index: int) -> None:
    if kind not in EXPECTED_CUT_KINDS:
        raise ValueError(f"unknown cut kind at {index}")


def validate_new_cut_counts(one_form: int, two_form: int) -> None:
    if (one_form, two_form) != (5_700, 1_809):
        raise ValueError(f"new cut kind counts drifted: {(one_form, two_form)}")


def _bank_records(bank_path: Path) -> list[dict[str, object]]:
    records = []
    for index, line in enumerate(bank_path.read_bytes().splitlines()):
        value = json.loads(line)
        if not isinstance(value, dict) or value.get("index") != index:
            raise ValueError(f"bank index drifted at {index}")
        validate_new_cut_kind(value.get("kind"), index)
        records.append(value)
    if len(records) != TOTAL_COUNT:
        raise ValueError(f"bank count drifted: {len(records)}")
    return records


def _verify_import_replay(
    source: Path, bank_path: Path, immutable_path: Path,
    records: list[dict[str, object]],
) -> dict[str, object]:
    report_path = source / "events/wave3-import-replay.json"
    verify_digest(report_path, EXPECTED_IMPORT_REPLAY_SHA256, "completed import replay")
    report = _load_json(report_path)
    verify_seal(report, "completed import replay")
    expected = {
        "schema": "cardge13-exact13-witnessed-key-cut-migration-wave6/v1",
        "event_sha256": EXPECTED_IMPORT_REPLAY_EVENT_SHA256,
        "source_root_sha256": EXPECTED_ROOT_SHA256,
        "imported_root_sha256": EXPECTED_ROOT_SHA256,
        "immutable_imported_bank_sha256": EXPECTED_IMPORTED_BANK_SHA256,
        "imported_cut_count": IMPORTED_COUNT,
        "revalidated_cut_count": IMPORTED_COUNT,
        "all_atoms_and_clauses_reconstructed": True,
        "all_zero_projections_replayed": True,
        "all_paths_resolved_under_immutable_wave3_root": True,
        "historical_parent_StrongValid_not_required_for_cut_soundness": True,
        "imported_immutable_and_live_bank_hashes_distinct": True,
        "imported_immutable_and_live_bank_paths_distinct": True,
    }
    if any(report.get(key) != value for key, value in expected.items()):
        raise ValueError("completed import replay evidence drifted")
    if Path(str(report.get("immutable_imported_bank"))).resolve() != immutable_path.resolve():
        raise ValueError("completed import replay bank path drifted")
    if Path(str(report.get("final_live_bank"))).resolve() != bank_path.resolve():
        raise ValueError("completed import replay live-bank path drifted")
    prefix = b"\n".join(bank_path.read_bytes().splitlines()[:IMPORTED_COUNT]) + b"\n"
    if report.get("final_live_bank_sha256") != sha256_bytes(prefix):
        raise ValueError("completed import replay prefix hash drifted")
    immutable_lines = immutable_path.read_bytes().splitlines()
    if len(immutable_lines) != IMPORTED_COUNT:
        raise ValueError("immutable imported bank count drifted")
    for index, (live, imported) in enumerate(zip(records[:IMPORTED_COUNT], immutable_lines)):
        value = json.loads(imported)
        if not isinstance(value, dict) or value.get("index") != index:
            raise ValueError(f"immutable imported bank index drifted at {index}")
        for key in ("index", "kind", "atoms", "clause"):
            if live.get(key) != value.get(key):
                raise ValueError(f"live bank imported prefix drifted at {index}")
    return report


def _replay_models_and_cuts(
    source: Path, records: list[dict[str, object]], cnf: root.Cnf,
    projection: dict[str, object]
) -> dict[str, object]:
    checked_models = checked_cuts = valid_new = third_excluded = 0
    third_clause_excluded = third_clause_violations = 0
    third_clauses = third_apex_guard_clauses(cnf)
    one_form = two_form = 0
    third_clause_excluded = 0
    first_guard: dict[str, object] | None = None
    last_model: dict[str, object] | None = None
    # The imported 56,000 rows are trusted only through the authenticated
    # immutable-prefix hash and completed import replay.  This audit owns the
    # 7,509 wave6 additions; it does not rerun the historical campaign.
    for record in records[IMPORTED_COUNT:]:
        index = int(record["index"])
        validate_new_cut_kind(record.get("kind"), index)
        cert_path = _under(Path(str(record["certificate"])), source, f"certificate {index}")
        if sha256_bytes(cert_path.read_bytes()) != record.get("certificate_sha256"):
            raise ValueError(f"bank certificate digest drifted at {index}")
        cert = _load_json(cert_path)
        verify_seal(cert, f"certificate {index}")
        if cert.get("index") != index:
            raise ValueError(f"certificate index drifted at {index}")
        conflict = cert.get("conflict")
        if not isinstance(conflict, dict) or conflict.get("kind") != record.get("kind"):
            raise ValueError(f"certificate kind drifted at {index}")
        model_path = _under(Path(str(cert["parent_model"])), source, f"model {index}")
        if sha256_bytes(model_path.read_bytes()) != cert.get("parent_model_sha256"):
            raise ValueError(f"parent model digest drifted at {index}")
        model = _load_json(model_path)
        verify_seal(model, f"model {index}")
        if model.get("index") != index:
            raise ValueError(f"model index drifted at {index}")
        if model.get("session_id") != EXPECTED_SESSION:
            raise ValueError(f"model session drifted at {index}")
        if model.get("root_emitted_sha256") != EXPECTED_ROOT_SHA256:
            raise ValueError(f"model root binding drifted at {index}")
        raw_path = _under(Path(str(model["raw_solve"])), source, f"raw solve {index}")
        if sha256_bytes(raw_path.read_bytes()) != model.get("raw_solve_sha256"):
            raise ValueError(f"raw solve digest drifted at {index}")
        solved = _load_json(raw_path)
        if solved.get("status") != "SAT" or solved.get("solve_index") is None:
            raise ValueError(f"raw solve is not SAT at {index}")
        verify_raw_solve_index(solved.get("solve_index"), index)
        if solved.get("result_sha256") != model.get("piqd_result_sha256"):
            raise ValueError(f"raw solve result reference drifted at {index}")
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if key != model.get("projected_key"):
            raise ValueError(f"projected Key drifted at {index}")
        if checks.get("Valid") is not True:
            raise ValueError(f"CNF or Key.Valid failed at {index}")
        if not cnf.satisfied(assignment):
            raise ValueError(f"effective CNF failed at new model {index}")
        checked_models += 1
        if boundary.guarded_violations(key):
            raise ValueError(f"existing Strong guard failed at new model {index}")
        valid_new += 1
        violations = third_apex_violations(key)
        clause_failures = violated_clauses(assignment, third_clauses)
        expected_clause_failures = sum(len(item["intersection"]) * (len(item["intersection"]) - 1) // 2 for item in violations)
        if clause_failures != expected_clause_failures:
            raise ValueError(f"third-apex semantic/CNF guard mismatch at {index}")
        if violations:
            third_excluded += 1
            third_clause_excluded += 1
            third_clause_violations += clause_failures
            if first_guard is None:
                guard_rows = _raw_rows(key)
                blockers = {int(key["roles"]["b0"]), int(key["roles"]["b1"])}
                for blocked_center in blockers & set(root.GLOBAL_CENTERS):
                    guard_rows[f"G{blocked_center}"] = set()
                first_guard = {"model": str(model_path), "model_sha256": sha256_bytes(model_path.read_bytes()),
                                "index": index, "orientation": key["orientation"],
                                "blockers": sorted(blockers),
                                "raw_supports": {"G2": sorted(guard_rows["G2"]),
                                                 **{f"G{item['center']}": sorted(guard_rows[f"G{item['center']}"])
                                                    for item in violations}},
                                "violations": violations}
        if index == TOTAL_COUNT - 1:
            last_model = {"model": str(model_path), "index": index, "disposition": model.get("disposition"),
                          "orientation": key["orientation"], "third_apex_violations": violations}
        cell = wave1.key_cell(key)
        order = root.ORDERS[int(key["orientation"] == "mirror")]
        if not isinstance(conflict, dict):
            raise TypeError(f"missing conflict at {index}")
        literals, admission = wave1.admitted_cut(conflict, cell, order, assignment, cnf)
        if tuple(literals) != tuple(record.get("clause", ())):
            raise ValueError(f"reconstructed clause drifted at {index}")
        if admission["atoms"] != record.get("atoms"):
            raise ValueError(f"reconstructed atoms drifted at {index}")
        recorded_admission = cert.get("admission")
        if not isinstance(recorded_admission, dict) or recorded_admission.get("semantic_replay") != admission["semantic_replay"]:
            raise ValueError(f"zero projection admission drifted at {index}")
        checked_cuts += 1
        if record.get("kind") == "transitive-incidence-path":
            one_form += 1
        elif record.get("kind") == "two-form-incidence-path":
            two_form += 1
    validate_new_cut_counts(one_form, two_form)
    return {"models_checked": checked_models, "cuts_checked": checked_cuts, "new_models_valid": valid_new,
            "one_form_cuts": one_form, "two_form_cuts": two_form,
            "historical_imported_prefix_trusted_by_hash": True,
            "third_apex_guard_clause_count": len(third_clauses),
            "third_apex_excluded": third_excluded,
            "third_apex_clause_excluded": third_clause_excluded,
            "third_apex_clause_violations": third_clause_violations,
            "first_third_apex_guard_failure": first_guard,
            "last_model": last_model}


def replay(source: Path = SOURCE_RUN, output: Path = OUTPUT_RUN, copy_bank: bool = True) -> dict[str, object]:
    _reject_overlap(source, output)
    before = snapshot_tree(source)
    root_path = source / "artifacts/exact13-witnessed-key-effective-root.cnf"
    map_path = source / "artifacts/exact13-witnessed-key-effective-root.map.json"
    bank_path = source / "events/cut-bank.jsonl"
    state_path = source / "events/state.json"
    verify_digest(root_path, EXPECTED_ROOT_SHA256, "effective root")
    verify_digest(bank_path, EXPECTED_LIVE_BANK_SHA256, "live bank")
    immutable = source / "artifacts/immutable-imported-wave3-final-bank.jsonl"
    verify_digest(immutable, EXPECTED_IMPORTED_BANK_SHA256, "immutable imported bank")
    state = _load_json(state_path)
    verify_seal(state, "partial state")
    if state.get("active_session") != EXPECTED_SESSION or state.get("status") != "RUNNING":
        raise ValueError("partial state/session identity drifted")
    if state.get("refinement_count") != EXPECTED_STATE_COUNT:
        raise ValueError("documented one-row state lag drifted")
    source_bindings = wave6.source_bindings(wave1.DEFAULT_SOURCE)
    if state.get("source_bindings") != source_bindings:
        raise ValueError("transitive execution source bindings drifted")
    cnf, projection = wave6.guarded_cnf()
    retained_body = b"\n".join(line for line in root_path.read_bytes().splitlines() if not line.startswith(b"c ")) + b"\n"
    if retained_body != cnf.dimacs() or len(cnf.names) != EXPECTED_ROOT_VARIABLES or len(cnf.clauses) != EXPECTED_ROOT_CLAUSES:
        raise ValueError("retained effective root differs from pure reconstruction")
    root_map = _load_json(map_path)
    if root_map.get("projection") != projection or root_map.get("clauses") != EXPECTED_ROOT_CLAUSES or root_map.get("guarded_clause_count") != EXPECTED_GUARDED_CLAUSES:
        raise ValueError("root map drifted")
    records = _bank_records(bank_path)
    import_report = _verify_import_replay(source, bank_path, immutable, records)
    result = _replay_models_and_cuts(source, records, cnf, projection)
    after = snapshot_tree(source)
    if before != after:
        changed = sorted(set(before) | set(after))
        changed = [path for path in changed if before.get(path) != after.get(path)]
        raise ValueError(f"retained wave6 tree changed: {changed[:3]}")
    output.mkdir(parents=True, exist_ok=True)
    if copy_bank:
        target = output / "artifacts/immutable-wave6-partial-bank.jsonl"
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copyfile(bank_path, target)
        verify_digest(target, EXPECTED_LIVE_BANK_SHA256, "copied partial bank")
        copied_bank = str(target)
        copied_bank_sha256 = sha256_bytes(target.read_bytes())
        copied_bank_count = len(target.read_bytes().splitlines())
    else:
        copied_bank = None
        copied_bank_sha256 = None
        copied_bank_count = None
    execution_sources = {}
    for path in (Path(__file__), Path(wave6.__file__), Path(wave1.__file__),
                 Path(root.__file__), Path(boundary.__file__)):
        relative = str(path.resolve().relative_to(Path.cwd()))
        execution_sources[relative] = sha256_bytes(path.read_bytes())
    receipt = reseal({"schema": "exact13-wave6-partial-replay/v1", "status": "NONTERMINAL",
        "formula_scoped_only": True, "source_run": str(source), "source_tree_file_count": len(before),
        "source_tree_digest": sha256_bytes(canonical(before)), "producer_base_head": BASE_HEAD,
        "audit_lane_base_head": AUDIT_LANE_BASE_HEAD,
        "execution_source_sha256": execution_sources,
        "transitive_execution_source_bindings": source_bindings,
        "completed_import_replay_sha256": EXPECTED_IMPORT_REPLAY_SHA256,
        "completed_import_replay_event_sha256": import_report["event_sha256"],
        "root_sha256": EXPECTED_ROOT_SHA256, "live_bank_sha256": EXPECTED_LIVE_BANK_SHA256,
        "immutable_imported_bank_sha256": EXPECTED_IMPORTED_BANK_SHA256,
        "imported_count": IMPORTED_COUNT, "new_count": NEW_COUNT, "total_count": TOTAL_COUNT,
        "state_refinement_count": EXPECTED_STATE_COUNT, "state_lag_rows": 1,
        "copied_bank_path": copied_bank, "copied_bank_sha256": copied_bank_sha256,
        "copied_bank_count": copied_bank_count,
        "historical_model_scope": "authenticated immutable imported bank and completed import replay; no new guard assumed",
        "new_model_scope": "effective CNF, Key.Valid, existing Strong guard, and proposed third-apex guard",
        "terminal": None, "unsat": False, "solver_launched": False, **result})
    receipt_path = output / "partial-replay-receipt.json"
    receipt_path.parent.mkdir(parents=True, exist_ok=True)
    receipt_path.write_bytes(canonical(receipt) + b"\n")
    return receipt


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--source", type=Path, default=SOURCE_RUN)
    parser.add_argument("--output", type=Path, default=OUTPUT_RUN)
    parser.add_argument("--no-copy-bank", action="store_true")
    args = parser.parse_args()
    print(canonical(replay(args.source, args.output, not args.no_copy_bank)).decode())


if __name__ == "__main__":
    main()
