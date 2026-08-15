# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import copy
import hashlib
import inspect
import json
import os
import subprocess
import sys
from pathlib import Path
from types import ModuleType

import pytest

import census.p97_search.freshthird_firstnonhit_common_payload_v6_verify as verifier


def _root_inventory(root: Path) -> list[tuple[str, str, int, int]]:
    return [
        (
            path.name,
            hashlib.sha256(path.read_bytes()).hexdigest(),
            path.stat().st_size,
            path.stat().st_mtime_ns,
        )
        for path in sorted(root.iterdir())
        if path.is_file()
    ]


def _census_modules() -> dict[str, object]:
    return {
        name: module
        for name, module in sys.modules.items()
        if name == verifier.PACKAGE_MODULE
        or name.startswith(f"{verifier.PACKAGE_MODULE}.")
    }


@pytest.fixture(scope="module")
def production_root() -> Path:
    root = (verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_RUN_RELATIVE).resolve()
    assert root.is_dir()
    return root


@pytest.fixture(scope="module")
def production_documents(
    production_root: Path,
) -> tuple[dict[str, object], bytes, dict[str, object]]:
    manifest_data = verifier._read_regular(
        production_root / "run-manifest.json", "test run manifest"
    )
    manifest = verifier._strict_json(manifest_data, "test run manifest")
    receipt_data = verifier._read_regular(
        production_root / "terminal-receipt.json", "test terminal receipt"
    )
    receipt = verifier._strict_json(receipt_data, "test terminal receipt")
    return manifest, manifest_data, receipt


@pytest.fixture(scope="module")
def verification_result(production_root: Path) -> dict[str, object]:
    process_calls = 0

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal process_calls
        process_calls += 1
        raise AssertionError("external verifier attempted a process call")

    before = _root_inventory(production_root)
    modules_before = _census_modules()
    original = verifier._forbidden_process
    verifier._forbidden_process = forbidden
    try:
        result = verifier.verify_run()
    finally:
        verifier._forbidden_process = original
    assert _root_inventory(production_root) == before
    modules_after = _census_modules()
    assert modules_after.keys() == modules_before.keys()
    assert all(modules_after[name] is module for name, module in modules_before.items())
    assert process_calls == 0
    return result


def test_external_verifier_authenticates_existing_sat_without_process_calls(
    verification_result: dict[str, object],
) -> None:
    result = verification_result
    assert result["schema"] == verifier.VERIFY_SCHEMA
    assert result["status"] == "SAT"
    assert result["verified"] is True
    assert result["solver_calls"] == 0
    assert result["run_manifest_sha256"] == (
        "0009d660273a58a9b1c408930e1e99c3fa14e1b248d94dbc039edbb581c4ce5a"
    )
    assert result["terminal_receipt_file_sha256"] == (
        "99daf13f456aef080d4cad33a8e6b41c8cb88321cbb428875044f8b79c38db9e"
    )
    assert result["terminal_receipt_self_sha256"] == (
        "6f5f96d37c943938f3831315a658cdc54b7efb59b172bd7b9bbe457703887c0d"
    )
    assert result["artifact_count"] == 25
    assert result["processes_validated"] == list(verifier.EXPECTED_PROCESS_NAMES)
    encoding = result["encoding"]
    assert isinstance(encoding, dict)
    assert encoding["variables"] == 93_280
    assert encoding["clauses"] == 606_898
    assert encoding["cnf_sha256"] == verifier.EXPECTED_CNF_SHA256
    model = result["model_readback"]
    assert isinstance(model, dict)
    assert model["all_emitted_clauses_satisfied"] is True
    assert model["v6_semantic_validation"] is True


