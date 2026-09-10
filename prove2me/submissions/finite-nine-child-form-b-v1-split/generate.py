#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the final timeout-safe finite-nine Form-b-at-v1 proof packet."""

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

PREAMBLE_SHA256 = "1148c0b03db9a2924a77cb8979729fa2a2d05501a076b6fbb154c8cbe1b845b8"
PREFIX_SHA256 = "de54e8fa7392016f93e362aaf20192a3f9d12f7458b1b5c0f32e3980474de8c5"
N4E_TAIL_SHA256 = "521a9c821ae591fc7e4edfb7d2578bdb646178d0973f81c010a483e541c33850"
FINAL_UNITS_SHA256 = "20630740f80ea4c74731c6ce6e5c0abfa3c45030744ef130dcd1f8412939fd95"
V1_ORDER_SHA256 = "95297ec55a10f79ee0d3e0ba550df66064cf867e3e49fe313c0eb9c91cac70a6"
PEQB_SUPPORT_SHA256 = "a2ea721d9eb44449d7db49dfa74cee75829ac05dd4310575bf63297d2ff5abf1"
PREFIX_UNIT_NAMES = (
    "Solutions.Batch3N9.Foundation",
    "Solutions.Batch3N9.ConvexIndepHelpers",
    "Solutions.Batch3N9.Cap.PartitionFromMEC",
    "Solutions.Batch3N9.CGN.CGN",
    "Solutions.Batch3N9.Moser.NonDeg",
    "Solutions.Batch3N9.ConvexCyclicOrder.Construct",
    "Solutions.Batch3N9.CGN.CGN4g",
    "Solutions.Batch3N9.CGN.CGN6",
    "Solutions.Batch3N9.N9Endpoint.N4a",
)
HELPER_UNIT_SHA256 = {
    "Solutions.Batch3N9.N4d.FormBLowerForcesV3":
        "dee38604280322058ecfc6723ccf4bdb624e1a5c422654f8dd3a94704264f83b",
    "Solutions.Batch3N9.N4d.FormBPEqBProducer":
        "07547b39ca9d5ad2778183a1a295834b289e29933e5af5f320cf551797515de0",
    "Solutions.Batch3N9.N4d.BisectorKill":
        "6f3657bd63a2118f2ba0c3d672c4a650d64c0e26850ee10fb5e06095ae77e8fe",
    "Solutions.Batch3N9.N4d.ExcludesFormAv1":
        "c36b1f7e65916327a60da3686c87628ef2ea55f929f5aa2fb2eb5b07f8ed7e41",
}

CORE_METHODS = (
    "I1_card_eq_two",
    "I2_card_eq_two",
    "I3_card_eq_two",
    "coreSelector_v1",
    "coreSelector_v2",
    "coreSelector_v3",
    "formB_v1_split",
    "selectorShape_v2_split",
    "selectorShape_v3_split",
    "qEqE_capOrder_opposite",
    "selectorShape_v3_q_eq_v1_impossible",
    "c2_vertex_same_open_side_as_v3",
)

