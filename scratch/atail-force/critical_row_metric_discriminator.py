# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact metric discriminator for two critical-row shadow witnesses.

The two saved row systems satisfy the finite pair-overlap and cyclic
separation checks used by the stronger critical-row incidence shadow, and
they avoid every metric core currently recognized by
``_formalized_metric_core``.  This script then checks a smaller equality
subsystem of each witness with Singular over ``QQ``.

``UNIT`` is a trusted exact-arithmetic CAS verdict for the gauge-fixed ideal;
this checkpoint does not extract and independently replay a Nullstellensatz
certificate.  The saved systems are only two search witnesses: this script is
neither an exhaustive critical-row census nor a producer for K-A-PAIR.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import dataclass
from itertools import combinations
from pathlib import Path
from typing import Any

from census.global_confinement import shadow
from census.global_confinement.equality_ideal_probe import (
    probe_rows,
    run_smoke_gates,
    system_polynomials,
)
from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)


HERE = Path(__file__).resolve().parent
DEFAULT_OUTPUT = HERE / "critical_row_metric_discriminator.json"
SCHEMA = "p97-atail-critical-row-metric-discriminator-v1"
N = 12


@dataclass(frozen=True)
class Candidate:
    profile: tuple[int, int, int]
    cyclic_order: tuple[int, ...]
    rows: tuple[MetricRow, ...]
    confirmed_unit_subsystem: tuple[MetricRow, ...]


def _rows(data: dict[int, tuple[int, ...]]) -> tuple[MetricRow, ...]:
    return tuple(
        MetricRow(center, support, False)
        for center, support in data.items()
    )


CANDIDATES = (
    Candidate(
        profile=(4, 5, 6),
        cyclic_order=(0, 8, 9, 11, 10, 1, 3, 4, 2, 5, 6, 7),
        rows=_rows(
            {
                0: (1, 2, 3, 4),
                1: (0, 2, 5, 6),
                10: (1, 5, 7, 8),
                11: (1, 6, 9, 10),
                2: (4, 5, 9, 11),
                3: (1, 2, 7, 9),
                4: (2, 3, 8, 10),
                5: (1, 6, 8, 11),
                6: (2, 7, 10, 11),
                7: (0, 3, 5, 11),
                8: (0, 3, 7, 9),
                9: (0, 4, 8, 10),
            }
        ),
        confirmed_unit_subsystem=_rows(
            {
                1: (0, 2, 5, 6),
                2: (4, 5, 9, 11),
                4: (2, 3, 8, 10),
                5: (1, 6, 8, 11),
                6: (2, 7, 10, 11),
                7: (0, 3, 5, 11),
                8: (0, 3, 7, 9),
                9: (0, 4, 8, 10),
            }
        ),
    ),
    Candidate(
        profile=(5, 5, 5),
        cyclic_order=(0, 9, 10, 1, 11, 3, 4, 5, 2, 6, 7, 8),
        rows=_rows(
            {
                0: (1, 2, 3, 4),
                1: (0, 2, 6, 7),
                10: (1, 6, 9, 11),
                11: (3, 7, 8, 10),
                2: (0, 1, 9, 10),
                3: (1, 4, 6, 8),
                4: (2, 3, 5, 10),
                5: (0, 3, 8, 11),
                6: (2, 7, 9, 11),
                7: (3, 5, 6, 9),
                8: (0, 4, 5, 7),
                9: (0, 5, 10, 11),
            }
        ),
        confirmed_unit_subsystem=_rows(
            {
                1: (0, 2, 6, 7),
                2: (0, 1, 9, 10),
                4: (2, 3, 5, 10),
                5: (0, 3, 11),
                6: (2, 7, 9, 11),
                7: (3, 5, 6, 9),
                9: (0, 5, 10, 11),
            }
        ),
    ),
)


def _row_signature(row: MetricRow) -> tuple[int, tuple[int, ...]]:
    return row.center, row.support


def _candidate_digest(candidate: Candidate) -> str:
    payload = {
        "profile": candidate.profile,
        "cyclic_order": candidate.cyclic_order,
        "rows": [_row_signature(row) for row in candidate.rows],
        "confirmed_unit_subsystem": [
            _row_signature(row) for row in candidate.confirmed_unit_subsystem
        ],
    }
    encoded = json.dumps(
        payload, sort_keys=True, separators=(",", ":")
    ).encode()
    return hashlib.sha256(encoded).hexdigest()


