#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Run an explicit Lean migration census through the global ``lake-build`` wrapper.

This is a sequential workload driver. It deliberately delegates locking,
resource handling, and Lean invocation to ``lake-build`` and only owns per-target
timeouts, process-group cleanup, logs, and the bounded summary record.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import signal
import subprocess
import sys
import time
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

SCHEMA = "migration-build-census/v1"


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace(
        "+00:00", "Z"
    )


def _sha256(path: Path) -> str | None:
    try:
        return hashlib.sha256(path.read_bytes()).hexdigest()
    except OSError:
        return None


def _head_evidence(repo_root: Path) -> dict[str, Any]:
    command = ["git", "rev-parse", "HEAD"]
    try:
        result = subprocess.run(
            command,
            cwd=repo_root,
            check=False,
            capture_output=True,
            text=True,
            timeout=5,
        )
    except (OSError, subprocess.TimeoutExpired) as exc:
        return {"command": command, "commit": None, "error": str(exc)}
    commit = result.stdout.strip() if result.returncode == 0 else None
    return {
        "command": command,
        "commit": commit,
        "returncode": result.returncode,
        "error": result.stderr.strip() if result.returncode else None,
    }


def _normalise_target(raw: str) -> str:
    target = raw.strip()
    target = target.removeprefix("+").removesuffix(":olean")
    path_parts = target.replace(".", "/").split("/")
    if (
        not target
        or target.startswith(("-", "+"))
        or any(ch.isspace() for ch in target)
        or "\\" in target
        or any(part in {"", ".."} for part in path_parts)
    ):
        raise ValueError(f"invalid module target: {raw!r}")
    if ":" in target:
        raise ValueError(f"target must be a module name: {raw!r}")
    return target


def _load_targets(values: list[str], target_list: Path | None) -> list[str]:
    raw_targets = list(values)
    if target_list is not None:
        try:
            payload = json.loads(target_list.read_text(encoding="utf-8"))
        except (OSError, json.JSONDecodeError) as exc:
            raise ValueError(f"cannot read target list {target_list}: {exc}") from exc
        if isinstance(payload, dict):
            payload = payload.get("targets")
        if not isinstance(payload, list) or not all(isinstance(item, str) for item in payload):
            raise ValueError("target list must be a JSON array of strings or {\"targets\": [...]}")
        raw_targets.extend(payload)
    targets = [_normalise_target(value) for value in raw_targets]
    if not targets:
        raise ValueError("at least one --target or --target-list target is required")
    if len(set(targets)) != len(targets):
        raise ValueError("duplicate module targets are not allowed")
    return targets


def _source_evidence(repo_root: Path, lean_root: Path, target: str) -> dict[str, Any]:
    source = lean_root / Path(target.replace(".", "/")).with_suffix(".lean")
    try:
        relative = source.relative_to(repo_root)
        display_path = relative.as_posix()
    except ValueError:
        display_path = str(source)
    return {
        "path": display_path,
        "exists": source.is_file(),
        "sha256": _sha256(source),
    }


def _kill_group(process: subprocess.Popen[Any], grace_seconds: float) -> dict[str, bool]:
    term_sent = False
    kill_sent = False
    if os.name == "posix":
        try:
            group_exists = os.killpg(process.pid, 0) is None
        except ProcessLookupError:
            group_exists = False
        if group_exists:
            try:
                os.killpg(process.pid, signal.SIGTERM)
                term_sent = True
            except ProcessLookupError:
                group_exists = False
    else:
        group_exists = process.poll() is None
        if group_exists:
            process.terminate()
            term_sent = True
    if not group_exists:
        process.wait()
        return {"term_sent": term_sent, "kill_sent": kill_sent}
    deadline = time.monotonic() + max(0.01, grace_seconds)
    try:
        process.wait(timeout=max(0.01, grace_seconds))
    except subprocess.TimeoutExpired:
        pass
    if os.name == "posix":
        try:
            group_exists = os.killpg(process.pid, 0) is None
        except ProcessLookupError:
            group_exists = False
        remaining = deadline - time.monotonic()
        if group_exists and remaining > 0:
            time.sleep(remaining)
        if group_exists:
            try:
                os.killpg(process.pid, signal.SIGKILL)
                kill_sent = True
            except ProcessLookupError:
                pass
    elif process.poll() is None:
        process.kill()
        kill_sent = True
    process.wait()
    return {"term_sent": term_sent, "kill_sent": kill_sent}


