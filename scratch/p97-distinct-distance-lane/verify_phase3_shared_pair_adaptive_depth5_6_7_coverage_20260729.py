#!/usr/bin/env python3
"""Discover, replay, and bank an adaptive depth-5/6/7/8/9 Phase-3 cover.

Terminal manifests are discovered only below the ten named shared-pair wave
roots.  For each of the 32 depth-5 roots, the verifier prefers a terminal
shallower prefix and descends only when necessary.  A complete prefix-free
terminal antichain must exist before any expensive production resume or
independent DRAT replay begins.
"""

from __future__ import annotations

import importlib.util
import json
import os
import sys
import tempfile
from collections.abc import Mapping, Sequence
from pathlib import Path
from types import ModuleType
from typing import Any

ROOT = Path(__file__).resolve().parents[2]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_structural_cegar as cegar

SCHEMA = "p97-phase3-structural-cegar-adaptive-prefix-coverage-v2"
MAXIMUM_SUPPORTED_DEPTH = 9
FIXED_VERIFIER_PATH = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "verify_phase3_shared_pair_mixed_depth5_6_7_coverage_20260729.py"
)
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
DEPTH7_WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth7_hard_grandchildren_wave1_20260729"
)
DEPTH7_WAVE2 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth7_hard_grandchildren_wave2_20260729"
)
DEPTH7_WAVE3 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth7_hard_grandchildren_wave3_20260729"
)
DEPTH8_WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth8_hard_greatgrandchildren_wave1_20260730"
)
DEPTH9_HARD_DESCENDANTS_WAVE1 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth9_hard_descendants_wave1_20260730"
)
DEPTH9_HARD_DESCENDANTS_WAVE2 = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_depth9_hard_descendants_wave2_20260730"
)
WAVE_ROOTS = (
    (5, DEPTH5_WAVE1),
    (5, DEPTH5_WAVE2),
    (6, DEPTH6_WAVE1),
    (6, DEPTH6_WAVE2),
    (7, DEPTH7_WAVE1),
    (7, DEPTH7_WAVE2),
    (7, DEPTH7_WAVE3),
    (8, DEPTH8_WAVE1),
    (9, DEPTH9_HARD_DESCENDANTS_WAVE1),
    (9, DEPTH9_HARD_DESCENDANTS_WAVE2),
)
OUTPUT = (
    ROOT
    / "scratch/p97-distinct-distance-lane/"
    "phase3_projected_static_v2_shared_pair_adaptive_depth5_6_7_8_9_"
    "coverage_20260730.json"
)

Prefix = tuple[int, int]
Candidate = tuple[Path, dict[str, Any]]


def _load_fixed_verifier() -> ModuleType:
    spec = importlib.util.spec_from_file_location(
        "phase3_shared_pair_fixed_depth5_6_7_verifier",
        FIXED_VERIFIER_PATH,
    )
    if spec is None or spec.loader is None:
        raise cegar.StructuralCegarError(
            f"cannot load fixed verifier: {FIXED_VERIFIER_PATH}"
        )
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


fixed_verifier = _load_fixed_verifier()


def _candidate_manifest(
    manifest_path: Path,
    *,
    expected_depth: int,
) -> dict[str, Any] | None:
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
    if (
        not cegar._projected_static_v2_from_configuration(
            configuration,
            where=str(manifest_path),
        )
        or manifest.get("schema") != cegar.PROJECTED_STATIC_SCHEMA
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: expected projected-static-v2"
        )
    if not isinstance(configuration.get("source_provenance"), Mapping):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: source provenance is not an object"
        )
    bootstrap_config = configuration.get("bootstrap_results")
    if bootstrap_config is not None and not isinstance(
        bootstrap_config, Mapping
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: bootstrap provenance is not an object"
        )
    if not isinstance(configuration.get("algebraic_bootstraps"), list):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: algebraic bootstrap provenance is not a list"
        )

    shard = configuration.get("shard")
    if not isinstance(shard, Mapping):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: not a fixed-shard manifest"
        )
    depth = shard.get("depth")
    index = shard.get("index")
    if (
        type(depth) is not int
        or type(index) is not int
        or depth != expected_depth
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: invalid wave shard depth/index"
        )
    encoding = cegar._phase3_encoding(projected_static_v2=True)
    if dict(shard) != cegar._shard_spec(
        encoding, depth=depth, index=index
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: canonical shard provenance mismatch"
        )

    if manifest.get("status") not in cegar.SHARD_TERMINAL_STATUSES:
        return None
    if (
        manifest.get("terminal_drat_verified") is not True
        or manifest.get("counts", {}).get("structural_survivor_count") != 0
    ):
        raise cegar.StructuralCegarError(
            f"{manifest_path}: malformed terminal UNSAT claim"
        )
    return manifest


