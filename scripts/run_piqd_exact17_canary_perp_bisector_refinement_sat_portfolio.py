# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Run the authenticated canary perpendicular-bisector SAT portfolio.

The implementation reuses the audited true-EightHit portfolio engine while
binding every source, schema, path, and byte identity to the independently
audited canary perpendicular-bisector refinement physical-slice campaign.
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

LANE_ID = "exact17-canary-perp-bisector-refinement-sat-portfolio-20260821"
RUN_ID = "sat-profile-portfolio-v1"
RUN_OWNER = "exact17-canary-perp-bisector-refinement-sat-portfolio"
BASE_HEAD = "147587da98e1043636f528b8845e947743cbc6d0"
CHECKPOINT_RELATIVE = f".codex/worktree-checkpoints/{LANE_ID}.json"
PACKAGE_SOURCE_PATHS = (
    CHECKPOINT_RELATIVE,
    "scripts/run_piqd_exact17_canary_perp_bisector_refinement_sat_portfolio.py",
    "scripts/test_run_piqd_exact17_canary_perp_bisector_refinement_sat_portfolio.py",
)
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-canary-perp-bisector-refinement-preparer-20260821/"
    "physical-slice-cell-campaign-v1"
)
OUTPUT_ROOT = ROOT / f"scratch/runs/{LANE_ID}/{RUN_ID}"
SOURCE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_refinement_physical_slice_cells.py"
)
SOURCE_ID_SUFFIX = "-physical-slice-cell-campaign-v1"

SOURCE_CAMPAIGN_SHA256 = (
    "5ec960367ede353799b8d0a7c2d8015c29c2972295380968559bafca05cf6790"
)
SOURCE_CAMPAIGN_BYTES = 104_850
SOURCE_RUN_MANIFEST_SHA256 = (
    "c2dc5d871c8f0be4e9e780b7773b04552e748f553a7295ca12a04f694d847f06"
)
SOURCE_RUN_MANIFEST_BYTES = 2_379
SOURCE_PREPARER_COMMIT = "2ae9bbf7490ae8bd9318159c6d91339609607faa"
SOURCE_PREPARER_SHA256 = (
    "953c3b2743f8722f6ee2b50225395c63fd3d345701c465d4e3a4323710d851c8"
)
SOURCE_PREPARER_BYTES = 115_892

# Raw custody identity of the lane checkpoint after OUTPUT_ROOT registration.
CHECKPOINT_SHA256 = "52dccdb407f7ec34fb441f335673471d3e9ade48e18cff05f85d98295d3d8487"
CHECKPOINT_BYTES = 1_097

