#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me packet for the finite-nine Form-b-at-v2 child."""

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

TARGET_FRAGMENT_SHA256 = "dd805a29601e3b8fa2290b87ac62bb338f0a616914c1b4d050359ea079058437"
CYCLIC_FRAGMENT_SHA256 = "246d74d5159947ad68c26e2725fa6af7e62b9226a28968a0f5319d3f1087e32c"
CURRENT_MODULE_SHA256 = "edbf1d9caed20389ae0b93b9f13ea65433b6ae9230b7a85a53e45b1f408e794c"
TARGET_HEADER_SHA256 = "4e9345900b2af7106cccc0550fce33876ccaeef68a82670f44f285a1c1ea2006"


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def declaration_header(source: str, name: str) -> str:
    start = source.index(f"theorem {name}")
    end = source.index(":= by", start)
    return source[start:end].rstrip() + "\n"


def slice_between(source: str, start: str, end: str) -> str:
    return source[source.index(start):source.index(end, source.index(start))].rstrip() + "\n"


def authenticated_support(cyclic: str) -> str:
    prefix = slice_between(
        cyclic,
        "-- Original module: Solutions.Batch3N9.N4d.CyclicTransport",
        "noncomputable def b3n9m073_cyclicShift3MT",
    )
    witness = slice_between(
        cyclic,
        "theorem cyclicShift_witnessClassAt_v1",
        "theorem cyclicShift3_witnessClassAt_v1",
    )
    cp = slice_between(
        cyclic,
        "theorem cyclicShift_CP_C1",
        "theorem cyclicShift3_CP_C1",
    )
    form = slice_between(
        cyclic,
        "theorem isFormB_v1_cyclicShift",
        "theorem isFormC_v1_cyclicShift",
    )
    support = prefix + "\n" + witness + "\n" + cp + "\n" + form
    required = (
        "b3n9m073_cyclicShiftMT",
        "b3n9m073_cyclicShift_hCirc",
        "b3n9m073_not_mem_verts_of_not_mem_cyclicShift_verts",
        "b3n9m073_cyclicShiftCP",
        "b3n9m073_cyclicShiftPacket",
        "cyclicShift",
        "cyclicShift_witnessClassAt_v1",
        "cyclicShift_CP_C1",
        "isFormB_v1_cyclicShift",
    )
    if any(support.count(name) < 1 for name in required):
        raise ValueError("authenticated cyclic-transport support changed")
    excluded = (
        "cyclicShift3",
        "N4dExcludesFormA_v2_proof",
        "N4dExcludesFormC_v2_proof",
        "N4dExcludesFormA_v3_proof",
        "N4dExcludesFormB_v3_proof",
        "N4dExcludesFormC_v3_proof",
    )
    if any(name in support for name in excluded):
        raise ValueError("cyclic-transport slice retained an unrelated declaration")
    return support


def render(base: Path) -> str:
    submissions = base.parent
    target_path = submissions / "finite-nine-modular/source-fragments/form_b_v2.lean"
    cyclic_path = submissions / "finite-nine-modular/source-fragments/cyclic_forms.lean"
    target_raw = target_path.read_bytes()
    cyclic_raw = cyclic_path.read_bytes()
    if len(target_raw) != 644 or digest(target_raw) != TARGET_FRAGMENT_SHA256:
        raise ValueError("authenticated Form-b-at-v2 fragment changed")
    if len(cyclic_raw) != 12271 or digest(cyclic_raw) != CYCLIC_FRAGMENT_SHA256:
        raise ValueError("authenticated cyclic-transport fragment changed")

    project_root = base.parents[2]
    current_module = project_root / "lean/Erdos9796Proof/P97/N4d/CyclicTransport.lean"
    current_raw = current_module.read_bytes()
    if digest(current_raw) != CURRENT_MODULE_SHA256:
        raise ValueError(f"current cyclic-transport module changed: {digest(current_raw)}")
    current = current_raw.decode()
    current_header = declaration_header(current, "N4dExcludesFormB_v2_proof")
    if digest(current_header.encode()) != TARGET_HEADER_SHA256:
        raise ValueError("current Form-b-at-v2 theorem statement changed")

    target = target_raw.decode()
    if digest(declaration_header(target, "N4dExcludesFormB_v2_proof").encode()) != TARGET_HEADER_SHA256:
        raise ValueError("authenticated fragment theorem statement changed")
    target = target[target.index("theorem N4dExcludesFormB_v2_proof"):].rstrip() + "\n"
    predecessor = "N4dExcludesFormB_v1_proof (S.cyclicShift)"
    if target.count(predecessor) != 1:
        raise ValueError("authenticated predecessor application changed")
    target = target.replace(
        predecessor,
        "Erdos9796FiniteNine.form_b_v1 (S.cyclicShift)",
        1,
    )

    support = authenticated_support(cyclic_raw.decode())
    result = (
        HEADER
        + "\nimport Definitions.Def_Erdos9796FiniteNine_N8Interface\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_b_v1\n\n"
        + "/-! Authenticated cyclic relabelling support for the Form `b` exclusion at `v₂`. -/\n\n"
        + "open scoped EuclideanGeometry\n\n"
        + support
        + "\n"
        + target
        + "\nend FiniteEndpointShell\nend Problem97\nend Batch3N9\nend Batch3N9Unit073\n\n"
        + "/-- The escaped Form `b` at `v₂` is impossible for a finite endpoint shell. -/\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A) :\n"
        + "    S.N4dExcludesFormB_v2 :=\n"
        + "  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v2_proof S\n"
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
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_form_b_v2.lean"
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
