# Closing the Rigid221 exact-five / exact-twelve balanced `(5,5,5)` leaf

**Target**

```lean
Problem97.ATailFrontierLiveClosure.
  false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical
```

**Checkpoint date:** 2026-09-02  
**Status:** the mathematical route is reduced to one source-order adapter and one small proof-carrying finite theorem. The corrected external finite replay is exhaustive for the stated source-facing finite surface; no production Lean closure is claimed yet.

## 1. Final proof shape

The live target should close through the following chain.

```text
current tight-leaf hypotheses
  -> nonempty_balancedTightCoverInvariant
  -> balanced `(5,5,5)` cap-compatible Fin-12 boundary labeling
  -> one all-center FaithfulCarrierPattern preserving K0,K1,K2
  -> relabeled RowPattern/Realizes on Fin 12
  -> balanced555_finite_outcome
       = shared-pair nonalternation
         OR checked weighted Kalmanson cancellation
  -> either branch is impossible in the Euclidean source model
  -> False
```

The desired target body is consequently only:

```lean
obtain ⟨I⟩ :=
  ExactFiveDistinctThreeCenterTightCover.nonempty_balancedTightCoverInvariant
    R C N hcard hunion herase
exact false_of_balancedTightCoverInvariant I
```

Everything difficult belongs below `false_of_balancedTightCoverInvariant`.

## 2. Existing source anchor

The right source packet already exists:

```lean
Problem97.ATailFrontierLiveClosure.
  ExactFiveDistinctThreeCenterTightCover.BalancedTightCoverInvariant
```

in `ExactFiveDistinctThreeCenterTightCover.lean` near line 1064. Its producer is

```lean
nonempty_balancedTightCoverInvariant
```

near lines 1144–1160.

The invariant already retains all branch-specific incidence facts needed by the finite theorem:

- carrier cardinality twelve;
- exact support intersection identities;
- residual and carrier partitions;
- the three exact selected four-rows `K0`, `K1`, `K2`;
- exact closed-cap profile `(5,5,5)`;
- first and second opposite strict-interior cardinalities three;
- the exact first-interior triple `{deleted, retained, third}`;
- distinct first, middle, and second row centers.

It does **not** need to be strengthened with:

- `C2 = insert deleted K2`;
- named adjacent hits;
- a `K1` complement formula;
- a six-location middle-center theorem;
- a second-apex five-class role map.

The corrected finite theorem does not consume those statements.

## 3. Boundary normalization: the only new geometric/source adapter

The existing producer

```lean
Problem97.Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks
```

in `Census554/ZeroCutBoundaryIndexing.lean` returns a `BoundaryIndexing`, the three triangle positions, and either `DirectBoundaryBlocks` or `MirrorBoundaryBlocks`.

The direct order is

```text
S | I2 | O1 | Is | O2 | I1
```

and the mirror order is

```text
S | I1 | O2 | Is | O1 | I2.
```

Only three small lemmas are missing.

### 3.1 Public cap-interior cardinality lemma

Expose the general identity that strict cap interior is the closed cap with its two distinct endpoints removed. A suitable public theorem is:

```lean
theorem SurplusCapPacket.capInteriorByIndex_card_add_two
    (S : SurplusCapPacket A) (i : Fin 3) :
    (S.capInteriorByIndex i).card + 2 = (S.capByIndex i).card
```

or the equivalent subtraction form. From `I.cap_profile.surplusCap_card = 5`, derive

```lean
(S.capInteriorByIndex S.surplusIdx).card = 3.
```

The two opposite strict-interior card-three facts are already fields of the invariant.

### 3.2 Boundary-index cardinality lemma

Add the generic helper:

```lean
theorem Census554.GeneralCarrierBridge.BoundaryIndexing.n_eq_card
    (B : BoundaryIndexing A) : B.n = A.card
```

It follows immediately from `boundary_injective` and `boundary_image`.

For the invariant, this gives `B.n = 12`.

### 3.3 Exact balanced block adapter

From the one-way block inclusions, the three strict-interior card-three facts, and `B.n=12`, prove the exact positions.

Direct case:

```text
iv = 4, iw = 8,
labels(I2) = {1,2,3},
labels(Is) = {5,6,7},
labels(I1) = {9,10,11},
label(S)=0, label(O1)=4, label(O2)=8.
```

The arithmetic is forced:

```text
3 points in (0,iv)       -> 4 <= iv,
3 points in (iv,iw)      -> iv + 4 <= iw,
3 points after iw in 12  -> iw <= 8,
```

hence `iv=4`, `iw=8`. Equal-cardinality subset arguments upgrade the one-way interior inclusions to exact labeled sets.

Mirror case similarly gives the same numerical positions with `O1/O2` and `I1/I2` exchanged:

```text
label(S)=0, label(O2)=4, label(O1)=8,
labels(I1)={1,2,3}, labels(Is)={5,6,7}, labels(I2)={9,10,11}.
```

Package this as:

```lean
inductive Balanced555Orientation | direct | mirror

structure Balanced555BoundaryLabeling (A : Finset ℝ²)
    (S : SurplusCapPacket A) where
  orientation : Balanced555Orientation
  pointOf : Fin 12 -> ℝ²
  pointOf_injective : Function.Injective pointOf
  pointOf_image : Finset.univ.image pointOf = A
  pointOf_ccw : EuclideanGeometry.IsCcwConvexPolygon pointOf
  -- exact apex and strict-interior label identities, orientation-dependent
```

No second-class identity enters this construction.

## 4. All-center selected-row family

Use the existing global-K4 constructor

```lean
exists_faithfulCarrierPattern_with_classes_on
```

to choose one selected four-class at every carrier center while preserving exactly:

```text
classAt O1 = K0,
classAt c1 = K1,
classAt O2 = K2.
```

The three centers are distinct in the normal-form/tight-cover packet, so the prescribed class function is compatible.

No support-minimality or SCC consequence is used. `FaithfulCarrierPattern` is only a convenient simultaneous row-choice object.

Relabel with the already existing generic APIs in `GenericRowNogoodCertificate.lean` and `ExactTwelveCarrierIngress.lean`:

```lean
reindexRowPattern
mem_reindexRowPattern_iff
realizes_reindexRowPattern
labeledRowPattern
mem_labeledRowPattern_iff
labeledRowPattern_card
realizes_labeledRowPattern
```

The resulting `RowPattern (Fin 12)` has an exact Euclidean `Realizes` proof.

## 5. Pure finite theorem

The finite theorem should not itself assume geometric shared-pair separation or conclude `False`. It should expose whichever finite obstruction occurs.

```lean
structure SharedPairNonalternation
    (row : EqualityCore.RowPattern (Fin 12)) : Prop where
  c d p q : Fin 12
  centers_ne : c != d
  points_ne : p != q
  p_mem_c : p ∈ row c
  q_mem_c : q ∈ row c
  p_mem_d : p ∈ row d
  q_mem_d : q ∈ row d
  same_side :
    (SurplusCOMPGBank.btw c d p <-> SurplusCOMPGBank.btw c d q)

structure WeightedKalmansonOccurrence
    (row : EqualityCore.RowPattern (Fin 12)) : Prop where
  choices : List (RowChoice (Fin 12))
  data : WeightedKalmansonCancellationData (Fin 12)
  positive : PositiveRowsMatch row choices
  checked : data.check choices = true

inductive Balanced555FiniteOutcome
    (row : EqualityCore.RowPattern (Fin 12)) : Prop
  | sharedPair : SharedPairNonalternation row -> Balanced555FiniteOutcome row
  | kalmanson : WeightedKalmansonOccurrence row -> Balanced555FiniteOutcome row
```

The theorem is:

```lean
theorem balanced555_finite_outcome
    (orientation : Balanced555Orientation)
    (row : EqualityCore.RowPattern (Fin 12))
    (hrows : Balanced555LocalRowConditions orientation row)
    (hpinned : Balanced555Pinned orientation row) :
    Balanced555FiniteOutcome row
```

### 5.1 Local row conditions

For every center:

```text
card(row c)=4,
c∉row c.
```

For every fixed closed cap containing the center:

```text
card(row c ∩ cap) <= 2.
```

At each of the three Moser vertices:

```text
at least two row points in the opposite strict interior,
at most one row point in each adjacent closed cap.
```

### 5.2 Pinned conditions

Let `firstApex`, `secondApex`, and the three cap sets depend on orientation. Let

```text
K0=row firstApex,
K1=row middle,
K2=row secondApex.
```

Require only:

```text
firstInterior = {deleted,retained,third},
middle != firstApex,
middle != secondApex,
deleted ∉ K0 ∪ K1 ∪ K2,
retained,third ∈ K0,
retained ∈ K1,
K0 ∩ K1 = {retained},
Disjoint K0 K2,
Disjoint K1 K2,
univ = insert deleted (K0 ∪ K1 ∪ K2).
```

## 6. Corrected exhaustive certificate

The corrected source-facing replay uses all six canonical Kalmanson families through one generic weighted consumer.

```text
root keys:                      1,656 direct
reflected instances:            1,656
raw instantiated cores:        53,064
effective cores:               42,330
impossible cores skipped:      10,734
recursive search nodes:         3,981
maximum nodes in one root:         28
roots closed before recursion:    468
SAT roots:                           0
```

The prior verifier incorrectly asserted that every globally generated core had a nonempty row domain. In fact 10,734 cores are impossible from local cap-row constraints and must be discarded. The corrected verifier skips them and still closes every root.

