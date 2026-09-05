"""PIQD-only coverage probe for unresolved exact-five abstract orders.

This lane consumes only the authenticated parent order census.  It adds the
finite avoidance of each direct and reversed seven-role cyclic pattern and
does not assert source exhaustiveness, Euclidean realizability, or a theorem.
The default entrypoint is a read-only readiness check; a campaign is not
launched until a later reviewed invocation explicitly enables it.
"""

from __future__ import annotations

import argparse
import copy
import hashlib
import itertools
import json
import re
import sys
import threading
from collections import Counter
from collections.abc import Mapping, Sequence
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path, PurePosixPath
from typing import Any, Literal

from census.card_head import exactfive_hard_source_swap_order_piqd as parent
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-profile0034-seven-order-coverage-piqd-r2-20260904"
RUN_ID = "run-0001"
RUN_OWNER = "profile0034-seven-order-coverage-piqd-r2"
PARENT_ROOT = (
    parent.REPOSITORY_ROOT
    / "scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001"
)
RUN_ROOT = parent.REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
BASE_HEAD = "63f94bd80d720ff2ed6c78f23c96514ca4d99ac1"
MAX_WORKERS = 20
EXPECTED_UNRESOLVED = 212
EXPECTED_PARENT_PROFILES = 2_798
PARENT_LANE = "exactfive-hard-source-swap-order-piqd-r2-20260902"
PARENT_BASE_HEAD = "2cb876f87c94e9a0a1e3c6b48973e03fc2aedc1b"
CONTROL_IDS = ("positive", "negative")
FALSE_CLAIMS = {
    "alias_exhaustiveness_in_lean": False,
    "live_closure": False,
    "promotion": False,
    "source_realizability_of_sat": False,
    "theorem": False,
}
PRODUCER_VERSION = "p97-exactfive-profile0034-seven-order-coverage-piqd/v1"
SYSTEM_SCHEMA = "p97-exactfive-profile0034-seven-order-coverage-system/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-seven-order-coverage-terminal/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-seven-order-coverage-launch/v1"
_KEY = re.compile(r"^profile-(\d{4})-([0-9a-f]{20})$")
_HEX64 = re.compile(r"^[0-9a-f]{64}$")


class SevenOrderCoverageError(RuntimeError):
    """A malformed, stale, or unsupported parent/query artifact."""


def _canonical(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=True, sort_keys=True, separators=(",", ":")).encode("ascii")


