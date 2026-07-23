#!/usr/bin/env python3
"""Audit the three-row outer-arc schema in the pinned exact-two records.

This is an exact finite replay of exported cyclic row assignments.  It is not
a Euclidean realizability check and makes no arbitrary-cardinality claim.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from collections import Counter
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
POSITIVE_ROOT = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "cegar-exact-two"
)
ROUND20 = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "cegar" /
    "round_020" / "opp1_4.result.json"
)
NEGATIVE_ROOT = HERE.parent / "unique4-global-k4-curvature-packing"

LEFT = "center_to_second_support"
RIGHT = "third_support_to_period_end"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def row_arcs(center: int, support: Iterable[int], n: int) -> list[dict[str, Any]]:
    offsets = sorted((center - point) % n for point in support)
    if len(offsets) != 4 or offsets[0] == 0:
        raise ValueError((center, sorted(support), offsets))
    start = (-center) % n
    return [
        {"center": center, "side": LEFT, "start": start,
         "end": start + offsets[1]},
        {"center": center, "side": RIGHT, "start": start + offsets[2],
         "end": start + n},
    ]


def four_disjoint_witnesses(
    rows: dict[int, frozenset[int]], n: int,
) -> list[list[dict[str, Any]]]:
    base = [
        arc
        for center, support in sorted(rows.items())
        for arc in row_arcs(center, support, n)
    ]
    shifted = [
        {**arc, "start": arc["start"] + shift * n,
         "end": arc["end"] + shift * n}
        for arc in base
        for shift in range(-2, 3)
    ]
    witnesses: list[list[dict[str, Any]]] = []
    seen: set[tuple[tuple[int, int, int, str], ...]] = set()
    for chosen in itertools.combinations(shifted, 4):
        if len({(arc["center"], arc["side"]) for arc in chosen}) != 4:
            continue
        ordered = sorted(chosen, key=lambda arc: (arc["start"], arc["end"]))
        if any(
            ordered[index]["end"] - 1 > ordered[index + 1]["start"]
            for index in range(3)
        ):
            continue
        cut = ordered[0]["start"]
        if ordered[-1]["end"] - 1 - cut >= n:
            continue
        key = tuple(
            (arc["start"] - cut, arc["end"] - cut,
             arc["center"], arc["side"])
            for arc in ordered
        )
        if key in seen:
            continue
        seen.add(key)
        witnesses.append([
            {"start": a, "end": b, "center": center, "side": side}
            for a, b, center, side in key
        ])
    return witnesses


def desired_three_row_witnesses(
    witnesses: list[list[dict[str, Any]]], blocker_image: set[int],
    *, fixed_left_only: bool,
) -> list[list[dict[str, Any]]]:
    result = []
    for witness in witnesses:
        counts = Counter(int(arc["center"]) for arc in witness)
        repeated = [center for center, count in counts.items() if count == 2]
        if len(counts) != 3 or len(repeated) != 1:
            continue
        completion = repeated[0]
        if completion in blocker_image:
            continue
        completion_sides = {
            str(arc["side"])
            for arc in witness
            if int(arc["center"]) == completion
        }
        if completion_sides != {LEFT, RIGHT}:
            continue
        fixed = [center for center, count in counts.items() if count == 1]
        if not all(center in blocker_image for center in fixed):
            continue
        if fixed_left_only and not all(
            str(arc["side"]) == LEFT
            for arc in witness
            if int(arc["center"]) in fixed
        ):
            continue
        result.append(witness)
    return result


def rows_from_payload(payload: dict[str, Any]) -> dict[int, frozenset[int]]:
    raw = payload["rows"]
    if isinstance(raw, list):
        return {
            int(row["center"]): frozenset(map(int, row["support"]))
            for row in raw
        }
    return {
        int(center): frozenset(map(int, support))
        for center, support in raw.items()
    }


def audit_positive(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text())
    witnesses = four_disjoint_witnesses(rows_from_payload(payload), int(payload["n"]))
    image = set(map(int, payload["blockers"].values()))
    desired = desired_three_row_witnesses(witnesses, image, fixed_left_only=False)
    fixed_left = desired_three_row_witnesses(witnesses, image, fixed_left_only=True)
    return {
        "source": str(path.relative_to(ROOT)),
        "sha256": sha256(path),
        "all_four_arc_witnesses": len(witnesses),
        "three_row_fixed_image_completion_witnesses": len(desired),
        "three_row_fixed_actual_left_only_witnesses": len(fixed_left),
        "representative": desired[0] if desired else None,
    }


def audit_negative(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text())
    witnesses = four_disjoint_witnesses(rows_from_payload(payload), int(payload["n"]))
    return {
        "source": str(path.relative_to(ROOT)),
        "sha256": sha256(path),
        "declared_status": payload["status"],
        "require_strong_connectivity": payload["require_strong_connectivity"],
        "require_curvature_sat": payload["require_curvature_sat"],
        "replayed_four_arc_witnesses": len(witnesses),
    }


def build_report() -> dict[str, Any]:
    positive_paths = sorted(POSITIVE_ROOT.glob("round_*/opp1_*.result.json"))
    positive = [audit_positive(path) for path in positive_paths]
    round20 = audit_positive(ROUND20)
    negative = [
        audit_negative(NEGATIVE_ROOT / "exacttwo-opp1-4-strong.json"),
        audit_negative(NEGATIVE_ROOT / "exacttwo-opp1-5-strong.json"),
    ]
    return {
        "epistemic_status": "EXACT_FINITE_REPLAY_OF_EXPORTED_CYCLIC_ROWS",
        "scope_warning": (
            "Not a Euclidean realization test and not arbitrary-cardinality coverage"
        ),
        "positive_record_count": len(positive),
        "all_positive_have_three_row_schema": bool(positive) and all(
            row["three_row_fixed_image_completion_witnesses"] > 0
            for row in positive
        ),
        "all_positive_have_actual_fixed_left_only_schema": bool(positive) and all(
            row["three_row_fixed_actual_left_only_witnesses"] > 0
            for row in positive
        ),
        "positive_records": positive,
        "round20_full_partition_projection": round20,
        "weaker_interface_regressions": negative,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "audit.json")
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    report = build_report()
    rendered = json.dumps(report, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists() or args.output.read_text() != rendered:
            raise SystemExit("audit artifact is stale")
        print("audit artifact matches exact replay")
        return
    args.output.write_text(rendered)
    print(rendered, end="")


if __name__ == "__main__":
    main()
