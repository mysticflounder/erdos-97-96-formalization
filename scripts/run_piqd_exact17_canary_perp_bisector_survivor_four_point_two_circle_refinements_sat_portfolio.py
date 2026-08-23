# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor FourPoint-two-circle-refinement physical cells.

The production byte identities remain provisional until an authenticated source
campaign is frozen.  The runner admits exactly the 308-variable,
7,409,522-clause cells derived from the 7,409,516-clause root.  It launches
``center=2 / physical=none`` alone, requires an
immutable independent replay/mining acceptance receipt, then schedules the
remaining 75 cells with at most twelve one-core jobs active at once.  Recovery
never submits a second job for a cell already bound to a journal job id.
"""

from __future__ import annotations

import argparse
import fcntl
import json
import os
import stat
import subprocess
import sys
import time
from collections.abc import Mapping, Sequence
from concurrent.futures import FIRST_COMPLETED, Future, ThreadPoolExecutor, wait
from contextlib import contextmanager
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

import run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio as _legacy

from census.p97_search import phase3_piqd_driver as _driver
from census.p97_search.phase3_cegar_wave import (
    CERTIFIED_UNSAT,
    CHECKPOINT,
    STRUCTURAL_SAT,
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
)
from census.p97_search.phase3_piqd_driver import (
    DriverPolicy,
    PiqdCegarDriver,
    PiqdDriverError,
)
from census.p97_search.phase3_piqd_oracle import (
    PiqdOracleError,
    PiqdRawDimacsClient,
    PreparedJob,
    scan_dimacs,
)
from census.p97_search.phase3_piqd_replay import (
    LeanLratReplayer,
    LratReplayError,
    LratReplayResult,
    validate_replay_result,
)

LANE_ID = "exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-portfolio-v4-20260822"
RUN_ID = "sat-profile-portfolio-v4"
RUN_OWNER = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-portfolio-v4"
)
BASE_HEAD = "4c633afe37ed565eaf235ffefa3c889c8a498e9a"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-fourpoint-physical-sat-runner-code-v4-20260822.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-fourpoint-physical-sat-portfolio-v4-20260822.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "refinements_physical_slice_cells.py"
)
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = (
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "preparation-config.json"
)
RUNNER_RELATIVE = "scripts/run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_portfolio.py"
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_refinements_sat_portfolio.py"
)
MINER_RELATIVE = "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_refinements_sat_canary.py"
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "preparer-20260822/preparation-v1"
)
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# Immutable production pins from the independently authenticated 76-cell source
# campaign and its SAT-profile transformation.
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = "8aa401ec59f03608069692847387970874493b494133ec98b1b9a796f85a66a3"
SOURCE_CAMPAIGN_BYTES = 118663
SOURCE_RUN_MANIFEST_SHA256 = "fd5e7152ae81743010881385ab7f4ac6f412ef7b66574e0dc7a14caeca8470ae"
SOURCE_RUN_MANIFEST_BYTES = 2518
SOURCE_PREPARER_COMMIT = "75f76a42721b9d2e9721174207469ade43907f3d"
SOURCE_PREPARER_SHA256 = "0929cbd325809b0402e06fb00f61f88695a7570cdc84bd107c68eb21a0745659"
SOURCE_PREPARER_BYTES = 120742
CHECKPOINT_SHA256 = "e7abecb45a2cb9a538fb38dea01891e82f48b48e6e36ebe41c7e894e58db773f"
CHECKPOINT_BYTES = 1232
RUNNER_CODE_CHECKPOINT_SHA256 = "1a6f20ee0a1e369314bb556b011da2227961cdac034c29dd296294da13b7b7c8"
RUNNER_CODE_CHECKPOINT_BYTES = 707
MINER_SHA256 = "5d6de1bd5e1675e3a71ac8ebaed0829d1a63b261e0b346663820860a06398e12"
MINER_BYTES = 53585
MINER_NAME = "exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner"
MINER_SCHEMA = (
    "p97-exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-miner/v2"
)
MINER_VERSION = "2"
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-none': {'cnf_bytes': 346288243,
                                                                                                  'cnf_sha256': '01af6f012df01d22224d5df5f9b60fd3339aced55c8ea2cf689e1767c352d3d5',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '818b06611a9cb81dc9b6e1264f0c85326cc72a1d8f7f31b4288d76fc5487f2d7',
                                                                                                  'wave_bytes': 1581,
                                                                                                  'wave_sha256': '25904852a41ac572d9350a7f894869ae32db7bc400302882967166c3c356fc00'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-06': {'cnf_bytes': 346288242,
                                                                                                       'cnf_sha256': 'b3db336deea62dc5c804c2da138623bf9a1f3b56e6bb476761929e081157ab42',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '94dc0c2918b163ebb4d6b282d08adc52c509b1ec9c41f43370136dca8440589a',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '127543a40b6c4f0bd7c0dfbb22e77c9f91c1a1bcdbd2d0e9c77bcefb487bdcdb'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-07': {'cnf_bytes': 346288242,
                                                                                                       'cnf_sha256': 'ef88072559095e0672a346ec7dc704698f7300dc53fba19c71a9ff16ede5a7df',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '636d4cc3045794c12ea2dcfcfb9c9457399d8d73b9e22bc53fcf01f1cdd3ac36',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '39fb3f148095ec5060a428148b686fa58d189a8b8dd7b1593a49f4501a7b045f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-08': {'cnf_bytes': 346288242,
                                                                                                       'cnf_sha256': 'c754c4d5a3d64d04a1ccf148033f44105bc0ef89e72c90eab791c1530a0889e9',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'edc4973b9436f4c5b45179f8de2a678878a10c42aaa4803c01ee1d26dd59ff2a',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '67ad1db74618a525f7ee2ebb9e0507730c91292bee64a4639d0ace21c85ffa36'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-09': {'cnf_bytes': 346288242,
                                                                                                       'cnf_sha256': '878fe6d37a2c1d9f8b42ecea349c111a86ce54bb666bf508dc88d83a19136cf5',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '2415a184bc93409ccd0f7bcdcb7649a163bef8b38020429538ad5cf4bfe721be',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': 'bb494bc12d90a570eb8b1c237c5cbac4469d548bfe5bb0813273e574ba2e44ac'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-10': {'cnf_bytes': 346288242,
                                                                                                       'cnf_sha256': '7ce630512c914a8cbe53ae4c41d32f0cbd8f9f7082e0302243b00e0112cb52da',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '19142f48c08ab75a53671ff79ece012244af6c7c7c2d873dc2a092d2da20fd32',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '0ca3bd3ebfe74a55d1770bf4099cf80856617b95709d83eb6f021308769323ab'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-none': {'cnf_bytes': 346288246,
                                                                                                  'cnf_sha256': '5b16aa76468bcc89932f125b303d70b6b0ca38ed67c3325434931c806aecc37a',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '3082ed2960529abf431cdb857e9ae618f04471257d9f347bfec878af14d6e85d',
                                                                                                  'wave_bytes': 1581,
                                                                                                  'wave_sha256': '84ae2276fc666f90b2e1c3b811bd28c725363be222dbfa8b13d7198cb29a156e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-06': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'e8b8bd6730c275e68d66b2156d629d6d9f9e69d03b07167ccfc7c680d4585ea5',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '75f9d4bc903d057a5fe144b1850507d8193ce5a8225ff9fd74b46429937c6449',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': 'f85855f2599e89a66d060b585d27f8822faa2754e1ebdb3bfd43c7c8b9f97610'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-07': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'a03ed1289be917af1fe89f2d9137d2bb13cca418024f9f3710494a50d42bbda3',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '3570f028c1cf573b0cba1d049e88a2d5913291ce1de7a39eb95d544848b56cec',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '327b1d0952893cf2beb85a81fcef941254100785ff1cc13c07b4cac9dea8ac1e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-08': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '318fa7e431697160f449ec461e2de758561fb5a1d65f7694ba0b0ab00d9c4087',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '2a85f8a4812768ad7f197412e5d21f7d0662b85360e5729d1988a45615fdeb71',
                                                                                                       'wave_bytes': 1591,
                                                                                                       'wave_sha256': '04e1c712feb4ab3a885a36ae88849e38e966583313aec537be3686e9d1d5e893'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-09': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '4cc8916653d86a75bffde48b59c1328d0f1a158a0d7895662984e8c3b1aa393b',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'e1f84644405ec788978ed71504f8e27411913a85c84ef21ae630fb725d1ebf9a',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'aee7a0732e6787d81eecbfd08951377bdfb41cac0286f7faebf48916579288cb'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-10': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '3aaa82861e40d4ec1029756265eceb3abd4df022da65d2631a88629a01a40fe0',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '238a370a797146edd1b275c6249f20a9948a6ef8c531f61a1dfa77b4ce4ab809',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '6daa51d3e526e41210d58633bc428ff9c12db47f6600544cd50539e159d11727'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-none': {'cnf_bytes': 346288246,
                                                                                                  'cnf_sha256': '24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '382b41e5d51939e7dfc933ef5597e7b4dd2e1308724f4f272e033268df1c1307',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '3abb5d05c42f8d582bbb73f946f5e7d5735a25ebdc22e29ddb52cde6584a4798'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-06': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'ebd59c80ac9e8114bf8f54558e5a9ea5cdc87d21c17789be714c3fa3191d72bd',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'f72d99d38cd21298f1d51bdfa4d729e2a7813efc8715a19e722088c5c7efb479',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '95117c58ab1042b15e5ae2e5eef151cfc432dc0c8784a031db273797425bdf1e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-07': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '7843d60eff8d6fe6dc131b07156539ed051724044ad05a631fca221c0ec3cd87',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'b109a81c0649cab5da4b6f2cf30101574e94fdd5adfef416d3dcea85b17c6ac7',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '85d1a2d6f1d588ddea5a7ec535dedcb146faafea44ee0a7a20bd4e3ebafae526'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-08': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '82fe89ed832b6631d82c94bf76e2900d375979453be02c1302f2314e273c3551',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'eeea5cd14a6318d655b63b2b85e4a204dd39cc7ee4b796bd4b301c2e3dcbf26b',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'ebe1ba0880d93eae42cc4eb7bd97dc5bb2131fe82ec00f1a0fb40dfa6a526127'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-09': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'a30202f03d1c11d4e23cbe49d80d34b2c68c4ac2469906ea1a49b8b243cc85c7',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '5f50e70f76df97207f530835481494a1e275bf1c2b9bf6a1cb065b0818f85352',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'e4e6b2dadb3d36940267545d68f5a144607b6252b69f5abc4163a19609c9d24b'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-10': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '4161684aabd23043682e6812e588f041794a88db25fe70c9863e48f0504529a3',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '25f80863d18abb0528052b1087c2e1a4d1ca3f02efc7064553cb38220f4cfe34',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '1d9dd43048476dd694b81033e2d028fcf73695c41ca36756a6ca964392f2d435'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-none': {'cnf_bytes': 346288246,
                                                                                                  'cnf_sha256': '40b438129aa8856fed4422a746a035975c60385d1b98d977ce5615c52c7328e0',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': 'e4454787a7559701dca2fd38c42ed6548828410d3ba07847ebdbf38ee84e0282',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '46035370e875d7c6f5d03908068ef8327dafa33ed3b3dcaa7dda2b47a045f806'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-06': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '4064871a88fd0c46a47c07aedafc4130b4461623260a22c735b114a3dd5b83fc',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '361eb1b9b3a60b1beffcd66de804cf88bb5525a46d32e0873fe7b8edc491c214',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '79bf8f484d14e743f3fa7492d6678b380ad684db81c0112e95e21ba00d5f8174'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-07': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'de187fea914a3d33a7ba56e1b7a398b788ad256afaaf4756a32809cb2d793328',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '048b52a24d02c1fcbbe0d45fe609694058af0e3e2388f53475fc95e6ebeffbb2',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '51fbfc4828f9a67c3a895113167d613e1014acc54fe799afed64815e3c7d4331'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-08': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'f021771270824be37101fa5bb6dfdf626d131479c1c3ef177dd6a65802ad991f',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '7073ccc7a6903f4925b828a999a1dffb5c16ddf328ef2c68a62c2c827727ab47',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '34728e640a9feb23e266a130c8d638821fb4201dfeef994684d2a6d047cf996a'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-09': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '4b5e4d22d6e8b7d64c76ddc74b81abc594b582158b27657164b0cf64181f9f86',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '121dc6a6ecfbac74e14c1b706552451694b562089e7f31557ad644c517adc98b',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '198b362bfebdfc05fd98bf3006ef9325074757a5b72ba866d0c3a427138f2e13'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-10': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'f3871a3f878d3f0d0b7e2dc4361186493a813d9bc30fe8525bccf3ec3bd64f27',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '3de257f5532ed150f7e3ae36950157ac465034e4fc5df21ca54e0127f17d22d8',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '347ff5b30a81e0adf9bb4aa9021397af6498fada8bcbfd8fd46036b33eb030f7'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-none': {'cnf_bytes': 346288246,
                                                                                                  'cnf_sha256': '22b8ff58ee7c6f10dcb2a86076f5124a3c288353f6613c7271b0529ed5b7f1a6',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '60c76895d9485c08189218da5217ff3f77bae6690f98ad1773e1cb25ba2ee69e',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '7dc99f744ce5d79a82de586377d52ca9b0982ed0925505419d2377b5cd34e5f5'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-06': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'f01d4b012a46ea482c84e09bde8b920205672a56f0c44fd60fe0fd9b48145f8f',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'ea449bee342538bdce60b7ae0716e2123670ad92188d812b0afffe8e4300a207',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '8c8f8e484e30dbab4c68649fe36f748a8c476ca082f6c53902e3301dc5e3851d'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-07': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '201d94ca56036c5f581e6cbad75432be617c4801c6f3bc33291e6a1518bdd5b8',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '4add5704d0ee11be07adbb7c15f311aa42c9406eaf375050b24b34f83892d83c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'a95bf5aa018c51a97c93a72e6b92393b1876235fb4777d33c8f29a4b8f43ce89'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-08': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '6b1714ec36c56269f98e7c8576ea89e75a78a6a41785750ed592329c51aa12ae',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '9b33ca31cdbd333ea46eb42de44753d0b0bc8e64125c815c9795af32774cf4d3',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '80bf4f0cbd358781bbae14af71b91440d431083167f33d1a37970e7a1f012131'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-09': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'da13973e21cd5c9bf253decd8a27bbc020e0af051db8fa8a1a71e4b3579031c9',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'd984730ea9c68f2f2f3b5db4f81c0d9e4973ff9443d3f850fe3c67c4966e8d7d',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'fbd8c3b417d9b6be79ab4e7d6a6edbd4439fc46ee6840432d4c39bbca8a03bb9'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-10': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '579cbda32b1f20e5d069aa54604eb3b3334deddc9a36bbf5f9e3fbc55e042cd3',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'a50851379b59a12864306ca164da55f4daa0fc7bba8b7d0fb3dc04dfd8dff7cd',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'e68738b1682cc57c5d82c17974e495b3b89cb4320475c16ec10207296090ce78'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-none': {'cnf_bytes': 346288246,
                                                                                                  'cnf_sha256': 'e788e90196050c834572aff1fc2966d23fc9d201d96f82251e3db543b3cc8ce3',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '77d0a340f7535b0fb706222ac305929ca1943ff1ec44dd982789452a35fb545e',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '5e214abf9588f3a275730d3bb3896b44bb2a96a560ee766a8420163e7db7229c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-06': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '5f7362cd9f08cfc1aa1b00171a269ec03b9201563a25186e87124f070b1e90e2',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '18c7613d205ffbee038d8563776c613a9f212415cc6c97e8956d3c660d640404',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '20ca62a20f501e4a1ae5e0e5279d3954bbf1a1fa645c3c1ed4e8bc1aae36083a'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-07': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '45cbdb06e1b4740e03ed8dd1bbb02b85a6adf319c325c3fab4fc5251d5f31e2a',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'fea7c5a33b7ece416d7049e792d8794759c2b5f3439beb522323e7beaa679b10',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '5c445e402e7f5c49c917874231fedb29d077356339a8edb4f53a411810d7be6c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-08': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'c2c0eb7c6715f02d3c82d3417a836d99ccd18636c0a0ddc9f8181991e3f82f12',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '509b96a1c3137bd6c4d0f122ca4948a6d602cc4af3963e0255789cc2279a3381',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '0ac2b41f1caba050ebf827faa0b193ce7b08ecb101178b862b17b7723a4b9027'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-09': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': 'a21036313c1510cdb346b86cf0cb8fc88b506e21f5a15c541dbe26b839657dcf',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '5aebc72a7ded1788bedbdb86d12a0d7696a9f337c3e023ae5e220499ba438e00',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '35dab236c64a3c09380a10ea41f0038b13066bf1ad6fd52c48e8e07d1c7f997f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-10': {'cnf_bytes': 346288245,
                                                                                                       'cnf_sha256': '3bc8e849d91b333392ed26c779bc1eda9ec0d33dc32fe008fc9910e3b87ed994',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '6b0f1d12da9fd1c4d84af9f2e3456db84ca98da08ee045eebec688f9a1c39c27',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '2076efde1b9632b1acc8ad0b30a2833f818da2f3fcb4a00d20c21ffbbef87312'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': 'e31041da83fb7a2e4bbc3680b25a46efba778b8e7783a51ce8d024be3c0cf7c9',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': 'a288138e99acc00117ef8c72c12c63510db60cd4ec52052659de578bd1747404',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '0d20439b64797bc27752253593687e0885b25b7b7e87e0b4dd83f87d6e46012b'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '79bf41d9db5ba70b890c37193ea5087b9410c45732b1f750c043aa645bf3509f',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'eefc56ab0b73f2a3398183b42f4a8f93baa5cb55574f7cfad0f6649bbbfe144c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '2ee8bed101ffda3f891f3fc460791b094d15e960e5dd0d076389dbf257446e1c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'fbc9b383dafc358629f7d34391a2fbd2641cdd2d12165297bee9c8e22af3eaa8',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '882299791c1e5b717776d16a7115d628d49c13267b69e6c97aedc1c943965c83',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '842854861bb2e33622140e03a4c8560b7a1e58a5bdbe38caa78376bbbf98b6e9'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '97b7fa16872a1af60d66ada6dced6e1937ff07c82ec878bf9bd9166476916637',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '254dd3fc6549b55f13d99cc65b747550ff33bd224654d23907875ce2b3a138bc',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '54132a362e984fe454ef4ca2f4e793bf4a0755d1bbf9471c845bab6d018a7d6a'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'e65889d5b55b99a8471091b462cc8f10fcfc08d6ce72ed8c60cbb7c60b1c2ee0',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '9d92bcee026a5e478437f65b82448ebfb2fde3acbc5385064f061dadce2191d6',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '7928c8d95a5c374ffb38e7bbae4210d31c400823f31c51db4de39b562bc7848e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': '4dc3b308ad134784323a663a2b4a0330df52987429ad12f4582265a273c369c8',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': 'e482467a71cbd6481366e95466f90009c8cf8721a185670927b0194c770e57e9',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '711a368b0fdfea463b714e9959956eaef9167f84e86e1d26b824418c7b611001'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'e2a08e33fde38240ee84549b016796a17140d7b068f1122305158d4516a68115',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '5c64dda274721de4f427ff87e98eeae88e222c8f1799cd32a0c9d58751008543',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '703a525daff8881d72bf7f8e05e7e306d893640b8ee75231194cbe45b91cd986'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '3f5e7903dff6a3e8bebdcd8bf1a9991e7e0d8035bcd9fbc4bb1c489bd8dfcbdf',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '0d6c47c483a52cb36ab7c93d29b7e4c16e09f7bb8355e7b8db5bcfee52be7766',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '98984e4014341a2d8195f813c245f9b827f5d76bd5de3901878b569a12205df3'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '287626eb891052f1f019d68affa04f2f28ab4a07ee54d59a8d3e7c8bc74c2792',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '7e4a485483c967e015bcaa144aedad99239ed42939fe310cef5fc6e8c74fc076',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'b8bfc2abbf51b2c0d56e31bc0b70e674644c1331913771c37653335b9c519adb'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '54c034e50e9ab5e1c743eaa4ebc01f4338a0a60725d6b3ce9be48032c1e690c7',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '3d4d53ec5e2f8da3f246caa53902ae982120312769cc3b62a745009838ddbb77',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'fa1c62c046b63a04b2cd88beacf394e17838a51374255a1e761a8c5817c7c043'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': 'b6c68d190122a2650cc4f0ed4ab60e16bd6e554617cb3dc562758e58a979b4be',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '2993463c3d4a502ae62694555194eba9e2d41a6092334e168b66fbea1244fc81',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': 'de09bf90932b1eecec18bd063d82fecbf1b738debb58324186cf77ecbd47d329'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'f62e7b87d4d33d786309127d7564751e75e52d5849ff325d6af1a2f008a87bef',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '39d8f863eb669d1f7e93e59c5dd78453b7fbd62c709daa1f88378600e3483eed',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'a77b8435f5bb32df105d19d11a0df671b70c2a08160e0c447808f6a5962afff0'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '36b1af650c5cd9cdc32f911c665850da5cb3890d551a92425ced3f7392203442',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '92f5b850a1e7785b31b6ce725e24f5e97140b8dbe2867868c82c7f1b751a78c4',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '09a28aa68379f0435d2db4bd18d7c78b792055f5277152a8ab8dd7fe29ffad16'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '5ae00ecabf18b0f621258d17989b29dd17149687234d9451286c1570e7045274',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '82be51588cf08c7597c4caadddabcec70bb4fc4803c113f7470bff499d1b4056',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '6e790452f0aba803f0d0840af8da9dfcf95f8d16b2a2c358a1e78bcb56f35ab9'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '4a8bfa161be035c4321ef52dff416f445a602a623c8417e49a919418992c88c3',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'c182a44f8f4b32b5e620dbf802a641069cff3766f9e1bca0cab2cfb8659b7d4c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'ae860a85b64cda6f6621d2ef1d97116d3ebd515439b697c7de8710f7f36917a4'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '80848f128d10bd2996ffbcfd59c337d73d7dd9c0eed7292859af3966594daa54',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '2be0658911fb2acbdca09ffd8d7ff73c681a937c6b15c34069a4992d8f279112',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '7183c5c0a297504579590f9da0d675d41931d7e1d479f9280bacc43fa4ba4645'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': '7385b337e37cb5b4fcb1bf5892fa0c8e1c6d33afead9a2f9ffebd7fc90cae213',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '5e6d18dd0edcee2baeae41bf5f43f468f099513eeca6e5acf3ff5c54431b4d00',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '4a02a499cc9ab3b21f9c2568922ccb5602a1dad39a0dfe503db4aa953e816e01'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '41654691f9a1975f2043a1ab930156f093b499c708cc7b7c82d5f51e75ae3896',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '7f5e82c5fa8c3c9e70210733e930e16052939398673e19197abae1f11a8f108c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '62db1dbcdfdb3e237e56865e3da0129caa02b081cb77b780fbfbc1149622160f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '5d8cefadb16525ea0cb5abdf7a5ba8a01a99e4d37ea5a65c6634b9fc18c1f192',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'c24ceb3d9346a35f24cd5858746e5bb50a5614f6ed2e2357797c494eccac190c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '56f97f4f02180e71c718b9306fc91e6269076e5fb42c6d6a3a70a75202ac8b07'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'b905d8eac7cbfe757205a39f9c461c20ec3b7d96f02900da7905a18538bae4ca',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'a9f0a914b44b94a575655730258645ada2264439991161542fe828ba988f8206',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '04f62793336cbe0fdcb85478700184267b66fb27ae028c808a95c42c0bd8fe5f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'c5f31200735909f7ab909a744bf5102e2c4e2fb0b0425457cc1c62205a920abd',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '747bb2143e6caa42707379e7f9709a330178a396ae1f110e719af573becea06c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '39ea380cad4f5eed5a9034da749a357fd38ef4a9a2bc3d4bd7d8297ce30b6136'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '574c36869a15d9c9eb979f8299c384e9ee531ab9bfa159a8e8249e461bce095f',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'ba55969b056bc5bfa4d98a98f945a1fb5c243fc060a9cd33b3f7ec8c1a8bc33c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '60be72c1ba0ddd4b8154120898a30c71f6a353c998f75ca1c255c1b8be1ace48'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': '63b5b11b7dd66a70fbc440cbc0ce93d4382c8e6c919b7ae8d246cc0fbb7149e2',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '8ac4bfee400ea307ec09f56649427d074c529cc08c824ddfded575bd150feed1',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '05e45160c76666e7843200f6007d086d3d0708e1b1f6883a14fff6d67ea909d0'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '058e814e4f8b3bd321e985d86e36201ca32c272cac390cd02c3441204d6437d6',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'c8832bb8c0f5ea80e87fede9b9cde283a80742df54ae3dc36bca8969094a44c7',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '86bca2d6bf5f1871d9928b468957aca7c9817e1122216993da776fa862e03806'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'ddcdb50f9e60d0c9b4e7dec8355d7ac288b0f98b9fa850221eb86a7978ef59ad',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '20e41aaf2f2b6fee0dd5c56687f53c98dcaeecf5a47a8ad4d6fd34e3ee5dc487',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '1ff5d9d987fa658aca7bba1768aacdc669e4d3605ec6744d7ca77713ff130b07'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'c826decd919d9fd0733e0f81bfafe46235700ef55b8a5bd04dd8adb0d161934a',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '22a70d9641ab0b04fea8397398cf903d976229b7ae1bbc5a087822c58bd07f1d',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '6c324579f0826f8c37cd8e9081446c65c225b1d1374fe29cac440e24fbaecee5'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '7beb39423c423cdb168b1f898c03579dab63af072107dcd11936477e3c208d2e',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '1387f81aea3cec844489baaade99a6f2682c039687845b022f25b4cc40928622',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '189588094513554d929031a703bc3c1b2d8f68087c5b5518a2a2fa63193d8af2'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '4e9799b7e8c97cf2817f6d599a07bb138b531ae98f004a1f1e9030df77a6cd01',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'f3581cf5c1350ff1548b77c9a894e4ee4246020247b60049948d1f26aaf4df0f',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '3327744844d0dfb625c4add5731335ee83dc48b7573c59d6d4bfe84f546c80c2'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': '095cc92e8fa86f7d3e1312a17ee1d3577e2b42764c3645531d6b312a1180cb40',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': 'd1f199d74bc7070f77988d0bb30b108e85a3a234395559d058d7f1578eff7e2c',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '3d99678170e45b3c58095577f43b0e00adf1d6e69bc3d0357d4cd49ee84441d1'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'c9b8252240fe241c6595bf11ff2d1a17af34f730feed569f62231f5777fe4450',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '8448ac986ce0fb603997a8eed410d1d4b734a8d23365df63c90bd237b421dd14',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '8d9abfdba7d360e7815621dd1f8ddba275af14a469d66655c92a14507f59275c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'eb657911f0d05e0260626122fd71a3506f08a91be84bd1302f214a4f96664985',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '34fcb39e6dfa41b8ce7de22f88cc51bc0997c8df5524b59dfa05682528469cff',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '402f81adc5d813a2f4589cd44194749064c58ef274bc4f91741f01a980c9440e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '43715f41d9207080be539013c064423bd1af68b38f6c81832cc1fee7b6fa3111',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'd851c7a98853ce42cbe96c9f96a9cfcb4ec90c699f3eb4dcc951a16b11cfea6c',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '839e9c32c10a0a7afc4108141f521c0824f9a49350808cbde0990f9d7cd76854'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '59eae30cf2914f4260b5ae8c795516fc941d5793efef7e198dc39c10dbcf6a41',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'beb8a1b6ae7e47145771a08630a4331a467a062eb4c45d720623dd4cb8786359',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '503577f3c000c3d3c0f0c0a66768f168af2076575c42f6ba803bc28766520f93'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '38619aeebea5e18be17afcab7cd2b821d8c0680522a5f254640a5aa9f15eb78a',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': 'e196fa60ad7d2017a01783d4f8217bacc2521283e40c9ae989be2c18387418b0',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '74affab03efe55c5a7cba07d7a57f0449882f7b3756dceed05dcdba3b476435d'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-none': {'cnf_bytes': 346288251,
                                                                                                  'cnf_sha256': '084a1f09eb837deae0f10c0ba8a2a6f06e208057ab891e1a1189f7ba70d86a99',
                                                                                                  'producer_bytes': 8178,
                                                                                                  'producer_sha256': '75a6feae1b4f624064dee0060a4374db7961aefbe7f3d4d11e702acd3fbc6c45',
                                                                                                  'wave_bytes': 1582,
                                                                                                  'wave_sha256': '1021a4abc4a658f932d748cef993238fd06af764036ba9d55ee807a4e285d9f8'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-06': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '918b1fc52a0f53a216ce65e23050690d7a00b0de53faeef923c552d2ecaf1609',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '01c0672025952b1a0f382494c0458ca4bae5722125a0ec4419e095293ad72ad6',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '84556be6c66027aa0e35cce2a764babd583a0fc20849279a28eccf273aa3bceb'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-07': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '0e424a6c7259094fcb290d1472547a318e76dc071874e32ca73fc2ee26d8db1b',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '92e0a877f5c120309b0205ab5e555656045b0bedf4277c3b8f15a9fe39c522e1',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '6f54e9f3aba49561062235fbb6d31bd81ad917fecf81b991e476a6d0159797fe'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-08': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': 'f55b97351383db6760f05cb8553f32051363d8f1afbd0213308e9bc6e773695e',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '6efc0df7695585453d5d76b7c73b6ee2ba0f0a4757474aba7396131360607d43',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': 'bb2159c4501fad4fb36e009f9f89b410af7c4d8ad4f3b0658a93900d5ca715c9'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-09': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '8c634192b75beb22b67bc7ef7df9e10c78036b64671564603bc8ace2d7acc8c9',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '59bd115a3c92844f280da0477a504567d7f35f953c43cb3112f91b6d75109c94',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '831548f7daf83244394544dd83fe5fd987f21c4e3485b3b1f08d95b3a9383119'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-10': {'cnf_bytes': 346288250,
                                                                                                       'cnf_sha256': '481dc691cd1ff180ad7eae2d333ff1b19095a6f5a4a273eb5257ad9604e1812c',
                                                                                                       'producer_bytes': 8193,
                                                                                                       'producer_sha256': '480c282fd4cf2131183267e047e53cec479c45c3765d29140facf0157f797e16',
                                                                                                       'wave_bytes': 1592,
                                                                                                       'wave_sha256': '425088686d9af73e48ebc1eda85eb05cf65129a3249087bf186afa3d8d1d68da'}}
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-none-sat-profile-v1': {'cnf_bytes': 346288243,
                                                                                                                 'cnf_sha256': '01af6f012df01d22224d5df5f9b60fd3339aced55c8ea2cf689e1767c352d3d5',
                                                                                                                 'identity_hash': '4b036521ce315a8083a05c7dcd4dd149dae912275f82d10e5010f086048b78fc',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': 'a2f24a69e0845a1617d43f3c4d475d2f30b34f11c3800d937b1ab08c22c6fbca',
                                                                                                                 'wave_bytes': 1579,
                                                                                                                 'wave_sha256': '1aa3ef55833f257b52357004f348c4bdcd3e1807ec594e7d471d12c1afe4066e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288242,
                                                                                                                      'cnf_sha256': 'b3db336deea62dc5c804c2da138623bf9a1f3b56e6bb476761929e081157ab42',
                                                                                                                      'identity_hash': '25ab8aacd1af820c4fcd4c03d4193955d4b17a6742b38cb2decb1dab69650363',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '50860feac3decd733e6f09bd09f1c48bc17437b83fc25a80961bcf20557a3f0d',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': 'bd8b54a3ee9dafe7dc79bb5ed576e2435181c69c297e7e0b46b35d9cc3a7ad52'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288242,
                                                                                                                      'cnf_sha256': 'ef88072559095e0672a346ec7dc704698f7300dc53fba19c71a9ff16ede5a7df',
                                                                                                                      'identity_hash': 'b25bce102f96467dbc1ae149307a08b4b5fd7c8469dcdb84750286a78efd2a91',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2bbc497a8d5ebab756ad00128de0555455c460887ea526461bd3697083949ca4',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '2a424e6d0e025f854fbfb3a6d91b5ad73abee70c877127aa0b39ac9bee82d506'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288242,
                                                                                                                      'cnf_sha256': 'c754c4d5a3d64d04a1ccf148033f44105bc0ef89e72c90eab791c1530a0889e9',
                                                                                                                      'identity_hash': 'ce779359e86a820dcc361a9e4e756bcb19ef8aab3da963fd97f66dcb302065b4',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'f6bd343c5950a47572f2ba1c070f43b340027997bf282eb941c87a8583140891',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '96cc0c501d5957e1dd9f699fcbd5fba51a25f86909c6589b4a0eaa2ef62ab3e4'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288242,
                                                                                                                      'cnf_sha256': '878fe6d37a2c1d9f8b42ecea349c111a86ce54bb666bf508dc88d83a19136cf5',
                                                                                                                      'identity_hash': '4fb235d2f481adc03071ea36359ed0ca3012095ee483415618f93584227124ff',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '3cd38010985f9feec04ad719e69328fad52ea78f67b12eff709bffa2b83971d5',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '1a61aba4c9f726b5e0edb21aea6458f30b29451b736a625bd147fb6b18167950'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-00-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288242,
                                                                                                                      'cnf_sha256': '7ce630512c914a8cbe53ae4c41d32f0cbd8f9f7082e0302243b00e0112cb52da',
                                                                                                                      'identity_hash': '0c1c4f8ad36e71b9798e83079eaf5b7094762878957ba7e285846ea1b9db1951',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'fabb5bc5907ca289b13c0009b65c314a88ca00634d3c1a21b5dc71a43efeb7b2',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '7c7f36d9bbc3f42de0405891f73e423feba62d110e3e2a70251219e63f94f92d'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-none-sat-profile-v1': {'cnf_bytes': 346288246,
                                                                                                                 'cnf_sha256': '5b16aa76468bcc89932f125b303d70b6b0ca38ed67c3325434931c806aecc37a',
                                                                                                                 'identity_hash': '7a3fcee19f0e23ddea3baffd6fc05fd846978888758046298e5758bd04ebcf78',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '428e91face2cc544a07f283dbcedabaf0242e53bcafc93786bbde874bfd49328',
                                                                                                                 'wave_bytes': 1579,
                                                                                                                 'wave_sha256': '9b571dfce1339efa917a832ed071a3878b590902d5e8b9ef792711671b636732'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'e8b8bd6730c275e68d66b2156d629d6d9f9e69d03b07167ccfc7c680d4585ea5',
                                                                                                                      'identity_hash': '669f1d1568c3c1fa188f67bfa5b61c608a82bbe239d801a515b246206b1e6e55',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '919bc960f4c6a078fec882772846827b2fe4d1296762dc6cbe164eb21b31b288',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': 'bc4264715dbb5b55a42fe93497e6dfffbc844b5d82610f8b3e7786bfbe4eb892'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'a03ed1289be917af1fe89f2d9137d2bb13cca418024f9f3710494a50d42bbda3',
                                                                                                                      'identity_hash': '803f713f77fd3f1089c95b2dfabdbbf0d28bb7773094bc547e64877296a3c4a6',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'd41d5380982ba2a2680808c1558930463a42107837e77e4f6339bf802591130b',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '22d681f68be79f8e6bd2202bf78f2d4cccd2e690b7f7bfb99699fd4accef9a65'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '318fa7e431697160f449ec461e2de758561fb5a1d65f7694ba0b0ab00d9c4087',
                                                                                                                      'identity_hash': '3b0256bd9676a20d220f169d4fdb209cc877311efcaf47829c4021900ffef312',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'a7f31947ee6eb81b40766feab01138b35f18101cd4f95c4899015be5605383ff',
                                                                                                                      'wave_bytes': 1589,
                                                                                                                      'wave_sha256': '4e2ffdeff93d9f864186072686a85a63bd7507926bbe0377275d5dba0e80aadd'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '4cc8916653d86a75bffde48b59c1328d0f1a158a0d7895662984e8c3b1aa393b',
                                                                                                                      'identity_hash': '9bc2b160fad464d2a69ac22d94d1d546d79930feec1880f417aa6ad32b2ea682',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '44fdb01b5f0a8f19d38110880d64c8822cdf1dec8ec67da78895748d2edf9379',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'a2e97545bccad18851f56f8553318b2328e9ccca090dbcc872c80f8b4be4c22c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-01-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '3aaa82861e40d4ec1029756265eceb3abd4df022da65d2631a88629a01a40fe0',
                                                                                                                      'identity_hash': '0854b759ee69d0a13d62ed349bc4276d62afd70ed0a91033840131ae7ccf392a',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'b617397f6d572a3c2d15d94f9bfb6806cf2c461b8f4efd7a712e332b586f003c',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'bd85847f059b74b9698f919dbb9a44aa6e9f67bf552c619945b15fc186be3f85'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-none-sat-profile-v1': {'cnf_bytes': 346288246,
                                                                                                                 'cnf_sha256': '24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f',
                                                                                                                 'identity_hash': '34b0c818b8c43a53335cccb77b04ba5f35ac409da3b1fc5eeeb799169d531b6d',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': 'b2471486b6f29a67495c0f1d2ae73b49825374273d9a552c6e65ee672019596d',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '7afc95013632d781522a4bf9fbb6b5d5b3e7596f6f73b203ffc71c258d76b453'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'ebd59c80ac9e8114bf8f54558e5a9ea5cdc87d21c17789be714c3fa3191d72bd',
                                                                                                                      'identity_hash': '0d29172768b1c7f60b311ce76a880cad5cbfe116815eee4f4a629e0721c6e219',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '008ae609e3feed48a9bd3188f283c7174e3d8d3fbd6a1f1837b16542c30a2fd3',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '426ba75f4e3c031f75e653222ea438c0f6a001568afecec4c9fb630e181a2271'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '7843d60eff8d6fe6dc131b07156539ed051724044ad05a631fca221c0ec3cd87',
                                                                                                                      'identity_hash': '22f5d4289f05fa25e85b0b98bbbfccd0eaddca6f574d8c825e8b99839d31a532',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4642491efb8793e06e09d34d6e0c485dcfce7118c0ca32dff1476bb6dbd80694',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '361889bb50897fec728769c016c1680c1789024048b8d0bddb6c828415451a4f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '82fe89ed832b6631d82c94bf76e2900d375979453be02c1302f2314e273c3551',
                                                                                                                      'identity_hash': '4da89381ea1f588e4efa42a0f762225f144ab8d2b1a9455911a38f7ffe0f31dd',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2e25b55e55f3175475ee1b09bba55ad26484ff214bc7ee489b76a6df462e2947',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'b118299a6ea4d2789604c5a094dd23ac9150ea8fd456030a6d60b49a3b793b72'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'a30202f03d1c11d4e23cbe49d80d34b2c68c4ac2469906ea1a49b8b243cc85c7',
                                                                                                                      'identity_hash': 'c512666647c63ff991a4599909fc9a8ec25b773125491f3bb59a027722d6fdc5',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '1d5943d0901cc309420b9cc7cc89a7646bce316cd5f6a33508305f6415be4e94',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '55e95b2004757685f7dfeaf56872833aef09b96c01de619557aa5e4d59c4b4f3'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '4161684aabd23043682e6812e588f041794a88db25fe70c9863e48f0504529a3',
                                                                                                                      'identity_hash': '4ebaa02778f7c57cbc2ce83086a57514f6e804af51de35abe9381bac5ece3f24',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '71df95df550e3dccd6e0311af2b8b60117c32fd1f217ed4f8f4ffdc645efd65a',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '8972e34731a31568872014ba2ce151b2be191fe71e47f48d3a1c873de8c4c911'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-none-sat-profile-v1': {'cnf_bytes': 346288246,
                                                                                                                 'cnf_sha256': '40b438129aa8856fed4422a746a035975c60385d1b98d977ce5615c52c7328e0',
                                                                                                                 'identity_hash': 'aff14feaaa92abee34b2a4e4d1c53681985021d279c43c35b9ccd30085ec0566',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '04fb08fa5f1d38e10d2abd1d954f1ed26013c81c022eb2a872bf87bcc7628c1f',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': 'ec361de20733cac0dbe34073660e0e5da887e2e2c0ff2a7d52939027f3f98b64'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '4064871a88fd0c46a47c07aedafc4130b4461623260a22c735b114a3dd5b83fc',
                                                                                                                      'identity_hash': 'e4fe17fce5727ae5ad8ddcc8374f37426365e65af1b13ad5eea12ead52f03aa7',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '6e2f64e4466e01d5a2d97f339de2fb98cd03ce162dd40e9fa109876c165771f4',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '73b6bf901312f5e1e75bf9c868b4d57a5fcd30a2504bc32a98cdc1ebecc2c517'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'de187fea914a3d33a7ba56e1b7a398b788ad256afaaf4756a32809cb2d793328',
                                                                                                                      'identity_hash': '8e74b5d40a3efbc86b1925914e421642a3b7bd53e6720b5ae4e433e78a117918',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '7012d8e70409be243b83e6cf814888c0869b60041be6467e3062e57c8c16a650',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'c74d12cc8950220952bd2a00bb952426eb680c1e7deafe84db163316a17e0c8c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'f021771270824be37101fa5bb6dfdf626d131479c1c3ef177dd6a65802ad991f',
                                                                                                                      'identity_hash': '71aab470ffadbb6ba8efa8cca67825d4b55d73408631d93675da4e6118248cf1',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'dbbb2bd040843062a2788a6b34244db32bc0b52ed01e2d049a9b7229fad09aed',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '6d945e9c8c4078ea39bc7ce8246f2650c3df71596eff0d0a99a4ce2bf755cf91'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '4b5e4d22d6e8b7d64c76ddc74b81abc594b582158b27657164b0cf64181f9f86',
                                                                                                                      'identity_hash': '7e553aa971c95c64bccac40b37541dbafda0c5f4370deec1728b743dfa2065e5',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '1f573de7c457f31a0dc7f9c3968d43251e96a42f9bb7a6b6ff3b1e98d21b7047',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '8fa1fde356a9f7336112907f4d1fcc5a334878788ae020913fddcb001428c019'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-03-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'f3871a3f878d3f0d0b7e2dc4361186493a813d9bc30fe8525bccf3ec3bd64f27',
                                                                                                                      'identity_hash': 'e5caa39355c1559f3d9a44a64d9552245519f9c349ca665dcfa3d537c36e880e',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '901437863878d5276c76897d75ea1c0e8896d13739d79c185ded0105d93f41b6',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'c795c274447126668632131c05ef2cd1256f869f4831789973256bfa8ea0b6d7'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-none-sat-profile-v1': {'cnf_bytes': 346288246,
                                                                                                                 'cnf_sha256': '22b8ff58ee7c6f10dcb2a86076f5124a3c288353f6613c7271b0529ed5b7f1a6',
                                                                                                                 'identity_hash': 'ed05ada694a9f388bcd0b4186e315b2cef015455d1cd1c73fc25ae80173473ac',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '751fedf348df3b61a89934b41fe36bde5a4509954c4a9abc19ca93271e4ebce0',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': 'aad62a79752567d7c303faf07457c5abb07d795f80db0c71ef06aa6a274fe328'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'f01d4b012a46ea482c84e09bde8b920205672a56f0c44fd60fe0fd9b48145f8f',
                                                                                                                      'identity_hash': '7166a232033630880303c3b9d517a151a04e592b4d4ed34ebb1af302af779e55',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2b90b1b88abb1cfe330b17e8ea75a08e4db12774ff3fa645c8953509ad4b0b91',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'e6c2ce36f2dd57a7cc9f8d1694910657d9657b8d21fe59391b185d23e1b1ddcd'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '201d94ca56036c5f581e6cbad75432be617c4801c6f3bc33291e6a1518bdd5b8',
                                                                                                                      'identity_hash': 'e9a0b87bdbd9072c7c53dfad472feec7c937f4da94379926f8060b9624fca056',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2834c60ca93cf20a3f32007ea029179fede65b98fd8ac21e0c51b1b11850c74d',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'a9ba6f957280af8bf9e9b2eadc9b6a86a3c76c0bd3752c2d2c464273ca93d1df'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '6b1714ec36c56269f98e7c8576ea89e75a78a6a41785750ed592329c51aa12ae',
                                                                                                                      'identity_hash': '32e3510a10b33a1d8ae0f8c736962c65eab1dfcc1b804aec1ab8502f58676bb3',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4e62fee6e28cf9645b2e44d99375bb811dbee70ef5c885be67e5b772352f7bb2',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '849d46ab1137140d550be4d9d2ee1e19dd656fa9e21cb35471b2b9c04f734a36'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'da13973e21cd5c9bf253decd8a27bbc020e0af051db8fa8a1a71e4b3579031c9',
                                                                                                                      'identity_hash': '761a67c074af8cdd29f9101f710222f679ab075fd07b10a3622a1beb85ebe586',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '079a403c9b8eff0a1be18112e702b3d03a951a58995c8091082227a7dc3a6bfb',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '1078093cb315be404d9a7b94a20b0e47524fa5e8582a1e76b7f10e91e2276d28'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-04-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '579cbda32b1f20e5d069aa54604eb3b3334deddc9a36bbf5f9e3fbc55e042cd3',
                                                                                                                      'identity_hash': 'c5b2d629bdddb1ec9b36e6a5459c2ac14e1c8f86ae51f54421340a709bb27ac5',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '25ff4125352e25ceec2baefdcad7d1e41ddd5aac70c28df0361ab6be1d3bca83',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '2e55d80185ea60589baeffb407c3cfa7b03c4c1d4ecd452f27de52fe839e1d01'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-none-sat-profile-v1': {'cnf_bytes': 346288246,
                                                                                                                 'cnf_sha256': 'e788e90196050c834572aff1fc2966d23fc9d201d96f82251e3db543b3cc8ce3',
                                                                                                                 'identity_hash': 'c1d417af747eeae46c2ac0d324ecde1c45ce80ed7be82de277e7dd3f15e5b972',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '8fab949eb6f1c77e290d511e1d27763984f60bca7f29d78b09874b96ba0b9d98',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': 'd8c59b516d9f0143620121661359a8cafe5f0af8310e132fe5485933c5acfe4f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '5f7362cd9f08cfc1aa1b00171a269ec03b9201563a25186e87124f070b1e90e2',
                                                                                                                      'identity_hash': '090f29ed13f11bc32d0c93c6a63314308fd9c0db348a21b7dc4a0ef08cf11a17',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'd8f939462d592d299f6e7bb2b1c4463a30650f5d0ba5ad114fc0a2b5079cfe68',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '7a104847eb01186d86b199ebd1b6a2687a853d13feb4c7502d986718cdfc0ea5'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '45cbdb06e1b4740e03ed8dd1bbb02b85a6adf319c325c3fab4fc5251d5f31e2a',
                                                                                                                      'identity_hash': 'dbda9885465e039849b983e927861f3ca518910c4b8745c83c9a3b5476637151',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'b5727f0ed8e13c30de423cc1a13540d598918b25da1f3967379a0d0c818a398d',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '0293552c86fb75f20cb40a1cadce8c461dd59b1945ee79a205764eb33ab9ef28'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'c2c0eb7c6715f02d3c82d3417a836d99ccd18636c0a0ddc9f8181991e3f82f12',
                                                                                                                      'identity_hash': 'cd73aa5d5ad1350ff1f4db54f9e211ff8d649954a9d1389de6931ad46e6dfc03',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '109d0053683d82c3f55f139343d18bf94a452a49fed2cc34fb458f2eab867c8c',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'e986997d571f782b39e58e5bb76635ccd0fc8a6e427a1c2bed68b5f89c316eb6'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': 'a21036313c1510cdb346b86cf0cb8fc88b506e21f5a15c541dbe26b839657dcf',
                                                                                                                      'identity_hash': '14e80df3cb24752ed540142ba67cd0df79d21c8a93106101ecdec89170365b56',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '00790ced6978a5fa3cf48e53c7a9c51cd579c30e411a135ea2fe8ab54254e4b4',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'cb710c5027b522e79cf1253f1d431d91090f50c9ba7b0d9af6267da355f079da'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-05-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288245,
                                                                                                                      'cnf_sha256': '3bc8e849d91b333392ed26c779bc1eda9ec0d33dc32fe008fc9910e3b87ed994',
                                                                                                                      'identity_hash': '2c1eec1fccfb0e1026b2c939b07d0c6cdf9c712fc6b205cd4640ecefee99ee82',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'ed0103cd1b6c8fdffe8ed2e7923398b3924e0676b8c69c60bd27cf44024aee95',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '84df04254fa5e4d988e6d36deb32e77911ffbf11b340aaf39f76f64f76602331'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': 'e31041da83fb7a2e4bbc3680b25a46efba778b8e7783a51ce8d024be3c0cf7c9',
                                                                                                                 'identity_hash': 'e920256399049adf97507025868076a833b7fb1b67e67f038fc1e3db6f9de71a',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '1602c8e0517a1dddba80278e751ce3d1319ff43ba2550e6b25aa774d6254d9a1',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '9de56e9c2334fc9b0072093732bf8b12f3c68c2dc7c5a4075d498039de216aea'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '79bf41d9db5ba70b890c37193ea5087b9410c45732b1f750c043aa645bf3509f',
                                                                                                                      'identity_hash': '0f0908f39653ac1601b8f8ca0fae4f32992b0907f35c991eb982be7087c4f221',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'b7212ac3ae063c3b0877c2379dad9ad2096f56d8cf410ef3bf5312579d217f72',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '59c5080b1d546ce339814c1ad8f714d92bc2f8070fd821ea9cf9cabea7c8a8d7'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'fbc9b383dafc358629f7d34391a2fbd2641cdd2d12165297bee9c8e22af3eaa8',
                                                                                                                      'identity_hash': '7f919c840f9d440394893e5b691ee5ff90fae2edc29773943919d22aadc8d496',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'd2c6d48e73ae4da4806c3dbae1a1cbafe7963974b91f66173e6aab3c643839bf',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'f887a5caeb4987d3433bfa01d7468fc0e75812f97622dd31acd1aba93194fbad'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '97b7fa16872a1af60d66ada6dced6e1937ff07c82ec878bf9bd9166476916637',
                                                                                                                      'identity_hash': '2f323d68c48091d4e2675b74015233612674ca4bc1fb324ccdcab9dc1bad7a50',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4dd5be54981af0989c038758d328258533cabed87bf1196bf3f74e2608f934a0',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'b68ab62aacd8034e5ffe9c7c35113cd461188b8ab9364bde381e3c1796857343'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-06-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'e65889d5b55b99a8471091b462cc8f10fcfc08d6ce72ed8c60cbb7c60b1c2ee0',
                                                                                                                      'identity_hash': '022e5b47662f794df796cba31d7a2a661a6bf99a5e3ae630fd6050c99b435ad7',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'af582a317a53e4a32b96c3eca0df3691c6ea7f527307ec10b69e9d3c72f06376',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '3a1d2c09025126472fb6ed757f72c976190a050265562d96212ba451a8355c72'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': '4dc3b308ad134784323a663a2b4a0330df52987429ad12f4582265a273c369c8',
                                                                                                                 'identity_hash': '8428191e9f426d0953034b6d866faa3f094234560366e783079ef164b24c30eb',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '665d7559d704c8c6b339b83b5d9838304d18a6e5643d4646c2a9d5031e53009e',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': 'f634f45a7b98e36b7581e360e3518876bda1ce7137412b4aa5409d6b5a018770'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'e2a08e33fde38240ee84549b016796a17140d7b068f1122305158d4516a68115',
                                                                                                                      'identity_hash': '4373d8f57123576b88f61ff63dd077f0a7c00891a8491444e9e999f4d6e3ec6f',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'a641e713d1cde72d93ec102f38a571893ff7ea1b6b321b5baceea34e41830aaa',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '9acd07c6cd727083a7d48fb03e4042696064981277216784af21c1a9685538e2'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '3f5e7903dff6a3e8bebdcd8bf1a9991e7e0d8035bcd9fbc4bb1c489bd8dfcbdf',
                                                                                                                      'identity_hash': '8b3f394f17b2c3b8898d314e0753154d413c4043610e6488ed0c9627c04e81aa',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '07afda01710938b5ed94dd33d8cb7e5551a4177f7ead762d8946b4e6f9e62c73',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '1020698739ef59e4fedc37b309b56a15ea9e3c4c66f478bec9984a984d325eef'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '287626eb891052f1f019d68affa04f2f28ab4a07ee54d59a8d3e7c8bc74c2792',
                                                                                                                      'identity_hash': '2fc43b8bed2375ef47b48afd887a9d319580aa274fb41f6a0e98d34dc87e517c',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '69388b488fc2cbf5f3a0e615bb0a7b1340053ea59352ffa99819acdc7628da23',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '77a45b7613b688d53622b040ce371a2b794f13e914b09f9e95080e509604e982'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-07-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '54c034e50e9ab5e1c743eaa4ebc01f4338a0a60725d6b3ce9be48032c1e690c7',
                                                                                                                      'identity_hash': '1f3ca9a1d4743ef6155fc892498dfa4c86a5f84fef07adae5e80eaa09a13fbb3',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'f4ac36615e1e7167f27c6ae77ebdc397605f014ab0e2373b1613b3f1b302e565',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '1b43e88b9ac2ff5b472cebad0772ae27877f22ab9d11c38395708d82f5ccc516'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': 'b6c68d190122a2650cc4f0ed4ab60e16bd6e554617cb3dc562758e58a979b4be',
                                                                                                                 'identity_hash': 'd228334ccd638a4148c9e9333d1c73cc3b84b89cdd21a07f2719423b33ab36e4',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': 'a0ef697a1989fd9ed50b0a345359eb9e05f8001a10a075e485f7fdcf37c06a24',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': 'dafd7d5b0959d5ed03c22fe626dacabf1ba578aa6cbab90324a81fe6ed265d7b'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'f62e7b87d4d33d786309127d7564751e75e52d5849ff325d6af1a2f008a87bef',
                                                                                                                      'identity_hash': '50d42025d5798ff6457b6fe4e3c51693bca6cff583a0d3d2386f0501b7d0a457',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '6f595959a06259abe8a839b8c714876a83b2d83d3a62e19d17b35423cc923cac',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '2730b663dde830508bd599387c408da3691180f350ee4878fc9a59c5f63294e4'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '36b1af650c5cd9cdc32f911c665850da5cb3890d551a92425ced3f7392203442',
                                                                                                                      'identity_hash': '5fcff7c980638f7b4ebb54003c417acb3cc7b35b264d8d54cb08cf4e3e57a5fa',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4d12b8be5e3bbddc91b4c0e75fc281ccbc859e593b2358c5874c8880a6009f43',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'a3257022c7afc5657afddf056a6c529a35ae7ac6e74fbbea1eab0e60e972bdff'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '5ae00ecabf18b0f621258d17989b29dd17149687234d9451286c1570e7045274',
                                                                                                                      'identity_hash': '4ef5fae3895126c3624726d7dc3a3926009c34694d13263cb64ec2491e331f01',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '7f22a148e0851be23bf8662bde8971f2704d304377532ee0813a4df3cbb5f436',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '9270f4d48c7e0c5e2953c6b9400c01b03ff1a60bc73b11a5a47f248b302d31cf'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '4a8bfa161be035c4321ef52dff416f445a602a623c8417e49a919418992c88c3',
                                                                                                                      'identity_hash': 'f6c8113c1d9e2276fc9acb2c4e7dd451d0a6641864ff4d8ce811ff35e5ffb431',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '69504d7b7f059f0f54a653a2ed08e1a7f1c17ea025e7fc581b59239e4a1c8b20',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '46ac8cdfb2f1980117bb9524b28981be452fa3e685d32861010b34aa1a9c3314'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-12-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '80848f128d10bd2996ffbcfd59c337d73d7dd9c0eed7292859af3966594daa54',
                                                                                                                      'identity_hash': 'b7e3ee44a1704190f88964efc50df75f0fff7bbe71369bad2b900e090b6f53a5',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'f2fbc8ab37596bb93181f154e38e3c5405369ebc1f227b692781adddc2227dbf',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '825badf8e27eda40dbeeb5255e98e3b89fc7f3fce76948e3aa5681b9432a2781'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': '7385b337e37cb5b4fcb1bf5892fa0c8e1c6d33afead9a2f9ffebd7fc90cae213',
                                                                                                                 'identity_hash': '3928a148e55239780adb33c2887e7c4fbf9553afc913fbb7568226c8a178f869',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '9d6b36d381acbd01dece1a75a9ba59bdff41546687b04557a8e0ac03887e6f0e',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '04edb890f85f72e98bfaa04a992bd6aff51e9ba134164b52a42c5a479a670a6f'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '41654691f9a1975f2043a1ab930156f093b499c708cc7b7c82d5f51e75ae3896',
                                                                                                                      'identity_hash': '30e74fb87a68a7e334927da5f40fe04d8b9514707c6442f13290fb0455c91c48',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'd0720b250526ae3fea3f8bf43350fc2112088737a6c91b6f0462321abe317bff',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'c0841bd1149661ac07de05b078879c60b6289fb6c1901f33a240a2157d352d3e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '5d8cefadb16525ea0cb5abdf7a5ba8a01a99e4d37ea5a65c6634b9fc18c1f192',
                                                                                                                      'identity_hash': 'e9bbd44e04e0b9610a269d404b1bbbb7cbe6f7e6d3e7e50226021b01527ea024',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'd3cdd9975bc240d023c009d1db34affb7aaf08d4553caf0b6475e8bec54051de',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'f0901b970c9794dd3559c0dc0e54243dacb4d8bc5559cd1b1a0d22cb58ab9d19'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'b905d8eac7cbfe757205a39f9c461c20ec3b7d96f02900da7905a18538bae4ca',
                                                                                                                      'identity_hash': '97a5901360ef6fdb8cd4227f9cc98d8188f51bce94412e94951f2d98c9db3da8',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4cfe9381014d59162dba67816308de153e813fc4453f29a160a3c6a286618bf6',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '867d722829eae71bf487da7cfa28f6f90665be68c15183c672107aae8b394635'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'c5f31200735909f7ab909a744bf5102e2c4e2fb0b0425457cc1c62205a920abd',
                                                                                                                      'identity_hash': '06e39b3b926b5db36582ca679d3c368b263cf9f82a75b9239a7a037dcca713e7',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'b65cf00d7662375f9b71429c41df7f4187adde5a2c42cd1856707615189c5c19',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'd5f6d9597c5926af571d595bf6f132fa5f6db1137fa590eb3a079de32f379d09'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-13-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '574c36869a15d9c9eb979f8299c384e9ee531ab9bfa159a8e8249e461bce095f',
                                                                                                                      'identity_hash': 'e7a232948e6f4f0cd47e9f4b5d2c69b82e9927c8142c4fc00cbd2043c4b9915b',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'a8dec2e775c2166435494843e09477fbaf5275d74a56c6ea7c49704731b943b2',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'e378781e0921b56f11595e69e53708336cb700fa435a26ca425df21dc17bd04c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': '63b5b11b7dd66a70fbc440cbc0ce93d4382c8e6c919b7ae8d246cc0fbb7149e2',
                                                                                                                 'identity_hash': '240cfbfadd6c1ddc76d4c0863d29b2c6813145174f2df9458c7e02c305b044d7',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '8f110b9b73409787921dcc96660f79e6e6aeaa63e51c4c65a06dc4ec3e31141e',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '2ca2bdbf74ad1d141242e919d11e56e4d2c9335de6ebe075cb1a2f3fd68f23f3'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '058e814e4f8b3bd321e985d86e36201ca32c272cac390cd02c3441204d6437d6',
                                                                                                                      'identity_hash': '8043b8375d268dd246469c23e5107f3e413eeb45a2709a6115ed3c1b3e5db87c',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'dae85bd7ce6a2a01f6eec7a1b0048955c91b9cf3b5f87178e4ad3424918ddf94',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'fe44490f074a306865d48613d5fc610c4b909cca89813506841743a03dc4a743'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'ddcdb50f9e60d0c9b4e7dec8355d7ac288b0f98b9fa850221eb86a7978ef59ad',
                                                                                                                      'identity_hash': '85f9e269f450cb1945879e645d695aa81bcaa3ccf819907aebbe78b533a4f4c6',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2d8616ae9e4a8fe83256763841e4b0f074b84e0b2a643f6a303a14da635d415d',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'c57876ad0a5e6e3e94dcb50a9ac140747d098def6dc3d6461f1ada15749f78ba'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'c826decd919d9fd0733e0f81bfafe46235700ef55b8a5bd04dd8adb0d161934a',
                                                                                                                      'identity_hash': '079c7409539a410d3094494fc88a1c627c756971eb227179ce284f3042d7b6a9',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '64d349b1200914e406a5e8e0fee2f83d1e18966cf67a30bc4bd5c37d6462e325',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '5391a445606dabc08bcc7bfd12e663bdc1e81085ee9286338d42660c787d4466'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '7beb39423c423cdb168b1f898c03579dab63af072107dcd11936477e3c208d2e',
                                                                                                                      'identity_hash': 'b6aaf113381406ed61d3f17707845b04071743622f7eb7b959bbafaab810c21b',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '169d75040db356224665eba00e0041cf2a1f39fd777280499e6710cc515be791',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'b4a65e1ba43b6b4742d55b9e0c10b08ae351abfcc69d0992f913d6673156360c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-14-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '4e9799b7e8c97cf2817f6d599a07bb138b531ae98f004a1f1e9030df77a6cd01',
                                                                                                                      'identity_hash': '61bda8c8b928ad54bf6b4455d37fec2f70f11ca58dd4425af634ef74f787312a',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'a2e6c68533dae7b8cd11ef4914db073e60085423107598da6bbfde9d4a426f4e',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'f9d863e00abd283c91386847030f441a5709d0c5d3aacd2da406e5bc22ed9c8c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': '095cc92e8fa86f7d3e1312a17ee1d3577e2b42764c3645531d6b312a1180cb40',
                                                                                                                 'identity_hash': '28ad01746291f48e085deda97396458237d812d5c91708c52e68c2d49ebac2e7',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': '1f8ac0cd891478e6888b6a97a9e1deba8d6a69db9ac1995345245adf71f07169',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '33f535cbd06f57a38b44849ca50bad2e7c5ecb1f375ca667f233290ceca6b7a0'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'c9b8252240fe241c6595bf11ff2d1a17af34f730feed569f62231f5777fe4450',
                                                                                                                      'identity_hash': 'cdf5cd118604b0c0e6abfecd361150dfd128dc048fef82f4f894e3db437fea7b',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '8a917415fa93da43f238e6bfb1c6c48dc7570a31ba403716902c6266c7b3c3c4',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'af580bb9494da63845a0bc7ec82619a24b482f74147a80048f0e0752ccca3624'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'eb657911f0d05e0260626122fd71a3506f08a91be84bd1302f214a4f96664985',
                                                                                                                      'identity_hash': 'ea7dc847adc8d7cbb8cb716ca79d929249068ee7c4d3b0763a81094c19e80b77',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '993b23acf799dfa7e760b24e9a73ae3679c3e4377404c32e1788880df1bb267b',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '87dbd2a9e2da6d0d30ba740ef136b5f13dfdb2da1d8743feff3028aad93f1a17'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '43715f41d9207080be539013c064423bd1af68b38f6c81832cc1fee7b6fa3111',
                                                                                                                      'identity_hash': '16cf3d3e4a74b0d73a5b691d82375a4be4e731a073cac893ce7fa301bab3c9d0',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'ea38a6cc5bafc2d829b502fcb5467a5ca17f217303bc2b7efe3c8812ee79b069',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '2410f868463e81e581672db9705d995b980ed3db5dfa73d7de5ace86c101834e'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '59eae30cf2914f4260b5ae8c795516fc941d5793efef7e198dc39c10dbcf6a41',
                                                                                                                      'identity_hash': '6039c048f258e944175e821e1416fdcbf70b6485e6530062d9522ed8aa7d5493',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '5a988bbcd3c845bb4e59ac5b42d3699864d1484e19ffdd06f389477c3af38a2c',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '4e8e824cac136df90ed5054bdd88c16de9699f9fb119e8d2cedb1335fac98d88'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-15-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '38619aeebea5e18be17afcab7cd2b821d8c0680522a5f254640a5aa9f15eb78a',
                                                                                                                      'identity_hash': 'f14112b59a71915292c44b02713b69b1facd8fd220a4a38cae041ce4e96b5778',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '6ffa42ade0a2992956b51789b1cef9058fb8b1fa3fce87bdefd888a71f080807',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '8a86bb8a83d8dc7ddce44e8c5427db471e4a7643efcc2f592b48b55b67555c54'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-none-sat-profile-v1': {'cnf_bytes': 346288251,
                                                                                                                 'cnf_sha256': '084a1f09eb837deae0f10c0ba8a2a6f06e208057ab891e1a1189f7ba70d86a99',
                                                                                                                 'identity_hash': 'ce662c82dd72a421c848add82f75eea983b2e653d37778362be02c6310e30f78',
                                                                                                                 'producer_bytes': 8285,
                                                                                                                 'producer_sha256': 'd93baf77c9b3939aca868d5d49d977d5ca946c18919bbaa8ec7edeced9a3c813',
                                                                                                                 'wave_bytes': 1580,
                                                                                                                 'wave_sha256': '64a9558909450f5f24f374e810328952ea20791976ff3b314a160ac7d07804c5'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-06-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '918b1fc52a0f53a216ce65e23050690d7a00b0de53faeef923c552d2ecaf1609',
                                                                                                                      'identity_hash': 'e7b3d319bb7155a105675f59f2feba34e8f6f013f52ae42977159c7fb5f478bc',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '2f51472f1970d496c1fc2a3545f932c07f2ea92520c8e8a1104b73ec704f25eb',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'a63c680f02f76d262472764151e95a6483940d404db30691196a1223d962f4af'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-07-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '0e424a6c7259094fcb290d1472547a318e76dc071874e32ca73fc2ee26d8db1b',
                                                                                                                      'identity_hash': '35757c3710e7637d61c3c6b229761fd837cf92cbaea0dd86e64eb9e446963dad',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '37bb9d01d626d8cedac02ed134bac57949018ec83d1fcf8738be881b5c93271d',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '3235c41940c8007c5176ace00ce9323d0f3e9748defa321772be887a37caeaa8'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-08-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': 'f55b97351383db6760f05cb8553f32051363d8f1afbd0213308e9bc6e773695e',
                                                                                                                      'identity_hash': '4fb5daf1a29c35ab92c4b32dcccf84bed805e266d267e4b6d3f1a69aeb8c018b',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '69563eb22fe6b3279a6b97690e71a591807a2ab725edd0dde81efe3dca173e43',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': '380d80538a6bcc0cc5b5b11ab36a8e89e730fdc16eb9ab93e56fee345823bbff'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-09-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '8c634192b75beb22b67bc7ef7df9e10c78036b64671564603bc8ace2d7acc8c9',
                                                                                                                      'identity_hash': 'b3380e8951229a6e4ecf9981bc7464ae38f5c3a5253bea0657443c43095652c4',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': '4812cd257a6387e4cb1efd6f9c74b748f02993d1a3845afb8681d01e37d18c71',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'b872ceee989fa145fb41a18cb57e996986baf54971d1df84878c215ef8b84d0c'},
 'canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-16-physical-unique-10-sat-profile-v1': {'cnf_bytes': 346288250,
                                                                                                                      'cnf_sha256': '481dc691cd1ff180ad7eae2d333ff1b19095a6f5a4a273eb5257ad9604e1812c',
                                                                                                                      'identity_hash': '01a8514f5c2ff5a29befa0d3c3ef36cc5c521c063a2478d31fe172aba187929e',
                                                                                                                      'producer_bytes': 8300,
                                                                                                                      'producer_sha256': 'e4a807daf7f482769f10b5bd46f87e6fd8d4a368ed1a7bdfc324ffa34918ee47',
                                                                                                                      'wave_bytes': 1590,
                                                                                                                      'wave_sha256': 'd9c43edf8f7182ac8968b3a9b5533da438d6b69f155f67763c3e956db1e467a8'}}
NUM_VARIABLES = 308
ROOT_NUM_CLAUSES = 7_409_516
NUM_CLAUSES = 7_409_522
CELL_COUNT = 76
NAMED_ORDER_TABLES = {
    0: (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    1: (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
}
REQUESTED_CORE_LIMIT = 1
MAX_ACTIVE_JOBS = 12
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
MAX_POLLS = 2_400
POLL_INTERVAL_S = 2.0
MINE_VERIFICATION_TIMEOUT_S = 1_800
BACKEND = "cadical"
SOLVER_PROFILE = "sat"
SOURCE_SOLVER_PROFILE = "unsat"
QUERY_POLARITY = "UNSAT_MEANS_OBSTRUCTION"
PROJECT = (
    "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-v1"
)

SOURCE_CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-physical-slice-campaign/v1"
CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-profile-campaign/v4"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-profile-launch/v1"
RESULT_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-canary-acceptance/v1"
SAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-independent-sat-replay/v1"
WAVE_MINE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-wave-only-mine/v1"
WAVE_MINE_LEDGER_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-wave-only-candidate-ledger/v2"
WAVE_MINE_CANDIDATE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-wave-only-candidate/v1"
MINE_VERIFICATION_SCHEMA = "p97-exact17-survivor-four-point-two-circle-refinements-source-valid-theorem-mine-verification/v1"
IDENTITY_DERIVATION_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-sat-profile-identity-derivation/v1"
UNSAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-independent-unsat-replay/v1"
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "preparation-config/v1"
)
CANARY_SOURCE_CELL_ID = "canary-perp-bisector-survivor-four-point-two-circle-refinements-next-center-02-physical-none"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-sat-profile-v1"
DIRECT_SENTINELS = frozenset(
    {
        (0, "none"),
        (0, "unique-06"),
        (2, "none"),
        (6, "none"),
        (16, "unique-10"),
    }
)

CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-v1")

_HEX = frozenset("0123456789abcdef")
_TERMINAL_RESULT_KEYS = frozenset(
    {
        "portfolio_cell_id",
        "job_id",
        "outcome",
        "terminal_record_sha256",
        "journal_record_count",
        "seal_sha256",
    }
)


class PortfolioRunnerError(RuntimeError):
    """The authenticated campaign or gated execution failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise PortfolioRunnerError(message)


