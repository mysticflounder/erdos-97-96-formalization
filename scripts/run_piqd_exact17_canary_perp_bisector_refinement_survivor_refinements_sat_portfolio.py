# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
"""Gated PIQD runner for the 76 survivor-refinement physical cells.

The production byte identities are frozen from an authenticated source campaign.
The runner admits exactly the 308-variable, 7,409,310-clause
campaign.  It launches ``center=2 / physical=none`` alone, requires an
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

LANE_ID = "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio"
BASE_HEAD = "9b234bbabebe6953ff7dac721a189b2c4c90b9fb"
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-refinements-sat-runner-code-20260822.json"
)
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-canary-perp-bisector-survivor-refinements-sat-portfolio-20260822.json"
)
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_physical_slice_cells.py"
)
RUNNER_RELATIVE = "scripts/run_piqd_exact17_canary_perp_bisector_refinement_survivor_refinements_sat_portfolio.py"
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_refinement_"
    "survivor_refinements_sat_portfolio.py"
)
MINER_RELATIVE = "scripts/mine_exact17_canary_perp_bisector_refinement_survivor_refinements_sat_canary.py"
SOURCE_RUN_ROOT_RELATIVE = (
    "scratch/runs/exact17-canary-perp-bisector-survivor-refinements-"
    "preparer-20260822/preparation-v1"
)
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"

# Immutable production pins, frozen from the authenticated source campaign.
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = (
    "39c82cc7da2d4dbe601871cd0bc1769c85d2ef65df552ff029091d653aa9261f"
)
SOURCE_CAMPAIGN_BYTES = 107_287
SOURCE_RUN_MANIFEST_SHA256 = (
    "cdc2c75956e50532af50d6bdd3bac63ed5938efe5f98329680a2c78e1ea0024f"
)
SOURCE_RUN_MANIFEST_BYTES = 2_431
SOURCE_PREPARER_COMMIT = "498d6716315c92019c89ac374df9c90e64fe4c28"
SOURCE_PREPARER_SHA256 = (
    "8055e27a5f4c3d7d19bbbe016883e995dbc0acea23ebaa35bcf44b29eb34be57"
)
SOURCE_PREPARER_BYTES = 116_699
CHECKPOINT_SHA256 = "341c75c3b05efaabe9377abd94aa3830f0398cd5500481974271cfce3c385b7f"
CHECKPOINT_BYTES = 1_154
RUNNER_CODE_CHECKPOINT_SHA256 = (
    "74b287c60c46dbeba1809f152b33aff3edab3f80e068c01715e2ead7dda1ee91"
)
RUNNER_CODE_CHECKPOINT_BYTES = 697
MINER_SHA256 = "b958c1916df0af4d34d02070b3a5a91a99e190b6a50ced3f6a7a2b316c87365f"
MINER_BYTES = 51_276
MINER_NAME = "exact17-survivor-refinements-source-valid-theorem-miner"
MINER_SCHEMA = "p97-exact17-survivor-refinements-source-valid-theorem-miner/v1"
MINER_VERSION = "1"
PINNED_SOURCE_VALID_FAMILIES: tuple[str, ...] = (
    "formalized-core-bank",
    "perpendicular-bisector-equality-component",
    "two-kalmanson-cancellation",
)
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-none": {
        "cnf_bytes": 346275775,
        "cnf_sha256": "f15a39ee8a7a410d99c764b87c2d4e751331e04e33f74b3e00ae6cdfb06172fb",
        "producer_bytes": 7305,
        "producer_sha256": "6b2ab6bfd8d301938857654040fce2a75130e38b785fefbf97582ceb32883577",
        "wave_bytes": 1489,
        "wave_sha256": "64213306fb80ca23ee881d6e8a078c06f53a30ea640efd7fdf34a31391896f99",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-06": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "454e4e2b44d3bb8066e9801fc1a353770a6a9f6b1e705f49f81245b731b7d033",
        "producer_bytes": 7320,
        "producer_sha256": "fbc510a612048dbd63f2798e6c35d7ba3ba1d82275703115cd6dd9ea4e6cc6f5",
        "wave_bytes": 1499,
        "wave_sha256": "72458de4157696ec2d1ec0af82b67a91457066bff8c7e528a8b28c35d3a99466",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-07": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "900fe584a721d0b25f3537e43ddf53bbfc27d4afef381cf60e7574ddb64a54e2",
        "producer_bytes": 7320,
        "producer_sha256": "c3f91ef748f6ba799ef9a21d459cef408146516287a33be6ad12c27ebcda002c",
        "wave_bytes": 1499,
        "wave_sha256": "32e053fc9d649c8da83c704fdcc218df62b227f808423fa4dd47fb60424b2bda",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-08": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "e27b949ca73d8bbc1585fa31326d6368b40db4cd99e12f32d049b9118a99a45a",
        "producer_bytes": 7320,
        "producer_sha256": "001133e3589bc8c0fd401a87a6c7db96c31ee17017be18ed430cd079f12b8777",
        "wave_bytes": 1499,
        "wave_sha256": "630bde5eaaf6ad66c3ed80de717c38de7d74c5b770b4024991b76463af38f11e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-09": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "56b380f869f2a6d992172a592932e801ca4574293246a0495de595f834d741eb",
        "producer_bytes": 7320,
        "producer_sha256": "05864d3f0e50f52ca7f70973d61706e37e6c8e915eaea366a32b058762a62536",
        "wave_bytes": 1499,
        "wave_sha256": "4a0b4a73b4f7457bbf3a760377162e889fadf07931d9da8268ff7fc3cd37886a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-10": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "37c46d128e1c072c531298f50d89f48b018649eb774e52caa869265fd1984b8b",
        "producer_bytes": 7320,
        "producer_sha256": "7a414b90d12811901d5c10a11c2d1cffd053b7395cd8f1a52f6232e0fc4d7e59",
        "wave_bytes": 1499,
        "wave_sha256": "aeb4941de35a3ad3897211ea9c9e872a874c8221f307f3aa01a2d1164b7c4a20",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-none": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "279423dcd3adf551830420bc364edaa39aeedc35e79a3febf92c4fedd5d36811",
        "producer_bytes": 7305,
        "producer_sha256": "83f8ade6715d7d0dd7e26c2bbdcebf84804a43ac375f2f58697f3eceb65d7773",
        "wave_bytes": 1489,
        "wave_sha256": "e0129f6b8cfdbc6331b5ccadfa45ffc58784c102ad58f36fb1302105cf9d1cb4",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-06": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "d697007953c100b171d2354e69a00cb81598a262a29dc91c12e51555ae14c505",
        "producer_bytes": 7320,
        "producer_sha256": "c3eb91552dab5b4dcc64151296a66cb99ca381f33e16579237807e3518e9b1de",
        "wave_bytes": 1499,
        "wave_sha256": "87351fc742897d4123a44ee7998cc0b60da6e27134c0f90584e7dbb49874e68c",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-07": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "6d88bde703b3103266d6b9b883f8d86a3fc3ef1716074384a617901c204a7c34",
        "producer_bytes": 7320,
        "producer_sha256": "8ddc1cb3571bfeb5aa41e483c46e80dc7fe3c60d77383922a695f7caa202389d",
        "wave_bytes": 1499,
        "wave_sha256": "6b7d850e71e0de734d28fd39ee4bc9a13cdb687901fe6bc45f2d1d67d9d1c870",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-08": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "2096b8ba2a2e4747da1bb9ecde2c31c80ebe25fcdb23e5eb51d3393f2b4690fb",
        "producer_bytes": 7320,
        "producer_sha256": "21ce72ba60dcae3ce2e5c6f785c5c35b6ba946a805e7e57d54885fe781d73392",
        "wave_bytes": 1499,
        "wave_sha256": "68ed3a93472f7d673941ee465249c8b2ceb2268916874d410e12695645d0eff9",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-09": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "74965d8d553d8d7dcd79eb311f9a5361ecb755cd6d513eb0dd9a5f17c4cdfbcf",
        "producer_bytes": 7320,
        "producer_sha256": "625837bbc58efa17445b71630fa5b23964c51d6ad36118e09eb2146a453a9bc5",
        "wave_bytes": 1500,
        "wave_sha256": "a9b6aba3617cfa5532a8bee5df96007e3ab5486ccd57bd4ee0008bea383e40fe",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-10": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "fbfead9643577fa227b13d5af7c683cd4cf5b7129c379cb11005ee7bb0a529ce",
        "producer_bytes": 7320,
        "producer_sha256": "dcaad0123b37401925464b587475cabe18df1344d4d2a8cf8536b851a2d884bf",
        "wave_bytes": 1500,
        "wave_sha256": "e622a25408bdf82ec4d594fe5df1234f73f10c4f5713a0fec235d4d661889d20",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-none": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "2b001bc92e09577c9c3e7e7267e404bbd8b16face7f45ba5ee6518caa634b955",
        "producer_bytes": 7305,
        "producer_sha256": "45da2abe83bd7c0392e897e37f04a1a8976d57df73caecbf8d515fb44a7b3768",
        "wave_bytes": 1490,
        "wave_sha256": "a2f824f8f869e22e591354a58a5c8ee9caf8afa6191c8f98e2b5eb8a07ccfd74",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-06": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a782718cf97f247417ba9a89017f7123ff7f3a9987ad38293813647c2fa46a27",
        "producer_bytes": 7320,
        "producer_sha256": "5f0bc9a3628ca0a4008e13b39a49048e1f8163bbe33b696ba9ff1111760b4c4c",
        "wave_bytes": 1500,
        "wave_sha256": "b4621482aacc6e7084dc23ba47d35271ee31f000edf5fd9ee3d00f9054db144b",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-07": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "8e58761692b284de8ad01c71938fc287e110d9e6dfc8b1de37d87fef3905afd9",
        "producer_bytes": 7320,
        "producer_sha256": "c9444e61d10cc12ba1c8160d6d8ed8ce00429e2d21ca6cc841949dc7f58efb6c",
        "wave_bytes": 1500,
        "wave_sha256": "998727fcfd166a074720c806d3ddcdc8df6276e6e3d038e169b7fc59ec681fe2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-08": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ca99854f7d27ab4530074e7349a9b426c4885ae34df346151ad36d97a819b4f1",
        "producer_bytes": 7320,
        "producer_sha256": "3e3505fe9bb6fc91126649f5e6663142c4cc34f27e235c2af9e26e665ec50bdf",
        "wave_bytes": 1500,
        "wave_sha256": "06317fa6db35cb04ceb2eb5d6287df7df3659af2a408305beabd6e1bc8e7afb3",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-09": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e73efe5ed035d320e5b00c131a23d03ba421a6bcc8b1f10a98bac6d3fa9a3a84",
        "producer_bytes": 7320,
        "producer_sha256": "923aa5722a44f31ad5334553d520d7fbf3e621f5717d055277b27bfe1521c4a3",
        "wave_bytes": 1500,
        "wave_sha256": "ba65ce983bcefa8d004a066c8452cd61c92e63421362cbeb68f4e2949ce8e20a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-10": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "042c0627c1f7a1fbf0a18ea5682352fbbb47dc4958a517f2e333f4f7fe4102e6",
        "producer_bytes": 7320,
        "producer_sha256": "848bc509eb234cacead9059387f5b90c9b2c4c18a65e16da2e6047b46a094a2a",
        "wave_bytes": 1500,
        "wave_sha256": "05b0724fc78b5df482f53df937196672e28f7cb3183753ccae03a6f64aeb449d",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-none": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "480e2bcfbf9217c67daf6635ff3d5ffd03160688a4615bb83259469ea4589728",
        "producer_bytes": 7305,
        "producer_sha256": "9b6cba0b233f9d7e822da4f46045eb8b0b813b6f78e94ac08dc2072dcd8a16b5",
        "wave_bytes": 1490,
        "wave_sha256": "fe342957f62b36030a5cf5f96c05a1e24aa559e33d761f2a3b52f379d0414e5e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-06": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "147204d3819d5866b67080edcab143fc0f84c128c74baf49fc1f71a1ca13e787",
        "producer_bytes": 7320,
        "producer_sha256": "8435767c4063d561376bc0e77c4c3453011bae141715897dcb7db70a83b28e42",
        "wave_bytes": 1500,
        "wave_sha256": "41daa7aefe65911ea68afc9238fb30f3c61a7ed135c7b1a56d286117c857cbc7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-07": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ecf4cf39a33a3ce10946b6807a0761b7c095549d29fe31e9524ae91c4828143c",
        "producer_bytes": 7320,
        "producer_sha256": "ae69501fd6e39f63a6ee439b10e9b81bea7f56f6bc99bb4af9ded50dac040abf",
        "wave_bytes": 1500,
        "wave_sha256": "0acd0fd3d44d3dbf2a0533d48488fbd7d633618fad1cc3568a7b5915941de3e7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-08": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a8948495e57eb9616f2e5252460944ad6c785424c8b63778f768feb9eacc065c",
        "producer_bytes": 7320,
        "producer_sha256": "f248e96ae5010a9d6275b536f1f281d44aaa61e1239e2563055433a077784496",
        "wave_bytes": 1500,
        "wave_sha256": "42609a7c82b6d372be5b152cf5d17f2efe93afb3d73dc8a89dc5e946b6606ace",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-09": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "bea5a56195b0cdfdf002ee866a62ae32ef2b2229e874e923b168b2419004af33",
        "producer_bytes": 7320,
        "producer_sha256": "ebb2f9b88d22766d32230fc21d07abbcd17e36e3d9d75fded7584f84ac31fd0d",
        "wave_bytes": 1500,
        "wave_sha256": "d6b0411da7e72166466311e0907b59c54a1a0ab4b58b79d73b15457621b1f4d1",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-10": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e0bd0c63ae7bc1056fbcc831532e20a2c5ac35cdf015d9f9909efe14d62453bc",
        "producer_bytes": 7320,
        "producer_sha256": "4398e228cce79050bb0861ec846ebaa22aaccc947bb69f3fa7283bd5777e4757",
        "wave_bytes": 1500,
        "wave_sha256": "1ab268eee8c6aa22203afc4a6e27ab5aaa9fac4c3923e024465b4a6fee592dc5",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-none": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "9b17836f6f4c1b38e47112839509d3ab37a468f4410abe9418cf9bc495505443",
        "producer_bytes": 7305,
        "producer_sha256": "53d1af8654073d8b58ce377c992f5fc30899db3392595a6667854eb8250b15e1",
        "wave_bytes": 1490,
        "wave_sha256": "28093d3888d29e951271d26726d6fcda97f6c63b06b56b38ce7675732c6ac23b",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-06": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "6a7182357d9349b7d2e541eb9beef5900816dd6eaf5192d4b45aea064c63fa96",
        "producer_bytes": 7320,
        "producer_sha256": "82366966381dd8636aa35607287fb1fbfc9291834f42fcf15f28bdac18620d5f",
        "wave_bytes": 1500,
        "wave_sha256": "ce42ba497bfc77c9b838a6d40c9b5ab9625167b06eb572ab75f9006d255774c2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-07": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "eb5e88233deefba8b6dd1bc5d6faef25809002b60856a1078729e9578d896020",
        "producer_bytes": 7320,
        "producer_sha256": "a70033ca661671259ca137612dff7a36365b807ae755293fe1c8a8cd3fa7f5ae",
        "wave_bytes": 1500,
        "wave_sha256": "8aeceb420950b465cd3d4ca4b6bcdcd336485539d33503d4e3cb5293ea53bc3b",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-08": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e47e520ce648457670734dc512b51236bbc0f01d6a17cc7b34b1528e37370faa",
        "producer_bytes": 7320,
        "producer_sha256": "b34006d1f5be627c8c8728b15e1f264d8150d29ff3cf72cc84c4950b6c0afa4a",
        "wave_bytes": 1500,
        "wave_sha256": "a6132f5c4d1d9d4f09055b37be2762ed3b1c32ecd4faffc07e1b49172b5fd45e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-09": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ae5ac1b1fdc53627554cbd6424bab026365448dced9b5b3e6a19effe01ecc9af",
        "producer_bytes": 7320,
        "producer_sha256": "3b0111b4b30bc7dd030e295d5d3f6332bd3e96effa388f149440046bc7dd4e05",
        "wave_bytes": 1500,
        "wave_sha256": "1f6e7ee7a3a9ce43e3970fb6dead61de0f467803c6e72bbc383423253be4db29",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-10": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "70521f8a225a3920f6d95d79e7f7527b333255e4325c78b5150be0d5ffac8667",
        "producer_bytes": 7320,
        "producer_sha256": "9566ed489d24ba4f81e97c40e94120d8bc1a9882092320012b1a00d8ccd75494",
        "wave_bytes": 1500,
        "wave_sha256": "306e8f026bb46a3f01bd47b2a7d5e0365711ec3385695565c82e37ab69505011",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-none": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "c1e7d2d0ecb867a788542d076b46c139481163b81e2056e1dbf3aea9b2deb2b8",
        "producer_bytes": 7305,
        "producer_sha256": "d92d0a6a6ca4e60e04e995a4d169b0273e6607e446a1ca592e26b63802e45fbe",
        "wave_bytes": 1490,
        "wave_sha256": "2984220fcfef4507dfcfb6f4481f6a462ae4530fc851fcda4ab1312901e07a7e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-06": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ade2107a1d3d70100e48cfd8258abe8f601ae1534e5285eeeed61030c29b74b2",
        "producer_bytes": 7320,
        "producer_sha256": "3dfd57e1994bda764be8cfa5a5353902f7ed8f4da674e4a6d1e483cfc7845746",
        "wave_bytes": 1500,
        "wave_sha256": "b3f05580fc5e8cdd03c9322501a70c8d4b3ff9cfed96c9444af221a235095023",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-07": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "bb014949157127fe8890bfcc39b6d815d5a8eb4871aa1fa196fc4dc0b62303d7",
        "producer_bytes": 7320,
        "producer_sha256": "e02b94a084abb2c015343217e775c9937584a6093a8be3cfabb523a5bc52c91e",
        "wave_bytes": 1500,
        "wave_sha256": "adfe5b35458c63d59f460c131df134ff7cc82529721a599a813905484c4aaa4a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-08": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a1e15f51342a186427ce29ca4475cdb660fb72c36d7322dd71dc9269d6fa1a28",
        "producer_bytes": 7320,
        "producer_sha256": "99e5c1e14fce21ff79e2af7a0aca8e380eb113fab9dfcb9d53780008ae0c6657",
        "wave_bytes": 1500,
        "wave_sha256": "ef7a31b150542d86da3017cace9448b36fe18d20c62dc19cd8f999ee3e487a6e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-09": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "65c275d259bb5ca5984f2506f14d9f5f9b9487931572744e959ec4e8ebe45223",
        "producer_bytes": 7320,
        "producer_sha256": "735e36f537b8cf942673479bd9e4dca61927671dc945d78fa7a0b930abb80c40",
        "wave_bytes": 1500,
        "wave_sha256": "33edf108f2644993be038f7cfefc44a131a0d279871230fa2936c27ec6a36cbe",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-10": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "83ac420913d5af6b7cdde357cd92bc01acd371d52b6baf4aa5dd2b61c56e10c7",
        "producer_bytes": 7320,
        "producer_sha256": "2a89f3ac0a2e4ca5f107abc8326552ae298dfd3119a855e66551b4d6fd1abc56",
        "wave_bytes": 1500,
        "wave_sha256": "02b99561d63d7c1f32d67b67299a17f0682ae12da932420d3ec158df81abca55",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "a4c2545aca06478e4b0c397f43ec6aa7caef2bbcadf5b2c8d95409be1fbad1f7",
        "producer_bytes": 7305,
        "producer_sha256": "9d4a403638d5d62a7b9f1fa8fcba2b779da413d86efba1375f532d6aac7dd703",
        "wave_bytes": 1490,
        "wave_sha256": "d853990069ea4b0833a2ab12e6c451841f59ca0a34ad86c9f45057d2ca43fbf1",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "42b5de153af7732774607274bbbae85d366a569e43e148402773ccfee9e8d2c2",
        "producer_bytes": 7320,
        "producer_sha256": "a362fdac0f9b8d391ed106dae5daccf93443cd47c144d2a861c533b1d5265d6e",
        "wave_bytes": 1500,
        "wave_sha256": "446c4a91441dd2951fe3dfdf4a2d63c6e4ebb53470073c0dfd8d363ec588532c",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "4f8b094211df961fd425baa387b4cd9788118242058b99e7b547d713f9941492",
        "producer_bytes": 7320,
        "producer_sha256": "10a299d125710b2a91e62d3686d61bea00e5b881d94a1ed96850d96ed9d4523c",
        "wave_bytes": 1500,
        "wave_sha256": "f240c8ea0d67058baf71a2b85a8fbed1d2e8ce22f86f8d6c08c3e9db0bc71f9f",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "7da613fc62237f3287f211615786297eb733394219a5d91554708ec2a4e0c8f0",
        "producer_bytes": 7320,
        "producer_sha256": "c4a063d9ffa4d3dd57cf7963f6965834b3a907c018a0147a670570fcc42c8e39",
        "wave_bytes": 1500,
        "wave_sha256": "2f4e9c3a1d52bbde03dc9317e36c5e95959d9192e856d758713494d61e1db572",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "687aa17d87b6f07d50fc1710e6617bbe5bfe466f2aff80cf62038f05bfab05c3",
        "producer_bytes": 7320,
        "producer_sha256": "d8abac5f1dc9b8dcd9efc2a8f62f7596fcddfe45f582ec1efeed7c2a38785349",
        "wave_bytes": 1500,
        "wave_sha256": "77f4cfe8dd4e8da3009e5c6a9ae4675a748ad9282c646e7e20db65abf61d2099",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "5e120f14ec3cdd159ea8b860e5d309870e711cb00e1f3199bc1d4b8948f22fa1",
        "producer_bytes": 7305,
        "producer_sha256": "2e28dbf5c62d73aaab16fd55554f8570ad6d296b2520ce78c46c3a3b1019c738",
        "wave_bytes": 1490,
        "wave_sha256": "28007114829e892a3ad146242c5f34279bdd5ea4a8a05669cc3645e58f510084",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "c0a6ebf4b3b71b5f72c01026953bde9f3a28754919cc5be1058a236885cba006",
        "producer_bytes": 7320,
        "producer_sha256": "f5bd1a0a3cdd3fdaa1beb7ff3bfb49785de203529799d9b361ccc5dea5fb6996",
        "wave_bytes": 1500,
        "wave_sha256": "6a6cf85a11e6c3ffbfa3f83ce1b5fa4967f3a423eb030ad22ea76b6f307cb0f3",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "39ebf8bc4fdeb97e49f7a2277807f4b6e4e0bbd189e1372a19ac6e19b7ecd555",
        "producer_bytes": 7320,
        "producer_sha256": "95bc9184b2d4991496f0b1b8776bb22c0a08bcf38031689f4cd06de75584dc07",
        "wave_bytes": 1500,
        "wave_sha256": "ec67a33a0be4e5e9c74d562ac6ddbccacce1d4fcba80c4e72ea0d25952c9dbdf",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "964bfaa698811e80c46334711c469b4ccb9c1b7f1b22804040689820f4db670a",
        "producer_bytes": 7320,
        "producer_sha256": "aa3e3800a68342e10aa6b0089d489afaa84c87f6248829daa8fc0584171a9575",
        "wave_bytes": 1500,
        "wave_sha256": "9946b58c373ae3f77184b6b19dd67968d2c66279fd13b5e0ce71cf01fe3aaca2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "bc187fdca577e47b5aa14a1f7bf5401fe16c1de82642a01fffec23efe637d837",
        "producer_bytes": 7320,
        "producer_sha256": "336ea261383a4c7e23b9958b88ecabe82a2f13ed550478ed022ce1b7c010ec0b",
        "wave_bytes": 1500,
        "wave_sha256": "56455a37b9f2ab3bfe84f8849940f3f61e50a9bbee358195bbadd9399fd44a68",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "ef57bc03c86175d20e426d81b6e7f0a9c3a631b45e8707256493e66bd03cdd9f",
        "producer_bytes": 7305,
        "producer_sha256": "a70b016d061973522adb821732a046001aef34f50e0a7f826a09ee3081c9eb71",
        "wave_bytes": 1490,
        "wave_sha256": "85dbff66003e3b53745e3448fced6960cb6e5f7b08e4011be5d9e7ecef018e79",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "f37627b43740c450611efd74a07900b99d2f001c7f332dd9dbd5e486096fad44",
        "producer_bytes": 7320,
        "producer_sha256": "a5b027e7c0555a0d6acceebd557d23cbe1c3692084bd8e986f499b0688f23076",
        "wave_bytes": 1500,
        "wave_sha256": "681bd76c5d7fc04780a0b175f606515dd5f048e2e7676ee2df186d17cda25f8a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "040e8027a7655aa298630b7294cdf01c55bd5032f9ebcf64b886260786821495",
        "producer_bytes": 7320,
        "producer_sha256": "3d1e076929fec4204b0acf695dabc9dce49060591d6361832496fa389d9adc2f",
        "wave_bytes": 1500,
        "wave_sha256": "a2f0976bb487a5e23ef389589b39fb15bad58ba8b02d99878ef8970f6dbc8973",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "61a937d47f45a6dd0066bf3474e6c4e41261ad91ea666938e59c987d5e644fd9",
        "producer_bytes": 7320,
        "producer_sha256": "8571a8bbc02efed318d7d0f6c50baf8ea15330f7b4f9d0c677d635718aed85ce",
        "wave_bytes": 1500,
        "wave_sha256": "fc199c0ea58f936a6b401dc6490d58fd26d98058a983127629688d608b0f964d",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "5b2be26e7f6f5e39dca9aceedd2ff7a548615fb408b0ec26a37cd039070d7d40",
        "producer_bytes": 7320,
        "producer_sha256": "40ff7ff380f34424a9b664cadd30fd2144dcd5254da5546e6a7739fcd5ae1325",
        "wave_bytes": 1500,
        "wave_sha256": "f1af7af40754732097ff7eff193d28d983dc60cbcbf9385295575a7422fde3b3",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "fb850a769c3716513a2a2b0cfcb1582484cd9e6919f97c2561e244be640e6d33",
        "producer_bytes": 7320,
        "producer_sha256": "fe840c2025b642c3b57e8c5272d8d28c84680e2319dad6013fed1c6781c90694",
        "wave_bytes": 1500,
        "wave_sha256": "84bfe1193028251d0a58a10964b0e21e24bebb8893f8d0d89d719ee886ea36cb",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "71fa4572dd091451669ff110cbf1d4496517045a2f5294dea2f21c5fa706eeae",
        "producer_bytes": 7305,
        "producer_sha256": "89ab60b399ec3cee23f53edbefb455077794f54a5411723ed9dd66cdb3eef6f9",
        "wave_bytes": 1490,
        "wave_sha256": "69775f1d3f74a56276ea213e1e4e86d58196dca5d27f43b92b5220525e72f039",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "83f8db8bf1e184ce28d2673af2e3eaa5e9c9a2cd9c61e533fc60be9b98c3664a",
        "producer_bytes": 7320,
        "producer_sha256": "e7551e0f610c62dbd075c90df5cf4eb994ba82608a9cac8fd1f3995d4811b752",
        "wave_bytes": 1500,
        "wave_sha256": "13052a9910564a0c978ab3cb955e54abeedbd75c6d88501de16fe6cb21d72563",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "e90e6d0e1b901446c7b26b0aff5f38dc7d52110695af052222642ab2b51b92c4",
        "producer_bytes": 7320,
        "producer_sha256": "1303159792ebea8f47c09a75abecf61e686b8228531dbfa9de1c25a14f248570",
        "wave_bytes": 1500,
        "wave_sha256": "4c364093beaeec8ba52b670b5e3c34823db4531e4da27c4d7b3b3c79a8aed1ef",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "9d49ca27de284e20e12e52414d2c4b02377b395c11611fbb7cbd8cbe045ec431",
        "producer_bytes": 7320,
        "producer_sha256": "3c2cca70a4a59f2f55d987703b513737f0afedc044a77f7a63a75759287f5c58",
        "wave_bytes": 1500,
        "wave_sha256": "1bcf12a4f02da10b256f675cc13d988db3f543d6ef5a6bd505f6dd0b290f49f5",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "2c1153c00de02967970d6261652bef6401dac34da83563e8a409fc53091a9666",
        "producer_bytes": 7320,
        "producer_sha256": "52fac75637f4c5abd9a6d8401c0b53876461e406eae1ad9306b2f58d03d4c54d",
        "wave_bytes": 1500,
        "wave_sha256": "dcdc02fd8223917d9857d0ba3f795ec66d6ed24c28f574a89f73f2f934c02aa7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "96499e8d7e904878d814c5e2a2f9ba7fc26c003cddb2683b88575306cf82ec7a",
        "producer_bytes": 7320,
        "producer_sha256": "755bc00077067161fe56c28fd06a59821caefbbcb36ba0062c5bfbac775b2af3",
        "wave_bytes": 1500,
        "wave_sha256": "8b6e911ede57ccc6939f77b52db46d150b5a8b27d1916722998cdadbb09f9f04",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "1d6f7de1bc409e991bad3f3ef6db1274d8d70d3dee659bf37e98dc1950be5e93",
        "producer_bytes": 7305,
        "producer_sha256": "59e1843292cd83ad0a1a2e33c95ac1a8c2e0e7c17f90ccc26164708f7f028fcc",
        "wave_bytes": 1490,
        "wave_sha256": "6458b7cd4e4ef481a0077cf2508448f863dc9c13ad49bbc7ec5a2853c61ef55b",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "d54ecb5796755f40764f49d23d84de800dd42e1d209f3361e6128564f46d0e9e",
        "producer_bytes": 7320,
        "producer_sha256": "89d632256dad6cbf08dbbf0af9fb4abb694ab2bde88f6ea26e6bc4e870211419",
        "wave_bytes": 1500,
        "wave_sha256": "cd6db1a5cceeed7444b359b62dc42023535c385c8d4c3af2ae0ebcd17da37d85",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "d9e1606ca154901e104313064df5eb0b44a11083e8f3911e18939db1e607e1c0",
        "producer_bytes": 7320,
        "producer_sha256": "6ca8f7e31500e8063885e530c01254f1ceeb54f755473a7dee32e87efd635f9f",
        "wave_bytes": 1500,
        "wave_sha256": "835cd70005e906e92706a04e3a02698e039cc3a6b6a9a36249130f007b28e653",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "300ffaf2d61dbc13b4dfb2603384ae51e59eb7813e13170ba5aefc9e31b2071d",
        "producer_bytes": 7320,
        "producer_sha256": "4432f8e1a841e4ad58708a73ec251fe35c91f9c0bd8c4c6d8530b58c8d1ce04c",
        "wave_bytes": 1500,
        "wave_sha256": "bb9f3482cfc2c69b3029e2a810929cb1ce9e59bd9db0cf2ef58c8db15ada4cb1",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "a796147aa89e048a589060fbfe7ec22b305ab71955d44cf1ab3d0d816ab19a6e",
        "producer_bytes": 7320,
        "producer_sha256": "640f24b8e21c188f4c3e4bccddacb0d1c0da9106fe5cf53f14a6555fd0461bac",
        "wave_bytes": 1500,
        "wave_sha256": "fb937e02d8258377203b55f161f4de3f08370c4b9c29fbe2a9ba5ae6f3d7a102",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "97220627228a1fdbc3c9630358b4601958d369179ee520def0009797a06977d6",
        "producer_bytes": 7320,
        "producer_sha256": "0b2c0e966277d46b1c707d86f6785d7b8ce3b6454db5406fd4481eddadbc9765",
        "wave_bytes": 1500,
        "wave_sha256": "add0b708ce5d67effdef6a40fad49bef64c31f5446a6dbc0ef8fa95cfb690392",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "b6374258cc2ee5e632c106a02d22ee7704183326229f1913771764e442dc3aec",
        "producer_bytes": 7305,
        "producer_sha256": "f52184dcf603107279fb62df09da58bb0755a538cd7ceaa701f045b825ce1444",
        "wave_bytes": 1490,
        "wave_sha256": "bae0831401d47b7e07c9d0d1413010076457f91a2410bb388cd1f3ed145ed2de",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "ccceb19a3fe80253cd173c5971f683f8ca59f48d4d5e66dadf8b8831a1e1f5bb",
        "producer_bytes": 7320,
        "producer_sha256": "b5d8a352ded4fe835cee6127d100c4059b9ad048d0519a669b17ef35050a4887",
        "wave_bytes": 1500,
        "wave_sha256": "5b0fcaab1f57ec4b3f3abf00d9fdaa849518cca133bba834a81e5052d842650a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "fdea25e136544a97489c7d438d5594f458f103e0da2c0d7680c415064a625769",
        "producer_bytes": 7320,
        "producer_sha256": "254c6abb89b8bdc09a27f09e3617308a390c155a20a9241bfbd6925f8aaff341",
        "wave_bytes": 1500,
        "wave_sha256": "46103c862c0c344417cd9257c92fed4fe960e14db90a9a040fab6985d555680e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "2cc332d5730487c8b54dcde0e5ae83505e108b418abc104a5cb3c6fd14b652da",
        "producer_bytes": 7320,
        "producer_sha256": "1fcacbd81162fe3d2d2873182673c2b618c0004adc388cbb8c3d7e8d2aab9bd6",
        "wave_bytes": 1500,
        "wave_sha256": "2c0b24a28d2f17f62576c45881ff658f60bf899767eb8deae5e01972587ddffe",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "78b3b6cc6801bd4fba995fdc5ca7dc17ae94bf5e7d03450a8c7c86b06a8c53d0",
        "producer_bytes": 7320,
        "producer_sha256": "82369a46c76913261a371d8c36f62d68e2190207101387e6a447cd0b705254fa",
        "wave_bytes": 1500,
        "wave_sha256": "ad5a7e697a587e69f1950a9c57cf280cac9abfa2721b472585774f97bc5f81b0",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "b21dcf46ee62337eeb12e25bffd17cc105d054362c667b9aea335e4030e43be0",
        "producer_bytes": 7320,
        "producer_sha256": "666880a4a1d83bec9dc4041c70147879c50961b036d9c389290f1c18378ec11d",
        "wave_bytes": 1500,
        "wave_sha256": "09fbbc19225a039415c23256125bd32319b4104f40d30fa66f214d2cad3ff918",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-none": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "e503a4909a3e190cd8677af6c616fedfa4793df395fd6993e5f6e03a61616929",
        "producer_bytes": 7305,
        "producer_sha256": "e425f861c0f1a69534acd6dcb97f9a90e36cf2bada114d98ac9a2f453e2ea5a4",
        "wave_bytes": 1490,
        "wave_sha256": "407c5e5c2b4ed27a01038fa91a24a857e3eec6dff2fb8455a66d2d988a04ad6c",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-06": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "58b03ea99313286bcb0533fef437f03f8160ad417efaf5412168dc6fadcba39b",
        "producer_bytes": 7320,
        "producer_sha256": "e46aa8de4e66243320be13d4f3eb0e0cde77fd539db96a9d4842e7569602f2ea",
        "wave_bytes": 1500,
        "wave_sha256": "a479687fef2d1727c50bd2f996d1d9039a02f711d0dba5c3e8ba2faf54405e24",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-07": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "b4ac68775d2dc0627de3142f934dfbdd4796fa53ab837a8b5f5fd2fe30e0b4c6",
        "producer_bytes": 7320,
        "producer_sha256": "f114e57cf13b6dc9c5dcd534f88d0e8edd119831043bbc6fef16df3fe4646f15",
        "wave_bytes": 1500,
        "wave_sha256": "e69b67d708e14c13616f1ba6c475363c73dd914e09a9ed6cb3df17f9a95286d9",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-08": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "c84fbd06e74b194baf0da89e51321e904cf6cedf23586d336c4d81b424d6188e",
        "producer_bytes": 7320,
        "producer_sha256": "6f5f0139e6e4671bc8f7ab09cbc54be6f64143fa2f6bc53f05361014424bb2d6",
        "wave_bytes": 1500,
        "wave_sha256": "1549716c0c5d2e694d80b854ee1e2d9e814ffbf65478250731d0697b74650a74",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-09": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "121b93e6134217b9202732e68aa8ab0d79dc7e4de51fd8cf5fcb6dd9464d835e",
        "producer_bytes": 7320,
        "producer_sha256": "0fe2259282a8db1561a28fa1f95ff61b05db72871f26f3e71e2fc628b626c207",
        "wave_bytes": 1500,
        "wave_sha256": "e5f5a77f9e1b0f3abe902aa9bde061b356a725a75a348c556650abea6a20000d",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-10": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "ec4af49ec6a2aee75c06c6490c4e01fdb0d2222ee18c0f33899d9d80309fb053",
        "producer_bytes": 7320,
        "producer_sha256": "fdf50cc21fd9ec2609c63d154a58bc6e2122f0b16642d312d4f1a9af13cd9a27",
        "wave_bytes": 1500,
        "wave_sha256": "032312f5ad23cf8772ef3a2b1d0a76fa4c37eda11b2d2315e0b58ceba8502b9a",
    },
}
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275775,
        "cnf_sha256": "f15a39ee8a7a410d99c764b87c2d4e751331e04e33f74b3e00ae6cdfb06172fb",
        "identity_hash": "1aa67415177f10ba0a0be824c14487aa8508843486524d19a32c64ebf6601489",
        "producer_bytes": 7412,
        "producer_sha256": "7a70097021672b9e120ac6d464427336bfb37a6b0065aa071da59b68756532d2",
        "wave_bytes": 1487,
        "wave_sha256": "c6abba023496145d40388b804ba85b8899ba7b607d010c3e56d1429a0e4b0ac8",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "454e4e2b44d3bb8066e9801fc1a353770a6a9f6b1e705f49f81245b731b7d033",
        "identity_hash": "0b47dde95db21b7d37fa72d14f8a1b74cf97f59346c9a0f8f20dae91bd30f924",
        "producer_bytes": 7427,
        "producer_sha256": "ff5cc02b266cc6ab6c3d953596027ba046db8431d19c8451bb3e8ae064aa8489",
        "wave_bytes": 1497,
        "wave_sha256": "d563e01ea38027999de8d7c6ae9e6d846725beaac6b06b1efc8319878f6698f6",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "900fe584a721d0b25f3537e43ddf53bbfc27d4afef381cf60e7574ddb64a54e2",
        "identity_hash": "d041c38533b72d7280271a26106013dbf6226368e9b82f82711702c9e7bc3458",
        "producer_bytes": 7427,
        "producer_sha256": "c6e13332d6cf297d336fffe0ac6e4c11ab8c1d2cb43191fcd3ec1fa31c80c7a4",
        "wave_bytes": 1497,
        "wave_sha256": "ee97da5b87f8949be4d3b097e40a1f60cdbefe1e6729e704aae1667f3b6a64d2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "e27b949ca73d8bbc1585fa31326d6368b40db4cd99e12f32d049b9118a99a45a",
        "identity_hash": "efa39d48c4a58582579cc43d0971fdb3561a6c02802d68d6d4632af2421203e6",
        "producer_bytes": 7427,
        "producer_sha256": "602144a7e64d778b9b6c6391a9ad8b5e465de7f8bb6eb97491e984722d8d36e0",
        "wave_bytes": 1497,
        "wave_sha256": "3a072733650d57a9db54e9aae0f29d07af9b38ae3ee0107022de05ae49459276",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "56b380f869f2a6d992172a592932e801ca4574293246a0495de595f834d741eb",
        "identity_hash": "253b631e3bd87a1a13385863f8992c3cdddf6b1f65025f2b438347409576883e",
        "producer_bytes": 7427,
        "producer_sha256": "78f6adb4ec95de3c1a69ceb559cb5ed0debfc4e12b3480c4f994f404ff3a3e52",
        "wave_bytes": 1497,
        "wave_sha256": "49873af7ce33a872132e7dd19b055db1f08c884a6cac0cd438cd3d8b59b55d96",
    },
    "canary-perp-bisector-survivor-refinements-next-center-00-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275774,
        "cnf_sha256": "37c46d128e1c072c531298f50d89f48b018649eb774e52caa869265fd1984b8b",
        "identity_hash": "7bb71312cd635684754a951e5a27fe25a3cd4bcb939552e672cef104d6b51645",
        "producer_bytes": 7427,
        "producer_sha256": "cd5c485f51fb8d135967816f42eef1ccde2956b587b7fc5eca70663330f800c2",
        "wave_bytes": 1497,
        "wave_sha256": "a936a225e77e10785ea652d1e0bec6e87e01b26daf5c369ef0858b271412dd15",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "279423dcd3adf551830420bc364edaa39aeedc35e79a3febf92c4fedd5d36811",
        "identity_hash": "fee949e75f5463444c359db8fd7a9ed54eadfa4b73587f7aa3f4b340214dbe43",
        "producer_bytes": 7412,
        "producer_sha256": "e154939f54b319ea7feac9e9ac85eb36ada951cbc86b24ea3217797750a6a981",
        "wave_bytes": 1487,
        "wave_sha256": "435ad81865dc0d1e13f5fea0dc7e9756922360deb817f7c8ef1519e3c176771a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "d697007953c100b171d2354e69a00cb81598a262a29dc91c12e51555ae14c505",
        "identity_hash": "27d68ba34db928e66be18dd74573b34d6a65552ee8b2b77d92e554c5de1928eb",
        "producer_bytes": 7427,
        "producer_sha256": "ad374af2280d97399445250e8e64fdd307c3b2cb32afba9ee448a86203040559",
        "wave_bytes": 1497,
        "wave_sha256": "99d45f8e3212a525b240ced410e0ccf080ebce1d726847d94a10b136a58d1f32",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "6d88bde703b3103266d6b9b883f8d86a3fc3ef1716074384a617901c204a7c34",
        "identity_hash": "ac0684e63e2e1bc2629680312df5f09f6f1cd67d0a519ff147f1693095fd3594",
        "producer_bytes": 7427,
        "producer_sha256": "37cb1ee6e21be6769c00151f307ac3adb1e1b73db79424bf621f445eff37a66d",
        "wave_bytes": 1497,
        "wave_sha256": "945ab1987a21332e7a4596bde81a18d31a8ad947ddd3287685ab9e41a6f8ae59",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "2096b8ba2a2e4747da1bb9ecde2c31c80ebe25fcdb23e5eb51d3393f2b4690fb",
        "identity_hash": "ebcbd7964ee394a0b123cc88ce82d5d115ec77ff2f7f447d81b656f589542f0f",
        "producer_bytes": 7427,
        "producer_sha256": "a3e018cda787b4a9777a24e7385a516d40b3e4bc9b56257d0e6ca1005fa18345",
        "wave_bytes": 1497,
        "wave_sha256": "1598112f5cbfa50375f6e5490ae7033c77a8b9038c2e67e339fcc8adf9800f7b",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "74965d8d553d8d7dcd79eb311f9a5361ecb755cd6d513eb0dd9a5f17c4cdfbcf",
        "identity_hash": "c323c8be591c571f3f3df57d3e5fc3473271c8b7ecb0c86758aa8cee7556213c",
        "producer_bytes": 7427,
        "producer_sha256": "7c121f80c6323555f613b9a7a0568d1df2bbdc36394814b1a04072a83e7ac382",
        "wave_bytes": 1498,
        "wave_sha256": "278a73ab8f47de388beae5fe624225d59c36c524a27e39202ee636d8154ebd95",
    },
    "canary-perp-bisector-survivor-refinements-next-center-01-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "fbfead9643577fa227b13d5af7c683cd4cf5b7129c379cb11005ee7bb0a529ce",
        "identity_hash": "df66b8eb515d74273d64b9bd6dc9c5dd823606c2ec5f0925f5cb05da0366a5b9",
        "producer_bytes": 7427,
        "producer_sha256": "62678a7967bd560e2d493f94b14132b046655acfb618772ad55800804afa4177",
        "wave_bytes": 1498,
        "wave_sha256": "410f08802d835748888dd2bf7f8f52b2eb5ce63653fa07a0730392b3b1027e26",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "2b001bc92e09577c9c3e7e7267e404bbd8b16face7f45ba5ee6518caa634b955",
        "identity_hash": "cb8c878ce2f35facc9ac352fa026667a538e80b885bae1e557d5bccf5e2b5b2b",
        "producer_bytes": 7412,
        "producer_sha256": "e71b88df5635bb6f33f02ebe365092be3cb7f83139614f79b7308df341b1f636",
        "wave_bytes": 1488,
        "wave_sha256": "5332fd158ca6951bf1f8de8dabe289df68601d677c0dfb724cc4663f3323cc2d",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a782718cf97f247417ba9a89017f7123ff7f3a9987ad38293813647c2fa46a27",
        "identity_hash": "1522d3abd5a714dfd5021ef1f9b299d3f806ceef11761f9f36eb59285eb061cf",
        "producer_bytes": 7427,
        "producer_sha256": "0a02d1ea55dfb474dda10c74063284fc917b5282e8265001c83e8f7e11d2b7b4",
        "wave_bytes": 1498,
        "wave_sha256": "3cff69ef00bb16a4b969d5c1c293f736dc613ba30ca20082efa2ed44fa230b45",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "8e58761692b284de8ad01c71938fc287e110d9e6dfc8b1de37d87fef3905afd9",
        "identity_hash": "5c013c38ee54b38d0293029dd92e4928f5bf7d3663eb3dd7c3841b7e9891e554",
        "producer_bytes": 7427,
        "producer_sha256": "8b06eb069e2e69acd0bbac8aab80837c34429c387aab5c9fac1cf36a4a2350fa",
        "wave_bytes": 1498,
        "wave_sha256": "732a3addb01b134c90192712e97f73fff34dd81eda80929298355e6314e06ee9",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ca99854f7d27ab4530074e7349a9b426c4885ae34df346151ad36d97a819b4f1",
        "identity_hash": "c9e4e2a3cfaa56ffdb873d4aeec153d8991400b8b66c859a531a707dbd29200d",
        "producer_bytes": 7427,
        "producer_sha256": "d015bd8c5a91c2319d3ccc74b655dba2941d11f45377ae4f02fd97011d09dc11",
        "wave_bytes": 1498,
        "wave_sha256": "2ec04ff6f4084ddf0e5f2009e05a27181acfe4c7bc4a1df78cc978d1470c6738",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e73efe5ed035d320e5b00c131a23d03ba421a6bcc8b1f10a98bac6d3fa9a3a84",
        "identity_hash": "9299c517b086234cfba55169fd30154d0802a23451ee9b8219a59f8e62f61809",
        "producer_bytes": 7427,
        "producer_sha256": "38072d1505084dc78360695873245fdb9568f22812f617f8d848256e10077169",
        "wave_bytes": 1498,
        "wave_sha256": "db3986f82f8faccadff86b84b41dba2ccb14ffc624799c74f7e01a6cefa336d9",
    },
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "042c0627c1f7a1fbf0a18ea5682352fbbb47dc4958a517f2e333f4f7fe4102e6",
        "identity_hash": "86d140d898abe408cc5ae187561ff7fc5dc4484ec815271904278302d4ccfc39",
        "producer_bytes": 7427,
        "producer_sha256": "fbf2e4403f0079f8d489672b3fe2bb49aaf8059b18f9eedca31e6c24e60e4afa",
        "wave_bytes": 1498,
        "wave_sha256": "ef71da7486fae5fae6209dc4d03159b8e3952a49cfcf8caf37628c2742c1fce0",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "480e2bcfbf9217c67daf6635ff3d5ffd03160688a4615bb83259469ea4589728",
        "identity_hash": "253d16e16503424dbb4f76fd6b2c6d2348b275d96b8b393c7b572bf36ffc8a9d",
        "producer_bytes": 7412,
        "producer_sha256": "3387df91f144b6f6a007eadf636371c05f52f7de29e6995fefd0c001abfb8f6a",
        "wave_bytes": 1488,
        "wave_sha256": "24947aac5a28d7c66fbeb04127d9932b918961bdff15965078c7a5a3c5b7a7cf",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "147204d3819d5866b67080edcab143fc0f84c128c74baf49fc1f71a1ca13e787",
        "identity_hash": "9cd6068a5ca7c3c916858ba504120586d26939dab78fe1c340b1d3a4029dd2e3",
        "producer_bytes": 7427,
        "producer_sha256": "17b6b89b03f5792de4168e0f914c6a4eb8369d71c590d4820cef2abbabe56925",
        "wave_bytes": 1498,
        "wave_sha256": "927fdaf959462f2792b3abc046d39142f2cfd31b9cfce2d4589951b36cca53d0",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ecf4cf39a33a3ce10946b6807a0761b7c095549d29fe31e9524ae91c4828143c",
        "identity_hash": "f943ffa27180d18f4460d499eb376fba4ad5089e4befcd9dbc2721baf7c8d20d",
        "producer_bytes": 7427,
        "producer_sha256": "918c23a93c38f72f729fb2f696e6d4327a7574e46e6c3967503803b2e846236d",
        "wave_bytes": 1498,
        "wave_sha256": "a9fcdda2c9341498ac38e9c1617f37749004e16b1eb663aaf3ffcc36c8952b35",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a8948495e57eb9616f2e5252460944ad6c785424c8b63778f768feb9eacc065c",
        "identity_hash": "96510298188e16319061559e0bc9803bc5a24662ec873950f978680c32476dee",
        "producer_bytes": 7427,
        "producer_sha256": "b1103bc293924dec33dcb09b51bd0f9e55a8b08ba5c6c41bbdf4b7beeef90164",
        "wave_bytes": 1498,
        "wave_sha256": "9d243d6757bc3957632533934b806dec8cf564ccf4037bd8d1c7fc6ad6d26fd3",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "bea5a56195b0cdfdf002ee866a62ae32ef2b2229e874e923b168b2419004af33",
        "identity_hash": "3f147c55166e0dfbda5d24276132535214076f0033f90dd40e1e1ed6fe667f5d",
        "producer_bytes": 7427,
        "producer_sha256": "deadbb6969cc926b7317ee5a903134b6337bdce34e8acd0ac0db8cf0132abb8b",
        "wave_bytes": 1498,
        "wave_sha256": "00d72e3c078ddac8581ec9d88639288be319e78c7d13871b6073d4ca3f2db266",
    },
    "canary-perp-bisector-survivor-refinements-next-center-03-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e0bd0c63ae7bc1056fbcc831532e20a2c5ac35cdf015d9f9909efe14d62453bc",
        "identity_hash": "b0030af381aa0980e0c6fe6e8e8c32391c9c49c2132625c0cf5746559bd8b875",
        "producer_bytes": 7427,
        "producer_sha256": "a4db078883d8ccbc25d914c25a2f81580e1e2a3cdea2bbaffa827ea1e301f3db",
        "wave_bytes": 1498,
        "wave_sha256": "b38c01dfe1757cc305c0c7d91ca94c11bb62493ed64f4f42b6d1dacd8599beb8",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "9b17836f6f4c1b38e47112839509d3ab37a468f4410abe9418cf9bc495505443",
        "identity_hash": "6dd76b109e1d1098804fc6abcb2e42890ff66f7421cef84c6e4c3e4ad74ff783",
        "producer_bytes": 7412,
        "producer_sha256": "2154505dac91149af6987b114188cfe72675bd2dbf9b70d06e6ac43067fdf6a5",
        "wave_bytes": 1488,
        "wave_sha256": "442b666a35d00d058efaa5c1d0fba6f1f8d6b0bce99164e44a3f38d28253e58e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "6a7182357d9349b7d2e541eb9beef5900816dd6eaf5192d4b45aea064c63fa96",
        "identity_hash": "40ad2561f20e0e5f41fc69e4e769ff18af34c2731760cec080296ed840699374",
        "producer_bytes": 7427,
        "producer_sha256": "59e4485389f6018ed9bfa651a6f4de40ec44582a20b543dcb87bb754fcf4d366",
        "wave_bytes": 1498,
        "wave_sha256": "bc6e322f70d3885baf32006327513bba97ba9900fe397cc502c521c168e39fc9",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "eb5e88233deefba8b6dd1bc5d6faef25809002b60856a1078729e9578d896020",
        "identity_hash": "cfe9f39b4993cdd6a397c537cf892f3a6d1f25247b363f2c298ed8a9ce7bc2c8",
        "producer_bytes": 7427,
        "producer_sha256": "616edff8cd770ce08f2d6e673803c694293d6c7de3ea9a73c552b26427e42fe7",
        "wave_bytes": 1498,
        "wave_sha256": "5b494916f458d8bbe08bc302a7929caa5b711ae93542965d63b9ed41f7490605",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "e47e520ce648457670734dc512b51236bbc0f01d6a17cc7b34b1528e37370faa",
        "identity_hash": "1c3b74e8f38e835a4ca1ccd7d8fce047c75a557329321462e649b46c4f44cf14",
        "producer_bytes": 7427,
        "producer_sha256": "c66af31459eb81c533b2ff34512ba153433d746ee56a238e7f5a307e28cffa88",
        "wave_bytes": 1498,
        "wave_sha256": "186771478b78a402f80704275e6121fa06887fbaa9d8ed1626104acee78b1c13",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ae5ac1b1fdc53627554cbd6424bab026365448dced9b5b3e6a19effe01ecc9af",
        "identity_hash": "aa51509c2eecb8d8fd84f3e91f01951267747e1605eb8ec43659bcf5ef8ea189",
        "producer_bytes": 7427,
        "producer_sha256": "b8ad3e2a06a19cf1698cfb1bb88940ce78b8880efcf17ee240e37b013b66276e",
        "wave_bytes": 1498,
        "wave_sha256": "afcc2934033c1d19b47550298e74d92b5f412e275e3c396ca3a6f8275d3e7ff7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-04-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "70521f8a225a3920f6d95d79e7f7527b333255e4325c78b5150be0d5ffac8667",
        "identity_hash": "350b2a5ea0b7e85930b3bcc6d7c1de999f316ae7a8cb717e1b31144bea20875b",
        "producer_bytes": 7427,
        "producer_sha256": "ef67c2437804de4504eb54a9b156b3e20dead65d4bf6d23726bf31df35826089",
        "wave_bytes": 1498,
        "wave_sha256": "d837a603f4a66373f554faeb60a5cbad1f6ad41329067236947ff48647861d5a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275778,
        "cnf_sha256": "c1e7d2d0ecb867a788542d076b46c139481163b81e2056e1dbf3aea9b2deb2b8",
        "identity_hash": "5251e5a8c3a89c694685b21f5f2f31be05a536f09a95a1a3b820a396c84ad0a0",
        "producer_bytes": 7412,
        "producer_sha256": "d11ebf650df2d5da921a25ea55b05d1a6c134e4a7b2ccb8f9fb39ca09668094c",
        "wave_bytes": 1488,
        "wave_sha256": "2957f61b87c732e7a4d7c6f046a72bbaac0bcdb0400ef670a7b68b8a4869c3fa",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "ade2107a1d3d70100e48cfd8258abe8f601ae1534e5285eeeed61030c29b74b2",
        "identity_hash": "39bc1f896bedb45d7a5b72b87013521419d5380fe1035fa77015b98a40846cd6",
        "producer_bytes": 7427,
        "producer_sha256": "248a7a47b2e28c70c4c8ff56b146389ad3352b96257296abf60989aebb8abea2",
        "wave_bytes": 1498,
        "wave_sha256": "4a6973fffadde744a74cea4b39aa29194a0e76c3509824207ee09d263e05b610",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "bb014949157127fe8890bfcc39b6d815d5a8eb4871aa1fa196fc4dc0b62303d7",
        "identity_hash": "2aa382488217a5011326cd02f79f331a0bce2ae8a21c6c793ab9d50e261c5919",
        "producer_bytes": 7427,
        "producer_sha256": "cd4b1cacb5d5c3569406e7c0e8cac77e0fab4c1dcf0a68ae438f44b548022e8f",
        "wave_bytes": 1498,
        "wave_sha256": "31c366bc9510af35d85140c42ded76f3f064466a6c6a932f5426db7e3e094e23",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "a1e15f51342a186427ce29ca4475cdb660fb72c36d7322dd71dc9269d6fa1a28",
        "identity_hash": "807ae4205ff2907d72d1a536eee6e6945bd50b57a3d618ca5a4aaa7b6a71bfdc",
        "producer_bytes": 7427,
        "producer_sha256": "9e376514b308b2180e7fb4c86c63e159dc69c42880454bd93493647fa4e00cd8",
        "wave_bytes": 1498,
        "wave_sha256": "d37755ef6a19ad4164c069577bc5b60e52ab77ae19add40abae28912167bf660",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "65c275d259bb5ca5984f2506f14d9f5f9b9487931572744e959ec4e8ebe45223",
        "identity_hash": "1817bcdcee66f488f3cb412f26404252c6aa9e6c84437f24f56360ae155ca79e",
        "producer_bytes": 7427,
        "producer_sha256": "fc7671e8f37ec22705e9a33ae26b1e354889cf4e1a5be45a8d551e816a7d25f1",
        "wave_bytes": 1498,
        "wave_sha256": "1722a581aac97d1a5d5300facdbe5ec1a7561615cc535d315ff7985e65fe01a6",
    },
    "canary-perp-bisector-survivor-refinements-next-center-05-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275777,
        "cnf_sha256": "83ac420913d5af6b7cdde357cd92bc01acd371d52b6baf4aa5dd2b61c56e10c7",
        "identity_hash": "dc6907b85a04093fa0a95764d4f5a665469f0717764fe5e45e2a27c101cf10e8",
        "producer_bytes": 7427,
        "producer_sha256": "90d5e42819c0a6b73069983571ae6edd211a9fb415e10a6f83c7c6278132ed39",
        "wave_bytes": 1498,
        "wave_sha256": "e4c75b3c3907c0f3d20c537564cbcc5515ec3e39c2b5023e6e2584fb50d4196e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "a4c2545aca06478e4b0c397f43ec6aa7caef2bbcadf5b2c8d95409be1fbad1f7",
        "identity_hash": "3156fab300dfbbd8bc33e2b97a7040ce0e5fc1e0ae7afccedd881b5a097c4cc8",
        "producer_bytes": 7412,
        "producer_sha256": "70646a473484130a81fff45759eae50d515a1af4c746f8ae504a7b37ce5e4a4b",
        "wave_bytes": 1488,
        "wave_sha256": "f320a2da52de42c61468ad0f7794bece3daca1d201833d8660201504ebeb1a76",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "42b5de153af7732774607274bbbae85d366a569e43e148402773ccfee9e8d2c2",
        "identity_hash": "5b82a54764102d65a88bad4ac53215597c8b6abfbdcfdfe7fa3941f8499e5c8c",
        "producer_bytes": 7427,
        "producer_sha256": "0d20e6f4e0beffa5dab0312fe3b6e36d4e2cb5817a98a7b33271c96db38398c0",
        "wave_bytes": 1498,
        "wave_sha256": "a7ce8fc802ff78792105802cf6ff74877d3b33e55d2e170ad2ad171f5da4fb50",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "4f8b094211df961fd425baa387b4cd9788118242058b99e7b547d713f9941492",
        "identity_hash": "5f9ed14cf94072810d204636be02949453f642198a85a76e295757a362c994aa",
        "producer_bytes": 7427,
        "producer_sha256": "7430952d73045f31cc4067c31069dddc66fa7c4519431dfeaeff94aba16fc968",
        "wave_bytes": 1498,
        "wave_sha256": "5d778c307066cc2bf2533e872cbfbcfda47a835763f9bbdc4b27ca71c548bda2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "7da613fc62237f3287f211615786297eb733394219a5d91554708ec2a4e0c8f0",
        "identity_hash": "54e548caac90a8b81d6273c65009b9702272e064cf9a8a6bf9c16ea089634b65",
        "producer_bytes": 7427,
        "producer_sha256": "cbf7f419996b78c8d287434e0ef938ca88a31adc5675844ec3e2b1ab0801a82c",
        "wave_bytes": 1498,
        "wave_sha256": "1d3e19d07170487b664a2f4b13c78328242bf5979fa45f2ff0174c071c434eb8",
    },
    "canary-perp-bisector-survivor-refinements-next-center-06-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "687aa17d87b6f07d50fc1710e6617bbe5bfe466f2aff80cf62038f05bfab05c3",
        "identity_hash": "e982512db8f380d0808a60ec8a95afc671c6a81d30f6472050cf9c0938011074",
        "producer_bytes": 7427,
        "producer_sha256": "2b5c1a56a3978285bd59d156948a2a42bc9e6c9d18c6fc1660e19e81f18bdd09",
        "wave_bytes": 1498,
        "wave_sha256": "02f075cf04fb7a346782a02ac11fdc4ee4c5464cbf4ad813beec134207b037f7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "5e120f14ec3cdd159ea8b860e5d309870e711cb00e1f3199bc1d4b8948f22fa1",
        "identity_hash": "f7c5367e86eaa8306150fd1682491418bcf776e5f228c1b80d67cb8dfb97ceb3",
        "producer_bytes": 7412,
        "producer_sha256": "0cc1794a9e9a316f32148f120a1b8c9428b4f1c6ce2fedd8563a591daf339029",
        "wave_bytes": 1488,
        "wave_sha256": "6885e132da3d2428b448bd9bfa11f7e0ebbda110297c671535043e5f09499364",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "c0a6ebf4b3b71b5f72c01026953bde9f3a28754919cc5be1058a236885cba006",
        "identity_hash": "9e107fd1ee7a8a0575509a6324014a63df307b0448182efc7cc5e74d66d3ed34",
        "producer_bytes": 7427,
        "producer_sha256": "33a386559558beb4f4365e4965af419411018865f1916fd5ab26ba8e327f4dde",
        "wave_bytes": 1498,
        "wave_sha256": "e74eef54bd1f7f5c102d7706142de6b45a45d54eb442a706905e3de1e0298b77",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "39ebf8bc4fdeb97e49f7a2277807f4b6e4e0bbd189e1372a19ac6e19b7ecd555",
        "identity_hash": "47b35757dbf0f3c83fb7ff20b55d0f16af9b36dc65f03a686c508883a574d7c8",
        "producer_bytes": 7427,
        "producer_sha256": "4884a484ac12f151c0376856831c8d5ff6ce4909c2dd83bfa00cad8f6c9c6933",
        "wave_bytes": 1498,
        "wave_sha256": "d1016fa4e4aeb01329bed4da137fac97904f56fee427199ac01c3d219dfab3bc",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "964bfaa698811e80c46334711c469b4ccb9c1b7f1b22804040689820f4db670a",
        "identity_hash": "fe5d8613449534d4e87eba359af58d926d092992d25b125499e22532a733d471",
        "producer_bytes": 7427,
        "producer_sha256": "b5c45247c1bf0b55f0bdf8ea44f5648f87f5c6dd120145e1c3b67025eb1528ab",
        "wave_bytes": 1498,
        "wave_sha256": "97eb9995b9558beeac9407aaf4ba9190adc70151747094e8845d0e408e5134ff",
    },
    "canary-perp-bisector-survivor-refinements-next-center-07-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "bc187fdca577e47b5aa14a1f7bf5401fe16c1de82642a01fffec23efe637d837",
        "identity_hash": "0ce9b972f05f55591b6825166df1fc9e6c0fe26e69a0cf79f45f555b12895a84",
        "producer_bytes": 7427,
        "producer_sha256": "3e4d3515fa78d39b06a9c4594148d58d2cd1d9d16d6eca55a8c0bb5bd4c96bcd",
        "wave_bytes": 1498,
        "wave_sha256": "40d1cfd8a28c6c4125efafa46b51a8650aa18b92b4e9ea0805661222681e87bc",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "ef57bc03c86175d20e426d81b6e7f0a9c3a631b45e8707256493e66bd03cdd9f",
        "identity_hash": "35955efaafb8ec401296623349111160258c3a417c4b40cfc8cd123373c05e4e",
        "producer_bytes": 7412,
        "producer_sha256": "209240fff1be5e7c252d14b1d23387b52500d8f5a3c280d71a329855683c2665",
        "wave_bytes": 1488,
        "wave_sha256": "4835415c632f4abe52e0d159008e5850c22415d2c2c34c5d23666e6763fea45e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "f37627b43740c450611efd74a07900b99d2f001c7f332dd9dbd5e486096fad44",
        "identity_hash": "e4dd06b417f862d916043a9c6dce669beaf5968d101f81e578a8b17ccd4db01e",
        "producer_bytes": 7427,
        "producer_sha256": "a72a606029aa06575812d6d9a4d221e864315f645239884ec92d2333e7cafdd9",
        "wave_bytes": 1498,
        "wave_sha256": "cd22f32b84f8cef2d85c09c787faf9536ccc764f43b7f08f407eb596140be753",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "040e8027a7655aa298630b7294cdf01c55bd5032f9ebcf64b886260786821495",
        "identity_hash": "314c6c9dcc65357c73f9243d22a1d272a80a874cddde95a4e5eb3ef843d65c29",
        "producer_bytes": 7427,
        "producer_sha256": "c90266497519bdfbb773cc803890514d83fb2c31246eaa2d22b39a7aeb278671",
        "wave_bytes": 1498,
        "wave_sha256": "b25d7cd965bb989102ab8fb972547d1444f76a530655bdc2a3b1d99981f85fa3",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "61a937d47f45a6dd0066bf3474e6c4e41261ad91ea666938e59c987d5e644fd9",
        "identity_hash": "0fd9297367d1441c4ba831b03fabbcc2fabac37a43ca6a3c4ab54911e6e53fc0",
        "producer_bytes": 7427,
        "producer_sha256": "ac86c3d0c5f31a6c170a61121fea86e5bfe29f9db676f3abd0a7217cd4f22a53",
        "wave_bytes": 1498,
        "wave_sha256": "77cfad08d714bd85c45a77f6fc146d501632dda257cbcff10ebea3c98117de28",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "5b2be26e7f6f5e39dca9aceedd2ff7a548615fb408b0ec26a37cd039070d7d40",
        "identity_hash": "27a6aa1543d7080c2d69f0224bacb8f6d376e7f4beef46a1034e12fa18c4983c",
        "producer_bytes": 7427,
        "producer_sha256": "94633cfa533eae6f7d35ea679857715225159dd9344c2ccb1b9ccba993d841c6",
        "wave_bytes": 1498,
        "wave_sha256": "bc2a40f62e54c8d244dadcd9e448b692fabc5afaf15133d777aa139a28013e94",
    },
    "canary-perp-bisector-survivor-refinements-next-center-12-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "fb850a769c3716513a2a2b0cfcb1582484cd9e6919f97c2561e244be640e6d33",
        "identity_hash": "609408408299944ab2315dcb6c4edd2adab5d0649dfa19366b0bee4a4effba01",
        "producer_bytes": 7427,
        "producer_sha256": "1067a7eac8c7ef7ba2d6dd3dd6bfc8b2d226e1de14db3eaaef7299ccca4e0cd5",
        "wave_bytes": 1498,
        "wave_sha256": "66e3701101fa470c1211e4ccedc135078586bdee3d90696da22fadf12ce93a1a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "71fa4572dd091451669ff110cbf1d4496517045a2f5294dea2f21c5fa706eeae",
        "identity_hash": "91121fbe5c4d4c414b10f5476315ab2f6377f4aa5aa99bd52cc3b676e1a56812",
        "producer_bytes": 7412,
        "producer_sha256": "ca7c6a060101b1378382d33374bcf236cf45910f872b834e51a8cd4f8eca068b",
        "wave_bytes": 1488,
        "wave_sha256": "f8c4b94c92836a4b846e7d3cedc8c1f39ff9c62d79bbd4d355c06a0e8dd06648",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "83f8db8bf1e184ce28d2673af2e3eaa5e9c9a2cd9c61e533fc60be9b98c3664a",
        "identity_hash": "5248a0cf45b3e1850ecbea63cd7d8d5bc3f532fc71f11ba2b9de3a30e4eef190",
        "producer_bytes": 7427,
        "producer_sha256": "fbcb63ceb603ffd1781022d7a5dd18be8e7c93c141ef03343bd41d6f0e7d1c3e",
        "wave_bytes": 1498,
        "wave_sha256": "2cb2cd04f8f77d904e8cc28ab6dd45707073ab2b1a741f5c0557adf22324a83e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "e90e6d0e1b901446c7b26b0aff5f38dc7d52110695af052222642ab2b51b92c4",
        "identity_hash": "ad7893d0c83b101a8a9bf2333ab957c6996521a46ef4d35e7383cab67a183dce",
        "producer_bytes": 7427,
        "producer_sha256": "3c56c4d08c1c3e11348b549eb3a83d33b4b60e6d9d3238f1764bd6a77236459f",
        "wave_bytes": 1498,
        "wave_sha256": "74d86c3550d219990ae74ed29e3068b24cbd386be009ed7d4cd71e379c7eb2a1",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "9d49ca27de284e20e12e52414d2c4b02377b395c11611fbb7cbd8cbe045ec431",
        "identity_hash": "94a8bc4613e1e7a773a6e16d667b7d33fd8300757fa605752ec0a2ef3c9d76d0",
        "producer_bytes": 7427,
        "producer_sha256": "c82e73908d59cb5ffdf326b0cc9d85795bdcdd0149b188a1da6b909d5e6e84e6",
        "wave_bytes": 1498,
        "wave_sha256": "2dfa4ead4299768e864f63f723f9bfd1af13756a24cc14081698db1ef97c6152",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "2c1153c00de02967970d6261652bef6401dac34da83563e8a409fc53091a9666",
        "identity_hash": "ea56e8cb9661bc2f9f25dd3ddb980d2676b7adb8d54a08cd66eee133af4fc7ed",
        "producer_bytes": 7427,
        "producer_sha256": "ed088e95e81a25848f95257fc86816fc5c8e25cfd1843d7257beb45bb8241bc0",
        "wave_bytes": 1498,
        "wave_sha256": "12950600faba928ba7ce59c1359ce8cfd626705a797c0c63657084273975edc6",
    },
    "canary-perp-bisector-survivor-refinements-next-center-13-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "96499e8d7e904878d814c5e2a2f9ba7fc26c003cddb2683b88575306cf82ec7a",
        "identity_hash": "d50db63f5fa591ad0f5afbd9c545d23cc225a36ada3a2ea0d956251672ae88c6",
        "producer_bytes": 7427,
        "producer_sha256": "38c9b0d9aadb9f78cc2de773ca7eb6506ae0b68725ab8341dc190dad2dded5ab",
        "wave_bytes": 1498,
        "wave_sha256": "a7f9349ce669cd6f464ddb3c05f014aa27030677f2099f34c08ba00fbe7b9843",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "1d6f7de1bc409e991bad3f3ef6db1274d8d70d3dee659bf37e98dc1950be5e93",
        "identity_hash": "ed85f509a5658cfe1937ffa3df35953b0044e375e8d261f38978cd29f45f9fb9",
        "producer_bytes": 7412,
        "producer_sha256": "7d6984c2647b8fd533aedbe3e6c5d0f584f2013cf7d9b498b326a65b0e82a176",
        "wave_bytes": 1488,
        "wave_sha256": "89efae326447bd0afc953962b831514be5792441a3866c6f12f462bc0037108f",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "d54ecb5796755f40764f49d23d84de800dd42e1d209f3361e6128564f46d0e9e",
        "identity_hash": "2fca7b350e6208aa8b5de9e8178f34055adf586167c2ada20274744ac6db39bd",
        "producer_bytes": 7427,
        "producer_sha256": "7763380c6740614b065b7afbfc8f3ec15fa8934e8c1ccadc5a39d87bdf810fec",
        "wave_bytes": 1498,
        "wave_sha256": "af153a81f42224714df2383da052db0bf82f725ef450b2dcd573fffe96dd277e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "d9e1606ca154901e104313064df5eb0b44a11083e8f3911e18939db1e607e1c0",
        "identity_hash": "c1fee0123871a7db649a5e52e2792cea41b3acef070a0972f3a0ac0a748ed692",
        "producer_bytes": 7427,
        "producer_sha256": "1dd24fb5774efbd33ca0c4be9af7031b909a35d076dc0f975b339f25801a0fc8",
        "wave_bytes": 1498,
        "wave_sha256": "a86840f919560f51dc8631926690a2015585f7d5ca9d5665a211c1ea169b93a2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "300ffaf2d61dbc13b4dfb2603384ae51e59eb7813e13170ba5aefc9e31b2071d",
        "identity_hash": "656bfb5fbb46832318780947cd0ff2b09eda2efea0876521e6d8807b4ca69ec6",
        "producer_bytes": 7427,
        "producer_sha256": "f669f017089b632bc29e18cbae3777919e5f4cbb9a984899d3f1bee73a23cb95",
        "wave_bytes": 1498,
        "wave_sha256": "50b1621d4acb69fb95f4d3abd41885fd427d1c2a90de6d3340bcce4f0759a55a",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "a796147aa89e048a589060fbfe7ec22b305ab71955d44cf1ab3d0d816ab19a6e",
        "identity_hash": "ab9b2c6cc5854b463a68e55183e3fb332a8b97aeed50acc272b24b410da328a0",
        "producer_bytes": 7427,
        "producer_sha256": "77cbd51c378ff67c110a88b9848a9ef62d0f859bfdcbb91e996a34130c64419b",
        "wave_bytes": 1498,
        "wave_sha256": "36f0373aea92b030d3ec4fb27b0721f3943c4ddf6aa6594f10b2e8f3c241d381",
    },
    "canary-perp-bisector-survivor-refinements-next-center-14-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "97220627228a1fdbc3c9630358b4601958d369179ee520def0009797a06977d6",
        "identity_hash": "d10af10e887e7ffa75f86658480812657d2cbd91795b41c6d20f9d54075d366b",
        "producer_bytes": 7427,
        "producer_sha256": "21a5fbacf38a8cc6c11083d84bfec6cfe448dfd610d910a7541d069fe0274e12",
        "wave_bytes": 1498,
        "wave_sha256": "1f6b13cad3388e37fa884fdbe1daa81590e45e1c4ac9c9e783eb0638ea694aca",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "b6374258cc2ee5e632c106a02d22ee7704183326229f1913771764e442dc3aec",
        "identity_hash": "2b1f8e0463d9fe7553f77e9129d584c714644ab646d2e79c9031a5269fcdcb0a",
        "producer_bytes": 7412,
        "producer_sha256": "83a89450279062f24b5d6c3e5eb1558a2a737a68791bbcca8b8c6b972291ec1a",
        "wave_bytes": 1488,
        "wave_sha256": "fb74a7d7ec9b7dd6c69c2e0815f3688c353834200937ef234aa910d4cfc045f0",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "ccceb19a3fe80253cd173c5971f683f8ca59f48d4d5e66dadf8b8831a1e1f5bb",
        "identity_hash": "cc7595a8f0a46e59528df0486df3ab6af56076accaa3aab08638274ba1ef999f",
        "producer_bytes": 7427,
        "producer_sha256": "b18195319eb1fb7e1d670cc1a6c259f2731f623a935d62566d5e0d0a7a58c994",
        "wave_bytes": 1498,
        "wave_sha256": "3a54293cec00d2e758616beeb3732a223b541570fe638594b3fc480ed47c1daa",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "fdea25e136544a97489c7d438d5594f458f103e0da2c0d7680c415064a625769",
        "identity_hash": "5c5a460e86e933dd9d9c70f04afecc1b315fd71e491e5b7b579f6775de5ac9ab",
        "producer_bytes": 7427,
        "producer_sha256": "9a53b604f4a3ccc31d6401d92ae3bee707af2d58226eb9974c52462752168d25",
        "wave_bytes": 1498,
        "wave_sha256": "25fc8cd2291fb050e79811df18e048a93ba1a9b568277c40662d43ebc8734931",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "2cc332d5730487c8b54dcde0e5ae83505e108b418abc104a5cb3c6fd14b652da",
        "identity_hash": "8241c30dab2127b47e0f48bc33868e8b1a587ae9b1a7376116c2450ec8a1c039",
        "producer_bytes": 7427,
        "producer_sha256": "7b88908b0109075349aa92aaa7117a8af6bb1bb5afe03b8dc799f68c6bdfc35e",
        "wave_bytes": 1498,
        "wave_sha256": "9bc13ba673021aa3845543175a0453f95efa37cf0f2958159386ca5a2fb45b83",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "78b3b6cc6801bd4fba995fdc5ca7dc17ae94bf5e7d03450a8c7c86b06a8c53d0",
        "identity_hash": "427122138838be5a5ad245a53d15f31b38663db5dd1073cbef49929c71b5e924",
        "producer_bytes": 7427,
        "producer_sha256": "9ef22eade71a3467cd52bbc354bf3c1f79ad1c723091a66508eca3f32e0c5800",
        "wave_bytes": 1498,
        "wave_sha256": "3e80136ec7642b096bf02823cd0bad1c7ab5f025be523b03508da9abd4f976b2",
    },
    "canary-perp-bisector-survivor-refinements-next-center-15-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "b21dcf46ee62337eeb12e25bffd17cc105d054362c667b9aea335e4030e43be0",
        "identity_hash": "a2fccba6d20d8597137f32d50998760fd2bfdeeeb9e251369d5b2d8234c85bf0",
        "producer_bytes": 7427,
        "producer_sha256": "79a9755c36682bd8872d7da5411dd8e061b3678e53a10e8fee0ef53ee9df0e66",
        "wave_bytes": 1498,
        "wave_sha256": "9412d4fef5fe4f6be1f6edcffa9a821b2563ebda407f1068f970e7f0a94e678e",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-none-sat-profile-v1": {
        "cnf_bytes": 346275783,
        "cnf_sha256": "e503a4909a3e190cd8677af6c616fedfa4793df395fd6993e5f6e03a61616929",
        "identity_hash": "e7f870c025c905a3e8fa5d5b7695ddb689ad06bd79cf82bdd75c0592a6df83b4",
        "producer_bytes": 7412,
        "producer_sha256": "2999118b9d31811d735c403ab0436ccc2ef26cd929b08f99a34db0276a829102",
        "wave_bytes": 1488,
        "wave_sha256": "92472e13f535cdc63ccd783c0de10542b3fd001675f427eff8f16bb2c35ed8fb",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-06-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "58b03ea99313286bcb0533fef437f03f8160ad417efaf5412168dc6fadcba39b",
        "identity_hash": "7577e042520c264e1c995a8840d67b8ce585d0833d95585e2e4d448a2b60cd8b",
        "producer_bytes": 7427,
        "producer_sha256": "11419b3839b36f6e5be83b43d89eac82c8bd1c263b534f7100c024a16c5b431e",
        "wave_bytes": 1498,
        "wave_sha256": "d0e331aca7c1b692bbc0470f826b49522bdd5c15bf80d452a64c90db40a9f8b7",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-07-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "b4ac68775d2dc0627de3142f934dfbdd4796fa53ab837a8b5f5fd2fe30e0b4c6",
        "identity_hash": "3c51a8002c19d6449d56f08e184066827089bd4673c0700ebb6ebf19c653662f",
        "producer_bytes": 7427,
        "producer_sha256": "48c4606ef34b09f0af1fbd8cc09612d19480a9225a28f83ceeb159e1157dde79",
        "wave_bytes": 1498,
        "wave_sha256": "d8a10f436f3c5792a37784cc060b6c11ff49f87e83bdecf0184a956c4b4e4555",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-08-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "c84fbd06e74b194baf0da89e51321e904cf6cedf23586d336c4d81b424d6188e",
        "identity_hash": "15babdcda322ad6f8f10ce57cb6c59641c9e70c65294ce7421868d7c7c9384ae",
        "producer_bytes": 7427,
        "producer_sha256": "3d6e4984514f429bf0cb280f6034c62dd0cc65a8a4914142529440e9c5786c0f",
        "wave_bytes": 1498,
        "wave_sha256": "dc0b56cb3deda6d0a2f77bb46d5154cf441e68a0730a62168b011431ef1c3826",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-09-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "121b93e6134217b9202732e68aa8ab0d79dc7e4de51fd8cf5fcb6dd9464d835e",
        "identity_hash": "5e64df6704574065e87ffb2f9b60eb99e12562eee298389ba4f0a20a0faf1f40",
        "producer_bytes": 7427,
        "producer_sha256": "693c3fc0f3d9294be7fad3e8448de5f973e12512e2ecb7888f3d3eb28da398aa",
        "wave_bytes": 1498,
        "wave_sha256": "d7be87b8f0b38db8deb3a243826519633b6400d614973eded3965a61d61e3697",
    },
    "canary-perp-bisector-survivor-refinements-next-center-16-physical-unique-10-sat-profile-v1": {
        "cnf_bytes": 346275782,
        "cnf_sha256": "ec4af49ec6a2aee75c06c6490c4e01fdb0d2222ee18c0f33899d9d80309fb053",
        "identity_hash": "5e64c7a103004e154a6126be72517d2ece9dc5fa00788ce5a7a367b9381c1ea4",
        "producer_bytes": 7427,
        "producer_sha256": "1595e46d7b6d9c5b3829aa35125734ff7758e7b3fb2ae44399e2ce879fcd4f75",
        "wave_bytes": 1498,
        "wave_sha256": "b01086315245d3ef9b180db9e9240804ee18101ebbe79cd954f0d2d67ecc542c",
    },
}

NUM_VARIABLES = 308
NUM_CLAUSES = 7_409_310
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
PROJECT = "erdos-97-96-exact17-canary-perp-bisector-survivor-refinements-sat-v1"

SOURCE_CAMPAIGN_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-physical-slice-campaign/v1"
)
CAMPAIGN_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-campaign/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-launch/v1"
)
RESULT_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-result/v1"
)
ACCEPTANCE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-canary-acceptance/v1"
)
SAT_REPLAY_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-independent-sat-replay/v1"
)
WAVE_MINE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-mine/v1"
)
WAVE_MINE_LEDGER_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-candidate-ledger/v1"
WAVE_MINE_CANDIDATE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-wave-only-candidate/v1"
)
MINE_VERIFICATION_SCHEMA = (
    "p97-exact17-survivor-refinements-source-valid-theorem-mine-verification/v1"
)
IDENTITY_DERIVATION_SCHEMA = "p97-exact17-canary-perp-bisector-survivor-refinements-sat-profile-identity-derivation/v1"
UNSAT_REPLAY_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-independent-unsat-replay/v1"
)
EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisectorRefinement"
    "SurvivorRefinementsPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorSurvivorRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinement"
    "SurvivorRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinementSurvivorRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-refinements-physical-slice/v1"
)
CANARY_SOURCE_CELL_ID = (
    "canary-perp-bisector-survivor-refinements-next-center-02-physical-none"
)
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
    target_code = (
        production_config.get("target_code")
        if type(production_config) is dict
        else None
    )
    _require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == EXPECTED_FINITE_SCHEMA,
        "source producer Lean ingress drifted",
    )
    _require(
        type(target_code) is dict
        and target_code.get("commit") == source_preparer_commit,
        "source producer preparer commit drifted",
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
    target_code = (
        production_config.get("target_code")
        if type(production_config) is dict
        else None
    )
    _require(
        type(target_code) is dict
        and target_code.get("commit") == SOURCE_PREPARER_COMMIT,
        "cell producer source preparer commit drifted",
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
    _journal_job_id(records)
    return records


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
    journal.records = [dict(record) for record in records]
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
                driver._append(
                    event=_driver._event(
                        phase="DRIVER_START",
                        disposition="SUCCESS",
                        detail="descriptor-bound recovery started",
                        response=_policy().as_dict(),
                    ),
                    outcome=CHECKPOINT,
                    detail="DRIVER_START: descriptor-bound recovery started",
                )
            job = client.prepare_cnf(
                wave_manifest=wave,
                cnf=cnf,
                producer_manifest=producer,
                timeout_s=SOLVE_TIMEOUT_S,
                march_timeout_s=SOLVE_TIMEOUT_S,
                project=PROJECT,
                requested_core_limit=REQUESTED_CORE_LIMIT,
            )
            driver._append(
                event=_driver._event(
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
                ),
                outcome=CHECKPOINT,
                detail=f"PREPARE: recovered job {job.job_id}",
            )
            records = journal.records
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
    ledger: Mapping[str, Any], candidates: Sequence[Any], canary: Mapping[str, Any]
) -> None:
    inventory = _require_exact_keys(
        ledger.get("family_inventory"),
        {
            "family_candidate_counts",
            "formalized_stage_counts",
            "excluded_diagnostic_stage_counts",
            "complete_equality_component_counts",
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
        "complete_equality_component_counts",
    ):
        values = inventory[label]
        _require(
            type(values) is dict
            and all(type(key) is str and key for key in values)
            and all(type(count) is int and count >= 0 for count in values.values()),
            f"wave-only {label} is malformed",
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
    _digest(decoded["assignment_sha256"], "wave-only assignment")


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

    PIQD's certified model seam has exactly four keys and no embedded self-hash.
    The immutable artifact filename and terminal custody therefore bind the exact
    canonical response bytes by their SHA-256 instead of inventing a fifth field.
    """

    expected_sha256 = _digest(
        terminal["artifacts"].get("model_sha256"), "archived SAT model"
    )
    _require(
        sha256_bytes(model_raw) == expected_sha256,
        "archived SAT model raw hash drifted",
    )
    model = _strict_json(model_raw, "archived SAT model")
    _require_exact_keys(
        model,
        {"job_id", "result", "num_assigned", "assignment"},
        "archived SAT model",
    )
    assignment = model["assignment"]
    _require(
        model["job_id"] == terminal["job_id"]
        and model["result"] == "SAT"
        and type(assignment) is list
        and model["num_assigned"] == NUM_VARIABLES
        and len(assignment) == NUM_VARIABLES
        and all(type(literal) is int for literal in assignment),
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
        _validated_archived_sat_assignment(
            model_raw,
            terminal=terminal,
            cnf=cnf,
        )
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
        _validate_mine_inventory(ledger, candidates, canary)
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
        description="Run the gated 76-cell survivor-refinement SAT portfolio"
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
        print(f"survivor-refinement SAT portfolio rejected: {exc}", file=sys.stderr)
        return 2
    print(canonical_json_bytes(result).decode("utf-8"))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
