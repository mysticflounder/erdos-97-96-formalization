#!/usr/bin/env python3
"""Build authenticated source-ordinal ledgers for the retained s2_o0 core.

The compact RUP replay only proves contradiction from its 81,253 initial
clauses.  This generator records, family by family and in exact core order,
which source occurrences those clauses came from.  Each payload is the raw
ASCII85 encoding of canonical positive LEB128 deltas between one-based local
family ordinals.  The manifest authenticates the frozen CNF, source manifest,
core-to-source map, and every generated payload.

This is proof input, not a proof: Lean must decode the payloads, render the
corresponding semantic occurrences, and authenticate the rendered clause bank
against the compact replay checkpoint.
"""

from __future__ import annotations

import argparse
import base64
import hashlib
import json
from collections import defaultdict
from pathlib import Path
from typing import Any


ROOT = Path(__file__).resolve().parents[2]
DEFAULT_S2 = ROOT / "scratch/card11-exact5-common-fullradius-v7/runs/s2_o0"
DEFAULT_INGRESS = (
    ROOT / "scratch/card11-exact5-common-fullradius-v7-ingress/s2_o0-ingress"
)
DEFAULT_OUTPUT = Path(__file__).with_name("s2-o0-family-ledgers")
EXPECTED_CORE_COUNT = 81_253


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def sha256_bytes(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def family_blocks(manifest: dict[str, Any]) -> list[tuple[int, int, str]]:
    return [
        (1, 207_969, "inherited-census554-base"),
        (207_970, 387_856, "inherited-separation"),
        (387_857, 414_047, "inherited-source-tail"),
        *[
            (
                int(block["first_clause_1based"]),
                int(block["last_clause_1based"]),
                str(block["name"]),
            )
            for block in manifest["clause_blocks"]
        ],
    ]


def encode_positive_varuint(value: int) -> bytes:
    if value <= 0:
        raise ValueError(f"delta must be positive, got {value}")
    output = bytearray()
    while value >= 128:
        output.append((value & 0x7F) | 0x80)
        value >>= 7
    output.append(value)
    return bytes(output)


def encode_positions(positions: list[int]) -> bytes:
    if any(left >= right for left, right in zip(positions, positions[1:])):
        raise ValueError("positions are not strictly increasing")
    previous = 0
    encoded = bytearray()
    for position in positions:
        encoded.extend(encode_positive_varuint(position - previous))
        previous = position
    return bytes(encoded)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--s2-dir", type=Path, default=DEFAULT_S2)
    parser.add_argument("--ingress-dir", type=Path, default=DEFAULT_INGRESS)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    args = parser.parse_args()

    source_manifest_path = args.s2_dir / "manifest.json"
    core_path = args.ingress_dir / "core.cnf"
    map_path = args.ingress_dir / "core-to-input-clause-id.json"
    source_manifest = json.loads(source_manifest_path.read_text())
    core_to_source = [int(value) for value in json.loads(map_path.read_text())]

    if len(core_to_source) != EXPECTED_CORE_COUNT:
        raise ValueError(
            f"expected {EXPECTED_CORE_COUNT} retained clauses, "
            f"got {len(core_to_source)}"
        )
    if any(left >= right for left, right in zip(core_to_source, core_to_source[1:])):
        raise ValueError("core-to-source map is not strictly increasing")

    blocks = family_blocks(source_manifest)
    rows: dict[str, list[tuple[int, int, int]]] = defaultdict(list)
    block_index = 0
    for core_index, source_id in enumerate(core_to_source, start=1):
        while block_index < len(blocks) and blocks[block_index][1] < source_id:
            block_index += 1
        if block_index == len(blocks):
            raise ValueError(f"source clause {source_id} exceeds all family blocks")
        first, last, family = blocks[block_index]
        if not first <= source_id <= last:
            raise ValueError(f"source clause {source_id} lies in a family gap")
        local_ordinal_1based = source_id - first + 1
        rows[family].append((core_index, source_id, local_ordinal_1based))

    args.output_dir.mkdir(parents=True, exist_ok=True)
    family_entries: list[dict[str, Any]] = []
    reconstructed: list[int] = []
    for first, last, family in blocks:
        family_rows = rows.get(family, [])
        if not family_rows:
            continue
        core_indices = [row[0] for row in family_rows]
        source_ids = [row[1] for row in family_rows]
        ordinals = [row[2] for row in family_rows]
        if core_indices != list(range(core_indices[0], core_indices[-1] + 1)):
            raise ValueError(f"family {family} is not contiguous in core order")
        reconstructed.extend(source_ids)

        decoded = encode_positions(ordinals)
        envelope = base64.a85encode(decoded, adobe=False, wrapcol=0)
        payload_path = args.output_dir / f"{family}-ordinals.a85"
        payload_path.write_bytes(envelope)
        family_entries.append(
            {
                "family": family,
                "source_block_first_1based": first,
                "source_block_last_1based": last,
                "source_block_size": last - first + 1,
                "retained_count": len(family_rows),
                "core_first_1based": core_indices[0],
                "core_last_1based": core_indices[-1],
                "source_first_1based": source_ids[0],
                "source_last_1based": source_ids[-1],
                "local_ordinal_first_1based": ordinals[0],
                "local_ordinal_last_1based": ordinals[-1],
                "payload": payload_path.name,
                "decoded_bytes": len(decoded),
                "decoded_sha256": sha256_bytes(decoded),
                "ascii85_bytes": len(envelope),
                "ascii85_sha256": sha256_bytes(envelope),
            }
        )

    if reconstructed != core_to_source:
        raise ValueError("family concatenation does not reconstruct exact core order")

    manifest = {
        "schema": "card11-exact5-common-fullradius-v7-s2-o0-family-ledgers-v1",
        "claim_scope": (
            "Authenticated retained source ordinals only; Lean must prove the "
            "semantic occurrence theorem and checkpoint clause permutation."
        ),
        "inputs": {
            str(path.relative_to(ROOT)): sha256(path)
            for path in (source_manifest_path, core_path, map_path)
        },
        "core_clause_count": len(core_to_source),
        "core_source_first_1based": core_to_source[0],
        "core_source_last_1based": core_to_source[-1],
        "core_source_ids_strictly_increasing": True,
        "families_concatenate_to_exact_core_order": True,
        "families": family_entries,
    }
    manifest_path = args.output_dir / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")

    print(manifest_path)
    print(f"families={len(family_entries)}")
    print(f"retained_clauses={sum(row['retained_count'] for row in family_entries)}")
    print(f"payload_bytes={sum(row['ascii85_bytes'] for row in family_entries)}")


if __name__ == "__main__":
    main()
