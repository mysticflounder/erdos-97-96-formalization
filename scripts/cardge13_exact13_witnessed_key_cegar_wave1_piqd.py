#!/usr/bin/env python3
"""Bounded PIQD CEGAR over the exact witnessed-Key Boolean root.

The root is exactly ``Key.Valid``.  A learned clause is admitted only after an
independent replay shows that provider-tagged row incidences force a strict
one-form or positive two-form Kalmanson sum to project to zero.  This is
solver-only discovery evidence, not a Lean theorem or a promotion artifact.
"""

from __future__ import annotations

import argparse
import fcntl
import hashlib
import itertools
import json
import os
import subprocess
import time
from collections import Counter, defaultdict
from collections.abc import Iterable
from pathlib import Path
from typing import Any

import cardge13_exact13_global_source_cell_boolean_path_cegar_piqd as paths
import cardge13_exact13_global_source_cell_boolean_path_pair_cegar_piqd as pairs
import cardge13_exact13_global_source_cell_csp_piqd as legacy
import cardge13_exact13_witnessed_key_root_piqd as root

SCHEMA = "cardge13-exact13-witnessed-key-cegar-wave1-piqd/v1"
CUT_SCHEMA = "cardge13-exact13-witnessed-key-incidence-cut/v1"
MODEL_SCHEMA = "cardge13-exact13-witnessed-key-model/v1"
STATE_SCHEMA = "cardge13-exact13-witnessed-key-cegar-state/v1"
CUSTODY_SCHEMA = "cardge13-exact13-witnessed-key-cegar-custody/v1"
ROOT_REPAIR_SCHEMA = "cardge13-exact13-witnessed-key-effective-root/v1"
MIGRATION_SCHEMA = "cardge13-exact13-witnessed-key-cut-migration/v1"
DEFAULT_SOLVER = "piqd-satworker-cadical-3.0.1"
DEFAULT_CONE_SOLVER = "cvc5"
DEFAULT_SOURCE = Path(
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "CardGeThirteenExact13SourceIndexedFiniteKey.lean"
)
DEFAULT_RUN_ROOT = Path(
    "scratch/runs/exact13-witnessed-key-cegar-wave1-20260906/run-0001"
)
Edge = tuple[int, int]
Row = tuple[str, int, tuple[int, ...]]


class AuditError(RuntimeError):
    """Fail-closed custody or semantic replay error."""


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode()


