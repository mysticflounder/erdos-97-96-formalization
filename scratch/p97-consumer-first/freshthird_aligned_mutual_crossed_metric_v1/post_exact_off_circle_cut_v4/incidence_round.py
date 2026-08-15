#!/usr/bin/env python3
"""Lazy ExactOffCircleCore separation for the exact-17 direct-crossed packet."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
import shutil
import subprocess
import sys
import time
from collections import deque
from dataclasses import dataclass
from pathlib import Path
from types import ModuleType
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
V3 = HERE.parent / "post_rich_cut_v3"
V3_INCIDENCE = V3 / "incidence_round.py"
KNOWN_V3_ASSIGNMENT = V3 / "generated" / "post_rich_cut_v3_assignment.json"
GENERATED = HERE / "generated"
LOGS = HERE / "logs"
CUTS = GENERATED / "cuts.jsonl"
STATE = GENERATED / "state.json"
RESULTS = HERE / "incidence_results.json"
FINAL_QUERY = GENERATED / "post_exact_off_circle_cut_v4_incidence.smt2"
FINAL_ASSIGNMENT = GENERATED / "post_exact_off_circle_cut_v4_assignment.json"

Node = tuple[int, int]


def load_module(name: str, path: Path) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def canonical_edge(left: int, right: int) -> Node:
    if left == right:
        raise ValueError("a carrier edge must have distinct endpoints")
    return (left, right) if left < right else (right, left)


@dataclass(frozen=True)
class Step:
    left: Node
    right: Node
    row_center: int
    row_members: tuple[int, int]

    def as_json(self) -> dict[str, Any]:
        return {
            "left": list(self.left),
            "right": list(self.right),
            "row_center": self.row_center,
            "row_members": list(self.row_members),
        }


def equality_graph(
    point_rows: list[list[int]],
) -> dict[Node, list[tuple[Node, Step]]]:
    """Build the exact equality graph induced by all chosen point-K4 rows."""
    graph: dict[Node, list[tuple[Node, Step]]] = {}
    for center, raw_support in enumerate(point_rows):
        support = sorted(map(int, raw_support))
        if len(support) != 4 or center in support or len(set(support)) != 4:
            raise ValueError(f"invalid chosen point-K4 row at center {center}")
        base = support[0]
        base_node = canonical_edge(center, base)
        graph.setdefault(base_node, [])
        for member in support[1:]:
            node = canonical_edge(center, member)
            step = Step(base_node, node, center, (base, member))
            graph.setdefault(base_node, []).append((node, step))
            graph.setdefault(node, []).append((base_node, step))
    return graph


def shortest_path(
    graph: dict[Node, list[tuple[Node, Step]]], start: Node, target: Node
) -> list[Step] | None:
    if start == target:
        return []
    queue: deque[Node] = deque([start])
    previous: dict[Node, tuple[Node, Step] | None] = {start: None}
    while queue:
        node = queue.popleft()
        for nxt, step in graph.get(node, []):
            if nxt in previous:
                continue
            previous[nxt] = (node, step)
            if nxt == target:
                path: list[Step] = []
                cursor = target
                while previous[cursor] is not None:
                    prior, edge_step = previous[cursor]  # type: ignore[misc]
                    path.append(edge_step)
                    cursor = prior
                return list(reversed(path))
            queue.append(nxt)
    return None


def find_exact_off_circle_witnesses(assignment: dict[str, Any]) -> list[dict[str, Any]]:
    """Find one shortest ExactOffCircleCore witness per blocker-image center."""
    n = int(assignment["n"])
    blockers = list(map(int, assignment["blockers"]))
    rows = [list(map(int, row)) for row in assignment["point_k4_rows"]]
    graph = equality_graph(rows)
    witnesses: list[dict[str, Any]] = []
    for center in sorted(set(blockers)):
        sources = [q for q, blocker in enumerate(blockers) if blocker == center]
        support = sorted(rows[center])
        best: tuple[int, int, list[Step]] | None = None
        for member in support:
            start = canonical_edge(center, member)
            for off in range(n):
                if off == center or off in support:
                    continue
                path = shortest_path(graph, start, canonical_edge(center, off))
                if path is None:
                    continue
                candidate = (member, off, path)
                if best is None or (len(path), member, off) < (
                    len(best[2]),
                    best[0],
                    best[1],
                ):
                    best = candidate
        if best is not None:
            member, off, path = best
            witnesses.append(
                {
                    "source": sources[0],
                    "all_sources_at_center": sources,
                    "center": center,
                    "support_point": member,
                    "off_support_point": off,
                    "start_node": list(canonical_edge(center, member)),
                    "target_node": list(canonical_edge(center, off)),
                    "path": [step.as_json() for step in path],
                    "path_length": len(path),
                }
            )
    return witnesses


def literal_keys(witness: dict[str, Any]) -> list[tuple[str, int, int, bool]]:
    """Return the deduplicated membership literals guarding a path."""
    keys: list[tuple[str, int, int, bool]] = [
        ("point_k4", int(witness["center"]), int(witness["support_point"]), True),
        (
            "point_k4",
            int(witness["center"]),
            int(witness["off_support_point"]),
            False,
        ),
    ]
    for raw_step in witness["path"]:
        row_center = int(raw_step["row_center"])
        for member in raw_step["row_members"]:
            keys.append(("point_k4", row_center, int(member), True))
    return list(dict.fromkeys(keys))


def enrich_cut(
    witness: dict[str, Any], cut_id: int, iteration: int | None = None
) -> dict[str, Any]:
    cut = dict(witness)
    cut.update(
        {
            "cut_id": cut_id,
            "generated_at_iteration": iteration,
            "schema": "exact_off_circle_path_v1",
            "source_theorems": [
                "Problem97.Census554.EqualityCore.ExactOffCircleCore",
                "Problem97.Census554.EqualityCore.false_of_exactAt_of_exactOffCircleCore",
                "Problem97.Census554.GeneralCarrierBridge.exactAt_blocker",
            ],
            "identity_guard": {
                "source": int(witness["source"]),
                "blocker_equals": int(witness["center"]),
            },
            "membership_guards": [
                {
                    "kind": kind,
                    "center": center,
                    "point": point,
                    "polarity": polarity,
                }
                for kind, center, point, polarity in literal_keys(witness)
            ],
        }
    )
    payload = json.dumps(cut, sort_keys=True, separators=(",", ":")).encode()
    cut["sha256"] = hashlib.sha256(payload).hexdigest()
    return cut


def cut_formula(g: Any, cut: dict[str, Any]) -> z3.BoolRef:
    source = int(cut["identity_guard"]["source"])
    center = int(cut["identity_guard"]["blocker_equals"])
    guards: list[z3.BoolRef] = [g.base.blocker[source] == center]
    for item in cut["membership_guards"]:
        literal = g.point_k4[int(item["center"])][int(item["point"])]
        guards.append(literal if item["polarity"] else z3.Not(literal))
    return z3.Not(z3.And(guards))


def validate_cut(cut: dict[str, Any], assignment: dict[str, Any]) -> list[str]:
    """Independently validate metadata, guards, and the equality path."""
    errors: list[str] = []
    n = int(assignment["n"])
    rows = [set(map(int, row)) for row in assignment["point_k4_rows"]]
    blockers = list(map(int, assignment["blockers"]))
    source = int(cut["source"])
    center = int(cut["center"])
    support = int(cut["support_point"])
    off = int(cut["off_support_point"])
    if not (0 <= source < n and blockers[source] == center):
        errors.append("identity guard is not true in witness assignment")
    if support not in rows[center]:
        errors.append("support point is not in blocker-center support")
    if off == center or off in rows[center]:
        errors.append("off-support point is not genuinely off support")
    cursor = canonical_edge(center, support)
    for index, raw_step in enumerate(cut["path"]):
        left = tuple(map(int, raw_step["left"]))
        right = tuple(map(int, raw_step["right"]))
        row_center = int(raw_step["row_center"])
        members = tuple(map(int, raw_step["row_members"]))
        if left != canonical_edge(row_center, members[0]):
            errors.append(f"path step {index} left node is not induced by its row")
        if right != canonical_edge(row_center, members[1]):
            errors.append(f"path step {index} right node is not induced by its row")
        if not set(members) <= rows[row_center]:
            errors.append(f"path step {index} membership guard is false")
        if cursor == left:
            cursor = right  # type: ignore[assignment]
        elif cursor == right:
            cursor = left  # type: ignore[assignment]
        else:
            errors.append(f"path step {index} is disconnected")
    if cursor != canonical_edge(center, off):
        errors.append("path does not end at the claimed off-support edge")
    expected = literal_keys(cut)
    actual = [
        (
            str(item["kind"]),
            int(item["center"]),
            int(item["point"]),
            bool(item["polarity"]),
        )
        for item in cut["membership_guards"]
    ]
    if actual != expected:
        errors.append("membership guards do not exactly cover the path")
    return errors


def emit_one_check(solver: z3.Solver, path: Path) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    body = solver.sexpr().rstrip()
    if re.search(r"\(\s*check-sat\b", body):
        raise RuntimeError("unexpected check-sat in solver sexpr")
    text = body + "\n(check-sat)\n"
    if len(re.findall(r"\(\s*check-sat\b", text)) != 1:
        raise RuntimeError("artifact must contain exactly one check-sat")
    path.write_text(text)


def external_check(name: str, query: Path, timeout_s: int) -> dict[str, Any]:
    executable = shutil.which(name)
    if executable is None:
        return {"status": "ERROR:unavailable", "seconds": 0.0}
    command = (
        [executable, "-smt2", f"-T:{timeout_s}", str(query)]
        if name == "z3"
        else [
            executable,
            "--lang=smt2",
            "--check-models",
            f"--tlimit={timeout_s * 1000}",
            str(query),
        ]
    )
    start = time.monotonic()
    try:
        proc = subprocess.run(
            command, capture_output=True, text=True, timeout=timeout_s + 5, check=False
        )
    except subprocess.TimeoutExpired as exc:
        stdout = (
            exc.stdout.decode() if isinstance(exc.stdout, bytes) else exc.stdout or ""
        )
        stderr = (
            exc.stderr.decode() if isinstance(exc.stderr, bytes) else exc.stderr or ""
        )
        (LOGS / f"final_{name}.log").write_text(stdout + "\nSTDERR\n" + stderr)
        return {"status": "TIMEOUT", "seconds": round(time.monotonic() - start, 3)}
    output = proc.stdout + "\nSTDERR\n" + proc.stderr
    (LOGS / f"final_{name}.log").write_text(output)
    tokens = re.findall(r"(?m)^\s*(sat|unsat|unknown)\s*$", output)
    if proc.returncode != 0:
        status = f"ERROR:exit_{proc.returncode}"
    elif len(tokens) != 1:
        status = f"ERROR:status_count_{len(tokens)}"
    else:
        status = tokens[0].upper()
    return {"status": status, "seconds": round(time.monotonic() - start, 3)}


def build_solver() -> tuple[ModuleType, ModuleType, Any, list[dict[str, str]]]:
    v3 = load_module("freshthird_v3_incidence", V3_INCIDENCE)
    source = v3.load_source_generator()
    g = source.build_global_k4()
    audit = v3.add_singleton_rich_exclusion(g)
    audit += v3.add_first_apex_source_singleton_k4_preflight(g)
    audit += v3.add_exact_six_rich_selected_support_preflight(g)
    return v3, source, g, audit


def load_cuts() -> list[dict[str, Any]]:
    if not CUTS.exists():
        return []
    cuts = [json.loads(line) for line in CUTS.read_text().splitlines() if line.strip()]
    ids = [int(cut["cut_id"]) for cut in cuts]
    if ids != list(range(len(cuts))):
        raise RuntimeError("cut IDs are not a contiguous resumable sequence")
    return cuts


def save_cuts(cuts: list[dict[str, Any]]) -> None:
    CUTS.parent.mkdir(parents=True, exist_ok=True)
    CUTS.write_text("".join(json.dumps(cut, sort_keys=True) + "\n" for cut in cuts))


def smoke_controls(v3: ModuleType, source: ModuleType) -> dict[str, Any]:
    known = json.loads(KNOWN_V3_ASSIGNMENT.read_text())
    inherited_errors = source.verify_global_assignment(known) + v3.validate_cut(known)
    witnesses = find_exact_off_circle_witnesses(known)
    cut_errors: list[str] = []
    if witnesses:
        cut_errors = validate_cut(enrich_cut(witnesses[0], 0, -1), known)
    return {
        "known_v3_assignment": {
            "expected": "REJECTED",
            "status": (
                "PASS"
                if not inherited_errors and witnesses and not cut_errors
                else "FAIL"
            ),
            "witness_count": len(witnesses),
            "first_witness": witnesses[0] if witnesses else None,
            "validation_errors": inherited_errors + cut_errors,
        },
        "one_check_sat_control": v3.smoke_controls(5),
    }


def run(timeout_s: int, max_iterations: int, reset: bool) -> dict[str, Any]:
    GENERATED.mkdir(parents=True, exist_ok=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    if reset:
        for path in (CUTS, STATE, RESULTS, FINAL_QUERY, FINAL_ASSIGNMENT):
            path.unlink(missing_ok=True)
        for path in GENERATED.glob("iteration_*_assignment.json"):
            path.unlink()
    v3, source, g, source_audit = build_solver()
    cuts = load_cuts()
    for cut in cuts:
        g.solver.add(cut_formula(g, cut))
    controls = smoke_controls(v3, source)
    if controls["known_v3_assignment"]["status"] != "PASS":
        raise RuntimeError("known-v3 rejection smoke failed")

    history: list[dict[str, Any]] = []
    final_status = "ITERATION_LIMIT"
    final_assignment: dict[str, Any] | None = None
    existing_iterations = sorted(GENERATED.glob("iteration_*_assignment.json"))
    start_iteration = (
        int(existing_iterations[-1].stem.split("_")[1]) + 1
        if existing_iterations
        else 0
    )
    for iteration in range(start_iteration, max_iterations):
        g.solver.set(timeout=timeout_s * 1000, random_seed=971704 + iteration)
        started = time.monotonic()
        status = g.solver.check()
        seconds = round(time.monotonic() - started, 3)
        if status == z3.unsat:
            final_status = "STRUCTURAL_UNSAT"
            history.append(
                {"iteration": iteration, "status": "UNSAT", "seconds": seconds}
            )
            break
        if status != z3.sat:
            final_status = "UNKNOWN_FAIL_CLOSED"
            history.append(
                {
                    "iteration": iteration,
                    "status": "UNKNOWN",
                    "reason": g.solver.reason_unknown(),
                    "seconds": seconds,
                }
            )
            break
        assignment = source.extract_global_assignment(g, g.solver.model())
        inherited_errors = source.verify_global_assignment(
            assignment
        ) + v3.validate_cut(assignment)
        if inherited_errors:
            raise RuntimeError(
                "invalid solver assignment: " + "; ".join(inherited_errors)
            )
        assignment_path = GENERATED / f"iteration_{iteration:04d}_assignment.json"
        assignment_path.write_text(
            json.dumps(assignment, indent=2, sort_keys=True) + "\n"
        )
        witnesses = find_exact_off_circle_witnesses(assignment)
        history.append(
            {
                "iteration": iteration,
                "status": "SAT",
                "seconds": seconds,
                "assignment": str(assignment_path.relative_to(HERE)),
                "witness_count": len(witnesses),
            }
        )
        if not witnesses:
            final_status = "CLOSURE_CLEAN_SAT"
            final_assignment = assignment
            FINAL_ASSIGNMENT.write_text(
                json.dumps(assignment, indent=2, sort_keys=True) + "\n"
            )
            break
        for witness in witnesses:
            cut = enrich_cut(witness, len(cuts), iteration)
            errors = validate_cut(cut, assignment)
            if errors:
                raise RuntimeError("generated invalid cut: " + "; ".join(errors))
            cuts.append(cut)
            g.solver.add(cut_formula(g, cut))
        save_cuts(cuts)
        STATE.write_text(
            json.dumps(
                {
                    "status": "RUNNING",
                    "completed_iteration": iteration,
                    "cut_count": len(cuts),
                    "last_assignment": str(assignment_path.relative_to(HERE)),
                },
                indent=2,
                sort_keys=True,
            )
            + "\n"
        )

    # Model-completion during extraction can append Z3-specific ``model-add``
    # commands to ``solver.sexpr()``.  Rebuild from source and replay only the
    # audited cuts so the final artifact remains portable SMT-LIB.
    _, _, final_g, _ = build_solver()
    for cut in cuts:
        final_g.solver.add(cut_formula(final_g, cut))
    emit_one_check(final_g.solver, FINAL_QUERY)
    external = {
        "z3": external_check("z3", FINAL_QUERY, timeout_s),
        "cvc5": external_check("cvc5", FINAL_QUERY, timeout_s),
    }
    expected_external = (
        "UNSAT"
        if final_status == "STRUCTURAL_UNSAT"
        else ("SAT" if final_status == "CLOSURE_CLEAN_SAT" else None)
    )
    dual_check = (
        "PASS"
        if expected_external is not None
        and all(item["status"] == expected_external for item in external.values())
        else "INCONCLUSIVE"
    )
    results = {
        "scope": "exact-17 direct-crossed incidence abstraction only",
        "classification": final_status,
        "closure_claim": "NONE",
        "universal_lift": False,
        "lean_sorry_closed": False,
        "source_contract": [
            "EqualityCore.ExactOffCircleCore",
            "EqualityCore.false_of_exactAt_of_exactOffCircleCore",
            "GeneralCarrierBridge.exactAt_blocker",
        ],
        "source_audit": source_audit,
        "cut_count": len(cuts),
        "iterations_this_run": history,
        "resumable_state": str(STATE.relative_to(HERE)),
        "cuts": str(CUTS.relative_to(HERE)),
        "query": str(FINAL_QUERY.relative_to(HERE)),
        "check_sat_count": FINAL_QUERY.read_text().count("(check-sat)"),
        "external": external,
        "dual_check": dual_check,
        "controls": controls,
        "assignment": (
            str(FINAL_ASSIGNMENT.relative_to(HERE))
            if final_assignment is not None
            else None
        ),
        "omitted_scope": [
            "reversed crossed constructor",
            "both deletion residual constructors",
            "all cardinalities other than 17",
            "universal finite-core lift",
            "complete original-P97 ingress",
        ],
    }
    STATE.write_text(
        json.dumps(
            {
                "status": final_status,
                "cut_count": len(cuts),
                "query": str(FINAL_QUERY.relative_to(HERE)),
                "dual_check": dual_check,
            },
            indent=2,
            sort_keys=True,
        )
        + "\n"
    )
    RESULTS.write_text(json.dumps(results, indent=2, sort_keys=True) + "\n")
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-s", type=int, default=120)
    parser.add_argument("--max-iterations", type=int, default=200)
    parser.add_argument("--reset", action="store_true")
    args = parser.parse_args()
    result = run(args.timeout_s, args.max_iterations, args.reset)
    print(
        f"classification={result['classification']} cuts={result['cut_count']} "
        f"dual={result['dual_check']}"
    )


if __name__ == "__main__":
    main()
