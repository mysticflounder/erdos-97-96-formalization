#!/usr/bin/env python3
"""Generate the Prove2Me packet for finite-nine N4 cap containment."""

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

FRAGMENT_BYTES = 808
FRAGMENT_SHA256 = "c1dce51523622316761cc2066704591ce1c958a473de61c0dad445e05613c071"
N4E_TAIL_BYTES = 52954
N4E_TAIL_SHA256 = "521a9c821ae591fc7e4edfb7d2578bdb646178d0973f81c010a483e541c33850"
PARENT_BYTES = 374744
PARENT_SHA256 = "261fc4de1e90b0bafb3fdba4f40f8406bbd526e00deda3930259d92203d3fc12"

HELPERS = (
    "selectorShape_v2_q_eq_v1_forces_v3",
    "selectorShape_v2_q_eq_v1_exact_packet",
    "selectorShape_v2_q_eq_v1_exact_packet_of_b2",
    "v1v3_longer_than_base_of_exact_packet_of_b2",
    "selectorShape_v3_q_eq_v1_impossible_of_b2_exact_packet",
)
FORMS = ("n4c_forms_v1", "n4c_forms_v2", "n4c_forms_v3")
CLASS_ALIASES = ("N4cClassifies_v1", "N4cClassifies_v2", "N4cClassifies_v3")
CLASSIFIERS = ("n4cClassifies_v1", "n4cClassifies_v2", "n4cClassifies_v3")
EXCLUSION_ALIASES = ("N4dExcludes_v1", "N4dExcludes_v2", "N4dExcludes_v3")
FORM_EXCLUSIONS = (
    "n4dExcludes_v1_of_forms",
    "n4dExcludes_v2_of_forms",
    "n4dExcludes_v3_of_forms",
)


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_parent_generator(base: Path):
    path = base.parent / "finite-nine-child-form-b-v1-split/generate.py"
    spec = importlib.util.spec_from_file_location("finite_nine_form_b_split_generator", path)
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
    found = [index for index, match in enumerate(matches) if match.group(1) == name]
    if len(found) != 1:
        raise ValueError(f"expected one declaration {name}, found {len(found)}")
    index = found[0]
    end = matches[index + 1].start() if index + 1 < len(matches) else len(source)
    return source[matches[index].start():end]


def authenticated_fragment(base: Path) -> str:
    path = base.parent / "finite-nine-modular/source-fragments/cap_containment.lean"
    raw = path.read_bytes()
    if len(raw) != FRAGMENT_BYTES or digest(raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated cap-containment fragment changed")
    return raw.decode()


def authenticated_tail(base: Path) -> str:
    parent = load_parent_generator(base)
    split_base = base.parent / "finite-nine-child-form-b-v1-split"
    monolithic = parent.load_parent_generator(split_base)
    monolithic_stream = monolithic.render(split_base)
    path = base.parent / (
        "finite-nine-child-form-b-v1-split/platform/Solutions/"
        "Sol_Erdos9796FiniteNine_form_b_v1.lean"
    )
    raw = path.read_bytes()
    if len(raw) != PARENT_BYTES or digest(raw) != PARENT_SHA256:
        raise ValueError("authenticated Form-B split solution changed")
    # The split renderer binds the monolithic stream to accepted support records;
    # extract from that bound N4e unit after checking the immutable tail digest.
    tail = parent.authenticated_parts(monolithic_stream)[2]
    tail_raw = tail.encode()
    if len(tail_raw) != N4E_TAIL_BYTES or digest(tail_raw) != N4E_TAIL_SHA256:
        raise ValueError("authenticated Form-B/N4e tail changed")
    split_source = raw.decode()
    start = split_source.index("section Batch3N9Unit051")
    end = split_source.index("end Batch3N9Unit051", start)
    return split_source[start:end]


def render(base: Path) -> str:
    # The fragment authenticates the final source declaration.  The parent tail
    # authenticates the minimal classification bridge and its immediate support.
    fragment = authenticated_fragment(base)
    tail = authenticated_tail(base)
    names = HELPERS + FORMS + CLASS_ALIASES + CLASSIFIERS + EXCLUSION_ALIASES + FORM_EXCLUSIONS
    declarations = "\n".join(extract_declaration(tail, name).rstrip() for name in names)
    support = """
section Batch3N9Unit051CapContainment
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell

private noncomputable def p2mCoreSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) : N4eCoreSupport S :=
  Classical.choice (Erdos9796FiniteNine.n4e_core S)

private noncomputable def p2mBranchSupport {A : Finset ℝ²}
    (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) :
    N4dFormBBranchSupport S Z :=
  Classical.choice (Erdos9796FiniteNine.n4d_formb_branch S Z)

"""
    # Replace the parent packet's local support name with this packet's private one.
    declarations = re.sub(r"\bS\.p2mCoreSupport\b", "(p2mCoreSupport S)", declarations)
    declarations = declarations.replace(
        "end FiniteEndpointShell\nend Problem97\nend Batch3N9\nend Batch3N4",
        "",
    )
    body = (
        HEADER
        + "import Definitions.Def_Erdos9796FiniteNine_N4dPackets\n"
        + "import Definitions.Def_Erdos9796FiniteNine_N4dFormBBranchSupport\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_n4e_core\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_n4d_formb_branch\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_a_v1\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_b_v1\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_b_v2\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_c_v1\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_cyclic_forms\n\n"
        + support
        + declarations
        + "\n"
        + fragment[fragment.index("theorem n4eCapContainment_of_n4c_n4d"):].rstrip()
        + "\n\nend FiniteEndpointShell\nend Problem97\nend Batch3N9\n"
        + "end Batch3N9Unit051CapContainment\n\n"
        + "open scoped EuclideanGeometry\n\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A)\n"
        + "    (hA1 : S.N4dExcludesFormA_v1) (hB1 : S.N4dExcludesFormB_v1)\n"
        + "    (hC1 : S.N4dExcludesFormC_v1) (hB2 : S.N4dExcludesFormB_v2)\n"
        + "    (hcyclic : S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧\n"
        + "      S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧ S.N4dExcludesFormC_v3) :\n"
        + "    S.N4eCapContainment := by\n"
        + "  rcases hcyclic with ⟨hA2, hC2, hA3, hB3, hC3⟩\n"
        + "  exact S.n4eCapContainment_of_n4c_n4d\n"
        + "    S.n4cClassifies_v1 S.n4cClassifies_v2 S.n4cClassifies_v3\n"
        + "    (S.n4dExcludes_v1_of_forms hA1 (Erdos9796FiniteNine.form_b_v1 S) hC1)\n"
        + "    (S.n4dExcludes_v2_of_forms hA2 hB2 hC2)\n"
        + "    (S.n4dExcludes_v3_of_forms hA3 hB3 hC3)\n"
    )
    forbidden = re.compile(
        r"\b(sorry|sorryAx|native_decide|unsafe|partial|implemented_by|extern|axiom)\b"
        r"|Lean\.(?:ofReduceBool|ofReduceNat|trustCompiler)"
    )
    hit = forbidden.search(body)
    if hit:
        raise ValueError(f"forbidden proof/trust token: {hit.group(0)}")
    if len(body.encode()) >= 1024 * 1024:
        raise ValueError(f"solution exceeds Prove2Me limit: {len(body.encode())} bytes")
    return body


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_cap_containment.lean"
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
