# B1 global-boundary consult — source-bound audit

Consult: `01M1MJS0RYNGHH21MKFYBQTKJV`

Requested source checkpoint: `64fc8d5d1` (an ancestor of the subsequently audited B1 reducer and negative-control commits). The latest live source reports used here include reducer commit `7cdcaef62` and endpoint negative-control commit `0f564afde`. Line numbers have moved during the B1 work; exact declaration names and dependency directions are more stable than the reported line anchors.

Target:

```lean
Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm
```

The live audit reported the target in `TwoDeletionCollision.lean` around lines `1753–1761`; its body remains `sorry`.

## Verdict

**NO CURRENT SOURCE-CLEAN CLOSURE.**

Under the consult restrictions, no existing theorem closes the target, and none of the currently exposed endpoint/order packets is strong enough to force a contradiction. The highest-leverage next statement is one branch-local, falsifiable **new mathematical lemma** in the exact-card-five fresh-`v`/original-source arm, before that arm is weakened to the generic endpoint residual.

The proposed statement is deliberately not a new structure and not an endpoint wrapper. It should produce the raw card-five winning-slice arc required by the already source-clean `False` consumer. If the strengthened source packet admits a finite countermodel with both live same-arc bits false, this route should be abandoned.

## 1. PROVED: exact source-clean sinks

### 1.1 Same-arc sink

The primitive order predicate is `B1SliceSameBoundaryArc`. For a source-faithful
`BoundaryIndexing B`, physical apex `S.oppApex2`, a live-row blocker, and a live slice, it says that any two distinct slice points have the same Boolean `btw` value across the apex-to-blocker cut.

The current card-specific interfaces are, schematically but faithfully:

```lean
B1CardFiveWinningSliceArc C :=
  ∃ B : BoundaryIndexing D.A,
    ((b1USlice C).card = 2 ∧
      B1SliceSameBoundaryArc B apex uBlocker (b1USlice C)) ∨
    ((b1VSlice C).card = 2 ∧
      B1SliceSameBoundaryArc B apex vBlocker (b1VSlice C))

B1CardSixWinningSliceArc C :=
  ∃ B : BoundaryIndexing D.A,
    B1SliceSameBoundaryArc B apex uBlocker (b1USlice C) ∨
    B1SliceSameBoundaryArc B apex vBlocker (b1VSlice C)
```

Here `apex = S.oppApex2`, and `uBlocker`/`vBlocker` are the blocker labels in `lateFirstApexSystem C.R` at `C.u`/`C.v`.

The existing source-clean contradiction chain is:

```text
one actual card-two live slice + B1SliceSameBoundaryArc
  -> B1WinningLiveSliceSameBoundaryArc C
  -> false_of_b1WinningLiveSliceSameBoundaryArc
  -> False.
```

A second source-clean route packages the stronger symmetric predicate
`B1LiveSlicesSameBoundaryArc C` and calls
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc`.
Both ultimately use `false_of_criticalShell_slice_card_two_of_sameBoundaryArc`.

These are genuine terminal consumers. Their missing input is not cardinality or a boundary enumeration; it is the raw same-side/arc fact for an actual two-point live slice.

### 1.2 Conditional card-arc contract is not a producer

A current dirty/WIP version of `B1WinningSliceOrderOutcome.lean` contains:

```lean
B1GoodCanonicalEndpointCardArc
    (C)
    (W : B1FiveSixWaveIngress C)
    (_R : B1GoodCanonicalDeletionEndpointResidual C W.escape) : Prop :=
  match W.cardCase with
  | .cardFive _ => B1CardFiveWinningSliceArc C
  | .cardSix _ => B1CardSixWinningSliceArc C
