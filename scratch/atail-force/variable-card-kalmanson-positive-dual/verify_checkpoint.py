#!/usr/bin/env python3
"""Fail-closed replay of the variable-card positive-dual checkpoint."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
ORBITS = (
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
)
OUTER_SHA = "2af4ebe69459f371f25100a80de1a092e81cae75bd62ad87175c1d4c19a5f27b"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path):
    return json.loads(path.read_text(encoding="utf-8"))


def verify_integrated() -> None:
    expected_counts = {
        "guarded_exact_five_shell_equality": 78,
        "guarded_selected_row_equality": 1092,
        "strict_kalmanson": 2002,
    }
    for orbit in ORBITS:
        full = load(HERE / f"integrated_{orbit}.json")
        assert full["status"] == "UNKNOWN"
        assert full["reason"] == "timeout"
        assert full["outer_source_sha256"] == OUTER_SHA
        assert full["literal_metric_schema_cuts"] == 0
        assert full["metric_counts"] == {
            **expected_counts,
            "positivity": 91,
            "strict_triangle": 1092,
        }

        konly = load(HERE / f"konly_{orbit}.json")
        assert konly["status"] == "UNKNOWN"
        assert konly["reason"] == "timeout"
        assert konly["outer_source_sha256"] == OUTER_SHA
        assert konly["literal_metric_schema_cuts"] == 0
        assert konly["metric_surface"] == "STRICT_KALMANSON_ONLY"
        assert konly["metric_counts"] == {
            **expected_counts,
            "positivity": 0,
            "strict_triangle": 0,
        }


def verify_ordinal() -> None:
    ordinal_source = HERE / "integrated_ordinal_cycle_decision.py"
    exporter_source = HERE / "bitblast_ordinal_cnf.py"
    assert sha256(exporter_source) == "b8375e0b3016d5a73211acf40d3226b23e227e2a6efb7e98e38b621b83031fd1"
    expected_counts = {
        "guarded_exact_five_shell_rank_equalities": 78,
        "guarded_selected_row_rank_equalities": 1092,
        "kalmanson_cancellation_implications": 8008,
        "rank_atoms": 91,
        "rank_bit_width": 7,
    }
    expected_cnf_sizes = {
        "continuationOrder": (57561, 310686),
        "reverseContinuationOrder": (57653, 311330),
        "sharesFirstAtSource": (58048, 313821),
        "sharesFirstAtTarget": (58048, 313821),
        "sharesSecondAtSource": (58142, 314475),
        "sharesSecondAtTarget": (58048, 313821),
        "fourDistinct": (58257, 315043),
    }
    for orbit in ORBITS:
        arithmetic_rank = load(HERE / f"ordinal_{orbit}.json")
        assert arithmetic_rank["status"] == "UNKNOWN"
        assert arithmetic_rank["reason"] == "timeout"
        assert arithmetic_rank["outer_source_sha256"] == OUTER_SHA
        assert arithmetic_rank["literal_metric_schema_cuts"] == 0
        assert arithmetic_rank["ordinal_counts"] == {
            key: value for key, value in expected_counts.items()
            if key != "rank_bit_width"
        }

        qffd = load(HERE / f"ordinal_qffd_{orbit}.json")
        assert qffd["status"] == "UNKNOWN"
        assert qffd["reason"] == "timeout"
        assert qffd["outer_source_sha256"] == OUTER_SHA
        assert qffd["literal_metric_schema_cuts"] == 0
        assert qffd["ordinal_counts"] == expected_counts

        metadata = load(HERE / f"ordinal_cnf_{orbit}.metadata.json")
        result = load(HERE / f"ordinal_cadical_{orbit}.json")
        cnf = Path(metadata["cnf_path"])
        assert metadata["outer_source_sha256"] == OUTER_SHA
        assert metadata["ordinal_source_sha256"] == sha256(ordinal_source)
        assert metadata["literal_metric_schema_cuts"] == 0
        assert metadata["ordinal_counts"] == expected_counts
        assert (
            metadata["cnf_variable_count"], metadata["cnf_clause_count"]
        ) == expected_cnf_sizes[orbit]
        assert metadata["cnf_sha256"] == result["cnf_sha256"]
        # DIMACS files are intentionally kept in /private/tmp because the
        # seven generated CNFs are mechanical and large.  If present, replay
        # their bytes; the retained CaDiCaL log always replays their header.
        if cnf.exists():
            assert sha256(cnf) == metadata["cnf_sha256"]
        assert result["status"] == "UNKNOWN_WALL_BUDGET"
        assert result["cadical_returncode"] == 0
        assert result["replay"] is None
        log_path = Path(result["log_path"])
        assert sha256(log_path) == result["log_sha256"]
        log = log_path.read_text(encoding="utf-8")
        variable_count, clause_count = expected_cnf_sizes[orbit]
        assert f"found 'p cnf {variable_count} {clause_count}' header" in log
        assert "setting time limit to 180 seconds real time" in log
        solution_path = Path(result["solution_path"])
        if solution_path.exists():
            assert sha256(solution_path) == result["solution_sha256"]


def verify_schema_audit() -> None:
    audit = load(HERE / "quotient_cycle_audit.json")
    assert audit["epistemic_status"] == "EXACT_COMBINATORIAL_REPLAY_NOT_LEAN_COVERAGE_PROOF"
    assert len(audit["minimized_banks"]) == 1
    summary = {key: value for key, value in audit["minimized_banks"][0].items()
               if key != "analyses"}
    assert summary["schema_count"] == 263
    assert summary["cycle_count"] == 231
    assert len(summary["residual_schema_indices"]) == 32
    assert summary["cycle_length_histogram"] == {
        "1": 31, "2": 115, "3": 54, "4": 23,
        "5": 6, "6": 1, "8": 1, "none": 32,
    }

    bare = load(HERE / "bare_generic_n14.json")
    assert bare["status"] == "UNKNOWN_WALL_BUDGET"
    assert bare["epistemic_status"] == "BOUNDED_THEOREM_DISCOVERY"
    assert bare["literal_metric_schema_cuts"] == 0


def verify_external_milp_signal() -> None:
    lane = ROOT / "scratch/atail-force/exact6-integrated-milp"
    milp_path = lane / "continuationOrder.json"
    lp_path = lane / "continuationOrder.lp.json"
    encoder_path = ROOT / "scratch/atail-force/exact6-allcenter-coverage-certificate/encode.py"
    assert sha256(milp_path) == "cbd394ca9a4507ef8dd58fb0f8b630b65ca94792b1e007b2b17f8c000a2eb0da"
    assert sha256(lp_path) == "6491e0fb615bb85a520303b1b17095821c10565c79de4023da4dc05a6c5d1297"
    assert sha256(encoder_path) == "1d31c875afa50ea03d825d6ddc34ea41928438dddd5f0b50918c4b448ef599d5"
    milp = load(milp_path)
    lp = load(lp_path)
    assert milp["encoder_sha256"] == lp["encoder_sha256"] == sha256(encoder_path)
    assert milp["epistemic_status"] == "HIGHS_OPTIMAL_NONPOSITIVE_COMMON_SLACK_NO_EXACT_CERTIFICATE"
    assert milp["solver"]["scipy_success"] is True
    assert milp["solver"]["mip_node_count"] == 309
    assert milp["solver"]["mip_dual_bound"] == 0.0
    assert milp["incumbent"]["epsilon"] == 0.0
    assert lp["epistemic_status"] == "HIGHS_LP_RELAXATION_POSITIVE_SLACK"
    assert lp["lp_incumbent"]["epsilon"] == 0.0006279434850863421


def main() -> int:
    verify_integrated()
    verify_ordinal()
    verify_schema_audit()
    verify_external_milp_signal()
    print("variable-card positive-dual checkpoint: PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
