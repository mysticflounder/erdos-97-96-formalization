"""Deterministic formula/profile-scope mine over the 2,798 order-run profiles."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from collections.abc import Mapping, Sequence
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from census.card_head import exactfive_hard_source_swap_order_piqd as parent

LANE_ID = "exactfive-opposed-turn-profile-mine-20260903"
RUN_ID = "run-0002"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
SPEC_PATH = REPOSITORY_ROOT / "docs/specs/p97-exactfive-opposed-turn-profile-mine-v1.md"
RUNNER_PATH = REPOSITORY_ROOT / "scripts/run_exactfive_opposed_turn_profile_mine.py"
TEST_PATH = (
    REPOSITORY_ROOT
    / "census/card_head/tests/test_exactfive_opposed_turn_profile_mine.py"
)

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"

RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-opposed-turn-profile-mine-launch/v1"
PROFILE_SCHEMA = "p97-exactfive-opposed-turn-profile-record/v1"
FAILURE_SCHEMA = "p97-exactfive-opposed-turn-profile-mine-failure/v1"
TERMINAL_SCHEMA = "p97-exactfive-opposed-turn-profile-mine-terminal/v1"

EXPECTED_PROFILES = 2_798
EXPECTED_STRUCTURAL = 558
EXPECTED_SAT_PROFILES = 34
EXPECTED_SAT_CELLS = 56
EXPECTED_MATCHED_CELLS = 50
EXPECTED_KILLED_PROFILES = 28
EXPECTED_RESIDUALS = (360, 363, 376, 467, 470, 483)
EXPECTED_RESIDUAL_ENGINE_OUTCOMES = {
    360: (("z3", "SAT", False), ("cvc5", "SAT", True)),
    363: (("z3", "SAT", False), ("cvc5", "UNKNOWN", None)),
    376: (("z3", "SAT", False), ("cvc5", "UNKNOWN", None)),
    467: (("z3", "SAT", False), ("cvc5", "SAT", True)),
    470: (("z3", "SAT", False), ("cvc5", "UNKNOWN", None)),
    483: (("z3", "SAT", False), ("cvc5", "UNKNOWN", None)),
}

T0_SUPPORT = ("a", "d", "c1", "p", "q")
K1_SUPPORT = ("O", "a", "s", "t")
TURN_CANDIDATES = ("u", "v")

FALSE_CLAIMS = {
    "lean_ingress": False,
    "promotion": False,
    "source_completeness": False,
    "source_realization": False,
    "theorem": False,
}

_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_opposed_turn_profile_mine.py",
    "census/card_head/tests/test_exactfive_opposed_turn_profile_mine.py",
    "docs/specs/p97-exactfive-opposed-turn-profile-mine-v1.md",
    "scripts/run_exactfive_opposed_turn_profile_mine.py",
]


class OpposedTurnProfileMineError(RuntimeError):
    """The deterministic profile mine failed closed."""


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":")).encode("utf-8")


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _read_regular(path: Path, *, limit: int = 128 * 1024 * 1024) -> bytes:
    try:
        before = path.stat(follow_symlinks=False)
    except OSError as exc:
        raise OpposedTurnProfileMineError(f"cannot read required path: {path}") from exc
    if (
        not stat.S_ISREG(before.st_mode)
        or before.st_nlink != 1
        or before.st_size > limit
        or path.is_symlink()
    ):
        raise OpposedTurnProfileMineError(f"required path is unsafe: {path}")
    try:
        payload = path.read_bytes()
    except OSError as exc:
        raise OpposedTurnProfileMineError(f"cannot read required path: {path}") from exc
    after = path.stat(follow_symlinks=False)
    identity = lambda item: (
        item.st_dev,
        item.st_ino,
        item.st_mode,
        item.st_nlink,
        item.st_size,
        item.st_mtime_ns,
    )
    if len(payload) != before.st_size or identity(after) != identity(before):
        raise OpposedTurnProfileMineError(
            f"required path changed while reading: {path}"
        )
    return payload


def _strict_json(payload: bytes, label: str) -> dict[str, Any]:
    try:
        value = json.loads(payload)
    except (UnicodeDecodeError, json.JSONDecodeError) as exc:
        raise OpposedTurnProfileMineError(f"{label} is not strict JSON") from exc
    if type(value) is not dict or _json(value) != payload:
        raise OpposedTurnProfileMineError(f"{label} is not canonical JSON")
    return value


def _write_once(path: Path, payload: bytes) -> None:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path, os.O_WRONLY | os.O_CREAT | os.O_EXCL | os.O_NOFOLLOW, 0o400
        )
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise OpposedTurnProfileMineError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
        completed = os.fstat(descriptor)
        if (
            not stat.S_ISREG(completed.st_mode)
            or completed.st_nlink != 1
            or completed.st_size != len(payload)
        ):
            raise OpposedTurnProfileMineError("immutable artifact descriptor is unsafe")
    except FileExistsError as exc:
        raise OpposedTurnProfileMineError(f"immutable artifact exists: {path}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _publish_json_once(
    path: Path, record: Mapping[str, Any], label: str
) -> dict[str, Any]:
    payload = _json(record)
    _write_once(path, payload)
    observed = _strict_json(_read_regular(path), label)
    if observed != record:
        raise OpposedTurnProfileMineError(f"{label} changed after publication")
    return observed


def _profile_index(key: str) -> int:
    pieces = key.split("-", 2)
    if len(pieces) != 3 or pieces[0] != "profile" or not pieces[1].isdigit():
        raise OpposedTurnProfileMineError("parent profile key is malformed")
    index = int(pieces[1])
    if not 0 <= index < EXPECTED_PROFILES:
        raise OpposedTurnProfileMineError("parent profile index is out of range")
    return index


def _require_existing_directory(path: Path, label: str) -> None:
    try:
        relative = path.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise OpposedTurnProfileMineError(
            f"{label} escapes the repository: {path}"
        ) from exc
    if REPOSITORY_ROOT.is_symlink() or not REPOSITORY_ROOT.is_dir():
        raise OpposedTurnProfileMineError("repository root is unsafe")
    current = REPOSITORY_ROOT
    for part in relative.parts:
        current /= part
        if current.is_symlink() or not current.is_dir():
            raise OpposedTurnProfileMineError(f"{label} is unsafe: {current}")


def authenticate_parent_headers() -> dict[str, Any]:
    for path, label in (
        (PARENT_ROOT, "parent run root"),
        (PARENT_ROOT / "events", "parent events directory"),
        (PARENT_ROOT / "artifacts", "parent artifacts directory"),
        (PARENT_ROOT / "artifacts/profiles", "parent profiles directory"),
        (PARENT_ROOT / "artifacts/controls", "parent controls directory"),
    ):
        _require_existing_directory(path, label)
    manifest = _strict_json(_read_regular(PARENT_MANIFEST_PATH), "parent manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != parent._expected_run_manifest(created):
        raise OpposedTurnProfileMineError("parent manifest or source digests drifted")
    launch = _strict_json(_read_regular(PARENT_LAUNCH_PATH), "parent launch")
    profiles = parent.indexed_profiles()
    expected_launch = parent._launch_record(
        profiles,
        selection_mode=launch.get("selection_mode"),
        workers=launch.get("workers"),
        timeout_ms=launch.get("timeout_ms"),
        server=launch.get("server"),
        created_utc=launch.get("created_utc"),
        run_manifest_sha256=manifest["manifest_sha256"],
    )
    if (
        launch != expected_launch
        or launch.get("profile_stream_sha256") != parent.profile_stream_sha256()
    ):
        raise OpposedTurnProfileMineError("parent launch or profile stream drifted")
    terminal = _strict_json(_read_regular(PARENT_TERMINAL_PATH), "parent terminal")
    links = terminal.get("profiles")
    if (
        terminal.get("schema") != parent.TERMINAL_SCHEMA
        or terminal.get("launch_sha256") != launch["launch_sha256"]
        or terminal.get("terminal_sha256")
        != parent._manifest_self_hash(terminal, "terminal_sha256")
        or type(links) is not list
        or len(links) != EXPECTED_PROFILES
    ):
        raise OpposedTurnProfileMineError("parent terminal envelope drifted")
    expected_keys = [
        f"profile-{index:04d}-{profile.profile_id[:20]}" for index, profile in profiles
    ]
    if [link.get("key") for link in links if type(link) is dict] != expected_keys:
        raise OpposedTurnProfileMineError("parent terminal profile links drifted")
    return {
        "manifest": manifest,
        "launch": launch,
        "terminal": terminal,
        "profiles": profiles,
        "parent_header_sha256": _sha(
            _canonical(
                {
                    "manifest_sha256": manifest["manifest_sha256"],
                    "launch_sha256": launch["launch_sha256"],
                    "terminal_sha256": terminal["terminal_sha256"],
                    "profile_stream_sha256": launch["profile_stream_sha256"],
                }
            )
        ),
    }


def structural_filter(system: Mapping[str, Any]) -> dict[str, Any]:
    role_class = system.get("role_class")
    rows = system.get("rows")
    if type(role_class) is not dict or type(rows) is not list:
        raise OpposedTurnProfileMineError("profile role mapping is malformed")
    row_by_id = {row.get("id"): row for row in rows if type(row) is dict}
    if (
        row_by_id.get("T0", {}).get("support") != list(T0_SUPPORT)
        or row_by_id.get("K1", {}).get("support") != list(K1_SUPPORT)
        or row_by_id.get("K1", {}).get("center") != "c1"
    ):
        raise OpposedTurnProfileMineError("parent row-role mapping drifted")
    try:
        t0_classes = {role_class[role] for role in T0_SUPPORT}
        k1_classes = {role_class[role] for role in K1_SUPPORT}
        permitted = {role_class["a"], role_class["c2"]}
        c2_class = role_class["c2"]
    except KeyError as exc:
        raise OpposedTurnProfileMineError("profile role mapping is incomplete") from exc
    intersection = t0_classes & k1_classes
    c2_in_t0 = c2_class in t0_classes
    intersection_restricted = intersection <= permitted
    return {
        "passes": c2_in_t0 and intersection_restricted,
        "c2_in_T0": c2_in_t0,
        "T0_inter_K1_subset_a_c2": intersection_restricted,
        "T0_classes": sorted(t0_classes),
        "K1_classes": sorted(k1_classes),
        "intersection_classes": sorted(intersection),
        "permitted_classes": sorted(permitted),
    }


def cyclic_turn_sign(
    ranks: Mapping[str, int], first: str, second: str, third: str
) -> int:
    if len({first, second, third}) != 3:
        return 0
    if {first, second, third} - set(ranks):
        raise OpposedTurnProfileMineError("turn rank map is incomplete")
    size = len(ranks)
    values = list(ranks.values())
    if sorted(values) != list(range(size)):
        raise OpposedTurnProfileMineError("turn ranks are not a permutation")
    second_delta = (ranks[second] - ranks[first]) % size
    third_delta = (ranks[third] - ranks[first]) % size
    return 1 if second_delta < third_delta else -1


def opposed_turn_analysis(
    system: Mapping[str, Any], ranks: Mapping[str, int]
) -> dict[str, Any]:
    role_class = system.get("role_class")
    if type(role_class) is not dict:
        raise OpposedTurnProfileMineError("turn role mapping is malformed")
    try:
        b = role_class["c1"]
        o = role_class["O"]
        c2 = role_class["c2"]
    except KeyError as exc:
        raise OpposedTurnProfileMineError("turn role mapping is incomplete") from exc
    base = cyclic_turn_sign(ranks, b, o, c2)
    witnesses = []
    candidates = []
    for role in TURN_CANDIDATES:
        point = role_class.get(role)
        if type(point) is not str:
            raise OpposedTurnProfileMineError("turn candidate mapping is incomplete")
        first = cyclic_turn_sign(ranks, b, o, point)
        second = cyclic_turn_sign(ranks, c2, o, point)
        matched = base != 0 and first == -base and second == -base
        row = {
            "role": role,
            "class_id": point,
            "signedArea_B_O_w_sign": first,
            "signedArea_c2_O_w_sign": second,
            "opposes_base_twice": matched,
        }
        candidates.append(row)
        if matched:
            witnesses.append(role)
    return {
        "B_role": "c1",
        "B_class": b,
        "O_class": o,
        "c2_class": c2,
        "signedArea_B_O_c2_sign": base,
        "candidates": candidates,
        "witness_roles": witnesses,
        "matched": bool(witnesses),
    }


def _parent_solve(profile_directory: Path, engine: Mapping[str, Any]) -> dict[str, Any]:
    artifacts = engine.get("artifacts")
    if type(artifacts) is not dict:
        raise OpposedTurnProfileMineError("parent engine artifacts are malformed")
    label = "solve" if "solve" in artifacts else "reconciled_solve"
    record = artifacts.get(label)
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise OpposedTurnProfileMineError("parent solve artifact is malformed")
    name = record["path"]
    if type(name) is not str or "/" in name or "\\" in name:
        raise OpposedTurnProfileMineError("parent solve artifact path is unsafe")
    payload = _read_regular(profile_directory / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise OpposedTurnProfileMineError("parent solve artifact digest drifted")
    return _strict_json(payload, "parent solve")


def analyze_profile(
    index: int,
    profile: Any,
    link: Mapping[str, Any],
    *,
    timeout_ms: int,
    parent_header_sha256: str,
) -> dict[str, Any]:
    prepared = parent.prepare_profile_query(index, timeout_ms=timeout_ms)
    if (
        prepared.system["profile_sha256"] != profile.profile_id
        or link.get("key") != prepared.key
    ):
        raise OpposedTurnProfileMineError("parent profile identity crossed")
    directory = PARENT_ROOT / "artifacts/profiles" / prepared.key
    verified = parent.verify_terminal_directory(directory, prepared)
    expected_link = {
        "key": verified["key"],
        "result_sha256": verified["result_sha256"],
        "engines": verified["engines"],
    }
    if dict(link) != expected_link:
        raise OpposedTurnProfileMineError("parent terminal result link crossed")
    result = _strict_json(_read_regular(directory / "result.json"), "parent result")
    filter_record = structural_filter(prepared.system)
    engine_records = []
    sat_cells = []
    for engine in result["engines"]:
        row: dict[str, Any] = {
            "solver": engine["solver"],
            "raw_status": engine["raw_status"],
            "effective_status": engine["effective_status"],
            "result_sha256": engine["result_sha256"],
        }
        if engine["raw_status"] == "SAT":
            solve = _parent_solve(directory, engine)
            values = parent.parse_exact_readback(
                solve["values"], prepared.query.get_values
            )
            replay = parent.replay_assignment(prepared.system, values)
            semantic = engine.get("semantic_replay")
            if (
                not replay.accepted
                or type(semantic) is not dict
                or semantic.get("accepted") is not True
                or semantic.get("evidence")
                != {
                    **replay.evidence,
                    "solver": engine["solver"],
                    "model_sha256": _sha(solve["model"].encode()),
                    "values_sha256": _sha(solve["values"].encode()),
                    "system_sha256": parent._sha_json(prepared.system),
                }
            ):
                raise OpposedTurnProfileMineError("parent SAT exact replay drifted")
            turn = opposed_turn_analysis(prepared.system, replay.evidence["ranks"])
            row.update(
                {
                    "exact_rational_replay": True,
                    "rank_assignment_sha256": _sha(
                        _canonical(replay.evidence["ranks"])
                    ),
                    "opposed_turn": turn,
                }
            )
            sat_cells.append(row)
        engine_records.append(row)
    sat_bearing = bool(sat_cells)
    killed = (
        filter_record["passes"]
        and sat_bearing
        and all(cell["opposed_turn"]["matched"] for cell in sat_cells)
    )
    record = {
        "schema": PROFILE_SCHEMA,
        "profile_index": index,
        "profile_key": prepared.key,
        "profile_sha256": profile.profile_id,
        "parent_header_sha256": parent_header_sha256,
        "parent_result_sha256": verified["result_sha256"],
        "role_class": prepared.system["role_class"],
        "structural_filter": filter_record,
        "engine_cells": engine_records,
        "sat_bearing": sat_bearing,
        "sat_cell_count": len(sat_cells),
        "matched_sat_cell_count": sum(
            cell["opposed_turn"]["matched"] for cell in sat_cells
        ),
        "every_sat_cell_killed": killed,
        "residual": filter_record["passes"] and sat_bearing and not killed,
        "finding_scope": "authenticated-order-formulas-and-profile-engine-cells-only",
        "claims": dict(FALSE_CLAIMS),
    }
    _validate_residual_engine_outcome(record)
    record["record_sha256"] = _self_hash(record, "record_sha256")
    return record


def _validate_residual_engine_outcome(record: Mapping[str, Any]) -> None:
    index = record.get("profile_index")
    if not record.get("residual"):
        return
    expected = EXPECTED_RESIDUAL_ENGINE_OUTCOMES.get(index)
    if expected is None:
        return
    observed = tuple(
        (
            cell.get("solver"),
            cell.get("raw_status"),
            cell.get("opposed_turn", {}).get("matched"),
        )
        for cell in record.get("engine_cells", ())
        if type(cell) is dict
    )
    if observed != expected:
        raise OpposedTurnProfileMineError("residual engine identity drifted")


def _profile_output_path(root: Path, index: int, profile_sha256: str) -> Path:
    return (
        root / "artifacts/profiles" / f"profile-{index:04d}-{profile_sha256[:20]}.json"
    )


def verify_profile_record(
    path: Path, expected: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    record = _strict_json(_read_regular(path), "profile evidence")
    if (
        record.get("schema") != PROFILE_SCHEMA
        or record.get("record_sha256") != _self_hash(record, "record_sha256")
        or record.get("claims") != FALSE_CLAIMS
    ):
        raise OpposedTurnProfileMineError("profile evidence drifted")
    if expected is not None and record != expected:
        raise OpposedTurnProfileMineError("profile evidence crossed")
    return record


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("base_head") != "8526f8e379c81f0933501b3437bbb40ff522d4eb"
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise OpposedTurnProfileMineError("lane checkpoint drifted")
    return checkpoint


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {
        path.relative_to(REPOSITORY_ROOT).as_posix(): _sha(_read_regular(path))
        for path in paths
    }


def _expected_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(
            (Path(__file__), TEST_PATH, RUNNER_PATH, SPEC_PATH, Path(parent.__file__))
        ),
        "input_digests": _source_digest_map(
            (PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH)
        ),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _require_safe_root() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise OpposedTurnProfileMineError("run root escapes repository") from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise OpposedTurnProfileMineError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink():
            raise OpposedTurnProfileMineError("run-root ancestor is a symlink")
        if current.exists() and not current.is_dir():
            raise OpposedTurnProfileMineError("run-root ancestor is not a directory")


def _safe_child(parent_path: Path, name: str) -> Path:
    child = parent_path / name
    if child.is_symlink() or (child.exists() and not child.is_dir()):
        raise OpposedTurnProfileMineError("run-root child is unsafe")
    child.mkdir(exist_ok=True)
    if child.is_symlink() or not child.is_dir():
        raise OpposedTurnProfileMineError("run-root child is unsafe")
    return child


def _require_single_link_file(path: Path, label: str) -> None:
    try:
        status = path.stat(follow_symlinks=False)
    except OSError as exc:
        raise OpposedTurnProfileMineError(f"cannot inspect {label}: {path}") from exc
    if path.is_symlink() or not stat.S_ISREG(status.st_mode) or status.st_nlink != 1:
        raise OpposedTurnProfileMineError(f"{label} is unsafe: {path}")


def _directory_entries(path: Path, label: str) -> dict[str, Path]:
    if path.is_symlink() or not path.is_dir():
        raise OpposedTurnProfileMineError(f"{label} is unsafe")
    observed = list(path.iterdir())
    entries = {entry.name: entry for entry in observed}
    if len(entries) != len(observed):
        raise OpposedTurnProfileMineError(f"{label} inventory is malformed")
    return entries


def _expected_profile_filenames() -> set[str]:
    return {
        f"profile-{index:04d}-{profile.profile_id[:20]}.json"
        for index, profile in parent.indexed_profiles()
    }


def verify_runtime_inventory(
    root: Path,
    *,
    terminal: bool = False,
) -> None:
    root_entries = _directory_entries(root, "run root")
    if set(root_entries) != {"artifacts", "events", "tmp", "run_manifest.json"}:
        raise OpposedTurnProfileMineError("run-root inventory drifted")
    _require_single_link_file(root_entries["run_manifest.json"], "run manifest")

    artifacts = _directory_entries(root_entries["artifacts"], "artifacts directory")
    if set(artifacts) - {"profiles"} or (terminal and set(artifacts) != {"profiles"}):
        raise OpposedTurnProfileMineError("artifacts inventory drifted")
    expected_profiles = _expected_profile_filenames()
    observed_profiles: set[str] = set()
    if "profiles" in artifacts:
        profiles = _directory_entries(artifacts["profiles"], "profiles directory")
        observed_profiles = set(profiles)
        if observed_profiles - expected_profiles:
            raise OpposedTurnProfileMineError("profile inventory has an unknown entry")
        for entry in profiles.values():
            _require_single_link_file(entry, "profile evidence")
    if terminal and observed_profiles != expected_profiles:
        raise OpposedTurnProfileMineError("terminal profile inventory is incomplete")

    events = _directory_entries(root_entries["events"], "events directory")
    allowed_events = {"launch.json", "terminal.json", "failure.json"}
    if set(events) - allowed_events:
        raise OpposedTurnProfileMineError("events inventory has an unknown entry")
    for entry in events.values():
        _require_single_link_file(entry, "event record")
    if terminal and set(events) != {"launch.json", "terminal.json"}:
        raise OpposedTurnProfileMineError("terminal event inventory drifted")

    temporary = _directory_entries(root_entries["tmp"], "temporary directory")
    if temporary:
        raise OpposedTurnProfileMineError("temporary inventory is not empty")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_root()
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise OpposedTurnProfileMineError("run root is unsafe")
    RUN_ROOT.mkdir(parents=True, exist_ok=True)
    _require_safe_root()
    if RUN_ROOT.is_symlink() or not RUN_ROOT.is_dir():
        raise OpposedTurnProfileMineError("run root is unsafe")
    artifacts = _safe_child(RUN_ROOT, "artifacts")
    _safe_child(RUN_ROOT, "events")
    _safe_child(RUN_ROOT, "tmp")
    if (artifacts / "profiles").exists():
        profiles = artifacts / "profiles"
        if profiles.is_symlink() or not profiles.is_dir():
            raise OpposedTurnProfileMineError("profile output directory is unsafe")
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists():
        manifest = _strict_json(_read_regular(manifest_path), "run manifest")
        expected = _expected_manifest(manifest.get("created_utc", ""))
        if manifest != expected:
            raise OpposedTurnProfileMineError("run manifest drifted")
    else:
        manifest = _expected_manifest(datetime.now(UTC).strftime("%Y-%m-%dT%H:%M:%SZ"))
        _publish_json_once(manifest_path, manifest, "run manifest")
    if {entry.name for entry in RUN_ROOT.iterdir()} - {
        "artifacts",
        "events",
        "tmp",
        "run_manifest.json",
    }:
        raise OpposedTurnProfileMineError("run root contains an unknown entry")
    return RUN_ROOT, manifest


def _launch_record(
    manifest: Mapping[str, Any], headers: Mapping[str, Any]
) -> dict[str, Any]:
    record = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "parent_header_sha256": headers["parent_header_sha256"],
        "parent_manifest_sha256": headers["manifest"]["manifest_sha256"],
        "parent_launch_sha256": headers["launch"]["launch_sha256"],
        "parent_terminal_sha256": headers["terminal"]["terminal_sha256"],
        "profile_stream_sha256": headers["launch"]["profile_stream_sha256"],
        "profiles": EXPECTED_PROFILES,
        "solver_transport": False,
        "finding_scope": "authenticated-order-formulas-and-profile-engine-cells-only",
        "claims": dict(FALSE_CLAIMS),
    }
    record["launch_sha256"] = _self_hash(record, "launch_sha256")
    return record


def _summary(records: Sequence[Mapping[str, Any]]) -> dict[str, Any]:
    structural = [row for row in records if row["structural_filter"]["passes"]]
    sat_profiles = [row for row in structural if row["sat_bearing"]]
    killed = [row for row in sat_profiles if row["every_sat_cell_killed"]]
    residuals = [row["profile_index"] for row in sat_profiles if row["residual"]]
    residual_engine_outcomes = {
        str(row["profile_index"]): [
            [
                cell["solver"],
                cell["raw_status"],
                cell.get("opposed_turn", {}).get("matched"),
            ]
            for cell in row["engine_cells"]
        ]
        for row in sat_profiles
        if row["residual"]
    }
    summary = {
        "profiles_authenticated": len(records),
        "structural_profiles": len(structural),
        "sat_bearing_profiles": len(sat_profiles),
        "sat_engine_cells": sum(row["sat_cell_count"] for row in sat_profiles),
        "matched_sat_engine_cells": sum(
            row["matched_sat_cell_count"] for row in sat_profiles
        ),
        "every_sat_cell_killed_profiles": len(killed),
        "residual_profile_indices": residuals,
        "residual_engine_outcomes": residual_engine_outcomes,
    }
    expected = {
        "profiles_authenticated": EXPECTED_PROFILES,
        "structural_profiles": EXPECTED_STRUCTURAL,
        "sat_bearing_profiles": EXPECTED_SAT_PROFILES,
        "sat_engine_cells": EXPECTED_SAT_CELLS,
        "matched_sat_engine_cells": EXPECTED_MATCHED_CELLS,
        "every_sat_cell_killed_profiles": EXPECTED_KILLED_PROFILES,
        "residual_profile_indices": list(EXPECTED_RESIDUALS),
        "residual_engine_outcomes": {
            str(index): [list(cell) for cell in outcomes]
            for index, outcomes in EXPECTED_RESIDUAL_ENGINE_OUTCOMES.items()
        },
    }
    if summary != expected:
        raise OpposedTurnProfileMineError("opposed-turn mine counts drifted")
    return summary


def _failure_record(
    manifest: Mapping[str, Any],
    launch_sha256: str | None,
    completed: int,
    exc: Exception,
    stage: str,
) -> dict[str, Any]:
    record = {
        "schema": FAILURE_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch_sha256,
        "completed_profile_records": completed,
        "failure_stage": stage,
        "failure_type": type(exc).__name__,
        "state": "INCOMPLETE_FAILED_CUSTODY",
        "claims": dict(FALSE_CLAIMS),
    }
    record["failure_sha256"] = _self_hash(record, "failure_sha256")
    return record


def verify_failure_record(
    path: Path, expected: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    record = _strict_json(_read_regular(path), "failure record")
    if (
        record.get("schema") != FAILURE_SCHEMA
        or record.get("lane_id") != LANE_ID
        or record.get("run_id") != RUN_ID
        or record.get("state") != "INCOMPLETE_FAILED_CUSTODY"
        or record.get("claims") != FALSE_CLAIMS
        or record.get("failure_sha256") != _self_hash(record, "failure_sha256")
    ):
        raise OpposedTurnProfileMineError("stored failure custody drifted")
    if expected is not None and record != expected:
        raise OpposedTurnProfileMineError("stored failure custody crossed")
    return record


def _publish_failure(path: Path, record: Mapping[str, Any]) -> dict[str, Any]:
    _publish_json_once(path, record, "failure record")
    return verify_failure_record(path, record)


def _verify_exact_record(
    path: Path,
    expected: Mapping[str, Any],
    *,
    label: str,
    hash_field: str,
) -> dict[str, Any]:
    observed = _strict_json(_read_regular(path), label)
    if observed != expected or observed.get(hash_field) != _self_hash(
        observed, hash_field
    ):
        raise OpposedTurnProfileMineError(f"{label} drifted")
    return observed


def run_mine() -> dict[str, Any]:
    root, manifest = ensure_run_root()
    failure_path = root / "events/failure.json"
    if failure_path.exists():
        verify_failure_record(failure_path)
        raise OpposedTurnProfileMineError("prior incomplete failure is immutable")
    launch_sha256: str | None = None
    records: list[dict[str, Any]] = []
    stage = "preflight-inventory"
    try:
        verify_runtime_inventory(root)
        stage = "parent-authentication"
        headers = authenticate_parent_headers()
        stage = "launch-publication"
        launch = _launch_record(manifest, headers)
        launch_sha256 = launch["launch_sha256"]
        launch_path = root / "events/launch.json"
        if launch_path.exists():
            _verify_exact_record(
                launch_path,
                launch,
                label="launch record",
                hash_field="launch_sha256",
            )
        else:
            _publish_json_once(launch_path, launch, "launch record")
            _verify_exact_record(
                launch_path,
                launch,
                label="launch record",
                hash_field="launch_sha256",
            )

        stage = "profile-analysis"
        _safe_child(root / "artifacts", "profiles")
        verify_runtime_inventory(root)
        links = headers["terminal"]["profiles"]
        for (index, profile), link in zip(headers["profiles"], links, strict=True):
            expected = analyze_profile(
                index,
                profile,
                link,
                timeout_ms=headers["launch"]["timeout_ms"],
                parent_header_sha256=headers["parent_header_sha256"],
            )
            path = _profile_output_path(root, index, profile.profile_id)
            if path.exists():
                record = verify_profile_record(path, expected)
            else:
                _publish_json_once(path, expected, "profile evidence")
                record = verify_profile_record(path, expected)
            records.append(record)
        verified_controls = []
        for control, link in zip(
            parent.CONTROL_IDS, headers["terminal"]["controls"], strict=True
        ):
            prepared = parent.prepare_control_query(
                control, timeout_ms=headers["launch"]["timeout_ms"]
            )
            verified = parent.verify_terminal_directory(
                PARENT_ROOT / "artifacts/controls" / prepared.key, prepared
            )
            if dict(link) != {
                "key": verified["key"],
                "result_sha256": verified["result_sha256"],
                "engines": verified["engines"],
            }:
                raise OpposedTurnProfileMineError("parent control result link crossed")
            verified_controls.append(verified)
        expected_parent_terminal = parent._terminal_record(
            headers["launch"],
            verified_controls,
            [
                {
                    "key": row["profile_key"],
                    "result_sha256": row["parent_result_sha256"],
                    "engines": [
                        {
                            "solver": cell["solver"],
                            "raw_status": cell["raw_status"],
                            "effective_status": cell["effective_status"],
                        }
                        for cell in row["engine_cells"]
                    ],
                }
                for row in records
            ],
        )
        if expected_parent_terminal != headers["terminal"]:
            raise OpposedTurnProfileMineError("parent terminal aggregate drifted")
        summary = _summary(records)

        stage = "terminal-publication"
        terminal = {
            "schema": TERMINAL_SCHEMA,
            "lane_id": LANE_ID,
            "run_id": RUN_ID,
            "run_manifest_sha256": manifest["manifest_sha256"],
            "launch_sha256": launch["launch_sha256"],
            "parent_header_sha256": headers["parent_header_sha256"],
            "profile_records": [
                {
                    "profile_index": row["profile_index"],
                    "profile_sha256": row["profile_sha256"],
                    "record_sha256": row["record_sha256"],
                }
                for row in records
            ],
            "summary": summary,
            "finding_scope": (
                "authenticated-order-formulas-and-profile-engine-cells-only"
            ),
            "claims": dict(FALSE_CLAIMS),
        }
        terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
        terminal_path = root / "events/terminal.json"
        if terminal_path.exists():
            _verify_exact_record(
                terminal_path,
                terminal,
                label="terminal record",
                hash_field="terminal_sha256",
            )
        else:
            _publish_json_once(terminal_path, terminal, "terminal record")
            _verify_exact_record(
                terminal_path,
                terminal,
                label="terminal record",
                hash_field="terminal_sha256",
            )
        stage = "terminal-inventory"
        verify_runtime_inventory(root, terminal=True)
        return terminal
    except Exception as exc:
        failure = _failure_record(
            manifest,
            launch_sha256,
            len(records),
            exc,
            stage,
        )
        try:
            _publish_failure(failure_path, failure)
        except Exception as custody_exc:
            raise OpposedTurnProfileMineError(
                "mine failed and failure evidence could not be published"
            ) from custody_exc
        raise OpposedTurnProfileMineError(
            "mine stopped with preserved failure custody"
        ) from exc


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        if args.init_only:
            root, result = ensure_run_root()
            verify_runtime_inventory(root)
        else:
            result = run_mine()
    except (OpposedTurnProfileMineError, parent.HardSourceSwapOrderPiqdError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "EXPECTED_KILLED_PROFILES",
    "EXPECTED_MATCHED_CELLS",
    "EXPECTED_PROFILES",
    "EXPECTED_RESIDUALS",
    "EXPECTED_RESIDUAL_ENGINE_OUTCOMES",
    "EXPECTED_SAT_CELLS",
    "EXPECTED_SAT_PROFILES",
    "EXPECTED_STRUCTURAL",
    "FALSE_CLAIMS",
    "LANE_ID",
    "RUN_ID",
    "RUN_ROOT",
    "OpposedTurnProfileMineError",
    "analyze_profile",
    "authenticate_parent_headers",
    "cyclic_turn_sign",
    "ensure_run_root",
    "main",
    "opposed_turn_analysis",
    "run_mine",
    "structural_filter",
    "verify_failure_record",
    "verify_profile_record",
    "verify_runtime_inventory",
]
