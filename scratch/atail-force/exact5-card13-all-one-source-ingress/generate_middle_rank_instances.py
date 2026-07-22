#!/usr/bin/env python3
"""Generate exact middle-core rank assertion adapters.

The input is the certificate-ingress obligations JSON, not a solver model.
Every emitted theorem is a specialization of the source-faithful generic
lemmas in ``AllOneRankFacts.lean``.  Base Boolean assertions are deliberately
left to the separate base-fact adapter.
"""

from __future__ import annotations

import argparse
from itertools import combinations
import json
from pathlib import Path
import re


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
    substitutions = {
        "rows": "(I.sourceRows)",
        "shell": "(sourceShell T)",
        "b1": "(sourceFirstApexRow T)",
        "ranks": "(sourceRanks P)",
    }
    term = re.sub(r"\brankAtom\b", "allOneRankAtom", term)
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
            "guard is not a strict Kalmanson cancellation: "
            f"vertices={(a, b, c, d)}, lhs={sorted(lhs)}, rhs={sorted(rhs)}"
        )
    return (a, b, c, d), branch, indices


def theorem_for(position: int, term: str) -> tuple[str, str] | None:
    conclusion = source_term(term)
    name = f"middleSource_h{position:04d}"

    if match := BOUND_RE.fullmatch(term):
        rank = int(match.group(1))
        proof = f"  exact allOneRankAtom_sourceRanks_ult_seventyEight P ({rank} : Fin 78)"
        family = "bound"
    elif match := ROW_RE.fullmatch(term):
        family_index, center, left, right, rank_left, rank_right = map(
            int, match.groups()
        )
        proof = f"""  exact allOne_row_rank_guard I
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
        proof = f"""  exact allOne_firstRow_rank_guard T
    ({left} : Fin 13) ({right} : Fin 13)
    ({rank_left} : Fin 78) ({rank_right} : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_left} : Fin 78) (4 : Fin 13) ({left} : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_right} : Fin 78) (4 : Fin 13) ({right} : Fin 13) (by decide))"""
        family = "first"
    elif match := SHELL_RE.fullmatch(term):
        left, right, rank_left, rank_right = map(int, match.groups())
        proof = f"""  exact allOne_shell_rank_guard T
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
        proof = f"""  apply allOne_kalmanson_rank_guard P
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
        return None

    theorem = f"""/-- Candidate middle source assertion `h{position:04d}` ({family}). -/
theorem {name} :
    ({conclusion}) = true := by
{proof}
"""
    return family, theorem


HEADER = """/-
Generated from the middle source core whose original Lean-emitted CNF and
LRAT endpoint have been kernel checked.  These source-faithful adapters prove
the individual ordinal-rank assertions consumed by that verified endpoint.
-/
import AllOneRankFacts

/-!
# Candidate middle-orbit rank instances

Generated specializations of the source-faithful rank assertion schemas.
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
    by_chunk: dict[int, list[str]] = {}
    counts: dict[str, int] = {}
    unrecognized: list[int] = []
    for obligation in payload["obligations"]:
        position = int(obligation["core_position"])
        result = theorem_for(position, obligation["packed_term"])
        if result is None:
            unrecognized.append(position)
            continue
        family, theorem = result
        counts[family] = counts.get(family, 0) + 1
        by_chunk.setdefault(int(obligation["chunk"]), []).append(theorem)

    args.output_dir.mkdir(parents=True, exist_ok=True)
    modules: list[str] = []
    for chunk, theorems in sorted(by_chunk.items()):
        module = f"AllOneMiddleRankInstancesChunk{chunk:03d}"
        modules.append(module)
        (args.output_dir / f"{module}.lean").write_text(
            HEADER + "\n".join(theorems) + FOOTER,
            encoding="utf-8",
        )

    aggregator = (
        "\n".join(f"import {module}" for module in modules) +
        "\n\n/-!\n# Middle rank source adapters\n\n"
        "Aggregate import for all generated rank assertions.\n-/\n"
    )
    (args.output_dir / "AllOneMiddleRankInstances.lean").write_text(
        aggregator, encoding="utf-8"
    )
    summary = {
        "schema": "p97-exact5-card13-all-one-middle-candidate-rank-adapters-v1",
        "epistemic_status": "source adapters for kernel-verified Lean/LRAT endpoint",
        "orbit": payload["orbit"],
        "obligations_total": len(payload["obligations"]),
        "rank_adapters": sum(counts.values()),
        "families": counts,
        "chunks": len(modules),
        "base_positions_pending": unrecognized,
    }
    args.summary.write_text(json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps({**summary, "base_positions_pending": len(unrecognized)}, indent=2))


if __name__ == "__main__":
    main()
