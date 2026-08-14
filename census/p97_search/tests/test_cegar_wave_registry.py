from __future__ import annotations

from copy import deepcopy
from dataclasses import replace
from pathlib import Path
from types import SimpleNamespace

import pytest

import census.p97_search.cegar_wave_registry as registry
from census.p97_search.phase3_cegar_wave import sha256_bytes, wave_manifest_sha256
from census.p97_search.tests.test_phase3_cegar_wave_engine import _fixture_control


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
    assert registry.validate_registered_output(output) is expected
    with pytest.raises(registry.WaveRegistryError, match="absolute native Path"):
        registry.validate_registered_output(Path("relative"))


def test_registered_output_rejects_absent_or_crossed_registration(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "result.json"
    observed: dict[str, object] = {"schema": "validated"}
    monkeypatch.setattr(
        registry, "validate_static_cnf_engine_output", lambda path: observed
    )

    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.validate_registered_output(output)
    observed["execution_registry"] = {
        "schema": registry.REGISTRY_SCHEMA,
        "registry_revision": "crossed",
        "registration": registry.STATIC_CNF_EXECUTION.as_dict(),
    }
    with pytest.raises(registry.WaveRegistryError, match="absent or crossed"):
        registry.validate_registered_output(output)


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
            {**expected["wave_manifest"], "sha256": "2" * 64},
        ),
    ):
        observed = deepcopy(expected)
        observed[field] = replacement
        with pytest.raises(registry.WaveRegistryError, match="crossed"):
            registry.check_registered_output(control, package_root, output)
