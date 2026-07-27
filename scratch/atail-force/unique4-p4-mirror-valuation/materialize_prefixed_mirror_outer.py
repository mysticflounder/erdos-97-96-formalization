#!/usr/bin/env python3
"""Materialize a collision-free copy of the generated mirror-outer bridge."""

from __future__ import annotations

import argparse
import re
from pathlib import Path


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "unique4-p4-mirror-outer-occurrence-bridge" / "generated"
PREFIX = "P4MirrorOuterOccurrenceBridge"
OUTPUT = HERE / PREFIX
LOCAL_IMPORT_RE = re.compile(r"^(import) ([A-Za-z][A-Za-z0-9_]*)\s*$")
NAMESPACE_MARKER = "namespace Problem97.P4MirrorOuterOccurrenceBridgeScratch\n"
SOURCE_NAMESPACE_OPENS = """\

open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourClassCapDistributionScratch
open ATailUniqueFourExactTwoBoundaryScratch
open P4DirectOuterArcAdapterScratch
"""
FAMILIES_MODULE_DOC = """/-!
Lean 4.27-compatible prefixed materialization of the generated mirror-outer families.
-/
"""
GENERATED_MODULE_DOC = """/-!
Lean 4.27-compatible prefixed materialization of generated mirror-outer data.
-/
"""
ATOM_POSITIVITY_HELPERS = """

theorem membership_var_pos {n : Nat} {atom : MembershipAtom}
    (h : atomOfVar n = .membership atom) : 1 ≤ n := by
  by_contra hn
  have : n = 0 := by omega
  subst n
  simp [atomOfVar, atomOfVarBlock00] at h

theorem row_var_pos {n : Nat} {atom : RowSupportAtom}
    (h : atomOfVar n = .row atom) : 1 ≤ n := by
  by_contra hn
  have : n = 0 := by omega
  subst n
  simp [atomOfVar, atomOfVarBlock00] at h

theorem arc_var_pos {n : Nat} {atom : OuterArcAtom}
    (h : atomOfVar n = .arc atom) : 1 ≤ n := by
  by_contra hn
  have : n = 0 := by omega
  subst n
  simp [atomOfVar, atomOfVarBlock00] at h
"""


def rewrite_local_imports(
    text: str, local_modules: set[str], module_name: str
) -> str:
    rewritten: list[str] = []
    for line in text.splitlines(keepends=True):
        bare = line.rstrip("\r\n")
        match = LOCAL_IMPORT_RE.fullmatch(bare)
        if match is None or match.group(2) not in local_modules:
            rewritten.append(line)
            continue
        newline = line[len(bare) :]
        rewritten.append(f"import {PREFIX}.{match.group(2)}{newline}")
    result = "".join(rewritten)
    if NAMESPACE_MARKER in result:
        result = result.replace(
            NAMESPACE_MARKER,
            NAMESPACE_MARKER + SOURCE_NAMESPACE_OPENS,
            1,
        )
    if module_name == "Families":
        result = result.replace(
            f"import {PREFIX}.Core\n",
            f"import {PREFIX}.Core\n\n{FAMILIES_MODULE_DOC}",
            1,
        )
        result = re.sub(r"\bvariable\b", "varIndex", result)
        result = result.replace(
            "  m1 m2 m3 m4 : Nat × MembershipAtom\n",
            "  m1 : Nat × MembershipAtom\n"
            "  m2 : Nat × MembershipAtom\n"
            "  m3 : Nat × MembershipAtom\n"
            "  m4 : Nat × MembershipAtom\n",
            1,
        )
        result = result.replace(
            "  a1 a2 a3 a4 : Nat × OuterArcAtom\n",
            "  a1 : Nat × OuterArcAtom\n"
            "  a2 : Nat × OuterArcAtom\n"
            "  a3 : Nat × OuterArcAtom\n"
            "  a4 : Nat × OuterArcAtom\n",
            1,
        )
    if module_name == "Main":
        result = result.replace(
            SOURCE_NAMESPACE_OPENS,
            SOURCE_NAMESPACE_OPENS + ATOM_POSITIVITY_HELPERS,
            1,
        )
        for index in range(1, 5):
            result = result.replace(
                f"· subst point; simpa [hc{index}] using h{index}",
                f"· subst point\n"
                f"                rw [← hc{index}]\n"
                f"                exact h{index}",
                1,
            )
        result = re.sub(
            r"litSat_neg \(by omega\) \?_⟩"
            r"(\n\s+intro h; exact h([1-4]) \(\(membership_agree)",
            lambda match: (
                f"litSat_neg (membership_var_pos hm{match.group(2)}) ?_⟩"
                f"{match.group(1)}"
            ),
            result,
        )
        result = result.replace(
            "litSat_neg (by omega) ?_⟩\n"
            "    intro h; exact hrowval ((row_agree",
            "litSat_neg (row_var_pos hrow) ?_⟩\n"
            "    intro h; exact hrowval ((row_agree",
            1,
        )
        result = re.sub(
            r"litSat_neg \(by omega\) \?_⟩"
            r"(\n\s+intro h; exact h([1-4]) \(\(arc_agree)",
            lambda match: (
                f"litSat_neg (arc_var_pos ha{match.group(2)}) ?_⟩"
                f"{match.group(1)}"
            ),
            result,
        )
        result = result.replace(
            "  | cons entry entries ih =>\n"
            "      simp only [List.all_cons, Bool.and_eq_true] at hentries\n"
            "      intro target htarget\n"
            "      simp only [List.mem_cons] at htarget\n"
            "      rcases htarget with rfl | htarget\n"
            "      · exact entry_sat Q agreement entry hentries.1\n"
            "      · exact ih hentries.2 target htarget\n",
            "  | cons head tail ih =>\n"
            "      simp only [List.all_cons, Bool.and_eq_true] at hentries\n"
            "      intro target htarget\n"
            "      simp only [List.mem_cons] at htarget\n"
            "      rcases htarget with heq | htarget\n"
            "      · subst target\n"
            "        exact entry_sat Q agreement head hentries.1\n"
            "      · exact ih hentries.2 target htarget\n",
            1,
        )
    if "/-!" not in result:
        result = re.sub(
            r"((?:^import [^\n]+\n)+)",
            rf"\1\n{GENERATED_MODULE_DOC}",
            result,
            count=1,
            flags=re.MULTILINE,
        )
    result = re.sub(
        r"(def reflectedDatum_[0-9]+ : DirectRowArcFiniteDatum :=\n)"
        r"  ⟨(⟨[^\n]+⟩), (⟨[^\n]+⟩)⟩",
        r"\1  { row := \2, arc := \3 }",
        result,
    )
    result = re.sub(
        r"(theorem bridgeChunk[0-9]+_length : [^\n]+) := by simp \[[^\n]+\]",
        r"\1 := by native_decide",
        result,
    )
    return result


def expected_outputs() -> dict[Path, str]:
    sources = sorted(SOURCE.glob("*.lean"))
    local_modules = {path.stem for path in sources}
    return {
        OUTPUT / path.name: rewrite_local_imports(
            path.read_text(), local_modules, path.stem
        )
        for path in sources
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()

    expected = expected_outputs()
    stale = [
        path
        for path, content in expected.items()
        if not path.exists() or path.read_text() != content
    ]
    if args.check:
        if stale:
            for path in stale[:20]:
                print(f"stale: {path.relative_to(HERE)}")
            return 1
        print(f"checked {len(expected)} files")
        return 0

    for path, content in expected.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_text(content)
    print(f"materialized {len(expected)} files")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
