#!/usr/bin/env python3
"""Parameterized feasibility probe for the FreshThird adjacent-grid motif.

The two four-point selected circles are parameterized by rational coordinates

    U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2)),
    P(r,t) = (1,0) + r U(t).

Consequently every selected member has squared distance exactly ``r^2`` from
the first apex.  The eight member equalities are identities, not constraints.
SciPy is used only to propose parameters.  A reported witness is rebuilt with
``fractions.Fraction`` and every source constraint is then checked exactly.

This remains a frozen-signature, exact-17 diagnostic.  It is not a FreshThird
producer, a general-cardinality result, or a proof of P97.
"""

from __future__ import annotations

import argparse
import json
import math
import sys
import time
from dataclasses import asdict
from fractions import Fraction
from itertools import combinations
from pathlib import Path
from typing import Any, Callable

import numpy as np
from scipy.optimize import minimize

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import freshthird_adjacent_grid_metric_v1 as core  # noqa: E402


RESULTS_PATH = HERE / "results.json"
OUT_PATH = HERE / "parametric_results.json"
REPORT_PATH = HERE / "parametric_RESULTS.md"


def frac(value: float, denominator: int) -> Fraction:
    return Fraction(float(value)).limit_denominator(denominator)


def unit(t: Any) -> tuple[Any, Any]:
    den = 1 + t * t
    return (1 - t * t) / den, 2 * t / den


def det(a: tuple[Any, Any], b: tuple[Any, Any], c: tuple[Any, Any]) -> Any:
    return (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])


def dot(a: tuple[Any, Any], b: tuple[Any, Any]) -> Any:
    return a[0] * b[0] + a[1] * b[1]


def sub(a: tuple[Any, Any], b: tuple[Any, Any]) -> tuple[Any, Any]:
    return a[0] - b[0], a[1] - b[1]


def norm2(a: tuple[Any, Any]) -> Any:
    return dot(a, a)


def load_signatures() -> list[core.Signature]:
    data = json.loads(RESULTS_PATH.read_text(encoding="utf-8"))
    signatures: list[core.Signature] = []
    for entry in data["signatures"]:
        if entry["structural"] != "sat":
            continue
        raw = dict(entry["signature"])
        raw["orientation"] = entry["orientation"]
        raw["radial_branch"] = entry["radial_branch"]
        for key in ("blockers", "positions"):
            raw[key] = tuple(raw[key])
        for key in ("caps", "rows", "radius_supports", "grid_hits"):
            raw[key] = tuple(tuple(group) for group in raw[key])
        signatures.append(core.Signature(**raw))
    return signatures


def exact_support_projection(sig: core.Signature) -> dict[str, Any]:
    """Give a deterministic exact rational witness for the projection."""
    center = core.APICES[0]
    labels = {center} | set(sig.radius_supports[0]) | set(sig.radius_supports[1])
    boundary = [point for point in sig.boundary if point in labels]
    pivot = boundary.index(center)
    boundary = boundary[pivot:] + boundary[:pivot]
    which = {
        point: radius
        for radius, support in enumerate(sig.radius_supports)
        for point in support
    }
    # The radii are deliberately close.  The strict determinant margin is
    # nevertheless exact and recorded below.
    small = Fraction(1_000_000, 1_000_001)
    radii = (small, Fraction(1)) if sig.radial_branch < 2 else (Fraction(1), small)
    points: dict[int, tuple[Fraction, Fraction]] = {center: (Fraction(0), Fraction(0))}
    parameters: dict[int, Fraction] = {}
    for index, point in enumerate(boundary[1:]):
        parameter = Fraction(-index, 10)
        parameters[point] = parameter
        ux, uy = unit(parameter)
        radius = radii[which[point]]
        points[point] = radius * ux, radius * uy

    areas = [
        det(points[boundary[i]], points[boundary[j]], points[boundary[k]])
        for i, j, k in combinations(range(len(boundary)), 3)
    ]
    distance_checks = []
    for radius, support in enumerate(sig.radius_supports):
        expected = radii[radius] * radii[radius]
        for point in support:
            distance_checks.append(norm2(points[point]) == expected)
    order_ok = radii[0] < radii[1] if sig.radial_branch < 2 else radii[1] < radii[0]
    verified = all(area < 0 for area in areas) and all(distance_checks) and order_ok
    if not verified:
        raise RuntimeError(f"support projection construction failed for {sig.orientation} b{sig.radial_branch}")
    return {
        "orientation": sig.orientation,
        "radial_branch": sig.radial_branch,
        "classification": "exact rational support-subsequence witness",
        "boundary_subsequence_rotated": boundary,
        "radii": [str(radius) for radius in radii],
        "parameters": {str(point): str(value) for point, value in parameters.items()},
        "minimum_negative_area_margin": str(min(-area for area in areas)),
        "triple_count": len(areas),
        "exact_validation": "pass",
    }


