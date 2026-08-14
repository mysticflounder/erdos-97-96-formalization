from __future__ import annotations

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
from census.p97_search.tests.test_phase3_cegar_wave_engine import (
    _FakePiqd,
    _fixture_control,
    _fixture_v2_control,
    _make_v2_engine,
)


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
    sentinel = SimpleNamespace(classification="SAT_OBSERVED")
    sleeper = lambda _: None
    seen: list[tuple[str, object]] = []

    class FakeEngine:
        def __init__(self, **kwargs: object) -> None:
            seen.append(("init", kwargs))

        def run(self, *, timeout_s: int | None, proof_path: object) -> object:
            seen.append(("run", (timeout_s, proof_path)))
            return sentinel

    monkeypatch.setattr(registry, "StaticCnfWaveEngine", FakeEngine)
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

    assert result is sentinel
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
        registry, "validate_static_cnf_engine_output", lambda path: expected
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
        registry, "validate_static_cnf_engine_output", lambda path: observed
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
        registry, "validate_static_cnf_engine_output", lambda path: observed
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
        registry, "validate_static_cnf_engine_output", lambda path: observed
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
        registry, "validate_static_cnf_engine_output", lambda path: observed
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


def test_v2_authenticated_validator_rejects_rehashed_package_and_artifact_crossing(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    wave_engine, output, _api, _factories, _profile = _make_v2_engine(
        tmp_path, monkeypatch, "UNKNOWN"
    )
    envelope = wave_engine.run(timeout_s=7, proof_path=None).envelope

    variants = []
    crossed_package = deepcopy(envelope)
    crossed_package["package"]["cnf_sha256"] = "0" * 64
    variants.append(crossed_package)
    crossed_artifact = deepcopy(envelope)
    crossed_artifact["semantic_artifacts"][0]["sha256"] = "1" * 64
    variants.append(crossed_artifact)

    for crossed in variants:
        unsigned = {
            key: value for key, value in crossed.items() if key != "envelope_sha256"
        }
        crossed["envelope_sha256"] = sha256_json(unsigned)
        output.write_bytes(canonical_json_bytes(crossed) + b"\n")
        assert registry.inspect_registered_output_structure(output) == crossed
        with pytest.raises(registry.WaveRegistryError, match="crossed"):
            registry.validate_registered_output(
                wave_engine.control, wave_engine.package_root, output
            )
