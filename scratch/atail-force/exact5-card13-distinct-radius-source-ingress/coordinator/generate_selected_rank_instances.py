#!/usr/bin/env python3
"""Generate the manifest-selected rank and Kalmanson source producers.

The generator consumes the tracked complete best-core manifest, rebuilds both
live source streams, and fails unless every emitted source expression is
identical in the direct and mirror streams.  The final direct and mirror proof
roots remain separate; only these expression-identical semantic producers are
shared.
"""

from __future__ import annotations

import argparse
from collections import Counter
import hashlib
from itertools import combinations
import json
from pathlib import Path
import re
import sys
from typing import Any

import z3


HERE = Path(__file__).resolve().parent
AUDIT = HERE.parent.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT))

from distinct_source_terms import build_source_assertions  # noqa: E402
from generate_reduced_union_routes import (  # noqa: E402
    ORBIT,
    load_union_manifest,
    route,
    sha256_file,
)


TRACKED_MANIFEST = (
    HERE.parent.parent
    / "exact5-card13-distinct-radius-source-core-discovery"
    / "best-checked-cores.complete.json.gz"
)
TRACKED_MANIFEST_SHA256 = (
    "c620897150393c053e6c06e99ffd1a772b123748b14fd7a4ced3db0fcb88901e"
)
CHUNK_SIZE = 64
PAIRS = tuple(combinations(range(13), 2))
PAIR_INDEX = {pair: index for index, pair in enumerate(PAIRS)}


def pair_index(a: int, b: int) -> int:
    return PAIR_INDEX[tuple(sorted((a, b)))]


def semantic_atom(name: str) -> str:
    match = re.fullmatch(r"(m|g0|g1)_(\d+)_(\d+)", name)
    if match:
        family = {"m": 0, "g0": 1, "g1": 2}[match.group(1)]
        return (
            f"rowBit (directSourceRows C) {family} "
            f"{match.group(2)} {match.group(3)}"
        )
    match = re.fullmatch(r"b1_(\d+)", name)
    if match:
        return f"firstRowBit (directSourceFirstRow T) {match.group(1)}"
    match = re.fullmatch(r"shell_(\d+)", name)
    if match:
        return f"shellBit (directSourceShell T) {match.group(1)}"
    match = re.fullmatch(r"parent_first_(\d+)", name)
    if match:
        return (
            f"parentRowBit (directSourceParentFirst P) {match.group(1)}"
        )
    match = re.fullmatch(r"parent_second_(\d+)", name)
    if match:
        return (
            f"parentRowBit (directSourceParentSecond P) {match.group(1)}"
        )
    match = re.fullmatch(r"ord_rank_(\d+)_(\d+)", name)
    if match:
        index = pair_index(int(match.group(1)), int(match.group(2)))
        return f"rankAtom (directSourceRanks P) {index}"
    raise ValueError(f"unsupported selected-rank atom {name!r}")


def numeral(expression: z3.ExprRef, width: int) -> str:
    if z3.is_bv_value(expression):
        if expression.size() != width:
            raise ValueError(f"unexpected numeral width in {expression}")
        return f"{expression.as_long()}#{width}"
    if z3.is_int_value(expression):
        return f"{expression.as_long()}#{width}"
    raise ValueError(f"not a numeral: {expression}")


def value_width(expression: z3.ExprRef) -> int:
    if z3.is_bv(expression):
        return expression.size()
    if z3.is_int(expression):
        return 4
    raise ValueError(f"unsupported value sort: {expression.sort()}")


def emit_value(expression: z3.ExprRef, width: int | None = None) -> str:
    if (
        z3.is_const(expression)
        and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
    ):
        return semantic_atom(str(expression))
    if z3.is_bv_value(expression):
        return numeral(expression, expression.size())
    if z3.is_int_value(expression):
        return numeral(expression, 4 if width is None else width)
    raise ValueError(f"unsupported value expression: {expression.sexpr()}")


def emit_bool(expression: z3.BoolRef) -> str:
    if z3.is_true(expression):
        return "true"
    if z3.is_false(expression):
        return "false"
    if (
        z3.is_const(expression)
        and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
    ):
        return semantic_atom(str(expression))
    if z3.is_not(expression):
        return f"!({emit_bool(expression.arg(0))})"
    if z3.is_and(expression):
        return "(" + " && ".join(emit_bool(x) for x in expression.children()) + ")"
    if z3.is_or(expression):
        return "(" + " || ".join(emit_bool(x) for x in expression.children()) + ")"
    if z3.is_implies(expression):
        return f"(!({emit_bool(expression.arg(0))}) || ({emit_bool(expression.arg(1))}))"
    if z3.is_eq(expression):
        left, right = expression.children()
        if z3.is_bool(left):
            return f"({emit_bool(left)} == {emit_bool(right)})"
        width = max(value_width(left), value_width(right))
        return f"({emit_value(left, width)} == {emit_value(right, width)})"
    kind = expression.decl().kind()
    if kind in {z3.Z3_OP_ULT, z3.Z3_OP_UGT}:
        left, right = expression.children()
        if kind == z3.Z3_OP_ULT:
            return f"({emit_value(left)}).ult ({emit_value(right)})"
        return f"({emit_value(right)}).ult ({emit_value(left)})"
    raise ValueError(
        f"unsupported selected-rank Boolean operation {kind}: {expression.sexpr()}"
    )


