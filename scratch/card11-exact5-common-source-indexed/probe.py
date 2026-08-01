#!/usr/bin/env python3
"""Source-indexed CriticalShellSystem shadow over the card-11 common lane.

For every labelled carrier source ``s`` this CNF chooses one triple
``(s, c, k)``: the selected Census-554 exact-four row ``k`` at blocker center
``c`` contains ``s``.  Its deletion leaves exactly three named members of that
row.  The base cube supplies one exact-four selected row per center, C4 pair
capacity <= 2, C2 triple capacity <= 1, and direct/reflected separation.

This is an incidence shadow, not a complete formalization of
``CriticalShellSystem.no_qfree``: it does not quantify over every unselected
same-radius class at a geometric center after deleting the source.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import subprocess
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Mapping


HERE = Path(__file__).resolve().parent
REPO_ROOT = HERE.parents[1]
BASE_DIR = REPO_ROOT / "scratch" / "card11-exact5-common"
_base_spec = importlib.util.spec_from_file_location(
    "card11_exact5_common_base", BASE_DIR / "probe.py"
)
if _base_spec is None or _base_spec.loader is None:
    raise RuntimeError("could not load the audited common projection")
base = importlib.util.module_from_spec(_base_spec)
sys.modules[_base_spec.name] = base
_base_spec.loader.exec_module(base)


SCHEMA = "card11_exact5_common_source_indexed.v1"
SOURCES = tuple(range(base.profile.N))
COMMON_SOURCES = (base.Q, base.WITNESS)
EXPECTED_BASE_VARIABLES = base.EXPECTED_SEPARATED_VARIABLES
EXPECTED_BASE_CLAUSES = base.EXPECTED_SEPARATED_CLAUSES


class ProbeError(RuntimeError):
    pass


@dataclass(frozen=True)
class SourceChoice:
    source: int
    center: int
    row_index: int
    variable: int


@dataclass(frozen=True)
class SolverResult:
    verdict: str
    returncode: int
    stdout: str
    stderr: str
    wall_seconds: float


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1 << 20), b""):
            digest.update(chunk)
    return digest.hexdigest()


def write_text(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_json(path: Path, value: object) -> None:
    write_text(path, json.dumps(value, sort_keys=True, indent=2) + "\n")


def source_provenance() -> dict[str, dict[str, str]]:
    paths = {
        "source_indexed_driver": Path(__file__).resolve(),
        "common_projection_driver": Path(base.__file__).resolve(),
        "census_profile": Path(base.profile.__file__).resolve(),
        "cover_encoder": Path(base.sat_cover.__file__).resolve(),
        "separation_encoder": Path(base.separation_encoding.__file__).resolve(),
        "critical_shell_interface": REPO_ROOT / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
    }
    return {name: {"path": str(path), "sha256": sha256_file(path)}
            for name, path in paths.items()}


def common_shell_name(s: int, o: int) -> str:
    return f"s{s}_o{o}"


def source_choice_domain(instance, source: int, *, common: bool) -> tuple[tuple[int, int], ...]:
    """Admissible ``(center, row)`` choices for one source.

    In the four common-blocker shells the two common sources are required to
    choose the displayed common blocker center.  At every other source this is
    the strongest literal finite shadow: a selected exact-four Census row
    containing that source.  Since candidates exclude their center, source and
    chosen center are automatically distinct.
    """
    centers = (base.BLOCKER,) if common and source in COMMON_SOURCES else SOURCES
    return tuple(
        (center, row_index)
        for center in centers
        for row_index, members in enumerate(instance.cand[center])
        if source in members
    )


def add_source_indexed_constraints(instance, *, common: bool) -> dict:
    """Add a total source-to-selected-row map, one exact choice per source."""
    choices: list[SourceChoice] = []
    choices_by_source: dict[int, list[SourceChoice]] = {s: [] for s in SOURCES}
    by_key: dict[tuple[int, int, int], SourceChoice] = {}
    clauses_before = len(instance.cnf.clauses)
    vars_before = instance.cnf.n
    for source in SOURCES:
        domain = source_choice_domain(instance, source, common=common)
        if not domain:
            raise ProbeError(f"source {source} has no critical-row shadow")
        vars_for_source = []
        for center, row_index in domain:
            members = instance.cand[center][row_index]
            if source not in members or center in members or len(members) != 4:
                raise ProbeError("invalid source-indexed candidate domain")
            variable = instance.cnf.new_var()
            choice = SourceChoice(source, center, row_index, variable)
            choices.append(choice)
            choices_by_source[source].append(choice)
            by_key[(source, center, row_index)] = choice
            vars_for_source.append(variable)
            # The source's named critical shell is this globally selected row.
            instance.cnf.add([-variable, instance.x[(center, row_index)]])
        instance.cnf.add(vars_for_source)                 # totality
        instance.cnf.le_k_sinz(vars_for_source, 1)        # functionality

    return {
        "choices": choices,
        "choices_by_source": choices_by_source,
        "by_key": by_key,
        "choice_variables": instance.cnf.n - vars_before,
        "choice_clauses": len(instance.cnf.clauses) - clauses_before,
        "domain_sizes": {str(s): len(choices_by_source[s]) for s in SOURCES},
        "common_sources_forced_to_blocker": list(COMMON_SOURCES) if common else [],
    }


def build_instance(s: int | None = None, o: int | None = None):
    """Build a complete projected CNF and its schema/provenance description."""
    common = s is not None or o is not None
    if common and (s is None or o is None):
        raise ProbeError("both shell labels are required")
    if common and (s, o) not in base.SHELL_CASES:
        raise ProbeError("not one of the audited four common-blocker shells")
    instance, separation, shell = base.build_instance(s, o) if common else base.build_instance()
    expected_clauses = EXPECTED_BASE_CLAUSES + (2 if common else 0)
    if instance.cnf.n != EXPECTED_BASE_VARIABLES or len(instance.cnf.clauses) != expected_clauses:
        raise ProbeError("wrapped separated Census-554 surface drifted")
    indexed = add_source_indexed_constraints(instance, common=common)
    schema = {
        "schema": SCHEMA,
        "base_schema": base.SCHEMA,
        "carrier_labels": list(SOURCES),
        "exact_four_support": "each x[c,row] is one four-element row; each y[s,c,row] requires s in row",
        "source_deletion_shadow": "y[s,c,row] means deleting s leaves the selected exact-four support row with three members",
        "selected_blocker_center": "y[s,c,row] is total and functional for every source; y implies x[c,row]",
        "pair_center_capacity": "inherited Census-554 C4: every support pair occurs at at most two selected centers",
        "triple_center_capacity": "inherited Census-554 C2: selected rows at distinct centers have intersection at most two, so every support triple occurs at at most one center",
        "common_blocker_bisector_saturation": (
            "in a shell, V=1 and B=8 select rows containing {Q=6,W=7}; C4 saturates this pair at two centers; y[6,8,*] and y[7,8,*] choose B"
            if common else "not activated outside a four-shell case"
        ),
        "critical_shell_source": "CriticalShellSystem.shellAt / source_mem_selectedFourClass / selectedFourClass_support_eq_shell in U1CarrierInjection.lean",
        "trust_boundary": "No_qfree after deletion is not represented for unselected geometric radius classes; source labels are a fixed 11-label Census quotient; direct/reflected cyclic separation is the imported finite surface.",
    }
    return instance, separation, shell, indexed, schema


def parse_assignment(output: str) -> dict[int, bool]:
    return base.parse_assignment(output)


def validate_all_clauses(instance, assignment: Mapping[int, bool]) -> dict:
    """Independent DIMACS-clause evaluation, separate from the base validator."""
    failures = []
    unresolved = []
    for clause_no, clause in enumerate(instance.cnf.clauses, start=1):
        values = [assignment.get(abs(lit)) == (lit > 0) for lit in clause]
        if any(values):
            continue
        if any(abs(lit) not in assignment for lit in clause):
            unresolved.append(clause_no)
        else:
            failures.append(clause_no)
    return {
        "assignment_variables": len(assignment),
        "expected_variables": instance.cnf.n,
        "all_assigned": len(assignment) == instance.cnf.n,
        "unsatisfied_clause_count": len(failures),
        "unresolved_clause_count": len(unresolved),
        "first_unsatisfied_clauses": failures[:10],
        "first_unresolved_clauses": unresolved[:10],
        "cnf_satisfied": not failures and not unresolved,
    }


def decode_source_map(instance, indexed: Mapping[str, object], assignment: Mapping[int, bool], *, common: bool) -> dict:
    choices_by_source = indexed["choices_by_source"]
    source_map = {}
    for source in SOURCES:
        chosen = [choice for choice in choices_by_source[source]
                  if assignment.get(choice.variable) is True]
        if len(chosen) != 1:
            raise ProbeError(f"source {source} selects {len(chosen)} blocker rows")
        choice = chosen[0]
        support = instance.cand[choice.center][choice.row_index]
        if source not in support or choice.center in support or len(support) != 4:
            raise ProbeError(f"invalid decoded choice for source {source}")
        if assignment.get(instance.x[(choice.center, choice.row_index)]) is not True:
            raise ProbeError(f"decoded choice for source {source} does not select its row")
        deleted = sorted(support - {source})
        if len(deleted) != 3:
            raise ProbeError(f"source deletion did not leave three support labels at {source}")
        source_map[str(source)] = {
            "blocker_center": choice.center,
            "candidate_index": choice.row_index,
            "exact_four_support": sorted(support),
            "support_after_source_deletion": deleted,
        }
    if common:
        for source in COMMON_SOURCES:
            if source_map[str(source)]["blocker_center"] != base.BLOCKER:
                raise ProbeError("common source did not choose the fixed blocker")
    return source_map


def independent_structural_validation(instance, separation, shell, indexed, assignment) -> tuple[dict, dict]:
    # This calls the pre-existing direct geometry validators only after the new
    # source-map decoder has checked the new CNF layer directly.
    model, base_validation = base.decode_and_validate_model(instance, separation, assignment, shell)
    source_map = decode_source_map(instance, indexed, assignment, common=shell is not None)
    cube = {int(c): frozenset(row) for c, row in model["cube"].items()}
    pair_centers: dict[tuple[int, int], int] = {}
    triple_centers: dict[tuple[int, int, int], int] = {}
    for center, support in cube.items():
        for pair in itertools.combinations(sorted(support), 2):
            pair_centers[pair] = pair_centers.get(pair, 0) + 1
        for triple in itertools.combinations(sorted(support), 3):
            triple_centers[triple] = triple_centers.get(triple, 0) + 1
    capacities_ok = max(pair_centers.values(), default=0) <= 2 and max(triple_centers.values(), default=0) <= 1
    saturation_ok = True
    if shell is not None:
        saturation_ok = pair_centers.get(tuple(sorted((base.Q, base.WITNESS))), 0) == 2
    if not capacities_ok or not saturation_ok:
        raise ProbeError("independent pair/triple capacity or common saturation validation failed")
    return {
        **model,
        "source_to_valuation": source_map,
        "pair_center_counts": {"-".join(map(str, p)): n for p, n in sorted(pair_centers.items())},
        "triple_center_counts": {"-".join(map(str, t)): n for t, n in sorted(triple_centers.items())},
    }, {
        "base_structural_validation": base_validation,
        "source_map_total_functional_and_exact": True,
        "source_deletion_selected_support_card_three": True,
        "independent_pair_capacity_le_two": max(pair_centers.values(), default=0) <= 2,
        "independent_triple_capacity_le_one": max(triple_centers.values(), default=0) <= 1,
        "independent_common_pair_saturated": saturation_ok,
    }


def run_cadical(cnf_path: Path, proof_path: Path, timeout: int) -> tuple[SolverResult, list[str]]:
    command = ["cadical", "-q", "-t", str(timeout), str(cnf_path), str(proof_path)]
    started = time.monotonic()
    try:
        completed = subprocess.run(command, capture_output=True, text=True, timeout=timeout + 30)
    except subprocess.TimeoutExpired as error:
        return SolverResult("TIMEOUT", 124, error.stdout or "", error.stderr or "", time.monotonic() - started), command
    stdout, stderr = completed.stdout, completed.stderr
    if "s SATISFIABLE" in stdout:
        verdict = "SAT"
    elif "s UNSATISFIABLE" in stdout:
        verdict = "UNSAT"
    else:
        verdict = "ERROR"
    return SolverResult(verdict, completed.returncode, stdout, stderr, time.monotonic() - started), command


def verify_drat(cnf_path: Path, proof_path: Path, timeout: int = 300) -> dict:
    if not proof_path.exists() or proof_path.stat().st_size == 0:
        return {"verified": False, "reason": "missing-or-empty-proof"}
    completed = subprocess.run(["drat-trim", str(cnf_path), str(proof_path)], capture_output=True, text=True, timeout=timeout)
    output = completed.stdout + completed.stderr
    return {"verified": completed.returncode == 0 and "s VERIFIED" in output,
            "returncode": completed.returncode, "output_tail": output[-1000:]}


def run_case(s: int, o: int, timeout: int, output_root: Path) -> dict:
    case_dir = output_root / "runs" / common_shell_name(s, o)
    case_dir.mkdir(parents=True, exist_ok=True)
    instance, separation, shell, indexed, schema = build_instance(s, o)
    cnf_path, proof_path = case_dir / "input.cnf", case_dir / "proof.drat"
    write_text(cnf_path, instance.dimacs())
    result, command = run_cadical(cnf_path, proof_path, timeout)
    write_text(case_dir / "cadical.stdout", result.stdout)
    write_text(case_dir / "cadical.stderr", result.stderr)
    record = {
        "schema": SCHEMA, "case": {"s": s, "o": o}, "verdict": result.verdict,
        "returncode": result.returncode, "wall_seconds": result.wall_seconds,
        "command": command, "variables": instance.cnf.n, "clauses": len(instance.cnf.clauses),
        "cnf_sha256": sha256_file(cnf_path), "proof_sha256": sha256_file(proof_path) if proof_path.exists() else None,
        "proof_bytes": proof_path.stat().st_size if proof_path.exists() else 0,
        "source_indexed": {k: v for k, v in indexed.items() if k not in {"choices", "choices_by_source", "by_key"}},
    }
    if result.verdict == "SAT":
        assignment = parse_assignment(result.stdout)
        clause_validation = validate_all_clauses(instance, assignment)
        model, structural = independent_structural_validation(instance, separation, shell, indexed, assignment)
        write_json(case_dir / "model.json", model)
        record["model_validation"] = clause_validation
        record["structural_validation"] = structural
    elif result.verdict == "UNSAT":
        record["drat_verification"] = verify_drat(cnf_path, proof_path)
    write_json(case_dir / "schema.json", schema)
    write_json(case_dir / "provenance.json", {"source_provenance": source_provenance(), "schema": schema})
    write_json(case_dir / "result.json", record)
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--case", action="append", choices=[common_shell_name(s, o) for s, o in base.SHELL_CASES])
    parser.add_argument("--output-root", type=Path, default=HERE)
    args = parser.parse_args()
    if not 1 <= args.timeout <= 1800:
        raise SystemExit("--timeout must be in [1, 1800]")
    selected = [pair for pair in base.SHELL_CASES if not args.case or common_shell_name(*pair) in args.case]
    records = [run_case(s, o, args.timeout, args.output_root.resolve()) for s, o in selected]
    summary = {"schema": SCHEMA, "timeout_per_case_seconds": args.timeout, "serial": True,
               "results": records, "promotable": False,
               "promotion_reason": "finite SAT incidence shadow with an unencoded no_qfree-after-deletion quantifier"}
    write_json(args.output_root.resolve() / "summary.json", summary)
    print(json.dumps({"cases": len(records), "verdicts": [r["verdict"] for r in records], "promotable": False}, sort_keys=True))
    return 0 if all(r["verdict"] in {"SAT", "UNSAT"} for r in records) else 1


if __name__ == "__main__":
    raise SystemExit(main())
