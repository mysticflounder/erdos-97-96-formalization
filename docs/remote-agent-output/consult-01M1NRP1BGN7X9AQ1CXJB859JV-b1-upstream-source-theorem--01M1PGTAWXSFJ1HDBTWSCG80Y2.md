# Pro consult 01M1NRP1BGN7X9AQ1CXJB859JV

## B1 card-six closure: the correct upstream strengthening is two source-aligned omitted interior peers, not an extremal order witness

**Requested source point:** `f3a7dbe63`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`  
**Disposition:** the target remains open. The audit identifies one source-clean upstream theorem that repairs the lossy arbitrary-witness step and routes the hard card-six branch into exact-four joint-deletion geometry. It does **not** manufacture a same-arc/order conclusion.

## Verdict

The single highest-leverage source theorem is the two-peer strengthening now checked in:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  B1TwoOmittedInteriorPeers.lean
```

with declaration

```lean
Problem97.ATailFrontierLiveClosure.
  exists_two_omittedSecondClassInteriorPeers
```

Its role is to replace the one arbitrary point selected by

```lean
b1_live_exists_third_interior_escape
```

with **two distinct source-aligned strict-interior physical-class points**, each omitted from the actual row of the chosen source and each having actual blocker different from that source's blocker.

The B1-specific ingress consequence is the checked theorem

```lean
Problem97.ATailFrontierLiveClosure.
  exists_b1CardSix_distinctDeletion_or_vRowSaturation
```

in

```text
B1CardSixDistinctDeletionOrVRowSaturation.lean
```

Schematically, after suppressing ambient implicit parameters, its contract is:

```lean
theorem exists_b1CardSix_distinctDeletion_or_vRowSaturation
    (G : B1FullGeometricCoupledSourceResidual C)
    (hsix :
      (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (hu : G.u = G.source)
    (hvOutside :
      G.v.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    (∃ K : ExactFourMutualOmissionJointDeletion
          C.R C.rho G.u G.v,
       K.deleted ≠ G.jointDeletion.deleted) ∨
    Nonempty (B1CardSixVRowSaturationResidual C G)
```

This is the sharp source-faithful alternative currently justified. It closes the arbitrary-third-point information gap by producing either a genuine second same-`u/v` joint deletion or a named, exact saturation residual. It does not claim `False`.

## Why the current full source hypotheses suffice

The full geometric producer retains exactly the data that the old arbitrary escape witness discarded:

- the selected second-apex physical class and its positive radius;
- a chosen carrier source and its actual late selected row;
- source membership in the physical class and strict second-cap interior;
- the actual-row trace bound inside the physical class/strict interior;
- the mutually omitted `u/v` selected rows and their trace bounds;
- the existing `ExactFourMutualOmissionJointDeletion` and `blockers_ne` field;
- the robust second-apex deletion packets needed by the prescribed joint-deletion constructor.

For card six, the convex cap-counting API gives enough physical-class points in the strict second-cap interior. Since the source's actual row uses at most two of them, at least two distinct strict-interior class points remain outside that row. This is a cardinality statement at the actual global source row, not at a projected anonymous role packet.

The two-peer theorem retains, for peers `p₀,p₁`:

```text
p₀ ≠ p₁
pᵢ ≠ source
pᵢ ∈ SelectedClass D.A S.oppApex2 rho
pᵢ ∈ S.capInteriorByIndex S.oppIndex2
pᵢ ∉ support(actual row at source)
β(pᵢ) ≠ β(source)
```

The last inequality is source-clean. If `β(pᵢ)=β(source)`, then
`ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq` identifies the two canonical selected supports. The peer belongs to its own selected support by the canonical shell's `q_mem_support`, contradicting omission from the source support.

## Existing lemmas proving each stage

### 1. Produce two omitted strict-interior peers

Use the same cap-interior cardinality interface underlying the earlier one-peer theorem, together with the actual late-row trace bound. The checked module proves the finite extraction and preserves both peers rather than choosing one prematurely.

The operative ingredients are:

```text
SurplusCapPacket selected-class/strict-interior cardinality lower bound
CriticalFourShell.q_mem_support
CriticalFourShell.support_card
ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
Finset difference/cardinality extraction
```

No boundary indexing, cyclic-order choice, or solver certificate enters this theorem.

### 2. Couple one peer to both endpoint rows

The checked corollary

```lean
exists_coupled_omittedSecondClassInteriorPeer
```

adds:

```text
v ∈ physicalClass
v ∉ strictSecondCapInterior
card (actualRow(v) ∩ physicalClass) ≤ 2.
```

