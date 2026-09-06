# Math Skeptic Audit: CardGeThirteenExact13ExclusiveApex18

**Target**: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ExclusiveApex18.lean`

**Date**: 2026-09-06

**Verdict**: CERTIFIED for the source-backed support occurrence and finite choice count.

**Claims audited**: 14 public declarations, each PROVEN — Lean-formalized under its stated hypotheses.

## Summary

The actual packet now supplies a support-partition witness and explicit membership
of its selected label in `Lraw.erase zraw`. The actual complement has four labels,
the erased other row has three, and their two-subset/label choice universe has
cardinality eighteen. The constructor retains which physical blocker contains the
second apex. It adds no source incidence, certificate, or contradiction assumption.

The previous gap was an absent geometric application and constructor, not an
absent premise in `ExclusiveApex18Input`. The sharp intersection bound follows from
the global minimum enclosing circle geometry already used in semantic
canonicalization. The opposite blocker bound comes from `Q.base`; together with
the three-member erased row, these force the exact one-point intersection.

## Findings

All declarations below passed the same focused source check. Each transitive axiom
probe returned exactly `propext`, `Classical.choice`, and `Quot.sound`.
Names in the first ten rows have prefix `ExclusiveApex18Input`.

| Declaration / claim | Evidence and scope | Verdict |
| --- | --- | --- |
| `uncovered_ne_secondApex` | A selected apex row excludes its center. | OK |
| `pRaw_ne_zraw` | Source images transport apex/uncovered inequality. | OK |
| `pRaw_not_mem_Kraw` | The stored third row excludes its center. | OK |
| `pRaw_not_mem_Lraw` | `O.is_other` identifies the other named apex row, which excludes its center. | OK |
| `Lraw_erase_zraw_card` | Four-member L contains z; erasing z leaves three. | OK |
| `Uraw_card` | Disjoint K and L have four members each; the apex lies outside both, leaving four of thirteen labels. | OK |
| `chosen_blocker_Lraw_inter_card_le_one` | Boundary-apex geometry forbids two common points in the apex-selected blocker and L. | OK |
| `exclusive_apex_blocker_raw` | Raw cover and disjointness place the apex in exactly one blocker. | OK |
| `blocker_Lraw_inter_card_le_two` | The packet's physical row-intersection bounds transport through exact raw images. | OK |
| `chosen_blocker_Lraw_inter_card_eq_one` | Three erased-L points are covered by blockers bounded by one and two; the selected intersection is exactly one. | OK |
| `exclusiveApex18_choice_count` | Generic binomial arithmetic, with explicit cardinality hypotheses. | OK |
| `exists_exclusiveApex18SupportPartition` | A private finite partition proof constructs all witness fields plus explicit ell membership. | OK |
| `actual_exclusiveApex18_choice_count` | Instantiates the generic count with the two packet-level cardinality theorems. | OK |
| `raw_occurrence_handoff` | Preserves profile, apex images, and direct/mirror orientation from the source ingress. | OK |

## Proof construction and reuse

The geometric helper uses `Geometry.eq_of_one_boundary_same_radius_pair`, with
convex independence from `D`, global MEC containment and center-in-hull facts
from `S`, and blocker/apex membership from `Q.base.exactRows`. The second apex's
MEC-boundary equality uses the same three-case argument as
`CardGeThirteenExact13SemanticCanonicalization.radius_eq_of_cover`.
Only that proof's sharp-intersection subargument is reused; its radius-inequality
and deletion hypotheses are not required here. Exact raw image equalities from
`X.tightSupport` and `O.is_other` permit the existing
`raw_intersection_card_eq_of_image_eq` transport.

The source audit/reuse preflight is conversation #16457, based on the indexed
corpus at `2c677e734` plus direct inspection of current Q/X/O definitions. Its
immediate consumer was the missing actual support-partition constructor.

For the finite step, let B be the apex-selected blocker and D the other blocker.
The unique point ell of `B ∩ L` belongs to `L.erase z`. Defining
`E = B \ {p, ell}` gives two points in `U = univ \ (K ∪ L ∪ {p})`.
The raw cover and disjointness prove both support identities. The witness retains
the actual C0/C1 branch rather than fixing a diagnostic label orientation.

## Scope and trust

The result places each actual packet into a universe of eighteen possible
normalized choices. It does not say that all eighteen choices are geometrically
realized, produce source-order certificate coverage, or prove `False`.
There is no aggregate import or Lean-ingress promotion record in this lane.

All fourteen public probes exclude `sorryAx`, custom axioms, and
`Lean.ofReduceBool`. Source scanning found no `sorry`, `admit`, declared axiom,
or `native_decide`. No external solver evidence is used.

## Validation

Run from `lean/`:

```text
lake env lean -M 16384 Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13ExclusiveApex18.lean
```

The final focused check returned `LEAN-EXIT=0`, with no warning or error.
The same source digest was captured before and after that check. This checks the
current source against available dependency artifacts; no full-tree or aggregate
rebuild is claimed. The final log is a reproducible runtime artifact, with its
receipt and hashes recorded here durably.

Execution HEAD: `03e54bcffdb66b3390c9d03e46e35b313cdb8012`.

Source SHA-256: `75ed653182b37db7df61466de7fb7ebca2db57fdb7ee6d74543ebf3ca9f3429b`.

Log SHA-256: `da95e7b2b89abd07d223095d7d1c00f954e67ce92489510bf2fbf7a9396fbdce`.

## Takeover and upgrade record

Coordinator #16465 and explicit release #16466 transferred the constructor lane
from `luna-swarm-orbit-warden` to `luna-swarm-gap-weaver`; acknowledgment #16467.
The checkpoint base `2171f526c72c79789b771a7611de9f8733a24a83` and exact owned
source/document/checkpoint paths remain unchanged. The registered run is
`scratch/runs/exact13-exclusive-apex-18-constructor-20260906/run-0001/`.

The takeover snapshot contained an unfinished sharp-bound draft with two `sorry`
placeholders. A source hash guard detected the previous owner's concurrent removal
of that draft and prevented an overwrite. After the owner confirmed writes had
stopped (#16468), the incoming source contained only three compiled cardinality
bridges. The completed geometric and constructor proofs introduce no placeholders.
Commit `03e54bcff` also captured the completed sharp-bound helper/theorem; the
remaining constructor/count work is finalized by this lane.

The prior NEEDS WORK verdict applied to the witness schema without a constructor.
The upgrade to CERTIFIED is supported by the new constructor, actual cardinalities,
source-complete sharp bound, and fourteen successful transitive axiom probes.
The inherited audit and source snapshot remain in registered runtime artifacts.
