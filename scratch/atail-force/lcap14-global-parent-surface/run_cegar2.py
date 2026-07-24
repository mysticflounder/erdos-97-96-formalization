#!/usr/bin/env python3
"""Schema-generalized CEGAR: lcap14 surface vs strict-Kalmanson schemas.

Upgrade over `run_cegar.py` (one blocking clause per witness): every
metric-UNSAT core is canonicalized to its order-isomorphism schema,
minimized by deletion at rank level (each removal re-verified
support-local UNSAT by z3 on the schema's own support), and then its
*entire dihedral-embedding orbit* into the 14-cycle is blocked — all
cyclic-order-preserving placements, rotations and reflections alike.
Soundness: a support-local-UNSAT schema is infeasible under every such
embedding because the positivity/triangle/strict-Kalmanson family
restricts to the induced cyclic suborder.  Each orbit is a theorem of the
metric layer, so the added clauses never exclude a realizable witness.

Seeding: all schemas already mined from `cores.jsonl` and the professor
probe bank are minimized, deduped, verified, and instantiated up front.

Ground-truth gate (runs before the loop): the exact Q(sqrt(3)) carrier's
equality pattern must satisfy every instantiated clause — a genuine
strictly convex carrier contains no metrically infeasible sub-pattern, so
any violation is an instantiation bug and aborts the run.

Terminals:
  survivor  — strict-Kalmanson-feasible witness of the full surface
              (dump + exit 1; Euclidean escalation required);
  OUTER UNSAT — the surface plus the accumulated schema orbits is
              unsatisfiable; the driver re-emits the final CNF and runs
              CaDiCaL with a DRAT proof for `drat-trim` certification
              (that CNF + schema bank is the coverage object);
  budget    — schema bank saved for `--resume`.
"""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
import sys
import time
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))

import encode as E  # noqa: E402
import metric_oracle as M  # noqa: E402
import schema_mine as S  # noqa: E402
import verify_model as V  # noqa: E402

from pysat.solvers import Cadical195  # noqa: E402

N = 14
Schema = tuple[int, tuple[S.Atom, ...]]


def minimize_schema(k: int, atoms: tuple[S.Atom, ...]) -> Schema:
    """Deletion-minimize at rank level, then re-canonicalize."""
    if S.decide_schema(k, atoms) != "unsat":
        raise ValueError("schema is not support-local UNSAT")
    current = list(atoms)
    changed = True
    while changed:
        changed = False
        for index in range(len(current)):
            trial = current[:index] + current[index + 1:]
            if not trial:
                continue
            trial_support = S.support(trial)
            rank = {p: i for i, p in enumerate(trial_support)}
            ranked = tuple(
                (sign, rank[c], rank[l], rank[r]) for sign, c, l, r in trial
            )
            if S.decide_schema(len(trial_support), ranked) == "unsat":
                current = trial
                changed = True
                break
    return S.canonical_schema(current)


def orbit_clauses(
    k: int, atoms: tuple[S.Atom, ...], eq_atoms: dict[M.Atom, int],
) -> set[frozenset[int]]:
    clauses: set[frozenset[int]] = set()
    for image in itertools.combinations(range(N), k):
        for reflect in (False, True):
            for rotation in range(k):
                def place(i: int) -> int:
                    j = ((rotation - i) if reflect else (i + rotation)) % k
                    return image[j]
                literals = []
                for sign, center, left, right in atoms:
                    c, l, r = place(center), place(left), place(right)
                    var = eq_atoms[(c, min(l, r), max(l, r))]
                    literals.append(-var if sign == "+" else var)
                clauses.add(frozenset(literals))
    return clauses


