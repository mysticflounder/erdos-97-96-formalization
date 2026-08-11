"""Fake-only contract tests for the bounded Survivor-CVC5 canary launcher."""

from __future__ import annotations

import importlib.util
import json
import sys
from pathlib import Path
from types import SimpleNamespace

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_piqd_survivor_cvc5 as subject
from census.p97_search import phase3_survivor_cvc5_driver as legacy

LAUNCHER_PATH = ROOT / "scripts/run-p97-piqd-survivor-cvc5-canary.py"
SPEC = importlib.util.spec_from_file_location("survivor_cvc5_canary", LAUNCHER_PATH)
assert SPEC is not None and SPEC.loader is not None
launcher = importlib.util.module_from_spec(SPEC)
SPEC.loader.exec_module(launcher)


VERSION = {
    "daemon": {
        "name": "piqd",
        "version": "0.1.0",
        "protocol_version": 1,
        "sha256": "a" * 64,
    },
    "limits": {"max_var": 1_000_000},
}
SELECTED = {
    "name": "cvc5",
    "lane": "smt",
    "solver": "cvc5",
    "solver_signature": "cvc5-1.3.3",
    "solver_version": "1.3.3",
    "solver_source": "1.3.3",
    "path": "/opt/cvc5",
    "worker": "piqd-smt",
    "worker_version": "0.1.0",
    "protocol_version": 1,
    "usable": True,
    "sha256": "b" * 64,
}
REGISTRY = {
    "daemon": VERSION["daemon"],
    "solver_dir": "/opt/piqd/solvers",
    "solvers": [SELECTED],
}
SOURCE_MANIFEST = {"manifest_sha256": "c" * 64, "fixture": "fake-authenticated-source"}


class FakeTransport:
    def __init__(self) -> None:
        self.calls: list[tuple[str, str]] = []

    def request_json(self, method: str, path: str, body=None) -> neutral.JsonResponse:
        assert body is None
        self.calls.append((method, path))
        if path == "/version":
            return neutral.JsonResponse(200, VERSION)
        if path == "/solvers":
            return neutral.JsonResponse(200, REGISTRY)
        raise AssertionError(f"unexpected fake request: {method} {path}")

    def request_bytes(self, method: str, path: str) -> neutral.BytesResponse:
        raise AssertionError(
            f"solver/session request escaped fake canary: {method} {path}"
        )


def _install_fake_source(monkeypatch: pytest.MonkeyPatch) -> SimpleNamespace:
    item = SimpleNamespace(system_id="fake-index-04", system={"rows": 2})
    systems = tuple(
        item if index == 4 else SimpleNamespace(system_id=f"fake-{index}")
        for index in range(48)
    )
    monkeypatch.setattr(
        launcher,
        "_load_current_fixture",
        lambda: (SOURCE_MANIFEST, list(systems), None),
    )
    return item


def _install_fake_adapter(
    monkeypatch: pytest.MonkeyPatch,
    result: dict[str, object],
    mutation: str | None = None,
) -> list[dict[str, object]]:
    prepared = SimpleNamespace(descriptor="fake-prepared")
    validated: list[dict[str, object]] = []

    def prepare(index, item, source_manifest, *, timeout_ms):
        assert index == launcher.INDEX
        assert item.system_id == "fake-index-04"
        assert source_manifest is SOURCE_MANIFEST
        assert timeout_ms == launcher.TIMEOUT_MS
        return prepared

    def run(prepared_arg, leaf, transport, *, used_session_ids):
        assert prepared_arg is prepared
        assert isinstance(transport, FakeTransport)
        assert used_session_ids == set()
        leaf.mkdir()
        result_path = leaf / "result.json"
        if mutation == "oversize":
            result_path.write_bytes(b"x" * (launcher.MAX_RESULT_BYTES + 1))
        else:
            result_path.write_bytes(launcher._canonical(result) + b"\n")
        if mutation == "symlink":
            result_path.unlink()
            result_path.symlink_to("/dev/null")
        elif mutation == "hardlink":
            (leaf / "result-alias.json").hardlink_to(result_path)
        elif mutation == "noncanonical":
            result_path.write_bytes(json.dumps(result).encode() + b"\n")
        return result

    def validate(prepared_arg, leaf):
        assert prepared_arg is prepared
        validated.append(result)
        return result

    monkeypatch.setattr(subject, "prepare_system", prepare)
    monkeypatch.setattr(subject, "run_prepared_system", run)
    monkeypatch.setattr(subject, "validate_prepared_system_output", validate)
    monkeypatch.setattr(
        subject, "_validate_prepared_system_output_fd", lambda prepared_arg, fd: result
    )
    return validated


