"""Source-faithful exact-17 FreshThird equality-path CEGAR (v5).

This is a finite structural experiment.  It imports the v2 ingress and v3
row-center/exact-center constraints, retains the v4 endpoint/Q cuts, and adds
only clauses justified by exact-support equality paths.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import shutil
import subprocess
import sys
from collections import deque
from collections.abc import Iterable
from dataclasses import asdict, dataclass
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parent
REPO = ROOT.parents[2]
V2_PATH = (
    REPO
    / "scratch/p97-consumer-first/freshthird_five_survivor_alias_aware_v2/run_query.py"
)
V3_PATH = (
    REPO
    / "scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v3/run_named_metric.py"
)
V4_SOURCE_MAP = (
    REPO
    / "scratch/p97-consumer-first/freshthird_five_survivor_named_metric_v4/SOURCE-MAP.md"
)
ARTIFACTS = ROOT / "artifacts"
N = 17
POINTS = tuple(range(N))
EXACT_ROWS = {
    "PRow": "CP",
    "PRhoRow": "C1",
    "S0Row": "CS0",
    "S1Row": "CS1",
    "DBRow": "DB",
}
ROW_CENTERS = {
    "PRow": "CP",
    "PRhoRow": "C1",
    "S0Row": "CS0",
    "S1Row": "CS1",
    "R": "C2",
    "Rh": "C2",
    "B3": "C3",
    "B4": "C4",
    "DBRow": "DB",
}
SOURCE_LABELS = {
    "v2": "corrected exact-17 alias-aware FreshThird structural ingress",
    "row_center_omission": "named positive-radius row omits its center",
    "exact_center_alias": "exact rows at an aliased center have identical supports",
    "v4_endpoint": "first-cap endpoints C3/C4 lie in Cap and cannot alias Q0/Q1",
    "named_row_equality": "a named row equates center-to-support distances",
    "exact_offsupport": "exact support is available only for PRow, PRhoRow, S0Row, S1Row, DBRow",
}


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


V2 = load_module("freshthird_v2_for_equality_v5", V2_PATH)
V3 = load_module("freshthird_v3_for_equality_v5", V3_PATH)
STRUCTURAL_CUTS = (
    V2.at("Cap", "C3"),
    V2.at("Cap", "C4"),
    "(not (= C3 Q0))",
    "(not (= C3 Q1))",
    "(not (= C4 Q0))",
    "(not (= C4 Q1))",
)


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha256_file(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def canonical_json(value: Any) -> str:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False)


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


class Journal:
    def __init__(self, path: Path) -> None:
        self.path = path
        self.previous = "0" * 64

    def append(self, record: dict[str, Any]) -> None:
        payload = dict(record)
        payload["previous_sha256"] = self.previous
        digest = sha256_bytes(canonical_json(payload).encode())
        payload["record_sha256"] = digest
        self.path.parent.mkdir(parents=True, exist_ok=True)
        with self.path.open("a", encoding="utf-8") as handle:
            handle.write(canonical_json(payload) + "\n")
            handle.flush()
            os.fsync(handle.fileno())
        self.previous = digest


def row_slots(model: dict[str, int | bool], row: str) -> set[int]:
    return {i for i in POINTS if model.get(V2.sym(row, i)) is True}


def structural_assertions(tag: Any, learned: Iterable[str] = ()) -> list[str]:
    result = list(V2.base_assertions(tag))
    result.extend(V3.row_center_omissions())
    result.extend(V3.exact_blocker_alias_constraints())
    result.extend(STRUCTURAL_CUTS)
    result.extend(learned)
    return result


def emit_structural(tag: Any, learned: Iterable[str] = ()) -> tuple[str, list[str]]:
    assertions = structural_assertions(tag, learned)
    lines = ["(set-logic QF_LIA)", "(set-option :produce-models true)"]
    lines.extend(f"(declare-fun {role} () Int)" for role in V2.ROLES)
    for row in V2.ROWS:
        lines.extend(f"(declare-fun {V2.sym(row, i)} () Bool)" for i in POINTS)
    lines.extend(f"(assert {formula})" for formula in assertions)
    lines.append("(check-sat)")
    values = list(V2.ROLES) + [V2.sym(row, i) for row in V2.ROWS for i in POINTS]
    lines.append(f"(get-value ({' '.join(values)}))")
    return "\n".join(lines) + "\n", assertions


def solver_status(output: str) -> str:
    for line in output.splitlines():
        if line.strip() in {"sat", "unsat", "unknown"}:
            return line.strip()
    return "timeout" if "timeout" in output.lower() else "error"


def run_solver(binary: str, smt_path: Path, timeout_s: int) -> dict[str, Any]:
    if Path(binary).name == "cvc5":
        args = [
            binary,
            "--lang=smt2",
            "--produce-models",
            f"--tlimit={timeout_s * 1000}",
            str(smt_path),
        ]
    else:
        args = [binary, f"-T:{timeout_s}", str(smt_path)]
    try:
        proc = subprocess.run(
            args, text=True, capture_output=True, timeout=timeout_s + 10, check=False
        )
        output = proc.stdout + proc.stderr
        status = solver_status(output)
        rc = proc.returncode
    except subprocess.TimeoutExpired as exc:
        output = (exc.stdout or "") + (exc.stderr or "")
        status, rc = "timeout", -1
    return {
        "solver": Path(binary).name,
        "argv": args,
        "status": status,
        "returncode": rc,
        "output": output,
    }


def validate_structural(tag: Any, model: dict[str, int | bool]) -> list[str]:
    failures = list(V2.validate_assignment(tag, "base", model))
    cap = row_slots(model, "Cap")
    for center in ("C3", "C4"):
        if type(model.get(center)) is not int or int(model[center]) not in cap:
            failures.append(f"{center} absent from Cap")
    for center in ("C3", "C4"):
        for q in ("Q0", "Q1"):
            if model.get(center) == model.get(q):
                failures.append(f"forbidden endpoint/Q alias {center}={q}")
    for row, center in ROW_CENTERS.items():
        if type(model.get(center)) is not int:
            failures.append(f"missing center role {center}")
        elif int(model[center]) in row_slots(model, row):
            failures.append(f"{row} contains center {center}")
    exact = sorted(EXACT_ROWS.items())
    for i, (left_row, left_center) in enumerate(exact):
        for right_row, right_center in exact[i + 1 :]:
            if model.get(left_center) == model.get(right_center) and row_slots(
                model, left_row
            ) != row_slots(model, right_row):
                failures.append(
                    f"aliased exact centers disagree: {left_row}/{right_row}"
                )
    for row in ROW_CENTERS:
        if len(row_slots(model, row)) != 4:
            failures.append(f"{row} does not have four support slots")
    return sorted(set(failures))


Distance = tuple[int, int]


def distance_edge(center: int, point: int) -> Distance:
    if center == point:
        raise ValueError(f"diagonal distance edge ({center},{point})")
    return (center, point) if center < point else (point, center)


@dataclass(frozen=True)
class Step:
    left: Distance
    right: Distance
    row: str
    center_role: str
    center_slot: int
    support_slots: tuple[int, int]


def build_equality_graph(
    model: dict[str, int | bool],
) -> dict[Distance, list[tuple[Distance, Step]]]:
    graph: dict[Distance, list[tuple[Distance, Step]]] = {}
    for row, center_role in sorted(ROW_CENTERS.items()):
        center = int(model[center_role])
        support = sorted(row_slots(model, row))
        if len(support) != 4 or center in support:
            raise ValueError(f"unsupported/diagonal row state {row}")
        for i, left_point in enumerate(support):
            for right_point in support[i + 1 :]:
                left = distance_edge(center, left_point)
                right = distance_edge(center, right_point)
                if left == right:
                    raise ValueError(f"self equality in {row}")
                step = Step(
                    left, right, row, center_role, center, (left_point, right_point)
                )
                graph.setdefault(left, []).append((right, step))
                graph.setdefault(right, []).append((left, step))
    for value in graph.values():
        value.sort(key=lambda item: (item[0], item[1].row, item[1].support_slots))
    return graph


def shortest_path(
    graph: dict[Distance, list[tuple[Distance, Step]]], start: Distance, goal: Distance
) -> list[Step] | None:
    queue = deque([start])
    previous: dict[Distance, tuple[Distance, Step] | None] = {start: None}
    while queue:
        node = queue.popleft()
        if node == goal:
            break
        for neighbor, step in graph.get(node, []):
            if neighbor not in previous:
                previous[neighbor] = (node, step)
                queue.append(neighbor)
    if goal not in previous:
        return None
    result: list[Step] = []
    cursor = goal
    while previous[cursor] is not None:
        prior, step = previous[cursor]  # type: ignore[misc]
        result.append(step)
        cursor = prior
    result.reverse()
    return result


def atom_key(atom: dict[str, Any]) -> tuple[str, str, int, bool]:
    return (atom["kind"], atom["name"], int(atom["slot"]), bool(atom["value"]))


def role_atom(role: str, slot: int) -> dict[str, Any]:
    return {
        "kind": "role",
        "name": role,
        "slot": slot,
        "value": True,
        "source": "named_row_equality",
    }


def support_atom(row: str, slot: int, value: bool, source: str) -> dict[str, Any]:
    return {
        "kind": "support",
        "name": row,
        "slot": slot,
        "value": value,
        "source": source,
    }


def clause_literal(atom: dict[str, Any]) -> str:
    if atom["kind"] == "role":
        base = f"(= {atom['name']} {atom['slot']})"
    else:
        base = V2.sym(atom["name"], int(atom["slot"]))
    return f"(not {base})" if atom["value"] else base


def explanation(
    exact_row: str,
    member: int,
    excluded: int,
    steps: list[Step],
    model: dict[str, int | bool],
) -> dict[str, Any]:
    exact_center_role = EXACT_ROWS[exact_row]
    atoms: dict[tuple[str, str, int, bool], dict[str, Any]] = {}
    for step in steps:
        candidates = [role_atom(step.center_role, step.center_slot)]
        candidates.extend(
            support_atom(step.row, p, True, "named_row_equality")
            for p in step.support_slots
        )
        for atom in candidates:
            atoms[atom_key(atom)] = atom
    terminal = [
        role_atom(exact_center_role, int(model[exact_center_role])),
        support_atom(exact_row, member, True, "exact_offsupport"),
        support_atom(exact_row, excluded, False, "exact_offsupport"),
    ]
    for atom in terminal:
        atoms[atom_key(atom)] = atom
    ordered = sorted(atoms.values(), key=atom_key)
    literals = [clause_literal(atom) for atom in ordered]
    clause = literals[0] if len(literals) == 1 else f"(or {' '.join(literals)})"
    return {"source_atoms": ordered, "clause": clause}


def find_contradiction(model: dict[str, int | bool]) -> dict[str, Any] | None:
    graph = build_equality_graph(model)
    candidates: list[tuple[tuple[Any, ...], dict[str, Any]]] = []
    for exact_row, center_role in sorted(EXACT_ROWS.items()):
        center = int(model[center_role])
        support = sorted(row_slots(model, exact_row))
        excluded = [p for p in POINTS if p != center and p not in support]
        for member in support:
            start = distance_edge(center, member)
            for outsider in excluded:
                goal = distance_edge(center, outsider)
                path = shortest_path(graph, start, goal)
                if not path:
                    continue
                expl = explanation(exact_row, member, outsider, path, model)
                nodes = [start]
                cursor = start
                serialized_steps: list[dict[str, Any]] = []
                for step in path:
                    nxt = step.right if step.left == cursor else step.left
                    serialized_steps.append(asdict(step) | {"from": cursor, "to": nxt})
                    nodes.append(nxt)
                    cursor = nxt
                record = {
                    "exact_row": exact_row,
                    "exact_center_role": center_role,
                    "exact_center_slot": center,
                    "member_slot": member,
                    "excluded_slot": outsider,
                    "path_nodes": nodes,
                    "steps": serialized_steps,
                    **expl,
                    "source_contract": ["named_row_equality", "exact_offsupport"],
                    "minimality": {
                        "shortest_path_in_model_graph": True,
                        "simple_path": len(set(nodes)) == len(nodes),
                        "merged_duplicate_boolean_facts": True,
                    },
                }
                score = (
                    len(expl["source_atoms"]),
                    len(path),
                    exact_row,
                    member,
                    outsider,
                    canonical_json(serialized_steps),
                )
                candidates.append((score, record))
    return min(candidates, key=lambda pair: pair[0])[1] if candidates else None


def validate_cut(record: dict[str, Any], model: dict[str, int | bool]) -> list[str]:
    failures: list[str] = []
    exact_row = record.get("exact_row")
    if exact_row not in EXACT_ROWS:
        failures.append("unsupported exact row")
        return failures
    nodes = [tuple(x) for x in record.get("path_nodes", [])]
    steps = record.get("steps", [])
    if len(nodes) != len(steps) + 1 or not steps:
        failures.append("malformed path length")
    for i, step in enumerate(steps):
        if (
            tuple(step.get("from", ())) != nodes[i]
            or tuple(step.get("to", ())) != nodes[i + 1]
        ):
            failures.append(f"step {i} is not contiguous")
        row = step.get("row")
        if row not in ROW_CENTERS or step.get("center_role") != ROW_CENTERS.get(row):
            failures.append(f"step {i} has unsupported row provenance")
            continue
        center = int(model[ROW_CENTERS[row]])
        support = tuple(step.get("support_slots", ()))
        if step.get("center_slot") != center or len(support) != 2:
            failures.append(f"step {i} center/support malformed")
        elif any(p not in row_slots(model, row) for p in support):
            failures.append(f"step {i} uses nonmember")
        elif distance_edge(center, support[0]) not in {
            nodes[i],
            nodes[i + 1],
        } or distance_edge(center, support[1]) not in {nodes[i], nodes[i + 1]}:
            failures.append(f"step {i} distance nodes mismatch")
    center_role = EXACT_ROWS[exact_row]
    center = int(model[center_role])
    member = int(record["member_slot"])
    excluded = int(record["excluded_slot"])
    support = row_slots(model, exact_row)
    if member not in support or excluded in support or excluded == center:
        failures.append("invalid exact member/offmember terminal")
    else:
        if nodes and nodes[0] != distance_edge(center, member):
            failures.append("path start is not exact member edge")
        if nodes and nodes[-1] != distance_edge(center, excluded):
            failures.append("path end is not exact excluded edge")
    expected = explanation(
        exact_row,
        member,
        excluded,
        [
            Step(
                tuple(s["left"]),
                tuple(s["right"]),
                s["row"],
                s["center_role"],
                s["center_slot"],
                tuple(s["support_slots"]),
            )
            for s in steps
        ],
        model,
    )
    if (
        record.get("source_atoms") != expected["source_atoms"]
        or record.get("clause") != expected["clause"]
    ):
        failures.append("clause is not exactly the path fact conjunction negation")
    for atom in record.get("source_atoms", []):
        if atom["kind"] == "role" and model.get(atom["name"]) != atom["slot"]:
            failures.append(f"role atom false in source model: {atom}")
        if (
            atom["kind"] == "support"
            and (model.get(V2.sym(atom["name"], atom["slot"])) is True) != atom["value"]
        ):
            failures.append(f"support atom false in source model: {atom}")
        if not atom.get("source"):
            failures.append("incomplete source provenance")
    if any(
        atom["kind"] == "support"
        and not atom["value"]
        and atom["name"] not in EXACT_ROWS
        for atom in record.get("source_atoms", [])
    ):
        failures.append("non-exact offsupport used as a disequality")
    if len(set(nodes)) != len(nodes):
        failures.append("path has a removable cycle")
    return sorted(set(failures))


def semantic_model(model: dict[str, int | bool]) -> dict[str, Any]:
    return {
        "roles": {name: int(model[name]) for name in V2.ROLES},
        "rows": {row: sorted(row_slots(model, row)) for row in V2.ROWS},
    }


def save_solver_result(
    base: Path, result: dict[str, Any], model: dict[str, int | bool] | None = None
) -> None:
    output = result.pop("output")
    log_path = Path(str(base) + ".log")
    result_path = Path(str(base) + ".result.json")
    log_path.write_text(output)
    payload = dict(result)
    payload["log_sha256"] = sha256_file(log_path)
    if model is not None:
        model_path = Path(str(base) + ".model.json")
        write_json(model_path, semantic_model(model))
        payload["model"] = model_path.relative_to(ROOT).as_posix()
        payload["model_sha256"] = sha256_file(model_path)
    write_json(result_path, payload)


def parse_model(result: dict[str, Any]) -> dict[str, int | bool]:
    return V2.parse_assignment(result["output"]) if result["status"] == "sat" else {}


def emit_control(path: Path, assertions: list[str]) -> None:
    text = "(set-logic QF_LRA)\n" + "\n".join(assertions) + "\n(check-sat)\n"
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text)


def run_controls(z3_bin: str, cvc5_bin: str, timeout_s: int) -> dict[str, Any]:
    control_dir = ARTIFACTS / "controls"
    controls = {
        "known_sat": ["(declare-fun x () Real)", "(assert (= x 0))"],
        "member_offmember_cycle_unsat": [
            "(declare-fun d01 () Real)",
            "(declare-fun d15 () Real)",
            "(declare-fun d05 () Real)",
            "(assert (= d01 d15))",
            "(assert (= d15 d05))",
            "(assert (not (= d01 d05)))",
        ],
        "drop_first_equality_sat": [
            "(declare-fun d01 () Real)",
            "(declare-fun d15 () Real)",
            "(declare-fun d05 () Real)",
            "(assert (= d15 d05))",
            "(assert (not (= d01 d05)))",
        ],
        "drop_second_equality_sat": [
            "(declare-fun d01 () Real)",
            "(declare-fun d15 () Real)",
            "(declare-fun d05 () Real)",
            "(assert (= d01 d15))",
            "(assert (not (= d01 d05)))",
        ],
        "drop_exact_offsupport_sat": [
            "(declare-fun d01 () Real)",
            "(declare-fun d15 () Real)",
            "(declare-fun d05 () Real)",
            "(assert (= d01 d15))",
            "(assert (= d15 d05))",
        ],
        "nonexact_offsupport_not_disequality_sat": [
            "(declare-fun d01 () Real)",
            "(declare-fun d15 () Real)",
            "(declare-fun d05 () Real)",
            "(assert (= d01 d15))",
            "(assert (= d15 d05))",
        ],
    }
    expected = {
        name: ("unsat" if name.endswith("_unsat") else "sat") for name in controls
    }
    report: dict[str, Any] = {}
    for name, assertions in controls.items():
        path = control_dir / f"{name}.smt2"
        emit_control(path, assertions)
        solvers: dict[str, Any] = {}
        for binary in (z3_bin, cvc5_bin):
            result = run_solver(binary, path, timeout_s)
            output = result.pop("output")
            log = control_dir / f"{name}.{Path(binary).name}.log"
            log.write_text(output)
            solvers[Path(binary).name] = result | {
                "log": log.relative_to(ROOT).as_posix(),
                "log_sha256": sha256_file(log),
            }
            if result["status"] != expected[name]:
                raise RuntimeError(
                    f"control {name}/{Path(binary).name}: expected {expected[name]}, got {result['status']}"
                )
        report[name] = {
            "expected": expected[name],
            "smt2": path.relative_to(ROOT).as_posix(),
            "solvers": solvers,
        }
    return report


def run_tag(
    tag: Any,
    z3_bin: str,
    cvc5_bin: str,
    timeout_s: int,
    max_iterations: int,
    journal: Journal,
) -> dict[str, Any]:
    tag_dir = ARTIFACTS / tag.name
    tag_dir.mkdir(parents=True, exist_ok=True)
    learned: list[str] = []
    cut_records: list[dict[str, Any]] = []
    for iteration in range(max_iterations):
        smt, assertions = emit_structural(tag, learned)
        smt_path = tag_dir / f"candidate_{iteration:03d}.smt2"
        smt_path.write_text(smt)
        if smt.count("(check-sat)") != 1:
            raise RuntimeError("candidate does not contain exactly one check-sat")
        z3_result = run_solver(z3_bin, smt_path, timeout_s)
        z3_model = parse_model(z3_result)
        save_solver_result(
            tag_dir / f"candidate_{iteration:03d}.z3",
            dict(z3_result),
            z3_model if z3_model else None,
        )
        journal.append(
            {
                "type": "candidate",
                "tag": tag.name,
                "iteration": iteration,
                "solver": "z3",
                "status": z3_result["status"],
                "query_sha256": sha256_file(smt_path),
                "learned_cut_count": len(learned),
            }
        )
        if z3_result["status"] == "unsat":
            cvc5_result = run_solver(cvc5_bin, smt_path, timeout_s)
            save_solver_result(
                tag_dir / f"candidate_{iteration:03d}.cvc5", dict(cvc5_result)
            )
            if cvc5_result["status"] != "unsat":
                return {
                    "tag": tag.name,
                    "classification": "SOLVER_DISAGREEMENT",
                    "iteration": iteration,
                    "cuts": cut_records,
                }
            journal.append(
                {
                    "type": "terminal",
                    "tag": tag.name,
                    "classification": "DUAL_UNSAT_EQUALITY_PATH_FINITE_TAG",
                    "iteration": iteration,
                    "query_sha256": sha256_file(smt_path),
                }
            )
            return {
                "tag": tag.name,
                "classification": "DUAL_UNSAT_EQUALITY_PATH_FINITE_TAG",
                "iteration": iteration,
                "cuts": cut_records,
                "terminal_query": smt_path.relative_to(ROOT).as_posix(),
                "assertion_count": len(assertions),
            }
        if z3_result["status"] != "sat":
            return {
                "tag": tag.name,
                "classification": "INCONCLUSIVE",
                "iteration": iteration,
                "status": z3_result["status"],
                "cuts": cut_records,
            }
        failures = validate_structural(tag, z3_model)
        if failures:
            raise RuntimeError(
                f"z3 structural validation failed for {tag.name}: {failures}"
            )
        conflict = find_contradiction(z3_model)
        if conflict is not None:
            failures = validate_cut(conflict, z3_model)
            if failures:
                raise RuntimeError(f"invalid z3 cut for {tag.name}: {failures}")
            conflict |= {
                "cut_id": f"{tag.name}-cut-{len(cut_records):03d}",
                "candidate_iteration": iteration,
                "discovery_solver": "z3",
            }
            cut_records.append(conflict)
            learned.append(conflict["clause"])
            journal.append(
                {
                    "type": "learned_cut",
                    "tag": tag.name,
                    "iteration": iteration,
                    "cut": conflict,
                }
            )
            continue
        cvc5_result = run_solver(cvc5_bin, smt_path, timeout_s)
        cvc5_model = parse_model(cvc5_result)
        save_solver_result(
            tag_dir / f"candidate_{iteration:03d}.cvc5",
            dict(cvc5_result),
            cvc5_model if cvc5_model else None,
        )
        journal.append(
            {
                "type": "candidate",
                "tag": tag.name,
                "iteration": iteration,
                "solver": "cvc5",
                "status": cvc5_result["status"],
                "query_sha256": sha256_file(smt_path),
                "learned_cut_count": len(learned),
            }
        )
        if cvc5_result["status"] != "sat":
            return {
                "tag": tag.name,
                "classification": "SOLVER_DISAGREEMENT",
                "iteration": iteration,
                "cuts": cut_records,
            }
        failures = validate_structural(tag, cvc5_model)
        if failures:
            raise RuntimeError(
                f"cvc5 structural validation failed for {tag.name}: {failures}"
            )
        cvc5_conflict = find_contradiction(cvc5_model)
        if cvc5_conflict is not None:
            failures = validate_cut(cvc5_conflict, cvc5_model)
            if failures:
                raise RuntimeError(f"invalid cvc5 cut for {tag.name}: {failures}")
            cvc5_conflict |= {
                "cut_id": f"{tag.name}-cut-{len(cut_records):03d}",
                "candidate_iteration": iteration,
                "discovery_solver": "cvc5",
            }
            cut_records.append(cvc5_conflict)
            learned.append(cvc5_conflict["clause"])
            journal.append(
                {
                    "type": "learned_cut",
                    "tag": tag.name,
                    "iteration": iteration,
                    "cut": cvc5_conflict,
                }
            )
            continue
        journal.append(
            {
                "type": "terminal",
                "tag": tag.name,
                "classification": "DUAL_SAT_VALIDATED_EQUALITY_CLEAN",
                "iteration": iteration,
                "query_sha256": sha256_file(smt_path),
            }
        )
        return {
            "tag": tag.name,
            "classification": "DUAL_SAT_VALIDATED_EQUALITY_CLEAN",
            "iteration": iteration,
            "cuts": cut_records,
            "terminal_query": smt_path.relative_to(ROOT).as_posix(),
            "z3_model": semantic_model(z3_model),
            "cvc5_model": semantic_model(cvc5_model),
            "assertion_count": len(assertions),
        }
    return {
        "tag": tag.name,
        "classification": "MAX_ITERATIONS",
        "iteration": max_iterations,
        "cuts": cut_records,
    }


def write_checksums() -> None:
    paths = sorted(
        p
        for p in ROOT.rglob("*")
        if p.is_file() and p.name != "SHA256SUMS" and "__pycache__" not in p.parts
    )
    (ROOT / "SHA256SUMS").write_text(
        "".join(
            f"{sha256_file(path)}  {path.relative_to(ROOT).as_posix()}\n"
            for path in paths
        )
    )


def clean_generated() -> None:
    if ARTIFACTS.exists():
        shutil.rmtree(ARTIFACTS)
    for name in ("journal.jsonl", "results.json", "manifest.json", "SHA256SUMS"):
        path = ROOT / name
        if path.exists():
            path.unlink()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--overwrite", action="store_true")
    parser.add_argument("--max-iterations", type=int, default=128)
    parser.add_argument("--solver-timeout", type=int, default=45)
    parser.add_argument("--smoke-only", action="store_true")
    args = parser.parse_args()
    if (ROOT / "results.json").exists() and not args.overwrite:
        raise SystemExit("results already exist; pass --overwrite explicitly")
    if args.overwrite:
        clean_generated()
    z3_bin = shutil.which("z3")
    cvc5_bin = shutil.which("cvc5")
    if not z3_bin or not cvc5_bin:
        raise SystemExit("z3 and cvc5 are both required")
    manifest = {
        "schema": "freshthird-five-survivor-equality-path-v5",
        "scope": "finite exact-17 structural support model only",
        "source_files": {
            str(V2_PATH.relative_to(REPO)): sha256_file(V2_PATH),
            str(V3_PATH.relative_to(REPO)): sha256_file(V3_PATH),
            str(V4_SOURCE_MAP.relative_to(REPO)): sha256_file(V4_SOURCE_MAP),
        },
        "source_labels": SOURCE_LABELS,
        "tags": [asdict(tag) | {"name": tag.name} for tag in V2.TAGS],
        "solvers": {"z3": z3_bin, "cvc5": cvc5_bin},
        "limits": {
            "solver_timeout_seconds": args.solver_timeout,
            "max_iterations_per_tag": args.max_iterations,
            "cores": 1,
        },
        "exact_rows": EXACT_ROWS,
        "named_row_centers": ROW_CENTERS,
        "structural_cuts": STRUCTURAL_CUTS,
    }
    write_json(ROOT / "manifest.json", manifest)
    journal = Journal(ROOT / "journal.jsonl")
    journal.append(
        {
            "type": "wave_start",
            "manifest_sha256": sha256_file(ROOT / "manifest.json"),
            "scope": manifest["scope"],
        }
    )
    controls = run_controls(z3_bin, cvc5_bin, min(args.solver_timeout, 15))
    journal.append(
        {
            "type": "controls",
            "controls": {name: item["expected"] for name, item in controls.items()},
        }
    )
    tags: list[dict[str, Any]] = []
    if not args.smoke_only:
        for tag in V2.TAGS:
            tags.append(
                run_tag(
                    tag,
                    z3_bin,
                    cvc5_bin,
                    args.solver_timeout,
                    args.max_iterations,
                    journal,
                )
            )
    results = {
        "schema": manifest["schema"],
        "scope": manifest["scope"],
        "source_labels": SOURCE_LABELS,
        "certificate_scope": "dual-solver status replay plus independently checked finite assignments and source-provenance paths; no proof certificate and no universal coverage",
        "controls": controls,
        "tags": tags,
        "summary": {
            classification: sum(
                item["classification"] == classification for item in tags
            )
            for classification in sorted({item["classification"] for item in tags})
        },
        "claims_not_made": [
            "P97 counterexample",
            "universal-cardinality lift",
            "Lean theorem closure",
            "sorry closure",
            "Euclidean realizability",
        ],
    }
    write_json(ROOT / "results.json", results)
    journal.append(
        {
            "type": "wave_complete",
            "result_sha256": sha256_file(ROOT / "results.json"),
            "summary": results["summary"],
        }
    )
    write_checksums()
    print(json.dumps(results["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
