#!/usr/bin/env python3
"""Check the pinned evidence used by the prescribed-deletion-edge audit."""

from __future__ import annotations

import hashlib
import json
from collections import Counter
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
ROW_EXTENSIONS = (
    ROOT
    / "scratch/atail-force/current-marco-cores/"
    "row_extension_completion_checkpoint.json"
)
COMMON_SYSTEM = (
    ROOT / "scratch/atail-force/common-system-parent/shadow_checkpoint.json"
)

EXPECTED_SHA256 = {
    ROW_EXTENSIONS: "d6c2bece9b30fc337ef181a941a8b781b33d9217fe2347c948fe61b2d306a83c",
    COMMON_SYSTEM: "e8ae93be71d1c10e638c7a2679c2b1e0847b921e328f6009143665f15c13dc37",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load(path: Path) -> dict[str, object]:
    return json.loads(path.read_text(encoding="utf-8"))


def main() -> None:
    observed = {path: sha256(path) for path in EXPECTED_SHA256}
    assert observed == EXPECTED_SHA256, (observed, EXPECTED_SHA256)

    rows = load(ROW_EXTENSIONS)
    common = load(COMMON_SYSTEM)
    row_cases = rows["cases"]
    assert isinstance(row_cases, list)
    assert rows["case_count"] == len(row_cases) == 23
    assert rows["preferred_role_histogram"] == {"4": 5, "5": 11, "5+7": 7}
    assert rows["all_base_clean_preferred_single_edges_hit_existing_core"] is True
    assert rows["base_current_bank_hit_count"] == 0

    added = [case["added_row_extension"] for case in row_cases]
    assert all(edge["selected_row_exact"] is True for edge in added)
    assert all(edge["left_in_selected_support"] is True for edge in added)
    assert all(edge["right_in_selected_support"] is False for edge in added)
    family_counts = Counter(
        case["first_existing_lean_core_family_after_extension"]
        for case in row_cases
    )
    assert family_counts == Counter(
        {"DuplicateCenterCore": 21, "ExactOffCircleCore": 2}
    )

    aggregate = common["aggregate"]
    assert aggregate["case_count"] == 23
    assert aggregate["all_admit_total_common_blocker_map"] is True
    assert aggregate["all_avoid_preferred_h4_h5_blocker_alignment"] is True
    assert common["inputs_sha256"]["row_extensions"] == EXPECTED_SHA256[ROW_EXTENSIONS]
    blocker_rows = common["evidence"]["preferred_edges_and_right_blockers"]
    assert len(blocker_rows) == 23
    assert all(edge_center != right_blocker for edge_center, _, _, right_blocker in blocker_rows)

    scope = common["scope"]
    assert scope["finite_shadow_only"] is True
    assert scope["convexity_and_mec_optimality_omitted"] is True
    assert scope["live_k_a_pair_closed"] is False

    print("PASS: 23/23 preferred rows are exact with left in and right out")
    print("PASS: adding h4/h5 reaches 21 DuplicateCenterCore + 2 ExactOffCircleCore")
    print("PASS: 23/23 admit a total common blocker map avoiding the preferred alignment")
    print("SCOPE: fixed card-12 (5,5,5) incidence shadow only")


if __name__ == "__main__":
    main()
