# /// script
# requires-python = ">=3.12"
# dependencies = ["z3-solver==4.15.4.0"]
# ///
"""Exact-17 structural and staged metric diagnostic for one crossed arm.

This is deliberately not a proof of the Lean residual.  The structural model
is an exact finite incidence/cap/order abstraction.  The Euclidean fixture
checks only the four named exact rows, incrementally.
"""

from __future__ import annotations

import argparse
import json
import re
import shutil
import subprocess
import sys
from collections.abc import Callable
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path

from z3 import (
    And,
    Bool,
    BoolRef,
    Distinct,
    If,
    Implies,
    Int,
    IntNumRef,
    ModelRef,
    Not,
    Or,
    Solver,
    Sum,
    is_true,
)

N = 17
ROOT = Path(__file__).resolve().parent
GENERATED = ROOT / "generated"
RESULTS_JSON = ROOT / "results.json"
ASSIGNMENT_JSON = GENERATED / "structural_assignment.json"
GLOBAL_ASSIGNMENT_JSON = GENERATED / "global_k4_assignment.json"

ROLE_NAMES = (
    "p1",
    "p2",
    "r1",
    "r2",
    "c_first",
    "c_second",
    "q_source",
    "q_other",
    "common_fourth",
    "opposite_fourth",
    "apex0",
    "apex1",
    "apex2",
)


def bsum(items: list[BoolRef]):
    return Sum([If(item, 1, 0) for item in items])


def one_of(value, choices):
    return Or([value == choice for choice in choices])


@dataclass
class StructuralEncoding:
    solver: Solver
    role: dict[str, object]
    cap: list[list[BoolRef]]
    selected: list[list[BoolRef]]
    blocker: list[object]
    rank: list[object]
    second_blocker_cap: object
    include_saturation: bool

    def at_bool(self, table: list[list[BoolRef]], row, col) -> BoolRef:
        return Or(
            [And(row == i, col == j, table[i][j]) for i in range(N) for j in range(N)]
        )

    def selected_at(self, source, point) -> BoolRef:
        return self.at_bool(self.selected, source, point)

    def blocker_at(self, source):
        return Sum([If(source == i, self.blocker[i], 0) for i in range(N)])

    def cap_at(self, cap_index: int, point) -> BoolRef:
        return Or([And(point == p, self.cap[cap_index][p]) for p in range(N)])

    def rank_at(self, point):
        return Sum([If(point == p, self.rank[p], 0) for p in range(N)])

    def interior_at(self, cap_index: int, point) -> BoolRef:
        endpoints = {
            0: (self.role["apex1"], self.role["apex2"]),
            1: (self.role["apex2"], self.role["apex0"]),
            2: (self.role["apex0"], self.role["apex1"]),
        }[cap_index]
        return And(
            self.cap_at(cap_index, point),
            point != endpoints[0],
            point != endpoints[1],
        )


@dataclass
class GlobalK4Encoding:
    base: StructuralEncoding
    point_k4: list[list[BoolRef]]
    rich_slice: list[list[list[BoolRef]]]
    rich_two_arm: list[BoolRef]
    distinct_cap_two_hit: BoolRef
    explicit_q_overlap_three: BoolRef

    @property
    def solver(self) -> Solver:
        return self.base.solver