def _fake_result() -> dict[str, object]:
    return {
        "engine": {
            "solver": "cvc5",
            "solver_sha256": SELECTED["sha256"],
            "solver_signature": SELECTED["solver_signature"],
            "session_id": "fake-session-1",
        },
        "raw_status": "sat",
        "effective_status": "SAT",
        "source_record_sha256": "d" * 64,
        "descriptor_sha256": "e" * 64,
        "original_smt2_sha256": "f" * 64,
        "journal_smt2_sha256": "0" * 64,
    }


def _partial_root(output: Path) -> Path:
    matches = sorted(output.parent.glob(".piqd-smt-staging-*"))
    assert len(matches) == 1
    return matches[0]


def _registry_body(
    *,
    entries: list[dict[str, object]] | None = None,
    daemon: dict[str, object] | None = None,
    solver_dir: object = "/opt/piqd/solvers",
) -> dict[str, object]:
    return {
        "daemon": json.loads(
            json.dumps(daemon if daemon is not None else VERSION["daemon"])
        ),
        "solver_dir": solver_dir,
        "solvers": json.loads(
            json.dumps(entries if entries is not None else [SELECTED])
        ),
    }


def test_success_binds_index_four_and_preserves_full_registry(monkeypatch, tmp_path):
    item = _install_fake_source(monkeypatch)
    result = _fake_result()
    validated = _install_fake_adapter(monkeypatch, result)
    transport = FakeTransport()

    manifest = launcher.run_canary(output_dir=tmp_path / "canary", transport=transport)

    assert item.system_id == manifest["system_id"]
    assert manifest["index"] == 4
    assert manifest["claims"] == launcher.CLAIMS
    assert manifest["proof_blueprint"] == launcher.PROOF_BLUEPRINT
    assert validated == [result]
    assert transport.calls == [
        ("GET", "/version"),
        ("GET", "/solvers"),
        ("GET", "/version"),
        ("GET", "/solvers"),
    ]
    assert (
        json.loads((tmp_path / "canary/selected-cvc5-pre.json").read_text()) == SELECTED
    )
    assert (
        json.loads((tmp_path / "canary/solver-registry-pre.json").read_text())
        == REGISTRY
    )
    assert manifest["identities"]["selected_cvc5_sha256"] == launcher._digest(SELECTED)
    assert (tmp_path / "canary/manifest.json").is_file()
    published = json.loads((tmp_path / "canary/manifest.json").read_text())
    unsigned = dict(published)
    claimed = unsigned.pop("manifest_sha256")
    assert claimed == launcher._digest(unsigned)


def test_output_is_create_once(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result())
    output = tmp_path / "canary"
    launcher.run_canary(output_dir=output, transport=FakeTransport())

    with pytest.raises(neutral.SmtSourceAdapterError, match="already exists"):
        launcher.run_canary(output_dir=output, transport=FakeTransport())


def test_expected_adapter_error_gets_exit_two_and_preserves_sidecar(
    monkeypatch, tmp_path
):
    _install_fake_source(monkeypatch)
    transport = FakeTransport()

    def fail(*args, **kwargs):
        raise subject.Phase3PiqdSolverError("fake adapter failure")

    monkeypatch.setattr(subject, "prepare_system", fail)
    output = tmp_path / "canary"
    with pytest.raises(subject.Phase3PiqdSolverError):
        launcher.run_canary(output_dir=output, transport=transport)
    sidecar = json.loads((_partial_root(output) / "error.json").read_text())
    assert sidecar["status"] == "error"
    assert sidecar["claims"] == launcher.CLAIMS


def test_unexpected_error_propagates_without_exit_two(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)

    def fail(*args, **kwargs):
        raise RuntimeError("unexpected fake bug")

    monkeypatch.setattr(subject, "prepare_system", fail)
    output = tmp_path / "canary"
    with pytest.raises(RuntimeError, match="unexpected fake bug"):
        launcher.run_canary(output_dir=output, transport=FakeTransport())
    assert not (_partial_root(output) / "error.json").exists()


def test_cli_enumerates_expected_errors_as_exit_two(monkeypatch, tmp_path, capsys):
    def fail(**kwargs):
        raise neutral.SmtSourceAdapterError("fake transport failure")

    monkeypatch.setattr(launcher, "run_canary", fail)
    status = launcher.main(["--output-dir", str(tmp_path / "canary")])
    assert status == 2
    payload = json.loads(capsys.readouterr().out)
    assert payload["status"] == "error"
    assert payload["artifacts_preserved"] is False