def _json_bytes(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def normalize_workers(value: int) -> int:
    if type(value) is not int or value < 1:
        raise SevenOrderCoverageError("workers must be positive")
    return min(value, MAX_WORKERS)


def _role_class(system: Mapping[str, Any]) -> dict[str, str]:
    roles = system.get("role_class")
    if type(roles) is not dict:
        raise SevenOrderCoverageError("parent role classes are malformed")
    return {str(k): str(v) for k, v in roles.items()}


def cyclic_order_term(ranks: Sequence[str]) -> str:
    """SMT term saying that seven distinct ranks occur in cyclic order.

    A rotation of the listed roles is strictly increasing in the anchored
    linear cut exactly when the listed ranks have that cyclic order.
    """
    if len(ranks) < 2 or len(set(ranks)) != len(ranks):
        return "false"
    branches: list[str] = []
    for pivot in range(len(ranks)):
        rotated = tuple(ranks[pivot:]) + tuple(ranks[:pivot])
        branches.append(
            "(and " + " ".join(
                f"(< {parent._rank_term(left)} {parent._rank_term(right)})"
                for left, right in itertools.pairwise(rotated)
            ) + ")"
        )
    return "(or " + " ".join(branches) + ")"


def pattern_role_choices() -> tuple[tuple[str, str], ...]:
    return tuple(itertools.product(("p", "q"), ("s", "t")))


def avoidance_patterns(system: Mapping[str, Any]) -> tuple[dict[str, Any], ...]:
    role_class = _role_class(system)
    answer: list[dict[str, Any]] = []
    for p_choice, s_choice in pattern_role_choices():
        roles = ("c1", p_choice, s_choice, "a", "d", "c2", "O")
        classes = tuple(role_class[role] for role in roles)
        answer.append({
            "roles": list(roles),
            "classes": list(classes),
            "admissible": len(set(classes)) == len(classes),
        })
    return tuple(answer)


def avoidance_assertions(system: Mapping[str, Any]) -> tuple[str, ...]:
    assertions: list[str] = []
    for item in avoidance_patterns(system):
        if not item["admissible"]:
            continue
        ranks = tuple(item["classes"])
        direct = cyclic_order_term(ranks)
        reverse = cyclic_order_term((ranks[0], *reversed(ranks[1:])))
        assertions.append(f"(assert (not (or {direct} {reverse})))")
    return tuple(assertions)


def build_coverage_system(index: int) -> dict[str, Any]:
    indexed = parent.indexed_profiles()
    if type(index) is not int or not 0 <= index < len(indexed):
        raise SevenOrderCoverageError("profile index is out of range")
    _actual, profile = indexed[index]
    system = copy.deepcopy(parent.build_profile_system(index, profile))
    patterns = avoidance_patterns(system)
    system["schema"] = SYSTEM_SCHEMA
    system["coverage_parent"] = {
        "lane_id": PARENT_LANE,
        "run_id": "run-0001",
        "profile_index": index,
        "profile_sha256": profile.profile_id,
    }
    system["avoidance_patterns"] = list(patterns)
    system["claims"] = dict(FALSE_CLAIMS)
    return system


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    base_system = copy.deepcopy(dict(system))
    base_system["schema"] = parent.SYSTEM_SCHEMA
    base_system.pop("coverage_parent", None)
    base_system.pop("avoidance_patterns", None)
    base_system["claims"] = dict(parent.FALSE_CLAIMS)
    return tuple(parent.build_smt_commands(base_system)) + avoidance_assertions(system)


def _snapshots(source_record: Mapping[str, Any]) -> tuple[adapter.SourceSnapshot, ...]:
    paths = (
        ("implementation-coverage-producer.py", Path(__file__).resolve()),
        ("implementation-parent-order-producer.py", Path(parent.__file__).resolve()),
        ("implementation-piqd-adapter.py", Path(adapter.__file__).resolve()),
    )
    values = [adapter.SourceSnapshot("0000-source-record.json", _json_bytes(source_record))]
    values.extend(adapter.SourceSnapshot(name, path.read_bytes()) for name, path in paths)
    return tuple(sorted(values, key=lambda item: item.path))


def prepare_profile_query(index: int, *, timeout_ms: int = 30_000) -> parent.PreparedQuery:
    system = build_coverage_system(index)
    commands = build_smt_commands(system)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise SevenOrderCoverageError("SMT journal normalization drifted")
    profile = system["profile_sha256"]
    key = f"profile-{index:04d}-{profile[:20]}"
    source_record = {
        "schema": "p97-exactfive-profile0034-seven-order-coverage-source/v1",
        "producer_version": PRODUCER_VERSION,
        "key": key,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "journal_sha256": _sha(journal),
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _snapshots(source_record)
    class_ids = parent._class_ids(system)
    variables = [
        {"id": f"distance-{left}-{right}", "term": parent._distance_term(left, right), "sort": "Real"}
        for left, right in itertools.combinations(class_ids, 2)
    ]
    variables.extend({"id": f"rank-{item}", "term": parent._rank_term(item), "sort": "Int"} for item in class_ids)
    variables.sort(key=lambda item: item["id"])
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "key": key,
        "system": system,
        "system_sha256": _sha(_canonical(system)),
        "journal_sha256": _sha(journal),
        "claims": dict(FALSE_CLAIMS),
    }
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {"id": "p97-exactfive-profile0034-seven-order-coverage", "version": "v1"},
        "semantic_verifier": {"id": "exactfive-profile0034-seven-order-coverage-replay", "version": "v1"},
        "stage_id": "seven-order-coverage",
        "query_id": key,
        "sources": [{"path": item.path, "bytes": len(item.payload), "sha256": _sha(item.payload)} for item in snapshots],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {"path": "query.smt2", "bytes": len(journal), "sha256": _sha(journal)},
        "variables": variables,
        "named_atoms": [],
        "solve": {"assumption_ids": [], "readback_variable_ids": [item["id"] for item in variables], "include_model": True},
        "solver_profile": {"schema": adapter.SOLVER_PROFILE_SCHEMA, "solvers": ["z3", "cvc5"], "timeout_ms": timeout_ms},
    }
    descriptor_bytes = _json_bytes(descriptor)
    query = adapter.SourceSemanticQuery(
        descriptor=descriptor,
        descriptor_bytes=descriptor_bytes,
        original_smt2=journal,
        journal_commands=commands,
        journal_smt2=journal,
        source_files=snapshots,
    )
    return parent.PreparedQuery(key=key, system=system, query=query)


