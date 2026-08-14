from __future__ import annotations

import json
from pathlib import Path

import pytest

from census.p97_search.cegar_wave_assumption_profiles import (
    parse_assumption_campaign_profile,
)
from census.p97_search.cegar_wave_registry import (
    resolve_execution_registration,
    validate_registered_ingress,
)
from census.p97_search.cegar_wave_semantic_profiles import parse_profile_bytes
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    validate_wave_manifest,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import load_wave_control
from census.p97_search.phase3_piqd_static_solver_runner import (
    authenticate_static_manifests,
)

REPO_ROOT = Path(__file__).parents[3]
PROFILE_PATH = (
    Path(__file__).parents[1]
    / "waves"
    / "exact17"
    / "child40"
    / "semantic-profile.json"
)
PACKAGE_ROOT = PROFILE_PATH.parent
CONTROL_PATH = PACKAGE_ROOT / "control.json"
CHILD45_PACKAGE_ROOT = Path(__file__).parents[1] / "waves" / "exact17" / "child45"
CHILD45_EXECUTION_CONTROL_PATH = CHILD45_PACKAGE_ROOT / "execution-control-v2.json"
CHILD45_ASSUMPTION_CAMPAIGN_PATH = CHILD45_PACKAGE_ROOT / "assumption-campaign.json"
CHILD45_ASSUMPTION_MANIFEST_PATH = (
    CHILD45_PACKAGE_ROOT / "assumption-wave-manifest.json"
)
CHILD45_ASSUMPTION_CONTROL_PATH = CHILD45_PACKAGE_ROOT / "assumption-control.json"

EXPECTED_ARTIFACTS = {
    "child_cnf": (
        "scratch/exact17-lean-to-sat/exact17-thirty-fortieth-root-thirty-ninth-model-refinements.cnf",
        291_633_186,
        "555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034",
    ),
    "daemon_build_receipt": (
        "scratch/exact17-lean-to-sat/piqd-child35-daemon-build-receipt.txt",
        6_895,
        "6e9c1d5c203d59ac2b29f800d73f4dbb0395b97865433f412ff4aa44c8e1b0a9",
    ),
    "export_receipt": (
        "scratch/exact17-lean-to-sat/child40-export-receipt.json",
        2_870,
        "28229868ae4aa0906411bad45efbe2b5cdc947d0bead388432aad80847db2516",
    ),
    "ingress_manifest": (
        "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-ninth-model-refinements-core1.json",
        4_127,
        "df1c180056ee4c47e1d5ddc645ebda10a0129c9abcb6a41cace6749627469cd8",
    ),
    "lean_export": (
        "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyNinthModelRefinementsExport.lean",
        1_082,
        "e5634ee294b4ae348cf553ee186777d48a2e32ff2407ab1caa83547c08c0a632",
    ),
    "lean_root": (
        "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenThirtyNinthModelRefinements.lean",
        7_017,
        "76f993c6335f39e913f187be26118307025c58feb22e47f5e8284518625f107e",
    ),
    "model": (
        "scratch/exact17-lean-to-sat/piqd-child39-core1-custody-model.json",
        4_168,
        "66afb43a0b6f9d686a800239c616d006f0fed5c7d681bf6d2b5cd22dd8a501e1",
    ),
    "parent_cnf": (
        "scratch/exact17-lean-to-sat/exact17-thirty-ninth-root-thirty-eighth-model-refinements.cnf",
        291_625_610,
        "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a",
    ),
    "parent_manifest": (
        "scratch/exact17-lean-to-sat/piqd-ingress-manifest-thirty-eighth-model-refinements-core1.json",
        4_049,
        "275a61b6febdc1ca5104ebe932919c24e2226f794e68b22caf02ffcbb076c83d",
    ),
}

