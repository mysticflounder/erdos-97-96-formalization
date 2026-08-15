from __future__ import annotations

import hashlib
import json
import os
import subprocess
import sys
from pathlib import Path
from types import ModuleType

import pytest

import census.p97_search.freshthird_firstnonhit_cap_endpoint_v3_verify as verifier


def _canonical(value: object) -> bytes:
    return (
        json.dumps(
            value,
            allow_nan=False,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        )
        + "\n"
    ).encode()


def _self_hashed(value: dict[str, object], field: str) -> bytes:
    result = dict(value)
    result[field] = hashlib.sha256(_canonical(result)).hexdigest()
    return _canonical(result)


def _minimal_manifest(*, run_root: str = verifier.EXPECTED_RUN_RELATIVE) -> bytes:
    return _self_hashed(
        {
            "schema": verifier.RUN_SCHEMA,
            "status": "RUNNING",
            "run_root": run_root,
            "n": 17,
            "source_total": False,
            "scope_label": (
                "sound finite relaxation; not a finite-to-universal reduction"
            ),
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": verifier.EXPECTED_AUDIT,
            "query_is_separate_assumption": True,
            "exactly_one_production_wave": True,
            "no_cegar_successor": True,
            "theorem_bank_search_planned": False,
            "cross_check_requested": False,
            "timeout_seconds": 3600,
        },
        "run_manifest_sha256",
    )


def _inventory_row(path: str, data: bytes) -> dict[str, object]:
    return {"path": path, "sha256": hashlib.sha256(data).hexdigest(), "size": len(data)}


def _minimal_terminal(manifest: bytes, inventory: list[dict[str, object]]) -> bytes:
    return _self_hashed(
        {
            "schema": verifier.RECEIPT_SCHEMA,
            "status": "SAT",
            "source_total": False,
            "all_emitted_hard_clauses_source_mapped": True,
            "independent_audit": verifier.EXPECTED_AUDIT,
            "run_manifest_sha256": hashlib.sha256(manifest).hexdigest(),
            "result": {},
            "processes": [],
            "artifact_inventory": inventory,
            "no_cegar_successor": True,
            "theorem_bank_search_run": False,
        },
        "terminal_receipt_sha256",
    )


def test_verifier_module_has_no_eager_encoder_binding() -> None:
    assert "emitter" not in vars(verifier)


def test_real_root_verification_is_zero_call_and_read_only(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    def forbidden(*args: object, **kwargs: object) -> object:
        raise AssertionError(f"subprocess call attempted: {args!r} {kwargs!r}")

    for name in ("run", "Popen", "call", "check_call", "check_output"):
        monkeypatch.setattr(subprocess, name, forbidden)
    real_os_open = verifier.os.open
    write_flags = (
        verifier.os.O_WRONLY
        | verifier.os.O_RDWR
        | verifier.os.O_CREAT
        | verifier.os.O_TRUNC
        | verifier.os.O_APPEND
    )

    def read_only_nonlean_open(
        path: str | bytes | Path, flags: int, *args: object
    ) -> int:
        assert flags & write_flags == 0, f"write open attempted: {path}"
        candidate = Path(path)
        assert not candidate.is_relative_to(verifier.EXPECTED_REPO_ROOT / "lean"), (
            f"live Lean source consulted: {candidate}"
        )
        return real_os_open(path, flags, *args)

    monkeypatch.setattr(verifier.os, "open", read_only_nonlean_open)
    root = verifier._repo_root() / verifier.EXPECTED_RUN_RELATIVE
    before = {
        path.name: (path.stat().st_size, path.stat().st_mtime_ns)
        for path in root.iterdir()
    }

    report = verifier.verify_run()

    after = {
        path.name: (path.stat().st_size, path.stat().st_mtime_ns)
        for path in root.iterdir()
    }
    assert after == before
    assert report["status"] == "VERIFIED"
    assert report["solver_calls"] == 0
    assert report["writes"] == 0
    assert report["processes_verified"] == list(verifier.EXPECTED_PROCESS_NAMES)
    assert report["complete_model_variables"] == 93075
    assert report["clauses_checked"] == 445258
    assert report["delta_units_checked"] == 6
    assert report["historical_source_snapshot_verified"] is True
    assert report["live_lean_worktree_consulted"] is False
    encoder = sys.modules[verifier.ENCODER_MODULE]
    predecessor = sys.modules[verifier.PREDECESSOR_MODULE]
    assert Path(encoder.__file__).resolve() == (
        verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_SOURCE_PATHS["encoder"]
    )
    assert Path(predecessor.__file__).resolve() == (
        verifier.EXPECTED_REPO_ROOT
        / verifier.EXPECTED_SOURCE_PATHS["predecessor_encoder"]
    )
    assert encoder.v2 is predecessor


def test_real_direct_script_ignores_adversarial_parent_package_shadow(
    tmp_path: Path,
) -> None:
    shadow_root = tmp_path / "shadow"
    shadow_package = shadow_root / "census"
    shadow_package.mkdir(parents=True)
    sentinel = tmp_path / "shadow-imported"
    (shadow_package / "__init__.py").write_text(
        f"from pathlib import Path\nPath({str(sentinel)!r}).write_text('bad')\n"
    )
    script = verifier.EXPECTED_REPO_ROOT / verifier.VERIFIER_RELATIVE
    run_root = verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_RUN_RELATIVE
    before = {
        path.name: (path.stat().st_size, path.stat().st_mtime_ns)
        for path in run_root.iterdir()
    }
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
        timeout=30,
    )

    assert completed.returncode == 0, completed.stderr
    report = json.loads(completed.stdout)
    assert report["status"] == "VERIFIED"
    assert report["solver_calls"] == 0
    assert report["writes"] == 0
    assert not sentinel.exists()
    after = {
        path.name: (path.stat().st_size, path.stat().st_mtime_ns)
        for path in run_root.iterdir()
    }
    assert after == before


