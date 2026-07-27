#!/usr/bin/env python3
"""Join verified reduced-union eval facts to current semantic producers.

The generator is intentionally strict: it emits nothing unless every selected
source index has exactly one source-faithful producer whose stored expression
and hash agree with the eval-bridge map.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import re


CONTEXT = r"""
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
    (T : CanonicalAsymmetricSemanticRowTable P star first)
    (C : CanonicalCoverFamilies T)
""".rstrip()


def load(path: Path) -> dict:
    return json.loads(path.read_text())


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def selected(entry: dict, orientation: str) -> bool:
    flag = entry.get(f"selected_{orientation}")
    return True if flag is None else bool(flag)


def producer_entries(path: Path, orientation: str, kind: str) -> list[dict]:
    data = load(path)
    digest = sha256(path)
    base_modules: dict[str, str] = {}
    if kind == "base":
        generated_dir = path.parent / f"generated-{orientation}"
        for module in data.get("modules", []):
            source = generated_dir / f"{module}.lean"
            if not source.is_file():
                raise SystemExit(f"missing base producer module {source}")
            for theorem in re.findall(
                rf"^theorem ({orientation}Source_h\d{{5}})$",
                source.read_text(),
                flags=re.MULTILINE,
            ):
                if theorem in base_modules:
                    raise SystemExit(f"duplicate base producer theorem {theorem}")
                base_modules[theorem] = module
    out = []
    for raw in data["entries"]:
        if not selected(raw, orientation):
            continue
        item = dict(raw)
        item["producer_kind"] = kind
        item["producer_map"] = str(path)
        item["producer_map_sha256"] = digest
        item["producer_sexpr"] = item.get("source_sexpr", item.get("sexpr"))
        item["producer_sexpr_sha256"] = item.get(
            "source_sexpr_sha256", item.get("sexpr_sha256")
        )
        if kind == "base":
            theorem = item["theorem"]
            if theorem not in base_modules:
                raise SystemExit(f"base theorem {theorem} has no generated module")
            item["producer_module"] = base_modules[theorem]
        else:
            module = item.get("module")
            if not module:
                raise SystemExit(
                    f"{kind} theorem at h{item['source_index']:05d} has no module"
                )
            item["producer_module"] = module
        out.append(item)
    return out


def role_type(orientation: str) -> str:
    first, third = (1, 3) if orientation == "direct" else (3, 1)
    return f"""    (hroles :
      P.sourceIndex = ({first} : Fin 13) ∧
        P.blockerIndex = (2 : Fin 13) ∧
        P.thirdIndex = ({third} : Fin 13))
    (hcard : D.A.card = 13)
    (hdistinct : first.doubleRadius ≠ radius)"""


def semantic_arguments() -> str:
    return """      (directSourceRows C) (directSourceBlockers T)
      (directSourceShell T) (directSourceQ T) (directSourceW T)
      (directSourceFirstRow T) (directSourceParentFirst P)
      (directSourceParentSecond P)
      (packCanonicalConnectivity
        (canonicalThreeFamilyReachabilityPacket R.minimal C))
      (directSourceRanks P)"""


def producer_term(entry: dict, orientation: str) -> str:
    if entry["producer_kind"] == "base":
        return (
            "ATailExactFiveCard13DistinctBaseRetainedIngressScratch."
            f"{orientation}Source_h{entry['source_index']:05d} "
            "P T C hroles hcard hdistinct"
        )
    if entry["producer_kind"] == "rank":
        # Every selected-rank declaration is generated under an explicit
        # role-prepacket parameter `P`.  Some map families record only the
        # later declaration arguments (`T`, `C`, ...), so reconstruct the
        # complete call instead of replaying that incomplete proof-term text.
        arguments = entry.get("arguments", "").split()
        if not arguments or arguments[0] != "P":
            arguments.insert(0, "P")
        return " ".join([entry["producer_theorem"], *arguments])
    if entry["producer_kind"] == "exact":
        # Use the imported exact-projection declaration, not its internal
        # proof term.  The latter may mention implementation namespaces that
        # are intentionally not opened by semantic callback modules.
        family_arguments = {
            "current_base_prefix": ["P", "T", "C"],
            "connectivity": ["P", "T", "R.minimal", "C"],
            "parent_first_equality": ["P", "T", "hcard", "hdistinct"],
            "complete_class": ["P", "T", "C", "hcard", "hdistinct"],
            "unique_k4": ["P", "T", "C", "hcard", "hdistinct"],
        }
        try:
            arguments = family_arguments[entry["family"]]
        except KeyError as error:
            raise SystemExit(
                f"unknown exact producer family {entry['family']}"
            ) from error
        call = " ".join([entry["producer_theorem"], *arguments])
        if entry["family"] == "connectivity":
            source_sexpr = entry.get("source_sexpr", "")
            # Stage-zero reachability assertions are already literal packed-bit
            # equalities; only recurrence assertions carry a source RHS/list fold.
            if "(or " not in source_sexpr:
                return call
            if "_forward_" in source_sexpr:
                rhs_definition = "sourceForwardRhs"
            elif "_backward_" in source_sexpr:
                rhs_definition = "sourceBackwardRhs"
            else:
                raise SystemExit(
                    "connectivity entry does not identify forward/backward: "
                    f"{entry['source_index']}"
                )
            return (
                "(by\n"
                f"    have h := {call}\n"
                f"    simp only [{rhs_definition}, connectivityFinBit] at h\n"
                "    simp_rw [← rowBit_directSourceRows C] at h\n"
                "    simpa only [List.finRange, List.ofFn, List.any,\n"
                "      Fin.foldr, Fin.foldr.loop, Bool.or_assoc, Bool.or_false] using h)"
            )
        return call
    return entry["proof_term"].replace("hmin", "R.minimal")


def header(imports: list[str], title: str) -> str:
    return f"""/- Generated by `generate_reduced_union_semantic_bridge.py`; do not edit. -/
{chr(10).join(f'import {item}' for item in imports)}

