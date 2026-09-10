#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the second, branch-level finite-nine N4d Form B support packet."""

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

N4E_UNIT_SHA256 = "666acb64602d171cb5c6de9ec7af1eabd6edd1fb4c64756e92ccd23e5972b326"
BRANCH_SLICE_SHA256 = "e28276416f4976c01dabf0bf3f307ac09409561f115d087a58474af873f918e6"
PREFIX_SHA256 = "de54e8fa7392016f93e362aaf20192a3f9d12f7458b1b5c0f32e3980474de8c5"
PURE_SLICE_SHA256 = "05e6cd0ec63a1366824e34c6763b74dac0143d93d212224dfad63fa9b14cd2bc"

FIELDS = (
    "v1v3_longer_than_base_of_exact_packet",
    "selectorShape_v3_q_eq_a2_impossible_of_exact_packet",
    "n4d_bB_2_q_eq_v1_impossible",
    "n4d_bA_2_q_eq_v1_impossible",
    "n4d_bA_2_q_eq_C_impossible",
    "qEqE_row_impossible_of_reflection",
    "qEqE_lowerArc_impossible",
    "qEqE_lowerArc_impossible_flipped",
)

PUBLIC_DUPLICATES = (
    "SharedCirclePointForcesV3",
    "b3n9m051_FormBv1B2SelectorV2LowerPacket",
    "FormBv1A2SelectorV2LowerPacket",
)