@pytest.mark.parametrize(
    "dependency",
    ["encoder", "predecessor_encoder", "runner", "checkpoint"],
)
def test_executable_dependency_drift_rejects_before_import_subprocess_or_write(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    dependency: str,
) -> None:
    root = verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_RUN_RELATIVE
    manifest = json.loads((root / "run-manifest.json").read_bytes())
    dependency_path = (
        verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_SOURCE_PATHS[dependency]
    )
    side_effect = tmp_path / "import-side-effect"
    malicious_suffix = (
        f"\nopen({str(side_effect)!r}, 'w').write('bad')\n"
        "import subprocess\nsubprocess.run(['false'])\n"
    ).encode()
    real_read = verifier._read_regular
    real_os_open = verifier.os.open
    write_flags = (
        verifier.os.O_WRONLY
        | verifier.os.O_RDWR
        | verifier.os.O_CREAT
        | verifier.os.O_TRUNC
        | verifier.os.O_APPEND
    )

    def drifted_read(path: Path, description: str) -> bytes:
        data = real_read(path, description)
        return data + malicious_suffix if path == dependency_path else data

    def read_only_open(path: str | bytes | Path, flags: int, *args: object) -> int:
        assert flags & write_flags == 0, f"write open attempted: {path}"
        return real_os_open(path, flags, *args)

    def forbidden(*args: object, **kwargs: object) -> object:
        raise AssertionError(f"side effect attempted: {args!r} {kwargs!r}")

    monkeypatch.setattr(verifier, "_read_regular", drifted_read)
    monkeypatch.setattr(verifier, "_execute_authenticated_module", forbidden)
    monkeypatch.setattr(verifier.os, "open", read_only_open)
    for name in ("run", "Popen", "call", "check_call", "check_output"):
        monkeypatch.setattr(subprocess, name, forbidden)

    with pytest.raises(verifier.VerificationError, match="dependency changed"):
        verifier._authenticate_and_load_encoder(manifest)
    assert not side_effect.exists()


@pytest.mark.parametrize(
    ("module_name", "source_name"),
    [
        (verifier.ENCODER_MODULE, "encoder"),
        (verifier.PREDECESSOR_MODULE, "predecessor_encoder"),
    ],
)
def test_preloaded_source_shadow_rejects_before_authenticated_execution(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    module_name: str,
    source_name: str,
) -> None:
    root = verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_RUN_RELATIVE
    manifest = json.loads((root / "run-manifest.json").read_bytes())
    sources = verifier._authenticate_source_files(manifest)
    shadow = ModuleType(module_name)
    shadow.__file__ = str(tmp_path / f"shadow-{source_name}.py")
    monkeypatch.setitem(sys.modules, module_name, shadow)

    def forbidden(*args: object, **kwargs: object) -> object:
        raise AssertionError(f"authenticated code executed: {args!r} {kwargs!r}")

    monkeypatch.setattr(verifier, "_execute_authenticated_module", forbidden)
    for name in ("run", "Popen", "call", "check_call", "check_output"):
        monkeypatch.setattr(subprocess, name, forbidden)

    with pytest.raises(verifier.VerificationError, match="source-shadowed"):
        verifier._load_authenticated_encoder(sources)


