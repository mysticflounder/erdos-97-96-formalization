# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Audit row-existence deletions in the historical aligned-P5 compact CNF.

SAT witnesses concern this fixed Boolean projection, not Euclidean geometry.
UNSAT session replies are diagnostic only: this tool does not produce proofs.
All solving goes through piqd; --check validates saved SAT witnesses without it.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
from pathlib import Path

CNF = Path("scratch/atail-force/unique4-aligned-p5-terminal/core-audit/aligned_p5_compact.cnf")
CNF_SHA256 = "081ba956b308c643fa9e845e0340017647de405aea42e6d0601679a1267f12f4"
NUM_VARS = 15192
NUM_CLAUSES = 27781
SCHEMA = "aligned-p5-row-requirements/v1"


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_formula(path: Path = CNF) -> list[tuple[int, ...]]:
    raw = path.read_bytes()
    if sha256(raw) != CNF_SHA256:
        raise ValueError("compact CNF hash mismatch")
    clauses = []
    header = None
    for line in raw.decode().splitlines():
        if not line or line.startswith("c"):
            continue
        if line.startswith("p"):
            if header is not None or line.split() != ["p", "cnf", str(NUM_VARS), str(NUM_CLAUSES)]:
                raise ValueError("unexpected DIMACS header")
            header = line
            continue
        numbers = tuple(map(int, line.split()))
        if not numbers or numbers[-1] != 0 or any(not 0 < abs(v) <= NUM_VARS for v in numbers[:-1]):
            raise ValueError("malformed clause")
        clauses.append(numbers[:-1])
    if header is None or len(clauses) != NUM_CLAUSES:
        raise ValueError("wrong clause count")
    return clauses


