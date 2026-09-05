"""Governed physical assertion deletion for the profile-0034 48-assertion core."""

from __future__ import annotations

import argparse
import concurrent.futures
import datetime as dt
import hashlib
import json
import math
import os
import re
import stat
import subprocess
import threading
import urllib.parse
import uuid
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from fractions import Fraction
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_profile0034_physical_block_deletion_piqd as parent,
)
from census.p97_search import phase3_piqd_smt_source_adapter as adapter

LANE_ID = (
    "exactfive-hard-source-swap-profile0034-physical-assertion-deletion-"
    "piqd-20260904"
)
RUN_ID = "run-0002"
SOLVER = "z3"
TIMEOUT_MS = 60_000
DEFAULT_TIMEOUT_S = 60.0
DEFAULT_WORKERS = 20
MAX_WORKERS = 20
QUERY_CAP = 160
ASSERTION_COUNT = 48
ASSERTION_IDS = tuple(f"assertion-{index:03d}" for index in range(ASSERTION_COUNT))
CONTROL_KEYS = ("z3-control-positive", "z3-control-negative")

REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch/runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = REPOSITORY_ROOT / ".codex/worktree-checkpoints" / f"{LANE_ID}.json"
TEST_PATH = REPOSITORY_ROOT / (
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_"
    "physical_assertion_deletion_piqd.py"
)
SPEC_PATH = REPOSITORY_ROOT / (
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-"
    "physical-assertion-deletion-v1.md"
)
RUNNER_PATH = REPOSITORY_ROOT / (
    "scripts/run_exactfive_hard_source_swap_profile0034_"
    "physical_assertion_deletion_piqd.py"
)
CHECKPOINT_OWNER = "profile0034-physical-assertion-deletion-impl"
CHECKPOINT_BASE_HEAD = "dae2e850eae19dca1fb59a431feacc7beccc8637"
_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_profile0034_physical_assertion_deletion_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_profile0034_physical_assertion_deletion_piqd.py",
    "docs/specs/p97-exactfive-hard-source-swap-profile0034-physical-assertion-deletion-v1.md",
    "scripts/run_exactfive_hard_source_swap_profile0034_physical_assertion_deletion_piqd.py",
]

PARENT_ROOT = parent.RUN_ROOT
PARENT_MANIFEST_PATH = PARENT_ROOT / "run_manifest.json"
PARENT_LAUNCH_PATH = PARENT_ROOT / "events/launch.json"
PARENT_TERMINAL_PATH = PARENT_ROOT / "events/terminal.json"
PARENT_PRODUCER_SHA256 = "f7a5a93cbd89f66ed03e3bef67b20b7eea939156849fa38faf18e1a431545c93"
PARENT_MANIFEST_FILE_SHA256 = "f323eb8971dda4cb326a0910b6a5a6e0622a54c6207e7f5beee95640fe40af9e"
PARENT_MANIFEST_SHA256 = "5d22048cc8618d178980222073ee0ffc432b9e9ea99ce515bf27d14024a0e9c5"
PARENT_LAUNCH_FILE_SHA256 = "9a33f09b319d5b4139357475ba3d8db04594885eb532decbd7e25b51c0e37056"
PARENT_LAUNCH_SHA256 = "b48486c3382c162ce7dd19ee50b968e5aafa15a2168d25e83960dd4b81efe072"
PARENT_TERMINAL_FILE_SHA256 = "b57c389e46f5b23adc4b6bd1c7e8056bb6ca3eed25b66933e0ab143a27129047"
PARENT_TERMINAL_SHA256 = "e389129fc08420de819ba94d2e1eb2cada434604447f5414fb828a61c56e9c40"
PARENT_SELECTED_KEYS = {
    "lt": "z3-lt-r014-17c3849855d03604-drop-ddd0d111fc3179ea",
    "gt": "z3-gt-r005-17c3849855d03604-drop-ddd0d111fc3179ea",
}
PARENT_SELECTED_RESULT_FILES = {
    "lt": "9d6bf93c9ffb573d1cb74b9e8a6bd3454796244fed1a4d63943672cc858f38e7",
    "gt": "37f433254052e77c86af81aaf66cfc1bd654eddb59eda61fa90a02f6634b32f6",
}
PARENT_SELECTED_RESULT_SHA256S = {
    "lt": "3f29cd80181ef3709de4cd8e85c2b9447a96e4b194ea950e08a49f5885929c16",
    "gt": "73bb7338ded61e9a96f67eceeb162605cff123dd36269cee9f921c17deec54bf",
}
PARENT_SELECTED_DESCRIPTOR_FILES = {
    "lt": "a25c708762b0782eee6b2b555be23ec88d653565e657541af19a8761e8e7cd6c",
    "gt": "fefd5743493831c7af25f0f825d36c7ab2b168fcdbf8207cc64a3d75090bfe53",
}
PARENT_COMMON_JOURNAL_SHA256 = (
    "145c725971e9eed706e19aca36768c73842047ead6c33dacdb47040d09307786"
)
PARENT_FINAL_GROUP_IDS = (
    "edge-index-00",
    "edge-index-01",
    "edge-index-03",
    "edge-index-04",
    "source-row-equality-00",
    "source-row-equality-01",
    "source-row-equality-03",
    "source-row-equality-05",
)

FALSE_CLAIMS = {
    "live_source_completeness": False,
    "core_minimality": False,
    "source_realization": False,
    "all_profile_execution": False,
    "lean_ingress": False,
    "live_closure": False,
    "promotion": False,
    "theorem": False,
}
SYSTEM_SCHEMA = "p97-exactfive-profile0034-physical-assertion-deletion-system/v1"
DESCRIPTOR_SCHEMA = "p97-smt-source-semantic-descriptor/v1"
SOLVER_PROFILE_SCHEMA = "piqd-solver-profile/v1"
RESULT_SCHEMA = "p97-exactfive-profile0034-physical-assertion-deletion-result/v1"
ROUND_SCHEMA = "p97-exactfive-profile0034-physical-assertion-deletion-round/v1"
LAUNCH_SCHEMA = "p97-exactfive-profile0034-physical-assertion-deletion-launch/v1"
TERMINAL_SCHEMA = "p97-exactfive-profile0034-physical-assertion-deletion-terminal/v1"
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
_FULL_COMMIT = re.compile(r"[0-9a-f]{40}")


class Profile0034PhysicalAssertionDeletionError(RuntimeError):
    """The assertion-deletion lane failed closed."""


@dataclass(frozen=True)
class QuerySpec:
    key: str
    round_index: int
    probe_index: int
    current_assertion_ids: tuple[str, ...]
    deleted_block: tuple[str, ...]
    retained_assertion_ids: tuple[str, ...]
    current_sha256: str
    block_sha256: str
    phase: str


@dataclass(frozen=True)
class PreparedQuery:
    spec: QuerySpec
    system: dict[str, Any]
    query: adapter.SourceSemanticQuery
    system_bytes: bytes

    @property
    def key(self) -> str:
        return self.spec.key


class SemanticVerdictCache:
    """Compute one exact SAT verdict for one immutable payload per process."""

    def __init__(self) -> None:
        self._lock = threading.Lock()
        self._values: dict[str, dict[str, Any]] = {}
        self.calls = 0

    def verify(
        self,
        query: adapter.SourceSemanticQuery,
        solver: str,
        model: str,
        values: str | None,
    ) -> adapter.SemanticVerification:
        key = _sha(
            _canonical(
                {
                    "descriptor": _sha(query.descriptor_bytes),
                    "journal": _sha(query.journal_smt2),
                    "solver": solver,
                    "model": _sha(model.encode("utf-8")),
                    "values": None
                    if values is None
                    else _sha(values.encode("utf-8")),
                }
            )
        )
        with self._lock:
            cached = self._values.get(key)
            if cached is None:
                verdict = verify_sat_model(query, solver, model, values)
                cached = {
                    "accepted": verdict.accepted,
                    "evidence": dict(verdict.evidence),
                }
                self._values[key] = cached
                self.calls += 1
        return adapter.SemanticVerification(cached["accepted"], cached["evidence"])


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def _json(value: object) -> bytes:
    return json.dumps(value, ensure_ascii=True, sort_keys=True, indent=2).encode(
        "utf-8"
    ) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _strict(payload: bytes, where: str) -> dict[str, Any]:
    try:
        value = adapter._strict_json(payload, where)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalAssertionDeletionError(f"{where} is invalid") from exc
    if type(value) is not dict:
        raise Profile0034PhysicalAssertionDeletionError(f"{where} is not an object")
    return value


def _read(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            f"required artifact is absent: {path}"
        ) from exc
    if path.is_symlink() or not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise Profile0034PhysicalAssertionDeletionError(f"unsafe artifact: {path}")
    if info.st_size < 0 or info.st_size > limit:
        raise Profile0034PhysicalAssertionDeletionError(f"artifact is too large: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise Profile0034PhysicalAssertionDeletionError(f"artifact changed: {path}")
    return payload


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT.resolve()).as_posix()
    except ValueError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "manifest path escapes repository"
        ) from exc


def _source_map(paths: Sequence[Path]) -> dict[str, str]:
    return {_repo_path(path): _sha(_read(path)) for path in sorted(set(paths))}


def _record(
    path: Path, *, file_sha: str, self_field: str, self_sha: str, where: str
) -> dict[str, Any]:
    payload = _read(path)
    value = _strict(payload, where)
    if (
        _sha(payload) != file_sha
        or value.get(self_field) != self_sha
        or value.get(self_field) != _self_hash(value, self_field)
    ):
        raise Profile0034PhysicalAssertionDeletionError(f"{where} custody drifted")
    return value


def _git_read(arguments: Sequence[str], where: str) -> bytes:
    process = subprocess.run(
        ["git", *arguments],
        cwd=REPOSITORY_ROOT,
        check=False,
        stdin=subprocess.DEVNULL,
        capture_output=True,
        timeout=30,
    )
    if process.returncode != 0 or process.stderr:
        raise Profile0034PhysicalAssertionDeletionError(f"git read failed: {where}")
    return process.stdout


def _parent_selected_paths(branch: str) -> tuple[Path, Path, Path, Path]:
    root = PARENT_ROOT / "artifacts" / PARENT_SELECTED_KEYS[branch]
    return (
        root / "result.json",
        root / "descriptor.json",
        root / "original.smt2",
        root / "journal.smt2",
    )


