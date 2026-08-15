#!/usr/bin/env python3
"""Run or independently revalidate the bounded ATAIL PIQD live canaries."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path

import sympy as sp

from census.atail_force import piqd_cvc5_adapter as adapter
from census.atail_force import producer_geometry as geometry
from census.p97_search import phase3_piqd_smt_source_adapter as neutral

ROOT = Path("scratch/p97-atail-geometry-piqd-live-20260811-v1")
SERVER = "http://127.0.0.1:7272"
TIMEOUT_MS = 1_000
MAX_CONTROL_BYTES = 1 << 20


class CanaryError(RuntimeError):
    """The live canary or its independent validation failed closed."""


def _require(condition: bool, message: str) -> None:
    if not condition:
        raise CanaryError(message)


def _canonical(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=False,
        allow_nan=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _strict_json(payload: bytes, label: str) -> object:
    _require(0 < len(payload) <= MAX_CONTROL_BYTES, f"{label} has invalid size")

    def object_pairs(pairs: list[tuple[str, object]]) -> dict[str, object]:
        result: dict[str, object] = {}
        for key, value in pairs:
            _require(key not in result, f"{label} contains duplicate JSON keys")
            result[key] = value
        return result

    try:
        value = json.loads(payload, object_pairs_hook=object_pairs)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise CanaryError(f"{label} is not strict JSON") from exc
    return value


def _write_all(fd: int, payload: bytes) -> None:
    view = memoryview(payload)
    while view:
        written = os.write(fd, view)
        _require(written > 0, "short immutable artifact write")
        view = view[written:]


def _write_once(directory_fd: int, name: str, payload: bytes) -> dict[str, object]:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    descriptor = os.open(name, flags, 0o600, dir_fd=directory_fd)
    try:
        _write_all(descriptor, payload)
        os.fsync(descriptor)
        status = os.fstat(descriptor)
        _require(status.st_nlink == 1, f"{name} is hardlinked")
        _require(status.st_size == len(payload), f"{name} has wrong size")
    finally:
        os.close(descriptor)
    os.fsync(directory_fd)
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _open_directory(parent_fd: int, name: str) -> int:
    flags = os.O_RDONLY | os.O_DIRECTORY
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    return os.open(name, flags, dir_fd=parent_fd)


def _make_directory(parent_fd: int, name: str) -> int:
    os.mkdir(name, 0o700, dir_fd=parent_fd)
    os.fsync(parent_fd)
    return _open_directory(parent_fd, name)


def _blueprint(case_id: str) -> geometry.GeometryBlueprint:
    a, b, c, d, e = ("0", "1", "2", "3", "4")
    return geometry.GeometryBlueprint(
        case_id=case_id,
        labels=(a, b, c, d, e),
        cyclic_order=(a, b, c, d, e),
        surplus_apex=a,
        opp_apex1=b,
        opp_apex2=c,
        surplus_cap=frozenset((b, c)),
        opp_cap1=frozenset((a, c)),
        opp_cap2=frozenset((a, b)),
        exact_classes=(
            geometry.ExactClassSpec(b, "exact_1", (a, c, d, e)),
            geometry.ExactClassSpec(c, "exact_2", (a, b, d, e)),
        ),
        pinned_k4_rows=(
            geometry.PinnedK4Row(b, "k4_1", (a, c, d, e)),
            geometry.PinnedK4Row(c, "k4_2", (a, b, d, e)),
        ),
    )


def _sat_system() -> geometry.GeometrySystem:
    x, y = sp.symbols("x y", real=True)
    atoms = (
        geometry.NamedPolynomialAtom(
            "eq_atom", "fixture", "eq", (x - 1,), "fixture:eq"
        ),
        geometry.NamedPolynomialAtom("ge_atom", "fixture", "ge", (y,), "fixture:ge"),
        geometry.NamedPolynomialAtom("gt_atom", "fixture", "gt", (x,), "fixture:gt"),
        geometry.NamedPolynomialAtom(
            "ne_atom", "fixture", "ne", (y - 2,), "fixture:ne"
        ),
        geometry.NamedPolynomialAtom(
            "or_ne_atom",
            "fixture",
            "or_ne",
            (x - 1, y - 1),
            "fixture:or_ne",
        ),
    )
    return geometry.GeometrySystem(
        _blueprint("tiny-atail-sat-canary"),
        (x, y),
        atoms,
        geometry.OMITTED_LEDGER,
    )


def _unsat_system() -> geometry.GeometrySystem:
    z = sp.symbols("z", real=True)
    atoms = (
        geometry.NamedPolynomialAtom("z_is_1", "fixture", "eq", (z - 1,), "fixture:z1"),
        geometry.NamedPolynomialAtom("z_is_2", "fixture", "eq", (z - 2,), "fixture:z2"),
    )
    return geometry.GeometrySystem(
        _blueprint("tiny-atail-unsat-control"),
        (z,),
        atoms,
        geometry.OMITTED_LEDGER,
    )


def _get_raw(
    transport: neutral.UrllibPiqdTransport, path: str, label: str
) -> tuple[bytes, object]:
    response = transport.request_bytes("GET", path)
    _require(type(response.status) is int and response.status == 200, f"{label} failed")
    _require(type(response.body) is bytes, f"{label} returned nonbytes")
    return response.body, _strict_json(response.body, label)


def _gate_sessions(value: object, label: str) -> dict[str, int]:
    _require(
        type(value) is dict and set(value) == {"live", "sessions"}, f"{label} schema"
    )
    live = value["live"]
    sessions = value["sessions"]
    _require(type(live) is int and live == 0, f"{label} has live sessions")
    _require(type(sessions) is list, f"{label} sessions are invalid")
    counts: dict[str, int] = {}
    for session in sessions:
        _require(type(session) is dict, f"{label} session is invalid")
        state = session.get("state")
        _require(state in {"closed", "detached"}, f"{label} has nonterminal state")
        counts[state] = counts.get(state, 0) + 1
    return counts


def _validate_one(root_fd: int, name: str) -> dict[str, object]:
    descriptor = _open_directory(root_fd, name)
    try:
        return adapter.validate_run_directory(descriptor)
    finally:
        os.close(descriptor)


def _validate_expected(name: str, result: dict[str, object]) -> None:
    claims = result["claims"]
    _require(
        type(claims) is dict and claims and not any(claims.values()), f"{name} claims"
    )
    _require(result["core_entitlement"] is False, f"{name} core entitlement")
    _require(result["proof_blueprint"] == adapter.PROOF_BLUEPRINT, f"{name} blueprint")
    engine = result["engine"]
    _require(engine["solver"] == "cvc5", f"{name} solver")
    _require(engine["solve_index"] == 1, f"{name} solve index")
    _require(engine["unsat_assumptions"] is None, f"{name} assumptions")
    if name == "sat":
        _require(result["raw_status"] == "SAT", "SAT canary raw status")
        _require(
            result["effective_status"] == "SAT_SEMANTICALLY_REPLAYED",
            "SAT canary semantic status",
        )
        _require(
            result["classification"] == "SAT_EXACT_RATIONAL_REPLAY",
            "SAT canary classification",
        )
        evidence = engine["semantic_replay"]["evidence"]
        _require(evidence["atom_count"] == 5, "SAT canary atom replay count")
    else:
        _require(result["raw_status"] == "UNSAT", "UNSAT control raw status")
        _require(
            result["effective_status"] == "UNSAT_DISCOVERY_ONLY",
            "UNSAT control effective status",
        )
        _require(
            result["classification"] == "UNSAT_DISCOVERY_ONLY",
            "UNSAT control classification",
        )
        _require(engine["semantic_replay"] is None, "UNSAT control semantic replay")
        _require(engine["named_core_support"] is False, "UNSAT named core support")


def _run() -> dict[str, object]:
    root_fd = os.open(ROOT, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        _require(os.listdir(root_fd) == [], "live output root is not empty")
        transport = neutral.UrllibPiqdTransport(
            SERVER,
            http_timeout_s=neutral.bounded_solve_http_timeout_s(TIMEOUT_MS),
        )
        evidence: dict[str, dict[str, object]] = {}
        control: dict[str, bytes] = {}
        parsed: dict[str, object] = {}
        for key, path in (
            ("version_pre", "/version"),
            ("solvers_pre", "/solvers"),
            ("sessions_pre", "/sessions"),
        ):
            control[key], parsed[key] = _get_raw(transport, path, key)
            evidence[key] = _write_once(root_fd, f"{key}.raw.json", control[key])
        pre_counts = _gate_sessions(parsed["sessions_pre"], "sessions_pre")

        used_session_ids: set[str] = set()
        results: dict[str, dict[str, object]] = {}
        for name, system in (("sat", _sat_system()), ("unsat", _unsat_system())):
            prepared = adapter.prepare_geometry_query(system, timeout_ms=TIMEOUT_MS)
            adapter.validate_prepared_query(prepared)
            output_fd = _make_directory(root_fd, name)
            try:
                adapter.run_prepared_query(
                    prepared,
                    transport=transport,
                    output_fd=output_fd,
                    used_session_ids=used_session_ids,
                )
            finally:
                os.close(output_fd)
            results[name] = _validate_one(root_fd, name)
            _validate_expected(name, results[name])

        _require(len(used_session_ids) == 2, "session identities were not fresh")
        for key, path in (
            ("version_post", "/version"),
            ("solvers_post", "/solvers"),
            ("sessions_post", "/sessions"),
        ):
            control[key], parsed[key] = _get_raw(transport, path, key)
            evidence[key] = _write_once(root_fd, f"{key}.raw.json", control[key])
        post_counts = _gate_sessions(parsed["sessions_post"], "sessions_post")
        _require(control["version_pre"] == control["version_post"], "daemon drifted")
        _require(control["solvers_pre"] == control["solvers_post"], "registry drifted")

        summary = {
            "schema": "p97-atail-geometry-piqd-live-canary/v1",
            "server": SERVER,
            "timeout_ms": TIMEOUT_MS,
            "session_ids": sorted(used_session_ids),
            "session_counts_pre": pre_counts,
            "session_counts_post": post_counts,
            "control_artifacts": evidence,
            "runs": {
                name: {
                    "query_id": results[name]["query_id"],
                    "raw_status": results[name]["raw_status"],
                    "effective_status": results[name]["effective_status"],
                    "classification": results[name]["classification"],
                    "core_entitlement": results[name]["core_entitlement"],
                    "session_id": results[name]["engine"]["session_id"],
                }
                for name in ("sat", "unsat")
            },
            "claims": {
                "named_core": False,
                "source_entitlement": False,
                "proof": False,
                "theorem": False,
                "global": False,
                "universal": False,
                "lean": False,
            },
        }
        summary_bytes = _canonical(summary) + b"\n"
        _write_once(root_fd, "live-summary.json", summary_bytes)
        return summary
    finally:
        os.close(root_fd)


def _check() -> dict[str, object]:
    root_fd = os.open(ROOT, os.O_RDONLY | os.O_DIRECTORY | os.O_NOFOLLOW)
    try:
        results = {name: _validate_one(root_fd, name) for name in ("sat", "unsat")}
        for name, result in results.items():
            _validate_expected(name, result)
        summary_fd = os.open(
            "live-summary.json", os.O_RDONLY | os.O_NOFOLLOW, dir_fd=root_fd
        )
        try:
            summary_raw = os.read(summary_fd, MAX_CONTROL_BYTES + 1)
        finally:
            os.close(summary_fd)
        summary = _strict_json(summary_raw, "live-summary")
        _require(_canonical(summary) + b"\n" == summary_raw, "summary is not canonical")
        _require(
            summary["runs"]["sat"]["session_id"]
            == results["sat"]["engine"]["session_id"],
            "SAT session binding mismatch",
        )
        _require(
            summary["runs"]["unsat"]["session_id"]
            == results["unsat"]["engine"]["session_id"],
            "UNSAT session binding mismatch",
        )
        return summary
    finally:
        os.close(root_fd)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    summary = _check() if args.check else _run()
    print(
        json.dumps(
            {
                "schema": summary["schema"],
                "runs": summary["runs"],
                "claims": summary["claims"],
            },
            sort_keys=True,
            separators=(",", ":"),
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
