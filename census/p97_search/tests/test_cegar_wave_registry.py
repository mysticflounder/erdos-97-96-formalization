from __future__ import annotations

import json
import os
from copy import deepcopy
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace

import pytest

import census.p97_search.cegar_wave_registry as registry
from census.p97_search.phase3_cegar_wave import (
    canonical_json_bytes,
    sha256_bytes,
    sha256_json,
    wave_manifest_sha256,
)
from census.p97_search.phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
    ASSUMPTION_CNF_PIQD_ADAPTER,
    ASSUMPTION_CNF_PIQD_ADAPTER_SCHEMA_V1,
    ASSUMPTION_CNF_SEMANTIC_VALIDATOR_V1,
    CONTROL_SCHEMA_V3,
    CONTROL_SCHEMA_V4,
    STATIC_CNF_PIQD_ADAPTER_SCHEMA_V3_DATA_ONLY,
    AssumptionCnfBinding,
    load_wave_control,
)
from census.p97_search.phase3_piqd_assumption_campaign import CnfStreamIdentity
from census.p97_search.tests.test_phase3_cegar_wave_control import _package, _write
from census.p97_search.tests.test_phase3_cegar_wave_engine import (
    _FakePiqd,
    _fixture_control,
    _fixture_v2_control,
    _make_v2_engine,
)


def _fixture_data_only_control(tmp_path: Path) -> tuple[object, Path, Path]:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    references = dict(control.semantic_artifacts)
    receipt = package_root / references["daemon_build_receipt"].path
    os.link(receipt, receipt.with_name("daemon-build-receipt-link-1.json"))
    os.link(receipt, receipt.with_name("daemon-build-receipt-link-2.json"))
    value = deepcopy(control.value)
    value.update(
        {
            "schema": CONTROL_SCHEMA_V4,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA_V3_DATA_ONLY,
            "retained_hardlink_counts": {"daemon_build_receipt": 3},
        }
    )
    return load_wave_control(canonical_json_bytes(value)), package_root, receipt


def test_v1_snapshot_bytes_and_aliases_remain_unchanged() -> None:
    assert registry.STATIC_CNF_EXECUTION_V1 is registry.STATIC_CNF_EXECUTION
    assert registry.REGISTRY_REVISION_V1 == registry.REGISTRY_REVISION
    assert canonical_json_bytes(registry.registry_snapshot()) == (
        b'{"registrations":[{"adapter_id":"static-cnf-piqd","adapter_schema":"v1",'
        b'"capabilities":["check","plan","run","status","validate-ingress",'
        b'"validate-output"],"engine_schema":"p97-cegar-static-cnf-engine/v1",'
        b'"execution_mode":"one-shot-static-cnf","permits_campaign":false,'
        b'"permits_diagnostic_mining":false,"permits_export":false,'
        b'"permits_terminal_proof":false,"registry_revision":"2026-08-13.1",'
        b'"semantic_validator":"p97-static-cnf-semantic-replay/v1",'
        b'"wave_kind":"STATIC_CNF"}],"registry_revision":"2026-08-13.1",'
        b'"schema":"p97-cegar-execution-registry/v1"}'
    )


def test_registry_resolves_exact_control_and_has_closed_capabilities(
    tmp_path: Path,
) -> None:
    control, _, _, _ = _fixture_control(tmp_path)

    registration = registry.resolve_execution_registration(control)
    assert registration is registry.STATIC_CNF_EXECUTION
    assert registration.capabilities == (
        "check",
        "plan",
        "run",
        "status",
        "validate-ingress",
        "validate-output",
    )
    assert registration.permits_campaign is False
    assert registration.permits_export is False
    assert registration.permits_diagnostic_mining is False
    assert registration.permits_terminal_proof is False
    assert registry.registry_snapshot() == {
        "schema": registry.REGISTRY_SCHEMA,
        "registry_revision": registry.REGISTRY_REVISION,
        "registrations": [registration.as_dict()],
    }