def _assertion_ledger(source_system: Mapping[str, Any]) -> list[dict[str, Any]]:
    groups = {
        row["group_id"]: row
        for row in parent.deletion.assertion_group_ledger(source_system)
    }
    rows: list[dict[str, Any]] = []
    for group_id in PARENT_FINAL_GROUP_IDS:
        group = groups.get(group_id)
        if type(group) is not dict:
            raise Profile0034PhysicalAssertionDeletionError(
                "parent assertion group is absent"
            )
        entries = group["source_entries"]
        commands = group["source_commands"]
        if len(entries) != len(commands):
            raise Profile0034PhysicalAssertionDeletionError(
                "parent assertion group is malformed"
            )
        for index, (entry, command) in enumerate(zip(entries, commands, strict=True)):
            assertion_id = f"assertion-{len(rows):03d}"
            rows.append(
                {
                    "assertion_id": assertion_id,
                    "source_index": len(rows),
                    "group_id": group_id,
                    "family": group["family"],
                    "entry_index": index,
                    "source_entry": entry,
                    "command": command,
                    "command_sha256": _sha(command.encode("ascii")),
                }
            )
    if (
        tuple(row["assertion_id"] for row in rows) != ASSERTION_IDS
        or len(rows) != ASSERTION_COUNT
        or sum(row["family"] == "supporting-edge" for row in rows) != 44
        or sum(row["family"] == "source-row-equality" for row in rows) != 4
    ):
        raise Profile0034PhysicalAssertionDeletionError(
            "the common assertion inventory drifted"
        )
    return rows


def _derive_parent_record(
    terminal: Mapping[str, Any], descriptors: Mapping[str, Mapping[str, Any]]
) -> dict[str, Any]:
    systems: dict[str, dict[str, Any]] = {}
    journals: dict[str, tuple[str, ...]] = {}
    for branch in ("lt", "gt"):
        descriptor = descriptors[branch]
        semantic = descriptor.get("semantic_input")
        system = semantic.get("system") if type(semantic) is dict else None
        original = descriptor.get("original_smt2")
        if (
            type(system) is not dict
            or tuple(system.get("retained_group_ids", ())) != PARENT_FINAL_GROUP_IDS
            or system.get("branch_id") != branch
            or type(system.get("source_system")) is not dict
            or type(original) is not dict
            or original.get("sha256") != PARENT_COMMON_JOURNAL_SHA256
            or terminal.get("branches", {}).get(branch, {}).get("selected_result", {}).get(
                "key"
            )
            != PARENT_SELECTED_KEYS[branch]
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "parent selected formula drifted"
            )
        systems[branch] = system
        journals[branch] = tuple(parent.build_smt_commands(system))
    if journals["lt"] != journals["gt"]:
        raise Profile0034PhysicalAssertionDeletionError(
            "parent selected journals mismatch"
        )
    common = journals["lt"]
    assertions = tuple(command for command in common if command.startswith("(assert "))
    preamble = tuple(command for command in common if not command.startswith("(assert "))
    ledger = _assertion_ledger(systems["lt"]["source_system"])
    if (
        tuple(row["command"] for row in ledger) != assertions
        or _sha(_journal(common)) != PARENT_COMMON_JOURNAL_SHA256
    ):
        raise Profile0034PhysicalAssertionDeletionError(
            "parent physical journal reconstruction failed"
        )
    gt_ledger = _assertion_ledger(systems["gt"]["source_system"])
    if [row["command"] for row in gt_ledger] != [row["command"] for row in ledger]:
        raise Profile0034PhysicalAssertionDeletionError(
            "parent branch assertion ledgers mismatch"
        )
    record = {
        "schema": "p97-exactfive-profile0034-physical-assertion-parent-custody/v1",
        "parent_producer_sha256": PARENT_PRODUCER_SHA256,
        "parent_manifest_sha256": PARENT_MANIFEST_SHA256,
        "parent_launch_sha256": PARENT_LAUNCH_SHA256,
        "parent_terminal_sha256": PARENT_TERMINAL_SHA256,
        "selected_keys": dict(PARENT_SELECTED_KEYS),
        "selected_result_sha256s": dict(PARENT_SELECTED_RESULT_SHA256S),
        "common_journal_sha256": PARENT_COMMON_JOURNAL_SHA256,
        "preamble_commands": list(preamble),
        "assertions": ledger,
        "source_system": systems["lt"]["source_system"],
        "source_system_sha256": _sha(_canonical(systems["lt"]["source_system"])),
        "claims": dict(FALSE_CLAIMS),
    }
    record["parent_custody_sha256"] = _self_hash(record, "parent_custody_sha256")
    return record


def authenticate_parent_run() -> dict[str, Any]:
    """Authenticate run-0005 and derive its byte-identical 48-assertion formula."""

    if _sha(_read(Path(parent.__file__))) != PARENT_PRODUCER_SHA256:
        raise Profile0034PhysicalAssertionDeletionError("parent producer bytes drifted")
    manifest = _record(
        PARENT_MANIFEST_PATH,
        file_sha=PARENT_MANIFEST_FILE_SHA256,
        self_field="manifest_sha256",
        self_sha=PARENT_MANIFEST_SHA256,
        where="parent manifest",
    )
    launch = _record(
        PARENT_LAUNCH_PATH,
        file_sha=PARENT_LAUNCH_FILE_SHA256,
        self_field="launch_sha256",
        self_sha=PARENT_LAUNCH_SHA256,
        where="parent launch",
    )
    terminal = _record(
        PARENT_TERMINAL_PATH,
        file_sha=PARENT_TERMINAL_FILE_SHA256,
        self_field="terminal_sha256",
        self_sha=PARENT_TERMINAL_SHA256,
        where="parent terminal",
    )
    if terminal.get("status") != "PHYSICAL_BLOCK_DELETION_COMPLETE":
        raise Profile0034PhysicalAssertionDeletionError("parent status drifted")
    try:
        predecessor = parent.authenticate_parent_runs()
        parent.verify_terminal_run(PARENT_ROOT, manifest, launch, predecessor)
    except Exception as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "parent terminal replay failed"
        ) from exc
    descriptors: dict[str, dict[str, Any]] = {}
    for branch in ("lt", "gt"):
        result_path, descriptor_path, original_path, journal_path = (
            _parent_selected_paths(branch)
        )
        result_payload = _read(result_path)
        descriptor_payload = _read(descriptor_path)
        original = _read(original_path)
        journal = _read(journal_path)
        result = _strict(result_payload, f"parent {branch} selected result")
        descriptor = _strict(descriptor_payload, f"parent {branch} descriptor")
        if (
            _sha(result_payload) != PARENT_SELECTED_RESULT_FILES[branch]
            or result.get("result_sha256") != PARENT_SELECTED_RESULT_SHA256S[branch]
            or result.get("result_sha256") != _self_hash(result, "result_sha256")
            or result.get("disposition") != "UNSAT_CUSTODY_VALID"
            or _sha(descriptor_payload) != PARENT_SELECTED_DESCRIPTOR_FILES[branch]
            or _sha(original) != PARENT_COMMON_JOURNAL_SHA256
            or original != journal
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "parent selected result custody drifted"
            )
        descriptors[branch] = descriptor
    return _derive_parent_record(terminal, descriptors)


def _journal(commands: Sequence[str]) -> bytes:
    return b"".join(command.encode("ascii") + b"\n" for command in commands)


def canonical_assertion_ids(assertion_ids: Sequence[str]) -> tuple[str, ...]:
    supplied = tuple(assertion_ids)
    if (
        len(supplied) != len(set(supplied))
        or not set(supplied) <= set(ASSERTION_IDS)
        or supplied
        != tuple(assertion_id for assertion_id in ASSERTION_IDS if assertion_id in supplied)
    ):
        raise Profile0034PhysicalAssertionDeletionError(
            "assertion list is not a canonical subset"
        )
    return supplied


def stable_partition(
    items: Sequence[str], granularity: int
) -> tuple[tuple[str, ...], ...]:
    values = tuple(items)
    if not values or type(granularity) is not int or granularity < 1:
        raise Profile0034PhysicalAssertionDeletionError("partition request is malformed")
    count = min(granularity, len(values))
    width, surplus = divmod(len(values), count)
    blocks: list[tuple[str, ...]] = []
    cursor = 0
    for index in range(count):
        size = width + (1 if index < surplus else 0)
        blocks.append(values[cursor : cursor + size])
        cursor += size
    if tuple(item for block in blocks for item in block) != values:
        raise Profile0034PhysicalAssertionDeletionError(
            "partition reconstruction failed"
        )
    return tuple(blocks)


def _use_block_phase(current: Sequence[str], granularity: int) -> bool:
    """Run block refinement until the granularity reaches the current size."""

    return len(current) > 1 and granularity < len(current)


def _ids_sha256(assertion_ids: Sequence[str]) -> str:
    return _sha(_canonical(list(assertion_ids)))


def control_spec(key: str) -> QuerySpec:
    if key not in CONTROL_KEYS:
        raise Profile0034PhysicalAssertionDeletionError("control key is invalid")
    return QuerySpec(key, 0, 0, (), (), (), _ids_sha256(()), _ids_sha256(()), "control")


def candidate_specs(
    current_assertion_ids: Sequence[str],
    deleted_blocks: Sequence[Sequence[str]],
    *,
    round_index: int,
    phase: str,
) -> tuple[QuerySpec, ...]:
    current = canonical_assertion_ids(current_assertion_ids)
    if not current or round_index < 1 or phase not in {"block", "singleton"}:
        raise Profile0034PhysicalAssertionDeletionError("candidate round is invalid")
    current_sha = _ids_sha256(current)
    specs: list[QuerySpec] = []
    for probe_index, supplied in enumerate(deleted_blocks, start=1):
        block = canonical_assertion_ids(supplied)
        if not block or not set(block) <= set(current):
            raise Profile0034PhysicalAssertionDeletionError("deleted block is invalid")
        retained = tuple(row for row in current if row not in set(block))
        block_sha = _ids_sha256(block)
        key = (
            f"z3-r{round_index:03d}-{current_sha[:16]}-"
            f"drop-{block_sha[:16]}"
        )
        specs.append(
            QuerySpec(
                key,
                round_index,
                probe_index,
                current,
                block,
                retained,
                current_sha,
                block_sha,
                phase,
            )
        )
    if len({spec.key for spec in specs}) != len(specs):
        raise Profile0034PhysicalAssertionDeletionError("candidate keys collided")
    return tuple(specs)


def query_spec_record(spec: QuerySpec) -> dict[str, Any]:
    return {
        "key": spec.key,
        "round_index": spec.round_index,
        "probe_index": spec.probe_index,
        "current_assertion_ids": list(spec.current_assertion_ids),
        "deleted_block": list(spec.deleted_block),
        "retained_assertion_ids": list(spec.retained_assertion_ids),
        "current_sha256": spec.current_sha256,
        "block_sha256": spec.block_sha256,
        "phase": spec.phase,
    }


