#!/usr/bin/env python3
"""Generate the Prove2Me packet for finite-nine common-radius circle placement."""

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

FRAGMENT_BYTES = 7289
FRAGMENT_SHA256 = "12c06a3679448b5b1e4b506db4b099ed6396e98b4e8af1a7c7831b217b8d411b"


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def authenticated_fragment(base: Path) -> str:
    path = base.parent / "finite-nine-modular/source-fragments/circle_placement.lean"
    raw = path.read_bytes()
    if len(raw) != FRAGMENT_BYTES or digest(raw) != FRAGMENT_SHA256:
        raise ValueError("authenticated circle-placement fragment changed")
    return raw.decode()


def render(base: Path) -> str:
    raw = authenticated_fragment(base)
    start = raw.index("theorem exact_cap_class_at_v1")
    end = raw.rindex("end FiniteEndpointShell")
    source_support = raw[start:end].replace(
        "S.n5_forced_m44", "S.n5_forced_m44 hN4e"
    )
    support = """section Batch3N9Unit046CirclePlacement
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell

theorem k4_at_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Erdos97.HasNEquidistantPointsAt 4 A S.triangle.v1 :=
  S.hK4 _ S.triangle.v1_mem
theorem k4_at_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Erdos97.HasNEquidistantPointsAt 4 A S.triangle.v2 :=
  S.hK4 _ S.triangle.v2_mem
theorem k4_at_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Erdos97.HasNEquidistantPointsAt 4 A S.triangle.v3 :=
  S.hK4 _ S.triangle.v3_mem
theorem n5_forced_m44
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hN4e : S.N4eCapContainment) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4 := by
  have hC1ge : 4 ≤ S.CP.C1.card := by
    rcases S.k4_at_v1 with ⟨r, hr, hcard⟩
    exact le_trans hcard (Finset.card_le_card (hN4e.1 hr hcard))
  have hC2ge : 4 ≤ S.CP.C2.card := by
    rcases S.k4_at_v2 with ⟨r, hr, hcard⟩
    exact le_trans hcard (Finset.card_le_card (hN4e.2.1 hr hcard))
  have hC3ge : 4 ≤ S.CP.C3.card := by
    rcases S.k4_at_v3 with ⟨r, hr, hcard⟩
    exact le_trans hcard (Finset.card_le_card (hN4e.2.2 hr hcard))
  have hsum := S.hcapSum12
  omega

""" + source_support
    body = (
        HEADER
        + "import Definitions.Def_Erdos9796FiniteNine_N8Interface\n\n"
        + support
        + "end FiniteEndpointShell\n"
        + "end Problem97\n"
        + "end Batch3N9\n"
        + "end Batch3N9Unit046CirclePlacement\n\n"
        + "open scoped EuclideanGeometry\n\n"
        + "theorem solution {A : Finset ℝ²}\n"
        + "    (S : Batch3N9.Problem97.FiniteEndpointShell A)\n"
        + "    (hN4e : S.N4eCapContainment) :\n"
        + "    ∃ d : ℝ, 0 < d ∧\n"
        + "      (∀ x ∈ S.CP.C1, dist S.triangle.v1 x = d) ∧\n"
        + "      (∀ x ∈ S.CP.C2, dist S.triangle.v2 x = d) ∧\n"
        + "      (∀ x ∈ S.CP.C3, dist S.triangle.v3 x = d) := by\n"
        + "  exact S.n7_circle_placement hN4e\n"
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
    output = base / "platform/Solutions/Sol_Erdos9796FiniteNine_circle_placement.lean"
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