```

and a conditional consumer `false_of_b1GoodCanonicalEndpointCardArc`.

**PROVED source fact:** `_R` is unused. The consumer merely cases on `W.cardCase`, repackages the supplied card-specific arc, and invokes the existing same-arc sink. No theorem produces `B1GoodCanonicalEndpointCardArc` from the canonical endpoint residual.

Therefore this contract is a useful type-level description of the missing terminal input, but it is not mathematical progress and must not be counted as a closed branch or a frontier decrement.

## 2. REFUTED or blocked routes

### 2.1 Endpoint/order facts alone

The committed Fin-18 negative control admits all currently exported endpoint/order facts, including the available separation and blocker-between relations, while both live same-arc bits are false. In particular:

- adjacent-cap membership gives a directed source/mate order but does not locate the blocker;
- `blocker-between` is a linear interval statement, not a minor-cyclic-arc theorem;
- boundary convexity and cardinality do not select a winning live slice.

**Verdict:** any theorem from `B1CardFiveEndpointOrderResidual`,
`B1CardSixEndpointOrderResidual`, or `b1_fiveSixEndpointResidual_of_normalForm`
alone to a winning arc is refuted at the exported interface.

### 2.2 Exact-card-five singleton identity

Current source proves card-five singleton identities of the form
`escape.source = C.u` or `escape.source = C.v`. These identities are compatible with all exported support facts:

- the common row is centered at a canonical deleted source, not at `C.u` or `C.v`;
- the escape source may remain outside the common row;
- the escape source may remain distinct from both canonical deletions;
- a singleton slice cannot feed the card-two same-arc sink.

The first missing source-context fields are outside-first-apex-fiber membership and retained `q/w` deletion survival for that ambient source. Even if supplied, they create a `B1EscapeSourceContext`; no present source-clean theorem turns that context alone into `False`.

**Verdict:** no literal row/support contradiction follows from the singleton identity.

### 2.3 Fresh pair is not the ambient pair

`exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext` existentially chooses fresh `other,u,v`. It does not identify those values with the ambient `C.u,C.v`. The no-third clause of `B1PhysicalClassFiveSixNormalForm` is scoped to the fixed ambient pair.

No source-clean normalization theorem transports the fresh pair to the ambient pair. Consequently, the earlier idea “construct a fresh joint deletion, then use `hnormal.1` to make its deletion canonical” is invalid unless the pair identity is proved first.

**Verdict:** fresh-pair normalization is a genuine missing theorem, not definitional bookkeeping.

### 2.4 Blocker two-cycle

`false_of_exactFour_twoDeletion_blockerTwoCycle` is source-clean but needs both:

1. distinct blockers; and
2. reciprocal cross-row memberships.

Equal blockers can transport supports and give the memberships, but violate blocker distinctness. Distinct blockers trigger a cross-omission conclusion, destroying at least one required membership.

**Verdict:** the hypotheses do not coexist in the present B1 branch.

### 2.5 Cross-deletion survival and global minimality

Current cross-deletion/equal-blocker continuations are not aligned to both the canonical common blocker and the retained `q/w` deletion. Their outputs have no present source-clean terminal. Likewise `C.R.minimal` exists upstream, but no theorem currently consumes `B1GoodCanonicalDeletionResidual` plus minimality and concludes `False`.

**Verdict:** choices (b) and (d) in the consult are not currently terminal-facing; pursuing them first would require a larger new theory than the arc branch below.

## 3. PROVED: the earliest exact-card-five source-rich branch

The live theorem reported at `TwoDeletionCollision.lean:408` is:

```lean
b1_freshV_cardFiveEndpoint_or_originalSource_or_adjacentCap
  C hnormal hfive E source other u v
  hvClass hvLive context hsourceCanonical
```

with:

- `source other u v : CarrierVertex D.A`;
- `hvClass` placing `v` in the physical second-apex class;
- `hvLive` placing `v.1` in `b1USlice C ∨ b1VSlice C`;
- `context : ExactFourMutualOmissionSourceContext C.R C.rho source other u v`;
- `hsourceCanonical : source = C.first.deleted ∨ source = C.second.deleted`.

Its exact conclusion is:

```lean
(∃ E' : B1EscapeRowProvenanceStar C,
    E'.escape.source = v ∧
      B1EscapeSliceEndpointOrderResidual C E')
∨ v = C.u
∨ v = C.v
∨ (v.1 ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
    v.1 ∈ S.rightAdjacentCapByIndex S.oppIndex2)
```

There is no separate object called `freshV`: it is literally the binder `v`, the second fresh mutually omitted endpoint of `context`.

The upstream theorem
`B1GoodCanonicalDeletionResidual.exists_freshPair_deletion_role`
retains more source information before this four-way result is returned: a fresh
`source, other, u, v`, a joint deletion, canonical-source identity, `u ≠ v`, physical-class memberships, mutual omissions, the exact source context, proof that the joint deletion differs from the canonical source, and the deletion-role split. The theorem
`b1_freshPair_source_or_mem_original_liveSlices` then places `v` in an original live slice and says `u = source` or `u` also lies in an original live slice.

The two middle disjuncts `v = C.u` and `v = C.v` are the exact residual called the **original-source arm** below. Crucially, all of the theorem inputs remain in local scope when that arm is selected. This is earlier and strictly richer than `B1GoodCanonicalDeletionEndpointResidual` or the generic endpoint residual.

## 4. The one recommended NEW mathematical lemma

The smallest honest target is a private/source-local theorem that consumes the original-source arm at the point above and returns the existing card-five arc packet.

To avoid inventing or duplicating a large record, its binder prefix should be **identical** to
`b1_freshV_cardFiveEndpoint_or_originalSource_or_adjacentCap`:

```lean
private theorem b1_freshV_cardFive_originalSource_winningSliceArc
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hfive : (SelectedClass D.A S.oppApex2 C.rho).card = 5)
    (E : B1EscapeRowProvenanceStar C)
    (source other u v : CarrierVertex D.A)
    (hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 C.rho)
    (hvLive : v.1 ∈ b1USlice C ∨ v.1 ∈ b1VSlice C)
    (context : ExactFourMutualOmissionSourceContext
      C.R C.rho source other u v)
    (hsourceCanonical :
      source = C.first.deleted ∨ source = C.second.deleted)
    (hvOriginal : v = C.u ∨ v = C.v) :
    B1CardFiveWinningSliceArc C
