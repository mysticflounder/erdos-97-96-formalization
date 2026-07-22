#!/usr/bin/env python3
"""Compose all-one source adapters with a persisted verified endpoint.

The emitted chunk modules preserve the original-frame boundary orbit.  They
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


ORBIT_CONFIG = {
    "middle": {
        "payload_orbit": "allOneHitHubMiddle",
        "title": "Middle",
        "constructor": "middle",
        "cover_indices": "2 1 3",
    },
    "left": {
        "payload_orbit": "allOneHitHubLeft",
        "title": "Left",
        "constructor": "left",
        "cover_indices": "1 2 3",
    },
    "right": {
        "payload_orbit": "allOneHitHubRight",
        "title": "Right",
        "constructor": "right",
        "cover_indices": "3 1 2",
    },
}


def adapter(
    orbit: str,
    item: dict[str, object],
    middle_by_term: dict[str, dict[str, object]],
    base_count: int,
) -> str:
    target_position = int(item["core_position"])
    packed_term = str(item["packed_term"])
    ingress = f"(CanonicalAllOneSourceOrbitIngress.{orbit} C)"
    if orbit != "middle" and target_position in {1947, 1948, 1949}:
        return f"({orbit}Source_h{target_position:04d} C)"

    middle_item = middle_by_term.get(packed_term)
    if middle_item is None:
        raise ValueError(
            f"{orbit} h{target_position:04d} has no shared middle adapter: {packed_term}"
        )
    position = int(middle_item["core_position"])
    source_index = int(middle_item["source_index"])
    name = f"middleSource_h{position:04d}"
    if orbit == "middle" and position in {1947, 1948, 1949}:
        return f"({name} {ingress} C rfl)"
    if source_index < base_count and position in BASE_NO_INGRESS:
        return f"({name})"
    if source_index >= base_count and "rowBit rows" not in packed_term:
        return f"({name})"
    return f"({name} {ingress})"


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--orbit", choices=sorted(ORBIT_CONFIG), default="middle")
    parser.add_argument("--obligations", type=Path, required=True)
    parser.add_argument("--middle-obligations", type=Path)
    parser.add_argument("--output-dir", type=Path, required=True)
    args = parser.parse_args()

    config = ORBIT_CONFIG[args.orbit]
    title = str(config["title"])
    constructor = str(config["constructor"])
    cover_indices = str(config["cover_indices"])
    payload = json.loads(args.obligations.read_text(encoding="utf-8"))
    if payload.get("orbit") != config["payload_orbit"]:
        raise ValueError(f"expected the original-frame {args.orbit} source orbit")
    if not payload.get("complete") or not payload.get("has_certificate_endpoint"):
        raise ValueError("composition requires the complete persisted certificate endpoint")

    if args.orbit == "middle":
        middle_payload = payload
    else:
        if args.middle_obligations is None:
            raise ValueError("non-middle composition requires --middle-obligations")
        middle_payload = json.loads(args.middle_obligations.read_text(encoding="utf-8"))
        if middle_payload.get("orbit") != "allOneHitHubMiddle":
            raise ValueError("the shared adapter source is not the middle orbit")
    middle_by_term = {
        str(item["packed_term"]): item for item in middle_payload["obligations"]
    }

    obligations = payload["obligations"]
    positions = [int(item["core_position"]) for item in obligations]
    if positions != list(range(len(positions))):
        raise ValueError("source obligations are not a dense zero-based range")

    base_count = int(middle_payload["source_counts"]["base_assertions"])
    by_chunk: dict[int, list[dict[str, object]]] = {}
    for item in obligations:
        by_chunk.setdefault(int(item["chunk"]), []).append(item)
    if sorted(by_chunk) != list(range(len(by_chunk))):
        raise ValueError("certificate chunks are not a dense zero-based range")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    module_names: list[str] = []
    for chunk, chunk_items in sorted(by_chunk.items()):
        chunk_positions = [int(item["core_position"]) for item in chunk_items]
        module = f"AllOne{title}SourceChunk{chunk:03d}"
        module_names.append(module)
        imports = [f"AllOne{title}VerifiedBridgeChunk{chunk:03d}"]
        if args.orbit == "middle":
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
        else:
            imports.extend([
                "AllOneMiddleBaseInstances",
                "AllOneMiddleRankInstances",
                "AllOneOrbitEdgeInstances",
            ])
        import_text = "\n".join(f"import {name}" for name in imports)
        facts = "\n    ".join(
            adapter(
                args.orbit,
                item,
                middle_by_term,
                base_count,
            )
            for item in chunk_items
        )
        text = f"""/-
