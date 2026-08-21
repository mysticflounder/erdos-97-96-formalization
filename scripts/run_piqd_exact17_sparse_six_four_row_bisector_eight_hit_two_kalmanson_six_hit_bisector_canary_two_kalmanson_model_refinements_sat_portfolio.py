# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Run the authenticated canary-two-Kalmanson six-cell SAT-profile portfolio.

The implementation reuses the audited true-EightHit portfolio engine while
binding every source, schema, path, and byte identity to the independently
audited SixHitBisector canary-two-Kalmanson model-refinements v1 physical-slice campaign.
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

LANE_ID = "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-sat-portfolio-20260821"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = (
    "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-sat-portfolio"
)
BASE_HEAD = "a31dae2b1465183abc8d7aed1b44c750b8ad6751"
CHECKPOINT_RELATIVE = f".codex/worktree-checkpoints/{LANE_ID}.json"
PACKAGE_SOURCE_PATHS = (
    CHECKPOINT_RELATIVE,
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_portfolio.py"
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_"
        "two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_portfolio.py"
    ),
)
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-preparer-20260821/"
    "physical-slice-cell-campaign-v1"
)
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_"
    "two_kalmanson_six_hit_bisector_canary_two_kalmanson_model_refinements_physical_slice_cells.py"
)
SOURCE_ID_SUFFIX = "-physical-slice-cell-campaign-v1"

SOURCE_CAMPAIGN_SHA256 = (
    "0b3e5718c46ff2fb7397cef42c3430949c27e4fa8562adaa451f285bd4c1bbd8"
)
SOURCE_CAMPAIGN_BYTES = 138_174
SOURCE_RUN_MANIFEST_SHA256 = (
    "5faf4bdecb1343fa25699a563dbc2c992ab98fbe0c695414ff4122459d2261e0"
)
SOURCE_RUN_MANIFEST_BYTES = 2_907
SOURCE_PREPARER_COMMIT = "f6612b9154473c9c1ff6066f4bd3c62975588fb3"
SOURCE_PREPARER_SHA256 = (
    "0b24aa69258ca5549fa366c6487b72d2dc9896c60be21625a9b741b546b4558f"
)
SOURCE_PREPARER_BYTES = 122_007

# Raw custody identity of the lane checkpoint after OUTPUT_ROOT registration.
CHECKPOINT_SHA256 = "2d25db79530e3b34220a233a171dfe5dd01ed59864f74f2cd28853dfe115e36e"
CHECKPOINT_BYTES = 1_020

SOURCE_CELL_IDENTITIES = {
    "none": {
        "cnf_sha256": "6fcb5669e16926406d64c96d9bfc85818216ed271c74fca35aa66b83d9520fd4",
        "cnf_bytes": 346_275_390,
        "producer_sha256": "e9cd00d1c99a7787e9981d2c6678c2d3a1dd840617e813e53f2c0ae9ff4d02e9",
        "producer_bytes": 10_190,
        "wave_sha256": "423dc11158c954ed4892b63e74702f8e28d593233af33d1c95f63bcdb0e5ace1",
        "wave_bytes": 1_826,
    },
    "unique-06": {
        "cnf_sha256": "1f5b50eedf8d03e0c5958d4d2f7abd422c11fc2c19eb79dd0fb088ebe9c80c58",
        "cnf_bytes": 346_275_389,
        "producer_sha256": "7a84862fa86bae395789f003e6b4e17f026b27b34df89e411e00dcd54123f41b",
        "producer_bytes": 10_205,
        "wave_sha256": "67a15c5fed15dab2e1b9804c2e76c0a1272ab00fe2d7329c1a49f5bf96acce90",
        "wave_bytes": 1_836,
    },
    "unique-07": {
        "cnf_sha256": "9cb5f46ab180f7df1a429948dd7c424818cc0a14a36cff046205072cf31e7719",
        "cnf_bytes": 346_275_389,
        "producer_sha256": "fc31630f268fe2206fd01b61ca0e9fdb00215ce1e5c620c08ab3fe3dd9f233d7",
        "producer_bytes": 10_205,
        "wave_sha256": "1b84f276bf195a5fbbf1c4d25fdf5f06287c2f9eb0729b3c4b09dad81a7926b0",
        "wave_bytes": 1_836,
    },
    "unique-08": {
        "cnf_sha256": "2788d525617b444d40dac4eb04315c5016cba6ae754d0b2ac1fb128a4ae96b6b",
        "cnf_bytes": 346_275_389,
        "producer_sha256": "a9cd58fa632e2bc73d419b352901540bdc2519aa0e1ed94f2ebaf47bf630f88a",
        "producer_bytes": 10_205,
        "wave_sha256": "fe64f1e0566d3b3049c57d1e4d432d75ae9dd138d495f2e59a820b3b5261efd4",
        "wave_bytes": 1_836,
    },
    "unique-09": {
        "cnf_sha256": "6a1921ca56a342a351aa10a583941946a6c89101496329c06fc5f3d4412dd19d",
        "cnf_bytes": 346_275_389,
        "producer_sha256": "705fe61e99f399740390c729b00ecdbbb12ae1348e47eca64447b46527258d7a",
        "producer_bytes": 10_205,
        "wave_sha256": "f5988fa5c5198b7d7e00fb810b2782e46c138f6fc6b13ad1d0832d9e48d03e48",
        "wave_bytes": 1_836,
    },
    "unique-10": {
        "cnf_sha256": "2ff1f60f0c0eb17d7b2330142dfd7e84b878f9579f26ad432bde0b27c8abc1c2",
        "cnf_bytes": 346_275_389,
        "producer_sha256": "170a4722bfc1c5d57979c9c411fb7ad04e0ec43445ebd023758a3453b15cc5ac",
        "producer_bytes": 10_205,
        "wave_sha256": "e4458e47e638eb45ca03dfa49ce601574abb0bbb080f34db44f46bb15c3ebb34",
        "wave_bytes": 1_836,
    },
}

