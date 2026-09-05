# Problem97 B1 exact-card-six residual consult

**Consult:** `01M1J8R0BQ3WK4Z6HHR476J46G`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`  
**Source frontier audited:** current B1 source reported at commit `64fc8d5d1`  
**Result:** source-bound reduction and minimal residual; no current source-clean terminal found

## Executive verdict

The current B1 interface now extracts substantially more order information than the older same-boundary-arc plan, but it still does **not** yield a source-clean proof of `False`.

The strongest checked card-six facts are:

1. the six-point physical class decomposes into three pairwise-disjoint two-point pieces—the canonical deleted pair, `b1USlice C`, and `b1VSlice C`;
2. at least four physical-class points lie in the strict second-cap interior;
3. a two-point live slice whose two points lie in that interior has its exact live-row blocker strictly between its endpoints in the retained linear boundary order;
4. at least one of the deleted/u/v physical pairs has its associated blocker strictly between its endpoints;
5. a winning live pair with its mate outside the strict second-cap interior has that mate in one of the two adjacent closed caps.

No active source-clean consumer currently turns any of the following into `False`, a third joint deletion, `B1EscapeSourceContext`, or a winning same-arc packet:

- adjacent-cap mate;
- a full physical pair in the strict second cap together with its localized blocker in the same strict cap;
- one or more endpoint relations of the form `btw endpoint₁ blocker endpoint₂`.

Thus the present gap is no longer finite-set counting. It is a **global source/order/deletion theorem** connecting the endpoint-order packet to another row, deletion, or first-apex-fiber fact.

## 1. Checked active producers

### 1.1 Exact endpoint-order producer

The active theorem

```lean
Problem97.ATailFrontierLiveClosure.
  B1EscapeRowProvenanceStar.liveRowBlocker_btw_of_two_points
```

in `B1WinningSliceOrderOutcome.lean` proves, for two distinct physical/live-row points in the strict second-cap interior, that the exact row blocker lies strictly between their boundary indices. In schematic form:

```lean
SurplusCOMPGBank.btw
  (E.boundary.indexOf p)
  (E.boundary.indexOf q)
  (E.boundary.indexOf (blockerLabel ... row))
