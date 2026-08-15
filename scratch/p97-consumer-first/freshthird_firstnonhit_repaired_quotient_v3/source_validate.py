#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Independent text-and-hash source gate for the repaired quotient."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[2]
PREDECESSORS = (
    HERE.parent / "freshthird_firstnonhit_global_blocker_quotient_v1",
    HERE.parent / "freshthird_firstnonhit_sevenrow_cut_v1",
)


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run() -> dict:
    checks = {
        REPO / "lean/Erdos9796Proof/P97/U1CarrierInjection.lean": (
            "support_card : support.card = 4",
            "support_subset_A : support ⊆ A",
            "q_mem_support : q ∈ support",
            "theorem center_not_mem_support",
            "theorem blockerVertex_ne",
            "theorem inter_card_le_two {A : Finset ℝ²}",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean": (
            "theorem selectedSupports_eq_of_actualBlockers_eq",
            "theorem actualBlockerFiber_card_le_four",
            "theorem actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean": (
            "theorem cross_deletion_survives_iff_not_mem_selected_support",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean": (
            "structure FreshThirdBlockerFiber",
            "sources_ne : source₁ ≠ source₂",
            "blockers_eq :",
            "source₁_mem_source₂_shell :",
            "source₂_mem_source₁_shell :",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean": (
            "structure TwoCapSourceThirdCanonicalRowSurface",
            "sources_ne : firstSource.1 ≠ secondSource.1",
            "theorem freshThird_commonRadius_sameBlocker_exists_four_capInterior_sources_off_selectedShell",
            "W.card = 4",
            "z ∉ (H.selectedAt Q.source₁.1",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean": (
            "inductive FreshThirdCapSourceInteraction",
            "inductive FreshThirdCapSourceNonHit",
            "theorem freshThirdCapSourceNonHit_center_ne_of_sourceRowOmission",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean": (
            "def SourceFaithfulSelectedFourDeletionFan",
            "theorem exists_repeatedBlockerCap_pair_outcome",
        ),
        REPO / "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean": (
            "theorem freshThird_qRow_exact_blocker_boundary",
            "theorem exists_retainedFirstApex_mutualDeletionPair_threeLocationCases",
            "theorem exists_freshThird_firstNonHit_selectedRow_overlap_card_ge_three",
        ),
        REPO / "lean/Erdos9796Proof/P97/Census554/ThirteenPointSevenCircleCollision.lean": (
            "def thirteenPointSevenCirclePattern",
            "structure ThirteenPointSevenCircleCollisionCore",
            "theorem not_realizes_of_thirteenPointSevenCircleCollisionCore",
            "theorem not_realizes_thirteenPointSevenCirclePattern",
        ),
    }
    failures: list[str] = []
    pins: dict[str, str] = {}
    checked_tokens = 0
    for path, needles in checks.items():
        rel = str(path.relative_to(REPO))
        if not path.is_file():
            failures.append(f"missing:{rel}")
            continue
        text = path.read_text()
        pins[rel] = digest(path)
        for needle in needles:
            checked_tokens += 1
            if needle not in text:
                failures.append(f"missing-token:{rel}:{needle}")

    predecessor_pins: dict[str, str] = {}
    for root in PREDECESSORS:
        for name in ("SOURCE-MAP.md", "RESULTS.md", "SHA256SUMS"):
            path = root / name
            rel = str(path.relative_to(REPO))
            if not path.is_file():
                failures.append(f"missing-predecessor:{rel}")
            else:
                predecessor_pins[rel] = digest(path)

    result = {
        "status": "PASS" if not failures else "SOURCE_GATE_NO_RUN",
        "validator": "independent source_validate.py; exact token and full-file SHA-256 audit",
        "checked_source_files": len(checks),
        "checked_tokens": checked_tokens,
        "source_hashes": pins,
        "predecessor_hashes": predecessor_pins,
        "failures": failures,
        "exact_encoding_decision": (
            "possible: four explicit support slots plus anonymous carrier-point semantics; "
            "only source-proved inequalities; aliases quotient by source value"
            if not failures else "not established"
        ),
    }
    (HERE / "SOURCE-VALIDATION.json").write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    return result


if __name__ == "__main__":
    result = run()
    print(result["status"])
    raise SystemExit(0 if result["status"] == "PASS" else 3)