def query_spec_from_record(record: object) -> QuerySpec:
    if type(record) is not dict or set(record) != {
        "key",
        "round_index",
        "probe_index",
        "current_assertion_ids",
        "deleted_block",
        "retained_assertion_ids",
        "current_sha256",
        "block_sha256",
        "phase",
    }:
        raise Profile0034PhysicalAssertionDeletionError("query spec is malformed")
    spec = QuerySpec(
        record["key"],
        record["round_index"],
        record["probe_index"],
        tuple(record["current_assertion_ids"]),
        tuple(record["deleted_block"]),
        tuple(record["retained_assertion_ids"]),
        record["current_sha256"],
        record["block_sha256"],
        record["phase"],
    )
    if spec.phase == "control":
        expected = control_spec(spec.key)
    else:
        expected_rows = candidate_specs(
            spec.current_assertion_ids,
            (spec.deleted_block,),
            round_index=spec.round_index,
            phase=spec.phase,
        )
        row = expected_rows[0]
        expected = QuerySpec(
            row.key,
            row.round_index,
            spec.probe_index,
            row.current_assertion_ids,
            row.deleted_block,
            row.retained_assertion_ids,
            row.current_sha256,
            row.block_sha256,
            row.phase,
        )
    if spec != expected:
        raise Profile0034PhysicalAssertionDeletionError("query spec custody drifted")
    return spec


def _control_system(key: str) -> dict[str, Any]:
    mode = "positive" if key == CONTROL_KEYS[0] else "negative"
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "control",
        "key": key,
        "control": mode,
        "claims": dict(FALSE_CLAIMS),
    }


def build_system(spec: QuerySpec, parent_record: Mapping[str, Any] | None) -> dict[str, Any]:
    if spec.phase == "control":
        return _control_system(spec.key)
    if (
        type(parent_record) is not dict
        or parent_record.get("parent_custody_sha256")
        != _self_hash(parent_record, "parent_custody_sha256")
        or tuple(row["assertion_id"] for row in parent_record.get("assertions", ()))
        != ASSERTION_IDS
    ):
        raise Profile0034PhysicalAssertionDeletionError("parent custody is malformed")
    canonical_assertion_ids(spec.retained_assertion_ids)
    return {
        "schema": SYSTEM_SCHEMA,
        "kind": "target",
        "key": spec.key,
        "query_spec": query_spec_record(spec),
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "source_system": parent_record["source_system"],
        "source_system_sha256": parent_record["source_system_sha256"],
        "assertions": parent_record["assertions"],
        "retained_assertion_ids": list(spec.retained_assertion_ids),
        "omitted_assertion_ids": [
            assertion_id
            for assertion_id in ASSERTION_IDS
            if assertion_id not in set(spec.retained_assertion_ids)
        ],
        "claims": dict(FALSE_CLAIMS),
    }


def build_smt_commands(system: Mapping[str, Any]) -> tuple[str, ...]:
    if (
        type(system) is not dict
        or system.get("schema") != SYSTEM_SCHEMA
        or system.get("claims") != FALSE_CLAIMS
    ):
        raise Profile0034PhysicalAssertionDeletionError("system is malformed")
    if system.get("kind") == "control":
        if system.get("control") == "positive":
            return ("(declare-fun t () Real)", "(assert (= t 1))")
        if system.get("control") == "negative":
            return (
                "(declare-fun t () Real)",
                "(assert (= t 0))",
                "(assert (= t 1))",
            )
        raise Profile0034PhysicalAssertionDeletionError("control system drifted")
    if system.get("kind") != "target":
        raise Profile0034PhysicalAssertionDeletionError("system kind is invalid")
    assertions = system.get("assertions")
    retained = canonical_assertion_ids(system.get("retained_assertion_ids", ()))
    if (
        type(assertions) is not list
        or tuple(row.get("assertion_id") for row in assertions) != ASSERTION_IDS
        or system.get("omitted_assertion_ids")
        != [row for row in ASSERTION_IDS if row not in set(retained)]
    ):
        raise Profile0034PhysicalAssertionDeletionError("assertion inventory drifted")
    preamble = ("(set-logic QF_NRA)",) + tuple(
        f"(declare-fun {variable} () Real)"
        for variable in system["source_system"]["variables"]
    )
    commands = preamble + tuple(
        row["command"] for row in assertions if row["assertion_id"] in set(retained)
    )
    if any("(=>" in command or " Bool" in command for command in commands):
        raise Profile0034PhysicalAssertionDeletionError("physical journal is guarded")
    return commands


def _manifest_sources() -> list[Path]:
    return sorted(
        set(
            [Path(__file__), TEST_PATH, SPEC_PATH, RUNNER_PATH, CHECKPOINT_PATH]
            + list(parent._manifest_sources())
            + [Path(parent.__file__), Path(adapter.__file__)]
        )
    )


def _manifest_inputs() -> list[Path]:
    paths = [PARENT_MANIFEST_PATH, PARENT_LAUNCH_PATH, PARENT_TERMINAL_PATH]
    for branch in ("lt", "gt"):
        paths.extend(_parent_selected_paths(branch))
    return sorted(set(paths))


def _source_snapshots(
    system: Mapping[str, Any], parent_record: Mapping[str, Any] | None
) -> tuple[adapter.SourceSnapshot, ...]:
    snapshots = [adapter.SourceSnapshot("0000-assertion-system.json", _json(system))]
    if system["kind"] == "target":
        if type(parent_record) is not dict:
            raise Profile0034PhysicalAssertionDeletionError("parent snapshot is absent")
        snapshots.append(
            adapter.SourceSnapshot("0001-parent-custody.json", _json(parent_record))
        )
        sources = _manifest_sources()
        inputs = _manifest_inputs()
    else:
        sources = [Path(__file__), Path(adapter.__file__)]
        inputs = []
    for index, path in enumerate(sources):
        name = _repo_path(path).replace("/", "--")
        snapshots.append(
            adapter.SourceSnapshot(f"source-{index:02d}-{name}", _read(path))
        )
    for index, path in enumerate(inputs):
        name = _repo_path(path).replace("/", "--")
        snapshots.append(
            adapter.SourceSnapshot(f"input-{index:02d}-{name}", _read(path))
        )
    names = [row.path for row in snapshots]
    if len(names) != len(set(names)):
        raise Profile0034PhysicalAssertionDeletionError("source names collided")
    return tuple(sorted(snapshots, key=lambda row: row.path))


def prepare_query(
    spec: QuerySpec,
    *,
    parent_record: Mapping[str, Any] | None = None,
    timeout_ms: int = TIMEOUT_MS,
) -> PreparedQuery:
    if timeout_ms != TIMEOUT_MS:
        raise Profile0034PhysicalAssertionDeletionError("timeout must be 60000ms")
    system = build_system(spec, parent_record)
    commands = build_smt_commands(system)
    journal = _journal(commands)
    try:
        normalized, normalized_journal = adapter.normalize_state_journal(journal)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "journal normalization failed"
        ) from exc
    if normalized != commands or normalized_journal != journal:
        raise Profile0034PhysicalAssertionDeletionError("journal normalization drifted")
    if system["kind"] == "control":
        variables = [{"id": "t", "term": "t", "sort": "Real"}]
    else:
        variables = sorted(
            (
                {"id": value.replace("_", "-"), "term": value, "sort": "Real"}
                for value in system["source_system"]["variables"]
            ),
            key=lambda row: row["id"],
        )
    semantic = {
        "schema": SYSTEM_SCHEMA,
        "system": system,
        "journal_sha256": _sha(journal),
        "parent_custody_sha256": system.get("parent_custody_sha256"),
        "claims": dict(FALSE_CLAIMS),
    }
    snapshots = _source_snapshots(system, parent_record)
    descriptor = {
        "schema": DESCRIPTOR_SCHEMA,
        "producer": {
            "id": "p97-profile0034-physical-assertion-deletion-piqd",
            "version": "v1",
        },
        "semantic_verifier": {
            "id": "profile0034-physical-assertion-exact-rational-replay",
            "version": "v1",
        },
        "stage_id": "exactfive-profile0034-physical-assertion-deletion",
        "query_id": spec.key,
        "sources": [
            {"path": row.path, "bytes": len(row.payload), "sha256": _sha(row.payload)}
            for row in snapshots
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
            "readback_variable_ids": [row["id"] for row in variables],
            "include_model": True,
        },
        "solver_profile": {
            "schema": SOLVER_PROFILE_SCHEMA,
            "solvers": [SOLVER],
            "timeout_ms": TIMEOUT_MS,
        },
    }
    query = adapter.SourceSemanticQuery(
        descriptor,
        _json(descriptor),
        journal,
        commands,
        journal,
        snapshots,
    )
    return PreparedQuery(spec, system, query, _json(system))


def _replay_assertions(
    system: Mapping[str, Any], coords: Mapping[str, tuple[Fraction, Fraction]]
) -> dict[str, Any]:
    source = parent.deletion.source
    if set(coords) != set(source.CLASS_IDS):
        raise Profile0034PhysicalAssertionDeletionError(
            "coordinate replay is not total"
        )
    fixed = source.predecessor._frame_coordinates(system["source_system"]["order_id"])
    if any(coords[class_id] != value for class_id, value in fixed.items()):
        return {"accepted": False, "reason": "fixed_frame"}
    retained = set(system["retained_assertion_ids"])
    checked = 0
    for row in system["assertions"]:
        if row["assertion_id"] not in retained:
            continue
        entry = row["source_entry"]
        if row["family"] == "supporting-edge":
            left, right = entry["edge"]
            value = source._area_value(coords, left, right, entry["vertex"])
            if value <= 0:
                return {
                    "accepted": False,
                    "reason": row["assertion_id"],
                    "value": str(value),
                }
        elif row["family"] == "source-row-equality":
            role = system["source_system"]["role_class"]
            center = role[entry["center_role"]]
            left = source._distance_value(
                coords, center, role[entry["first_support_role"]]
            )
            right = source._distance_value(
                coords, center, role[entry["other_support_role"]]
            )
            if left != right:
                return {
                    "accepted": False,
                    "reason": row["assertion_id"],
                    "left": str(left),
                    "right": str(right),
                }
        else:
            raise Profile0034PhysicalAssertionDeletionError(
                "assertion replay family drifted"
            )
        checked += 1
    if checked != len(retained):
        raise Profile0034PhysicalAssertionDeletionError("replay count drifted")
    return {
        "accepted": True,
        "retained_assertion_ids": list(system["retained_assertion_ids"]),
        "omitted_assertion_ids": list(system["omitted_assertion_ids"]),
        "checked_assertions": checked,
    }


