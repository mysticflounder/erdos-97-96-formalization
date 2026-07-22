#!/usr/bin/env python3
"""Generate exact source proofs for pass-5 hypotheses h0170--h1898.

The saved pass-5 source core is checked against the current Z3 assertion
surface before any Lean is emitted.  Each generated theorem has the literal
packed-source assertion as its conclusion and delegates its proof to one of
the generic source lemmas in `DirectSourceRankFacts.lean`.
"""

from __future__ import annotations

import argparse
from itertools import combinations
import json
from pathlib import Path
import re
import sys


HERE = Path(__file__).resolve().parent
SOURCE = HERE.parent / "exact5-card13-same-radius-terminal"
sys.path.insert(0, str(SOURCE))

import asymmetric_ordinal_rank as ordinal  # noqa: E402
import generate_source_core_bv as packed  # noqa: E402


PAIR_LIST = list(combinations(range(13), 2))
PAIR_INDEX = {pair: index for index, pair in enumerate(PAIR_LIST)}

BOUND_RE = re.compile(r"^\(rankAtom ranks (\d+)\)\.ult \(78#7\)$")
ROW_RE = re.compile(
    r"^\(!\(\(rowBit rows (\d+) (\d+) (\d+) && "
    r"rowBit rows \1 \2 (\d+)\)\) \|\| "
    r"\(\(rankAtom ranks (\d+) == rankAtom ranks (\d+)\)\)\)$"
)
FIRST_RE = re.compile(
    r"^\(!\(\(firstRowBit b1 (\d+) && firstRowBit b1 (\d+)\)\) \|\| "
    r"\(\(rankAtom ranks (\d+) == rankAtom ranks (\d+)\)\)\)$"
)
SHELL_RE = re.compile(
    r"^\(!\(\(shellBit shell (\d+) && shellBit shell (\d+)\)\) \|\| "
    r"\(\(rankAtom ranks (\d+) == rankAtom ranks (\d+)\)\)\)$"
)
KALMANSON_RE = re.compile(
    r"^\(!\(\(rankAtom ranks (\d+) == rankAtom ranks (\d+)\)\) \|\| "
    r"\(\(rankAtom ranks (\d+)\)\.ult \(rankAtom ranks (\d+)\)\)\)$"
)


def source_term(term: str) -> str:
    """Instantiate an emitted flat assertion with the semantic assignment."""

    substitutions = {
        "rows": "(directSourceRows C)",
        "shell": "(directSourceShell T)",
        "b1": "(directSourceFirstRow T)",
        "ranks": "(directSourceRanks P)",
    }
    for name, value in substitutions.items():
        term = re.sub(rf"\b{name}\b", value, term)
    return term


def pair_index(a: int, b: int) -> int:
    return PAIR_INDEX[tuple(sorted((a, b)))]


def kalmanson_case(
    positive_mate: int,
    positive_canceled: int,
    negative_mate: int,
    negative_canceled: int,
) -> tuple[tuple[int, int, int, int], int, tuple[int, int, int, int, int, int]]:
    used = {
        vertex
        for index in (
            positive_mate,
            positive_canceled,
            negative_mate,
            negative_canceled,
        )
        for vertex in PAIR_LIST[index]
    }
    if len(used) != 4:
        raise ValueError(f"Kalmanson guard does not span four vertices: {sorted(used)}")
    a, b, c, d = sorted(used)
    indices = (
        pair_index(b, c),
        pair_index(a, d),
        pair_index(a, c),
        pair_index(b, d),
        pair_index(a, b),
        pair_index(c, d),
    )
    i_bc, i_ad, i_ac, i_bd, i_ab, i_cd = indices
    lhs = {negative_mate, negative_canceled}
    rhs = {positive_mate, positive_canceled}
    if lhs == {i_bc, i_ad} and rhs == {i_ac, i_bd}:
        branch = 1
    elif lhs == {i_ab, i_cd} and rhs == {i_ac, i_bd}:
        branch = 2
    else:
        raise ValueError(
            "guard is not one of the two strict Kalmanson inequalities: "
            f"vertices={(a, b, c, d)}, lhs={sorted(lhs)}, rhs={sorted(rhs)}"
        )
    return (a, b, c, d), branch, indices


