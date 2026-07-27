#!/usr/bin/env python3
"""Generate a compact-source Lean BitVec circuit for the certified surface.

The generated circuit has 1,139 source bits: three 13x13 row tables, thirteen
4-bit blockers, the exact-five shell, two 4-bit frontier roles, the first-apex
double-deletion row, and 78 seven-bit distance ranks.  It expands source
predicates directly; it does not embed the DIMACS or Tseitin variables.
"""

from __future__ import annotations

import itertools
from pathlib import Path


HERE = Path(__file__).resolve().parent
CHUNKS = HERE / "ExactFiveCard13BVCircuitChunks"
MAIN = HERE / "ExactFiveCard13BVCircuit.lean"
N = 13
VERTICES = tuple(range(N))
PAIRS = tuple(itertools.combinations(VERTICES, 2))
QUADS = tuple(itertools.combinations(VERTICES, 4))
FIRST = 4
SECOND = 8
SURPLUS = frozenset((4, 5, 6, 7, 8))
OPP1 = frozenset((8, 9, 10, 11, 12, 0))
PHYSICAL = frozenset((0, 1, 2, 3, 4))
PHYSICAL_INTERIOR = frozenset((1, 2, 3))
STRICT_FIRST = tuple(sorted(OPP1 - SURPLUS - PHYSICAL))
CAPS = (SURPLUS, OPP1, PHYSICAL)
ENDPOINTS = ((4, 8), (8, 0), (0, 4))
FAMILIES = (0, 1, 2)
EDGE_INDEX = {pair: index for index, pair in enumerate(PAIRS)}
ARGS = (
    "(rows : RowBits) (blockers : BlockerBits) (shell : ShellBits) "
    "(q w : RoleBits) (b1 : FirstRowBits) (ranks : RankBits)"
)


def row(family: int, center: int, point: int) -> str:
    return f"rowBit rows {family} {center} {point}"


def b1(point: int) -> str:
    return f"firstRowBit b1 {point}"


def shell(point: int) -> str:
    return f"shellBit shell {point}"


def blocker_eq(source: int, center: int) -> str:
    return f"(blockerAt blockers {source} == {center}#4)"


def role_eq(role: str, point: int) -> str:
    return f"({role} == {point}#4)"


def rank(left: int, right: int) -> str:
    pair = tuple(sorted((left, right)))
    return f"rankAtom ranks {EDGE_INDEX[pair]}"


def bool_sum(terms: list[str]) -> str:
    return "(" + " + ".join(f"(bif {term} then 1#4 else 0#4)" for term in terms) + ")"


def exactly(terms: list[str], value: int) -> str:
    return f"({bool_sum(terms)} == {value}#4)"


def at_most(terms: list[str], value: int) -> str:
    return f"({bool_sum(terms)}).ule {value}#4"


def at_least(terms: list[str], value: int) -> str:
    return f"({value}#4).ule {bool_sum(terms)}"


def disjoin(terms) -> str:
    items = list(terms)
    return "(" + " || ".join(items) + ")" if items else "false"


def imply(left: str, right: str) -> str:
    return f"(!({left}) || ({right}))"


def role_member(role: str, family: int, center: int) -> str:
    return disjoin(
        f"({role_eq(role, point)} && {row(family, center, point)})"
        for point in VERTICES
    )


def member_at_blocker(source: int, point: int) -> str:
    return disjoin(
        f"({blocker_eq(source, center)} && {row(0, center, point)})"
        for center in VERTICES
    )


def same_linear_side(left: int, right: int, a: int, b: int) -> bool:
    return (left < a < right) == (left < b < right)


def family_terms(family: int) -> list[str]:
    terms: list[str] = []
    for center in VERTICES:
        terms.append(exactly([row(family, center, p) for p in VERTICES], 4))
        terms.append(f"!{row(family, center, center)}")
    for left, right in PAIRS:
        terms.append(at_most([
            f"({row(family, left, p)} && {row(family, right, p)})"
            for p in VERTICES
        ], 2))
    for a, b in PAIRS:
        terms.append(at_most([
            f"({row(family, center, a)} && {row(family, center, b)})"
            for center in VERTICES
        ], 2))
    for left, right in PAIRS:
        remaining = [p for p in VERTICES if p not in {left, right}]
        for a, b in itertools.combinations(remaining, 2):
            if same_linear_side(left, right, a, b):
                terms.append(
                    f"!({row(family, left, a)} && {row(family, left, b)} && "
                    f"{row(family, right, a)} && {row(family, right, b)})"
                )
    for cap, endpoints in zip(CAPS, ENDPOINTS, strict=True):
        for center in sorted(cap):
            terms.append(at_most([row(family, center, p) for p in sorted(cap)], 2))
        for center in endpoints:
            terms.append(at_most([row(family, center, p) for p in sorted(cap)], 1))
        outside = sorted(set(VERTICES) - set(cap))
        for left, right in itertools.combinations(sorted(cap), 2):
            for a, b in itertools.combinations(outside, 2):
                terms.append(
                    f"!({row(family, left, a)} && {row(family, left, b)} && "
                    f"{row(family, right, a)} && {row(family, right, b)})"
                )
    return terms