class FullDirectB0:
    """Parameterized full geometry + selected-member arm for direct branch 0."""

    def __init__(self, sig: core.Signature, timeout_ms: int) -> None:
        if (sig.orientation, sig.radial_branch) != ("direct", 0):
            raise ValueError("this first full probe is source-scoped to direct branch 0")
        support_all = set(sig.radius_supports[0]) | set(sig.radius_supports[1])
        if support_all & set(core.APICES):
            raise ValueError("direct branch 0 parameterization expects no support apex")
        self.sig = sig
        self.timeout_ms = timeout_ms
        self.supports = tuple(set(group) for group in sig.radius_supports)
        self.support_all = support_all
        self.support_points = tuple(sorted(support_all))
        self.free_points = tuple(
            point
            for point in range(core.N)
            if point not in support_all and point not in core.APICES
        )
        self.index: dict[Any, Any] = {}
        cursor = 0
        self.index["radii"] = slice(cursor, cursor + 2)
        cursor += 2
        for point in self.support_points:
            self.index["support", point] = cursor
            cursor += 1
        for point in core.APICES[1:]:
            self.index["apex", point] = cursor
            cursor += 1
        for point in self.free_points:
            self.index["free", point] = slice(cursor, cursor + 2)
            cursor += 2
        self.dimension = cursor

    def coordinates(self, values: Any) -> dict[int, tuple[Any, Any]]:
        points: dict[int, tuple[Any, Any]] = {core.APICES[0]: (values[0] * 0 + 1, values[0] * 0)}
        radii = values[self.index["radii"]]
        for radius, support in enumerate(self.supports):
            for point in support:
                ux, uy = unit(values[self.index["support", point]])
                points[point] = 1 + radii[radius] * ux, radii[radius] * uy
        for point in core.APICES[1:]:
            points[point] = unit(values[self.index["apex", point]])
        for point in self.free_points:
            sl = self.index["free", point]
            points[point] = values[sl][0], values[sl][1]
        return points

    def slacks(self, values: np.ndarray, proposal_margin: float = 2e-7) -> np.ndarray:
        points = self.coordinates(values)
        boundary = self.sig.boundary
        out: list[float] = []
        for i, j, k in combinations(range(core.N), 3):
            out.append(float(-det(points[boundary[i]], points[boundary[j]], points[boundary[k]]) - proposal_margin))
        for point in range(core.N):
            if point not in core.APICES:
                out.append(float(1 - norm2(points[point]) - proposal_margin))
        for a, b, c in ((3, 4, 5), (4, 5, 3), (5, 3, 4)):
            out.append(float(dot(sub(points[b], points[a]), sub(points[c], points[a])) - proposal_margin))
        cap_triples = ((3, 4, 5), (4, 5, 3), (5, 3, 4))
        for cap, (opposite, left, right) in enumerate(cap_triples):
            members = set(self.sig.caps[cap])
            for point in range(core.N):
                product = det(points[point], points[left], points[right]) * det(
                    points[opposite], points[left], points[right]
                )
                if point in members:
                    out.append(float(-product))
                else:
                    out.append(float(product - proposal_margin))
        radii = values[self.index["radii"]]
        out.extend((float(radii[0] - 1e-4), float(radii[1] - radii[0] - proposal_margin), float(1.999 - radii[1])))
        return np.asarray(out)

    def exact_validate(self, values: list[Fraction]) -> tuple[list[str], dict[str, str]]:
        points = self.coordinates(values)
        failures: list[str] = []
        boundary = self.sig.boundary
        areas = [
            det(points[boundary[i]], points[boundary[j]], points[boundary[k]])
            for i, j, k in combinations(range(core.N), 3)
        ]
        if not all(value < 0 for value in areas):
            failures.append("strict boundary triple")
        pair_distances = [
            norm2(sub(points[left], points[right]))
            for left, right in combinations(range(core.N), 2)
        ]
        if not all(value > 0 for value in pair_distances):
            failures.append("pairwise distinctness")
        disk = [Fraction(1) - norm2(points[point]) for point in range(core.N) if point not in core.APICES]
        if not all(value >= 0 for value in disk):
            failures.append("MEC disk")
        apex_norms = [norm2(points[point]) for point in core.APICES]
        if apex_norms != [Fraction(1)] * 3:
            failures.append("MEC apex circle")
        apex_dots = [
            dot(sub(points[b], points[a]), sub(points[c], points[a]))
            for a, b, c in ((3, 4, 5), (4, 5, 3), (5, 3, 4))
        ]
        if not all(value >= 0 for value in apex_dots):
            failures.append("non-obtuse apex triangle")
        member_cap_slacks: list[Fraction] = []
        nonmember_cap_margins: list[Fraction] = []
        cap_triples = ((3, 4, 5), (4, 5, 3), (5, 3, 4))
        for cap, (opposite, left, right) in enumerate(cap_triples):
            members = set(self.sig.caps[cap])
            for point in range(core.N):
                product = det(points[point], points[left], points[right]) * det(
                    points[opposite], points[left], points[right]
                )
                if point in members:
                    if product > 0:
                        failures.append(f"cap {cap} member {point}")
                    member_cap_slacks.append(-product)
                else:
                    if product <= 0:
                        failures.append(f"cap {cap} nonmember {point}")
                    nonmember_cap_margins.append(product)
        radii = values[self.index["radii"]]
        if not (0 < radii[0] < radii[1]):
            failures.append("radial order")
        circle_failures = 0
        apex = points[core.APICES[0]]
        for radius, support in enumerate(self.supports):
            expected = radii[radius] * radii[radius]
            for point in support:
                if norm2(sub(points[point], apex)) != expected:
                    circle_failures += 1
        if circle_failures:
            failures.append("parameterization identity")
        nonmember_gaps: list[Fraction] = []
        all_points = set(range(core.N))
        for radius, support in enumerate(self.supports):
            expected = radii[radius] * radii[radius]
            for point in all_points - support:
                gap = norm2(sub(points[point], apex)) - expected
                if gap == 0:
                    failures.append(f"grid nonmember radius {radius} point {point}")
                nonmember_gaps.append(abs(gap))
        margins = {
            "minimum_negative_area_margin": str(min(-value for value in areas)),
            "minimum_pair_squared_distance": str(min(pair_distances)),
            "minimum_disk_slack": str(min(disk)),
            "minimum_apex_dot": str(min(apex_dots)),
            "minimum_member_cap_slack": str(min(member_cap_slacks)),
            "minimum_nonmember_cap_margin": str(min(nonmember_cap_margins)),
            "minimum_grid_nonmember_squared_distance_gap": str(min(nonmember_gaps)),
            "radius_gap": str(radii[1] - radii[0]),
        }
        return sorted(set(failures)), margins

    def parameter_ledger(self, values: list[Fraction]) -> dict[str, Any]:
        points = self.coordinates(values)
        return {
            "radii": [str(value) for value in values[self.index["radii"]]],
            "support_direction_parameters": {
                str(point): str(values[self.index["support", point]])
                for point in self.support_points
            },
            "apex_unit_circle_parameters": {
                str(point): str(values[self.index["apex", point]])
                for point in core.APICES[1:]
            },
            "free_coordinates": {
                str(point): [str(value) for value in values[self.index["free", point]]]
                for point in self.free_points
            },
            "derived_coordinates": {
                str(point): [str(coordinate) for coordinate in points[point]]
                for point in range(core.N)
            },
        }

    def exact_solver_replay(self, values: list[Fraction]) -> dict[str, Any]:
        """Pin the rational witness in the original, unparameterized formula."""
        points = self.coordinates(values)
        stages: list[dict[str, Any]] = []
        for stage in ("grid_members", "grid_exact"):
            replay = core.MetricReplay(self.sig, min(self.timeout_ms, 10_000))
            solver = replay.solver(stage)
            for point in range(core.N):
                x, y = points[point]
                solver.add(replay.x[point] == core.z3.RealVal(f"{x.numerator}/{x.denominator}"))
                solver.add(replay.y[point] == core.z3.RealVal(f"{y.numerator}/{y.denominator}"))
            started = time.monotonic()
            answer = solver.check()
            elapsed = time.monotonic() - started
            answer_name = core.status(answer, solver)
            validation: str | list[str] = "n/a"
            if answer == core.z3.sat:
                errors = replay.validate(stage, solver.model())
                validation = "pass" if not errors else errors
            stages.append(
                {
                    "stage": stage,
                    "formula": f"original unparameterized geometry+{stage} QF_NRA",
                    "z3": answer_name,
                    "cvc5": core.cvc5_status(solver.to_smt2(), min(self.timeout_ms, 10_000)),
                    "seconds": round(elapsed, 3),
                    "independent_semantic_validation": validation,
                }
            )
        return {"stages": stages}

    @staticmethod
    def _model_float(model: Any, term: Any) -> float:
        value = model.eval(term, model_completion=True)
        if hasattr(value, "numerator_as_long"):
            return value.numerator_as_long() / value.denominator_as_long()
        text = value.as_decimal(30).rstrip("?")
        return float(text)

    @staticmethod
    def _t_from_unit(x: float, y: float) -> float:
        if 1 + x > 1e-8:
            return y / (1 + x)
        return math.copysign(40.0, y if y else 1.0)

    def initial_from_exact_geometry(self) -> tuple[np.ndarray, dict[str, Any]]:
        replay = core.MetricReplay(self.sig, self.timeout_ms)
        solver = replay.solver("geometry")
        started = time.monotonic()
        answer = solver.check()
        elapsed = time.monotonic() - started
        if answer != core.z3.sat:
            raise RuntimeError(f"geometry seed was not SAT: {core.status(answer, solver)}")
        model = solver.model()
        errors = replay.validate("geometry", model)
        if errors:
            raise RuntimeError(f"geometry seed validation failed: {errors[:5]}")
        point0 = {
            point: np.asarray(
                [self._model_float(model, replay.x[point]), self._model_float(model, replay.y[point])]
            )
            for point in range(core.N)
        }
        values = np.zeros(self.dimension)
        center = np.asarray([1.0, 0.0])
        for radius, support in enumerate(self.supports):
            values[radius] = np.mean([np.linalg.norm(point0[point] - center) for point in support])
            for point in support:
                direction = point0[point] - center
                direction /= np.linalg.norm(direction)
                values[self.index["support", point]] = self._t_from_unit(*direction)
        for point in core.APICES[1:]:
            direction = point0[point] / np.linalg.norm(point0[point])
            values[self.index["apex", point]] = self._t_from_unit(*direction)
        for point in self.free_points:
            values[self.index["free", point]] = point0[point]
        # Put the seed in the required radius-order chamber.
        if values[1] <= values[0] + 1e-3:
            midpoint = (values[0] + values[1]) / 2
            values[0], values[1] = max(1e-3, midpoint - 5e-3), min(1.99, midpoint + 5e-3)
        return values, {"z3": "sat", "seconds": round(elapsed, 3), "independent_validation": "pass"}

    def propose(self, maxiter: int) -> tuple[np.ndarray, dict[str, Any]]:
        seed, geometry = self.initial_from_exact_geometry()
        bounds: list[tuple[float, float]] = [(1e-4, 1.999), (1e-4, 1.999)]
        bounds += [(-50.0, 50.0)] * (len(self.support_points) + 2)
        bounds += [(-1.0, 1.0)] * (2 * len(self.free_points))

        def penalty(values: np.ndarray) -> float:
            slacks = self.slacks(values)
            violations = np.minimum(slacks, 0.0)
            return float(np.dot(violations, violations) * 1e6)

        first = minimize(
            penalty,
            seed,
            method="L-BFGS-B",
            bounds=bounds,
            options={"maxiter": maxiter, "ftol": 1e-15, "maxls": 50},
        )
        second = minimize(
            lambda _: 0.0,
            first.x,
            method="SLSQP",
            bounds=bounds,
            constraints={"type": "ineq", "fun": self.slacks},
            options={"maxiter": maxiter, "ftol": 1e-12, "disp": False},
        )
        best = second.x if self.slacks(second.x).min() >= self.slacks(first.x).min() else first.x
        return best, {
            "geometry_seed": geometry,
            "lbfgsb": {
                "success": bool(first.success),
                "iterations": int(first.nit),
                "penalty": float(first.fun),
                "minimum_slack": float(self.slacks(first.x).min()),
            },
            "slsqp": {
                "success": bool(second.success),
                "iterations": int(second.nit),
                "message": str(second.message),
                "minimum_slack": float(self.slacks(second.x).min()),
            },
        }

    def run(self, maxiter: int) -> dict[str, Any]:
        proposal, optimizer = self.propose(maxiter)
        readbacks: list[dict[str, Any]] = []
        for denominator in (1_000, 10_000, 100_000, 1_000_000, 10_000_000):
            exact = [frac(value, denominator) for value in proposal]
            failures, margins = self.exact_validate(exact)
            record = {"max_denominator": denominator, "failures": failures, "margins": margins}
            readbacks.append(record)
            if not failures:
                solver_replay = self.exact_solver_replay(exact)
                if any(
                    stage["z3"] != "sat"
                    or stage["cvc5"] != "sat"
                    or stage["independent_semantic_validation"] != "pass"
                    for stage in solver_replay["stages"]
                ):
                    record["failures"] = ["original formula replay"]
                    continue
                return {
                    "orientation": self.sig.orientation,
                    "radial_branch": self.sig.radial_branch,
                    "classification": "exact rational geometry+grid_exact witness",
                    "parameterization": "U(t)=((1-t^2)/(1+t^2),2t/(1+t^2)); P=(1,0)+rU(t)",
                    "optimizer": optimizer,
                    "readbacks": readbacks,
                    "exact_validation": "pass",
                    "original_formula_replay": solver_replay,
                    "exact_witness": self.parameter_ledger(exact),
                    "signature": asdict(self.sig),
                }
        return {
            "orientation": self.sig.orientation,
            "radial_branch": self.sig.radial_branch,
            "classification": "unresolved; numerical proposal has no exact validated readback",
            "optimizer": optimizer,
            "readbacks": readbacks,
            "exact_validation": "fail",
        }


