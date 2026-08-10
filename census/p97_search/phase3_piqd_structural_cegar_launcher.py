"""Additive PIQD launcher for the frozen phase-3 structural CEGAR v2 driver."""

from __future__ import annotations

import argparse
import json
import os
import tempfile
from collections.abc import Callable, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search import phase3_cegar_runtime as runtime
from census.p97_search import phase3_cegar_wave as wave
from census.p97_search import phase3_piqd_structural_cegar_route as route_module
from census.p97_search import phase3_structural_cegar as structural

PIQD_MANIFEST_MAX_BYTES = 64 * 1024
ROUTE_ARTIFACT_MAX_BYTES = 8 * 1024 * 1024 * 1024
SIDECAR_SCHEMA = "p97-piqd-structural-cegar-launch/v1"
SIDECAR_NAME = "piqd-route-manifest.json"

RouteFactory = Callable[..., route_module.StructuralCegarPiqdRoute]
Driver = Callable[..., dict[str, Any]]


class PiqdStructuralCegarLaunchError(RuntimeError):
    """The additive PIQD launch contract could not be satisfied."""


@dataclass(frozen=True)
class PiqdLaunchArguments:
    base_url: str
    journal_root: Path
    source_manifest: Path
    producer_manifest: Path
    structural: argparse.Namespace


def _piqd_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(add_help=False)
    parser.add_argument("--piqd-base-url")
    parser.add_argument("--piqd-journal-root", type=Path)
    parser.add_argument("--piqd-source-manifest", type=Path)
    parser.add_argument("--piqd-producer-manifest", type=Path)
    return parser


def _validate_launch_arguments(args: PiqdLaunchArguments) -> None:
    values = (
        args.base_url,
        args.journal_root,
        args.source_manifest,
        args.producer_manifest,
    )
    if any(value is None for value in values):
        raise PiqdStructuralCegarLaunchError(
            "--piqd-base-url, --piqd-journal-root, --piqd-source-manifest, "
            "and --piqd-producer-manifest are all required"
        )
    if not isinstance(args.base_url, str) or not args.base_url.strip():
        raise PiqdStructuralCegarLaunchError(
            "--piqd-base-url must be a nonempty string"
        )
    if type(args.structural.workers) is not int or args.structural.workers != 1:
        raise PiqdStructuralCegarLaunchError("PIQD launch requires --workers 1")
    if args.structural.parallel_mode != "sequential":
        raise PiqdStructuralCegarLaunchError(
            "PIQD launch requires --parallel-mode sequential"
        )
    if args.structural.resume:
        raise PiqdStructuralCegarLaunchError(
            "PIQD launch does not support --resume continuity"
        )
    if (
        args.structural.shard_depth is not None
        or args.structural.shard_index is not None
    ):
        raise PiqdStructuralCegarLaunchError(
            "PIQD launch does not support fixed-shard continuity"
        )
    if args.structural.verify_shards is not None:
        raise PiqdStructuralCegarLaunchError(
            "PIQD flags cannot be combined with --verify-shards"
        )


def _parse_args(argv: Sequence[str] | None = None) -> PiqdLaunchArguments:
    parser = _piqd_parser()
    piqd, structural_argv = parser.parse_known_args(argv)
    structural_args = structural._parse_args(structural_argv)
    args = PiqdLaunchArguments(
        base_url=piqd.piqd_base_url,
        journal_root=piqd.piqd_journal_root,
        source_manifest=piqd.piqd_source_manifest,
        producer_manifest=piqd.piqd_producer_manifest,
        structural=structural_args,
    )
    try:
        _validate_launch_arguments(args)
    except PiqdStructuralCegarLaunchError as exc:
        parser.error(str(exc))
    return args


def _capture_manifest(path: Path, *, label: str) -> bytes:
    try:
        captured = runtime.capture_exact_regular_file(
            path,
            max_bytes=PIQD_MANIFEST_MAX_BYTES,
            require_nonempty=True,
            label=label,
        )
    except runtime.ExactFileCaptureError as exc:
        raise PiqdStructuralCegarLaunchError(str(exc)) from exc
    assert captured.data is not None
    return captured.data


def _capture_artifact(path: Path, *, label: str) -> runtime.ExactFileCapture:
    try:
        return runtime.capture_exact_regular_file(
            path,
            max_bytes=ROUTE_ARTIFACT_MAX_BYTES,
            require_nonempty=True,
            require_single_link=True,
            keep_bytes=False,
            label=label,
        )
    except runtime.ExactFileCaptureError as exc:
        raise PiqdStructuralCegarLaunchError(str(exc)) from exc


