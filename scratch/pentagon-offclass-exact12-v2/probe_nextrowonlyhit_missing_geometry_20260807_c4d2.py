#!/usr/bin/env python3
"""Bounded test of two absent source-geometric predicates.

The base is the b7c9 sidecar: SourceFaithfulCoverInstance, exact row 1,
the exact row-7 physical trace, and the original arbitrary next-center
nextRowOnlyHit clause.  Each variant adds one source-proved Kc predicate.
No production or Lean artifact is modified.
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


def row_literals(instance, center: int, predicate) -> list[int]:
    return [
        instance.choice_variables[(center, index)]
        for index, candidate in enumerate(instance.candidates[center])
        if predicate(set(candidate))
    ]


def base_clauses(instance, jd: int, v: int) -> tuple[list[list[int]], dict]:
    physical = frozenset((U, XU, jd, v, XV))
    row1 = frozenset((U, jd, v, XV))
    row1_index = instance.candidate_index(O, row1)
    row7_trace = row_literals(
        instance, C, lambda row: row & physical == frozenset((U, XV))
    )
    next_row = [
        instance.choice_variables[(center, index)]
        for center in NEXT_CENTERS
        for index, candidate in enumerate(instance.candidates[center])
        if {C, XU} <= set(candidate) and not ({U, XV} & set(candidate))
    ]
    return [
        [instance.choice_variables[(O, row1_index)]],
        row7_trace,
        next_row,
    ], {
        "row_1": sorted(row1),
        "row_7_physical_class": sorted(physical),
        "row_7_exact_trace": [U, XV],
        "row_7_trace_clause_width": len(row7_trace),
        "arbitrary_next_row_clause_width": len(next_row),
    }


VARIANTS = {
    "localized_live_hnextRowOnlyHit": {
        "theorem": (
            "pentagonOffClassBlocker_xu_commonDeletionFans_or_nextRow_onlyHit"
        ),
        "source_location": "Rigid221SourceHeavy.lean:8251-8271",
        "predicate": (
            "row[7] contains xu=9 and excludes u=6,xv=8; this identifies "
            "the arbitrary next-row witness with Kc"
        ),
    },
    "strict_triple_card_le_one": {
        "theorem": "pentagonOffClassBlocker_nextRow_strictTriple_card_le_one",
        "source_location": "Rigid221SourceHeavy.lean:8082-8096",
        "predicate": "|row[7] ∩ {u=6,xu=9,xv=8}| ≤ 1",
    },
}


def run_variant(
    name: str,
    jd: int,
    v: int,
    case_dir: Path,
    timeout_seconds: int,
) -> dict:
    model = build_model(N, SOURCE_FAITHFUL_PYTHON_PROFILE)
    instance = SourceFaithfulCoverInstance(model)
    clauses, metadata = base_clauses(instance, jd, v)
    if name == "localized_live_hnextRowOnlyHit":
        predicate_literals = row_literals(
            instance, C, lambda row: XU in row and U not in row and XV not in row
        )
    else:
        predicate_literals = row_literals(
            instance, C, lambda row: len(row & {U, XU, XV}) <= 1
        )
    clauses.append(predicate_literals)
    metadata["added_predicate_clause_width"] = len(predicate_literals)
    result = solve_cadical(
        instance,
        case_dir / name / f"jd{jd}_v{v}.cnf",
        extra_clauses=clauses,
        timeout_seconds=timeout_seconds,
    )
    return {
        "jd": jd,
        "v": v,
        "verdict": result.verdict,
        "metadata": metadata,
    }


def run(out_path: Path, case_dir: Path, timeout_seconds: int) -> dict:
    model = build_model(N, SOURCE_FAITHFUL_PYTHON_PROFILE)
    surface = SourceFaithfulCoverInstance(model)
    placements = []
    for jd in PLACEMENTS:
        for v in PLACEMENTS:
            if jd == v:
                continue
            try:
                surface.candidate_index(O, (U, jd, v, XV))
            except ValueError:
                continue
            placements.append((jd, v))

    variants = {}
    for name, description in VARIANTS.items():
        cases = [
            run_variant(name, jd, v, case_dir, timeout_seconds)
            for jd, v in placements
        ]
        variants[name] = {
            **description,
            "case_count": len(cases),
            "counts": {
                verdict: sum(case["verdict"] == verdict for case in cases)
                for verdict in ("SAT", "UNSAT", "UNKNOWN")
            },
            "cases": cases,
        }

    result = {
        "schema": "p97_exact12_nextrowonlyhit_missing_geometry_sidecar.v1",
        "classification": "EMPIRICAL FINITE EVIDENCE; NOT CLOSURE",
        "frozen_b7c9_preserved": True,
        "surface": "SourceFaithfulCoverInstance",
        "source_proved_base_constraints": list(SOURCE_FAITHFUL_INCLUDED_RULES),
        "base_sidecar_assumptions": {
            "row_1_exact": [U, "jd", "v", XV],
            "row_7_trace": "row[7] ∩ {6,9,jd,v,8} = {6,8}",
            "original_nextRowOnlyHit": (
                "exists t != 1,7 with {7,9} subset row[t] and "
                "row[t] ∩ {6,8} = empty"
            ),
        },
        "roles": {"O": O, "u": U, "c": C, "xv": XV, "xu": XU},
        "cross_cap_placements_after_apex_cut": [list(pair) for pair in placements],
        "cross_cap_case_count": len(placements),
        "variants": variants,
        "not_tested_as_non_discriminating": {
            "theorem": "pentagonOffClassBlocker_physicalClass_commonDeletionFan",
            "source_location": "Rigid221SourceHeavy.lean:8186-8205",
            "reason": (
                "its |physicalClass \\ row[7]| >= 3 consequence is already met "
                "by the retained exact two-point row-7 trace"
            ),
        },
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
    print(json.dumps({name: data["counts"] for name, data in result["variants"].items()}))


if __name__ == "__main__":
    main()
