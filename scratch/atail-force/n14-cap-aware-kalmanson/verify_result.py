#!/usr/bin/env python3
"""Solver-independent replay for the normalized n=14 cap-aware payload.

This verifier deliberately does not import the cap-aware encoder.  It reuses
only the generic exact-rational whole-carrier payload verifier, then checks the
fixed cap profile and every added cap-row cardinality inequality directly on
the exported row table.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from fractions import Fraction
from pathlib import Path


HERE = Path(__file__).resolve().parent
GENERIC_DIR = HERE.parent / "generic-biapex-kalmanson-search"

PAYLOAD_SPEC = importlib.util.spec_from_file_location(
    "generic_payload_verifier",
    GENERIC_DIR / "payload_verifier.py",
)
if PAYLOAD_SPEC is None or PAYLOAD_SPEC.loader is None:
    raise RuntimeError("cannot load the generic payload verifier")
PAYLOAD = importlib.util.module_from_spec(PAYLOAD_SPEC)
PAYLOAD_SPEC.loader.exec_module(PAYLOAD)


N = 14
FIRST_APEX = 0
SECOND_APEX = 4
THIRD_APEX = 9
CAPS = {
    "C1_surplus": frozenset({0, 1, 2, 3, 4}),
    "C2_opposite_1": frozenset({4, 5, 6, 7, 8, 9}),
    "C3_opposite_2": frozenset({9, 10, 11, 12, 13, 0}),
}
CAP_ENDPOINTS = {
    "C1_surplus": frozenset({0, 4}),
    "C2_opposite_1": frozenset({4, 9}),
    "C3_opposite_2": frozenset({9, 0}),
}


def normalized_rows(payload: dict[str, object]) -> dict[int, tuple[int, ...]]:
    rows_raw = payload.get("rows")
    if not isinstance(rows_raw, dict):
        raise RuntimeError("payload has no row table")
    return {
        int(center): tuple(int(point) for point in support)
        for center, support in rows_raw.items()
    }


def verify_cap_rows(rows: dict[int, tuple[int, ...]]) -> dict[str, object]:
    errors: list[str] = []
    checks = 0
    endpoint_checks = 0
    for cap_name, cap in CAPS.items():
        endpoints = CAP_ENDPOINTS[cap_name]
        for center in sorted(cap):
            intersection = set(rows.get(center, ())) & set(cap)
            checks += 1
            if len(intersection) > 2:
                errors.append(
                    f"row {center} meets {cap_name} in {sorted(intersection)} (>2)"
                )
            if center in endpoints:
                endpoint_checks += 1
                if len(intersection) > 1:
                    errors.append(
                        f"endpoint row {center} meets {cap_name} in "
                        f"{sorted(intersection)} (>1)"
                    )
    if errors:
        raise RuntimeError("cap-row replay failed: " + "; ".join(errors[:10]))
    return {
        "status": "CAP_ROW_CARDINALITIES_VERIFIED",
        "solver_independent": True,
        "center_cap_checks": checks,
        "endpoint_cap_checks": endpoint_checks,
    }


def verify(payload: dict[str, object]) -> dict[str, object]:
    if payload.get("n") != N:
        raise RuntimeError(f"expected n={N}, got {payload.get('n')}")
    if payload.get("omitted_apices") != [FIRST_APEX, SECOND_APEX]:
        raise RuntimeError(
            "expected omitted apices [0,4], got "
            f"{payload.get('omitted_apices')}"
        )
    if payload.get("third_apex") != THIRD_APEX:
        raise RuntimeError(
            f"expected third apex {THIRD_APEX}, got {payload.get('third_apex')}"
        )
    expected_caps = {name: sorted(cap) for name, cap in CAPS.items()}
    if payload.get("caps") != expected_caps:
        raise RuntimeError("payload cap metadata does not match normalized (5,6,6)")

    rows = normalized_rows(payload)
    blockers_raw = payload.get("blockers")
    distances = payload.get("distances")
    if not isinstance(blockers_raw, dict) or not isinstance(distances, dict):
        raise RuntimeError("payload lacks blockers or exact distance table")
    blockers = {int(source): int(center) for source, center in blockers_raw.items()}
    generic = PAYLOAD.verify_payload(
        n=N,
        second_apex=SECOND_APEX,
        rows=rows,
        blockers=blockers,
        distances={str(key): str(value) for key, value in distances.items()},
        distance_lower_bound=Fraction(1),
    )
    cap = verify_cap_rows(rows)
    return {
        "status": "EXACT_RATIONAL_CAP_AWARE_PAYLOAD_VERIFIED",
        "solver_independent": True,
        "generic": generic,
        "cap": cap,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("payload", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    payload = json.loads(args.payload.read_text(encoding="utf-8"))
    result = verify(payload)
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
