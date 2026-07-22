#!/usr/bin/env python3
"""Split the verified all-one LRAT slices at newline boundaries."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
from typing import Any


SCHEMA = "p97-exact5-card13-all-one-chunked-lrat-v1"
DEFAULT_MAX_BYTES = 48 * 1024 * 1024


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def write_chunk(path: Path, data: bytes) -> dict[str, int | str]:
    temporary = path.with_name(path.name + ".tmp")
    digest = hashlib.sha256(data).hexdigest()
    with temporary.open("wb") as target:
        target.write(data)
        target.flush()
        os.fsync(target.fileno())
    os.replace(temporary, path)
    return {"path": path.name, "bytes": len(data), "sha256": digest}


def chunk_stream(input_path: Path, output_dir: Path, max_bytes: int) -> list[dict[str, Any]]:
    output_dir.mkdir(parents=True, exist_ok=True)
    parts: list[dict[str, Any]] = []
    buffer = bytearray()
    with input_path.open("rb") as source:
        for line_number, line in enumerate(source, start=1):
            if not line.endswith(b"\n"):
                raise ValueError(
                    f"{input_path}:{line_number}: LRAT record is not newline terminated"
                )
            if len(line) > max_bytes:
                raise ValueError(
                    f"{input_path}:{line_number}: one LRAT record exceeds the chunk limit"
                )
            if buffer and len(buffer) + len(line) > max_bytes:
                part_path = output_dir / f"part-{len(parts):03d}.lrat.txt"
                parts.append(write_chunk(part_path, bytes(buffer)))
                buffer.clear()
            buffer.extend(line)
    if buffer:
        part_path = output_dir / f"part-{len(parts):03d}.lrat.txt"
        parts.append(write_chunk(part_path, bytes(buffer)))
    if not parts:
        raise ValueError(f"{input_path}: empty LRAT input")
    expected_names = {part["path"] for part in parts}
    unexpected = {
        path.name for path in output_dir.glob("part-*.lrat.txt")
        if path.name not in expected_names
    }
    if unexpected:
        raise ValueError(
            f"{output_dir}: stale chunk files must be removed explicitly: {sorted(unexpected)}"
        )
    return parts


def reassembly_hash(output_dir: Path, parts: list[dict[str, Any]]) -> tuple[int, str]:
    digest = hashlib.sha256()
    total = 0
    for part in parts:
        path = output_dir / str(part["path"])
        actual_hash = sha256(path)
        if actual_hash != part["sha256"]:
            raise ValueError(f"{path}: chunk hash drift after write")
        actual_bytes = path.stat().st_size
        if actual_bytes != part["bytes"]:
            raise ValueError(f"{path}: chunk size drift after write")
        with path.open("rb") as stream:
            while block := stream.read(1024 * 1024):
                digest.update(block)
                total += len(block)
    return total, digest.hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--slice-manifest",
        type=Path,
        default=Path(__file__).with_name("lrat-slice-manifest.json"),
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path(__file__).with_name("certificates"),
    )
    parser.add_argument("--output-manifest", type=Path)
    parser.add_argument("--max-bytes", type=int, default=DEFAULT_MAX_BYTES)
    args = parser.parse_args()
    if args.max_bytes <= 0:
        raise ValueError("--max-bytes must be positive")
    if not args.slice_manifest.is_file():
        raise FileNotFoundError(args.slice_manifest)

    ingress_dir = args.slice_manifest.parent
    payload = json.loads(args.slice_manifest.read_text(encoding="utf-8"))
    output_manifest = args.output_manifest or args.output_dir / "manifest.json"
    result: dict[str, Any] = {
        "schema": SCHEMA,
        "max_part_bytes": args.max_bytes,
        "slice_manifest": os.path.relpath(args.slice_manifest, ingress_dir),
        "slice_manifest_sha256": sha256(args.slice_manifest),
        "orbits": {},
    }
    for orbit in ("left", "middle", "right"):
        slice_info = payload["orbits"][orbit]["sliced_lrat"]
        input_path = ingress_dir / slice_info["path"]
        expected_hash = slice_info["sha256"]
        expected_bytes = int(slice_info["bytes"])
        if not input_path.is_file():
            raise FileNotFoundError(input_path)
        actual_hash = sha256(input_path)
        if actual_hash != expected_hash:
            raise ValueError(
                f"{input_path}: expected SHA-256 {expected_hash}, got {actual_hash}"
            )
        if input_path.stat().st_size != expected_bytes:
            raise ValueError(f"{input_path}: input size drift")

        orbit_dir = args.output_dir / orbit
        parts = chunk_stream(input_path, orbit_dir, args.max_bytes)
        reassembled_bytes, reassembled_hash = reassembly_hash(orbit_dir, parts)
        if reassembled_bytes != expected_bytes or reassembled_hash != expected_hash:
            raise ValueError(f"{orbit}: chunk reassembly does not match the sliced LRAT")
        orbit_result = {
            "input_path": str(slice_info["path"]),
            "whole_bytes": reassembled_bytes,
            "whole_sha256": reassembled_hash,
            "parts": parts,
        }
        orbit_title = orbit.capitalize()
        generated_module = orbit_dir / f"AllOne{orbit_title}Verified.lean"
        generated_map = orbit_dir / f"{orbit}.verified.map.json"
        if generated_module.is_file() and generated_map.is_file():
            orbit_result["generated_module"] = {
                "path": generated_module.name,
                "bytes": generated_module.stat().st_size,
                "sha256": sha256(generated_module),
            }
            orbit_result["generated_map"] = {
                "path": generated_map.name,
                "bytes": generated_map.stat().st_size,
                "sha256": sha256(generated_map),
            }
        result["orbits"][orbit] = orbit_result

    output_manifest.parent.mkdir(parents=True, exist_ok=True)
    temporary = output_manifest.with_name(output_manifest.name + ".tmp")
    temporary.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    os.replace(temporary, output_manifest)
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