CORE_METHODS = (
    "i3_v3_a2_normalized_height_gap_of_delta_normalization",
    "i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap",
    "i3_on_v3_radius_at_a2_card_le_one_of_no_hit",
    "selectorShape_v3_q_eq_v1_impossible",
    "selectorShape_v3_q_eq_a2_impossible",
    "C2_same_open_side_of_base_chord_as_v3",
    "c2_vertex_same_open_side_as_v3",
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_generator(path: Path, module_name: str):
    spec = importlib.util.spec_from_file_location(module_name, path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load generator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def field_statement(core_generator, full: str, name: str) -> str:
    field = core_generator.theorem_field(full, name, name)
    field = field.replace(
        "b3n9m051_FormBv1B2SelectorV2LowerPacket",
        "FormBv1B2SelectorV2LowerPacket",
    )
    field, count = re.subn(
        r"\n\s+\(Z : ZeroDefectCapLayout S\)",
        "",
        field,
        count=1,
    )
    if name in FIELDS[:5] and count != 1:
        raise ValueError(f"failed to bind layout parameter for {name}")
    if name in FIELDS[5:] and count != 0:
        raise ValueError(f"unexpected layout parameter for {name}")
    return field


def render_definition(core_generator, full: str) -> str:
    fields = "\n".join(field_statement(core_generator, full, name) for name in FIELDS)
    return HEADER + f"""
import Definitions.Def_Erdos9796FiniteNine_N4dPackets

open scoped EuclideanGeometry

namespace Batch3N9
namespace Problem97
namespace FiniteEndpointShell

/-- Branch conclusions from the middle N4e slice, with its cap layout fixed. -/
structure N4dFormBBranchSupport {{A : Finset ℝ²}} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
{fields}

end FiniteEndpointShell
end Problem97
end Batch3N9
"""


def declaration_matches(source: str) -> list[re.Match[str]]:
    pattern = re.compile(
        r"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        r"(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+([A-Za-z0-9_.]+)"
    )
    return list(pattern.finditer(source))


def authenticated_branch_slice(full: str) -> str:
    start = full.index("-- Original module: Solutions.Batch3N9.N9Endpoint.N4e")
    end = full.index("-- Original module: Solutions.Batch3N9.N4d.TrackBRows", start)
    unit = full[start:end]
    if digest(unit.encode()) != N4E_UNIT_SHA256:
        raise ValueError("authenticated N4e unit changed")
    declarations = declaration_matches(unit)
    c2_index = next(
        i for i, match in enumerate(declarations)
        if match.group(1) == "c2_vertex_same_open_side_as_v3"
    )
    lower_index = next(
        i for i, match in enumerate(declarations)
        if match.group(1) == "qEqE_lowerArc_impossible_flipped"
    )
    branch = unit[declarations[c2_index + 1].start():declarations[lower_index + 1].start()]
    if digest(branch.encode()) != BRANCH_SLICE_SHA256:
        raise ValueError("authenticated N4e branch slice changed")
    return branch


def authenticated_pure_slice(full: str) -> str:
    start = full.index("-- Original module: Solutions.Batch3N9.N9Endpoint.N4e")
    end = full.index("-- Original module: Solutions.Batch3N9.N4d.TrackBRows", start)
    unit = full[start:end]
    declarations = declaration_matches(unit)
    pure_start = next(
        i for i, match in enumerate(declarations)
        if match.group(1) == "b3n9m051_dist_sq_eq_coord_sq_add_coord_sq"
    )
    pure_end = next(
        i for i, match in enumerate(declarations)
        if match.group(1) == "qEqE_lowerArc_sameSign_flipped_of_c2Side"
    )
    pure = unit[declarations[pure_start].start():declarations[pure_end + 1].start()]
    if len(pure.encode()) != 22992 or digest(pure.encode()) != PURE_SLICE_SHA256:
        raise ValueError("authenticated N4e pure-helper slice changed")
    return pure


def bind_core_support(branch: str) -> str:
    branch = branch.replace(
        "b3n9m051_FormBv1B2SelectorV2LowerPacket",
        "FormBv1B2SelectorV2LowerPacket",
    )
    for name in CORE_METHODS:
        old = f"S.{name}"
        count = branch.count(old)
        if count == 0:
            raise ValueError(f"core method was not used in branch slice: {old}")
        branch = branch.replace(old, f"(b3n9m051_coreSupport S).{name}")
    return branch


def remove_public_duplicates(core_generator, branch: str) -> str:
    for name in PUBLIC_DUPLICATES:
        block = core_generator.declaration_block(branch, name)
        if branch.count(block) != 1:
            raise ValueError(f"public duplicate is not unique: {name}")
        branch = branch.replace(block, "", 1)
    return branch


def render_solution(parent_generator, core_generator, base: Path) -> str:
    full = parent_generator.render(base)
    raw_branch = authenticated_branch_slice(full)
    branch = bind_core_support(remove_public_duplicates(core_generator, raw_branch))
    preamble = full[:full.index("-- Original module:")]
    prefix_start = full.index("-- Original module:")
    prefix_end = full.index("-- Original module: Solutions.Batch3N9.TwoCircleCrossing")
    prefix = full[prefix_start:prefix_end]
    if len(prefix.encode()) != 70922 or digest(prefix.encode()) != PREFIX_SHA256:
        raise ValueError("authenticated repaired support prefix changed")
    pure_support = authenticated_pure_slice(full).rstrip()
    assignments = []
    for name in FIELDS:
        value = f"S.{name}"
        if name in FIELDS[:5]:
            value += " Z"
        assignments.append(f"    {name} := {value}")
    result = preamble.replace(
        HEADER,
        HEADER
        + "\nimport Definitions.Def_Erdos9796FiniteNine_N4dFormBBranchSupport"
        + "\nimport Theorems.Thm_Erdos9796FiniteNine_n4e_core\n",
        1,
    ) + prefix + """

open scoped EuclideanGeometry InnerProductSpace

namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell

noncomputable def b3n9m051_coreSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) : N4eCoreSupport S :=
  Classical.choice (Erdos9796FiniteNine.n4e_core S)

""" + pure_support + "\n\n" + branch.rstrip() + """

end FiniteEndpointShell
end Problem97
end Batch3N9

/-- The middle N4e slice exports its Form B branch conclusions. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (Z : Batch3N9.Problem97.FiniteEndpointShell.ZeroDefectCapLayout S) :
    Nonempty
      (Batch3N9.Problem97.FiniteEndpointShell.N4dFormBBranchSupport S Z) := by
  exact ⟨{
""" + "\n".join(assignments) + """
  }⟩
"""
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 350 * 1024:
        raise ValueError(f"branch solution is too large: {len(result.encode())} bytes")
    return result


def render_theorem() -> str:
    return HEADER + """
import Definitions.Def_Erdos9796FiniteNine_N4dFormBBranchSupport

open scoped EuclideanGeometry

/-- The middle N4e slice supplies the branch conclusions used by the final Form B proof. -/
-- PROVE2ME_FORMAL_STATEMENT
theorem Erdos9796FiniteNine.n4d_formb_branch {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (Z : Batch3N9.Problem97.FiniteEndpointShell.ZeroDefectCapLayout S) :
    Nonempty
      (Batch3N9.Problem97.FiniteEndpointShell.N4dFormBBranchSupport S Z) := by
  sorry
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    parent = load_generator(
        base.parent / "finite-nine-child-form-b-v1/generate.py",
        "finite_nine_form_b_generator",
    )
    core = load_generator(
        base.parent / "finite-nine-n4e-core-support/generate.py",
        "finite_nine_n4e_core_generator",
    )
    full = parent.render(base)
    outputs = {
        base / "platform/Definitions/Def_Erdos9796FiniteNine_N4dFormBBranchSupport.lean":
            render_definition(core, full),
        base / "platform/Solutions/Sol_Erdos9796FiniteNine_n4d_formb_branch.lean":
            render_solution(parent, core, base),
        base / "platform/Theorems/Thm_Erdos9796FiniteNine_n4d_formb_branch.lean":
            render_theorem(),
    }
    for path, rendered in outputs.items():
        if args.check:
            if not path.is_file() or path.read_text(encoding="utf-8") != rendered:
                raise SystemExit(f"generated artifact is stale: {path}")
            print(f"PASS {path} {len(rendered.encode())} bytes {digest(rendered.encode())}")
        else:
            path.write_text(rendered, encoding="utf-8")
            print(f"wrote {path} {len(rendered.encode())} bytes {digest(rendered.encode())}")


if __name__ == "__main__":
    main()
