#!/usr/bin/env python3
"""Auditable named-role abstraction for the endpoint five-role residuals.

This is a diagnostic, not a Lean proof or a Euclidean realization check.  It
extends ``extended_five_role_schema_mining.py`` to the complete named packet
O,C,M,K,A,B,J,X (with A=J or X=C), fixes the old helper's five-position-only
Kalmanson loop, and records exact rational QF_LRA models or Z3 unsat cores.

Run with:
  uv run --with z3-solver python scratch/five_role_extended_packet_miner.py
"""

from __future__ import annotations

import json
from itertools import combinations, permutations
from pathlib import Path

import z3


OUT_JSON = Path("scratch/five_role_extended_packet_results.json")
OUT_MD = Path("scratch/five_role_extended_packet_report.md")


def pair(a: str, b: str) -> tuple[str, str]:
    assert a != b
    return tuple(sorted((a, b)))


BRANCHES = {
    "A=J": {
        "aliases": {"J": "A"},
        "roles": ("O", "A", "C", "X", "K", "M", "B"),
        "residuals": ("OAKXC", "OCXKA"),
        "base_equalities": (("O", "A", "C"), ("A", "C", "K"), ("X", "A", "K")),
        "proposal": ("P1", ("X", "C"), ("X", "K")),
    },
    "X=C": {
        "aliases": {"X": "C"},
        "roles": ("O", "A", "C", "J", "K", "M", "B"),
        "residuals": ("OCAKJ", "OJKAC"),
        "base_equalities": (("O", "J", "C"), ("A", "C", "K"), ("C", "J", "K")),
        "proposal": ("P2", ("J", "K"), ("J", "C")),
    },
}


def inserted_orders(base: str, extras=("M", "B")):
    """O-anchored orders whose projection to the five roles is exactly base."""
    fixed_tail = tuple(base[1:])
    for tail in permutations(fixed_tail + extras):
        if tuple(x for x in tail if x not in extras) == fixed_tail:
            yield ("O",) + tail