```

The exact source may carry `hfive` in an equivalent card-case form rather than the displayed equality; the implementation should copy the existing binder verbatim rather than adding an adapter. If the upstream `exists_freshPair_deletion_role` fields are needed for the proof, state the theorem one lexical level earlier, immediately after destructuring that witness, and retain those fields as local binders. Do not weaken them into a new exported residual structure.

### Why this is the right single target

- It eliminates one exact constructor: the `v = C.u ∨ v = C.v` arm of the live card-five theorem.
- Its conclusion is immediately consumed by a current source-clean `False` theorem.
- It uses strictly more provenance than the refuted endpoint packet: exact fresh-pair roles, canonical-source identity, class/live-slice membership, mutual omission context, and the card-five role split are all still present.
- It requires no backward import from `Rigid221Closure` and no B2/B3 four-center leaf.
- It does not claim that the complete card-five or B1 target is closed; it closes exactly one source branch if proved.

### Exact new mathematical content

After substituting `v = C.u` or `v = C.v`, prove a raw same-side statement for one actual card-two live slice:

```lean
B1SliceSameBoundaryArc
  E.boundary
  ⟨S.oppApex2, b1_oppApex2_mem_A S⟩
  liveBlocker
  liveSlice
```

Equivalently, for the two distinct boundary indices `ix, iy` of the chosen slice, prove:

```lean
SurplusCOMPGBank.btw
    (E.boundary.indexOf apex)
    (E.boundary.indexOf liveBlocker) ix
  ↔
SurplusCOMPGBank.btw
    (E.boundary.indexOf apex)
    (E.boundary.indexOf liveBlocker) iy
```

Everything after this Boolean equality is existing packaging.

One sufficient route would be to derive both:

```lean
liveSlice ⊆ S.capInteriorByIndex S.oppIndex2
liveBlocker.1 ∉ S.capInteriorByIndex S.oppIndex2
```

and invoke the existing source-clean
`B1EscapeRowProvenanceStar.sliceSameBoundaryArc_of_subset_secondCapInterior`.
The current exported endpoint packet does not give these two facts; the proof must obtain them from the fresh-`v` identity, exact row omissions, canonical deletion role, and source-level cap extremality. A direct proof of the `btw` equality is equally acceptable and may be weaker.

### Proof skeleton

```lean
private theorem b1_freshV_cardFive_originalSource_winningSliceArc
    ... (hvOriginal : v = C.u ∨ v = C.v) :
    B1CardFiveWinningSliceArc C := by
  rcases hvOriginal with rfl | rfl
  · -- v = C.u
    -- PROVED bookkeeping:
    --   unpack the card-five role split;
    --   use hvLive and the exact source-context omissions;
    --   name the relevant card-two live slice and its two endpoints;
    --   use b1_cardFive_oppositeSlice_singleton_of_freshDeletion where applicable.
    -- NEW MATHEMATICS:
    --   prove the raw B1SliceSameBoundaryArc bit equality for one
    --   actual two-point live slice.
    exact ⟨E.boundary, Or.inl ⟨by /* card=2 */, by /* raw arc */⟩⟩
  · -- v = C.v, symmetric source roles
    exact ⟨E.boundary, Or.inr ⟨by /* card=2 */, by /* raw arc */⟩⟩
