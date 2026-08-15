#!/usr/bin/env python3
"""Exact-cardinality-12 finite incidence feasibility probe.

This is a necessary-consequence abstraction, not a Euclidean realization and
not a proof of the anchored Lean theorem.
"""

from __future__ import annotations

import hashlib
import json
import shutil
import subprocess
import sys
from itertools import combinations, permutations
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
sys.path.insert(0, str(ROOT))

from census.card_head.candidate_surface import (  # noqa: E402
    MOSER,
    V,
    W,
    build_model,
)
from census.card_head.sat_encoding import CoverInstance  # noqa: E402


CARDINALITY = 12
THEOREM_PROFILE = (5, 4, 6)
# Frozen order is (surplus, theorem opp2, theorem opp1), putting the two
# large caps first while preserving the theorem's labeled cap roles.
FROZEN_PROFILE = (5, 6, 4)
THEOREM_OPP2_FROZEN_INDEX = 1
THEOREM_OPP1_FROZEN_INDEX = 2
PHYSICAL_APEX = V
FIRST_APEX = W
U, C, XV, XU = 6, 7, 8, 9
INTERIOR_Q, INTERIOR_W = 10, 11
SOURCE_ROLE_LABELS = {"u": U, "xv": XV, "xu": XU}
DELETION_ROLE_LABELS = {"q": INTERIOR_Q, "w": INTERIOR_W}
OUTSIDE_O2_INTERIOR = (0, 2, 3, 4, 5, 10, 11)
SCHEMA = "p97_pentagon_offclass_exact12_v2.model.v1"
SCOPE = (
    "SAT/UNSAT only for the encoded finite incidence consequences; "
    "not Euclidean realizability and not Lean closure"
)


def exactly_one(instance: CoverInstance, variables: list[int]) -> None:
    instance.cnf.add_clause(variables)
    instance.cnf.at_most_sinz(variables, 1)


def choices(instance: CoverInstance, center: int, predicate) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, candidate in enumerate(instance.candidates[center])
        if predicate(set(candidate))
    ]


def require_some(instance: CoverInstance, variables: list[int], label: str) -> None:
    if not variables:
        raise RuntimeError(f"empty allowed-choice set: {label}")
    instance.cnf.add_clause(variables)