def _discover_terminal_candidates(
    wave_roots: Sequence[tuple[int, Path]] = WAVE_ROOTS,
) -> dict[Prefix, Candidate]:
    candidates: dict[Prefix, Candidate] = {}
    for expected_depth, root in wave_roots:
        if not root.is_dir():
            raise cegar.StructuralCegarError(
                f"shared-pair wave root does not exist: {root}"
            )
        for manifest_path in sorted(root.glob("shard-*/manifest.json")):
            manifest = _candidate_manifest(
                manifest_path,
                expected_depth=expected_depth,
            )
            if manifest is None:
                continue
            shard = manifest["configuration"]["shard"]
            prefix = (int(shard["depth"]), int(shard["index"]))
            if prefix in candidates:
                previous = candidates[prefix][0]
                raise cegar.StructuralCegarError(
                    f"duplicate terminal prefix {prefix}: "
                    f"{previous} and {manifest_path.parent}"
                )
            candidates[prefix] = (manifest_path.parent.resolve(), manifest)
    return candidates


def _choose_adaptive_cover(
    candidates: Mapping[Prefix, Any],
) -> list[Prefix]:
    chosen: list[Prefix] = []

    def choose(depth: int, index: int) -> None:
        prefix = (depth, index)
        if prefix in candidates:
            chosen.append(prefix)
            return
        if depth == MAXIMUM_SUPPORTED_DEPTH:
            raise cegar.StructuralCegarError(
                "adaptive depth-5/6/7/8/9 coverage is incomplete at "
                f"depth={depth}, index={index}"
            )
        choose(depth + 1, 2 * index)
        choose(depth + 1, 2 * index + 1)

    for depth5_index in range(32):
        choose(5, depth5_index)
    fixed_verifier._validate_exact_prefix_cover(chosen)
    return chosen


def _common_provenance(manifest: Mapping[str, Any]) -> dict[str, Any]:
    configuration = dict(manifest["configuration"])
    shard = configuration.pop("shard")
    return {
        "configuration_without_shard": configuration,
        "global_base_cnf_sha256": shard["global_base_cnf_sha256"],
        "bootstrap": manifest["bootstrap"],
        "trust_boundary": manifest["trust_boundary"],
    }


def _require_common_provenance(
    candidates: Mapping[Prefix, Candidate],
    prefixes: Sequence[Prefix],
) -> dict[str, Any]:
    first_prefix = prefixes[0]
    common = _common_provenance(candidates[first_prefix][1])
    for prefix in prefixes[1:]:
        directory, manifest = candidates[prefix]
        if _common_provenance(manifest) != common:
            raise cegar.StructuralCegarError(
                f"{directory}: adaptive coverage provenance mismatch"
            )
    return common


