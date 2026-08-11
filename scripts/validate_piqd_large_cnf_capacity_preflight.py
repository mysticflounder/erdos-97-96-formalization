#!/usr/bin/env python3
"""Independently validate the deterministic large-CNF PIQD preflight."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import tempfile
from datetime import UTC, datetime
from pathlib import Path

VARIABLE_COUNT = 308
CLAUSE_COUNT = 5_846_076
TARGET_BYTE_COUNT = 291_567_840
EXPECTED_HEADER = f"p cnf {VARIABLE_COUNT} {CLAUSE_COUNT}\n".encode()
EXPECTED_UNIT = b"1 0\n"
EXPECTED_SHORT = (b"1 " * 23) + b"0\n"
EXPECTED_LONG = (b"1 " * 24) + b"0\n"
EXPECTED_SHORT_COUNT = 367_966
EXPECTED_LONG_COUNT = 5_478_109


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("cnf", type=Path, help="CNF artifact to validate")
    parser.add_argument(
        "--report",
        type=Path,
        help="JSON report path (default: CNF.validation.json)",
    )
    parser.add_argument(
        "--expected-sha256",
        help="optional expected artifact SHA-256",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="replace an existing report",
    )
    return parser.parse_args()


def atomic_json_write(path: Path, payload: dict[str, object]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.NamedTemporaryFile(
        mode="w",
        encoding="utf-8",
        dir=path.parent,
        prefix=f".{path.name}.",
        suffix=".tmp",
        delete=False,
    ) as handle:
        temporary = Path(handle.name)
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
        handle.flush()
        os.fsync(handle.fileno())
    os.replace(temporary, path)


def main() -> None:
    args = parse_args()
    cnf = args.cnf.resolve()
    report = (
        args.report.resolve()
        if args.report is not None
        else cnf.with_suffix(cnf.suffix + ".validation.json")
    )
    if report.exists() and not args.force:
        raise SystemExit(f"refusing to replace existing report without --force: {report}")
    if cnf.stat().st_size != TARGET_BYTE_COUNT:
        raise SystemExit(
            f"wrong byte count: {cnf.stat().st_size}; expected {TARGET_BYTE_COUNT}"
        )

    digest = hashlib.sha256()
    short_count = 0
    long_count = 0
    clause_count = 0
    with cnf.open("rb") as handle:
        header = handle.readline()
        digest.update(header)
        if header != EXPECTED_HEADER:
            raise SystemExit(f"unexpected header: {header!r}")

        unit = handle.readline()
        digest.update(unit)
        clause_count += 1
        if unit != EXPECTED_UNIT:
            raise SystemExit(f"unexpected first clause: {unit!r}")

        for line_number, line in enumerate(handle, start=3):
            digest.update(line)
            clause_count += 1
            if line == EXPECTED_SHORT:
                short_count += 1
            elif line == EXPECTED_LONG:
                long_count += 1
            else:
                raise SystemExit(
                    f"unexpected clause template at line {line_number}: {line[:80]!r}"
                )

    actual_sha256 = digest.hexdigest()
    checks = {
        "clause_count": clause_count == CLAUSE_COUNT,
        "long_clause_count": long_count == EXPECTED_LONG_COUNT,
        "short_clause_count": short_count == EXPECTED_SHORT_COUNT,
        "sha256": (
            args.expected_sha256 is None
            or actual_sha256 == args.expected_sha256.lower()
        ),
    }
    if not all(checks.values()):
        raise SystemExit(f"validation failed: {checks}")

    payload: dict[str, object] = {
        "artifact_kind": "piqd-large-cnf-capacity-preflight-validation",
        "byte_count": cnf.stat().st_size,
        "checks": checks,
        "clause_count": clause_count,
        "cnf_path": str(cnf),
        "long_clause_count": long_count,
        "sha256": actual_sha256,
        "short_clause_count": short_count,
        "valid": True,
        "validated_at_utc": datetime.now(UTC).isoformat(),
        "validator_path": str(Path(__file__).resolve()),
        "validator_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "variable_count": VARIABLE_COUNT,
    }
    atomic_json_write(report, payload)
    print(json.dumps(payload, sort_keys=True))


if __name__ == "__main__":
    main()
