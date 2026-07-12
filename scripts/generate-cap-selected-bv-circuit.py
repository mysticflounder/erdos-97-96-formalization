#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Generate the bitvector circuit and placement shards for PIN-GENERAL."""

from __future__ import annotations

from itertools import combinations
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
LEAN_ROOT = ROOT / "lean/Erdos9796Proof/P97/Census554"
CIRCUIT = LEAN_ROOT / "CapSelectedBVCircuit.lean"
CHUNK_DIR = LEAN_ROOT / "CapSelectedBVCircuitChunks"
SHARD_DIR = LEAN_ROOT / "CapSelectedBVPlacements"
HULL = (0, 9, 10, 1, 3, 4, 5, 6, 2, 7, 8)
LABELS = tuple(range(11))
PAIRS = tuple(combinations(LABELS, 2))
TRIPLES = tuple(combinations(LABELS, 3))
INTERIOR = (3, 4, 5, 6)


def cyclic_roles(width: int, order: tuple[int, ...]):
    for start in range(11):
        rotated = order[start:] + order[:start]
        for tail in combinations(rotated[1:], width - 1):
            yield (rotated[0], *tail)


def row(center: int, point: int) -> str:
    return f"rowBit rows {center} {point}"


def color(left: int, right: int) -> str:
    return f"edgeColor colors {left} {right}"


def color_eq(a: int, b: int, c: int, d: int) -> str:
    return f"({color(a, b)} == {color(c, d)})"


def bool_sum(terms: list[str]) -> str:
    pieces = [f"(bif {term} then 1#4 else 0#4)" for term in terms]
    return "(" + " + ".join(pieces) + ")"


def at_most(terms: list[str], bound: int) -> str:
    return f"({bool_sum(terms)}).ule {bound}#4"


def exactly(terms: list[str], count: int) -> str:
    return f"({bool_sum(terms)} == {count}#4)"


def cyclic_between(left: int, right: int, point: int) -> bool:
    pos = {label: index for index, label in enumerate(HULL)}
    point_offset = (pos[point] - pos[left]) % 11
    right_offset = (pos[right] - pos[left]) % 11
    return 0 < point_offset < right_offset


def separated(left: int, right: int, a: int, b: int) -> bool:
    return cyclic_between(left, right, a) != cyclic_between(left, right, b)


def write_chunk_modules(
    prefix: str, arguments: str, terms: list[str], operator: str, chunk_size: int = 256
) -> list[str]:
    names = []
    identity = "true" if operator == "&&" else "false"
    CHUNK_DIR.mkdir(exist_ok=True)
    for index in range(0, len(terms), chunk_size):
        name = f"{prefix}{index // chunk_size:03d}"
        body = f" {operator} ".join(terms[index : index + chunk_size]) or identity
        module = name[0].upper() + name[1:]
        text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVCircuitChunks.Base

namespace Problem97.Census554.CapSelectedBVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def {name} {arguments} : Bool :=
  {body}

