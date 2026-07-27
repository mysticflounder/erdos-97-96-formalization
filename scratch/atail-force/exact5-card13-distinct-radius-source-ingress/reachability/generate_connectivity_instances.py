#!/usr/bin/env python3
"""Generate the exact h40224--h41315 connectivity assertion proofs.

The generator rebuilds both live source streams, verifies their connectivity
slices byte-for-byte, independently reconstructs the expected Z3 recurrence,
and fails closed on every index or Boolean-normal-form mismatch before writing
Lean.  The generated Lean is split into bounded structures of at most 64
fields plus one thin coordinator.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import sys

import z3


HERE = Path(__file__).resolve().parent
AUDIT = HERE.parent.parent / "exact5-card13-distinct-radius-source-ingress-audit"
sys.path.insert(0, str(AUDIT))

from distinct_source_terms import build_source_assertions  # noqa: E402


START = 40_224
END = 41_316
COUNT = END - START
CHUNK_SIZE = 64
EXPECTED_BLOCK_SHA256 = (
    "7ac928dc2d4ba680b0caab32d3ee38ac57c171bac70e882cf56c9b7f93214755"
)
FAMILIES = ("m", "g0", "g1")
DIRECTIONS = ("forward", "backward")


def sha256_stream(assertions: list[z3.BoolRef]) -> str:
    payload = "".join(assertion.sexpr() + "\n" for assertion in assertions)
    return hashlib.sha256(payload.encode("utf-8")).hexdigest()


def expected_family(family: str) -> list[z3.BoolRef]:
    edge = {
        (center, point): z3.Bool(f"{family}_{center}_{point}")
        for center in range(13)
        for point in range(13)
    }
    forward = {
        (step, point): z3.Bool(f"{family}_forward_{step}_{point}")
        for step in range(13)
        for point in range(13)
    }
    backward = {
        (step, point): z3.Bool(f"{family}_backward_{step}_{point}")
        for step in range(13)
        for point in range(13)
    }
    assertions: list[z3.BoolRef] = []
    for point in range(13):
        assertions.append(forward[0, point] == z3.BoolVal(point == 0))
        assertions.append(backward[0, point] == z3.BoolVal(point == 0))
    for step in range(12):
        for point in range(13):
            assertions.append(forward[step + 1, point] == z3.Or(
                forward[step, point],
                *(z3.And(forward[step, source], edge[source, point])
                  for source in range(13)),
            ))
            assertions.append(backward[step + 1, point] == z3.Or(
                backward[step, point],
                *(z3.And(edge[point, target], backward[step, target])
                  for target in range(13)),
            ))
    for point in range(13):
        assertions.append(forward[12, point])
        assertions.append(backward[12, point])
    if len(assertions) != 364:
        raise AssertionError(f"family assertion count drift: {len(assertions)}")
    return assertions


def exact_connectivity_slice() -> list[z3.BoolRef]:
    direct, direct_counts, _outer, _ranks = build_source_assertions("direct")
    mirror, mirror_counts, _outer, _ranks = build_source_assertions("mirror")
    for counts in (direct_counts, mirror_counts):
        if counts["connectivity_assertions"] != COUNT:
            raise AssertionError("live connectivity count drift")
        if counts["connectivity_auxiliary_variables"] != 1014:
            raise AssertionError("live connectivity variable count drift")
    direct_slice = direct[START:END]
    mirror_slice = mirror[START:END]
    if len(direct_slice) != COUNT or len(mirror_slice) != COUNT:
        raise AssertionError("live connectivity block boundary drift")
    if [x.sexpr() for x in direct_slice] != [x.sexpr() for x in mirror_slice]:
        raise AssertionError("connectivity block differs between source orbits")
    if sha256_stream(direct_slice) != EXPECTED_BLOCK_SHA256:
        raise AssertionError("connectivity block hash drift")
    expected = [item for family in FAMILIES for item in expected_family(family)]
    for offset, (live, reconstructed) in enumerate(zip(direct_slice, expected, strict=True)):
        if live.sexpr() != reconstructed.sexpr():
            raise AssertionError(
                f"connectivity assertion drift at source index {START + offset}:\n"
                f"live: {live.sexpr()}\nexpected: {reconstructed.sexpr()}"
            )
    return direct_slice


def assertion_metadata(offset: int) -> dict[str, int | str | None]:
    family = offset // 364
    within = offset % 364
    if within < 26:
        point = within // 2
        direction = within % 2
        return {
            "family": family,
            "direction": direction,
            "kind": "zero",
            "step": 0,
            "point": point,
        }
    if within < 338:
        transition = within - 26
        pair = transition // 2
        direction = transition % 2
        step = pair // 13
        point = pair % 13
        return {
            "family": family,
            "direction": direction,
            "kind": "succ",
            "step": step,
            "point": point,
        }
    terminal = within - 338
    point = terminal // 2
    direction = terminal % 2
    return {
        "family": family,
        "direction": direction,
        "kind": "terminal",
        "step": 12,
        "point": point,
    }


def field_statement(meta: dict[str, int | str | None]) -> str:
    family = int(meta["family"])
    direction = int(meta["direction"])
    point = int(meta["point"])
    kind = str(meta["kind"])
    if kind == "zero":
        value = "true" if point == 0 else "false"
        return (
            f"((connectivityBit bits {family} {direction} 0 {point} == "
            f"{value})) = true"
        )
    if kind == "succ":
        step = int(meta["step"])
        rhs = "sourceForwardRhs" if direction == 0 else "sourceBackwardRhs"
        return (
            f"((connectivityBit bits {family} {direction} {step + 1} {point} ==\n"
            f"      {rhs} edge bits ({family} : Fin 3) "
            f"({step} : ProperStage) ({point} : Label))) = true"
        )
    if kind == "terminal":
        return f"connectivityBit bits {family} {direction} 12 {point} = true"
    raise AssertionError(meta)


def proof_term(meta: dict[str, int | str | None]) -> str:
    family = int(meta["family"])
    direction = int(meta["direction"])
    point = int(meta["point"])
    kind = str(meta["kind"])
    if kind == "zero":
        theorem = "packedConnectivity_zero_sourceAssertion"
        args = f"packets ({family} : Fin 3) ({direction} : Fin 2) ({point} : Label)"
    elif kind == "succ":
        theorem = "packedConnectivity_succ_sourceAssertion"
        step = int(meta["step"])
        args = (
            f"packets ({family} : Fin 3) ({direction} : Fin 2) "
            f"({step} : ProperStage) ({point} : Label)"
        )
    elif kind == "terminal":
        theorem = "packedConnectivity_terminal_sourceAssertion"
        args = f"packets ({family} : Fin 3) ({direction} : Fin 2) ({point} : Label)"
    else:
        raise AssertionError(meta)
    return f"simpa [connectivityFinBit] using {theorem} {args}"


COMMON_OPENS = """open ATailCriticalPairFrontier
open ATailBiApexRobustCapBounds
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
    {P : CanonicalAsymmetricRolePrepacket N}
    {star : PhysicalGlobalCrossDeletionStar profile}
    {first : FirstApexShellRolePacket F R}
    {T : CanonicalAsymmetricSemanticRowTable P star first}
