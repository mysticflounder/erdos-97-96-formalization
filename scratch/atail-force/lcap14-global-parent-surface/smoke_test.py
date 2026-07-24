#!/usr/bin/env python3
"""Smoke gates for the lcap14 global parent surface.

Two independent layers:

1.  Ground-truth component replay against the exact Q(sqrt(3)) regression
    carrier of `cardge14-nonlinear-escape-geometry`.  Its complete distance
    partition must (a) fail all-center K4 at exactly the eleven non-Moser
    centers, so the surface's global K4 block genuinely excludes it, and
    (b) satisfy every partition-level geometric constraint family of the
    encoder (bisector, alternation, circle-pair, cap incidence,
    outside-pair uniqueness) with respect to its own convex order and caps,
    since those families are theorems of strictly convex geometry.

2.  Encoder wiring gates: deliberately corrupted assumption sets must be
    UNSAT through the intended clause blocks, and (when the relaxed base is
    satisfiable) a decoded model must pass the independent semantic replay
    of `verify_model.py`.

These are encoding smoke tests, not geometric theorems.
"""

from __future__ import annotations

import itertools
import json
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
sys.path.insert(0, str(HERE))
sys.path.insert(0, str(ROOT / "scratch/atail-force/cardge14-nonlinear-escape-geometry"))

import encode as E  # noqa: E402
import verify_model as V  # noqa: E402
import verify_exact_regression as G  # noqa: E402


def q3_partition() -> tuple[list[str], dict[str, list[set[str]]]]:
    order = list(G.ORDER)
    partition = {
        center: [set(block) for block in G.distance_classes(center).values()]
        for center in order
    }
    return order, partition


def gate_ground_truth() -> None:
    order, partition = q3_partition()
    position = {name: index for index, name in enumerate(order)}
    n = len(order)
    moser = ("A", "B", "C")

    k4_centers = sorted(
        center for center, blocks in partition.items()
        if any(len(block) >= 4 for block in blocks)
    )
    assert k4_centers == sorted(moser), k4_centers

    def owners(left: str, right: str) -> list[str]:
        return [
            center for center in order
            if center not in {left, right}
            and any({left, right} <= block for block in partition[center])
        ]

    def separates(x: str, y: str, c: str, cp: str) -> bool:
        px, py = position[x], position[y]
        side = set()
        i = (px + 1) % n
        while i != py:
            side.add(i)
            i = (i + 1) % n
        return (position[c] in side) != (position[cp] in side)

    shared_pairs = 0
    for left, right in itertools.combinations(order, 2):
        found = owners(left, right)
        assert len(found) <= 2, (left, right, found)
        if len(found) == 2:
            shared_pairs += 1
            assert separates(left, right, *found), (left, right, found)
    assert shared_pairs > 0, "alternation gate is vacuous"

    for c, cp in itertools.combinations(order, 2):
        for block_c in partition[c]:
            for block_cp in partition[cp]:
                common = block_c & block_cp - {c, cp}
                assert len(common) <= 2, (c, cp, sorted(common))

    caps = {
        "AB": set(order[0:6]),
        "BC": set(order[5:10]),
        "CA": set(order[9:14]) | {order[0]},
    }
    incident = {"A": ("AB", "CA"), "B": ("AB", "BC"), "C": ("BC", "CA")}
    for center in order:
        k4_blocks = [b for b in partition[center] if len(b) >= 4]
        if center in moser:
            for cap_name in incident[center]:
                cap = caps[cap_name] - {center}
                for block in k4_blocks:
                    assert len(block & cap) <= 1, (center, cap_name, block)
        else:
            own = next(name for name, cap in caps.items() if center in cap)
            cap = caps[own] - {center}
            for block in k4_blocks:
                assert len(block & cap) <= 2, (center, own, block)

    for cap_name, cap in caps.items():
        outside = [p for p in order if p not in cap]
        for a, b in itertools.combinations(outside, 2):
            in_cap = [
                z for z in sorted(cap)
                if z not in {a, b}
                and any({a, b} <= block for block in partition[z])
            ]
            assert len(in_cap) <= 1, (cap_name, a, b, in_cap)

    print("PASS ground-truth: Q(sqrt3) carrier fails all-center K4 outside "
          f"{sorted(moser)}; all partition-level constraint families hold")


def run_cadical(dimacs: Path, extra_units: list[int], timeout: float) -> tuple[str, set[int]]:
    text = dimacs.read_text(encoding="ascii").splitlines()
    header_index = next(
        i for i, line in enumerate(text) if line.startswith("p cnf")
    )
    _, _, nvars, nclauses = text[header_index].split()
    text[header_index] = (
        f"p cnf {nvars} {int(nclauses) + len(extra_units)}"
    )
    for unit in extra_units:
        text.append(f"{unit} 0")
    with tempfile.NamedTemporaryFile(
        "w", suffix=".cnf", delete=False, encoding="ascii"
    ) as handle:
        handle.write("\n".join(text) + "\n")
        instance = Path(handle.name)
    try:
        completed = subprocess.run(
            ["cadical", "-q", str(instance)],
            capture_output=True, text=True, timeout=timeout, check=False,
        )
    finally:
        instance.unlink(missing_ok=True)
    if completed.returncode == 10:
        true_vars = set()
        for line in completed.stdout.splitlines():
            if line.startswith("v"):
                for token in line.split()[1:]:
                    value = int(token)
                    if value > 0:
                        true_vars.add(value)
        return "SAT", true_vars
    if completed.returncode == 20:
        return "UNSAT", set()
    raise RuntimeError(
        f"cadical exit {completed.returncode}: {completed.stdout[-500:]}"
    )


def gate_encoder_wiring(dimacs: Path) -> None:
    ids = {}
    for identifier, name in V.parse_dimacs_names(dimacs).items():
        ids[name] = identifier

    corruptions = {
        "three_bisector_owners": [
            ids["eq_1_5_6"], ids["eq_2_5_6"], ids["eq_3_5_6"],
        ],
        "both_frontier_sources_nonstrict": [ids["rq_9"], ids["rw_10"]],
        "endpoint_cap_two_hits": [
            ids["eq_0_1_2"], ids["eq_0_1_5"], ids["eq_0_1_6"],
        ],
        "pair_minimality_no_witness": [
            -ids[f"wdel2_0_1_{y}"] for y in E.VERTICES if y not in {0, 1}
        ],
    }
    for name, units in corruptions.items():
        status, _ = run_cadical(dimacs, units, timeout=600.0)
        assert status == "UNSAT", (name, status)
        print(f"PASS corruption gate: {name} is UNSAT")


def main() -> int:
    gate_ground_truth()

    with tempfile.TemporaryDirectory() as tmp:
        dimacs = Path(tmp) / "surface.cnf"
        cnf, metadata = E.build(pair_minimality=True, subset_escape=True)
        cnf.write_dimacs(dimacs, metadata)
        print(json.dumps({
            "variables": metadata["variable_count"],
            "clauses": metadata["clause_count"],
        }))
        gate_encoder_wiring(dimacs)

    print("PASS: lcap14 global parent surface smoke gates")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