Generated source-faithful composition for {args.orbit} certificate chunk {chunk:03d}.
-/
{import_text}

/-!
# {title} source composition chunk {chunk:03d}

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
open Problem97.ATailExactFiveCard13AllOneCertificate.{title}

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

{VARIABLES}

/-- The live {args.orbit} source facts satisfy certificate chunk {chunk:03d}. -/
theorem {args.orbit}SourceChunk{chunk:03d}_each
    (C : CanonicalAlignedCoverFamilies T {cover_indices}) :
    ∀ item ∈ sourceChunk{chunk:03d}Assertions,
      item.eval
        (sourceAssignment
          (sourceRows (CanonicalAllOneSourceOrbitIngress.{constructor} C))
          (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
          (sourceFirstApexRow T) (sourceRanks P)) = true := by
  exact sourceChunk{chunk:03d}_each_of_flat
    (sourceRows (CanonicalAllOneSourceOrbitIngress.{constructor} C))
    (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
    (sourceFirstApexRow T) (sourceRanks P)
    {facts}

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
"""
        (args.output_dir / f"{module}.lean").write_text(text, encoding="utf-8")

    imports = f"import AllOne{title}VerifiedEndpoint\n" + "\n".join(
        f"import {name}" for name in module_names
    )
    chunk_facts = "\n    ".join(
        f"({args.orbit}SourceChunk{chunk:03d}_each C)" for chunk in sorted(by_chunk)
    )
    aggregate = f"""/-
Generated final source-faithful {args.orbit}-orbit composition.
-/
{imports}

/-!
# {title} all-one source closure

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
open Problem97.ATailExactFiveCard13AllOneCertificate.{title}

set_option maxHeartbeats 0
set_option maxRecDepth 1000000

noncomputable section

{VARIABLES}

/-- The original-frame {args.orbit} all-one source orbit contradicts the persisted
kernel-checked finite certificate. -/
theorem false_of_{args.orbit}AllOneSourceOrbit
    (C : CanonicalAlignedCoverFamilies T {cover_indices}) : False := by
  exact false_of_sourceChunks_each
    (sourceAssignment
      (sourceRows (CanonicalAllOneSourceOrbitIngress.{constructor} C))
      (sourceBlockers T) (sourceShell T) (sourceQ T) (sourceW T)
      (sourceFirstApexRow T) (sourceRanks P))
    {chunk_facts}

#print axioms false_of_{args.orbit}AllOneSourceOrbit

end

end ATailExactFiveCard13AllOneSourceIngressScratch
end Problem97
"""
    final_module = f"AllOne{title}SourceClosure"
    (args.output_dir / f"{final_module}.lean").write_text(
        aggregate, encoding="utf-8"
    )
    orbit_specific = sum(
        1 for item in obligations
        if str(item["packed_term"]) not in middle_by_term
    )
    print(json.dumps({
        "orbit": args.orbit,
        "chunks": len(by_chunk),
        "source_assertions": len(obligations),
        "shared_adapters": len(obligations) - orbit_specific,
        "orbit_specific_adapters": orbit_specific,
        "final_module": final_module,
    }, indent=2))


if __name__ == "__main__":
    main()