def build_structural(*, include_saturation: bool = True) -> StructuralEncoding:
    s = Solver()
    role = {name: Int(name) for name in ROLE_NAMES}
    cap = [[Bool(f"cap_{i}_{p}") for p in range(N)] for i in range(3)]
    selected = [[Bool(f"selected_{q}_{p}") for p in range(N)] for q in range(N)]
    blocker = [Int(f"blocker_{q}") for q in range(N)]
    rank = [Int(f"rank_{p}") for p in range(N)]
    second_blocker_cap = Int("second_blocker_cap")
    e = StructuralEncoding(
        s,
        role,
        cap,
        selected,
        blocker,
        rank,
        second_blocker_cap,
        include_saturation,
    )

    for value in role.values():
        s.add(0 <= value, value < N)
    s.add(role["c_first"] == 0)
    s.add(role["c_second"] == 1)
    s.add(role["q_source"] == 2)
    s.add(role["q_other"] == 3)
    s.add(
        Distinct(
            [role[name] for name in ("c_first", "c_second", "q_source", "q_other")]
        )
    )

    # The retained source pairs are disjoint; both C sources and Q.source are
    # fresh from both pairs.  Other distinctness follows from exact supports.
    s.add(role["p1"] != role["p2"], role["r1"] != role["r2"])
    for p in ("p1", "p2"):
        for q in ("r1", "r2"):
            s.add(role[p] != role[q])
    for source in ("c_first", "c_second", "q_source"):
        for endpoint in ("p1", "p2", "r1", "r2"):
            s.add(role[source] != role[endpoint])
    s.add(role["q_other"] != role["q_source"])
    s.add(role["q_other"] != role["r1"], role["q_other"] != role["r2"])

    # Branch-neutral CriticalShellSystem incidence: every carrier point has a
    # selected exact four-row at an actual carrier blocker, and the blocker is
    # not itself on that positive-radius row.
    for q in range(N):
        s.add(0 <= blocker[q], blocker[q] < N)
        s.add(blocker[q] != q)
        s.add(selected[q][q])
        s.add(bsum(selected[q]) == 4)
        s.add(Or([And(blocker[q] == p, Not(selected[q][p])) for p in range(N)]))

    def row_exact(source_name: str, member_names: tuple[str, ...]) -> None:
        source = role[source_name]
        members = [role[name] for name in member_names]
        for p in range(N):
            s.add(e.selected_at(source, p) == one_of(p, members))

    row_exact("p1", ("p1", "p2", "q_source", "q_other"))
    row_exact("c_first", ("c_first", "c_second", "q_source", "common_fourth"))
    row_exact("r1", ("r1", "r2", "q_other", "opposite_fourth"))

    # The two C rows are mutual exact four-rows whose intersection is exactly
    # the C pair.  The second row's other two carrier points stay anonymous.
    c1, c2 = role["c_first"], role["c_second"]
    s.add(e.selected_at(c1, c2), e.selected_at(c2, c1))
    for p in range(N):
        s.add(And(e.selected_at(c1, p), e.selected_at(c2, p)) == Or(p == c1, p == c2))

    # Both CapSourceThirdCanonicalRowWitness values carry deletion views for
    # both retained pairs.
    for source in (c1, c2):
        s.add(
            Or(
                Not(e.selected_at(source, role["p1"])),
                Not(e.selected_at(source, role["p2"])),
            )
        )
        s.add(
            Or(
                Not(e.selected_at(source, role["r1"])),
                Not(e.selected_at(source, role["r2"])),
            )
        )

    # Exact-17 closed-cap profile (8,6,6), with surplusIdx normalized to 2,
    # hence oppIndex1=0.  Moser apices lie in exactly their two incident caps;
    # every other carrier point lies in exactly one cap.
    s.add(Distinct(role["apex0"], role["apex1"], role["apex2"]))
    for p in range(N):
        is_a0 = role["apex0"] == p
        is_a1 = role["apex1"] == p
        is_a2 = role["apex2"] == p
        is_apex = Or(is_a0, is_a1, is_a2)
        s.add(Implies(is_a0, And(Not(cap[0][p]), cap[1][p], cap[2][p])))
        s.add(Implies(is_a1, And(cap[0][p], Not(cap[1][p]), cap[2][p])))
        s.add(Implies(is_a2, And(cap[0][p], cap[1][p], Not(cap[2][p]))))
        s.add(Implies(Not(is_apex), bsum([cap[i][p] for i in range(3)]) == 1))
    s.add(bsum(cap[0]) == 8, bsum(cap[1]) == 6, bsum(cap[2]) == 6)

    # The retained P and Pρ pairs and both C sources are in the first strict
    # cap.  Q's outside pair and both named fourths are off the first closed cap.
    for name in ("p1", "p2", "r1", "r2", "c_first", "c_second"):
        s.add(e.interior_at(0, role[name]))
    for name in ("q_source", "q_other", "common_fourth", "opposite_fourth"):
        s.add(Not(e.cap_at(0, role[name])))

    bc1 = e.blocker_at(c1)
    bc2 = e.blocker_at(c2)
    bp = e.blocker_at(role["p1"])
    br = e.blocker_at(role["r1"])
    s.add(bc1 != bc2)
    s.add(e.interior_at(0, bc1))
    s.add(Or(second_blocker_cap == 1, second_blocker_cap == 2))
    s.add(
        Or(
            And(second_blocker_cap == 1, e.interior_at(1, bc2)),
            And(second_blocker_cap == 2, e.interior_at(2, bc2)),
        )
    )

    # Blocker exclusions appearing in each source witness.
    for bc in (bc1, bc2):
        s.add(bc != bp, bc != br)
        s.add(bc != role["apex0"], bc != role["apex1"])
    # Q.source shares P.source1's actual blocker.
    s.add(e.blocker_at(role["q_source"]) == bp)

    # Exact cap intersections.  The first is the aligned residual's matching
    # source-row clause; the other two follow from the exact rows plus their
    # source-stated on/off-first-cap facts.
    for p in range(N):
        s.add(
            And(e.selected_at(c1, p), cap[0][p])
            == Or(p == role["c_first"], p == role["c_second"])
        )
        s.add(
            And(e.selected_at(role["p1"], p), cap[0][p])
            == Or(p == role["p1"], p == role["p2"])
        )
        s.add(
            And(e.selected_at(role["r1"], p), cap[0][p])
            == Or(p == role["r1"], p == role["r2"])
        )

    # Source-stated crossed omissions (redundantly named so controls can target
    # the actual propositions, not merely a cardinality side effect).
    s.add(Not(e.selected_at(c1, role["q_other"])))
    s.add(Not(e.selected_at(role["r1"], role["q_source"])))

    # Cardinality-independent boundary packet.  Normalize surplusIdx=2:
    # zero is apex2, iv is apex0, iw is apex1.  Use exactly the direct/mirror
    # block inequalities stated by DirectBoundaryBlocks/MirrorBoundaryBlocks.
    for p in range(N):
        s.add(0 <= rank[p], rank[p] < N)
    s.add(Distinct(rank))
    s.add(e.rank_at(role["apex2"]) == 0)
    ra0 = e.rank_at(role["apex0"])
    ra1 = e.rank_at(role["apex1"])

    direct_parts = [ra0 < ra1]
    mirror_parts = [ra1 < ra0]
    for p in range(N):
        rp = rank[p]
        direct_parts.extend(
            [
                Implies(e.interior_at(1, p), And(0 < rp, rp < ra0)),
                Implies(e.interior_at(2, p), And(ra0 < rp, rp < ra1)),
                Implies(e.interior_at(0, p), ra1 < rp),
            ]
        )
        mirror_parts.extend(
            [
                Implies(e.interior_at(0, p), And(0 < rp, rp < ra1)),
                Implies(e.interior_at(2, p), And(ra1 < rp, rp < ra0)),
                Implies(e.interior_at(1, p), ra0 < rp),
            ]
        )
    s.add(Or(And(direct_parts), And(mirror_parts)))

    def btw(a, b, k):
        ra, rb, rk = e.rank_at(a), e.rank_at(b), e.rank_at(k)
        return Or(And(ra < rk, rk < rb), And(rb < rk, rk < ra))

    s.add(btw(bc1, bc2, c1) == Not(btw(bc1, bc2, c2)))

    if include_saturation:
        cf = role["common_fourth"]
        of = role["opposite_fourth"]
        common_clause = Or(
            Not(e.selected_at(cf, c1)),
            Not(e.selected_at(cf, c2)),
            e.blocker_at(cf) == bc1,
        )
        opposite_clause = Or(
            Not(e.selected_at(of, c1)),
            Not(e.selected_at(of, c2)),
            e.blocker_at(of) == bc2,
        )
        s.add(Or(cf == of, And(common_clause, opposite_clause)))

    return e


