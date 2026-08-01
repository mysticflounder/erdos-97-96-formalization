#!/usr/bin/env python3
"""Fixed-role coordinate audit for the dual exact-row CEGAR survivor.

This is an external QF_NRA diagnostic, not a Lean proof.  Every solver call
is independently capped and every Z3 SAT model is replayed against all terms.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import subprocess
import time
from collections import Counter
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
WITNESS = HERE.parent / "dual-row-cegar" / "n17-profile-6-8-6" / "witness.json"
EXPECTED_ORDER = (
    "a1", "t3", "t2", "t4", "t1", "a2", "r1", "p1", "q2",
    "p2", "q1", "r2", "a3", "s3", "s1", "s4", "s2",
)
EXPECTED_ROWS = {
    "collision.common": ("p2", ("t1", "q1", "q2", "s4")),
    "collision.apex1": ("a1", ("t2", "q1", "q2", "s3")),
    "collision.opposite": ("q2", ("a2", "r1", "r2", "a3")),
    "collision.apex2": ("a2", ("r2", "q1", "s1", "s2")),
    "collision.apex3": ("a3", ("t3", "t4", "a2", "s1")),
    "outside.common": ("p2", ("t1", "q1", "q2", "s4")),
    "outside.apex1": ("a1", ("t1", "t3", "r1", "r2")),
    "outside.opposite": ("q2", ("a2", "r1", "r2", "a3")),
    "outside.apex2": ("a2", ("p2", "r1", "q2", "s4")),
    "outside.apex3": ("a3", ("t3", "t4", "p2", "s1")),
}
EXPECTED_OUTSIDE = {
    "Q.source": "a1",
    "Q.otherOutsidePoint": "t2",
    "deleted": "a1",
}
EXPECTED_SOURCE_SHELL = ("q1", ("a1", "t2", "p1", "p2"))
COLLISION_DELETED = "p1"
TARGET_CENTER = "q2"
KALMANSON_FAMILIES = {
    "kalmanson_013_412_523": {
        "theorem": "false_of_six_ccw_three_shell_equalities_013_412_523",
        "arity": 6,
        "equalities": ((0, 1, 3), (4, 1, 2), (5, 2, 3)),
    },
    "kalmanson_012_325_415": {
        "theorem": "false_of_six_ccw_three_shell_equalities_012_325_415",
        "arity": 6,
        "equalities": ((0, 1, 2), (3, 2, 5), (4, 1, 5)),
    },
    "kalmanson_012_124_314": {
        "theorem": "false_of_five_ccw_three_shell_equalities_012_124_314",
        "arity": 5,
        "equalities": ((0, 1, 2), (1, 2, 4), (3, 1, 4)),
    },
    "kalmanson_013_235_415": {
        "theorem": "false_of_six_ccw_three_shell_equalities_013_235_415",
        "arity": 6,
        "equalities": ((0, 1, 3), (2, 3, 5), (4, 1, 5)),
    },
}


@dataclass(frozen=True)
class Constraint:
    name: str
    block: str
    term: Any


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_input(path: Path) -> dict[str, Any]:
    global EXPECTED_ORDER, EXPECTED_ROWS, EXPECTED_OUTSIDE
    global EXPECTED_SOURCE_SHELL, COLLISION_DELETED, TARGET_CENTER
    data = json.loads(path.read_text())
    assert data["status"] == "PASS"
    EXPECTED_ORDER = tuple(data["cyclic_order"])
    EXPECTED_ROWS = {
        name: (data["row_centers"][name], tuple(support))
        for name, support in data["row_supports"].items()
    }
    EXPECTED_OUTSIDE = dict(data["outside_choice"])
    packet = data["base_semantic_replay"]["packet"]
    deletion = data["base_semantic_replay"]["five_center_deletion_residual"]
    EXPECTED_SOURCE_SHELL = (packet["bp"], tuple(packet["p_support"]))
    COLLISION_DELETED = deletion["deleted"]
    TARGET_CENTER = deletion["centers"]["opposite_collision_blocker"]
    for name, (center, support) in EXPECTED_ROWS.items():
        assert data["row_centers"][name] == center
        assert tuple(data["row_supports"][name]) == support
    assert EXPECTED_ROWS["collision.common"] == EXPECTED_ROWS["outside.common"]
    assert EXPECTED_ROWS["collision.opposite"] == EXPECTED_ROWS["outside.opposite"]
    return data


def kalmanson_precheck() -> list[dict[str, Any]]:
    """Replay all direct increasing-order production Kalmanson matches."""
    replayed = []
    for family, schema in KALMANSON_FAMILIES.items():
        for points in itertools.combinations(EXPECTED_ORDER, schema["arity"]):
            requirements = tuple(
                (points[center], (points[left], points[right]))
                for center, left, right in schema["equalities"]
            )
            providers = []
            for center, endpoints in requirements:
                providers.append(tuple(
                    row_name for row_name, (row_center, support) in EXPECTED_ROWS.items()
                    if row_center == center and set(endpoints).issubset(support)
                ))
            for rows in itertools.product(*providers):
                replayed.append({
                    "family": family,
                    "theorem": schema["theorem"],
                    "points_in_increasing_order": list(points),
                    "equalities": [
                        {
                            "row": row,
                            "center": center,
                            "equal_distance_targets": list(endpoints),
                        }
                        for row, (center, endpoints) in zip(rows, requirements)
                    ],
                })
    return replayed


class Formula:
    def __init__(self) -> None:
        import z3

        self.z3 = z3
        self.coords = {name: z3.Reals(f"{name}_x {name}_y") for name in EXPECTED_ORDER}
        self.constraints: list[Constraint] = []

    def sqdist(self, a: str, b: str):
        ax, ay = self.coords[a]
        bx, by = self.coords[b]
        return (ax - bx) ** 2 + (ay - by) ** 2

    def orient(self, a: str, b: str, c: str):
        ax, ay = self.coords[a]
        bx, by = self.coords[b]
        cx, cy = self.coords[c]
        return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)

    def add(self, name: str, block: str, term: Any) -> None:
        self.constraints.append(Constraint(name, block, term))

    def build(self) -> None:
        # Orientation-preserving similarity gauge.  Under the project CCW
        # convention every later point lies below the directed first edge.
        first, second = EXPECTED_ORDER[:2]
        self.add(f"gauge.{first}.x", "gauge", self.coords[first][0] == 0)
        self.add(f"gauge.{first}.y", "gauge", self.coords[first][1] == 0)
        self.add(f"gauge.{second}.x", "gauge", self.coords[second][0] == 1)
        self.add(f"gauge.{second}.y", "gauge", self.coords[second][1] == 0)

        for left, right in itertools.combinations(EXPECTED_ORDER, 2):
            self.add(
                f"distinct.{left}.{right}",
                "named_point_distinctness",
                self.sqdist(left, right) > 0,
            )

        for row_name, (center, support) in EXPECTED_ROWS.items():
            radius_sq = self.sqdist(center, support[0])
            for index, target in enumerate(support[1:], 1):
                self.add(
                    f"row.{row_name}.{index}",
                    f"row.{row_name}",
                    self.sqdist(center, target) == radius_sq,
                )

        source_center, source_support = EXPECTED_SOURCE_SHELL
        source_radius_sq = self.sqdist(source_center, source_support[0])
        for index, target in enumerate(source_support[1:], 1):
            self.add(
                f"row.context.first_collision_shell.{index}",
                "row.context.first_collision_shell",
                self.sqdist(source_center, target) == source_radius_sq,
            )

        for i, j, k in itertools.combinations(range(len(EXPECTED_ORDER)), 3):
            a, b, c = EXPECTED_ORDER[i], EXPECTED_ORDER[j], EXPECTED_ORDER[k]
            self.add(
                f"order.{i}.{j}.{k}",
                "strict_convex_order",
                self.orient(a, b, c) < 0,
            )

    def target_equality(self):
        return self.sqdist(TARGET_CENTER, EXPECTED_OUTSIDE["Q.source"]) == self.sqdist(
            TARGET_CENTER, EXPECTED_OUTSIDE["Q.otherOutsidePoint"]
        )


def select_constraints(formula: Formula, stage: str) -> list[Constraint]:
    gauge = [c for c in formula.constraints if c.block == "gauge"]
    distinct = [c for c in formula.constraints if c.block == "named_point_distinctness"]
    collision = [c for c in formula.constraints if c.block.startswith("row.collision.")]
    outside = [c for c in formula.constraints if c.block.startswith("row.outside.")]
    source_shell = [c for c in formula.constraints if c.block == "row.context.first_collision_shell"]
    order = [c for c in formula.constraints if c.block == "strict_convex_order"]
    stages = {
        "collision_rows": gauge + collision,
        "collision_rows_distinct": gauge + collision + distinct,
        "outside_rows_distinct": gauge + outside + distinct,
        "combined_rows_distinct": gauge + collision + outside + distinct,
        "combined_plus_source_shell_distinct": gauge + collision + outside + source_shell + distinct,
        "full_fixed_order": gauge + collision + outside + source_shell + distinct + order,
    }
    return stages[stage]


def smoke_test() -> dict[str, Any]:
    import z3

    x, y = z3.Reals("smoke_x smoke_y")
    sat_solver = z3.SolverFor("QF_NRA")
    sat_solver.set(timeout=1_000)
    sat_solver.add(x * x + y * y == 1, x == 0, y > 0)
    unsat_solver = z3.SolverFor("QF_NRA")
    unsat_solver.set(timeout=1_000)
    unsat_solver.add(x * x < 0)
    sat_status, unsat_status = sat_solver.check(), unsat_solver.check()
    assert sat_status == z3.sat and unsat_status == z3.unsat
    sat_model = sat_solver.model()
    assert all(z3.is_true(sat_model.eval(t, model_completion=True)) for t in sat_solver.assertions())
    return {
        "status": "PASS",
        "known_sat": str(sat_status),
        "known_unsat": str(unsat_status),
        "sat_model_replay": "PASS",
    }


def write_smt2(path: Path, constraints: Iterable[Constraint], timeout_ms: int) -> None:
    import z3

    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    solver.add(*(c.term for c in constraints))
    text = solver.to_smt2()
    if "(set-logic " not in text:
        text = "(set-logic QF_NRA)\n" + text
    path.write_text(text)


def cvc5_cross_check(path: Path, timeout_ms: int) -> dict[str, Any]:
    command = [
        "cvc5", "--lang=smt2", "--nl-cov", f"--tlimit={timeout_ms}", str(path),
    ]
    started = time.monotonic()
    try:
        run = subprocess.run(
            command,
            text=True,
            capture_output=True,
            timeout=(timeout_ms / 1000) + 2,
            check=False,
        )
        output = (run.stdout + "\n" + run.stderr).strip()
        status_lines = [line.strip() for line in output.splitlines() if line.strip() in {"sat", "unsat", "unknown"}]
        if status_lines:
            status = status_lines[0].upper()
        elif "interrupted by timeout" in output.lower():
            status = "TIMEOUT"
        else:
            status = "ERROR"
        return {
            "status": status,
            "exit_code": run.returncode,
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "command": command,
            "output_head": output.splitlines()[:12],
            "sat_model_replay": "NOT_AVAILABLE",
        }
    except subprocess.TimeoutExpired:
        return {
            "status": "TIMEOUT",
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "command": command,
            "sat_model_replay": "NOT_AVAILABLE",
        }


def solve_query(
    formula: Formula,
    name: str,
    constraints: list[Constraint],
    timeout_ms: int,
    artifact_dir: Path,
    extra: Any | None = None,
) -> tuple[dict[str, Any], dict[str, list[str]] | None]:
    z3 = formula.z3
    solver = z3.SolverFor("QF_NRA")
    solver.set(timeout=timeout_ms)
    terms = list(constraints)
    if extra is not None:
        terms.append(Constraint(f"diagnostic.{name}", "diagnostic", extra))
    solver.add(*(c.term for c in terms))
    started = time.monotonic()
    status = solver.check()
    elapsed_ms = int((time.monotonic() - started) * 1000)
    counts = Counter(c.block for c in terms)
    result: dict[str, Any] = {
        "status": str(status).upper(),
        "elapsed_ms": elapsed_ms,
        "timeout_ms": timeout_ms,
        "constraint_count": len(terms),
        "constraint_blocks": dict(sorted(counts.items())),
    }
    model_output = None
    if status == z3.sat:
        model = solver.model()
        failed = [
            c.name for c in terms
            if not z3.is_true(model.eval(c.term, model_completion=True))
        ]
        if failed:
            raise AssertionError((name, "model replay failed", failed[:20]))
        result["model_replay"] = {"status": "PASS", "constraints_checked": len(terms)}
        model_output = {
            point: [
                str(model.eval(formula.coords[point][0], model_completion=True)),
                str(model.eval(formula.coords[point][1], model_completion=True)),
            ]
            for point in EXPECTED_ORDER
        }
    elif status == z3.unknown:
        result["reason_unknown"] = solver.reason_unknown()
        smt2_path = artifact_dir / f"{name}.smt2"
        write_smt2(smt2_path, terms, timeout_ms)
        result["smt2"] = str(smt2_path)
        result["cvc5_cross_check"] = cvc5_cross_check(smt2_path, timeout_ms)
    else:
        result["unsat_certificate"] = None
        result["trust"] = "trusted external Z3 QF_NRA result; no proof certificate"
    return result, model_output


def classify_target(eq_result: dict[str, Any], neq_result: dict[str, Any]) -> str:
    eq_status, neq_status = eq_result["status"], neq_result["status"]
    if eq_status == "SAT" and neq_status == "UNSAT":
        return "FORCED_BY_PACKET_EQUATIONS"
    if eq_status == "UNSAT" and neq_status == "SAT":
        return "CONTRADICTED_BY_PACKET_EQUATIONS"
    if eq_status == "SAT" and neq_status == "SAT":
        return "NEITHER_FORCED_NOR_CONTRADICTED"
    return "UNRESOLVED"


def run(
    witness_path: Path,
    local_timeout_ms: int,
    full_timeout_ms: int,
    artifact_dir: Path,
) -> dict[str, Any]:
    if not (1 <= local_timeout_ms <= 30_000 and 1 <= full_timeout_ms <= 30_000):
        raise ValueError("every timeout must be in 1..30000 ms")
    artifact_dir.mkdir(parents=True, exist_ok=True)
    load_input(witness_path)
    precheck_hits = kalmanson_precheck()
    if precheck_hits:
        return {
            "status": "REJECTED_BEFORE_QF_NRA",
            "classification": "source-level production Kalmanson theorem match",
            "theorems": sorted({hit["theorem"] for hit in precheck_hits}),
            "theorem_source": "lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean",
            "input": {
                "witness": str(witness_path.resolve().relative_to(HERE.parent)),
                "sha256": file_sha256(witness_path),
                "cyclic_order": list(EXPECTED_ORDER),
            },
            "direct_hits": precheck_hits,
            "smallest_decisive_core": {
                "point_count": 6,
                "metric_equality_count": 3,
                "order": precheck_hits[0]["points_in_increasing_order"],
                "equalities": precheck_hits[0]["equalities"],
            },
            "qf_nra": "NOT_RUN_AFTER_PREFLIGHT_REJECTION",
            "opposite_blocker_distance_test": {
                "center": TARGET_CENTER,
                "Q.source": EXPECTED_OUTSIDE["Q.source"],
                "Q.otherOutsidePoint": EXPECTED_OUTSIDE["Q.otherOutsidePoint"],
                "classification": "NOT_TESTED_WITNESS_ALREADY_INVALID",
            },
            "counts": {
                "coordinate_variables": 34,
                "post_gauge_variable_count": 30,
                "gauge_equalities": 4,
                "packet_row_equality_occurrences": 30,
                "context_source_shell_equality_occurrences": 3,
                "unique_packet_row_equalities": 22,
                "unique_row_equalities_with_source_shell": 25,
                "named_point_disequalities": 136,
                "strict_convex_order_inequalities": 680,
            },
            "encoded_ledger": "ENCODING-LEDGER.md",
            "trust_boundary": [
                "direct theorem match was source-replayed but no Lean/Lake or transitive axiom audit was run",
                "no final QF_NRA solver verdict was requested after the stronger preflight rejection",
                "the saved incidence witness must not be promoted as a Euclidean survivor",
            ],
        }
    formula = Formula()
    formula.build()
    stages: dict[str, Any] = {}
    models: dict[str, Any] = {}
    for stage in (
        "collision_rows",
        "collision_rows_distinct",
        "outside_rows_distinct",
        "combined_rows_distinct",
        "combined_plus_source_shell_distinct",
        "full_fixed_order",
    ):
        timeout = full_timeout_ms if stage == "full_fixed_order" else local_timeout_ms
        result, model = solve_query(
            formula, stage, select_constraints(formula, stage), timeout, artifact_dir
        )
        stages[stage] = result
        if model is not None:
            models[stage] = model

    packet_constraints = select_constraints(formula, "combined_rows_distinct")
    eq_result, eq_model = solve_query(
        formula, "opposite_distance_equality", packet_constraints,
        local_timeout_ms, artifact_dir, formula.target_equality(),
    )
    neq_result, neq_model = solve_query(
        formula, "opposite_distance_disequality", packet_constraints,
        local_timeout_ms, artifact_dir, formula.z3.Not(formula.target_equality()),
    )
    augmented_constraints = select_constraints(formula, "combined_plus_source_shell_distinct")
    augmented_eq_result, augmented_eq_model = solve_query(
        formula, "opposite_distance_equality_with_source_shell", augmented_constraints,
        local_timeout_ms, artifact_dir, formula.target_equality(),
    )
    augmented_neq_result, augmented_neq_model = solve_query(
        formula, "opposite_distance_disequality_with_source_shell", augmented_constraints,
        local_timeout_ms, artifact_dir, formula.z3.Not(formula.target_equality()),
    )
    if eq_model is not None:
        models["opposite_distance_equality"] = eq_model
    if neq_model is not None:
        models["opposite_distance_disequality"] = neq_model
    if augmented_eq_model is not None:
        models["opposite_distance_equality_with_source_shell"] = augmented_eq_model
    if augmented_neq_model is not None:
        models["opposite_distance_disequality_with_source_shell"] = augmented_neq_model
    model_path = artifact_dir / "models.json"
    model_path.write_text(json.dumps(models, indent=2, sort_keys=True) + "\n")

    first_non_sat_stage = next(
        (
            {"stage": name, "status": stages[name]["status"], "smt2": stages[name].get("smt2")}
            for name in (
                "collision_rows",
                "collision_rows_distinct",
                "outside_rows_distinct",
                "combined_rows_distinct",
                "combined_plus_source_shell_distinct",
                "full_fixed_order",
            )
            if stages[name]["status"] != "SAT"
        ),
        None,
    )

    packet_row_constraints = [
        c for c in formula.constraints
        if c.block.startswith("row.collision.") or c.block.startswith("row.outside.")
    ]
    all_row_constraints = [c for c in formula.constraints if c.block.startswith("row.")]
    unique_packet_polynomials = len({c.term.sexpr() for c in packet_row_constraints})
    unique_all_row_polynomials = len({c.term.sexpr() for c in all_row_constraints})
    return {
        "status": "COMPLETE",
        "classification": "external fixed-role QF_NRA audit; not Lean or kernel closure",
        "input": {
            "witness": str(witness_path.resolve().relative_to(HERE.parent)),
            "sha256": file_sha256(witness_path),
            "cyclic_order": list(EXPECTED_ORDER),
            "collision_deleted": COLLISION_DELETED,
            "outside_choice": EXPECTED_OUTSIDE,
        },
        "solver": f"Z3 {formula.z3.get_version_string()} nlsat",
        "smoke": smoke_test(),
        "counts": {
            "coordinate_variables": 34,
            "post_gauge_variable_count": 30,
            "gauge_equalities": 4,
            "packet_row_equality_occurrences": len(packet_row_constraints),
            "context_source_shell_equality_occurrences": 3,
            "unique_packet_row_equalities": unique_packet_polynomials,
            "unique_row_equalities_with_source_shell": unique_all_row_polynomials,
            "named_point_disequalities": 136,
            "strict_convex_order_inequalities": 680,
        },
        "stages": stages,
        "smallest_decisive_or_unknown_stage": first_non_sat_stage,
        "opposite_blocker_distance_test": {
            "center": TARGET_CENTER,
            "Q.source": EXPECTED_OUTSIDE["Q.source"],
            "Q.otherOutsidePoint": EXPECTED_OUTSIDE["Q.otherOutsidePoint"],
            "base": "combined_rows_distinct (fixed packet equations, no cyclic-order clauses)",
            "with_equality": eq_result,
            "with_disequality": neq_result,
            "classification": classify_target(eq_result, neq_result),
            "with_contextual_source_shell": {
                "with_equality": augmented_eq_result,
                "with_disequality": augmented_neq_result,
                "classification": classify_target(augmented_eq_result, augmented_neq_result),
            },
        },
        "models": model_path.name,
        "encoded_ledger": "ENCODING-LEDGER.md",
        "trust_boundary": [
            "SAT accepted only after exact Z3 model substitution replay",
            "UNSAT has no independently checkable certificate",
            "UNKNOWN remains UNKNOWN even if bounded cvc5 gives an unreplayed SAT answer",
            "no MEC/nonobtuse/full CounterexampleData or arbitrary-n claim",
            "no Lean invocation or kernel closure",
        ],
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", type=Path, default=WITNESS)
    parser.add_argument("--local-timeout-ms", type=int, default=5_000)
    parser.add_argument("--full-timeout-ms", type=int, default=30_000)
    parser.add_argument("--output", type=Path, default=HERE / "result.json")
    parser.add_argument("--artifact-dir", type=Path, default=HERE)
    args = parser.parse_args()
    result = run(
        args.witness,
        args.local_timeout_ms,
        args.full_timeout_ms,
        args.artifact_dir,
    )
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    compact = {"status": result["status"], "output": str(args.output)}
    if "stages" in result:
        compact["stages"] = {name: data["status"] for name, data in result["stages"].items()}
    compact["opposite_distance"] = result["opposite_blocker_distance_test"]["classification"]
    print(json.dumps(compact, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
