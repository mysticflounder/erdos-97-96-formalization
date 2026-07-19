#!/usr/bin/env python3
"""Fail-closed validator for the equal-blocker full-parent gate manifest."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


REQUIRED_SCHEMA = "p97-atail-equal-blocker-full-parent-gate-v1"
DECISIVE = {"FULL_PARENT_SAT_WITNESS", "CERTIFIED_UNSAT"}
ALLOWED = DECISIVE | {"UNKNOWN", "NOT_RUN"}


def fail(message: str) -> int:
    print(f"FAIL: {message}")
    return 1


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--manifest", required=True, type=Path)
    args = parser.parse_args()
    try:
        data = json.loads(args.manifest.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        return fail(f"cannot read manifest: {exc}")

    if data.get("schema") != REQUIRED_SCHEMA:
        return fail(f"schema must be {REQUIRED_SCHEMA!r}")
    status = data.get("status")
    if status not in ALLOWED:
        return fail(f"unsupported status {status!r}")
    target = data.get("target")
    if not isinstance(target, dict) or target.get("branch") != "FullParentExactFiveMutualData.equal_blocker":
        return fail("target is not the equal-blocker full-parent branch")

    ledger = data.get("parent_ledger")
    if not isinstance(ledger, dict):
        return fail("parent_ledger must be an object")
    missing = sorted(key for key, value in ledger.items() if value is not True)
    if not ledger:
        return fail("parent_ledger is empty")

    if status in DECISIVE and missing:
        return fail(
            "decisive status is forbidden while parent fields are missing: "
            + ", ".join(missing)
        )
    if status == "FULL_PARENT_SAT_WITNESS":
        witness = data.get("witness")
        if not isinstance(witness, dict) or not witness.get("substitution_checked"):
            return fail("SAT witness must record substitution_checked=true")
        if data.get("certificate") is not None:
            return fail("SAT witness must not carry an UNSAT certificate")
    elif status == "CERTIFIED_UNSAT":
        certificate = data.get("certificate")
        if not isinstance(certificate, dict) or not certificate.get("checker") or not certificate.get("digest"):
            return fail("UNSAT status requires a checker and certificate digest")
        if data.get("witness") is not None:
            return fail("UNSAT result must not carry a SAT witness")
    elif status in {"UNKNOWN", "NOT_RUN"}:
        if not isinstance(data.get("status_reason"), str) or not data["status_reason"].strip():
            return fail(f"{status} requires a nonempty status_reason")
        if data.get("witness") is not None or data.get("certificate") is not None:
            return fail(f"{status} must not carry decisive evidence")

    evidence = data.get("evidence")
    if not isinstance(evidence, list):
        return fail("evidence must be a list")
    for item in evidence:
        if not isinstance(item, dict) or item.get("classification") != "RELAXATION_ONLY":
            return fail("every pre-gate evidence item must be explicitly RELAXATION_ONLY")

    print(json.dumps({"status": status, "missing_parent_fields": missing}, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