def build_case(d: int, v: int):
    model = build_model(CARDINALITY, FROZEN_PROFILE)
    if tuple(model.interiors[THEOREM_OPP2_FROZEN_INDEX]) != (6, 7, 8, 9):
        raise RuntimeError("unexpected frozen O2-interior labeling")
    if tuple(model.interiors[THEOREM_OPP1_FROZEN_INDEX]) != (
        INTERIOR_Q,
        INTERIOR_W,
    ):
        raise RuntimeError("unexpected frozen O1-interior labeling")
    instance = CoverInstance(model)
    physical = frozenset((U, XU, d, v, XV))
    if len(physical) != 5 or C in physical or PHYSICAL_APEX in physical:
        raise RuntimeError("invalid named-point placement")

    # The known exact five-point radius class at the physical apex supplies
    # a legal selected four-subclass for the global K4 cube.
    require_some(
        instance,
        choices(instance, PHYSICAL_APEX, lambda row: row <= physical),
        "physical-apex selected subclass",
    )

    # Every other selected row is a circle with a distinct center, so its
    # intersection with the full physical circle has size at most two.
    for center in range(CARDINALITY):
        if center == PHYSICAL_APEX:
            continue
        for index, candidate in enumerate(instance.candidates[center]):
            if len(set(candidate) & physical) > 2:
                instance.cnf.add_clause((-instance.choice_variables[(center, index)],))

    # The physical apex already witnesses every pair in the class.  Strict
    # convexity therefore allows at most one other selected center per pair.
    for pair in combinations(sorted(physical), 2):
        incident = []
        pair_set = set(pair)
        for center in range(CARDINALITY):
            if center == PHYSICAL_APEX:
                continue
            incident.extend(choices(instance, center, lambda row, p=pair_set: p <= row))
        instance.cnf.at_most_sinz(incident, 1)

    blocker_variables: dict[tuple[int, int], int] = {}
    for source in range(CARDINALITY):
        allowed_centers = [
            center
            for center in range(CARDINALITY)
            if center not in (source, PHYSICAL_APEX)
        ]
        row = []
        for center in allowed_centers:
            variable = instance.cnf.new_variable()
            blocker_variables[(source, center)] = variable
            row.append(variable)
            containing = choices(instance, center, lambda support, q=source: q in support)
            if not containing:
                instance.cnf.add_clause((-variable,))
            else:
                instance.cnf.add_clause((-variable, *containing))
        exactly_one(instance, row)

    trace_edges = {
        U: frozenset((U, XU)),
        XU: frozenset((XU, d)),
        d: frozenset((d, v)),
        v: frozenset((v, XV)),
        XV: frozenset((XV, U)),
    }
    physical_sources = tuple(trace_edges)
    for source, edge in trace_edges.items():
        for center in range(CARDINALITY):
            blocker = blocker_variables.get((source, center))
            if blocker is None:
                continue
            for index, candidate in enumerate(instance.candidates[center]):
                if set(candidate) & physical != set(edge):
                    instance.cnf.add_clause(
                        (-blocker, -instance.choice_variables[(center, index)])
                    )

    # Exact producer identities centerAt(u)=xv and centerAt(xv)=c.
    instance.cnf.add_clause((blocker_variables[(U, XV)],))
    instance.cnf.add_clause((blocker_variables[(XV, C)],))

    # The five distinct traces force five distinct actual blocker centers.
    for center in range(CARDINALITY):
        at_center = [
            blocker_variables[(source, center)]
            for source in physical_sources
            if (source, center) in blocker_variables
        ]
        instance.cnf.at_most_sinz(at_center, 1)

    metadata = {
        "physical_class": sorted(physical),
        "trace_edges": {str(q): sorted(edge) for q, edge in trace_edges.items()},
        "blocker_variables": {
            f"{q}:{p}": variable
            for (q, p), variable in sorted(blocker_variables.items())
        },
    }
    return model, instance, blocker_variables, metadata


def parse_assignment(output: str, n_variables: int) -> tuple[list[int], set[int]]:
    literals: dict[int, int] = {}
    for line in output.splitlines():
        if not line.startswith("v "):
            continue
        for token in line[2:].split():
            literal = int(token)
            if literal == 0:
                continue
            literals[abs(literal)] = literal
    missing = set(range(1, n_variables + 1)) - set(literals)
    if missing:
        raise RuntimeError(f"CaDiCaL witness omits {len(missing)} variables")
    ordered = [literals[index] for index in range(1, n_variables + 1)]
    return ordered, {literal for literal in ordered if literal > 0}


