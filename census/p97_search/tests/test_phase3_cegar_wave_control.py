from __future__ import annotations

import json
import os
from copy import deepcopy
from dataclasses import replace
from pathlib import Path

import pytest

import census.p97_search.phase3_cegar_wave_control as wave_control
from census.p97_search.cegar_wave_assumption_profiles import (
    parse_assumption_campaign_profile,
)
from census.p97_search.phase3_cegar_wave import (
    LOCAL_CERTIFICATE,
    SAT_MEANS_COUNTEREXAMPLE,
    UNSAT_MEANS_OBSTRUCTION,
    canonical_json_bytes,
    sha256_bytes,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import (
    ACTIVE,
    ARTIFACT,
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    CAMPAIGN,
    CLEANUP_PLAN_SCHEMA,
    CNF,
    COMPATIBILITY_SHIM,
    CONTROL_SCHEMA,
    CONTROL_SCHEMA_V3,
    CUBE,
    ENTRYPOINT,
    FROZEN_REPRODUCTION,
    INVENTORY_SCHEMA,
    JOURNAL,
    LRAT,
    MAX_STATIC_CNF_BYTES,
    NOT_RUN,
    OUTPUT,
    PACKAGE,
    PASS,
    PROOF,
    PROTECTED_ARTIFACT,
    RECEIPT,
    RESULT,
    STATIC_CNF,
    STATIC_CNF_PIQD_ADAPTER,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA,
    STATIC_CNF_SEMANTIC_VALIDATOR,
    STATIC_REGISTRY,
    UNCLASSIFIED,
    WaveControlError,
    bind_assumption_cnf,
    bind_static_cnf,
    build_cleanup_plan,
    load_entrypoint_inventory,
    load_wave_control,
)
from census.p97_search.phase3_piqd_assumption_campaign import CnfStreamIdentity
from census.p97_search.phase3_piqd_driver import DriverPolicy


def _write(root: Path, relative: str, payload: bytes) -> dict[str, str]:
    path = root / relative
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(payload)
    return {"path": relative, "sha256": sha256_bytes(payload)}


def _package(
    tmp_path: Path,
    *,
    cnf: bytes = b"p cnf 1 1\n1 0\n",
    producer: bytes | None = None,
    variable_map: bytes | None = None,
) -> tuple[bytes, dict[str, bytes]]:
    payloads = {
        "cnf": cnf,
        "producer": (
            producer
            if producer is not None
            else canonical_json_bytes({"producer": "fixture"})
        ),
        "map": (
            variable_map
            if variable_map is not None
            else canonical_json_bytes({"1": "fixture-variable"})
        ),
    }
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "static-fixture-wave",
        "iteration": 0,
        "parent_checkpoint_sha256": None,
        "source": {
            "live_leaf": "Problem97.fixtureLeaf",
            "ingress_hypotheses_sha256": sha256_bytes(b"fixture-ingress"),
            "finite_schema": "fixture-static-cnf/v1",
            "cardinality_scope": "one authenticated finite fixture",
            "source_theorem": "Problem97.fixtureSource",
        },
        "encoding": {
            "cnf_sha256": sha256_bytes(payloads["cnf"]),
            "variable_map_sha256": sha256_bytes(payloads["map"]),
            "producer_manifest_sha256": sha256_bytes(payloads["producer"]),
            "num_variables": 1,
            "num_clauses": 1,
            "query_polarity": UNSAT_MEANS_OBSTRUCTION,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "proof",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(b"fixture-order"),
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    payloads["manifest"] = canonical_json_bytes(manifest)
    references = {}
    for name, relative in (
        ("cnf", "package/input.cnf"),
        ("producer", "package/producer.json"),
        ("map", "package/variable-map.json"),
        ("manifest", "package/wave.json"),
    ):
        reference = _write(tmp_path, relative, payloads[name])
        references[name] = {**reference, "max_bytes": 1 << 20}
    assert references["manifest"]["sha256"] == wave_manifest_sha256(manifest)
    control = {
        "schema": CONTROL_SCHEMA,
        "wave_kind": STATIC_CNF,
        "adapter_id": STATIC_CNF_PIQD_ADAPTER,
        "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA,
        "wave_manifest": references["manifest"],
        "package": {
            "cnf": references["cnf"],
            "producer_manifest": references["producer"],
            "variable_map": references["map"],
        },
        "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
        "semantic_validator": STATIC_CNF_SEMANTIC_VALIDATOR,
    }
    return canonical_json_bytes(control), payloads


def _pointer(root: Path, relative: str, payload: bytes) -> dict[str, str]:
    return _write(root, relative, payload)


def _entry(root: Path, relative: str = "scripts/legacy-wave.py") -> dict[str, object]:
    target = _pointer(root, relative, b"print('legacy')\n")
    replacement = _pointer(root, "scripts/wave-framework.py", b"print('framework')\n")
    shadow = _pointer(root, "receipts/shadow.json", b"shadow-pass\n")
    historical = _pointer(root, "receipts/historical.json", b"historical-pass\n")
    archive = _pointer(root, "archives/legacy.json", b"archive\n")
    rollback = _pointer(root, "archives/rollback.json", b"rollback\n")
    return {
        **target,
        "wave_id": "legacy-wave",
        "kind": ENTRYPOINT,
        "lifecycle": COMPATIBILITY_SHIM,
        "replacement": replacement,
        "runtime_callers": [],
        "active_manifest_references": [],
        "static_callers": [],
        "receipt_paths": [historical["path"], shadow["path"]],
        "artifact_paths": ["artifacts/legacy-proof.lrat"],
        "archive_manifest": archive,
        "rollback_pointer": rollback,
        "shadow_replay": {"status": PASS, "receipt": shadow},
        "historical_replay": {"status": PASS, "receipt": historical},
        "active_writer": False,
        "cleanup_approved": True,
    }


def _inventory(*entries: dict[str, object]) -> bytes:
    ordered = sorted(entries, key=lambda entry: str(entry["path"]))
    return canonical_json_bytes({"schema": INVENTORY_SCHEMA, "entries": ordered})


def _cleanup_plan(
    raw: bytes,
    root: Path,
    *,
    expected_sha256: str | None = None,
    approved_entrypoints: dict[str, str] | None = None,
) -> dict[str, object]:
    root = root.resolve()
    if approved_entrypoints is None:
        inventory = json.loads(raw)
        approved_entrypoints = dict(
            sorted(
                (str(entry["path"]), str(entry["sha256"]))
                for entry in inventory["entries"]
                if entry["kind"] == ENTRYPOINT
            )
        )
    return build_cleanup_plan(
        raw,
        root,
        expected_inventory_sha256=expected_sha256 or sha256_bytes(raw),
        approved_entrypoints=approved_entrypoints,
    )


def test_cleanup_plan_rejects_noncanonical_repo_root(tmp_path: Path) -> None:
    root = tmp_path.resolve()
    entry = _entry(root)
    raw = _inventory(entry)
    alias = root.parent / f"{root.name}-alias"
    alias.symlink_to(root, target_is_directory=True)
    try:
        with pytest.raises(WaveControlError, match="canonical no-symlink"):
            build_cleanup_plan(
                raw,
                alias,
                expected_inventory_sha256=sha256_bytes(raw),
                approved_entrypoints={str(entry["path"]): str(entry["sha256"])},
            )
    finally:
        alias.unlink()


def test_static_registry_is_closed_and_binds_exact_package(tmp_path: Path) -> None:
    raw, payloads = _package(tmp_path)
    control = load_wave_control(raw)
    binding = bind_static_cnf(control, tmp_path)
    registration = STATIC_REGISTRY[(STATIC_CNF, STATIC_CNF_PIQD_ADAPTER, "v1")]
    assert binding.cnf == payloads["cnf"]
    assert binding.producer_manifest == payloads["producer"]
    assert binding.variable_map == payloads["map"]
    assert binding.wave_manifest_bytes == payloads["manifest"]
    assert registration.permits_campaign is False
    assert registration.permits_terminal_proof is False


def test_bind_static_cnf_rejects_relative_package_root(tmp_path: Path) -> None:
    raw, _ = _package(tmp_path)
    with pytest.raises(WaveControlError, match="must be absolute"):
        bind_static_cnf(load_wave_control(raw), Path("relative-package"))


def test_v1_control_and_package_bytes_are_frozen_and_profile_is_reserved(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)

    # This fixture is deliberately a byte-level v1 compatibility anchor.  A
    # profile belongs to a versioned control branch, never to this v1 record.
    assert len(raw) == 992
    assert sha256_bytes(raw) == (
        "cd84ec74993b7a8210f6e350073493fc9d44a72784f2ac76bf8093ac9bec5ecd"
    )
    value = json.loads(raw)
    assert set(value) == {
        "schema",
        "wave_kind",
        "adapter_id",
        "adapter_schema",
        "wave_manifest",
        "package",
        "driver_policy",
        "semantic_validator",
    }
    assert set(value["package"]) == {"cnf", "producer_manifest", "variable_map"}

    profiled = deepcopy(value)
    profiled["semantic_profile"] = {
        "schema": "p97-static-cnf-semantic-profile/v1",
        "sha256": "0" * 64,
    }
    with pytest.raises(WaveControlError):
        load_wave_control(canonical_json_bytes(profiled))


def test_v3_control_selects_only_closed_assumption_campaign(tmp_path: Path) -> None:
    raw, _ = _package(tmp_path)
    value = json.loads(raw)
    campaign = canonical_json_bytes({"schema": "closed-fixture-campaign/v1"})
    reference = _write(tmp_path, "package/campaign.json", campaign)
    value.update(
        {
            "schema": CONTROL_SCHEMA_V3,
            "wave_kind": ASSUMPTION_CNF,
            "adapter_id": ASSUMPTION_CNF_PIQD_ADAPTER,
            "adapter_schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
            "semantic_validator": ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
            "campaign": {**reference, "max_bytes": 1 << 20},
        }
    )
    control = load_wave_control(canonical_json_bytes(value))
    assert control.campaign is not None
    assert control.campaign.sha256 == sha256_bytes(campaign)
    assert control.registration.permits_campaign is True
    assert control.registration.permits_terminal_proof is False

    for crossed_schema in (CONTROL_SCHEMA, "p97-cegar-wave-control/v2"):
        crossed = deepcopy(value)
        crossed["schema"] = crossed_schema
        with pytest.raises(WaveControlError):
            load_wave_control(canonical_json_bytes(crossed))

    crossed = deepcopy(value)
    crossed.pop("campaign")
    with pytest.raises(WaveControlError):
        load_wave_control(canonical_json_bytes(crossed))


def test_assumption_binding_streams_parent_and_cross_binds_profile(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    campaign_bytes = (
        Path(__file__).parents[1] / "exact17_child44_nextcenter_cells_v1.json"
    ).read_bytes()
    campaign_sha = sha256_bytes(campaign_bytes)
    parent_sha = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
    producer_sha = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
    variable_map = canonical_json_bytes({"profile": "child44-reviewed-map"})
    variable_sha = sha256_bytes(variable_map)
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "exact17-child44-nextcenter",
        "iteration": 44,
        "parent_checkpoint_sha256": parent_sha,
        "source": {
            "live_leaf": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm",
            "ingress_hypotheses_sha256": sha256_bytes(b"child44-ingress"),
            "finite_schema": "p97-exact17-child44-nextcenter-cells/v1",
            "cardinality_scope": "thirteen source-total next-center cells",
            "source_theorem": "Problem97.ATailBlockerVExactSeventeenSourceNormalForm.SourceModel.nextCenter_mem_legalNextCenterLabels",
        },
        "encoding": {
            "cnf_sha256": parent_sha,
            "variable_map_sha256": variable_sha,
            "producer_manifest_sha256": producer_sha,
            "num_variables": 308,
            "num_clauses": 5_848_820,
            "query_polarity": SAT_MEANS_COUNTEREXAMPLE,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "piqd-satworker-cadical-3.0.0",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": sha256_bytes(campaign_bytes),
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    manifest_bytes = canonical_json_bytes(manifest)
    control_value = {
        "schema": CONTROL_SCHEMA_V3,
        "wave_kind": ASSUMPTION_CNF,
        "adapter_id": ASSUMPTION_CNF_PIQD_ADAPTER,
        "adapter_schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
        "wave_manifest": {
            "path": "package/wave.json",
            "sha256": wave_manifest_sha256(manifest),
            "max_bytes": 1 << 20,
        },
        "package": {
            "cnf": {
                "path": "package/parent.cnf",
                "sha256": parent_sha,
                "max_bytes": 512 << 20,
            },
            "producer_manifest": {
                "path": "package/producer.json",
                "sha256": producer_sha,
                "max_bytes": 1 << 20,
            },
            "variable_map": {
                "path": "package/variable-map.json",
                "sha256": variable_sha,
                "max_bytes": 1 << 20,
            },
        },
        "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
        "semantic_validator": ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
        "campaign": {
            "path": "package/campaign.json",
            "sha256": campaign_sha,
            "max_bytes": 1 << 20,
        },
    }
    payloads = {
        "wave manifest": manifest_bytes,
        "producer manifest": b"{}",
        "variable map": variable_map,
        "campaign profile": campaign_bytes,
    }
    monkeypatch.setattr(
        wave_control,
        "_capture",
        lambda _root, _reference, label: payloads[label],
    )
    identity = CnfStreamIdentity(
        parent_sha,
        291_704_790,
        308,
        5_848_820,
        308,
        "0" * 64,
        291_704_771,
        True,
        1,
        2,
        ((3, 4),),
    )
    monkeypatch.setattr(wave_control, "stream_parent_identity", lambda _path: identity)
    binding = bind_assumption_cnf(
        load_wave_control(canonical_json_bytes(control_value)), tmp_path
    )
    assert binding.parent_identity is identity
    assert binding.campaign.raw_sha256 == campaign_sha
    assert binding.parent_path == tmp_path / "package/parent.cnf"
    assert binding.producer_manifest == b"{}"
    assert binding.variable_map == variable_map


def test_assumption_binding_captures_authenticated_source_parent(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    campaign_bytes = (
        Path(__file__).parents[1] / "exact17_child44_nextcenter_cells_v1.json"
    ).read_bytes()
    campaign = parse_assumption_campaign_profile(campaign_bytes)
    source_path = "package/source-parent.cnf"
    campaign = replace(
        campaign,
        source_parent_path=source_path,
        source_parent_sha256=campaign.parent_sha256,
        source_parent_variables=campaign.variables,
        source_parent_clauses=campaign.clauses,
        source_parent_byte_count=campaign.parent_byte_count,
    )
    monkeypatch.setattr(
        wave_control,
        "parse_assumption_campaign_profile",
        lambda _raw: campaign,
    )

    # Reuse the complete control/package fixture above and make both streamed
    # identities exact matches for the synthetic source-parent metadata.
    campaign_sha = sha256_bytes(campaign_bytes)
    parent_sha = campaign.parent_sha256
    producer_sha = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
    variable_map = canonical_json_bytes({"profile": "child44-reviewed-map"})
    manifest = {
        "schema": "p97-cegar-wave/v1",
        "wave_id": "exact17-child44-source-parent-fixture",
        "iteration": 44,
        "parent_checkpoint_sha256": parent_sha,
        "source": {
            "live_leaf": "Problem97.fixture",
            "ingress_hypotheses_sha256": sha256_bytes(b"fixture"),
            "finite_schema": "p97-exact17-child44-nextcenter-cells/v1",
            "cardinality_scope": "thirteen source-total next-center cells",
            "source_theorem": "Problem97.fixture.SourceModel",
        },
        "encoding": {
            "cnf_sha256": parent_sha,
            "variable_map_sha256": sha256_bytes(variable_map),
            "producer_manifest_sha256": producer_sha,
            "num_variables": campaign.variables,
            "num_clauses": campaign.clauses,
            "query_polarity": SAT_MEANS_COUNTEREXAMPLE,
        },
        "execution": {
            "backend": "cadical",
            "solver_profile": "piqd-satworker-cadical-3.0.0",
            "shard_id": 0,
            "shard_count": 1,
            "order_sha256": campaign_sha,
            "seed": 0,
        },
        "promotion": {
            "evidence_classification": LOCAL_CERTIFICATE,
            "producer_theorem": None,
            "lift_theorem": None,
            "consumer_theorem": None,
        },
    }
    manifest_bytes = canonical_json_bytes(manifest)
    identity = CnfStreamIdentity(
        parent_sha,
        campaign.parent_byte_count,
        campaign.variables,
        campaign.clauses,
        campaign.variables,
        "0" * 64,
        campaign.parent_byte_count,
        True,
        1,
        2,
        ((3, 4),),
    )
    payloads = {
        "wave manifest": manifest_bytes,
        "producer manifest": b"{}",
        "variable map": variable_map,
        "campaign profile": campaign_bytes,
    }
    monkeypatch.setattr(
        wave_control,
        "_capture",
        lambda _root, _reference, label: payloads[label],
    )
    monkeypatch.setattr(wave_control, "stream_parent_identity", lambda _path: identity)
    control_value = {
        "schema": CONTROL_SCHEMA_V3,
        "wave_kind": ASSUMPTION_CNF,
        "adapter_id": ASSUMPTION_CNF_PIQD_ADAPTER,
        "adapter_schema": ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
        "wave_manifest": {
            "path": "package/wave.json",
            "sha256": wave_manifest_sha256(manifest),
            "max_bytes": 1 << 20,
        },
        "package": {
            "cnf": {
                "path": "package/parent.cnf",
                "sha256": parent_sha,
                "max_bytes": 512 << 20,
            },
            "producer_manifest": {
                "path": "package/producer.json",
                "sha256": producer_sha,
                "max_bytes": 1 << 20,
            },
            "variable_map": {
                "path": "package/variable-map.json",
                "sha256": sha256_bytes(variable_map),
                "max_bytes": 1 << 20,
            },
        },
        "driver_policy": DriverPolicy(requested_core_limit=1).as_dict(),
        "semantic_validator": ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
        "campaign": {
            "path": "package/campaign.json",
            "sha256": campaign_sha,
            "max_bytes": 1 << 20,
        },
    }
    loaded_control = load_wave_control(canonical_json_bytes(control_value))
    binding = bind_assumption_cnf(loaded_control, tmp_path)
    assert binding.source_parent_path == tmp_path / source_path
    assert binding.source_parent_identity is identity

    crossed_identity = replace(identity, sha256="a" * 64)
    monkeypatch.setattr(
        wave_control,
        "stream_parent_identity",
        lambda path: identity if path.name == "parent.cnf" else crossed_identity,
    )
    with pytest.raises(WaveControlError, match="source-parent identity is crossed"):
        bind_assumption_cnf(loaded_control, tmp_path)


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("wave_kind", "CAMPAIGN"),
        ("adapter_id", "python.module:dynamic_adapter"),
        ("adapter_schema", "v2"),
        ("semantic_validator", "accept-anything/v1"),
    ],
)
def test_control_rejects_unregistered_or_crossed_dispatch(
    tmp_path: Path, field: str, value: str
) -> None:
    raw, _ = _package(tmp_path)
    control = json.loads(raw)
    control[field] = value
    with pytest.raises(WaveControlError):
        load_wave_control(canonical_json_bytes(control))


def test_control_rejects_duplicate_noncanonical_and_crossed_package(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)
    with pytest.raises(WaveControlError, match="canonical"):
        load_wave_control(raw + b"\n")
    with pytest.raises(WaveControlError, match="duplicate"):
        load_wave_control(b'{"schema":"a","schema":"b"}')
    control = load_wave_control(raw)
    (tmp_path / control.cnf.path).write_bytes(b"p cnf 1 0\n")
    with pytest.raises(WaveControlError, match="digest"):
        bind_static_cnf(control, tmp_path)


@pytest.mark.parametrize("attack", ["symlink", "hardlink", "oversize"])
def test_package_capture_rejects_link_and_size_attacks(
    tmp_path: Path, attack: str
) -> None:
    raw, _ = _package(tmp_path)
    control = load_wave_control(raw)
    target = tmp_path / control.cnf.path
    if attack == "symlink":
        saved = tmp_path / "saved.cnf"
        target.rename(saved)
        target.symlink_to(saved)
    elif attack == "hardlink":
        os.link(target, tmp_path / "second-link.cnf")
    else:
        crossed = deepcopy(control.value)
        crossed["package"]["cnf"]["max_bytes"] = 1
        control = load_wave_control(canonical_json_bytes(crossed))
    with pytest.raises(WaveControlError, match="capture"):
        bind_static_cnf(control, tmp_path)


def test_control_reference_caps_and_reconstructed_object_are_revalidated(
    tmp_path: Path,
) -> None:
    raw, _ = _package(tmp_path)
    crossed = json.loads(raw)
    crossed["package"]["cnf"]["max_bytes"] = MAX_STATIC_CNF_BYTES + 1
    with pytest.raises(WaveControlError, match="registered limit"):
        load_wave_control(canonical_json_bytes(crossed))
    control = load_wave_control(raw)
    forged = replace(control, cnf=replace(control.cnf, max_bytes=1))
    with pytest.raises(WaveControlError, match="differs from its canonical"):
        bind_static_cnf(forged, tmp_path)


@pytest.mark.parametrize(
    ("package_kwargs", "message"),
    [
        ({"cnf": b"p cnf 1 1\n2 0\n"}, "literal exceeds"),
        (
            {"producer": b'{ "producer": "fixture" }'},
            "producer manifest must use canonical",
        ),
        (
            {"variable_map": b'{ "1": "fixture-variable" }'},
            "variable map must use canonical",
        ),
    ],
)
def test_static_semantic_validator_executes(
    tmp_path: Path, package_kwargs: dict[str, bytes], message: str
) -> None:
    raw, _ = _package(tmp_path, **package_kwargs)
    with pytest.raises(WaveControlError, match=message):
        bind_static_cnf(load_wave_control(raw), tmp_path)


def test_cleanup_plan_is_authenticated_deterministic_and_dry_run_only(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    before = {path: path.read_bytes() for path in tmp_path.rglob("*") if path.is_file()}
    plan = _cleanup_plan(raw, tmp_path)
    assert plan["schema"] == CLEANUP_PLAN_SCHEMA
    assert plan["inventory_sha256"] == sha256_bytes(raw)
    assert [target["path"] for target in plan["targets"]] == [entry["path"]]
    assert plan["blocked"] == []
    assert plan["claims"] == {
        "dry_run_only": True,
        "filesystem_mutation": False,
        "protected_artifacts_deleted": False,
    }
    assert plan == _cleanup_plan(raw, tmp_path)
    assert before == {
        path: path.read_bytes() for path in tmp_path.rglob("*") if path.is_file()
    }


@pytest.mark.parametrize(
    ("kind", "lifecycle"),
    [
        (CAMPAIGN, ACTIVE),
        (PACKAGE, ACTIVE),
        (CNF, PROTECTED_ARTIFACT),
        (CUBE, PROTECTED_ARTIFACT),
        (LRAT, PROTECTED_ARTIFACT),
        (PROOF, PROTECTED_ARTIFACT),
        (RECEIPT, PROTECTED_ARTIFACT),
        (JOURNAL, PROTECTED_ARTIFACT),
        (RESULT, PROTECTED_ARTIFACT),
        (ARTIFACT, PROTECTED_ARTIFACT),
        (OUTPUT, PROTECTED_ARTIFACT),
        (ENTRYPOINT, ACTIVE),
        (ENTRYPOINT, FROZEN_REPRODUCTION),
        (ENTRYPOINT, UNCLASSIFIED),
    ],
)
def test_cleanup_never_authenticates_protected_or_nonshim_paths(
    tmp_path: Path, kind: str, lifecycle: str
) -> None:
    entry = _entry(tmp_path)
    target = tmp_path / str(entry["path"])
    target.unlink()
    target.mkdir()
    entry["kind"] = kind
    entry["lifecycle"] = lifecycle
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    reasons = plan["blocked"][0]["reasons"]
    if kind != ENTRYPOINT:
        assert "not-an-entrypoint" in reasons
        assert "target-not-in-trusted-allowlist" in reasons
    if lifecycle != COMPATIBILITY_SHIM:
        assert "lifecycle-not-compatibility-shim" in reasons
    assert "target-authentication-failed" not in reasons


@pytest.mark.parametrize(
    ("mutate", "reason"),
    [
        (lambda entry: entry.update(replacement=None), "missing-replacement"),
        (
            lambda entry: entry.update(
                replacement={"path": entry["path"], "sha256": entry["sha256"]}
            ),
            "replacement-is-target",
        ),
        (
            lambda entry: entry.update(runtime_callers=["caller.py"]),
            "nonempty-runtime-callers",
        ),
        (
            lambda entry: entry["shadow_replay"].update(status=NOT_RUN, receipt=None),
            "shadow-replay-not-pass",
        ),
        (lambda entry: entry.update(active_writer=True), "active-writer"),
        (lambda entry: entry.update(cleanup_approved=False), "cleanup-not-approved"),
        (lambda entry: entry.update(archive_manifest=None), "missing-archive-manifest"),
        (lambda entry: entry.update(rollback_pointer=None), "missing-rollback-pointer"),
    ],
)
def test_cleanup_requires_every_retirement_gate(
    tmp_path: Path, mutate: object, reason: str
) -> None:
    entry = _entry(tmp_path)
    mutate(entry)  # type: ignore[operator]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert reason in plan["blocked"][0]["reasons"]


@pytest.mark.parametrize(
    "field",
    [
        "replacement",
        "archive_manifest",
        "rollback_pointer",
        "shadow_replay",
        "historical_replay",
        "target",
    ],
)
def test_cleanup_rejects_crossed_evidence_hashes(tmp_path: Path, field: str) -> None:
    entry = _entry(tmp_path)
    if field in {"shadow_replay", "historical_replay"}:
        entry[field]["receipt"]["sha256"] = "0" * 64  # type: ignore[index]
    elif field == "target":
        entry["sha256"] = "0" * 64
    else:
        entry[field]["sha256"] = "0" * 64  # type: ignore[index]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert any(
        "failed" in reason or "crossed" in reason
        for reason in plan["blocked"][0]["reasons"]
    )


def test_cleanup_requires_external_inventory_digest_and_trusted_entrypoint(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    with pytest.raises(WaveControlError, match="externally authenticated"):
        _cleanup_plan(raw, tmp_path, expected_sha256="0" * 64)
    missing = _cleanup_plan(raw, tmp_path, approved_entrypoints={})
    assert missing["blocked"][0]["reasons"] == ["target-not-in-trusted-allowlist"]
    crossed = _cleanup_plan(
        raw,
        tmp_path,
        approved_entrypoints={str(entry["path"]): "0" * 64},
    )
    assert crossed["blocked"][0]["reasons"] == ["target-trusted-digest-crossed"]


def test_cleanup_target_cannot_alias_protected_evidence(tmp_path: Path) -> None:
    entry = _entry(tmp_path)
    entry["artifact_paths"] = [entry["path"]]
    plan = _cleanup_plan(_inventory(entry), tmp_path)
    assert plan["targets"] == []
    assert plan["blocked"][0]["reasons"] == ["target-aliases-protected-evidence"]


def test_inventory_rejects_noncanonical_duplicate_bool_and_missing_pass_receipt(
    tmp_path: Path,
) -> None:
    entry = _entry(tmp_path)
    raw = _inventory(entry)
    with pytest.raises(WaveControlError, match="canonical"):
        load_entrypoint_inventory(raw + b"\n")
    with pytest.raises(WaveControlError, match="path-sorted and unique"):
        load_entrypoint_inventory(_inventory(entry, deepcopy(entry)))
    crossed = deepcopy(entry)
    crossed["active_writer"] = 0
    with pytest.raises(WaveControlError, match="builtin bool"):
        load_entrypoint_inventory(_inventory(crossed))
    crossed = deepcopy(entry)
    crossed["shadow_replay"]["receipt"] = None  # type: ignore[index]
    with pytest.raises(WaveControlError, match="required for PASS"):
        load_entrypoint_inventory(_inventory(crossed))
