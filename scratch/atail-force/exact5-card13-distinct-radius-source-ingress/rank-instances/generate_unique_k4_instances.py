#!/usr/bin/env python3
"""Generate exact unique-K4 rank instances for source indices 45288--52712."""

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


BLOCKS = (
    ("second", 45_288, 45_783, "c339cc24684de6dec5e77cced381e7028a0d95349c5b8fc567241b45ee211f7e"),
    ("first", 45_783, 46_278, "2b0d2825cc934dafb811ed4501aacb391945dd1ff9e91b733964fc221822eb24"),
    ("actual", 46_278, 52_713, "7a04a5805d01bd83c323c1d35970741559e9541220bc4cc238c38646c06a74c5"),
)
START = BLOCKS[0][1]
END = BLOCKS[-1][2]
COUNT = END - START
CHUNK_SIZE = 64
PAIR_LIST = list(combinations(range(13), 2))
PAIR_INDEX = {pair: index for index, pair in enumerate(PAIR_LIST)}


def rank(center: int, point: int) -> z3.ArithRef:
    a, b = sorted((center, point))
    return z3.Int(f"ord_rank_{a}_{b}")


def all_equal(center: int, quad: tuple[int, int, int, int]) -> z3.BoolRef:
    a, b, c, d = quad
    return z3.And(
        rank(center, a) == rank(center, b),
        rank(center, a) == rank(center, c),
        rank(center, a) == rank(center, d),
    )


def all_members(prefix: str, center: int | None, quad: tuple[int, int, int, int]) -> z3.BoolRef:
    def atom(point: int) -> z3.BoolRef:
        if prefix == "shell":
            return z3.Bool(f"shell_{point}")
        if prefix == "b1":
            return z3.Bool(f"b1_{point}")
        assert center is not None
        return z3.Bool(f"m_{center}_{point}")
    return z3.And(*(atom(point) for point in quad))


def metadata(kind: str, center: int, quad: tuple[int, int, int, int]) -> dict[str, object]:
    return {
        "kind": kind,
        "center": center,
        "quad": list(quad),
        "rank_indices": [PAIR_INDEX[tuple(sorted((center, point)))] for point in quad],
    }


def expected_blocks() -> tuple[list[z3.BoolRef], list[dict[str, object]]]:
    assertions: list[z3.BoolRef] = []
    metas: list[dict[str, object]] = []

    for quad in combinations([p for p in range(13) if p != 8], 4):
        assertions.append(z3.Implies(
            z3.Not(all_members("shell", None, quad)),
            z3.Not(all_equal(8, quad)),
        ))
        metas.append(metadata("second", 8, quad))

    for quad in combinations([p for p in range(13) if p != 4], 4):
        displayed = z3.Or(all_members("m", 4, quad), all_members("b1", None, quad))
        assertions.append(z3.Implies(z3.Not(displayed), z3.Not(all_equal(4, quad))))
        metas.append(metadata("first", 4, quad))

    for center in range(13):
        in_image = z3.Or(*(z3.Int(f"blocker_{source}") == center for source in range(13)))
        for quad in combinations([p for p in range(13) if p != center], 4):
            assertions.append(z3.Implies(
                z3.And(in_image, z3.Not(all_members("m", center, quad))),
                z3.Not(all_equal(center, quad)),
            ))
            metas.append(metadata("actual", center, quad))

    if len(assertions) != COUNT:
        raise AssertionError(f"unique-K4 count drift: {len(assertions)}")
    return assertions, metas


def sha256_stream(assertions: list[z3.BoolRef]) -> str:
    payload = "".join(assertion.sexpr() + "\n" for assertion in assertions)
    return hashlib.sha256(payload.encode()).hexdigest()


def checked_blocks() -> tuple[list[z3.BoolRef], list[dict[str, object]], dict[str, str]]:
    direct, direct_counts, *_ = build_source_assertions("direct")
    mirror, mirror_counts, *_ = build_source_assertions("mirror")
    for counts in (direct_counts, mirror_counts):
        if counts["unique_k4_rank_assertions"] != COUNT:
            raise AssertionError("live unique-K4 count drift")
    direct_slice = direct[START:END]
    mirror_slice = mirror[START:END]
    if [x.sexpr() for x in direct_slice] != [x.sexpr() for x in mirror_slice]:
        raise AssertionError("unique-K4 blocks differ between source orbits")
    hashes: dict[str, str] = {}
    for name, start, end, expected_hash in BLOCKS:
        block = direct[start:end]
        actual_hash = sha256_stream(block)
        if actual_hash != expected_hash:
            raise AssertionError(f"{name} unique-K4 hash drift: {actual_hash}")
        hashes[name] = actual_hash
    expected, metas = expected_blocks()
    for offset, (live, rebuilt) in enumerate(zip(direct_slice, expected, strict=True)):
        if live.sexpr() != rebuilt.sexpr():
            raise AssertionError(
                f"unique-K4 drift at source index {START + offset}:\n"
                f"live: {live.sexpr()}\nrebuilt: {rebuilt.sexpr()}"
            )
    return direct_slice, metas, hashes


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


def member(kind: str, center: int, point: int) -> str:
    if kind == "second":
        return f"shellBit (directSourceShell T) {point}"
    if kind == "first-main" or kind == "actual":
        return f"rowBit (directSourceRows C) 0 {center} {point}"
    if kind == "first-double":
        return f"firstRowBit (directSourceFirstRow T) {point}"
    raise AssertionError(kind)


def and4(terms: list[str]) -> str:
    return "(" + " &&\n          ".join(terms) + ")"