Both peers are strict-interior, so each differs from `v`. The canonical `v` row contains `v`. If it contained both peers, its physical-class trace would contain three distinct points `{v,p₀,p₁}`, contradicting the trace bound. Hence one peer is omitted from both the source row and the `v` row. The corollary retains the source-versus-peer blocker inequality.

### 3. Construct a prescribed exact-four joint deletion

The checked theorem

```lean
exists_b1CardSix_prescribedDeletion_of_source_eq_and_v_outsideInterior
```

uses

```lean
exactFourMutualOmissionJointDeletion_of_prescribed
```

with the coupled peer. It produces

```text
K : ExactFourMutualOmissionJointDeletion C.R C.rho G.u G.v
K.deleted = peer
peer omitted from both actual u/v rows
peer in the physical class and strict interior
peer distinct from source and v
β(peer) ≠ β(source).
```

The repaired ingress deliberately retains the blocker inequality rather than dropping it.

### 4. Compare with the existing deletion without losing the equal case

Using both peers, the checked theorem

```lean
exists_b1CardSix_distinctDeletion_or_vRowSaturation
```

splits source-faithfully:

1. one peer supplies a prescribed joint deletion whose deleted point differs from `G.jointDeletion.deleted`; or
2. the exceptional equal-deletion configuration forces an exact `v`-row saturation packet.

The named residual `B1CardSixVRowSaturationResidual C G` retains, rather than hides in an anonymous conjunction:

```text
mate ≠ source, v, existingDeleted
mate and existingDeleted in the physical class and strict interior
both omitted from the source/u row
existingDeleted omitted from the v row
mate contained in the v row
actualRow(v) ∩ physicalClass = {v, mate}
β(source) ≠ β(existingDeleted)
β(source) ≠ β(mate)
```

The exact pair equality follows from a two-point subset proof, `Finset.card_pair`, the row trace upper bound, and `Finset.eq_of_subset_of_card_le`.

## Why an extremal third point does not produce the order witness

Strengthening `b1_live_exists_third_interior_escape` by choosing its point `t` minimal or maximal in the finite boundary order does not supply either required conclusion.

### It does not identify the live mate

At the arbitrary-witness producer, `t` has physical-class/interior/deletion-survival data and an actual canonical row/blocker. The later statement that the escape source lies in the `u` or `v` live slice is obtained in a separate assembly. There is no source theorem saying that the mate of `t` in that live slice is the next physical-class point, the opposite extremal point, or any point whose index is controlled by extremality of `t`.

### It does not place the blocker on the needed side

The cap-to-same-arc route requires a whole two-point live slice inside the strict second cap **and its live-row blocker outside that cap**. In the actual card-six live-slice arm, the source-clean theorem

```lean
b1_cardSix_interior_pair_and_blocker
```

puts the blocker inside the cap. The order theorem

```lean
B1EscapeRowProvenanceStar.liveRowBlocker_btw_of_two_points
```

then produces blocker-between-endpoints separation. This is the alternating hard cell, not the same-side/short-arc relation.

Thus even an extremal endpoint can occur in an order of the form, up to reversal and cyclic cut,

```text
apex ... t ... blocker ... mate ...
```

with the blocker between the two live endpoints. Extremality among physical-class interior points says nothing about the position of a blocker that need not itself be in that physical class.

### It does not construct an exact-four deletion packet

`ExactFourMutualOmissionJointDeletion` needs the prospective deleted point omitted from both endpoint rows, together with the prescribed two-center deletion packets. Extremality supplies neither omission. The two-peer count does: it gives enough candidates to pigeonhole against the second row and against the already-selected deletion while retaining actual blocker provenance.

Therefore the proposed extremal-order strengthening should be rejected. Keep the generic arbitrary-witness theorem unchanged for its current callers; add/use the two-peer sibling theorem in the B1 card-six source-aligned branch.

## Earliest canonical row/blocker data available for a candidate point

For any carrier point `t`, the critical-shell system already supplies:

```text
(lateFirstApexSystem R).selectedAt t.1 t.2
(lateFirstApexSystem R).centerAt t.1 t.2
```

and the associated shell facts:

```text
q_mem_support
support_card = 4
support_eq_radius
radius_pos
center_mem
no_qfree_at
```

These are enough for omission/blocker-separation and prescribed-deletion arguments. They are not enough for a cyclic-order conclusion. The order consumers additionally require a common `BoundaryIndexing`, identified slice endpoints, and a source-faithful relation between those endpoints and the relevant row blocker.

## How the new theorem feeds the exact-four route

The distinct-deletion arm gives two same-`u/v` joint-deletion packets with different deleted points. From there the source-clean exact-four chain is:

```text
J₁.deleted ≠ J₂.deleted
  ↓
exactFour_twoDeletion_crossOmission
  ↓
J₁.deleted ∉ deletedRow(J₂)
  OR
J₂.deleted ∉ deletedRow(J₁)
```

A directed omission gives distinct actual deleted blockers. If the blockers were equal, `selectedSupports_eq_of_actualBlockers_eq` would identify their selected supports, while the omitted point belongs to its own canonical selected support, a contradiction.

This is the correct route to the exact-four geometry. It can then populate the typed two-deletion/survival outcome machinery, including

```lean
exactFour_fourSurvivingCenters_survivalSquare_split
```

when its remaining packet fields are available.

What it does **not** currently do is reach a kernel-clean `False`:

- `false_of_exactFour_twoDeletion_blockerTwoCycle` requires both directed cross-memberships, not the one directed omission presently forced;
- `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence` remains an open sorry leaf;
- `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare` remains an open sorry leaf;
- the Coordinator/legacy False wrappers inherit those open leaves and are not acceptable consumers.

Accordingly, the true remaining mathematical target is an exact-four consumer of the source-rich two-deletion packet—most plausibly one additional cross incidence, or a clean terminal for one branch of the survival-square split. It is **not** a theorem asserting a same-arc order for the arbitrary escape witness.

## The saturation arm's exact boundary

In the saturation residual, the `v` row has exact physical-class trace `{v,mate}`, with `v` outside and `mate` inside the strict second cap. Existing source-clean boundary machinery derives only adjacent-cap placement for `v` and a separated/between relation for appropriate interior pairs. It does not determine which side of the `(apex,vBlocker)` cut contains `v`.

The first missing boundary premise is exactly a `v`-specific same-side statement:

```text
B1SliceSameBoundaryArc B apex vBlocker {v,mate}
```

or its equivalent `btw` equality. If supplied, it contradicts the clean separation relation. Current source data do not derive it, so the saturation packet must remain a residual rather than be mislabeled a terminal.

## Recommended placement and import direction

Do not modify the generic `b1_live_exists_third_interior_escape` contract globally. The clean layering is:

```text
source-clean cap/cardinality and shell APIs
  ↓
B1TwoOmittedInteriorPeers
  ↓
B1CardSixPrescribedDeletionIngress
  ↓
B1CardSixDistinctDeletionOrVRowSaturation
  ↓
future exact-four consumer
```

The new modules should import only the narrow source-clean producer and joint-deletion constructor layers. They must not import `Rigid221Closure`, `Coordinator`, `TwoDeletionCollision` backward for a False wrapper, or any sorry-tainted terminal.

At the B1 call site, perform the source-aligned selection before the independent `B1EscapeRowProvenanceStar`/arbitrary escape projection. Preserve the source, both peers, their actual blockers, the endpoint-row omissions, and the existing deletion identity through the split.

## Checked implementation evidence

The following worktree implementations were independently compiled and axiom-audited after the requested source point. They confirm that the theorem contracts are actually derivable from the present source-clean APIs; they are not a claim that the B1 target has been closed or that every file was already present at `f3a7dbe63`.

```text
B1TwoOmittedInteriorPeers.lean
  SHA-256 5828fb4bf4f1797cd383b64c26fd79ed687f9274d6c82f7882bb0c83d126d3d3
  governed target build: 8,708/8,708
  axioms: propext, Classical.choice, Quot.sound

B1CardSixPrescribedDeletionIngress.lean
  SHA-256 33d741347d8f9717f659f81b670e09b0683f2a35e200d3978210cd7bca237dbc
  governed target build: 10,873/10,873
  axioms: propext, Classical.choice, Quot.sound

B1CardSixDistinctDeletionOrVRowSaturation.lean
  SHA-256 3e5f2ac672abfcd7b2bdae39d825534d01f4d714bb1ea6fc66ee5f417a3dd903
  governed target build: 10,873/10,873
  axioms: propext, Classical.choice, Quot.sound
```

Marker/import audits found no `sorry`, `axiom`, `native_decide`, `Rigid221Closure`, `Coordinator`, or open-terminal dependency in these modules. They were not yet wired to `false_of_b1PhysicalClassFiveSixNormalForm`; that target remains open.

## Final recommendation

Promote the two-peer theorem as the replacement source contract and wire the B1 card-six branch through

```lean
exists_b1CardSix_distinctDeletion_or_vRowSaturation
```

rather than attempting an extremal/raw-order theorem. The distinct arm is genuine exact-four progress; the saturation arm is the smallest honest geometric residue. Any subsequent closure theorem should consume one of those exact packets directly. It should not reconstruct a same-arc fact from the lossy escape witness and should not call the existing sorry-tainted blockerCoincidence/survivalSquare wrappers.
