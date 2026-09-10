#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the split finite-nine Form-c-at-v1 Prove2Me proof packet."""

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

PARENT_BYTES = 815_939
PARENT_SHA256 = "af6c52e92be3f505d1a43ebb9301c03bcf2aeafa4e3164aa29182fe21f566351"
DEPENDENCY_BYTES = 359_438
DEPENDENCY_SHA256 = "37de5a1b48eade0305753536a05ec531e33db2f9d2a904de65b282aee5c18db0"
RESIDUE_BYTES = 20_136
RESIDUE_SHA256 = "e19f7b2a7603fb172fb42a67c3d08d3bf7ed6c47cd40e83b6a49724675a63c9e"

RESIDUE_DECLARATIONS = (
    "formC_v1_split",
    "I1_v3_distance_chain",
    "I3_cap_order_chain",
    "b3n9m051_v1_lt_v1v2_of_mem_I3",
)

CORE_METHODS = (
    "I1_card_eq_two",
    "I2_card_eq_two",
    "I3_card_eq_two",
    "coreSelector_v1",
    "selectorShape_v2_split",
    "selectorShape_v3_split",
)

DISTANCE_WRAPPERS = (
    "b3n9m067_dist_sq_eq_coord_sq_add_coord_sq",
    "b3n9m069_dist_sq_eq_coord_sq_add_coord_sq",
    "b3n9m070_dist_sq_eq_coord_sq_add_coord_sq",
    "b3n9m071_dist_sq_coords",
)

SIGNED_AREA_WRAPPERS = (
    "b3n9m067_signedArea2_baseChord_vec2",
    "b3n9m070_signedArea2_baseChord_vec2",
)