# Byte-exact identities after transforming the six authenticated v1 source
# producer and wave manifests into SAT-profile portfolio inputs.
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str]] = {
    "none": {
        "producer_sha256": (
            "703dc1521acfa856612fc22fa6ed20c45ddc80a47ceed3a2bf277f2004651deb"
        ),
        "wave_sha256": (
            "68a3ccc1b5d5d08be70a2e0239155a82fadb148ce3978afb4ebacaa4df98b131"
        ),
        "identity_hash": (
            "50468ccb318fa101ad83ddf210f717c36ec1ea1d426747b0b1022be6fb35b438"
        ),
    },
    "unique-06": {
        "producer_sha256": (
            "388f5b5bd46947857de4d9a75581854d0ae1bf9ae8b6d6cdcc8205d01d442790"
        ),
        "wave_sha256": (
            "2d9bfa5d5b12db7f440e1030878a0a501b101d75069bb7845b263d3cc513ad27"
        ),
        "identity_hash": (
            "7a82ab1ed44a68b80f3fafc17b86c992400d8dd332cb12d850aee6005441fd8f"
        ),
    },
    "unique-07": {
        "producer_sha256": (
            "d83d7241984a4cca0a30576356aa01467d1e50eb6493de49e9991a6300147438"
        ),
        "wave_sha256": (
            "ba6f9cd84b20273a87fdbd369a9aba34f16c622b497e265ad15181e93d506161"
        ),
        "identity_hash": (
            "f3f743803eddec79085bf7a6ba87281ccb4f2ed74e05258719cbff48d6aa8143"
        ),
    },
    "unique-08": {
        "producer_sha256": (
            "606b1fc879091f88acec0be9274de398e1aecb68a65574a2e54b6a11de7de08e"
        ),
        "wave_sha256": (
            "c85f2cfde6157dc1f310d5fffadcc772fefa140c36f3aec7d955e2223bf2d10f"
        ),
        "identity_hash": (
            "20493d887a0e6c257edb97f5b6b68d5faf8fa0662dd63912cd0f4169ced0e42c"
        ),
    },
    "unique-09": {
        "producer_sha256": (
            "1f19c9cd98c100657b6b1fc3e5ab92c6aa97e134d1c988e2ae83555fa9cd6d5b"
        ),
        "wave_sha256": (
            "697bd9fbe48df1c6cf1b708607591e48a965d9eb48b8dc9decfa5b07e7fddd8d"
        ),
        "identity_hash": (
            "baceb35cb733955ccf8440ae2a97694d5ff8f4152f9475c0314980d17dbb8c50"
        ),
    },
    "unique-10": {
        "producer_sha256": (
            "31d06abf5f6a02c0fdcb2ef451d4f6c89267010daee5b642eec31f12c2c4bb37"
        ),
        "wave_sha256": (
            "ef7851f03a065985cb37f98074f156e106f4f289cde3d93ad016946eaf5a0836"
        ),
        "identity_hash": (
            "21c9c4270e8db261b1070214418f95f4ba28329246ad70a2cbe4b02190171d25"
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
        "exact17-six-hit-bisector-canary-two-kalmanson-model-refinements-sat-portfolio",
    ),
    (
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-model-refinements",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-model-refinements-next",
    ),
)
for _old, _new in _PREPARATION_REPLACEMENTS:
    if _old not in _PREPARATION_TEXT:
        raise RuntimeError(f"preparation replacement source drifted: {_old}")
    _PREPARATION_TEXT = _PREPARATION_TEXT.replace(_old, _new)

_PREPARATION_MODULE_NAME = (
    "_exact17_six_hit_bisector_canary_two_kalmanson_model_refinements_sat_preparation"
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
preparation.NUM_CLAUSES = 7_409_301
preparation.PACKAGE_SOURCE_PATHS = PACKAGE_SOURCE_PATHS
preparation.SOURCE_CELL_IDENTITIES = SOURCE_CELL_IDENTITIES
preparation.PRODUCTION_CELL_IDENTITIES = PRODUCTION_CELL_IDENTITIES
preparation.V5_SOURCE_ID_SUFFIX = SOURCE_ID_SUFFIX

EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinementsPhysicalSliceCoverage."
    "sourceAssign_sparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonSixHitBisectorCanaryTwoKalmansonModelRefinementPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinementsPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSparseSixPointFourRowTwoCircleBisector"
    "EightHitTwoKalmansonCancellationSixHitBisectorCanaryTwoKalmansonModelRefinements.lean"
)
EXPECTED_FINITE_SCHEMA = (
    "p97-exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
    "six-hit-bisector-canary-two-kalmanson-model-refinements-physical-slice/v1"
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
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-model-refinements",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-six-hit-bisector-canary-two-kalmanson-model-refinements-next",
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
        description="Run the authenticated SixHitBisector canary-two-Kalmanson model-refinements SAT-profile portfolio."
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
            f"SixHitBisector canary-two-Kalmanson model-refinements SAT-profile portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
