"""Test whether candidate-surface-only rules are load-bearing for exact 15.

This keeps the source-specific BlockerV trace, first-apex row, cap bounds,
ordered two-hit localization, alternation, and all seven banked metric schemas.
Only the generic candidate generator is varied for the six selected-row centers
used by the contradiction.  It is a soundness audit, not a production encoder.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from itertools import combinations
from pathlib import Path

import alternation_static_probe
import first_fiber_probe
import kalmanson_probe
import probe
import three_pair_static_probe
from census.card_head import sat_encoding
from census.card_head.candidate_surface import (
    MOSER,
    candidate_classes as baseline_candidate_classes,
    full_one_hit_ok,
)

RELAXED_CENTERS = frozenset((2, probe.V, probe.XV, probe.DELETED, probe.C, probe.E))


def candidate_generator(*, keep_kc: bool, keep_moser_bound: bool, keep_one_hit: bool):
    def generate(model, center: int):
        if center not in RELAXED_CENTERS:
            return baseline_candidate_classes(model, center)

        rows = []
        for row in combinations((point for point in range(model.cardinality) if point != center), 4):
            chosen = frozenset(row)
            if keep_one_hit and not full_one_hit_ok(model, center, chosen):
                continue
            if center not in MOSER:
                moser_count = len(chosen & MOSER)
                same_cap_count = len(chosen & model.own_cap_interior(center))
                if keep_moser_bound and moser_count > 2:
                    continue
                if keep_kc and moser_count >= 2 and same_cap_count >= 1:
                    continue
                if same_cap_count > 2:
                    continue
            rows.append(row)
        return tuple(rows)

    return generate


def solve(variant: str, order_index: int, order_variant: int, timeout: int) -> dict[str, object]:
    settings = {
        "baseline": (True, True, True),
        "no-kc": (False, True, True),
        "no-kc-moser-bound": (False, False, True),
        "no-kc-one-hit": (False, True, False),
        "raw": (False, False, False),
    }
    keep_kc, keep_moser_bound, keep_one_hit = settings[variant]
    original = sat_encoding.candidate_classes
    sat_encoding.candidate_classes = candidate_generator(
        keep_kc=keep_kc,
        keep_moser_bound=keep_moser_bound,
        keep_one_hit=keep_one_hit,
    )
    try:
        long_order = probe.ORDERS[order_index]
        complete_order = tuple(kalmanson_probe.compatible_orders(long_order))[order_variant]
        _model, instance, _blocker, _cap_order = first_fiber_probe.build(long_order)
        alternation_static_probe.add_full_alternation(instance, complete_order)
        schema_stats = three_pair_static_probe.add_three_pair_schemas(instance, complete_order)
    finally:
        sat_encoding.candidate_classes = original

    stem = Path(__file__).with_name(
        f"hidden-rule-{variant}-o{order_index}-v{order_variant}"
    )
    clauses = instance.cnf.clauses
    cnf_path = stem.with_suffix(".cnf")
    cnf_path.write_text(
        f"p cnf {instance.cnf.n_variables} {len(clauses)}\n"
        + "\n".join(" ".join(map(str, clause)) + " 0" for clause in clauses)
        + "\n",
        encoding="utf-8",
    )
    run = subprocess.run(
        ["cadical", "-q", "-t", str(timeout), str(cnf_path)],
        capture_output=True,
        text=True,
        timeout=timeout + 30,
        check=False,
    )
    status = "SAT" if run.returncode == 10 else "UNSAT" if run.returncode == 20 else f"ERR{run.returncode}"
    result = {
        "variant": variant,
        "order_index": order_index,
        "order_variant": order_variant,
        "status": status,
        "variables": instance.cnf.n_variables,
        "clauses": len(clauses),
        "candidate_counts": {
            str(center): len(instance.candidates[center]) for center in sorted(RELAXED_CENTERS)
        },
        **schema_stats,
    }
    stem.with_suffix(".json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    stem.with_suffix(".solver.log").write_text(run.stdout + run.stderr, encoding="utf-8")
    print(json.dumps(result, sort_keys=True))
    return result


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "variant",
        choices=(
            "baseline",
            "no-kc",
            "no-kc-moser-bound",
            "no-kc-one-hit",
            "raw",
        ),
    )
    parser.add_argument("order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--timeout", type=int, default=300)
    args = parser.parse_args()
    result = solve(args.variant, args.order_index, args.order_variant, args.timeout)
    return 0 if result["status"] in ("SAT", "UNSAT") else 1


if __name__ == "__main__":
    raise SystemExit(main())
