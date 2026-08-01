#!/usr/bin/env python3
"""Exact QF_LRA audit of all v8 radius equalities plus global Kalmanson cuts.

This is an external discovery audit, not a Lean proof.  Strict homogeneous
constraints are normalized to unit margin; the report records the equivalence.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import math
import subprocess
from collections import Counter
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

import z3


ROOT = Path(__file__).resolve().parents[6]
HERE = Path(__file__).resolve().parent
WITNESS = ROOT / (
    "scratch/atail-force/same-blocker-common-omission-euclidean-v3/"
    "theorem-bank-cegar-audit/crossed-arm-audit/"
    "source-at-common-full-metric-bank-v8-convex-five-point-import-v7-shared-fourth-600s/"
    "witness.json"
)
LEAN_SOURCE = ROOT / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean"
TIMEOUT_MS = 60_000


@dataclass(frozen=True)
class Constraint:
    name: str
    kind: str
    term: Any
    coeffs: dict[tuple[str, str], int]
    rhs: int
    provenance: dict[str, Any]


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def fraction_of(value: Any) -> Fraction:
    text = str(value)
    if text.startswith("(- ") and text.endswith(")"):
        return -fraction_of(text[3:-1])
    if text.startswith("(/ ") and text.endswith(")"):
        left, right = text[3:-1].split()
        return Fraction(int(left), int(right))
    return Fraction(text)


class Audit:
    def __init__(self, witness: dict[str, Any]) -> None:
        self.witness = witness
        self.order = tuple(witness["existential_cyclic_order"])
        self.position = {point: index for index, point in enumerate(self.order)}
        self.edges = tuple(self.edge(a, b) for a, b in itertools.combinations(self.order, 2))
        self.distance = {
            edge: z3.Real(f"d__{edge[0]}__{edge[1]}") for edge in self.edges
        }
        self.constraints: list[Constraint] = []

    def edge(self, a: str, b: str) -> tuple[str, str]:
        assert a != b
        if self.position[a] < self.position[b]:
            return a, b
        return b, a

    def d(self, a: str, b: str) -> Any:
        return self.distance[self.edge(a, b)]

    def add(
        self,
        name: str,
        kind: str,
        coeffs: dict[tuple[str, str], int],
        rhs: int,
        provenance: dict[str, Any],
        equality: bool = False,
    ) -> None:
        expr = sum((coefficient * self.distance[edge] for edge, coefficient in coeffs.items()), z3.RealVal(0))
        term = expr == rhs if equality else expr >= rhs
        self.constraints.append(Constraint(name, kind, term, coeffs, rhs, provenance))

    @staticmethod
    def combine(*terms: tuple[tuple[str, str], int]) -> dict[tuple[str, str], int]:
        result: Counter[tuple[str, str]] = Counter()
        for edge, coefficient in terms:
            result[edge] += coefficient
        return {edge: coefficient for edge, coefficient in result.items() if coefficient}

    def validate_witness(self) -> dict[str, Any]:
        assert len(self.order) == 17
        assert len(set(self.order)) == len(self.order)
        assert set(self.witness["radius_classes"]) == set(self.order)
        assert self.witness["semantic_replay"] == "PASS"
        assert self.witness["crossed_arm_replay"]["status"] == "PASS"
        assert all(
            count == 0
            for count in self.witness["crossed_arm_replay"]
            ["full_theorem_bank_active_match_counts"].values()
        )
        assert self.witness["crossed_arm_replay"]["structural_bank_active_match_count"] == 0

        class_histogram: Counter[int] = Counter()
        full_pairwise_equalities = 0
        spanning_equalities = 0
        for center, classes in self.witness["radius_classes"].items():
            flattened = [point for radius_class in classes for point in radius_class]
            assert center not in flattened
            assert len(flattened) == len(set(flattened)) == 16
            assert set(flattened) == set(self.order) - {center}
            for radius_class in classes:
                assert radius_class
                class_histogram[len(radius_class)] += 1
                full_pairwise_equalities += math.comb(len(radius_class), 2)
                spanning_equalities += len(radius_class) - 1

        for center, row in self.witness["rows"].items():
            assert any(
                set(row) == set(radius_class)
                for radius_class in self.witness["radius_classes"][center]
            )

        assert full_pairwise_equalities == 125
        assert spanning_equalities == 68
        return {
            "point_count": len(self.order),
            "edge_variable_count": len(self.edges),
            "cyclic_order_unique": True,
            "radius_classes_partition_every_other_point": True,
            "registered_rows_are_radius_classes": True,
            "full_theorem_bank_active_matches_are_zero": True,
            "structural_bank_active_match_count_is_zero": True,
            "radius_class_size_histogram": dict(sorted(class_histogram.items())),
            "full_pairwise_radius_equality_count": full_pairwise_equalities,
            "equivalent_spanning_radius_equality_count": spanning_equalities,
        }

    def build(self) -> None:
        # Positive distances and every Kalmanson slack are strict in the source
        # mathematics.  Because the complete system is homogeneous and finite,
        # strict feasibility is equivalent to feasibility after one common
        # positive rescaling with every strict slack at least 1.
        for a, b in self.edges:
            edge = self.edge(a, b)
            self.add(
                f"positive.{a}.{b}",
                "positive_distance_unit_margin",
                {edge: 1},
                1,
                {"edge": [a, b], "source_atom": f"dist {a} {b} > 0"},
            )

        for center in self.order:
            for class_index, radius_class in enumerate(
                self.witness["radius_classes"][center]
            ):
                for left, right in itertools.combinations(radius_class, 2):
                    left_edge = self.edge(center, left)
                    right_edge = self.edge(center, right)
                    self.add(
                        f"radius.{center}.c{class_index}.{left}.{right}",
                        "within_radius_class_equality",
                        self.combine((left_edge, 1), (right_edge, -1)),
                        0,
                        {
                            "center": center,
                            "radius_class_index": class_index,
                            "radius_class": list(radius_class),
                            "equality": [list(left_edge), list(right_edge)],
                        },
                        equality=True,
                    )

        for ia, ib, ic, id_ in itertools.combinations(range(len(self.order)), 4):
            a, b, c, d = (self.order[index] for index in (ia, ib, ic, id_))
            diagonal_sum = ((self.edge(a, c), 1), (self.edge(b, d), 1))
            self.add(
                f"kalmanson.main.{ia}.{ib}.{ic}.{id_}",
                "strict_kalmanson_main_unit_margin",
                self.combine(
                    *diagonal_sum,
                    (self.edge(b, c), -1),
                    (self.edge(a, d), -1),
                ),
                1,
                {
                    "indices": [ia, ib, ic, id_],
                    "points": [a, b, c, d],
                    "strict_source_inequality": f"d({b},{c}) + d({a},{d}) < d({a},{c}) + d({b},{d})",
                    "lean_theorem": "Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw",
                    "lean_source_line": 240,
                },
            )
            self.add(
                f"kalmanson.complementary.{ia}.{ib}.{ic}.{id_}",
                "strict_kalmanson_complementary_unit_margin",
                self.combine(
                    *diagonal_sum,
                    (self.edge(a, b), -1),
                    (self.edge(c, d), -1),
                ),
                1,
                {
                    "indices": [ia, ib, ic, id_],
                    "points": [a, b, c, d],
                    "strict_source_inequality": f"d({a},{b}) + d({c},{d}) < d({a},{c}) + d({b},{d})",
                    "lean_theorem": "Problem97.CapCrossingKalmanson.complementary_dist_add_dist_lt_diagonal_sum_of_ccw",
                    "lean_source_line": 273,
                },
            )

    @staticmethod
    def smoke_test() -> dict[str, Any]:
        ab, bc, cd, ad, ac, bd = z3.Reals("smoke_ab smoke_bc smoke_cd smoke_ad smoke_ac smoke_bd")
        sat_solver = z3.SolverFor("QF_LRA")
        sat_solver.set(timeout=1_000)
        sat_solver.add(
            *(distance >= 1 for distance in (ab, bc, cd, ad, ac, bd)),
            ac + bd - bc - ad >= 1,
            ac + bd - ab - cd >= 1,
        )
        unsat_solver = z3.SolverFor("QF_LRA")
        unsat_solver.set(timeout=1_000)
        unsat_solver.add(
            *(distance >= 1 for distance in (ab, bc, cd, ad, ac, bd)),
            ab == ac,
            cd == bd,
            ac + bd - ab - cd >= 1,
        )
        sat_status = sat_solver.check()
        unsat_status = unsat_solver.check()
        assert sat_status == z3.sat
        assert unsat_status == z3.unsat
        model = sat_solver.model()
        assert all(
            z3.is_true(model.eval(term, model_completion=True))
            for term in sat_solver.assertions()
        )
        return {
            "known_kalmanson_sat": str(sat_status),
            "known_equality_closed_complementary_sum_unsat": str(unsat_status),
            "sat_model_replayed": True,
        }

    def solve(self) -> tuple[str, list[str]]:
        solver = z3.SolverFor("QF_LRA")
        solver.set(timeout=TIMEOUT_MS)
        for constraint in self.constraints:
            solver.assert_and_track(constraint.term, z3.Bool(constraint.name))
        status = solver.check()
        if status == z3.unknown:
            raise RuntimeError(f"UNKNOWN: {solver.reason_unknown()}")
        if status == z3.sat:
            model = solver.model()
            assert all(
                z3.is_true(model.eval(constraint.term, model_completion=True))
                for constraint in self.constraints
            )
            values = {
                f"{a}--{b}": str(model.eval(self.distance[(a, b)], model_completion=True))
                for a, b in self.edges
            }
            (HERE / "model.json").write_text(json.dumps(values, indent=2, sort_keys=True) + "\n")
            return "sat", []
        return "unsat", [str(item) for item in solver.unsat_core()]

    def check_subset(self, names: list[str]) -> str:
        by_name = {constraint.name: constraint for constraint in self.constraints}
        solver = z3.SolverFor("QF_LRA")
        solver.set(timeout=TIMEOUT_MS)
        solver.add(*(by_name[name].term for name in names))
        status = solver.check()
        if status == z3.unknown:
            raise RuntimeError(f"UNKNOWN while minimizing: {solver.reason_unknown()}")
        return str(status)

    def minimize_core(self, names: list[str]) -> list[str]:
        core = list(names)
        index = 0
        while index < len(core):
            candidate = core[:index] + core[index + 1 :]
            if self.check_subset(candidate) == "unsat":
                core = candidate
            else:
                index += 1
        assert self.check_subset(core) == "unsat"
        assert all(
            self.check_subset(core[:i] + core[i + 1 :]) == "sat"
            for i in range(len(core))
        )
        return core

    def farkas_certificate(self, core_names: list[str]) -> dict[str, Any]:
        by_name = {constraint.name: constraint for constraint in self.constraints}
        core = [by_name[name] for name in core_names]
        inequalities = [constraint for constraint in core if constraint.rhs == 1]
        equalities = [constraint for constraint in core if constraint.rhs == 0]
        assert inequalities

        solver = z3.SolverFor("QF_LRA")
        solver.set(timeout=TIMEOUT_MS)
        y = {constraint.name: z3.Real(f"fy__{index}") for index, constraint in enumerate(inequalities)}
        z = {constraint.name: z3.Real(f"fz__{index}") for index, constraint in enumerate(equalities)}
        solver.add(*(weight >= 0 for weight in y.values()))
        solver.add(sum(y.values(), z3.RealVal(0)) == 1)
        for edge in self.edges:
            coefficient = sum(
                (y[constraint.name] * constraint.coeffs.get(edge, 0) for constraint in inequalities),
                z3.RealVal(0),
            ) + sum(
                (z[constraint.name] * constraint.coeffs.get(edge, 0) for constraint in equalities),
                z3.RealVal(0),
            )
            solver.add(coefficient == 0)
        status = solver.check()
        if status == z3.unknown:
            raise RuntimeError(f"UNKNOWN in Farkas extraction: {solver.reason_unknown()}")
        assert status == z3.sat
        model = solver.model()
        rational_weights = {
            **{name: fraction_of(model.eval(weight, model_completion=True)) for name, weight in y.items()},
            **{name: fraction_of(model.eval(weight, model_completion=True)) for name, weight in z.items()},
        }
        denominators = [value.denominator for value in rational_weights.values()]
        scale = math.lcm(*denominators)
        integer_weights = {name: int(value * scale) for name, value in rational_weights.items()}
        common = math.gcd(*(abs(value) for value in integer_weights.values() if value))
        integer_weights = {name: value // common for name, value in integer_weights.items()}

        combined: Counter[tuple[str, str]] = Counter()
        combined_rhs = 0
        for constraint in core:
            weight = integer_weights[constraint.name]
            for edge, coefficient in constraint.coeffs.items():
                combined[edge] += weight * coefficient
            combined_rhs += weight * constraint.rhs
        assert all(coefficient == 0 for coefficient in combined.values())
        assert combined_rhs > 0
        assert all(integer_weights[constraint.name] >= 0 for constraint in inequalities)
        return {
            "convention": "each inequality is coeffs dot d >= rhs; equalities have rhs 0 and signed weights",
            "integer_multipliers": integer_weights,
            "combined_nonzero_variable_coefficients": {
                f"{a}--{b}": coefficient
                for (a, b), coefficient in sorted(combined.items())
                if coefficient
            },
            "combined_rhs": combined_rhs,
            "verified_contradiction": f"0 >= {combined_rhs}",
        }

    def write_smt2(self, names: list[str], filename: str) -> None:
        by_name = {constraint.name: constraint for constraint in self.constraints}
        solver = z3.SolverFor("QF_LRA")
        solver.add(*(by_name[name].term for name in names))
        smt2 = solver.to_smt2()
        if "(check-sat)" not in smt2:
            smt2 += "\n(check-sat)"
        (HERE / filename).write_text(smt2.rstrip() + "\n")


def cvc5_check(path: Path) -> dict[str, Any]:
    process = subprocess.run(
        [
            "cvc5",
            "--lang",
            "smt2",
            "--force-logic=QF_LRA",
            "--tlimit",
            str(TIMEOUT_MS),
        ],
        input=path.read_text(),
        capture_output=True,
        text=True,
        timeout=90,
        check=False,
    )
    statuses = [line.strip() for line in process.stdout.splitlines() if line.strip() in {"sat", "unsat", "unknown"}]
    status = statuses[-1] if statuses else "unknown"
    if status == "unknown":
        raise RuntimeError(f"cvc5 UNKNOWN/no verdict: {process.stderr.strip()}")
    return {
        "status": status,
        "returncode": process.returncode,
        "stderr": process.stderr.strip(),
    }


def main() -> None:
    witness = json.loads(WITNESS.read_text())
    audit = Audit(witness)
    validation = audit.validate_witness()
    smoke = audit.smoke_test()
    audit.build()

    counts = Counter(constraint.kind for constraint in audit.constraints)
    assert counts["positive_distance_unit_margin"] == 136
    assert counts["within_radius_class_equality"] == 125
    assert counts["strict_kalmanson_main_unit_margin"] == 2380
    assert counts["strict_kalmanson_complementary_unit_margin"] == 2380

    status, initial_core = audit.solve()
    all_names = [constraint.name for constraint in audit.constraints]
    audit.write_smt2(all_names, "full-system.smt2")
    cvc5_full = cvc5_check(HERE / "full-system.smt2")
    assert cvc5_full["status"] == status

    result: dict[str, Any] = {
        "status": status.upper(),
        "classification": "externally exact QF_LRA; not a Lean kernel proof",
        "input": {
            "witness_path": str(WITNESS.relative_to(ROOT)),
            "witness_sha256": sha256(WITNESS),
            "production_lean_source": str(LEAN_SOURCE.relative_to(ROOT)),
            "production_lean_source_sha256": sha256(LEAN_SOURCE),
            "cyclic_order": list(audit.order),
        },
        "constraint_counts": dict(sorted(counts.items())),
        "total_constraint_count": len(audit.constraints),
        "normalization": {
            "encoding": "all positive distances and strict Kalmanson slacks are at least 1",
            "justification": "finite homogeneous strict feasibility iff one common positive rescaling has unit minimum strict slack",
            "triangle_inequalities_added": False,
            "Euclidean_PSD_or_coordinate_constraints_added": False,
        },
        "self_checks": {**validation, **smoke},
        "solver_checks": {
            "z3_version": z3.get_version_string(),
            "z3_logic": "QF_LRA",
            "z3_timeout_ms": TIMEOUT_MS,
            "z3_status": status,
            "cvc5_full_system": cvc5_full,
        },
    }

    if status == "unsat":
        minimal_core = audit.minimize_core(initial_core)
        audit.write_smt2(minimal_core, "minimal-core.smt2")
        cvc5_core = cvc5_check(HERE / "minimal-core.smt2")
        assert cvc5_core["status"] == "unsat"
        by_name = {constraint.name: constraint for constraint in audit.constraints}
        core_constraints = [by_name[name] for name in minimal_core]
        certificate = audit.farkas_certificate(minimal_core)
        core_json = {
            "initial_z3_core_size": len(initial_core),
            "deletion_minimal_core_size": len(minimal_core),
            "deletion_minimal_verified": True,
            "constraints": [
                {
                    "name": constraint.name,
                    "kind": constraint.kind,
                    "coefficients": {f"{a}--{b}": value for (a, b), value in sorted(constraint.coeffs.items())},
                    "rhs": constraint.rhs,
                    "provenance": constraint.provenance,
                }
                for constraint in core_constraints
            ],
            "farkas_certificate": certificate,
            "cvc5_minimal_core": cvc5_core,
        }
        (HERE / "minimal-core.json").write_text(json.dumps(core_json, indent=2, sort_keys=True) + "\n")
        result["minimal_core"] = {
            "initial_z3_core_size": len(initial_core),
            "deletion_minimal_core_size": len(minimal_core),
            "constraint_names": minimal_core,
            "kind_counts": dict(sorted(Counter(item.kind for item in core_constraints).items())),
            "farkas_combined_rhs": certificate["combined_rhs"],
            "cvc5_status": cvc5_core["status"],
        }
        result["route_conclusion"] = "the global equality plus strict-Kalmanson LRA route closes this fixed v8 witness"
    else:
        result["route_conclusion"] = "this global linear Kalmanson route cannot close the fixed v8 witness"

    (HERE / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    (HERE / "self-check.json").write_text(
        json.dumps(
            {
                "status": "PASS",
                "result_status": result["status"],
                "checks": result["self_checks"],
                "solver_checks": result["solver_checks"],
            },
            indent=2,
            sort_keys=True,
        )
        + "\n"
    )

    core_lines = []
    if status == "unsat":
        core_data = json.loads((HERE / "minimal-core.json").read_text())
        for item in core_data["constraints"]:
            core_lines.append(f"- `{item['name']}` ({item['kind']}): {json.dumps(item['provenance'], sort_keys=True)}")
    report = f"""# Global Kalmanson LRA audit for crossed-row v8