def rank_index_of_atom(expression: z3.ExprRef) -> int:
    if not (
        z3.is_const(expression)
        and expression.decl().kind() == z3.Z3_OP_UNINTERPRETED
    ):
        raise ValueError(f"rank term is not an atom: {expression.sexpr()}")
    match = re.fullmatch(r"ord_rank_(\d+)_(\d+)", str(expression))
    if match is None:
        raise ValueError(f"unexpected rank atom {expression}")
    return pair_index(int(match.group(1)), int(match.group(2)))


def row_metadata(index: int) -> dict[str, int | str]:
    if 41_394 <= index < 43_968:
        offset = index - 41_394
        group, within = divmod(offset, 66)
        family, center = divmod(group, 13)
        tag = ("m", "g0", "g1")[family]
        members = [point for point in range(13) if point != center]
        left, right = tuple(combinations(members, 2))[within]
        return {
            "family": "selected_row",
            "row_family": family,
            "row_tag": tag,
            "center": center,
            "left": left,
            "right": right,
        }
    row_blocks = (
        (43_968, 44_034, "first_row", "b1", 4),
        (44_034, 44_100, "exact_five_shell", "shell", 8),
        (44_100, 44_166, "parent_first", "parent_first", 4),
        (44_166, 44_232, "parent_second", "parent_second", 8),
    )
    for start, end, family, tag, center in row_blocks:
        if start <= index < end:
            members = [point for point in range(13) if point != center]
            left, right = tuple(combinations(members, 2))[index - start]
            return {
                "family": family,
                "row_tag": tag,
                "center": center,
                "left": left,
                "right": right,
            }
    raise ValueError(f"h{index} is not a guarded row assertion")


def expected_row_sexpr(meta: dict[str, int | str]) -> str:
    tag = str(meta["row_tag"])
    center = int(meta["center"])
    left = int(meta["left"])
    right = int(meta["right"])
    if tag in {"m", "g0", "g1"}:
        left_atom = z3.Bool(f"{tag}_{center}_{left}")
        right_atom = z3.Bool(f"{tag}_{center}_{right}")
    else:
        left_atom = z3.Bool(f"{tag}_{left}")
        right_atom = z3.Bool(f"{tag}_{right}")
    rank_left = z3.BitVec(f"ord_rank_{min(center, left)}_{max(center, left)}", 7)
    rank_right = z3.BitVec(f"ord_rank_{min(center, right)}_{max(center, right)}", 7)
    return z3.Implies(
        z3.And(left_atom, right_atom), rank_left == rank_right
    ).sexpr()


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
        for vertex in PAIRS[index]
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


