#!/usr/bin/env python3
"""Independent standard-library verifier for the Kalmanson feasibility census."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from fractions import Fraction
from pathlib import Path
from typing import Any, Iterable


SURPLUS_INTERIOR = (6, 7, 13)
FIRST_OPPOSITE_INTERIOR = (5, 8, 9, 10)
PHYSICAL_SECOND_INTERIOR = (3, 4, 11, 12)

ROW_ZERO = frozenset((4, 5, 6, 8))
ROW_TWO = frozenset((0, 3, 6, 8))


def expected_orders() -> set[tuple[int, ...]]:
    return {
        (0, *surplus, 1, *first, 2, *physical)
        for surplus in itertools.permutations(SURPLUS_INTERIOR)
        for first in itertools.permutations(FIRST_OPPOSITE_INTERIOR)
        for physical in itertools.permutations(PHYSICAL_SECOND_INTERIOR)
    }


def add_coefficients(
    total: dict[str, Fraction], coefficients: dict[str, str], multiplier: Fraction
) -> None:
    for variable, raw_coefficient in coefficients.items():
        total[variable] = total.get(variable, Fraction(0)) + multiplier * Fraction(raw_coefficient)


def verify_farkas(payload: dict[str, Any]) -> None:
    constraints = {constraint["name"]: constraint for constraint in payload["constraints"]}
    total: dict[str, Fraction] = {}
    rhs = Fraction(0)
    for name, raw_multiplier in payload["multipliers"].items():
        multiplier = Fraction(raw_multiplier)
        if multiplier < 0:
            raise AssertionError("Farkas multiplier is negative")
        constraint = constraints[name]
        add_coefficients(total, constraint["coefficients"], multiplier)
        rhs += multiplier * Fraction(constraint["rhs"])
    nonzero = {variable: coefficient for variable, coefficient in total.items() if coefficient}
    if nonzero:
        raise AssertionError(f"Farkas left side does not cancel: {nonzero}")
    if rhs != 1:
        raise AssertionError(f"Farkas right side is {rhs}, expected 1")
    if payload.get("sum") != "0 >= 1" or payload.get("valid") is not True:
        raise AssertionError("stored Farkas verdict does not match exact replay")


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def write_json(path: Path, payload: Any) -> None:
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("directory", nargs="?", type=Path, default=Path(__file__).resolve().parent)
    args = parser.parse_args()

    log_path = args.directory / "run.jsonl"
    certificate_path = args.directory / "farkas_certificate.json"
    summary_path = args.directory / "summary.json"

    certificate = json.loads(certificate_path.read_text())
    verify_farkas(certificate)

    expected = expected_orders()
    if len(expected) != 3456:
        raise AssertionError(f"independent order enumeration has size {len(expected)}")
    if not ({6, 8} <= ROW_ZERO and {6, 8} <= ROW_TWO):
        raise AssertionError("the shared-middle incidence is absent")

    header: dict[str, Any] | None = None
    stored_summary: dict[str, Any] | None = None
    observed: set[tuple[int, ...]] = set()
    verdicts = {"sat": 0, "unsat": 0, "unknown": 0}
    with log_path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            record = json.loads(line)
            record_type = record["type"]
            if record_type == "header":
                if header is not None:
                    raise AssertionError("duplicate header")
                header = record
            elif record_type == "order":
                order = tuple(record["order"])
                if order in observed:
                    raise AssertionError(f"duplicate order on log line {line_number}")
                if order not in expected:
                    raise AssertionError(f"incompatible order on log line {line_number}: {order}")
                if not order.index(0) < order.index(6) < order.index(8) < order.index(2):
                    raise AssertionError(f"Farkas schema misses order {order}")
                verdict = record["verdict"]
                if verdict not in verdicts:
                    raise AssertionError(f"unknown verdict spelling {verdict}")
                verdicts[verdict] += 1
                observed.add(order)
            elif record_type == "summary":
                stored_summary = record
            elif record_type != "progress":
                raise AssertionError(f"unknown record type {record_type}")

    if observed != expected:
        missing = sorted(expected - observed)
        extra = sorted(observed - expected)
        raise AssertionError(f"order coverage mismatch: missing={missing[:3]}, extra={extra[:3]}")
    if verdicts != {"sat": 0, "unsat": 3456, "unknown": 0}:
        raise AssertionError(f"unexpected verdict counts: {verdicts}")
    if header is None or header["surface_automorphism_count"] != 1:
        raise AssertionError("missing header or unexpected automorphism quotient")
    if stored_summary is None:
        raise AssertionError("missing run summary")

    summary = json.loads(summary_path.read_text())
    if summary != stored_summary:
        raise AssertionError("summary.json differs from the JSONL terminal summary")
    if summary["representative_cvc5_verdict"] != "unsat":
        raise AssertionError("representative cvc5 cross-check did not return UNSAT")
    if not summary["all_orders_farkas_schema_covered"]:
        raise AssertionError("summary does not claim exact schema coverage")

    verification = {
        "status": "verified",
        "order_count": len(observed),
        "verdicts": verdicts,
        "farkas_sum": "0 >= 1",
        "representative_cvc5_verdict": "unsat",
        "run_jsonl_sha256": sha256(log_path),
        "farkas_certificate_sha256": sha256(certificate_path),
        "summary_sha256": sha256(summary_path),
    }
    write_json(args.directory / "verification.json", verification)
    print(json.dumps(verification, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
