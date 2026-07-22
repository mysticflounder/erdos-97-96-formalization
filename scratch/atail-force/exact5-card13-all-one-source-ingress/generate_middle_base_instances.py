#!/usr/bin/env python3
"""Generate source-faithful adapters for candidate middle base assertions.

The emitted adapters cover the complete kernel-verified middle source core.
They use only source-faithful row geometry and packet fields; the three
middle-only cover-edge assertions are kept explicit rather than transported.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re


ROW_BIT_RE = re.compile(r"rowBit rows (\d+) (\d+) (\d+)")
CENTER_RE = re.compile(r"^!\(rowBit rows (\d+) (\d+) \2\)$")
SHARED_RE = re.compile(
    r"^!\(\(rowBit rows (\d+) (\d+) (\d+) && "
    r"rowBit rows (\d+) (\d+) (\d+) && "
    r"rowBit rows (\d+) (\d+) (\d+) && "
    r"rowBit rows (\d+) (\d+) (\d+)\)\)$"
)
FIRST_SHARED_RE = re.compile(
    r"^!\(\(firstRowBit b1 (\d+) && firstRowBit b1 (\d+) && "
    r"rowBit rows (\d+) (\d+) (\d+) && "
    r"rowBit rows (\d+) (\d+) (\d+)\)\)$"
)


def source_term(term: str) -> str:
    term = re.sub(r"\brows\b", "(I.sourceRows)", term)
    term = re.sub(r"\bblockers\b", "(sourceBlockers T)", term)
    term = re.sub(r"\bshell\b", "(sourceShell T)", term)
    term = re.sub(r"\bb1\b", "(sourceFirstApexRow T)", term)
    term = re.sub(r"\bq\b", "(sourceQ T)", term)
    return re.sub(r"\bw\b", "(sourceW T)", term)


def row_block_count(term: str) -> tuple[int, int, tuple[int, ...], int] | None:
    if "bif rowBit" not in term or ")).ule " not in term:
        return None
    bits = [tuple(map(int, match)) for match in ROW_BIT_RE.findall(term)]
    if not bits:
        return None
    family, center = bits[0][:2]
    if any(entry[:2] != (family, center) for entry in bits):
        return None
    points = tuple(entry[2] for entry in bits)
    match = re.search(r"\)\)\.ule ([12])#4$", term)
    if match is None:
        return None
    return family, center, points, int(match.group(1))


def packet_schema(position: int, term: str) -> tuple[str, str, str] | None:
    """Return schema, proof, and optional theorem binders."""
    if block := row_block_count(term):
        family, center, points, bound = block
        by_points = {
            (4, 5, 6, 7, 8): ("middleBlock", "middle"),
            (0, 8, 9, 10, 11, 12): ("finalWrapBlock", "finalWrap"),
            (0, 1, 2, 3, 4): ("initialBlock", "initial"),
        }
        if points not in by_points:
            return None
        label, theorem_part = by_points[points]
        proof = f"""  simpa only [allOne{label[0].upper() + label[1:]}BitCount] using
    allOne_row_{theorem_part}Block_count_le_{'one' if bound == 1 else 'two'} I
      ({family} : Fin 3) ({center} : Fin 13) (by decide)"""
        return f"row_{label}_le{bound}", proof, ""

    if position == 1879 and term == "!(shellBit shell 8)":
        return "shell_center", "  exact allOne_shell_center_excluded T", ""
    if position == 1880 and "bif shellBit shell" in term and term.endswith("== 5#4)"):
        return "shell_card", """  simpa only [allOneBitCount13] using
    allOne_shell_card_eq_five T""", ""
    if position in {1881, 1882, 1883} and term == f"shellBit shell {position - 1880}":
        point = position - 1880
        return "shell_physical", (
            f"  exact allOne_physical_shell_mem T ({point} : Fin 13) (by decide)"
        ), ""
    if position == 1884 and "bif shellBit shell 4" in term and term.endswith("== 1#4)"):
        return "shell_middle_strict", """  simpa only [allOneMiddleStrictBitCount] using
    (allOne_shell_strict_counts_eq_one T).1""", ""
    if position == 1885 and "bif shellBit shell 0" in term and term.endswith("== 1#4)"):
        return "shell_final_strict", """  simpa only [allOneFinalStrictBitCount] using
    (allOne_shell_strict_counts_eq_one T).2""", ""

    row_shell = re.fullmatch(
        r"\(!\(rowBit rows ([012]) 8 (\d+)\) \|\| \(shellBit shell \2\)\)", term
    )
    if row_shell is not None:
        family, point = map(int, row_shell.groups())
        return "second_apex_row_shell", (
            f"  exact allOne_secondApex_row_implies_shell I "
            f"({family} : Fin 3) ({point} : Fin 13)"
        ), ""

    if position in {1913, 1914} and term.startswith(f"(({('q' if position == 1913 else 'w')} == 0#4)"):
        role = "Q" if position == 1913 else "W"
        return "frontier_outside", f"""  simpa only [allOneOutsideMiddleBlockBit] using
    allOne_frontier{role}_outside_surplus_block T""", ""
    if position in {1915, 1916} and "rowBit rows 0 4" in term:
        role = "Q" if position == 1915 else "W"
        return "frontier_first_lookup", f"""  simpa only [allOneIndexLookupBit] using
    allOne_frontier{role}_main_firstApex_lookup I""", ""
    if position in {1917, 1918} and "rowBit rows 0 8" in term:
        role = "Q" if position == 1917 else "W"
        return "frontier_second_omission", f"""  simpa only [allOneIndexLookupBit, Bool.not_eq_true_eq_eq_false] using
    allOne_frontier{role}_main_secondApex_lookup_false I""", ""
    if position == 1919 and "bif firstRowBit b1" in term and term.endswith("== 4#4)"):
        return "first_row_card", """  simpa only [allOneBitCount13] using
    allOne_firstApexDoubleRow_card_eq_four T""", ""
    if position == 1920 and term == "!(firstRowBit b1 4)":
        return "first_row_center", "  exact allOne_firstApexDoubleRow_center_excluded T", ""

    first_omit = re.fullmatch(
        r"\(!\(\(([qw]) == (\d+)#4\)\) \|\| \(!\(firstRowBit b1 \2\)\)\)", term
    )
    if first_omit is not None:
        role, point_text = first_omit.groups()
        role_name = "Q" if role == "q" else "W"
        return "frontier_first_row_omission", (
            f"  exact allOne_frontier{role_name}_firstRow_omission_at T "
            f"({int(point_text)} : Fin 13)"
        ), ""

    if position == 1945 and "bif firstRowBit b1 4" in term and term.endswith("ule 1#4"):
        return "first_row_middle_cap", """  simpa only [allOneMiddleBlockBitCount] using
    allOne_firstRow_middleBlock_count_le_one T""", ""
    if position == 1946 and "bif firstRowBit b1 0" in term and term.endswith("ule 1#4"):
        return "first_row_initial_cap", """  simpa only [allOneInitialBlockBitCount] using
    allOne_firstRow_initialBlock_count_le_one T""", ""

    middle_binders = """
    (C : CanonicalAlignedCoverFamilies T 2 1 3)
    (hI : I = CanonicalAllOneSourceOrbitIngress.middle C)"""
    if position == 1947 and term == "!((rowBit rows 1 8 2 && rowBit rows 1 8 1))":
        return "middle_left_edge", """  subst I
  exact allOne_middle_left_edge_omission C (8 : Fin 13)""", middle_binders
    if position in {1948, 1949}:
        center = 8 if position == 1948 else 9
        expected = f"!((rowBit rows 2 {center} 2 && rowBit rows 2 {center} 3))"
        if term == expected:
            return "middle_right_edge", f"""  subst I
  exact allOne_middle_right_edge_omission C ({center} : Fin 13)""", middle_binders

    if position in {1950, 1951} and "blockerAt blockers 3" in term:
        target = 1 if position == 1950 else 2
        return "fixed_blocker_omission", f"""  simpa only [allOneIndexLookupBit] using
    allOne_fixedBlocker_main_omission_lookup I
      (3 : Fin 13) ({target} : Fin 13) (by decide) (by decide) (by decide)""", ""
    return None


def exact_row_card(term: str) -> tuple[int, int] | None:
    if "bif rowBit" not in term or not term.endswith("== 4#4)"):
        return None
    bits = [tuple(map(int, match)) for match in ROW_BIT_RE.findall(term)]
    if len(bits) != 13:
        return None
    family, center = bits[0][:2]
    if bits != [(family, center, point) for point in range(13)]:
        return None
    return family, center


def row_intersection(term: str) -> tuple[int, int, int, int] | None:
    if "bif (rowBit" not in term or not term.endswith(")).ule 2#4"):
        return None
    bits = [tuple(map(int, match)) for match in ROW_BIT_RE.findall(term)]
    if len(bits) != 26:
        return None
    family1, center1 = bits[0][:2]
    family2, center2 = bits[1][:2]
    expected = [
        entry
        for point in range(13)
        for entry in ((family1, center1, point), (family2, center2, point))
    ]
    if bits != expected or center1 == center2:
        return None
    return family1, center1, family2, center2


def family_pair_center_count(term: str) -> tuple[int, int, int] | None:
    if "bif (rowBit" not in term or not term.endswith(")).ule 2#4"):
        return None
    bits = [tuple(map(int, match)) for match in ROW_BIT_RE.findall(term)]
    if len(bits) != 26:
        return None
    family = bits[0][0]
    left, right = bits[0][2], bits[1][2]
    expected = [
        entry
        for center in range(13)
        for entry in ((family, center, left), (family, center, right))
    ]
    if bits != expected or left == right:
        return None
    return family, left, right


def any_pair_center_count(term: str) -> tuple[int, int] | None:
    if "firstRowBit b1" not in term or not term.endswith(")).ule 2#4"):
        return None
    bits = [tuple(map(int, match)) for match in ROW_BIT_RE.findall(term)]
    first_bits = [int(point) for point in re.findall(r"firstRowBit b1 (\d+)", term)]
    if len(bits) != 78 or len(first_bits) != 2:
        return None
    left, right = bits[0][2], bits[1][2]
    expected = [
        entry
        for center in range(13)
        for family in range(3)
        for entry in ((family, center, left), (family, center, right))
    ]
    if bits != expected or first_bits != [left, right] or left == right:
        return None
    return left, right


def shared_pair(term: str) -> tuple[int, int, int, int, int, int] | None:
    match = SHARED_RE.fullmatch(term)
    if match is None:
        return None
    values = list(map(int, match.groups()))
    family1, center1, point1 = values[0:3]
    family1b, center1b, point2 = values[3:6]
    family2, center2, point1b = values[6:9]
    family2b, center2b, point2b = values[9:12]
    if not (
        family1 == family1b
        and center1 == center1b
        and family2 == family2b
        and center2 == center2b
        and point1 == point1b
        and point2 == point2b
    ):
        return None
    if len({center1, center2, point1, point2}) != 4:
        return None
    return family1, center1, family2, center2, point1, point2


def first_row_shared_pair(term: str) -> tuple[int, int, int, int] | None:
    match = FIRST_SHARED_RE.fullmatch(term)
    if match is None:
        return None
    point1, point2, family, center, point1b, familyb, centerb, point2b = map(
        int, match.groups()
    )
    if not (
        point1 == point1b
        and point2 == point2b
        and family == familyb
        and center == centerb
        and point1 < point2
        and len({4, center, point1, point2}) == 4
    ):
        return None
    return family, center, point1, point2


def theorem_for(position: int, term: str) -> tuple[str, str] | None:
    conclusion = source_term(term)
    name = f"middleSource_h{position:04d}"
    extra_binders = ""

    if packet := packet_schema(position, term):
        family_name, proof, extra_binders = packet
    elif match := CENTER_RE.fullmatch(term):
        family, center = map(int, match.groups())
        family_name = "center"
        proof = (
            f"  exact allOne_row_center_excluded I "
            f"({family} : Fin 3) ({center} : Fin 13)"
        )
    elif card := exact_row_card(term):
        family, center = card
        family_name = "card"
        proof = f"""  simpa only [allOneBitCount13] using
    allOne_row_card_eq_four I ({family} : Fin 3) ({center} : Fin 13)"""
    elif intersection := row_intersection(term):
        family1, center1, family2, center2 = intersection
        family_name = "intersection"
        proof = f"""  simpa only [allOneBitCount13] using
    allOne_row_inter_card_le_two I
      ({family1} : Fin 3) ({family2} : Fin 3)
      ({center1} : Fin 13) ({center2} : Fin 13) (by decide)"""
    elif family_pair := family_pair_center_count(term):
        family, left, right = family_pair
        family_name = "family_pair_centers"
        proof = f"""  simpa only [allOneBitCount13] using
    allOne_family_pair_center_count_le_two I
      ({family} : Fin 3) ({left} : Fin 13) ({right} : Fin 13) (by decide)"""
    elif any_pair := any_pair_center_count(term):
        left, right = any_pair
        family_name = "any_pair_centers"
        proof = f"""  simpa [allOneBitCount13, allOneAnyPairPackedCenterBit] using
    allOne_any_pair_packed_center_count_le_two I
      ({left} : Fin 13) ({right} : Fin 13) (by decide)"""
    elif shared := shared_pair(term):
        family1, center1, family2, center2, point1, point2 = shared
        family_name = "shared_pair"
        rows = sorted(((center1, family1), (center2, family2)))
        points = sorted((point1, point2))
        center1, family1 = rows[0]
        center2, family2 = rows[1]
        point1, point2 = points
        pattern = "".join(
            "c" if vertex in {center1, center2} else "p"
            for vertex in sorted((center1, center2, point1, point2))
        )
        theorem_by_pattern = {
            "ccpp": "allOne_sharedPair_centersBeforePoints",
            "ppcc": "allOne_sharedPair_pointsBeforeCenters",
            "cppc": "allOne_sharedPair_centersAroundPoints",
            "pccp": "allOne_sharedPair_pointsAroundCenters",
        }
        theorem = theorem_by_pattern.get(pattern)
        if theorem is None:
            return None
        proof = f"""  exact {theorem} I
      ({family1} : Fin 3) ({family2} : Fin 3)
      ({center1} : Fin 13) ({center2} : Fin 13)
      ({point1} : Fin 13) ({point2} : Fin 13)
      (by decide) (by decide) (by decide)"""
    elif first_shared := first_row_shared_pair(term):
        family, center, point1, point2 = first_shared
        family_name = "first_shared_pair"
        pattern = "".join(
            "c" if vertex in {4, center} else "p"
            for vertex in sorted((4, center, point1, point2))
        )
        if pattern == "ccpp" and center < 4:
            vertices, branch, disjunct = (center, 4, point1, point2), 1, "inr"
        elif pattern == "ccpp":
            vertices, branch, disjunct = (4, center, point1, point2), 1, "inl"
        elif pattern == "cppc" and center < 4:
            vertices, branch, disjunct = (center, point1, point2, 4), 2, "inl"
        elif pattern == "cppc":
            vertices, branch, disjunct = (4, point1, point2, center), 2, "inr"
        elif pattern == "pccp" and center < 4:
            vertices, branch, disjunct = (point1, center, 4, point2), 2, "inl"
        elif pattern == "pccp":
            vertices, branch, disjunct = (point1, 4, center, point2), 2, "inr"
        elif pattern == "ppcc" and center < 4:
            vertices, branch, disjunct = (point1, point2, center, 4), 1, "inr"
        elif pattern == "ppcc":
            vertices, branch, disjunct = (point1, point2, 4, center), 1, "inl"
        else:
            return None
        a, b, c, d = vertices
        proof = f"""  apply allOne_firstRow_sharedPair_false_of_strict I
    ({family} : Fin 3) ({center} : Fin 13)
    ({point1} : Fin 13) ({point2} : Fin 13)
  have hk := P.strictKalmanson
    (a := ({a} : Fin 13)) (b := ({b} : Fin 13))
    (c := ({c} : Fin 13)) (d := ({d} : Fin 13))
    (by decide) (by decide) (by decide)
  exact Or.{disjunct} (by simpa only [dist_comm, add_comm] using hk.{branch})"""
    else:
        return None

    theorem_text = f"""/-- Candidate middle source assertion `h{position:04d}` ({family_name}). -/
