"""D-R exact-12 structural stage: family-level minimal UNSAT core on a piqd session.

Relaxes the eager CNF of ``dr_exact12_structural``: every clause of a
*selectable* family (the geometry nogoods and the eager Census554 cores) is
guarded by one fresh selector variable per family, while the structural
families (transitivity and the D-R hypothesis blocks) stay hard.  One piqd
session then solves the relaxed formula under assumptions: first with every
selector assumed true (which must reproduce the wave-3 UNSAT), then in a
deletion shrink over the families of the returned assumption core.  The
output is one irreducible family set: dropping any one of its families makes
the structural formula SAT.  It is a minimal core over families, not a
smallest one, and it says which Lean source theorems a Phase 3 ingress must
cover; nothing here closes a Lean theorem or is promotion eligible.

A solve that returns neither SAT nor UNSAT (time-out, unknown) keeps the
family under test (fail-closed) and is recorded as such.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import sys
import time
from collections.abc import Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.card_head import dr_exact12_session_loop as loop
from census.card_head import dr_exact12_structural as dr

SCHEMA = "p97-dr-exact12-family-core/v1"

# Families that carry a geometric source theorem and may be switched off.
# Everything else in the CNF (transitivity, the D-R hypothesis blocks, the
# ingress relaxation, controls) is hard.
def selectable_families(cnf: dr.CNF) -> tuple[str, ...]:
    names = set(cnf.counts)
    return tuple(f for f in dr.SELECTABLE_FAMILIES if f in names)


@dataclass(frozen=True)
class Relaxed:
    n_variables: int
    clauses: tuple[tuple[int, ...], ...]
    selectors: dict[str, int]  # family -> selector variable (true = family active)
    hard_families: tuple[str, ...]

    def dimacs(self) -> bytes:
        return loop._clauses_dimacs(self.clauses, self.n_variables)


def relax(cnf: dr.CNF, families: Sequence[str], *, by_group: bool = False, coarse: bool = False) -> Relaxed:
    """Guard every clause of each listed family by ``-selector``; other clauses unchanged.

    With ``by_group`` the selector is per ``family:group`` (one per unordered
    label set of the geometry clause) instead of per family; with ``coarse``
    it is per ``family:coarse`` (one per distinguished label set, see
    ``dr_exact12_structural._group``).
    """

    dr._fail(not (by_group and coarse), "by_group and coarse are exclusive")

    dr._fail(len(set(families)) == len(families) and set(families) <= set(cnf.counts), "unknown or repeated family")
    dr._fail(len(cnf.families) == len(cnf.clauses), "CNF without per-clause families")
    selectors: dict[str, int] = {}
    n_variables = cnf.n_variables
    group_of = cnf.groups if by_group else cnf.coarse if coarse else [None] * len(cnf.families)
    keys = [
        (f"{family}:{group}" if by_group or coarse else family) if family in families else None
        for family, group in zip(cnf.families, group_of, strict=True)
    ]
    if by_group or coarse:
        dr._fail(all(":None" not in key for key in keys if key), "geometry clause without a group")
    for key in keys:
        if key is not None and key not in selectors:
            n_variables += 1
            selectors[key] = n_variables
    clauses = tuple(
        clause + (-selectors[key],) if key is not None else clause
        for clause, key in zip(cnf.clauses, keys, strict=True)
    )
    hard = tuple(sorted(set(cnf.counts) - set(families)))
    return Relaxed(n_variables=n_variables, clauses=clauses, selectors=selectors, hard_families=hard)


def strip(relaxed: Relaxed) -> tuple[tuple[int, ...], ...]:
    """Inverse of ``relax`` on the clause list (drops the selector literals)."""

    guards = {-v for v in relaxed.selectors.values()}
    return tuple(tuple(l for l in clause if l not in guards) for clause in relaxed.clauses)


def _manifest(cnf: dr.CNF, relaxed: Relaxed, control: str) -> dict[str, Any]:
    base = dr.manifest(cnf, control)
    base.update({
        "schema": SCHEMA,
        "base_cnf_sha256": base.pop("cnf_sha256"),
        "relaxed_cnf_sha256": hashlib.sha256(relaxed.dimacs()).hexdigest(),
        "relaxed_n_variables": relaxed.n_variables,
        "selectors": dict(sorted(relaxed.selectors.items())),
        "hard_families": list(relaxed.hard_families),
    })
    return base


def run(
    *,
    run_root: Path,
    control: str,
    solve_timeout_ms: int,
    label: str,
    drop_first: Sequence[str] = (),
    only_families: Sequence[str] | None = None,
    by_group: bool = False,
    coarse: bool = False,
    max_solves: int = 400,
) -> dict[str, Any]:
    artifacts = run_root / "artifacts"
    artifacts.mkdir(parents=True, exist_ok=True)
    cnf, _layout = dr.build(control, families=only_families)
    families = selectable_families(cnf)
    relaxed = relax(cnf, families, by_group=by_group, coarse=coarse)
    families = tuple(relaxed.selectors)  # selector keys: families, or family:group
    cnf_path = artifacts / f"relaxed-{control}.cnf"
    cnf_path.write_bytes(relaxed.dimacs())
    manifest_path = artifacts / f"relaxed-manifest-{control}.json"
    manifest_path.write_text(json.dumps(_manifest(cnf, relaxed, control), indent=1, sort_keys=True) + "\n")
    log = (artifacts / "family-core-log.jsonl").open("a")

    def record(event: dict[str, Any]) -> None:
        event["utc"] = time.strftime("%Y-%m-%dT%H:%M:%SZ", time.gmtime())
        log.write(json.dumps(event, sort_keys=True) + "\n")
        log.flush()

    blob = loop._store_blob(cnf_path, manifest_path)
    session = loop._piqc("session", "new", "--solver", loop.SESSION_SOLVER, "--lane", "sat", "--label", label, "--seed-blob", blob, timeout=3600.0)
    session_id = session["id"]
    (artifacts / "session.json").write_text(json.dumps(session, indent=1, sort_keys=True) + "\n")
    if session.get("clauses") != len(relaxed.clauses):
        raise loop.SessionLoopError(f"seeded session holds {session.get('clauses')} clauses, relaxed CNF has {len(relaxed.clauses)}")
    record({"event": "seed", "session": session_id, "relaxed_sha256": hashlib.sha256(relaxed.dimacs()).hexdigest(), "seed_blob": blob, "families": list(families)})

    by_selector = {v: f for f, v in relaxed.selectors.items()}
    solves: list[dict[str, Any]] = []

    def solve(active: Sequence[str], purpose: str) -> tuple[str, list[str]]:
        arguments = ["session", "solve", session_id, "--timeout-ms", str(solve_timeout_ms), "--no-model"]
        for family in active:
            arguments.extend(("--assume", str(relaxed.selectors[family])))
        reply = loop._piqc(*arguments, timeout=solve_timeout_ms / 1000 + 120)
        status = reply["status"]
        core = sorted({by_selector[abs(int(l))] for l in (reply.get("core") or []) if abs(int(l)) in by_selector})
        event = {
            "event": "solve", "purpose": purpose, "index": len(solves), "status": status, "assumed": list(active),
            "core": core, "solve_ms": reply.get("solve_ms"), "solve_index": reply.get("solve_index"),
            "result_sha256": reply.get("result_sha256"),
        }
        solves.append(event)
        record(dict(event))
        return status, core

    status, core = solve(families, "all-families")
    outcome = "FULL_SAT"
    outcome_cap = False
    minimal: list[str] = []
    if status == "UNSAT":
        # The reply core (assumption subset) is a family core already; shrink it.
        candidate = list(core) if core else list(families)
        if not core:
            record({"event": "note", "text": "no assumption core returned; shrinking from the full family set"})
        order = [f for f in drop_first if f in candidate] + [f for f in candidate if f not in drop_first]
        removed: set[str] = set()
        for family in order:
            if family in removed or family not in candidate:
                continue
            if len(solves) >= max_solves:
                record({"event": "note", "text": f"solve cap {max_solves} reached; shrink stopped"})
                outcome_cap = True
                break
            trial = [f for f in candidate if f != family and f not in removed]
            trial_status, trial_core = solve(trial, f"drop:{family}")
            if trial_status == "UNSAT":
                removed.add(family)
                if trial_core:
                    removed |= set(candidate) - set(trial_core)
            elif trial_status != "SAT":
                record({"event": "note", "text": f"{family}: solve status {trial_status}; kept (fail-closed)"})
        minimal = [f for f in candidate if f not in removed]
        outcome = "MINIMAL_CORE" if all(s["status"] in ("SAT", "UNSAT") for s in solves) else "MINIMAL_CORE_WITH_UNDECIDED"
        if outcome_cap:
            outcome = "CORE_SHRINK_CAPPED"
    elif status != "SAT":
        outcome = "UNDECIDED"

    receipts = loop._piqc("session", "receipts", session_id)
    (artifacts / "receipts.json").write_text(json.dumps(receipts, indent=1, sort_keys=True) + "\n")
    final_status = loop._piqc("session", "status", session_id)
    loop._piqc("session", "close", session_id)
    summary = {
        "schema": SCHEMA, "lane_id": dr.LANE_ID, "target_theorem": dr.TARGET_THEOREM, "promotion_eligible": False,
        "control": control, "base_cnf_sha256": hashlib.sha256(cnf.dimacs()).hexdigest(),
        "relaxed_cnf_sha256": hashlib.sha256(relaxed.dimacs()).hexdigest(), "session": session_id,
        "solver": loop.SESSION_SOLVER, "families": list(families), "hard_families": list(relaxed.hard_families),
        "first_core": core, "minimal_family_core": minimal, "outcome": outcome, "solves": solves,
        "session_clauses": final_status.get("clauses"),
        "by_group": by_group, "coarse": coarse, "only_families": None if only_families is None else list(only_families),
        "lean_sources": {f: dr.GENERIC_CORES[f]["lean"] for f in minimal if f in dr.GENERIC_CORES},
    }
    (artifacts / "family-core-summary.json").write_text(json.dumps(summary, indent=1, sort_keys=True) + "\n")
    log.close()
    return summary


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--control", choices=dr.CONTROLS, default="none")
    parser.add_argument("--solve-timeout-ms", type=int, default=900_000)
    parser.add_argument("--label", default=f"{dr.LANE_ID} family core")
    parser.add_argument("--drop-first", action="append", default=[], help="family to try dropping first (repeatable)")
    parser.add_argument("--family", action="append", default=None, help="build only these selectable families (repeatable)")
    parser.add_argument("--by-group", action="store_true", help="one selector per family:label-set instead of per family")
    parser.add_argument("--coarse", action="store_true", help="one selector per family:distinguished-labels (chord, center)")
    parser.add_argument("--max-solves", type=int, default=400)
    arguments = parser.parse_args(argv)
    summary = run(
        run_root=arguments.run_root, control=arguments.control, solve_timeout_ms=arguments.solve_timeout_ms,
        label=arguments.label, drop_first=arguments.drop_first, only_families=arguments.family,
        by_group=arguments.by_group, coarse=arguments.coarse, max_solves=arguments.max_solves,
    )
    sys.stdout.write(json.dumps({k: summary[k] for k in ("outcome", "first_core", "minimal_family_core", "session")}, sort_keys=True) + "\n")
    return 0


if __name__ == "__main__":
    sys.exit(main())
