#!/usr/bin/env python3
"""Emit an exact, fail-closed inventory of the distinct aggregate surface."""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
import hashlib
import inspect
import json
import math
from pathlib import Path
import sys

import z3

from distinct_source_terms import (
    EXPECTED_ASSERTIONS,
    EXPECTED_SOURCE_BITS,
    EXPECTED_VARIABLES,
    ORBIT_SPECS,
    build_source_assertions,
    collect_variables,
    resolve_orbit,
    source_contract,
    source_stream_sha256,
    surface,
)


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ALL_ONE_CERT = HERE.parent / "exact5-card13-all-one-certificate-ingress"
sys.path.insert(0, str(ALL_ONE_CERT))

from generate_all_one_bvexpr import Emitter  # noqa: E402


class DistinctEmitter(Emitter):
    """All-one verified-expression emitter plus the distinct surface's XOR."""

    def boolean(self, expression: z3.BoolRef) -> str:
        if expression.decl().kind() == z3.Z3_OP_XOR:
            items = expression.children()
            if len(items) != 2:
                raise ValueError("only binary Boolean XOR is accepted")
            self.seen_operators.add("bool-xor")
            return f"bnot (bbeq ({self.boolean(items[0])}) ({self.boolean(items[1])}))"
        return super().boolean(expression)


class TracedSolver:
    """Z3 solver proxy recording the exact source location of every add."""

    def __init__(self) -> None:
        self.solver = z3.SolverFor("QF_FD")
        self.origins: list[tuple[str, str, int]] = []

    def set(self, *args, **kwargs) -> None:
        self.solver.set(*args, **kwargs)

    def add(self, *assertions: z3.BoolRef) -> None:
        caller = inspect.currentframe().f_back
        assert caller is not None
        path = str(Path(caller.f_code.co_filename).resolve())
        before = len(self.solver.assertions())
        self.solver.add(*assertions)
        added = len(self.solver.assertions()) - before
        self.origins.extend(
            [(path, caller.f_code.co_name, caller.f_lineno)] * added
        )

    def assertions(self):
        return self.solver.assertions()


def traced_base(orbit: str):
    cls = surface.focus.BaseOuter
    outer = cls.__new__(cls)
    outer.orbit = orbit
    outer.roles = surface.focus.ORBIT_ROLES[orbit]
    outer.solver = TracedSolver()
    outer.m = outer._new_family("m")
    outer.cover = [outer._new_family(f"g{edge}") for edge in range(2)]
    outer.blocker = [z3.Int(f"blocker_{source}") for source in surface.focus.VERTICES]
    outer.shell = [z3.Bool(f"shell_{point}") for point in surface.focus.VERTICES]
    outer.q = z3.Int("frontier_q")
    outer.w = z3.Int("frontier_w")
    outer.b1 = [z3.Bool(f"b1_{point}") for point in surface.focus.VERTICES]
    outer._add_base()
    return outer


def traced_surface(orbit: str):
    original_solver = z3.Solver
    try:
        z3.Solver = TracedSolver  # type: ignore[assignment]
        outer, ranks, counts = surface.build(orbit, 0)
    finally:
        z3.Solver = original_solver  # type: ignore[assignment]
    if not isinstance(outer.solver, TracedSolver):
        raise AssertionError("surface did not use the tracing solver")
    base = traced_base(orbit)
    base_assertions = list(base.solver.assertions())
    count = counts["base_parent_global_cover_assertions"]
    if len(base_assertions) != count:
        raise AssertionError("traced base assertion count drift")
    assertions = list(outer.solver.assertions())
    for index, assertion in enumerate(base_assertions):
        if assertions[index].sexpr() != assertion.sexpr():
            raise AssertionError(f"traced base assertion drift at {index}")
    outer.solver.origins[:count] = base.solver.origins
    if len(outer.solver.origins) != len(assertions):
        raise AssertionError("origin/assertion length mismatch")
    return outer, ranks, counts, assertions, outer.solver.origins


