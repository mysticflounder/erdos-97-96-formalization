#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me packet for finite-nine single-apex exhaustion."""

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

FRAGMENT_BYTES = 176_077
FRAGMENT_SHA256 = "9cbde9063b4d1e42e5f7e110019565b290fa7065b8fd6392353cd6a580ce505d"
SNAPSHOT_SHA256 = "1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58"
PREAMBLE_BYTES = 51_853
PREAMBLE_SHA256 = "73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c"
SHARED_PREFIX_BYTES = 32_828
SHARED_PREFIX_SHA256 = "2ad978b0e8296bbace3f9032a5025934bdb87e5b80516b56f11eddde5474fe83"
DEPENDENCY_UNITS_BYTES = 4_174
DEPENDENCY_UNITS_SHA256 = "aec2eb5f0bcb14c657acf5fe3646f04aeba15c75898858ebab8233551a5caa3f"
PRIVATE_CIRCLE_CALL = "S.n7_circle_placement hN4e"
PUBLIC_CIRCLE_CALL = "Erdos9796FiniteNine.circle_placement S hN4e"
EXPECTED_CIRCLE_CALLS = 8

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


def authenticated_fragment(base: Path) -> str:
    path = base.parent / "finite-nine-modular/source-fragments/single_apex_exhaustion.lean"
    raw = path.read_bytes()
    if len(raw) != FRAGMENT_BYTES or digest(raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated single-apex fragment changed")
    return raw.decode()


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
            match.start() : (matches[index + 1].start() if index + 1 < len(matches) else len(content))
        ]
        for index, match in enumerate(matches)
    }


def authenticated_shared_support(base: Path) -> tuple[str, str, str, dict[str, str]]:
    support_generator = load_support_generator(base)
    snapshot_path = base.parents[1] / "scratch/live-mission-solutions.json"
    snapshot_raw = snapshot_path.read_bytes()
    if digest(snapshot_raw) != SNAPSHOT_SHA256:
        raise ValueError("authenticated full-stream snapshot changed")
    rows = json.loads(snapshot_raw)
    candidates = [
        row
        for row in rows
        if row.get("theorem_name") == "Erdos9796Mission.finite_nine_exclusion"
    ]
    if len(candidates) != 2:
        raise ValueError(f"expected two preserved finite-nine solutions, found {len(candidates)}")
    content = max(candidates, key=lambda row: len(row["solution"]["content"]))["solution"][
        "content"
    ]
    units = support_generator.split_units(content)

    first_unit = content.index("-- Original module:")
    preamble = content[:first_unit]
    if len(preamble.encode()) != PREAMBLE_BYTES or digest(preamble.encode()) != PREAMBLE_SHA256:
        raise ValueError("authenticated submission preamble changed")

    repaired_prefix = support_generator.authenticated_prefix(units)
    repaired_units = split_available_units(repaired_prefix)
    prefix = "".join(repaired_units[name] for name in PREFIX_UNIT_NAMES)
    if len(prefix.encode()) != SHARED_PREFIX_BYTES or digest(prefix.encode()) != SHARED_PREFIX_SHA256:
        raise ValueError("authenticated repaired shared prefix changed")

    dependency_units = "".join(list(units.values())[47:50])
    if (
        len(dependency_units.encode()) != DEPENDENCY_UNITS_BYTES
        or digest(dependency_units.encode()) != DEPENDENCY_UNITS_SHA256
    ):
        raise ValueError("authenticated geometry dependency units changed")
    return preamble, prefix, dependency_units, units


def namespace_group(section: str, namespace: str, declarations: list[str]) -> str:
    namespace_open = f"namespace {namespace}\n" if namespace else ""
    namespace_close = f"end {namespace}\n" if namespace else ""
    return (
        f"section {section}\n"
        "namespace Batch3N9\n"
        "open scoped EuclideanGeometry InnerProductSpace\n"
        "open EuclideanGeometry Finset\n"
        "namespace Problem97\n"
        + namespace_open
        + "\n".join(declarations)
        + namespace_close
        + "end Problem97\n"
        + "end Batch3N9\n"
        + f"end {section}\n\n"
    )


