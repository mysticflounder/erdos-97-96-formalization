#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me proof packet for the finite-nine Form-b-at-v1 child."""

from __future__ import annotations

import argparse
import hashlib
import re
from pathlib import Path

HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""
FRAGMENT_SHA256 = "d899a1396d1d9303b35fc6fbfde7d59f4582a0c808316c7e3a943dfc8721925f"
SNAPSHOT_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
PREFIX_SHA256 = "16861ab310e5d8f68b4c5aaf24e0f88e5ad8775b70793de49c4807bf55cc523f"
PREAMBLE_SHA256 = "73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c"
FORM_A_SIDE_SLICE_SHA256 = "21f638f8bd7ad839b6a73ce714c1f3c65fe626b2259c825fee934792f93075d4"
TARGET_HEADER_SHA256 = "b600c24284540190c04eb98739da46b851cd12011b3b47b85c1915624355e186"

SOURCE_FILES = {
    "TwoCircleCrossing.lean": "28880cee7b78086daa2d3446c0ad28f351e15b5dac17330ac7016380086f295c",
    "ArcBlockContiguity.lean": "d029f87259baa8ff52a4f0c23cad5d98853efa31154d779d3e041dc697c24e98",
    "U2/WitnessReflectionKernel.lean": "55345ed8d39abbd44ed1a877fee4be45f9eb83441a66b38d73c089595a87e2d0",
    "N4d/TrackBPilotSupport.lean": "5f1218cc19afd1fd19591a10c7698b057e92f7a70c41d8390f11c00ce70ee271",
    "N9Endpoint/N4e.lean": "77566bdfe7e3b1b3e944a43713bcf3c5e0b56f53bc93ec7e69bb453f8671be7a",
    "N4d/TrackBRows.lean": "b076ca1a7141d9ecd3edfe8f581f0edebfd75c4466dd66bf1bf98acae50745ee",
    "N4d/FormBLowerForcesV3.lean": "4221411571130185105e5d957fec2e5479911ccc196c0601a457092e865fa151",
    "N4d/FormBPEqBProducer.lean": "b1308d88af8fcb02e82374e27d0d9360ae45d4d34421ac03862ca7021c3e46ad",
    "N4d/BisectorKill.lean": "571bb5be97c5993fe232e1b79b43ba34202a0d499dd3d691356a4521171b9ac6",
    "A1ContextProducers.lean": "0f22e617dfdbf248c4e8a0fcf0b9ec484bb73e6b3cce0d5bfeb2eb10c0d847cc",
    "A1B2FrameNormalization.lean": "0d6159f6bb01108a67328e6fa825da730fef8c40bd7f7fddafe5b7c70e68cded",
    "N4d/FaithfulFrame.lean": "fa2728f9f697955803c2e9574cc7e768df85fe5241e94f4e22f8d63364c3c7c9",
    "N4d/Qa2Cover.lean": "92484706909f2a52fc31fd94093ef884d505058707173a14e96f0f1456352f2b",
    "N4d/FormBXb2UpperArc.lean": "e57b8617b98dfe3d3601b59d25ced1f0d8bd6d25ccc9004560ff4794e956f60d",
    "Bridge/A1SpineWiring.lean": "d0a2bcd318a9fd24709725542042043d2962a927c04674d3c13f9aabdeca591d",
    "N4d/SmallSReductions.lean": "5c42d8fe597f960a63b235fe4abe2e8efeb63c332d2f5504e03f4f295683ff7b",
    "N4d/QeqEb2PinClash.lean": "65e02901edf0e1112e08f7d780b7f3e2a1e922a0418ec96fd9c4cbca32b8870b",
    "N4d/ExcludesFormBv1.lean": "e8a008304e07147bfd575157f6938c0b22d5a050538bb5bc54282364a0a12db1",
}