def cross_family_terms() -> list[str]:
    terms: list[str] = []
    for first_family, second_family in itertools.combinations(FAMILIES, 2):
        for left, right in PAIRS:
            for left_family, right_family in (
                (first_family, second_family), (second_family, first_family)
            ):
                terms.append(at_most([
                    f"({row(left_family, left, p)} && {row(right_family, right, p)})"
                    for p in VERTICES
                ], 2))
                remaining = [p for p in VERTICES if p not in {left, right}]
                for a, b in itertools.combinations(remaining, 2):
                    if same_linear_side(left, right, a, b):
                        terms.append(
                            f"!({row(left_family, left, a)} && {row(left_family, left, b)} && "
                            f"{row(right_family, right, a)} && {row(right_family, right, b)})"
                        )
        for cap in CAPS:
            outside = sorted(set(VERTICES) - set(cap))
            for left, right in itertools.combinations(sorted(cap), 2):
                for left_family, right_family in (
                    (first_family, second_family), (second_family, first_family)
                ):
                    for a, b in itertools.combinations(outside, 2):
                        terms.append(
                            f"!({row(left_family, left, a)} && {row(left_family, left, b)} && "
                            f"{row(right_family, right, a)} && {row(right_family, right, b)})"
                        )
    return terms


def b1_geometry_terms() -> list[str]:
    terms: list[str] = []
    for family in FAMILIES:
        for center in VERTICES:
            if center == FIRST:
                continue
            terms.append(at_most([
                f"({b1(p)} && {row(family, center, p)})" for p in VERTICES
            ], 2))
            left, right = sorted((FIRST, center))
            remaining = [p for p in VERTICES if p not in {left, right}]
            for a, b in itertools.combinations(remaining, 2):
                if same_linear_side(left, right, a, b):
                    terms.append(
                        f"!({b1(a)} && {b1(b)} && {row(family, center, a)} && "
                        f"{row(family, center, b)})"
                    )
        for cap in CAPS:
            if FIRST not in cap:
                continue
            outside = sorted(set(VERTICES) - set(cap))
            for center in sorted(cap - {FIRST}):
                for a, b in itertools.combinations(outside, 2):
                    terms.append(
                        f"!({b1(a)} && {b1(b)} && {row(family, center, a)} && "
                        f"{row(family, center, b)})"
                    )
    for a, b in PAIRS:
        center_hits = []
        for center in VERTICES:
            occurrences = [
                f"({row(family, center, a)} && {row(family, center, b)})"
                for family in FAMILIES
            ]
            if center == FIRST:
                occurrences.append(f"({b1(a)} && {b1(b)})")
            center_hits.append(disjoin(occurrences))
        terms.append(at_most(center_hits, 2))
    return terms


