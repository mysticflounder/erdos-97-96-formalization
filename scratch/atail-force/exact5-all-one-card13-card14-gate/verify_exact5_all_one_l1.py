#!/usr/bin/env python3
"""Replay all saved all-one common-order blocks, with cvc5 cross-checks."""

from __future__ import annotations

import argparse
import itertools
import json
import subprocess
import tempfile
from pathlib import Path

import z3


VERTICES = tuple(range(13))


def edge(left: int, right: int) -> tuple[int, int]:
    return (left, right) if left < right else (right, left)


def dist(table: dict[tuple[int, int], z3.ArithRef],
         left: int, right: int) -> z3.ArithRef:
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def base_solver() -> tuple[z3.Solver, dict[tuple[int, int], z3.ArithRef]]:
    table = {
        pair: z3.Real(f"d_{pair[0]}_{pair[1]}")
        for pair in itertools.combinations(VERTICES, 2)
    }
    solver = z3.Solver()
    for variable in table.values():
        solver.add(variable >= 1)
    for a, b, c in itertools.combinations(VERTICES, 3):
        solver.add(dist(table, a, b) + dist(table, b, c) >=
                   dist(table, a, c) + 1)
        solver.add(dist(table, a, c) + dist(table, b, c) >=
                   dist(table, a, b) + 1)
        solver.add(dist(table, a, b) + dist(table, a, c) >=
                   dist(table, b, c) + 1)
    for a, b, c, d in itertools.combinations(VERTICES, 4):
        diagonals = dist(table, a, c) + dist(table, b, d)
        solver.add(diagonals >= dist(table, a, b) + dist(table, c, d) + 1)
        solver.add(diagonals >= dist(table, a, d) + dist(table, b, c) + 1)
    return solver, table


def expression(table: dict[tuple[int, int], z3.ArithRef],
               item: dict[str, object]) -> z3.BoolRef:
    kind = str(item["kind"])
    if kind == "rowEquality":
        center = int(item["center"])
        left = int(item["left"])
        right = int(item["right"])
        return dist(table, center, left) == dist(table, center, right)
    if kind == "frontierFirstEquality":
        return dist(table, 4, int(item["q"])) == dist(
            table, 4, int(item["w"])
        )
    if kind == "frontierSecondSeparation":
        left = dist(table, 8, int(item["q"]))
        right = dist(table, 8, int(item["w"]))
        return z3.Or(left >= right + 1, right >= left + 1)
    raise ValueError(f"unsupported core atom {kind}")


def check_core(core: dict[str, object], index: int,
               cvc5: bool) -> None:
    solver, table = base_solver()
    atoms = [expression(table, item) for item in core["constraints"]]
    assumptions = [z3.Bool(f"core_{index}_{i}") for i in range(len(atoms))]
    for assumption, atom in zip(assumptions, atoms, strict=True):
        solver.add(z3.Implies(assumption, atom))
    status = solver.check(*assumptions)
    if status != z3.unsat:
        raise SystemExit(f"core {index} Z3 replay is {status}")
    if core.get("minimal") is not True:
        raise SystemExit(f"core {index} is not marked minimal")
    for dropped in range(len(atoms)):
        trial = assumptions[:dropped] + assumptions[dropped + 1:]
        if solver.check(*trial) != z3.sat:
            raise SystemExit(f"core {index} not deletion-minimal at {dropped}")
    if cvc5:
        export, export_table = base_solver()
        export.add(*[
            expression(export_table, item) for item in core["constraints"]
        ])
        smt2 = export.to_smt2()
        with tempfile.NamedTemporaryFile(
            mode="w", suffix=".smt2", dir="/tmp", delete=False
        ) as stream:
            stream.write(smt2)
            smt_path = Path(stream.name)
        try:
            replay = subprocess.run(
                ["cvc5", "--lang", "smt2", str(smt_path)],
                check=False,
                capture_output=True,
                text=True,
                timeout=20,
            )
            verdict = replay.stdout.strip().splitlines()
            if replay.returncode != 0 or not verdict or verdict[-1] != "unsat":
                raise SystemExit(
                    f"core {index} cvc5 replay failed: "
                    f"rc={replay.returncode} out={replay.stdout!r} "
                    f"err={replay.stderr!r}"
                )
        finally:
            smt_path.unlink(missing_ok=True)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--cvc5-all", action="store_true")
    args = parser.parse_args()
    payload = json.loads(args.checkpoint.read_text())
    cores = payload.get("concrete_core_blocks", [])
    if not cores:
        raise SystemExit("checkpoint has no concrete core blocks")
    for index, core in enumerate(cores):
        check_core(core, index, args.cvc5_all or index == 0)
    print(
        f"VERIFIED {len(cores)} exact-LRA deletion-minimal blocks; "
        f"cvc5={'all' if args.cvc5_all else 'first'}"
    )


if __name__ == "__main__":
    main()
