# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.
# ruff: noqa: F821
"""Authenticate and theorem-mine the canary-two-Kalmanson SAT canary.

This is an identity-pinned adaptation of the authenticated EightHit canary
miner.  It independently replays the sealed assignment against all 7,409,292
clauses and scans only this terminal model for source-valid bank occurrences.
The regression keeps the original 32 theorem clauses distinct from the 21
parent-unsubsumed clauses retained in the production successor.
"""

from __future__ import annotations

import importlib.util
from pathlib import Path

_THIS_FILE = Path(__file__).resolve()
_EIGHT_HIT_MINER = _THIS_FILE.with_name(
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py"
)
_source = _EIGHT_HIT_MINER.read_text(encoding="utf-8")
_replacements = {
    "finalized exact-17 eight-hit canary": "canary-two-Kalmanson SAT canary",
    "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio": (
        "run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_canary_two_kalmanson_sat_portfolio"
    ),
    "exact17-eight-hit-v5-canary-mine-20260821": (
        "exact17-six-hit-bisector-canary-two-kalmanson-mine-20260821"
    ),
    "exact17-eight-hit-v5-canary-mine": (
        "exact17-six-hit-bisector-canary-two-kalmanson-mine"
    ),
    "test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary": (
        "test_mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_canary_two_kalmanson_sat_canary"
    ),
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary": (
        "mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_canary_two_kalmanson_sat_canary"
    ),
    "8b902b9281e5e4658c339261f6c6fb0407c763d1": (
        "ab3779a004c2d325ee2fa5572215601f760c9d44"
    ),
    "100b8b98279b3e1f3ee32139a5d12c85f283c568d2d36ebe67ee247aedeb6776": (
        "b60ece54f097cdebed542e3b390f8c91f0a244f3d938f5ccbf5e3f3eafd209a9"
    ),
    "2026-08-21T16:22:44Z": "2026-08-21T20:20:00Z",
    "four-row-bisector-eight-hit-two-kalmanson-next-center-02-physical-none-sat-profile-v1": (
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-"
        "kalmanson-next-center-02-physical-none-sat-profile-v1"
    ),
    "07e9d5ed-5856-4b17-8990-cd53fd360634": ("05362559-d2df-474e-a1aa-5713e7a8dc93"),
    "c28a8b077eb4750be1f54606cc2345098a8af0aafd414ea404ae06f842c920d5": (
        "b6ecf959e9bae0285919302a6bfe5f9ee2c14d109f7d3552455afa36151ce8b9"
    ),
    "49213232c5fafd9482eb3fe0f808896e95e529c32b96685f2e45f70d443bbb2a": (
        "47a1a09c3658e33b765358899592f01dc49887f37328bd043df8dcd6037b0bbb"
    ),
    "e9db1cc43d9cd2fdb97ac41bb11aac9e9da168440989a4aa19a8855abe52a7a9": (
        "95460eaac6509487a816a8da8155eb996aeb50e94f269842f8258d5406adb9ce"
    ),
    "1d4480ffc7e61c1d513823433b87b878165c2fc7c0844ce7021cb9abf6d8ab7a": (
        "2489d631896c826dc73b453f0dddabb0c13153c7f3f2d9d80f2b258688c18eeb"
    ),
    "2533432a7f5aed1551219794f0859060e5c5de3fccf8d27b385594975a51c690": (
        "efb70f81947dca866ec3348e38190ffc764041d450b3213726b97a9c776ec3ce"
    ),
    "feb3a166609daf2f8284c142cea82146a619e279eb72420f571f8f3cf5b21898": (
        "8f4cf0e0390e51221c5d6d4ab6a07f6af7a301584105267200cc254f926dedfe"
    ),
    "547c9b915f94fee2b251f299237e2080dc5371e3df8efd5c751524cb59559e22": (
        "d32096e8a3f7058e093fcd3e4acb66fe0457e4587e5fb898180e60f18d32a101"
    ),
    "32af4f58df3e30339e023f1664a8a77a8bddf06cf7e87bc6ec310a8ac53a89a0": (
        "51d86198f689411b34c36bd98753a3854299f0ed9c50bbe282e9a80953832a38"
    ),
    "574599f5ee2c9928071cb8dfa1c598bfa4753c0ec08e297fc3a744c28bd79b30": (
        "6185f13e5ebfbc0655f9ba9111e4831f4fb7b756f79100605c6e50a1d9c64502"
    ),
    "3f338d084fd071fc2acb7ca3a3cd095ae4f9539c372c3884628c024773224cdb": (
        "5d089a1114d3fdbf8e44005cdcb5ac9d45db2175e79bda1f7aca8364c3f2c620"
    ),
    "348492f5d202f86af9641a8fd423b4e2bfbb05633c35575f9817525f80a80d7e": (
        "3a2fa81c86f11d3a47bb56c8433b961466fcf1666149829d9a037577089e140e"
    ),
    "57c1387dcd53ff2f204f5b559844964e8c0e6624c3afcdb3c31290728c5cc265": (
        "29c3529a5c7ada44f28ae0167ad27fb7946b290dba4e0539d8642921665d98f9"
    ),
    "fa72463f474bd3f9b965c97addc4b84b6d7d7f57029e6c8e0ce75145b13e86d1": (
        "2277cc6c13f587df204f3af145d6dcf05505511d40e0c9bb8ab41ac3252b2c5c"
    ),
    "346_273_811": "346_274_970",
    "record_count: int = 15": "record_count: int = 29",
    "len(lines) == 15": "len(lines) == 29",
    "expected_record_count=15": "expected_record_count=29",
    '"journal_record_count": 15': '"journal_record_count": 29',
    'terminal.get("attempt_index") == 14': 'terminal.get("attempt_index") == 28',
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-sat-profile-": (
        "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
        "six-hit-bisector-canary-two-kalmanson-sat-profile-"
    ),
    "p97-exact17-eight-hit-source-valid-candidate-ledger/v1": (
        "p97-exact17-six-hit-bisector-canary-two-kalmanson-source-valid-"
        "candidate-ledger/v1"
    ),
    "p97-exact17-eight-hit-sat-canary-mine-analysis/v1": (
        "p97-exact17-six-hit-bisector-canary-two-kalmanson-sat-canary-mine-analysis/v1"
    ),
    "target_list = tuple(targets)": (
        "target_list = tuple(targets) + tuple(ORIGINAL_BANK_CLAUSE_SETS)"
    ),
    "exact_targets = frozenset(targets) | JUST_ADDED_CLAUSE_SETS": (
        "exact_targets = (frozenset(targets) | JUST_ADDED_CLAUSE_SETS | "
        "ORIGINAL_BANK_CLAUSE_SETS)"
    ),
    "    just_added = [exact_counts[clause] for clause in JUST_ADDED_CLAUSE_SETS]\n"
    '    _require(just_added == [1, 1, 1, 1], "eight-hit orbit is not present exactly once")': (
        "    original_bank = [\n"
        "        exact_counts[frozenset(clause)]\n"
        "        for clause in ORIGINAL_BANK_ORBIT_CLAUSES\n"
        "    ]\n"
        "    expected_original = [\n"
        "        1 if index in RETAINED_SUFFIX_INDEX_SET else 0\n"
        "        for index in range(len(ORIGINAL_BANK_ORBIT_CLAUSES))\n"
        "    ]\n"
        "    _require(\n"
        "        original_bank == expected_original,\n"
        '        "32-clause theorem orbit / 21-clause production suffix drifted",\n'
        "    )\n"
        "    omitted_strictly_subsumed = [\n"
        "        index\n"
        "        for index, clause in enumerate(ORIGINAL_BANK_ORBIT_CLAUSES)\n"
        "        if frozenset(clause) in strict_subsumers\n"
        "        and index in PARENT_SUBSUMED_SUFFIX_INDEX_SET\n"
        "    ]\n"
        "    _require(\n"
        "        omitted_strictly_subsumed == list(PARENT_SUBSUMED_SUFFIX_INDICES),\n"
        '        "omitted theorem clauses lack strict current-CNF subsumers",\n'
        "    )\n"
        "    just_added = [exact_counts[clause] for clause in JUST_ADDED_CLAUSE_SETS]\n"
        "    _require(\n"
        "        just_added == [1] * len(JUST_ADDED_CLAUSE_SETS),\n"
        '        "21-clause production suffix is not present exactly once",\n'
        "    )"
    ),
    '        "just_added_eight_hit_orbit_multiplicities": just_added,': (
        '        "original_canary_two_kalmanson_orbit_exact_multiplicities": '
        "original_bank,\n"
        '        "parent_subsumed_original_suffix_indices": '
        "omitted_strictly_subsumed,\n"
        '        "just_added_canary_two_kalmanson_retained_suffix_multiplicities": '
        "just_added,"
    ),
    '"just_added_eight_hit_regression"': (
        '"just_added_canary_two_kalmanson_production_regression"'
    ),
    '"support": [list(hit) for hit in sorted(JUST_ADDED_SUPPORT)],': (
        '"occurrence_supports": [\n'
        "                [list(hit) for hit in sorted(support)]\n"
        "                for support in CANARY_OCCURRENCE_SUPPORTS\n"
        "            ],\n"
        '            "full_theorem_orbit_clause_count": '
        "len(ORIGINAL_BANK_ORBIT_CLAUSES),\n"
        '            "retained_production_clause_count": '
        "len(JUST_ADDED_ORBIT_CLAUSES),"
    ),
    'replay["just_added_eight_hit_orbit_multiplicities"]': (
        'replay["just_added_canary_two_kalmanson_retained_suffix_multiplicities"]'
    ),
    "eight-hit SAT canary mine rejected": (
        "canary-two-Kalmanson SAT canary mine rejected"
    ),
}
for _old, _new in _replacements.items():
    if _old not in _source:
        raise RuntimeError(f"EightHit adaptation marker missing: {_old}")
    _source = _source.replace(_old, _new)