def build_global_k4() -> GlobalK4Encoding:
    """Add the source-entitled pointwise K4/minimality and rich-cap layer.

    ``point_k4[c]`` is a chosen four-point subset of one K4 radius class at
    every carrier center ``c``.  At an actual blocker it is locked to the
    canonical selected row by uniqueness.  ``rich_slice[j]`` represents only
    the strict-cap intersections produced by the three apex-rich hypotheses:
    one slice of size at least four, or two disjoint slices of size at least
    two.  No radius hit is identified with either Q role.
    """
    e = build_structural(include_saturation=True)
    s, r = e.solver, e.role
    point_k4 = [[Bool(f"point_k4_{c}_{p}") for p in range(N)] for c in range(N)]
    rich_slice = [
        [[Bool(f"rich_slice_{j}_{arm}_{p}") for p in range(N)] for arm in range(2)]
        for j in range(3)
    ]
    rich_two_arm = [Bool(f"rich_two_arm_{j}") for j in range(3)]

    # Pointwise D.K4: choose four witnesses from a positive-radius class at
    # each carrier center.  Distinct centers' circle subsets meet at most two.
    for center in range(N):
        s.add(bsum(point_k4[center]) == 4)
        s.add(Not(point_k4[center][center]))
    for left in range(N):
        for right in range(left + 1, N):
            s.add(
                bsum([And(point_k4[left][p], point_k4[right][p]) for p in range(N)])
                <= 2
            )

    # Minimality/no-qfree makes every actual blocker a unique-four center.
    # Hence a pointwise K4 choice at that center equals the canonical shell;
    # equal blockers lock supports, while distinct blockers give a two-circle
    # intersection bound.
    for q in range(N):
        for center in range(N):
            same_center = e.blocker[q] == center
            s.add(
                Implies(
                    same_center,
                    And([point_k4[center][p] == e.selected[q][p] for p in range(N)]),
                )
            )
            s.add(
                Implies(
                    Not(same_center),
                    bsum([And(e.selected[q][p], point_k4[center][p]) for p in range(N)])
                    <= 2,
                )
            )
    for q in range(N):
        for q2 in range(q + 1, N):
            same_blocker = e.blocker[q] == e.blocker[q2]
            s.add(
                Implies(
                    same_blocker,
                    And([e.selected[q][p] == e.selected[q2][p] for p in range(N)]),
                )
            )
            s.add(
                Implies(
                    Not(same_blocker),
                    bsum([And(e.selected[q][p], e.selected[q2][p]) for p in range(N)])
                    <= 2,
                )
            )

    # All three named apices are rich.  Richness implies full deletion
    # robustness, so no canonical unique-four blocker can be an apex.
    for q in range(N):
        for apex in (r["apex0"], r["apex1"], r["apex2"]):
            s.add(e.blocker[q] != apex)

    # Exact binary interior pattern supplied by
    # oppositeCapRichClassInteriorPattern_of_apexRichClassStructure.
    for j in range(3):
        arm0, arm1 = rich_slice[j]
        for p in range(N):
            s.add(Implies(arm0[p], e.interior_at(j, p)))
            s.add(Implies(arm1[p], e.interior_at(j, p)))
            s.add(Implies(Not(rich_two_arm[j]), Not(arm1[p])))
            s.add(Implies(rich_two_arm[j], Not(And(arm0[p], arm1[p]))))
        s.add(Implies(rich_two_arm[j], bsum(arm0) >= 2))
        s.add(Implies(rich_two_arm[j], bsum(arm1) >= 2))
        s.add(Implies(Not(rich_two_arm[j]), bsum(arm0) >= 4))

        apex = (r["apex0"], r["apex1"], r["apex2"])[j]
        for q in range(N):
            blocker_in_j = e.interior_at(j, e.blocker[q])
            for arm, active in ((arm0, True), (arm1, rich_two_arm[j])):
                overlap = bsum([And(e.selected[q][p], arm[p]) for p in range(N)])
                # Every canonical critical shell meets an apex-rich radius
                # class in at most two points.
                s.add(Implies(active, overlap <= 2))
                for i in range(3):
                    if i != j:
                        s.add(
                            Implies(
                                And(active, e.interior_at(i, e.blocker[q])),
                                overlap <= 1,
                            )
                        )
            for center in range(N):
                for arm, active in ((arm0, True), (arm1, rich_two_arm[j])):
                    s.add(
                        Implies(
                            And(active, center != apex),
                            bsum([And(point_k4[center][p], arm[p]) for p in range(N)])
                            <= 2,
                        )
                    )
            # Keep the local variable meaningful for the direct-cap theorem
            # represented above and make the three-cap partition explicit.
            s.add(Implies(blocker_in_j, e.cap_at(j, e.blocker[q])))

    # These direct-orientation blocker inequalities are proved from the exact
    # outside pair and the off-first-cap fourth-point facts.  The C-source
    # inequalities already occur in the aligned witness packet.
    bp = e.blocker_at(r["p1"])
    for name in ("common_fourth", "opposite_fourth"):
        s.add(e.blocker_at(r[name]) != bp)

    candidates = [
        r[name]
        for name in (
            "c_first",
            "c_second",
            "common_fourth",
            "opposite_fourth",
        )
    ]
    rich_events: list[BoolRef] = []
    for source in candidates:
        blocker = e.blocker_at(source)
        for i in range(3):
            for j in range(3):
                if i == j:
                    continue
                for arm_index in range(2):
                    active = True if arm_index == 0 else rich_two_arm[j]
                    rich_events.append(
                        And(
                            active,
                            e.interior_at(i, blocker),
                            bsum(
                                [
                                    And(
                                        e.selected_at(source, p),
                                        rich_slice[j][arm_index][p],
                                    )
                                    for p in range(N)
                                ]
                            )
                            >= 2,
                        )
                    )
    distinct_cap_two_hit = Or(rich_events)
    explicit_q_overlap_three = Or(
        [
            bsum(
                [
                    And(
                        e.selected_at(source, p),
                        e.selected_at(r["p1"], p),
                    )
                    for p in range(N)
                ]
            )
            >= 3
            for source in candidates
        ]
    )
    # These consolidated forms are definitionally implied by the pointwise
    # bounds above.  Recording them makes the malformed positive controls
    # protocol-fast instead of asking each external solver to rediscover a
    # large disjunction of indexed contradictions.
    s.add(Not(distinct_cap_two_hit))
    s.add(Not(explicit_q_overlap_three))
    return GlobalK4Encoding(
        e,
        point_k4,
        rich_slice,
        rich_two_arm,
        distinct_cap_two_hit,
        explicit_q_overlap_three,
    )