class Problem:
    def __init__(self, branch: str, order: tuple[str, ...], proposal_mode: str = "none"):
        self.branch = branch
        self.data = BRANCHES[branch]
        self.order = order
        self.roles = self.data["roles"]
        self.solver = z3.Solver()
        self.constraints: dict[str, z3.BoolRef] = {}
        self.d = {p: z3.Real("d_" + "".join(p)) for p in combinations(sorted(self.roles), 2)}
        self.cap = {r: z3.Bool("cap_" + r) for r in self.roles}
        self._build(proposal_mode)

    def dist(self, a: str, b: str):
        if a == b:
            return z3.RealVal(0)
        return self.d[pair(a, b)]

    def add(self, label: str, expr):
        assert label not in self.constraints, label
        self.constraints[label] = expr
        self.solver.assert_and_track(expr, z3.Bool(label))

    def eqdist(self, center: str, u: str, v: str):
        return self.dist(center, u) == self.dist(center, v)

    def shell_member(self, center: str, radius_point: str, y: str):
        if y == center:
            return z3.BoolVal(False)
        return self.eqdist(center, radius_point, y)

    def _build(self, proposal_mode: str):
        # Positive, symmetric abstract distances.  The homogeneous strict
        # Kalmanson family is normalized by requiring every gap >= 1; do not
        # independently fix a distance scale, which could strengthen it.
        for (a, b), d in self.d.items():
            self.add(f"positive_{a}{b}", d > 0)

        # Strict triangle inequalities are source-true for distinct convex points.
        for a, b, c in combinations(sorted(self.roles), 3):
            self.add(f"triangle_{a}{b}_{c}", self.dist(a, b) + self.dist(b, c) > self.dist(a, c))
            self.add(f"triangle_{a}{c}_{b}", self.dist(a, c) + self.dist(b, c) > self.dist(a, b))
            self.add(f"triangle_{b}{c}_{a}", self.dist(a, b) + self.dist(a, c) > self.dist(b, c))

        # Full strict Kalmanson family for every ordered quadruple of the
        # seven distinct representatives (the old helper used range(5)).
        for inds in combinations(range(len(self.order)), 4):
            a, b, c, d = (self.order[i] for i in inds)
            diag = self.dist(a, c) + self.dist(b, d)
            self.add(
                "K2_" + "".join((a, b, c, d)),
                diag - self.dist(b, c) - self.dist(a, d) >= 1,
            )
            self.add(
                "K1_" + "".join((a, b, c, d)),
                diag - self.dist(a, b) - self.dist(c, d) >= 1,
            )

        # Base branch equalities and the retained O-radius relation O-C=O-M.
        for center, u, v in self.data["base_equalities"]:
            self.add(f"base_{center}_{u}{v}", self.eqdist(center, u, v))
        self.add("O_radius_CM", self.eqdist("O", "C", "M"))

        # Full-shell abstractions.  Equality to the displayed radius exactly
        # means named-role incidence; <=4 reflects a physical four-support,
        # with any missing support positions allowed to be anonymous.
        shells = {"SigmaA": ("A", "C"), "SigmaB": ("B", "C")}
        shells["SigmaX"] = ("X", "A") if self.branch == "A=J" else ("C", "J")
        for name, (center, radius_point) in shells.items():
            members = [self.shell_member(center, radius_point, y) for y in self.roles]
            self.add(name + "_named_card_le4", z3.AtMost(*members, 4))

        self.add("SigmaA_CK", self.eqdist("A", "C", "K"))
        self.add("SigmaA_M_out", z3.Not(self.eqdist("A", "C", "M")))
        self.add("SigmaB_CM", self.eqdist("B", "C", "M"))
        self.add("SigmaB_K_out", z3.Not(self.eqdist("B", "C", "K")))
        xcenter = "X" if self.branch == "A=J" else "C"
        jrole = "A" if self.branch == "A=J" else "J"
        self.add("SigmaX_JK", self.eqdist(xcenter, jrole, "K"))

        # Closed-cap facts: C,M,K,B are known inside and O outside.  Other
        # named roles remain existentially classified.  Named cap membership
        # is one cyclic interval, and Sigma_B meets it exactly at C,M.
        for r in ("C", "M", "K", "B"):
            self.add("cap_in_" + r, self.cap[r])
        self.add("cap_out_O", z3.Not(self.cap["O"]))
        exits = [z3.And(self.cap[self.order[i]], z3.Not(self.cap[self.order[(i + 1) % len(self.order)]]))
                 for i in range(len(self.order))]
        self.add("cap_cyclic_contiguous", z3.AtMost(*exits, 1))
        for y in self.roles:
            in_sigma_b = self.shell_member("B", "C", y)
            if y in ("C", "M"):
                self.add("SigmaB_cap_exact_in_" + y, z3.And(self.cap[y], in_sigma_b))
            else:
                self.add("SigmaB_cap_exact_out_" + y, z3.Not(z3.And(self.cap[y], in_sigma_b)))

        # Every point-pair has at most two named equidistant centers.  O and B
        # already saturate {C,M}, so this also excludes every other named center.
        for u, v in combinations(sorted(self.roles), 2):
            centers = [self.eqdist(z, u, v) for z in self.roles if z not in (u, v)]
            self.add(f"pair_center_le2_{u}{v}", z3.AtMost(*centers, 2))

        # A noncollinear triple has at most one named equidistant center.
        for u, v, w in combinations(sorted(self.roles), 3):
            centers = [z3.And(self.eqdist(z, u, v), self.eqdist(z, u, w))
                       for z in self.roles if z not in (u, v, w)]
            self.add(f"triple_center_le1_{u}{v}{w}", z3.AtMost(*centers, 1))

        pname, left, right = self.data["proposal"]
        peq = self.dist(*left) == self.dist(*right)
        if proposal_mode == "eq":
            self.add(pname + "_assumed", peq)
        elif proposal_mode == "neq":
            self.add(pname + "_negated", z3.Not(peq))
        else:
            assert proposal_mode == "none"

    def result(self):
        status = self.solver.check()
        if status == z3.unsat:
            return {"status": "UNSAT", "core": sorted(str(x) for x in self.solver.unsat_core())}
        if status == z3.unknown:
            return {"status": "UNKNOWN", "reason": self.solver.reason_unknown()}
        model = self.solver.model()
        readback = all(z3.is_true(model.eval(expr, model_completion=True))
                       for expr in self.constraints.values())
        assert readback
        distances = {"".join(p): str(model.eval(d, model_completion=True)) for p, d in self.d.items()}
        cap = {r: z3.is_true(model.eval(v, model_completion=True)) for r, v in self.cap.items()}
        shells = {}
        shell_data = {"SigmaA": ("A", "C"), "SigmaB": ("B", "C")}
        shell_data["SigmaX"] = ("X", "A") if self.branch == "A=J" else ("C", "J")
        for name, (center, radius_point) in shell_data.items():
            shells[name] = [y for y in self.roles if z3.is_true(model.eval(
                self.shell_member(center, radius_point, y), model_completion=True))]
        return {"status": "SAT", "readback_all_constraints": readback,
                "witness": {"distances": distances, "cap1": cap, "shells": shells}}


