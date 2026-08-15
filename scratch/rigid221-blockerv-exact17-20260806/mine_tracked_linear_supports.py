#!/usr/bin/env python3
"""Mine small exact linear proof supports from exact-17 CEGAR journals.

This is theorem-discovery code.  It first minimizes the metric inequalities
while retaining the learned row equalities, then minimizes the row equalities
against that metric core.  The resulting support is canonicalized under the
dihedral symmetries of the inherited cyclic order.  Any promoted result still
needs an ordinary Lean proof and a direct source consumer.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from itertools import combinations
from pathlib import Path

import z3


ROOT = Path(__file__).resolve().parent
ORDER = (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14)


def distance(variables, left: int, right: int):
    return variables[tuple(sorted((left, right)))]


def normalized_pair(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def normalized_sum(*pairs: tuple[int, int]):
    return tuple(sorted(normalized_pair(*pair) for pair in pairs))


def load_linear_records(journals: list[Path]):
    for journal in journals:
        with journal.open() as stream:
            for line in stream:
                record = json.loads(line)
                if record.get("classification") == "linear_unsat":
                    yield journal, record


def tracked_support(record: dict, timeout_ms: int):
    rows = record["learned_rows"]
    order = tuple(record.get("order", ORDER))
    used = {
        point
        for row in rows
        for point in (row["center"], *row["support"])
    }
    cyclic_points = tuple(point for point in order if point in used)
    local = {point: index for index, point in enumerate(cyclic_points)}
    variables = {
        normalized_pair(*pair): z3.Real(f"d_{min(pair)}_{max(pair)}")
        for pair in combinations(cyclic_points, 2)
    }
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    metric_assumptions = []
    metric_assertions = {}
    equality_assertions = {}
    atoms = {}

    def track(name: str, assertion, atom):
        tag = z3.Bool(name)
        solver.add(z3.Implies(tag, assertion))
        metric_assumptions.append(tag)
        metric_assertions[name] = assertion
        atoms[name] = atom

    for left, right in combinations(cyclic_points, 2):
        track(
            f"P_{left}_{right}",
            distance(variables, left, right) > 0,
            ("pos", normalized_pair(local[left], local[right])),
        )

    for a, b, c in combinations(cyclic_points, 3):
        triangle_atoms = (
            ((a, c), ((a, b), (b, c))),
            ((a, b), ((a, c), (b, c))),
            ((b, c), ((a, b), (a, c))),
        )
        for index, (lhs, rhs) in enumerate(triangle_atoms):
            track(
                f"T_{a}_{b}_{c}_{index}",
                distance(variables, *lhs)
                < distance(variables, *rhs[0]) + distance(variables, *rhs[1]),
                (
                    "tri",
                    normalized_sum(normalized_pair(local[lhs[0]], local[lhs[1]])),
                    normalized_sum(
                        normalized_pair(local[rhs[0][0]], local[rhs[0][1]]),
                        normalized_pair(local[rhs[1][0]], local[rhs[1][1]]),
                    ),
                ),
            )

    for a, b, c, d in combinations(cyclic_points, 4):
        diagonal = distance(variables, a, c) + distance(variables, b, d)
        right_atom = normalized_sum(
            normalized_pair(local[a], local[c]),
            normalized_pair(local[b], local[d]),
        )
        track(
            f"K1_{a}_{b}_{c}_{d}",
            distance(variables, a, b) + distance(variables, c, d) < diagonal,
            (
                "k1",
                normalized_sum(
                    normalized_pair(local[a], local[b]),
                    normalized_pair(local[c], local[d]),
                ),
                right_atom,
            ),
        )
        track(
            f"K2_{a}_{b}_{c}_{d}",
            distance(variables, a, d) + distance(variables, b, c) < diagonal,
            (
                "k2",
                normalized_sum(
                    normalized_pair(local[a], local[d]),
                    normalized_pair(local[b], local[c]),
                ),
                right_atom,
            ),
        )

    for row_index, row in enumerate(rows):
        center = row["center"]
        anchor = row["support"][0]
        for point in row["support"][1:]:
            left_pair = normalized_pair(local[center], local[anchor])
            right_pair = normalized_pair(local[center], local[point])
            name = f"E_{row_index}_{center}_{anchor}_{point}"
            atom = ("eq", *((pair,) for pair in sorted((left_pair, right_pair))))
            assertion = (
                distance(variables, center, anchor)
                == distance(variables, center, point)
            )
            solver.add(assertion)
            equality_assertions[name] = assertion
            atoms[name] = atom

    verdict = solver.check(*metric_assumptions)
    if verdict != z3.unsat:
        return {"status": str(verdict), "used_points": cyclic_points}

    metric_core = list(solver.unsat_core())

    def minimize(preferred, fixed):
        core = list(preferred)
        index = 0
        while index < len(core):
            trial = core[:index] + core[index + 1 :]
            if solver.check(*fixed, *trial) == z3.unsat:
                core = trial
            else:
                index += 1
        return core

    # Prefer a small inequality theorem first, while all learned row equalities
    # are hard constraints.  Then rebuild with precisely that metric core hard
    # and track the equalities so irrelevant learned rows can be removed.
    metric_core = minimize(metric_core, [])
    equality_solver = z3.Solver()
    equality_solver.set(timeout=timeout_ms)
    for tag in metric_core:
        equality_solver.add(metric_assertions[tag.decl().name()])
    equality_tags = []
    for name, assertion in equality_assertions.items():
        tag = z3.Bool(name)
        equality_solver.add(z3.Implies(tag, assertion))
        equality_tags.append(tag)
    if equality_solver.check(*equality_tags) != z3.unsat:
        return {"status": "unexpected-equality-sat", "used_points": cyclic_points}
    equality_core = list(equality_solver.unsat_core())

    def minimize_equalities(core):
        result = list(core)
        index = 0
        while index < len(result):
            trial = result[:index] + result[index + 1 :]
            if equality_solver.check(*trial) == z3.unsat:
                result = trial
            else:
                index += 1
        return result

    equality_core = minimize_equalities(equality_core)

    names = tuple(sorted(tag.decl().name() for tag in (*equality_core, *metric_core)))
    core_atoms = tuple(sorted(atoms[name] for name in names))
    return {
        "status": "unsat",
        "used_points": cyclic_points,
        "names": names,
        "atoms": core_atoms,
        "canonical": canonical_dihedral(core_atoms, len(cyclic_points)),
    }


def map_atom(atom, mapping):
    kind = atom[0]
    if kind == "pos":
        return (kind, normalized_pair(*(mapping[value] for value in atom[1])))
    mapped_sides = []
    for side in atom[1:]:
        mapped_sides.append(
            normalized_sum(
                *(normalized_pair(mapping[left], mapping[right]) for left, right in side)
            )
        )
    if kind == "eq":
        return (kind, *sorted(mapped_sides))
    return (kind, *mapped_sides)


def canonical_dihedral(atoms, point_count: int):
    candidates = []
    for reflected in (False, True):
        for shift in range(point_count):
            mapping = {}
            for point in range(point_count):
                oriented = -point if reflected else point
                mapping[point] = (oriented + shift) % point_count
            candidates.append(tuple(sorted(map_atom(atom, mapping) for atom in atoms)))
    return min(candidates)


def default_journals() -> list[Path]:
    journals = []
    for seed in range(1801, 1817):
        journals.append(ROOT / f"schema-cde-wave2-seed{seed}" / "journal.jsonl")
    for seed in range(1901, 1909):
        journals.append(ROOT / f"schema-cdef-wave3-seed{seed}" / "journal.jsonl")
    return journals


def row_key(order, rows):
    return (
        tuple(int(point) for point in order),
        tuple(
            sorted(
                (
                    int(row["center"]),
                    tuple(sorted(int(point) for point in row["support"])),
                    bool(row.get("exact", False)),
                )
                for row in rows
            )
        ),
    )


def load_weighted_cache_keys(path: Path | None) -> set[tuple]:
    if path is None:
        return set()
    payload = json.loads(path.read_text())
    if payload.get("status") != "complete":
        raise ValueError(f"incomplete weighted cache: {path}")
    return {
        row_key(record["order"], record["rows"])
        for record in payload.get("results", ())
    }


def load_core_audits(
    audits: list[Path], excluded: set[tuple], include_bank_hits: bool
):
    """Load only theorem-bank misses from source-faithful core audits."""
    for audit in audits:
        payload = json.loads(audit.read_text())
        if payload.get("schema") != "p97-rigid221-exact17-source-faithful-core-bank-audit-v1":
            raise ValueError(f"unsupported core-audit schema: {audit}")
        for index, record in enumerate(payload["records"]):
            if record["hits"] and not include_bank_hits:
                continue
            if row_key(record["order"], record["rows"]) in excluded:
                continue
            yield audit, {
                "iteration": index,
                "learned_rows": record["rows"],
                "order": record["order"],
            }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--journal", action="append", type=Path)
    parser.add_argument("--core-audit", action="append", type=Path)
    parser.add_argument("--exclude-weighted-cache", type=Path)
    parser.add_argument("--include-bank-hits", action="store_true")
    parser.add_argument("--iteration", type=int)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    if args.core_audit:
        excluded = load_weighted_cache_keys(args.exclude_weighted_cache)
        records = list(
            load_core_audits(args.core_audit, excluded, args.include_bank_hits)
        )
    else:
        journals = args.journal or default_journals()
        records = list(load_linear_records(journals))
    if args.iteration is not None:
        records = [item for item in records if item[1]["iteration"] == args.iteration]
    if args.limit is not None:
        records = records[: args.limit]

    results = []
    for journal, record in records:
        result = tracked_support(record, args.timeout_ms)
        result.update({"journal": str(journal), "iteration": record["iteration"]})
        results.append(result)

    signature_counts = Counter(
        json.dumps(result.get("canonical"), separators=(",", ":"))
        for result in results
        if result["status"] == "unsat"
    )
    payload = {
        "records": len(results),
        "status_counts": dict(Counter(result["status"] for result in results)),
        "distinct_signatures": len(signature_counts),
        "top_signatures": signature_counts.most_common(20),
        "results": results,
        "evidence_scope": "exact QF_LRA theorem discovery; not a Lean proof",
    }
    rendered = json.dumps(payload, indent=2, sort_keys=True)
    if args.output:
        args.output.write_text(rendered + "\n")
        print(
            json.dumps(
                {
                    "output": str(args.output),
                    "records": len(results),
                    "distinct_signatures": len(signature_counts),
                    "top_counts": [count for _, count in signature_counts.most_common(10)],
                },
                sort_keys=True,
            )
        )
    else:
        print(rendered)


if __name__ == "__main__":
    main()