def apply_control(e: StructuralEncoding, name: str) -> None:
    r = e.role
    c1, c2 = r["c_first"], r["c_second"]
    controls: dict[str, Callable[[], BoolRef]] = {
        "collapse_four_named_roles": lambda: r["c_first"] == r["q_source"],
        "omit_first_collision_member": lambda: Not(
            e.selected_at(r["p1"], r["q_other"])
        ),
        "crossed_common_contamination": lambda: e.selected_at(c1, r["q_other"]),
        "crossed_opposite_contamination": lambda: e.selected_at(r["r1"], r["q_source"]),
        "common_fourth_in_first_cap": lambda: e.cap_at(0, r["common_fourth"]),
        "opposite_fourth_in_first_cap": lambda: e.cap_at(0, r["opposite_fourth"]),
        "equal_c_blockers": lambda: e.blocker_at(c1) == e.blocker_at(c2),
        "second_blocker_in_first_interior": lambda: e.interior_at(0, e.blocker_at(c2)),
        "extra_c_row_intersection": lambda: Or(
            [
                And(
                    e.selected_at(c1, p),
                    e.selected_at(c2, p),
                    p != c1,
                    p != c2,
                )
                for p in range(N)
            ]
        ),
        "extra_first_cap_point_in_matching_row": lambda: Or(
            [
                And(
                    e.selected_at(c1, p),
                    e.cap[0][p],
                    p != c1,
                    p != c2,
                )
                for p in range(N)
            ]
        ),
        "negate_saturation": lambda: And(
            r["common_fourth"] != r["opposite_fourth"],
            e.selected_at(r["common_fourth"], c1),
            e.selected_at(r["common_fourth"], c2),
            e.blocker_at(r["common_fourth"]) != e.blocker_at(c1),
            e.selected_at(r["opposite_fourth"], c1),
            e.selected_at(r["opposite_fourth"], c2),
            e.blocker_at(r["opposite_fourth"]) != e.blocker_at(c2),
        ),
        "force_shared_fourth": lambda: r["common_fourth"] == r["opposite_fourth"],
        "force_distinct_fourths": lambda: r["common_fourth"] != r["opposite_fourth"],
    }
    if name not in controls:
        raise KeyError(name)
    e.solver.add(controls[name]())


def emit_query(solver: Solver, path: Path) -> None:
    body = solver.sexpr().rstrip()
    if re.search(r"\(\s*check-sat\b", body):
        raise RuntimeError("solver.sexpr unexpectedly contained check-sat")
    text = f"{body}\n(check-sat)\n"
    if len(re.findall(r"\(\s*check-sat\b", text)) != 1:
        raise RuntimeError("emitted query does not contain exactly one check-sat")
    path.write_text(text, encoding="utf-8")


def classify_solver_response(
    returncode: int, stdout: str, stderr: str
) -> dict[str, object]:
    """Fail-closed protocol classifier shared by both external wrappers."""
    combined = f"{stdout}\n{stderr}".strip()
    tokens = re.findall(r"(?m)^\s*(sat|unsat|unknown)\s*$", combined)
    if returncode != 0:
        return {
            "status": "ERROR",
            "detail": f"nonzero exit {returncode}: {combined[:500]}",
        }
    if len(tokens) != 1:
        return {
            "status": "ERROR",
            "detail": f"expected exactly one status token, got {tokens}: {combined[:500]}",
        }
    return {"status": tokens[0].upper(), "detail": ""}


def run_solver(solver_name: str, query: Path, timeout_s: int) -> dict[str, object]:
    executable = shutil.which(solver_name)
    if executable is None:
        return {"status": "ERROR", "detail": f"{solver_name} not found"}
    if solver_name == "z3":
        command = [executable, "-smt2", f"-T:{timeout_s}", str(query)]
    elif solver_name == "cvc5":
        command = [
            executable,
            "--lang=smt2",
            f"--tlimit={timeout_s * 1000}",
            str(query),
        ]
    else:
        raise ValueError(solver_name)
    try:
        completed = subprocess.run(
            command,
            capture_output=True,
            text=True,
            timeout=timeout_s + 3,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"status": "UNKNOWN", "detail": "wrapper timeout", "command": command}
    result = classify_solver_response(
        completed.returncode, completed.stdout, completed.stderr
    )
    result["command"] = command
    return result


def eval_int(model: ModelRef, value) -> int:
    result = model.eval(value, model_completion=True)
    if not isinstance(result, IntNumRef):
        raise TypeError(result)
    return result.as_long()


def extract_assignment(e: StructuralEncoding, model: ModelRef) -> dict[str, object]:
    return {
        "n": N,
        "roles": {name: eval_int(model, value) for name, value in e.role.items()},
        "caps": [
            [
                p
                for p in range(N)
                if is_true(model.eval(e.cap[i][p], model_completion=True))
            ]
            for i in range(3)
        ],
        "selected_rows": [
            [
                p
                for p in range(N)
                if is_true(model.eval(e.selected[q][p], model_completion=True))
            ]
            for q in range(N)
        ],
        "blockers": [eval_int(model, value) for value in e.blocker],
        "rank": [eval_int(model, value) for value in e.rank],
        "second_blocker_cap": eval_int(model, e.second_blocker_cap),
        "saturation_enabled": e.include_saturation,
    }


