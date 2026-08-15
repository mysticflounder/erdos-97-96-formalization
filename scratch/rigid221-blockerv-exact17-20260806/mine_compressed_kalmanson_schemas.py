#!/usr/bin/env python3
"""Test whether weighted-certificate row data is already locally impossible.

The global exact-17 oracle may use unnamed intermediate boundary vertices in
its Farkas proof.  For theorem mining we instead keep only vertices occurring
in the selected-row equalities, compress their inherited cyclic order, and ask
whether positivity, triangle inequalities, and strict Kalmanson inequalities
on that smaller ordered set already contradict those equalities.

UNSAT here is a proposal for a cardinality-independent ordered-row theorem; it
is not a promoted certificate until exact extraction and Lean replay land.
"""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path

import z3

from census.atail_force import producer_bank


def distance(ds: dict[tuple[int, int], z3.ArithRef], a: int, b: int):
    return ds[tuple(sorted((a, b)))]


def dihedral_equality_signature(
    n: int, equalities: list[tuple[int, int, int]]
) -> list[list[int]]:
    """Canonical cyclic/reflection signature of centered distance equalities."""

    images: list[tuple[tuple[int, int, int], ...]] = []
    for reflected in (False, True):
        for shift in range(n):
            def image(
                point: int,
                *,
                reflected: bool = reflected,
                shift: int = shift,
            ) -> int:
                base = -point if reflected else point
                return (base + shift) % n

            transformed = []
            for center, left, right in equalities:
                out_left, out_right = sorted((image(left), image(right)))
                transformed.append((image(center), out_left, out_right))
            images.append(tuple(sorted(transformed)))
    return [list(item) for item in min(images)]


def compressed_replay(payload: dict, timeout_ms: int) -> dict:
    rows = payload["rows"]
    inherited_order = tuple(int(point) for point in payload["order"])
    used = {
        int(point)
        for row in rows
        for point in (int(row["center"]), *map(int, row["support"]))
    }
    ordered = tuple(point for point in inherited_order if point in used)
    remap = {point: index for index, point in enumerate(ordered)}
    n = len(ordered)

    ds = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in combinations(range(n), 2)
    }
    solver = z3.Solver()
    solver.set(timeout=timeout_ms)
    solver.add(*(value > 0 for value in ds.values()))
    solver.add(distance(ds, 0, 1) == 1)
    for a, b, c in combinations(range(n), 3):
        solver.add(distance(ds, a, c) < distance(ds, a, b) + distance(ds, b, c))
        solver.add(distance(ds, a, b) < distance(ds, a, c) + distance(ds, b, c))
        solver.add(distance(ds, b, c) < distance(ds, a, b) + distance(ds, a, c))
    for a, b, c, d in combinations(range(n), 4):
        diagonal = distance(ds, a, c) + distance(ds, b, d)
        solver.add(distance(ds, a, b) + distance(ds, c, d) < diagonal)
        solver.add(distance(ds, a, d) + distance(ds, b, c) < diagonal)

    assumptions: list[z3.BoolRef] = []
    provenance: dict[str, tuple[int, int, int]] = {}
    for row_index, row in enumerate(rows):
        center = remap[int(row["center"])]
        support = tuple(remap[int(point)] for point in row["support"])
        anchor = support[0]
        for point in support[1:]:
            tag = z3.Bool(f"row_{row_index}_{anchor}_{point}")
            solver.add(z3.Implies(
                tag,
                distance(ds, center, point) == distance(ds, center, anchor),
            ))
            assumptions.append(tag)
            provenance[tag.decl().name()] = (row_index, anchor, point)

    verdict = solver.check(*assumptions)
    core = None
    if verdict == z3.unsat:
        core_tags = list(solver.unsat_core())
        index = 0
        while index < len(core_tags):
            trial = core_tags[:index] + core_tags[index + 1 :]
            if solver.check(*trial) == z3.unsat:
                core_tags = trial
            else:
                index += 1
        core = [provenance[tag.decl().name()] for tag in core_tags]

    minimal_equalities = None
    canonical_signature = None
    if core is not None:
        minimal_equalities = sorted(
            (
                remap[int(rows[row_index]["center"])],
                min(anchor, point),
                max(anchor, point),
            )
            for row_index, anchor, point in core
        )
        canonical_signature = dihedral_equality_signature(n, minimal_equalities)

    metric_rows = tuple(
        producer_bank.MetricRow(
            int(row["center"]),
            tuple(int(point) for point in row["support"]),
            exact=bool(row["exact"]),
        )
        for row in rows
    )
    bank_stages = sorted({
        record["stage"]
        for record in producer_bank.scan_all_formalized_cores(
            metric_rows,
            len(inherited_order),
            inherited_order,
            include_extended=False,
            include_common_system=False,
        )
        if "selected-row-kalmanson" in record["stage"]
    })

    return {
        "verdict": str(verdict),
        "original_vertex_count": len(inherited_order),
        "compressed_vertex_count": n,
        "compressed_order_original_labels": ordered,
        "row_count": len(rows),
        "equality_count": len(assumptions),
        "minimal_equality_core": core,
        "minimal_distance_equalities": minimal_equalities,
        "dihedral_equality_signature": canonical_signature,
        "canonical_ordered_row_bank_stages": bank_stages,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--certificate", type=Path, action="append", required=True)
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    records = []
    for path in args.certificate:
        payload = json.loads(path.read_text())
        records.append({
            "certificate": str(path.resolve()),
            **compressed_replay(payload, args.timeout_ms),
        })
    report = {
        "schema": "p97-compressed-kalmanson-schema-mining-v1",
        "records": records,
        "counts": {
            verdict: sum(record["verdict"] == verdict for record in records)
            for verdict in ("unsat", "sat", "unknown")
        },
    }
    args.output.write_text(json.dumps(report, indent=2, sort_keys=True) + "\n")
    print(json.dumps(report["counts"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
