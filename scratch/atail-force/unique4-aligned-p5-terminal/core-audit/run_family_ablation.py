#!/usr/bin/env python3
"""Bounded clause-family ablation for the aligned-p5 Boolean projection.

This is theorem-discovery tooling.  It rebuilds the exact aligned-p5 formula,
records the source block attached to every clause, and solves a fixed list of
one-family and coarse-family deletions.  A SAT ablation proves only that the
removed CNF block is load-bearing relative to the remaining encoded blocks.
An UNSAT ablation is exact only for the resulting CNF, not a Lean theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
import time
from pathlib import Path
from typing import Any, Callable


HERE = Path(__file__).resolve().parent
LANE = HERE.parent
DRIVER_PATH = LANE / "run_aligned_p5_full_linear_cegar.py"


def load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


DRIVER = load_module("aligned_p5_family_ablation_driver", DRIVER_PATH)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def filtered_kalmanson_bank(mode: str, output_dir: Path) -> tuple[Path, bool]:
    if mode == "all":
        return DRIVER.BASE.DIRECT.KALMANSON_BANK, False
    kind, index_text = mode.split("-", 1)
    indices = {int(part) for part in index_text.split(",")}
    payload = json.loads(
        DRIVER.BASE.DIRECT.KALMANSON_BANK.read_text(encoding="utf-8")
    )
    schemas = payload["schemas"]
    if any(not 0 <= index < len(schemas) for index in indices):
        raise ValueError(f"Kalmanson schema index out of range: {indices}")
    if kind in {"only", "keep"}:
        payload["schemas"] = [
            schema for schema_index, schema in enumerate(schemas)
            if schema_index in indices
        ]
    elif kind == "drop":
        payload["schemas"] = [
            schema for schema_index, schema in enumerate(schemas)
            if schema_index not in indices
        ]
    else:
        raise ValueError(f"unknown Kalmanson mode: {mode}")
    payload["schema_count"] = len(payload["schemas"])
    path = output_dir / f"kalmanson-bank-{mode}.json"
    path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n")
    return path, True


def build_formula(
    kalmanson_bank: Path,
) -> tuple[Any, dict[str, Any], list[str]]:
    cnf_class = DRIVER.BASE.DIRECT.OUTER.CNF
    original_add = cnf_class.add

    def tagged_add(self: Any, block: str, literals: Any) -> None:
        before = len(self.clauses)
        original_add(self, block, literals)
        if len(self.clauses) != before:
            if not hasattr(self, "clause_blocks"):
                self.clause_blocks = []
            self.clause_blocks.append(block)

    cnf_class.add = tagged_add
    try:
        cnf, metadata = DRIVER.BASE.DIRECT.OUTER.encode(
            11,
            5,
            DRIVER.BASE.DIRECT.PLANAR_BANK,
            kalmanson_bank,
            DRIVER.BASE.DIRECT.U5_BANK,
            strict_cap_minimality_overlay=True,
            pair_minimality_overlay=True,
            exact_two_strict_hit_overlay=False,
        )
        aligned = DRIVER.add_aligned_p5_source_surface(cnf, metadata)
        own_cap = DRIVER.BASE.OWN_CAP.add_own_cap_bounds(cnf, metadata)
        curvature = DRIVER.BASE.DIRECT.add_direct_curvature_overlay(cnf, 11)
        records, seed_bank = DRIVER.SEEDED.load_seed_bank(
            DRIVER.DEFAULT_SEED_BANK.resolve()
        )
        seeded = DRIVER.SEEDED.add_seed_cuts(cnf, 11, records)
    finally:
        cnf_class.add = original_add

    blocks = list(cnf.clause_blocks)
    if len(blocks) != len(cnf.clauses):
        raise AssertionError((len(blocks), len(cnf.clauses)))
    return cnf, {
        **metadata,
        **aligned,
        **own_cap,
        **curvature,
        "seed_bank": seed_bank,
        "seeded_cuts": seeded,
    }, blocks


def omit_predicate(name: str) -> Callable[[str], bool]:
    if name == "none":
        return lambda _block: False
    exact = {
        "aligned_class": {"aligned_p5_all_three_strict_in_class"},
        "aligned_pair": {"aligned_p5_frontier_pair_eq_strict_pair"},
        "seeded_kalmanson": {"seeded_full_linear_kalmanson_cut"},
        "bank_kalmanson": {"verified_kalmanson_order_schema_cut"},
        "bank_planar": {"verified_planar_schema_cut"},
        "bank_u5": {"verified_u5_signed_schema_cut"},
    }
    prefixes = {
        "own_cap": ("selected_row_own_cap_", "selected_row_endpoint_own_cap_"),
        "curvature": ("direct_",),
        "pair_minimality": ("pair_minimality_",),
        "single_minimality": ("minimality_",),
        "both_minimality": ("minimality_", "pair_minimality_"),
        "critical_system": (
            "blocker_",
            "critical_",
            "same_blocker_",
            "class_source_critical_",
            "first_apex_fiber_",
        ),
        "global_rows": (
            "row_",
            "selected_row_",
            "strong_connectivity_",
            "selected_row_subset_",
        ),
        "local_metric": (
            "radius_partition_",
            "mutual_triangle_",
            "full_class_",
            "full_pair_",
            "blocker_image_mutual_",
            "full_partition_bisector_",
        ),
    }
    if name in exact:
        wanted = exact[name]
        return lambda block: block in wanted
    if name in prefixes:
        wanted = prefixes[name]
        return lambda block: block.startswith(wanted)
    if name == "all_banks":
        return lambda block: block.startswith("verified_") or block == (
            "seeded_full_linear_kalmanson_cut"
        )
    if "+" in name:
        predicates = tuple(omit_predicate(part) for part in name.split("+"))
        return lambda block: any(predicate(block) for predicate in predicates)
    raise ValueError(f"unknown family: {name}")


def write_dimacs(
    path: Path,
    cnf: Any,
    blocks: list[str],
    omit: Callable[[str], bool],
    metadata: dict[str, Any],
) -> tuple[int, dict[str, int]]:
    kept: list[tuple[int, ...]] = []
    omitted: dict[str, int] = {}
    for clause, block in zip(cnf.clauses, blocks, strict=True):
        if omit(block):
            omitted[block] = omitted.get(block, 0) + 1
        else:
            kept.append(clause)
    with path.open("w", encoding="ascii") as handle:
        handle.write("c aligned-p5 bounded family ablation\n")
        handle.write(f"c metadata {json.dumps(metadata, sort_keys=True)}\n")
        handle.write(f"p cnf {len(cnf.names) - 1} {len(kept)}\n")
        for clause in kept:
            handle.write(" ".join(map(str, clause)))
            handle.write(" 0\n")
    return len(kept), omitted


def solve(cnf_path: Path, timeout: int) -> tuple[str, int, str]:
    started = time.monotonic()
    completed = subprocess.run(
        ["cadical", "-t", str(timeout), str(cnf_path)],
        text=True,
        capture_output=True,
        check=False,
        timeout=timeout + 30,
    )
    elapsed = time.monotonic() - started
    status = {10: "SAT", 20: "UNSAT"}.get(completed.returncode, "UNKNOWN")
    return status, completed.returncode, f"{elapsed:.6f}"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--family", required=True)
    parser.add_argument("--output-dir", type=Path, default=HERE / "runs")
    parser.add_argument("--timeout-seconds", type=int, default=180)
    parser.add_argument(
        "--cnf-path",
        type=Path,
        help="optional exact output path (normally used with --retain-cnf)",
    )
    parser.add_argument(
        "--kalmanson-mode",
        default="all",
        help="all, only-N, keep-N,M, or drop-N,M for zero-based schema indices",
    )
    parser.add_argument("--retain-cnf", action="store_true")
    args = parser.parse_args()

    args.output_dir.mkdir(parents=True, exist_ok=True)
    kalmanson_bank, delete_bank = filtered_kalmanson_bank(
        args.kalmanson_mode, args.output_dir
    )
    try:
        cnf, metadata, blocks = build_formula(kalmanson_bank)
    finally:
        if delete_bank:
            kalmanson_bank.unlink()
    suffix = (
        args.family
        if args.kalmanson_mode == "all"
        else f"{args.family}-{args.kalmanson_mode}"
    )
    cnf_path = args.cnf_path or args.output_dir / f"omit-{suffix}.cnf"
    cnf_path.parent.mkdir(parents=True, exist_ok=True)
    result_path = args.output_dir / f"omit-{suffix}.json"
    kept_count, omitted = write_dimacs(
        cnf_path,
        cnf,
        blocks,
        omit_predicate(args.family),
        {
            "family": args.family,
            "baseline_clause_count": len(cnf.clauses),
            "baseline_variable_count": len(cnf.names) - 1,
        },
    )
    status, exit_code, elapsed = solve(cnf_path, args.timeout_seconds)
    cnf_sha = sha256(cnf_path)
    if not args.retain_cnf:
        cnf_path.unlink()
    result = {
        "schema": "p97-aligned-p5-clause-family-ablation-v1",
        "epistemic_status": "EXACT WITHIN THE ABLATED CNF PROJECTION",
        "family": args.family,
        "kalmanson_mode": args.kalmanson_mode,
        "solver_status": status,
        "solver_exit_code": exit_code,
        "solver_elapsed_seconds": float(elapsed),
        "timeout_seconds": args.timeout_seconds,
        "variable_count": len(cnf.names) - 1,
        "baseline_clause_count": len(cnf.clauses),
        "kept_clause_count": kept_count,
        "omitted_clause_count": len(cnf.clauses) - kept_count,
        "omitted_blocks": omitted,
        "cnf_sha256": cnf_sha,
        "cnf_retained": args.retain_cnf,
        "cnf_path": str(cnf_path) if args.retain_cnf else None,
        "source_driver": str(DRIVER_PATH),
        "source_driver_sha256": sha256(DRIVER_PATH),
        "claim_limit": (
            "A SAT/UNSAT result concerns only this generated CNF. "
            "It is neither a Lean proof nor a source-to-CNF correspondence proof."
        ),
    }
    result_path.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps(result, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
