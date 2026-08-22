# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor two-Kalmanson-refinement physical cells.

The production byte identities remain provisional until an authenticated source
campaign is frozen.  The runner admits exactly the 308-variable,
7,409,378-clause cells derived from the 7,409,372-clause root.  It launches
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

LANE_ID = "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v3-20260822"
RUN_ID = "sat-profile-portfolio-v3"
RUN_OWNER = (
    "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v3"
)
BASE_HEAD = "8e11442a8275a9e8869bcc56576ea1e8d566673e"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-two-kalmanson-sat-runner-code-v3-20260822.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-portfolio-v3-20260822.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_two_kalmanson_"
    "refinements_physical_slice_cells.py"
)
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = (
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-two-kalmanson-refinements-"
    "preparation-config.json"
)
RUNNER_RELATIVE = "scripts/run_piqd_exact17_canary_perp_bisector_survivor_two_kalmanson_refinements_sat_portfolio.py"
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_two_"
    "kalmanson_refinements_sat_portfolio.py"
)
MINER_RELATIVE = "scripts/mine_exact17_canary_perp_bisector_survivor_two_kalmanson_refinements_sat_canary.py"
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-canary-perp-bisector-survivor-two-kalmanson-"
    "preparer-20260822/preparation-v1"
)
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# Immutable production pins from the independently authenticated 76-cell source
# campaign and its SAT-profile transformation.
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = (
    "98540d34c34d1b3ac432969de2411d53040773739174ea2989bd7eb5eb4dbc93"
)
SOURCE_CAMPAIGN_BYTES = 123245
SOURCE_RUN_MANIFEST_SHA256 = (
    "272bd3d353203d2bdb7deca174c634246f5222e5abc6f3bfdb2074fdaf94608f"
)
SOURCE_RUN_MANIFEST_BYTES = 2457
SOURCE_PREPARER_COMMIT = "bb1373ec21b8dab2942b174c2cd681fee2b8e2f1"
SOURCE_PREPARER_SHA256 = (
    "3ca3af0ebeb91d3bf7721bc052e27bf7b602f1c3c590f88f370e5cf670bd3a91"
)
SOURCE_PREPARER_BYTES = 126475
CHECKPOINT_SHA256 = "b6e2c0ba64e9b4e93318f97b4a4b48d708d3f7808a9fcac08e2770fa542e9d2c"
CHECKPOINT_BYTES = 1320
RUNNER_CODE_CHECKPOINT_SHA256 = (
    "d169ae144598b1e18aea488b826810cc684168e4ebb024fac164338cc2f1dee4"
)
RUNNER_CODE_CHECKPOINT_BYTES = 822
MINER_SHA256 = "ce55e6e98be87689423236fa1aeb5fb01a4e232a6867cf43b8ecd4428195877c"
MINER_BYTES = 53608
MINER_NAME = "exact17-survivor-two-kalmanson-refinements-source-valid-theorem-miner"
MINER_SCHEMA = (
    "p97-exact17-survivor-two-kalmanson-refinements-source-valid-theorem-miner/v2"
)
MINER_VERSION = "2"
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-none": {
        "cnf_bytes": 346279751,
        "cnf_sha256": "0f1672e2900f327ca215dc08a42551947b753e5df2dcc19e35e7b872b73e4aac",
        "producer_bytes": 17488,
        "producer_sha256": "5f0e47770f5fd7b020767245c69923171ccfaa388d2f7ad2e9e6991a3453a41b",
        "wave_bytes": 1545,
        "wave_sha256": "aa8df36c3e1d4e578d29c58377763bebe26027f0f127d03904e2541667ea0ea1",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-06": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "9387bef5ec122ff1c426c5d7ba580fa9d1ea4a23d1f6e3f3bc41c061a3688644",
        "producer_bytes": 17503,
        "producer_sha256": "5b9251b7f65ea3b6bd19d60d9501fe0ef2baa2e71604ed7baa9210f3a70b2b20",
        "wave_bytes": 1555,
        "wave_sha256": "259f1778f5aac76646065afcf5a9904d0edbbfa41813a7475fe09cc6d8720154",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-07": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "f542f26fdd3293a49f33dedbe3c4e3c1e5cc1af88856bcbc2ad82339dece06d5",
        "producer_bytes": 17503,
        "producer_sha256": "4ad640dd1d2a0e75641abd023e95b88cdd8cc9c24554c558f0dbfefc4ff4d928",
        "wave_bytes": 1555,
        "wave_sha256": "bf2a5b83c389bbb1eb577e76ddea50a562059189c4a5adcdfd8754767a396e2b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-08": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "3acc20cf2b24d033aec54ca407d9304d0e9cd33f4962154a83d4534883b73b50",
        "producer_bytes": 17503,
        "producer_sha256": "61f9d378d4fb75df58a9dcc205553c61a36d9208ec90c4fd57f14ef33fc96197",
        "wave_bytes": 1555,
        "wave_sha256": "d91a6dda2ea1f43009d07ff5ff84ce433d469549fe1432436d2384d964c1c6dd",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-09": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "711c9756c93f239a09934baed7bf2bbb8c30ea2d4e9af3edd4728c87e584c093",
        "producer_bytes": 17503,
        "producer_sha256": "ba1119a50061eb408241dd36ab47ea553595dd3b10f3d208860ca930c725175a",
        "wave_bytes": 1555,
        "wave_sha256": "d500b32dd58047db7ecd028924726fccaa3b00cf632387442e1898c183952cd3",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-10": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "48fa653043ec7d07071a7cee8f9029b7dd5af0ce0af3212bec1e06220e11741a",
        "producer_bytes": 17503,
        "producer_sha256": "d14c2cea91a3697bafd33748e5316694bd7d5f124a0f06f67da75560f0a1122d",
        "wave_bytes": 1555,
        "wave_sha256": "590ee7837369e02f6099686f8dde728a7599d4fa5dcd587b2eaf9aeef9855171",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-none": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "e4eab2dd2f53af8cc29b0b64a8dca8508bb968980bebe7e0517842960c45677a",
        "producer_bytes": 17488,
        "producer_sha256": "8f634a1940126ba5d1b0d61db6c0cb16e3e71cf14f1365c4c3656656a71fc5cb",
        "wave_bytes": 1545,
        "wave_sha256": "ff1e4d9eb9b83b9ac03fb6fad990efb38a81d0bdba8b216e31509792872ae62b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-06": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "9cd8ce880c9029aaea56e4d3f5e23b807391b0985f871fd3d06d8e3d3d283547",
        "producer_bytes": 17503,
        "producer_sha256": "772b9c09a88e3e21390ccc0a282014af06ab051fa9f9212201b1a3b121f117c9",
        "wave_bytes": 1555,
        "wave_sha256": "05ccf3d08b208b7f1114574730657fd1537ea95612e291f780428987480ec203",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-07": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "1b22cff57087c94d5cbdefe8c9e5afcd0c6ba65811cfb0be7897af150ad135d4",
        "producer_bytes": 17503,
        "producer_sha256": "23a8591d1dfbd574d8fa066acfe7effc82ab4f75d3176dbe79bfdbfb78107a8a",
        "wave_bytes": 1555,
        "wave_sha256": "372b7e6d9ff4d0d1a4bca80e346fa2db19985ed64bd7fec6b7cf71db1c4bd01d",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-08": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "0be487cfcf32c55cd725d5e962937484ebd51068111c66f8899cedf34e0ab81c",
        "producer_bytes": 17503,
        "producer_sha256": "c5ad392f66f8ea3e6afba52e015e14634038e841bf90cf7e6bca28e2a873230b",
        "wave_bytes": 1555,
        "wave_sha256": "967bcf8bf6216185c130a57ece18b7b6e4ebe37f93caeacd51a412416b7c82f8",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-09": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "38b11f152db9ffe9cab966b49c8ba0a3ce489fecf699de8a82548226da8cf2da",
        "producer_bytes": 17503,
        "producer_sha256": "4615fcb258b156dc41b23dd139c545cabdff84ea40a48d6011953cd90020a588",
        "wave_bytes": 1556,
        "wave_sha256": "01a947e589c6ed6a6d7a99cebd897a4fed2784ffac2a0a3440fcecfa0f213cc4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-10": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "63ab4f8f416085f6b227de3134f7abecb649f62f6d4c58a133559569afa51bb7",
        "producer_bytes": 17503,
        "producer_sha256": "dee1a3272bbe5eb144a4ebf1699d65d3d161c9cd8feb610b5075df39dc2139c7",
        "wave_bytes": 1556,
        "wave_sha256": "eba5e8500701394628db165b9eecd0021a752f44db90115be909ab2f2aea1052",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-none": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "4d4f2c031b65121d66abf2f659a5d614fd20d243266ea3ceb44051e0f37e6527",
        "producer_bytes": 17488,
        "producer_sha256": "4ea173c747c43445da067516256e0c4362cb5e655ab3e37ddbc135fbe46d29fb",
        "wave_bytes": 1546,
        "wave_sha256": "09f729435e1e9b9549f420a5ad1bd15fab4356e3b93b5ca66ad07e16a7d3f5aa",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-06": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "0dee9f15d95ead6660a7f160289a28ee061d7f685a9a4a7f563798864f4f94b6",
        "producer_bytes": 17503,
        "producer_sha256": "489c6cb852237bc43b76cd6e71010fe05a00b55f36c3a7daca021dea21401c05",
        "wave_bytes": 1556,
        "wave_sha256": "8685fe482816a480db9a7d1d5bcf86e7c797ba84d1b429758acc43ee980bada8",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-07": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "bdfd6ada4b917f8c915f0b09af25fd4cc89ff20e3af1776573bb096db9118961",
        "producer_bytes": 17503,
        "producer_sha256": "fd59d3a03144ea3988d292b49fc46aa8aed9b351f757b52c6b7f11c66a95719f",
        "wave_bytes": 1556,
        "wave_sha256": "c17d9d8728243712bf5160c41a1918842c4ec8f7eac125b2113a9d702edf70cc",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-08": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "63bf40a66e25985b5880f6c058a8def76a5d8b7b88c7e87061c5d5e0e79eeadc",
        "producer_bytes": 17503,
        "producer_sha256": "9106322e82c59d8dec40edf8e318990b6cd5ae388e91634fe202082dbf7be8fb",
        "wave_bytes": 1556,
        "wave_sha256": "43957ce70b8efdef67526fcf370a4cbf05322c2f70c20fe9f4deefc04867b4a2",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-09": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "39fdf30be481a17a00e768e17222faf010469a830422de0a19d424dc67b54f4e",
        "producer_bytes": 17503,
        "producer_sha256": "a6e5466c9205db9de55536f12b6624e8b72de47b41c4abcb4fa42d2f0b38b2f6",
        "wave_bytes": 1556,
        "wave_sha256": "efb6f983f86367f9e46d65270b10d8018074df0736ee9d9c720b74951588d4ca",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-10": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "50fa02ed097b4e9c35c3a1a6492754bc38f640dc688993893c7c2a51dfe60489",
        "producer_bytes": 17503,
        "producer_sha256": "68fa045a9c6bcc4481db3486f1de55e06401142271b6ee2222e16b1890548821",
        "wave_bytes": 1556,
        "wave_sha256": "41c4640c8df7cbef41fb02d4ff722daf03733993024f7566b74824f206a29722",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-none": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "f1a95563cfcd2b35094bbe04c163b87de931dbae1afcd6862158b9896cb3e20e",
        "producer_bytes": 17488,
        "producer_sha256": "965f4a163786dfc0e2c792ada8f5bd3b3b6fd438e0772d4d7ad3e2bdd5d39ca1",
        "wave_bytes": 1546,
        "wave_sha256": "bdf73afc6787a49bb2e9b53a44639d77fb0e3a87cf15a94ace7ded3551444f6e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-06": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "aaaabe2176d060e18f15d04a3da527c47db95e153f47d936502cb140e07ce986",
        "producer_bytes": 17503,
        "producer_sha256": "f0a6f7ae37057b67d12d85bc86424f4385651caa988be88303965bdcb3b265fc",
        "wave_bytes": 1556,
        "wave_sha256": "3aa4e4130e0944d4454aa6f509f51f035acdda036b50db376d933c78073ce567",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-07": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "57b3dbbb7f4d86ba54d3565fcd2207b33b01b8fb806eaa05afa12a53051addd8",
        "producer_bytes": 17503,
        "producer_sha256": "8c782624000798119bb671a7b557c895c7e009429aac13b5dd063cf30762768a",
        "wave_bytes": 1556,
        "wave_sha256": "27322922d7f8a7b91a42eadc6dd0a389c501ea17c872061d6e90dab1db452aca",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-08": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "f41280acf8814636bbaf6358032f6b0e6a546aa61a1db9293f2642432c4bd610",
        "producer_bytes": 17503,
        "producer_sha256": "444b61349b6f4103ef71b494f5925d477cea06003957d8f01ffab67daa42e5ae",
        "wave_bytes": 1556,
        "wave_sha256": "3929b5ae6661952aa69b6f83a8b900065ce22c97ae1fc704b34d3c89415354c1",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-09": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "72504a91a40a006d4b8e9f0730b77608674683e30bc355fe799bb4e68b81ef99",
        "producer_bytes": 17503,
        "producer_sha256": "7f9d498d5350b42e6422b4c3f9b2e08273febd6df926a2eb40ef2803a1a8466c",
        "wave_bytes": 1556,
        "wave_sha256": "3daa206b8b95be723980d640c243c16f7b88657507af852d7a4785d64ee650ff",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-10": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "d62d071a51366aa6a456c2ecb938f44cef06d29770ab9b6a14d89b6392588762",
        "producer_bytes": 17503,
        "producer_sha256": "11f1b900ce544e7088a18b3f332bc9c29f4a2636cef2479eb9114d50ab252166",
        "wave_bytes": 1556,
        "wave_sha256": "e16ce8de952505a7df4af0cccb072464b0c01bafc6743abecd06f177432ece8e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-none": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "b20a3d8f12f8ad3b9e67b38a27f0879890e6b79dfdb5fbbfa6582127e2d13fac",
        "producer_bytes": 17488,
        "producer_sha256": "0d7f91fdb044b8b16a477c11ed2aa9aee001d241f5a7deabc1ffca2aa4fbb01a",
        "wave_bytes": 1546,
        "wave_sha256": "b32ea384b42f2740c929db6ffe9cba183345461ebbf37c83f25f9931396d7093",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-06": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "9ebc9f0e2f33ef12f55bd04973fc1d2b37228c51bdfefc2b89c29e80d57bd31c",
        "producer_bytes": 17503,
        "producer_sha256": "470bec477b712a5eb2823c04ededdc96a0b68ea5962771cee4cae3f21a6fe775",
        "wave_bytes": 1556,
        "wave_sha256": "8c5af2457c76035f022749a4b680fc8f91c8d73326b782499f3fcfd1fed7f624",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-07": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "2103cd7c5c4b620a62204c2d01050606bd75ebaa265b7156dc7a20853ae052dd",
        "producer_bytes": 17503,
        "producer_sha256": "61875c2f1afd6fdd591e8b7b8ccbebdfcdb2d14f2f296948f62f59097c416571",
        "wave_bytes": 1556,
        "wave_sha256": "43008b432f32d3341bfce17d9cc1dbafb1da374c17bf5ee3e84020b5ad3191a5",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-08": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "aa068ef760d71f239e52fbdc4be4042c2999965732d92a3553401801f60b7889",
        "producer_bytes": 17503,
        "producer_sha256": "e33284f4ed5c52718cfc2a5e1ec730fd9e7202cfc0a0b336921ddcc41e959eeb",
        "wave_bytes": 1556,
        "wave_sha256": "55436d5a5650b4f07b5b7f18c3d3d8604f16fc6fc8c1e9467ac62677de133420",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-09": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "b3c340f125d9da91e111a780842233c1d482c4642e5be53d0dec9de9cdc6514f",
        "producer_bytes": 17503,
        "producer_sha256": "7887205a89f7640ae1df0c0472065e6045635d647d6cbe4c807b26c548471851",
        "wave_bytes": 1556,
        "wave_sha256": "5701432a1dfce86e3e1f37007dd27d4fdcbfeb697a4cd7ef828321e651bc9cc4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-10": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "f5068fe5a02fb29ed21172797353d66bb30298c3ba5228083577ed9dcbb6cea1",
        "producer_bytes": 17503,
        "producer_sha256": "a5a21565e14522cf1445899e7d5547178ab1c6e5b8148dd526b879e769214368",
        "wave_bytes": 1556,
        "wave_sha256": "ec7ed86b79dfe2d79143ca430e2367bc46c0c34aa83e4eb1d25b8af43aac05cb",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-none": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "1d3f7608bbe14a165aa5825d8fe65993118b47544043c5a92ee075af92667a9b",
        "producer_bytes": 17488,
        "producer_sha256": "6a00fa4ca6f58d07ca77c499bde5f8f5036a88b521d351f4a6b14ba65631b477",
        "wave_bytes": 1546,
        "wave_sha256": "041eb4ddbe30d4a3af3c6bde70d3b5975d7e59fd035a733d8a03c55f41916e9e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-06": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "fb8cdbe4a0b5455099b55cda14e44298295cc9307b11fdee3d2711959efb2d98",
        "producer_bytes": 17503,
        "producer_sha256": "21d98fdc9b9467443726a6fc7d7a1c16a0af22580d5666e772e7a3e23a609e42",
        "wave_bytes": 1556,
        "wave_sha256": "43eaf7a060f5103bd71c65fa7abafe6b22bab37fc742c954ae496481b57e1e57",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-07": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "076f755113decef28c0ae77714fa51d8b5562c48417aa7f5a99d3b2982f29c10",
        "producer_bytes": 17503,
        "producer_sha256": "640b97851944925e55f561702b7c5d9946da12fce6848afcb61288e4152c9213",
        "wave_bytes": 1556,
        "wave_sha256": "bd60697bf67d71579f20db7b957166a6be44cdfa287693bd18811aec00f8c634",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-08": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "97b68df7dcf910ce5a4a4937f053d2f1f260b8c8f18e40da995bc5805473c1fc",
        "producer_bytes": 17503,
        "producer_sha256": "96e752455d47136c36fc3003acb67119e0c6944026d48aee8e2f5956c9d0d0d2",
        "wave_bytes": 1556,
        "wave_sha256": "4dd5bb2998c60b69ba2f1897506a2d58eefb585cffaafcb64f645c278ff05fec",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-09": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "12830fc7e06dc5f34b5bef9b548a9d5914bfb518a996122f17df830fbba65ed1",
        "producer_bytes": 17503,
        "producer_sha256": "6b3c3801c3d7b73b312c189513adb41ac860c7b9ecf7e67d5ff3db39b911cc89",
        "wave_bytes": 1556,
        "wave_sha256": "4ec06bdf711a9eef1a06482e1e099600cc44ac750cdf822647e01d4ae89930b2",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-10": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "a11f3e6d6ace5409ecdd40fbb7ef3527e366b7d81f95f88ab4b3c14d903e1dbc",
        "producer_bytes": 17503,
        "producer_sha256": "4fdbd2bdca70c0ca72c4f678d753496df863adbe0f7ba2e92e93e0f1ddcdea72",
        "wave_bytes": 1556,
        "wave_sha256": "fe0f7e1c14799b9f3f4a01a860358ae0e8f840c3f50473ad5884728e53dfefbd",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "1cc620fffaf581cd06fb09d9633e0bfeb8b3afabbb4f1c2a13b7fa50ecdcd3b1",
        "producer_bytes": 17488,
        "producer_sha256": "bfa06a1c340db6988337c508d965faeef3e7eaba8fd92bd33bcabbecea49cc54",
        "wave_bytes": 1546,
        "wave_sha256": "9a523e476c11dffd10bab8828418cb729e0df0ff76ab8e6c56f5bbf75a358872",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "4b52fc662d1ecf3a7834809258da3837152abcee9d6b575f0fd96c3bd4c50251",
        "producer_bytes": 17503,
        "producer_sha256": "7b2f1d52bf16463ea3a22f62f4d3721a2201042deb0e0152e63207bb4dbaa6eb",
        "wave_bytes": 1556,
        "wave_sha256": "ffb7e37a27d9c508c1d7b7f3f68b84d83619a6033ac5fb6d2662718f91aa9469",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "06b8b5d01739c1215a0fcfa9cf378936a8e69a1409df94d9b33bae8533204e3e",
        "producer_bytes": 17503,
        "producer_sha256": "896a5a19c0c294fee8a469218b4c73af3c243d855b2769d1f8acbf4b757bc1fe",
        "wave_bytes": 1556,
        "wave_sha256": "8579cddd6914abbee9c937c81d11dfddc0ec9cd45a1fda4a8745863a13d5a393",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "1dba91551724ff8edfa2d66598690c564a3227479635e1780c4f8b61b5efbffa",
        "producer_bytes": 17503,
        "producer_sha256": "903a25698c5dd1ce8cbd4f020b554356802523d1ce412d8a328844604b3ad82b",
        "wave_bytes": 1556,
        "wave_sha256": "6c05f278e73ead9dbc36537353ddb3a9395092c0c8c1ac9ea704394e85d32405",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "49241f15807bc8c2e96575272743dec001fc2e4c877c79f22278c4f1949c8d5c",
        "producer_bytes": 17503,
        "producer_sha256": "9fa3d1edb84d9d45766517e2c555efe8de67512a417975c1e24cf474dc9df94a",
        "wave_bytes": 1556,
        "wave_sha256": "c21192e99a429f3d98d685b0dd48a30caeed12d1ada01458ba4cd46f5c75445e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "010314dac26c886b1d6b4d45556ce8e1064904fc9e0e6ffe1f1b79738ced7b4e",
        "producer_bytes": 17488,
        "producer_sha256": "562c186889d97d070ef291b1b6807a57ba8203559c76b6b41e919ab73b793766",
        "wave_bytes": 1546,
        "wave_sha256": "05bb1c33d2efc218a7d810f4096c635716c287c588cc2219ae0711179e59551e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "a8a34ca6a33486f7efbe8e2e0a941e7df3bb7d2b3815410cba19ecbc5e3bdf3e",
        "producer_bytes": 17503,
        "producer_sha256": "fbd17d7bdb18fe1daf191a69d860f2a82a99681c24721c1912d47f331260c563",
        "wave_bytes": 1556,
        "wave_sha256": "b3575a56c98312318423f0861f6c8b7b6fa8dc394938ac690246a1383bab5149",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "70f1c76b869e269f0caa1c1158aa51c00dd9843fbf0324698d354772d24bf46a",
        "producer_bytes": 17503,
        "producer_sha256": "dee357550d55416d27cc280750fa788de18f4250966df35c3035cca4d7699da9",
        "wave_bytes": 1556,
        "wave_sha256": "d316936ce7cb4abbd0296783f0f0bc7da419ea2d25d2aaa2f525059b14ebe5eb",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "65fa55b5e6214928c3eb6c4c811d9174555e5a4686c46c5911eaef0329de0b7a",
        "producer_bytes": 17503,
        "producer_sha256": "fca2c7db850e77722d554c7eef301cf239bdbc944804b0ed54429b654e238439",
        "wave_bytes": 1556,
        "wave_sha256": "76eec8bb630a5deab3a643bfdaaa03a61f1edd091a727b04896803e4a857941c",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "90a7d91d453ba08e2d8f98d2469eac977ff97592aedb24e2503131cc684760b2",
        "producer_bytes": 17503,
        "producer_sha256": "b2e44710893fb26afbd393fd5e235a70d02e277b8326cc794b21f9cc4152ac16",
        "wave_bytes": 1556,
        "wave_sha256": "d3be2b6ac834e8825bbfecee98e0f04dbdf539905be9a26b58deb442d50fc351",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "7bc92aaad387d5fcbeb4f314ec9984aa52df454fa03c0883b9f793be4cf894de",
        "producer_bytes": 17488,
        "producer_sha256": "c4a825dbdfa7a007a22e4b43a63d13556dde5f466bff439f5871a1940cb75565",
        "wave_bytes": 1546,
        "wave_sha256": "d2123527f98427cbaf82ab692637458f52c1a98e19c561953671e1a4651f5898",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "68d165f4d9cde0332a15beecf87b7d3f4dba33d1c39ad4e06f4965ec69f8d312",
        "producer_bytes": 17503,
        "producer_sha256": "e1d7bd6835108d3e2e42cf9ca567bcd10c78164151a5e68c1599f7e8fbcd6be3",
        "wave_bytes": 1556,
        "wave_sha256": "5788f5e5e6e0b125a5de0e4dcc3170e4bea1d34f9303e5bd3ed60739503925a5",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "bfa80ef2578095e737a63a7b7652eae8869197c29a917ca82dc73d66274554f6",
        "producer_bytes": 17503,
        "producer_sha256": "67358f4ce4db7b6aee63b306561480e6ffbb7445a6e046e938fdab170433e2f2",
        "wave_bytes": 1556,
        "wave_sha256": "296e6da5d81794acdb270dae2412770f755886bb3759fd523216e294ed02a4b0",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "674ce72ea2d062317f7a95c72d4fc2d664bd547045b44809c6f4a3c056390226",
        "producer_bytes": 17503,
        "producer_sha256": "e69439c5e8137a2ec08d236d73acc3d02ff52d83b87b5d6626ede472882b1a45",
        "wave_bytes": 1556,
        "wave_sha256": "03108ba856185d84d62d42a3161d42f3c6f76bccef92b6bacf75e30ea641730a",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "f1c6771f3851e69518c868c5d2b015d745ea2eda868e03e58a06a681212e752c",
        "producer_bytes": 17503,
        "producer_sha256": "7c565b63ff9bd9158c58987062e442c28b36dc528c3e6212ca9f1d0bc78df28b",
        "wave_bytes": 1556,
        "wave_sha256": "036f8592dd8f56d31385158cf1b80e81e661e1d0c0cab55b6193b32e5d51f906",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "eb129b5ac7a21bd40f3513e0b02b69643e1c1bfabe657dcb89d394de99f0e816",
        "producer_bytes": 17503,
        "producer_sha256": "ce051eaf0d5867807ae4680aa995bdb86f55da969fa198a694bff418015c2f08",
        "wave_bytes": 1556,
        "wave_sha256": "4db0ff368ab0bd36e58b86e866d2f691c892fcd2eac45cb0d9ccfc90b51fe8dc",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "8279c6d32427257c939f2cfd72fcaa9140702029f655c4c5c06e768aac13c78d",
        "producer_bytes": 17488,
        "producer_sha256": "2e3ff3aacd9f1a0b1fe579d8cc5eed5a2f81414f9eb6c554b1bcd206cf302d2a",
        "wave_bytes": 1546,
        "wave_sha256": "0042a66e1f363ecb09709a89116d0728ccad23f85850d951155a72dec9a5847b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "67ac77b6e2446b17666819c690a6810e2e31de1fce8ec767fdf61b2a5bb6e2a6",
        "producer_bytes": 17503,
        "producer_sha256": "d4239c164f49086eac805708d49803526e2875d92b3cdcb3c701bbf9cc13c376",
        "wave_bytes": 1556,
        "wave_sha256": "a71986ec3e2131b7b4df991f6ed8f90f1e384843070509b4d5f7331d75d1b771",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "da220bd1b3c5f9895f37b9b33ec0a7c4d6da6135fb9f867d55e8428302226d1b",
        "producer_bytes": 17503,
        "producer_sha256": "d3b23bf1d2104567a4a1b3b2fefb2d39a2759e52ec1ce50ffc84bd0df67e0094",
        "wave_bytes": 1556,
        "wave_sha256": "8ff65daef38052d0679bb9e803f7bef1d721d7c25d961035ada3acca325ecee4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "846352f125c3c45f4779a2a042bb694fd8fce66f6b1a8996ddb774e77a575337",
        "producer_bytes": 17503,
        "producer_sha256": "dfa13c13b8b1cf4ca39599025def3dd1c1d11d328b73ba5fa248a31c5ffaefd9",
        "wave_bytes": 1556,
        "wave_sha256": "0a5a6acd7771fd0c5b667ea2e0d8fccbcf2d4abc59c721676c3f39b9053a5e83",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "0fa812fdc1d79b46e98f031eb55f9614f35bf7ab25a374da1316ec1e924cb68f",
        "producer_bytes": 17503,
        "producer_sha256": "e1fb641ea28596bceed47c1cf576e5c24ba82b02298754caad379723faac62b0",
        "wave_bytes": 1556,
        "wave_sha256": "2c8ae297c77e91858b3bc507eab4a45843ee932aa1e5a20953545e98480116ab",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "8c9bbc003055a72b8b568a167f77501a97a51b2fc29244caa5637f0235ab72e3",
        "producer_bytes": 17503,
        "producer_sha256": "e9298dccce50dcb7eea959aa20e633f6aca97790f0565b87b0f6ecaec0d53685",
        "wave_bytes": 1556,
        "wave_sha256": "2668cc02920db82085e3344dfa4c7e21608aeae1a0dbcafeb6dbb1263eb5c1d8",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "3a4512b6b98559354831efc1f840f34804caa00883bb572c5adc081c0e64739a",
        "producer_bytes": 17488,
        "producer_sha256": "adce878e1df7269a01fe9306a93989b1b067abad3c2280e0f6f1c622714704ac",
        "wave_bytes": 1546,
        "wave_sha256": "0b43a4ab30201b1d1796c6d147117c91d3d1dc7948a37fb666af124ce2d1e3e3",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "fde89aae6d5f5f244ef70fcf15a0375bf04b4a0ed89947aac2d37959ce0ccd8e",
        "producer_bytes": 17503,
        "producer_sha256": "03a4783ef7f7622fd819570e18cdbb36aa058c1a887de715415ebef251ec22e8",
        "wave_bytes": 1556,
        "wave_sha256": "9dd7254e4e6eb07088d4e129ece2d4126ef09ee957174ec2a47769909782c27d",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "3ac82d2e8c2b85eda74b84c6c154acbc54c4d618dbb0bfa84e89cc88b3155492",
        "producer_bytes": 17503,
        "producer_sha256": "bdfb0d757b0a8d6088cc75e46d2863c7e060951c5bb15f863f48a54d23ae4c00",
        "wave_bytes": 1556,
        "wave_sha256": "4d7b218dc9316c64199383535574482d962bb194fc97dd20799d18f55767f182",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "b8c7e6f7d9846d7e6b36b21cfa6dfe3174d2b942bd97438179e0af4a2a71ba21",
        "producer_bytes": 17503,
        "producer_sha256": "132f6554a13addec0987fd94ac9e34fa84787387e0f8ad0ec9b8784729327d6f",
        "wave_bytes": 1556,
        "wave_sha256": "019cd5d003aaaf80eaf184938a89536ae429579e40861d796cad036b1d02b51e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "28a017618a22ee4a73ab770b80f4bc818571097f2abe4f2293f0ecb85c9f82c8",
        "producer_bytes": 17503,
        "producer_sha256": "3c90cd8a0e124c59532774fa4d0846550cca83a08b229a16639d99e054080281",
        "wave_bytes": 1556,
        "wave_sha256": "9f002d9858391b8a1acc4744c40622a1cb8bdd36ca550415dcbd0ec22fa421b3",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7f8e64d1da8711e8bb1fb1f9c1cf3a0699a576c5303b92ee2306da412a67029b",
        "producer_bytes": 17503,
        "producer_sha256": "f66a13f2fdd37c2ccdcf1b5972d69ffcc6efe92cbb00787881a39ae33794e32e",
        "wave_bytes": 1556,
        "wave_sha256": "1bee377fe806941591dd3a7e2093327d24b334a465290c0c70a7e819cd449c35",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "f69da4cf83a05cfbf7f8e8ca738bbc37ca9a8f6af0449fca0fffef04f25d7d8f",
        "producer_bytes": 17488,
        "producer_sha256": "5666353f91b4b8e8b9927733b796cb26065df35e88afad3b21337f02fa7fc9a5",
        "wave_bytes": 1546,
        "wave_sha256": "ec49fea4ed20028416d0cb3d6f4b3132c1a83fe594b9b60bce50e97061eb3904",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "4ae527d95da53b9618839258651fd349c7f4c7e21e6c7bfdd0d68442fe90c9da",
        "producer_bytes": 17503,
        "producer_sha256": "9543f1b7721ddce7df6316eb9c1ee3296eedef0931bdc75473231afbad14d53f",
        "wave_bytes": 1556,
        "wave_sha256": "a86339572ea0c77f2b84b0fe6d2447e2523a454f0bc1cab3f9db80c44db6391b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "00c140755de912e95cf20aaae029d36f16fa1504d05f2faef07320069a844bc1",
        "producer_bytes": 17503,
        "producer_sha256": "fe13b7c05fd7cd00196d5d745bf02a2809934da31991e58697de2f212bd93506",
        "wave_bytes": 1556,
        "wave_sha256": "ea67e4220ed5f9036737d74632e350972696bbdc39e2a04fdad57fa2733e347b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "330ee7a7ae49aeec70e768b08a71c453867b4983f6307c066a6bfd4ebe774799",
        "producer_bytes": 17503,
        "producer_sha256": "b4f6fcb18788c5edf596dddd95c2440bcb09ee147a3fa299ff8669610a140b69",
        "wave_bytes": 1556,
        "wave_sha256": "2879f23bee44c62e6f55de036df28db544dace33515c0eca23ba8bc34c793b7c",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7e694f6c88da66899a8a19c8d2bd2fb2a1299ecba163881eccc238ac68aadca8",
        "producer_bytes": 17503,
        "producer_sha256": "e7e0b4eb0e1d6b1b04737f149831f6af3c021bae50e841b91fe1a985613a0c7a",
        "wave_bytes": 1556,
        "wave_sha256": "26040b743d3deed7d1782442ef2dbb161765e73f67729f5c1ae36102999cc937",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "05071d38600a40d85db3374c4575f31b99b0895c6279ab724e4edf93df344951",
        "producer_bytes": 17503,
        "producer_sha256": "c545251a67a3988db5d682faf80b373fd8012fc4d69e2c06b11c5b52254b3945",
        "wave_bytes": 1556,
        "wave_sha256": "ef6c7e2b986bfd69a7c91553554b47aff0882de5dbc28ed82f66d7bdbe70f118",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-none": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "b330e39d5055410a0551c0d966a47fb69fe599ec9c1e960da22b43aee0f48bf0",
        "producer_bytes": 17488,
        "producer_sha256": "dd3fa760609b9469733cb14c9ee10ee93073473a041a48b189c0760209f65dbd",
        "wave_bytes": 1546,
        "wave_sha256": "ba3979949061b9a0e2fefd18041b6020b07feb45ce6e08157a4b5b1c9ba80599",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-06": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7bcc44fd716b46480f7d5272e8d145a736490e51e9eb97672ee74cf83924e092",
        "producer_bytes": 17503,
        "producer_sha256": "e74201cc79978ad0c6eabf52c6d595c872932ce421dbe97d1d58ab6bf602aca8",
        "wave_bytes": 1556,
        "wave_sha256": "ff40188cf53e38f4835231ab152112e975f812c936fb10963d732543256506c3",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-07": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "71c9c6189a98dbd1f95dabad6376eecb3ffadcf018ef61b16f82e08543e15e75",
        "producer_bytes": 17503,
        "producer_sha256": "09d34aa086b651c1ea8907d38649b8886f49dddb322796b16ea15c9fdd5c29bc",
        "wave_bytes": 1556,
        "wave_sha256": "e635915c1b17f1a47392d00f65fa72e9fa3d1a2896248a7a9d582575a088ed92",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-08": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "79e2b9c2d72d758513301da261719eb27c5b5cbb5d87b992611a6f1da39fba8a",
        "producer_bytes": 17503,
        "producer_sha256": "fd0da201024809fb5ffcd0f405eefbb1d06cf396d42a024dfe3963a4cd4b0fc1",
        "wave_bytes": 1556,
        "wave_sha256": "022de910cc4dabe1b977cd6363f3dd7a6e9e247353c544a0af13ea7797793d8a",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-09": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "2725508c9833d980ce751231d3ffce7b47068a9b2c4085169e53e62bb91d8efb",
        "producer_bytes": 17503,
        "producer_sha256": "87666f1f219c995552944ca44bf9ad1a8203f47d76ccd86775d3bd605075ae01",
        "wave_bytes": 1556,
        "wave_sha256": "168b0ccd892c3bf57b7c530226474dc9596963bec0ed2338031a5e10991ff41f",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-10": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "531aa18a15edcb57704f75e4b18a5b761a36df831639cecba8abc50d15c9dd3b",
        "producer_bytes": 17503,
        "producer_sha256": "d6c0b2cf20a73393542015e3f4614a5f01979752b0c8e7db249b2e7b96f6b871",
        "wave_bytes": 1556,
        "wave_sha256": "6f82bb102e243777d4418b55a728ca3dc4b67f258f143119f40b620d1d0da430",
    },
}
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279751,
        "cnf_sha256": "0f1672e2900f327ca215dc08a42551947b753e5df2dcc19e35e7b872b73e4aac",
        "identity_hash": "ef80bbcda7a64115385b1695ce2b71595d1cc761593da7590b9167e635530eea",
        "producer_bytes": 17595,
        "producer_sha256": "501b915b5873b9a6a70643747096a1d029719ceadabdf42432fad09117ac0a6f",
        "wave_bytes": 1543,
        "wave_sha256": "42f3c19f9dd0663bd0018e3a3a21b519633d971f29aa17e0a52502647920cf2e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "9387bef5ec122ff1c426c5d7ba580fa9d1ea4a23d1f6e3f3bc41c061a3688644",
        "identity_hash": "be55256b0be266d7e639d7e5167d8c02632c57f2532bba1df6d4a2afaf811cd0",
        "producer_bytes": 17610,
        "producer_sha256": "d89a3f5381d3616db9359f2750171f1e962f06ced8d9b37565625c74da4cd303",
        "wave_bytes": 1553,
        "wave_sha256": "1478c767661be514bfe48e1388b443af7cdd1bb30fdfbe5e397bdfdfd49610a4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "f542f26fdd3293a49f33dedbe3c4e3c1e5cc1af88856bcbc2ad82339dece06d5",
        "identity_hash": "14fd44568f5ab8cde2f19581ec0d776e91dd8919edd94d2a9dc9dee0040b9d05",
        "producer_bytes": 17610,
        "producer_sha256": "401be5b40a3c68081303bd83ab2b7925bbaead9c90f8dae7ee8b8657b90e497e",
        "wave_bytes": 1553,
        "wave_sha256": "a4bf55e79b9a31351ecfd986f3d756de28dd7c31b7dfc51e25bfc4be2384f97d",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "3acc20cf2b24d033aec54ca407d9304d0e9cd33f4962154a83d4534883b73b50",
        "identity_hash": "8d2c6bfbf8aa86adb9973e9269438e252d301f103d6402c6d8a8c5971d6fc77e",
        "producer_bytes": 17610,
        "producer_sha256": "936eddac606fcfb4a605a1eb397fd6f53a5a7e5f8fa824ecbf1d0d5328abb91e",
        "wave_bytes": 1553,
        "wave_sha256": "6ec1b441d540e762c1fd4e5119aa19cb3e263ca317ccfdc761eb09a7bfeb84e9",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "711c9756c93f239a09934baed7bf2bbb8c30ea2d4e9af3edd4728c87e584c093",
        "identity_hash": "38df2c74040e127aaececba13c1774777e2aadb2c4bfeda4d5741e0df2701815",
        "producer_bytes": 17610,
        "producer_sha256": "b7b44266a027bb03d6286cb6a8f1fedc3394bc3bbac45c5ee6f1b6f91e0b54c2",
        "wave_bytes": 1553,
        "wave_sha256": "bb9db555a61d1f3b00cd4c30139185340207c230bf3b02652b9821c36f3b350e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-00-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279750,
        "cnf_sha256": "48fa653043ec7d07071a7cee8f9029b7dd5af0ce0af3212bec1e06220e11741a",
        "identity_hash": "386a5a17e6d11a76cf88f338511b8c8d9b8fc33f30afbf673f96ec35552f7498",
        "producer_bytes": 17610,
        "producer_sha256": "324c02a169b5074596a89096bae20c495bc380cb437c56cc1ac62fb0615ecdea",
        "wave_bytes": 1553,
        "wave_sha256": "37a2a48d8875fca8b0da8f0e4b0145de9d23b1bc967ce3511ebe10d0c8c21512",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "e4eab2dd2f53af8cc29b0b64a8dca8508bb968980bebe7e0517842960c45677a",
        "identity_hash": "50b431f322d7eab3b8b21245586570363c99edb34431600fc7b5b9728fda669c",
        "producer_bytes": 17595,
        "producer_sha256": "779a91b822ea1fe0e3f61991c5307b383e5b1d52434af2f22843f1a7025c5dd7",
        "wave_bytes": 1543,
        "wave_sha256": "84442a45b0c6e16d59d0fc9188dd4ecb6916a5c16a385ded8edba600fba0e27c",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "9cd8ce880c9029aaea56e4d3f5e23b807391b0985f871fd3d06d8e3d3d283547",
        "identity_hash": "22cd2ae8042a5091cc40a62d1e3ede43c2c0220ead040137eb228ed52fa931ea",
        "producer_bytes": 17610,
        "producer_sha256": "22f5ec1ba03bed484795a9ad7a4bb3c11dac1829070a89b96d4a45dd298d2975",
        "wave_bytes": 1553,
        "wave_sha256": "6efb38a31c69abc5403871fc8021f6c90da0c9ed99c9b5a371072f6a46ff59ba",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "1b22cff57087c94d5cbdefe8c9e5afcd0c6ba65811cfb0be7897af150ad135d4",
        "identity_hash": "756c02cf90a3f1c2fb797f5d0020bc0d8c8b1ec17881c946835ca8d2f82ba5cf",
        "producer_bytes": 17610,
        "producer_sha256": "02e1f785bf5e626dfca8a9f2b6dd84679fe777db5254d0b291d67e0bf229781b",
        "wave_bytes": 1553,
        "wave_sha256": "8ed7211bc68fe143d36bf103ff6386594c06a5f53b5827976a7a8ab9d5ec4844",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "0be487cfcf32c55cd725d5e962937484ebd51068111c66f8899cedf34e0ab81c",
        "identity_hash": "aca0bf992f10fc5d1c20d06ea96f249ca77df168d6f690dc0a7705fa9b9242ec",
        "producer_bytes": 17610,
        "producer_sha256": "de7f6eb9a3d3b652d26d36a292ad262820b534bcadcbced683cbf99683b57d6e",
        "wave_bytes": 1553,
        "wave_sha256": "4b6b1f01ab36608e91855753516e4e103de49a9bf1375ae46b186d07c80c1c21",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "38b11f152db9ffe9cab966b49c8ba0a3ce489fecf699de8a82548226da8cf2da",
        "identity_hash": "d46e1885407811a368c126bceb4013880c95890ee767e640ca5d980ffea9c364",
        "producer_bytes": 17610,
        "producer_sha256": "f906620cd5c19af40bfe98b8bdd031d6133a40009367172c85bc3b35711b2ab7",
        "wave_bytes": 1554,
        "wave_sha256": "0b9e2bdb6616e9abaef6b3512333e5c48d0e4459ab0aa1c2a87d5b3171096d84",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-01-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "63ab4f8f416085f6b227de3134f7abecb649f62f6d4c58a133559569afa51bb7",
        "identity_hash": "4a602e1199d6afe0af1cc79dfe2fea727363c573214c71d95e805ae4750e7c09",
        "producer_bytes": 17610,
        "producer_sha256": "63b840de7aa87ecbe8493529b0711b684de0410f0b48baefabbc4c0c7296a3a6",
        "wave_bytes": 1554,
        "wave_sha256": "b3ab4a556001d1d542f57d2341fb5cf7a7a33af9e54eb1bafb235a9ae3a4191a",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "4d4f2c031b65121d66abf2f659a5d614fd20d243266ea3ceb44051e0f37e6527",
        "identity_hash": "d6a047a643d01dbc9c8e22da7009f403e1c6181a12aa12a268772401851c108c",
        "producer_bytes": 17595,
        "producer_sha256": "7ce81890ddb8bbfdb65ec3983636f8a8eac136851d75728333ad65701c04edd2",
        "wave_bytes": 1544,
        "wave_sha256": "3119f9479d01804a598842f967608ab1a59278aa6e35552f2bba62f021113434",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "0dee9f15d95ead6660a7f160289a28ee061d7f685a9a4a7f563798864f4f94b6",
        "identity_hash": "464e936ca9f0270b6205606f0d3eb808abaa871e40ff394aa3ae535efb83d165",
        "producer_bytes": 17610,
        "producer_sha256": "4c2caf1fca3710ca0a716a39e4460a80fb6779b88c1821e46df772ba032c448f",
        "wave_bytes": 1554,
        "wave_sha256": "2a66c0cff8973225ada5b0f32a452abc9726d50f3bb8acd6637208ba73a67436",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "bdfd6ada4b917f8c915f0b09af25fd4cc89ff20e3af1776573bb096db9118961",
        "identity_hash": "003e7110a4c8f754381752bc28793535992ad2c1f957864f2db4a7ab92873f87",
        "producer_bytes": 17610,
        "producer_sha256": "a59befb4cee1f7e642caa999dfdec2915c3de0f98bf8343fa213ffe47fd6013f",
        "wave_bytes": 1554,
        "wave_sha256": "8b7a23ec22202b307171c0b394bcd26d8ab375fb321c77edb380d3eca74016c1",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "63bf40a66e25985b5880f6c058a8def76a5d8b7b88c7e87061c5d5e0e79eeadc",
        "identity_hash": "6750cb363ec3d568c7e35ec8ea14c4dec341461397aef40f63ddd9334d59cb8d",
        "producer_bytes": 17610,
        "producer_sha256": "144b55c972e4eca1dec326f3e8d7b1d6cbe0f480197a16ee53705ebc58e52d3f",
        "wave_bytes": 1554,
        "wave_sha256": "e5fc994ebc955532212f51aac6f61a24863d16b359582fd635c3818b83e3f9fa",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "39fdf30be481a17a00e768e17222faf010469a830422de0a19d424dc67b54f4e",
        "identity_hash": "9b7bebf8fd0feac238ceef6448b208383fd38e84c26b2c861fbb698d9b847a2b",
        "producer_bytes": 17610,
        "producer_sha256": "c6d59214ef4167ca1cfe6cfff8e08462a03a31255fae184e7d5b313ebed26571",
        "wave_bytes": 1554,
        "wave_sha256": "91de69b17bf8640d8b3d721f18cb5bb485c0197fafb87ce0b348b4239b06511e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "50fa02ed097b4e9c35c3a1a6492754bc38f640dc688993893c7c2a51dfe60489",
        "identity_hash": "49e5014414eb958c21b09cbe6273e9f0fbddcd59d19047cbc4fc2a2b28e8e688",
        "producer_bytes": 17610,
        "producer_sha256": "74f21e0e48958518f052823da557730d5370d20a564f57250cce6edc7db1d80d",
        "wave_bytes": 1554,
        "wave_sha256": "1d1b5ae2e421d76fb4a72db75dd410ddb0feaad8875f0f248ce1956b5fa1fd7b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "f1a95563cfcd2b35094bbe04c163b87de931dbae1afcd6862158b9896cb3e20e",
        "identity_hash": "feb39fc168ba3d9d60cd3934efd19695677c1493dffc4c2bd2814897fcdf9c2c",
        "producer_bytes": 17595,
        "producer_sha256": "bf41b14dd4d288075d9583449abfa94752bd54713ef2eaa6ef96f3bf327d4e6b",
        "wave_bytes": 1544,
        "wave_sha256": "6cd85eb46bb4a71858647f35c67272a61728eab1f625c4325ffa63818280c51a",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "aaaabe2176d060e18f15d04a3da527c47db95e153f47d936502cb140e07ce986",
        "identity_hash": "67b107146e080266a947cccb34efe630a1887a4cb5992d808abb60db6e11376b",
        "producer_bytes": 17610,
        "producer_sha256": "85b294c82ed9536b892e5285477e9a51215ad428115ec7a76611daea73185f4d",
        "wave_bytes": 1554,
        "wave_sha256": "ed7e622a889dcb690c6682f5d5351fca3bb32bd9f2186fae4f3ba4c61a9a8a8b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "57b3dbbb7f4d86ba54d3565fcd2207b33b01b8fb806eaa05afa12a53051addd8",
        "identity_hash": "795ab9807607cec3c845e022abd6aec16740ea6ad8105e1d52452b0d80d1cef7",
        "producer_bytes": 17610,
        "producer_sha256": "1aee986385554fed4c8426da3488cd2764dc9a04a638d070c097793c196d4b75",
        "wave_bytes": 1554,
        "wave_sha256": "8a1d1b5974f71b1f509e1b4d2c39def20da2f9d18fe8150ac15c7ff5ea175d01",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "f41280acf8814636bbaf6358032f6b0e6a546aa61a1db9293f2642432c4bd610",
        "identity_hash": "bd9220b3eae62d8ab36511ab8b2d8da9293ca04a16a2b1f83e05fe8264f3d7b2",
        "producer_bytes": 17610,
        "producer_sha256": "55cffdc9f3dc9a35552f8c071b2d29db0834c02f81555315fd76af0f7d2ca741",
        "wave_bytes": 1554,
        "wave_sha256": "3761bbe74452bfec039f745f28a7f3db500f147f7495fde8ba0e81f774d0ec8e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "72504a91a40a006d4b8e9f0730b77608674683e30bc355fe799bb4e68b81ef99",
        "identity_hash": "43512c85650f34a274f0331c15c0d0e1d934d52c8e2a65caa786f77f5d9384cf",
        "producer_bytes": 17610,
        "producer_sha256": "49720dab1734241a6dd69217b709c1a30d0d7b594b683a55ef7c773db4a856a1",
        "wave_bytes": 1554,
        "wave_sha256": "aed0d0b53ef4cf32ee67ecb8b58957f2311adb71550847984ca4f134a35445a9",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-03-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "d62d071a51366aa6a456c2ecb938f44cef06d29770ab9b6a14d89b6392588762",
        "identity_hash": "36c20518788dd8397b6660e59884431cdd47aef6f49205fe36ebae0843cbc3d3",
        "producer_bytes": 17610,
        "producer_sha256": "86754f96ab568231d9ed2793391a1e4b3e90392d431ab99b0b807d78f40e9b95",
        "wave_bytes": 1554,
        "wave_sha256": "354606d6eb6543696339b601abb2d2b54fb4b6a77fae95b6784062473abe2ac0",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "b20a3d8f12f8ad3b9e67b38a27f0879890e6b79dfdb5fbbfa6582127e2d13fac",
        "identity_hash": "32646f903fb7f52fbb758b14870de810d557db540bb8cd56a13bb3cf98fde8c6",
        "producer_bytes": 17595,
        "producer_sha256": "ae64f39049ef681389a3a85a4b59cece4a1af643f1c9112cf20e5a9084c41aed",
        "wave_bytes": 1544,
        "wave_sha256": "6266076bdf181497e637807aa36b29b40d3404afd49ca25bea76367af13063ac",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "9ebc9f0e2f33ef12f55bd04973fc1d2b37228c51bdfefc2b89c29e80d57bd31c",
        "identity_hash": "e6da428671f35881210630f6d6468faa24f2a4978ecf4616123f975bd753eb76",
        "producer_bytes": 17610,
        "producer_sha256": "fad1b46a143dd02be27c944e2f86eb134b457e63dd9f3849aa0c5fde87e56628",
        "wave_bytes": 1554,
        "wave_sha256": "97eb4ad6ffdb93484e2ba5fefea75e1d9d722912cc600e44bdce30a634431b38",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "2103cd7c5c4b620a62204c2d01050606bd75ebaa265b7156dc7a20853ae052dd",
        "identity_hash": "f417cbcf808bd0a0a1a0107b0f15b1f62eb5f2a701fa7ec5a5e122f423734b43",
        "producer_bytes": 17610,
        "producer_sha256": "52a6ff6c3e8a6b1d81e57afb5850906b5a70dd06d7b92933d40703c1c833150d",
        "wave_bytes": 1554,
        "wave_sha256": "9b4706dcb99fd9d99f59827bb007532c6f36a436c9208b8e21416e58636f7d14",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "aa068ef760d71f239e52fbdc4be4042c2999965732d92a3553401801f60b7889",
        "identity_hash": "142cb477a8cf70810851a9c6c965ada299f93fcfcc3093ef5ff6afad774a2c22",
        "producer_bytes": 17610,
        "producer_sha256": "51e1dda9fab3f6e8778667a05bad6294bff5a383cd2c9d173503224cae3a064f",
        "wave_bytes": 1554,
        "wave_sha256": "078d1eff45e95a06907feec288b5c613428a510b33aa2c9044b606bb757ae7f8",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "b3c340f125d9da91e111a780842233c1d482c4642e5be53d0dec9de9cdc6514f",
        "identity_hash": "e2f76c8ff2d960f60d56e375886d460cbc24f9079776e7bd3ac3fe72f301004f",
        "producer_bytes": 17610,
        "producer_sha256": "2ff0df00234ba294cf859b98157e8daf214d22c07175e3f0497d6eb947bfc305",
        "wave_bytes": 1554,
        "wave_sha256": "90b8128fb3809a3b4d2027fc26928f9c2cbcc646b93f54b2560ad09359c9552a",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-04-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "f5068fe5a02fb29ed21172797353d66bb30298c3ba5228083577ed9dcbb6cea1",
        "identity_hash": "dbd6e3b8d1d192f40ba7d1e596229a50a6c9bd8c43bf75c36f1d51320d7be998",
        "producer_bytes": 17610,
        "producer_sha256": "aeac2bfa64cd0d440fde930d03393f0e322c6eb2dab62d4910c3b744daae78cb",
        "wave_bytes": 1554,
        "wave_sha256": "9f10122206a7ac99d4797e6bedaa63409e0317a87fd6f7e7c02b2f5b7d6193ec",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279754,
        "cnf_sha256": "1d3f7608bbe14a165aa5825d8fe65993118b47544043c5a92ee075af92667a9b",
        "identity_hash": "d56c0b8224523c49ed3f910100ac6ef1c183464facd3d2a776240705b1a40771",
        "producer_bytes": 17595,
        "producer_sha256": "eb67f9baf3e433167d42130c02953b6b5d86fbdb05bbb2447606102e98b79447",
        "wave_bytes": 1544,
        "wave_sha256": "5a2a657ab1506a581d62c2d8633ce1a6e746891665727cafe3b35f7e8c081d9d",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "fb8cdbe4a0b5455099b55cda14e44298295cc9307b11fdee3d2711959efb2d98",
        "identity_hash": "1fa8c374063d707c3937044534294891fb5646247dbeb2db481587ca2cc4c1a8",
        "producer_bytes": 17610,
        "producer_sha256": "934e41630856082ddf05b28f883bda0d05baf2856662955afa8ebed7fb9c553b",
        "wave_bytes": 1554,
        "wave_sha256": "0f683d2256af256fe073fb98e3796d3d9b84e0f70936ff00e82c4f5320a930cb",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "076f755113decef28c0ae77714fa51d8b5562c48417aa7f5a99d3b2982f29c10",
        "identity_hash": "e2cdb6d06590c824e3e5295c7a2d8d7ab6b1086c429eccd510cbc73e00013c9c",
        "producer_bytes": 17610,
        "producer_sha256": "094c8cc8668a1c157ac4de9b39a2a1b4156aa700791f9316c89336c41144d137",
        "wave_bytes": 1554,
        "wave_sha256": "276453d2202560b590c2570ade57e5d68887f82ec4decaad1cde32f79fe517ea",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "97b68df7dcf910ce5a4a4937f053d2f1f260b8c8f18e40da995bc5805473c1fc",
        "identity_hash": "b950067716a419640548d24d1957da2da64bbc3c77dd60c4e3953e275251b43b",
        "producer_bytes": 17610,
        "producer_sha256": "2d0b145008fbf2b50ed20522bc441d50030c61972924e6594ec58d685873559f",
        "wave_bytes": 1554,
        "wave_sha256": "bcb49be26f720ed46611034319be6c738ed979e5da2c3f65ac25c15102a0a72e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "12830fc7e06dc5f34b5bef9b548a9d5914bfb518a996122f17df830fbba65ed1",
        "identity_hash": "e28048f23ec1c0762ec4f31d7c9129d496328ecc6d9828d9816baac509c3b109",
        "producer_bytes": 17610,
        "producer_sha256": "64cba2c495c5460ff2a38816cf62239545ff4546968feca807195bb63e9d9708",
        "wave_bytes": 1554,
        "wave_sha256": "789ac290158c3b452a1a0d119821d054032ac5308b45ac761dd747f05cebdd82",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-05-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279753,
        "cnf_sha256": "a11f3e6d6ace5409ecdd40fbb7ef3527e366b7d81f95f88ab4b3c14d903e1dbc",
        "identity_hash": "ae3b00d2279c64465eb7d0b8c150979da7ae23443f778850837cb3d3b273c531",
        "producer_bytes": 17610,
        "producer_sha256": "53c9d2105b0fc78b15545fbc75ae399a7a4485bd6ed492356816627c7c43061b",
        "wave_bytes": 1554,
        "wave_sha256": "81eece52ea91cba5cc5c27c70d2b40b0804edeed6ec8238a2f82d49abaf4283b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "1cc620fffaf581cd06fb09d9633e0bfeb8b3afabbb4f1c2a13b7fa50ecdcd3b1",
        "identity_hash": "da3bfe05af83308fb33d05c6e94cab8953b72d5ae508545e7bc9b481cd210ce2",
        "producer_bytes": 17595,
        "producer_sha256": "9cb7203f77cce85f07fb0cbf792819d8ed635a01bbd7e9fa2916afbb6e8243a5",
        "wave_bytes": 1544,
        "wave_sha256": "2095dded473d7727c74e9dbb013e99c9dd7e9e86be277f7a4e446c6daa086317",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "4b52fc662d1ecf3a7834809258da3837152abcee9d6b575f0fd96c3bd4c50251",
        "identity_hash": "fc010223a0e048bfe20904a91990d4101cc8b0df07a5cb323fa73c56712916e5",
        "producer_bytes": 17610,
        "producer_sha256": "3fa4c3a622ffdc7c5e6182f1e64a0d0cc6d9436ca141917567854269ea7f3609",
        "wave_bytes": 1554,
        "wave_sha256": "9126b91b0a6f16ea01557cf8b643f5040761bcf0acfa68793e84f89f23d8fed4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "06b8b5d01739c1215a0fcfa9cf378936a8e69a1409df94d9b33bae8533204e3e",
        "identity_hash": "730b5905c6aa2e997bd3006bd2315059af0eac79bad7a7706ebef20becd2d741",
        "producer_bytes": 17610,
        "producer_sha256": "8d34d9994af879999559d4525161c02d76eff126e8a713d9cd1a1d37538df78f",
        "wave_bytes": 1554,
        "wave_sha256": "e00a26313707cd37185a7001dd607feca2fb0cf4c5d203871e893fc46e1f0c6b",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "1dba91551724ff8edfa2d66598690c564a3227479635e1780c4f8b61b5efbffa",
        "identity_hash": "3c76efe33042318fe26c7f6b206da709c9c6686ec27e263ea79a3fd12fd26713",
        "producer_bytes": 17610,
        "producer_sha256": "c63b8809d9061821e67a7140db9cfe3be0490edfb16a919b91b4b9da29390b9e",
        "wave_bytes": 1554,
        "wave_sha256": "878a73af0592af6017e59cb16f2517b4cd95b36c139de88d7d79f9c339b7c1d3",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-06-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "49241f15807bc8c2e96575272743dec001fc2e4c877c79f22278c4f1949c8d5c",
        "identity_hash": "2975f25e47594b46770eacb45ae37aa47d1d130141e32ed924437c584803828e",
        "producer_bytes": 17610,
        "producer_sha256": "dd49c100184edcce742710b1d8af7ea8ce3aa1ac58a6a2be14b6c516f7e8c461",
        "wave_bytes": 1554,
        "wave_sha256": "12109d9c4c758f7da67a790b4b86d292a92f54d91b275df2d64ebf9049559451",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "010314dac26c886b1d6b4d45556ce8e1064904fc9e0e6ffe1f1b79738ced7b4e",
        "identity_hash": "2f7a8168858ddaa995ac0b492ded636422731a7f3173f9ba98338431e05bf290",
        "producer_bytes": 17595,
        "producer_sha256": "d8e1444e60ea404c549ed74e136ff11d7b84659c1bc6cc9157334b3d1058f2aa",
        "wave_bytes": 1544,
        "wave_sha256": "3c76e290acd3893ae35df6a1687a77b229d15d55827014c9acc54f79f3bb403f",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "a8a34ca6a33486f7efbe8e2e0a941e7df3bb7d2b3815410cba19ecbc5e3bdf3e",
        "identity_hash": "e4f2ad1ecea53d93c490821808cf488b571baeac87128b8b00830153c3ccf134",
        "producer_bytes": 17610,
        "producer_sha256": "71b01f9e9558461a45401b299304b7a111e5ea2875ccad2e277fe39b278d1717",
        "wave_bytes": 1554,
        "wave_sha256": "30c80e4607c873656bc3f1a2564aae2555d79f883ba2e4cc62d8c0edfe5de387",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "70f1c76b869e269f0caa1c1158aa51c00dd9843fbf0324698d354772d24bf46a",
        "identity_hash": "78c0dc26a646691c7e60885a1abdede5f182c12a1542971499a3019707c1c5c0",
        "producer_bytes": 17610,
        "producer_sha256": "fb38e269a4b3c3949b428d7c0595c430a5259c51f46c1178a631f8cdf736a610",
        "wave_bytes": 1554,
        "wave_sha256": "4bafc8791c29cc45f050228f1baddb4a3535006eea0956f0714506164d6d8dbc",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "65fa55b5e6214928c3eb6c4c811d9174555e5a4686c46c5911eaef0329de0b7a",
        "identity_hash": "f14eae319287e76e484e7ca18bb7e939d05d9fed5b472a4eeeff639051467a39",
        "producer_bytes": 17610,
        "producer_sha256": "67e86ba98995c16982f23ac1d3069715f25ad8419e7822c1cfc88c4d368e9170",
        "wave_bytes": 1554,
        "wave_sha256": "c2fd3987981c75ff13d5a813a82b381aa8954ff8b60b7f332358857a13fb7312",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-07-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "90a7d91d453ba08e2d8f98d2469eac977ff97592aedb24e2503131cc684760b2",
        "identity_hash": "fbb2096cd6b383cd132bd016a8f84391538d8edda41ce0cf040c327cf6a6085a",
        "producer_bytes": 17610,
        "producer_sha256": "067ebfaf9c9a4ae6a8b7c1c2cf36eb65d4ac2279eaa46bbdc0d7171703888e5d",
        "wave_bytes": 1554,
        "wave_sha256": "375818d501297d8d147eb3fd923479d4626d7026ce35a4d75cf005e6e2e6c4a6",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "7bc92aaad387d5fcbeb4f314ec9984aa52df454fa03c0883b9f793be4cf894de",
        "identity_hash": "103fc5c1a6e2c5e924374091747af2d534f00cf694cca1575b3a2561fcbd355f",
        "producer_bytes": 17595,
        "producer_sha256": "2a8822fb97aee57935993fa69e402e477c8c7b6c0d2524332816364725ea1f13",
        "wave_bytes": 1544,
        "wave_sha256": "8ed08bc985925fb0c27c554cfd794ff02f1a1676dc3d22082a5ff2b8d2601895",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "68d165f4d9cde0332a15beecf87b7d3f4dba33d1c39ad4e06f4965ec69f8d312",
        "identity_hash": "becac886922a700c342676fc264aa40fd8c8047bf1748b564e4dd013b991977f",
        "producer_bytes": 17610,
        "producer_sha256": "7afc671a4f342e90675832edc8450bfe6dcc70fd968afaecbb766f1777684090",
        "wave_bytes": 1554,
        "wave_sha256": "98f0ceb5a813374bf01b4773f2650fdcb4aaa34003846666119185e396f9f5fb",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "bfa80ef2578095e737a63a7b7652eae8869197c29a917ca82dc73d66274554f6",
        "identity_hash": "303bca31fee3a65259e4397593c85841d5315a9013a8dab8cc0678159277c6b5",
        "producer_bytes": 17610,
        "producer_sha256": "b8bd94b59c5c27afb242e32c47c7e4478f852597bda4f73a06c9d660cfbd71e9",
        "wave_bytes": 1554,
        "wave_sha256": "5367ad27ee0a5452ef4ecd5f4cf4ecdd5dbcf96d6d46db5ccb197821e834923e",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "674ce72ea2d062317f7a95c72d4fc2d664bd547045b44809c6f4a3c056390226",
        "identity_hash": "c330f7dcf2735dbef2f8cf56bb44d988e8925768d69025785da06b00bc69c9d4",
        "producer_bytes": 17610,
        "producer_sha256": "457080dbb002f547c8fe60d5c92da1185e3c45b9ba2c343914f7890515df3b02",
        "wave_bytes": 1554,
        "wave_sha256": "4349e4ea5c8929b0f653a7ea882cd21acf51a07f9ffa6cc50a851a10ffbdb909",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "f1c6771f3851e69518c868c5d2b015d745ea2eda868e03e58a06a681212e752c",
        "identity_hash": "af9310bf6abcca4bbe9cf76905e7f135950883432be9700bd57ba2ef4a15c07f",
        "producer_bytes": 17610,
        "producer_sha256": "0ea3d896c325f02787d458610543f74ede535a46e3927b824107177b9cb036af",
        "wave_bytes": 1554,
        "wave_sha256": "0b421afa96ff5957d36331c2beaa243f5453b8125a1d119d6dffee9686beae50",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-12-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "eb129b5ac7a21bd40f3513e0b02b69643e1c1bfabe657dcb89d394de99f0e816",
        "identity_hash": "0694f464fd966c3295c7a18afe72a54176ea2329fb384b4acf7b4e1dcc1a8d18",
        "producer_bytes": 17610,
        "producer_sha256": "467da1182b5bd19b414d30f52b76255f62e3b3250d8c12fdd8e0e69a0624d9be",
        "wave_bytes": 1554,
        "wave_sha256": "db22ce9c24dbdab35df6080e1f932b484232ff2d8aee1133c00879cb0348dcf4",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "8279c6d32427257c939f2cfd72fcaa9140702029f655c4c5c06e768aac13c78d",
        "identity_hash": "7f4cc00f31d0d83127a47aa78117193484186d3a02f57ba11a412c360f2570f5",
        "producer_bytes": 17595,
        "producer_sha256": "3df5e23acb74a0c509323ee9a2662cd7718bb52a800eaea685347d7ca537f67c",
        "wave_bytes": 1544,
        "wave_sha256": "87631432bb43808d4f8d04956fa5a835c5d81a89d8e47845b8b79d1e9fcf2c54",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "67ac77b6e2446b17666819c690a6810e2e31de1fce8ec767fdf61b2a5bb6e2a6",
        "identity_hash": "6bffde780d81b6c54a6c72eb60a54e5260eb999b3dec15987446a5ae5e765922",
        "producer_bytes": 17610,
        "producer_sha256": "049fe6b63cb8d69145e978aecd99d9ef54ed31558d52902e3347c0d827ac9dbb",
        "wave_bytes": 1554,
        "wave_sha256": "e5f10d68c19642f5698cc08707bec619b037616792c76a806dd995b4f82eb0c8",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "da220bd1b3c5f9895f37b9b33ec0a7c4d6da6135fb9f867d55e8428302226d1b",
        "identity_hash": "970436f3073f9247b2731711aa94452e0859d33c2f3ead5e1167388b50885c85",
        "producer_bytes": 17610,
        "producer_sha256": "781b93ea0add1ff84b7297fcb0922b2d0e15eb87e9b894d83e39b1b49ec84790",
        "wave_bytes": 1554,
        "wave_sha256": "6419720162f4023dede18d620359e163f3fc026b0a3a0811ec9b14ce86837904",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "846352f125c3c45f4779a2a042bb694fd8fce66f6b1a8996ddb774e77a575337",
        "identity_hash": "1e76a83b398632a3c0405ec3ffa6a3efa4d142cc9f9786c92c2a0623197eead6",
        "producer_bytes": 17610,
        "producer_sha256": "ef175e057538e752515616e717715439c3fd6e8a64600c949395fb0af1912213",
        "wave_bytes": 1554,
        "wave_sha256": "4f1aee2c86e2028cf0d0f90cac4139fd466398624a80d14ec12af6f0b71e33a5",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "0fa812fdc1d79b46e98f031eb55f9614f35bf7ab25a374da1316ec1e924cb68f",
        "identity_hash": "b07e048f2b30453b3b0ccf21aecee038a41c2cb41e4630c933029a48282a54ec",
        "producer_bytes": 17610,
        "producer_sha256": "64ae6b03d2bad00c6aa282ee6b7bb24c640fa935bb425a699c70ef4eed172f7b",
        "wave_bytes": 1554,
        "wave_sha256": "6664ea874ac7941b60a316e0685a82fb0cbae46f0d91d6b0c0b9dd45e3792c18",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-13-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "8c9bbc003055a72b8b568a167f77501a97a51b2fc29244caa5637f0235ab72e3",
        "identity_hash": "85fbda2dbe5fcad7d3ef7b3309583dff9483918f975459bdaef4035e48556188",
        "producer_bytes": 17610,
        "producer_sha256": "25bf9494261b3cd2c5d8001fdc147364345e51c3d1bc13b930fe4fbccba50eab",
        "wave_bytes": 1554,
        "wave_sha256": "1ab2d9b940bd0ffb5186a82cf0f22f36eac01315f3d5ffd7802756f0f8b413f0",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "3a4512b6b98559354831efc1f840f34804caa00883bb572c5adc081c0e64739a",
        "identity_hash": "8cfd3cfc5943e6065dc141e976253c41d30bfe1e1b11acf915c2babe70ca1aae",
        "producer_bytes": 17595,
        "producer_sha256": "5cca5813005f2f6f3d96db261b3ff08471c435194d8f816e830ec85a2b372b34",
        "wave_bytes": 1544,
        "wave_sha256": "861cf6585b41d4b13f7023c086b8e96c9ce91957ed3016186b0a634b4ec032d1",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "fde89aae6d5f5f244ef70fcf15a0375bf04b4a0ed89947aac2d37959ce0ccd8e",
        "identity_hash": "d464d2462b21b396a71608bb91eb2db3bcf3889ceb32fa957d683fa5a11d7967",
        "producer_bytes": 17610,
        "producer_sha256": "ff42cd0562ed8b4e11f959e917988c0bfe63df31d2b2b263468e165401e49b8b",
        "wave_bytes": 1554,
        "wave_sha256": "518f99c6a25d0146efefbd9b7f6750d5cf8108e8d10173b0188e04a8047069e7",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "3ac82d2e8c2b85eda74b84c6c154acbc54c4d618dbb0bfa84e89cc88b3155492",
        "identity_hash": "4373a3e61e29548c3d6bd3c12df942fd205e670759f02cc3e884469cde9425d4",
        "producer_bytes": 17610,
        "producer_sha256": "12c0e8cb2bd86c02683361618364220326368643e123d5dc2af56bd09e798a1d",
        "wave_bytes": 1554,
        "wave_sha256": "c522cd0ebdde97a2c69cff2bc72fc831ba816341bcf4f7b1b5c6340279aa2e53",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "b8c7e6f7d9846d7e6b36b21cfa6dfe3174d2b942bd97438179e0af4a2a71ba21",
        "identity_hash": "2fdd4812f46f4896bde91f318173b4c05b5b6e29ea006e3a58d4cc5a554bc0e9",
        "producer_bytes": 17610,
        "producer_sha256": "89c8a1d7a3f63db98894c31a9820f8f7ff8d71bfb0c224dd4bfc20cb05116832",
        "wave_bytes": 1554,
        "wave_sha256": "85dc090f0b178b8560a4e0daacf060ba343c39dd8a9268ef79937dfdb9e3d091",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "28a017618a22ee4a73ab770b80f4bc818571097f2abe4f2293f0ecb85c9f82c8",
        "identity_hash": "c4cf25d0201095decf88d0db35bc340b2d4baea6349182e143d23aedfd2f652a",
        "producer_bytes": 17610,
        "producer_sha256": "68fade0fe43a27a09ce5a851dc555e5f61506744ec90915d2eeeabab979a5665",
        "wave_bytes": 1554,
        "wave_sha256": "fd5ab49e17e1a95c39cb917fd0bc6dbadafcbfd5b2e1ffd537ca762570a06c89",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-14-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7f8e64d1da8711e8bb1fb1f9c1cf3a0699a576c5303b92ee2306da412a67029b",
        "identity_hash": "1a995418d51f93ecf4a1a7642d7bed9db9e8b73bda7dea84a5a9be58373cce8f",
        "producer_bytes": 17610,
        "producer_sha256": "a71aec9b48422ac6864584194c9aabb1158963722257f1a584afda6739d72e96",
        "wave_bytes": 1554,
        "wave_sha256": "d099930c4153947b99e7657848757a64f2b659414b72e6f925151b6523a9cd65",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "f69da4cf83a05cfbf7f8e8ca738bbc37ca9a8f6af0449fca0fffef04f25d7d8f",
        "identity_hash": "db7e4788620c844b5c3320f0a6a714f5d9b6657fe7b148b3e122dc5ff62e81e0",
        "producer_bytes": 17595,
        "producer_sha256": "88531011cdae181db6a93e7b0c8f8df829bc1d95de4287d93431c94a2b95ab49",
        "wave_bytes": 1544,
        "wave_sha256": "b42d1fa7be76d48cfa6b633c10d090cfd841316c618bd51d8b3db8ee1ed3a0fd",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "4ae527d95da53b9618839258651fd349c7f4c7e21e6c7bfdd0d68442fe90c9da",
        "identity_hash": "876e480bd3825a0ba49d186fe797740067916a1424ff68801101768bb5ef5917",
        "producer_bytes": 17610,
        "producer_sha256": "97ecbdb07e4137aa2231c00bb8c8cb3c3c0db892335531feae1658572ee63ba6",
        "wave_bytes": 1554,
        "wave_sha256": "700f82fa03394a8c5eb9fa714b2fc1f24d52ba2e91ab49faa42b62a55dfa1963",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "00c140755de912e95cf20aaae029d36f16fa1504d05f2faef07320069a844bc1",
        "identity_hash": "73738b83a7fc6dc7d012cf709f61eae9764ff760715b03be150e4aae289867e4",
        "producer_bytes": 17610,
        "producer_sha256": "e96383272fe83e54b67e7a872f7294973dbc56d5274ad8bf3bae32ddca2eaf24",
        "wave_bytes": 1554,
        "wave_sha256": "ee715677af047d0c3ee9de41fb8ae74331a38feabcbd6c7df1526e155decf87f",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "330ee7a7ae49aeec70e768b08a71c453867b4983f6307c066a6bfd4ebe774799",
        "identity_hash": "73d9e9d3fc405712abb54fa3c311b217dfc3a9b14b3987c5577867783a57b512",
        "producer_bytes": 17610,
        "producer_sha256": "6ef28054984d38b323611d9fbdb066c79a1c1074ebb4e172eb373e3de9d5ca7d",
        "wave_bytes": 1554,
        "wave_sha256": "fa2d7b8382b1ae62e82a0faff6f984b5a9ab2998d5fdedd16e591ec6d1c2aff6",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7e694f6c88da66899a8a19c8d2bd2fb2a1299ecba163881eccc238ac68aadca8",
        "identity_hash": "800f6599e48e5850e0e14b8645f80ce2412f57346aeadd16aa0b6d5eee41100b",
        "producer_bytes": 17610,
        "producer_sha256": "d08d219e41f019f74b6df819877b89b0264b4d22d43a4ce64a5927184175fa5f",
        "wave_bytes": 1554,
        "wave_sha256": "1adb74ece7b18c92ee9141b68877604e5870cf717baf1a989c5f7815db6bdea7",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-15-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "05071d38600a40d85db3374c4575f31b99b0895c6279ab724e4edf93df344951",
        "identity_hash": "711ddd2454c157e9ced333531ebbb7bbc9328f3d23df57819c151bc1860e173a",
        "producer_bytes": 17610,
        "producer_sha256": "225fd56120c00774fe651ceefd9bf2b8dedd0636131b7af8d60c78f45aead51e",
        "wave_bytes": 1554,
        "wave_sha256": "94da26b69cdc4aae21b2013a6d698d444e4fe206b03a6d84d845f2c50aaf56b1",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-none-sat-profile-v1": {
        "cnf_bytes": 346279759,
        "cnf_sha256": "b330e39d5055410a0551c0d966a47fb69fe599ec9c1e960da22b43aee0f48bf0",
        "identity_hash": "39138340fc807560d852e46ce44294af81baae08359c76931579d5025acfdbdd",
        "producer_bytes": 17595,
        "producer_sha256": "2d2a446e4a64952b7fc979c7099b18eea4cdb32a7943ba33ec8299059ed5a6ed",
        "wave_bytes": 1544,
        "wave_sha256": "61052af3c3718ead58629b2b85152dcb2aed4d442613b3042f2e5b896dab0144",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "7bcc44fd716b46480f7d5272e8d145a736490e51e9eb97672ee74cf83924e092",
        "identity_hash": "20d154d81231e64a75058066e2cedaba6f6d1b8578fbaf7b642f0fbdbb0ecf81",
        "producer_bytes": 17610,
        "producer_sha256": "32488dc5a3b6ac9ac4d84c192be51c3016a9f41ce057dfeebf036846718a8f0a",
        "wave_bytes": 1554,
        "wave_sha256": "d8d64fcde930c330e656254c7ff114d7086beb5980b6ca8976cc40b4bdadf0c7",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "71c9c6189a98dbd1f95dabad6376eecb3ffadcf018ef61b16f82e08543e15e75",
        "identity_hash": "1eb4c25c9c3c3f293c621c491d07aac7f84c09c606a9edea23a5f79851cae979",
        "producer_bytes": 17610,
        "producer_sha256": "b1e6a36a22cdde1bb3d348987671e85d4eea19f3ab5c89d8df199100728c20a9",
        "wave_bytes": 1554,
        "wave_sha256": "6cfe1af81bd88ccc84b2c6a46bc7a724806bc5faf2be2ccd1ab11f1ad136aa34",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "79e2b9c2d72d758513301da261719eb27c5b5cbb5d87b992611a6f1da39fba8a",
        "identity_hash": "685a329127c2befce5fe27486fbd2ce545903cbf85ca442eee470fecee9ff223",
        "producer_bytes": 17610,
        "producer_sha256": "ae5f32490051c28e2f8ad713eafcf220107ab2c1d6b986280c182515224cd80f",
        "wave_bytes": 1554,
        "wave_sha256": "ef89a318a91db93fb3a4b4b0d1b01be72e451a8f072888a135194d6dd570db40",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "2725508c9833d980ce751231d3ffce7b47068a9b2c4085169e53e62bb91d8efb",
        "identity_hash": "cd4805901e213b1f4c001555816ac7c2e3a65533549d8213cc4eadbc1566be40",
        "producer_bytes": 17610,
        "producer_sha256": "cbec0938b148497c045b2cfc01a5edf715f745984045da3c3186f64a1cf8944f",
        "wave_bytes": 1554,
        "wave_sha256": "de4e048a87b32669111d611b2950b3bc4acfc596401405bf2393ac81e81db744",
    },
    "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-16-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346279758,
        "cnf_sha256": "531aa18a15edcb57704f75e4b18a5b761a36df831639cecba8abc50d15c9dd3b",
        "identity_hash": "7777df72b1ce053ceaeb3b8895a83542428c34d618ebd3773747d0a3621adf73",
        "producer_bytes": 17610,
        "producer_sha256": "a67857ca9dc3e4760fd7300139d70bcb17439d1ae523f6aa73b843d545cc24bd",
        "wave_bytes": 1554,
        "wave_sha256": "8996ccbefc790985837d2fd812f109ef3b41ec3afd2ba0cdd0040a5f3aa8c155",
    },
}
NUM_VARIABLES = 308
ROOT_NUM_CLAUSES = 7_409_372
NUM_CLAUSES = 7_409_378
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
    "erdos-97-96-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-v1"
)