def _assumption_control(tmp_path: Path) -> object:
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
    return load_wave_control(canonical_json_bytes(value))


def test_registry_adds_assumption_campaign_only_to_all_registry(
    tmp_path: Path,
) -> None:
    control = _assumption_control(tmp_path)
    registration = registry.resolve_execution_registration(control)
    assert registration is registry.ASSUMPTION_CNF_EXECUTION_V1
    assert registration.permits_campaign is True
    assert registration.permits_diagnostic_mining is True
    assert registration.permits_terminal_proof is False
    assert registration not in registry.EXECUTION_REGISTRY.values()
    assert registration in registry.EXECUTION_REGISTRY_ALL.values()
    assert {
        "ASSUMPTION_CNF_EXECUTION_V1",
        "REGISTRY_REVISION_ASSUMPTION_V1",
    } <= set(registry.__all__)


def test_assumption_ingress_plan_and_execution_dispatch_are_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control = _assumption_control(tmp_path)
    parent = CnfStreamIdentity(
        "1" * 64,
        101,
        308,
        11,
        308,
        "2" * 64,
        88,
        True,
        3,
        4,
        ((5, 6),),
    )
    binding = AssumptionCnfBinding(
        control=control,
        wave_manifest={"schema": "p97-cegar-wave/v1"},
        wave_manifest_bytes=b"manifest",
        parent_path=tmp_path / "parent.cnf",
        parent_identity=parent,
        producer_manifest=b"producer",
        variable_map=b"map",
        campaign=object(),  # type: ignore[arg-type]
        campaign_bytes=b"campaign",
    )
    metadata = {"schema": "closed-assumption-campaign"}
    monkeypatch.setattr(registry, "bind_assumption_cnf", lambda *_: binding)
    monkeypatch.setattr(
        registry, "assumption_campaign_metadata", lambda campaign: metadata
    )
    monkeypatch.setattr(registry, "wave_manifest_sha256", lambda manifest: "3" * 64)
    ingress = registry.validate_registered_ingress(control, tmp_path)
    assert ingress["parent"] == {
        "path": str(tmp_path / "parent.cnf"),
        "sha256": "1" * 64,
        "bytes": 101,
        "variables": 308,
        "clauses": 11,
        "max_var": 308,
        "journal_sha256": "2" * 64,
        "journal_bytes": 88,
        "all_variables_used": True,
        "source_dev": 3,
        "source_ino": 4,
        "path_chain": [[5, 6]],
    }
    assert ingress["campaign"] is metadata
    plan = registry.plan_execution(control, tmp_path)
    assert plan["plan"]["steps"][1] == "authenticate-streaming-parent-and-campaign"
    assert plan["plan"]["workers"] == 1
    assert plan["plan"]["sequential"] is True

    sentinel = SimpleNamespace(classification="CELLS_UNSAT_DISCOVERY_ONLY")
    seen: list[tuple[str, object]] = []

    class FakeEngine:
        def __init__(self, **kwargs: object) -> None:
            seen.append(("init", kwargs))

        def run(self) -> object:
            seen.append(("run", None))
            return sentinel

    monkeypatch.setattr(registry, "AssumptionCnfWaveEngine", FakeEngine)
    assert (
        registry.execute_registered_wave(
            control,
            tmp_path,
            output_path=tmp_path / "result.json",
            base_url="http://127.0.0.1:7272",
            solver_signature="cadical-current",
            transport="transport",
            session_factory=lambda **_: None,
        )
        is sentinel
    )
    assert seen[-1] == ("run", None)
    kwargs = seen[0][1]
    assert isinstance(kwargs, dict)
    assert kwargs["solver_signature"] == "cadical-current"
    assert kwargs["execution_registration"] == registry._registration_envelope(
        registry.ASSUMPTION_CNF_EXECUTION_V1
    )

    seen.clear()
    assert (
        registry.execute_registered_wave(
            control,
            tmp_path,
            output_path=tmp_path / "resume.json",
            base_url="http://127.0.0.1:7272",
            solver_signature="cadical-current",
            resume_session="11111111-1111-4111-8111-111111111111",
            session_factory=lambda **_: None,
        )
        is sentinel
    )
    assert seen[0][1]["resume_session"] == "11111111-1111-4111-8111-111111111111"

    with pytest.raises(registry.WaveRegistryError, match="journal/timeout"):
        registry.execute_registered_wave(
            control,
            tmp_path,
            output_path=tmp_path / "other.json",
            base_url="http://127.0.0.1:7272",
            solver_signature="cadical-current",
            journal_root=tmp_path / "journal",
        )


