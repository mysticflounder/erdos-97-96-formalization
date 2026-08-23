"""Fresh fail-closed V8 PIQD portfolio control plane.

The runner reuses the authenticated V7 custody implementation but gives V8 a
new project, output root, receipt namespace, and exact scanner identity
contract.  V8 cannot prepare or launch until its Lean packet is frozen under a
finalized preparation-config schema.
"""

from __future__ import annotations

import hashlib
import json
import sys
from collections.abc import Mapping
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
for search_path in (ROOT, SCRIPTS):
    if str(search_path) not in sys.path:
        sys.path.insert(0, str(search_path))

import mine_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_sat_model as miner
import prepare_exact17_canary_perp_bisector_survivor_four_point_two_circle_v8_two_kalmanson_refinements_physical_slice_cells as preparer
import run_piqd_exact17_canary_perp_bisector_survivor_four_point_two_circle_v7_two_kalmanson_refinements_sat_portfolio as _PARENT

PREFIX = miner.PREFIX
LANE_ID = (
    "exact17-canary-perp-bisector-survivor-four-point-two-circle-v8-two-"
    "kalmanson-refinements-sat-portfolio-v8-20260823"
)
RUN_ID = "sat-profile-portfolio-v8"
RUN_OWNER = LANE_ID.removesuffix("-20260823")
BASE_HEAD = preparer.BASE_HEAD
RUNNER_CODE_CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/exact17-v8-control-plane-20260823.json"
)
RUNNER_CODE_CHECKPOINT_LANE_ID = "exact17-v8-control-plane-20260823"
RUNNER_CODE_CHECKPOINT_BASE_HEAD = "dbd449d772908af330686d6ddde7df7a6d5026b0"
CHECKPOINT_RELATIVE = (
    ".codex/worktree-checkpoints/"
    "exact17-v8-two-kalmanson-v8-sat-portfolio-20260823.json"
)
SOURCE_PREPARER_RELATIVE = preparer.PREPARER_PATH.relative_to(ROOT).as_posix()
EXPECTED_SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
SOURCE_PREPARATION_CONFIG_RELATIVE = preparer.PRODUCTION_CONFIG_RELATIVE.as_posix()
RUNNER_RELATIVE = Path(__file__).resolve().relative_to(ROOT).as_posix()
RUNNER_TEST_RELATIVE = (
    "scripts/test_run_piqd_exact17_canary_perp_bisector_survivor_four_point_"
    "two_circle_v8_two_kalmanson_refinements_sat_portfolio.py"
)
MINER_TEST_RELATIVE = (
    Path(miner.MINER_RELATIVE)
    .with_name(f"test_{Path(miner.MINER_RELATIVE).name}")
    .as_posix()
)
SOURCE_PREPARER_TEST_RELATIVE = preparer.TEST_PATH.relative_to(ROOT).as_posix()
RUNNER_CODE_CHECKPOINT_OWNED_PATHS = [
    RUNNER_CODE_CHECKPOINT_RELATIVE,
    SOURCE_PREPARATION_CONFIG_RELATIVE,
    miner.MINER_RELATIVE,
    SOURCE_PREPARER_RELATIVE,
    RUNNER_RELATIVE,
    MINER_TEST_RELATIVE,
    SOURCE_PREPARER_TEST_RELATIVE,
    RUNNER_TEST_RELATIVE,
]
SOURCE_RUN_ROOT_RELATIVE = preparer.RUN_ROOT.relative_to(ROOT).as_posix()
SOURCE_RUN_ROOT = ROOT / SOURCE_RUN_ROOT_RELATIVE
EXPECTED_SOURCE_LANE_ID = preparer.LANE_ID
EXPECTED_SOURCE_RUN_ID = preparer.RUN_ID
# The source export records the exact current HEAD in its run manifest.  That
# value, like the source campaign and cell identities below, is frozen only
# after the create-once source packet exists.
EXPECTED_SOURCE_BASE_HEAD = "822e2690959721c52749ea68a4e304b351a3592d"
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
PROJECT = (
    "erdos-97-96-exact17-canary-perp-bisector-survivor-four-point-two-"
    "circle-v8-two-kalmanson-v8-sat"
)

REQUESTED_CORE_LIMIT = 1
MAX_ACTIVE_JOBS = 12
SOLVE_TIMEOUT_S = 3_600
REPLAY_TIMEOUT_S = 3_600
CELL_COUNT = 76
NUM_VARIABLES = 308
# Frozen from the committed V8 root and physical-slice coverage theorem.
ROOT_NUM_CLAUSES = preparer.ROOT_CLAUSES
NUM_CLAUSES = preparer.CELL_CLAUSES

SOURCE_CELL_PREFIX = preparer.SOURCE_CELL_PREFIX
CAMPAIGN_SCHEMA = f"{PREFIX}-v8-sat-profile-campaign/v1"
LAUNCH_SCHEMA = f"{PREFIX}-v8-sat-profile-launch/v1"
RESULT_SCHEMA = f"{PREFIX}-v8-sat-profile-result/v1"
ACCEPTANCE_SCHEMA = miner.ACCEPTANCE_SCHEMA
SAT_REPLAY_SCHEMA = miner.SAT_REPLAY_SCHEMA
WAVE_MINE_SCHEMA = miner.WAVE_MINE_SCHEMA
WAVE_MINE_LEDGER_SCHEMA = miner.WAVE_MINE_LEDGER_SCHEMA
WAVE_MINE_CANDIDATE_SCHEMA = miner.WAVE_MINE_CANDIDATE_SCHEMA
MINE_VERIFICATION_SCHEMA = miner.VERIFICATION_SCHEMA
UNSAT_REPLAY_SCHEMA = f"{PREFIX}-v8-independent-unsat-replay/v1"
IDENTITY_DERIVATION_SCHEMA = f"{PREFIX}-v8-sat-profile-identity-derivation/v1"
SOURCE_CAMPAIGN_SCHEMA = f"{SOURCE_CELL_PREFIX}-physical-slice-campaign/v1"
EXPECTED_SOURCE_THEOREM = preparer.SOURCE_THEOREM
EXPECTED_SOURCE_PATH = preparer.SOURCE_RELATIVE
EXPECTED_ROOT_SOURCE_PATH = preparer.ROOT_SOURCE_RELATIVE
EXPECTED_FINITE_SCHEMA = f"{SOURCE_CELL_PREFIX}-physical-slice/v1"
EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA = preparer.PRODUCTION_CONFIG_SCHEMA
GLOBAL_CAPACITY_ROOT = Path("/tmp/p97-piqd-global-capacity-v8-two-kalmanson")

