#!/usr/bin/env python3
"""Find a low-intermediate-size staging of the shard 15 UNIT identity."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

import sympy as sp


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    source = json.loads(args.certificate.read_text(encoding="utf-8"))
    variable_names = list(source["variables"])
    symbols = sp.symbols(" ".join(variable_names))
    locals_map = dict(zip(variable_names, symbols, strict=True))
    polynomials = [
        sp.sympify(text.replace("^", "**"), locals=locals_map)
        for text in source["polynomials"]
    ]
    coefficients = []
    for index, raw in enumerate(source["singular"]["lift_coefficients"], start=1):
        marker = f"L[{index},1]="
        coefficients.append(
            sp.sympify(raw.removeprefix(marker).replace("^", "**"), locals=locals_map)
        )
    summands = [
        dict(sp.Poly(coefficient * polynomial, *symbols, domain=sp.QQ).terms())
        for coefficient, polynomial in zip(coefficients, polynomials, strict=True)
    ]

    partials: list[dict[tuple[int, ...], sp.Rational]] = [{} for _ in range(1 << 11)]
    term_counts = [0] * (1 << 11)
    for mask in range(1, 1 << 11):
        bit = mask & -mask
        index = bit.bit_length() - 1
        previous = mask ^ bit
        combined = dict(partials[previous])
        for monomial, coefficient in summands[index].items():
            updated = combined.get(monomial, sp.S.Zero) + coefficient
            if updated == 0:
                combined.pop(monomial, None)
            else:
                combined[monomial] = updated
        partials[mask] = combined
        term_counts[mask] = len(combined)

    best_cost = [10**9] * (1 << 11)
    predecessor: list[tuple[int, int] | None] = [None] * (1 << 11)
    best_cost[0] = 0
    for mask in range(1 << 11):
        if best_cost[mask] == 10**9:
            continue
        for index in range(11):
            bit = 1 << index
            if mask & bit:
                continue
            next_mask = mask | bit
            cost = max(best_cost[mask], term_counts[next_mask])
            if cost < best_cost[next_mask]:
                best_cost[next_mask] = cost
                predecessor[next_mask] = (mask, index)

    full = (1 << 11) - 1
    order = []
    mask = full
    while mask:
        step = predecessor[mask]
        if step is None:
            raise RuntimeError("staging dynamic program omitted a predecessor")
        mask, index = step
        order.append(index)
    order.reverse()

    staged_masks = []
    mask = 0
    for index in order:
        mask |= 1 << index
        staged_masks.append(mask)
    result = {
        "schema": "p97-shard15-certificate-stage-plan-v1",
        "summand_term_counts": [len(summand) for summand in summands],
        "original_partial_term_counts": [
            term_counts[(1 << (index + 1)) - 1] for index in range(11)
        ],
        "optimized_order_zero_based": order,
        "optimized_partial_term_counts": [term_counts[item] for item in staged_masks],
        "optimized_max_partial_term_count": best_cost[full],
        "final_terms": [
            {"powers": list(monomial), "coefficient": str(coefficient)}
            for monomial, coefficient in sorted(partials[full].items())
        ],
    }
    rendered = json.dumps(result, indent=2, sort_keys=True)
    temporary = args.output.with_suffix(args.output.suffix + ".tmp")
    temporary.write_text(rendered + "\n")
    temporary.replace(args.output)
    print(f"wrote {args.output}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
