#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine reusable equality-closure cores from the census-554 pattern bank.

This is a read-only structural pass. It does not trust a bank row's deadness
certificate and does not assert coverage of the (5,5,4) census. Instead, it
asks whether the row equalities alone route to one of four local plane-
geometry kernels:

* two distinct centers equidistant from the same three distinct points; or
* four distinct points with all six pairwise distances equal;
* the five-point equilateral-bisector collision; or
* the five-point three-triad collision.

The output also canonicalizes patterns under arbitrary support relabeling so
that role-labeled bank rows can be counted as unlabeled local motifs.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter, defaultdict, deque
from datetime import datetime, timezone
from itertools import combinations, permutations
from pathlib import Path
from typing import Iterable, Sequence


STATUSES = (
    "duplicate-center",
    "equal-K4",
    "equilateral-bisector",
    "three-triad",
    "other",
)


class UnionFind:
    def __init__(self, values: Iterable[tuple[int, int]]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: tuple[int, int]) -> tuple[int, int]:
        parent = self.parent[value]
        if parent != value:
            self.parent[value] = self.find(parent)
        return self.parent[value]

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("distance-equality edges require distinct endpoints")
    return (left, right) if left < right else (right, left)


def normalized_pattern(row: dict) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(sorted(
        (int(center), tuple(sorted(int(point) for point in mask)))
        for center, mask in row["pattern"].items()
    ))


def support_of(
    pattern: tuple[tuple[int, tuple[int, ...]], ...]
) -> tuple[int, ...]:
    return tuple(sorted(
        {center for center, _mask in pattern}
        | {point for _center, mask in pattern for point in mask}
    ))


def validate_pattern(
    pattern: tuple[tuple[int, tuple[int, ...]], ...]
) -> None:
    for center, mask in pattern:
        if len(mask) < 2:
            raise ValueError(f"center {center} has a mask smaller than two")
        if center in mask:
            raise ValueError(f"center {center} occurs in its own mask")
        if len(set(mask)) != len(mask):
            raise ValueError(f"center {center} has duplicate mask members")