SOURCE_CELL_IDENTITIES = {
    "none": {
        "cnf_sha256": "77f7f7fb2d5e5911212a37f7a86158e51c1b6eeff1dea94b11bdff4ca93b06d9",
        "cnf_bytes": 346_275_431,
        "producer_sha256": "1001a9bb2e31dfd35906a1d17575fbe6a109128003e3054b13068940593742f9",
        "producer_bytes": 6_942,
        "wave_sha256": "1d5744c613257b3fd4c9ed4ed7a2e9c3380acb76d4e8656d0b9a40ef3bbcc9b7",
        "wave_bytes": 1_440,
    },
    "unique-06": {
        "cnf_sha256": "6f25c4bad11321fff503eb1d199de17bddc427ebd67259d54ea57743ae56cb12",
        "cnf_bytes": 346_275_430,
        "producer_sha256": "a4838e538089a76f0c3f1d4dde26026d86258c9e8b8aeeb48ac0a19c04168b63",
        "producer_bytes": 6_957,
        "wave_sha256": "f5ce3d0af619f89d8aad44233975d05ad86aa87c50c7f20fad2d43398070a64f",
        "wave_bytes": 1_450,
    },
    "unique-07": {
        "cnf_sha256": "80422fdd7bd622ac7c1fbc853f812065bbfa2ac2358ddffa74f02da29884691d",
        "cnf_bytes": 346_275_430,
        "producer_sha256": "a547765e06954a886d10cac0f8e1f2a03bddfd8a8c1ae323026184db4e046d5e",
        "producer_bytes": 6_957,
        "wave_sha256": "f67c14ea9c2fcb35e72aa1b12bdc019149343863786d1053061c1b9c19aea467",
        "wave_bytes": 1_450,
    },
    "unique-08": {
        "cnf_sha256": "4f7e4594e9df1fa2eef125b6aef5c7b7478802d4ae2f2b644170d331e5a95b30",
        "cnf_bytes": 346_275_430,
        "producer_sha256": "21847d9f77bf6aa11ffdea6f007222e9d35807b90dec2f81d801f675e341286c",
        "producer_bytes": 6_957,
        "wave_sha256": "fb28c5a0ef22fe21fb8985f055df079d0e75719a9df3ad5062af0fb8c91fcf6f",
        "wave_bytes": 1_450,
    },
    "unique-09": {
        "cnf_sha256": "08b57686c4d5f4fc499c824e2064810fa3a44d51e6c5e08b7fbd99bf91103382",
        "cnf_bytes": 346_275_430,
        "producer_sha256": "d4c03d17f9aeeab2d7490bef77397d0da341e5cc725a1f5a02311a55e41b393d",
        "producer_bytes": 6_957,
        "wave_sha256": "f9678b049b6680d7f194727465ffe96c6f884621cbe7e3ae0856889fc569c5be",
        "wave_bytes": 1_450,
    },
    "unique-10": {
        "cnf_sha256": "fe4a17e97f007e9bebec96fc310e0ed99eaac76fed92e747c9dca0ea8a965bf0",
        "cnf_bytes": 346_275_430,
        "producer_sha256": "131caad9780923b448c28842e95167aa2230fbab06a196ab8d439144b0007ea9",
        "producer_bytes": 6_957,
        "wave_sha256": "ad940eea1b23e68c689fef70baee0a89b821b1aca068f9daf44c36deba310ac7",
        "wave_bytes": 1_450,
    },
}

