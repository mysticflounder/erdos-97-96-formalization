#!/usr/bin/env python3
"""Emit an invariant EqualityCore wrapper for a verified unit certificate."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
COORDINATE_TOKEN = re.compile(r"(?<![A-Za-z0-9_])x(\d+)([xy])(?![A-Za-z0-9_])")
GENERATOR_NAME = re.compile(r"ROW_(\d+)_(\d+)_(\d+)")


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def point(label: int, *, normalized: bool) -> str:
    if normalized and label == 0:
        return "(pt 0 0)"
    if normalized and label == 1:
        return "(pt 1 0)"
    return f"P{label}"


def dist_equality(name: str, *, normalized: bool) -> str:
    match = GENERATOR_NAME.fullmatch(name)
    if match is None:
        raise RuntimeError(f"malformed generator name: {name}")
    center, left, right = (int(value) for value in match.groups())
    return (
        f"dist {point(center, normalized=normalized)} "
        f"{point(left, normalized=normalized)} = "
        f"dist {point(center, normalized=normalized)} "
        f"{point(right, normalized=normalized)}"
    )


def edge_closure(name: str) -> str:
    match = GENERATOR_NAME.fullmatch(name)
    if match is None:
        raise RuntimeError(f"malformed generator name: {name}")
    center, left, right = (int(value) for value in match.groups())
    return (
        "Census554.EqualityCore.EdgeClosure P "
        f"(P{center}, P{left}) (P{center}, P{right})"
    )


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--certificate", type=Path, required=True)
    parser.add_argument("--verification", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--scalar-module", required=True)
    parser.add_argument("--scalar-theorem", required=True)
    parser.add_argument("--theorem-stem", required=True)
    parser.add_argument("--structure-name", required=True)
    args = parser.parse_args()

    certificate = json.loads(args.certificate.read_text(encoding="utf-8"))
    verification = json.loads(args.verification.read_text(encoding="utf-8"))
    if certificate["coordinate_model"] != "p0_zero_p1_e1":
        raise RuntimeError("unsupported coordinate model")
    if not verification["verified_exact_identity"]:
        raise RuntimeError("refusing to emit from an unverified certificate")
    if verification["certificate_file_sha256"] != file_sha256(args.certificate):
        raise RuntimeError("certificate hash disagrees with independent replay")

    active: list[tuple[int, str, str, str]] = []
    used_coordinate_tokens: set[str] = set()
    used_labels = {0, 1}
    for index, (name, generator, multiplier) in enumerate(
        zip(
            certificate["generator_names"],
            certificate["generators"],
            certificate["multipliers"],
            strict=True,
        ),
        start=1,
    ):
        if multiplier.strip() in {"0", "+0", "-0"}:
            continue
        match = GENERATOR_NAME.fullmatch(name)
        if match is None:
            raise RuntimeError(f"malformed generator name: {name}")
        used_labels.update(int(value) for value in match.groups())
        for token_match in COORDINATE_TOKEN.finditer(generator + " " + multiplier):
            used_coordinate_tokens.add(token_match.group(0))
            used_labels.add(int(token_match.group(1)))
        active.append((index, name, generator, multiplier))
    if len(active) != certificate["nonzero_multiplier_count"]:
        raise RuntimeError("active multiplier count disagrees with certificate")

    variables = [
        variable
        for variable in certificate["variables"]
        if variable in used_coordinate_tokens
    ]
    variable_arguments: list[str] = []
    for variable in variables:
        match = COORDINATE_TOKEN.fullmatch(variable)
        if match is None:
            raise RuntimeError(f"malformed coordinate variable: {variable}")
        label = int(match.group(1))
        coordinate = 0 if match.group(2) == "x" else 1
        variable_arguments.append(f"(P{label} {coordinate})")

    nonanchor_labels = sorted(used_labels - {0, 1})
    labels = sorted(used_labels)
    active_hypotheses = [f"h{index:02d}" for index, *_ in active]
    normalized_name = f"normalized_{args.theorem_stem}_incompatible"
    dist_sq_name = f"{args.theorem_stem}_dist_sq_coord"
    collision_name = f"{args.theorem_stem}_anchor_collision"
    structure_camel = args.structure_name[0].lower() + args.structure_name[1:]
    no_realizes_name = f"not_realizes_of_{structure_camel}"

    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        f"import {args.scalar_module}",
        "import Erdos9796Proof.P97.Census554.EqualityCore",
        "",
        "/-!",
        "Generated invariant distance-equality wrapper around an independently",
        "replayed exact QQ unit certificate.  This is isolated, unbuilt scratch",
        "input until a Lean check is authorized.",
        "-/",
        "",
        "open scoped EuclideanGeometry",
        "",
        "namespace Problem97",
        "namespace ATailUniqueRowProducerScratch",
        "",
        "/-- Squared Euclidean distance in `ℝ²` as a coordinate sum. -/",
        f"private theorem {dist_sq_name} (x y : ℝ²) :",
        "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by",
        "  rw [EuclideanSpace.dist_sq_eq]",
        "  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]",
        "",
        "/-- The normalized active equality subsystem is inconsistent. -/",
        f"private theorem {normalized_name}",
    ]
    if nonanchor_labels:
        lines.append(
            "    {" + " ".join(f"P{label}" for label in nonanchor_labels) + " : ℝ²}"
        )
    for index, name, _generator, _multiplier in active:
        lines.append(
            f"    (h{index:02d} : {dist_equality(name, normalized=True)})"
        )
    lines.append("    : False := by")
    for hypothesis in active_hypotheses:
        lines.append(
            f"  have {hypothesis}sq := congrArg (fun r : ℝ => r ^ 2) {hypothesis}"
        )
    for index, name, _generator, _multiplier in active:
        equality = dist_equality(name, normalized=True)
        left, right = equality.split(" = ", maxsplit=1)
        lines.append(f"  change {left} ^ 2 = {right} ^ 2 at h{index:02d}sq")
    squared = " ".join(f"{hypothesis}sq" for hypothesis in active_hypotheses)
    lines.extend(
        [
            f"  rw [{dist_sq_name}, {dist_sq_name}] at {squared}",
            "  simp only [pt, Matrix.cons_val_zero, Matrix.cons_val_one] at",
            "    " + squared,
            f"  apply {args.scalar_theorem}",
        ]
    )
    if variable_arguments:
        lines.append("    " + " ".join(variable_arguments))
    for hypothesis in active_hypotheses:
        lines.append(f"  · nlinarith [{hypothesis}sq]")

    lines.extend(
        [
            "",
            "/-- The metric subsystem forces its two normalization anchors to collide. -/",
            f"theorem {collision_name}",
            "    {" + " ".join(f"P{label}" for label in labels) + " : ℝ²}",
        ]
    )
    for index, name, _generator, _multiplier in active:
        lines.append(f"    (h{index:02d} : {dist_equality(name, normalized=False)})")
    lines.extend(
        [
            "    : P0 = P1 := by",
            "  by_contra h01ne",
            "  let T : ℝ² → ℝ² := normSim P0 P1",
        ]
    )
    for label in nonanchor_labels:
        lines.append(f"  let p{label} := T P{label}")
    lines.extend(
        [
            "  have hdist (X Y : ℝ²) :",
            "      dist (T X) (T Y) = (dist P0 P1)⁻¹ * dist X Y := by",
            "    simpa [T] using normSim_dist_image P0 P1 h01ne X Y",
            "  have hT0 : T P0 = pt 0 0 := by",
            "    simpa [T] using normSim_fst P0 P1",
            "  have hT1 : T P1 = pt 1 0 := by",
            "    simpa [T] using normSim_snd P0 P1 h01ne",
            "  have map_dist_eq {X Y Z R : ℝ²} (h : dist X Y = dist Z R) :",
            "      dist (T X) (T Y) = dist (T Z) (T R) := by",
            "    rw [hdist, hdist, h]",
            f"  apply {normalized_name}",
        ]
    )
    if nonanchor_labels:
        lines.append(
            "      "
            + " ".join(f"(P{label} := p{label})" for label in nonanchor_labels)
        )
    simp_terms = [f"p{label}" for label in nonanchor_labels] + ["hT0", "hT1"]
    simp_payload = ", ".join(simp_terms)
    for hypothesis in active_hypotheses:
        lines.append(
            f"  · simpa [{simp_payload}] using map_dist_eq {hypothesis}"
        )

    lines.extend(
        [
            "",
            "/-- Equality-closure form of the generated anchor collision. -/",
            f"structure {args.structure_name} {{alpha : Type*}}",
            "    (P : Census554.EqualityCore.RowPattern alpha) where",
        ]
    )
    for label in labels:
        lines.append(f"  P{label} : alpha")
    lines.append("  h01ne : P0 ≠ P1")
    for index, name, _generator, _multiplier in active:
        lines.append(f"  h{index:02d} : {edge_closure(name)}")

    lines.extend(
        [
            "",
            "/-- A matching equality-closure core has no injective planar realization. -/",
            f"theorem {no_realizes_name}",
            "    {alpha : Type*} {P : Census554.EqualityCore.RowPattern alpha}",
            f"    (core : {args.structure_name} P) :",
            "    ¬ ∃ pointOf : alpha → ℝ², Census554.EqualityCore.Realizes P pointOf := by",
            "  rintro ⟨pointOf, hreal⟩",
            "  have sound {e f : Census554.EqualityCore.Edge alpha}",
            "      (h : Census554.EqualityCore.EdgeClosure P e f) :",
            "      Census554.EqualityCore.edgeDist pointOf e =",
            "        Census554.EqualityCore.edgeDist pointOf f :=",
            "    Census554.EqualityCore.EdgeClosure.sound hreal h",
            f"  have hcollision := {collision_name}",
        ]
    )
    for hypothesis in active_hypotheses:
        lines.append(
            "    (by simpa [Census554.EqualityCore.edgeDist] using "
            f"sound core.{hypothesis})"
        )
    lines.extend(
        [
            "  exact core.h01ne (hreal.injective hcollision)",
            "",
            f"#print axioms {args.scalar_theorem}",
            f"#print axioms {collision_name}",
            f"#print axioms {no_realizes_name}",
            "",
            "end ATailUniqueRowProducerScratch",
            "end Problem97",
            "",
        ]
    )

    args.output.write_text("\n".join(lines), encoding="utf-8")
    print(
        json.dumps(
            {
                "active_hypotheses": len(active),
                "labels": labels,
                "output": str(args.output),
                "output_bytes": args.output.stat().st_size,
                "output_sha256": file_sha256(args.output),
                "scalar_variables": variables,
            },
            indent=2,
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