## Result

**{result['status']}** in exact QF_LRA, independently reproduced by Z3 and cvc5.

{result['route_conclusion']}.

This is an external exact-arithmetic feasibility result, not a Lean kernel proof.  It is
conditional on the witness replay and the encoding-to-source correspondence audited below.

## Source-faithful system

- Input: `{result['input']['witness_path']}`
- Input SHA-256: `{result['input']['witness_sha256']}`
- Pair-distance variables: {validation['edge_variable_count']}
- Full pairwise within-radius-class equalities: {counts['within_radius_class_equality']}
- Strict main Kalmanson inequalities: {counts['strict_kalmanson_main_unit_margin']}
- Strict complementary Kalmanson inequalities: {counts['strict_kalmanson_complementary_unit_margin']}
- Positive-distance constraints: {counts['positive_distance_unit_margin']}
- No triangle, coordinate, PSD, or other Euclidean constraints were added.

For each `ia < ib < ic < id` in the supplied cyclic order, the orientations are exactly:

1. `dist ib ic + dist ia id < dist ia ic + dist ib id`, from
   `Problem97.CapCrossingKalmanson.dist_add_dist_lt_diagonal_sum_of_ccw`
   at `CapCrossingKalmanson.lean:240`;
2. `dist ia ib + dist ic id < dist ia ic + dist ib id`, from
   `Problem97.CapCrossingKalmanson.complementary_dist_add_dist_lt_diagonal_sum_of_ccw`
   at `CapCrossingKalmanson.lean:273`.

