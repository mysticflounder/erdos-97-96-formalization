#!/usr/bin/env python3
"""CEGAR loop: lcap14 structural surface vs the exact strict-Kalmanson oracle.

Outer: CaDiCaL on `surface.cnf` plus accumulated blocking clauses.
Each SAT model is (a) semantically replayed by `verify_model.verify`
(encoder-independent; any failure is lane-stopping), then (b) its complete
eq/neq pattern is decided by the exact QF_LRA oracle of `metric_oracle.py`.

On metric-UNSAT the z3 unsat core (signed pattern atoms) is blocked and
logged to `cores.jsonl`.  On metric-SAT the loop stops and dumps the
survivor — that would be the sharpest countermodel yet and needs Euclidean
escalation.  On outer-UNSAT every witness pattern of the full production
surface is strict-Kalmanson-infeasible: the loop stops and the accumulated
core bank becomes the input to schema mining (the certificate pipeline).
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
import verify_model as V  # noqa: E402


def load_base(dimacs: Path) -> tuple[list[str], int, int, dict[int, str]]:
    lines = dimacs.read_text(encoding="ascii").splitlines()
    header = next(i for i, line in enumerate(lines) if line.startswith("p cnf"))
    _, _, nvars, nclauses = lines[header].split()
    names = V.parse_dimacs_names(dimacs)
    return lines, int(nvars), int(nclauses), names


def solve(
    lines: list[str], nvars: int, nclauses: int,
    blocks: list[list[int]], instance: Path, timeout: float,
) -> set[int] | None:
    header = next(i for i, line in enumerate(lines) if line.startswith("p cnf"))
    out = list(lines)
    out[header] = f"p cnf {nvars} {nclauses + len(blocks)}"
    for clause in blocks:
        out.append(" ".join(map(str, clause)) + " 0")
    instance.write_text("\n".join(out) + "\n", encoding="ascii")
    completed = subprocess.run(
        ["cadical", "-q", str(instance)],
        capture_output=True, text=True, timeout=timeout, check=False,
    )
    if completed.returncode == 20:
        return None
    if completed.returncode != 10:
        raise RuntimeError(
            f"cadical exit {completed.returncode}: {completed.stdout[-500:]}"
        )
    true_vars = set()
    for line in completed.stdout.splitlines():
        if line.startswith("v"):
            for token in line.split()[1:]:
                value = int(token)
                if value > 0:
                    true_vars.add(value)
    return true_vars


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--dimacs", type=Path, default=HERE / "surface.cnf")
    parser.add_argument("--budget", type=int, default=400)
    parser.add_argument("--workdir", type=Path, default=HERE / "cegar-work")
    parser.add_argument("--cores", type=Path, default=HERE / "cores.jsonl")
    parser.add_argument("--resume", action="store_true",
                        help="re-block every core already in --cores first")
    args = parser.parse_args()

    args.workdir.mkdir(parents=True, exist_ok=True)
    lines, nvars, nclauses, names = load_base(args.dimacs)
    ids = {name: identifier for identifier, name in names.items()}
    eq_atoms: dict[M.Atom, int] = {}
    for center in E.VERTICES:
        for left, right in itertools.combinations(E.targets(center), 2):
            eq_atoms[(center, left, right)] = ids[f"eq_{center}_{left}_{right}"]

    blocks: list[list[int]] = []
    if args.resume and args.cores.exists():
        for line in args.cores.read_text(encoding="ascii").splitlines():
            record = json.loads(line)
            clause = [
                -eq_atoms[tuple(atom)] if sign == "+" else eq_atoms[tuple(atom)]
                for sign, atom in record["core"]
            ]
            blocks.append(clause)
        print(f"[resume] re-blocked {len(blocks)} stored cores", flush=True)

    core_log = args.cores.open("a", encoding="ascii")
    started = time.monotonic()
    for iteration in range(1, args.budget + 1):
        model = solve(
            lines, nvars, nclauses, blocks,
            args.workdir / "instance.cnf", timeout=3600.0,
        )
        if model is None:
            print(f"[iter {iteration}] OUTER UNSAT after {len(blocks)} blocking "
                  f"clauses: every witness pattern of the full lcap14 surface "
                  f"generated so far is strict-Kalmanson-infeasible.", flush=True)
            return 0

        decoded = V.Decoded(names, model)
        report = V.verify(decoded, pair_minimality=True, subset_escape=True)
        assert report is not None  # raises on any semantic failure

        epos = [atom for atom, var in eq_atoms.items() if var in model]
        eneg = [atom for atom, var in eq_atoms.items() if var not in model]
        status, core = M.run_oracle(epos, eneg, args.workdir)
        if status == "sat":
            survivor = args.workdir / "survivor.json"
            survivor.write_text(json.dumps({
                "iteration": iteration,
                "blocks": len(blocks),
                "epos": sorted(epos),
                "report": report,
            }, indent=2, sort_keys=True, default=list) + "\n", encoding="utf-8")
            print(f"[iter {iteration}] METRIC SURVIVOR: strict-Kalmanson-"
                  f"feasible witness of the full surface; dumped to "
                  f"{survivor}.  Euclidean escalation required.", flush=True)
            return 1

        if not core:
            print(f"[iter {iteration}] z3 UNSAT with empty pattern core "
                  f"(geometry-only infeasibility?) — aborting to avoid an "
                  f"unsound block.", flush=True)
            return 2

        clause = [
            -eq_atoms[atom] if sign == "+" else eq_atoms[atom]
            for sign, atom in core
        ]
        blocks.append(clause)
        core_log.write(json.dumps({
            "iteration": iteration,
            "core": [[sign, list(atom)] for sign, atom in core],
        }, sort_keys=True) + "\n")
        core_log.flush()
        elapsed = time.monotonic() - started
        print(f"[iter {iteration}] metric-UNSAT; core size {len(core)}; "
              f"{len(blocks)} blocked; {elapsed:.0f}s elapsed", flush=True)

    print(f"[budget] {args.budget} iterations exhausted; {len(blocks)} patterns "
          f"blocked; no metric survivor; outer not exhausted.", flush=True)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
