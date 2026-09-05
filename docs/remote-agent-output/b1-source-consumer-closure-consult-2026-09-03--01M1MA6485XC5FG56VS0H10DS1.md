# B1 source-consumer closure consult

Consult: `01M1M60EKC8XC6X5NYBJM4MFEA`  
Target: `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`  
Source boundary: commit `88acd2354` and later B1 reducer/negative-control commits, especially `7cdcaef62` and `0f564afde`.

## Executive verdict

There is no current kernel-clean end-to-end closure of the B1 five/six normal form under the restrictions in the request. The source has already been factored to the correct two mathematical consumers:

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpoint
```

whose logical shape is

```lean
(C : B1GlobalTransportContext ...)
(hnormal : B1PhysicalClassFiveSixNormalForm C)
(hsource : ∀ P : B1EscapeSourceContext C, False)
(hcanonical : ∀ P : B1GoodCanonicalDeletionEndpointResidual C, False) :
False
```

The top-level target remains sorry-backed. No additional top-level dispatcher should be added.

The strongest source-clean reduction now available for the escape branch is:

```text
escape source context
  -> exact-four mutual-omission source context
  -> a joint deletion for the fixed C.u/C.v pair
  -> that deletion is one of the two canonical deletions.
```

This does **not** produce a third deletion: the normal-form hypothesis is exactly what forces the produced deletion to be canonical. It also does not produce a same-boundary-arc packet. The smallest honest new mathematical target is therefore a terminal for an **escape source plus canonical joint deletion** packet, not another endpoint-order wrapper.

For the canonical branch, the current working tree defines the explicit contract `B1GoodCanonicalEndpointCardArc` and a conditional source-clean consumer `false_of_b1GoodCanonicalEndpointCardArc`, but no source theorem produces the card-arc contract. Commit `0f564afde` gives a kernel-checked finite negative control showing that the present endpoint-order facts do not imply the required same-arc bit.

## 1. Current source-clean factorization

Reducer commit `7cdcaef62` isolates exactly two consumers:

```lean
hsource : ∀ P : B1EscapeSourceContext C, False
hcanonical : ∀ P : B1GoodCanonicalDeletionEndpointResidual C, False
```

This is the correct boundary. It is acyclic and does not invoke:

- `false_of_exactFourMutualOmission_fourCenterCommonDeletion_blockerCoincidence`;
- `false_of_exactFourMutualOmission_fourCenterCommonDeletion_survivalSquare`;
- `Rigid221Closure` through a backward import.

The relevant import direction is

```text
B1WinningLiveSliceIngress
  -> B1WinningSliceOrderOutcome
  -> TwoDeletionCollision
  -> higher B1/TwoDeletion coordinator
```

The same-arc consumers are lower than `TwoDeletionCollision`, so calling them from the target file is acyclic. `Rigid221Closure` is downstream/higher and must not be imported backward.

## 2. Why endpoint order cannot close the canonical branch

The current endpoint residuals retain facts such as:

```text
mate lies in one of the two adjacent caps
or
the exact row blocker is linearly between the two live-slice endpoints.
```

Commit `0f564afde` contains a finite, kernel-checked order/incidence model in which:

- the physical class is a union of three disjoint two-point pairs;
- all currently produced `separatedPair` and blocker-between relations hold;
- the two relevant live-slice same-arc predicates both fail.

Consequently none of the following implications is source-justified from the current endpoint packet:

```lean
B1CardSixEndpointOrderResidual C E ->
  B1WinningLiveSliceSameBoundaryArc C
```

or its card-five/canonical analogue.

The weakest order antecedent actually consumed by the clean terminal is the row-local predicate

```lean
B1SliceSameBoundaryArc
  B
  apex
  rowBlocker
  slice
```

for a card-two live slice. The existing clean terminals are:

```lean
false_of_b1WinningLiveSliceSameBoundaryArc
```

and the stronger symmetric wrapper

```lean
false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc.
```

The current cap machinery does not supply this bit. In the mate-inside branch it places the row blocker inside the same strict cap, whereas the existing cap-convex same-arc adapter needs the cut endpoint outside. In the mate-outside branch it localizes the mate to an adjacent cap but does not place the blocker or the second endpoint in a configuration implying same-arc.

Thus `B1GoodCanonicalEndpointCardArc` is an honest explicit missing hypothesis, not a theorem currently derivable from `C`.

## 3. Strongest source-clean escape-source reduction

The request correctly identifies the neutral adapter

```lean
exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext
```

from

```lean
P : B1EscapeSourceContext C
```

to an exact-four source context for the fixed pair `C.u,C.v`.

The joint-deletion constructor is source-clean:

```lean
Problem97.ATailFrontierLiveClosure.
  nonempty_exactFourMutualOmissionJointDeletion
