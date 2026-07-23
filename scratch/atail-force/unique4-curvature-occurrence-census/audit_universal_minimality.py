#!/usr/bin/env python3
"""Replay universal minimality on the pinned round-20 finite survivor.

This is an exact audit of the exported radius-class partition at n=11.  It
does not establish Euclidean realizability and is not an arbitrary-cardinality
minimality theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
DEFAULT_SOURCE = (
    HERE.parent
    / "unique-arm-whole-carrier-source-audit"
    / "cegar"
    / "round_020"
    / "opp1_4.result.json"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def audit(source: Path) -> dict[str, Any]:
    payload = json.loads(source.read_text(encoding="utf-8"))
    n = int(payload["n"])
    if n != 11 or payload.get("solver_status") != "SAT":
        raise ValueError("expected the pinned SAT n=11 survivor")
    rows = {
        int(center): frozenset(map(int, support))
        for center, support in payload["rows"].items()
    }
    radius_classes = {
        int(center): tuple(frozenset(map(int, radius_class)) for radius_class in classes)
        for center, classes in payload["radius_classes"].items()
    }
    if set(rows) != set(range(n)) or set(radius_classes) != set(range(n)):
        raise AssertionError("center universe drifted")

    center_facts = []
    for center in range(n):
        k4_classes = [radius_class for radius_class in radius_classes[center]
                      if len(radius_class) >= 4]
        center_facts.append(
            {
                "center": center,
                "k4_capable_class_count": len(k4_classes),
                "k4_capable_class_cards": [len(radius_class) for radius_class in k4_classes],
                "unique_k4_class_equals_selected_row": (
                    len(k4_classes) == 1 and k4_classes[0] == rows[center]
                ),
            }
        )

    closed_subsets: list[list[int]] = []
    escape_center_histogram = {center: 0 for center in range(n)}
    checked = 0
    for mask in range(1, (1 << n) - 1):
        carrier = frozenset(index for index in range(n) if mask & (1 << index))
        checked += 1
        escape = next(
            (
                center for center in sorted(carrier)
                if all(len(radius_class & carrier) < 4
                       for radius_class in radius_classes[center])
            ),
            None,
        )
        if escape is None:
            closed_subsets.append(sorted(carrier))
        else:
            escape_center_histogram[escape] += 1

    return {
        "schema": "p97-round20-universal-minimality-radius-class-audit-v1",
        "epistemic_status": "EXACT_FINITE_REPLAY_OF_EXPORTED_RADIUS_CLASSES",
        "scope_warning": (
            "The source is a Boolean projection survivor, not a Euclidean "
            "realization; this is not arbitrary-cardinality coverage"
        ),
        "source": str(source.resolve().relative_to(ROOT.resolve())),
        "source_sha256": sha256(source),
        "n": n,
        "nonempty_proper_subset_count": checked,
        "expected_nonempty_proper_subset_count": (1 << n) - 2,
        "universal_minimality_closure_passes": not closed_subsets,
        "closed_proper_subsets": closed_subsets,
        "deterministic_first_escape_center_histogram": {
            str(center): count for center, count in escape_center_histogram.items()
        },
        "all_centers_have_one_exact_four_class_equal_to_selected_row": all(
            fact["k4_capable_class_count"] == 1
            and fact["k4_capable_class_cards"] == [4]
            and fact["unique_k4_class_equals_selected_row"]
            for fact in center_facts
        ),
        "center_facts": center_facts,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = audit(args.source)
    if args.check:
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        if result != expected:
            raise AssertionError("universal-minimality audit drifted")
        print("PASS: universal-minimality audit matches checkpoint")
    else:
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(json.dumps({
            "checked_subset_count": result["nonempty_proper_subset_count"],
            "universal_minimality_closure_passes": result[
                "universal_minimality_closure_passes"
            ],
            "all_centers_exact_four": result[
                "all_centers_have_one_exact_four_class_equal_to_selected_row"
            ],
        }, sort_keys=True))


if __name__ == "__main__":
    main()
