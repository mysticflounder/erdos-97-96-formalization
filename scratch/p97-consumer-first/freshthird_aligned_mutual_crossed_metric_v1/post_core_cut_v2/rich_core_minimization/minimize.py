"""Globally minimize the frozen post-core-cut-v2 rich-radius contradiction.

This is a diagnostic for one exact-17 direct-crossed assignment.  It rebuilds
the 921 canonical clauses from the parent generator, performs deterministic
fresh-solver deletion minimization, and independently replays the final core
and every drop-one with the Z3 CLI and cvc5.  No result here is a universal or
Lean closure claim.
"""

from __future__ import annotations

import argparse
import hashlib
import json
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
ASSIGNMENT = PARENT / "generated/post_core_cut_v2_assignment.json"
PARENT_GENERATOR = PARENT / "unified_metric.py"
sys.path.insert(0, str(PARENT))

import unified_metric as metric

EXPECTED_CLAUSE_COUNT = 921


@dataclass(frozen=True)
class Verdict:
    status: str
    seconds: float
    reason: str = ""


def load_encoding() -> metric.UnifiedEncoding:
    assignment = json.loads(ASSIGNMENT.read_text())
    errors = metric.validate_incidence_proposal(
        assignment
    ) + metric.validate_retained_first_apex_rich(assignment)
    if errors:
        raise RuntimeError("invalid frozen assignment: " + "; ".join(errors))
    return metric.UnifiedEncoding(assignment)


def canonical_clauses(encoding: metric.UnifiedEncoding) -> list[metric.Clause]:
    clauses = encoding.clauses_through("rich_radius_pattern")
    if len(clauses) != EXPECTED_CLAUSE_COUNT:
        raise RuntimeError(
            f"expected {EXPECTED_CLAUSE_COUNT} clauses, found {len(clauses)}"
        )
    names = [clause.name for clause in clauses]
    if len(names) != len(set(names)):
        raise RuntimeError("canonical clause names are not unique")
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
        raise RuntimeError(
            "Fraction replay failed: " + "; ".join(fraction_errors[:3])
        )
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
    """Extract an UNSAT seed while every one of the 921 clauses is available."""
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms, random_seed=9717, unsat_core=True)
    labels: dict[str, metric.Clause] = {}
    for index, clause in enumerate(clauses):
        label = z3.Bool(f"clause_track_{index:04d}")
        labels[label.decl().name()] = clause
        solver.assert_and_track(clause.formula, label)
    start = time.monotonic()
    result = solver.check()
    seconds = round(time.monotonic() - start, 6)
    if result != z3.unsat:
        raise RuntimeError(
            "tracked global seed failed: "
            + (str(result) if result != z3.unknown else solver.reason_unknown())
        )
    core_names = {label.decl().name() for label in solver.unsat_core()}
    selected_clause_names = {labels[name].name for name in core_names}
    seed = [clause for clause in clauses if clause.name in selected_clause_names]
    replay, _model, _fresh = fresh_z3_check(seed, timeout_ms)
    if replay.status != "UNSAT":
        raise RuntimeError(f"tracked clause seed failed fresh replay: {replay.status}")
    return seed, {
        "universe_clause_count": len(clauses),
        "seed_clause_count": len(seed),
        "extracted_by": "Z3 assert_and_track over the complete canonical universe",
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
        candidate = [
            clause for name in candidate_packets for clause in packets[name]
        ]
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
    return Verdict(
        parse_solver_status(proc.stdout), round(time.monotonic() - start, 6)
    )


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
        HERE / "CONVO-POST.md",
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
    initial, _model, _solver = fresh_z3_check(clauses, timeout_ms)
    if initial.status != "UNSAT":
        raise RuntimeError(f"canonical 921-clause query is not UNSAT: {initial}")

    clause_seed, clause_seed_record = tracked_clause_seed(clauses, timeout_ms)
    clause_core, clause_trace = deletion_minimize(
        encoding, clause_seed, timeout_ms
    )
    packets = semantic_packets(clauses)
    packet_seed, packet_seed_record = tracked_packet_seed(packets, timeout_ms)
    packet_names, packet_trace = group_deletion_minimize(
        encoding, packets, packet_seed, timeout_ms
    )
    packet_core = [clause for name in packet_names for clause in packets[name]]

    replays: list[dict[str, Any]] = []
    replays.append(dual_replay("clause_core", encoding, clause_core, timeout_ms))
    for index, dropped in enumerate(clause_core):
        replays.append(
            dual_replay(
                f"clause_core_drop_{index:02d}_{dropped.name}",
                encoding,
                [c for c in clause_core if c.name != dropped.name],
                timeout_ms,
            )
        )
    replays.append(dual_replay("packet_core", encoding, packet_core, timeout_ms))
    for index, packet in enumerate(packet_names):
        dropped_packet = [name for name in packet_names if name != packet]
        candidate = [
            clause for name in dropped_packet for clause in packets[name]
        ]
        replays.append(
            dual_replay(
                f"packet_core_drop_{index:02d}", encoding, candidate, timeout_ms
            )
        )
    for name, control in tiny_controls(encoding).items():
        replays.append(dual_replay(name, encoding, control, timeout_ms))
    for name, control in metric.malformed_controls(encoding).items():
        replays.append(
            dual_replay("parent_" + name, encoding, control, timeout_ms)
        )

    results: dict[str, Any] = {
        "scope": (
            "one frozen exact-17 direct-crossed assignment; finite solver "
            "diagnostic only; no CE, universal, or Lean closure claim"
        ),
        "canonical_clause_count": len(clauses),
        "canonical_z3_status": initial.status,
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
        "packet_inventory": [
            {"packet": name, "clause_count": len(members)}
            for name, members in packets.items()
        ],
        "tracked_packet_seed": packet_seed_record,
        "packet_core": [
            {"packet": name, "clause_count": len(packets[name])}
            for name in packet_names
        ],
        "packet_core_clause_count": len(packet_core),
        "packet_minimization_trace": packet_trace,
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
        + " packet-core-clauses="
        + str(results["packet_core_clause_count"])
    )
    for clause in results["clause_core"]:
        print(f"{clause['name']}: {clause['source']}")


if __name__ == "__main__":
    main()