def row_requirement(clause: tuple[int, ...]) -> int | None:
    """m(center, point) has variable ID 1 + 11*center + point."""
    if len(clause) != 7 or any(not 1 <= v <= 121 for v in clause):
        return None
    centers = {(v - 1) // 11 for v in clause}
    if len(centers) != 1:
        return None
    center = centers.pop()
    points = {(v - 1) % 11 for v in clause}
    if len(points) != 7 or center in points:
        raise ValueError("malformed row-existence clause")
    return center


def validate_requirements(clauses: list[tuple[int, ...]]) -> None:
    for center in range(11):
        actual = [tuple(sorted(q)) for q in clauses if row_requirement(q) == center]
        expected = set(itertools.combinations([1 + 11 * center + p for p in range(11) if p != center], 7))
        if len(actual) != 120 or set(actual) != expected:
            raise ValueError(f"row {center} does not have exactly its 120 at-least-four clauses")


def guarded_formula(clauses: list[tuple[int, ...]]) -> list[tuple[int, ...]]:
    return [q if (c := row_requirement(q)) is None else (-(NUM_VARS + 1 + c), *q) for q in clauses]


def validate_model(clauses: list[tuple[int, ...]], dropped: list[int], true_literals: list[int]) -> list[list[int]]:
    if len(dropped) != len(set(dropped)) or any(type(c) is not int or not 0 <= c < 11 for c in dropped):
        raise ValueError("invalid dropped centers")
    if len(true_literals) != len(set(true_literals)) or any(type(v) is not int or not 1 <= v <= NUM_VARS for v in true_literals):
        raise ValueError("invalid true-literal model")
    truth = set(true_literals)
    for index, clause in enumerate(clauses):
        if row_requirement(clause) in dropped:
            continue
        if not any((v in truth) if v > 0 else (-v not in truth) for v in clause):
            raise ValueError(f"model fails retained input clause {index + 1}")
    rows = [[p for p in range(11) if 1 + 11 * c + p in truth] for c in range(11)]
    for center, row in enumerate(rows):
        if center in row or len(row) > 4 or (center not in dropped and len(row) != 4):
            raise ValueError(f"decoded row {center} violates retained cardinality/nonself")
    return rows


def check_report(report: dict, clauses: list[tuple[int, ...]]) -> int:
    if report.get("schema") != SCHEMA or report.get("input_sha256") != CNF_SHA256:
        raise ValueError("wrong report identity")
    queries = report.get("queries")
    if not isinstance(queries, list) or not queries:
        raise ValueError("report requires nonempty queries")
    count = 0
    seen = set()
    for query in queries:
        if query.get("status") not in {"SAT", "UNSAT", "UNKNOWN"}:
            raise ValueError("unknown query status")
        dropped = query.get("dropped_centers")
        if not isinstance(dropped, list) or any(type(c) is not int or not 0 <= c < 11 for c in dropped) or len(set(dropped)) != len(dropped):
            raise ValueError("invalid dropped centers")
        key = tuple(sorted(dropped))
        if key in seen:
            raise ValueError("duplicate query")
        seen.add(key)
        if query["status"] == "SAT":
            rows = validate_model(clauses, query["dropped_centers"], query["true_literals"])
            if rows != query["rows"]:
                raise ValueError("decoded row report mismatch")
            count += 1
    return count


def piqc(*args: str, timeout: int = 90) -> dict:
    result = subprocess.run(["piqc", *args], capture_output=True, text=True, timeout=timeout, check=True)
    return json.loads(result.stdout)


def write_json(path: Path, value: dict) -> None:
    path.write_text(json.dumps(value, indent=2) + "\n")


def run_queries(root: Path, clauses: list[tuple[int, ...]], timeout_ms: int) -> dict:
    guarded = guarded_formula(clauses)
    used_variables = {abs(v) for clause in clauses for v in clause}
    formula_path = root / "tmp" / "row-guarded.cnf"
    formula_path.write_text(f"p cnf {NUM_VARS + 11} {len(guarded)}\n" + "".join(" ".join(map(str, q)) + " 0\n" for q in guarded))
    session = piqc("session", "new", "--solver", "piqd-satworker-cadical-3.0.1", "--lane", "sat", "--label", "native-card11-aligned-p5-20260906")
    write_json(root / "events" / "session.json", session)
    session_id = session["id"]
    report = {"schema": SCHEMA, "scope": "fixed compact Boolean projection; no Euclidean or Lean closure claim", "input_path": str(CNF), "input_sha256": CNF_SHA256, "script_sha256": sha256(Path(__file__).read_bytes()), "guarded_sha256": sha256(formula_path.read_bytes()), "solver": session, "timeout_ms": timeout_ms, "queries": []}
    try:
        added = piqc("session", "add", session_id, "--file", str(formula_path))
        write_json(root / "events" / "added.json", added)
        # Apex-only first, then independently drop each non-first-apex row.
        for dropped in [[1, 2, 3, 5, 6, 7, 9, 10], *[[c] for c in range(1, 11)]]:
            assumptions = [-(NUM_VARS + 1 + c) if c in dropped else NUM_VARS + 1 + c for c in range(11)]
            args = ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)]
            for literal in assumptions:
                args += ["--assume", str(literal)]
            result = piqc(*args, timeout=timeout_ms // 1000 + 60)
            query = {"dropped_centers": dropped, "status": result["status"], "solve_ms": result.get("solve_ms"), "solve_index": result.get("solve_index"), "result_sha256": result.get("result_sha256")}
            write_json(root / "events" / f"solve-{len(report['queries']):02}.json", result)
            if result["status"] == "SAT":
                signed = result["model"]
                if any(type(v) is not int or not 1 <= abs(v) <= NUM_VARS + 11 for v in signed) or len({abs(v) for v in signed}) != len(signed):
                    raise ValueError("conflicting solver model")
                true_literals = sorted(v for v in signed if v > 0 and v in used_variables)
                truth = {v for v in signed if v > 0}
                if any(a not in truth for a in assumptions if a > 0) or any(-a in truth for a in assumptions if a < 0):
                    raise ValueError("solver model violates activation assumptions")
                query["true_literals"] = true_literals
                query["rows"] = validate_model(clauses, dropped, true_literals)
            elif result["status"] == "UNSAT":
                query["proof_status"] = "unverified incremental diagnostic; not a retained proof"
            report["queries"].append(query)
            write_json(root / "artifacts" / "row-requirements.json", report)
            print(f"drop={dropped} {query['status']} {query['solve_ms']}ms", flush=True)
    finally:
        write_json(root / "events" / "closed.json", piqc("session", "close", session_id))
    return report


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", type=Path)
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--timeout-ms", type=int, default=30000)
    args = parser.parse_args()
    clauses = read_formula()
    validate_requirements(clauses)
    if args.check:
        count = check_report(json.loads(args.check.read_text()), clauses)
        print(f"PASS: {count} SAT witnesses satisfy all retained clauses and decoded row requirements")
    elif args.run_root:
        if not 1 <= args.timeout_ms <= 60000:
            parser.error("timeout must be 1..60000 ms")
        run_queries(args.run_root, clauses, args.timeout_ms)
    else:
        parser.error("provide --check or --run-root")


if __name__ == "__main__":
    main()