def block_ranges(counts: dict[str, int]) -> list[dict[str, object]]:
    pieces = [
        ("base_parent_global_cover", counts["base_parent_global_cover_assertions"]),
        ("retained_distinct_role", counts["retained_role_assertions"]),
        ("distinct_parent_coupling", counts["distinct_parent_coupling_assertions"]),
        ("connectivity", counts["connectivity_assertions"]),
        ("rank_bounds", counts["rank_bound_assertions"]),
        ("guarded_selected_row_equalities", counts["guarded_selected_row_rank_equalities"]),
        ("complete_class_inequalities", counts["complete_class_rank_inequalities"]),
        ("unique_k4_second", math.comb(12, 4)),
        ("unique_k4_first", math.comb(12, 4)),
        ("unique_k4_critical", 13 * math.comb(12, 4)),
        ("kalmanson_cancellation", counts["kalmanson_cancellation_implications"]),
    ]
    ranges = []
    start = 0
    for name, count in pieces:
        ranges.append({"name": name, "start": start, "end": start + count, "count": count})
        start += count
    if start != counts["total_source_assertions"]:
        raise AssertionError(f"block partition drift: {start}")
    return ranges


def relative(path: str) -> str:
    resolved = Path(path).resolve()
    try:
        return str(resolved.relative_to(ROOT))
    except ValueError:
        return str(resolved)


def stream_hash(assertions: list[z3.BoolRef]) -> str:
    data = "".join(assertion.sexpr() + "\n" for assertion in assertions)
    return hashlib.sha256(data.encode("utf-8")).hexdigest()


def source_line(path: str, line: int) -> str:
    lines = Path(path).read_text(encoding="utf-8").splitlines()
    return lines[line - 1].strip()


