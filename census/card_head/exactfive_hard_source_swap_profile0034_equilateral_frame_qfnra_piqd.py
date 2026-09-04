"""Profile-0034 equilateral-frame radius-cell QF_NRA diagnostic.

This Class-C successor authenticates and replays the completed source-gauge
split wave.  It never resumes those predecessor sessions.  In each fixed
order, it scales every vertical coordinate by ``y = sqrt(3) * Y`` and uses the
two anchor row equations plus the order sign to substitute the apex c003.
Every solver request remains behind the maintained PIQD HTTP adapter.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import hashlib
import itertools
import json
import math
import os
import stat
import urllib.parse
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from fractions import Fraction
from pathlib import Path
from typing import Any, Literal

from census.card_head import (
    exactfive_hard_source_swap_bo_source_qfnra_piqd as bo_source,
)
from census.card_head import (
    exactfive_hard_source_swap_profile0034_source_gauge_split_qfnra_piqd as predecessor,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = "exactfive-hard-source-swap-profile0034-equilateral-frame-qfnra-piqd-20260904"
RUN_ID = "run-0002"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "equilateral-frame-qfnra-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_equilateral_frame_qfnra_piqd.py"
)
FAILURE_RECEIPT_PATH = REPOSITORY_ROOT / (
    "docs/audits/2026-09-04-profile0034-equilateral-frame-run0001-failure-receipt.json"
)
FAILURE_RECEIPT_FILE_SHA256 = (
    "f60bc9b1b9559fd03d5a6a5d0150f3611218c251d581b01fad3922a4add2d39a"
)
FAILURE_RECEIPT_SHA256 = (
    "f9c7ed4721da80975fdfe74b06ed34f5cdb710aa102c6feeaf10d177edf87ac0"
)

PREDECESSOR_ROOT = REPOSITORY_ROOT / (
    "scratch/runs/exactfive-hard-source-swap-profile0034-"
    "source-gauge-split-qfnra-piqd-20260904/run-0001"
)
PREDECESSOR_MANIFEST_PATH = PREDECESSOR_ROOT / "run_manifest.json"
PREDECESSOR_LAUNCH_PATH = PREDECESSOR_ROOT / "events/launch.json"
PREDECESSOR_TERMINAL_PATH = PREDECESSOR_ROOT / "events/terminal.json"
PREDECESSOR_PRODUCER_PATH = Path(predecessor.__file__).resolve()

PROFILE_INDEX = 34
PROFILE_SHA256 = predecessor.PROFILE_SHA256
PREDECESSOR_MANIFEST_FILE_SHA256 = (
    "e774b3de4835835d9bca53a7d6bb2ea4041605b96c78bfdf253a38f79c441161"
)
PREDECESSOR_LAUNCH_FILE_SHA256 = (
    "1f125da130379ff1f89f82baa87a3568ec9e4a6b120edf2678484b67ea7f40e9"
)
PREDECESSOR_TERMINAL_FILE_SHA256 = (
    "af4287b9221284eea281e26261f610b452779320e1f6d53c38e35d6f6b01a84a"
)
PREDECESSOR_MANIFEST_SHA256 = (
    "e5b8ea0abe6e71693c97ec41cda5b8d98ac29dc2114f651b62b0873028538979"
)
PREDECESSOR_LAUNCH_SHA256 = (
    "159c01803795b99f92540411606ab30b8032b28b3a4ec842fc03671a3927ae4b"
)
PREDECESSOR_TERMINAL_SHA256 = (
    "df6c3261b926038372b0002ac1270ee5f58a1f1d2e93769f1ae88e95b3770e70"
)
PREDECESSOR_PRODUCER_SHA256 = (
    "499de095f5c919604646e09b2e8f823b3f6e8d960c5accba3067a4cf0af2764d"
)

SYSTEM_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "equilateral-frame-radius-cell-qfnra-system/v1"
)
PRODUCER_VERSION = (
    "p97-exactfive-hard-source-swap-profile0034-equilateral-frame-radius-cell-qfnra/v1"
)
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "equilateral-frame-radius-cell-qfnra-launch/v1"
)
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-profile0034-"
    "equilateral-frame-radius-cell-qfnra-result/v1"
)

CONTROL_IDS = ("positive", "negative")
ORDER_IDS = predecessor.ORDER_IDS
BRANCH_IDS = ("lt", "gt")
BRANCH_RELATIONS = {"lt": "<", "gt": ">"}
TARGET_KEYS = tuple(
    f"{order_id}-radius-{branch_id}"
    for order_id in ORDER_IDS
    for branch_id in BRANCH_IDS
)
QUERY_KEYS = ("control-positive", "control-negative", *TARGET_KEYS)
MAX_WORKERS = 4
DEFAULT_WORKERS = 4
DEFAULT_TIMEOUT_S = 60.0
CLASS_IDS = predecessor.CLASS_IDS
FRAME_SUBSTITUTIONS = {
    "parent-z3-mirror": {
        "c000": ("0", "0"),
        "c001": ("1", "0"),
        "c003": ("(/ 1 2)", "(- (/ 1 2))"),
    },
    "parent-cvc5-direct": {
        "c000": ("0", "0"),
        "c001": ("1", "0"),
        "c003": ("(/ 1 2)", "(/ 1 2)"),
    },
}
FREE_CLASS_IDS = tuple(
    class_id for class_id in CLASS_IDS if class_id not in {"c000", "c001", "c003"}
)
TARGET_VARIABLES = tuple(
    f"{axis}_{class_id}" for class_id in FREE_CLASS_IDS for axis in ("x", "Y")
)
EXPECTED_ORDERS = predecessor.EXPECTED_ORDERS
EXPECTED_PREDECESSOR_RESULTS = {
    "control-negative": (
        "741c87cff78367002ef037f91efc01d2e7da803b2de6ce8fecae410aefc9b343"
    ),
    "control-positive": (
        "641b7e353ea96eb5a7430d6461af9d21f02437d49f84153afb31dd021a3e1821"
    ),
    "parent-cvc5-direct-radius-gt": (
        "709e0ee2eee441084f61945a54e0b05923ecb948d0ebf2271d157ffce514414a"
    ),
    "parent-cvc5-direct-radius-lt": (
        "ceeb4b6b61a21da03e21860cb3c800f2d1343e90e505420c555171cc0ac66992"
    ),
    "parent-z3-mirror-radius-gt": (
        "19a8de14dec75352dfe629e339917fa3a390ea1cbbcdb36cafd7f8ddc47972b5"
    ),
    "parent-z3-mirror-radius-lt": (
        "3165fb4448a34ab5b400404652953a459b8e6457f2a7cd5acd8472ecc349d3f2"
    ),
}
FALSE_CLAIMS = {
    "live_source_completeness": False,
    "source_realization": False,
    "all_order_elimination": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    (
        "census/card_head/exactfive_hard_source_swap_profile0034_"
        "equilateral_frame_qfnra_piqd.py"
    ),
    (
        "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_"
        "equilateral_frame_qfnra_piqd.py"
    ),
    (
        "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
        "equilateral-frame-qfnra-v1.md"
    ),
    (
        "scripts/run_exactfive_hard_source_swap_profile0034_"
        "equilateral_frame_qfnra_piqd.py"
    ),
]


class Profile0034EquilateralFrameError(RuntimeError):
    """The equilateral-frame radius-cell diagnostic failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=True
    ).encode("ascii")


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
        raise Profile0034EquilateralFrameError(f"artifact is missing: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise Profile0034EquilateralFrameError(f"unsafe artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034EquilateralFrameError(
            f"artifact changed while reading: {path}"
        )
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except Exception as exc:
        raise Profile0034EquilateralFrameError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise Profile0034EquilateralFrameError(f"{where} is not an object")
    return value


def authenticate_failure_receipt() -> dict[str, Any]:
    """Authenticate the bounded record of the quarantined run-0001 attempt."""

    payload = _read_regular(FAILURE_RECEIPT_PATH)
    receipt = _strict_json(payload, "run-0001 failure receipt")
    if (
        _sha(payload) != FAILURE_RECEIPT_FILE_SHA256
        or receipt.get("schema")
        != "p97-profile0034-equilateral-frame-run-failure-receipt/v1"
        or receipt.get("lane_id") != LANE_ID
        or receipt.get("run_id") != "run-0001"
        or receipt.get("lane_base_head") != "8a9e465584be89523b256f9838d40f89a6ff89ae"
        or receipt.get("producer_commit") != "fffc500b0c6e008dbdd8e3831fbc696af201198f"
        or receipt.get("producer")
        != {
            "path": (
                "census/card_head/exactfive_hard_source_swap_profile0034_"
                "equilateral_frame_qfnra_piqd.py"
            ),
            "sha256": (
                "f541f6a54a978a4928cd5f77f4f1ac16b44d776b3bef7e711fe192594783190f"
            ),
        }
        or receipt.get("run_manifest")
        != {
            "file_sha256": (
                "1b43ee693ed13e6a9debef099aaaad82e76724ad63a1a025b9fa98de6ed27a2a"
            ),
            "self_sha256": (
                "b332802f9262580a6ee188a2fcc359a28693ab63dd610085d51415117f773c91"
            ),
        }
        or receipt.get("launch")
        != {
            "file_sha256": (
                "1154375b92b624b76ade09f0bd3894e7ecac88c04334c24564fca3dfa9ec8791"
            ),
            "self_sha256": (
                "f6ee0707344a05cefb8dfdacef4a41a59947a61c719a87665e22eb7484648921"
            ),
        }
        or receipt.get("abort")
        != {
            "file_sha256": (
                "ace02798543713703dbf2133a41adcf05ff1e86ea519ed04bca7a0099eab8eb9"
            ),
            "self_sha256": (
                "81c7e47641469fddc69c478e910110cb1b1c35e9e763a6b029b0533e137e6b5a"
            ),
            "exit_code": 1,
            "status": "ABORTED_VALIDATOR_ATTRIBUTE_ERROR",
            "boundary": "verify_adapter_tree",
            "missing_attribute": "predecessor.frozen_order",
        }
        or receipt.get("submission")
        != {
            "submitted_queries": ["control-positive"],
            "target_queries_submitted": [],
            "unsubmitted_queries": ["control-negative", *TARGET_KEYS],
        }
        or receipt.get("partial_positive_control_custody")
        != {
            "result_file_sha256": (
                "aebe45a4f118740831edbd160b345675f5564908480407d7fdb38df17b9a322d"
            ),
            "artifact_file_count": 34,
            "artifact_digest_map_sha256": (
                "7c498bc9350611f60b94d0f6b420ab2b27736dd25c84c16d4dff78ee50e70167"
            ),
            "raw_statuses": ["SAT", "SAT"],
            "effective_statuses": [
                "SAT_SEMANTICALLY_REPLAYED",
                "SAT_SEMANTICALLY_REPLAYED",
            ],
        }
        or receipt.get("runner_stdout_sha256")
        != "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855"
        or receipt.get("original_run_path") != f"scratch/runs/{LANE_ID}/run-0001"
        or receipt.get("quarantine_path")
        != f"scratch/quarantine/{LANE_ID}-run-0001-aborted"
        or receipt.get("claims") != FALSE_CLAIMS
        or type(receipt.get("created_utc")) is not str
        or receipt.get("receipt_sha256") != FAILURE_RECEIPT_SHA256
        or receipt.get("receipt_sha256") != _self_hash(receipt, "receipt_sha256")
    ):
        raise Profile0034EquilateralFrameError("run-0001 failure receipt drifted")
    return dict(receipt)


def _predecessor_artifact_path(key: str, name: str) -> Path:
    return PREDECESSOR_ROOT / "artifacts" / key / name


def authenticate_predecessor_run() -> dict[str, Any]:
    """Replay the completed gauge-split wave and bind current producer bytes."""

    manifest_payload = _read_regular(PREDECESSOR_MANIFEST_PATH)
    launch_payload = _read_regular(PREDECESSOR_LAUNCH_PATH)
    terminal_payload = _read_regular(PREDECESSOR_TERMINAL_PATH)
    producer_payload = _read_regular(PREDECESSOR_PRODUCER_PATH)
    if (
        _sha(manifest_payload) != PREDECESSOR_MANIFEST_FILE_SHA256
        or _sha(launch_payload) != PREDECESSOR_LAUNCH_FILE_SHA256
        or _sha(terminal_payload) != PREDECESSOR_TERMINAL_FILE_SHA256
        or _sha(producer_payload) != PREDECESSOR_PRODUCER_SHA256
    ):
        raise Profile0034EquilateralFrameError("predecessor bytes drifted")
    manifest = _strict_json(manifest_payload, "predecessor run manifest")
    launch = _strict_json(launch_payload, "predecessor launch")
    terminal = _strict_json(terminal_payload, "predecessor terminal")
    created = manifest.get("created_utc")
    if (
        type(created) is not str
        or manifest.get("schema") != predecessor.RUN_MANIFEST_SCHEMA
        or manifest.get("manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or manifest.get("manifest_sha256") != _self_hash(manifest, "manifest_sha256")
        or manifest.get("source_digests", {}).get(
            PREDECESSOR_PRODUCER_PATH.relative_to(REPOSITORY_ROOT).as_posix()
        )
        != PREDECESSOR_PRODUCER_SHA256
        or manifest != predecessor._expected_run_manifest(created)
    ):
        raise Profile0034EquilateralFrameError("predecessor run manifest drifted")
    if (
        launch.get("schema") != predecessor.LAUNCH_SCHEMA
        or launch.get("run_manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or launch.get("launch_sha256") != PREDECESSOR_LAUNCH_SHA256
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
        or launch.get("timeout_ms") != 60_000
        or launch.get("workers") != 4
        or launch.get("queries") != list(predecessor.QUERY_KEYS)
    ):
        raise Profile0034EquilateralFrameError("predecessor launch drifted")
    if (
        terminal.get("schema") != predecessor.TERMINAL_SCHEMA
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
        or terminal.get("run_manifest_sha256") != PREDECESSOR_MANIFEST_SHA256
        or terminal.get("launch_sha256") != PREDECESSOR_LAUNCH_SHA256
        or terminal.get("terminal_sha256") != PREDECESSOR_TERMINAL_SHA256
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
        or terminal.get("claims") != predecessor.FALSE_CLAIMS
    ):
        raise Profile0034EquilateralFrameError("predecessor terminal drifted")

    parent_custody = predecessor.authenticate_predecessor_run()
    systems = {
        "control-positive": predecessor.build_control_system("positive"),
        "control-negative": predecessor.build_control_system("negative"),
        **{
            predecessor._target_key(order_id, branch_id): (
                predecessor._build_target_from_prior(
                    parent_custody, order_id, branch_id
                )
            )
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        },
    }
    results: dict[str, dict[str, Any]] = {}
    for key in predecessor.QUERY_KEYS:
        prepared = predecessor.prepare_query(systems[key], timeout_ms=60_000)
        results[key] = predecessor.verify_adapter_tree(
            prepared, PREDECESSOR_ROOT / "artifacts" / key
        )
        record = terminal.get("results", {}).get(key)
        if (
            type(record) is not dict
            or record.get("result_sha256") != EXPECTED_PREDECESSOR_RESULTS[key]
            or _sha(_read_regular(_predecessor_artifact_path(key, "result.json")))
            != EXPECTED_PREDECESSOR_RESULTS[key]
        ):
            raise Profile0034EquilateralFrameError(f"predecessor result drifted: {key}")
    if terminal != predecessor._terminal_record(PREDECESSOR_ROOT, launch, results):
        raise Profile0034EquilateralFrameError("predecessor terminal replay failed")
    for key in predecessor.TARGET_KEYS:
        engines = results[key].get("engines")
        if (
            type(engines) is not list
            or len(engines) != 2
            or [engine.get("raw_status") for engine in engines]
            != ["UNKNOWN", "UNKNOWN"]
        ):
            raise Profile0034EquilateralFrameError("split target verdict drifted")
    return {
        "schema": (
            "p97-exactfive-hard-source-swap-profile0034-"
            "equilateral-frame-predecessor-custody/v1"
        ),
        "run_manifest_file_sha256": PREDECESSOR_MANIFEST_FILE_SHA256,
        "run_manifest_sha256": PREDECESSOR_MANIFEST_SHA256,
        "launch_file_sha256": PREDECESSOR_LAUNCH_FILE_SHA256,
        "launch_sha256": PREDECESSOR_LAUNCH_SHA256,
        "terminal_file_sha256": PREDECESSOR_TERMINAL_FILE_SHA256,
        "terminal_sha256": PREDECESSOR_TERMINAL_SHA256,
        "producer_sha256": PREDECESSOR_PRODUCER_SHA256,
        "split_status": "TARGET_INCONCLUSIVE",
        "split_target_statuses": {
            key: ["UNKNOWN", "UNKNOWN"] for key in predecessor.TARGET_KEYS
        },
        "parent_custody": parent_custody,
        "orders": {order_id: list(EXPECTED_ORDERS[order_id]) for order_id in ORDER_IDS},
        "result_sha256s": dict(EXPECTED_PREDECESSOR_RESULTS),
    }


def _coordinate(order_id: str, class_id: str, axis: Literal["x", "Y"]) -> str:
    fixed = FRAME_SUBSTITUTIONS[order_id].get(class_id)
    if fixed is not None:
        return fixed[0 if axis == "x" else 1]
    if class_id not in FREE_CLASS_IDS:
        raise Profile0034EquilateralFrameError("unknown coordinate class")
    return f"{axis}_{class_id}"


def _delta(order_id: str, left: str, right: str, axis: Literal["x", "Y"]) -> str:
    return (
        f"(- {_coordinate(order_id, left, axis)} {_coordinate(order_id, right, axis)})"
    )


def _squared_distance(order_id: str, left: str, right: str) -> str:
    dx = _delta(order_id, left, right, "x")
    dY = _delta(order_id, left, right, "Y")
    return f"(+ (* {dx} {dx}) (* 3 {dY} {dY}))"


def _signed_area(order_id: str, a: str, b: str, c: str) -> str:
    bax = _delta(order_id, b, a, "x")
    baY = _delta(order_id, b, a, "Y")
    cax = _delta(order_id, c, a, "x")
    caY = _delta(order_id, c, a, "Y")
    return f"(- (* {bax} {caY}) (* {baY} {cax}))"


def _area_constraints(order_id: str, order: Sequence[str]) -> list[dict[str, Any]]:
    rows = [
        {
            "triple": list(triple),
            "relation": ">",
            "expression": _signed_area(order_id, *triple),
        }
        for triple in itertools.combinations(order, 3)
    ]
    if len(rows) != 286:
        raise Profile0034EquilateralFrameError("fixed-order area inventory drifted")
    return rows


def _row_equalities(order_id: str, source: Mapping[str, Any]) -> list[dict[str, Any]]:
    role = source["role_class"]
    equalities: list[dict[str, Any]] = []
    for row in source["rows"]:
        center = role[row["center"]]
        first_role = row["support"][0]
        first = role[first_role]
        for other_role in row["support"][1:]:
            if (row["id"], other_role) in {("T0", "c1"), ("K1", "a")}:
                continue
            other = role[other_role]
            equalities.append(
                {
                    "row_id": row["id"],
                    "center_role": row["center"],
                    "first_support_role": first_role,
                    "other_support_role": other_role,
                    "left": _squared_distance(order_id, center, first),
                    "right": _squared_distance(order_id, center, other),
                }
            )
    if len(equalities) != 11:
        raise Profile0034EquilateralFrameError("source row equality inventory drifted")
    return equalities


def _target_key(order_id: str, branch_id: str) -> str:
    return f"{order_id}-radius-{branch_id}"


def _build_target_from_prior(
    prior: Mapping[str, Any], order_id: str, branch_id: str
) -> dict[str, Any]:
    if order_id not in ORDER_IDS or branch_id not in BRANCH_IDS:
        raise Profile0034EquilateralFrameError("unknown target order or radius branch")
    order = tuple(prior["orders"][order_id])
    if order != EXPECTED_ORDERS[order_id]:
        raise Profile0034EquilateralFrameError("authenticated fixed order drifted")
    parent = predecessor._build_target_from_prior(
        prior["parent_custody"], order_id, branch_id
    )
    if tuple(parent["order"]) != order:
        raise Profile0034EquilateralFrameError("predecessor target order drifted")
    role = parent["role_class"]
    if role.get("c1") != "c000" or role.get("O") != "c001" or role.get("a") != "c003":
        raise Profile0034EquilateralFrameError("equilateral-frame roles drifted")
    fixed = _frame_coordinates(order_id)
    anchor_triple = (
        ("c000", "c003", "c001")
        if order_id == "parent-z3-mirror"
        else ("c000", "c001", "c003")
    )
    if tuple(sorted(anchor_triple, key=order.index)) != anchor_triple:
        raise Profile0034EquilateralFrameError("anchor triple order drifted")
    if (
        _distance_value(fixed, "c001", "c003") != 1
        or _distance_value(fixed, "c001", "c000") != 1
        or _distance_value(fixed, "c000", "c001") != 1
        or _distance_value(fixed, "c000", "c003") != 1
        or _area_value(fixed, *anchor_triple) != Fraction(1, 2)
    ):
        raise Profile0034EquilateralFrameError("equilateral-frame derivation drifted")
    c2, old, new = role["c2"], role["O"], role["d"]
    e, d, a = role["e"], role["d"], role["a"]
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": _target_key(order_id, branch_id),
        "order_id": order_id,
        "branch_id": branch_id,
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "classes": parent["classes"],
        "role_class": role,
        "rows": parent["rows"],
        "order": list(order),
        "ranks": parent["ranks"],
        "variables": list(TARGET_VARIABLES),
        "equilateral_frame": {
            "class_c1": "c000",
            "class_O": "c001",
            "class_a": "c003",
            "vertical_coordinate": "Y",
            "original_vertical_scale_squared": 3,
            "substitution": {
                "c000": ["0", "0"],
                "c001": ["1", "0"],
                "c003": (
                    ["1/2", "-1/2"]
                    if order_id == "parent-z3-mirror"
                    else ["1/2", "1/2"]
                ),
            },
            "emitted_assertions": 0,
            "removed_row_equalities": [
                {"row_id": "T0", "other_support_role": "c1"},
                {"row_id": "K1", "other_support_role": "a"},
            ],
            "anchor_derivation": {
                "apex_x": "1/2",
                "apex_Y_squared": "1/4",
                "order_area_triple": list(anchor_triple),
                "order_area_value": "1/2",
            },
        },
        "strict_signed_areas": _area_constraints(order_id, order),
        "source_row_equalities": _row_equalities(order_id, parent),
        "radius_branch": {
            "left": _squared_distance(order_id, c2, old),
            "right": _squared_distance(order_id, c2, new),
            "left_roles": ["c2", "O"],
            "right_roles": ["c2", "d"],
            "relation": BRANCH_RELATIONS[branch_id],
        },
        "source_strict": {
            "left": _squared_distance(order_id, e, d),
            "right": _squared_distance(order_id, e, a),
            "left_roles": ["e", "d"],
            "right_roles": ["e", "a"],
            "relation": "<",
        },
        "predecessor_custody_sha256": _sha(_canonical(prior)),
        "claims": dict(FALSE_CLAIMS),
    }


def build_target_system(order_id: str, branch_id: str) -> dict[str, Any]:
    return _build_target_from_prior(authenticate_predecessor_run(), order_id, branch_id)


def build_control_system(control: Literal["positive", "negative"]) -> dict[str, Any]:
    if control not in CONTROL_IDS:
        raise Profile0034EquilateralFrameError("unknown control")
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": f"control-{control}",
        "control": control,
        "variables": ["t"],
        "claims": dict(FALSE_CLAIMS),
    }


def _validate_system_current(
    system: object, prior: Mapping[str, Any] | None = None
) -> dict[str, Any]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034EquilateralFrameError("semantic system is malformed")
    if system.get("kind") == "control":
        expected = build_control_system(system.get("control"))
    elif system.get("kind") == "target":
        expected = _build_target_from_prior(
            prior or authenticate_predecessor_run(),
            system.get("order_id"),
            system.get("branch_id"),
        )
    else:
        raise Profile0034EquilateralFrameError("semantic system kind is invalid")
    if system != expected:
        raise Profile0034EquilateralFrameError(
            "semantic system drifted from current producer"
        )
    return dict(system)


def formula_inventory(system: Mapping[str, Any]) -> dict[str, int]:
    if system["kind"] == "control":
        return {
            "coordinate_variable_declarations": 0,
            "control_variable_declarations": 1,
            "gauge_assertions": 0,
            "strict_signed_area_assertions": 0,
            "row_equality_assertions": 0,
            "strict_radius_branch_assertions": 0,
            "source_strict_assertions": 0,
            "control_assertions": 1 if system["control"] == "positive" else 2,
        }
    return {
        "coordinate_variable_declarations": len(system["variables"]),
        "control_variable_declarations": 0,
        "gauge_assertions": 0,
        "strict_signed_area_assertions": len(system["strict_signed_areas"]),
        "row_equality_assertions": len(system["source_row_equalities"]),
        "strict_radius_branch_assertions": 1,
        "source_strict_assertions": 1,
        "control_assertions": 0,
    }


def _build_smt_commands_current(current: Mapping[str, Any]) -> tuple[str, ...]:
    out = ["(set-logic QF_NRA)"]
    out.extend(f"(declare-fun {variable} () Real)" for variable in current["variables"])
    if current["kind"] == "control":
        if current["control"] == "positive":
            out.append("(assert (= t 1))")
        else:
            out.extend(("(assert (= t 0))", "(assert (> t 0))"))
        return tuple(out)
    out.extend(
        f"(assert (> {entry['expression']} 0))"
        for entry in current["strict_signed_areas"]
    )
    out.extend(
        f"(assert (= {entry['left']} {entry['right']}))"
        for entry in current["source_row_equalities"]
    )
    radius = current["radius_branch"]
    out.append(f"(assert ({radius['relation']} {radius['left']} {radius['right']}))")
    strict = current["source_strict"]
    out.append(f"(assert (< {strict['left']} {strict['right']}))")
    return tuple(out)


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    return _build_smt_commands_current(_validate_system_current(system))


def _source_record(
    prior: Mapping[str, Any], failure_receipt: Mapping[str, Any]
) -> dict[str, Any]:
    return {
        "schema": (
            "p97-exactfive-hard-source-swap-profile0034-"
            "equilateral-frame-radius-cell-source-record/v1"
        ),
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "predecessor_custody": dict(prior),
        "failure_receipt": dict(failure_receipt),
        "target_matrix": [
            {
                "key": _target_key(order_id, branch_id),
                "order_id": order_id,
                "branch_id": branch_id,
            }
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        ],
        "equilateral_frame": {
            "vertical_change": "original y = sqrt(3) * Y",
            "fixed_classes": ["c000", "c001", "c003"],
            "weighted_distance_vertical_coefficient": 3,
        },
        "claim_boundary": (
            "four authenticated fixed-order equilateral-frame radius cells only"
        ),
        "claims": dict(FALSE_CLAIMS),
    }


def _source_snapshots(
    prior: Mapping[str, Any], failure_receipt: Mapping[str, Any]
) -> tuple[adapter.SourceSnapshot, ...]:
    sources = [
        adapter.SourceSnapshot(
            "0000-source-record.json", _json(_source_record(prior, failure_receipt))
        ),
        adapter.SourceSnapshot(
            "predecessor-run-manifest.json", _read_regular(PREDECESSOR_MANIFEST_PATH)
        ),
        adapter.SourceSnapshot(
            "predecessor-launch.json", _read_regular(PREDECESSOR_LAUNCH_PATH)
        ),
        adapter.SourceSnapshot(
            "predecessor-terminal.json", _read_regular(PREDECESSOR_TERMINAL_PATH)
        ),
        adapter.SourceSnapshot(
            "run-0001-failure-receipt.json", _read_regular(FAILURE_RECEIPT_PATH)
        ),
        adapter.SourceSnapshot(
            "implementation-current.py", _read_regular(Path(__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-predecessor.py", _read_regular(PREDECESSOR_PRODUCER_PATH)
        ),
        adapter.SourceSnapshot(
            "implementation-exact-parser.py", _read_regular(Path(bo_source.__file__))
        ),
        adapter.SourceSnapshot(
            "implementation-adapter.py", _read_regular(Path(adapter.__file__))
        ),
        adapter.SourceSnapshot("specification.md", _read_regular(SPEC_PATH)),
    ]
    for key in predecessor.QUERY_KEYS:
        sources.append(
            adapter.SourceSnapshot(
                f"predecessor-{key}-result.json",
                _read_regular(_predecessor_artifact_path(key, "result.json")),
            )
        )
    return tuple(sorted(sources, key=lambda item: item.path))


def _prepare_query_with_prior(
    system: dict[str, Any], prior: Mapping[str, Any], *, timeout_ms: int
) -> PreparedQuery:
    failure_receipt = authenticate_failure_receipt()
    current = _validate_system_current(system, prior)
    commands = _build_smt_commands_current(current)
    journal = b"".join(command.encode("ascii") + b"\n" for command in commands)
    normalized, normalized_journal = adapter.normalize_state_journal(journal)
    if normalized != commands or normalized_journal != journal:
        raise Profile0034EquilateralFrameError("SMT journal normalization drifted")
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "system": current,
        "system_sha256": _sha(_canonical(current)),
        "formula_inventory": formula_inventory(current),
        "journal_sha256": _sha(journal),
        "predecessor_custody_sha256": _sha(_canonical(prior)),
        "failure_receipt_sha256": _sha(_canonical(failure_receipt)),
        "claims": dict(FALSE_CLAIMS),
    }
    sources = _source_snapshots(prior, failure_receipt)
    variables = sorted(
        (
            {"id": variable.replace("_", "-"), "term": variable, "sort": "Real"}
            for variable in current["variables"]
        ),
        key=lambda item: item["id"],
    )
    descriptor = {
        "schema": adapter.QUERY_SCHEMA,
        "producer": {
            "id": "p97-exactfive-profile0034-equilateral-frame-radius-cell-qfnra",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "exact-rational-profile0034-equilateral-frame-radius-cell-replay",
            "version": "v1",
        },
        "stage_id": "profile0034-equilateral-frame-radius-cell-qfnra",
        "query_id": current["key"],
        "sources": [
            {
                "path": item.path,
                "bytes": len(item.payload),
                "sha256": _sha(item.payload),
            }
            for item in sources
        ],
        "semantic_input": semantic,
        "semantic_sha256": _sha(_canonical(semantic)),
        "original_smt2": {
            "path": "query.smt2",
            "bytes": len(journal),
            "sha256": _sha(journal),
        },
        "variables": variables,
        "named_atoms": [],
        "solve": {
            "assumption_ids": [],
            "readback_variable_ids": [item["id"] for item in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": adapter.SOLVER_PROFILE_SCHEMA,
            "solvers": list(adapter.SOLVERS),
            "timeout_ms": timeout_ms,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor, _json(descriptor), journal, commands, journal, sources
    )
    return PreparedQuery(current["key"], current, query)


def prepare_query(system: dict[str, Any], *, timeout_ms: int = 60_000) -> PreparedQuery:
    if (
        type(timeout_ms) is not int
        or type(timeout_ms) is bool
        or not 0 < timeout_ms <= 3_600_000
    ):
        raise Profile0034EquilateralFrameError("query timeout is invalid")
    return _prepare_query_with_prior(
        system, authenticate_predecessor_run(), timeout_ms=timeout_ms
    )


def _frame_coordinates(order_id: str) -> dict[str, tuple[Fraction, Fraction]]:
    if order_id == "parent-z3-mirror":
        apex_Y = Fraction(-1, 2)
    elif order_id == "parent-cvc5-direct":
        apex_Y = Fraction(1, 2)
    else:
        raise Profile0034EquilateralFrameError("unknown fixed order")
    return {
        "c000": (Fraction(0), Fraction(0)),
        "c001": (Fraction(1), Fraction(0)),
        "c003": (Fraction(1, 2), apex_Y),
    }


def _parse_coordinates(
    values: str, terms: Sequence[str], order_id: str
) -> dict[str, tuple[Fraction, Fraction]]:
    try:
        parsed = bo_source.parse_exact_values(values, terms)
    except Exception as exc:
        raise Profile0034EquilateralFrameError(str(exc)) from exc
    coords = _frame_coordinates(order_id)
    for class_id in FREE_CLASS_IDS:
        coords[class_id] = (
            parsed[f"x_{class_id}"],
            parsed[f"Y_{class_id}"],
        )
    if set(coords) != set(CLASS_IDS):
        raise Profile0034EquilateralFrameError(
            "coordinate reconstruction is incomplete"
        )
    return coords


def _area_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str, c: str
) -> Fraction:
    ax, ay = coords[a]
    bx, by = coords[b]
    cx, cy = coords[c]
    return (bx - ax) * (cy - ay) - (by - ay) * (cx - ax)


def _distance_value(
    coords: Mapping[str, tuple[Fraction, Fraction]], a: str, b: str
) -> Fraction:
    ax, aY = coords[a]
    bx, bY = coords[b]
    return (ax - bx) ** 2 + 3 * (aY - bY) ** 2


def check_coordinates(
    system: Mapping[str, Any],
    coords: Mapping[str, tuple[Fraction, Fraction]],
) -> dict[str, Any]:
    order = tuple(system["order"])
    if set(coords) != set(CLASS_IDS) or any(
        len(coords[item]) != 2 for item in CLASS_IDS
    ):
        raise Profile0034EquilateralFrameError("coordinate replay is not total")
    if any(
        coords[class_id] != fixed
        for class_id, fixed in _frame_coordinates(system["order_id"]).items()
    ):
        return {"accepted": False, "reason": "equilateral_frame"}
    areas = [
        _area_value(coords, *triple) for triple in itertools.combinations(order, 3)
    ]
    if len(areas) != 286 or any(value <= 0 for value in areas):
        return {
            "accepted": False,
            "reason": "strict_fixed_order",
            "triple_count": len(areas),
            "min_area": str(min(areas)),
        }
    role = system["role_class"]
    for row in system["rows"]:
        center = role[row["center"]]
        distances = [
            _distance_value(coords, center, role[support]) for support in row["support"]
        ]
        if len(set(distances)) != 1:
            return {
                "accepted": False,
                "reason": f"row_{row['id']}",
                "values": [str(value) for value in distances],
            }
    left_radius = _distance_value(coords, role["c2"], role["O"])
    right_radius = _distance_value(coords, role["c2"], role["d"])
    relation = system["radius_branch"]["relation"]
    branch_holds = (
        left_radius < right_radius if relation == "<" else left_radius > right_radius
    )
    if not branch_holds:
        return {
            "accepted": False,
            "reason": "strict_radius_branch",
            "left": str(left_radius),
            "right": str(right_radius),
            "relation": relation,
        }
    left_source = _distance_value(coords, role["e"], role["d"])
    right_source = _distance_value(coords, role["e"], role["a"])
    if not left_source < right_source:
        return {
            "accepted": False,
            "reason": "source_strict",
            "left": str(left_source),
            "right": str(right_source),
        }
    return {
        "accepted": True,
        "triple_count": len(areas),
        "min_area": str(min(areas)),
        "source_row_equality_count": 13,
        "emitted_row_equality_count": 11,
        "radius_relation": relation,
    }


def _parse_control_value(values: str) -> dict[str, Fraction]:
    try:
        return bo_source.parse_exact_values(values, ("t",))
    except Exception as exc:
        raise Profile0034EquilateralFrameError(str(exc)) from exc


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if (
        solver not in adapter.SOLVERS
        or type(model) is not str
        or type(values) is not str
    ):
        raise Profile0034EquilateralFrameError("SAT replay payload is malformed")
    semantic = query.descriptor.get("semantic_input")
    if type(semantic) is not dict or semantic.get("schema") != SYSTEM_SCHEMA:
        raise Profile0034EquilateralFrameError("semantic input is malformed")
    prior = authenticate_predecessor_run()
    system = _validate_system_current(semantic.get("system"), prior)
    timeout_ms = query.descriptor.get("solver_profile", {}).get("timeout_ms")
    expected = _prepare_query_with_prior(system, prior, timeout_ms=timeout_ms).query
    if (
        query.descriptor_bytes != _json(query.descriptor)
        or query.descriptor != expected.descriptor
        or query.original_smt2 != expected.original_smt2
        or query.journal_smt2 != expected.journal_smt2
        or semantic.get("system_sha256") != _sha(_canonical(system))
        or semantic.get("formula_inventory") != formula_inventory(system)
        or semantic.get("journal_sha256") != _sha(query.original_smt2)
        or semantic.get("predecessor_custody_sha256") != _sha(_canonical(prior))
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034EquilateralFrameError(
            "descriptor, formula, or journal drifted"
        )
    try:
        if system["kind"] == "control":
            parsed = _parse_control_value(values)
            accepted = system["control"] == "positive" and parsed == {"t": Fraction(1)}
            evidence: dict[str, Any] = {
                "accepted": accepted,
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            coords = _parse_coordinates(values, query.get_values, system["order_id"])
            evidence = {
                **check_coordinates(system, coords),
                "exact_coordinate_count": len(coords),
                "free_coordinate_count": len(query.get_values),
            }
    except Profile0034EquilateralFrameError as exc:
        evidence = {
            "accepted": False,
            "reason": "exact_readback_unsupported",
            "failure": type(exc).__name__,
        }
    evidence.update(
        {
            "solver": solver,
            "model_sha256": _sha(model.encode("utf-8")),
            "values_sha256": _sha(values.encode("utf-8")),
            "system_sha256": _sha(_canonical(system)),
        }
    )
    return adapter.SemanticVerification(bool(evidence.get("accepted")), evidence)


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034EquilateralFrameError("adapter artifact record is malformed")
    name = record["path"]
    if type(name) is not str or not name or "/" in name or "\\" in name or name in seen:
        raise Profile0034EquilateralFrameError(
            "adapter artifact path is unsafe or duplicated"
        )
    payload = _read_regular(root / name)
    if (
        type(record["bytes"]) is not int
        or type(record["bytes"]) is bool
        or record["bytes"] != len(payload)
        or type(record["sha256"]) is not str
        or record["sha256"] != _sha(payload)
    ):
        raise Profile0034EquilateralFrameError(
            f"adapter artifact digest mismatch: {name}"
        )
    seen.add(name)
    return payload


def _validate_engine_artifact_labels(
    engine: Mapping[str, Any], labels: set[str]
) -> None:
    """Require the complete adapter artifact family for one engine."""

    raw = engine.get("raw_status")
    response_lost = engine.get("response_lost")
    reconciled = engine.get("reconciled_from_receipt")
    if (
        raw not in {"SAT", "UNSAT", "UNKNOWN"}
        or type(response_lost) is not bool
        or type(reconciled) is not bool
    ):
        raise Profile0034EquilateralFrameError(
            "engine status or reconciliation flags are malformed"
        )
    solve_label = "reconciled_solve" if response_lost else "solve"
    expected = {
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        solve_label,
        "closed_session",
    }
    if response_lost:
        expected.add("reconciliation_session")
    if raw == "SAT":
        expected.add("semantic")
    if reconciled is not response_lost or labels != expected:
        raise Profile0034EquilateralFrameError(
            "engine artifact inventory is incomplete or cross-bound"
        )


def verify_adapter_tree(
    prepared: PreparedQuery, output_directory: Path
) -> dict[str, Any]:
    """Revalidate immutable PIQD custody and exact SAT replay."""

    if not output_directory.is_dir() or output_directory.is_symlink():
        raise Profile0034EquilateralFrameError("adapter output directory is unsafe")
    result = _strict_json(
        _read_regular(output_directory / "result.json"), "adapter result"
    )
    if (
        result.get("schema") != adapter.RESULT_SCHEMA
        or result.get("claims") != adapter.FALSE_CLAIMS
    ):
        raise Profile0034EquilateralFrameError(
            "adapter result schema or claims drifted"
        )
    seen = {"result.json"}
    custody = result.get("custody")
    if type(custody) is not dict or set(custody) != {
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "manifest",
        "sources",
    }:
        raise Profile0034EquilateralFrameError("adapter custody is malformed")
    descriptor = _verify_artifact(output_directory, custody["descriptor"], seen)
    original = _verify_artifact(output_directory, custody["original_smt2"], seen)
    journal = _verify_artifact(output_directory, custody["journal_smt2"], seen)
    manifest_payload = _verify_artifact(output_directory, custody["manifest"], seen)
    if (
        descriptor != prepared.query.descriptor_bytes
        or original != prepared.query.original_smt2
        or journal != prepared.query.journal_smt2
        or result.get("source_manifest_sha256") != _sha(manifest_payload)
        or _strict_json(manifest_payload, "source manifest")
        != adapter._manifest(prepared.query)
    ):
        raise Profile0034EquilateralFrameError(
            "adapter query or source custody drifted"
        )
    source_records = custody["sources"]
    if type(source_records) is not list or len(source_records) != len(
        prepared.query.source_files
    ):
        raise Profile0034EquilateralFrameError("adapter source custody count drifted")
    for record, expected in zip(
        source_records, prepared.query.source_files, strict=True
    ):
        if _verify_artifact(output_directory, record, seen) != expected.payload:
            raise Profile0034EquilateralFrameError("adapter source snapshot differs")
    engines = result.get("engines")
    if type(engines) is not list or [
        row.get("solver") for row in engines if type(row) is dict
    ] != list(adapter.SOLVERS):
        raise Profile0034EquilateralFrameError("adapter engine inventory is malformed")
    for engine in engines:
        if type(engine) is not dict or engine.get("raw_status") not in {
            "SAT",
            "UNSAT",
            "UNKNOWN",
        }:
            raise Profile0034EquilateralFrameError("adapter engine status is malformed")
        artifacts = engine.get("artifacts")
        if type(artifacts) is not dict:
            raise Profile0034EquilateralFrameError(
                "adapter engine artifacts are malformed"
            )
        try:
            _validate_engine_artifact_labels(engine, set(artifacts))
        except Exception as exc:
            raise Profile0034EquilateralFrameError(
                "adapter artifact labels drifted"
            ) from exc
        payloads = {
            label: _verify_artifact(output_directory, record, seen)
            for label, record in artifacts.items()
        }
        bridge = bo_source.adaptive.PreparedQuery(
            prepared.key, "planar", prepared.system, None, prepared.query
        )
        try:
            custody_solve = bo_source.adaptive._validate_engine_custody(
                bridge, engine, payloads
            )
        except Exception as exc:
            raise Profile0034EquilateralFrameError(
                "adapter engine custody failed"
            ) from exc
        solve_label = "reconciled_solve" if engine.get("response_lost") else "solve"
        solve = _strict_json(payloads[solve_label], f"{engine['solver']} solve")
        digest = adapter.piqd_result_digest(solve)
        advisory = engine.get("result_digest_advisory")
        if (
            solve != custody_solve
            or solve.get("status") != engine["raw_status"]
            or solve.get("result_sha256") != digest
            or engine.get("result_sha256") != digest
            or type(advisory) is not dict
            or advisory.get("locally_recomputed") != digest
            or advisory.get("matches_daemon") is not True
        ):
            raise Profile0034EquilateralFrameError(
                "adapter solve digest is inconsistent"
            )
        raw = engine["raw_status"]
        effective = engine.get("effective_status")
        if raw == "UNSAT":
            if (
                effective != "UNSAT_DISCOVERY_ONLY"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034EquilateralFrameError(
                    "UNSAT custody classification drifted"
                )
        elif raw == "UNKNOWN":
            if (
                effective != "INCONCLUSIVE_UNKNOWN"
                or engine.get("semantic_replay") is not None
            ):
                raise Profile0034EquilateralFrameError(
                    "UNKNOWN custody classification drifted"
                )
        else:
            semantic = engine.get("semantic_replay")
            semantic_payload = payloads.get("semantic")
            if (
                semantic_payload is None
                or _strict_json(semantic_payload, f"{engine['solver']} semantic")
                != semantic
            ):
                raise Profile0034EquilateralFrameError("SAT semantic artifact drifted")
            try:
                verification = verify_sat_model(
                    prepared.query,
                    engine["solver"],
                    solve.get("model"),
                    solve.get("values"),
                )
            except Exception as exc:
                expected_semantic = {
                    "accepted": False,
                    "failure": type(exc).__name__,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                }
                if (
                    effective != "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE"
                    or semantic != expected_semantic
                ):
                    raise Profile0034EquilateralFrameError(
                        "SAT verifier-failure drifted"
                    ) from exc
            else:
                expected_semantic = {
                    "accepted": verification.accepted,
                    "evidence": verification.evidence,
                    "verifier": prepared.query.descriptor["semantic_verifier"],
                    "model_sha256": _sha(solve["model"].encode("utf-8")),
                    "values_sha256": _sha(solve["values"].encode("utf-8")),
                }
                expected_effective = (
                    "SAT_SEMANTICALLY_REPLAYED"
                    if verification.accepted
                    else "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED"
                )
                if semantic != expected_semantic or effective != expected_effective:
                    raise Profile0034EquilateralFrameError(
                        "SAT semantic replay drifted"
                    )
    effective_statuses = [engine.get("effective_status") for engine in engines]
    raw_statuses = [engine.get("raw_status") for engine in engines]
    expected_overall = (
        "INCONCLUSIVE"
        if any(
            type(status) is str and status.startswith("INCONCLUSIVE")
            for status in effective_statuses
        )
        else "INCONCLUSIVE_CROSS_SOLVER_DISAGREEMENT"
        if len(set(raw_statuses)) != 1
        else "FINITE_DIAGNOSTIC_COMPLETE"
    )
    if result.get("overall_status") != expected_overall:
        raise Profile0034EquilateralFrameError("adapter overall status is inconsistent")
    entries = tuple(output_directory.iterdir())
    if (
        any(
            entry.is_symlink()
            or not entry.is_file()
            or entry.stat(follow_symlinks=False).st_nlink != 1
            for entry in entries
        )
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034EquilateralFrameError(
            "adapter output contains unbound artifacts"
        )
    return dict(result)


def run_query(
    prepared: PreparedQuery,
    output_directory: Path,
    transport: adapter.PiqdTransport,
) -> dict[str, Any]:
    if output_directory.exists():
        return verify_adapter_tree(prepared, output_directory)
    adapter.run_source_semantic_query(
        prepared.query, output_directory, transport, verify_sat_model
    )
    return verify_adapter_tree(prepared, output_directory)


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034EquilateralFrameError(
            "manifest path lies outside repository"
        ) from exc


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read_regular(path)) for path in sorted(paths)}


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    if (
        checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034EquilateralFrameError("lane checkpoint drifted")
    return checkpoint


def _manifest_inputs() -> list[Path]:
    inputs = [
        PREDECESSOR_MANIFEST_PATH,
        PREDECESSOR_LAUNCH_PATH,
        PREDECESSOR_TERMINAL_PATH,
        FAILURE_RECEIPT_PATH,
    ]
    for key in predecessor.QUERY_KEYS:
        inputs.extend(
            (
                _predecessor_artifact_path(key, "result.json"),
                _predecessor_artifact_path(key, "source-manifest.json"),
            )
        )
    return inputs


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    source_paths = [
        Path(__file__),
        SPEC_PATH,
        RUNNER_PATH,
        FAILURE_RECEIPT_PATH,
        PREDECESSOR_PRODUCER_PATH,
        Path(bo_source.__file__),
        Path(adapter.__file__),
    ]
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_digest_map(source_paths),
        "input_digests": _source_digest_map(_manifest_inputs()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    flags = os.O_WRONLY | os.O_CREAT | os.O_EXCL
    if hasattr(os, "O_NOFOLLOW"):
        flags |= os.O_NOFOLLOW
    try:
        descriptor = os.open(path, flags, 0o600)
    except FileExistsError as exc:
        raise Profile0034EquilateralFrameError(
            f"immutable artifact exists: {path}"
        ) from exc
    try:
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise Profile0034EquilateralFrameError("short immutable write")
            view = view[written:]
        os.fsync(descriptor)
    finally:
        os.close(descriptor)


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise Profile0034EquilateralFrameError(
            "prelaunch run root is missing or unsafe"
        )
    manifest_path = RUN_ROOT / "run_manifest.json"
    manifest = _strict_json(_read_regular(manifest_path), "run manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != _expected_run_manifest(created):
        raise Profile0034EquilateralFrameError(
            "prelaunch run manifest or source digest drifted"
        )
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        path.mkdir(exist_ok=True)
        if not path.is_dir() or path.is_symlink():
            raise Profile0034EquilateralFrameError("run-root child is unsafe")
    return RUN_ROOT, manifest


def _launch_record(
    manifest: Mapping[str, Any], server: str, timeout_ms: int, workers: int
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "queries": list(QUERY_KEYS),
        "case_matrix": [
            {
                "order_id": order_id,
                "branch_id": branch_id,
                "key": _target_key(order_id, branch_id),
            }
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        ],
        "server": server,
        "timeout_ms": timeout_ms,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "transport": "PIQD HTTP adapter only; fresh named session per engine and query",
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _result_record(root: Path, key: str, result: Mapping[str, Any]) -> dict[str, Any]:
    return {
        "overall_status": result.get("overall_status"),
        "raw_statuses": [
            engine.get("raw_status") for engine in result.get("engines", [])
        ],
        "effective_statuses": [
            engine.get("effective_status") for engine in result.get("engines", [])
        ],
        "result_sha256": _sha(_read_regular(root / "artifacts" / key / "result.json")),
    }


def _require_control(key: str, result: Mapping[str, Any]) -> None:
    expected = "SAT" if key == "control-positive" else "UNSAT"
    if [engine.get("raw_status") for engine in result.get("engines", [])] != [
        expected,
        expected,
    ]:
        raise Profile0034EquilateralFrameError(
            f"{key} did not produce {expected}/{expected}"
        )
    if expected == "SAT" and any(
        engine.get("effective_status") != "SAT_SEMANTICALLY_REPLAYED"
        for engine in result["engines"]
    ):
        raise Profile0034EquilateralFrameError("positive control failed exact replay")


def _terminal_status(targets: Sequence[Mapping[str, Any]]) -> str:
    engines = [engine for target in targets for engine in target["engines"]]
    if any(
        engine.get("effective_status") == "SAT_SEMANTICALLY_REPLAYED"
        for engine in engines
    ):
        return "TARGET_SAT_REPLAYED"
    if engines and all(engine.get("raw_status") == "UNSAT" for engine in engines):
        return "TARGETS_UNSAT_DISCOVERY_ONLY"
    return "TARGET_INCONCLUSIVE"


def _terminal_record(
    root: Path,
    launch: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> dict[str, Any]:
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": _terminal_status([results[key] for key in TARGET_KEYS]),
        "results": {key: _result_record(root, key, results[key]) for key in QUERY_KEYS},
        "claim_boundary": (
            "four authenticated fixed-order equilateral-frame radius cells only"
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict_json(_read_regular(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("status")
        not in {
            "TARGET_SAT_REPLAYED",
            "TARGETS_UNSAT_DISCOVERY_ONLY",
            "TARGET_INCONCLUSIVE",
        }
        or set(terminal.get("results", {})) != set(QUERY_KEYS)
        or terminal.get("terminal_sha256") != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034EquilateralFrameError("terminal record is malformed")
    return terminal


def _validate_server(server: str) -> str:
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise Profile0034EquilateralFrameError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
) -> dict[str, Any]:
    if (
        type(workers) is not int
        or type(workers) is bool
        or not 1 <= workers <= MAX_WORKERS
    ):
        raise Profile0034EquilateralFrameError(f"workers must lie in 1..{MAX_WORKERS}")
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or not 0 < timeout_s <= 3600
        or not float(timeout_s * 1000).is_integer()
    ):
        raise Profile0034EquilateralFrameError(
            "timeout must be a finite millisecond value"
        )
    timeout_ms = int(timeout_s * 1000)
    server = _validate_server(server)
    authenticate_failure_receipt()
    prior = authenticate_predecessor_run()
    root, manifest = ensure_run_root()
    launch = _launch_record(manifest, server, timeout_ms, workers)
    launch_path = root / "events" / "launch.json"
    if launch_path.exists():
        if _strict_json(_read_regular(launch_path), "launch") != launch:
            raise Profile0034EquilateralFrameError("immutable launch record drifted")
    else:
        _create_once(launch_path, _json(launch))
    systems = {
        "control-positive": build_control_system("positive"),
        "control-negative": build_control_system("negative"),
        **{
            _target_key(order_id, branch_id): _build_target_from_prior(
                prior, order_id, branch_id
            )
            for order_id in ORDER_IDS
            for branch_id in BRANCH_IDS
        },
    }
    prepared = {
        key: _prepare_query_with_prior(system, prior, timeout_ms=timeout_ms)
        for key, system in systems.items()
    }
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists():
        observed = _read_terminal(terminal_path)
        replayed = {
            key: verify_adapter_tree(prepared[key], root / "artifacts" / key)
            for key in QUERY_KEYS
        }
        if observed != _terminal_record(root, launch, replayed):
            raise Profile0034EquilateralFrameError(
                "terminal differs from artifact replay"
            )
        return observed
    transport = adapter.UrllibPiqdTransport(server)
    results: dict[str, dict[str, Any]] = {}
    for key in ("control-positive", "control-negative"):
        results[key] = run_query(prepared[key], root / "artifacts" / key, transport)
        _require_control(key, results[key])
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as pool:
        futures = {
            key: pool.submit(
                run_query, prepared[key], root / "artifacts" / key, transport
            )
            for key in TARGET_KEYS
        }
        for key in TARGET_KEYS:
            results[key] = futures[key].result()
    terminal = _terminal_record(root, launch, results)
    _create_once(terminal_path, _json(terminal))
    return terminal


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(
        description="Run the profile-0034 equilateral-frame radius-cell PIQD wave."
    )
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout-seconds", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    arguments = parser.parse_args(argv)
    terminal = run_diagnostic(
        server=arguments.server,
        timeout_s=arguments.timeout_seconds,
        workers=arguments.workers,
    )
    print(json.dumps(terminal, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())


__all__ = [
    "BRANCH_IDS",
    "CLASS_IDS",
    "DEFAULT_TIMEOUT_S",
    "DEFAULT_WORKERS",
    "FRAME_SUBSTITUTIONS",
    "FREE_CLASS_IDS",
    "MAX_WORKERS",
    "ORDER_IDS",
    "QUERY_KEYS",
    "TARGET_KEYS",
    "TARGET_VARIABLES",
    "Profile0034EquilateralFrameError",
    "authenticate_failure_receipt",
    "authenticate_predecessor_run",
    "build_control_system",
    "build_smt_commands",
    "build_target_system",
    "check_coordinates",
    "ensure_run_root",
    "formula_inventory",
    "main",
    "prepare_query",
    "run_diagnostic",
    "verify_adapter_tree",
    "verify_sat_model",
]