theorem {name}{extra_binders} :
    ({conclusion}) = true := by
{proof}
"""
    return family_name, theorem_text


HEADER = """/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual Boolean assertions consumed by that verified endpoint.
-/
import AllOnePacketFacts

/-!
# Candidate middle-orbit base geometry instances

Generated specializations of source-faithful finite row geometry schemas.
-/

namespace Problem97
namespace ATailExactFiveCard13AllOneSourceIngressScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAllOneSourceOrbitIngress

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}
    (I : CanonicalAllOneSourceOrbitIngress T)

"""

FOOTER = """
end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--obligations", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--summary", type=Path, required=True)
    args = parser.parse_args()

    payload = json.loads(args.obligations.read_text(encoding="utf-8"))
    if payload.get("orbit") != "allOneHitHubMiddle":
        raise ValueError("the obligations are not the unquotiented middle orbit")
    if not payload.get("complete"):
        raise ValueError("partial obligation stream")
    base_count = int(payload["source_counts"]["base_assertions"])
    by_chunk: dict[int, list[str]] = {}
    counts: dict[str, int] = {}
    unrecognized: list[dict[str, object]] = []
    for obligation in payload["obligations"]:
        if int(obligation["source_index"]) >= base_count:
            continue
        position = int(obligation["core_position"])
        result = theorem_for(position, obligation["packed_term"])
        if result is None:
            unrecognized.append({
                "core_position": position,
                "source_index": int(obligation["source_index"]),
                "packed_term": obligation["packed_term"],
            })
            continue
        family, theorem = result
        counts[family] = counts.get(family, 0) + 1
        by_chunk.setdefault(int(obligation["chunk"]), []).append(theorem)

    args.output_dir.mkdir(parents=True, exist_ok=True)
    modules: list[str] = []
    split_chunks = {28, 29}
    for chunk, theorems in sorted(by_chunk.items()):
        theorem_groups = (
            [[theorem] for theorem in theorems]
            if chunk in split_chunks
            else [theorems]
        )
        for part, theorem_group in enumerate(theorem_groups):
            suffix = f"Part{part:03d}" if len(theorem_groups) > 1 else ""
            module = f"AllOneMiddleBaseInstancesChunk{chunk:03d}{suffix}"
            modules.append(module)
            header = (
                HEADER.replace(
                    "import AllOnePacketFacts",
                    "import AllOneAnyPairPackedFacts",
                )
                if chunk in split_chunks
                else HEADER
            )
            (args.output_dir / f"{module}.lean").write_text(
                header + "\n".join(theorem_group) + FOOTER,
                encoding="utf-8",
            )

    (args.output_dir / "AllOneMiddleBaseInstances.lean").write_text(
        "\n".join(f"import {module}" for module in modules) + "\n",
        encoding="utf-8",
    )
    summary = {
        "schema": "p97-exact5-card13-all-one-middle-candidate-base-adapters-v1",
        "epistemic_status": "source adapters for kernel-verified Lean/LRAT endpoint",
        "orbit": payload["orbit"],
        "obligations_total": len(payload["obligations"]),
        "base_obligations": sum(counts.values()) + len(unrecognized),
        "base_adapters": sum(counts.values()),
        "counts": dict(sorted(counts.items())),
        "unrecognized_count": len(unrecognized),
        "unrecognized": unrecognized,
        "modules": modules,
    }
    args.summary.write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )


if __name__ == "__main__":
    main()
