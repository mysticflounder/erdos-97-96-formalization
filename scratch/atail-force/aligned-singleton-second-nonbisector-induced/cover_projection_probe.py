#!/usr/bin/env python3
"""Non-recursive named-carrier projection of minimal unique-four covers.

This is a necessary-condition probe only.  For every provenance-certified
named occurrence x it introduces one abstract cover center kappa(x) and the
center's row on the *existing* named quotient.  Fresh cover centers and the
three unnamed members completing x's selected K4 shell are not recursively
added to the covered target set.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import os
import time
from collections import Counter, defaultdict
from pathlib import Path
from typing import Any, Iterable

import z3

import cegar


SCHEMA = "p97-named-carrier-minimal-cover-projection-v1"

# These literals are deliberately independent of cegar's role constants.  A
# drift check below fails closed before a packet can be attached to a new role.
BASE_CARRIER_ROLES = (
    "a0", "a1", "a2", "p1", "p2", "r1", "r2", "q", "other", "z", "t",
    "source", "b1", "b2", "bs", "bz", "s2", "s3", "s4", "p3", "p4",
    "r3", "r4", "z2", "z3", "z4",
)
ESCAPE_SELECTED_SHELL_ROLES = ("be", "escape", "e2", "e3", "e4")
APEX_COVER_CARRIER_ROLES = (
    "ca0", "ca0_2", "ca0_3", "ca0_4",
    "ca1", "ca1_2", "ca1_3", "ca1_4",
    "ca2", "ca2_2", "ca2_3", "ca2_4",
)
CARDINALITY_COVER_CARRIER_ROLES = (
    "c4", "c4_1", "c4_2", "c4_3", "c4_4",
    "c5", "c5_1", "c5_2", "c5_3", "c5_4",
)
CAP_CARDINALITY_CARRIER_ROLES = (
    "first6",
    "opp1_1", "opp1_2", "opp1_3", "opp1_4",
    "opp2_1", "opp2_2", "opp2_3", "opp2_4",
)

PROVENANCE = {
    "live_base_carrier_witness": BASE_CARRIER_ROLES,
    # In the robust arm, `escape` is the selected support point named by the
    # outer abstraction, not the raw robust leaf escapePoint omitted from W.
    "escape_center_and_selected_shell": ESCAPE_SELECTED_SHELL_ROLES,
    "minimality_apex_cover_center_and_shell": APEX_COVER_CARRIER_ROLES,
    "minimality_cardinality_cover_center_and_shell":
        CARDINALITY_COVER_CARRIER_ROLES,
    "cap_cardinality_carrier_witness": CAP_CARDINALITY_CARRIER_ROLES,
}

KNOWN_SHELLS_BASE = (
    ("b1", ("p1", "p2", "q", "other"), True),
    ("b2", ("r1", "r2", "z", "t"), True),
    ("bs", ("source", "s2", "s3", "s4"), True),
    ("bz", ("z", "z2", "z3", "z4"), True),
)


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def write_json_atomic(path: Path, payload: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    os.replace(temporary, path)


def active_provenance(global_tier: str) -> dict[str, tuple[str, ...]]:
    result = {
        "live_base_carrier_witness": BASE_CARRIER_ROLES,
        "escape_center_and_selected_shell": ESCAPE_SELECTED_SHELL_ROLES,
    }
    if global_tier in ("apex-cover", "full"):
        result["minimality_apex_cover_center_and_shell"] = (
            APEX_COVER_CARRIER_ROLES
        )
    if global_tier == "full":
        result["minimality_cardinality_cover_center_and_shell"] = (
            CARDINALITY_COVER_CARRIER_ROLES
        )
        result["cap_cardinality_carrier_witness"] = (
            CAP_CARDINALITY_CARRIER_ROLES
        )
    return result


def provenance_audit(
    names: Iterable[str], global_tier: str
) -> tuple[tuple[str, ...], dict[str, object]]:
    groups = active_provenance(global_tier)
    certified = tuple(role for roles in groups.values() for role in roles)
    duplicates = sorted(
        role for role, count in Counter(certified).items() if count != 1
    )
    current = tuple(names)
    unknown = sorted(set(current) - set(certified))
    absent = sorted(set(certified) - set(current))
    constant_drift = {
        "base": tuple(cegar.BASE_ROLES) != BASE_CARRIER_ROLES,
        "escape": tuple(cegar.ESCAPE_ROLES) != ESCAPE_SELECTED_SHELL_ROLES,
        "apex_cover":
            tuple(cegar.APEX_COVER_ROLES) != APEX_COVER_CARRIER_ROLES,
        "card_cover":
            tuple(cegar.CARD_COVER_ROLES)
            != CARDINALITY_COVER_CARRIER_ROLES,
        "cap_cardinality":
            tuple(cegar.CAP_CARDINALITY_ROLES)
            != CAP_CARDINALITY_CARRIER_ROLES,
    }
    audit = {
        "groups": {key: list(value) for key, value in groups.items()},
        "certified_roles": list(certified),
        "unknown_outer_roles": unknown,
        "certified_roles_absent_from_outer": absent,
        "duplicate_certifications": duplicates,
        "cegar_constant_drift": constant_drift,
        "robust_escape_role_note": (
            "`escape` denotes a selected support point of be; the raw robust "
            "leaf escapePoint is not a named occurrence in this abstraction."
        ),
    }
    if duplicates or unknown or absent or any(constant_drift.values()):
        raise ValueError("carrier provenance manifest does not match outer roles")
    return certified, audit


def known_shells(global_tier: str, escape_arm: str):
    shells = list(KNOWN_SHELLS_BASE)
    shells.append(("be", ("escape", "e2", "e3", "e4"),
                   escape_arm == "critical"))
    if global_tier in ("apex-cover", "full"):
        shells.extend((
            ("ca0", ("a0", "ca0_2", "ca0_3", "ca0_4"), True),
            ("ca1", ("a1", "ca1_2", "ca1_3", "ca1_4"), True),
            ("ca2", ("a2", "ca2_2", "ca2_3", "ca2_4"), True),
        ))
    if global_tier == "full":
        shells.extend((
            ("c4", ("c4_1", "c4_2", "c4_3", "c4_4"), True),
            ("c5", ("c5_1", "c5_2", "c5_3", "c5_4"), True),
        ))
    return tuple(shells)


class CoverProjection:
    """Quantifier-free cover packets over one already-built OuterMap."""

    def __init__(self, outer: cegar.OuterMap, targets: tuple[str, ...]) -> None:
        self.outer = outer
        self.targets = targets
        self.n = outer.n
        # The optimized outer map is pure QF_UFBV, while anonymous cover
        # centers intentionally live in a larger integer universe.  Transfer
        # the outer assertions to a general solver before adding the mixed
        # Int/BV projection; adding Int terms to SolverFor("QF_UFBV") can yield
        # non-numeral model readback even after a SAT result.
        outer_assertions = outer.solver.assertions()
        outer.solver = z3.Solver()
        outer.solver.add(*outer_assertions)
        self.center = {x: z3.Int(f"cover_center_{x}") for x in targets}
        self.row = z3.Function(
            "cover_row_class", z3.IntSort(), z3.IntSort(), z3.IntSort()
        )
        self.counts: Counter[str] = Counter()
        self.cuts: Counter[str] = Counter()
        self.cut_keys: set[tuple[Any, ...]] = set()
        self._add_hard_constraints()

    def add(self, block: str, *constraints: z3.BoolRef) -> None:
        self.outer.solver.add(*constraints)
        self.counts[block] += len(constraints)

    def rank(self, name: str):
        # OuterMap uses bounded unsigned bit-vectors for faster quotient
        # congruence.  The cover projection also admits anonymous centers with
        # labels beyond the named quotient, so keep its row universe integral
        # and embed named ranks explicitly.
        return z3.BV2Int(
            self.outer.rank[self.outer.ix(name)],
            is_signed=False,
        )

    def dclass(self, left: str, right: str):
        return z3.BV2Int(
            self.outer.dclass(left, right),
            is_signed=False,
        )

    def rho(self, target: str, point: str):
        return self.row(self.center[target], self.rank(point))

    def sigma(self, target: str):
        return self.rho(target, target)

    def _add_hard_constraints(self) -> None:
        label_bound = max(self.n, self.n * (self.n - 1) // 2)
        for target in self.targets:
            center = self.center[target]
            sigma = self.sigma(target)
            self.add("cover_center_bounds", 0 <= center, center < 2 * self.n)
            self.add("cover_center_not_target", center != self.rank(target))
            self.add("selected_radius_positive", sigma > 0)
            for point in self.outer.names:
                value = self.rho(target, point)
                self.add("cover_row_bounds", 0 <= value, value <= label_bound)
                self.add(
                    "cover_zero_distance",
                    (value == 0) == (center == self.rank(point)),
                )
            for apex in ("a0", "a1", "a2"):
                self.add(
                    "fully_robust_center_exclusion",
                    center != self.rank(apex),
                )
            if self.outer.escape_arm == "robust":
                self.add(
                    "fully_robust_center_exclusion",
                    center != self.rank("be"),
                )
            self.add(
                "no_center_covers_all_apices",
                z3.Not(z3.And(*(
                    self.rho(target, apex) == sigma
                    for apex in ("a0", "a1", "a2")
                ))),
            )

        # If the abstract center aliases a named point, its row is the named
        # metric-incidence row already encoded by the outer UF.
        for center_name in self.outer.names:
            center_rank = self.rank(center_name)
            for point in self.outer.names:
                value = self.row(center_rank, self.rank(point))
                self.add(
                    "named_center_row_link",
                    value == self.dclass(center_name, point),
                )

        # One unique-four center has one selected radius, even if two target
        # occurrences select it through different minimality invocations.
        for left, right in itertools.combinations(self.targets, 2):
            self.add(
                "shared_center_selected_radius",
                z3.Implies(
                    self.center[left] == self.center[right],
                    self.sigma(left) == self.sigma(right),
                ),
            )

        for target in self.targets:
            for shell_center, support, is_unique in known_shells(
                self.outer.global_tier, self.outer.escape_arm
            ):
                if is_unique:
                    self.add(
                        "known_unique_shell_radius_sync",
                        z3.Implies(
                            self.center[target] == self.rank(shell_center),
                            self.sigma(target)
                            == self.dclass(shell_center, support[0]),
                        ),
                    )
                for triple in itertools.combinations(support, 3):
                    self.add(
                        "known_shell_overlap_le_two",
                        z3.Implies(
                            self.center[target] != self.rank(shell_center),
                            z3.Not(z3.And(*(
                                self.rho(target, point) == self.sigma(target)
                                for point in triple
                            ))),
                        ),
                    )

    @staticmethod
    def _int(model: z3.ModelRef, expr: z3.ExprRef) -> int:
        value = model.eval(expr, model_completion=True)
        if not z3.is_int_value(value):
            raise ValueError(f"non-integral model value: {value}")
        return value.as_long()

    def representatives(self, model: z3.ModelRef) -> tuple[str, ...]:
        by_rank: dict[int, str] = {}
        for name in self.outer.names:
            by_rank.setdefault(self._int(model, self.rank(name)), name)
        return tuple(by_rank[key] for key in sorted(by_rank))

    def _alias_guards(self, points: tuple[str, ...]):
        return [
            self.rank(left) == self.rank(right)
            for left, right in itertools.combinations(points, 2)
        ]

    def find_violations(
        self, model: z3.ModelRef
    ) -> list[tuple[str, tuple[Any, ...], z3.BoolRef]]:
        reps = self.representatives(model)
        selected: dict[str, tuple[str, ...]] = {}
        violations: list[tuple[str, tuple[Any, ...], z3.BoolRef]] = []
        for target in self.targets:
            sigma_value = self._int(model, self.sigma(target))
            groups: defaultdict[int, list[str]] = defaultdict(list)
            for point in reps:
                groups[self._int(model, self.rho(target, point))].append(point)
            chosen = tuple(groups.get(sigma_value, ()))
            selected[target] = chosen
            if len(chosen) >= 5:
                points = chosen[:5]
                cut = z3.Or(
                    *self._alias_guards(points),
                    *(self.rho(target, point) != self.sigma(target)
                      for point in points),
                )
                violations.append(
                    ("selected_named_card_le_four", (target, *points), cut)
                )
            for label, members in sorted(groups.items()):
                if label == sigma_value or len(members) < 4:
                    continue
                points = tuple(members[:4])
                cut = z3.Or(
                    *self._alias_guards(points),
                    *(self.rho(target, point) != self.rho(target, points[0])
                      for point in points[1:]),
                    self.rho(target, points[0]) == self.sigma(target),
                )
                violations.append(
                    ("alternative_named_card_le_three", (target, *points), cut)
                )
                break

        for left, right in itertools.combinations(self.targets, 2):
            if self._int(model, self.center[left]) == self._int(
                model, self.center[right]
            ):
                continue
            common = tuple(point for point in reps
                           if point in selected[left] and point in selected[right])
            if len(common) >= 3:
                points = common[:3]
                cut = z3.Or(
                    self.center[left] == self.center[right],
                    *self._alias_guards(points),
                    *(self.rho(left, point) != self.sigma(left)
                      for point in points),
                    *(self.rho(right, point) != self.sigma(right)
                      for point in points),
                )
                violations.append(
                    ("distinct_shell_overlap_le_two",
                     (left, right, *points), cut)
                )
        return violations

    def add_validated_cut(
        self,
        model: z3.ModelRef,
        kind: str,
        key: tuple[Any, ...],
        cut: z3.BoolRef,
    ) -> None:
        full_key = (kind, *key)
        if full_key in self.cut_keys:
            raise RuntimeError(f"duplicate lazy violation: {full_key!r}")
        if not z3.is_false(model.eval(cut, model_completion=True)):
            raise RuntimeError(f"lazy cut does not exclude current model: {full_key!r}")
        self.outer.solver.add(cut)
        self.cut_keys.add(full_key)
        self.cuts[kind] += 1

    def survivor(self, model: z3.ModelRef) -> dict[str, object]:
        reps = self.representatives(model)
        packets = {}
        for target in self.targets:
            sigma = self._int(model, self.sigma(target))
            selected = [
                point for point in reps
                if self._int(model, self.rho(target, point)) == sigma
            ]
            groups: Counter[int] = Counter(
                self._int(model, self.rho(target, point)) for point in reps
            )
            packets[target] = {
                "center_id": self._int(model, self.center[target]),
                "selected_radius_class": sigma,
                "selected_named_representatives": selected,
                "largest_alternative_named_class": max(
                    (size for label, size in groups.items() if label != sigma),
                    default=0,
                ),
            }
        return {
            "quotient_representatives": list(reps),
            "packets": packets,
        }


def run(args: argparse.Namespace) -> dict[str, object]:
    started = time.monotonic()
    probe_path = Path(__file__).resolve()
    cegar_path = Path(cegar.__file__).resolve()
    base = {
        "schema": SCHEMA,
        "implementation_sha256": sha256_file(probe_path),
        "cegar_implementation_sha256": sha256_file(cegar_path),
        "cegar_schema": cegar.SCHEMA,
        "arguments": {
            "z_branch": args.z_branch,
            "escape_arm": args.escape_arm,
            "global_tier": args.global_tier,
            "solver_timeout_ms": args.solver_timeout_ms,
            "wall_timeout_seconds": args.wall_timeout_seconds,
            "max_iterations": args.max_iterations,
            "max_cuts": args.max_cuts,
            "random_seed": args.random_seed,
        },
        "epistemic_status": "INDUCED_NECESSARY_CONDITION_ONLY",
        "projection_scope": {
            "targets": "provenance-certified named D.A occurrences only",
            "non_recursive": True,
            "anonymous_fillers": (
                "The other members of a target's selected K4 may be outside W "
                "and are not introduced as cover targets."
            ),
        },
        "scope_warning": (
            "Selected and alternative shell cardinalities are checked only on "
            "the named quotient; anonymous carrier points remain opaque."
        ),
        "trust_warning": (
            "SAT/UNSAT is uncertified Z3 evidence for a necessary incidence "
            "projection, not a Lean theorem or Euclidean realization."
        ),
        "opaque_or_oracular": [
            "minimality producer and existence of full-carrier unique-four covers",
            "anonymous points completing each selected four-class",
            "full-carrier alternative-radius cardinality outside named roles",
            "Euclidean distance magnitudes and coordinate realizability",
        ],
    }
    try:
        outer = cegar.OuterMap(
            timeout_ms=args.solver_timeout_ms,
            random_seed=args.random_seed,
            z_branch=args.z_branch,
            escape_arm=args.escape_arm,
            global_tier=args.global_tier,
        )
        targets, provenance = provenance_audit(outer.names, args.global_tier)
    except (ValueError, z3.Z3Exception) as exc:
        return base | {
            "status": "PROVENANCE_OR_CONSTRUCTION_FAIL_CLOSED",
            "reason": str(exc),
            "elapsed_seconds": time.monotonic() - started,
        }
    try:
        projection = CoverProjection(outer, targets)
        outer.solver.set(
            timeout=args.solver_timeout_ms,
            random_seed=args.random_seed,
        )
    except (ValueError, RuntimeError, z3.Z3Exception) as exc:
        return base | {
            "status": "PROJECTION_CONSTRUCTION_FAIL_CLOSED",
            "reason": str(exc),
            "named_occurrences": outer.n,
            "cover_packets": len(targets),
            "provenance": provenance,
            "elapsed_seconds": time.monotonic() - started,
        }
    deadline = started + args.wall_timeout_seconds
    iterations = 0
    solver_calls = 0
    status = "INTERNAL_FAIL_CLOSED"
    reason = "loop terminated without a classified result"
    survivor = None

    while iterations < args.max_iterations:
        if time.monotonic() >= deadline:
            status = "WALL_TIMEOUT_FAIL_CLOSED"
            reason = "wall deadline reached before a validated fixed point"
            break
        solver_calls += 1
        result = outer.solver.check()
        if result == z3.unknown:
            status = "UNKNOWN_FAIL_CLOSED"
            reason = outer.solver.reason_unknown()
            break
        if result == z3.unsat:
            status = "OUTER_UNSAT_SOLVER_EVIDENCE_ONLY"
            reason = "the named cover projection is unsatisfiable"
            break
        model = outer.solver.model()
        try:
            violations = projection.find_violations(model)
        except (ValueError, RuntimeError, z3.Z3Exception) as exc:
            status = "MODEL_VALIDATION_FAIL_CLOSED"
            reason = str(exc)
            break
        if not violations:
            # A second independent scan is the SAT readback check.
            try:
                repeated_violations = projection.find_violations(model)
                candidate_survivor = projection.survivor(model)
            except (ValueError, RuntimeError, z3.Z3Exception) as exc:
                status = "MODEL_READBACK_FAIL_CLOSED"
                reason = str(exc)
                break
            if repeated_violations:
                status = "MODEL_READBACK_FAIL_CLOSED"
                reason = "lazy validator was not stable on repeated readback"
                break
            status = "OUTER_SAT_NAMED_COVER_PROJECTION"
            reason = "validated fixed point of the named necessary projection"
            survivor = candidate_survivor
            break
        if len(projection.cut_keys) + len(violations) > args.max_cuts:
            status = "CUT_BUDGET_FAIL_CLOSED"
            reason = "adding current validated violations would exceed max cuts"
            break
        try:
            for kind, key, cut in violations:
                projection.add_validated_cut(model, kind, key, cut)
        except (ValueError, RuntimeError, z3.Z3Exception) as exc:
            status = "LAZY_CUT_VALIDATION_FAIL_CLOSED"
            reason = str(exc)
            break
        iterations += 1
    else:
        status = "ITERATION_BUDGET_FAIL_CLOSED"
        reason = "maximum lazy-refinement iterations reached"

    payload = base | {
        "status": status,
        "reason": reason,
        "elapsed_seconds": time.monotonic() - started,
        "named_occurrences": outer.n,
        "cover_packets": len(targets),
        "provenance": provenance,
        "iterations_with_cuts": iterations,
        "solver_calls": solver_calls,
        "lazy_cuts": sum(projection.cuts.values()),
        "lazy_cut_counts": dict(sorted(projection.cuts.items())),
        "cover_constraint_counts": dict(sorted(projection.counts.items())),
        "outer_constraint_counts": dict(sorted(outer.counts.items())),
    }
    if survivor is not None:
        payload["survivor"] = survivor
    return payload


def self_test() -> None:
    for tier, expected in (("local", 31), ("apex-cover", 43), ("full", 62)):
        groups = active_provenance(tier)
        roles = tuple(role for values in groups.values() for role in values)
        assert len(roles) == expected and len(set(roles)) == expected
    assert "escape" in ESCAPE_SELECTED_SHELL_ROLES
    local_roles = tuple(
        role for roles in active_provenance("local").values() for role in roles
    )
    audited, audit = provenance_audit(local_roles, "local")
    assert audited == local_roles and not audit["unknown_outer_roles"]
    try:
        provenance_audit(local_roles + ("unproved_new_role",), "local")
    except ValueError:
        pass
    else:
        raise AssertionError("unknown role did not fail the provenance audit")

    # Unit-check each lazy separator in isolation and prove it excludes the
    # forced bad assignment while retaining its intended escape disjunct.
    solver = z3.Solver()
    ranks = [z3.Int(f"test_rank_{i}") for i in range(5)]
    rows = [z3.Int(f"test_row_{i}") for i in range(5)]
    sigma = z3.Int("test_sigma")
    solver.add(z3.Distinct(*ranks), *(row == sigma for row in rows))
    selected_cut = z3.Or(
        *(ranks[i] == ranks[j] for i, j in itertools.combinations(range(5), 2)),
        *(row != sigma for row in rows),
    )
    assert solver.check() == z3.sat
    model = solver.model()
    assert z3.is_false(model.eval(selected_cut, model_completion=True))
    solver.add(selected_cut)
    assert solver.check() == z3.unsat

    solver = z3.Solver()
    rows4 = [z3.Int(f"test_alt_row_{i}") for i in range(4)]
    alt_sigma = z3.Int("test_alt_sigma")
    alt_ranks = [z3.Int(f"test_alt_rank_{i}") for i in range(4)]
    solver.add(z3.Distinct(*alt_ranks), alt_sigma == 9,
               *(row == 7 for row in rows4))
    alternative_cut = z3.Or(
        *(alt_ranks[i] == alt_ranks[j]
          for i, j in itertools.combinations(range(4), 2)),
        *(rows4[i] != rows4[0] for i in range(1, 4)),
        rows4[0] == alt_sigma,
    )
    assert solver.check() == z3.sat
    assert z3.is_false(
        solver.model().eval(alternative_cut, model_completion=True)
    )
    solver.add(alternative_cut)
    assert solver.check() == z3.unsat

    solver = z3.Solver()
    centers = z3.Ints("test_center_left test_center_right")
    shared_ranks = z3.Ints("test_shared_rank_0 test_shared_rank_1 test_shared_rank_2")
    left_rows = z3.Ints("test_left_row_0 test_left_row_1 test_left_row_2")
    right_rows = z3.Ints("test_right_row_0 test_right_row_1 test_right_row_2")
    left_sigma, right_sigma = z3.Ints("test_left_sigma test_right_sigma")
    solver.add(centers[0] != centers[1], z3.Distinct(*shared_ranks),
               *(row == left_sigma for row in left_rows),
               *(row == right_sigma for row in right_rows))
    overlap_cut = z3.Or(
        centers[0] == centers[1],
        *(shared_ranks[i] == shared_ranks[j]
          for i, j in itertools.combinations(range(3), 2)),
        *(row != left_sigma for row in left_rows),
        *(row != right_sigma for row in right_rows),
    )
    assert solver.check() == z3.sat
    assert z3.is_false(solver.model().eval(overlap_cut, model_completion=True))
    solver.add(overlap_cut)
    assert solver.check() == z3.unsat


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path)
    parser.add_argument("--solver-timeout-ms", type=int, default=60_000)
    parser.add_argument("--wall-timeout-seconds", type=float, default=600.0)
    parser.add_argument("--max-iterations", type=int, default=128)
    parser.add_argument("--max-cuts", type=int, default=1024)
    parser.add_argument("--random-seed", type=int, default=0)
    parser.add_argument("--z-branch", choices=("reuse-second", "new"), default="new")
    parser.add_argument("--escape-arm", choices=("critical", "robust"),
                        default="critical")
    parser.add_argument("--global-tier", choices=("local", "apex-cover", "full"),
                        default="full")
    parser.add_argument("--self-test", action="store_true")
    args = parser.parse_args()
    for name in ("solver_timeout_ms", "max_iterations", "max_cuts"):
        if getattr(args, name) <= 0:
            parser.error(f"--{name.replace('_', '-')} must be positive")
    if args.wall_timeout_seconds <= 0:
        parser.error("--wall-timeout-seconds must be positive")
    return args


def main() -> None:
    args = parse_args()
    if args.self_test:
        self_test()
        print(json.dumps({"schema": SCHEMA, "self_test": "PASS"},
                         sort_keys=True))
        return
    payload = run(args)
    if args.output is not None:
        write_json_atomic(args.output, payload)
    print(json.dumps({
        "status": payload["status"],
        "elapsed_seconds": payload["elapsed_seconds"],
        "output": str(args.output) if args.output else None,
    }, sort_keys=True))


if __name__ == "__main__":
    main()