BRANCH_POSITIONAL_METHODS = (
    "n4d_bB_2_q_eq_v1_impossible",
    "n4d_bA_2_q_eq_v1_impossible",
    "n4d_bA_2_q_eq_C_impossible",
    "qEqE_row_impossible_of_reflection",
    "qEqE_lowerArc_impossible",
    "qEqE_lowerArc_impossible_flipped",
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


def declaration_matches(source: str) -> list[re.Match[str]]:
    pattern = re.compile(
        r"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        r"(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+([A-Za-z0-9_.]+)"
    )
    return list(pattern.finditer(source))


def authenticated_parts(full: str) -> tuple[str, str, str, str, str, str, str]:
    first_unit = full.index("-- Original module:")
    preamble = full[:first_unit]
    if len(preamble.encode()) != 52106 or digest(preamble.encode()) != PREAMBLE_SHA256:
        raise ValueError("authenticated repaired preamble changed")

    prefix_end = full.index("-- Original module: Solutions.Batch3N9.TwoCircleCrossing")
    prefix = full[first_unit:prefix_end]
    if len(prefix.encode()) != 70922 or digest(prefix.encode()) != PREFIX_SHA256:
        raise ValueError("authenticated repaired prerequisite prefix changed")

    n4e_start = full.index("-- Original module: Solutions.Batch3N9.N9Endpoint.N4e")
    n4e_end = full.index("-- Original module: Solutions.Batch3N9.N4d.TrackBRows", n4e_start)
    n4e_unit = full[n4e_start:n4e_end]
    declarations = declaration_matches(n4e_unit)
    lower_index = next(
        i for i, match in enumerate(declarations)
        if match.group(1) == "qEqE_lowerArc_impossible_flipped"
    )
    n4e_tail = n4e_unit[declarations[lower_index + 1].start():]
    if len(n4e_tail.encode()) != 52954 or digest(n4e_tail.encode()) != N4E_TAIL_SHA256:
        raise ValueError("authenticated N4e final slice changed")

    final_start = full.index("-- Original module: Solutions.Batch3N9.N4d.FaithfulFrame")
    final_end = full.rindex("\n/-- The escaped Form")
    final_units = full[final_start:final_end]
    if len(final_units.encode()) != 159329 or digest(final_units.encode()) != FINAL_UNITS_SHA256:
        raise ValueError("authenticated final module slice changed")
    marker = re.compile(r"(?m)^-- Original module: (Solutions\.Batch3N9\.[^\n]+)\n")
    matches = list(marker.finditer(full))
    units = {
        match.group(1): full[match.start():(
            matches[index + 1].start() if index + 1 < len(matches) else len(full)
        )]
        for index, match in enumerate(matches)
    }
    prefix = "".join(units[name] for name in PREFIX_UNIT_NAMES)
    if len(prefix.encode()) != 32828:
        raise ValueError("authenticated prerequisite prefix selection changed")

    helper_units = []
    for name, expected in HELPER_UNIT_SHA256.items():
        unit = units[name]
        if digest(unit.encode()) != expected:
            raise ValueError(f"authenticated repaired helper unit changed: {name}")
        helper_units.append(unit)
    v1_start = full.index("theorem b3n9m051_v1_lt_v1v2_of_mem_I3")
    peqb_start = full.index("theorem b3n9m051_pEqB_lower_apex_dist_contradiction", v1_start)
    peqb_end = full.index("theorem b3n9m051_qEqC_reflection_below_contradiction", peqb_start)
    v1_order = full[v1_start:peqb_start]
    peqb_support = full[peqb_start:peqb_end]
    if digest(v1_order.encode()) != V1_ORDER_SHA256:
        raise ValueError("authenticated I3 radial-order helper changed")
    if digest(peqb_support.encode()) != PEQB_SUPPORT_SHA256:
        raise ValueError("authenticated pEqB row-support slice changed")
    return (
        preamble, prefix, n4e_tail, "".join(helper_units), final_units,
        v1_order, peqb_support,
    )


def bind_support_records(source: str) -> str:
    for name in CORE_METHODS:
        source = re.sub(
            rf"S\.{re.escape(name)}\b",
            f"(p2mCoreSupport S).{name}",
            source,
        )
    source = source.replace("S.zeroDefectCapLayout", "(p2mCoreSupport S).layout")

    named_branch = (
        "S.v1v3_longer_than_base_of_exact_packet (Z := Z.swapI2)"
    )
    source = source.replace(
        named_branch,
        "(p2mBranchSupport S Z.swapI2).v1v3_longer_than_base_of_exact_packet",
    )
    source = source.replace(
        "S.selectorShape_v3_q_eq_a2_impossible_of_exact_packet\n      (Z := Z.swapI2)",
        "(p2mBranchSupport S Z.swapI2).selectorShape_v3_q_eq_a2_impossible_of_exact_packet\n     ",
    )
    for name in BRANCH_POSITIONAL_METHODS[:3]:
        source = source.replace(
            f"S.{name} Z",
            f"(p2mBranchSupport S Z).{name}",
        )
    for name in BRANCH_POSITIONAL_METHODS[3:]:
        source = re.sub(
            rf"S\.{re.escape(name)}\b",
            f"(p2mBranchSupport S Z).{name}",
            source,
        )
    return source


def repair_final_wrappers(source: str) -> str:
    source = re.sub(
        r"theorem b3n9m060_dist_sq_eq_coord_sq_add_coord_sq \(x y : ℝ²\) :\n"
        r"    dist x y \^ 2 = \(x 0 - y 0\) \^ 2 \+ \(x 1 - y 1\) \^ 2 := by\n"
        r"  first\n  \| exact [^\n]+\n  \| apply [^\n]+ <;> assumption",
        "theorem b3n9m060_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :\n"
        "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=\n"
        "  Problem97.dist_sq_coord x y",
        source,
    )
    for name in ("halfShift", "flipY"):
        pattern = (
            rf"theorem b3n9m060_{name}_injective : Function\.Injective "
            rf"b3n9m060_{name} := by\n  first\n  \| exact [^\n]+\n"
            rf"  \| apply [^\n]+ <;> assumption"
        )
        replacement = (
            f"theorem b3n9m060_{name}_injective : Function.Injective "
            f"b3n9m060_{name} := by\n"
            "  intro p q hpq\n"
            "  ext i <;> fin_cases i\n"
            "  · have h := congrArg (fun z : ℝ² => z 0) hpq\n"
            f"    simpa [b3n9m060_{name}, Problem97.CGN.vec2, "
            "EuclideanSpace.single_apply] using h\n"
            "  · have h := congrArg (fun z : ℝ² => z 1) hpq\n"
            f"    simpa [b3n9m060_{name}, Problem97.CGN.vec2, "
            "EuclideanSpace.single_apply] using h"
        )
        source, count = re.subn(pattern, replacement, source)
        if count != 1:
            raise ValueError(f"failed to repair {name} injectivity wrapper")
    source = re.sub(
        r"theorem b3n9m060_exists_base_transportData\n(?:.|\n)*?"
        r"(?=theorem b3n9m060_vec2_coord0)",
        "",
        source,
    )
    source = source.replace(
        "b3n9m060_exists_base_transportData S.triangle.v1 "
        "S.triangle.v2 S.triangle.v12_ne",
        "(p2mCoreSupport S).exists_base_transportData S.triangle.v1 "
        "S.triangle.v2 S.triangle.v12_ne",
    )
    return source


def bind_peqb_support(source: str) -> str:
    replacements = {
        "b3n9m051_dist_sq_eq_coord_sq_add_coord_sq":
            "b3n9m060_dist_sq_eq_coord_sq_add_coord_sq",
        "b3n9m051_halfShiftSimilarityTransportData":
            "b3n9m060_halfShiftSimilarityTransportData",
        "b3n9m051_halfShift": "b3n9m060_halfShift",
        "b3n9m051_flipYSimilarityTransportData":
            "b3n9m060_flipYSimilarityTransportData",
        "b3n9m051_flipY": "b3n9m060_flipY",
        "b3n9m051_similarityTransportComp": "b3n9m060_similarityTransportComp",
        "b3n9m051_exists_base_transportData":
            "(p2mCoreSupport S).exists_base_transportData",
        "b3n9m051_signedArea2_baseChord_vec2":
            "(p2mCoreSupport S).signedArea2_baseChord_vec2",
    }
    for old, new in replacements.items():
        source = source.replace(old, new)
    return source


def render(base: Path) -> str:
    parent = load_parent_generator(base)
    full = parent.render(base)
    (
        preamble, prefix, n4e_tail, helper_units, final_units,
        v1_order, peqb_support,
    ) = authenticated_parts(full)
    selector_packet = """
/-- The selector packet used by the retained Form-B tail. -/
def SelectorV3SplitPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  ((∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))

/-- The p = v₂ rows used by the retained Form-B producer. -/
def SelectorV3Pv2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))

"""
    faithful_end = final_units.index(
        "-- Original module: Solutions.Batch3N9.N4d.Qa2Cover"
    )
    faithful = final_units[:faithful_end]
    final_rest = final_units[faithful_end:]
    helper_parts = {}
    helper_matches = list(re.finditer(r"(?m)^-- Original module: ([^\n]+)\n", helper_units))
    for index, match in enumerate(helper_matches):
        end = helper_matches[index + 1].start() if index + 1 < len(helper_matches) else len(helper_units)
        helper_parts[match.group(1)] = helper_units[match.start():end]
    peqb_section = (
        "\nsection Batch3N9Unit051PeqB\n"
        "namespace Batch3N9\n"
        "open scoped EuclideanGeometry\n"
        "open Finset\n"
        "namespace Problem97\n"
        "namespace FiniteEndpointShell\n"
        + v1_order
        + bind_peqb_support(peqb_support)
        + "\nend FiniteEndpointShell\n"
        "end Problem97\n"
        "end Batch3N9\n"
        "end Batch3N9Unit051PeqB\n"
    )
    ordered_body = (
        selector_packet + n4e_tail + "\n"
        + helper_parts["Solutions.Batch3N9.N4d.BisectorKill"]
        + helper_parts["Solutions.Batch3N9.N4d.ExcludesFormAv1"]
        + faithful
        + peqb_section
        + helper_parts["Solutions.Batch3N9.N4d.FormBLowerForcesV3"]
        + helper_parts["Solutions.Batch3N9.N4d.FormBPEqBProducer"]
        + final_rest
    )
    body = bind_support_records(ordered_body)
    body = repair_final_wrappers(body)
    imports = (
        "import Definitions.Def_Erdos9796FiniteNine_N4dPackets\n"
        "import Definitions.Def_Erdos9796FiniteNine_N4dFormBBranchSupport\n"
        "import Theorems.Thm_Erdos9796FiniteNine_n4e_core\n"
        "import Theorems.Thm_Erdos9796FiniteNine_n4d_formb_branch\n"
    )
    preamble = preamble.replace(HEADER, HEADER + "\n" + imports, 1)
    support = """
section Batch3N9Unit051
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell

noncomputable def p2mCoreSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) : N4eCoreSupport S :=
  Classical.choice (Erdos9796FiniteNine.n4e_core S)

noncomputable def p2mBranchSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) :
    N4dFormBBranchSupport S Z :=
  Classical.choice (Erdos9796FiniteNine.n4d_formb_branch S Z)

"""
    suffix = """
/-- The escaped Form `b` at `v₁` is impossible for a finite endpoint shell. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 :=
  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1_proof S
"""
    result = preamble + prefix + support + body.rstrip() + suffix
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 400 * 1024:
        raise ValueError(f"final split solution exceeds 400 KiB: {len(result.encode())} bytes")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_form_b_v1.lean"
    rendered = render(base)
    if args.check:
        if not output.is_file() or output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"generated artifact is stale: {output}")
        print(f"PASS {output} {len(rendered.encode())} bytes {digest(rendered.encode())}")
        return
    output.write_text(rendered, encoding="utf-8")
    print(f"wrote {output} {len(rendered.encode())} bytes {digest(rendered.encode())}")


if __name__ == "__main__":
    main()
