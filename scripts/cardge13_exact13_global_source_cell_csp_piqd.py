# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Probe every source-admissible exact-13 five-row cell through PIQD.

This finite abstraction keeps the two blocker rows separately tagged, keeps
the two rows at the second apex separately tagged, and adds one global K4 row
at every center not already represented.  Real distance variables retain every
row-forced equality and every strict Kalmanson inequality.  SAT is therefore a
survivor of this linear relaxation, not a metric or source realization.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections import Counter
from collections.abc import Iterable
from pathlib import Path
from typing import Any

import cardge13_exact13_tight_cover_lra_piqd as core

SCHEMA = "cardge13-exact13-global-source-cell-csp-piqd/v1"
LABELS = core.LABELS
FIRST_APEX = 1
SECOND_APEX = 0
I1 = frozenset((6, 7))
I2 = frozenset(range(8, 13))
BASE_ROWS = ("C0", "C1", "K", "L", "T")
GLOBAL_CENTERS = tuple(range(2, 13))
DIRECT_ORDER = core.DIRECT_ORDER
MIRROR_ORDER = (2, 6, 7, 0, 3, 4, 5, 1, 8, 9, 10, 11, 12)
ROLES = ("b0", "b1", "s0", "s1", "d", "z")
MAX_ASSERT_BYTES = 512 * 1024


def command_chunks(
    commands: tuple[str, ...], max_bytes: int = MAX_ASSERT_BYTES
) -> tuple[tuple[str, ...], ...]:
    """Partition a journal into PIQD assertion requests below the HTTP body limit."""
    if max_bytes <= 0:
        raise ValueError("max_bytes must be positive")
    chunks: list[tuple[str, ...]] = []
    current: list[str] = []
    current_bytes = 0
    for command in commands:
        command_bytes = len(command.encode("ascii")) + 1
        if command_bytes > max_bytes:
            raise ValueError("one SMT command exceeds the assertion request limit")
        if current and current_bytes + command_bytes > max_bytes:
            chunks.append(tuple(current))
            current = []
            current_bytes = 0
        current.append(command)
        current_bytes += command_bytes
    if current:
        chunks.append(tuple(current))
    return tuple(chunks)


