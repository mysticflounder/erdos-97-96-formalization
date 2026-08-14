"""Single command-line entrypoint for registered P97 CEGAR wave execution."""

from __future__ import annotations

import argparse
import json
import sys
import uuid
from collections.abc import Sequence
from pathlib import Path
from typing import Any

import census.p97_search.cegar_exact17_lifecycle as exact17_lifecycle
from census.p97_search.cegar_wave_registry import (
    WaveRegistryError,
    execute_registered_wave,
    inspect_registered_output_structure,
    plan_execution,
    validate_registered_ingress,
    validate_registered_output,
)
from census.p97_search.phase3_cegar_assumption_engine import (
    AssumptionCnfEngineError,
)
from census.p97_search.phase3_cegar_runtime import (
    ExactFileCaptureError,
    capture_exact_regular_file,
)
from census.p97_search.phase3_cegar_wave_control import (
    ASSUMPTION_CNF,
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


def _canonical_existing_session_id(raw: object) -> str:
    if type(raw) is not str:
        raise WaveRegistryError("existing_session_id must be a canonical UUID")
    try:
        parsed = uuid.UUID(raw)
    except (ValueError, AttributeError) as exc:
        raise WaveRegistryError("existing_session_id must be a canonical UUID") from exc
    if str(parsed) != raw or parsed.variant != uuid.RFC_4122:
        raise WaveRegistryError("existing_session_id must be a canonical UUID")
    return raw


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
    run.add_argument("--journal-root")
    run.add_argument("--server", default="http://127.0.0.1:7272")
    run.add_argument("--timeout-s", type=int)
    run.add_argument("--solver-signature")
    run.add_argument("--existing-session-id")

    validate_output = commands.add_parser("validate-output")
    validate_output.add_argument("control")
    validate_output.add_argument("output")
    validate_output.add_argument("--package-root", required=True)

    check = commands.add_parser("check")
    check.add_argument("control")
    check.add_argument("output")
    check.add_argument("--package-root", required=True)

    for name in (
        "lifecycle-plan",
        "lifecycle-validate-local",
        "lifecycle-live-identity",
        "lifecycle-start",
        "lifecycle-finalize",
        "lifecycle-cleanup-status",
    ):
        command = commands.add_parser(name)
        command.add_argument("--profile", required=True)

    reconcile = commands.add_parser("lifecycle-reconcile")
    reconcile.add_argument("--profile", required=True)
    reconcile.add_argument("--job-id", required=True)
    return parser


def _run_lifecycle(args: argparse.Namespace) -> dict[str, Any]:
    profile = exact17_lifecycle.require_profile(args.profile)
    if args.command == "lifecycle-plan":
        payload = exact17_lifecycle.lifecycle_plan(profile.profile_id)
    elif args.command == "lifecycle-cleanup-status":
        payload = exact17_lifecycle.cleanup_eligibility(profile.profile_id)
    elif args.command == "lifecycle-validate-local":
        payload = exact17_lifecycle.validate_local(profile.profile_id)
    else:
        client = exact17_lifecycle.new_client(profile.profile_id)
        if args.command == "lifecycle-live-identity":
            payload = exact17_lifecycle.live_identity(client, profile.profile_id)
        elif args.command == "lifecycle-start":
            payload = exact17_lifecycle.start(client, profile.profile_id)
        elif args.command == "lifecycle-reconcile":
            payload = exact17_lifecycle.reconcile(
                client, args.job_id, profile.profile_id
            )
        elif args.command == "lifecycle-finalize":
            payload = exact17_lifecycle.finalize(client, profile.profile_id)
        else:
            raise WaveRegistryError("unsupported lifecycle command")
    return {
        "schema": CLI_SCHEMA,
        "command": args.command,
        "status": "PASS",
        "profile": profile.profile_id,
        "lifecycle": payload,
    }


def _run(args: argparse.Namespace) -> dict[str, Any]:
    if args.command.startswith("lifecycle-"):
        return _run_lifecycle(args)
    if args.command == "status":
        output = _absolute_path(args.output, "output")
        envelope = inspect_registered_output_structure(output)
        return {
            "schema": CLI_SCHEMA,
            "command": args.command,
            "status": "OBSERVED",
            "classification": _classification(envelope),
            "envelope_sha256": envelope["envelope_sha256"],
            "output": str(output),
            "custody_status": "STRUCTURAL_ONLY",
        }

    control_path = _absolute_path(args.control, "control")
    control = _load_control(control_path)
    if args.command in {"check", "validate-output"}:
        package_root = _absolute_path(args.package_root, "package_root")
        output = _absolute_path(args.output, "output")
        envelope = validate_registered_output(control, package_root, output)
        return {
            "schema": CLI_SCHEMA,
            "command": args.command,
            "status": "PASS",
            "classification": _classification(envelope),
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
    existing_session_id = None
    if args.existing_session_id is not None:
        if control.registration.wave_kind != ASSUMPTION_CNF:
            raise WaveRegistryError(
                "--existing-session-id is permitted only for ASSUMPTION_CNF run"
            )
        existing_session_id = _canonical_existing_session_id(args.existing_session_id)
    if args.timeout_s is not None and args.timeout_s <= 0:
        raise WaveRegistryError("timeout_s must be a positive integer")
    execution_kwargs: dict[str, Any] = {
        "output_path": _absolute_path(args.output, "output"),
        "base_url": args.server,
        "timeout_s": args.timeout_s,
    }
    if args.journal_root is not None:
        execution_kwargs["journal_root"] = _absolute_path(
            args.journal_root, "journal_root"
        )
    if args.solver_signature is not None:
        execution_kwargs["solver_signature"] = args.solver_signature
    if existing_session_id is not None:
        # The registry currently retains the historical internal keyword.  The
        # generic public CLI and engine expose only ``existing_session_id``.
        execution_kwargs["resume_session"] = existing_session_id
    result = execute_registered_wave(control, package_root, **execution_kwargs)
    return {
        "schema": CLI_SCHEMA,
        "command": "run",
        "status": "PASS",
        "classification": result.classification,
        "envelope_sha256": result.envelope["envelope_sha256"],
        "output": str(_result_path(result)),
    }


def _classification(envelope: dict[str, Any]) -> str:
    if type(envelope) is not dict:
        raise WaveRegistryError("registered output envelope must be an exact object")
    result = envelope.get("result")
    if type(result) is dict and type(result.get("classification")) is str:
        return result["classification"]
    summary = envelope.get("summary")
    if type(summary) is dict and type(summary.get("classification")) is str:
        return summary["classification"]
    raise WaveRegistryError("registered output classification is absent")


def _result_path(result: object) -> Path:
    path = getattr(result, "envelope_path", None)
    if path is None:
        path = getattr(result, "output_path", None)
    if type(path) is not _NATIVE_PATH_TYPE or not path.is_absolute():
        raise WaveRegistryError("registered execution returned an invalid output path")
    return path


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        payload = _run(args)
    except (
        exact17_lifecycle.ConfirmConflictError,
        exact17_lifecycle.Exact17LifecycleError,
        exact17_lifecycle.UnprovisionedError,
        exact17_lifecycle.UnreconciledPrepareError,
        ExactFileCaptureError,
        AssumptionCnfEngineError,
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