def _write_json(path: Path, payload: dict[str, Any]) -> None:
    temporary = path.with_name(f".{path.name}.tmp")
    temporary.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    os.replace(temporary, path)


def _empty_record(
    index: int,
    target: str,
    log_path: Path,
    source: dict[str, Any],
    head: dict[str, Any],
    argv: list[str],
) -> dict[str, Any]:
    return {
        "index": index,
        "target": target,
        "argv": argv,
        "log": log_path.name,
        "source": source,
        "head": head,
        "status": "error",
        "exit_code": None,
        "duration_seconds": 0.0,
        "termination": {"term_sent": False, "kill_sent": False},
    }


def _run_target(
    *,
    index: int,
    target: str,
    wrapper: str,
    repo_root: Path,
    lean_root: Path,
    run_root: Path,
    timeout_seconds: float,
    grace_seconds: float,
    head: dict[str, Any],
) -> dict[str, Any]:
    argv = [wrapper, f"+{target}:olean"]
    log_path = run_root / f"target-{index:03d}.log"
    source = _source_evidence(repo_root, lean_root, target)
    record = _empty_record(index, target, log_path, source, head, argv)
    started = time.monotonic()
    if not source["exists"]:
        log_path.write_text(f"source file not found: {source['path']}\n", encoding="utf-8")
        record["error"] = "source file not found"
        return record
    environment = dict(os.environ)
    environment["LAKE_BUILD_NO_REFRESH"] = "1"
    environment["LEAN_ROOT"] = str(lean_root)
    try:
        with log_path.open("wb") as log:
            process = subprocess.Popen(
                argv,
                cwd=repo_root,
                env=environment,
                stdout=log,
                stderr=subprocess.STDOUT,
                start_new_session=True,
            )
            try:
                exit_code = process.wait(timeout=timeout_seconds)
                record["status"] = "passed" if exit_code == 0 else "failed"
                record["exit_code"] = exit_code
                if exit_code != 0:
                    record["termination"] = _kill_group(process, grace_seconds)
            except subprocess.TimeoutExpired:
                record["status"] = "timeout"
                record["termination"] = _kill_group(process, grace_seconds)
                record["exit_code"] = process.returncode
            except KeyboardInterrupt:
                record["status"] = "interrupted"
                record["termination"] = _kill_group(process, grace_seconds)
                record["exit_code"] = process.returncode
    except (OSError, ValueError) as exc:
        record["error"] = str(exc)
        log_path.write_text(f"wrapper launch error: {exc}\n", encoding="utf-8")
    record["duration_seconds"] = round(time.monotonic() - started, 3)
    return record


