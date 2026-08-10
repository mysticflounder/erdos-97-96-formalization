"""Strict PIQD SMT-session adapter for approved frozen FreshThird U3 waves.

This module only reruns a finite diagnostic packet.  It deliberately makes no
claim about a Lean theorem, source entitlement, universal closure, or CPU
attestation.  Every solver run gets a fresh SMT session and its own exported
journal and solve receipt.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import os
import stat
import urllib.error
import urllib.parse
import urllib.request
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path, PurePosixPath
from typing import Any, Protocol

from census.p97_search.phase3_piqd_statement_bank_runner import (
    JsonHttpResponse,
    JsonHttpTransport,
    UrllibJsonTransport,
)

SCHEMA = "p97-piqd-freshthird-smt-session/v1"
STATUS = "FINITE_DIAGNOSTIC_ONLY"
SOLVERS = ("z3", "cvc5")
TIMEOUT_MS = 20_000
MAX_INPUT_BYTES = 16 * 1024 * 1024
MAX_EXPORT_BYTES = 16 * 1024 * 1024
MAX_OUTPUT_BYTES = 32 * 1024 * 1024
MAX_JSON_DEPTH = 32
MAX_JSON_NODES = 100_000
MAX_SEXPR_DEPTH = 256
MAX_SEXPR_NODES = 250_000
MAX_SEXPR_TOKENS = 500_000
MAX_REPLAY_TOTAL_BYTES = 128 * 1024 * 1024
PIQD_RESULT_DIGEST_VERSION = b"piqd-smt-solve-result/v1"
REPO_ROOT = Path(__file__).resolve().parents[2]
PREDECESSOR_FROZEN_ROOT = (
    REPO_ROOT / "scratch/p97-consumer-first/"
    "freshthird_u3_simultaneous_sixcenter_20260809"
)
SUCCESSOR_FROZEN_ROOT = (
    REPO_ROOT / "scratch/p97-consumer-first/"
    "freshthird_u3_simultaneous_shell_distribution_20260809"
)
NONVACUOUS_SUCCESSOR_FROZEN_ROOT = (
    REPO_ROOT / "scratch/p97-consumer-first/"
    "freshthird_u3_simultaneous_shell_distribution_smoke_defined_20260809"
)
DEFAULT_FROZEN_ROOT = NONVACUOUS_SUCCESSOR_FROZEN_ROOT
FROZEN_MANIFEST_SHA256 = (
    "b2a239e1141e15dc61e9c9f465ea37271e103a3b065fd9de597e44b6388ff64b"
)
FROZEN_CASE_MATRIX_SHA256 = (
    "dd3ac9d122b66ab4529a7ef06c4325d7b93c32d2a0aea0eb2f4aca73bfa4f094"
)
FROZEN_CROSSSOLVER_SHA256 = (
    "dbb755c4a1b51a13c94227e955eb78383ba94d4c774b51fccf134c297e0c4274"
)
FROZEN_FINITE_NOGOODS_SHA256 = (
    "ddd5531a2648f4b0dfd4fccbe06c4880504e827aaa212178b50ba88b041487a4"
)
SOURCE_HASHES = {
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean": "e042b39be74713b10e9ad4d771a157bb70f77152f9a7f6db20fdf049d32afa2d",
    "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean": "015941fc0b69014bd90a101d3f0b68e5fec4ec8e8b9c0e62b1e0b83c0f05851a",
    "lean/Erdos9796Proof/P97/U1CarrierInjection.lean": "b70abb2f7972307370212ddf167873f70fb8ef4eb9c27297a79ce7d71f8699d9",
    "lean/Erdos9796Proof/P97/U3ToU5Terminal.lean": "5370b7701d89f2c911433b3926c9f9de048a58718dead9031dcf8cf99cd257cd",
    "lean/Erdos9796Proof/P97/U5FiniteAudit.lean": "5822179d3975c8673f9cb1fd8aeb316f4cbc357cb15d03c2588d064ed2344f2f",
    "lean/Erdos9796Proof/P97/U5FiniteExtraction.lean": "d93c588ba9d1e8305d34c3f940c1cd261aabf0e09027c180da9de420610d5c3e",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean": "5e020505827935c99552c13ee10c89ab499804ed226c68700f4f65415995aca4",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean": "2ae36d7dc5cca45cd0f1bd11791ff1f529594cb4968b143c3e2b89dd681ec14e",
}

_CASE_ROWS = (
    (
        "smoke_sat",
        "control",
        "sat",
        None,
        "f39a8096210052acfcad12643f59b10af8eca27e5aeb453f6c3ba0b392046853",
    ),
    (
        "smoke_unsat",
        "control",
        "unsat",
        None,
        "25e31cf76a8cb2ee3babe951831001f316c48c1cb7f21a9b4c8e342c3aac825a",
    ),
    (
        "confined_structural",
        "all-confined",
        "sat",
        None,
        "df2c94707189fdbec38f2af81b6b2e8e01d264757db4e090ef2e568c09335a2a",
    ),
    (
        "confined_all_prefilters",
        "all-confined",
        "unsat",
        None,
        "03621e36c230c821f1b18b27858c734f67cded98cbf7dc8f037a6cda3d0c3623",
    ),
    (
        "confined_drop_unitTriangleOnPCircle",
        "leave-one-prefilter-out",
        "diagnostic",
        "unitTriangleOnPCircle",
        "3a0c2af2016050f9818ab39bf2bcf372f79b561ca5a3e2d738cc6a632d2100ad",
    ),
    (
        "confined_drop_nontripleEquilateralOnPCircle",
        "leave-one-prefilter-out",
        "diagnostic",
        "nontripleEquilateralOnPCircle",
        "ee5d6d010f826be334431bef8347faa6e1ddb43f98486599c86e678e1a8ad7ea",
    ),
    (
        "confined_drop_equilateralOppositePoint",
        "leave-one-prefilter-out",
        "diagnostic",
        "equilateralOppositePoint",
        "03621e36c230c821f1b18b27858c734f67cded98cbf7dc8f037a6cda3d0c3623",
    ),
    (
        "confined_drop_equilateralBisector",
        "leave-one-prefilter-out",
        "diagnostic",
        "equilateralBisector",
        "652e79c0b1231f8903b042380155e465aaa3de6d3118c0c4b27796893a5c5731",
    ),
    (
        "confined_drop_commonBisectorTriple",
        "leave-one-prefilter-out",
        "diagnostic",
        "commonBisectorTriple",
        "03621e36c230c821f1b18b27858c734f67cded98cbf7dc8f037a6cda3d0c3623",
    ),
    (
        "confined_drop_equilateralCircumcenterOnPCircle",
        "leave-one-prefilter-out",
        "diagnostic",
        "equilateralCircumcenterOnPCircle",
        "28f8c553084836f1cf6130719003b820ecea46b4a0ccb340c1e63220a2d1a4d4",
    ),
    (
        "confined_drop_equilateralOuterPoint",
        "leave-one-prefilter-out",
        "diagnostic",
        "equilateralOuterPoint",
        "395ee97270ba93edc8c3ffd6e4fd46fe5023b9fc96d69771ae6b59c54a281faf",
    ),
    (
        "live_escape_or_shell",
        "live-abstraction",
        "sat",
        None,
        "39427dc6719921c768bd59b9410e7e0320a1af02e2e8f892aa1184b7001a7d67",
    ),
)
CASE_NAMES = tuple(row[0] for row in _CASE_ROWS)
CASE_HASHES = {row[0]: row[4] for row in _CASE_ROWS}
_CASE_EXPECTED = tuple(
    {
        "case": name,
        "family": family,
        "expected_control_or_probe": expected,
        "omitted_reason": omitted,
        "smt_sha256": digest,
    }
    for name, family, expected, omitted, digest in _CASE_ROWS
)


@dataclass(frozen=True)
class WaveProfile:
    namespace: str
    manifest_sha256: str
    case_matrix_sha256: str
    crosssolver_sha256: str
    finite_nogoods_sha256: str
    schema_sha256: str
    source_hashes: Mapping[str, str]
    case_matrix: tuple[Mapping[str, object], ...]
    shell_distribution: bool


SUCCESSOR_SOURCE_HASHES = {
    **SOURCE_HASHES,
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean": "60ca5be5a4149c2994c864621cf3d164550e58d3fc1dcb2994e1957ecf0131b5",
    "lean/Erdos9796Proof/P97/U3ToU5Terminal.lean": "06b9134b1a335b44a6f6df1321d06748fa1e5456c3d3482e5975f8a223014473",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean": "3689a01a133c9b375bc37638a6cd9599089e62a1fb61d985d4b77a721c0ac508",
}
_SUCCESSOR_CASE_EXPECTED = tuple(
    {
        **row,
        "smt_sha256": (
            "b8e37af9aabd1b1bee5d6c03e3c92879916231d013462f99aad6765050a03d04"
            if row["case"] == "live_escape_or_shell"
            else row["smt_sha256"]
        ),
    }
    for row in _CASE_EXPECTED
)
PREDECESSOR_PROFILE = WaveProfile(
    namespace="freshthird_u3_simultaneous_sixcenter_20260809",
    manifest_sha256=FROZEN_MANIFEST_SHA256,
    case_matrix_sha256=FROZEN_CASE_MATRIX_SHA256,
    crosssolver_sha256=FROZEN_CROSSSOLVER_SHA256,
    finite_nogoods_sha256=FROZEN_FINITE_NOGOODS_SHA256,
    schema_sha256="270132a3756651e745957683ed97bc823435a803f52057cdcee418db904bae98",
    source_hashes=SOURCE_HASHES,
    case_matrix=_CASE_EXPECTED,
    shell_distribution=False,
)
SUCCESSOR_PROFILE = WaveProfile(
    namespace="freshthird_u3_simultaneous_shell_distribution_20260809",
    manifest_sha256="59f927a4cd1b3199c6eb470a2d87b543b78af7cc336692f8e8a3e70b819aac4f",
    case_matrix_sha256="0506a630df4c7339c5596d708da2d72a4553885ac8988c5b3975cf2a8dcfdda0",
    crosssolver_sha256="1f3e02aa012f5c4ea5db963bfa58a3aa3b1c5502c9ff22b14f518d874e6f7f7b",
    finite_nogoods_sha256=FROZEN_FINITE_NOGOODS_SHA256,
    schema_sha256="b2eb6b3172b77d6cedf4108f510180a24d200c174efcccf62e7ca0492aaa7c47",
    source_hashes=SUCCESSOR_SOURCE_HASHES,
    case_matrix=_SUCCESSOR_CASE_EXPECTED,
    shell_distribution=True,
)
NONVACUOUS_SUCCESSOR_SOURCE_HASHES = {
    **SUCCESSOR_SOURCE_HASHES,
    "lean/Erdos9796Proof/P97/U3ToU5Terminal.lean": "6f0968585fc2e6d7a17eaf36638cc928c2d210a748649bba3f7063185046eaef",
    "lean/Erdos9796Proof/P97/U5GlobalIncidenceSupport.lean": "6355e9e672bbcef5ef5b8d41d8492f89b924c9c27cb4d6f0c05569a81d430dca",
}
_NONVACUOUS_SUCCESSOR_CASE_EXPECTED = tuple(
    {
        **row,
        "smt_sha256": (
            "f2f7c4edddc206a87175bee8acbd1a3360df9d519723d1b3b29895d0efcfef69"
            if row["case"] == "smoke_sat"
            else row["smt_sha256"]
        ),
    }
    for row in _SUCCESSOR_CASE_EXPECTED
)
NONVACUOUS_SUCCESSOR_PROFILE = WaveProfile(
    namespace="freshthird_u3_simultaneous_shell_distribution_smoke_defined_20260809",
    manifest_sha256="db86d68a8a1a876d12c7768e249fa372f189713336dcccecfc5020ba095422e3",
    case_matrix_sha256="b5228045a708a1cfe2260344df3c6e6d5d8647d8156918c6e9caf5680d1d0195",
    crosssolver_sha256="9b0ea3439a7bd680aa6d83d0dcfedefde527ad9ad4cff2248137ea4e89ea8f5a",
    finite_nogoods_sha256=FROZEN_FINITE_NOGOODS_SHA256,
    schema_sha256="a62fdc715804101428c69bbf2c19b249e927d0fbfa0e877d56c8d03c626ab199",
    source_hashes=NONVACUOUS_SUCCESSOR_SOURCE_HASHES,
    case_matrix=_NONVACUOUS_SUCCESSOR_CASE_EXPECTED,
    shell_distribution=True,
)
WAVE_PROFILES = {
    profile.manifest_sha256: profile
    for profile in (
        PREDECESSOR_PROFILE,
        SUCCESSOR_PROFILE,
        NONVACUOUS_SUCCESSOR_PROFILE,
    )
}
FALSE_CLAIMS = {
    "theorem_proved": False,
    "source_entitlement": False,
    "universal_closure": False,
    "lean_closure": False,
    "cpu_attestation": False,
    "solver_attestation": False,
    "daemon_attestation": False,
    "euclidean_realization": False,
}


class FreshThirdSmtSessionError(RuntimeError):
    """The strict finite-diagnostic adapter failed closed."""


class _PiqdJsonTransportLoss(FreshThirdSmtSessionError):
    """A PIQD JSON request produced no inspectable response."""


@dataclass(frozen=True)
class DownloadResponse:
    status: int
    byte_count: int
    sha256: str


class DescriptorDownloadTransport(Protocol):
    def download(
        self, method: str, path: str, destination_fd: int, *, byte_cap: int
    ) -> DownloadResponse: ...


class _NoRedirect(urllib.request.HTTPRedirectHandler):
    def redirect_request(self, req, fp, code, msg, headers, newurl):
        return None


class UrllibDescriptorDownloadTransport:
    """Stream an HTTP artifact to an already authenticated fresh descriptor."""

    def __init__(
        self, base_url: str = "http://127.0.0.1:7272", *, timeout_s: float = 55.0
    ) -> None:
        parsed = urllib.parse.urlsplit(base_url)
        if (
            parsed.scheme not in {"http", "https"}
            or not parsed.netloc
            or parsed.username is not None
            or parsed.password is not None
            or parsed.query
            or parsed.fragment
            or parsed.path not in {"", "/"}
        ):
            raise FreshThirdSmtSessionError("base_url must be a bare HTTP(S) origin")
        if (
            type(timeout_s) is not float
            or not math.isfinite(timeout_s)
            or timeout_s <= 50.0
        ):
            raise FreshThirdSmtSessionError("download timeout must exceed 50 seconds")
        self._base_url = base_url.rstrip("/")
        self._timeout_s = timeout_s
        self._opener = urllib.request.build_opener(_NoRedirect())

    def download(
        self, method: str, path: str, destination_fd: int, *, byte_cap: int
    ) -> DownloadResponse:
        if (
            method != "GET"
            or not path.startswith("/")
            or type(byte_cap) is not int
            or byte_cap <= 0
        ):
            raise FreshThirdSmtSessionError("invalid internal artifact request")
        request = urllib.request.Request(
            self._base_url + path,
            method="GET",
            headers={"Accept": "application/smt2,text/plain"},
        )
        digest = hashlib.sha256()
        count = 0
        try:
            response = self._opener.open(request, timeout=self._timeout_s)
            try:
                status_code = response.status
                while True:
                    chunk = response.read(min(1024 * 1024, byte_cap - count + 1))
                    if not chunk:
                        break
                    count += len(chunk)
                    if count > byte_cap:
                        raise FreshThirdSmtSessionError(
                            "PIQD artifact exceeds byte cap"
                        )
                    _write_all(destination_fd, chunk)
                    digest.update(chunk)
            finally:
                response.close()
        except urllib.error.HTTPError as exc:
            raise FreshThirdSmtSessionError(
                f"PIQD artifact HTTP status {exc.code}"
            ) from exc
        except urllib.error.URLError as exc:
            raise FreshThirdSmtSessionError("PIQD artifact transport failed") from exc
        return DownloadResponse(status_code, count, digest.hexdigest())


@dataclass(frozen=True)
class FreshThirdRunResult:
    output_dir: Path
    receipt: Mapping[str, Any]


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


def _fail(condition: bool, message: str) -> None:
    if not condition:
        raise FreshThirdSmtSessionError(message)


def _write_all(descriptor: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(descriptor, view)
        if written <= 0:
            raise FreshThirdSmtSessionError("short artifact write")
        view = view[written:]


def _open_directory_nofollow(path: Path) -> int:
    """Open every path component as a real directory, never following links."""

    absolute = path.absolute()
    descriptor = os.open("/", os.O_RDONLY | os.O_DIRECTORY)
    try:
        for component in absolute.parts[1:]:
            if component in {"", "."}:
                continue
            _fail(component != "..", "parent traversal is forbidden")
            next_fd = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=descriptor,
            )
            os.close(descriptor)
            descriptor = next_fd
        return descriptor
    except Exception:
        os.close(descriptor)
        raise


def _open_piqd_data_root(path: Path) -> tuple[str, int]:
    """Authenticate an explicitly configured canonical absolute PIQD root."""

    _fail(isinstance(path, Path), "invalid PIQD data root type")
    raw = os.fspath(path)
    _fail(type(raw) is str and "\x00" not in raw, "invalid PIQD data root type")
    pure = PurePosixPath(raw)
    _fail(
        pure.is_absolute()
        and pure != PurePosixPath("/")
        and str(pure) == raw
        and "//" not in raw
        and all(part not in {"", ".", ".."} for part in pure.parts[1:]),
        "PIQD data root must be a canonical absolute path",
    )
    try:
        return raw, _open_directory_nofollow(path)
    except FreshThirdSmtSessionError:
        raise
    except OSError as exc:
        raise FreshThirdSmtSessionError("cannot authenticate PIQD data root") from exc


def _authenticate_piqd_file(
    value: object,
    *,
    data_root: str,
    data_root_fd: int,
    session_id: str,
    basename: str,
    where: str,
) -> str:
    """Bind a daemon path to one exact session file through authenticated FDs."""

    path = _string(value, where)
    _fail("\x00" not in path, f"{where} contains NUL")
    pure = PurePosixPath(path)
    _fail(
        pure.is_absolute()
        and str(pure) == path
        and "//" not in path
        and all(part not in {"", ".", ".."} for part in pure.parts[1:]),
        f"{where} is not a canonical absolute path",
    )
    expected = PurePosixPath(data_root) / "sessions" / session_id / basename
    _fail(pure == expected, f"{where} does not match the authenticated session path")
    directory_fd = os.dup(data_root_fd)
    descriptor: int | None = None
    try:
        for component in ("sessions", session_id):
            next_fd = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        descriptor = os.open(basename, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd)
        info = os.fstat(descriptor)
        _fail(stat.S_ISREG(info.st_mode), f"{where} is not a regular file")
    except FreshThirdSmtSessionError:
        raise
    except OSError as exc:
        raise FreshThirdSmtSessionError(
            f"cannot authenticate {where} without following links"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(directory_fd)
    return path


def _read_bounded_relative(
    root_fd: int, relative: str, *, cap: int, require_single_link: bool = False
) -> bytes:
    parts = PurePosixPath(relative).parts
    _fail(
        bool(parts) and all(p not in {"", ".", ".."} for p in parts),
        "unsafe input path",
    )
    directory_fd = os.dup(root_fd)
    descriptor: int | None = None
    try:
        for component in parts[:-1]:
            next_fd = os.open(
                component,
                os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW,
                dir_fd=directory_fd,
            )
            os.close(directory_fd)
            directory_fd = next_fd
        descriptor = os.open(
            parts[-1], os.O_RDONLY | os.O_NOFOLLOW, dir_fd=directory_fd
        )
        info = os.fstat(descriptor)
        _fail(stat.S_ISREG(info.st_mode), "input artifact is not a regular file")
        _fail(
            not require_single_link or info.st_nlink == 1,
            "input artifact has aliases",
        )
        _fail(0 <= info.st_size <= cap, "input artifact exceeds byte cap")
        chunks: list[bytes] = []
        remaining = cap + 1
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            if not chunk:
                break
            chunks.append(chunk)
            remaining -= len(chunk)
        payload = b"".join(chunks)
        _fail(
            len(payload) <= cap and len(payload) == info.st_size,
            "input artifact changed during capture",
        )
        after = os.fstat(descriptor)
        _fail(
            (
                after.st_dev,
                after.st_ino,
                after.st_mode,
                after.st_nlink,
                after.st_size,
                after.st_mtime_ns,
                after.st_ctime_ns,
            )
            == (
                info.st_dev,
                info.st_ino,
                info.st_mode,
                info.st_nlink,
                info.st_size,
                info.st_mtime_ns,
                info.st_ctime_ns,
            ),
            "input artifact changed during capture",
        )
        return payload
    except OSError as exc:
        raise FreshThirdSmtSessionError(
            "cannot capture authenticated input artifact"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(directory_fd)


def _write_immutable_at(
    directory_fd: int, name: str, payload: bytes, *, cap: int = MAX_OUTPUT_BYTES
) -> Mapping[str, Any]:
    _fail(
        "/" not in name and name not in {"", ".", ".."}, "unsafe output artifact name"
    )
    _fail(len(payload) <= cap, "output artifact exceeds byte cap")
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=directory_fd,
        )
        _write_all(descriptor, payload)
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        _fail(
            stat.S_ISREG(info.st_mode) and info.st_size == len(payload),
            "immutable output verification failed",
        )
    except OSError as exc:
        raise FreshThirdSmtSessionError(
            "cannot install immutable output artifact"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _capture_download(
    directory_fd: int, name: str, path: str, transport: DescriptorDownloadTransport
) -> Mapping[str, Any]:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            name,
            os.O_RDWR | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW,
            0o400,
            dir_fd=directory_fd,
        )
        response = transport.download(
            "GET", path, descriptor, byte_cap=MAX_EXPORT_BYTES
        )
        _fail(
            type(response) is DownloadResponse,
            "artifact transport returned invalid response type",
        )
        _fail(
            type(response.status) is int and response.status == 200,
            "PIQD artifact response was not HTTP 200",
        )
        os.fsync(descriptor)
        info = os.fstat(descriptor)
        _fail(
            stat.S_ISREG(info.st_mode) and info.st_size <= MAX_EXPORT_BYTES,
            "captured export is invalid",
        )
        os.lseek(descriptor, 0, os.SEEK_SET)
        payload = b""
        while len(payload) <= MAX_EXPORT_BYTES:
            chunk = os.read(
                descriptor, min(1024 * 1024, MAX_EXPORT_BYTES + 1 - len(payload))
            )
            if not chunk:
                break
            payload += chunk
        _fail(
            len(payload) == info.st_size, "captured export changed during verification"
        )
        after = os.fstat(descriptor)
        _fail(
            (
                after.st_dev,
                after.st_ino,
                after.st_mode,
                after.st_size,
                after.st_mtime_ns,
                after.st_ctime_ns,
            )
            == (
                info.st_dev,
                info.st_ino,
                info.st_mode,
                info.st_size,
                info.st_mtime_ns,
                info.st_ctime_ns,
            ),
            "captured export changed during verification",
        )
        _fail(
            response.byte_count == len(payload) and response.sha256 == _sha(payload),
            "artifact transport digest mismatch",
        )
    except OSError as exc:
        raise FreshThirdSmtSessionError("cannot capture PIQD export") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)
    os.fsync(directory_fd)
    return {
        "path": name,
        "bytes": len(payload),
        "sha256": _sha(payload),
        "payload": payload,
    }


def _reserve_output(path: Path) -> int:
    _fail(
        path.name not in {"", ".", ".."} and "/" not in path.name,
        "unsafe output directory",
    )
    parent_fd = _open_directory_nofollow(path.parent)
    descriptor: int | None = None
    try:
        os.mkdir(path.name, 0o700, dir_fd=parent_fd)
        os.fsync(parent_fd)
        descriptor = os.open(
            path.name, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW, dir_fd=parent_fd
        )
        _fail(not os.listdir(descriptor), "new output directory is not empty")
        return descriptor
    except FileExistsError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise FreshThirdSmtSessionError("output directory already exists") from exc
    except FreshThirdSmtSessionError:
        if descriptor is not None:
            os.close(descriptor)
        raise
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise FreshThirdSmtSessionError("cannot reserve output directory") from exc
    finally:
        os.close(parent_fd)


def _ascii_space(byte: int) -> bool:
    return byte in {9, 10, 11, 12, 13, 32}


def split_smt2_commands(text: str) -> list[str]:
    """Losslessly split top-level SMT-LIB commands (matching PIQD's scanner)."""

    data = text.encode("utf-8")
    commands: list[str] = []
    depth = 0
    start = 0
    i = 0
    while i < len(data):
        byte = data[i]
        if byte == ord(";"):
            while i < len(data) and data[i] != ord("\n"):
                i += 1
        elif byte == ord('"') and depth > 0:
            i += 1
            while True:
                _fail(i < len(data), "SMT-LIB input ends inside a string")
                if data[i] == ord('"'):
                    if i + 1 < len(data) and data[i + 1] == ord('"'):
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
        elif byte == ord("|") and depth > 0:
            i += 1
            while i < len(data) and data[i] != ord("|"):
                i += 1
            _fail(i < len(data), "SMT-LIB input ends inside a quoted symbol")
            i += 1
        elif byte == ord("("):
            if depth == 0:
                start = i
            depth += 1
            _fail(depth <= MAX_SEXPR_DEPTH, "SMT-LIB nesting exceeds depth cap")
            i += 1
        elif byte == ord(")"):
            _fail(depth > 0, "unbalanced SMT-LIB closing parenthesis")
            depth -= 1
            i += 1
            if depth == 0:
                commands.append(data[start:i].decode("utf-8"))
        else:
            _fail(
                depth > 0 or _ascii_space(byte), "bare SMT-LIB token outside a command"
            )
            i += 1
    _fail(depth == 0, "SMT-LIB input ends inside a command")
    return commands


def _tokens(command: str) -> list[str]:
    """Tokenize one command structurally; spelling is never used for journaling."""

    result: list[str] = []
    data = command.encode("utf-8")
    i = 0
    while i < len(data):
        byte = data[i]
        if _ascii_space(byte):
            i += 1
        elif byte == ord(";"):
            while i < len(data) and data[i] != ord("\n"):
                i += 1
        elif byte in (ord("("), ord(")")):
            result.append(chr(byte))
            i += 1
        elif byte == ord('"'):
            start = i
            i += 1
            while True:
                _fail(i < len(data), "unterminated SMT-LIB string token")
                if data[i] == ord('"'):
                    if i + 1 < len(data) and data[i + 1] == ord('"'):
                        i += 2
                        continue
                    i += 1
                    break
                i += 1
            result.append(data[start:i].decode("utf-8"))
        elif byte == ord("|"):
            start = i
            i += 1
            while i < len(data) and data[i] != ord("|"):
                i += 1
            _fail(i < len(data), "unterminated SMT-LIB quoted symbol")
            i += 1
            result.append(data[start:i].decode("utf-8"))
        else:
            start = i
            while (
                i < len(data)
                and not _ascii_space(data[i])
                and data[i] not in (ord("("), ord(")"), ord(";"))
            ):
                i += 1
            result.append(data[start:i].decode("utf-8"))
        _fail(len(result) <= MAX_SEXPR_TOKENS, "SMT-LIB token count exceeds cap")
    return result


def normalize_script(original: bytes) -> tuple[list[str], bytes]:
    """Remove only the exact reserved option and exact terminal query pair."""

    try:
        text = original.decode("utf-8")
    except UnicodeDecodeError as exc:
        raise FreshThirdSmtSessionError("source SMT2 is not UTF-8") from exc
    commands = split_smt2_commands(text)
    _fail(len(commands) >= 2, "source SMT2 has no terminal query pair")
    _fail(
        _tokens(commands[-2]) == ["(", "check-sat", ")"]
        and _tokens(commands[-1]) == ["(", "exit", ")"],
        "source SMT2 query suffix is not exactly check-sat then exit",
    )
    retained: list[str] = []
    removed_option = 0
    for command in commands[:-2]:
        tokens = _tokens(command)
        if tokens == ["(", "set-option", ":produce-models", "true", ")"]:
            removed_option += 1
            continue
        _fail(
            not (len(tokens) > 1 and tokens[1] in {"check-sat", "exit"})
            and not (len(tokens) > 1 and tokens[1].startswith("get-")),
            "source SMT2 contains a nonterminal query",
        )
        retained.append(command)
    _fail(removed_option <= 1, "source SMT2 repeats produce-models option")
    journal = b"".join(command.encode("utf-8") + b"\n" for command in retained)
    return retained, journal


def _strict_json(raw: bytes, where: str) -> object:
    def pairs(items: list[tuple[str, Any]]) -> dict[str, Any]:
        out: dict[str, Any] = {}
        for key, value in items:
            if key in out:
                raise ValueError("duplicate key")
            out[key] = value
        return out

    try:
        value = json.loads(
            raw.decode("utf-8"),
            object_pairs_hook=pairs,
            parse_constant=lambda _: (_ for _ in ()).throw(ValueError("constant")),
        )
    except (
        UnicodeDecodeError,
        json.JSONDecodeError,
        ValueError,
        RecursionError,
    ) as exc:
        raise FreshThirdSmtSessionError(f"{where} is not strict JSON") from exc
    return _snapshot_builtin_json(value, where)


def _snapshot_builtin_json(
    value: object, where: str, *, depth: int = 0, count: list[int] | None = None
) -> object:
    """Validate and detach bounded transport-owned JSON into fresh builtins."""

    if count is None:
        count = [0]
    _fail(depth <= MAX_JSON_DEPTH, f"{where} exceeds JSON depth cap")
    count[0] += 1
    _fail(count[0] <= MAX_JSON_NODES, f"{where} exceeds JSON node cap")
    if value is None or type(value) in {str, bool, int}:
        return value
    if type(value) is float:
        _fail(math.isfinite(value), f"{where} contains a non-finite number")
        return value
    if type(value) is list:
        try:
            return [
                _snapshot_builtin_json(item, where, depth=depth + 1, count=count)
                for item in value
            ]
        except FreshThirdSmtSessionError:
            raise
        except RuntimeError as exc:
            raise FreshThirdSmtSessionError(
                f"{where} changed during JSON snapshot"
            ) from exc
    if type(value) is dict:
        result: dict[str, object] = {}
        try:
            for key, item in value.items():
                _fail(type(key) is str, f"{where} contains a non-string key")
                count[0] += 1
                _fail(count[0] <= MAX_JSON_NODES, f"{where} exceeds JSON node cap")
                result[key] = _snapshot_builtin_json(
                    item, where, depth=depth + 1, count=count
                )
        except FreshThirdSmtSessionError:
            raise
        except RuntimeError as exc:
            raise FreshThirdSmtSessionError(
                f"{where} changed during JSON snapshot"
            ) from exc
        return result
    raise FreshThirdSmtSessionError(f"{where} contains a non-builtin JSON type")


def _validate_builtin_json(value: object, where: str) -> None:
    _snapshot_builtin_json(value, where)


def _object(
    value: object, keys: set[str], where: str, optional: set[str] | None = None
) -> dict[str, Any]:
    _fail(type(value) is dict, f"{where} must be an object")
    obj = value
    optional = optional or set()
    _fail(
        set(obj) == keys | (set(obj) & optional) and keys <= set(obj),
        f"{where} has unexpected JSON keys",
    )
    return obj


def _integer(value: object, where: str, *, minimum: int = 0) -> int:
    _fail(type(value) is int and value >= minimum, f"{where} must be an exact integer")
    return value


def _string(value: object, where: str, *, allow_empty: bool = False) -> str:
    _fail(
        type(value) is str and (allow_empty or bool(value)), f"{where} must be a string"
    )
    return value


def _digest(value: object, where: str) -> str:
    digest = _string(value, where)
    _fail(
        len(digest) == 64
        and all(character in "0123456789abcdef" for character in digest),
        f"{where} must be a lowercase SHA-256",
    )
    return digest


def _exact_json_equal(left: object, right: object) -> bool:
    """Compare JSON trees without Python's Boolean/integer numeric coercions."""

    if type(left) is not type(right):
        return False
    if type(left) is list:
        return len(left) == len(right) and all(
            _exact_json_equal(a, b) for a, b in zip(left, right, strict=True)
        )
    if type(left) is dict:
        return set(left) == set(right) and all(
            _exact_json_equal(left[key], right[key]) for key in left
        )
    return left == right


def _json_request(
    transport: JsonHttpTransport,
    method: str,
    path: str,
    body: Mapping[str, object] | None = None,
    *,
    expected_status: int = 200,
) -> object:
    try:
        response = transport.request(method, path, body)
    except FreshThirdSmtSessionError:
        raise
    except Exception as exc:
        raise _PiqdJsonTransportLoss("PIQD JSON transport failed") from exc
    _fail(
        type(response) is JsonHttpResponse,
        "PIQD transport returned invalid response type",
    )
    _fail(
        type(response.status) is int and response.status == expected_status,
        f"PIQD returned JSON status other than exact HTTP {expected_status}",
    )
    return _snapshot_builtin_json(response.body, "PIQD response")


_SESSION_KEYS = {
    "id",
    "lane",
    "state",
    "solver_name",
    "solver_sha256",
    "solver_signature",
    "protocol_version",
    "journal_path",
    "created_at",
    "updated_at",
    "clauses",
    "max_var",
    "solves",
    "last_status",
    "declared_num_vars",
    "last_solve_index",
    "last_assumption_free",
    "last_terminal_unsat",
    "label",
}


def _session(
    value: object,
    *,
    solver: str,
    state: str,
    solves: int,
    last_status: str | None,
    data_root: str,
    data_root_fd: int,
) -> dict[str, Any]:
    obj = _object(value, _SESSION_KEYS, "session")
    session_id = _string(obj["id"], "session.id")
    try:
        _fail(
            str(uuid.UUID(session_id)) == session_id,
            "session.id is not a canonical UUID",
        )
    except ValueError as exc:
        raise FreshThirdSmtSessionError("session.id is not a canonical UUID") from exc
    _fail(
        obj["lane"] == "smt" and obj["state"] == state and obj["solver_name"] == solver,
        "session identity mismatch",
    )
    for key in ("solver_sha256", "solver_signature", "journal_path", "label"):
        _string(obj[key], f"session.{key}", allow_empty=key == "label")
    _digest(obj["solver_sha256"], "session.solver_sha256")
    for key in (
        "protocol_version",
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
    ):
        _integer(obj[key], f"session.{key}")
    declared_num_vars = obj["declared_num_vars"]
    _fail(
        declared_num_vars is None or type(declared_num_vars) is int,
        "session.declared_num_vars must be an exact integer or null",
    )
    last_solve_index = obj["last_solve_index"]
    _fail(
        last_solve_index is None or type(last_solve_index) is int,
        "session.last_solve_index must be an exact integer or null",
    )
    last_assumption_free = obj["last_assumption_free"]
    _fail(
        last_assumption_free is None or type(last_assumption_free) is bool,
        "session.last_assumption_free must be a Boolean or null",
    )
    last_terminal_unsat = obj["last_terminal_unsat"]
    _fail(
        last_terminal_unsat is None or type(last_terminal_unsat) is bool,
        "session.last_terminal_unsat must be a Boolean or null",
    )
    _fail(obj["protocol_version"] == 1, "session protocol version mismatch")
    obj["journal_path"] = _authenticate_piqd_file(
        obj["journal_path"],
        data_root=data_root,
        data_root_fd=data_root_fd,
        session_id=session_id,
        basename="journal.smt2",
        where="session.journal_path",
    )
    _fail(
        obj["max_var"] == 0
        and obj["solves"] == solves
        and obj["last_status"] == last_status,
        "session counters mismatch",
    )
    expected_solve_index = None if solves == 0 else 1
    expected_assumption_free = None if solves == 0 else True
    expected_terminal_unsat = True if last_status == "UNSAT" else None
    _fail(
        declared_num_vars is None
        and last_solve_index == expected_solve_index
        and last_assumption_free is expected_assumption_free
        and last_terminal_unsat is expected_terminal_unsat,
        "session solve provenance mismatch",
    )
    _fail(obj["updated_at"] >= obj["created_at"], "session timestamps are reversed")
    return obj


def _assert_response(value: object, count: int) -> dict[str, Any]:
    obj = _object(value, {"added", "commands"}, "assert response")
    _fail(
        _integer(obj["added"], "assert.added") == count
        and _integer(obj["commands"], "assert.commands") == count,
        "CAS assert count mismatch",
    )
    return obj


_SOLVE_REQUIRED = {"status", "solve_ms", "solve_index", "result_sha256"}
_SOLVE_OPTIONAL = {"interrupted_by", "core", "terminal_unsat", "model", "values"}


def _piqd_result_digest(result: Mapping[str, object]) -> str:
    """Reproduce piqd `smt_receipts::result_digest` byte-for-byte."""

    digest = hashlib.sha256()
    digest.update(PIQD_RESULT_DIGEST_VERSION)

    def field(name: str, value: object | None) -> None:
        if value is None:
            digest.update(f"\n{name}=-".encode())
            return
        _fail(type(value) is str, f"result digest field {name} is not text")
        encoded = value.encode("utf-8")
        digest.update(f"\n{name}={len(encoded)}:".encode())
        digest.update(encoded)

    field("status", result.get("status"))
    field("interrupted_by", result.get("interrupted_by"))
    terminal = result.get("terminal_unsat")
    _fail(
        terminal is None or type(terminal) is bool,
        "result digest terminal_unsat is not Boolean",
    )
    field("terminal_unsat", None if terminal is None else str(terminal).lower())
    core = result.get("core")
    if core is None:
        digest.update(b"\ncore=-")
    else:
        _fail(type(core) is list, "result digest core is not a list")
        digest.update(f"\ncore={len(core)}".encode())
        for member in core:
            _fail(type(member) is str, "result digest core member is not text")
            encoded = member.encode("utf-8")
            digest.update(f"\n{len(encoded)}:".encode())
            digest.update(encoded)
    field("model", result.get("model"))
    field("values", result.get("values"))
    return digest.hexdigest()


def _model_has_definition(model: str) -> bool:
    parsed = _parse_sexpr(model)
    stack = [parsed]
    while stack:
        node = stack.pop()
        if type(node) is list:
            if (
                node
                and type(node[0]) is str
                and node[0]
                in {
                    "define-fun",
                    "define-const",
                    "define-fun-rec",
                    "define-funs-rec",
                }
            ):
                return True
            stack.extend(node)
    return False


def _solve_response(value: object) -> dict[str, Any]:
    obj = _object(value, _SOLVE_REQUIRED, "solve response", _SOLVE_OPTIONAL)
    _fail(obj["status"] in {"SAT", "UNSAT", "UNKNOWN"}, "invalid solve status")
    _integer(obj["solve_ms"], "solve.solve_ms")
    _fail(
        _integer(obj["solve_index"], "solve.solve_index", minimum=1) == 1,
        "fresh session solve index is not one",
    )
    _digest(obj["result_sha256"], "solve.result_sha256")
    if "interrupted_by" in obj:
        _fail(
            obj["status"] == "UNKNOWN" and obj["interrupted_by"] == "daemon_deadline",
            "invalid solve interruption",
        )
    if obj["status"] == "SAT":
        _fail(
            set(obj) == _SOLVE_REQUIRED | {"model", "values"},
            "SAT solve fields are not exact",
        )
        _string(obj["model"], "solve.model")
        _string(obj["values"], "solve.values")
    elif obj["status"] == "UNSAT":
        _fail(
            set(obj) == _SOLVE_REQUIRED | {"core", "terminal_unsat"},
            "UNSAT solve fields are not exact",
        )
        _fail(
            type(obj["core"]) is list
            and not obj["core"]
            and obj["terminal_unsat"] is True,
            "UNSAT solve payload is invalid",
        )
    else:
        _fail(
            set(obj) in (_SOLVE_REQUIRED, _SOLVE_REQUIRED | {"interrupted_by"}),
            "UNKNOWN solve fields are not exact",
        )
    _fail(
        obj["result_sha256"] == _piqd_result_digest(obj),
        "solve result digest mismatch",
    )
    return obj


_RECEIPT_REQUIRED = {
    "solve_index",
    "base_commands",
    "base_bytes",
    "base_sha256",
    "solver_signature",
    "solver_sha256",
    "assumptions",
    "timeout_ms",
    "include_model",
    "get_values",
    "status",
    "solve_ms",
    "result_sha256",
    "at",
}
_RECEIPT_OPTIONAL = {"interrupted_by", "core", "terminal_unsat", "model", "values"}


def _receipt_list(
    value: object,
    *,
    session_id: str,
    data_root: str,
    data_root_fd: int,
) -> dict[str, Any]:
    obj = _object(
        value,
        {"session_id", "lane", "journal_path", "receipts_path", "count", "receipts"},
        "receipt list",
    )
    for key in ("session_id", "journal_path", "receipts_path"):
        _string(obj[key], f"receipts.{key}")
    _fail(
        obj["lane"] == "smt" and type(obj["receipts"]) is list, "invalid receipt list"
    )
    _fail(
        _integer(obj["count"], "receipts.count") == len(obj["receipts"]),
        "receipt count mismatch",
    )
    _fail(obj["session_id"] == session_id, "receipt session identity mismatch")
    obj["journal_path"] = _authenticate_piqd_file(
        obj["journal_path"],
        data_root=data_root,
        data_root_fd=data_root_fd,
        session_id=session_id,
        basename="journal.smt2",
        where="receipts.journal_path",
    )
    obj["receipts_path"] = _authenticate_piqd_file(
        obj["receipts_path"],
        data_root=data_root,
        data_root_fd=data_root_fd,
        session_id=session_id,
        basename="receipts.jsonl",
        where="receipts.receipts_path",
    )
    return obj


def _strict_receipt(
    value: object,
    *,
    session: Mapping[str, Any],
    commands: list[str],
    journal: bytes,
    terms: list[str],
) -> dict[str, Any]:
    obj = _object(value, _RECEIPT_REQUIRED, "SMT receipt", _RECEIPT_OPTIONAL)
    _fail(
        _integer(obj["solve_index"], "receipt.solve_index", minimum=1) == 1,
        "receipt solve index mismatch",
    )
    _fail(
        _integer(obj["base_commands"], "receipt.base_commands") == len(commands),
        "receipt command count mismatch",
    )
    _fail(
        _integer(obj["base_bytes"], "receipt.base_bytes") == len(journal)
        and obj["base_sha256"] == _sha(journal),
        "receipt journal binding mismatch",
    )
    _fail(
        obj["solver_signature"] == session["solver_signature"]
        and obj["solver_sha256"] == session["solver_sha256"],
        "receipt solver identity mismatch",
    )
    _fail(
        obj["assumptions"] == []
        and obj["timeout_ms"] == TIMEOUT_MS
        and obj["include_model"] is True
        and obj["get_values"] == terms,
        "receipt request mismatch",
    )
    _integer(obj["at"], "receipt.at")
    solve = {
        key: item
        for key, item in obj.items()
        if key in _SOLVE_REQUIRED | _SOLVE_OPTIONAL
    }
    _solve_response(solve)
    return obj


def _receipt_as_solve(receipt: Mapping[str, Any]) -> dict[str, Any]:
    return {
        key: value
        for key, value in receipt.items()
        if key in _SOLVE_REQUIRED | _SOLVE_OPTIONAL
    }


def _solve_matches_receipt(
    solve: Mapping[str, Any], receipt: Mapping[str, Any]
) -> bool:
    return solve == _receipt_as_solve(receipt)


def _declared_terms(commands: Sequence[str]) -> list[str]:
    terms: list[str] = []
    for command in commands:
        tokens = _tokens(command)
        if (
            len(tokens) == 7
            and tokens[:2] == ["(", "declare-fun"]
            and tokens[3:5] == ["(", ")"]
            and tokens[5] in {"Bool", "Int"}
            and tokens[6] == ")"
        ) or (
            len(tokens) == 5
            and tokens[:2] == ["(", "declare-const"]
            and tokens[4] == ")"
            and tokens[3] in {"Bool", "Int"}
        ):
            terms.append(tokens[2])
    _fail(len(terms) == len(set(terms)), "duplicate declared readback term")
    return terms or ["true"]


def _parse_sexpr(text: str) -> object:
    commands = split_smt2_commands(text)
    _fail(len(commands) == 1, "get-values response is not one S-expression")
    tokens = _tokens(commands[0])
    _fail(len(tokens) <= MAX_SEXPR_TOKENS, "S-expression token count exceeds cap")
    index = 0
    nodes = 0

    def parse(depth: int = 0) -> object:
        nonlocal index, nodes
        _fail(depth <= MAX_SEXPR_DEPTH, "S-expression nesting exceeds depth cap")
        nodes += 1
        _fail(nodes <= MAX_SEXPR_NODES, "S-expression node count exceeds cap")
        _fail(index < len(tokens), "truncated S-expression")
        token = tokens[index]
        index += 1
        if token != "(":
            _fail(token != ")", "unexpected closing S-expression")
            return token
        items: list[object] = []
        while True:
            _fail(index < len(tokens), "unterminated S-expression")
            if tokens[index] == ")":
                index += 1
                return items
            items.append(parse(depth + 1))

    value = parse()
    _fail(index == len(tokens), "trailing S-expression data")
    return value


def _readback_values(raw: str, terms: Sequence[str]) -> dict[str, object]:
    parsed = _parse_sexpr(raw)
    _fail(
        type(parsed) is list and len(parsed) == len(terms), "get-values arity mismatch"
    )
    values: dict[str, object] = {}
    for expected, pair in zip(terms, parsed, strict=True):
        _fail(
            type(pair) is list and len(pair) == 2 and pair[0] == expected,
            "get-values term mismatch",
        )
        raw_value = pair[1]
        if type(raw_value) is str and raw_value in {"true", "false"}:
            values[expected] = raw_value == "true"
        elif type(raw_value) is str:
            try:
                values[expected] = int(raw_value)
            except ValueError as exc:
                raise FreshThirdSmtSessionError(
                    "get-values contains a non-Boolean/non-integer value"
                ) from exc
        elif (
            type(raw_value) is list
            and len(raw_value) == 2
            and raw_value[0] == "-"
            and type(raw_value[1]) is str
        ):
            try:
                values[expected] = -int(raw_value[1])
            except ValueError as exc:
                raise FreshThirdSmtSessionError(
                    "get-values contains an invalid negative integer"
                ) from exc
        else:
            raise FreshThirdSmtSessionError("get-values contains an unsupported value")
    return values


P, Q, T1, T2, T3, U, A0, A1 = range(8)
LABELS = ("p", "q", "t1", "t2", "t3", "u", "a0", "a1")
TRIPLE = (T1, T2, T3)
NONTRIPLE = (U, A0, A1)
CENTERS = (T1, T2, T3, U, A0, A1)
CENTER_NAMES = tuple(LABELS[c] for c in CENTERS)
P_CIRCLE_MASK = (1 << Q) | (1 << T1) | (1 << T2) | (1 << T3)
REASONS = (
    "unitTriangleOnPCircle",
    "nontripleEquilateralOnPCircle",
    "equilateralOppositePoint",
    "equilateralBisector",
    "commonBisectorTriple",
    "equilateralCircumcenterOnPCircle",
    "equilateralOuterPoint",
)


def _bit(mask: int, label: int) -> bool:
    return bool(mask & (1 << label))


def _contains(mask: int, *labels: int) -> bool:
    return all(_bit(mask, label) for label in labels)


def _third(a: int, b: int) -> int:
    return next(c for c in TRIPLE if c not in (a, b))


def _unit_closure(rows: Mapping[int, int]) -> set[tuple[int, int]]:
    edges = {(P, t) for t in TRIPLE} | {(t, P) for t in TRIPLE}
    for _ in range(8):
        for center in CENTERS:
            members = [x for x in range(8) if _bit(rows[center], x)]
            if any((center, x) in edges for x in members):
                for x in members:
                    edges.add((center, x))
                    edges.add((x, center))
    return edges


def _prefilter_reason(rows: Mapping[int, int]) -> str | None:
    edges = _unit_closure(rows)
    if all((a, b) in edges for a, b in ((T1, T2), (T1, T3), (T2, T3))):
        return REASONS[0]
    if any(
        _contains(rows[t], P, x) and _contains(rows[x], P, t)
        for t in TRIPLE
        for x in NONTRIPLE
    ):
        return REASONS[1]
    if any(
        _contains(rows[a], P, b, _third(a, b), x)
        and _contains(rows[b], P, a, x)
        and _contains(rows[x], P, _third(a, b))
        for a in TRIPLE
        for b in TRIPLE
        if a != b
        for x in NONTRIPLE
    ):
        return REASONS[2]
    if any(
        _contains(rows[a], P, b, x)
        and _contains(rows[b], P, a, x)
        and _contains(rows[x], P, _third(a, b))
        and _contains(rows[_third(a, b)], a, b)
        for a in TRIPLE
        for b in TRIPLE
        if a != b
        for x in NONTRIPLE
    ):
        return REASONS[3]
    if any(_contains(rows[x], P, T1, T2, T3) for x in NONTRIPLE):
        return REASONS[4]
    e01, e02, e12 = (
        _contains(rows[T1], T2, T3),
        _contains(rows[T2], T1, T3),
        _contains(rows[T3], T1, T2),
    )
    triple_pair_dots = (e01 and e02) or (e01 and e12) or (e02 and e12)
    if triple_pair_dots and any(
        _bit(rows[x], P) and sum(_bit(rows[x], t) for t in TRIPLE) >= 2
        for x in NONTRIPLE
    ):
        return REASONS[5]
    if triple_pair_dots and any(
        _bit(rows[left], x)
        and _bit(rows[right], x)
        and any(t != left and _bit(rows[left], t) for t in TRIPLE)
        and any(t != right and _bit(rows[right], t) for t in TRIPLE)
        and _contains(rows[x], P, _third(left, right))
        for x in NONTRIPLE
        for left in TRIPLE
        for right in TRIPLE
        if left != right
    ):
        return REASONS[6]
    return None


def _validate_p97(
    case: str,
    values: Mapping[str, object],
    *,
    shell_distribution: bool = False,
) -> Mapping[str, Any]:
    if case.startswith("smoke_"):
        return {"valid": True, "checks": {"control_has_no_p97_readback": True}}
    if case == "live_escape_or_shell":
        modes: dict[str, int] = {}
        rows: dict[str, set[str]] = {}
        missing: list[str] = []
        for center in CENTER_NAMES:
            mode_name = f"mode_{center}"
            mode = values.get(mode_name)
            if type(mode) is not int:
                missing.append(mode_name)
            else:
                modes[center] = mode
            rows[center] = set()
            for label in LABELS:
                member_name = f"m_{center}_{label}"
                member = values.get(member_name)
                if type(member) is not bool:
                    missing.append(member_name)
                elif member:
                    rows[center].add(label)
        shell_values: dict[str, dict[str, object]] = {}
        if shell_distribution:
            for center in CENTER_NAMES:
                names = {
                    label: f"shell_pc_{center}_{label}"
                    for label in ("q", "t1", "t2", "t3")
                }
                outside_name = f"shell_outside_{center}"
                for name in names.values():
                    if type(values.get(name)) is not bool:
                        missing.append(name)
                if type(values.get(outside_name)) is not int:
                    missing.append(outside_name)
                shell_values[center] = {
                    **{label: values.get(name) for label, name in names.items()},
                    "outside": values.get(outside_name),
                }
        checks = {
            "model_complete": not missing,
            "mode_range": len(modes) == 6
            and all(mode in (0, 1, 2) for mode in modes.values()),
            "global_escape_or_shell": len(modes) == 6
            and any(mode != 0 for mode in modes.values()),
            "mode_cardinality_abstraction": len(modes) == 6
            and all(
                len(rows[c]) == (4 if modes[c] == 0 else 3 if modes[c] == 1 else 0)
                for c in CENTER_NAMES
            ),
            "qdeleted_q_free": len(modes) == 6
            and all(modes[c] == 2 or "q" not in rows[c] for c in CENTER_NAMES),
            "own_center_free": all(c not in rows[c] for c in CENTER_NAMES),
            "qdeleted_p_circle_cut": len(modes) == 6
            and all(
                modes[c] == 2 or len(rows[c] & {"q", "t1", "t2", "t3"}) <= 2
                for c in CENTER_NAMES
            ),
            "pair_intersection_bounds": all(
                type(values.get(f"inter_{c}_{d}")) is int
                and 0 <= values[f"inter_{c}_{d}"] <= 2
                for i, c in enumerate(CENTER_NAMES)
                for d in CENTER_NAMES[i + 1 :]
            ),
        }
        if shell_distribution:
            checks["shell_distribution_encoding"] = not missing and all(
                (
                    shell_values[c]["q"] is True
                    and sum(
                        shell_values[c][label] is True
                        for label in ("q", "t1", "t2", "t3")
                    )
                    <= 2
                    and type(shell_values[c]["outside"]) is int
                    and shell_values[c]["outside"] >= 2
                    and sum(
                        shell_values[c][label] is True
                        for label in ("q", "t1", "t2", "t3")
                    )
                    + shell_values[c]["outside"]
                    == 4
                )
                if modes[c] == 2
                else (
                    all(
                        shell_values[c][label] is False
                        for label in ("q", "t1", "t2", "t3")
                    )
                    and shell_values[c]["outside"] == 0
                )
                for c in CENTER_NAMES
            )
        return {
            "valid": all(checks.values()),
            "checks": checks,
            "missing": sorted(set(missing)),
            "modes": modes,
            "named_members_only": {k: sorted(v) for k, v in rows.items()},
            "shell_distribution": shell_values if shell_distribution else None,
        }
    rows_int: dict[int, int] = {}
    missing = []
    for index, center in zip(CENTERS, CENTER_NAMES, strict=True):
        mask = 0
        for label_index, label in enumerate(LABELS):
            name = f"m_{center}_{label}"
            if type(values.get(name)) is not bool:
                missing.append(name)
            elif values[name]:
                mask |= 1 << label_index
        rows_int[index] = mask
    active = (
        None
        if case == "confined_structural"
        else set(REASONS)
        - (
            {case.removeprefix("confined_drop_")}
            if case.startswith("confined_drop_")
            else set()
        )
    )
    reason = _prefilter_reason(rows_int) if not missing else None
    checks = {
        "model_complete": not missing,
        "card_four": all(mask.bit_count() == 4 for mask in rows_int.values()),
        "q_free": all(not _bit(mask, Q) for mask in rows_int.values()),
        "own_center_free": all(not _bit(rows_int[c], c) for c in CENTERS),
        "pairwise_intersection_le_two": all(
            (rows_int[c] & rows_int[d]).bit_count() <= 2
            for i, c in enumerate(CENTERS)
            for d in CENTERS[i + 1 :]
        ),
        "dangerous_p_circle_intersection_le_two": all(
            (rows_int[c] & P_CIRCLE_MASK).bit_count() <= 2 for c in CENTERS
        ),
        "dangerous_p_circle_complement_ge_two": all(
            (rows_int[c] & ~P_CIRCLE_MASK).bit_count() >= 2 for c in CENTERS
        ),
        "active_nogood_avoided": active is None or reason not in active,
    }
    return {
        "valid": all(checks.values()),
        "checks": checks,
        "missing": missing,
        "rows": {LABELS[c]: rows_int[c] for c in CENTERS},
        "prefilter_reason": reason,
    }


def _case_verdict(case: str, engines: Mapping[str, Mapping[str, Any]]) -> str:
    statuses = [engines[solver]["effective_status"] for solver in SOLVERS]
    if len(set(statuses)) != 1 or statuses[0] not in {"SAT", "UNSAT"}:
        return "UNKNOWN"
    if statuses[0] == "SAT":
        if not all(
            engines[solver].get("readback", {}).get("valid") is True
            for solver in SOLVERS
        ):
            return "UNKNOWN"
        return "SAT-abstraction"
    return (
        "semantic-UNSAT"
        if case in {"smoke_unsat", "confined_all_prefilters"}
        else "relaxation-UNSAT"
    )


def _validate_frozen(
    frozen_fd: int,
) -> tuple[WaveProfile, list[dict[str, Any]], Mapping[str, bytes]]:
    captured = {
        name: _read_bounded_relative(frozen_fd, name, cap=MAX_INPUT_BYTES)
        for name in (
            "manifest.json",
            "case_matrix.json",
            "results.json",
            "finite_nogoods.json",
        )
    }
    profile = WAVE_PROFILES.get(_sha(captured["manifest.json"]))
    _fail(profile is not None, "frozen manifest is not an approved exact wave")
    _fail(
        _sha(captured["case_matrix.json"]) == profile.case_matrix_sha256,
        "frozen case-matrix hash mismatch",
    )
    _fail(
        _sha(captured["results.json"]) == profile.crosssolver_sha256,
        "frozen crosssolver hash mismatch",
    )
    _fail(
        _sha(captured["finite_nogoods.json"]) == profile.finite_nogoods_sha256,
        "frozen finite-nogoods hash mismatch",
    )
    manifest = _strict_json(captured["manifest.json"], "frozen manifest")
    matrix = _strict_json(captured["case_matrix.json"], "frozen case matrix")
    _strict_json(captured["results.json"], "frozen crosssolver results")
    _strict_json(captured["finite_nogoods.json"], "frozen finite nogoods")
    _fail(
        type(manifest) is dict and manifest.get("namespace") == profile.namespace,
        "frozen manifest namespace mismatch",
    )
    _fail(
        manifest.get("schema_sha256") == profile.schema_sha256,
        "frozen schema hash mismatch",
    )
    _fail(
        manifest.get("case_matrix_sha256") == profile.case_matrix_sha256
        and manifest.get("finite_nogoods_sha256") == profile.finite_nogoods_sha256,
        "frozen manifest artifact binding mismatch",
    )
    _fail(
        manifest.get("source_hashes") == profile.source_hashes,
        "frozen source-hash map mismatch",
    )
    budgets = manifest.get("budgets")
    _fail(
        type(budgets) is dict
        and budgets.get("engines") == list(SOLVERS)
        and budgets.get("logical_cases") == 12
        and budgets.get("logical_case_budget") == 12
        and budgets.get("timeout_seconds_per_process") == 20
        and budgets.get("concurrent_solver_processes") == 1
        and budgets.get("total_host_core_budget") == 1,
        "frozen budget manifest mismatch",
    )
    _fail(
        matrix == list(profile.case_matrix),
        "frozen case matrix is not the exact 12-case manifest",
    )
    return profile, matrix, captured


def _load_authenticated_wave(
    frozen_fd: int,
) -> tuple[
    WaveProfile,
    list[dict[str, Any]],
    Mapping[str, bytes],
    Mapping[str, bytes],
    Mapping[str, tuple[list[str], bytes, list[str]]],
]:
    profile, matrix, captured = _validate_frozen(frozen_fd)
    originals: dict[str, bytes] = {}
    normalized: dict[str, tuple[list[str], bytes, list[str]]] = {}
    expected_hashes = {
        str(row["case"]): str(row["smt_sha256"]) for row in profile.case_matrix
    }
    _fail(
        set(expected_hashes) == set(CASE_NAMES),
        "approved wave does not bind exactly 12 case scripts",
    )
    for case in CASE_NAMES:
        original = _read_bounded_relative(
            frozen_fd,
            f"models/{case}.smt2",
            cap=MAX_INPUT_BYTES,
        )
        _fail(
            _sha(original) == expected_hashes[case],
            f"frozen SMT2 hash mismatch: {case}",
        )
        commands, journal = normalize_script(original)
        originals[case] = original
        normalized[case] = (commands, journal, _declared_terms(commands))
    return profile, matrix, captured, originals, normalized


def preflight_frozen_wave(frozen_root: Path) -> Mapping[str, Any]:
    """Authenticate and normalize one approved frozen wave without using PIQD."""

    frozen_fd: int | None = None
    try:
        frozen_fd = _open_directory_nofollow(frozen_root)
        profile, matrix, _captured, originals, normalized = _load_authenticated_wave(
            frozen_fd
        )
        return {
            "namespace": profile.namespace,
            "manifest_sha256": profile.manifest_sha256,
            "case_count": len(matrix),
            "cases": [
                {
                    "case": case,
                    "original_sha256": _sha(originals[case]),
                    "journal_sha256": _sha(normalized[case][1]),
                    "commands": len(normalized[case][0]),
                    "get_values": len(normalized[case][2]),
                }
                for case in CASE_NAMES
            ],
        }
    except FreshThirdSmtSessionError:
        raise
    except Exception as exc:
        raise FreshThirdSmtSessionError(
            f"FreshThird wave preflight failed: {type(exc).__name__}"
        ) from exc
    finally:
        if frozen_fd is not None:
            os.close(frozen_fd)


@dataclass(frozen=True)
class _ReplayFile:
    payload: bytes
    descriptor: int
    identity: tuple[int, int, int, int, int, int, int]


def _file_identity(info: os.stat_result) -> tuple[int, int, int, int, int, int, int]:
    return (
        info.st_dev,
        info.st_ino,
        info.st_mode,
        info.st_nlink,
        info.st_size,
        info.st_mtime_ns,
        info.st_ctime_ns,
    )


def _capture_replay_file(root_fd: int, name: str, total: list[int]) -> _ReplayFile:
    _fail(
        type(name) is str and "/" not in name and name not in {"", ".", ".."},
        "unsafe replay artifact name",
    )
    descriptor: int | None = None
    try:
        descriptor = os.open(name, os.O_RDONLY | os.O_NOFOLLOW, dir_fd=root_fd)
        info = os.fstat(descriptor)
        _fail(stat.S_ISREG(info.st_mode), "replay artifact is not a regular file")
        _fail(info.st_nlink == 1, "replay artifact has aliases")
        _fail(info.st_mode & 0o222 == 0, "replay artifact is mutable")
        _fail(0 <= info.st_size <= MAX_OUTPUT_BYTES, "replay artifact exceeds byte cap")
        total[0] += info.st_size
        _fail(
            total[0] <= MAX_REPLAY_TOTAL_BYTES, "replay artifacts exceed aggregate cap"
        )
        chunks: list[bytes] = []
        remaining = info.st_size
        while remaining:
            chunk = os.read(descriptor, min(1024 * 1024, remaining))
            _fail(bool(chunk), "replay artifact changed during capture")
            chunks.append(chunk)
            remaining -= len(chunk)
        _fail(not os.read(descriptor, 1), "replay artifact changed during capture")
        payload = b"".join(chunks)
        identity = _file_identity(info)
        _fail(
            len(payload) == info.st_size
            and _file_identity(os.fstat(descriptor)) == identity,
            "replay artifact changed during capture",
        )
        return _ReplayFile(payload, descriptor, identity)
    except FreshThirdSmtSessionError:
        if descriptor is not None:
            os.close(descriptor)
        raise
    except OSError as exc:
        if descriptor is not None:
            os.close(descriptor)
        raise FreshThirdSmtSessionError(
            "cannot capture replay artifact without following links"
        ) from exc


def _open_replay_root(path: Path, where: str) -> int:
    _fail(type(path) is type(Path()), f"{where} must be an exact Path")
    raw = os.fspath(path)
    _fail(type(raw) is str and "\x00" not in raw, f"invalid {where} path")
    pure = PurePosixPath(raw)
    _fail(
        raw not in {"", ".", "..", "/"}
        and all(part not in {"", ".", ".."} for part in pure.parts),
        f"{where} path is not canonical",
    )
    try:
        return _open_directory_nofollow(Path(os.path.abspath(raw)))
    except FreshThirdSmtSessionError:
        raise
    except OSError as exc:
        raise FreshThirdSmtSessionError(
            f"cannot authenticate {where} without following links"
        ) from exc


def _artifact_descriptor(value: object, path: str, where: str) -> dict[str, Any]:
    obj = _object(value, {"path", "bytes", "sha256"}, where)
    _fail(obj["path"] == path, f"{where} path mismatch")
    _integer(obj["bytes"], f"{where}.bytes")
    _digest(obj["sha256"], f"{where}.sha256")
    return obj


def _offline_session(
    value: object,
    *,
    case: str,
    solver: str,
    state: str,
    solves: int,
    last_status: str | None,
    clauses: int,
    data_root: str,
) -> dict[str, Any]:
    obj = _object(value, _SESSION_KEYS, "replay session")
    session_id = _string(obj["id"], "session.id")
    try:
        _fail(str(uuid.UUID(session_id)) == session_id, "session.id is not canonical")
    except ValueError as exc:
        raise FreshThirdSmtSessionError("session.id is not canonical") from exc
    _fail(
        obj["lane"] == "smt" and obj["state"] == state and obj["solver_name"] == solver,
        "replay session identity mismatch",
    )
    for key in ("solver_sha256", "solver_signature", "journal_path", "label"):
        _string(obj[key], f"session.{key}", allow_empty=key == "label")
    _digest(obj["solver_sha256"], "session.solver_sha256")
    for key in (
        "protocol_version",
        "created_at",
        "updated_at",
        "clauses",
        "max_var",
        "solves",
    ):
        _integer(obj[key], f"session.{key}")
    _fail(
        obj["protocol_version"] == 1
        and obj["max_var"] == 0
        and obj["solves"] == solves
        and obj["last_status"] == last_status
        and obj["clauses"] == clauses,
        "replay session counters mismatch",
    )
    _fail(
        obj["label"] == f"P97 FreshThird {case} {solver} finite diagnostic",
        "replay session label mismatch",
    )
    expected_path = f"{data_root}/sessions/{session_id}/journal.smt2"
    _fail(obj["journal_path"] == expected_path, "replay session journal path mismatch")
    _fail(
        obj["declared_num_vars"] is None
        and (
            obj["last_solve_index"] is None
            if not solves
            else type(obj["last_solve_index"]) is int and obj["last_solve_index"] == 1
        )
        and obj["last_assumption_free"] is (True if solves else None)
        and obj["last_terminal_unsat"] is (True if last_status == "UNSAT" else None),
        "replay session solve provenance mismatch",
    )
    _fail(obj["updated_at"] >= obj["created_at"], "session timestamps are reversed")
    return obj


def _offline_receipt_list(
    value: object,
    *,
    session: Mapping[str, Any],
    data_root: str,
) -> dict[str, Any]:
    obj = _object(
        value,
        {"session_id", "lane", "journal_path", "receipts_path", "count", "receipts"},
        "replay receipt list",
    )
    _fail(type(obj["receipts"]) is list, "replay receipts must be a list")
    count = _integer(obj["count"], "receipts.count")
    session_id = session["id"]
    _fail(
        obj["session_id"] == session_id
        and obj["lane"] == "smt"
        and obj["journal_path"] == session["journal_path"]
        and obj["receipts_path"] == f"{data_root}/sessions/{session_id}/receipts.jsonl"
        and count == len(obj["receipts"])
        and count in {0, 1},
        "replay receipt list identity mismatch",
    )
    return obj


def _replay_readback(
    case: str,
    solve: Mapping[str, Any],
    terms: list[str],
    *,
    shell_distribution: bool,
) -> Mapping[str, Any]:
    try:
        values = _readback_values(solve["values"], terms)
        _fail(_model_has_definition(solve["model"]), "SAT model is semantically empty")
        readback = _validate_p97(case, values, shell_distribution=shell_distribution)
        _fail(bool(solve["model"].strip()), "SAT model is empty")
        return readback
    except Exception as exc:  # noqa: BLE001 - replay must reproduce UNKNOWN downgrade
        return {"valid": False, "normalized_error": type(exc).__name__}


def _validate_replay_engine(
    value: object,
    *,
    case: str,
    solver: str,
    commands: list[str],
    journal: bytes,
    terms: list[str],
    shell_distribution: bool,
    data_root: str,
    export: _ReplayFile,
) -> dict[str, Any]:
    _fail(type(value) is dict, "replay engine must be an object")
    committed = "solve" in value or "receipt" in value
    base_keys = {"session", "assert", "export", "receipts_response", "closed_session"}
    if committed:
        expected = base_keys | {
            "effective_status",
            "response_loss",
            "reconciled_from_receipt",
            "solve",
            "receipt",
        }
        if value.get("solve", {}).get("status") == "SAT":
            expected.add("readback")
    else:
        expected = base_keys | {
            "effective_status",
            "response_loss",
            "reconciled_from_receipt",
            "error",
        }
    obj = _object(value, expected, "replay engine")
    session = _offline_session(
        obj["session"],
        case=case,
        solver=solver,
        state="live",
        solves=0,
        last_status=None,
        clauses=0,
        data_root=data_root,
    )
    _assert_response(obj["assert"], len(commands))
    export_name = f"{case}.{solver}.journal.smt2"
    descriptor = _artifact_descriptor(obj["export"], export_name, "engine export")
    _fail(
        export.payload == journal
        and descriptor["bytes"] == len(export.payload)
        and descriptor["sha256"] == _sha(export.payload),
        "engine export does not bind the normalized journal",
    )
    receipts = _offline_receipt_list(
        obj["receipts_response"], session=session, data_root=data_root
    )
    if committed:
        _fail(receipts["count"] == 1, "committed solve lacks one durable receipt")
        receipt = _strict_receipt(
            obj["receipt"],
            session=session,
            commands=commands,
            journal=journal,
            terms=terms,
        )
        durable = _strict_receipt(
            receipts["receipts"][0],
            session=session,
            commands=commands,
            journal=journal,
            terms=terms,
        )
        _fail(_exact_json_equal(durable, receipt), "durable receipt copy mismatch")
        solve = _solve_response(obj["solve"])
        _fail(_solve_matches_receipt(solve, receipt), "solve and receipt disagree")
        _fail(type(obj["response_loss"]) is bool, "response_loss must be Boolean")
        _fail(
            type(obj["reconciled_from_receipt"]) is bool
            and obj["reconciled_from_receipt"] is obj["response_loss"],
            "receipt reconciliation claim mismatch",
        )
        effective = solve["status"]
        if solve["status"] == "SAT":
            replayed = _replay_readback(
                case, solve, terms, shell_distribution=shell_distribution
            )
            _fail(
                _exact_json_equal(obj["readback"], replayed),
                "stored readback disagrees with replay",
            )
            if replayed.get("valid") is not True:
                effective = "UNKNOWN"
        _fail(obj["effective_status"] == effective, "effective status mismatch")
        solves = 1
        last_status = solve["status"]
    else:
        _fail(receipts["count"] == 0, "uncommitted solve has a durable receipt")
        _fail(
            obj["effective_status"] == "UNKNOWN"
            and obj["response_loss"] is True
            and obj["reconciled_from_receipt"] is False
            and type(obj["error"]) is str
            and obj["error"] in {"_PiqdJsonTransportLoss", "MissingReceipt"},
            "uncommitted response-loss result is invalid",
        )
        solves = 0
        last_status = None
    closed = _offline_session(
        obj["closed_session"],
        case=case,
        solver=solver,
        state="closed",
        solves=solves,
        last_status=last_status,
        clauses=len(commands),
        data_root=data_root,
    )
    _fail(
        closed["id"] == session["id"]
        and closed["solver_sha256"] == session["solver_sha256"]
        and closed["solver_signature"] == session["solver_signature"]
        and closed["journal_path"] == session["journal_path"]
        and closed["created_at"] == session["created_at"]
        and closed["updated_at"] >= session["updated_at"],
        "closed session does not bind the created session",
    )
    return obj


def validate_freshthird_smt_session_output(
    output_dir: Path, *, repo_root: Path = REPO_ROOT
) -> Mapping[str, Any]:
    """Strictly validate and independently replay one finite output packet."""

    expected_names = {
        "receipt.json",
        "frozen-manifest.json",
        "frozen-case_matrix.json",
        "frozen-results.json",
        "frozen-finite_nogoods.json",
        *(f"{case}.original.smt2" for case in CASE_NAMES),
        *(f"{case}.{solver}.journal.smt2" for case in CASE_NAMES for solver in SOLVERS),
    }
    output_fd: int | None = None
    repo_fd: int | None = None
    captures: dict[str, _ReplayFile] = {}
    try:
        output_fd = _open_replay_root(output_dir, "output directory")
        repo_fd = _open_replay_root(repo_root, "repo root")
        directory_before = _file_identity(os.fstat(output_fd))
        names_before = os.listdir(output_fd)
        _fail(
            all(type(name) is str for name in names_before)
            and len(names_before) == len(set(names_before))
            and set(names_before) == expected_names,
            "output directory does not contain the exact declared artifact set",
        )
        total = [0]
        for name in sorted(expected_names):
            captures[name] = _capture_replay_file(output_fd, name, total)

        receipt = _strict_json(captures["receipt.json"].payload, "output receipt")
        top = _object(
            receipt,
            {
                "schema",
                "status",
                "frozen",
                "current_source_observation",
                "execution",
                "claims",
                "artifacts",
                "cases",
                "receipt_sha256",
            },
            "output receipt",
        )
        unsigned = {key: value for key, value in top.items() if key != "receipt_sha256"}
        _digest(top["receipt_sha256"], "receipt.receipt_sha256")
        _fail(
            captures["receipt.json"].payload == _canonical(top) + b"\n",
            "output receipt is not canonical JSON",
        )
        _fail(
            top["receipt_sha256"] == _sha(_canonical(unsigned)),
            "output receipt self-hash mismatch",
        )
        _fail(
            top["schema"] == SCHEMA and top["status"] == STATUS,
            "receipt version mismatch",
        )

        frozen = _object(
            top["frozen"],
            {
                "namespace",
                "manifest_sha256",
                "case_matrix_sha256",
                "crosssolver_sha256",
                "finite_nogoods_sha256",
                "schema_sha256",
                "source_hashes",
            },
            "receipt frozen identity",
        )
        profile = WAVE_PROFILES.get(frozen["manifest_sha256"])
        _fail(profile is not None, "receipt does not name an approved frozen wave")
        _fail(
            _exact_json_equal(
                frozen,
                {
                    "namespace": profile.namespace,
                    "manifest_sha256": profile.manifest_sha256,
                    "case_matrix_sha256": profile.case_matrix_sha256,
                    "crosssolver_sha256": profile.crosssolver_sha256,
                    "finite_nogoods_sha256": profile.finite_nogoods_sha256,
                    "schema_sha256": profile.schema_sha256,
                    "source_hashes": dict(profile.source_hashes),
                },
            ),
            "receipt frozen identity mismatch",
        )
        frozen_payloads = {
            name: captures[f"frozen-{name}"].payload
            for name in (
                "manifest.json",
                "case_matrix.json",
                "results.json",
                "finite_nogoods.json",
            )
        }
        _fail(
            _sha(frozen_payloads["manifest.json"]) == profile.manifest_sha256,
            "copied manifest hash mismatch",
        )
        _fail(
            _sha(frozen_payloads["case_matrix.json"]) == profile.case_matrix_sha256,
            "copied case matrix hash mismatch",
        )
        _fail(
            _sha(frozen_payloads["results.json"]) == profile.crosssolver_sha256,
            "copied results hash mismatch",
        )
        _fail(
            _sha(frozen_payloads["finite_nogoods.json"])
            == profile.finite_nogoods_sha256,
            "copied finite nogoods hash mismatch",
        )
        manifest = _strict_json(frozen_payloads["manifest.json"], "copied manifest")
        matrix = _strict_json(frozen_payloads["case_matrix.json"], "copied case matrix")
        _strict_json(frozen_payloads["results.json"], "copied results")
        _strict_json(frozen_payloads["finite_nogoods.json"], "copied finite nogoods")
        _fail(
            type(manifest) is dict and manifest.get("namespace") == profile.namespace,
            "copied manifest namespace mismatch",
        )
        _fail(matrix == list(profile.case_matrix), "copied case matrix mismatch")

        execution = _object(
            top["execution"],
            {
                "case_count",
                "solver_order",
                "fresh_session_per_case_solver",
                "sequential",
                "timeout_ms",
                "solve_retry_count",
                "authoritative_model_endpoint_used",
                "piqd_data_root",
            },
            "receipt execution",
        )
        data_root = _string(execution["piqd_data_root"], "execution.piqd_data_root")
        pure_root = PurePosixPath(data_root)
        _fail(
            pure_root.is_absolute()
            and pure_root != PurePosixPath("/")
            and str(pure_root) == data_root
            and "//" not in data_root
            and all(part not in {"", ".", ".."} for part in pure_root.parts[1:]),
            "receipt PIQD data root is not canonical",
        )
        _fail(
            _integer(execution["case_count"], "execution.case_count") == 12
            and _integer(execution["timeout_ms"], "execution.timeout_ms") == TIMEOUT_MS
            and _integer(execution["solve_retry_count"], "execution.solve_retry_count")
            == 0
            and type(execution["fresh_session_per_case_solver"]) is bool
            and execution["fresh_session_per_case_solver"] is True
            and type(execution["sequential"]) is bool
            and execution["sequential"] is True
            and type(execution["authoritative_model_endpoint_used"]) is bool
            and execution["authoritative_model_endpoint_used"] is False
            and _exact_json_equal(execution["solver_order"], list(SOLVERS))
            and _exact_json_equal(
                execution,
                {
                    "case_count": 12,
                    "solver_order": list(SOLVERS),
                    "fresh_session_per_case_solver": True,
                    "sequential": True,
                    "timeout_ms": TIMEOUT_MS,
                    "solve_retry_count": 0,
                    "authoritative_model_endpoint_used": False,
                    "piqd_data_root": data_root,
                },
            ),
            "receipt execution policy mismatch",
        )
        _fail(
            _exact_json_equal(top["claims"], FALSE_CLAIMS),
            "receipt diagnostic claims mismatch",
        )

        artifact_values = _object(
            top["artifacts"],
            {
                "manifest.json",
                "case_matrix.json",
                "results.json",
                "finite_nogoods.json",
                *(f"original:{case}" for case in CASE_NAMES),
            },
            "receipt artifacts",
        )
        for key, stored_name in {
            "manifest.json": "frozen-manifest.json",
            "case_matrix.json": "frozen-case_matrix.json",
            "results.json": "frozen-results.json",
            "finite_nogoods.json": "frozen-finite_nogoods.json",
            **{f"original:{case}": f"{case}.original.smt2" for case in CASE_NAMES},
        }.items():
            descriptor = _artifact_descriptor(
                artifact_values[key], stored_name, f"artifact {key}"
            )
            payload = captures[stored_name].payload
            _fail(
                descriptor["bytes"] == len(payload)
                and descriptor["sha256"] == _sha(payload),
                f"artifact {key} byte binding mismatch",
            )

        source = _object(
            top["current_source_observation"],
            {"hashes", "matches_frozen_sources", "source_entitlement"},
            "source observation",
        )
        current_hashes = {
            path: _sha(
                _read_bounded_relative(
                    repo_fd, path, cap=MAX_INPUT_BYTES, require_single_link=True
                )
            )
            for path in profile.source_hashes
        }
        _fail(
            _exact_json_equal(
                source,
                {
                    "hashes": current_hashes,
                    "matches_frozen_sources": current_hashes == profile.source_hashes,
                    "source_entitlement": False,
                },
            ),
            "current-source observation mismatch",
        )

        originals: dict[str, bytes] = {}
        normalized: dict[str, tuple[list[str], bytes, list[str]]] = {}
        for case, row in zip(CASE_NAMES, profile.case_matrix, strict=True):
            payload = captures[f"{case}.original.smt2"].payload
            _fail(
                _sha(payload) == row["smt_sha256"],
                f"original SMT2 hash mismatch: {case}",
            )
            commands, journal = normalize_script(payload)
            originals[case] = payload
            normalized[case] = (commands, journal, _declared_terms(commands))

        _fail(
            type(top["cases"]) is list and len(top["cases"]) == 12,
            "receipt cases must be exactly 12",
        )
        replayed_cases: list[dict[str, Any]] = []
        session_ids: set[str] = set()
        solver_identities: dict[str, tuple[str, str]] = {}
        for index, case in enumerate(CASE_NAMES):
            row = profile.case_matrix[index]
            case_obj = _object(
                top["cases"][index],
                {
                    "case",
                    "family",
                    "omitted_reason",
                    "original_sha256",
                    "journal_bytes",
                    "journal_sha256",
                    "commands",
                    "get_values",
                    "engines",
                    "verdict",
                },
                "receipt case",
            )
            commands, journal, terms = normalized[case]
            _fail(
                case_obj["case"] == case
                and case_obj["family"] == row["family"]
                and case_obj["omitted_reason"] == row["omitted_reason"]
                and case_obj["original_sha256"] == _sha(originals[case])
                and _integer(case_obj["journal_bytes"], "case.journal_bytes")
                == len(journal)
                and case_obj["journal_sha256"] == _sha(journal)
                and _integer(case_obj["commands"], "case.commands") == len(commands)
                and case_obj["get_values"] == terms,
                "receipt case source/journal binding mismatch",
            )
            engines_obj = _object(case_obj["engines"], set(SOLVERS), "case engines")
            engines = {
                solver: _validate_replay_engine(
                    engines_obj[solver],
                    case=case,
                    solver=solver,
                    commands=commands,
                    journal=journal,
                    terms=terms,
                    shell_distribution=profile.shell_distribution,
                    data_root=data_root,
                    export=captures[f"{case}.{solver}.journal.smt2"],
                )
                for solver in SOLVERS
            }
            for solver, engine in engines.items():
                session = engine["session"]
                _fail(
                    session["id"] not in session_ids,
                    "replay sessions are not fresh per case and solver",
                )
                session_ids.add(session["id"])
                identity = (session["solver_sha256"], session["solver_signature"])
                previous = solver_identities.setdefault(solver, identity)
                _fail(previous == identity, "solver identity changed between sessions")
            verdict = _case_verdict(case, engines)
            _fail(
                case_obj["verdict"] == verdict,
                "stored case verdict disagrees with replay",
            )
            replayed_cases.append({"case": case, "verdict": verdict})

        _fail(
            len(set(solver_identities.values())) == len(SOLVERS),
            "distinct solvers share one binary identity",
        )
        names_after = os.listdir(output_fd)
        _fail(
            len(names_after) == len(set(names_after))
            and set(names_after) == expected_names,
            "output directory changed during replay",
        )
        _fail(
            _file_identity(os.fstat(output_fd)) == directory_before,
            "output directory changed during replay",
        )
        for capture in captures.values():
            _fail(
                _file_identity(os.fstat(capture.descriptor)) == capture.identity,
                "replay artifact changed after capture",
            )
        return {
            "schema": SCHEMA,
            "status": STATUS,
            "namespace": profile.namespace,
            "receipt_sha256": top["receipt_sha256"],
            "source_matches_frozen": source["matches_frozen_sources"],
            "cases": replayed_cases,
        }
    except FreshThirdSmtSessionError:
        raise
    except Exception as exc:
        raise FreshThirdSmtSessionError(
            f"FreshThird output replay failed: {type(exc).__name__}"
        ) from exc
    finally:
        for capture in captures.values():
            os.close(capture.descriptor)
        if repo_fd is not None:
            os.close(repo_fd)
        if output_fd is not None:
            os.close(output_fd)


def _run_engine(
    *,
    case: str,
    solver: str,
    commands: list[str],
    journal: bytes,
    terms: list[str],
    shell_distribution: bool,
    json_transport: JsonHttpTransport,
    download_transport: DescriptorDownloadTransport,
    output_fd: int,
    piqd_data_root: str,
    piqd_data_root_fd: int,
) -> Mapping[str, Any]:
    label = f"P97 FreshThird {case} {solver} finite diagnostic"
    created = _session(
        _json_request(
            json_transport,
            "POST",
            "/sessions",
            {"solver": solver, "lane": "smt", "label": label},
            expected_status=201,
        ),
        solver=solver,
        state="live",
        solves=0,
        last_status=None,
        data_root=piqd_data_root,
        data_root_fd=piqd_data_root_fd,
    )
    session_id = created["id"]
    _fail(
        created["clauses"] == 0 and created["label"] == label,
        "fresh SMT session is not empty or correctly labeled",
    )
    closed: Mapping[str, Any] | None = None
    solve: dict[str, Any] | None = None
    receipt: dict[str, Any] | None = None
    result: dict[str, Any] | None = None
    try:
        asserted = _assert_response(
            _json_request(
                json_transport,
                "POST",
                f"/sessions/{session_id}/assert",
                {"commands": commands, "expect_commands": 0},
            ),
            len(commands),
        )
        export_name = f"{case}.{solver}.journal.smt2"
        exported = _capture_download(
            output_fd, export_name, f"/sessions/{session_id}/smt2", download_transport
        )
        _fail(
            exported["payload"] == journal,
            "PIQD /smt2 export is not the normalized assertion journal",
        )
        before = _receipt_list(
            _json_request(json_transport, "GET", f"/sessions/{session_id}/receipts"),
            session_id=session_id,
            data_root=piqd_data_root,
            data_root_fd=piqd_data_root_fd,
        )
        _fail(
            before["session_id"] == session_id
            and before["journal_path"] == created["journal_path"]
            and before["count"] == 0,
            "fresh session already has receipts or changed journal identity",
        )
        request = {
            "assumptions": [],
            "timeout_ms": TIMEOUT_MS,
            "include_model": True,
            "get_values": terms,
        }
        solve_error: _PiqdJsonTransportLoss | None = None
        solve_protocol_error: FreshThirdSmtSessionError | None = None
        try:
            solve = _solve_response(
                _json_request(
                    json_transport, "POST", f"/sessions/{session_id}/solve", request
                )
            )
        except _PiqdJsonTransportLoss as exc:
            solve_error = exc
        except FreshThirdSmtSessionError as exc:
            solve_protocol_error = exc
        after = _receipt_list(
            _json_request(json_transport, "GET", f"/sessions/{session_id}/receipts"),
            session_id=session_id,
            data_root=piqd_data_root,
            data_root_fd=piqd_data_root_fd,
        )
        _fail(
            after["session_id"] == session_id
            and after["journal_path"] == created["journal_path"]
            and after["receipts_path"] == before["receipts_path"]
            and after["count"] in {0, 1},
            "solve receipt count or identity is invalid",
        )
        if after["count"] == 1:
            receipt = _strict_receipt(
                after["receipts"][0],
                session=created,
                commands=commands,
                journal=journal,
                terms=terms,
            )
            if solve is None and solve_protocol_error is None:
                solve = _receipt_as_solve(receipt)
            elif solve is not None:
                _fail(
                    _solve_matches_receipt(solve, receipt),
                    "solve response disagrees with durable receipt",
                )
        elif solve is not None:
            raise FreshThirdSmtSessionError("successful solve has no durable receipt")
        if solve_protocol_error is not None:
            raise solve_protocol_error
        # No retry: POST /solve is non-idempotent.  An unreceipted loss is UNKNOWN.
        if solve is None:
            result = {
                "effective_status": "UNKNOWN",
                "response_loss": True,
                "reconciled_from_receipt": False,
                "error": type(solve_error).__name__
                if solve_error
                else "MissingReceipt",
            }
        else:
            result = {
                "effective_status": solve["status"],
                "response_loss": solve_error is not None,
                "reconciled_from_receipt": solve_error is not None
                and receipt is not None,
                "solve": solve,
                "receipt": receipt,
            }
            if solve["status"] == "SAT":
                try:
                    values = _readback_values(solve["values"], terms)
                    _fail(
                        _model_has_definition(solve["model"]),
                        "SAT model is semantically empty",
                    )
                    readback = _validate_p97(
                        case,
                        values,
                        shell_distribution=shell_distribution,
                    )
                    _fail(bool(solve["model"].strip()), "SAT model is empty")
                except Exception as exc:  # noqa: BLE001 - any malformed SAT witness is UNKNOWN
                    readback = {"valid": False, "normalized_error": type(exc).__name__}
                result["readback"] = readback
                if readback.get("valid") is not True:
                    result["effective_status"] = "UNKNOWN"
        result["session"] = created
        result["assert"] = asserted
        result["export"] = {
            key: value for key, value in exported.items() if key != "payload"
        }
        result["receipts_response"] = after
        return result
    finally:
        try:
            deleted = _json_request(json_transport, "DELETE", f"/sessions/{session_id}")
            expected_status = None
            expected_solves = 0
            if solve is not None:
                expected_status = solve["status"]
                expected_solves = 1
            elif receipt is not None:
                expected_status = receipt["status"]
                expected_solves = 1
            closed = _session(
                deleted,
                solver=solver,
                state="closed",
                solves=expected_solves,
                last_status=expected_status,
                data_root=piqd_data_root,
                data_root_fd=piqd_data_root_fd,
            )
            _fail(
                closed["id"] == session_id
                and closed["solver_sha256"] == created["solver_sha256"]
                and closed["solver_signature"] == created["solver_signature"]
                and closed["clauses"] == len(commands),
                "closed session identity or command count mismatch",
            )
            if result is not None:
                result["closed_session"] = closed
        except Exception as exc:
            if isinstance(exc, FreshThirdSmtSessionError):
                raise
            raise FreshThirdSmtSessionError("PIQD session cleanup failed") from exc


def run_freshthird_smt_session(
    *,
    output_dir: Path,
    piqd_data_root: Path,
    json_transport: JsonHttpTransport,
    download_transport: DescriptorDownloadTransport,
    frozen_root: Path = DEFAULT_FROZEN_ROOT,
    repo_root: Path = REPO_ROOT,
) -> FreshThirdRunResult:
    """Run all 12 cases, strictly Z3 then cvc5, into a create-once directory."""

    frozen_fd: int | None = None
    repo_fd: int | None = None
    piqd_data_root_fd: int | None = None
    piqd_data_root_text: str | None = None
    try:
        frozen_fd = _open_directory_nofollow(frozen_root)
        repo_fd = _open_directory_nofollow(repo_root)
        piqd_data_root_text, piqd_data_root_fd = _open_piqd_data_root(piqd_data_root)
    except FreshThirdSmtSessionError:
        if frozen_fd is not None:
            os.close(frozen_fd)
        if repo_fd is not None:
            os.close(repo_fd)
        if piqd_data_root_fd is not None:
            os.close(piqd_data_root_fd)
        raise
    except OSError as exc:
        if frozen_fd is not None:
            os.close(frozen_fd)
        if repo_fd is not None:
            os.close(repo_fd)
        if piqd_data_root_fd is not None:
            os.close(piqd_data_root_fd)
        raise FreshThirdSmtSessionError("cannot authenticate input directory") from exc
    output_fd: int | None = None
    try:
        profile, matrix, frozen, originals, normalized = _load_authenticated_wave(
            frozen_fd
        )
        _fail(
            piqd_data_root_text is not None and piqd_data_root_fd is not None,
            "PIQD data root authentication was lost",
        )
        current_source_hashes = {
            path: _sha(_read_bounded_relative(repo_fd, path, cap=MAX_INPUT_BYTES))
            for path in profile.source_hashes
        }
        output_fd = _reserve_output(output_dir)
        artifacts: dict[str, Mapping[str, Any]] = {}
        for name, payload in frozen.items():
            artifacts[name] = _write_immutable_at(output_fd, f"frozen-{name}", payload)
        for case, payload in originals.items():
            artifacts[f"original:{case}"] = _write_immutable_at(
                output_fd, f"{case}.original.smt2", payload
            )
        case_results: list[Mapping[str, Any]] = []
        for case_row in matrix:
            case = case_row["case"]
            commands, journal, terms = normalized[case]
            engines: dict[str, Mapping[str, Any]] = {}
            for solver in SOLVERS:
                engines[solver] = _run_engine(
                    case=case,
                    solver=solver,
                    commands=commands,
                    journal=journal,
                    terms=terms,
                    shell_distribution=profile.shell_distribution,
                    json_transport=json_transport,
                    download_transport=download_transport,
                    output_fd=output_fd,
                    piqd_data_root=piqd_data_root_text,
                    piqd_data_root_fd=piqd_data_root_fd,
                )
            case_results.append(
                {
                    "case": case,
                    "family": case_row["family"],
                    "omitted_reason": case_row["omitted_reason"],
                    "original_sha256": _sha(originals[case]),
                    "journal_bytes": len(journal),
                    "journal_sha256": _sha(journal),
                    "commands": len(commands),
                    "get_values": terms,
                    "engines": engines,
                    "verdict": _case_verdict(case, engines),
                }
            )
        unsigned = {
            "schema": SCHEMA,
            "status": STATUS,
            "frozen": {
                "namespace": profile.namespace,
                "manifest_sha256": profile.manifest_sha256,
                "case_matrix_sha256": profile.case_matrix_sha256,
                "crosssolver_sha256": profile.crosssolver_sha256,
                "finite_nogoods_sha256": profile.finite_nogoods_sha256,
                "schema_sha256": profile.schema_sha256,
                "source_hashes": profile.source_hashes,
            },
            "current_source_observation": {
                "hashes": current_source_hashes,
                "matches_frozen_sources": current_source_hashes
                == profile.source_hashes,
                "source_entitlement": False,
            },
            "execution": {
                "case_count": 12,
                "solver_order": list(SOLVERS),
                "fresh_session_per_case_solver": True,
                "sequential": True,
                "timeout_ms": TIMEOUT_MS,
                "solve_retry_count": 0,
                "authoritative_model_endpoint_used": False,
                "piqd_data_root": piqd_data_root_text,
            },
            "claims": FALSE_CLAIMS,
            "artifacts": artifacts,
            "cases": case_results,
        }
        receipt = dict(unsigned)
        receipt["receipt_sha256"] = _sha(_canonical(unsigned))
        _write_immutable_at(output_fd, "receipt.json", _canonical(receipt) + b"\n")
        return FreshThirdRunResult(output_dir=output_dir, receipt=receipt)
    except FreshThirdSmtSessionError:
        raise
    except Exception as exc:
        raise FreshThirdSmtSessionError(
            f"FreshThird SMT-session adapter failed: {type(exc).__name__}"
        ) from exc
    finally:
        if output_fd is not None:
            os.close(output_fd)
        if repo_fd is not None:
            os.close(repo_fd)
        if frozen_fd is not None:
            os.close(frozen_fd)
        if piqd_data_root_fd is not None:
            os.close(piqd_data_root_fd)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--check", type=Path)
    parser.add_argument("--repo-root", type=Path, default=REPO_ROOT)
    parser.add_argument("--base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--frozen-root", type=Path, default=DEFAULT_FROZEN_ROOT)
    parser.add_argument("--piqd-data-root", type=Path)
    args = parser.parse_args(argv)
    try:
        if args.check is not None:
            _fail(args.output is None, "--check and --output are mutually exclusive")
            summary = validate_freshthird_smt_session_output(
                args.check, repo_root=args.repo_root
            )
        else:
            _fail(
                args.output is not None, "--output is required unless --check is used"
            )
            _fail(
                args.piqd_data_root is not None,
                "--piqd-data-root is required unless --check is used",
            )
            json_transport = UrllibJsonTransport(args.base_url, request_timeout_s=55.0)
            download_transport = UrllibDescriptorDownloadTransport(
                args.base_url, timeout_s=55.0
            )
            result = run_freshthird_smt_session(
                output_dir=args.output,
                piqd_data_root=args.piqd_data_root,
                json_transport=json_transport,
                download_transport=download_transport,
                frozen_root=args.frozen_root,
                repo_root=args.repo_root,
            )
            summary = {
                "output_dir": str(result.output_dir),
                "receipt_sha256": result.receipt["receipt_sha256"],
                "status": result.receipt["status"],
            }
    except FreshThirdSmtSessionError as exc:
        parser.error(str(exc))
    print(json.dumps(summary, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
