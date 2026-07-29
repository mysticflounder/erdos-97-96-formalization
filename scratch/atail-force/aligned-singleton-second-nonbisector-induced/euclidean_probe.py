#!/usr/bin/env python3
"""Bounded exact R^2 realizability probe for the cegar-v4 robust/new survivor.

This does not treat strict Kalmanson as sufficient.  It reconstructs the
survivor's unique required-row truth assignment from its recorded cyclic order,
then asks for actual coordinates in R^2.  Strict convexity in the recorded
order is encoded by requiring every directed polygon edge to have every other
vertex strictly on its left.  Row incidences use squared Euclidean distances.

Two sound formulas are checked:

* ``forced_equalities``: strict convex order plus every row equality forced by
  the saved order, outer abstraction, and checkpoint cuts.
* ``full_rows``: adds every false row as a squared-distance disequality.  The
  JSON omitted those row atoms, but an exact QF_LIA replay proves that the saved
  order uniquely determines all 160 truth values in the historical encoding.

Z3 and cvc5 are discovery/checking oracles, not proof-producing kernels.  Every
timeout or UNKNOWN is reported fail-closed as no verdict.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
CEGAR = HERE / "cegar.py"
RESULT = HERE / "cegar-v4-robust-new.json"
CHECKPOINT = HERE / "cegar-v4-robust-new.checkpoint.json"
OUTPUT = HERE / "euclidean-probe-result.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_cegar() -> Any:
    spec = importlib.util.spec_from_file_location("atail_induced_cegar", CEGAR)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {CEGAR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def reconstruct_target(timeout_ms: int) -> dict[str, Any]:
    """Pin the saved order and classify which required row atoms are forced."""
    payload = json.loads(RESULT.read_text())
    classes = payload["survivor"]["alias_classes_in_order"]
    if any(len(cls) != 1 for cls in classes):
        raise RuntimeError("probe currently requires the recorded all-singleton survivor")
    order = [cls[0] for cls in classes]

    cg = load_cegar()

    # cegar.py has since gained apex_triple_exclusion.  The saved result's
    # constraint-count ledger proves that block was absent when the survivor
    # was generated, so replay the historical constructor without that block.
    class ArtifactOuterMap(cg.OuterMap):
        def _add_apex_triple_exclusion(self) -> None:
            pass

    outer = ArtifactOuterMap(
        timeout_ms=timeout_ms,
        random_seed=0,
        z_branch="new",
        escape_arm="robust",
    )
    recorded_counts = payload["outer_constraint_counts"]
    current_counts = dict(sorted(outer.counts.items()))
    if current_counts != recorded_counts:
        # This directory is an active shared scratch lane.  If cegar.py moves
        # again, retain the exact classification produced while its historical
        # ledger did match, rather than silently probing the new encoding.
        if not OUTPUT.exists():
            raise RuntimeError(
                "cegar.py drifted and no frozen exact target is available"
            )
        frozen = json.loads(OUTPUT.read_text())
        frozen_target = frozen.get("target", {})
        frozen_inputs = frozen.get("inputs", {})
        if (
            frozen_target.get("order") != order
            or frozen_target.get("forced_true_row_count") != 18
            or frozen_target.get("forced_false_row_count") != 142
            or frozen_target.get("variable_row_count") != 0
            or frozen_target.get("row_assignment_uniqueness") != "UNSAT"
            or frozen_inputs.get(RESULT.name) != sha256(RESULT)
            or frozen_inputs.get(CHECKPOINT.name) != sha256(CHECKPOINT)
        ):
            raise RuntimeError("frozen target failed provenance validation")
        return {
            "order": order,
            "forced_true_rows": frozen_target["forced_true_rows"],
            "forced_false_rows": frozen_target["forced_false_rows"],
            "variable_rows": [],
            "row_assignment_replay": (
                "FROZEN_FROM_PRIOR_EXACT_LEDGER_MATCHING_REPLAY"
            ),
            "row_assignment_uniqueness": "UNSAT",
            "replay_source_sha256": frozen_inputs.get(CEGAR.name),
        }
    checkpoint = json.loads(CHECKPOINT.read_text())
    for raw_cut in checkpoint["cuts"]:
        outer.add_cut([cg.Literal.from_json(raw) for raw in raw_cut])

    for rank, name in enumerate(order):
        outer.solver.add(outer.rank[outer.ix(name)] == rank)
    status = outer.solver.check()
    if status != z3.sat:
        detail = outer.solver.reason_unknown() if status == z3.unknown else ""
        raise RuntimeError(f"saved cyclic order did not replay SAT: {status} {detail}")
    model = outer.solver.model()

    witness_row_values: dict[tuple[str, str, str], bool] = {}
    for key in sorted(outer.required_rows):
        witness_row_values[key] = z3.is_true(
            model.eval(outer.rows[key], model_completion=True)
        )

    changed = []
    for key, value in witness_row_values.items():
        atom = outer.rows[key]
        changed.append(z3.Not(atom) if value else atom)
    outer.solver.push()
    outer.solver.add(z3.Or(*changed))
    uniqueness = outer.solver.check()
    outer.solver.pop()

    forced_true: list[list[str]] = []
    forced_false: list[list[str]] = []
    variable: list[list[str]] = []
    for key in sorted(outer.required_rows):
        atom = outer.rows[key]
        outer.solver.push()
        outer.solver.add(z3.Not(atom))
        can_be_false = outer.solver.check()
        false_reason = (
            outer.solver.reason_unknown() if can_be_false == z3.unknown else ""
        )
        outer.solver.pop()
        outer.solver.push()
        outer.solver.add(atom)
        can_be_true = outer.solver.check()
        true_reason = (
            outer.solver.reason_unknown() if can_be_true == z3.unknown else ""
        )
        outer.solver.pop()
        if can_be_false == z3.unknown or can_be_true == z3.unknown:
            raise RuntimeError(
                f"row classification UNKNOWN for {key}: "
                f"false={false_reason!r}, true={true_reason!r}"
            )
        if can_be_false == z3.unsat and can_be_true == z3.sat:
            forced_true.append(list(key))
        elif can_be_true == z3.unsat and can_be_false == z3.sat:
            forced_false.append(list(key))
        elif can_be_true == z3.sat and can_be_false == z3.sat:
            variable.append(list(key))
        else:
            raise RuntimeError(f"inconsistent pinned outer map at row {key}")

    return {
        "order": order,
        "forced_true_rows": forced_true,
        "forced_false_rows": forced_false,
        "variable_rows": variable,
        "outer": outer,
        "row_assignment_replay": "SAT",
        "row_assignment_uniqueness": str(uniqueness).upper(),
        "replay_source_sha256": sha256(CEGAR),
    }


def orient(
    x: dict[str, z3.ArithRef],
    y: dict[str, z3.ArithRef],
    a: str,
    b: str,
    c: str,
) -> z3.ArithRef:
    return (x[b] - x[a]) * (y[c] - y[a]) - (y[b] - y[a]) * (x[c] - x[a])


def dist2(
    x: dict[str, z3.ArithRef],
    y: dict[str, z3.ArithRef],
    a: str,
    b: str,
) -> z3.ArithRef:
    return (x[a] - x[b]) ** 2 + (y[a] - y[b]) ** 2


def build_formula(
    target: dict[str, Any],
    *,
    include_false_rows: bool,
    timeout_ms: int,
) -> tuple[z3.Solver, dict[str, z3.ArithRef], dict[str, z3.ArithRef]]:
    order: list[str] = target["order"]
    x = {name: z3.Real(f"x_{name}") for name in order}
    y = {name: z3.Real(f"y_{name}") for name in order}
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    trackers: list[z3.BoolRef] = []

    def track(label: str, constraint: z3.BoolRef) -> None:
        token = z3.Bool(label)
        trackers.append(token)
        solver.assert_and_track(constraint, token)

    # Translation, rotation/reflection and similarity gauge.  The first two
    # saved vertices are distinct, so their distance can be normalized to one.
    track("gauge_x0", x[order[0]] == 0)
    track("gauge_y0", y[order[0]] == 0)
    track("gauge_x1", x[order[1]] == 1)
    track("gauge_y1", y[order[1]] == 0)

    # Exact strict-convex cyclic-order encoding: every oriented polygon edge is
    # a strict supporting edge, with every non-endpoint vertex on its left.
    n = len(order)
    edge_count = 0
    for i, a in enumerate(order):
        b = order[(i + 1) % n]
        for c in order:
            if c in (a, b):
                continue
            track(f"conv_{edge_count}", orient(x, y, a, b, c) > 0)
            edge_count += 1

    for number, (center, left, right) in enumerate(target["forced_true_rows"]):
        track(
            f"row_eq_{number}",
            dist2(x, y, center, left) == dist2(x, y, center, right),
        )
    if include_false_rows:
        for number, (center, left, right) in enumerate(
            target["forced_false_rows"]
        ):
            track(
                f"row_neq_{number}",
                dist2(x, y, center, left) != dist2(x, y, center, right),
            )
    solver._euclidean_probe_trackers = trackers  # type: ignore[attr-defined]
    return solver, x, y


def write_smt2(solver: z3.Solver, path: Path) -> None:
    trackers = solver._euclidean_probe_trackers  # type: ignore[attr-defined]
    substitutions = tuple((token, z3.BoolVal(True)) for token in trackers)
    direct = z3.SolverFor("QF_NRA")
    direct.add(
        *(
            z3.simplify(z3.substitute(assertion, *substitutions))
            for assertion in solver.assertions()
        )
    )
    path.write_text(
        "(set-logic QF_NRA)\n" + direct.sexpr() + "\n(check-sat)\n"
    )


def z3_check(
    solver: z3.Solver,
    x: dict[str, z3.ArithRef],
    y: dict[str, z3.ArithRef],
) -> dict[str, Any]:
    started = time.monotonic()
    status = solver.check()
    elapsed = time.monotonic() - started
    out: dict[str, Any] = {
        "status": str(status).upper(),
        "elapsed_seconds": elapsed,
    }
    if status == z3.unknown:
        out["reason_unknown"] = solver.reason_unknown()
    elif status == z3.unsat:
        out["unsat_core"] = [str(token) for token in solver.unsat_core()]
    else:
        model = solver.model()
        coordinates = {
            name: [
                str(model.eval(x[name], model_completion=True)),
                str(model.eval(y[name], model_completion=True)),
            ]
            for name in x
        }
        failed = [
            str(assertion)
            for assertion in solver.assertions()
            if not z3.is_true(model.eval(assertion, model_completion=True))
        ]
        out["coordinates"] = coordinates
        out["substitution_failed_assertions"] = failed
    return out


def cvc5_check(smt2_path: Path, timeout_ms: int) -> dict[str, Any]:
    started = time.monotonic()
    try:
        proc = subprocess.run(
            [
                "cvc5",
                "--lang",
                "smt2",
                "--nl-cov",
                "--produce-models",
                "--dump-models",
                "--check-models",
                "--tlimit",
                str(timeout_ms),
                str(smt2_path),
            ],
            capture_output=True,
            text=True,
            timeout=timeout_ms / 1000 + 30,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {
            "status": "UNKNOWN",
            "reason_unknown": "subprocess timeout after cvc5 time-limit cushion",
            "elapsed_seconds": time.monotonic() - started,
        }
    status = "UNKNOWN"
    for line in proc.stdout.splitlines():
        if line.strip() in ("sat", "unsat", "unknown"):
            status = line.strip().upper()
            break
    model_path = smt2_path.with_suffix(".cvc5-model.txt")
    model_path.write_text(proc.stdout)
    return {
        "status": status,
        "elapsed_seconds": time.monotonic() - started,
        "returncode": proc.returncode,
        "model_check_requested": True,
        "model_artifact": model_path.name,
        "model_artifact_sha256": sha256(model_path),
        "stdout_tail": proc.stdout.splitlines()[-10:],
        "stderr_tail": proc.stderr.splitlines()[-10:],
    }


def smoke_tests(timeout_ms: int) -> dict[str, str]:
    def square_solver(impossible: bool) -> z3.Solver:
        names = ["p0", "p1", "p2", "p3"]
        x = {name: z3.Real(f"smoke_{impossible}_x_{name}") for name in names}
        y = {name: z3.Real(f"smoke_{impossible}_y_{name}") for name in names}
        s = z3.SolverFor("QF_NRA")
        s.set(timeout=timeout_ms)
        values = {
            "p0": (0, 0),
            "p1": (1, 0),
            "p2": (1, 1),
            "p3": (0, 1),
        }
        for name, (xv, yv) in values.items():
            s.add(x[name] == xv, y[name] == yv)
        for i, a in enumerate(names):
            b = names[(i + 1) % len(names)]
            for c in names:
                if c not in (a, b):
                    s.add(orient(x, y, a, b, c) > 0)
        if impossible:
            s.add(dist2(x, y, "p0", "p1") == dist2(x, y, "p0", "p2"))
        return s

    sat_status = square_solver(False).check()
    unsat_status = square_solver(True).check()
    if sat_status != z3.sat or unsat_status != z3.unsat:
        raise RuntimeError(f"smoke tests failed: {sat_status=}, {unsat_status=}")
    return {"known_square": "SAT", "false_square_distance_equality": "UNSAT"}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    parser.add_argument("--output", type=Path, default=OUTPUT)
    args = parser.parse_args()
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")
    timeout_ms = args.timeout_seconds * 1000

    result: dict[str, Any] = {
        "schema": "p97-aligned-singleton-euclidean-probe-v1",
        "inputs": {
            path.name: sha256(path) for path in (CEGAR, RESULT, CHECKPOINT)
        },
        "timeout_seconds_per_engine_per_formula": args.timeout_seconds,
        "trust_boundary": (
            "Exact QF_NRA formulas for actual R^2 coordinates; Z3/cvc5 verdicts "
            "are trusted solver computations, not kernel-checked certificates. "
            "UNKNOWN/timeouts are no verdict. forced_equalities UNSAT soundly "
            "refutes the saved survivor. The result JSON omitted its row "
            "assignment, but historical QF_LIA replay proves it unique at the "
            "saved order. cvc5 SAT is retained with --dump-models and checked "
            "inside cvc5 with --check-models; it is still a trusted computation."
        ),
        "smoke_tests": smoke_tests(timeout_ms),
    }
    target = reconstruct_target(timeout_ms)
    result["target"] = {
        "order": target["order"],
        "forced_true_row_count": len(target["forced_true_rows"]),
        "forced_false_row_count": len(target["forced_false_rows"]),
        "variable_row_count": len(target["variable_rows"]),
        "forced_true_rows": target["forced_true_rows"],
        "forced_false_rows": target["forced_false_rows"],
        "row_assignment_replay": target["row_assignment_replay"],
        "row_assignment_uniqueness": target["row_assignment_uniqueness"],
        "row_replay_source_sha256": target["replay_source_sha256"],
        "artifact_gap": (
            "result JSON records no selected row literals; historical-ledger "
            "replay proves the 160 truth values unique at the saved order"
        ),
        "historical_source_drift": (
            "current cegar.py adds apex_triple_exclusion (23 constraints), "
            "absent from the saved result ledger; replay deliberately omits it"
        ),
        "convex_order_encoding": (
            "each directed consecutive edge has every other point strictly left"
        ),
    }

    formulas = (
        ("forced_equalities", False),
        ("full_rows", True),
    )
    result["formulas"] = {}
    for label, include_false_rows in formulas:
        solver, x, y = build_formula(
            target,
            include_false_rows=include_false_rows,
            timeout_ms=timeout_ms,
        )
        smt2_path = HERE / f"euclidean-probe-{label}.smt2"
        write_smt2(solver, smt2_path)
        result["formulas"][label] = {
            "smt2": smt2_path.name,
            "sha256": sha256(smt2_path),
            "assertion_count": len(solver.assertions()),
            "z3": z3_check(solver, x, y),
            "cvc5": cvc5_check(smt2_path, timeout_ms),
        }
        if (
            label == "forced_equalities"
            and result["formulas"][label]["z3"]["status"] == "UNSAT"
            and result["formulas"][label]["cvc5"]["status"] == "UNSAT"
        ):
            result["terminal_status"] = "UNSAT_FORCED_EQUALITIES_CROSS_CHECKED"
            result["reason"] = (
                "strict convex cyclic order plus universally forced row "
                "equalities is already inconsistent over Euclidean R^2"
            )
            break

    if "terminal_status" not in result:
        statuses = {
            engine: result["formulas"]["full_rows"][engine]["status"]
            for engine in ("z3", "cvc5")
        }
        if statuses == {"z3": "SAT", "cvc5": "SAT"}:
            result["terminal_status"] = "SAT_FULL_ROWS_CROSS_CHECKED"
            result["reason"] = "both exact engines report a full R^2 realization"
        elif statuses == {"z3": "UNSAT", "cvc5": "UNSAT"}:
            result["terminal_status"] = "UNSAT_FULL_ROWS_CROSS_CHECKED"
            result["reason"] = (
                "both exact engines refute the unique full row assignment"
            )
        elif (
            statuses["cvc5"] == "SAT"
            and result["formulas"]["full_rows"]["cvc5"]["returncode"] == 0
            and result["formulas"]["full_rows"]["cvc5"]["model_check_requested"]
        ):
            result["terminal_status"] = "SAT_CVC5_MODEL_CHECKED_Z3_NO_VERDICT"
            result["reason"] = (
                "cvc5 reports SAT and internally checks its dumped exact model; "
                f"Z3 returned {statuses['z3']} within the independent budget"
            )
        else:
            result["terminal_status"] = "UNKNOWN_FAIL_CLOSED"
            result["reason"] = f"no cross-engine decisive agreement: {statuses}"

    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "output": str(args.output),
                "terminal_status": result["terminal_status"],
                "reason": result["reason"],
                "formula_statuses": {
                    label: {
                        engine: data[engine]["status"]
                        for engine in ("z3", "cvc5")
                    }
                    for label, data in result["formulas"].items()
                },
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