def verify_sat_model(
    query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    if solver != SOLVER or type(model) is not str or type(values) is not str:
        raise Profile0034PhysicalAssertionDeletionError("SAT replay is malformed")
    semantic = query.descriptor.get("semantic_input")
    system = semantic.get("system") if type(semantic) is dict else None
    if (
        type(system) is not dict
        or semantic.get("schema") != SYSTEM_SCHEMA
        or build_smt_commands(system) != query.journal_commands
        or query.descriptor_bytes != _json(query.descriptor)
        or query.original_smt2 != _journal(query.journal_commands)
        or query.journal_smt2 != query.original_smt2
        or query.descriptor.get("named_atoms") != []
        or query.descriptor.get("solve", {}).get("assumption_ids") != []
        or semantic.get("journal_sha256") != _sha(query.journal_smt2)
        or query.descriptor.get("semantic_sha256") != _sha(_canonical(semantic))
    ):
        raise Profile0034PhysicalAssertionDeletionError("SAT descriptor drifted")
    try:
        if system["kind"] == "control":
            parsed = parent.deletion.source._parse_control_value(values)
            evidence: dict[str, Any] = {
                "accepted": system["control"] == "positive"
                and parsed == {"t": Fraction(1)},
                "control": system["control"],
                "values": {key: str(value) for key, value in parsed.items()},
            }
        else:
            source = parent.deletion.source
            coords = source._parse_coordinates(
                values, query.get_values, system["source_system"]["order_id"]
            )
            evidence = _replay_assertions(system, coords)
            evidence["exact_coordinate_count"] = len(coords)
            evidence["free_coordinate_count"] = len(query.get_values)
    except Exception as exc:
        allowed = (
            parent.deletion.source.Profile0034SupportingEdgeError,
            ValueError,
            KeyError,
        )
        if not isinstance(exc, allowed):
            raise
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


def classify_result(result: object) -> str:
    if type(result) is not dict or type(result.get("engine")) is not dict:
        return "MALFORMED"
    engine = result["engine"]
    raw = engine.get("raw_status")
    effective = engine.get("effective_status")
    provenance = engine.get("unsat_assumptions")
    if (
        raw == "UNSAT"
        and effective == "UNSAT_DISCOVERY_ONLY"
        and type(provenance) is dict
        and provenance.get("terminal_unsat") is True
        and provenance.get("named_core_support") is False
        and provenance.get("assumption_terms") == []
        and provenance.get("source_atom_ids") == []
    ):
        return "UNSAT_CUSTODY_VALID"
    if raw == "SAT" and effective == "SAT_SEMANTICALLY_REPLAYED":
        replay = engine.get("semantic_replay")
        return (
            "SAT_REPLAYED"
            if type(replay) is dict and replay.get("accepted") is True
            else "MALFORMED"
        )
    if raw == "SAT" and effective in {
        "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
        "INCONCLUSIVE_SEMANTIC_VERIFIER_FAILURE",
    }:
        return "SAT_REPLAY_UNRESOLVED"
    if raw == "UNKNOWN" and effective == "INCONCLUSIVE_UNKNOWN":
        return "UNKNOWN"
    if raw is None and effective == "INCONCLUSIVE_TRANSPORT_LOSS":
        return "TRANSPORT_LOST"
    return "MALFORMED"


def _query_request_id(prepared: PreparedQuery | str) -> str:
    key = prepared if type(prepared) is str else prepared.key
    return str(uuid.uuid5(uuid.NAMESPACE_URL, f"urn:p97:{LANE_ID}:{RUN_ID}:{key}"))


def _session_label(prepared: PreparedQuery) -> tuple[str, str]:
    profile_sha = _sha(_canonical(prepared.query.descriptor["solver_profile"]))
    label = (
        f"p97-smt-source/{prepared.key}/{SOLVER}/"
        f"{prepared.query.descriptor['semantic_sha256'][:12]}/"
        f"{_query_request_id(prepared)}/{profile_sha[:12]}"
    )
    return label, profile_sha


def _artifact_record(name: str, payload: bytes) -> dict[str, Any]:
    return {"path": name, "bytes": len(payload), "sha256": _sha(payload)}


def _read_fd_artifact(directory_fd: int, name: str) -> bytes:
    descriptor = os.open(
        name, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0), dir_fd=directory_fd
    )
    try:
        info = os.fstat(descriptor)
        if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
            raise Profile0034PhysicalAssertionDeletionError(
                "staged artifact is unsafe"
            )
        chunks: list[bytes] = []
        while chunk := os.read(descriptor, 65536):
            chunks.append(chunk)
        payload = b"".join(chunks)
        if len(payload) != info.st_size:
            raise Profile0034PhysicalAssertionDeletionError(
                "staged artifact changed"
            )
        return payload
    finally:
        os.close(descriptor)


def _verify_artifact(root: Path, record: object, seen: set[str]) -> bytes:
    if type(record) is not dict or set(record) != {"path", "bytes", "sha256"}:
        raise Profile0034PhysicalAssertionDeletionError("artifact record is malformed")
    name = record["path"]
    if (
        type(name) is not str
        or not name
        or "/" in name
        or "\\" in name
        or name in seen
    ):
        raise Profile0034PhysicalAssertionDeletionError("artifact path is unsafe")
    payload = _read(root / name)
    if record["bytes"] != len(payload) or record["sha256"] != _sha(payload):
        raise Profile0034PhysicalAssertionDeletionError("artifact digest drifted")
    seen.add(name)
    return payload


def _expected_semantic(
    prepared: PreparedQuery,
    solve: Mapping[str, Any],
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    verification = cache.verify(
        prepared.query, SOLVER, solve.get("model"), solve.get("values")
    )
    return {
        "accepted": verification.accepted,
        "evidence": verification.evidence,
        "verifier": prepared.query.descriptor["semantic_verifier"],
        "model_sha256": _sha(solve["model"].encode("utf-8")),
        "values_sha256": _sha(solve["values"].encode("utf-8")),
    }


def _validate_engine(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    payloads: Mapping[str, bytes],
    cache: SemanticVerdictCache,
) -> str:
    if type(engine) is not dict or set(engine) != parent.deletion._ENGINE_KEYS:
        raise Profile0034PhysicalAssertionDeletionError("engine keys drifted")
    raw = engine["raw_status"]
    if raw not in {"SAT", "UNSAT", "UNKNOWN", None}:
        raise Profile0034PhysicalAssertionDeletionError("engine status is unsupported")
    expected = {
        "session_create_request",
        "pre_append_smt2",
        "expected_post_append_smt2",
        "journal_frontiers",
        "solve_request",
        "session",
        "smt2",
        "receipts_before",
        "receipts",
        "session_lifecycle",
        "closed_session",
    }
    if raw is not None:
        expected.add("reconciled_solve" if engine["response_lost"] else "solve")
    if raw == "SAT":
        expected.add("semantic")
    if "reconciliation_session" in payloads:
        expected.add("reconciliation_session")
    if set(payloads) != expected:
        raise Profile0034PhysicalAssertionDeletionError(
            "engine artifact inventory drifted"
        )
    label, profile_sha = _session_label(prepared)
    request_id = _query_request_id(prepared)
    request_sha = adapter.piqd_solve_request_digest(prepared.query, ())
    create = _strict(payloads["session_create_request"], "session create request")
    if create != {
        "schema": "piqd-smt-session-create-request/v1",
        "request": {"solver": SOLVER, "lane": "smt", "label": label},
        "request_id": request_id,
        "session_label": label,
        "solver_profile": prepared.query.descriptor["solver_profile"],
        "solver_profile_sha256": profile_sha,
    }:
        raise Profile0034PhysicalAssertionDeletionError(
            "session create request drifted"
        )
    if (
        payloads["pre_append_smt2"] != b""
        or payloads["expected_post_append_smt2"] != prepared.query.journal_smt2
        or payloads["smt2"] != prepared.query.journal_smt2
    ):
        raise Profile0034PhysicalAssertionDeletionError("journal frontier drifted")
    solve_request = _strict(payloads["solve_request"], "solve request")
    request = solve_request.get("request")
    if (
        solve_request.get("request_id") != request_id
        or solve_request.get("request_sha256") != request_sha
        or type(request) is not dict
        or request.get("assumptions") != []
        or request.get("assumption_labels") != []
        or request.get("timeout_ms") != TIMEOUT_MS
        or request.get("request_id") != request_id
        or request.get("include_model") is not True
        or request.get("get_values") != list(prepared.query.get_values)
    ):
        raise Profile0034PhysicalAssertionDeletionError("solve request drifted")
    try:
        session = adapter._validate_session(
            _strict(payloads["session"], "session"),
            solver=SOLVER,
            label=label,
            expected_state="live",
        )
        adapter._validate_fresh_session(session)
        lifecycle = adapter._validate_session_lifecycle(
            _strict(payloads["session_lifecycle"], "session lifecycle")
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "live session custody failed"
        ) from exc
    if (
        lifecycle != engine["session_lifecycle"]
        or lifecycle["request_id"] != request_id
        or lifecycle["session_id"] != session["id"]
        or lifecycle["session_label"] != label
        or lifecycle["solver_profile_sha256"] != profile_sha
        or lifecycle["resume_policy"] is not None
        or lifecycle["resumed_existing_session"] is not False
        or lifecycle["resumed_from_receipt"] is not False
        or lifecycle["close_observed_state"] != "closed"
    ):
        raise Profile0034PhysicalAssertionDeletionError("session lifecycle drifted")
    solve: dict[str, Any] | None = None
    if raw is not None:
        solve_name = "reconciled_solve" if engine["response_lost"] else "solve"
        try:
            solve = adapter._validate_solve(
                _strict(payloads[solve_name], "solve"),
                timeout_ms=TIMEOUT_MS,
                assumptions=(),
                assumption_labels=(),
                named_request=True,
                replay_retry=engine["request_replayed"] is True,
            )
        except adapter.SmtSourceAdapterError as exc:
            raise Profile0034PhysicalAssertionDeletionError(
                "solve custody failed"
            ) from exc
    try:
        _, prior = adapter._validate_receipts(
            _strict(payloads["receipts_before"], "prior receipts"),
            session=session,
            query=prepared.query,
            solve=None,
            expected_count=0,
            request_id=request_id,
            request_sha256=request_sha,
            assumption_labels=(),
        )
        _, receipt = adapter._validate_receipts(
            _strict(payloads["receipts"], "receipts"),
            session=session,
            query=prepared.query,
            solve=solve,
            expected_count=0 if solve is None else 1,
            request_id=request_id,
            request_sha256=request_sha,
            assumption_labels=(),
        )
        closed = adapter._validate_session(
            _strict(payloads["closed_session"], "closed session"),
            solver=SOLVER,
            label=label,
            expected_state="closed",
        )
        adapter._validate_closed_session(
            closed, created=session, query=prepared.query, solve=solve
        )
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "receipt or close custody failed"
        ) from exc
    if prior is not None:
        raise Profile0034PhysicalAssertionDeletionError("fresh session has a receipt")
    if (
        engine["solver"] != SOLVER
        or engine["session_id"] != session["id"]
        or engine["solver_signature"] != session["solver_signature"]
        or engine["solver_sha256"] != session["solver_sha256"]
        or engine["request_id"] != request_id
        or engine["request_sha256"] != request_sha
        or engine["assumption_labels"] != []
        or engine["claims"] != adapter.FALSE_CLAIMS
        or engine["resumed_from_receipt"] is not False
    ):
        raise Profile0034PhysicalAssertionDeletionError("engine identity drifted")
    if raw is not None:
        if solve is None or receipt is None:
            raise Profile0034PhysicalAssertionDeletionError("solve receipt is absent")
        digest = adapter.piqd_result_digest(solve)
        if (
            solve["status"] != raw
            or solve["result_sha256"] != digest
            or receipt["result_sha256"] != digest
            or engine["result_sha256"] != digest
            or engine["unsat_assumptions"]
            != adapter._unsat_assumption_provenance(prepared.query, solve, ())
        ):
            raise Profile0034PhysicalAssertionDeletionError("solve digest drifted")
    elif (
        receipt is not None
        or engine["effective_status"] != "INCONCLUSIVE_TRANSPORT_LOSS"
        or engine["result_sha256"] is not None
    ):
        raise Profile0034PhysicalAssertionDeletionError("transport loss drifted")
    if raw == "SAT":
        if solve is None:
            raise Profile0034PhysicalAssertionDeletionError("SAT solve is absent")
        semantic = _strict(payloads["semantic"], "semantic replay")
        if (
            semantic != engine["semantic_replay"]
            or semantic != _expected_semantic(prepared, solve, cache)
            or engine["effective_status"]
            not in {
                "SAT_SEMANTICALLY_REPLAYED",
                "INCONCLUSIVE_SEMANTIC_REPLAY_REJECTED",
            }
        ):
            raise Profile0034PhysicalAssertionDeletionError("SAT replay drifted")
    elif engine["semantic_replay"] is not None:
        raise Profile0034PhysicalAssertionDeletionError(
            "non-SAT result has semantic replay"
        )
    try:
        adapter._validate_unsat_output_boundary(engine)
    except adapter.SmtSourceAdapterError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "UNSAT boundary failed"
        ) from exc
    provisional = {"engine": dict(engine)}
    return classify_result(provisional)