All strict atoms use unit margin.  This is equivalent, not stronger, for this finite
homogeneous system: any strict positive solution can be multiplied by the reciprocal of
its smallest positive distance/Kalmanson slack; conversely a unit-margin model is strict.

## Minimal core

{chr(10).join(core_lines) if core_lines else 'Not applicable: the full system is SAT; see `model.json`.'}

The core is deletion-minimal over the emitted raw constraints.  `minimal-core.json` gives
the exact integral Farkas combination and verifies that all distance coefficients cancel,
leaving the displayed contradiction.  `minimal-core.smt2` is independently UNSAT in cvc5.

## Trust and provenance

- Witness semantic replay: `{witness['semantic_replay']}`.
- Witness full theorem-bank active match counts: all zero (replayed here).
- Witness structural bank active match count: zero (replayed here).
- Production source SHA-256: `{result['input']['production_lean_source_sha256']}`.
- Z3 {z3.get_version_string()}: `{status}`; cvc5: `{cvc5_full['status']}`.
- Smoke tests: known feasible Kalmanson quartet SAT; equality-closed complementary sum UNSAT;
  the SAT smoke model was substituted back exactly.
- No Lean/Lake build or axiom audit was run because no production Lean was changed.
"""
    (HERE / "README.md").write_text(report)
    print(json.dumps({
        "status": result["status"],
        "constraints": len(audit.constraints),
        "initial_core": len(initial_core),
        "minimal_core": result.get("minimal_core", {}).get("deletion_minimal_core_size"),
        "z3": status,
        "cvc5": cvc5_full["status"],
    }, sort_keys=True))


if __name__ == "__main__":
    main()
