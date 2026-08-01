#!/usr/bin/env python3
"""Bounded abstract-incidence audit for sameBlockerAllEndpointOmission.

This is a finite diagnostic, not a Lean proof.  It encodes the complete
radius-equivalence relations, a chosen global K4 row at every center, the
source-indexed exact critical shells, the strengthened terminal packet, and
the selected-row strong-connectivity consequence of cardinal minimality.
Strong connectivity is imposed by replay-checked CEGAR cuts.

No coordinates or QF_NRA constraints occur in this file.
"""

from __future__ import annotations

import argparse
import itertools
import json
import time
from collections import defaultdict
from pathlib import Path
from typing import Iterable


LANE = Path(__file__).resolve().parent
OUT = LANE / "incidence-audit"


def profiles(n: int) -> list[tuple[int, int, int]]:
    """Closed-cap profiles, with the indexed cap in the middle slot."""
    return [
        (left, indexed, right)
        for left in range(6, n + 1)
        for indexed in range(8, n + 1)
        for right in range(6, n + 1)
        if left + indexed + right == n + 3
    ]


def structural_core(n: int) -> dict[str, object] | None:
    if profiles(n):
        return None
    return {
        "status": "UNSAT",
        "kind": "source-arithmetic-core",
        "core": [
            "closed_cap_card_sum = n + 3",
            "left_closed_cap_card >= 6",
            "indexed_closed_cap_card >= 8",
            "right_closed_cap_card >= 6",
        ],
        "derivation": f"n+3={n + 3} < 6+8+6=20",
        "solver_invoked": False,
    }