def test_direct_absolute_script_ignores_adversarial_parent_package_shadow(
    tmp_path: Path,
    production_root: Path,
) -> None:
    shadow_root = tmp_path / "shadow"
    shadow_package = shadow_root / "census"
    shadow_package.mkdir(parents=True)
    sentinel = tmp_path / "shadow-imported"
    (shadow_package / "__init__.py").write_text(
        f"from pathlib import Path\nPath({str(sentinel)!r}).write_text('bad')\n"
    )
    script = verifier.EXPECTED_REPO_ROOT / verifier.VERIFIER_RELATIVE
    before = _root_inventory(production_root)
    environment = os.environ.copy()
    environment["PYTHONPATH"] = str(shadow_root)
    environment["PYTHONDONTWRITEBYTECODE"] = "1"
    completed = subprocess.run(
        [sys.executable, str(script)],
        cwd=verifier.EXPECTED_REPO_ROOT.parent,
        env=environment,
        capture_output=True,
        check=False,
        text=True,
        timeout=120,
    )
    assert completed.returncode == 0, completed.stderr
    result = json.loads(completed.stdout)
    assert result["status"] == "SAT"
    assert result["verified"] is True
    assert result["solver_calls"] == 0
    assert not sentinel.exists()
    assert _root_inventory(production_root) == before