"""


def chunk_text(chunk: int, entries: list[dict[str, object]]) -> str:
    name = f"ConnectivityAssertionsChunk{chunk:03d}"
    fields = "\n".join(
        f"  h{entry['index']:05d} : {field_statement(entry['meta'])}"
        for entry in entries
    )
    proof_fields = "\n".join(
        f"    h{entry['index']:05d} := by\n      {proof_term(entry['meta'])}"
        for entry in entries
    )
    first = entries[0]["index"]
    last = entries[-1]["index"]
    return f"""/-
Generated by `generate_connectivity_instances.py` from the live `surface.py`
connectivity stream.  Source indices h{first:05d}--h{last:05d}.
-/
import AggregateConnectivityPacking

/-!
# Generated connectivity assertion chunk {chunk:03d}

Exact source assertions h{first:05d}--h{last:05d} from the audited connectivity
block.  Regenerate this file; do not edit it by hand.
-/

namespace Problem97
namespace ExactFiveCard13DistinctRadiusSourceIngressScratch

{COMMON_OPENS}
attribute [local instance] Classical.propDecidable

noncomputable section

/-- Exact source assertions h{first:05d}--h{last:05d}. -/
structure {name}
    (edge : Fin 3 → Label → Label → Bool) (bits : ConnectivityBits) : Prop where
{fields}

{COMMON_VARIABLES}
/-- The structured semantic packets prove this entire bounded source chunk. -/
theorem canonical{name}
    (C : CanonicalCoverFamilies T)
    (packets : CanonicalThreeFamilyReachabilityPacket C) :
    {name} (directSourceRowMember C)
      (packCanonicalConnectivity packets) := by
  exact {{
{proof_fields}
  }}

end

end ExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
"""


def coordinator_text(chunk_count: int) -> str:
    imports = "\n".join(
        f"import ConnectivityAssertionsChunk{chunk:03d}"
        for chunk in range(chunk_count)
    )
    fields = "\n".join(
        f"  chunk{chunk:03d} : ConnectivityAssertionsChunk{chunk:03d} edge bits"
        for chunk in range(chunk_count)
    )
    proof_fields = "\n".join(
        f"    chunk{chunk:03d} := canonicalConnectivityAssertionsChunk{chunk:03d} C packets"
        for chunk in range(chunk_count)
    )
    return f"""/-
Generated by `generate_connectivity_instances.py` from the live `surface.py`
connectivity block h40224--h41315.
-/
{imports}

/-!
# Generated complete connectivity assertion coordinator

This module bundles the 1,092 exact source assertions h40224--h41315 from the
eighteen bounded generated chunks.
-/

namespace Problem97
namespace ExactFiveCard13DistinctRadiusSourceIngressScratch

{COMMON_OPENS}
attribute [local instance] Classical.propDecidable

noncomputable section

/-- All 1,092 exact connectivity assertions, bounded into {chunk_count} chunks. -/
structure CanonicalConnectivityAssertions
    (edge : Fin 3 → Label → Label → Bool) (bits : ConnectivityBits) : Prop where
{fields}

{COMMON_VARIABLES}
/-- The three structured packets prove the complete exact connectivity block. -/
theorem canonicalConnectivityAssertions
    (C : CanonicalCoverFamilies T)
    (packets : CanonicalThreeFamilyReachabilityPacket C) :
    CanonicalConnectivityAssertions (directSourceRowMember C)
      (packCanonicalConnectivity packets) := by
  exact {{
{proof_fields}
  }}

/-- Minimality constructs the packets and therefore the packed bits and all
1,092 assertions; no connectivity value is accepted as a hypothesis. -/
theorem canonicalConnectivityAssertions_of_minimal
    (hmin : D.Minimal) (C : CanonicalCoverFamilies T) :
    CanonicalConnectivityAssertions (directSourceRowMember C)
      (packCanonicalConnectivity
        (canonicalThreeFamilyReachabilityPacket hmin C)) :=
  canonicalConnectivityAssertions C
    (canonicalThreeFamilyReachabilityPacket hmin C)

#print axioms canonicalConnectivityAssertions
#print axioms canonicalConnectivityAssertions_of_minimal

end


end ExactFiveCard13DistinctRadiusSourceIngressScratch
end Problem97
"""


def emit(check: bool) -> None:
    source = exact_connectivity_slice()
    entries: list[dict[str, object]] = []
    for offset, assertion in enumerate(source):
        index = START + offset
        entries.append({
            "index": index,
            "offset": offset,
            "chunk": offset // CHUNK_SIZE,
            "meta": assertion_metadata(offset),
            "sexpr": assertion.sexpr(),
        })
    chunks = [
        entries[start:start + CHUNK_SIZE]
        for start in range(0, len(entries), CHUNK_SIZE)
    ]
    outputs: dict[Path, str] = {}
    for chunk, chunk_entries in enumerate(chunks):
        outputs[HERE / f"ConnectivityAssertionsChunk{chunk:03d}.lean"] = (
            chunk_text(chunk, chunk_entries)
        )
    outputs[HERE / "CanonicalConnectivityAssertions.lean"] = coordinator_text(len(chunks))
    manifest = {
        "schema": "p97-exact5-card13-connectivity-assertions-v1",
        "source_range": [START, END],
        "assertion_count": COUNT,
        "auxiliary_bit_count": 1014,
        "chunk_size": CHUNK_SIZE,
        "chunk_count": len(chunks),
        "connectivity_block_sha256": EXPECTED_BLOCK_SHA256,
        "families": {"0": "m", "1": "g0", "2": "g1"},
        "directions": {"0": "forward", "1": "backward"},
        "entries": entries,
    }
    outputs[HERE / "connectivity-assertion-map.json"] = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    )
    if check:
        drift = []
        for path, expected in outputs.items():
            if not path.is_file() or path.read_text(encoding="utf-8") != expected:
                drift.append(path.name)
        if drift:
            raise SystemExit("generated connectivity drift: " + ", ".join(drift))
    else:
        for path, text in outputs.items():
            path.write_text(text, encoding="utf-8")
    print(
        f"checked {COUNT} assertions, {len(chunks)} chunks, "
        f"sha256={EXPECTED_BLOCK_SHA256}"
    )


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    emit(args.check)


if __name__ == "__main__":
    main()
