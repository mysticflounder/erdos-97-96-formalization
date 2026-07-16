#!/usr/bin/env python3
"""Independent smoke check for the finite history/global-incidence model.

The checked object is intentionally only a finite support/equality shadow.  A
separate exact algebra checkpoint already rejects its Euclidean realization.
"""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

from census.global_confinement.metric_realizability_probe import (
    MetricRow,
    _formalized_metric_core,
)

import model_search


ROOT = Path(__file__).resolve().parents[3]
SOURCE = ROOT / (
    "scratch/atail-force/second_center_query/"
    "formalized_core_shards_after_seven_point_six_circle_checkpoint.json"
)
ORACLE = ROOT / (
    "scratch/atail-force/second_center_query/"
    "formalized_core_shards_after_seven_point_six_circle_oracle_checkpoint.json"
)
SOURCE_SHA256 = "199236b660b11bbc80e673de47d035ecd5ce8b7cd112aa8e0929a4f0c7516787"
ORDER = (0, 9, 10, 11, 1, 3, 4, 5, 2, 6, 7, 8)
PAIR = frozenset((6, 7))
FIRST_APEX = 1
SECOND_APEX = 2
SURPLUS = frozenset((1, 2, 3, 4, 5))


def load_shard_zero() -> tuple[tuple[frozenset[int], ...], dict[str, object]]:
    raw = SOURCE.read_bytes()
    digest = hashlib.sha256(raw).hexdigest()
    assert digest == SOURCE_SHA256, (digest, SOURCE_SHA256)
    payload = json.loads(raw)
    case = next(
        case for case in payload["cases"]
        if int(case["partition"]["shard_index"]) == 0
    )
    survivor = case["survivor"]
    rows = tuple(
        frozenset(int(x) for x in row["support"])
        for row in survivor["distinct_metric_rows"]
    )
    assert rows == model_search.ROWS
    assert tuple(survivor["frame"]["cyclic_order"]) == ORDER
    assert tuple(survivor["profile"]) == (5, 5, 5)
    return rows, survivor


def check_finite_surface(rows: tuple[frozenset[int], ...]) -> None:
    audit = model_search.audit()
    assert audit == {
        "row_cards": [4] * 12,
        "rows_omit_centers": True,
        "max_row_intersection": 2,
        "blocker_nonfixed": True,
        "source_in_blocker_row": True,
        "history_pair_in_apex_row": True,
        "second_center_with_history_pair": None,
        "history_pair_common_blocker": False,
        "history_pair_mutual_cross": False,
        "duplicate_center_core": None,
        "exact_off_circle_core": None,
        "equal_k4_core": None,
        "equilateral_bisector_core": None,
        "three_triad_core": None,
        "bad_shared_pair": None,
    }
    assert PAIR <= rows[FIRST_APEX]
    assert PAIR.isdisjoint(SURPLUS)
    assert PAIR.isdisjoint(rows[SECOND_APEX])
    assert model_search.BLOCKER[6] == 7
    assert model_search.BLOCKER[7] == 6
    assert 6 in rows[7] and 7 in rows[6]
    assert 7 not in rows[7] and 6 not in rows[6]


def check_current_core_matcher(
    rows: tuple[frozenset[int], ...], survivor: dict[str, object]
) -> None:
    metric_rows = tuple(
        MetricRow(center, tuple(sorted(support)), True)
        for center, support in enumerate(rows)
    )
    assert _formalized_metric_core(metric_rows, 12, ORDER) is None

    # The closest banked U1 obstruction on this shard misses h4 only under
    # (a,c,d,e,f) = (9,7,6,8,11).  Its needed pair {7,11} is not the history
    # pair {6,7}; the desired prescribed blocker is source 11 -> center 6.
    uf = model_search.equality_classes(rows)
    a, c, d, e, f = (9, 7, 6, 8, 11)
    fields = (
        model_search.eq(uf, c, a, c, d),
        model_search.eq(uf, c, a, c, f),
        model_search.eq(uf, d, c, d, e),
        model_search.eq(uf, d, c, d, f),
        model_search.eq(uf, f, a, f, d),
        model_search.eq(uf, f, a, f, e),
        model_search.eq(uf, e, a, e, c),
    )
    assert tuple(i + 1 for i, present in enumerate(fields) if not present) == (4,)
    assert frozenset((c, f)) != PAIR
    assert model_search.BLOCKER[f] != d
    assert f not in rows[d]
    assert survivor["witness_sha256"] == (
        "42437144cb195319405bd27c7cf201f799491123e0333abdb4010ed850bf4160"
    )


def check_oracle_boundary() -> None:
    payload = json.loads(ORACLE.read_text())
    case = next(case for case in payload["cases"] if case["shard_index"] == 0)
    oracle = case["metric_oracle"]
    assert oracle["reported_status"] == (
        "NO_NORMALIZED_COMPLEX_OR_REAL_EQUALITY_REALIZATION"
    )
    assert oracle["full_equality_ideal"]["status"] == "CROSSCHECKED_UNIT"


def main() -> int:
    rows, survivor = load_shard_zero()
    check_finite_surface(rows)
    check_current_core_matcher(rows, survivor)
    check_oracle_boundary()
    print("PASS: pinned shard-0 source and exact row payload")
    print("PASS: independent finite incidence/history/blocker checks")
    print("PASS: current formalized equality/order core matcher returns no core")
    print("PASS: oracle boundary remains explicitly non-Euclidean")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
