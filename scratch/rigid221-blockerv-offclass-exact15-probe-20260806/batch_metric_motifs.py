"""Mine normalized exact three-row metric motifs from one CEGAR journal.

Each worker reuses one tagged strict triangle/Kalmanson solver.  For every
three-row learned clause it minimizes the individual linear-arithmetic core,
then quotients the surviving shell equalities by cyclic dihedral symmetry.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter, defaultdict
from concurrent.futures import ProcessPoolExecutor
from itertools import combinations
from pathlib import Path

import kalmanson_probe
import probe
import z3


def _tagged_base(order: tuple[int, ...]):
    ds = kalmanson_probe.distance_variables()
    solver = z3.Solver()
    tags: list[z3.BoolRef] = []
    metadata: dict[str, tuple[object, ...]] = {}

    def tagged(prefix: str, meta: tuple[object, ...], constraint) -> None:
        tag = z3.Bool(f"base_{len(tags)}_{prefix}")
        tags.append(tag)
        metadata[str(tag)] = meta
        solver.add(z3.Implies(tag, constraint))

    solver.add(*(value > 0 for value in ds.values()))
    solver.add(kalmanson_probe.dist(ds, 0, 1) == 1)
    for a, b, c in combinations(range(probe.N), 3):
        tagged(
            "tri",
            ("tri", a, b, c, 0),
            kalmanson_probe.dist(ds, a, c)
            < kalmanson_probe.dist(ds, a, b)
            + kalmanson_probe.dist(ds, b, c),
        )
        tagged(
            "tri",
            ("tri", a, b, c, 1),
            kalmanson_probe.dist(ds, a, b)
            < kalmanson_probe.dist(ds, a, c)
            + kalmanson_probe.dist(ds, b, c),
        )
        tagged(
            "tri",
            ("tri", a, b, c, 2),
            kalmanson_probe.dist(ds, b, c)
            < kalmanson_probe.dist(ds, a, b)
            + kalmanson_probe.dist(ds, a, c),
        )
    for i, j, k, ell in combinations(range(probe.N), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal = kalmanson_probe.dist(ds, a, c) + kalmanson_probe.dist(ds, b, d)
        tagged(
            "kal1",
            ("kal1", a, b, c, d),
            kalmanson_probe.dist(ds, a, b)
            + kalmanson_probe.dist(ds, c, d)
            < diagonal,
        )
        tagged(
            "kal2",
            ("kal2", a, b, c, d),
            kalmanson_probe.dist(ds, a, d)
            + kalmanson_probe.dist(ds, b, c)
            < diagonal,
        )
    return ds, solver, tags, metadata


def _minimize(solver: z3.Solver, active: list[z3.BoolRef]) -> list[z3.BoolRef]:
    changed = True
    while changed:
        changed = False
        for tag in list(active):
            candidate = [other for other in active if other is not tag]
            if solver.check(*candidate) == z3.unsat:
                active = candidate
                changed = True
    return active


def _process_chunk(payload):
    order, items = payload
    ds, solver, base_tags, base_metadata = _tagged_base(tuple(order))
    results = []
    for item_index, item in enumerate(items):
        eq_tags: list[z3.BoolRef] = []
        eq_metadata: dict[str, tuple[object, ...]] = {}
        for center_text, row in item["rows"].items():
            center = int(center_text)
            base_point = row[0]
            base = kalmanson_probe.dist(ds, center, base_point)
            for point in row[1:]:
                tag = z3.Bool(f"case_{item['round']}_{item_index}_{len(eq_tags)}")
                eq_tags.append(tag)
                eq_metadata[str(tag)] = ("eq", center, base_point, point)
                solver.add(
                    z3.Implies(
                        tag,
                        kalmanson_probe.dist(ds, center, point) == base,
                    )
                )
        result = solver.check(*(base_tags + eq_tags))
        if result != z3.unsat:
            raise RuntimeError(f"round {item['round']} expected UNSAT, got {result}")
        active = _minimize(solver, list(solver.unsat_core()))
        metadata = base_metadata | eq_metadata
        core = [metadata[str(tag)] for tag in active]
        results.append(
            {
                "round": item["round"],
                "centers": item["centers"],
                "rows": item["rows"],
                "constraint_core": core,
            }
        )
    return results


def _equality_blocks(core: list[list[object]]) -> list[tuple[int, tuple[int, ...]]]:
    edges: dict[int, list[tuple[int, int]]] = defaultdict(list)
    for entry in core:
        if entry[0] == "eq":
            edges[int(entry[1])].append((int(entry[2]), int(entry[3])))
    blocks: list[tuple[int, tuple[int, ...]]] = []
    for center, center_edges in edges.items():
        vertices = {point for edge in center_edges for point in edge}
        while vertices:
            seed = vertices.pop()
            component = {seed}
            changed = True
            while changed:
                changed = False
                for left, right in center_edges:
                    if left in component or right in component:
                        old_size = len(component)
                        component.update((left, right))
                        vertices.discard(left)
                        vertices.discard(right)
                        changed |= len(component) != old_size
            blocks.append((center, tuple(sorted(component))))
    return sorted(blocks)


def _dihedral_key(
    blocks: list[tuple[int, tuple[int, ...]]], order: list[int]
) -> str:
    involved = {center for center, _ in blocks}
    involved.update(point for _, block in blocks for point in block)
    cyclic = [point for point in order if point in involved]
    rank = {point: index for index, point in enumerate(cyclic)}
    size = len(cyclic)
    candidates = []
    for reflected in (False, True):
        for shift in range(size):
            def transform(
                point: int, *, reflected: bool = reflected, shift: int = shift
            ) -> int:
                value = rank[point]
                if reflected:
                    value = -value
                return (value - shift) % size

            transformed = sorted(
                (transform(center), tuple(sorted(transform(point) for point in block)))
                for center, block in blocks
            )
            candidates.append(transformed)
    return json.dumps(min(candidates), separators=(",", ":"))


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--workers", type=int, default=12)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--round", type=int, action="append", dest="rounds")
    args = parser.parse_args()
    directory = Path(__file__).parent
    stem = f"metric-cegar-o{args.long_order_index}-v{args.order_variant}"
    source = json.loads((directory / f"{stem}.json").read_text())
    learned = [item for item in source["learned"] if len(item["centers"]) == 3]
    if args.rounds:
        wanted = set(args.rounds)
        learned = [item for item in learned if item["round"] in wanted]
    if args.limit is not None:
        learned = learned[: args.limit]
    workers = max(1, min(args.workers, len(learned)))
    chunks = [learned[index::workers] for index in range(workers)]
    payloads = [(source["complete_order"], chunk) for chunk in chunks if chunk]
    if workers == 1:
        nested = [_process_chunk(payloads[0])]
    else:
        with ProcessPoolExecutor(max_workers=workers) as executor:
            nested = list(executor.map(_process_chunk, payloads))
    results = sorted((item for chunk in nested for item in chunk), key=lambda x: x["round"])
    counts: Counter[str] = Counter()
    examples: dict[str, int] = {}
    for result in results:
        blocks = _equality_blocks(result["constraint_core"])
        key = _dihedral_key(blocks, source["complete_order"])
        result["equality_blocks"] = blocks
        result["motif_key"] = key
        counts[key] += 1
        examples.setdefault(key, result["round"])
    ranking = [
        {"motif_key": key, "count": count, "example_round": examples[key]}
        for key, count in counts.most_common()
    ]
    output = {
        "source": f"{stem}.json",
        "status": "COMPLETE",
        "case_count": len(results),
        "motif_count": len(counts),
        "motifs": ranking,
        "cases": results,
    }
    suffix = "batch-motifs" if not args.rounds and args.limit is None else "batch-motifs-sample"
    target = directory / f"{stem}-{suffix}.json"
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "target": str(target),
                "case_count": len(results),
                "motif_count": len(counts),
                "top_motifs": ranking[:10],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
