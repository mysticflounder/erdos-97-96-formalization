# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Run the authenticated canary-two-Kalmanson six-cell SAT-profile portfolio.

The implementation reuses the audited true-EightHit portfolio engine while
binding every source, schema, path, and byte identity to the independently
audited SixHitBisector canary-two-Kalmanson v1 physical-slice campaign.
Portfolio preparation is offline.  The launch commands retain fresh-only PIQD
submission, explicit prepare/confirm/finalize custody, one process and one core
per cell, exact SAT model replay, and proof replay for every terminal UNSAT
result.
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

LANE_ID = "exact17-six-hit-bisector-canary-two-kalmanson-sat-portfolio-20260821"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "exact17-six-hit-bisector-canary-two-kalmanson-sat-portfolio"
BASE_HEAD = "2d2176614fc62007477aeee0e3d242cb2e30f5f3"
CHECKPOINT_RELATIVE = f".codex/worktree-checkpoints/{LANE_ID}.json"
PACKAGE_SOURCE_PATHS = (
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_canary_two_kalmanson_sat_portfolio.py"
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_canary_two_kalmanson_sat_portfolio.py"
    ),
)
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-six-hit-bisector-canary-two-kalmanson-preparer-20260821/"
    "physical-slice-cell-campaign-v1"
)
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
    "two_kalmanson_six_hit_bisector_canary_two_kalmanson_physical_slice_cells.py"
)
SOURCE_ID_SUFFIX = "-physical-slice-cell-campaign-v1"

SOURCE_CAMPAIGN_SHA256 = (
    "6269ed1de923f1d420c01e775922c8bb2e3d8266cee91c387794dfbb8ab9de2e"
)
SOURCE_CAMPAIGN_BYTES = 128_892
SOURCE_RUN_MANIFEST_SHA256 = (
    "11b2cc61bf1bb4f2340414b7ac84c768cc245bbe52129232c71df05ff84eacaa"
)
SOURCE_RUN_MANIFEST_BYTES = 2_715
SOURCE_PREPARER_COMMIT = "70565a5b8ccc05a9e179f9cbe2267f8169280c58"
SOURCE_PREPARER_SHA256 = (
    "6bdd9ed5391d63db2cf6cf5b6731e9549033c79afa6eb3625e4d820e561919f4"
)
SOURCE_PREPARER_BYTES = 123_276

# Raw custody identity of the lane checkpoint after OUTPUT_ROOT registration.
CHECKPOINT_SHA256 = "c78d1d276b9428b74d4f5c0d15bd04c07e034361273ea1a214988fd3179612b0"
CHECKPOINT_BYTES = 808

SOURCE_CELL_IDENTITIES = {
    "none": {
        "cnf_sha256": "b6ecf959e9bae0285919302a6bfe5f9ee2c14d109f7d3552455afa36151ce8b9",
        "cnf_bytes": 346_274_970,
        "producer_sha256": "4eff45176b4cc183e69898f685fac191f787ebad08cd88ca9caaef76d638285b",
        "producer_bytes": 11_713,
        "wave_sha256": "00941506664f61c1b8909359bcd70731655552ae48d4c387613de366f99094b1",
        "wave_bytes": 1_741,
    },
    "unique-06": {
        "cnf_sha256": "1cc413a26e125203d3504b4067abb25e00b4b97d7462414448b01f2c5bd50901",
        "cnf_bytes": 346_274_969,
        "producer_sha256": "d9e3a0dbbb6b12eb56f951592e7956771f173997b73df00d081a43def7b011bb",
        "producer_bytes": 11_728,
        "wave_sha256": "aa96c688b21e1b2c94043415365443f69143fff445d449cb9b2e470fdcbfd67b",
        "wave_bytes": 1_751,
    },
    "unique-07": {
        "cnf_sha256": "d1052894b9db645975eea6413eec7b734e5f64454f2091098260a3cd745ecc95",
        "cnf_bytes": 346_274_969,
        "producer_sha256": "c246c438e17b4da8f6149f1153075834b800ffc228da1d08de22368e7955e12b",
        "producer_bytes": 11_728,
        "wave_sha256": "d854b84cef0e413ac724b7e4d448a49a5e3568494ca22789f42531014bb61b3a",
        "wave_bytes": 1_751,
    },
    "unique-08": {
        "cnf_sha256": "46a90465e07da486ef082141ebe65327e38121cc0e0ea0f32ea1441794d6e0bd",
        "cnf_bytes": 346_274_969,
        "producer_sha256": "3518425c049b120d44c03467311dabd2ad9c90f61a92eef10afa147ff87b0327",
        "producer_bytes": 11_728,
        "wave_sha256": "0b2e750f32de817b315c77b468d2150d4aa4349be4cb3a84f67af0348685be64",
        "wave_bytes": 1_751,
    },
    "unique-09": {
        "cnf_sha256": "efaf650bbe4ace23606b27b01ffad3876f64c39f2bf0efde239352cc20c536c0",
        "cnf_bytes": 346_274_969,
        "producer_sha256": "d7a66b050b0272f3243b8a395897a8fe05298fd0c91f102c89c78ad106b662cf",
        "producer_bytes": 11_728,
        "wave_sha256": "f97db3981d5dad537f05639a10594eede9cae8de17d288ea97760cb81177429a",
        "wave_bytes": 1_751,
    },
    "unique-10": {
        "cnf_sha256": "4724cba87332150e39b7758733832234f37b1e95d6a3dc2516a29e316a452a84",
        "cnf_bytes": 346_274_969,
        "producer_sha256": "0af68ab7e7929203eb7d23ab1d574df1a23c244c3c9fe5cc47ec249f4621d2df",
        "producer_bytes": 11_728,
        "wave_sha256": "49a6ffe76ea4bcbbeeb75d1ae542cd14198fb61ee2113e02c8ee33279c7a9b43",
        "wave_bytes": 1_751,
    },
}

