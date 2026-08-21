# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Run the authenticated SixHitBisector six-cell SAT-profile portfolio.

The implementation reuses the audited true-EightHit portfolio engine while
binding every source, schema, path, and byte identity to the independently
audited SixHitBisector v2 physical-slice campaign.  Portfolio preparation is
offline.  The launch commands retain fresh-only PIQD submission, explicit
prepare/confirm/finalize custody, one process and one core per cell, exact SAT
model replay, and proof replay for every terminal UNSAT result.
"""

from __future__ import annotations

import argparse
import json
import sys
import types
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))
if str(ROOT / "scripts") not in sys.path:
    sys.path.insert(0, str(ROOT / "scripts"))

LANE_ID = "exact17-six-hit-bisector-sat-portfolio-20260821"
RUN_ID = "six-hit-bisector-sat-profile-portfolio-v1"
RUN_OWNER = "exact17-six-hit-bisector-sat-portfolio"
BASE_HEAD = "a3da66681867af79911b70c83a6ba6e2f72a47ec"
CHECKPOINT_RELATIVE = f".codex/worktree-checkpoints/{LANE_ID}.json"
PACKAGE_SOURCE_PATHS = (
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_sat_portfolio.py"
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_sat_portfolio.py"
    ),
)
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-six-hit-bisector-preparer-20260821/"
    "physical-slice-cell-campaign-v2"
)
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
    "two_kalmanson_six_hit_bisector_physical_slice_cells.py"
)
SOURCE_ID_SUFFIX = "-physical-slice-cell-campaign-v2"

SOURCE_CAMPAIGN_SHA256 = (
    "14d1bac3d84b821c5c01b77cf3893c755a56fa53c60b85adb697fab3ddd37385"
)
SOURCE_CAMPAIGN_BYTES = 111_988
SOURCE_RUN_MANIFEST_SHA256 = (
    "2b81ca0bbd654c758a7f3f77d58dc3b719f5ab6dac73d02a0580cccda6c27e16"
)
SOURCE_RUN_MANIFEST_BYTES = 2_500
SOURCE_PREPARER_COMMIT = "0d739e8ac1109dc6912d4269868caf28e0f9b3dd"
SOURCE_PREPARER_SHA256 = (
    "6918215483491b4f33de94787fb0ac6be74e72f98ff31e7795c8e874b83ea939"
)
SOURCE_PREPARER_BYTES = 115_385

# Raw custody identity of the lane checkpoint after OUTPUT_ROOT registration.
CHECKPOINT_SHA256 = "fd9da5d442fd07db2ed55d31085f5587d6883e7af6fc5b50ef6aa9ee1cc78015"
CHECKPOINT_BYTES = 720

SOURCE_CELL_IDENTITIES = {
    "none": {
        "cnf_sha256": "ce4be279f8eb07d941631e015f3dd629567270dee108e79757bed4a43b79ff3a",
        "cnf_bytes": 346_273_951,
        "producer_sha256": "3e6a2ce52be86485b04d63be26041f33d0aa97e615b7a89619107d0a5cd2408a",
        "producer_bytes": 7_491,
        "wave_sha256": "3fafdb1a27aff6463af720d43269728da7ded470291b4175c6b6fbfb54c68922",
        "wave_bytes": 1_642,
    },
    "unique-06": {
        "cnf_sha256": "4053bcd2d03fa8b6ceac2634aa91e53dffaef2f2a670c1b382144d43fa499006",
        "cnf_bytes": 346_273_950,
        "producer_sha256": "6decfeae3392b865c50e96ecf6f3e35a510a30625347e0e74a32bc0f45c20e46",
        "producer_bytes": 7_506,
        "wave_sha256": "42aea780166693b2948f61cc857509d0d753676b9c4cfa16aae4f920b4bd7180",
        "wave_bytes": 1_652,
    },
    "unique-07": {
        "cnf_sha256": "60075bd34075b71b7d0c74616d04b445cd18ce8a9c6864c8cd16f312595b02cf",
        "cnf_bytes": 346_273_950,
        "producer_sha256": "663d39d11d2742df485cc332456b50393a66eb449bb66b82d6baebe3cd482380",
        "producer_bytes": 7_506,
        "wave_sha256": "8e6731947491fa8a1789653a158747c6c58e95900b5b21c3bf1dc4534c828db5",
        "wave_bytes": 1_652,
    },
    "unique-08": {
        "cnf_sha256": "b528322cb81ae692ab2e15eeeddc277b79866a3218d8fec63d3ebb0930e5a258",
        "cnf_bytes": 346_273_950,
        "producer_sha256": "a80c7315b15c5046ab6f7df9277e111f371a44e4a664817f04123d5e0c98caad",
        "producer_bytes": 7_506,
        "wave_sha256": "c85e73b1b0e98ad5efe8232260afd1c91a5cadb6d7df3ed0c3835ee6f0b34cd0",
        "wave_bytes": 1_652,
    },
    "unique-09": {
        "cnf_sha256": "81bf4134a0ebb05097e58b6f48fdd4c4a864bbdf9f672ca97736b6baf6c3212b",
        "cnf_bytes": 346_273_950,
        "producer_sha256": "a3ec85082be66553a3782a25f3bf7e33fd463fce4572b81b08b0d6b82e710af5",
        "producer_bytes": 7_506,
        "wave_sha256": "fda0ffdf5293d273dfe6254634b2dda812ee688a301685cc9a607de924ba1612",
        "wave_bytes": 1_652,
    },
    "unique-10": {
        "cnf_sha256": "af262a852da266b611aa50c9b55c4ad4d92bec025cbcc00c5ecb3e8c26a14636",
        "cnf_bytes": 346_273_950,
        "producer_sha256": "cfe16f6b3bba037b37c9aa1dcae12b9393aa8983db3ac6b2f6bfe5f344fa606b",
        "producer_bytes": 7_506,
        "wave_sha256": "24c1fb9244b2281244300c4f2b3982e83f1f1c0556941af357aa9193e661ce18",
        "wave_bytes": 1_652,
    },
}

# Byte-exact identities after transforming the six authenticated v2 source
# producer and wave manifests into SAT-profile portfolio inputs.
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str]] = {
    "none": {
        "producer_sha256": (
            "466bb5e9b79ee7ef4ea03b324955dde3607cb0bf5d0a4db076fd66d6404b903d"
        ),
        "wave_sha256": (
            "bb83f25f3654169a36a2f6cdeeaf43587320e08c6f445b255b47ae85307bb21c"
        ),
        "identity_hash": (
            "1b703d8c8c789fc934eab6e86b0f7104776e51f2d12c542d3f42f1055806028a"
        ),
    },
    "unique-06": {
        "producer_sha256": (
            "1599d84d78a91ff8a8b83f5e949575ac00c6c99d5b01fe0d937a46f77bb3693d"
        ),
        "wave_sha256": (
            "94f22067cca65f894533ff45e27fc31f3d0adc1f429fe45fab390b32809d6fdb"
        ),
        "identity_hash": (
            "36fc814bc51d9c6148a6fbea86656b07dc276a25577471afa701582bb9c1ef80"
        ),
    },
    "unique-07": {
        "producer_sha256": (
            "ea1221c9c8ebb14d74cd346bd1b54c5a8bb9f6a10e60123c2e9ea8259528f271"
        ),
        "wave_sha256": (
            "bb441205b7008dbca19c082e04b40a77ad7e96bb13d0ff48fef2151599822d44"
        ),
        "identity_hash": (
            "7611e4a18f952b128df361a6165ff9ff39ebda88e062a1a846ff67ef2243d551"
        ),
    },
    "unique-08": {
        "producer_sha256": (
            "4d4c2ee09557c503ef2b30c5549c0648df48e70fda033da64140859824eb95ba"
        ),
        "wave_sha256": (
            "072c2d925501c13149a28be9c2c1965a65153888bd3d34d9f21283849989e161"
        ),
        "identity_hash": (
            "aadc8b35fe59ccd888684e0e73f27fb806270f9c955146dae720c09e05c844ca"
        ),
    },
    "unique-09": {
        "producer_sha256": (
            "a8ea8865813319b1a68a668eadb4006bf7b6a9daeef6a45aa6db37bfc72eb288"
        ),
        "wave_sha256": (
            "0e67b810595ffea5866367bb4b78fd2d58b0c4cfbb6fb1404dbe156755916424"
        ),
        "identity_hash": (
            "277e5bc05115364215c4dca18deec4046706a644611ca5fad92c80c3a3aa7c3f"
        ),
    },
    "unique-10": {
        "producer_sha256": (
            "ff3320b964c01be6b3d9a2f9cb64ab1a32104dc041db361cb6c95bb1f3c45344"
        ),
        "wave_sha256": (
            "52e16b9ba23a92021f50c1e31dc41f5c2c79c97e3ecfddd2fa6f22f0ba9ef856"
        ),
        "identity_hash": (
            "aa94278bf2f9915bc3cd3e4e54f094a62dfd56f081c2205b3305890edccd130f"
        ),
    },
}

_PREPARATION_BASE = Path(__file__).with_name(
    "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py"
)
_PREPARATION_TEXT = _PREPARATION_BASE.read_text(encoding="utf-8")
_PREPARATION_REPLACEMENTS = (
    (
        (
            "prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
            "two_kalmanson_physical_slice_cells.py"
        ),
        SOURCE_PREPARER_RELATIVE.split("/")[-1],
    ),
    (
        "exact17-eight-hit-sat-portfolio-20260821",
        LANE_ID,
    ),
    ("eight-hit-sat-profile-portfolio-v1", RUN_ID),
    ("exact17-eight-hit-sat-portfolio", "exact17-six-hit-bisector-sat-portfolio"),
    (
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-next",
    ),
)
for _old, _new in _PREPARATION_REPLACEMENTS:
    if _old not in _PREPARATION_TEXT:
        raise RuntimeError(f"preparation replacement source drifted: {_old}")
    _PREPARATION_TEXT = _PREPARATION_TEXT.replace(_old, _new)

_PREPARATION_MODULE_NAME = "_exact17_six_hit_bisector_sat_preparation"
preparation = types.ModuleType(_PREPARATION_MODULE_NAME)
preparation.__file__ = str(Path(__file__).resolve())
preparation.__package__ = ""
sys.modules[_PREPARATION_MODULE_NAME] = preparation
exec(  # noqa: S102
    compile(_PREPARATION_TEXT, str(_PREPARATION_BASE), "exec"),
    preparation.__dict__,
    preparation.__dict__,
)

preparation.LANE_ID = LANE_ID
preparation.RUN_ID = RUN_ID
preparation.RUN_OWNER = RUN_OWNER
preparation.BASE_HEAD = BASE_HEAD
preparation.SOURCE_RUN_ROOT = SOURCE_RUN_ROOT
preparation.SOURCE_CAMPAIGN_PATH = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
preparation.SOURCE_RUN_MANIFEST_PATH = SOURCE_RUN_ROOT / "run_manifest.json"
preparation.SOURCE_PREPARER_RELATIVE = SOURCE_PREPARER_RELATIVE
preparation.SOURCE_PREPARER_PATH = ROOT / SOURCE_PREPARER_RELATIVE
preparation.CHECKPOINT_PATH = ROOT / CHECKPOINT_RELATIVE
preparation.OUTPUT_ROOT = OUTPUT_ROOT
preparation.PRODUCTION_PINS_FINALIZED = True
preparation.SOURCE_CAMPAIGN_SHA256 = SOURCE_CAMPAIGN_SHA256
preparation.SOURCE_CAMPAIGN_BYTES = SOURCE_CAMPAIGN_BYTES
preparation.SOURCE_RUN_MANIFEST_SHA256 = SOURCE_RUN_MANIFEST_SHA256
preparation.SOURCE_RUN_MANIFEST_BYTES = SOURCE_RUN_MANIFEST_BYTES
preparation.SOURCE_PREPARER_COMMIT = SOURCE_PREPARER_COMMIT
preparation.SOURCE_PREPARER_SHA256 = SOURCE_PREPARER_SHA256
preparation.SOURCE_PREPARER_BYTES = SOURCE_PREPARER_BYTES
preparation.CHECKPOINT_SHA256 = CHECKPOINT_SHA256
preparation.CHECKPOINT_BYTES = CHECKPOINT_BYTES
preparation.FINALIZATION_REQUIRED = ()
preparation.NUM_CLAUSES = 7_409_271
preparation.PACKAGE_SOURCE_PATHS = PACKAGE_SOURCE_PATHS
preparation.SOURCE_CELL_IDENTITIES = SOURCE_CELL_IDENTITIES
preparation.PRODUCTION_CELL_IDENTITIES = PRODUCTION_CELL_IDENTITIES
preparation.V5_SOURCE_ID_SUFFIX = SOURCE_ID_SUFFIX

EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonSixHitBisectorPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisector.lean"
)
EXPECTED_FINITE_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
    "six-hit-bisector-physical-slice/v1"
)

_BASE_BUILD_PRODUCER = preparation.build_producer


def _build_producer_with_lean_ingress(
    source: dict[str, Any], source_sha256: str, category: str
) -> bytes:
    source_manifest = source.get("source_manifest")
    if type(source_manifest) is not dict:
        raise preparation.PreparationError("source producer lacks Lean ingress")
    expected = {
        "source_theorem": EXPECTED_SOURCE_THEOREM,
        "source_path": EXPECTED_SOURCE_PATH,
        "root_source_path": EXPECTED_ROOT_SOURCE_PATH,
        "finite_schema": EXPECTED_FINITE_SCHEMA,
    }
    for key, value in expected.items():
        if source_manifest.get(key) != value:
            raise preparation.PreparationError(
                f"source producer Lean ingress drifted: {key}"
            )
    return _BASE_BUILD_PRODUCER(source, source_sha256, category)


preparation.build_producer = _build_producer_with_lean_ingress

_BASE_AUTHENTICATE_SOURCE_CAMPAIGN = preparation.authenticate_source_campaign


def _authenticate_source_campaign(
    *,
    root: Path = ROOT,
    campaign_path: Path | None = None,
    source_run_manifest_path: Path | None = None,
    checkpoint_path: Path | None = None,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    forwarded_campaign_path = campaign_path
    forwarded_source_run_manifest_path = source_run_manifest_path
    forwarded_checkpoint_path = checkpoint_path
    if campaign_path is None or campaign_path == preparation.SOURCE_CAMPAIGN_PATH:
        forwarded_campaign_path = None
    if (
        source_run_manifest_path is None
        or source_run_manifest_path == preparation.SOURCE_RUN_MANIFEST_PATH
    ):
        forwarded_source_run_manifest_path = None
    if checkpoint_path is None or checkpoint_path == preparation.CHECKPOINT_PATH:
        forwarded_checkpoint_path = None
    return _BASE_AUTHENTICATE_SOURCE_CAMPAIGN(
        root=root,
        campaign_path=forwarded_campaign_path,
        source_run_manifest_path=forwarded_source_run_manifest_path,
        checkpoint_path=forwarded_checkpoint_path,
        output_root=output_root,
    )


preparation.authenticate_source_campaign = _authenticate_source_campaign

_BASE_PREPARE_PORTFOLIO = preparation.prepare_portfolio


def prepare_portfolio(
    *,
    root: Path = ROOT,
    campaign_path: Path | None = None,
    source_run_manifest_path: Path | None = None,
    checkpoint_path: Path | None = None,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    return _BASE_PREPARE_PORTFOLIO(
        root=root,
        campaign_path=campaign_path or preparation.SOURCE_CAMPAIGN_PATH,
        source_run_manifest_path=(
            source_run_manifest_path or preparation.SOURCE_RUN_MANIFEST_PATH
        ),
        checkpoint_path=checkpoint_path or preparation.CHECKPOINT_PATH,
        output_root=output_root,
    )


preparation.prepare_portfolio = prepare_portfolio

_RUNNER_BASE = Path(__file__).with_name(
    "run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py"
)
_RUNNER_TEXT = _RUNNER_BASE.read_text(encoding="utf-8")
_RUNNER_REPLACEMENTS = (
    (
        "prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio",
        _PREPARATION_MODULE_NAME,
    ),
    ("exact17-eight-hit-sat-portfolio-20260821", LANE_ID),
    ("eight-hit-sat-profile-portfolio-v1", RUN_ID),
    (
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-next",
    ),
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
        PACKAGE_SOURCE_PATHS[0],
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
        PACKAGE_SOURCE_PATHS[1],
    ),
)
for _old, _new in _RUNNER_REPLACEMENTS:
    if _old not in _RUNNER_TEXT:
        raise RuntimeError(f"runner replacement source drifted: {_old}")
    _RUNNER_TEXT = _RUNNER_TEXT.replace(_old, _new)
_MAIN_GUARD = '\nif __name__ == "__main__":\n    raise SystemExit(main())\n'
if _RUNNER_TEXT.count(_MAIN_GUARD) != 1:
    raise RuntimeError("EightHit runner main guard drifted")
_RUNNER_TEXT = _RUNNER_TEXT.replace(_MAIN_GUARD, "\n", 1)
exec(compile(_RUNNER_TEXT, str(_RUNNER_BASE), "exec"), globals(), globals())  # noqa: S102


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the authenticated SixHitBisector SAT-profile portfolio."
    )
    parser.add_argument(
        "command",
        choices=("prepare", "static-check", "start-canary", "start-rest", "start"),
    )
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        if args.command == "prepare":
            payload = prepare_portfolio()
        elif args.command == "static-check":
            payload = static_check(root=ROOT, run_root=RUN_ROOT)
        elif args.command == "start-canary":
            payload = start_canary(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
        elif args.command == "start-rest":
            payload = start_rest(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
        else:
            payload = start(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
    except (
        OSError,
        PortfolioRunnerError,
        preparation.PreparationError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(f"SixHitBisector SAT-profile portfolio rejected: {exc}", file=sys.stderr)
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