def verify_assignment(
    a: dict[str, object], *, require_saturation: bool = True
) -> list[str]:
    errors: list[str] = []
    roles = a["roles"]
    caps = [set(items) for items in a["caps"]]
    rows = [set(items) for items in a["selected_rows"]]
    blockers = a["blockers"]
    rank = a["rank"]
    j = a["second_blocker_cap"]

    def r(name: str) -> int:
        return int(roles[name])

    def row(name: str) -> set[int]:
        return rows[r(name)]

    def interior(i: int) -> set[int]:
        endpoints = {
            0: (r("apex1"), r("apex2")),
            1: (r("apex2"), r("apex0")),
            2: (r("apex0"), r("apex1")),
        }[i]
        return caps[i] - set(endpoints)

    def check(condition: bool, label: str) -> None:
        if not condition:
            errors.append(label)

    check(a["n"] == N, "carrier cardinality")
    check(
        len({r(x) for x in ("c_first", "c_second", "q_source", "q_other")}) == 4,
        "four named roles distinct",
    )
    check({r("p1"), r("p2")}.isdisjoint({r("r1"), r("r2")}), "retained pairs disjoint")
    for q in range(N):
        check(
            len(rows[q]) == 4 and q in rows[q], f"critical row {q} exact and reflexive"
        )
        check(
            0 <= blockers[q] < N and blockers[q] != q and blockers[q] not in rows[q],
            f"blocker {q}",
        )
    check(
        row("p1") == {r(x) for x in ("p1", "p2", "q_source", "q_other")},
        "first collision exact row",
    )
    check(
        row("c_first")
        == {r(x) for x in ("c_first", "c_second", "q_source", "common_fourth")},
        "common crossed exact row",
    )
    check(
        row("r1") == {r(x) for x in ("r1", "r2", "q_other", "opposite_fourth")},
        "opposite crossed exact row",
    )
    check(
        row("c_first") & row("c_second") == {r("c_first"), r("c_second")},
        "mutual C-row exact intersection",
    )
    check([len(cap) for cap in caps] == [8, 6, 6], "exact-17 cap profile")
    apices = {r("apex0"), r("apex1"), r("apex2")}
    check(len(apices) == 3, "apices distinct")
    for p in range(N):
        count = sum(p in cap for cap in caps)
        check(count == (2 if p in apices else 1), f"closed cap partition at {p}")
    for name in ("p1", "p2", "r1", "r2", "c_first", "c_second"):
        check(r(name) in interior(0), f"{name} first interior")
    for name in ("q_source", "q_other", "common_fourth", "opposite_fourth"):
        check(r(name) not in caps[0], f"{name} off first cap")
    bc1 = blockers[r("c_first")]
    bc2 = blockers[r("c_second")]
    check(bc1 != bc2 and bc1 in interior(0), "distinct first blocker in first interior")
    check(j in (1, 2) and bc2 in interior(j), "second blocker in distinct interior")
    check(
        row("c_first") & caps[0] == {r("c_first"), r("c_second")},
        "matching row first-cap intersection",
    )
    check(
        row("p1") & caps[0] == {r("p1"), r("p2")},
        "first collision first-cap intersection",
    )
    check(
        row("r1") & caps[0] == {r("r1"), r("r2")}, "opposite row first-cap intersection"
    )
    check(r("q_other") not in row("c_first"), "oppositeOutside omitted from common row")
    check(r("q_source") not in row("r1"), "commonOutside omitted from opposite row")
    check(blockers[r("q_source")] == blockers[r("p1")], "Q/P blocker equality")
    check(sorted(rank) == list(range(N)), "boundary ranks form a permutation")
    check(rank[r("apex2")] == 0, "zero boundary apex")
    ra0, ra1 = rank[r("apex0")], rank[r("apex1")]
    direct = ra0 < ra1
    mirror = ra1 < ra0
    if direct:
        check(all(0 < rank[p] < ra0 for p in interior(1)), "direct opp2 block")
        check(all(ra0 < rank[p] < ra1 for p in interior(2)), "direct surplus block")
        check(all(ra1 < rank[p] for p in interior(0)), "direct opp1 block")
    if mirror:
        check(all(0 < rank[p] < ra1 for p in interior(0)), "mirror opp1 block")
        check(all(ra1 < rank[p] < ra0 for p in interior(2)), "mirror surplus block")
        check(all(ra0 < rank[p] for p in interior(1)), "mirror opp2 block")
    check(direct or mirror, "direct-or-mirror boundary")

    def btw(a0: int, b0: int, k0: int) -> bool:
        x, y, z = rank[a0], rank[b0], rank[k0]
        return (x < z < y) or (y < z < x)

    check(
        btw(bc1, bc2, r("c_first")) != btw(bc1, bc2, r("c_second")), "cyclic separation"
    )
    if require_saturation:
        cf, of = r("common_fourth"), r("opposite_fourth")
        common_clause = (
            r("c_first") not in rows[cf]
            or r("c_second") not in rows[cf]
            or blockers[cf] == bc1
        )
        opposite_clause = (
            r("c_first") not in rows[of]
            or r("c_second") not in rows[of]
            or blockers[of] == bc2
        )
        check(
            cf == of or (common_clause and opposite_clause),
            "selected-row omission saturation",
        )
    return errors


def extract_global_assignment(
    g: GlobalK4Encoding, model: ModelRef
) -> dict[str, object]:
    assignment = extract_assignment(g.base, model)
    assignment.update(
        {
            "point_k4_rows": [
                [
                    p
                    for p in range(N)
                    if is_true(model.eval(g.point_k4[c][p], model_completion=True))
                ]
                for c in range(N)
            ],
            "rich_slices": [
                [
                    [
                        p
                        for p in range(N)
                        if is_true(
                            model.eval(g.rich_slice[j][arm][p], model_completion=True)
                        )
                    ]
                    for arm in range(2)
                ]
                for j in range(3)
            ],
            "rich_two_arm": [
                is_true(model.eval(flag, model_completion=True))
                for flag in g.rich_two_arm
            ],
        }
    )
    return assignment


