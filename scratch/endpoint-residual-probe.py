#!/usr/bin/env python3
#
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
#
"""Probe endpoint-residual algebra against small available generator sets.

This is intentionally a scratch diagnostic: it does not emit Lean or certificate
artifacts.  It asks whether the residual payload equalities currently exposed in
Lean already force the Rabinowitsch contradiction `s1 != s3`.
"""

from __future__ import annotations

import argparse
import importlib.util
import subprocess
import sys
from itertools import combinations, product
from pathlib import Path


REPO = Path(__file__).resolve().parents[1]
EPCERT_PATH = REPO / "scripts" / "endpoint-certificate.py"


def load_endpoint_certificate_module():
    spec = importlib.util.spec_from_file_location("endpoint_certificate", EPCERT_PATH)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"could not load {EPCERT_PATH}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


epcert = load_endpoint_certificate_module()


POINTS = ("u", "v", "w", "s1", "s2", "s3", "Pw", "Pu", "Q1", "Q2")
BASE_VARIABLES = [
    coord
    for point in POINTS
    if point not in {"v", "w"}
    for coord in epcert.point_coord(point)
]


def dist_eq(center: str, left: str, right: str) -> str:
    return f"({epcert.dist2_expr(center, left)})-({epcert.dist2_expr(center, right)})"


def class_eqs(center: str, members: list[str]) -> list[str]:
    return [dist_eq(center, left, right) for left, right in combinations(members, 2)]


def distinct_generator(slack: str, left: str, right: str) -> str:
    return f"{slack}*({epcert.dist2_expr(left, right)})-1"


def unique_pairs(labels: list[str]) -> list[tuple[str, str]]:
    seen: set[tuple[str, str]] = set()
    out: list[tuple[str, str]] = []
    point_order = {point: idx for idx, point in enumerate(POINTS)}
    for left, right in combinations(labels, 2):
        if left == right:
            continue
        key = (left, right)
        if point_order[right] < point_order[left]:
            key = (right, left)
        if key not in seen:
            seen.add(key)
            out.append(key)
    return out


def distinct_pairs(mode: str, x_label: str, a_label: str, b_label: str) -> list[tuple[str, str]]:
    base_mode = mode.removesuffix("-product")
    if base_mode == "none":
        return [("s1", "s3")]
    if base_mode == "payload":
        return unique_pairs(
            ["Pw", "Pu", x_label, a_label, "Q1", "Q2", b_label, "u", "s1", "s3"]
        )
    if base_mode == "all":
        return unique_pairs(list(POINTS))
    raise ValueError(f"unknown distinctness mode {mode!r}")


def payload_generators(
    x_label: str, a_label: str, b_label: str, distinct_mode: str
) -> tuple[list[str], list[str]]:
    generators: list[str] = []
    generators.extend(class_eqs("v", ["Pw", "Pu", x_label, a_label]))
    generators.extend(class_eqs("w", ["Q1", "Q2", b_label, "u"]))
    pairs = distinct_pairs(distinct_mode, x_label, a_label, b_label)
    if distinct_mode.endswith("-product"):
        slack_vars = ["t0"]
        product_expr = "*".join(
            f"({epcert.dist2_expr(left, right)})" for left, right in pairs
        )
        generators.append(f"t0*({product_expr})-1")
    else:
        slack_vars = [f"t{i}" for i in range(len(pairs))]
        generators.extend(
            distinct_generator(slack, left, right)
            for slack, (left, right) in zip(slack_vars, pairs, strict=True)
        )
    return BASE_VARIABLES + slack_vars, generators


def run_one(
    x_label: str, a_label: str, b_label: str, distinct_mode: str, timeout_s: int
) -> str:
    variables, generators = payload_generators(
        x_label, a_label, b_label, distinct_mode
    )
    try:
        epcert.singular_witness(
            variables,
            generators,
            timeout_s,
        )
    except subprocess.TimeoutExpired:
        return "TIMEOUT"
    except ValueError as exc:
        if "G[1]=" in str(exc):
            return "NOT_UNIT"
        raise
    return "UNIT"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--distinct",
        choices=["none", "payload", "all", "payload-product", "all-product"],
        default="none",
        help="Rabinowitsch distinctness constraints to include.",
    )
    parser.add_argument(
        "--only",
        nargs=3,
        metavar=("X", "A", "B"),
        help="Run one `(xLabel, aLabel, bLabel)` triple.",
    )
    parser.add_argument("--timeout-s", type=int, default=10)
    args = parser.parse_args()

    if args.only is None:
        cases = product(
            ["Q1", "Q2"],
            ["w", "s1", "s2", "s3"],
            ["v", "s1", "s2", "s3"],
        )
    else:
        x_label, a_label, b_label = args.only
        cases = [(x_label, a_label, b_label)]
    counts: dict[str, int] = {}
    for x_label, a_label, b_label in cases:
        verdict = run_one(
            x_label, a_label, b_label, args.distinct, args.timeout_s
        )
        counts[verdict] = counts.get(verdict, 0) + 1
        print(f"{x_label:2} {a_label:2} {b_label:2} {verdict}")
    print(f"summary {counts}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