/-! {title} -/

namespace Problem97
namespace ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch

open ATailBiApexRobustCapBounds
open ATailCriticalPairFrontier
open ATailExactFiveCard13CnfIngressScratch
open ATailExactFiveCard13CommonLabelTransportScratch
open ATailExactFiveGlobalCrossDeletionPair
open ATailExactFiveGlobalCoverStarGeometry
open ATailExactFiveMutualOneHitGeometry
open ATailFirstApexShellRole
open ATailLargeCapUniqueFive
open ATailLargeCapUniqueFivePhysicalOmissionCycle
open ATailLargeCapUniqueFivePhysicalOmissionTransitionGlobal
open ATailOrientedPhysicalApexIngress
open ATailParentExactFiveSecondCap
open ATailPhysicalSecondApexCommonDeletion
open CanonicalAsymmetricSemanticRowTable
open ExactFiveCard13DistinctRadiusSourceIngressScratch
open Std.Tactic.BVDecide

attribute [local instance] Classical.propDecidable
set_option maxRecDepth 1000000
set_option maxHeartbeats 0
set_option linter.unusedVariables false
noncomputable section
"""


FOOTER = """
end
end ATailExactFiveCard13DistinctRadiusSourceIngressCoordinatorScratch
end Problem97
"""


def generate(args: argparse.Namespace) -> None:
    orientation = args.orientation
    cap = orientation.capitalize()
    eval_data = load(args.eval_map)
    if eval_data.get("orientation") != orientation or not eval_data.get("complete"):
        raise SystemExit("eval map is not the requested complete orientation")

    producers: dict[int, list[dict]] = {}
    for path, kind in (
        (args.base_map, "base"),
        (args.exact_map, "exact"),
        (args.rank_map, "rank"),
    ):
        for entry in producer_entries(path, orientation, kind):
            producers.setdefault(entry["source_index"], []).append(entry)

    eval_entries = eval_data["entries"]
    emitted_chunks = eval_data["emitted_chunks"]
    if args.test_chunks is not None:
        if args.test_chunks <= 0 or args.test_chunks > emitted_chunks:
            raise SystemExit("--test-chunks is outside the emitted chunk range")
        eval_entries = [
            entry for entry in eval_entries if entry["union_chunk"] < args.test_chunks
        ]
        emitted_chunks = args.test_chunks

    joined = []
    errors = []
    for entry in eval_entries:
        matches = producers.get(entry["source_index"], [])
        if len(matches) != 1:
            errors.append((entry["source_index"], f"producer-count={len(matches)}"))
            continue
        producer = matches[0]
        if producer["producer_sexpr"] != entry["source_sexpr"]:
            errors.append((entry["source_index"], "source expression mismatch"))
            continue
        if producer["producer_sexpr_sha256"] != entry["source_sexpr_sha256"]:
            errors.append((entry["source_index"], "source expression hash mismatch"))
            continue
        joined.append(
            {
                **entry,
                **producer,
                "eval_theorem": entry["theorem"],
                "producer_theorem": producer.get(
                    "theorem", producer.get("declaration")
                ),
            }
        )
    if errors:
        preview = ", ".join(f"h{i}:{why}" for i, why in errors[:20])
        raise SystemExit(f"semantic coverage incomplete ({len(errors)}): {preview}")

    chunks: dict[int, list[dict]] = {}
    for entry in joined:
        chunks.setdefault(entry["union_chunk"], []).append(entry)
    if sorted(chunks) != list(range(emitted_chunks)):
        raise SystemExit("semantic chunk sequence is not contiguous")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    base_module = f"{cap}ReducedUnionSemanticBridgeBase"
    verified_ns = f"Problem97.ATailExactFiveDistinctReducedUnionVerified{cap}"
    base_text = header(
        ["SelectedSemanticAssignment", f"VerifiedDistinctReducedUnion{cap}.Base"],
        f"{cap} reduced-union semantic folding helper",
    )
    base_text += f"""
