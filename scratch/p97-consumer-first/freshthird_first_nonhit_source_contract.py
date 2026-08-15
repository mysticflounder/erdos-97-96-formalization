#!/usr/bin/env python3
"""Emit the source contract for the on-spine FreshThird first-nonhit leaf.

This is a coverage manifest, not a solver.  It prevents a later finite
encoder from silently dropping one of the Lean constructors or treating a
diagnostic bounded model as a proof of the universal producer.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from itertools import product
from pathlib import Path


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
FIBER = ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean"
RESIDUAL = ROOT / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


NONHIT_ARMS = {
    "sameBlocker": {
        "source_fields": ["center_eq", "support_eq"],
        "derived_fields": [],
    },
    "sourceRowOmission": {
        "source_fields": [
            "deleted",
            "deleted_eq_source1_or_source2",
            "deleted_not_mem_source_row",
            "deletion_survives_exact_four",
        ],
        "derived_fields": ["source_center_ne_fresh_center"],
    },
}


INTERACTION_ARMS = {
    "sameBlocker": ["center_eq", "support_eq"],
    "sourceRowOmission": [
        "deleted",
        "deleted_eq_source1_or_source2",
        "deleted_not_mem_source_row",
        "deletion_survives_exact_four",
    ],
    "distinctBlockersDifferentCaps": [
        "centers_ne",
        "source1_mem_source_row",
        "source2_mem_source_row",
        "exact_two_point_overlap",
        "source_cap",
        "fresh_cap",
        "source_center_mem_source_cap_interior",
        "fresh_center_mem_fresh_cap_interior",
        "caps_ne",
    ],
    "sameCapWithInternalFiberSource": [
        "centers_ne",
        "source1_mem_source_row",
        "source2_mem_source_row",
        "exact_two_point_overlap",
        "cap_index",
        "source_center_mem_cap_interior",
        "fresh_center_mem_cap_interior",
        "source1_or_source2_mem_cap",
    ],
}


INGRESS_ARMS = {
    "retained": [
        "first_apex_source_radii_ne",
        "first_source_radius_cap_slice_singleton",
        "second_source_radius_cap_slice_singleton",
        "cross_retained_deleted_x_y",
        "x_y_omitted_by_first_source_row",
        "first_source_center_survives_double_deletion",
        "first_apex_minimal_deletion_core",
    ],
    "commonRadius": [
        "common_radius",
        "cap_card_ge_eight",
        "common_radius_cap_slice_card_ge_two",
        "common_radius_ne_radius",
        "common_radius_ne_rho",
        "separate_two_cap_source_surface",
        "first_source_mem_common_radius_class",
        "second_source_mem_common_radius_class",
    ],
}


def build_manifest() -> dict:
    cases = []
    for case_id, (nonhit, interaction, ingress) in enumerate(
        product(NONHIT_ARMS, INTERACTION_ARMS, INGRESS_ARMS)
    ):
        cases.append(
            {
                "case_id": case_id,
                "first_nonhit": nonhit,
                "second_interaction": interaction,
                "ingress": ingress,
                "required_source_fields": {
                    "first_nonhit": NONHIT_ARMS[nonhit]["source_fields"],
                    "first_nonhit_derived": NONHIT_ARMS[nonhit]["derived_fields"],
                    "second_interaction": INTERACTION_ARMS[interaction],
                    "ingress": INGRESS_ARMS[ingress],
                },
                "required_conclusion": "False",
                "required_conclusion_fields": [],
                "covered_by_existing_encoder": False,
            }
        )
    return {
        "campaign": "freshthird_first_nonhit_source_contract",
        "lean_target": (
            "Problem97.ATailFrontierLiveClosure."
            "TwoSourceExactCollisionRowsTerminal.false_of_freshThird_firstNonHit"
        ),
        "live_consumer": (
            "Problem97.ATailFrontierLiveClosure."
            "false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining"
        ),
        "claim_scope": (
            "constructor-coverage contract only; no SAT/UNSAT result and no Lean closure"
        ),
        "constructor_product": "2 first-nonhit x 4 second-interaction x 2 ingress",
        "case_count": len(cases),
        "source_hashes": {
            str(FIBER.relative_to(ROOT)): sha256(FIBER),
            str(RESIDUAL.relative_to(ROOT)): sha256(RESIDUAL),
        },
        "universal_requirements_before_promotion": [
            "Lean extraction theorem from every listed source case to the finite object",
            "coverage of arbitrary carrier cardinality without a silent MAXN bound",
            "exact deletion-survival semantics for erased carriers",
            "exact cap membership and cap-index coverage",
            "no identification of the common-radius surface with the target surface",
            "certificate replay into the named live consumer",
        ],
        "existing_freshthird_source_faithful_round_reusable": False,
        "existing_encoder_gap": (
            "the 34-role diagnostic encoder does not encode either non-hit constructor, "
            "the four interaction constructors, or a universal extraction/lift"
        ),
        "cases": cases,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--output",
        type=Path,
        default=HERE / "freshthird_first_nonhit_source_contract.manifest.json",
    )
    args = parser.parse_args()
    manifest = build_manifest()
    args.output.write_text(
        json.dumps(manifest, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(f"manifest={args.output}")
    print(f"cases={manifest['case_count']} claim_scope=contract-only")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
