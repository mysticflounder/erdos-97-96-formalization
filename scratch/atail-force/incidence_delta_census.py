# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Exact finite-incidence witnesses for the seven LIVE-C helper families.

The model intentionally forgets Euclidean realizability, cap geometry, global
order, and metric equalities.  It retains only the current row-incidence facts:
four-point supports, source membership, the two distinguished ``t2`` slots
``f = t2[0]`` and ``f5 = t2[1]``, center/source separation, equal-center support
coupling, the conditional comparison maps, the f2 center split, and the
distinct-center two-circle intersection bounds (including the dangerous base).
A SAT witness therefore proves only that this discrete interface does not
force one of the enumerated sink events.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from dataclasses import asdict, dataclass


DANGEROUS_BASE = frozenset({"q", "t1", "t2", "t3"})
SOURCE_NAMES = ("q", "t1", "t2", "t3", "u")
ALL_SOURCE_LABELS = frozenset({*SOURCE_NAMES, "f"})
BASE_LABELS = frozenset({"p", *SOURCE_NAMES})


@dataclass(frozen=True)
class Row:
    source: str
    center: str
    support: tuple[str, ...]


@dataclass(frozen=True)
class FamilyWitness:
    family: str
    center_case: str
    f2_row: Row
    source_rows: tuple[Row, ...]
    row_failure_points: tuple[str, ...]


FAMILY_SPECS = (
    ("liveData_C_center_q_false", "q", ("f", "a0", "a1", "a2"), ()),
    ("liveData_C_center_t1_false", "t1", ("f", "a0", "a1", "a2"), ()),
    (
        "liveData_C_center_t2_named_false",
        "t2",
        ("f", "f5", "p", "q"),
        (),
    ),
    (
        "liveData_C_center_t2_rowFailure_false",
        "t2",
        ("f", "a0", "a1", "a2"),
        ("f5", "p", "q"),
    ),
    ("liveData_C_center_t3_false", "t3", ("f", "a0", "a1", "a2"), ()),
    ("liveData_C_center_u_false", "u", ("f", "a0", "a1", "a2"), ()),
    (
        "liveData_C_center_fresh_false",
        "c_fresh",
        ("f", "a0", "a1", "a2"),
        (),
    ),
)


def source_rows() -> tuple[Row, ...]:
    # ``f`` and ``f5`` are not free atoms: they are slots 0 and 1 of the
    # source row at ``t2``.  Put the source itself in slot 2; the precise slot
    # occupied by the source is existential in the Lean packet.
    return (
        Row("q", "c_q", ("q", "q_a0", "q_a1", "q_a2")),
        Row("t1", "c_t1", ("t1", "t1_a0", "t1_a1", "t1_a2")),
        Row("t2", "c_t2", ("f", "f5", "t2", "t2_a2")),
        Row("t3", "c_t3", ("t3", "t3_a0", "t3_a1", "t3_a2")),
        Row("u", "c_u", ("u", "u_a0", "u_a1", "u_a2")),
    )


def build_witness(
    family: str,
    center: str,
    support: tuple[str, ...],
    row_failure_points: tuple[str, ...],
) -> FamilyWitness:
    return FamilyWitness(
        family=family,
        center_case=center,
        f2_row=Row(source="f", center=center, support=support),
        source_rows=source_rows(),
        row_failure_points=row_failure_points,
    )


def validate_row(row: Row) -> None:
    support = set(row.support)
    assert len(row.support) == 4
    assert len(support) == 4
    assert row.source in support
    assert row.center != row.source
    assert row.center not in support


def dangerous_triple_sink(row: Row) -> bool:
    support = set(row.support)
    return "q" in support and 2 <= len(support & {"t1", "t2", "t3"})


