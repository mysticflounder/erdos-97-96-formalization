#!/usr/bin/env python3
"""Generate exact complete-class rank instances for source indices 44232--45287.

Both live source orbits are rebuilt and compared byte-for-byte.  The expected
block is also reconstructed independently from the documented class schemas.
No Lean is written unless indices, count, S-expressions, and SHA-256 all agree.
"""

from __future__ import annotations

import hashlib
from itertools import combinations
import json
from pathlib import Path
import sys

import z3


HERE = Path(__file__).resolve().parent
AUDIT = HERE.parent.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT))

from distinct_source_terms import build_source_assertions  # noqa: E402


START = 44_232
END = 45_288
COUNT = END - START
CHUNK_SIZE = 64
EXPECTED_SHA256 = "bd4f3de59902a490bd2aedacda0652975cf58127c92fab1eb64fed6c82b5646c"
PAIR_LIST = list(combinations(range(13), 2))
PAIR_INDEX = {pair: index for index, pair in enumerate(PAIR_LIST)}


def rank(center: int, point: int) -> z3.IntNumRef | z3.ArithRef:
    a, b = sorted((center, point))
    return z3.Int(f"ord_rank_{a}_{b}")


def complete_class(center: int, member: dict[int, z3.BoolRef]) -> list[z3.BoolRef]:
    targets = [point for point in range(13) if point != center]
    return [
        z3.Implies(
            z3.Xor(member[left], member[right]),
            rank(center, left) != rank(center, right),
        )
        for left, right in combinations(targets, 2)
    ]


def expected_complete_block() -> tuple[list[z3.BoolRef], list[dict[str, int | str]]]:
    assertions: list[z3.BoolRef] = []
    metadata: list[dict[str, int | str]] = []

    def append_class(kind: str, center: int, member: dict[int, z3.BoolRef]) -> None:
        for assertion, (left, right) in zip(
            complete_class(center, member),
            combinations([p for p in range(13) if p != center], 2),
            strict=True,
        ):
            assertions.append(assertion)
            metadata.append({
                "kind": kind,
                "center": center,
                "left": left,
                "right": right,
                "rank_left": PAIR_INDEX[tuple(sorted((center, left)))],
                "rank_right": PAIR_INDEX[tuple(sorted((center, right)))],
            })

    append_class("retained", 4, {p: z3.Bool(f"m_4_{p}") for p in range(13)})
    append_class("double", 4, {p: z3.Bool(f"b1_{p}") for p in range(13)})
    append_class("second", 8, {p: z3.Bool(f"shell_{p}") for p in range(13)})
    for center in range(13):
        in_image = z3.Or(*(z3.Int(f"blocker_{source}") == center for source in range(13)))
        member = {p: z3.Bool(f"m_{center}_{p}") for p in range(13)}
        targets = [point for point in range(13) if point != center]
        for left, right in combinations(targets, 2):
            assertions.append(z3.Implies(
                z3.And(in_image, z3.Xor(member[left], member[right])),
                rank(center, left) != rank(center, right),
            ))
            metadata.append({
                "kind": "actual",
                "center": center,
                "left": left,
                "right": right,
                "rank_left": PAIR_INDEX[tuple(sorted((center, left)))],
                "rank_right": PAIR_INDEX[tuple(sorted((center, right)))],
            })
    if len(assertions) != COUNT or len(metadata) != COUNT:
        raise AssertionError(f"complete block count drift: {len(assertions)}")
    return assertions, metadata


def sha256_stream(assertions: list[z3.BoolRef]) -> str:
    payload = "".join(assertion.sexpr() + "\n" for assertion in assertions)
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def checked_block() -> tuple[list[z3.BoolRef], list[dict[str, int | str]]]:
    direct, direct_counts, *_ = build_source_assertions("direct")
    mirror, mirror_counts, *_ = build_source_assertions("mirror")
    for counts in (direct_counts, mirror_counts):
        if counts["complete_class_rank_inequalities"] != COUNT:
            raise AssertionError("live complete-class count drift")
    direct_slice = direct[START:END]
    mirror_slice = mirror[START:END]
    if len(direct_slice) != COUNT or len(mirror_slice) != COUNT:
        raise AssertionError("live complete-class boundary drift")
    if [x.sexpr() for x in direct_slice] != [x.sexpr() for x in mirror_slice]:
        raise AssertionError("complete-class block differs between source orbits")
    if sha256_stream(direct_slice) != EXPECTED_SHA256:
        raise AssertionError("complete-class block hash drift")
    expected, metadata = expected_complete_block()
    for offset, (live, rebuilt) in enumerate(zip(direct_slice, expected, strict=True)):
        if live.sexpr() != rebuilt.sexpr():
            raise AssertionError(
                f"complete-class drift at source index {START + offset}:\n"
                f"live: {live.sexpr()}\nrebuilt: {rebuilt.sexpr()}"
            )
    return direct_slice, metadata


COMMON_OPENS = """open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveFirstApexCard13ParentRowCouplingScratch
open ATailExactFiveFirstApexCard13Scratch
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
"""

