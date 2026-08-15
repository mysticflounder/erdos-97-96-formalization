"""Extract a minimal Kalmanson row core from a static-alternation survivor."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import kalmanson_core
import z3


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int)
    parser.add_argument("order_variant", type=int)
    args = parser.parse_args()
    stem = Path(__file__).with_name(
        f"alternation-static-o{args.long_order_index}-v{args.order_variant}"
    )
    survivor = json.loads(stem.with_suffix(".json").read_text())
    rows = {int(center): row for center, row in survivor["rows"].items()}
    order = tuple(survivor["complete_order"])
    solver, tags = kalmanson_core.tagged_solver(rows, order)
    result, first_core = kalmanson_core.verdict(solver, tags, set(rows))
    if result != z3.unsat:
        raise RuntimeError(f"expected UNSAT, got {result}")
    active = set(first_core)
    changed = True
    while changed:
        changed = False
        for center in sorted(active):
            candidate = active - {center}
            if kalmanson_core.verdict(solver, tags, candidate)[0] == z3.unsat:
                active = candidate
                changed = True
    output = {
        "long_order_index": args.long_order_index,
        "order_variant": args.order_variant,
        "initial_core": sorted(first_core),
        "irredundant_core": sorted(active),
        "core_rows": {str(center): rows[center] for center in sorted(active)},
    }
    stem.with_name(stem.name + "-kalmanson-core").with_suffix(".json").write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps(output, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
