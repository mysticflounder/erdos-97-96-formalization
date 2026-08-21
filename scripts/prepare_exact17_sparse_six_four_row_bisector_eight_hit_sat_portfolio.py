# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# ruff: noqa: F821
"""Fresh true-EightHit exact-17 SAT-profile portfolio preparation.

The hardened two-Kalmanson portfolio implementation is evaluated with a
fresh EightHit identity surface and authenticated against the completed v5
source campaign.  The portfolio output remains create-once and is not made
until the caller explicitly invokes preparation.
"""

from __future__ import annotations

from pathlib import Path

_BASE = Path(__file__).with_name(
    "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py"
)
_TEXT = _BASE.read_text(encoding="utf-8")
_REPLACEMENTS = (
    (
        "prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_physical_slice_cells.py",
        "prepare_exact17_sparse_six_four_row_bisector_eight_hit_two_kalmanson_physical_slice_cells.py",
    ),
    (
        "two_kalmanson_physical_slice_cells.py",
        "eight_hit_two_kalmanson_physical_slice_cells.py",
    ),
    (
        "exact17-sparse-six-four-row-bisector-two-kalmanson-sat-portfolio-20260820",
        "exact17-eight-hit-sat-portfolio-20260821",
    ),
    (
        "sat-profile-portfolio-v1",
        "eight-hit-sat-profile-portfolio-v1",
    ),
    ("exact17-two-kalmanson-sat-portfolio", "exact17-eight-hit-sat-portfolio"),
    (
        "ba6113a21f65ce3885d904773210e836f35cc7c3",
        "7097f6541bea6bc667b27786f2d57673610c59fc",
    ),
    ("preparer-20260820", "preparer-20260821"),
    (
        "scratch/runs/exact17-sparse-six-four-row-bisector-two-kalmanson-preparer-20260820/physical-slice-cell-campaign-v1",
        "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-preparer-20260821/physical-slice-cell-campaign-v1",
    ),
    (
        "sparse-six-four-row-bisector-two-kalmanson",
        "sparse-six-four-row-bisector-eight-hit-two-kalmanson",
    ),
    (
        "four-row-bisector-two-kalmanson-next",
        "four-row-bisector-eight-hit-two-kalmanson-next",
    ),
    (
        "scripts/prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_prepare_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
    (
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_two_kalmanson_sat_portfolio.py",
        "scripts/test_run_piqd_exact17_sparse_six_four_row_bisector_eight_hit_sat_portfolio.py",
    ),
)
for _old, _new in _REPLACEMENTS:
    _TEXT = _TEXT.replace(_old, _new)
exec(compile(_TEXT, str(_BASE), "exec"), globals(), globals())  # noqa: S102

# v5 is the completed governed source campaign.  Keep these bindings explicit
# rather than deriving them from replacement order in the predecessor text.
BASE_HEAD = "c4056805cdd0cd5ae9d67e8d88d21b93445b4cc9"
SOURCE_RUN_ROOT = ROOT / (
    "scratch/runs/exact17-sparse-six-four-row-bisector-eight-hit-two-kalmanson-"
    "preparer-20260821/physical-slice-cell-campaign-v5"
)
SOURCE_CAMPAIGN_PATH = SOURCE_RUN_ROOT / "artifacts/campaign-manifest.json"
SOURCE_RUN_MANIFEST_PATH = SOURCE_RUN_ROOT / "run_manifest.json"
PRODUCTION_PINS_FINALIZED = True
SOURCE_CAMPAIGN_SHA256 = (
    "0f12101f828c919c4cebe8cf7467a3e138b14f37c4ae3cfb8989018c3c40e368"
)
SOURCE_CAMPAIGN_BYTES = 113_685
SOURCE_RUN_MANIFEST_SHA256 = (
    "b2b386f92e1ea35c896dbfd50a8b888b39d42480b92c697c5c1cd214e0d38b2f"
)
SOURCE_RUN_MANIFEST_BYTES = 2_500
SOURCE_PREPARER_COMMIT = "b2fd08db695253931b3e85a8d71d16858df36d1f"
SOURCE_PREPARER_SHA256 = (
    "90e4ca8aed17377ae2e3acdddc8e9dafd9c0be6161c23e33dc266c70821e1bae"
)
SOURCE_PREPARER_BYTES = 115_057
CHECKPOINT_SHA256 = "a7f669806491e2cb3e3bc8b02e26522ea563418ee748d1902893a4caafdbb37b"
CHECKPOINT_BYTES = 799
PRODUCTION_CELL_IDENTITIES = {
    "none": {
        "producer_sha256": "2533432a7f5aed1551219794f0859060e5c5de3fccf8d27b385594975a51c690",
        "wave_sha256": "1d4480ffc7e61c1d513823433b87b878165c2fc7c0844ce7021cb9abf6d8ab7a",
        "identity_hash": "37ccbec90ea35aaee76366184c24044e86151625be7f4c1fbe82ef068ff37c8e",
    },
    "unique-06": {
        "producer_sha256": "2346a14a9b7bef994e748df5be9cbe5ed4b1666dd5b31643c788b48147e98083",
        "wave_sha256": "d48570290444e75f312ffdfa2cbb7cdf63ba85642c3da5370b963c5c00e07b43",
        "identity_hash": "4729207917ba5b22073867d398ed12cf07482a926435fc1c85dc459c719a397b",
    },
    "unique-07": {
        "producer_sha256": "13f52e0bf46b3f7b8d3f8eb3e0f938879ea2d3c048bc69745a0a80c09a59b0a1",
        "wave_sha256": "16780d6424ca4638631576cc84152f37f0b07f1bb59b77be80b58c6bc80dd88a",
        "identity_hash": "ef0ee0d18c93c8162bdaafa8df9c81811ed6aa1a51b268cab88280bb39f0b7ed",
    },
    "unique-08": {
        "producer_sha256": "cbf1f40a3bc8a44a3be881ffcb19258bb124d4541b4ddc00ae99029de203c92a",
        "wave_sha256": "9040c38ec43307504718a0aab3a4c414737b9a75cee95b0c7b6c8c56bea393cd",
        "identity_hash": "c8cfa5c818a6209b7ab9eecf54366b3a8be837fb566d72e6562a966f48fd6da9",
    },
    "unique-09": {
        "producer_sha256": "7ceaaa0b22e9429384bf8e7cc0e6a278a4fead85f7a3ebc55d86606669ac68be",
        "wave_sha256": "c0b9af880cdbb5f8658b80d515b079bc468fa0cd14060cdf30afc5c73793b9a9",
        "identity_hash": "54b784e9ea1520a30486bde28916430873b8d22d9ae7943e32535345e50638f0",
    },
    "unique-10": {
        "producer_sha256": "4d75b3569036046ac8eb72d1508cf6c2a2717788017410e858d132e9af8bd665",
        "wave_sha256": "444d448660df5a0be35bb7a58c00e4ae8b1a8ffb62fd51f229affd359051ef44",
        "identity_hash": "ed77aca6af92f62e475e3d7d34ec4ff2d9a66e37416cd82235611c05cea54144",
    },
}
SOURCE_CELL_IDENTITIES = {
    "none": {
        "cnf_sha256": "c28a8b077eb4750be1f54606cc2345098a8af0aafd414ea404ae06f842c920d5",
        "cnf_bytes": 346273811,
        "producer_sha256": "b2c6c615283dfe1a46d798e56351bece1ed208e1f831790d3ea7600861072b3b",
        "producer_bytes": 7305,
        "wave_sha256": "27918db1e7eeb9fb025e656a4c3efe0cabcbbe196f46b0ca4f32e7ccf99af0db",
        "wave_bytes": 1563,
    },
    "unique-06": {
        "cnf_sha256": "463745fa5e9ba5c167b8cd61e33ce0d87be6b873b2428d75229e18248b543b60",
        "cnf_bytes": 346273810,
        "producer_sha256": "f57fcbe80c10b16be8b2686d2aa6435e20614cc85bb29e3507d376a08380835d",
        "producer_bytes": 7320,
        "wave_sha256": "66387dde53471060d6443e126b4c1055c448e3aaa355b8e2874ffcba72cb708c",
        "wave_bytes": 1573,
    },
    "unique-07": {
        "cnf_sha256": "4092f3bf0cde103d3372d674579f7b23ce8abac26afcb6ba3f63924fb69e2457",
        "cnf_bytes": 346273810,
        "producer_sha256": "2e6df4f788e358655e8d50d6edd550fd14cba1e9810a655b54742fe7f5197445",
        "producer_bytes": 7320,
        "wave_sha256": "92f36323a7f43f471eb1ca7a4ea983c8f1fb95203dcc6232ea89167178783f6b",
        "wave_bytes": 1573,
    },
    "unique-08": {
        "cnf_sha256": "e03e31dbc59d3aa284fd3fea524b4d94aa7f2b00b7fa25585797bf17cb18c727",
        "cnf_bytes": 346273810,
        "producer_sha256": "f719a117b3fd6c15f04091f94f0238be6c1f1a638f69a30872144f62e54ca38b",
        "producer_bytes": 7320,
        "wave_sha256": "89ac8850eeb0704be2165bec88210a81fc7dda6c4918f1823dbac7d959b8684d",
        "wave_bytes": 1573,
    },
    "unique-09": {
        "cnf_sha256": "36566189bbe6a3a74f1c9560c1b857b80db104915e9cb89591e8431f07f3cd5c",
        "cnf_bytes": 346273810,
        "producer_sha256": "d85fbdfb2dcb6f8d889fcab3fb705704a9f74ab21aa6755017d75dd8fd688a4a",
        "producer_bytes": 7320,
        "wave_sha256": "ccf9276683d5213a528d70d394d19cb01c4e5367f3e1c86db59df2ef9a28174a",
        "wave_bytes": 1573,
    },
    "unique-10": {
        "cnf_sha256": "4e42e172d731f9833f02d7d2b171614000b80f5c793593cebd7d64e7b70bbb46",
        "cnf_bytes": 346273810,
        "producer_sha256": "27ac053deded03ee6e3a3cafe5e3dc6c88b52fcccce7f0f7886e60777c7d24be",
        "producer_bytes": 7320,
        "wave_sha256": "3ec627d1f3330c09bd66cec3c59da98a407ef733267853ed49cc3605833c4f8e",
        "wave_bytes": 1573,
    },
}
FINALIZATION_REQUIRED = ()

# The predecessor binds these defaults at function-definition time.  Rebind
# the public entry points so v5 custody is explicit even when called without
# arguments.
_AUTHENTICATE_SOURCE_CAMPAIGN = authenticate_source_campaign


def authenticate_source_campaign(
    *,
    root: Path = ROOT,
    campaign_path: Path | None = None,
    source_run_manifest_path: Path | None = None,
    checkpoint_path: Path | None = None,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    authenticated = _AUTHENTICATE_SOURCE_CAMPAIGN(
        root=root,
        campaign_path=campaign_path or SOURCE_CAMPAIGN_PATH,
        source_run_manifest_path=source_run_manifest_path or SOURCE_RUN_MANIFEST_PATH,
        checkpoint_path=checkpoint_path or CHECKPOINT_PATH,
        output_root=output_root,
    )
    if root == ROOT and campaign_path is None:
        for item in authenticated["cells"]:
            expected = SOURCE_CELL_IDENTITIES[item["category"]]
            for key, digest_key, bytes_key in (
                ("source_cnf", "cnf_sha256", "cnf_bytes"),
                ("source_producer", "producer_sha256", "producer_bytes"),
                ("source_wave", "wave_sha256", "wave_bytes"),
            ):
                snapshot = item[key]
                if (
                    snapshot.sha256 != expected[digest_key]
                    or snapshot.bytes != expected[bytes_key]
                ):
                    raise PreparationError(f"v5 source {key} identity drifted")
    return authenticated


_PREPARE_PORTFOLIO = prepare_portfolio


def prepare_portfolio(
    *,
    root: Path = ROOT,
    campaign_path: Path | None = None,
    source_run_manifest_path: Path | None = None,
    checkpoint_path: Path | None = None,
    output_root: Path = OUTPUT_ROOT,
) -> dict[str, Any]:
    return _PREPARE_PORTFOLIO(
        root=root,
        campaign_path=campaign_path or SOURCE_CAMPAIGN_PATH,
        source_run_manifest_path=source_run_manifest_path or SOURCE_RUN_MANIFEST_PATH,
        checkpoint_path=checkpoint_path or CHECKPOINT_PATH,
        output_root=output_root,
    )


V5_SOURCE_ID_SUFFIX = "-physical-slice-cell-campaign-v5"


def build_producer(source: dict[str, Any], source_sha256: str, category: str) -> bytes:
    if source.get("schema") != PRODUCER_SCHEMA:
        raise PreparationError("source producer schema drifted")
    if source.get("producer_id") != f"{cell_id(category)}{V5_SOURCE_ID_SUFFIX}":
        raise PreparationError("source producer identity drifted")
    if (
        source.get("backend") != BACKEND
        or source.get("solver_profile") != SOURCE_SOLVER_PROFILE
    ):
        raise PreparationError("source producer backend/profile drifted")
    if source.get("query_polarity") != QUERY_POLARITY:
        raise PreparationError("source producer query polarity drifted")
    if source.get("variable_map_sha256") != VARIABLE_MAP_SHA256:
        raise PreparationError("source producer variable-map claim drifted")
    source_manifest = source.get("source_manifest")
    if type(source_manifest) is not dict or source.get(
        "source_manifest_sha256"
    ) != sha256_bytes(canonical_json_bytes(source_manifest)):
        raise PreparationError("source producer source-manifest claim drifted")
    result = dict(source)
    result["producer_id"] = portfolio_cell_id(category)
    result["solver_profile"] = SOLVER_PROFILE
    result["profile_source_producer_manifest_sha256"] = source_sha256
    return canonical_json_bytes(result)


def build_wave(
    source: dict[str, Any], producer_sha256: str, category: str, ordinal: int
) -> bytes:
    if (
        source.get("schema") != WAVE_SCHEMA
        or source.get("wave_id") != f"{cell_id(category)}{V5_SOURCE_ID_SUFFIX}"
    ):
        raise PreparationError("source wave identity drifted")
    encoding = source.get("encoding")
    execution = source.get("execution")
    if type(encoding) is not dict or type(execution) is not dict:
        raise PreparationError("source wave is malformed")
    if (
        encoding.get("query_polarity") != QUERY_POLARITY
        or encoding.get("variable_map_sha256") != VARIABLE_MAP_SHA256
        or execution.get("backend") != BACKEND
        or execution.get("solver_profile") != SOURCE_SOLVER_PROFILE
    ):
        raise PreparationError("source wave profile or encoding claims drifted")
    result = dict(source)
    result["wave_id"] = portfolio_cell_id(category)
    result["encoding"] = {**encoding, "producer_manifest_sha256": producer_sha256}
    result["execution"] = {
        **execution,
        "solver_profile": SOLVER_PROFILE,
        "shard_id": ordinal,
        "shard_count": CELL_COUNT,
        "order_sha256": ORDER_SHA256,
    }
    validate_wave_manifest(result)
    return canonical_json_bytes(result)
