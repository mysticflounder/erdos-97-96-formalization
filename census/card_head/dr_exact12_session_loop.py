"""D-R exact-12 structural stage: lazy-core loop and survivor enumeration on a piqd session.

Drives one ``piqc session`` (CaDiCaL kept alive) over the eager CNF of
``dr_exact12_structural``.  Each SAT model is decoded, replayed against the
eager clauses, and checked against the lazy (seven- and eight-label) cores
with ``core_violations``; violated instances are appended as clauses and the
session is solved again.  A model that violates no core is a *structural
survivor*: its cell signature (named classes, blockers with their supports,
source, deleted point, second row) is recorded and blocked, and the loop
continues until the session is UNSAT or a cap is reached.

Claim boundary.  A session UNSAT is an incremental verdict without a proof;
the loop hands the final formula off as a raw-DIMACS job so a from-scratch
solve produces the checked proof.  Survivors are equality patterns at card
12 under the cut admission record of the encoder, not configurations.
Nothing here closes a Lean theorem or is promotion eligible.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
import time
from collections.abc import Sequence
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any

import numpy as np

from census.card_head import dr_exact12_structural as dr

SCHEMA = "p97-dr-exact12-session-loop/v1"
SESSION_SOLVER = "piqd-satworker-cadical-3.0.1"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]


class SessionLoopError(RuntimeError):
    pass


def _piqc(*arguments: str, timeout: float = 3600.0) -> dict[str, Any]:
    command = ["piqc", *arguments]
    completed = subprocess.run(command, capture_output=True, text=True, timeout=timeout, check=False)
    text = completed.stdout.strip() or completed.stderr.strip()
    try:
        payload = json.loads(text)
    except json.JSONDecodeError as exc:
        raise SessionLoopError(f"piqc {' '.join(arguments[:2])}: non-JSON reply: {text[:300]}") from exc
    if completed.returncode != 0 or "error" in payload:
        raise SessionLoopError(f"piqc {' '.join(arguments[:2])} failed: {payload}")
    return payload


def _sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _store_blob(cnf_path: Path, manifest_path: Path) -> str:
    """Store the CNF as a raw-DIMACS job blob (prepared, not confirmed); returns its sha256."""

    command = [
        "piqc", "job", "submit-cnf", str(cnf_path), "--backend", "cadical", "--project", "erdos-97-96-formalization",
        "--solver-profile", "default", "--timeout", "600", "--manifest", str(manifest_path),
    ]
    completed = subprocess.run(command, capture_output=True, text=True, timeout=3600.0, check=False)
    lines = completed.stdout.splitlines()
    try:
        start = next(i for i, line in enumerate(lines) if line.startswith("{"))
        stop = next(i for i in range(start, len(lines)) if lines[i] == "}")
        payload = json.loads("\n".join(lines[start:stop + 1]))
    except (StopIteration, json.JSONDecodeError) as exc:
        raise SessionLoopError(f"submit-cnf reply not understood: {completed.stdout[:300]} {completed.stderr[:300]}") from exc
    blob = payload.get("cnf_blob_hash")
    if blob != _sha256(cnf_path.read_bytes()):
        raise SessionLoopError(f"stored blob hash {blob} is not the CNF file hash")
    return blob


def _clauses_dimacs(clauses: Sequence[Sequence[int]], n_variables: int) -> bytes:
    lines = [f"p cnf {n_variables} {len(clauses)}"]
    lines.extend(" ".join(str(literal) for literal in clause) + " 0" for clause in clauses)
    return ("\n".join(lines) + "\n").encode("ascii")


@dataclass(frozen=True)
class Signature:
    """The cell data a structural survivor pins: named classes and blocker shells."""

    x: tuple[int, ...]
    y: tuple[int, ...]
    u: tuple[int, ...]
    source: int
    deleted: int
    b2: str
    shells: tuple[tuple[int, int, tuple[int, ...]], ...]  # (z, chi(z), class of z at chi(z))

    def payload(self) -> dict[str, Any]:
        return {
            "x": list(self.x), "y": list(self.y), "u": list(self.u), "source": self.source,
            "deleted": self.deleted, "b2": self.b2,
            "shells": [{"point": z, "blocker": c, "class": list(k)} for z, c, k in self.shells],
        }


def signature_of(pattern: dr.Pattern) -> Signature:
    shells = []
    for z in dr.LABELS:
        c = pattern.chi[z]
        klass = next(k for k in pattern.classes[c] if z in k)
        shells.append((z, c, tuple(klass)))
    return Signature(pattern.x, pattern.y, pattern.u, pattern.source, pattern.deleted, pattern.b2, tuple(shells))


def blocking_clause(layout: dr.Layout, signature: Signature) -> tuple[int, ...]:
    """Negation of the conjunction of the selector literals that pin the signature."""

    def same(center: int, a: int, b: int) -> int:
        first, second = sorted((dr._EDGE_INDEX[(min(center, a), max(center, a))], dr._EDGE_INDEX[(min(center, b), max(center, b))]))
        return layout.relation_variables[(first, second)]

    positive = [layout.x[z] for z in signature.x] + [layout.y[z] for z in signature.y] + [layout.u[z] for z in signature.u]
    positive.append(layout.src[signature.source])
    positive.append(layout.deleted[signature.deleted])
    positive.append(layout.b2x if signature.b2 == "X" else layout.b2y)
    for z, c, klass in signature.shells:
        positive.append(layout.chi[(z, c)])
        positive.extend(same(c, z, s) for s in klass if s != z)
    return tuple(sorted({-literal for literal in positive}, key=abs))


def replay_eager(cnf: dr.CNF, assignment: Sequence[int]) -> int:
    truth = {abs(literal): literal > 0 for literal in assignment}
    return sum(1 for clause in cnf.clauses if not any(truth.get(abs(l), False) == (l > 0) for l in clause))


def lazy_clauses(layout: dr.Layout, assignment: Sequence[int]) -> tuple[dict[str, int], list[tuple[int, ...]]]:
    matrix = dr.relation_matrix(layout, assignment)

    def equal(first: int, second: int) -> int:
        return layout.relation_variables[(min(first, second), max(first, second))]

    counts: dict[str, int] = {}
    clauses: list[tuple[int, ...]] = []
    seen: set[frozenset[int]] = set()
    for name in dr.LAZY_CORES:
        rows = dr.core_violations(name, matrix)
        counts[name] = int(len(rows))
        for row in rows:
            clause = dr.core_clause(name, tuple(int(v) for v in row), equal)
            key = frozenset(clause)
            if key not in seen:
                seen.add(key)
                clauses.append(clause)
    return counts, clauses


def run(
    *,
    run_root: Path,
    cnf_path: Path,
    control: str,
    max_iterations: int,
    max_survivors: int,
    solve_timeout_ms: int,
    label: str,
) -> dict[str, Any]:
    artifacts = run_root / "artifacts"
    artifacts.mkdir(parents=True, exist_ok=True)
    cnf_bytes = cnf_path.read_bytes()
    cnf, layout = dr.build(control)
    if _sha256(cnf.dimacs()) != _sha256(cnf_bytes):
        raise SessionLoopError("the CNF file does not match the encoder build for this control")
    log_path = artifacts / "loop-log.jsonl"
    log = log_path.open("a")

    def record(event: dict[str, Any]) -> None:
        event["utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        log.write(json.dumps(event, sort_keys=True) + "\n")
        log.flush()

    blob = _store_blob(cnf_path, cnf_path.with_name("cnf-manifest-" + control + ".json"))
    session = _piqc("session", "new", "--solver", SESSION_SOLVER, "--lane", "sat", "--label", label, "--seed-blob", blob, timeout=3600.0)
    session_id = session["id"]
    (artifacts / "session.json").write_text(json.dumps(session, indent=1, sort_keys=True) + "\n")
    if session.get("clauses") != len(cnf.clauses):
        raise SessionLoopError(f"seeded session holds {session.get('clauses')} clauses, encoder has {len(cnf.clauses)}")
    record({"event": "seed", "session": session_id, "cnf_sha256": _sha256(cnf_bytes), "seed_blob": blob, "clauses": session.get("clauses")})

    survivors: list[dict[str, Any]] = []
    status = "CAP"
    iteration = 0
    while iteration < max_iterations:
        iteration += 1
        solve = _piqc("session", "solve", session_id, "--timeout-ms", str(solve_timeout_ms), timeout=solve_timeout_ms / 1000 + 120)
        status = solve["status"]
        event: dict[str, Any] = {"event": "solve", "iteration": iteration, "status": status, "solve_ms": solve.get("solve_ms"), "solve_index": solve.get("solve_index"), "result_sha256": solve.get("result_sha256")}
        if status != "SAT":
            event["terminal_unsat"] = solve.get("terminal_unsat")
            record(event)
            break
        assignment = [int(v) for v in solve["model"]]
        counts, clauses = lazy_clauses(layout, assignment)
        event["lazy_violations"] = counts
        event["lazy_clauses_added"] = len(clauses)
        if clauses:
            clause_path = artifacts / f"lazy-{iteration:04d}.cnf"
            clause_path.write_bytes(_clauses_dimacs(clauses, cnf.n_variables))
            _piqc("session", "add", session_id, "--file", str(clause_path))
            record(event)
            continue
        violated = replay_eager(cnf, assignment)
        pattern = dr.decode(layout, assignment)
        problems = dr.check_pattern(pattern)
        signature = signature_of(pattern)
        survivor = {
            "index": len(survivors), "iteration": iteration, "eager_clauses_violated": violated,
            "checker_problems": problems, "signature": signature.payload(), "pattern": pattern.payload(),
            "true_relation_variables": int(sum(1 for v in layout.relation_variables.values() if assignment[v - 1] > 0)),
            "class_sizes": {str(c): sorted((len(k) for k in pattern.classes[c]), reverse=True)[:4] for c in dr.LABELS},
            "result_sha256": solve.get("result_sha256"),
        }
        (artifacts / f"survivor-{len(survivors):04d}.json").write_text(json.dumps(survivor, indent=1, sort_keys=True) + "\n")
        survivors.append(survivor)
        event["survivor"] = survivor["index"]
        event["eager_clauses_violated"] = violated
        record(event)
        if violated:
            status = "REPLAY_FAILURE"
            break
        if len(survivors) >= max_survivors:
            status = "SURVIVOR_CAP"
            break
        block = blocking_clause(layout, signature)
        block_path = artifacts / f"block-{len(survivors) - 1:04d}.cnf"
        block_path.write_bytes(_clauses_dimacs([block], cnf.n_variables))
        _piqc("session", "add", session_id, "--file", str(block_path))
    receipts = _piqc("session", "receipts", session_id)
    (artifacts / "receipts.json").write_text(json.dumps(receipts, indent=1, sort_keys=True) + "\n")
    handoff = None
    if status == "UNSAT":
        try:
            handoff = _piqc("session", "handoff", session_id, timeout=3600.0)
        except SessionLoopError as exc:  # a missing proof is reported, not hidden
            handoff = {"error": str(exc)}
    final_status = _piqc("session", "status", session_id)
    _piqc("session", "close", session_id)
    summary = {
        "schema": SCHEMA, "lane_id": dr.LANE_ID, "target_theorem": dr.TARGET_THEOREM, "promotion_eligible": False,
        "control": control, "cnf_sha256": _sha256(cnf_bytes), "session": session_id, "solver": SESSION_SOLVER,
        "iterations": iteration, "final_status": status, "survivors": len(survivors),
        "session_clauses": final_status.get("clauses"), "handoff": handoff,
        "lazy_cores": list(dr.LAZY_CORES), "eager_cores": list(dr.EAGER_CORES),
    }
    (artifacts / "loop-summary.json").write_text(json.dumps(summary, indent=1, sort_keys=True) + "\n")
    log.close()
    return summary


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--cnf", type=Path, required=True, help="eager CNF written by dr_exact12_structural")
    parser.add_argument("--control", choices=dr.CONTROLS, default="none")
    parser.add_argument("--max-iterations", type=int, default=200)
    parser.add_argument("--max-survivors", type=int, default=20)
    parser.add_argument("--solve-timeout-ms", type=int, default=600_000)
    parser.add_argument("--label", default=f"{dr.LANE_ID} structural loop")
    arguments = parser.parse_args(argv)
    summary = run(
        run_root=arguments.run_root, cnf_path=arguments.cnf, control=arguments.control,
        max_iterations=arguments.max_iterations, max_survivors=arguments.max_survivors,
        solve_timeout_ms=arguments.solve_timeout_ms, label=arguments.label,
    )
    sys.stdout.write(json.dumps(summary, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
