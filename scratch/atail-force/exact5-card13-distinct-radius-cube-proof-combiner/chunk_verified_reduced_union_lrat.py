#!/usr/bin/env python3
"""Split one checked reduced-union LRAT at record boundaries.

Every part is bounded below the GitHub per-file limit.  The manifest records
the whole-file and part hashes and rejects any reassembly drift.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path


DEFAULT_MAX_BYTES = 48 * 1024 * 1024


def title(orientation: str) -> str:
    return orientation[0].upper() + orientation[1:]


def render_certificate(orientation: str, parts: list[dict[str, int | str]]) -> str:
    orientation_title = title(orientation)
    prefix = "VerifiedDistinctReducedUnion" + orientation_title
    namespace = (
        "Problem97.ATailExactFiveDistinctReducedUnionVerified" + orientation_title
    )
    includes = ",\n      ".join(
        f'include_str "certificates/{part["path"]}"' for part in parts
    )
    return f'''import {prefix}.Coordinator
import Std.Tactic.BVDecide.Reflect

open Std.Sat

namespace {namespace}

open Std.Tactic.BVDecide

set_option maxRecDepth 1000000
set_option maxHeartbeats 0

def reducedUnionLrat : String :=
  String.join
    [ {includes} ]

theorem reducedUnionCnf_unsat : reducedUnionCnf.Unsat := by
  apply Reflect.verifyCert_correct reducedUnionCnf reducedUnionLrat
  native_decide

theorem reducedUnionExpr_unsat : reducedUnionExpr.Unsat := by
  have hbitblast : reducedUnionExpr.bitblast.Unsat := by
    rw [← AIG.Entrypoint.relabelNat_unsat_iff]
    exact
      (AIG.toCNF_equisat reducedUnionExpr.bitblast.relabelNat).mp
        reducedUnionCnf_unsat
  exact BVLogicalExpr.unsat_of_bitblast reducedUnionExpr hbitblast

#print axioms reducedUnionCnf_unsat
#print axioms reducedUnionExpr_unsat

end {namespace}
'''


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def write_part(path: Path, data: bytes) -> dict[str, int | str]:
    temporary = path.with_name(path.name + ".tmp")
    temporary.write_bytes(data)
    os.replace(temporary, path)
    return {
        "path": path.name,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--input-lrat", type=Path, required=True)
    parser.add_argument("--expected-sha256", required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--output-manifest", type=Path, required=True)
    parser.add_argument("--max-bytes", type=int, default=DEFAULT_MAX_BYTES)
    args = parser.parse_args()
    if args.max_bytes < 1:
        raise ValueError("max bytes must be positive")
    actual_input_hash = sha256(args.input_lrat)
    if actual_input_hash != args.expected_sha256.lower():
        raise ValueError(
            f"input LRAT hash drift: expected {args.expected_sha256}, "
            f"got {actual_input_hash}"
        )

    args.output_dir.mkdir(parents=True, exist_ok=True)
    parts: list[dict[str, int | str]] = []
    buffer = bytearray()
    with args.input_lrat.open("rb") as source:
        for line_number, line in enumerate(source, start=1):
            if not line.endswith(b"\n"):
                raise ValueError(f"line {line_number} is not newline terminated")
            if len(line) > args.max_bytes:
                raise ValueError(f"line {line_number} exceeds the part-size bound")
            if buffer and len(buffer) + len(line) > args.max_bytes:
                part_path = args.output_dir / f"part-{len(parts):03d}.lrat.txt"
                parts.append(write_part(part_path, bytes(buffer)))
                buffer.clear()
            buffer.extend(line)
    if buffer:
        part_path = args.output_dir / f"part-{len(parts):03d}.lrat.txt"
        parts.append(write_part(part_path, bytes(buffer)))
    if not parts:
        raise ValueError("input LRAT is empty")

    expected_names = {str(part["path"]) for part in parts}
    stale = sorted(
        path.name
        for path in args.output_dir.glob("part-*.lrat.txt")
        if path.name not in expected_names
    )
    if stale:
        raise ValueError(f"stale part files must be removed explicitly: {stale}")

    digest = hashlib.sha256()
    reassembled_bytes = 0
    for part in parts:
        path = args.output_dir / str(part["path"])
        if path.stat().st_size != part["bytes"] or sha256(path) != part["sha256"]:
            raise ValueError(f"part drift after write: {path}")
        with path.open("rb") as stream:
            while block := stream.read(1024 * 1024):
                digest.update(block)
                reassembled_bytes += len(block)
    if reassembled_bytes != args.input_lrat.stat().st_size:
        raise ValueError("reassembled byte count does not match input")
    if digest.hexdigest() != actual_input_hash:
        raise ValueError("reassembled hash does not match input")

    certificate_path = args.output_dir.parent / "Certificate.lean"
    certificate_temporary = certificate_path.with_name(certificate_path.name + ".tmp")
    certificate_temporary.write_text(
        render_certificate(args.orientation, parts), encoding="utf-8"
    )
    os.replace(certificate_temporary, certificate_path)

    payload = {
        "schema": "p97-exact5-distinct-reduced-union-chunked-lrat-v1",
        "epistemic_status": "BYTE_EXACT_SPLIT_OF_KERNEL_CHECKED_LRAT",
        "orientation": args.orientation,
        "max_part_bytes": args.max_bytes,
        "whole": {
            "path": args.input_lrat.name,
            "bytes": reassembled_bytes,
            "sha256": actual_input_hash,
        },
        "parts": parts,
        "certificate_module": {
            "path": os.path.relpath(certificate_path, args.output_dir),
            "bytes": certificate_path.stat().st_size,
            "sha256": sha256(certificate_path),
        },
    }
    args.output_manifest.parent.mkdir(parents=True, exist_ok=True)
    temporary = args.output_manifest.with_name(args.output_manifest.name + ".tmp")
    temporary.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    os.replace(temporary, args.output_manifest)
    print(json.dumps(payload, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