end Problem97.Census554.CapSelectedBVCircuit
"""
        (CHUNK_DIR / f"{module}.lean").write_text(text)
        names.append(name)
    all_module = prefix[0].upper() + prefix[1:] + "All"
    imports = "\n".join(
        "import Erdos9796Proof.P97.Census554.CapSelectedBVCircuitChunks."
        + name[0].upper()
        + name[1:]
        for name in names
    )
    (CHUNK_DIR / f"{all_module}.lean").write_text(imports + "\n")
    return names


def common_terms() -> list[str]:
    terms = []
    for center in LABELS:
        terms.append(exactly([row(center, point) for point in LABELS], 4))
        terms.append(f"!{row(center, center)}")
        if center not in (0, 1, 2):
            terms.append(at_most([row(center, point) for point in (0, 1, 2)], 2))
    one_hit_sets = (
        (0, (2, 7, 8)),
        (0, (1, 9, 10)),
        (1, (2, 3, 4, 5, 6)),
        (1, (0, 9, 10)),
        (2, (1, 3, 4, 5, 6)),
        (2, (0, 7, 8)),
    )
    for center, points in one_hit_sets:
        terms.append(at_most([row(center, point) for point in points], 1))
    for left, right in PAIRS:
        terms.append(
            at_most([f"({row(left, p)} && {row(right, p)})" for p in LABELS], 2)
        )
    for a, b in PAIRS:
        terms.append(
            at_most([f"({row(c, a)} && {row(c, b)})" for c in LABELS], 2)
        )
    for left, right in PAIRS:
        for a, b in PAIRS:
            if not separated(left, right, a, b):
                terms.append(
                    f"!({row(left, a)} && {row(left, b)} && "
                    f"{row(right, a)} && {row(right, b)})"
                )
    q3_empty = (
        (0, 1, (9, 10)),
        (0, 2, (7, 8)),
        (1, 2, (3, 4, 5, 6)),
    )
    for left, right, points in q3_empty:
        terms.extend(f"!({row(left, p)} && {row(right, p)})" for p in points)
    q3_disjunctions = (
        (0, 1, (3, 4, 5, 6), (7, 8)),
        (0, 2, (3, 4, 5, 6), (9, 10)),
        (1, 2, (7, 8), (9, 10)),
    )
    for left, right, first, second in q3_disjunctions:
        empty_first = " && ".join(
            f"!({row(left, p)} && {row(right, p)})" for p in first
        )
        empty_second = " && ".join(
            f"!({row(left, p)} && {row(right, p)})" for p in second
        )
        terms.append(f"(({empty_first}) || ({empty_second}))")
    cap_s = (1, 2, 3, 4, 5, 6)
    for center in cap_s:
        terms.append(exactly([row(center, p) for p in cap_s], 1 if center < 3 else 2))
    for a, b in PAIRS:
        terms.append(color_eq(a, b, b, a))
    for center in LABELS:
        for a, b in PAIRS:
            terms.append(
                f"!({row(center, a)} && {row(center, b)}) || "
                f"{color_eq(center, a, center, b)}"
            )
    # Canonical restricted-growth names for the edge-color partition. Every
    # partition has a unique relabeling whose class name is its first edge
    # index, so this removes color-permutation symmetry without losing models.
    for index in range(121):
        left, right = divmod(index, 11)
        options = [f"({color(left, right)} == {index}#7)"]
        options.extend(
            f"({color(left, right)} == {color(*divmod(previous, 11))})"
            for previous in range(index)
        )
        terms.append("(" + " || ".join(options) + ")")
    return terms


def core_terms() -> list[str]:
    terms = []
    for p, q, r in TRIPLES:
        witnesses = [
            f"({color_eq(center, p, center, q)} && "
            f"{color_eq(center, p, center, r)})"
            for center in LABELS
        ]
        terms.append(f"!({at_most(witnesses, 1)})")
    for a in LABELS:
        for z in LABELS:
            terms.append(f"({row(1, a)} && !{row(1, z)} && {color_eq(1, a, 1, z)})")
    for a, b in PAIRS:
        witnesses = [color_eq(point, a, point, b) for point in LABELS]
        terms.append(f"!({at_most(witnesses, 2)})")
    for a, x, b, c, y in (
        *cyclic_roles(5, HULL),
        *cyclic_roles(5, tuple(reversed(HULL))),
    ):
        terms.append(
            f"({color_eq(x, a, x, b)} && {color_eq(y, a, y, b)} && "
            f"{color_eq(c, b, c, x)} && {color_eq(c, b, c, y)})"
        )
    for a, b, c, x, y, d in (
        *cyclic_roles(6, HULL),
        *cyclic_roles(6, tuple(reversed(HULL))),
    ):
        terms.append(
            f"({color_eq(a, b, b, c)} && {color_eq(a, b, c, d)} && "
            f"{color_eq(a, b, d, a)} && {color_eq(a, b, b, y)} && "
            f"{color_eq(a, b, c, y)} && {color_eq(a, b, x, d)} && "
            f"{color_eq(a, b, x, a)})"
        )
    return terms


def write_circuit() -> None:
    CHUNK_DIR.mkdir(exist_ok=True)
    base = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

namespace Problem97.Census554.CapSelectedBVCircuit

abbrev RowBits := BitVec 121
abbrev ColorBits := BitVec 847

abbrev rowBit (rows : RowBits) (center point : Nat) : Bool :=
  rows.getLsbD (11 * center + point)

abbrev edgeColor (colors : ColorBits) (left right : Nat) : BitVec 7 :=
  colors.extractLsb' (7 * (11 * left + right)) 7

end Problem97.Census554.CapSelectedBVCircuit
"""
    (CHUNK_DIR / "Base.lean").write_text(base)
    common_names = write_chunk_modules(
        "common", "(rows : RowBits) (colors : ColorBits)", common_terms(), "&&",
        chunk_size=64,
    )
    core_names = write_chunk_modules(
        "core", "(rows : RowBits) (colors : ColorBits)", core_terms(), "||"
    )
    text = """/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVCircuitChunks.CommonAll
import Erdos9796Proof.P97.Census554.CapSelectedBVCircuitChunks.CoreAll

/-!
# Generated card-eleven bitvector classifier circuit

Generated by `scripts/generate-cap-selected-bv-circuit.py`. The circuit uses
only constant-index bitvector operations so `bv_decide` can reflect it without
opaque finite quantifiers.
-/

namespace Problem97.Census554.CapSelectedBVCircuit

set_option maxRecDepth 100000

"""
    common_body = " &&\n    ".join(f"{name} rows colors" for name in common_names)
    text += f"def commonAntecedent (rows : RowBits) (colors : ColorBits) : Bool :=\n  {common_body}\n\n"
    core_body = " ||\n    ".join(f"{name} rows colors" for name in core_names)
    text += f"def prefixCore (rows : RowBits) (colors : ColorBits) : Bool :=\n  {core_body}\n\n"
    for pin in INTERIOR:
        for deleted in INTERIOR:
            if pin == deleted:
                continue
            fixed = [
                f"(rowBit rows 1 {point} == "
                + ("true" if point in (0, 7, 8, pin) else "false")
                + ")"
                for point in LABELS
            ]
            fixed.append(f"rowBit rows 0 {deleted}")
            body = " &&\n    ".join(fixed)
            text += (
                f"def antecedentP{pin}D{deleted} (rows : RowBits) "
                f"(colors : ColorBits) : Bool :=\n  commonAntecedent rows colors &&\n    {body}\n\n"
            )
    text += "end Problem97.Census554.CapSelectedBVCircuit\n"
    CIRCUIT.write_text(text)