def canonical_key(
    pattern: tuple[tuple[int, tuple[int, ...]], ...]
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    support = support_of(pattern)
    best = None
    for image in permutations(range(len(support))):
        relabel = dict(zip(support, image))
        candidate = tuple(sorted(
            (
                relabel[center],
                tuple(sorted(relabel[point] for point in mask)),
            )
            for center, mask in pattern
        ))
        if best is None or candidate < best:
            best = candidate
    assert best is not None
    return best


def equality_closure(
    pattern: tuple[tuple[int, tuple[int, ...]], ...]
) -> UnionFind:
    support = support_of(pattern)
    closure = UnionFind(combinations(support, 2))
    for center, mask in pattern:
        center_edges = tuple(edge(center, point) for point in mask)
        for other in center_edges[1:]:
            closure.union(center_edges[0], other)
    return closure


def core_witnesses(
    pattern: tuple[tuple[int, tuple[int, ...]], ...]
) -> dict[str, list[dict]]:
    support = support_of(pattern)
    closure = equality_closure(pattern)
    duplicate_centers = []
    for triple in combinations(support, 3):
        centers = []
        for center in support:
            if center in triple:
                continue
            roots = {closure.find(edge(center, point)) for point in triple}
            if len(roots) == 1:
                centers.append(center)
        if len(centers) >= 2:
            duplicate_centers.append({
                "triple": list(triple),
                "centers": centers,
            })

    equal_k4 = []
    for points in combinations(support, 4):
        roots = {
            closure.find(edge(left, right))
            for left, right in combinations(points, 2)
        }
        if len(roots) == 1:
            equal_k4.append({"points": list(points)})

    equilateral_bisector = []
    for p, a, b, c, x in permutations(support, 5):
        common_radius = {
            closure.find(edge(p, a)),
            closure.find(edge(p, b)),
            closure.find(edge(p, c)),
            closure.find(edge(a, b)),
            closure.find(edge(a, x)),
            closure.find(edge(b, x)),
        }
        if len(common_radius) != 1:
            continue
        if closure.find(edge(c, x)) != closure.find(edge(c, a)):
            continue
        equilateral_bisector.append({
            "p": p,
            "a": a,
            "b": b,
            "c": c,
            "x": x,
        })

    three_triad = []
    for a, b, c, d, e in permutations(support, 5):
        first = {
            closure.find(edge(b, c)),
            closure.find(edge(b, d)),
            closure.find(edge(d, a)),
        }
        second = {
            closure.find(edge(c, a)),
            closure.find(edge(c, d)),
            closure.find(edge(c, e)),
        }
        third = {
            closure.find(edge(e, a)),
            closure.find(edge(e, b)),
            closure.find(edge(e, d)),
        }
        if len(first) == len(second) == len(third) == 1:
            three_triad.append({
                "a": a,
                "b": b,
                "c": c,
                "d": d,
                "e": e,
            })

    return {
        "duplicate_center": duplicate_centers,
        "equal_k4": equal_k4,
        "equilateral_bisector": equilateral_bisector,
        "three_triad": three_triad,
    }


def primary_status(witnesses: dict[str, list[dict]]) -> str:
    if witnesses["duplicate_center"]:
        return "duplicate-center"
    if witnesses["equal_k4"]:
        return "equal-K4"
    if witnesses["equilateral_bisector"]:
        return "equilateral-bisector"
    if witnesses["three_triad"]:
        return "three-triad"
    return "other"


def first_core_witness(witnesses: dict[str, list[dict]]) -> list[dict]:
    """Return one witness from the first applicable structural family."""
    return (
        witnesses["duplicate_center"][:1]
        or witnesses["equal_k4"][:1]
        or witnesses["equilateral_bisector"][:1]
        or witnesses["three_triad"][:1]
    )


def distribution(rows: Sequence[dict]) -> dict:
    return {
        "rows": len(rows),
        "support": dict(sorted(Counter(
            len(support_of(normalized_pattern(row))) for row in rows
        ).items())),
        "centers": dict(sorted(Counter(
            len(row["pattern"]) for row in rows
        ).items())),
        "generators": dict(sorted(Counter(
            sum(len(mask) - 1 for mask in row["pattern"].values())
            for row in rows
        ).items())),
        "kill": dict(sorted(Counter(
            row["kill"].split(":", maxsplit=1)[0] for row in rows
        ).items())),
    }


def status_counts(rows: Sequence[dict], statuses: Sequence[str]) -> dict:
    row_counts = Counter(statuses)
    row_weighted_orbit_counts = Counter()
    unique_pid_orbit_counts = Counter()
    seen_pids: dict[str, tuple[str, int]] = {}
    for row, status in zip(rows, statuses):
        row_weighted_orbit_counts[status] += row["n_orbit"]
        signature = (status, row["n_orbit"])
        previous = seen_pids.get(row["pid"])
        if previous is not None and previous != signature:
            raise ValueError(
                f"duplicate pid has conflicting status/orbit data: {row['pid']}"
            )
        if previous is None:
            seen_pids[row["pid"]] = signature
            unique_pid_orbit_counts[status] += row["n_orbit"]
    return {
        "bank_rows": {status: row_counts[status] for status in STATUSES},
        "unique_pid_role_labeled_orbit_instances": {
            status: unique_pid_orbit_counts[status] for status in STATUSES
        },
        "row_weighted_role_labeled_orbit_instances": {
            status: row_weighted_orbit_counts[status] for status in STATUSES
        },
    }


def slice_summary(
    rows: Sequence[dict],
    keys: Sequence[tuple],
    statuses: Sequence[str],
    *,
    start: int,
    stop: int,
) -> dict:
    selected_rows = rows[start:stop]
    selected_keys = set(keys[start:stop])
    prior_keys = set(keys[:start])
    return {
        **distribution(selected_rows),
        **status_counts(selected_rows, statuses[start:stop]),
        "unique_unlabeled_motifs": len(selected_keys),
        "new_unlabeled_motifs_vs_prefix": len(selected_keys - prior_keys),
    }


def pattern_json(key: tuple[tuple[int, tuple[int, ...]], ...]) -> list[dict]:
    return [
        {"center": center, "mask": list(mask)}
        for center, mask in key
    ]


def generated_lean_modules(
    bank_by_pid: dict[str, dict], lean_bank_dir: Path
) -> dict:
    rows = []
    for path in sorted(lean_bank_dir.glob("Pat*.lean")):
        match = re.fullmatch(r"Pat(\d+)\.lean", path.name)
        if match is None:
            continue
        pid = f"pat_{int(match.group(1)):05d}"
        bank_row = bank_by_pid.get(pid)
        if bank_row is None:
            raise ValueError(f"generated Lean module has no bank row: {pid}")
        witnesses = core_witnesses(normalized_pattern(bank_row))
        rows.append({
            "module": path.name,
            "pid": pid,
            "status": primary_status(witnesses),
            "first_witness": first_core_witness(witnesses),
        })
    counts = Counter(row["status"] for row in rows)
    return {
        "module_count": len(rows),
        "counts": {status: counts[status] for status in STATUSES},
        "modules": rows,
    }


def lean_pattern_name(pid: str) -> str:
    return f"pat{int(pid.removeprefix('pat_')):05d}"


def closure_graph(
    pattern: tuple[tuple[int, tuple[int, ...]], ...],
    lean_pattern: str,
) -> dict[tuple[int, int], list[tuple[tuple[int, int], str]]]:
    graph: dict[tuple[int, int], list[tuple[tuple[int, int], str]]] = defaultdict(list)
    support = support_of(pattern)
    for center, mask in pattern:
        for left in mask:
            for right in mask:
                if left == right:
                    continue
                graph[(center, left)].append((
                    (center, right),
                    f"EdgeClosure.row (P := {lean_pattern}) {center} {left} "
                    f"{right} (by decide) (by decide)",
                ))
    for left, right in permutations(support, 2):
        graph[(left, right)].append((
            (right, left),
            f"EdgeClosure.flip (P := {lean_pattern}) {left} {right}",
        ))
    return graph


def closure_path_term(
    pattern: tuple[tuple[int, tuple[int, ...]], ...],
    lean_pattern: str,
    start: tuple[int, int],
    stop: tuple[int, int],
) -> str:
    if start == stop:
        return f"EdgeClosure.refl (P := {lean_pattern}) _"
    graph = closure_graph(pattern, lean_pattern)
    pending = deque([start])
    previous: dict[tuple[int, int], tuple[tuple[int, int], str]] = {}
    while pending:
        current = pending.popleft()
        for nxt, step in graph[current]:
            if nxt in previous or nxt == start:
                continue
            previous[nxt] = (current, step)
            if nxt == stop:
                pending.clear()
                break
            pending.append(nxt)
    if stop not in previous:
        raise ValueError(f"no equality-closure path from {start} to {stop}")
    steps = []
    current = stop
    while current != start:
        current, step = previous[current]
        steps.append(step)
    steps.reverse()
    term = steps[0]
    for step in steps[1:]:
        term = f"EdgeClosure.trans (P := {lean_pattern}) ({term}) ({step})"
    return term


def render_equal_k4_bank(
    rows: Sequence[dict], lean_bank_dir: Path
) -> str:
    """Render kernel-checked consumers for supported generated-bank cores.

    The historical function name is retained because the first emitted family
    was equal-K4.  The output now also supports equilateral-bisector and
    three-triad consumers.
    """
    bank_by_pid = {}
    for row in rows:
        bank_by_pid.setdefault(row["pid"], row)
    modules = generated_lean_modules(bank_by_pid, lean_bank_dir)["modules"]
    equal_k4_modules = [row for row in modules if row["status"] == "equal-K4"]
    equilateral_bisector_modules = [
        row for row in modules if row["status"] == "equilateral-bisector"
    ]
    three_triad_modules = [
        row for row in modules if row["status"] == "three-triad"
    ]
    structural_modules = (
        equal_k4_modules + equilateral_bisector_modules + three_triad_modules
    )
    imports = [
        "import Erdos9796Proof.P97.Census554.EqualityCore",
        *(
            ["import Erdos9796Proof.P97.Census554.FivePointCollision"]
            if equilateral_bisector_modules else []
        ),
        *(
            ["import Erdos9796Proof.P97.Census554.ThreeTriadCollision"]
            if three_triad_modules else []
        ),
        *(
            "import Erdos9796Proof.P97.Census554.Bank."
            + row["module"].removesuffix(".lean")
            for row in structural_modules
        ),
    ]
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        *imports,
        "",
        "/-!",
        "# Census-554 structural equality-core bank",
        "",
        "Auto-generated by `scripts/census554-general-n-core-miner.py`.  Each",
        "theorem below consumes finite equality-closure paths and applies the",
        "corresponding generic collision theorem; it does not replay a",
        "Nullstellensatz certificate or assert bank coverage.",
        "-/",
        "",
        "set_option linter.style.longLine false",
        "",
        "namespace Problem97",
        "namespace Census554",
        "namespace Bank",
        "",
        "open Problem97.Census554.EqualityCore",
        "",
    ]
    targets = ("hp₁p₂", "hp₁p₃", "hp₁₁₂", "hp₁₁₃", "hp₁₂₃")
    for module in equal_k4_modules:
        pid = module["pid"]
        pattern = normalized_pattern(bank_by_pid[pid])
        witness = core_witnesses(pattern)["equal_k4"][0]["points"]
        p, t1, t2, t3 = witness
        lean_pattern = lean_pattern_name(pid)
        root = (p, t1)
        target_edges = ((p, t2), (p, t3), (t1, t2), (t1, t3), (t2, t3))
        closure_names = []
        for target, edge in zip(targets, target_edges):
            name = f"{lean_pattern}_{target}"
            closure_names.append(name)
            lines.extend([
                f"private theorem {name} : EdgeClosure {lean_pattern} "
                f"({p}, {t1}) ({edge[0]}, {edge[1]}) := by",
                "  exact " + closure_path_term(pattern, lean_pattern, root, edge),
                "",
            ])
        core_name = f"equalK4Core_{lean_pattern}"
        lines.extend([
            f"private def {core_name} : EqualK4Core {lean_pattern} where",
            f"  p := {p}",
            f"  t₁ := {t1}",
            f"  t₂ := {t2}",
            f"  t₃ := {t3}",
            "  hpt₁ := by decide",
            f"  hp₁p₂ := {closure_names[0]}",
            f"  hp₁p₃ := {closure_names[1]}",
            f"  hp₁₁₂ := {closure_names[2]}",
            f"  hp₁₁₃ := {closure_names[3]}",
            f"  hp₁₂₃ := {closure_names[4]}",
            "",
            "/-- Structural equal-K4 closure for the generated bank pattern. -/",
            f"theorem isDead_{lean_pattern}_of_equalK4Core : IsDead {lean_pattern} :=",
            f"  isDead_of_equalK4Core {core_name}",
            "",
        ])
    five_targets = (
        ("pa_pb", lambda w: ((w["p"], w["a"]), (w["p"], w["b"]))),
        ("pa_pc", lambda w: ((w["p"], w["a"]), (w["p"], w["c"]))),
        ("pa_ab", lambda w: ((w["p"], w["a"]), (w["a"], w["b"]))),
        ("pa_ax", lambda w: ((w["p"], w["a"]), (w["a"], w["x"]))),
        ("pa_bx", lambda w: ((w["p"], w["a"]), (w["b"], w["x"]))),
        ("cx_ca", lambda w: ((w["c"], w["x"]), (w["c"], w["a"]))),
    )
    for module in equilateral_bisector_modules:
        pid = module["pid"]
        pattern = normalized_pattern(bank_by_pid[pid])
        witness = core_witnesses(pattern)["equilateral_bisector"][0]
        lean_pattern = lean_pattern_name(pid)
        closure_names = {}
        for field, edge_pair in five_targets:
            start, stop = edge_pair(witness)
            name = f"{lean_pattern}_{field}"
            closure_names[field] = name
            lines.extend([
                f"private theorem {name} : EdgeClosure {lean_pattern} "
                f"({start[0]}, {start[1]}) ({stop[0]}, {stop[1]}) := by",
                "  exact " + closure_path_term(
                    pattern, lean_pattern, start, stop
                ),
                "",
            ])
        core_name = f"equilateralBisectorCore_{lean_pattern}"
        lines.extend([
            f"private def {core_name} : EquilateralBisectorCollisionCore "
            f"{lean_pattern} where",
            f"  p := {witness['p']}",
            f"  a := {witness['a']}",
            f"  b := {witness['b']}",
            f"  c := {witness['c']}",
            f"  x := {witness['x']}",
            "  hpa := by decide",
            "  hpx := by decide",
            "  hcb := by decide",
            *(
                f"  {field} := {closure_names[field]}"
                for field, _edge_pair in five_targets
            ),
            "",
            "/-- Structural equilateral-bisector closure for the generated "
            "bank pattern. -/",
            f"theorem isDead_{lean_pattern}_of_equilateralBisectorCore : "
            f"IsDead {lean_pattern} :=",
            f"  isDead_of_equilateralBisectorCollisionCore {core_name}",
            "",
        ])
    triad_targets = (
        ("BC_BD", lambda w: ((w["b"], w["c"]), (w["b"], w["d"]))),
        ("BD_DA", lambda w: ((w["b"], w["d"]), (w["d"], w["a"]))),
        ("CA_CD", lambda w: ((w["c"], w["a"]), (w["c"], w["d"]))),
        ("CD_CE", lambda w: ((w["c"], w["d"]), (w["c"], w["e"]))),
        ("EA_EB", lambda w: ((w["e"], w["a"]), (w["e"], w["b"]))),
        ("EB_ED", lambda w: ((w["e"], w["b"]), (w["e"], w["d"]))),
    )
    for module in three_triad_modules:
        pid = module["pid"]
        pattern = normalized_pattern(bank_by_pid[pid])
        witness = core_witnesses(pattern)["three_triad"][0]
        lean_pattern = lean_pattern_name(pid)
        closure_names = {}
        for field, edge_pair in triad_targets:
            start, stop = edge_pair(witness)
            name = f"{lean_pattern}_{field}"
            closure_names[field] = name
            lines.extend([
                f"private theorem {name} : EdgeClosure {lean_pattern} "
                f"({start[0]}, {start[1]}) ({stop[0]}, {stop[1]}) := by",
                "  exact " + closure_path_term(
                    pattern, lean_pattern, start, stop
                ),
                "",
            ])
        core_name = f"threeTriadCore_{lean_pattern}"
        lines.extend([
            f"private def {core_name} : ThreeTriadCollisionCore "
            f"{lean_pattern} where",
            f"  A := {witness['a']}",
            f"  B := {witness['b']}",
            f"  C := {witness['c']}",
            f"  D := {witness['d']}",
            f"  E := {witness['e']}",
            "  hAB := by decide",
            *(
                f"  {field} := {closure_names[field]}"
                for field, _edge_pair in triad_targets
            ),
            "",
            "/-- Structural three-triad closure for the generated bank "
            "pattern. -/",
            f"theorem isDead_{lean_pattern}_of_threeTriadCore : "
            f"IsDead {lean_pattern} :=",
            f"  isDead_of_threeTriadCollisionCore {core_name}",
            "",
        ])
    lines.extend([
        "end Bank",
        "end Census554",
        "end Problem97",
        "",
    ])
    return "\n".join(lines)


