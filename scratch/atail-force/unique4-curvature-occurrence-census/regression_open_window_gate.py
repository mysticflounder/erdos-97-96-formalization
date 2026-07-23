#!/usr/bin/env python3
"""Semantic regression for the strict common-open-window curvature gate."""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
import tempfile
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
DRIVER = HERE / "run_curvature_cegar.py"


def load_driver() -> Any:
    spec = importlib.util.spec_from_file_location("curvature_cegar_regression", DRIVER)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {DRIVER}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def arc(center: int, side: str, start: int, finish: int, n: int) -> dict[str, Any]:
    return {
        "center": center,
        "side": side,
        "start": start,
        "finish": finish,
        "turn_indices": [index % n for index in range(start, finish - 1)],
    }


def build() -> dict[str, Any]:
    driver = load_driver()
    n = 11
    # The skeptic's c1L/c3R/c4L/c4R batch at centers {1,3,4}.  The four
    # pairwise-disjoint cyclic masks tile all eleven turns.  It must classify
    # as the checked FULL_COVER terminal, never STRICT_OPEN_WINDOW.
    full_cover = [
        arc(1, "left", 0, 4, n),       # turns 0,1,2
        arc(3, "right", 3, 7, n),      # turns 3,4,5
        arc(4, "left", 6, 10, n),      # turns 6,7,8
        arc(4, "right", 9, 12, n),     # turns 9,10
    ]
    # Removing the final used turn leaves a genuine strict open-window lift.
    one_turn_gap = [
        *full_cover[:3],
        arc(4, "right", 9, 11, n),     # turn 9; turn 10 stays unused
    ]
    full_cover_union = sorted({
        turn for item in full_cover for turn in item["turn_indices"]
    })
    gap_union = sorted({
        turn for item in one_turn_gap for turn in item["turn_indices"]
    })
    full_cover_witnesses = driver.lifted_four_arc_terminal_witnesses(full_cover, n)
    gap_witnesses = driver.lifted_four_arc_terminal_witnesses(one_turn_gap, n)
    full_cover_kinds = sorted({
        witness[0]["terminal_kind"] for witness in full_cover_witnesses
    })
    gap_kinds = sorted({witness[0]["terminal_kind"] for witness in gap_witnesses})
    uncertified_core = driver.curvature_refinement_decision(
        {"solver_status": "UNSAT"}, []
    )
    try:
        driver.curvature_refinement_decision(
            {"solver_status": "SAT"}, full_cover_witnesses
        )
    except AssertionError:
        sat_with_terminal_rejected = True
    else:
        sat_with_terminal_rejected = False
    with tempfile.TemporaryDirectory() as temporary:
        run_dir = Path(temporary) / "fresh-run"
        driver.prepare_fresh_output_dir(run_dir)
        (run_dir / "occupied").write_text("occupied\n", encoding="utf-8")
        try:
            driver.prepare_fresh_output_dir(run_dir)
        except FileExistsError:
            nonempty_run_dir_rejected = True
        else:
            nonempty_run_dir_rejected = False
        checkpoint_path = Path(temporary) / "final.cnf"

        class FakeCnf:
            clauses = [[1], [-1, 2], [-2]]
            block_counts = {"checked_curvature_terminal_orbit_cut": 7}

            @staticmethod
            def write_dimacs(path: Path, metadata: dict[str, Any]) -> None:
                path.write_text(
                    "p cnf 2 3\n1 0\n-1 2 0\n-2 0\n", encoding="utf-8"
                )

        checkpoint_metadata: dict[str, Any] = {}
        final_checkpoint = driver.finalize_cnf_checkpoint(
            FakeCnf(), checkpoint_metadata, checkpoint_path, rewrite=True
        )
    bindings = driver.source_hash_bindings(driver.KERNEL_KALMANSON_BANK)
    source_hash_bindings_replayed = all(
        driver.sha256(driver.ROOT / record["path"]) == record["sha256"]
        for record in bindings.values()
    )
    return {
        "schema": "p97-curvature-open-window-gate-regression-v1",
        "epistemic_status": "DETERMINISTIC_SEMANTIC_GATE_REPLAY",
        "n": n,
        "center_set": [1, 3, 4],
        "full_cover_arcs": full_cover,
        "full_cover_turn_union": full_cover_union,
        "full_cover_is_pairwise_disjoint": sum(
            len(item["turn_indices"]) for item in full_cover
        ) == len(full_cover_union),
        "full_cover_uses_every_turn": full_cover_union == list(range(n)),
        "full_cover_checked_terminal_witness_count": len(full_cover_witnesses),
        "full_cover_terminal_kinds": full_cover_kinds,
        "full_cover_classified_only_as_full_cover": (
            bool(full_cover_witnesses) and full_cover_kinds == ["FULL_COVER"]
        ),
        "one_turn_gap_arcs": one_turn_gap,
        "one_turn_gap_turn_union": gap_union,
        "one_turn_gap_checked_terminal_witness_count": len(gap_witnesses),
        "one_turn_gap_terminal_kinds": gap_kinds,
        "one_turn_gap_classified_only_as_strict": (
            bool(gap_witnesses) and gap_kinds == ["STRICT_OPEN_WINDOW"]
        ),
        "first_full_cover_witness": (
            full_cover_witnesses[0] if full_cover_witnesses else None
        ),
        "first_one_turn_gap_witness": gap_witnesses[0] if gap_witnesses else None,
        "uncertified_core_decision": uncertified_core,
        "uncertified_core_fails_closed_without_cut": uncertified_core == {
            "status": "UNPROVED_CURVATURE_CORE_NO_CHECKED_TERMINAL",
            "install_cut": False,
        },
        "curvature_sat_with_terminal_rejected": sat_with_terminal_rejected,
        "nonempty_run_directory_rejected": nonempty_run_dir_rejected,
        "round_cap_final_cnf_checkpoint": final_checkpoint,
        "round_cap_final_cnf_counts_replayed": (
            final_checkpoint["clause_count"] == 3
            and final_checkpoint["checked_curvature_terminal_orbit_cut_count"] == 7
            and final_checkpoint["all_final_cnf_counts_replayed"]
        ),
        "source_hash_bindings": bindings,
        "all_source_hash_bindings_replayed": source_hash_bindings_replayed,
    }


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    result = build()
    if (
        not result["full_cover_classified_only_as_full_cover"]
        or not result["one_turn_gap_classified_only_as_strict"]
        or not result["uncertified_core_fails_closed_without_cut"]
        or not result["curvature_sat_with_terminal_rejected"]
        or not result["nonempty_run_directory_rejected"]
        or not result["round_cap_final_cnf_counts_replayed"]
        or not result["all_source_hash_bindings_replayed"]
    ):
        raise AssertionError("four-arc terminal-classification regression failed")
    if args.check:
        expected = json.loads(args.output.read_text(encoding="utf-8"))
        if result != expected:
            raise AssertionError("open-window gate regression drifted")
        print("PASS: four-arc terminal-classification regression matches checkpoint")
    else:
        args.output.write_text(
            json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8"
        )
        print(json.dumps({
            "full_cover_only": result["full_cover_classified_only_as_full_cover"],
            "one_turn_gap_strict_only": result[
                "one_turn_gap_classified_only_as_strict"
            ],
            "uncertified_core_fails_closed": result[
                "uncertified_core_fails_closed_without_cut"
            ],
            "nonempty_run_dir_rejected": result[
                "nonempty_run_directory_rejected"
            ],
            "round_cap_final_cnf_counts_replayed": result[
                "round_cap_final_cnf_counts_replayed"
            ],
            "all_source_hash_bindings_replayed": result[
                "all_source_hash_bindings_replayed"
            ],
        }, sort_keys=True))


if __name__ == "__main__":
    main()
