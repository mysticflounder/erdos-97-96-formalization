#!/usr/bin/env python3
"""Audit the exact 263-core bank for small positive Kalmanson contours.

For each deletion-minimal exact-LRA core, retain only its selected-row
equalities.  Quotient the distance-coordinate space by those equalities, then
ask whether one through four positive K1/K2 vectors sum to zero in the
quotient.  A small mixed-integer solve discovers a minimum support; Z3
reconstructs and replays the resulting rational Farkas cancellation exactly.

This is scratch theorem-discovery tooling.  It does not prove bank coverage in
Lean and it does not modify the source bank.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
import time
from collections import Counter, defaultdict
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path

import numpy as np
import scipy.optimize
import scipy.sparse
import z3


HERE = Path(__file__).resolve().parent
ATAIL_FORCE = HERE.parent
DEFAULT_BANK = (
    ATAIL_FORCE
    / "exact6-allcenter-capaware-gate"
    / "combined_round1_round2_minimized_schema_bank.json"
)
DEFAULT_REPLAY = DEFAULT_BANK.with_suffix(".replay.json")
DEFAULT_OUTPUT = HERE / "core_bank_small_contour_audit.json"
SCHEMA = "p97-atail-core-bank-small-positive-contour-audit-v1"

Edge = tuple[int, int]


def edge(left: int, right: int) -> Edge:
    if left == right:
        raise ValueError("distance loop")
    return (left, right) if left < right else (right, left)


def kalmanson_terms(
    kind: int, a: int, b: int, c: int, d: int
) -> dict[Edge, int]:
    result = {edge(a, c): 1, edge(b, d): 1}
    negative = ((a, b), (c, d)) if kind == 1 else ((a, d), (b, c))
    for left, right in negative:
        item = edge(left, right)
        result[item] = result.get(item, 0) - 1
    return {item: value for item, value in result.items() if value}


def row_terms(center: int, left: int, right: int) -> dict[Edge, int]:
    return {edge(center, right): 1, edge(center, left): -1}


def parse_constraint(name: str) -> tuple[str, tuple[int, ...]]:
    fields = name.split("_")
    return fields[0], tuple(map(int, fields[1:]))


class UnionFind:
    def __init__(self, items: tuple[Edge, ...]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: Edge) -> Edge:
        parent = self.parent[item]
        if parent != item:
            self.parent[item] = self.find(parent)
        return self.parent[item]

    def union(self, left: Edge, right: Edge) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


@dataclass(frozen=True)
class Candidate:
    name: str
    terms: dict[Edge, int]
    quotient: dict[int, int]


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def clear_denominators(values: dict[str, Fraction]) -> dict[str, int]:
    denominator = math.lcm(*(value.denominator for value in values.values()))
    integers = {name: int(value * denominator) for name, value in values.items()}
    divisor = math.gcd(*(abs(value) for value in integers.values() if value))
    return {name: value // divisor for name, value in integers.items() if value}


def exact_reconstruct(
    candidates: tuple[Candidate, ...],
    support: tuple[int, ...],
    rows: tuple[tuple[str, dict[Edge, int]], ...],
    edges: tuple[Edge, ...],
) -> dict[str, object] | None:
    strict = [z3.Real(f"strict_{position}") for position in range(len(support))]
    row_weights = [z3.Real(f"row_{position}") for position in range(len(rows))]
    solver = z3.Solver()
    for weight in strict:
        solver.add(weight > 0)
    solver.add(sum(strict) == 1)
    for item in edges:
        solver.add(
            sum(
                strict[position] * candidates[index].terms.get(item, 0)
                for position, index in enumerate(support)
            )
            + sum(
                row_weights[position] * terms.get(item, 0)
                for position, (_, terms) in enumerate(rows)
            )
            == 0
        )
    if solver.check() != z3.sat:
        return None
    model = solver.model()
    values: dict[str, Fraction] = {}
    for position, index in enumerate(support):
        value = rational(model.eval(strict[position], model_completion=True))
        if value <= 0:
            return None
        values[candidates[index].name] = value
    for position, (name, _) in enumerate(rows):
        value = rational(model.eval(row_weights[position], model_completion=True))
        if value:
            values[name] = value
    integers = clear_denominators(values)
    residue: dict[Edge, int] = defaultdict(int)
    strict_weight = 0
    row_centers: set[int] = set()
    for name, multiplier in integers.items():
        kind, labels = parse_constraint(name)
        if kind in {"kal1", "kal2"}:
            vector = kalmanson_terms(int(kind[-1]), *labels)
            if multiplier <= 0:
                raise AssertionError("strict multiplier is not positive")
            strict_weight += multiplier
        elif kind == "row":
            vector = row_terms(*labels)
            row_centers.add(labels[0])
        else:
            raise AssertionError(f"unexpected constraint {name}")
        for item, coefficient in vector.items():
            residue[item] += multiplier * coefficient
    residue = {item: value for item, value in residue.items() if value}
    if residue or strict_weight <= 0:
        raise AssertionError(f"exact cancellation replay failed: {residue}")
    return {
        "strict_support_size": len(support),
        "strict_weight": strict_weight,
        "row_equality_support_size": sum(name.startswith("row_") for name in integers),
        "row_center_count": len(row_centers),
        "used_row_centers": sorted(row_centers),
        "multipliers": dict(sorted(integers.items())),
        "exact_vector_cancellation": True,
    }


def find_contour(
    core: tuple[str, ...], *, max_strict: int, time_limit: float
) -> dict[str, object] | None:
    parsed = tuple(parse_constraint(name) for name in core)
    vertices = tuple(sorted({vertex for _, labels in parsed for vertex in labels}))
    edges = tuple(itertools.combinations(vertices, 2))
    row_constraints = tuple(
        (name, row_terms(*labels))
        for name, (kind, labels) in zip(core, parsed, strict=True)
        if kind == "row"
    )
    if not row_constraints:
        return None

    quotient = UnionFind(edges)
    for _, terms in row_constraints:
        positive = next(item for item, value in terms.items() if value == 1)
        negative = next(item for item, value in terms.items() if value == -1)
        quotient.union(positive, negative)
    classes = {root: index for index, root in enumerate(sorted({quotient.find(e) for e in edges}))}

    candidates: list[Candidate] = []
    for a, b, c, d in itertools.combinations(vertices, 4):
        for kind in (1, 2):
            terms = kalmanson_terms(kind, a, b, c, d)
            reduced: dict[int, int] = defaultdict(int)
            for item, coefficient in terms.items():
                reduced[classes[quotient.find(item)]] += coefficient
            reduced = {item: value for item, value in reduced.items() if value}
            candidates.append(Candidate(f"kal{kind}_{a}_{b}_{c}_{d}", terms, reduced))
    candidate_tuple = tuple(candidates)
    if not candidate_tuple:
        return {"search_status": "NO_KALMANSON_CANDIDATES"}

    # Exact one-cell contours need no numerical discovery.
    for index, candidate in enumerate(candidate_tuple):
        if not candidate.quotient:
            result = exact_reconstruct(candidate_tuple, (index,), row_constraints, edges)
            if result is not None:
                return result

    class_count = len(classes)
    candidate_count = len(candidate_tuple)
    matrix_rows: list[int] = []
    matrix_cols: list[int] = []
    matrix_values: list[int] = []
    for column, candidate in enumerate(candidate_tuple):
        for row, value in candidate.quotient.items():
            matrix_rows.append(row)
            matrix_cols.append(column)
            matrix_values.append(value)
    quotient_matrix = scipy.sparse.csc_matrix(
        (matrix_values, (matrix_rows, matrix_cols)),
        shape=(class_count, candidate_count),
        dtype=float,
    )
    # Variables are nonnegative strict weights followed by binary support flags.
    objective = np.concatenate((np.zeros(candidate_count), np.ones(candidate_count)))
    integrality = np.concatenate((np.zeros(candidate_count), np.ones(candidate_count)))
    bounds = scipy.optimize.Bounds(
        np.zeros(2 * candidate_count), np.ones(2 * candidate_count)
    )
    zero = np.zeros(class_count)
    normalization = scipy.sparse.csc_matrix(
        np.concatenate((np.ones(candidate_count), np.zeros(candidate_count))).reshape(1, -1)
    )
    link = scipy.sparse.hstack(
        (scipy.sparse.eye(candidate_count), -scipy.sparse.eye(candidate_count)),
        format="csc",
    )
    support_bound = scipy.sparse.csc_matrix(
        np.concatenate((np.zeros(candidate_count), np.ones(candidate_count))).reshape(1, -1)
    )
    full_quotient = scipy.sparse.hstack(
        (quotient_matrix, scipy.sparse.csc_matrix((class_count, candidate_count))),
        format="csc",
    )
    constraints = scipy.optimize.LinearConstraint(
        scipy.sparse.vstack((full_quotient, normalization, link, support_bound), format="csc"),
        np.concatenate((zero, [1.0], np.full(candidate_count, -np.inf), [-np.inf])),
        np.concatenate((zero, [1.0], np.zeros(candidate_count), [float(max_strict)])),
    )
    result = scipy.optimize.milp(
        objective,
        integrality=integrality,
        bounds=bounds,
        constraints=constraints,
        options={"time_limit": time_limit, "mip_rel_gap": 0.0, "presolve": True},
    )
    if not result.success or result.x is None:
        status = {
            1: "MILP_TIME_LIMIT",
            2: "MILP_INFEASIBLE",
            3: "MILP_UNBOUNDED",
            4: "MILP_NUMERICAL_FAILURE",
        }.get(result.status, "MILP_NO_SOLUTION")
        return {
            "search_status": status,
            "milp_status": int(result.status),
            "milp_message": result.message,
        }
    support = tuple(
        index for index, value in enumerate(result.x[:candidate_count]) if value > 1e-8
    )
    if not support or len(support) > max_strict:
        return {"search_status": "MILP_RETURNED_INVALID_SUPPORT"}
    exact = exact_reconstruct(candidate_tuple, support, row_constraints, edges)
    if exact is None:
        return {"search_status": "FLOAT_SUPPORT_FAILED_EXACT_REPLAY"}
    exact.update(
        {
            "search_status": "EXACT_POSITIVE_CONTOUR",
            "active_vertex_count": len(vertices),
            "candidate_kalmanson_count": candidate_count,
            "milp_objective": float(result.fun),
            "milp_message": result.message,
        }
    )
    return exact


def replay_source_core(core: tuple[str, ...]) -> dict[str, object] | None:
    """Replay the source-minimal strict support when small-support search stalls."""
    parsed = tuple(parse_constraint(name) for name in core)
    vertices = tuple(sorted({vertex for _, labels in parsed for vertex in labels}))
    edges = tuple(itertools.combinations(vertices, 2))
    candidates = tuple(
        Candidate(name, kalmanson_terms(int(kind[-1]), *labels), {})
        for name, (kind, labels) in zip(core, parsed, strict=True)
        if kind in {"kal1", "kal2"}
    )
    rows = tuple(
        (name, row_terms(*labels))
        for name, (kind, labels) in zip(core, parsed, strict=True)
        if kind == "row"
    )
    exact = exact_reconstruct(
        candidates, tuple(range(len(candidates))), rows, edges
    )
    if exact is not None:
        exact.update(
            {
                "search_status": "EXACT_SOURCE_CORE_POSITIVE_CONTOUR",
                "active_vertex_count": len(vertices),
                "candidate_kalmanson_count": len(candidates),
            }
        )
    return exact


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, default=DEFAULT_BANK)
    parser.add_argument("--replay", type=Path, default=DEFAULT_REPLAY)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--max-strict", type=int, default=4)
    parser.add_argument("--time-limit-per-core", type=float, default=10.0)
    parser.add_argument("--start", type=int, default=0)
    parser.add_argument("--stop", type=int)
    parser.add_argument("--limit", type=int)
    parser.add_argument(
        "--fallback-source-core",
        action="store_true",
        help="exactly replay all strict terms in a source-minimal core after bounded search",
    )
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))
    replay = json.loads(args.replay.read_text(encoding="utf-8"))
    stop = args.stop
    if args.limit is not None:
        stop = args.start + args.limit
    indexed_schemas = list(enumerate(bank["schemas"]))[args.start : stop]
    if replay.get("status") != "VERIFIED":
        raise ValueError("source bank replay is not VERIFIED")
    if bank["minimal_core_count"] != len(bank["schemas"]):
        raise ValueError("source bank count mismatch")

    started = time.monotonic()
    records: list[dict[str, object]] = []
    for position, (index, schema) in enumerate(indexed_schemas):
        provenance = schema["provenance"]
        if len(provenance) != 1:
            raise ValueError(f"schema {index} has non-unique provenance")
        core = tuple(provenance[0]["minimal_core"])
        contour = find_contour(
            core, max_strict=args.max_strict, time_limit=args.time_limit_per_core
        )
        if (
            args.fallback_source_core
            and not contour.get("exact_vector_cancellation", False)
        ):
            source_contour = replay_source_core(core)
            if source_contour is not None:
                source_contour["bounded_small_support_result"] = contour
                contour = source_contour
        records.append(
            {
                "schema_index": index,
                "core_vertex_count": schema["core_vertex_count"],
                "core_constraint_count": len(core),
                "source_strict_count": sum(name.startswith("kal") for name in core),
                "source_row_count": sum(name.startswith("row_") for name in core),
                "contour": contour,
            }
        )
        if (position + 1) % 10 == 0:
            print(f"checked {position + 1}/{len(indexed_schemas)} (source {index})", flush=True)

    covered = [
        record
        for record in records
        if record["contour"] is not None
        and record["contour"].get("exact_vector_cancellation") is True
    ]
    payload = {
        "schema": SCHEMA,
        "epistemic_status": "EXACT_RATIONAL_REPLAY_WITHIN_SOURCE_ROW_EQUALITIES",
        "source_bank": str(args.bank),
        "source_replay": str(args.replay),
        "source_replay_status": replay["status"],
        "source_core_count": len(indexed_schemas),
        "source_index_start": args.start,
        "source_index_stop": args.start + len(indexed_schemas),
        "max_strict_support": args.max_strict,
        "covered_core_count": len(covered),
        "uncovered_core_count": len(indexed_schemas) - len(covered),
        "strict_support_histogram": dict(
            sorted(Counter(record["contour"]["strict_support_size"] for record in covered).items())
        ),
        "row_support_histogram": dict(
            sorted(Counter(record["contour"]["row_equality_support_size"] for record in covered).items())
        ),
        "row_center_histogram": dict(
            sorted(Counter(record["contour"]["row_center_count"] for record in covered).items())
        ),
        "wall_seconds": time.monotonic() - started,
        "records": records,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({key: value for key, value in payload.items() if key != "records"}, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
