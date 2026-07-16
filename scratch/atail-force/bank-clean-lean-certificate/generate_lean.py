#!/usr/bin/env python3
"""Emit the kernel-facing anchor-collision theorem for the retained row core."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from pathlib import Path
from typing import Any


HERE = Path(__file__).resolve().parent
ANALYSIS = HERE / "analyze.py"
CHECKPOINT = HERE / "checkpoint.json"
OUTPUT = HERE / "BankCleanAnchorCollision.lean"

PROPOSAL16_NAMES = (
    "ROW_O_E_A",
    "ROW_A_G_C",
    "ROW_A_K_C",
    "ROW_A_O_C",
    "ROW_F_K_A",
    "ROW_F_Z_A",
    "ROW_G_F_E",
    "ROW_G_K_E",
    "ROW_G_X_E",
    "ROW_K_O_G",
    "ROW_K_Y_G",
    "ROW_X_G_F",
    "ROW_Y_O_E",
    "ROW_Y_X_E",
    "ROW_Y_Z_E",
    "ROW_Z_G_A",
)


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def point(name: str, *, normalized: bool) -> str:
    if not normalized:
        return name
    if name == "O":
        return "(pt 0 0)"
    if name == "A":
        return "(pt 1 0)"
    return name


def hypothesis(name: str, *, normalized: bool) -> str:
    prefix, center, pivot, member = name.split("_")
    if prefix != "ROW":
        raise RuntimeError(f"unexpected generator name {name}")
    return (
        f"dist {point(center, normalized=normalized)} "
        f"{point(pivot, normalized=normalized)} = "
        f"dist {point(center, normalized=normalized)} "
        f"{point(member, normalized=normalized)}"
    )


def distance_sides(name: str, *, normalized: bool) -> tuple[str, str]:
    prefix, center, pivot, member = name.split("_")
    if prefix != "ROW":
        raise RuntimeError(f"unexpected generator name {name}")
    return (
        f"dist {point(center, normalized=normalized)} "
        f"{point(pivot, normalized=normalized)}",
        f"dist {point(center, normalized=normalized)} "
        f"{point(member, normalized=normalized)}",
    )


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--proposal16", action="store_true")
    parser.add_argument("--output", type=Path)
    parser.add_argument(
        "--exclude",
        action="append",
        default=[],
        help="audited equality-core generator name to omit (repeatable)",
    )
    args = parser.parse_args()
    analysis = load_module(ANALYSIS, "p97_bank_clean_certificate_analysis")
    rows, by_label = analysis.canonical_rows()
    rows = tuple(
        row
        for row in rows
        if by_label[row.center] in analysis.EXPECTED_ROW_CORE_NAMES
    )
    all_generators = analysis.named_generators(rows, by_label)
    if args.proposal16:
        generators = tuple((name, "", 0) for name in PROPOSAL16_NAMES)
        source_hash = "MSOLVE_TWO_ORDER_16_EQUALITY_PROPOSAL_NOT_SINGULAR_CONFIRMED"
    elif CHECKPOINT.exists():
        checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
        retained_names = {
            record["name"] for record in checkpoint["equality_core"]["generators"]
        }
        unknown = set(args.exclude) - retained_names
        if unknown:
            raise RuntimeError(f"unknown excluded generators: {sorted(unknown)}")
        retained_names -= set(args.exclude)
        generators = tuple(
            generator for generator in all_generators if generator[0] in retained_names
        )
        if {generator[0] for generator in generators} != retained_names:
            raise RuntimeError("checkpoint equality core is not a subset of row generators")
        source_hash = file_sha256(CHECKPOINT)
    else:
        retained_names = set(analysis.EXPECTED_EQUALITY_CORE_NAMES)
        generators = tuple(
            generator for generator in all_generators if generator[0] in retained_names
        )
        if {generator[0] for generator in generators} != retained_names:
            raise RuntimeError("pinned equality core is not a subset of row generators")
        source_hash = "PINNED_17_EQUALITY_CROSSCHECK_PENDING"

    used_names = sorted(
        {
            role
            for name, _polynomial, _center in generators
            for role in name.split("_")[1:]
        }
        - {"O", "A"}
    )
    normalized_binders = " ".join(used_names)
    raw_binders = " ".join(("O", "A", *used_names))

    normalized_hypotheses = [
        f"    (h{name.removeprefix('ROW_')} : {hypothesis(name, normalized=True)})"
        for name, _polynomial, _center in generators
    ]
    raw_hypotheses = [
        f"    (h{name.removeprefix('ROW_')} : {hypothesis(name, normalized=False)})"
        for name, _polynomial, _center in generators
    ]
    square_steps = []
    for name, _polynomial, _center in generators:
        suffix = name.removeprefix("ROW_")
        lhs, rhs = distance_sides(name, normalized=True)
        square_steps.extend(
            (
                f"  have h{suffix}_sq := congrArg (fun r : ℝ => r ^ 2) h{suffix}",
                f"  change {lhs} ^ 2 = {rhs} ^ 2 at h{suffix}_sq",
                f"  rw [bankClean_dist_sq_coord, bankClean_dist_sq_coord] at h{suffix}_sq",
                f"  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at h{suffix}_sq",
            )
        )

    local_names = {name: name.lower() for name in used_names}
    lets = [f"  let {local_names[name]} := T {name}" for name in used_names]
    named_arguments = " ".join(
        f"({name} := {local_names[name]})" for name in used_names
    )
    simpa_names = ", ".join((*local_names.values(), "hT0", "hT1"))
    transport_goals = [
        f"  · simpa [{simpa_names}] using map_dist_eq h{name.removeprefix('ROW_')}"
        for name, _polynomial, _center in generators
    ]
    theorem_args = " ".join(
        f"h{name.removeprefix('ROW_')}" for name, _polynomial, _center in generators
    )
    raw_hypothesis_names = " ".join(
        f"h{name.removeprefix('ROW_')}" for name, _polynomial, _center in generators
    )

    source = "\n".join(
        (
            "/-",
            "Copyright (c) 2026 Adam McKenna. All rights reserved.",
            "Released under Apache 2.0 license as described in the file LICENSE.",
            "Authors: Adam McKenna",
            "-/",
            "",
            "import Erdos9796Proof.P97.Census554.EqualityCore",
            "",
            "/-!",
            "# Corrected bank-clean shadow anchor collision",
            "",
            "This scratch theorem replays the retained exact metric core with",
            "Lean's kernel-producing `grobner` tactic, then removes the coordinate",
            "gauge by the standard `normSim` transport.",
            "",
            f"Analysis checkpoint SHA256: `{source_hash}`",
            f"Retained normalized equalities: {len(generators)}.",
            "-/",
            "",
            "open scoped EuclideanGeometry",
            "",
            "namespace Problem97",
            "namespace ATailBankCleanScratch",
            "",
            "/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/",
            "private theorem bankClean_dist_sq_coord (x y : ℝ²) :",
            "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
            "  rw [EuclideanSpace.dist_sq_eq]",
            "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
            "",
            "set_option maxHeartbeats 80000000 in",
            "set_option maxRecDepth 100000 in",
            "/-- The normalized retained equality system is inconsistent. -/",
            "private theorem normalized_bankClean_incompatible",
            f"    {{{normalized_binders} : ℝ²}}",
            *normalized_hypotheses,
            "    : False := by",
            *square_steps,
            f"  clear {raw_hypothesis_names}",
            "  grobner (ringSteps := 2000000)",
            "",
            "/-- The retained corrected-shadow row equalities force its two anchors",
            "to denote the same point. -/",
            "theorem bank_clean_anchor_collision",
            f"    {{{raw_binders} : ℝ²}}",
            *raw_hypotheses,
            "    : O = A := by",
            "  by_contra hOA",
            "  let T : ℝ² → ℝ² := normSim O A",
            *lets,
            "  have hdist (P Q : ℝ²) :",
            "      dist (T P) (T Q) = (dist O A)⁻¹ * dist P Q := by",
            "    simpa [T] using normSim_dist_image O A hOA P Q",
            "  have hT0 : T O = pt 0 0 := by",
            "    simpa [T] using normSim_fst O A",
            "  have hT1 : T A = pt 1 0 := by",
            "    simpa [T] using normSim_snd O A hOA",
            "  have map_dist_eq {P Q R S : ℝ²} (h : dist P Q = dist R S) :",
            "      dist (T P) (T Q) = dist (T R) (T S) := by",
            "    rw [hdist, hdist, h]",
            f"  apply normalized_bankClean_incompatible {named_arguments}",
            *transport_goals,
            "",
            "/-- Nondegenerate contradiction form intended for a row producer. -/",
            "theorem false_of_bank_clean_rows",
            f"    {{{raw_binders} : ℝ²}}",
            "    (hOA : O ≠ A)",
            *raw_hypotheses,
            "    : False := by",
            f"  exact hOA (bank_clean_anchor_collision {theorem_args})",
            "",
            "#print axioms bank_clean_anchor_collision",
            "#print axioms false_of_bank_clean_rows",
            "",
            "end ATailBankCleanScratch",
            "end Problem97",
            "",
        )
    )
    output = args.output or OUTPUT
    output.write_text(source, encoding="utf-8")
    print(
        json.dumps(
            {
                "output": str(output),
                "output_sha256": file_sha256(output),
                "retained_equalities": len(generators),
                "used_nonanchor_points": used_names,
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
