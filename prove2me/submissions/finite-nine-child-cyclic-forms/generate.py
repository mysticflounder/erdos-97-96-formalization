#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>
"""Generate the Prove2Me packet for the finite-nine cyclic-form child."""

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

FRAGMENT_SHA256 = "246d74d5159947ad68c26e2725fa6af7e62b9226a28968a0f5319d3f1087e32c"
FRAGMENT_BYTES = 12271
CURRENT_MODULE_SHA256 = "edbf1d9caed20389ae0b93b9f13ea65433b6ae9230b7a85a53e45b1f408e794c"
TARGET_HEADER_SHA256 = "8bd6c7bbb546ff6ec28eff7a9646e5a56ce4942e36b17c25dcfb5a6bef8c34bf"


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def declaration_header(source: str, qualified_name: str) -> str:
    marker = f"theorem {qualified_name}"
    start = source.index(marker)
    end = source.index(":= by", start)
    return source[start:end].rstrip() + "\n"


def authenticated_source(base: Path) -> str:
    path = base.parent / "finite-nine-modular/source-fragments/cyclic_forms.lean"
    raw = path.read_bytes()
    if len(raw) != FRAGMENT_BYTES or digest(raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated cyclic-forms fragment changed")
    source = raw.decode()
    if not source.startswith(HEADER):
        raise ValueError("authenticated fragment header changed")
    replacements = {
        "N4dExcludesFormA_v1_proof": "Erdos9796FiniteNine.form_a_v1",
        "N4dExcludesFormB_v1_proof": "Erdos9796FiniteNine.form_b_v1",
        "N4dExcludesFormC_v1_proof": "Erdos9796FiniteNine.form_c_v1",
    }
    body = source[len(HEADER):]
    for private_name, public_name in replacements.items():
        count = body.count(private_name)
        if count == 0:
            raise ValueError(f"missing source-private dependency {private_name}")
        body = body.replace(private_name, public_name)
    if any(name in body for name in replacements):
        raise ValueError("source-private predecessor remained after public substitution")
    required = (
        "b3n9m073_cyclicShiftMT", "b3n9m073_cyclicShift3MT", "cyclicShift",
        "cyclicShift3", "N4dExcludesFormA_v2_proof", "N4dExcludesFormC_v2_proof",
        "N4dExcludesFormA_v3_proof", "N4dExcludesFormB_v3_proof",
        "N4dExcludesFormC_v3_proof", "isFormA_v1_cyclicShift3",
        "isFormB_v1_cyclicShift3", "isFormC_v1_cyclicShift3",
    )
    if any(name not in body for name in required):
        raise ValueError("authenticated cyclic support is incomplete")
    return body


def render(base: Path) -> str:
    packet_root = base.parents[1]
    project_root = base.parents[2]
    target_path = packet_root / "submissions/finite-nine-stage3-theorems/platform/Theorems/Thm_Erdos9796FiniteNine_cyclic_forms.lean"
    target = target_path.read_text(encoding="utf-8")
    target_header = declaration_header(target, "Erdos9796FiniteNine.cyclic_forms")
    if digest(target_header.encode()) != TARGET_HEADER_SHA256:
        raise ValueError("target theorem statement changed")
    current = project_root / "lean/Erdos9796Proof/P97/N4d/CyclicTransport.lean"
    if digest(current.read_bytes()) != CURRENT_MODULE_SHA256:
        raise ValueError("current cyclic-transport module changed")
    body = authenticated_source(base)
    result = (
        HEADER
        + "\nimport Definitions.Def_Erdos9796FiniteNine_N8Interface\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_a_v1\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_b_v1\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_b_v2\n"
        + "import Theorems.Thm_Erdos9796FiniteNine_form_c_v1\n\n"
        + "/-! Authenticated cyclic relabelling support for all remaining forms. -/\n\n"
        + "open scoped EuclideanGeometry\n\n"
        + body
        + "\n/-- The remaining finite-nine cyclic forms are excluded. -/\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A) :\n"
        + "    S.N4dExcludesFormA_v2 ∧ S.N4dExcludesFormC_v2 ∧\n"
        + "    S.N4dExcludesFormA_v3 ∧ S.N4dExcludesFormB_v3 ∧\n"
        + "    S.N4dExcludesFormC_v3 :=\n"
        + "  ⟨Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v2_proof S,\n"
        + "    Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v2_proof S,\n"
        + "    Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormA_v3_proof S,\n"
        + "    Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v3_proof S,\n"
        + "    Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormC_v3_proof S⟩\n"
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
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_cyclic_forms.lean"
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