def _digest(value: Any, label: str) -> str:
    _require(
        type(value) is str and len(value) == 64 and all(char in _HEX for char in value),
        f"{label} must be lowercase SHA-256",
    )
    return value


def _strict_json(raw: bytes, label: str) -> dict[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicate(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            object_pairs_hook=reject_duplicate,
            parse_constant=reject_constant,
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise PortfolioRunnerError(f"{label} is not strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    _require(canonical_json_bytes(value) == raw, f"{label} is not canonical JSON")
    return value


def _strict_repo_json(raw: bytes, label: str) -> dict[str, Any]:
    """Accept canonical repository JSON with its conventional single final LF."""

    payload = raw[:-1] if raw.endswith(b"\n") else raw
    return _strict_json(payload, label)


def _require_exact_keys(
    value: Any, expected: set[str] | frozenset[str], label: str
) -> dict[str, Any]:
    _require(
        type(value) is dict and set(value) == set(expected),
        f"{label} schema drifted",
    )
    return value


def _self_hash(payload: Mapping[str, Any], field: str = "manifest_sha256") -> str:
    unsigned = {key: value for key, value in payload.items() if key != field}
    return sha256_bytes(canonical_json_bytes(unsigned))


def _relative(root: Path, path: Path) -> str:
    try:
        return path.resolve().relative_to(root.resolve()).as_posix()
    except ValueError as exc:
        raise PortfolioRunnerError("path escapes the authenticated root") from exc


def _safe_path(root: Path, relative: Any, label: str) -> Path:
    _require(type(relative) is str and relative, f"{label} path is invalid")
    pure = PurePosixPath(relative)
    _require(
        not pure.is_absolute() and ".." not in pure.parts and "." not in pure.parts,
        f"{label} path escapes its root",
    )
    target = root / pure
    _relative(root, target)
    return target


def _read_private_file(path: Path, *, maximum: int, label: str) -> bytes:
    try:
        before = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} is missing") from exc
    _require(stat.S_ISREG(before.st_mode), f"{label} is not a regular file")
    _require(before.st_nlink == 1, f"{label} is linked")
    _require(before.st_mode & 0o077 == 0, f"{label} is not private")
    _require(before.st_size <= maximum, f"{label} exceeds its byte bound")
    try:
        descriptor = os.open(
            path,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
        )
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} cannot be opened safely") from exc
    try:
        held = os.fstat(descriptor)
        _require(
            (held.st_dev, held.st_ino, held.st_mode, held.st_nlink)
            == (before.st_dev, before.st_ino, before.st_mode, before.st_nlink),
            f"{label} identity changed",
        )
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1 << 20, maximum + 1 - total))
            if not chunk:
                break
            total += len(chunk)
            _require(total <= maximum, f"{label} exceeds its byte bound")
            chunks.append(chunk)
        after = os.fstat(descriptor)
        _require(
            (after.st_dev, after.st_ino, after.st_size)
            == (held.st_dev, held.st_ino, total),
            f"{label} changed while read",
        )
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _read_repo_source_file(path: Path, *, maximum: int, label: str) -> bytes:
    """Descriptor-read immutable Git source while permitting mode 0644."""

    try:
        before = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} is missing") from exc
    _require(stat.S_ISREG(before.st_mode), f"{label} is not a regular file")
    _require(before.st_nlink == 1, f"{label} is linked")
    _require(before.st_mode & 0o022 == 0, f"{label} is group/world writable")
    _require(before.st_uid == os.getuid(), f"{label} has the wrong owner")
    _require(before.st_size <= maximum, f"{label} exceeds its byte bound")
    try:
        descriptor = os.open(
            path,
            os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
        )
    except OSError as exc:
        raise PortfolioRunnerError(f"{label} cannot be opened safely") from exc
    try:
        held = os.fstat(descriptor)
        _require(
            (held.st_dev, held.st_ino, held.st_mode, held.st_nlink, held.st_uid)
            == (
                before.st_dev,
                before.st_ino,
                before.st_mode,
                before.st_nlink,
                before.st_uid,
            ),
            f"{label} identity changed",
        )
        chunks: list[bytes] = []
        total = 0
        while True:
            chunk = os.read(descriptor, min(1 << 20, maximum + 1 - total))
            if not chunk:
                break
            total += len(chunk)
            _require(total <= maximum, f"{label} exceeds its byte bound")
            chunks.append(chunk)
        after = os.fstat(descriptor)
        _require(
            (
                after.st_dev,
                after.st_ino,
                after.st_mode,
                after.st_nlink,
                after.st_uid,
                after.st_size,
                after.st_mtime_ns,
            )
            == (
                held.st_dev,
                held.st_ino,
                held.st_mode,
                held.st_nlink,
                held.st_uid,
                total,
                held.st_mtime_ns,
            ),
            f"{label} changed while read",
        )
        return b"".join(chunks)
    finally:
        os.close(descriptor)


