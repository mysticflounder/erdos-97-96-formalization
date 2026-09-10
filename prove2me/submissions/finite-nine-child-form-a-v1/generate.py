#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me packet for the finite-nine Form-a-at-v1 child."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import re
from pathlib import Path

HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""

FRAGMENT_SHA256 = "89d122f909ca616d7dfae2f4d8f51ae3f02776660103e5c436a663cd34f8a8ed"
SNAPSHOT_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
PREAMBLE_SHA256 = "73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c"
SHARED_PREFIX_SHA256 = "2ad978b0e8296bbace3f9032a5025934bdb87e5b80516b56f11eddde5474fe83"
DEPENDENCY_UNITS_SHA256 = "aec2eb5f0bcb14c657acf5fe3646f04aeba15c75898858ebab8233551a5caa3f"
GEOMETRY_SUPPORT_SHA256 = "10bdd393311b7a17c02eb52f1a8f58914da2d7c1a8a2279d846977da4dcb95f9"
TARGET_HEADER_SHA256 = "da2c99e5fc7d7da7ac9b36359ea318147190939242bf22310b730af4dc82e3b3"

SOURCE_FILES = {
    "N4d/FormAEndpointPairKill.lean":
        "994947e0d70ae3f5a3d351a1895d4111d7ea656a08a1cb4373d95f4609f7285a",
    "N4d/ExcludesFormAv1.lean":
        "050414ccab3250ec0d8f00bcaafe84c5b7f1c62e017e9c9aecd4beaa59e50f1d",
}

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


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_support_generator(base: Path):
    path = base.parent / "finite-nine-child-form-c-v1/generate.py"
    spec = importlib.util.spec_from_file_location("finite_nine_form_c_generator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load authenticated support generator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def split_available_units(content: str) -> dict[str, str]:
    marker = re.compile(r"(?m)^-- Original module: (Solutions\.Batch3N9\.[^\n]+)\n")
    matches = list(marker.finditer(content))
    return {
        match.group(1): content[
            match.start():(matches[index + 1].start() if index + 1 < len(matches) else len(content))
        ]
        for index, match in enumerate(matches)
    }


def apply_lean_433_repairs(source: str) -> str:
    pair = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm center q1, dist_comm center q2\]\n"
        r"(?P=i)simpa \[q1, q2, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural, center\] using\s+"
        r"(?P<e>S\.Packet\.moser_on_boundary_1\.trans S\.Packet\.moser_on_boundary_3\.symm)$"
    )
    source, pair_count = pair.subn(
        lambda match: (
            f"{match.group('i')}rw [dist_comm center q1, dist_comm center q2, "
            f"dist_eq_norm, dist_eq_norm]\n{match.group('i')}exact {match.group('e')}"
        ),
        source,
    )
    q1 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q1, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using "
        r"(?P<e>S\.Packet\.moser_on_boundary_1)$"
    )
    source, q1_count = q1.subn(
        lambda match: f"{match.group('i')}rw [dist_comm, dist_eq_norm]; exact {match.group('e')}",
        source,
    )
    q3 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q3, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using "
        r"(?P<e>S\.Packet\.moser_on_boundary_2)$"
    )
    source, q3_count = q3.subn(
        lambda match: f"{match.group('i')}rw [dist_comm, dist_eq_norm]; exact {match.group('e')}",
        source,
    )
    if (pair_count, q1_count, q3_count) != (1, 1, 1):
        raise ValueError(
            "Lean 4.33 repair sites changed: "
            f"found center-pair={pair_count}, q1-radius={q1_count}, q3-radius={q3_count}"
        )
    return source