# Artifact-derived production pins.  Empty values are deliberate: inheriting
# the V7 tables or hashes would be less safe than failing closed before the V8
# source packet has been exported and independently inventoried.
SOURCE_CAMPAIGN_SHA256 = "c83fed020c0cc65aa10db1c9cb73c8b73207ace3d9ab66dbb736a6e1891cd54b"
SOURCE_CAMPAIGN_BYTES = 119_943
SOURCE_RUN_MANIFEST_SHA256 = "b7954c9351904c86907e8c6d274b5fb8794e596a859b02cc202b824647bffcda"
SOURCE_RUN_MANIFEST_BYTES = 2_543
SOURCE_PREPARER_COMMIT = "822e2690959721c52749ea68a4e304b351a3592d"
SOURCE_PREPARER_SHA256 = "03554c21050807722f57bd363088e0cec4afb4f33425e366ad23ba4092f081d0"
SOURCE_PREPARER_BYTES = 107_061
CHECKPOINT_SHA256 = "e20fc6d29bcdf8452c2406504e5c8985701f7638564a26bcbe4a24479b643b42"
CHECKPOINT_BYTES = 1_328
RUNNER_CODE_CHECKPOINT_SHA256 = "d9d3aba8eb3b4aa37d93ddca6a57d6a4ec8ebeadb7591f10a18e8257d578e007"
RUNNER_CODE_CHECKPOINT_BYTES = 1_321
SOURCE_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-none': {'cnf_bytes': 346306916,
                                                                                                                   'cnf_sha256': '2ebae34e0cfe9a993aa9a45efa676f071766bd98f69342549e26233b0bcbcfdd',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '89f9e05f5b65b4659314d95b8c8b10ddf71e67bd5ff27e653f0e7d2729740810',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '419aa117ab59ed86cc390883cdc2c025455d92b330636bf42a591b79c0a5971c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-06': {'cnf_bytes': 346306915,
                                                                                                                        'cnf_sha256': 'b24e9c4260ea103da7590ff9cc9a51397bfe3081b654ee33917500e76d7d38d5',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'cbbeff89c9c56c8bf7de3793a8f3862dc6fda2ebcfc40dc4f04c0c963851c97d',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': '1f988ea3fb9e90072e7ff52cc40d8259b41ae379b5e38ecb70f61731ef0109a2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-07': {'cnf_bytes': 346306915,
                                                                                                                        'cnf_sha256': 'c42914df52b3a5be54e7cb331896c778da4e90e2bbfe4dfc1b0ecbbd15b0a31e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'e3186c05cd8a27283d1d349dbe846fdfcdd9010f57f60b06544dfd9f91475c15',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': '101d206fc4599855216a0ea21674a7b100f9b05be937177c20e8861224292ca0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-08': {'cnf_bytes': 346306915,
                                                                                                                        'cnf_sha256': '7cd31776af857521b85dca8e0dc7375c9daecdfbc456af75ee4258c6f63319ee',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '4d60b4ad1ae5134852e18f386df9e3ec0e40b2b0d73baca5f1840f89626dab67',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': '9ac45d3eb170fd1aad492fb71424462ffa3af498090779438924c0096ce5f31d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-09': {'cnf_bytes': 346306915,
                                                                                                                        'cnf_sha256': 'ec6b0fe6c3a8f622fd8309b2fbe83f84cbe7a9d384796816dc516aba072612d7',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'c962267c05532eee093cd72154d00fc56293d0d04642f5143bbabd85ff972160',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': 'e2537abeb921479300bfca487667dcc140654576d4bb1caa7f0465d2aaf40b45'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-10': {'cnf_bytes': 346306915,
                                                                                                                        'cnf_sha256': '9f622b37f678ac8d43fd8de544916df0eb2b3ce9f0d92a53d1d052113fd4df57',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '21dfd14b536423ef24f3a9e1dd86e03cad3aecc679b79038c5aea4ed62e19067',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': '2b6033ff90c4444a4b15847650d8142888797b70155f0a4701d3fa29e202a742'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-none': {'cnf_bytes': 346306919,
                                                                                                                   'cnf_sha256': '5f366dbf84daaa915a505941cfb00ec5639a15414ce13a5e570bf8d6a8617c54',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': 'd6ae7a2e6b62c497c7f1dfad6b3552f32936bac3972ed06919ccb9904f686ccd',
                                                                                                                   'wave_bytes': 1648,
                                                                                                                   'wave_sha256': '85b12de0a485700fcb3ca0cb127e64ce4c9f5fdf3b99fdf46efec106cb335ffe'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-06': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '722527cc2bea925b11b51319097873e8c4b4876fbe2dce20e41b50981a0f9d1e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '95765891bb0226aedcfa62f315dcb4eac034c20b58fd29d6b4d0b71529bedeb3',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': '57bacd4a15875076aca08053327c50d56734e0eb073fb977ae421e1fb5b3d0fa'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-07': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'c016820b5984e0b981036a76a906a05942972676501170c907afcbf31c577e30',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'fd4518faf470ac0fb83843e1021cce30ce3d306e460f720f18e4fda0fc63f264',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': 'f7de95be52672c5e4cd4aa339402be82dc8d7409e89de0feea04153b4aaeed98'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-08': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '71ff57b2af353382722c81e4c5a9d2ac755af8662061fb6b77b07d83651dcaec',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'f5bfc8fabf6a237b1940c0257be9e836082ebd99c309e68fed7658ad80a2bfac',
                                                                                                                        'wave_bytes': 1658,
                                                                                                                        'wave_sha256': 'a5c2d6b34bfc3c7a12020c7d3541c91828d05b30009c36270f097a612f8a9311'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-09': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '90c9aa06b2b528160810a00d2d4c822e87df9139444b084bba30eb2366f8e5af',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'b13d5b41d2099736183d8d92fff89cd4a2fb6e46c369e231b62c83584cf96da2',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '75a1454c8e35d74a2fb428628129a4e7c4df84ddfd70354cbbca3a2e379e24e5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-10': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '66692189b2236450979ec57cc3fc0cbdcb52062e9da571759e8124c420e6815b',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'fa823a68994e82b608d408a73ca5b927edf36f898dfec711e2385a116c457327',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '62296c420440b259c17d2b227e269d058e0362541e0d68dda51767b1cc0b601d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-none': {'cnf_bytes': 346306919,
                                                                                                                   'cnf_sha256': 'cd555351507fdc28f7338818094ddc31aac9a55502ac33eb0860bf918137b87b',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '19fb3fc9c998f15a68bcb894c481f32a3bdc7fb997a20c91b95bc5ce9420ca22',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': 'b45dd0c521ef9ecb9112e229257f46db1397d222624385e9efb79903963bfad2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-06': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'd183b0d5cb4fcc670f308fb09c3acfb5039d1b3c0dfdee2d389d8221dbc05aef',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '28229b594d092202e252214a416ad4adb28b58bf40e3f6007e55b63234c7e81c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'd1e91f6277c92284295d9b3cabc07cf7153cbbca776012c259ddec26b4929702'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-07': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'c23f32c5f78d45369e4f2c510f5484c5040393f557f1c3ac1518ba21cc374e08',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd8d81d9cfd7024a7ab2701e25f65761cd94635774e8260e91137cb33ff191a38',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '94c17dd32ca0e5387c846b7969df87239632b9315a206c0d873b0663209d9243'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-08': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '074247c339e4fe2902ee328fbe298e76433048b9520992a3724551a47d55a714',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd111c96efa2948c8dda629ea16e806d5bc43d2a40391a6fde3dd67aa2517c9c4',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'a1d598942f7595e3912fa399ef99844bc7358826727c6db7c41bfb884b40710a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-09': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '719b72bae2a66a86a538015c2bd6ffbf33664f847d4d3b0162c73c501760d587',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '03018324a73b7b62612a47f5e4145d358122e4e36d85b041dd9a7071c072e214',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '830f5e5b5d717ee5ea83fd67f182e24d9f68566b6981f198dda0e199400b2c20'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-10': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '6e94b2ac28994699379c17012868c5cdb08489f9695ed30125800d47b1d76a07',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '7552fc83fe4544de4c22fbc1bf9f665226e601cc044e3f21bc3b6ead818d353c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '6624bbe3e91c94fcb9014da57d2d0d5c431ce565b8634ddb05569175df39bbdc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-none': {'cnf_bytes': 346306919,
                                                                                                                   'cnf_sha256': '0dce5595427543cb5bd2cef7f05cbd356aeb9f18f434df50be4c999d3ca0c0b6',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '6531e40d275315a6141ba88c8bb2d99164068fbc788c8e97197f166d62ccdf1b',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '4fb43339078bfe3308f263684a9c164a21de127efc22ce91e47a5ae62397eb1f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-06': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '23fe0863b5309cd6f936223ec7b2fd4af4fbe63136773b7e6cb6931821c9f76a',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd9a2436d44521b6d80071a55fd8d8cfc48ffa4892688aed34310b8b5d848f35f',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'd1b45c2e17861b72949ac03ffb068518f91862d017c1332d442639a49b894980'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-07': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '15343e27ab9ff97d47005cfa06f2c7445957d0e12c1c59f3d9bbdc0ac325edde',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '4dcfa223e717740b04d60a64e1966ee72499fd47407e6ee84a67ecb7be6bd7df',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '8344422344d4c46ea68a0d8e249a4a492f096ca6f90eaecc1664589800151238'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-08': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'b11f40e4611bb8d474e9e7f0691d0e2c5651578119fc377a083bc488c23e4d34',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'c01699f3002f2a0e1b326c8d366daa335de1408452d217daa7eff332d6699052',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'bc882106a5d78dd772f2ed2e9ff2f1f3934ffe99295882681f28497a29b54d08'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-09': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'dcdd724994cbc417adedd7a74feea57efdacd8156dbf8c86139a1c8cd5f8b32f',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'dcd8e0aca4d35d7546689da8be566765ea7ad7dcb44bcc0972748d6fba2f7f8b',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '70e55eefb5417ac403e5b77fc2a9e18fdb5dab706c80cba42d59c9ded47fefd9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-10': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '286e545a6f28850bfd1def23cb239455ba74c2d38094f713f75e3b5c1b1a59e2',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '3e8436ffaf60253f42b140adfd7d3150c06e5ce9edcafd1fc5c8e07b641255cb',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '3b7ca8fb461c564fe5ade4102c52d757087db681f08b9056eeb0c982af300aeb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-none': {'cnf_bytes': 346306919,
                                                                                                                   'cnf_sha256': 'cab875acded93973da3d1658405a77d9a9abf0fd45abc416349add19502a525a',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '09d3dffa772e3fe1b05e659628913f3df3ce70280574c00ee416c743be935eed',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '5ffd12e67d3a018c1f854b6d29fe4fac5e3d6a26cb95626bf9536fc5d8a04688'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-06': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '6548c7294b370279c1b5ae783a0201c060a4d7d910e251293521d4ced34f7b2c',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '46138957db0147dbff4c713b060e07400aa68282901e110a726c1746a38a9573',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '1e6aff862e86f53095c43f70546de9f8b1392e002547939cad09e73207fb4421'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-07': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '526f0b3cdebfa3eba149e8e43450a58b3c8a6cb963e0ea31bf32f505b4d2cee8',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'efc4e525bfb2fc88cb2fee3da41eaae0032dd6d3a1a14dfbde04e7f9fd48323f',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '46ce3ec4408ccf3b267efe024ab7effcda9f70d5f8e0f4663629ba8a9ae042cf'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-08': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '30761f5dfc5b4cfca58c9435e1528f06c6505d7c7d031f5ba94c10a7b4bcb1c3',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'cacd3e530cfddb51483147a1e3e06e7fd67411396538d13a3d3c7d7ceafa2cbb',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'e033dc23795f04e84378c9b145afd4fde95ecf83f5fdc100f13e26bd734f39a5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-09': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '6c4c10372c1d19e6ce03a67061f3ccc0cdbab3a215589589864fd5e257ffdc37',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '7b281a675d7fce8a871c676236422bd920a0879429a8ae42dd8bba5dae3c3db5',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'ef8543aecd0e7ac4bb8f03b8782201cb582d9f20e2684565dfd13b0b4b08d07c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-10': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'cc1a69bd6adbb862542d1d742fd5daca4f79ea7e765e7c02e1857637c0256f0e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '18fbdd1c0e47a59e0e793dc7f2636debf7b7be641584ee6138c181056302f45d',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '64e408d5821130c05b480943fadfe1e082728db8b2fed40c11b209be60ab738e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-none': {'cnf_bytes': 346306919,
                                                                                                                   'cnf_sha256': '877cdf5a229957ebf5d832e3f4f0b72056dc62ba4dfcbaf1d97a63082e596304',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '0ff332c9d12eefa619209b4b314ab3a4208fe9b8e6b0e508115ec476dd120477',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': 'dcac582b2d2abfab59a07cdcf560b961e58fc76e62667ff63497c8b77bfb6853'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-06': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '07138969dc66eef8c9fa24d140979e111b4f5befae88e4a6337b896697747225',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '4003ba43aba758f8df994b467c2fb32552954c03da338e612ca5ce299c610e43',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'ceb460df32034b98b581c983ecde5e08ae5b577db77ccb1bdec8d41786bb4d4b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-07': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '77b8620ce924e222f3a1907658cbf681d90322b92be949fe2aa0685f475c1d8e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '735f75288a71e07d328600414313b7f58a22a1c190e5f5474471dd5168beb969',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '57e9bb91fc4b89152cb94237e44ce0e770af609c4cef0fa1948ce2d0432d1cb3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-08': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'bebe653852dbf26a164dfe197749bc6e7d511d68080a1cd17b3c4a58f060a19b',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '801a1fa906184f2e5caa2683380f30eade08524bf73a3b6bf364f24c71108bb1',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'b4f7cdb6e4e14b76c3ab4e8a2784336bdbc4ceaeb5e5d17dee2a15305c06c9e3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-09': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': '9155e5def402414adf88f98b26dc669d6ba5bcbdf7a4a81b16d3bb23834bb8f4',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd3c81dbd736cfbd621772cbfb7ba47701bfbc18d3c8e1d24cd53c053fa4ce680',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '59bb8b48a7ec37a2f4e5387736476740582431a483716d28bb7927d01538151a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-10': {'cnf_bytes': 346306918,
                                                                                                                        'cnf_sha256': 'e0715074625192c73ac01c1dcfbcaf360a42f9f2b6168e8ddc6155186322ff54',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'a42d99689769bde4ebd2813e46147b2105e338f34a7b41edd4ef0e0ffe4d6f74',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '2a138964ae3dd84a7641e90558f512da8ccee9bbdf63a84f28d70ed4b6f021a3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': '4283f66311daea7bc7c53beecac331c0e6890f47cbd6aace8cf0369471fae1b4',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '7dd05f8d495aa4e702f8228053f80023d2fea01e4488f957757728b2a0cbcf6c',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': 'e69e39136ca243aa12876f0df91ec8f58567d0262b3c13399d9a80992f88edfc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'da4025847566c71da1950d7dbc63efd12def6c055abaf8349cc1752a30245c1e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'ad0bb1f9e9dd21e5820368f31b25e29a27b2ead1f4e8fe3851532a152bd6bb94',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'a70efefef50545403733cdb90805fb7cd971078ccbf97f6ce0d7bd4fc3494f25'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'cdb16d45cec4c794d9c486b106f40862447c11824db30c11984e0fe8ba332622',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '09b615bce72f1a584f600345d435da937934e4df2f452ddda49562dcd9627425',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '1e55bf020b185adf1d7313d9728ec02445b76a0bb96e989d178aebb445056a12'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'd88847ad9a36c5e0548813ca02edaa1fb5b8d6273a412f46aae774cd47335742',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '7ff2e68034fdad8bce5f1fd6e53fc94a480681fab3b2de2a896038a7b685419b',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'e27c02c362408d155fb426d9897a2c8251436790f473aa6b4d778040ca86fa73'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'b741873d182110729ee63262684a12323799f3ad40267d7df9a7a8b8205a4a44',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'f90fa5026a83ee6065ca52ac7cb812b34ce68ef9b668bfcb6a3e15cee08de7d3',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '48642b4de309517fe86b0661d4160fe1ae9cb64ff05fb56c55a3294b5bdb5cb6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': '734b06b8ffb180b1dfc04f2893636067d8614fc4a9af787ebafbaa418061a150',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '15a38d01da31661e8bb04d0001605d6a168e81e6c2673bf5488f86a9f313879f',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': 'aada109ff6acda03a5d25824e5fcffc740852d9d372922df69c8b92b0b782b2d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '7f463b6ec13957af4240305bf7de7058aa3e9d22e5db4dfb37de24a61aa2a3f4',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '75eefde4ea66313293d3f8a79aea550f37f9411ded727c499d3f294a7959a23d',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '882fba1fcc56b7cdf54fa29bd6475a973966745a6012a739e49f0b22fe79e22d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '53f9b500f9965a0a257ab2c1b37d3ee8910602e1a993f42588aba40d17368af5',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '736c7845b93f1b5ac6c95a955d4bdf4357c39a3d4a5a431ca35d370c3e1cc1ba',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'f9355d8942ea0c985edca27e09e34330faa1c66ffb80c2afa83856b07dc18444'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'd3913e986d7755fcb84f9385e9fe256c25fe84860923bc2d90aa34e7831692c9',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '9c7a42819eac01244cce128c146c9676a773800c2d71ec8b2088fad8a8e4dccc',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '4cfdaa22ebcb317d0da52b1943dc75dd72d20ef25065381b10558c58fc7e4f3c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'a2d20708a8968c2d6c1f5bd3fc174ce1abd728d5466a13ee002f6892bef87a6e',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '1bb137f6f48fd9132791f0dfe62beeed4fe07f20fd4a965161761f02e6e39f0d',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '59840b0586ff94f0e2c3fd3b3fb6101457f4a29dc95cf5def768942d683087b7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': 'b82a396736155ed90788f5d092e49ce066ad6418d17d054ed9e214573f2e3bcd',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '639b4b41e586ba98891e2d6aca04216c42ca630552e4001c409ff2ed53295609',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '5ba04492afdd3035e5b51887c1f5e14a673d7c19fe14d73a2d425d01eb5235f2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '012fce69958c701e3abe5ad574662add55561b77eeee567d8ad120cd0cc292ea',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'a9712b4b8568e9e9f5c23b9a9846e8fd2dfabacd5666d7161fe5592ea14cd641',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '57bd3b1baeb21729cdd5f59cafa3515dfa1e75e76be3874985b1eb1214ebef21'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '93c72a7fdfa35b781344389962ef011c7f0a9a7b25850addd0c70bb2add10742',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'b7fd15284a36679ba87c98a728d4012d7739ad19b54629e5ff2add3c52e5fabd',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'c23fce7a66a158e799bad58d4ce7d778cda0a634a1b0c9fbe38452c2cd707b05'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '80f32d7d39de4657f8415aa9e876b21e1956d1d507743348aad7db2d22480ce3',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '0237ba242d07a5ee2a15db2c52d93f3235e89d488c4cd31b62eb7b0b0bd6bdff',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '6d329d253da2c9eb43bc52e79e149ac941ff8cae5b9ae42dc08ef0989591d141'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'ca79432fa4c21b84992dcdeb6af218de70edc23a127e08c7fc8087a17d029a65',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '0e2601b488c982edae5adefdd9bc64a0bebb725046e75258a2f78112c6915c9e',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '7ae5054be832ea33f18c6acd895f83de77491609588157f39449bf7e71c3f966'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '92112d08a778ff26ba3e276a8bce79b71b873d42df34731e22ccd1426da86165',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '95dda648f8ef509f3e3b2bcb7927c27f828e6b161569afacc9156c3aae150b4d',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '67e2efaba47f421dd33afee94d35fcd1ab2243f462bca6dcf288ae3dbcb65303'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': 'eb54127164a6a409833721debbec58745a68574ecb49c0e5766db1cde8773055',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '83c486dd1627366af3a22555076138472f498884fe55ca019540c4b551a5bea9',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '1a1dcad5ca21c4ae39a9eef807aea27bd66f5c8298a54ea5a42d9cb4545193b5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'c2bf3364c081d50f33b63a349a7cc4ce9e05a82beef908da19d5b80ccdf986b9',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '40a8fcdc6f1ecac33b03b75e7919e97d6bd92a9a25972b7a8f275b039983f947',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '4ad041c872161dd9e5bfe8f6b0de7a816fbf32f47ce14f334a9008697a542fa7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '8fc7654de5af0f78816fc788be8e6dfa671fce55cfdb0020b0add7b137a48c62',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'c44000c9b8cee03adce582e984e6b86c059c4596b5bb93e7541fada967a6de10',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '893a0bf7848c76abde4f54c050838aedd64249dd967bd08fa6a299f2720cb17f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'cc168383f22917ea6fbe37f7ce22a76787e65630ffd5e8291e2a0deb073ba221',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '3aab13b34a3b6f43b589f97a7625e3424975dadf5396d21e7e9f341b6415f2a4',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'f77b587129d7ea2ea416f7b14d1a6cfe5ca4d65884d44d1fdd9f51a2661d2ebe'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'c7529ec6a6f7d7f9dd43ca5411468c886de74bfe2f6a8d2e114a83880748f43f',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '037b7d0bd96726796a0e583ff43615fd97b8f83868c305e447f1562f46ea5b70',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '792312eb0df5fe5eecbcb5acd15d3a7b95116ca9aa6a4fb34200a6370023e332'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '62cb25f4dd5f474f645dfa3014d3db7cee97cc717cf1284f27aac86cb2368cec',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'f6b3e73571b986276a7f89fe7f20bc549ee046ef750e3b2a9f1382aba2474e8f',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '950a4ffd911e5c777eb230725c7056d925d12982fed97cfeaca4dff7047eabdd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': '1f73cb729a8061372e9407e3afe6d83d99bbb6a066d6bdd97c95f9d4e444ebc7',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': 'df86b4f2ed1100bd62c255ebec7e03460c744b7ca37863ae383ed782c673755b',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '26b7914b5ee01a52c47ac61bdb0c93ad487b3f6e635a9828dd8e4eebf1b2de82'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '9386c66b062ff256d0ec2dc58eddfbfe509024541bca03a58cdb95052a60638b',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd505679de5a22a57130fd90aaff02e37dde476537798ff6dcea96400be0c14a7',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'b05f159038be6283704ecdf4676a212aa3796cb750b93aaaa270fc3a47f8c242'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '6ddf867f04d6856125fa5370df90173eb0bef1851da88f7f86cff154187d663d',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '87899a24cd9613ec698af25b2e830d1f202eb4d3377a62c8f06bf94019ac2bc5',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '77b5caf41eb2367b84f48a41d3320a088099aadf794d1a1cebb735c5d3d0ed5d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '643794aef7848ec5297ed6d00063eec54e554e3dc2b7ae9dbdd7b3e061b720fe',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '66f82db3f3db983bdec44e34f7df82b8b0b56beac416de96b7019e94e889c235',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'beed1bd961fc73a29147b1d54d855cf057283eb812057d88fd4abf12b3b1de99'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'b82d2647fa6936b860a055e0bff6d81aec9bc8af675999d233fa3858dffb91ad',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '316da52e043657eeed02034f4d1ed0885bb9511c4d053ad804c786ae90f50fed',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '5d2f7ba8e04592816f1fcf4e251678fbc62cf5b1b6ca6c10d66f0b64973d3e17'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '1e1c30d1646f6ed36767c0b8f3e32b178ca8c00d25092ce8e77b22bcaabe488a',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'd37e0430c0b2a8ad42bed8300bf0c6b627919fb5aad7e88d14b5c9f5e7748964',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '703e4758ccbaec84a78fe39a01c6650c8a4aae99944d756b14852585ba611b0c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': 'a952d6b85e86e914e76b6dfb548616c2b9ee5a436cc78f3a0fb45d15ebe91615',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '3fda17e75d92680ad8fb32a6f4ee12c5439eb95654ae4572187986d4587b56cc',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': 'bb4c7d26c9faa1f93417233f8067280b5108c3156edda1705b3a9addc013fda5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'b56427646455f3e78724fec08bc86f03c2b9a32837ab89ddc07fcba462e1a417',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '858357eee49a728f7b4d5621b99db61fb11c70637c023d87b3cb3ce17083c3d4',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '1dc3449e5514fd00e59c2a20ec5f428bbef157abac7f4e5ccf5c38923573dbf9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '7e44e2ba0d0022d565f9dcbb817a7647b2f4a5fe7a6a614935ad438d27559eaf',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'ff7729c0b852316894e99b58cb18fac4aa4ea20efa107730eb52782b88fe0392',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '748913cab6e0418965bec65ca70c7f2b5fa64f62da0f12ae44d63074fb5012c1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '06b84e974f8b3b6bca728bad59ab0412134655c3f48a6ef5e8d59f31936fd97d',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'ebffa0b4817f8f35c447f3fbaac87fff56bb6b25f3bcdf4c94bbdef563df711a',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '1a377d477e9d7e31eb64c0b03d2dce34fc050c5a15efedf8af40e5aa70dd7342'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '96b0193fca1c64c0999e20b137bdd5638158575584a377d13861e034e40ad222',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'dcee45f2e9dcffb55c979a5303d802a746cd50ddb7b93e5e1544771f3c5b5158',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '525b41d8b76f4d66fca2215e6d887e1a4861da2b5970966146089816ba7e2e73'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': 'c09146597b05201b36597b8243230f841134c24f258a716d1e6b02fa71929f7c',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '465619ec0004141ee65a6ca1fdf233fc87c3e45f42ce6055027ecf75cafc982c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'a6eb0027279f9240f455a0e11be7f93af01613391c4b0873e6c3a9888bcfbd92'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-none': {'cnf_bytes': 346306924,
                                                                                                                   'cnf_sha256': '50f5ba45370d4deae121fe3ce207137380de242e17aa6d1101cefba3cbdba9df',
                                                                                                                   'producer_bytes': 8868,
                                                                                                                   'producer_sha256': '504cb88853eadc4a74e3b7f08e96b64ec5cdbc5b4191d5f2c66b4c4cc5f656f5',
                                                                                                                   'wave_bytes': 1649,
                                                                                                                   'wave_sha256': '9cd39595dd3975daeeb32cceae1da549445401ea297e27bdc8062d533dec6bff'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-06': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '5a29a11aaacb77ca536dba7c995bfedef63a5f88fb60bf591b653a66cccb5a95',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '06326bb8d15634312be852cc4e10db9bc06643821ac108ca815e36ddfd591a1c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '18ae054e64297bc0ce948115fa5b08ab2d805a38aa5b3a610ddfdb2821a620da'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-07': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '62d0ce7ffa1e7286271e80a756dfa3ce81c5d2d96904a594e84d8870e6b54d98',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '91ca1576da5fb3edc9ccc3c9db823b46d0289cf1ac7478a24409393560a22e1c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'ce33e9616a8d3a9f105badd901acfab7c678c279dd4654f63764e178bbe60434'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-08': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '63656a0c0095ca96b99d5aff7c95b49d8c425e2b72d2263d0335635d126872a8',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': '8a5727a7bdd715b3c5a550f4cce594be5e4c78c99ffd8c755c50a79fdb865e66',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': '6af1baef82b5f4c9d15542f9dc0a1956da5703e09b42e3e3956b10302881afa7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-09': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '0141961630f664235831241bcf4c4a7f1ce468c65449c041839ee6ecd94d714d',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'efb00470a45bff7c6d3c03a812cec90b3f9da6db2fa8ef5615212d08833d6ee3',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'aa63cb738838a5f0202f40e90296ac72d1c6abbc1a84b8d5e6e204a3f75e2976'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-10': {'cnf_bytes': 346306923,
                                                                                                                        'cnf_sha256': '142974d122c64a6636b5f40c77a577a2fe448ef4cb3c5a0b8d323da2c96c3099',
                                                                                                                        'producer_bytes': 8883,
                                                                                                                        'producer_sha256': 'e2a5526fc5e8e8cc0d9f55e9fcdc8efb7194a54a6a445ca09e7a86cd00097a7c',
                                                                                                                        'wave_bytes': 1659,
                                                                                                                        'wave_sha256': 'f244d3e6a5035f7316d0c579dcb8132450f8745c5baa7eddaf2f7be41d53ebc4'}}
SOURCE_CELL_IDENTITIES_SHA256 = "bb61c25860cfebd1a9e6c02048efe2f45b392cbb3b58279fe0d83633faec4512"
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str | int]] = {'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306916,
                                                                                                                                                   'cnf_sha256': '2ebae34e0cfe9a993aa9a45efa676f071766bd98f69342549e26233b0bcbcfdd',
                                                                                                                                                   'identity_hash': 'b3dca61762762a8a4eaa70d415e42b13a25ae08a35a31e66cf0e83308170c3ad',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '994312da9ad5317ea920cd47690180a4262ab0c1ecb3f3524e424533000f0f28',
                                                                                                                                                   'wave_bytes': 1663,
                                                                                                                                                   'wave_sha256': '756897004dd8478efb27cabf33ab24bc1db7f8b29f74febd2f31c0215dcfd877'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306915,
                                                                                                                                                        'cnf_sha256': 'b24e9c4260ea103da7590ff9cc9a51397bfe3081b654ee33917500e76d7d38d5',
                                                                                                                                                        'identity_hash': '78e386a3bf35e7302defd0460091cf5d2d9be479b8b5e20588b763cef2c153b4',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'ccd89cb49ccf718a73ede8c3dd8ca23559b9a4b4e09a6e96cff57e8a7b4ee3d9',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '2a5f64d90c202db16d78c6b83853c7097759d455e665ab0b56f27984474f110d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306915,
                                                                                                                                                        'cnf_sha256': 'c42914df52b3a5be54e7cb331896c778da4e90e2bbfe4dfc1b0ecbbd15b0a31e',
                                                                                                                                                        'identity_hash': '89d842b9d65a544a79e43c4f3d4af5e88ace3a0e532e4c59de52ac4eb8623424',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '6680b119ebe994645cafd1d83b40458546e3bad38f61766424277e99782b4d88',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': 'd1581e25c1400f60decd9134a4cff5412b74666a7f6a4ae9f62db6a60d66d36d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306915,
                                                                                                                                                        'cnf_sha256': '7cd31776af857521b85dca8e0dc7375c9daecdfbc456af75ee4258c6f63319ee',
                                                                                                                                                        'identity_hash': 'acd68ba6e324931e3cef5ecedda243fe43eaf07355f58fe415ce27e53e0bab10',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'd085aebc3e7039d2a08bb264914bee8860469dbcc7153ae8b4e66de3fe44b460',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '43c5185070ac4e6417a8f9eeb9b89ab07b62cda09a085aec6520d4bd81bd29c1'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306915,
                                                                                                                                                        'cnf_sha256': 'ec6b0fe6c3a8f622fd8309b2fbe83f84cbe7a9d384796816dc516aba072612d7',
                                                                                                                                                        'identity_hash': 'd16f7ee8ae05bb17f66bc76df1cf14fc94e400c32d454315969be60a132d910c',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'd09cbf2cf5ff61e941285490524a46e0fd912b680775eaaaa93d9be37e840302',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': 'b31feb5bc23bc99632dd45256a46628f5cb5f82fbe60df733053ce96a177c46c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-00-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306915,
                                                                                                                                                        'cnf_sha256': '9f622b37f678ac8d43fd8de544916df0eb2b3ce9f0d92a53d1d052113fd4df57',
                                                                                                                                                        'identity_hash': 'ddb07567716b7233a9d4a2b4ac576d4ced64cc40f08f7ac658794637cd166b3c',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '9f1b0c4505ddf19462d735538b39f2b9ccd043f3b94141d521c5ee6f733d77f7',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '59851aa45ce2bb1de58d2aed4ed080f190668962a3d68054ece1498422a50dfd'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306919,
                                                                                                                                                   'cnf_sha256': '5f366dbf84daaa915a505941cfb00ec5639a15414ce13a5e570bf8d6a8617c54',
                                                                                                                                                   'identity_hash': '013e4d275c16ca147d1c59a05d21e5816cad7ea317f981661fa460c6a1c6a261',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '3bc0c00aa5c3c1da3fe3d2450468d1f80b3941a2515e75f3d62727e3337067f3',
                                                                                                                                                   'wave_bytes': 1663,
                                                                                                                                                   'wave_sha256': '034e5b1b9085f23d3fa4d7dd66417495ac1a1d831f62e24d0a3b2012e5ac4fe3'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '722527cc2bea925b11b51319097873e8c4b4876fbe2dce20e41b50981a0f9d1e',
                                                                                                                                                        'identity_hash': 'aa7f09e5d7eeea1215ecd45b0ac2b5f74f26a6cb1fec642d1447e6eeef5a1505',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '9a846089dbbf163a01917ed104e3d1db0b99d8d762eee1ffeb8488af04eac452',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '79b1b4f04b1b5422317124e136b92616b49d5497f60cf2b7767683b66ab2f115'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'c016820b5984e0b981036a76a906a05942972676501170c907afcbf31c577e30',
                                                                                                                                                        'identity_hash': '8428dc09de881a54cbf4d97bdf0bdad45026c686bef109dde90e14e18dd25dee',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'fe480a196ad3cd7aa8b9708b281753b04fdd5a70e37772364e35b97e26a6d474',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '1efeab398c53b0560227efa2ca1d28dc47bc58fd63348d0de2f008c6b62ee7d0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '71ff57b2af353382722c81e4c5a9d2ac755af8662061fb6b77b07d83651dcaec',
                                                                                                                                                        'identity_hash': '6e0569edd43e8a7b4346e8872315e076c21350840f4fb2119b344075a73639eb',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'a1558784213fe1f5d11496049ea8a1a3b9bd1146dc689732cc12f39c8843a939',
                                                                                                                                                        'wave_bytes': 1673,
                                                                                                                                                        'wave_sha256': '3005333a796246258476fc8cf9414eaf033bb134c69c9c71d83098a21d32a442'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '90c9aa06b2b528160810a00d2d4c822e87df9139444b084bba30eb2366f8e5af',
                                                                                                                                                        'identity_hash': '14892410893c39429ead6d9b03149df777440fcb1202dcc034fa41c1a954e06a',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'fa63f4472cc64b1cd8892fa63bce31e6c95d25b4ae470e148568ae65ad82a61b',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'bd2d05195e6ddd1401bb70e0f5b9ca7a933c6c7f28829d6df986f43c9c186a68'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-01-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '66692189b2236450979ec57cc3fc0cbdcb52062e9da571759e8124c420e6815b',
                                                                                                                                                        'identity_hash': '62cd2150a2ba6e36e96354dc8a2734679fd6e1132ba0e6a56e58dd9abf0d102d',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '8bbeb11c45c18702b079b7fc18659d02e2a45add9b9956168b492becf3834ead',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '602d81780adf0b7baba542f1b9b5a106aff6ea43032b58323608969021cf9d1c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306919,
                                                                                                                                                   'cnf_sha256': 'cd555351507fdc28f7338818094ddc31aac9a55502ac33eb0860bf918137b87b',
                                                                                                                                                   'identity_hash': '2a32144e6ccb341c886d8e27417ff03b7a69463ec6a908e90cb9d95cf8b48b23',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '4c9d7fb6fe8bad0cea4cf65610a293c213e399556f9d17ddf924184b98358af4',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '78677c044ad98d394805bd45408bc526925b954922572546bb549832d084521a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'd183b0d5cb4fcc670f308fb09c3acfb5039d1b3c0dfdee2d389d8221dbc05aef',
                                                                                                                                                        'identity_hash': 'ec586c45a5c6c05496237aab5481a6a4cedcc032a39662968e9c8a5d85cc0116',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '0136f426f138eeb01ab07b2fe10ca436ff4dec4f1b73470826656d4ed1ea6103',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'a478ce2697c4770af4565e87ecc36c671ae0d86b09922367fcf8526e229da4ee'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'c23f32c5f78d45369e4f2c510f5484c5040393f557f1c3ac1518ba21cc374e08',
                                                                                                                                                        'identity_hash': '0282ac448fb7282bfc0f58468e03fdcdc79af71bb22eb9579cb6ebed8010e406',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '9ed322db04e4b3b15cd2d88160b96f183676ef8abdfa2ac32d1d59c795a2dd11',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '88242998f902874ba1843b1017bd78524c6fed196b8459bf402d715d9c91c13e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '074247c339e4fe2902ee328fbe298e76433048b9520992a3724551a47d55a714',
                                                                                                                                                        'identity_hash': '520f9f426af17f831a3f7b5832e72cec25fab0324a78fe91a081ba3202a54709',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'b6598199928329c779d33fdc535a8ba8e48a17da7fc0c06cb71cf0f0436a2066',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '90eec039eecacb4e0c8c5f06f044fd55fdb2e444d07be5ee4ed42b907f3d1053'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '719b72bae2a66a86a538015c2bd6ffbf33664f847d4d3b0162c73c501760d587',
                                                                                                                                                        'identity_hash': '132f9cea1b3cd78e22dec6982150b4f2f7fcc5b2b4dcc0199fe078118ef319b4',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'baf26988bf42b8f588c0f6ab1cc3d71f2e000931bf7096d02f9f5424d4d916d6',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '20bd4fb02c946bc64b23c2a92ec83e90fd07d5989f05f668d99a5ec9dabc6bbc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-02-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '6e94b2ac28994699379c17012868c5cdb08489f9695ed30125800d47b1d76a07',
                                                                                                                                                        'identity_hash': '0bbe7c8d35b3bb7efd03fdfad18542a2140e114db06605c8b7b14dcc68417c12',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'd958d03e31b35ac9faeba5a4c8647d1141674656997d04e17f799255b18876d1',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '0afe8ca9017ba5519a8e476d0ba34b3f2fcac2f2aec3950d788eb9be990bfd15'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306919,
                                                                                                                                                   'cnf_sha256': '0dce5595427543cb5bd2cef7f05cbd356aeb9f18f434df50be4c999d3ca0c0b6',
                                                                                                                                                   'identity_hash': 'b93feab90beee28100b3e4b105f69d052ddd0c065652a3139be0f6cd98479350',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': 'b952b413b2c855868bba189b4f361be4f4a9255e87794c8bcf6240912c2b28dd',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '8c23c3548e5a8f88e3787e43fbae50e01d43caca9eff9b8ee359c06ba5a86583'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '23fe0863b5309cd6f936223ec7b2fd4af4fbe63136773b7e6cb6931821c9f76a',
                                                                                                                                                        'identity_hash': '235b0e7d881ff052017baa363e0de9e266317b295de69520e566ab70a0ef0575',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'dc2e2365cd98dc9f6ad42aefeb2f333ee9e702ec339ce2b7bd0d17269c18356c',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '995306338829fc9c754c4b83bbf7562c93869236d9586293ec7bd6956a9e3d4b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '15343e27ab9ff97d47005cfa06f2c7445957d0e12c1c59f3d9bbdc0ac325edde',
                                                                                                                                                        'identity_hash': 'cb20fc0cfc216a00a712ea238b0e7228a8227cfa354adfe0d2b69b0ed8334399',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '4ccd371e2277dea0a0efb7613a64800bc5c81c08789a48f6d4b880ae6fade2fe',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '583c19f8d43cc12300b48c2afaec3e9a4c2db4c3e6e156c15b20af102e723e88'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'b11f40e4611bb8d474e9e7f0691d0e2c5651578119fc377a083bc488c23e4d34',
                                                                                                                                                        'identity_hash': '35c438ebbefea0e52f93608347423610b4a01f900f4ac5d56341d186ab1b9eee',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'fdbf49b7270eda52baeb40c915920c45a13dcba6912e03743d044eb65d974261',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '7b72ca40849004f3aec1e07f6069eaeb72990bc3af590ae4b9651f178bf63d78'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'dcdd724994cbc417adedd7a74feea57efdacd8156dbf8c86139a1c8cd5f8b32f',
                                                                                                                                                        'identity_hash': '9aa59b3b210111bc9bc713d955bb553b968bd642894e75920f3149b54a71a7d7',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'c3342406346f684ba043bddbe8feb9787e4f07334ced23b2efc7d296bcb7d444',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'cbb93b6db7461ab6cae0a55b5b04f1c51afd9dc8068a2bc32cb8a5d670a3c97f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-03-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '286e545a6f28850bfd1def23cb239455ba74c2d38094f713f75e3b5c1b1a59e2',
                                                                                                                                                        'identity_hash': '7381643132c7d22bf8d395762503f795e6c205112d99bb3953147e01993c4f0a',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'd9961cffa678d3b46c8b69a4e1eb115bc8bafbbdc5bbf56a7611eb6b8370ea5f',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '49f306cc16bd955c0a3c9492e4bfad84ffcb844d00b3a88cdf7044afd2a86a2a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306919,
                                                                                                                                                   'cnf_sha256': 'cab875acded93973da3d1658405a77d9a9abf0fd45abc416349add19502a525a',
                                                                                                                                                   'identity_hash': '2d8951af268f9f2e3f3e49bc05955fa84246f623b2ee6e2a8168d26755ef6fbc',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': 'da341a36891e8b85637537702a29fdaa5cf071c510968524560e0d847f8c4d7b',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': 'c7875bec612a1e7abe7066ddc338d0748fefeee4a502f9572b729aeb08e92237'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '6548c7294b370279c1b5ae783a0201c060a4d7d910e251293521d4ced34f7b2c',
                                                                                                                                                        'identity_hash': '3e7d6b3302e1bf0d5237295f6046905bcfcd60607c464bec4d72986d96a3712c',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'c9e88a15db5d9738228d1eac0ff46cbbfd3b86703245bf038afc10a82794f9ed',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '5fd7013eeb8889e8ce00b1cd2230695bf6e0c513eb054609bd5a0649709a29f6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '526f0b3cdebfa3eba149e8e43450a58b3c8a6cb963e0ea31bf32f505b4d2cee8',
                                                                                                                                                        'identity_hash': '9549087624d60804c85d653e42dd3323a4f82836a219e3b530ea80b8f18330f5',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '5ea366dc520c33a94bf5876a56fcc7ec8746b444d77e747df7b54043e91b3865',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'de633fe1036012e050a8150c1cd9d6dbc36482d0b3a97141bd3f2b1a0026c145'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '30761f5dfc5b4cfca58c9435e1528f06c6505d7c7d031f5ba94c10a7b4bcb1c3',
                                                                                                                                                        'identity_hash': 'adde42ad30e7a257070d84ad201993b4e9bcc469132c23e2afbbb28f5379fb35',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '2c241a68468c60fdd90753f9929d0e53f1db15d2577965a4706cccc66a3fd381',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '1ea3bec06cd8beaaddcf796452c4fb1e63a84d6aec9801b33a824c277b82680d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '6c4c10372c1d19e6ce03a67061f3ccc0cdbab3a215589589864fd5e257ffdc37',
                                                                                                                                                        'identity_hash': '15834ce0e89e0051fe32352b84d42ae09e4beb6024924dd74cd20f75be2ddeaa',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '82773562b61cc6c3ea0327cb38a15b75b571dda8d56177a260b9d91ba688aa64',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '2990c4d4f3925c243b0f1e47a4620f8a7f72a8dced8592b4d86b14352c5df356'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-04-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'cc1a69bd6adbb862542d1d742fd5daca4f79ea7e765e7c02e1857637c0256f0e',
                                                                                                                                                        'identity_hash': '0670e54aa7f259a1184fb85417266a61de8eb480ddfa7dbce39f5ec243b51c5d',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '9797fa8d1e7c6ef9082325bd61cda70e6ce7b51081a3b67bf29f926febb54b94',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'e813b14e7dca6105658eb064e67a798dde4c482488f27c9f6f59875aa5a0d5f6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306919,
                                                                                                                                                   'cnf_sha256': '877cdf5a229957ebf5d832e3f4f0b72056dc62ba4dfcbaf1d97a63082e596304',
                                                                                                                                                   'identity_hash': 'f76516c36a0a9d8112dc3de734b76191d27dcac3cf0aebcb0c869282824d1a03',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '263512ce411c5583afbe285b3b2907b4f088d4faa7f11d8e4c05e38ceb8d719b',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '13edf6f808a19191ae4bef928e0b89acf5c49d4357c8e2181cecacc794ccfb25'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '07138969dc66eef8c9fa24d140979e111b4f5befae88e4a6337b896697747225',
                                                                                                                                                        'identity_hash': '4134be3cf77ecaa269a66080bf32a06013ddbc797e01613483fc86a839ea5a56',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'f6e393f0860e9889a064192c3a7db99d9a939c2c442ebfcf71fd1a32d99d87be',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'e9b080f5d69f4dade5c3c7f317a6a9e12cbff383d30c642f2ebaeca52f1a05a4'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '77b8620ce924e222f3a1907658cbf681d90322b92be949fe2aa0685f475c1d8e',
                                                                                                                                                        'identity_hash': '06bd3c21e69eba41ea1d84361d2544a86aca52ee6962e6081ba8c517839bdd47',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'a26eff143754a929555dc470c8f97bbdc62bb0836513d2c2195c98aaa1bc72fb',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '25773654af0a7ae27313bddffdc8ed186ed0cf22f1998e431b68019640f0683f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'bebe653852dbf26a164dfe197749bc6e7d511d68080a1cd17b3c4a58f060a19b',
                                                                                                                                                        'identity_hash': '799f8c0575863e418b4571d92fa95b034999ac5006e23dd9b50b13cedad0e290',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'cc0de7a28630f618642da8e47b7b66945cda337f537ed88f30dc414e3813c2d2',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '1c97af9549e3a0e064d6efe120ba3f403c6fcbc02e519cb23111b1e9551dc9fe'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': '9155e5def402414adf88f98b26dc669d6ba5bcbdf7a4a81b16d3bb23834bb8f4',
                                                                                                                                                        'identity_hash': '660f54e9945d2d0ebb912269dc109d8e48d54b5c8d903e561fc696da0ca2d4a0',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'a51b76e2769fba518074b6dd85b2ac6a4056c4507278a44c90c4aa64270d2584',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'c5d1feb57b84afca72daa7a7ce803eb05c516c83c04832f54e1147d931a65feb'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-05-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306918,
                                                                                                                                                        'cnf_sha256': 'e0715074625192c73ac01c1dcfbcaf360a42f9f2b6168e8ddc6155186322ff54',
                                                                                                                                                        'identity_hash': '5f6c59ff5668891c6939a9675d5dec464836b3375304e3cc0e6aeaa35daa25fd',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '67216179e4c655b208e73d0431e3ffb73821950622b7d8d32b9bff289a3c99da',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '6165374ad42c990b74f1bf3a3ef554cdaaa3b1ff1561c205c77fdac6348563ad'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': '4283f66311daea7bc7c53beecac331c0e6890f47cbd6aace8cf0369471fae1b4',
                                                                                                                                                   'identity_hash': '3f6e7b42171d61751e259452c306d478e7d6ad5de578e8d6701c52c13c9edd60',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '8cc1373bcc800080a9279fc5d92422a5b3cb8a2ec8c2d416ca8b489580fc9e16',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': 'fac032bff91b0779278b0f16d60f4518b03db3cfa2092ec12b13b86059125029'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'da4025847566c71da1950d7dbc63efd12def6c055abaf8349cc1752a30245c1e',
                                                                                                                                                        'identity_hash': '9833dbb691adca35c507b99b878b2d572fbb47a37f3bd7a86d4cf94b6e812787',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '873f561cd0144f1736bac16fca7bf30b4e8ba3188cfb07f6835c287bf019827d',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '95e3965d3f76d60b7704923f7cf30ebbbdaa082371375ca4e4a2abb0ef900427'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'cdb16d45cec4c794d9c486b106f40862447c11824db30c11984e0fe8ba332622',
                                                                                                                                                        'identity_hash': 'cbaf00e0d012a3124aa3e12a5feeab36300e4ce241609d92261b1daec2e4ed17',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '4761300987b09e89ae6d5bf2a270d7d34c4d2bff4b93432cdb9a36185332630d',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'badc8ac2754c939512af584ea4f7787d982b8190d815c12112316da487c61109'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'd88847ad9a36c5e0548813ca02edaa1fb5b8d6273a412f46aae774cd47335742',
                                                                                                                                                        'identity_hash': '678311050e10ad663e52a608bd94ab5fc66105575c7b0116768f7f6233016453',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '0f8aca3402bcaf812f10ef3e2a67981724d5a454e7feb3741a776c1075db8ec8',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '349df813158cee722a05cd1a2d9b2928fc8ce8c77162a996c590a6bbec0677f0'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-06-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'b741873d182110729ee63262684a12323799f3ad40267d7df9a7a8b8205a4a44',
                                                                                                                                                        'identity_hash': '662f8607645e0fb7eeeb1f7625b6400fae976c73de6a575a00582673fbde8943',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'a40c8c086487e5bb1fce38911083abc115bfc2654f0beb9a0d907a6938bb8238',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '3ded8d406673e4fbe52b1ec96e64777befee65c069e8a3a3cb6babe616664df8'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': '734b06b8ffb180b1dfc04f2893636067d8614fc4a9af787ebafbaa418061a150',
                                                                                                                                                   'identity_hash': '6826b0928a95b9cf7ef05266ef17cc02af250a80d6aa7b9ec58b14951e80d887',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '358d9daf7255c7c08aacf25032b36b2ab74c5243ef53da21e810f23e5bea053f',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': 'fae475c07dae71fa453f6e59c55d785d7cd4a5bbcb83f31504d2df58832f2748'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '7f463b6ec13957af4240305bf7de7058aa3e9d22e5db4dfb37de24a61aa2a3f4',
                                                                                                                                                        'identity_hash': 'c3bac8fdad989e849a489cdb9031e1c1f3ef390764cc16740ff11768d5b830a9',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'b81e65e0212dc47734524b16fa4a67d706f4a6e35fb51253b500f3b193e8204a',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '673873c1793dc2c82ee7132d675d5254618a3321eecff1d7fc74dce1450f9d83'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '53f9b500f9965a0a257ab2c1b37d3ee8910602e1a993f42588aba40d17368af5',
                                                                                                                                                        'identity_hash': 'aadc1f2e5e9467dcc9c12e60d6da7766da64e9f829844e47751ac1ce301d98eb',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '38f2446be954d0349496315bd10cb11c937f8062d1834b33c3a2322613092f01',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'afd3f0d25901f6a17071c31bfa152198d92576c25bab65d518f6722f99d39859'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'd3913e986d7755fcb84f9385e9fe256c25fe84860923bc2d90aa34e7831692c9',
                                                                                                                                                        'identity_hash': '6d100ac0db04bd5c82d3a6368c9474968b7d4cbf843c830f97d52fffab63d92d',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '1601d8898a6f2823ea3fe9e24f1b7d3ecc1cb3681346243f193cc750acbf87a6',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '91d84f9baa790f214ec5585c225c0fe51e5b973972c24b31fe7a94ea6dbced3a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-07-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'a2d20708a8968c2d6c1f5bd3fc174ce1abd728d5466a13ee002f6892bef87a6e',
                                                                                                                                                        'identity_hash': 'c212d8c2d090a780a2326afed05b640d8a5eb32f8e5a1f1eabf07e41fd376a1f',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '2c6c442fd20eb1ce52bfb6b5c3b0da5fdaff34da2be38004d34e8306f105b9f0',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'e452fc1d5b76d19b13919a478b9ae395333a8bd6aeab6ddb605dd72698288826'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': 'b82a396736155ed90788f5d092e49ce066ad6418d17d054ed9e214573f2e3bcd',
                                                                                                                                                   'identity_hash': 'da83fc27fa408abdc2f98afd6c709e018af5b87ab5ed87ae98d116b5aaf85315',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '5b812f8c8a74475d52c240d06bdee5bae71104663faffe3e2b65911a1799fe80',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '26ad1c172751ef60cbfd6712abbd74107eae1f1a583944e2c0718701441cc202'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '012fce69958c701e3abe5ad574662add55561b77eeee567d8ad120cd0cc292ea',
                                                                                                                                                        'identity_hash': '5b8848726e7c95ed1abb545bf2ee3c514a27d07110c79cab1d888999c9034b85',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'd0b45dcc7f68c3de3169a0d472074ed31ad349ca30b0481fc9a8eac5ceefe77d',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '37dd8183b4dd758c987702abb92319fc7e7b26976aa80b40d6196e9e2914de7f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '93c72a7fdfa35b781344389962ef011c7f0a9a7b25850addd0c70bb2add10742',
                                                                                                                                                        'identity_hash': '978d53474717ccf19da9090bf70d8b92a6e510b5db14d00806f680bf5b2b83d4',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '32dc43972ec9e0af7c1dd97b883e603ae3984fa393e9ea022473631759a32248',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '1fe1a0abdac1c4ba9915d7fb8a56091b6e450047b688a2149c21d3446332e9b2'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '80f32d7d39de4657f8415aa9e876b21e1956d1d507743348aad7db2d22480ce3',
                                                                                                                                                        'identity_hash': '5d0c6260d320c2ec2d50ef7cbba529ae24545b8f308e12ecaa8f4999f23435a0',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'c93408c1a4bd352b427de36e9e1af11ce158561a2f04b11c3dee9cd758179733',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '6e776fd272e098c8f3cc7634caca7ac0031debf38a2cb9b106d0bcb74b5e3741'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'ca79432fa4c21b84992dcdeb6af218de70edc23a127e08c7fc8087a17d029a65',
                                                                                                                                                        'identity_hash': '30bf354621fbbeaa74cc60adeabd40adc12a5bc0ed808330b0b3b234cb8e58da',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'bfcb960f46377f360a1b6ee8304a19b003cb955c907c2e9267c0694248d0f306',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'b185759039fd1d0696e4d0d481f5a161ee995b80fdd99de23ed55d1e4900d59c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-12-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '92112d08a778ff26ba3e276a8bce79b71b873d42df34731e22ccd1426da86165',
                                                                                                                                                        'identity_hash': 'ea605a2bf323913a237462aed7c2fcd7cc4fcf27ee9fe61ca6606bec2eb0c78b',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '1f560026f0b02f53dff4db148abd09ba6856ac466e8559c360cbf02212456499',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'a92e3ceae94a4de018aa4736bb7038b534c25e1b4a004447ee7b69d6979d87bc'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': 'eb54127164a6a409833721debbec58745a68574ecb49c0e5766db1cde8773055',
                                                                                                                                                   'identity_hash': '25cfabd5beb216da4b1810f9df10ce5fc463406d7c89c3dd3044af13e970b697',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': 'b9f70e2ac7eb022040b1735d18efb9463ff9fa0b3e1666b0d6d3979a4af6250d',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': 'e5607f55e5522a30fa901dee64f4a910d45325d515217d788567e6af0b79cf5a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'c2bf3364c081d50f33b63a349a7cc4ce9e05a82beef908da19d5b80ccdf986b9',
                                                                                                                                                        'identity_hash': '3d2ced30edb4dc55399acbc60b34367e7dacd33098a888ec16c176111a85226b',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '0efdb3baf6835a5d7e3148dd85bc9bb9cef1e86553bb57ada848924b1630fb56',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '04b5737df3ad3ac0264a8b70e1f7eff91b87ff56b25fafb6f44cec2136e27e1f'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '8fc7654de5af0f78816fc788be8e6dfa671fce55cfdb0020b0add7b137a48c62',
                                                                                                                                                        'identity_hash': '378b78af69c1076fac5206f6916ad4d146e46f6f7c629df809fe54b3eab41ca4',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '201c686e8808ad09b634b3f87b445b1a249f4edd994e6fe47a3c48b75d1fa205',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '81b31f4e018e13579b3219b0ce56f9876544ff2ae56c17d78c82b85fa25d06d9'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'cc168383f22917ea6fbe37f7ce22a76787e65630ffd5e8291e2a0deb073ba221',
                                                                                                                                                        'identity_hash': '52bd4bcc8d5da1a4f67b05a60471615a9cdfbaa4aae223556a8c07d6c0ef76bc',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'a87ee8f7ab10b7518387686afee042091741c6a5711157b4e3af76c1dcda5598',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'bc9e6d3e4bbd7b47baf06ec0ef5b581fbb3d75e682693f247a3cb3cef13d5690'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'c7529ec6a6f7d7f9dd43ca5411468c886de74bfe2f6a8d2e114a83880748f43f',
                                                                                                                                                        'identity_hash': '9f6ce966a3f441ac3597c62274dbd141b71543fdf73eb05343f8015a9a9eff5e',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'baa5aad45900263a7c4e016da223b7b145ee214d5b6b7a64ecd978b7e942fe8d',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '72731db650bff2314806ed5ba5e91b5df9e47b84cf53d6ae781a9183f8a2eaac'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-13-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '62cb25f4dd5f474f645dfa3014d3db7cee97cc717cf1284f27aac86cb2368cec',
                                                                                                                                                        'identity_hash': '8ace2420cd74e313d08f28995c81659f1d407fce79941bf1033070ba87f85e3e',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'c1930e6ed1b976904ad7a1133a372c51865b335a9b70674272561f7553041fef',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '964d00b4595fc096e6db8fada1acb6b5f5739d86dfb9c4ea3df490de7e5df3ff'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': '1f73cb729a8061372e9407e3afe6d83d99bbb6a066d6bdd97c95f9d4e444ebc7',
                                                                                                                                                   'identity_hash': '359b26212b79ddc167f9cfbf6d404824d9d1635e266276da63bbec5fa058008d',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': 'fd5fcfbe74e85731893a5b0364497191b24c8f7833e64a9ab017c425f33d205a',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': 'd765f0a4f73c8fb476c79dbf6e744bed84b6df85a4c46cd3ba33da8c70541784'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '9386c66b062ff256d0ec2dc58eddfbfe509024541bca03a58cdb95052a60638b',
                                                                                                                                                        'identity_hash': 'd82e4a6132a68ebeae6bdfacdd89ab8f80d26d3068d371244c941738b9c88a22',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '103b696740d735e9d879cbccb3bdc65910c1d2e9d886a0705ddbe10be908ac3a',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'ef1924e770b093df15ab38ebc73df3e8b23ce9c333a72dec25114d4e5ee7003d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '6ddf867f04d6856125fa5370df90173eb0bef1851da88f7f86cff154187d663d',
                                                                                                                                                        'identity_hash': 'edf782585d292a11df7e47813f1b29f40d299f2d9f90e1e6bf6cc77f42dc0a50',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '54bfe6faa308f00d54e0640be248697898ade855325875b2dfa7697129c44cb0',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'd918972a62efd5e4c95d1baa9b564e313131340511c118b4ee183dabc15b809e'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '643794aef7848ec5297ed6d00063eec54e554e3dc2b7ae9dbdd7b3e061b720fe',
                                                                                                                                                        'identity_hash': 'af5705a3b48c0fca57c131ee1bd283aeaabb9d799911f1405ce302ab920d8042',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '62a186158032b0ce5a4f441689cd557fcf06fe637acc71eccde437d848200fb8',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '4df4792ee590fa3f3d616c7f8b361ccdf773f0b2ab4951a1bf64619548a518ea'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'b82d2647fa6936b860a055e0bff6d81aec9bc8af675999d233fa3858dffb91ad',
                                                                                                                                                        'identity_hash': '07410e0af25749a0297ba4ca1fae699d18ebceed7067e53776a47ca7bf76fc83',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '0d36d5d1d2bdd6c04acf21ab9db48d27ba37e6bee2026e9228c95e789b3d5a85',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'c6da66467171e0e965b5eb1f200fb634030973d096b5b6fe3176a833416f3484'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-14-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '1e1c30d1646f6ed36767c0b8f3e32b178ca8c00d25092ce8e77b22bcaabe488a',
                                                                                                                                                        'identity_hash': 'cdab7334c3116764b6511722d30898870770dea187901ef6fff307da43394155',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '5b3cdc9987150f50e28c6ba280a6a7deb0ae275fd8315c94e6110e3f64529f21',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'f61497ac1591b8c57f980263aefbec0f03a3f395860b970d9e44330c56867563'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': 'a952d6b85e86e914e76b6dfb548616c2b9ee5a436cc78f3a0fb45d15ebe91615',
                                                                                                                                                   'identity_hash': '5105b1c5994f2d329f24ab1527321fa7f08528300efff8e8d418d5f217feefaa',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': 'f50adec2b43ea48a97a05e0b87ea0c0191dae038f4a8e9ddcbbe8157cd6f1db2',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '590e4c086c43916857a74d70a4474f524984b0dc4e86d5e97f560d06cc3c98ad'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'b56427646455f3e78724fec08bc86f03c2b9a32837ab89ddc07fcba462e1a417',
                                                                                                                                                        'identity_hash': '4b412c6300d408c655587e3620e7adaeb8716915f841ed5f8d3d870e337e626e',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '8625e9fca5e4784666e743e57c69b2ff66e422fc5deed9d465d0d59929e0c190',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '199f1a341d415b08f1f254c38a805c6378ba9582f2ca89c180c7936d80d2bf17'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '7e44e2ba0d0022d565f9dcbb817a7647b2f4a5fe7a6a614935ad438d27559eaf',
                                                                                                                                                        'identity_hash': 'a0ac8e27b451c2bbe4979ad6e3a644b527a3e67a532ca809c9e231ffb3305a82',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '911731fa2b682be62abbb889beba0d6882b08acbadb6f676fd9d39a9bbb1a3ea',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '721ce7b424cb970fa481683149896afdcafac8afc683b26d7bf3940074c8567d'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '06b84e974f8b3b6bca728bad59ab0412134655c3f48a6ef5e8d59f31936fd97d',
                                                                                                                                                        'identity_hash': '868b6c4dc9e441d23260463f525f2eafa31bd7ee2ab9001fc51417e064c31387',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'ab27bdb3ac95fb6144aa40e7d7fe6c2d11051eacd25bd44beea0a0b584171739',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '0240163ef51463a6bbcf296e13560abea60d320ab760a47b23ad0386e5bd35bf'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '96b0193fca1c64c0999e20b137bdd5638158575584a377d13861e034e40ad222',
                                                                                                                                                        'identity_hash': 'b53114cbc69e9f7ec94cc9e2b19fa65be22670a718c27617f3a9e48dd4404159',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'b496d5ce570b81d567f04a5fdf21c7bb4601d1be407fc9a3fab512db72360f63',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '71e3067c5c0efd9e7fac31e9bbe7b87cf6b854107c8afbe089a52e666a923fb6'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-15-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': 'c09146597b05201b36597b8243230f841134c24f258a716d1e6b02fa71929f7c',
                                                                                                                                                        'identity_hash': '6c2b2518e9d2d5fad275082c5073237b0fda27c62a76e506c6daff9c2f5ce969',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '1e9105797a88810be3241d3f98154b3a7fd683243c9a7b28000e4fc3743e3a6b',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '055bc3f7f4ab4fe026a771374cf72f073171e57c9423c9a16f1c233e5fffb49c'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-none-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306924,
                                                                                                                                                   'cnf_sha256': '50f5ba45370d4deae121fe3ce207137380de242e17aa6d1101cefba3cbdba9df',
                                                                                                                                                   'identity_hash': '43a962a6ec65c5ffc168575751e7862b53c55cdc6861d39115d37fb7833b9d33',
                                                                                                                                                   'producer_bytes': 8992,
                                                                                                                                                   'producer_sha256': '5f55f7bba9a37bf5212fc66a1a397a7eaa7dd2842c9dfd96e273d4f1d4f2b628',
                                                                                                                                                   'wave_bytes': 1664,
                                                                                                                                                   'wave_sha256': '82cac33a3c5b016664e49034c0a6c46e3d358e50cfa64bbde9c15b9a80a75bab'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-06-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '5a29a11aaacb77ca536dba7c995bfedef63a5f88fb60bf591b653a66cccb5a95',
                                                                                                                                                        'identity_hash': '2243f28f9eaad594db2c1b75dfc1e87b981b6294cfac80b4f959cb0f6caf1400',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '15633246f73ac16011d0cd872e121274cf63e59eb2c76646d12694f5e8deaa9d',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'edeb0e2c2ba4cb399caa611761e0388d71068c62ae81e601c2c63b57768af62a'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-07-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '62d0ce7ffa1e7286271e80a756dfa3ce81c5d2d96904a594e84d8870e6b54d98',
                                                                                                                                                        'identity_hash': '85421950525edf1738b4a8424f0aed5e12be8f7a3d3b216c17bd880ff83b47cf',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '4d56a54dd0e8b8b16c6a0fe0708b68a00172e4f976952a13bc1b487b147361ae',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': 'b05582b458e0cf19c3c159dd53ed44429b69432cf68d02a1b10d22497bb8ddb7'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-08-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '63656a0c0095ca96b99d5aff7c95b49d8c425e2b72d2263d0335635d126872a8',
                                                                                                                                                        'identity_hash': '511e14dce3d99991c929ab090251ace91062515a595e0bf941c8c5d1fda3b852',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '8a94ec286a26424bbd233970614e9d93716070f795a9c98383750c1ce17fdbfc',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '26675bdc5b30fca61a6bdf40bb13e8ba8463b8c2540de20b19fd5fec1c6dd3a5'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-09-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '0141961630f664235831241bcf4c4a7f1ce468c65449c041839ee6ecd94d714d',
                                                                                                                                                        'identity_hash': 'ba8d429efa36f9b79cf749cef8f4e29a7cc1f796ec2942da5d74c14667eb6c45',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': 'cb12a3c8f4c59aae2649f76f9ef60f9ef04850160bc341aa1cd5e0bd5cfcfb40',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '97e817313d2176f291c956828a49d405194558896fe46415d7bbd20d93c1da5b'},
 'canary-perp-bisector-survivor-four-point-two-circle-v8-two-kalmanson-refinements-next-center-16-physical-unique-10-sat-profile-cadical-1core-3600s': {'cnf_bytes': 346306923,
                                                                                                                                                        'cnf_sha256': '142974d122c64a6636b5f40c77a577a2fe448ef4cb3c5a0b8d323da2c96c3099',
                                                                                                                                                        'identity_hash': '18fd09dc0303c88f9c022c936b34f38ca5a39c8bf552931a2cce28b315092dab',
                                                                                                                                                        'producer_bytes': 9007,
                                                                                                                                                        'producer_sha256': '917d64e6c7a1949f013ca2a565f741b726baccb55f1749467c6a9a02f8506d14',
                                                                                                                                                        'wave_bytes': 1674,
                                                                                                                                                        'wave_sha256': '2fff629e3f04aa576aa16d23fc5be48d549902dd1d1f583734a8a72ff62fc21f'}}
PRODUCTION_CELL_IDENTITIES_SHA256 = "3081baef569945da87f5c2d652f44af4f5c486c3ea906a55fed3d38d231cf3ad"

RUNNER_RECEIPT_SCHEMAS = {
    "acceptance": ACCEPTANCE_SCHEMA,
    "candidate": WAVE_MINE_CANDIDATE_SCHEMA,
    "candidate_ledger": WAVE_MINE_LEDGER_SCHEMA,
    "mine": WAVE_MINE_SCHEMA,
    "sat_replay": SAT_REPLAY_SCHEMA,
    "verification": MINE_VERIFICATION_SCHEMA,
}

CANARY_SOURCE_CELL_ID = f"{SOURCE_CELL_PREFIX}-next-center-02-physical-none"
PORTFOLIO_CELL_SUFFIX = "sat-profile-cadical-1core-3600s"
CANARY_PORTFOLIO_CELL_ID = f"{CANARY_SOURCE_CELL_ID}-{PORTFOLIO_CELL_SUFFIX}"

OPERATOR_HELP = """\
Govern the fresh exact-17 V8 PIQD portfolio.

Commands remain fail-closed until the V8 Lean packet and exact source packet
identities are frozen.  Runtime policy is 1 solver core per job, at most 12
active jobs, and 3600-second solve and replay limits.

commands:
  derive-identities
  prepare
  static-check
  start-canary
  start-rest

options:
  --base-url URL
  --source-campaign-sha256 SHA256
  --source-campaign-bytes BYTES
  --source-run-manifest-sha256 SHA256
  --source-run-manifest-bytes BYTES
  --source-preparer-commit COMMIT
"""


class V8PortfolioError(RuntimeError):
    """The V8 control-plane identity or route contract drifted."""


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def expected_scanner_identity(*, candidate_count: int) -> dict[str, Any]:
    identity = miner.build_scanner_identity(candidate_count=candidate_count)
    if identity["runner_receipt_schemas"] != RUNNER_RECEIPT_SCHEMAS:
        raise V8PortfolioError("runner/miner receipt schema contract drifted")
    return identity


def validate_scanner_identity_contract(
    identity: Mapping[str, Any], *, candidate_count: int
) -> dict[str, Any]:
    """Check every cross-module identity field by exact equality."""

    try:
        validated = miner.validate_scanner_identity(
            identity, candidate_count=candidate_count
        )
    except miner.V8MinerIdentityError as exc:
        raise V8PortfolioError(str(exc)) from exc
    expected = expected_scanner_identity(candidate_count=candidate_count)
    if validated != expected:
        raise V8PortfolioError("runner/miner scanner identity contract drifted")
    return expected


def scanner_identity_from_ledger(ledger: Mapping[str, Any]) -> dict[str, Any]:
    """Normalize a real miner ledger into the canonical V8 identity object."""

    candidates = ledger.get("candidates")
    scanner = ledger.get("scanner")
    families = ledger.get("source_valid_family_inventory")
    dependencies = ledger.get("scanner_dependencies")
    inventory = ledger.get("family_inventory")
    if type(candidates) is not list:
        raise V8PortfolioError("candidate ledger candidates are malformed")
    if type(scanner) is not dict:
        raise V8PortfolioError("candidate ledger scanner is malformed")
    if families != list(miner.SOURCE_VALID_FAMILIES):
        raise V8PortfolioError("candidate family inventory drifted")
    if dependencies != miner.SCANNER_DEPENDENCIES:
        raise V8PortfolioError("scanner dependency inventory drifted")
    if type(inventory) is not dict or type(inventory.get("family_candidate_counts")) is not dict:
        raise V8PortfolioError("candidate family counts are malformed")
    observed_counts = {
        family: sum(
            type(candidate) is dict and candidate.get("family") == family
            for candidate in candidates
        )
        for family in miner.SOURCE_VALID_FAMILIES
    }
    if inventory["family_candidate_counts"] != observed_counts:
        raise V8PortfolioError("candidate family counts drifted")
    script = miner.scanner_script_identity()
    expected_scanner = {
        "name": miner.MINER_NAME,
        "schema": miner.MINER_SCHEMA,
        "version": miner.MINER_VERSION,
        "source_path": script["path"],
        "source_sha256": script["sha256"],
    }
    if scanner != expected_scanner:
        raise V8PortfolioError("candidate ledger scanner identity drifted")
    return miner.build_scanner_identity(candidate_count=len(candidates))


def validate_real_miner_ledger(ledger: Mapping[str, Any]) -> dict[str, Any]:
    identity = scanner_identity_from_ledger(ledger)
    return validate_scanner_identity_contract(
        identity, candidate_count=len(ledger["candidates"])
    )


def route_contract() -> dict[str, str]:
    return {
        "output_root": OUTPUT_ROOT.relative_to(ROOT).as_posix(),
        "project": PROJECT,
        "source_run_root": preparer.RUN_ROOT.relative_to(ROOT).as_posix(),
        "miner": miner.MINER_RELATIVE,
        "preparer": preparer.PREPARER_PATH.relative_to(ROOT).as_posix(),
    }


def validate_committed_dependencies() -> None:
    # The V8 preparer validates its explicitly pinned inherited support before
    # this adapter validates its own scanner and checkpoint roles.  Calling the
    # V7 runner validator directly would reject intentional V8 route rebinding.
    preparer.validate_committed_dependencies()
    miner.validate_committed_dependencies()
    validate_scanner_identity_contract(
        miner.build_scanner_identity(candidate_count=0), candidate_count=0
    )
    _validate_checkpoint_roles()


_BASE = _PARENT._BASE
_BASE_PREPARE_PORTFOLIO = _BASE.prepare_portfolio
_BASE_STATIC_CHECK = _BASE.static_check
_BASE_START_CANARY = _BASE.start_canary
_BASE_START_REST = _BASE.start_rest
_BASE_VALIDATE_MINE_INVENTORY = _BASE._validate_mine_inventory


def _checkpoint_payload(relative: str, label: str) -> dict[str, Any]:
    raw = _BASE._read_repo_source_file(
        ROOT / relative,
        maximum=1 << 20,
        label=label,
    )
    return _BASE._strict_repo_json(raw, label)


def _validate_production_checkpoint_payload(value: Mapping[str, Any]) -> None:
    """Validate the future V8 generated-root lane independently of code custody."""

    _BASE._require_exact_keys(
        value,
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
        "V8 production checkpoint",
    )
    expected_root = OUTPUT_ROOT.relative_to(ROOT).as_posix()
    expected_durable = sorted(
        [
            miner.MINER_RELATIVE,
            RUNNER_CODE_CHECKPOINT_RELATIVE,
            RUNNER_RELATIVE,
            RUNNER_TEST_RELATIVE,
            SOURCE_PREPARER_RELATIVE,
        ]
    )
    _BASE._require(
        value["schema"] == "worktree-lane-checkpoint/v1"
        and value["lane_id"] == LANE_ID
        and value["owner"] == RUN_OWNER
        and value["base_head"] == BASE_HEAD
        and value["owned_paths"] == [CHECKPOINT_RELATIVE]
        and value["durable_paths"] == expected_durable
        and value["generated_roots"] == [expected_root]
        and value["manifest_sha256"] == _BASE._self_hash(value),
        "V8 production checkpoint contract drifted",
    )


def _validate_runner_code_checkpoint_payload(value: Mapping[str, Any]) -> None:
    """Keep the V8 code-owner checkpoint distinct from runtime custody."""

    _BASE._require_exact_keys(
        value,
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
        "V8 runner-code checkpoint",
    )
    _BASE._require(
        value["schema"] == "worktree-lane-checkpoint/v1"
        and value["lane_id"] == RUNNER_CODE_CHECKPOINT_LANE_ID
        and value["owner"] == RUNNER_CODE_CHECKPOINT_LANE_ID
        and value["base_head"] == RUNNER_CODE_CHECKPOINT_BASE_HEAD
        and value["lane_id"] != LANE_ID
        and value["owned_paths"] == RUNNER_CODE_CHECKPOINT_OWNED_PATHS
        and CHECKPOINT_RELATIVE not in value["owned_paths"]
        and value["durable_paths"] == []
        and value["generated_roots"] == []
        and value["manifest_sha256"] == _BASE._self_hash(value),
        "V8 runner-code checkpoint contract drifted",
    )


def _validate_checkpoint_roles() -> None:
    _BASE._require(
        CHECKPOINT_RELATIVE != RUNNER_CODE_CHECKPOINT_RELATIVE,
        "V8 production and runner-code checkpoint paths alias",
    )
    runner_code = _checkpoint_payload(
        RUNNER_CODE_CHECKPOINT_RELATIVE, "V8 runner-code checkpoint"
    )
    _validate_runner_code_checkpoint_payload(runner_code)
    if _BASE.PRODUCTION_PINS_FINALIZED is True:
        production = _checkpoint_payload(
            CHECKPOINT_RELATIVE, "V8 production checkpoint"
        )
        _validate_production_checkpoint_payload(production)


def _transform_source_cell(
    *,
    source_cell: Mapping[str, Any],
    ordinal: int,
    cnf: bytes,
    source_producer_raw: bytes,
    source_wave_raw: bytes,
    source_preparer_commit: str,
) -> dict[str, Any]:
    """Validate and transform one authenticated V8 physical cell."""

    source_id = source_cell.get("cell_id")
    _BASE._require(type(source_id) is str, "source cell id drifted")
    _BASE._require(
        source_id.startswith(f"{SOURCE_CELL_PREFIX}-next-center-"),
        "source cell id is not V8-owned",
    )
    _BASE._require(source_cell.get("ordinal") == ordinal, "source cell ordinal drifted")
    _BASE._require(
        type(source_cell.get("direct_lean_bytes_validated")) is bool
        and type(source_cell.get("center")) is int
        and type(source_cell.get("category")) is str,
        "source cell physical/Lean validation drifted",
    )
    source_producer = _BASE._strict_json(source_producer_raw, "source producer")
    source_wave = _BASE._strict_json(source_wave_raw, "source wave")
    _BASE.validate_wave_manifest(source_wave)
    variables, clauses = _BASE.scan_dimacs(cnf)
    _BASE._require(
        (variables, clauses) == (NUM_VARIABLES, NUM_CLAUSES),
        "source cell DIMACS dimensions drifted",
    )
    source_manifest = source_producer.get("source_manifest")
    production_config = source_producer.get("production_config")
    _BASE._require(
        type(source_manifest) is dict
        and source_manifest.get("source_id") == source_id
        and source_manifest.get("source_theorem") == EXPECTED_SOURCE_THEOREM
        and source_manifest.get("source_path") == EXPECTED_SOURCE_PATH
        and source_manifest.get("root_source_path") == EXPECTED_ROOT_SOURCE_PATH
        and source_manifest.get("finite_schema") == EXPECTED_FINITE_SCHEMA,
        "source producer Lean ingress drifted",
    )
    _BASE._require_source_production_config(
        production_config,
        source_preparer_commit=source_preparer_commit,
        label="source producer",
    )
    source_encoding = source_wave.get("encoding")
    source_execution = source_wave.get("execution")
    _BASE._require(
        source_producer.get("backend") == _BASE.BACKEND
        and source_producer.get("solver_profile") == _BASE.SOURCE_SOLVER_PROFILE
        and source_producer.get("query_polarity") == _BASE.QUERY_POLARITY,
        "source producer profile drifted",
    )
    cnf_sha256 = sha256_bytes(cnf)
    source_producer_sha256 = sha256_bytes(source_producer_raw)
    _BASE._require(
        type(source_encoding) is dict
        and source_encoding.get("cnf_sha256") == cnf_sha256
        and source_encoding.get("producer_manifest_sha256")
        == source_producer_sha256
        and source_encoding.get("num_variables") == NUM_VARIABLES
        and source_encoding.get("num_clauses") == NUM_CLAUSES
        and source_encoding.get("query_polarity") == _BASE.QUERY_POLARITY
        and type(source_execution) is dict
        and source_execution.get("backend") == _BASE.BACKEND
        and source_execution.get("solver_profile") == _BASE.SOURCE_SOLVER_PROFILE,
        "source wave profile or encoding drifted",
    )
    portfolio_id = f"{source_id}-{PORTFOLIO_CELL_SUFFIX}"
    producer = dict(source_producer)
    producer["producer_id"] = portfolio_id
    producer["solver_profile"] = _BASE.SOLVER_PROFILE
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
        "solver_profile": _BASE.SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
    }
    _BASE.validate_wave_manifest(wave)
    wave_raw = canonical_json_bytes(wave)
    return {
        "portfolio_cell_id": portfolio_id,
        "source_cell_id": source_id,
        "center": source_cell["center"],
        "category": source_cell["category"],
        "ordinal": ordinal,
        "producer_raw": producer_raw,
        "wave_raw": wave_raw,
        "identity_hash": _BASE._legacy.preparation.raw_dimacs_identity(
            cnf_sha256, producer_sha256
        ),
    }


def _validate_cell(cell: Any, ordinal: int) -> dict[str, Any]:
    _BASE._require(type(cell) is dict, "campaign cell is malformed")
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
    _BASE._require(set(cell) == required, "campaign cell keys drifted")
    _BASE._require(cell["ordinal"] == ordinal, "campaign cell ordinal drifted")
    _BASE._require(type(cell["center"]) is int, "campaign center is invalid")
    _BASE._require(
        type(cell["category"]) is str and cell["category"],
        "campaign category is invalid",
    )
    _BASE._require(type(cell["source_cell_id"]) is str, "source cell id is invalid")
    _BASE._require(
        cell["source_cell_id"].startswith(
            f"{SOURCE_CELL_PREFIX}-next-center-"
        ),
        "campaign source cell id is not V8-owned",
    )
    _BASE._require(
        cell["portfolio_cell_id"]
        == f"{cell['source_cell_id']}-{PORTFOLIO_CELL_SUFFIX}",
        "portfolio cell id is not derived from its V8 source cell",
    )
    _BASE._digest(cell["expected_identity_hash"], "cell raw identity")
    for key in ("source_cnf", "producer_manifest", "wave_manifest"):
        ref = cell[key]
        _BASE._require(
            type(ref) is dict and set(ref) == {"path", "sha256", "bytes"},
            f"{key} ref keys drifted",
        )
        _BASE._digest(ref.get("sha256"), key)
        _BASE._require(
            type(ref.get("bytes")) is int and ref["bytes"] > 0,
            f"{key} bytes invalid",
        )
    return dict(cell)


def _configure_base() -> None:
    script = miner.scanner_script_identity()
    replacements = {
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "BASE_HEAD": BASE_HEAD,
        "RUNNER_CODE_CHECKPOINT_RELATIVE": RUNNER_CODE_CHECKPOINT_RELATIVE,
        "CHECKPOINT_RELATIVE": CHECKPOINT_RELATIVE,
        "SOURCE_PREPARER_RELATIVE": SOURCE_PREPARER_RELATIVE,
        "EXPECTED_SOURCE_PREPARER_RELATIVE": EXPECTED_SOURCE_PREPARER_RELATIVE,
        "SOURCE_PREPARATION_CONFIG_RELATIVE": SOURCE_PREPARATION_CONFIG_RELATIVE,
        "RUNNER_RELATIVE": RUNNER_RELATIVE,
        "RUNNER_TEST_RELATIVE": RUNNER_TEST_RELATIVE,
        "SOURCE_RUN_ROOT_RELATIVE": SOURCE_RUN_ROOT_RELATIVE,
        "EXPECTED_SOURCE_LANE_ID": EXPECTED_SOURCE_LANE_ID,
        "EXPECTED_SOURCE_RUN_ID": EXPECTED_SOURCE_RUN_ID,
        "EXPECTED_SOURCE_BASE_HEAD": EXPECTED_SOURCE_BASE_HEAD,
        "SOURCE_RUN_ROOT": SOURCE_RUN_ROOT,
        "OUTPUT_ROOT": OUTPUT_ROOT,
        "PROJECT": PROJECT,
        "REQUESTED_CORE_LIMIT": REQUESTED_CORE_LIMIT,
        "MAX_ACTIVE_JOBS": MAX_ACTIVE_JOBS,
        "SOLVE_TIMEOUT_S": SOLVE_TIMEOUT_S,
        "REPLAY_TIMEOUT_S": REPLAY_TIMEOUT_S,
        "CELL_COUNT": CELL_COUNT,
        "NUM_VARIABLES": NUM_VARIABLES,
        "ROOT_NUM_CLAUSES": ROOT_NUM_CLAUSES,
        "NUM_CLAUSES": NUM_CLAUSES,
        "CAMPAIGN_SCHEMA": CAMPAIGN_SCHEMA,
        "LAUNCH_SCHEMA": LAUNCH_SCHEMA,
        "RESULT_SCHEMA": RESULT_SCHEMA,
        "ACCEPTANCE_SCHEMA": ACCEPTANCE_SCHEMA,
        "SAT_REPLAY_SCHEMA": SAT_REPLAY_SCHEMA,
        "WAVE_MINE_SCHEMA": WAVE_MINE_SCHEMA,
        "WAVE_MINE_LEDGER_SCHEMA": WAVE_MINE_LEDGER_SCHEMA,
        "WAVE_MINE_CANDIDATE_SCHEMA": WAVE_MINE_CANDIDATE_SCHEMA,
        "MINE_VERIFICATION_SCHEMA": MINE_VERIFICATION_SCHEMA,
        "UNSAT_REPLAY_SCHEMA": UNSAT_REPLAY_SCHEMA,
        "IDENTITY_DERIVATION_SCHEMA": IDENTITY_DERIVATION_SCHEMA,
        "SOURCE_CAMPAIGN_SCHEMA": SOURCE_CAMPAIGN_SCHEMA,
        "EXPECTED_SOURCE_THEOREM": EXPECTED_SOURCE_THEOREM,
        "EXPECTED_SOURCE_PATH": EXPECTED_SOURCE_PATH,
        "EXPECTED_ROOT_SOURCE_PATH": EXPECTED_ROOT_SOURCE_PATH,
        "EXPECTED_FINITE_SCHEMA": EXPECTED_FINITE_SCHEMA,
        "EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA": (
            EXPECTED_SOURCE_PREPARATION_CONFIG_SCHEMA
        ),
        "SOURCE_CAMPAIGN_SHA256": SOURCE_CAMPAIGN_SHA256,
        "SOURCE_CAMPAIGN_BYTES": SOURCE_CAMPAIGN_BYTES,
        "SOURCE_RUN_MANIFEST_SHA256": SOURCE_RUN_MANIFEST_SHA256,
        "SOURCE_RUN_MANIFEST_BYTES": SOURCE_RUN_MANIFEST_BYTES,
        "SOURCE_PREPARER_COMMIT": SOURCE_PREPARER_COMMIT,
        "SOURCE_PREPARER_SHA256": SOURCE_PREPARER_SHA256,
        "SOURCE_PREPARER_BYTES": SOURCE_PREPARER_BYTES,
        "CHECKPOINT_SHA256": CHECKPOINT_SHA256,
        "CHECKPOINT_BYTES": CHECKPOINT_BYTES,
        "RUNNER_CODE_CHECKPOINT_SHA256": RUNNER_CODE_CHECKPOINT_SHA256,
        "RUNNER_CODE_CHECKPOINT_BYTES": RUNNER_CODE_CHECKPOINT_BYTES,
        "SOURCE_CELL_IDENTITIES": SOURCE_CELL_IDENTITIES,
        "SOURCE_CELL_IDENTITIES_SHA256": SOURCE_CELL_IDENTITIES_SHA256,
        "PRODUCTION_CELL_IDENTITIES": PRODUCTION_CELL_IDENTITIES,
        "PRODUCTION_CELL_IDENTITIES_SHA256": PRODUCTION_CELL_IDENTITIES_SHA256,
        "MINER_RELATIVE": miner.MINER_RELATIVE,
        "MINER_SHA256": script["sha256"],
        "MINER_BYTES": script["bytes"],
        "MINER_NAME": miner.MINER_NAME,
        "MINER_SCHEMA": miner.MINER_SCHEMA,
        "MINER_VERSION": miner.MINER_VERSION,
        "PINNED_SOURCE_VALID_FAMILIES": miner.SOURCE_VALID_FAMILIES,
        "CANARY_SOURCE_CELL_ID": CANARY_SOURCE_CELL_ID,
        "CANARY_PORTFOLIO_CELL_ID": CANARY_PORTFOLIO_CELL_ID,
        "GLOBAL_CAPACITY_ROOT": GLOBAL_CAPACITY_ROOT,
        "PRODUCTION_PINS_FINALIZED": True,
    }
    for name, value in replacements.items():
        setattr(_BASE, name, value)
    _BASE.CAMPAIGN_PATH = OUTPUT_ROOT / "artifacts/campaign-manifest.json"
    _BASE.RUN_MANIFEST_PATH = OUTPUT_ROOT / "run_manifest.json"
    _BASE.CANARY_ACCEPTANCE_PATH = OUTPUT_ROOT / "artifacts/canary-acceptance.json"
    _BASE._transform_source_cell = _transform_source_cell
    _BASE._validate_cell = _validate_cell


def _validate_mine_inventory_v8(
    ledger: Mapping[str, Any], candidates: list[Any], canary: Mapping[str, Any], assignment_sha256: str
) -> None:
    _BASE_VALIDATE_MINE_INVENTORY(ledger, candidates, canary, assignment_sha256)
    validate_real_miner_ledger(ledger)


def _require_v8_ready() -> None:
    validate_committed_dependencies()
    preparer.require_production_pins()


def _prepare_portfolio_v8(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    if output_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 prepare output root drifted")
    _require_v8_ready()
    return _BASE_PREPARE_PORTFOLIO(output_root=output_root)


def _static_check_v8(
    *, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 static-check route drifted")
    _require_v8_ready()
    return _BASE_STATIC_CHECK(root=root, run_root=run_root)


def _start_canary_v8(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 canary route drifted")
    _require_v8_ready()
    return _BASE_START_CANARY(base_url=base_url, root=root, run_root=run_root)


def _start_rest_v8(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    if root != ROOT or run_root != OUTPUT_ROOT:
        raise V8PortfolioError("V8 rest route drifted")
    _require_v8_ready()
    return _BASE_START_REST(base_url=base_url, root=root, run_root=run_root)


def _validate_runtime_entrypoint_routes() -> None:
    expected = {
        "prepare_portfolio": _prepare_portfolio_v8,
        "static_check": _static_check_v8,
        "start_canary": _start_canary_v8,
        "start_rest": _start_rest_v8,
    }
    for name, route in expected.items():
        if getattr(_BASE, name) is not route:
            raise V8PortfolioError(f"V8 runtime entrypoint route drifted: {name}")


_configure_base()
_BASE._validate_mine_inventory = _validate_mine_inventory_v8
_BASE.prepare_portfolio = _prepare_portfolio_v8
_BASE.static_check = _static_check_v8
_BASE.start_canary = _start_canary_v8
_BASE.start_rest = _start_rest_v8


def prepare_portfolio(*, output_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    return _prepare_portfolio_v8(output_root=output_root)


def static_check(*, root: Path = ROOT, run_root: Path = OUTPUT_ROOT) -> dict[str, Any]:
    return _static_check_v8(root=root, run_root=run_root)


def start_canary(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _start_canary_v8(base_url=base_url, root=root, run_root=run_root)


def start_rest(
    *, base_url: str, root: Path = ROOT, run_root: Path = OUTPUT_ROOT
) -> dict[str, Any]:
    return _start_rest_v8(base_url=base_url, root=root, run_root=run_root)


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    _validate_runtime_entrypoint_routes()
    _require_v8_ready()
    return _BASE.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