def theorem_for(index: int, assertion: z3.BoolRef) -> tuple[str, str, dict[str, Any]]:
    conclusion = emit_bool(assertion)
    name = f"selectedRankSource_h{index:05d}"
    meta: dict[str, Any] = {"source_index": index, "theorem": name}

    if 41_316 <= index < 41_394:
        rank = index - 41_316
        expected_pair = PAIRS[rank]
        expected = z3.ULT(
            z3.BitVec(f"ord_rank_{expected_pair[0]}_{expected_pair[1]}", 7),
            z3.BitVecVal(78, 7),
        )
        if assertion.sexpr() != expected.sexpr():
            raise AssertionError(f"rank-bound drift at h{index}")
        family = "rank_bound"
        arguments = "P"
        proof = (
            f"  exact rankAtom_directSourceRanks_ult_seventyEight "
            f"P ({rank} : Fin 78)"
        )
        meta.update(rank=rank)
    elif 41_394 <= index < 44_232:
        row = row_metadata(index)
        if assertion.sexpr() != expected_row_sexpr(row):
            raise AssertionError(f"guarded-row drift at h{index}")
        family = str(row["family"])
        center = int(row["center"])
        left = int(row["left"])
        right = int(row["right"])
        rank_left = pair_index(center, left)
        rank_right = pair_index(center, right)
        distance_args = f"""({left} : Fin 13) ({right} : Fin 13)
    ({rank_left} : Fin 78) ({rank_right} : Fin 78)
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_left} : Fin 78) ({center} : Fin 13) ({left} : Fin 13) (by decide))
    (cardThirteenPairDistance_eq_centerDistance P
      ({rank_right} : Fin 78) ({center} : Fin 13) ({right} : Fin 13) (by decide))"""
        if family == "selected_row":
            arguments = "T C"
            row_family = int(row["row_family"])
            proof = (
                f"  exact directSource_row_rank_guard C ({row_family} : Fin 3) "
                f"({center} : Fin 13)\n    {distance_args}"
            )
        elif family == "first_row":
            arguments = "T"
            proof = f"  exact directSource_firstRow_rank_guard\n    {distance_args}"
        elif family == "exact_five_shell":
            arguments = "T"
            proof = f"  exact directSource_shell_rank_guard\n    {distance_args}"
        elif family == "parent_first":
            arguments = "T hcard hdistinct"
            proof = (
                "  exact directSource_parentFirst_rank_guard T hcard hdistinct\n"
                f"    {distance_args}"
            )
        elif family == "parent_second":
            arguments = "P"
            proof = f"  exact directSource_parentSecond_rank_guard\n    {distance_args}"
        else:
            raise AssertionError(family)
        meta.update(row, rank_left=rank_left, rank_right=rank_right)
    elif 52_713 <= index < 58_433:
        if not z3.is_implies(assertion):
            raise AssertionError(f"Kalmanson source h{index} is not an implication")
        antecedent, consequent = assertion.children()
        if not z3.is_eq(antecedent) or consequent.decl().kind() != z3.Z3_OP_UGT:
            raise AssertionError(f"Kalmanson source h{index} has the wrong shape")
        positive_canceled = rank_index_of_atom(antecedent.arg(0))
        negative_canceled = rank_index_of_atom(antecedent.arg(1))
        positive_mate = rank_index_of_atom(consequent.arg(0))
        negative_mate = rank_index_of_atom(consequent.arg(1))
        vertices, branch, pair_indices = kalmanson_case(
            positive_mate,
            positive_canceled,
            negative_mate,
            negative_canceled,
        )
        a, b, c, d = vertices
        i_bc, i_ad, i_ac, i_bd, i_ab, i_cd = pair_indices
        family = "kalmanson"
        arguments = "P"
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
        meta.update(
            vertices=list(vertices),
            kalmanson_branch=branch,
            positive_mate=positive_mate,
            positive_canceled=positive_canceled,
            negative_mate=negative_mate,
            negative_canceled=negative_canceled,
        )
    else:
        raise ValueError(f"h{index} is not in the selected rank/Kalmanson surface")

    if family == "selected_row":
        binders = """    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)"""
    elif family in {"first_row", "exact_five_shell"}:
        binders = "    (T : CanonicalAsymmetricSemanticRowTable P star first)"
    elif family == "parent_first":
        binders = """    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (hcard : D.A.card = 13) (hdistinct : first.doubleRadius ≠ radius)"""
    else:
        binders = ""
    binder_text = f"\n{binders}" if binders else ""
    theorem = f"""/-- Manifest-selected source assertion `h{index}` ({family}). -/
theorem {name}{binder_text} :
    ({conclusion}) = true := by
{proof}
"""
    meta.update(
        arguments=arguments,
        declaration=name,
        family=family,
        proof_term=f"{name} {arguments}".rstrip(),
        simp_definitions=[],
        source_sexpr=assertion.sexpr(),
        source_sexpr_sha256=hashlib.sha256(assertion.sexpr().encode()).hexdigest(),
    )
    return family, theorem, meta


HEADER = """/- Generated by `generate_selected_rank_instances.py`; do not edit. -/
import ParentRowIngressAdapters

/-! Manifest-selected shared rank and Kalmanson source producers. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
open ATailExactFiveCard13CnfIngressScratch
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

"""

FOOTER = """
end
end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97
"""


