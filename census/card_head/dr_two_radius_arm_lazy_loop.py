"""D-R two-radius card-13 arms: lazy-core loop over the full Census554 generic core set on a piqd session.

Drives one ``piqc session`` (CaDiCaL kept alive) over the two-family generic
CNF of ``dr_two_radius_arm_structural`` for one card-13 growth arm.  Each SAT
model is decoded to its edge-equality relation and checked against EVERY entry
of ``GENERIC_CORES`` (eager and lazy alike) with ``core_violations``; the
all-negative clause of every violated instance is appended through the
module's own ``core_clause`` path and the session is solved again.  A model
that violates no core is a *structural survivor* of the full generic core set:
its signature (rows, first-apex class, blocker map, equality classes of size
at least three at every center) is recorded and blocked, and the loop
continues until the session is UNSAT or a cap is reached.

Claim boundary.  A session UNSAT is an incremental verdict without a proof;
the loop hands the final formula off as a raw-DIMACS job so a from-scratch
solve can produce the checked proof.  Survivors are equality patterns at card
13 under the cut admission record of the encoder, not configurations.
Nothing here closes a Lean theorem or is promotion eligible.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import numpy as np

from census.card_head import dr_two_radius_arm_structural as arm
from census.card_head.dr_exact12_session_loop import (
    SESSION_SOLVER,
    SessionLoopError,
    _clauses_dimacs,
    _piqc,
    _store_blob,
)

SCHEMA = "p97-dr-two-radius-arm-lazy-loop/v1"
FAMILIES = ("two_circle_same_arc", "five_point_circle_isosceles_order")
OUTCOMES = ("LAZY_UNSAT", "ITERATION_CAP", "SURVIVOR_CAP", "UNDECIDED", "ERROR")


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _normalize(clause: Sequence[int]) -> tuple[int, ...]:
    """The literal order ``CNF.add`` uses, so a lazy clause is byte-identical to its eager twin."""

    return tuple(sorted(set(clause), key=abs))


# --------------------------------------------------------------------------
# Label names and survivor signatures
# --------------------------------------------------------------------------


def label_name(profile: arm.Profile, z: int) -> str:
    """Label name with its cap tag: ``A2``/``A1``/``A3``, ``Is:z``, ``I1:z[:q|:w]``, ``I2:z``."""

    if z == arm.A2:
        return "A2"
    if z == arm.A1:
        return "A1"
    if z == arm.A3:
        return "A3"
    if z in profile.is_labels:
        return f"Is:{z}"
    if z in profile.i1_labels:
        tag = ":q" if z == profile.interior_q else (":w" if z == profile.interior_w else "")
        return f"I1:{z}{tag}"
    if z in profile.i2_labels:
        return f"I2:{z}"
    raise SessionLoopError(f"label {z} is not in the profile")


@dataclass(frozen=True)
class Signature:
    """The cell data a survivor pins: rows, first-apex class, blocker map, and the large classes."""

    x: tuple[int, ...]
    y: tuple[int, ...]
    u: tuple[int, ...]
    chi: tuple[tuple[int, int], ...]  # (z, chi(z)) for every label z
    classes: tuple[tuple[int, tuple[tuple[int, ...], ...]], ...]  # (center, classes of size >= 3)

    def payload(self, profile: arm.Profile) -> dict[str, Any]:
        def name(z: int) -> str:
            return label_name(profile, z)

        return {
            "x": [name(z) for z in self.x],
            "y": [name(z) for z in self.y],
            "u": [name(z) for z in self.u],
            "chi": {name(z): name(c) for z, c in self.chi},
            "classes": {name(c): [[name(z) for z in k] for k in ks] for c, ks in self.classes},
            "raw": {
                "x": list(self.x), "y": list(self.y), "u": list(self.u),
                "chi": {str(z): c for z, c in self.chi},
                "classes": {str(c): [list(k) for k in ks] for c, ks in self.classes},
            },
        }


def _truth(assignment: Sequence[int]) -> dict[int, bool]:
    return {abs(literal): literal > 0 for literal in assignment}


def equality_classes(layout: arm.Layout, matrix: np.ndarray, center: int, minimum: int = 3) -> tuple[tuple[int, ...], ...]:
    """Partition of the other labels by equal distance to ``center``; parts of size below ``minimum`` are dropped."""

    edge_index = arm._tables(layout.profile).edge_index

    def edge(a: int, b: int) -> int:
        return edge_index[(min(a, b), max(a, b))]

    remaining = list(layout.profile.others(center))
    parts: list[tuple[int, ...]] = []
    while remaining:
        head = remaining[0]
        part = tuple(z for z in remaining if z == head or bool(matrix[edge(center, head), edge(center, z)]))
        parts.append(part)
        remaining = [z for z in remaining if z not in part]
    return tuple(part for part in parts if len(part) >= minimum)


def signature_of(layout: arm.Layout, assignment: Sequence[int], matrix: np.ndarray | None = None) -> Signature:
    truth = _truth(assignment)
    if matrix is None:
        matrix = arm.relation_matrix(layout, assignment)
    profile = layout.profile
    chi = {}
    for (z, c), variable in layout.chi.items():
        if truth.get(variable, False):
            if z in chi:
                raise SessionLoopError(f"two blockers selected for label {z}")
            chi[z] = c
    if len(chi) != profile.card:
        raise SessionLoopError("decoded blocker map is not total")
    classes = tuple((c, equality_classes(layout, matrix, c)) for c in profile.labels)
    return Signature(
        x=tuple(z for z, v in sorted(layout.x.items()) if truth.get(v, False)),
        y=tuple(z for z, v in sorted(layout.y.items()) if truth.get(v, False)),
        u=tuple(z for z, v in sorted(layout.u.items()) if truth.get(v, False)),
        chi=tuple(sorted(chi.items())),
        classes=classes,
    )


def blocking_clause(layout: arm.Layout, signature: Signature) -> tuple[int, ...]:
    """Negation of the conjunction of the x/y/u/chi selector literals that pin the signature."""

    positive = [layout.x[z] for z in signature.x] + [layout.y[z] for z in signature.y] + [layout.u[z] for z in signature.u]
    positive.extend(layout.chi[(z, c)] for z, c in signature.chi)
    return _normalize(-literal for literal in positive)


# --------------------------------------------------------------------------
# Lazy clauses over every generic core
# --------------------------------------------------------------------------


def violated_clauses(layout: arm.Layout, matrix: np.ndarray, seen: set[frozenset[int]] | None = None) -> tuple[dict[str, int], dict[str, list[tuple[int, ...]]]]:
    """Violated instance counts and the new clauses per core name, over every entry of ``GENERIC_CORES``.

    Clauses are built with the encoder's ``core_clause`` and normalized as
    ``CNF.add`` does, so an eager core's lazy clause is the eager clause.
    ``seen`` (mutated) drops clauses whose literal set was already produced.
    """

    profile = layout.profile
    relation = layout.relation_variables

    def equal(first: int, second: int) -> int:
        return relation[(min(first, second), max(first, second))]

    if seen is None:
        seen = set()
    counts: dict[str, int] = {}
    clauses: dict[str, list[tuple[int, ...]]] = {}
    for name in arm.GENERIC_CORES:
        rows = arm.core_violations(profile, name, matrix)
        counts[name] = len(rows)
        fresh: list[tuple[int, ...]] = []
        for row in rows:
            clause = _normalize(arm.core_clause(profile, name, tuple(int(v) for v in row), equal))
            key = frozenset(clause)
            if key in seen:
                continue
            seen.add(key)
            fresh.append(clause)
        if fresh:
            clauses[name] = fresh
    return counts, clauses


# --------------------------------------------------------------------------
# The loop
# --------------------------------------------------------------------------


def _write_json(path: Path, payload: Mapping[str, Any]) -> None:
    path.write_text(json.dumps(payload, indent=1, sort_keys=True) + "\n")


def run(
    *,
    card: int,
    arm_name: str,
    run_root: Path,
    max_iterations: int,
    max_survivors: int,
    solve_timeout_ms: int,
    label: str,
) -> dict[str, Any]:
    profile = arm.profile_for(card, arm_name)
    artifacts = run_root / "artifacts"
    tmp = run_root / "tmp" / f"lazy-{arm_name}"
    artifacts.mkdir(parents=True, exist_ok=True)
    tmp.mkdir(parents=True, exist_ok=True)
    cnf, layout = arm.build(profile, mode="generic", families=FAMILIES, ingress=False)
    cnf_bytes = cnf.dimacs()
    cnf_sha256 = _sha256(cnf_bytes)
    base_path = artifacts / f"lazy-{arm_name}-base.cnf"
    manifest_path = artifacts / f"lazy-{arm_name}-base.json"
    base_path.write_bytes(cnf_bytes)
    payload = arm.manifest(cnf, profile, mode="generic", families=FAMILIES, ingress=False)
    _write_json(manifest_path, payload)
    if payload["cnf_sha256"] != cnf_sha256:
        raise SessionLoopError("manifest digest disagrees with the written CNF")
    log_path = artifacts / f"lazy-{arm_name}-log.jsonl"
    added_path = artifacts / f"lazy-{arm_name}-added.cnf"
    survivors_path = artifacts / f"lazy-{arm_name}-survivors.jsonl"
    summary_path = artifacts / f"lazy-{arm_name}-summary.json"

    summary: dict[str, Any] = {
        "schema": SCHEMA, "lane_id": arm.LANE_ID, "target_theorem": arm.TARGET_THEOREMS[card], "promotion_eligible": False,
        "card": card, "arm": arm_name, "label": label, "families": list(FAMILIES), "cores": list(arm.GENERIC_CORES),
        "base_cnf": str(base_path), "base_cnf_sha256": cnf_sha256, "base_clauses": len(cnf.clauses), "base_variables": cnf.n_variables,
        "solver": SESSION_SOLVER, "solve_timeout_ms": solve_timeout_ms, "max_iterations": max_iterations, "max_survivors": max_survivors,
        "outcome": None, "iterations": 0, "clauses_added_by_core": {}, "clauses_added_total": 0, "survivors": 0,
        "session": None, "seed_blob": None, "handoff_job_id": None, "handoff": None, "final_reply": None, "error": None,
    }
    added_by_core: dict[str, int] = {}
    survivors = 0
    iteration = 0
    seen: set[frozenset[int]] = set()
    session_id: str | None = None

    def record(event: dict[str, Any]) -> None:
        event["utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        with log_path.open("a") as log:
            log.write(json.dumps(event, sort_keys=True) + "\n")

    def add_clauses(name_tag: str, clauses: Sequence[tuple[int, ...]]) -> None:
        clause_path = tmp / f"{name_tag}.cnf"
        clause_path.write_bytes(_clauses_dimacs(clauses, cnf.n_variables))
        with added_path.open("a") as added:
            added.write(f"c {name_tag}\n")
            added.write("".join(" ".join(str(literal) for literal in clause) + " 0\n" for clause in clauses))
        _piqc("session", "add", session_id, "--file", str(clause_path))

    try:
        blob = _store_blob(base_path, manifest_path)
        summary["seed_blob"] = blob
        session = _piqc("session", "new", "--solver", SESSION_SOLVER, "--lane", "sat", "--label", label, "--seed-blob", blob, timeout=3600.0)
        session_id = session["id"]
        summary["session"] = session_id
        _write_json(artifacts / f"lazy-{arm_name}-session.json", session)
        if session.get("clauses") != len(cnf.clauses):
            raise SessionLoopError(f"seeded session holds {session.get('clauses')} clauses, encoder has {len(cnf.clauses)}")
        while iteration < max_iterations:
            iteration += 1
            summary["iterations"] = iteration
            solve = _piqc("session", "solve", session_id, "--timeout-ms", str(solve_timeout_ms), timeout=solve_timeout_ms / 1000 + 120)
            status = solve.get("status")
            event: dict[str, Any] = {
                "iteration": iteration, "result": status, "solve_ms": solve.get("solve_ms"), "solve_index": solve.get("solve_index"),
                "result_sha256": solve.get("result_sha256"), "clauses_added": {}, "violations": {}, "cumulative_added": summary["clauses_added_total"],
                "survivors": survivors,
            }
            if status == "UNSAT":
                event["terminal_unsat"] = solve.get("terminal_unsat")
                record(event)
                summary["outcome"] = "LAZY_UNSAT"
                try:
                    handoff = _piqc("session", "handoff", session_id, timeout=3600.0)
                    summary["handoff"] = handoff
                    summary["handoff_job_id"] = handoff.get("job_id")
                except SessionLoopError as exc:  # reported in the summary, not hidden
                    summary["handoff"] = {"error": str(exc)}
                    summary["error"] = f"handoff: {exc}"
                break
            if status != "SAT":
                event["reply"] = {k: v for k, v in solve.items() if k != "model"}
                record(event)
                summary["outcome"] = "UNDECIDED"
                summary["final_reply"] = event["reply"]
                break
            if "model" not in solve:
                raise SessionLoopError("SAT reply carries no model")
            assignment = [int(v) for v in solve["model"]]
            matrix = arm.relation_matrix(layout, assignment)
            check_start = time.time()
            counts, clauses = violated_clauses(layout, matrix, seen)
            event["check_ms"] = int((time.time() - check_start) * 1000)
            event["violations"] = counts
            event["clauses_added"] = {name: len(cs) for name, cs in clauses.items()}
            if clauses:
                flat = [clause for name in clauses for clause in clauses[name]]
                for name, cs in clauses.items():
                    added_by_core[name] = added_by_core.get(name, 0) + len(cs)
                summary["clauses_added_total"] += len(flat)
                summary["clauses_added_by_core"] = dict(sorted(added_by_core.items()))
                event["cumulative_added"] = summary["clauses_added_total"]
                add_clauses(f"lazy-{iteration:04d}", flat)
                record(event)
                continue
            signature = signature_of(layout, assignment, matrix)
            survivor = {"index": survivors, "iteration": iteration, "result_sha256": solve.get("result_sha256"), "signature": signature.payload(profile)}
            with survivors_path.open("a") as out:
                out.write(json.dumps(survivor, sort_keys=True) + "\n")
            survivors += 1
            summary["survivors"] = survivors
            event["survivor"] = survivor["index"]
            event["survivors"] = survivors
            record(event)
            if survivors >= max_survivors:
                summary["outcome"] = "SURVIVOR_CAP"
                break
            add_clauses(f"block-{survivors - 1:04d}", [blocking_clause(layout, signature)])
        if summary["outcome"] is None:
            summary["outcome"] = "ITERATION_CAP"
    except BaseException as exc:
        summary["outcome"] = "ERROR"
        summary["error"] = f"{type(exc).__name__}: {exc}"
        record({"iteration": iteration, "result": "ERROR", "error": summary["error"], "cumulative_added": summary["clauses_added_total"], "survivors": survivors})
        raise
    finally:
        if session_id is not None:
            try:
                receipts = _piqc("session", "receipts", session_id)
                _write_json(artifacts / f"lazy-{arm_name}-receipts.json", receipts)
                summary["session_status"] = _piqc("session", "status", session_id)
            except SessionLoopError as exc:
                summary["close_error"] = str(exc)
            try:
                _piqc("session", "close", session_id)
                summary["session_closed"] = True
            except SessionLoopError as exc:
                summary["session_closed"] = False
                summary["close_error"] = str(exc)
        summary["utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        _write_json(summary_path, summary)
    return summary


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--card", type=int, choices=sorted(arm.ARM_SIZES), required=True)
    parser.add_argument("--arm", required=True, help="profile name: " + ", ".join(a for arms in arm.ARM_SIZES.values() for a in arms))
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--max-iterations", type=int, default=300)
    parser.add_argument("--max-survivors", type=int, default=20)
    parser.add_argument("--solve-timeout-ms", type=int, default=600_000)
    parser.add_argument("--label", default=f"{arm.LANE_ID} lazy loop")
    arguments = parser.parse_args(argv)
    summary = run(
        card=arguments.card, arm_name=arguments.arm, run_root=arguments.run_root,
        max_iterations=arguments.max_iterations, max_survivors=arguments.max_survivors,
        solve_timeout_ms=arguments.solve_timeout_ms, label=arguments.label,
    )
    sys.stdout.write(json.dumps({k: v for k, v in summary.items() if k not in ("handoff", "session_status")}, sort_keys=True) + "\n")
    return 0 if summary.get("error") is None else 1


if __name__ == "__main__":
    sys.exit(main())