def test_verifier_module_source_shadow_rejects_before_root_reads(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    monkeypatch.setattr(verifier, "__file__", str(tmp_path / "shadow-verifier.py"))
    with pytest.raises(verifier.VerificationError, match="source-shadowed"):
        verifier._repo_root()


def test_post_execution_identity_failure_restores_previous_module(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    module_name = "census.p97_search._verifier_restore_test"
    previous = ModuleType(module_name)
    previous.__file__ = str(tmp_path / "previous.py")
    monkeypatch.setitem(sys.modules, module_name, previous)
    expected = tmp_path / "expected.py"

    with pytest.raises(verifier.VerificationError, match="source-shadowed"):
        verifier._execute_authenticated_module(
            module_name,
            expected,
            b"__file__ = '/definitely/shadowed.py'\n",
        )
    assert sys.modules[module_name] is previous


def test_encoder_transaction_failure_restores_parents_and_children(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    root = verifier.EXPECTED_REPO_ROOT / verifier.EXPECTED_RUN_RELATIVE
    manifest = json.loads((root / "run-manifest.json").read_bytes())
    sources = verifier._authenticate_source_files(manifest)
    names = (
        verifier.PACKAGE_MODULE,
        verifier.SEARCH_PACKAGE_MODULE,
        verifier.PREDECESSOR_MODULE,
        verifier.ENCODER_MODULE,
    )
    missing = object()
    before = {name: sys.modules.get(name, missing) for name in names}
    real_execute = verifier._execute_authenticated_module

    def fail_on_encoder(module_name: str, path: Path, data: bytes) -> ModuleType:
        if module_name == verifier.ENCODER_MODULE:
            raise RuntimeError("forced encoder failure")
        return real_execute(module_name, path, data)

    monkeypatch.setattr(verifier, "_execute_authenticated_module", fail_on_encoder)
    with pytest.raises(RuntimeError, match="forced encoder failure"):
        verifier._load_authenticated_encoder(sources)
    for name, previous in before.items():
        if previous is missing:
            assert name not in sys.modules
        else:
            assert sys.modules[name] is previous


def test_extra_artifact_fails_closed(
    tmp_path: Path,
) -> None:
    root = tmp_path / "run"
    root.mkdir()
    manifest = _minimal_manifest()
    (root / "run-manifest.json").write_bytes(manifest)
    inventory = [_inventory_row("run-manifest.json", manifest)]
    (root / "terminal-receipt.json").write_bytes(_minimal_terminal(manifest, inventory))
    (root / "unexpected.bin").write_bytes(b"extra")

    terminal = json.loads((root / "terminal-receipt.json").read_bytes())
    with pytest.raises(verifier.VerificationError, match="extra or missing"):
        verifier._validate_artifact_inventory(root, terminal)


def test_missing_artifact_fails_closed(
    tmp_path: Path,
) -> None:
    root = tmp_path / "run"
    root.mkdir()
    manifest = _minimal_manifest()
    (root / "run-manifest.json").write_bytes(manifest)
    inventory = [
        _inventory_row("missing.bin", b"expected"),
        _inventory_row("run-manifest.json", manifest),
    ]
    (root / "terminal-receipt.json").write_bytes(_minimal_terminal(manifest, inventory))

    terminal = json.loads((root / "terminal-receipt.json").read_bytes())
    with pytest.raises(verifier.VerificationError, match="extra or missing"):
        verifier._validate_artifact_inventory(root, terminal)


def test_artifact_mutation_fails_closed(
    tmp_path: Path,
) -> None:
    root = tmp_path / "run"
    root.mkdir()
    manifest = _minimal_manifest()
    (root / "run-manifest.json").write_bytes(manifest)
    (root / "payload.bin").write_bytes(b"mutated")
    inventory = [
        _inventory_row("payload.bin", b"original"),
        _inventory_row("run-manifest.json", manifest),
    ]
    (root / "terminal-receipt.json").write_bytes(_minimal_terminal(manifest, inventory))

    terminal = json.loads((root / "terminal-receipt.json").read_bytes())
    with pytest.raises(verifier.VerificationError, match="digest/size mismatch"):
        verifier._validate_artifact_inventory(root, terminal)


def test_run_relabel_fails_closed(tmp_path: Path) -> None:
    relabeled = tmp_path / "copied-v3-run"
    relabeled.mkdir()

    with pytest.raises(verifier.VerificationError, match="outside|relabeled"):
        verifier.verify_run(relabeled)


@pytest.mark.parametrize(
    "names",
    [
        verifier.EXPECTED_PROCESS_NAMES[:-1],
        (
            "cadical-version",
            "drat-trim-version",
            "smoke-sat",
            "smoke-unsat",
            "smoke-unsat-drat-trim",
            "production-cadical",
        ),
    ],
)
def test_missing_or_extra_process_fails_before_receipt_reads(
    tmp_path: Path, names: tuple[str, ...]
) -> None:
    summaries = [
        {
            "name": name,
            "receipt": f"{name}.process.json",
            "receipt_sha256": "0" * 64,
            "status": "COMPLETED",
            "returncode": 0,
        }
        for name in names
    ]

    with pytest.raises(verifier.VerificationError, match="five-process"):
        verifier._validate_processes(tmp_path, {}, {"processes": summaries})


def test_incomplete_or_conflicting_model_fails_closed() -> None:
    with pytest.raises(verifier.VerificationError, match="not exactly complete"):
        verifier._parse_complete_model(b"s SATISFIABLE\nv 1 0\n", 2)
    with pytest.raises(verifier.VerificationError, match="conflicting"):
        verifier._parse_complete_model(b"s SATISFIABLE\nv 1 -1 0\n", 1)


def test_cli_emits_one_json_report(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    report = {"schema": verifier.VERIFY_SCHEMA, "status": "VERIFIED"}
    monkeypatch.setattr(verifier, "verify_run", lambda root: report)

    assert verifier.main([]) == 0
    assert json.loads(capsys.readouterr().out) == report
