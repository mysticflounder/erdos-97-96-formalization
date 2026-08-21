# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under the Apache License 2.0.
# ruff: noqa: F821
"""Authenticate and theorem-mine the exact-17 SixHitBisector SAT canary.

This is an identity-pinned adaptation of the authenticated EightHit canary
miner.  It independently replays the sealed assignment against all 7,409,271
clauses and scans only this terminal model for source-valid bank occurrences.
"""

from __future__ import annotations

from pathlib import Path

_THIS_FILE = Path(__file__).resolve()
_EIGHT_HIT_MINER = _THIS_FILE.with_name(
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary.py"
)
_source = _EIGHT_HIT_MINER.read_text(encoding="utf-8")
_replacements = {
    "finalized exact-17 eight-hit canary": "exact-17 SixHitBisector canary",
    "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio": (
        "run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_sat_portfolio"
    ),
    "exact17-eight-hit-v5-canary-mine-20260821": (
        "exact17-six-hit-bisector-canary-mine-20260821"
    ),
    "exact17-eight-hit-v5-canary-mine": "exact17-six-hit-bisector-canary-mine",
    "test_mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary": (
        "test_mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_sat_canary"
    ),
    "mine_exact17_sparse_six_four_row_bisector_eight_hit_sat_canary": (
        "mine_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_"
        "six_hit_bisector_sat_canary"
    ),
    "8b902b9281e5e4658c339261f6c6fb0407c763d1": (
        "07f56c8fb9763173e5740be75479fa11958e82cf"
    ),
    "100b8b98279b3e1f3ee32139a5d12c85f283c568d2d36ebe67ee247aedeb6776": (
        "6c56d5e112e24120b7a8d4a4115ddbf6dabe0643d5736f1b21a04bad10783e68"
    ),
    "2026-08-21T16:22:44Z": "2026-08-21T19:00:00Z",
    "four-row-bisector-eight-hit-two-kalmanson-next-center-02-physical-none-sat-profile-v1": (
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-next-center-"
        "02-physical-none-sat-profile-v1"
    ),
    "07e9d5ed-5856-4b17-8990-cd53fd360634": ("d757efae-3b3b-4507-99dc-937b7f84d4c2"),
    "c28a8b077eb4750be1f54606cc2345098a8af0aafd414ea404ae06f842c920d5": (
        "ce4be279f8eb07d941631e015f3dd629567270dee108e79757bed4a43b79ff3a"
    ),
    "49213232c5fafd9482eb3fe0f808896e95e529c32b96685f2e45f70d443bbb2a": (
        "37a57fbc600ec68a77b1477790fa6846289c226db6d36f2416b1d4e316154a1f"
    ),
    "e9db1cc43d9cd2fdb97ac41bb11aac9e9da168440989a4aa19a8855abe52a7a9": (
        "2b0d7508d01d85e033e56474e3d387291a38ccc99379eab551e11832d74f523c"
    ),
    "1d4480ffc7e61c1d513823433b87b878165c2fc7c0844ce7021cb9abf6d8ab7a": (
        "bb83f25f3654169a36a2f6cdeeaf43587320e08c6f445b255b47ae85307bb21c"
    ),
    "2533432a7f5aed1551219794f0859060e5c5de3fccf8d27b385594975a51c690": (
        "466bb5e9b79ee7ef4ea03b324955dde3607cb0bf5d0a4db076fd66d6404b903d"
    ),
    "feb3a166609daf2f8284c142cea82146a619e279eb72420f571f8f3cf5b21898": (
        "7a3beac09b743bfd52bdc1bca0dba2ade0205ff717e6a8384e0acd22ae744b59"
    ),
    "547c9b915f94fee2b251f299237e2080dc5371e3df8efd5c751524cb59559e22": (
        "e3c8144095dc7da6bc0edd0e223fe103e7c64bf9d039278a730101e12764df5b"
    ),
    "32af4f58df3e30339e023f1664a8a77a8bddf06cf7e87bc6ec310a8ac53a89a0": (
        "149122371306f3dfe9230b1f9a96e10f884ca521e4c4c1fd5b84a1be005a60ea"
    ),
    "574599f5ee2c9928071cb8dfa1c598bfa4753c0ec08e297fc3a744c28bd79b30": (
        "f6c684f54b096619c251ff8ebd9f81a03c37feb6dc241e6abc60ce476100bdcd"
    ),
    "3f338d084fd071fc2acb7ca3a3cd095ae4f9539c372c3884628c024773224cdb": (
        "83975a09d3a93c5b5889f63b3ed9f8f0425ccc67df72117dfdf5e35f98888db3"
    ),
    "348492f5d202f86af9641a8fd423b4e2bfbb05633c35575f9817525f80a80d7e": (
        "0454caf6cc4330843766d410b66378d3adf83e9af483ad7b3211322bd2b7a4ac"
    ),
    "57c1387dcd53ff2f204f5b559844964e8c0e6624c3afcdb3c31290728c5cc265": (
        "9a81a88b4d5693dfd3c25e5ee3d8ce84f4a22ec859255c7b3432e08cb575fdad"
    ),
    "fa72463f474bd3f9b965c97addc4b84b6d7d7f57029e6c8e0ce75145b13e86d1": (
        "43eae02079af4c80935e98dc4c915dcfe19c4fbda58ce17357f69a335657630a"
    ),
    "346_273_811": "346_273_951",
    "record_count: int = 15": "record_count: int = 10",
    "len(lines) == 15": "len(lines) == 10",
    "expected_record_count=15": "expected_record_count=10",
    '"journal_record_count": 15': '"journal_record_count": 10',
    'terminal.get("attempt_index") == 14': 'terminal.get("attempt_index") == 9',
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-sat-profile-": (
        "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
        "six-hit-bisector-sat-profile-"
    ),
    "p97-exact17-eight-hit-source-valid-candidate-ledger/v1": (
        "p97-exact17-six-hit-bisector-source-valid-candidate-ledger/v1"
    ),
    "p97-exact17-eight-hit-sat-canary-mine-analysis/v1": (
        "p97-exact17-six-hit-bisector-sat-canary-mine-analysis/v1"
    ),
    "just_added_eight_hit_orbit_multiplicities": (
        "just_added_six_hit_bisector_orbit_multiplicities"
    ),
    "just_added_eight_hit_regression": "just_added_six_hit_bisector_regression",
    "eight-hit orbit is not present exactly once": (
        "six-hit-bisector orbit is not present exactly once"
    ),
    "eight-hit SAT canary mine rejected": "six-hit-bisector SAT canary mine rejected",
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
# The PIQD runner intentionally nests the hardened portfolio preparation
# module.  Expose the read-only custody vocabulary expected by the inherited
# miner without altering either producer.
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
    "scratch/runs/exact17-six-hit-bisector-preparer-20260821/"
    "physical-slice-cell-campaign-v2/artifacts/cells/"
    "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-next-center-02-"
    "physical-none/four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-"
    "next-center-02-physical-none.cnf"
)
CNF_CLAUSES = 7_409_271

# Positional support from `sixHitBisectorBaseHits`; orbit closure gives exactly
# the four Lean-owned suffix clauses.
JUST_ADDED_SUPPORT = frozenset({(5, 14), (5, 15), (14, 4), (14, 15), (15, 14), (15, 4)})
JUST_ADDED_ORBIT_CLAUSES = frozenset(
    tuple(sorted(clause)) for clause in occurrence_orbit_clauses(JUST_ADDED_SUPPORT)
)
JUST_ADDED_CLAUSE_SETS = frozenset(
    frozenset(clause) for clause in JUST_ADDED_ORBIT_CLAUSES
)


if __name__ == "__main__":
    raise SystemExit(main())