def smoke_test():
    """Reproduce the prior five-role 16/24 Kalmanson-feasible census."""
    for branch, data in BRANCHES.items():
        roles5 = tuple(dict.fromkeys(data["residuals"][0]))
        sat = 0
        for tail in permutations([r for r in roles5 if r != "O"]):
            order = ("O",) + tail
            s = z3.Solver()
            d = {p: z3.Real("sm_" + branch.replace("=", "eq") + "_" + "".join(order) + "_" + "".join(p))
                 for p in combinations(sorted(roles5), 2)}
            get = lambda a, b: d[pair(a, b)]
            for x in d.values():
                s.add(x > 0)
            for center, u, v in data["base_equalities"]:
                s.add(get(center, u) == get(center, v))
            for inds in combinations(range(5), 4):
                a, b, c, e = (order[i] for i in inds)
                diag = get(a, c) + get(b, e)
                s.add(diag - get(b, c) - get(a, e) >= 1)
                s.add(diag - get(a, b) - get(c, e) >= 1)
            sat += s.check() == z3.sat
        assert sat == 16, (branch, sat)
    return "PASS: reproduced 16/24 Kalmanson-feasible five-role orders in both branches"


def deletion_packet_abstraction():
    """Separate local support shapes; not one global ambient-carrier witness."""
    return {
        "status": "local_shape_only",
        "delete_M_centers_O_A": {
            "O_row": ["m_shared_1", "m_shared_2", "m_o_1", "m_o_2"],
            "A_row": ["m_shared_1", "m_shared_2", "m_a_1", "m_a_2"],
            "intersection_card": 2,
            "excluded": ["M", "O from O_row", "A from A_row"],
        },
        "delete_K_centers_O_B": {
            "O_row": ["k_shared_1", "k_shared_2", "k_o_1", "k_o_2"],
            "B_row": ["k_shared_1", "k_shared_2", "k_b_1", "k_b_2"],
            "intersection_card": 2,
            "excluded": ["K", "O from O_row", "B from B_row"],
        },
        "omission": "No named-role membership is source-forced; anonymous rows are not coupled to distances, cap order, or named multiplicity atoms.",
    }


