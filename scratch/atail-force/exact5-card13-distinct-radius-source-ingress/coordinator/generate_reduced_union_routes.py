#!/usr/bin/env python3
"""Route one pinned best-core union to exact Lean source producers.

The direct and mirror source streams are deliberately separate inputs.  This
program never transports indices or expressions between them.  It validates
the complete-cover manifest, rebuilds the requested live source stream, and
then emits a machine-readable producer plan.  When requested, it also emits
the subset of Lean assertions already discharged by existing exact packets.

The manifest path and SHA-256 are command-line inputs so a smaller minimized
union can replace the current complete union without changing this program.
"""

from __future__ import annotations

import argparse
from collections import Counter
import gzip
import hashlib
import json
from pathlib import Path
import re
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
AUDIT = HERE.parent.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT))

from distinct_source_terms import (  # noqa: E402
    EXPECTED_ASSERTIONS,
    build_source_assertions,
    source_stream_sha256,
)


ORBIT = {
    "direct": {
        "source_orbit": "asymmetricSourceLeft",
        "source_stream_sha256": (
            "a1014dbfbae06dda92263461cfaf50cd14d96a4a645b7569790504b5f1a5dab0"
        ),
        "cover_source_sha256": (
            "cf71dc4d0cf46e050fbbce43dce4a02c583989d5a4cf7533442e6c26afa8aec3"
        ),
        "lean_prefix": "Direct",
    },
    "mirror": {
        "source_orbit": "asymmetricSourceRight",
        "source_stream_sha256": (
            "1d60fb308d08c1f3aa5f80ea6685d4440f741dfe0e60eec5f49bcdc804c6c663"
        ),
        "cover_source_sha256": (
            "12c1f105e80a0094169b518b25e636ddbb263f657bb890929ed454ab28d38389"
        ),
        "lean_prefix": "Mirror",
    },
}

CHECKED_CORE_STATUSES = {
    "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE",
    "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE",
    "DRAT_VERIFIED_AND_SOURCE_Z3_RECHECKED_CORE",
}


BLOCKS = (
    (0, 37_363, "base_parent_global_cover"),
    (37_363, 40_210, "retained_distinct_role"),
    (40_210, 40_224, "distinct_parent_coupling"),
    (40_224, 41_316, "connectivity"),
    (41_316, 41_394, "rank_bounds"),
    (41_394, 44_232, "guarded_selected_row_equalities"),
    (44_232, 45_288, "complete_class_inequalities"),
    (45_288, 45_783, "unique_k4_second"),
    (45_783, 46_278, "unique_k4_first"),
    (46_278, 52_713, "unique_k4_critical"),
    (52_713, 58_433, "kalmanson_cancellation"),
)