# Byte-exact identities after transforming the six authenticated v1 source
# producer and wave manifests into SAT-profile portfolio inputs.
PRODUCTION_CELL_IDENTITIES: dict[str, dict[str, str]] = {
    "none": {
        "producer_sha256": (
            "6f31b06abb0cde3aba6b88d8d72c5e14501886cd78fadfc5db35b45e0915c77d"
        ),
        "wave_sha256": (
            "272eae81e523ea637f528f3267823cf6cddd72cb6b676edae64ae61b8ed70543"
        ),
        "identity_hash": (
            "11878a6ec551080a695a0eb3540afda715b7ce8c98fabfa2357abaae3ab73d3e"
        ),
    },
    "unique-06": {
        "producer_sha256": (
            "dd7c1ae2c7e765a26327d3402747d201690ad565e641bdde79d7e6639fcb9b8b"
        ),
        "wave_sha256": (
            "3c486ba518f755138233d5dea1f69d7b77d6d836392a0fa2f8e4711d36694d66"
        ),
        "identity_hash": (
            "e06a602f83a3715de155686fdc33f1df06cdde01feb2ba5fcac8491c79e97cdd"
        ),
    },
    "unique-07": {
        "producer_sha256": (
            "a0a94d61e7fb9cf14e9a8060233e15a12c76c2fc2bce4fc33960329aaae0b775"
        ),
        "wave_sha256": (
            "565fd2444bccf05bfa35d88f31617e5cba9b7f37c00b39a0933caac5f621edb3"
        ),
        "identity_hash": (
            "f82db65a6063ee017fb4a79b01744013c0c815cfc8cf8d5f8729e63413af56b7"
        ),
    },
    "unique-08": {
        "producer_sha256": (
            "8873ffeb3e38107c87eb9ae9542ae377a5603db96bf3844e5116a2ae74ed4fb8"
        ),
        "wave_sha256": (
            "f6953a817ed6adfcc8aff4faf7a6fa90caa1ca9f0c9051e17c9711a82b80a5ee"
        ),
        "identity_hash": (
            "3cbd5954508133a3b5cd435af6ed82c7442d68650bc42716008fcb2b112d419e"
        ),
    },
    "unique-09": {
        "producer_sha256": (
            "2fdff3fd783e4fa55db55abe61a429014bf4a3f2a921d19fb9453eb3b66752b0"
        ),
        "wave_sha256": (
            "6879be689cf3c163465360b74d92f78e3f2415418b0a5e80518fe737ac675fc9"
        ),
        "identity_hash": (
            "e4e629159ac9c82b8c60595bfdfeba4958999b4643e6a1d7ce68b3f769446980"
        ),
    },
    "unique-10": {
        "producer_sha256": (
            "2bd662bc006c02b8e2dc9c85f37bb329ce76065dfef4ad27f0f4c59f850e9d06"
        ),
        "wave_sha256": (
            "9225296963e6c852a7d4c05af3e5b91e68e42eab77d5220320d9c465e5fc15b5"
        ),
        "identity_hash": (
            "3a15743d4bc65f53bf58e21ea2a487017a78b6cb193bb9c9d3f16b7c0d9519bf"
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
        "exact17-canary-perp-bisector-refinement-sat-portfolio",
    ),
    (
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
        "canary-perp-bisector-refinement",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "canary-perp-bisector-refinement-next",
    ),
)
for _old, _new in _PREPARATION_REPLACEMENTS:
    if _old not in _PREPARATION_TEXT:
        raise RuntimeError(f"preparation replacement source drifted: {_old}")
    _PREPARATION_TEXT = _PREPARATION_TEXT.replace(_old, _new)

_PREPARATION_MODULE_NAME = "_exact17_canary_perp_bisector_refinement_sat_preparation"
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
preparation.NUM_CLAUSES = 7_409_302
preparation.PACKAGE_SOURCE_PATHS = PACKAGE_SOURCE_PATHS
preparation.SOURCE_CELL_IDENTITIES = SOURCE_CELL_IDENTITIES
preparation.PRODUCTION_CELL_IDENTITIES = PRODUCTION_CELL_IDENTITIES
preparation.V5_SOURCE_ID_SUFFIX = SOURCE_ID_SUFFIX

EXPECTED_SOURCE_THEOREM = (
    "Problem97."
    "ATailBlockerVExactSeventeenCanaryPerpBisectorRefinementPhysicalSliceCoverage."
    "sourceAssign_canaryPerpBisectorPhysicalSliceCell"
)
EXPECTED_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinementPhysicalSliceCoverage.lean"
)
EXPECTED_ROOT_SOURCE_PATH = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorRefinement.lean"
)
EXPECTED_FINITE_SCHEMA = "p97-exact17-canary-perp-bisector-refinement-physical-slice/v1"

_BASE_BUILD_PRODUCER = preparation.build_producer


def _build_producer_with_canary_perp_bisector_lean_ingress(
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


preparation.build_producer = _build_producer_with_canary_perp_bisector_lean_ingress

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
        "canary-perp-bisector-refinement",
    ),
    (
        "four-row-bisector-eight-hit-two-kalmanson-next",
        "canary-perp-bisector-refinement-next",
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


def start(
    *, base_url: str, root: Path = ROOT, run_root: Path = RUN_ROOT
) -> dict[str, Any]:
    """Reject the inherited ungated whole-portfolio launch entry point."""
    del base_url, root, run_root
    raise PortfolioRunnerError(
        "ungated portfolio launch is disabled; use start-canary, then start-rest"
    )


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the authenticated canary perpendicular-bisector refinement SAT-profile portfolio."
    )
    parser.add_argument(
        "command",
        choices=("prepare", "static-check", "start-canary", "start-rest"),
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
        else:
            payload = start_rest(base_url=args.base_url, root=ROOT, run_root=RUN_ROOT)
    except (
        OSError,
        PortfolioRunnerError,
        preparation.PreparationError,
        PiqdDriverError,
        PiqdOracleError,
        LratReplayError,
    ) as exc:
        print(
            f"canary perpendicular-bisector refinement SAT-profile portfolio rejected: {exc}",
            file=sys.stderr,
        )
        return 2
    print(json.dumps(payload, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
