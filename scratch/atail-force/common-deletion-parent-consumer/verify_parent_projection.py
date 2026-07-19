"""Replay a finite-metric model of the common-deletion parent projection.

The pinned sibling model has global K4, a total deletion-critical map, a
five-point physical radius class, a six-point labelled cap, and a concrete
common-deletion packet.  This checker projects exactly the fields used by the
new Lean reduction.  It is not a Euclidean or minimal-counterexample model.
"""

from __future__ import annotations

import json
from pathlib import Path
import runpy


ROOT = Path(__file__).resolve().parents[3]
MODEL_PATH = (
    ROOT
    / "scratch/atail-force/paired-common-deletion-nonreturn-audit"
    / "exact_five_paired_cycle_model.py"
)


def main() -> None:
    model = runpy.run_path(str(MODEL_PATH))
    result = model["check"]()

    vertices = model["VERTICES"]
    physical = model["PHYSICAL_CENTER"]
    physical_class = model["PHYSICAL_CLASS"]
    first_center = model["ACTUAL_UNUSED_BLOCKER"]
    deleted = model["FIRST_SOURCE"]
    first_row, second_row = model["canonical_packet_rows"](deleted)
    exact_classes_at = model["exact_classes_at"]
    blocker = model["blocker"]

    assert len(physical_class) == 5
    assert len(model["CAP"]) == 6
    assert deleted in model["CAP_INTERIOR"]
    assert deleted in physical_class
    assert first_center != physical

    # One concrete CommonDeletionTwoCenterPacket projection.
    assert len(first_row) == 4
    assert len(second_row) == 4
    assert len(first_row & second_row) <= 2
    assert first_row in exact_classes_at(first_center, frozenset({deleted}))
    assert second_row in exact_classes_at(physical, frozenset({deleted}))
    assert blocker(deleted) not in {first_center, physical}

    # The parent five-class forces full single-deletion robustness and hence
    # excludes the physical apex from the complete blocker-map image.
    for source in vertices:
        physical_rows = exact_classes_at(physical, frozenset({source}))
        assert any(len(row) >= 4 for row in physical_rows)
        assert blocker(source) != physical

    payload = {
        "status": "PASS_EXACT_FINITE_METRIC_PROJECTION_ONLY",
        "source_model_digest": result["model_sha256"],
        "carrier_card": len(vertices),
        "physical_class_card": len(physical_class),
        "cap_card": len(model["CAP"]),
        "common_row_overlap": len(first_row & second_row),
        "all_single_deletions_survive_physical": True,
        "physical_absent_from_blocker_image": True,
    }
    print(json.dumps(payload, sort_keys=True))


if __name__ == "__main__":
    main()
