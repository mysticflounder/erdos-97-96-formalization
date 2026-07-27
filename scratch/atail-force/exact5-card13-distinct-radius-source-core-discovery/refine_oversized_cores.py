#!/usr/bin/env python3
"""Re-extract oversized checked first-pass cores without replacing them."""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import json
from pathlib import Path
import time
from typing import Any

import z3

import source_core_pilot as pilot


SCHEMA = "p97-exact5-card13-distinct-oversized-core-replacement-v1"
ORBITS = pilot.ORBITS


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


_OUTER: Any | None = None
_ASSERTIONS: list[z3.BoolRef] | None = None
_ATOMS: dict[str, z3.BoolRef] | None = None
_COUNTS: dict[str, object] | None = None
_FINGERPRINT: str | None = None
_ORBIT: str | None = None


def initialize_worker(orbit: str, seed: int) -> None:
    global _OUTER, _ASSERTIONS, _ATOMS, _COUNTS, _FINGERPRINT, _ORBIT
    surface = pilot.load_surface()
    outer, _rank, counts = surface.build(orbit, seed)
    assertions = list(outer.solver.assertions())
    if len(assertions) != 58_433:
        raise AssertionError("source assertion count drift")
    _OUTER = outer
    _ASSERTIONS = assertions
    _ATOMS = pilot.pinned_atoms(outer)
    _COUNTS = counts
    _FINGERPRINT = pilot.assertion_fingerprint(assertions)
    _ORBIT = orbit


