from __future__ import annotations

import inspect
import sys
from pathlib import Path
from types import SimpleNamespace
from typing import Any

import pytest

ROOT = Path(__file__).resolve().parents[3]
HERE = ROOT / "census/p97_search"
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

from census.p97_search import phase3_cegar_wave as wave
from census.p97_search import phase3_piqd_structural_cegar_launcher as launcher
from census.p97_search import phase3_structural_cegar as structural


def _full_args(tmp_path: Path) -> list[str]:
    return [
        "--piqd-base-url",
        "http://piqd.invalid",
        "--piqd-journal-root",
        str(tmp_path / "journal"),
        "--piqd-source-manifest",
        str(tmp_path / "source.json"),
        "--piqd-producer-manifest",
        str(tmp_path / "producer.json"),
        "--out",
        str(tmp_path / "out"),
        "--no-bootstrap",
        "--no-algebraic-bootstrap",
    ]


def _write_manifests(tmp_path: Path) -> tuple[bytes, bytes]:
    source = b"exact source bytes\n"
    producer = b"exact producer bytes\n"
    (tmp_path / "source.json").write_bytes(source)
    (tmp_path / "producer.json").write_bytes(producer)
    return source, producer


def test_launcher_requires_all_four_piqd_inputs(tmp_path: Path) -> None:
    with pytest.raises(SystemExit):
        launcher._parse_args(_full_args(tmp_path)[:-8])


@pytest.mark.parametrize(
    "incompatible",
    [
        ["--workers", "2"],
        ["--parallel-mode", "cube-batch"],
        ["--resume"],
        ["--shard-depth", "1", "--shard-index", "0"],
    ],
)
def test_launcher_rejects_parallel_resume_and_shard_modes(
    tmp_path: Path,
    incompatible: list[str],
) -> None:
    with pytest.raises(SystemExit):
        launcher._parse_args([*_full_args(tmp_path), *incompatible])


def test_launcher_rejects_verify_shards_with_piqd_flags(
    tmp_path: Path,
    capsys: pytest.CaptureFixture[str],
) -> None:
    with pytest.raises(SystemExit):
        launcher._parse_args(
            [*_full_args(tmp_path), "--verify-shards", str(tmp_path / "shard")]
        )

    assert (
        "PIQD flags cannot be combined with --verify-shards" in capsys.readouterr().err
    )
    assert not (tmp_path / "out").exists()


@pytest.mark.parametrize(
    ("attribute", "value", "message"),
    [
        ("workers", 2, "workers 1"),
        ("parallel_mode", "cube-batch", "parallel-mode sequential"),
        ("resume", True, "resume continuity"),
        ("shard_depth", 1, "fixed-shard continuity"),
        ("verify_shards", [Path("shard")], "verify-shards"),
    ],
)
def test_direct_launch_api_cannot_bypass_mode_gates(
    tmp_path: Path,
    attribute: str,
    value: object,
    message: str,
) -> None:
    args = launcher._parse_args(_full_args(tmp_path))
    setattr(args.structural, attribute, value)

    with pytest.raises(launcher.PiqdStructuralCegarLaunchError, match=message):
        launcher.run_piqd_launch(
            args,
            route_factory=lambda **_kwargs: pytest.fail("route must not build"),
            driver=lambda *_args, **_kwargs: pytest.fail("driver must not run"),
        )


def test_launcher_passes_exact_manifest_bytes_and_writes_route_sidecar(
    tmp_path: Path,
) -> None:
    source, producer = _write_manifests(tmp_path)
    args = launcher._parse_args(_full_args(tmp_path))
    observed: dict[str, Any] = {}
    solver_runner = object()

    class FakeRoute:
        def __init__(self) -> None:
            self.solver_runner = solver_runner

        @staticmethod
        def configuration() -> dict[str, object]:
            return {
                "schema": "test-route/v1",
                "terminal_proof_runner_origin": "caller-supplied",
            }

    def route_factory(**kwargs: Any) -> FakeRoute:
        observed["route"] = kwargs
        return FakeRoute()

    def driver(out: Path, **kwargs: Any) -> dict[str, Any]:
        observed["driver"] = kwargs
        out.mkdir(parents=True)
        manifest = {"status": "UNKNOWN", "schema": "frozen-test-manifest"}
        (out / "manifest.json").write_bytes(wave.canonical_json_bytes(manifest))
        (out / "solver-logs.jsonl").write_bytes(b'{"verdict":"UNKNOWN"}\n')
        return manifest

    manifest, sidecar = launcher.run_piqd_launch(
        args,
        route_factory=route_factory,
        driver=driver,
    )

    route_inputs = observed["route"]
    assert route_inputs["source_manifest_bytes"] == source
    assert route_inputs["producer_manifest_bytes"] == producer
    assert observed["driver"]["solver_runner"] is solver_runner
    assert manifest["status"] == "UNKNOWN"
    assert sidecar["schema"] == launcher.SIDECAR_SCHEMA
    assert sidecar["route"]["schema"] == "test-route/v1"
    sidecar_path = tmp_path / "out" / launcher.SIDECAR_NAME
    assert sidecar_path.read_bytes() == wave.canonical_json_bytes(sidecar)
    assert sidecar["structural_manifest"]["sha256"] == wave.sha256_bytes(
        (tmp_path / "out" / "manifest.json").read_bytes()
    )


@pytest.mark.parametrize("kind", ["symlink", "directory", "too-large"])
def test_launcher_rejects_unsafe_final_manifest_component(
    tmp_path: Path,
    kind: str,
) -> None:
    source = tmp_path / "source.json"
    if kind == "symlink":
        target = tmp_path / "source-target.json"
        target.write_bytes(b"source\n")
        source.symlink_to(target)
    elif kind == "directory":
        source.mkdir()
    else:
        source.write_bytes(b"x" * (launcher.PIQD_MANIFEST_MAX_BYTES + 1))

    with pytest.raises(launcher.PiqdStructuralCegarLaunchError):
        launcher._capture_manifest(source, label="PIQD source manifest")


