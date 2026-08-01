#!/usr/bin/env python3
"""Replay and bank a complete mixed depth-5/depth-6 Phase-3 cover.

The 23 easy depth-5 shards are combined with both depth-6 children of each
of the nine hard depth-5 shards.  Every shard is independently resumed,
manifest-replayed, and DRAT-rechecked before the prefix cover is accepted.
"""

from __future__ import annotations

import json
import os
import sys
import tempfile
from collections.abc import Mapping, Sequence
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as cegar


SCHEMA = "p97-phase3-structural-cegar-prefix-coverage-v1"
DEPTH5_WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth5_wave1_20260729"
)
DEPTH5_WAVE2 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth5_wave2_20260729"
)
DEPTH6_WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth6_hard_children_wave1_20260729"
)
DEPTH6_WAVE2 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth6_hard_children_wave2_20260729"
)
OUTPUT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_mixed_depth5_6_coverage_20260729.json"
)
HARD_DEPTH5 = frozenset({4, 5, 6, 8, 9, 10, 16, 17, 18})
DEPTH6_CHILDREN = tuple(
    child
    for parent in sorted(HARD_DEPTH5)
    for child in (2 * parent, 2 * parent + 1)
)


def _prefix_is_ancestor(
    shallow_depth: int,
    shallow_index: int,
    deep_depth: int,
    deep_index: int,
) -> bool:
    if shallow_depth > deep_depth:
        return False
    return deep_index >> (deep_depth - shallow_depth) == shallow_index


def _validate_exact_prefix_cover(prefixes: Sequence[tuple[int, int]]) -> int:
    if not prefixes:
        raise cegar.StructuralCegarError("prefix coverage is empty")
    if len(set(prefixes)) != len(prefixes):
        raise cegar.StructuralCegarError("duplicate prefix shard")
    for depth, index in prefixes:
        if depth < 0 or not 0 <= index < 1 << depth:
            raise cegar.StructuralCegarError(
                f"invalid prefix shard depth={depth}, index={index}"
            )
    ordered = sorted(prefixes)
    for position, (depth, index) in enumerate(ordered):
        for other_depth, other_index in ordered[position + 1 :]:
            if _prefix_is_ancestor(
                depth, index, other_depth, other_index
            ) or _prefix_is_ancestor(
                other_depth, other_index, depth, index
            ):
                raise cegar.StructuralCegarError(
                    "prefix coverage overlaps: "
                    f"({depth},{index}) and ({other_depth},{other_index})"
                )
    max_depth = max(depth for depth, _ in prefixes)
    covered_leaves = sum(1 << (max_depth - depth) for depth, _ in prefixes)
    if covered_leaves != 1 << max_depth:
        raise cegar.StructuralCegarError(
            "prefix coverage is incomplete: "
            f"covered={covered_leaves}, expected={1 << max_depth}"
        )
    return max_depth


def _replay_terminal_shard(directory: Path) -> dict[str, Any]:
    manifest_path = directory / "manifest.json"
    manifest = cegar._strict_json(manifest_path)
    unsigned = dict(manifest)
    claimed_hash = unsigned.pop("manifest_sha256", None)
    if claimed_hash != cegar._sha256_value(unsigned):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: manifest hash mismatch"
        )
    configuration = manifest.get("configuration")
    if not isinstance(configuration, Mapping):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: configuration is not an object"
        )
    projected_static_v2 = cegar._projected_static_v2_from_configuration(
        configuration,
        where=str(manifest_path),
    )
    if not projected_static_v2:
        raise cegar.StructuralCegarError(
            f"{manifest_path}: expected projected-static-v2"
        )
    encoding = cegar._phase3_encoding(projected_static_v2=True)
    shard = configuration.get("shard")
    if not isinstance(shard, Mapping):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: not a fixed-shard manifest"
        )
    depth = shard.get("depth")
    index = shard.get("index")
    if type(depth) is not int or type(index) is not int:
        raise cegar.StructuralCegarError(
            f"{manifest_path}: invalid shard depth/index"
        )
    if dict(shard) != cegar._shard_spec(
        encoding, depth=depth, index=index
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: canonical shard provenance mismatch"
        )
    if (
        manifest.get("status") not in cegar.SHARD_TERMINAL_STATUSES
        or manifest.get("terminal_drat_verified") is not True
        or manifest.get("counts", {}).get("structural_survivor_count") != 0
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: shard is not terminally UNSAT"
        )

    bootstrap_config = configuration.get("bootstrap_results")
    algebraic_configs = configuration.get("algebraic_bootstraps")
    if not isinstance(algebraic_configs, list):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: algebraic bootstrap provenance is not a list"
        )
    bootstrap_path = (
        None
        if bootstrap_config is None
        else Path(str(bootstrap_config["path"]))
    )
    algebraic_paths = tuple(
        Path(str(algebraic_config["path"]))
        for algebraic_config in algebraic_configs
    )
    replay_manifest = cegar.run_driver(
        directory,
        timeout_s=int(configuration["timeout_seconds"]),
        learned_core_limit=int(configuration["dynamic_learned_core_limit"]),
        survivor_limit=int(configuration["survivor_limit"]),
        workers=int(configuration["workers"]),
        parallel_mode=str(configuration["parallel"]["mode"]),
        cube_depth=int(configuration["parallel"]["cube_depth"]),
        cube_artifact_mode=str(configuration["parallel"]["artifact_mode"]),
        shard_depth=depth,
        shard_index=index,
        bootstrap_results=bootstrap_path,
        algebraic_bootstrap=algebraic_paths,
        projected_static_v2=True,
        resume=True,
    )
    if replay_manifest != manifest:
        raise cegar.StructuralCegarError(
            f"{manifest_path}: replayed manifest mismatch"
        )
    checked = cegar.sat.run_drat_trim(
        directory / "terminal.cnf",
        directory / "terminal.drat",
        int(configuration["timeout_seconds"]),
    )
    if checked.verified is not True:
        raise cegar.StructuralCegarError(
            f"{manifest_path}: terminal DRAT recheck failed"
        )
    return manifest


