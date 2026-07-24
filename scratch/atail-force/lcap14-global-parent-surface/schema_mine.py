#!/usr/bin/env python3
"""Schema mining over the strict-Kalmanson CEGAR core banks.

Input cores (signed equality atoms (sign, center, left, right), vertex
convention: cyclic order 0..13) from

  - `cores.jsonl` — this lane's CEGAR over the full production surface;
  - `professor-probe/cover14-cores.snapshot-*.txt` and the live
    `/tmp/cover14-cores.txt` — the independent cover14 probe.

Each core is canonicalized to an order-isomorphism schema: the support
points are ranked in their induced cyclic order and the atom set is
minimized over the dihedral group (rotations + reflection) of the ranks.
Soundness of the group action: positivity/triangle are label-symmetric and
the strict-Kalmanson quadruple family is invariant under rotation and
reflection of the cyclic order.

Every distinct schema is then LP-decided *on its own support alone*
(z3 QF_LRA on k points, cyclic order 0..k-1, the same axiom family):

  - support-local UNSAT: the schema is a self-contained refutation lemma
    on <= k cyclically ordered points — cardinality-free, the shape the
    certificate pipeline and the general-n covering argument consume;
  - support-local SAT: the 14-point core relied on ambient points; the
    schema is NOT transportable as-is and is flagged.

Output: `schemas.json` census + stdout summary.
"""

from __future__ import annotations

import argparse
import ast
import itertools
import json
import subprocess
import tempfile
from collections import Counter
from pathlib import Path

HERE = Path(__file__).resolve().parent

Atom = tuple[str, int, int, int]  # (sign, center, left, right), left < right


def normalize(sign: str, center: int, left: int, right: int) -> Atom:
    return (sign, center, min(left, right), max(left, right))


def load_lane(path: Path) -> list[list[Atom]]:
    cores = []
    for line in path.read_text(encoding="ascii").splitlines():
        record = json.loads(line)
        cores.append([
            normalize(sign, *atom) for sign, atom in record["core"]
        ])
    return cores


def load_probe(path: Path) -> list[list[Atom]]:
    cores = []
    for line in path.read_text(encoding="ascii").splitlines():
        atoms = ast.literal_eval(line)
        cores.append([normalize(sign, y, u, v) for sign, y, u, v in atoms])
    return cores


def support(core: list[Atom]) -> list[int]:
    points = set()
    for _, center, left, right in core:
        points.update((center, left, right))
    return sorted(points)


def canonical_schema(core: list[Atom]) -> tuple[int, tuple[Atom, ...]]:
    points = support(core)
    k = len(points)
    rank = {p: i for i, p in enumerate(points)}
    ranked = [
        (sign, rank[center], rank[left], rank[right])
        for sign, center, left, right in core
    ]
    best: tuple[Atom, ...] | None = None
    for reflect in (False, True):
        for rotation in range(k):
            def act(i: int) -> int:
                return ((rotation - i) if reflect else (i + rotation)) % k
            image = tuple(sorted(
                normalize(sign, act(center), act(left), act(right))
                for sign, center, left, right in ranked
            ))
            if best is None or image < best:
                best = image
    assert best is not None
    return k, best


def dvar(u: int, v: int) -> str:
    u, v = min(u, v), max(u, v)
    return f"d_{u}_{v}"


def schema_smt(k: int, atoms: tuple[Atom, ...]) -> str:
    lines = ["(set-logic QF_LRA)"]
    for u, v in itertools.combinations(range(k), 2):
        lines.append(f"(declare-const {dvar(u, v)} Real)")
        lines.append(f"(assert (> {dvar(u, v)} 0))")
    for a, b, c in itertools.combinations(range(k), 3):
        lines.append(f"(assert (< {dvar(a, c)} (+ {dvar(a, b)} {dvar(b, c)})))")
        lines.append(f"(assert (< {dvar(a, b)} (+ {dvar(a, c)} {dvar(b, c)})))")
        lines.append(f"(assert (< {dvar(b, c)} (+ {dvar(a, b)} {dvar(a, c)})))")
    for a, b, c, d in itertools.combinations(range(k), 4):
        diag = f"(+ {dvar(a, c)} {dvar(b, d)})"
        lines.append(f"(assert (> {diag} (+ {dvar(a, b)} {dvar(c, d)})))")
        lines.append(f"(assert (> {diag} (+ {dvar(a, d)} {dvar(b, c)})))")
    for sign, center, left, right in atoms:
        eqn = f"(= {dvar(center, left)} {dvar(center, right)})"
        lines.append(f"(assert {eqn})" if sign == "+"
                     else f"(assert (not {eqn}))")
    lines.append("(check-sat)")
    return "\n".join(lines) + "\n"


def decide_schema(k: int, atoms: tuple[Atom, ...], timeout: float = 300.0) -> str:
    with tempfile.NamedTemporaryFile(
        "w", suffix=".smt2", delete=False, encoding="ascii"
    ) as handle:
        handle.write(schema_smt(k, atoms))
        path = Path(handle.name)
    try:
        completed = subprocess.run(
            ["z3", "-smt2", str(path)],
            capture_output=True, text=True, timeout=timeout, check=False,
        )
    finally:
        path.unlink(missing_ok=True)
    out = completed.stdout.strip()
    if out not in {"sat", "unsat"}:
        raise RuntimeError(f"z3 unexpected: {out[:200]}")
    return out


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--lane-cores", type=Path, default=HERE / "cores.jsonl")
    parser.add_argument("--probe-cores", type=Path,
                        default=Path("/tmp/cover14-cores.txt"))
    parser.add_argument("--output", type=Path, default=HERE / "schemas.json")
    args = parser.parse_args()

    banks: dict[str, list[list[Atom]]] = {}
    if args.lane_cores.exists():
        banks["lane"] = load_lane(args.lane_cores)
    if args.probe_cores.exists():
        banks["probe"] = load_probe(args.probe_cores)
    if not banks:
        raise SystemExit("no core banks found")

    schemas: dict[tuple[int, tuple[Atom, ...]], Counter] = {}
    for bank, cores in banks.items():
        for core in cores:
            key = canonical_schema(core)
            schemas.setdefault(key, Counter())[bank] += 1

    print(json.dumps({
        "cores": {bank: len(cores) for bank, cores in banks.items()},
        "distinct_schemas": len(schemas),
    }))

    records = []
    verdicts = Counter()
    for (k, atoms), multiplicity in sorted(
        schemas.items(),
        key=lambda item: (-sum(item[1].values()), item[0]),
    ):
        verdict = decide_schema(k, atoms)
        verdicts[verdict] += 1
        records.append({
            "support": k,
            "atoms": [list(atom) for atom in atoms],
            "multiplicity": dict(multiplicity),
            "support_local": verdict == "unsat",
        })

    args.output.write_text(
        json.dumps({
            "banks": {bank: len(cores) for bank, cores in banks.items()},
            "schemas": records,
        }, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )

    sizes = Counter(record["support"] for record in records)
    print(f"support sizes: {dict(sorted(sizes.items()))}")
    print(f"support-local UNSAT: {verdicts['unsat']}/{len(records)} "
          f"(ambient-dependent: {verdicts['sat']})")
    print("top schemas by multiplicity:")
    for record in records[:10]:
        total = sum(record["multiplicity"].values())
        local = "local" if record["support_local"] else "AMBIENT"
        print(f"  x{total:3d} k={record['support']:2d} {local} "
              f"{record['atoms']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