def prepare_control_query(
    control: Literal["positive", "negative"], *, timeout_ms: int = 30_000
) -> parent.PreparedQuery:
    """Use the parent's hand-checkable controls without coverage atoms."""
    if control not in CONTROL_IDS:
        raise SevenOrderCoverageError("unknown control")
    return parent.prepare_control_query(control, timeout_ms=timeout_ms)


def _base_system(system: Mapping[str, Any]) -> dict[str, Any]:
    current = copy.deepcopy(dict(system))
    current["schema"] = parent.SYSTEM_SCHEMA
    current.pop("coverage_parent", None)
    current.pop("avoidance_patterns", None)
    current["claims"] = dict(parent.FALSE_CLAIMS)
    return current


def _coverage_system_current(system: object) -> dict[str, Any]:
    if type(system) is not dict or system.get("schema") != SYSTEM_SCHEMA:
        raise SevenOrderCoverageError("coverage semantic system schema is malformed")
    index = system.get("coverage_parent", {}).get("profile_index")
    if type(index) is not int:
        raise SevenOrderCoverageError("coverage profile index is malformed")
    expected = build_coverage_system(index)
    if system != expected:
        raise SevenOrderCoverageError("coverage semantic system disagrees with producer")
    return system


def _cyclic_holds(ranks: Mapping[str, int], classes: Sequence[str]) -> bool:
    if len(classes) < 2 or len(set(classes)) != len(classes):
        return False
    return any(
        all(ranks[left] < ranks[right] for left, right in itertools.pairwise(rotated))
        for pivot in range(len(classes))
        for rotated in (tuple(classes[pivot:]) + tuple(classes[:pivot]),)
    )


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    """Replay the parent arithmetic and every admissible coverage atom."""
    if solver not in {"z3", "cvc5"} or type(model) is not str or type(values) is not str:
        raise SevenOrderCoverageError("SAT replay received the wrong engine payload")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict:
        raise SevenOrderCoverageError("SAT replay semantic input is malformed")
    system = _coverage_system_current(semantic.get("system"))
    expected_hash = _sha(_canonical(system))
    if semantic.get("system_sha256") != expected_hash:
        raise SevenOrderCoverageError("SAT replay system hash mismatch")
    expected_journal = b"".join(command.encode("ascii") + b"\n" for command in build_smt_commands(system))
    if query.original_smt2 != expected_journal or query.journal_smt2 != expected_journal:
        raise SevenOrderCoverageError("SAT replay SMT journal mismatch")
    if semantic.get("journal_sha256") != _sha(expected_journal):
        raise SevenOrderCoverageError("SAT replay journal hash mismatch")
    readback = parent.parse_exact_readback(values, query.get_values)
    replay = parent.replay_assignment(_base_system(system), readback)
    evidence = {
        **replay.evidence,
        "system_sha256": expected_hash,
        "model_sha256": _sha(model.encode("utf-8")),
        "values_sha256": _sha(values.encode("utf-8")),
        "solver": solver,
    }
    if not replay.accepted:
        return adapter.SemanticVerification(False, evidence)
    ranks = {
        term.removeprefix("rank_"): int(value)
        for term, value in readback.items()
        if term.startswith("rank_")
    }
    checked = 0
    for item in system["avoidance_patterns"]:
        if not item["admissible"]:
            continue
        classes = tuple(item["classes"])
        direct = _cyclic_holds(ranks, classes)
        reverse = _cyclic_holds(ranks, (classes[0], *reversed(classes[1:])))
        checked += 1
        if direct or reverse:
            evidence["reason"] = "coverage_avoidance"
            evidence["coverage_avoidance_checked"] = checked
            evidence["coverage_avoidance_failure"] = item["roles"]
            return adapter.SemanticVerification(False, evidence)
    evidence["coverage_avoidance_checked"] = checked
    evidence["all_admissible_coverage_atoms_replayed"] = True
    return adapter.SemanticVerification(True, evidence)


_VERIFY_LOCK = threading.Lock()