Retained local exact receipt:

```text
script SHA-256:
5c423c5281013bdc8859fe3f53526d4a84257e0d380417f528e5cd5e5891f7c3

result SHA-256:
3fd34fba9dcc3aa045ead8819d16038d6733f597855a2279096fc9cad558791b
```

## 7. Proof-carrying finite implementation

Use a small checked decision DAG, not a monolithic exact-twelve CNF bridge.

```lean
inductive Balanced555Certificate
  | leaf
  | branch (center : Fin 12)
      (children : Array (Finset (Fin 12) × Balanced555Certificate))
```

A checker receives a partial row assignment. It verifies:

1. every omitted branch-row immediately gives a shared-pair violation or completes one of the six weighted cores;
2. every surviving locally admissible row occurs exactly once among the children;
3. leaves already contain an explicit finite outcome;
4. root certificates cover every valid pinned root key.

The checker soundness theorem is proved once by structural induction. The generated constant certificate can be validated with kernel `by decide`; a current source check confirms a small `WeightedKalmansonCancellationData.check = true` goal reduces with `decide`, so `native_decide` is not intrinsically required.

The finite theorem returns the explicit outcome witness. It does not trust the search program or a solver verdict.

## 8. Source discharge of the two outcomes

### Shared-pair branch

Use either

```lean
Problem97.selectedFourClass_shared_pair_separated
```

or

```lean
GeneralCarrierAbstractRowSystem.system_sharedPairAlternating
```

on the source selected rows. The source theorem gives opposite between-bits; the finite witness gives equal between-bits.

### Kalmanson branch

Use the single generic theorem

```lean
Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate.
  false_of_weightedKalmansonCancellationData_of_check
```

It requires:

- `ConvexIndep`;
- the boundary image and CCW proofs;
- `Realizes` for the labeled row pattern;
- `PositiveRowsMatch` from the occurrence;
- the checked weighted certificate.

It accepts the one-term `S4-A` occurrence as well as all two-term occurrences. No schema-specific geometric theorem is needed.

## 9. Source-facing terminal

Implement:

```lean
theorem false_of_balancedTightCoverInvariant
    (I : ExactFiveDistinctThreeCenterTightCover.BalancedTightCoverInvariant R C N) :
    False := by
  obtain ⟨labeling⟩ := exists_balanced555BoundaryLabeling I
  obtain ⟨carrierPattern, hpinnedClasses⟩ :=
    exists_balanced555FaithfulCarrierPattern I
  let P := ExactTwelveCarrierIngress.labeledRowPattern carrierPattern labeling.e
  have hreal := ExactTwelveCarrierIngress.realizes_labeledRowPattern ...
  have hrows : Balanced555LocalRowConditions labeling.orientation P := ...
  have hpinned : Balanced555Pinned labeling.orientation P := ...
  rcases balanced555_finite_outcome labeling.orientation P hrows hpinned with hsep | hkal
  · exact false_of_sharedPairNonalternation ... hsep
  · exact GenericRowNogoodCertificate.false_of_weightedKalmansonCancellationData_of_check
      ... hreal hkal.choices hkal.positive hkal.data hkal.checked
```

Then replace the live leaf body by the invariant producer plus this theorem.

## 10. Module and import plan

Suggested modules:

```text
P97/Census554/Balanced555BoundaryLabeling.lean
P97/ATail/FrontierLiveClosure/Balanced555FiniteKalmanson.lean
P97/ATail/ExactFiveDistinctTightBalancedIngress.lean
```

The finite module should contain no P97 source packets. The source ingress must not import B1, TwoDeletion terminal leaves, Rigid221SourceHeavy, or old `(5,4,6)` frozen exact-twelve role modules.

`Rigid221Closure.lean` imports only the final ingress.

## 11. Exact implementation order

1. Public cap-interior cardinality theorem.
2. `BoundaryIndexing.n_eq_card`.
3. `exists_balanced555BoundaryLabeling` with direct/mirror exact blocks.
4. Simultaneous faithful row choice pinned at `K0/K1/K2`.
5. Finite outcome structures and certificate checker soundness.
6. Generate and check the finite certificate.
7. `false_of_balancedTightCoverInvariant`.
8. Replace the target `sorry`.
9. Focused builds, enclosing `FrontierLiveClosure` build, target/root axiom audit, and independent certificate replay.

## 12. Acceptance boundary

Closure is complete only when:

- the source adapter is proved in Lean;
- the finite certificate is checked in Lean;
- the live target contains no `sorry`;
- the target and publication-root axiom closures contain no new custom/native/sorry axioms;
- focused and aggregate builds pass;
- the generated certificate is independently replayed byte-for-byte.

The finite search is no longer an open mathematical risk. The remaining work is formal interface engineering and a small verified finite checker.