def run_piqd_chunked(
    path: Path,
    commands: tuple[str, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
    *,
    label: str,
    order: tuple[int, ...],
    max_refinements: int,
) -> list[dict[str, Any]]:
    """Run a large SMT journal and refine transitive zero-form SAT models."""
    if max_refinements < 0:
        raise ValueError("max_refinements must be nonnegative")
    chunks = command_chunks(commands)
    tmp_root = path.parent.parent / "tmp"
    tmp_root.mkdir(parents=True, exist_ok=True)
    results: list[dict[str, Any]] = []
    for solver in solvers:
        created = core._run_json(
            ["session", "new", "--solver", solver, "--lane", "smt", "--label", label]
        )
        session_id = created.get("id")
        if type(session_id) is not str or not session_id:
            raise core.AuditError("piqd did not return a session id")
        record: dict[str, Any] = {"solver": solver, "created": created}
        try:
            assertions: list[dict[str, Any]] = []
            expected_commands = 0
            for index, chunk in enumerate(chunks):
                chunk_path = tmp_root / f"{path.stem}-{solver}-chunk-{index:03d}.smt2"
                chunk_path.write_bytes(("\n".join(chunk) + "\n").encode("ascii"))
                asserted = core._run_json(
                    [
                        "session",
                        "assert",
                        session_id,
                        "--expect-commands",
                        str(expected_commands),
                        "--file",
                        str(chunk_path),
                    ]
                )
                expected_commands += len(chunk)
                if asserted.get("commands") != expected_commands:
                    raise core.AuditError("piqd command count differs from emitted journal")
                assertions.append(asserted)
            iterations: list[dict[str, Any]] = []
            seen_cuts: set[tuple[str, ...]] = set()
            cegar_status = "REFINEMENT_BUDGET"
            solved: dict[str, Any] = {}
            for index in range(max_refinements + 1):
                solved = core._run_json(
                    ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
                    transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
                )
                iteration: dict[str, Any] = {"index": index, "solved": solved}
                iterations.append(iteration)
                if solved.get("status") != "SAT":
                    cegar_status = str(solved.get("status"))
                    break
                replay = solved.get("model_replay")
                model = solved.get("model")
                if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                    raise AssertionError("PIQD SAT model did not replay")
                if not isinstance(model, str):
                    raise TypeError("PIQD SAT model is missing")
                cell = decode_model(model)
                conflict = minimal_linear_conflict(cell, order)
                iteration.update(cell=cell, linear_conflict=conflict)
                if conflict is None:
                    cegar_status = "SAT_SURVIVOR"
                    break
                atoms = conflict.get("atoms")
                if not isinstance(atoms, tuple) or not all(
                    isinstance(atom, str) for atom in atoms
                ):
                    raise TypeError("transitive conflict atoms are malformed")
                if atoms in seen_cuts:
                    raise AssertionError("PIQD returned a model excluded by an earlier cut")
                if index == max_refinements:
                    break
                seen_cuts.add(atoms)
                cut = transitive_conflict_clause(conflict)
                asserted = core._run_json(
                    [
                        "session",
                        "assert",
                        session_id,
                        "--expect-commands",
                        str(expected_commands),
                        "--command",
                        cut,
                    ]
                )
                expected_commands += 1
                if asserted.get("commands") != expected_commands:
                    raise core.AuditError("piqd refinement command count drifted")
                iteration.update(cut=cut, asserted=asserted)
            receipts = core._run_json(["session", "receipts", session_id])
            record.update(
                assertions=assertions,
                iterations=iterations,
                cegar_status=cegar_status,
                solved=solved,
                receipts=receipts,
            )
        finally:
            record["closed"] = core._run_json(["session", "close", session_id])
        results.append(record)
    return results


def member(row: str, point: int) -> str:
    return f"m_{row}_{point}"


def role(name: str, point: int) -> str:
    return f"is_{name}_{point}"


def disjunction(literals: Iterable[str]) -> str:
    values = tuple(literals)
    if not values:
        raise ValueError("an SMT disjunction must be nonempty")
    if len(values) == 1:
        return values[0]
    return f"(or {' '.join(values)})"


def exactly_one(names: Iterable[str]) -> tuple[str, ...]:
    values = tuple(names)
    return (
        f"(assert {disjunction(values)})",
        *(
            f"(assert (or (not {left}) (not {right})))"
            for left, right in itertools.combinations(values, 2)
        ),
    )


def cardinality_clauses(
    names: Iterable[str], count: int, *, guard_disjuncts: Iterable[str] = ()
) -> tuple[str, ...]:
    """CNF clauses for ``guard -> exactly count names``."""
    values = tuple(names)
    guards = tuple(guard_disjuncts)
    if not 0 <= count <= len(values):
        raise ValueError("cardinality lies outside the variable family")
    commands: list[str] = []
    for chosen in itertools.combinations(values, count + 1):
        commands.append(
            f"(assert {disjunction((*guards, *(f'(not {name})' for name in chosen)))})"
        )
    for chosen in itertools.combinations(values, len(values) - count + 1):
        commands.append(f"(assert {disjunction((*guards, *chosen))})")
    return tuple(commands)


def at_least_clauses(names: Iterable[str], count: int) -> tuple[str, ...]:
    values = tuple(names)
    return tuple(
        f"(assert {disjunction(chosen)})"
        for chosen in itertools.combinations(values, len(values) - count + 1)
    )


def at_most_clauses(names: Iterable[str], count: int) -> tuple[str, ...]:
    values = tuple(names)
    return tuple(
        f"(assert {disjunction(f'(not {name})' for name in chosen)})"
        for chosen in itertools.combinations(values, count + 1)
    )


def kalmanson_forms(order: tuple[int, ...]) -> tuple[dict[str, object], ...]:
    if len(order) != 13 or set(order) != set(LABELS):
        raise ValueError("cyclic order must be a Fin-13 permutation")
    forms: list[dict[str, object]] = []
    for a, b, c, d in itertools.combinations(order, 4):
        positive = ((a, c), (b, d))
        for arm, negative in enumerate((((a, b), (c, d)), ((a, d), (b, c)))):
            forms.append(
                {
                    "form": (a, b, c, d, arm),
                    "positive": tuple(tuple(sorted(edge)) for edge in positive),
                    "negative": tuple(tuple(sorted(edge)) for edge in negative),
                }
            )
    return tuple(forms)


def equality_requirement(
    left: tuple[int, int], right: tuple[int, int]
) -> tuple[int, int, int] | None:
    shared = set(left) & set(right)
    if len(shared) != 1:
        return None
    center = shared.pop()
    left_other = left[0] if left[1] == center else left[1]
    right_other = right[0] if right[1] == center else right[1]
    if left_other == right_other:
        raise AssertionError("distinct distance edges collapsed unexpectedly")
    return center, left_other, right_other


def providers(center: int) -> tuple[str, ...]:
    if center == SECOND_APEX:
        return ("K", "L")
    if center == FIRST_APEX:
        return ("T",)
    return (f"G{center}", "C0", "C1")


def provider_atoms(
    provider: str, center: int, left: int, right: int
) -> tuple[str, ...]:
    atoms = [member(provider, left), member(provider, right)]
    if provider == "C0":
        atoms.insert(0, role("b0", center))
    elif provider == "C1":
        atoms.insert(0, role("b1", center))
    return tuple(atoms)


def conflict_bank(order: tuple[int, ...]) -> tuple[dict[str, object], ...]:
    """Enumerate every direct two-row one-form cancellation."""
    records: dict[tuple[str, ...], dict[str, object]] = {}
    for form in kalmanson_forms(order):
        positive = form["positive"]
        negative = form["negative"]
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise TypeError("malformed Kalmanson form")
        for permutation in itertools.permutations(negative):
            requirements = tuple(
                equality_requirement(left, right)
                for left, right in zip(positive, permutation, strict=True)
            )
            if any(requirement is None for requirement in requirements):
                continue
            first, second = requirements
            if first is None or second is None:
                raise AssertionError("filtered equality requirement vanished")
            for first_provider, second_provider in itertools.product(
                providers(first[0]), providers(second[0])
            ):
                atoms = tuple(
                    sorted(
                        set(
                            provider_atoms(first_provider, *first)
                            + provider_atoms(second_provider, *second)
                        )
                    )
                )
                if atoms in records:
                    continue
                records[atoms] = {
                    "atoms": atoms,
                    "form": form["form"],
                    "requirements": (first, second),
                    "providers": (first_provider, second_provider),
                }
    return tuple(records[key] for key in sorted(records))


def source_commands(linear_mode: str = "strict") -> tuple[str, ...]:
    if linear_mode not in {"equality", "strict"}:
        raise ValueError("linear_mode must be equality or strict")
    logic = "QF_LIA" if linear_mode == "equality" else "QF_LRA"
    commands: list[str] = [f"(set-logic {logic})"]
    all_rows = (*BASE_ROWS, *(f"G{center}" for center in GLOBAL_CENTERS))
    for row in all_rows:
        commands.extend(f"(declare-const {member(row, point)} Bool)" for point in LABELS)
    for name in ROLES:
        commands.extend(f"(declare-const {role(name, point)} Bool)" for point in LABELS)

    for name in ROLES:
        commands.extend(exactly_one(role(name, point) for point in LABELS))
    for apex in (SECOND_APEX, FIRST_APEX):
        commands.extend(
            (
                f"(assert (not {role('b0', apex)}))",
                f"(assert (not {role('b1', apex)}))",
            )
        )
    for point in LABELS:
        commands.append(
            f"(assert (or (not {role('b0', point)}) (not {role('b1', point)})))"
        )
        commands.append(
            f"(assert (or (not {role('b0', point)}) (not {member('C0', point)})))"
        )
        commands.append(
            f"(assert (or (not {role('b1', point)}) (not {member('C1', point)})))"
        )

    for row in BASE_ROWS:
        commands.extend(cardinality_clauses((member(row, point) for point in LABELS), 4))
    commands.extend(
        (
            f"(assert (not {member('K', SECOND_APEX)}))",
            f"(assert (not {member('L', SECOND_APEX)}))",
            f"(assert (not {member('T', FIRST_APEX)}))",
            f"(assert {member('T', 6)})",
            f"(assert {member('T', 7)})",
        )
    )

    for center in GLOBAL_CENTERS:
        row = f"G{center}"
        guard = (role("b0", center), role("b1", center))
        commands.extend(
            cardinality_clauses(
                (member(row, point) for point in LABELS),
                4,
                guard_disjuncts=guard,
            )
        )
        commands.append(f"(assert (not {member(row, center)}))")
        for point in LABELS:
            commands.extend(
                (
                    f"(assert (or (not {role('b0', center)}) (not {member(row, point)})))",
                    f"(assert (or (not {role('b1', center)}) (not {member(row, point)})))",
                )
            )

    for point in LABELS:
        partition = (
            role("z", point),
            member("C0", point),
            member("C1", point),
            member("K", point),
        )
        commands.extend(exactly_one(partition))
        commands.append(
            f"(assert (or (not {member('K', point)}) (not {member('L', point)})))"
        )
        commands.append(
            f"(assert (or (not {role('z', point)}) {member('L', point)}))"
        )
        if point not in I2:
            commands.append(f"(assert (not {role('z', point)}))")
        else:
            commands.append(f"(assert (or {member('K', point)} {member('L', point)}))")

    k_slice = tuple(member("K", point) for point in sorted(I2))
    commands.extend(at_least_clauses(k_slice, 2))
    commands.extend(at_most_clauses(k_slice, 3))
    for source_row in ("C0", "C1"):
        for triple in itertools.combinations(LABELS, 3):
            commands.append(
                f"(assert {disjunction(f'(not {member(row, point)})' for point in triple for row in (source_row, 'L'))})"
            )

    for point in LABELS:
        s0, s1, deleted = role("s0", point), role("s1", point), role("d", point)
        commands.extend(
            (
                f"(assert (or (not {s0}) (not {s1})))",
                f"(assert (or (not {s0}) {member('C0', point)}))",
                f"(assert (or (not {s1}) {member('C1', point)}))",
                f"(assert (or (not {s0}) (not {member('T', point)})))",
                f"(assert (or (not {s1}) (not {member('T', point)})))",
                f"(assert (or (not {deleted}) {member('T', point)}))",
                f"(assert (or (not {deleted}) (not {member('C0', point)})))",
                f"(assert (or (not {deleted}) (not {member('C1', point)})))",
                f"(assert (or (not {deleted}) {role('z', point)} {member('K', point)}))",
            )
        )
    return tuple(commands)


def distance_name(left: int, right: int) -> str:
    edge = distance_edge(left, right)
    return f"d_{edge[0]}_{edge[1]}"


def distance_metric_commands(
    order: tuple[int, ...], linear_mode: str = "strict"
) -> tuple[str, ...]:
    """Encode every row equality and strict cyclic Kalmanson inequality."""
    if linear_mode not in {"equality", "strict"}:
        raise ValueError("linear_mode must be equality or strict")
    distance_sort = "Int" if linear_mode == "equality" else "Real"
    commands = [
        f"(declare-const {distance_name(left, right)} {distance_sort})"
        for left, right in itertools.combinations(LABELS, 2)
    ]

    fixed_centers = {
        "K": SECOND_APEX,
        "L": SECOND_APEX,
        "T": FIRST_APEX,
        **{f"G{center}": center for center in GLOBAL_CENTERS},
    }
    for row, center in fixed_centers.items():
        for left, right in itertools.combinations(
            (point for point in LABELS if point != center), 2
        ):
            commands.append(
                f"(assert (=> (and {member(row, left)} {member(row, right)}) "
                f"(= {distance_name(center, left)} {distance_name(center, right)})))"
            )
    for row, blocker_role in (("C0", "b0"), ("C1", "b1")):
        for center in LABELS:
            for left, right in itertools.combinations(
                (point for point in LABELS if point != center), 2
            ):
                commands.append(
                    f"(assert (=> (and {role(blocker_role, center)} "
                    f"{member(row, left)} {member(row, right)}) "
                    f"(= {distance_name(center, left)} {distance_name(center, right)})))"
                )

    for form in kalmanson_forms(order):
        positive = form["positive"]
        negative = form["negative"]
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise TypeError("malformed Kalmanson form")
        p0, p1 = (distance_name(*edge) for edge in positive)
        n0, n1 = (distance_name(*edge) for edge in negative)
        if linear_mode == "strict":
            commands.append(f"(assert (> (+ {p0} {p1}) (+ {n0} {n1})))")
        else:
            commands.append(
                f"(assert (not (or (and (= {p0} {n0}) (= {p1} {n1})) "
                f"(and (= {p0} {n1}) (= {p1} {n0})))))"
            )
    return tuple(commands)


def build_commands(
    order: tuple[int, ...], linear_mode: str = "strict"
) -> tuple[tuple[str, ...], tuple[dict[str, object], ...]]:
    bank = conflict_bank(order)
    commands = list(source_commands(linear_mode))
    commands.extend(distance_metric_commands(order, linear_mode))
    commands.extend(
        f"(assert {disjunction(f'(not {atom})' for atom in record['atoms'])})"
        for record in bank
    )
    return tuple(commands), bank


def decode_model(model: str) -> dict[str, object]:
    true_names = set(
        re.findall(r"\(define-fun ([A-Za-z0-9_]+) \(\) Bool\s+true\)", model)
    )
    roles: dict[str, int] = {}
    for name in ROLES:
        selected = [point for point in LABELS if role(name, point) in true_names]
        if len(selected) != 1:
            raise AssertionError(f"model does not select one {name} label")
        roles[name] = selected[0]
    rows = {
        row: [point for point in LABELS if member(row, point) in true_names]
        for row in BASE_ROWS
    }
    globals_by_center = {
        str(center): [
            point for point in LABELS if member(f"G{center}", point) in true_names
        ]
        for center in GLOBAL_CENTERS
        if center not in (roles["b0"], roles["b1"])
    }
    cell: dict[str, object] = {
        "roles": roles,
        "base_rows": rows,
        "global_rows": globals_by_center,
    }
    validate_cell(cell)
    return cell


def validate_cell(cell: dict[str, object]) -> None:
    """Check the decoded finite cell without consulting its SMT journal."""
    roles = cell.get("roles")
    rows = cell.get("base_rows")
    globals_by_center = cell.get("global_rows")
    if not isinstance(roles, dict) or not isinstance(rows, dict):
        raise TypeError("decoded roles and base rows must be objects")
    if not isinstance(globals_by_center, dict):
        raise TypeError("decoded global rows must be an object")
    if set(roles) != set(ROLES) or any(value not in LABELS for value in roles.values()):
        raise AssertionError("decoded role family is incomplete")
    typed_roles = {name: int(value) for name, value in roles.items()}
    if typed_roles["b0"] in (SECOND_APEX, FIRST_APEX):
        raise AssertionError("first blocker is an apex")
    if typed_roles["b1"] in (SECOND_APEX, FIRST_APEX):
        raise AssertionError("second blocker is an apex")
    if typed_roles["b0"] == typed_roles["b1"]:
        raise AssertionError("blocker labels coincide")

    supports = {name: set(rows.get(name, ())) for name in BASE_ROWS}
    if any(len(supports[name]) != 4 for name in BASE_ROWS):
        raise AssertionError("a base row does not have four labels")
    if typed_roles["b0"] in supports["C0"]:
        raise AssertionError("C0 contains its blocker center")
    if typed_roles["b1"] in supports["C1"]:
        raise AssertionError("C1 contains its blocker center")
    if SECOND_APEX in supports["K"] or SECOND_APEX in supports["L"]:
        raise AssertionError("a second-apex row contains its center")
    if FIRST_APEX in supports["T"] or not I1 <= supports["T"]:
        raise AssertionError("the first-apex row violates its literal incidences")

    z = typed_roles["z"]
    if z not in I2 or z not in supports["L"]:
        raise AssertionError("the uncovered label is outside its raw interval or L")
    if supports["K"] & supports["L"]:
        raise AssertionError("the second-apex rows overlap")
    for point in LABELS:
        count = int(point == z) + sum(
            point in supports[name] for name in ("C0", "C1", "K")
        )
        if count != 1:
            raise AssertionError("C0/C1/K/z do not partition the carrier")
    if not I2 <= supports["K"] | supports["L"]:
        raise AssertionError("the second-opposite interval is not covered")
    if len(supports["K"] & I2) not in (2, 3):
        raise AssertionError("the second-opposite slice is not 2+3")
    if len(supports["C0"] & supports["L"]) > 2:
        raise AssertionError("C0/L intersection exceeds two")
    if len(supports["C1"] & supports["L"]) > 2:
        raise AssertionError("C1/L intersection exceeds two")

    s0, s1, deleted = (
        typed_roles["s0"],
        typed_roles["s1"],
        typed_roles["d"],
    )
    if s0 == s1 or s0 not in supports["C0"] or s0 in supports["T"]:
        raise AssertionError("first source incidence is invalid")
    if s1 not in supports["C1"] or s1 in supports["T"]:
        raise AssertionError("second source incidence is invalid")
    if (
        deleted not in supports["T"]
        or deleted in supports["C0"]
        or deleted in supports["C1"]
        or not (deleted == z or deleted in supports["K"])
    ):
        raise AssertionError("common deletion incidence is invalid")

    expected_centers = set(GLOBAL_CENTERS) - {
        typed_roles["b0"],
        typed_roles["b1"],
    }
    if set(globals_by_center) != {str(center) for center in expected_centers}:
        raise AssertionError("global K4 center family is incomplete")
    for center in expected_centers:
        support = set(globals_by_center[str(center)])
        if len(support) != 4 or center in support:
            raise AssertionError("global K4 row is malformed")


def cell_rows(cell: dict[str, object]) -> tuple[tuple[str, int, tuple[int, ...]], ...]:
    """Return every active equal-distance row in a validated decoded cell."""
    validate_cell(cell)
    roles = cell["roles"]
    base_rows = cell["base_rows"]
    global_rows = cell["global_rows"]
    if not isinstance(roles, dict) or not isinstance(base_rows, dict):
        raise TypeError("decoded base cell is malformed")
    if not isinstance(global_rows, dict):
        raise TypeError("decoded global rows are malformed")
    centers = {
        "C0": int(roles["b0"]),
        "C1": int(roles["b1"]),
        "K": SECOND_APEX,
        "L": SECOND_APEX,
        "T": FIRST_APEX,
    }
    rows = [
        (name, centers[name], tuple(sorted(int(point) for point in base_rows[name])))
        for name in BASE_ROWS
    ]
    rows.extend(
        (f"G{center}", center, tuple(sorted(int(point) for point in support)))
        for center_text, support in sorted(global_rows.items(), key=lambda row: int(row[0]))
        for center in (int(center_text),)
    )
    return tuple(rows)


def distance_edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError("a distance edge must have distinct endpoints")
    return (left, right) if left < right else (right, left)


def edge_roots_for_rows(
    rows: tuple[tuple[str, int, tuple[int, ...]], ...]
) -> dict[tuple[int, int], tuple[int, int]]:
    """Compute the equality-class representative of every Fin-13 distance edge."""
    edges = tuple(distance_edge(left, right) for left, right in itertools.combinations(LABELS, 2))
    parent = {edge: edge for edge in edges}

    def find(edge: tuple[int, int]) -> tuple[int, int]:
        root = parent[edge]
        if root != edge:
            parent[edge] = find(root)
        return parent[edge]

    def union(left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = find(left)
        right_root = find(right)
        if left_root != right_root:
            parent[max(left_root, right_root)] = min(left_root, right_root)

    for _name, center, support in rows:
        anchor = distance_edge(center, support[0])
        for point in support[1:]:
            union(anchor, distance_edge(center, point))
    return {edge: find(edge) for edge in edges}


def zero_form_for_rows(
    rows: tuple[tuple[str, int, tuple[int, ...]], ...], order: tuple[int, ...]
) -> tuple[int, ...] | None:
    """Find a Kalmanson form killed by the transitive closure of row equalities."""
    roots = edge_roots_for_rows(rows)
    for form in kalmanson_forms(order):
        positive = form["positive"]
        negative = form["negative"]
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise TypeError("malformed Kalmanson form")
        positive_roots = sorted(roots[distance_edge(*edge)] for edge in positive)
        negative_roots = sorted(roots[distance_edge(*edge)] for edge in negative)
        if positive_roots == negative_roots:
            value = form["form"]
            if not isinstance(value, tuple):
                raise TypeError("malformed Kalmanson form identifier")
            return value
    return None


def projected_kalmanson_forms(
    cell: dict[str, object], order: tuple[int, ...]
) -> tuple[dict[str, object], ...]:
    """Project and deduplicate all strict cyclic forms through row equalities."""
    roots = edge_roots_for_rows(cell_rows(cell))
    first_by_vector: dict[tuple[tuple[tuple[int, int], int], ...], tuple[int, ...]] = {}
    for form in kalmanson_forms(order):
        positive = form["positive"]
        negative = form["negative"]
        value = form["form"]
        if not isinstance(positive, tuple) or not isinstance(negative, tuple):
            raise TypeError("malformed Kalmanson form")
        if not isinstance(value, tuple):
            raise TypeError("malformed Kalmanson form identifier")
        vector: Counter[tuple[int, int]] = Counter(
            roots[distance_edge(*edge)] for edge in positive
        )
        vector.subtract(roots[distance_edge(*edge)] for edge in negative)
        projected = tuple(sorted((edge, coefficient) for edge, coefficient in vector.items() if coefficient))
        first_by_vector.setdefault(projected, value)
    return tuple(
        {"form": first_by_vector[vector], "vector": vector}
        for vector in sorted(first_by_vector)
    )


def projected_form_vector(
    form: dict[str, object], roots: dict[tuple[int, int], tuple[int, int]]
) -> tuple[tuple[tuple[int, int], int], ...]:
    positive = form["positive"]
    negative = form["negative"]
    if not isinstance(positive, tuple) or not isinstance(negative, tuple):
        raise TypeError("malformed Kalmanson form")
    vector: Counter[tuple[int, int]] = Counter(
        roots[distance_edge(*edge)] for edge in positive
    )
    vector.subtract(roots[distance_edge(*edge)] for edge in negative)
    return tuple(sorted((edge, coefficient) for edge, coefficient in vector.items() if coefficient))


def minimal_pair_cancellation_conflict(
    cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object] | None:
    """Find two strict forms whose sum vanishes after a row-minimal equality set."""
    rows = cell_rows(cell)
    forms = kalmanson_forms(order)
    full_roots = edge_roots_for_rows(rows)
    first_by_vector: dict[
        tuple[tuple[tuple[int, int], int], ...], dict[str, object]
    ] = {}
    candidates: list[tuple[dict[str, object], dict[str, object]]] = []
    for form in forms:
        vector = projected_form_vector(form, full_roots)
        negative = tuple((edge, -coefficient) for edge, coefficient in vector)
        if vector and negative in first_by_vector:
            candidates.append((first_by_vector[negative], form))
        first_by_vector.setdefault(vector, form)
    for left_form, right_form in candidates:
        for count in range(1, len(rows) + 1):
            for chosen in itertools.combinations(rows, count):
                roots = edge_roots_for_rows(chosen)
                total: Counter[tuple[int, int]] = Counter(
                    dict(projected_form_vector(left_form, roots))
                )
                total.update(dict(projected_form_vector(right_form, roots)))
                if +total or -total:
                    continue
                atoms = tuple(
                    sorted(
                        {
                            atom
                            for name, center, support in chosen
                            for atom in row_pin_atoms(name, center, support)
                        }
                    )
                )
                return {
                    "kind": "two-form-cone-row-pin",
                    "forms": (left_form["form"], right_form["form"]),
                    "rows": tuple(
                        {"name": name, "center": center, "support": support}
                        for name, center, support in chosen
                    ),
                    "atoms": atoms,
                }
    return None


def linear_sum(terms: Iterable[str]) -> str:
    values = tuple(terms)
    if not values:
        return "0"
    if len(values) == 1:
        return values[0]
    return f"(+ {' '.join(values)})"


def cone_commands(cell: dict[str, object], order: tuple[int, ...]) -> tuple[str, ...]:
    """Ask whether a nonzero nonnegative sum of projected strict forms is zero."""
    forms = projected_kalmanson_forms(cell, order)
    commands = ["(set-logic QF_LRA)"]
    weights = tuple(f"w_{index}" for index in range(len(forms)))
    for weight in weights:
        commands.extend((f"(declare-const {weight} Real)", f"(assert (>= {weight} 0))"))
    commands.append(f"(assert (= {linear_sum(weights)} 1))")
    coordinates = sorted(
        {edge for form in forms for edge, _coefficient in form["vector"]}
    )
    for coordinate in coordinates:
        terms = (
            f"(* {dict(form['vector']).get(coordinate)} {weights[index]})"
            for index, form in enumerate(forms)
            if coordinate in dict(form["vector"])
        )
        commands.append(f"(assert (= {linear_sum(terms)} 0))")
    return tuple(commands)


def squared_distance(left: int, right: int) -> str:
    return (
        f"(+ (* (- x_{left} x_{right}) (- x_{left} x_{right})) "
        f"(* (- y_{left} y_{right}) (- y_{left} y_{right})))"
    )


def left_turn(a: int, b: int, c: int) -> str:
    return (
        f"(- (* (- x_{b} x_{a}) (- y_{c} y_{a})) "
        f"(* (- y_{b} y_{a}) (- x_{c} x_{a})))"
    )


def planar_commands(cell: dict[str, object], order: tuple[int, ...]) -> tuple[str, ...]:
    """Encode one decoded cell as a source-entitled planar QF_NRA realization."""
    rows = cell_rows(cell)
    commands = ["(set-logic QF_NRA)"]
    for label in LABELS:
        commands.extend(
            (f"(declare-const x_{label} Real)", f"(declare-const y_{label} Real)")
        )
    first, second = order[:2]
    commands.extend(
        (
            f"(assert (= x_{first} 0))",
            f"(assert (= y_{first} 0))",
            f"(assert (= x_{second} 1))",
            f"(assert (= y_{second} 0))",
        )
    )
    for index, a in enumerate(order):
        b = order[(index + 1) % len(order)]
        commands.extend(
            f"(assert (> {left_turn(a, b, c)} 0))" for c in order if c not in {a, b}
        )
    for name, center, support in rows:
        radius = f"r2_{name}"
        commands.extend((f"(declare-const {radius} Real)", f"(assert (> {radius} 0))"))
        commands.extend(
            f"(assert (= {squared_distance(center, point)} {radius}))"
            for point in support
        )
        if name in {"K", "L", "T"}:
            commands.extend(
                f"(assert (distinct {squared_distance(center, point)} {radius}))"
                for point in LABELS
                if point != center and point not in support
            )
    commands.append("(assert (distinct r2_K r2_L))")
    return tuple(commands)


def row_pin_atoms(name: str, center: int, support: tuple[int, ...]) -> tuple[str, ...]:
    atoms = [member(name, point) for point in support]
    if name == "C0":
        atoms.append(role("b0", center))
    elif name == "C1":
        atoms.append(role("b1", center))
    return tuple(sorted(atoms))


def minimal_transitive_conflict(
    cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object] | None:
    """Extract a row-minimal, source-entitled transitive zero-form conflict."""
    rows = cell_rows(cell)
    for count in range(1, len(rows) + 1):
        for chosen in itertools.combinations(rows, count):
            form = zero_form_for_rows(chosen, order)
            if form is None:
                continue
            atoms = tuple(
                sorted(
                    {
                        atom
                        for name, center, support in chosen
                        for atom in row_pin_atoms(name, center, support)
                    }
                )
            )
            return {
                "kind": "transitive-row-pin",
                "form": form,
                "rows": tuple(
                    {"name": name, "center": center, "support": support}
                    for name, center, support in chosen
                ),
                "atoms": atoms,
            }
    return None


def minimal_linear_conflict(
    cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object] | None:
    conflict = minimal_transitive_conflict(cell, order)
    if conflict is not None:
        return conflict
    return minimal_pair_cancellation_conflict(cell, order)


def transitive_conflict_clause(conflict: dict[str, object]) -> str:
    atoms = conflict.get("atoms")
    if not isinstance(atoms, tuple) or not atoms:
        raise TypeError("transitive conflict must contain atoms")
    if not all(isinstance(atom, str) for atom in atoms):
        raise TypeError("transitive conflict atoms must be strings")
    return f"(assert {disjunction(f'(not {atom})' for atom in atoms)})"


def canonical_json_bytes(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode() + b"\n"


def run_cone_checks(
    root_journal: Path,
    decoded: list[dict[str, Any]],
    order: tuple[int, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
) -> list[dict[str, Any]]:
    checks: list[dict[str, Any]] = []
    for entry in decoded:
        source_solver = entry.get("solver")
        cell = entry.get("cell")
        if not isinstance(source_solver, str) or not isinstance(cell, dict):
            raise TypeError("decoded SAT entry is malformed")
        commands = cone_commands(cell, order)
        journal = ("\n".join(commands) + "\n").encode("ascii")
        path = root_journal.with_name(f"{root_journal.stem}-{source_solver}-cone.smt2")
        path.write_bytes(journal)
        forms = projected_kalmanson_forms(cell, order)
        checks.append(
            {
                "source_solver": source_solver,
                "cell_sha256": hashlib.sha256(canonical_json_bytes(cell)).hexdigest(),
                "projected_form_count": len(forms),
                "has_zero_form": any(not form["vector"] for form in forms),
                "journal": str(path),
                "journal_sha256": hashlib.sha256(journal).hexdigest(),
                "solves": core.run_piqd(
                    path,
                    commands,
                    solvers,
                    timeout_ms,
                    label=f"cardge13-exact13-global-{source_solver}-cone",
                ),
            }
        )
    return checks


def run_planar_checks(
    root_journal: Path,
    decoded: list[dict[str, Any]],
    order: tuple[int, ...],
    solvers: tuple[str, ...],
    timeout_ms: int,
) -> list[dict[str, Any]]:
    checks: list[dict[str, Any]] = []
    for entry in decoded:
        source_solver = entry.get("solver")
        cell = entry.get("cell")
        if not isinstance(source_solver, str) or not isinstance(cell, dict):
            raise TypeError("decoded SAT entry is malformed")
        commands = planar_commands(cell, order)
        journal = ("\n".join(commands) + "\n").encode("ascii")
        path = root_journal.with_name(f"{root_journal.stem}-{source_solver}-planar.smt2")
        path.write_bytes(journal)
        checks.append(
            {
                "source_solver": source_solver,
                "cell_sha256": hashlib.sha256(canonical_json_bytes(cell)).hexdigest(),
                "journal": str(path),
                "journal_sha256": hashlib.sha256(journal).hexdigest(),
                "command_count": len(commands),
                "solves": core.run_piqd(
                    path,
                    commands,
                    solvers,
                    timeout_ms,
                    label=f"cardge13-exact13-global-{source_solver}-planar",
                ),
            }
        )
    return checks


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), default="direct")
    parser.add_argument("--linear-mode", choices=("equality", "strict"), default="strict")
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--event", type=Path, required=True)
    parser.add_argument("--solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    parser.add_argument("--max-refinements", type=int, default=25)
    parser.add_argument("--cone-solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--cone-timeout-ms", type=int, default=120_000)
    parser.add_argument("--planar-solver", action="append", choices=("z3", "cvc5"))
    parser.add_argument("--planar-timeout-ms", type=int, default=120_000)
    args = parser.parse_args()

    order = DIRECT_ORDER if args.orientation == "direct" else MIRROR_ORDER
    commands, bank = build_commands(order, args.linear_mode)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_bytes(journal)
    solves = (
        run_piqd_chunked(
            args.out,
            commands,
            tuple(args.solver or ()),
            args.timeout_ms,
            label=f"cardge13-exact13-global-source-cell-{args.orientation}",
            order=order,
            max_refinements=args.max_refinements,
        )
        if args.solver
        else []
    )
    decoded: list[dict[str, Any]] = []
    for solve in solves:
        result = solve.get("solved")
        if not isinstance(result, dict):
            raise TypeError("PIQD solve response is malformed")
        if result.get("status") == "SAT":
            replay = result.get("model_replay")
            model = result.get("model")
            if not isinstance(replay, dict) or replay.get("outcome") != "SATISFIED":
                raise AssertionError("PIQD SAT model did not replay")
            if not isinstance(model, str):
                raise TypeError("PIQD SAT model is missing")
            decoded.append({"solver": solve["solver"], "cell": decode_model(model)})
    cone_checks = run_cone_checks(
        args.out,
        decoded,
        order,
        tuple(args.cone_solver or ()),
        args.cone_timeout_ms,
    ) if args.cone_solver else []
    planar_checks = run_planar_checks(
        args.out,
        decoded,
        order,
        tuple(args.planar_solver or ()),
        args.planar_timeout_ms,
    ) if args.planar_solver else []
    bank_payload = canonical_json_bytes(bank)
    report = {
        "schema": SCHEMA,
        "claim_boundary": (
            "all source-combinatorial direct or mirror five-row cells plus global K4 "
            "rows; includes all row-forced distance equalities and all strict linear "
            "Kalmanson inequalities; formula-scoped diagnostic"
        ),
        "orientation": args.orientation,
        "linear_mode": args.linear_mode,
        "order": list(order),
        "command_count": len(commands),
        "conflict_count": len(bank),
        "distance_metric_command_count": len(
            distance_metric_commands(order, args.linear_mode)
        ),
        "conflict_bank_sha256": hashlib.sha256(bank_payload).hexdigest(),
        "journal": str(args.out),
        "journal_sha256": hashlib.sha256(journal).hexdigest(),
        "solves": solves,
        "decoded_sat_models": decoded,
        "cegar_statuses": [solve.get("cegar_status") for solve in solves],
        "cone_checks": cone_checks,
        "planar_checks": planar_checks,
    }
    args.event.parent.mkdir(parents=True, exist_ok=True)
    args.event.write_bytes(canonical_json_bytes(report))
    print(
        json.dumps(
            {
                "commands": len(commands),
                "conflicts": len(bank),
                "journal_sha256": report["journal_sha256"],
                "statuses": [row.get("solved", {}).get("status") for row in solves],
                "cegar_statuses": [row.get("cegar_status") for row in solves],
                "cone_statuses": [
                    solve.get("solved", {}).get("status")
                    for check in cone_checks
                    for solve in check["solves"]
                ],
                "planar_statuses": [
                    solve.get("solved", {}).get("status")
                    for check in planar_checks
                    for solve in check["solves"]
                ],
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
