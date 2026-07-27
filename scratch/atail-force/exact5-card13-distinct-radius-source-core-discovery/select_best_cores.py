#!/usr/bin/env python3
"""Select the smallest independently checked source core for every cube leaf.

The selector never upgrades solver classification to a proof artifact.  A leaf
is covered only when one input stage records an independently rechecked UNSAT
source-assertion core under exact source cube literals.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
from pathlib import Path
from typing import Any

import source_core_pilot as pilot


SCHEMA = "p97-exact5-card13-distinct-best-source-core-v1"
ORBITS = pilot.ORBITS
CHECKED_STATUSES = {
    "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE",
    "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE",
    "CHECKED_MINIMIZED_REPLACEMENT_CORE",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_json(path: Path) -> dict[str, Any]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(payload, dict):
        raise ValueError(f"expected JSON object: {path}")
    return payload


def bits_for_leaf(leaf: int) -> str:
    return "".join("1" if value else "0" for value in pilot.assignment_for_leaf(leaf))


def external_cube_payload(leaf: int) -> list[dict[str, Any]]:
    return [
        {key: item[key] for key in ("atom", "value", "assertion")}
        for item in pilot.expected_cube_payload(leaf)
    ]


def checked_candidate(
    *, payload: dict[str, Any], path: Path, stage: str, orbit: str, leaf: int
) -> dict[str, Any] | None:
    if payload.get("orbit") != orbit or payload.get("leaf") != leaf:
        raise ValueError(f"orbit/leaf mismatch: {path}")
    if payload.get("classification_status") == "SAT":
        raise RuntimeError(f"fail-closed SAT artifact: {path}")
    expected_bits = bits_for_leaf(leaf)
    actual_bits = payload.get("cube_bits")
    if actual_bits is None:
        actual_bits = "".join(
            "1" if item["value"] else "0" for item in payload["cube"]
        )
    if actual_bits != expected_bits:
        raise ValueError(f"cube assignment mismatch: {path}")
    if (
        payload.get("epistemic_status") not in CHECKED_STATUSES
        or payload.get("core_extraction_status") != "UNSAT"
        or payload.get("core_recheck_status") != "UNSAT"
    ):
        return None
    source_size = int(payload["core_size"])
    cube_size = int(payload["core_cube_size"])
    source_indices = [int(item["index"]) for item in payload["core"]]
    cube_literals = [str(item) for item in payload["core_cube_literals"]]
    if len(source_indices) != source_size or len(set(source_indices)) != source_size:
        raise ValueError(f"source core cardinality mismatch: {path}")
    if len(cube_literals) != cube_size or len(set(cube_literals)) != cube_size:
        raise ValueError(f"cube core cardinality mismatch: {path}")
    return {
        "stage": stage,
        "path": str(path),
        "sha256": sha256(path),
        "source_core_size": source_size,
        "cube_core_size": cube_size,
        "total_core_size": source_size + cube_size,
        "source_assertion_indices": source_indices,
        "cube_literals": cube_literals,
        "epistemic_status": payload["epistemic_status"],
    }


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--first-pass", type=Path, required=True)
    parser.add_argument("--level2", type=Path)
    parser.add_argument("--external", type=Path, action="append", default=[])
    parser.add_argument("--replacements", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--split-output-dir", type=Path)
    parser.add_argument(
        "--gzip-output",
        type=Path,
        help="also write a deterministic compressed copy of the combined manifest",
    )
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    first_config_path = args.first_pass / "run-config.json"
    first_config = load_json(first_config_path)
    first_config_sha = sha256(first_config_path)
    first_fingerprints = {
        item["orbit"]: item["source_assertions_sha256"]
        for item in first_config["orbits"]
    }
    first_settings = {
        "solve_seconds": first_config["solve_seconds"],
        "core_seconds": first_config["core_seconds"],
        "verify_seconds": first_config["verify_seconds"],
        "core_minimize": first_config["core_minimize"],
    }

    level2_config: dict[str, Any] | None = None
    level2_config_path: Path | None = None
    if args.level2 is not None:
        level2_config_path = args.level2 / "run-config.json"
        level2_config = load_json(level2_config_path)
        if level2_config.get("first_pass_run_config_sha256") != first_config_sha:
            raise ValueError("level-2 artifacts do not descend from first pass")

    replacement_selection: dict[str, Any] | None = None
    replacement_selection_path: Path | None = None
    replacement_by_leaf: dict[tuple[str, int], dict[str, Any]] = {}
    if args.replacements is not None:
        replacement_selection_path = args.replacements / "selection.json"
        replacement_selection = load_json(replacement_selection_path)
        if replacement_selection.get("first_pass_run_config_sha256") != first_config_sha:
            raise ValueError("replacement artifacts do not descend from first pass")
        for orbit, selected in replacement_selection["orbits"].items():
            for item in selected:
                replacement_by_leaf[(orbit, int(item["leaf"]))] = item

    external_sources: list[tuple[Path, set[tuple[str, int]]]] = []
    external_config_paths: list[Path] = []
    for external_dir in args.external:
        external_config_path = external_dir / "run-config.json"
        external_config = load_json(external_config_path)
        if external_config.get("first_pass_run_config_sha256") != first_config_sha:
            raise ValueError("external artifacts do not descend from first pass")
        if level2_config_path is None:
            raise ValueError("external artifacts require --level2 provenance")
        if external_config.get("level2_run_config_sha256") != sha256(level2_config_path):
            raise ValueError("external artifacts do not descend from level two")
        external_selected = {
            (str(item["orbit"]), int(item["leaf"]))
            for item in external_config["selections"]
        }
        external_sources.append((external_dir, external_selected))
        external_config_paths.append(external_config_path)

    orbit_outputs: list[dict[str, Any]] = []
    for orbit_index, orbit in enumerate(ORBITS):
        leaves: list[dict[str, Any]] = []
        for leaf in range(512):
            classifications: list[dict[str, Any]] = []
            candidates: list[dict[str, Any]] = []

            first_path = args.first_pass / orbit / f"leaf-{leaf:03d}.json"
            first = pilot.validate_resumed_leaf(
                first_path,
                orbit,
                leaf,
                int(first_config["seed"]) + leaf,
                first_fingerprints[orbit],
                first_settings,
            )
            classifications.append({
                "stage": "first_pass",
                "status": first["classification_status"],
                "path": str(first_path),
                "sha256": sha256(first_path),
            })
            candidate = checked_candidate(
                payload=first,
                path=first_path,
                stage="first_pass",
                orbit=orbit,
                leaf=leaf,
            )
            if candidate is not None:
                candidates.append(candidate)

            if level2_config is not None and args.level2 is not None:
                level2_path = args.level2 / orbit / f"leaf-{leaf:03d}.json"
                if level2_path.exists():
                    level2 = load_json(level2_path)
                    expected_seed = (
                        int(level2_config["seed_base"])
                        + orbit_index * 10_000
                        + leaf
                    )
                    expected = {
                        "schema": "p97-exact5-card13-distinct-source-core-level2-v1",
                        "orbit": orbit,
                        "leaf": leaf,
                        "seed": expected_seed,
                        "source_assertions_sha256": {
                            item["orbit"]: item["source_assertions_sha256"]
                            for item in level2_config["orbits"]
                        }[orbit],
                        "cube": pilot.expected_cube_payload(leaf),
                        "settings": {
                            "classify_seconds": level2_config["classify_seconds"],
                            "core_seconds": level2_config["core_seconds"],
                            "verify_seconds": level2_config["verify_seconds"],
                            "seed": expected_seed,
                        },
                    }
                    if any(level2.get(key) != value for key, value in expected.items()):
                        raise ValueError(f"strict level-2 mismatch: {level2_path}")
                    classifications.append({
                        "stage": "level2",
                        "status": level2["classification_status"],
                        "path": str(level2_path),
                        "sha256": sha256(level2_path),
                    })
                    candidate = checked_candidate(
                        payload=level2,
                        path=level2_path,
                        stage="level2",
                        orbit=orbit,
                        leaf=leaf,
                    )
                    if candidate is not None:
                        candidates.append(candidate)

            if args.replacements is not None:
                replacement_path = (
                    args.replacements / orbit / f"leaf-{leaf:03d}.json"
                )
                if replacement_path.exists():
                    selected = replacement_by_leaf.get((orbit, leaf))
                    if selected is None:
                        raise ValueError(f"unselected replacement artifact: {replacement_path}")
                    replacement = load_json(replacement_path)
                    if (
                        replacement.get("base_leaf_sha256")
                        != selected["base_leaf_sha256"]
                        or replacement.get("base_core_size")
                        != selected["base_core_size"]
                        or replacement.get("base_stage") != selected["base_stage"]
                    ):
                        raise ValueError(f"replacement provenance mismatch: {replacement_path}")
                    classifications.append({
                        "stage": "replacement",
                        "status": replacement["classification_status"],
                        "path": str(replacement_path),
                        "sha256": sha256(replacement_path),
                    })
                    candidate = checked_candidate(
                        payload=replacement,
                        path=replacement_path,
                        stage="replacement",
                        orbit=orbit,
                        leaf=leaf,
                    )
                    if candidate is not None:
                        candidates.append(candidate)

            for external_dir, external_selected in external_sources:
                if (orbit, leaf) not in external_selected:
                    continue
                external_path = (
                    external_dir / orbit / f"leaf-{leaf:03d}" / "result.json"
                )
                if external_path.exists():
                    external = load_json(external_path)
                    expected = {
                        "schema": (
                            "p97-exact5-card13-external-selector-"
                            "source-core-pilot-v1"
                        ),
                        "orbit": orbit,
                        "leaf": leaf,
                        "source_assertion_count": 58_433,
                        "source_assertions_sha256": first_fingerprints[orbit],
                        "cube": external_cube_payload(leaf),
                    }
                    if any(external.get(key) != value for key, value in expected.items()):
                        raise ValueError(f"strict external mismatch: {external_path}")
                    if external.get("external_status") == "SAT":
                        raise RuntimeError(f"fail-closed external SAT: {external_path}")
                    classifications.append({
                        "stage": "external",
                        "status": external.get("external_status", "UNKNOWN"),
                        "path": str(external_path),
                        "sha256": sha256(external_path),
                    })
                    if (
                        external.get("external_status") == "UNSAT"
                        and external.get("drat_trim_verified") is True
                        and external.get("source_packet_z3_recheck") == "UNSAT"
                        and int(external.get("core_source_assertion_count", 0)) > 0
                        and int(external.get("core_cube_literal_count", 0)) > 0
                    ):
                        source_size = int(external["core_source_assertion_count"])
                        cube_size = int(external["core_cube_literal_count"])
                        source_indices = [
                            int(item["index"]) for item in external["core"]
                        ]
                        cube_literals = [
                            str(item) for item in external["core_cube_literals"]
                        ]
                        if (
                            len(source_indices) != source_size
                            or len(set(source_indices)) != source_size
                            or len(cube_literals) != cube_size
                            or len(set(cube_literals)) != cube_size
                        ):
                            raise ValueError(
                                f"external core cardinality mismatch: {external_path}"
                            )
                        candidates.append({
                            "stage": "external",
                            "path": str(external_path),
                            "sha256": sha256(external_path),
                            "source_core_size": source_size,
                            "cube_core_size": cube_size,
                            "total_core_size": source_size + cube_size,
                            "source_assertion_indices": source_indices,
                            "cube_literals": cube_literals,
                            "epistemic_status": (
                                "DRAT_VERIFIED_AND_SOURCE_Z3_RECHECKED_CORE"
                            ),
                        })

            best = min(
                candidates,
                key=lambda item: (
                    item["total_core_size"],
                    item["source_core_size"],
                    item["cube_core_size"],
                    item["stage"],
                ),
                default=None,
            )
            leaves.append({
                "leaf": leaf,
                "cube_bits": bits_for_leaf(leaf),
                "classification_evidence": classifications,
                "has_unsat_classification": any(
                    item["status"] == "UNSAT" for item in classifications
                ),
                "checked_core_candidate_count": len(candidates),
                "best_checked_core": best,
            })

        missing_classification = [
            item["leaf"] for item in leaves if not item["has_unsat_classification"]
        ]
        missing_core = [
            item["leaf"] for item in leaves if item["best_checked_core"] is None
        ]
        orbit_outputs.append({
            "orbit": orbit,
            "source_assertion_count": 58_433,
            "source_assertions_sha256": first_fingerprints[orbit],
            "epistemic_status": (
                "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES"
                if not missing_core
                else "SOURCE_CUBE_CORE_COVERAGE_INCOMPLETE"
            ),
            "leaf_count": len(leaves),
            "unsat_classified_count": len(leaves) - len(missing_classification),
            "checked_core_count": len(leaves) - len(missing_core),
            "missing_unsat_classification_leaves": missing_classification,
            "missing_checked_core_leaves": missing_core,
            "leaves": leaves,
        })

    payload = {
        "schema": SCHEMA,
        "epistemic_status": (
            "ALL_SOURCE_CUBES_HAVE_CHECKED_SOURCE_CORES"
            if all(not orbit["missing_checked_core_leaves"] for orbit in orbit_outputs)
            else "SOURCE_CUBE_CORE_COVERAGE_INCOMPLETE"
        ),
        "selection_metric": [
            "total_core_size",
            "source_core_size",
            "cube_core_size",
            "stage",
        ],
        "first_pass": str(args.first_pass),
        "first_pass_run_config_sha256": first_config_sha,
        "level2": str(args.level2) if args.level2 is not None else None,
        "level2_run_config_sha256": (
            sha256(level2_config_path) if level2_config_path is not None else None
        ),
        "external": [str(path) for path, _selected in external_sources],
        "external_run_config_sha256": [
            sha256(path) for path in external_config_paths
        ],
        "replacements": str(args.replacements) if args.replacements is not None else None,
        "replacement_selection_sha256": (
            sha256(replacement_selection_path)
            if replacement_selection_path is not None
            else None
        ),
        "orbits": orbit_outputs,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    gzip_output = None
    if args.gzip_output is not None:
        args.gzip_output.parent.mkdir(parents=True, exist_ok=True)
        compressed = gzip.compress(args.output.read_bytes(), compresslevel=9, mtime=0)
        args.gzip_output.write_bytes(compressed)
        gzip_output = {
            "path": str(args.gzip_output),
            "sha256": sha256(args.gzip_output),
            "size_bytes": len(compressed),
        }
    split_outputs: list[dict[str, Any]] = []
    if args.split_output_dir is not None:
        args.split_output_dir.mkdir(parents=True, exist_ok=True)
        common = {
            key: value for key, value in payload.items() if key != "orbits"
        }
        for orbit_payload in orbit_outputs:
            orbit_path = (
                args.split_output_dir
                / f"{orbit_payload['orbit']}.best-checked-cores.json"
            )
            split_payload = {
                **common,
                "schema": f"{SCHEMA}-orbit",
                "epistemic_status": orbit_payload["epistemic_status"],
                "orbit": orbit_payload,
            }
            orbit_path.write_text(
                json.dumps(split_payload, indent=2, sort_keys=True) + "\n",
                encoding="utf-8",
            )
            split_outputs.append({
                "orbit": orbit_payload["orbit"],
                "path": str(orbit_path),
                "sha256": sha256(orbit_path),
                "status": orbit_payload["epistemic_status"],
                "checked_core_count": orbit_payload["checked_core_count"],
            })
    print(json.dumps({
        "event": "best_core_selection_complete",
        "status": payload["epistemic_status"],
        "output": str(args.output),
        "orbits": [
            {
                "orbit": item["orbit"],
                "unsat_classified_count": item["unsat_classified_count"],
                "checked_core_count": item["checked_core_count"],
            }
            for item in orbit_outputs
        ],
        "split_outputs": split_outputs,
        "gzip_output": gzip_output,
    }, sort_keys=True))


if __name__ == "__main__":
    main()