def verify_mixed_coverage(
    shard_directories: Sequence[Path],
) -> dict[str, Any]:
    replayed = [
        (directory.resolve(), _replay_terminal_shard(directory))
        for directory in shard_directories
    ]
    first = replayed[0][1]
    first_configuration = dict(first["configuration"])
    first_configuration.pop("shard")
    common_provenance = {
        "configuration_without_shard": first_configuration,
        "global_base_cnf_sha256": first["configuration"]["shard"][
            "global_base_cnf_sha256"
        ],
        "bootstrap": first["bootstrap"],
        "trust_boundary": first["trust_boundary"],
    }
    prefixes: list[tuple[int, int]] = []
    seen: set[tuple[int, int]] = set()
    for directory, manifest in replayed:
        configuration = dict(manifest["configuration"])
        shard = configuration.pop("shard")
        provenance = {
            "configuration_without_shard": configuration,
            "global_base_cnf_sha256": shard["global_base_cnf_sha256"],
            "bootstrap": manifest["bootstrap"],
            "trust_boundary": manifest["trust_boundary"],
        }
        if provenance != common_provenance:
            raise cegar.StructuralCegarError(
                f"{directory}: mixed shard coverage provenance mismatch"
            )
        prefix = (int(shard["depth"]), int(shard["index"]))
        if prefix in seen:
            raise cegar.StructuralCegarError(
                f"duplicate shard prefix {prefix}"
            )
        seen.add(prefix)
        prefixes.append(prefix)
    max_depth = _validate_exact_prefix_cover(prefixes)

    conditional = any(
        manifest["status"] == "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
        for _, manifest in replayed
    )
    status = (
        "P97_EUCLIDEAN_GAUGE_PREFIX_COVERAGE_UNSAT_VERIFIED"
        if conditional
        else "STRUCTURAL_PREFIX_COVERAGE_UNSAT_VERIFIED"
    )
    unsigned = {
        "schema": SCHEMA,
        "status": status,
        "max_depth": max_depth,
        "prefix_count": len(replayed),
        "covered_leaf_count": 1 << max_depth,
        "provenance_sha256": cegar._sha256_value(common_provenance),
        "shards": [
            {
                "depth": manifest["configuration"]["shard"]["depth"],
                "index": manifest["configuration"]["shard"]["index"],
                "directory": str(directory),
                "literals": manifest["configuration"]["shard"]["literals"],
                "status": manifest["status"],
                "manifest_sha256": manifest["manifest_sha256"],
                "base_cnf_sha256": manifest["artifact_hashes"]["base.cnf"],
                "terminal_cnf_sha256": manifest["artifact_hashes"][
                    "terminal.cnf"
                ],
                "terminal_drat_sha256": manifest["artifact_hashes"][
                    "terminal.drat"
                ],
            }
            for directory, manifest in sorted(
                replayed,
                key=lambda item: (
                    item[1]["configuration"]["shard"]["depth"],
                    item[1]["configuration"]["shard"]["index"],
                ),
            )
        ],
        "result_claim": (
            "a prefix-free exact Boolean cover is established by independently "
            "replayed and DRAT-rechecked shard-local terminal proofs"
        ),
        "trust_boundary": (
            "prefix-cover composition and provenance comparison are checked "
            "by this Python verifier; the aggregate is not Lean-kernel-checked"
        ),
    }
    return {**unsigned, "coverage_sha256": cegar._sha256_value(unsigned)}


def _atomic_json(path: Path, value: Mapping[str, Any]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".pending"
    )
    try:
        with os.fdopen(fd, "w", encoding="utf-8") as handle:
            json.dump(value, handle, indent=2, sort_keys=True)
            handle.write("\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    except BaseException:
        Path(temporary).unlink(missing_ok=True)
        raise


def main() -> None:
    depth5 = [
        (
            DEPTH5_WAVE1 if index < 24 else DEPTH5_WAVE2
        )
        / f"shard-{index:02d}"
        for index in range(32)
        if index not in HARD_DEPTH5
    ]
    depth6 = [
        (
            DEPTH6_WAVE1 if index <= 33 else DEPTH6_WAVE2
        )
        / f"shard-{index:02d}"
        for index in DEPTH6_CHILDREN
    ]
    coverage = verify_mixed_coverage([*depth5, *depth6])
    if (
        coverage["schema"] != SCHEMA
        or coverage["status"] != "STRUCTURAL_PREFIX_COVERAGE_UNSAT_VERIFIED"
        or coverage["max_depth"] != 6
        or coverage["prefix_count"] != 41
        or coverage["covered_leaf_count"] != 64
    ):
        raise cegar.StructuralCegarError(
            "mixed aggregate coverage has unexpected scope or status"
        )
    unsigned = dict(coverage)
    claimed_hash = unsigned.pop("coverage_sha256")
    if claimed_hash != cegar._sha256_value(unsigned):
        raise cegar.StructuralCegarError(
            "mixed aggregate coverage hash does not replay"
        )
    _atomic_json(OUTPUT, coverage)
    print(
        json.dumps(
            {
                "output": str(OUTPUT.relative_to(ROOT)),
                "status": coverage["status"],
                "coverage_sha256": coverage["coverage_sha256"],
                "prefix_count": coverage["prefix_count"],
                "covered_leaf_count": coverage["covered_leaf_count"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