BASE_TRANSPORT_WRAPPERS = (
    "b3n9m067_exists_base_transportData",
    "b3n9m069_exists_base_transportData",
    "b3n9m070_exists_base_transportData",
    "b3n9m071_exists_base_transportData",
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_parent_generator(base: Path):
    path = base.parent / "finite-nine-child-form-c-v1/generate.py"
    spec = importlib.util.spec_from_file_location("finite_nine_form_c_generator", path)
    if spec is None or spec.loader is None:
        raise ValueError(f"cannot load authenticated parent generator: {path}")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def declaration_matches(source: str) -> list[re.Match[str]]:
    pattern = re.compile(
        r"(?m)^(?:set_option[^\n]+ in\n)?(?:@\[[^\n]+\]\s+)?"
        r"(?:(?:private|noncomputable)\s+)*"
        r"(?:theorem|lemma|def|abbrev|structure|inductive)\s+([A-Za-z0-9_.]+)"
    )
    return list(pattern.finditer(source))


def extract_declaration(source: str, name: str) -> str:
    matches = declaration_matches(source)
    indices = [index for index, match in enumerate(matches) if match.group(1) == name]
    if len(indices) != 1:
        raise ValueError(f"expected one declaration {name}, found {len(indices)}")
    index = indices[0]
    end = matches[index + 1].start() if index + 1 < len(matches) else len(source)
    return source[matches[index].start():end]


def remove_declaration(source: str, name: str) -> str:
    matches = declaration_matches(source)
    indices = [index for index, match in enumerate(matches) if match.group(1) == name]
    if len(indices) != 1:
        raise ValueError(f"expected one declaration {name}, found {len(indices)}")
    index = indices[0]
    ends = [matches[index + 1].start()] if index + 1 < len(matches) else []
    namespace_end = re.search(
        r"(?m)^(?:namespace|section|end)\s+\S+\s*$",
        source[matches[index].end():],
    )
    if namespace_end is not None:
        ends.append(matches[index].end() + namespace_end.start())
    end = min(ends) if ends else len(source)
    return source[:matches[index].start()] + source[end:]


def authenticated_parts(full: str) -> tuple[str, str, str]:
    encoded = full.encode()
    if len(encoded) != PARENT_BYTES or digest(encoded) != PARENT_SHA256:
        raise ValueError(f"authenticated parent changed: {len(encoded)} bytes {digest(encoded)}")

    dependency_start = full.index("-- Original module: Solutions.Batch3N9.TwoCircleCrossing")
    n4e_start = full.index("-- Original module: Solutions.Batch3N9.N9Endpoint.N4e")
    support_start = full.index("section FormCSupport054", n4e_start)
    dependency = full[dependency_start:support_start]
    dependency_raw = dependency.encode()
    if len(dependency_raw) != DEPENDENCY_BYTES or digest(dependency_raw) != DEPENDENCY_SHA256:
        raise ValueError(
            f"authenticated N4e frontier changed: {len(dependency_raw)} bytes "
            f"{digest(dependency_raw)}"
        )

    n4e_unit = full[n4e_start:support_start]
    residue = "".join(extract_declaration(n4e_unit, name) for name in RESIDUE_DECLARATIONS)
    residue_raw = residue.encode()
    if len(residue_raw) != RESIDUE_BYTES or digest(residue_raw) != RESIDUE_SHA256:
        raise ValueError(
            f"authenticated Form-C residue changed: {len(residue_raw)} bytes "
            f"{digest(residue_raw)}"
        )
    return full[:dependency_start], residue, full[support_start:]


def bind_core_support(source: str) -> str:
    for name in CORE_METHODS:
        source = re.sub(rf"S\.{re.escape(name)}\b", f"(p2mCoreSupport S).{name}", source)
    source = source.replace("S.zeroDefectCapLayout", "(p2mCoreSupport S).layout")
    return source


def replace_duplicate_wrappers(source: str) -> str:
    source = source.replace(
        "Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_v1_lt_v1v2_of_mem_I3",
        "b3n9m051_v1_lt_v1v2_of_mem_I3",
    )
    replacements = {
        **{
            name: "(p2mCoreSupport S).signedArea2_baseChord_vec2"
            for name in SIGNED_AREA_WRAPPERS
        },
        **{
            name: "(p2mCoreSupport S).exists_base_transportData"
            for name in BASE_TRANSPORT_WRAPPERS
        },
    }
    for old, new in replacements.items():
        source = remove_declaration(source, old)
        source = re.sub(rf"\b{re.escape(old)}\b", new, source)

    for name in ("b3n9m060_dist_sq_eq_coord_sq_add_coord_sq", *DISTANCE_WRAPPERS):
        pattern = (
            rf"theorem {re.escape(name)} \(x y : ℝ²\) :\n"
            r"    dist x y \^ 2 = \(x 0 - y 0\) \^ 2 \+ \(x 1 - y 1\) \^ 2 := by\n"
            r"  first\n  \| exact [^\n]+\n  \| apply [^\n]+ <;> assumption"
        )
        replacement = (
            f"private theorem {name} (x y : ℝ²) :\n"
            "    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=\n"
            "  Problem97.dist_sq_coord x y"
        )
        source, count = re.subn(pattern, replacement, source)
        if count != 1:
            raise ValueError(f"failed to thin distance wrapper {name}: {count}")
    return source


def repair_private_injectivity(source: str) -> str:
    for unit in ("067", "069", "070", "071"):
        for name in ("halfShift", "flipY"):
            declaration = f"b3n9m{unit}_{name}"
            pattern = (
                rf"theorem {declaration}_injective : Function\.Injective {declaration} := by\n"
                rf"  first\n  \| exact [^\n]+\n  \| apply [^\n]+ <;> assumption"
            )
            replacement = (
                f"private theorem {declaration}_injective : Function.Injective {declaration} := by\n"
                "  intro p q hpq\n"
                "  ext i <;> fin_cases i\n"
                "  · have h := congrArg (fun z : ℝ² => z 0) hpq\n"
                f"    simpa [{declaration}, Problem97.CGN.vec2, "
                "EuclideanSpace.single_apply] using h\n"
                "  · have h := congrArg (fun z : ℝ² => z 1) hpq\n"
                f"    simpa [{declaration}, Problem97.CGN.vec2, "
                "EuclideanSpace.single_apply] using h"
            )
            source, count = re.subn(pattern, replacement, source)
            if count != 1:
                raise ValueError(f"failed to repair {declaration}_injective: {count}")
    return source


def render(base: Path) -> str:
    parent = load_parent_generator(base)
    prefix, residue, tail = authenticated_parts(parent.render(base))

    imports = (
        "import Definitions.Def_Erdos9796FiniteNine_N4dPackets\n"
        "import Theorems.Thm_Erdos9796FiniteNine_n4e_core\n"
    )
    prefix = prefix.replace(HEADER, HEADER + "\n" + imports, 1)
    support = """
section FormCSplitCore
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97

private noncomputable def p2mCoreSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) : FiniteEndpointShell.N4eCoreSupport S :=
  Classical.choice (Erdos9796FiniteNine.n4e_core S)

namespace FiniteEndpointShell
"""
    support_end = """
end FiniteEndpointShell
end Problem97
end Batch3N9
end FormCSplitCore

"""
    body = support + residue.rstrip() + "\n" + support_end + tail
    body = bind_core_support(body)
    body = replace_duplicate_wrappers(body)
    body = repair_private_injectivity(body)
    result = prefix + body

    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(result)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if "n4d_formb_branch" in result or "N4dFormBBranchSupport" in result:
        raise ValueError("unused Form-B branch support leaked into the Form-C packet")
    if len(result.encode()) >= 550 * 1024:
        raise ValueError(f"final split solution exceeds 550 KiB: {len(result.encode())} bytes")
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
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(rendered, encoding="utf-8")
    print(f"wrote {output} {len(rendered.encode())} bytes {digest(rendered.encode())}")


if __name__ == "__main__":
    main()