def write_dimacs(instance: CoverInstance, path: Path) -> None:
    lines = [f"p cnf {instance.cnf.n_variables} {len(instance.cnf.clauses)}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in instance.cnf.clauses)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def verify_drat(cnf_path: Path, proof_path: Path, log_path: Path) -> None:
    checked = subprocess.run(
        ["drat-trim", str(cnf_path), str(proof_path)],
        capture_output=True,
        text=True,
        timeout=120,
        check=False,
    )
    output = checked.stdout + checked.stderr
    log_path.write_text(output, encoding="utf-8")
    if checked.returncode != 0 or "s VERIFIED" not in output:
        raise RuntimeError(f"DRAT validation failed for {cnf_path.name}")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    cases_dir = HERE / "cases"
    cases_dir.mkdir(parents=True, exist_ok=True)
    case_results = []
    winner = None

    for d, v in permutations(OUTSIDE_O2_INTERIOR, 2):
        stem = f"d{d}-v{v}"
        model, instance, blocker_variables, metadata = build_case(d, v)
        cnf_path = cases_dir / f"{stem}.cnf"
        proof_path = cases_dir / f"{stem}.drat"
        log_path = cases_dir / f"{stem}.solver.log"
        write_dimacs(instance, cnf_path)
        solved = subprocess.run(
            ["cadical", "-q", "-t", "60", str(cnf_path)],
            capture_output=True,
            text=True,
            timeout=90,
            check=False,
        )
        output = solved.stdout + solved.stderr
        log_path.write_text(output, encoding="utf-8")
        case = {
            "d": d,
            "v": v,
            "variables": instance.cnf.n_variables,
            "clauses": len(instance.cnf.clauses),
            "returncode": solved.returncode,
        }
        if solved.returncode == 10:
            assignment, positive = parse_assignment(output, instance.cnf.n_variables)
            cube = instance.decode_model(positive)
            blocker_map = {}
            for source in range(CARDINALITY):
                selected = [
                    center
                    for center in range(CARDINALITY)
                    if (source, center) in blocker_variables
                    and blocker_variables[(source, center)] in positive
                ]
                if len(selected) != 1:
                    raise RuntimeError(f"source {source} has {len(selected)} blockers")
                blocker_map[source] = selected[0]
            assignment_path = HERE / "assignment.txt"
            assignment_path.write_text(
                " ".join(map(str, assignment)) + " 0\n", encoding="utf-8"
            )
            shutil.copyfile(cnf_path, HERE / "instance.cnf")
            shutil.copyfile(log_path, HERE / "solver.log")
            result = {
                "schema": SCHEMA,
                "status": "SAT",
                "scope": SCOPE,
                "cardinality": CARDINALITY,
                "theorem_profile": list(THEOREM_PROFILE),
                "frozen_profile": list(FROZEN_PROFILE),
                "theorem_to_frozen_cap_indices": [0, 2, 1],
                "caps": [sorted(cap) for cap in model.caps],
                "interiors": [list(interior) for interior in model.interiors],
                "roles": {"physical_apex": PHYSICAL_APEX, "u": U, "c": C, "xv": XV, "xu": XU, "d": d, "v": v},
                **metadata,
                "cube": {str(center): support for center, support in cube.items()},
                "blocker_map": {str(q): p for q, p in blocker_map.items()},
                "variables": instance.cnf.n_variables,
                "clauses": len(instance.cnf.clauses),
                "assignment_sha256": sha256(assignment_path),
                "cnf_sha256": sha256(HERE / "instance.cnf"),
            }
            (HERE / "model.json").write_text(
                json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
            )
            case["status"] = "SAT"
            case_results.append(case)
            winner = result
            break
        if solved.returncode == 20:
            proof_run = subprocess.run(
                ["cadical", "-q", "-t", "60", str(cnf_path), str(proof_path)],
                capture_output=True,
                text=True,
                timeout=90,
                check=False,
            )
            (cases_dir / f"{stem}.proof-solver.log").write_text(
                proof_run.stdout + proof_run.stderr, encoding="utf-8"
            )
            if proof_run.returncode != 20:
                raise RuntimeError(f"proof rerun disagreed for {stem}")
            drat_log = cases_dir / f"{stem}.drat-trim.log"
            verify_drat(cnf_path, proof_path, drat_log)
            case.update({"status": "UNSAT", "proof_verified": True})
            case_results.append(case)
            continue
        raise RuntimeError(f"CaDiCaL returned {solved.returncode} for {stem}")

    summary = {
        "schema": "p97_pentagon_offclass_exact12_v2.run.v1",
        "status": "SAT" if winner is not None else "UNSAT",
        "scope": SCOPE,
        "placements_tested": len(case_results),
        "placements_total": 42,
        "cases": case_results,
    }
    (HERE / "summary.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(
        f"{summary['status']} placements_tested={len(case_results)} "
        f"variables={case_results[-1]['variables']} clauses={case_results[-1]['clauses']}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