def theorem_for(index: int, term: str) -> tuple[str, str]:
    conclusion = source_term(term)
    name = f"directSource_h{index:04d}"

    if match := BOUND_RE.fullmatch(term):
        rank = int(match.group(1))
        proof = (
            f"  exact rankAtom_directSourceRanks_ult_seventyEight "
            f"P ({rank} : Fin 78)"
        )
        family = "bound"
    elif match := ROW_RE.fullmatch(term):
        family_index, center, left, right, rank_left, rank_right = map(
            int, match.groups()
        )
        proof = f"""  exact directSource_row_rank_guard C
    ({family_index} : Fin 3) ({center} : Fin 13)
    ({left} : Fin 13) ({right} : Fin 13)
    ({rank_left} : Fin 78) ({rank_right} : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_left} : Fin 78) ({center} : Fin 13) ({left} : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_right} : Fin 78) ({center} : Fin 13) ({right} : Fin 13) (by decide))"""
        family = "row"
    elif match := FIRST_RE.fullmatch(term):
        left, right, rank_left, rank_right = map(int, match.groups())
        proof = f"""  exact directSource_firstRow_rank_guard
    ({left} : Fin 13) ({right} : Fin 13)
    ({rank_left} : Fin 78) ({rank_right} : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_left} : Fin 78) (4 : Fin 13) ({left} : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_right} : Fin 78) (4 : Fin 13) ({right} : Fin 13) (by decide))"""
        family = "first"
    elif match := SHELL_RE.fullmatch(term):
        left, right, rank_left, rank_right = map(int, match.groups())
        proof = f"""  exact directSource_shell_rank_guard
    ({left} : Fin 13) ({right} : Fin 13)
    ({rank_left} : Fin 78) ({rank_right} : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_left} : Fin 78) (8 : Fin 13) ({left} : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_right} : Fin 78) (8 : Fin 13) ({right} : Fin 13) (by decide))"""
        family = "shell"
    elif match := KALMANSON_RE.fullmatch(term):
        positive_canceled, negative_canceled, negative_mate, positive_mate = map(
            int, match.groups()
        )
        vertices, branch, pair_indices = kalmanson_case(
            positive_mate, positive_canceled, negative_mate, negative_canceled
        )
        a, b, c, d = vertices
        i_bc, i_ad, i_ac, i_bd, i_ab, i_cd = pair_indices
        proof = f"""  apply directSource_kalmanson_rank_guard P
    ({positive_mate} : Fin 78) ({positive_canceled} : Fin 78)
    ({negative_mate} : Fin 78) ({negative_canceled} : Fin 78)
  have hk := strictKalmanson_pairDistances (P := P)
    ({a} : Fin 13) ({b} : Fin 13) ({c} : Fin 13) ({d} : Fin 13)
    (by decide) (by decide) (by decide)
    ({i_bc} : Fin 78) ({i_ad} : Fin 78) ({i_ac} : Fin 78)
    ({i_bd} : Fin 78) ({i_ab} : Fin 78) ({i_cd} : Fin 78)
    (by decide) (by decide) (by decide) (by decide) (by decide) (by decide)
  simpa only [add_comm] using hk.{branch}"""
        family = "kalmanson"
    else:
        raise ValueError(f"unrecognized h{index:04d}: {term}")

    c_argument = " (C : CanonicalCoverFamilies T)" if family == "row" else ""
    theorem = f"""/-- Exact pass-5 source assertion `h{index:04d}` ({family}). -/
theorem {name}{c_argument} :
    ({conclusion}) = true := by
{proof}
"""
    return family, theorem


HEADER = """/-
Generated deterministically from `direct.source-core.pass5.json`.

Each theorem concludes one literal packed-source assertion from h0170--h1898
and proves it through the generic source facts in `DirectSourceRankFacts`.
-/
import DirectSourceRankFacts

/-!
# Exact pass-5 rank-source instances

This generated module specializes the generic source lemmas to the literal
packed assertions `h0170`--`h1898` selected by the direct pass-5 core.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailKalmansonParentOrderScratch
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable

attribute [local instance] Classical.propDecidable

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    {Q : FrontierBiApexRobustExactFiveSecondCapResidual B}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {M : PhysicalActualCriticalMutualOmissionPair H profile}
    {N : SourceTwoHitNormalForm Q profile M}
    (P : CanonicalAsymmetricRolePrepacket N)
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}

"""

FOOTER = """
end

end ATailExactFiveCard13CnfIngressScratch
end Problem97
"""


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--core", type=Path, default=SOURCE / "direct.source-core.pass5.json"
    )
    parser.add_argument(
        "--output", type=Path, default=HERE / "DirectSourceRankInstances.lean"
    )
    parser.add_argument(
        "--representatives",
        action="store_true",
        help="emit the first assertion from each of the five source families",
    )
    parser.add_argument(
        "--chunk-size",
        type=int,
        default=64,
        help="use the verified ingress chunk width (default: 64)",
    )
    args = parser.parse_args()

    payload = json.loads(args.core.read_text(encoding="utf-8"))
    outer, _ranks, _counts = ordinal.build(payload["orbit"], 0)
    current = list(outer.solver.assertions())
    selected = []
    for position, saved in enumerate(payload["core"]):
        assertion = current[saved["index"]]
        if assertion.sexpr() != saved["assertion"]:
            raise AssertionError(f"source assertion drift at position {position}")
        selected.append(packed.emit_bool(assertion))

    if len(selected) != 1899:
        raise AssertionError(f"expected 1899 assertions, found {len(selected)}")

    emitted: list[tuple[int, str]] = []
    counts: dict[str, int] = {}
    seen: set[str] = set()
    for index, term in enumerate(selected):
        if index < 170:
            continue
        family, theorem = theorem_for(index, term)
        counts[family] = counts.get(family, 0) + 1
        if args.representatives and family in seen:
            continue
        seen.add(family)
        emitted.append((index, theorem))

    chunk_paths: list[Path] = []
    if args.representatives:
        args.output.write_text(
            HEADER + "\n".join(theorem for _index, theorem in emitted) + FOOTER,
            encoding="utf-8",
        )
    else:
        chunks: dict[int, list[str]] = {}
        for index, theorem in emitted:
            chunks.setdefault(index // args.chunk_size, []).append(theorem)
        for chunk, theorems in sorted(chunks.items()):
            path = args.output.with_name(f"{args.output.stem}Chunk{chunk:03d}.lean")
            path.write_text(HEADER + "\n".join(theorems) + FOOTER, encoding="utf-8")
            chunk_paths.append(path)
        imports = "\n".join(f"import {path.stem}" for path in chunk_paths)
        args.output.write_text(
            f"{imports}\n\n"
            f"/-!\n# Exact pass-5 rank-source instances\n\n"
            f"This coordinator imports the source-clean 64-assertion chunks for\n"
            f"the literal pass-5 hypotheses `h0170`--`h1898`.\n-/\n",
            encoding="utf-8",
        )
    print(
        json.dumps(
            {
                "core": str(args.core),
                "counts": counts,
                "chunks": [str(path) for path in chunk_paths],
                "emitted": len(emitted),
                "output": str(args.output),
                "representatives": args.representatives,
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
