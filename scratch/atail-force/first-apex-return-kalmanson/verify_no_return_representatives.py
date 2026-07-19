#!/usr/bin/env python3
"""Independently replay eight exact first-apex nonreturn LRA witnesses.

The verifier does not import Z3 or the generating audit.  It checks exact
``Fraction`` values against the original abstract-distance constraints plus
one normalized strict ``S.oppApex1 = right`` direction in each reverse
outside pair.  It keeps the separate physical-shell checks centered at
``S.oppApex2 = o``.
"""

from __future__ import annotations

from fractions import Fraction
import itertools
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "cycle-three-rows-kalmanson"
ROW_SOURCES = (("q0", "q1"), ("q1", "q2"), ("q2", "q0"))
PHYSICAL_CLASS = {"left", "q0", "q1", "q2", "right"}
PHYSICAL_APEX = "o"
FIRST_APEX = "right"


def edge_key(a: str, b: str) -> str:
    assert a != b
    return "~".join(sorted((a, b)))


def role_targets(record: dict[str, object]) -> dict[str, str]:
    blocks = [*record["left_blocks"], *record["right_blocks"]]
    return {
        role: "t_" + "_".join(block)
        for block in blocks
        for role in block
    }


def row_excluded_points(
    order: tuple[str, ...], target: dict[str, str], row: int,
) -> tuple[str, ...]:
    in_row = {
        *ROW_SOURCES[row],
        target[f"x{row}"],
        target[f"y{row}"],
    }
    return tuple(
        point
        for point in order
        if point != f"c{row}" and point not in in_row
    )


def replay_case(
    record: dict[str, object], ledger_raw: dict[str, str], expected: str,
) -> dict[str, str]:
    order = tuple(record["cyclic_order"])
    target = role_targets(record)
    ledger = {key: Fraction(value) for key, value in ledger_raw.items()}
    expected_edges = {
        edge_key(a, b) for a, b in itertools.combinations(order, 2)
    }
    assert set(ledger) == expected_edges
    assert min(ledger.values()) >= 1

    triangle_slacks = []
    for a, b, c in itertools.combinations(order, 3):
        ab = ledger[edge_key(a, b)]
        ac = ledger[edge_key(a, c)]
        bc = ledger[edge_key(b, c)]
        triangle_slacks.extend((ac + bc - ab, ab + bc - ac, ab + ac - bc))
    assert min(triangle_slacks) >= 0

    physical_radius = ledger[edge_key(PHYSICAL_APEX, "left")]
    assert all(
        ledger[edge_key(PHYSICAL_APEX, point)] == physical_radius
        for point in ("q0", "q1", "q2", "right")
    )

    exclusion_gaps = []
    for point in order:
        if point == PHYSICAL_APEX or point in PHYSICAL_CLASS:
            continue
        exclusion_gaps.append(abs(
            ledger[edge_key(PHYSICAL_APEX, point)] - physical_radius
        ))

    for row, (source_a, source_b) in enumerate(ROW_SOURCES):
        center = f"c{row}"
        row_radius = ledger[edge_key(center, source_a)]
        assert ledger[edge_key(center, source_b)] == row_radius
        assert ledger[edge_key(center, target[f"x{row}"])] == row_radius
        assert ledger[edge_key(center, target[f"y{row}"])] == row_radius
        for point in row_excluded_points(order, target, row):
            exclusion_gaps.append(abs(ledger[edge_key(center, point)] - row_radius))
    assert min(exclusion_gaps) >= 1

    kalmanson_slacks = []
    for a, b, c, d in itertools.combinations(order, 4):
        diagonal_sum = ledger[edge_key(a, c)] + ledger[edge_key(b, d)]
        kalmanson_slacks.append(
            diagonal_sum
            - ledger[edge_key(b, c)]
            - ledger[edge_key(a, d)]
        )
        kalmanson_slacks.append(
            diagonal_sum
            - ledger[edge_key(a, b)]
            - ledger[edge_key(c, d)]
        )
    assert min(kalmanson_slacks) >= 1

    directions = []
    direction_gaps = []
    for row in range(3):
        dx = ledger[edge_key(FIRST_APEX, target[f"x{row}"])]
        dy = ledger[edge_key(FIRST_APEX, target[f"y{row}"])]
        assert dx != dy
        directions.append("x<y" if dx < dy else "y<x")
        direction_gaps.append(abs(dx - dy))
    signature = ",".join(directions)
    assert signature == expected
    assert min(direction_gaps) >= 1

    return {
        "case": str(record["case"]),
        "signature": signature,
        "minimum_distance": str(min(ledger.values())),
        "minimum_triangle_slack": str(min(triangle_slacks)),
        "minimum_named_exclusion_gap": str(min(exclusion_gaps)),
        "minimum_strict_kalmanson_slack": str(min(kalmanson_slacks)),
        "minimum_first_apex_direction_gap": str(min(direction_gaps)),
    }


def main() -> None:
    scan = json.loads((HERE / "stored_ledger_scan.json").read_text())
    results = json.loads((SOURCE / "results.json").read_text())
    ledgers = json.loads((SOURCE / "ledgers.json").read_text())["cases"]
    records = {record["case"]: record for record in results["cases"]}

    witnesses = []
    representatives = scan["all_unequal_representatives"]
    expected_signatures = {
        ",".join(bits)
        for bits in itertools.product(("x<y", "y<x"), repeat=3)
    }
    assert set(representatives) == expected_signatures
    for signature in sorted(representatives):
        case_key = representatives[signature]["case"]
        witnesses.append(replay_case(
            records[case_key], ledgers[case_key], signature,
        ))

    output = {
        "schema": "period3-oppApex1-nonreturn-exact-replay-v2",
        "epistemic_status": "EXACT_RATIONAL_QF_LRA_WITNESSES_NOT_EUCLIDEAN_NOT_LEAN",
        "apex_mapping": {
            "o": "S.oppApex2",
            "left": "surplusApex",
            "right": "S.oppApex1",
            "queried_first_apex": FIRST_APEX,
        },
        "witness_count": len(witnesses),
        "direction_cells_covered": len(expected_signatures),
        "witnesses": witnesses,
    }
    (HERE / "no_return_representatives.json").write_text(
        json.dumps(output, indent=2, sort_keys=True) + "\n"
    )
    print(
        "PASS: exact rational first-apex nonreturn witnesses "
        f"cover all {len(expected_signatures)} strict direction cells"
    )
    for witness in witnesses:
        print(
            f"{witness['signature']}: {witness['case']} "
            f"direction_gap>={witness['minimum_first_apex_direction_gap']} "
            f"Kalmanson_slack>={witness['minimum_strict_kalmanson_slack']}"
        )
    print("PASS: abstract distance ledgers only; no Euclidean realization claimed")


if __name__ == "__main__":
    main()
