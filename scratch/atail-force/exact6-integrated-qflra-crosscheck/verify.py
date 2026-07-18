#!/usr/bin/env python3
"""Replay static provenance and timeout classification for the cross-check."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
ARTIFACTS = HERE / "artifacts"
ORBITS = {
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> int:
    smoke = load(ARTIFACTS / "smoke.result.json")
    assert smoke["status"] == "PASSED"
    assert smoke["cases"]["sat_one_center"]["status"] == "SAT"
    assert smoke["cases"]["unsat_two_centers"]["status"] == "UNSAT"
    for name, record in smoke["cases"].items():
        smt2 = ARTIFACTS / f"smoke_{name}.smt2"
        assert record["smt2_sha256"] == sha256(smt2)

    seen: dict[str, set[str]] = {"full": set(), "kalmanson-only": set()}
    for result_path in sorted(ARTIFACTS.glob("n14_*.result.json")):
        if result_path.name == "timeout-repair.result.json":
            continue
        result = load(result_path)
        orbit = str(result["orbit"])
        surface = str(result["surface"])
        assert surface in seen
        assert orbit in ORBITS
        assert result["status"] == "TIMEOUT"
        assert result["epistemic_status"] == "BOUNDED_CVC5_NO_VERDICT"
        stderr = (ARTIFACTS / str(result["stderr_path"])).read_text(encoding="utf-8")
        assert "cvc5 interrupted by timeout." in stderr
        assert "global::totalTime" in stderr
        smt2_path = result_path.with_name(result_path.name.replace(".result.json", ".smt2"))
        manifest_path = result_path.with_name(
            result_path.name.replace(".result.json", ".manifest.json")
        )
        if smt2_path.exists():
            assert result["smt2_sha256"] == sha256(smt2_path)
        assert result["manifest_sha256"] == sha256(manifest_path)
        manifest = load(manifest_path)
        assert result["smt2_sha256"] == manifest["smt2_sha256"]
        assert manifest["orbit"] == orbit
        if "surface" in manifest:
            assert manifest["surface"] == surface
        elif surface != "full":
            raise AssertionError("legacy manifest can only be full")
        assert manifest["boolean_variable_count"] == 476
        assert manifest["distance_variable_count"] == 91
        assert manifest["structural_category_counts"][
            "exact_shell_selected_row_alternation"
        ] == 572
        assert manifest["structural_category_counts"][
            "selected_row_strong_connectivity"
        ] == 16382
        forbidden = {
            "transported_2k3_schema_cuts",
            "learned_weighted_kalmanson_schema_cuts",
        }
        assert forbidden.isdisjoint(manifest["structural_category_counts"])
        linear = manifest["linear_category_counts"]
        assert linear["selected_row_pair_equality"] == 1092
        assert linear["exact_five_apex_pair_equality"] == 78
        assert linear["strict_kalmanson_first"] == 1001
        assert linear["strict_kalmanson_second"] == 1001
        if surface == "full":
            assert linear["distance_positivity"] == 91
            assert linear["strict_triangle"] == 1092
            assert manifest["linear_assertion_count"] == 4355
        else:
            assert "distance_positivity" not in linear
            assert "strict_triangle" not in linear
            assert manifest["linear_assertion_count"] == 3172
        seen[surface].add(orbit)

    assert seen == {"full": ORBITS, "kalmanson-only": ORBITS}
    repair = load(ARTIFACTS / "timeout-repair.result.json")
    assert repair["status"] == "COMPLETE"
    assert repair["repaired_count"] == 14
    print("VERIFIED: smoke SAT/UNSAT and 14 bounded cvc5 timeout artifacts")
    print("VERIFIED: seven full and seven Kalmanson-only orbits")
    print("VERIFIED: exact hashes, clause provenance, and no cut-bank leakage")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
