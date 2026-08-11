#!/usr/bin/env python3
"""Run the bounded Phase-3 Survivor-CVC5 PIQD index-4 live canary.

This launcher is deliberately narrower than the 48-system wave.  It binds the
authenticated fixture and one selected registry entry, runs one fresh session
through the public adapter API, validates the published leaf immediately, and
only then publishes one canonical outer manifest.  A failed run leaves its
create-once directory and an error sidecar for inspection.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from collections.abc import Mapping
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.p97_search import phase3_piqd_smt_source_adapter as neutral
from census.p97_search import phase3_piqd_survivor_cvc5 as subject
from census.p97_search import phase3_survivor_cvc5_driver as legacy

SCHEMA = "p97-phase3-survivor-cvc5-live-canary/v1"
DEFAULT_SERVER = "http://127.0.0.1:7272"
DEFAULT_OUTPUT = ROOT / "scratch/p97-survivor-cvc5-index04-live-canary-20260810-v1"
INDEX = 4
TIMEOUT_MS = 20_000
HTTP_TIMEOUT_S = 30.0
MAX_VERSION_BYTES = 4 * 1024
MAX_REGISTRY_BYTES = 64 * 1024
MAX_CONTROL_DEPTH = 16
MAX_REGISTRY_ENTRIES = 64
MAX_RESULT_BYTES = 1 << 20
PROOF_BLUEPRINT = {"session": "019fdf9c", "state": "unchanged/open/off-spine"}
CLAIMS = {
    "proof": False,
    "global": False,
    "theorem": False,
    "universal": False,
    "lean": False,
    "euclidean_problem97": False,
}


class CanaryError(RuntimeError):
    """An expected adapter/oracle/launcher contract failure."""


def _canonical(value: object, *, cap: int = MAX_REGISTRY_BYTES) -> bytes:
    try:
        raw = json.dumps(
            value,
            ensure_ascii=False,
            allow_nan=False,
            sort_keys=True,
            separators=(",", ":"),
        ).encode("utf-8")
    except (TypeError, ValueError, UnicodeError) as exc:
        raise CanaryError("control response is not canonical JSON") from exc
    if len(raw) > cap:
        raise CanaryError("bounded JSON exceeds its byte cap")
    return raw


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _digest(value: object) -> str:
    return _sha(_canonical(value))


def _builtin(
    value: object,
    *,
    depth: int = 0,
    max_depth: int = MAX_CONTROL_DEPTH,
    max_list: int = MAX_REGISTRY_ENTRIES,
) -> None:
    if depth > max_depth:
        raise CanaryError("bounded JSON exceeds depth bound")
    if value is None or type(value) in {bool, int, str}:
        return
    if type(value) is list:
        if len(value) > max_list:
            raise CanaryError("bounded JSON exceeds list bound")
        for item in value:
            _builtin(item, depth=depth + 1, max_depth=max_depth, max_list=max_list)
        return
    if type(value) is dict:
        if len(value) > 10_000 or any(type(key) is not str for key in value):
            raise CanaryError("bounded JSON has an invalid object")
        for item in value.values():
            _builtin(item, depth=depth + 1, max_depth=max_depth, max_list=max_list)
        return
    raise CanaryError("control response contains a non-builtin value")


def _control(
    transport: neutral.PiqdTransport,
    path: str,
    label: str,
    *,
    cap: int,
    max_list: int,
    max_depth: int,
) -> object:
    response = transport.request_json("GET", path)
    if type(response) is not neutral.JsonResponse or response.status != 200:
        raise CanaryError(f"{label} request failed")
    _builtin(response.body, max_list=max_list, max_depth=max_depth)
    _canonical(response.body, cap=cap)
    return response.body


def _version(value: object, label: str) -> dict[str, object]:
    if type(value) is not dict or set(value) != {"daemon", "limits"}:
        raise CanaryError(f"{label} has the wrong bounded schema")
    daemon, limits = value["daemon"], value["limits"]
    if (
        type(daemon) is not dict
        or set(daemon) != {"name", "version", "protocol_version", "sha256"}
        or type(limits) is not dict
        or set(limits) != {"max_var"}
        or daemon["name"] != "piqd"
        or daemon["protocol_version"] != 1
        or type(daemon["version"]) is not str
        or not daemon["version"]
        or type(daemon["sha256"]) is not str
        or len(daemon["sha256"]) != 64
        or any(char not in "0123456789abcdef" for char in daemon["sha256"])
        or type(limits["max_var"]) is not int
        or limits["max_var"] != 1_000_000
    ):
        raise CanaryError(f"{label} has the wrong daemon identity")
    return value


def _daemon(
    value: object, label: str, *, sha256_optional: bool = False
) -> dict[str, object]:
    if type(value) is not dict:
        raise CanaryError(f"{label} has the wrong daemon schema")
    required = {"name", "version", "protocol_version"}
    keys = set(value)
    if keys != required and not (sha256_optional and keys == required | {"sha256"}):
        raise CanaryError(f"{label} has the wrong daemon schema")
    if (
        value["name"] != "piqd"
        or type(value["version"]) is not str
        or not value["version"]
        or type(value["protocol_version"]) is not int
        or value["protocol_version"] != 1
        or (
            "sha256" in value
            and (
                type(value["sha256"]) is not str
                or len(value["sha256"]) != 64
                or any(char not in "0123456789abcdef" for char in value["sha256"])
            )
        )
    ):
        raise CanaryError(f"{label} has the wrong daemon identity")
    return value


def _registry(value: object, label: str) -> tuple[dict[str, object], dict[str, object]]:
    if (
        type(value) is not dict
        or set(value) != {"daemon", "solver_dir", "solvers"}
        or type(value["daemon"]) is not dict
        or type(value["solver_dir"]) is not str
        or not value["solver_dir"]
        or not os.path.isabs(value["solver_dir"])
        or type(value["solvers"]) is not list
    ):
        raise CanaryError(f"{label} has the wrong bounded schema")
    _daemon(value["daemon"], f"{label}.daemon", sha256_optional=True)
    entries = value["solvers"]
    candidates: list[dict[str, object]] = []
    exact_keys = {
        "name",
        "lane",
        "solver",
        "solver_signature",
        "solver_version",
        "solver_source",
        "path",
        "worker",
        "worker_version",
        "protocol_version",
        "usable",
        "sha256",
    }
    for entry in entries:
        if type(entry) is not dict or set(entry) != exact_keys:
            raise CanaryError(f"{label} has a non-exact solver entry")
        for key in (
            "name",
            "lane",
            "solver",
            "solver_signature",
            "solver_version",
            "solver_source",
            "path",
            "worker",
            "worker_version",
        ):
            if type(entry[key]) is not str or not entry[key]:
                raise CanaryError(f"{label} has an invalid solver {key}")
        if type(entry["protocol_version"]) is not int or entry["protocol_version"] != 1:
            raise CanaryError(f"{label} has an invalid solver protocol")
        if type(entry["usable"]) is not bool:
            raise CanaryError(f"{label} has an invalid solver usability flag")
        if (
            type(entry["sha256"]) is not str
            or len(entry["sha256"]) != 64
            or any(char not in "0123456789abcdef" for char in entry["sha256"])
        ):
            raise CanaryError(f"{label} has an invalid solver executable identity")
        if entry["name"] == "cvc5":
            candidates.append(entry)
    usable = [
        entry
        for entry in candidates
        if entry.get("lane") == "smt"
        and entry.get("solver") == "cvc5"
        and entry.get("usable") is True
    ]
    if len(usable) != 1:
        raise CanaryError("solver registry does not select one usable cvc5 entry")
    selected = usable[0]
    # Return a canonical builtin copy; no registry fields are dropped.
    return value, dict(selected)


def _bind_registry_daemon(
    registry: dict[str, object], version: dict[str, object], label: str
) -> None:
    registry_daemon = registry["daemon"]
    version_daemon = version["daemon"]
    if type(registry_daemon) is not dict or type(version_daemon) is not dict:
        raise CanaryError(f"{label} daemon identity differs from /version")
    for key in ("name", "version", "protocol_version"):
        if registry_daemon[key] != version_daemon[key]:
            raise CanaryError(f"{label} daemon identity differs from /version")
    if (
        "sha256" in registry_daemon
        and registry_daemon["sha256"] != version_daemon["sha256"]
    ):
        raise CanaryError(f"{label} daemon identity differs from /version")


def _write_once(root_fd: int, name: str, payload: bytes) -> None:
    """Create one immutable root artifact through the held staging FD."""

    if "/" in name or "\\" in name or name in {"", ".", ".."}:
        raise CanaryError("unsafe canary artifact name")
    descriptor: int | None = None
    try:
        for existing in os.listdir(root_fd):
            info = os.stat(existing, dir_fd=root_fd, follow_symlinks=False)
            if not (
                stat.S_ISREG(info.st_mode) and info.st_nlink == 1
            ) and not stat.S_ISDIR(info.st_mode):
                raise CanaryError("canary root contains a hostile entry")
        neutral._fail(
            len(payload) <= neutral.MAX_OUTPUT_BYTES, "canary artifact is too large"
        )
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=root_fd,
        )
        neutral._write_all(descriptor, payload)
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        if (
            not stat.S_ISREG(info.st_mode)
            or info.st_nlink != 1
            or info.st_size != len(payload)
        ):
            raise CanaryError(f"canary artifact custody mismatch: {name}")
        os.fsync(root_fd)
    except FileExistsError as error:
        raise CanaryError(f"canary artifact already exists: {name}") from error
    except OSError as error:
        raise neutral.SmtSourceAdapterError(
            f"cannot create canary artifact: {name}"
        ) from error
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _load_current_fixture() -> tuple[dict[str, object], list[object], object | None]:
    """Use the lane-owned bounded authenticated fixture loader."""

    loaded = subject.load_authenticated_current_source(subject.DEFAULT_SOURCE)
    if not isinstance(loaded, subject.AuthenticatedCurrentSource):
        raise CanaryError("authenticated fixture loader returned the wrong type")
    return loaded.manifest, list(loaded.systems), loaded.token


def _recheck_current_fixture(token: object | None) -> None:
    if token is None:
        return
    subject.recheck_authenticated_current_source(token)


def _error_sidecar(root_fd: int, exc: BaseException) -> None:
    payload = {
        "schema": SCHEMA,
        "status": "error",
        "error_type": type(exc).__name__,
        "error": str(exc)[:500],
        "claims": dict(CLAIMS),
        "proof_blueprint": dict(PROOF_BLUEPRINT),
    }
    try:
        _write_once(root_fd, "error.json", _canonical(payload) + b"\n")
    except (CanaryError, OSError, neutral.SmtSourceAdapterError):
        # The original exception is the useful one; never mask it with sidecar
        # preservation failure.
        pass


def _root_inventory(root_fd: int, expected: set[str], leaf_name: str) -> None:
    """Check an exact descriptor-relative root inventory and custody."""

    actual = set(os.listdir(root_fd))
    if actual != expected:
        raise CanaryError("canary root inventory changed")
    for name in actual:
        info = os.stat(name, dir_fd=root_fd, follow_symlinks=False)
        if name == leaf_name:
            if not stat.S_ISDIR(info.st_mode):
                raise CanaryError("canary leaf is not a directory")
        elif not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise CanaryError(f"canary root artifact custody mismatch: {name}")


def _safe_output_exists(path: Path) -> bool:
    try:
        parent_fd = neutral._open_directory_nofollow(path.parent)
        try:
            os.stat(path.name, dir_fd=parent_fd, follow_symlinks=False)
            return True
        except FileNotFoundError:
            return False
        finally:
            os.close(parent_fd)
    except (OSError, neutral.SmtSourceAdapterError):
        return False


def _publish_root(staging: object, expected: set[str], leaf_name: str) -> None:
    """Atomically install the held staging directory without replacement."""

    neutral._validate_output_parent_identity(staging)
    if neutral._find_staging_entry(staging) != staging.staging_name:
        raise neutral.SmtSourceAdapterError("canary staging identity changed")
    _root_inventory(staging.staging_fd, expected, leaf_name)
    os.fsync(staging.staging_fd)
    neutral._rename_directory_noreplace(
        staging.parent_fd, staging.staging_name, staging.final_name
    )
    staging.installed = True
    os.fsync(staging.parent_fd)
    neutral._validate_output_parent_identity(staging)
    rebound: int | None = None
    try:
        rebound = os.open(
            staging.final_name,
            os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
            dir_fd=staging.parent_fd,
        )
        staged = os.fstat(staging.staging_fd)
        installed = os.fstat(rebound)
        if (staged.st_dev, staged.st_ino) != (installed.st_dev, installed.st_ino):
            raise neutral.SmtSourceAdapterError("published canary identity changed")
        _root_inventory(rebound, expected, leaf_name)
    except OSError as exc:
        raise neutral.SmtSourceAdapterError("cannot validate published canary") from exc
    finally:
        if rebound is not None:
            os.close(rebound)


def run_canary(
    *,
    server: str = DEFAULT_SERVER,
    output_dir: Path = DEFAULT_OUTPUT,
    transport: neutral.PiqdTransport | None = None,
) -> dict[str, object]:
    """Run exactly one authenticated index-4 leaf against PIQD."""
    staging = neutral._reserve_output_staging(output_dir)
    root_path = output_dir.parent / staging.staging_name
    leaf_fd: int | None = None
    keep_staging = True
    try:
        source_manifest, systems, source_token = _load_current_fixture()
        if len(systems) != legacy.EXPECTED_UNIQUE_SYSTEMS:
            raise CanaryError("authenticated source does not contain 48 systems")
        item = systems[INDEX]
        client = transport or neutral.UrllibPiqdTransport(
            server, http_timeout_s=HTTP_TIMEOUT_S
        )

        version_pre = _version(
            _control(
                client,
                "/version",
                "daemon version pre",
                cap=MAX_VERSION_BYTES,
                max_list=2,
                max_depth=4,
            ),
            "version pre",
        )
        registry_pre_raw = _control(
            client,
            "/solvers",
            "solver registry pre",
            cap=MAX_REGISTRY_BYTES,
            max_list=MAX_REGISTRY_ENTRIES,
            max_depth=6,
        )
        registry_pre, selected_pre = _registry(registry_pre_raw, "solver registry pre")
        _bind_registry_daemon(registry_pre, version_pre, "solver registry pre")
        _write_once(
            staging.staging_fd,
            "daemon-version-pre.json",
            _canonical(version_pre) + b"\n",
        )
        _write_once(
            staging.staging_fd,
            "solver-registry-pre.json",
            _canonical(registry_pre) + b"\n",
        )
        _write_once(
            staging.staging_fd,
            "selected-cvc5-pre.json",
            _canonical(selected_pre) + b"\n",
        )

        prepared = subject.prepare_system(
            INDEX, item, source_manifest, timeout_ms=TIMEOUT_MS
        )
        leaf_name = f"{INDEX:02d}-{item.system_id}"
        leaf = root_path / leaf_name
        result = subject.run_prepared_system(
            prepared,
            leaf,
            client,
            used_session_ids=set(),
        )
        validated = subject.validate_prepared_system_output(prepared, leaf)
        if result != validated:
            raise CanaryError("returned leaf result differs from immediate validation")
        leaf_fd = subject._open_lane_child(staging.staging_fd, leaf_name)
        validated_fd = subject._validate_prepared_system_output_fd(prepared, leaf_fd)
        if validated_fd != validated:
            raise CanaryError(
                "descriptor-relative leaf validation differs from public validation"
            )
        result_bytes = neutral._read_relative(
            leaf_fd, "result.json", MAX_RESULT_BYTES, "canary leaf result"
        )
        if result_bytes != _canonical(validated_fd) + b"\n":
            raise CanaryError("published result is not canonical")
        engine = result.get("engine")
        if type(engine) is not dict:
            raise CanaryError("leaf result engine is not an exact object")
        if (
            engine.get("solver") != "cvc5"
            or engine.get("solver_sha256") != selected_pre["sha256"]
            or engine.get("solver_signature") != selected_pre["solver_signature"]
        ):
            raise CanaryError(
                "leaf engine identity differs from selected registry entry"
            )

        version_post = _version(
            _control(
                client,
                "/version",
                "daemon version post",
                cap=MAX_VERSION_BYTES,
                max_list=2,
                max_depth=4,
            ),
            "version post",
        )
        registry_post_raw = _control(
            client,
            "/solvers",
            "solver registry post",
            cap=MAX_REGISTRY_BYTES,
            max_list=MAX_REGISTRY_ENTRIES,
            max_depth=6,
        )
        registry_post, selected_post = _registry(
            registry_post_raw, "solver registry post"
        )
        if version_pre["daemon"] != version_post["daemon"]:
            raise CanaryError(
                "pre/post daemon version identity differs (process replaced)"
            )
        _bind_registry_daemon(registry_post, version_post, "solver registry post")
        _write_once(
            staging.staging_fd,
            "daemon-version-post.json",
            _canonical(version_post) + b"\n",
        )
        _write_once(
            staging.staging_fd,
            "solver-registry-post.json",
            _canonical(registry_post) + b"\n",
        )
        _write_once(
            staging.staging_fd,
            "selected-cvc5-post.json",
            _canonical(selected_post) + b"\n",
        )
        if _canonical(version_pre) != _canonical(version_post):
            raise CanaryError(
                "pre/post daemon version identity differs (process replaced)"
            )
        if registry_pre["daemon"] != registry_post["daemon"]:
            raise CanaryError("pre/post registry daemon differs (process replaced)")
        if registry_pre["solver_dir"] != registry_post["solver_dir"]:
            raise CanaryError(
                "pre/post solver_dir differs (daemon data-dir/config changed)"
            )
        if registry_pre["solvers"] != registry_post["solvers"]:
            raise CanaryError(
                "pre/post solvers array differs (registration/worker state changed)"
            )
        if _canonical(registry_pre) != _canonical(registry_post):
            raise CanaryError("pre/post canonical solver-registry identity differs")
        if _canonical(selected_pre) != _canonical(selected_post):
            raise CanaryError("pre/post selected CVC5 identity differs")
        result_bytes_after = neutral._read_relative(
            leaf_fd, "result.json", MAX_RESULT_BYTES, "canary leaf result post"
        )
        if result_bytes_after != result_bytes:
            raise CanaryError("leaf result changed after immediate validation")
        _recheck_current_fixture(source_token)
        prepared_hashes = {
            "source_record_sha256": result["source_record_sha256"],
            "descriptor_sha256": result["descriptor_sha256"],
            "original_smt2_sha256": result["original_smt2_sha256"],
            "journal_smt2_sha256": result["journal_smt2_sha256"],
        }
        outer = {
            "schema": SCHEMA,
            "server": server,
            "index": INDEX,
            "system_id": item.system_id,
            "profile": {
                "timeout_ms": TIMEOUT_MS,
                "workers": 1,
                "fresh_session": True,
                "solve_count": 1,
            },
            "source": {
                "manifest_sha256": source_manifest["manifest_sha256"],
                "manifest_canonical_sha256": _digest(source_manifest),
            },
            "prepared": prepared_hashes,
            "engine": {
                "sha256": _digest(engine),
                "solver": engine["solver"],
                "solver_sha256": engine["solver_sha256"],
                "solver_signature": engine["solver_signature"],
                "session_id": engine.get("session_id"),
                "raw_status": result.get("raw_status"),
                "effective_status": result.get("effective_status"),
            },
            "result": {
                "path": f"{INDEX:02d}-{item.system_id}/result.json",
                "sha256": _sha(result_bytes),
                "canonical_sha256": _digest(result),
            },
            "identities": {
                "version_pre_sha256": _digest(version_pre),
                "version_post_sha256": _digest(version_post),
                "registry_pre_sha256": _digest(registry_pre),
                "registry_post_sha256": _digest(registry_post),
                "selected_cvc5_sha256": _digest(selected_pre),
            },
            "claims": dict(CLAIMS),
            "proof_blueprint": dict(PROOF_BLUEPRINT),
        }
        manifest = {**outer, "manifest_sha256": _digest(outer)}
        _write_once(staging.staging_fd, "manifest.json", _canonical(manifest) + b"\n")
        _root_inventory(
            staging.staging_fd,
            {
                "daemon-version-pre.json",
                "solver-registry-pre.json",
                "selected-cvc5-pre.json",
                "daemon-version-post.json",
                "solver-registry-post.json",
                "selected-cvc5-post.json",
                "manifest.json",
                leaf_name,
            },
            leaf_name,
        )
        _publish_root(
            staging,
            {
                "daemon-version-pre.json",
                "solver-registry-pre.json",
                "selected-cvc5-pre.json",
                "daemon-version-post.json",
                "solver-registry-post.json",
                "selected-cvc5-post.json",
                "manifest.json",
                leaf_name,
            },
            leaf_name,
        )
        return manifest
    except (
        CanaryError,
        neutral.SmtSourceAdapterError,
        legacy.Phase3Cvc5Error,
        subject.Phase3PiqdCvc5Error,
    ) as exc:
        _error_sidecar(staging.staging_fd, exc)
        raise
    finally:
        if leaf_fd is not None:
            os.close(leaf_fd)
        neutral._close_output_staging(staging, keep=keep_staging)


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--server", default=DEFAULT_SERVER)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    return parser


def _emit(value: Mapping[str, object]) -> None:
    sys.stdout.buffer.write(_canonical(value) + b"\n")


def main(argv: list[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        _emit(run_canary(server=args.server, output_dir=args.output_dir))
        return 0
    except (
        CanaryError,
        neutral.SmtSourceAdapterError,
        legacy.Phase3Cvc5Error,
        subject.Phase3PiqdCvc5Error,
    ) as exc:
        _emit(
            {
                "schema": SCHEMA,
                "status": "error",
                "error_type": type(exc).__name__,
                "error": str(exc)[:500],
                "output_dir": str(args.output_dir),
                "artifacts_preserved": _safe_output_exists(args.output_dir),
            }
        )
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
