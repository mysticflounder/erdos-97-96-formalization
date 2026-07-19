#!/usr/bin/env python3
"""Reconstruct and strengthen the independently verified n=12 outer carrier.

The first strengthening is deliberately only a necessary condition for planar
strict-convex realizability: all strict Kalmanson inequalities for the stored
cyclic order, together with the selected equal-radius row equations.  The
strict homogeneous system is normalized to slack at least one.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from collections import deque
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def pair(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise ValueError("distance pair must have distinct endpoints")
    return (a, b) if a < b else (b, a)


def var(a: int, b: int) -> str:
    i, j = pair(a, b)
    return f"d_{i}_{j}"


def sexpr_sum(terms: list[str]) -> str:
    if len(terms) == 1:
        return terms[0]
    return "(+ " + " ".join(terms) + ")"


def validate_outer(carrier: dict[str, object]) -> dict[str, object]:
    n = int(carrier["n"])
    rows = {int(k): tuple(int(v) for v in values) for k, values in carrier["rows"].items()}
    blockers = {int(k): int(v) for k, v in carrier["blockers"].items()}
    omitted = set(int(v) for v in carrier["omitted_apices"])
    failures: list[str] = []
    if set(rows) != set(range(n)):
        failures.append("row map is not total")
    if set(blockers) != set(range(n)):
        failures.append("blocker map is not total")
    for center, support in rows.items():
        if len(support) != 4 or len(set(support)) != 4:
            failures.append(f"row {center} does not have four distinct targets")
        if center in support:
            failures.append(f"row {center} contains its center")
    for a, b in itertools.combinations(range(n), 2):
        if len(set(rows[a]) & set(rows[b])) > 2:
            failures.append(f"rows {a},{b} intersect in more than two targets")
        codegree = sum(1 for support in rows.values() if a in support and b in support)
        if codegree > 2:
            failures.append(f"pair {a},{b} occurs in more than two rows")
    for center_left, center_right in itertools.combinations(range(n), 2):
        common = set(rows[center_left]) & set(rows[center_right])
        for point_left, point_right in itertools.combinations(
            common - {center_left, center_right}, 2
        ):
            alternates = (center_left < point_left < center_right) != (
                center_left < point_right < center_right
            )
            if not alternates:
                failures.append(
                    f"nonalternating common pair {point_left},{point_right} "
                    f"at centers {center_left},{center_right}"
                )
    for source, blocker in blockers.items():
        if blocker == source or blocker in omitted:
            failures.append(f"blocker {source}->{blocker} hits an omitted apex")
        if source not in rows[blocker]:
            failures.append(f"blocker {source}->{blocker} does not contain source in blocker row")

    # The selected witness digraph must be strongly connected.
    def reachable(start: int, reverse: bool = False) -> set[int]:
        seen = {start}
        todo = deque([start])
        while todo:
            u = todo.popleft()
            if reverse:
                neighbors = [c for c, support in rows.items() if u in support]
            else:
                neighbors = rows[u]
            for v in neighbors:
                if v not in seen:
                    seen.add(v)
                    todo.append(v)
        return seen

    if reachable(0) != set(range(n)) or reachable(0, reverse=True) != set(range(n)):
        failures.append("selected witness digraph is not strongly connected")

    return {
        "status": "VERIFIED" if not failures else "FAILED",
        "failures": failures,
        "n": n,
        "row_count": len(rows),
        "blocker_count": len(blockers),
    }


def write_direct_smt(carrier: dict[str, object], output: Path) -> dict[str, object]:
    n = int(carrier["n"])
    rows = {int(k): tuple(int(v) for v in values) for k, values in carrier["rows"].items()}
    lines = ["(set-logic QF_LRA)", "(set-option :produce-unsat-cores true)"]
    distance_vars = [var(a, b) for a, b in itertools.combinations(range(n), 2)]
    lines.extend(f"(declare-fun {name} () Real)" for name in distance_vars)

    equality_count = 0
    for center in range(n):
        anchor, *tail = rows[center]
        for ordinal, target in enumerate(tail, start=1):
            lines.append(
                f"(assert (! (= {var(center, anchor)} {var(center, target)}) "
                f":named row_{center}_eq_{ordinal}))"
            )
            equality_count += 1

    kalmanson_count = 0
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = sexpr_sum([var(a, c), var(b, d)])
        side_one = sexpr_sum([var(a, b), var(c, d)])
        side_two = sexpr_sum([var(a, d), var(b, c)])
        lines.append(
            f"(assert (! (>= (- {diagonals} {side_one}) 1) "
            f":named kal_{a}_{b}_{c}_{d}_one))"
        )
        lines.append(
            f"(assert (! (>= (- {diagonals} {side_two}) 1) "
            f":named kal_{a}_{b}_{c}_{d}_two))"
        )
        kalmanson_count += 2
    lines.extend(["(check-sat)", "(get-unsat-core)"])
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return {
        "encoding": "direct-pair-distance-qf-lra-v1",
        "distance_variable_count": len(distance_vars),
        "row_equality_count": equality_count,
        "strict_kalmanson_count": kalmanson_count,
        "strict_slack_normalization": 1,
    }


class DSU:
    def __init__(self, items: list[tuple[int, int]]) -> None:
        self.parent = {x: x for x in items}

    def find(self, x: tuple[int, int]) -> tuple[int, int]:
        p = self.parent[x]
        if p != x:
            self.parent[x] = self.find(p)
        return self.parent[x]

    def union(self, a: tuple[int, int], b: tuple[int, int]) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[max(ra, rb)] = min(ra, rb)


def quotient_data(carrier: dict[str, object]) -> tuple[dict[tuple[int, int], str], dict[str, object]]:
    n = int(carrier["n"])
    rows = {int(k): tuple(int(v) for v in values) for k, values in carrier["rows"].items()}
    pairs = list(itertools.combinations(range(n), 2))
    dsu = DSU(pairs)
    for center in range(n):
        incident = [pair(center, target) for target in rows[center]]
        for other in incident[1:]:
            dsu.union(incident[0], other)
    roots = sorted({dsu.find(p) for p in pairs})
    root_name = {root: f"q_{index}" for index, root in enumerate(roots)}
    mapping = {p: root_name[dsu.find(p)] for p in pairs}
    classes: dict[str, list[list[int]]] = {name: [] for name in root_name.values()}
    for p, name in mapping.items():
        classes[name].append(list(p))
    return mapping, {
        "encoding": "row-equality-quotient-qf-lra-v1",
        "original_distance_variable_count": len(pairs),
        "quotient_variable_count": len(roots),
        "classes": classes,
    }


def write_quotient_smt(carrier: dict[str, object], output: Path) -> dict[str, object]:
    n = int(carrier["n"])
    mapping, metadata = quotient_data(carrier)
    names = sorted(set(mapping.values()), key=lambda name: int(name.split("_")[1]))
    lines = ["(set-logic QF_LRA)", "(set-option :produce-unsat-cores true)"]
    lines.extend(f"(declare-fun {name} () Real)" for name in names)
    for a, b, c, d in itertools.combinations(range(n), 4):
        diagonals = sexpr_sum([mapping[pair(a, c)], mapping[pair(b, d)]])
        side_one = sexpr_sum([mapping[pair(a, b)], mapping[pair(c, d)]])
        side_two = sexpr_sum([mapping[pair(a, d)], mapping[pair(b, c)]])
        lines.append(
            f"(assert (! (>= (- {diagonals} {side_one}) 1) "
            f":named qkal_{a}_{b}_{c}_{d}_one))"
        )
        lines.append(
            f"(assert (! (>= (- {diagonals} {side_two}) 1) "
            f":named qkal_{a}_{b}_{c}_{d}_two))"
        )
    lines.extend(["(check-sat)", "(get-unsat-core)"])
    output.write_text("\n".join(lines) + "\n", encoding="utf-8")
    metadata["strict_kalmanson_count"] = 2 * len(list(itertools.combinations(range(n), 4)))
    metadata["strict_slack_normalization"] = 1
    return metadata


def run_solver(command: list[str], timeout: int) -> dict[str, object]:
    started = time.monotonic()
    proc = subprocess.run(command, capture_output=True, text=True, timeout=timeout + 10)
    elapsed = time.monotonic() - started
    verdict = "UNKNOWN"
    for line in proc.stdout.splitlines():
        if line.strip() in {"sat", "unsat", "unknown"}:
            verdict = line.strip().upper()
            break
    return {
        "command": command,
        "returncode": proc.returncode,
        "elapsed_seconds": elapsed,
        "verdict": verdict,
        "stdout": proc.stdout,
        "stderr": proc.stderr,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", required=True, type=Path)
    parser.add_argument("--output-dir", required=True, type=Path)
    parser.add_argument("--timeout", type=int, default=60)
    args = parser.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    source = json.loads(args.source.read_text(encoding="utf-8"))
    if not isinstance(source.get("n"), int) or int(source["n"]) < 5:
        raise AssertionError("expected a saved finite SAT outer carrier")
    if source.get("solver_status") != "SAT":
        raise AssertionError("expected a saved SAT outer carrier")
    n = int(source["n"])

    carrier = {
        "schema": f"p97-n{n}-outer-carrier-v1",
        "source": str(args.source),
        "source_sha256": sha256(args.source),
        "source_encoding_schema": source["encoding_schema"],
        "source_cnf_model_checked": source["cnf_model_checked"],
        "n": source["n"],
        "cyclic_order": list(range(n)),
        "omitted_apices": source["omitted_apices"],
        "rows": source["rows"],
        "blockers": source["blockers"],
    }
    carrier_path = args.output_dir / "carrier.json"
    carrier_path.write_text(json.dumps(carrier, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    outer_check = validate_outer(carrier)
    if outer_check["status"] != "VERIFIED":
        raise AssertionError(outer_check)

    direct_path = args.output_dir / "strict_kalmanson_direct.smt2"
    quotient_path = args.output_dir / "strict_kalmanson_quotient.smt2"
    direct_meta = write_direct_smt(carrier, direct_path)
    quotient_meta = write_quotient_smt(carrier, quotient_path)
    solver_results: dict[str, object] = {}
    for encoding, path in (("direct", direct_path), ("quotient", quotient_path)):
        solver_results[f"z3_{encoding}"] = run_solver(
            ["z3", "-smt2", f"-T:{args.timeout}", str(path)], args.timeout
        )
        solver_results[f"cvc5_{encoding}"] = run_solver(
            ["cvc5", "--lang", "smt2", "--produce-unsat-cores", "--tlimit", str(args.timeout * 1000), str(path)],
            args.timeout,
        )

    payload = {
        "schema": f"p97-n{n}-geometry-regression-check-v1",
        "source_carrier": str(carrier_path),
        "source_carrier_sha256": sha256(carrier_path),
        "outer_replay": outer_check,
        "layer_1": {
            "claim_tested": (
                "selected equal-distance row equations plus every strict Kalmanson inequality "
                "forced by the stored cyclic order"
            ),
            "scope": (
                "Necessary linear consequence of planar strict-convex cyclic realization; "
                "not a sufficient Euclidean realization encoding"
            ),
            "direct_encoding": direct_meta | {"path": str(direct_path), "sha256": sha256(direct_path)},
            "quotient_encoding": quotient_meta | {"path": str(quotient_path), "sha256": sha256(quotient_path)},
            "solver_results": solver_results,
        },
    }
    verdicts = [entry["verdict"] for entry in solver_results.values()]
    if verdicts == ["UNSAT"] * len(verdicts):
        payload["first_failed_layer"] = "PLANAR_STRICT_CONVEX_CYCLIC_REALIZATION"
        payload["conclusion"] = (
            "The outer carrier cannot be realized by points in the stored strict convex cyclic order, "
            "because it already violates a necessary strict Kalmanson distance system."
        )
        payload["layers_not_reached"] = ["MEC_NONOBTUSE_CAP_PLACEMENT", "COMMON_CRITICAL_SHELL_BLOCKER_COUPLING"]
    else:
        payload["first_failed_layer"] = None
        payload["conclusion"] = "No decisive failure at the necessary strict-Kalmanson layer."
    output = args.output_dir / "check_results.json"
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(output), "verdicts": verdicts, "first_failed_layer": payload["first_failed_layer"]}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
