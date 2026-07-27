#!/usr/bin/env python3
"""Audit manifest-selected base/retained assertions by source constructor.

This is a fail-closed discovery aid for the semantic ingress generator.  It
rebuilds the exact source stream and its traced assertion origins, validates
the pinned complete manifest, and groups only the selected assertions in the
two blocks owned by this lane.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
from collections import defaultdict
from pathlib import Path
import sys


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
AUDIT_DIR = HERE.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT_DIR))

from distinct_source_terms import ORBIT_SPECS, resolve_orbit  # noqa: E402


def load_audit_module():
    path = AUDIT_DIR / "audit_source_surface.py"
    spec = importlib.util.spec_from_file_location("distinct_source_audit", path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest()


def orbit_packet(payload: dict[str, object], source_orbit: str) -> dict[str, object]:
    packet = payload.get("orbit")
    if isinstance(packet, dict) and packet.get("orbit") == source_orbit:
        return packet
    packets = payload.get("orbits")
    if isinstance(packets, list):
        matches = [item for item in packets if isinstance(item, dict)
                   and item.get("orbit") == source_orbit]
        if len(matches) == 1:
            return matches[0]
    raise ValueError("manifest/source orbit mismatch")


def selected_indices(payload: dict[str, object]) -> list[int]:
    selected: set[int] = set()
    leaves = payload.get("leaves")
    if not isinstance(leaves, list) or len(leaves) != 512:
        raise ValueError("manifest must contain the complete 512-leaf cover")
    for leaf in leaves:
        if not isinstance(leaf, dict):
            raise ValueError("malformed leaf")
        core = leaf.get("best_checked_core")
        if not isinstance(core, dict):
            raise ValueError("every leaf must contain a best checked core")
        indices = core.get("source_assertion_indices")
        if not isinstance(indices, list) or not indices:
            raise ValueError("every leaf must contain a nonempty source core")
        selected.update(int(index) for index in indices)
    return sorted(selected)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=sorted(ORBIT_SPECS), required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--manifest-sha256", required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    actual_manifest_sha = sha256(args.manifest)
    if actual_manifest_sha != args.manifest_sha256:
        raise AssertionError(
            f"manifest SHA drift: {actual_manifest_sha} != {args.manifest_sha256}"
        )
    short, spec = resolve_orbit(args.orientation)
    payload = json.loads(args.manifest.read_text(encoding="utf-8"))
    packet = orbit_packet(payload, str(spec["source_orbit"]))

    audit = load_audit_module()
    _outer, _ranks, counts, assertions, origins = audit.traced_surface(
        spec["source_orbit"]
    )
    if len(assertions) != 58_433 or len(origins) != len(assertions):
        raise AssertionError("source stream/origin count drift")

    selected = selected_indices(packet)
    for index in selected:
        if not 0 <= index < len(assertions):
            raise ValueError(f"source assertion index out of range: {index}")

    groups: dict[tuple[str, str, str, int, str], list[int]] = defaultdict(list)
    for index in selected:
        if not 2 <= index < 40_210:
            continue
        path, function, line = origins[index]
        block = (
            "base_parent_global_cover" if index < 37_363
            else "retained_distinct_role"
        )
        source = audit.source_line(path, line)
        key = (block, audit.relative(path), function, int(line), source)
        groups[key].append(index)

    output_groups = []
    for (block, path, function, line, source), indices in sorted(
        groups.items(), key=lambda item: min(item[1])
    ):
        first = min(indices)
        output_groups.append({
            "block": block,
            "path": path,
            "function": function,
            "line": line,
            "source": source,
            "selected_count": len(indices),
            "first_index": first,
            "last_index": max(indices),
            "first_sexpr": assertions[first].sexpr(),
            "indices": indices,
        })

    result = {
        "schema": "p97-exact5-card13-distinct-selected-ingress-origin-audit-v1",
        "orientation": short,
        "source_orbit": spec["source_orbit"],
        "manifest": str(args.manifest),
        "manifest_sha256": actual_manifest_sha,
        "selected_union_count": len(selected),
        "owned_selected_count": sum(len(group[1]) for group in groups.items()),
        "source_counts": counts,
        "groups": output_groups,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({
        "orientation": short,
        "selected_union_count": len(selected),
        "owned_selected_count": result["owned_selected_count"],
        "origin_groups": len(output_groups),
        "output": str(args.output),
    }, sort_keys=True))


if __name__ == "__main__":
    main()