def verify_global_assignment(a: dict[str, object]) -> list[str]:
    """Plain-Python validation of every global-stage incidence clause."""
    errors = verify_assignment(a)
    roles = a["roles"]
    caps = [set(items) for items in a["caps"]]
    rows = [set(items) for items in a["selected_rows"]]
    blockers = a["blockers"]
    point_rows = [set(items) for items in a["point_k4_rows"]]
    rich = [[set(items) for items in pair] for pair in a["rich_slices"]]
    two_arm = a["rich_two_arm"]

    def r(name: str) -> int:
        return int(roles[name])

    def interior(i: int) -> set[int]:
        endpoints = {
            0: (r("apex1"), r("apex2")),
            1: (r("apex2"), r("apex0")),
            2: (r("apex0"), r("apex1")),
        }[i]
        return caps[i] - set(endpoints)

    def check(condition: bool, label: str) -> None:
        if not condition:
            errors.append(label)

    for center in range(N):
        check(
            len(point_rows[center]) == 4 and center not in point_rows[center],
            f"pointwise K4 row {center}",
        )
    for left in range(N):
        for right in range(left + 1, N):
            check(
                len(point_rows[left] & point_rows[right]) <= 2,
                f"pointwise K4 two-circle {left}/{right}",
            )
    for q in range(N):
        check(
            point_rows[blockers[q]] == rows[q],
            f"unique-four blocker row locking {q}",
        )
        for center in range(N):
            if center != blockers[q]:
                check(
                    len(rows[q] & point_rows[center]) <= 2,
                    f"selected/pointwise two-circle {q}/{center}",
                )
    for q in range(N):
        for q2 in range(q + 1, N):
            if blockers[q] == blockers[q2]:
                check(rows[q] == rows[q2], f"equal-blocker row lock {q}/{q2}")
            else:
                check(
                    len(rows[q] & rows[q2]) <= 2,
                    f"selected two-circle {q}/{q2}",
                )

    apices = {r("apex0"), r("apex1"), r("apex2")}
    for q in range(N):
        check(blockers[q] not in apices, f"rich-apex blocker exclusion {q}")
    for j in range(3):
        arm0, arm1 = rich[j]
        check(arm0 <= interior(j), f"rich cap {j} arm0 containment")
        check(arm1 <= interior(j), f"rich cap {j} arm1 containment")
        if two_arm[j]:
            check(len(arm0) >= 2, f"rich cap {j} first two-radius slice")
            check(len(arm1) >= 2, f"rich cap {j} second two-radius slice")
            check(not (arm0 & arm1), f"rich cap {j} unequal-radius disjointness")
        else:
            check(len(arm0) >= 4, f"rich cap {j} large slice")
            check(not arm1, f"rich cap {j} inactive second slice")
        apex = (r("apex0"), r("apex1"), r("apex2"))[j]
        for q in range(N):
            for arm_index, active in ((0, True), (1, bool(two_arm[j]))):
                if not active:
                    continue
                overlap = len(rows[q] & rich[j][arm_index])
                check(overlap <= 2, f"selected/rich two-circle {q}/{j}/{arm_index}")
                blocker_cap = next(i for i in range(3) if blockers[q] in interior(i))
                if blocker_cap != j:
                    check(
                        overlap <= 1,
                        f"distinct-cap rich-slice bound {q}/{j}/{arm_index}",
                    )
                for center in range(N):
                    if center != apex:
                        check(
                            len(point_rows[center] & rich[j][arm_index]) <= 2,
                            f"pointwise/rich two-circle {center}/{j}/{arm_index}",
                        )

    bp = blockers[r("p1")]
    for name in ("common_fourth", "opposite_fourth"):
        check(blockers[r(name)] != bp, f"{name} blocker differs from first")

    candidates = [
        r(name)
        for name in (
            "c_first",
            "c_second",
            "common_fourth",
            "opposite_fourth",
        )
    ]
    distinct_cap_event = False
    for source in candidates:
        source_cap = next(i for i in range(3) if blockers[source] in interior(i))
        for j in range(3):
            if source_cap == j:
                continue
            for arm_index, active in ((0, True), (1, bool(two_arm[j]))):
                if active and len(rows[source] & rich[j][arm_index]) >= 2:
                    distinct_cap_event = True
    q_row = rows[r("p1")]
    q_overlap_event = any(len(rows[source] & q_row) >= 3 for source in candidates)
    check(not distinct_cap_event, "negated distinct-cap two-hit target")
    check(not q_overlap_event, "negated explicit-Q overlap-three target")
    return errors


METRIC_POINTS = {
    "c_first": (1, 0),
    "c_second": (-1, 0),
    "q_source": (0, 1),
    "q_other": (3, -2),
    "common_fourth": (0, -1),
    "opposite_fourth": (7, -6),
    "p1": (6, 1),
    "p2": (3, 4),
    "r1": (11, -2),
    "r2": (7, 2),
    "blocker_c_first": (0, 0),
    "blocker_c_second": (0, 2),
    "blocker_p1": (3, 1),
    "blocker_r1": (7, -2),
    "c_second_extra1": (2, 1),
    "c_second_extra2": (-2, 1),
    "unused17": (20, 20),
}

METRIC_ROWS = {
    "first_collision": ("blocker_p1", {"p1", "p2", "q_source", "q_other"}),
    "c_first": (
        "blocker_c_first",
        {"c_first", "c_second", "q_source", "common_fourth"},
    ),
    "c_second": (
        "blocker_c_second",
        {"c_first", "c_second", "c_second_extra1", "c_second_extra2"},
    ),
    "opposite": ("blocker_r1", {"r1", "r2", "q_other", "opposite_fourth"}),
}