class Audit:
    def __init__(self, n: int, profile: tuple[int, int, int], geometric: bool) -> None:
        import z3

        self.z3 = z3
        self.n = n
        self.profile = profile
        self.geometric = geometric
        left, indexed, right = profile
        first_count = indexed - 2
        left_count = left - 2
        right_count = right - 2
        if first_count < 6:
            raise ValueError("strengthened packet needs six indexed-cap sources")

        first = ["p1", "p2", "r1", "r2", "q1", "q2"]
        first += [f"x{i + 1}" for i in range(first_count - 6)]
        left_names = [f"s{i + 1}" for i in range(left_count)]
        right_names = [f"t{i + 1}" for i in range(right_count)]
        self.names = ["a1", *right_names, "a2", *first, "a3", *left_names]
        if len(self.names) != n or len(set(self.names)) != n:
            raise AssertionError((n, profile, self.names))
        self.id = {name: i for i, name in enumerate(self.names)}
        self.vs = tuple(range(n))
        self.a1, self.a2, self.a3 = (self.id[x] for x in ("a1", "a2", "a3"))
        self.first_interior = frozenset(self.id[x] for x in first)
        self.first_cap = frozenset({self.a2, self.a3, *self.first_interior})
        self.outside_first = frozenset(set(self.vs) - set(self.first_cap))
        self.pair_p = (self.id["p1"], self.id["p2"])
        self.pair_r = (self.id["r1"], self.id["r2"])
        self.pair_q = (self.id["q1"], self.id["q2"])

        self.solver = z3.Solver()
        self.m = {(c, p): z3.Bool(f"m_{c}_{p}") for c in self.vs for p in self.vs}
        self.b = {(s, c): z3.Bool(f"b_{s}_{c}") for s in self.vs for c in self.vs}
        self.eq = {
            (c, x, y): z3.Bool(f"eq_{c}_{x}_{y}")
            for c in self.vs
            for x, y in itertools.combinations((v for v in self.vs if v != c), 2)
        }
        self.blocks: defaultdict[str, int] = defaultdict(int)
        self.cuts: list[frozenset[int]] = []
        self._encode()

    def add(self, block: str, *args) -> None:
        self.solver.add(*args)
        self.blocks[block] += len(args)

    def E(self, c: int, x: int, y: int):
        if x == y:
            return self.z3.BoolVal(True)
        if c in {x, y}:
            return self.z3.BoolVal(False)
        return self.eq[c, min(x, y), max(x, y)]

    def exactly(self, block: str, terms: Iterable, k: int) -> None:
        terms = list(terms)
        self.add(block, self.z3.PbEq([(term, 1) for term in terms], k))

    def _same_blocker(self, left: int, right: int, block: str) -> None:
        for c in self.vs:
            self.add(block, self.b[left, c] == self.b[right, c])

    def _different_blocker(self, left: int, right: int, block: str) -> None:
        for c in self.vs:
            self.add(block, self.z3.Or(self.z3.Not(self.b[left, c]), self.z3.Not(self.b[right, c])))

    def _complete_apex_class(self, pair: tuple[int, int], block: str) -> None:
        x, y = pair
        self.add(block, self.E(self.a1, x, y))
        terms = [self.E(self.a1, x, p) for p in self.vs if p != self.a1]
        self.exactly(block, terms, 4)
        for p in self.first_interior - {x, y}:
            self.add(block, self.z3.Not(self.E(self.a1, x, p)))

    def _encode(self) -> None:
        z3 = self.z3
        # Full radius partitions.  Symmetry is represented by unordered pairs.
        for c in self.vs:
            targets = [v for v in self.vs if v != c]
            for x, y, z in itertools.combinations(targets, 3):
                xy, xz, yz = self.E(c, x, y), self.E(c, x, z), self.E(c, y, z)
                self.add("radius_partition", z3.Or(z3.Not(xy), z3.Not(yz), xz))
                self.add("radius_partition", z3.Or(z3.Not(xy), z3.Not(xz), yz))
                self.add("radius_partition", z3.Or(z3.Not(xz), z3.Not(yz), xy))

        # Global K4: one selected co-radial four-row at every carrier center.
        for c in self.vs:
            self.add("global_K4", z3.Not(self.m[c, c]))
            self.exactly("global_K4", (self.m[c, p] for p in self.vs if p != c), 4)
            for x, y in itertools.combinations((p for p in self.vs if p != c), 2):
                self.add("global_K4", z3.Or(z3.Not(self.m[c, x]), z3.Not(self.m[c, y]), self.E(c, x, y)))

        # Every source chooses one critical blocker.  Its chosen row is the
        # complete four-point radius class of that source, and deleting the
        # source leaves no four-point radius class at that blocker.
        for s in self.vs:
            self.exactly("critical_blocker_total", (self.b[s, c] for c in self.vs if c != s), 1)
            self.add("critical_blocker_nonself", z3.Not(self.b[s, s]))
            for c in self.vs:
                if c == s:
                    continue
                self.add("critical_support_exact", z3.Or(z3.Not(self.b[s, c]), self.m[c, s]))
                for p in self.vs:
                    if p == c:
                        continue
                    rhs = z3.BoolVal(True) if p == s else self.E(c, s, p)
                    self.add("critical_support_exact", z3.Or(z3.Not(self.b[s, c]), self.m[c, p] == rhs))
                remaining = [p for p in self.vs if p not in {c, s}]
                for four in itertools.combinations(remaining, 4):
                    x, y, z, w = four
                    self.add(
                        "critical_no_K4_after_source_deletion",
                        z3.Or(z3.Not(self.b[s, c]), z3.Not(self.E(c, x, y)),
                              z3.Not(self.E(c, x, z)), z3.Not(self.E(c, x, w))),
                    )

        # Equality transport across a mutual two-step selected-row triangle.
        for anchor, middle, center in itertools.permutations(self.vs, 3):
            self.add(
                "mutual_triangle_transport",
                z3.Or(z3.Not(self.m[anchor, middle]), z3.Not(self.m[anchor, center]),
                      z3.Not(self.m[middle, anchor]), z3.Not(self.m[middle, center]),
                      self.E(center, anchor, middle)),
            )

        p1, p2 = self.pair_p
        r1, r2 = self.pair_r
        q1, q2 = self.pair_q
        self._same_blocker(p1, p2, "p_blocker_collision")
        self._same_blocker(r1, r2, "r_blocker_collision")
        self._same_blocker(q1, q2, "q_equal_blocker")
        self._different_blocker(p1, r1, "collision_blockers_distinct")
        self._different_blocker(p1, q1, "fresh_q_blocker")
        self._different_blocker(r1, q1, "fresh_q_blocker")
        for source in (p1, r1, q1):
            for c in set(self.vs) - set(self.first_interior):
                self.add("blockers_in_indexed_strict_cap", z3.Not(self.b[source, c]))

        # Three distinct exact first-apex classes, each meeting the indexed
        # strict interior in precisely its named source pair.
        self._complete_apex_class(self.pair_p, "p_first_apex_exact_class")
        self._complete_apex_class(self.pair_r, "r_first_apex_exact_class")
        self._complete_apex_class(self.pair_q, "q_first_apex_exact_class")
        self.add("distinct_first_apex_radii", z3.Not(self.E(self.a1, p1, r1)))
        self.add("distinct_first_apex_radii", z3.Not(self.E(self.a1, p1, q1)))
        self.add("distinct_first_apex_radii", z3.Not(self.E(self.a1, r1, q1)))

        # The common q shell has exact cap intersection {q1,q2}; this makes
        # all four endpoint omissions explicit, not merely existential.
        for c in self.first_interior:
            guard = self.b[q1, c]
            for p in self.first_cap - {q1, q2}:
                self.add("q_shell_exact_cap_intersection", z3.Or(z3.Not(guard), z3.Not(self.m[c, p])))
            for p in (*self.pair_p, *self.pair_r):
                self.add("all_four_endpoint_omissions", z3.Or(z3.Not(guard), z3.Not(self.m[c, p])))

        # FreshOutsideFirstBlockerFiber: the p shell is exactly its two cap
        # sources plus two off-cap points, and at least one off-cap point is a
        # further source with that same actual blocker (the other is Q.other).
        for c in self.first_interior:
            guard = self.b[p1, c]
            for p in self.first_cap - {p1, p2}:
                self.add("Q_first_shell_exact_cap_intersection", z3.Or(z3.Not(guard), z3.Not(self.m[c, p])))
            candidates = [z3.And(self.b[s, c], self.m[c, s]) for s in self.outside_first]
            self.add("Q_fresh_outside_source_same_blocker", z3.Or(z3.Not(guard), *candidates))

        # Optional source-proved Euclidean incidence consequences.  These are
        # a refinement of the abstract packet, never used to label base SAT.
        if self.geometric:
            for c, d in itertools.combinations(self.vs, 2):
                possible = [p for p in self.vs if p not in {c, d}]
                for x, y, z in itertools.combinations(possible, 3):
                    self.add(
                        "two_complete_circles_intersect_at_most_two",
                        z3.Or(z3.Not(self.E(c, x, y)), z3.Not(self.E(c, x, z)),
                              z3.Not(self.E(d, x, y)), z3.Not(self.E(d, x, z))),
                    )
            for x, y in itertools.combinations(self.vs, 2):
                centers = [c for c in self.vs if c not in {x, y}]
                for c, d, e in itertools.combinations(centers, 3):
                    self.add(
                        "equal_pair_has_at_most_two_carrier_centers",
                        z3.Or(z3.Not(self.E(c, x, y)), z3.Not(self.E(d, x, y)), z3.Not(self.E(e, x, y))),
                    )

    def truth(self, model, term) -> bool:
        return self.z3.is_true(model.eval(term, model_completion=True))

    def row(self, model, c: int) -> set[int]:
        return {p for p in self.vs if self.truth(model, self.m[c, p])}

    def blocker(self, model, s: int) -> int:
        choices = [c for c in self.vs if self.truth(model, self.b[s, c])]
        if len(choices) != 1:
            raise AssertionError((s, choices))
        return choices[0]

    def closed_reachable_set(self, model) -> frozenset[int] | None:
        rows = {c: self.row(model, c) for c in self.vs}
        for start in self.vs:
            seen = {start}
            frontier = [start]
            while frontier:
                seen.update(rows[frontier.pop()] - seen)
                frontier = [v for v in seen if not rows[v].issubset(seen)]
            if len(seen) < self.n:
                return frozenset(seen)
        return None

    def add_cut(self, subset: frozenset[int]) -> None:
        if not subset or len(subset) == self.n or subset in self.cuts:
            raise AssertionError(subset)
        clause = self.z3.Or(*(self.m[c, p] for c in subset for p in self.vs if p not in subset))
        self.add("minimality_CEGAR_outgoing_cut", clause)
        self.cuts.append(subset)

    def replay(self, model) -> dict[str, object]:
        # Independent semantic checks of the original finite statements; this
        # deliberately does not merely ask whether all asserted formulas hold.
        eq = lambda c, x, y: self.truth(model, self.E(c, x, y))
        rows = {c: self.row(model, c) for c in self.vs}
        blockers = {s: self.blocker(model, s) for s in self.vs}
        for c in self.vs:
            if len(rows[c]) != 4 or c in rows[c]:
                raise AssertionError(("row", c, rows[c]))
            if any(not eq(c, x, y) for x, y in itertools.combinations(rows[c], 2)):
                raise AssertionError(("row-class", c))
            targets = [p for p in self.vs if p != c]
            for x, y, z in itertools.combinations(targets, 3):
                if eq(c, x, y) and eq(c, y, z) and not eq(c, x, z):
                    raise AssertionError(("transitivity", c, x, y, z))
        for s, c in blockers.items():
            complete = {p for p in self.vs if p != c and (p == s or eq(c, s, p))}
            if complete != rows[c] or s not in complete:
                raise AssertionError(("critical-shell", s, c, complete, rows[c]))
            remaining = [p for p in self.vs if p not in {c, s}]
            for four in itertools.combinations(remaining, 4):
                if all(eq(c, four[0], p) for p in four[1:]):
                    raise AssertionError(("qfree", s, c, four))
        closed = self.closed_reachable_set(model)
        if closed is not None:
            raise AssertionError(("minimality", sorted(closed)))

        p1, p2 = self.pair_p
        r1, r2 = self.pair_r
        q1, q2 = self.pair_q
        bp, br, bq = blockers[p1], blockers[r1], blockers[q1]
        if blockers[p2] != bp or blockers[r2] != br or blockers[q2] != bq:
            raise AssertionError("collision blocker equality")
        if len({bp, br, bq}) != 3 or not {bp, br, bq}.issubset(self.first_interior):
            raise AssertionError("fresh/interior blockers")
        q_support = rows[bq]
        if q_support & self.first_cap != {q1, q2}:
            raise AssertionError(("q-cap", q_support & self.first_cap))
        if q_support & set((*self.pair_p, *self.pair_r)):
            raise AssertionError("endpoint omission")
        p_support = rows[bp]
        if p_support & self.first_cap != {p1, p2}:
            raise AssertionError(("Q-p-cap", p_support & self.first_cap))
        q_sources = [s for s in self.outside_first if blockers[s] == bp]
        if not q_sources:
            raise AssertionError("missing Q.source")
        q_source = q_sources[0]
        q_other = next(iter((p_support & self.outside_first) - {q_source}))

        def class_at(center: int, anchor: int) -> set[int]:
            return {p for p in self.vs if p != center and (p == anchor or eq(center, anchor, p))}

        return {
            "semantic_replay": "PASS",
            "rows": {self.names[c]: [self.names[p] for p in sorted(rows[c])] for c in self.vs},
            "blockers": {self.names[s]: self.names[c] for s, c in blockers.items()},
            "packet": {
                "bp": self.names[bp], "br": self.names[br], "bq": self.names[bq],
                "p_support": [self.names[p] for p in sorted(p_support)],
                "q_common_support": [self.names[p] for p in sorted(q_support)],
                "Q.source": self.names[q_source], "Q.otherOutsidePoint": self.names[q_other],
                "p_first_apex_class": [self.names[p] for p in sorted(class_at(self.a1, p1))],
                "r_first_apex_class": [self.names[p] for p in sorted(class_at(self.a1, r1))],
                "q_first_apex_class": [self.names[p] for p in sorted(class_at(self.a1, q1))],
                "all_four_endpoint_omissions": True,
                "q_shell_cap_intersection": ["q1", "q2"],
            },
        }

    def run(self, timeout_ms: int, max_cuts: int, run_dir: Path) -> dict[str, object]:
        run_dir.mkdir(parents=True, exist_ok=True)
        started = time.monotonic()
        iterations = []
        for iteration in range(max_cuts + 1):
            elapsed_ms = int((time.monotonic() - started) * 1000)
            remaining = timeout_ms - elapsed_ms
            if remaining <= 0:
                status = "UNKNOWN_TIMEOUT"
                break
            self.solver.set(timeout=remaining)
            check_started = time.monotonic()
            outcome = self.solver.check()
            check_ms = int((time.monotonic() - check_started) * 1000)
            record: dict[str, object] = {"iteration": iteration, "check_ms": check_ms, "result": str(outcome)}
            if outcome == self.z3.unknown:
                record["reason"] = self.solver.reason_unknown()
                iterations.append(record)
                status = "UNKNOWN"
                break
            if outcome == self.z3.unsat:
                iterations.append(record)
                status = "UNSAT_UNCERTIFIED"
                break
            model = self.solver.model()
            closed = self.closed_reachable_set(model)
            if closed is None:
                witness = self.replay(model)
                record["semantic_replay"] = "PASS"
                iterations.append(record)
                status = "SAT"
                (run_dir / "witness.json").write_text(json.dumps(witness, indent=2, sort_keys=True) + "\n")
                break
            record["violated_minimality_cut"] = [self.names[v] for v in sorted(closed)]
            record["cut_excludes_current_witness"] = all(
                not self.truth(model, self.m[c, p]) for c in closed for p in self.vs if p not in closed
            )
            if not record["cut_excludes_current_witness"]:
                raise AssertionError(record)
            iterations.append(record)
            self.add_cut(closed)
        else:
            status = "UNKNOWN_CUT_LIMIT"

        result = {
            "schema": "same-blocker-all-endpoint-omission-incidence-cegar-v1",
            "status": status,
            "n": self.n,
            "closed_cap_profile": list(self.profile),
            "strict_interior_profile": [x - 2 for x in self.profile],
            "stage": "global-K4-critical-shell-minimality" + ("-euclidean-incidence" if self.geometric else ""),
            "solver": "Z3 finite Boolean SAT layer",
            "timeout_ms": timeout_ms,
            "elapsed_ms": int((time.monotonic() - started) * 1000),
            "cegar_cut_count": len(self.cuts),
            "iterations": iterations,
            "assertion_block_counts": dict(sorted(self.blocks.items())),
            "trust_boundary": {
                "lean_kernel_proof": False,
                "qf_nra_run": False,
                "sat_witness_semantically_replayed": status == "SAT",
                "unsat_certificate_checked": False,
                "universal_n_claim": False,
            },
            "source_projection": [
                "complete radius equivalence relations",
                "global chosen K4 row at every center",
                "CriticalShellSystem exact source row and q-free deletion",
                "selected-row strong connectivity via replay-checked CEGAR cuts",
                "p/r retained blocker collisions and distinct blockers",
                "two equal-blocker q sources with all four endpoint omissions",
                "exact q-shell indexed-cap intersection",
                "FreshOutsideFirstBlockerFiber exact p-shell cap split",
            ],
            "omitted": [
                "coordinates and QF_NRA geometry",
                "MEC and nonobtuse-triangle inequalities",
                "full CounterexampleData noM44 geometry",
                "Lean kernel closure",
            ],
        }
        (run_dir / "result.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
        (run_dir / "iterations.jsonl").write_text("".join(json.dumps(x, sort_keys=True) + "\n" for x in iterations))
        return result


def smoke_test() -> dict[str, object]:
    # Solver semantics and the arithmetic profile gate are checked before any
    # production-sized instance.  These are intentionally tiny and decisive.
    import z3

    sat_solver = z3.Solver()
    x = z3.Bool("smoke_x")
    sat_solver.add(x)
    unsat_solver = z3.Solver()
    unsat_solver.add(x, z3.Not(x))
    assert sat_solver.check() == z3.sat
    assert unsat_solver.check() == z3.unsat
    assert profiles(15) == [] and profiles(16) == []
    assert profiles(17) == [(6, 8, 6)]
    assert profiles(18) == [(6, 8, 7), (6, 9, 6), (7, 8, 6)]
    return {"status": "SMOKE_OK", "known_sat": True, "known_unsat": True}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--self-check", action="store_true")
    parser.add_argument("--run-all", action="store_true")
    parser.add_argument("--n", type=int, choices=range(15, 19))
    parser.add_argument("--geometric-incidence", action="store_true")
    parser.add_argument("--timeout-ms", type=int, default=180_000)
    parser.add_argument("--max-cuts", type=int, default=200)
    args = parser.parse_args()
    if not (args.self_check or args.run_all or args.n is not None):
        parser.error("choose --self-check, --run-all, or --n")
    smoke = smoke_test()
    print(json.dumps(smoke, sort_keys=True))
    if args.self_check and not (args.run_all or args.n is not None):
        return

    OUT.mkdir(parents=True, exist_ok=True)
    ns = range(15, 19) if args.run_all else [args.n]
    summary = []
    for n in ns:
        core = structural_core(n)
        if core is not None:
            payload = {"n": n, **core}
            target = OUT / f"n{n}-structural-core.json"
            target.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
            summary.append(payload)
            print(json.dumps({"n": n, "status": payload["status"], "artifact": str(target)}))
            continue
        for profile in profiles(n):
            tag = "-".join(map(str, profile))
            stage = "geometric-incidence" if args.geometric_incidence else "incidence"
            run_dir = OUT / f"n{n}-profile-{tag}-{stage}"
            audit = Audit(n, profile, args.geometric_incidence)
            result = audit.run(args.timeout_ms, args.max_cuts, run_dir)
            summary.append(result)
            print(json.dumps({"n": n, "profile": profile, "status": result["status"], "artifact": str(run_dir / "result.json")}))
    summary_path = OUT / ("summary-geometric-incidence.json" if args.geometric_incidence else "summary-incidence.json")
    summary_path.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps({"summary": str(summary_path), "case_count": len(summary)}))


if __name__ == "__main__":
    main()
