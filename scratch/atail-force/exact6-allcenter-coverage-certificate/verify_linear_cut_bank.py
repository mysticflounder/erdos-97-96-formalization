#!/usr/bin/env python3
"""Verify weighted Kalmanson/row-equality cuts over abstract distance edges."""

from __future__ import annotations

import argparse
import json
from collections import defaultdict
from pathlib import Path


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance loop in cut")
    return tuple(sorted((left, right)))


def vector(name: str) -> dict[tuple[int, int], int]:
    parts = name.split("_")
    coefficients: dict[tuple[int, int], int] = defaultdict(int)
    if parts[0] in {"kal1", "kal2"} and len(parts) == 5:
        a, b, c, d = map(int, parts[1:])
        if not a < b < c < d:
            raise ValueError(f"Kalmanson indices are not increasing: {name}")
        terms = [(a, c, 1), (b, d, 1)]
        if parts[0] == "kal1":
            terms.extend(((a, b, -1), (c, d, -1)))
        else:
            terms.extend(((a, d, -1), (b, c, -1)))
    elif parts[0] == "row" and len(parts) == 4:
        center, reference, point = map(int, parts[1:])
        terms = [(center, point, 1), (center, reference, -1)]
    else:
        raise ValueError(f"unknown exact linear constraint: {name}")
    for left, right, coefficient in terms:
        coefficients[edge(left, right)] += coefficient
    return {term: coefficient for term, coefficient in coefficients.items() if coefficient}


def verify_cut(cut: dict[str, object]) -> dict[str, object]:
    total: dict[tuple[int, int], int] = defaultdict(int)
    row_memberships: set[tuple[int, int]] = set()
    strict_weight_sum = 0
    for item in cut["constraints"]:
        name = item["name"]
        multiplier = int(item["multiplier"])
        if name.startswith("kal"):
            if multiplier <= 0:
                raise ValueError(f"strict multiplier is not positive: {name}")
            strict_weight_sum += multiplier
        else:
            _, center, reference, point = name.split("_")
            row_memberships.add((int(center), int(reference)))
            row_memberships.add((int(center), int(point)))
        for term, coefficient in vector(name).items():
            total[term] += multiplier * coefficient
    residual = {term: coefficient for term, coefficient in total.items() if coefficient}
    if residual:
        raise ValueError(f"cut does not cancel: {cut['id']} residual={residual}")
    if strict_weight_sum <= 0 or strict_weight_sum != cut["strict_weight_sum"]:
        raise ValueError(f"strict weight sum mismatch: {cut['id']}")
    required = {tuple(pair) for pair in cut["required_memberships"]}
    if required != row_memberships:
        raise ValueError(f"row-membership antecedent mismatch: {cut['id']}")
    if cut.get("exact_vector_cancellation") is not True:
        raise ValueError(f"cut is not marked exact: {cut['id']}")
    shell = cut.get("conditioned_shell")
    if shell is not None and (
        len(shell) != 5 or len(set(shell)) != 5 or any(not 0 <= point < 14 for point in shell)
    ):
        raise ValueError(f"invalid conditioned shell: {cut['id']}")
    return {
        "id": cut["id"],
        "strict_weight_sum": strict_weight_sum,
        "constraint_count": len(cut["constraints"]),
        "required_membership_count": len(required),
        "conditioned_on_shell": shell is not None,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=Path, required=True)
    args = parser.parse_args()
    payload = json.loads(args.input.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-weighted-kalmanson-cut-bank-v1":
        raise ValueError("cut-bank schema drift")
    ids = [cut["id"] for cut in payload["cuts"]]
    if len(ids) != len(set(ids)):
        raise ValueError("duplicate cut id")
    results = [verify_cut(cut) for cut in payload["cuts"]]
    print(json.dumps({
        "status": "EXACT_WEIGHTED_KALMANSON_CUT_BANK_REPLAY_PASS",
        "cut_count": len(results),
        "cuts": results,
        "live_closure": False,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
