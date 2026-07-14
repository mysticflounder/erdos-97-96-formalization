#!/usr/bin/env python3
"""Metric-aware CEGAR for the two fixed card-12 Q-C placements.

The incidence solver proposes a finite row shadow.  Exact squared-distance
equalities are then checked over QQ.  A cross-checked unit subsystem becomes a
monotone no-good cut: any later assignment containing all of those rows is
also unit and can be pruned before another CAS call.

This remains a search over two fixed, non-target-faithful placements.  An
exhausted case is only exhausted inside that finite shadow.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
SOURCE_QUERY_DIR = HERE.parent / "second_center_query"
METRIC_ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
CHECKPOINT = HERE / "checkpoint.json"
MANIFEST = HERE / "manifest.json"
SCHEMA = "p97-atail-second-center-metric-cegar-v1"
CASE_SCHEMA = "p97-atail-second-center-metric-cegar-case-v1"

DEFAULT_MAX_ROUNDS = 8
MAX_NODES_PER_ROUND = 250_000
CAS_TIMEOUT_S = 6.0
MINIMIZE_WALL_S = 18.0
MINIMIZE_MSOLVE_TIMEOUT_S = 1.5
MINIMIZE_SINGULAR_TIMEOUT_S = 3.0

for path in (str(ROOT), str(SOURCE_QUERY_DIR), str(METRIC_ORACLE_DIR)):
    if path not in sys.path:
        sys.path.insert(0, path)

import oracle as metric_oracle  # noqa: E402
from census.global_confinement import shadow  # noqa: E402
from census.multi_center import multi_center_census as mc  # noqa: E402

# ``query.py`` must first resolve its own sibling ``validator.py``.  Once the
# metric-oracle import is complete, restore this directory to the front so the
# final structural validation resolves the CEGAR validator instead.
if str(HERE) in sys.path:
    sys.path.remove(str(HERE))
sys.path.insert(0, str(HERE))


MetricKey = tuple[int, tuple[int, ...]]
Cut = frozenset[MetricKey]


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(payload).hexdigest()


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_manifest() -> dict[str, Any]:
    manifest = json.loads(MANIFEST.read_text(encoding="utf-8"))
    assert manifest["scope"]["target_faithful"] is False
    assert manifest["omitted_fail_closed"]
    return manifest


def metric_key(row: shadow.ClassRow | metric_oracle.MetricRow) -> MetricKey:
    return row.center, tuple(sorted(row.support))


def metric_row(key: MetricKey) -> metric_oracle.MetricRow:
    return metric_oracle.MetricRow(key[0], key[1], exact=False)


def metric_rows(rows: Sequence[shadow.ClassRow]) -> tuple[metric_oracle.MetricRow, ...]:
    return tuple(metric_row(key) for key in sorted({metric_key(row) for row in rows}))


def cut_from_rows(rows: Sequence[metric_oracle.MetricRow]) -> Cut:
    return frozenset(metric_key(row) for row in rows)


def row_dict(row: metric_oracle.MetricRow) -> dict[str, Any]:
    return {"center": row.center, "support": list(row.support)}


def row_from_dict(record: Mapping[str, object]) -> metric_oracle.MetricRow:
    return metric_oracle.MetricRow(
        int(record["center"]),
        tuple(int(point) for point in record["support"]),
        exact=False,
    )


def encode_metric_row(row: metric_oracle.MetricRow) -> str:
    return f"{row.center}:" + ",".join(str(point) for point in row.support)


def decode_metric_row(encoded: str) -> metric_oracle.MetricRow:
    center_text, support_text = encoded.split(":", maxsplit=1)
    support = tuple(int(point) for point in support_text.split(",") if point)
    return metric_oracle.MetricRow(int(center_text), support, exact=False)


def encode_metric_rows(rows: Sequence[metric_oracle.MetricRow]) -> list[str]:
    return [encode_metric_row(row) for row in rows]


def cut_rows(cut: Cut) -> tuple[metric_oracle.MetricRow, ...]:
    return tuple(metric_row(key) for key in sorted(cut))


def contains_cut(rows: Sequence[shadow.ClassRow], cut: Cut) -> bool:
    signatures = {metric_key(row) for row in rows}
    return cut <= signatures


def exact_crosscheck(
    n: int,
    rows: Sequence[metric_oracle.MetricRow],
    *,
    timeout_s: float | None = None,
) -> dict[str, Any]:
    timeout = CAS_TIMEOUT_S if timeout_s is None else timeout_s
    variables = tuple(str(variable) for variable in metric_oracle.variable_symbols(n))
    polynomials = metric_oracle.serialized_system(n, rows)
    singular = metric_oracle.run_singular(
        variables, polynomials, timeout_s=timeout
    )
    msolve_forward = metric_oracle.run_msolve(
        variables, polynomials, timeout_s=timeout
    )
    msolve_reverse = metric_oracle.run_msolve(
        tuple(reversed(variables)), polynomials, timeout_s=timeout
    )
    verdicts = (
        singular.verdict,
        msolve_forward.verdict,
        msolve_reverse.verdict,
    )
    if len(set(verdicts)) == 1 and verdicts[0] in {"UNIT", "NONUNIT"}:
        status = f"CROSSCHECKED_{verdicts[0]}"
    else:
        status = "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT"
    return {
        "status": status,
        "singular_qq": {"verdict": singular.verdict},
        "msolve_qq_forward_variables": {"verdict": msolve_forward.verdict},
        "msolve_qq_reverse_variables": {"verdict": msolve_reverse.verdict},
    }


def crosscheck_summary(crosscheck: Mapping[str, object]) -> dict[str, Any]:
    return {
        "status": crosscheck["status"],
        "verdicts": [
            crosscheck["singular_qq"]["verdict"],
            crosscheck["msolve_qq_forward_variables"]["verdict"],
            crosscheck["msolve_qq_reverse_variables"]["verdict"],
        ],
    }


@dataclass(frozen=True)
class Problem:
    seed: Mapping[str, object]
    frame: mc.Frame
    candidates: Mapping[int, Sequence[frozenset[int]]]
    labels: Mapping[str, int]
    dangerous: frozenset[int]
    fixed_rows: tuple[shadow.ClassRow, ...]
    choice_rows: tuple[shadow.ChoiceRow, ...]
    p_caps: tuple[str, ...]

    @property
    def profile(self) -> tuple[int, int, int]:
        return tuple(int(value) for value in self.seed["profile"])


def build_problem(seed: Mapping[str, object]) -> Problem:
    profile = tuple(int(value) for value in seed["profile"])
    labels = {
        str(name): int(value)
        for name, value in dict(seed["labels"]).items()
    }
    frame, candidates = mc.cached_candidate_lists(profile, set(mc.PROVEN_ROWS))
    assert candidates is not None
    p = labels["p"]
    dangerous = frozenset(labels[name] for name in ("q", "t1", "t2", "t3"))
    if not mc.candidate_ok(frame, set(mc.PROVEN_ROWS), p, dangerous):
        raise AssertionError("dangerous supplied row is not locally admissible")
    fixed = (shadow.ClassRow("supplied:t2", p, dangerous, exact=True),)
    choices: list[shadow.ChoiceRow] = []
    for role in ("q", "t1", "t3", "u"):
        choices.append(
            shadow.ChoiceRow(
                f"supplied:{role}",
                metric_oracle.source_query.row_choice_candidates(
                    frame, candidates, source=labels[role]
                ),
                exact=True,
            )
        )
    for center in range(frame.n):
        if center == p:
            continue
        choices.append(
            shadow.ChoiceRow(
                f"global:{center}",
                tuple(
                    shadow.RowChoice(center, support)
                    for support in candidates[center]
                ),
                exact=True,
            )
        )
    caps = metric_oracle.source_query.cap_sets(frame)
    p_caps = tuple(name for name in ("S", "O1", "O2") if p in caps[name])
    return Problem(
        seed,
        frame,
        candidates,
        labels,
        dangerous,
        fixed,
        tuple(choices),
        p_caps,
    )


def q_c_ok(problem: Problem, rows: Sequence[shadow.ClassRow]) -> bool:
    caps = metric_oracle.source_query.cap_sets(problem.frame)
    p = problem.labels["p"]
    for cap_name in problem.p_caps:
        cap = caps[cap_name]
        outside = problem.dangerous - cap
        for row in rows:
            if row.center != p and row.center in cap:
                if len(row.support & outside) >= 2:
                    return False
    return True


def critical_system_exists(problem: Problem, rows: Sequence[shadow.ClassRow]) -> bool:
    p = problem.labels["p"]
    base_rows = list(rows)
    base_rows.append(
        shadow.ClassRow("global:p-proxy", p, problem.dangerous, exact=True)
    )
    return all(
        metric_oracle.source_query._eligible_blockers(
            problem.frame, base_rows, source
        )
        for source in range(problem.frame.n)
    )


def solve_incidence(problem: Problem, cuts: Sequence[Cut]) -> dict[str, Any]:
    def prefix(rows: Sequence[shadow.ClassRow]) -> bool:
        return q_c_ok(problem, rows) and not any(
            contains_cut(rows, cut) for cut in cuts
        )

    return shadow.solve_choice_rows(
        problem.frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=problem.fixed_rows,
        choice_rows=problem.choice_rows,
        max_nodes=MAX_NODES_PER_ROUND,
        want_assignment=True,
        prefix_compatible=prefix,
        complete_compatible=lambda rows: critical_system_exists(problem, rows),
    )


def assignment_rows(result: Mapping[str, object]) -> tuple[shadow.ClassRow, ...]:
    records = dict(result["assignment"])
    return tuple(
        shadow.ClassRow(
            str(name),
            int(record["center"]),
            frozenset(int(point) for point in record["support"]),
            bool(record["exact"]),
        )
        for name, record in sorted(records.items())
    )


def assignment_document(rows: Sequence[shadow.ClassRow]) -> list[dict[str, Any]]:
    return [
        {
            "name": row.name,
            "center": row.center,
            "support": sorted(row.support),
            "exact": row.exact,
        }
        for row in sorted(rows, key=lambda row: row.name)
    ]


def validate_assignment(
    problem: Problem, rows: Sequence[shadow.ClassRow], cuts: Sequence[Cut]
) -> None:
    expected_names = {
        "supplied:t2",
        "supplied:q",
        "supplied:t1",
        "supplied:t3",
        "supplied:u",
        *(
            f"global:{center}"
            for center in range(problem.frame.n)
            if center != problem.labels["p"]
        ),
    }
    if {row.name for row in rows} != expected_names:
        raise AssertionError("incidence assignment has the wrong named-row surface")
    ok, reason = shadow.verify_assignment(
        problem.frame, set(mc.PROVEN_ROWS), rows
    )
    if not ok:
        raise AssertionError(f"incidence assignment failed verification: {reason}")
    if not q_c_ok(problem, rows):
        raise AssertionError("incidence assignment violates Q-C negation")
    if not critical_system_exists(problem, rows):
        raise AssertionError("incidence assignment lacks a critical blocker system")
    if any(contains_cut(rows, cut) for cut in cuts):
        raise AssertionError("incidence assignment contains a prior no-good cut")


def _polynomial_sha256(
    n: int, rows: Sequence[metric_oracle.MetricRow]
) -> str:
    return canonical_sha256(list(metric_oracle.serialized_system(n, rows)))


def bounded_minimize_unit(
    n: int, rows: Sequence[metric_oracle.MetricRow]
) -> dict[str, Any]:
    """Use msolve as a proposal oracle and Singular to confirm every deletion."""

    active = list(enumerate(rows))
    started = time.monotonic()
    attempts: list[dict[str, Any]] = []
    variables = tuple(str(variable) for variable in metric_oracle.variable_symbols(n))
    for original_index, _row in tuple(active):
        elapsed = time.monotonic() - started
        if elapsed >= MINIMIZE_WALL_S:
            attempts.append(
                {
                    "original_index": original_index,
                    "proposal": "NOT_RUN_WALL_BUDGET",
                    "confirmation": "NOT_RUN",
                    "removed": False,
                }
            )
            continue
        candidate = tuple(
            candidate_row
            for index, candidate_row in active
            if index != original_index
        )
        polynomials = metric_oracle.serialized_system(n, candidate)
        remaining = max(0.05, MINIMIZE_WALL_S - (time.monotonic() - started))
        proposal = metric_oracle.run_msolve(
            variables,
            polynomials,
            timeout_s=min(MINIMIZE_MSOLVE_TIMEOUT_S, remaining),
        )
        if proposal.verdict == "UNIT":
            remaining = max(
                0.05, MINIMIZE_WALL_S - (time.monotonic() - started)
            )
            confirmation = metric_oracle.run_singular(
                variables,
                polynomials,
                timeout_s=min(MINIMIZE_SINGULAR_TIMEOUT_S, remaining),
            )
        else:
            confirmation = metric_oracle.OracleResult(
                "TIMEOUT", detail="not run because msolve did not propose UNIT"
            )
        removed = (
            proposal.verdict == "UNIT" and confirmation.verdict == "UNIT"
        )
        attempts.append(
            {
                "original_index": original_index,
                "proposal": proposal.verdict,
                "confirmation": (
                    confirmation.verdict if proposal.verdict == "UNIT" else "NOT_RUN"
                ),
                "removed": removed,
            }
        )
        if removed:
            active = [item for item in active if item[0] != original_index]
    retained = tuple(row for _, row in active)
    return {
        "strategy": "msolve-proposal-singular-confirmed-greedy-row-deletion",
        "wall_budget_seconds": MINIMIZE_WALL_S,
        "initial_row_count": len(rows),
        "retained_row_count": len(retained),
        "attempts": attempts,
        "retained_rows": [row_dict(row) for row in retained],
    }


def cut_document(
    n: int,
    rows: Sequence[metric_oracle.MetricRow],
    crosscheck: Mapping[str, object],
    *,
    origin: str,
) -> dict[str, Any]:
    return {
        "origin": origin,
        "rows": encode_metric_rows(rows),
        "row_count": len(rows),
        "equality_count": len(metric_oracle.serialized_system(n, rows)),
        "row_set_sha256": canonical_sha256(encode_metric_rows(rows)),
        "expanded_polynomial_sha256": _polynomial_sha256(n, rows),
        "crosscheck": crosscheck_summary(crosscheck),
    }


def bootstrap_rows(profile: tuple[int, int, int]) -> tuple[metric_oracle.MetricRow, ...]:
    checkpoint = json.loads(metric_oracle.CHECKPOINT.read_text(encoding="utf-8"))
    for case in checkpoint["cases"]:
        if tuple(int(value) for value in case["profile"]) == profile:
            source = case["bounded_deletion"]
            if source["retained_core_crosscheck"]["status"] != "CROSSCHECKED_UNIT":
                raise AssertionError("metric-oracle bootstrap core is not confirmed UNIT")
            return tuple(row_from_dict(row) for row in source["retained_rows"])
    raise KeyError(profile)


def seed_document(problem: Problem) -> dict[str, Any]:
    return {
        "profile": list(problem.profile),
        "surplus_cap": problem.seed["surplus_cap"],
        "second_large_cap": problem.seed["second_large_cap"],
        "labels": dict(sorted(problem.labels.items())),
    }


def _sat_round_document(
    problem: Problem,
    result: Mapping[str, object],
    cuts: Sequence[Cut],
) -> tuple[dict[str, Any], tuple[metric_oracle.MetricRow, ...]]:
    rows = assignment_rows(result)
    validate_assignment(problem, rows, cuts)
    metrics = metric_rows(rows)
    assignment = assignment_document(rows)
    record = {
        "incidence_status": "SAT",
        "nodes": int(result["nodes"]),
        "assignment_sha256": canonical_sha256(assignment),
        "metric_row_count": len(metrics),
        "metric_rows_sha256": canonical_sha256(encode_metric_rows(metrics)),
        "equality_count": len(metric_oracle.serialized_system(problem.frame.n, metrics)),
        "expanded_polynomial_sha256": _polynomial_sha256(problem.frame.n, metrics),
        "full_equality_ideal": crosscheck_summary(
            exact_crosscheck(problem.frame.n, metrics)
        ),
    }
    return record, metrics


def continue_discovery(
    problem: Problem,
    case: dict[str, Any],
    cuts: list[Cut],
    *,
    start_round: int,
    max_rounds: int,
) -> dict[str, Any]:
    if not 0 <= start_round <= max_rounds:
        raise ValueError("invalid CEGAR continuation interval")
    for round_index in range(start_round, max_rounds):
        print(
            f"CEGAR profile={problem.profile} round={round_index} "
            f"cuts={len(cuts)}: incidence solve",
            file=sys.stderr,
        )
        result = solve_incidence(problem, cuts)
        if result["status"] != "SAT":
            case["rounds"].append(
                {
                    "round": round_index,
                    "incidence_status": result["status"],
                    "nodes": int(result["nodes"]),
                }
            )
            case["final_status"] = (
                "EXHAUSTED_FIXED_PLACEMENT_FINITE_SHADOW"
                if result["status"] == "UNSAT"
                else "STOPPED_INCIDENCE_NODE_CAP"
            )
            return case

        round_record, metrics = _sat_round_document(problem, result, cuts)
        print(
            f"CEGAR profile={problem.profile} round={round_index}: "
            f"metric {round_record['full_equality_ideal']['status']}",
            file=sys.stderr,
        )
        round_record["round"] = round_index
        full_status = round_record["full_equality_ideal"]["status"]
        if full_status == "CROSSCHECKED_NONUNIT":
            round_record["reported_status"] = (
                "FOUND_COMPLEX_NONUNIT_EQUALITY_SHADOW_REAL_FEASIBILITY_UNDECIDED"
            )
            case["rounds"].append(round_record)
            case["final_status"] = "FOUND_CROSSCHECKED_NONUNIT_EQUALITY_CANDIDATE"
            return case
        if full_status != "CROSSCHECKED_UNIT":
            round_record["reported_status"] = "UNDECIDED_FAIL_CLOSED"
            case["rounds"].append(round_record)
            case["final_status"] = "STOPPED_FULL_ORACLE_UNDECIDED"
            return case

        minimization = bounded_minimize_unit(problem.frame.n, metrics)
        proposed = tuple(
            row_from_dict(row) for row in minimization["retained_rows"]
        )
        proposed_check = exact_crosscheck(problem.frame.n, proposed)
        if proposed_check["status"] == "CROSSCHECKED_UNIT":
            accepted = proposed
            accepted_check = proposed_check
            origin = "bounded_minimized_full_unit_assignment"
        else:
            # The already-cross-checked full row set is always a sound fallback.
            accepted = metrics
            accepted_check = exact_crosscheck(problem.frame.n, metrics)
            origin = "full_unit_assignment_fallback"
        accepted_cut = cut_from_rows(accepted)
        if accepted_cut in cuts:
            raise AssertionError("CEGAR proposed a duplicate cut")
        if not accepted_cut <= cut_from_rows(metrics):
            raise AssertionError("accepted cut is not a candidate-row subset")
        attempts = list(minimization["attempts"])
        round_record["minimization"] = {
            "strategy": minimization["strategy"],
            "wall_budget_seconds": minimization["wall_budget_seconds"],
            "initial_row_count": minimization["initial_row_count"],
            "retained_row_count": minimization["retained_row_count"],
            "removed_count": sum(bool(item["removed"]) for item in attempts),
            "incomplete_attempt_count": sum(
                item["proposal"] in {"TIMEOUT", "NOT_RUN_WALL_BUDGET"}
                or item["confirmation"] == "TIMEOUT"
                for item in attempts
            ),
            "attempts_sha256": canonical_sha256(attempts),
            "proposed_core_crosscheck": crosscheck_summary(proposed_check),
        }
        round_record["accepted_cut"] = cut_document(
            problem.frame.n,
            accepted,
            accepted_check,
            origin=origin,
        )
        round_record["reported_status"] = "CROSSCHECKED_UNIT_CUT_ACCEPTED"
        case["rounds"].append(round_record)
        cuts.append(accepted_cut)
        print(
            f"CEGAR profile={problem.profile} round={round_index}: "
            f"accepted {len(accepted_cut)}-row UNIT cut",
            file=sys.stderr,
        )

    case["final_status"] = "STOPPED_ROUND_BUDGET"
    return case


def discover_case(problem: Problem, *, max_rounds: int) -> dict[str, Any]:
    print(f"CEGAR profile={problem.profile}: validating bootstrap cut", file=sys.stderr)
    initial_rows = bootstrap_rows(problem.profile)
    bootstrap_check = exact_crosscheck(problem.frame.n, initial_rows)
    bootstrap = cut_document(
        problem.frame.n,
        initial_rows,
        bootstrap_check,
        origin="second_center_metric_oracle_checkpoint",
    )
    case = {
        "schema": CASE_SCHEMA,
        "profile": list(problem.profile),
        "seed": seed_document(problem),
        "seed_sha256": canonical_sha256(seed_document(problem)),
        "bootstrap_cut": bootstrap,
        "rounds": [],
    }
    if bootstrap_check["status"] != "CROSSCHECKED_UNIT":
        case["final_status"] = "STOPPED_BOOTSTRAP_CUT_NOT_RECONFIRMED"
        return case
    return continue_discovery(
        problem,
        case,
        [cut_from_rows(initial_rows)],
        start_round=0,
        max_rounds=max_rounds,
    )


def _replay_round(
    problem: Problem,
    saved_round: Mapping[str, object],
    cuts: Sequence[Cut],
) -> tuple[dict[str, Any], Cut | None]:
    result = solve_incidence(problem, cuts)
    if result["status"] != saved_round["incidence_status"]:
        raise AssertionError("incidence status drift")
    if int(result["nodes"]) != int(saved_round["nodes"]):
        raise AssertionError("incidence node-count drift")
    if result["status"] != "SAT":
        return {
            "round": int(saved_round["round"]),
            "incidence_status": result["status"],
            "nodes": int(result["nodes"]),
        }, None

    record, metrics = _sat_round_document(problem, result, cuts)
    record["round"] = int(saved_round["round"])
    if "accepted_cut" not in saved_round:
        record["reported_status"] = str(saved_round["reported_status"])
        return record, None

    saved_cut = dict(saved_round["accepted_cut"])
    accepted = tuple(decode_metric_row(str(row)) for row in saved_cut["rows"])
    if not cut_from_rows(accepted) <= cut_from_rows(metrics):
        raise AssertionError("saved cut is not a replayed-candidate subset")
    checked = exact_crosscheck(problem.frame.n, accepted)
    saved_cut["crosscheck"] = crosscheck_summary(checked)
    if checked["status"] != "CROSSCHECKED_UNIT":
        raise AssertionError("saved cut did not replay as cross-checked UNIT")
    record["minimization"] = dict(saved_round["minimization"])
    record["accepted_cut"] = saved_cut
    record["reported_status"] = str(saved_round["reported_status"])
    return record, cut_from_rows(accepted)


def replay_case(problem: Problem, saved: Mapping[str, object]) -> dict[str, Any]:
    initial_rows = bootstrap_rows(problem.profile)
    bootstrap_check = exact_crosscheck(problem.frame.n, initial_rows)
    bootstrap = cut_document(
        problem.frame.n,
        initial_rows,
        bootstrap_check,
        origin="second_center_metric_oracle_checkpoint",
    )
    result = {
        "schema": CASE_SCHEMA,
        "profile": list(problem.profile),
        "seed": seed_document(problem),
        "seed_sha256": canonical_sha256(seed_document(problem)),
        "bootstrap_cut": bootstrap,
        "rounds": [],
    }
    cuts: list[Cut] = [cut_from_rows(initial_rows)]
    for saved_round in saved["rounds"]:
        replayed, learned = _replay_round(problem, saved_round, cuts)
        result["rounds"].append(replayed)
        if learned is not None:
            cuts.append(learned)
    result["final_status"] = str(saved["final_status"])
    return result


def resume_case(
    problem: Problem,
    saved: Mapping[str, object],
    *,
    max_rounds: int,
) -> dict[str, Any]:
    if saved["final_status"] != "STOPPED_ROUND_BUDGET":
        raise ValueError("only a round-budget-stopped case can be resumed")
    replayed = replay_case(problem, saved)
    start_round = len(replayed["rounds"])
    if max_rounds <= start_round:
        raise ValueError("resume budget must exceed the saved round count")
    cuts = [
        cut_from_rows(
            tuple(
                decode_metric_row(str(value))
                for value in replayed["bootstrap_cut"]["rows"]
            )
        )
    ]
    for record in replayed["rounds"]:
        if "accepted_cut" not in record:
            raise ValueError("resumed prefix contains a round without a UNIT cut")
        cuts.append(
            cut_from_rows(
                tuple(
                    decode_metric_row(str(value))
                    for value in record["accepted_cut"]["rows"]
                )
            )
        )
    return continue_discovery(
        problem,
        replayed,
        cuts,
        start_round=start_round,
        max_rounds=max_rounds,
    )


def build_document(
    *,
    saved: Mapping[str, object] | None = None,
    resume: Mapping[str, object] | None = None,
    resume_checkpoint_sha256: str | None = None,
    max_rounds: int | None = None,
) -> dict[str, Any]:
    manifest = load_manifest()
    if saved is not None and resume is not None:
        raise ValueError("choose replay or resume, not both")
    if resume is not None:
        if max_rounds is None:
            raise ValueError("resume requires an explicit larger round budget")
        previous_budget = int(resume["budgets"]["max_rounds_per_case"])
        if max_rounds <= previous_budget:
            raise ValueError("resume budget must exceed the saved checkpoint budget")
        if resume_checkpoint_sha256 is None:
            raise ValueError("resume requires the source checkpoint hash")
        round_budget = max_rounds
    elif saved is None:
        round_budget = DEFAULT_MAX_ROUNDS if max_rounds is None else max_rounds
    else:
        round_budget = int(saved["budgets"]["max_rounds_per_case"])
        if max_rounds is not None and max_rounds != round_budget:
            raise ValueError("replay round budget must match the saved checkpoint")
    if round_budget <= 0:
        raise ValueError("round budget must be positive")
    problems = [
        build_problem(seed) for seed in metric_oracle.source_query.CASE_SEEDS
    ]
    if resume is not None:
        resume_by_profile = {
            tuple(int(value) for value in case["profile"]): case
            for case in resume["cases"]
        }
        cases = [
            resume_case(
                problem,
                resume_by_profile[problem.profile],
                max_rounds=round_budget,
            )
            for problem in problems
        ]
    elif saved is None:
        cases = [
            discover_case(problem, max_rounds=round_budget) for problem in problems
        ]
    else:
        saved_by_profile = {
            tuple(int(value) for value in case["profile"]): case
            for case in saved["cases"]
        }
        cases = [
            replay_case(problem, saved_by_profile[problem.profile])
            for problem in problems
        ]
    source = {
        "second_center_query_checkpoint_sha256": file_sha256(
            SOURCE_QUERY_DIR / "checkpoint.json"
        ),
        "metric_oracle_checkpoint_sha256": file_sha256(
            METRIC_ORACLE_DIR / "checkpoint.json"
        ),
        "metric_oracle_manifest_sha256": file_sha256(
            METRIC_ORACLE_DIR / "manifest.json"
        ),
    }
    if resume is not None:
        source["resumed_checkpoint_sha256"] = resume_checkpoint_sha256
        source["resumed_round_budget_per_case"] = int(
            resume["budgets"]["max_rounds_per_case"]
        )
    elif saved is not None:
        saved_source = saved["source"]
        has_resume_hash = "resumed_checkpoint_sha256" in saved_source
        has_resume_budget = "resumed_round_budget_per_case" in saved_source
        if has_resume_hash != has_resume_budget:
            raise ValueError("incomplete resumed-checkpoint provenance")
        if has_resume_hash:
            # Replay reconstructs every saved algebraic system, but it does not
            # rediscover the source prefix.  Retain its immutable provenance so
            # a resumed checkpoint can byte-match after the full replay gate.
            source["resumed_checkpoint_sha256"] = str(
                saved_source["resumed_checkpoint_sha256"]
            )
            source["resumed_round_budget_per_case"] = int(
                saved_source["resumed_round_budget_per_case"]
            )
    document = {
        "schema": SCHEMA,
        "manifest_sha256": canonical_sha256(manifest),
        "source": source,
        "budgets": {
            "max_rounds_per_case": round_budget,
            "max_incidence_nodes_per_round": MAX_NODES_PER_ROUND,
            "cas_timeout_seconds_per_call": CAS_TIMEOUT_S,
            "minimization_wall_seconds_per_unit_candidate": MINIMIZE_WALL_S,
        },
        "smoke_gates": metric_oracle.smoke_gates(),
        "cases": cases,
        "scope": {
            "target_faithful": False,
            "fixed_placements_only": True,
            "card_11_included": False,
            "unit_cuts_monotone": True,
            "singular_qq_and_msolve_two_order_crosscheck": True,
            "nullstellensatz_certificate_replayed": False,
            "finite_search_python_trusted": True,
            "producer_proved": False,
            "lean_theorem_proved": False,
        },
    }
    validator_path = HERE / "validator.py"
    spec = importlib.util.spec_from_file_location(
        "p97_atail_metric_cegar_validator", validator_path
    )
    if spec is None or spec.loader is None:
        raise ImportError(f"cannot load structural validator {validator_path}")
    validator_module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(validator_module)
    validator_module.validate_document(document, api=sys.modules[__name__])
    return document


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--discover", action="store_true")
    parser.add_argument("--check", action="store_true")
    parser.add_argument(
        "--max-rounds",
        type=int,
        help=(
            "positive per-case discovery budget; recorded in the output "
            f"(default: {DEFAULT_MAX_ROUNDS})"
        ),
    )
    parser.add_argument(
        "--output",
        type=Path,
        help="write the generated JSON checkpoint (discovery only)",
    )
    parser.add_argument(
        "--checkpoint",
        type=Path,
        default=CHECKPOINT,
        help="checkpoint to replay/check (default: checkpoint.json)",
    )
    parser.add_argument(
        "--resume-from",
        type=Path,
        help=(
            "replay a round-budget-stopped checkpoint, retain its cuts, and "
            "continue discovery to --max-rounds"
        ),
    )
    args = parser.parse_args()
    if args.discover and args.check:
        parser.error("choose at most one of --discover and --check")
    if args.max_rounds is not None and not args.discover:
        parser.error("--max-rounds is supported only with --discover")
    if args.max_rounds is not None and args.max_rounds <= 0:
        parser.error("--max-rounds must be positive")
    if args.resume_from is not None and not args.discover:
        parser.error("--resume-from requires --discover")
    if args.resume_from is not None and args.max_rounds is None:
        parser.error("--resume-from requires an explicit --max-rounds")
    if args.discover and args.checkpoint != CHECKPOINT:
        parser.error("--checkpoint is supported only for replay/check")
    if args.discover:
        if args.resume_from is None:
            result = build_document(saved=None, max_rounds=args.max_rounds)
        else:
            if not args.resume_from.exists():
                raise FileNotFoundError(args.resume_from)
            resume = json.loads(args.resume_from.read_text(encoding="utf-8"))
            result = build_document(
                resume=resume,
                resume_checkpoint_sha256=file_sha256(args.resume_from),
                max_rounds=args.max_rounds,
            )
    else:
        if not args.checkpoint.exists():
            raise FileNotFoundError(args.checkpoint)
        saved = json.loads(args.checkpoint.read_text(encoding="utf-8"))
        result = build_document(saved=saved)
        if args.check and result != saved:
            raise AssertionError("metric-CEGAR checkpoint drift")
    rendered = json.dumps(result, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        if not args.discover:
            parser.error("--output is supported only with --discover")
        args.output.write_text(rendered, encoding="utf-8")
        print(
            json.dumps(
                {
                    "output": str(args.output),
                    "sha256": file_sha256(args.output),
                    "case_statuses": {
                        str(case["profile"]): case["final_status"]
                        for case in result["cases"]
                    },
                },
                indent=2,
                sort_keys=True,
            )
        )
    else:
        print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