```

in `JointDeletion/Constructors.lean:46-58`. Its relevant explicit arguments are:

```lean
(R : OriginalUniqueFourResidual F)
(surface : ExactFourPostCardElevenRobustSurface R)
(rho : ℝ)
(hfive : 5 ≤ (SelectedClass D.A S.oppApex2 rho).card)
(u v : CarrierVertex D.A)
(hblockersNe :
  (lateFirstApexSystem R).centerAt u.1 u.2 ≠
  (lateFirstApexSystem R).centerAt v.1 v.2)
```

and it returns

```lean
Nonempty (ExactFourMutualOmissionJointDeletion R rho u v).
```

The five/six normal form gives `hfive` by arithmetic from its exact-cardinality disjunction. The distinct-blocker premise is retained by the exact-four mutual-omission source context.

The resulting source-level theorem should have the following shape; only the exact projection names for `R/surface` need to be copied from the current neighboring declarations:

```lean
theorem b1_escapeSourceContext_canonicalJointDeletion
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F))
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1EscapeSourceContext C) :
    ∃ Q : ExactFourMutualOmissionSourceContext C.R C.rho C.u C.v,
      ∃ J : ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v,
        J.deleted = C.first.deleted ∨
          J.deleted = C.second.deleted := by
  obtain ⟨Q⟩ :=
    exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext
      C hnormal P
  have hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 C.rho).card := by
    rcases hnormal.2.1 with h5 | h6 <;> omega
  obtain ⟨J⟩ :=
    nonempty_exactFourMutualOmissionJointDeletion
      /* C's existing R/surface projections */
      C.rho hfive C.u C.v Q.blockers_ne
  have hcanonical :
      J.deleted = C.first.deleted ∨
        J.deleted = C.second.deleted := by
    by_cases hfirst : J.deleted = C.first.deleted
    · exact Or.inl hfirst
    by_cases hsecond : J.deleted = C.second.deleted
    · exact Or.inr hsecond
    exact False.elim (hnormal.1 ⟨J, hfirst, hsecond⟩)
  exact ⟨Q, J, hcanonical⟩
```

The proof uses no target theorem, no four-center terminal, and no downstream import. It is the first reduction worth kernel-checking and landing.

## 4. Why this does not turn the escape branch into the existing canonical branch

The distinction is between a canonical **deleted value** and a good canonical **source**.

`B1EscapeSourceContext` is constructed with a noncanonical escape source; its constructor requires the source to differ from both `C.first.deleted` and `C.second.deleted`. The produced joint deletion `J` is a different object. Knowing

```lean
J.deleted = C.first.deleted ∨ J.deleted = C.second.deleted
```

does not transfer the escape source's fields to `J.deleted`.

In particular, the packet does not prove that `J.deleted` has:

```text
membership in outsideFirstApexFiber C.R;
retained q/w-deletion survival at its own actual blocker;
a goodOutsideSources witness;
a named omitted peer in one original live slice;
the endpoint/cap-order data stored by B1GoodCanonicalDeletionResidual.
```

The current fresh-pair and deletion-role declarations are methods on `B1GoodCanonicalDeletionResidual` or its endpoint refinement. Their input type retains a canonical **source identity** and an omitted-peer construction. A generic exact-four source context plus a joint deletion whose deleted value happens to be canonical does not meet those fields.

Therefore there is no current source-clean adapter

```lean
B1EscapeSourceContext C ->
  B1GoodCanonicalDeletionEndpointResidual C.
```

This is a real field mismatch, not missing tactic plumbing.

## 5. Smallest honest residual theorem

The useful residual should preserve all retained-deletion provenance instead of discarding it into a Boolean endpoint outcome:

```lean
structure B1EscapeCanonicalJointDeletionResidual
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (C : B1GlobalTransportContext
      (D := D) (S := S) (radius := radius) (H := H) (F := F)) where
  escape : B1EscapeSourceContext C
  sourceContext :
    ExactFourMutualOmissionSourceContext C.R C.rho C.u C.v
  jointDeletion :
    ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v
  deleted_is_canonical :
    jointDeletion.deleted = C.first.deleted ∨
      jointDeletion.deleted = C.second.deleted
