"""Single command-line entrypoint for registered P97 CEGAR wave execution."""

from __future__ import annotations

import argparse
import json
import sys
from collections.abc import Sequence
from pathlib import Path
from typing import Any

from census.p97_search.cegar_wave_registry import (
    WaveRegistryError,
    check_registered_output,
    execute_registered_wave,
    plan_execution,
    validate_registered_ingress,
    validate_registered_output,
)
from census.p97_search.phase3_cegar_runtime import (
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from census.p97_search.phase3_cegar_wave_control import (
    MAX_CONTROL_BYTES,
    WaveControl,
    WaveControlError,
    load_wave_control,
)
from census.p97_search.phase3_cegar_wave_engine import StaticCnfEngineError

CLI_SCHEMA = "p97-cegar-wave-cli/v1"
_NATIVE_PATH_TYPE = type(Path())


def _absolute_path(raw: str, label: str) -> Path:
    if type(raw) is not str or not raw:
        raise WaveRegistryError(f"{label} must be a nonempty builtin string")
    path = Path(raw)
    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise WaveRegistryError(f"{label} must be an absolute native path")
    return path


def _load_control(path: Path) -> WaveControl:
    captured = capture_exact_regular_file(
        path,
        max_bytes=MAX_CONTROL_BYTES,
        require_nonempty=True,
        require_single_link=True,
        keep_bytes=True,
        label="wave control",
    )
    if captured.data is None:
        raise WaveRegistryError("wave control bytes were not retained")
    return load_wave_control(captured.data)


def _emit(payload: dict[str, Any], *, stream: Any = None) -> None:
    target = sys.stdout if stream is None else stream
    target.write(json.dumps(payload, sort_keys=True, separators=(",", ":")) + "\n")


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(prog="p97-cegar-wave")
    commands = parser.add_subparsers(dest="command", required=True)

    for name in ("plan", "validate-ingress"):
        command = commands.add_parser(name)
        command.add_argument("control")
        command.add_argument("--package-root", required=True)

    status = commands.add_parser("status")
    status.add_argument("output")

    run = commands.add_parser("run")
    run.add_argument("control")
    run.add_argument("--package-root", required=True)
    run.add_argument("--output", required=True)
    run.add_argument("--journal-root", required=True)
    run.add_argument("--server", default="http://127.0.0.1:7272")
    run.add_argument("--timeout-s", type=int)

    validate_output = commands.add_parser("validate-output")
    validate_output.add_argument("output")

    check = commands.add_parser("check")
    check.add_argument("control")
    check.add_argument("output")
    check.add_argument("--package-root", required=True)
    return parser


def _run(args: argparse.Namespace) -> dict[str, Any]:
    if args.command in {"status", "validate-output"}:
        output = _absolute_path(args.output, "output")
        envelope = validate_registered_output(output)
        return {
            "schema": CLI_SCHEMA,
            "command": args.command,
            "status": "PASS",
            "classification": envelope["result"]["classification"],
            "envelope_sha256": envelope["envelope_sha256"],
            "output": str(output),
            "custody_status": "OFFLINE_VALIDATED",
        }

    control_path = _absolute_path(args.control, "control")
    control = _load_control(control_path)
    if args.command == "check":
        package_root = _absolute_path(args.package_root, "package_root")
        output = _absolute_path(args.output, "output")
        envelope = check_registered_output(control, package_root, output)
        return {
            "schema": CLI_SCHEMA,
            "command": "check",
            "status": "PASS",
            "classification": envelope["result"]["classification"],
            "envelope_sha256": envelope["envelope_sha256"],
            "output": str(output),
            "custody_status": "OFFLINE_CROSS_BOUND",
        }

    package_root = _absolute_path(args.package_root, "package_root")
    if args.command == "plan":
        return {
            "schema": CLI_SCHEMA,
            "command": "plan",
            "status": "PASS",
            "execution": plan_execution(control, package_root),
        }
    if args.command == "validate-ingress":
        return {
            "schema": CLI_SCHEMA,
            "command": "validate-ingress",
            "status": "PASS",
            "ingress": validate_registered_ingress(control, package_root),
        }
    if args.command != "run":
        raise WaveRegistryError("unsupported command")
    if args.timeout_s is not None and args.timeout_s <= 0:
        raise WaveRegistryError("timeout_s must be a positive integer")
    result = execute_registered_wave(
        control,
        package_root,
        output_path=_absolute_path(args.output, "output"),
        base_url=args.server,
        journal_root=_absolute_path(args.journal_root, "journal_root"),
        timeout_s=args.timeout_s,
    )
    return {
        "schema": CLI_SCHEMA,
        "command": "run",
        "status": "PASS",
        "classification": result.classification,
        "envelope_sha256": result.envelope["envelope_sha256"],
        "output": str(result.envelope_path),
    }


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        payload = _run(args)
    except (
        ExactFileCaptureError,
        OSError,
        StaticCnfEngineError,
        WaveControlError,
        WaveRegistryError,
    ) as error:
        _emit(
            {
                "schema": CLI_SCHEMA,
                "command": args.command,
                "status": "ERROR",
                "error": str(error),
            },
            stream=sys.stderr,
        )
        return 2
    _emit(payload)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
