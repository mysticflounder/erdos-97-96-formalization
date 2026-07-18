#!/usr/bin/env python3
"""Exact all-radius replay for the named exact-six mutual blocker rows.

The predecessor witness already realizes the four theorem-derived rows over
an exact rational carrier.  This replay adds the omitted semantic gate at the
three actual critical blockers: after deleting the actual source, enumerate
every positive squared-distance class and require its cardinality to be less
than four.  It does not add a row, source, center, or incidence.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections import defaultdict
from fractions import Fraction as Q
from pathlib import Path
import sys
from types import ModuleType


HERE = Path(__file__).resolve().parent
UPSTREAM = HERE.parent / "exact6-manifest-first-gate"
UPSTREAM_SCRIPT = UPSTREAM / "first_gate.py"
UPSTREAM_RESULTS = UPSTREAM / "results.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_upstream() -> ModuleType:
    spec = importlib.util.spec_from_file_location("exact6_manifest_first_gate", UPSTREAM_SCRIPT)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {UPSTREAM_SCRIPT}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def qstr(value: Q) -> str:
    if value.denominator == 1:
        return str(value.numerator)
    return f"{value.numerator}/{value.denominator}"


def point_json(point: tuple[Q, Q]) -> list[str]:
    return [qstr(point[0]), qstr(point[1])]


def label_map(witness: object) -> dict[tuple[Q, Q], str]:
    labels: dict[tuple[Q, Q], str] = {
        point: name for name, point in witness.points.items()
    }
    for name, point in witness.blockers.items():
        labels.setdefault(point, f"blocker_{name}")
    for row, support in witness.supports.items():
        for index, point in enumerate(sorted(support)):
            labels.setdefault(point, f"{row}_support_{index}")
    return labels


def radius_class_ledger(
    upstream: ModuleType,
    witness: object,
    row: str,
) -> dict[str, object]:
    source = {
        "unused": witness.points["unused"],
        "source": witness.roles["source"],
        "target": witness.roles["target"],
    }[row]
    blocker = witness.blockers[row]
    remaining = witness.carrier - {source}
    classes: dict[Q, list[tuple[Q, Q]]] = defaultdict(list)
    for point in remaining:
        squared_radius = upstream.dist2(blocker, point)
        if squared_radius > 0:
            classes[squared_radius].append(point)
    labels = label_map(witness)
    ordered_classes = []
    for squared_radius, points in sorted(classes.items()):
        ordered_points = sorted(points)
        ordered_classes.append({
            "squared_radius": qstr(squared_radius),
            "cardinality": len(ordered_points),
            "points": [
                {
                    "label": labels.get(point, "carrier_point"),
                    "coordinates": point_json(point),
                }
                for point in ordered_points
            ],
        })
    maximum = max(item["cardinality"] for item in ordered_classes)
    represented_after_deletion = witness.supports[row] - {source}
    represented_squared_radius = upstream.dist2(blocker, source)
    represented_class = frozenset(
        point for point in remaining
        if upstream.dist2(blocker, point) == represented_squared_radius
    )
    checks = {
        "actual_source_in_represented_support": source in witness.supports[row],
        "represented_class_after_deletion_is_complete":
            represented_class == represented_after_deletion,
        "represented_class_after_deletion_card_eq_three":
            len(represented_class) == 3,
        "all_positive_radius_classes_card_lt_four": maximum < 4,
    }
    return {
        "row": row,
        "actual_source": point_json(source),
        "actual_blocker": point_json(blocker),
        "remaining_carrier_cardinality": len(remaining),
        "positive_radius_class_count": len(ordered_classes),
        "maximum_positive_radius_class_cardinality": maximum,
        "represented_squared_radius": qstr(represented_squared_radius),
        "checks": checks,
        "positive_radius_classes": ordered_classes,
    }


def whole_carrier_k4_diagnostic(
    upstream: ModuleType,
    witness: object,
) -> dict[str, object]:
    """Measure, but do not impose, the omitted global-K4 condition."""
    labels = label_map(witness)
    center_maxima = []
    for center in sorted(witness.carrier):
        classes: dict[Q, int] = defaultdict(int)
        for point in witness.carrier:
            squared_radius = upstream.dist2(center, point)
            if squared_radius > 0:
                classes[squared_radius] += 1
        maximum = max(classes.values())
        center_maxima.append({
            "center": point_json(center),
            "label": labels.get(center, "carrier_point"),
            "maximum_positive_radius_class_cardinality": maximum,
            "has_K4": maximum >= 4,
        })
    k4_count = sum(item["has_K4"] for item in center_maxima)
    return {
        "status": "DIAGNOSTIC_ONLY_NOT_A_GATE",
        "carrier_cardinality": len(witness.carrier),
        "centers_with_K4": k4_count,
        "centers_without_K4": len(witness.carrier) - k4_count,
        "global_K4_holds": k4_count == len(witness.carrier),
        "center_maxima": center_maxima,
    }


def replay() -> dict[str, object]:
    upstream = load_upstream()
    upstream_payload = json.loads(UPSTREAM_RESULTS.read_text())
    upstream_by_orbit = {
        result["orbit"]: result for result in upstream_payload["results"]
    }
    results = []
    for orbit in upstream.ORBITS:
        witness = upstream.build(orbit)
        predecessor_checks = upstream.validate(witness)
        if not all(predecessor_checks.values()):
            raise AssertionError((orbit, "predecessor replay failed"))
        if upstream_by_orbit[orbit]["verdict"] != "EXACT_ROW_CAP_PROJECTION_WITNESS":
            raise AssertionError((orbit, "upstream artifact is not a witness"))
        ledgers = [
            radius_class_ledger(upstream, witness, row)
            for row in ("unused", "source", "target")
        ]
        checks = {
            "predecessor_checks_all_pass": all(predecessor_checks.values()),
            "exactly_three_actual_named_blocker_rows": len(ledgers) == 3,
            "every_named_blocker_deletion_forbids_all_K4_radii": all(
                all(ledger["checks"].values()) for ledger in ledgers
            ),
        }
        verdict = "EXACT_NAMED_NO_QFREE_PROJECTION_WITNESS" if all(checks.values()) else "INVALID"
        results.append({
            "orbit": orbit,
            "verdict": verdict,
            "checks": checks,
            "named_blocker_ledgers": ledgers,
            "omitted_global_K4_diagnostic":
                whole_carrier_k4_diagnostic(upstream, witness),
        })
    surviving = sum(
        result["verdict"] == "EXACT_NAMED_NO_QFREE_PROJECTION_WITNESS"
        for result in results
    )
    return {
        "schema": "p97-exact6-mutual-named-no-qfree-semantic-gate-v1",
        "status": "EXACT_NAMED_NO_QFREE_GATE_COMPLETE",
        "upstream": {
            "first_gate_script": str(UPSTREAM_SCRIPT.relative_to(HERE.parent.parent.parent)),
            "first_gate_script_sha256": sha256(UPSTREAM_SCRIPT),
            "first_gate_results": str(UPSTREAM_RESULTS.relative_to(HERE.parent.parent.parent)),
            "first_gate_results_sha256": sha256(UPSTREAM_RESULTS),
        },
        "scope": {
            "actual_named_rows": ["unused", "mutual_source", "mutual_target"],
            "anonymous_rows_added": 0,
            "literal_core_occurrence_assumptions_added": 0,
            "all_positive_radius_classes_enumerated": True,
        },
        "orbit_count": len(results),
        "eliminated_orbit_count": len(results) - surviving,
        "surviving_orbit_count": surviving,
        "results": results,
        "omitted": [
            "critical rows and no-qfree manifests for unnamed carrier sources",
            "global K4 selected rows at every carrier center",
            "strict convexity and one cyclic boundary order",
            "minimum-enclosing-circle containment and nonobtuse support triangle",
            "global minimality and noM44",
        ],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = replay()
    print(
        "exact-six named no-qfree gate:",
        f"{payload['surviving_orbit_count']}/{payload['orbit_count']} survive;",
        f"{payload['eliminated_orbit_count']} eliminated",
    )
    for result in payload["results"]:
        maxima = {
            ledger["row"]: ledger["maximum_positive_radius_class_cardinality"]
            for ledger in result["named_blocker_ledgers"]
        }
        print(f"{result['orbit']}: {result['verdict']} maxima={maxima}")
    if args.output:
        args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    if payload["surviving_orbit_count"] != payload["orbit_count"]:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