def parent_terms() -> list[str]:
    terms: list[str] = []
    terms.extend((
        f"!{shell(SECOND)}",
        exactly([shell(p) for p in VERTICES], 5),
        *(shell(p) for p in sorted(PHYSICAL_INTERIOR)),
        exactly([shell(p) for p in sorted(SURPLUS - {SECOND})], 1),
        exactly([shell(p) for p in sorted(OPP1 - {SECOND})], 1),
    ))
    terms.extend(imply(row(0, SECOND, p), shell(p)) for p in VERTICES)
    for source in VERTICES:
        terms.append(f"(blockerAt blockers {source}).ult 13#4")
        terms.append(f"!{blocker_eq(source, source)}")
        terms.append(f"!{blocker_eq(source, FIRST)}")
        terms.append(f"!{blocker_eq(source, SECOND)}")
        terms.append(member_at_blocker(source, source))
    for center in VERTICES:
        image = disjoin(blocker_eq(source, center) for source in VERTICES)
        for family in (1, 2):
            for point in VERTICES:
                terms.append(imply(
                    image,
                    f"({row(family, center, point)} == {row(0, center, point)})",
                ))
    for family in (1, 2):
        terms.extend(imply(row(family, SECOND, p), shell(p)) for p in VERTICES)
    off_surplus = sorted(set(VERTICES) - set(SURPLUS))
    for role in ("q", "w"):
        terms.append(f"{role}.ult 13#4")
        terms.append(disjoin(role_eq(role, p) for p in off_surplus))
    terms.append("!(q == w)")
    terms.append(role_member("q", 0, FIRST))
    terms.append(role_member("w", 0, FIRST))
    terms.append(f"!{role_member('q', 0, SECOND)}")
    terms.append(f"!{role_member('w', 0, SECOND)}")
    terms.append(exactly([b1(p) for p in VERTICES], 4))
    terms.append(f"!{b1(FIRST)}")
    terms.append(f"!{disjoin(f'({role_eq("q", p)} && {b1(p)})' for p in VERTICES)}")
    terms.append(f"!{disjoin(f'({role_eq("w", p)} && {b1(p)})' for p in VERTICES)}")
    terms.append(at_most([f"({b1(p)} && {row(0, SECOND, p)})" for p in VERTICES], 2))
    for cap, endpoints in zip(CAPS, ENDPOINTS, strict=True):
        if FIRST in cap:
            terms.append(at_most([b1(p) for p in sorted(cap)], 2))
        if FIRST in endpoints:
            terms.append(at_most([b1(p) for p in sorted(cap)], 1))
    hub, spokes = 2, (1, 3)
    for family, spoke in zip((1, 2), spokes, strict=True):
        for center in VERTICES:
            terms.append(f"!({row(family, center, hub)} && {row(family, center, spoke)})")
    for source in VERTICES:
        for spoke in spokes:
            terms.append(f"!({member_at_blocker(source, hub)} && {member_at_blocker(source, spoke)})")
    return terms


def role_terms() -> list[str]:
    terms = [
        at_least([row(0, FIRST, p) for p in STRICT_FIRST], 2),
        at_least([b1(p) for p in STRICT_FIRST], 2),
        disjoin((role_member("q", 0, FIRST), role_member("w", 0, FIRST))),
        disjoin(
            [f"({role_eq('q', p)} && {row(0, FIRST, p)})" for p in STRICT_FIRST]
            + [f"({role_eq('w', p)} && {row(0, FIRST, p)})" for p in STRICT_FIRST]
        ),
    ]
    complete = [f"({row(0, FIRST, p)} || {b1(p)})" for p in VERTICES]
    terms.append(exactly(complete, 6))
    terms.extend(f"({row(0, FIRST, p)} || {b1(p)})" for p in STRICT_FIRST)
    for family in (1, 2):
        meets = disjoin(
            f"({row(family, FIRST, p)} && {complete[p]})" for p in VERTICES
        )
        subset = "(" + " && ".join(
            imply(row(family, FIRST, p), complete[p]) for p in VERTICES
        ) + ")"
        terms.append(imply(meets, subset))
    return terms


def asymmetric_terms(source: int, third: int) -> list[str]:
    hub = 2
    terms = [
        blocker_eq(source, hub),
        row(0, hub, source),
        row(0, hub, third),
    ]
    terms.extend(f"!{row(0, hub, p)}" for p in sorted(PHYSICAL - {source, third}))
    terms.extend(f"!{member_at_blocker(hub, p)}" for p in sorted(PHYSICAL_INTERIOR - {hub}))
    return terms


def ordinal_terms() -> list[str]:
    terms = [f"(rankAtom ranks {index}).ult 78#7" for index in range(len(PAIRS))]
    for family in FAMILIES:
        for center in VERTICES:
            targets = [p for p in VERTICES if p != center]
            for left, right in itertools.combinations(targets, 2):
                terms.append(imply(
                    f"({row(family, center, left)} && {row(family, center, right)})",
                    f"({rank(center, left)} == {rank(center, right)})",
                ))
    targets = [p for p in VERTICES if p != FIRST]
    for left, right in itertools.combinations(targets, 2):
        terms.append(imply(
            f"({b1(left)} && {b1(right)})",
            f"({rank(FIRST, left)} == {rank(FIRST, right)})",
        ))
    targets = [p for p in VERTICES if p != SECOND]
    for left, right in itertools.combinations(targets, 2):
        terms.append(imply(
            f"({shell(left)} && {shell(right)})",
            f"({rank(SECOND, left)} == {rank(SECOND, right)})",
        ))
    for a, b, c, d in QUADS:
        positive = ((a, c), (b, d))
        for negative in (((a, b), (c, d)), ((a, d), (b, c))):
            for positive_index in range(2):
                for negative_index in range(2):
                    canceled_positive = rank(*positive[positive_index])
                    canceled_negative = rank(*negative[negative_index])
                    remaining_positive = rank(*positive[1 - positive_index])
                    remaining_negative = rank(*negative[1 - negative_index])
                    terms.append(imply(
                        f"({canceled_positive} == {canceled_negative})",
                        f"({remaining_negative}).ult ({remaining_positive})",
                    ))
    return terms


