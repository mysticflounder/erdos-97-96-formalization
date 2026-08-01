#!/usr/bin/env python3
"""Build the retained G3 V6 U5 common-bisector ordinal payload."""

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

FAMILY = "v6-u5-common-bisector-triple-incompatibilities"
ROUTE = "common"
SOURCE_START = 1_141_399
SOURCE_END = 1_180_698
EXPECTED_COUNT = 36
EXPECTED_FIRST = 1_969
EXPECTED_LAST = 38_222
EXPECTED_SHA256 = (
    "826050f9febf369eea6e117def5f5dc376518f2022e3a1804ffd9f4379800245"
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
                            "V6 U5 common-bisector position outside source block: "
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
            f"expected {EXPECTED_COUNT} V6 U5 common-bisector ordinals, "
            f"got {len(ordinals)}"
        )
    if EXPECTED_FIRST and ordinals[0] != EXPECTED_FIRST:
        raise SystemExit(f"unexpected first ordinal {ordinals[0]}")
    if EXPECTED_LAST and ordinals[-1] != EXPECTED_LAST:
        raise SystemExit(f"unexpected last ordinal {ordinals[-1]}")
    if any(left >= right for left, right in zip(ordinals, ordinals[1:])):
        raise SystemExit("V6 U5 common-bisector ordinals are not increasing")

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
        f"{len(encoded)} decoded bytes, sha256 {digest}"
    )


if __name__ == "__main__":
    main()