THEOREM_IMPORTS = (
    "Problem97_CGN_CGN4g_strictCapBlockData_of_supportCap_oriented",
    "Problem97_CGN_CGN6b_nonacute_of_minorCapChainCoords",
    "Problem97_CGN_CGN6norm_minorCapChainModel_of_mecCapPacket",
    "Problem97_ConvexIndep_not_collinear_of_card_ge_three",
    "Problem97_ConvexIndep_not_wbtw",
    "Problem97_Dumitrescu_three_cap_decomposition",
    "Problem97_MEC_exists_nonobtuse_circumscribed_triple",
    "Problem97_MEC_no_diameter_under_k4",
    "Problem97_MEC_not_collinear_of_three_dist_eq",
    "Problem97_affineSpan_eq_top_of_not_collinear",
    "Problem97_card_ge_five_of_K4",
    "Problem97_center_same_side_as_apex_of_nonobtuse",
    "Problem97_collinear_of_signedArea2_eq_zero",
    "Problem97_exists_cut_sorted_enumeration_of_convexIndep",
    "Problem97_inner_chord_eq_two_mul_inner_midpoint",
    "Problem97_isCcwConvexPolygon_of_cut_sorted_arcAngle",
    "Problem97_signedArea2_eq_zero_iff_collinear",
    "Problem97_signedArea2_sign_eq_oangle_sign",
    "Problem97_signedArea_prod_eq_inner_mul_dist_sq",
    "Problem97_three_le_card_of_convexIndep_noncoll",
)

DEFINITION_IMPORTS = (
    "Adapter",
    "CGN_CGN",
    "CGN_CGN4g",
    "CGN_CGN6",
    "Cap_Partition",
    "Cap_PartitionFromMEC",
    "Cap_Structure",
    "CircumscribedMECPacket",
    "ConvexCyclicOrder_Construct",
    "Dumitrescu_L6",
    "Foundation",
    "IsoscelesCount",
    "MEC_ArcAngle",
    "MEC_Basic",
    "MEC_Boundary",
    "Moser_Triangle",
    "Moser_TriangleNonObtuse",
    "SignedAreaOangle",
)

PUBLIC_DUPLICATES = (
    *(f"witnessClassAt_v{i}" for i in (1, 2, 3)),
    *(f"IsForm{form}_v{i}" for i in (1, 2, 3) for form in "ABC"),
    *(f"N4dExcludesForm{form}_v{i}" for i in (1, 2, 3) for form in "ABC"),
)