def write_shards() -> None:
    SHARD_DIR.mkdir(exist_ok=True)
    modules = []
    for pin in INTERIOR:
        for deleted in INTERIOR:
            if pin == deleted:
                continue
            stem = f"P{pin}D{deleted}"
            modules.append(stem)
            theorem = f"prefixCore_of_p{pin}_d{deleted}"
            common_count = (len(common_terms()) + 63) // 64
            core_count = (len(core_terms()) + 255) // 256
            common_names = " ".join(
                f"common{index:03d}" for index in range(common_count)
            )
            core_names = " ".join(
                f"core{index:03d}" for index in range(core_count)
            )
            text = f"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Census554.CapSelectedBVCircuit
import Mathlib.Tactic

namespace Problem97.Census554.CapSelectedBVCircuit

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem {theorem} (rows : RowBits) (colors : ColorBits)
    (h : antecedentP{pin}D{deleted} rows colors = true) :
    prefixCore rows colors = true := by
  unfold antecedentP{pin}D{deleted} commonAntecedent at h
  unfold {common_names} at h
  unfold prefixCore
  unfold {core_names}
  bv_decide (config := {{ maxSteps := 100000000, timeout := 600 }})

end Problem97.Census554.CapSelectedBVCircuit
"""
            (SHARD_DIR / f"{stem}.lean").write_text(text)
    imports = "\n".join(
        f"import Erdos9796Proof.P97.Census554.CapSelectedBVPlacements.{module}"
        for module in modules
    )
    (SHARD_DIR / "All.lean").write_text(imports + "\n")


def main() -> None:
    write_circuit()
    write_shards()
    print(
        f"wrote {CIRCUIT.relative_to(ROOT)} and 12 placement shards; "
        f"{len(common_terms())} antecedent terms, {len(core_terms())} core terms, "
        f"{len(list(CHUNK_DIR.glob('Common*.lean')))-1} common chunks, "
        f"{len(list(CHUNK_DIR.glob('Core*.lean')))-1} core chunks"
    )


if __name__ == "__main__":
    main()