def sha256_file(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def read_manifest_payload(path: Path) -> dict[str, Any]:
    if path.suffix == ".gz":
        with gzip.open(path, "rt", encoding="utf-8") as handle:
            payload = json.load(handle)
    else:
        payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError("manifest payload is not an object")
    return payload


def selected_stream_sha256(
    assertions: list[z3.BoolRef], indices: list[int]
) -> str:
    digest = hashlib.sha256()
    for index in indices:
        digest.update(f"{index}\0".encode())
        digest.update(assertions[index].sexpr().encode())
        digest.update(b"\n")
    return digest.hexdigest()


def block_of(index: int) -> str:
    for start, end, name in BLOCKS:
        if start <= index < end:
            return name
    raise AssertionError(f"unpartitioned source assertion h{index}")


def load_union_manifest(
    path: Path, expected_sha256: str, short_orbit: str
) -> tuple[dict[str, Any], list[int]]:
    actual_sha256 = sha256_file(path)
    if actual_sha256 != expected_sha256:
        raise AssertionError(
            f"manifest SHA-256 drift: {actual_sha256} != {expected_sha256}"
        )
    payload = read_manifest_payload(path)
    if "orbits" in payload:
        if payload.get("epistemic_status") != (
            "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES"
        ):
            raise AssertionError("aggregate best-core manifest is not complete")
        packets = payload.get("orbits")
        if not isinstance(packets, list):
            raise ValueError("aggregate manifest has no list-valued orbits")
        source_orbit = ORBIT[short_orbit]["source_orbit"]
        matching = [packet for packet in packets if packet.get("orbit") == source_orbit]
        if len(matching) != 1:
            raise ValueError(
                f"aggregate manifest has {len(matching)} packets for {source_orbit}"
            )
        orbit = matching[0]
    else:
        orbit = payload.get("orbit")
    if not isinstance(orbit, dict):
        raise ValueError("manifest has no object-valued orbit packet")
    spec = ORBIT[short_orbit]
    if orbit.get("orbit") != spec["source_orbit"]:
        raise AssertionError("orientation mismatch in best-core manifest")
    if orbit.get("epistemic_status") != "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES":
        raise AssertionError("best-core manifest is not complete")
    if orbit.get("source_assertion_count") != EXPECTED_ASSERTIONS:
        raise AssertionError("best-core manifest source count drift")
    if orbit.get("source_assertions_sha256") != spec["cover_source_sha256"]:
        raise AssertionError("best-core manifest source hash drift")
    leaves = orbit.get("leaves")
    if not isinstance(leaves, list) or not leaves:
        raise ValueError("best-core manifest has no leaves")
    if orbit.get("leaf_count") != len(leaves):
        raise AssertionError("best-core manifest leaf count drift")
    if orbit.get("checked_core_count") != len(leaves):
        raise AssertionError("not every leaf has a checked core")

    union: set[int] = set()
    seen_leaves: set[int] = set()
    for packet in leaves:
        leaf = int(packet["leaf"])
        if leaf in seen_leaves:
            raise ValueError(f"duplicate leaf {leaf}")
        seen_leaves.add(leaf)
        core = packet.get("best_checked_core")
        if not isinstance(core, dict):
            raise ValueError(f"leaf {leaf} has no best checked core")
        if core.get("epistemic_status") not in CHECKED_CORE_STATUSES:
            raise AssertionError(f"leaf {leaf} core is not checked")
        indices = core.get("source_assertion_indices")
        if not isinstance(indices, list) or not indices:
            raise ValueError(f"leaf {leaf} has an empty source core")
        normalized = [int(index) for index in indices]
        if len(normalized) != len(set(normalized)):
            raise ValueError(f"leaf {leaf} repeats a source assertion")
        if core.get("source_core_size") != len(normalized):
            raise AssertionError(f"leaf {leaf} source-core size drift")
        for index in normalized:
            if not 0 <= index < EXPECTED_ASSERTIONS:
                raise ValueError(f"leaf {leaf} source index out of range: {index}")
        union.update(normalized)
    return payload, sorted(union)


def route(index: int) -> dict[str, Any]:
    block = block_of(index)
    result: dict[str, Any] = {"index": index, "block": block}
    # The legacy `DirectSourceBaseAssertions` packet predates the current
    # full-source renumbering.  Only its first two fields are still the
    # current h00000/h00001 assertions; h00002 onward must use the current
    # source-indexed base ingress.
    if index < 2:
        result.update(
            status="exact_packet",
            template="DirectSourceBaseAssertions.projection",
            projection=f"base.h{index:04d}",
        )
    elif index < 40_210:
        result.update(
            status="template_pending",
            template=(
                "base_parent_global_cover.instance"
                if index < 37_363
                else "retained_distinct_role.instance"
            ),
        )
    elif index < 40_223:
        point = index - 40_210
        result.update(
            status="exact_adapter",
            template="directSource_parentFirst_eq_firstRow",
            point=point,
        )
    elif index == 40_223:
        result.update(
            status="exact_adapter",
            template="directSource_frontier_not_both_mem_shell",
        )
    elif index < 41_316:
        result.update(
            status="exact_packet",
            template="CanonicalConnectivityAssertions.projection",
            chunk=(index - 40_224) // 64,
        )
    elif index < 41_394:
        result.update(
            status="generic_template_ready",
            template="rankAtom_directSourceRanks_ult_seventyEight",
            rank=index - 41_316,
        )
    elif index < 44_232:
        if index < 43_968:
            template = "directSource_row_rank_guard"
        elif index < 44_034:
            template = "directSource_firstRow_rank_guard"
        elif index < 44_100:
            template = "directSource_shell_rank_guard"
        elif index < 44_166:
            template = "directSource_parentFirst_rank_guard"
        else:
            template = "directSource_parentSecond_rank_guard"
        result.update(status="generic_template_ready", template=template)
    elif index < 45_288:
        result.update(
            status="exact_packet",
            template="CanonicalCompleteClassAssertions.projection",
            chunk=(index - 44_232) // 64,
        )
    elif index < 52_713:
        result.update(
            status="exact_packet",
            template="CanonicalUniqueK4Assertions.projection",
            chunk=(index - 45_288) // 64,
        )
    else:
        result.update(
            status="generic_template_ready",
            template="directSource_kalmanson_rank_guard",
        )
    return result


def emit_route_report(
    output: Path,
    short_orbit: str,
    manifest: Path,
    manifest_sha256: str,
    assertions: list[z3.BoolRef],
    indices: list[int],
) -> dict[str, Any]:
    routes = [route(index) for index in indices]
    by_block = Counter(item["block"] for item in routes)
    by_status = Counter(item["status"] for item in routes)
    first_pending = next(
        (item for item in routes if item["status"] == "template_pending"), None
    )
    payload = {
        "schema": "p97-exact5-distinct-reduced-union-producer-routes-v1",
        "status": "PASS",
        "orientation": short_orbit,
        "source_orbit": ORBIT[short_orbit]["source_orbit"],
        "manifest": str(manifest),
        "manifest_sha256": manifest_sha256,
        "source_stream_sha256": source_stream_sha256(assertions),
        "selected_union_count": len(indices),
        "selected_union_sha256": selected_stream_sha256(assertions, indices),
        "counts_by_block": dict(sorted(by_block.items())),
        "counts_by_status": dict(sorted(by_status.items())),
        "first_pending": first_pending,
        "routes": routes,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    return payload


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=tuple(ORBIT), required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--manifest-sha256", required=True)
    parser.add_argument("--output-routes", type=Path, required=True)
    args = parser.parse_args()

    _payload, indices = load_union_manifest(
        args.manifest, args.manifest_sha256, args.orientation
    )
    assertions, _counts, _outer, _ranks = build_source_assertions(args.orientation)
    actual_stream = source_stream_sha256(assertions)
    expected_stream = ORBIT[args.orientation]["source_stream_sha256"]
    if actual_stream != expected_stream:
        raise AssertionError(
            f"{args.orientation} source stream drift: {actual_stream} != {expected_stream}"
        )
    report = emit_route_report(
        args.output_routes,
        args.orientation,
        args.manifest,
        args.manifest_sha256,
        assertions,
        indices,
    )
    print(json.dumps({key: report[key] for key in (
        "orientation",
        "selected_union_count",
        "selected_union_sha256",
        "counts_by_block",
        "counts_by_status",
        "first_pending",
    )}, sort_keys=True))


if __name__ == "__main__":
    main()
