"""PIQD-only Singular equality-core diagnostic for adaptive survivor 1697.

The two target queries use the two authenticated fresh orders only to choose
the rank-zero/rank-one affine gauge.  Their thirteen row equalities are built
from one order-independent template.  This is a one-engine diagnostic and no
mathematical, source, Lean, or promotion claim is made here.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import urllib.parse
import uuid
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_adaptive_order_nra_piqd as adaptive,
)
from census.card_head import exactfive_hard_source_swap_nra_piqd as frozen_nra
from census.card_head import exactfive_hard_source_swap_order_piqd as frozen_order
from census.global_confinement import equality_ideal_probe as equality_probe
from census.global_confinement import piqd_singular_backend as singular_backend

LANE_ID = "exactfive-hard-source-swap-adaptive-equality-core-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs"
    / "specs"
    / "p97-exactfive-hard-source-swap-adaptive-equality-core-v1.md"
)
PRIOR_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / adaptive.LANE_ID / adaptive.RUN_ID
PRIOR_MANIFEST_PATH = PRIOR_ROOT / "run_manifest.json"
PRIOR_LAUNCH_PATH = PRIOR_ROOT / "events" / "launch.json"
PRIOR_TERMINAL_PATH = PRIOR_ROOT / "events" / "terminal.json"
PRIOR_SUMMARY_PATH = (
    REPOSITORY_ROOT
    / "docs"
    / "computation"
    / "exactfive-hard-source-swap-adaptive-order-nra-20260903"
    / "run-0001-summary.json"
)

PROFILE_INDEX = 1697
PROFILE_SHA256 = "59131cdcdaa474ab022dffd6ab990276ad1893caf70eb55940be3ec75a62ad5e"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-equality-core-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-equality-core-result/v1"
SOURCE_CONTEXT_SCHEMA = "p97-exactfive-hard-source-swap-adaptive-equality-core-query/v1"
PRODUCER_VERSION = "p97-exactfive-hard-source-swap-adaptive-equality-core/v1"
PIQD_PROJECT = "erdos-97-96-formalization/exactfive-adaptive-equality-core"
PIQD_SOURCE = (
    "census/card_head/exactfive_hard_source_swap_adaptive_equality_core_piqd.py"
)
CONTROL_KEYS = (
    "control-unit-linear",
    "control-nonunit-linear",
    "control-unit-distance",
    "control-nonunit-distance",
)
TARGET_KEYS = ("target-gauge-z3", "target-gauge-cvc5")
QUERY_KEYS = (*CONTROL_KEYS, *TARGET_KEYS)
REQUEST_NAMESPACE = uuid.UUID("bf933734-6961-5c3c-9f92-367b719125ad")
EXPECTED_PRIOR_HASHES = {
    "run_manifest_file": "f170fa1bce24fa7c297ac957f2dff2d9c91c97f4602b26ee3eeb3027851bd327",
    "run_manifest_self": "9e234df9028e786261b10e1f3bd9bb3a462338bf556827649b28a3d09f345a3e",
    "launch_file": "0703b9daace34c06fafe16c9611527f8d8da5feeb774e2bb6378dca7be9065dc",
    "launch_self": "54ee08612c803bf88eca9f297c8efcfd862bc7b523f1a3896b80a31d37961943",
    "terminal_file": "8e2934c3605bd46836732568bd74d6e598b3d8a7503c5e8dfc37070f93413f31",
    "terminal_self": "e783b4a715dffaf73079381f3d5e978b0cdb7de0c2c1044a1424b4a5217f1af4",
    "durable_summary_file": "2aabff254f6d754e03afc9c55377d9f9d59301022db94ecf696c63ce3d3c90de",
    "durable_summary_self": "57075db436e9b53274d927ca0f653d47b8d4759123ed576f2e6885f5afd20cca",
}
FALSE_CLAIMS = {
    "mathematical_verdict": False,
    "complex_infeasibility_theorem": False,
    "real_feasibility": False,
    "source_realization": False,
    "source_elimination": False,
    "order_evidence_independence": False,
    "lean_statement": False,
    "lean_proof": False,
    "promotion": False,
    "theorem": False,
}
OMITTED_LEDGER = {
    "signed_area_inequalities": {"included": False, "source_count": 165},
    "radius_disequality": {"included": False, "source_count": 1},
    "source_strict_inequality": {"included": False, "source_count": 1},
    "distinctness_saturation": {"included": False, "source_count": 0},
    "source_realization_claim": {"included": False, "source_count": 0},
}
_HEX64 = re.compile(r"^[0-9a-f]{64}$")
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_adaptive_equality_core_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_adaptive_equality_core_piqd.py",
    "docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core.md",
    "docs/specs/p97-exactfive-hard-source-swap-adaptive-equality-core-v1.md",
    "scripts/run_exactfive_hard_source_swap_adaptive_equality_core_piqd.py",
]


class EqualityCoreError(RuntimeError):
    """The equality-core diagnostic failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    kind: str
    expected: str | None
    variables: tuple[str, ...]
    polynomials: tuple[str, ...]
    script: str
    source_context: dict[str, Any]
    request_id: str


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
            allow_nan=False,
        ).encode("ascii")
    except (TypeError, ValueError, UnicodeEncodeError) as exc:
        raise EqualityCoreError("value is not canonical ASCII JSON") from exc


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise EqualityCoreError(f"required artifact is absent: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise EqualityCoreError(f"unsafe regular artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise EqualityCoreError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    def object_without_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        text = payload.decode("utf-8", errors="strict")
        value = json.loads(
            text,
            parse_constant=lambda token: (_ for _ in ()).throw(ValueError(token)),
            object_pairs_hook=object_without_duplicates,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise EqualityCoreError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise EqualityCoreError(f"{where} is not a JSON object")
    return value


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT).as_posix()
    except ValueError as exc:
        raise EqualityCoreError("governing path escaped the repository") from exc


def _file_record(path: Path) -> dict[str, Any]:
    payload = _read_regular(path)
    return {"path": _repo_path(path), "bytes": len(payload), "sha256": _sha(payload)}


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return dict(sorted((_repo_path(path), _sha(_read_regular(path))) for path in paths))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    expected_keys = {
        "schema",
        "lane_id",
        "owner",
        "base_head",
        "owned_paths",
        "generated_roots",
        "durable_paths",
        "created_utc",
        "manifest_sha256",
    }
    if (
        set(checkpoint) != expected_keys
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != "codex-rigid221"
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or type(checkpoint.get("base_head")) is not str
        or re.fullmatch(r"[0-9a-f]{40}|[0-9a-f]{64}", checkpoint["base_head"]) is None
        or type(checkpoint.get("created_utc")) is not str
        or re.fullmatch(
            r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z", checkpoint["created_utc"]
        )
        is None
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise EqualityCoreError(
            "lane checkpoint is unauthenticated or does not govern this run"
        )
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    runner = (
        REPOSITORY_ROOT
        / "scripts"
        / "run_exactfive_hard_source_swap_adaptive_equality_core_piqd.py"
    )
    sources = _source_digest_map(
        (
            Path(__file__),
            runner,
            Path(adaptive.__file__),
            Path(frozen_order.__file__),
            Path(frozen_nra.__file__),
            Path(frozen_order.alias_grid.__file__),
            Path(adaptive.adapter.__file__),
            Path(singular_backend.__file__),
            Path(equality_probe.__file__),
        )
    )
    inputs = _source_digest_map(
        (
            CHECKPOINT_PATH,
            SPEC_PATH,
            PRIOR_MANIFEST_PATH,
            PRIOR_LAUNCH_PATH,
            PRIOR_TERMINAL_PATH,
            PRIOR_SUMMARY_PATH,
        )
    )
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": sources,
        "input_digests": inputs,
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o400,
        )
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise EqualityCoreError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
    except FileExistsError as exc:
        raise EqualityCoreError(f"immutable artifact already exists: {path}") from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    manifest_path = RUN_ROOT / "run_manifest.json"
    if not RUN_ROOT.exists():
        RUN_ROOT.mkdir(parents=True, mode=0o700)
        for name in ("artifacts", "events", "tmp"):
            (RUN_ROOT / name).mkdir(mode=0o700)
        _create_once(manifest_path, _json(_expected_run_manifest(_utc_now())))
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise EqualityCoreError("governed run root is unsafe")
    manifest = _strict_json(_read_regular(manifest_path), "run manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != _expected_run_manifest(created):
        raise EqualityCoreError("run manifest or governing digests drifted")
    if manifest_path.stat(follow_symlinks=False).st_mode & 0o222:
        raise EqualityCoreError("run manifest is not immutable")
    expected_root_names = {"run_manifest.json", "artifacts", "events", "tmp"}
    if {entry.name for entry in RUN_ROOT.iterdir()} != expected_root_names:
        raise EqualityCoreError("governed run root contains an unbound entry")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        if not path.is_dir() or path.is_symlink():
            raise EqualityCoreError("run output class is unsafe")
    if tuple((RUN_ROOT / "tmp").iterdir()):
        raise EqualityCoreError("governed tmp directory is not empty")
    event_entries = tuple((RUN_ROOT / "events").iterdir())
    if any(
        entry.name not in {"launch.json", "terminal.json"}
        or entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        or entry.stat(follow_symlinks=False).st_mode & 0o222
        for entry in event_entries
    ):
        raise EqualityCoreError("events contain an unbound or unsafe entry")
    artifact_entries = tuple((RUN_ROOT / "artifacts").iterdir())
    if any(
        entry.name not in QUERY_KEYS or not entry.is_dir() or entry.is_symlink()
        for entry in artifact_entries
    ):
        raise EqualityCoreError(
            "artifacts contain an unbound or unsafe query directory"
        )
    return RUN_ROOT, manifest


def _profile_system(order: Sequence[str]) -> dict[str, Any]:
    system = adaptive.build_planar_system(tuple(order))
    current = adaptive._validate_planar_system_current(system)
    classes = current.get("classes")
    if type(classes) is not list or len(classes) != 11:
        raise EqualityCoreError("current producer does not expose exactly 11 classes")
    ids = [row.get("id") for row in classes if type(row) is dict]
    if (
        len(ids) != 11
        or len(set(ids)) != 11
        or any(type(item) is not str for item in ids)
    ):
        raise EqualityCoreError("current producer class map is malformed")
    if len(current.get("order", [])) != 11 or set(current["order"]) != set(ids):
        raise EqualityCoreError("fresh order does not cover the current class map")
    if len(current.get("rows", [])) != 4 or [
        row.get("id") for row in current["rows"]
    ] != ["T0", "K1", "K2", "L"]:
        raise EqualityCoreError("current producer row records drifted")
    return current


def revalidate_prior_adaptive_run() -> dict[str, Any]:
    """Invoke the completed adaptive replay and bind its exact source files."""

    prior_manifest = _strict_json(
        _read_regular(PRIOR_MANIFEST_PATH), "prior adaptive run manifest"
    )
    launch = _strict_json(_read_regular(PRIOR_LAUNCH_PATH), "prior adaptive launch")
    stored_terminal = _strict_json(
        _read_regular(PRIOR_TERMINAL_PATH), "prior adaptive terminal"
    )
    summary = _strict_json(
        _read_regular(PRIOR_SUMMARY_PATH), "prior adaptive durable summary"
    )
    if (
        launch.get("profile_index") != PROFILE_INDEX
        or launch.get("profile_sha256") != PROFILE_SHA256
        or launch.get("timeout_ms") != 300_000
        or launch.get("workers") != 2
        or type(launch.get("server")) is not str
    ):
        raise EqualityCoreError("prior adaptive launch identity drifted")
    try:
        replayed = adaptive.run_census(
            server=launch["server"],
            timeout_s=launch["timeout_ms"] // 1000,
            workers=launch["workers"],
        )
    except Exception as exc:
        raise EqualityCoreError(
            f"prior adaptive no-transport replay failed: {exc}"
        ) from exc
    if replayed != stored_terminal:
        raise EqualityCoreError("prior adaptive replay differs from its terminal file")
    if stored_terminal.get("terminal_sha256") != adaptive._self_hash(
        stored_terminal, "terminal_sha256"
    ):
        raise EqualityCoreError("prior adaptive terminal self-hash drifted")
    manifest_record = _file_record(PRIOR_MANIFEST_PATH)
    launch_record = _file_record(PRIOR_LAUNCH_PATH)
    terminal_record = _file_record(PRIOR_TERMINAL_PATH)
    summary_record = _file_record(PRIOR_SUMMARY_PATH)
    if (
        manifest_record["sha256"] != EXPECTED_PRIOR_HASHES["run_manifest_file"]
        or prior_manifest.get("manifest_sha256")
        != EXPECTED_PRIOR_HASHES["run_manifest_self"]
        or launch_record["sha256"] != EXPECTED_PRIOR_HASHES["launch_file"]
        or launch.get("launch_sha256") != EXPECTED_PRIOR_HASHES["launch_self"]
        or terminal_record["sha256"] != EXPECTED_PRIOR_HASHES["terminal_file"]
        or stored_terminal.get("terminal_sha256")
        != EXPECTED_PRIOR_HASHES["terminal_self"]
        or summary_record["sha256"]
        != EXPECTED_PRIOR_HASHES["durable_summary_file"]
        or summary.get("summary_sha256")
        != EXPECTED_PRIOR_HASHES["durable_summary_self"]
        or summary.get("summary_sha256")
        != adaptive._self_hash(summary, "summary_sha256")
        or summary.get("profile_index") != PROFILE_INDEX
        or summary.get("profile_sha256") != PROFILE_SHA256
    ):
        raise EqualityCoreError(
            "prior adaptive durable summary does not bind the replayed run"
        )
    for name in ("run_manifest", "launch", "terminal", "completed_resume"):
        if type(summary.get(name)) is not dict:
            raise EqualityCoreError(f"prior adaptive summary {name} is malformed")
    if (
        summary["run_manifest"].get("file_sha256") != manifest_record["sha256"]
        or summary["run_manifest"].get("manifest_sha256")
        != prior_manifest.get("manifest_sha256")
        or summary["launch"].get("file_sha256") != launch_record["sha256"]
        or summary["launch"].get("launch_sha256") != launch.get("launch_sha256")
        or summary["terminal"].get("file_sha256") != terminal_record["sha256"]
        or summary["terminal"].get("terminal_sha256")
        != stored_terminal.get("terminal_sha256")
        or summary["completed_resume"].get("status") != "PASSED_NO_TRANSPORT"
    ):
        raise EqualityCoreError(
            "prior adaptive durable summary does not bind the replayed run"
        )
    witnesses = stored_terminal.get("fresh_witnesses")
    if type(witnesses) is not list or len(witnesses) != 2:
        raise EqualityCoreError(
            "prior adaptive terminal does not contain exactly two fresh gauges"
        )
    expected_solvers = ["z3", "cvc5"]
    class_records: list[dict[str, Any]] | None = None
    role_class: dict[str, str] | None = None
    rows: list[dict[str, Any]] | None = None
    bound_witnesses: list[dict[str, Any]] = []
    for index, witness in enumerate(witnesses):
        if (
            type(witness) is not dict
            or witness.get("solver") != expected_solvers[index]
        ):
            raise EqualityCoreError("prior adaptive fresh-gauge engine order drifted")
        order = witness.get("order")
        origin = witness.get("origin")
        if type(order) is not list or type(origin) is not dict:
            raise EqualityCoreError("prior adaptive fresh witness is malformed")
        system = _profile_system(order)
        validated_origin = adaptive._validate_origin(origin, order)
        if class_records is None:
            class_records = system["classes"]
            role_class = system["role_class"]
            rows = system["rows"]
        elif (
            system["classes"] != class_records
            or system["role_class"] != role_class
            or system["rows"] != rows
        ):
            raise EqualityCoreError(
                "fresh gauges disagree on the order-independent source core"
            )
        bound_witnesses.append(
            {
                "solver": witness["solver"],
                "order": order,
                "order_sha256": adaptive.order_sha256(order),
                "origin_sha256": validated_origin["origin_sha256"],
            }
        )
    summary_fresh = summary.get("fresh_orders")
    planar_targets = stored_terminal.get("planar_targets")
    if type(summary_fresh) is not list or len(summary_fresh) != 2 or type(planar_targets) is not dict:
        raise EqualityCoreError("prior adaptive durable summary fresh orders are malformed")
    for index, bound in enumerate(bound_witnesses):
        summarized = summary_fresh[index]
        target = planar_targets.get(f"planar-fresh-{bound['order_sha256'][:20]}")
        if type(summarized) is not dict or type(target) is not dict:
            raise EqualityCoreError("prior adaptive summarized planar target is malformed")
        engines = target.get("engines")
        if type(engines) is not list or any(type(engine) is not dict for engine in engines):
            raise EqualityCoreError("prior adaptive terminal planar engines are malformed")
        if (
            {key: summarized.get(key) for key in ("solver", "order", "order_sha256", "origin_sha256")}
            != bound
            or summarized.get("planar_statuses")
            != [engine.get("raw_status") for engine in engines]
            or summarized.get("planar_result_sha256") != target.get("result_sha256")
            or type(summarized.get("planar_solve_ms")) is not dict
        ):
            raise EqualityCoreError("prior adaptive durable summary fresh orders drifted")
    assert class_records is not None and role_class is not None and rows is not None
    return {
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "files": {
            "run_manifest": manifest_record,
            "launch": launch_record,
            "terminal": terminal_record,
            "durable_summary": summary_record,
        },
        "run_manifest_self_sha256": prior_manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "terminal_sha256": stored_terminal["terminal_sha256"],
        "durable_summary_sha256": summary["summary_sha256"],
        "classes": class_records,
        "role_class": role_class,
        "rows": rows,
        "fresh_gauges": bound_witnesses,
        "completed_no_transport_replay": True,
    }


def _coordinate(class_id: str, anchors: Sequence[str] | None) -> tuple[str, str]:
    if anchors is not None:
        if class_id == anchors[0]:
            return "0", "0"
        if class_id == anchors[1]:
            return "1", "0"
    return f"x_{class_id}", f"y_{class_id}"


def _squared_distance(left: str, right: str, anchors: Sequence[str] | None) -> str:
    left_x, left_y = _coordinate(left, anchors)
    right_x, right_y = _coordinate(right, anchors)
    return f"({left_x}-{right_x})^2+({left_y}-{right_y})^2"


def _resolved_rows(prior: Mapping[str, Any]) -> list[dict[str, Any]]:
    role_class = prior["role_class"]
    return [
        {
            "id": row["id"],
            "center_role": row["center"],
            "center_class": role_class[row["center"]],
            "support_roles": list(row["support"]),
            "support_classes": [role_class[role] for role in row["support"]],
        }
        for row in prior["rows"]
    ]


def _polynomials(
    rows: Sequence[Mapping[str, Any]], anchors: Sequence[str] | None
) -> tuple[str, ...]:
    answer: list[str] = []
    for row in rows:
        support = row["support_classes"]
        center = row["center_class"]
        pivot = support[0]
        pivot_distance = _squared_distance(center, pivot, anchors)
        answer.extend(
            f"({pivot_distance})-({_squared_distance(center, point, anchors)})"
            for point in support[1:]
        )
    return tuple(answer)


def build_target_query(
    prior: Mapping[str, Any], gauge_index: int, *, timeout_s: int
) -> PreparedQuery:
    if gauge_index not in (0, 1):
        raise EqualityCoreError("fresh gauge index must be zero or one")
    gauge = prior["fresh_gauges"][gauge_index]
    system = _profile_system(gauge["order"])
    anchors = tuple(system["order"][:2])
    class_ids = tuple(row["id"] for row in system["classes"])
    variables = tuple(
        variable
        for class_id in class_ids
        if class_id not in anchors
        for variable in _coordinate(class_id, None)
    )
    rows = _resolved_rows(prior)
    template = _polynomials(rows, None)
    polynomials = _polynomials(rows, anchors)
    if len(variables) != 18 or len(polynomials) != 13 or len(template) != 13:
        raise EqualityCoreError(
            "equality target does not have 18 variables and 13 equalities"
        )
    script = equality_probe.singular_script(variables, polynomials)
    key = TARGET_KEYS[gauge_index]
    context = {
        "schema": SOURCE_CONTEXT_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "query": {
            "key": key,
            "kind": "target",
            "role": "gauge-invariance-regression",
            "gauge_index": gauge_index,
            "order_is_independent_evidence": False,
        },
        "prior_adaptive": dict(prior),
        "order": list(gauge["order"]),
        "order_sha256": gauge["order_sha256"],
        "origin_sha256": gauge["origin_sha256"],
        "anchors": {
            "rank_zero": {"class_id": anchors[0], "coordinate": [0, 0]},
            "rank_one": {"class_id": anchors[1], "coordinate": [1, 0]},
        },
        "class_map": {"classes": system["classes"], "role_class": system["role_class"]},
        "row_records": rows,
        "variables": list(variables),
        "variable_count": len(variables),
        "order_independent_polynomial_template": list(template),
        "order_independent_polynomial_template_sha256": _sha(
            _canonical(list(template))
        ),
        "ordered_polynomials": list(polynomials),
        "ordered_polynomials_sha256": _sha(_canonical(list(polynomials))),
        "polynomial_count": len(polynomials),
        "script_sha256": _sha(script.encode("utf-8")),
        "omitted": OMITTED_LEDGER,
        "execution_profile": {
            "backend": "piqd-singular",
            "solver": "Singular",
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
            "timeout_seconds": timeout_s,
        },
        "claims": FALSE_CLAIMS,
    }
    request_id = str(uuid.uuid5(REQUEST_NAMESPACE, _sha(_canonical(context))))
    return PreparedQuery(
        key, "target", None, variables, polynomials, script, context, request_id
    )


def _control_data(key: str) -> tuple[tuple[str, ...], tuple[str, ...], str]:
    cases = {
        "control-unit-linear": (("z",), ("z", "z-1"), "UNIT"),
        "control-nonunit-linear": (("z",), ("z^2-1",), "NONUNIT"),
        "control-unit-distance": (("x", "y"), ("x^2+y^2", "x^2+y^2-1"), "UNIT"),
        "control-nonunit-distance": (("x", "y"), ("x^2+y^2-1",), "NONUNIT"),
    }
    try:
        return cases[key]
    except KeyError as exc:
        raise EqualityCoreError(f"unknown control: {key}") from exc


def build_control_query(
    prior: Mapping[str, Any], key: str, *, timeout_s: int
) -> PreparedQuery:
    variables, polynomials, expected = _control_data(key)
    script = equality_probe.singular_script(variables, polynomials)
    context = {
        "schema": SOURCE_CONTEXT_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "query": {"key": key, "kind": "control", "expected": expected},
        "prior_adaptive": dict(prior),
        "anchors": None,
        "class_map": None,
        "row_records": [],
        "variables": list(variables),
        "variable_count": len(variables),
        "order_independent_polynomial_template": None,
        "order_independent_polynomial_template_sha256": None,
        "ordered_polynomials": list(polynomials),
        "ordered_polynomials_sha256": _sha(_canonical(list(polynomials))),
        "polynomial_count": len(polynomials),
        "script_sha256": _sha(script.encode("utf-8")),
        "omitted": OMITTED_LEDGER,
        "execution_profile": {
            "backend": "piqd-singular",
            "solver": "Singular",
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
            "timeout_seconds": timeout_s,
        },
        "claims": FALSE_CLAIMS,
    }
    request_id = str(uuid.uuid5(REQUEST_NAMESPACE, _sha(_canonical(context))))
    return PreparedQuery(
        key, "control", expected, variables, polynomials, script, context, request_id
    )


def prepare_queries(
    prior: Mapping[str, Any], *, timeout_s: int
) -> tuple[PreparedQuery, ...]:
    controls = tuple(
        build_control_query(prior, key, timeout_s=timeout_s) for key in CONTROL_KEYS
    )
    targets = tuple(
        build_target_query(prior, index, timeout_s=timeout_s) for index in range(2)
    )
    queries = (*controls, *targets)
    if [query.key for query in queries] != list(QUERY_KEYS):
        raise EqualityCoreError("query plan drifted")
    if (
        targets[0].source_context["order_independent_polynomial_template"]
        != targets[1].source_context["order_independent_polynomial_template"]
    ):
        raise EqualityCoreError("fresh gauges do not share one equality template")
    if targets[0].source_context["anchors"] == targets[1].source_context["anchors"]:
        raise EqualityCoreError("fresh orders do not provide distinct gauges")
    return queries


def _execution_fields(
    result: singular_backend.SingularExecutionResult,
) -> dict[str, Any]:
    return {
        "run_id": result.run_id,
        "run_status": result.run_status,
        "exit_code": result.exit_code,
        "request_sha256": result.request_sha256,
        "result_sha256": result.result_sha256,
        "script_sha256": result.script_sha256,
        "stdout_sha256": result.stdout_sha256,
        "stderr_sha256": result.stderr_sha256,
        "source_context_sha256": result.source_context_sha256,
        "receipt_sha256": result.receipt_sha256,
        "artifact_sha256": result.artifact_sha256,
        "replayed": result.replayed,
    }


def _validate_query_artifact(query: PreparedQuery, directory: Path) -> dict[str, Any]:
    try:
        result = singular_backend.validate_artifact_directory(directory)
    except singular_backend.PiqdSingularCustodyError as exc:
        raise EqualityCoreError(f"{query.key} artifact custody failed: {exc}") from exc
    if _read_regular(result.script_path) != query.script.encode("utf-8"):
        raise EqualityCoreError(f"{query.key} script differs from current producer")
    manifest = _strict_json(
        _read_regular(result.manifest_path), f"{query.key} backend manifest"
    )
    request = manifest.get("request")
    receipt = manifest.get("receipt")
    if (
        manifest.get("source_context") != query.source_context
        or type(request) is not dict
        or request.get("request_id") != query.request_id
        or request.get("project") != PIQD_PROJECT
        or request.get("timeout_s")
        != query.source_context["execution_profile"]["timeout_seconds"]
        or manifest.get("source") != PIQD_SOURCE
        or type(receipt) is not dict
    ):
        raise EqualityCoreError(f"{query.key} request or source context drifted")
    if (
        receipt.get("stdout_truncated") is not False
        or receipt.get("stderr_truncated") is not False
    ):
        raise EqualityCoreError(f"{query.key} contains a truncated Singular stream")
    verdict = "ERROR"
    detail: str | None = None
    if result.run_status == "TIMED_OUT":
        verdict, detail = "TIMEOUT", "PIQD Singular run timed out"
    elif result.run_status != "RAN":
        detail = f"PIQD Singular run status is {result.run_status}"
    elif result.exit_code != 0:
        detail = f"Singular exit code is {result.exit_code}"
    elif result.stdout is None or result.stderr is None:
        detail = "RAN Singular result lacks exact streams"
    elif result.stderr != b"":
        detail = "Singular emitted diagnostics on stderr"
    else:
        try:
            stdout = result.stdout.decode("utf-8", errors="strict")
        except UnicodeDecodeError:
            detail = "Singular stdout is not UTF-8"
        else:
            parsed = equality_probe.parse_singular_verdict(stdout)
            nonempty = [line.strip() for line in stdout.splitlines() if line.strip()]
            allowed = [
                equality_probe.VERDICT_BEGIN,
                "0" if parsed == "UNIT" else "1" if parsed == "NONUNIT" else "",
                equality_probe.VERDICT_END,
            ]
            if parsed in {"UNIT", "NONUNIT"} and nonempty == allowed:
                verdict = parsed
            else:
                detail = "malformed marker transcript or Singular stdout diagnostics"
    record = {
        "key": query.key,
        "kind": query.kind,
        "expected": query.expected,
        "verdict": verdict,
        "detail": detail,
        "request_id": query.request_id,
        "variables": len(query.variables),
        "polynomials": len(query.polynomials),
        "script_sha256": _sha(query.script.encode("utf-8")),
        "source_context_sha256": _sha(_canonical(query.source_context)),
        "artifact_directory": f"artifacts/{query.key}",
        "execution": _execution_fields(result),
    }
    record["query_result_sha256"] = _self_hash(record, "query_result_sha256")
    return record


def _execute_or_resume(
    query: PreparedQuery,
    directory: Path,
    runner: singular_backend.PiqdSingularRunner | None,
) -> dict[str, Any]:
    if directory.exists():
        return _validate_query_artifact(query, directory)
    if runner is None:
        raise EqualityCoreError(f"completed resume is missing {query.key}")
    try:
        returned = runner.execute(
            query.script.encode("utf-8"),
            source=PIQD_SOURCE,
            project=PIQD_PROJECT,
            request_id=query.request_id,
            timeout_s=query.source_context["execution_profile"]["timeout_seconds"],
            output_directory=directory,
            source_context=query.source_context,
        )
    except singular_backend.PiqdSingularCustodyError as exc:
        raise EqualityCoreError(
            f"{query.key} PIQD Singular execution failed: {exc}"
        ) from exc
    replayed = _validate_query_artifact(query, directory)
    if not isinstance(returned, singular_backend.SingularExecutionResult):
        raise EqualityCoreError(f"{query.key} runner returned the wrong result type")
    if _execution_fields(returned) != replayed["execution"]:
        raise EqualityCoreError(
            f"{query.key} returned execution differs from local replay"
        )
    return replayed


def _launch_record(
    root: Path,
    prior: Mapping[str, Any],
    queries: Sequence[PreparedQuery],
    *,
    server: str,
    timeout_s: int,
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": _sha(_read_regular(root / "run_manifest.json")),
        "server": server,
        "timeout_seconds": timeout_s,
        "workers": 1,
        "sequential": True,
        "local_fallback": False,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "prior_adaptive": dict(prior),
        "query_plan": [
            {
                "key": query.key,
                "kind": query.kind,
                "expected": query.expected,
                "request_id": query.request_id,
                "script_sha256": _sha(query.script.encode("utf-8")),
                "source_context_sha256": _sha(_canonical(query.source_context)),
            }
            for query in queries
        ],
        "claims": FALSE_CLAIMS,
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _classify(targets: Sequence[Mapping[str, Any]]) -> str:
    verdicts = [row.get("verdict") for row in targets]
    if verdicts == ["UNIT", "UNIT"]:
        return "BOTH_GAUGES_UNIT"
    if verdicts == ["NONUNIT", "NONUNIT"]:
        return "BOTH_GAUGES_NONUNIT"
    if set(verdicts) == {"UNIT", "NONUNIT"}:
        return "GAUGE_DISAGREEMENT"
    return "TARGET_INCONCLUSIVE"


def _terminal_record(
    launch: Mapping[str, Any],
    controls: Sequence[Mapping[str, Any]],
    targets: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": _classify(targets),
        "controls": list(controls),
        "targets": list(targets),
        "one_engine_discovery_only": True,
        "claim_boundary": "fixed equality ideal under two affine gauges",
        "claims": FALSE_CLAIMS,
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _validate_terminal(value: object) -> dict[str, Any]:
    if type(value) is not dict:
        raise EqualityCoreError("terminal record is not an object")
    if (
        value.get("schema") != TERMINAL_SCHEMA
        or value.get("claims") != FALSE_CLAIMS
        or value.get("status")
        not in {
            "BOTH_GAUGES_UNIT",
            "BOTH_GAUGES_NONUNIT",
            "GAUGE_DISAGREEMENT",
            "TARGET_INCONCLUSIVE",
        }
        or value.get("terminal_sha256") != _self_hash(value, "terminal_sha256")
    ):
        raise EqualityCoreError("terminal record is malformed")
    return dict(value)


def _validate_server(server: str) -> str:
    if type(server) is not str:
        raise EqualityCoreError("PIQD server must be a string")
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise EqualityCoreError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: int = 900,
    prior_revalidator: Callable[[], dict[str, Any]] = revalidate_prior_adaptive_run,
    runner_factory: Callable[
        ..., singular_backend.PiqdSingularRunner
    ] = singular_backend.PiqdSingularRunner,
) -> dict[str, Any]:
    """Execute or locally resume the six-query sequential diagnostic."""

    server = _validate_server(server)
    if (
        type(timeout_s) is not int
        or type(timeout_s) is bool
        or not 1 <= timeout_s <= singular_backend.MAX_TIMEOUT_S
    ):
        raise EqualityCoreError("timeout must be an integer in 1..86400 seconds")
    root, _manifest = ensure_run_root()
    prior = prior_revalidator()
    queries = prepare_queries(prior, timeout_s=timeout_s)
    launch = _launch_record(root, prior, queries, server=server, timeout_s=timeout_s)
    launch_path = root / "events" / "launch.json"
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists() and not launch_path.exists():
        raise EqualityCoreError("terminal exists without its immutable launch record")
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch record") != launch:
            raise EqualityCoreError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    if terminal_path.exists():
        stored = _validate_terminal(
            _strict_json(_read_regular(terminal_path), "terminal record")
        )
        results = [
            _execute_or_resume(query, root / "artifacts" / query.key, None)
            for query in queries
        ]
        controls, targets = results[:4], results[4:]
        for query, result in zip(queries[:4], controls, strict=True):
            if result["verdict"] != query.expected:
                raise EqualityCoreError(
                    f"control {query.key} expected {query.expected}, got {result['verdict']}"
                )
        expected_terminal = _terminal_record(launch, controls, targets)
        if stored != expected_terminal:
            raise EqualityCoreError(
                "terminal record differs from complete local replay"
            )
        if {entry.name for entry in (root / "artifacts").iterdir()} != set(QUERY_KEYS):
            raise EqualityCoreError(
                "completed artifact inventory is partial or unbound"
            )
        return stored

    runner = runner_factory(server, max_poll_s=float(timeout_s + 300))
    results: list[dict[str, Any]] = []
    for query in queries:
        result = _execute_or_resume(query, root / "artifacts" / query.key, runner)
        results.append(result)
        if query.kind == "control" and result["verdict"] != query.expected:
            raise EqualityCoreError(
                f"control {query.key} expected {query.expected}, got {result['verdict']}"
            )
    terminal = _terminal_record(launch, results[:4], results[4:])
    _create_once(terminal_path, _json(terminal))
    stored = _validate_terminal(
        _strict_json(_read_regular(terminal_path), "terminal record")
    )
    if stored != terminal or {
        entry.name for entry in (root / "artifacts").iterdir()
    } != set(QUERY_KEYS):
        raise EqualityCoreError("new terminal or artifact inventory failed replay")
    return stored


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=int, default=900)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_diagnostic(server=args.server, timeout_s=args.timeout)
    except (EqualityCoreError, singular_backend.PiqdSingularCustodyError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "CONTROL_KEYS",
    "FALSE_CLAIMS",
    "OMITTED_LEDGER",
    "PROFILE_INDEX",
    "PROFILE_SHA256",
    "QUERY_KEYS",
    "TARGET_KEYS",
    "EqualityCoreError",
    "PreparedQuery",
    "build_control_query",
    "build_target_query",
    "prepare_queries",
    "revalidate_prior_adaptive_run",
    "run_diagnostic",
]


if __name__ == "__main__":
    raise SystemExit(main())
