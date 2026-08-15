"""Exact-15 probe with all seven local three-shell Kalmanson schemas.

The forbidden schemas were mined from every three-row core in the incremental
metric CEGAR journal.  Each schema uses only three selected-row pair hits and
the cyclic order of their involved vertices, so the clauses are sound for any
ambient carrier cardinality once the corresponding Lean theorems are banked.
"""

from __future__ import annotations

import argparse
import json
import subprocess
from itertools import combinations, product
from pathlib import Path

import alternation_static_probe
import first_fiber_probe
import kalmanson_probe
import probe
from three_pair_local_coverage import canonical_key

FORBIDDEN_KEYS = (
    "[[0,[1,3]],[4,[1,2]],[5,[2,3]]]",
    "[[0,[1,2]],[4,[1,3]],[5,[2,3]]]",
    "[[0,[1,2]],[1,[0,2]],[3,[0,1]]]",
    "[[0,[1,2]],[1,[2,4]],[3,[1,4]]]",
    "[[0,[1,2]],[1,[2,3]],[4,[1,3]]]",
    "[[0,[1,2]],[3,[2,5]],[4,[1,5]]]",
    "[[0,[1,3]],[2,[3,5]],[4,[1,5]]]",
)


def local_templates(key: str) -> tuple[tuple[tuple[int, tuple[int, int]], ...], ...]:
    encoded = json.loads(key)
    size = 1 + max(value for center, pair in encoded for value in (center, *pair))
    templates: set[tuple[tuple[int, tuple[int, int]], ...]] = set()
    for support in combinations(range(size), 3):
        edges = tuple(combinations(support, 2))
        for centers in product(range(size), repeat=3):
            if len(set(centers)) != 3:
                continue
            triples = tuple(sorted(zip(centers, edges, strict=True)))
            if any(center in pair for center, pair in triples):
                continue
            involved = set(support) | set(centers)
            if len(involved) != size:
                continue
            if canonical_key(triples, list(range(size))) == key:
                templates.add(triples)
    return tuple(sorted(templates))


def add_three_pair_schemas(instance, order: tuple[int, ...]) -> dict[str, int]:
    hit_variables: dict[tuple[int, tuple[int, int]], int] = {}
    for center in range(probe.N):
        others = [point for point in range(probe.N) if point != center]
        for pair in combinations(others, 2):
            variable = instance.cnf.new_variable()
            hit_variables[(center, pair)] = variable
            required = set(pair)
            for index, row in enumerate(instance.candidates[center]):
                if required <= set(row):
                    choice = instance.choice_variables[(center, index)]
                    instance.cnf.add_clause((-choice, variable))

    clauses: set[tuple[int, int, int]] = set()
    template_count = 0
    for key in FORBIDDEN_KEYS:
        templates = local_templates(key)
        template_count += len(templates)
        size = 1 + max(
            value for center, pair in json.loads(key) for value in (center, *pair)
        )
        for actual in combinations(order, size):
            for template in templates:
                clause = tuple(
                    sorted(
                        -hit_variables[
                            (actual[center], tuple(sorted(actual[point] for point in pair)))
                        ]
                        for center, pair in template
                    )
                )
                clauses.add(clause)
    for clause in sorted(clauses):
        instance.cnf.add_clause(clause)
    return {
        "hit_variables": len(hit_variables),
        "local_templates": template_count,
        "schema_clauses": len(clauses),
    }


def solve_case(long_order_index: int, order_variant: int, timeout: int) -> int:
    long_order = probe.ORDERS[long_order_index]
    complete_order = tuple(kalmanson_probe.compatible_orders(long_order))[order_variant]
    _model, instance, blocker, cap_order = first_fiber_probe.build(long_order)
    alternation_static_probe.add_full_alternation(instance, complete_order)
    before = (instance.cnf.n_variables, len(instance.cnf.clauses))
    schema_stats = add_three_pair_schemas(instance, complete_order)
    after = (instance.cnf.n_variables, len(instance.cnf.clauses))

    stem = Path(__file__).with_name(
        f"three-pair-static-o{long_order_index}-v{order_variant}"
    )
    cnf_path = stem.with_suffix(".cnf")
    clauses = instance.cnf.clauses
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
    status = (
        "SAT"
        if run.returncode == 10
        else "UNSAT"
        if run.returncode == 20
        else f"ERR{run.returncode}"
    )
    result: dict[str, object] = {
        "long_order_index": long_order_index,
        "order_variant": order_variant,
        "complete_order": list(complete_order),
        "status": status,
        "variables_before": before[0],
        "clauses_before": before[1],
        "variables_after": after[0],
        "clauses_after": after[1],
        **schema_stats,
    }
    if status == "SAT":
        rows, decoded = probe.validate_sat(instance, blocker, cap_order, run.stdout)
        result["rows"] = {str(center): row for center, row in rows.items()}
        result["blockers"] = {str(source): center for source, center in decoded.items()}
        verdict, reason = kalmanson_probe.check_order(rows, complete_order)
        result["kalmanson_verdict"] = verdict
        result["kalmanson_reason"] = reason
    stem.with_suffix(".json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    stem.with_suffix(".solver.log").write_text(
        run.stdout + run.stderr, encoding="utf-8"
    )
    print(json.dumps({k: v for k, v in result.items() if k not in {"rows", "blockers"}}, sort_keys=True))
    return 0 if status in {"SAT", "UNSAT"} else 1


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("long_order_index", type=int, choices=range(2))
    parser.add_argument("order_variant", type=int, choices=range(12))
    parser.add_argument("--timeout", type=int, default=300)
    args = parser.parse_args()
    return solve_case(args.long_order_index, args.order_variant, args.timeout)


if __name__ == "__main__":
    raise SystemExit(main())