def test_source_oracle_error_is_expected_and_preserved(monkeypatch, tmp_path):
    def fail():
        raise legacy.Phase3Cvc5Error("fake source oracle failure")

    monkeypatch.setattr(launcher, "_load_current_fixture", fail)
    output = tmp_path / "canary"
    with pytest.raises(legacy.Phase3Cvc5Error, match="fake source oracle failure"):
        launcher.run_canary(output_dir=output, transport=FakeTransport())
    assert (
        json.loads((_partial_root(output) / "error.json").read_text())["status"]
        == "error"
    )


@pytest.mark.parametrize(
    "mutation", ["symlink", "hardlink", "oversize", "noncanonical"]
)
def test_result_custody_attacks_fail_closed(monkeypatch, tmp_path, mutation):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result(), mutation=mutation)
    with pytest.raises((launcher.CanaryError, neutral.SmtSourceAdapterError)):
        launcher.run_canary(output_dir=tmp_path / "canary", transport=FakeTransport())
    assert (_partial_root(tmp_path / "canary") / "error.json").is_file()


def test_result_tamper_after_immediate_validation_fails_closed(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    result = _fake_result()
    leaf_holder: dict[str, Path] = {}
    _install_fake_adapter(monkeypatch, result)
    original_run = subject.run_prepared_system

    def capture_leaf(prepared, leaf, transport, *, used_session_ids):
        leaf_holder["path"] = leaf
        return original_run(
            prepared, leaf, transport, used_session_ids=used_session_ids
        )

    monkeypatch.setattr(subject, "run_prepared_system", capture_leaf)

    class TamperTransport(FakeTransport):
        def request_json(self, method, path, body=None):
            response = super().request_json(method, path, body)
            if len(self.calls) == 3:
                changed = dict(result)
                changed["raw_status"] = "tampered"
                leaf_holder["path"].joinpath("result.json").write_bytes(
                    launcher._canonical(changed) + b"\n"
                )
            return response

    with pytest.raises((launcher.CanaryError, neutral.SmtSourceAdapterError)):
        launcher.run_canary(output_dir=tmp_path / "canary", transport=TamperTransport())


def test_output_parent_symlink_fails_without_redirect_write(monkeypatch, tmp_path):
    target = tmp_path / "target"
    target.mkdir()
    parent_link = tmp_path / "parent-link"
    parent_link.symlink_to(target, target_is_directory=True)
    with pytest.raises(neutral.SmtSourceAdapterError):
        launcher.run_canary(
            output_dir=parent_link / "canary", transport=FakeTransport()
        )
    assert not (target / "canary").exists()


def test_root_replacement_fails_closed(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    result = _fake_result()
    _install_fake_adapter(monkeypatch, result)
    original_run = subject.run_prepared_system

    def replace_root(prepared, leaf, transport, *, used_session_ids):
        value = original_run(
            prepared, leaf, transport, used_session_ids=used_session_ids
        )
        root = leaf.parent
        moved = root.with_name(root.name + "-moved")
        root.rename(moved)
        root.symlink_to(tmp_path / "redirect", target_is_directory=True)
        return value

    (tmp_path / "redirect").mkdir()
    monkeypatch.setattr(subject, "run_prepared_system", replace_root)
    monkeypatch.setattr(
        subject, "validate_prepared_system_output", lambda *args: result
    )
    with pytest.raises((launcher.CanaryError, neutral.SmtSourceAdapterError)):
        launcher.run_canary(output_dir=tmp_path / "canary", transport=FakeTransport())


def test_root_parent_replacement_fails_closed(monkeypatch, tmp_path):
    parent = tmp_path / "parent"
    parent.mkdir()
    redirect = tmp_path / "redirect-parent"
    redirect.mkdir()
    output = parent / "canary"
    _install_fake_source(monkeypatch)
    result = _fake_result()
    _install_fake_adapter(monkeypatch, result)
    original_run = subject.run_prepared_system

    def replace_parent(prepared, leaf, transport, *, used_session_ids):
        value = original_run(
            prepared, leaf, transport, used_session_ids=used_session_ids
        )
        moved = parent.with_name("parent-moved")
        parent.rename(moved)
        parent.symlink_to(redirect, target_is_directory=True)
        return value

    monkeypatch.setattr(subject, "run_prepared_system", replace_parent)
    monkeypatch.setattr(
        subject, "validate_prepared_system_output", lambda *args: result
    )
    with pytest.raises((launcher.CanaryError, neutral.SmtSourceAdapterError)):
        launcher.run_canary(output_dir=output, transport=FakeTransport())
    assert not (redirect / "canary").exists()


@pytest.mark.parametrize("attack", ["extra", "missing", "type"])
def test_registry_exact_cvc5_schema_attacks_fail_closed(monkeypatch, tmp_path, attack):
    _install_fake_source(monkeypatch)
    entry = dict(SELECTED)
    if attack == "extra":
        entry["unexpected"] = True
    elif attack == "missing":
        del entry["worker"]
    else:
        entry["protocol_version"] = "1"

    class BadRegistryTransport(FakeTransport):
        def request_json(self, method, path, body=None):
            if path == "/solvers":
                self.calls.append((method, path))
                return neutral.JsonResponse(200, _registry_body(entries=[entry]))
            return super().request_json(method, path, body)

    with pytest.raises(launcher.CanaryError):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=BadRegistryTransport()
        )


@pytest.mark.parametrize("attack", ["missing", "extra", "wrong", "null"])
def test_registry_daemon_schema_attacks_fail_closed(monkeypatch, tmp_path, attack):
    _install_fake_source(monkeypatch)
    daemon = json.loads(json.dumps(VERSION["daemon"]))
    if attack == "missing":
        del daemon["name"]
    elif attack == "extra":
        daemon["unexpected"] = True
    elif attack == "wrong":
        daemon["protocol_version"] = "1"
    else:
        daemon["sha256"] = None
    body = _registry_body(daemon=daemon)

    class BadDaemonTransport(FakeTransport):
        def request_json(self, method, path, body_arg=None):
            if path == "/solvers":
                self.calls.append((method, path))
                return neutral.JsonResponse(200, body)
            return super().request_json(method, path, body_arg)

    with pytest.raises(launcher.CanaryError, match="daemon"):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=BadDaemonTransport()
        )