EXPECTED_CHILD45_ARTIFACTS = {
    "child_cnf": (
        "scratch/exact17-lean-to-sat/exact17-forty-fifth-root-forty-fourth-model-refinements.cnf",
        291_704_992,
        "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
    ),
    "export_receipt": (
        "scratch/exact17-lean-to-sat/child45-export-receipt.json",
        2_945,
        "fd12b39d26f9fbe82f9e06edad9d7183b3af5b9b4c8cad1fa7ae2fa3f032e8a3",
    ),
    "final": (
        "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-final.json",
        4_779,
        "b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa",
    ),
    "lean_export": (
        "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyFourthModelRefinementsExport.lean",
        1_351,
        "d2eb848ccd9ca3138d3bc97c35dee2f51f7546edfefed54104a21bd84b18ba38",
    ),
    "lean_root": (
        "lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenFortyFourthModelRefinements.lean",
        5_463,
        "f9238553222414f52c2282ccdda7764506e69aef4eca710263d7bd6930b6d7f2",
    ),
    "model": (
        "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-model.json",
        4_168,
        "2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a",
    ),
    "parent_cnf": (
        "scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf",
        291_704_790,
        "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9",
    ),
}


def test_child40_declarative_profile_is_canonical_and_retained() -> None:
    profile = parse_profile_bytes(PROFILE_PATH.read_bytes())
    assert profile.validator == "exact17-child40"
    assert profile.control == {
        "clauses": 5_847_584,
        "cnf_sha256": "555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034",
        "domain_kind": "STATIC_CNF",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "variables": 308,
    }
    assert profile.payload["cleanup"] == {
        "cleanup_eligible": False,
        "lifecycle": "RETAIN",
    }
    assert profile.payload["contract"]["parent"] == {
        "clauses": 5_847_388,
        "sha256": "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a",
        "variables": 308,
    }
    assert profile.payload["contract"]["ordered_suffix_sha256"] == (
        "e34111b179caf00ed0e04c3f28d17fd670d7a2291a9761a09f0d6984bdf19be5"
    )
    assert profile.payload["contract"]["artifact_roles"] == [
        "child_cnf",
        "daemon_build_receipt",
        "export_receipt",
        "ingress_manifest",
        "lean_export",
        "lean_root",
        "model",
        "parent_cnf",
        "parent_manifest",
    ]


def test_child40_native_package_is_canonical_and_source_bound() -> None:
    package = {
        name: (PACKAGE_ROOT / name).read_bytes()
        for name in (
            "control.json",
            "producer-manifest.json",
            "variable-map.json",
            "wave-manifest.json",
        )
    }
    for raw in package.values():
        assert canonical_json_bytes(json.loads(raw)) == raw

    control = load_wave_control(package["control.json"])
    producer = json.loads(package["producer-manifest.json"])
    source = producer["source_manifest"]
    authenticate_static_manifests(
        source_manifest=canonical_json_bytes(source),
        producer_manifest=package["producer-manifest.json"],
    )
    source_path = REPO_ROOT / source["source_path"]
    assert sha256_bytes(source_path.read_bytes()) == source["source_sha256"]

    named_variables = {
        **{
            f"hit:center={center}:point={point}": 1 + 17 * center + point
            for center in range(17)
            for point in range(17)
        },
        **{f"nextCenter:center={center}": 290 + center for center in range(17)},
        **{f"namedOrder:order={order}": 307 + order for order in range(2)},
    }
    expected_map = {
        "coverage": "COMPLETE_1_TO_NUM_VARIABLES",
        "entries": [
            {
                "id": variable_id,
                "kind": "named",
                "name": name,
                "used_in_cnf": True,
            }
            for name, variable_id in sorted(
                named_variables.items(), key=lambda item: item[1]
            )
        ],
        "num_variables": 308,
        "schema": "p97-piqd-frontier-total-variable-map/v1",
    }
    assert canonical_json_bytes(expected_map) == package["variable-map.json"]

    assert control.cnf.sha256 == EXPECTED_ARTIFACTS["child_cnf"][2]
    assert {
        role: (reference.path, reference.max_bytes, reference.sha256)
        for role, reference in control.semantic_artifacts
    } == EXPECTED_ARTIFACTS


