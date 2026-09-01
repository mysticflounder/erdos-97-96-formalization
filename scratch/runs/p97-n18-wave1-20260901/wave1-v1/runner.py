#!/usr/bin/env python3
"""Bounded exploratory generic A-ROW census at k=4, n=18.

This runner is intentionally not a Card18 decision procedure.  It enumerates
models of the generic labelled A-ROW incidence surface, optionally adding the
proved DUAL2 constraint and/or the conditional
MINIMAL-FAITHFUL-CONSEQUENCE lazy SCC cuts.  It makes no metric-realizability
claim.  Only a fresh, proof-producing UNSAT replay whose DRAT proof is accepted
by drat-trim receives status COMPLETE_UNSAT, and that status applies only to the
exact finite CNF recorded here.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import os
import shlex
import shutil
import stat
import subprocess
import sys
import tempfile
from collections import Counter
from pathlib import Path
from typing import Any, Iterable, Mapping, Sequence


RUN_ROOT = Path(__file__).resolve().parent
REPO_ROOT = RUN_ROOT.parents[3]
SEARCH_ROOT = REPO_ROOT / "census" / "p97_search"
if str(SEARCH_ROOT) not in sys.path:
    sys.path.insert(0, str(SEARCH_ROOT))

from cells import Cell  # noqa: E402
from sat_generate import (  # noqa: E402
    Phase3Error,
    SatEncoding,
    run_cadical,
    run_drat_trim,
)


SCHEMA = "p97-generic-arow-n18-wave1-runner/v1"
CELL = Cell(k=4, n=18, profile=None, exact=True)
GUARD_NAME = "MINIMAL-FAITHFUL-CONSEQUENCE"
MODE_CONFIG = {
    "baseline": {"static_dual2": False, "scc": False},
    "dual2": {"static_dual2": True, "scc": False},
    "scc": {"static_dual2": False, "scc": True},
    "dual2_scc": {"static_dual2": True, "scc": True},
}
EXPECTED_COUNTS = {
    False: {"variables": 306, "clauses": 209_304},
    True: {"variables": 306, "clauses": 294_984},
}
EXPECTED_TAG_COUNTS = {
    False: {
        "S-D1": 0,
        "S-EXACT": 123_624,
        "S-CIRC2": 85_680,
        "B-TOTAL": 0,
        "B-MEM": 0,
        "B-INDEG": 0,
        "CAP-TOTAL": 0,
        "CAP-PROFILE": 0,
        "DUAL2": 0,
        "S-MINCUT": 0,
    },
    True: {
        "S-D1": 0,
        "S-EXACT": 123_624,
        "S-CIRC2": 85_680,
        "B-TOTAL": 0,
        "B-MEM": 0,
        "B-INDEG": 0,
        "CAP-TOTAL": 0,
        "CAP-PROFILE": 0,
        "DUAL2": 85_680,
        "S-MINCUT": 0,
    },
}
PROTECTED_OUTPUTS = {
    Path(__file__).resolve(),
    (RUN_ROOT / "run_manifest.json").resolve(),
}


def canonical_json_bytes(value: Any, *, pretty: bool = True) -> bytes:
    if pretty:
        text = json.dumps(value, indent=2, sort_keys=True) + "\n"
    else:
        text = json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n"
    return text.encode("utf-8")


def confined_directory(path: Path, *, require_empty: bool = False) -> None:
    """Create/check a real directory below RUN_ROOT without following links."""

    root = RUN_ROOT.resolve(strict=True)
    try:
        relative = path.relative_to(root)
    except ValueError as exc:
        raise Phase3Error(f"output directory escapes run root: {path}") from exc
    require(".." not in relative.parts, f"output directory contains '..': {path}")
    current = root
    for part in relative.parts:
        current = current / part
        if current.exists() or current.is_symlink():
            info = os.lstat(current)
            require(not stat.S_ISLNK(info.st_mode), f"output directory is symlink: {current}")
            require(stat.S_ISDIR(info.st_mode), f"output parent is not a directory: {current}")
        else:
            current.mkdir()
    if require_empty:
        entries = sorted(item.name for item in current.iterdir())
        require(
            not entries,
            f"stale or unexpected per-mode artifacts at {current}: {entries}",
        )


def validate_output_path(path: Path) -> None:
    root = RUN_ROOT.resolve(strict=True)
    confined_directory(path.parent)
    try:
        path.relative_to(root)
    except ValueError as exc:
        raise Phase3Error(f"output path escapes run root: {path}") from exc
    require(path.resolve(strict=False).parent == path.parent.resolve(strict=True),
            f"output path resolves through an unexpected link: {path}")
    require(path.resolve(strict=False) not in PROTECTED_OUTPUTS,
            f"refusing to overwrite protected file: {path}")
    if path.exists() or path.is_symlink():
        info = os.lstat(path)
        require(not stat.S_ISLNK(info.st_mode), f"output is symlink: {path}")
        require(stat.S_ISREG(info.st_mode), f"output is not a regular file: {path}")
        require(info.st_nlink == 1, f"output has hard links: {path}")


def atomic_bytes(path: Path, data: bytes) -> None:
    validate_output_path(path)
    fd, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "wb") as handle:
            handle.write(data)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
        info = os.lstat(path)
        require(stat.S_ISREG(info.st_mode), f"written output is not regular: {path}")
        require(info.st_nlink == 1, f"written output unexpectedly has hard links: {path}")
    except BaseException:
        try:
            os.unlink(temporary)
        except OSError:
            pass
        raise


def atomic_json(path: Path, value: Any) -> None:
    atomic_bytes(path, canonical_json_bytes(value))


def atomic_text(path: Path, value: str) -> None:
    atomic_bytes(path, value.encode("utf-8"))


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def require(condition: bool, message: str) -> None:
    if not condition:
        raise Phase3Error(message)


def command_first_line(command: Sequence[str]) -> str:
    try:
        result = subprocess.run(
            list(command), capture_output=True, text=True, timeout=10, check=False
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return f"unavailable: {exc}"
    text = (result.stdout + "\n" + result.stderr).strip()
    return text.splitlines()[0] if text else f"exit {result.returncode}"


def git_bytes(arguments: Sequence[str]) -> bytes:
    result = subprocess.run(
        ["git", *arguments], cwd=REPO_ROOT, capture_output=True, check=False
    )
    require(
        result.returncode == 0,
        f"git {' '.join(arguments)} failed with exit {result.returncode}",
    )
    return result.stdout


def executable_metadata(name: str, version_arguments: Sequence[str]) -> dict[str, Any]:
    resolved = shutil.which(name)
    if resolved is None:
        return {"path": None, "sha256": None, "version": "unavailable"}
    path = Path(resolved).resolve(strict=True)
    info = os.lstat(path)
    require(stat.S_ISREG(info.st_mode), f"backend is not a regular file: {path}")
    return {
        "path": str(path),
        "sha256": sha256_file(path),
        "version": command_first_line([str(path), *version_arguments]),
    }


def source_metadata() -> dict[str, Any]:
    source_paths = (
        SEARCH_ROOT / "cells.py",
        SEARCH_ROOT / "sat_generate.py",
        Path(__file__).resolve(),
    )
    head = git_bytes(["rev-parse", "HEAD"]).decode("ascii").strip()
    dirty_status = git_bytes(["status", "--porcelain=v1", "--untracked-files=all"])
    return {
        "source_head": head,
        "git": {
            "head": head,
            "dirty": bool(dirty_status),
            "dirty_entry_count": len(dirty_status.splitlines()),
            "dirty_status_sha256": sha256_bytes(dirty_status),
            "dirty_status_format": "git status --porcelain=v1 --untracked-files=all",
        },
        "direct_file_digests": {
            "classification": (
                "direct-file SHA-256 only; non-transitive and not a bank source_manifest"
            ),
            "sha256": {
                str(path.relative_to(REPO_ROOT)): sha256_file(path)
                for path in source_paths
            },
        },
        "custody_nonclaim": (
            "These direct-file digests do not authenticate transitive imports, a bank, "
            "or source-to-finite theorem custody."
        ),
        "backends": {
            "cadical": executable_metadata("cadical", ["--version"]),
            "drat-trim": executable_metadata("drat-trim", []),
        },
    }


def clause_value(clause: Sequence[int], assignment: Mapping[int, bool]) -> bool:
    return any(
        assignment[abs(literal)] if literal > 0 else not assignment[abs(literal)]
        for literal in clause
    )


def all_clauses_hold(
    clauses: Iterable[Sequence[int]], assignment: Mapping[int, bool]
) -> bool:
    return all(clause_value(clause, assignment) for clause in clauses)


def rows_assignment(
    encoding: SatEncoding, rows: Sequence[Sequence[int]], guard_var: int | None = None
) -> dict[int, bool]:
    assignment: dict[int, bool] = {}
    row_sets = [set(row) for row in rows]
    for center in range(CELL.n):
        for point in range(CELL.n):
            if center != point:
                assignment[encoding.var("s", center, point)] = (
                    point in row_sets[center]
                )
    if guard_var is not None:
        assignment[guard_var] = True
    return assignment


def normalize_solver_assignment(
    encoding: SatEncoding,
    raw_assignment: Mapping[int, bool],
    guard_var: int | None,
) -> tuple[dict[int, bool], bool]:
    assignment = dict(raw_assignment)
    out_of_range = sorted(
        variable
        for variable in assignment
        if variable < 1 or variable > encoding.num_vars
    )
    if out_of_range:
        raise Phase3Error(
            f"solver model contains out-of-range variables: {out_of_range[:5]}"
        )
    missing_semantic = [
        variable for variable in encoding.semantic_vars if variable not in assignment
    ]
    if missing_semantic:
        raise Phase3Error(
            "solver model omitted semantic variables: "
            f"count={len(missing_semantic)}, first={missing_semantic[:5]}"
        )
    guard_inferred = False
    if guard_var is not None and guard_var not in assignment:
        # The unit clause fixes the only nonsemantic variable, so this is a
        # checked reconstruction rather than an arbitrary model completion.
        assignment[guard_var] = True
        guard_inferred = True
    missing = [
        variable for variable in range(1, encoding.num_vars + 1)
        if variable not in assignment
    ]
    if missing:
        raise Phase3Error(
            f"solver model omitted variables after guard reconstruction: {missing[:5]}"
        )
    return assignment, guard_inferred


def rows_from_node(node: Any) -> list[list[int]]:
    return [sorted(node.shell(center)) for center in range(node.n)]


def strongly_connected_components(rows: Sequence[Sequence[int]]) -> list[list[int]]:
    n = len(rows)
    adjacency = [sorted(row) for row in rows]
    reverse = [[] for _ in range(n)]
    for source, targets in enumerate(adjacency):
        for target in targets:
            reverse[target].append(source)
    for targets in reverse:
        targets.sort()

    seen: set[int] = set()
    finish: list[int] = []

    def forward(vertex: int) -> None:
        seen.add(vertex)
        for target in adjacency[vertex]:
            if target not in seen:
                forward(target)
        finish.append(vertex)

    for vertex in range(n):
        if vertex not in seen:
            forward(vertex)

    seen.clear()
    components: list[list[int]] = []

    def backward(vertex: int, component: list[int]) -> None:
        seen.add(vertex)
        component.append(vertex)
        for target in reverse[vertex]:
            if target not in seen:
                backward(target, component)

    for vertex in reversed(finish):
        if vertex not in seen:
            component: list[int] = []
            backward(vertex, component)
            components.append(sorted(component))
    return sorted(components, key=lambda component: tuple(component))


def sink_components(
    rows: Sequence[Sequence[int]], components: Sequence[Sequence[int]]
) -> list[list[int]]:
    sinks: list[list[int]] = []
    n = len(rows)
    for component in components:
        inside = set(component)
        if 0 < len(inside) < n and not any(
            point not in inside for center in inside for point in rows[center]
        ):
            sinks.append(sorted(inside))
    return sorted(sinks, key=lambda component: tuple(component))


def scc_boundary_clause(
    encoding: SatEncoding, guard_var: int, component: Sequence[int]
) -> tuple[int, ...]:
    inside = set(component)
    boundary = tuple(
        encoding.var("s", center, point)
        for center in sorted(inside)
        for point in range(CELL.n)
        if point not in inside
    )
    require(boundary, "proper SCC cut has an empty legal boundary")
    return (-guard_var, *boundary)


def histogram(values: Iterable[int]) -> dict[str, int]:
    counts = Counter(values)
    return {str(key): counts[key] for key in sorted(counts)}


def motif_signature(
    rows: Sequence[Sequence[int]],
    subset: Sequence[int],
    incoming_degree: Sequence[int],
    component_size: Mapping[int, int],
) -> str:
    vertices = tuple(subset)
    subset_set = set(vertices)
    colors: dict[int, int] = {}
    initial = {
        vertex: (incoming_degree[vertex], component_size[vertex])
        for vertex in vertices
    }
    palette = {value: index for index, value in enumerate(sorted(set(initial.values())))}
    colors = {vertex: palette[initial[vertex]] for vertex in vertices}
    for _ in range(len(vertices)):
        signatures = {
            vertex: (
                colors[vertex],
                tuple(sorted(colors[target] for target in rows[vertex] if target in subset_set)),
                tuple(
                    sorted(
                        colors[source]
                        for source in vertices
                        if vertex in rows[source]
                    )
                ),
            )
            for vertex in vertices
        }
        palette = {
            value: index for index, value in enumerate(sorted(set(signatures.values())))
        }
        refined = {vertex: palette[signatures[vertex]] for vertex in vertices}
        if refined == colors:
            break
        colors = refined
    order = sorted(vertices, key=lambda vertex: (colors[vertex], vertex))
    relation_bits = "".join(
        "1" if target in rows[source] else "0"
        for source in order
        for target in order
    )
    payload = {
        "ordered_colors": [
            [incoming_degree[vertex], component_size[vertex], colors[vertex]]
            for vertex in order
        ],
        "directed_row_membership_bits": relation_bits,
    }
    return sha256_bytes(canonical_json_bytes(payload, pretty=False))


def induced_motif_census(
    rows: Sequence[Sequence[int]],
    incoming_degree: Sequence[int],
    components: Sequence[Sequence[int]],
    subset_cap: int,
) -> dict[str, Any]:
    component_size = {
        vertex: len(component) for component in components for vertex in component
    }
    census: dict[str, Any] = {}
    for size in (6, 7, 8):
        total = math.comb(CELL.n, size)
        enumerated = min(total, subset_cap)
        frequencies: Counter[str] = Counter()
        for subset in itertools.islice(
            itertools.combinations(range(CELL.n), size), enumerated
        ):
            frequencies[
                motif_signature(rows, subset, incoming_degree, component_size)
            ] += 1
        multiset = [
            {"signature_sha256": digest, "frequency": count}
            for digest, count in sorted(frequencies.items())
        ]
        multiset_digest = sha256_bytes(canonical_json_bytes(multiset, pretty=False))
        census[str(size)] = {
            "total_subsets": total,
            "enumerated_count": enumerated,
            "exact_subset_cap": subset_cap,
            "coverage": (
                "all subsets" if enumerated == total else "first lexicographic subsets"
            ),
            "signature_policy": (
                "WL-refined directed induced row-membership fingerprint with "
                "incoming-degree/SCC-size colors and identity-label tie break; "
                "deterministic but not an exact isomorphism canonical form"
            ),
            "multiset_sha256": multiset_digest,
            "unique_count": len(frequencies),
            "top_frequencies": sorted(
                multiset,
                key=lambda record: (
                    -record["frequency"], record["signature_sha256"]
                ),
            )[:10],
        }
    return census


def survivor_signature(
    mode: str,
    candidate_index: int,
    rows: Sequence[Sequence[int]],
    motif_subset_cap: int,
) -> dict[str, Any]:
    row_sets = [set(row) for row in rows]
    intersections = [
        [len(row_sets[left] & row_sets[right]) for right in range(CELL.n)]
        for left in range(CELL.n)
    ]
    pair_intersections = [
        intersections[left][right]
        for left, right in itertools.combinations(range(CELL.n), 2)
    ]

    pair_records: list[dict[str, Any]] = []
    codegrees: list[int] = []
    for left, right in itertools.combinations(range(CELL.n), 2):
        centers = [
            center
            for center in range(CELL.n)
            if left in row_sets[center] and right in row_sets[center]
        ]
        codegrees.append(len(centers))
        pair_records.append(
            {"pair": [left, right], "codegree": len(centers), "centers": centers}
        )
    require(sum(codegrees) == 108, "pair-codegree sum is not n * choose(4,2) = 108")
    maximum = max(codegrees)
    saturated = [record for record in pair_records if record["codegree"] == 2]
    maximum_pairs = [record for record in pair_records if record["codegree"] == maximum]

    incoming_centers = [
        [center for center in range(CELL.n) if point in row_sets[center]]
        for point in range(CELL.n)
    ]
    incoming_degree = [len(centers) for centers in incoming_centers]
    omissions: list[list[bool | None]] = []
    omission_count = 0
    for center in range(CELL.n):
        row: list[bool | None] = []
        for point in range(CELL.n):
            if center == point:
                row.append(None)
            else:
                omitted = point not in row_sets[center]
                row.append(omitted)
                omission_count += int(omitted)
        omissions.append(row)
    mutual_omissions = [
        [left, right]
        for left, right in itertools.combinations(range(CELL.n), 2)
        if right not in row_sets[left] and left not in row_sets[right]
    ]

    components = strongly_connected_components(rows)
    identity_payload = {"n": CELL.n, "k": CELL.k, "rows": [list(row) for row in rows]}
    identity_digest = sha256_bytes(canonical_json_bytes(identity_payload, pretty=False))
    return {
        "schema": "p97-generic-arow-survivor-signature/v1",
        "mode": mode,
        "candidate_index": candidate_index,
        "cell": {"k": 4, "n": 18, "profile": None, "exact": True},
        "rows": [list(row) for row in rows],
        "canonicalization": {
            "coverage": "identity action only; no relabelling quotient was attempted",
            "action": list(range(CELL.n)),
            "identity_digest_sha256": identity_digest,
        },
        "scc_components": components,
        "scc_profile": sorted((len(component) for component in components), reverse=True),
        "strongly_connected": len(components) == 1,
        "row_intersection_matrix": intersections,
        "row_intersection_histogram_153_pairs": histogram(pair_intersections),
        "pair_codegree": {
            "histogram_153_pairs": histogram(codegrees),
            "maximum": maximum,
            "sum": sum(codegrees),
            "sum_check": "18 * choose(4,2) = 108",
            "saturated_definition": "codegree exactly 2 (the DUAL2 upper bound)",
            "saturated_pairs": saturated,
            "maximum_pairs": maximum_pairs,
        },
        "point_multiplicity": incoming_degree,
        "chosen_blocker": None,
        "chosen_blocker_availability": (
            "unavailable on the generic A-ROW surface; no blocker was selected or inferred"
        ),
        "incoming_center_availability": [
            {"point": point, "count": len(centers), "centers": centers}
            for point, centers in enumerate(incoming_centers)
        ],
        "omission": {
            "orientation": "matrix[center][point] means point is absent from S[center]",
            "diagonal": "null because diagonal row-membership variables do not exist",
            "matrix": omissions,
            "directed_count": omission_count,
            "mutual_pair_count": len(mutual_omissions),
            "mutual_pairs": mutual_omissions,
        },
        "induced_colored_motifs": induced_motif_census(
            rows, incoming_degree, components, motif_subset_cap
        ),
        "claim_boundary": (
            "generic labelled A-ROW incidence survivor only; not Card18, not a metric "
            "realization, and not quotiented beyond the identity action"
        ),
    }


def local_clause_mutation_control(
    name: str, clause: Sequence[int], atom: int
) -> dict[str, Any]:
    falsifying = {
        abs(literal): literal < 0 for literal in clause
    }
    require(not clause_value(clause, falsifying), f"{name} seed does not falsify clause")
    mutated = dict(falsifying)
    mutated[atom] = not mutated[atom]
    require(clause_value(clause, mutated), f"{name} one-atom mutation does not satisfy")
    return {
        "name": name,
        "scope": "local clause-direction control; neither assignment is a full CNF model",
        "clause": list(clause),
        "mutated_atom": atom,
        "falsifying_value_before": falsifying[atom],
        "satisfying_value_after": mutated[atom],
        "falsifying_assignment_replay": True,
        "one_atom_mutation_replay": True,
    }


def run_controls() -> dict[str, Any]:
    cyclic_rows = [
        sorted({(center + offset) % CELL.n for offset in (1, 2, 3, 5)})
        for center in range(CELL.n)
    ]
    positive: dict[str, Any] = {}

    baseline = SatEncoding(CELL, static_dual2=False)
    require(
        baseline.num_vars == EXPECTED_COUNTS[False]["variables"],
        f"baseline variable count drift: {baseline.num_vars}",
    )
    require(
        len(baseline.clauses) == EXPECTED_COUNTS[False]["clauses"],
        f"baseline clause count drift: {len(baseline.clauses)}",
    )
    baseline_assignment = rows_assignment(baseline, cyclic_rows)
    baseline_node = baseline.decode(baseline_assignment)
    require(
        rows_from_node(baseline_node) == cyclic_rows,
        "baseline cyclic positive node changed during decode",
    )
    require(
        all_clauses_hold(baseline.clauses, baseline_assignment),
        "baseline cyclic positive node fails a base clause",
    )
    positive["baseline"] = {
        "rows": cyclic_rows,
        "decoded_exactly": True,
        "all_base_clauses_satisfied": True,
    }

    r_circ2 = tuple(
        -baseline.var("s", center, point)
        for center in (0, 1)
        for point in (2, 3, 4)
    )
    require(r_circ2 in baseline.clauses, "selected R-CIRC2 control clause absent")
    r_circ2_control = local_clause_mutation_control(
        "R-CIRC2", r_circ2, baseline.var("s", 0, 2)
    )

    guard = baseline._new_var(("guard", GUARD_NAME), semantic=False)
    guarded_boundary = scc_boundary_clause(baseline, guard, [0])
    scc_control = local_clause_mutation_control(
        "guarded SCC boundary", guarded_boundary, baseline.var("s", 0, 1)
    )
    guard_disabled = {
        abs(literal): literal < 0 for literal in guarded_boundary
    }
    guard_disabled[guard] = False
    require(
        clause_value(guarded_boundary, guard_disabled),
        "guard-disabled SCC boundary clause is not inert",
    )
    scc_control["guard_false_makes_clause_inert"] = True
    scc_control["guard_name"] = GUARD_NAME

    dual2 = SatEncoding(CELL, static_dual2=True)
    require(
        dual2.num_vars == EXPECTED_COUNTS[True]["variables"],
        f"DUAL2 variable count drift: {dual2.num_vars}",
    )
    require(
        len(dual2.clauses) == EXPECTED_COUNTS[True]["clauses"],
        f"DUAL2 clause count drift: {len(dual2.clauses)}",
    )
    dual_assignment = rows_assignment(dual2, cyclic_rows)
    dual_node = dual2.decode(dual_assignment)
    require(
        rows_from_node(dual_node) == cyclic_rows,
        "DUAL2 cyclic positive node changed during decode",
    )
    require(
        all_clauses_hold(dual2.clauses, dual_assignment),
        "DUAL2 cyclic positive node fails a base clause",
    )
    positive["dual2"] = {
        "rows": cyclic_rows,
        "decoded_exactly": True,
        "all_base_clauses_satisfied": True,
    }
    dual_clause = tuple(
        -dual2.var("s", center, point)
        for center in (2, 3, 4)
        for point in (0, 1)
    )
    require(dual_clause in dual2.clauses, "selected DUAL2 control clause absent")
    dual_control = local_clause_mutation_control(
        "DUAL2", dual_clause, dual2.var("s", 2, 0)
    )

    return {
        "schema": "p97-generic-arow-wave1-controls/v1",
        "passed": True,
        "count_assertions": {
            "baseline": EXPECTED_COUNTS[False],
            "dual2": EXPECTED_COUNTS[True],
        },
        "positive_node": {
            "definition": "S[p] = p + {1,2,3,5} modulo 18",
            "scope": (
                "full generic A-ROW positive model for baseline and DUAL2; no metric "
                "realizability claim"
            ),
            "modes": positive,
        },
        "local_clause_direction_controls": [
            r_circ2_control,
            dual_control,
            scc_control,
        ],
    }


def build_encoding(mode: str) -> tuple[SatEncoding, int | None, list[tuple[int, ...]]]:
    config = MODE_CONFIG[mode]
    encoding = SatEncoding(CELL, static_dual2=config["static_dual2"])
    expected = EXPECTED_COUNTS[config["static_dual2"]]
    require(encoding.num_vars == expected["variables"], f"{mode}: variable count drift")
    require(len(encoding.clauses) == expected["clauses"], f"{mode}: clause count drift")
    require(
        dict(encoding.clause_counts) == EXPECTED_TAG_COUNTS[config["static_dual2"]],
        f"{mode}: per-family static clause counts drifted",
    )
    guard_var: int | None = None
    initial_extra: list[tuple[int, ...]] = []
    if config["scc"]:
        guard_var = encoding._new_var(("guard", GUARD_NAME), semantic=False)
        initial_extra.append((guard_var,))
    return encoding, guard_var, initial_extra


def solver_record(
    verdict: str,
    returncode: int,
    command: Sequence[str],
    cnf_path: Path,
    pre_solve_cnf_sha256: str,
    backend: Mapping[str, Any],
    stdout_path: Path,
    stderr_path: Path,
) -> dict[str, Any]:
    return {
        "verdict": verdict,
        "returncode": returncode,
        "command": list(command),
        "command_shell": shlex.join(command),
        "resolved_command": [backend["path"], *list(command)[1:]],
        "resolved_command_shell": shlex.join(
            [str(backend["path"]), *list(command)[1:]]
        ),
        "cnf": str(cnf_path.relative_to(RUN_ROOT)),
        "executed_cnf_path": str(cnf_path.resolve(strict=True)),
        "pre_solve_cnf_sha256": pre_solve_cnf_sha256,
        "post_solve_cnf_sha256": sha256_file(cnf_path),
        "cnf_unchanged_by_solver": sha256_file(cnf_path) == pre_solve_cnf_sha256,
        "resolved_executable_path_pre_solve": backend["path"],
        "resolved_executable_sha256_pre_solve": backend["sha256"],
        "stdout": str(stdout_path.relative_to(RUN_ROOT)),
        "stdout_sha256": sha256_file(stdout_path),
        "stderr": str(stderr_path.relative_to(RUN_ROOT)),
        "stderr_sha256": sha256_file(stderr_path),
    }


def write_solver_streams(
    output_dir: Path, prefix: str, stdout: str, stderr: str
) -> tuple[Path, Path]:
    stdout_path = output_dir / f"{prefix}.stdout.txt"
    stderr_path = output_dir / f"{prefix}.stderr.txt"
    atomic_text(stdout_path, stdout)
    atomic_text(stderr_path, stderr)
    return stdout_path, stderr_path


def artifact_hashes(artifact_dir: Path) -> dict[str, str]:
    return {
        path.name: sha256_file(path)
        for path in sorted(artifact_dir.iterdir(), key=lambda item: item.name)
        if path.is_file()
    }


def dynamic_clauses_from_ledger(
    ledger: Sequence[Mapping[str, Any]],
) -> list[tuple[int, ...]]:
    clauses: list[tuple[int, ...]] = []
    for expected_sequence, entry in enumerate(ledger, start=1):
        require(
            entry.get("sequence") == expected_sequence,
            "dynamic clause ledger sequence is not dense and ordered",
        )
        clause = tuple(entry["clause"])
        require(clause, "dynamic clause ledger contains an empty clause")
        clauses.append(clause)
    return clauses


def semantic_assignment_sha256(
    encoding: SatEncoding, assignment: Mapping[int, bool]
) -> str:
    payload = [
        [variable, bool(assignment[variable])] for variable in encoding.semantic_vars
    ]
    return sha256_bytes(canonical_json_bytes(payload, pretty=False))


def persist_candidate_event(
    events_dir: Path,
    event: Mapping[str, Any],
    all_events: Sequence[Mapping[str, Any]],
) -> Path:
    candidate_index = int(event["candidate_index"])
    event_path = events_dir / f"candidate-{candidate_index:04d}.json"
    atomic_json(event_path, event)
    atomic_bytes(
        events_dir / "ledger.jsonl",
        b"".join(canonical_json_bytes(item, pretty=False) for item in all_events),
    )
    return event_path


def run_mode(
    mode: str,
    *,
    accepted_cap: int,
    candidate_cap: int,
    timeout_s: int,
    motif_subset_cap: int,
) -> tuple[dict[str, Any], list[dict[str, Any]], dict[str, Any], dict[str, Any]]:
    encoding, guard_var, extra_clauses = build_encoding(mode)
    artifact_dir = RUN_ROOT / "artifacts" / mode
    events_dir = RUN_ROOT / "events" / mode
    confined_directory(artifact_dir, require_empty=True)
    confined_directory(events_dir, require_empty=True)

    base_path = artifact_dir / "base.cnf"
    base_bytes = encoding.cnf_bytes(extra_clauses)
    atomic_bytes(base_path, base_bytes)
    dynamic_ledger: list[dict[str, Any]] = []
    if guard_var is not None:
        dynamic_ledger.append(
            {
                "sequence": 1,
                "class": "ASSUMPTION_CONTROL",
                "family": f"{GUARD_NAME} unit",
                "clause": [guard_var],
                "origin": "mode initialization",
            }
        )
    cuts: list[dict[str, Any]] = []
    blocks: list[dict[str, Any]] = []
    survivors: list[dict[str, Any]] = []
    candidate_events: list[dict[str, Any]] = []
    guard_reconstructions = 0
    status: str | None = None
    unsat_verified = False
    terminal: dict[str, Any] | None = None

    current_path = artifact_dir / "current.cnf"
    last_solved_path = artifact_dir / "last_solved.cnf"
    current_solve_path = artifact_dir / "current.solve.json"

    while len(candidate_events) < candidate_cap:
        dynamic_clauses = dynamic_clauses_from_ledger(dynamic_ledger)
        current_bytes = encoding.cnf_bytes(dynamic_clauses)
        atomic_bytes(current_path, current_bytes)
        atomic_bytes(last_solved_path, current_bytes)
        candidate_index = len(candidate_events) + 1
        pre_solve_sha = sha256_bytes(current_bytes)
        backend_pre = executable_metadata("cadical", ["--version"])
        require(backend_pre["path"] is not None, "cadical executable is unavailable")
        current_command = [
            "cadical", "-q", "-t", str(timeout_s), str(current_path)
        ]
        event: dict[str, Any] = {
            "schema": "p97-generic-arow-wave1-candidate-event/v1",
            "mode": mode,
            "candidate_index": candidate_index,
            "state": "PREPARED",
            "ordered_dynamic_clause_ledger": [dict(entry) for entry in dynamic_ledger],
            "dynamic_clause_count": len(dynamic_clauses),
            "static_clause_count": len(encoding.clauses),
            "total_clause_count": len(encoding.clauses) + len(dynamic_clauses),
            "input_cnf_sha256": pre_solve_sha,
            "executed_cnf_path": str(current_path.resolve(strict=True)),
            "command": current_command,
            "command_shell": shlex.join(current_command),
            "resolved_executable_path_pre_solve": backend_pre["path"],
            "resolved_executable_sha256_pre_solve": backend_pre["sha256"],
            "verdict": None,
            "disposition": None,
            "clauses_appended_after_solve": [],
        }
        candidate_events.append(event)
        persist_candidate_event(events_dir, event, candidate_events)

        result = run_cadical(current_path, timeout_s, None)
        backend_post = executable_metadata("cadical", ["--version"])
        backend_stable = (
            backend_post["path"] == backend_pre["path"]
            and backend_post["sha256"] == backend_pre["sha256"]
        )
        stdout_path, stderr_path = write_solver_streams(
            events_dir, f"candidate-{candidate_index:04d}", result.stdout, result.stderr
        )
        solve_record = solver_record(
            result.verdict,
            result.returncode,
            current_command,
            current_path,
            pre_solve_sha,
            backend_pre,
            stdout_path,
            stderr_path,
        )
        solve_record["candidate_index"] = candidate_index
        solve_record["backend_identity_stable_during_solve"] = backend_stable
        atomic_json(current_solve_path, solve_record)
        require(
            solve_record["cnf_unchanged_by_solver"],
            f"{mode}: discovery solver mutated its CNF input",
        )
        event.update(
            {
                "state": "SOLVED",
                "verdict": result.verdict if backend_stable else "UNKNOWN",
                "solver_returncode": result.returncode,
                "backend_identity_stable_during_solve": backend_stable,
                "stdout": str(stdout_path.relative_to(RUN_ROOT)),
                "stdout_sha256": sha256_file(stdout_path),
                "stderr": str(stderr_path.relative_to(RUN_ROOT)),
                "stderr_sha256": sha256_file(stderr_path),
                "cnf_unchanged_by_solver": True,
            }
        )
        effective_verdict = result.verdict if backend_stable else "UNKNOWN"

        if effective_verdict == "UNKNOWN":
            event["disposition"] = "UNKNOWN_FAIL_CLOSED"
            status = "UNKNOWN"
            persist_candidate_event(events_dir, event, candidate_events)
            break

        if effective_verdict == "UNSAT":
            event["disposition"] = "DISCOVERY_UNSAT_PENDING_FRESH_PROOF"
            persist_candidate_event(events_dir, event, candidate_events)
            terminal_path = artifact_dir / "terminal.cnf"
            terminal_proof = artifact_dir / "terminal.drat"
            atomic_bytes(terminal_path, current_bytes)
            require(
                terminal_path.read_bytes() == current_bytes,
                f"{mode}: terminal CNF changed during freezing",
            )
            validate_output_path(terminal_proof)
            terminal_pre_sha = sha256_file(terminal_path)
            terminal_backend_pre = executable_metadata("cadical", ["--version"])
            require(
                terminal_backend_pre["path"] is not None,
                "cadical executable is unavailable for terminal proof",
            )
            proof_result = run_cadical(terminal_path, timeout_s, terminal_proof)
            terminal_backend_post = executable_metadata("cadical", ["--version"])
            terminal_backend_stable = (
                terminal_backend_post["path"] == terminal_backend_pre["path"]
                and terminal_backend_post["sha256"] == terminal_backend_pre["sha256"]
            )
            terminal_stdout, terminal_stderr = write_solver_streams(
                artifact_dir, "terminal", proof_result.stdout, proof_result.stderr
            )
            terminal_command = [
                "cadical", "-q", "-t", str(timeout_s),
                str(terminal_path), str(terminal_proof),
            ]
            terminal_record = solver_record(
                proof_result.verdict,
                proof_result.returncode,
                terminal_command,
                terminal_path,
                terminal_pre_sha,
                terminal_backend_pre,
                terminal_stdout,
                terminal_stderr,
            )
            terminal_record["byte_identical_to_discovery_cnf"] = (
                sha256_file(terminal_path) == event["input_cnf_sha256"]
            )
            terminal_record["backend_identity_stable_during_solve"] = (
                terminal_backend_stable
            )
            checker_record: dict[str, Any] | None = None
            if proof_result.verdict == "UNSAT" and terminal_proof.is_file():
                validate_output_path(terminal_proof)
                checker_backend_pre = executable_metadata("drat-trim", [])
                require(
                    checker_backend_pre["path"] is not None,
                    "drat-trim executable is unavailable",
                )
                checker_inputs_before = {
                    "terminal_cnf_sha256": sha256_file(terminal_path),
                    "terminal_cnf_size": terminal_path.stat().st_size,
                    "terminal_proof_sha256": sha256_file(terminal_proof),
                    "terminal_proof_size": terminal_proof.stat().st_size,
                }
                checker = run_drat_trim(terminal_path, terminal_proof, timeout_s)
                validate_output_path(terminal_path)
                validate_output_path(terminal_proof)
                checker_inputs_after = {
                    "terminal_cnf_sha256": sha256_file(terminal_path),
                    "terminal_cnf_size": terminal_path.stat().st_size,
                    "terminal_proof_sha256": sha256_file(terminal_proof),
                    "terminal_proof_size": terminal_proof.stat().st_size,
                }
                checker_cnf_unchanged = bool(
                    checker_inputs_after["terminal_cnf_sha256"]
                    == checker_inputs_before["terminal_cnf_sha256"]
                    and checker_inputs_after["terminal_cnf_size"]
                    == checker_inputs_before["terminal_cnf_size"]
                )
                checker_proof_unchanged = bool(
                    checker_inputs_after["terminal_proof_sha256"]
                    == checker_inputs_before["terminal_proof_sha256"]
                    and checker_inputs_after["terminal_proof_size"]
                    == checker_inputs_before["terminal_proof_size"]
                )
                checker_backend_post = executable_metadata("drat-trim", [])
                checker_backend_stable = (
                    checker_backend_post["path"] == checker_backend_pre["path"]
                    and checker_backend_post["sha256"] == checker_backend_pre["sha256"]
                )
                check_path = artifact_dir / "terminal.drat.check"
                atomic_text(
                    check_path,
                    checker.stdout
                    + ("\n" if checker.stdout and checker.stderr else "")
                    + checker.stderr,
                )
                checker_record = {
                    "verified": checker.verified,
                    "returncode": checker.returncode,
                    "returncode_zero": checker.returncode == 0,
                    "resolved_executable_path_pre_check": checker_backend_pre["path"],
                    "resolved_executable_sha256_pre_check": checker_backend_pre["sha256"],
                    "backend_identity_stable_during_check": checker_backend_stable,
                    "inputs_before_check": checker_inputs_before,
                    "inputs_after_check": checker_inputs_after,
                    "terminal_cnf_unchanged_during_check": checker_cnf_unchanged,
                    "terminal_proof_unchanged_during_check": checker_proof_unchanged,
                    "command": [
                        "drat-trim", str(terminal_path), str(terminal_proof)
                    ],
                    "command_shell": shlex.join(
                        ["drat-trim", str(terminal_path), str(terminal_proof)]
                    ),
                    "check_log": str(check_path.relative_to(RUN_ROOT)),
                    "check_log_sha256": sha256_file(check_path),
                    "proof_sha256": sha256_file(terminal_proof),
                }
                unsat_verified = bool(
                    checker.verified
                    and checker.returncode == 0
                    and terminal_record["byte_identical_to_discovery_cnf"]
                    and terminal_record["cnf_unchanged_by_solver"]
                    and terminal_backend_stable
                    and checker_backend_stable
                    and checker_cnf_unchanged
                    and checker_proof_unchanged
                )
            terminal_record["checker"] = checker_record
            terminal_record["complete_unsat_acceptance"] = {
                "terminal_solver_returned_unsat": proof_result.verdict == "UNSAT",
                "checker_verified": bool(
                    checker_record is not None and checker_record["verified"]
                ),
                "checker_returncode_zero": bool(
                    checker_record is not None and checker_record["returncode_zero"]
                ),
                "terminal_cnf_byte_identical_to_discovery": terminal_record[
                    "byte_identical_to_discovery_cnf"
                ],
                "terminal_cnf_unchanged_by_solver": terminal_record[
                    "cnf_unchanged_by_solver"
                ],
                "terminal_cnf_unchanged_during_check": bool(
                    checker_record is not None
                    and checker_record["terminal_cnf_unchanged_during_check"]
                ),
                "terminal_proof_unchanged_during_check": bool(
                    checker_record is not None
                    and checker_record["terminal_proof_unchanged_during_check"]
                ),
                "backend_identities_stable": bool(
                    terminal_backend_stable
                    and checker_record is not None
                    and checker_record["backend_identity_stable_during_check"]
                ),
                "accepted": unsat_verified,
            }
            atomic_json(artifact_dir / "terminal.solve.json", terminal_record)
            terminal = terminal_record
            status = "COMPLETE_UNSAT" if unsat_verified else "UNKNOWN"
            event["disposition"] = (
                "COMPLETE_UNSAT_PROOF_CHECKED"
                if unsat_verified
                else "TERMINAL_PROOF_UNKNOWN_FAIL_CLOSED"
            )
            event["terminal_solve"] = str(
                (artifact_dir / "terminal.solve.json").relative_to(RUN_ROOT)
            )
            persist_candidate_event(events_dir, event, candidate_events)
            break

        require(effective_verdict == "SAT", f"{mode}: unexpected verdict {effective_verdict}")
        try:
            assignment, guard_inferred = normalize_solver_assignment(
                encoding, result.assignment, guard_var
            )
            guard_reconstructions += int(guard_inferred)
            require(
                all_clauses_hold(encoding.clauses, assignment),
                f"{mode}: SAT model fails a static clause",
            )
            require(
                all_clauses_hold(dynamic_clauses, assignment),
                f"{mode}: SAT model fails a dynamic clause",
            )
            node = encoding.decode(assignment)
            rows = rows_from_node(node)
        except (KeyError, Phase3Error) as exc:
            event["readback_error"] = str(exc)
            event["disposition"] = "INVALID_ENCODING_MODEL_FAIL_CLOSED"
            status = "UNKNOWN"
            persist_candidate_event(events_dir, event, candidate_events)
            break
        event["semantic_assignment_sha256"] = semantic_assignment_sha256(
            encoding, assignment
        )

        components = strongly_connected_components(rows)
        if guard_var is not None and len(components) > 1:
            sinks = sink_components(rows, components)
            require(sinks, f"{mode}: disconnected graph has no proper sink SCC")
            event["disposition"] = "SCC_REFINED"
            event["sink_components"] = sinks
            for component in sinks:
                clause = scc_boundary_clause(encoding, guard_var, component)
                require(
                    not clause_value(clause, assignment),
                    f"{mode}: triggering model does not falsify SCC cut",
                )
                require(
                    clause not in dynamic_clauses,
                    f"{mode}: repeated SCC cut did not make progress",
                )
                cut = {
                    "cut_index": len(cuts) + 1,
                    "guard_name": GUARD_NAME,
                    "guard_var": guard_var,
                    "trigger_candidate_index": candidate_index,
                    "trigger_rows": rows,
                    "trigger_semantic_assignment_sha256": event[
                        "semantic_assignment_sha256"
                    ],
                    "trigger_prior_ledger_length": len(dynamic_ledger),
                    "component": component,
                    "boundary_variables": list(clause[1:]),
                    "clause": list(clause),
                    "clause_sha256": sha256_bytes(
                        canonical_json_bytes(list(clause), pretty=False)
                    ),
                    "trigger_nonempty_proper_sink_verified": True,
                    "trigger_clause_falsified_verified": True,
                    "admission": (
                        "conditional MINIMAL-FAITHFUL-CONSEQUENCE; not a generic "
                        "A-ROW consequence without that source antecedent"
                    ),
                }
                cuts.append(cut)
                ledger_entry = {
                    "sequence": len(dynamic_ledger) + 1,
                    "class": "SEMANTIC_REFINEMENT",
                    "family": "lazy sink-SCC boundary",
                    "clause": list(clause),
                    "origin": {
                        "candidate_index": candidate_index,
                        "cut_index": cut["cut_index"],
                        "guard": GUARD_NAME,
                    },
                }
                dynamic_ledger.append(ledger_entry)
                event["clauses_appended_after_solve"].append(ledger_entry)
        else:
            if guard_var is not None:
                require(
                    len(components) == 1,
                    f"{mode}: SCC survivor is not strongly connected",
                )
            event["disposition"] = "ACCEPTED_SURVIVOR"
            signature = survivor_signature(
                mode, candidate_index, rows, motif_subset_cap
            )
            signature["all_static_clauses_replayed"] = True
            signature["all_prior_dynamic_clauses_replayed"] = True
            signature["guard_reconstructed_from_unit"] = guard_inferred
            signature["semantic_assignment_sha256"] = event[
                "semantic_assignment_sha256"
            ]
            signature["signature_sha256"] = sha256_bytes(
                canonical_json_bytes(signature, pretty=False)
            )
            survivors.append(signature)
            block = encoding.blocking_clause(assignment)
            require(
                not clause_value(block, assignment),
                f"{mode}: semantic block does not exclude accepted model",
            )
            blocks.append(
                {
                    "accepted_index": len(survivors),
                    "trigger_candidate_index": candidate_index,
                    "clause": list(block),
                    "clause_sha256": sha256_bytes(
                        canonical_json_bytes(list(block), pretty=False)
                    ),
                    "class": "ENUMERATION_CONTROL",
                    "scope": "raw labelled semantic assignment only",
                    "trigger_semantic_assignment_sha256": event[
                        "semantic_assignment_sha256"
                    ],
                }
            )
            ledger_entry = {
                "sequence": len(dynamic_ledger) + 1,
                "class": "ENUMERATION_CONTROL",
                "family": "raw labelled semantic block",
                "clause": list(block),
                "origin": {
                    "candidate_index": candidate_index,
                    "accepted_index": len(survivors),
                },
            }
            dynamic_ledger.append(ledger_entry)
            event["clauses_appended_after_solve"].append(ledger_entry)
            if len(survivors) >= accepted_cap:
                status = "PARTIAL_SURVIVOR_CAP"

        if status is None and len(candidate_events) >= candidate_cap:
            status = "PARTIAL_CANDIDATE_CAP"
        event["post_solve_dynamic_ledger_length"] = len(dynamic_ledger)
        event["post_solve_dynamic_ledger_sha256"] = sha256_bytes(
            canonical_json_bytes(dynamic_ledger, pretty=False)
        )
        if status is not None:
            # Preserve the augmented next formula as current.cnf, while
            # last_solved.cnf remains the exact input named by current.solve.json.
            next_clauses = dynamic_clauses_from_ledger(dynamic_ledger)
            atomic_bytes(current_path, encoding.cnf_bytes(next_clauses))
            event["post_solve_current_cnf_sha256"] = sha256_file(current_path)
        persist_candidate_event(events_dir, event, candidate_events)
        if status is not None:
            break

    if status is None:
        status = "PARTIAL_CANDIDATE_CAP"

    persisted_events = [
        json.loads(
            (events_dir / f"candidate-{index:04d}.json").read_text(encoding="utf-8")
        )
        for index in range(1, len(candidate_events) + 1)
    ]
    ledger_lines = [
        json.loads(line)
        for line in (events_dir / "ledger.jsonl").read_text(encoding="utf-8").splitlines()
        if line
    ]
    ledger_file_matches_events = ledger_lines == persisted_events
    candidate_cnf_replay: list[dict[str, Any]] = []
    for event in persisted_events:
        replay_dynamic = dynamic_clauses_from_ledger(
            event["ordered_dynamic_clause_ledger"]
        )
        replay_bytes = encoding.cnf_bytes(replay_dynamic)
        candidate_cnf_replay.append(
            {
                "candidate_index": event["candidate_index"],
                "dynamic_clause_count_matches": (
                    len(replay_dynamic) == event["dynamic_clause_count"]
                ),
                "total_clause_count_matches": (
                    len(encoding.clauses) + len(replay_dynamic)
                    == event["total_clause_count"]
                ),
                "cnf_sha256_matches": (
                    sha256_bytes(replay_bytes) == event["input_cnf_sha256"]
                ),
                "command_matches_executed_path": (
                    event["command"][-1] == event["executed_cnf_path"]
                    or Path(event["command"][-1]).resolve()
                    == Path(event["executed_cnf_path"])
                ),
            }
        )

    event_by_index = {
        event["candidate_index"]: event for event in persisted_events
    }
    replay_cut_records: list[dict[str, Any]] = []
    for cut in cuts:
        trigger_rows = cut["trigger_rows"]
        trigger_assignment = rows_assignment(encoding, trigger_rows, guard_var)
        trigger_event = event_by_index[cut["trigger_candidate_index"]]
        prior_dynamic = dynamic_clauses_from_ledger(
            trigger_event["ordered_dynamic_clause_ledger"]
        )
        decoded_trigger = encoding.decode(trigger_assignment)
        trigger_components = strongly_connected_components(trigger_rows)
        trigger_sinks = sink_components(trigger_rows, trigger_components)
        cut_clause = tuple(cut["clause"])
        replay_cut_records.append(
            {
                "cut_index": cut["cut_index"],
                "trigger_static_clauses": all_clauses_hold(
                    encoding.clauses, trigger_assignment
                ),
                "trigger_prior_dynamic_clauses": all_clauses_hold(
                    prior_dynamic, trigger_assignment
                ),
                "trigger_guard_unit": guard_var is not None and trigger_assignment[guard_var],
                "trigger_decode_rows": rows_from_node(decoded_trigger) == trigger_rows,
                "trigger_semantic_assignment_sha256": (
                    semantic_assignment_sha256(encoding, trigger_assignment)
                    == cut["trigger_semantic_assignment_sha256"]
                ),
                "trigger_nonempty_proper_sink": cut["component"] in trigger_sinks,
                "trigger_clause_falsified": not clause_value(
                    cut_clause, trigger_assignment
                ),
            }
        )

    replay_survivors: list[dict[str, Any]] = []
    for survivor in survivors:
        assignment = rows_assignment(encoding, survivor["rows"], guard_var)
        survivor_event = event_by_index[survivor["candidate_index"]]
        prior_dynamic = dynamic_clauses_from_ledger(
            survivor_event["ordered_dynamic_clause_ledger"]
        )
        decoded_survivor = encoding.decode(assignment)
        components = strongly_connected_components(survivor["rows"])
        recomputed = survivor_signature(
            mode, survivor["candidate_index"], survivor["rows"], motif_subset_cap
        )
        expected_signature = dict(survivor)
        signature_sha = expected_signature.pop("signature_sha256")
        for key in (
            "all_static_clauses_replayed",
            "all_prior_dynamic_clauses_replayed",
            "guard_reconstructed_from_unit",
            "semantic_assignment_sha256",
        ):
            expected_signature.pop(key)
        record = {
            "candidate_index": survivor["candidate_index"],
            "static_clauses": all_clauses_hold(encoding.clauses, assignment),
            "guard_unit": guard_var is None or assignment[guard_var],
            "all_prior_dynamic_clauses": all_clauses_hold(prior_dynamic, assignment),
            "decoded_rows": rows_from_node(decoded_survivor) == survivor["rows"],
            "semantic_assignment_sha256": (
                semantic_assignment_sha256(encoding, assignment)
                == survivor["semantic_assignment_sha256"]
            ),
            "signature_payload": recomputed == expected_signature,
            "signature_sha256": (
                sha256_bytes(
                    canonical_json_bytes(
                        {
                            **recomputed,
                            "all_static_clauses_replayed": True,
                            "all_prior_dynamic_clauses_replayed": True,
                            "guard_reconstructed_from_unit": survivor[
                                "guard_reconstructed_from_unit"
                            ],
                            "semantic_assignment_sha256": survivor[
                                "semantic_assignment_sha256"
                            ],
                        },
                        pretty=False,
                    )
                ) == signature_sha
            ),
            "scc_mode_strongly_connected": (
                guard_var is None or len(components) == 1
            ),
        }
        replay_survivors.append(record)

    ledger_replay_passed = bool(candidate_cnf_replay) and ledger_file_matches_events and all(
        all(value for key, value in item.items() if key != "candidate_index")
        for item in candidate_cnf_replay
    )
    cut_replay_passed = all(
        all(value for key, value in item.items() if key != "cut_index")
        for item in replay_cut_records
    )
    survivor_replay_passed = all(
        all(value for key, value in item.items() if key != "candidate_index")
        for item in replay_survivors
    )
    evidence_exists = bool(cuts or survivors or status == "COMPLETE_UNSAT")
    replay_applicable = evidence_exists and status != "UNKNOWN"
    replay_passed = bool(
        replay_applicable
        and ledger_replay_passed
        and cut_replay_passed
        and survivor_replay_passed
        and (status != "COMPLETE_UNSAT" or unsat_verified)
    )
    if replay_applicable and not replay_passed:
        status = "UNKNOWN"
        unsat_verified = False

    static_counts = dict(encoding.clause_counts)
    dynamic_counts = {
        f"{GUARD_NAME} unit": int(guard_var is not None),
        "lazy sink-SCC boundary": len(cuts),
        "raw labelled semantic block": len(blocks),
    }
    final_clause_count = sum(static_counts.values()) + sum(dynamic_counts.values())
    require(
        final_clause_count
        == len(encoding.clauses) + len(dynamic_clauses_from_ledger(dynamic_ledger)),
        f"{mode}: final clause-family arithmetic mismatch",
    )
    family_record = {
        "mode": mode,
        "static_dual2": MODE_CONFIG[mode]["static_dual2"],
        "conditional_scc": MODE_CONFIG[mode]["scc"],
        "base_variables_before_guard": EXPECTED_COUNTS[
            MODE_CONFIG[mode]["static_dual2"]
        ]["variables"],
        "base_clauses_before_guard": EXPECTED_COUNTS[
            MODE_CONFIG[mode]["static_dual2"]
        ]["clauses"],
        "static_clause_tag_counts": static_counts,
        "final_variables": encoding.num_vars,
        "dynamic_clause_family_counts": dynamic_counts,
        "final_clause_family_counts": {**static_counts, **dynamic_counts},
        "final_clause_count": final_clause_count,
        "delta_vs_baseline": {
            "static_clause_tag_counts": {
                tag: static_counts[tag] - EXPECTED_TAG_COUNTS[False][tag]
                for tag in static_counts
            },
            "guard_unit": dynamic_counts[f"{GUARD_NAME} unit"],
            "lazy_scc_cuts": dynamic_counts["lazy sink-SCC boundary"],
            "raw_semantic_blocks": dynamic_counts[
                "raw labelled semantic block"
            ],
            "total_clauses": final_clause_count - EXPECTED_COUNTS[False]["clauses"],
            "variables": encoding.num_vars - EXPECTED_COUNTS[False]["variables"],
        },
        "arithmetic_verified": True,
    }
    summary = {
        "mode": mode,
        "status": status,
        "accepted_survivors": len(survivors),
        "candidate_solves": len(candidate_events),
        "lazy_scc_cuts": len(cuts),
        "semantic_blocks": len(blocks),
        "guard_name": GUARD_NAME if guard_var is not None else None,
        "guard_var": guard_var,
        "guard_reconstructions_from_unit": guard_reconstructions,
        "unsat_verified": unsat_verified,
        "terminal": terminal,
        "candidate_event_ledger": str(
            (events_dir / "ledger.jsonl").relative_to(RUN_ROOT)
        ),
        "candidate_event_ledger_sha256": sha256_file(events_dir / "ledger.jsonl"),
        "candidate_event_files": [
            str(
                (events_dir / f"candidate-{index:04d}.json").relative_to(RUN_ROOT)
            )
            for index in range(1, len(candidate_events) + 1)
        ],
        "artifact_sha256": artifact_hashes(artifact_dir),
        "claim": (
            "proof-checked terminal UNSAT for this exact finite generic A-ROW CNF"
            if status == "COMPLETE_UNSAT"
            else "partial or inconclusive generic A-ROW exploration"
        ),
    }
    replay = {
        "mode": mode,
        "passed": replay_passed,
        "applicable": replay_applicable,
        "status": "PASS" if replay_passed else (
            "FAIL" if replay_applicable else "NOT_APPLICABLE"
        ),
        "evidence_exists": evidence_exists,
        "candidate_event_ledger_matches_files": ledger_file_matches_events,
        "candidate_cnf_reconstruction": candidate_cnf_replay,
        "candidate_cnf_reconstruction_passed": ledger_replay_passed,
        "cuts": replay_cut_records,
        "accepted_survivors": replay_survivors,
        "terminal_unsat_verified": unsat_verified,
        "terminal_cnf_byte_identity": (
            terminal is not None and terminal["byte_identical_to_discovery_cnf"]
        ),
    }
    return summary, survivors, replay, family_record


def clause_family_manifest(
    mode_records: Sequence[Mapping[str, Any]], metadata: Mapping[str, Any]
) -> dict[str, Any]:
    records = list(mode_records)
    if not records:
        for mode, config in MODE_CONFIG.items():
            static_counts = dict(EXPECTED_TAG_COUNTS[config["static_dual2"]])
            dynamic_counts = {
                f"{GUARD_NAME} unit": int(config["scc"]),
                "lazy sink-SCC boundary": 0,
                "raw labelled semantic block": 0,
            }
            final_count = sum(static_counts.values()) + sum(dynamic_counts.values())
            records.append(
                {
                    "mode": mode,
                    "execution_state": "NOT_EXECUTED_DRY_CONTROLS",
                    "static_dual2": config["static_dual2"],
                    "conditional_scc": config["scc"],
                    "base_variables_before_guard": 306,
                    "base_clauses_before_guard": sum(static_counts.values()),
                    "static_clause_tag_counts": static_counts,
                    "final_variables": 306 + int(config["scc"]),
                    "dynamic_clause_family_counts": dynamic_counts,
                    "final_clause_family_counts": {
                        **static_counts,
                        **dynamic_counts,
                    },
                    "final_clause_count": final_count,
                    "delta_vs_baseline": {
                        "static_clause_tag_counts": {
                            tag: static_counts[tag] - EXPECTED_TAG_COUNTS[False][tag]
                            for tag in static_counts
                        },
                        "guard_unit": int(config["scc"]),
                        "lazy_scc_cuts": 0,
                        "raw_semantic_blocks": 0,
                        "total_clauses": final_count - EXPECTED_COUNTS[False]["clauses"],
                        "variables": int(config["scc"]),
                    },
                    "arithmetic_verified": True,
                }
            )
    return {
        "schema": "p97-generic-arow-wave1-clause-family-manifest/v1",
        "surface": "generic A-ROW at k=4,n=18; not Card18",
        "source": metadata,
        "families": [
            {
                "name": "S-EXACT",
                "class": "ROOT_STATIC",
                "scope": "each labelled center row has exactly four off-diagonal points",
            },
            {
                "name": "S-CIRC2",
                "class": "ROOT_STATIC",
                "scope": "two distinct center rows have intersection size at most two",
            },
            {
                "name": "DUAL2",
                "class": "ROOT_STATIC when selected",
                "scope": "each target pair is contained in rows of at most two centers",
                "source_note": (
                    "pair-center bound from the source-backed perpendicular-bisector "
                    "side argument; represented statically"
                ),
            },
            {
                "name": GUARD_NAME,
                "class": "ASSUMPTION_CONTROL",
                "scope": (
                    "unit guard enabling the conditional minimal-faithful consequence"
                ),
            },
            {
                "name": "lazy sink-SCC boundary",
                "class": "SEMANTIC_REFINEMENT under the named guard only",
                "scope": (
                    "for every proper sink C, some legal x[c,p] exits C; orientation "
                    "is center c to selected point p"
                ),
                "antecedent": GUARD_NAME,
            },
            {
                "name": "raw labelled semantic block",
                "class": "ENUMERATION_CONTROL",
                "scope": "one complete labelled row-membership assignment",
            },
        ],
        "mode_counts": records,
        "trust_boundary": (
            "SCC families are conditional; no finite CNF family establishes metric "
            "realizability or Card18 source coverage"
        ),
    }


def bridge_markdown(metadata: Mapping[str, Any]) -> str:
    return f"""# Card18 v2 bridge minimum