```

The smallest genuine mathematical terminal is then

```lean
theorem false_of_b1EscapeCanonicalJointDeletionResidual
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1EscapeCanonicalJointDeletionResidual C) : False
```

This is strictly sharper than `false_of_b1EscapeSourceContext`: all finite-set production and the no-third-deletion reduction have already been discharged.

### First genuinely missing antecedent

There is no existing consumer because the residual lacks a cross-system bridge between the canonical joint deletion and the retained escape-source geometry. The first useful missing fact is one of the following equivalent-strength ingress choices:

1. a proof that the canonical deleted carrier itself is a good outside-first-apex source with retained q/w survival, allowing construction of the canonical endpoint packet; or
2. a source-faithful boundary statement producing `B1SliceSameBoundaryArc` for the actual winning card-two live slice; or
3. a positive cross-row incidence/support identity tying the canonical deleted carrier to the escape-source row strongly enough to invoke a Kalmanson/common-deletion consumer.

Current fields prove none of these. Merely knowing that the joint deletion is canonical is insufficient.

The cleanest geometric formulation is option 2, because it has an immediate existing terminal. The cleanest deletion-theoretic formulation is option 1, because it would route the escape residual into the already separated canonical branch. Neither is currently source-proved.

## 6. Canonical endpoint residual

The current working tree adds:

```lean
B1GoodCanonicalEndpointCardArc
```

and a conditional consumer

```lean
false_of_b1GoodCanonicalEndpointCardArc.
```

This is a correct interface if it is kept explicitly conditional. It does not close a branch until a producer proves the card-arc packet from source-rich B1 data.

The proper producer target is schematically:

```lean
theorem b1_goodCanonicalEndpoint_cardArc
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1GoodCanonicalDeletionEndpointResidual C) :
    B1GoodCanonicalEndpointCardArc C P
```

The endpoint negative control rules out proving this from only the residual's current finite order/incidence fields. A valid proof must use additional global MEC/cap/minimality/deletion data still accessible in `C`.

## 7. Rejected routes

### A. Endpoint residual directly to same-arc

Refuted at the exported finite order/incidence interface by commit `0f564afde`.

### B. Escape source directly to a third distinct deletion

The source-clean constructor does produce a joint deletion, but `hnormal.1` forces it to be canonical. A theorem asserting a third deletion from the same inputs would directly contradict the normal-form branch being analyzed and would be equivalent to proving the branch false.

### C. `B1EscapeCrossDeletionPacket` plus all `B1ContinuationCase` constructors

This is source-reachable, but it is not a smaller proof obligation. `B1ContinuationCase` has five center/role-alias constructors and four survival-pair constructors, and `false_of_b1ContinuationConsumer` still requires an external contradiction for every case. No constructor currently has a complete source-clean terminal. Use it only after one specific case consumer has been proved.

### D. Backward reuse of `Rigid221Closure`

Invalid import direction and, in the relevant paths, still dependent on open exact-four/four-center leaves.

### E. The two existing four-center terminal leaves

Explicitly excluded by the consult and independently still sorry-backed.

### F. More static QF_NRA row waves

The existing static systems omit the retained q/w-deletion packet, which is the strongest extra data in `B1EscapeSourceContext`. More runs on the same reduced row/MEC surface do not attack the newly isolated residual.

## 8. Lean-oriented implementation sequence

1. **Land the source-clean producer** `b1_escapeSourceContext_canonicalJointDeletion` immediately after `exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext` in `TwoDeletionCollision.lean`. Avoid a new structure if the dependent pair result is convenient.

2. **Factor only genuinely neutral role lemmas.** Inspect the current fresh-pair/card-five/card-six declarations and move a lemma to the neutral `(Q,J,hcanonical)` packet only when its proof does not use the canonical-source or omitted-peer fields of `B1GoodCanonicalDeletionResidual`. Do not weaken those fields silently.

3. **State the one escape residual terminal** `false_of_b1EscapeCanonicalJointDeletionResidual`. Its producer wrapper should be a short source-clean theorem. This becomes the `hsource` argument of the reducer.

4. **Keep the canonical card-arc contract conditional.** Prove `b1_goodCanonicalEndpoint_cardArc` only from a genuinely new global cap/deletion theorem. Its conditional False consumer becomes `hcanonical`.

5. **Wire the existing reducer.** Once both branch consumers are closed, replace the body of `false_of_b1PhysicalClassFiveSixNormalForm` by one call to `false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpoint`.

No step should add or move a `sorry`.

## Final status

```text
NO CURRENT SOURCE-CLEAN CLOSURE.

The correct top-level factorization is already present. Endpoint-order data alone
cannot imply same-arc. The escape branch source-cleanly reduces to a retained
escape-source context plus a joint deletion forced to equal one of the two
canonical deletions. That canonical-deleted-value fact does not make the
canonical point a good source and does not construct the canonical endpoint
packet. The smallest honest new mathematical target is therefore
false_of_b1EscapeCanonicalJointDeletionResidual; the canonical branch separately
needs a source producer for B1GoodCanonicalEndpointCardArc. The first missing
content is genuinely global cap/deletion/cross-row geometry, not another finite
set or endpoint-order wrapper.
```
