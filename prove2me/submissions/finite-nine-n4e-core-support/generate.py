#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the public N4e core interface and its first Prove2Me proof packet."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import re
from pathlib import Path

HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""

PUBLIC_DECLARATIONS = (
    "EscapedForm",
    "ZeroDefectCapLayout",
    "SelectorV2Qv1Packet",
    "SelectorV3Qv1Packet",
    "SelectorV3Qa2Packet",
    "I3OnV3RadiusAtA2CardLeOne",
    "I3NoPointOnV3RadiusAtA2",
    "I3V3A2NormalizedHeightGap",
    "I3V3A2DeltaNormalization",
    "ZeroDefectCapLayout.b3n9m051_swapI1",
    "ZeroDefectCapLayout.swapI2",
    "FormBv1A2Packet",
    "FormBv1A2SelectorV2Qv1Packet",
    "FormBv1B2Packet",
    "FormBv1B2SelectorV2Qv1Packet",
    "I3V3A2DeltaNormalizationOfExactPacket",
    "SharedCirclePointForcesV3",
    "FormBv1A2SelectorV2LowerPacket",
    "b3n9m051_FormBv1B2SelectorV2LowerPacket",
)

FIELDS = (
    ("I1_card_eq_two", "I1_card_eq_two"),
    ("I2_card_eq_two", "I2_card_eq_two"),
    ("I3_card_eq_two", "I3_card_eq_two"),
    ("coreSelector_v1", "coreSelector_v1"),
    ("coreSelector_v2", "coreSelector_v2"),
    ("coreSelector_v3", "coreSelector_v3"),
    ("formB_v1_split", "formB_v1_split"),
    ("selectorShape_v2_split", "selectorShape_v2_split"),
    ("selectorShape_v3_split", "selectorShape_v3_split"),
    ("qEqE_capOrder_opposite", "qEqE_capOrder_opposite"),
    ("dist_sq_eq_coord_sq_add_coord_sq", "b3n9m051_dist_sq_eq_coord_sq_add_coord_sq"),
    ("qEqE_f1_sinusoid", "b3n9m051_qEqE_f1_sinusoid"),
    ("qEqE_f2_sinusoid", "b3n9m051_qEqE_f2_sinusoid"),
    ("qEqE_lowerArc_sameSign", "qEqE_lowerArc_sameSign"),
    ("qEqE_lowerArc_sameSign_flipped_of_c2Side", "qEqE_lowerArc_sameSign_flipped_of_c2Side"),
    ("i3_v3_a2_normalized_height_gap_of_delta_normalization", "i3_v3_a2_normalized_height_gap_of_delta_normalization"),
    ("i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap", "i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap"),
    ("i3_on_v3_radius_at_a2_card_le_one_of_no_hit", "i3_on_v3_radius_at_a2_card_le_one_of_no_hit"),
    ("selectorShape_v3_q_eq_v1_impossible", "selectorShape_v3_q_eq_v1_impossible"),
    ("selectorShape_v3_q_eq_a2_impossible", "selectorShape_v3_q_eq_a2_impossible"),
    ("C2_same_open_side_of_base_chord_as_v3", "C2_same_open_side_of_base_chord_as_v3"),
    ("c2_vertex_same_open_side_as_v3", "c2_vertex_same_open_side_as_v3"),
    ("signedArea2_baseChord_vec2", "b3n9m051_signedArea2_baseChord_vec2"),
    ("exists_base_transportData", "b3n9m051_exists_base_transportData"),
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_parent_generator(base: Path):
    path = base.parent / "finite-nine-child-form-b-v1/generate.py"
    spec = importlib.util.spec_from_file_location("finite_nine_form_b_generator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load authenticated parent generator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def declaration_match(source: str, name: str) -> re.Match[str]:
    pattern = re.compile(
        rf"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        rf"(?:private\s+)?(?:noncomputable\s+)?"
        rf"(?:theorem|lemma|def|abbrev|structure|inductive)\s+{re.escape(name)}"
        rf"(?![A-Za-z0-9_.])"
    )
    matches = list(pattern.finditer(source))
    if len(matches) != 1:
        raise ValueError(f"expected one declaration {name}, found {len(matches)}")
    return matches[0]


def declaration_block(source: str, name: str) -> str:
    match = declaration_match(source, name)
    next_decl = re.compile(
        r"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        r"(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+[A-Za-z0-9_.]+\b"
    ).search(source, match.end())
    end = next_decl.start() if next_decl else len(source)
    return source[match.start():end].rstrip() + "\n"


def theorem_field(source: str, field_name: str, theorem_name: str) -> str:
    match = declaration_match(source, theorem_name)
    next_decl = re.compile(
        r"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        r"(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+[A-Za-z0-9_.]+\b"
    ).search(source, match.end())
    declaration_end = next_decl.start() if next_decl else len(source)
    value_start = source.find(":= by", match.end(), declaration_end)
    if value_start < 0:
        value_start = source.find(":=\n", match.end(), declaration_end)
    if value_start < 0:
        raise ValueError(f"theorem {theorem_name} has no value separator")
    declaration = source[match.start():value_start]
    theorem_at = declaration.index("theorem ")
    declaration = declaration[theorem_at + len("theorem "):]
    if not declaration.startswith(theorem_name):
        raise ValueError(f"unexpected theorem header for {theorem_name}")
    tail = declaration[len(theorem_name):]
    tail, count = re.subn(
        r"\s*\{A : Finset ℝ²\}\s*\(S : FiniteEndpointShell A\)",
        "",
        tail,
        count=1,
    )
    if "FiniteEndpointShell A" in declaration and count != 1:
        raise ValueError(f"failed to bind shell parameter for {theorem_name}")
    lines = (field_name + tail).strip().splitlines()
    return "\n".join("  " + line for line in lines)


def remove_declaration(source: str, name: str) -> str:
    block = declaration_block(source, name)
    if source.count(block) != 1:
        raise ValueError(f"declaration block for {name} is not unique")
    return source.replace(block, "", 1)


def render_definition(full: str) -> str:
    imports = []
    for line in full.splitlines():
        if line.startswith("import ") and line not in imports:
            imports.append(line)
    blocks = []
    for name in PUBLIC_DECLARATIONS:
        block = declaration_block(full, name)
        if name == "b3n9m051_FormBv1B2SelectorV2LowerPacket":
            block = block.replace(
                "b3n9m051_FormBv1B2SelectorV2LowerPacket",
                "FormBv1B2SelectorV2LowerPacket",
            )
        blocks.append(block)
    fields = ["  layout : ZeroDefectCapLayout (S := S)"]
    fields.extend(theorem_field(full, field, theorem) for field, theorem in FIELDS)
    support = (
        "/-- Explicit reusable facts established by the first N4e proof slice. -/\n"
        "structure N4eCoreSupport {A : Finset ℝ²} (S : FiniteEndpointShell A) where\n"
        + "\n".join(fields)
        + "\n"
    )
    result = (
        HEADER
        + "\n"
        + "\n".join(imports)
        + "\n\nopen scoped EuclideanGeometry InnerProductSpace\n\n"
        + "namespace Batch3N9\nopen scoped EuclideanGeometry\nopen Finset\n"
        + "namespace Problem97\nexport _root_.Problem97 (signedArea2)\nend Problem97\n"
        + "namespace Problem97\nnamespace FiniteEndpointShell\n\n"
        + "\n".join(blocks)
        + "\n"
        + support
        + "\nend FiniteEndpointShell\nend Problem97\nend Batch3N9\n"
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden definition/trust token: {hit.group(0)}")
    return result


def render_solution(full: str) -> str:
    start_marker = "-- Original module: Solutions.Batch3N9.N9Endpoint.N4e"
    end_marker = "-- Original module: Solutions.Batch3N9.N4d.TrackBRows"
    start = full.index(start_marker)
    unit_end = full.index(end_marker, start)
    unit = full[start:unit_end]
    transport = declaration_block(unit, "b3n9m051_exists_base_transportData")
    cut = unit.index(transport) + len(transport)
    core = full[:start] + unit[:cut]
    for name in PUBLIC_DECLARATIONS:
        if name in (
            "SharedCirclePointForcesV3",
            "FormBv1A2SelectorV2LowerPacket",
            "b3n9m051_FormBv1B2SelectorV2LowerPacket",
        ):
            continue
        core = remove_declaration(core, name)
    definition_import = "import Definitions.Def_Erdos9796FiniteNine_N4dPackets\n"
    if definition_import.strip() in core:
        raise ValueError("N4dPackets import unexpectedly already present")
    core = core.replace(HEADER + "\n", HEADER + "\n" + definition_import, 1)
    closers = "\nend FiniteEndpointShell\nend Problem97\nend Batch3N9\nend Batch3N9Unit051\n"
    assignments = ["    layout := S.zeroDefectCapLayout"]
    for field, theorem in FIELDS:
        if theorem in {"I1_card_eq_two", "I2_card_eq_two", "I3_card_eq_two", "coreSelector_v1", "coreSelector_v2", "coreSelector_v3", "formB_v1_split", "selectorShape_v2_split", "selectorShape_v3_split", "qEqE_capOrder_opposite", "i3_v3_a2_normalized_height_gap_of_delta_normalization", "i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap", "i3_on_v3_radius_at_a2_card_le_one_of_no_hit", "selectorShape_v3_q_eq_v1_impossible", "selectorShape_v3_q_eq_a2_impossible", "C2_same_open_side_of_base_chord_as_v3", "c2_vertex_same_open_side_as_v3"}:
            value = f"S.{theorem}"
        else:
            value = f"Batch3N9.Problem97.FiniteEndpointShell.{theorem}"
        assignments.append(f"    {field} := {value}")
    suffix = (
        closers
        + "\n/-- The first N4e slice exports every fact required by later branch proofs. -/\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A) :\n"
        + "    Nonempty (Batch3N9.Problem97.FiniteEndpointShell.N4eCoreSupport S) := by\n"
        + "  exact ⟨{\n"
        + "\n".join(assignments)
        + "\n  }⟩\n"
    )
    result = core.rstrip() + suffix
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 350 * 1024:
        raise ValueError(f"N4e core solution is too large: {len(result.encode())} bytes")
    return result


def render_theorem() -> str:
    return HEADER + """
import Definitions.Def_Erdos9796FiniteNine_N4dPackets

open scoped EuclideanGeometry

/-- The first N4e slice supplies the explicit interface used by later branch proofs. -/
-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796FiniteNine.n4e_core {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    Nonempty (Batch3N9.Problem97.FiniteEndpointShell.N4eCoreSupport S) := by
  sorry
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    parent = load_parent_generator(base)
    full = parent.render(base)
    outputs = {
        base / "platform/Definitions/Def_Erdos9796FiniteNine_N4dPackets.lean": render_definition(full),
        base / "platform/Solutions/Sol_Erdos9796FiniteNine_n4e_core.lean": render_solution(full),
        base / "platform/Theorems/Thm_Erdos9796FiniteNine_n4e_core.lean": render_theorem(),
    }
    for path, rendered in outputs.items():
        if args.check:
            if not path.is_file() or path.read_text(encoding="utf-8") != rendered:
                raise SystemExit(f"generated artifact is stale: {path}")
            print(f"PASS {path} {len(rendered.encode())} bytes {digest(rendered.encode())}")
        else:
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text(rendered, encoding="utf-8")
            print(f"wrote {path} {len(rendered.encode())} bytes {digest(rendered.encode())}")


if __name__ == "__main__":
    main()