def _result_record(
    prepared: PreparedQuery,
    engine: Mapping[str, Any],
    custody: Mapping[str, Any],
) -> dict[str, Any]:
    disposition = classify_result({"engine": dict(engine)})
    result = {
        "schema": RESULT_SCHEMA,
        "key": prepared.key,
        "solver": SOLVER,
        "query_spec": query_spec_record(prepared.spec),
        "system_sha256": _sha(prepared.system_bytes),
        "journal_sha256": _sha(prepared.query.journal_smt2),
        "retained_assertion_ids": list(prepared.spec.retained_assertion_ids),
        "omitted_assertion_ids": [
            assertion_id
            for assertion_id in ASSERTION_IDS
            if assertion_id not in set(prepared.spec.retained_assertion_ids)
        ],
        "disposition": disposition,
        "engine": dict(engine),
        "custody": dict(custody),
        "claims": dict(FALSE_CLAIMS),
    }
    result["result_sha256"] = _self_hash(result, "result_sha256")
    return result


def verify_query_tree(
    prepared: PreparedQuery,
    output: Path,
    cache: SemanticVerdictCache | None = None,
) -> dict[str, Any]:
    if output.is_symlink() or not output.is_dir():
        raise Profile0034PhysicalAssertionDeletionError("query tree is unsafe")
    result = _strict(_read(output / "result.json"), "query result")
    if (
        set(result)
        != {
            "schema",
            "key",
            "solver",
            "query_spec",
            "system_sha256",
            "journal_sha256",
            "retained_assertion_ids",
            "omitted_assertion_ids",
            "disposition",
            "engine",
            "custody",
            "claims",
            "result_sha256",
        }
        or result["schema"] != RESULT_SCHEMA
        or result["key"] != prepared.key
        or result["solver"] != SOLVER
        or query_spec_from_record(result["query_spec"]) != prepared.spec
        or result["system_sha256"] != _sha(prepared.system_bytes)
        or result["journal_sha256"] != _sha(prepared.query.journal_smt2)
        or result["retained_assertion_ids"]
        != list(prepared.spec.retained_assertion_ids)
        or result["omitted_assertion_ids"]
        != [
            assertion_id
            for assertion_id in ASSERTION_IDS
            if assertion_id not in set(prepared.spec.retained_assertion_ids)
        ]
        or result["claims"] != FALSE_CLAIMS
        or result["result_sha256"] != _self_hash(result, "result_sha256")
    ):
        raise Profile0034PhysicalAssertionDeletionError("query result drifted")
    custody = result["custody"]
    if type(custody) is not dict or set(custody) != {
        "system",
        "descriptor",
        "original_smt2",
        "journal_smt2",
        "sources",
    }:
        raise Profile0034PhysicalAssertionDeletionError("query custody drifted")
    seen = {"result.json"}
    if _verify_artifact(output, custody["system"], seen) != prepared.system_bytes:
        raise Profile0034PhysicalAssertionDeletionError("system artifact drifted")
    if (
        _verify_artifact(output, custody["descriptor"], seen)
        != prepared.query.descriptor_bytes
        or _verify_artifact(output, custody["original_smt2"], seen)
        != prepared.query.original_smt2
        or _verify_artifact(output, custody["journal_smt2"], seen)
        != prepared.query.journal_smt2
    ):
        raise Profile0034PhysicalAssertionDeletionError("query bytes drifted")
    sources = custody["sources"]
    if type(sources) is not list or len(sources) != len(prepared.query.source_files):
        raise Profile0034PhysicalAssertionDeletionError("source custody drifted")
    for index, (record, snapshot) in enumerate(
        zip(sources, prepared.query.source_files, strict=True)
    ):
        if record.get("path") != f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin":
            raise Profile0034PhysicalAssertionDeletionError("source name drifted")
        if _verify_artifact(output, record, seen) != snapshot.payload:
            raise Profile0034PhysicalAssertionDeletionError("source bytes drifted")
    engine = result["engine"]
    if type(engine) is not dict or type(engine.get("artifacts")) is not dict:
        raise Profile0034PhysicalAssertionDeletionError("engine artifacts are malformed")
    payloads = {
        label: _verify_artifact(output, record, seen)
        for label, record in engine["artifacts"].items()
    }
    disposition = _validate_engine(
        prepared, engine, payloads, cache or SemanticVerdictCache()
    )
    if result["disposition"] != disposition:
        raise Profile0034PhysicalAssertionDeletionError("disposition drifted")
    entries = list(output.iterdir())
    if (
        any(entry.is_symlink() or not entry.is_file() for entry in entries)
        or {entry.name for entry in entries} != seen
    ):
        raise Profile0034PhysicalAssertionDeletionError(
            "query tree contains unexpected artifacts"
        )
    return result


def run_query(
    prepared: PreparedQuery,
    output: Path,
    transport: adapter.PiqdTransport,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    if output.exists() or output.is_symlink():
        raise Profile0034PhysicalAssertionDeletionError("query output exists")
    try:
        with adapter.SmtOutputTransaction(output) as transaction:
            custody: dict[str, Any] = {}
            for key, name, payload in (
                ("system", "system.json", prepared.system_bytes),
                ("descriptor", "descriptor.json", prepared.query.descriptor_bytes),
                ("original_smt2", "original.smt2", prepared.query.original_smt2),
                ("journal_smt2", "journal.smt2", prepared.query.journal_smt2),
            ):
                transaction.write_bytes(name, payload)
                custody[key] = _artifact_record(name, payload)
            source_records = []
            for index, snapshot in enumerate(prepared.query.source_files):
                name = f"source-{index:04d}-{_sha(snapshot.payload)[:16]}.bin"
                transaction.write_bytes(name, snapshot.payload)
                source_records.append(_artifact_record(name, snapshot.payload))
            custody["sources"] = source_records
            engine = adapter.run_authenticated_single_solver_query(
                prepared.query,
                solver=SOLVER,
                descriptor_schema=DESCRIPTOR_SCHEMA,
                solver_profile_schema=SOLVER_PROFILE_SCHEMA,
                authenticated_journal_commands=prepared.query.journal_commands,
                transport=transport,
                semantic_verifier=cache.verify,
                output_fd=transaction.file_descriptor,
                used_session_ids=set(),
                request_id=_query_request_id(prepared),
                assumption_labels=(),
            )
            payloads = {
                label: _read_fd_artifact(transaction.file_descriptor, record["path"])
                for label, record in engine["artifacts"].items()
            }
            _validate_engine(prepared, engine, payloads, cache)
            result = _result_record(prepared, engine, custody)
            transaction.write_bytes("result.json", _json(result))
            transaction.publish()
        return verify_query_tree(prepared, output, cache)
    except (adapter.SmtSourceAdapterError, OSError) as exc:
        raise Profile0034PhysicalAssertionDeletionError("query execution failed") from exc


def choose_round_winner(
    specs: Sequence[QuerySpec], results: Mapping[str, Mapping[str, Any]]
) -> QuerySpec | None:
    if set(results) != {spec.key for spec in specs}:
        raise Profile0034PhysicalAssertionDeletionError("round results are incomplete")
    current = specs[0].current_assertion_ids if specs else ()
    if any(spec.current_assertion_ids != current for spec in specs):
        raise Profile0034PhysicalAssertionDeletionError("round current changed")
    for spec in specs:
        result = results[spec.key]
        if (
            result.get("query_spec") != query_spec_record(spec)
            or result.get("retained_assertion_ids")
            != list(spec.retained_assertion_ids)
        ):
            raise Profile0034PhysicalAssertionDeletionError("stale round result")
        if classify_result(result) == "UNSAT_CUSTODY_VALID":
            return spec
    return None


def _round_record(
    *,
    round_index: int,
    phase: str,
    current: tuple[str, ...],
    specs: Sequence[QuerySpec],
    results: Mapping[str, Mapping[str, Any]],
    winner: QuerySpec | None,
    complete_batch: bool,
) -> dict[str, Any]:
    record = {
        "schema": ROUND_SCHEMA,
        "round_index": round_index,
        "phase": phase,
        "current_assertion_ids": list(current),
        "current_sha256": _ids_sha256(current),
        "complete_batch": complete_batch,
        "probes": [
            {
                "query_spec": query_spec_record(spec),
                "raw_status": results[spec.key]["engine"]["raw_status"],
                "effective_status": results[spec.key]["engine"]["effective_status"],
                "disposition": classify_result(results[spec.key]),
                "result_sha256": results[spec.key]["result_sha256"],
                "accepted": winner is not None and spec.key == winner.key,
            }
            for spec in specs
        ],
        "winner_key": None if winner is None else winner.key,
        "next_assertion_ids": list(
            current if winner is None else winner.retained_assertion_ids
        ),
        "next_sha256": _ids_sha256(
            current if winner is None else winner.retained_assertion_ids
        ),
        "claims": dict(FALSE_CLAIMS),
    }
    record["round_sha256"] = _self_hash(record, "round_sha256")
    return record


def _publish_once(path: Path, payload: bytes) -> None:
    try:
        parent._publish_once(path, payload)
    except Exception as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            f"create-once publication failed: {path}"
        ) from exc