@pytest.mark.parametrize("solver_dir", ["", "relative/solvers", None, 7])
def test_registry_solver_dir_schema_attacks_fail_closed(
    monkeypatch, tmp_path, solver_dir
):
    _install_fake_source(monkeypatch)
    body = _registry_body(solver_dir=solver_dir)

    class BadSolverDirTransport(FakeTransport):
        def request_json(self, method, path, body_arg=None):
            if path == "/solvers":
                self.calls.append((method, path))
                return neutral.JsonResponse(200, body)
            return super().request_json(method, path, body_arg)

    with pytest.raises(launcher.CanaryError, match="bounded schema"):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=BadSolverDirTransport()
        )


def test_registry_daemon_must_match_version(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    daemon = json.loads(json.dumps(VERSION["daemon"]))
    daemon["version"] = "registry-only"
    body = _registry_body(daemon=daemon)

    class CrossingTransport(FakeTransport):
        def request_json(self, method, path, body_arg=None):
            if path == "/solvers":
                self.calls.append((method, path))
                return neutral.JsonResponse(200, body)
            return super().request_json(method, path, body_arg)

    with pytest.raises(launcher.CanaryError, match="differs from /version"):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=CrossingTransport()
        )


def test_registry_daemon_sha256_may_be_omitted(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    daemon = json.loads(json.dumps(VERSION["daemon"]))
    del daemon["sha256"]
    body = _registry_body(daemon=daemon)

    class OmittedShaTransport(FakeTransport):
        def request_json(self, method, path, body_arg=None):
            if path == "/solvers":
                self.calls.append((method, path))
                return neutral.JsonResponse(200, body)
            return super().request_json(method, path, body_arg)

    _install_fake_adapter(monkeypatch, _fake_result())
    manifest = launcher.run_canary(
        output_dir=tmp_path / "canary", transport=OmittedShaTransport()
    )
    assert manifest["index"] == launcher.INDEX


@pytest.mark.parametrize(
    "kind", ["version-oversize", "registry-list", "registry-depth"]
)
def test_control_response_bounds_fail_closed(monkeypatch, tmp_path, kind):
    _install_fake_source(monkeypatch)
    body = VERSION
    path = "/version"
    if kind == "version-oversize":
        body = json.loads(json.dumps(VERSION))
        body["daemon"]["version"] = "v" * launcher.MAX_VERSION_BYTES
    elif kind == "registry-list":
        path = "/solvers"
        body = _registry_body(entries=[SELECTED] * (launcher.MAX_REGISTRY_ENTRIES + 1))
    else:
        path = "/solvers"
        nested: object = SELECTED
        for _ in range(7):
            nested = {"nested": nested}
        body = _registry_body(entries=[nested])

    class BoundedTransport(FakeTransport):
        def request_json(self, method, request_path, body_arg=None):
            if request_path == path:
                self.calls.append((method, request_path))
                return neutral.JsonResponse(200, body)
            return super().request_json(method, request_path, body_arg)

    with pytest.raises(launcher.CanaryError):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=BoundedTransport()
        )