def _publish_route_sidecar(
    *,
    out: Path,
    piqd_route: route_module.StructuralCegarPiqdRoute,
    manifest: dict[str, Any],
) -> dict[str, Any]:
    structural_manifest_path = out / "manifest.json"
    solver_logs_path = out / "solver-logs.jsonl"
    structural_capture = _capture_artifact(
        structural_manifest_path,
        label="structural CEGAR manifest",
    )
    try:
        logs_capture = _capture_artifact(
            solver_logs_path,
            label="structural CEGAR solver log",
        )
    except PiqdStructuralCegarLaunchError:
        if solver_logs_path.exists() or solver_logs_path.is_symlink():
            raise
        logs_capture = None

    sidecar: dict[str, Any] = {
        "schema": SIDECAR_SCHEMA,
        "route": piqd_route.configuration(),
        "structural_status": manifest.get("status"),
        "structural_manifest": {
            "path": "manifest.json",
            "byte_count": structural_capture.byte_count,
            "sha256": structural_capture.sha256,
        },
        "solver_logs": (
            None
            if logs_capture is None
            else {
                "path": "solver-logs.jsonl",
                "byte_count": logs_capture.byte_count,
                "sha256": logs_capture.sha256,
            }
        ),
    }
    sidecar_bytes = wave.canonical_json_bytes(sidecar)
    out.mkdir(parents=True, exist_ok=True)
    descriptor, temporary_name = tempfile.mkstemp(
        prefix=".piqd-route-manifest.",
        suffix=".tmp",
        dir=out,
    )
    temporary = Path(temporary_name)
    # Once the name exists, POSIX offers no atomic "unlink only if this is still
    # that inode" operation.  Any failure before the no-replace rename therefore
    # preserves the temporary path, even if it is empty or has been substituted.
    # A successful rename consumes the temporary name; later validation failures
    # preserve the published sidecar.  This deliberately avoids raceable cleanup.
    try:
        owned_info = os.fstat(descriptor)
        owned_identity = owned_info.st_dev, owned_info.st_ino
        view = memoryview(sidecar_bytes)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise PiqdStructuralCegarLaunchError(
                    "short write while publishing PIQD route sidecar"
                )
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)

    temporary_capture = _capture_artifact(
        temporary,
        label="PIQD route sidecar temporary",
    )
    if (
        temporary_capture.device,
        temporary_capture.inode,
    ) != owned_identity or temporary_capture.data is not None:
        raise PiqdStructuralCegarLaunchError(
            "PIQD route sidecar temporary identity drift"
        )
    runtime.atomic_rename_noreplace(temporary, out / SIDECAR_NAME)
    published_capture = _capture_artifact(
        out / SIDECAR_NAME,
        label="PIQD route sidecar",
    )
    if not temporary_capture.same_identity_and_content(published_capture):
        raise PiqdStructuralCegarLaunchError(
            "PIQD route sidecar identity drift during publication"
        )
    structural_after = _capture_artifact(
        structural_manifest_path,
        label="structural CEGAR manifest",
    )
    if not structural_capture.same_identity_and_content(structural_after):
        raise PiqdStructuralCegarLaunchError(
            "structural CEGAR manifest drift during sidecar publication"
        )
    if logs_capture is not None:
        logs_after = _capture_artifact(
            solver_logs_path,
            label="structural CEGAR solver log",
        )
        if not logs_capture.same_identity_and_content(logs_after):
            raise PiqdStructuralCegarLaunchError(
                "solver log drift during sidecar publication"
            )
    return sidecar


def run_piqd_launch(
    args: PiqdLaunchArguments,
    *,
    route_factory: RouteFactory = route_module.make_piqd_structural_cegar_route,
    driver: Driver = structural.run_driver,
) -> tuple[dict[str, Any], dict[str, Any]]:
    """Run the frozen driver with the PIQD/local-proof composite solver."""

    _validate_launch_arguments(args)
    source = _capture_manifest(args.source_manifest, label="PIQD source manifest")
    producer = _capture_manifest(
        args.producer_manifest,
        label="PIQD producer manifest",
    )
    piqd_route = route_factory(
        base_url=args.base_url,
        journal_root=args.journal_root,
        source_manifest_bytes=source,
        producer_manifest_bytes=producer,
    )
    legacy = args.structural
    manifest = driver(
        legacy.out,
        timeout_s=legacy.timeout,
        learned_core_limit=legacy.learned_core_limit,
        survivor_limit=legacy.survivor_limit,
        workers=legacy.workers,
        parallel_mode=legacy.parallel_mode,
        cube_depth=legacy.cube_depth,
        cube_artifact_mode=legacy.cube_artifact_mode,
        shard_depth=legacy.shard_depth,
        shard_index=legacy.shard_index,
        bootstrap_results=(None if legacy.no_bootstrap else legacy.bootstrap_results),
        algebraic_bootstrap=(
            ()
            if legacy.no_algebraic_bootstrap
            else (
                structural.DEFAULT_ALGEBRAIC_BOOTSTRAPS
                if legacy.algebraic_bootstrap is None
                else tuple(legacy.algebraic_bootstrap)
            )
        ),
        projected_static_v2=legacy.projected_static_v2,
        resume=legacy.resume,
        max_new_raw=legacy.max_new_raw,
        solver_runner=piqd_route.solver_runner,
    )
    sidecar = _publish_route_sidecar(
        out=legacy.out,
        piqd_route=piqd_route,
        manifest=manifest,
    )
    return manifest, sidecar


def main(argv: Sequence[str] | None = None) -> int:
    args = _parse_args(argv)
    manifest, sidecar = run_piqd_launch(args)
    print(
        json.dumps(
            {"structural_manifest": manifest, "piqd_route_manifest": sidecar},
            indent=2,
            sort_keys=True,
        )
    )
    return 0 if manifest["status"] != "UNKNOWN" else 2


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "PIQD_MANIFEST_MAX_BYTES",
    "SIDECAR_NAME",
    "SIDECAR_SCHEMA",
    "PiqdLaunchArguments",
    "PiqdStructuralCegarLaunchError",
    "_parse_args",
    "run_piqd_launch",
]