def bind_core_support(source: str) -> str:
    replacements = {
        "S.I2_card_eq_two": "(p2mCoreSupport S).I2_card_eq_two",
        "S.coreSelector_v1": "(p2mCoreSupport S).coreSelector_v1",
        "S.selectorShape_v2_split": "(p2mCoreSupport S).selectorShape_v2_split",
        "S.c2_vertex_same_open_side_as_v3":
            "(p2mCoreSupport S).c2_vertex_same_open_side_as_v3",
        "S.zeroDefectCapLayout": "(p2mCoreSupport S).layout",
        "S.selectorShape_v3": "p2mSelectorShape_v3 S",
    }
    expected = {
        "S.I2_card_eq_two": 3,
        "S.coreSelector_v1": 2,
        "S.selectorShape_v2_split": 1,
        "S.c2_vertex_same_open_side_as_v3": 2,
        "S.zeroDefectCapLayout": 1,
        "S.selectorShape_v3": 1,
    }
    for old, new in replacements.items():
        count = source.count(old)
        if count != expected[old]:
            raise ValueError(f"core-support binding count changed for {old}: {count}")
        source = source.replace(old, new)
    return source


def authenticated_geometry_support(support_generator, units: dict[str, str]) -> str:
    declarations = (
        support_generator.extract_declaration(
            units["Solutions.Batch3N9.Cap.ArcInteriorPoints"],
            "inner_midpoint_eq_signedArea_prod_of_chord_sphere",
        ),
        support_generator.extract_declaration(
            units["Solutions.Batch3N9.Cap.ArcInteriorPoints"],
            "signedArea_prod_pos_trans",
        ),
        support_generator.extract_declaration(
            units["Solutions.Batch3N9.Cap.ArcInteriorPoints"],
            "signedArea_prod_pos_of_inner_midpoint_pos",
        ),
        support_generator.extract_declaration(
            units["Solutions.Batch3N9.SignedAreaOangle"],
            "signedArea2_eq_stdOrientation_areaForm",
        ),
    )
    raw = "".join(declarations).encode()
    if len(raw) != 2772 or digest(raw) != GEOMETRY_SUPPORT_SHA256:
        raise ValueError("authenticated geometry-support declarations changed")
    return (
        "section Batch3N9FormAGeometrySupport\n"
        "namespace Batch3N9\n"
        "open scoped EuclideanGeometry InnerProductSpace\n"
        "namespace Problem97\n"
        + "\n".join(declarations)
        + "end Problem97\n"
        "end Batch3N9\n"
        "end Batch3N9FormAGeometrySupport\n\n"
    )


CORE_SUPPORT = """
section Batch3N9FormASupport
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
namespace FiniteEndpointShell

noncomputable def p2mCoreSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) : N4eCoreSupport S :=
  Classical.choice (Erdos9796FiniteNine.n4e_core S)

/-- Reconstruct the unsplit selector shape from the public three-case support field. -/
theorem p2mSelectorShape_v3 {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v3 r
      T.card = 4 ∧
      S.I3 ⊆ T ∧
      ∃ p q : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        q ∈ ({Z.a2, Z.b2, S.triangle.v1} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C2 = ({q} : Finset ℝ²) := by
  classical
  rcases (p2mCoreSupport S).selectorShape_v3_split Z with ⟨r, hr, hshape⟩
  dsimp at hshape
  rcases hshape with ⟨hTcard, hI3sub, hcase⟩
  refine ⟨r, hr, ?_⟩
  dsimp
  rcases hcase with h | h | h
  · rcases h with ⟨p, hp, hpC1, hv1C2⟩
    exact ⟨hTcard, hI3sub, p, S.triangle.v1, hp, by simp, hpC1, hv1C2⟩
  · rcases h with ⟨p, hp, hpC1, ha2C2⟩
    exact ⟨hTcard, hI3sub, p, Z.a2, hp, by simp, hpC1, ha2C2⟩
  · rcases h with ⟨p, hp, hpC1, hb2C2⟩
    exact ⟨hTcard, hI3sub, p, Z.b2, hp, by simp, hpC1, hb2C2⟩

end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9FormASupport
"""