```

Here `btw` is the strict interval in the chosen retained **linear** boundary indexing; it is not by itself a minor-cyclic-arc assertion.

The proof is source-clean and uses the shared-circle separation relation, `separatedPair_exchange`, strict-cap boundary convexity, endpoint nonincidence, and the exact selected-row equal-radius facts.

### 1.2 Card-six endpoint residual

The active `B1EscapeSliceEndpointOrderResidual` packages the winning two-point slice into the exhaustive alternatives

```text
mate in left adjacent cap
or mate in right adjacent cap
or live-row blocker strictly between source and mate.
```

The card-six normal-form path produces this residual.

### 1.3 Some physical pair has blocker between its endpoints

The active theorem

```lean
b1_cardSix_some_pair_blocker_btw
```

returns a three-way disjunction: the blocker associated to the deleted pair, the u-pair, or the v-pair lies strictly between that pair's endpoints. This is currently the strongest clean global card-six endpoint-order conclusion.

A source search found no active downstream consumer of this theorem or of `B1EscapeSliceEndpointOrderResidual`.

## 2. Exact cap-counting consequence

Let

```lean
I := S.capInteriorByIndex S.oppIndex2
P₀ := {C.first.deleted.1, C.second.deleted.1}
P₁ := b1USlice C
P₂ := b1VSlice C
```

Under the card-six normal form, the three `Pᵢ` are disjoint two-point sets whose union is the physical class, and

```lean
4 ≤ (physicalClass ∩ I).card.
```

Therefore at least one `Pᵢ` is wholly contained in `I`. This is the finite-counting content behind the active card-six interior-pair theorem.

There is a sharper branch consequence for a winning live pair `W = {source,mate}`.

### Mate outside the strict interior

If `source ∈ I` and `mate ∉ I`, then `W` contributes exactly one interior point. The other two disjoint pairs must contribute at least three points total, so one of them contributes two. Hence:

```text
canonical deleted pair ⊆ I
or the other live pair ⊆ I.
```

A Lean-shaped statement is:

```lean
theorem b1_cardSix_otherInteriorPair_of_winningMate_not_mem
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6)
    (E : B1EscapeRowProvenanceStar C)
    (hwinU : E.escape.source.1 ∈ b1USlice C)
    (huPair : b1USlice C = {E.escape.source.1, mate.1})
    (hmateOut : mate.1 ∉ S.capInteriorByIndex S.oppIndex2) :
    ({C.first.deleted.1, C.second.deleted.1} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 ∨
      b1VSlice C ⊆ S.capInteriorByIndex S.oppIndex2
```

with the symmetric `v` version.

Dependencies are only:

- `b1_physicalClass_secondCapInterior_card_ge_four_of_card_six`;
- the exact normal-form cover;
- `b1_live_slices_card_eq_two_disjoint_of_physicalClass_card_six`;
- deleted-pair cardinality/disjointness from `C.hdeletedNe` and the row-deletion nonmembership fields;
- elementary `Finset` intersection/cardinality arithmetic.

This statement is mathematically valid and source-cleanly provable, but it is only a reduction: neither resulting full-pair branch has a current terminal.

### Mate inside the strict interior

No second full pair is forced. The distribution

```text
winning pair: 2 interior points
other pair:   1 interior point
third pair:   1 interior point
```

already meets the lower bound four. Therefore any theorem claiming that mate-inside forces another complete interior pair is false at the finite-incidence level.

## 3. Blocker localization after counting

The full-pair alternatives have checked localizers.

### Deleted pair

If both canonical deleted values lie in the strict second cap, then

```lean
b1_live_common_blocker_mem_secondCapInterior
```

places their common deletion blocker in the same strict cap.

### u- or v-pair

If both points of one exact live slice lie in the strict second cap, then

```lean
b1_liveRowBlocker_mem_secondCapInterior_of_two_points
```

places that live-row blocker in the same strict cap. The endpoint-order theorem then places that blocker strictly between the two slice endpoints.

No active theorem consumes “two physical pair endpoints plus their blocker all lie in the strict second cap” as a contradiction. This configuration saturates the current row/interior cardinality bound rather than violating it.

## 4. Adjacent-cap mate does not create a source context

The active localization

```lean
b1_physicalClass_mem_adjacentCap_of_not_mem_secondCapInterior
```

places an outside-interior physical mate in the left or right adjacent cap. That does not imply that the escape source lies outside the first-apex selected class or in `outsideFirstApexFiber C.R`.

The relevant intersection bound is

```lean
Problem97.ATail.firstApex_marginal_inter_secondClass_card_le_one
```

in `CriticalPairFrontier.lean`. To derive a contradiction from the escape source also lying in the first-apex class, one needs a **second distinct named point** in both the first- and second-apex classes, off the surplus cap. The B1 packet exposes no such point. `F.pair.q` and `F.pair.w` are first-apex-class points, but no active theorem places either in the exact B1 physical second-apex class or in the winning live slice.

Consequently both interface patterns remain possible:

```text
source in second class only; mate in second class only,
```

and

```text
source in both first and second classes; mate in second class only.
```

The first-class/second-class intersection bound is respected in each pattern.

The constructor

```lean
b1EscapeSourceContext_of_normalForm_sourceData
```

still lacks its two essential source-facing premises:

```text
source ∈ outsideFirstApexFiber C.R
and retained q- or w-deletion survival.
```

Neither premise follows from adjacent-cap membership or endpoint `btw` data.

## 5. Reverse-hit route

A reverse-hit assumption can be used to put the mate's blocker on the same perpendicular bisector as the physical apex and the live-row blocker. The existing Rigid221 proof pattern generalizes far enough to conclude equality of two live-row blockers in the all-distinct-carrier case.

That equality is **not** presently contradictory in the B1 normal form. The normal form forbids a third joint deletion for the original u/v pair; it does not forbid two relevant selected rows from having the same blocker. No checked theorem converts the blocker equality into:

- a third joint deletion;
- a forbidden three-point bisector fiber;
- an overlap of size at least three;
- a same-boundary-arc winning slice.

Therefore reverse-hit remains a satisfiable residual at the exported interface unless another exact support identity or deletion-survival fact is supplied.

## 6. Generic Kalmanson/cancellation routes

The current endpoint packet does not instantiate an active generic Kalmanson terminal.

`GenericRowNogoodCertificate.WeightedKalmansonCancellationData` and the eight-role/five-row/three-K2 cancellation require a literal collection of selected-row equalities together with one common boundary order of all named roles. The B1 normal form supplies physical-class slice identities and individual blocker-between relations, but it does not supply the required five-row equality pattern or the eight-role strict order.

In particular, the canonical deleted-pair rows and the u/v live rows are not automatically support-identical to the rows required by the generic five-row certificate. Mutual omission and row completion give local incidences; they do not identify a blocker with an endpoint of another physical pair or force the cross-row equalities needed for cancellation.

Thus a generic cancellation theorem cannot be applied without a new source-faithful occurrence theorem. Adding another certificate wrapper before proving that occurrence would only relocate the gap.

## 7. Highest-leverage next theorem

The next useful theorem must consume the **full source-rich endpoint packet**, not only the bare residual. The most precise target is a global B1 order/deletion theorem of the following shape:

```lean
theorem b1_cardSix_endpointOrder_forces_arc_or_thirdDeletion
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (hend : B1CardSixEndpointOrderResidual C E) :
    B1WinningLiveSliceSameBoundaryArc C ∨
      ∃ third : ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v,
        third.deleted ≠ C.first.deleted ∧
        third.deleted ≠ C.second.deleted
```

The two arms already have clean consumers:

- `B1WinningLiveSliceSameBoundaryArc C` is contradicted by `false_of_b1WinningLiveSliceSameBoundaryArc`;
- a genuinely third joint deletion is contradicted by `hnormal.1`.

This theorem is **not currently proved**. Its load-bearing new content must be one of:

1. an alternating/crossing endpoint configuration forces a third exact joint deletion; or
2. direct/mirror cap blocks plus the exact u/v/deleted row incidences force one winning live pair onto one side of its apex-to-blocker cut.

A weaker endpoint wrapper, another cap-cardinality lemma, or another blocker-localization theorem will not remove a residual.

## 8. Recommended falsifiable experiment

Before formalizing the proposed global theorem, run a small source-faithful finite/order experiment on exactly the card-six endpoint packet.

### Variables

- six physical points partitioned as deleted pair, u-pair, v-pair;
- the physical apex and the three associated blocker roles;
- one direct or mirror zero-cut boundary order;
- exact pair disjointness and normal-form cover;
- at least four strict-second-cap physical points;
- the checked per-row separated-pair/equal-radius order consequences;
- the produced disjunction `b1_cardSix_some_pair_blocker_btw`;
- the winning-slice adjacent-cap/blocker-between residual;
- all source-entitled mutual omissions and row-completion incidences.

Do **not** add an unproved same-arc, first-class nonmembership, retained-deletion survival, or cross-row support identity.

### Controls

- positive control: an abstract cyclic boundary model with three independent pair/blocker triples should remain SAT when global B1 cross-incidences are removed;
- mutation control: adding an explicit winning same-arc relation should become UNSAT through the existing same-arc consumer;
- source control: every encoded row equality and nonmembership should cite an active declaration.

### Interpretation

- **UNSAT** would establish that a finite endpoint-order theorem is plausible and would expose a small certificate/order core to formalize.
- **SAT** would falsify the endpoint-order-only route and show that the missing theorem must use retained deletion survival, first-apex-fiber provenance, minimality, or another genuinely global Euclidean/source fact.

This experiment is more informative than adding further cap-count wrappers because the current counting and local blocker geometry are already exhausted.

## Final status

```text
NO CURRENT SOURCE-CLEAN END-TO-END CLOSURE.

Card-six cap counting reduces a winning mate-outside branch to an adjacent-cap
mate plus a different complete interior pair, and checked localizers put that
pair's blocker in the same strict cap. Mate-inside yields a blocker-between
endpoint relation but need not force another complete interior pair. Neither
configuration has an active terminal. Adjacent-cap placement does not supply
first-apex-class nonmembership or retained-deletion survival, and reverse-hit
only yields an equal-blocker residual. The next honest target is a global
endpoint-order/deletion occurrence theorem, preceded by the exact SAT/UNSAT
experiment above.
```
