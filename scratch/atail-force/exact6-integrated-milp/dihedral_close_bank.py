#!/usr/bin/env python3
"""Close an exact Kalmanson cut bank under the D14 boundary action."""

from __future__ import annotations

import argparse
import hashlib
import json
from collections import defaultdict
from pathlib import Path

from exact_cegar import vector, verify_exact_cut


N = 14


def record_sha256(record: dict[str, object]) -> str:
    return hashlib.sha256(
        json.dumps(record, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()


def vertex_map(sign: int, shift: int, vertex: int) -> int:
    return (sign * vertex + shift) % N


def transformed_vector(name: str, sign: int, shift: int):
    result = defaultdict(int)
    for (left, right), coefficient in vector(name).items():
        mapped = tuple(sorted((
            vertex_map(sign, shift, left),
            vertex_map(sign, shift, right),
        )))
        result[mapped] += coefficient
    return {term: value for term, value in result.items() if value}


def transform_name(name: str, sign: int, shift: int) -> str:
    parts = name.split("_")
    target = transformed_vector(name, sign, shift)
    if parts[0] in {"kal1", "kal2"}:
        mapped = sorted(vertex_map(sign, shift, int(item)) for item in parts[1:])
        for kind in ("kal1", "kal2"):
            candidate = f"{kind}_{'_'.join(map(str, mapped))}"
            if vector(candidate) == target:
                return candidate
        raise ValueError(f"dihedral Kalmanson image is not canonical: {name}")
    if parts[0] in {"row", "shell"}:
        center, reference, point = (
            vertex_map(sign, shift, int(item)) for item in parts[1:]
        )
        candidate = f"{parts[0]}_{center}_{reference}_{point}"
        if vector(candidate) != target:
            raise ValueError(f"row/shell vector transport failed: {name}")
        return candidate
    if parts[0] in {"nonneg", "positive"}:
        left, right = sorted(vertex_map(sign, shift, int(item)) for item in parts[1:])
        candidate = f"{parts[0]}_{left}_{right}"
        if vector(candidate) != target:
            raise ValueError(f"distance-bound vector transport failed: {name}")
        return candidate
    raise ValueError(name)


def semantic_key(record: dict[str, object]):
    memberships = tuple(sorted(tuple(item) for item in record["required_memberships"]))
    shell = record.get("conditioned_shell")
    return memberships, None if shell is None else tuple(shell)


def transform(record: dict[str, object], sign: int, shift: int) -> dict[str, object]:
    shell = record.get("conditioned_shell")
    mapped_shell = (
        None
        if shell is None
        else sorted(vertex_map(sign, shift, int(point)) for point in shell)
    )
    mapped = {
        **record,
        "constraints": [
            {
                "name": transform_name(item["name"], sign, shift),
                "multiplier": item["multiplier"],
            }
            for item in record["constraints"]
        ],
        "required_memberships": sorted([
            [
                vertex_map(sign, shift, int(center)),
                vertex_map(sign, shift, int(point)),
            ]
            for center, point in record["required_memberships"]
        ]),
        "conditioned_shell": mapped_shell,
    }
    mapped.pop("provenance", None)
    verify_exact_cut(mapped)
    return mapped


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    parser.add_argument("--manifest", required=True, type=Path)
    args = parser.parse_args()
    if args.output.exists() or args.manifest.exists():
        raise SystemExit("refusing to overwrite D14 artifacts")
    source = [
        json.loads(line)
        for line in args.input.read_text(encoding="utf-8").splitlines()
        if line
    ]
    unique: dict[object, dict[str, object]] = {}
    provenance: dict[object, list[dict[str, object]]] = defaultdict(list)
    generated = 0
    shell_conditioned = 0
    for record in source:
        verify_exact_cut(record)
        transforms = [
            (sign, shift)
            for sign in (1, -1)
            for shift in range(N)
            if record.get("conditioned_shell") is None
            or vertex_map(sign, shift, 9) == 9
        ]
        if record.get("conditioned_shell") is not None:
            shell_conditioned += 1
        for sign, shift in transforms:
            mapped = transform(record, sign, shift)
            generated += 1
            key = semantic_key(mapped)
            unique.setdefault(key, mapped)
            provenance[key].append({
                "source_cut_id": record["id"],
                "source_record_sha256": record_sha256(record),
                "dihedral_sign": sign,
                "dihedral_shift": shift,
            })

    with args.output.open("x", encoding="utf-8") as handle:
        for index, key in enumerate(sorted(unique, key=str), start=1):
            record = {
                **unique[key],
                "id": f"global-d14-cut-{index:06d}",
                "transport_provenance": provenance[key],
            }
            verify_exact_cut(record)
            handle.write(json.dumps(record, sort_keys=True) + "\n")
    manifest = {
        "schema": "p97-exact6-integrated-d14-cut-bank-manifest-v1",
        "epistemic_status": "EXACT_DIHEDRAL_VECTOR_TRANSPORT_NOT_LIVE_LEAN_CLOSURE",
        "input": str(args.input),
        "input_sha256": hashlib.sha256(args.input.read_bytes()).hexdigest(),
        "input_cut_count": len(source),
        "input_shell_conditioned_count": shell_conditioned,
        "generated_transport_count": generated,
        "unique_transport_count": len(unique),
        "duplicate_transport_count": generated - len(unique),
        "output": str(args.output),
        "output_sha256": hashlib.sha256(args.output.read_bytes()).hexdigest(),
    }
    args.manifest.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    print(json.dumps(manifest, sort_keys=True))


if __name__ == "__main__":
    main()
