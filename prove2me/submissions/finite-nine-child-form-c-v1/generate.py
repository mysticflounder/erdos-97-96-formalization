#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me packet for the finite-nine Form-c-at-v1 child."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from pathlib import Path

HEADER = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/
"""
FRAGMENT_SHA256 = "a653d138d81fcaf23ad2e68015fbc4ccc2978dcf9f5d52f55f61535a2c6d246b"
SNAPSHOT_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
PREAMBLE_SHA256 = "73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c"
PREFIX_SHA256 = "16861ab310e5d8f68b4c5aaf24e0f88e5ad8775b70793de49c4807bf55cc523f"
N4E_DEPENDENCY_SHA256 = "09de892952067480541bb8aef6d405994934027cfe07eea2956aeb3e98dc2a73"
SUPPORT_DECLARATIONS_SHA256 = "00499f09e31b48e8a0010c5e8ca4723b95b422a6b46616ced02c3fb8b46a06e2"
TARGET_HEADER_SHA256 = "253b1f058415bfaef33ea833eb20b052a12e17f7a4b9956802fea8bbbe599296"

SOURCE_FILES = {
    "TwoCircleCrossing.lean": "28880cee7b78086daa2d3446c0ad28f351e15b5dac17330ac7016380086f295c",
    "ArcBlockContiguity.lean": "d029f87259baa8ff52a4f0c23cad5d98853efa31154d779d3e041dc697c24e98",
    "U2/WitnessReflectionKernel.lean": "55345ed8d39abbd44ed1a877fee4be45f9eb83441a66b38d73c089595a87e2d0",
    "N4d/TrackBPilotSupport.lean": "5f1218cc19afd1fd19591a10c7698b057e92f7a70c41d8390f11c00ce70ee271",
    "N9Endpoint/N4e.lean": "77566bdfe7e3b1b3e944a43713bcf3c5e0b56f53bc93ec7e69bb453f8671be7a",
    "N4d/ExcludesFormAv1.lean": "050414ccab3250ec0d8f00bcaafe84c5b7f1c62e017e9c9aecd4beaa59e50f1d",
    "N4d/FormBPEqBProducer.lean": "b1308d88af8fcb02e82374e27d0d9360ae45d4d34421ac03862ca7021c3e46ad",
    "N4d/FaithfulFrame.lean": "fa2728f9f697955803c2e9574cc7e768df85fe5241e94f4e22f8d63364c3c7c9",
    "N4d/Qa2Cover.lean": "92484706909f2a52fc31fd94093ef884d505058707173a14e96f0f1456352f2b",
    "N4d/QeqEb2PinClash.lean": "65e02901edf0e1112e08f7d780b7f3e2a1e922a0418ec96fd9c4cbca32b8870b",
    "N4d/ExcludesFormBv1.lean": "e8a008304e07147bfd575157f6938c0b22d5a050538bb5bc54282364a0a12db1",
    "N4d/FormCPEqCProducer.lean": "1e08d7e6ef79de3fb87c7d210ef385883b332c4d2d7a70fd204180be301f664a",
    "N4d/FormCLowerForcesV2.lean": "c699fcd77317640540a1346dfb1dadea10899b4e630da5c5b0ab5b806ffa7a09",
    "N4d/FormCcB1UpperArc.lean": "8cc79c5216e9db8c1068a98cb657186bf533dea0dc381c4192857ccbbd42d107",
    "N4d/FormCcA3QeqC.lean": "b1e4a63b0b8615f52f1b6f268d5650ee141514477f9fd62f4c5c0c5a26f7e391",
    "N4d/FormCQeqEb3PinClash.lean": "13640db3d5f5477f8e2b501cedb1afcafba084c3e85bc05ba07eef3415925f6a",
    "N4d/ExcludesFormCv1.lean": "4a84dd775a158ba07cd2671ea881aa7060b1eaa4d1fdb8876aa468e4967da1e2",
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
    "Adapter", "CGN_CGN", "CGN_CGN4g", "CGN_CGN6", "Cap_Partition",
    "Cap_PartitionFromMEC", "Cap_Structure", "CircumscribedMECPacket",
    "ConvexCyclicOrder_Construct", "Dumitrescu_L6", "Foundation",
    "IsoscelesCount", "MEC_ArcAngle", "MEC_Basic", "MEC_Boundary",
    "Moser_Triangle", "Moser_TriangleNonObtuse", "SignedAreaOangle",
)

SHELL_DUPLICATES = (
    "triangle", "triangle2", "triangle3", "packet2", "packet3", "I1", "I2", "I3",
)

PUBLIC_DUPLICATES = (
    *(f"witnessClassAt_v{i}" for i in (1, 2, 3)),
    *(f"IsForm{form}_v{i}" for i in (1, 2, 3) for form in "ABC"),
    *(f"N4dExcludesForm{form}_v{i}" for i in (1, 2, 3) for form in "ABC"),
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
        raise ValueError(f"expected one declaration {name}, found {len(matches)}")
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
        raise ValueError(f"expected 87 authenticated units, found {len(matches)}")
    return {
        match.group(1): content[match.start():(matches[i + 1].start() if i + 1 < len(matches) else len(content))]
        for i, match in enumerate(matches)
    }


def extract_declaration(unit: str, name: str) -> str:
    start = re.search(
        rf"(?m)^(?:@\[[^\n]+\]\s+)?(?:private\s+)?(?:noncomputable\s+)?"
        rf"(?:theorem|lemma|def|abbrev)\s+(?:[A-Za-z0-9_.]+\.)?{re.escape(name)}\b",
        unit,
    )
    if start is None:
        raise ValueError(f"authenticated declaration not found: {name}")
    next_decl = re.compile(
        r"(?m)^(?:@\[[^\n]+\]\s+)?(?:private\s+)?(?:noncomputable\s+)?"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+"
    ).search(unit, start.end())
    next_namespace = re.compile(r"(?m)^(?:namespace|end) \S+\s*$", re.MULTILINE).search(
        unit, start.end()
    )
    ends = [match.start() for match in (next_decl, next_namespace) if match is not None]
    if not ends:
        raise ValueError(f"could not delimit authenticated declaration: {name}")
    return unit[start.start():min(ends)].rstrip() + "\n"


def authenticated_prefix(units: dict[str, str]) -> str:
    prefix_units = list(units.values())[:46]
    raw = "".join(prefix_units)
    if len(raw.encode()) != 76512 or digest(raw.encode()) != PREFIX_SHA256:
        raise ValueError("authenticated 46-unit prefix changed")
    shell = prefix_units[-1]
    old = "simpa [T, triangle, Problem97.MEC.MoserTriangle.toStructural] using hTcard"
    replacements = tuple(
        "show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v"
        f"{i} q = r)).card\n    exact hTcard" for i in (1, 2, 3)
    )
    for replacement in replacements:
        position = shell.find(old)
        if position < 0:
            raise ValueError("missing Lean 4.33 shell cardinality repair")
        shell = shell[:position] + replacement + shell[position + len(old):]
    if old in shell:
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


def namespace_group(section: str, namespace: str, declarations: list[str]) -> str:
    namespace_close = "end FiniteEndpointShell\n" if namespace else ""
    return (
        f"section {section}\nnamespace Batch3N9\nopen scoped EuclideanGeometry InnerProductSpace\n"
        f"open Finset\nnamespace Problem97\n{namespace}\n"
        + "\n".join(declarations)
        + namespace_close
        + f"end Problem97\nend Batch3N9\nend {section}\n"
    )


def authenticated_support(units: dict[str, str]) -> str:
    specs = (
        ("Solutions.Batch3N9.N4d.ExcludesFormAv1", (
            "b3n9m054_hneg_of_cyclicShift_local",
            "b3n9m054_supportCap_interval_of_oppositeFirst_local",
        ), "namespace FiniteEndpointShell", "FormCSupport054"),
        ("Solutions.Batch3N9.N4d.FormBPEqBProducer", (
            "b3n9m056_v1_lt_v1v3_of_mem_I2",
        ), "namespace FiniteEndpointShell", "FormCSupport056"),
        ("Solutions.Batch3N9.N4d.FaithfulFrame", (
            "b3n9m060_dist_sq_eq_coord_sq_add_coord_sq",
            "b3n9m060_vec2_coord0", "b3n9m060_vec2_coord1",
            "b3n9m060_dist_vec2_00_10", "b3n9m060_signedArea2_chart_base",
            "b3n9m060_frame_disk", "b3n9m060_v1_mem_A",
        ), "namespace FiniteEndpointShell", "FormCSupport060"),
        ("Solutions.Batch3N9.N4d.Qa2Cover", (
            "b3n9m061_ne_of_mem_not_mem",
        ), "namespace FiniteEndpointShell", "FormCSupport061"),
        ("Solutions.Batch3N9.N4d.BisectorKill", (
            "b3n9m057_bisectorKill_dist_sq_coords",
            "b3n9m057_bisectorKill_scalar",
            "bisectorKill",
        ), "", "FormCSupport057"),
        ("Solutions.Batch3N9.N4d.QeqEb2PinClash", (
            "b3n9m065_dist_sq_coords", "b3n9m065_vec2_c0",
            "b3n9m065_vec2_c1", "b3n9m065_sa2_chart_base_local",
        ), "", "FormCSupport065"),
        ("Solutions.Batch3N9.N4d.ExcludesFormBv1", (
            "b3n9m066_v1_lt_v1v3_of_mem_I2_local",
            "b3n9m066_v1_lt_v1v2_of_mem_I3_local",
        ), "", "FormCSupport066"),
    )
    groups = []
    raw_declarations = []
    for unit_name, names, namespace, section in specs:
        declarations = [extract_declaration(units[unit_name], name) for name in names]
        raw_declarations.extend(declarations)
        groups.append(namespace_group(section, namespace, declarations))
    raw = "".join(raw_declarations).encode()
    if digest(raw) != SUPPORT_DECLARATIONS_SHA256:
        raise ValueError(
            f"authenticated support declarations changed: {len(raw)} bytes {digest(raw)}"
        )
    return "\n".join(groups)


def apply_lean_433_repairs(source: str) -> str:
    pair12 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm center q1, dist_comm center q2\]\n"
        r"(?P=i)simpa \[q1, q2, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural, center\] using\s+"
        r"(?P<e>S\.Packet\.moser_on_boundary_1\.trans S\.Packet\.moser_on_boundary_2\.symm)$"
    )
    source, pair12_count = pair12.subn(
        lambda m: f"{m.group('i')}rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]\n{m.group('i')}exact {m.group('e')}",
        source,
    )
    pair13 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm center q1, dist_comm center q2\]\n"
        r"(?P=i)simpa \[q1, q2, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural, center\] using\s+"
        r"(?P<e>S\.Packet\.moser_on_boundary_1\.trans S\.Packet\.moser_on_boundary_3\.symm)$"
    )
    source, pair13_count = pair13.subn(
        lambda m: f"{m.group('i')}rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]\n{m.group('i')}exact {m.group('e')}",
        source,
    )
    radius = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]\n"
        r"(?P=i)simpa \[q1, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using (?P<e>S\.Packet\.moser_on_boundary_1)$"
    )
    source, radius_count = radius.subn(
        lambda m: f"{m.group('i')}rw [dist_comm, dist_eq_norm]\n{m.group('i')}exact {m.group('e')}",
        source,
    )
    q1_inline = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q1, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using (?P<e>S\.Packet\.moser_on_boundary_1)$"
    )
    source, q1_inline_count = q1_inline.subn(
        lambda m: f"{m.group('i')}rw [dist_comm, dist_eq_norm]; exact {m.group('e')}", source
    )
    q3_v3 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q3, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using (?P<e>S\.Packet\.moser_on_boundary_3)$"
    )
    source, q3_v3_count = q3_v3.subn(
        lambda m: f"{m.group('i')}rw [dist_comm, dist_eq_norm]; exact {m.group('e')}", source
    )
    q3_v2 = re.compile(
        r"(?m)^(?P<i>\s*)rw \[dist_comm\]; simpa \[q3, center, dist_eq_norm, triangle, "
        r"Problem97\.MEC\.MoserTriangle\.toStructural\] using (?P<e>S\.Packet\.moser_on_boundary_2)$"
    )
    source, q3_v2_count = q3_v2.subn(
        lambda m: f"{m.group('i')}rw [dist_comm, dist_eq_norm]; exact {m.group('e')}", source
    )
    counts = (pair12_count, pair13_count, radius_count, q1_inline_count, q3_v3_count, q3_v2_count)
    if counts != (3, 3, 6, 3, 1, 2):
        raise ValueError(f"Lean 4.33 repair sites changed: {counts}")
    return source


def render(base: Path) -> str:
    prove2me_root = base.parents[1]
    project_root = prove2me_root.parent
    fragment_raw = (prove2me_root / "submissions/finite-nine-modular/source-fragments/form_c_v1.lean").read_bytes()
    if digest(fragment_raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated Form-C fragment digest mismatch")
    snapshot_raw = (prove2me_root / "scratch/live-mission-solutions.json").read_bytes()
    if digest(snapshot_raw) != SNAPSHOT_SHA256:
        raise ValueError("authenticated full-stream snapshot digest mismatch")
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
    target_source = (source_root / "N4d/ExcludesFormCv1.lean").read_text(encoding="utf-8")
    if digest(declaration_header(target_source, "N4dExcludesFormC_v1_proof").encode()) != TARGET_HEADER_SHA256:
        raise ValueError("target theorem statement changed")
    body = fragment_raw.decode()
    if not body.startswith(HEADER):
        raise ValueError("authenticated fragment header changed")
    body = body[len(HEADER):].lstrip("\n")
    dependency_values = list(units.values())[47:52]
    dependency_raw = "".join(dependency_values)
    if len(dependency_raw.encode()) != 364106 or digest(dependency_raw.encode()) != N4E_DEPENDENCY_SHA256:
        raise ValueError("authenticated N4e dependency slice changed")
    support = authenticated_support(units)
    combined = apply_lean_433_repairs(dependency_raw + "\n" + support + "\n" + body)
    for name in PUBLIC_DUPLICATES:
        combined = remove_declaration(combined, name)
    suffix = """

/-- The escaped Form `c` at `v₁` is impossible for a finite endpoint shell. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormC_v1 :=
  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v1_proof S
"""
    result = (
        HEADER
        + "\nimport Definitions.Def_Erdos9796FiniteNine_N8Interface\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_shell\n"
        + preamble
        + "open scoped EuclideanGeometry InnerProductSpace\n\n"
        + authenticated_prefix(units)
        + "\n"
        + combined.rstrip()
        + suffix
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(result.encode()) >= 1024 * 1024:
        raise ValueError(f"solution exceeds Prove2Me limit: {len(result.encode())} bytes")
    return result


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_form_c_v1.lean"
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
