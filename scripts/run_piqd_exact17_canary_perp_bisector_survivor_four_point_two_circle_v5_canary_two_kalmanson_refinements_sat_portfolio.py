# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor FourPoint-two-circle-v5-canary-two-Kalmanson-refinement physical cells.

The production byte identities are frozen from an authenticated source campaign.
The runner admits exactly the 308-variable,
7,409,786-clause cells derived from the 7,409,780-clause root.  It launches
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

LANE_ID = "exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-sat-portfolio-v6-20260823"
RUN_ID = "sat-profile-portfolio-v6"
RUN_OWNER = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-sat-portfolio-v6"
)
BASE_HEAD = "e55af1fac5bf7616dc22ea70ffaa414246471848"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-v5-canary-twok-v6-runner-code-20260823.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-v5-canary-twok-v6-sat-portfolio-20260823.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_"
    "v5_canary_two_kalmanson_refinements_physical_slice_cells.py"
)
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = (
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-"
    "preparation-config.json"
)
RUNNER_RELATIVE = "scripts/run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_sat_portfolio.py"
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v5_canary_two_kalmanson_refinements_sat_portfolio.py"
)
MINER_RELATIVE = "scripts/mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v5_canary_two_kalmanson_refinements_sat_model.py"
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-v5-canary-twok-successor-preparer-20260823/"
    "preparation-v1"
)
EXPECTED_SOURCE_LANE_ID = "exact17-v5-canary-twok-successor-preparer-20260823"
EXPECTED_SOURCE_RUN_ID = "preparation-v1"
EXPECTED_SOURCE_BASE_HEAD = "9fbf80623b867cb1f319d87649ed9f7fface9469"
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# Frozen from the authenticated preparation-v1 source export and the
# governed V6 runner/miner support files.
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = "ce6f2354707e379c57ccd43e7d203b5001eb112638391aec87133dcf45d3ab0c"
SOURCE_CAMPAIGN_BYTES = 123_182
SOURCE_RUN_MANIFEST_SHA256 = "083ac697d97894457d09dee42d127eb6f04ce6bdc91405180509cdd54b566bcf"
SOURCE_RUN_MANIFEST_BYTES = 2_549
SOURCE_PREPARER_COMMIT = "01e0f7badb6d177a11cbb481671dcbd192d3f78f"
SOURCE_PREPARER_SHA256 = "b8be5bf3fc58fc6165ce2f3cfe75760ac92ddd332046b4b8e7e017d59d07a078"
SOURCE_PREPARER_BYTES = 122_042
CHECKPOINT_SHA256 = "310b029fdf643db89661cad73b951711351b98a078ea8096f00d382d9d241f06"
CHECKPOINT_BYTES = 1_388
RUNNER_CODE_CHECKPOINT_SHA256 = "7746664ac4f5bae9fa35ba359778ec012adb0372ceb35f0f769bfad6b7af5bdb"
RUNNER_CODE_CHECKPOINT_BYTES = 985
MINER_SHA256 = "da467541586eaecd960f29f6b3200e6917ee121e46e6100ff4f434c9f7e39a82"
MINER_BYTES = 53_680
MINER_NAME = "exact17-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-source-valid-theorem-miner"
MINER_SCHEMA = (
    "p97-exact17-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-source-valid-theorem-miner/v1"
)
MINER_VERSION = "6"
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-none': {'cnf_bytes': 346304032,
                                                                                                                          'cnf_sha256': 'abcc753c41cd44a82bf6c1a32f2b330b5031edfecbe75794b0d292fe103195ea',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '9620d2a9e29fb3dd3e79e74bf885c5e3c9070689a1d05f9c0ca52602878ee0f5',
                                                                                                                          'wave_bytes': 1693,
                                                                                                                          'wave_sha256': 'fb3855026fa865f1ff6eff11ab0acf56c8f15ceccc8f1f4274edbc808b6cad4c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-06': {'cnf_bytes': 346304031,
                                                                                                                               'cnf_sha256': '75298987e38c1eb78912f9269392435c7929af8682d27619a6a1f87e177f057b',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '0648c38432f7485f984a7004cb1f7986270fffc0d4a703540d5d01ad44284140',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': '1b505c2b344e4a3def53060588a1138c82f551e4143fc6a0e7e62c87f6eb65a9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-07': {'cnf_bytes': 346304031,
                                                                                                                               'cnf_sha256': '435ad423c759374c9ec353d9b1ffe14a41ae40cb70dad3793cf840058d64cef5',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'fb26a3fcdee54b5475320d90107a1c1566e77b547806e269a11c446b3639b7de',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': 'caaa4e470ac39e0ea34af4f5c2ee890ca1f556a4e9d5cfab8611349812587f30'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-08': {'cnf_bytes': 346304031,
                                                                                                                               'cnf_sha256': '099abee8e60e979c819ff91fb9481d29bf68be50ced4dab797e9b8efb84aff4a',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '4a1fdc9c2d2c912fed2243d8ea18a24903b20989425ee531434a9cc4753e0106',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': 'd47bd67e0cedd6bbf237b1c1edebde1e5f7d603b58897f6e8a771ab3fd8664e3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-09': {'cnf_bytes': 346304031,
                                                                                                                               'cnf_sha256': 'e58ad9755657fba95afa1ca74834df0f3c6113ca4ec7e8d282c6d6562a4d53e5',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '3261b1d8ca18ed7bc78b4d4c1465d8e6616bc1b110098d47615f3c5ee89de0cf',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': '8ceaa9936ddca369dd5546b250ce9a769fc2e4984010dd96463b2b2d2259af8c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-10': {'cnf_bytes': 346304031,
                                                                                                                               'cnf_sha256': '42d771edd695277e9dafe21217b89be2db346290eba59ded77afe18952550d7b',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '80dabbbf6c2463b076735759972b0d8a28bc6e555bc376727ef2ab62734ce612',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': 'a71791e22f7230073fe4e333c33a47e62c55489d4ae8cff4ed13ab111294500c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-none': {'cnf_bytes': 346304035,
                                                                                                                          'cnf_sha256': 'b06e4dd8890c1f49d5b8a8a6e3bd6a3c89b3f1a0fd9df6e672a22d2fe794b96f',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'c7de509fc052bcadcd42a6ded64d475c0e439f0bfb9c7969552cd6edaa2f31f5',
                                                                                                                          'wave_bytes': 1693,
                                                                                                                          'wave_sha256': 'f9809a72a65a9ca2c7dd2d13f8597b13625fa9fe80a3ad4769534dc49f69b239'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-06': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '00d436f5ce547e0aaee4c5ccda8cfa6f63a0335e924416a1491baceb846bec76',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'ddd7c91398ae9024b5b4a2488f28baa35ba68487707ce2b44d6e7ac7b95c262f',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': '68ece7c36802e7347b69e369f372384672f5aaf0a6ba2d592bf7f312bb044170'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-07': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'd05f46fd9fb725c973f8b0f6f7109d1f5ae6eaee0107332dab2907e65f2c8cc8',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'aec40441e69acf9d0cff327cd3ddf246817063ce4b08431385928e96e97d908e',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': 'b37ada94814a03da18de6c1144edebbd5fa70b225435bf1e94cbda190f155cd0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-08': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '1de6b96052a0bf5112806a5b8336d9e281df25e55d428df1acebbf85bcf986f2',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '1c427e9f91c58c1815dd97a9b3f032fc0e4cb35d33835a9b0f92dc17ba36b49f',
                                                                                                                               'wave_bytes': 1703,
                                                                                                                               'wave_sha256': '8922d6c10a3895fa4ed5eb6e8125a2cc0211817ccdd59d613f9ae50a6a3cd433'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-09': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'eb7aba5786eed4b8c57029e27bc026dadb4fdbd9a6a0ab606a1993cab825f98d',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'fab63a47e0e81660d080efcbc004b5a5cb71a1ac3eb9ed3bad8940c2fa4491e1',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '609a9f1ea0985ae7735b17b2fabdeb2b5c533e2490f798e67844a032521906f5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-10': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '113b34ed1e96b800b0b0b44037435d712b2c5c410ea3ea8a80071c163808e1b3',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '3dd87f7b0fdbc650dfdfe53ebd2c737c267b900c2c3608e9e7c08712d4550746',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '308b7c691deada575447b2c9b745bc5cb3a5760d1fe4b0a96de1ec8f976f0808'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-none': {'cnf_bytes': 346304035,
                                                                                                                          'cnf_sha256': '372c8bf73855b0e56b92106d3d463d58f6b497abfdc26456a27e2240aeca883a',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'a14428c391093a516bcfa00751b4d684a09b454dc027d81bca0d4c549db96515',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'd54a894e3d1c0d35b2925389d83bdce8e75f52e7d25be0d036e1f8bcf08c3cba'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-06': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'c0082ef5c949cff04d464d7dd723d5330e2bbfeea015d4a26cad9eb69e4addce',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '234122fb0e8f3a361c141920c9f04918735615e04218bc534befaf4da33bf564',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'd95caf2fe1796a8036a0040db75dba9f20781208bf2bf8529a12c68b367715ba'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-07': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '2a548e9ac6c695c7b560c138ef9fb7847ef37670cd1d9ada70292f3b54374b8c',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'ced9d4631ff5d09c3fca952b411b05f8ad414d0eb17e8a5e6522fe6b5738210d',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '67e3e4ec842df8a36743d575327351a57368baa102f05333c87b597c729fdaf4'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-08': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'e456d71a2b05086c56369d73f122f902eec6b8219b84745076a5ae4d53b45036',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'b4e862b56eb90c82971bd358616552abf277fabf64e767066820b2feae4c7dae',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'a1389b80a9aa06b1d552319268c951d35e052b0bcb0d5c60211025a4f0f0d7b5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-09': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'b60c28b00ddf7cca31bdfb4448a852f1ee8cd5e6fd4c5b92fcbcca3f7812aa9c',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '5831ec529bbc086b50c73ecc057a6df4ae1993c0355add9493649e622469455d',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'c11d25fc072ec37ea2807d4c81e1724f8524fe628dbd04e4a5b88adbc530ee2a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-10': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'a49d0fffdaa5dc4d54a740c67dce8bddd18c7e823df74f908359b7775fcbef47',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '597c25551b60651b16b470aa0276a352d93bdc4f67e4ab6448b1becb2bfe0e6e',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'eb6b339021940a0a67fac5cf4b7d633bea964233457fd7f4f2295c46d3be1c10'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-none': {'cnf_bytes': 346304035,
                                                                                                                          'cnf_sha256': '23f6db12ec222dc360ed32e95b313b6ea8b3a09ee785e4cfe74d1c7aee13e657',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'c3df00f130b3a85e51a507d2afd6d49084df99f56d503f50ac37fcd3a9ea0ab3',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'bc0466f1d3dc8b1b4832869faad73cd902bacc44fced5347bfb684a662dd63ac'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-06': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'e0c67e471f21342662d92443347d4567219919d1501e77e11eb5c07b52d7e89a',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '77f1fd65e5e1a974c6dd1293bbcbeffe0ffa2f935d2f9eca1c43584f5f402a9d',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '239bfea2c622e3609254479a30117441dad4c707b824a3a01acfef4a6cf76a17'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-07': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '48f638b106549d821290f7b1ffa15d2a42ce1cc9380f4f50964ed2b0807985d8',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '020668873edeae6408899e25fa7dd16d7ce46188aee55b73abdebc8b289430a4',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '619ea4588091cf77b4ad05546804d3e48dea01dce21ff291d097faa17a2609d8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-08': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'f12046e849f07952b5df3c3712cdb32190f50f4159aafb7ea235c3597e728d26',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '91676ecaabda80aefa52e6131872cd43b3e10318cf50e457caca3363da0e42ae',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '5721a703d2628b2d3e33e5494405ff14753f9d3bb5a205306e3c4bbb08e78a2e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-09': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'c707f8c1a64b341a9f9c4eb04b530a111b75484602b8546ca7667c598e1b209e',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '6fa173ffa1f13ba2041e756e0b650effb710ce9f87cd07753e8a7b8f925c6698',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '719dc54828ab90ff0abff8d7ed8b6a6dd953d8d76a9d05aa99a0be61f89a01df'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-10': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '6c5e5c5867f2bc0554a0e5a6bf6666713658220c0486e899b7ab21546d58824d',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '517bc246f6accf860ff9c1b6990e9357204034a6cd466a47631a61acadc7cf3e',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '205894ae538f5e5e3cda14ecd822d78ffaa5de026da53cb4bd87ab1073c4e894'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-none': {'cnf_bytes': 346304035,
                                                                                                                          'cnf_sha256': '468290ad92fe0a981b2b32ff7dbf71cdb464c3668702d9d9e0517bfdb9d0d8f2',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '38a0791ee729129d76ed1c1bb6fd0f57f39a9a2ac3a6a7773c59c7e29d0e0450',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'e47cd3558865ba11be1edd8f8cf7b42ef8f10c8ede33363e701064e276c55c9b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-06': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '206e2a079f088bce3cdb74f27e1a9fe31486a1a1b4cb3214542d31d1d4942ed9',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'b617c97b6f8d4ea0f1b7f3549d6fa3e8ff4120e0c302dddc34d318d5b92ec694',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'eab5a9aad4508ea94a14cbc831e62b37914d2128c4b12ed38fd5e0def91e3cd4'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-07': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'a90549b65e55c2ba05c98ebeeb9411144850b863fcbc886186bef8054d2253b3',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'e48878e39fa6e43e616cf70b920f03c1b6068a0f5f9c504c3d8819d3de2e9c97',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'd2ad985fb95bd94d05efe3d555e60836e594b89dd6572745b845073666ce6c1f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-08': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'd995eda6fe89b1d802e0ececa1b8b810cfa1891934608e4afe175a4fc2500858',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'c52f2946f4821227d0f20efb507be20cb0988d6e5fa7f9c47cbfd972e3a45012',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'ee806ab46b8f357e93110425ffea79385862271a34acb076c9c2101f08047b57'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-09': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '1615b3a1a909ae70593e563f2d17a1ba02975cb0c29ecdf81a676abb94dafb94',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'f17011ca72327b887852d69174c39efb49e8f4e1b7d023f0839d2f505272a7dd',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'ef9a037038cc55fae4f266f5de6e15faf71d93f8cacaf5da70a0a037614da836'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-10': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'd72a7b704df9e030967775ba692636c640d592b5bbc6b04f3bdce01d336a8c94',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'bdfa856795116677a933fc180542d74036b3704119cdbb14c3c8c7c0c9804cf8',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '44da28da094fbba2bc7131fd21480ae96adee0b7da8a2cade1ad4916b6f8fcc9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-none': {'cnf_bytes': 346304035,
                                                                                                                          'cnf_sha256': '16af6b2fb44a4b056eb8b12891c5bd2b6491f31c994b885c7cf11721e2bffb81',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'ad9bf122202c2a07a59884305aec44b2716f2505497773d0b297c6d3ddf988af',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'ea980624ad1d3fd51d37bda5542b398b42dabac8d30c6bbaa0752725dc431b2d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-06': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '9da0614888b0c369b6fc33a71b93ab040c8a3bf99dfe8b42c2af7b069e4bd43a',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '7c6321df6a631e5af49a9684ac1e224970dd42f1c166461843760322dcc1f657',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '52f7c4d90100a34046a0ca3b37545066a99c826a563d08189855d66705d173fc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-07': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '1fbb362c219b769e7fa98cd48975551ff89b7aa0e16efc064563ba48b0d8f3eb',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '79920260621de48038b59f320037c8b568fae223a1a9a19327987d381352d408',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'ced92a7e09d3d9591e9de4f88c4d0b93cdeb4200c8cd3d4b45dfc561afea127a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-08': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '53cbe8a8e3e582885c81cda7e164ac667fc45625cb343681c07c91de9be622b2',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'fcadd3342e0579cfd1a33a342efe637ffefe685510d5c1e72ee4e193e97569ca',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'b6ac72a582c048b9c20a16d27ceea64b4e53300a8f0d9e88f4ad402a08831023'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-09': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': 'bd48f1525d5fa6e97bf7af3cc514c13087373985c210132ae5dc237b1c2ad835',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'b0dd34f01efe053b8577b3f96ba2e35598ac0b9e42fe3461b16ed219bdfa65f0',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '79f6a53ce790bb4ac304fb9b681428d0137a7351a67b34e5f3a367cf0d4b1e28'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-10': {'cnf_bytes': 346304034,
                                                                                                                               'cnf_sha256': '64a6cc6c5a7af48fe73f7972a5203f34d4a66b4de09ba1af0c19991e9e3f8355',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'd37cb348169cee783b7001130126855cfbc5811babe6dd85b2e76a0a320f246e',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'aa803dd85db61f6a765906f3d1888dc09e19a5c1c63f45818717a6e79bcae1df'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '48119bcad8ee2ed7120eb6ab6f2ccbf74f630b0f6cb82d7652deabada95ae7ef',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'd59728041a4a9750ecb48e3809b5cfefda7347f40454a5f61690ef6f89b656f6',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'f99dec7ff069814419c8a7922f8b678ab9133f439bddc59dcbc8ce452f5f3b0b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '99673ca0a3f36df73b20dec70288b535f4122155a0a5586e15e791e019b1fe5b',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '0fdf6b19af0b0ab5574f7a069f494e945e3d4c1820751ea4b73ff95b6f2d1828',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'b8e68e517d035348f4872174ce843f65a20f533b6b30d9917e27e56ddb5e2231'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'e2c600770eeb764f027faa4fae8c9a6911ea3eed3b4ccc5f11cdaf7c5ef9a9c2',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '8f0283ab0ebfbed1c9ea1ffe0e9b68814914bad9b49e1baacda60a1d60903e3b',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '79d9717e2aee2ade5615b7bb16c6bee78fc6358ab9b7820810e41a7acaf55556'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '3053fec98286e63ddff8e6c5e96a69acf431cae3bc79652d3e9fa11e626934f6',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '454927fe306d5e59056ca560131d51297ed57b4ac1f1ef37cd516836a295a917',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '600efded0bf39f5fb53e7a68c4ae13d0709602b4d410df4a329faaf9d5e1a8f8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'eacf48f735fcb91e9bcaa868a55e001ec96008ac77b2a6857dee21ed92f744fb',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '269a406619cd0a57deee185d58e2f26581b94ec3491ce7bc408a6bf0f2802b2c',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'fbc6454ec999af69bac71941aad92a9786dc7f99d685ad1e13e0f25f2a20ecdf'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '981bb78b3e231a52e3e2d98f57cb9412b4d97446087973561da7d953650197a0',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '9bf414321796d068122763fb95438bd8de939f5a9feaa6786e7520c2713a925e',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'a9eeaca02de400cd1e37eb4df99e0526bdbc57f695fae91d1fc12322ca2e0ac5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'd9222ae42c381a114cf8f5d5d4778a3a794cdf4bb264c148f74daf99a963ec1a',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '8a86482cc353056dee39be494467443d04146b6acc7512b960175d94fa727ec1',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '97f0cc628257a497dadedc8a486ea2a0df6fd51a95b400adc2e9409135b675bd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '85d9c53a58f0ed1e8f31a40aa92c97fa5b7f5877e3898a450800fc0c1780daf9',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '5b82ebe2912df7f982a7c89b7685cf46888667036e98405be455f9ff5bdf71ca',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '8472d5d565883d03246af579ab4d91cc6be914b47bfcdf92e339844f5d0983e8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '87494c5bb99591887cfa7db2ed90741259325f0f3b578580fa2b906bece8c9ad',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'd834c9c5405269b890f1434a907e93b7ef44c1e24357fab6d6e0cfcc5534ca80',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '6b54428612667f4414c8e853175547b21d089af62bde5fc2b55cd14ded6adfc1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'd017b2400e2e9a2ee2825dd2b76998e7e1da82ac6bc33a0e3881a59fff2474a8',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '6b5c0fd4db98e93364ce86a946dceda3f9bbee78410e3a95f962c45d0efb0258',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '8dafab87bcb41a3dd496d226343e97c86c74a19f10d1bbef2666b4d11b4ad740'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '8ad31e82abfaa4ef4273d4b74a76d49ea4d1b59d4a94be3499df80b2fa20675f',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '7ebe4b0a48921abe048eeb4934c9c802415d535ad3faf43ea30e59f2d994287e',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': '7c8994703ba6293b25a4f99022c240e31ee1da3faa3056b91effbcfd1806b42f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '06b402b125ee94ddeec82e0b9d464da40dfdaf5cea6177485d894e3bc3990b3e',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'f9493c39c5593fda1b9402b3d57dc88c1dea5aa8a8ec182b31adf9725ab9a217',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'a8901a568f1be7afccfcb48cbd6b0101814ab4016470d257fb636e074d16fcb9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '6bed7b4ed9250998982d7b3e35cadef4307b7cb484e872e333f8f002142e1ede',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '8a10446e19839c206e4aea96674517c1a778031509aa47c895dc8e3d2bfeaf6c',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'b767c1a98b45a38aa6f96f00c28855851fd5c21e9f7096d39f1e350dc903eff1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'f06a9824ba6c1fa59ce3a647359a2a6288477c5b1509083499dc1daff0b264ba',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'a2ea2300621dffed9c758ab35bc01a11bd1cb96be8153a11e34f1fa4468493d2',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'ccd20c39e3b70564599759f4315b141e81a9e4f012c77dead83d1677f23178d8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '1ef2d56c7ae80f687d3114014295313ac875bde1dbd027e59ba4dd3abcdc4c1f',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '54204a275a95ff06bfe88a47da2f3fddb2f63271c49e65bc0602b31f28414981',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '79ea43e41b9fa94aab550cd79ca41af7bff1839507a3e8f36009fbe900c5a66e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '6b03e5f3cccb2fb3a6564475a2af2473c7078923a63d717ed3c1219ac1a644fe',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '9e04a114ce3bf3f7594c2526564a607700171de3e9d4fe540bc601bc4bf21a16',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '51d717d87a7cd1e0ded243230ec23db5cca25a9d4d6edc6508d7fc65e38143d3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': 'cfa739f997862d424201aacfac8ed554796ebdcff3e67cdb29dae2e5c96deeec',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'c127896dcdc5676a09bd0aa685ede25fe995bc37ccf61d24c3b0d35f3cb1c386',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'ef4b87014712ebfbd71c2855ba150e9389a2c23b7c778a49f6920514eb0d4e92'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '64f61783db3f7ded90ee335738e398bf1316060cd98fd2f8984b6cfea2fb9e2b',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'f0310a6ecde7c7b1795730300ee6e3f794967652c6ec5c4bda7efedc3d5ad03a',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'cabb99ab9fb98f0c696e51f6e12804af73fdc21d8bc29dabfce4d020f3e6f197'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'ac1ad352581c165399866c2811363bff82e44143c2a4fab6befdd60b7df030a2',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '521298e201b33e6745f7d9d58674f9930c5701d17d3615284cb7b063f908588c',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '4b3844aa730f18f79aeec760b897e912e0379388d36c8106f28d324cc689da42'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'f70ef92952288782da10563be5b10e312d680991516bca5986323565ed869108',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'b0343f53521ce176371f204aebdeb3c70cfda84b192c2140f0e4d99ba64663c0',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'b63a6a00722f74f828d42c3928c58d0e11118f018bb1d46c125edd86fad1fc56'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'd93766a6e30179d71c6a93cd39fd930f77ffa868623ad0aa1d68314cea231ba5',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'b2b295596cf97c2b33eef2b385092af9746d65ac5b08cd9688aaa3988c1c3358',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '005638eb300144a57383d3a79f2d95eea888592cdf120d1c1466e9f2cb8c9522'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '3d6d2b654eb4879d9dbd00295c35f8543493e202bc7f75663efb9a320cb91b50',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'f6a6ec340f1f4abd1cb8a481b42427eaf89694dc96f3d038c404bd04ed220bc4',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '6db81c2663cbe8c418d7cb0505d11c56ecda732bb16b79b74682333765313460'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '69af13c8650a463b656beba2a64497118461e3cc7ca0befaff5df039350e0870',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '34b604e0a8d779f2d7d526ee038d472a1e3241f0731c2eac3286587ba2a373fa',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': 'b499efebb3b8c1ede766ffed32e0f9e63811cc4b8a0e2e51bff06f9f4ad69bf1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '52fbf8fb84d1325f1d7e43abe0eb8ac89eddab2e4a9990806310044e1d313a73',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '5ce5ee7b92dd15778fbf45f151dff63d6f2d97985612348ed6ae71a7afdfb911',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'e3695874ebf39413bb6a2ff92025cdca295be94f14e252eaa866f93f9c73aa77'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '2552f36276a08c98dea453670ac2825acceae7dbbf22c09192b4a1995d03d4ce',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '7bc35cf2f424e71827e81113543bd9a362540ffd86368a4daad4afddc2064485',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '11ac538cb17120eb61f606563f140eb7dd2acef5b3d3505537e9c675225ad8ee'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '123b668e67bca2b2fe70fb538b53807a9ec619cc3a77e8a56b9946c3a219cf04',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '72e0e79df2d56c5c8e67bbb8c16f88e263f851bd9ea47588347d507036a1ac07',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'a073f405d339305bc0e9ac72e479beff396ba1b6f6a175043446e7959a951086'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '94a26fec9ff5da2d8b1362b350236f5311a5243a5e654ef065240be3526cc421',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'c8d40e318e775a00e82e6f38f970ec9254c1c43f48d8581bf734d27bf3133511',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'fa0860aed2b4db11365a8faaca82d9be158dff9d3fcafc84a9627be269c3bc95'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '7b3f6b70ea48c87058d5dd889c3d599334a4f4e2d394125360635ee61fce2f6d',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '6d04d6e7aa89312cd0a643ee9e555fc1b51199bd7b9218999e8e20ebf0ab8ced',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '6f0cde304713fc8b83ff8ae93fa2c5ee2a9cc1a050158e111944227fecc2fac9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '376c91f2151f82699ac3999453a4f0fdbf648fa716d1977b1b8e8e3ad3a73eea',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': 'e3e65630d3ce44f69c5e4413e4fe2979b2a916e5c9996553ca2cba8dd3828723',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': '4e5bb27eb89899dfa17bbc04aa4745fb44faba612ccb1d9a70a30966660d427f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '05033b6bb72302a46afc92af213b4b03934da25de631e3efb8a0f729abb84a68',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '391a5090e865e15cb7f7e77ea6c501d1d5e993231230c606023aea86ff414f12',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'f70cfc84906f172d9c5a570c8154c5d2cd1f638b82a4e808f5faae0cfd89e3f2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '4cd5c5be8c220366434b9b281153c797cf31c1fd39d48279364de3b2b3da51d1',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '144a761d592bd6895e78770113196735e6ddf332dc37444ec5e20a4ff26435e5',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'e43286a3f02aa6d78d0ff2f52cb0e8df2c645ec1b4101adf593e3ed75e0699f7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'ff7b6f71a36bf0a4c7a06916cef2e0e40751fcd46ab664009570ae7ef3a0e386',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'a9278405d1b7a59f989ec7cf031a466a2c5fddfa54adf857a524df4e6798f404',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'c541305e3f72a22963a7f75c9ccd738ecbb0830c112e0a9e9e4b98864a3bfc95'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '3d2be83a73dc8158c8afb71a6dab42b27f6b499f62a0a5a54cc407b0e6cf01af',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'a57ff2a6774fbcee66d84f9a6f1562820bc0dddd732725c11e1cf8087eb116d1',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '742649592022700dfcd75fe33e5256c88dd28362ab2d31d033c6c484d7515541'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'ab77421973c5634e898ba784360b853ceea2a326354cb8c2ae8f90fc5458b39d',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'ab5b16aa61bb48ceb4ab4b778fa2911e494a75808235d63b727025b2a8e30ff8',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'd6edf91364c503aa49f732c97305d3fc1f7f8721ec17ff3e33ba68042ae68e7a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-none': {'cnf_bytes': 346304040,
                                                                                                                          'cnf_sha256': '472b47f5e949e9f64d87f20531064613d33348d5eefeab354117167df154a052',
                                                                                                                          'producer_bytes': 9956,
                                                                                                                          'producer_sha256': '7c265e8810e052c2c47c8f240c1e09011ed023f34fd7145341f3af7cac7d97fa',
                                                                                                                          'wave_bytes': 1694,
                                                                                                                          'wave_sha256': '30d2447bacf80081de9c2b3ad15e659aa1a4fa21b65d58071da89ea2655500f4'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-06': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'b23ca4527aaa1674dc9dc14541d132be730fee96bc56f31df3b72ed836c447fb',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'a110ebdc5eef1892bd978dd166d23ef0edd24e60590be611fe13cc1d355e599c',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': 'f28d4a52ccf86b1c9d546523b0ec8a1ac0df566f51d84fe26e47fd8d85a06530'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-07': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'b228b83bb4038d25cf352183a2ce5d772d1457cb54fa4128cfa0e4b89d0746c7',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '9e36355816d9325f0d000f6c299bec64a24f1c0caa3f46912b6713d557427ea2',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '4f4e6d047b5f64377ad758a04a1735adc5d4208d42b1164ee4bb302b66ad1d28'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-08': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'fc898e7641dc4f6cb2c78e60a4cafb5379d13e751b95e41cccc673779ce6c677',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '65ee8b9eaea0c5e21d652f6da2ad26cd15923e815f7025b4931c5e92b61b173f',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '565399aaf805be1e521e1b234af39306e9e7592d6f01251b84438e4aaa43a3cf'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-09': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': '5ab518da852ce63f0a7b5be0ae4a3f94751a4b912798284ebcb16c09eec74f74',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': 'ceddb91c0313305c8abcb9c99b8ac5e41c3ce8a3c3eaf40e2075e14ed6a8768f',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '6f85caac2919cb043286403ab201c30ac3c761538ce7ab8a25d1c817d60440c6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-10': {'cnf_bytes': 346304039,
                                                                                                                               'cnf_sha256': 'c1dd0ecec591cb9727904ffc6b760313dfee3d93659ce31867a3eaac155b6021',
                                                                                                                               'producer_bytes': 9971,
                                                                                                                               'producer_sha256': '05f6b58bea0d1278c799e61557b3bac45297f734812e6a594356fe834d498c58',
                                                                                                                               'wave_bytes': 1704,
                                                                                                                               'wave_sha256': '70ae94ac341684907e7b0e992f9a61482175667a7533bcd6c4986bd6d72eb72c'}}
SOURCE_CELL_IDENTITIES_SHA256 = "9c03889037fde9c9a57cb2eba1897e71dd43cd97fdcd6fa8e841ee91e1150763"
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304032,
                                                                                                                                                                 'cnf_sha256': 'abcc753c41cd44a82bf6c1a32f2b330b5031edfecbe75794b0d292fe103195ea',
                                                                                                                                                                 'identity_hash': '9425807ef5713de6aaea03922f057924bf58d515ae4a2e281bffd9ad17ecc308',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '97a41c27b7279edca4e77b2b432c162dbcd44fe740bcc3dfc1434a31cad40361',
                                                                                                                                                                 'wave_bytes': 1715,
                                                                                                                                                                 'wave_sha256': '03f2b3267f54d09b23ede2263ebbfef83fa7f09852838c64f4bc40aae4d15067'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304031,
                                                                                                                                                                      'cnf_sha256': '75298987e38c1eb78912f9269392435c7929af8682d27619a6a1f87e177f057b',
                                                                                                                                                                      'identity_hash': '996ec621a633b727b6c03cad86d26050fd8eece91b65b87401f8bb2c0fe43685',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '0fbca176807e8864930e9760f05ef48e215d5227fea4e19af6ec1041fa352760',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': 'bc9548287deeeea13d4d1ae1d72560e457bfaf2f10a156af13948f657244eef6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304031,
                                                                                                                                                                      'cnf_sha256': '435ad423c759374c9ec353d9b1ffe14a41ae40cb70dad3793cf840058d64cef5',
                                                                                                                                                                      'identity_hash': '6f85a03b3fd6b2cb82177abb5885060612a46fdcb1e65d52075f1334d99e40de',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'e5bdadd2bf9e42974cee886f538b5eb1deb87d19057f1257610ce32d2d089f2e',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': 'ff89523b2420a5c0278c87aa1fa760271cfb4bb35628c1e547f2f34759b14a08'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304031,
                                                                                                                                                                      'cnf_sha256': '099abee8e60e979c819ff91fb9481d29bf68be50ced4dab797e9b8efb84aff4a',
                                                                                                                                                                      'identity_hash': 'e08afc7a4317b27b0396920f1ce693b94f8396c9891daddaebd6cf4f65ccd544',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '69445675e743c77abce346e32899464ad4a8517a17a44119899d8dc87a139081',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': '7bd1cceaa21e4dea7d721f79e85a04c64f8139da678f920ee7c5d014515fe55e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304031,
                                                                                                                                                                      'cnf_sha256': 'e58ad9755657fba95afa1ca74834df0f3c6113ca4ec7e8d282c6d6562a4d53e5',
                                                                                                                                                                      'identity_hash': '860e21a8e1b5b7c31a28d78c623e9b0eb37e58ad254bbc9e5a865ba400ad979e',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '2db20d7f24a901d7192543b7afea3b7a038643868675b3380a8d885f29636ab2',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': '0b711419ff987c356820811b9a7e56f9dc1dad3a817d7c34b25e7bd46f54912c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-00-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304031,
                                                                                                                                                                      'cnf_sha256': '42d771edd695277e9dafe21217b89be2db346290eba59ded77afe18952550d7b',
                                                                                                                                                                      'identity_hash': 'f6226536e9b6cf9f38dca3bc055b49ba5500e1beb48499bf704745a8a8d47d92',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '86f0dba49ff3c4d8512822e3c9f19705f23e82d67f7a4dc6b17a5bcf83caa9db',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': 'f0bf3996e247500ce1e4b7992636d5c7ccd5663606e74ca33e8ed3a6264bff36'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304035,
                                                                                                                                                                 'cnf_sha256': 'b06e4dd8890c1f49d5b8a8a6e3bd6a3c89b3f1a0fd9df6e672a22d2fe794b96f',
                                                                                                                                                                 'identity_hash': '97efbf14b7fc078acf87e99cf0443133cfe97326428ea1516a84c35e33013241',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '10d0a65c4b95dbefecb494da4bb8bfad9d96c561da63f22130c213d2a8a6b34f',
                                                                                                                                                                 'wave_bytes': 1715,
                                                                                                                                                                 'wave_sha256': 'bbb497b702239efc2c80da1cc9c25c63948f24f18471507ff36bbdd9d8a076f5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '00d436f5ce547e0aaee4c5ccda8cfa6f63a0335e924416a1491baceb846bec76',
                                                                                                                                                                      'identity_hash': 'bed45753e74738d96b7e681a2ac1563b3eb5580456433ae5452d27a9f72769fe',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'e65428d56a5e31ae1fc8aee1bc1f8033f848edcef3f42b9fba8e9d9cd91f76b8',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': '6b8db40ad56e586b60f02ca7299b678deee907cf8bfd2869e6e80628195249db'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'd05f46fd9fb725c973f8b0f6f7109d1f5ae6eaee0107332dab2907e65f2c8cc8',
                                                                                                                                                                      'identity_hash': '7c7fb4e1289657de3a4417f8369347e74ce5686b5df0f26166c2d6eaa1ea051c',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '8240685f5d4c4dcc598b6200bfe0423cf49b6fdf6c114aedf1f57142b5160ce9',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': '6d5c400e3e25f376a64d16e7032d96563e0598f7ef24c9ff69bc5dab6333ed68'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '1de6b96052a0bf5112806a5b8336d9e281df25e55d428df1acebbf85bcf986f2',
                                                                                                                                                                      'identity_hash': 'b8808a7fc34ac68cb812f38addca9d7f015cc0c0c15be6ccf55b7ab10397da4d',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'fd0c434c42a97c8f5dba6f6ea429026a9b6f7feddf82dced3dae5152f76206e4',
                                                                                                                                                                      'wave_bytes': 1725,
                                                                                                                                                                      'wave_sha256': 'dd25ef6d6ebbb31c7681f20cbbc801a8d91acafaad8615c2523e41d8636a1443'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'eb7aba5786eed4b8c57029e27bc026dadb4fdbd9a6a0ab606a1993cab825f98d',
                                                                                                                                                                      'identity_hash': 'e48ac8282aca71c9450c69249ffa61b1ec9a6e56e96cc8608e4a82970d15cc52',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '0197e7d2df98d06f26e3756fd68e115df1e2a5534dafb891e82c9a89638ecb33',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '04010db48b1d14670eed3b8bac46a5220c002dbbb4e10b6c09ac3521cdc205c1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-01-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '113b34ed1e96b800b0b0b44037435d712b2c5c410ea3ea8a80071c163808e1b3',
                                                                                                                                                                      'identity_hash': '5441dce66a2cc90cc310ad70fd03363c0568423b7970c57b019dafc5e79b80b1',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '0c991ee21bc3d479f40ab3c38c5c6077dd1e441990be8a762986cdc58140b0ae',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '7191c375936b2047cf83266ff69893613ea1f64d77f7ad549735275090e26460'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304035,
                                                                                                                                                                 'cnf_sha256': '372c8bf73855b0e56b92106d3d463d58f6b497abfdc26456a27e2240aeca883a',
                                                                                                                                                                 'identity_hash': 'a69cf4aa8f9629a5d10f845de1121c2e772ab553f4cda31da8b027fa466fa67c',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'dc668cb18ec07d9e3bd45b62da45568675462d3fb8d1d9d3812e1a9645043549',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '857a7d05b96f0c9d3242d2e273592f9c4be9787a60c8d24ef5dbb5f8183e3524'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'c0082ef5c949cff04d464d7dd723d5330e2bbfeea015d4a26cad9eb69e4addce',
                                                                                                                                                                      'identity_hash': '08c5f38b891722cb8afef72bb6c0024dd5312caf503e8ebb46571210af9afbed',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '5406d8883094ea403426285e74563784eee8190f10828b3be38696ee2eb62323',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '32aba1827ca7df166846c9ecca12585ff444fb7703ac486b43f6855fa88997a6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '2a548e9ac6c695c7b560c138ef9fb7847ef37670cd1d9ada70292f3b54374b8c',
                                                                                                                                                                      'identity_hash': '79675b8f8c173fcef0cd5ecba164789856e5135ea00c7e6441497dd47891a320',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'b1e7d00bdc4905df9f992851789aacd5531f9cd0c98af37c5e0ca74b35bf114d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'd0ab26d895f3aa6bd1b1332e8e3b70ddefef9f97e2e82df56a7dc266e3fbea10'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'e456d71a2b05086c56369d73f122f902eec6b8219b84745076a5ae4d53b45036',
                                                                                                                                                                      'identity_hash': 'ddca470e64c6a2e9bfdb6d544abad5a71d087875f8e99017b9d84be5fada2879',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '36de245257736fd7293154a78ee7aecd94043d0c75efbf8bb5f66f012d5fbf69',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'ddb2c86cd76f34706ce1b8e3ec82721ae51dc6085fde7a9ac8d1eeab7b5f9721'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'b60c28b00ddf7cca31bdfb4448a852f1ee8cd5e6fd4c5b92fcbcca3f7812aa9c',
                                                                                                                                                                      'identity_hash': '35176d0311874127cb5b8bc64fadaf0335699a704f4eff68360a28ddb93312f1',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '7132bb6325e2a88466da6fd21e85b79b1c3fe86b792eb801370faa13669c290d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'cfdccde01e7e3c5ab3773e830499400f8eac52494b744651d456234e67f3bc45'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'a49d0fffdaa5dc4d54a740c67dce8bddd18c7e823df74f908359b7775fcbef47',
                                                                                                                                                                      'identity_hash': '4c9edcd2586fcb48a45cd17237bb5047f60a3c170384dad39860f2a54ba655c0',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '9fccecf970285e800f95b72ef0134fe9a9036c60264d6336aba20ac3ace2ff63',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'c4f4d9636e1a43aeb4d13f975ba9ce8d91da2a5d48833a7c2880ba9d25d775de'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304035,
                                                                                                                                                                 'cnf_sha256': '23f6db12ec222dc360ed32e95b313b6ea8b3a09ee785e4cfe74d1c7aee13e657',
                                                                                                                                                                 'identity_hash': '465f178a3da7cbcd56612cde57df8fbcff9927f501af93b0f85ab69b14b73c95',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'e623570f29eac87fa2cca83bc3738f759b20ca0cf650675831fbf517ed7e83e6',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': 'ced70ec2bdf4b3c241ee77ee89aaf711273e8a406dd3a062888b05a2b482a9e6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'e0c67e471f21342662d92443347d4567219919d1501e77e11eb5c07b52d7e89a',
                                                                                                                                                                      'identity_hash': '735c12e8699bf2a8271a2716a42decb56e63629aa51057f5c16b3a68ab70d4be',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'f5d36b3f9116ca6812d79f4e0431068c044c15c8a68fdbc9d2f2b204d3b5368f',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '931639f85504e3bd591ad20fa43d1f33261e176896ce91c0a90851de36e7b447'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '48f638b106549d821290f7b1ffa15d2a42ce1cc9380f4f50964ed2b0807985d8',
                                                                                                                                                                      'identity_hash': 'b2d15e895ff127dd84d3e13b5af248cb08a972ec54094a04f752ecdc06f7ad73',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '226e0a106b578a62e8450b57366332c98e3062b8b28dd7df8af02ab55905e9a0',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '6f447a77f26bd0e08dece84767679589f7386e50fa80d26dd91491b180307530'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'f12046e849f07952b5df3c3712cdb32190f50f4159aafb7ea235c3597e728d26',
                                                                                                                                                                      'identity_hash': '9220eb850c9c9d07a266836e8750854a015387ad987a2382e6940385fe9366a6',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '22fabec637dd2a10c28c10699b5dd18cf8ef7bed3dff1e82f22d7cfa6303efac',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '6ab20db58c6a644a80923e81dbc971033385098de630ca67945a7876e392534c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'c707f8c1a64b341a9f9c4eb04b530a111b75484602b8546ca7667c598e1b209e',
                                                                                                                                                                      'identity_hash': '25917271273fd5ef953f8319c8f202edd271a88661c0f1d6cfb6245267911ba9',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '18bdfe2c1f1fbc254c8f9e9baf8ba42c662da06d11a3dd313bd9e62f2bb5e7bb',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '7a580ac637f6316df3c7f06a38eb2fcfd2a3a6447f655cf04a7585a9593eaa09'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-03-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '6c5e5c5867f2bc0554a0e5a6bf6666713658220c0486e899b7ab21546d58824d',
                                                                                                                                                                      'identity_hash': '7b10d68e40cd80e90ebd6af8ef25d3db283c7a6b3d60e2e62e247c5a2ad4dc04',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'ab0e7d7f07391840ca49e680e2452aefdfd4ce317452c5a61a02b0c8a4885409',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '578b6fe2f36a65bcde295e2e1f26ba3a661dc7ac894f6f13443bc76311d8dd5a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304035,
                                                                                                                                                                 'cnf_sha256': '468290ad92fe0a981b2b32ff7dbf71cdb464c3668702d9d9e0517bfdb9d0d8f2',
                                                                                                                                                                 'identity_hash': '8c8edbd1b5dfaae2796b46c47927d55f91869adfc0185d605b6fd9a73079bbcb',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '55e92b03ef78ec1f003aa80bb208e274a614e4074d35682d12279ec9600e9659',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': 'b6135da768733ba707f0f2c7de9c6c4b0d3c9a26bb8b8ff498e6b078489e1efc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '206e2a079f088bce3cdb74f27e1a9fe31486a1a1b4cb3214542d31d1d4942ed9',
                                                                                                                                                                      'identity_hash': 'e97e781d6c807e946aa268a4964d72f564e837f03586812acac34f6ba11aee83',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '364bab8dd4ae81c2cbc3f71476b7dc197f79a8fc4d36ec1aab4b7e30a06eae76',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '9a76cf4d2a4a576486c5fa061723bc6da9b8bac6480ec3bd2ad3f4b340126e91'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'a90549b65e55c2ba05c98ebeeb9411144850b863fcbc886186bef8054d2253b3',
                                                                                                                                                                      'identity_hash': '1a34994395df3ebc2500891453877e4a83810665be9ff1deeb134c9d5d4dac65',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'd769d56f8a27d2645f04cfdc441e0e36a5381e1d14b8336dfb521220f56d27cb',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '65369b2c8c8349537083feebd6245f9d960243bc239935429b4e5bb627985110'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'd995eda6fe89b1d802e0ececa1b8b810cfa1891934608e4afe175a4fc2500858',
                                                                                                                                                                      'identity_hash': '6f3af04a4a1219ee36c1c9c14bc614b08edb8c4cd371137d1e5dafef34c23b6d',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '8710b17f09c979be82142eb4ac53452e5b77a0d63dacd6aec0f2eb2b1a58947d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'eba32025381c6dea36e6098f9559eaf1127929231aa265858021a0f55e8936f8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '1615b3a1a909ae70593e563f2d17a1ba02975cb0c29ecdf81a676abb94dafb94',
                                                                                                                                                                      'identity_hash': 'cb5cdb5e94bd2f8a85cb2803dbb3805f3eff4bc5d77081fb290282edfe734b75',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '0f3f6ff4e1260657fbeab64e9969f8cd6da354f62b3d13b0a1a976a2d25eb77a',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '7e03e19461970e84e8d061700760c1e58f16136b8f54ecc4c76f8d6eafb11076'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-04-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'd72a7b704df9e030967775ba692636c640d592b5bbc6b04f3bdce01d336a8c94',
                                                                                                                                                                      'identity_hash': 'd5614f121453bc590a87a63a3a66dc41c184c599858da79eb228c13a6ede660b',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '5aa08ea74831b583b00f395cfe2452d925b59f6e86466a301d2dc5ad08a95abb',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '51f9a4fc516c4ee66ee84e8ad45eff9ffce692ff3a4c2379b0906e8a0bf91769'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304035,
                                                                                                                                                                 'cnf_sha256': '16af6b2fb44a4b056eb8b12891c5bd2b6491f31c994b885c7cf11721e2bffb81',
                                                                                                                                                                 'identity_hash': 'c6cbccdd2ec824d704cd5f1b85c00b2d0205ba27df565903147feb2af8b659ac',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '2301814913972f6ac58d8e5e0db7dad9d3183aafc25b7b06a345cb2d893f1b2a',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '08c8e622719004815219ba5c5d35c4be37e9a480053f35d0c675367907318d39'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '9da0614888b0c369b6fc33a71b93ab040c8a3bf99dfe8b42c2af7b069e4bd43a',
                                                                                                                                                                      'identity_hash': '2de095a784f3f9d76f9ad8814573ebec970293dc44ae8d96bc0ae6ea23bc86b6',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '608f508e18bb5fc1f6a25c94181c6e1ba2928468f217f5a94c33a181c1124eb4',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '57f995aa8f9c72d3eb14c2bc421c4b3ac68c291d1376887a6909dc7ed508fc35'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '1fbb362c219b769e7fa98cd48975551ff89b7aa0e16efc064563ba48b0d8f3eb',
                                                                                                                                                                      'identity_hash': 'e935ba6e98d4dc68f27c44249d916d8da66242d2aedf2dea08a1ef97c028e62a',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '73d2879051ffdd95299fc4e7381cdef8ecc83be0766c754498130aeac7d6ff2e',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'a9efd1b4e26208fcbdc73f4e6eb6eea3f4e143feaedb3870aace8b328c5e49cb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '53cbe8a8e3e582885c81cda7e164ac667fc45625cb343681c07c91de9be622b2',
                                                                                                                                                                      'identity_hash': '833fd3bae30da8506001650093e7eca637703c6f056183ef0fbe23ba02df8faa',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'e923b5513c980e8f19f3356f82a871f40f3c9f6a4d3e0c3f05827205ae77f3ee',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '39c3a13605c130aa6f7c74f3c91cc7053e13db87ed728cd768fefe7c36b761ab'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': 'bd48f1525d5fa6e97bf7af3cc514c13087373985c210132ae5dc237b1c2ad835',
                                                                                                                                                                      'identity_hash': '66eeed2645f4e849180bbe88e04f152f89210e89bc6cd5cb47e08993d1f2dbb2',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '165ccece4dfc9e9d77a51bbcc41a6ff3723e268e24d224a60cc37f1f2f8ade3a',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '29f8a21b9a8460470640ee55c073d94c127bfd024a709e3ea6063f6ba7914a0d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-05-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304034,
                                                                                                                                                                      'cnf_sha256': '64a6cc6c5a7af48fe73f7972a5203f34d4a66b4de09ba1af0c19991e9e3f8355',
                                                                                                                                                                      'identity_hash': '736680329e92ad2dc97b204eda39a9dfab2b14b8b21dcdcb7ab3ed09066c6d73',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '15686b9cab1744ee7074f132464b084d5f99d080fcca778ad599cf383b6d1526',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '1543944aa8c98fa25d4e968297e2b674cd15562197f7fefdbf2a110cf3d572ed'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '48119bcad8ee2ed7120eb6ab6f2ccbf74f630b0f6cb82d7652deabada95ae7ef',
                                                                                                                                                                 'identity_hash': 'cf056cfee17e4ac910b140ae8b115cba1d177e029360abf2ac4508ee1f1e4169',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'c123ad3fcc5956e2af35a55dae5721ce07939485c3b02b625fae2e7eb7f570b4',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '37fe5bd3a570def88b5a84b465bbdb1ce0eee6ab1ee08dd99f95ed4c4690637e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '99673ca0a3f36df73b20dec70288b535f4122155a0a5586e15e791e019b1fe5b',
                                                                                                                                                                      'identity_hash': '1974a682cb6f2e58f05acb0fcc1dc36de288a083f42c2f2f9136e946ad77d985',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '898e54b2d5799c15101af06f02cdb51598d7250827ef212e14141d9b731014e4',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '1c2059aff879b66d73c9737cbc26c153c29e3393ea4e5945bcf8a26d9ceffc79'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'e2c600770eeb764f027faa4fae8c9a6911ea3eed3b4ccc5f11cdaf7c5ef9a9c2',
                                                                                                                                                                      'identity_hash': 'b954a971234c55ea131648f971c7d833766efb65d4de9532cf546c19cc6d7ead',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'a0b84d768b4a400b6035d6b1ae30dcd89d5de4b81c959ac830378926ffa97605',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '46beef50e868c1bb85de97292ef0658a23fce8c352e416ae0faea06105307177'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '3053fec98286e63ddff8e6c5e96a69acf431cae3bc79652d3e9fa11e626934f6',
                                                                                                                                                                      'identity_hash': '9a9602ba19fcdb72599801996868598e7196474cccadeebd668153dada93eae4',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'c1ecf74061a292f4925d34b3873a86d35633f834ad3ac28e0a97d365343e0876',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '682b58e64a4379d1f24c4b37ec386aa69b8eac0e66924757e20c1ff30c4f322e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-06-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'eacf48f735fcb91e9bcaa868a55e001ec96008ac77b2a6857dee21ed92f744fb',
                                                                                                                                                                      'identity_hash': 'cf9028487a9107fe386172c205c72b1231b1e7f49fafd956b8aece9689e419aa',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '4dd1be1a70361986f2472da22764de559e00d5452a995607349df3b2932c367a',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '1d2be0afc31e1148fc4b519ccdf9feb91ab82c3b21c62b27dc7a10cebb8a88a1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '981bb78b3e231a52e3e2d98f57cb9412b4d97446087973561da7d953650197a0',
                                                                                                                                                                 'identity_hash': 'f9c6bb6ac65ce098c4b65a7bda99d12e11a7aed484bc131767cd0708e551f302',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'c03f1232787b7ae8f6371b6fec9b0251e45e301e01e36995338e00dc60954f81',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '27337f8d5b4a9e7421b6382ddbf16950c4134885505d823a6ac15e923ab93341'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'd9222ae42c381a114cf8f5d5d4778a3a794cdf4bb264c148f74daf99a963ec1a',
                                                                                                                                                                      'identity_hash': '8c3d27ffc0a76ebc89a43dbdcefc0d32e69b21340d05ad40f61fdbae255639f2',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'ec159aa56bdc7919abe1f8ee92ba41ae433f33cf51e2bd531411531a182db858',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'e9031b851b9fcf5d4a005f18357d13167822db021c10f1c9be861fa8338f1cd7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '85d9c53a58f0ed1e8f31a40aa92c97fa5b7f5877e3898a450800fc0c1780daf9',
                                                                                                                                                                      'identity_hash': 'c5f07eadfa45bd8b9689e102f9c3b741f417e8447e97bbd403d86637c7cde0b8',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '6c4a19447eeb870c860802c2570cc2e7586ad98df8d4c977821865139fcfc360',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '737d09b9b5cf4e1665a79c88bf7a9e05005032d2a31322f6fa60fb25f2eead08'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '87494c5bb99591887cfa7db2ed90741259325f0f3b578580fa2b906bece8c9ad',
                                                                                                                                                                      'identity_hash': '73000a6818c04aec155d214fac735a9c7fe797383dff9521f81387606fafb469',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '69583b81d626b61d25ee5f10ec7368fc2e9016f0daddb55a8e90f4353268c938',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'a3bb9677ae40a7c92766208af0d46793c5ae1b7bb1553337834aa9e3a94a1700'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-07-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'd017b2400e2e9a2ee2825dd2b76998e7e1da82ac6bc33a0e3881a59fff2474a8',
                                                                                                                                                                      'identity_hash': '2ce7e0d86ada8e6adefde3a871e3ccfe79da30a9a48abf55edaa476e8c622bcd',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '2e602f7d92ac135bcac6361a00e80dfa4e7f812052d9272cef4fceb3dfed1689',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '8322234a3ebb0a0941cbceb46b05b529f9213417fa6aa3e0327c5db60594d22a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '8ad31e82abfaa4ef4273d4b74a76d49ea4d1b59d4a94be3499df80b2fa20675f',
                                                                                                                                                                 'identity_hash': '25ce05ce6c84fd353794c9a4cb754b423abd2f4c1ad207c7d03a38a315766105',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'a0b61fe28474c584b8e10f55eaca290e23d775e7161bd07e9183df583e19542d',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': 'e30e71c8128ef5851428ff2086b1f657aed9c24a2c0fe8dec24b955986c010c8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '06b402b125ee94ddeec82e0b9d464da40dfdaf5cea6177485d894e3bc3990b3e',
                                                                                                                                                                      'identity_hash': '7cb5fca4a0c5f9f392df038204b50a7dc7639c8498e21dd723e1e5a1415921ee',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'acd813428d55ca6561b29262f47ab44049625e84a6ecca29feeccf20b1b85417',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '0188a61c1cb7c00ca7fc1a6d00f6a76f239635936fa2bba085592b79a1fa847f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '6bed7b4ed9250998982d7b3e35cadef4307b7cb484e872e333f8f002142e1ede',
                                                                                                                                                                      'identity_hash': 'c0d66b161e85170a75fe938ac84482b3ef0954753e06f085ffd221d82d53cc51',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'fe268c058f61a66e64eae7e761389265d27a602baaeb305714b068347c7332b9',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'ac3e80b301938e4e365a0e9c4e58f21214e8bcea60ca74ab0b9174f20450a65f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'f06a9824ba6c1fa59ce3a647359a2a6288477c5b1509083499dc1daff0b264ba',
                                                                                                                                                                      'identity_hash': '4b0f23e80636772812817512438b4dff2675dd608162248bbca7246046fe0493',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '5c770ad7ee251980a41d6073f5ae59098009cd3a0d0b32b2121da4e03c526716',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '691fdafd1e8c5c7a37a7c3ef7a7b32c88668d70fb6a58672fe97e1f09d8ecab8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '1ef2d56c7ae80f687d3114014295313ac875bde1dbd027e59ba4dd3abcdc4c1f',
                                                                                                                                                                      'identity_hash': '6e21b085fa39ca232b915ae2c3a2298c82d621a53da801395c71f430fff4b0d1',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '7b7b0108a3aad8f1929a373a07ef9ea9a52ce56eabff33335b23c201427dc0d5',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '665d56108a0e891087c6f9f8e61079fb9cbd9336bdb909b28b0914a1f2af3e7d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-12-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '6b03e5f3cccb2fb3a6564475a2af2473c7078923a63d717ed3c1219ac1a644fe',
                                                                                                                                                                      'identity_hash': '1cf2ce21427c814a36651588dc6c4a2763c7896170583c6dabab0d7bc632aded',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '48afc979403f2cf22d3356050c9bc934bfab35c367493e71fabdd104d930dacf',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'b671d1b88dd66a994a2e0c7c5ac2456f93e650296136d48d2341a6cbf7424420'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': 'cfa739f997862d424201aacfac8ed554796ebdcff3e67cdb29dae2e5c96deeec',
                                                                                                                                                                 'identity_hash': '2a464b464cd7551ce0e89504f1ef2b0a33ae11c288bce08ce31ee3e375758c03',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': 'bf1a1ee0bb0263e465ae41d66140a02e20bf25bb9bb7d7c9afe365ff1dd952d4',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '0f4d786351d00350159d520be4c2b05e12db32368bcc99f65a1be3c659ae35f9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '64f61783db3f7ded90ee335738e398bf1316060cd98fd2f8984b6cfea2fb9e2b',
                                                                                                                                                                      'identity_hash': '48875e219aa3b2ee4f9860f125c3867f5060c1744b666821964df0ae5cc58113',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '43cbea91cab7c0ec26311b3c1c165c3e899c18f234f32cb391ac580acf5f1e1d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'a9e1b03ce6629b540c8b6c93b6d353520ad0dc48acbaef3cb47354e738867825'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'ac1ad352581c165399866c2811363bff82e44143c2a4fab6befdd60b7df030a2',
                                                                                                                                                                      'identity_hash': 'db5a887b3a18f806c1f635656607e55f28a755cbbad83d2b7a38fe0ae187e557',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '1d9d7b29b46942f15e483b8182eace200d03a13868ec2bcc95dd36f286e80119',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '19f86ce94f5ccf34e460180c0ec9089333fbff1ecd313dd4f95ec40b7fc2875d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'f70ef92952288782da10563be5b10e312d680991516bca5986323565ed869108',
                                                                                                                                                                      'identity_hash': '0289287c7b66bb96a1f06ca41d2c111027c526231815bb373ec8ac2afa52d2b7',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '1d5d0d3ccd3d57abfd0c9e5a540965a2b882e0e23d7b9e48b980e58760ad9345',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'ca7414371b5189d6c4d54862dc4212455ce57411b4bd52e06ae897c493c86ab1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'd93766a6e30179d71c6a93cd39fd930f77ffa868623ad0aa1d68314cea231ba5',
                                                                                                                                                                      'identity_hash': 'fe88abaea11e2ee66ff93fc5c00a2b5a618d9853da6c2305d6bea612ee5de055',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '47760f4e170ffc6b0402245b0aa192cdb307e123e75134ab9c018f3c2bff36bb',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '72a4ecb43681240a4ab901544d09108299c898e2b9848e0e3cdde4576b689777'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-13-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '3d6d2b654eb4879d9dbd00295c35f8543493e202bc7f75663efb9a320cb91b50',
                                                                                                                                                                      'identity_hash': 'd7b869a16dc8885ac436a3990f25a537660eee46c10ca2144b18a079bf7d8541',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '18b407f3360250ca8b9dae76c2b8681ec74869eb676388508ab39a07fa75718d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'cc07f2fb0af6795c9631e773f0567ab668e716274224406ee6c60b53e349c20b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '69af13c8650a463b656beba2a64497118461e3cc7ca0befaff5df039350e0870',
                                                                                                                                                                 'identity_hash': '22dc5864582225b8b230d70188a39b83477bc4d9ea90478054c86d946ed9c065',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '3ceef54ad614d1de94ee281b336951098e5fd668329659e21412389c6b7cdadf',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '9c45579464921ba3df4c0cb2d6c27e798fecd4d83ea792cc932bc4fc56d83cf6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '52fbf8fb84d1325f1d7e43abe0eb8ac89eddab2e4a9990806310044e1d313a73',
                                                                                                                                                                      'identity_hash': 'bf28c571d2280be5e8497eae8268c58f65e4f00867ebd2f45e1c2cf8bb1d7983',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '48c921f9cc9ce4389c6f7a707f49409f1e9d4421755ad169e9bcb57d225fc365',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '86484a63536fd1b2fc9a52f29ea4a913d29157ba84f1280af4cda9000f728368'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '2552f36276a08c98dea453670ac2825acceae7dbbf22c09192b4a1995d03d4ce',
                                                                                                                                                                      'identity_hash': 'c5cfd66f04b9c93fe7c206ea5c5465350147c75a75b4826d0442221956e71abb',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '09cb1e04607c0a9623a90dc8314fbf6aaa83117e29f0ea36c2aac96b65f60795',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'b5add64ff62afbe05bfe5624d1808e5e5badd4a5125f3551ea7e2fec6e63fddd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '123b668e67bca2b2fe70fb538b53807a9ec619cc3a77e8a56b9946c3a219cf04',
                                                                                                                                                                      'identity_hash': '54e276c51b167ed799bf4b2a9ac71f44cb57909f2678d5b9f19386ff5558688c',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '2fbbded92a5f9c21047691bc52ae8399fa219172bf5fb5269c17f2cdd77d06df',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '50cda9f799a44f915aa567e18bed96f1fd1033bc17c7f322d7e91a90cb233f09'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '94a26fec9ff5da2d8b1362b350236f5311a5243a5e654ef065240be3526cc421',
                                                                                                                                                                      'identity_hash': '9f7fe4d3ca435b4e95d368105faa109e8ffa347e739fb73eb1f0c328abdee546',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'd12bc89f5c30b0d36b22966e345564b0668b0a57f19b350ff0b12e4db9c67809',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '53e733196a28eb2f0ab5f9347bac5db944c0c1a8e828413693f4eed07a78088d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-14-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '7b3f6b70ea48c87058d5dd889c3d599334a4f4e2d394125360635ee61fce2f6d',
                                                                                                                                                                      'identity_hash': 'a64bd22c8e51d8a75b16a5f02d997c27217232784d1c9f3d4ed9405214ece41e',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '38a8a35b6c74499cca8f71f6f761bcb60768f4647c72f4f6cb0c8f324f034175',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '7e2760310a06a8c603c157ec606d0ec92844c19772029bce8b7d8d3048bc08b5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '376c91f2151f82699ac3999453a4f0fdbf648fa716d1977b1b8e8e3ad3a73eea',
                                                                                                                                                                 'identity_hash': '81875cd9ea505300a8e585cefa78496d15f311e0f11100e3ce13c93dade94f53',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '2ca9d2ea720ca88c828b6f57e1ae1c900678b2504f7f7a8de1a0e34473cb025a',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': 'c85e203ffcc0cacb994f1e99c2e4dfaa57b1eaf305f4ef1f895a98ee02598f50'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '05033b6bb72302a46afc92af213b4b03934da25de631e3efb8a0f729abb84a68',
                                                                                                                                                                      'identity_hash': 'd274306e50633de7c5e073c355a16b9e9cb9786adbb795a6dc60505c24031eda',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '16708758a340e66d3b0b625fa1c24461bc152ca8d606a0bcc3e4865848163c27',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '65af567490c6451040925a846e0e848ffcfbfdaf35779526495f4ae11f2a9253'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '4cd5c5be8c220366434b9b281153c797cf31c1fd39d48279364de3b2b3da51d1',
                                                                                                                                                                      'identity_hash': '4c45c2bdadc6e607756182143e0a0681d69d83d9c1fa17bcbb12723a31ad5c4d',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '7f2fe0d48675352650cc26bd78591f18c476e34b88912cbb59c329f7756cba72',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'bb258a7d5a6f7f5a76fba146693daa5a2f2eb1855affb53b8c3d9324a7ac482b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'ff7b6f71a36bf0a4c7a06916cef2e0e40751fcd46ab664009570ae7ef3a0e386',
                                                                                                                                                                      'identity_hash': '2407da995c7e2b1374c845097ebc802496d7d5c8a6edf67c60f68c71527045a4',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'c83035540aecb37f4d267d1413b2e0ea7db4f3d223800fb407a7e8f66f3ac8fa',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '62ddb08f63b8f96cd5b63d77488ec3c635b6677dd05b09a9593a11d84c055ac7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '3d2be83a73dc8158c8afb71a6dab42b27f6b499f62a0a5a54cc407b0e6cf01af',
                                                                                                                                                                      'identity_hash': '14e1573c0d420280b86b0afda41078614dff50c36cb36ad9b58c657dd899555b',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'c2d0f578c2cc84a20ec273a6dea23756293f55b75ed93ff73607bc979e7c1a4c',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '1af385ce52eeead9c2b924119c4a09e46148e3ebdcfcb73113a8bc9235ef924a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-15-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'ab77421973c5634e898ba784360b853ceea2a326354cb8c2ae8f90fc5458b39d',
                                                                                                                                                                      'identity_hash': '41c236723e101092942ff0f5c5a9bde3de5969d9f978fe2f079e519a1e96a6b4',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'bcc10c2bddc8076b7be7241c0a20a61d748c5ab6fbe1b3dfbeb5167240034268',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '57b0e54a9173408cc65785cf612324f44dd94d7e28a9a295c41017dbf2c116c0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-none-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304040,
                                                                                                                                                                 'cnf_sha256': '472b47f5e949e9f64d87f20531064613d33348d5eefeab354117167df154a052',
                                                                                                                                                                 'identity_hash': '003abf538337376ac26e09f5dcac87ed957cff2160d161a717cc9ebc4bcd4813',
                                                                                                                                                                 'producer_bytes': 10087,
                                                                                                                                                                 'producer_sha256': '741b3b52463fae5955aa051aa1d2fb2ef60f7918d302d52305f0430380ae3503',
                                                                                                                                                                 'wave_bytes': 1716,
                                                                                                                                                                 'wave_sha256': '852e21ae9a179bb549ad017a75c8b2bdaf8fcd581a51e4bce758e0647f8ee677'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-06-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'b23ca4527aaa1674dc9dc14541d132be730fee96bc56f31df3b72ed836c447fb',
                                                                                                                                                                      'identity_hash': 'd76b68a1f21f8504c12d2041375b074e4154b44243f004629187e6714d8b7b07',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'c0bea4243f03be41d01490573026378f2a43f1d5d68e4a16e8aa9724c6de8ff4',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'dd38f81daa0fe496f64ab0ad3160710b0492e17f453dc1c8a9bfde0acfc57a08'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-07-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'b228b83bb4038d25cf352183a2ce5d772d1457cb54fa4128cfa0e4b89d0746c7',
                                                                                                                                                                      'identity_hash': '3fce7f1a1110941861d7bbe2aca56685080af06008985bd9402181f236077389',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': 'e514ea26bef916409644b19278a2c0c6e62e582f34aae6345c8ce2a147b27032',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '47d1d4da3ac3330448fc92ba978f6acbe44383adacacbc55fa63b440362fe819'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-08-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'fc898e7641dc4f6cb2c78e60a4cafb5379d13e751b95e41cccc673779ce6c677',
                                                                                                                                                                      'identity_hash': '0d85a5f534d94ee17afa5d8fd2e272d1ac15f1b12b046cf1fb9d5381fdce78a8',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '4d5c603433eb2de2758b241de3a11b19397281100d0e77ee37e1725afb1b3dd8',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': 'a031768a4f072866ca409113edaaad7e7c7e0417a5bfc12d34c8f46e43ed6da0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-09-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': '5ab518da852ce63f0a7b5be0ae4a3f94751a4b912798284ebcb16c09eec74f74',
                                                                                                                                                                      'identity_hash': 'a3d44f1a1d23479d451bab4d15d2c6753e7e5012e22538589a93a15054eb1bf0',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '7541924d9f26e623ba11beae0926b059bebb61be8841f029738276e47d4766c3',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '0259632e6b1bd721fd6b7bc916229e94fb871e7411f00146768a130a33bf54aa'},
 'canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-16-physical-unique-10-canary-two-kalmanson-v6-sat-profile-v1': {'cnf_bytes': 346304039,
                                                                                                                                                                      'cnf_sha256': 'c1dd0ecec591cb9727904ffc6b760313dfee3d93659ce31867a3eaac155b6021',
                                                                                                                                                                      'identity_hash': '974c405ab1064886f307b3308652aefced55f2306ff0c63f8266f68fdda04f46',
                                                                                                                                                                      'producer_bytes': 10102,
                                                                                                                                                                      'producer_sha256': '469c5f64ee1da747cd3e010ef1ebe6defa5b5b3bcaaa9a754b872ebdd178ae6d',
                                                                                                                                                                      'wave_bytes': 1726,
                                                                                                                                                                      'wave_sha256': '6ebb3b94bcc69427e0fd8006e2854fda36bb000828c50b872283575275f36c25'}}
PRODUCTION_CELL_IDENTITIES_SHA256 = "6d8a0622d8a6364ad7085c8d13752ea6b89130ed8c0dfbb519ec7da8f9fcc724"
NUM_VARIABLES = 308
ROOT_NUM_CLAUSES = 7_409_780
NUM_CLAUSES = 7_409_786
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
    "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-sat"
)

SOURCE_CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-physical-slice-campaign/v1"
CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-sat-profile-campaign/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-sat-profile-launch/v1"
RESULT_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-canary-acceptance/v1"
SAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-independent-sat-replay/v1"
WAVE_MINE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-wave-only-mine/v1"
WAVE_MINE_LEDGER_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-wave-only-candidate-ledger/v1"
WAVE_MINE_CANDIDATE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-wave-only-candidate/v1"
MINE_VERIFICATION_SCHEMA = "p97-exact17-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-source-valid-theorem-mine-verification/v1"
IDENTITY_DERIVATION_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-sat-profile-identity-derivation/v1"
UNSAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-v6-independent-unsat-replay/v1"
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV5CanaryTwoKalmansonRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-"
    "preparation-config/v1"
)
CANARY_SOURCE_CELL_ID = "canary-perp-bisector-survivor-four-point-two-circle-v5-canary-two-kalmanson-refinements-next-center-02-physical-none"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-canary-two-kalmanson-v6-sat-profile-v1"
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
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-canary-two-kalmanson-v6")

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
    portfolio_id = f"{source_id}-canary-two-kalmanson-v6-sat-profile-v1"
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
        cell["portfolio_cell_id"] == f"{cell['source_cell_id']}-canary-two-kalmanson-v6-sat-profile-v1",
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
            "Run the gated 76-cell survivor FourPoint-two-circle-v5-canary-two-Kalmanson-refinement SAT portfolio"
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
            f"survivor FourPoint-two-circle-v5-canary-two-Kalmanson-refinement SAT portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