This file freezes the minimum source-to-finite bridge still required before a
future Card18 consumer can use this run.  The present runner is a **generic
A-ROW** explorer at `k=4,n=18`; it is not Card18 and supplies none of the
bridge proofs below.

Source revision recorded by the runner: `{metadata['source_head']}`.

1. **Total source rows.** Produce one source row for every source label, rather
   than only rows occurring in a selected packet.
2. **Blocker/row-center packet.** For every source point, provide a blocker and
   row center together with source membership, center distinctness, exact
   cardinality four, carrier containment, and the common-distance statement.
3. **Separate center rows.** Keep blocker-centered and point-centered rows as
   separate source objects.  Their diagonal exclusions have opposite
   orientation and cannot be identified silently.
4. **Exact `labelsOf` transport.** State and prove the exact transport of row
   membership, omitted points, centers, and cardinalities through `labelsOf`.
5. **Source-to-finite theorem.** Construct the finite labelled A-ROW object
   from convex independence plus injective labels, with every hard clause
   discharged from named source hypotheses.
6. **Pair-hit-center input.** Supply the theorem bounding centers that hit a
   fixed pair, or expose a finite quotient carrying precisely the information
   needed for that bound.
7. **SCC orientation.** Freeze the directed edge as `c -> p` exactly when
   `p in S[c]`.  A sink cut for `C` is
   `OR_{{c in C, p outside C}} x[c,p]`, guarded by
   `{GUARD_NAME}`.
