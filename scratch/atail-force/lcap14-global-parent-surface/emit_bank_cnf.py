#!/usr/bin/env python3
"""Emit `surface.cnf` + schema-orbit clauses as one standalone DIMACS file.

Separates instance construction from solving so the outer decision can be
run with explicit CaDiCaL options.  `run_cegar2.py` used pysat's default
configuration, where the first solve on the full bank did not return in
5.5 h; the working hypothesis is that bounded variable elimination on a
2,685-variable / 34.7M-clause instance (occurrence lists ~100k long) is
responsible rather than the search itself.  Emitting to disk lets that be
tested directly (`--no-elim` etc.) and lets a scaling ladder be run over
`--schema-limit`.

Orbit instantiation is identical to `run_cegar2.py` (full dihedral
embedding orbit of each schema into the 14-cycle) and every instantiated
clause is re-gated against the exact Q(sqrt(3)) carrier, so the emitted
instance carries the same soundness argument.
"""

from __future__ import annotations

import argparse
import itertools
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import encode as E  # noqa: E402
import metric_oracle as M  # noqa: E402
import run_cegar2 as R  # noqa: E402
import verify_model as V  # noqa: E402


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dimacs", type=Path, default=HERE / "surface.cnf")
    parser.add_argument("--bank", type=Path, default=HERE / "schema-bank.json")
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--schema-limit", type=int, default=0,
                        help="use only the first N schemas (0 = all)")
    parser.add_argument("--order", choices=("bank", "orbit-asc"),
                        default="bank",
                        help="orbit-asc puts cheap (small-orbit) schemas first")
    parser.add_argument("--max-support", type=int, default=0,
                        help="use only schemas with support <= N (0 = all)")
    args = parser.parse_args()

    lines = args.dimacs.read_text(encoding="ascii").splitlines()
    names = V.parse_dimacs_names(args.dimacs)
    ids = {name: identifier for identifier, name in names.items()}
    eq_atoms: dict[M.Atom, int] = {}
    for center in E.VERTICES:
        for left, right in itertools.combinations(E.targets(center), 2):
            eq_atoms[(center, left, right)] = ids[f"eq_{center}_{left}_{right}"]
    var_to_atom = {var: atom for atom, var in eq_atoms.items()}
    q3 = set(M.q3_pattern()[0])

    base = []
    for line in lines:
        if line.startswith(("c", "p")):
            continue
        clause = [int(token) for token in line.split()[:-1]]
        if clause:
            base.append(clause)

    bank = json.loads(args.bank.read_text(encoding="utf-8"))["schemas"]
    schemas = [
        (record["support"], tuple(tuple(a) for a in record["atoms"]))
        for record in bank
    ]
    if args.max_support:
        schemas = [item for item in schemas if item[0] <= args.max_support]
    if args.order == "orbit-asc":
        schemas.sort(key=lambda item: (item[0], len(item[1])))
    if args.schema_limit:
        schemas = schemas[:args.schema_limit]

    extra: set[frozenset[int]] = set()
    for k, atoms in schemas:
        clauses = R.orbit_clauses(k, atoms, eq_atoms)
        for clause in clauses:
            violated = all(
                (var_to_atom[-lit] in q3) if lit < 0
                else (var_to_atom[lit] not in q3)
                for lit in clause
            )
            if violated:
                raise AssertionError(f"Q(sqrt3) gate: schema {atoms}")
        extra |= clauses

    with args.output.open("w", encoding="ascii") as handle:
        handle.write(f"c lcap14 surface + {len(schemas)} schema orbits\n")
        handle.write(f"p cnf {len(names)} {len(base) + len(extra)}\n")
        for clause in base:
            handle.write(" ".join(map(str, clause)) + " 0\n")
        for clause in extra:
            handle.write(" ".join(map(str, sorted(clause))) + " 0\n")

    print(json.dumps({
        "schemas": len(schemas),
        "base_clauses": len(base),
        "orbit_clauses": len(extra),
        "total_clauses": len(base) + len(extra),
        "variables": len(names),
        "output": str(args.output),
    }))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