def _validate_shadow(candidate: Candidate) -> dict[str, Any]:
    if candidate.cyclic_order[0] != 0:
        raise AssertionError("cyclic order must use the pinned rotation")
    if sorted(candidate.cyclic_order) != list(range(N)):
        raise AssertionError("cyclic order is not a permutation")
    centers = {row.center for row in candidate.rows}
    if centers != set(range(N)):
        raise AssertionError("candidate must select one row at every center")
    if any(
        len(row.support) != 4
        or row.center in row.support
        or len(set(row.support)) != 4
        or not set(row.support) <= set(range(N))
        for row in candidate.rows
    ):
        raise AssertionError("invalid selected four-point row")

    class_rows = tuple(
        shadow.ClassRow(
            name=f"row_{row.center}",
            center=row.center,
            support=frozenset(row.support),
            exact=False,
        )
        for row in candidate.rows
    )
    max_overlap = max(
        len(left.support & right.support)
        for left, right in combinations(class_rows, 2)
    )
    if max_overlap > 2:
        raise AssertionError("two-circle support-overlap bound failed")
    bad_cross_pairs = [
        (left.center, right.center)
        for left, right in combinations(class_rows, 2)
        if not shadow.cross_separation_ok(
            candidate.cyclic_order, left, right
        )
    ]
    if bad_cross_pairs:
        raise AssertionError(
            f"cyclic cross-separation failed: {bad_cross_pairs}"
        )
    current_core = _formalized_metric_core(
        candidate.rows, N, candidate.cyclic_order
    )
    if current_core is not None:
        raise AssertionError(f"current metric core found: {current_core}")

    full_polynomials = set(system_polynomials(candidate.rows))
    subsystem_polynomials = set(
        system_polynomials(candidate.confirmed_unit_subsystem)
    )
    if not subsystem_polynomials <= full_polynomials:
        raise AssertionError("confirmed subsystem is not contained in candidate")

    return {
        "one_selected_row_per_center": True,
        "selected_row_support_cardinality": 4,
        "maximum_pair_support_overlap": max_overlap,
        "all_shared_pair_cross_separations_hold": True,
        "current_formalized_metric_core": None,
        "full_equality_count": len(system_polynomials(candidate.rows)),
    }


def run(*, timeout_s: float, executable: str) -> dict[str, Any]:
    smoke = run_smoke_gates(timeout_s=timeout_s, executable=executable)
    results = []
    for candidate in CANDIDATES:
        shadow_checks = _validate_shadow(candidate)
        subsystem = candidate.confirmed_unit_subsystem
        oracle = probe_rows(
            N,
            subsystem,
            timeout_s=timeout_s,
            executable=executable,
        )
        if oracle.verdict != "UNIT":
            raise RuntimeError(
                f"profile {candidate.profile} expected UNIT, "
                f"got {oracle.verdict}"
            )
        active_labels = sorted(
            {row.center for row in subsystem}
            | {point for row in subsystem for point in row.support}
        )
        results.append(
            {
                "profile": list(candidate.profile),
                "profile_semantics": (
                    "internal_saved_search_block_profile; not the "
                    "closure_matrix_labeled_cap_tuple_order"
                ),
                "candidate_sha256": _candidate_digest(candidate),
                "cyclic_order": list(candidate.cyclic_order),
                "rows": [row.as_dict() for row in candidate.rows],
                "shadow_checks": shadow_checks,
                "confirmed_unit_subsystem": {
                    "rows": [row.as_dict() for row in subsystem],
                    "row_count": len(subsystem),
                    "equality_count": len(system_polynomials(subsystem)),
                    "active_labels": active_labels,
                    "singular_verdict": oracle.verdict,
                    "full_system_verdict": "UNIT_BY_SUBSYSTEM_MONOTONICITY",
                },
            }
        )

    return {
        "schema": SCHEMA,
        "singular_smoke_gates": smoke,
        "candidates": results,
        "summary": {
            "candidate_count": len(results),
            "candidates_passing_finite_shadow": len(results),
            "candidates_excluded_by_exact_equality_ideal": len(results),
        },
        "scope": {
            "exact_qq_unit_ideal_verdicts": True,
            "trusted_cas_computation": True,
            "nullstellensatz_certificate_replayed": False,
            "kernel_checked": False,
            "full_system_unit_follows_from_confirmed_subsystem": True,
            "saved_candidates_exhaustive": False,
            "finite_shadow_sat_is_euclidean_realization": False,
            "new_formalized_metric_core": False,
            "ka_pair_producer_proved": False,
            "lean_theorem_proved": False,
        },
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--timeout", type=float, default=180.0)
    parser.add_argument("--executable", default="Singular")
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    document = run(timeout_s=args.timeout, executable=args.executable)
    rendered = json.dumps(document, indent=2, sort_keys=True) + "\n"
    if args.check:
        if not args.output.exists():
            raise FileNotFoundError(args.output)
        if args.output.read_text(encoding="utf-8") != rendered:
            raise AssertionError(f"saved artifact drift: {args.output}")
        print(rendered, end="")
        return 0
    args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