8. **Deletion status discipline.** Transport only deletion statuses actually
   present in the source packet.  Absence of a selected status is unknown, not
   the opposite status.

Until all eight items are proved and connected to a named consumer, a checked
UNSAT here is only a fact about its authenticated finite generic A-ROW CNF.
"""


def report_markdown(
    comparison: Mapping[str, Any], controls: Mapping[str, Any]
) -> str:
    lines = [
        "# Generic A-ROW n=18 Wave 1",
        "",
        "This is a bounded generic A-ROW incidence experiment, not Card18.  It",
        "does not test metric realizability.  SCC modes assume the guarded",
        f"conditional `{GUARD_NAME}` consequence.",
        "",
        f"Controls: {'PASS' if controls['passed'] else 'FAIL'}.",
        "",
        "| mode | status | candidates | survivors | SCC cuts | verified UNSAT |",
        "|---|---:|---:|---:|---:|---:|",
    ]
    for mode in comparison["modes"]:
        lines.append(
            f"| {mode['mode']} | {mode['status']} | {mode['candidate_solves']} | "
            f"{mode['accepted_survivors']} | {mode['lazy_scc_cuts']} | "
            f"{str(mode['unsat_verified']).lower()} |"
        )
    if not comparison["modes"]:
        lines.append("| (dry controls) | DRY_CONTROLS | 0 | 0 | 0 | false |")
    lines.extend(
        [
            "",
            "`PARTIAL_SURVIVOR_CAP` and `PARTIAL_CANDIDATE_CAP` are bounded",
            "checkpoints. `UNKNOWN` is inconclusive. `COMPLETE_UNSAT` is emitted",
            "only after fresh proof production over the byte-identical terminal",
            "CNF and successful `drat-trim` replay; even then the claim is limited",
            "to that exact finite CNF and its recorded conditional clauses.",
            "",
            "Canonical coverage is identity-only. Motif coverage is explicitly",
            "bounded to the first lexicographic subsets and uses a deterministic",
            "WL-refined fingerprint, not an exact isomorphism canonical form.",
            "",
        ]
    )
    return "\n".join(lines)


def positive_int(value: str) -> int:
    integer = int(value)
    if integer <= 0:
        raise argparse.ArgumentTypeError("must be positive")
    return integer


def parse_modes(values: Sequence[str]) -> list[str]:
    modes: list[str] = []
    for value in values:
        modes.extend(part for part in value.split(",") if part)
    unknown = sorted(set(modes) - set(MODE_CONFIG))
    if unknown:
        raise argparse.ArgumentTypeError(f"unknown modes: {', '.join(unknown)}")
    if not modes:
        raise argparse.ArgumentTypeError("at least one mode is required")
    return list(dict.fromkeys(modes))


def require_no_stale_mode_outputs(modes: Sequence[str]) -> None:
    for mode in modes:
        for category in ("artifacts", "events"):
            directory = RUN_ROOT / category / mode
            if directory.exists() or directory.is_symlink():
                confined_directory(directory, require_empty=True)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--modes",
        nargs="+",
        default=list(MODE_CONFIG),
        help="baseline dual2 scc dual2_scc (space- or comma-separated)",
    )
    parser.add_argument("--accepted-survivor-cap", type=positive_int, default=16)
    parser.add_argument("--candidate-solve-cap", type=positive_int, default=128)
    parser.add_argument("--timeout", type=positive_int, default=30)
    parser.add_argument("--motif-subset-cap", type=positive_int, default=512)
    parser.add_argument(
        "--dry-controls",
        action="store_true",
        help="run deterministic non-solver controls and write only top-level reports",
    )
    args = parser.parse_args(argv)
    try:
        modes = parse_modes(args.modes)
    except argparse.ArgumentTypeError as exc:
        parser.error(str(exc))

    controls = run_controls()
    metadata = source_metadata()
    summaries: list[dict[str, Any]] = []
    survivors: list[dict[str, Any]] = []
    replay_modes: list[dict[str, Any]] = []
    family_records: list[dict[str, Any]] = []

    if args.dry_controls:
        require_no_stale_mode_outputs(modes)
    else:
        for mode in modes:
            summary, mode_survivors, replay, family = run_mode(
                mode,
                accepted_cap=args.accepted_survivor_cap,
                candidate_cap=args.candidate_solve_cap,
                timeout_s=args.timeout,
                motif_subset_cap=args.motif_subset_cap,
            )
            summaries.append(summary)
            survivors.extend(mode_survivors)
            replay_modes.append(replay)
            family_records.append(family)

    comparison = {
        "schema": SCHEMA,
        "surface": "generic A-ROW; not Card18",
        "cell": {"k": 4, "n": 18, "profile": None, "exact": True},
        "command": [sys.executable, str(Path(__file__).resolve()), *sys.argv[1:]],
        "command_shell": shlex.join(
            [sys.executable, str(Path(__file__).resolve()), *sys.argv[1:]]
        ),
        "configuration": {
            "requested_modes": modes,
            "executed_modes": [item["mode"] for item in summaries],
            "execution_mode": "DRY_CONTROLS" if args.dry_controls else "SOLVER_WAVE",
            "accepted_survivor_cap": args.accepted_survivor_cap,
            "candidate_solve_cap": args.candidate_solve_cap,
            "per_call_timeout_seconds": args.timeout,
            "motif_subset_cap_per_r": args.motif_subset_cap,
            "dry_controls": args.dry_controls,
        },
        "source": metadata,
        "modes": summaries,
        "claim_boundary": (
            "No metric realizability and no Card18 coverage. Completeness is claimed "
            "only by an individual mode with proof-checked COMPLETE_UNSAT for its "
            "exact finite CNF. SCC modes are conditional on the named guard."
        ),
    }
    replay_report = {
        "schema": "p97-generic-arow-wave1-replay/v1",
        "passed": bool(
            not args.dry_controls
            and replay_modes
            and controls["passed"]
            and all(item["passed"] for item in replay_modes)
        ),
        "applicable": bool(not args.dry_controls and replay_modes),
        "status": (
            "NOT_APPLICABLE_DRY_CONTROLS"
            if args.dry_controls
            else (
                "PASS"
                if replay_modes and all(item["passed"] for item in replay_modes)
                else "FAIL_OR_NO_EVIDENCE"
            )
        ),
        "replay_performed": bool(not args.dry_controls and replay_modes),
        "controls_passed": controls["passed"],
        "modes": replay_modes,
        "scope": (
            "exact row readback, trigger-sink cut replay, prior-cut/block replay, "
            "and proof-check status; no source or metric bridge"
        ),
    }

    atomic_json(RUN_ROOT / "controls.json", controls)
    atomic_json(
        RUN_ROOT / "clause_family_manifest.json",
        clause_family_manifest(family_records, metadata),
    )
    atomic_bytes(
        RUN_ROOT / "survivor_signatures.jsonl",
        b"".join(canonical_json_bytes(record, pretty=False) for record in survivors),
    )
    atomic_json(RUN_ROOT / "replay_report.json", replay_report)
    atomic_json(RUN_ROOT / "comparison.json", comparison)
    atomic_text(RUN_ROOT / "REPORT.md", report_markdown(comparison, controls))
    atomic_text(RUN_ROOT / "card18_v2_bridge.md", bridge_markdown(metadata))

    print(json.dumps({
        "dry_controls": args.dry_controls,
        "controls_passed": controls["passed"],
        "modes": [
            {"mode": item["mode"], "status": item["status"]} for item in summaries
        ],
        "run_root": str(RUN_ROOT),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
