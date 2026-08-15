#!/usr/bin/env python3
"""Bounded exact-12 nextRowOnlyHit probe on the source-faithful surface.

This sidecar adds only the two requested probe assumptions to the
SourceFaithfulCoverInstance CNF: the exact row at center 1 and the existence
of one eligible next row.  It deliberately does not import the historical
CoverInstance or add diagnostic physical/blocker constraints.
"""

from __future__ import annotations

import argparse
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
sys.path.insert(0, str(ROOT))

from census.card_head.candidate_surface import build_model
from census.card_head.sat_encoding import solve_cadical
from census.card_head.source_faithful_candidate_surface import (
    SOURCE_FAITHFUL_INCLUDED_RULES,
    SOURCE_FAITHFUL_PYTHON_PROFILE,
    SourceFaithfulCoverInstance,
)


CARDINALITY = 12
O, U, C, XV, XU = 1, 6, 7, 8, 9
PLACEMENTS = (0, 2, 3, 4, 5, 10, 11)
ELIGIBLE_NEXT_CENTERS = tuple(
    center for center in range(CARDINALITY) if center not in (O, C)
)


def run(out_path: Path, case_dir: Path, timeout_seconds: int) -> dict:
    model = build_model(CARDINALITY, SOURCE_FAITHFUL_PYTHON_PROFILE)
    instance = SourceFaithfulCoverInstance(model)
    row1_candidates = {
        (jd, v): frozenset((U, jd, v, XV))
        for jd in PLACEMENTS
        for v in PLACEMENTS
        if jd != v
    }

    next_literals: list[int] = []
    next_candidate_counts: dict[int, int] = {}
    for center in ELIGIBLE_NEXT_CENTERS:
        qualifying = [
            index
            for index, candidate in enumerate(instance.candidates[center])
            if {C, XU} <= set(candidate)
            and not ({U, XV} & set(candidate))
        ]
        next_candidate_counts[center] = len(qualifying)
        next_literals.extend(
            instance.choice_variables[(center, index)] for index in qualifying
        )

    case_dir.mkdir(parents=True, exist_ok=True)
    cases: list[dict] = []
    first_sat: dict | None = None
    for jd in PLACEMENTS:
        for v in PLACEMENTS:
            if jd == v:
                continue
            row1 = row1_candidates[(jd, v)]
            case = {"jd": jd, "v": v, "forced_row_1": sorted(row1)}
            try:
                row1_index = instance.candidate_index(O, row1)
            except ValueError:
                case.update(
                    {
                        "verdict": "UNSAT",
                        "reason": "forced_row_not_in_source_faithful_surface",
                    }
                )
                cases.append(case)
                continue

            extra_clauses = [
                [instance.choice_variables[(O, row1_index)]],
                next_literals,
            ]
            result = solve_cadical(
                instance,
                case_dir / f"jd{jd}_v{v}.cnf",
                extra_clauses=extra_clauses,
                timeout_seconds=timeout_seconds,
            )
            case["verdict"] = result.verdict
            case["returncode"] = result.returncode
            if result.verdict == "SAT":
                assert result.cube is not None
                matching_centers = [
                    center
                    for center in ELIGIBLE_NEXT_CENTERS
                    if {C, XU} <= set(result.cube[center])
                    and not ({U, XV} & set(result.cube[center]))
                ]
                case["matching_next_centers"] = matching_centers
                if not matching_centers:
                    raise RuntimeError("decoded SAT witness misses next-row clause")
                if first_sat is None:
                    first_sat = {
                        "jd": jd,
                        "v": v,
                        "forced_row_1": sorted(row1),
                        "matching_next_centers": matching_centers,
                        "cube": {
                            str(center): result.cube[center]
                            for center in range(CARDINALITY)
                        },
                    }
            cases.append(case)

    sat_count = sum(case["verdict"] == "SAT" for case in cases)
    unsat_count = sum(case["verdict"] == "UNSAT" for case in cases)
    unknown_count = len(cases) - sat_count - unsat_count
    result = {
        "schema": "p97_exact12_nextrowonlyhit_sourcefaithful_sidecar.v1",
        "classification": "EMPIRICAL FINITE RESULT; NOT CLOSURE",
        "surface": "SourceFaithfulCoverInstance",
        "source_proved_constraints": list(SOURCE_FAITHFUL_INCLUDED_RULES),
        "source_excluded_constraints": [
            "historical mixed Moser/same-cap cut",
            "probe physical apex/circle/pair/blocker constraints",
        ],
        "cardinality": CARDINALITY,
        "python_profile": list(SOURCE_FAITHFUL_PYTHON_PROFILE),
        "roles": {"O": O, "u": U, "c": C, "xv": XV, "xu": XU},
        "ordered_placements": list(PLACEMENTS),
        "placement_case_count": len(cases),
        "next_center_domain": list(ELIGIBLE_NEXT_CENTERS),
        "next_row_condition": {
            "contains": [C, XU],
            "excludes": [U, XV],
            "next_candidate_counts_by_center": next_candidate_counts,
        },
        "timeout_seconds_per_solver_case": timeout_seconds,
        "counts": {
            "SAT": sat_count,
            "UNSAT": unsat_count,
            "UNKNOWN_or_TIMEOUT": unknown_count,
        },
        "first_sat_witness": first_sat,
        "cases": cases,
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
    print(json.dumps({"counts": result["counts"], "first_sat": result["first_sat_witness"] is not None}))


if __name__ == "__main__":
    main()
