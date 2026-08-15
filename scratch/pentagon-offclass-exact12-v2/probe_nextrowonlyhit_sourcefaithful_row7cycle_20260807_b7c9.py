#!/usr/bin/env python3
"""Refined exact-12 next-row sidecar, preserving the v1 probe.

The first variant adds the source row-7 trace requested by the follow-up.  The
second variant additionally encodes the five source physical-cycle traces,
their existential blocker centers, pairwise blocker-center distinctness, and
the two fixed producer identities used by the live packet.  Both variants are
finite empirical probes, not closure proofs.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))

from census.card_head.candidate_surface import build_model  # noqa: E402
from census.card_head.sat_encoding import solve_cadical  # noqa: E402
from census.card_head.source_faithful_candidate_surface import (  # noqa: E402
    SOURCE_FAITHFUL_INCLUDED_RULES,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)


N = 12
O, U, C, XV, XU = 1, 6, 7, 8, 9
PLACEMENTS = (0, 2, 3, 4, 5, 10, 11)
NEXT_CENTERS = tuple(center for center in range(N) if center not in (O, C))


def exactly_one(instance: SourceFaithfulCoverInstance, variables: list[int]) -> None:
    instance.cnf.add_clause(variables)
    instance.cnf.at_most_sinz(variables, 1)


def row_literals(
    instance: SourceFaithfulCoverInstance,
    center: int,
    predicate,
) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, candidate in enumerate(instance.candidates[center])
        if predicate(set(candidate))
    ]


def add_row7_trace(
    instance: SourceFaithfulCoverInstance, jd: int, v: int
) -> tuple[list[int], frozenset[int]]:
    physical = frozenset((U, XU, jd, v, XV))
    required_trace = frozenset((U, XV))
    literals = row_literals(
        instance,
        C,
        lambda candidate: candidate & physical == required_trace,
    )
    instance.cnf.add_clause(literals)
    return literals, physical


def add_next_row_condition(instance: SourceFaithfulCoverInstance) -> list[int]:
    literals = [
        instance.choice_variables[(center, index)]
        for center in NEXT_CENTERS
        for index, candidate in enumerate(instance.candidates[center])
        if {C, XU} <= set(candidate) and not ({U, XV} & set(candidate))
    ]
    instance.cnf.add_clause(literals)
    return literals


def add_five_blocker_cycle(
    instance: SourceFaithfulCoverInstance, jd: int, v: int, physical: frozenset[int]
) -> dict:
    """Add exact five traces plus existential distinct blocker centers."""

    sources = (U, XU, jd, v, XV)
    edges = {
        U: frozenset((U, XU)),
        XU: frozenset((XU, jd)),
        jd: frozenset((jd, v)),
        v: frozenset((v, XV)),
        XV: frozenset((XV, U)),
    }
    blocker_variables: dict[tuple[int, int], int] = {}
    valid_center_counts: dict[int, int] = {}
    for source in sources:
        allowed = [center for center in range(N) if center not in (O, source)]
        source_vars: list[int] = []
        for center in allowed:
            variable = instance.cnf.new_variable()
            blocker_variables[(source, center)] = variable
            source_vars.append(variable)
            valid = row_literals(
                instance,
                center,
                lambda candidate, source=source, edge=edges[source]: (
                    source in candidate and candidate & physical == edge
                ),
            )
            valid_center_counts[center] = valid_center_counts.get(center, 0) + bool(valid)
            instance.cnf.add_clause([-variable, *valid])
        exactly_one(instance, source_vars)

    # Five actual blocker centers are pairwise distinct.
    for center in range(N):
        at_center = [
            variable
            for (source, candidate_center), variable in blocker_variables.items()
            if candidate_center == center
        ]
        if at_center:
            instance.cnf.at_most_sinz(at_center, 1)

    # Exact producer identities in the live five-cycle packet.
    instance.cnf.add_clause([blocker_variables[(U, XV)]])
    instance.cnf.add_clause([blocker_variables[(XV, C)]])

    return {
        "sources": list(sources),
        "trace_edges": {str(source): sorted(edges[source]) for source in sources},
        "fixed_blocker_identities": {str(U): XV, str(XV): C},
        "valid_blocker_center_count_by_source": {
            str(source): sum(
                bool(
                    row_literals(
                        instance,
                        center,
                        lambda candidate, source=source, edge=edges[source]: (
                            source in candidate and candidate & physical == edge
                        ),
                    )
                )
                for center in range(N)
                if center not in (O, source)
            )
            for source in sources
        },
    }


def blocker_map(cube: dict[int, list[int]], jd: int, v: int) -> dict[str, int] | None:
    physical = {U, XU, jd, v, XV}
    sources = (U, XU, jd, v, XV)
    edges = {
        U: {U, XU}, XU: {XU, jd}, jd: {jd, v}, v: {v, XV}, XV: {XV, U}
    }
    options = {
        source: [
            center for center in range(N)
            if center not in (O, source)
            and source in cube[center]
            and (set(cube[center]) & physical) == edges[source]
        ]
        for source in sources
    }
    options[U] = [XV] if XV in options[U] else []
    options[XV] = [C] if C in options[XV] else []

    def search(index: int, used: set[int], answer: dict[int, int]):
        if index == len(sources):
            return dict(answer)
        source = sources[index]
        for center in options[source]:
            if center in used:
                continue
            answer[source] = center
            found = search(index + 1, used | {center}, answer)
            if found is not None:
                return found
        return None

    found = search(0, set(), {})
    return None if found is None else {str(source): center for source, center in found.items()}


def solve_variant(
    jd: int,
    v: int,
    variant: str,
    case_dir: Path,
    timeout_seconds: int,
) -> dict:
    model = build_model(N, SOURCE_FAITHFUL_PYTHON_PROFILE)
    instance = SourceFaithfulCoverInstance(model)
    row1 = frozenset((U, jd, v, XV))
    row1_index = instance.candidate_index(O, row1)
    row7_literals, physical = add_row7_trace(instance, jd, v)
    next_row_literals = add_next_row_condition(instance)
    extra = [
        [instance.choice_variables[(O, row1_index)]],
        row7_literals,
        next_row_literals,
    ]
    cycle_metadata = None
    if variant == "row7_plus_five_cycle":
        cycle_metadata = add_five_blocker_cycle(instance, jd, v, physical)
    path = case_dir / variant / f"jd{jd}_v{v}.cnf"
    result = solve_cadical(
        instance,
        path,
        extra_clauses=extra,
        timeout_seconds=timeout_seconds,
    )
    case = {
        "jd": jd,
        "v": v,
        "forced_row_1": sorted(row1),
        "row_7_trace": {
            "physical_class": sorted(physical),
            "exact_trace": [U, XV],
            "clause_width": len(row7_literals),
        },
        "next_row_clause_width": len(next_row_literals),
        "verdict": result.verdict,
    }
    if cycle_metadata is not None:
        case["cycle_constraints"] = cycle_metadata
    if result.verdict == "SAT":
        assert result.cube is not None
        case["cube"] = {str(center): result.cube[center] for center in range(N)}
        if variant == "row7_plus_five_cycle":
            case["blocker_map"] = blocker_map(result.cube, jd, v)
    return case


def run(out_path: Path, case_dir: Path, timeout_seconds: int) -> dict:
    model = build_model(N, SOURCE_FAITHFUL_PYTHON_PROFILE)
    surface = SourceFaithfulCoverInstance(model)
    cross_cap = []
    for jd in PLACEMENTS:
        for v in PLACEMENTS:
            if jd == v:
                continue
            try:
                surface.candidate_index(O, (U, jd, v, XV))
            except ValueError:
                continue
            cross_cap.append((jd, v))

    variants = {}
    for variant in ("row7_trace_only", "row7_plus_five_cycle"):
        cases = [
            solve_variant(jd, v, variant, case_dir, timeout_seconds)
            for jd, v in cross_cap
        ]
        counts = {
            verdict: sum(case["verdict"] == verdict for case in cases)
            for verdict in ("SAT", "UNSAT", "UNKNOWN")
        }
        first_sat = next(
            (case for case in cases if case["verdict"] == "SAT"), None
        )
        variants[variant] = {
            "case_count": len(cases),
            "counts": counts,
            "first_sat_witness": first_sat,
            "cases": cases,
        }

    result = {
        "schema": "p97_exact12_nextrowonlyhit_sourcefaithful_row7cycle_sidecar.v1",
        "classification": "EMPIRICAL FINITE EVIDENCE; NOT CLOSURE",
        "frozen_v1_preserved": True,
        "surface": "SourceFaithfulCoverInstance",
        "source_proved_base_constraints": list(SOURCE_FAITHFUL_INCLUDED_RULES),
        "probe_assumptions": {
            "row_1_exact": [U, "jd", "v", XV],
            "row_7_intersection": {
                "physical_class": [U, XU, "jd", "v", XV],
                "exact_trace": [U, XV],
            },
            "next_row_only_hit": {
                "center_excludes": [O, C],
                "contains": [C, XU],
                "excludes": [U, XV],
            },
        },
        "roles": {"O": O, "u": U, "c": C, "xv": XV, "xu": XU},
        "placements_domain": list(PLACEMENTS),
        "cross_cap_placements_after_apex_cut": [list(pair) for pair in cross_cap],
        "cross_cap_case_count": len(cross_cap),
        "variants": variants,
        "cycle_variant_scope": (
            "five exact physical-cycle trace existentials, existential blocker "
            "centers, pairwise distinct blocker centers, and fixed identities "
            "blocker(u)=xv and blocker(xv)=c; no historical physical cuts"
        ),
        "timeout_seconds_per_case": timeout_seconds,
    }
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--case-dir", type=Path, required=True)
    parser.add_argument("--timeout", type=int, default=30)
    args = parser.parse_args()
    result = run(args.out, args.case_dir, args.timeout)
    print(json.dumps({
        variant: data["counts"] for variant, data in result["variants"].items()
    }))


if __name__ == "__main__":
    main()
