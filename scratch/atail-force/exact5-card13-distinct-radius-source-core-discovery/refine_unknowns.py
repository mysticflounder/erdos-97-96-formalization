#!/usr/bin/env python3
"""Level-2 source-cube retry for unresolved first-pass leaves.

The first-pass artifacts are immutable inputs.  This stage selects only leaves
whose classification was UNKNOWN or whose UNSAT classification did not yield a
checked source core.  Each selected leaf is rebuilt independently with a varied
seed, a fresh solver, and separate classification/core/recheck budgets.
"""

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


SCHEMA = "p97-exact5-card13-distinct-source-core-level2-v1"
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
    task: tuple[int, int, float, float, float, str, dict[str, object]]
) -> dict[str, object]:
    leaf, seed, classify_seconds, core_seconds, verify_seconds, base_sha, base = task
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
        "seed": seed,
    }
    payload: dict[str, object] = {
        "schema": SCHEMA,
        "epistemic_status": "LEVEL2_BOUNDED_SOURCE_LEAF_RESULT",
        "orbit": _ORBIT,
        "leaf": leaf,
        "seed": seed,
        "source_assertion_count": len(_ASSERTIONS),
        "source_assertions_sha256": _FINGERPRINT,
        "source_counts": _COUNTS,
        "base_leaf_sha256": base_sha,
        "base_classification_status": base["classification_status"],
        "base_core_extraction_status": base.get("core_extraction_status"),
        "cube": pilot.expected_cube_payload(leaf),
        "cube_bits": "".join("1" if value else "0" for value in values),
        "settings": settings,
    }

    # Fresh source solver: no learned state is shared with the first pass or
    # another level-2 leaf.
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
        payload["epistemic_status"] = "LEVEL2_CLASSIFICATION_UNKNOWN"
        payload["total_seconds"] = time.monotonic() - started
        return payload

    tracked = z3.Solver()
    tracked.set(timeout=max(1, int(1000 * core_seconds)), random_seed=seed)
    markers = [
        z3.Bool(f"level2_source_assertion_{index}")
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
        payload["epistemic_status"] = "LEVEL2_CORE_EXTRACTION_UNKNOWN"
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
            raise AssertionError(f"unexpected level-2 core item: {item.sexpr()}")
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
        "epistemic_status": (
            "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE"
            if verification == z3.unsat
            else "LEVEL2_SOURCE_CORE_RECHECK_UNKNOWN"
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


def validate_level2(
    path: Path,
    orbit: str,
    leaf: int,
    seed: int,
    fingerprint: str,
    base_sha: str,
    settings: dict[str, object],
) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    expected = {
        "schema": SCHEMA,
        "orbit": orbit,
        "leaf": leaf,
        "seed": seed,
        "source_assertion_count": 58_433,
        "source_assertions_sha256": fingerprint,
        "base_leaf_sha256": base_sha,
        "cube": pilot.expected_cube_payload(leaf),
        "settings": settings,
    }
    for key, value in expected.items():
        if payload.get(key) != value:
            raise ValueError(f"level-2 resume mismatch at {path} field {key}")
    status = payload.get("classification_status")
    if status == "SAT":
        raise RuntimeError(f"fail-closed SAT level-2 leaf already present: {path}")
    if status not in {"UNSAT", "UNKNOWN"}:
        raise ValueError(f"invalid level-2 classification at {path}")
    if status == "UNSAT" and payload.get("core_extraction_status") == "UNSAT":
        if payload.get("core_recheck_status") != "UNSAT":
            raise ValueError(f"unchecked level-2 source core at {path}")
    return payload


def unresolved_base_leaves(
    first_pass: Path,
    orbit: str,
    fingerprint: str,
    base_settings: dict[str, object],
    base_seed: int,
) -> list[tuple[int, Path, dict[str, object]]]:
    selected: list[tuple[int, Path, dict[str, object]]] = []
    for leaf in range(512):
        path = first_pass / orbit / f"leaf-{leaf:03d}.json"
        if not path.exists():
            raise FileNotFoundError(f"first-pass coverage incomplete: {path}")
        payload = pilot.validate_resumed_leaf(
            path,
            orbit,
            leaf,
            base_seed + leaf,
            fingerprint,
            base_settings,
        )
        if (
            payload["classification_status"] == "UNKNOWN"
            or payload.get("core_extraction_status") == "UNKNOWN"
        ):
            selected.append((leaf, path, payload))
    return selected


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--first-pass", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--orbit", choices=(*ORBITS, "both"), default="both")
    parser.add_argument("--workers", type=int, default=20)
    parser.add_argument("--seed-base", type=int, default=100_000)
    parser.add_argument("--classify-seconds", type=float, default=300.0)
    parser.add_argument("--core-seconds", type=float, default=300.0)
    parser.add_argument("--verify-seconds", type=float, default=300.0)
    parser.add_argument("--resume", action="store_true")
    parser.add_argument("--resume-dry-run", action="store_true")
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must lie in [1, 24]")
    if any(getattr(args, name) <= 0 for name in (
        "classify_seconds", "core_seconds", "verify_seconds"
    )):
        raise ValueError("all budgets must be positive")
    if args.resume_dry_run:
        args.resume = True
    return args


def main() -> None:
    args = parse_args()
    run_config = json.loads(
        (args.first_pass / "run-config.json").read_text(encoding="utf-8")
    )
    if run_config.get("schema") != f"{pilot.SCHEMA}-run-config":
        raise ValueError("unexpected first-pass run config")
    first_pass_sha = sha256(args.first_pass / "run-config.json")
    base_settings = {
        "solve_seconds": run_config["solve_seconds"],
        "core_seconds": run_config["core_seconds"],
        "verify_seconds": run_config["verify_seconds"],
        "core_minimize": run_config["core_minimize"],
    }
    fingerprints = {
        item["orbit"]: item["source_assertions_sha256"]
        for item in run_config["orbits"]
    }
    orbits = ORBITS if args.orbit == "both" else (args.orbit,)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    level2_config = {
        "schema": f"{SCHEMA}-run-config",
        "first_pass": str(args.first_pass),
        "first_pass_run_config_sha256": first_pass_sha,
        "orbits": [
            {"orbit": orbit, "source_assertions_sha256": fingerprints[orbit]}
            for orbit in orbits
        ],
        "seed_base": args.seed_base,
        "classify_seconds": args.classify_seconds,
        "core_seconds": args.core_seconds,
        "verify_seconds": args.verify_seconds,
    }
    level2_config_path = args.output_dir / "run-config.json"
    if level2_config_path.exists():
        if not args.resume:
            raise FileExistsError(
                f"existing level-2 config requires --resume: {level2_config_path}"
            )
        if json.loads(level2_config_path.read_text(encoding="utf-8")) != level2_config:
            raise ValueError("strict level-2 run-config mismatch")
    else:
        level2_config_path.write_text(
            json.dumps(level2_config, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    manifests: list[dict[str, object]] = []

    for orbit_index, orbit in enumerate(orbits):
        selected = unresolved_base_leaves(
            args.first_pass,
            orbit,
            fingerprints[orbit],
            base_settings,
            int(run_config["seed"]),
        )
        orbit_dir = args.output_dir / orbit
        orbit_dir.mkdir(parents=True, exist_ok=True)
        progress_path = orbit_dir / "progress.jsonl"
        results: dict[int, dict[str, object]] = {}
        tasks: list[
            tuple[int, int, float, float, float, str, dict[str, object]]
        ] = []
        for leaf, base_path, base_payload in selected:
            seed = args.seed_base + orbit_index * 10_000 + leaf
            settings = {
                "classify_seconds": args.classify_seconds,
                "core_seconds": args.core_seconds,
                "verify_seconds": args.verify_seconds,
                "seed": seed,
            }
            base_sha = sha256(base_path)
            output = orbit_dir / f"leaf-{leaf:03d}.json"
            if output.exists():
                if not args.resume:
                    raise FileExistsError(
                        f"existing level-2 leaf requires --resume: {output}"
                    )
                results[leaf] = validate_level2(
                    output,
                    orbit,
                    leaf,
                    seed,
                    fingerprints[orbit],
                    base_sha,
                    settings,
                )
            else:
                tasks.append((
                    leaf,
                    seed,
                    args.classify_seconds,
                    args.core_seconds,
                    args.verify_seconds,
                    base_sha,
                    base_payload,
                ))
        resume_event = {
            "event": "level2_resume_audit",
            "orbit": orbit,
            "first_pass_run_config_sha256": first_pass_sha,
            "selected": len(selected),
            "reused": len(results),
            "new": len(tasks),
        }
        with progress_path.open("a", encoding="utf-8") as stream:
            stream.write(json.dumps(resume_event, sort_keys=True) + "\n")
        print(json.dumps(resume_event, sort_keys=True), flush=True)
        if not args.resume_dry_run and tasks:
            if args.workers == 1 or len(tasks) == 1:
                initialize_worker(orbit, args.seed_base + orbit_index * 10_000)
                produced = (solve_leaf(task) for task in tasks)
                for result in produced:
                    leaf = int(result["leaf"])
                    output = orbit_dir / f"leaf-{leaf:03d}.json"
                    output.write_text(
                        json.dumps(result, indent=2, sort_keys=True) + "\n",
                        encoding="utf-8",
                    )
                    results[leaf] = result
                    if result["classification_status"] == "SAT":
                        raise RuntimeError(f"fail-closed SAT: {orbit} leaf {leaf}")
            else:
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
                        event = {
                            "event": "level2_leaf_complete",
                            "orbit": orbit,
                            "leaf": leaf,
                            "cube_bits": result["cube_bits"],
                            "classification_status": result["classification_status"],
                            "core_extraction_status": result.get(
                                "core_extraction_status"
                            ),
                            "core_recheck_status": result.get("core_recheck_status"),
                            "core_size": result.get("core_size"),
                            "total_seconds": result["total_seconds"],
                        }
                        with progress_path.open("a", encoding="utf-8") as stream:
                            stream.write(json.dumps(event, sort_keys=True) + "\n")
                        print(json.dumps(event, sort_keys=True), flush=True)
                        if result["classification_status"] == "SAT":
                            raise RuntimeError(
                                f"fail-closed SAT: {orbit} leaf {leaf}"
                            )

        persistent = []
        checked = 0
        for leaf, _base_path, _base_payload in selected:
            result = results.get(leaf)
            if result is None:
                continue
            if result["epistemic_status"] == "LEVEL2_CHECKED_SOURCE_ASSERTION_CORE":
                checked += 1
            else:
                persistent.append({
                    "leaf": leaf,
                    "cube_bits": result["cube_bits"],
                    "cube": result["cube"],
                    "classification_status": result["classification_status"],
                    "core_extraction_status": result.get("core_extraction_status"),
                    "core_recheck_status": result.get("core_recheck_status"),
                })
        manifest = {
            "schema": f"{SCHEMA}-manifest",
            "epistemic_status": (
                "LEVEL2_ALL_FIRST_PASS_UNKNOWNS_HAVE_CHECKED_SOURCE_CORES"
                if len(results) == len(selected) and not persistent
                else "LEVEL2_PERSISTENT_UNRESOLVED_SOURCE_CUBES"
            ),
            "orbit": orbit,
            "first_pass": str(args.first_pass),
            "first_pass_run_config_sha256": first_pass_sha,
            "selected_count": len(selected),
            "reused_count": len(results) - (len(tasks) if not args.resume_dry_run else 0),
            "completed_count": len(results),
            "checked_source_core_count": checked,
            "persistent_unresolved_count": len(persistent),
            "persistent_unresolved": persistent,
            "settings": {
                "workers": args.workers,
                "seed_base": args.seed_base,
                "classify_seconds": args.classify_seconds,
                "core_seconds": args.core_seconds,
                "verify_seconds": args.verify_seconds,
            },
        }
        (orbit_dir / "manifest.json").write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        manifests.append(manifest)

    summary = {
        "schema": f"{SCHEMA}-summary",
        "epistemic_status": (
            "LEVEL2_ALL_FIRST_PASS_UNKNOWNS_HAVE_CHECKED_SOURCE_CORES"
            if all(
                item["epistemic_status"]
                == "LEVEL2_ALL_FIRST_PASS_UNKNOWNS_HAVE_CHECKED_SOURCE_CORES"
                for item in manifests
            )
            else "LEVEL2_PERSISTENT_UNRESOLVED_SOURCE_CUBES"
        ),
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