open {verified_ns}

theorem {orientation}Bands_sat_of_each (source : BVExpr.Assignment) :
    ∀ items : List BVLogicalExpr,
      (∀ item ∈ items, item.eval source = true) →
        ({verified_ns}.bands items).eval source = true := by
  intro items h
  induction items with
  | nil => rfl
  | cons item items ih =>
      simp only [{verified_ns}.bands, BVLogicalExpr.eval_gate, Gate.eval,
        Bool.and_eq_true]
      exact ⟨h item (by simp), ih (fun candidate hc => h candidate (by simp [hc]))⟩
"""
    base_text += FOOTER
    (args.output_dir / f"{base_module}.lean").write_text(base_text)

    chunk_modules = []
    output_entries = []
    for chunk, entries in sorted(chunks.items()):
        chunk_name = f"{chunk:03d}"
        module = f"{cap}ReducedUnionSemanticBridgeChunk{chunk_name}"
        chunk_modules.append(module)
        producer_modules = sorted({entry["producer_module"] for entry in entries})
        text = header(
            [
                base_module,
                f"{cap}ReducedUnionEvalBridgeChunk{chunk_name}",
                *producer_modules,
            ],
            f"{cap} reduced-union semantic chunk {chunk_name}",
        )
        text += f"\nopen {verified_ns}\n"
        for entry in entries:
            source = entry["source_index"]
            offset = entry["chunk_offset"]
            theorem = f"{orientation}ReducedUnionItem_h{source:05d}_sat"
            text += f"""

theorem {theorem}
{CONTEXT}
{role_type(orientation)} :
    (reducedUnionChunk{chunk_name}Assertions.get ⟨{offset}, by decide⟩).eval
      (selectedSemanticAssignment P T R.minimal C) = true := by
  change
    (reducedUnionChunk{chunk_name}Assertions.get ⟨{offset}, by decide⟩).eval
      (selectedSourceAssignment
{semantic_arguments()}) = true
  rw [{entry['eval_theorem']}
{semantic_arguments()}]
  exact {producer_term(entry, orientation)}
"""
            output_entries.append(
                {
                    "source_index": source,
                    "union_chunk": chunk,
                    "chunk_offset": offset,
                    "theorem": theorem,
                    "producer_kind": entry["producer_kind"],
                    "producer_module": entry["producer_module"],
                    "producer_theorem": entry["producer_theorem"],
                    "source_sexpr_sha256": entry["source_sexpr_sha256"],
                }
            )

        text += f"""