def verify_terminal_directory(
    output_directory: Path, prepared: parent.PreparedQuery
) -> dict[str, Any]:
    """Verify a coverage artifact tree using the parent custody checker."""
    if prepared.system.get("schema") != SYSTEM_SCHEMA:
        return parent.verify_terminal_directory(output_directory, prepared)
    with _VERIFY_LOCK:
        old = parent.verify_sat_model
        parent.verify_sat_model = verify_sat_model
        try:
            return parent.verify_terminal_directory(output_directory, prepared)
        finally:
            parent.verify_sat_model = old


def _execute_profile(
    prepared: parent.PreparedQuery, output_directory: Path, *, server: str, timeout_ms: int
) -> dict[str, Any]:
    if output_directory.exists():
        return {**verify_terminal_directory(output_directory, prepared), "execution": "resumed_verified_terminal"}
    transport = adapter.UrllibPiqdTransport(
        server, http_timeout_s=adapter.bounded_solve_http_timeout_s(timeout_ms)
    )
    adapter.run_source_semantic_query(prepared.query, output_directory, transport, verify_sat_model)
    return {**verify_terminal_directory(output_directory, prepared), "execution": "fresh_piqd"}


def _manifest_hash(value: Mapping[str, Any], field: str) -> str:
    unsigned = {key: item for key, item in value.items() if key != field}
    return _sha(_canonical(unsigned))


def _load_json(path: Path) -> dict[str, Any]:
    try:
        value = json.loads(path.read_text())
    except (OSError, ValueError) as exc:
        raise SevenOrderCoverageError(f"cannot read JSON artifact {path}") from exc
    if type(value) is not dict:
        raise SevenOrderCoverageError(f"JSON artifact is not an object: {path}")
    return value


def _validate_parent_manifest() -> None:
    manifest = _load_json(PARENT_ROOT / "run_manifest.json")
    if manifest.get("schema") != "worktree-run-manifest/v1":
        raise SevenOrderCoverageError("parent run manifest schema drifted")
    if (
        manifest.get("lane_id") != PARENT_LANE
        or manifest.get("run_id") != "run-0001"
        or manifest.get("base_head") != PARENT_BASE_HEAD
        or manifest.get("root") != f"scratch/runs/{PARENT_LANE}/run-0001"
    ):
        raise SevenOrderCoverageError("parent run identity drifted")
    if manifest.get("manifest_sha256") != _manifest_hash(manifest, "manifest_sha256"):
        raise SevenOrderCoverageError("parent run manifest self-hash failed")
    digests = {**manifest.get("input_digests", {}), **manifest.get("source_digests", {})}
    if not digests:
        raise SevenOrderCoverageError("parent digest maps are empty")
    for relative, digest in digests.items():
        path = parent.REPOSITORY_ROOT / relative
        if not path.is_file() or path.is_symlink() or path.stat().st_nlink != 1 or path.stat().st_size > 96 * 1024 * 1024 or _sha(path.read_bytes()) != digest:
            raise SevenOrderCoverageError(f"parent source digest failed: {relative}")


