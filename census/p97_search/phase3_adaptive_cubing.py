"""Authenticated adaptive cube plans for the projected-static Phase-3 lane.

This module defines the P6b scheduling contract without changing the frozen
fixed-partition cube-batch path.  A plan is a deterministic binary decision
tree over a stable prefix of semantic Boolean variables.  Pilot outcomes are
discovery evidence only: SAT and UNSAT retain a leaf for the next wave, while
UNKNOWN, interruption, exception, and budget exhaustion either split the leaf
or become an explicit unresolved leaf at the configured maximum depth.

The plan is bound to one immutable bank epoch.  The source journal and the
first-principles terminal proof path remain the authorities; this module does
not promote a pilot UNSAT result or an adaptive leaf to a theorem claim.
"""

from __future__ import annotations

import contextlib
import hashlib
import itertools
import json
import os
import tempfile
from collections import deque
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCHEMA = "p97-phase3-adaptive-cube-plan-v1"
BANK_EPOCH_SCHEMA = "p97-phase3-adaptive-cube-bank-epoch-v1"
MAX_DEPTH = 12
MAX_PILOTS = 4096
VERDICTS = ("SAT", "UNSAT", "UNKNOWN", "INTERRUPTED", "EXCEPTION")
EASY_VERDICTS = frozenset(("SAT", "UNSAT"))
UNRESOLVED_VERDICTS = frozenset(("UNKNOWN", "INTERRUPTED", "EXCEPTION"))
WAVE_SCHEMA = "p97-phase3-adaptive-cube-wave-v1"
WAVE_STATUSES = ("RUNNING", "BUDGET", "COMPLETE", "UNKNOWN")


class AdaptiveCubingError(ValueError):
    """Raised when an adaptive cube artifact is malformed or not replayable."""


