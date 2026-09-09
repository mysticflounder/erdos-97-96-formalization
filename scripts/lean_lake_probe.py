"""Run a generated Lean probe through the governed lake-build wrapper.

The helper creates a tiny Lake package below a caller-registered run directory.
It reuses the current project's pinned dependency manifest and compiled package
through a path dependency, while retaining the probe package and combined build
log as evidence.  No direct ``lean`` or ``lake`` invocation is allowed.
"""

from __future__ import annotations

import json
import os
import re
import signal
import subprocess
import tomllib
import uuid
from dataclasses import dataclass
from pathlib import Path

from check_migration_targets import _kill_group

LAKE_BUILD_WRAPPER = "/Users/adam/.local/bin/lake-build"
PROBE_PACKAGE = "Probe"
LEAN_SEVERITIES = frozenset({"error", "warning", "information", "info"})


class ProbeError(RuntimeError):
    """The governed probe could not be prepared or completed."""


@dataclass(frozen=True)
class ProbeResult:
    """The isolated probe output and its pinned/observed toolchain identity."""

    output: str
    probe_path: str
    toolchain: str
    compiler_version: str
    log_path: str


def normalize_probe_message(line: str, probe_path: str) -> tuple[str, str] | None:
    """Decode a positioned Lake message emitted for this exact probe file.

    Lake 4.33 commonly prints ``info: Probe.lean:line:column: payload``;
    older output also used ``/absolute/Probe.lean:line:column: info: payload``.
    The filename is deliberately matched exactly (absolute path or basename)
    so diagnostics from dependencies cannot be silently consumed.
    """

    names = (str(Path(probe_path)), Path(probe_path).name)
    for name in names:
        for severity in LEAN_SEVERITIES:
            prefix = f"{severity}: {name}:"
            if not line.startswith(prefix):
                continue
            fields = line[len(prefix) :].split(":", 2)
            if len(fields) == 3 and fields[0].isdigit() and fields[1].isdigit():
                return severity, fields[2].lstrip()
        prefix = f"{name}:"
        if not line.startswith(prefix):
            continue
        fields = line[len(prefix) :].split(":", 3)
        if (
            len(fields) == 4
            and fields[0].isdigit()
            and fields[1].isdigit()
            and fields[2].strip() in LEAN_SEVERITIES
        ):
            return fields[2].strip(), fields[3].lstrip()
    return None


def _repo_path(repo_root: Path, raw: Path | str) -> Path:
    path = Path(raw)
    return path if path.is_absolute() else repo_root / path


def _read_toolchain(lake_dir: Path) -> str:
    path = lake_dir / "lean-toolchain"
    try:
        value = path.read_text(encoding="utf-8").strip()
    except OSError as exc:
        raise ProbeError(f"missing pinned lean-toolchain: {path}") from exc
    if not value:
        raise ProbeError(f"empty pinned lean-toolchain: {path}")
    return value


