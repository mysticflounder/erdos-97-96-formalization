"""Expose the individual equalities and inequalities in one metric core."""

from __future__ import annotations

import argparse
import json
from itertools import combinations
from pathlib import Path

import kalmanson_probe
import probe
import z3


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int)
    parser.add_argument("order_variant", type=int)
    parser.add_argument("--learned-round", type=int)
    args = parser.parse_args()
    stem = Path(__file__).with_name(
        f"alternation-static-o{args.long_order_index}-v{args.order_variant}"
    )
    survivor = json.loads(stem.with_suffix(".json").read_text())
    if args.learned_round is None:
        core_file = stem.with_name(stem.name + "-kalmanson-core").with_suffix(
            ".json"
        )
        row_core = json.loads(core_file.read_text())
        all_rows = {
            int(center): row for center, row in survivor["rows"].items()
        }
        rows = {
            center: all_rows[center]
            for center in row_core["irredundant_core"]
        }
        order = tuple(survivor["complete_order"])
    else:
        metric_file = stem.with_name(
            f"metric-cegar-o{args.long_order_index}-v{args.order_variant}"
        ).with_suffix(".json")
        metric = json.loads(metric_file.read_text())
        learned = next(
            item
            for item in metric["learned"]
            if item["round"] == args.learned_round
        )
        rows = {int(center): row for center, row in learned["rows"].items()}
        order = tuple(metric["complete_order"])
    ds = kalmanson_probe.distance_variables()
    solver = z3.Solver()
    tags: list[z3.BoolRef] = []
    descriptions: dict[str, str] = {}

    def tagged(prefix: str, description: str, constraint) -> None:
        tag = z3.Bool(f"a{len(tags)}_{prefix}")
        tags.append(tag)
        descriptions[str(tag)] = description
        solver.add(z3.Implies(tag, constraint))

    solver.add(*(value > 0 for value in ds.values()))
    solver.add(kalmanson_probe.dist(ds, 0, 1) == 1)
    for center, row in rows.items():
        base_point = row[0]
        base = kalmanson_probe.dist(ds, center, base_point)
        for point in row[1:]:
            tagged(
                "eq",
                f"d({center},{point}) = d({center},{base_point})",
                kalmanson_probe.dist(ds, center, point) == base,
            )

    for a, b, c in combinations(range(probe.N), 3):
        tagged(
            "tri",
            f"d({a},{c}) < d({a},{b}) + d({b},{c})",
            kalmanson_probe.dist(ds, a, c)
            < kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, b, c),
        )
        tagged(
            "tri",
            f"d({a},{b}) < d({a},{c}) + d({b},{c})",
            kalmanson_probe.dist(ds, a, b)
            < kalmanson_probe.dist(ds, a, c) + kalmanson_probe.dist(ds, b, c),
        )
        tagged(
            "tri",
            f"d({b},{c}) < d({a},{b}) + d({a},{c})",
            kalmanson_probe.dist(ds, b, c)
            < kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, a, c),
        )

    for i, j, k, ell in combinations(range(probe.N), 4):
        a, b, c, d = order[i], order[j], order[k], order[ell]
        diagonal = kalmanson_probe.dist(ds, a, c) + kalmanson_probe.dist(ds, b, d)
        tagged(
            "kal1",
            f"d({a},{b}) + d({c},{d}) < d({a},{c}) + d({b},{d})",
            kalmanson_probe.dist(ds, a, b) + kalmanson_probe.dist(ds, c, d)
            < diagonal,
        )
        tagged(
            "kal2",
            f"d({a},{d}) + d({b},{c}) < d({a},{c}) + d({b},{d})",
            kalmanson_probe.dist(ds, a, d) + kalmanson_probe.dist(ds, b, c)
            < diagonal,
        )

    result = solver.check(*tags)
    if result != z3.unsat:
        raise RuntimeError(f"expected UNSAT, got {result}")
    active = list(solver.unsat_core())
    changed = True
    while changed:
        changed = False
        for tag in list(active):
            candidate = [other for other in active if other is not tag]
            if solver.check(*candidate) == z3.unsat:
                active = candidate
                changed = True
    output = {
        "assumption_count": len(tags),
        "core_size": len(active),
        "core": [descriptions[str(tag)] for tag in active],
    }
    suffix = (
        "constraint-core"
        if args.learned_round is None
        else f"learned-r{args.learned_round}-constraint-core"
    )
    target = stem.with_name(stem.name + f"-{suffix}").with_suffix(".json")
    target.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