def validate_witness(witness: FamilyWitness) -> dict[str, object]:
    # This concrete equality type chooses all packet base labels, ``f``, and
    # ``f5`` distinct.  Hence the live conditional maps activated by
    # ``f = rows.sourcePoint source`` are vacuous in these witnesses.
    assert "f" not in BASE_LABELS
    assert "f5" not in BASE_LABELS | {"f"}
    validate_row(witness.f2_row)
    for row in witness.source_rows:
        validate_row(row)

    t2_row = next(row for row in witness.source_rows if row.source == "t2")
    assert {"f", "f5", "t2"} <= set(t2_row.support)

    rows = (*witness.source_rows, witness.f2_row)
    for left in rows:
        for right in rows:
            if left.center == right.center:
                assert set(left.support) == set(right.support)
            else:
                # Banked two-circle uniqueness: selected four-classes at
                # distinct centers overlap in at most two support points.
                assert len(set(left.support) & set(right.support)) <= 2

    # The fixed dangerous selected class is centered at ``p`` with support
    # ``{q,t1,t2,t3}``.  Every modeled blocker center is chosen distinct from
    # ``p``, so the same two-circle bound applies to each row.
    assert all(row.center != "p" for row in rows)
    assert all(len(set(row.support) & DANGEROUS_BASE) <= 2 for row in rows)

    f2_support = set(witness.f2_row.support)
    assert len(f2_support & DANGEROUS_BASE) <= 2
    assert 2 <= len(f2_support - DANGEROUS_BASE)

    if witness.family == "liveData_C_center_t2_named_false":
        assert {"f5", "p", "q"} <= f2_support
    if witness.family == "liveData_C_center_t2_rowFailure_false":
        assert set(witness.row_failure_points).isdisjoint(f2_support)

    centers = [row.center for row in rows]
    second_center_collision = len(set(centers)) != len(centers)
    dangerous_sink = any(dangerous_triple_sink(row) for row in rows)
    five_sources_sink = any(
        5 <= len(set(row.support) & ALL_SOURCE_LABELS) for row in rows
    )
    assert not second_center_collision
    assert not dangerous_sink
    assert not five_sources_sink

    return {
        "family": witness.family,
        "status": "SAT_INCIDENCE_ONLY",
        "f2_dangerous_count": len(f2_support & DANGEROUS_BASE),
        "f2_off_dangerous_count": len(f2_support - DANGEROUS_BASE),
        "second_center_collision": second_center_collision,
        "q_plus_two_dangerous_sink": dangerous_sink,
        "five_source_support_sink": five_sources_sink,
        "f_and_f5_in_t2_source_row": True,
        "conditional_comparison_maps": "VACUOUS_F_DISTINCT_FROM_SOURCES",
        "row_failure_witness": (
            "F5_P_Q_EXCLUDED_FROM_EXACT_F2_SUPPORT"
            if witness.row_failure_points
            else "NOT_APPLICABLE"
        ),
        "metric_consumer_fields": "NOT_MODELED",
    }


def payload() -> dict[str, object]:
    witnesses = [build_witness(*spec) for spec in FAMILY_SPECS]
    results = [validate_witness(witness) for witness in witnesses]
    witness_data = [asdict(witness) for witness in witnesses]
    digest_input = json.dumps(
        witness_data, sort_keys=True, separators=(",", ":")
    ).encode()
    return {
        "scope": (
            "exact within the stated finite incidence abstraction; "
            "no Euclidean, convex, cap, order, or metric realizability claim"
        ),
        "family_count": len(witnesses),
        "sat_incidence_only_count": sum(
            result["status"] == "SAT_INCIDENCE_ONLY" for result in results
        ),
        "forced_sink_count": sum(
            bool(result["second_center_collision"])
            or bool(result["q_plus_two_dangerous_sink"])
            or bool(result["five_source_support_sink"])
            for result in results
        ),
        "witness_sha256": hashlib.sha256(digest_input).hexdigest(),
        "results": results,
        "witnesses": witness_data,
    }


def check_expected(result: dict[str, object]) -> None:
    assert result["family_count"] == 7
    assert result["sat_incidence_only_count"] == 7
    assert result["forced_sink_count"] == 0
    expected_digest = (
        "78d6ea82c294e8dd2943f1dec50e9bf51a6de88bbef91c34f649c2f28a115a3e"
    )
    assert result["witness_sha256"] == expected_digest


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = payload()
    if args.check:
        check_expected(result)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
