# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Test the three-apex relaxation with every strict Kalmanson inequality.

An exact SAT replay is a linear-distance countermodel, not a Euclidean one.
The query keeps the first-apex class exact and permits larger classes at 4,8.
"""

from __future__ import annotations

import argparse
import json
import re
from fractions import Fraction
from itertools import combinations
from pathlib import Path

from audit_aligned_p5_row_requirements import piqc, sha256, write_json

CAPS = [({0, 1, 2, 3, 4}, {0, 4}), ({4, 5, 6, 7, 8}, {4, 8}), ({8, 9, 10, 0}, {8, 0})]
EDGES = list(combinations(range(11), 2))


def edge(a: int, b: int) -> str:
    a, b = sorted((a, b))
    return f"d_{a}_{b}"


def domains(center: int) -> list[tuple[int, ...]]:
    result = []
    for support in combinations([p for p in range(11) if p != center], 4):
        if center == 0 and not {5, 6, 7} <= set(support):
            continue
        if all(center not in cap or len(set(support) & cap) <= (1 if center in ends else 2) for cap, ends in CAPS):
            result.append(support)
    return result


def query() -> tuple[str, list[str]]:
    names = [edge(a, b) for a, b in EDGES] + ["r_0", "r_4", "r_8"]
    lines = ["(set-logic QF_LRA)", *[f"(declare-const {n} Real)" for n in names]]
    for a, b in EDGES:
        lines.append(f"(assert (>= {edge(a,b)} 1))")
    # All inequalities are homogeneous and strictly feasible solutions can be
    # rescaled so that their finitely many positive gaps are at least one.
    for a, b, c, d in combinations(range(11), 4):
        diagonal = f"(+ {edge(a,c)} {edge(b,d)})"
        for lhs in [f"(+ {edge(a,b)} {edge(c,d)})", f"(+ {edge(a,d)} {edge(b,c)})"]:
            lines.append(f"(assert (>= (- {diagonal} {lhs}) 1))")
    for a, b, c in combinations(range(11), 3):
        for x, y, z in [(a, b, c), (a, c, b), (b, c, a)]:
            lines.append(f"(assert (>= (- (+ {edge(x,z)} {edge(y,z)}) {edge(x,y)}) 1))")
    for center in [0, 4, 8]:
        alternatives = []
        for support in domains(center):
            facts = [f"(= {edge(center,p)} r_{center})" for p in support]
            if center == 0:
                facts += [f"(not (= {edge(center,p)} r_{center}))" for p in range(1, 11) if p not in support]
            alternatives.append("(and " + " ".join(facts) + ")")
        lines.append("(assert (or " + " ".join(alternatives) + "))")
    return "\n".join(lines) + "\n", names


def parse_values(text: str, names: list[str]) -> dict[str, Fraction]:
    tokens = iter(re.findall(r"\(|\)|[^\s()]+", text))

    def parse(token):
        if token != "(":
            return token
        result = []
        for next_token in tokens:
            if next_token == ")":
                return result
            result.append(parse(next_token))
        raise ValueError("unterminated expression")

    def rational(expr):
        if isinstance(expr, str):
            return Fraction(expr)
        if len(expr) == 3 and expr[0] == "/":
            return rational(expr[1]) / rational(expr[2])
        if len(expr) == 2 and expr[0] == "-":
            return -rational(expr[1])
        raise ValueError("unexpected rational expression")

    pairs = parse(next(tokens))
    if next(tokens, None) is not None or len(pairs) != len(names):
        raise ValueError("malformed value list")
    values = {name: rational(value) for name, value in pairs}
    if set(values) != set(names):
        raise ValueError("missing or duplicate values")
    return values


def replay(values: dict[str, Fraction], minimum: Fraction = Fraction(1)) -> dict:
    def distance(a, b):
        return values[edge(a, b)]
    gaps = [distance(a, b) for a, b in EDGES]
    for a, b, c, d in combinations(range(11), 4):
        diagonal = distance(a, c) + distance(b, d)
        gaps += [diagonal - distance(a, b) - distance(c, d), diagonal - distance(a, d) - distance(b, c)]
    for a, b, c in combinations(range(11), 3):
        gaps += [distance(a, b) + distance(a, c) - distance(b, c), distance(a, b) + distance(b, c) - distance(a, c), distance(a, c) + distance(b, c) - distance(a, b)]
    if min(gaps) <= 0 or min(gaps) < minimum:
        raise ValueError("distance positivity, triangle, or Kalmanson gap failed")
    rows = {}
    for center in [0, 4, 8]:
        complete = {p for p in range(11) if p != center and distance(center, p) == values[f"r_{center}"]}
        matches = [list(s) for s in domains(center) if set(s) <= complete]
        if not matches or (center == 0 and len(complete) != 4):
            raise ValueError("apex row or exact first class failed")
        rows[str(center)] = {"selected_support": matches[0], "complete_class": sorted(complete)}
    return {"minimum_gap": str(min(gaps)), "kalmanson_count": 660, "triangle_count": 495, "rows": rows}


def replay_radius_constraints(values: dict[str, Fraction]) -> dict:
    classes = {}
    for center in range(11):
        groups = {}
        for p in range(11):
            if p != center:
                groups.setdefault(values[edge(center, p)], set()).add(p)
        classes[center] = list(groups.values())
        for support in groups.values():
            for cap, ends in CAPS:
                if center in cap and len(support & cap) > (1 if center in ends else 2):
                    raise ValueError("complete radius class violates own-cap bound")
    shared_pairs = []
    for left, right in combinations(range(11), 2):
        for a in classes[left]:
            for b in classes[right]:
                common = sorted(a & b)
                if len(common) > 2:
                    raise ValueError("two radius classes share more than two points")
                if len(common) == 2:
                    x, y = common
                    if (left < x < right) == (left < y < right):
                        raise ValueError("common pair does not separate its centers")
                    shared_pairs.append([left, right, x, y])
    for a, b in combinations(range(11), 2):
        centers = [c for c in range(11) if c not in (a, b) and values[edge(c, a)] == values[edge(c, b)]]
        if len(centers) > 2:
            raise ValueError("pair has more than two equidistant centers")
    nontrivial = {str(c): [sorted(s) for s in groups if len(s) > 1] for c, groups in classes.items() if any(len(s) > 1 for s in groups)}
    expected = {str(c): [replay(values, Fraction(0))["rows"][str(c)]["complete_class"]] for c in [0, 4, 8]}
    if nontrivial != expected:
        raise ValueError("unexpected nontrivial radius class")
    return {"nontrivial_classes": nontrivial, "shared_pairs": shared_pairs, "nonapex_classes_all_singletons": True}


def ptolemy_failure(values: dict[str, Fraction]) -> dict:
    left = values[edge(0, 5)] * values[edge(2, 6)]
    right = values[edge(0, 2)] * values[edge(5, 6)] + values[edge(0, 6)] * values[edge(2, 5)]
    if left <= right:
        raise ValueError("specified Ptolemy violation is absent")
    return {"quadruple": [0, 2, 5, 6], "diagonal_product": str(left), "opposite_product_sum": str(right), "violation": str(left - right)}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--run-root", type=Path)
    parser.add_argument("--report", type=Path)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if not args.run_root and not (args.check and args.report):
        parser.error("provide --run-root, or --check --report")
    out = args.report or args.run_root / "artifacts" / "apex-metric.json"
    script, names = query()
    if args.check:
        report = json.loads(out.read_text())
        if report.get("schema") != "aligned-p5-apex-metric/v1" or report["query_sha256"] != sha256(script.encode()) or report["status"] != "SAT":
            raise ValueError("not a matching SAT report")
        if replay({k: Fraction(v) for k, v in report["values"].items()}) != report["replay"]:
            raise ValueError("replay drift")
        if "perturbed" in report:
            perturbed = report["perturbed"]
            values = {k: Fraction(v) for k, v in perturbed["values"].items()}
            expected_values = {k: Fraction(v) for k, v in report["values"].items()}
            for name in [edge(0, 4), edge(8, 10)]:
                expected_values[name] += Fraction(1, 100)
            if values != expected_values or replay(values, Fraction(0)) != perturbed["replay"] or replay_radius_constraints(values) != perturbed["radius_constraints"] or ptolemy_failure(values) != perturbed["ptolemy_failure"]:
                raise ValueError("perturbed witness replay failed")
        print("PASS exact rational apex metric replay")
        return
    path = args.run_root / "tmp" / "apex-metric.smt2"
    path.write_text(script)
    session = piqc("session", "new", "--solver", "cvc5", "--lane", "smt", "--label", "native-card11-aligned-p5-apex-metric")
    session_id = session["id"]
    try:
        piqc("session", "assert", session_id, "--expect-commands", "0", "--file", str(path))
        value_args = [part for name in names for part in ["--value", name]]
        solved = piqc("session", "solve", session_id, "--timeout-ms", "30000", *value_args)
        report = {"schema": "aligned-p5-apex-metric/v1", "query_sha256": sha256(script.encode()), "script_sha256": sha256(Path(__file__).read_bytes()), "session": session, "status": solved["status"], "solve": solved, "scope": "three-apex linear-distance relaxation, not a Euclidean or global-K4 model"}
        if solved["status"] == "SAT":
            values = parse_values(solved["values"], names)
            report["values"] = {k: str(v) for k, v in values.items()}
            report["replay"] = replay(values)
        write_json(out, report)
        print(solved["status"], report.get("replay", {}))
    finally:
        piqc("session", "close", session_id)


if __name__ == "__main__":
    main()