def unresolved_parent_profiles() -> tuple[int, ...]:
    """Revalidate the parent terminal and return exactly its 212 unresolved indexes."""
    _validate_parent_manifest()
    launch = _load_json(PARENT_ROOT / "events" / "launch.json")
    timeout_ms = launch.get("timeout_ms")
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise SevenOrderCoverageError("parent launch timeout is malformed")
    if (
        launch.get("schema") != parent.LAUNCH_SCHEMA
        or launch.get("lane_id") != PARENT_LANE
        or launch.get("run_id") != "run-0001"
        or launch.get("run_manifest_sha256") != _load_json(PARENT_ROOT / "run_manifest.json")["manifest_sha256"]
        or launch.get("profile_stream_sha256") != parent.profile_stream_sha256()
        or launch.get("launch_sha256") != _manifest_hash(launch, "launch_sha256")
        or launch.get("claims") != dict(parent.FALSE_CLAIMS)
    ):
        raise SevenOrderCoverageError("parent launch custody binding failed")
    launch_profiles = launch.get("profiles")
    if (
        type(launch_profiles) is not list
        or len(launch_profiles) != EXPECTED_PARENT_PROFILES
        or [item.get("index") for item in launch_profiles] != list(range(EXPECTED_PARENT_PROFILES))
        or len({item.get("profile_sha256") for item in launch_profiles}) != EXPECTED_PARENT_PROFILES
        or [(item.get("index"), item.get("profile_sha256")) for item in launch_profiles]
        != [(index, profile.profile_id) for index, profile in parent.indexed_profiles()]
    ):
        raise SevenOrderCoverageError("parent launch profile census is incomplete")
    terminal = _load_json(PARENT_ROOT / "events" / "terminal.json")
    if (
        terminal.get("schema") != parent.TERMINAL_SCHEMA
        or terminal.get("lane_id") != PARENT_LANE
        or terminal.get("run_id") != "run-0001"
        or terminal.get("launch_sha256") != launch["launch_sha256"]
        or terminal.get("claims") != dict(parent.FALSE_CLAIMS)
        or terminal.get("summary", {}).get("profiles") != EXPECTED_PARENT_PROFILES
    ):
        raise SevenOrderCoverageError("parent terminal schema drifted")
    if terminal.get("terminal_sha256") != _manifest_hash(terminal, "terminal_sha256"):
        raise SevenOrderCoverageError("parent terminal self-hash failed")
    terminal_profiles = terminal.get("profiles")
    if (
        type(terminal_profiles) is not list
        or len(terminal_profiles) != EXPECTED_PARENT_PROFILES
        or len({item.get("key") for item in terminal_profiles}) != EXPECTED_PARENT_PROFILES
        or [item.get("key") for item in terminal_profiles]
        != [f"profile-{index:04d}-{profile.profile_id[:20]}" for index, profile in parent.indexed_profiles()]
    ):
        raise SevenOrderCoverageError("parent terminal profile census is incomplete")
    wanted: list[int] = []
    for item in terminal.get("profiles", []):
        key = item.get("key")
        match = _KEY.fullmatch(key) if type(key) is str else None
        if match is None:
            raise SevenOrderCoverageError("parent profile key malformed")
        index = int(match.group(1))
        engines = item.get("engines", [])
        statuses = tuple(engine.get("raw_status") for engine in engines)
        effective = tuple(engine.get("effective_status") for engine in engines)
        accepted_sat = statuses in (("SAT", "SAT"), ("SAT", "UNKNOWN")) and effective[0:1] == ("SAT_SEMANTICALLY_REPLAYED",)
        accepted_unknown = statuses == ("UNSAT", "UNKNOWN") and effective == ("UNSAT_DISCOVERY_ONLY", "INCONCLUSIVE_UNKNOWN")
        if not (accepted_sat or accepted_unknown):
            continue
        if accepted_unknown or accepted_sat:
            prepared = parent.prepare_profile_query(index, timeout_ms=timeout_ms)
            if prepared.key != key:
                raise SevenOrderCoverageError("parent profile key does not replay")
            directory = PARENT_ROOT / "artifacts" / "profiles" / key
            verified = parent.verify_terminal_directory(directory, prepared)
            if item.get("result_sha256") != verified["result_sha256"] or item.get("engines") != verified["engines"]:
                raise SevenOrderCoverageError("parent terminal result binding failed")
            wanted.append(index)
    if len(wanted) != EXPECTED_UNRESOLVED or len(set(wanted)) != len(wanted):
        raise SevenOrderCoverageError(f"parent unresolved profile count is {len(wanted)}, expected {EXPECTED_UNRESOLVED}")
    return tuple(sorted(wanted))


def terminal_record(
    results: Sequence[Mapping[str, Any]],
    controls: Sequence[Mapping[str, Any]],
    launch: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    record = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "parent_root": str(PARENT_ROOT.relative_to(parent.REPOSITORY_ROOT)),
        "profiles": [{"key": result["key"], "result_sha256": result["result_sha256"], "engines": result["engines"]} for result in results],
        "controls": [{"key": result["key"], "result_sha256": result["result_sha256"], "engines": result["engines"]} for result in controls],
        "summary": {"profiles": len(results), "engine_status_pairs": dict(sorted(Counter("/".join(engine["raw_status"] for engine in result["engines"]) for result in results).items()))},
        "claim_boundary": "finite abstract coverage diagnostic only",
        "claims": dict(FALSE_CLAIMS),
    }
    if launch is not None:
        record["launch_sha256"] = launch["launch_sha256"]
    record["terminal_sha256"] = _manifest_hash(record, "terminal_sha256")
    return record