PRODUCER_INVENTORY = {
    "base_parent_global_cover": {
        "status": "REUSABLE_GENERIC_PRODUCERS; INSTANCE SWEEP REQUIRED",
        "lean_sources": [
            "exact5-card13-cnf-ingress-audit/SemanticRowTable.lean",
            "exact5-card13-cnf-ingress-audit/DirectSourceBaseFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOneBaseGeometryFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOnePacketFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOneAnyPairPackedFacts.lean",
        ],
        "note": (
            "Reuse the asymmetric SemanticRowTable but pack actual blockerIndex values "
            "as in AllOneSourceIngress; do not reuse directCertificateBlockers."
        ),
    },
    "retained_distinct_role": {
        "status": "SOURCE THEOREMS PRESENT; NEW TWO-PARENT-ROW PACKED ADAPTERS REQUIRED",
        "lean_sources": [
            "exact5-first-apex-card13-normal-form/ExactFiveFirstApexCard13NormalForm.lean",
            "exact5-first-apex-card13-parent-row-coupling/ExactFiveFirstApexCard13ParentRowCoupling.lean",
            "exact5-card13-cnf-ingress-audit/DirectSourceBaseFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOneBaseGeometryFacts.lean",
        ],
        "note": (
            "The 2+2 partition, exact first-apex classes, and B1=double-row theorem "
            "are already kernel checked. Generic two-circle/cap producers cover the "
            "new-row incidence clauses once B1/B2 are packed."
        ),
    },
    "distinct_parent_coupling": {
        "status": "REUSABLE SOURCE FACTS; SMALL PACKED ADAPTER",
        "lean_sources": [
            "exact5-first-apex-card13-parent-row-coupling/ExactFiveFirstApexCard13ParentRowCoupling.lean",
            "Erdos9796Proof/P97/ATail/LargeCapUniqueFiveCommonDeletionNormalForm.lean",
        ],
        "note": "Thirteen B1=double-row bits plus the shell not-both-q-w clause.",
    },
    "connectivity": {
        "status": "FIRST MISSING COMBINATORIAL INGRESS BRIDGE",
        "lean_sources": [
            "selected-row-strong-connectivity/SelectedRowStrongConnectivity.lean",
            "row-triangle-connectivity-audit/RowTriangleConnectivityAudit.lean",
        ],
        "note": (
            "Minimality already gives no proper sink / ReflTransGen reachability. "
            "Still needed: a generic Fin-13 theorem connecting that relation to the "
            "source's exact 13-stage forward/backward Boolean recurrence and terminal bits."
        ),
    },
    "rank_bounds": {
        "status": "REUSABLE LEAN PRODUCER",
        "lean_sources": ["exact5-card13-cnf-ingress-audit/FiniteDistanceRank.lean"],
        "note": "DirectSourceRankFacts and AllOneRankFacts expose the exact 78#7 bound.",
    },
    "guarded_selected_row_equalities": {
        "status": "REUSABLE FOR m/g0/g1, b1, shell; PARENT-ROW ADAPTERS REQUIRED",
        "lean_sources": [
            "exact5-card13-cnf-ingress-audit/DirectSourceRankFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOneRankFacts.lean",
        ],
        "note": (
            "The parent-first schema rewrites through B1=double-row. Parent-second "
            "needs the same generic SelectedFourClass distance-equality guard."
        ),
    },
    "complete_class_inequalities": {
        "status": "SOURCE EXACTNESS PRESENT; MISSING GENERIC PACKED NE-RANK GUARD",
        "lean_sources": [
            "exact5-first-apex-card13-normal-form/ExactFiveFirstApexCard13NormalForm.lean",
            "exact5-card13-cnf-ingress-audit/FiniteDistanceRank.lean",
            "Erdos9796Proof/P97/ATail/LargeCapUniqueFive.lean",
            "Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean",
        ],
        "note": (
            "Membership XOR gives unequal actual distances for a complete class; "
            "packed rank inequality follows by finiteOrdinalRank78BitVec_eq_iff."
        ),
    },
    "unique_k4_second": {
        "status": "SOURCE PRODUCER PRESENT; PACKED QUAD INSTANCE GENERATOR REQUIRED",
        "lean_sources": ["Erdos9796Proof/P97/ATail/LargeCapUniqueFive.lean"],
        "note": "Use profile.unique_K4_radius and the exact-five complete class.",
    },
    "unique_k4_first": {
        "status": "SOURCE PRODUCER PRESENT; PACKED QUAD INSTANCE GENERATOR REQUIRED",
        "lean_sources": [
            "exact5-first-apex-card13-parent-row-coupling/ExactFiveFirstApexCard13ParentRowCoupling.lean"
        ],
        "note": (
            "firstApex_K4_radius_eq_retained_or_double_of_distinctRadius is exactly "
            "the source-level classification required here."
        ),
    },
    "unique_k4_critical": {
        "status": "SOURCE PRODUCER PRESENT; ACTUAL-BLOCKER GUARDED ADAPTER REQUIRED",
        "lean_sources": [
            "Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean",
            "exact5-card13-all-one-source-ingress/AllOneSourceIngress.lean",
        ],
        "note": (
            "CriticalShellSystem.selectedFourClass_support_eq_shell supplies uniqueness "
            "at every actual blocker-image center. The full surface requires actual "
            "blocker indices, unlike the same-radius selected-core coordinator."
        ),
    },
    "kalmanson_cancellation": {
        "status": "REUSABLE LEAN PRODUCER AND INSTANCE GENERATOR SHAPE",
        "lean_sources": [
            "exact5-card13-cnf-ingress-audit/DirectSourceRankFacts.lean",
            "exact5-card13-all-one-source-ingress/AllOneRankFacts.lean",
        ],
        "note": "The source uses the same 5,720 one-term cancellation clauses.",
    },
}