def solve_leaf(
    task: tuple[int, int, float, float, float, str, int, str]
) -> dict[str, object]:
    (
        leaf,
        seed,
        classify_seconds,
        core_seconds,
        verify_seconds,
        base_sha,
        base_size,
        base_stage,
    ) = task
    if any(item is None for item in (
        _OUTER, _ASSERTIONS, _ATOMS, _COUNTS, _FINGERPRINT, _ORBIT
    )):
        raise AssertionError("worker was not initialized")
    assert _ASSERTIONS is not None
    assert _ATOMS is not None
    assert _COUNTS is not None
    assert _FINGERPRINT is not None
    assert _ORBIT is not None

    started = time.monotonic()
    values = pilot.assignment_for_leaf(leaf)
    cube = pilot.cube_literals(_ATOMS, values)
    settings = {
        "classify_seconds": classify_seconds,
        "core_seconds": core_seconds,
        "verify_seconds": verify_seconds,
        "core_minimize": True,
        "seed": seed,
    }
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "epistemic_status": "OVERSIZED_CORE_REPLACEMENT_INCOMPLETE",
        "orbit": _ORBIT,
        "leaf": leaf,
        "seed": seed,
        "source_assertion_count": len(_ASSERTIONS),
        "source_assertions_sha256": _FINGERPRINT,
        "source_counts": _COUNTS,
        "base_leaf_sha256": base_sha,
        "base_core_size": base_size,
        "base_stage": base_stage,
        "cube": pilot.expected_cube_payload(leaf),
        "cube_bits": "".join("1" if value else "0" for value in values),
        "settings": settings,
    }

    classification_solver = z3.Solver()
    classification_solver.set(
        timeout=max(1, int(1000 * classify_seconds)), random_seed=seed
    )
    classification_solver.add(*_ASSERTIONS)
    classification_solver.add(*cube)
    classification = classification_solver.check()
    classified = time.monotonic()
    payload.update({
        "classification_status": pilot.status_name(classification),
        "classification_reason_unknown": (
            classification_solver.reason_unknown()
            if classification == z3.unknown
            else None
        ),
        "classification_seconds": classified - started,
    })
    if classification == z3.sat:
        assert _OUTER is not None
        payload["decoded_source_model"] = _OUTER.decode(
            classification_solver.model()
        )
        payload["epistemic_status"] = "FAIL_CLOSED_SOURCE_SAT"
        payload["total_seconds"] = time.monotonic() - started
        return payload
    if classification == z3.unknown:
        payload["epistemic_status"] = "OVERSIZED_REPLACEMENT_CLASSIFICATION_UNKNOWN"
        payload["total_seconds"] = time.monotonic() - started
        return payload

    tracked = z3.Solver()
    tracked.set(
        timeout=max(1, int(1000 * core_seconds)),
        random_seed=seed,
        **{"core.minimize": True},
    )
    markers = [
        z3.Bool(f"oversized_source_assertion_{index}")
        for index in range(len(_ASSERTIONS))
    ]
    tracked.add(*(
        z3.Implies(marker, assertion)
        for marker, assertion in zip(markers, _ASSERTIONS, strict=True)
    ))
    extraction = tracked.check(*markers, *cube)
    extracted = time.monotonic()
    payload.update({
        "core_extraction_status": pilot.status_name(extraction),
        "core_extraction_reason_unknown": (
            tracked.reason_unknown() if extraction == z3.unknown else None
        ),
        "core_extraction_seconds": extracted - classified,
    })
    if extraction != z3.unsat:
        payload["epistemic_status"] = "OVERSIZED_REPLACEMENT_CORE_UNKNOWN"
        payload["total_seconds"] = time.monotonic() - started
        return payload

    marker_indices = {
        marker.decl().name(): index for index, marker in enumerate(markers)
    }
    cube_by_sexpr = {literal.sexpr(): literal for literal in cube}
    core_indices: list[int] = []
    selected_cube_by_sexpr: dict[str, z3.BoolRef] = {}
    for item in tracked.unsat_core():
        if z3.is_const(item) and item.decl().name() in marker_indices:
            core_indices.append(marker_indices[item.decl().name()])
        elif item.sexpr() in cube_by_sexpr:
            selected_cube_by_sexpr[item.sexpr()] = cube_by_sexpr[item.sexpr()]
        else:
            raise AssertionError(f"unexpected replacement core item: {item.sexpr()}")
    core_indices = sorted(set(core_indices))
    selected_cube = [
        literal for literal in cube if literal.sexpr() in selected_cube_by_sexpr
    ]

    replay = z3.Solver()
    replay.set(timeout=max(1, int(1000 * verify_seconds)), random_seed=seed)
    replay.add(*(_ASSERTIONS[index] for index in core_indices))
    replay.add(*selected_cube)
    verification = replay.check()
    payload.update({
        "core_size": len(core_indices),
        "core": [
            {"index": index, "assertion": _ASSERTIONS[index].sexpr()}
            for index in core_indices
        ],
        "core_cube_size": len(selected_cube),
        "core_cube_literals": [literal.sexpr() for literal in selected_cube],
        "core_recheck_status": pilot.status_name(verification),
        "core_recheck_reason_unknown": (
            replay.reason_unknown() if verification == z3.unknown else None
        ),
        "size_improvement": base_size - len(core_indices),
        "epistemic_status": (
            "CHECKED_MINIMIZED_REPLACEMENT_CORE"
            if verification == z3.unsat
            else "MINIMIZED_REPLACEMENT_CORE_RECHECK_UNKNOWN"
        ),
        "verified_bvexpr_contract": {
            "core_entries": (
                "zero-based indices and exact sexprs in the original ordered "
                "surface.build(...).solver.assertions() list"
            ),
            "additional_branch_hypotheses": (
                "the selected exact source cube literals in core_cube_literals"
            ),
        },
    })
    payload["total_seconds"] = time.monotonic() - started
    return payload


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--first-pass", type=Path, required=True)
    parser.add_argument(
        "--level2",
        type=Path,
        help="completed level-2 directory whose checked oversized cores join selection",
    )
    parser.add_argument(
        "--external",
        type=Path,
        help="completed external-gap directory whose checked cores join selection",
    )
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--workers", type=int, default=20)
    parser.add_argument("--threshold", type=int, default=12)
    parser.add_argument("--seed-base", type=int, default=300_000)
    parser.add_argument("--classify-seconds", type=float, default=300.0)
    parser.add_argument("--core-seconds", type=float, default=300.0)
    parser.add_argument("--verify-seconds", type=float, default=300.0)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--plan-only", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must lie in [1, 24]")
    if args.threshold < 1:
        raise ValueError("threshold must be positive")
    return args