COMMON_VARIABLES = """variable
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


def member_term(kind: str, center: int, point: int) -> str:
    if kind == "retained" or kind == "actual":
        return f"rowBit (directSourceRows C) 0 {center} {point}"
    if kind == "double":
        return f"firstRowBit (directSourceFirstRow T) {point}"
    if kind == "second":
        return f"shellBit (directSourceShell T) {point}"
    raise AssertionError(kind)


def image_term(center: int) -> str:
    terms = [
        f"(blockerAt (directSourceBlockers T) {source} == {center}#4)"
        for source in range(13)
    ]
    return "(" + " ||\n          ".join(terms) + ")"


def field_statement(meta: dict[str, int | str]) -> str:
    kind = str(meta["kind"])
    center = int(meta["center"])
    left = int(meta["left"])
    right = int(meta["right"])
    rank_left = int(meta["rank_left"])
    rank_right = int(meta["rank_right"])
    lhs = member_term(kind, center, left)
    rhs = member_term(kind, center, right)
    rank_ne = (
        f"!(rankAtom (directSourceRanks P) {rank_left} ==\n"
        f"          rankAtom (directSourceRanks P) {rank_right})"
    )
    if kind == "actual":
        return (
            f"(!(({image_term(center)} && !({lhs} == {rhs}))) ||\n"
            f"      ({rank_ne})) = true"
        )
    return f"(!(!({lhs} == {rhs})) ||\n      ({rank_ne})) = true"


def proof_term(meta: dict[str, int | str]) -> str:
    kind = str(meta["kind"])
    center = int(meta["center"])
    left = int(meta["left"])
    right = int(meta["right"])
    rank_left = int(meta["rank_left"])
    rank_right = int(meta["rank_right"])
    common = (
        f"({left} : Fin 13) ({right} : Fin 13)\n"
        f"      ({rank_left} : Fin 78) ({rank_right} : Fin 78)\n"
        f"      (by decide) (by decide)"
    )
    if kind == "retained":
        return f"simpa using directSource_complete_retained_guard P C hcard hdistinct\n      {common}"
    if kind == "double":
        return f"simpa using directSource_complete_double_guard P hcard hdistinct\n      {common}"
    if kind == "second":
        return f"simpa using directSource_complete_second_guard P\n      {common}"
    if kind == "actual":
        return (
            f"simpa [actualBlockerImageBit] using\n"
            f"      directSource_complete_actual_guard P C ({center} : Fin 13)\n"
            f"        {common}"
        )
    raise AssertionError(kind)


def chunk_text(chunk: int, entries: list[tuple[int, dict[str, int | str]]]) -> str:
    name = f"CompleteClassAssertionsChunk{chunk:03d}"
    needs_distinct = any(
        str(meta["kind"]) in {"retained", "double"} for _index, meta in entries
    )
    source_args = (
        "\n    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)"
        if needs_distinct else ""
    )
    fields = "\n".join(
        f"  h{index} : {field_statement(meta)}"
        for index, meta in entries
    )
    proofs = "\n".join(
        f"  · {proof_term(meta)}"
        for _index, meta in entries
    )
    return f"""/- Generated by `generate_rank_instances.py`; do not edit. -/
import RankSourceAdapters

/-! Exact generated complete-class rank assertion chunk {chunk:03d}. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

{COMMON_OPENS}

attribute [local instance] Classical.propDecidable
set_option maxHeartbeats 0
set_option maxRecDepth 1000000
noncomputable section

{COMMON_VARIABLES}

structure {name} (C : CanonicalCoverFamilies T) : Prop where
{fields}

theorem canonical{name}
    (C : CanonicalCoverFamilies T){source_args} :
    {name} P C := by
  constructor
{proofs}

end
end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
"""


def coordinator_text(chunk_count: int) -> str:
    imports = "\n".join(
        f"import CompleteClassAssertionsChunk{chunk:03d}" for chunk in range(chunk_count)
    )
    fields = "\n".join(
        f"  chunk{chunk:03d} : CompleteClassAssertionsChunk{chunk:03d} P C"
        for chunk in range(chunk_count)
    )
    values = "\n".join(
        f"    chunk{chunk:03d} := canonicalCompleteClassAssertionsChunk{chunk:03d} "
        f"P C" + (" hcard hdistinct" if chunk < 3 else "")
        for chunk in range(chunk_count)
    )
    return f"""/- Generated by `generate_rank_instances.py`; do not edit. -/
{imports}

/-! Coordinator for all exact generated complete-class rank assertions. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

{COMMON_OPENS}

attribute [local instance] Classical.propDecidable
noncomputable section

{COMMON_VARIABLES}

structure CanonicalCompleteClassAssertions
    (C : CanonicalCoverFamilies T) : Prop where
{fields}

theorem canonicalCompleteClassAssertions
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    CanonicalCompleteClassAssertions P C :=
  {{
{values} }}

#print axioms CanonicalCompleteClassAssertions
#print axioms canonicalCompleteClassAssertions

end
end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
"""


def main() -> None:
    live, metadata = checked_block()
    indexed = [(START + offset, meta) for offset, meta in enumerate(metadata)]
    chunks = [indexed[i:i + CHUNK_SIZE] for i in range(0, len(indexed), CHUNK_SIZE)]
    for chunk, entries in enumerate(chunks):
        (HERE / f"CompleteClassAssertionsChunk{chunk:03d}.lean").write_text(
            chunk_text(chunk, entries), encoding="utf-8"
        )
    (HERE / "CanonicalCompleteClassAssertions.lean").write_text(
        coordinator_text(len(chunks)), encoding="utf-8"
    )
    payload = {
        "schema": "exact5-card13-distinct-radius-complete-class-rank-v1",
        "source_range": [START, END],
        "count": COUNT,
        "chunk_size": CHUNK_SIZE,
        "chunk_count": len(chunks),
        "sha256": sha256_stream(live),
        "both_orbits_identical": True,
        "entries": [
            {"source_index": START + offset, "sexpr": assertion.sexpr(), **metadata[offset]}
            for offset, assertion in enumerate(live)
        ],
    }
    (HERE / "complete-class-assertion-map.json").write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({key: payload[key] for key in (
        "source_range", "count", "chunk_count", "sha256", "both_orbits_identical"
    )}, sort_keys=True))


if __name__ == "__main__":
    main()