def test_child40_native_package_replays_registered_ingress_offline() -> None:
    control = load_wave_control(CONTROL_PATH.read_bytes())
    missing = [
        reference.path
        for _, reference in control.semantic_artifacts
        if not (REPO_ROOT / reference.path).is_file()
    ]
    if missing:
        pytest.skip(f"retained Child40 artifact is absent: {missing[0]}")

    ingress = validate_registered_ingress(control, REPO_ROOT)

    assert ingress["cnf_sha256"] == EXPECTED_ARTIFACTS["child_cnf"][2]
    assert ingress["num_variables"] == 308
    assert ingress["num_clauses"] == 5_847_584
    assert ingress["semantic_profile"]["metadata"] == {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "profile_id": "exact17-child40",
        "validator": "exact17-child40",
        "classification": {"mode": "offline", "scope": "finite"},
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
    }
    assert ingress["semantic_artifacts"] == [
        {
            "role": role,
            "sha256": sha256,
            "bytes": size,
            "link_count": 3 if role == "daemon_build_receipt" else 1,
            "custody": (
                "RETAINED_LEGACY_HARDLINK_REFERENCE"
                if role == "daemon_build_receipt"
                else "EXCLUSIVE_SINGLE_LINK"
            ),
        }
        for role, (_path, size, sha256) in sorted(EXPECTED_ARTIFACTS.items())
    ]


def test_child45_declarative_package_is_canonical_and_source_bound() -> None:
    package = {
        name: (CHILD45_PACKAGE_ROOT / name).read_bytes()
        for name in (
            "control.json",
            "execution-control-v2.json",
            "producer-manifest.json",
            "semantic-profile.json",
            "wave-manifest.json",
        )
    }
    for raw in package.values():
        assert canonical_json_bytes(json.loads(raw)) == raw

    profile = parse_profile_bytes(package["semantic-profile.json"])
    assert profile.validator == "exact17-child45"
    assert profile.control == {
        "clauses": 5_848_824,
        "cnf_sha256": "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2",
        "domain_kind": "STATIC_CNF",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "variables": 308,
    }
    assert profile.payload["contract"]["artifact_roles"] == sorted(
        EXPECTED_CHILD45_ARTIFACTS
    )
    assert profile.payload["contract"]["ordered_suffix_sha256"] == (
        "7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590"
    )

    control = load_wave_control(package["control.json"])
    assert control.retained_hardlink_counts == ()
    registration = resolve_execution_registration(control)
    assert registration.adapter_schema == "v3-data-only"
    assert registration.capabilities == ("plan", "status", "validate-ingress")
    assert registration.permits_campaign is False
    assert registration.permits_terminal_proof is False
    assert control.variable_map.path == (
        "census/p97_search/waves/exact17/child40/variable-map.json"
    )
    assert control.variable_map.sha256 == (
        "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
    )
    assert {
        role: (reference.path, reference.max_bytes, reference.sha256)
        for role, reference in control.semantic_artifacts
    } == EXPECTED_CHILD45_ARTIFACTS

    expected_execution_control = json.loads(package["control.json"])
    expected_execution_control["schema"] = "p97-cegar-wave-control/v2"
    expected_execution_control["adapter_schema"] = "v2"
    del expected_execution_control["retained_hardlink_counts"]
    assert (
        canonical_json_bytes(expected_execution_control)
        == package["execution-control-v2.json"]
    )
    assert sha256_bytes(package["execution-control-v2.json"]) == (
        "70e2bfb569a16a47e102ccd8cd9aca1e74a4f7b95154060a66d9a601d5564657"
    )
    execution_control = load_wave_control(package["execution-control-v2.json"])
    execution_registration = resolve_execution_registration(execution_control)
    assert execution_control.retained_hardlink_counts == ()
    assert execution_registration.adapter_schema == "v2"
    assert execution_registration.capabilities == (
        "check",
        "plan",
        "run",
        "status",
        "validate-ingress",
        "validate-output",
    )
    assert execution_registration.permits_campaign is False
    assert execution_registration.permits_terminal_proof is False

    producer = json.loads(package["producer-manifest.json"])
    source = producer["source_manifest"]
    authenticate_static_manifests(
        source_manifest=canonical_json_bytes(source),
        producer_manifest=package["producer-manifest.json"],
    )
    assert source["source_theorem"] == (
        "Problem97.ATailBlockerVExactSeventeenFortyFourthModelRefinements."
        "sourceAssign_extendedFortyFourthModelRefinementsCnf"
    )
    assert (
        sha256_bytes((REPO_ROOT / source["source_path"]).read_bytes())
        == (source["source_sha256"])
    )


