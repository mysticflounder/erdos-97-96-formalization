#!/usr/bin/env python3
"""Static no-four-arc overlay for the corrected exact-four finite outer.

The CEGAR driver discovers one selected-row assignment at a time and then
blocks checked four-arc curvature terminals.  At ``n = 11`` there are only
154 possible centered outer-arc types.  This script names the exact selected
four-support at every center, derives its left and right outer-arc types, and
forbids every four-tuple with pairwise-disjoint turn supports in one static
CNF.  Four disjoint nonempty cyclic intervals either leave a strict gap or
partition the whole period, so they feed respectively the checked strict-
window or full-cover ShellCurvature terminal.

This remains a finite source projection.  SAT is a replayed projection
counterpattern, not a Euclidean realization.  UNSAT is solver evidence until
its emitted proof is independently checked and imported into Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import subprocess
import sys
from collections import defaultdict
from pathlib import Path
from typing import Any, Iterable


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
OUTER_PATH = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "exact_four_outer.py"
)
PLANAR_BANK = HERE.parent / "whole-carrier-planar-rank-cegar" / "planar_schema_bank.json"
KALMANSON_BANK = (
    HERE.parent / "unique4-curvature-occurrence-census" /
    "kalmanson_schema_bank.kernel_only.json"
)
U5_BANK = (
    HERE.parent / "unique-arm-whole-carrier-source-audit" / "u5_signed_schema_bank.json"
)


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


OUTER = load_module("unique4_curvature_direct_outer", OUTER_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def support_name(center: int, support: tuple[int, ...]) -> str:
    return f"row_support_{center}_{'_'.join(map(str, support))}"


def arc_name(center: int, side: str, mask: int) -> str:
    return f"outer_arc_{center}_{side}_{mask:x}"


def arc_types_for_support(
    n: int, center: int, support: tuple[int, ...],
) -> tuple[tuple[int, str, int], tuple[int, str, int]]:
    offsets = sorted((center - point) % n for point in support)
    if len(offsets) != 4 or offsets[0] == 0:
        raise AssertionError((center, support, offsets))
    global_start = (-center) % n
    left_turns = tuple(
        (global_start + offset) % n for offset in range(offsets[1] - 1)
    )
    right_turns = tuple(
        (global_start + offset) % n for offset in range(offsets[2], n - 1)
    )
    if not left_turns or not right_turns:
        raise AssertionError((center, support, offsets, left_turns, right_turns))
    left_mask = sum(1 << turn for turn in left_turns)
    right_mask = sum(1 << turn for turn in right_turns)
    return (center, "left", left_mask), (center, "right", right_mask)


def pairwise_disjoint_masks(arcs: Iterable[tuple[int, str, int]]) -> bool:
    used = 0
    for _center, _side, mask in arcs:
        if used & mask:
            return False
        used |= mask
    return True


def add_direct_curvature_overlay(cnf: Any, n: int) -> dict[str, int]:
    patterns_by_arc: dict[tuple[int, str, int], list[int]] = defaultdict(list)
    pattern_count = 0

    for center in range(n):
        points = tuple(point for point in range(n) if point != center)
        for support in itertools.combinations(points, 4):
            pattern = cnf.var(support_name(center, support))
            pattern_count += 1
            memberships = tuple(cnf.ids[f"m_{center}_{point}"] for point in support)

            # The outer already enforces exactly four memberships at each
            # center.  These two directions therefore identify `pattern`
            # exactly with the displayed support.
            for membership in memberships:
                cnf.add("direct_row_pattern_implies_membership", [-pattern, membership])
            cnf.add(
                "direct_memberships_imply_row_pattern",
                [-membership for membership in memberships] + [pattern],
            )

            for arc in arc_types_for_support(n, center, support):
                arc_var = cnf.var(arc_name(*arc))
                cnf.add("direct_row_pattern_implies_outer_arc", [-pattern, arc_var])
                patterns_by_arc[arc].append(pattern)

    for arc, patterns in sorted(patterns_by_arc.items()):
        cnf.add(
            "direct_outer_arc_implies_some_row_pattern",
            [-cnf.ids[arc_name(*arc)], *patterns],
        )

    arcs = sorted(patterns_by_arc)
    packing_count = 0
    for packing in itertools.combinations(arcs, 4):
        if not pairwise_disjoint_masks(packing):
            continue
        cnf.add(
            "direct_no_four_turn_disjoint_outer_arcs",
            [-cnf.ids[arc_name(*arc)] for arc in packing],
        )
        packing_count += 1

    return {
        "row_pattern_count": pattern_count,
        "outer_arc_type_count": len(arcs),
        "turn_disjoint_four_arc_packing_count": packing_count,
    }


def selected_arc_types(decoded: dict[str, Any], n: int) -> list[tuple[int, str, int]]:
    answer: list[tuple[int, str, int]] = []
    for center_text, support_data in decoded["rows"].items():
        center = int(center_text)
        support = tuple(sorted(map(int, support_data)))
        answer.extend(arc_types_for_support(n, center, support))
    return answer


def assert_sat_projection_has_no_terminal(decoded: dict[str, Any], n: int) -> None:
    arcs = selected_arc_types(decoded, n)
    for packing in itertools.combinations(arcs, 4):
        if pairwise_disjoint_masks(packing):
            raise AssertionError(f"SAT assignment contains forbidden packing: {packing}")


def parse_solver_assignment(output: str) -> set[int]:
    return OUTER.parse_assignment(output)


def solve(
    cnf_path: Path, timeout: int, cadical: str, proof_path: Path | None,
) -> tuple[str, str]:
    command = [cadical, "-t", str(timeout), str(cnf_path)]
    if proof_path is not None:
        proof_path.parent.mkdir(parents=True, exist_ok=True)
        command.append(str(proof_path))
    completed = subprocess.run(
        command,
        capture_output=True,
        text=True,
        check=False,
        timeout=timeout + 30,
    )
    output = completed.stdout + completed.stderr
    if completed.returncode == 10:
        return "SAT", output
    if completed.returncode == 20:
        return "UNSAT", output
    return "UNKNOWN", output


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--opp1-card", required=True, type=int, choices=(4, 5))
    parser.add_argument("--cnf", required=True, type=Path)
    parser.add_argument("--result", required=True, type=Path)
    parser.add_argument("--solver-log", type=Path)
    parser.add_argument("--proof", type=Path)
    parser.add_argument("--timeout-seconds", type=int, default=1800)
    parser.add_argument("--cadical", default="cadical")
    parser.add_argument("--encode-only", action="store_true")
    args = parser.parse_args()

    n = 11
    cnf, metadata = OUTER.encode(
        n,
        args.opp1_card,
        PLANAR_BANK,
        KALMANSON_BANK,
        U5_BANK,
        strict_cap_minimality_overlay=True,
        pair_minimality_overlay=False,
        exact_two_strict_hit_overlay=True,
    )
    overlay = add_direct_curvature_overlay(cnf, n)
    metadata = {
        **metadata,
        "direct_overlay_schema": "p97-unique4-direct-curvature-overlay-v1",
        "direct_overlay_source": str(Path(__file__).relative_to(ROOT)),
        "direct_overlay_source_sha256": sha256(Path(__file__)),
        "direct_overlay_claim_scope": (
            "fixed n=11 source projection only; not a Euclidean realization "
            "or arbitrary-cardinality theorem"
        ),
        **overlay,
        "final_variable_count": len(cnf.names) - 1,
        "final_clause_count": len(cnf.clauses),
    }
    cnf.write_dimacs(args.cnf, metadata)

    result: dict[str, Any] = {
        **metadata,
        "cnf": str(args.cnf),
        "cnf_sha256": sha256(args.cnf),
    }
    if args.encode_only:
        result["solver_status"] = "NOT_RUN"
    else:
        status, log = solve(
            args.cnf, args.timeout_seconds, args.cadical, args.proof
        )
        result["solver_status"] = status
        if args.solver_log is not None:
            args.solver_log.parent.mkdir(parents=True, exist_ok=True)
            args.solver_log.write_text(log, encoding="utf-8")
            result["solver_log"] = str(args.solver_log)
            result["solver_log_sha256"] = sha256(args.solver_log)
        if status == "SAT":
            assignment = parse_solver_assignment(log)
            decoded = OUTER.decode_sat(cnf, assignment, metadata)
            assert_sat_projection_has_no_terminal(decoded, n)
            result["semantic_replay_status"] = "VERIFIED_SAT_NO_FOUR_ARC_TERMINAL"
            result["decoded"] = decoded
        elif status == "UNSAT" and args.proof is not None and args.proof.exists():
            result["proof"] = str(args.proof)
            result["proof_sha256"] = sha256(args.proof)
            result["epistemic_status"] = "UNSAT_SOLVER_EVIDENCE_UNCHECKED_PROOF"
        elif status == "UNKNOWN":
            result["epistemic_status"] = "UNRESOLVED_UNDER_TIMEOUT"

    args.result.parent.mkdir(parents=True, exist_ok=True)
    args.result.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        key: result[key]
        for key in (
            "opp1_card", "solver_status", "epistemic_status",
            "final_variable_count", "final_clause_count",
            "row_pattern_count", "outer_arc_type_count",
            "turn_disjoint_four_arc_packing_count",
        ) if key in result
    }, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