def test_pre_post_identity_drift_fails_closed(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result())

    class DriftTransport(FakeTransport):
        def request_json(self, method, path, body=None):
            response = super().request_json(method, path, body)
            if path == "/version" and len(self.calls) == 3:
                changed = json.loads(json.dumps(VERSION))
                changed["daemon"]["version"] = "drifted"
                return neutral.JsonResponse(200, changed)
            return response

    with pytest.raises(launcher.CanaryError, match="process replaced"):
        launcher.run_canary(output_dir=tmp_path / "canary", transport=DriftTransport())


def test_pre_post_full_registry_drift_fails_closed(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result())

    class RegistryDriftTransport(FakeTransport):
        def __init__(self) -> None:
            super().__init__()
            self.registry_calls = 0

        def request_json(self, method, path, body=None):
            if path == "/solvers":
                self.registry_calls += 1
                response = super().request_json(method, path, body)
                if self.registry_calls == 2:
                    return neutral.JsonResponse(
                        200,
                        _registry_body(
                            entries=[
                                SELECTED,
                                {
                                    **SELECTED,
                                    "name": "z3",
                                    "solver": "z3",
                                    "solver_signature": "z3-test",
                                },
                            ]
                        ),
                    )
                return response
            return super().request_json(method, path, body)

    with pytest.raises(launcher.CanaryError, match="solvers array differs"):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=RegistryDriftTransport()
        )


@pytest.mark.parametrize(
    ("drift", "message"),
    [
        ("daemon", "pre/post registry daemon differs"),
        ("solver_dir", "pre/post solver_dir differs"),
    ],
)
def test_pre_post_registry_subtree_diagnostics(monkeypatch, tmp_path, drift, message):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result())

    class SubtreeDriftTransport(FakeTransport):
        def __init__(self) -> None:
            super().__init__()
            self.registry_calls = 0

        def request_json(self, method, path, body=None):
            if path == "/solvers":
                self.registry_calls += 1
                response = super().request_json(method, path, body)
                if self.registry_calls == 2:
                    changed = _registry_body()
                    if drift == "daemon":
                        del changed["daemon"]["sha256"]
                    else:
                        changed["solver_dir"] = "/changed/solvers"
                    return neutral.JsonResponse(200, changed)
                return response
            return super().request_json(method, path, body)

    with pytest.raises(launcher.CanaryError, match=message):
        launcher.run_canary(
            output_dir=tmp_path / "canary", transport=SubtreeDriftTransport()
        )


def test_manifest_install_race_preserves_staging(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    _install_fake_adapter(monkeypatch, _fake_result())
    output = tmp_path / "canary"
    original_rename = neutral._rename_directory_noreplace

    def race(parent_fd, source, target):
        if target == output.name:
            raise neutral.SmtSourceAdapterError("fake install race")
        return original_rename(parent_fd, source, target)

    monkeypatch.setattr(neutral, "_rename_directory_noreplace", race)
    with pytest.raises(neutral.SmtSourceAdapterError, match="fake install race"):
        launcher.run_canary(output_dir=output, transport=FakeTransport())
    assert not output.exists()
    assert (_partial_root(output) / "manifest.json").is_file()


def test_final_inventory_rejects_rogue_root_entry(monkeypatch, tmp_path):
    _install_fake_source(monkeypatch)
    result = _fake_result()
    _install_fake_adapter(monkeypatch, result)
    original_run = subject.run_prepared_system

    def rogue(prepared, leaf, transport, *, used_session_ids):
        value = original_run(
            prepared, leaf, transport, used_session_ids=used_session_ids
        )
        leaf.parent.joinpath("rogue.json").write_bytes(b"rogue")
        return value

    monkeypatch.setattr(subject, "run_prepared_system", rogue)
    with pytest.raises(launcher.CanaryError, match="inventory"):
        launcher.run_canary(output_dir=tmp_path / "canary", transport=FakeTransport())