def _read_ref(root: Path, ref: Mapping[str, Any], label: str, maximum: int) -> bytes:
    _require(type(ref) is dict, f"{label} reference is malformed")
    path = _safe_path(root, ref.get("path"), label)
    raw = _read_private_file(path, maximum=maximum, label=label)
    _require(type(ref.get("bytes")) is int, f"{label} byte count is invalid")
    _require(len(raw) == ref["bytes"], f"{label} byte count drifted")
    _require(
        sha256_bytes(raw) == _digest(ref.get("sha256"), label), f"{label} hash drifted"
    )
    return raw


def _require_production_pins() -> None:
    fields = {
        "source campaign hash": SOURCE_CAMPAIGN_SHA256,
        "source run hash": SOURCE_RUN_MANIFEST_SHA256,
        "source preparer commit": SOURCE_PREPARER_COMMIT,
        "source preparer hash": SOURCE_PREPARER_SHA256,
        "production checkpoint hash": CHECKPOINT_SHA256,
        "runner-code checkpoint hash": RUNNER_CODE_CHECKPOINT_SHA256,
        "miner hash": MINER_SHA256,
    }
    _require(PRODUCTION_PINS_FINALIZED is True, "production identities are provisional")
    for label, value in fields.items():
        _require(type(value) is str and value, f"{label} is not finalized")
    for label, value in (
        ("source campaign bytes", SOURCE_CAMPAIGN_BYTES),
        ("source run bytes", SOURCE_RUN_MANIFEST_BYTES),
        ("source preparer bytes", SOURCE_PREPARER_BYTES),
        ("production checkpoint bytes", CHECKPOINT_BYTES),
        ("runner-code checkpoint bytes", RUNNER_CODE_CHECKPOINT_BYTES),
        ("miner bytes", MINER_BYTES),
    ):
        _require(type(value) is int and value > 0, f"{label} is not finalized")
    _require(
        len(SOURCE_PREPARER_COMMIT) == 40
        and all(char in _HEX for char in SOURCE_PREPARER_COMMIT),
        "source preparer commit is not a lowercase full Git identity",
    )
    _require(
        len(SOURCE_CELL_IDENTITIES) == CELL_COUNT
        and len(PRODUCTION_CELL_IDENTITIES) == CELL_COUNT,
        "the 76 cell identity tables are not finalized",
    )
    for value, label in (
        (MINER_NAME, "miner name"),
        (MINER_SCHEMA, "miner schema"),
        (MINER_VERSION, "miner version"),
    ):
        _require(type(value) is str and bool(value), f"{label} is not finalized")
    _require(
        bool(PINNED_SOURCE_VALID_FAMILIES)
        and tuple(sorted(set(PINNED_SOURCE_VALID_FAMILIES)))
        == PINNED_SOURCE_VALID_FAMILIES,
        "source-valid miner family inventory is not finalized",
    )