SHELL_DUPLICATES = (
    "triangle",
    "triangle2",
    "triangle3",
    "packet2",
    "packet3",
    "I1",
    "I2",
    "I3",
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def declaration_header(source: str, name: str) -> str:
    match = re.search(
        rf"(?m)^(?:private\s+)?(?:noncomputable\s+)?(?:theorem|lemma|def|abbrev)\s+"
        rf"(?:[A-Za-z0-9_.]+\.)?{re.escape(name)}\b",
        source,
    )
    if match is None:
        raise ValueError(f"missing declaration {name}")
    value_start = source.find(":=", match.end())
    if value_start < 0:
        raise ValueError(f"declaration {name} has no value separator")
    return " ".join(source[match.start():value_start].split())


def remove_declaration(source: str, name: str) -> str:
    start_re = re.compile(
        rf"(?m)^(?:@\[[^\n]+\]\s+)?(?:private\s+)?(?:noncomputable\s+)?"
        rf"(?:theorem|lemma|def|abbrev|structure|inductive)\s+{re.escape(name)}\b"
    )
    matches = list(start_re.finditer(source))
    if len(matches) != 1:
        raise ValueError(f"expected one public declaration {name}, found {len(matches)}")
    next_decl = re.compile(
        r"(?m)^(?:@\[[^\n]+\]\s+)?(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+"
    ).search(source, matches[0].end())
    if next_decl is None:
        raise ValueError(f"could not find command after {name}")
    return source[:matches[0].start()] + source[next_decl.start():]


def split_units(content: str) -> dict[str, str]:
    marker = re.compile(r"(?m)^-- Original module: (Solutions\.Batch3N9\.[^\n]+)\n")
    matches = list(marker.finditer(content))
    if len(matches) != 87:
        raise ValueError(f"expected 87 authenticated source units, found {len(matches)}")
    units: dict[str, str] = {}
    for index, match in enumerate(matches):
        end = matches[index + 1].start() if index + 1 < len(matches) else len(content)
        units[match.group(1)] = content[match.start():end]
    return units


def authenticated_prefix(units: dict[str, str]) -> str:
    prefix_units = list(units.values())[:46]
    raw = "".join(prefix_units)
    if len(raw.encode()) != 76512 or digest(raw.encode()) != PREFIX_SHA256:
        raise ValueError("authenticated 46-unit prefix changed")
    shell = prefix_units[-1]
    replacements = {
        1: "show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v1 q = r)).card\n"
           "    exact hTcard",
        2: "show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v2 q = r)).card\n"
           "    exact hTcard",
        3: "show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v3 q = r)).card\n"
           "    exact hTcard",
    }
    for vertex, replacement in replacements.items():
        old = "simpa [T, triangle, Problem97.MEC.MoserTriangle.toStructural] using hTcard"
        position = shell.find(old)
        if position < 0:
            raise ValueError(f"missing Lean 4.33 shell repair at vertex {vertex}")
        shell = shell[:position] + replacement + shell[position + len(old):]
    if "simpa [T, triangle, Problem97.MEC.MoserTriangle.toStructural] using hTcard" in shell:
        raise ValueError("unexpected additional shell repair site")
    structure_start = shell.index("structure FiniteEndpointShell")
    namespace_start = shell.index("namespace FiniteEndpointShell", structure_start)
    shell = shell[:structure_start] + shell[namespace_start:]
    for name in SHELL_DUPLICATES:
        shell = remove_declaration(shell, name)
    final_start = shell.index("noncomputable def finiteEndpointShellOfCounterexample")
    final_end = shell.index("end Problem97", final_start)
    shell = shell[:final_start] + shell[final_end:]
    prefix_units[-1] = shell
    prefix = "".join(prefix_units)
    old_export = (
        "export Erdos97 (HasNEquidistantPointsAt HasNEquidistantPointsOn "
        "HasNEquidistantProperty)"
    )
    if prefix.count(old_export) != 1:
        raise ValueError("unexpected HasNEquidistantProperty export count")
    return prefix.replace(
        old_export,
        "export Erdos97 (HasNEquidistantPointsAt HasNEquidistantPointsOn)",
        1,
    ).rstrip() + "\n"


def authenticated_form_a_side_support(units: dict[str, str]) -> str:
    unit = units["Solutions.Batch3N9.N4d.ExcludesFormAv1"]
    cutoff = unit.index("theorem N4dExcludesFormA_v1_of_layout")
    support = unit[:cutoff]
    if len(support.encode()) != 19909 or digest(support.encode()) != FORM_A_SIDE_SLICE_SHA256:
        raise ValueError("authenticated Form-A side-support slice changed")
    required = (
        "theorem b3n9m054_hneg_of_cyclicShift_local",
        "theorem b3n9m054_supportCap_interval_of_oppositeFirst_local",
        "theorem c1_vertex_same_open_side_as_v3",
    )
    if any(support.count(name) != 1 for name in required):
        raise ValueError("Form-A side-support declaration set changed")
    return support.rstrip() + (
        "\n\nend FiniteEndpointShell\n"
        "end Problem97\n"
        "end Batch3N9\n"
        "end Batch3N9Unit054\n"
    )


def apply_lean_433_repairs(source: str) -> str:
    pair = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm center q1, dist_comm center q2\]\n"
        r"(?P=i)simpa \[q1, q2, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural, center\] using\s+"
        r"(?P<e>S\.Packet\.moser_on_boundary_1\.trans "
        r"S\.Packet\.moser_on_boundary_2\.symm)$"
    )
    source, pair_count = pair.subn(
        lambda m: (
            f"{m.group('i')}rw [dist_comm center q1, dist_comm center q2, "
            f"dist_eq_norm, dist_eq_norm]\n{m.group('i')}exact {m.group('e')}"
        ),
        source,
    )
    radius = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]\n"
        r"(?P=i)simpa \[q1, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using\s+"
        r"(?P<e>S\.Packet\.moser_on_boundary_1)$"
    )
    source, radius_count = radius.subn(
        lambda m: (
            f"{m.group('i')}rw [dist_comm, dist_eq_norm]\n"
            f"{m.group('i')}exact {m.group('e')}"
        ),
        source,
    )
    q3 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q3, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using "
        r"(?P<e>S\.Packet\.moser_on_boundary_3)$"
    )
    source, q3_count = q3.subn(
        lambda m: (
            f"{m.group('i')}rw [dist_comm, dist_eq_norm]; exact {m.group('e')}"
        ),
        source,
    )
    if (pair_count, radius_count, q3_count) != (4, 6, 1):
        raise ValueError(
            "Lean 4.33 repair sites changed: "
            f"found pair={pair_count}, radius={radius_count}, q3={q3_count}"
        )
    required_swap = "[SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hselector"
    if source.count(required_swap) != 1:
        raise ValueError("FormBXb2UpperArc swapI2 repair is absent or duplicated")
    return source


