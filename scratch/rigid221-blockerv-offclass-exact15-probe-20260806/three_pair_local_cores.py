"""Extract an irredundant linear core for each local three-pair motif."""

from __future__ import annotations

import json
from itertools import combinations
from pathlib import Path

import z3


def motif_core(key: str) -> list[tuple[object, ...]]:
    triples = json.loads(key)
    vertex_count = 1 + max(
        value for center, pair in triples for value in (center, *pair)
    )
    ds = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in combinations(range(vertex_count), 2)
    }

    def dist(left: int, right: int):
        if left == right:
            return z3.RealVal(0)
        return ds[tuple(sorted((left, right)))]

    solver = z3.Solver()
    solver.add(*(value > 0 for value in ds.values()))
    tags: list[z3.BoolRef] = []
    metadata: dict[str, tuple[object, ...]] = {}

    def tagged(meta: tuple[object, ...], constraint) -> None:
        tag = z3.Bool(f"a{len(tags)}")
        tags.append(tag)
        metadata[str(tag)] = meta
        solver.add(z3.Implies(tag, constraint))

    for a, b, c in combinations(range(vertex_count), 3):
        tagged(("tri", a, b, c, 0), dist(a, c) < dist(a, b) + dist(b, c))
        tagged(("tri", a, b, c, 1), dist(a, b) < dist(a, c) + dist(b, c))
        tagged(("tri", a, b, c, 2), dist(b, c) < dist(a, b) + dist(a, c))
    for a, b, c, d in combinations(range(vertex_count), 4):
        diagonal = dist(a, c) + dist(b, d)
        tagged(("kal1", a, b, c, d), dist(a, b) + dist(c, d) < diagonal)
        tagged(("kal2", a, b, c, d), dist(a, d) + dist(b, c) < diagonal)
    for center, pair in triples:
        tagged(("eq", center, pair[0], pair[1]), dist(center, pair[0]) == dist(center, pair[1]))
    if solver.check(*tags) != z3.unsat:
        raise RuntimeError(f"expected UNSAT motif: {key}")
    active = list(solver.unsat_core())
    changed = True
    while changed:
        changed = False
        for tag in list(active):
            candidate = [other for other in active if other is not tag]
            if solver.check(*candidate) == z3.unsat:
                active = candidate
                changed = True
    return [metadata[str(tag)] for tag in active]


def main() -> int:
    directory = Path(__file__).parent
    source_path = directory / "metric-cegar-o0-v0-three-pair-local-coverage.json"
    source = json.loads(source_path.read_text())
    output = {
        "source": source_path.name,
        "motifs": [
            item | {"constraint_core": motif_core(item["motif_key"])}
            for item in source["motifs"]
        ],
    }
    target = directory / "three-pair-local-motif-cores.json"
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