def audit_orbit(short: str) -> dict[str, object]:
    short, spec = resolve_orbit(short)
    outer, _ranks, counts, assertions, origins = traced_surface(spec["source_orbit"])
    normal, normal_counts, _normal_outer, _normal_ranks = build_source_assertions(short)
    if counts != normal_counts:
        raise AssertionError("traced source count metadata drift")
    for index, (traced, ordinary) in enumerate(zip(assertions, normal, strict=True)):
        if traced.sexpr() != ordinary.sexpr():
            raise AssertionError(f"traced full source drift at {index}")
    variables = collect_variables(assertions)
    emitter = DistinctEmitter(variables)
    for assertion in assertions:
        emitter.boolean(assertion)

    ranges = block_ranges(counts)
    origin_groups: dict[tuple[str, str, int, str], list[int]] = defaultdict(list)
    block_reports = []
    for block in ranges:
        start = int(block["start"])
        end = int(block["end"])
        subset = assertions[start:end]
        origin_counter = Counter(origins[start:end])
        for origin, count in origin_counter.items():
            path, function, line = origin
            origin_groups[(path, function, line, str(block["name"]))].extend(
                index for index in range(start, end) if origins[index] == origin
            )
        block_reports.append({
            **block,
            "sha256": stream_hash(subset),
            "producer": PRODUCER_INVENTORY[str(block["name"])],
            "origin_count": len(origin_counter),
        })

    origin_reports = []
    for (path, function, line, block), indices in sorted(
        origin_groups.items(), key=lambda item: min(item[1])
    ):
        selected = [assertions[index] for index in indices]
        origin_reports.append({
            "block": block,
            "path": relative(path),
            "function": function,
            "line": line,
            "source": source_line(path, line),
            "count": len(indices),
            "first_index": min(indices),
            "last_index": max(indices),
            "indices_contiguous": indices == list(range(min(indices), max(indices) + 1)),
            "sha256": stream_hash(selected),
        })

    categories = Counter(str(item["category"]) for item in variables.values())
    return {
        "short_orbit": short,
        "source_orbit": spec["source_orbit"],
        "roles": outer.roles,
        "assertions": len(assertions),
        "source_stream_sha256": source_stream_sha256(assertions),
        "counts": counts,
        "blocks": block_reports,
        "origins": origin_reports,
        "variables": len(variables),
        "source_bits": sum(int(item["width"]) for item in variables.values()),
        "variable_categories": dict(sorted(categories.items())),
        "variable_layout": [
            {"name": name, **item} for name, item in variables.items()
        ],
        "operators": sorted(emitter.seen_operators),
        "source_contract": source_contract(spec),
        "status": "PASS",
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    reports = [audit_orbit(short) for short in ORBIT_SPECS]
    if {report["assertions"] for report in reports} != {EXPECTED_ASSERTIONS}:
        raise AssertionError("cross-orbit assertion count drift")
    payload = {
        "schema": "p97-exact5-card13-distinct-source-surface-audit-v1",
        "status": "PASS",
        "expected_assertions_per_orbit": EXPECTED_ASSERTIONS,
        "expected_variables_per_orbit": EXPECTED_VARIABLES,
        "expected_source_bits_per_orbit": EXPECTED_SOURCE_BITS,
        "orbits": reports,
        "first_missing_ingress_producers": [
            {
                "name": "fin13_staticReachability_of_selectedRows",
                "kind": "combinatorial bridge",
                "purpose": (
                    "derive the exact 13-stage forward/backward source recurrence and "
                    "terminal reachability bits from the existing minimality/no-sink theorem"
                ),
            },
            {
                "name": "distinct_completeClass_rank_ne_guard",
                "kind": "generic packed adapter",
                "purpose": (
                    "turn complete-class membership XOR into inequality of the two "
                    "seven-bit finite ordinal ranks"
                ),
            },
            {
                "name": "distinct_uniqueK4_rank_guard",
                "kind": "generic packed adapter plus generated instances",
                "purpose": (
                    "instantiate the already-proved second-apex, first-apex, and "
                    "actual-critical-center K4 uniqueness facts on each four-subset"
                ),
            },
        ],
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "status": payload["status"],
        "output": str(args.output),
        "orbits": [
            {
                "orbit": report["source_orbit"],
                "assertions": report["assertions"],
                "variables": report["variables"],
                "source_bits": report["source_bits"],
                "source_stream_sha256": report["source_stream_sha256"],
            }
            for report in reports
        ],
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