def verify_adaptive_coverage(
    candidates: Mapping[Prefix, Candidate],
) -> dict[str, Any]:
    chosen = _choose_adaptive_cover(candidates)
    discovered_provenance = _require_common_provenance(candidates, chosen)

    replayed: list[tuple[Prefix, Path, dict[str, Any]]] = []
    for prefix in chosen:
        directory, discovered_manifest = candidates[prefix]
        replayed_manifest = fixed_verifier._replay_terminal_shard(directory)
        if replayed_manifest != discovered_manifest:
            raise cegar.StructuralCegarError(
                f"{directory}: manifest changed after adaptive discovery"
            )
        replayed.append((prefix, directory, replayed_manifest))

    replayed_candidates = {
        prefix: (directory, manifest)
        for prefix, directory, manifest in replayed
    }
    replayed_provenance = _require_common_provenance(
        replayed_candidates, chosen
    )
    if replayed_provenance != discovered_provenance:
        raise cegar.StructuralCegarError(
            "adaptive coverage provenance changed during replay"
        )
    max_depth = fixed_verifier._validate_exact_prefix_cover(chosen)
    conditional = any(
        manifest["status"]
        == "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
        for _, _, manifest in replayed
    )
    status = (
        "P97_EUCLIDEAN_GAUGE_ADAPTIVE_PREFIX_COVERAGE_UNSAT_VERIFIED"
        if conditional
        else "STRUCTURAL_ADAPTIVE_PREFIX_COVERAGE_UNSAT_VERIFIED"
    )
    unsigned = {
        "schema": SCHEMA,
        "status": status,
        "root_depth": 5,
        "root_count": 32,
        "maximum_supported_depth": MAXIMUM_SUPPORTED_DEPTH,
        "chosen_max_depth": max_depth,
        "chosen_prefix_count": len(chosen),
        "normalized_depth9_leaf_count": 512,
        "discovered_terminal_prefix_count": len(candidates),
        "selection_policy": (
            "recursively cover depth-5 roots in index order, selecting a "
            "terminal prefix before considering either child"
        ),
        "provenance_sha256": cegar._sha256_value(replayed_provenance),
        "chosen_cover": [
            {
                "depth": prefix[0],
                "index": prefix[1],
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
            for prefix, directory, manifest in replayed
        ],
        "result_claim": (
            "an adaptively selected prefix-free terminal antichain covers all "
            "32 depth-5 roots; every chosen shard was independently "
            "production-resumed, manifest-replayed, and DRAT-rechecked"
        ),
        "trust_boundary": (
            "shard production uses external CaDiCaL and drat-trim; this "
            "verifier independently reruns drat-trim, while manifest "
            "discovery, shallowest-prefix selection, exact-cover composition, "
            "and provenance equality are Python-checked; the aggregate is not "
            "Lean-kernel-checked"
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
    candidates = _discover_terminal_candidates()
    chosen = _choose_adaptive_cover(candidates)
    coverage = verify_adaptive_coverage(candidates)
    if (
        coverage["schema"] != SCHEMA
        or coverage["status"]
        != "STRUCTURAL_ADAPTIVE_PREFIX_COVERAGE_UNSAT_VERIFIED"
        or coverage["root_depth"] != 5
        or coverage["root_count"] != 32
        or coverage["maximum_supported_depth"] != MAXIMUM_SUPPORTED_DEPTH
        or coverage["normalized_depth9_leaf_count"] != 512
        or coverage["chosen_prefix_count"] != len(chosen)
        or [
            (entry["depth"], entry["index"])
            for entry in coverage["chosen_cover"]
        ]
        != chosen
    ):
        raise cegar.StructuralCegarError(
            "adaptive aggregate coverage has unexpected scope or status"
        )
    unsigned = dict(coverage)
    claimed_hash = unsigned.pop("coverage_sha256")
    if claimed_hash != cegar._sha256_value(unsigned):
        raise cegar.StructuralCegarError(
            "adaptive aggregate coverage hash does not replay"
        )
    _atomic_json(OUTPUT, coverage)
    print(
        json.dumps(
            {
                "output": str(OUTPUT.relative_to(ROOT)),
                "status": coverage["status"],
                "coverage_sha256": coverage["coverage_sha256"],
                "chosen_prefix_count": coverage["chosen_prefix_count"],
                "chosen_max_depth": coverage["chosen_max_depth"],
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