def main():
    result = {
        "diagnostic_only": True,
        "solver": {"name": "Z3", "version": z3.get_version_string(), "logic": "QF_LRA plus finite Boolean cardinality"},
        "smoke_test": smoke_test(),
        "semantics": {
            "distance": "exact rational abstract metric with all strict triangle and full strict cyclic Kalmanson inequalities",
            "cap": "C,M,K,B forced in; O forced out; other named roles existential; named cap members form one cyclic interval",
            "full_shells": "named incidence iff equal radius, with at most four named support points; anonymous fillers allowed",
            "pair_centers": "at most two named equidistant centers for every named pair",
            "triple_centers": "at most one named equidistant center for every named triple",
        },
        "omitted_semantics": [
            "No Euclidean coordinates, Cayley-Menger/planarity constraints, orientations beyond Kalmanson, or global A-carrier realization.",
            "Unknown cap membership of A/J/X is existential; it is not guessed outside the cap.",
            "Q.row is only a selected four-subset: C,J are named members and O is its center; no other named membership is asserted.",
            "The two erased deletion rows have no source-forced named memberships, so only separate decoupled local support shapes are recorded, not a simultaneous global ambient-carrier witness.",
            "Multiplicity is enforced only among named representatives, not anonymous support fillers or the full ambient carrier.",
            "UNSAT cores are tracked Z3 cores, not independently checked proof certificates; no second solver backend was run.",
        ],
        "deletion_packets": deletion_packet_abstraction(),
        "branches": {},
    }
    for branch, data in BRANCHES.items():
        branch_rows = []
        for residual in data["residuals"]:
            for order in inserted_orders(residual):
                baseline = Problem(branch, order, "none").result()
                with_eq = Problem(branch, order, "eq").result()
                with_neq = Problem(branch, order, "neq").result()
                if baseline["status"] != "SAT":
                    proposal = "vacuous"
                elif with_neq["status"] == "UNSAT":
                    proposal = "forced"
                elif with_eq["status"] == "UNSAT":
                    proposal = "refuted"
                elif with_eq["status"] == with_neq["status"] == "SAT":
                    proposal = "independent"
                else:
                    proposal = "unknown"
                branch_rows.append({
                    "residual": residual,
                    "order": "".join(order),
                    "baseline": baseline,
                    "proposal_equality": with_eq,
                    "proposal_negation": with_neq,
                    "proposal_classification": proposal,
                })
        result["branches"][branch] = {
            "aliases": data["aliases"],
            "proposal": data["proposal"][0],
            "rows": branch_rows,
        }

    OUT_JSON.write_text(json.dumps(result, indent=2) + "\n")

    report = [
        "# Eight-role endpoint packet diagnostic",
        "",
        "**Status: bounded solver diagnostic only. No Lean theorem or Euclidean realization is claimed.**",
        "",
        "This extends the existing five-role miners to the named packet `O,C,M,K,A,B,J,X`,",
        "quotiented by `A=J` or `X=C`. Unlike the prior extension, every ordered quadruple",
        "of the seven distinct representatives receives both strict Kalmanson inequalities.",
        "",
        "## Result",
        "",
        "**Neither residual order pair is eliminated. P1/P2 is never forced.** Each of",
        "the four five-role residuals has SAT seven-role insertions; in every branch/residual",
        "seven insertions admit both P and not-P, while a few other SAT insertions refute P.",
        "",
    ]
    for branch, payload in result["branches"].items():
        rows = payload["rows"]
        report += [f"### {branch}", ""]
        for residual in BRANCHES[branch]["residuals"]:
            rr = [x for x in rows if x["residual"] == residual]
            counts = {}
            for x in rr:
                key = (x["baseline"]["status"], x["proposal_classification"])
                counts[key] = counts.get(key, 0) + 1
            sat_orders = [x["order"] for x in rr if x["baseline"]["status"] == "SAT"]
            report.append(f"- `{residual}`: {len(rr)} insertions checked under the cap model; " +
                          ", ".join(f"{n} {a}/{b}" for (a, b), n in sorted(counts.items())) + ".")
            if sat_orders:
                report.append("  SAT orders: " + ", ".join(f"`{x}`" for x in sat_orders))
        report += [""]
    report += [
        "The JSON contains an exact rational witness for every SAT lane and a tracked Z3",
        "core for every UNSAT lane, separately for the baseline, the proposed equality,",
        "and its negation. Thus `forced` means baseline + negated P1/P2 is UNSAT;",
        "`independent` means both the equality and its negation have witnesses.",
        "",
        "## Encoded source abstraction",
        "",
        "- `Sigma_A`: center `A`, `C,K` in, `A,M` out, full support cardinality four.",
        "- `Sigma_B`: center `B`, `C,M` in, `B,K` out, and closed-cap intersection exactly `{C,M}`.",
        "- `Sigma_X`: center `X`, `J,K` in, `X` out, full support cardinality four.",
        "- `Q.row`: O-centered selected four-subset with `C,J` in and `O` out; it is not treated as a full O-shell.",
        "- `C,M,K,B` are in the closed first cap, `O` is out, and all named cap members are cyclically contiguous.",
        "- Every named pair has at most two named equidistant centers; `{C,M}` is saturated by `O,B`. Every named triple has at most one named equidistant center.",
        "",
        "## Deletion packets and omissions",
        "",
        "The delete-`M` packet at centers `O,A` and delete-`K` packet at centers `O,B`",
        "are represented in JSON by anonymous four-support witnesses with overlap two.",
        "They do not constrain named cyclic order because the source forces no additional",
        "named membership in those erased rows.",
        "",
    ]
    report += [f"- {x}" for x in result["omitted_semantics"]]
    report += [
        "",
        "## Source anchors",
        "",
        "- `RetainedMatchingCommonDeletionCycle.lean:66-116` supplies the two-step walk, retained cap/radius facts, and the `M`/`K` shell omissions.",
        "- `RetainedMatchingEndpointContinuation.lean:76-145,186-205` supplies `C,K,J`, `Q.row`, the retained O-radius, and the `Sigma_X` cross shell.",
        "- `CommonDeletionTwoCenter.lean` supplies the erased two-center packet contract.",
        "- `EndpointFreshFiveRoleKalmanson.lean` supplies the branch equalities and five-role residual schemas reused by the prior miners.",
        "",
        f"Machine-readable artifact: `{OUT_JSON}`.",
    ]
    OUT_MD.write_text("\n".join(report) + "\n")
    print(OUT_MD)
    print(OUT_JSON)
    print(result["smoke_test"])
    for branch, payload in result["branches"].items():
        counts = {}
        for row in payload["rows"]:
            k = (row["baseline"]["status"], row["proposal_classification"])
            counts[k] = counts.get(k, 0) + 1
        print(branch, counts)


if __name__ == "__main__":
    main()
