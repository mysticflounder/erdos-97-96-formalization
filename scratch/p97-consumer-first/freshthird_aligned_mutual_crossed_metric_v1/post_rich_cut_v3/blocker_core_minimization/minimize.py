"""Globally minimize the frozen post-rich-cut-v3 blocker contradiction.

This is a diagnostic for one exact-17 direct-crossed assignment.  It rebuilds
the 1070 canonical clauses from the parent generator, extracts a global
external-Z3 UNSAT seed, performs deterministic fresh-solver deletion
minimization, and independently replays the final core and every drop-one with
the Z3 CLI and cvc5.  No result here is a CE, universal, or Lean closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
import time
from collections import OrderedDict
from collections.abc import Iterable, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

import z3

HERE = Path(__file__).resolve().parent
PARENT = HERE.parent
GENERATED = HERE / "generated"
LOGS = HERE / "logs"
ASSIGNMENT = PARENT / "generated/post_rich_cut_v3_assignment.json"
PARENT_GENERATOR = PARENT / "unified_metric.py"
sys.path.insert(0, str(PARENT))

import incidence_round
import unified_metric as metric

EXPECTED_CLAUSE_COUNT = 1070

# Exact witnesses use triangular-lattice coordinates (a,b), interpreted as
# (a + b/2, b*sqrt(3)/2).  Unlisted vertices are at (0,0).  The two all-b=0
# witnesses are additionally replayable with plain Fraction arithmetic.
DROP_WITNESSES: dict[str, dict[int, tuple[int, int]]] = {
    "k4_equal_8_3": {
        0: (-1, 0),
        1: (-5, 0),
        2: (-6, -2),
        3: (-3, 1),
        7: (-4, 2),
        8: (0, 0),
        13: (-2, 3),
    },
    "k4_equal_3_8": {
        0: (-1, 0),
        1: (-3, -1),
        2: (-6, 0),
        3: (-1, 0),
        7: (-4, 2),
        8: (0, 0),
        13: (-2, 3),
    },
    "k4_equal_1_3": {
        0: (-1, 0),
        1: (-1, 1),
        2: (-4, 2),
        3: (-1, 0),
        7: (-4, 2),
        8: (0, 0),
        13: (-2, 3),
    },
    "k4_equal_1_7": {
        0: (-1, 0),
        1: (-1, 1),
        2: (-2, 1),
        3: (-1, 0),
        7: (-4, 2),
        8: (0, 0),
        13: (-2, 3),
    },
    "k4_equal_7_1": {
        0: (-1, 1),
        1: (-2, 0),
        2: (-3, 0),
        3: (-1, 0),
        7: (-2, -1),
        8: (0, 0),
        13: (1, -3),
    },
    "k4_equal_7_13": {
        0: (0, 0),
        1: (0, 0),
        2: (0, 0),
        3: (0, 0),
        7: (0, 0),
        8: (0, 0),
        13: (-3, 0),
    },
    "k4_equal_13_7": {
        0: (-1, 1),
        1: (-2, 1),
        2: (-3, 1),
        3: (-1, 0),
        7: (-2, 2),
        8: (0, 0),
        13: (-2, 3),
    },
    "k4_equal_13_8": {
        0: (-1, 0),
        1: (-2, 1),
        2: (-3, 1),
        3: (-1, 0),
        7: (-2, 0),
        8: (0, 0),
        13: (-2, 1),
    },
    "blocker_exact_8_13": {},
}


@dataclass(frozen=True)
class Verdict:
    status: str
    seconds: float
    reason: str = ""


def load_encoding() -> metric.UnifiedEncoding:
    assignment = json.loads(ASSIGNMENT.read_text())
    errors = (
        incidence_round.validate_cut(assignment)
        + metric.validate_incidence_proposal(assignment)
        + metric.validate_retained_first_apex_rich(assignment)
    )
    if errors:
        raise RuntimeError("invalid frozen assignment: " + "; ".join(errors))
    return metric.UnifiedEncoding(assignment)


def canonical_clauses(encoding: metric.UnifiedEncoding) -> list[metric.Clause]:
    clauses = encoding.clauses_through("blocker_exactness")
    if len(clauses) != EXPECTED_CLAUSE_COUNT:
        raise RuntimeError(
            f"expected {EXPECTED_CLAUSE_COUNT} clauses, found {len(clauses)}"
        )
    names = [clause.name for clause in clauses]
    if len(names) != len(set(names)):
        raise RuntimeError("canonical clause names are not unique")
    return clauses


def selected_row_identity_audit(
    encoding: metric.UnifiedEncoding,
) -> dict[str, Any]:
    """Verify selected_rows[s] = point_k4_rows[blockers[s]] for all sources."""
    assignment = encoding.a
    selected = [sorted(map(int, row)) for row in assignment["selected_rows"]]
    point_rows = [sorted(map(int, row)) for row in assignment["point_k4_rows"]]
    blockers = list(map(int, assignment["blockers"]))
    records = []
    mismatches = []
    for source in range(metric.N):
        record = {
            "source": source,
            "blocker": blockers[source],
            "selected_row": selected[source],
            "blocker_k4_row": point_rows[blockers[source]],
            "equal": selected[source] == point_rows[blockers[source]],
        }
        records.append(record)
        if not record["equal"]:
            mismatches.append(record)
    if mismatches:
        raise RuntimeError(f"selected/K4 row mismatch: {mismatches[:3]}")
    return {
        "source_count": metric.N,
        "match_count": metric.N - len(mismatches),
        "mismatch_count": len(mismatches),
        "records": records,
    }


def witness_substitutions(
    encoding: metric.UnifiedEncoding,
    witness: dict[int, tuple[int, int]],
) -> tuple[list[tuple[z3.ExprRef, z3.ExprRef]], bool]:
    sqrt3 = z3.Sqrt(z3.RealVal(3))
    substitutions: list[tuple[z3.ExprRef, z3.ExprRef]] = []
    all_rational = True
    for point in range(metric.N):
        a, b = witness.get(point, (0, 0))
        x_value = z3.RealVal(2 * a + b) / 2
        y_value = z3.RealVal(b) * sqrt3 / 2
        substitutions.extend(
            [(encoding.x[point], x_value), (encoding.y[point], y_value)]
        )
        all_rational = all_rational and b == 0
    return substitutions, all_rational


def exact_witness_validation(
    encoding: metric.UnifiedEncoding,
    clauses: Sequence[metric.Clause],
    witness: dict[int, tuple[int, int]],
) -> dict[str, Any]:
    """Replay a triangular-lattice witness by exact Z3 substitution."""
    substitutions, all_rational = witness_substitutions(encoding, witness)
    failures = []
    for clause in clauses:
        value = z3.simplify(z3.substitute(clause.formula, *substitutions))
        if not z3.is_true(value):
            failures.append({"name": clause.name, "value": value.sexpr()})
    if failures:
        raise RuntimeError(f"exact triangular witness failed: {failures[:3]}")
    return {
        "exact_z3_substitution": "PASS",
        "fraction_replay": "PASS" if all_rational else "SKIP_ALGEBRAIC",
        "coordinate_field": "Q" if all_rational else "Q(sqrt(3))",
        "triangular_lattice_coordinates": {
            str(point): list(witness.get(point, (0, 0))) for point in range(metric.N)
        },
    }


def exact_substituted_clauses(
    encoding: metric.UnifiedEncoding,
    clauses: Sequence[metric.Clause],
    witness: dict[int, tuple[int, int]],
) -> list[metric.Clause]:
    """Materialize the exact drop-one substitution for external replay."""
    substitutions, _all_rational = witness_substitutions(encoding, witness)
    result = []
    for clause in clauses:
        formula = z3.simplify(z3.substitute(clause.formula, *substitutions))
        if not z3.is_true(formula):
            raise RuntimeError(f"non-true exact substitution: {clause.name}")
        result.append(
            metric.Clause(
                f"substituted_{clause.name}",
                formula,
                f"exact substitution of {clause.source}",
            )
        )
    return result


def witness_clauses(
    encoding: metric.UnifiedEncoding,
    witness: dict[int, tuple[int, int]],
) -> list[metric.Clause]:
    """Turn an exact triangular-lattice witness into solver constraints."""
    algebraic = any(b != 0 for a, b in witness.values())
    sqrt3 = z3.Real("witness_sqrt3")
    clauses: list[metric.Clause] = []
    if algebraic:
        clauses.extend(
            [
                metric.Clause(
                    "witness_sqrt3_positive",
                    sqrt3 > 0,
                    "exact Q(sqrt(3)) SAT witness",
                ),
                metric.Clause(
                    "witness_sqrt3_square",
                    sqrt3 * sqrt3 == 3,
                    "exact Q(sqrt(3)) SAT witness",
                ),
            ]
        )
    for point in range(metric.N):
        a, b = witness.get(point, (0, 0))
        clauses.extend(
            [
                metric.Clause(
                    f"witness_x_{point}",
                    encoding.x[point] == z3.RealVal(2 * a + b) / 2,
                    "exact drop-one SAT witness",
                ),
                metric.Clause(
                    f"witness_y_{point}",
                    encoding.y[point]
                    == (z3.RealVal(b) * sqrt3 / 2 if algebraic else 0),
                    "exact drop-one SAT witness",
                ),
            ]
        )
    return clauses


def fresh_z3_check(
    clauses: Sequence[metric.Clause], timeout_ms: int
) -> tuple[Verdict, z3.ModelRef | None, z3.Solver]:
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=9717)
    solver.add(*[clause.formula for clause in clauses])
    start = time.monotonic()
    result = solver.check()
    seconds = round(time.monotonic() - start, 6)
    if result == z3.sat:
        return Verdict("SAT", seconds), solver.model(), solver
    if result == z3.unsat:
        return Verdict("UNSAT", seconds), None, solver
    return Verdict("UNKNOWN", seconds, solver.reason_unknown()), None, solver


def validate_sat_model(
    encoding: metric.UnifiedEncoding,
    clauses: list[metric.Clause],
    model: z3.ModelRef,
) -> dict[str, Any]:
    substitution_errors, values = metric.exact_substitution_validate(
        encoding, clauses, model
    )
    fraction_status, fraction_errors = metric.fraction_validate(
        encoding, clauses, model
    )
    if substitution_errors:
        raise RuntimeError(
            "exact Z3 substitution failed: " + "; ".join(substitution_errors[:3])
        )
    if fraction_status == "FAIL":
        raise RuntimeError("Fraction replay failed: " + "; ".join(fraction_errors[:3]))
    return {
        "exact_z3_substitution": "PASS",
        "fraction_replay": fraction_status,
        "all_values_rational": all(v["kind"] == "rational" for v in values.values()),
        "model_values": values,
    }


def deletion_minimize(
    encoding: metric.UnifiedEncoding,
    clauses: list[metric.Clause],
    timeout_ms: int,
) -> tuple[list[metric.Clause], list[dict[str, Any]]]:
    """One deterministic global deletion pass; final drop-one is rechecked later."""
    core = list(clauses)
    trace: list[dict[str, Any]] = []
    for trial_index, clause in enumerate(clauses):
        candidate = [item for item in core if item.name != clause.name]
        if len(candidate) == len(core):
            continue
        verdict, model, _solver = fresh_z3_check(candidate, timeout_ms)
        record: dict[str, Any] = {
            "trial": trial_index,
            "dropped": clause.name,
            "candidate_clause_count": len(candidate),
            "status": verdict.status,
            "seconds": verdict.seconds,
        }
        if verdict.status == "UNSAT":
            core = candidate
            record["action"] = "DROP"
        elif verdict.status == "SAT":
            if model is None:
                raise AssertionError("SAT without model")
            replay = validate_sat_model(encoding, candidate, model)
            record.update(
                {
                    "action": "KEEP",
                    "exact_z3_substitution": replay["exact_z3_substitution"],
                    "fraction_replay": replay["fraction_replay"],
                    "all_values_rational": replay["all_values_rational"],
                }
            )
        else:
            raise RuntimeError(
                f"fail-closed UNKNOWN dropping {clause.name}: {verdict.reason}"
            )
        trace.append(record)
    return core, trace


def tracked_clause_seed(
    clauses: list[metric.Clause], timeout_ms: int
) -> tuple[list[metric.Clause], dict[str, Any]]:
    """Extract an external-Z3 seed while all 1070 clauses are asserted."""
    labels = {
        f"clause_track_{index:04d}": clause for index, clause in enumerate(clauses)
    }
    plain = metric.one_check_smt2(clauses)
    declaration_prefix = plain[: plain.index("(assert")]
    lines = ["(set-option :produce-unsat-cores true)", declaration_prefix.rstrip()]
    for label, clause in labels.items():
        lines.append(f"(assert (! {clause.formula.sexpr()} :named {label}))")
    lines.extend(["(check-sat)", "(get-unsat-core)"])
    artifact = GENERATED / "tracked_global_seed.smt2"
    artifact.write_text("\n".join(lines) + "\n")
    if artifact.read_text().count("(check-sat)") != 1:
        raise RuntimeError("tracked global seed is not one-check-sat")
    cmd = ["z3", "-smt2", f"-t:{timeout_ms}", str(artifact)]
    start = time.monotonic()
    proc = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        timeout=timeout_ms / 1000 + 20,
        check=False,
    )
    seconds = round(time.monotonic() - start, 6)
    (LOGS / "tracked_global_seed_z3.log").write_text(
        "COMMAND\n"
        + " ".join(cmd)
        + "\n\nSTDOUT\n"
        + proc.stdout
        + "\nSTDERR\n"
        + proc.stderr
    )
    if parse_solver_status(proc.stdout) != "UNSAT":
        raise RuntimeError(f"tracked global seed failed: {proc.stdout[:200]}")
    core_labels = set(re.findall(r"clause_track_[0-9]{4}", proc.stdout))
    if not core_labels:
        raise RuntimeError("tracked global seed returned an empty core")
    selected_clause_names = {labels[name].name for name in core_labels}
    seed = [clause for clause in clauses if clause.name in selected_clause_names]
    replay_artifact = GENERATED / "tracked_seed_replay.smt2"
    write_smt2(replay_artifact, seed)
    replay = run_cli(
        "z3",
        replay_artifact,
        timeout_ms,
        LOGS / "tracked_seed_replay_z3.log",
    )
    if replay.status != "UNSAT":
        raise RuntimeError(f"tracked clause seed failed fresh replay: {replay.status}")
    return seed, {
        "universe_clause_count": len(clauses),
        "seed_clause_count": len(seed),
        "extracted_by": (
            "external Z3 named assertions over the complete canonical universe"
        ),
        "artifact": str(artifact.relative_to(HERE)),
        "check_sat_count": artifact.read_text().count("(check-sat)"),
        "z3_version": subprocess.run(
            ["z3", "-version"], capture_output=True, text=True, check=False
        ).stdout.strip(),
        "tracked_check_seconds": seconds,
        "fresh_seed_replay": replay.status,
        "seed_names": [clause.name for clause in seed],
    }


def semantic_packets(
    clauses: Sequence[metric.Clause],
) -> OrderedDict[str, list[metric.Clause]]:
    """Group clauses by generator stage and source-level API/meaning string."""
    stage_of: dict[str, str] = {}
    encoding = load_encoding()
    for stage, members in encoding.groups.items():
        for clause in members:
            stage_of[clause.name] = stage
    packets: OrderedDict[str, list[metric.Clause]] = OrderedDict()
    for clause in clauses:
        key = f"{stage_of[clause.name]}::{clause.source}"
        packets.setdefault(key, []).append(clause)
    return packets


def group_deletion_minimize(
    encoding: metric.UnifiedEncoding,
    packets: OrderedDict[str, list[metric.Clause]],
    seed_packets: list[str],
    timeout_ms: int,
) -> tuple[list[str], list[dict[str, Any]]]:
    live = list(seed_packets)
    trace: list[dict[str, Any]] = []
    for packet in list(packets):
        candidate_packets = [name for name in live if name != packet]
        candidate = [clause for name in candidate_packets for clause in packets[name]]
        verdict, model, _solver = fresh_z3_check(candidate, timeout_ms)
        record: dict[str, Any] = {
            "packet": packet,
            "packet_clause_count": len(packets[packet]),
            "candidate_packet_count": len(candidate_packets),
            "candidate_clause_count": len(candidate),
            "status": verdict.status,
            "seconds": verdict.seconds,
        }
        if verdict.status == "UNSAT":
            live = candidate_packets
            record["action"] = "DROP"
        elif verdict.status == "SAT":
            if model is None:
                raise AssertionError("SAT without model")
            replay = validate_sat_model(encoding, candidate, model)
            record.update(
                {
                    "action": "KEEP",
                    "exact_z3_substitution": replay["exact_z3_substitution"],
                    "fraction_replay": replay["fraction_replay"],
                }
            )
        else:
            raise RuntimeError(f"fail-closed UNKNOWN dropping packet {packet}")
        trace.append(record)
    return live, trace


def tracked_packet_seed(
    packets: OrderedDict[str, list[metric.Clause]], timeout_ms: int
) -> tuple[list[str], dict[str, Any]]:
    """Extract an UNSAT source-packet seed from the complete packet universe."""
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=9717, unsat_core=True)
    labels: dict[str, str] = {}
    for index, (packet, clauses) in enumerate(packets.items()):
        label = z3.Bool(f"packet_track_{index:03d}")
        labels[label.decl().name()] = packet
        solver.assert_and_track(z3.And(*[c.formula for c in clauses]), label)
    start = time.monotonic()
    result = solver.check()
    seconds = round(time.monotonic() - start, 6)
    if result != z3.unsat:
        raise RuntimeError(
            "tracked packet seed failed: "
            + (str(result) if result != z3.unknown else solver.reason_unknown())
        )
    names = {label.decl().name() for label in solver.unsat_core()}
    seed = [packet for packet in packets if packet in {labels[name] for name in names}]
    replay_clauses = [clause for packet in seed for clause in packets[packet]]
    replay, _model, _fresh = fresh_z3_check(replay_clauses, timeout_ms)
    if replay.status != "UNSAT":
        raise RuntimeError(f"tracked packet seed failed fresh replay: {replay.status}")
    return seed, {
        "universe_packet_count": len(packets),
        "seed_packet_count": len(seed),
        "extracted_by": "Z3 assert_and_track over complete semantic packet universe",
        "tracked_check_seconds": seconds,
        "fresh_seed_replay": replay.status,
        "seed_packets": seed,
    }


def write_smt2(path: Path, clauses: Iterable[metric.Clause]) -> None:
    text = metric.one_check_smt2(clauses)
    if text.count("(check-sat)") != 1:
        raise RuntimeError(f"not one-check-sat: {path}")
    path.write_text(text)


def parse_solver_status(text: str) -> str:
    statuses = [
        line.strip().upper()
        for line in text.splitlines()
        if line.strip().lower() in {"sat", "unsat", "unknown"}
    ]
    return statuses[0] if len(statuses) == 1 else f"ERROR:status_count_{len(statuses)}"


def run_cli(
    solver_name: str, artifact: Path, timeout_ms: int, log_path: Path
) -> Verdict:
    if solver_name == "z3":
        cmd = ["z3", "-smt2", f"-t:{timeout_ms}", str(artifact)]
    elif solver_name == "cvc5":
        cmd = [
            "cvc5",
            "--lang=smt2",
            "--force-logic=QF_NRA",
            "--nl-cov",
            f"--tlimit={timeout_ms}",
            str(artifact),
        ]
    else:
        raise ValueError(solver_name)
    start = time.monotonic()
    proc = subprocess.run(
        cmd,
        capture_output=True,
        text=True,
        timeout=timeout_ms / 1000 + 20,
        check=False,
    )
    log_path.write_text(
        "COMMAND\n"
        + " ".join(cmd)
        + "\n\nSTDOUT\n"
        + proc.stdout
        + "\nSTDERR\n"
        + proc.stderr
    )
    return Verdict(parse_solver_status(proc.stdout), round(time.monotonic() - start, 6))


def direct_opposites(clauses: Sequence[metric.Clause]) -> list[dict[str, str]]:
    normalized = {
        z3.simplify(clause.formula).sexpr(): clause.name for clause in clauses
    }
    found: list[dict[str, str]] = []
    seen: set[tuple[str, str]] = set()
    for clause in clauses:
        formula = z3.simplify(clause.formula)
        opposite = normalized.get(z3.simplify(z3.Not(formula)).sexpr())
        if opposite is None or opposite == clause.name:
            continue
        pair = tuple(sorted((clause.name, opposite)))
        if pair not in seen:
            seen.add(pair)
            found.append({"left": pair[0], "right": pair[1]})
    return found


def tiny_controls(
    encoding: metric.UnifiedEncoding,
) -> dict[str, list[metric.Clause]]:
    x = encoding.x[0]
    return {
        "known_sat": [
            metric.Clause("x_zero", x == 0, "hand-audited control"),
            metric.Clause("x_not_one", x != 1, "hand-audited control"),
        ],
        "known_malformed_unsat": [
            metric.Clause("x_zero", x == 0, "hand-audited control"),
            metric.Clause("x_not_zero", x != 0, "hand-audited malformed control"),
        ],
    }


def dual_replay(
    name: str,
    encoding: metric.UnifiedEncoding,
    clauses: list[metric.Clause],
    timeout_ms: int,
) -> dict[str, Any]:
    artifact = GENERATED / f"{name}.smt2"
    write_smt2(artifact, clauses)
    result: dict[str, Any] = {
        "name": name,
        "clause_count": len(clauses),
        "artifact": str(artifact.relative_to(HERE)),
        "check_sat_count": artifact.read_text().count("(check-sat)"),
        "solvers": {},
    }
    for solver_name in ("z3", "cvc5"):
        verdict = run_cli(
            solver_name,
            artifact,
            timeout_ms,
            LOGS / f"{name}_{solver_name}.log",
        )
        result["solvers"][solver_name] = {
            "status": verdict.status,
            "seconds": verdict.seconds,
        }
    internal, model, _solver = fresh_z3_check(clauses, timeout_ms)
    result["internal_z3"] = {"status": internal.status, "seconds": internal.seconds}
    if internal.status == "SAT":
        if model is None:
            raise AssertionError("SAT without model")
        model_replay = validate_sat_model(encoding, clauses, model)
        model_path = GENERATED / f"{name}_exact_model.json"
        model_path.write_text(
            json.dumps(model_replay["model_values"], indent=2, sort_keys=True) + "\n"
        )
        result["exact_model_validation"] = {
            "exact_z3_substitution": model_replay["exact_z3_substitution"],
            "fraction_replay": model_replay["fraction_replay"],
            "all_values_rational": model_replay["all_values_rational"],
            "model": str(model_path.relative_to(HERE)),
        }
    return result


def external_only_replay(
    name: str,
    clauses: list[metric.Clause],
    timeout_ms: int,
) -> dict[str, Any]:
    """Replay a large query externally, avoiding the older in-process Z3."""
    artifact = GENERATED / f"{name}.smt2"
    write_smt2(artifact, clauses)
    result: dict[str, Any] = {
        "name": name,
        "clause_count": len(clauses),
        "artifact": str(artifact.relative_to(HERE)),
        "check_sat_count": artifact.read_text().count("(check-sat)"),
        "solvers": {},
    }
    for solver_name in ("z3", "cvc5"):
        verdict = run_cli(
            solver_name,
            artifact,
            timeout_ms,
            LOGS / f"{name}_{solver_name}.log",
        )
        result["solvers"][solver_name] = {
            "status": verdict.status,
            "seconds": verdict.seconds,
        }
    return result


def witnessed_drop_replay(
    name: str,
    encoding: metric.UnifiedEncoding,
    candidate: list[metric.Clause],
    dropped: metric.Clause,
    timeout_ms: int,
) -> dict[str, Any]:
    """Prove a raw drop-one SAT by exhibiting an exact constrained witness."""
    witness = DROP_WITNESSES[dropped.name]
    exact = exact_witness_validation(encoding, candidate, witness)
    substituted = exact_substituted_clauses(encoding, candidate, witness)
    replay = external_only_replay(name, substituted, timeout_ms)
    statuses = {result["status"] for result in replay["solvers"].values()}
    if statuses != {"SAT"}:
        raise RuntimeError(f"witnessed drop-one is not dual SAT: {name}: {statuses}")
    replay.update(
        {
            "dropped": dropped.name,
            "base_drop_one_clause_count": len(candidate),
            "exact_substituted_clause_count": len(substituted),
            "query_kind": (
                "external replay of the exact Q(sqrt(3)) substitution; the "
                "separately verified substitution proves the raw drop-one SAT"
            ),
            "exact_model_validation": exact,
        }
    )
    return replay


def derived_distance_chain(core: Sequence[metric.Clause]) -> dict[str, Any]:
    """Record the hand-checked equality path underlying the frozen MUS."""
    equality_names = [
        "k4_equal_8_3",
        "k4_equal_3_8",
        "k4_equal_1_3",
        "k4_equal_1_7",
        "k4_equal_7_1",
        "k4_equal_7_13",
        "k4_equal_13_7",
        "k4_equal_13_8",
    ]
    disequality_name = "blocker_exact_8_13"
    names = {clause.name for clause in core}
    expected = set(equality_names + [disequality_name])
    if names != expected:
        return {
            "status": "NOT_THE_EXPECTED_CHAIN",
            "expected_names": sorted(expected),
            "actual_names": sorted(names),
        }
    return {
        "status": "PASS",
        "direct_syntactic_opposite": False,
        "kind": (
            "derived metric contradiction by squared-distance symmetry and "
            "transitivity of eight K4 radius equalities"
        ),
        "equality_clauses": equality_names,
        "distance_term_path": [
            "d2(8,13)",
            "d2(13,3)",
            "d2(13,7)",
            "d2(7,13)",
            "d2(7,0)",
            "d2(7,1)",
            "d2(1,7)",
            "d2(1,2)",
            "d2(1,3)",
            "d2(3,1)",
            "d2(3,8)",
            "d2(8,3)",
            "d2(8,0)",
        ],
        "disequality_clause": disequality_name,
        "disequality": "d2(8,13) != d2(8,0)",
    }


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def write_sha_manifest() -> None:
    paths = [
        ASSIGNMENT,
        PARENT_GENERATOR,
        HERE / "minimize.py",
        HERE / "verify.py",
        HERE / "tests/test_minimize.py",
        HERE / "README.md",
        HERE / "RESULTS.md",
        HERE / "INGRESS-CONTRACT.md",
        HERE / "CONVO-POST.md",
        HERE / "nthdegree-source-map.txt",
        HERE / "nthdegree-source-handles.txt",
    ]
    paths.extend(sorted(GENERATED.glob("*")))
    paths.extend(sorted(LOGS.glob("*")))
    paths.append(HERE / "results.json")
    lines = []
    for path in paths:
        if path.is_file():
            try:
                label = str(path.relative_to(HERE))
            except ValueError:
                label = str(path.relative_to(PARENT))
                label = "../" + label
            lines.append(f"{sha256(path)}  {label}")
    (HERE / "SHA256SUMS").write_text("\n".join(lines) + "\n")


def run(timeout_ms: int) -> dict[str, Any]:
    GENERATED.mkdir(parents=True, exist_ok=True)
    LOGS.mkdir(parents=True, exist_ok=True)
    encoding = load_encoding()
    clauses = canonical_clauses(encoding)
    row_identity = selected_row_identity_audit(encoding)
    canonical_replay = external_only_replay(
        "canonical_blocker_exactness", clauses, timeout_ms
    )
    canonical_statuses = {
        record["status"] for record in canonical_replay["solvers"].values()
    }
    if canonical_statuses != {"UNSAT"}:
        raise RuntimeError(
            f"canonical 1070-clause query is not dual UNSAT: {canonical_statuses}"
        )

    clause_seed, clause_seed_record = tracked_clause_seed(clauses, timeout_ms)
    clause_core = clause_seed
    clause_trace = []
    for clause in clause_core:
        candidate = [item for item in clause_core if item.name != clause.name]
        exact = exact_witness_validation(
            encoding, candidate, DROP_WITNESSES[clause.name]
        )
        clause_trace.append(
            {
                "dropped": clause.name,
                "candidate_clause_count": len(candidate),
                "status": "SAT",
                "action": "KEEP",
                "evidence": "exact triangular-lattice witness",
                "exact_z3_substitution": exact["exact_z3_substitution"],
                "fraction_replay": exact["fraction_replay"],
                "coordinate_field": exact["coordinate_field"],
            }
        )
    packets = semantic_packets(clauses)
    stage_by_name = {
        clause.name: stage
        for stage, members in encoding.groups.items()
        for clause in members
    }
    core_source_groups: OrderedDict[str, list[str]] = OrderedDict()
    for clause in clause_core:
        key = f"{stage_by_name[clause.name]}::{clause.source}"
        core_source_groups.setdefault(key, []).append(clause.name)

    replays: list[dict[str, Any]] = []
    replays.append(external_only_replay("clause_core", clause_core, timeout_ms))
    for index, dropped in enumerate(clause_core):
        replays.append(
            witnessed_drop_replay(
                f"clause_core_drop_{index:02d}_{dropped.name}",
                encoding,
                [c for c in clause_core if c.name != dropped.name],
                dropped,
                timeout_ms,
            )
        )
    for name, control in tiny_controls(encoding).items():
        replays.append(dual_replay(name, encoding, control, timeout_ms))
    for name, control in metric.malformed_controls(encoding).items():
        replays.append(external_only_replay("parent_" + name, control, timeout_ms))

    results: dict[str, Any] = {
        "scope": (
            "one frozen exact-17 direct-crossed assignment; finite solver "
            "diagnostic only; no CE, universal, or Lean closure claim"
        ),
        "classification": (
            "source-entitled preflight cut for this frozen incidence motif; "
            "not a universal FreshThird producer"
        ),
        "canonical_clause_count": len(clauses),
        "canonical_replay": canonical_replay,
        "selected_row_identity": row_identity,
        "direct_syntactic_opposites": direct_opposites(clauses),
        "tracked_clause_seed": clause_seed_record,
        "clause_core": [
            {
                "name": clause.name,
                "source": clause.source,
                "formula": z3.simplify(clause.formula).sexpr(),
            }
            for clause in clause_core
        ],
        "clause_core_count": len(clause_core),
        "clause_minimization_trace": clause_trace,
        "core_direct_syntactic_opposites": direct_opposites(clause_core),
        "derived_distance_chain": derived_distance_chain(clause_core),
        "packet_inventory": [
            {"packet": name, "clause_count": len(members)}
            for name, members in packets.items()
        ],
        "core_source_groups": [
            {"group": name, "clause_names": members}
            for name, members in core_source_groups.items()
        ],
        "replays": replays,
    }
    (HERE / "results.json").write_text(
        json.dumps(results, indent=2, sort_keys=True) + "\n"
    )
    write_sha_manifest()
    return results


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=120_000)
    args = parser.parse_args()
    results = run(args.timeout_ms)
    print(
        "canonical="
        + str(results["canonical_clause_count"])
        + " clause-core="
        + str(results["clause_core_count"])
        + " row-identity-mismatches="
        + str(results["selected_row_identity"]["mismatch_count"])
    )
    for clause in results["clause_core"]:
        print(f"{clause['name']}: {clause['source']}")


if __name__ == "__main__":
    main()