def run_census(
    *,
    targets: list[str],
    run_root: Path,
    repo_root: Path,
    lean_root: Path,
    wrapper: str = "lake-build",
    timeout_seconds: float = 600.0,
    grace_seconds: float = 1.0,
    keep_going: bool = False,
) -> tuple[int, dict[str, Any]]:
    if (
        not math.isfinite(timeout_seconds)
        or not math.isfinite(grace_seconds)
        or timeout_seconds <= 0
        or grace_seconds < 0
    ):
        raise ValueError("timeouts must be positive and grace period must be nonnegative")
    run_root.mkdir(parents=True, exist_ok=True)
    summary_path = run_root / "summary.json"
    existing = [path for path in (summary_path, *sorted(run_root.glob("target-*.log"))) if path.exists()]
    if existing:
        names = ", ".join(path.name for path in existing)
        raise FileExistsError(f"run root already contains census evidence: {names}")
    head = _head_evidence(repo_root)
    summary: dict[str, Any] = {
        "schema": SCHEMA,
        "status": "running",
        "started_utc": _utc_now(),
        "finished_utc": None,
        "repo_root": str(repo_root),
        "run_root": str(run_root),
        "wrapper": wrapper,
        "timeout_seconds": timeout_seconds,
        "keep_going": keep_going,
        "head": head,
        "targets": [],
    }
    _write_json(summary_path, summary)
    stop = False
    old_handlers: dict[int, Any] = {}

    def interrupt(_signum: int, _frame: Any) -> None:
        raise KeyboardInterrupt

    signals = [signal.SIGTERM]
    if hasattr(signal, "SIGHUP"):
        signals.append(signal.SIGHUP)
    try:
        for signum in signals:
            old_handlers[signum] = signal.signal(signum, interrupt)
        for index, target in enumerate(targets, start=1):
            if stop:
                log_path = run_root / f"target-{index:03d}.log"
                log_path.write_text("skipped after an earlier target failure\n", encoding="utf-8")
                record = _empty_record(
                    index,
                    target,
                    log_path,
                    _source_evidence(repo_root, lean_root, target),
                    head,
                    [wrapper, f"+{target}:olean"],
                )
                record["status"] = "skipped"
            else:
                record = _run_target(
                    index=index,
                    target=target,
                    wrapper=wrapper,
                    repo_root=repo_root,
                    lean_root=lean_root,
                    run_root=run_root,
                    timeout_seconds=timeout_seconds,
                    grace_seconds=grace_seconds,
                    head=head,
                )
            summary["targets"].append(record)
            _write_json(summary_path, summary)
            if record["status"] != "passed" and (
                not keep_going or record["status"] == "interrupted"
            ):
                stop = True
    except KeyboardInterrupt:
        stop = True
        for index, target in enumerate(targets[len(summary["targets"]) :], start=len(summary["targets"]) + 1):
            log_path = run_root / f"target-{index:03d}.log"
            log_path.write_text("interrupted before target launch\n", encoding="utf-8")
            record = _empty_record(
                index,
                target,
                log_path,
                _source_evidence(repo_root, lean_root, target),
                head,
                [wrapper, f"+{target}:olean"],
            )
            record["status"] = "interrupted"
            summary["targets"].append(record)
            _write_json(summary_path, summary)
    finally:
        for signum, handler in old_handlers.items():
            signal.signal(signum, handler)
    summary["status"] = "passed" if all(item["status"] == "passed" for item in summary["targets"]) else "failed"
    if any(item["status"] == "interrupted" for item in summary["targets"]):
        summary["status"] = "interrupted"
    summary["finished_utc"] = _utc_now()
    _write_json(summary_path, summary)
    return (0 if summary["status"] == "passed" else 1), summary


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--target", action="append", default=[], help="module target; repeatable")
    parser.add_argument("--target-list", type=Path, help="JSON array or object containing a targets array")
    parser.add_argument("--run-root", type=Path, required=True)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    parser.add_argument("--lean-root", type=Path, default=Path("lean"))
    parser.add_argument("--wrapper", default="lake-build")
    parser.add_argument("--timeout-seconds", type=float, default=600.0)
    parser.add_argument("--terminate-grace-seconds", type=float, default=1.0)
    parser.add_argument("--keep-going", action="store_true")
    return parser


def main(argv: list[str] | None = None) -> int:
    parser = _parser()
    args = parser.parse_args(argv)
    try:
        targets = _load_targets(args.target, args.target_list)
        repo_root = args.repo_root.resolve()
        lean_root = (repo_root / args.lean_root).resolve()
        return run_census(
            targets=targets,
            run_root=args.run_root.resolve(),
            repo_root=repo_root,
            lean_root=lean_root,
            wrapper=args.wrapper,
            timeout_seconds=args.timeout_seconds,
            grace_seconds=args.terminate_grace_seconds,
            keep_going=args.keep_going,
        )[0]
    except ValueError as exc:
        parser.error(str(exc))
    return 2


if __name__ == "__main__":
    sys.exit(main())
