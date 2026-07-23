#!/usr/bin/env python3
"""Replay the exact source-facing facts of the support-lock regression.

This checks the pinned finite incidence payload only.  It neither reconstructs
the full CNF nor upgrades that finite projection to Euclidean realizability.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
FIXTURE = HERE / "profile4_round4_support_lock_regression.json"


def triangle_omission_certificates(
    rows: list[set[int]], blocker_image: set[int]
) -> list[tuple[int, int, int]]:
    certificates = []
    for anchor in range(len(rows)):
        for middle in range(len(rows)):
            for blocker in blocker_image:
                if len({anchor, middle, blocker}) != 3:
                    continue
                if (
                    middle in rows[anchor]
                    and blocker in rows[anchor]
                    and anchor in rows[middle]
                    and blocker in rows[middle]
                    and middle in rows[blocker]
                    and anchor not in rows[blocker]
                ):
                    certificates.append((anchor, middle, blocker))
    return certificates


def replay(payload: dict[str, Any]) -> dict[str, Any]:
    n = int(payload["n"])
    rows = [set(map(int, row)) for row in payload["rows"]]
    blockers = list(map(int, payload["blockers"]))
    critical = [set(map(int, row)) for row in payload["critical_supports_by_source"]]
    if len(rows) != n or len(blockers) != n or len(critical) != n:
        raise AssertionError("carrier-sized arrays have drifted")
    for center, row in enumerate(rows):
        if len(row) != 4 or center in row:
            raise AssertionError(f"malformed selected row at center {center}")
    for source, blocker in enumerate(blockers):
        if blocker == source or not 0 <= blocker < n:
            raise AssertionError(f"malformed blocker at source {source}")
        if source not in critical[source]:
            raise AssertionError(f"source {source} absent from its critical shell")
        if critical[source] != rows[blocker]:
            raise AssertionError(
                f"support lock fails for source {source} at blocker {blocker}"
            )
    exact_class = set(map(int, payload["first_apex_exact_class"]))
    first_apex = int(payload["first_apex"])
    first_fiber = {
        source for source, blocker in enumerate(blockers) if blocker == first_apex
    }
    if first_fiber != exact_class or rows[first_apex] != exact_class:
        raise AssertionError("exact first-apex fiber/class normal form drifted")
    certificates = triangle_omission_certificates(rows, set(blockers))
    if certificates:
        raise AssertionError(f"unexpected triangle omission certificates: {certificates}")
    curvature = payload["source_curvature_terminal_summary"]
    if (
        curvature["solver_status"] != "UNSAT"
        or not curvature["all_checked_terminal_witnesses_replayed"]
        or int(curvature["checked_terminal_witness_count"]) <= 0
    ):
        raise AssertionError("separate checked curvature terminal summary drifted")
    return {
        "schema": payload["schema"],
        "epistemic_status": payload["epistemic_status"],
        "support_lock_holds_at_every_blocker_image_center": True,
        "blocker_image": sorted(set(blockers)),
        "exact_first_apex_fiber": sorted(first_fiber),
        "complete_radius_triangle_omission_certificate_count": len(certificates),
        "separate_checked_curvature_terminal_witness_count": int(
            curvature["checked_terminal_witness_count"]
        ),
        "source_result_sha256": payload["source_result_sha256"],
        "claim_scope": payload["claim_scope"],
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    payload = json.loads(FIXTURE.read_text())
    result = replay(payload)
    expected = payload["expected"]
    if not expected["support_lock_holds_at_every_blocker_image_center"]:
        raise AssertionError("fixture expectation drift")
    if int(expected["complete_radius_triangle_omission_certificate_count"]) != 0:
        raise AssertionError("fixture expectation drift")
    if args.check:
        print("PASS: support locks hold and no triangle omission is forced")
    else:
        print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