def _canonical_bytes(value: object) -> bytes:
    return json.dumps(
        value,
        ensure_ascii=True,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("ascii")


def _sha256_value(value: object) -> str:
    return hashlib.sha256(_canonical_bytes(value)).hexdigest()


def _require_sha256(value: object, *, where: str, allow_none: bool = False) -> None:
    if allow_none and value is None:
        return
    if (
        not isinstance(value, str)
        or len(value) != 64
        or any(character not in "0123456789abcdef" for character in value)
    ):
        raise AdaptiveCubingError(f"{where}: expected lowercase SHA-256")


@dataclass(frozen=True)
class PilotBudget:
    """Fixed per-pilot limits and the global cap for one plan publication."""

    wall_timeout_ms: int | None = None
    conflict_limit: int | None = None
    max_pilots: int = 256

    def __post_init__(self) -> None:
        if self.wall_timeout_ms is None and self.conflict_limit is None:
            raise AdaptiveCubingError(
                "pilot budget needs a wall or conflict limit"
            )
        if self.wall_timeout_ms is not None and (
            type(self.wall_timeout_ms) is not int or self.wall_timeout_ms <= 0
        ):
            raise AdaptiveCubingError("wall_timeout_ms must be a positive int")
        if self.conflict_limit is not None and (
            type(self.conflict_limit) is not int or self.conflict_limit <= 0
        ):
            raise AdaptiveCubingError("conflict_limit must be a positive int")
        if (
            type(self.max_pilots) is not int
            or not 1 <= self.max_pilots <= MAX_PILOTS
        ):
            raise AdaptiveCubingError(
                f"max_pilots must be in 1..{MAX_PILOTS}"
            )

    def as_dict(self) -> dict[str, int | None]:
        return {
            "wall_timeout_ms": self.wall_timeout_ms,
            "conflict_limit": self.conflict_limit,
            "max_pilots": self.max_pilots,
        }

    @classmethod
    def from_mapping(cls, value: Mapping[str, Any]) -> PilotBudget:
        if not isinstance(value, Mapping):
            raise AdaptiveCubingError("pilot budget is not an object")
        return cls(
            wall_timeout_ms=value.get("wall_timeout_ms"),
            conflict_limit=value.get("conflict_limit"),
            max_pilots=value.get("max_pilots", 256),
        )


@dataclass(frozen=True)
class PilotOutcome:
    """Untrusted pilot output recorded before scheduling the next wave."""

    verdict: str
    elapsed_ms: int = 0
    conflicts: int = 0
    reason: str | None = None
    returncode: int | None = None

    def __post_init__(self) -> None:
        if self.verdict not in VERDICTS:
            raise AdaptiveCubingError(
                f"pilot verdict must be one of {', '.join(VERDICTS)}"
            )
        if type(self.elapsed_ms) is not int or self.elapsed_ms < 0:
            raise AdaptiveCubingError("pilot elapsed_ms must be a nonnegative int")
        if type(self.conflicts) is not int or self.conflicts < 0:
            raise AdaptiveCubingError("pilot conflicts must be a nonnegative int")
        if self.reason is not None and not isinstance(self.reason, str):
            raise AdaptiveCubingError("pilot reason must be a string or null")
        if self.returncode is not None and type(self.returncode) is not int:
            raise AdaptiveCubingError("pilot returncode must be an int or null")

    def as_dict(self) -> dict[str, Any]:
        return {
            "verdict": self.verdict,
            "elapsed_ms": self.elapsed_ms,
            "conflicts": self.conflicts,
            "reason": self.reason,
            "returncode": self.returncode,
        }

    @classmethod
    def from_value(cls, value: PilotOutcome | Mapping[str, Any]) -> PilotOutcome:
        if isinstance(value, cls):
            return value
        if not isinstance(value, Mapping):
            raise AdaptiveCubingError("pilot runner returned a non-object")
        return cls(
            verdict=value.get("verdict"),
            elapsed_ms=value.get("elapsed_ms", 0),
            conflicts=value.get("conflicts", 0),
            reason=value.get("reason"),
            returncode=value.get("returncode"),
        )


@dataclass(frozen=True)
class CubeSpec:
    """A canonical prefix cube passed to a pilot runner."""

    path: tuple[int, ...]
    literals: tuple[int, ...]

    @property
    def node_id(self) -> str:
        return _node_id(self.path)


PilotRunner = Callable[[CubeSpec, PilotBudget], PilotOutcome | Mapping[str, Any]]
WaveRunner = Callable[[CubeSpec], Mapping[str, Any] | PilotOutcome]


def _normalize_semantic_variables(
    semantic_variables: Sequence[Mapping[str, Any]],
    *,
    required_depth: int,
) -> tuple[dict[str, Any], ...]:
    if not isinstance(semantic_variables, Sequence):
        raise AdaptiveCubingError("semantic variables must be a sequence")
    if required_depth < 1 or required_depth > MAX_DEPTH:
        raise AdaptiveCubingError(f"depth must be in 1..{MAX_DEPTH}")
    if len(semantic_variables) < required_depth:
        raise AdaptiveCubingError("semantic variable sequence is too short")
    result: list[dict[str, Any]] = []
    names: set[str] = set()
    variables: set[int] = set()
    for position, raw in enumerate(semantic_variables):
        if not isinstance(raw, Mapping):
            raise AdaptiveCubingError(
                f"semantic variable {position} is not an object"
            )
        name = raw.get("name")
        variable = raw.get("variable")
        key = raw.get("key", [])
        if not isinstance(name, str) or not name:
            raise AdaptiveCubingError(
                f"semantic variable {position} has no name"
            )
        if type(variable) is not int or variable <= 0:
            raise AdaptiveCubingError(
                f"semantic variable {position} has an invalid variable"
            )
        if name in names or variable in variables:
            raise AdaptiveCubingError("semantic variable names/ids are not unique")
        if not isinstance(key, Sequence) or isinstance(key, (str, bytes)):
            raise AdaptiveCubingError(
                f"semantic variable {position} key is not a sequence"
            )
        names.add(name)
        variables.add(variable)
        result.append(
            {
                "position": position,
                "name": name,
                "variable": variable,
                "key": list(key),
            }
        )
    return tuple(result)


def _node_id(path: Sequence[int]) -> str:
    return "p" + ("".join(str(bit) for bit in path) or "root")


def _cube_literals(
    semantic_variables: Sequence[Mapping[str, Any]], path: Sequence[int]
) -> tuple[int, ...]:
    if any(bit not in (0, 1) for bit in path):
        raise AdaptiveCubingError("cube paths contain a non-Boolean bit")
    if len(path) > len(semantic_variables):
        raise AdaptiveCubingError("cube path exceeds semantic variable sequence")
    return tuple(
        int(variable["variable"]) if bit else -int(variable["variable"])
        for variable, bit in zip(semantic_variables, path)
    )


def _path_sort_key(path: Sequence[int]) -> tuple[int, ...]:
    return tuple(int(bit) for bit in path)


def _bounded_pilot(
    outcome: PilotOutcome,
    budget: PilotBudget,
) -> tuple[str, bool]:
    exhausted = (
        budget.wall_timeout_ms is not None
        and outcome.elapsed_ms > budget.wall_timeout_ms
    ) or (
        budget.conflict_limit is not None
        and outcome.conflicts > budget.conflict_limit
    )
    if exhausted:
        return "INTERRUPTED", True
    return outcome.verdict, False


def make_bank_epoch(
    *,
    epoch: int,
    source_sha256: str,
    learned_head_sha256: str | None,
    clause_count: int,
    parent: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Create one immutable bank epoch, optionally extending its parent."""

    if type(epoch) is not int or epoch < 0:
        raise AdaptiveCubingError("bank epoch must be a nonnegative int")
    _require_sha256(source_sha256, where="bank source hash")
    _require_sha256(
        learned_head_sha256,
        where="bank learned-head hash",
        allow_none=True,
    )
    if type(clause_count) is not int or clause_count < 0:
        raise AdaptiveCubingError("bank clause count must be nonnegative")
    parent_hash: str | None = None
    if parent is not None:
        _validate_bank_epoch(parent)
        if epoch != int(parent["epoch"]) + 1:
            raise AdaptiveCubingError("bank epoch is not the next parent epoch")
        parent_hash = _sha256_value(parent)
    elif epoch != 0:
        raise AdaptiveCubingError("nonzero bank epoch needs a parent")
    unsigned = {
        "schema": BANK_EPOCH_SCHEMA,
        "epoch": epoch,
        "parent_epoch_sha256": parent_hash,
        "source_sha256": source_sha256,
        "learned_head_sha256": learned_head_sha256,
        "clause_count": clause_count,
    }
    return {**unsigned, "bank_epoch_sha256": _sha256_value(unsigned)}


def _validate_bank_epoch(epoch: Mapping[str, Any]) -> None:
    if not isinstance(epoch, Mapping) or epoch.get("schema") != BANK_EPOCH_SCHEMA:
        raise AdaptiveCubingError("invalid bank epoch schema")
    unsigned = dict(epoch)
    claimed = unsigned.pop("bank_epoch_sha256", None)
    if not isinstance(claimed, str) or claimed != _sha256_value(unsigned):
        raise AdaptiveCubingError("invalid bank epoch hash")
    if type(epoch.get("epoch")) is not int or int(epoch["epoch"]) < 0:
        raise AdaptiveCubingError("invalid bank epoch number")
    _require_sha256(epoch.get("source_sha256"), where="bank source hash")
    _require_sha256(
        epoch.get("learned_head_sha256"),
        where="bank learned-head hash",
        allow_none=True,
    )
    if type(epoch.get("clause_count")) is not int or epoch["clause_count"] < 0:
        raise AdaptiveCubingError("invalid bank clause count")
    parent_hash = epoch.get("parent_epoch_sha256")
    _require_sha256(parent_hash, where="bank parent hash", allow_none=True)
    if epoch["epoch"] == 0 and parent_hash is not None:
        raise AdaptiveCubingError("epoch zero cannot have a parent")
    if epoch["epoch"] > 0 and parent_hash is None:
        raise AdaptiveCubingError("nonzero epoch must name a parent")


def validate_bank_epoch_transition(
    previous: Mapping[str, Any], current: Mapping[str, Any]
) -> None:
    """Check the authenticated parent edge used between adaptive waves."""

    _validate_bank_epoch(previous)
    _validate_bank_epoch(current)
    if int(current["epoch"]) != int(previous["epoch"]) + 1:
        raise AdaptiveCubingError("bank epochs are not consecutive")
    if current.get("parent_epoch_sha256") != _sha256_value(previous):
        raise AdaptiveCubingError("bank epoch parent hash mismatch")


def build_plan(
    semantic_variables: Sequence[Mapping[str, Any]],
    *,
    initial_depth: int,
    max_depth: int,
    budget: PilotBudget,
    bank_epoch: Mapping[str, Any],
    pilot_runner: PilotRunner,
) -> dict[str, Any]:
    """Run a bounded deterministic pilot wave and return its signed plan.

    Initial prefixes are queued in false-before-true order.  A bounded pilot
    returning SAT or UNSAT retains that prefix.  Any unresolved outcome is
    split in canonical child order until ``max_depth``; if the global pilot
    cap is reached, the node is retained as an explicit UNKNOWN leaf and no
    unrecorded child is inferred.
    """

    if type(initial_depth) is not int or not 1 <= initial_depth <= MAX_DEPTH:
        raise AdaptiveCubingError(
            f"initial_depth must be in 1..{MAX_DEPTH}"
        )
    if type(max_depth) is not int or not initial_depth <= max_depth <= MAX_DEPTH:
        raise AdaptiveCubingError(
            f"max_depth must be in initial_depth..{MAX_DEPTH}"
        )
    normalized_variables = _normalize_semantic_variables(
        semantic_variables,
        required_depth=max_depth,
    )
    _validate_bank_epoch(bank_epoch)
    if not callable(pilot_runner):
        raise AdaptiveCubingError("pilot_runner must be callable")

    queue: deque[tuple[int, ...]] = deque(
        itertools.product((0, 1), repeat=initial_depth)
    )
    nodes: list[dict[str, Any]] = []
    pilot_count = 0
    while queue:
        path = tuple(queue.popleft())
        spec = CubeSpec(path, _cube_literals(normalized_variables, path))
        cap_reached = pilot_count >= budget.max_pilots
        if cap_reached:
            cap_elapsed_ms = (
                budget.wall_timeout_ms + 1
                if budget.wall_timeout_ms is not None
                else 0
            )
            cap_conflicts = (
                budget.conflict_limit + 1
                if budget.wall_timeout_ms is None
                and budget.conflict_limit is not None
                else 0
            )
            outcome = PilotOutcome(
                "INTERRUPTED",
                elapsed_ms=cap_elapsed_ms,
                conflicts=cap_conflicts,
                reason="pilot-cap-reached",
            )
            effective_verdict = "INTERRUPTED"
            exhausted = True
            pilot_index: int | None = None
        else:
            pilot_index = pilot_count
            pilot_count += 1
            try:
                outcome = PilotOutcome.from_value(pilot_runner(spec, budget))
            except Exception as exc:  # noqa: BLE001
                outcome = PilotOutcome(
                    "EXCEPTION",
                    reason=f"{type(exc).__name__}: {exc}",
                )
            effective_verdict, exhausted = _bounded_pilot(outcome, budget)

        unresolved = effective_verdict not in EASY_VERDICTS
        can_split = unresolved and len(path) < max_depth and not cap_reached
        action = "split" if can_split else ("unknown" if unresolved else "retain")
        children: list[str] = []
        if can_split:
            for bit in (0, 1):
                child_path = path + (bit,)
                children.append(_node_id(child_path))
                queue.append(child_path)
        nodes.append(
            {
                "node_id": spec.node_id,
                "path": list(path),
                "depth": len(path),
                "literals": list(spec.literals),
                "pilot": {
                    **outcome.as_dict(),
                    "effective_verdict": effective_verdict,
                    "budget_exhausted": exhausted,
                    "pilot_index": pilot_index,
                },
                "action": action,
                "children": children,
            }
        )

    leaves = [node["node_id"] for node in nodes if not node["children"]]
    unsigned = {
        "schema": SCHEMA,
        "semantic_variables": list(normalized_variables),
        "initial_depth": initial_depth,
        "max_depth": max_depth,
        "pilot_budget": budget.as_dict(),
        "bank_epoch": dict(bank_epoch),
        "nodes": nodes,
        "leaves": leaves,
        "pilot_count": pilot_count,
        "leaf_count": len(leaves),
        "claim_scope": (
            "authenticated discovery scheduling artifact only; pilot SAT and "
            "UNSAT are not proofs; UNKNOWN, interruption, and exception leaves "
            "remain unresolved; terminal claims require fresh exact-CNF replay"
        ),
    }
    unsigned["exact_cover_sha256"] = _cover_hash(
        tuple(tuple(node["path"]) for node in nodes if not node["children"]),
        max_depth,
    )
    plan = {**unsigned, "plan_sha256": _sha256_value(unsigned)}
    verify_plan(plan)
    return plan


def _cover_assignments(
    leaves: Sequence[Sequence[int]], max_depth: int
) -> tuple[int, ...]:
    assignments: set[int] = set()
    for path in leaves:
        if len(path) > max_depth or any(bit not in (0, 1) for bit in path):
            raise AdaptiveCubingError("leaf path is outside the plan depth")
        suffix_depth = max_depth - len(path)
        prefix = 0
        for bit in path:
            prefix = (prefix << 1) | bit
        for suffix in range(1 << suffix_depth):
            assignments.add((prefix << suffix_depth) | suffix)
    return tuple(sorted(assignments))


def _cover_hash(leaves: Sequence[Sequence[int]], max_depth: int) -> str:
    return _sha256_value(list(_cover_assignments(leaves, max_depth)))


def verify_plan(plan: Mapping[str, Any]) -> dict[str, Any]:
    """Independently validate authentication, tree shape, and exact cover."""

    if not isinstance(plan, Mapping) or plan.get("schema") != SCHEMA:
        raise AdaptiveCubingError("invalid adaptive cube plan schema")
    unsigned = dict(plan)
    claimed = unsigned.pop("plan_sha256", None)
    if not isinstance(claimed, str) or claimed != _sha256_value(unsigned):
        raise AdaptiveCubingError("adaptive cube plan hash mismatch")
    initial_depth = plan.get("initial_depth")
    max_depth = plan.get("max_depth")
    if (
        type(initial_depth) is not int
        or type(max_depth) is not int
        or not 1 <= initial_depth <= max_depth <= MAX_DEPTH
    ):
        raise AdaptiveCubingError("adaptive cube plan depth is invalid")
    budget = PilotBudget.from_mapping(plan.get("pilot_budget", {}))
    variables = _normalize_semantic_variables(
        plan.get("semantic_variables", []),
        required_depth=max_depth,
    )
    _validate_bank_epoch(plan.get("bank_epoch", {}))
    raw_nodes = plan.get("nodes")
    if not isinstance(raw_nodes, list):
        raise AdaptiveCubingError("adaptive cube plan nodes are not a list")
    nodes: dict[str, Mapping[str, Any]] = {}
    paths: dict[tuple[int, ...], str] = {}
    for index, raw_node in enumerate(raw_nodes):
        if not isinstance(raw_node, Mapping):
            raise AdaptiveCubingError(f"node {index} is not an object")
        node_id = raw_node.get("node_id")
        path_value = raw_node.get("path")
        if not isinstance(node_id, str) or not isinstance(path_value, list):
            raise AdaptiveCubingError(f"node {index} has invalid identity")
        path = tuple(path_value)
        if node_id != _node_id(path) or path in paths:
            raise AdaptiveCubingError(f"node {index} has duplicate identity")
        if raw_node.get("depth") != len(path):
            raise AdaptiveCubingError(f"node {index} depth mismatch")
        if not initial_depth <= len(path) <= max_depth:
            raise AdaptiveCubingError(f"node {index} path depth is invalid")
        expected_literals = list(_cube_literals(variables, path))
        if raw_node.get("literals") != expected_literals:
            raise AdaptiveCubingError(f"node {index} literal mismatch")
        if node_id in nodes:
            raise AdaptiveCubingError(f"duplicate adaptive node {node_id}")
        nodes[node_id] = raw_node
        paths[path] = node_id

    expected_initial = {
        _node_id(path) for path in itertools.product((0, 1), repeat=initial_depth)
    }
    actual_initial = {
        node_id
        for path, node_id in paths.items()
        if len(path) == initial_depth
    }
    if actual_initial != expected_initial:
        raise AdaptiveCubingError("initial cube partition is not exact")

    pilot_indices: list[int] = []
    for node_id, node in nodes.items():
        path = tuple(node["path"])
        if len(path) > initial_depth:
            parent_id = paths.get(path[:-1])
            if parent_id is None:
                raise AdaptiveCubingError(f"node {node_id} has no parent")
            parent = nodes[parent_id]
            if parent.get("action") != "split":
                raise AdaptiveCubingError(f"node {node_id} has a nonsplitting parent")
        pilot = node.get("pilot")
        if not isinstance(pilot, Mapping):
            raise AdaptiveCubingError(f"node {node_id} has no pilot record")
        raw_outcome = PilotOutcome.from_value(pilot)
        effective = pilot.get("effective_verdict")
        if effective not in VERDICTS:
            raise AdaptiveCubingError(f"node {node_id} has invalid effective verdict")
        exhausted = pilot.get("budget_exhausted")
        if type(exhausted) is not bool:
            raise AdaptiveCubingError(f"node {node_id} budget flag is invalid")
        pilot_index = pilot.get("pilot_index")
        if pilot_index is not None:
            if type(pilot_index) is not int or pilot_index < 0:
                raise AdaptiveCubingError(f"node {node_id} pilot index is invalid")
            pilot_indices.append(pilot_index)
        expected_effective, expected_exhausted = _bounded_pilot(raw_outcome, budget)
        if effective != expected_effective or exhausted != expected_exhausted:
            raise AdaptiveCubingError(f"node {node_id} pilot bound mismatch")
        action = node.get("action")
        children = node.get("children")
        if action not in {"retain", "split", "unknown"} or not isinstance(children, list):
            raise AdaptiveCubingError(f"node {node_id} action is invalid")
        can_split = effective in UNRESOLVED_VERDICTS and len(path) < max_depth
        if action == "split":
            expected_children = [_node_id(path + (bit,)) for bit in (0, 1)]
            if not can_split or children != expected_children:
                raise AdaptiveCubingError(f"node {node_id} split contract mismatch")
            if any(child not in nodes for child in children):
                raise AdaptiveCubingError(f"node {node_id} names a missing child")
        else:
            if children:
                raise AdaptiveCubingError(f"leaf {node_id} unexpectedly has children")
            if action == "retain" and effective not in EASY_VERDICTS:
                raise AdaptiveCubingError(f"node {node_id} retained an unresolved pilot")
            if action == "unknown" and effective in EASY_VERDICTS:
                raise AdaptiveCubingError(f"node {node_id} hid an easy pilot")

    expected_leaves = [node_id for node_id, node in nodes.items() if not node["children"]]
    if plan.get("leaves") != expected_leaves:
        raise AdaptiveCubingError("adaptive leaf order is not canonical")
    leaves = [tuple(nodes[node_id]["path"]) for node_id in expected_leaves]
    assignments = _cover_assignments(leaves, max_depth)
    if len(assignments) != 1 << max_depth or assignments != tuple(range(1 << max_depth)):
        raise AdaptiveCubingError("adaptive cube leaves do not exactly cover the root")
    if plan.get("exact_cover_sha256") != _sha256_value(list(assignments)):
        raise AdaptiveCubingError("adaptive exact-cover hash mismatch")
    if plan.get("pilot_count") != sum(
        node["pilot"]["pilot_index"] is not None for node in nodes.values()
    ):
        raise AdaptiveCubingError("adaptive pilot count mismatch")
    if sorted(pilot_indices) != list(range(int(plan["pilot_count"]))):
        raise AdaptiveCubingError("adaptive pilot indices are not contiguous")
    if plan.get("leaf_count") != len(expected_leaves):
        raise AdaptiveCubingError("adaptive leaf count mismatch")
    return {
        "schema": SCHEMA,
        "node_count": len(nodes),
        "leaf_count": len(expected_leaves),
        "pilot_count": int(plan["pilot_count"]),
        "retained_leaf_count": sum(
            nodes[node_id]["action"] == "retain" for node_id in expected_leaves
        ),
        "unknown_leaf_count": sum(
            nodes[node_id]["action"] == "unknown" for node_id in expected_leaves
        ),
        "exact_cover": True,
        "plan_sha256": claimed,
        "bank_epoch_sha256": plan["bank_epoch"]["bank_epoch_sha256"],
    }


def write_plan(path: str | Path, plan: Mapping[str, Any]) -> dict[str, Any]:
    """Validate and atomically publish one adaptive plan artifact."""

    verify_plan(plan)
    target = Path(path)
    target.parent.mkdir(parents=True, exist_ok=True)
    temporary_name: str | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="wb",
            dir=target.parent,
            prefix=f".{target.name}.",
            suffix=".tmp",
            delete=False,
        ) as handle:
            temporary_name = handle.name
            handle.write(_canonical_bytes(plan) + b"\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary_name, target)
        temporary_name = None
        directory_flags = os.O_RDONLY
        if hasattr(os, "O_DIRECTORY"):
            directory_flags |= os.O_DIRECTORY
        directory_fd = os.open(target.parent, directory_flags)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)
        return dict(plan)
    finally:
        if temporary_name is not None:
            with contextlib.suppress(FileNotFoundError):
                os.unlink(temporary_name)


def load_plan(path: str | Path) -> dict[str, Any]:
    """Load and independently validate an authenticated plan artifact."""

    target = Path(path)
    try:
        value = json.loads(target.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise AdaptiveCubingError(f"cannot read adaptive plan {target}: {exc}") from exc
    if not isinstance(value, dict):
        raise AdaptiveCubingError("adaptive plan file is not an object")
    verify_plan(value)
    return value


def _normalize_wave_result(value: Mapping[str, Any] | PilotOutcome) -> dict[str, Any]:
    """Normalize one leaf result without assigning it mathematical meaning."""

    if isinstance(value, PilotOutcome):
        normalized: dict[str, Any] = value.as_dict()
    elif isinstance(value, Mapping):
        try:
            normalized = json.loads(_canonical_bytes(dict(value)))
        except (TypeError, ValueError) as exc:
            raise AdaptiveCubingError(
                f"wave runner returned a non-JSON result: {exc}"
            ) from exc
        if not isinstance(normalized, dict):
            raise AdaptiveCubingError("wave runner result is not an object")
    else:
        raise AdaptiveCubingError("wave runner returned a non-object")

    verdict = normalized.get("verdict")
    status = normalized.get("status")
    if verdict is None:
        verdict = status
    elif status is not None and status != verdict:
        raise AdaptiveCubingError("wave result status disagrees with verdict")
    if verdict not in VERDICTS:
        raise AdaptiveCubingError(
            f"wave result verdict must be one of {', '.join(VERDICTS)}"
        )
    normalized["verdict"] = verdict
    normalized.pop("status", None)
    return normalized


def _wave_state_unsigned(
    plan: Mapping[str, Any],
    *,
    status: str,
    leaf_results: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    if status not in WAVE_STATUSES:
        raise AdaptiveCubingError(f"invalid adaptive wave status: {status}")
    bank_epoch = dict(plan["bank_epoch"])
    return {
        "schema": WAVE_SCHEMA,
        "plan_sha256": plan["plan_sha256"],
        "bank_epoch": bank_epoch,
        "bank_epoch_sha256": bank_epoch["bank_epoch_sha256"],
        "leaf_ids": list(plan["leaves"]),
        "leaf_count": len(plan["leaves"]),
        "status": status,
        "next_leaf_index": len(leaf_results),
        "result_count": len(leaf_results),
        "leaf_results": [dict(result) for result in leaf_results],
        "claim_scope": (
            "epoch-bound adaptive discovery wave only; leaf SAT and UNSAT are "
            "not proofs; UNKNOWN, interruption, and exception results remain "
            "unresolved; terminal claims require fresh exact-CNF replay"
        ),
    }


def _make_wave_state(
    plan: Mapping[str, Any],
    *,
    status: str,
    leaf_results: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    unsigned = _wave_state_unsigned(
        plan,
        status=status,
        leaf_results=leaf_results,
    )
    return {**unsigned, "wave_state_sha256": _sha256_value(unsigned)}


def verify_wave_state(
    state: Mapping[str, Any],
    plan: Mapping[str, Any] | None = None,
) -> dict[str, Any]:
    """Replay a durable wave checkpoint and optionally bind it to its plan."""

    if not isinstance(state, Mapping) or state.get("schema") != WAVE_SCHEMA:
        raise AdaptiveCubingError("invalid adaptive wave state schema")
    unsigned = dict(state)
    claimed = unsigned.pop("wave_state_sha256", None)
    if not isinstance(claimed, str) or claimed != _sha256_value(unsigned):
        raise AdaptiveCubingError("adaptive wave state hash mismatch")
    _validate_bank_epoch(state.get("bank_epoch", {}))
    bank_epoch = state["bank_epoch"]
    if state.get("bank_epoch_sha256") != bank_epoch["bank_epoch_sha256"]:
        raise AdaptiveCubingError("adaptive wave bank epoch hash mismatch")
    if state.get("status") not in WAVE_STATUSES:
        raise AdaptiveCubingError("adaptive wave state has an invalid status")
    if not isinstance(state.get("plan_sha256"), str):
        raise AdaptiveCubingError("adaptive wave state has no plan hash")
    leaf_ids = state.get("leaf_ids")
    leaf_results = state.get("leaf_results")
    if not isinstance(leaf_ids, list) or not isinstance(leaf_results, list):
        raise AdaptiveCubingError("adaptive wave state leaves are malformed")
    if state.get("leaf_count") != len(leaf_ids):
        raise AdaptiveCubingError("adaptive wave leaf count mismatch")
    if state.get("result_count") != len(leaf_results):
        raise AdaptiveCubingError("adaptive wave result count mismatch")
    if state.get("next_leaf_index") != len(leaf_results):
        raise AdaptiveCubingError("adaptive wave next index mismatch")
    if not 0 <= len(leaf_results) <= len(leaf_ids):
        raise AdaptiveCubingError("adaptive wave result prefix is out of range")

    plan_nodes: dict[str, Mapping[str, Any]] = {}
    if plan is not None:
        verify_plan(plan)
        if state["plan_sha256"] != plan["plan_sha256"]:
            raise AdaptiveCubingError("adaptive wave state is stale for this plan")
        if bank_epoch != plan["bank_epoch"]:
            raise AdaptiveCubingError("adaptive wave state bank epoch is stale")
        if leaf_ids != plan["leaves"]:
            raise AdaptiveCubingError("adaptive wave leaf frontier differs from plan")
        plan_nodes = {node["node_id"]: node for node in plan["nodes"]}

    unresolved = 0
    for index, raw_result in enumerate(leaf_results):
        if not isinstance(raw_result, Mapping):
            raise AdaptiveCubingError(f"adaptive wave result {index} is not an object")
        if raw_result.get("leaf_index") != index:
            raise AdaptiveCubingError(f"adaptive wave result {index} index mismatch")
        leaf_id = raw_result.get("leaf_id")
        if leaf_id != leaf_ids[index]:
            raise AdaptiveCubingError(f"adaptive wave result {index} leaf mismatch")
        path = raw_result.get("path")
        literals = raw_result.get("literals")
        if not isinstance(path, list) or not isinstance(literals, list):
            raise AdaptiveCubingError(f"adaptive wave result {index} cube is malformed")
        result = raw_result.get("result")
        normalized = _normalize_wave_result(result)
        if normalized != result:
            raise AdaptiveCubingError(f"adaptive wave result {index} is not canonical")
        if normalized["verdict"] in UNRESOLVED_VERDICTS:
            unresolved += 1
        if plan is not None:
            node = plan_nodes.get(leaf_id)
            if node is None or path != node["path"] or literals != node["literals"]:
                raise AdaptiveCubingError(
                    f"adaptive wave result {index} cube differs from plan"
                )

    processed = len(leaf_results)
    if processed < len(leaf_ids):
        if state["status"] not in {"RUNNING", "BUDGET"}:
            raise AdaptiveCubingError(
                "incomplete adaptive wave has a terminal status"
            )
    else:
        expected_status = "UNKNOWN" if unresolved else "COMPLETE"
        if state["status"] != expected_status:
            raise AdaptiveCubingError("adaptive wave terminal status mismatch")

    return {
        "schema": WAVE_SCHEMA,
        "status": state["status"],
        "plan_sha256": state["plan_sha256"],
        "bank_epoch_sha256": state["bank_epoch_sha256"],
        "leaf_count": len(leaf_ids),
        "result_count": processed,
        "unresolved_count": unresolved,
        "complete": processed == len(leaf_ids),
        "wave_state_sha256": claimed,
    }


def write_wave_state(path: str | Path, state: Mapping[str, Any]) -> dict[str, Any]:
    """Atomically publish a validated adaptive-wave checkpoint."""

    verify_wave_state(state)
    target = Path(path)
    target.parent.mkdir(parents=True, exist_ok=True)
    temporary_name: str | None = None
    try:
        with tempfile.NamedTemporaryFile(
            mode="wb",
            dir=target.parent,
            prefix=f".{target.name}.",
            suffix=".tmp",
            delete=False,
        ) as handle:
            temporary_name = handle.name
            handle.write(_canonical_bytes(state) + b"\n")
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary_name, target)
        temporary_name = None
        directory_flags = os.O_RDONLY
        if hasattr(os, "O_DIRECTORY"):
            directory_flags |= os.O_DIRECTORY
        directory_fd = os.open(target.parent, directory_flags)
        try:
            os.fsync(directory_fd)
        finally:
            os.close(directory_fd)
        return dict(state)
    finally:
        if temporary_name is not None:
            with contextlib.suppress(FileNotFoundError):
                os.unlink(temporary_name)


def load_wave_state(path: str | Path) -> dict[str, Any]:
    """Load and authenticate one adaptive-wave checkpoint."""

    target = Path(path)
    try:
        value = json.loads(target.read_text(encoding="utf-8"))
    except (OSError, json.JSONDecodeError) as exc:
        raise AdaptiveCubingError(
            f"cannot read adaptive wave state {target}: {exc}"
        ) from exc
    if not isinstance(value, dict):
        raise AdaptiveCubingError("adaptive wave state file is not an object")
    verify_wave_state(value)
    return value


def run_plan_wave(
    plan: Mapping[str, Any] | str | Path,
    *,
    state_path: str | Path,
    current_bank_epoch: Mapping[str, Any],
    leaf_runner: WaveRunner,
    resume: bool = False,
    max_leaves: int | None = None,
) -> dict[str, Any]:
    """Consume one published plan in canonical order with crash-safe checkpoints."""

    if isinstance(plan, (str, Path)):
        loaded_plan = load_plan(plan)
    else:
        verify_plan(plan)
        loaded_plan = dict(plan)
    _validate_bank_epoch(current_bank_epoch)
    if current_bank_epoch != loaded_plan["bank_epoch"]:
        raise AdaptiveCubingError(
            "stale bank epoch: current epoch does not match the published plan"
        )
    if not callable(leaf_runner):
        raise AdaptiveCubingError("leaf_runner must be callable")
    if max_leaves is not None and (
        type(max_leaves) is not int or max_leaves <= 0
    ):
        raise AdaptiveCubingError("max_leaves must be a positive int or null")

    target = Path(state_path)
    if target.exists():
        if not resume:
            raise AdaptiveCubingError(
                "adaptive wave state exists; pass resume=True to continue"
            )
        state = load_wave_state(target)
        if state["plan_sha256"] != loaded_plan["plan_sha256"]:
            raise AdaptiveCubingError("stale adaptive wave state plan")
        if state["bank_epoch"] != current_bank_epoch:
            raise AdaptiveCubingError("stale adaptive wave state bank epoch")
        verify_wave_state(state, loaded_plan)
    else:
        if resume:
            raise AdaptiveCubingError(
                "cannot resume adaptive wave without a checkpoint"
            )
        state = _make_wave_state(
            loaded_plan,
            status="RUNNING",
            leaf_results=(),
        )
        write_wave_state(target, state)

    if state["status"] in {"COMPLETE", "UNKNOWN"}:
        return state

    nodes = {node["node_id"]: node for node in loaded_plan["nodes"]}
    leaf_results = list(state["leaf_results"])
    start_index = len(leaf_results)
    for processed_this_call, leaf_index in enumerate(
        range(start_index, len(loaded_plan["leaves"]))
    ):
        if max_leaves is not None and processed_this_call >= max_leaves:
            state = _make_wave_state(
                loaded_plan,
                status="BUDGET",
                leaf_results=leaf_results,
            )
            write_wave_state(target, state)
            return state
        leaf_id = loaded_plan["leaves"][leaf_index]
        node = nodes[leaf_id]
        spec = CubeSpec(tuple(node["path"]), tuple(node["literals"]))
        try:
            result = _normalize_wave_result(leaf_runner(spec))
        except Exception as exc:  # noqa: BLE001
            result = {
                "verdict": "EXCEPTION",
                "reason": f"{type(exc).__name__}: {exc}",
            }
        leaf_results.append(
            {
                "leaf_index": leaf_index,
                "leaf_id": leaf_id,
                "path": list(spec.path),
                "literals": list(spec.literals),
                "result": result,
            }
        )
        status = "RUNNING"
        if len(leaf_results) == len(loaded_plan["leaves"]):
            status = (
                "UNKNOWN"
                if any(
                    item["result"]["verdict"] in UNRESOLVED_VERDICTS
                    for item in leaf_results
                )
                else "COMPLETE"
            )
        state = _make_wave_state(
            loaded_plan,
            status=status,
            leaf_results=leaf_results,
        )
        write_wave_state(target, state)
    return state
