#!/usr/bin/env python3
"""Can an all-center-K4 cyclic structure AVOID the small schemas, at any n?

This probe attacks the covering step rather than the card-14 decision.
The schemas are support-local UNSAT on their own <= k points, hence
cardinality-free: each is refuted by positivity + strict triangle + strict
Kalmanson on the induced cyclic suborder alone, so every order-preserving
embedding into an n-cycle is equally refuted, for every n.  Blocking a
schema's whole embedding orbit is therefore a theorem of the metric layer
at any n, not a card-14 artifact.

The question this decides, per n and per support bound s:

  is there an assignment of a complete radius partition to each of n
  cyclically ordered points, with a class of size >= 4 at EVERY center
  (all-center K4), that contains no instance of any bank schema of
  support <= s?

UNSAT says: all-center K4 plus the small-schema family alone is already
contradictory at that n — the covering step needs no global fields, and a
general-n covering lemma over a handful of small schemas is the target.
SAT says the opposite: avoidance is possible, so the global fields
(minimality shell cover, total critical map, apex robustness, frontier
packet) are load-bearing in the covering argument, and the SAT witness
shows exactly which freedom they must kill.

Both answers are informative and both are reported.  This decides a
Boolean abstraction; it is not a Euclidean realizability claim.
"""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import schema_mine as S  # noqa: E402


class CNF:
    def __init__(self) -> None:
        self.ids: dict[str, int] = {}
        self.clauses: list[tuple[int, ...]] = []

    def var(self, name: str) -> int:
        found = self.ids.get(name)
        if found is None:
            found = len(self.ids) + 1
            self.ids[name] = found
        return found

    def add(self, literals: list[int]) -> None:
        clause = tuple(dict.fromkeys(literals))
        if any(-lit in set(clause) for lit in clause):
            return
        self.clauses.append(clause)

    def write(self, path: Path) -> None:
        with path.open("w", encoding="ascii") as handle:
            handle.write(f"p cnf {len(self.ids)} {len(self.clauses)}\n")
            for clause in self.clauses:
                handle.write(" ".join(map(str, clause)) + " 0\n")


def build(n: int, schemas: list[tuple[int, tuple[S.Atom, ...]]],
          k4: bool, cover: bool = False,
          geometry: bool = False) -> tuple[CNF, dict[str, int]]:
    cnf = CNF()
    points = range(n)

    def eq(center: int, left: int, right: int) -> int:
        left, right = min(left, right), max(left, right)
        assert center not in (left, right) and left != right
        return cnf.var(f"eq_{center}_{left}_{right}")

    # Complete radius partition at every center: eq is an equivalence
    # relation on the other n-1 points (reflexivity/symmetry are implicit
    # in the representation; transitivity is asserted).
    for center in points:
        others = [p for p in points if p != center]
        for left, mid, right in itertools.permutations(others, 3):
            if left < right:
                cnf.add([
                    -eq(center, left, mid), -eq(center, mid, right),
                    eq(center, left, right),
                ])

    # All-center K4: at every center some 4-subset is pairwise co-radial.
    if k4:
        for center in points:
            others = [p for p in points if p != center]
            row = {
                quad: cnf.var(f"row_{center}_" + "_".join(map(str, quad)))
                for quad in itertools.combinations(others, 4)
            }
            cnf.add(list(row.values()))
            for quad, selector in row.items():
                for left, right in itertools.combinations(quad, 2):
                    cnf.add([-selector, eq(center, left, right)])

    # Partition-level geometric families.  These are theorems of strictly
    # convex position at every n and were already present in the lcap14
    # surface, so the mined bank omits their patterns; a probe without them
    # tests a strictly weaker constraint set than the one that produced the
    # schemas.  Bisector capacity and alternation are the interleaving
    # lemma; circle-pair is the two-circle bound.
    geometry_clauses = 0
    if geometry:
        def separates(x: int, y: int, c: int, cp: int) -> bool:
            side = set()
            i = (x + 1) % n
            while i != y:
                side.add(i)
                i = (i + 1) % n
            return (c in side) != (cp in side)

        for left, right in itertools.combinations(points, 2):
            outside = [p for p in points if p not in (left, right)]
            for trio in itertools.combinations(outside, 3):
                cnf.add([-eq(c, left, right) for c in trio])
                geometry_clauses += 1
            for c, cp in itertools.combinations(outside, 2):
                if not separates(left, right, c, cp):
                    cnf.add([-eq(c, left, right), -eq(cp, left, right)])
                    geometry_clauses += 1

        for c, cp in itertools.combinations(points, 2):
            common = [p for p in points if p not in (c, cp)]
            for x, y, z in itertools.combinations(common, 3):
                cnf.add([
                    -eq(c, x, y), -eq(c, x, z), -eq(cp, x, y), -eq(cp, x, z),
                ])
                geometry_clauses += 1

    # Minimality shell cover (the professor's Theorem C, cardinality-free):
    # every point lies on the exact critical 4-shell of some non-robust
    # center.  Only the necessary consequences are encoded, so the instance
    # is weaker than the truth and an UNSAT verdict proves more.
    cover_clauses = 0
    if cover:
        sel: dict[tuple[int, tuple[int, ...]], int] = {}
        for center in points:
            others = [p for p in points if p != center]
            for quad in itertools.combinations(others, 4):
                selector = cnf.var(
                    f"shell_{center}_" + "_".join(map(str, quad))
                )
                sel[center, quad] = selector
                # The shell is pairwise co-radial at its center.
                for left, right in itertools.combinations(quad, 2):
                    cnf.add([-selector, eq(center, left, right)])
                    cover_clauses += 1
                # The shell is a COMPLETE class: nothing outside joins it.
                for outside in others:
                    if outside in quad:
                        continue
                    cnf.add([-selector, -eq(center, quad[0], outside)])
                    cover_clauses += 1
                # Criticality: the shell is the center's ONLY >=4 class, so
                # no disjoint 4-subset is pairwise co-radial (a spanning
                # tree of three edges suffices under transitivity).
                rest = [p for p in others if p not in quad]
                for other in itertools.combinations(rest, 4):
                    cnf.add([-selector] + [
                        -eq(center, other[0], other[index])
                        for index in (1, 2, 3)
                    ])
                    cover_clauses += 1
        # Cover: every point sits on some center's critical shell.
        for point in points:
            cnf.add([
                selector for (center, quad), selector in sel.items()
                if center != point and point in quad
            ])
            cover_clauses += 1

    # Block every order-preserving embedding orbit of every schema.
    blocked = 0
    for k, atoms in schemas:
        for image in itertools.combinations(points, k):
            for reflect in (False, True):
                for rotation in range(k):
                    def place(i: int) -> int:
                        j = ((rotation - i) if reflect else (i + rotation)) % k
                        return image[j]
                    literals = []
                    for sign, center, left, right in atoms:
                        c, l, r = place(center), place(left), place(right)
                        if c in (l, r) or l == r:
                            literals = []
                            break
                        var = eq(c, l, r)
                        literals.append(-var if sign == "+" else var)
                    if literals:
                        cnf.add(literals)
                        blocked += 1
    return cnf, {
        "orbit_clauses": blocked,
        "cover_clauses": cover_clauses,
        "geometry_clauses": geometry_clauses,
    }