def prefix_rows(raw: bytes, row_limit: int | None) -> bytes:
    """Return an exact append-only bank prefix, preserving line endings."""
    if row_limit is None:
        return raw
    lines = raw.splitlines(keepends=True)
    if row_limit > len(lines):
        raise ValueError("row limit lies outside the bank")
    return b"".join(lines[:row_limit])


def analyze(
    raw: bytes,
    *,
    bank_path: Path,
    lean_bank_dir: Path,
    prefix_checkpoint: int,
    recent_count: int,
    top_limit: int,
    row_limit: int | None,
) -> dict:
    rows = [json.loads(line) for line in raw.splitlines() if line.strip()]
    if not rows:
        raise ValueError("bank is empty")
    if not 0 <= prefix_checkpoint <= len(rows):
        raise ValueError("prefix checkpoint lies outside the bank")
    if not 0 <= recent_count <= len(rows):
        raise ValueError("recent count lies outside the bank")

    patterns = [normalized_pattern(row) for row in rows]
    for pattern in patterns:
        validate_pattern(pattern)
    keys = [canonical_key(pattern) for pattern in patterns]
    witnesses = [core_witnesses(pattern) for pattern in patterns]
    statuses = [primary_status(row_witnesses) for row_witnesses in witnesses]

    motif_rows: dict[tuple, list[int]] = defaultdict(list)
    motif_status = {}
    for index, (key, status) in enumerate(zip(keys, statuses)):
        motif_rows[key].append(index)
        previous = motif_status.setdefault(key, status)
        if previous != status:
            raise AssertionError("core status changed under support relabeling")

    motif_counts = Counter(motif_status.values())
    top = []
    for key, indices in sorted(
        motif_rows.items(),
        key=lambda item: (-len(item[1]), item[0]),
    )[:top_limit]:
        first = indices[0]
        last = indices[-1]
        first_witnesses = witnesses[first]
        top.append({
            "bank_row_count": len(indices),
            "canonical_pattern": pattern_json(key),
            "status": statuses[first],
            "first_pid": rows[first]["pid"],
            "last_pid": rows[last]["pid"],
            "first_witness": first_core_witness(first_witnesses),
        })

    bank_by_pid = {}
    duplicate_pids = Counter(row["pid"] for row in rows)
    for row in rows:
        bank_by_pid.setdefault(row["pid"], row)

    recent_start = len(rows) - recent_count
    lean_bank = generated_lean_modules(bank_by_pid, lean_bank_dir)
    return {
        "schema": "p97-census554-general-n-equality-core-mining-v2",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "source": {
            "bank": str(bank_path),
            "sha256": hashlib.sha256(raw).hexdigest(),
            "row_limit": row_limit,
            "rows_read": len(rows),
            "prefix_checkpoint": prefix_checkpoint,
            "recent_count": recent_count,
            "lean_bank_dir": str(lean_bank_dir),
        },
        "bank": {
            **distribution(rows),
            **status_counts(rows, statuses),
            "unique_pids": len(bank_by_pid),
            "duplicate_pids": {
                pid: count
                for pid, count in sorted(duplicate_pids.items())
                if count > 1
            },
            "unique_unlabeled_motifs": len(motif_rows),
            "unlabeled_motif_status": {
                status: motif_counts[status] for status in STATUSES
            },
        },
        "tail_after_prefix": slice_summary(
            rows,
            keys,
            statuses,
            start=prefix_checkpoint,
            stop=len(rows),
        ),
        "recent_tail": slice_summary(
            rows,
            keys,
            statuses,
            start=recent_start,
            stop=len(rows),
        ),
        "top_unlabeled_motifs": top,
        "generated_lean_bank": lean_bank,
        "theorem_surface": {
            "formalized_combinatorics": [
                "realized row equalities are preserved by edge-equality closure",
                "a closure duplicate-center witness implies no injective realization",
                "a closure equal-K4 witness implies no injective realization",
                "a closure equilateral-bisector witness implies a forced collision",
                "a closure three-triad witness implies a forced collision",
            ],
            "emitted_structural_consumers": {
                "module": "Census554/Bank/EqualityCore.lean",
                "equal_k4_modules": lean_bank["counts"]["equal-K4"],
                "equilateral_bisector_modules":
                    lean_bank["counts"]["equilateral-bisector"],
                "three_triad_modules": lean_bank["counts"]["three-triad"],
            },
            "existing_geometry_kernels": [
                "Problem97.not_dist_eq_three_of_ne",
                "Problem97.u5_unit_triangle_on_p_circle_incompatibility",
                "Problem97.Census554.EqualityCore.equilateral_bisector_collision",
                "Problem97.Census554.EqualityCore.three_triad_collision",
            ],
            "trust_boundary": (
                "The miner's finite witness data is not itself a Lean proof. "
                "Its --lean-out emission is separately kernel-checked, but "
                "neither emission nor this artifact verifies certificates or "
                "proves census coverage."
            ),
        },
    }