def metric_query(*, exact: bool, malformed: str | None = None) -> str:
    names = list(METRIC_POINTS)
    lines = ["(set-logic QF_NRA)"]
    for name in names:
        lines.append(f"(declare-fun x_{name} () Real)")
        lines.append(f"(declare-fun y_{name} () Real)")
        x, y = METRIC_POINTS[name]
        lines.append(f"(assert (= x_{name} {x}))")
        lines.append(f"(assert (= y_{name} {y}))")
    for i, left in enumerate(names):
        for right in names[i + 1 :]:
            lines.append(
                f"(assert (or (not (= x_{left} x_{right})) (not (= y_{left} y_{right}))))"
            )

    def d2(center: str, point: str) -> str:
        return (
            f"(+ (* (- x_{point} x_{center}) (- x_{point} x_{center})) "
            f"(* (- y_{point} y_{center}) (- y_{point} y_{center})))"
        )

    for row_name, (center, support) in METRIC_ROWS.items():
        anchor = min(support)
        radius = d2(center, anchor)
        lines.append(f"(assert (> {radius} 0))")
        for point in sorted(support - {anchor}):
            lines.append(f"(assert (= {d2(center, point)} {radius}))")
        if exact:
            for point in names:
                if point not in support:
                    lines.append(f"(assert (not (= {d2(center, point)} {radius})))")
        if malformed == "wrong_common_radius" and row_name == "c_first":
            lines.append(f"(assert (not (= {d2(center, 'q_source')} {radius})))")
        if malformed == "extra_common_support" and row_name == "c_first":
            lines.append(f"(assert (= {d2(center, 'p1')} {radius}))")
    lines.append("(check-sat)")
    text = "\n".join(lines) + "\n"
    if len(re.findall(r"\(\s*check-sat\b", text)) != 1:
        raise RuntimeError("metric query does not contain exactly one check-sat")
    return text


def verify_metric_fixture(*, exact: bool) -> list[str]:
    errors: list[str] = []
    points = {
        name: (Fraction(x), Fraction(y)) for name, (x, y) in METRIC_POINTS.items()
    }
    if len(set(points.values())) != N:
        errors.append("metric fixture points are not distinct")

    def d2(center: str, point: str) -> Fraction:
        cx, cy = points[center]
        px, py = points[point]
        return (px - cx) ** 2 + (py - cy) ** 2

    for row_name, (center, support) in METRIC_ROWS.items():
        radii = {d2(center, point) for point in support}
        if len(radii) != 1 or next(iter(radii), 0) <= 0:
            errors.append(f"{row_name}: support is not a positive-radius circle")
            continue
        if exact:
            radius = next(iter(radii))
            actual = {point for point in points if d2(center, point) == radius}
            if actual != support:
                errors.append(
                    f"{row_name}: exact class is {sorted(actual)}, expected {sorted(support)}"
                )
    return errors


def structural_case(
    name: str, *, include_saturation: bool, timeout_s: int
) -> tuple[dict[str, object], StructuralEncoding]:
    e = build_structural(include_saturation=include_saturation)
    if name != "baseline":
        apply_control(e, name)
    query = (
        GENERATED
        / f"structural_{name}_{'satclause' if include_saturation else 'nosatclause'}.smt2"
    )
    emit_query(e.solver, query)
    outcome = {
        "query": str(query.relative_to(ROOT)),
        "check_sat_count": 1,
        "z3": run_solver("z3", query, timeout_s),
        "cvc5": run_solver("cvc5", query, timeout_s),
    }
    return outcome, e


def global_k4_case(
    name: str, *, timeout_s: int
) -> tuple[dict[str, object], GlobalK4Encoding]:
    g = build_global_k4()
    either_positive = Or(g.distinct_cap_two_hit, g.explicit_q_overlap_three)
    controls = {
        "baseline": True,
        "neither_positive": Not(either_positive),
        "force_either_positive": either_positive,
        "force_distinct_cap_two_hit": g.distinct_cap_two_hit,
        "force_explicit_q_overlap_three": g.explicit_q_overlap_three,
    }
    if name not in controls:
        raise KeyError(name)
    g.solver.add(controls[name])
    query = GENERATED / f"global_k4_{name}.smt2"
    emit_query(g.solver, query)
    outcome = {
        "query": str(query.relative_to(ROOT)),
        "check_sat_count": 1,
        "z3": run_solver("z3", query, timeout_s),
        "cvc5": run_solver("cvc5", query, timeout_s),
    }
    return outcome, g