def solve(cnf: CNF, timeout: float) -> tuple[str, float]:
    with tempfile.NamedTemporaryFile(
        "w", suffix=".cnf", delete=False, encoding="ascii"
    ) as handle:
        path = Path(handle.name)
    cnf.write(path)
    try:
        completed = subprocess.run(
            ["cadical", "-q", str(path)],
            capture_output=True, text=True, timeout=timeout, check=False,
        )
    except subprocess.TimeoutExpired:
        return "TIMEOUT", timeout
    finally:
        path.unlink(missing_ok=True)
    if completed.returncode == 10:
        return "SAT", 0.0
    if completed.returncode == 20:
        return "UNSAT", 0.0
    raise RuntimeError(f"cadical exit {completed.returncode}")


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--bank", type=Path, default=HERE / "schema-bank.json")
    parser.add_argument("--max-support", type=int, default=5)
    parser.add_argument("--n", type=int, nargs="+",
                        default=[7, 8, 9, 10, 11, 12])
    parser.add_argument("--no-k4", action="store_true")
    parser.add_argument("--cover", action="store_true",
                        help="add the minimality shell cover (Theorem C)")
    parser.add_argument("--geometry", action="store_true",
                        help="add bisector/alternation/circle-pair families")
    parser.add_argument("--timeout", type=float, default=600.0)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    bank = json.loads(args.bank.read_text(encoding="utf-8"))["schemas"]
    schemas = [
        (record["support"], tuple(tuple(a) for a in record["atoms"]))
        for record in bank
        if record["support"] <= args.max_support
    ]
    print(f"schemas with support <= {args.max_support}: {len(schemas)}",
          flush=True)

    results = []
    for n in args.n:
        if n < args.max_support:
            continue
        cnf, stats = build(n, schemas, k4=not args.no_k4,
                           cover=args.cover, geometry=args.geometry)
        status, _ = solve(cnf, args.timeout)
        record = {
            "n": n, "status": status,
            "variables": len(cnf.ids), "clauses": len(cnf.clauses),
            **stats,
        }
        results.append(record)
        print(json.dumps(record), flush=True)

    if args.output:
        args.output.write_text(
            json.dumps({
                "max_support": args.max_support,
                "schemas": len(schemas),
                "k4": not args.no_k4,
                "results": results,
            }, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