def test_launcher_rejects_manifest_mutation_during_capture(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    source = tmp_path / "source.json"
    source.write_bytes(b"source bytes\n")
    real_read = launcher.runtime.os.read
    mutated = False

    def drifting_read(descriptor: int, size: int) -> bytes:
        nonlocal mutated
        chunk = real_read(descriptor, size)
        if chunk and not mutated:
            mutated = True
            source.write_bytes(b"changed byte\n")
        return chunk

    monkeypatch.setattr(launcher.runtime.os, "read", drifting_read)

    with pytest.raises(launcher.PiqdStructuralCegarLaunchError, match="changed"):
        launcher._capture_manifest(source, label="PIQD source manifest")


def test_launcher_sidecar_never_overwrites_existing_destination(
    tmp_path: Path,
) -> None:
    _write_manifests(tmp_path)
    args = launcher._parse_args(_full_args(tmp_path))
    out = tmp_path / "out"
    sentinel = b"existing sidecar\n"

    fake_route = SimpleNamespace(
        solver_runner=lambda *_args: pytest.fail("solver must not run"),
        configuration=lambda: {"schema": "test-route/v1"},
    )

    def driver(path: Path, **_kwargs: Any) -> dict[str, Any]:
        path.mkdir(parents=True)
        manifest = {"status": "UNKNOWN"}
        (path / "manifest.json").write_bytes(wave.canonical_json_bytes(manifest))
        (path / "solver-logs.jsonl").write_bytes(b"log\n")
        (path / launcher.SIDECAR_NAME).write_bytes(sentinel)
        return manifest

    with pytest.raises(FileExistsError):
        launcher.run_piqd_launch(
            args,
            route_factory=lambda **_kwargs: fake_route,
            driver=driver,
        )
    assert (out / launcher.SIDECAR_NAME).read_bytes() == sentinel
    temporaries = list(out.glob(".piqd-route-manifest.*.tmp"))
    assert len(temporaries) == 1
    assert temporaries[0].stat().st_size > 0


@pytest.mark.parametrize("failure", ["write", "fsync"])
def test_launcher_preserves_sidecar_temporary_after_durable_write_failure(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    failure: str,
) -> None:
    _write_manifests(tmp_path)
    args = launcher._parse_args(_full_args(tmp_path))
    out = tmp_path / "out"
    fake_route = SimpleNamespace(
        solver_runner=lambda *_args: pytest.fail("solver must not run"),
        configuration=lambda: {"schema": "test-route/v1"},
    )

    def driver(path: Path, **_kwargs: Any) -> dict[str, Any]:
        path.mkdir(parents=True)
        manifest = {"status": "UNKNOWN"}
        (path / "manifest.json").write_bytes(wave.canonical_json_bytes(manifest))
        (path / "solver-logs.jsonl").write_bytes(b"log\n")
        return manifest

    def fail(*_args: object) -> None:
        raise OSError(f"injected {failure} failure")

    monkeypatch.setattr(launcher.os, failure, fail)
    with pytest.raises(OSError, match=f"injected {failure} failure"):
        launcher.run_piqd_launch(
            args,
            route_factory=lambda **_kwargs: fake_route,
            driver=driver,
        )

    assert not (out / launcher.SIDECAR_NAME).exists()
    temporaries = list(out.glob(".piqd-route-manifest.*.tmp"))
    assert len(temporaries) == 1
    if failure == "write":
        assert temporaries[0].stat().st_size == 0
    else:
        assert temporaries[0].stat().st_size > 0


def test_launcher_never_unlinks_ambiguous_replacement_temporary(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    _write_manifests(tmp_path)
    args = launcher._parse_args(_full_args(tmp_path))
    out = tmp_path / "out"
    replacement = b"same-user replacement sentinel\n"
    observed_temporary: Path | None = None
    fake_route = SimpleNamespace(
        solver_runner=lambda *_args: pytest.fail("solver must not run"),
        configuration=lambda: {"schema": "test-route/v1"},
    )

    def driver(path: Path, **_kwargs: Any) -> dict[str, Any]:
        path.mkdir(parents=True)
        manifest = {"status": "UNKNOWN"}
        (path / "manifest.json").write_bytes(wave.canonical_json_bytes(manifest))
        (path / "solver-logs.jsonl").write_bytes(b"log\n")
        return manifest

    def replace_then_fail(source: Path, _destination: Path) -> None:
        nonlocal observed_temporary
        observed_temporary = source
        source.unlink()
        source.write_bytes(replacement)
        raise RuntimeError("injected publication failure")

    monkeypatch.setattr(
        launcher.runtime,
        "atomic_rename_noreplace",
        replace_then_fail,
    )
    with pytest.raises(RuntimeError, match="injected publication failure"):
        launcher.run_piqd_launch(
            args,
            route_factory=lambda **_kwargs: fake_route,
            driver=driver,
        )

    assert observed_temporary is not None
    assert observed_temporary.read_bytes() == replacement
    assert not (out / launcher.SIDECAR_NAME).exists()


def test_frozen_local_entrypoint_preserves_legacy_default() -> None:
    args = structural._parse_args([])
    signature = inspect.signature(structural.run_driver)

    assert not hasattr(args, "piqd_base_url")
    assert "piqd_solver_route" not in signature.parameters
    assert signature.parameters["solver_runner"].default is structural.sat.run_cadical