def main() -> None:
    args = parse_args()
    base_config_path = args.first_pass / "run-config.json"
    base_config = json.loads(base_config_path.read_text(encoding="utf-8"))
    base_config_sha = sha256(base_config_path)
    base_settings = {
        "solve_seconds": base_config["solve_seconds"],
        "core_seconds": base_config["core_seconds"],
        "verify_seconds": base_config["verify_seconds"],
        "core_minimize": base_config["core_minimize"],
    }
    fingerprints = {
        item["orbit"]: item["source_assertions_sha256"]
        for item in base_config["orbits"]
    }
    selections: dict[str, list[dict[str, object]]] = {}
    for orbit in ORBITS:
        by_leaf: dict[int, dict[str, object]] = {}
        for leaf in range(512):
            path = args.first_pass / orbit / f"leaf-{leaf:03d}.json"
            payload = pilot.validate_resumed_leaf(
                path,
                orbit,
                leaf,
                int(base_config["seed"]) + leaf,
                fingerprints[orbit],
                base_settings,
            )
            if (
                payload["classification_status"] == "UNSAT"
                and payload.get("core_extraction_status") == "UNSAT"
                and payload.get("core_recheck_status") == "UNSAT"
                and int(payload.get("core_size", 0)) > args.threshold
            ):
                by_leaf[leaf] = {
                    "leaf": leaf,
                    "cube_bits": "".join(
                        "1" if item["value"] else "0" for item in payload["cube"]
                    ),
                    "base_core_size": payload["core_size"],
                    "base_leaf_path": str(path),
                    "base_leaf_sha256": sha256(path),
                    "base_stage": "first_pass",
                }
        selections[orbit] = list(by_leaf.values())

    level2_config_sha = None
    if args.level2 is not None:
        level2_config_path = args.level2 / "run-config.json"
        level2_config = json.loads(level2_config_path.read_text(encoding="utf-8"))
        level2_config_sha = sha256(level2_config_path)
        if level2_config.get("first_pass_run_config_sha256") != base_config_sha:
            raise ValueError("level-2 input does not descend from this first pass")
        level2_fingerprints = {
            item["orbit"]: item["source_assertions_sha256"]
            for item in level2_config["orbits"]
        }
        for orbit in ORBITS:
            by_leaf = {int(item["leaf"]): item for item in selections[orbit]}
            for path in sorted((args.level2 / orbit).glob("leaf-*.json")):
                payload = json.loads(path.read_text(encoding="utf-8"))
                leaf = int(payload.get("leaf", -1))
                expected_seed = (
                    int(level2_config["seed_base"])
                    + (0 if orbit == ORBITS[0] else 10_000)
                    + leaf
                )
                expected_settings = {
                    "classify_seconds": level2_config["classify_seconds"],
                    "core_seconds": level2_config["core_seconds"],
                    "verify_seconds": level2_config["verify_seconds"],
                    "seed": expected_seed,
                }
                expected = {
                    "schema": "p97-exact5-card13-distinct-source-core-level2-v1",
                    "orbit": orbit,
                    "leaf": leaf,
                    "seed": expected_seed,
                    "source_assertions_sha256": level2_fingerprints[orbit],
                    "cube": pilot.expected_cube_payload(leaf),
                    "settings": expected_settings,
                }
                if any(payload.get(key) != value for key, value in expected.items()):
                    raise ValueError(f"strict level-2 candidate mismatch: {path}")
                if payload.get("classification_status") == "SAT":
                    raise RuntimeError(f"fail-closed SAT level-2 candidate: {path}")
                if (
                    payload.get("epistemic_status")
                    == "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE"
                    and int(payload.get("core_size", 0)) > args.threshold
                ):
                    candidate = {
                        "leaf": leaf,
                        "cube_bits": payload["cube_bits"],
                        "base_core_size": payload["core_size"],
                        "base_leaf_path": str(path),
                        "base_leaf_sha256": sha256(path),
                        "base_stage": "level2",
                    }
                    previous = by_leaf.get(leaf)
                    if (
                        previous is None
                        or int(candidate["base_core_size"])
                        < int(previous["base_core_size"])
                    ):
                        by_leaf[leaf] = candidate
            selections[orbit] = [by_leaf[leaf] for leaf in sorted(by_leaf)]

    external_config_sha = None
    if args.external is not None:
        if args.level2 is None or level2_config_sha is None:
            raise ValueError("external replacement candidates require --level2")
        external_config_path = args.external / "run-config.json"
        external_config = json.loads(
            external_config_path.read_text(encoding="utf-8")
        )
        external_config_sha = sha256(external_config_path)
        if external_config.get("first_pass_run_config_sha256") != base_config_sha:
            raise ValueError("external input does not descend from this first pass")
        if external_config.get("level2_run_config_sha256") != level2_config_sha:
            raise ValueError("external input does not descend from this level two")
        for selected in external_config["selections"]:
            orbit = str(selected["orbit"])
            leaf = int(selected["leaf"])
            if orbit not in ORBITS:
                raise ValueError(f"unexpected external orbit: {orbit}")
            path = args.external / orbit / f"leaf-{leaf:03d}" / "result.json"
            if not path.exists():
                continue
            payload = json.loads(path.read_text(encoding="utf-8"))
            expected = {
                "schema": (
                    "p97-exact5-card13-external-selector-source-core-pilot-v1"
                ),
                "orbit": orbit,
                "leaf": leaf,
                "source_assertion_count": 58_433,
                "source_assertions_sha256": fingerprints[orbit],
                "cube": [
                    {key: item[key] for key in ("atom", "value", "assertion")}
                    for item in pilot.expected_cube_payload(leaf)
                ],
            }
            if any(payload.get(key) != value for key, value in expected.items()):
                raise ValueError(f"strict external candidate mismatch: {path}")
            if payload.get("external_status") == "SAT":
                raise RuntimeError(f"fail-closed SAT external candidate: {path}")
            if (
                payload.get("external_status") == "UNSAT"
                and payload.get("drat_trim_verified") is True
                and payload.get("source_packet_z3_recheck") == "UNSAT"
                and int(payload.get("core_source_assertion_count", 0))
                > args.threshold
            ):
                candidate = {
                    "leaf": leaf,
                    "cube_bits": selected["cube_bits"],
                    "base_core_size": payload["core_source_assertion_count"],
                    "base_leaf_path": str(path),
                    "base_leaf_sha256": sha256(path),
                    "base_stage": "external",
                }
                by_leaf = {
                    int(item["leaf"]): item for item in selections[orbit]
                }
                previous = by_leaf.get(leaf)
                if (
                    previous is None
                    or int(candidate["base_core_size"])
                    < int(previous["base_core_size"])
                ):
                    by_leaf[leaf] = candidate
                selections[orbit] = [by_leaf[key] for key in sorted(by_leaf)]

    args.output_dir.mkdir(parents=True, exist_ok=True)
    selection_manifest = {
        "schema": f"{SCHEMA}-selection",
        "epistemic_status": "EXACT_CHECKED_OVERSIZED_CORE_SELECTION",
        "first_pass": str(args.first_pass),
        "first_pass_run_config_sha256": base_config_sha,
        "level2": str(args.level2) if args.level2 is not None else None,
        "level2_run_config_sha256": level2_config_sha,
        "external": str(args.external) if args.external is not None else None,
        "external_run_config_sha256": external_config_sha,
        "threshold": args.threshold,
        "orbits": selections,
        "selected_count": sum(len(items) for items in selections.values()),
    }
    selection_path = args.output_dir / "selection.json"
    if selection_path.exists():
        if json.loads(selection_path.read_text(encoding="utf-8")) != selection_manifest:
            raise ValueError("oversized selection manifest drift")
    else:
        selection_path.write_text(
            json.dumps(selection_manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    print(json.dumps({
        "event": "oversized_selection",
        "selected": selection_manifest["selected_count"],
        "threshold": args.threshold,
    }, sort_keys=True), flush=True)
    if args.plan_only:
        return

    manifests: list[dict[str, object]] = []
    for orbit_index, orbit in enumerate(ORBITS):
        orbit_dir = args.output_dir / orbit
        orbit_dir.mkdir(parents=True, exist_ok=True)
        results: dict[int, dict[str, object]] = {}
        tasks: list[tuple[int, int, float, float, float, str, int, str]] = []
        for selected in selections[orbit]:
            leaf = int(selected["leaf"])
            seed = args.seed_base + orbit_index * 10_000 + leaf
            output = orbit_dir / f"leaf-{leaf:03d}.json"
            expected_settings = {
                "classify_seconds": args.classify_seconds,
                "core_seconds": args.core_seconds,
                "verify_seconds": args.verify_seconds,
                "core_minimize": True,
                "seed": seed,
            }
            if output.exists():
                if not args.resume:
                    raise FileExistsError(
                        f"existing replacement requires --resume: {output}"
                    )
                payload = json.loads(output.read_text(encoding="utf-8"))
                expected = {
                    "schema": SCHEMA,
                    "orbit": orbit,
                    "leaf": leaf,
                    "seed": seed,
                    "source_assertions_sha256": fingerprints[orbit],
                    "base_leaf_sha256": selected["base_leaf_sha256"],
                    "base_core_size": selected["base_core_size"],
                    "base_stage": selected["base_stage"],
                    "cube": pilot.expected_cube_payload(leaf),
                    "settings": expected_settings,
                }
                if any(payload.get(key) != value for key, value in expected.items()):
                    raise ValueError(f"strict replacement resume mismatch: {output}")
                if payload.get("classification_status") == "SAT":
                    raise RuntimeError(f"fail-closed SAT replacement: {output}")
                results[leaf] = payload
            else:
                tasks.append((
                    leaf,
                    seed,
                    args.classify_seconds,
                    args.core_seconds,
                    args.verify_seconds,
                    str(selected["base_leaf_sha256"]),
                    int(selected["base_core_size"]),
                    str(selected["base_stage"]),
                ))
        print(json.dumps({
            "event": "oversized_resume_audit",
            "orbit": orbit,
            "selected": len(selections[orbit]),
            "reused": len(results),
            "new": len(tasks),
        }, sort_keys=True), flush=True)
        if tasks:
            with concurrent.futures.ProcessPoolExecutor(
                max_workers=min(args.workers, len(tasks)),
                initializer=initialize_worker,
                initargs=(orbit, args.seed_base + orbit_index * 10_000),
            ) as pool:
                futures = {pool.submit(solve_leaf, task): task[0] for task in tasks}
                for future in concurrent.futures.as_completed(futures):
                    result = future.result()
                    leaf = int(result["leaf"])
                    output = orbit_dir / f"leaf-{leaf:03d}.json"
                    output.write_text(
                        json.dumps(result, indent=2, sort_keys=True) + "\n",
                        encoding="utf-8",
                    )
                    results[leaf] = result
                    print(json.dumps({
                        "event": "oversized_replacement_complete",
                        "orbit": orbit,
                        "leaf": leaf,
                        "base_core_size": result["base_core_size"],
                        "base_stage": result["base_stage"],
                        "core_size": result.get("core_size"),
                        "status": result["epistemic_status"],
                    }, sort_keys=True), flush=True)
                    if result["classification_status"] == "SAT":
                        raise RuntimeError(
                            f"fail-closed SAT replacement: {orbit} leaf {leaf}"
                        )

        manifest = {
            "schema": f"{SCHEMA}-manifest",
            "epistemic_status": (
                "ALL_OVERSIZED_CORES_HAVE_CHECKED_REPLACEMENTS"
                if len(results) == len(selections[orbit])
                and all(
                    item["epistemic_status"] == "CHECKED_MINIMIZED_REPLACEMENT_CORE"
                    for item in results.values()
                )
                else "OVERSIZED_CORE_REPLACEMENTS_INCOMPLETE"
            ),
            "orbit": orbit,
            "threshold": args.threshold,
            "selected_count": len(selections[orbit]),
            "completed_count": len(results),
            "replacements": [
                {
                    "leaf": leaf,
                    "cube_bits": result["cube_bits"],
                    "base_core_size": result["base_core_size"],
                    "base_stage": result["base_stage"],
                    "replacement_core_size": result.get("core_size"),
                    "status": result["epistemic_status"],
                }
                for leaf, result in sorted(results.items())
            ],
        }
        (orbit_dir / "manifest.json").write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        manifests.append(manifest)

    summary = {
        "schema": f"{SCHEMA}-summary",
        "epistemic_status": (
            "ALL_OVERSIZED_CORES_HAVE_CHECKED_REPLACEMENTS"
            if all(
                item["epistemic_status"]
                == "ALL_OVERSIZED_CORES_HAVE_CHECKED_REPLACEMENTS"
                for item in manifests
            )
            else "OVERSIZED_CORE_REPLACEMENTS_INCOMPLETE"
        ),
        "selection": str(selection_path),
        "manifests": manifests,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "status": summary["epistemic_status"],
        "output": str(args.output_dir / "summary.json"),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