def load_selected(
    manifest: Path, manifest_sha256: str
) -> tuple[dict[str, list[int]], dict[str, list[z3.BoolRef]]]:
    selected: dict[str, list[int]] = {}
    assertions: dict[str, list[z3.BoolRef]] = {}
    for orientation in ("direct", "mirror"):
        _payload, indices = load_union_manifest(
            manifest, manifest_sha256, orientation
        )
        selected[orientation] = [
            index
            for index in indices
            if route(index)["status"] == "generic_template_ready"
        ]
        current, _counts, _outer, _ranks = build_source_assertions(orientation)
        assertions[orientation] = current
        expected_sha256 = ORBIT[orientation]["source_stream_sha256"]
        payload = "".join(item.sexpr() + "\n" for item in current).encode()
        if hashlib.sha256(payload).hexdigest() != expected_sha256:
            raise AssertionError(f"{orientation} live source stream drift")
    return selected, assertions


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", type=Path, default=TRACKED_MANIFEST)
    parser.add_argument(
        "--manifest-sha256", default=TRACKED_MANIFEST_SHA256
    )
    parser.add_argument("--output-dir", type=Path, default=HERE / "selected-rank")
    parser.add_argument("--chunk-size", type=int, default=CHUNK_SIZE)
    args = parser.parse_args()

    if args.chunk_size <= 0:
        raise ValueError("chunk size must be positive")
    if sha256_file(args.manifest) != args.manifest_sha256:
        raise AssertionError("tracked complete-manifest SHA-256 drift")
    selected, assertions = load_selected(args.manifest, args.manifest_sha256)
    union = sorted(set(selected["direct"]) | set(selected["mirror"]))
    if not union:
        raise ValueError("selected rank/Kalmanson union is empty")

    for index in union:
        direct = assertions["direct"][index].sexpr()
        mirror = assertions["mirror"][index].sexpr()
        if direct != mirror:
            raise AssertionError(
                f"direct/mirror expression mismatch at shared producer h{index}"
            )

    emitted: list[tuple[int, str, dict[str, Any]]] = []
    families: Counter[str] = Counter()
    selected_sets = {
        orientation: set(indices) for orientation, indices in selected.items()
    }
    for index in union:
        family, theorem, meta = theorem_for(index, assertions["direct"][index])
        meta["selected_direct"] = index in selected_sets["direct"]
        meta["selected_mirror"] = index in selected_sets["mirror"]
        families[family] += 1
        emitted.append((index, theorem, meta))

    args.output_dir.mkdir(parents=True, exist_ok=True)
    chunks = [
        emitted[offset:offset + args.chunk_size]
        for offset in range(0, len(emitted), args.chunk_size)
    ]
    chunk_paths: list[Path] = []
    for chunk, entries in enumerate(chunks):
        path = args.output_dir / f"SelectedRankAssertionsChunk{chunk:03d}.lean"
        path.write_text(
            HEADER + "\n".join(theorem for _index, theorem, _meta in entries) + FOOTER,
            encoding="utf-8",
        )
        chunk_paths.append(path)
        for _index, _theorem, meta in entries:
            meta["module"] = path.stem
            meta["chunk"] = chunk

    representative: dict[str, str] = {}
    for _index, _theorem, meta in emitted:
        representative.setdefault(str(meta["family"]), str(meta["theorem"]))
    imports = "\n".join(f"import {path.stem}" for path in chunk_paths)
    axiom_checks = "\n".join(
        f"#print axioms {theorem}" for _family, theorem in sorted(representative.items())
    )
    coordinator = args.output_dir / "SelectedRankAssertions.lean"
    coordinator.write_text(
        f"""/- Generated by `generate_selected_rank_instances.py`; do not edit. -/
{imports}

/-! Aggregate import and representative axiom audit for selected producers. -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

{axiom_checks}

end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97
""",
        encoding="utf-8",
    )

    source_hash = hashlib.sha256()
    for index in union:
        source_hash.update(f"{index}\0".encode())
        source_hash.update(assertions["direct"][index].sexpr().encode())
        source_hash.update(b"\n")
    map_payload = {
        "schema": "p97-exact5-distinct-selected-rank-producers-v1",
        "status": "GENERATED_SOURCE_PRODUCERS",
        "manifest": str(args.manifest),
        "manifest_sha256": args.manifest_sha256,
        "direct_source_stream_sha256": ORBIT["direct"]["source_stream_sha256"],
        "mirror_source_stream_sha256": ORBIT["mirror"]["source_stream_sha256"],
        "direct_selected_count": len(selected["direct"]),
        "mirror_selected_count": len(selected["mirror"]),
        "shared_producer_union_count": len(union),
        "shared_producer_union_sha256": source_hash.hexdigest(),
        "direct_mirror_expressions_identical_on_union": True,
        "chunk_size": args.chunk_size,
        "chunk_count": len(chunks),
        "counts_by_family": dict(sorted(families.items())),
        "entries": [meta for _index, _theorem, meta in emitted],
    }
    map_path = args.output_dir / "selected-rank-assertion-map.json"
    map_path.write_text(
        json.dumps(map_payload, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
    )
    print(json.dumps({
        key: map_payload[key]
        for key in (
            "manifest_sha256",
            "direct_selected_count",
            "mirror_selected_count",
            "shared_producer_union_count",
            "shared_producer_union_sha256",
            "chunk_count",
            "counts_by_family",
        )
    }, sort_keys=True))


if __name__ == "__main__":
    main()
