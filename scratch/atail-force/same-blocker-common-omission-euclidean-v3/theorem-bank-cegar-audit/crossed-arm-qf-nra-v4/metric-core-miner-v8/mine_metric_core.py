#!/usr/bin/env python3
"""Fail-closed QF_NRA miner for induced subsets of replayed v8/v9 witnesses.

The only geometric assumptions sent to Z3 are:

* equalities inherited from the witness's *global* undirected-edge closure;
* pairwise distinctness of the selected points; and
* a similarity gauge fixing one selected edge to (0,0)--(1,0).

UNKNOWN is terminal for an individual query and is never cached as UNSAT.
Floating-point Jacobian ranks are used only to prioritize queries.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import platform
import subprocess
import tempfile
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable, Sequence

import numpy as np
import sympy as sp
import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[5]
DEFAULT_WITNESS = (
    HERE.parents[1]
    / "crossed-arm-audit"
    / "source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s"
    / "witness.json"
)
PRODUCTION_MATCHER = ROOT / "census/global_confinement/metric_realizability_probe.py"
SCHEMA = "crossed-arm-global-edge-closure-metric-core-miner-v2"
SOURCE_SCHEMAS = {
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v8",
    "n17-crossed-outside-pair-full-metric-theorem-bank-cegar-v9",
}
REPLAY_FIELDS = (
    "cap_block_position_replay",
    "cap_crossing_kalmanson_replay",
    "crossed_arm_replay",
    "full_shared_pair_separation_replay",
    "geometric_incidence_replay",
)

Edge = tuple[str, str]
Atom = tuple[Edge, Edge]


def edge(a: str, b: str) -> Edge:
    if a == b:
        raise ValueError(f"loop edge {a}")
    return (a, b) if a < b else (b, a)


class UnionFind:
    def __init__(self, values: Iterable[Edge]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: Edge) -> Edge:
        root = self.parent[value]
        if root != value:
            self.parent[value] = self.find(root)
        return self.parent[value]

    def union(self, left: Edge, right: Edge) -> None:
        a, b = self.find(left), self.find(right)
        if a != b:
            if b < a:
                a, b = b, a
            self.parent[b] = a


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"))


def sha256_json(value: Any) -> str:
    return hashlib.sha256(canonical_json(value).encode()).hexdigest()


def build_closure(witness: dict[str, Any]) -> tuple[tuple[str, ...], tuple[tuple[Edge, ...], ...], list[dict[str, Any]]]:
    points = tuple(sorted(witness["radius_classes"]))
    if set(points) != {p for classes in witness["radius_classes"].values() for cls in classes for p in cls}:
        raise ValueError("radius_classes do not use exactly their center label universe")
    uf = UnionFind(edge(a, b) for a, b in itertools.combinations(points, 2))
    generators: list[dict[str, Any]] = []
    for center in points:
        seen: set[str] = set()
        for class_index, radius_class in enumerate(witness["radius_classes"][center]):
            if center in radius_class or seen.intersection(radius_class):
                raise ValueError(f"bad radius partition at {center}")
            seen.update(radius_class)
            if len(radius_class) < 2:
                continue
            anchor = edge(center, radius_class[0])
            for point in radius_class[1:]:
                other = edge(center, point)
                uf.union(anchor, other)
                generators.append(
                    {
                        "center": center,
                        "class_index": class_index,
                        "left_edge": list(anchor),
                        "right_edge": list(other),
                    }
                )
        if seen != set(points) - {center}:
            raise ValueError(f"radius classes at {center} are not a partition")
    groups: dict[Edge, list[Edge]] = {}
    for a, b in itertools.combinations(points, 2):
        e = edge(a, b)
        groups.setdefault(uf.find(e), []).append(e)
    nontrivial = tuple(
        sorted((tuple(sorted(group)) for group in groups.values() if len(group) > 1), key=lambda g: (g[0], len(g), g))
    )
    return points, nontrivial, generators


def induced_atoms(selected: Sequence[str], closure_groups: Sequence[Sequence[Edge]]) -> tuple[Atom, ...]:
    selected_set = set(selected)
    atoms: list[Atom] = []
    for group in closure_groups:
        inherited = sorted(e for e in group if set(e) <= selected_set)
        if len(inherited) >= 2:
            anchor = inherited[0]
            atoms.extend((anchor, other) for other in inherited[1:])
    return tuple(atoms)


def atom_record(atom: Atom) -> dict[str, list[str]]:
    return {"left_edge": list(atom[0]), "right_edge": list(atom[1])}


def atom_text(atom: Atom) -> str:
    return f"d2({atom[0][0]},{atom[0][1]}) = d2({atom[1][0]},{atom[1][1]})"


def choose_gauge(points: Sequence[str], atoms: Sequence[Atom]) -> Edge:
    degree: dict[Edge, int] = {edge(a, b): 0 for a, b in itertools.combinations(points, 2)}
    for left, right in atoms:
        degree[left] += 1
        degree[right] += 1
    return min(degree, key=lambda e: (-degree[e], e))


@dataclass(frozen=True)
class Query:
    points: tuple[str, ...]
    atoms: tuple[Atom, ...]
    gauge: Edge


def make_query(points: Sequence[str], closure_groups: Sequence[Sequence[Edge]]) -> Query:
    selected = tuple(sorted(points))
    atoms = induced_atoms(selected, closure_groups)
    return Query(selected, atoms, choose_gauge(selected, atoms))


def solve_query(query: Query, timeout_ms: int, *, want_smt2: bool = False) -> dict[str, Any]:
    solver = z3.SolverFor("QF_NRA")
    solver.set("timeout", timeout_ms)
    xs = {p: z3.Real(f"x_{p}") for p in query.points}
    ys = {p: z3.Real(f"y_{p}") for p in query.points}

    def d2(e: Edge) -> z3.ArithRef:
        a, b = e
        return (xs[a] - xs[b]) ** 2 + (ys[a] - ys[b]) ** 2

    equalities = [d2(left) == d2(right) for left, right in query.atoms]
    distinctness = [d2(edge(a, b)) > 0 for a, b in itertools.combinations(query.points, 2)]
    ga, gb = query.gauge
    gauge_constraints = [xs[ga] == 0, ys[ga] == 0, xs[gb] == 1, ys[gb] == 0]
    constraints = equalities + distinctness + gauge_constraints
    solver.add(constraints)
    started = time.monotonic()
    verdict = solver.check()
    elapsed = time.monotonic() - started
    record: dict[str, Any] = {
        "points": list(query.points),
        "point_count": len(query.points),
        "equality_count": len(query.atoms),
        "distinctness_count": len(distinctness),
        "gauge": [ga, gb],
        "timeout_ms": timeout_ms,
        "elapsed_s": elapsed,
        "verdict": str(verdict).upper(),
    }
    if verdict == z3.unknown:
        record["unknown_reason"] = solver.reason_unknown()
    elif verdict == z3.sat:
        model = solver.model()
        replay = [z3.is_true(model.eval(c, model_completion=True)) for c in constraints]
        record["model_replay"] = {
            "all_constraints_true": all(replay),
            "true_count": sum(replay),
            "constraint_count": len(replay),
        }
        record["model"] = {
            p: {
                "x": str(model.eval(xs[p], model_completion=True)),
                "y": str(model.eval(ys[p], model_completion=True)),
            }
            for p in query.points
        }
    if want_smt2:
        record["smt2"] = solver.to_smt2() + "\n(check-sat)\n"
    return record


def smoke_tests(timeout_ms: int) -> dict[str, Any]:
    # An equilateral triangle is realizable; four pairwise-equidistant distinct
    # points are not realizable in R^2.
    tri_edges = tuple(itertools.combinations(("a", "b", "c"), 2))
    triangle = Query(("a", "b", "c"), ((tri_edges[0], tri_edges[1]), (tri_edges[0], tri_edges[2])), ("a", "b"))
    k4_edges = tuple(itertools.combinations(("a", "b", "c", "d"), 2))
    k4 = Query(("a", "b", "c", "d"), tuple((k4_edges[0], e) for e in k4_edges[1:]), ("a", "b"))
    sat_record = solve_query(triangle, timeout_ms)
    unsat_record = solve_query(k4, timeout_ms)
    passed = sat_record["verdict"] == "SAT" and unsat_record["verdict"] == "UNSAT"
    if not passed:
        raise RuntimeError(f"smoke tests failed: {sat_record['verdict']}, {unsat_record['verdict']}")
    return {"passed": True, "equilateral_triangle": sat_record, "equal_k4": unsat_record}


def algebra_smoke_tests(timeout_s: float) -> dict[str, Any]:
    tri_edges = tuple(itertools.combinations(("a", "b", "c"), 2))
    triangle = Query(("a", "b", "c"), ((tri_edges[0], tri_edges[1]), (tri_edges[0], tri_edges[2])), ("a", "b"))
    k4_edges = tuple(itertools.combinations(("a", "b", "c", "d"), 2))
    k4 = Query(("a", "b", "c", "d"), tuple((k4_edges[0], e) for e in k4_edges[1:]), ("a", "b"))
    sat_side = singular_classify(triangle, timeout_s)
    unsat_side = singular_classify(k4, timeout_s)
    passed = sat_side["verdict"] == "NONUNIT" and unsat_side["verdict"] == "UNIT"
    if not passed:
        raise RuntimeError(f"Singular smoke tests failed: {sat_side['verdict']}, {unsat_side['verdict']}")
    return {"passed": True, "equilateral_triangle": sat_side, "equal_k4": unsat_side}


def numerical_rank(query: Query) -> dict[str, Any]:
    """Heuristic Jacobian rank at a deterministic non-solution sample."""
    n = len(query.points)
    index = {p: i for i, p in enumerate(query.points)}
    values = np.array([
        math.sin(0.73 * (i + 1)) + 0.11 * i if axis == 0 else math.cos(1.17 * (i + 1)) - 0.07 * i
        for i in range(n)
        for axis in range(2)
    ])
    rows = []
    for left, right in query.atoms:
        row = np.zeros(2 * n)
        for sign, (a, b) in ((1.0, left), (-1.0, right)):
            ia, ib = index[a], index[b]
            dx = values[2 * ia] - values[2 * ib]
            dy = values[2 * ia + 1] - values[2 * ib + 1]
            row[2 * ia] += sign * 2 * dx
            row[2 * ib] -= sign * 2 * dx
            row[2 * ia + 1] += sign * 2 * dy
            row[2 * ib + 1] -= sign * 2 * dy
        rows.append(row)
    rank = int(np.linalg.matrix_rank(np.array(rows))) if rows else 0
    dof_after_gauge = 2 * n - 4
    return {
        "jacobian_rank": rank,
        "dof_after_gauge": dof_after_gauge,
        "generic_overdetermination": rank - dof_after_gauge,
        "heuristic_only": True,
    }


def candidate_subsets(points: Sequence[str], closure_groups: Sequence[Sequence[Edge]], witness: dict[str, Any], per_size: int) -> list[dict[str, Any]]:
    packet = witness["packet"]
    role_points: set[str] = {
        packet["Q.source"], packet["Q.otherOutsidePoint"], packet["bp"], packet["bq"], packet["br"]
    }
    for key, value in packet.items():
        if isinstance(value, list):
            role_points.update(p for p in value if p in points)
    cyclic = witness["existential_cyclic_order"]
    cyclic_order = cyclic.get("order", cyclic) if isinstance(cyclic, dict) else cyclic
    order_rank = {p: i for i, p in enumerate(cyclic_order)}
    candidates: list[dict[str, Any]] = []
    for size in range(4, min(12, len(points)) + 1):
        scored: list[tuple[tuple[int, int, int, tuple[str, ...]], dict[str, Any]]] = []
        for subset in itertools.combinations(points, size):
            query = make_query(subset, closure_groups)
            equality_points = {p for atom in query.atoms for e in atom for p in e}
            role_count = len(set(subset) & role_points)
            cyclic_span = max((order_rank.get(p, 0) for p in subset), default=0) - min((order_rank.get(p, 0) for p in subset), default=0)
            score = (len(query.atoms), len(equality_points), role_count, tuple(subset))
            scored.append((score, {"query": query, "role_count": role_count, "cyclic_span": cyclic_span}))
        scored.sort(key=lambda item: item[0], reverse=True)
        candidates.extend(item for _, item in scored[:per_size])
    candidates.sort(
        key=lambda item: (
            -numerical_rank(item["query"])["generic_overdetermination"],
            len(item["query"].points),
            -len(item["query"].atoms),
            -item["role_count"],
            item["query"].points,
        )
    )
    return candidates


def minimize_points(query: Query, closure_groups: Sequence[Sequence[Edge]], timeout_ms: int, log: list[dict[str, Any]]) -> Query:
    current = query
    changed = True
    while changed:
        changed = False
        for point in current.points:
            if len(current.points) <= 4:
                break
            candidate = make_query([p for p in current.points if p != point], closure_groups)
            result = solve_query(candidate, timeout_ms)
            log.append({"phase": "point-delete", "deleted": point, **{k: v for k, v in result.items() if k != "model"}})
            if result["verdict"] == "UNSAT":
                current = candidate
                changed = True
                break
    return current


def minimize_atoms(query: Query, timeout_ms: int, log: list[dict[str, Any]]) -> Query:
    atoms = list(query.atoms)
    index = 0
    while index < len(atoms):
        candidate_atoms = tuple(atoms[:index] + atoms[index + 1 :])
        candidate = Query(query.points, candidate_atoms, choose_gauge(query.points, candidate_atoms))
        result = solve_query(candidate, timeout_ms)
        log.append({"phase": "atom-delete", "deleted": atom_text(atoms[index]), **{k: v for k, v in result.items() if k != "model"}})
        if result["verdict"] == "UNSAT":
            atoms.pop(index)
        else:
            index += 1
    return Query(query.points, tuple(atoms), choose_gauge(query.points, atoms))


def production_signature_match(query: Query) -> dict[str, Any]:
    """Run the production equality-only closure signatures on these atoms."""
    import sys

    sys.path.insert(0, str(ROOT))
    from census.global_confinement import metric_realizability_probe as metric

    local = {p: i for i, p in enumerate(query.points)}
    closure = metric._EdgeClosure(len(query.points))
    for left, right in query.atoms:
        closure.union(metric._edge(local[left[0]], local[left[1]]), metric._edge(local[right[0]], local[right[1]]))
    index = metric._closure_circle_index(closure, len(query.points))
    checks = [
        ("equality-duplicate-center", metric._duplicate_center_core_from_closure),
        ("equality-equal-k4", metric._equal_k4_core_from_closure),
        ("equality-equilateral-bisector-collision", metric._equilateral_bisector_collision_core_from_closure),
        ("equality-three-triad-collision", metric._three_triad_collision_core_from_closure),
        ("equality-surplus-source-collision", metric._surplus_source_collision_core_from_closure),
        ("equality-six-row-anchor-collision", metric._six_row_anchor_collision_core_from_closure),
        ("equality-six-point-two-pair-collision", metric._six_point_two_pair_collision_core_from_closure),
        ("equality-six-point-five-circle-collision-a", metric._six_point_five_circle_collision_core_a_from_closure),
        ("equality-six-point-five-circle-collision-b", metric._six_point_five_circle_collision_core_b_from_closure),
        ("equality-six-point-five-circle-collision-c", metric._six_point_five_circle_collision_core_c_from_closure),
        ("equality-seven-point-five-circle-collision", metric._seven_point_five_circle_collision_core_from_closure),
        ("equality-eight-point-five-circle-collision", metric._eight_point_five_circle_collision_core_from_closure),
        ("equality-six-point-circle-chain-collision", metric._six_point_circle_chain_collision_core_from_closure),
        ("equality-seven-point-six-circle-collision", metric._seven_point_six_circle_collision_core_from_closure),
        ("equality-seven-point-six-circle-collision-b", metric._seven_point_six_circle_collision_core_b_from_closure),
        ("equality-seven-point-twin-four-circle-collision", metric._seven_point_twin_four_circle_collision_core_from_closure),
        ("equality-seven-point-orbit-collision", metric._seven_point_orbit_collision_core_from_closure),
        ("equality-seven-point-circle-network-collision", metric._seven_point_circle_network_collision_core_from_closure),
    ]
    matches = []
    for name, check in checks:
        core = check(closure, len(query.points), index=index)
        if core is not None:
            matches.append({"stage": name, "core_local_indices": core})
    return {
        "matcher_source": str(PRODUCTION_MATCHER.relative_to(ROOT)),
        "matcher_sha256": hashlib.sha256(PRODUCTION_MATCHER.read_bytes()).hexdigest(),
        "scope": "production equality-only closure signatures; excludes exactness and convex-order signatures absent from this QF_NRA formula",
        "matches": matches,
    }


def cvc5_crosscheck(smt2: str, timeout_ms: int) -> dict[str, Any]:
    started = time.monotonic()
    try:
        proc = subprocess.run(
            [
                "cvc5", "--lang", "smt2", "--force-logic=QF_NRA",
                "--nl-cov", "--tlimit", str(timeout_ms),
            ],
            input=smt2,
            capture_output=True,
            text=True,
            timeout=timeout_ms / 1000 + 30,
            check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
        return {"verdict": "UNKNOWN", "error": type(exc).__name__, "elapsed_s": time.monotonic() - started}
    verdict = "UNKNOWN"
    for line in proc.stdout.splitlines():
        if line.strip() in ("sat", "unsat", "unknown"):
            verdict = line.strip().upper()
            break
    return {
        "verdict": verdict,
        "elapsed_s": time.monotonic() - started,
        "returncode": proc.returncode,
        "stderr_tail": proc.stderr[-1000:],
    }


def exact_polynomial_system(query: Query) -> tuple[list[sp.Symbol], list[sp.Expr]]:
    """Substitute the similarity gauge and expand the equality polynomials."""
    ga, gb = query.gauge
    xs = {
        p: sp.Integer(0) if p == ga else sp.Integer(1) if p == gb else sp.Symbol(f"x_{p}")
        for p in query.points
    }
    ys = {
        p: sp.Integer(0) if p in query.gauge else sp.Symbol(f"y_{p}")
        for p in query.points
    }

    def d2(e: Edge) -> sp.Expr:
        a, b = e
        return sp.expand((xs[a] - xs[b]) ** 2 + (ys[a] - ys[b]) ** 2)

    polynomials = [sp.expand(d2(left) - d2(right)) for left, right in query.atoms]
    variables = sorted(set().union(*(p.free_symbols for p in polynomials)), key=str)
    return variables, polynomials


def singular_script(query: Query) -> tuple[str, int, int]:
    variables, polynomials = exact_polynomial_system(query)
    if not variables:
        variables = [sp.Symbol("unused")]
    singular_polynomials = [str(p).replace("**", "^") for p in polynomials]
    ideal = ",".join(singular_polynomials) if singular_polynomials else "0"
    script = (
        f"ring R=0,({','.join(map(str, variables))}),dp;\n"
        f"ideal I={ideal};\n"
        "ideal G=std(I);\n"
        'if(size(G)==1 and G[1]==1){print("UNIT");}else{print("NONUNIT");}\n'
        "quit;\n"
    )
    return script, len(variables), len(polynomials)


def singular_classify(query: Query, timeout_s: float) -> dict[str, Any]:
    script, variable_count, polynomial_count = singular_script(query)
    started = time.monotonic()
    try:
        proc = subprocess.run(
            ["Singular", "-q"], input=script, text=True, capture_output=True,
            timeout=timeout_s, check=False,
        )
    except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
        return {
            "verdict": "UNKNOWN", "error": type(exc).__name__,
            "elapsed_s": time.monotonic() - started,
            "timeout_s": timeout_s,
        }
    output = proc.stdout.strip()
    verdict = output if output in ("UNIT", "NONUNIT") else "UNKNOWN"
    return {
        "verdict": verdict,
        "elapsed_s": time.monotonic() - started,
        "timeout_s": timeout_s,
        "returncode": proc.returncode,
        "variable_count": variable_count,
        "polynomial_count": polynomial_count,
        "stderr_tail": proc.stderr[-1000:],
    }


def msolve_crosscheck(query: Query, timeout_s: float) -> dict[str, Any]:
    variables, polynomials = exact_polynomial_system(query)
    if not variables:
        variables = [sp.Symbol("unused")]
    expanded = [str(p).replace("**", "^") for p in polynomials]
    results = []
    with tempfile.TemporaryDirectory(prefix="msolve-crosscheck-", dir=HERE) as temporary:
        tmp = Path(temporary)
        for label, order in (("forward", variables), ("reverse", list(reversed(variables)))):
            input_path = tmp / f"{label}.ms"
            output_path = tmp / f"{label}.out"
            input_path.write_text(
                ",".join(map(str, order)) + "\n0\n" + ",\n".join(expanded) + "\n"
            )
            started = time.monotonic()
            try:
                proc = subprocess.run(
                    ["msolve", "-f", str(input_path), "-o", str(output_path), "-t", "1"],
                    text=True, capture_output=True, timeout=timeout_s, check=False,
                )
                output = output_path.read_text().strip() if output_path.exists() else ""
                verdict = "UNIT" if output.startswith("[-1]") else ("NONUNIT" if output else "UNKNOWN")
                results.append({
                    "order": label, "verdict": verdict,
                    "elapsed_s": time.monotonic() - started,
                    "returncode": proc.returncode, "stderr_tail": proc.stderr[-1000:],
                })
            except (FileNotFoundError, subprocess.TimeoutExpired) as exc:
                results.append({
                    "order": label, "verdict": "UNKNOWN", "error": type(exc).__name__,
                    "elapsed_s": time.monotonic() - started,
                })
    verdicts = {r["verdict"] for r in results}
    return {
        "runs": results,
        "agreement": len(verdicts) == 1,
        "verdict": next(iter(verdicts)) if len(verdicts) == 1 else "DISAGREE",
        "warning": "msolve is corroboration only; Singular char-0 is the arbiter",
    }


def minimize_unit_core(query: Query, closure_groups: Sequence[Sequence[Edge]], timeout_s: float) -> tuple[Query, list[dict[str, Any]]]:
    log: list[dict[str, Any]] = []
    current = query
    changed = True
    while changed:
        changed = False
        for point in current.points:
            if len(current.points) <= 4:
                break
            candidate = make_query([p for p in current.points if p != point], closure_groups)
            verdict = singular_classify(candidate, timeout_s)
            log.append({"phase": "singular-point-delete", "deleted": point, **verdict})
            if verdict["verdict"] == "UNIT":
                current = candidate
                changed = True
                break
    atoms = list(current.atoms)
    index = 0
    while index < len(atoms):
        candidate_atoms = tuple(atoms[:index] + atoms[index + 1 :])
        candidate = Query(current.points, candidate_atoms, choose_gauge(current.points, candidate_atoms))
        verdict = singular_classify(candidate, timeout_s)
        log.append({"phase": "singular-atom-delete", "deleted": atom_text(atoms[index]), **verdict})
        if verdict["verdict"] == "UNIT":
            atoms.pop(index)
        else:
            index += 1
    return Query(current.points, tuple(atoms), choose_gauge(current.points, atoms)), log


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=DEFAULT_WITNESS)
    parser.add_argument("--output", type=Path, default=HERE / "result.json")
    parser.add_argument("--max-queries", type=int, default=180)
    parser.add_argument("--per-size", type=int, default=32)
    parser.add_argument("--timeout-ms", type=int, default=750)
    parser.add_argument("--seed-timeout-ms", type=int, default=10_000)
    parser.add_argument("--minimize-timeout-ms", type=int, default=5_000)
    parser.add_argument("--final-z3-timeout-ms", type=int, default=30_000)
    parser.add_argument("--algebra-timeout-s", type=float, default=10.0)
    parser.add_argument("--algebra-candidate-count", type=int, default=12)
    args = parser.parse_args()
    args.witness = args.witness.resolve()
    source_result_path = args.witness.with_name("result.json")
    if not source_result_path.is_file():
        raise ValueError(f"missing sibling CEGAR result: {source_result_path}")
    witness = json.loads(args.witness.read_text())
    source_result = json.loads(source_result_path.read_text())
    if source_result.get("schema") not in SOURCE_SCHEMAS:
        raise ValueError("source result is not an accepted replayed v8/v9 schema")
    if source_result.get("status") != "SAT":
        raise ValueError("source result is not SAT")
    if witness.get("semantic_replay") != "PASS":
        raise ValueError("witness semantic replay is not PASS")
    for field in REPLAY_FIELDS:
        if witness.get(field, {}).get("status") != "PASS":
            raise ValueError(f"witness replay field is not PASS: {field}")
    source_arm = source_result.get("arm")
    if witness.get("live_Lean_mapping", {}).get("forced_crossed_arm") != source_arm:
        raise ValueError("source result and witness crossed arms differ")
    points, closure_groups, generators = build_closure(witness)
    started = time.monotonic()
    smoke = smoke_tests(min(args.seed_timeout_ms, 5_000))
    algebra_smoke = algebra_smoke_tests(min(args.algebra_timeout_s, 5.0))
    full_query = make_query(points, closure_groups)
    full_result = solve_query(full_query, args.seed_timeout_ms)
    tranche: list[dict[str, Any]] = []
    unsat_seed: Query | None = full_query if full_result["verdict"] == "UNSAT" else None
    if unsat_seed is None:
        for candidate in candidate_subsets(points, closure_groups, witness, args.per_size):
            if len(tranche) >= args.max_queries:
                break
            query = candidate["query"]
            result = solve_query(query, args.timeout_ms)
            result.update(numerical_rank(query))
            result["role_count"] = candidate["role_count"]
            result["cyclic_span"] = candidate["cyclic_span"]
            result.pop("model", None)
            tranche.append(result)
            if result["verdict"] == "UNSAT":
                unsat_seed = query
                break
    hard_unknowns = sorted(
        (record for record in tranche if record["verdict"] == "UNKNOWN"),
        key=lambda r: (r["point_count"], -r["equality_count"], r["elapsed_s"]),
    )[:20]
    minimization_log: list[dict[str, Any]] = []
    minimized: dict[str, Any] | None = None
    if unsat_seed is not None:
        point_core = minimize_points(unsat_seed, closure_groups, args.minimize_timeout_ms, minimization_log)
        atom_core = minimize_atoms(point_core, args.minimize_timeout_ms, minimization_log)
        final = solve_query(atom_core, args.minimize_timeout_ms, want_smt2=True)
        if final["verdict"] != "UNSAT":
            raise RuntimeError("minimized core failed final UNSAT replay")
        smt2 = final.pop("smt2")
        smt2_path = args.output.with_name("minimal-core.smt2")
        smt2_path.write_text(smt2)
        cvc5 = cvc5_crosscheck(smt2, args.minimize_timeout_ms)
        minimized = {
            **final,
            "atoms": [{**atom_record(atom), "text": atom_text(atom)} for atom in atom_core.atoms],
            "atom_sha256": sha256_json([atom_record(atom) for atom in atom_core.atoms]),
            "smt2": str(smt2_path.resolve().relative_to(ROOT)),
            "smt2_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
            "numerical_filter": numerical_rank(atom_core),
            "production_signature_check": production_signature_match(atom_core),
            "cvc5_crosscheck": cvc5,
            "minimality_scope": "greedy point-deletion fixed point, then one-pass atom deletion; every retained atom deletion was SAT or UNKNOWN, never treated as UNSAT",
        }
    algebra_candidate_log: list[dict[str, Any]] = []
    unit_seed: Query | None = None
    for record in hard_unknowns[: args.algebra_candidate_count]:
        query = make_query(record["points"], closure_groups)
        classification = singular_classify(query, args.algebra_timeout_s)
        algebra_candidate_log.append({
            "points": list(query.points), "equality_count": len(query.atoms),
            "z3_verdict": "UNKNOWN", **classification,
        })
        if classification["verdict"] == "UNIT":
            unit_seed = query
            break
    algebraic_core: dict[str, Any] | None = None
    if unit_seed is not None:
        core, algebra_minimization = minimize_unit_core(unit_seed, closure_groups, args.algebra_timeout_s)
        singular_final = singular_classify(core, args.algebra_timeout_s)
        if singular_final["verdict"] != "UNIT":
            raise RuntimeError("minimized algebraic core failed final UNIT replay")
        final_z3 = solve_query(core, args.final_z3_timeout_ms, want_smt2=True)
        smt2 = final_z3.pop("smt2")
        smt2_path = args.output.with_name("algebraic-minimal-core.smt2")
        smt2_path.write_text(smt2)
        sing_text, variable_count, polynomial_count = singular_script(core)
        sing_path = args.output.with_name("algebraic-minimal-core.sing")
        sing_path.write_text(sing_text)
        algebraic_core = {
            "points": list(core.points),
            "point_count": len(core.points),
            "gauge": list(core.gauge),
            "equality_count": len(core.atoms),
            "atoms": [{**atom_record(atom), "text": atom_text(atom)} for atom in core.atoms],
            "atom_sha256": sha256_json([atom_record(atom) for atom in core.atoms]),
            "singular": singular_final,
            "singular_script": str(sing_path.resolve().relative_to(ROOT)),
            "singular_script_sha256": hashlib.sha256(sing_text.encode()).hexdigest(),
            "polynomial_variable_count": variable_count,
            "polynomial_count": polynomial_count,
            "msolve_crosscheck": msolve_crosscheck(core, args.algebra_timeout_s),
            "z3_replay": {k: v for k, v in final_z3.items() if k != "model"},
            "cvc5_replay": cvc5_crosscheck(smt2, args.final_z3_timeout_ms),
            "smt2": str(smt2_path.resolve().relative_to(ROOT)),
            "smt2_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
            "production_signature_check": production_signature_match(core),
            "numerical_filter": numerical_rank(core),
            "minimization_log": algebra_minimization,
            "minimality_scope": "greedy induced-point deletion to fixed point, then one-pass equality deletion, using only Singular UNIT as a deletion license; NONUNIT/UNKNOWN retain the item",
            "interpretation": "UNIT proves the gauge-fixed equality ideal has no complex point, hence no real planar realization; Z3/cvc5 classification is reported independently",
        }
    status = (
        "Z3_UNSAT_CORE_MINED" if minimized else
        "ALGEBRAIC_UNIT_CORE_Z3_UNKNOWN" if algebraic_core else
        "NO_UNSAT_BOUNDED"
    )
    result = {
        "schema": SCHEMA,
        "status": status,
        "trust": {
            "classification": "trusted external computation, not a Lean/kernel proof",
            "encoding": "global undirected-edge equality closure + pairwise distinctness + similarity gauge only",
            "unknown_policy": "UNKNOWN and numerical failure never imply UNSAT and never authorize deletion",
            "sat_policy": "Z3 models replayed against every asserted formula with model_completion=True",
            "numerical_policy": "Jacobian rank is prioritization-only and has no verdict force",
        },
        "environment": {
            "python": platform.python_version(),
            "z3py": z3.get_version_string(),
            "z3_binary": subprocess.run(["z3", "--version"], capture_output=True, text=True).stdout.strip(),
            "cvc5_binary": subprocess.run(["cvc5", "--version"], capture_output=True, text=True).stdout.splitlines()[0],
        },
        "source": {
            "witness": str(args.witness.resolve().relative_to(ROOT)),
            "witness_sha256": hashlib.sha256(args.witness.read_bytes()).hexdigest(),
            "source_result": str(source_result_path.resolve().relative_to(ROOT)),
            "source_result_sha256": hashlib.sha256(source_result_path.read_bytes()).hexdigest(),
            "source_result_schema": source_result["schema"],
            "source_result_status": source_result["status"],
            "source_arm": source_arm,
            "semantic_replay": witness["semantic_replay"],
            "replay_fields_checked": list(REPLAY_FIELDS),
            "points": list(points),
            "point_count": len(points),
            "radius_equality_generator_count": len(generators),
            "nontrivial_global_edge_classes": len(closure_groups),
            "nontrivial_global_edge_class_sizes": sorted((len(g) for g in closure_groups), reverse=True),
            "global_closure_sha256": sha256_json([[list(e) for e in group] for group in closure_groups]),
        },
        "budgets": vars(args) | {"witness": str(args.witness), "output": str(args.output)},
        "smoke_tests": smoke,
        "algebra_smoke_tests": algebra_smoke,
        "full_query": {k: v for k, v in full_result.items() if k != "model"},
        "tranche": tranche,
        "tranche_counts": {verdict: sum(r["verdict"] == verdict for r in tranche) for verdict in ("SAT", "UNSAT", "UNKNOWN")},
        "smallest_hard_unknowns": hard_unknowns,
        "minimization_log": minimization_log,
        "minimal_unsat_core": minimized,
        "algebra_candidate_log": algebra_candidate_log,
        "algebraic_unit_core": algebraic_core,
        "elapsed_s": time.monotonic() - started,
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": result["status"],
        "output": str(args.output),
        "full": full_result["verdict"],
        "tranche_counts": result["tranche_counts"],
        "minimal_points": minimized["points"] if minimized else (algebraic_core["points"] if algebraic_core else None),
        "minimal_equalities": minimized["equality_count"] if minimized else (algebraic_core["equality_count"] if algebraic_core else None),
        "elapsed_s": result["elapsed_s"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