def _authenticate_runner_support(root: Path = ROOT) -> dict[str, str]:
    """Re-read the governed Python/checkpoint support before any launch route."""

    _require_production_pins()
    observed: dict[str, str] = {}
    for relative, expected_hash, expected_bytes, label in (
        (
            SOURCE_PREPARER_RELATIVE,
            SOURCE_PREPARER_SHA256,
            SOURCE_PREPARER_BYTES,
            "source preparer",
        ),
        (
            CHECKPOINT_RELATIVE,
            CHECKPOINT_SHA256,
            CHECKPOINT_BYTES,
            "production checkpoint",
        ),
        (
            RUNNER_CODE_CHECKPOINT_RELATIVE,
            RUNNER_CODE_CHECKPOINT_SHA256,
            RUNNER_CODE_CHECKPOINT_BYTES,
            "runner-code checkpoint",
        ),
        (MINER_RELATIVE, MINER_SHA256, MINER_BYTES, "wave-only miner"),
    ):
        raw = _read_repo_source_file(
            root / relative,
            maximum=max(expected_bytes, 1 << 20),
            label=label,
        )
        _require(
            len(raw) == expected_bytes
            and sha256_bytes(raw) == _digest(expected_hash, label),
            f"{label} support pin drifted",
        )
        observed[relative] = expected_hash
    checkpoint = _strict_repo_json(
        _read_repo_source_file(
            root / CHECKPOINT_RELATIVE,
            maximum=max(CHECKPOINT_BYTES, 1 << 20),
            label="production checkpoint",
        ),
        "production checkpoint",
    )
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require_exact_keys(
        checkpoint,
        {
            "schema",
            "lane_id",
            "owner",
            "base_head",
            "created_utc",
            "owned_paths",
            "durable_paths",
            "generated_roots",
            "manifest_sha256",
        },
        "production checkpoint",
    )
    _require(
        checkpoint["schema"] == "worktree-lane-checkpoint/v1"
        and checkpoint["lane_id"] == LANE_ID
        and checkpoint["owner"] == RUN_OWNER
        and checkpoint["base_head"] == BASE_HEAD
        and checkpoint["owned_paths"] == [CHECKPOINT_RELATIVE]
        and checkpoint["durable_paths"]
        == sorted(
            [
                MINER_RELATIVE,
                RUNNER_CODE_CHECKPOINT_RELATIVE,
                RUNNER_RELATIVE,
                RUNNER_TEST_RELATIVE,
                SOURCE_PREPARER_RELATIVE,
            ]
        )
        and checkpoint["generated_roots"] == [expected_root]
        and checkpoint["manifest_sha256"] == _self_hash(checkpoint),
        "production checkpoint custody drifted",
    )
    observed["source_preparer_commit"] = SOURCE_PREPARER_COMMIT
    return observed


def _require_source_production_config(
    value: Any, *, source_preparer_commit: str, label: str
) -> None:
    """Bind the source campaign to the successor config and preparer paths."""

    target_code = value.get("target_code") if type(value) is dict else None
    target_preparer = target_code.get("preparer") if type(target_code) is dict else None
    _require(
        type(value) is dict
        and value.get("path") == SOURCE_PREPARATION_CONFIG_RELATIVE
        and value.get("schema") == EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA
        and type(target_code) is dict
        and type(target_preparer) is dict
        and target_preparer.get("path") == EXPECTED_SOURCE_PREPARER_RELATIVE,
        f"{label} source config/preparer path drifted",
    )
    _require(
        target_code.get("commit") == source_preparer_commit,
        f"{label} source preparer commit drifted",
    )