def authenticated_extra_support(base: Path, support_generator, units: dict[str, str]) -> str:
    circle_path = base.parent / "finite-nine-child-circle-placement/generate.py"
    spec = importlib.util.spec_from_file_location("finite_nine_circle_generator", circle_path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load authenticated circle generator: {circle_path}")
    circle_generator = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(circle_generator)
    circle_source = circle_generator.render(circle_path.parent)
    circle_names = (
        "k4_at_v1",
        "k4_at_v2",
        "k4_at_v3",
        "n5_forced_m44",
        "exact_cap_class_at_v1",
        "exact_cap_class_at_v2",
        "exact_cap_class_at_v3",
    )
    circle_declarations = [
        support_generator.extract_declaration(circle_source, name) for name in circle_names
    ]

    shell_names = (
        "I1_card_ge_two",
        "I2_card_ge_two",
        "I3_card_ge_two",
        "I1_card",
        "I2_card",
        "I3_card",
        "cap1_card_ge_four_of_I1_card_ge_two",
        "cap2_card_ge_four_of_I2_card_ge_two",
        "cap3_card_ge_four_of_I3_card_ge_two",
        "n4b_n5_exact_cap_vector_of_interior_lower_bounds",
    )
    shell_unit = units["Solutions.Batch3N9.N9Endpoint.Shell"]
    shell_declarations = [
        support_generator.extract_declaration(shell_unit, name) for name in shell_names
    ]

    arc_angle_names = (
        "arcAngle_sub_arcAngle",
        "arcAngle_chord_length",
        "abs_sin_half_eq_iff",
        "arcAngle_chord_length_eq_iff",
    )
    arc_angle_unit = units["Solutions.Batch3N9.MEC.ArcAngle"]
    arc_angle_declarations = [
        support_generator.extract_declaration(arc_angle_unit, name) for name in arc_angle_names
    ]

    arc_interior_names = (
        "inner_midpoint_eq_signedArea_prod_of_chord_sphere",
        "signedArea_prod_pos_of_inner_midpoint_pos",
        "inner_chord_eq_two_mul_inner_midpoint_off_sphere",
    )
    arc_interior_unit = units["Solutions.Batch3N9.Cap.ArcInteriorPoints"]
    arc_interior_declarations = [
        support_generator.extract_declaration(arc_interior_unit, name)
        for name in arc_interior_names
    ]
    return (
        namespace_group(
            "Batch3N9SingleApexCircleSupport",
            "FiniteEndpointShell",
            circle_declarations,
        )
        + namespace_group(
            "Batch3N9SingleApexShellSupport",
            "FiniteEndpointShell",
            shell_declarations,
        )
        + namespace_group(
            "Batch3N9SingleApexArcAngleSupport", "", arc_angle_declarations
        )
        + namespace_group(
            "Batch3N9SingleApexArcInteriorSupport", "", arc_interior_declarations
        )
    )


def render(base: Path) -> str:
    support_generator = load_support_generator(base)
    preamble, prefix, dependency_units, units = authenticated_shared_support(base)
    extra_support = authenticated_extra_support(base, support_generator, units)
    raw = authenticated_fragment(base)
    marker = "-- Original module: Solutions.Batch3N9.WitnessPacketInterface"
    if raw.count(marker) != 1:
        raise ValueError("authenticated fragment has an unexpected start marker")
    support = raw[raw.index(marker) :]
    support = support_generator.remove_declaration(support, "capByIndex")
    support = support_generator.remove_declaration(support, "capInteriorByIndex")
    if support.count(PRIVATE_CIRCLE_CALL) != EXPECTED_CIRCLE_CALLS:
        raise ValueError("authenticated fragment has an unexpected circle-placement call count")
    support = support.replace(PRIVATE_CIRCLE_CALL, PUBLIC_CIRCLE_CALL)
    target = "theorem N8k_capInterior_false_of_hasNEquidistantProperty"
    if support.count(target) != 1:
        raise ValueError("authenticated fragment has an unexpected target declaration count")
    if "set_option maxHeartbeats 1600000 in\ntheorem N8k_single_apex_false" not in support:
        raise ValueError("authenticated fragment lost the N8k heartbeat scope")

    body = (
        HEADER
        + "import Definitions.Def_Erdos9796FiniteNine_N8Interface\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_circle_placement\n\n"
        + preamble
        + prefix
        + dependency_units
        + extra_support
        + support
        + "\nopen scoped EuclideanGeometry\n\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A)\n"
        + "    (hN4e : S.N4eCapContainment)\n"
        + "    (hK4 : Batch3N9.Problem97.HasNEquidistantProperty 4 A)\n"
        + "    {x : ℝ²} {i : Fin 3} (hxcap : x ∈ S.capInteriorByIndex i) :\n"
        + "    False := by\n"
        + "  exact S.N8k_capInterior_false_of_hasNEquidistantProperty hN4e hK4 hxcap\n"
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(body)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if re.search(r"^import\s+Solutions\.", body, flags=re.MULTILINE):
        raise ValueError("generated solution imports a solution module")
    if len(body.encode()) >= 1024 * 1024:
        raise ValueError(f"solution exceeds Prove2Me limit: {len(body.encode())} bytes")
    return body


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    output = (
        base
        / "platform/Solutions/Sol_Erdos9796FiniteNine_single_apex_exhaustion.lean"
    )
    rendered = render(base)
    if args.check:
        if not output.is_file() or output.read_text(encoding="utf-8") != rendered:
            raise SystemExit(f"generated artifact is stale: {output}")
        print(f"PASS {output} {len(rendered.encode())} bytes {digest(rendered.encode())}")
        return
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(rendered, encoding="utf-8")
    print(f"wrote {output} {len(rendered.encode())} bytes {digest(rendered.encode())}")


if __name__ == "__main__":
    main()
