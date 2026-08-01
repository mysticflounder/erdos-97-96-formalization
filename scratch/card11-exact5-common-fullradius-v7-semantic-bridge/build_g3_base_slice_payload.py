#!/usr/bin/env python3
"""Build the exact retained G3 base-slice source-index payload.

The audited semantics JSON is intentionally large.  Its pretty-printed entry
objects have stable one-field-per-line metadata, so this script streams the
file and stops at the first post-base entry instead of loading 288 MB of JSON.
The output is the strict raw ASCII85 envelope of positive LEB128 deltas between
the retained one-based `baseDimacs` source positions.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import re
from pathlib import Path


CORE_RE = re.compile(r'^\s*"core_clause_index_1based":\s*(\d+),\s*$')
FAMILY_RE = re.compile(r'^\s*"family":\s*"([^"]+)",\s*$')
POSITION_RE = re.compile(r'^\s*"original_position":\s*(\d+),\s*$')

BASE_FAMILY = "inherited-census554-base"
EXPECTED_COUNT = 108_704
EXPECTED_FIRST = 1
EXPECTED_LAST = 207_114
EXPECTED_SHA256 = (
    "5281327aca49a9afaa52517f6fd9be0eade5b9f1684eb278c5883bb317219176"
)


def encode_varuint(value: int) -> bytes:
    if value <= 0:
        raise ValueError(f"delta must be positive, got {value}")
    out = bytearray()
    while value >= 128:
        out.append((value & 0x7F) | 0x80)
        value >>= 7
    out.append(value)
    return bytes(out)


def read_positions(path: Path) -> list[int]:
    positions: list[int] = []
    current_core: int | None = None
    current_family: str | None = None
    in_entries = False

    with path.open(encoding="utf-8") as source:
        for line in source:
            if not in_entries:
                if line == '  "entries": [\n':
                    in_entries = True
                continue

            if match := CORE_RE.match(line):
                current_core = int(match.group(1))
                current_family = None
                if current_core > EXPECTED_COUNT + 1 and positions:
                    break
                continue
            if match := FAMILY_RE.match(line):
                current_family = match.group(1)
                continue
            if match := POSITION_RE.match(line):
                if current_family == BASE_FAMILY:
                    positions.append(int(match.group(1)))

    return positions


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("semantics_json", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    positions = read_positions(args.semantics_json)
    if len(positions) != EXPECTED_COUNT:
        raise SystemExit(
            f"expected {EXPECTED_COUNT} base positions, got {len(positions)}"
        )
    if positions[0] != EXPECTED_FIRST or positions[-1] != EXPECTED_LAST:
        raise SystemExit(
            f"unexpected range {positions[0]}..{positions[-1]}"
        )
    if any(left >= right for left, right in zip(positions, positions[1:])):
        raise SystemExit("base source positions are not strictly increasing")

    previous = 0
    encoded = bytearray()
    for position in positions:
        encoded.extend(encode_varuint(position - previous))
        previous = position

    digest = hashlib.sha256(encoded).hexdigest()
    if digest != EXPECTED_SHA256:
        raise SystemExit(f"unexpected decoded payload sha256 {digest}")

    envelope = base64.a85encode(bytes(encoded), adobe=False, wrapcol=0)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(envelope)

    print(f"positions={len(positions)}")
    print(f"range={positions[0]}..{positions[-1]}")
    print(f"decoded_bytes={len(encoded)}")
    print(f"ascii85_bytes={len(envelope)}")
    print(f"decoded_sha256={digest}")


if __name__ == "__main__":
    main()
