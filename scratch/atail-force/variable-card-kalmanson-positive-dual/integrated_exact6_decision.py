#!/usr/bin/env python3
"""Integrated exact-six structural and strict-distance QF_LIRA decision.

Unlike the CEGAR lane, this script places the complete corrected n=14
Boolean/role/blocker outer and every strict triangle/Kalmanson distance
constraint in one solver.  Selected-row and exact-five-shell equalities are
guarded directly by the corresponding Boolean memberships.  Strong
connectivity is encoded by a Floyd--Warshall transitive-closure circuit, so no
lazy SCC cut or mined membership schema appears in this decision.

The imported outer includes the complete-shell/selected-row alternation rule.
SAT is an exact rational abstract-distance shadow of the retained subsystem;
UNSAT is a bounded external solver verdict until a checkable certificate is
produced.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import sys
import time
from fractions import Fraction
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
OUTER_PATH = HERE.parent / "exact6-allcenter-capaware-gate" / "allcenter_gate.py"


def load_outer_module():
    sys.path.insert(0, str(OUTER_PATH.parent))
    spec = importlib.util.spec_from_file_location("exact6_allcenter_gate", OUTER_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load corrected exact-six outer")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def rational_string(value: z3.RatNumRef) -> str:
    fraction = Fraction(value.numerator_as_long(), value.denominator_as_long())
    if fraction.denominator == 1:
        return str(fraction.numerator)
    return f"{fraction.numerator}/{fraction.denominator}"


def add_strong_connectivity(outer) -> int:
    solver = outer.solver
    n = outer.member.__len__() // 14
    if n != 14:
        raise AssertionError(f"unexpected carrier size {n}")
    reach = {
        (step, left, right): z3.Bool(f"reach_{step}_{left}_{right}")
        for step in range(n + 1)
        for left in range(n)
        for right in range(n)
    }
    clause_count = 0
    for left in range(n):
        for right in range(n):
            base = z3.BoolVal(left == right) if left == right else outer.member[left, right]
            solver.add(reach[0, left, right] == base)
            clause_count += 1
    for step in range(n):
        for left in range(n):
            for right in range(n):
                solver.add(
                    reach[step + 1, left, right]
                    == z3.Or(
                        reach[step, left, right],
                        z3.And(reach[step, left, step], reach[step, step, right]),
                    )
                )
                clause_count += 1
    solver.add(*(reach[n, left, right] for left in range(n) for right in range(n)))
    return clause_count + n * n


def add_metric_surface(
    module,
    outer,
    *,
    kalmanson_only: bool,
) -> tuple[dict[tuple[int, int], z3.ArithRef], dict[str, int]]:
    solver = outer.solver
    vertices = module.VERTICES
    table = module.distance_table()
    counts = {
        "positivity": 0,
        "strict_triangle": 0,
        "strict_kalmanson": 0,
        "guarded_selected_row_equality": 0,
        "guarded_exact_five_shell_equality": 0,
    }
    if not kalmanson_only:
        for variable in table.values():
            solver.add(variable >= 1)
            counts["positivity"] += 1
        for a, b, c in itertools.combinations(vertices, 3):
            solver.add(
                module.dist(table, a, b) + module.dist(table, b, c)
                >= module.dist(table, a, c) + 1,
                module.dist(table, a, c) + module.dist(table, b, c)
                >= module.dist(table, a, b) + 1,
                module.dist(table, a, b) + module.dist(table, a, c)
                >= module.dist(table, b, c) + 1,
            )
            counts["strict_triangle"] += 3
    for a, b, c, d in itertools.combinations(vertices, 4):
        diagonal = module.dist(table, a, c) + module.dist(table, b, d)
        solver.add(
            diagonal >= module.dist(table, a, b) + module.dist(table, c, d) + 1,
            diagonal >= module.dist(table, a, d) + module.dist(table, b, c) + 1,
        )
        counts["strict_kalmanson"] += 2
    for center in vertices:
        targets = [point for point in vertices if point != center]
        for left, right in itertools.combinations(targets, 2):
            solver.add(
                z3.Implies(
                    z3.And(outer.member[center, left], outer.member[center, right]),
                    module.dist(table, center, left) == module.dist(table, center, right),
                )
            )
            counts["guarded_selected_row_equality"] += 1
    shell_targets = [point for point in vertices if point != module.SECOND_APEX]
    for left, right in itertools.combinations(shell_targets, 2):
        solver.add(
            z3.Implies(
                z3.And(outer.shell[left], outer.shell[right]),
                module.dist(table, module.SECOND_APEX, left)
                == module.dist(table, module.SECOND_APEX, right),
            )
        )
        counts["guarded_exact_five_shell_equality"] += 1
    return table, counts


def independently_replay_metric(
    module,
    decoded: dict[str, object],
    distances: dict[str, Fraction],
    *,
    kalmanson_only: bool,
) -> dict[str, object]:
    vertices = module.VERTICES

    def value(left: int, right: int) -> Fraction:
        if left == right:
            return Fraction(0)
        first, second = sorted((left, right))
        return distances[f"{first},{second}"]

    rows = decoded["rows"]
    shell = decoded["shell"]
    if not module.strongly_connected(rows)[0]:
        raise AssertionError("serialized selected-row graph is not strongly connected")
    if not kalmanson_only:
        for pair, distance in distances.items():
            if distance < 1:
                raise AssertionError(f"positivity failed at {pair}")
    for center, support in rows.items():
        if len(support) != 4 or center in support:
            raise AssertionError(f"invalid selected row {center}: {support}")
        radius = value(center, support[0])
        if any(value(center, point) != radius for point in support[1:]):
            raise AssertionError(f"selected row equality failed at {center}")
    shell_radius = value(module.SECOND_APEX, shell[0])
    if any(value(module.SECOND_APEX, point) != shell_radius for point in shell[1:]):
        raise AssertionError("exact-five shell equality failed")
    if not kalmanson_only:
        for a, b, c in itertools.combinations(vertices, 3):
            if value(a, b) + value(b, c) < value(a, c) + 1:
                raise AssertionError(f"triangle 0 failed at {(a, b, c)}")
            if value(a, c) + value(b, c) < value(a, b) + 1:
                raise AssertionError(f"triangle 1 failed at {(a, b, c)}")
            if value(a, b) + value(a, c) < value(b, c) + 1:
                raise AssertionError(f"triangle 2 failed at {(a, b, c)}")
    for a, b, c, d in itertools.combinations(vertices, 4):
        diagonal = value(a, c) + value(b, d)
        if diagonal < value(a, b) + value(c, d) + 1:
            raise AssertionError(f"Kalmanson 1 failed at {(a, b, c, d)}")
        if diagonal < value(a, d) + value(b, c) + 1:
            raise AssertionError(f"Kalmanson 2 failed at {(a, b, c, d)}")
    return {
        "status": "EXACT_RATIONAL_METRIC_REPLAY_PASS",
        "distance_count": len(distances),
        "minimum_distance": str(min(distances.values())),
        "metric_surface": (
            "STRICT_KALMANSON_ONLY"
            if kalmanson_only
            else "POSITIVE_STRICT_TRIANGLE_STRICT_KALMANSON"
        ),
    }


def solve(args: argparse.Namespace) -> dict[str, object]:
    module = load_outer_module()
    started = time.monotonic()
    outer = module.Outer(args.orbit, args.timeout_ms, args.seed, "z3")
    connectivity_clause_count = add_strong_connectivity(outer)
    table, metric_counts = add_metric_surface(
        module,
        outer,
        kalmanson_only=args.kalmanson_only,
    )
    build_elapsed = time.monotonic() - started
    if args.log is not None:
        args.log.write_text(
            json.dumps(
                {
                    "phase": "solver_built",
                    "orbit": args.orbit,
                    "build_elapsed_seconds": build_elapsed,
                    "connectivity_clause_count": connectivity_clause_count,
                    "metric_counts": metric_counts,
                },
                sort_keys=True,
            )
            + "\n",
            encoding="utf-8",
        )
    status = outer.solver.check()
    result: dict[str, object]
    if status == z3.sat:
        model = outer.solver.model()
        decoded = outer.decode(model)
        raw_distances = {
            f"{left},{right}": rational_string(model.eval(variable, model_completion=True))
            for (left, right), variable in table.items()
        }
        exact_distances = {
            pair: Fraction(value) for pair, value in raw_distances.items()
        }
        metric_replay = independently_replay_metric(
            module,
            decoded,
            exact_distances,
            kalmanson_only=args.kalmanson_only,
        )
        result = {
            "status": "SAT_VERIFIED_EXACT_RATIONAL_RETAINED_SUBSYSTEM_SHADOW",
            "decoded": module.jsonable_decoded(decoded),
            "distances": raw_distances,
            "metric_replay": metric_replay,
        }
    elif status == z3.unsat:
        result = {
            "status": "UNSAT_EXTERNAL_NO_CERTIFICATE",
            "reason": "integrated corrected structural plus exact QF_LIRA surface",
        }
    else:
        result = {"status": "UNKNOWN", "reason": outer.solver.reason_unknown()}
    result.update(
        {
            "schema": "p97-exact6-integrated-structural-distance-decision-v1",
            "epistemic_status": "EXACT_IF_SAT_EXTERNAL_BOUNDED_IF_UNSAT_OR_UNKNOWN",
            "orbit": args.orbit,
            "n": module.N,
            "seed": args.seed,
            "timeout_ms": args.timeout_ms,
            "elapsed_seconds": time.monotonic() - started,
            "build_elapsed_seconds": build_elapsed,
            "connectivity": "FLOYD_WARSHALL_ALL_PAIRS_EXACT",
            "connectivity_clause_count": connectivity_clause_count,
            "metric_counts": metric_counts,
            "complete_shell_selected_row_alternation": True,
            "literal_metric_schema_cuts": 0,
            "metric_surface": (
                "STRICT_KALMANSON_ONLY"
                if args.kalmanson_only
                else "POSITIVE_STRICT_TRIANGLE_STRICT_KALMANSON"
            ),
            "outer_source": str(OUTER_PATH),
            "outer_source_sha256": sha256(OUTER_PATH),
            "solver_statistics": str(outer.solver.statistics()),
        }
    )
    if args.log is not None:
        with args.log.open("a", encoding="utf-8") as handle:
            handle.write(
                json.dumps(
                    {
                        "phase": "terminal",
                        "orbit": args.orbit,
                        "status": result["status"],
                        "elapsed_seconds": result["elapsed_seconds"],
                    },
                    sort_keys=True,
                )
                + "\n"
            )
    return result


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orbit", choices=load_outer_module().ORBITS, required=True)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--kalmanson-only", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--log", type=Path)
    args = parser.parse_args()
    result = solve(args)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