def render(base: Path) -> str:
    prove2me_root = base.parents[1]
    project_root = prove2me_root.parent
    fragment_path = prove2me_root / "submissions/finite-nine-modular/source-fragments/form_b_v1.lean"
    snapshot_path = prove2me_root / "scratch/live-mission-solutions.json"
    fragment_raw = fragment_path.read_bytes()
    if digest(fragment_raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated form_b_v1 fragment digest mismatch")
    snapshot_raw = snapshot_path.read_bytes()
    if digest(snapshot_raw) != SNAPSHOT_SHA256:
        raise ValueError("authenticated full-stream snapshot digest mismatch")
    import json
    rows = json.loads(snapshot_raw)
    candidates = [row for row in rows if row.get("theorem_name") == "Erdos9796Mission.finite_nine_exclusion"]
    if len(candidates) != 2:
        raise ValueError(f"expected two preserved finite-nine solutions, found {len(candidates)}")
    content = max(candidates, key=lambda row: len(row["solution"]["content"]))["solution"]["content"]
    units = split_units(content)
    first_unit = content.index("-- Original module:")
    preamble = content[:first_unit]
    if len(preamble.encode()) != 51853 or digest(preamble.encode()) != PREAMBLE_SHA256:
        raise ValueError("authenticated submission preamble changed")
    expected_imports = {
        *(f"import Definitions.Def_Erdos9796Counting_{name}" for name in DEFINITION_IMPORTS),
        *(f"import Theorems.Thm_{name}" for name in THEOREM_IMPORTS),
    }
    preamble_imports = {line for line in preamble.splitlines() if line.startswith("import ")}
    if not expected_imports <= preamble_imports or len(preamble_imports) != 84:
        raise ValueError("authenticated preamble import frontier changed")

    source_root = project_root / "lean/Erdos9796Proof/P97"
    for relative, expected in SOURCE_FILES.items():
        actual = digest((source_root / relative).read_bytes())
        if actual != expected:
            raise ValueError(f"current source digest mismatch: {relative}: {actual}")
    target_source = (source_root / "N4d/ExcludesFormBv1.lean").read_text(encoding="utf-8")
    target_header = declaration_header(target_source, "N4dExcludesFormB_v1_proof")
    if digest(target_header.encode()) != TARGET_HEADER_SHA256:
        raise ValueError("target theorem statement changed")

    body = fragment_raw.decode()
    if not body.startswith(HEADER):
        raise ValueError("authenticated fragment header changed")
    body = body[len(HEADER):].lstrip("\n")
    body = apply_lean_433_repairs(body)
    for name in PUBLIC_DUPLICATES:
        body = remove_declaration(body, name)
    side_support = authenticated_form_a_side_support(units)
    faithful_marker = "-- Original module: Solutions.Batch3N9.N4d.FaithfulFrame"
    if body.count(faithful_marker) != 1:
        raise ValueError("FaithfulFrame insertion point changed")
    body = body.replace(
        faithful_marker,
        side_support + "\n" + faithful_marker,
        1,
    )

    suffix = """
/-- The escaped Form `b` at `v₁` is impossible for a finite endpoint shell. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 :=
  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1_proof S
"""
    prefix = authenticated_prefix(units)
    result = (
        HEADER + "\nimport Definitions.Def_Erdos9796FiniteNine_N8Interface\n"
        + preamble
        + "open scoped EuclideanGeometry InnerProductSpace\n\n"
        + prefix.rstrip() + "\n\n" + body.rstrip() + suffix
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 1024 * 1024:
        raise ValueError("solution exceeds Prove2Me's one-MiB source limit")
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
