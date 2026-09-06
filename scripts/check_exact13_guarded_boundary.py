#!/usr/bin/env python3
"""Authenticate and replay the exact-13 guarded one-boundary audit.

The checker consumes the retained wave-2 model certificates.  It regenerates
the source root in memory, verifies every certificate and raw PIQD result, and
replays the guarded intersection predicate and the independent distance-edge
DSU.  It never invokes a solver.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Any

import cardge13_exact13_witnessed_key_cegar_wave1_piqd as wave1
import cardge13_exact13_witnessed_key_root_piqd as root

SCHEMA = "exact13-guarded-boundary-audit/v1"
RUN_ROOT = Path("scratch/runs/exact13-witnessed-key-cegar-wave2-20260906/run-0001")
EXPECTED_ROOT_SHA256 = "22cf80c657d8444827893533f22975e0ac2cbc12f033cf4334125f6088da857a"
EXPECTED_MODEL_COUNT = 6001
EXPECTED_STREAM_SHA256 = "a73108f3ca72f73e65f3c5ee033ccb728208129cb54c3d62a013d1dd8ab5e65a"


class AuditError(ValueError):
    pass


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def seal(value: dict[str, object]) -> dict[str, object]:
    result = dict(value)
    result["event_sha256"] = sha256_bytes(canonical(result))
    return result


def _pairs(pairs: list[tuple[str, object]]) -> dict[str, object]:
    result: dict[str, object] = {}
    for key, value in pairs:
        if key in result:
            raise AuditError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def load_json(path: Path) -> Any:
    try:
        return json.loads(path.read_text(), object_pairs_hook=_pairs)
    except (OSError, json.JSONDecodeError, UnicodeError) as exc:
        raise AuditError(f"cannot parse JSON {path}: {exc}") from exc


def _inside(path: Path, root_path: Path) -> Path:
    resolved = path.resolve()
    try:
        resolved.relative_to(root_path.resolve())
    except ValueError as exc:
        raise AuditError(f"retained path escapes run root: {path}") from exc
    return resolved


def guarded_clauses(
    cnf: root.Cnf, *, nontrivial: bool = False
) -> list[tuple[int, ...]]:
    """Emit the three guarded schema families without adding CNF variables."""
    try:
        names = cnf.names
        clauses: list[tuple[int, ...]] = []
        for center in root.GLOBAL_CENTERS:
            guard = (names[f"is_b0_{center}"], names[f"is_b1_{center}"])
            for apex, row in ((0, "K"), (0, "L"), (1, "T")):
                for left, right in itertools.combinations(root.LABELS, 2):
                    if nontrivial and apex in (left, right) or nontrivial and center in (left, right):
                        continue
                    clauses.append(
                        (*guard,
                         -names[f"m_G{center}_{apex}"],
                         -names[f"m_G{center}_{left}"],
                         -names[f"m_G{center}_{right}"],
                         -names[f"m_{row}_{left}"],
                         -names[f"m_{row}_{right}"],)
                    )
        return clauses
    except KeyError as exc:
        raise AuditError(f"root variable missing from guarded schema: {exc}") from exc


def _key_rows(key: dict[str, object]) -> tuple[dict[str, set[int]], dict[str, int]]:
    roles = key.get("roles")
    if not isinstance(roles, dict) or not all(name in roles for name in ("b0", "b1")):
        raise AuditError("model Key roles are malformed")
    try:
        typed_roles = {name: int(value) for name, value in roles.items()}
    except (TypeError, ValueError) as exc:
        raise AuditError("model Key roles are non-integral") from exc
    if any(value not in root.LABELS for value in typed_roles.values()):
        raise AuditError("model Key role is outside label range")
    rows = {row: root.raw_support(key, row) for row in root.ROWS}
    return rows, typed_roles


def guarded_violations(key: dict[str, object]) -> list[dict[str, object]]:
    """Return each active global/apex/two-point guarded-bound violation."""
    rows, roles = _key_rows(key)
    blockers = {roles["b0"], roles["b1"]}
    result: list[dict[str, object]] = []
    for center in root.GLOBAL_CENTERS:
        row_name = f"G{center}"
        support = rows[row_name]
        if center in blockers or not support:
            continue
        for apex, target in ((0, "K"), (0, "L"), (1, "T")):
            if apex not in support:
                continue
            intersection = sorted(support & rows[target])
            if len(intersection) > 1:
                result.append({
                    "center": center, "apex": apex, "row": row_name,
                    "target": target, "intersection": intersection,
                })
    return result


def zero_form_index(key: dict[str, object]) -> int | None:
    """Independently replay the first exactly-zero Kalmanson form by DSU."""
    rows, _roles = _key_rows(key)
    edges = tuple(wave1.legacy.distance_edge(a, b)
                  for a, b in itertools.combinations(root.LABELS, 2))
    parent = {edge: edge for edge in edges}

    def find(edge: tuple[int, int]) -> tuple[int, int]:
        if parent[edge] != edge:
            parent[edge] = find(parent[edge])
        return parent[edge]

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left, right = find(left), find(right)
        if left != right:
            parent[max(left, right)] = min(left, right)

    for name in root.ROWS:
        support = rows[name]
        if not support:
            continue
        center = 0 if name in ("K", "L") else 1 if name == "T" else int(name[1:]) if name.startswith("G") else None
        if name == "C0" or name == "C1":
            # C0/C1 centers are carried by their role values.
            center = _roles["b0"] if name == "C0" else _roles["b1"]
        if center is None:
            raise AuditError(f"cannot determine center for row {name}")
        for left, right in itertools.combinations(sorted(support), 2):
            union(wave1.legacy.distance_edge(center, left),
                  wave1.legacy.distance_edge(center, right))

    mirror = key.get("orientation") == "mirror"
    forms = wave1.legacy.kalmanson_forms(root.ORDERS[int(mirror)])
    for index, form in enumerate(forms):
        total: Counter[tuple[int, int]] = Counter()
        total.update(find(wave1.legacy.distance_edge(*edge)) for edge in form["positive"])
        total.subtract(find(wave1.legacy.distance_edge(*edge)) for edge in form["negative"])
        if not any(total.values()):
            return index
    return None


def _assignment(value: object, variable_count: int) -> set[int]:
    if not isinstance(value, list):
        raise AuditError("raw PIQD model must be a literal list")
    signed = []
    for item in value:
        if isinstance(item, bool) or not isinstance(item, int) or item == 0:
            raise AuditError("raw PIQD model contains a nonzero integer literal error")
        if abs(item) > variable_count:
            raise AuditError("raw PIQD model literal exceeds root variable count")
        signed.append(item)
    if len(set(signed)) != len(signed) or any(-item in signed for item in signed):
        raise AuditError("raw PIQD model has duplicate or contradictory literals")
    if len(signed) != variable_count:
        raise AuditError("raw PIQD assignment is incomplete")
    return {item for item in signed if item > 0}


def _model_paths(model_dir: Path) -> list[Path]:
    imported = [model_dir / f"imported-{index:04d}.json" for index in range(1000)]
    fresh = [model_dir / f"model-{index}.json" for index in range(1000, 6001)]
    expected = imported + fresh
    actual = sorted(model_dir.glob("*.json"))
    if sorted(expected) != actual:
        raise AuditError("wave2 model directory is not the exact retained file set")
    return expected


def replay_run(run_root: Path = RUN_ROOT) -> dict[str, object]:
    root_path = run_root / "artifacts/exact13-witnessed-key-effective-root.cnf"
    root_bytes = root_path.read_bytes()
    if sha256_bytes(root_bytes) != EXPECTED_ROOT_SHA256:
        raise AuditError("effective root digest drifted")
    cnf, projection = root.emit_root()
    if len(cnf.names) != 432 or len(cnf.clauses) != 29468:
        raise AuditError("regenerated root dimensions drifted")
    retained_body = b"\n".join(line for line in root_bytes.splitlines() if not line.startswith(b"c ")) + b"\n"
    if retained_body != cnf.dimacs():
        raise AuditError("regenerated root clauses differ from authenticated retained root")
    models = _model_paths(run_root / "events/models")
    source_paths = sorted({Path(__file__).resolve(), Path(root.__file__).resolve(),
                           Path(wave1.__file__).resolve(), Path(wave1.legacy.__file__).resolve(),
                           Path(wave1.legacy.core.__file__).resolve()})
    source_hashes = {str(path.relative_to(Path.cwd())): sha256_bytes(path.read_bytes())
                     for path in source_paths}
    full_clauses = guarded_clauses(cnf)
    nontrivial_clauses = guarded_clauses(cnf, nontrivial=True)
    stream = hashlib.sha256()
    raw_stream = hashlib.sha256()
    guarded_count = 0
    zero_count = 0
    orientation_counts: Counter[str] = Counter()
    violations_by_target: Counter[str] = Counter()
    violation_histogram: Counter[int] = Counter()
    model_hits_by_target: Counter[str] = Counter()
    witnesses: list[dict[str, object]] = []
    counterexample = None
    for expected_index, model_path in enumerate(models):
        model_bytes = model_path.read_bytes()
        model = json.loads(model_bytes, object_pairs_hook=_pairs)
        if not isinstance(model, dict) or model.get("schema") != "cardge13-exact13-witnessed-key-model/v1":
            raise AuditError(f"model certificate schema malformed: {model_path}")
        if model.get("index") != expected_index:
            raise AuditError(f"model index drifted: {model_path}")
        recorded = model.get("event_sha256")
        unsigned = {key: value for key, value in model.items() if key != "event_sha256"}
        if recorded != sha256_bytes(canonical(unsigned)):
            raise AuditError(f"model certificate seal drifted: {model_path}")
        raw_ref = model.get("raw_solve")
        if not isinstance(raw_ref, str):
            raise AuditError(f"model raw_solve reference malformed: {model_path}")
        raw_path = _inside(Path(raw_ref), run_root)
        if not raw_path.exists() or raw_path.parent != (run_root / "events/piqd").resolve():
            raise AuditError(f"raw solve path is not retained under events/piqd: {raw_ref}")
        raw_bytes = raw_path.read_bytes()
        if sha256_bytes(raw_bytes) != model.get("raw_solve_sha256"):
            raise AuditError(f"raw solve digest drifted: {raw_path}")
        raw = json.loads(raw_bytes, object_pairs_hook=_pairs)
        if not isinstance(raw, dict) or raw.get("status") != "SAT":
            raise AuditError(f"raw solve is not SAT: {raw_path}")
        assignment = _assignment(raw.get("model"), len(cnf.names))
        if not cnf.satisfied(assignment):
            raise AuditError(f"root CNF rejects retained model {expected_index}")
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if checks.get("Valid") is not True:
            raise AuditError(f"retained Key is invalid: {model_path}")
        if model.get("projected_key") != key or model.get("key_valid_checks") != checks:
            raise AuditError(f"replayed Key differs from certificate {model_path}")
        if model.get("assignment_positive_literals") != len(assignment):
            raise AuditError(f"assignment count differs from certificate {model_path}")
        if model.get("root_emitted_sha256") != EXPECTED_ROOT_SHA256:
            raise AuditError("model root binding differs from pinned root")
        if model.get("piqd_result_sha256") != raw.get("result_sha256"):
            raise AuditError("model PIQD result binding differs")
        stream.update(model_path.name.encode() + b"\0" + model_bytes)
        raw_stream.update(raw_path.name.encode() + b"\0" + raw_bytes)
        violations = guarded_violations(key)
        for clauses in (full_clauses, nontrivial_clauses):
            satisfied = all(any((lit > 0) == (abs(lit) in assignment) for lit in clause)
                            for clause in clauses)
            if satisfied != (not violations):
                raise AuditError(f"guarded clauses disagree with set predicate: {model_path}")
        guarded_count += bool(not violations)
        violation_histogram[len(violations)] += 1
        model_hits_by_target.update({str(item["target"]) for item in violations})
        for violation in violations:
            violations_by_target[str(violation["target"])] += 1
        if not violations:
            form_index = zero_form_index(key)
            if form_index is None:
                raise AuditError(f"survivor has no one-form cancellation: {model_path}")
            zero_count += 1
            witnesses.append({"model": model_path.name, "form_index": form_index})
        if model_path.name == "imported-0003.json":
            counterexample = {"model": model_path.name, "model_sha256": sha256_bytes(model_bytes),
                              "violations": violations, "root_and_key_valid": True}
        orientation_counts[str(key["orientation"])] += 1
    result: dict[str, object] = {
        "schema": SCHEMA,
        "run_root": str(run_root),
        "root_sha256": sha256_bytes(root_bytes),
        "root_variables": len(cnf.names),
        "root_clauses": len(cnf.clauses),
        "model_count": len(models),
        "guarded_survivor_count": guarded_count,
        "guarded_violation_model_count": len(models) - guarded_count,
        "guarded_violation_occurrence_count": sum(violations_by_target.values()),
        "violations_by_target": dict(sorted(violations_by_target.items())),
        "model_hits_by_target": dict(sorted(model_hits_by_target.items())),
        "violation_histogram": {str(key): value for key, value in sorted(violation_histogram.items())},
        "zero_form_survivor_count": zero_count,
        "zero_form_witnesses": witnesses,
        "root_nonentailment_counterexample": counterexample,
        "orientation_counts": dict(sorted(orientation_counts.items())),
        "guarded_clause_count": len(guarded_clauses(cnf)),
        "guarded_nontrivial_clause_count": len(guarded_clauses(cnf, nontrivial=True)),
        "model_stream_sha256": stream.hexdigest(),
        "expected_model_stream_sha256": EXPECTED_STREAM_SHA256,
        "raw_assignment_stream_sha256": raw_stream.hexdigest(),
        "source_sha256": source_hashes,
        "all_root_and_key_replays_pass": True,
        "all_guarded_clause_predicate_comparisons_pass": True,
        "scope": "retained wave2 models only; no solver, source theorem, or strengthened-root UNSAT claim",
    }
    if result["model_stream_sha256"] != EXPECTED_STREAM_SHA256:
        raise AuditError("retained model stream digest does not match pin")
    if (guarded_count, zero_count, len(models)) != (1569, 1569, EXPECTED_MODEL_COUNT):
        raise AuditError("fixed-corpus acceptance counts differ")
    if source_hashes != {str(path.relative_to(Path.cwd())): sha256_bytes(path.read_bytes())
                         for path in source_paths}:
        raise AuditError("checker sources changed during replay")
    return result


def write_report(path: Path, report: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(canonical(seal(report)) + b"\n")


def verify_report(expected: object, replayed: dict[str, object]) -> None:
    """Check the seal and every replayed field, including witness and source pins."""
    if not isinstance(expected, dict):
        raise AuditError("report is not a JSON object")
    unsigned = {key: value for key, value in expected.items() if key != "event_sha256"}
    if expected.get("event_sha256") != sha256_bytes(canonical(unsigned)):
        raise AuditError("report self-hash differs")
    if unsigned != replayed:
        raise AuditError("checked report differs from independent replay")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-root", type=Path, default=RUN_ROOT)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument("--out", type=Path)
    mode.add_argument("--check", type=Path)
    args = parser.parse_args()
    report = replay_run(args.run_root)
    if args.out is not None:
        write_report(args.out, report)
    if args.check is not None:
        verify_report(load_json(args.check), report)
    print(canonical({key: report[key] for key in (
        "model_count", "guarded_survivor_count", "guarded_violation_model_count",
        "zero_form_survivor_count", "model_stream_sha256")}).decode())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