SOURCE_CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-physical-slice-campaign/v1"
CAMPAIGN_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-profile-campaign/v3"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-profile-launch/v1"
RESULT_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-canary-acceptance/v1"
SAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-independent-sat-replay/v1"
WAVE_MINE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-wave-only-mine/v1"
WAVE_MINE_LEDGER_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-wave-only-candidate-ledger/v2"
WAVE_MINE_CANDIDATE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-wave-only-candidate/v1"
MINE_VERIFICATION_SCHEMA = "p97-exact17-survivor-two-kalmanson-refinements-source-valid-theorem-mine-verification/v1"
IDENTITY_DERIVATION_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-sat-profile-identity-derivation/v1"
UNSAT_REPLAY_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-independent-unsat-replay/v1"
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorTwoKalmansonRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorTwoKalmansonRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisector"
    "SurvivorTwoKalmansonRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorTwoKalmansonRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-two-kalmanson-refinements-"
    "preparation-config/v1"
)
CANARY_SOURCE_CELL_ID = "canary-perp-bisector-survivor-two-kalmanson-refinements-next-center-02-physical-none"
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
        "wave-only two-Kalmanson pairing counts",
    )
    _require(
        all(type(count) is int and count >= 0 for count in pairing_counts.values()),
        "wave-only two-Kalmanson pairing counts are malformed",
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
        "wave-only two-Kalmanson pairing count relations drifted",
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
            "Run the gated 76-cell survivor two-Kalmanson-refinement SAT portfolio"
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
            f"survivor two-Kalmanson-refinement SAT portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