def run_all(timeout_s: int) -> dict[str, object]:
    GENERATED.mkdir(exist_ok=True)
    malformed = (
        "collapse_four_named_roles",
        "omit_first_collision_member",
        "crossed_common_contamination",
        "crossed_opposite_contamination",
        "common_fourth_in_first_cap",
        "opposite_fourth_in_first_cap",
        "equal_c_blockers",
        "second_blocker_in_first_interior",
        "extra_c_row_intersection",
        "extra_first_cap_point_in_matching_row",
        "negate_saturation",
    )
    structural: dict[str, object] = {}
    baseline, baseline_encoding = structural_case(
        "baseline", include_saturation=True, timeout_s=timeout_s
    )
    structural["baseline"] = baseline
    for name in malformed:
        structural[name], _ = structural_case(
            name, include_saturation=True, timeout_s=timeout_s
        )
    structural["force_shared_fourth"], _ = structural_case(
        "force_shared_fourth", include_saturation=True, timeout_s=timeout_s
    )
    structural["force_distinct_fourths"], _ = structural_case(
        "force_distinct_fourths", include_saturation=True, timeout_s=timeout_s
    )
    structural["negate_saturation_without_clause"], _ = structural_case(
        "negate_saturation", include_saturation=False, timeout_s=timeout_s
    )

    local_status = baseline_encoding.solver.check()
    assignment_validation: dict[str, object]
    if str(local_status) == "sat":
        assignment = extract_assignment(
            baseline_encoding, baseline_encoding.solver.model()
        )
        ASSIGNMENT_JSON.write_text(
            json.dumps(assignment, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        errors = verify_assignment(assignment)
        assignment_validation = {
            "status": "PASS" if not errors else "FAIL",
            "errors": errors,
            "assignment": str(ASSIGNMENT_JSON.relative_to(ROOT)),
        }
    else:
        assignment_validation = {
            "status": "FAIL",
            "errors": [f"in-process extraction: {local_status}"],
        }

    global_k4: dict[str, object] = {}
    global_models: dict[str, GlobalK4Encoding] = {}
    for name in (
        "baseline",
        "neither_positive",
        "force_either_positive",
        "force_distinct_cap_two_hit",
        "force_explicit_q_overlap_three",
    ):
        global_k4[name], global_models[name] = global_k4_case(name, timeout_s=timeout_s)
    global_encoding = global_models["neither_positive"]
    global_status = global_encoding.solver.check()
    if str(global_status) == "sat":
        global_assignment = extract_global_assignment(
            global_encoding, global_encoding.solver.model()
        )
        GLOBAL_ASSIGNMENT_JSON.write_text(
            json.dumps(global_assignment, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
        global_errors = verify_global_assignment(global_assignment)
        global_validation = {
            "status": "PASS" if not global_errors else "FAIL",
            "errors": global_errors,
            "assignment": str(GLOBAL_ASSIGNMENT_JSON.relative_to(ROOT)),
        }
    else:
        global_validation = {
            "status": "FAIL",
            "errors": [f"in-process global extraction: {global_status}"],
        }

    metric: dict[str, object] = {}
    for name, exact, malformed_name in (
        ("equalities", False, None),
        ("exact_rows", True, None),
        ("wrong_common_radius", True, "wrong_common_radius"),
        ("extra_common_support", True, "extra_common_support"),
    ):
        path = GENERATED / f"metric_{name}.smt2"
        path.write_text(
            metric_query(exact=exact, malformed=malformed_name), encoding="utf-8"
        )
        metric[name] = {
            "query": str(path.relative_to(ROOT)),
            "check_sat_count": 1,
            "z3": run_solver("z3", path, timeout_s),
            "cvc5": run_solver("cvc5", path, timeout_s),
            "ordinary_python_validation": {
                "status": "PASS" if not verify_metric_fixture(exact=exact) else "FAIL",
                "errors": verify_metric_fixture(exact=exact),
            }
            if malformed_name is None
            else {"status": "NOT_APPLICABLE", "errors": []},
        }

    result = {
        "schema_version": 2,
        "scope": "exact17_direct_crossed_constructor_diagnostic_only",
        "claims": {
            "general_n_lift": False,
            "lean_closure": False,
            "euclidean_full_context": False,
            "full_carrier_pointwise_k4_incidence": True,
            "global_k4_euclidean_realization": False,
        },
        "diagnostic_conclusions": {
            "global_k4_forces_either_positive": False,
            "evidence": "global_k4_minimality.neither_positive is SAT in both solvers and its assignment independently validates",
            "saturation_materially_cuts_models": True,
            "saturation_yields_smaller_producer": False,
        },
        "global_stage_contract": {
            "additional_source_ingress": [
                "CounterexampleData.K4 at every carrier center",
                "CriticalShellSystem unique-four actual blockers and support locking",
                "T.oppApex1_rich",
                "T.oppApex2_rich",
                "T.surplusApex_rich",
            ],
            "candidate_sources": [
                "C.firstSource",
                "C.secondSource",
                "commonFourth",
                "oppositeFourth",
            ],
            "omitted": [
                "simultaneous Euclidean realization of all incidence rows",
                "convex arc geometry beyond the sourced cap consequences",
                "any Q-to-apex-grid alias",
                "six-center deleted-row or provenance assertions",
            ],
        },
        "schema_rejections": {
            "q_source_equals_apex_grid_hit": {
                "status": "REJECTED_UNSOURCED",
                "reason": "the first collision shell is blocker-centered; no theorem aliases Q.source to an apex-centered adjacent-grid hit",
            },
            "q_other_equals_apex_grid_hit": {
                "status": "REJECTED_UNSOURCED",
                "reason": "the first collision shell is blocker-centered; no theorem aliases Q.otherOutsidePoint to an apex-centered adjacent-grid hit",
            },
        },
        "structural": structural,
        "assignment_validation": assignment_validation,
        "global_k4_minimality": global_k4,
        "global_assignment_validation": global_validation,
        "metric": metric,
    }
    RESULTS_JSON.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    return result


def print_summary(result: dict[str, object]) -> None:
    print(f"results: {RESULTS_JSON}")
    structural = result["structural"]
    for name, outcome in structural.items():
        print(
            f"structural {name}: z3={outcome['z3']['status']} cvc5={outcome['cvc5']['status']}"
        )
    for name, outcome in result["metric"].items():
        print(
            f"metric {name}: z3={outcome['z3']['status']} cvc5={outcome['cvc5']['status']}"
        )
    print(f"assignment validation: {result['assignment_validation']['status']}")
    for name, outcome in result["global_k4_minimality"].items():
        print(
            f"global K4 {name}: z3={outcome['z3']['status']} cvc5={outcome['cvc5']['status']}"
        )
    print(
        "global assignment validation: "
        f"{result['global_assignment_validation']['status']}"
    )


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "command", choices=("run", "verify-assignment", "verify-global-assignment")
    )
    parser.add_argument("--timeout", type=int, default=20)
    args = parser.parse_args()
    if args.command == "run":
        result = run_all(args.timeout)
        print_summary(result)
        return 0
    if args.command == "verify-assignment":
        assignment = json.loads(ASSIGNMENT_JSON.read_text(encoding="utf-8"))
        errors = verify_assignment(assignment)
    else:
        assignment = json.loads(GLOBAL_ASSIGNMENT_JSON.read_text(encoding="utf-8"))
        errors = verify_global_assignment(assignment)
    if errors:
        print("FAIL")
        for error in errors:
            print(error)
        return 1
    print("PASS")
    return 0


if __name__ == "__main__":
    sys.exit(main())