def _transform_source_cell(
    *,
    source_cell: Mapping[str, Any],
    ordinal: int,
    cnf: bytes,
    source_producer_raw: bytes,
    source_wave_raw: bytes,
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Purely validate and transform one authenticated physical cell."""

    source_id = source_cell.get("cell_id")
    _require(type(source_id) is str, "source cell id drifted")
    _require(source_cell.get("ordinal") == ordinal, "source cell ordinal drifted")
    _require(
        type(source_cell.get("direct_lean_bytes_validated")) is bool
        and type(source_cell.get("center")) is int
        and type(source_cell.get("category")) is str,
        "source cell physical/Lean validation drifted",
    )
    source_producer = _strict_json(source_producer_raw, "source producer")
    source_wave = _strict_json(source_wave_raw, "source wave")
    validate_wave_manifest(source_wave)
    variables, clauses = scan_dimacs(cnf)
    _require(
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "source cell DIMACS dimensions drifted",
    )
    source_manifest = source_producer.get("source_manifest")
    production_config = source_producer.get("production_config")
    _require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == EXPECTED_FINITE_SCHEMA,
        "source producer Lean ingress drifted",
    )
    _require_source_production_config(
        production_config,
        source_preparer_commit=source_preparer_commit,
        label="source producer",
    )
    source_encoding = source_wave.get("encoding")
    source_execution = source_wave.get("execution")
    _require(
        source_producer.get("backend") == BACKEND
        and source_producer.get("solver_profile") == SOURCE_SOLVER_PROFILE
        and source_producer.get("query_polarity") == QUERY_POLARITY,
        "source producer profile drifted",
    )
    cnf_sha256 = sha256_bytes(cnf)
    source_producer_sha256 = sha256_bytes(source_producer_raw)
    _require(
        type(source_encoding) is dict
        and source_encoding.get("cnf_sha256") == cnf_sha256
        and source_encoding.get("producer_manifest_sha256") == source_producer_sha256
        and source_encoding.get("num_variables") == NUM_VARIABLES
        and source_encoding.get("num_clauses") == NUM_CLAUSES
        and source_encoding.get("query_polarity") == QUERY_POLARITY
        and type(source_execution) is dict
        and source_execution.get("backend") == BACKEND
        and source_execution.get("solver_profile") == SOURCE_SOLVER_PROFILE,
        "source wave profile or encoding drifted",
    )
    portfolio_id = f"{source_id}-sat-profile-v1"
    producer = dict(source_producer)
    producer["producer_id"] = portfolio_id
    producer["solver_profile"] = SOLVER_PROFILE
    producer["profile_source_producer_manifest_sha256"] = source_producer_sha256
    producer_raw = canonical_json_bytes(producer)
    producer_sha256 = sha256_bytes(producer_raw)
    wave = dict(source_wave)
    wave["wave_id"] = portfolio_id
    wave["encoding"] = {
        **source_wave["encoding"],
        "producer_manifest_sha256": producer_sha256,
    }
    wave["execution"] = {
        **source_wave["execution"],
        "solver_profile": SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
    }
    validate_wave_manifest(wave)
    wave_raw = canonical_json_bytes(wave)
    return {
        "portfolio_cell_id": portfolio_id,
        "source_cell_id": source_id,
        "center": source_cell["center"],
        "category": source_cell["category"],
        "ordinal": ordinal,
        "producer_raw": producer_raw,
        "wave_raw": wave_raw,
        "identity_hash": _legacy.preparation.raw_dimacs_identity(
            cnf_sha256, producer_sha256
        ),
    }


def _require_direct_sentinel_inventory(source_cells: Sequence[Any]) -> None:
    observed: set[tuple[int, str]] = set()
    for source_cell in source_cells:
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        direct = source_cell.get("direct_lean_bytes_validated")
        center = source_cell.get("center")
        category = source_cell.get("category")
        _require(
            type(direct) is bool and type(center) is int and type(category) is str,
            "source cell direct Lean sentinel marker is malformed",
        )
        if direct:
            observed.add((center, category))
    _require(
        frozenset(observed) == DIRECT_SENTINELS,
        "source campaign direct Lean sentinel inventory drifted",
    )


def _derive_identity_bundle(
    *,
    root: Path,
    source_campaign: Mapping[str, Any],
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Descriptor-authenticate all 76 cells and derive both identity tables."""

    _require(
        type(source_preparer_commit) is str
        and len(source_preparer_commit) == 40
        and all(char in _HEX for char in source_preparer_commit),
        "source preparer commit is not a lowercase full Git identity",
    )
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    _require_direct_sentinel_inventory(source_cells)
    transformed: list[dict[str, Any]] = []
    source_identities: dict[str, dict[str, str | int]] = {}
    production_identities: dict[str, dict[str, str | int]] = {}
    for ordinal, source_cell in enumerate(source_cells):
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        source_id = source_cell.get("cell_id")
        _require(
            type(source_id) is str and source_id not in source_identities,
            "source cell id drifted",
        )
        source_refs = {
            "cnf": source_cell.get("cnf"),
            "producer": source_cell.get("producer_manifest"),
            "wave": source_cell.get("wave_manifest"),
        }
        _require(
            all(type(ref) is dict for ref in source_refs.values()),
            "source cell references are malformed",
        )
        cnf = _read_ref(root, source_refs["cnf"], "source cell CNF", 512 << 20)
        source_producer_raw = _read_ref(
            root, source_refs["producer"], "source producer", 4 << 20
        )
        source_wave_raw = _read_ref(root, source_refs["wave"], "source wave", 4 << 20)
        item = _transform_source_cell(
            source_cell=source_cell,
            ordinal=ordinal,
            cnf=cnf,
            source_producer_raw=source_producer_raw,
            source_wave_raw=source_wave_raw,
            source_preparer_commit=source_preparer_commit,
        )
        source_identity = {
            "cnf_sha256": source_refs["cnf"]["sha256"],
            "cnf_bytes": source_refs["cnf"]["bytes"],
            "producer_sha256": source_refs["producer"]["sha256"],
            "producer_bytes": source_refs["producer"]["bytes"],
            "wave_sha256": source_refs["wave"]["sha256"],
            "wave_bytes": source_refs["wave"]["bytes"],
        }
        production_identity = {
            "cnf_sha256": source_refs["cnf"]["sha256"],
            "cnf_bytes": source_refs["cnf"]["bytes"],
            "producer_sha256": sha256_bytes(item["producer_raw"]),
            "producer_bytes": len(item["producer_raw"]),
            "wave_sha256": sha256_bytes(item["wave_raw"]),
            "wave_bytes": len(item["wave_raw"]),
            "identity_hash": item["identity_hash"],
        }
        source_identities[source_id] = source_identity
        production_identities[item["portfolio_cell_id"]] = production_identity
        item["source_refs"] = source_refs
        item["source_identity"] = source_identity
        item["production_identity"] = production_identity
        transformed.append(item)
    _require(
        len(source_identities) == CELL_COUNT
        and len(production_identities) == CELL_COUNT,
        "derived identity tables are incomplete",
    )
    source_identities = dict(sorted(source_identities.items()))
    production_identities = dict(sorted(production_identities.items()))
    return {
        "transformed": transformed,
        "source_cell_identities": source_identities,
        "production_cell_identities": production_identities,
        "source_table_sha256": sha256_bytes(canonical_json_bytes(source_identities)),
        "production_table_sha256": sha256_bytes(
            canonical_json_bytes(production_identities)
        ),
    }


def derive_identities(
    *,
    source_campaign_sha256: str,
    source_campaign_bytes: int,
    source_run_manifest_sha256: str,
    source_run_manifest_bytes: int,
    source_preparer_commit: str,
    root: Path = ROOT,
) -> dict[str, Any]:
    """Read-only, provisional-safe derivation of the two production pin tables."""

    _digest(source_campaign_sha256, "source campaign")
    _digest(source_run_manifest_sha256, "source run manifest")
    _require(
        type(source_campaign_bytes) is int and source_campaign_bytes > 0,
        "source campaign byte count is invalid",
    )
    _require(
        type(source_run_manifest_bytes) is int and source_run_manifest_bytes > 0,
        "source run manifest byte count is invalid",
    )
    source_root = root / SOURCE_RUN_ROOT_RELATIVE
    campaign_raw = _read_private_file(
        source_root / "artifacts/campaign-manifest.json",
        maximum=8 << 20,
        label="source campaign",
    )
    run_raw = _read_private_file(
        source_root / "run_manifest.json",
        maximum=2 << 20,
        label="source run manifest",
    )
    _require(
        len(campaign_raw) == source_campaign_bytes
        and sha256_bytes(campaign_raw) == source_campaign_sha256,
        "source campaign caller pin drifted",
    )
    _require(
        len(run_raw) == source_run_manifest_bytes
        and sha256_bytes(run_raw) == source_run_manifest_sha256,
        "source run manifest caller pin drifted",
    )
    source_campaign = _strict_json(campaign_raw, "source campaign")
    source_run = _strict_json(run_raw, "source run manifest")
    _require(
        source_run.get("schema") == RUN_MANIFEST_SCHEMA
        and source_run.get("root") == SOURCE_RUN_ROOT_RELATIVE,
        "source run custody drifted",
    )
    _require(
        source_run.get("manifest_sha256") == _self_hash(source_run),
        "source run manifest self-hash drifted",
    )
    bundle = _derive_identity_bundle(
        root=root,
        source_campaign=source_campaign,
        source_preparer_commit=source_preparer_commit,
    )
    return {
        "schema": IDENTITY_DERIVATION_SCHEMA,
        "source_campaign_sha256": source_campaign_sha256,
        "source_campaign_bytes": source_campaign_bytes,
        "source_run_manifest_sha256": source_run_manifest_sha256,
        "source_run_manifest_bytes": source_run_manifest_bytes,
        "source_preparer_commit": source_preparer_commit,
        "cell_count": CELL_COUNT,
        "source_cell_identities": bundle["source_cell_identities"],
        "production_cell_identities": bundle["production_cell_identities"],
        "source_table_sha256": bundle["source_table_sha256"],
        "production_table_sha256": bundle["production_table_sha256"],
    }


def prepare_portfolio(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    """Transform the pinned physical campaign to the SAT profile create-once."""

    _require_production_pins()
    _authenticate_runner_support(ROOT)
    source_campaign_path = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
    source_run_path = SOURCE_RUN_ROOT / "run_manifest.json"
    source_campaign_raw = _read_private_file(
        source_campaign_path,
        maximum=8 << 20,
        label="source campaign",
    )
    source_run_raw = _read_private_file(
        source_run_path,
        maximum=2 << 20,
        label="source run manifest",
    )
    source_preparer_raw = _read_repo_source_file(
        ROOT / SOURCE_PREPARER_RELATIVE,
        maximum=2 << 20,
        label="source preparer",
    )
    checkpoint_raw = _read_repo_source_file(
        ROOT / CHECKPOINT_RELATIVE,
        maximum=1 << 20,
        label="production checkpoint",
    )
    runner_code_checkpoint_raw = _read_repo_source_file(
        ROOT / RUNNER_CODE_CHECKPOINT_RELATIVE,
        maximum=1 << 20,
        label="runner-code checkpoint",
    )
    miner_raw = _read_repo_source_file(
        ROOT / MINER_RELATIVE,
        maximum=4 << 20,
        label="wave-only miner",
    )
    runner_raw = _read_repo_source_file(
        ROOT / RUNNER_RELATIVE,
        maximum=4 << 20,
        label="portfolio runner",
    )
    runner_test_raw = _read_repo_source_file(
        ROOT / RUNNER_TEST_RELATIVE,
        maximum=4 << 20,
        label="portfolio runner test",
    )
    for raw, digest, size, label in (
        (
            source_campaign_raw,
            SOURCE_CAMPAIGN_SHA256,
            SOURCE_CAMPAIGN_BYTES,
            "source campaign",
        ),
        (
            source_run_raw,
            SOURCE_RUN_MANIFEST_SHA256,
            SOURCE_RUN_MANIFEST_BYTES,
            "source run manifest",
        ),
        (
            source_preparer_raw,
            SOURCE_PREPARER_SHA256,
            SOURCE_PREPARER_BYTES,
            "source preparer",
        ),
        (
            checkpoint_raw,
            CHECKPOINT_SHA256,
            CHECKPOINT_BYTES,
            "runner checkpoint",
        ),
        (
            runner_code_checkpoint_raw,
            RUNNER_CODE_CHECKPOINT_SHA256,
            RUNNER_CODE_CHECKPOINT_BYTES,
            "runner-code checkpoint",
        ),
        (miner_raw, MINER_SHA256, MINER_BYTES, "wave-only miner"),
    ):
        _require(
            len(raw) == size and sha256_bytes(raw) == _digest(digest, label),
            f"{label} pin drifted",
        )
    source_campaign = _strict_json(source_campaign_raw, "source campaign")
    source_run = _strict_json(source_run_raw, "source run manifest")
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    _require(
        source_run.get("schema") == "worktree-run-manifest/v1"
        and source_run.get("root") == _relative(ROOT, SOURCE_RUN_ROOT),
        "source run custody drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    bundle = _derive_identity_bundle(
        root=ROOT,
        source_campaign=source_campaign,
        source_preparer_commit=SOURCE_PREPARER_COMMIT,
    )
    _require(
        bundle["source_cell_identities"] == SOURCE_CELL_IDENTITIES,
        "source cell identity table drifted",
    )
    _require(
        bundle["production_cell_identities"] == PRODUCTION_CELL_IDENTITIES,
        "SAT-profile cell identity table drifted",
    )
    output_cells: list[dict[str, Any]] = []
    pending_files: list[tuple[Path, bytes, str]] = []
    for item in bundle["transformed"]:
        portfolio_id = item["portfolio_cell_id"]
        producer_raw = item["producer_raw"]
        wave_raw = item["wave_raw"]
        cell_root = output_root / "artifacts/cells" / portfolio_id
        producer_path = cell_root / "producer-manifest.json"
        wave_path = cell_root / "wave-manifest.json"
        pending_files.extend(
            (
                (producer_path, producer_raw, "SAT-profile producer manifest"),
                (wave_path, wave_raw, "SAT-profile wave manifest"),
            )
        )
        output_cell = {
            "portfolio_cell_id": portfolio_id,
            "source_cell_id": item["source_cell_id"],
            "center": item["center"],
            "category": item["category"],
            "ordinal": item["ordinal"],
            "source_cnf": dict(item["source_refs"]["cnf"]),
            "producer_manifest": _file_ref(producer_path, producer_raw, ROOT),
            "wave_manifest": _file_ref(wave_path, wave_raw, ROOT),
            "expected_identity_hash": item["identity_hash"],
        }
        output_cells.append(output_cell)
    campaign = {
        "schema": CAMPAIGN_SCHEMA,
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": CELL_COUNT,
        "execution": {
            "backend": BACKEND,
            "solver_profile": SOLVER_PROFILE,
            "query_polarity": QUERY_POLARITY,
            "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
            "solve_timeout_s": SOLVE_TIMEOUT_S,
            "replay_timeout_s": REPLAY_TIMEOUT_S,
            "maximum_active_jobs": MAX_ACTIVE_JOBS,
        },
        "source_ingress": {
            "source_theorem": EXPECTED_SOURCE_THEOREM,
            "source_path": EXPECTED_SOURCE_PATH,
            "root_source_path": EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": EXPECTED_FINITE_SCHEMA,
            "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        },
        "cells": output_cells,
    }
    campaign_raw = canonical_json_bytes(campaign)
    input_digests = {
        _relative(ROOT, source_campaign_path): sha256_bytes(source_campaign_raw),
        _relative(ROOT, source_run_path): sha256_bytes(source_run_raw),
        _relative(ROOT, output_root / "artifacts/campaign-manifest.json"): sha256_bytes(
            campaign_raw
        ),
    }
    for source_cell in source_cells:
        for key in ("cnf", "producer_manifest", "wave_manifest"):
            ref = source_cell[key]
            input_digests[ref["path"]] = ref["sha256"]
    run_unsigned = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": _relative(ROOT, output_root),
        "owner": RUN_OWNER,
        "base_head": BASE_HEAD,
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": {
            SOURCE_PREPARER_RELATIVE: sha256_bytes(source_preparer_raw),
            CHECKPOINT_RELATIVE: sha256_bytes(checkpoint_raw),
            RUNNER_CODE_CHECKPOINT_RELATIVE: sha256_bytes(runner_code_checkpoint_raw),
            MINER_RELATIVE: sha256_bytes(miner_raw),
            RUNNER_RELATIVE: sha256_bytes(runner_raw),
            RUNNER_TEST_RELATIVE: sha256_bytes(runner_test_raw),
        },
        "input_digests": dict(sorted(input_digests.items())),
        "created_utc": "2026-08-22T00:00:00Z",
    }
    run_manifest = {
        **run_unsigned,
        "manifest_sha256": sha256_bytes(canonical_json_bytes(run_unsigned)),
    }
    run_raw = canonical_json_bytes(run_manifest)
    for path, raw, label in pending_files:
        _write_once_or_validate(path, raw, label)
    _write_once_or_validate(
        output_root / "artifacts/campaign-manifest.json",
        campaign_raw,
        "SAT-profile campaign",
    )
    _write_once_or_validate(
        output_root / "run_manifest.json", run_raw, "SAT-profile run manifest"
    )
    (output_root / "events").mkdir(mode=0o700, parents=True, exist_ok=True)
    (output_root / "tmp").mkdir(mode=0o700, parents=True, exist_ok=True)
    validate_campaign_payload(campaign, run_manifest)
    return {
        "status": "PREPARED_LOCAL_ONLY",
        "cell_count": CELL_COUNT,
        "campaign_sha256": sha256_bytes(campaign_raw),
        "run_manifest_sha256": sha256_bytes(run_raw),
    }


def _validate_cell(cell: Any, ordinal: int) -> dict[str, Any]:
    _require(type(cell) is dict, "campaign cell is malformed")
    required = {
        "portfolio_cell_id",
        "source_cell_id",
        "center",
        "category",
        "ordinal",
        "source_cnf",
        "producer_manifest",
        "wave_manifest",
        "expected_identity_hash",
    }
    _require(set(cell) == required, "campaign cell keys drifted")
    _require(cell["ordinal"] == ordinal, "campaign cell ordinal drifted")
    _require(type(cell["center"]) is int, "campaign center is invalid")
    _require(
        type(cell["category"]) is str and cell["category"],
        "campaign category is invalid",
    )
    _require(type(cell["source_cell_id"]) is str, "source cell id is invalid")
    _require(
        cell["portfolio_cell_id"] == f"{cell['source_cell_id']}-sat-profile-v1",
        "portfolio cell id is not derived from its source cell",
    )
    _digest(cell["expected_identity_hash"], "cell raw identity")
    for key in ("source_cnf", "producer_manifest", "wave_manifest"):
        ref = cell[key]
        _require(
            type(ref) is dict and set(ref) == {"path", "sha256", "bytes"},
            f"{key} ref keys drifted",
        )
        _digest(ref.get("sha256"), key)
        _require(
            type(ref.get("bytes")) is int and ref["bytes"] > 0, f"{key} bytes invalid"
        )
    return dict(cell)


def validate_campaign_payload(
    campaign: Mapping[str, Any], run_manifest: Mapping[str, Any]
) -> dict[str, Any]:
    """Validate the complete finite layout without touching PIQD."""

    _require(
        set(campaign)
        == {"schema", "status", "cell_count", "execution", "source_ingress", "cells"},
        "campaign keys drifted",
    )
    _require(campaign.get("schema") == CAMPAIGN_SCHEMA, "campaign schema drifted")
    _require(campaign.get("status") == "PREPARED_LOCAL_ONLY", "campaign status drifted")
    _require(campaign.get("cell_count") == CELL_COUNT, "campaign cell count drifted")
    execution = campaign.get("execution")
    expected_execution = {
        "backend": BACKEND,
        "solver_profile": SOLVER_PROFILE,
        "query_polarity": QUERY_POLARITY,
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "solve_timeout_s": SOLVE_TIMEOUT_S,
        "replay_timeout_s": REPLAY_TIMEOUT_S,
        "maximum_active_jobs": MAX_ACTIVE_JOBS,
    }
    _require(execution == expected_execution, "campaign execution policy drifted")
    ingress = campaign.get("source_ingress")
    _require(
        ingress
        == {
            "source_theorem": EXPECTED_SOURCE_THEOREM,
            "source_path": EXPECTED_SOURCE_PATH,
            "root_source_path": EXPECTED_ROOT_SOURCE_PATH,
            "finite_schema": EXPECTED_FINITE_SCHEMA,
            "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        },
        "campaign Lean ingress drifted",
    )
    raw_cells = campaign.get("cells")
    _require(
        type(raw_cells) is list and len(raw_cells) == CELL_COUNT,
        "campaign cells drifted",
    )
    cells = [_validate_cell(cell, ordinal) for ordinal, cell in enumerate(raw_cells)]
    ids = [cell["portfolio_cell_id"] for cell in cells]
    roles = [(cell["center"], cell["category"]) for cell in cells]
    _require(len(set(ids)) == CELL_COUNT, "campaign cell ids are not unique")
    _require(len(set(roles)) == CELL_COUNT, "campaign physical roles are not unique")
    canaries = [
        cell for cell in cells if cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
    ]
    _require(
        len(canaries) == 1
        and canaries[0]["center"] == 2
        and canaries[0]["category"] == "none",
        "center2/none canary is missing or duplicated",
    )
    _require(
        set(run_manifest)
        == {
            "schema",
            "lane_id",
            "run_id",
            "root",
            "owner",
            "base_head",
            "output_classes",
            "source_digests",
            "input_digests",
            "created_utc",
            "manifest_sha256",
        },
        "run manifest keys drifted",
    )
    _require(
        run_manifest.get("schema") == RUN_MANIFEST_SCHEMA, "run manifest schema drifted"
    )
    _require(run_manifest.get("lane_id") == LANE_ID, "run manifest lane drifted")
    _require(run_manifest.get("run_id") == RUN_ID, "run manifest id drifted")
    _require(
        run_manifest.get("base_head") == BASE_HEAD, "run manifest base head drifted"
    )
    expected_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require(
        run_manifest.get("root") == expected_root
        and run_manifest.get("owner") == RUN_OWNER
        and run_manifest.get("output_classes") == ["artifacts", "events", "tmp"],
        "run manifest fixed layout drifted",
    )
    _require(
        run_manifest.get("created_utc") == "2026-08-22T00:00:00Z",
        "run manifest creation time drifted",
    )
    _require(
        type(run_manifest.get("source_digests")) is dict
        and type(run_manifest.get("input_digests")) is dict,
        "run manifest digest maps are malformed",
    )
    for map_name in ("source_digests", "input_digests"):
        for relative, digest in run_manifest[map_name].items():
            _require(
                type(relative) is str and relative and not relative.startswith("/"),
                f"run manifest {map_name} path is invalid",
            )
            _digest(digest, f"run manifest {map_name} digest")
    _require(
        run_manifest["input_digests"].get(
            f"{expected_root}/artifacts/campaign-manifest.json"
        )
        == sha256_bytes(canonical_json_bytes(campaign)),
        "run manifest campaign binding drifted",
    )
    _require(
        run_manifest.get("manifest_sha256") == _self_hash(run_manifest),
        "run manifest self-hash drifted",
    )
    return {
        "campaign": dict(campaign),
        "run_manifest": dict(run_manifest),
        "cells": cells,
    }


def _authoritative_input_digests(
    root: Path, run_root: Path, campaign_raw: bytes
) -> dict[str, str]:
    """Reconstruct every immutable input named by the prepared run."""

    expected_output_root = f"scratch/runs/{LANE_ID}/{RUN_ID}"
    _require(
        _relative(root, run_root) == expected_output_root,
        "SAT-profile output root drifted",
    )
    source_root = root / SOURCE_RUN_ROOT_RELATIVE
    source_campaign_path = source_root / "artifacts/campaign-manifest.json"
    source_run_path = source_root / "run_manifest.json"
    source_campaign_raw = _read_private_file(
        source_campaign_path,
        maximum=8 << 20,
        label="source campaign",
    )
    source_run_raw = _read_private_file(
        source_run_path,
        maximum=2 << 20,
        label="source run manifest",
    )
    _require(
        len(source_campaign_raw) == SOURCE_CAMPAIGN_BYTES
        and sha256_bytes(source_campaign_raw)
        == _digest(SOURCE_CAMPAIGN_SHA256, "source campaign"),
        "source campaign pin drifted",
    )
    _require(
        len(source_run_raw) == SOURCE_RUN_MANIFEST_BYTES
        and sha256_bytes(source_run_raw)
        == _digest(SOURCE_RUN_MANIFEST_SHA256, "source run manifest"),
        "source run manifest pin drifted",
    )
    source_campaign = _strict_json(source_campaign_raw, "source campaign")
    source_run = _strict_json(source_run_raw, "source run manifest")
    _require(
        source_campaign.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and source_campaign.get("status") == "PREPARED_LOCAL_ONLY"
        and source_campaign.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )
    _require(
        source_run.get("schema") == RUN_MANIFEST_SCHEMA
        and source_run.get("root") == SOURCE_RUN_ROOT_RELATIVE,
        "source run custody drifted",
    )
    source_cells = source_campaign.get("cells")
    _require(
        type(source_cells) is list and len(source_cells) == CELL_COUNT,
        "source campaign cells drifted",
    )
    expected: dict[str, str] = {
        _relative(root, source_campaign_path): sha256_bytes(source_campaign_raw),
        _relative(root, source_run_path): sha256_bytes(source_run_raw),
        f"{expected_output_root}/artifacts/campaign-manifest.json": sha256_bytes(
            campaign_raw
        ),
    }
    seen_ids: set[str] = set()
    for ordinal, source_cell in enumerate(source_cells):
        _require(type(source_cell) is dict, "source campaign cell is malformed")
        source_id = source_cell.get("cell_id")
        _require(
            type(source_id) is str
            and source_id not in seen_ids
            and source_cell.get("ordinal") == ordinal,
            "source campaign cell identity drifted",
        )
        seen_ids.add(source_id)
        for key, label, maximum in (
            ("cnf", "source cell CNF", 512 << 20),
            ("producer_manifest", "source producer manifest", 8 << 20),
            ("wave_manifest", "source wave manifest", 8 << 20),
        ):
            ref = source_cell.get(key)
            _require(type(ref) is dict, f"{label} reference is malformed")
            _read_ref(root, ref, label, maximum)
            relative = ref.get("path")
            _require(
                type(relative) is str and relative not in expected,
                "source input path is duplicated",
            )
            expected[relative] = ref["sha256"]
    return dict(sorted(expected.items()))


def static_check(*, root: Path = ROOT, run_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    _require_production_pins()
    support = _authenticate_runner_support(root)
    campaign_raw = _read_private_file(
        run_root / "artifacts/campaign-manifest.json", maximum=4 << 20, label="campaign"
    )
    run_raw = _read_private_file(
        run_root / "run_manifest.json", maximum=1 << 20, label="run manifest"
    )
    campaign = _strict_json(campaign_raw, "campaign")
    run_manifest = _strict_json(run_raw, "run manifest")
    checked = validate_campaign_payload(campaign, run_manifest)
    source_digests = run_manifest["source_digests"]
    governed_sources = {
        SOURCE_PREPARER_RELATIVE: "source preparer",
        CHECKPOINT_RELATIVE: "production checkpoint",
        RUNNER_CODE_CHECKPOINT_RELATIVE: "runner-code checkpoint",
        MINER_RELATIVE: "wave-only miner",
        RUNNER_RELATIVE: "portfolio runner",
        RUNNER_TEST_RELATIVE: "portfolio runner test",
    }
    _require(
        set(source_digests) == set(governed_sources),
        "run manifest governed source set drifted",
    )
    for relative, label in governed_sources.items():
        raw = _read_repo_source_file(
            root / relative,
            maximum=4 << 20,
            label=label,
        )
        _require(
            sha256_bytes(raw) == source_digests[relative],
            f"{label} run-manifest hash drifted",
        )
    _require(
        source_digests.get(SOURCE_PREPARER_RELATIVE)
        == support[SOURCE_PREPARER_RELATIVE]
        and source_digests.get(CHECKPOINT_RELATIVE) == support[CHECKPOINT_RELATIVE]
        and source_digests.get(RUNNER_CODE_CHECKPOINT_RELATIVE)
        == support[RUNNER_CODE_CHECKPOINT_RELATIVE]
        and source_digests.get(MINER_RELATIVE) == support[MINER_RELATIVE]
        and campaign["source_ingress"].get("source_preparer_commit")
        == support["source_preparer_commit"],
        "launch support provenance drifted",
    )
    _require(
        run_manifest["input_digests"]
        == _authoritative_input_digests(root, run_root, campaign_raw),
        "run manifest authoritative input provenance drifted",
    )
    for cell in checked["cells"]:
        identity = PRODUCTION_CELL_IDENTITIES.get(cell["portfolio_cell_id"])
        _require(type(identity) is dict, "prepared cell identity is unpinned")
        observed = {
            "cnf_sha256": cell["source_cnf"]["sha256"],
            "cnf_bytes": cell["source_cnf"]["bytes"],
            "producer_sha256": cell["producer_manifest"]["sha256"],
            "producer_bytes": cell["producer_manifest"]["bytes"],
            "wave_sha256": cell["wave_manifest"]["sha256"],
            "wave_bytes": cell["wave_manifest"]["bytes"],
            "identity_hash": cell["expected_identity_hash"],
        }
        _require(identity == observed, "prepared cell byte identity drifted")
    checked["campaign_sha256"] = sha256_bytes(campaign_raw)
    checked["run_manifest_sha256"] = sha256_bytes(run_raw)
    checked["root"] = str(root)
    checked["run_root"] = str(run_root)
    return checked


def _require_production_cell_identity(cell: Mapping[str, Any]) -> None:
    """Reject any cell not represented byte-for-byte in the frozen table."""

    _require_production_pins()
    identifier = cell.get("portfolio_cell_id")
    expected_production = PRODUCTION_CELL_IDENTITIES.get(identifier)
    source_ref = cell.get("source_cnf")
    producer_ref = cell.get("producer_manifest")
    wave_ref = cell.get("wave_manifest")
    _require(
        type(source_ref) is dict
        and type(producer_ref) is dict
        and type(wave_ref) is dict,
        "cell production references are malformed",
    )
    observed_production = {
        "cnf_sha256": source_ref.get("sha256"),
        "cnf_bytes": source_ref.get("bytes"),
        "producer_sha256": producer_ref.get("sha256"),
        "producer_bytes": producer_ref.get("bytes"),
        "wave_sha256": wave_ref.get("sha256"),
        "wave_bytes": wave_ref.get("bytes"),
        "identity_hash": cell.get("expected_identity_hash"),
    }
    _require(
        type(identifier) is str
        and type(expected_production) is dict
        and expected_production == observed_production,
        "cell is not byte-exactly represented in production identities",
    )


def _load_cell_inputs(
    root: Path, cell: Mapping[str, Any]
) -> tuple[bytes, bytes, dict[str, Any]]:
    _require_production_cell_identity(cell)
    cnf = _read_ref(root, cell["source_cnf"], "cell CNF", 512 << 20)
    producer = _read_ref(root, cell["producer_manifest"], "producer manifest", 4 << 20)
    wave_raw = _read_ref(root, cell["wave_manifest"], "wave manifest", 4 << 20)
    producer_json = _strict_json(producer, "producer manifest")
    production_config = producer_json.get("production_config")
    _require_source_production_config(
        production_config,
        source_preparer_commit=SOURCE_PREPARER_COMMIT,
        label="cell producer",
    )
    wave = _strict_json(wave_raw, "wave manifest")
    validate_wave_manifest(wave)
    variables, clauses = scan_dimacs(cnf)
    _require(
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "cell DIMACS dimensions drifted",
    )
    encoding = wave.get("encoding")
    execution = wave.get("execution")
    _require(
        type(encoding) is dict
        and encoding.get("cnf_sha256") == sha256_bytes(cnf)
        and encoding.get("producer_manifest_sha256") == sha256_bytes(producer)
        and encoding.get("num_variables") == NUM_VARIABLES
        and encoding.get("num_clauses") == NUM_CLAUSES
        and encoding.get("query_polarity") == QUERY_POLARITY,
        "cell wave encoding drifted",
    )
    _require(
        type(execution) is dict
        and execution.get("backend") == BACKEND
        and execution.get("solver_profile") == SOLVER_PROFILE,
        "cell wave execution drifted",
    )
    _require(
        producer_json.get("backend") == BACKEND
        and producer_json.get("solver_profile") == SOLVER_PROFILE
        and producer_json.get("query_polarity") == QUERY_POLARITY,
        "cell producer profile drifted",
    )
    expected_identity = _legacy.preparation.raw_dimacs_identity(
        sha256_bytes(cnf), sha256_bytes(producer)
    )
    _require(
        cell.get("expected_identity_hash") == expected_identity,
        "cell raw identity drifted",
    )
    return cnf, producer, wave


def _authenticate_selected(
    root: Path, selected: Sequence[Mapping[str, Any]]
) -> dict[str, tuple[bytes, bytes, dict[str, Any]]]:
    """Read and authenticate every launch input before PIQD can be mutated."""

    authenticated: dict[str, tuple[bytes, bytes, dict[str, Any]]] = {}
    for cell in selected:
        identifier = str(cell["portfolio_cell_id"])
        _require(identifier not in authenticated, "selected cell is duplicated")
        authenticated[identifier] = _load_cell_inputs(root, cell)
    _require(
        len(authenticated) == len(selected),
        "selected input authentication coverage drifted",
    )
    return authenticated


def _live_daemon_attestation(base_url: str) -> dict[str, Any]:
    """Require a loopback PIQD with the exact SAT-worker capability."""

    _require_production_pins()
    observed = _legacy.live_identity(base_url)
    capacity = _legacy._http_json(base_url, "/projects")
    version = observed.get("version")
    solver = observed.get("solver")
    _require(
        type(version) is dict and type(solver) is dict, "PIQD attestation malformed"
    )
    _require(
        type(capacity.get("max_workers")) is int
        and 1 <= capacity["max_workers"] <= MAX_ACTIVE_JOBS,
        "live PIQD global worker capacity exceeds the twelve-core covenant",
    )
    _require(
        type(capacity.get("committed_workers")) is int
        and 0 <= capacity["committed_workers"] <= capacity["max_workers"],
        "live PIQD committed worker accounting is malformed",
    )
    projects = capacity.get("projects")
    _require(type(projects) is list, "live PIQD project registry is malformed")
    matches = [
        project
        for project in projects
        if type(project) is dict and project.get("name") == PROJECT
    ]
    _require(len(matches) == 1, "exact PIQD project row is missing or duplicated")
    project = matches[0]
    for key in ("min_workers", "running", "queued", "created_at", "updated_at"):
        _require(
            type(project.get(key)) is int and project[key] >= 0,
            f"live PIQD project {key} is malformed",
        )
    _require(
        project["min_workers"] <= capacity["max_workers"],
        "live PIQD project worker floor exceeds daemon capacity",
    )
    _require(
        project.get("ce_scope") is None or type(project.get("ce_scope")) is str,
        "live PIQD project ce_scope is malformed",
    )
    solver_attestation = {
        key: solver.get(key)
        for key in (
            "name",
            "sha256",
            "solver_signature",
            "protocol_version",
            "solver",
            "backend",
            "lane",
            "usable",
        )
    }
    solver_attestation["solver"] = solver.get("solver", solver.get("backend"))
    solver_attestation["backend"] = solver.get("backend", solver.get("solver"))
    attestation = {
        "daemon": version.get("daemon"),
        "solver": solver_attestation,
        "global_worker_capacity": capacity["max_workers"],
        "project": {
            key: project.get(key)
            for key in (
                "name",
                "min_workers",
                "running",
                "queued",
                "created_at",
                "updated_at",
                "ce_scope",
            )
        },
        "fetched_endpoints": ["/version", "/solvers", "/projects"],
    }
    _validate_live_identity_attestation(attestation)
    return attestation


def _validate_live_identity_attestation(value: Any) -> dict[str, Any]:
    identity = _require_exact_keys(
        value,
        {
            "daemon",
            "solver",
            "global_worker_capacity",
            "project",
            "fetched_endpoints",
        },
        "persisted live PIQD identity",
    )
    solver = _require_exact_keys(
        identity["solver"],
        {
            "name",
            "sha256",
            "solver_signature",
            "protocol_version",
            "solver",
            "backend",
            "lane",
            "usable",
        },
        "persisted PIQD solver identity",
    )
    project = _require_exact_keys(
        identity["project"],
        {
            "name",
            "min_workers",
            "running",
            "queued",
            "created_at",
            "updated_at",
            "ce_scope",
        },
        "persisted PIQD project identity",
    )
    _require(
        identity["daemon"] == _legacy.DAEMON_IDENTITY
        and solver["name"] == _legacy.SOLVER_NAME
        and solver["sha256"] == _legacy.SOLVER_SHA256
        and solver["solver_signature"] == _legacy.SOLVER_SIGNATURE
        and solver["protocol_version"] == _legacy.DAEMON_IDENTITY["protocol_version"]
        and solver["solver"] == BACKEND
        and solver["backend"] == BACKEND
        and solver["lane"] == "sat"
        and solver["usable"] is True
        and type(identity["global_worker_capacity"]) is int
        and 1 <= identity["global_worker_capacity"] <= MAX_ACTIVE_JOBS
        and project["name"] == PROJECT
        and all(
            type(project[key]) is int and project[key] >= 0
            for key in (
                "min_workers",
                "running",
                "queued",
                "created_at",
                "updated_at",
            )
        )
        and project["min_workers"] <= identity["global_worker_capacity"]
        and (project["ce_scope"] is None or type(project["ce_scope"]) is str)
        and identity["fetched_endpoints"] == ["/version", "/solvers", "/projects"],
        "persisted live PIQD identity drifted",
    )
    return identity


def _policy() -> DriverPolicy:
    return DriverPolicy(
        max_prepare_attempts=1,
        max_confirm_attempts=1,
        max_polls=MAX_POLLS,
        max_result_attempts=1,
        poll_interval_s=POLL_INTERVAL_S,
        solver_timeout_s=SOLVE_TIMEOUT_S,
        march_timeout_s=SOLVE_TIMEOUT_S,
        project=PROJECT,
        requested_core_limit=REQUESTED_CORE_LIMIT,
    )


def _summary(identifier: str, result: Any) -> dict[str, Any]:
    return {
        "portfolio_cell_id": identifier,
        "job_id": result.job_id,
        "outcome": result.outcome,
        "terminal_record_sha256": result.terminal_record_sha256,
        "journal_record_count": result.journal_record_count,
        "seal_sha256": result.seal_sha256,
    }


def _public_result(result: Mapping[str, Any]) -> dict[str, Any]:
    _require(
        set(_TERMINAL_RESULT_KEYS) <= set(result),
        "terminal result is missing public custody fields",
    )
    return {key: result[key] for key in sorted(_TERMINAL_RESULT_KEYS)}


def _empty_file_identity(path: Path, label: str) -> tuple[int, int, int, int]:
    raw = _read_private_file(path, maximum=0, label=label)
    _require(raw == b"", f"{label} is not empty")
    info = path.lstat()
    return (info.st_dev, info.st_ino, info.st_mode, info.st_nlink)


def _reserve_cell(run_root: Path, identifier: str) -> tuple[Any, Any]:
    _require_production_pins()
    events = run_root / "events"
    events.mkdir(mode=0o700, parents=True, exist_ok=True)
    journal_path = events / f"{identifier}.jsonl"
    lock_path = events / f"{identifier}.jsonl.lock"
    if journal_path.exists() or lock_path.exists():
        _require(
            journal_path.exists() and lock_path.exists(),
            "cell reservation is incomplete",
        )
        return (
            _empty_file_identity(journal_path, "reserved journal"),
            _empty_file_identity(lock_path, "reserved journal lock"),
        )
    events_fd = os.open(events, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        journal = _legacy._create_once(events_fd, f"{identifier}.jsonl")
        lock = _legacy._create_once(events_fd, f"{identifier}.jsonl.lock")
        return journal, lock
    finally:
        os.close(events_fd)


@contextmanager
def _cell_lifecycle_lock(run_root: Path, identifier: str) -> Any:
    """Hold one descriptor-hardened lock across a cell's daemon lifecycle."""

    _require_production_pins()
    events = run_root / "events"
    events.mkdir(mode=0o700, parents=True, exist_ok=True)
    directory = events.lstat()
    _require(
        stat.S_ISDIR(directory.st_mode)
        and directory.st_uid == os.getuid()
        and directory.st_mode & 0o077 == 0,
        "cell lifecycle directory is unsafe",
    )
    path = events / f"{identifier}.lifecycle.lock"
    binding = canonical_json_bytes(
        {
            "schema": f"{LAUNCH_SCHEMA}/cell-lifecycle-lock/v1",
            "portfolio_cell_id": identifier,
        }
    )
    _write_once_or_validate(path, binding, "cell lifecycle lock")
    before = path.lstat()
    descriptor = os.open(path, os.O_RDWR | os.O_NOFOLLOW)
    try:
        held = os.fstat(descriptor)
        _require(
            stat.S_ISREG(held.st_mode)
            and held.st_nlink == 1
            and held.st_uid == os.getuid()
            and held.st_mode & 0o077 == 0
            and (held.st_dev, held.st_ino, held.st_mode, held.st_nlink)
            == (before.st_dev, before.st_ino, before.st_mode, before.st_nlink),
            "cell lifecycle lock is unsafe",
        )
        try:
            fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
        except BlockingIOError as exc:
            raise PortfolioRunnerError(
                f"cell lifecycle is already active: {identifier}"
            ) from exc
        yield
    finally:
        fcntl.flock(descriptor, fcntl.LOCK_UN)
        os.close(descriptor)


def _fresh_run_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    identifier = str(cell["portfolio_cell_id"])
    cnf, producer, wave = _load_cell_inputs(root, cell)
    with _cell_lifecycle_lock(run_root, identifier):
        return _fresh_run_cell_under_lock(
            root, run_root, identifier, cnf, producer, wave, base_url
        )


def _fresh_run_cell_under_lock(
    root: Path,
    run_root: Path,
    identifier: str,
    cnf: bytes,
    producer: bytes,
    wave: Mapping[str, Any],
    base_url: str,
) -> dict[str, Any]:
    _require_production_pins()
    _live_daemon_attestation(base_url)
    journal_identity, lock_identity = _reserve_cell(run_root, identifier)
    journal = _legacy.DescriptorAttemptJournal(
        run_root / "events" / f"{identifier}.jsonl",
        manifest=wave,
        root=root,
        expected_journal_identity=journal_identity,
        expected_lock_identity=lock_identity,
    )
    client = _legacy.FreshOnlyPiqdClient(PiqdRawDimacsClient(base_url))
    try:
        result = PiqdCegarDriver(
            client=client,
            journal=journal,
            policy=_policy(),
            proof_replayer=LeanLratReplayer(
                lean_root=root / "lean",
                work_dir=run_root / "tmp" / f"{identifier}-replay-work",
                timeout_s=REPLAY_TIMEOUT_S,
            ),
            sleep=time.sleep,
        ).run(wave_manifest=wave, cnf=cnf, producer_manifest=producer)
    finally:
        journal.close()
    return _summary(identifier, result)


def _read_journal_records(path: Path, wave: Mapping[str, Any]) -> list[dict[str, Any]]:
    raw = _read_private_file(path, maximum=64 << 20, label="cell journal")
    _require(raw and raw.endswith(b"\n"), "partial journal is empty or torn")
    records: list[dict[str, Any]] = []
    for index, line in enumerate(raw.splitlines(), start=1):
        records.append(_strict_json(line, f"journal record {index}"))
    _driver.validate_attempt_journal(records, manifest=wave)
    artifact_dir = path.with_name(f"{path.name}.artifacts")
    hydrated: list[dict[str, Any]] = []
    for index, record in enumerate(records, start=1):
        checkpoint = _digest(
            record["artifacts"].get("checkpoint_sha256"),
            f"journal record {index} checkpoint",
        )
        event_raw = _read_private_file(
            artifact_dir / checkpoint,
            maximum=2 << 20,
            label=f"journal record {index} event artifact",
        )
        _require(
            sha256_bytes(event_raw) == checkpoint,
            f"journal record {index} event artifact hash drifted",
        )
        event = _strict_json(event_raw, f"journal record {index} event artifact")
        try:
            _driver._validate_event(event)
        except PiqdDriverError as exc:
            raise PortfolioRunnerError(
                f"journal record {index} event artifact is malformed"
            ) from exc
        hydrated_record = dict(record)
        hydrated_record["event"] = event
        hydrated.append(hydrated_record)
    _journal_job_id(hydrated)
    return hydrated


def _journal_job_id(records: Sequence[Mapping[str, Any]]) -> str | None:
    job_ids = {
        record["event"].get("job_id")
        for record in records
        if record["event"].get("job_id") is not None
    }
    _require(len(job_ids) <= 1, "journal contains more than one job identity")
    return None if not job_ids else str(next(iter(job_ids)))


def _prepared_job_from_records(
    records: Sequence[Mapping[str, Any]], cell: Mapping[str, Any], cnf: bytes
) -> PreparedJob:
    prepared = [
        record
        for record in records
        if record["event"].get("phase") == "PREPARE"
        and record["event"].get("disposition") == "SUCCESS"
    ]
    _require(len(prepared) == 1, "partial journal has no unique successful PREPARE")
    event = prepared[0]["event"]
    response = event.get("response")
    _require(type(response) is dict, "partial PREPARE response is malformed")
    job_id = _journal_job_id(records)
    _require(
        job_id is not None and event.get("job_id") == job_id,
        "partial journal job identity is ambiguous",
    )
    _require(
        response.get("existing") is False
        or (
            response.get("existing") is True
            and event.get("detail") == "recovered exact raw identity"
        ),
        "partial journal adopted an unaudited existing PIQD job",
    )
    expected = {
        "backend": BACKEND,
        "solver_profile": SOLVER_PROFILE,
        "cnf_blob_hash": sha256_bytes(cnf),
        "identity_hash": cell["expected_identity_hash"],
        "num_vars": NUM_VARIABLES,
        "num_clauses": NUM_CLAUSES,
    }
    for key, value in expected.items():
        _require(response.get(key) == value, f"partial PREPARE {key} drifted")
    return PreparedJob(
        str(event["job_id"]),
        BACKEND,
        SOLVER_PROFILE,
        sha256_bytes(cnf),
        str(cell["expected_identity_hash"]),
        NUM_VARIABLES,
        NUM_CLAUSES,
        bool(response["existing"]),
        REQUESTED_CORE_LIMIT,
    )


def _open_existing_descriptor_journal(
    root: Path,
    path: Path,
    wave: Mapping[str, Any],
    records: Sequence[Mapping[str, Any]],
) -> Any:
    """Open an existing unsealed attempt through held no-follow descriptors."""

    journal = object.__new__(_legacy.DescriptorAttemptJournal)
    journal.path = path
    journal.manifest = dict(wave)
    journal._raw = _read_private_file(path, maximum=64 << 20, label="resume journal")
    journal.records = [
        {key: value for key, value in record.items() if key != "event"}
        for record in records
    ]
    journal._sealed = None
    journal._events_fd = _legacy._open_directory(
        root, _legacy.preparation._relative(root, path.parent)
    )
    journal._journal_name = path.name
    journal._lock_name = f"{path.name}.lock"
    journal._artifact_name = f"{path.name}.artifacts"
    journal._seal_name = f"{path.name}.seal.json"
    journal._journal_fd = None
    journal._lock_fd = None
    journal._artifact_fd = None
    journal._artifact_identities = {}
    journal._seal_identity = None
    journal._virtual_artifacts = {
        str(wave["encoding"]["cnf_sha256"]),
        str(wave["encoding"]["producer_manifest_sha256"]),
    }
    try:
        journal._journal_fd = journal._open_private_regular(
            journal._journal_name, os.O_RDWR | os.O_APPEND, expected_identity=None
        )
        journal._lock_fd = journal._open_private_regular(
            journal._lock_name, os.O_RDWR, expected_identity=None
        )
        journal._artifact_fd = os.open(
            journal._artifact_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
            dir_fd=journal._events_fd,
        )
        journal._assert_core_custody()
        for name in os.listdir(journal._artifact_fd):
            _digest(name, "resume artifact filename")
            info = os.stat(name, dir_fd=journal._artifact_fd, follow_symlinks=False)
            _require(
                stat.S_ISREG(info.st_mode)
                and info.st_nlink == 1
                and info.st_mode & 0o077 == 0,
                "resume artifact is unsafe",
            )
            journal._artifact_identities[name] = journal._file_identity(info)
        journal._assert_core_custody()
    except BaseException:
        journal.close()
        raise
    return journal


def _assert_resume_paths(run_root: Path, identifier: str) -> None:
    journal = run_root / "events" / f"{identifier}.jsonl"
    lock = run_root / "events" / f"{identifier}.jsonl.lock"
    _read_private_file(journal, maximum=64 << 20, label="resume journal")
    lock_raw = _read_private_file(lock, maximum=0, label="resume journal lock")
    _require(lock_raw == b"", "resume journal lock is not empty")
    artifacts = run_root / "events" / f"{identifier}.jsonl.artifacts"
    try:
        info = artifacts.lstat()
    except OSError as exc:
        raise PortfolioRunnerError("resume artifact directory is missing") from exc
    _require(
        stat.S_ISDIR(info.st_mode) and info.st_nlink >= 2,
        "resume artifact directory is unsafe",
    )
    _require(
        not (run_root / "events" / f"{identifier}.jsonl.seal.json").exists(),
        "sealed cell cannot enter partial resume",
    )


def _confirm_and_refresh(
    client: Any, job: PreparedJob, cnf: bytes
) -> tuple[dict[str, Any] | Mapping[str, Any], str, str | None]:
    _require_production_pins()
    state = client.confirm(job, expected_cnf=cnf)
    payload: dict[str, Any] | Mapping[str, Any] = {"status": state}
    result_name: str | None = None
    if state in {"completed", "failed"}:
        payload = client.status(job.job_id)
        state, result_name = _driver._status_state(payload)
    return payload, state, result_name


def _resume_run_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    _require_production_cell_identity(cell)
    identifier = str(cell["portfolio_cell_id"])
    with _cell_lifecycle_lock(run_root, identifier):
        return _resume_run_cell_under_lock(root, run_root, cell, base_url)


def _resume_run_cell_under_lock(
    root: Path, run_root: Path, cell: Mapping[str, Any], base_url: str
) -> dict[str, Any]:
    _require_production_pins()
    _authenticate_runner_support(root)
    identifier = str(cell["portfolio_cell_id"])
    cnf, producer, wave = _load_cell_inputs(root, cell)
    _live_daemon_attestation(base_url)
    _assert_resume_paths(run_root, identifier)
    journal_path = run_root / "events" / f"{identifier}.jsonl"
    journal_raw = _read_private_file(
        journal_path, maximum=64 << 20, label="resume journal"
    )
    records = _read_journal_records(journal_path, wave) if journal_raw else []
    artifact_dir = run_root / "events" / f"{identifier}.jsonl.artifacts"
    _write_once_or_validate(
        artifact_dir / sha256_bytes(cnf), cnf, "recovery CNF artifact"
    )
    _write_once_or_validate(
        artifact_dir / sha256_bytes(producer),
        producer,
        "recovery producer artifact",
    )
    journal = _open_existing_descriptor_journal(root, journal_path, wave, records)
    _require(journal._sealed is None, "partial resume journal is already sealed")
    client = PiqdRawDimacsClient(base_url)
    driver = PiqdCegarDriver(
        client=client,
        journal=journal,
        policy=_policy(),
        proof_replayer=LeanLratReplayer(
            lean_root=root / "lean",
            work_dir=run_root / "tmp" / f"{identifier}-replay-work",
            timeout_s=REPLAY_TIMEOUT_S,
        ),
        sleep=time.sleep,
    )
    try:
        if records and records[-1]["outcome"] != CHECKPOINT:
            journal.seal()
            return _terminal_cell(root, run_root, cell)
        prepared = [
            record
            for record in records
            if record["event"].get("phase") == "PREPARE"
            and record["event"].get("disposition") == "SUCCESS"
        ]
        if not prepared:
            if not records:
                start_event = _driver._event(
                    phase="DRIVER_START",
                    disposition="SUCCESS",
                    detail="descriptor-bound recovery started",
                    response=_policy().as_dict(),
                )
                start_record = driver._append(
                    event=start_event,
                    outcome=CHECKPOINT,
                    detail="DRIVER_START: descriptor-bound recovery started",
                )
                records.append({**start_record, "event": start_event})
            job = client.prepare_cnf(
                wave_manifest=wave,
                cnf=cnf,
                producer_manifest=producer,
                timeout_s=SOLVE_TIMEOUT_S,
                march_timeout_s=SOLVE_TIMEOUT_S,
                project=PROJECT,
                requested_core_limit=REQUESTED_CORE_LIMIT,
            )
            prepare_event = _driver._event(
                phase="PREPARE",
                disposition="SUCCESS",
                retry_index=0,
                job_id=job.job_id,
                status="prepared",
                detail=(
                    "recovered exact raw identity"
                    if job.existing
                    else "new raw identity"
                ),
                response={
                    "backend": job.backend,
                    "solver_profile": job.solver_profile,
                    "cnf_blob_hash": job.cnf_blob_hash,
                    "identity_hash": job.identity_hash,
                    "num_vars": job.num_vars,
                    "num_clauses": job.num_clauses,
                    "existing": job.existing,
                },
            )
            prepare_record = driver._append(
                event=prepare_event,
                outcome=CHECKPOINT,
                detail=f"PREPARE: recovered job {job.job_id}",
            )
            records.append({**prepare_record, "event": prepare_event})
        job = _prepared_job_from_records(records, cell, cnf)
        client.verify_stored_cnf(job, cnf)
        driver._append(
            event=_driver._event(
                phase="POLL",
                disposition="SUCCESS",
                job_id=job.job_id,
                detail="journal-bound recovery verified exact stored CNF",
            ),
            outcome=CHECKPOINT,
            detail=f"POLL: resumed authenticated job {job.job_id}",
        )
        for poll_index in range(MAX_POLLS):
            payload = client.status(job.job_id)
            state, result_name = _driver._status_state(payload)
            if state == "prepared":
                payload, state, result_name = _confirm_and_refresh(client, job, cnf)
            if state in {"confirmed", "running"}:
                if poll_index + 1 == MAX_POLLS:
                    record = driver._record_error(
                        phase="POLL_TIMEOUT",
                        detail="journal-bound job did not terminate",
                        poll_index=poll_index,
                        job_id=job.job_id,
                        status=state,
                    )
                    return _summary(
                        identifier, driver._finish(record, job_id=job.job_id)
                    )
                time.sleep(POLL_INTERVAL_S)
                continue
            if state == "failed":
                record = driver._record_error(
                    phase="DAEMON_FAILED",
                    detail="journal-bound PIQD job failed",
                    poll_index=poll_index,
                    job_id=job.job_id,
                    status=state,
                    result=result_name,
                    response=payload,
                )
                return _summary(identifier, driver._finish(record, job_id=job.job_id))
            _require(
                state == "completed",
                "PIQD resume returned an invalid lifecycle state",
            )
            if result_name == "SAT":
                return _summary(identifier, driver._finish_sat(job=job, cnf=cnf))
            if result_name == "UNSAT":
                return _summary(
                    identifier,
                    driver._finish_unsat(job=job, cnf=cnf, wave_manifest=wave),
                )
            record = driver._record_error(
                phase="SOLVER_UNKNOWN",
                detail="journal-bound PIQD job completed UNKNOWN",
                poll_index=poll_index,
                job_id=job.job_id,
                status=state,
                result=result_name,
                response=payload,
            )
            return _summary(identifier, driver._finish(record, job_id=job.job_id))
        raise PortfolioRunnerError("resume poll loop ended without a terminal record")
    finally:
        journal.close()


@dataclass(frozen=True)
class CellState:
    kind: str
    result: dict[str, Any] | None = None


def _validate_artifact_directory(path: Path) -> set[str]:
    try:
        info = path.lstat()
    except OSError as exc:
        raise PortfolioRunnerError("cell artifact directory is missing") from exc
    _require(stat.S_ISDIR(info.st_mode), "cell artifact path is not a directory")
    descriptor = os.open(path, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        names = set(os.listdir(descriptor))
        for name in names:
            _digest(name, "cell artifact filename")
            raw = _read_private_file(
                path / name, maximum=8 << 30, label="cell artifact"
            )
            _require(sha256_bytes(raw) == name, "cell artifact content hash drifted")
    finally:
        os.close(descriptor)
    return names


def _terminal_cell(
    root: Path, run_root: Path, cell: Mapping[str, Any]
) -> dict[str, Any]:
    identifier = str(cell["portfolio_cell_id"])
    _, _, wave = _load_cell_inputs(root, cell)
    journal_path = run_root / "events" / f"{identifier}.jsonl"
    records = _read_journal_records(journal_path, wave)
    _empty_file_identity(
        run_root / "events" / f"{identifier}.jsonl.lock", "cell journal lock"
    )
    artifact_names = _validate_artifact_directory(
        run_root / "events" / f"{identifier}.jsonl.artifacts"
    )
    seal_path = run_root / "events" / f"{identifier}.jsonl.seal.json"
    seal_raw = _read_private_file(seal_path, maximum=1 << 20, label="cell seal")
    _require(seal_raw.endswith(b"\n"), "cell seal is not newline-terminated")
    seal = _strict_json(seal_raw[:-1], "cell seal")
    _require(
        seal.get("seal_sha256") == _self_hash(seal, "seal_sha256"),
        "cell seal self-hash drifted",
    )
    _require(
        seal.get("wave_manifest_sha256") == _driver.wave_manifest_sha256(wave),
        "cell seal wave binding drifted",
    )
    terminal = records[-1]
    _require(terminal["outcome"] != CHECKPOINT, "sealed journal is not terminal")
    _require(seal.get("record_count") == len(records), "cell seal count drifted")
    _require(
        seal.get("terminal_attempt_sha256") == terminal["record_sha256"],
        "cell seal terminal drifted",
    )
    _require(
        seal.get("journal_sha256")
        == sha256_bytes(
            _read_private_file(journal_path, maximum=64 << 20, label="cell journal")
        ),
        "cell seal journal hash drifted",
    )
    virtual = {
        str(wave["encoding"]["cnf_sha256"]),
        str(wave["encoding"]["producer_manifest_sha256"]),
    }
    referenced = {
        str(digest)
        for record in records
        for digest in record["artifacts"].values()
        if digest is not None
    }
    _require(
        referenced - virtual <= artifact_names <= referenced | virtual,
        "cell artifact inventory does not match the journal",
    )
    artifacts = terminal["artifacts"]
    if terminal["outcome"] == STRUCTURAL_SAT:
        _require(
            artifacts.get("model_sha256") and artifacts.get("solver_log_sha256"),
            "SAT terminal lacks model/log custody",
        )
    if terminal["outcome"] == CERTIFIED_UNSAT:
        for key in (
            "solver_log_sha256",
            "proof_sha256",
            "proof_checker_sha256",
            "proof_replay_sha256",
        ):
            _require(artifacts.get(key), f"certified UNSAT terminal lacks {key}")
    event = terminal["event"]
    journal_job_id = _journal_job_id(records)
    _require(
        type(event.get("job_id")) is str
        and event["job_id"]
        and event["job_id"] == journal_job_id,
        "terminal job id is missing",
    )
    return {
        "portfolio_cell_id": identifier,
        "job_id": event["job_id"],
        "outcome": terminal["outcome"],
        "terminal_record_sha256": terminal["record_sha256"],
        "journal_record_count": len(records),
        "seal_sha256": seal["seal_sha256"],
        "artifacts": dict(artifacts),
    }


def classify_cell_state(
    root: Path, run_root: Path, cell: Mapping[str, Any]
) -> CellState:
    identifier = str(cell["portfolio_cell_id"])
    base = run_root / "events" / f"{identifier}.jsonl"
    lock = base.with_name(f"{base.name}.lock")
    artifacts = base.with_name(f"{base.name}.artifacts")
    seal = base.with_name(f"{base.name}.seal.json")
    flags = (base.exists(), lock.exists(), artifacts.exists(), seal.exists())
    if flags == (False, False, False, False):
        return CellState("FRESH")
    if flags == (True, True, False, False):
        _empty_file_identity(base, "reserved journal")
        _empty_file_identity(lock, "reserved journal lock")
        return CellState("RESERVED")
    if flags == (True, True, True, False):
        cnf, _, wave = _load_cell_inputs(root, cell)
        raw = _read_private_file(base, maximum=64 << 20, label="cell journal")
        if not raw:
            return CellState("RESUME_PREPARE")
        records = _read_journal_records(base, wave)
        if records[-1]["outcome"] != CHECKPOINT:
            _require(
                _journal_job_id(records) is not None,
                "unsealed terminal lacks a job identity",
            )
            return CellState("RESEAL")
        prepared = [
            record
            for record in records
            if record["event"].get("phase") == "PREPARE"
            and record["event"].get("disposition") == "SUCCESS"
        ]
        if not prepared:
            return CellState("RESUME_PREPARE")
        _prepared_job_from_records(records, cell, cnf)
        return CellState("RESUME")
    if flags == (True, True, True, True):
        result = _terminal_cell(root, run_root, cell)
        return CellState("TERMINAL", result)
    raise PortfolioRunnerError(f"cell {identifier} has ambiguous recovery custody")


def _file_ref(path: Path, raw: bytes, root: Path) -> dict[str, Any]:
    return {
        "path": _relative(root, path),
        "sha256": sha256_bytes(raw),
        "bytes": len(raw),
    }


def _artifact_bytes(
    run_root: Path, identifier: str, digest: Any, label: str, maximum: int
) -> bytes:
    expected = _digest(digest, label)
    path = run_root / "events" / f"{identifier}.jsonl.artifacts" / expected
    raw = _read_private_file(path, maximum=maximum, label=label)
    _require(sha256_bytes(raw) == expected, f"{label} content hash drifted")
    return raw


def _json_mapping(raw: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(
            raw,
            object_pairs_hook=lambda pairs: _unique_pairs(pairs, label),
            parse_constant=lambda value: (_ for _ in ()).throw(ValueError(value)),
        )
    except (UnicodeDecodeError, ValueError, RecursionError) as exc:
        raise PortfolioRunnerError(f"{label} is not valid strict JSON") from exc
    _require(type(value) is dict, f"{label} must be a JSON object")
    return value


def _unique_pairs(pairs: list[tuple[str, Any]], label: str) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        _require(key not in result, f"{label} has a duplicate JSON key")
        result[key] = value
    return result


def _valid_lean_identifier(value: Any) -> bool:
    if type(value) is not str or not value.startswith("Problem97."):
        return False
    parts = value.split(".")
    return all(
        part
        and part.isascii()
        and (part[0].isalpha() or part[0] == "_")
        and all(char.isalnum() or char in "_'" for char in part[1:])
        for part in parts
    )


def _candidate_identity_material(candidate: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "schema": candidate.get("schema"),
        "family": candidate.get("family"),
        "source_valid": candidate.get("source_valid"),
        "lean_consumer": candidate.get("lean_consumer"),
        "support": candidate.get("support"),
        "payload": candidate.get("payload"),
    }


def _candidate_id(candidate: Mapping[str, Any]) -> str:
    family = candidate.get("family")
    return f"{family}:{sha256_bytes(canonical_json_bytes(_candidate_identity_material(candidate)))}"


def _validate_candidate_records(
    candidates: Sequence[Any], family_inventory: Sequence[str]
) -> None:
    expected_keys = {
        "schema",
        "candidate_id",
        "record_sha256",
        "family",
        "source_valid",
        "lean_consumer",
        "support",
        "payload",
    }
    identifiers: list[str] = []
    for candidate in candidates:
        _require(
            type(candidate) is dict and set(candidate) == expected_keys,
            "wave-only candidate record schema drifted",
        )
        family = candidate["family"]
        support = candidate["support"]
        payload = candidate["payload"]
        _require(
            candidate["schema"] == WAVE_MINE_CANDIDATE_SCHEMA
            and type(family) is str
            and family in family_inventory
            and family
            and family.isascii()
            and all(char.islower() or char.isdigit() or char == "-" for char in family)
            and candidate["source_valid"] is True
            and _valid_lean_identifier(candidate["lean_consumer"])
            and type(support) is list
            and type(payload) is dict
            and bool(support or payload),
            "wave-only candidate record content drifted",
        )
        support_keys = [canonical_json_bytes(item) for item in support]
        _require(
            support_keys == sorted(set(support_keys)),
            "wave-only candidate support is not canonical",
        )
        _require(
            all(
                type(atom) is list
                and len(atom) == 2
                and all(type(index) is int and 0 <= index < 17 for index in atom)
                and atom[0] != atom[1]
                for atom in support
            ),
            "wave-only candidate support atom is malformed",
        )
        identifier = candidate["candidate_id"]
        _require(
            type(identifier) is str
            and identifier == _candidate_id(candidate)
            and identifier.startswith(f"{family}:"),
            "wave-only candidate identifier drifted",
        )
        _require(
            candidate["record_sha256"] == _self_hash(candidate, "record_sha256"),
            "wave-only candidate record hash drifted",
        )
        identifiers.append(identifier)
    _require(
        identifiers == sorted(set(identifiers)),
        "wave-only candidate identifiers are not sorted and unique",
    )


_MINE_VERIFY_AUDIT_WRAPPER = r"""
import os
import runpy
import sys

_WRITE_FLAGS = (
    os.O_WRONLY | os.O_RDWR | os.O_APPEND | os.O_CREAT | os.O_TRUNC
)
_MUTATION_EVENTS = {
    "os.chdir", "os.chflags", "os.chmod", "os.chown", "os.fchdir",
    "os.fchmod", "os.fchown", "os.lchflags", "os.lchmod", "os.lchown",
    "os.link", "os.mkdir", "os.putenv", "os.remove", "os.removexattr",
    "os.rename", "os.rmdir", "os.setxattr", "os.symlink", "os.truncate",
    "os.unlink", "os.unsetenv", "os.utime",
}
_PROCESS_EVENTS = {
    "os.fork", "os.forkpty", "os.kill", "os.killpg", "os.posix_spawn",
    "pty.spawn", "signal.pthread_kill",
}

def _deny_side_effects(event, args):
    if event.startswith(("socket.", "subprocess.", "os.exec", "os.spawn")):
        raise RuntimeError("verify-existing side effect denied: " + event)
    if event in _MUTATION_EVENTS or event in _PROCESS_EVENTS or event == "os.system":
        raise RuntimeError("verify-existing side effect denied: " + event)
    if event == "open":
        mode = args[1] if len(args) > 1 else None
        flags = args[2] if len(args) > 2 else 0
        if (
            isinstance(mode, str) and any(char in mode for char in "wax+")
        ) or (isinstance(flags, int) and flags & _WRITE_FLAGS):
            raise RuntimeError("verify-existing file mutation denied")

sys.addaudithook(_deny_side_effects)
script = sys.argv[1]
sys.argv = sys.argv[1:]
runpy.run_path(script, run_name="__main__")
""".strip()


def _validate_scanner_dependencies(value: Any, *, root: Path) -> dict[str, Any]:
    dependencies = _require_exact_keys(
        value,
        set(value) if type(value) is dict else set(),
        "scanner dependency inventory",
    )
    _require(bool(dependencies), "scanner dependency inventory is empty")
    for relative, reference in dependencies.items():
        _safe_path(root, relative, "scanner dependency")
        _require_exact_keys(reference, {"sha256", "bytes"}, "scanner dependency")
        _digest(reference["sha256"], "scanner dependency")
        _require(
            type(reference["bytes"]) is int and reference["bytes"] > 0,
            "scanner dependency byte count is invalid",
        )
    return dependencies


def _validate_mine_inventory(
    ledger: Mapping[str, Any],
    candidates: Sequence[Any],
    canary: Mapping[str, Any],
    assignment_sha256: str,
) -> None:
    inventory = _require_exact_keys(
        ledger.get("family_inventory"),
        {
            "family_candidate_counts",
            "formalized_stage_counts",
            "excluded_diagnostic_stage_counts",
            "complete_equality_component_counts",
            "two_kalmanson_pairing_counts",
        },
        "wave-only family inventory",
    )
    counts = _require_exact_keys(
        inventory["family_candidate_counts"],
        set(PINNED_SOURCE_VALID_FAMILIES),
        "wave-only family candidate counts",
    )
    observed_counts = {
        family: sum(candidate["family"] == family for candidate in candidates)
        for family in PINNED_SOURCE_VALID_FAMILIES
    }
    _require(counts == observed_counts, "wave-only family candidate counts drifted")
    for label in (
        "formalized_stage_counts",
        "excluded_diagnostic_stage_counts",
    ):
        values = inventory[label]
        _require(
            type(values) is dict
            and all(type(key) is str and key for key in values)
            and all(type(count) is int and count >= 0 for count in values.values()),
            f"wave-only {label} is malformed",
        )
    component_counts = _require_exact_keys(
        inventory["complete_equality_component_counts"],
        {
            "candidate_count",
            "component_count",
            "oriented_edge_count",
            "pair_count",
            "row_transition_count",
            "unordered_edge_count",
        },
        "wave-only complete equality component counts",
    )
    _require(
        all(type(count) is int and count >= 0 for count in component_counts.values()),
        "wave-only complete equality component counts are malformed",
    )
    _require(
        component_counts["pair_count"] == component_counts["unordered_edge_count"]
        and component_counts["oriented_edge_count"]
        == 2 * component_counts["unordered_edge_count"]
        and component_counts["candidate_count"] <= component_counts["pair_count"],
        "wave-only complete equality component count relations drifted",
    )
    pairing_counts = _require_exact_keys(
        inventory["two_kalmanson_pairing_counts"],
        {
            "forward_record_count",
            "minimal_forward_support_count",
            "minimal_paired_union_count",
            "minimal_reverse_support_count",
            "paired_union_count",
            "reverse_record_count",
        },
        "wave-only FourPoint two-circle pairing counts",
    )
    _require(
        all(type(count) is int and count >= 0 for count in pairing_counts.values()),
        "wave-only FourPoint two-circle pairing counts are malformed",
    )
    _require(
        pairing_counts["minimal_forward_support_count"]
        <= pairing_counts["forward_record_count"]
        and pairing_counts["minimal_reverse_support_count"]
        <= pairing_counts["reverse_record_count"]
        and pairing_counts["minimal_paired_union_count"]
        <= pairing_counts["paired_union_count"]
        and pairing_counts["paired_union_count"]
        <= pairing_counts["minimal_forward_support_count"]
        * pairing_counts["minimal_reverse_support_count"],
        "wave-only FourPoint two-circle pairing count relations drifted",
    )
    if "two-kalmanson-cancellation" in counts:
        _require(
            counts["two-kalmanson-cancellation"]
            == pairing_counts["minimal_paired_union_count"],
            "wave-only two-Kalmanson candidate count drifted",
        )
    if "perpendicular-bisector-equality-component" in counts:
        _require(
            counts["perpendicular-bisector-equality-component"]
            == component_counts["candidate_count"],
            "wave-only perpendicular-bisector candidate count drifted",
        )
    if "formalized-core-bank" in counts:
        _require(
            counts["formalized-core-bank"]
            == sum(inventory["formalized_stage_counts"].values())
            - sum(inventory["excluded_diagnostic_stage_counts"].values()),
            "wave-only formalized-core candidate count drifted",
        )

    decoded = _require_exact_keys(
        ledger.get("decoded_selectors"),
        {"rows", "nextCenter", "NamedOrder", "order", "assignment_sha256"},
        "wave-only decoded selectors",
    )
    rows = decoded["rows"]
    _require(
        type(rows) is dict and set(rows) == {str(index) for index in range(17)},
        "wave-only decoded rows are incomplete",
    )
    for center in range(17):
        support = rows[str(center)]
        _require(
            type(support) is list
            and len(support) == 4
            and support == sorted(set(support))
            and center not in support
            and all(type(point) is int and 0 <= point < 17 for point in support),
            "wave-only decoded row is malformed",
        )
    order_index = decoded["NamedOrder"]
    _require(
        type(order_index) is int
        and order_index in NAMED_ORDER_TABLES
        and decoded["order"] == list(NAMED_ORDER_TABLES[order_index])
        and decoded["nextCenter"] == canary["center"],
        "wave-only decoded selector binding drifted",
    )
    _require(
        decoded["assignment_sha256"] == _digest(assignment_sha256, "SAT assignment"),
        "wave-only assignment binding drifted",
    )


def _verify_existing_mine(
    *,
    root: Path,
    run_root: Path,
    canary: Mapping[str, Any],
    terminal: Mapping[str, Any],
    campaign_sha256: str,
    run_manifest_sha256: str,
    ledger: Mapping[str, Any],
    receipt_raws: Mapping[str, bytes],
) -> dict[str, Any]:
    """Re-run the exact pinned miner in an isolated, read-only process."""

    miner_path = root / MINER_RELATIVE
    miner_raw = _read_repo_source_file(
        miner_path,
        maximum=max(MINER_BYTES, 1 << 20),
        label="wave-only miner",
    )
    _require(
        len(miner_raw) == MINER_BYTES
        and sha256_bytes(miner_raw) == _digest(MINER_SHA256, "wave-only miner"),
        "wave-only miner support pin drifted before verification",
    )
    command = (
        sys.executable,
        "-I",
        "-B",
        "-c",
        _MINE_VERIFY_AUDIT_WRAPPER,
        str(miner_path),
        "--run-root",
        str(run_root),
        "--cell-id",
        CANARY_PORTFOLIO_CELL_ID,
        "--output-dir",
        str(run_root / "artifacts"),
        "--verify-existing",
    )
    environment = {
        "LANG": "C",
        "LC_ALL": "C",
        "PATH": "/usr/bin:/bin",
        "PYTHONHASHSEED": "0",
        "PYTHONDONTWRITEBYTECODE": "1",
        "PYTHONNOUSERSITE": "1",
    }
    try:
        completed = subprocess.run(
            command,
            cwd=root,
            env=environment,
            stdin=subprocess.DEVNULL,
            capture_output=True,
            timeout=MINE_VERIFICATION_TIMEOUT_S,
            check=False,
            close_fds=True,
            start_new_session=True,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        raise PortfolioRunnerError(
            "pinned miner verification did not complete"
        ) from exc
    _require(
        completed.returncode == 0
        and completed.stderr == b""
        and 0 < len(completed.stdout) <= 64 << 10,
        "pinned miner verification failed",
    )
    verification = _strict_json(completed.stdout, "pinned miner verification")
    _require_exact_keys(
        verification,
        {
            "schema",
            "status",
            "portfolio_cell_id",
            "campaign_sha256",
            "run_manifest_sha256",
            "model_sha256",
            "cnf_sha256",
            "candidate_ledger_sha256",
            "scanner_dependencies_sha256",
            "family_inventory_sha256",
            "decoded_selectors_sha256",
            "receipt_sha256s",
        },
        "pinned miner verification",
    )
    expected_receipts = {
        name: sha256_bytes(raw) for name, raw in sorted(receipt_raws.items())
    }
    _require_exact_keys(
        verification["receipt_sha256s"],
        set(expected_receipts),
        "pinned miner verification receipt hashes",
    )
    _require(
        verification["schema"] == MINE_VERIFICATION_SCHEMA
        and verification["status"] == "PASS"
        and verification["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
        and verification["campaign_sha256"] == campaign_sha256
        and verification["run_manifest_sha256"] == run_manifest_sha256
        and verification["model_sha256"] == terminal["artifacts"]["model_sha256"]
        and verification["cnf_sha256"] == canary["source_cnf"]["sha256"]
        and verification["candidate_ledger_sha256"]
        == expected_receipts["candidate-ledger.json"]
        and verification["scanner_dependencies_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["scanner_dependencies"]))
        and verification["family_inventory_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["family_inventory"]))
        and verification["decoded_selectors_sha256"]
        == sha256_bytes(canonical_json_bytes(ledger["decoded_selectors"]))
        and verification["receipt_sha256s"] == expected_receipts,
        "pinned miner verification binding drifted",
    )
    return verification


def _validated_archived_sat_assignment(
    model_raw: bytes,
    *,
    terminal: Mapping[str, Any],
    cnf: bytes,
) -> list[int]:
    """Validate the exact PIQD SAT-model response schema and replay it.

    PIQD's raw model seam has exactly six keys and no embedded self-hash.  Its
    daemon serialization preserves API field order rather than sorted-key
    canonical order, so the immutable artifact filename and terminal custody
    bind the exact response bytes while strict JSON parsing binds their meaning.
    """

    expected_sha256 = _digest(
        terminal["artifacts"].get("model_sha256"), "archived SAT model"
    )
    _require(
        sha256_bytes(model_raw) == expected_sha256,
        "archived SAT model raw hash drifted",
    )
    model = _json_mapping(model_raw, "archived SAT model")
    _require_exact_keys(
        model,
        {
            "job_id",
            "result",
            "backend",
            "solver_profile",
            "num_assigned",
            "assignment",
        },
        "archived SAT model",
    )
    assignment = model["assignment"]
    _require(
        model["job_id"] == terminal["job_id"]
        and model["result"] == "SAT"
        and model["backend"] == BACKEND
        and model["solver_profile"] == SOLVER_PROFILE
        and type(assignment) is list
        and model["num_assigned"] == NUM_VARIABLES
        and len(assignment) == NUM_VARIABLES
        and all(type(literal) is int and literal != 0 for literal in assignment)
        and {abs(literal) for literal in assignment}
        == set(range(1, NUM_VARIABLES + 1)),
        "archived SAT model binding drifted",
    )
    scan_dimacs(cnf, assignment=assignment)
    return assignment


def _validate_acceptance(
    root: Path,
    run_root: Path,
    checked: Mapping[str, Any],
) -> dict[str, Any]:
    canary = next(
        cell
        for cell in checked["cells"]
        if cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID
    )
    terminal = _terminal_cell(root, run_root, canary)
    path = run_root / "artifacts/canary-acceptance.json"
    raw = _read_private_file(path, maximum=1 << 20, label="canary acceptance")
    payload = _strict_json(raw, "canary acceptance")
    _require_exact_keys(
        payload,
        set(_TERMINAL_RESULT_KEYS)
        | {
            "schema",
            "status",
            "campaign_sha256",
            "run_manifest_sha256",
            "evidence",
            "manifest_sha256",
        },
        "canary acceptance",
    )
    _require(
        payload.get("schema") == ACCEPTANCE_SCHEMA
        and payload.get("status") == "ACCEPTED",
        "canary acceptance status drifted",
    )
    _require(
        payload.get("manifest_sha256") == _self_hash(payload),
        "canary acceptance self-hash drifted",
    )
    for key in _TERMINAL_RESULT_KEYS:
        _require(
            payload.get(key) == terminal.get(key), f"canary acceptance {key} drifted"
        )
    _require(
        payload.get("campaign_sha256") == checked["campaign_sha256"],
        "canary acceptance campaign drifted",
    )
    _require(
        payload.get("run_manifest_sha256") == checked["run_manifest_sha256"],
        "canary acceptance run drifted",
    )
    evidence = payload.get("evidence")
    _require_exact_keys(
        evidence,
        {
            "independent_sat_replay",
            "wave_only_mine",
            "independent_unsat_replay",
        },
        "canary acceptance evidence",
    )
    cnf, producer_raw, wave = _load_cell_inputs(root, canary)
    producer = _strict_json(producer_raw, "canary producer manifest")
    variable_map_sha256 = _digest(
        producer.get("variable_map_sha256"), "canary producer variable map"
    )
    if terminal["outcome"] == STRUCTURAL_SAT:
        _require_exact_keys(
            evidence["independent_sat_replay"],
            {"path", "sha256", "bytes"},
            "SAT replay receipt reference",
        )
        _require_exact_keys(
            evidence["wave_only_mine"],
            {"path", "sha256", "bytes"},
            "wave-only mine receipt reference",
        )
        replay_raw = _read_ref(
            root, evidence.get("independent_sat_replay"), "SAT replay receipt", 4 << 20
        )
        mine_raw = _read_ref(
            root, evidence.get("wave_only_mine"), "wave-only mine receipt", 16 << 20
        )
        replay = _strict_json(replay_raw, "SAT replay receipt")
        mine = _strict_json(mine_raw, "wave-only mine receipt")
        _require_exact_keys(
            replay,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "cnf_sha256",
                "producer_manifest_sha256",
                "wave_manifest_sha256",
                "variable_map_sha256",
                "num_variables",
                "clauses_checked",
                "all_clauses_satisfied",
                "model_sha256",
            },
            "SAT replay receipt",
        )
        _require_exact_keys(
            mine,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "model_sha256",
                "source_valid_only",
                "complete_equality_component_checked",
                "candidate_ledger_sha256",
                "candidate_ledger",
                "candidates_examined",
                "scan_complete",
                "complete_no_candidates",
                "models_mined",
            },
            "wave-only mine receipt",
        )
        model_raw = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["model_sha256"],
            "archived SAT model",
            16 << 20,
        )
        assignment = _validated_archived_sat_assignment(
            model_raw,
            terminal=terminal,
            cnf=cnf,
        )
        assignment_sha256 = sha256_bytes(" ".join(map(str, assignment)).encode())
        _require(
            replay.get("schema") == SAT_REPLAY_SCHEMA
            and replay.get("status") == "PASS"
            and replay.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and replay.get("job_id") == terminal["job_id"]
            and replay.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and replay.get("producer_manifest_sha256")
            == canary["producer_manifest"]["sha256"]
            and replay.get("wave_manifest_sha256") == canary["wave_manifest"]["sha256"]
            and replay.get("variable_map_sha256") == variable_map_sha256
            and replay.get("num_variables") == NUM_VARIABLES
            and replay.get("clauses_checked") == NUM_CLAUSES
            and replay.get("all_clauses_satisfied") is True
            and replay.get("model_sha256") == terminal["artifacts"]["model_sha256"],
            "independent SAT replay receipt drifted",
        )
        _require(
            mine.get("schema") == WAVE_MINE_SCHEMA
            and mine.get("status") == "ACCEPTED"
            and mine.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and mine.get("job_id") == terminal["job_id"]
            and mine.get("model_sha256") == terminal["artifacts"]["model_sha256"]
            and mine.get("source_valid_only") is True
            and mine.get("complete_equality_component_checked") is True,
            "wave-only theorem mine acceptance drifted",
        )
        _digest(mine.get("candidate_ledger_sha256"), "wave-only candidate ledger")
        _require_exact_keys(
            mine["candidate_ledger"],
            {"path", "sha256", "bytes"},
            "wave-only candidate ledger reference",
        )
        ledger_raw = _read_ref(
            root,
            mine.get("candidate_ledger"),
            "wave-only candidate ledger",
            32 << 20,
        )
        _require(
            sha256_bytes(ledger_raw) == mine["candidate_ledger_sha256"],
            "wave-only candidate ledger receipt hash drifted",
        )
        ledger = _strict_json(ledger_raw, "wave-only candidate ledger")
        _require_exact_keys(
            ledger,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "model_sha256",
                "cnf_sha256",
                "producer_manifest_sha256",
                "wave_manifest_sha256",
                "variable_map_sha256",
                "source_valid_only",
                "scan_complete",
                "candidates_examined",
                "complete_no_candidates",
                "scanner",
                "scanner_dependencies",
                "source_valid_family_inventory",
                "family_inventory",
                "decoded_selectors",
                "candidates",
                "manifest_sha256",
            },
            "wave-only candidate ledger",
        )
        _require(
            ledger.get("manifest_sha256") == _self_hash(ledger),
            "wave-only candidate ledger self-hash drifted",
        )
        candidates = ledger.get("candidates")
        scanner = ledger.get("scanner")
        family_inventory = ledger.get("source_valid_family_inventory")
        candidates_examined = ledger.get("candidates_examined")
        _require(
            ledger.get("schema") == WAVE_MINE_LEDGER_SCHEMA
            and ledger.get("status") == "COMPLETE"
            and ledger.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and ledger.get("job_id") == terminal["job_id"]
            and ledger.get("model_sha256") == terminal["artifacts"]["model_sha256"]
            and ledger.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and ledger.get("producer_manifest_sha256")
            == canary["producer_manifest"]["sha256"]
            and ledger.get("wave_manifest_sha256") == canary["wave_manifest"]["sha256"]
            and ledger.get("variable_map_sha256") == variable_map_sha256
            and ledger.get("source_valid_only") is True
            and ledger.get("scan_complete") is True
            and type(candidates) is list
            and type(candidates_examined) is int
            and candidates_examined >= 0
            and candidates_examined == len(candidates)
            and type(mine.get("candidates_examined")) is int
            and mine.get("candidates_examined") == candidates_examined
            and mine.get("scan_complete") is True
            and ledger.get("complete_no_candidates") is (candidates_examined == 0)
            and mine.get("complete_no_candidates") is (candidates_examined == 0),
            "wave-only candidate ledger binding drifted",
        )
        _require(
            type(scanner) is dict
            and scanner
            == {
                "name": MINER_NAME,
                "schema": MINER_SCHEMA,
                "version": MINER_VERSION,
                "source_path": MINER_RELATIVE,
                "source_sha256": MINER_SHA256,
            },
            "wave-only scanner identity is incomplete",
        )
        _require(
            type(family_inventory) is list
            and family_inventory == list(PINNED_SOURCE_VALID_FAMILIES),
            "wave-only source-valid family inventory is incomplete",
        )
        _validate_candidate_records(candidates, family_inventory)
        _validate_scanner_dependencies(ledger.get("scanner_dependencies"), root=root)
        _validate_mine_inventory(
            ledger, candidates, canary, assignment_sha256
        )
        _require(
            type(mine.get("models_mined")) is int and mine["models_mined"] == 1,
            "wave-only theorem mine model count drifted",
        )
        _require(
            evidence.get("independent_unsat_replay") is None,
            "SAT acceptance carries UNSAT evidence",
        )
        _verify_existing_mine(
            root=root,
            run_root=run_root,
            canary=canary,
            terminal=terminal,
            campaign_sha256=checked["campaign_sha256"],
            run_manifest_sha256=checked["run_manifest_sha256"],
            ledger=ledger,
            receipt_raws={
                "candidate-ledger.json": ledger_raw,
                "sat-replay-receipt.json": replay_raw,
                "mine-receipt.json": mine_raw,
                "canary-acceptance.json": raw,
            },
        )
    elif terminal["outcome"] == CERTIFIED_UNSAT:
        _require_exact_keys(
            evidence["independent_unsat_replay"],
            {"path", "sha256", "bytes"},
            "UNSAT replay receipt reference",
        )
        proof_raw = _read_ref(
            root,
            evidence.get("independent_unsat_replay"),
            "UNSAT replay receipt",
            4 << 20,
        )
        proof = _strict_json(proof_raw, "UNSAT replay receipt")
        _require_exact_keys(
            proof,
            {
                "schema",
                "status",
                "portfolio_cell_id",
                "job_id",
                "cnf_sha256",
                "proof_sha256",
                "proof_checker_sha256",
                "proof_replay_sha256",
            },
            "UNSAT replay receipt",
        )
        proof_bytes = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_sha256"],
            "archived LRAT proof",
            8 << 30,
        )
        checker_bytes = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_checker_sha256"],
            "archived Lean checker",
            2 << 30,
        )
        archived_replay_raw = _artifact_bytes(
            run_root,
            CANARY_PORTFOLIO_CELL_ID,
            terminal["artifacts"]["proof_replay_sha256"],
            "archived proof replay receipt",
            16 << 20,
        )
        archived_replay = _strict_json(
            archived_replay_raw, "archived proof replay receipt"
        )
        _require(
            archived_replay.get("verified") is True
            and archived_replay.get("proof_sha256")
            == terminal["artifacts"]["proof_sha256"]
            and type(archived_replay.get("job")) is dict
            and archived_replay["job"].get("id") == terminal["job_id"],
            "archived proof replay binding drifted",
        )
        job = PreparedJob(
            terminal["job_id"],
            BACKEND,
            SOLVER_PROFILE,
            sha256_bytes(cnf),
            str(canary["expected_identity_hash"]),
            NUM_VARIABLES,
            NUM_CLAUSES,
            False,
            REQUESTED_CORE_LIMIT,
        )
        validate_replay_result(
            result=LratReplayResult(
                verified=True,
                checker_source=checker_bytes,
                receipt=archived_replay_raw,
            ),
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        replayer = LeanLratReplayer(
            lean_root=root / "lean",
            work_dir=run_root / "tmp" / "canary-independent-unsat-replay",
            timeout_s=REPLAY_TIMEOUT_S,
        )
        replay_result = replayer.replay(
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        validate_replay_result(
            result=replay_result,
            job=job,
            wave_manifest=wave,
            cnf=cnf,
            proof=proof_bytes,
            proof_sha256=terminal["artifacts"]["proof_sha256"],
        )
        _require(replay_result.verified is True, "independent UNSAT replay failed")
        _require(
            replay_result.checker_source == checker_bytes,
            "independent UNSAT checker source drifted",
        )
        _require(
            proof.get("schema") == UNSAT_REPLAY_SCHEMA
            and proof.get("status") == "CERTIFIED_UNSAT"
            and proof.get("portfolio_cell_id") == CANARY_PORTFOLIO_CELL_ID
            and proof.get("job_id") == terminal["job_id"]
            and proof.get("cnf_sha256") == canary["source_cnf"]["sha256"]
            and proof.get("proof_sha256") == terminal["artifacts"]["proof_sha256"]
            and proof.get("proof_checker_sha256")
            == terminal["artifacts"]["proof_checker_sha256"]
            and proof.get("proof_replay_sha256")
            == terminal["artifacts"]["proof_replay_sha256"],
            "independent UNSAT replay receipt drifted",
        )
        _require(
            evidence.get("independent_sat_replay") is None
            and evidence.get("wave_only_mine") is None,
            "UNSAT acceptance carries SAT evidence",
        )
    else:
        raise PortfolioRunnerError("canary terminal outcome is not acceptable")
    return payload


@contextmanager
def _global_capacity_lease(
    *, capacity_root: Path = GLOBAL_CAPACITY_ROOT, slots: int = MAX_ACTIVE_JOBS
) -> Any:
    """Hold one process-global PIQD core slot across a complete cell lifecycle."""

    _require_production_pins()
    _require(slots == MAX_ACTIVE_JOBS, "global PIQD capacity must remain exactly 12")
    capacity_root.mkdir(mode=0o700, parents=True, exist_ok=True)
    root_info = capacity_root.lstat()
    _require(
        stat.S_ISDIR(root_info.st_mode)
        and root_info.st_mode & 0o077 == 0
        and root_info.st_uid == os.getuid(),
        "global capacity root is unsafe",
    )
    root_fd = os.open(
        capacity_root,
        os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
    )
    held_root = os.fstat(root_fd)
    _require(
        (held_root.st_dev, held_root.st_ino) == (root_info.st_dev, root_info.st_ino),
        "global capacity root identity changed",
    )
    descriptor: int | None = None
    try:
        while descriptor is None:
            for index in range(slots):
                name = f"slot-{index:02d}.lock"
                try:
                    candidate = os.open(
                        name,
                        os.O_RDWR
                        | os.O_CREAT
                        | os.O_EXCL
                        | os.O_NOFOLLOW
                        | getattr(os, "O_CLOEXEC", 0),
                        0o600,
                        dir_fd=root_fd,
                    )
                    os.fsync(root_fd)
                except FileExistsError:
                    candidate = os.open(
                        name,
                        os.O_RDWR | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0),
                        dir_fd=root_fd,
                    )
                try:
                    held = os.fstat(candidate)
                    named = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
                    _require(
                        stat.S_ISREG(held.st_mode)
                        and held.st_nlink == 1
                        and held.st_mode & 0o077 == 0
                        and held.st_uid == os.getuid()
                        and (held.st_dev, held.st_ino) == (named.st_dev, named.st_ino),
                        "global capacity slot is unsafe",
                    )
                    try:
                        fcntl.flock(candidate, fcntl.LOCK_EX | fcntl.LOCK_NB)
                    except BlockingIOError:
                        os.close(candidate)
                        continue
                    descriptor = candidate
                    break
                except BaseException:
                    if descriptor != candidate:
                        os.close(candidate)
                    raise
            if descriptor is None:
                time.sleep(0.05)
        yield
    finally:
        if descriptor is not None:
            fcntl.flock(descriptor, fcntl.LOCK_UN)
            os.close(descriptor)
        os.close(root_fd)


def _bounded_run(
    jobs: Sequence[tuple[str, Mapping[str, Any]]],
    *,
    root: Path,
    run_root: Path,
    base_url: str,
    max_active: int = MAX_ACTIVE_JOBS,
    capacity_root: Path = GLOBAL_CAPACITY_ROOT,
) -> list[dict[str, Any]]:
    _require_production_pins()
    _authenticate_runner_support(root)
    _require(1 <= max_active <= MAX_ACTIVE_JOBS, "active-job bound is invalid")
    identifiers = [str(cell.get("portfolio_cell_id")) for _, cell in jobs]
    _require(len(identifiers) == len(set(identifiers)), "bounded jobs duplicate a cell")
    cell_by_id: dict[str, Mapping[str, Any]] = {}
    for kind, cell in jobs:
        _require(
            kind in {"FRESH", "RESERVED", "RESUME", "RESUME_PREPARE", "RESEAL"},
            "unknown cell recovery state",
        )
        _require_production_cell_identity(cell)
        cell_by_id[str(cell["portfolio_cell_id"])] = cell
    pending = iter(jobs)
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=max_active) as executor:
        active: dict[Future[dict[str, Any]], str] = {}

        def submit_one(item: tuple[str, Mapping[str, Any]]) -> None:
            kind, cell = item
            cell_runner = (
                _fresh_run_cell if kind in {"FRESH", "RESERVED"} else _resume_run_cell
            )

            def leased() -> dict[str, Any]:
                with _global_capacity_lease(capacity_root=capacity_root):
                    return cell_runner(root, run_root, cell, base_url)

            future = executor.submit(leased)
            active[future] = str(cell["portfolio_cell_id"])

        for _ in range(max_active):
            try:
                submit_one(next(pending))
            except StopIteration:
                break
        while active:
            completed, _ = wait(active, return_when=FIRST_COMPLETED)
            for future in completed:
                expected = active.pop(future)
                result = future.result()
                _require(
                    result.get("portfolio_cell_id") == expected,
                    "cell runner returned wrong identity",
                )
                terminal = _terminal_cell(root, run_root, cell_by_id[expected])
                for key in (
                    "portfolio_cell_id",
                    "job_id",
                    "outcome",
                    "terminal_record_sha256",
                    "journal_record_count",
                    "seal_sha256",
                ):
                    _require(
                        result.get(key) == terminal.get(key),
                        f"cell runner {key} disagrees with terminal custody",
                    )
                results.append(terminal)
                try:
                    submit_one(next(pending))
                except StopIteration:
                    pass
    return sorted(results, key=lambda item: item["portfolio_cell_id"])


def _phase_paths(run_root: Path, phase: str) -> tuple[Path, Path, Path]:
    return (
        run_root / "artifacts" / f"{phase}-launch.lock",
        run_root / "artifacts" / f"{phase}-launch-manifest.json",
        run_root / "artifacts" / f"{phase}-result.json",
    )


def _write_once_or_validate(path: Path, raw: bytes, label: str) -> None:
    _require_production_pins()
    path.parent.mkdir(mode=0o700, parents=True, exist_ok=True)
    try:
        descriptor = os.open(
            path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o600
        )
    except FileExistsError:
        _require(
            _read_private_file(path, maximum=max(len(raw), 1 << 20), label=label)
            == raw,
            f"{label} conflicts with existing bytes",
        )
        return
    except OSError as exc:
        raise PortfolioRunnerError(f"cannot create {label}") from exc
    try:
        offset = 0
        while offset < len(raw):
            offset += os.write(descriptor, raw[offset:])
        os.fsync(descriptor)
    finally:
        os.close(descriptor)
    parent = os.open(path.parent, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        os.fsync(parent)
    finally:
        os.close(parent)


def _phase_lock(run_root: Path, phase: str, launch_bytes: bytes) -> int:
    _require_production_pins()
    lock, _, _ = _phase_paths(run_root, phase)
    binding_payload = {
        "schema": f"{LAUNCH_SCHEMA}/lock/v1",
        "phase": phase,
        "launch_sha256": sha256_bytes(launch_bytes),
    }
    binding = canonical_json_bytes(
        {**binding_payload, "manifest_sha256": _self_hash(binding_payload)}
    )
    _write_once_or_validate(lock, binding, f"{phase} launch lock")
    descriptor = os.open(lock, os.O_RDWR | os.O_NOFOLLOW)
    try:
        fcntl.flock(descriptor, fcntl.LOCK_EX | fcntl.LOCK_NB)
    except BaseException:
        os.close(descriptor)
        raise
    return descriptor


def _validated_existing_phase_result(
    *,
    phase: str,
    checked: Mapping[str, Any],
    selected: Sequence[Mapping[str, Any]],
    root: Path,
    run_root: Path,
) -> dict[str, Any] | None:
    """Authenticate a prior phase result before any daemon endpoint is used."""

    _, launch_path, result_path = _phase_paths(run_root, phase)
    if not result_path.exists():
        return None
    result_raw = _read_private_file(
        result_path, maximum=4 << 20, label=f"preexisting {phase} result"
    )
    result = _strict_json(result_raw, f"preexisting {phase} result")
    _require(
        set(result)
        == {
            "schema",
            "phase",
            "campaign_sha256",
            "run_manifest_sha256",
            "launch_sha256",
            "results",
            "manifest_sha256",
        },
        f"preexisting {phase} result keys drifted",
    )
    _require(
        result["manifest_sha256"] == _self_hash(result),
        f"preexisting {phase} result self-hash drifted",
    )
    launch_raw = _read_private_file(
        launch_path, maximum=4 << 20, label=f"preexisting {phase} launch manifest"
    )
    launch = _strict_json(launch_raw, f"preexisting {phase} launch manifest")
    expected_launch = {
        "schema": LAUNCH_SCHEMA,
        "phase": phase,
        "campaign_sha256": checked["campaign_sha256"],
        "run_manifest_sha256": checked["run_manifest_sha256"],
        "selected_cell_ids": [cell["portfolio_cell_id"] for cell in selected],
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "maximum_active_jobs": 1 if phase == "canary" else MAX_ACTIVE_JOBS,
        "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        "canary_acceptance_sha256": checked.get("canary_acceptance_sha256"),
    }
    _validate_live_identity_attestation(launch.get("live_identity"))
    _require(
        result.get("schema") == RESULT_SCHEMA
        and result.get("phase") == phase
        and result.get("campaign_sha256") == checked["campaign_sha256"]
        and result.get("run_manifest_sha256") == checked["run_manifest_sha256"]
        and result.get("launch_sha256") == sha256_bytes(launch_raw)
        and set(launch) == set(expected_launch) | {"live_identity", "manifest_sha256"}
        and launch.get("manifest_sha256") == _self_hash(launch)
        and all(launch.get(key) == value for key, value in expected_launch.items()),
        f"preexisting {phase} launch/result binding drifted",
    )
    states = [(cell, classify_cell_state(root, run_root, cell)) for cell in selected]
    _require(
        all(state.kind == "TERMINAL" for _, state in states),
        f"preexisting {phase} result exists before complete terminal custody",
    )
    expected_results = sorted(
        [
            _public_result(state.result)
            for _, state in states
            if state.result is not None
        ],
        key=lambda item: item["portfolio_cell_id"],
    )
    _require(
        result.get("results") == expected_results,
        f"preexisting {phase} result terminal custody drifted",
    )
    return result


def _execute_phase(
    *,
    phase: str,
    root: Path,
    run_root: Path,
    base_url: str,
    capacity_root: Path = GLOBAL_CAPACITY_ROOT,
) -> dict[str, Any]:
    _require_production_pins()
    _require(phase in {"canary", "rest"}, "unknown gated launch phase")
    checked = static_check(root=root, run_root=run_root)
    checked_cells = checked["cells"]
    selected = [
        cell
        for cell in checked_cells
        if (cell["portfolio_cell_id"] == CANARY_PORTFOLIO_CELL_ID)
        is (phase == "canary")
    ]
    _require(
        (phase == "canary" and len(selected) == 1)
        or (phase == "rest" and len(selected) == CELL_COUNT - 1),
        "phase selection is not the exact governed canary/rest membership",
    )
    if phase == "rest":
        acceptance = _validate_acceptance(root, run_root, checked)
        acceptance_sha256 = sha256_bytes(canonical_json_bytes(acceptance))
        checked["canary_acceptance_validated"] = True
        checked["canary_acceptance_sha256"] = acceptance_sha256
    launch_intent = {
        "schema": LAUNCH_SCHEMA,
        "phase": phase,
        "campaign_sha256": checked["campaign_sha256"],
        "run_manifest_sha256": checked["run_manifest_sha256"],
        "selected_cell_ids": [cell["portfolio_cell_id"] for cell in selected],
        "requested_core_limit_per_job": REQUESTED_CORE_LIMIT,
        "maximum_active_jobs": 1 if phase == "canary" else MAX_ACTIVE_JOBS,
        "source_preparer_commit": SOURCE_PREPARER_COMMIT,
        "canary_acceptance_sha256": checked.get("canary_acceptance_sha256"),
    }
    intent_bytes = canonical_json_bytes(launch_intent)
    _, launch_path, result_path = _phase_paths(run_root, phase)
    lock_fd = _phase_lock(run_root, phase, intent_bytes)
    try:
        _authenticate_selected(root, selected)
        existing = _validated_existing_phase_result(
            phase=phase,
            checked=checked,
            selected=selected,
            root=root,
            run_root=run_root,
        )
        if existing is not None:
            return existing
        live_identity = _validate_live_identity_attestation(
            _live_daemon_attestation(base_url)
        )
        states = [
            (cell, classify_cell_state(root, run_root, cell)) for cell in selected
        ]
        launch_payload = {**launch_intent, "live_identity": live_identity}
        launch = {
            **launch_payload,
            "manifest_sha256": _self_hash(launch_payload),
        }
        launch_bytes = canonical_json_bytes(launch)
        _write_once_or_validate(launch_path, launch_bytes, f"{phase} launch manifest")
        terminal = [
            _public_result(state.result)
            for _, state in states
            if state.kind == "TERMINAL" and state.result is not None
        ]
        jobs = [
            (state.kind, cell) for cell, state in states if state.kind != "TERMINAL"
        ]
        new_results = [
            _public_result(result)
            for result in _bounded_run(
                jobs,
                root=root,
                run_root=run_root,
                base_url=base_url,
                max_active=1 if phase == "canary" else MAX_ACTIVE_JOBS,
                capacity_root=capacity_root,
            )
        ]
        results = sorted(
            terminal + new_results,
            key=lambda item: item["portfolio_cell_id"],
        )
        _require(
            len(results) == len(selected),
            "gated phase did not terminalize every selected cell",
        )
        for cell, result in zip(
            sorted(selected, key=lambda item: item["portfolio_cell_id"]),
            results,
            strict=True,
        ):
            _require(
                result["portfolio_cell_id"] == cell["portfolio_cell_id"],
                "terminal result coverage drifted",
            )
            _require(
                result["outcome"] in {STRUCTURAL_SAT, CERTIFIED_UNSAT},
                "terminal cell did not produce accepted SAT/UNSAT custody",
            )
        result_payload = {
            "schema": RESULT_SCHEMA,
            "phase": phase,
            "campaign_sha256": checked["campaign_sha256"],
            "run_manifest_sha256": checked["run_manifest_sha256"],
            "launch_sha256": sha256_bytes(launch_bytes),
            "results": results,
        }
        payload = {
            **result_payload,
            "manifest_sha256": _self_hash(result_payload),
        }
        result_bytes = canonical_json_bytes(payload)
        _write_once_or_validate(result_path, result_bytes, f"{phase} result")
        return payload
    finally:
        fcntl.flock(lock_fd, fcntl.LOCK_UN)
        os.close(lock_fd)


def start_canary(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _execute_phase(
        phase="canary",
        root=root,
        run_root=run_root,
        base_url=base_url,
    )


def start_rest(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _execute_phase(
        phase="rest",
        root=root,
        run_root=run_root,
        base_url=base_url,
    )


def start(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    del base_url, root, run_root
    raise PortfolioRunnerError(
        "ungated launch is disabled; use start-canary then start-rest"
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Run the gated 76-cell survivor FourPoint-two-circle-refinement SAT portfolio"
        )
    )
    parser.add_argument(
        "command",
        choices=(
            "derive-identities",
            "prepare",
            "static-check",
            "start-canary",
            "start-rest",
        ),
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--source-campaign-sha256")
    parser.add_argument("--source-campaign-bytes", type=int)
    parser.add_argument("--source-run-manifest-sha256")
    parser.add_argument("--source-run-manifest-bytes", type=int)
    parser.add_argument("--source-preparer-commit")
    args = parser.parse_args(argv)
    try:
        if args.command == "derive-identities":
            result = derive_identities(
                source_campaign_sha256=args.source_campaign_sha256,
                source_campaign_bytes=args.source_campaign_bytes,
                source_run_manifest_sha256=args.source_run_manifest_sha256,
                source_run_manifest_bytes=args.source_run_manifest_bytes,
                source_preparer_commit=args.source_preparer_commit,
                root=ROOT,
            )
        elif args.command == "prepare":
            result = prepare_portfolio()
        elif args.command == "static-check":
            result = static_check()
        elif args.command == "start-canary":
            result = start_canary(base_url=args.base_url)
        else:
            result = start_rest(base_url=args.base_url)
    except (
        OSError,
        PortfolioRunnerError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(
            f"survivor FourPoint-two-circle-refinement SAT portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
