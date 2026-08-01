#!/usr/bin/env python3
"""Build the retained G3 convex-five source-family ordinal payload."""

from __future__ import annotations

import argparse
import base64
import hashlib
import re
from pathlib import Path


CORE_RE = re.compile(r'^\s*"core_clause_index_1based":\s*(\d+),\s*$')
FAMILY_RE = re.compile(r'^\s*"family":\s*"([^"]+)",\s*$')
POSITION_RE = re.compile(r'^\s*"original_position":\s*(\d+),\s*$')
ROUTE_RE = re.compile(r'^\s*"route":\s*"([^"]+)"\s*$')

FAMILY = "convex-five-point-core-forward-exclusions"
ROUTE = "common"
SOURCE_START = 594_499
SOURCE_END = 927_138
EXPECTED_COUNT = 8_397
EXPECTED_FIRST = 2_359
EXPECTED_LAST = 328_006
EXPECTED_SHA256 = "79d3d2821c8206858dae1dacc7e8842d7219b9a82ba35803ac0ef5f84fbb1dff"


def encode_varuint(value: int) -> bytes:
    if value <= 0:
        raise ValueError(f"delta must be positive, got {value}")
    out = bytearray()
    while value >= 128:
        out.append((value & 0x7F) | 0x80)
        value >>= 7
    out.append(value)
    return bytes(out)


def read_ordinals(path: Path) -> list[int]:
    ordinals: list[int] = []
    current_family: str | None = None
    current_position: int | None = None
    in_entries = False

    with path.open(encoding="utf-8") as source:
        for line in source:
            if not in_entries:
                if line == '  "entries": [\n':
                    in_entries = True
                continue
            if CORE_RE.match(line):
                current_family = None
                current_position = None
                continue
            if match := FAMILY_RE.match(line):
                current_family = match.group(1)
                continue
            if match := POSITION_RE.match(line):
                current_position = int(match.group(1))
                continue
            if match := ROUTE_RE.match(line):
                if (
                    current_family == FAMILY
                    and current_position is not None
                    and match.group(1) == ROUTE
                ):
                    if not SOURCE_START <= current_position <= SOURCE_END:
                        raise SystemExit(
                            "convex-five position outside source block: "
                            f"{current_position}"
                        )
                    ordinals.append(current_position - SOURCE_START + 1)
    return ordinals


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("semantics_json", type=Path)
    parser.add_argument("output", type=Path)
    args = parser.parse_args()

    ordinals = read_ordinals(args.semantics_json)
    if len(ordinals) != EXPECTED_COUNT:
        raise SystemExit(
            f"expected {EXPECTED_COUNT} convex-five ordinals, "
            f"got {len(ordinals)}"
        )
    if EXPECTED_FIRST and ordinals[0] != EXPECTED_FIRST:
        raise SystemExit(f"unexpected first ordinal {ordinals[0]}")
    if EXPECTED_LAST and ordinals[-1] != EXPECTED_LAST:
        raise SystemExit(f"unexpected last ordinal {ordinals[-1]}")
    if any(left >= right for left, right in zip(ordinals, ordinals[1:])):
        raise SystemExit("convex-five ordinals are not increasing")

    previous = 0
    encoded = bytearray()
    for ordinal in ordinals:
        encoded.extend(encode_varuint(ordinal - previous))
        previous = ordinal

    digest = hashlib.sha256(encoded).hexdigest()
    if EXPECTED_SHA256 and digest != EXPECTED_SHA256:
        raise SystemExit(f"unexpected decoded payload sha256 {digest}")
    envelope = base64.a85encode(bytes(encoded), adobe=False, wrapcol=0)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(envelope)
    print(
        f"wrote {len(ordinals)} ordinals "
        f"({ordinals[0]}..{ordinals[-1]}), "
        f"{len(encoded)} decoded bytes, {len(envelope)} ascii85 bytes, "
        f"sha256={digest}"
    )


if __name__ == "__main__":
    main()