def smoke_parameterization() -> dict[str, Any]:
    values = (Fraction(-2), Fraction(-1, 3), Fraction(0), Fraction(2, 5), Fraction(7))
    checks = []
    for radius in (Fraction(1, 7), Fraction(3, 2)):
        for parameter in values:
            ux, uy = unit(parameter)
            point = Fraction(1) + radius * ux, radius * uy
            checks.append(norm2(sub(point, (Fraction(1), Fraction(0)))) == radius * radius)
    if not all(checks):
        raise RuntimeError("rational-circle identity smoke failed")
    return {
        "case": "rational_circle_identity",
        "instances": len(checks),
        "exact_validation": "pass",
    }


def render(report: dict[str, Any]) -> str:
    projection_passes = sum(item["exact_validation"] == "pass" for item in report["support_projection"])
    full = report["full_geometry_grid_members"]
    if full["exact_validation"] == "pass":
        outcome = (
            "An exact rational witness realizes the frozen direct-0 full geometry + "
            "grid-exact arm (members and nonmembers).  This is a realizable local counterexample motif at that "
            "stage, not a witness for the later row/slice/Kalmanson packet."
        )
    else:
        outcome = "The full geometry + grid-members arm remains unresolved; no numerical proposal is treated as SAT."
    return f"""# Parameterized FreshThird adjacent-grid metric probe

## Outcome

{outcome}

All {projection_passes}/4 support-subsequence arms have exact rational witnesses.
The eight apex-centered member equalities are eliminated identically by the
rational circle parameterization, and every reported witness is rebuilt and
checked with exact `Fraction` arithmetic.

## ENCODED

- the frozen exact-17 signature from `results.json`;
- the full direct-0 MEC gauge, unit apex circle, disk containment, non-obtuse
  apex triangle, all 680 strict boundary determinants, and all exact cap signs;
- both disjoint four-point first-apex selected supports and their strict radius
  order, with the eight member equations true by construction and every
  first-apex nonmember exclusion checked exactly;
- positive named distances implicitly, since strict convexity makes all labels
  distinct.

## OMITTED

- both exact blocker-centered source rows;
- FreshThird singleton own-cap slices;
- the strict Kalmanson conclusion;
- unsampled incidence signatures, a producer for `SharedBoundaryRadialOrder`,
  any general-cardinality lift, and the P97 headline conclusion.

## Controls and trust boundary

- exact rational-circle identity smoke: {report['smoke']['exact_validation']};
- support projections: exact rational validation, {projection_passes}/4 pass;
- full arm status: {full['classification']};
- SciPy output is proposal generation only.  Numerical near-models are never
  classified SAT.  The positive verdict, if present, rests on source-auditable
  exact rational substitution rather than a floating-point tolerance.

Machine-readable parameters, margins, optimizer diagnostics, and the frozen
signature are in `parametric_results.json`.
"""


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--maxiter", type=int, default=4_000)
    args = parser.parse_args()
    signatures = load_signatures()
    projections = [exact_support_projection(sig) for sig in signatures]
    direct0 = next(sig for sig in signatures if (sig.orientation, sig.radial_branch) == ("direct", 0))
    report = {
        "classification": "frozen-signature producer-side diagnostic; not P97 closure",
        "parameterization": {
            "unit": "U(t)=((1-t^2)/(1+t^2),2t/(1+t^2))",
            "selected_point": "P_r,p=(1,0)+rho_r*U(t_r,p)",
            "selected_squared_radius": "q_r=rho_r^2 (identity, not an asserted equality)",
        },
        "smoke": smoke_parameterization(),
        "support_projection": projections,
        "full_geometry_grid_members": FullDirectB0(direct0, args.timeout_ms).run(args.maxiter),
        "encoded": [
            "frozen exact-17 direct-0 signature",
            "MEC gauge, disk, apex circle and non-obtuse apex triangle",
            "all strict boundary triples and exact cap classifications",
            "eight selected-support memberships, all nonmember exclusions, and supplied strict radius order",
        ],
        "omitted": [
            "source rows",
            "singleton source slices",
            "strict Kalmanson conclusion",
            "unsampled signatures and general-n lift",
        ],
    }
    OUT_PATH.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    REPORT_PATH.write_text(render(report), encoding="utf-8")
    print(render(report))
    return 0 if report["full_geometry_grid_members"]["exact_validation"] == "pass" else 2


if __name__ == "__main__":
    raise SystemExit(main())
