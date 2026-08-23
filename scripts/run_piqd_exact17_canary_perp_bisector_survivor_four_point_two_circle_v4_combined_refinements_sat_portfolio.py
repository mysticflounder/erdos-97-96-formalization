# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor FourPoint-two-circle-v4-combined-refinement physical cells.

The production byte identities remain provisional until an authenticated source
campaign is frozen.  The runner admits exactly the 308-variable,
7,409,766-clause cells derived from the 7,409,760-clause root.  It launches
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

LANE_ID = "exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-sat-portfolio-v5-20260822"
RUN_ID = "sat-profile-portfolio-v5"
RUN_OWNER = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-sat-portfolio-v5"
)
BASE_HEAD = "92552069e052ec89639e9c945327f9a82d2c22ce"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-fourpoint-v5-runner-miner-code-20260822.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-fourpoint-v4-combined-physical-sat-portfolio-v5-20260822.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "v4_combined_refinements_physical_slice_cells.py"
)
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = (
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-"
    "preparation-config.json"
)
RUNNER_RELATIVE = "scripts/run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinements_sat_portfolio.py"
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v4_combined_refinements_sat_portfolio.py"
)
MINER_RELATIVE = "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinements_sat_model.py"
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "v4-combined-refinements-preparer-20260822/preparation-v1"
)
EXPECTED_SOURCE_LANE_ID = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-"
    "refinements-preparer-20260822"
)
EXPECTED_SOURCE_RUN_ID = "preparation-v1"
EXPECTED_SOURCE_BASE_HEAD = "1730c811aa50dd83c5836262c66e34a263d3d40d"
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# Frozen from the authenticated `preparation-v1` source export and the
# governed v5 runner/miner support files.
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = "e2adff5b6e136a96b9de3764619b4e25e39f3d21c52e78dd8da5ab21914a65a5"
SOURCE_CAMPAIGN_BYTES = 129_390
SOURCE_RUN_MANIFEST_SHA256 = "7afd441a9674a9cf101bcffb6d2f580ec67c98bea449b896da395a15b0e3bd74"
SOURCE_RUN_MANIFEST_BYTES = 2_635
SOURCE_PREPARER_COMMIT = "d6add9c98563e3858eec70e919547f8264eb4871"
SOURCE_PREPARER_SHA256 = "887d0b0ca1b4971f3d17750d09744911cecaf2ca04c83ba68782790ce4674b61"
SOURCE_PREPARER_BYTES = 121_692
CHECKPOINT_SHA256 = "18bb9de2a6a9d5c4feb2566e6be945da0d49e1c9758dfcc7cd2eaddb0a974a6b"
CHECKPOINT_BYTES = 1_321
RUNNER_CODE_CHECKPOINT_SHA256 = "16e252a56d3026ff45f6ba62e54fff5e44ad40ca081c6b3b9778b08b7e6c8f12"
RUNNER_CODE_CHECKPOINT_BYTES = 949
MINER_SHA256 = "d074010dd81be4553cc2b04f90121391f6d8b483aebd9686a11814044f15cbda"
MINER_BYTES = 53_608
MINER_NAME = "exact17-survivor-four-point-two-circle-v4-combined-v5-source-valid-theorem-miner"
MINER_SCHEMA = (
    "p97-exact17-survivor-four-point-two-circle-v4-combined-v5-source-valid-theorem-miner/v1"
)
MINER_VERSION = "5"
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-none': {'cnf_bytes': 346303087,
                                                                                                              'cnf_sha256': '680b2a6a80fa45301d7f7903a2bd2d7962de27a633f5c5a28ea495c7eace3f67',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '3d9ecd7473bf8d6fc9b51226d9bead10c6bd07cfcb929112c520a557db6b68f6',
                                                                                                              'wave_bytes': 1637,
                                                                                                              'wave_sha256': '63e262858a2da0e9f3edb3a328fb8b4700d593a439ecf3936ec515b943290ace'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-06': {'cnf_bytes': 346303086,
                                                                                                                   'cnf_sha256': '87016790bb5ea08b72e70fd3e70bd91e79765ffcf3210807c528e0611f9f5f61',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '43e17180fea5724cf28742319b7f6bd1ce8637d04e4fd3b51050e7cd8b327e82',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': 'd7a0dbe7f045d79d7ee679731340a12197d74d1d543a88c395142de6acaabf24'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-07': {'cnf_bytes': 346303086,
                                                                                                                   'cnf_sha256': '4733f7b1cfd8fbff46e23a60853fef07fa5f65431fb0556886ecb3f40daaf2ca',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'fe1cee7e3b002a368a38f2ea1134b948961105e7b015687899cfc30c7012cbc4',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': 'fd13a73ec4a24a73513ae70619034b1a3e31717bf436f5b85b68dd437158bc73'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-08': {'cnf_bytes': 346303086,
                                                                                                                   'cnf_sha256': '0f1510d35a2a9b9efb8649cbb7254384f7a167de1890c0772d92aeeb1e3fb520',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'f097c3941ea6bafe811bc60d350918acc13c9bb2452440fb9159573c4c65c433',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': '0038049f5204bfedcfd708e3289ec284250619b1777367c0fa1d6a0190dd1c22'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-09': {'cnf_bytes': 346303086,
                                                                                                                   'cnf_sha256': 'ea2138b765a660cfe872efce37f16affdfdb5ba63253dd6253e112bceb187b55',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '794eccb72965da4c9a77ee621272d8a28c94df3176e654f22c83db311604300c',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': '246ffb303e02cd6346a3cbd4cc551dd6b2002b7ac091df7862564bca5732cf57'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-10': {'cnf_bytes': 346303086,
                                                                                                                   'cnf_sha256': 'd4c6a7466e6284636f59f191c1bdec1d12b78324124083d1e8ae237c81e90c30',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '74d49faf11863f799c3c79759c255bbc8b4e81c9312b81b79a01b4a962d97a4c',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': 'b332d7dc62e745c29d03335532fc29592a4e5f7c337d90096f42600c14d8d927'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-none': {'cnf_bytes': 346303090,
                                                                                                              'cnf_sha256': '5d26ecd85680bbfb2571569e9b1bffafa7b16981cfb4c7c8e6d9c1401d7b257d',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '1b9aee7765a78d244f04fb1a77901be2fe4ebb42187036ecffc379361bfda79f',
                                                                                                              'wave_bytes': 1637,
                                                                                                              'wave_sha256': '0b54ada9cbf0acaf231ed3b999ea63d90c0433fc58977794983091daffa6114f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-06': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '93f24b7b662e096730f7e3960a827e1440c6a2bfc14dd5f05514469ffaeb788c',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd7de6ffe06b849a7faea699e775fa41b60a486197f41a7dd3e38b8895bee49ba',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': 'f66929fcd0dcbde4a78b69d679204704c5fc5a2c961bc0cef79d7357f44fa5e0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-07': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'e756755080e7e168743eb8e909062a69e0bb253ab8ffc997535b93a6a95f09db',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '6857c3924c72a60fd4b239da8f343227af3bc78397b4eacca4145cd3b3a9a18f',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': '91b457510d9d4c743b153ae99b48268238d236ac0c591f031a8891f1ec10cfd9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-08': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '1283a054d7d3aa6fbfab043ced3ba6b0d7e94efc93889c209804acee61fe279d',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'f5b8145a7ffe5fd3ea97d067eabec23d99811e762cd925a46bdf1c0bbc76fa4f',
                                                                                                                   'wave_bytes': 1647,
                                                                                                                   'wave_sha256': '7469e3746420dd539dd15f80b12c1c96e2c48c966afa18b09070a3ac79e74362'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-09': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '2ed535ebc34cda90d7d52e4d03d8bf94dc53a9980d9e65d386c606eb1cb15813',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '268903d448bb9d9047f62c1b96bfeb5e176543098ae027b5152a81c808fb04d8',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'dd4487b172389247822803e6213d9a4a886975eb852f84d8fd6297c2b6bb1ecd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-10': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'f406b91ad897fabaab1a8fb5ef2d578d62c01406bb8d6e8cda9f55ec59759557',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '02e7630a7983b9246d1fcc3f3ab3f3ef78effc54fb3f58936640c0f5e123bca7',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'e347fc893b55730311c0752e668c2f92d68b4cdc1ce71160f040560c123e0051'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-none': {'cnf_bytes': 346303090,
                                                                                                              'cnf_sha256': '37114aa6e8fcf5d0bfff1e7fe1c7120ffea181a5ef572035ba625e8175220d3c',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': 'bc6b2f2ea5e62d4ab7eef687bbf8a144bd8d55da970a73c3be015ccfdc12ffd4',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': 'abeb9b4cb010199740784ec5280060c307f411390da9a7c97c778df85b0d0dc8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-06': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '92163d575f1ad6485c36e2fead493bf04f1a4d628ab1f6b7a0f5a06e2a35c8db',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '22a2c730840a7dc3ef24fb8b9a49f6208811b066c11c68e7db8ab73f6e23bd60',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'cc50e9f1cf8d8f33589d52c9e7205d4d45759e3ca0219e38208e59f28c8bbcfc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-07': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '172e2675860ce524112ca2a758442c2d6d71f5d6776fd10a8fb634769d75e712',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '819c437eacdfa7d2641b00dc81caefc4a884164094f8b83971ca1ccb496aa013',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '9f6b138af3e66ffc4d2c440da1ee071914d371f548b80d1a54951b97a3338dfa'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-08': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '55155c8824eda0d7326419c4752b9fdb8de3409b1df4f4110a419588879ecec5',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'c4a138da2796ad9bf91587298dee41fe21d0af57d8351e4c262d262d207b16d7',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '42ca269ae43b441186f6431d4c4a9fe8ab34bb64afda2429a6bb462eb04a3120'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-09': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '7b035fd90534e41f6e87b8c13736141d3f20605ce65296062feed314bcc85200',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'a4cc678efe25cb70be2b18e0e42e3664333072089ef15bf32f73421ff0714a1a',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '5934c16b4d4ae87ecebb25b1d9713aa317e21d1e48e8a954eaf91676c831afb6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-10': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'f1c96adfbfcc90f96587bd4511cf43295c9124fb92358633d1f354a72ca7cdb9',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '9f33635cb09b3e5a68e83cde89c9f1e451c6c2b2fc2b1f9e8e0d506d6f640346',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '2f7e4af9852d9dc07702997add267a2072f7c6619787f0ef352c2b907331e034'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-none': {'cnf_bytes': 346303090,
                                                                                                              'cnf_sha256': '9e2accbae32b1e8949fa762c3d87fafd06d5b386b5b351c49bee1c513ace614d',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '83ade5414f3485527331406678d7e4c6aaccbd6624105ce213d09a7b67566666',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '64c5bd22f30fd1fbba4de0501e0e5dd3b7fa06dbc0478c54b880fc9b885fc8a9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-06': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'bf5bfa6ad04e7680a2e4c0582429ca4cdc2680d86f5de32a5610ce547d9c6d64',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '7300ee200531d7bf55f275bf494aada8259405ff3c7485eba72dbe4ad8b287ff',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '24f89dcc3d3f6969e723707e5906b0ce1ff5cbc87a68a529e0267842c0a223ed'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-07': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '41bc9f8c6537d47a36e693b72db46fccf830c4a7fd8aea0ee3f66792af63ef8e',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'c99884944264d93da843295fb5005da07ea9f6d06763d4c8ddbcb0e1f95d2c00',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '1068ff20588dc5358f6099d15f159db68d90f8d7d5a651217aa2f6a57e6df74a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-08': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'fd067713baa7e56e0b2b0712e82f058a1d3785866c16c1f7095aa2c89a6f6ffb',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd778d49afac07752d628c26fbda3263278957e5c8e9de58e884e07ad8ab23897',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '4cd6daa17dbb8755783f8fbea8e54cee7082aac94ad3819e7046aad32b38c5aa'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-09': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'ffd8fe63dfd6d3e81dc9a8ca01846721d956bda262db93d79eec5b02ba287164',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'ed14027f90db1e0310ee4c1ea39aebc1cf7ddc884e1b12d1d839bd45bc84f525',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '5b13e4feed8137c887167336f74f3e4b04d74125677883c1ab4cc2f849720479'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-10': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '573bb13f44bb52e8c427411a5b408695f6c0c5366d289df82c998e0b9011401d',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'f3035607eb939e12c7f5e4e38ecd629981bce7fb018d222c491046525db259c7',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '28f34eb70f4045b00c8b00f43736a3bd19d9a39835a56e1247fc2ce25373893f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-none': {'cnf_bytes': 346303090,
                                                                                                              'cnf_sha256': '35187e247e377fbd5d5b907635c29833d03a15b2a877e12bbdf11045f60bdf4a',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': 'cfb145e53207107df4a207f5f04587b33f861d65c965b9a26313fdc7a28fe2bf',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '0ed3107d477524813e123d6967512eab2569655bd6942abb16748546e4398627'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-06': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '4ac74e137552ed3b2211c299f348b360a06c5c090fb5ae403d1ab85bee1e5dd2',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'f2f924b4e9ce4aa92ba1fc358c5a09dce25456b9f6c289ff3e4dfb9c3a13d198',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'd4d7832f8c0c68b2471d04b33477963f5bbafe2c475aa264a8770d81dd4175fc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-07': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'e1e3a3220c3986ef52a20e5d02822a59299b12e61d895dca3fd672704fcad441',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '2afafa548fa71efbd08a817313c234c0b1c6ea926abb7115e1d3fd40f3a6d0fe',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ea79ac29cd69e4d24f075620bf2653ffbbc4053c76e146e5fd8b381c70712aeb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-08': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '1666e75ac42eb66dc015a4ea038fa785c59f32a123272b62c44d137a82fc8ae3',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'a3a76e9a22ce7f6e0b79580d869f8eb1c009e0ab514ca0a8ca6eb3d1a74f8908',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'dc83f27b5c0b36bfa63646ed836530810cfe8f242bd5f820e364c09bd4b9c769'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-09': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '1588082fdd4e2278934a11ce4373c3baae93e6b5388b52c2d7eb416e2829378f',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '396478e3e6e1e735f0171bd4a9c52502689d8efb63f1fd34bd0bd19e9b49ba3d',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '1223fa3570cd56c2ccdc29c7cd1bb0e64803d7744f583edbb65a4e057dca208e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-10': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'cd8bcb0b57133c909066139f75d82e80e2a9f4030b2e90849a6ed5b24cc31a5a',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '00ead69250772b92013f5a921ce86f50fa4de319f4ad002a7fa451503495b569',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '7403503cb80445809b0cff1fd3a21f71556f9fb494a012b50a4998fa263bf98a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-none': {'cnf_bytes': 346303090,
                                                                                                              'cnf_sha256': '7a5acde5f74e83daa3d90c5aac2f460a57d606459c2efd310dc7eabb6002ee08',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '34f62a21f8375d6f68a3335dc4c2ca2446b3db1f6cb40fecd9300b11a57493e6',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': 'd597556ba39b29c2d06cd9914cf9541961c8e45da6ceb3903b2d4c7f3a6fa500'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-06': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '05d04d0c7277735561ba34c5eb169c9f629985facb59085929e9d0a70378e769',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'f2a712c1827cecef732fb5086b044752f3d6b02e0f7556bce93aba51d2ad29d6',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '482b763c70de04eb967a030b75f17762d40b52721eba16ec946bf3d587386eeb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-07': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'd53d3efced7b24613839879aee02940a4e55674792e5d687e412777dd24ef36a',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '112b1cb45086b18ff51bd43550a5011734e92fa64513fd426d2a2faa1001346d',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'c22521d3814f994e897352723e714190938e98d3dec1f3add3b67fa5515d21f8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-08': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '21d2ad092a1b473d9f405d7c40d0098ceea6046b2c98d3b6b84fa1afe0ab6d45',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd5bdad2cf5ad5b85097ac41961285b981746b580432808bd2caca44c9a7a1e4c',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '3742e8baa4b6450a27fa48d1dedd99d39b815b9dce1e264a6bf9d22129fb80ea'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-09': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': '53c44814ab2dc8a87dee188af4da467c9a0448d16e2dfe0e13a733485ff9e2ed',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '2f30866e42fd03b56ac25f4476813dcdded97fb1fcdb12f7001036918fe3958d',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'bab143eebbd3e2a590eb182bea94a6c93e86042fb68426d8a73f8cb2e7bc367c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-10': {'cnf_bytes': 346303089,
                                                                                                                   'cnf_sha256': 'b38b49a63c16dacfdc7168a939a13ac1e3317706968bf39fdc9e19a5cc0877fa',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '22450a3bd16ff4957717cf7d342a294a3a738dd4528bb205b24fc086d8ef8d1a',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '09f6670c6ba6d7f2fee9285f02adb6be59e614db3cc80c181961fa6f761851fc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': '87a108bd34ef328495253e4371a6fe88ca30a59270ac869e6f6395abd85e728d',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '6b68bdbbca92e62ba5c55b279fd1d4449c1b593c5e5b6d378224ac5054969f4b',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': 'aec9a6d76d19569e95e6ee8312144e2bf7cce2f7eb5d1bdbec18cbf8626ff679'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'b57eeaf0caca8e20935be75c42b0c37cd87a94ae9d441d8410bb51e46e3f14b0',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'aa98f0f57344dc8f798237561b4c66ca77d283d93121f7d591a11ff164dcd061',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'f4c04ad004e7cf27a320e161bbd458438b08e3fb4a1067afb42c3b9738033c41'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'c6abe688e9cab8a2113608f35da59939f2e050464afd95f07f66f393f19398b9',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'ab25682b6ff44fbd98d788baaef50ca4c733a1e2a7c4536f9c584ed4ec938caa',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '7183cce5cde8badfaf64ef4543b830e83ad7743ef1edb0e5c1d446e03754770b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '803c5064994a4352f83194b3d23b0d23517506a2af664fdb9775cd96e2aaae01',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '026cf12a6144c0829effefb3c1a16b70873bd47061f9cc4c0de60959083b0a43',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ca0ba009bda62e0b97affdfe1c90bbec7bf2a2cfffdfcc05ea8477a55a3c089c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '5fdd1d122aff7f96d802106e6eaf5c253cdb4c27f155772a018fa10822ea306a',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '87151cf1d3d81dd3df00337bc9624cc7adf6e7356cf0b2c6d52c6cd5d79931bc',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'f1cf6082d9d8e018cc83583a2114be7322c69bb3d3c230c388349a13af8c0d84'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': '5ad56926b17c18dff42a1cc600011d897ba852e54584f5a0eb0c8e14f929c31c',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': 'cb4324f4714e1c202b90e4e6dd7e9079475a1a0dad521f279d05edc919c68050',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '3f80c28d48e92411fc9bf8ab68eb3f3b1faa7be32abeacb44b0fb5fc1d1a90d3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'a365a6173b5942c9b51a63ad59049c5ee3c4a4c904094e02166c8f1428944889',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '5ab5ef77b460d4d1ab7029f43b94fd0729c2862bbc1c8b7858c933f214332e59',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'dff67284b9c9a34b7169494c4ab2db4a33564bfd2b87cb94a3cb78523a6a00c7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '6bf216638547eb6163fdb5036e808be356545aa69abdf7223cc08f890c08a752',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '5c0aea7f80b031a7d2e654d7fc705c6b4fd25c209674716ec5feeebac99f478f',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'f955295c9e44211df8ad9d17c7d4910aab6e211bf91d741cbbaf876017fc7ddd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'dc206693e4d1ac3dd88c4239cb149a1fad4231302419f4c915241d3d2ae8d884',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '33cceb627bd7b5d702053128b2a10eb5b9fe7eaa9e38d7672040f4190477d4d9',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ca2c4262dea22530c7d6541edd843e89bbbe17e0c655c5880491c466e08e083e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '8367d70347666e07abffba96d67aa871cd4fd3153b64903da9cfdd1dd727adae',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '2e345e60682b6902cf15329f2aff0f6b9400500d7d11597b2cb14a17371f4936',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '4af78dc20736bd4506866e4c60fe509098a6ee791097b3a62d37dc0616f2409b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': '0d1f05ac8ed11fa66413707bdf87e33ed25c49471b33f3cec81e6fcc18777621',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '21374042c17d0ab1c5afece30828caf410c533c13955bf469df811d9cb5fb2d4',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '316fbe2c4934ed9b58a3492dc7c0df36c6440ee32a2811bb1d70d681a856dca2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'b5debfb4179637d5932f7ce5280376b0014b22c70998a523074da4a9c4a1f1fe',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '7bc44604bd34954d48519aa081a976d6ddf739eec059151bd2ef9acbceb08e88',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'b54c7c11817738c839720e2d634341e0f52d8c85bf1272f36b4be0344f6003ce'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '7ccac8b822be5e6cf3baa6f8c45b19bd819c8bf02bd2009a9601c57d4dabd6eb',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'cb3b21cf8bde5e6c475694587d78e616aa6e93479f14fbe5b7beaed1dc01d10c',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'd32472c425a6899776d9a22ed22a348c599350611788b28882a5fc7f4952d9f6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'ea9bddf56783a18d19aef7dc02fb5a697b654d12ed0bbab98f188c58fe75c3ff',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '14d76a1f654e31c0658064d2b5d797ef747b8aa8ecd2804e7fcd1094e99760c1',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '5fe2d0fd06f068311607b1a792dc86f168d7b7fc24669f8a7a4392e481d6f016'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '698745a19ff7302cc4aad6b44ab3bb7db53578f43007f7b8dfed921a8d8e8fc2',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'b8ac5671a15f99e34d572467e735725f63569f7244daad6ef47db7839e474ebe',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'd3c2df11ada3c2e140243d0731a636afa6878ab6251a3605bcb6135786f8d621'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '7e60697298481ab4556fe8a72de2b71bc9a4d3e3d5373973303b71896c1b7f26',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '81a15884624af11cc086a2b8ff99d47f40617af165365c1eb91f3d27f4a47109',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'f74746e96a091a0c46279f74cbdc4851f1b15abdf844b9d8b27ccd32a4495923'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': 'f2c9d760324086983ae529fef8002c452f1b87da5e421fa6802c9790ba7ae023',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': 'e4a0bd4c5f1b8e17c7984244e1a06246bc5c900f80fa6ec0c92e2a4569e6433d',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': 'bb1d180ab41a176544cd365a83a1a64e87d432361cdf9a9f952f2e24b58b22d6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'a9d9325e24c5727d4560c8c6e482f8d4718353ad1586f7765b3d815e45030227',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd2367dda41ec47cc74284ab8cd5bfde9f531f647f85f5d3eee97252b3094cce9',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '2eac6c248ba17af5fb587f3d36475640a69f02df8eb667cc013bacf6356627ca'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '8009a5481affa8539fb1c436599e9e49802c9a89760a5765827d385099368d80',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '0e7464bb3c22f4d9c56a3664cc9b17fe1ed3744c81a7a549985563baa33966b3',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'a7930eb428e8e99c381d6df9e8449ab230cfca6dc0287c8438134b01d6685378'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'fdd6730f59e4cfe170b94c62fff6226eddd9ef0c61c1feb0fa8a8ecb8fc60c18',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '4a4912defc19cbc402f627f74e068372ed1135bf1c214a643b257d01bf55dbb7',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'dad3e2e4425f130ae6a8cae98653f5b713f497353feb03ad155dba17d6f25180'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '6a18c7dbc18c0cefe49d8109bb2f395d40caed370c16f9b66d2c516d7ddfc5ee',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '36b03865ffbfe8387054b351639c63db3c45513a39f8e8d005f75df89b6b9ef6',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '7d565893b494534cfe262fa42ada7b55f9acf90950ad6360118fbcc51f279a78'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '26eb960dd920a4c978955ee8e8f79575d18c9afd73227c8feda147a8041c7333',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'dc1384e6b4f2da1742edfaba8f43c77eea7bb8c843c49427f0af2dd63a97fa83',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '4242c08f792c44f91e5facb0aeed0da8af84211ac7badd5ea43b5c2052942571'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': 'b0b28d64c921bac026f0ed6eb079c8c6dddc21eacfcad3794bb8aa7175670c7e',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '32c61934ca2fd76978be251d6688f7da7bbb8fb3114f351602deb23e53466143',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '20d42acce1c69efa6f22b88fb471e7e1faa252e4985202084d21ffe1cdb1bc3c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '180a68988d09f80dba225f08374b8e25969a758f57eef52e3636beb80a447365',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'ed06071d04f20c6915450273a33d1a6c79eba41c49ffc26b2a0606ed61afb0dd',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ace4345a0cfd1d3b4fc60069d3a1ae5d63284d1948d4818e37a614c98ed41c36'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '26285873c127daec9df73bb407493ccc9c99da6a4898d30d6655ae8e168b0ac7',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'bbe283c0d7e89e09a734715d1a316bee3be3bcc6069d605368da6d79683bbe1f',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '3f6357139ba4d733571daf16f6a6b2bd97efff61e7b657e02978fa4b0aa25432'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'a6a7cf32d7813389c81e25a8ff91cb6c2363a3421d212086ce4d01ede6f63c58',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd0dcf64cb3cadf1347d59839ba5e704d77ae0a34eeb6ac32c11e9ec2c285217b',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '2a8501f47f5ccc6770dc83b57e1cdc627e1c08127362ff08a9eac659f4657ed6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '35c7a9d339bb983e53df87bf3290f5fba5d5eb5c104f8da1c024695cbc7198b8',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '69dc657c1e7b9c879beaa4c765b0ce7d7c187e04353162a01dd72f2d27efbf88',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'd110a15147d81a65ca17a08f6e2bd94e8e43a73df48c8fb4237497f24280c873'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'b60c3dfdd6e9a8bb0c29145389fe266dc7eef7440446761f142d0375b9f2b2b6',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '7f071b81414dd3b74f64364066dcb12bdfbf92c3742c90cd8d849920e02ea14d',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '56d5edb6686d5cc92156038d9c79a79d825c127cd40ee5585ce2a4e9594a5720'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': '1e2039f23d3da43e3438ea30a7eef25d3e547000165b5e0f3951365e40716ca7',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': '17da9819423ef407921196bacf296282e1006ca284940533c8b3146700b0c41f',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '7c8643b4f999e481fe2e5dbb9d530e234818b70aef6fd38a35f248dfd3d31dd6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '145eeb053fbe971601409c3e81338fa0a34806d9209713f5ed5839dbcabd5cd2',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'ad91285ac03d51e22d7f192c003f88da164da48a69946d2a32f25c484df6fa93',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '80cdc867169cb7153aa48fe42b3f8503bec129712725bc760832c483b878e8e2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '1298050ac227daac27d8d5647db5ecc59e77d4f40bbafbfcef2be463a53a6a52',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '18e21820dfe1adad5ce4e67dcfa729957a41db28a0a569ace1220507c1820509',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '379d76ecbc047af4c325fa493db0beee6b05198728d4e163aa79141308b6a7c6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '7d8d543eb28707e304d724adf617e3fc2716dcc8e98d621e8c046126ab375a8d',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '5ff3355dd4bfa231ecef38a8d4ea664f4b64f0701cb01df1e786de1cfd078c8b',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ec10711b97f581421fb599b55bfff1a1bd08f5035409a33c3681084160d30b6f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '8b08188934742d994a73aa02bd6218f33389d473013dac444a8332614e4312d9',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'e22feff63dccc064479d64d872eca4efbd125e246b912516993d854881f4f078',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '1269092dbaa14e7bc8eb2706b89d41b0a81dae4d4944eca52ad22ea4aaf4ed92'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'b05fd0abea53d4e25be2305d30ddc1ec32d2e23383f64d191e14080c083527df',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '935a2ee355fda07457792d0beac4b33e8e6f7f3e4115012426ccb4da35ecf65d',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'b9b728fa6f9b290ae7a731a97cdc7cbf7e02a54662ab24b329673d39111493d1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-none': {'cnf_bytes': 346303095,
                                                                                                              'cnf_sha256': 'da6c8474ff4527e54bf78d3be9007ef0f1757a443a4f23ac95d3116ad4d4c660',
                                                                                                              'producer_bytes': 8953,
                                                                                                              'producer_sha256': 'd2c96025095ee82c8f80c6689e0382ff4972dfb39fc871e1dc00c7d2c1f7a710',
                                                                                                              'wave_bytes': 1638,
                                                                                                              'wave_sha256': '7a482b47a9d6a5c467758eeaf0817324d2cf6e4077ab5e6a417af1e62fb6fa3f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-06': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '4ddd9538cf64991c6809a28f5f2f4a9824299a8f73b6abd0f629e7b2d986dbf7',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd1d18734f179ed570abab9eae41f29f9838a7b2df35cca0348dc5ce50b06e152',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'b735d5b7f8a67ce6f41186d14eda6486ac78fb52059dad7cb61d2770f1089956'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-07': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '1978124163fa2e14c03dab992b2cee6d291c49222c6e51ab3d70c02e5f027d69',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '869f03bb9fe5c008286430e13046ca1ad0acbf17f24a24f63f7403b1ce68a966',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'a809156971926983baac275eb38a2978e23f27bf708a5faea13b565c120f05c9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-08': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '2e75bba6f46184ca93b07e6e2b369a5dc93ba994224a3e1c90d361713b2f998a',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '63eb3e6e07ad8091b6737ff5b1e2db148d42e3a26d219404cb2a794828dc63ac',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '4efec7a43c5798cf1f04320e16176a8df0469265ddbef220cdab2a0cbba4cdba'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-09': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': '93ee56079e83983dfd2c0ba009fa36321409a9a43a9cb8e43bf85f149899395b',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': '987a2417cb4ef52ba4ed293aa3cea362ddb5d41e66ca340d14775513dcf8af34',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'ae80a43a83624ebdec28db017a5206a7887af17fe09a6970accde3f3c82dc619'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-10': {'cnf_bytes': 346303094,
                                                                                                                   'cnf_sha256': 'c1253e95cc117b41439ba524c5869776bc9afbf1746aa7ce3bce59f237424103',
                                                                                                                   'producer_bytes': 8968,
                                                                                                                   'producer_sha256': 'd62681ba73a6a052a66adbf48c481c8acf1c55914b0362cfa6114cfd62f60291',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': 'bc5713aad0a41c71aa7ee3052c79efe6ba4ef280d5c7b6181bb0a39bc01dd06b'}}
SOURCE_CELL_IDENTITIES_SHA256 = "4870d07e6643216844a6334ee88d5a512aa3f66db24fd59b0685bae94aafee1b"
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303087,
                                                                                                                                         'cnf_sha256': '680b2a6a80fa45301d7f7903a2bd2d7962de27a633f5c5a28ea495c7eace3f67',
                                                                                                                                         'identity_hash': 'd56882f261b0fcf03031b3c3853c1f364b728ac177cbec2ab58447615953d9b7',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'c1314f62b1e80c946d1db71ca16ae5c5f1a4dcc6e7253ceea5b159a2f455d7e6',
                                                                                                                                         'wave_bytes': 1647,
                                                                                                                                         'wave_sha256': '57ed109117dcabf37bbd696d57524c656e8a246cddfaead8d25117bc713f8997'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303086,
                                                                                                                                              'cnf_sha256': '87016790bb5ea08b72e70fd3e70bd91e79765ffcf3210807c528e0611f9f5f61',
                                                                                                                                              'identity_hash': 'f23533e2697d3baa920228b15b37fa9e0d5208d50169b706a826a20441b7c884',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'ae213ceb4706e43463690e4a5ed1283cc9c05f2b76718bb03e52c22fd5205e56',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': 'bc51ea025cd9a7453859543af2d597cc746444d7e3c14a8e9c2533cd1da61e6e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303086,
                                                                                                                                              'cnf_sha256': '4733f7b1cfd8fbff46e23a60853fef07fa5f65431fb0556886ecb3f40daaf2ca',
                                                                                                                                              'identity_hash': '2601e6104b0c26d83d129b331a92195e119840be362bc4ae9baed5667dd03e42',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '5b3bb8ec65be61ea8c94db1b4bb31c12b18e9b41df36a876781cc8bd39735913',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': 'a626dd56606b52984ea36c4c07e0919cc87d2506326ce3eda3e555639583b41d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303086,
                                                                                                                                              'cnf_sha256': '0f1510d35a2a9b9efb8649cbb7254384f7a167de1890c0772d92aeeb1e3fb520',
                                                                                                                                              'identity_hash': '8915472d41d4891caa8c71a29393fb76050c70aafaba5090e40a145d97a6e543',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '79bc3b13765caff333473bf197245883b4b0767d2c1269a50ee27b804e6461c8',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': '40dbbb2f4dc1d4c20b14db24ad14d88963262f213ef13a370df30df306893096'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303086,
                                                                                                                                              'cnf_sha256': 'ea2138b765a660cfe872efce37f16affdfdb5ba63253dd6253e112bceb187b55',
                                                                                                                                              'identity_hash': 'dc8ca70cce5f95de2b9eec002712b27debe799e42fceb6c6bd63d3759ccac19a',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '70fce705c72adef2b631b0dfe80aac527d4ea0b20634090c63e9445804a2ce0f',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': 'c783ad38d72e3ebe88397fc7a37df83f762ff4c906452302c4dee0f5a6ac581a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-00-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303086,
                                                                                                                                              'cnf_sha256': 'd4c6a7466e6284636f59f191c1bdec1d12b78324124083d1e8ae237c81e90c30',
                                                                                                                                              'identity_hash': '81a5192bd5f1e27b93ec5b08624db89dee3345453ab8f9dc2e1eaf7c7b8ded06',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '8b8319b59daaeef8bcd840e497a1736f8eb77d54313601b1855542531ff668c6',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': 'e542c16b5dbb44a7e2c5fc3f6cf4263c9370c17d0b2f19ca998de447e56fc9fe'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303090,
                                                                                                                                         'cnf_sha256': '5d26ecd85680bbfb2571569e9b1bffafa7b16981cfb4c7c8e6d9c1401d7b257d',
                                                                                                                                         'identity_hash': '678a714d8b6b309119d76cd1ef06f41c1517694c1b945a5f6d79888da91eb04a',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'bf63350abdc07440dee3f8ff169c98466adca5e7333c0c3274780a3b454f4bad',
                                                                                                                                         'wave_bytes': 1647,
                                                                                                                                         'wave_sha256': '7d460658e75ff4ae460b4f83be5e825b981d161456c9f42c4c74ab0524fdce36'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '93f24b7b662e096730f7e3960a827e1440c6a2bfc14dd5f05514469ffaeb788c',
                                                                                                                                              'identity_hash': '6757d821f06be59c6ed78540ffb58b55525fddd712cb6b3a44fba6f390e304f2',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'dc2d10ebf83b42264935d742e079adfd691f391ad40d793e1ac7070eab60dfe6',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': 'e7e23cf15d94348a0483065d9c53f0194de7d4920dbd3ede836e75e75b3ae950'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'e756755080e7e168743eb8e909062a69e0bb253ab8ffc997535b93a6a95f09db',
                                                                                                                                              'identity_hash': 'f2ea01f8a4db33db49dd9ed328bf67b316e94b7959c1a1e194b5ea5b0f3e8416',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '868ad548bd48b7bda62ad19934d779562aa34dd3a705c278e35e49793ebf8474',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': '214c5c3c7d5f2e9dbc1bf864811db4f625c59565c7c01d9964b1ee1f2b06bc76'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '1283a054d7d3aa6fbfab043ced3ba6b0d7e94efc93889c209804acee61fe279d',
                                                                                                                                              'identity_hash': 'ab42e5bebe30fb329d6edca32f9bf49c38ca719ea42ea9582a39010fb9a50052',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '55c4c1330c3f93c1a5b5421a14dc116e4d04b3ecf7305ff96f1a9fc89e7bca65',
                                                                                                                                              'wave_bytes': 1657,
                                                                                                                                              'wave_sha256': '4d5b3be5684e254e472e130d75733d3ed7b2972af6bf1b5bc8c8076bc1011f4c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '2ed535ebc34cda90d7d52e4d03d8bf94dc53a9980d9e65d386c606eb1cb15813',
                                                                                                                                              'identity_hash': '2a0c41609c4fadc33e4a8576bce7fc6b166fc949428ce110660480eb66a62805',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '64fd082ffc9ee64c31472cd6de293976005caf9dd39c22cdeaa051f3a3ed1824',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '606163434378a87333fc0ed5c94286164c8b3338b9cec0d5afcc23034c2a4a80'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-01-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'f406b91ad897fabaab1a8fb5ef2d578d62c01406bb8d6e8cda9f55ec59759557',
                                                                                                                                              'identity_hash': '14865330d9229115f593a03005443985c7e6ed8acfbc5df06cf26421c2d0f785',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '4c4bbfe21b8b2c9251aaa90eded1e1d328b76dd62523618152820322b870b721',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'b1b6453873389dfcd1a061de42e50b742b85c3141aa4ce596da31d86d00f5911'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303090,
                                                                                                                                         'cnf_sha256': '37114aa6e8fcf5d0bfff1e7fe1c7120ffea181a5ef572035ba625e8175220d3c',
                                                                                                                                         'identity_hash': '35e1fac1a4491fa522cf45e863a751463e8aa32c7308d41da635f2ab8389c8b5',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'd673005de359c41f45c81360c7afc7716d6b0f4186434e4de45f7bf7f9425543',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '0cef3029973a7027c3aa5724d9f211899ba35a7421f12e70c081960f3105cdce'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '92163d575f1ad6485c36e2fead493bf04f1a4d628ab1f6b7a0f5a06e2a35c8db',
                                                                                                                                              'identity_hash': '2257b3d289f0628da9baa6b81b36e7f72f0a1c90cab83d83f31fa758a19ac811',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '5b7847aa88cb5fd5982b54b868569636d8cac88318ab472ca030cdf915fe544e',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '76cfe30e6ccd8d8e315c2b11940ace29e5706c81ba1aff746580826d1040a20a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '172e2675860ce524112ca2a758442c2d6d71f5d6776fd10a8fb634769d75e712',
                                                                                                                                              'identity_hash': '6b21b86f87a3ef22ef7c7d1926b075a657e23f6d1f49643ff3ae7cf1fa53a52a',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'e004cf91b51255e4c7ca147ee6282f0b296779e66b0f029f887506ae6e88aed6',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '9438465851f81dfa4b37b42949a776e9f8e2fc1594fb7fafd980cb70594c2b33'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '55155c8824eda0d7326419c4752b9fdb8de3409b1df4f4110a419588879ecec5',
                                                                                                                                              'identity_hash': '568034330d2a1a2ad9150029f6e9406354a455f918a56da11c559289cc2796a6',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'f5020e7d2a7c667e92d7d6314025b0d47dedb1b0f6e0025a11d69dd8d018ecee',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '2717ef5619e1ba5dcfe5e1df199517275b131640f175657488ff8a74e51a1f88'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '7b035fd90534e41f6e87b8c13736141d3f20605ce65296062feed314bcc85200',
                                                                                                                                              'identity_hash': '89e7796f18d3211aff65c5b7741194b098dc4e65f3a8e37a31378931ba8a421c',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '3fbabebdcef473d66fe093586c68a84c2c8ce6f7406b97b0bd81bad9e7b5f5ca',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '626225d455d6948d0c0698e5fdcdf4b838e955d670ca802f344fd629f9ef14bb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'f1c96adfbfcc90f96587bd4511cf43295c9124fb92358633d1f354a72ca7cdb9',
                                                                                                                                              'identity_hash': '0e6858385b604837b6d5bebc7305e5677d291a345610733bc2f1df9a5f02dc1a',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'e0c5e83e1b540b2b9f7d961a58e5d8cc5297fb27e87f5f8cbf608606b1d300d7',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '604f2b27654b33227c8e548b8dc06e726803fc7df148c2a182b55ff915a6be10'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303090,
                                                                                                                                         'cnf_sha256': '9e2accbae32b1e8949fa762c3d87fafd06d5b386b5b351c49bee1c513ace614d',
                                                                                                                                         'identity_hash': '516668ebca2d991446e6279d4d5cbdfeb729e2bab9047ab8f7bbc7c74a6af3c1',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': '32a8f6fd9f640c160c1fa9a7e4f730cd52360308646f981fed4475ede6e3f812',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '086b46bb7dc22b297b5499af9536e993bc4ca975f35340f8532d4f00c34eb078'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'bf5bfa6ad04e7680a2e4c0582429ca4cdc2680d86f5de32a5610ce547d9c6d64',
                                                                                                                                              'identity_hash': '4c33f7d4d12d2bc3994662b82c1df5505b127db79794b2895e8f5368b890e2ca',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '9420a261aa23b519c7345923111f8da1c66901a42d23b599fed80fe65a9aae28',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '3d0736f7e9b08eed91097fa662caef47dc29c63b5b6d778974cd746a6fc6469e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '41bc9f8c6537d47a36e693b72db46fccf830c4a7fd8aea0ee3f66792af63ef8e',
                                                                                                                                              'identity_hash': '0640eaf3e8fcf5a16cfff09a579dc21d1e202e329021d61c555baa1e97aca763',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'ff83dcf760ea251ff962e5e6b3d867c3403b41f9a5681e810aa035d45ed84983',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '4384cd068df794c69e53b9c0023803d609ab3967bb5ab72fc59049a556c4a35a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'fd067713baa7e56e0b2b0712e82f058a1d3785866c16c1f7095aa2c89a6f6ffb',
                                                                                                                                              'identity_hash': '40ff990d82092367ec84dfe2b02ed7e7551c2c619ce94fc8aaa65acd92eb29f0',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '3befa451bed94cd4516bef4c50d17023403342c58cd0f05c7c5fe981e034c0e5',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'ef26ef4c2bd2b63b7e777db6229e75ab79972d451f49bd38067cc67aaf209c4d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'ffd8fe63dfd6d3e81dc9a8ca01846721d956bda262db93d79eec5b02ba287164',
                                                                                                                                              'identity_hash': '2eafe47fd725a83f2348f286096ec1fee76e4c6a5811a794667cec17d28d6cf6',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '9698a66ef8a23a3c6ab9b8b30587deddd192bf68c6b8e72e13af601ff0382c66',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '2aaa9351f334e5a7b8666f3ea84b5862ba52c75c52d74c5ec7a2d1c5d031e872'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-03-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '573bb13f44bb52e8c427411a5b408695f6c0c5366d289df82c998e0b9011401d',
                                                                                                                                              'identity_hash': 'c6a3578df2c6eb195999245e1d2609c87b77a7d094299c82f77b68f782a05802',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'fb18bd983e07437a5c55e0a69cac60699336e9df35813cb98b0a2e29907d2e05',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '33c6484511bd2564fe5614e4fdc224cd1576f4fed1ae6d657995154319763238'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303090,
                                                                                                                                         'cnf_sha256': '35187e247e377fbd5d5b907635c29833d03a15b2a877e12bbdf11045f60bdf4a',
                                                                                                                                         'identity_hash': '38ff49d44ee1de7e0394b24270ee7d262295ba257c4db85b59bdea6f2d4e91a5',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': '686fc6f73eab7ea37a0a31786cd7efae593db50b07e192a752f9a99ca7b3713c',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '2381c2c7a5a36e9f4a0bd5b6821462388fd15868567d31fe9f593bd6e8988253'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '4ac74e137552ed3b2211c299f348b360a06c5c090fb5ae403d1ab85bee1e5dd2',
                                                                                                                                              'identity_hash': 'c69ba6ac9214c81855515ca49e7aea253a495c40fe1207ec31af294e9c4fc228',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '9b8a91b2695c6e9725975934f10bc42d65344ee1fb2a93460b3c74b8b4db7532',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '89a18a25731072c49ee0877e2d1df40e413464f7ba1d5656b323d835d35a9a3e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'e1e3a3220c3986ef52a20e5d02822a59299b12e61d895dca3fd672704fcad441',
                                                                                                                                              'identity_hash': 'db5ff91c5374a93a737752d194b2c5daacf612e11272b3b236b69df28ffa0659',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'd06521ac770337792a8bb648d3475981d86be5dac1f055847a5f9e4d62e5a7db',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '1a014f5ecd58ebccdc9136e809481985dd38d98f3ce62afd4319cb808670e8f2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '1666e75ac42eb66dc015a4ea038fa785c59f32a123272b62c44d137a82fc8ae3',
                                                                                                                                              'identity_hash': '9d85855fe7ad2f5fcd88a3c5ff2ce97c10447a030ef00ec2061a087060021081',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '9c135066159ae009b74c88e8fab8c24b3d2d3c9f4cc9d8279c22ea1644241421',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'cc4aac2fef8d87ae9e1ae31714e09cc5e8a39a42371b2d3adf59da6b2146a165'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '1588082fdd4e2278934a11ce4373c3baae93e6b5388b52c2d7eb416e2829378f',
                                                                                                                                              'identity_hash': 'f61b96fd420f0870245fec51c12a04552b6f4ff70cfae9f201229fcdd6942838',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '349604d9a3e9ae38ed27fc4d09a272ac14d34818f951b8b5a4541223905179b5',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'c468f6bfd76895d7592ada90f215714ae8abc5b30b67c6b5a9355c7d19e4a1f1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-04-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'cd8bcb0b57133c909066139f75d82e80e2a9f4030b2e90849a6ed5b24cc31a5a',
                                                                                                                                              'identity_hash': 'c4aabc39afa77104312c37b7aaff5d6de1345ae46dd3cf46f81d90a9efb51415',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '92bd26cf0c0cb1b2b79b7120b13c9ca4ec9a17e7e0f043ef57dfd08ad0eb559d',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'b0e8777324c58f355d5d3c0ee61743d79ea31881fd43b0271fe899099afc437a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303090,
                                                                                                                                         'cnf_sha256': '7a5acde5f74e83daa3d90c5aac2f460a57d606459c2efd310dc7eabb6002ee08',
                                                                                                                                         'identity_hash': '95ae2e34695991f829ef436ebe4509a0aa26d24386820bf4a8ca7313018a6c00',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'f9cbd887d31b2bb94aab259f78a616383f01b2e2b053b6ada153e2ee5dad6833',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': 'ff8004919dd854056b18ea0eafed1102e3bea1225992e5d05dac12ac81438c16'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '05d04d0c7277735561ba34c5eb169c9f629985facb59085929e9d0a70378e769',
                                                                                                                                              'identity_hash': 'dabadfadbedf33a63f824a37289f564b9fa57e6fdfb19948e1665bfe218be497',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '1f86bd4f9286f4b17024ab8bfa58e10de3491b13171deccb2d6dc44c45e42ecc',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '6283f678d0c7686b03a21ccb69968b40c6434a39993e2d4753f83fc037e35f39'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'd53d3efced7b24613839879aee02940a4e55674792e5d687e412777dd24ef36a',
                                                                                                                                              'identity_hash': '2fbb74982751700531c3cb2489414107e15f55e19055738d4660f57cd00509ea',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'd48cb2653daa8a32c669423b27d2768bc2e4a81251856eef7db4048975313ab2',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'efdf94ecae8c9be75eb0923f32318b2341036c20c39cd0b178283402246193ee'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '21d2ad092a1b473d9f405d7c40d0098ceea6046b2c98d3b6b84fa1afe0ab6d45',
                                                                                                                                              'identity_hash': '3154310bc547849d9f00b99510417603c2044d9ac04e4541a76d652281206c1c',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '80b6e97bd354ece353338952543ae17691ffc03d2c2651311df20392873a45e3',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'd02b448313f81c949ff802a00bbf0f8f9188944155a2f978a2c673616292f33c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': '53c44814ab2dc8a87dee188af4da467c9a0448d16e2dfe0e13a733485ff9e2ed',
                                                                                                                                              'identity_hash': 'e0afc379d0991adfe4fa8e79a8110566d7cf297d2b02e48d65857930c5e5f82d',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'ec66a24bbdb64559bc49b643e584be655f3db1be7cda47c941df8616a19227d7',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'b7448c656be04ad673976da471d7cec67ce4fac588bbdd250126eac935d1e53d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-05-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303089,
                                                                                                                                              'cnf_sha256': 'b38b49a63c16dacfdc7168a939a13ac1e3317706968bf39fdc9e19a5cc0877fa',
                                                                                                                                              'identity_hash': '5bb4bef252ba800f5b0bd05fc5e5ae8ffe94ecdb73ad4d4d483b5c4f36582deb',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'd50dd43c3c9cd1d6bdd10a226bd6a5b43624cefdc271b3a6311592644f5bb916',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '78064f6e484d6b22429b0abdbbeb89a96fd6bdfb6e451f4a3e6b26633b874387'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': '87a108bd34ef328495253e4371a6fe88ca30a59270ac869e6f6395abd85e728d',
                                                                                                                                         'identity_hash': '9ac8c5767448d2db56b19c1b07dceda706a055ba3a15176a4e633a8b39f5cd05',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'c3b04cfc12cef36c320c5e62d5c448072ee5d8ed3423f49b31a06f2ef208e3c8',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '4bfc99b8c33eda6bd893134b11f483b35b4c8af00327da6290420df64c8fee64'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'b57eeaf0caca8e20935be75c42b0c37cd87a94ae9d441d8410bb51e46e3f14b0',
                                                                                                                                              'identity_hash': '35b994928ef9bdf78ca4f40b60f61b9e31e7475435b852d45c75a54eb474b63f',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'fe75c7367c132e01ac3a66a55cf3d61b57bf0dfb102e8c283becec97be864f24',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'a51e41e1cd5f5504302313449e64fa6447df029bd88959ea1802c409f4b29552'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'c6abe688e9cab8a2113608f35da59939f2e050464afd95f07f66f393f19398b9',
                                                                                                                                              'identity_hash': '284e2c08a1f71b60554193c6cfe9a67ec46cbd2453036716dcae32301b79a93b',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '37f58eec3552de97a2d9d274fc216d71c5c4165f44f3ab5d5523b17362722ba7',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'e3da54d5e8ef4a8fe04c4ea16ae2e4765374461b27f31f70186acb9f396c04c0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '803c5064994a4352f83194b3d23b0d23517506a2af664fdb9775cd96e2aaae01',
                                                                                                                                              'identity_hash': '72b7990c6ee0ddc1ee6bee1c9e2a6ee5da7a5b09bc7d3346a3582befcb48bbef',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '8169832072ad1e47adfd70c7b4c64c772986f518c30010f78c0bf57c68e13148',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '18df4ca8ffd235fcb2a9251d16c5d4cdf8db3f2abeb14524af2afd55880d96c1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-06-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '5fdd1d122aff7f96d802106e6eaf5c253cdb4c27f155772a018fa10822ea306a',
                                                                                                                                              'identity_hash': '44c5a673c0a192a8425286c712dfaa40ce55f6e1aa83ed63ab5532e05e536be3',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'b1f3b6b0da3dbef9c897b8173718fc946de7dde4ad65f5308b70bf18889bacb3',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '9137b5f3148bda7e3f1ef43cfa76b85c097135329dbac43d36c0f474140a5b0b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': '5ad56926b17c18dff42a1cc600011d897ba852e54584f5a0eb0c8e14f929c31c',
                                                                                                                                         'identity_hash': 'e18fbb90e3842a37d46a40da866d0b24ed378c5efe4505d812ffff5950acd9af',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': '37b8e589fc0b9425cee376e193ee20d79767d5ed987f39dfe63fb361760c75d2',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': 'ddef924a949b95580eaa1cc87c9350343ddf40724778e6e9be698fc5f243abb4'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'a365a6173b5942c9b51a63ad59049c5ee3c4a4c904094e02166c8f1428944889',
                                                                                                                                              'identity_hash': 'd0da94ec3d93e80c22952b359cf94833384b8fb573b39c77894c55e6f946f0da',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '0e513e7114e2fb1066ae34c305fe66a82d2c3195191289b580e5b9bdb57b74a9',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'b1614685e6a4e1f6123e159ae610b6d3aa1ce04b1e0b118adb4a008a81791680'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '6bf216638547eb6163fdb5036e808be356545aa69abdf7223cc08f890c08a752',
                                                                                                                                              'identity_hash': 'a17358d797a2ce755a8469c2626bceb7dc605ba18a847744ab6fd1a478e22ae0',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '8f9e34e8dd61f09d6cf9ffc74f1a35ba322be0e14e8f733e5d535c1234d865bf',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'd8ba691f67cff5dca7d61915875a9afbe2afa9f289f2b1aa867d71559e4a7de7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'dc206693e4d1ac3dd88c4239cb149a1fad4231302419f4c915241d3d2ae8d884',
                                                                                                                                              'identity_hash': 'bfe6a8d151992ea2b1361315ebe80708b38071f956138d2df4336fd0feec1978',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'f339d5d96da1ba0acdc4b0b5dd627e4a0a639b80145988cea71b975047b5f5dc',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '00898a7087fd1de6a843f73b981e53861eabb95ab0c66c49d8546e4025c142de'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-07-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '8367d70347666e07abffba96d67aa871cd4fd3153b64903da9cfdd1dd727adae',
                                                                                                                                              'identity_hash': '75cc0fbde8c750f277076fd486e8c12c8e32f3cb828abe0d816ae74ad26c66dc',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '0fcad8106fa6987b35a8af301a3360a9474bf53e4c3c2d5876ccfd920bfb5a54',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'f519b595daf79db637850e20c66b7193ffcfc5a6ed05c26c6c44da195521e7bc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': '0d1f05ac8ed11fa66413707bdf87e33ed25c49471b33f3cec81e6fcc18777621',
                                                                                                                                         'identity_hash': 'e60c25ced180d6d4177e1457a39c08103ccb43c7f5deeb63de30cb7d24d366f8',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'fbd1789984a577c5b332c79bb4ef288bdfded3a6ac1d77a2f3ead97c63270346',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': 'f4acb3c92b2eb5ed582d22c732af48856e081f0e6d846435a9ed0f81ddf4d665'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'b5debfb4179637d5932f7ce5280376b0014b22c70998a523074da4a9c4a1f1fe',
                                                                                                                                              'identity_hash': '623a08d2b8fc29df19d0ef7f76ef55cc9763972bc8ab840801a63b03d71abc8e',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '09e222fe66381de89e4ccec143b1e10c5bd67595d7461807555d4441ed5ea5fb',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'b4b7c06427d191166c85dcf98b0bb435432f8f5b326142623ce33e24370591d8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '7ccac8b822be5e6cf3baa6f8c45b19bd819c8bf02bd2009a9601c57d4dabd6eb',
                                                                                                                                              'identity_hash': '39b3760d5e4368c07ab13c186f39ac15b5dd1e46eaa041a9f06bc97491698d80',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'e99ef3040241601bed57a068e071604aa9deb4149e461d6fa5e32b7a2d6a4a14',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '168f4b22787900a5a0cb6991e0456642119d02caa69fab10a3a284a887514d65'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'ea9bddf56783a18d19aef7dc02fb5a697b654d12ed0bbab98f188c58fe75c3ff',
                                                                                                                                              'identity_hash': '6c13e925bc98d9935cc137d6b6ca32252aada7e0899f13b58768f5dea964455c',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '7371a697fcc225d5fed6de24d3f33c470d9773b794385dc2e00eef7ec7714e85',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'ee2b731a347783cbdcc39a25f84506ec7f26cfcda9101606830b0011840d50f2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '698745a19ff7302cc4aad6b44ab3bb7db53578f43007f7b8dfed921a8d8e8fc2',
                                                                                                                                              'identity_hash': '5132162e30a78c5c8b7411f183ef797d81c33c96197d26136656c10bf3333e8d',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'cd891d160357bd92d3c83c95df584478b3dbc14ebb691ae6031c310fd7fee06e',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '4d12f9ed624e822c90c328f813066e70180bbe93ea2619a885e84a7ed43c6296'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-12-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '7e60697298481ab4556fe8a72de2b71bc9a4d3e3d5373973303b71896c1b7f26',
                                                                                                                                              'identity_hash': '53951e050e5ab0475e1aaf82a0597a4a7ebf03a9986dc50560e0d06ce92df2ef',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '140d068ab0581943bed78ccf16f9d475ffebd2ee04f54ccebdd9a178fa66b294',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '3cf6b4e46810e4d6fd1d41a47db964dac7a2d6fa8d330ec4ee2cc00caffa0eec'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': 'f2c9d760324086983ae529fef8002c452f1b87da5e421fa6802c9790ba7ae023',
                                                                                                                                         'identity_hash': 'f9eb69721dce446e5ac0867be4e39614a2e946547d2760c0247cd78e8d9cd211',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'cba23fd1143a87ac40d216ef33cde3a79f8db146e331f52aeceb9d97dc9d6c10',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '9b33ec7e2cadd3daf0b152fc9eb75e514d7b57ed3391d4eb285818c034acbb65'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'a9d9325e24c5727d4560c8c6e482f8d4718353ad1586f7765b3d815e45030227',
                                                                                                                                              'identity_hash': '991577f51ece29141199b53db892a8601ea0d5070a8ccdf2e51dbd825a38b9b6',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '051116a5229217520a35a787ccf034ccbe21c832d606be05ed0cafe897e98572',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'd57c2df313247ee64027d17b428c88f03d2ffbcba059cb344a6741aa38f5bbda'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '8009a5481affa8539fb1c436599e9e49802c9a89760a5765827d385099368d80',
                                                                                                                                              'identity_hash': '1001d0c8d71a53d06702739a73017febcc989a08c9f527976724bbae4807bc99',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '5324973830731289c00ef8cfaeaa3846d5ee8132e097887118cf63f8fec99760',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '653548b29de902d272df9053d3ba3070be1998064a34d6bda0f090a0e6a1c533'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'fdd6730f59e4cfe170b94c62fff6226eddd9ef0c61c1feb0fa8a8ecb8fc60c18',
                                                                                                                                              'identity_hash': '376dffb2e10b7ad51a6c6d1258ffe5e2e93dd8bc63ef1d4516c003c97e042cd5',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '239e1ef743ae20e4fa88c0b5d986dd58cf14b7390e26c38d064ce32dd2cc8ada',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '44d46a79abc2d3fa5fa9aec7d0bae09a218d767e44615a7f95906d77cac31846'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '6a18c7dbc18c0cefe49d8109bb2f395d40caed370c16f9b66d2c516d7ddfc5ee',
                                                                                                                                              'identity_hash': 'b12405cdf1f2369fc31ff489f9ce10e321ac7f93aac9797699eb64c4d19254c4',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'c6988eda03d94a9006a0d1eb969fe18edf1a7a9f9748cb746693147694019c09',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'fb5db757cd465a27c16e273ceb14f2428625a32998a43077288787ffed4029ee'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-13-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '26eb960dd920a4c978955ee8e8f79575d18c9afd73227c8feda147a8041c7333',
                                                                                                                                              'identity_hash': '0852539181d21f63231882c2e56aa97f299ee884fbc8e18deb9774acfd33254c',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '37b99783ed222e3a89812f174ecff6b808b7645ff45bbf4db54fe671256aa0dd',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '163e16c84a777d97c7297ac7f716c56d03b69ac980a8220834cb2f563eb2eb30'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': 'b0b28d64c921bac026f0ed6eb079c8c6dddc21eacfcad3794bb8aa7175670c7e',
                                                                                                                                         'identity_hash': 'f6c5ac84c92662c435442eebd9304ec2c3374f41788a3de43f117bcdd30e3c02',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'a9993d40967fc68e4bdb41dcfa2b76cf9ab1f4c1e4ca206ad3bd56dd3eee5d37',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': 'a5ffcab15c1bd282268abe76f738042fd7412ff6c8ae67fafff255acf29b5fbe'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '180a68988d09f80dba225f08374b8e25969a758f57eef52e3636beb80a447365',
                                                                                                                                              'identity_hash': '0ba3d34c75cbce8dc15b79c0bfecd73b878c0977341dbbd537b80f627581fe27',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '0f42c04dddd5d4d3a24240440c8b20c4ecae4bf6cd6284d1470e2c136e729ca5',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '75404e04d0dbd22c5476800f87ab22332ddcad85c2a667d89dfe2ddc0cb2c4c3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '26285873c127daec9df73bb407493ccc9c99da6a4898d30d6655ae8e168b0ac7',
                                                                                                                                              'identity_hash': '3c348ea7180d4c3ab892cfe9ba8f5c2ed5720ba74a5e1f9b0e0e3298d97f2007',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '84a2fe35b4bd9e077722fc31f97c64803edd13a5e138696060552630f826ce21',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'da6d44d88643054bc7393f8098109d11097ad34f0b16b30a9275963c2468651e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'a6a7cf32d7813389c81e25a8ff91cb6c2363a3421d212086ce4d01ede6f63c58',
                                                                                                                                              'identity_hash': '5abb59dc47f129e02377f00f34a9645d9c9af58f177840cbbf3b13fe5eae41ea',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '80f3cfaacfe02d420f9eaa4294802ac01d59408528dd7250456b2c02f334ce9e',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '364ec43f2878c85432f0303396a867bf6dd8319150510b770637845387fb981f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '35c7a9d339bb983e53df87bf3290f5fba5d5eb5c104f8da1c024695cbc7198b8',
                                                                                                                                              'identity_hash': '0d3def76de3f7e39b9a3d650648f43e45842beb5f24d80baa362cb700c793dea',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '7e6f393f0b1b718f10d5066ed8166c3761bb4740571d982dadfb95dbf4c03d90',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '04dc3e2b26119e8ee386d8a9634f5e512757b491d2f2cc0acc989f1a44b9a177'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-14-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'b60c3dfdd6e9a8bb0c29145389fe266dc7eef7440446761f142d0375b9f2b2b6',
                                                                                                                                              'identity_hash': '128c59bace4f555cda01458858b2f9b5ee4625f2fe74af5d446192be9e8f242a',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '8385887abb75e0dd9af4d67d0a252415b6ee362a987413ba2047478cd81c8a68',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '8a7ac7a6048ddae3cf5936825f23f0a244b766122e9cc8eaa0f18776471e94e5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': '1e2039f23d3da43e3438ea30a7eef25d3e547000165b5e0f3951365e40716ca7',
                                                                                                                                         'identity_hash': 'c5058b2b190238ae99a84403c03fe39feb6be2d5225dbaac25bb0b94c77fdac3',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': '11cac7507edd0cb4af886d8fa555dd3404b6ba195632af1060524cf63ac7e7b5',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '10dc4fbcedfe9b28279e02ab638be9d875ce71e3115eb78001a8dffe4f59e103'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '145eeb053fbe971601409c3e81338fa0a34806d9209713f5ed5839dbcabd5cd2',
                                                                                                                                              'identity_hash': 'fec21c070f89abf4be7ff33350fca8f890241519d77292578d48cdf5bfc26287',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '306a851ae9db87b72edb55761d4285a0141d2203cf3f074250f75a523eadf001',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '0ee458139fd35a33d7685d26fc27e5a20cd91cd1b1ebf5c06999b3aaac4d5f0d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '1298050ac227daac27d8d5647db5ecc59e77d4f40bbafbfcef2be463a53a6a52',
                                                                                                                                              'identity_hash': '6fbf6796c221489e62574d8fc20a652174b047c01da22b750386bb563a69f33b',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'fdcaa372209348efcc37e888c6d1aa6f978c82e3f7bcb054156ccddb89c4b536',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'c2fa85f5ac75a255f973e9262a263a2f59ce069aff399071064ca0e8773af481'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '7d8d543eb28707e304d724adf617e3fc2716dcc8e98d621e8c046126ab375a8d',
                                                                                                                                              'identity_hash': '24e38a7c2c1c97504962bfe17c2a969defa9f93672b2cbbb312281bb92309b9d',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '65e3b39496301f5bfc85088c77fecd73a4189c0c4525d1cb5fc5fe02394a23a0',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '63e487725be9c6ef077d1f4015c98c0f2e30473f20ebda4616ab9863096f39d8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '8b08188934742d994a73aa02bd6218f33389d473013dac444a8332614e4312d9',
                                                                                                                                              'identity_hash': '932a69748b09eaa558dfe63179df2960ada1f69a77a3e3d982f86008726e6847',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'fe5807693cbae8df10f58e511d09610ebf49f962a644117d5cf8f4a50bee8a3e',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '927e0eefb413cd4af1de0906b1ae0a1010800a3d132315bf6bd2b250eba1e77d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-15-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'b05fd0abea53d4e25be2305d30ddc1ec32d2e23383f64d191e14080c083527df',
                                                                                                                                              'identity_hash': '289acd70bafdf7d749cb075f29f48c4216eb58828808ff3996a9c160464c6d40',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'e269072fda77afe14bf3d456f31e395f348e33f0173a1351319d76c2b03036ce',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '5057adcd54aba28c2e9f8e54c5bfa806a426bb365fc28ab47b6a52ec66e9d7f6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-none-combined-v5-sat-profile-v1': {'cnf_bytes': 346303095,
                                                                                                                                         'cnf_sha256': 'da6c8474ff4527e54bf78d3be9007ef0f1757a443a4f23ac95d3116ad4d4c660',
                                                                                                                                         'identity_hash': '2186bb2ef8c7e889dce1a4dfa006cc74f99bb4c3dc99aeb2dec7e093aaa40db7',
                                                                                                                                         'producer_bytes': 9072,
                                                                                                                                         'producer_sha256': 'f1f3351939b69a5e489d250be8483e0357398fcc4e5099b8bbd5904a6f90555a',
                                                                                                                                         'wave_bytes': 1648,
                                                                                                                                         'wave_sha256': '635a3cc5640b66d86ee5961568058640ce7d47646ac512a3ff0f6546dac93811'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-06-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '4ddd9538cf64991c6809a28f5f2f4a9824299a8f73b6abd0f629e7b2d986dbf7',
                                                                                                                                              'identity_hash': '4b1906e8cde81ae8e5271d00af1c8b458bbb95fe6afeb4803a5fcdde527c5690',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'd1702bc43ed50e97d684935397d8b194ca221f9bf41c4883fe4bd915481d7a04',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'c630cc34d7cd0227cf823142f8257b42b5dd2f30269b4198dd4c3285c70ac0f9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-07-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '1978124163fa2e14c03dab992b2cee6d291c49222c6e51ab3d70c02e5f027d69',
                                                                                                                                              'identity_hash': '7821c81427a670ed8f70d2a29b9191af9773fc9e1f8041d628cf6ca6544464a1',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': 'f48bc7b6ed0cf93beb150747e5292d2943d55da56b28a6fa75ddd78589dccfbd',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '7b73998e645ebfafae933ca3597d72d0ece1dade50d4e3dd23c5def045919b58'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-08-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '2e75bba6f46184ca93b07e6e2b369a5dc93ba994224a3e1c90d361713b2f998a',
                                                                                                                                              'identity_hash': '9f32362289ba431e9b016fede27b9b273aa10883b4a0e1c0797ab8840de92d13',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '74494d5f8b02344abc43d1cbc3ca7d93ff181d30de608988ba038a4ddbd56be1',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '7ce935eaa4bf031d653f417bb98b0bebeb926a1a7c56f19abadcbd53f780f945'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-09-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': '93ee56079e83983dfd2c0ba009fa36321409a9a43a9cb8e43bf85f149899395b',
                                                                                                                                              'identity_hash': '2e6e63656b24faa129eb2019e0726c7720d70146f3a508f295ca24152c63ac56',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '67f1e1284a7aa37c835f109d8c79a3663ce7aef4dffcdd73affb95049d5452c6',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': '629bc884434068807bc2f01fbcd0457edbb277172edb37c62ff78b6220c7f3af'},
 'canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-16-physical-unique-10-combined-v5-sat-profile-v1': {'cnf_bytes': 346303094,
                                                                                                                                              'cnf_sha256': 'c1253e95cc117b41439ba524c5869776bc9afbf1746aa7ce3bce59f237424103',
                                                                                                                                              'identity_hash': '6aa3f2397c2299f93949b050cbafc9ae1f7ad306e33bedea9cf694e7ed979542',
                                                                                                                                              'producer_bytes': 9087,
                                                                                                                                              'producer_sha256': '0a25879035e5bf38ca00b2bb42574b87667f70c43ca96a55c1df6d9fc64950da',
                                                                                                                                              'wave_bytes': 1658,
                                                                                                                                              'wave_sha256': 'a708a3c9ea1f44766d84711c8905a46104edcabed0fdfbe46ac73fd00dd013ee'}}
PRODUCTION_CELL_IDENTITIES_SHA256 = "d8debb01c7b353eafdf9b938c1a34cbcf02f53cae1fc164bfb2af3d7180aa003"
NUM_VARIABLES = 308
ROOT_NUM_CLAUSES = 7_409_760
NUM_CLAUSES = 7_409_766
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
    "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-sat"
)

SOURCE_CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-physical-slice-campaign/v1"
CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-sat-profile-campaign/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-sat-profile-launch/v1"
RESULT_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-canary-acceptance/v1"
SAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-independent-sat-replay/v1"
WAVE_MINE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-wave-only-mine/v1"
WAVE_MINE_LEDGER_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-wave-only-candidate-ledger/v1"
WAVE_MINE_CANDIDATE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-wave-only-candidate/v1"
MINE_VERIFICATION_SCHEMA = "p97-exact17-survivor-four-point-two-circle-v4-combined-v5-source-valid-theorem-mine-verification/v1"
IDENTITY_DERIVATION_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-sat-profile-identity-derivation/v1"
UNSAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-v5-independent-unsat-replay/v1"
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleV4CombinedRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleV4CombinedRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-"
    "preparation-config/v1"
)
CANARY_SOURCE_CELL_ID = "canary-perp-bisector-survivor-four-point-two-circle-v4-combined-refinements-next-center-02-physical-none"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-combined-v5-sat-profile-v1"
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
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-combined-v5")

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
    _require(
        sha256_bytes(canonical_json_bytes(SOURCE_CELL_IDENTITIES))
        == _digest(SOURCE_CELL_IDENTITIES_SHA256, "source cell identity table"),
        "source cell identity table digest drifted",
    )
    _require(
        sha256_bytes(canonical_json_bytes(PRODUCTION_CELL_IDENTITIES))
        == _digest(
            PRODUCTION_CELL_IDENTITIES_SHA256, "production cell identity table"
        ),
        "production cell identity table digest drifted",
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


def _require_source_campaign_contract(value: Mapping[str, Any]) -> None:
    _require(
        value.get("schema") == SOURCE_CAMPAIGN_SCHEMA
        and value.get("run_id") == EXPECTED_SOURCE_RUN_ID
        and value.get("status") == "PREPARED_LOCAL_ONLY"
        and value.get("cell_count") == CELL_COUNT,
        "source campaign contract drifted",
    )


def _require_source_run_contract(value: Mapping[str, Any]) -> None:
    _require(
        value.get("schema") == RUN_MANIFEST_SCHEMA
        and value.get("lane_id") == EXPECTED_SOURCE_LANE_ID
        and value.get("run_id") == EXPECTED_SOURCE_RUN_ID
        and value.get("base_head") == EXPECTED_SOURCE_BASE_HEAD
        and value.get("root") == SOURCE_RUN_ROOT_RELATIVE,
        "source run custody drifted",
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
    portfolio_id = f"{source_id}-combined-v5-sat-profile-v1"
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
    _require_source_campaign_contract(source_campaign)
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
    _require_source_run_contract(source_run)
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
    _require_source_campaign_contract(source_campaign)
    _require_source_run_contract(source_run)
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
        cell["portfolio_cell_id"] == f"{cell['source_cell_id']}-combined-v5-sat-profile-v1",
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
    _require_source_campaign_contract(source_campaign)
    _require_source_run_contract(source_run)
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

    _require_production_pins()
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
    _require_production_pins()
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
            "Run the gated 76-cell survivor FourPoint-two-circle-v4-combined-refinement SAT portfolio"
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
            f"survivor FourPoint-two-circle-v4-combined-refinement SAT portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