theorem {orientation}ReducedUnionChunk{chunk_name}_sat
{CONTEXT}
{role_type(orientation)} :
    (bands reducedUnionChunk{chunk_name}Assertions).eval
      (selectedSemanticAssignment P T R.minimal C) = true := by
  apply {orientation}Bands_sat_of_each
  intro item hitem
  simp only [reducedUnionChunk{chunk_name}Assertions, List.mem_cons,
    List.not_mem_nil, or_false] at hitem
"""
        alternatives = " | ".join(f"h{i}" for i in range(len(entries)))
        text += f"  rcases hitem with {alternatives}\n"
        for i, entry in enumerate(entries):
            source = entry["source_index"]
            theorem = f"{orientation}ReducedUnionItem_h{source:05d}_sat"
            text += f"""  · subst item
    simpa only [reducedUnionChunk{chunk_name}Assertions] using
      {theorem} P T C hroles hcard hdistinct
"""
        text += FOOTER
        (args.output_dir / f"{module}.lean").write_text(text)

    if args.test_chunks is not None:
        print(
            json.dumps(
                {
                    "orientation": orientation,
                    "entry_count": len(output_entries),
                    "chunk_count": len(chunks),
                    "test_only": True,
                },
                indent=2,
            )
        )
        return

    aggregate = f"{cap}ReducedUnionSemanticBridge"
    text = header(
        [*chunk_modules, f"VerifiedDistinctReducedUnion{cap}.Certificate"],
        f"Complete {orientation} reduced-union semantic contradiction",
    )
    text += f"\nopen {verified_ns}\n"
    text += f"""

theorem {orientation}ReducedUnionExpr_sat
{CONTEXT}
{role_type(orientation)} :
    reducedUnionExpr.eval (selectedSemanticAssignment P T R.minimal C) = true := by
  unfold reducedUnionExpr reducedUnionChunks reducedUnionAssertionChunks
  simp only [List.map_cons, List.map_nil]
  apply {orientation}Bands_sat_of_each
  intro item hitem
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hitem
"""
    alternatives = " | ".join(f"h{i}" for i in sorted(chunks))
    text += f"  rcases hitem with {alternatives}\n"
    for chunk in sorted(chunks):
        chunk_name = f"{chunk:03d}"
        text += f"""  · subst item
    exact {orientation}ReducedUnionChunk{chunk_name}_sat
      P T C hroles hcard hdistinct
"""
    text += f"""

theorem false_of_{orientation}ReducedUnion
{CONTEXT}
{role_type(orientation)} : False := by
  have hs := {orientation}ReducedUnionExpr_sat
    P T C hroles hcard hdistinct
  have hu := reducedUnionExpr_unsat (selectedSemanticAssignment P T R.minimal C)
  exact Bool.noConfusion (hu.symm.trans hs)

#print axioms false_of_{orientation}ReducedUnion
"""
    text += FOOTER
    (args.output_dir / f"{aggregate}.lean").write_text(text)

    result = {
        "schema": "p97-exact5-distinct-reduced-union-semantic-bridge-v1",
        "orientation": orientation,
        "complete": True,
        "entry_count": len(output_entries),
        "chunk_count": len(chunks),
        "eval_map": str(args.eval_map),
        "eval_map_sha256": sha256(args.eval_map),
        "producer_maps": {
            "base": {"path": str(args.base_map), "sha256": sha256(args.base_map)},
            "exact": {"path": str(args.exact_map), "sha256": sha256(args.exact_map)},
            "rank": {"path": str(args.rank_map), "sha256": sha256(args.rank_map)},
        },
        "entries": output_entries,
    }
    (args.output_dir / f"{orientation}-semantic-bridge-map.json").write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n"
    )
    print(json.dumps({k: result[k] for k in ("orientation", "entry_count", "chunk_count")}, indent=2))


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orientation", choices=("direct", "mirror"), required=True)
    parser.add_argument("--eval-map", type=Path, required=True)
    parser.add_argument("--base-map", type=Path, required=True)
    parser.add_argument("--exact-map", type=Path, required=True)
    parser.add_argument("--rank-map", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    parser.add_argument("--test-chunks", type=int)
    generate(parser.parse_args())


if __name__ == "__main__":
    main()
