#!/usr/bin/env python3
"""Generate a deterministic SAT CNF matching the exact-17 ninth-root size.

This is a PIQD capacity canary, not a P97 proof artifact.  It deliberately
matches the production root's variable, clause, and byte counts while being
trivially satisfiable by setting variable 1 to true.
"""

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

HEADER = f"p cnf {VARIABLE_COUNT} {CLAUSE_COUNT}\n".encode()
UNIT_CLAUSE = b"1 0\n"
SHORT_CLAUSE = (b"1 " * 23) + b"0\n"
LONG_CLAUSE = (b"1 " * 24) + b"0\n"
CHUNK_LINE_COUNT = 100_000


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", type=Path, help="CNF output path")
    parser.add_argument(
        "--report",
        type=Path,
        help="JSON report path (default: OUTPUT.generation.json)",
    )
    parser.add_argument(
        "--force",
        action="store_true",
        help="replace an existing output or report",
    )
    return parser.parse_args()


def repeated_write(handle: object, digest: object, line: bytes, count: int) -> None:
    while count:
        take = min(count, CHUNK_LINE_COUNT)
        chunk = line * take
        handle.write(chunk)  # type: ignore[attr-defined]
        digest.update(chunk)  # type: ignore[attr-defined]
        count -= take


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
    output: Path = args.output.resolve()
    report: Path = (
        args.report.resolve()
        if args.report is not None
        else output.with_suffix(output.suffix + ".generation.json")
    )

    for path in (output, report):
        if path.exists() and not args.force:
            raise SystemExit(f"refusing to replace existing path without --force: {path}")

    all_long_bytes = (
        len(HEADER) + len(UNIT_CLAUSE) + (CLAUSE_COUNT - 1) * len(LONG_CLAUSE)
    )
    bytes_to_remove = all_long_bytes - TARGET_BYTE_COUNT
    line_size_delta = len(LONG_CLAUSE) - len(SHORT_CLAUSE)
    if bytes_to_remove < 0 or bytes_to_remove % line_size_delta != 0:
        raise RuntimeError("target byte count cannot be reached by the two templates")
    short_count = bytes_to_remove // line_size_delta
    long_count = (CLAUSE_COUNT - 1) - short_count
    if short_count < 0 or long_count < 0:
        raise RuntimeError("invalid derived template counts")

    output.parent.mkdir(parents=True, exist_ok=True)
    digest = hashlib.sha256()
    temporary: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="wb",
            dir=output.parent,
            prefix=f".{output.name}.",
            suffix=".tmp",
            delete=False,
        ) as handle:
            temporary = Path(handle.name)
            for prefix in (HEADER, UNIT_CLAUSE):
                handle.write(prefix)
                digest.update(prefix)
            repeated_write(handle, digest, SHORT_CLAUSE, short_count)
            repeated_write(handle, digest, LONG_CLAUSE, long_count)
            handle.flush()
            os.fsync(handle.fileno())

        actual_bytes = temporary.stat().st_size
        if actual_bytes != TARGET_BYTE_COUNT:
            raise RuntimeError(
                f"generated {actual_bytes} bytes, expected {TARGET_BYTE_COUNT}"
            )
        os.replace(temporary, output)
        temporary = None
    finally:
        if temporary is not None:
            temporary.unlink(missing_ok=True)

    payload: dict[str, object] = {
        "artifact_kind": "piqd-large-cnf-capacity-preflight",
        "artifact_role": "non-production throwaway SAT canary",
        "byte_count": TARGET_BYTE_COUNT,
        "clause_count": CLAUSE_COUNT,
        "generated_at_utc": datetime.now(UTC).isoformat(),
        "generator_path": str(Path(__file__).resolve()),
        "generator_sha256": hashlib.sha256(Path(__file__).read_bytes()).hexdigest(),
        "long_clause_count": long_count,
        "long_clause_literal_count": 24,
        "output_path": str(output),
        "satisfying_assignment": {"1": True},
        "sha256": digest.hexdigest(),
        "short_clause_count": short_count,
        "short_clause_literal_count": 23,
        "unit_clause_count": 1,
        "variable_count": VARIABLE_COUNT,
    }
    atomic_json_write(report, payload)
    print(json.dumps(payload, sort_keys=True))


if __name__ == "__main__":
    main()