def test_fake_preseeded_v2_child_rejects_without_consumption_or_cache_drift(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    fake = ModuleType(verifier.V2_MODULE)
    fake.__file__ = str(tmp_path / "fake-v2.py")
    fake.consumed = False
    monkeypatch.setitem(sys.modules, verifier.V2_MODULE, fake)
    before = _census_modules()
    with pytest.raises(verifier.VerificationError, match="source-shadowed"):
        verifier.verify_run()
    after = _census_modules()
    assert after.keys() == before.keys()
    assert all(after[name] is module for name, module in before.items())
    assert fake.consumed is False


def test_authenticated_runtime_restores_all_package_modules_on_failure(
    monkeypatch: pytest.MonkeyPatch,
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
) -> None:
    manifest, _manifest_data, _receipt = production_documents
    launch_sources = verifier._authenticate_launch_sources(manifest)
    transitive_sources = verifier._authenticate_transitive_sources()
    before = _census_modules()
    real_execute = verifier._execute_authenticated_module

    def fail_at_v4(module_name: str, path: Path, data: bytes) -> ModuleType:
        if module_name == verifier.V4_MODULE:
            raise verifier.VerificationError("synthetic authenticated-load failure")
        return real_execute(module_name, path, data)

    monkeypatch.setattr(verifier, "_execute_authenticated_module", fail_at_v4)
    with (
        pytest.raises(verifier.VerificationError, match="authenticated-load failure"),
        verifier._authenticated_runtime(launch_sources, transitive_sources),
    ):
        raise AssertionError("runtime unexpectedly reached yield")
    after = _census_modules()
    assert after.keys() == before.keys()
    assert all(after[name] is module for name, module in before.items())


def test_authenticated_runtime_binds_v2_through_v6_under_canonical_parents(
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
) -> None:
    manifest, _manifest_data, _receipt = production_documents
    launch_sources = verifier._authenticate_launch_sources(manifest)
    transitive_sources = verifier._authenticate_transitive_sources()
    before = _census_modules()
    with verifier._authenticated_runtime(launch_sources, transitive_sources) as runner:
        package = sys.modules[verifier.PACKAGE_MODULE]
        search = sys.modules[verifier.SEARCH_PACKAGE_MODULE]
        assert package.__path__ == [str(verifier.EXPECTED_REPO_ROOT / "census")]
        assert search.__path__ == [
            str(verifier.EXPECTED_REPO_ROOT / "census/p97_search")
        ]
        v2 = sys.modules[verifier.V2_MODULE]
        v3 = sys.modules[verifier.V3_MODULE]
        v4 = sys.modules[verifier.V4_MODULE]
        v5 = sys.modules[verifier.V5_MODULE]
        v6 = sys.modules[verifier.V6_MODULE]
        assert v3.v2 is v2
        assert v4.v2 is v2 and v4.v3 is v3
        assert v5.v2 is v2 and v5.v4 is v4
        assert v6.v2 is v2 and v6.v5 is v5
        assert runner is sys.modules[verifier.RUNNER_MODULE]
    after = _census_modules()
    assert after.keys() == before.keys()
    assert all(after[name] is module for name, module in before.items())


def test_frozen_launch_sources_match_exact_manifest_identities(
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
) -> None:
    manifest, _manifest_data, _receipt = production_documents
    authenticated = verifier._authenticate_launch_sources(manifest)
    assert set(authenticated) == set(verifier.EXPECTED_SOURCE_PATHS)
    for name, (path, data) in authenticated.items():
        identity = verifier.EXPECTED_SOURCE_IDENTITIES[name]
        assert hashlib.sha256(data).hexdigest() == identity["sha256"]
        assert len(data) == identity["size"]
        assert path == verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_SOURCE_PATHS[name]
    assert verifier.EXPECTED_SOURCE_IDENTITIES["runner"] == {
        "sha256": "4a49ee7de5a8627168df9db65e145089719974d7b085a819af4054c3eb09d864",
        "size": 24_037,
    }


def test_source_drift_fails_before_launch_runner_execution(
    monkeypatch: pytest.MonkeyPatch,
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
) -> None:
    manifest, _manifest_data, _receipt = production_documents
    identities = copy.deepcopy(verifier.EXPECTED_SOURCE_IDENTITIES)
    identities["runner"]["sha256"] = "0" * 64
    executed = False

    def forbidden(*_args: object, **_kwargs: object) -> object:
        nonlocal executed
        executed = True
        raise AssertionError("launch runner executed before source authentication")

    monkeypatch.setattr(verifier, "EXPECTED_SOURCE_IDENTITIES", identities)
    monkeypatch.setattr(verifier, "_execute_authenticated_module", forbidden)
    with pytest.raises(verifier.VerificationError, match="source dependency relabeled"):
        verifier._authenticate_launch_sources(manifest)
    assert executed is False


@pytest.mark.parametrize(
    ("path", "bad"),
    (
        (("schema",), "p97-freshthird-firstnonhit-overlap-v5/run/v1"),
        (("source_total",), True),
        (("production_path", "v6_common_payload_semantic_readback"), False),
    ),
)
def test_manifest_boundary_rejects_malformed_or_tampered_fields(
    production_root: Path,
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
    path: tuple[str, ...],
    bad: object,
) -> None:
    manifest, _manifest_data, _receipt = production_documents
    tampered = copy.deepcopy(manifest)
    target = tampered
    for key in path[:-1]:
        value = target[key]
        assert isinstance(value, dict)
        target = value
    target[path[-1]] = bad
    with pytest.raises(verifier.VerificationError):
        verifier._validate_manifest(tampered, production_root)


@pytest.mark.parametrize(
    ("field", "bad"),
    (
        ("schema", "p97-freshthird-firstnonhit-overlap-v5/run/v1/terminal-receipt/v1"),
        ("run_manifest_sha256", "0" * 64),
        ("source_total", True),
    ),
)
def test_receipt_boundary_rejects_malformed_or_tampered_fields(
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
    field: str,
    bad: object,
) -> None:
    _manifest, manifest_data, receipt = production_documents
    tampered = copy.deepcopy(receipt)
    tampered[field] = bad
    with pytest.raises(verifier.VerificationError):
        verifier._validate_receipt_boundary(tampered, manifest_data)


def test_artifact_inventory_rejects_tampering(
    production_root: Path,
    production_documents: tuple[dict[str, object], bytes, dict[str, object]],
) -> None:
    _manifest, _manifest_data, receipt = production_documents
    tampered = copy.deepcopy(receipt)
    inventory = tampered["artifact_inventory"]
    assert isinstance(inventory, list)
    inventory.pop()
    with pytest.raises(verifier.VerificationError, match="extra or missing"):
        verifier._validate_artifact_inventory(production_root, tampered)


def test_verifier_has_no_process_execution_api() -> None:
    source = inspect.getsource(verifier)
    assert "import subprocess" not in source
    assert "os.system" not in source
    assert "_run_process = _forbidden_process" in source


def test_root_relabel_is_rejected(tmp_path: Path) -> None:
    with pytest.raises(verifier.VerificationError, match="outside the repository"):
        verifier._validate_root_identity(tmp_path)