# Byte-exact identities after transforming the six authenticated v1 source
# producer and wave manifests into SAT-profile portfolio inputs.
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str]] = {
    "none": {
        "producer_sha256": (
            "efb70f81947dca866ec3348e38190ffc764041d450b3213726b97a9c776ec3ce"
        ),
        "wave_sha256": (
            "2489d631896c826dc73b453f0dddabb0c13153c7f3f2d9d80f2b258688c18eeb"
        ),
        "identity_hash": (
            "2b602bc0c151a11b2b2d3606ac2b8fb59cceace249c7c763a6e7b2591e54dff2"
        ),
    },
    "unique-06": {
        "producer_sha256": (
            "acb0ae3942d093dcce4bcc929249ff4cd56c2aa89c8b10a6bc4ac9510fd4f5d9"
        ),
        "wave_sha256": (
            "ac789033bdfcee68b46da25f9796367e7c960f7483ffb26dcc427b32c16e03eb"
        ),
        "identity_hash": (
            "4b628b6bea8aecbe8191715816cabf4de0bdaa7166cfede1a5595345b44584a9"
        ),
    },
    "unique-07": {
        "producer_sha256": (
            "a0029948b17d766b9db65479bcd73ba36daa06f4565db2ea8e2ac68bb84b0924"
        ),
        "wave_sha256": (
            "95105a144f9319c9fb2f8880da9c5505d0f9a51792b364b5b37f5480de1cc0c6"
        ),
        "identity_hash": (
            "285fcdbea9eb0834465c30ab63f0ec425eb44995e7086385e2987d21e9af74c5"
        ),
    },
    "unique-08": {
        "producer_sha256": (
            "051f602f267f7c67478ef65dbad3cbeda2a582af02d4e4f3f67616f79b3d43dc"
        ),
        "wave_sha256": (
            "c44bf1acc19c371564b2cfb820f887f773fdc63d84882591e7a39122ccfb936e"
        ),
        "identity_hash": (
            "0674260e1754238c48b2daaa9e470680b2d4c62c68772ad10f2a50584fc9f7be"
        ),
    },
    "unique-09": {
        "producer_sha256": (
            "de8176f2e14fa51c553fbd913a16c71447d03319fa77c430a42f4cc6515a57dd"
        ),
        "wave_sha256": (
            "cfc728d06dc2280d186e884cc2798a042e90820767c0b1dc7fa71330f9a5c0d7"
        ),
        "identity_hash": (
            "2cc55361eaecfdd80f8105fc1dff295177b6d96d53f36f3da02a8a74e1cc7c35"
        ),
    },
    "unique-10": {
        "producer_sha256": (
            "7e7f0c64eb71e48ee85820d16780c4b22442a4e2d7ef22256438c4cd56262257"
        ),
        "wave_sha256": (
            "86c4ac77281424531e5c7a0b583acfdf2fbb1142b7223b3cc8bb3a40f13485a7"
        ),
        "identity_hash": (
            "c1c02de1fa81fbcb23626e767f772aab3b172c96ba7251bfca83e76d0a6995f5"
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
    (
        "exact17-eight-hit-sat-portfolio",
        "exact17-six-hit-bisector-canary-two-kalmanson-sat-portfolio",
    ),
    (
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-next",
    ),
)
for _old, _new in _PREPARATION_REPLACEMENTS:
    if _old not in _PREPARATION_TEXT:
        raise RuntimeError(f"preparation replacement source drifted: {_old}")
    _PREPARATION_TEXT = _PREPARATION_TEXT.replace(_old, _new)

_PREPARATION_MODULE_NAME = (
    "_exact17_six_hit_bisector_canary_two_kalmanson_sat_preparation"
)
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
preparation.NUM_CLAUSES = 7_409_292
preparation.PACKAGE_SOURCE_PATHS = PACKAGE_SOURCE_PATHS
preparation.SOURCE_CELL_IDENTITIES = SOURCE_CELL_IDENTITIES
preparation.PRODUCTION_CELL_IDENTITIES = PRODUCTION_CELL_IDENTITIES
preparation.V5_SOURCE_ID_SUFFIX = SOURCE_ID_SUFFIX

EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmanson.lean"
)
EXPECTED_FINITE_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
    "six-hit-bisector-canary-two-kalmanson-physical-slice/v1"
)

_BASE_BUILD_PRODUCER = preparation.build_producer


def _build_producer_with_canary_two_kalmanson_lean_ingress(
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


preparation.build_producer = _build_producer_with_canary_two_kalmanson_lean_ingress

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
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-next",
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
        description="Run the authenticated SixHitBisector canary-two-Kalmanson SAT-profile portfolio."
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
        print(
            f"SixHitBisector canary-two-Kalmanson SAT-profile portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