def _write_round(root: Path, record: Mapping[str, Any]) -> dict[str, Any]:
    relative = Path("events") / "rounds" / f"round-{record['round_index']:04d}.json"
    payload = _json(record)
    _publish_once(root / relative, payload)
    return {
        "path": relative.as_posix(),
        "bytes": len(payload),
        "sha256": _sha(payload),
        "round_sha256": record["round_sha256"],
    }


def _run_prepared(
    prepared: PreparedQuery,
    root: Path,
    transport: adapter.PiqdTransport,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    return run_query(prepared, root / "artifacts" / prepared.key, transport, cache)


def run_deletion(
    *,
    parent_record: Mapping[str, Any],
    root: Path,
    transport: adapter.PiqdTransport,
    query_executor: concurrent.futures.Executor,
    cache: SemanticVerdictCache,
) -> dict[str, Any]:
    current = ASSERTION_IDS
    initial_selected = {
        "origin": "authenticated-parent",
        "key": PARENT_SELECTED_KEYS["lt"],
        "result_sha256": PARENT_SELECTED_RESULT_SHA256S["lt"],
        "retained_assertion_ids": list(ASSERTION_IDS),
        "disposition": "UNSAT_CUSTODY_VALID",
    }
    selected = dict(initial_selected)
    results: dict[str, dict[str, Any]] = {}
    specs_by_key: dict[str, dict[str, Any]] = {}
    round_files: list[dict[str, Any]] = []
    query_count = 0
    round_index = 0
    granularity = 2
    stop_reason = "SINGLETON_INCONCLUSIVE"
    singleton_tested: list[str] = []
    deletion_stable = False

    while _use_block_phase(current, granularity):
        round_index += 1
        blocks = stable_partition(current, granularity)
        remaining = QUERY_CAP - query_count
        if remaining <= 0:
            stop_reason = "QUERY_CAP"
            break
        complete_batch = len(blocks) <= remaining
        blocks = blocks[:remaining]
        specs = candidate_specs(
            current, blocks, round_index=round_index, phase="block"
        )
        prepared = [prepare_query(spec, parent_record=parent_record) for spec in specs]
        futures = {
            row.key: query_executor.submit(
                _run_prepared, row, root, transport, cache
            )
            for row in prepared
        }
        batch = {spec.key: futures[spec.key].result() for spec in specs}
        results.update(batch)
        specs_by_key.update({spec.key: query_spec_record(spec) for spec in specs})
        query_count += len(specs)
        winner = choose_round_winner(specs, batch)
        record = _round_record(
            round_index=round_index,
            phase="block",
            current=current,
            specs=specs,
            results=batch,
            winner=winner,
            complete_batch=complete_batch,
        )
        round_files.append(_write_round(root, record))
        if winner is not None:
            current = winner.retained_assertion_ids
            selected = {
                "origin": "current-run",
                "key": winner.key,
                "result_sha256": batch[winner.key]["result_sha256"],
                "retained_assertion_ids": list(current),
                "disposition": "UNSAT_CUSTODY_VALID",
            }
            granularity = 2
        elif not complete_batch:
            stop_reason = "QUERY_CAP"
            break
        else:
            granularity = min(len(current), granularity * 2)

    while stop_reason != "QUERY_CAP" and current:
        round_index += 1
        blocks = tuple((assertion_id,) for assertion_id in current)
        remaining = QUERY_CAP - query_count
        if remaining <= 0:
            stop_reason = "QUERY_CAP"
            break
        complete_batch = len(blocks) <= remaining
        blocks = blocks[:remaining]
        specs = candidate_specs(
            current, blocks, round_index=round_index, phase="singleton"
        )
        prepared = [prepare_query(spec, parent_record=parent_record) for spec in specs]
        futures = {
            row.key: query_executor.submit(
                _run_prepared, row, root, transport, cache
            )
            for row in prepared
        }
        batch = {spec.key: futures[spec.key].result() for spec in specs}
        results.update(batch)
        specs_by_key.update({spec.key: query_spec_record(spec) for spec in specs})
        query_count += len(specs)
        winner = choose_round_winner(specs, batch)
        record = _round_record(
            round_index=round_index,
            phase="singleton",
            current=current,
            specs=specs,
            results=batch,
            winner=winner,
            complete_batch=complete_batch,
        )
        round_files.append(_write_round(root, record))
        if winner is not None:
            current = winner.retained_assertion_ids
            selected = {
                "origin": "current-run",
                "key": winner.key,
                "result_sha256": batch[winner.key]["result_sha256"],
                "retained_assertion_ids": list(current),
                "disposition": "UNSAT_CUSTODY_VALID",
            }
            singleton_tested = []
            continue
        singleton_tested = [spec.deleted_block[0] for spec in specs]
        if not complete_batch:
            stop_reason = "QUERY_CAP"
        else:
            dispositions = [classify_result(batch[spec.key]) for spec in specs]
            deletion_stable = all(
                disposition == "SAT_REPLAYED" for disposition in dispositions
            )
            stop_reason = (
                "SINGLETON_CLOSED"
                if deletion_stable
                else "SINGLETON_INCONCLUSIVE"
            )
        break

    if selected["origin"] == "current-run":
        selected_result = results[selected["key"]]
        if (
            classify_result(selected_result) != "UNSAT_CUSTODY_VALID"
            or selected_result["retained_assertion_ids"] != list(current)
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "selected UNSAT result drifted"
            )
    elif current != ASSERTION_IDS:
        raise Profile0034PhysicalAssertionDeletionError(
            "parent invariant cannot support a reduced current"
        )
    return {
        "query_count": query_count,
        "query_cap": QUERY_CAP,
        "final_assertion_ids": list(current),
        "final_sha256": _ids_sha256(current),
        "removed_assertion_ids": [row for row in ASSERTION_IDS if row not in set(current)],
        "singleton_removals_tested": singleton_tested,
        "deletion_stable": deletion_stable,
        "stop_reason": stop_reason,
        "selected_result": selected,
        "results": results,
        "query_specs": specs_by_key,
        "round_files": round_files,
        "claims": dict(FALSE_CLAIMS),
    }


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict(_read(CHECKPOINT_PATH), "lane checkpoint")
    if (
        set(checkpoint)
        != {
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
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != CHECKPOINT_OWNER
        or checkpoint.get("base_head") != CHECKPOINT_BASE_HEAD
        or checkpoint.get("owned_paths") != _OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise Profile0034PhysicalAssertionDeletionError("lane checkpoint drifted")
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    authenticate_parent_run()
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": _source_map(_manifest_sources()),
        "input_digests": _source_map(_manifest_inputs()),
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _require_safe_run_ancestors() -> None:
    try:
        relative = RUN_ROOT.relative_to(REPOSITORY_ROOT)
    except ValueError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "run root escapes repository"
        ) from exc
    current = REPOSITORY_ROOT
    if current.is_symlink() or not current.is_dir():
        raise Profile0034PhysicalAssertionDeletionError("repository root is unsafe")
    for part in relative.parts[:-1]:
        current /= part
        if current.is_symlink() or (current.exists() and not current.is_dir()):
            raise Profile0034PhysicalAssertionDeletionError("run ancestor is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    _require_safe_run_ancestors()
    RUN_ROOT.parent.mkdir(parents=True, exist_ok=True)
    if RUN_ROOT.is_symlink() or (RUN_ROOT.exists() and not RUN_ROOT.is_dir()):
        raise Profile0034PhysicalAssertionDeletionError("run root is unsafe")
    RUN_ROOT.mkdir(mode=0o700, exist_ok=True)
    manifest_path = RUN_ROOT / "run_manifest.json"
    if manifest_path.exists() or manifest_path.is_symlink():
        manifest = _strict(_read(manifest_path), "run manifest")
        created = manifest.get("created_utc")
        if type(created) is not str or manifest != _expected_run_manifest(created):
            raise Profile0034PhysicalAssertionDeletionError("run manifest drifted")
    else:
        if tuple(RUN_ROOT.iterdir()):
            raise Profile0034PhysicalAssertionDeletionError(
                "unregistered run payload exists"
            )
        created = (
            dt.datetime.now(dt.UTC)
            .replace(microsecond=0)
            .isoformat()
            .replace("+00:00", "Z")
        )
        manifest = _expected_run_manifest(created)
        _publish_once(manifest_path, _json(manifest))
    return RUN_ROOT, manifest


def _authenticate_source_commit(manifest: Mapping[str, Any], commit: object) -> str:
    if type(commit) is not str or _FULL_COMMIT.fullmatch(commit) is None:
        raise Profile0034PhysicalAssertionDeletionError(
            "execution commit is malformed"
        )
    digests = manifest.get("source_digests")
    expected = sorted(_repo_path(path) for path in _manifest_sources())
    if type(digests) is not dict or sorted(digests) != expected:
        raise Profile0034PhysicalAssertionDeletionError("source inventory drifted")
    for relative in expected:
        current = _read(REPOSITORY_ROOT / relative)
        if digests.get(relative) != _sha(current):
            raise Profile0034PhysicalAssertionDeletionError("current source drifted")
        if _git_read(("show", f"{commit}:{relative}"), relative) != current:
            raise Profile0034PhysicalAssertionDeletionError(
                "recorded source commit drifted"
            )
    return commit


def authenticate_execution_commit(manifest: Mapping[str, Any]) -> str:
    raw = _git_read(("rev-parse", "--verify", "HEAD^{commit}"), "current commit")
    try:
        commit = raw.decode("ascii").strip()
    except UnicodeDecodeError as exc:
        raise Profile0034PhysicalAssertionDeletionError(
            "execution commit is malformed"
        ) from exc
    if raw != f"{commit}\n".encode("ascii"):
        raise Profile0034PhysicalAssertionDeletionError(
            "execution commit is malformed"
        )
    return _authenticate_source_commit(manifest, commit)


def authenticate_recorded_execution_commit(
    manifest: Mapping[str, Any], launch: Mapping[str, Any]
) -> str:
    return _authenticate_source_commit(manifest, launch.get("execution_commit"))


def _initialize_runtime_dirs(root: Path) -> None:
    if {entry.name for entry in root.iterdir()} != {"run_manifest.json"}:
        raise Profile0034PhysicalAssertionDeletionError("runtime root is not pristine")
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(mode=0o700)
    (root / "events" / "rounds").mkdir(mode=0o700)


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
        raise Profile0034PhysicalAssertionDeletionError("PIQD server URL is invalid")
    return server.rstrip("/")


def _launch_record(
    manifest: Mapping[str, Any],
    execution_commit: str,
    server: str,
    workers: int,
    parent_record: Mapping[str, Any],
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "execution_commit": execution_commit,
        "parent_custody_sha256": parent_record["parent_custody_sha256"],
        "controls": list(CONTROL_KEYS),
        "strategy": "physical-assertion-stable-partition-ddmin",
        "initial_assertion_count": ASSERTION_COUNT,
        "initial_granularity": 2,
        "query_cap": QUERY_CAP,
        "server": server,
        "solver": SOLVER,
        "timeout_ms": TIMEOUT_MS,
        "workers": workers,
        "max_workers": MAX_WORKERS,
        "solves_per_session": 1,
        "resume": False,
        "claims": dict(FALSE_CLAIMS),
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _read_launch(path: Path) -> dict[str, Any]:
    launch = _strict(_read(path), "launch")
    if (
        launch.get("schema") != LAUNCH_SCHEMA
        or launch.get("lane_id") != LANE_ID
        or launch.get("run_id") != RUN_ID
        or launch.get("resume") is not False
        or launch.get("claims") != FALSE_CLAIMS
        or launch.get("launch_sha256") != _self_hash(launch, "launch_sha256")
    ):
        raise Profile0034PhysicalAssertionDeletionError("launch record drifted")
    return launch


def _inventory(root: Path) -> str:
    if root.is_symlink() or not root.is_dir():
        raise Profile0034PhysicalAssertionDeletionError("run root is unsafe")
    names = {entry.name for entry in root.iterdir()}
    if names == {"run_manifest.json"}:
        return "INITIALIZED"
    if names != {"run_manifest.json", "artifacts", "events", "tmp"}:
        raise Profile0034PhysicalAssertionDeletionError("run inventory drifted")
    for name in ("artifacts", "events", "tmp"):
        path = root / name
        if path.is_symlink() or not path.is_dir():
            raise Profile0034PhysicalAssertionDeletionError(
                "runtime directory is unsafe"
            )
    if tuple((root / "tmp").iterdir()):
        raise Profile0034PhysicalAssertionDeletionError("runtime tmp is not empty")
    event_names = {entry.name for entry in (root / "events").iterdir()}
    if event_names != {"launch.json", "rounds"} and event_names != {
        "launch.json",
        "rounds",
        "terminal.json",
    }:
        raise Profile0034PhysicalAssertionDeletionError("event inventory drifted")
    rounds = root / "events" / "rounds"
    if rounds.is_symlink() or not rounds.is_dir():
        raise Profile0034PhysicalAssertionDeletionError("round directory is unsafe")
    for entry in (root / "artifacts").iterdir():
        if (
            entry.is_symlink()
            or not entry.is_dir()
            or not (
                entry.name in CONTROL_KEYS
                or re.fullmatch(
                    r"z3-r[0-9]{3}-[0-9a-f]{16}-drop-[0-9a-f]{16}",
                    entry.name,
                )
            )
            or "result.json" not in {child.name for child in entry.iterdir()}
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "runtime artifact entry is invalid"
            )
    return "TERMINAL" if "terminal.json" in event_names else "LAUNCHED"


def _terminal_record(
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    controls: Mapping[str, Mapping[str, Any]],
    report: Mapping[str, Any],
) -> dict[str, Any]:
    if (
        set(controls) != set(CONTROL_KEYS)
        or classify_result(controls[CONTROL_KEYS[0]]) != "SAT_REPLAYED"
        or classify_result(controls[CONTROL_KEYS[1]]) != "UNSAT_CUSTODY_VALID"
    ):
        raise Profile0034PhysicalAssertionDeletionError("control results drifted")
    if set(controls) & set(report["results"]):
        raise Profile0034PhysicalAssertionDeletionError("query keys collided")
    results = {**controls, **report["results"]}
    specs = {
        **{key: query_spec_record(control_spec(key)) for key in CONTROL_KEYS},
        **report["query_specs"],
    }
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "status": "PHYSICAL_ASSERTION_DELETION_COMPLETE",
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "parent_custody_sha256": launch["parent_custody_sha256"],
        "query_count": len(results),
        "target_query_count": report["query_count"],
        "queries": {
            key: {
                "query_spec": specs[key],
                "raw_status": result["engine"]["raw_status"],
                "effective_status": result["engine"]["effective_status"],
                "disposition": classify_result(result),
                "result_sha256": result["result_sha256"],
            }
            for key, result in sorted(results.items())
        },
        "final_assertion_ids": report["final_assertion_ids"],
        "final_sha256": report["final_sha256"],
        "removed_assertion_ids": report["removed_assertion_ids"],
        "singleton_removals_tested": report["singleton_removals_tested"],
        "deletion_stable": report["deletion_stable"],
        "stop_reason": report["stop_reason"],
        "selected_result": report["selected_result"],
        "round_files": report["round_files"],
        "claims": dict(FALSE_CLAIMS),
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _read_terminal(path: Path) -> dict[str, Any]:
    terminal = _strict(_read(path), "terminal")
    if (
        terminal.get("schema") != TERMINAL_SCHEMA
        or terminal.get("status") != "PHYSICAL_ASSERTION_DELETION_COMPLETE"
        or terminal.get("lane_id") != LANE_ID
        or terminal.get("run_id") != RUN_ID
        or terminal.get("claims") != FALSE_CLAIMS
        or terminal.get("terminal_sha256")
        != _self_hash(terminal, "terminal_sha256")
    ):
        raise Profile0034PhysicalAssertionDeletionError("terminal record drifted")
    return terminal


def _verify_rounds(
    root: Path,
    terminal: Mapping[str, Any],
    results: Mapping[str, Mapping[str, Any]],
) -> tuple[str, ...]:
    records = terminal.get("round_files")
    if type(records) is not list:
        raise Profile0034PhysicalAssertionDeletionError("round inventory is malformed")
    current = ASSERTION_IDS
    target_keys: set[str] = set()
    expected_names: set[str] = set()
    query_count = 0
    granularity = 2
    search_phase = "block"
    finished = False
    for expected_index, file_record in enumerate(records, start=1):
        if finished:
            raise Profile0034PhysicalAssertionDeletionError(
                "round exists after a terminal batch"
            )
        if type(file_record) is not dict or set(file_record) != {
            "path",
            "bytes",
            "sha256",
            "round_sha256",
        }:
            raise Profile0034PhysicalAssertionDeletionError("round file row drifted")
        relative = Path(file_record["path"])
        expected = Path("events") / "rounds" / f"round-{expected_index:04d}.json"
        if relative != expected:
            raise Profile0034PhysicalAssertionDeletionError("round path drifted")
        payload = _read(root / relative)
        record = _strict(payload, "round record")
        if (
            len(payload) != file_record["bytes"]
            or _sha(payload) != file_record["sha256"]
            or record.get("round_sha256") != file_record["round_sha256"]
            or record.get("round_sha256") != _self_hash(record, "round_sha256")
            or record.get("round_index") != expected_index
            or tuple(record.get("current_assertion_ids", ())) != current
            or record.get("current_sha256") != _ids_sha256(current)
            or record.get("claims") != FALSE_CLAIMS
        ):
            raise Profile0034PhysicalAssertionDeletionError("round custody drifted")
        probes = record.get("probes")
        if type(probes) is not list or not probes:
            raise Profile0034PhysicalAssertionDeletionError("round probes are absent")
        specs = [query_spec_from_record(row.get("query_spec")) for row in probes]
        if search_phase == "block" and not _use_block_phase(current, granularity):
            search_phase = "singleton"
        remaining = QUERY_CAP - query_count
        if remaining <= 0:
            raise Profile0034PhysicalAssertionDeletionError(
                "round exceeds the query cap"
            )
        if search_phase == "block":
            expected_blocks = stable_partition(current, granularity)
        else:
            expected_blocks = tuple((assertion_id,) for assertion_id in current)
        complete_batch = len(expected_blocks) <= remaining
        expected_blocks = expected_blocks[:remaining]
        expected_specs = candidate_specs(
            current,
            expected_blocks,
            round_index=expected_index,
            phase=search_phase,
        )
        if (
            specs != list(expected_specs)
            or record.get("phase") != search_phase
            or record.get("complete_batch") is not complete_batch
        ):
            raise Profile0034PhysicalAssertionDeletionError("round spec order drifted")
        batch: dict[str, Mapping[str, Any]] = {}
        for probe, spec in zip(probes, specs, strict=True):
            result = results.get(spec.key)
            if type(result) is not dict or spec.key in target_keys:
                raise Profile0034PhysicalAssertionDeletionError(
                    "round result link drifted"
                )
            target_keys.add(spec.key)
            batch[spec.key] = result
            if probe != {
                "query_spec": query_spec_record(spec),
                "raw_status": result["engine"]["raw_status"],
                "effective_status": result["engine"]["effective_status"],
                "disposition": classify_result(result),
                "result_sha256": result["result_sha256"],
                "accepted": probe.get("accepted"),
            }:
                raise Profile0034PhysicalAssertionDeletionError(
                    "round result summary drifted"
                )
        winner = choose_round_winner(specs, batch)
        recomputed = _round_record(
            round_index=expected_index,
            phase=record["phase"],
            current=current,
            specs=specs,
            results=batch,
            winner=winner,
            complete_batch=record["complete_batch"],
        )
        if record != recomputed:
            raise Profile0034PhysicalAssertionDeletionError(
                "round decision reconstruction failed"
            )
        current = tuple(record["next_assertion_ids"])
        query_count += len(specs)
        if winner is not None:
            if search_phase == "block":
                granularity = 2
        elif not complete_batch:
            finished = True
        elif search_phase == "block":
            granularity = min(len(current), granularity * 2)
        else:
            finished = True
        expected_names.add(relative.name)
    rounds_root = root / "events" / "rounds"
    if {entry.name for entry in rounds_root.iterdir()} != expected_names:
        raise Profile0034PhysicalAssertionDeletionError(
            "round directory inventory drifted"
        )
    expected_target_keys = set(terminal["queries"]) - set(CONTROL_KEYS)
    if target_keys != expected_target_keys:
        raise Profile0034PhysicalAssertionDeletionError(
            "target query inventory drifted"
        )
    if query_count != terminal["target_query_count"]:
        raise Profile0034PhysicalAssertionDeletionError("round query count drifted")
    return current


def verify_terminal_run(
    root: Path,
    manifest: Mapping[str, Any],
    launch: Mapping[str, Any],
    parent_record: Mapping[str, Any],
    cache: SemanticVerdictCache | None = None,
) -> dict[str, Any]:
    terminal = _read_terminal(root / "events" / "terminal.json")
    if (
        terminal["run_manifest_sha256"] != manifest["manifest_sha256"]
        or terminal["launch_sha256"] != launch["launch_sha256"]
        or terminal["parent_custody_sha256"]
        != parent_record["parent_custody_sha256"]
        or terminal["query_count"] != len(terminal["queries"])
        or terminal["target_query_count"] != terminal["query_count"] - 2
        or not 0 <= terminal["target_query_count"] <= QUERY_CAP
    ):
        raise Profile0034PhysicalAssertionDeletionError("terminal links drifted")
    verdict_cache = cache or SemanticVerdictCache()
    artifact_entries = {entry.name for entry in (root / "artifacts").iterdir()}
    if artifact_entries != set(terminal["queries"]):
        raise Profile0034PhysicalAssertionDeletionError(
            "terminal artifact inventory drifted"
        )
    results: dict[str, dict[str, Any]] = {}
    session_ids: set[str] = set()
    for key, row in terminal["queries"].items():
        if type(row) is not dict or set(row) != {
            "query_spec",
            "raw_status",
            "effective_status",
            "disposition",
            "result_sha256",
        }:
            raise Profile0034PhysicalAssertionDeletionError(
                "terminal query row drifted"
            )
        spec = query_spec_from_record(row["query_spec"])
        if spec.key != key:
            raise Profile0034PhysicalAssertionDeletionError("terminal key drifted")
        prepared = prepare_query(
            spec, parent_record=None if spec.phase == "control" else parent_record
        )
        result = verify_query_tree(
            prepared, root / "artifacts" / key, verdict_cache
        )
        session_id = result["engine"].get("session_id")
        if type(session_id) is not str or session_id in session_ids:
            raise Profile0034PhysicalAssertionDeletionError(
                "query sessions are not globally unique"
            )
        session_ids.add(session_id)
        if row != {
            "query_spec": query_spec_record(spec),
            "raw_status": result["engine"]["raw_status"],
            "effective_status": result["engine"]["effective_status"],
            "disposition": classify_result(result),
            "result_sha256": result["result_sha256"],
        }:
            raise Profile0034PhysicalAssertionDeletionError(
                "terminal query summary drifted"
            )
        results[key] = result
    if (
        classify_result(results.get(CONTROL_KEYS[0])) != "SAT_REPLAYED"
        or classify_result(results.get(CONTROL_KEYS[1])) != "UNSAT_CUSTODY_VALID"
    ):
        raise Profile0034PhysicalAssertionDeletionError("terminal controls drifted")
    final = _verify_rounds(root, terminal, results)
    if (
        list(final) != terminal["final_assertion_ids"]
        or terminal["final_sha256"] != _ids_sha256(final)
        or terminal["removed_assertion_ids"]
        != [row for row in ASSERTION_IDS if row not in set(final)]
        or type(terminal["deletion_stable"]) is not bool
        or not set(terminal["singleton_removals_tested"]) <= set(final)
    ):
        raise Profile0034PhysicalAssertionDeletionError("final state drifted")
    if terminal["stop_reason"] == "QUERY_CAP":
        if terminal["target_query_count"] != QUERY_CAP or terminal["deletion_stable"]:
            raise Profile0034PhysicalAssertionDeletionError("query-cap status drifted")
    elif terminal["stop_reason"] == "SINGLETON_CLOSED":
        if not terminal["deletion_stable"]:
            raise Profile0034PhysicalAssertionDeletionError(
                "singleton closure status drifted"
            )
    elif terminal["stop_reason"] == "SINGLETON_INCONCLUSIVE":
        if terminal["deletion_stable"]:
            raise Profile0034PhysicalAssertionDeletionError(
                "singleton unresolved status drifted"
            )
    else:
        raise Profile0034PhysicalAssertionDeletionError("stop reason drifted")
    selected = terminal["selected_result"]
    if type(selected) is not dict or selected.get("disposition") != "UNSAT_CUSTODY_VALID":
        raise Profile0034PhysicalAssertionDeletionError("selected result is malformed")
    if selected.get("origin") == "authenticated-parent":
        if (
            final != ASSERTION_IDS
            or selected.get("key") != PARENT_SELECTED_KEYS["lt"]
            or selected.get("result_sha256")
            != PARENT_SELECTED_RESULT_SHA256S["lt"]
            or selected.get("retained_assertion_ids") != list(ASSERTION_IDS)
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "parent UNSAT invariant drifted"
            )
    elif selected.get("origin") == "current-run":
        result = results.get(selected.get("key"))
        if (
            type(result) is not dict
            or classify_result(result) != "UNSAT_CUSTODY_VALID"
            or result["result_sha256"] != selected.get("result_sha256")
            or result["retained_assertion_ids"] != list(final)
            or selected.get("retained_assertion_ids") != list(final)
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "current UNSAT invariant drifted"
            )
    else:
        raise Profile0034PhysicalAssertionDeletionError(
            "selected result origin drifted"
        )
    return terminal


def run_campaign(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: float = DEFAULT_TIMEOUT_S,
    workers: int = DEFAULT_WORKERS,
    init_only: bool = False,
    transport: adapter.PiqdTransport | None = None,
) -> dict[str, Any]:
    if (
        type(timeout_s) not in {int, float}
        or type(timeout_s) is bool
        or not math.isfinite(timeout_s)
        or timeout_s != DEFAULT_TIMEOUT_S
    ):
        raise Profile0034PhysicalAssertionDeletionError(
            "timeout is fixed at 60 seconds"
        )
    if (
        type(workers) is not int
        or type(workers) is bool
        or not 1 <= workers <= MAX_WORKERS
    ):
        raise Profile0034PhysicalAssertionDeletionError("workers must lie in 1..20")
    root, manifest = ensure_run_root()
    parent_record = authenticate_parent_run()
    phase = _inventory(root)
    if init_only:
        if phase != "INITIALIZED":
            raise Profile0034PhysicalAssertionDeletionError(
                "init-only requires a manifest-only root"
            )
        return {
            "status": "INITIALIZED",
            "lane_id": LANE_ID,
            "run_id": RUN_ID,
            "run_manifest_sha256": manifest["manifest_sha256"],
        }
    server = _validate_server(server)
    launch_path = root / "events" / "launch.json"
    if phase == "TERMINAL":
        launch = _read_launch(launch_path)
        commit = authenticate_recorded_execution_commit(manifest, launch)
        if launch != _launch_record(manifest, commit, server, workers, parent_record):
            raise Profile0034PhysicalAssertionDeletionError(
                "terminal launch replay drifted"
            )
        return verify_terminal_run(root, manifest, launch, parent_record)
    if phase != "INITIALIZED":
        raise Profile0034PhysicalAssertionDeletionError(
            "incomplete launch cannot resume; use a fresh run id"
        )
    execution_commit = authenticate_execution_commit(manifest)
    launch = _launch_record(
        manifest, execution_commit, server, workers, parent_record
    )
    _initialize_runtime_dirs(root)
    _publish_once(launch_path, _json(launch))
    if _inventory(root) != "LAUNCHED":
        raise Profile0034PhysicalAssertionDeletionError("launch inventory drifted")
    active_transport = transport or adapter.UrllibPiqdTransport(
        server, http_timeout_s=DEFAULT_TIMEOUT_S + 40
    )
    cache = SemanticVerdictCache()
    controls: dict[str, dict[str, Any]] = {}
    for key in CONTROL_KEYS:
        prepared = prepare_query(control_spec(key))
        controls[key] = _run_prepared(
            prepared, root, active_transport, cache
        )
    if (
        classify_result(controls[CONTROL_KEYS[0]]) != "SAT_REPLAYED"
        or classify_result(controls[CONTROL_KEYS[1]]) != "UNSAT_CUSTODY_VALID"
    ):
        raise Profile0034PhysicalAssertionDeletionError("transport controls failed")
    with concurrent.futures.ThreadPoolExecutor(max_workers=workers) as query_pool:
        report = run_deletion(
            parent_record=parent_record,
            root=root,
            transport=active_transport,
            query_executor=query_pool,
            cache=cache,
        )
    selected = report["selected_result"]
    if selected["origin"] == "current-run":
        spec = query_spec_from_record(report["query_specs"][selected["key"]])
        result = verify_query_tree(
            prepare_query(spec, parent_record=parent_record),
            root / "artifacts" / selected["key"],
            cache,
        )
        if (
            classify_result(result) != "UNSAT_CUSTODY_VALID"
            or result["retained_assertion_ids"] != report["final_assertion_ids"]
        ):
            raise Profile0034PhysicalAssertionDeletionError(
                "final UNSAT recheck failed"
            )
    terminal = _terminal_record(manifest, launch, controls, report)
    _publish_once(root / "events" / "terminal.json", _json(terminal))
    if _inventory(root) != "TERMINAL":
        raise Profile0034PhysicalAssertionDeletionError("terminal inventory drifted")
    return verify_terminal_run(root, manifest, launch, parent_record, cache)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=float, default=DEFAULT_TIMEOUT_S)
    parser.add_argument("--workers", type=int, default=DEFAULT_WORKERS)
    parser.add_argument("--init-only", action="store_true")
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_campaign(
            server=args.server,
            timeout_s=args.timeout,
            workers=args.workers,
            init_only=args.init_only,
        )
    except (
        Profile0034PhysicalAssertionDeletionError,
        OSError,
        ValueError,
    ) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 2
    if args.verbose:
        print(json.dumps(result, sort_keys=True, indent=2))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