```

The two cases need not necessarily select the `u` and `v` slices respectively; the card-five role packet should decide which slice is the actual card-two winner. The theorem statement intentionally asks only for the disjunction.

Once proved, the existing clean body pattern in
`false_of_b1GoodCanonicalEndpointCardArc` packages the result as
`B1WinningLiveSliceSameBoundaryArc C` and calls
`false_of_b1WinningLiveSliceSameBoundaryArc`.

## 5. Import and placement audit

Place the theorem as a private or narrowly namespaced lemma in
`TwoDeletionCollision.lean`, immediately adjacent to
`b1_freshV_cardFiveEndpoint_or_originalSource_or_adjacentCap` or one lexical step earlier where `exists_freshPair_deletion_role` is destructured.

This placement is important:

- `TwoDeletionCollision.lean` already sees the fresh-pair context and B1 arc definitions;
- moving the theorem downstream loses the source-specific role and omission data;
- moving it into a lower generic order module would require transporting those branch-specific facts through a new wrapper;
- no dependency may import `TwoDeletionCollision` backward;
- the proof uses no `Rigid221Closure` theorem and no open four-center terminal.

A small pure order lemma may later be factored into `CyclicPairSeparation.lean` or the B1 order layer, but only after the exact antecedent inequalities are identified by a source proof or an UNSAT core.

Acyclic dependency chain:

```text
fresh-v/card-five source branch in TwoDeletionCollision
  -> b1_freshV_cardFive_originalSource_winningSliceArc       [NEW]
  -> existing packaging to B1WinningLiveSliceSameBoundaryArc
  -> false_of_b1WinningLiveSliceSameBoundaryArc              [PROVED]
  -> False.
```

## 6. Mandatory falsification experiment

Before formalizing the new lemma, extend the committed Fin-18 negative control with the **complete source-local antecedent set** of the original-source arm:

1. exact card-five local-role packet;
2. direct/mirror cap blocks and the actual `BoundaryIndexing`;
3. `ExactFourMutualOmissionSourceContext C.R C.rho source other u v` positive and negative row incidences;
4. `source` equal to one canonical deletion;
5. `v` in an original live slice;
6. `v = C.u` or `v = C.v`;
7. every deletion-role and fresh-pair fact still in scope from
   `B1GoodCanonicalDeletionResidual.exists_freshPair_deletion_role`;
8. both candidate `B1SliceSameBoundaryArc` bits forced false.

Interpretation:

- **SAT** is a direct interface countermodel and refutes the proposed lemma. Do not replace it with a stronger wrapper.
- **UNSAT** is evidence that this is the correct branch theorem. Minimize the exact order/incidence core, map every atom back to a Lean field, and formalize only the resulting raw `btw` implication.

The existing endpoint negative control does not include all of items 3–7, so it does not already refute this branch-local theorem. Conversely, the current source does not prove that those extra facts force an arc, so the theorem must remain labeled **NEW MATHEMATICS** until this test and a Lean proof succeed.

## 7. Ranked implementation sequence

1. Freeze a source-faithful finite encoding of the exact original-source arm and run the falsification test above.
2. If UNSAT, extract the smallest raw `btw`/cap-order implication.
3. Prove that pure order implication in the lowest acyclic order module compatible with its hypotheses.
4. Add the branch-local adapter in `TwoDeletionCollision.lean` returning `B1CardFiveWinningSliceArc C`.
5. In the same change, consume it with `false_of_b1WinningLiveSliceSameBoundaryArc` and remove that exact constructor.
6. Do not promote the generic `B1GoodCanonicalEndpointCardArc` contract as progress unless a producer is proved; its residual argument is currently unused.
7. Leave the escape-source, adjacent-cap, endpoint-residual, and card-six branches explicitly open.

## Final residual statement

If the proposed branch theorem is not proved, the honest current status is:

```text
B1 source reducer is source-clean, but both principal consumers remain external:
  (1) B1EscapeSourceContext -> False;
  (2) B1GoodCanonicalDeletionEndpointResidual -> False.
The exact-card-five fresh-v original-source subbranch retains stronger data than
these exported residuals, but no theorem yet converts that data into a winning
same-boundary-arc slice or another source-clean terminal.
```

No sorry count decreases from the existing reducer, endpoint packets, or conditional card-arc contract alone.