def q3_epos_names() -> set[tuple[int, int, int]]:
    epos, _ = M.q3_pattern()
    return set(epos)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dimacs", type=Path, default=HERE / "surface.cnf")
    parser.add_argument("--budget", type=int, default=2000)
    parser.add_argument("--workdir", type=Path, default=HERE / "cegar-work")
    parser.add_argument("--bank", type=Path, default=HERE / "schema-bank.json")
    parser.add_argument("--probe-cores", type=Path,
                        default=Path("/tmp/cover14-cores.txt"))
    parser.add_argument("--no-seed", action="store_true")
    parser.add_argument("--seed-limit", type=int, default=0,
                        help="seed only the first N raw cores (0 = all)")
    args = parser.parse_args()
    args.workdir.mkdir(parents=True, exist_ok=True)

    lines = args.dimacs.read_text(encoding="ascii").splitlines()
    names = V.parse_dimacs_names(args.dimacs)
    ids = {name: identifier for identifier, name in names.items()}
    eq_atoms: dict[M.Atom, int] = {}
    for center in E.VERTICES:
        for left, right in itertools.combinations(E.targets(center), 2):
            eq_atoms[(center, left, right)] = ids[f"eq_{center}_{left}_{right}"]

    solver = Cadical195()
    base_clauses = 0
    for line in lines:
        if line.startswith(("c", "p")):
            continue
        clause = [int(token) for token in line.split()[:-1]]
        if clause:
            solver.add_clause(clause)
            base_clauses += 1
    print(f"[init] base surface: {base_clauses} clauses", flush=True)

    # Seed schema bank.
    seed_cores: list[list[S.Atom]] = []
    if not args.no_seed:
        if args.bank.exists():
            bank_records = json.loads(args.bank.read_text(encoding="utf-8"))
            for record in bank_records["schemas"]:
                seed_cores.append([tuple(a) for a in record["atoms"]])
            print(f"[seed] {len(seed_cores)} schemas from {args.bank.name}",
                  flush=True)
        else:
            lane = HERE / "cores.jsonl"
            if lane.exists():
                seed_cores.extend(S.load_lane(lane))
            if args.probe_cores.exists():
                seed_cores.extend(S.load_probe(args.probe_cores))
            print(f"[seed] {len(seed_cores)} raw cores from banks", flush=True)

    if args.seed_limit and len(seed_cores) > args.seed_limit:
        seed_cores = seed_cores[:args.seed_limit]
        print(f"[seed] limited to first {args.seed_limit} cores", flush=True)

    schemas: set[Schema] = set()
    q3_pattern = q3_epos_names()
    var_to_atom = {var: atom for atom, var in eq_atoms.items()}
    total_orbit_clauses = 0

    def admit(core_atoms: list[S.Atom], stage: str) -> bool:
        """Minimize, dedupe, gate, instantiate, add.  True if new."""
        nonlocal total_orbit_clauses
        k0, canon0 = S.canonical_schema(core_atoms)
        if S.decide_schema(k0, canon0) != "unsat":
            return False  # ambient-dependent; caller falls back
        key = minimize_schema(k0, canon0)
        if key in schemas:
            return False
        k, atoms = key
        clauses = orbit_clauses(k, atoms, eq_atoms)
        # Ground-truth gate: the Q(sqrt3) pattern must not realize any
        # embedded instance (a genuine strictly convex carrier satisfies
        # every clause; a violated clause means an instantiation bug).
        for clause in clauses:
            violated = all(
                (var_to_atom[-lit] in q3_pattern) if lit < 0
                else (var_to_atom[lit] not in q3_pattern)
                for lit in clause
            )
            if violated:
                raise AssertionError(
                    f"instantiated clause violated by Q(sqrt3) carrier: "
                    f"schema {atoms}, clause {sorted(clause)}"
                )
        for clause in clauses:
            solver.add_clause(list(clause))
        schemas.add(key)
        total_orbit_clauses += len(clauses)
        print(f"[{stage}] schema k={k} atoms={len(atoms)} "
              f"orbit={len(clauses)} (bank {len(schemas)}, "
              f"clauses {total_orbit_clauses})", flush=True)
        return True

    started = time.monotonic()
    for core in seed_cores:
        admit(core, "seed")
    print(f"[seed] done: {len(schemas)} schemas, {total_orbit_clauses} orbit "
          f"clauses, {time.monotonic() - started:.0f}s", flush=True)

    def save_bank() -> None:
        args.bank.write_text(json.dumps({
            "schemas": [
                {"support": k, "atoms": [list(a) for a in atoms]}
                for k, atoms in sorted(schemas)
            ],
        }, indent=2, sort_keys=True) + "\n", encoding="utf-8")

    save_bank()

    for iteration in range(1, args.budget + 1):
        if not solver.solve():
            print(f"[iter {iteration}] OUTER UNSAT with {len(schemas)} "
                  f"schemas / {total_orbit_clauses} orbit clauses.", flush=True)
            save_bank()
            final = args.workdir / "final.cnf"
            all_clauses = []
            for line in lines:
                if line.startswith(("c", "p")):
                    continue
                clause = [int(token) for token in line.split()[:-1]]
                if clause:
                    all_clauses.append(clause)
            extra = set()
            for k, atoms in schemas:
                extra |= orbit_clauses(k, atoms, eq_atoms)
            with final.open("w", encoding="ascii") as handle:
                handle.write(
                    f"p cnf {len(names)} {len(all_clauses) + len(extra)}\n"
                )
                for clause in all_clauses:
                    handle.write(" ".join(map(str, clause)) + " 0\n")
                for clause_set in extra:
                    handle.write(
                        " ".join(map(str, sorted(clause_set))) + " 0\n"
                    )
            drat = args.workdir / "final.drat"
            result = subprocess.run(
                ["cadical", "-q", str(final), str(drat)],
                capture_output=True, text=True, check=False,
            )
            print(f"[final] cadical exit {result.returncode} "
                  f"(20 = certified UNSAT candidate)", flush=True)
            if result.returncode == 20:
                trim = subprocess.run(
                    ["drat-trim", str(final), str(drat)],
                    capture_output=True, text=True, check=False,
                )
                verdict = ("s VERIFIED" in trim.stdout)
                print(f"[final] drat-trim verified: {verdict}", flush=True)
            return 0

        model = {
            abs(lit) for lit in solver.get_model() or [] if lit > 0
        }
        decoded = V.Decoded(names, model)
        V.verify(decoded, pair_minimality=True, subset_escape=True)

        epos = [atom for atom, var in eq_atoms.items() if var in model]
        eneg = [atom for atom, var in eq_atoms.items() if var not in model]
        status, core = M.run_oracle(epos, eneg, args.workdir)
        if status == "sat":
            survivor = args.workdir / "survivor2.json"
            survivor.write_text(json.dumps({
                "iteration": iteration,
                "schemas": len(schemas),
                "epos": sorted(epos),
            }, indent=2, sort_keys=True, default=list) + "\n",
                encoding="utf-8")
            print(f"[iter {iteration}] METRIC SURVIVOR under "
                  f"{len(schemas)}-schema bank; dumped to {survivor}. "
                  f"Euclidean escalation required.", flush=True)
            save_bank()
            return 1

        if not core:
            print(f"[iter {iteration}] empty pattern core — aborting.",
                  flush=True)
            return 2

        core_atoms = [
            S.normalize(sign, *atom) for sign, atom in core
        ]
        if not admit(core_atoms, f"iter {iteration}"):
            # Known schema (or ambient-dependent): block the concrete core.
            clause = [
                -eq_atoms[atom] if sign == "+" else eq_atoms[atom]
                for sign, atom in core
            ]
            solver.add_clause(clause)
            print(f"[iter {iteration}] fallback single-core block "
                  f"(size {len(clause)})", flush=True)
        if iteration % 25 == 0:
            save_bank()
            elapsed = time.monotonic() - started
            print(f"[stats] iter {iteration}: {len(schemas)} schemas, "
                  f"{total_orbit_clauses} orbit clauses, {elapsed:.0f}s",
                  flush=True)

    save_bank()
    print(f"[budget] exhausted at {args.budget}; {len(schemas)} schemas; "
          f"no survivor; outer not exhausted.", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