def sha256(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def seal(value: dict[str, object]) -> dict[str, object]:
    result = dict(value)
    result["event_sha256"] = sha256(canonical(result))
    return result


def atomic_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    payload = canonical(value) + b"\n"
    with temporary.open("wb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())
    temporary.replace(path)


def write_once(path: Path, payload: bytes) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists():
        if path.read_bytes() != payload:
            raise AuditError(f"immutable artifact drift: {path}")
        return
    with path.open("xb") as stream:
        stream.write(payload)
        stream.flush()
        os.fsync(stream.fileno())


def append_jsonl(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("ab") as stream:
        stream.write(canonical(value) + b"\n")
        stream.flush()
        os.fsync(stream.fileno())


def run_piqc(arguments: list[str], *, transport_timeout: float = 180.0) -> dict[str, Any]:
    completed = subprocess.run(
        ["piqc", *arguments],
        check=False,
        capture_output=True,
        text=True,
        timeout=transport_timeout,
    )
    if completed.returncode != 0:
        raise AuditError(
            f"piqc {' '.join(arguments[:3])} failed: {completed.stderr[:1000]}"
        )
    value = json.loads(completed.stdout)
    if not isinstance(value, dict):
        raise AuditError("piqc response is not a JSON object")
    return value


def export_piqd_session(session_id: str, path: Path) -> str:
    """Export a PIQD session; unlike other commands this returns plain text."""
    completed = subprocess.run(
        ["piqc", "session", "export", session_id, "--out", str(path)],
        check=False,
        capture_output=True,
        text=True,
        timeout=180.0,
    )
    if completed.returncode != 0:
        raise AuditError(f"piqc session export failed: {completed.stderr[:1000]}")
    return completed.stdout.strip()


def key_cell(key: dict[str, object]) -> dict[str, object]:
    """Translate a replayed Key to the legacy learner's raw-label cell shape.

    This deliberately does not call the legacy validator: that validator adds
    the obsolete ``{6,7} subset T`` restriction absent from the new Key.Valid.
    """
    roles = key.get("roles")
    if not isinstance(roles, dict):
        raise AuditError("decoded Key roles are malformed")
    typed_roles = {name: int(roles[name]) for name in legacy.ROLES}
    raw_rows = {
        name: sorted(root.raw_support(key, name))
        for name in root.ROWS
    }
    blockers = {typed_roles["b0"], typed_roles["b1"]}
    global_rows: dict[str, list[int]] = {}
    for center in root.GLOBAL_CENTERS:
        support = raw_rows[f"G{center}"]
        if center in blockers:
            if support:
                raise AuditError("blocker-centered global row is not empty")
        else:
            if len(support) != 4 or center in support:
                raise AuditError("active global row is malformed")
            global_rows[str(center)] = support
    return {
        "roles": typed_roles,
        "base_rows": {name: raw_rows[name] for name in root.BASE_ROWS},
        "global_rows": global_rows,
    }


def cell_rows(cell: dict[str, object]) -> tuple[Row, ...]:
    roles = cell.get("roles")
    base_rows = cell.get("base_rows")
    global_rows = cell.get("global_rows")
    if not isinstance(roles, dict) or not isinstance(base_rows, dict):
        raise AuditError("translated base cell is malformed")
    if not isinstance(global_rows, dict):
        raise AuditError("translated global rows are malformed")
    centers = {
        "C0": int(roles["b0"]),
        "C1": int(roles["b1"]),
        "K": root.SECOND_APEX,
        "L": root.SECOND_APEX,
        "T": root.FIRST_APEX,
    }
    rows: list[Row] = []
    for name in root.BASE_ROWS:
        support = tuple(sorted(int(point) for point in base_rows[name]))
        if len(support) != 4 or centers[name] in support:
            raise AuditError(f"translated row {name} is malformed")
        rows.append((name, centers[name], support))
    for center_text, raw_support in sorted(
        global_rows.items(), key=lambda item: int(item[0])
    ):
        center = int(center_text)
        support = tuple(sorted(int(point) for point in raw_support))
        if len(support) != 4 or center in support:
            raise AuditError(f"translated global row G{center} is malformed")
        rows.append((f"G{center}", center, support))
    return tuple(rows)


def equality_graph(rows: tuple[Row, ...]) -> dict[
    Edge, tuple[tuple[Edge, tuple[str, ...], dict[str, object]], ...]
]:
    """Build the established provider-tagged graph without legacy validation."""
    graph: dict[
        Edge, list[tuple[Edge, tuple[str, ...], dict[str, object]]]
    ] = defaultdict(list)
    for name, center, support in rows:
        for left, right in itertools.combinations(support, 2):
            left_edge = legacy.distance_edge(center, left)
            right_edge = legacy.distance_edge(center, right)
            atoms = legacy.row_pin_atoms(name, center, (left, right))
            step = {
                "row": name,
                "center": center,
                "left_support": left,
                "right_support": right,
                "left_edge": left_edge,
                "right_edge": right_edge,
            }
            graph[left_edge].append((right_edge, atoms, step))
            reverse = dict(step)
            reverse.update(
                left_support=right,
                right_support=left,
                left_edge=right_edge,
                right_edge=left_edge,
            )
            graph[right_edge].append((left_edge, atoms, reverse))
    return {
        edge: tuple(sorted(neighbors, key=lambda item: (item[0], item[1])))
        for edge, neighbors in graph.items()
    }


def _path_conflict_for_forms(
    graph: dict[Edge, tuple[tuple[Edge, tuple[str, ...], dict[str, object]], ...]],
    forms: tuple[dict[str, object], ...],
    kind: str,
) -> dict[str, object] | None:
    left_edges = tuple(
        legacy.distance_edge(*edge)
        for form in forms
        for edge in form["positive"]  # type: ignore[union-attr]
    )
    right_edges = tuple(
        legacy.distance_edge(*edge)
        for form in forms
        for edge in form["negative"]  # type: ignore[union-attr]
    )
    best: tuple[tuple[object, ...], dict[str, object]] | None = None
    for permutation in itertools.permutations(right_edges):
        witnesses = tuple(
            paths.shortest_incidence_path(graph, left, right)
            for left, right in zip(left_edges, permutation, strict=True)
        )
        if any(witness is None for witness in witnesses):
            continue
        concrete = tuple(witness for witness in witnesses if witness is not None)
        atoms = tuple(
            sorted({atom for path_atoms, _steps in concrete for atom in path_atoms})
        )
        if not atoms:
            continue
        pairings = tuple(
            {"left": left, "right": right, "steps": steps}
            for left, right, (_atoms, steps) in zip(
                left_edges, permutation, concrete, strict=True
            )
        )
        identifiers = tuple(tuple(form["form"]) for form in forms)  # type: ignore[arg-type]
        conflict: dict[str, object] = {
            "kind": kind,
            "pairings": pairings,
            "atoms": atoms,
        }
        if len(identifiers) == 1:
            conflict["form"] = identifiers[0]
        else:
            conflict["forms"] = identifiers
        key: tuple[object, ...] = (
            len(atoms),
            sum(len(steps) for _path_atoms, steps in concrete),
            identifiers,
            permutation,
            atoms,
        )
        if best is None or key < best[0]:
            best = (key, conflict)
    return None if best is None else best[1]


def projected_vector(
    form: dict[str, object], roots: dict[Edge, Edge]
) -> tuple[tuple[Edge, int], ...]:
    value: Counter[Edge] = Counter(
        roots[legacy.distance_edge(*edge)]
        for edge in form["positive"]  # type: ignore[union-attr]
    )
    value.subtract(
        roots[legacy.distance_edge(*edge)]
        for edge in form["negative"]  # type: ignore[union-attr]
    )
    return tuple(sorted((edge, coefficient) for edge, coefficient in value.items() if coefficient))


def find_conflict(cell: dict[str, object], order: tuple[int, ...]) -> dict[str, object] | None:
    """Use established incidence paths for one form, then two positive forms."""
    rows = cell_rows(cell)
    graph = equality_graph(rows)
    forms = legacy.kalmanson_forms(order)
    best_one: tuple[tuple[object, ...], dict[str, object]] | None = None
    for form in forms:
        conflict = _path_conflict_for_forms(graph, (form,), "transitive-incidence-path")
        if conflict is None:
            continue
        key = (len(conflict["atoms"]), conflict["form"])  # type: ignore[arg-type]
        if best_one is None or key < best_one[0]:
            best_one = (key, conflict)
    if best_one is not None:
        return best_one[1]

    roots = legacy.edge_roots_for_rows(rows)
    first_by_vector: dict[tuple[tuple[Edge, int], ...], dict[str, object]] = {}
    candidates: list[tuple[dict[str, object], dict[str, object]]] = []
    for form in forms:
        vector = projected_vector(form, roots)
        opposite = tuple((edge, -coefficient) for edge, coefficient in vector)
        if vector and opposite in first_by_vector:
            candidates.append((first_by_vector[opposite], form))
        first_by_vector.setdefault(vector, form)
    best_two: tuple[tuple[object, ...], dict[str, object]] | None = None
    for left, right in candidates:
        conflict = _path_conflict_for_forms(
            graph, (left, right), "two-form-incidence-path"
        )
        if conflict is None:
            continue
        key = (len(conflict["atoms"]), conflict["forms"])  # type: ignore[arg-type]
        if best_two is None or key < best_two[0]:
            best_two = (key, conflict)
    return None if best_two is None else best_two[1]


def conflict_forms(
    conflict: dict[str, object], order: tuple[int, ...]
) -> tuple[dict[str, object], ...]:
    if conflict.get("kind") == "transitive-incidence-path":
        raw_ids = (conflict.get("form"),)
    elif conflict.get("kind") == "two-form-incidence-path":
        value = conflict.get("forms")
        if not isinstance(value, (tuple, list)) or len(value) != 2:
            raise AuditError("two-form conflict identifiers are malformed")
        raw_ids = tuple(value)
    else:
        raise AuditError("unsupported conflict kind")
    result = []
    for raw_id in raw_ids:
        if not isinstance(raw_id, (tuple, list)):
            raise AuditError("conflict form identifier is malformed")
        result.append(pairs.form_by_id(order, tuple(int(item) for item in raw_id)))
    return tuple(result)


def replay_zero_sum(
    conflict: dict[str, object], cell: dict[str, object], order: tuple[int, ...]
) -> dict[str, object]:
    """Independently replay paths, provider atoms, and the exact zero vector."""
    forms = conflict_forms(conflict, order)
    rows = {name: (center, set(support)) for name, center, support in cell_rows(cell)}
    raw_pairings = conflict.get("pairings")
    raw_atoms = conflict.get("atoms")
    if not isinstance(raw_pairings, (tuple, list)):
        raise AuditError("conflict pairings are malformed")
    if not isinstance(raw_atoms, (tuple, list)) or not raw_atoms:
        raise AuditError("conflict atoms are malformed")
    atoms = tuple(str(atom) for atom in raw_atoms)
    expected_left = sorted(
        legacy.distance_edge(*edge)
        for form in forms
        for edge in form["positive"]  # type: ignore[union-attr]
    )
    expected_right = sorted(
        legacy.distance_edge(*edge)
        for form in forms
        for edge in form["negative"]  # type: ignore[union-attr]
    )
    actual_left: list[Edge] = []
    actual_right: list[Edge] = []
    used_atoms: set[str] = set()
    equalities: list[tuple[Edge, Edge]] = []
    step_count = 0
    for raw_pairing in raw_pairings:
        if not isinstance(raw_pairing, dict):
            raise AuditError("path pairing is malformed")
        left = tuple(int(item) for item in raw_pairing["left"])
        right = tuple(int(item) for item in raw_pairing["right"])
        if len(left) != 2 or len(right) != 2:
            raise AuditError("paired distance edge is malformed")
        left_edge = legacy.distance_edge(*left)
        right_edge = legacy.distance_edge(*right)
        actual_left.append(left_edge)
        actual_right.append(right_edge)
        current = left_edge
        steps = raw_pairing.get("steps")
        if not isinstance(steps, (tuple, list)):
            raise AuditError("path steps are malformed")
        for step in steps:
            if not isinstance(step, dict):
                raise AuditError("path step is malformed")
            name = str(step["row"])
            if name not in rows:
                raise AuditError("path uses an inactive provider row")
            center, support = rows[name]
            left_support = int(step["left_support"])
            right_support = int(step["right_support"])
            if int(step["center"]) != center:
                raise AuditError("path provider center drifted")
            if left_support not in support or right_support not in support:
                raise AuditError("path uses an absent row incidence")
            step_left = legacy.distance_edge(center, left_support)
            step_right = legacy.distance_edge(center, right_support)
            if tuple(step["left_edge"]) != step_left or tuple(step["right_edge"]) != step_right:
                raise AuditError("path step edge does not follow its incidences")
            if current != step_left:
                raise AuditError("path steps are disconnected")
            used_atoms.update(
                legacy.row_pin_atoms(name, center, (left_support, right_support))
            )
            equalities.append((step_left, step_right))
            current = step_right
            step_count += 1
        if current != right_edge:
            raise AuditError("path does not reach its paired edge")
    if sorted(actual_left) != expected_left or sorted(actual_right) != expected_right:
        raise AuditError("pairings do not cover the form terms exactly")
    if tuple(sorted(used_atoms)) != tuple(sorted(atoms)):
        raise AuditError("cut atoms differ from exact path incidences")

    edges = tuple(
        legacy.distance_edge(left, right)
        for left, right in itertools.combinations(root.LABELS, 2)
    )
    parent = {edge: edge for edge in edges}

    def find(edge: Edge) -> Edge:
        if parent[edge] != edge:
            parent[edge] = find(parent[edge])
        return parent[edge]

    def union(left: Edge, right: Edge) -> None:
        left_root, right_root = find(left), find(right)
        if left_root != right_root:
            parent[max(left_root, right_root)] = min(left_root, right_root)

    for left, right in equalities:
        union(left, right)
    total: Counter[Edge] = Counter()
    for form in forms:
        total.update(
            find(legacy.distance_edge(*edge))
            for edge in form["positive"]  # type: ignore[union-attr]
        )
        total.subtract(
            find(legacy.distance_edge(*edge))
            for edge in form["negative"]  # type: ignore[union-attr]
        )
    nonzero = tuple(sorted((edge, value) for edge, value in total.items() if value))
    if nonzero:
        raise AuditError("independent projected form sum is nonzero")
    return {
        "form_count": len(forms),
        "positive_weights": [1] * len(forms),
        "pairing_count": len(raw_pairings),
        "path_step_count": step_count,
        "atom_count": len(atoms),
        "projected_sum": [],
        "zero_projected_sum_replayed": True,
        "universal_incidence_justification": (
            "each path equality uses only its named provider, exact center binding "
            "when variable, and its two positive raw-row memberships"
        ),
    }


def admitted_cut(
    conflict: dict[str, object],
    cell: dict[str, object],
    order: tuple[int, ...],
    assignment: set[int],
    cnf: root.Cnf,
) -> tuple[tuple[int, ...], dict[str, object]]:
    replay = replay_zero_sum(conflict, cell, order)
    raw_atoms = conflict["atoms"]
    if not isinstance(raw_atoms, (tuple, list)):
        raise AuditError("conflict atoms are malformed")
    atoms = tuple(sorted(str(atom) for atom in raw_atoms))
    for atom in atoms:
        if not atom.startswith(("m_", "is_b0_", "is_b1_")):
            raise AuditError(f"cut uses non-incidence projection atom: {atom}")
        variable = cnf.names.get(atom)
        if variable is None or variable not in assignment:
            raise AuditError(f"cut atom is not true in the current root model: {atom}")
    literals = tuple(-cnf.names[atom] for atom in atoms)
    if any(abs(literal) > len(cnf.names) for literal in literals):
        raise AuditError("cut references a non-root variable")
    if any(literal > 0 for literal in literals):
        raise AuditError("incidence cut is not purely negative")
    if any(
        name.startswith(("u_", "e_", "pair_", "c_", "chosen_", "inter_"))
        for name in atoms
    ):
        raise AuditError("cut mentions an existential-only witness variable")
    if any((literal > 0) == (abs(literal) in assignment) for literal in literals):
        raise AuditError("admitted cut does not eliminate the current model")
    return literals, {
        "atoms": list(atoms),
        "atom_variables": {atom: cnf.names[atom] for atom in atoms},
        "clause": list(literals),
        "current_model_eliminated": True,
        "only_projected_provider_incidence_atoms": True,
        "no_existential_witness_variables": True,
        "semantic_replay": replay,
    }


def load_bank(path: Path) -> list[dict[str, object]]:
    if not path.exists():
        return []
    records = []
    for index, line in enumerate(path.read_bytes().splitlines()):
        value = json.loads(line)
        if not isinstance(value, dict) or value.get("index") != index:
            raise AuditError("cut bank is not an ordered append-only journal")
        certificate_path = Path(str(value.get("certificate")))
        if sha256(certificate_path.read_bytes()) != value.get("certificate_sha256"):
            raise AuditError("cut-bank certificate digest drifted")
        records.append(value)
    return records


def _verify_seal(value: dict[str, object], label: str) -> None:
    recorded = value.get("event_sha256")
    unsigned = {key: item for key, item in value.items() if key != "event_sha256"}
    if recorded != sha256(canonical(unsigned)):
        raise AuditError(f"{label} self-hash drifted")


def revalidate_bank_for_effective_root(
    run_root: Path,
    bank: list[dict[str, object]],
    cnf: root.Cnf,
    projection: dict[str, object],
    allowed_parent_root_sha256: set[str],
    base_root_sha256: str,
    effective_root_sha256: str,
) -> dict[str, object]:
    """Rebind pre-repair cuts only after replaying every retained parent model."""
    checked = []
    for index, record in enumerate(bank):
        cut_path = Path(str(record["certificate"]))
        cut = json.loads(cut_path.read_text())
        if not isinstance(cut, dict):
            raise AuditError("migration cut certificate is malformed")
        _verify_seal(cut, f"cut {index}")
        if cut.get("index") != index:
            raise AuditError("migration cut index drifted")
        model_path = Path(str(cut.get("parent_model")))
        if sha256(model_path.read_bytes()) != cut.get("parent_model_sha256"):
            raise AuditError("migration parent-model digest drifted")
        model = json.loads(model_path.read_text())
        if not isinstance(model, dict):
            raise AuditError("migration model certificate is malformed")
        _verify_seal(model, f"model {index}")
        if model.get("root_emitted_sha256") not in allowed_parent_root_sha256:
            raise AuditError("migration model binds neither accepted root revision")
        raw_solve = Path(str(model.get("raw_solve")))
        if sha256(raw_solve.read_bytes()) != model.get("raw_solve_sha256"):
            raise AuditError("migration raw-solve digest drifted")
        solved = json.loads(raw_solve.read_text())
        if not isinstance(solved, dict) or solved.get("status") != "SAT":
            raise AuditError("migration raw solve is not SAT")
        assignment = root.parse_assignment(solved.get("model"))
        key = root.key_from_assignment(assignment, projection)
        checks = root.replay_assignment(assignment, key, projection)
        if not cnf.satisfied(assignment) or checks.get("Valid") is not True:
            raise AuditError("migration parent does not satisfy the effective exact root")
        if key != model.get("projected_key"):
            raise AuditError("migration projected Key drifted")
        cell = key_cell(key)
        if cell != model.get("translated_cell"):
            raise AuditError("migration translated cell drifted")
        order = root.ORDERS[int(key["orientation"] == "mirror")]
        conflict = cut.get("conflict")
        if not isinstance(conflict, dict):
            raise AuditError("migration conflict is malformed")
        literals, admission = admitted_cut(conflict, cell, order, assignment, cnf)
        if list(literals) != record.get("clause"):
            raise AuditError("migration cut clause failed independent reconstruction")
        if list(admission["atoms"]) != record.get("atoms"):
            raise AuditError("migration cut atoms failed independent reconstruction")
        checked.append({
            "index": index,
            "model_sha256": sha256(model_path.read_bytes()),
            "cut_sha256": sha256(cut_path.read_bytes()),
            "effective_root_satisfied": True,
            "zero_sum_and_cut_replayed": True,
        })
    event = seal({
        "schema": MIGRATION_SCHEMA,
        "reason": (
            "inherited root used binary not-apex clauses; effective root adds the "
            "four intended unit clauses"
        ),
        "base_root_sha256": base_root_sha256,
        "allowed_parent_root_sha256": sorted(allowed_parent_root_sha256),
        "effective_root_sha256": effective_root_sha256,
        "cut_bank": str(run_root / "events" / "cut-bank.jsonl"),
        "cut_bank_sha256": sha256((run_root / "events" / "cut-bank.jsonl").read_bytes()),
        "revalidated_cut_count": len(checked),
        "checks": checked,
        "all_parent_models_satisfy_effective_root": True,
        "all_zero_sums_and_cuts_independently_replayed": True,
    })
    atomic_json(run_root / "events" / "effective-root-cut-migration.json", event)
    return event


def _linear_sum(terms: Iterable[str]) -> str:
    values = tuple(terms)
    if not values:
        return "0"
    if len(values) == 1:
        return values[0]
    return f"(+ {' '.join(values)})"


def cone_formula(rows: tuple[Row, ...], order: tuple[int, ...]) -> tuple[tuple[str, ...], int]:
    roots = legacy.edge_roots_for_rows(rows)
    first_by_vector: dict[tuple[tuple[Edge, int], ...], tuple[int, ...]] = {}
    for form in legacy.kalmanson_forms(order):
        vector = projected_vector(form, roots)
        first_by_vector.setdefault(vector, tuple(form["form"]))  # type: ignore[arg-type]
    vectors = tuple(sorted(first_by_vector))
    commands = ["(set-logic QF_LRA)"]
    weights = tuple(f"w_{index}" for index in range(len(vectors)))
    for weight in weights:
        commands.extend((f"(declare-const {weight} Real)", f"(assert (>= {weight} 0))"))
    commands.append(f"(assert (= {_linear_sum(weights)} 1))")
    coordinates = sorted({edge for vector in vectors for edge, _coefficient in vector})
    for coordinate in coordinates:
        terms = (
            f"(* {dict(vector)[coordinate]} {weights[index]})"
            for index, vector in enumerate(vectors)
            if coordinate in dict(vector)
        )
        commands.append(f"(assert (= {_linear_sum(terms)} 0))")
    return tuple(commands), len(vectors)


def full_cone_diagnostic(
    run_root: Path,
    cell: dict[str, object],
    order: tuple[int, ...],
    timeout_ms: int,
    solver: str,
) -> dict[str, object]:
    commands, form_count = cone_formula(cell_rows(cell), order)
    journal = ("\n".join(commands) + "\n").encode("ascii")
    journal_path = run_root / "artifacts" / "survivor-full-cone.smt2"
    write_once(journal_path, journal)
    created = run_piqc(
        ["session", "new", "--solver", solver, "--lane", "smt", "--label",
         "exact13-witnessed-key-cegar-wave1-full-cone"]
    )
    session_id = created.get("id")
    if not isinstance(session_id, str) or not session_id:
        raise AuditError("PIQD did not create the full-cone session")
    record: dict[str, object] = {"created": created, "session_id": session_id}
    try:
        asserted = run_piqc(
            ["session", "assert", session_id, "--expect-commands", "0", "--file", str(journal_path)]
        )
        if asserted.get("commands") != len(commands):
            raise AuditError("PIQD full-cone command count drifted")
        solved = run_piqc(
            ["session", "solve", session_id, "--timeout-ms", str(timeout_ms)],
            transport_timeout=max(180.0, timeout_ms / 1000 + 60.0),
        )
        receipts = run_piqc(["session", "receipts", session_id])
        record.update(asserted=asserted, solved=solved, receipts=receipts)
    finally:
        record["closed"] = run_piqc(["session", "close", session_id])
    event = seal({
        "schema": SCHEMA,
        "kind": "first-survivor-full-cone-diagnostic",
        "formula_scope_only": True,
        "no_cut_learned": True,
        "solver": solver,
        "journal": str(journal_path),
        "journal_bytes": len(journal),
        "journal_sha256": sha256(journal),
        "command_count": len(commands),
        "projected_form_count": form_count,
        "piqd": record,
    })
    atomic_json(run_root / "events" / "full-cone-diagnostic.json", event)
    return event


def expected_session_journal(root_bytes: bytes, bank: list[dict[str, object]]) -> bytes:
    normalized, _metadata = root.normalize_for_piqd_session(root_bytes)
    suffix = b"".join(
        (" ".join(str(item) for item in record["clause"]) + " 0\n").encode("ascii")
        for record in bank
    )
    return normalized + suffix


def normalize_exported_dimacs(
    exported: bytes, *, variables: int, clauses: int
) -> tuple[bytes, dict[str, object]]:
    """Remove the one deterministic header added by ``piqc session export``."""
    expected_header = f"p cnf {variables} {clauses}\n".encode("ascii")
    if not exported.startswith(expected_header):
        raise AuditError("PIQD export has an unexpected DIMACS header")
    body = exported[len(expected_header):]
    if body.startswith((b"c ", b"p cnf ")):
        raise AuditError("PIQD export body has unexpected DIMACS framing")
    return body, {
        "operation": "remove exactly one canonical p-cnf header line",
        "removed_header_bytes": len(expected_header),
        "exported_dimacs_bytes": len(exported),
        "exported_dimacs_sha256": sha256(exported),
        "normalized_clause_journal_bytes": len(body),
        "normalized_clause_journal_sha256": sha256(body),
        "clause_body_preserved_byte_for_byte": True,
    }


def verify_receipts(
    receipts: dict[str, object],
    root_bytes: bytes,
    bank: list[dict[str, object]],
    *,
    initial_cut_count: int = 0,
    root_clause_count: int = 29464,
) -> list[dict[str, object]]:
    rows = receipts.get("receipts")
    if not isinstance(rows, list):
        raise AuditError("PIQD receipts are malformed")
    normalized, _metadata = root.normalize_for_piqd_session(root_bytes)
    checks = []
    for index, receipt in enumerate(rows):
        if not isinstance(receipt, dict):
            raise AuditError("PIQD receipt row is malformed")
        cut_count = initial_cut_count + index
        prefix = normalized + b"".join(
            (" ".join(str(item) for item in bank[j]["clause"]) + " 0\n").encode("ascii")
            for j in range(cut_count)
        )
        expected = {
            "base_bytes": len(prefix),
            "base_clauses": root_clause_count + cut_count,
            "base_sha256": sha256(prefix),
        }
        if any(receipt.get(key) != value for key, value in expected.items()):
            raise AuditError(f"PIQD receipt {index} does not bind its exact clause prefix")
        checks.append({"solve_index": receipt.get("solve_index"), **expected})
    return checks


def initial_root(run_root: Path, source: Path, producer_commit: str) -> tuple[
    root.Cnf, dict[str, object], dict[str, object]
]:
    inherited = root.write_root(run_root, source, producer_commit)
    cnf, projection = root.emit_root()
    inherited_bytes = inherited.get("cnf_bytes")
    if not isinstance(inherited_bytes, bytes):
        raise AuditError("root producer did not return DIMACS bytes")
    correction_atoms = []
    for name in ("b0", "b1"):
        for apex in (root.SECOND_APEX, root.FIRST_APEX):
            variable = cnf.names[f"is_{name}_{apex}"]
            cnf.add(-variable)
            correction_atoms.append({"atom": f"is_{name}_{apex}", "unit": -variable})
    emitted = cnf.dimacs((
        ROOT_REPAIR_SCHEMA,
        f"producer={Path(__file__).name}",
        f"producer_commit={producer_commit}",
    ))
    normalized, normalization = root.normalize_for_piqd_session(emitted)
    artifact = run_root / "artifacts" / "exact13-witnessed-key-effective-root.cnf"
    write_once(artifact, emitted)
    map_path = run_root / "artifacts" / "exact13-witnessed-key-effective-root.map.json"
    write_once(map_path, canonical({
        "schema": ROOT_REPAIR_SCHEMA,
        "variables": len(cnf.names),
        "clauses": len(cnf.clauses),
        "projection": projection,
        "root_static_corrections": correction_atoms,
    }) + b"\n")
    report = seal({
        "schema": ROOT_REPAIR_SCHEMA,
        "producer_commit": producer_commit,
        "source_path": str(source),
        "source_sha256": sha256(source.read_bytes()),
        "inherited_root": inherited["cnf"],
        "inherited_root_bytes": len(inherited_bytes),
        "inherited_root_sha256": sha256(inherited_bytes),
        "inherited_clause_count": inherited["clauses"],
        "defect": (
            "the inherited not-apex encoding has one binary clause per blocker; "
            "one-hot requires two unit clauses per blocker"
        ),
        "root_static_corrections": correction_atoms,
        "cnf": str(artifact),
        "cnf_bytes": len(emitted),
        "emitted_cnf_bytes": len(emitted),
        "emitted_cnf_sha256": sha256(emitted),
        "piqd_normalized_journal_bytes": len(normalized),
        "piqd_normalized_journal_sha256": sha256(normalized),
        "normalization": normalization,
        "normalization_relation_verified": True,
        "map": str(map_path),
        "map_sha256": sha256(map_path.read_bytes()),
        "variables": len(cnf.names),
        "clauses": len(cnf.clauses),
        "exact_key_valid_root": True,
        "no_metric_or_learned_conflicts": True,
    })
    atomic_json(run_root / "events" / "effective-root.json", report)
    return cnf, projection, {**report, "cnf_bytes": emitted}


def source_bindings(source: Path) -> dict[str, str]:
    paths_to_bind = (
        source,
        Path(__file__),
        Path(root.__file__),
        Path(paths.__file__),
        Path(pairs.__file__),
        Path(legacy.__file__),
    )
    return {str(path): sha256(path.read_bytes()) for path in paths_to_bind}


def finalize_retained_budget(
    args: argparse.Namespace,
    run_root: Path,
    cnf: root.Cnf,
    root_report: dict[str, object],
    bindings: dict[str, str],
    bank: list[dict[str, object]],
    migration: dict[str, object] | None,
    prior_state: dict[str, object] | None,
) -> dict[str, object]:
    """Finish custody from the already-exported budget-terminal session."""
    if len(bank) != args.max_refinements:
        raise AuditError("retained finalization requires an exhausted refinement budget")
    root_bytes = root_report.get("cnf_bytes")
    if not isinstance(root_bytes, bytes):
        raise AuditError("effective root bytes are missing")
    model_path = run_root / "events" / "models" / f"model-{len(bank):04d}.json"
    model = json.loads(model_path.read_text())
    if not isinstance(model, dict):
        raise AuditError("budget-terminal model certificate is malformed")
    _verify_seal(model, "budget-terminal model")
    if model.get("disposition") != "cancellable":
        raise AuditError("budget-terminal model is not a retained cancellable SAT model")
    receipts_path = run_root / "events" / "piqd-receipts.json"
    receipts = json.loads(receipts_path.read_text())
    if not isinstance(receipts, dict):
        raise AuditError("retained PIQD receipts are malformed")
    receipt_rows = receipts.get("receipts")
    if not isinstance(receipt_rows, list) or not receipt_rows:
        raise AuditError("retained PIQD receipt journal is empty")
    first = receipt_rows[0]
    if not isinstance(first, dict):
        raise AuditError("first retained receipt is malformed")
    initial_cut_count = int(first.get("base_clauses", -1)) - len(cnf.clauses)
    if not 0 <= initial_cut_count <= len(bank):
        raise AuditError("retained receipt has impossible initial cut count")
    receipt_checks = verify_receipts(
        receipts,
        root_bytes,
        bank,
        initial_cut_count=initial_cut_count,
        root_clause_count=len(cnf.clauses),
    )
    last = receipt_rows[-1]
    if not isinstance(last, dict) or last.get("status") != "SAT":
        raise AuditError("retained terminal receipt is not SAT")
    if last.get("base_clauses") != len(cnf.clauses) + len(bank):
        raise AuditError("retained terminal SAT did not run after every budgeted cut")
    session_id = receipts.get("session_id")
    if not isinstance(session_id, str) or not session_id:
        raise AuditError("retained receipts omit the session id")
    session_status = run_piqc(["session", "status", session_id])
    if session_status.get("state") != "closed":
        raise AuditError("retained PIQD session is not closed")
    session_wall_span = int(session_status["updated_at"]) - int(
        session_status["created_at"]
    )
    atomic_json(
        run_root / "events" / "retained-session-status.json",
        seal({"schema": CUSTODY_SCHEMA, "session_status": session_status}),
    )
    expected = expected_session_journal(root_bytes, bank)
    expected_path = run_root / "artifacts" / "expected-session-journal.cnf"
    write_once(expected_path, expected)
    journal_path = run_root / "artifacts" / "piqd-session-journal.cnf"
    exported = journal_path.read_bytes()
    normalized_export, export_normalization = normalize_exported_dimacs(
        exported, variables=len(cnf.names), clauses=len(cnf.clauses) + len(bank)
    )
    if normalized_export != expected:
        raise AuditError("retained PIQD journal differs from deterministic root-plus-cuts")
    custody = seal({
        "schema": CUSTODY_SCHEMA,
        "session_id": session_id,
        "session_closed": True,
        "rebound_without_solver_rerun": True,
        "root_emitted_bytes": len(root_bytes),
        "root_emitted_sha256": sha256(root_bytes),
        "root_piqd_normalized_bytes": root_report["piqd_normalized_journal_bytes"],
        "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
        "piqd_exported_dimacs": str(journal_path),
        "piqd_exported_dimacs_bytes": len(exported),
        "piqd_exported_dimacs_sha256": sha256(exported),
        "piqd_clause_journal": str(expected_path),
        "piqd_clause_journal_bytes": len(expected),
        "piqd_clause_journal_sha256": sha256(expected),
        "export_normalization": export_normalization,
        "deterministic_export_normalization_verified": True,
        "deterministic_root_plus_cuts_relation_verified": True,
        "initial_replayed_cut_count": initial_cut_count,
        "cut_count": len(bank),
        "receipt_path": str(receipts_path),
        "receipt_sha256": sha256(receipts_path.read_bytes()),
        "receipt_prefix_checks": receipt_checks,
    })
    atomic_json(run_root / "events" / "piqd-custody.json", custody)
    sessions = list(prior_state.get("sessions", [])) if isinstance(prior_state, dict) else []
    state = seal({
        "schema": STATE_SCHEMA,
        "status": "REFINEMENT_BUDGET",
        "sessions": sessions,
        "active_session": None,
        "retained_session_status": str(run_root / "events" / "retained-session-status.json"),
        "refinement_count": len(bank),
        "source_bindings": bindings,
        "effective_root_migration": migration,
        "root_emitted_sha256": root_report["emitted_cnf_sha256"],
        "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
        "budgets": {
            "max_refinements": args.max_refinements,
            "solve_timeout_ms": args.solve_timeout_ms,
            "wall_seconds": args.wall_seconds,
        },
    })
    state_path = run_root / "events" / "state.json"
    atomic_json(state_path, state)
    report = seal({
        "schema": SCHEMA,
        "claim_boundary": "solver-only discovery; no Lean theorem or promoted UNSAT claim",
        "base_head": args.producer_commit,
        "status": "REFINEMENT_BUDGET",
        "sat_solver": args.solver,
        "solve_timeout_ms": args.solve_timeout_ms,
        "max_refinements": args.max_refinements,
        "wall_seconds": args.wall_seconds,
        "wall_elapsed_seconds": session_wall_span,
        "solve_count_this_invocation": 0,
        "retained_session_solve_count": len(receipt_rows),
        "retained_session_wall_span_seconds": session_wall_span,
        "refinement_count": len(bank),
        "one_form_cuts": sum(
            record["kind"] == "transitive-incidence-path" for record in bank
        ),
        "two_form_cuts": sum(
            record["kind"] == "two-form-incidence-path" for record in bank
        ),
        "root_variables": len(cnf.names),
        "root_clauses": len(cnf.clauses),
        "root_emitted_sha256": root_report["emitted_cnf_sha256"],
        "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
        "final_solve_status": "SAT",
        "budget_terminal_model": str(model_path),
        "budget_terminal_model_sha256": sha256(model_path.read_bytes()),
        "full_cone_diagnostic": None,
        "effective_root_migration": migration,
        "source_bindings": bindings,
        "state": str(state_path),
        "cut_bank": str(run_root / "events" / "cut-bank.jsonl"),
        "piqd_custody": str(run_root / "events" / "piqd-custody.json"),
        "rebound_without_solver_rerun": True,
        "no_exact_key_enumeration_blocks": True,
        "no_existential_witness_cut_variables": True,
    })
    atomic_json(run_root / "events" / "run.json", report)
    return report


def run(args: argparse.Namespace) -> dict[str, object]:
    if args.max_refinements < 0 or args.solve_timeout_ms <= 0 or args.wall_seconds <= 0:
        raise ValueError("budgets must be positive (max refinements may be zero)")
    run_root: Path = args.run_root
    run_root.mkdir(parents=True, exist_ok=True)
    (run_root / "tmp").mkdir(exist_ok=True)
    lock_stream = (run_root / "tmp" / "lane.lock").open("a+b")
    fcntl.flock(lock_stream, fcntl.LOCK_EX | fcntl.LOCK_NB)
    started = time.monotonic()
    bindings = source_bindings(args.source)
    cnf, projection, root_report = initial_root(
        run_root, args.source, args.producer_commit
    )
    root_bytes = root_report["cnf_bytes"]
    if not isinstance(root_bytes, bytes):
        raise AuditError("root bytes are missing")
    bank_path = run_root / "events" / "cut-bank.jsonl"
    bank = load_bank(bank_path)
    initial_cut_count = len(bank)
    seen_atoms = {tuple(record["atoms"]) for record in bank}
    state_path = run_root / "events" / "state.json"
    prior_state = json.loads(state_path.read_text()) if state_path.exists() else None
    migration = None
    if prior_state is not None:
        if prior_state.get("schema") != STATE_SCHEMA:
            raise AuditError("resume state schema drifted")
        if int(prior_state.get("refinement_count", -1)) != len(bank):
            raise AuditError("resume state and cut bank disagree")
        prior_root = prior_state.get("root_emitted_sha256")
        if prior_root == root_report["inherited_root_sha256"]:
            migration = revalidate_bank_for_effective_root(
                run_root,
                bank,
                cnf,
                projection,
                {
                    str(root_report["inherited_root_sha256"]),
                    str(root_report["emitted_cnf_sha256"]),
                },
                str(root_report["inherited_root_sha256"]),
                str(root_report["emitted_cnf_sha256"]),
            )
        else:
            if prior_root != root_report["emitted_cnf_sha256"]:
                raise AuditError("resume root identity drifted")
            if prior_state.get("source_bindings") != bindings:
                old_bindings = prior_state.get("source_bindings")
                if not isinstance(old_bindings, dict):
                    raise AuditError("resume source bindings are malformed")
                producer_path = str(Path(__file__))
                stable_old = {
                    key: value for key, value in old_bindings.items()
                    if key != producer_path
                }
                stable_new = {
                    key: value for key, value in bindings.items()
                    if key != producer_path
                }
                if stable_old != stable_new:
                    raise AuditError("resume dependencies beyond the producer drifted")
                migration = revalidate_bank_for_effective_root(
                    run_root,
                    bank,
                    cnf,
                    projection,
                    {
                        str(root_report["inherited_root_sha256"]),
                        str(root_report["emitted_cnf_sha256"]),
                    },
                    str(root_report["inherited_root_sha256"]),
                    str(root_report["emitted_cnf_sha256"]),
                )

    if args.finalize_retained_budget:
        return finalize_retained_budget(
            args,
            run_root,
            cnf,
            root_report,
            bindings,
            bank,
            migration,
            prior_state,
        )

    version = run_piqc(["version"])
    solvers = run_piqc(["solvers"])
    inventory = solvers.get("solvers")
    if not isinstance(inventory, list) or not any(
        row.get("name") == args.solver and row.get("lane") == "sat" and row.get("usable") is True
        for row in inventory if isinstance(row, dict)
    ):
        raise AuditError(f"requested PIQD SAT solver is unavailable: {args.solver}")
    atomic_json(run_root / "events" / "piqd-environment.json", seal({
        "schema": SCHEMA,
        "piqd_version": version,
        "solver_inventory": solvers,
        "chosen_sat_solver": args.solver,
        "chosen_cone_solver": args.cone_solver,
        "source_bindings": bindings,
    }))
    created = run_piqc([
        "session", "new", "--solver", args.solver, "--lane", "sat", "--label",
        "exact13-witnessed-key-cegar-wave1",
    ])
    session_id = created.get("id")
    if not isinstance(session_id, str) or not session_id:
        raise AuditError("PIQD did not create the SAT session")
    sessions = list(prior_state.get("sessions", [])) if isinstance(prior_state, dict) else []
    sessions.append(session_id)
    terminal = "RUNNING"
    survivor: dict[str, object] | None = None
    solves = 0
    final_solve: dict[str, object] = {}
    try:
        added = run_piqc(["session", "add", session_id, "--file", str(root_report["cnf"])])
        if added.get("clauses") != len(cnf.clauses):
            raise AuditError("PIQD root clause count drifted")
        for record in bank:
            clause = " ".join(str(item) for item in record["clause"])
            asserted = run_piqc(["session", "add", session_id, "--clause", clause])
            if asserted.get("clauses") != len(cnf.clauses) + int(record["index"]) + 1:
                raise AuditError("PIQD replayed-cut clause count drifted")

        while True:
            if time.monotonic() - started >= args.wall_seconds:
                terminal = "WALL_BUDGET"
                break
            solved = run_piqc(
                ["session", "solve", session_id, "--timeout-ms", str(args.solve_timeout_ms)],
                transport_timeout=max(180.0, args.solve_timeout_ms / 1000 + 60.0),
            )
            final_solve = solved
            solve_index = len(bank)
            solves += 1
            raw_solve_path = (
                run_root
                / "events"
                / "piqd"
                / f"solve-{solve_index:04d}-{session_id}.json"
            )
            write_once(raw_solve_path, canonical(solved) + b"\n")
            status = solved.get("status")
            if status == "UNSAT":
                terminal = "UNSAT"
                break
            if status != "SAT":
                terminal = str(status or "UNKNOWN")
                break
            assignment = root.parse_assignment(solved.get("model"))
            key = root.key_from_assignment(assignment, projection)
            checks = root.replay_assignment(assignment, key, projection)
            if not cnf.satisfied(assignment) or checks.get("Valid") is not True:
                raise AuditError("independent exact Key.Valid replay failed")
            cell = key_cell(key)
            order = root.ORDERS[int(key["orientation"] == "mirror")]
            conflict = find_conflict(cell, order)
            model_certificate = seal({
                "schema": MODEL_SCHEMA,
                "index": solve_index,
                "session_id": session_id,
                "piqd_result_sha256": solved.get("result_sha256"),
                "raw_solve": str(raw_solve_path),
                "raw_solve_sha256": sha256(raw_solve_path.read_bytes()),
                "root_emitted_sha256": root_report["emitted_cnf_sha256"],
                "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
                "assignment_positive_literals": len(assignment),
                "piqd_session_replayed_flag": solved.get("replayed"),
                "cnf_satisfied_independently": True,
                "key_valid_checks": checks,
                "projected_key": key,
                "translated_cell": cell,
                "orientation_order": list(order),
                "disposition": "uncancellable-survivor" if conflict is None else "cancellable",
            })
            model_path = run_root / "events" / "models" / f"model-{solve_index:04d}.json"
            write_once(model_path, canonical(model_certificate) + b"\n")
            if conflict is None:
                terminal = "SAT_UNCANCELLABLE_SURVIVOR"
                survivor = model_certificate
                break
            literals, admission = admitted_cut(conflict, cell, order, assignment, cnf)
            atoms = tuple(admission["atoms"])
            if atoms in seen_atoms:
                raise AuditError("PIQD returned a model excluded by an admitted cut")
            if len(bank) >= args.max_refinements:
                terminal = "REFINEMENT_BUDGET"
                break
            cut_index = len(bank)
            cut_certificate = seal({
                "schema": CUT_SCHEMA,
                "index": cut_index,
                "parent_model": str(model_path),
                "parent_model_sha256": sha256(model_path.read_bytes()),
                "conflict": conflict,
                "admission": admission,
                "clause_class": "SEMANTIC_REFINEMENT",
                "claim_boundary": "source-row equality plus strict cyclic Kalmanson forms",
                "source_preservation_scope": (
                    "every geometric source key sharing the listed provider incidences "
                    "and variable blocker-center bindings"
                ),
                "lean_promotion_claim": False,
            })
            cut_path = run_root / "events" / "cuts" / f"cut-{cut_index:04d}.json"
            write_once(cut_path, canonical(cut_certificate) + b"\n")
            bank_record = {
                "index": cut_index,
                "kind": conflict["kind"],
                "atoms": list(atoms),
                "clause": list(literals),
                "certificate": str(cut_path),
                "certificate_sha256": sha256(cut_path.read_bytes()),
            }
            append_jsonl(bank_path, bank_record)
            bank.append(bank_record)
            seen_atoms.add(atoms)
            clause = " ".join(str(item) for item in literals)
            asserted = run_piqc(["session", "add", session_id, "--clause", clause])
            if asserted.get("clauses") != len(cnf.clauses) + len(bank):
                raise AuditError("PIQD learned-clause count drifted")
            atomic_json(state_path, seal({
                "schema": STATE_SCHEMA,
                "status": "RUNNING",
                "sessions": sessions,
                "active_session": session_id,
                "refinement_count": len(bank),
                "source_bindings": bindings,
                "root_emitted_sha256": root_report["emitted_cnf_sha256"],
                "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
                "budgets": {
                    "max_refinements": args.max_refinements,
                    "solve_timeout_ms": args.solve_timeout_ms,
                    "wall_seconds": args.wall_seconds,
                },
            }))

        receipts = run_piqc(["session", "receipts", session_id])
        receipts_path = run_root / "events" / "piqd-receipts.json"
        atomic_json(receipts_path, receipts)
        journal_path = run_root / "artifacts" / "piqd-session-journal.cnf"
        export_confirmation = export_piqd_session(session_id, journal_path)
        expected = expected_session_journal(root_bytes, bank)
        expected_path = run_root / "artifacts" / "expected-session-journal.cnf"
        write_once(expected_path, expected)
        exported = journal_path.read_bytes()
        normalized_export, export_normalization = normalize_exported_dimacs(
            exported, variables=len(cnf.names), clauses=len(cnf.clauses) + len(bank)
        )
        if normalized_export != expected:
            raise AuditError("PIQD exported journal differs from deterministic root-plus-cuts")
        receipt_checks = verify_receipts(
            receipts,
            root_bytes,
            bank,
            initial_cut_count=initial_cut_count,
            root_clause_count=len(cnf.clauses),
        )
        custody = seal({
            "schema": CUSTODY_SCHEMA,
            "session_id": session_id,
            "root_emitted_bytes": len(root_bytes),
            "root_emitted_sha256": sha256(root_bytes),
            "root_piqd_normalized_bytes": root_report["piqd_normalized_journal_bytes"],
            "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
            "piqd_exported_dimacs": str(journal_path),
            "piqd_exported_dimacs_bytes": len(exported),
            "piqd_exported_dimacs_sha256": sha256(exported),
            "piqd_clause_journal": str(expected_path),
            "piqd_clause_journal_bytes": len(expected),
            "piqd_clause_journal_sha256": sha256(expected),
            "export_normalization": export_normalization,
            "deterministic_export_normalization_verified": True,
            "deterministic_root_plus_cuts_relation_verified": True,
            "cut_count": len(bank),
            "receipt_path": str(receipts_path),
            "receipt_sha256": sha256(receipts_path.read_bytes()),
            "receipt_prefix_checks": receipt_checks,
            "export_confirmation": export_confirmation,
        })
        atomic_json(run_root / "events" / "piqd-custody.json", custody)
    finally:
        closed = run_piqc(["session", "close", session_id])

    cone = None
    if terminal == "SAT_UNCANCELLABLE_SURVIVOR":
        if survivor is None:
            raise AuditError("survivor status lacks a model certificate")
        cell = survivor["translated_cell"]
        order = tuple(int(item) for item in survivor["orientation_order"])
        if not isinstance(cell, dict):
            raise AuditError("survivor cell is malformed")
        cone = full_cone_diagnostic(
            run_root, cell, order, args.solve_timeout_ms, args.cone_solver
        )

    state = seal({
        "schema": STATE_SCHEMA,
        "status": terminal,
        "sessions": sessions,
        "active_session": None,
        "last_session_closed": closed,
        "refinement_count": len(bank),
        "source_bindings": bindings,
        "effective_root_migration": migration,
        "root_emitted_sha256": root_report["emitted_cnf_sha256"],
        "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
        "budgets": {
            "max_refinements": args.max_refinements,
            "solve_timeout_ms": args.solve_timeout_ms,
            "wall_seconds": args.wall_seconds,
        },
    })
    atomic_json(state_path, state)
    report = seal({
        "schema": SCHEMA,
        "claim_boundary": "solver-only discovery; no Lean theorem or promoted UNSAT claim",
        "base_head": args.producer_commit,
        "status": terminal,
        "sat_solver": args.solver,
        "solve_timeout_ms": args.solve_timeout_ms,
        "max_refinements": args.max_refinements,
        "wall_seconds": args.wall_seconds,
        "wall_elapsed_seconds": round(time.monotonic() - started, 3),
        "solve_count_this_invocation": solves,
        "refinement_count": len(bank),
        "one_form_cuts": sum(record["kind"] == "transitive-incidence-path" for record in bank),
        "two_form_cuts": sum(record["kind"] == "two-form-incidence-path" for record in bank),
        "root_variables": len(cnf.names),
        "root_clauses": len(cnf.clauses),
        "root_emitted_sha256": root_report["emitted_cnf_sha256"],
        "root_piqd_normalized_sha256": root_report["piqd_normalized_journal_sha256"],
        "final_solve_status": final_solve.get("status"),
        "survivor_model": survivor,
        "full_cone_diagnostic": cone,
        "effective_root_migration": migration,
        "source_bindings": bindings,
        "state": str(state_path),
        "cut_bank": str(bank_path),
        "no_exact_key_enumeration_blocks": True,
        "no_existential_witness_cut_variables": True,
    })
    atomic_json(run_root / "events" / "run.json", report)
    return report


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--run-root", type=Path, default=DEFAULT_RUN_ROOT)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--producer-commit", required=True)
    parser.add_argument("--solver", default=DEFAULT_SOLVER)
    parser.add_argument("--cone-solver", default=DEFAULT_CONE_SOLVER)
    parser.add_argument("--max-refinements", type=int, default=1000)
    parser.add_argument("--solve-timeout-ms", type=int, default=120_000)
    parser.add_argument("--wall-seconds", type=float, default=1800.0)
    parser.add_argument("--finalize-retained-budget", action="store_true")
    return parser.parse_args()


def main() -> int:
    report = run(parse_args())
    print(canonical({
        "status": report["status"],
        "root_variables": report["root_variables"],
        "root_clauses": report["root_clauses"],
        "refinements": report["refinement_count"],
        "one_form_cuts": report["one_form_cuts"],
        "two_form_cuts": report["two_form_cuts"],
        "solve_count": report["solve_count_this_invocation"],
        "wall_elapsed_seconds": report["wall_elapsed_seconds"],
    }).decode())
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