_source = _source.split('\nif __name__ == "__main__":', 1)[0]
exec(  # noqa: S102 -- repository-pinned authenticated miner, identity adapted above
    compile(_source, str(_EIGHT_HIT_MINER), "exec"), globals()
)

# Restore immediate adaptation provenance after the inherited source initializes
# its own predecessor pointers.
_HERE = _THIS_FILE
_PREDECESSOR = _EIGHT_HIT_MINER
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
    "scratch/runs/exact17-six-hit-bisector-canary-two-kalmanson-preparer-"
    "20260821/physical-slice-cell-campaign-v1/artifacts/cells/"
    "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-"
    "kalmanson-next-center-02-physical-none/four-row-bisector-eight-hit-two-"
    "kalmanson-six-hit-bisector-canary-two-kalmanson-next-center-02-physical-"
    "none.cnf"
)
CNF_CLAUSES = 7_409_292

CANARY_OCCURRENCE_SUPPORTS = (
    frozenset({(0, 4), (0, 6), (1, 4), (1, 14), (4, 2), (4, 14), (14, 2), (14, 6)}),
    frozenset({(2, 1), (2, 10), (5, 1), (5, 7), (7, 10), (7, 16), (10, 7), (10, 16)}),
    frozenset({(2, 5), (2, 10), (7, 10), (7, 16), (10, 7), (10, 16), (11, 5), (11, 7)}),
    frozenset(
        {(5, 7), (5, 11), (7, 10), (7, 16), (10, 7), (10, 16), (12, 10), (12, 11)}
    ),
    frozenset({(5, 7), (5, 11), (8, 3), (8, 11), (9, 3), (9, 5), (11, 5), (11, 7)}),
    frozenset(
        {
            (4, 13),
            (4, 14),
            (7, 10),
            (7, 13),
            (10, 7),
            (10, 14),
            (11, 2),
            (11, 7),
            (14, 2),
            (14, 10),
        }
    ),
    frozenset(
        {
            (5, 7),
            (5, 11),
            (7, 3),
            (7, 10),
            (9, 3),
            (9, 5),
            (11, 5),
            (11, 7),
            (12, 10),
            (12, 11),
        }
    ),
    frozenset(
        {
            (5, 7),
            (5, 11),
            (7, 3),
            (7, 10),
            (8, 11),
            (8, 14),
            (9, 3),
            (9, 5),
            (10, 7),
            (10, 14),
            (11, 2),
            (11, 5),
            (14, 2),
            (14, 10),
        }
    ),
)
_SOURCE_PREPARER_PATH = ROOT / (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
    "two_kalmanson_six_hit_bisector_canary_two_kalmanson_"
    "physical_slice_cells.py"
)
_SOURCE_PREPARER_SPEC = importlib.util.spec_from_file_location(
    "_exact17_canary_two_kalmanson_source_preparer", _SOURCE_PREPARER_PATH
)
if _SOURCE_PREPARER_SPEC is None or _SOURCE_PREPARER_SPEC.loader is None:
    raise RuntimeError("cannot load canary-two-Kalmanson source preparer")
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


if __name__ == "__main__":
    raise SystemExit(main())
