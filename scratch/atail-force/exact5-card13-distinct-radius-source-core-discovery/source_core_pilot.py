#!/usr/bin/env python3
"""Source-faithful cubing and source-assertion core extraction pilot.

This pilot deliberately does not consume DIMACS literals.  Its cube family is
the nine named source Boolean atoms that recur in the external march cubes:
``shell_5`` and ``g1_2_5`` through ``g1_2_12``.  Every leaf is therefore a
conjunction of expressions present before bit-blasting/Tseitin conversion.

For an UNSAT leaf, the script guards the original source assertions with
assumption markers, extracts their original zero-based indices, and then
independently rechecks the selected assertions together with the complete
source cube.  Only a successful independent recheck is reported as a checked
source core.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import time
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SURFACE_PATH = (
    ROOT
    / "scratch/atail-force/exact5-card13-distinct-radius-aggregate/surface.py"
)
PINNED_ATOM_NAMES = (
    "shell_5",
    "g1_2_5",
    "g1_2_6",
    "g1_2_7",
    "g1_2_8",
    "g1_2_9",
    "g1_2_10",
    "g1_2_11",
    "g1_2_12",
)
ORBITS = ("asymmetricSourceLeft", "asymmetricSourceRight")
SCHEMA = "p97-exact5-card13-distinct-source-core-pilot-v1"


def load_surface():
    spec = importlib.util.spec_from_file_location(
        "exact5_distinct_source_core_surface", SURFACE_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load {SURFACE_PATH}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def assertion_fingerprint(assertions: list[z3.BoolRef]) -> str:
    digest = hashlib.sha256()
    for assertion in assertions:
        encoded = assertion.sexpr().encode("utf-8")
        digest.update(len(encoded).to_bytes(8, "big"))
        digest.update(encoded)
    return digest.hexdigest()


def primitive_source_atoms(outer: Any) -> dict[str, z3.BoolRef]:
    """Return encoder-created primitive Boolean atoms, keyed by exact name."""
    expressions = [
        *outer.m.values(),
        *(atom for family in outer.cover for atom in family.values()),
        *outer.b1,
        *outer.shell,
        *outer.parent_first,
        *outer.parent_second,
    ]
    registry: dict[str, z3.BoolRef] = {}
    for expression in expressions:
        if not z3.is_bool(expression) or not z3.is_const(expression):
            raise AssertionError(f"non-Boolean/non-constant source atom: {expression}")
        if expression.decl().kind() != z3.Z3_OP_UNINTERPRETED:
            raise AssertionError(f"non-source declaration kind: {expression}")
        name = expression.decl().name()
        previous = registry.get(name)
        if previous is not None and not z3.eq(previous, expression):
            raise AssertionError(f"source atom name collision: {name}")
        registry[name] = expression
    return registry


def pinned_atoms(outer: Any) -> dict[str, z3.BoolRef]:
    registry = primitive_source_atoms(outer)
    missing = [name for name in PINNED_ATOM_NAMES if name not in registry]
    if missing:
        raise AssertionError(f"pinned source atoms absent from encoder: {missing}")
    selected = {name: registry[name] for name in PINNED_ATOM_NAMES}
    for name, atom in selected.items():
        if atom.sexpr() != name:
            raise AssertionError(
                f"pinned atom is not the exact named source constant: {name}"
            )
        if name.startswith("k!") or "!" in name:
            raise AssertionError(f"internal/Tseitin-like name rejected: {name}")
    return selected


def source_occurrences(
    assertions: list[z3.BoolRef], names: frozenset[str]
) -> dict[str, list[int]]:
    """Find source assertion indices containing each pinned primitive atom."""
    occurrences = {name: [] for name in names}
    for index, assertion in enumerate(assertions):
        found: set[str] = set()
        stack = [assertion]
        visited: set[int] = set()
        while stack:
            expression = stack.pop()
            expression_id = expression.get_id()
            if expression_id in visited:
                continue
            visited.add(expression_id)
            if (
                z3.is_const(expression)
                and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
            ):
                name = expression.decl().name()
                if name in names:
                    found.add(name)
            stack.extend(expression.children())
        for name in found:
            occurrences[name].append(index)
    absent = [name for name, indices in occurrences.items() if not indices]
    if absent:
        raise AssertionError(f"pinned atoms unused by source assertions: {absent}")
    return occurrences


def assignment_for_leaf(leaf: int) -> tuple[bool, ...]:
    width = len(PINNED_ATOM_NAMES)
    if not 0 <= leaf < 2**width:
        raise ValueError(f"leaf index outside [0, {2**width}): {leaf}")
    return tuple(bool((leaf >> (width - 1 - bit)) & 1) for bit in range(width))


def cube_literals(
    atoms: dict[str, z3.BoolRef], values: tuple[bool, ...]
) -> list[z3.BoolRef]:
    return [
        atoms[name] if value else z3.Not(atoms[name])
        for name, value in zip(PINNED_ATOM_NAMES, values, strict=True)
    ]


def status_name(status: z3.CheckSatResult) -> str:
    return str(status).upper()


_WORKER_OUTER: Any | None = None
_WORKER_ASSERTIONS: list[z3.BoolRef] | None = None
_WORKER_ATOMS: dict[str, z3.BoolRef] | None = None
_WORKER_COUNTS: dict[str, object] | None = None
_WORKER_FINGERPRINT: str | None = None
_WORKER_ORBIT: str | None = None


def initialize_worker(orbit: str, seed: int) -> None:
    global _WORKER_OUTER
    global _WORKER_ASSERTIONS
    global _WORKER_ATOMS
    global _WORKER_COUNTS
    global _WORKER_FINGERPRINT
    global _WORKER_ORBIT
    surface = load_surface()
    outer, _rank, counts = surface.build(orbit, seed)
    assertions = list(outer.solver.assertions())
    if len(assertions) != 58_433:
        raise AssertionError(
            f"source assertion count drift: expected 58433, got {len(assertions)}"
        )
    atoms = pinned_atoms(outer)
    _WORKER_OUTER = outer
    _WORKER_ASSERTIONS = assertions
    _WORKER_ATOMS = atoms
    _WORKER_COUNTS = counts
    _WORKER_FINGERPRINT = assertion_fingerprint(assertions)
    _WORKER_ORBIT = orbit


def solve_leaf(task: tuple[int, int, float, float, float, bool]) -> dict[str, object]:
    leaf, seed, solve_seconds, core_seconds, verify_seconds, minimize = task
    if (
        _WORKER_OUTER is None
        or _WORKER_ASSERTIONS is None
        or _WORKER_ATOMS is None
        or _WORKER_COUNTS is None
        or _WORKER_FINGERPRINT is None
        or _WORKER_ORBIT is None
    ):
        raise AssertionError("worker was not initialized")
    started = time.monotonic()
    values = assignment_for_leaf(leaf)
    cube = cube_literals(_WORKER_ATOMS, values)

    # Fast classification on the unmodified source formula.
    source_solver = _WORKER_OUTER.solver
    source_solver.push()
    source_solver.set(
        timeout=max(1, int(1000 * solve_seconds)), random_seed=seed
    )
    source_solver.add(*cube)
    classification = source_solver.check()
    classification_reason = (
        source_solver.reason_unknown() if classification == z3.unknown else None
    )
    decoded = None
    if classification == z3.sat:
        decoded = _WORKER_OUTER.decode(source_solver.model())
    source_solver.pop()
    classified = time.monotonic()

    payload: dict[str, object] = {
        "schema": SCHEMA,
        "epistemic_status": "BOUNDED_SOURCE_LEAF_RESULT",
        "orbit": _WORKER_ORBIT,
        "leaf": leaf,
        "seed": seed,
        "source_assertion_count": len(_WORKER_ASSERTIONS),
        "source_assertions_sha256": _WORKER_FINGERPRINT,
        "source_counts": _WORKER_COUNTS,
        "cube": [
            {
                "atom": name,
                "value": value,
                "assertion": literal.sexpr(),
                "origin": "PINNED_PRE_BITBLAST_SOURCE_BOOL",
            }
            for name, value, literal in zip(
                PINNED_ATOM_NAMES, values, cube, strict=True
            )
        ],
        "classification_status": status_name(classification),
        "classification_reason_unknown": classification_reason,
        "classification_seconds": classified - started,
        "settings": {
            "solve_seconds": solve_seconds,
            "core_seconds": core_seconds,
            "verify_seconds": verify_seconds,
            "core_minimize": minimize,
        },
    }
    if decoded is not None:
        payload["decoded_source_model"] = decoded
    if classification != z3.unsat:
        payload["total_seconds"] = time.monotonic() - started
        return payload

    # Guard only the original source assertions.  Submit the cube literals as
    # assumptions too, so Z3 can omit source split facts that the leaf proof
    # does not actually use.
    tracked = z3.Solver()
    options: dict[str, object] = {
        "timeout": max(1, int(1000 * core_seconds)),
        "random_seed": seed,
    }
    if minimize:
        options["core.minimize"] = True
    tracked.set(**options)
    markers = [
        z3.Bool(f"source_assertion_{index}")
        for index in range(len(_WORKER_ASSERTIONS))
    ]
    tracked.add(*(
        z3.Implies(marker, assertion)
        for marker, assertion in zip(
            markers, _WORKER_ASSERTIONS, strict=True
        )
    ))
    extraction = tracked.check(*markers, *cube)
    extracted = time.monotonic()
    payload["core_extraction_status"] = status_name(extraction)
    payload["core_extraction_reason_unknown"] = (
        tracked.reason_unknown() if extraction == z3.unknown else None
    )
    payload["core_extraction_seconds"] = extracted - classified
    if extraction != z3.unsat:
        payload["total_seconds"] = time.monotonic() - started
        return payload

    by_name = {
        marker.decl().name(): index for index, marker in enumerate(markers)
    }
    cube_by_sexpr = {literal.sexpr(): literal for literal in cube}
    core_indices: list[int] = []
    selected_cube: list[z3.BoolRef] = []
    for item in tracked.unsat_core():
        if z3.is_const(item) and item.decl().name() in by_name:
            core_indices.append(by_name[item.decl().name()])
        elif item.sexpr() in cube_by_sexpr:
            selected_cube.append(cube_by_sexpr[item.sexpr()])
        else:
            raise AssertionError(
                f"non-source marker/literal in UNSAT core: {item.sexpr()}"
            )
    core_indices = sorted(set(core_indices))
    selected_cube_by_sexpr = {
        literal.sexpr(): literal for literal in selected_cube
    }
    selected_cube = [
        literal
        for literal in cube
        if literal.sexpr() in selected_cube_by_sexpr
    ]
    core = [
        {
            "index": index,
            "assertion": _WORKER_ASSERTIONS[index].sexpr(),
        }
        for index in core_indices
    ]

    # Independent replay: no tracked implications or cached solver state.
    replay = z3.Solver()
    replay.set(timeout=max(1, int(1000 * verify_seconds)), random_seed=seed)
    replay.add(*selected_cube)
    replay.add(*(_WORKER_ASSERTIONS[index] for index in core_indices))
    verification = replay.check()
    verified = time.monotonic()
    payload.update({
        "core_size": len(core),
        "core": core,
        "core_cube_size": len(selected_cube),
        "core_cube_literals": [literal.sexpr() for literal in selected_cube],
        "core_recheck_status": status_name(verification),
        "core_recheck_reason_unknown": (
            replay.reason_unknown() if verification == z3.unknown else None
        ),
        "core_recheck_seconds": verified - extracted,
        "epistemic_status": (
            "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE"
            if verification == z3.unsat
            else "UNCHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE"
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


def build_plan(orbit: str, seed: int) -> dict[str, object]:
    started = time.monotonic()
    surface = load_surface()
    outer, _rank, counts = surface.build(orbit, seed)
    assertions = list(outer.solver.assertions())
    atoms = pinned_atoms(outer)
    occurrences = source_occurrences(assertions, frozenset(atoms))
    return {
        "orbit": orbit,
        "source_assertion_count": len(assertions),
        "source_assertions_sha256": assertion_fingerprint(assertions),
        "source_counts": counts,
        "cube_atoms": [
            {
                "name": name,
                "sexpr": atoms[name].sexpr(),
                "source_assertion_occurrence_count": len(occurrences[name]),
                "first_source_assertion_indices": occurrences[name][:8],
            }
            for name in PINNED_ATOM_NAMES
        ],
        "cube_width": len(PINNED_ATOM_NAMES),
        "complete_leaf_count": 2 ** len(PINNED_ATOM_NAMES),
        "coverage": (
            "all assignments to the pinned pre-bitblast source Boolean atoms"
        ),
        "build_seconds": time.monotonic() - started,
    }


def selected_leaves(start: int, smoke_leaves: int | None) -> tuple[int, ...]:
    total = 2 ** len(PINNED_ATOM_NAMES)
    count = total - start if smoke_leaves is None else smoke_leaves
    if count < 1:
        raise ValueError("at least one leaf must be selected")
    if not 0 <= start < total or start + count > total:
        raise ValueError(f"selected leaf interval is outside [0, {total})")
    return tuple(range(start, start + count))


def expected_cube_payload(leaf: int) -> list[dict[str, object]]:
    values = assignment_for_leaf(leaf)
    return [
        {
            "atom": name,
            "value": value,
            "assertion": name if value else f"(not {name})",
            "origin": "PINNED_PRE_BITBLAST_SOURCE_BOOL",
        }
        for name, value in zip(PINNED_ATOM_NAMES, values, strict=True)
    ]


def validate_resumed_leaf(
    path: Path,
    orbit: str,
    leaf: int,
    seed: int,
    source_fingerprint: str,
    settings: dict[str, object],
) -> dict[str, object]:
    """Fail closed unless an existing leaf matches the exact current job."""
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as error:
        raise ValueError(f"invalid resume artifact {path}: {error}") from error
    expected_scalars = {
        "schema": SCHEMA,
        "orbit": orbit,
        "leaf": leaf,
        "seed": seed,
        "source_assertion_count": 58_433,
        "source_assertions_sha256": source_fingerprint,
        "settings": settings,
        "cube": expected_cube_payload(leaf),
    }
    for key, expected in expected_scalars.items():
        if payload.get(key) != expected:
            raise ValueError(
                f"resume artifact mismatch at {path} field {key}: "
                f"expected {expected!r}, got {payload.get(key)!r}"
            )
    status = payload.get("classification_status")
    if status not in {"SAT", "UNSAT", "UNKNOWN"}:
        raise ValueError(f"invalid classification status in {path}: {status!r}")
    if status == "SAT":
        raise RuntimeError(f"fail-closed SAT leaf already present: {path}")
    if not isinstance(payload.get("total_seconds"), (int, float)):
        raise ValueError(f"missing elapsed time in {path}")
    if status == "UNSAT":
        extraction = payload.get("core_extraction_status")
        if extraction not in {"UNSAT", "UNKNOWN"}:
            raise ValueError(
                f"invalid/missing core extraction status in {path}: {extraction!r}"
            )
        if extraction == "UNSAT":
            if payload.get("core_recheck_status") != "UNSAT":
                raise ValueError(f"UNSAT core was not independently rechecked: {path}")
            core = payload.get("core")
            if not isinstance(core, list) or not core:
                raise ValueError(f"missing source core in {path}")
            seen_indices: set[int] = set()
            for item in core:
                if not isinstance(item, dict):
                    raise ValueError(f"malformed source core item in {path}")
                index = item.get("index")
                sexpr = item.get("assertion")
                if (
                    not isinstance(index, int)
                    or not 0 <= index < 58_433
                    or index in seen_indices
                    or not isinstance(sexpr, str)
                    or not sexpr
                ):
                    raise ValueError(f"malformed source core entry in {path}: {item!r}")
                seen_indices.add(index)
            full_cube = {
                str(item["assertion"]) for item in expected_cube_payload(leaf)
            }
            core_cube = payload.get("core_cube_literals")
            if (
                not isinstance(core_cube, list)
                or any(
                    not isinstance(item, str) or item not in full_cube
                    for item in core_cube
                )
                or len(core_cube) != len(set(core_cube))
            ):
                raise ValueError(f"malformed source cube core in {path}")
    return payload


def run_orbit(
    orbit: str,
    leaves: tuple[int, ...],
    output_dir: Path,
    workers: int,
    seed: int,
    solve_seconds: float,
    core_seconds: float,
    verify_seconds: float,
    minimize: bool,
    source_fingerprint: str,
    resume: bool,
    resume_dry_run: bool,
) -> dict[str, object]:
    orbit_dir = output_dir / orbit
    orbit_dir.mkdir(parents=True, exist_ok=True)
    progress_path = orbit_dir / "progress.jsonl"

    def log_progress(event: dict[str, object]) -> None:
        with progress_path.open("a", encoding="utf-8") as stream:
            stream.write(json.dumps(event, sort_keys=True) + "\n")

    all_tasks = tuple(
        (
            leaf,
            seed + leaf,
            solve_seconds,
            core_seconds,
            verify_seconds,
            minimize,
        )
        for leaf in leaves
    )
    results: dict[int, dict[str, object]] = {}
    settings: dict[str, object] = {
        "solve_seconds": solve_seconds,
        "core_seconds": core_seconds,
        "verify_seconds": verify_seconds,
        "core_minimize": minimize,
    }
    tasks: list[tuple[int, int, float, float, float, bool]] = []
    reused = 0
    for task in all_tasks:
        leaf = task[0]
        path = orbit_dir / f"leaf-{leaf:03d}.json"
        if path.exists():
            if not resume:
                raise FileExistsError(
                    f"existing leaf requires explicit --resume: {path}"
                )
            results[leaf] = validate_resumed_leaf(
                path,
                orbit,
                leaf,
                task[1],
                source_fingerprint,
                settings,
            )
            reused += 1
        else:
            tasks.append(task)
    print(json.dumps({
        "orbit": orbit,
        "resume": resume,
        "resume_dry_run": resume_dry_run,
        "selected": len(all_tasks),
        "reused": reused,
        "new": len(tasks),
    }, sort_keys=True), flush=True)
    log_progress({
        "event": "resume_audit",
        "orbit": orbit,
        "resume": resume,
        "resume_dry_run": resume_dry_run,
        "selected": len(all_tasks),
        "reused": reused,
        "new": len(tasks),
        "settings": settings,
        "source_assertions_sha256": source_fingerprint,
    })
    if resume_dry_run:
        return {
            "schema": f"{SCHEMA}-resume-dry-run",
            "epistemic_status": "STRICT_RESUME_AUDIT_ONLY",
            "orbit": orbit,
            "selected_leaf_count": len(all_tasks),
            "reused_leaf_count": reused,
            "new_leaf_count": len(tasks),
        }

    def save(result: dict[str, object]) -> None:
        leaf = int(result["leaf"])
        results[leaf] = result
        leaf_path = orbit_dir / f"leaf-{leaf:03d}.json"
        leaf_path.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        print(json.dumps({
            "orbit": orbit,
            "leaf": leaf,
            "classification": result["classification_status"],
            "core_extraction": result.get("core_extraction_status"),
            "core_recheck": result.get("core_recheck_status"),
            "core_size": result.get("core_size"),
            "total_seconds": result["total_seconds"],
        }, sort_keys=True), flush=True)
        log_progress({
            "event": "leaf_complete",
            "orbit": orbit,
            "leaf": leaf,
            "classification_status": result["classification_status"],
            "core_extraction_status": result.get("core_extraction_status"),
            "core_recheck_status": result.get("core_recheck_status"),
            "core_size": result.get("core_size"),
            "total_seconds": result["total_seconds"],
        })
        if result["classification_status"] == "SAT":
            raise RuntimeError(
                f"fail-closed SAT source leaf: {orbit} leaf {leaf}"
            )

    # The sequential path avoids the host semaphore dependency for local smoke.
    if not tasks:
        pass
    elif workers == 1 or len(tasks) == 1:
        initialize_worker(orbit, seed)
        for task in tasks:
            save(solve_leaf(task))
    else:
        with concurrent.futures.ProcessPoolExecutor(
            max_workers=min(workers, len(tasks)),
            initializer=initialize_worker,
            initargs=(orbit, seed),
        ) as pool:
            futures = {pool.submit(solve_leaf, task): task[0] for task in tasks}
            for future in concurrent.futures.as_completed(futures):
                result = future.result()
                save(result)

    ordered = [results[leaf] for leaf in leaves]
    status_counts: dict[str, int] = {}
    checked_cores = 0
    for result in ordered:
        status = str(result["classification_status"])
        status_counts[status] = status_counts.get(status, 0) + 1
        if (
            result["epistemic_status"]
            == "CHECKED_SOURCE_ASSERTION_CORE_UNDER_PINNED_SOURCE_CUBE"
        ):
            checked_cores += 1
    complete = len(leaves) == 2 ** len(PINNED_ATOM_NAMES)
    manifest = {
        "schema": f"{SCHEMA}-manifest",
        "epistemic_status": (
            "EXACT_SOURCE_CUBE_COVER_WITH_CHECKED_LEAF_CORES"
            if complete and checked_cores == len(leaves)
            else (
                "COMPLETE_SOURCE_CUBE_CLASSIFICATION_WITH_UNRESOLVED_LEAVES"
                if complete
                else "PILOT_ONLY_NOT_A_COMPLETE_COVERAGE_RESULT"
            )
        ),
        "orbit": orbit,
        "cube_atoms": list(PINNED_ATOM_NAMES),
        "complete_cube_leaf_count": 2 ** len(PINNED_ATOM_NAMES),
        "selected_leaves": list(leaves),
        "selected_leaf_count": len(leaves),
        "complete_coverage": complete,
        "classification_status_counts": status_counts,
        "checked_source_core_count": checked_cores,
        "reused_leaf_count": reused,
        "new_leaf_count": len(tasks),
        "workers": workers,
        "solve_seconds": solve_seconds,
        "core_seconds": core_seconds,
        "verify_seconds": verify_seconds,
        "core_minimize": minimize,
        "leaves": [
            {
                "leaf": result["leaf"],
                "path": f"leaf-{int(result['leaf']):03d}.json",
                "classification_status": result["classification_status"],
                "epistemic_status": result["epistemic_status"],
                "core_size": result.get("core_size"),
            }
            for result in ordered
        ],
    }
    (orbit_dir / "manifest.json").write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    return manifest


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--orbit", choices=(*ORBITS, "both"), default="both"
    )
    parser.add_argument("--output-dir", type=Path)
    parser.add_argument("--plan-only", action="store_true")
    parser.add_argument(
        "--smoke-leaves",
        type=int,
        help="run only this many consecutive leaves; omission means all 512",
    )
    parser.add_argument("--leaf-start", type=int, default=0)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument("--solve-seconds", type=float, default=30.0)
    parser.add_argument("--core-seconds", type=float, default=120.0)
    parser.add_argument("--verify-seconds", type=float, default=30.0)
    parser.add_argument("--core-minimize", action="store_true")
    parser.add_argument(
        "--resume",
        action="store_true",
        help="strictly validate and reuse exact matching leaf artifacts",
    )
    parser.add_argument(
        "--resume-dry-run",
        action="store_true",
        help="audit reusable/missing leaves without submitting work",
    )
    args = parser.parse_args()
    if not 1 <= args.workers <= 24:
        raise ValueError("workers must lie in [1, 24]")
    for name in ("solve_seconds", "core_seconds", "verify_seconds"):
        if getattr(args, name) <= 0:
            raise ValueError(f"{name.replace('_', '-')} must be positive")
    if not args.plan_only and args.output_dir is None:
        parser.error("--output-dir is required unless --plan-only is used")
    if args.resume_dry_run:
        args.resume = True
    return args


def main() -> None:
    args = parse_args()
    orbits = ORBITS if args.orbit == "both" else (args.orbit,)
    plans = [build_plan(orbit, args.seed) for orbit in orbits]
    plan_payload = {
        "schema": f"{SCHEMA}-plan",
        "epistemic_status": "SOURCE_CUBE_ARCHITECTURE_PLAN_ONLY",
        "surface_path": str(SURFACE_PATH.relative_to(ROOT)),
        "cube_origin": "EXPLICITLY_PINNED_PRE_BITBLAST_SOURCE_BOOL_ATOMS",
        "tseitin_or_dimacs_literals_allowed": False,
        "orbits": plans,
    }
    print(json.dumps(plan_payload, indent=2, sort_keys=True), flush=True)
    if args.plan_only:
        return

    leaves = selected_leaves(args.leaf_start, args.smoke_leaves)
    assert args.output_dir is not None
    args.output_dir.mkdir(parents=True, exist_ok=True)
    run_config = {
        "schema": f"{SCHEMA}-run-config",
        "orbits": [
            {
                "orbit": plan["orbit"],
                "source_assertion_count": plan["source_assertion_count"],
                "source_assertions_sha256": plan["source_assertions_sha256"],
            }
            for plan in plans
        ],
        "cube_atoms": list(PINNED_ATOM_NAMES),
        "selected_leaves": list(leaves),
        "seed": args.seed,
        "solve_seconds": args.solve_seconds,
        "core_seconds": args.core_seconds,
        "verify_seconds": args.verify_seconds,
        "core_minimize": args.core_minimize,
    }
    config_path = args.output_dir / "run-config.json"
    if config_path.exists():
        if not args.resume:
            raise FileExistsError(
                f"existing run config requires explicit --resume: {config_path}"
            )
        existing_config = json.loads(config_path.read_text(encoding="utf-8"))
        if existing_config != run_config:
            raise ValueError(
                f"strict resume run-config mismatch at {config_path}"
            )
    else:
        config_path.write_text(
            json.dumps(run_config, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    manifests = [
        run_orbit(
            orbit,
            leaves,
            args.output_dir,
            args.workers,
            args.seed,
            args.solve_seconds,
            args.core_seconds,
            args.verify_seconds,
            args.core_minimize,
            str(next(
                plan["source_assertions_sha256"]
                for plan in plans
                if plan["orbit"] == orbit
            )),
            args.resume,
            args.resume_dry_run,
        )
        for orbit in orbits
    ]
    summary = {
        "schema": f"{SCHEMA}-summary",
        "epistemic_status": (
            "PILOT_ONLY_NOT_A_COMPLETE_COVERAGE_RESULT"
            if args.smoke_leaves is not None
            else (
                "EXACT_SOURCE_CUBE_COVER_WITH_CHECKED_LEAF_CORES"
                if all(
                    item["epistemic_status"]
                    == "EXACT_SOURCE_CUBE_COVER_WITH_CHECKED_LEAF_CORES"
                    for item in manifests
                )
                else "INCOMPLETE_SOURCE_CUBE_COVER"
            )
        ),
        "cube_atoms": list(PINNED_ATOM_NAMES),
        "selected_leaves": list(leaves),
        "manifests": manifests,
    }
    (args.output_dir / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        "output": str(args.output_dir),
        "status": summary["epistemic_status"],
        "selected_leaf_count_per_orbit": len(leaves),
    }, sort_keys=True), flush=True)


if __name__ == "__main__":
    main()