def _load_run_manifest() -> dict[str, Any]:
    value = _load_json(RUN_ROOT / "run_manifest.json")
    if value.get("schema") != "worktree-run-manifest/v1":
        raise SevenOrderCoverageError("coverage run manifest schema drifted")
    if value.get("lane_id") != LANE_ID or value.get("run_id") != RUN_ID:
        raise SevenOrderCoverageError("coverage run identity drifted")
    if value.get("root") != f"scratch/runs/{LANE_ID}/{RUN_ID}":
        raise SevenOrderCoverageError("coverage run root drifted")
    if value.get("owner") != RUN_OWNER:
        raise SevenOrderCoverageError("coverage run owner drifted")
    if value.get("base_head") != BASE_HEAD:
        raise SevenOrderCoverageError("coverage run base head drifted")
    for field in ("input_digests", "source_digests"):
        digests = value.get(field)
        if type(digests) is not dict or not digests:
            raise SevenOrderCoverageError(f"coverage {field} is empty or malformed")
        for relative, expected in digests.items():
            if (
                type(relative) is not str
                or not relative
                or PurePosixPath(relative).is_absolute()
                or ".." in PurePosixPath(relative).parts
                or type(expected) is not str
                or _HEX64.fullmatch(expected) is None
            ):
                raise SevenOrderCoverageError(f"coverage {field} entry is malformed")
            path = parent.REPOSITORY_ROOT / relative
            try:
                path.relative_to(parent.REPOSITORY_ROOT)
            except ValueError as exc:
                raise SevenOrderCoverageError(f"coverage {field} path escapes repository") from exc
            if not path.is_file() or path.is_symlink() or path.stat().st_nlink != 1 or path.stat().st_size > 96 * 1024 * 1024:
                raise SevenOrderCoverageError(f"coverage {field} file is not regular: {relative}")
            if _sha(path.read_bytes()) != expected:
                raise SevenOrderCoverageError(f"coverage {field} digest drifted: {relative}")
    if value.get("manifest_sha256") != _manifest_hash(value, "manifest_sha256"):
        raise SevenOrderCoverageError("coverage run manifest self-hash failed")
    return value


def launch_record(
    indexes: Sequence[int],
    *,
    workers: int,
    timeout_ms: int,
    server: str,
    run_manifest_sha256: str,
) -> dict[str, Any]:
    profiles = parent.indexed_profiles()
    if tuple(indexes) != tuple(sorted(set(indexes))):
        raise SevenOrderCoverageError("launch indexes must be sorted and unique")
    if any(type(index) is not int or not 0 <= index < len(profiles) for index in indexes):
        raise SevenOrderCoverageError("launch profile index is out of range")
    value = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": run_manifest_sha256,
        "parent_lane_id": PARENT_LANE,
        "parent_run_id": "run-0001",
        "parent_terminal_sha256": _sha((PARENT_ROOT / "events" / "terminal.json").read_bytes()),
        "profile_stream_sha256": parent.profile_stream_sha256(),
        "profiles": [{"index": index, "key": f"profile-{index:04d}-{profiles[index][1].profile_id[:20]}", "profile_sha256": profiles[index][1].profile_id} for index in indexes],
        "controls": list(CONTROL_IDS),
        "workers": normalize_workers(workers),
        "timeout_ms": timeout_ms,
        "server": server,
        "claims": dict(FALSE_CLAIMS),
    }
    value["launch_sha256"] = _manifest_hash(value, "launch_sha256")
    return value


def _ensure_launch_record(
    manifest: Mapping[str, Any], indexes: Sequence[int], *, workers: int, timeout_ms: int, server: str
) -> dict[str, Any]:
    path = RUN_ROOT / "events" / "launch.json"
    expected = launch_record(indexes, workers=workers, timeout_ms=timeout_ms, server=server, run_manifest_sha256=manifest["manifest_sha256"])
    if path.exists():
        observed = _load_json(path)
        if observed != expected:
            raise SevenOrderCoverageError("resume request differs from immutable launch record")
        return observed
    parent._write_create_once(path, _json_bytes(expected))
    return expected