def test_static_execution_rejects_resume_session(
    tmp_path: Path,
) -> None:
    control, package_root, _cnf, _producer = _fixture_control(tmp_path)
    with pytest.raises(registry.WaveRegistryError, match="assumption-runner"):
        registry.execute_registered_wave(
            control,
            package_root,
            output_path=tmp_path / "result.json",
            base_url="http://127.0.0.1:7272",
            journal_root=tmp_path / "journal",
            resume_session="11111111-1111-4111-8111-111111111111",
        )


def test_assumption_output_dispatches_to_its_registered_validator(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control = _assumption_control(tmp_path)
    output = tmp_path / "result.json"
    expected = {
        "execution_registration": registry._registration_envelope(
            registry.ASSUMPTION_CNF_EXECUTION_V1
        ),
        "summary": {"classification": "INCONCLUSIVE"},
    }
    monkeypatch.setattr(
        registry,
        "inspect_static_cnf_engine_output_structure",
        lambda path: (_ for _ in ()).throw(registry.StaticCnfEngineError("static")),
    )
    monkeypatch.setattr(
        registry, "inspect_assumption_cnf_engine_output", lambda path: expected
    )
    assert registry.inspect_registered_output_structure(output) is expected

    calls: list[tuple[object, ...]] = []

    def validate(*args: object) -> dict[str, object]:
        calls.append(args)
        return expected

    monkeypatch.setattr(registry, "validate_assumption_cnf_engine_output", validate)
    assert registry.validate_registered_output(control, tmp_path, output) is expected
    assert calls == [(control, tmp_path, output)]


def test_registry_revalidates_control_and_rejects_nonexact_objects(
    tmp_path: Path,
) -> None:
    control, _, _, _ = _fixture_control(tmp_path)

    with pytest.raises(registry.WaveRegistryError, match="exact WaveControl"):
        registry.resolve_execution_registration(object())  # type: ignore[arg-type]
    crossed = replace(control, canonical_bytes=control.canonical_bytes + b"\n")
    with pytest.raises(registry.WaveRegistryError, match="canonical revalidation"):
        registry.resolve_execution_registration(crossed)


def test_ingress_and_plan_bind_the_exact_static_package(tmp_path: Path) -> None:
    control, package_root, cnf, producer = _fixture_control(tmp_path)

    ingress = registry.validate_registered_ingress(control, package_root)
    assert ingress == {
        "wave_manifest_sha256": wave_manifest_sha256(
            registry.bind_static_cnf(control, package_root).wave_manifest
        ),
        "cnf_sha256": sha256_bytes(cnf),
        "producer_manifest_sha256": sha256_bytes(producer),
        "variable_map_sha256": control.variable_map.sha256,
        "num_variables": 3,
        "num_clauses": 2,
    }
    plan = registry.plan_execution(control, package_root)
    assert plan["control_sha256"] == sha256_bytes(control.canonical_bytes)
    assert plan["ingress"] == ingress
    assert plan["plan"]["proof_path"] is None
    assert plan["plan"]["workers"] == 1
    assert plan["plan"]["sequential"] is True


def test_data_only_ingress_authenticates_closed_retained_hardlink_policy(
    tmp_path: Path,
) -> None:
    control, package_root, receipt = _fixture_data_only_control(tmp_path)

    registration = registry.resolve_execution_registration(control)
    assert registration is registry.STATIC_CNF_DATA_ONLY_V1
    assert registration.capabilities == ("plan", "status", "validate-ingress")
    ingress = registry.validate_registered_ingress(control, package_root)
    rows = {row["role"]: row for row in ingress["semantic_artifacts"]}
    assert rows["daemon_build_receipt"] == {
        "role": "daemon_build_receipt",
        "sha256": dict(control.semantic_artifacts)["daemon_build_receipt"].sha256,
        "bytes": receipt.stat().st_size,
        "link_count": 3,
        "custody": "RETAINED_LEGACY_HARDLINK_REFERENCE",
    }
    assert rows["child_cnf"]["link_count"] == 1
    assert rows["child_cnf"]["custody"] == "EXCLUSIVE_SINGLE_LINK"
    assert registry.plan_execution(control, package_root)["plan"]["steps"] == [
        "authenticate-control",
        "authenticate-static-package",
        "authenticate-retained-legacy-references",
        "stop-without-execution",
    ]


def test_data_only_ingress_defaults_every_role_to_single_link(tmp_path: Path) -> None:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    value = deepcopy(control.value)
    value.update(
        {
            "schema": CONTROL_SCHEMA_V4,
            "adapter_schema": STATIC_CNF_PIQD_ADAPTER_SCHEMA_V3_DATA_ONLY,
            "retained_hardlink_counts": {},
        }
    )
    data_only = load_wave_control(canonical_json_bytes(value))

    ingress = registry.validate_registered_ingress(data_only, package_root)
    assert all(
        row["link_count"] == 1 and row["custody"] == "EXCLUSIVE_SINGLE_LINK"
        for row in ingress["semantic_artifacts"]
    )


def test_data_only_registration_refuses_every_execution_output_path(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _receipt = _fixture_data_only_control(tmp_path)

    monkeypatch.setattr(
        registry,
        "StaticCnfWaveEngine",
        lambda **_kwargs: (_ for _ in ()).throw(AssertionError("engine constructed")),
    )
    with pytest.raises(registry.WaveRegistryError, match="cannot execute"):
        registry.execute_registered_wave(
            control,
            package_root,
            output_path=tmp_path / "output.json",
            base_url="http://127.0.0.1:7272",
            journal_root=tmp_path / "journal",
        )
    with pytest.raises(registry.WaveRegistryError, match="no execution output"):
        registry.validate_registered_output(
            control, package_root, tmp_path / "output.json"
        )
    assert not (tmp_path / "output.json").exists()
    assert not (tmp_path / "journal").exists()


def test_data_only_hardlink_policy_is_role_and_count_closed(tmp_path: Path) -> None:
    control, package_root, receipt = _fixture_data_only_control(tmp_path)

    receipt.with_name("daemon-build-receipt-link-2.json").unlink()
    with pytest.raises(registry.WaveControlError, match="link count is crossed"):
        registry.validate_registered_ingress(control, package_root)

    value = deepcopy(control.value)
    value["retained_hardlink_counts"] = {"export_receipt": 3}
    with pytest.raises(registry.WaveControlError, match="closed legacy policy"):
        load_wave_control(canonical_json_bytes(value))

    value["retained_hardlink_counts"] = {"daemon_build_receipt": 4}
    with pytest.raises(registry.WaveControlError, match="closed legacy policy"):
        load_wave_control(canonical_json_bytes(value))

    assert receipt.stat().st_nlink == 2


def test_data_only_policy_does_not_spill_to_other_semantic_roles(
    tmp_path: Path,
) -> None:
    control, package_root, _receipt = _fixture_data_only_control(tmp_path)
    export = package_root / dict(control.semantic_artifacts)["export_receipt"].path
    os.link(export, export.with_name("export-receipt-link-1.json"))
    os.link(export, export.with_name("export-receipt-link-2.json"))

    with pytest.raises(registry.WaveControlError, match="capture failed"):
        registry.validate_registered_ingress(control, package_root)


def test_ingress_rejects_nonabsolute_and_path_subclass_before_dispatch(
    tmp_path: Path,
) -> None:
    control, _, _, _ = _fixture_control(tmp_path)

    with pytest.raises(registry.WaveRegistryError, match="absolute native Path"):
        registry.validate_registered_ingress(control, Path("relative"))

    class HostilePath(type(Path())):
        def is_absolute(self) -> bool:
            raise AssertionError("hostile hook dispatched")

    hostile = HostilePath(tmp_path)
    with pytest.raises(registry.WaveRegistryError, match="absolute native Path"):
        registry.validate_registered_ingress(control, hostile)


def test_execute_uses_registered_engine_once_with_literal_no_proof(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _, _ = _fixture_control(tmp_path)
    output = tmp_path / "result.json"
    journal = tmp_path / "journal"
    sentinel = SimpleNamespace(
        classification="SAT_OBSERVED",
        envelope_path=output,
        envelope={"engine": "self-checked"},
    )
    sleeper = lambda _: None
    seen: list[tuple[str, object]] = []

    class FakeEngine:
        def __init__(self, **kwargs: object) -> None:
            seen.append(("init", kwargs))

        def run(self, *, timeout_s: int | None, proof_path: object) -> object:
            seen.append(("run", (timeout_s, proof_path)))
            return sentinel

    monkeypatch.setattr(registry, "StaticCnfWaveEngine", FakeEngine)
    validated: list[tuple[object, ...]] = []

    def validate_registered(*args: object) -> dict[str, object]:
        validated.append(args)
        return {"validated": True}

    monkeypatch.setattr(registry, "validate_registered_output", validate_registered)
    result = registry.execute_registered_wave(
        control,
        package_root,
        output_path=output,
        base_url="http://127.0.0.1:7272",
        journal_root=journal,
        timeout_s=19,
        transport="transport",
        sleep=sleeper,
    )

    assert result.classification == sentinel.classification
    assert result.envelope_path == output
    assert result.envelope == {"validated": True}
    assert validated == [(control, package_root, output)]
    assert seen[0][0] == "init"
    assert seen[0][1] == {
        "control": control,
        "package_root": package_root,
        "output_path": output,
        "base_url": "http://127.0.0.1:7272",
        "journal_root": journal,
        "transport": "transport",
        "sleep": sleeper,
        "execution_registration": {
            "schema": registry.REGISTRY_SCHEMA,
            "registry_revision": registry.REGISTRY_REVISION,
            "registration": registry.STATIC_CNF_EXECUTION.as_dict(),
        },
    }
    assert seen[1] == ("run", (19, None))


def test_offline_output_validation_requires_absolute_native_path(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    expected = {
        "schema": "validated",
        "execution_registry": {
            "schema": registry.REGISTRY_SCHEMA,
            "registry_revision": registry.REGISTRY_REVISION,
            "registration": registry.STATIC_CNF_EXECUTION.as_dict(),
        },
    }
    monkeypatch.setattr(
        registry, "inspect_static_cnf_engine_output_structure", lambda path: expected
    )
    output = tmp_path / "result.json"
    assert registry.inspect_registered_output_structure(output) is expected
    with pytest.raises(registry.WaveRegistryError, match="absolute native Path"):
        registry.inspect_registered_output_structure(Path("relative"))


def test_offline_output_validation_selects_v2_from_authenticated_envelope(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    observed = {
        "schema": "validated",
        "execution_registry": {
            "schema": registry.REGISTRY_SCHEMA,
            "registry_revision": registry.REGISTRY_REVISION_V2,
            "registration": registry.STATIC_CNF_EXECUTION_V2.as_dict(),
        },
    }
    monkeypatch.setattr(
        registry, "inspect_static_cnf_engine_output_structure", lambda path: observed
    )

    assert (
        registry.inspect_registered_output_structure(tmp_path / "result.json")
        is observed
    )
    assert (
        registry.resolve_execution_registration_envelope(observed["execution_registry"])
        is registry.STATIC_CNF_EXECUTION_V2
    )

    observed["execution_registry"]["registry_revision"] = registry.REGISTRY_REVISION
    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.inspect_registered_output_structure(tmp_path / "result.json")

    observed["execution_registry"]["registry_revision"] = registry.REGISTRY_REVISION_V2
    crossed = deepcopy(observed)
    crossed["execution_registry"]["registration"]["engine_schema"] = (
        "p97-cegar-static-cnf-engine/v1"
    )
    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.resolve_execution_registration_envelope(crossed["execution_registry"])

    malformed = deepcopy(observed)
    malformed["execution_registry"]["registration"]["adapter_id"] = []
    with pytest.raises(registry.WaveRegistryError, match="invalid fields"):
        registry.resolve_execution_registration_envelope(
            malformed["execution_registry"]
        )


def test_registered_output_rejects_absent_or_crossed_registration(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "result.json"
    observed: dict[str, object] = {"schema": "validated"}
    monkeypatch.setattr(
        registry, "inspect_static_cnf_engine_output_structure", lambda path: observed
    )

    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.inspect_registered_output_structure(output)
    observed["execution_registry"] = {
        "schema": registry.REGISTRY_SCHEMA,
        "registry_revision": "crossed",
        "registration": registry.STATIC_CNF_EXECUTION.as_dict(),
    }
    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.inspect_registered_output_structure(output)


def test_check_cross_binds_control_package_and_registered_output(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _, _ = _fixture_control(tmp_path)
    ingress = registry.validate_registered_ingress(control, package_root)
    expected = {
        "control": {"sha256": sha256_bytes(control.canonical_bytes)},
        "wave_manifest": {
            "sha256": ingress["wave_manifest_sha256"],
            "manifest": {
                "encoding": {
                    "num_variables": ingress["num_variables"],
                    "num_clauses": ingress["num_clauses"],
                    "cnf_sha256": ingress["cnf_sha256"],
                    "producer_manifest_sha256": ingress["producer_manifest_sha256"],
                    "variable_map_sha256": ingress["variable_map_sha256"],
                }
            },
        },
        "package": {
            "cnf_sha256": ingress["cnf_sha256"],
            "producer_manifest_sha256": ingress["producer_manifest_sha256"],
            "variable_map_sha256": ingress["variable_map_sha256"],
        },
        "execution_registry": {
            "schema": registry.REGISTRY_SCHEMA,
            "registry_revision": registry.REGISTRY_REVISION,
            "registration": registry.STATIC_CNF_EXECUTION.as_dict(),
        },
    }
    observed = deepcopy(expected)
    monkeypatch.setattr(
        registry, "inspect_static_cnf_engine_output_structure", lambda path: observed
    )
    output = tmp_path / "result.json"

    assert registry.check_registered_output(control, package_root, output) is observed
    for field, replacement in (
        ("control", {"sha256": "0" * 64}),
        (
            "package",
            {**expected["package"], "cnf_sha256": "1" * 64},
        ),
        (
            "wave_manifest",
            {
                **expected["wave_manifest"],
                "manifest": {
                    "encoding": {
                        **expected["wave_manifest"]["manifest"]["encoding"],
                        "cnf_sha256": "2" * 64,
                    }
                },
            },
        ),
    ):
        observed = deepcopy(expected)
        observed[field] = replacement
        with pytest.raises(registry.WaveRegistryError, match="crossed"):
            registry.check_registered_output(control, package_root, output)


def test_real_v1_engine_output_cross_binds_input_and_execution_manifests(
    tmp_path: Path,
) -> None:
    control, package_root, cnf, producer = _fixture_control(tmp_path)
    journal_root = tmp_path / "journals"
    journal_root.mkdir()
    output = tmp_path / "result.json"
    result = registry.execute_registered_wave(
        control,
        package_root,
        output_path=output,
        base_url="http://piqd.fixture",
        journal_root=journal_root,
        timeout_s=7,
        transport=_FakePiqd(cnf, producer, "SAT"),
        sleep=lambda _seconds: None,
    )

    checked = registry.check_registered_output(control, package_root, output)
    assert result.classification == "SAT_OBSERVED"
    assert checked["result"]["classification"] == "SAT_OBSERVED"
    assert (
        checked["wave_manifest"]["sha256"]
        != registry.validate_registered_ingress(control, package_root)[
            "wave_manifest_sha256"
        ]
    )


def test_v2_check_cross_binds_semantic_profile_and_artifact_inventory(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    control, package_root, _cnf, _producer, _profile = _fixture_v2_control(tmp_path)
    ingress = registry.validate_registered_ingress(control, package_root)
    observed = {
        "control": {"sha256": sha256_bytes(control.canonical_bytes)},
        "wave_manifest": {
            "sha256": ingress["wave_manifest_sha256"],
            "manifest": {
                "encoding": {
                    "num_variables": ingress["num_variables"],
                    "num_clauses": ingress["num_clauses"],
                    "cnf_sha256": ingress["cnf_sha256"],
                    "producer_manifest_sha256": ingress["producer_manifest_sha256"],
                    "variable_map_sha256": ingress["variable_map_sha256"],
                }
            },
        },
        "package": {
            "cnf_sha256": ingress["cnf_sha256"],
            "producer_manifest_sha256": ingress["producer_manifest_sha256"],
            "variable_map_sha256": ingress["variable_map_sha256"],
        },
        "semantic_profile": ingress["semantic_profile"],
        "semantic_artifacts": ingress["semantic_artifacts"],
        "execution_registry": {
            "schema": registry.REGISTRY_SCHEMA,
            "registry_revision": registry.REGISTRY_REVISION_V2,
            "registration": registry.STATIC_CNF_EXECUTION_V2.as_dict(),
        },
    }
    monkeypatch.setattr(
        registry, "inspect_static_cnf_engine_output_structure", lambda path: observed
    )
    output = tmp_path / "result.json"

    assert registry.check_registered_output(control, package_root, output) is observed
    observed["semantic_profile"] = {
        **observed["semantic_profile"],
        "sha256": "0" * 64,
    }
    with pytest.raises(registry.WaveRegistryError, match="crossed"):
        registry.check_registered_output(control, package_root, output)
    observed["semantic_profile"] = ingress["semantic_profile"]
    observed["semantic_artifacts"] = [
        {**ingress["semantic_artifacts"][0], "sha256": "1" * 64},
        *ingress["semantic_artifacts"][1:],
    ]
    with pytest.raises(registry.WaveRegistryError, match="crossed"):
        registry.check_registered_output(control, package_root, output)


def test_v2_validators_reject_rehashed_package_and_artifact_crossing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories, _profile = _make_v2_engine(
        tmp_path, monkeypatch, "UNKNOWN"
    )
    envelope = wave_engine.run(timeout_s=7, proof_path=None).envelope

    crossed_package = deepcopy(envelope)
    crossed_package["package"]["cnf_sha256"] = "0" * 64
    crossed_artifact = deepcopy(envelope)
    crossed_artifact["semantic_artifacts"][0]["sha256"] = "1" * 64

    for crossed in (crossed_package, crossed_artifact):
        unsigned = {
            key: value for key, value in crossed.items() if key != "envelope_sha256"
        }
        crossed["envelope_sha256"] = sha256_json(unsigned)

    output.write_bytes(canonical_json_bytes(crossed_package) + b"\n")
    with pytest.raises(registry.WaveRegistryError, match="registered engine schema"):
        registry.inspect_registered_output_structure(output)

    output.write_bytes(canonical_json_bytes(crossed_artifact) + b"\n")
    assert registry.inspect_registered_output_structure(output) == crossed_artifact
    with pytest.raises(registry.WaveRegistryError, match="crossed"):
        registry.validate_registered_output(
            wave_engine.control, wave_engine.package_root, output
        )
