#!/usr/bin/env python3
"""Compose the middle source adapters with the persisted verified endpoint.

The emitted chunk modules preserve the original-frame middle orbit.  They
package the source-faithful Boolean facts in groups matching the certificate
chunks; the final module applies the persisted kernel-checked UNSAT theorem.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path


VARIABLES = """variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {profile : LargeCapUniqueFiveSecondApexRadius D S}
    {P : CanonicalCard13Frame profile}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {hall : AllPhysicalActualCriticalRowsOneHit H profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAllOneSemanticRowTable P star hall first}"""


BASE_NO_INGRESS = set(range(1879, 1886)) | {1913, 1914} | set(range(1919, 1947))


def adapter(position: int, source_index: int, packed_term: str, base_count: int) -> str:
    name = f"middleSource_h{position:04d}"
    ingress = "(CanonicalAllOneSourceOrbitIngress.middle C)"
    if position in {1947, 1948, 1949}:
        return f"({name} {ingress} C rfl)"
    if source_index < base_count and position in BASE_NO_INGRESS:
        return f"({name})"
    if source_index >= base_count and "rowBit rows" not in packed_term:
        return f"({name})"
    return f"({name} {ingress})"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--obligations", type=Path, required=True)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()

    payload = json.loads(args.obligations.read_text(encoding="utf-8"))
    if payload.get("orbit") != "allOneHitHubMiddle":
        raise ValueError("expected the original-frame middle source orbit")
    if not payload.get("complete") or not payload.get("has_certificate_endpoint"):
        raise ValueError("composition requires the complete persisted certificate endpoint")

    obligations = payload["obligations"]
    positions = [int(item["core_position"]) for item in obligations]
    if positions != list(range(len(positions))):
        raise ValueError("source obligations are not a dense zero-based range")

    base_count = int(payload["source_counts"]["base_assertions"])
    by_chunk: dict[int, list[dict[str, object]]] = {}
    for item in obligations:
        by_chunk.setdefault(int(item["chunk"]), []).append(item)
    if sorted(by_chunk) != list(range(len(by_chunk))):
        raise ValueError("certificate chunks are not a dense zero-based range")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    module_names: list[str] = []
    for chunk, chunk_items in sorted(by_chunk.items()):
        chunk_positions = [int(item["core_position"]) for item in chunk_items]
        module = f"AllOneMiddleSourceChunk{chunk:03d}"
        module_names.append(module)
        imports = [f"AllOneMiddleVerifiedBridgeChunk{chunk:03d}"]
        if any(position < 1952 for position in chunk_positions):
            if chunk in {28, 29}:
                imports.extend(
                    f"AllOneMiddleBaseInstancesChunk{chunk:03d}Part{part:03d}"
                    for part in range(64)
                )
            else:
                imports.append(f"AllOneMiddleBaseInstancesChunk{chunk:03d}")
        if any(position >= 1952 for position in chunk_positions):
            imports.append(f"AllOneMiddleRankInstancesChunk{chunk:03d}")
        import_text = "\n".join(f"import {name}" for name in imports)
        facts = "\n    ".join(
            adapter(
                int(item["core_position"]),
                int(item["source_index"]),
                str(item["packed_term"]),
                base_count,
            )
            for item in chunk_items
        )
        text = f"""/-
Generated source-faithful composition for middle certificate chunk {chunk:03d}.
-/
{import_text}

/-!
# Middle source composition chunk {chunk:03d}

Source-faithful Boolean facts for one chunk of the verified certificate.
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
open Problem97.ATailExactFiveCard13AllOneCertificate.Middle

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

{VARIABLES}

/-- The live middle source facts satisfy certificate chunk {chunk:03d}. -/
theorem middleSourceChunk{chunk:03d}_each
    (C : CanonicalAlignedCoverFamilies T 2 1 3) :
    ∀ item ∈ sourceChunk{chunk:03d}Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.middle C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk{chunk:03d}_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.middle C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    {facts}

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
"""
        (args.output_dir / f"{module}.lean").write_text(text, encoding="utf-8")

    imports = "import AllOneMiddleVerifiedEndpoint\n" + "\n".join(
        f"import {name}" for name in module_names
    )
    chunk_facts = "\n    ".join(
        f"(middleSourceChunk{chunk:03d}_each C)" for chunk in sorted(by_chunk)
    )
    aggregate = f"""/-
Generated final source-faithful middle-orbit composition.
-/
{imports}

/-!
# Middle all-one source closure

Composition of all live source facts with the persisted verified endpoint.
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
open Problem97.ATailExactFiveCard13AllOneCertificate.Middle

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

{VARIABLES}

/-- The original-frame middle all-one source orbit contradicts the persisted
kernel-checked finite certificate. -/
theorem false_of_middleAllOneSourceOrbit
    (C : CanonicalAlignedCoverFamilies T 2 1 3) : False := by
  exact false_of_sourceChunks_each
    (sourceAssignment
      (sourceRows (CanonicalAllOneSourceOrbitIngress.middle C))
      (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
      (sourceFirstApexRow T) (sourceRanks P))
    {chunk_facts}

#print axioms false_of_middleAllOneSourceOrbit

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
"""
    (args.output_dir / "AllOneMiddleSourceClosure.lean").write_text(
        aggregate, encoding="utf-8"
    )
    print(json.dumps({
        "chunks": len(by_chunk),
        "source_assertions": len(obligations),
        "final_module": "AllOneMiddleSourceClosure",
    }, indent=2))


if __name__ == "__main__":
    main()