def write_chunk(name: str, terms: list[str]) -> None:
    body = " &&\n    ".join(terms) if terms else "true"
    module = name[0].upper() + name[1:]
    text = f"""/- Generated by generate_bv_circuit.py. -/
import ExactFiveCard13BVCircuitChunks.Base

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0
set_option linter.unusedVariables false

def {name} {ARGS} : Bool :=
  {body}

end Problem97.ATailExactFiveCard13BVCircuit
"""
    (CHUNKS / f"{module}.lean").write_text(text, encoding="utf-8")


def main() -> None:
    CHUNKS.mkdir(exist_ok=True)
    base = """/- Generated by generate_bv_circuit.py. -/
namespace Problem97.ATailExactFiveCard13BVCircuit

abbrev RowBits := BitVec 507
abbrev BlockerBits := BitVec 52
abbrev ShellBits := BitVec 13
abbrev RoleBits := BitVec 4
abbrev FirstRowBits := BitVec 13
abbrev RankBits := BitVec 546

abbrev rowBit (rows : RowBits) (family center point : Nat) : Bool :=
  rows.getLsbD (169 * family + 13 * center + point)

abbrev blockerAt (blockers : BlockerBits) (source : Nat) : BitVec 4 :=
  blockers.extractLsb' (4 * source) 4

abbrev shellBit (shell : ShellBits) (point : Nat) : Bool :=
  shell.getLsbD point

abbrev firstRowBit (row : FirstRowBits) (point : Nat) : Bool :=
  row.getLsbD point

abbrev rankAtom (ranks : RankBits) (index : Nat) : BitVec 7 :=
  ranks.extractLsb' (7 * index) 7

end Problem97.ATailExactFiveCard13BVCircuit
"""
    (CHUNKS / "Base.lean").write_text(base, encoding="utf-8")

    terms = []
    for family in FAMILIES:
        terms.extend(family_terms(family))
    terms.extend(cross_family_terms())
    terms.extend(b1_geometry_terms())
    terms.extend(parent_terms())
    terms.extend(role_terms())
    terms.extend(ordinal_terms())
    # Keep each generated definition near the size of the proven Census554
    # circuit chunks.  The former 256-term chunks reached roughly 155 KiB and
    # did not elaborate within two minutes; 64 terms keeps the largest source
    # units small enough for independent Lean compilation.
    chunk_size = 64
    names = []
    for start in range(0, len(terms), chunk_size):
        name = f"common{start // chunk_size:03d}"
        write_chunk(name, terms[start:start + chunk_size])
        names.append(name)
    for name, source, third in (
        ("directRole", 1, 3),
        ("mirrorRole", 3, 1),
    ):
        write_chunk(name, asymmetric_terms(source, third))

    imports = "\n".join(
        f"import ExactFiveCard13BVCircuitChunks.{name[0].upper() + name[1:]}"
        for name in names + ["directRole", "mirrorRole"]
    )
    common = " &&\n    ".join(f"{name} rows blockers shell q w b1 ranks" for name in names)
    main = f"""/- Generated by generate_bv_circuit.py. -/
{imports}

namespace Problem97.ATailExactFiveCard13BVCircuit

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def commonAntecedent {ARGS} : Bool :=
  {common}

def directAntecedent {ARGS} : Bool :=
  commonAntecedent rows blockers shell q w b1 ranks &&
    directRole rows blockers shell q w b1 ranks

def mirrorAntecedent {ARGS} : Bool :=
  commonAntecedent rows blockers shell q w b1 ranks &&
    mirrorRole rows blockers shell q w b1 ranks

end Problem97.ATailExactFiveCard13BVCircuit
"""
    MAIN.write_text(main, encoding="utf-8")
    print({"terms": len(terms), "chunks": len(names), "source_bits": 1139})


if __name__ == "__main__":
    main()