def _manifest_for_probe(lake_dir: Path, package_dir: Path, package_name: str) -> dict[str, object]:
    source = lake_dir / "lake-manifest.json"
    try:
        manifest = json.loads(source.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise ProbeError(f"cannot read pinned Lake manifest: {source}") from exc
    if not isinstance(manifest, dict) or not isinstance(manifest.get("packages"), list):
        raise ProbeError(f"malformed pinned Lake manifest: {source}")

    relative_lake = os.path.relpath(lake_dir, package_dir).replace(os.sep, "/")
    path_entry: dict[str, object] = {
        "name": package_name,
        "scope": "",
        "configFile": "lakefile.toml",
        "manifestFile": "lake-manifest.json",
        "inherited": False,
        "type": "path",
        "dir": relative_lake,
    }
    packages = [entry for entry in manifest["packages"] if entry.get("name") != package_name]
    manifest = dict(manifest)
    manifest["name"] = PROBE_PACKAGE
    manifest["lakeDir"] = ".lake"
    manifest["packagesDir"] = ".lake/packages"
    manifest["packages"] = [path_entry, *packages]
    return manifest


def _instrument(source: str, begin: str, version: str, end: str) -> str:
    """Place executable markers after imports and around the probe body."""

    lines = source.splitlines()
    insertion = 0
    while insertion < len(lines) and (
        not lines[insertion].strip() or lines[insertion].lstrip().startswith("import ")
    ):
        insertion += 1
    lines[insertion:insertion] = [
        f'#eval IO.println "{begin}"',
        f'#eval IO.println s!"{version}{{Lean.versionString}}"',
    ]
    lines.append(f'#eval IO.println "{end}"')
    return "\n".join(lines) + "\n"


def _extract_marked_output(output: str, begin: str, version: str, end: str) -> tuple[str, str]:
    """Extract exactly one marked payload and one compiler-version marker."""

    if output.count(begin) != 1 or output.count(end) != 1 or output.count(version) != 1:
        raise ProbeError("wrapper output must contain exactly one begin, version, and end marker")
    start = output.index(begin)
    version_pos = output.index(version)
    finish = output.index(end)
    if not start < version_pos < finish:
        raise ProbeError("wrapper probe markers are out of order")
    compiler_version = output[version_pos + len(version) :].splitlines()[0].strip()
    if not compiler_version:
        raise ProbeError("compiler version marker was empty")
    payload = output[start + len(begin) : finish]
    # Only the marker's own line is metadata. A Lake ``info:`` prefix is the
    # sole tolerated decoration; all other payload text is retained.
    kept: list[str] = []
    for line in payload.splitlines():
        if version in line:
            prefix, _marker, suffix = line.partition(version)
            normalized_prefix = prefix.strip()
            if normalized_prefix and not re.fullmatch(
                r"info:\s+.+:\d+:\d+:", normalized_prefix
            ):
                raise ProbeError("compiler version marker had an unexpected prefix")
            if not suffix.strip():
                raise ProbeError("compiler version marker had no version suffix")
            continue
        kept.append(line)
    return "\n".join(kept).strip("\r\n"), compiler_version


def _text_output(value: str | bytes | None) -> str:
    if value is None:
        return ""
    if isinstance(value, bytes):
        return value.decode("utf-8", errors="replace")
    return value


def _write_log(path: Path, output: str, outcome: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(output + ("" if output.endswith("\n") else "\n") + outcome + "\n", encoding="utf-8")


def run_probe(
    *,
    repo_root: Path | str,
    lake_root: Path | str,
    source: str,
    run_root: Path | str | None,
    timeout: int,
) -> ProbeResult:
    """Run ``source`` via the absolute lake-build wrapper and retain evidence."""

    root = Path(repo_root).resolve()
    lake_dir = _repo_path(root, lake_root).resolve()
    if not lake_dir.is_dir():
        raise ProbeError(f"Lake root is not a directory: {lake_dir}")
    if run_root is None:
        raise ProbeError("probe_run_root is required and must be a registered run directory")
    run_dir = _repo_path(root, run_root).resolve()
    if not run_dir.is_dir() or not (run_dir / "run_manifest.json").is_file():
        raise ProbeError(f"probe run root is not a registered run directory: {run_dir}")
    if not source.strip():
        raise ProbeError("probe source is empty")
    if timeout <= 0:
        raise ProbeError("probe timeout must be positive")

    toolchain = _read_toolchain(lake_dir)
    try:
        package_config = tomllib.loads((lake_dir / "lakefile.toml").read_text(encoding="utf-8"))
        package_name = str(package_config["name"])
    except (OSError, KeyError, TypeError, tomllib.TOMLDecodeError) as exc:
        raise ProbeError(f"cannot read Lake package name from {lake_dir / 'lakefile.toml'}") from exc

    tmp_root = run_dir / "tmp"
    artifact_root = run_dir / "artifacts"
    tmp_root.mkdir(parents=True, exist_ok=True)
    artifact_root.mkdir(parents=True, exist_ok=True)
    marker_id = uuid.uuid4().hex
    begin = f"__LEAN_LAKE_PROBE_BEGIN_{marker_id}__"
    version_marker = f"__LEAN_LAKE_PROBE_COMPILER_VERSION_{marker_id}__"
    end = f"__LEAN_LAKE_PROBE_END_{marker_id}__"
    package_dir = tmp_root / f"probe-{marker_id}"
    package_dir.mkdir()
    log_path = artifact_root / f"probe-{marker_id}.log"
    source_path = package_dir / "Probe.lean"
    (package_dir / ".lake").mkdir(parents=True)
    source_path.write_text(_instrument(source, begin, version_marker, end), encoding="utf-8")
    (package_dir / "lean-toolchain").write_text(
        (lake_dir / "lean-toolchain").read_text(encoding="utf-8"), encoding="utf-8"
    )
    (package_dir / "lakefile.toml").write_text(
        "name = \"Probe\"\nversion = \"0.1.0\"\npackagesDir = \".lake/packages\"\n\n"
        f"[[require]]\nname = {json.dumps(package_name)}\npath = {json.dumps(os.path.relpath(lake_dir, package_dir).replace(os.sep, '/'))}\n\n"
        "[[lean_lib]]\nname = \"Probe\"\n",
        encoding="utf-8",
    )
    (package_dir / "lake-manifest.json").write_text(
        json.dumps(_manifest_for_probe(lake_dir, package_dir, package_name), indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    (package_dir / ".lake" / "packages").symlink_to(
        lake_dir / ".lake" / "packages", target_is_directory=True
    )

    env = os.environ.copy()
    env.update(
        {
            "LEAN_ROOT": str(package_dir),
            "LOCKFILE": str(lake_dir / ".lake" / "lake-build.lock"),
            "LAKE_BUILD_NO_REFRESH": "1",
            "LAKE_BUILD_NO_MODULE_STATS": "1",
        }
    )
    command = [LAKE_BUILD_WRAPPER, "+Probe:olean"]
    process: subprocess.Popen[str] | None = None
    output = ""
    previous_handlers: dict[signal.Signals, object] = {}

    def interrupted(signum: int, _frame: object) -> None:
        if process is not None:
            _kill_group(process, grace_seconds=5.0)
        raise KeyboardInterrupt(f"probe interrupted by signal {signum}")

    try:
        for signum in (signal.SIGINT, signal.SIGTERM, signal.SIGHUP):
            previous_handlers[signum] = signal.getsignal(signum)
            signal.signal(signum, interrupted)
        process = subprocess.Popen(
            command,
            cwd=package_dir,
            env=env,
            stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT,
            text=True,
            start_new_session=True,
        )
        try:
            output, _ = process.communicate(timeout=timeout)
            output = _text_output(output)
        except subprocess.TimeoutExpired as exc:
            _kill_group(process, grace_seconds=5.0)
            tail, _ = process.communicate()
            output = _text_output(exc.stdout) + _text_output(tail)
            _write_log(log_path, output, "PROBE-TIMEOUT=1")
            raise ProbeError(f"governed probe timed out after {timeout}s; evidence: {log_path}") from exc
    except KeyboardInterrupt as exc:
        if process is not None:
            _kill_group(process, grace_seconds=5.0)
            output, _ = process.communicate()
            output = _text_output(output)
        _write_log(log_path, output, "PROBE-INTERRUPTED=1")
        raise ProbeError(f"governed probe interrupted; evidence: {log_path}") from exc
    except (OSError, subprocess.SubprocessError) as exc:
        _write_log(log_path, output, "PROBE-START-FAILED=1")
        raise ProbeError(f"governed probe failed to start; evidence: {log_path}") from exc
    finally:
        if process is not None and process.poll() is None:
            _kill_group(process, grace_seconds=5.0)
        for signum, handler in previous_handlers.items():
            signal.signal(signum, handler)

    assert process is not None
    if process.returncode != 0:
        _kill_group(process, grace_seconds=5.0)
    _write_log(log_path, output, f"PROBE-EXIT={process.returncode}")
    try:
        marked, compiler_version = _extract_marked_output(output, begin, version_marker, end)
    except ProbeError as exc:
        raise ProbeError(f"{exc}; evidence: {log_path}") from exc
    if process.returncode != 0:
        raise ProbeError(f"governed probe exited {process.returncode}; evidence: {log_path}\n{marked}")
    return ProbeResult(marked, str(source_path), toolchain, compiler_version, str(log_path))
