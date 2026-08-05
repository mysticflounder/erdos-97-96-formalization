"""Bounded full-metric canary for the pinned endpoint-seed multiplicity theorem.

The Lean producer fixes one center in the exact-six endpoint seed and bounds
the intersection of that seed with every positive-radius physical shell by
three.  Unlike the v33 selected-row projection, these constraints mention the
physical distance variables and therefore must not enter the Boolean-only
relaxation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import time
from pathlib import Path

import round5_cegar_v8 as v8
import round5_cegar_v12 as v12
import round5_cegar_v35 as v35
import v36_selected_row_alternation_pilot as v36
import v37_endpoint_frontier_adjacent_singleton_pilot as v37
import z3

SCHEMA_VERSION = 38
SCRIPT_PATH = Path(__file__).resolve()
SCHEMA_PATH = SCRIPT_PATH.with_name("schema_v38.json")
LEAN_SOURCE_PATH = (
    v8.PROJECT_ROOT
    / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean"
)
BASE_V37_PATH = Path(v37.__file__).resolve()
BASE_V36_PATH = Path(v36.__file__).resolve()
BASE_V35_PATH = Path(v35.__file__).resolve()
BASE_V12_PATH = Path(v12.__file__).resolve()
BASE_V8_PATH = Path(v8.__file__).resolve()
TEST_PATH = SCRIPT_PATH.with_name("test_v38_pinned_seed_center_multiplicity_canary.py")

CANONICAL_CASE = v35.Case("fresh", "DDD", 0, 2, 1)
MAX_DIAGNOSTIC_TIMEOUT_MS = 60_000

PINNED_CENTER_FAMILY = "endpoint_seed_pinned_physical_center"
PINNED_SHELL_CAP_FAMILY = "endpoint_seed_pinned_physical_shell_seed_cap_three"
PINNED_CENTER_COUNT = len(v8.POINTS)
PINNED_CENTER_CONSTRAINT_COUNT = 1 + len(v8.POINTS)
PINNED_SHELL_CAP_CONSTRAINT_COUNT = len(v8.POINTS) * (len(v8.POINTS) - 1)

LEAN_THEOREMS = (
    (
        "endpointFresh_exists_seedCenter_all_selectedRows_escape_"
        "twoShellSeed_of_sharedBlocker"
    ),
    (
        "endpointFresh_exists_seedCenter_selectedClass_seed_card_le_three_"
        "of_sharedBlocker"
    ),
    (
        "endpointFresh_exists_seedCenter_ne_firstApex_ne_sharedBlocker_"
        "selectedClass_seed_card_le_three"
    ),
)


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def source_provenance() -> dict[str, object]:
    paths = {
        "v38_script": SCRIPT_PATH,
        "v38_schema": SCHEMA_PATH,
        "v38_test": TEST_PATH,
        "v37_base": BASE_V37_PATH,
        "v36_base": BASE_V36_PATH,
        "v35_base": BASE_V35_PATH,
        "v12_boolean_relaxation": BASE_V12_PATH,
        "v8_encoding": BASE_V8_PATH,
        "lean_source": LEAN_SOURCE_PATH,
    }
    return {
        "schema_version": SCHEMA_VERSION,
        "files": {
            name: {
                "path": path.resolve().relative_to(v8.PROJECT_ROOT.resolve()).as_posix(),
                "sha256": file_sha256(path),
            }
            for name, path in paths.items()
        },
        "lean_theorems": list(LEAN_THEOREMS),
        "new_family_counts": {
            PINNED_CENTER_FAMILY: PINNED_CENTER_CONSTRAINT_COUNT,
            PINNED_SHELL_CAP_FAMILY: PINNED_SHELL_CAP_CONSTRAINT_COUNT,
        },
        "semantic_boolean_delta": PINNED_CENTER_COUNT,
        "scope": (
            "exact worktree snapshot of direct v38 sources and dependencies; "
            "not a git-HEAD-authenticated production manifest"
        ),
    }


def verify_source_provenance(frozen: dict[str, object]) -> dict[str, object]:
    current = source_provenance()
    if frozen != current:
        raise RuntimeError("v38 worktree source provenance changed")
    return frozen


class Encoding(v37.Encoding):
    """The v37 diagnostic stack plus the exact pinned physical-shell cap."""

    def _build_normal_form(self) -> None:
        super()._build_normal_form()
        self.endpoint_seed_center = {
            center: z3.Bool(f"endpoint_seed_center_{center}")
            for center in v8.POINTS
        }
        self.endpoint_seed_shell_caps: dict[tuple[int, int], z3.BoolRef] = {}

        pins = list(self.endpoint_seed_center.values())
        self.add(PINNED_CENTER_FAMILY, v8.exactly(pins, 1))
        for center, pinned in self.endpoint_seed_center.items():
            self.add(
                PINNED_CENTER_FAMILY,
                z3.Implies(pinned, self.endpoint_seed[center]),
            )
            for representative in v8.POINTS:
                if representative == center:
                    continue
                shell_seed_members = [
                    z3.And(
                        self.endpoint_seed[point],
                        self.d(center, point)
                        == self.d(center, representative),
                    )
                    for point in v8.POINTS
                    if point != center
                ]
                cap = z3.Implies(
                    pinned,
                    v8.at_most(shell_seed_members, 3),
                )
                self.endpoint_seed_shell_caps[center, representative] = cap
                self.add(PINNED_SHELL_CAP_FAMILY, cap)


def tracker_names(solver: z3.Solver) -> frozenset[str]:
    names: set[str] = set()
    pending = list(solver.assertions())
    seen: set[int] = set()
    while pending:
        node = pending.pop()
        node_id = node.get_id()
        if node_id in seen:
            continue
        seen.add(node_id)
        if (
            z3.is_const(node)
            and node.sort().kind() == z3.Z3_BOOL_SORT
            and str(node).startswith("track_")
        ):
            names.add(str(node))
        pending.extend(node.children())
    return frozenset(names)


def expected_tracker_names(encoding: Encoding) -> frozenset[str]:
    return frozenset(f"track_{family}" for family in encoding.groups)


def probe_canonical_case(timeout_ms: int) -> dict[str, object]:
    if not 1 <= timeout_ms <= MAX_DIAGNOSTIC_TIMEOUT_MS:
        raise ValueError(
            f"timeout must be between 1 and {MAX_DIAGNOSTIC_TIMEOUT_MS} ms"
        )
    started = time.monotonic()
    frozen_provenance = source_provenance()
    encoding = Encoding(
        CANONICAL_CASE,
        timeout_ms=timeout_ms,
        seed=1,
        pairwise=True,
        force_producer=True,
    )
    boolean_solver, boolean_audit = v12.build_boolean_relaxation(
        encoding, timeout_ms, seed=1
    )
    del boolean_solver
    solver, smt2 = encoding.make_solver()
    actual_trackers = tracker_names(solver)
    expected_trackers = expected_tracker_names(encoding)
    if actual_trackers != expected_trackers:
        raise RuntimeError("v38 full-formula tracker set is not exact")

    outcome = solver.check()
    result = {
        "schema_version": SCHEMA_VERSION,
        "case_id": CANONICAL_CASE.case_id,
        "timeout_ms": timeout_ms,
        "status": str(outcome),
        "reason_unknown": solver.reason_unknown() if outcome == z3.unknown else None,
        "elapsed_seconds": time.monotonic() - started,
        "epistemic_status": (
            "diagnostic only; v37 includes a forced hypothetical producer, so "
            "UNSAT would be conditional and SAT/UNKNOWN would not close P97"
        ),
        "formula_sha256": hashlib.sha256(smt2.encode()).hexdigest(),
        "formula_assertion_count": sum(
            len(items) for items in encoding.groups.values()
        ),
        "new_family_counts": {
            family: len(encoding.groups[family])
            for family in (PINNED_CENTER_FAMILY, PINNED_SHELL_CAP_FAMILY)
        },
        "tracker_count": len(actual_trackers),
        "tracker_set_exact": True,
        "boolean_relaxation": {
            "included_total": boolean_audit.included_total,
            "excluded_total": boolean_audit.excluded_total,
            "pinned_center_included": boolean_audit.included_by_family.get(
                PINNED_CENTER_FAMILY, 0
            ),
            "physical_shell_cap_included": boolean_audit.included_by_family.get(
                PINNED_SHELL_CAP_FAMILY, 0
            ),
            "physical_shell_cap_excluded": boolean_audit.excluded_by_family.get(
                PINNED_SHELL_CAP_FAMILY, 0
            ),
        },
        "source_provenance": frozen_provenance,
        "source_provenance_sha256": canonical_sha256(frozen_provenance),
    }
    verify_source_provenance(frozen_provenance)
    return result


def parser() -> argparse.ArgumentParser:
    result = argparse.ArgumentParser(
        description="Run only the canonical bounded v38 full-metric diagnostic"
    )
    result.add_argument("--timeout-ms", type=int, default=20_000)
    return result


def main() -> int:
    args = parser().parse_args()
    print(json.dumps(probe_canonical_case(args.timeout_ms), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