def render(base: Path) -> str:
    support_generator = load_support_generator(base)
    prove2me_root = base.parents[1]
    project_root = prove2me_root.parent
    fragment_raw = (
        prove2me_root / "submissions/finite-nine-modular/source-fragments/form_a_v1.lean"
    ).read_bytes()
    if len(fragment_raw) != 171986 or digest(fragment_raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated Form-A fragment changed")
    snapshot_raw = (prove2me_root / "scratch/live-mission-solutions.json").read_bytes()
    if digest(snapshot_raw) != SNAPSHOT_SHA256:
        raise ValueError("authenticated full-stream snapshot changed")
    rows = json.loads(snapshot_raw)
    candidates = [
        row for row in rows
        if row.get("theorem_name") == "Erdos9796Mission.finite_nine_exclusion"
    ]
    if len(candidates) != 2:
        raise ValueError(f"expected two preserved finite-nine solutions, found {len(candidates)}")
    content = max(candidates, key=lambda row: len(row["solution"]["content"]))["solution"]["content"]
    units = support_generator.split_units(content)
    first_unit = content.index("-- Original module:")
    preamble = content[:first_unit]
    if len(preamble.encode()) != 51853 or digest(preamble.encode()) != PREAMBLE_SHA256:
        raise ValueError("authenticated submission preamble changed")
    expected_imports = {
        *(f"import Definitions.Def_Erdos9796Counting_{name}"
          for name in support_generator.DEFINITION_IMPORTS),
        *(f"import Theorems.Thm_{name}" for name in support_generator.THEOREM_IMPORTS),
    }
    preamble_imports = {line for line in preamble.splitlines() if line.startswith("import ")}
    if not expected_imports <= preamble_imports or len(preamble_imports) != 84:
        raise ValueError("authenticated preamble import frontier changed")

    repaired_prefix = support_generator.authenticated_prefix(units)
    repaired_units = split_available_units(repaired_prefix)
    prefix = "".join(repaired_units[name] for name in PREFIX_UNIT_NAMES)
    if len(prefix.encode()) != 32828 or digest(prefix.encode()) != SHARED_PREFIX_SHA256:
        raise ValueError("authenticated repaired shared prefix changed")
    geometry_support = authenticated_geometry_support(support_generator, units)

    dependency_raw = "".join(list(units.values())[47:50])
    if len(dependency_raw.encode()) != 4174 or digest(dependency_raw.encode()) != DEPENDENCY_UNITS_SHA256:
        raise ValueError("authenticated units 047-049 changed")

    source_root = project_root / "lean/Erdos9796Proof/P97"
    for relative, expected in SOURCE_FILES.items():
        actual = digest((source_root / relative).read_bytes())
        if actual != expected:
            raise ValueError(f"current source digest mismatch: {relative}: {actual}")
    target_source = (source_root / "N4d/ExcludesFormAv1.lean").read_text(encoding="utf-8")
    target_header = support_generator.declaration_header(
        target_source, "N4dExcludesFormA_v1_proof"
    )
    if digest(target_header.encode()) != TARGET_HEADER_SHA256:
        raise ValueError("current Form-A theorem statement changed")

    body = fragment_raw.decode()
    if not body.startswith(HEADER):
        raise ValueError("authenticated Form-A fragment header changed")
    body = body[len(HEADER):].lstrip("\n")
    body = apply_lean_433_repairs(body)
    body = bind_core_support(body)

    imports = (
        "import Definitions.Def_Erdos9796FiniteNine_N4dPackets\n"
        "import Theorems.Thm_Erdos9796FiniteNine_n4e_core\n"
        "import Theorems.Thm_Erdos9796FiniteNine_form_b_v2\n"
    )
    suffix = """

open scoped EuclideanGeometry

/-- The escaped Form `a` at `v₁` is impossible for a finite endpoint shell. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A)
    (_hB2 : S.N4dExcludesFormB_v2) :
    S.N4dExcludesFormA_v1 :=
  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v1_proof S
    (Erdos9796FiniteNine.form_b_v2 S)
"""
    result = (
        HEADER
        + "\n"
        + imports
        + preamble
        + prefix
        + geometry_support
        + dependency_raw
        + CORE_SUPPORT
        + body.rstrip()
        + suffix
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 400 * 1024:
        raise ValueError(f"Form-A solution exceeds 400 KiB: {len(result.encode())} bytes")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_form_a_v1.lean"
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