def _check_control(control: str, result: Mapping[str, Any]) -> None:
    engines = result.get("engines")
    if type(engines) is not list or [engine.get("solver") for engine in engines] != ["z3", "cvc5"]:
        raise SevenOrderCoverageError("control engine list is malformed")
    expected = "SAT" if control == "positive" else "UNSAT"
    effective = "SAT_SEMANTICALLY_REPLAYED" if control == "positive" else "UNSAT_DISCOVERY_ONLY"
    if any(engine.get("raw_status") != expected or engine.get("effective_status") != effective for engine in engines):
        raise SevenOrderCoverageError(f"{control} control did not reach its expected terminal verdict")


def run_census(
    *, workers: int = 20, timeout_ms: int = 60_000, server: str = "http://127.0.0.1:7272"
) -> dict[str, Any]:
    """Launch the reviewed campaign through PIQD and create immutable records."""
    workers = normalize_workers(workers)
    if type(timeout_ms) is not int or not 1 <= timeout_ms <= 3_600_000:
        raise SevenOrderCoverageError("timeout_ms must lie in 1..3600000")
    indexes = unresolved_parent_profiles()
    manifest = _load_run_manifest()
    for name in ("artifacts", "events", "tmp"):
        (RUN_ROOT / name).mkdir(mode=0o700, exist_ok=True)
    (RUN_ROOT / "artifacts" / "controls").mkdir(mode=0o700, exist_ok=True)
    (RUN_ROOT / "artifacts" / "profiles").mkdir(mode=0o700, exist_ok=True)
    launch = _ensure_launch_record(manifest, indexes, workers=workers, timeout_ms=timeout_ms, server=server)
    controls: list[dict[str, Any]] = []
    for control in CONTROL_IDS:
        prepared = prepare_control_query(control, timeout_ms=timeout_ms)
        result = parent._execute_or_resume(prepared, RUN_ROOT / "artifacts" / "controls" / prepared.key, server=server, timeout_ms=timeout_ms)
        _check_control(control, result)
        controls.append(result)

    def execute(index: int) -> dict[str, Any]:
        prepared = prepare_profile_query(index, timeout_ms=timeout_ms)
        return _execute_profile(prepared, RUN_ROOT / "artifacts" / "profiles" / prepared.key, server=server, timeout_ms=timeout_ms)

    with ThreadPoolExecutor(max_workers=workers) as pool:
        results = list(pool.map(execute, indexes))
    record = terminal_record(results, controls, launch)
    path = RUN_ROOT / "events" / "terminal.json"
    if path.exists():
        if _load_json(path) != record:
            raise SevenOrderCoverageError("terminal record differs on resume")
    else:
        parent._write_create_once(path, _json_bytes(record))
    return record