def rank_equal(meta: dict[str, object]) -> str:
    indices = [int(x) for x in meta["rank_indices"]]  # type: ignore[index]
    return and4([
        f"(rankAtom (directSourceRanks P) {indices[0]} == rankAtom (directSourceRanks P) {index})"
        for index in indices[1:]
    ])


def statement(meta: dict[str, object]) -> str:
    kind = str(meta["kind"])
    center = int(meta["center"])
    quad = [int(x) for x in meta["quad"]]  # type: ignore[index]
    ranks = rank_equal(meta)
    if kind == "second":
        displayed = and4([member("second", center, point) for point in quad])
        return f"(!(!{displayed}) || (!{ranks})) = true"
    if kind == "first":
        main = and4([member("first-main", center, point) for point in quad])
        double = and4([member("first-double", center, point) for point in quad])
        return f"(!(!({main} || {double})) || (!{ranks})) = true"
    displayed = and4([member("actual", center, point) for point in quad])
    return (
        f"(!((actualBlockerImageBit P T ({center} : Fin 13) && !{displayed})) ||\n"
        f"      (!{ranks})) = true"
    )


def proof(meta: dict[str, object]) -> str:
    kind = str(meta["kind"])
    center = int(meta["center"])
    quad = [int(x) for x in meta["quad"]]  # type: ignore[index]
    indices = [int(x) for x in meta["rank_indices"]]  # type: ignore[index]
    qargs = " ".join(f"({point} : Fin 13)" for point in quad)
    iargs = " ".join(f"({index} : Fin 78)" for index in indices)
    distinct = " ".join("(by decide)" for _ in range(7))
    pairs = " ".join("(by decide)" for _ in range(4))
    if kind == "second":
        return f"simpa using directSource_unique_second_guard P\n      {qargs} {distinct}\n      {iargs} {pairs}"
    if kind == "first":
        return f"simpa using directSource_unique_first_guard P C hcard hdistinct\n      {qargs} {distinct}\n      {iargs} {pairs}"
    return f"simpa using directSource_unique_actual_guard P C ({center} : Fin 13)\n      {qargs} {distinct}\n      {iargs} {pairs}"


def chunk_text(chunk: int, entries: list[tuple[int, dict[str, object]]]) -> str:
    name = f"UniqueK4AssertionsChunk{chunk:03d}"
    needs_first = any(meta["kind"] == "first" for _index, meta in entries)
    source_args = (
        "\n    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)"
        if needs_first else ""
    )
    fields = "\n".join(f"  h{index} : {statement(meta)}" for index, meta in entries)
    proofs = "\n".join(f"  · {proof(meta)}" for _index, meta in entries)
    return f"""/- Generated by `generate_unique_k4_instances.py`; do not edit. -/
import RankSourceAdapters

/-! Exact generated unique-K4 rank assertion chunk {chunk:03d}. -/

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


def coordinator_text(chunks: list[list[tuple[int, dict[str, object]]]]) -> str:
    imports = "\n".join(f"import UniqueK4AssertionsChunk{chunk:03d}" for chunk in range(len(chunks)))
    fields = "\n".join(
        f"  chunk{chunk:03d} : UniqueK4AssertionsChunk{chunk:03d} P C"
        for chunk in range(len(chunks))
    )
    values = []
    for chunk, entries in enumerate(chunks):
        needs_first = any(meta["kind"] == "first" for _index, meta in entries)
        suffix = " hcard hdistinct" if needs_first else ""
        values.append(
            f"    chunk{chunk:03d} := canonicalUniqueK4AssertionsChunk{chunk:03d} P C{suffix}"
        )
    return f"""/- Generated by `generate_unique_k4_instances.py`; do not edit. -/
{imports}

/-! Coordinator for all exact generated unique-K4 rank assertions. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressScratch

{COMMON_OPENS}

attribute [local instance] Classical.propDecidable
noncomputable section

{COMMON_VARIABLES}

structure CanonicalUniqueK4Assertions (C : CanonicalCoverFamilies T) : Prop where
{fields}

theorem canonicalUniqueK4Assertions
    (C : CanonicalCoverFamilies T)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius) :
    CanonicalUniqueK4Assertions P C :=
  {{
{chr(10).join(values)} }}

#print axioms CanonicalUniqueK4Assertions
#print axioms canonicalUniqueK4Assertions

end
end ATailExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
"""


def main() -> None:
    live, metas, hashes = checked_blocks()
    indexed = [(START + offset, meta) for offset, meta in enumerate(metas)]
    chunks = [indexed[i:i + CHUNK_SIZE] for i in range(0, len(indexed), CHUNK_SIZE)]
    for chunk, entries in enumerate(chunks):
        (HERE / f"UniqueK4AssertionsChunk{chunk:03d}.lean").write_text(
            chunk_text(chunk, entries), encoding="utf-8"
        )
    (HERE / "CanonicalUniqueK4Assertions.lean").write_text(
        coordinator_text(chunks), encoding="utf-8"
    )
    payload = {
        "schema": "exact5-card13-distinct-radius-unique-k4-rank-v1",
        "source_range": [START, END],
        "count": COUNT,
        "chunk_size": CHUNK_SIZE,
        "chunk_count": len(chunks),
        "block_hashes": hashes,
        "both_orbits_identical": True,
        "entries": [
            {"source_index": START + offset, "sexpr": assertion.sexpr(), **metas[offset]}
            for offset, assertion in enumerate(live)
        ],
    }
    (HERE / "unique-k4-assertion-map.json").write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({key: payload[key] for key in (
        "source_range", "count", "chunk_count", "block_hashes", "both_orbits_identical"
    )}, sort_keys=True))


if __name__ == "__main__":
    main()
