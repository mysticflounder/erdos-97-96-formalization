#!/usr/bin/env python3
"""Fail-closed audit linking an anchor-gauge certificate to a saved core."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path

from probe_saved_source_indexed_patterns import PATTERNS


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("scan", type=Path)
    parser.add_argument("pattern", choices=sorted(PATTERNS))
    parser.add_argument("left", type=int)
    parser.add_argument("right", type=int)
    parser.add_argument("certificate", type=Path)
    args = parser.parse_args()

    scan = json.loads(args.scan.read_text(encoding="utf-8"))
    require(
        scan["schema"] == "p97-source-indexed-anchor-pair-gauge-scan-v1",
        "unexpected gauge-scan schema",
    )
    require(scan["pattern"] == args.pattern, "gauge-scan pattern drift")
    matches = [
        report
        for report in scan["reports"]
        if report["old_anchor_pair"] == [args.left, args.right]
    ]
    require(len(matches) == 1, "expected exactly one selected anchor report")
    report = matches[0]
    require(
        report["msolve"]["forward"]["verdict"] == "UNIT"
        and report["msolve"]["reverse"]["verdict"] == "UNIT",
        "selected gauge is not cross-checked UNIT",
    )
    old_to_new = list(map(int, report["old_to_new"]))
    require(sorted(old_to_new) == list(range(12)), "stored relabeling is not a permutation")
    require(old_to_new[args.left] == 0, "left anchor was not normalized to zero")
    require(old_to_new[args.right] == 1, "right anchor was not normalized to one")

    expected_rows = sorted(
        (
            old_to_new[center],
            sorted(old_to_new[point] for point in support),
        )
        for center, support in PATTERNS[args.pattern].items()
    )
    certificate_bytes = args.certificate.read_bytes()
    certificate = json.loads(certificate_bytes)
    actual_rows = [
        (int(row["center"]), list(map(int, row["support"])))
        for row in certificate["rows"]
    ]
    require(actual_rows == expected_rows, "certificate rows do not match the anchor relabeling")
    require(
        certificate.get("point_relabeling_old_to_new") == old_to_new,
        "certificate relabeling metadata drifted",
    )
    require(
        certificate["core_equality_sha256"]
        == report["expanded_polynomial_sha256"],
        "certificate core hash disagrees with the gauge scan",
    )
    print(json.dumps({
        "status": "PASS",
        "pattern": args.pattern,
        "old_anchor_pair": [args.left, args.right],
        "certificate_sha256": hashlib.sha256(certificate_bytes).hexdigest(),
        "core_equality_sha256": certificate["core_equality_sha256"],
        "row_count": len(actual_rows),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