def test_child45_native_package_replays_registered_ingress_offline() -> None:
    control = load_wave_control(CHILD45_EXECUTION_CONTROL_PATH.read_bytes())
    missing = [
        reference.path
        for _, reference in control.semantic_artifacts
        if not (REPO_ROOT / reference.path).is_file()
    ]
    if missing:
        pytest.skip(f"retained Child45 artifact is absent: {missing[0]}")

    ingress = validate_registered_ingress(control, REPO_ROOT)

    assert ingress["cnf_sha256"] == EXPECTED_CHILD45_ARTIFACTS["child_cnf"][2]
    assert ingress["num_variables"] == 308
    assert ingress["num_clauses"] == 5_848_824
    assert ingress["semantic_profile"]["metadata"] == {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "profile_id": "exact17-child45",
        "validator": "exact17-child45",
        "classification": {"mode": "offline", "scope": "finite"},
        "cleanup": {"cleanup_eligible": False, "lifecycle": "RETAIN"},
    }
    assert ingress["semantic_artifacts"] == [
        {
            "role": role,
            "sha256": sha256,
            "bytes": size,
        }
        for role, (_path, size, sha256) in sorted(EXPECTED_CHILD45_ARTIFACTS.items())
    ]


def test_child45_assumption_package_is_canonical_and_closed() -> None:
    campaign_raw = CHILD45_ASSUMPTION_CAMPAIGN_PATH.read_bytes()
    manifest_raw = CHILD45_ASSUMPTION_MANIFEST_PATH.read_bytes()
    control_raw = CHILD45_ASSUMPTION_CONTROL_PATH.read_bytes()
    for raw in (campaign_raw, manifest_raw, control_raw):
        assert canonical_json_bytes(json.loads(raw)) == raw

    assert len(campaign_raw) == 3_097
    assert sha256_bytes(campaign_raw) == (
        "845e9a10137267764e07bca6e2d01c1a0b3dff5856e646b569b8c46d51c7d48f"
    )
    campaign_payload = json.loads(campaign_raw)
    assert "first_canary" not in campaign_payload
    campaign = parse_assumption_campaign_profile(campaign_raw)
    assert campaign.schema == "p97-exact17-child45-nextcenter-cells/v1"
    assert campaign.profile_id == "exact17-child45-nextcenter"
    assert campaign.parent_job_id == "8726dcec-978e-4fdc-8ca0-c33d14197c81"
    assert campaign.parent_sha256 == EXPECTED_CHILD45_ARTIFACTS["child_cnf"][2]
    assert campaign.producer_manifest_sha256 == (
        "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
    )
    assert (campaign.variables, campaign.clauses, campaign.parent_byte_count) == (
        308,
        5_848_824,
        291_704_992,
    )
    assert campaign.source_parent_path == EXPECTED_CHILD45_ARTIFACTS["parent_cnf"][0]
    assert campaign.source_parent_sha256 == EXPECTED_CHILD45_ARTIFACTS["parent_cnf"][2]
    assert (
        campaign.source_parent_variables,
        campaign.source_parent_clauses,
        campaign.source_parent_byte_count,
    ) == (308, 5_848_820, 291_704_790)
    assert len(campaign.cells) == 13
    assert tuple(cell.next_center for cell in campaign.cells) == (
        0,
        1,
        2,
        3,
        4,
        5,
        6,
        7,
        12,
        13,
        14,
        15,
        16,
    )
    assert campaign.cell("next-center-15").assumptions == (305,)

    manifest = json.loads(manifest_raw)
    validate_wave_manifest(manifest)
    assert len(manifest_raw) == 1_286
    assert sha256_bytes(manifest_raw) == (
        "327c9a558b6828c77a69288780aaec7aec1ee17334267086eaf9fd5a9b4a0af5"
    )
    assert wave_manifest_sha256(manifest) == sha256_bytes(manifest_raw)
    assert manifest["wave_id"] == "exact17-child45-nextcenter"
    assert manifest["iteration"] == 45
    assert manifest["parent_checkpoint_sha256"] == EXPECTED_CHILD45_ARTIFACTS[
        "child_cnf"
    ][2]
    assert manifest["source"] == {
        "cardinality_scope": "thirteen source-total next-center cells",
        "finite_schema": "p97-exact17-child45-nextcenter-cells/v1",
        "ingress_hypotheses_sha256": EXPECTED_CHILD45_ARTIFACTS["lean_root"][2],
        "live_leaf": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm",
        "source_theorem": (
            "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel."
            "nextCenter_mem_legalNextCenterLabels"
        ),
    }
    assert manifest["encoding"] == {
        "cnf_sha256": EXPECTED_CHILD45_ARTIFACTS["child_cnf"][2],
        "num_clauses": 5_848_824,
        "num_variables": 308,
        "producer_manifest_sha256": (
            "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
        ),
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "variable_map_sha256": (
            "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
        ),
    }
    assert manifest["execution"] == {
        "backend": "cadical",
        "order_sha256": sha256_bytes(campaign_raw),
        "seed": 0,
        "shard_count": 1,
        "shard_id": 0,
        "solver_profile": "piqd-satworker-cadical-3.0.0",
    }

    control = load_wave_control(control_raw)
    assert len(control_raw) == 1_376
    assert sha256_bytes(control_raw) == (
        "ba086684a71e8dd3def1f2d10f62271677a9abafd220e420c35fc64c1b427e2b"
    )
    assert control.value["schema"] == "p97-cegar-wave-control/v3"
    assert control.value["wave_kind"] == "ASSUMPTION_CNF"
    assert control.value["semantic_validator"] == (
        "p97-assumption-cnf-semantic-replay/v1"
    )
    assert control.campaign is not None
    assert control.campaign.path == (
        "census/p97_search/waves/exact17/child45/assumption-campaign.json"
    )
    assert control.campaign.sha256 == sha256_bytes(campaign_raw)
    assert control.manifest.path == (
        "census/p97_search/waves/exact17/child45/assumption-wave-manifest.json"
    )
    assert control.manifest.sha256 == sha256_bytes(manifest_raw)
    assert control.cnf.path == EXPECTED_CHILD45_ARTIFACTS["child_cnf"][0]
    assert control.cnf.sha256 == EXPECTED_CHILD45_ARTIFACTS["child_cnf"][2]
    assert control.producer_manifest.path == (
        "census/p97_search/waves/exact17/child45/producer-manifest.json"
    )
    assert control.producer_manifest.sha256 == (
        "f790a9ea3f9100f0d63a61b8cc197d3417eaa9c553d578c1157413690157908a"
    )
    assert control.variable_map.path == (
        "census/p97_search/waves/exact17/child40/variable-map.json"
    )
    assert control.variable_map.sha256 == (
        "78df650209311154e9a5fb6fdb88b6e532acaa624b7789d3028434c05e38e63f"
    )
    registration = resolve_execution_registration(control)
    assert registration.adapter_id == "assumption-cnf-piqd"
    assert registration.adapter_schema == "v1"
    assert registration.engine_schema == "p97-cegar-assumption-cnf-engine/v1"
    assert registration.capabilities == (
        "check",
        "plan",
        "run",
        "status",
        "validate-ingress",
        "validate-output",
    )
    assert registration.permits_campaign is True
    assert registration.permits_diagnostic_mining is True
    assert registration.permits_export is False
    assert registration.permits_terminal_proof is False