def markdown(artifact: dict) -> str:
    bank = artifact["bank"]
    tail = artifact["tail_after_prefix"]
    recent = artifact["recent_tail"]
    lean_bank = artifact["generated_lean_bank"]
    source = artifact["source"]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Census-554 general-n equality-core mining",
        "",
        f"Generated `{artifact['generated_at']}` from "
        + (
            f"the first `{source['row_limit']}` rows of "
            if source["row_limit"] is not None else ""
        )
        + f"`{source['bank']}`.",
        f"Snapshot SHA-256: `{source['sha256']}`.",
        "",
        "This read-only pass closes distance equalities transitively and tests",
        "for four formalized geometric obstructions: duplicate circumcenters,",
        "an equal-K4, an equilateral-bisector collision, and a three-triad",
        "collision. It does not verify polynomial certificates or prove",
        "that the census cover is complete.",
        "",
        *(
            [
                "This artifact intentionally names an append-only bank prefix; rows",
                "appended later are outside its claimed snapshot.",
                "",
            ]
            if source["row_limit"] is not None else []
        ),
        "## Summary",
        "",
        f"- Bank rows: `{bank['rows']}`; unique pids: `{bank['unique_pids']}`",
        f"- Unlabeled motifs: `{bank['unique_unlabeled_motifs']}`",
        f"- Duplicate-center closure: `{bank['bank_rows']['duplicate-center']}` rows / "
        f"`{bank['unlabeled_motif_status']['duplicate-center']}` motifs",
        f"- Equal-K4 closure: `{bank['bank_rows']['equal-K4']}` rows / "
        f"`{bank['unlabeled_motif_status']['equal-K4']}` motifs",
        f"- Equilateral-bisector closure: "
        f"`{bank['bank_rows']['equilateral-bisector']}` rows / "
        f"`{bank['unlabeled_motif_status']['equilateral-bisector']}` motifs",
        f"- Three-triad closure: `{bank['bank_rows']['three-triad']}` rows / "
        f"`{bank['unlabeled_motif_status']['three-triad']}` motifs",
        f"- Outside all four closures: `{bank['bank_rows']['other']}` rows / "
        f"`{bank['unlabeled_motif_status']['other']}` motifs",
        f"- Role-labeled orbit instances covered by the four closures: "
        f"`{sum(value for status, value in bank['unique_pid_role_labeled_orbit_instances'].items() if status != 'other')}` "
        f"of `{sum(bank['unique_pid_role_labeled_orbit_instances'].values())}` "
        "after deduplicating pids",
        "",
        "## Frontier check",
        "",
        f"After row `{source['prefix_checkpoint']}`, the `{tail['rows']}`-row tail "
        f"contains `{tail['unique_unlabeled_motifs']}` motifs, of which "
        f"`{tail['new_unlabeled_motifs_vs_prefix']}` are new versus the prefix.",
        f"The newest `{recent['rows']}` rows contain "
        f"`{recent['unique_unlabeled_motifs']}` motifs, with "
        f"`{recent['new_unlabeled_motifs_vs_prefix']}` new versus the earlier bank; "
        f"`{sum(value for status, value in recent['bank_rows'].items() if status != 'other')}` "
        "hit one of the four closures and "
        f"`{recent['bank_rows']['other']}` lie outside them.",
        "This is evidence against motif-alphabet stabilization, not a theorem",
        "that stabilization is impossible.",
        "",
        "## Existing Lean bank",
        "",
        f"Of the `{lean_bank['module_count']}` generated `Bank/Pat` modules, "
        f"`{lean_bank['counts']['equal-K4']}` are equal-K4 closure instances and "
        f"`{lean_bank['counts']['equilateral-bisector']}` are "
        "equilateral-bisector instances.",
        "`Census554/Bank/EqualityCore.lean` now contains kernel-checked",
        "structural proofs for every listed instance of those two families. The remaining",
        "modules still require their existing certificates or another sound kernel.",
        "",
        "## General-n theorem surface",
        "",
        "The theorem layer is formalized across `Census554/EqualityCore.lean`,",
        "`FivePointCollision.lean`, and `ThreeTriadCollision.lean`:",
        "",
        "1. `EdgeClosure.sound` transports realized row equalities through finite",
        "   edge-equality closure;",
        "2. `not_realizes_of_duplicateCenterCore` routes a duplicate-center",
        "   closure witness to",
        "   `Problem97.not_dist_eq_three_of_ne`; and",
        "3. `not_realizes_of_equalK4Core` routes an equal-K4 closure witness to",
        "   `Problem97.u5_unit_triangle_on_p_circle_incompatibility`;",
        "4. `not_realizes_of_equilateralBisectorCollisionCore` routes its",
        "   six closure relations to `equilateral_bisector_collision`; and",
        "5. `not_realizes_of_threeTriadCollisionCore` routes its six closure",
        "   equalities to `three_triad_collision`.",
        "",
        "The definitions and soundness theorems can quantify over arbitrary finite",
        "label types, so they are genuinely ambient-cardinality independent.",
        "`--lean-out` emits explicit finite paths for the selected bank modules;",
        "the Lean kernel checks those paths without a new geometric axiom.",
        "",
        "## Frequent motifs",
        "",
        "| rows | status | first pid | last pid | canonical rows |",
        "|---:|---|---|---|---|",
    ]
    for motif in artifact["top_unlabeled_motifs"]:
        pattern = "; ".join(
            f"{row['center']}:{','.join(map(str, row['mask']))}"
            for row in motif["canonical_pattern"]
        )
        lines.append(
            f"| {motif['bank_row_count']} | {motif['status']} | "
            f"`{motif['first_pid']}` | `{motif['last_pid']}` | `{pattern}` |"
        )
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--bank",
        type=Path,
        default=Path("scratch/census-554/bank.jsonl"),
    )
    parser.add_argument(
        "--lean-bank-dir",
        type=Path,
        default=Path("lean/Erdos9796Proof/P97/Census554/Bank"),
    )
    parser.add_argument("--prefix-checkpoint", type=int, default=5154)
    parser.add_argument("--recent-count", type=int, default=132)
    parser.add_argument("--top-limit", type=int, default=12)
    parser.add_argument(
        "--row-limit",
        type=int,
        help="freeze analysis to the first N append-only bank rows",
    )
    parser.add_argument(
        "--lean-out",
        type=Path,
        help="write structural equality-core proofs for generated Lean modules",
    )
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.prefix_checkpoint < 0:
        parser.error("--prefix-checkpoint must be nonnegative")
    if args.recent_count < 0:
        parser.error("--recent-count must be nonnegative")
    if args.top_limit < 1:
        parser.error("--top-limit must be positive")
    if args.row_limit is not None and args.row_limit < 1:
        parser.error("--row-limit must be positive")

    raw = prefix_rows(args.bank.read_bytes(), args.row_limit)
    artifact = analyze(
        raw,
        bank_path=args.bank,
        lean_bank_dir=args.lean_bank_dir,
        prefix_checkpoint=args.prefix_checkpoint,
        recent_count=args.recent_count,
        top_limit=args.top_limit,
        row_limit=args.row_limit,
    )
    args.out.write_text(json.dumps(artifact, indent=2, sort_keys=True) + "\n")
    if args.markdown:
        args.markdown.write_text(markdown(artifact))
    if args.lean_out:
        rows = [json.loads(line) for line in raw.splitlines() if line.strip()]
        args.lean_out.write_text(render_equal_k4_bank(rows, args.lean_bank_dir))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
