#!/usr/bin/env python3
"""Round-5 v18: static length-two equality cuts before dynamic CEGAR.

The profile-specific bank compiles every length-two exact-shell equality
contradiction into the Boolean master before its first model.  Longer equality
paths remain in v17's replay-authenticated dynamic lane.  The frozen full
formula is not augmented with the bank, so every dynamic generalized blocker
still replays against the unchanged raw formula.

This is external exact-n15 solver evidence, not a Lean proof or universal
closure result.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import time
from collections.abc import Mapping, Sequence
from dataclasses import asdict, dataclass
from pathlib import Path

import z3

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v16 as v16
import round5_cegar_v17 as v17

HERE = Path(__file__).resolve().parent
TARGET = v17.TARGET
SCHEMA_VERSION = 18
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = HERE / "schema_v18.json"
TEST_PATH = HERE / "test_round5_cegar_v18.py"
FOCUSED_TEST_LOG_PATH = HERE / "focused-tests-v18.log"
FOCUSED_TEST_COMMAND = "uv run --with pytest pytest -q test_round5_cegar_v18.py"
Case = v17.Case
Fix = v17.Fix


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def optional_file_sha256(path: Path) -> str | None:
    return file_sha256(path) if path.is_file() else None


def canonical_sha256(value: object) -> str:
    return v17.canonical_sha256(value)


@dataclass(frozen=True, order=True)
class ShellClass:
    """A semantic-Bool row whose true members denote one distance equality."""

    kind: str
    center: int
    index: int = 0

    def member_name(self, point: int) -> str:
        if self.kind == "rich":
            return f"rich_{self.center - v8.APICES[0]}_{self.index}_{point}"
        if self.kind == "critical":
            return f"critical_row_{self.center}_{point}"
        if self.kind == "k4":
            return f"k4_{self.center}_{point}"
        raise ValueError(f"unknown shell kind: {self.kind}")

    def record(self) -> dict[str, object]:
        return asdict(self)


@dataclass(frozen=True, order=True)
class StaticEqualityTriangleCut:
    """A length-two equality path contradicting an exact-shell nonmember."""

    target: ShellClass
    inside: int
    outside: int
    left: ShellClass
    right: ShellClass
    used_centers: tuple[int, ...]

    def signed_memberships(self) -> tuple[tuple[str, bool], ...]:
        return (
            (self.target.member_name(self.inside), True),
            (self.target.member_name(self.outside), False),
            (self.left.member_name(self.target.center), True),
            (self.left.member_name(self.inside), True),
            (self.right.member_name(self.outside), True),
            (self.right.member_name(self.target.center), True),
        )

    def record(self) -> dict[str, object]:
        return {
            "target": self.target.record(),
            "inside": self.inside,
            "outside": self.outside,
            "left": self.left.record(),
            "right": self.right.record(),
            "used_centers": list(self.used_centers),
            "signed_memberships": [
                {"bool": name, "value": value}
                for name, value in self.signed_memberships()
            ],
        }

    def formula(self) -> z3.BoolRef:
        antecedents: list[z3.BoolRef] = [
            z3.Bool(name) if value else z3.Not(z3.Bool(name))
            for name, value in self.signed_memberships()
        ]
        antecedents.extend(
            z3.Or(*(z3.Bool(f"block_{source}_{center}") for source in v8.POINTS))
            for center in self.used_centers
        )
        return z3.Not(z3.And(*antecedents))

    def matches(self, assignment: Mapping[str, bool]) -> bool:
        if not all(assignment.get(name) is value for name, value in self.signed_memberships()):
            return False
        return all(
            any(assignment.get(f"block_{source}_{center}") is True for source in v8.POINTS)
            for center in self.used_centers
        )

    def specializes(self, core: Mapping[str, bool]) -> bool:
        if not all(core.get(name) is value for name, value in self.signed_memberships()):
            return False
        return all(
            any(core.get(f"block_{source}_{center}") is True for source in v8.POINTS)
            for center in self.used_centers
        )


def _validate_profiles(profiles: str) -> None:
    if len(profiles) != len(v8.APICES) or any(profile not in "SD" for profile in profiles):
        raise ValueError("profiles must be a three-character S/D word")


def _classes_at(center: int, profiles: str, *, exact: bool) -> tuple[ShellClass, ...]:
    if center not in v8.APICES:
        critical = ShellClass("critical", center)
        return (critical,) if exact else (ShellClass("k4", center), critical)
    apex_index = center - v8.APICES[0]
    rich = tuple(
        ShellClass("rich", center, index)
        for index in range(1 if profiles[apex_index] == "S" else 2)
    )
    return rich if exact else (ShellClass("k4", center), *rich)


def static_triangle_bank(profiles: str) -> tuple[StaticEqualityTriangleCut, ...]:
    """Enumerate the reduced, profile-specific length-two implication bank."""
    _validate_profiles(profiles)
    cuts: list[StaticEqualityTriangleCut] = []
    for center in v8.POINTS:
        others = tuple(point for point in v8.POINTS if point != center)
        for target in _classes_at(center, profiles, exact=True):
            for inside, outside in itertools.permutations(others, 2):
                for left in _classes_at(outside, profiles, exact=False):
                    for right in _classes_at(inside, profiles, exact=False):
                        used_centers = tuple(sorted({
                            shell.center
                            for shell in (target, left, right)
                            if shell.kind == "critical"
                        }))
                        cuts.append(StaticEqualityTriangleCut(
                            target, inside, outside, left, right, used_centers
                        ))
    bank = tuple(cuts)
    if len(set(bank)) != len(bank):
        raise RuntimeError("static equality-triangle bank contains duplicates")
    return bank


def static_triangle_bank_sha256(bank: Sequence[StaticEqualityTriangleCut]) -> str:
    return canonical_sha256([cut.record() for cut in bank])


def static_triangle_bank_manifest() -> dict[str, dict[str, object]]:
    manifest: dict[str, dict[str, object]] = {}
    for profiles in ("SSS", "SSD", "SDS", "DSS", "SDD", "DSD", "DDS", "DDD"):
        bank = static_triangle_bank(profiles)
        manifest[profiles] = {
            "cut_count": len(bank),
            "descriptor_sha256": static_triangle_bank_sha256(bank),
        }
    return manifest


def assignment_map(entry: Mapping[str, object]) -> dict[str, bool]:
    assignment = entry["assignment"]
    assert isinstance(assignment, list)
    return {str(item["bool"]): bool(item["value"]) for item in assignment}


def projected_core_map(entry: Mapping[str, object]) -> dict[str, bool]:
    core = entry["projected_core"]
    assert isinstance(core, list)
    return {str(item["bool"]): bool(item["value"]) for item in core}


def matching_static_cuts(
    bank: Sequence[StaticEqualityTriangleCut], assignment: Mapping[str, bool]
) -> tuple[StaticEqualityTriangleCut, ...]:
    return tuple(cut for cut in bank if cut.matches(assignment))


def _static_bank_record(
    profiles: str,
    bank: Sequence[StaticEqualityTriangleCut],
    before_hash: str,
    after_hash: str,
) -> dict[str, object]:
    length_distribution: dict[str, int] = {}
    for cut in bank:
        length = str(6 + len(cut.used_centers))
        length_distribution[length] = length_distribution.get(length, 0) + 1
    return {
        "family": "exact_shell_length_two_equality_implication",
        "profiles": profiles,
        "path_length": 2,
        "cut_count": len(bank),
        "unique_cut_count": len(set(bank)),
        "descriptor_sha256": static_triangle_bank_sha256(bank),
        "clause_length_distribution": dict(sorted(length_distribution.items())),
        "pre_bank_master_formula_sha256": before_hash,
        "post_bank_master_formula_sha256": after_hash,
        "admission": (
            "syntactic equality transitivity: two true shell equalities connect "
            "a proved target member to a proved target nonmember; critical rows "
            "are guarded by Used(center)"
        ),
        "dynamic_boundary": "equality paths of length at least three remain replay-authenticated",
        "frozen_full_formula_augmented": False,
    }


def add_static_triangle_bank(
    master: z3.Solver, profiles: str
) -> tuple[tuple[StaticEqualityTriangleCut, ...], dict[str, object]]:
    bank = static_triangle_bank(profiles)
    before_hash = v16.formula_sha256(master)
    master.add(*(cut.formula() for cut in bank))
    after_hash = v16.formula_sha256(master)
    return bank, _static_bank_record(profiles, bank, before_hash, after_hash)


def source_contract() -> dict[str, object]:
    contract = v17.source_contract()
    role_map = dict(contract["role_map"])
    role_map["boolean_assignment_cegar"] = (
        "v18 inserts the complete reduced profile-specific length-two exact-shell "
        "equality implication bank into the Boolean master before its first model; "
        "v17 handles paths of length at least three by raw replay and retains its "
        "independently replayed complete-assignment QF_LRA fallback"
    )
    contract["role_map"] = role_map
    return contract


def provenance() -> dict[str, object]:
    inherited = v17.provenance()
    return {
        **inherited,
        "schema_version": SCHEMA_VERSION,
        "script_sha256": file_sha256(SCRIPT_PATH),
        "schema_sha256": file_sha256(SCHEMA_PATH),
        "base_v17_script_sha256": file_sha256(HERE / "round5_cegar_v17.py"),
        "base_v17_schema_sha256": file_sha256(HERE / "schema_v17.json"),
        "base_v17_focused_test_source_sha256": inherited["focused_test_source_sha256"],
        "base_v17_focused_test_log_sha256": inherited["focused_test_log_sha256"],
        "base_v17_focused_test_command": inherited["focused_test_command"],
        "static_equality_triangle_bank_manifest": static_triangle_bank_manifest(),
        "focused_test_source": TEST_PATH.name,
        "focused_test_source_sha256": file_sha256(TEST_PATH),
        "focused_test_log": FOCUSED_TEST_LOG_PATH.name,
        "focused_test_log_sha256": optional_file_sha256(FOCUSED_TEST_LOG_PATH),
        "focused_test_command": FOCUSED_TEST_COMMAND,
        "source_contract": source_contract(),
    }


def verify_frozen_provenance(
    frozen: dict[str, object], expected_script_sha256: str | None = None
) -> dict[str, object]:
    current = provenance()
    if frozen != current:
        differing = sorted(
            key for key in set(frozen) | set(current)
            if frozen.get(key) != current.get(key)
        )
        raise RuntimeError(f"frozen provenance differs from worker source: {differing}")
    if expected_script_sha256 is not None and current["script_sha256"] != expected_script_sha256:
        raise RuntimeError("worker v18 source hash differs from parent invocation")
    return current


# v17 owns both dynamic lanes.  Re-export these names for focused audits.
equality_closure_core = v17.equality_closure_core
check_assignment = v17.check_assignment


def _rename_v18_artifacts(case_dir: Path, result: dict[str, object]) -> None:
    mapping = {
        "cegar_trace_v16.json": "cegar_trace_v18.json",
        "boolean_prepass_v16.json": "boolean_prepass_v18.json",
        "boolean_master_v16.smt2.gz": "boolean_master_v18.smt2.gz",
        "full_frozen_v16.smt2.gz": "full_frozen_v18.smt2.gz",
        "witness_v16.json": "witness_v18.json",
    }
    for old, new in mapping.items():
        old_path = case_dir / old
        if old_path.exists():
            old_path.rename(case_dir / new)
        for key, value in list(result.items()):
            if value == old:
                result[key] = new
    trace_path = case_dir / "cegar_trace_v18.json"
    prepass_path = case_dir / "boolean_prepass_v18.json"
    if trace_path.exists():
        result["cegar_trace_sha256"] = file_sha256(trace_path)
    if prepass_path.exists():
        result["boolean_prepass_sha256"] = file_sha256(prepass_path)
    blobs: dict[str, dict[str, str]] = {}
    for role, filename in (
        ("boolean_master", "boolean_master_v18.smt2.gz"),
        ("full_frozen", "full_frozen_v18.smt2.gz"),
    ):
        path = case_dir / filename
        if path.is_file():
            blobs[role] = {"file": filename, "sha256": file_sha256(path)}
    result["frozen_blob_hashes"] = blobs
    result["result_hash_contract"] = {
        "embedded": False,
        "reason": "A result.json SHA-256 cannot be embedded in result.json without changing the hashed bytes.",
        "external_attestation": "summary.json:results[0].result_file_sha256",
    }


def _rename_incomplete_reason(result: dict[str, object]) -> None:
    reason = result.get("reason_incomplete")
    if reason == "v16_assignment_budget_exhausted":
        result["reason_incomplete"] = "v18_assignment_budget_exhausted"
    elif reason == "v16_wall_clock_budget_exhausted":
        result["reason_incomplete"] = "v18_wall_clock_budget_exhausted"


def solve_case(
    case: Case,
    timeout_ms: int,
    out_dir: Path,
    seed: int = 97,
    max_power_cuts: int = 256,
    max_power_candidates: int = 2_000_000,
    bool_timeout_ms: int = 30_000,
    max_bool_power_cuts: int = 256,
    max_bool_power_candidates: int = 2_000_000,
    max_assignments: int = 256,
    replay_timeout_ms: int = 30_000,
    expected_script_sha256: str | None = None,
    frozen_provenance: dict[str, object] | None = None,
) -> dict[str, object]:
    launch = frozen_provenance if frozen_provenance is not None else provenance()
    expected = expected_script_sha256 or str(launch["script_sha256"])
    old_check = v16.check_assignment
    old_verify = v16.verify_frozen_provenance
    old_prepass = v12.run_boolean_prepass

    def prepass_with_static_bank(*args: object, **kwargs: object):
        report, learned, master = old_prepass(*args, **kwargs)
        _, bank_record = add_static_triangle_bank(master, case.profiles)
        report = dict(report)
        report["static_equality_triangle_bank"] = bank_record
        return report, learned, master

    try:
        v16.check_assignment = check_assignment
        v16.verify_frozen_provenance = verify_frozen_provenance
        v12.run_boolean_prepass = prepass_with_static_bank
        result = v16.solve_case(
            case=case,
            timeout_ms=timeout_ms,
            out_dir=out_dir,
            seed=seed,
            max_power_cuts=max_power_cuts,
            max_power_candidates=max_power_candidates,
            bool_timeout_ms=bool_timeout_ms,
            max_bool_power_cuts=max_bool_power_cuts,
            max_bool_power_candidates=max_bool_power_candidates,
            max_assignments=max_assignments,
            replay_timeout_ms=replay_timeout_ms,
            expected_script_sha256=expected,
            frozen_provenance=launch,
        )
    finally:
        v16.check_assignment = old_check
        v16.verify_frozen_provenance = old_verify
        v12.run_boolean_prepass = old_prepass

    case_dir = out_dir / case.case_id
    _rename_v18_artifacts(case_dir, result)
    _rename_incomplete_reason(result)
    prepass = result.get("boolean_prepass")
    if isinstance(prepass, dict):
        result["static_equality_triangle_bank"] = prepass.get("static_equality_triangle_bank")
    result["theory_classification"] = (
        "static Boolean equality implications; then post-assignment exact "
        "PB-to-If normalization, audited QF_LRA"
    )
    result["solver_lane"] = (
        "profile-specific length-two equality bank before first master model; "
        "replay-authenticated dynamic equality closure for length>=3; otherwise "
        "SolverFor(QF_LRA) with fresh normalized replay"
    )
    v12.write_json(case_dir / "result.json", result)
    return result


def parser() -> argparse.ArgumentParser:
    result = v16.parser()
    result.description = __doc__
    for action in result._actions:
        if isinstance(action, argparse._SubParsersAction):
            for subparser in action.choices.values():
                for subaction in subparser._actions:
                    if subaction.dest == "artifacts":
                        subaction.default = HERE / "artifacts-v18"
    return result


def run_one(args: argparse.Namespace, case: Case, command: str) -> int:
    started = time.monotonic()
    run_dir = v8.make_run_dir(args.artifacts, command)
    frozen = provenance()
    invocation = {
        **frozen,
        "argv": list(__import__("sys").argv),
        "case_count": 1,
        "workers": 1,
        "resolved_budgets": {
            "timeout_ms": args.timeout_ms,
            "bool_timeout_ms": args.bool_timeout_ms,
            "replay_timeout_ms": args.replay_timeout_ms,
            "max_assignments": args.max_assignments,
            "max_bool_power_cuts": args.max_bool_power_cuts,
            "max_bool_power_candidates": args.max_bool_power_candidates,
        },
    }
    v12.write_json(run_dir / "invocation.json", invocation)
    result = solve_case(
        case=case,
        timeout_ms=args.timeout_ms,
        out_dir=run_dir,
        seed=args.seed,
        max_power_cuts=args.max_power_cuts,
        max_power_candidates=args.max_power_candidates,
        bool_timeout_ms=args.bool_timeout_ms,
        max_bool_power_cuts=args.max_bool_power_cuts,
        max_bool_power_candidates=args.max_bool_power_candidates,
        max_assignments=args.max_assignments,
        replay_timeout_ms=args.replay_timeout_ms,
        expected_script_sha256=str(frozen["script_sha256"]),
        frozen_provenance=frozen,
    )
    result_path = run_dir / case.case_id / "result.json"
    result_attested = {**result, "result_file_sha256": file_sha256(result_path)}
    complete = result.get("complete") is True
    summary = {
        **invocation,
        "command": command,
        "elapsed_seconds": time.monotonic() - started,
        "counts": {str(result["status"]): 1},
        "complete": complete,
        "results": [result_attested],
    }
    v12.write_json(run_dir / "summary.json", summary)
    print(json.dumps({
        "counts": summary["counts"], "complete": complete, "run_dir": str(run_dir)
    }, sort_keys=True))
    return 0 if complete else 2


def main() -> int:
    args = parser().parse_args()
    if args.command == "smoke":
        args.workers = 1
        return run_one(args, Case("paired", "SSS", 0, 1, None), "smoke")
    if args.command == "case":
        args.workers = 1
        return run_one(
            args,
            Case(args.arm, args.profiles, args.kept, args.deleted, args.fresh),
            "case",
        )
    raise SystemExit("v18 permits only one-case or smoke runs; no broad matrix")


if __name__ == "__main__":
    raise SystemExit(main())