def verify_run() -> dict[str, Any]:
    """Verify the immutable launch, controls, terminal, and all profile trees."""
    manifest = _load_run_manifest()
    launch = _load_json(RUN_ROOT / "events" / "launch.json")
    if launch.get("schema") != LAUNCH_SCHEMA or launch.get("lane_id") != LANE_ID or launch.get("run_id") != RUN_ID:
        raise SevenOrderCoverageError("coverage launch identity drifted")
    if launch.get("run_manifest_sha256") != manifest["manifest_sha256"] or launch.get("parent_terminal_sha256") != _sha((PARENT_ROOT / "events" / "terminal.json").read_bytes()):
        raise SevenOrderCoverageError("coverage launch custody binding failed")
    if launch.get("launch_sha256") != _manifest_hash(launch, "launch_sha256") or launch.get("claims") != dict(FALSE_CLAIMS):
        raise SevenOrderCoverageError("coverage launch self-hash or claims failed")
    if launch.get("controls") != list(CONTROL_IDS) or launch.get("profile_stream_sha256") != parent.profile_stream_sha256():
        raise SevenOrderCoverageError("coverage launch controls or profile stream drifted")
    indexes = tuple(item["index"] for item in launch.get("profiles", []))
    expected = unresolved_parent_profiles()
    if indexes != expected or len(indexes) != EXPECTED_UNRESOLVED:
        raise SevenOrderCoverageError("coverage launch profile selection drifted")
    indexed = parent.indexed_profiles()
    expected_launch_profiles = [
        {"index": index, "key": f"profile-{index:04d}-{indexed[index][1].profile_id[:20]}", "profile_sha256": indexed[index][1].profile_id}
        for index in indexes
    ]
    if launch.get("profiles") != expected_launch_profiles:
        raise SevenOrderCoverageError("coverage launch profile hashes drifted")
    launch_keys = tuple(item["key"] for item in expected_launch_profiles)
    terminal = _load_json(RUN_ROOT / "events" / "terminal.json")
    if terminal.get("schema") != TERMINAL_SCHEMA or terminal.get("launch_sha256") != launch["launch_sha256"]:
        raise SevenOrderCoverageError("coverage terminal launch binding failed")
    if terminal.get("terminal_sha256") != _manifest_hash(terminal, "terminal_sha256") or terminal.get("claims") != dict(FALSE_CLAIMS):
        raise SevenOrderCoverageError("coverage terminal self-hash or claims failed")
    if [item.get("key") for item in terminal.get("controls", [])] != ["control-positive", "control-negative"]:
        raise SevenOrderCoverageError("coverage terminal controls are incomplete or reordered")
    terminal_profiles = terminal.get("profiles")
    if type(terminal_profiles) is not list or [item.get("key") for item in terminal_profiles] != list(launch_keys):
        raise SevenOrderCoverageError("coverage terminal profiles are incomplete or reordered")
    if len(terminal_profiles) != EXPECTED_UNRESOLVED:
        raise SevenOrderCoverageError("coverage terminal profile count drifted")
    observed_pairs: Counter[str] = Counter()
    for item in terminal.get("controls", []):
        control = item["key"].removeprefix("control-")
        prepared = prepare_control_query(control, timeout_ms=launch["timeout_ms"])
        verified = parent.verify_terminal_directory(RUN_ROOT / "artifacts" / "controls" / item["key"], prepared)
        if item.get("result_sha256") != verified["result_sha256"] or item.get("engines") != verified["engines"]:
            raise SevenOrderCoverageError("coverage control result binding failed")
        _check_control(control, verified)
    for item in terminal_profiles:
        match = _KEY.fullmatch(item["key"])
        if match is None:
            raise SevenOrderCoverageError("coverage terminal profile key malformed")
        prepared = prepare_profile_query(int(match.group(1)), timeout_ms=launch["timeout_ms"])
        result = verify_terminal_directory(RUN_ROOT / "artifacts" / "profiles" / item["key"], prepared)
        if result["result_sha256"] != item["result_sha256"] or result["engines"] != item.get("engines"):
            raise SevenOrderCoverageError("coverage terminal result digest drifted")
        observed_pairs["/".join(engine["raw_status"] for engine in result["engines"])] += 1
    if terminal.get("summary") != {"profiles": EXPECTED_UNRESOLVED, "engine_status_pairs": dict(sorted(observed_pairs.items()))}:
        raise SevenOrderCoverageError("coverage terminal status summary drifted")
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--workers", type=int, default=20)
    parser.add_argument("--check-parent", action="store_true", help="validate parent custody (default action)")
    parser.add_argument("--verbose", action="store_true")
    parser.add_argument("--launch", action="store_true")
    parser.add_argument("--verify", action="store_true", help="verify an existing immutable run")
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    args = parser.parse_args(argv)
    try:
        workers = normalize_workers(args.workers)
        if args.launch and args.verify:
            raise SevenOrderCoverageError("--launch and --verify are mutually exclusive")
        if args.launch:
            record = run_census(workers=workers, timeout_ms=args.timeout_ms, server=args.server)
            if args.verbose:
                print(f"complete: covered {record['summary']['profiles']} profiles")
        elif args.verify:
            record = verify_run()
            if args.verbose:
                print(f"verified: covered {record['summary']['profiles']} profiles")
        else:
            indexes = unresolved_parent_profiles()
            if args.verbose:
                print(f"ready: validated parent and {len(indexes)} unresolved profiles")
        return 0
    except (SevenOrderCoverageError, adapter.SmtSourceAdapterError, parent.HardSourceSwapOrderPiqdError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1


__all__ = [
    "EXPECTED_UNRESOLVED",
    "SevenOrderCoverageError",
    "avoidance_assertions",
    "avoidance_patterns",
    "build_coverage_system",
    "build_smt_commands",
    "cyclic_order_term",
    "main",
    "normalize_workers",
    "pattern_role_choices",
    "prepare_control_query",
    "prepare_profile_query",
    "run_census",
    "terminal_record",
    "unresolved_parent_profiles",
    "verify_run",
    "verify_sat_model",
    "verify_terminal_directory",
]
