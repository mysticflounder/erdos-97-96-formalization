# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.
# ruff: noqa: F821
"""Authenticate and theorem-mine the model-refinement SAT canary.

This identity-pinned adaptation independently replays the sealed assignment
against all 7,409,301 clauses and scans only this terminal model for existing
source-valid theorem-bank patterns and concrete new general-theorem candidates.
The selected four-set remains a shell witness, not a full circle class, so an
exact-off-circle diagnostic is never promoted without an ``ExactAt`` premise.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path

_THIS_FILE = Path(__file__).resolve()
_CANARY_TWO_KALMANSON_MINER = _THIS_FILE.with_name(
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
    "six_hit_bisector_canary_two_kalmanson_sat_canary.py"
)
_source = _CANARY_TWO_KALMANSON_MINER.read_text(encoding="utf-8")
_replacements = {
    "canary-two-Kalmanson SAT canary": "model-refinement SAT canary",
    "six_hit_bisector_canary_two_kalmanson_sat_portfolio": (
        "six_hit_bisector_canary_two_kalmanson_model_refinements_sat_portfolio"
    ),
    "exact17-six-hit-bisector-canary-two-kalmanson-mine-20260821": (
        "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-mine-20260821"
    ),
    "exact17-six-hit-bisector-canary-two-kalmanson-mine": (
        "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-mine"
    ),
    "six_hit_bisector_canary_two_kalmanson_sat_canary": (
        "six_hit_bisector_canary_two_kalmanson_model_refinements_sat_canary"
    ),
    "ab3779a004c2d325ee2fa5572215601f760c9d44": (
        "9e11a23a9506fc88ac61410756bc5d3c6f7c1206"
    ),
    "b60ece54f097cdebed542e3b390f8c91f0a244f3d938f5ccbf5e3f3eafd209a9": (
        "eab37800b0d633143eea071b532f275b7fe5e9578ce495d06383b1f9d72ebe05"
    ),
    "2026-08-21T20:20:00Z": "2026-08-21T22:13:15Z",
    '"four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-"\n'
    '        "kalmanson-next-center-02-physical-none-sat-profile-v1"': (
        '"four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-"\n'
        '        "kalmanson-model-refinements-next-center-02-physical-none-'
        'sat-profile-v1"'
    ),
    "05362559-d2df-474e-a1aa-5713e7a8dc93": ("8481882c-48a5-4041-bd49-c82610631e17"),
    "b6ecf959e9bae0285919302a6bfe5f9ee2c14d109f7d3552455afa36151ce8b9": (
        "6fcb5669e16926406d64c96d9bfc85818216ed271c74fca35aa66b83d9520fd4"
    ),
    "47a1a09c3658e33b765358899592f01dc49887f37328bd043df8dcd6037b0bbb": (
        "c2a563d1d08e471694d46df7ffc081aec2f8139376113c99504465482b985ce8"
    ),
    "95460eaac6509487a816a8da8155eb996aeb50e94f269842f8258d5406adb9ce": (
        "1e2e8ded93e9b8d2b06291d0d8c6bb44989e7c27f51725b42db2e30a203e1c24"
    ),
    "2489d631896c826dc73b453f0dddabb0c13153c7f3f2d9d80f2b258688c18eeb": (
        "68a3ccc1b5d5d08be70a2e0239155a82fadb148ce3978afb4ebacaa4df98b131"
    ),
    "efb70f81947dca866ec3348e38190ffc764041d450b3213726b97a9c776ec3ce": (
        "703dc1521acfa856612fc22fa6ed20c45ddc80a47ceed3a2bf277f2004651deb"
    ),
    "8f4cf0e0390e51221c5d6d4ab6a07f6af7a301584105267200cc254f926dedfe": (
        "3ccee71ba3b5218a8e2fab69ea6e3cbb913396ff846f7750326485b8f928d1fb"
    ),
    "d32096e8a3f7058e093fcd3e4acb66fe0457e4587e5fb898180e60f18d32a101": (
        "929fc775cacc963cb834441030917e3261e7c7f30409f98bab058a1c3e62b121"
    ),
    "51d86198f689411b34c36bd98753a3854299f0ed9c50bbe282e9a80953832a38": (
        "abcedb190e2a527103d86c7feb6440ba21ba64d60e3ad4c067802cf574df3b4a"
    ),
    "6185f13e5ebfbc0655f9ba9111e4831f4fb7b756f79100605c6e50a1d9c64502": (
        "a9c399a82cef684e75abba9b5acbca459566956cb7aa2923e7cb954d3f6c0911"
    ),
    "5d089a1114d3fdbf8e44005cdcb5ac9d45db2175e79bda1f7aca8364c3f2c620": (
        "a35d49a13ffe366ddce8622dd6275c7de51ee0e373f593954c1ad08593131735"
    ),
    "3a2fa81c86f11d3a47bb56c8433b961466fcf1666149829d9a037577089e140e": (
        "e5213a5868842f2ea0a6d8ab4c1236010c71c76279d97c40df979d5003796783"
    ),
    "29c3529a5c7ada44f28ae0167ad27fb7946b290dba4e0539d8642921665d98f9": (
        "bcf3004679934389b8df7e8499fea476027129a73b9d6403cdf448146c4da82c"
    ),
    "2277cc6c13f587df204f3af145d6dcf05505511d40e0c9bb8ab41ac3252b2c5c": (
        "c5554b1d3f6d832af0dd82d3ca1f988b970fa9699c949a4b2a5becb4cd446a49"
    ),
    "346_274_970": "346_275_390",
    "7_409_292": "7_409_301",
    "record_count: int = 29": "record_count: int = 23",
    "len(lines) == 29": "len(lines) == 23",
    "expected_record_count=29": "expected_record_count=23",
    '"journal_record_count": 29': '"journal_record_count": 23',
    'terminal.get("attempt_index") == 28': 'terminal.get("attempt_index") == 22',
    "six-hit-bisector-canary-two-kalmanson-sat-profile-": (
        "six-hit-bisector-canary-two-kalmanson-model-refinements-sat-profile-"
    ),
    "canary-two-kalmanson-source-valid-": (
        "canary-two-kalmanson-model-refinements-source-valid-"
    ),
    "p97-exact17-six-hit-bisector-canary-two-kalmanson-sat-canary-mine-analysis/v1": (
        "p97-exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-"
        "sat-canary-mine-analysis/v1"
    ),
    "original_canary_two_kalmanson_orbit_exact_multiplicities": (
        "original_canary_two_kalmanson_model_refinement_orbit_exact_multiplicities"
    ),
    "just_added_canary_two_kalmanson_retained_suffix_multiplicities": (
        "just_added_canary_two_kalmanson_model_refinement_retained_suffix_"
        "multiplicities"
    ),
    "just_added_canary_two_kalmanson_production_regression": (
        "just_added_canary_two_kalmanson_model_refinement_production_regression"
    ),
    "32-clause theorem orbit / 21-clause production suffix drifted": (
        "16-clause theorem orbit / 9-clause production suffix drifted"
    ),
    "21-clause production suffix is not present exactly once": (
        "9-clause production suffix is not present exactly once"
    ),
}
for _old, _new in _replacements.items():
    if _old not in _source:
        raise RuntimeError(f"canary-two-Kalmanson adaptation marker missing: {_old}")
    _source = _source.replace(_old, _new)
_source = _source.split('\nif __name__ == "__main__":', 1)[0]
exec(  # noqa: S102 -- repository-pinned authenticated miner, identity adapted above
    compile(_source, str(_CANARY_TWO_KALMANSON_MINER), "exec"), globals()
)

_HERE = _THIS_FILE
_PREDECESSOR = _CANARY_TWO_KALMANSON_MINER
for _name in (
    "CELL_COUNT",
    "DescriptorCustody",
    "PORTFOLIO_SCHEMA",
    "PRODUCER_SCHEMA",
    "PreparationError",
    "Snapshot",
    "WAVE_SCHEMA",
):
    setattr(prep, _name, getattr(prep.preparation, _name))

SOURCE_CNF = ROOT / (
    "scratch/runs/exact17-six-hit-bisector-canary-two-kalmanson-model-"
    "refinements-preparer-20260821/physical-slice-cell-campaign-v1/artifacts/"
    "cells/four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-"
    "two-kalmanson-model-refinements-next-center-02-physical-none/four-row-"
    "bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-"
    "model-refinements-next-center-02-physical-none.cnf"
)
CNF_CLAUSES = 7_409_301

CANARY_OCCURRENCE_SUPPORTS = (
    frozenset({(4, 12), (4, 14), (5, 7), (5, 9), (7, 9), (7, 14), (9, 7), (9, 12)}),
    frozenset({(5, 7), (5, 9), (7, 9), (7, 14), (9, 7), (9, 15), (12, 14), (12, 15)}),
    frozenset({(8, 3), (8, 10), (10, 3), (10, 8), (13, 2), (13, 10), (15, 2), (15, 8)}),
    frozenset(
        {
            (4, 5),
            (4, 12),
            (6, 4),
            (6, 8),
            (8, 6),
            (8, 10),
            (10, 8),
            (10, 12),
            (11, 5),
            (11, 6),
            (13, 4),
            (13, 10),
        }
    ),
)
_SOURCE_PREPARER_PATH = ROOT / (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
    "two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_"
    "physical_slice_cells.py"
)
_SOURCE_PREPARER_SPEC = importlib.util.spec_from_file_location(
    "_exact17_canary_two_kalmanson_model_refinements_source_preparer",
    _SOURCE_PREPARER_PATH,
)
if _SOURCE_PREPARER_SPEC is None or _SOURCE_PREPARER_SPEC.loader is None:
    raise RuntimeError("cannot load model-refinement source preparer")
_source_preparer = importlib.util.module_from_spec(_SOURCE_PREPARER_SPEC)
sys.modules[_SOURCE_PREPARER_SPEC.name] = _source_preparer
_SOURCE_PREPARER_SPEC.loader.exec_module(_source_preparer)
ORIGINAL_BANK_ORBIT_CLAUSES = tuple(
    tuple(sorted(clause))
    for clause in _source_preparer.ORIGINAL_CANARY_TWO_KALMANSON_ORBIT
)
RETAINED_SUFFIX_INDICES = tuple(_source_preparer.RETAINED_ORIGINAL_SUFFIX_INDICES)
PARENT_SUBSUMED_SUFFIX_INDICES = tuple(
    _source_preparer.PARENT_SUBSUMED_ORIGINAL_SUFFIX_INDICES
)
RETAINED_SUFFIX_INDEX_SET = frozenset(RETAINED_SUFFIX_INDICES)
PARENT_SUBSUMED_SUFFIX_INDEX_SET = frozenset(PARENT_SUBSUMED_SUFFIX_INDICES)
ORIGINAL_BANK_CLAUSE_SETS = frozenset(
    frozenset(clause) for clause in ORIGINAL_BANK_ORBIT_CLAUSES
)
JUST_ADDED_ORBIT_CLAUSES = tuple(
    ORIGINAL_BANK_ORBIT_CLAUSES[index] for index in RETAINED_SUFFIX_INDICES
)
JUST_ADDED_CLAUSE_SETS = frozenset(
    frozenset(clause) for clause in JUST_ADDED_ORBIT_CLAUSES
)
JUST_ADDED_SUPPORT = frozenset().union(*CANARY_OCCURRENCE_SUPPORTS)


def validate_checkpoint(value: dict[str, Any], *, root: Path = ROOT) -> None:
    """Validate the self-owning lane checkpoint used by staged hygiene."""

    _require(frozenset(value) == CHECKPOINT_KEYS, "lane checkpoint keys drifted")
    _require(
        value.get("schema") == "worktree-lane-checkpoint/v1",
        "lane checkpoint schema drifted",
    )
    _require(value.get("lane_id") == LANE_ID, "lane checkpoint lane drifted")
    _require(
        value.get("owner")
        == "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-mine",
        "lane checkpoint owner drifted",
    )
    _require(value.get("base_head") == BASE_HEAD, "lane checkpoint base_head drifted")
    expected_owned = [
        (
            ".codex/worktree-checkpoints/"
            "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-"
            "mine-20260821.json"
        ),
        (
            "scripts/mine_exact17_sparse_six_four_row_bisector_eight_hit_two_"
            "kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_"
            "sat_canary.py"
        ),
        (
            "scripts/test_mine_exact17_sparse_six_four_row_bisector_eight_hit_"
            "two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_"
            "refinements_sat_canary.py"
        ),
    ]
    _require(value.get("owned_paths") == expected_owned, "owned paths drifted")
    _require(value.get("durable_paths") == [], "durable paths drifted")
    _require(
        value.get("generated_roots") == [f"scratch/runs/{LANE_ID}/{RUN_ID}"],
        "lane checkpoint generated root drifted",
    )
    _require(
        value.get("created_utc") == "2026-08-21T22:13:15Z",
        "lane checkpoint creation time drifted",
    )
    unsigned = dict(value)
    _require(
        unsigned.pop("manifest_sha256", None)
        == sha256_bytes(canonical_json_bytes(unsigned)),
        "lane checkpoint self-hash invalid",
    )
    _require(
        _relative(root, CHECKPOINT) == f".codex/worktree-checkpoints/{LANE_ID}.json",
        "lane checkpoint path drifted",
    )


_parent_core_predicate = _core_predicate


def _core_predicate(record: dict[str, Any]) -> Callable[[list[Any]], bool]:
    """Replay newly observed existing-bank equality stages exactly."""

    stage = record["stage"]
    core = record["core"]

    def predicate(rows: list[Any]) -> bool:
        roots = _edge_roots(rows)

        def eq(center: int, left: int, right: int) -> bool:
            return roots[center][left] == roots[center][right]

        if stage == "equality-duplicate-center":
            first, second = core["centers"]
            left, middle, right = core["triple"]
            return (
                eq(first, left, middle)
                and eq(first, left, right)
                and eq(second, left, middle)
                and eq(second, left, right)
            )
        if stage == "equality-perpendicular-bisector-convex":
            first, second = core["foci"]
            return all(eq(point, first, second) for point in core["points"])
        raise MineError(f"not a model-refinement predicate stage: {stage}")

    if stage in {
        "equality-duplicate-center",
        "equality-perpendicular-bisector-convex",
    }:
        return predicate
    return _parent_core_predicate(record)


if __name__ == "__main__":
    raise SystemExit(main())
