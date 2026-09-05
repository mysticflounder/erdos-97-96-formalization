# Consult 01M1NJVRW7E4NWC2C027RGZ50K

## CardGe13 frontier: a proof-level exact-card-13 certification route

**Date:** 2026-09-04  
**Requester:** `RadiusCartographer`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`

## Executive verdict

The highest-confidence route is **option (2): an exhaustive exact-card-13 tight-cover encoder with a proof-carrying finite/metric certificate**.

I do **not** find a checked terminal for either of the other two routes:

1. A fresh second deletion can be constructed source-cleanly, and the same three rows survive both deletions, but the current `RepeatedDeletionTraceSystem`/two-deletion/five-survivor stacks do not turn that fact into `False`. The old `TwoDeletionIngress` route is not merely missing an adapter: it assumes one common radius class of cardinality at least five, contradicting the present `hnoFive` two-radius branch.
2. The `oppIndex2` adjacent-grid code now provides radial cyclic order and a strict cross-distance inequality, but it orders only the anonymous grid hits. No theorem currently ties the two actual blocker-shell rows and their centers to that order or to the signed-area packet required by the nested-escape terminal.

The exact-13 route has a clean separation of concerns:

- a small **pure Finset theorem** gives `fresh q OR exact-13 disjoint tight cover`;
- a source adapter retains the information currently dropped by the strict-interior packet;
- `DRExactThirteenBranchIngress` supplies a canonical `Fin 13` boundary and cap-order interface;
- a deterministic finite encoder exhausts all source-allowed support, center-alias, deletion, trace, and cyclic-order cells;
- exact linear Kalmanson certificates eliminate the easy cells;
- only surviving cells proceed to planar QF_NRA through PIQD, with exact model replay or theorem extraction.

This is a **complete decision program**, not yet an UNSAT result. No solver was run in this consult.

---

## 1. Source-clean starting point

The canonical source is now:

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  CardGeThirteenUncoveredStrictInterior.lean
```

Its public split is the theorem named:

```lean
CardGeThirteenUncoveredStrictInterior.
  nonempty_cardGeThirteenUncoveredStrictInteriorPacket_or_exactAdjacentCapGrid
```

The large-interior arm retains a `CardGeThirteenUncoveredThreeCenterPacket` and additionally proves

```lean
z ∈ S.capInteriorByIndex S.oppIndex2.
```

Write:

```text
C0 := U.W.row₁.support
C1 := U.W.row₂.support
K  := U.thirdRow.support
O  := S.oppApex2
b0 := actual late blocker of U.W.source₁
b1 := actual late blocker of U.W.source₂.
```

The current packet gives, source-cleanly:

- `C0.card = C1.card = K.card = 4`;
- `C0,C1,K ⊆ D.A`;
- `z ∈ D.A`;
- `z ∉ C0`, `z ∉ C1`, `z ∉ K`;
- `b0,b1,O ∈ D.A` and are pairwise distinct;
- exact selected rows at centers `b0,b1,O` surviving deletion `z`;
- `K` is the named A2 row opposite the named A2 row containing `z` (`thirdRow_named`);
- `z` lies in the strict `oppIndex2` interior;
- each blocker row meets

  ```text
  I := (firstRow.support ∩ S.oppInterior2) ∪
       (secondRow.support ∩ S.oppInterior2)
  ```

  in at most two points.

The last statement must not be strengthened to a bound on the blocker row's intersection with all of `S.oppInterior2`; that stronger claim is not currently sourced.

Relevant existing declarations include:

```lean
Problem97.ATailDeletionRobustness.
  selectedFourClass_survives_erase_of_not_mem

Problem97.ATailThreeCenterCommonDeletion.
  nonempty_threeCenterCommonDeletionExactRows_of_omitted_selectedFourClasses

Problem97.ATailBiSurvivalCanonicalRows.
  nonempty_biSurvivalCanonicalRows

Problem97.ATailCommonDeletionTwoCenter.
  nonempty_commonDeletionTwoCenterPacket_of_two_omitted_selectedFourClasses
```

The exact-13 boundary side is supplied by:

```lean
Problem97.DRExactThirteenBranchIngress.of_twoRadiusBranch
Problem97.DRExactThirteenBranchIngress.cap_betweenness_of_ingress
Problem97.DRExactThirteenBoundaryIngress.
  ExactThirteenBoundaryBlocks.fin13_boundary
```

---

## 2. First theorem to formalize: the exact Finset dichotomy

This theorem is independent of Kalmanson geometry and should live below the frontier coordinator.

A suitable generic packet is:

```lean
structure ExactThirteenThreeRowTightCover
    {α : Type*} [DecidableEq α]
    (A C0 C1 K : Finset α) (z : α) : Prop where
  card_A       : A.card = 13
  card_union   : ((C0 ∪ C1) ∪ K).card = 12
  cover        : A = insert z ((C0 ∪ C1) ∪ K)
  disjoint_01  : Disjoint C0 C1
  disjoint_0K  : Disjoint C0 K
  disjoint_1K  : Disjoint C1 K
```

The source-neutral theorem should be essentially:

```lean
theorem exists_fresh_outside_three_rows_or_exactThirteen_tight
    {α : Type*} [DecidableEq α]
    (A C0 C1 K : Finset α) (z : α)
    (hA13 : 13 ≤ A.card)
    (hzA : z ∈ A)
    (hC0A : C0 ⊆ A) (hC1A : C1 ⊆ A) (hKA : K ⊆ A)
    (hC0 : C0.card = 4) (hC1 : C1.card = 4) (hK : K.card = 4)
    (hz0 : z ∉ C0) (hz1 : z ∉ C1) (hzK : z ∉ K) :
    (∃ q ∈ A, q ≠ z ∧ q ∉ C0 ∧ q ∉ C1 ∧ q ∉ K) ∨
      ExactThirteenThreeRowTightCover A C0 C1 K z
```

### Proof

Let

```text
S = (C0 ∪ C1) ∪ K,
T = insert z S.
```

1. Repeated `Finset.card_union_le` and the three card-four equalities give `S.card ≤ 12`.
2. The three omission hypotheses give `z ∉ S`, hence

   ```text
   T.card = S.card + 1 ≤ 13
   ```

   by `Finset.card_insert_of_not_mem`.
3. The row-subset hypotheses and `hzA` give `T ⊆ A` by `Finset.insert_subset` and `Finset.union_subset`.
4. Split on `A ⊆ T`.
   - If false, take `q ∈ A \ T`. Expanding `q ∉ insert z S` gives the fresh branch.
   - If true, `A = T` by antisymmetry. Since `13 ≤ A.card ≤ 13`, obtain `A.card = 13`; then `T.card = 13` and `S.card = 12`.
5. Equality in the iterated union bound forces all overlaps to have cardinality zero. Use

   ```lean
   Finset.card_union_add_card_inter
   ```

   first on `C0,C1`, then on `C0 ∪ C1,K`; descend to the three pairwise `Disjoint` statements using `Finset.card_eq_zero` and `Finset.disjoint_left`.

This is routine, kernel-clean Finset arithmetic. It should be formalized even before the metric campaign, but the source adapter should not be promoted as an isolated frontier wrapper unless it is immediately consumed by the finite checker described below.

---

## 3. Fresh second-deletion branch: what is proved and why it is not the selected terminal

For a fresh `q` outside `C0 ∪ C1 ∪ K`, `q ≠ z` and all three rows survive deleting both `z` and `q`:

```lean
selectedFourClass_survives_erase_of_not_mem
```

produces the `q`-deleted witnesses, while the packet already contains the `z`-deleted view. Therefore one can source-cleanly construct:

- a `ThreeCenterCommonDeletionExactRows` packet at deletion `z`;
- another packet at deletion `q`, with the same centers and same supports;
- `BiSurvivalCanonicalRows` for `C0,C1` at the two deletions.

This is a genuine deduction. It is not yet a contradiction.

### Why current consumers do not close it

- `FourCenterCommonDeletionPacket` and `TwoDeletionIngress` require a single common `rho` and

  ```lean
  5 ≤ (SelectedClass D.A O rho).card.
  ```

  The CardGe13 branch instead has two distinct A2 radii and `hnoFive` at every positive radius. The interfaces are logically incompatible.
- `BiSurvivalCanonicalRows` is a canonicalization/data bridge. Its current consumers do not derive `False` from two deletion views alone.
- The five-outside/five-survivor route reaches `FiveSurvivorExactRowsBoundary` only after an A1-survival premise not supplied by this residual. Even after adding it, `SixCenterFaithfulCarrierBoundary` is producer-only; the checked endpoint still requires a `MetricCoreAlternative` or branch-specific crossed/order data.
- For the two actual blockers `β(z),β(q)`, equality or cross-membership splits produce a `RepeatedDeletionTraceSystem`-shaped residual, but no clean theorem turns those Boolean cases into a strict potential cycle or a proper-subsystem contradiction.

Thus route (1) is worth retaining as a secondary source-rich residual, but it is not presently a realistic terminal using only the stated hypotheses.

---

## 4. Exact-13 tight packet: fields that must be retained

The exact tight packet must retain **both** named A2 rows. Let:

```text
K = the named A2 row omitting z,
L = the opposite named A2 row containing z.
```

The source adapter should retain or derive:

### Four row objects

```text
C0 : SelectedFourClass D.A b0
C1 : SelectedFourClass D.A b1
K  : SelectedFourClass D.A O
L  : SelectedFourClass D.A O
```

with:

```text
C0.card = C1.card = K.card = L.card = 4
Disjoint C0 C1
Disjoint C0 K
Disjoint C1 K
Disjoint K L
D.A = insert z ((C0 ∪ C1) ∪ K)
z ∈ L
z ∉ C0,C1,K
```

The outer two-radius branch gives `K.radius ≠ L.radius`, with both radii positive. The outer `hnoFive` and

```lean
selectedFourClass_support_eq_selectedClass_of_card_lt_five
```

should be retained long enough to identify `K.support` and `L.support` with their complete A2 radius classes.

### Center roles

Retain:

```text
b0,b1,O ∈ D.A
b0 ≠ b1, b0 ≠ O, b1 ≠ O
b0 ∉ C0, b1 ∉ C1, O ∉ K, O ∉ L
```

Do **not** add `b0 ≠ z` or `b1 ≠ z`: neither follows from the current source. The complete center-role split is

```text
b0 = z or b0 ∈ C1 or b0 ∈ K,
b1 = z or b1 ∈ C0 or b1 ∈ K,
O ∈ C0 or O ∈ C1,
```

with at most one of `b0,b1` equal to `z`. This gives up to sixteen coarse center cells. If a future theorem derives both blocker inequalities, the surface collapses to the familiar eight cells, but the certificate must not assume that now.

### The common frontier deletion `d`

Let `d := U.W.deleted`. Current source gives:

```text
d ∈ D.A
d ∉ C0
d ∉ C1.
```

The tight cover therefore gives the exact source-clean split

```text
d = z ∨ d ∈ K.
```

The equality `d = z` is compatible with present cap information and cannot be removed. In the `d ≠ z` arm, retain the outer `Disjoint K L`; then `d ∈ K` implies `d ∉ L`, so `L` survives deletion `d`. This yields opposite-radius three-center deletion views:

```text
at z : C0, C1, K
at d : C0, C1, L.
```

This is not a same-radius `TwoDeletionIngress`; it is a new two-radius packet.

### Exact trace information from the fourth row

Since `L.card = 4`, `z ∈ L`, and `L` is disjoint from `K`, the tight cover gives

```text
L.erase z ⊆ C0 ∪ C1
(L.erase z).card = 3.
```

Because `b0,b1 ≠ O`, `SelectedFourClass.inter_card_le_two` gives

```text
|(L ∩ C0)| ≤ 2,
|(L ∩ C1)| ≤ 2.
```

Hence the full traces are exactly `2+1` or `1+2`. This is the correct source consequence. There is no proved `2+2+1` strict-interior blocker profile.

If the exact strict A2 profile is needed by the metric campaign, retain either:

- `hlarge`, `hnoFive`, and the exact-thirteen cap profile producer; or
- one explicit derived field saying `S.oppInterior2.card = 5` and the `K/L` strict-interior counts are `2+3` or `3+2`.

The current strict-interior packet drops enough of these outer facts that they must be carried again by the source adapter.

---

## 5. Deterministic exact finite encoding

The finite code should use the canonical `Fin 13` boundary from `DRExactThirteenBranchIngress`. Pull every point and support through the ingress `LabelMap`/boundary inverse; do not guess a concrete label placement.

### 5.1 Discrete cell

A canonical cell records:

1. four 4-subsets `C0,C1,K,L ⊆ Fin 13`;
2. labels `z,d,b0,b1,O`;
3. `C0,C1,K` pairwise disjoint and

   ```text
   insert z ((C0 ∪ C1) ∪ K) = univ;
   ```

4. `Disjoint K L`, `z ∈ L`, and `z ∉ C0,C1,K`;
5. the `2+1` / `1+2` partition of `L.erase z` over `C0,C1`;
6. the full sixteen-way source-allowed center placement split;
7. `d=z` or `d∈K`; in the second arm, `d∉L`;
8. row-center exclusions and all proved center inequalities;
9. direct/mirror/cyclic-order data inherited from `fin13_boundary` and `cap_betweenness_of_ingress`;
10. when retained, exact cap-block membership, `z∈oppInterior2`, and the `K/L` `2+3` or `3+2` strict-interior profile.

Canonicalization should fix the boundary order, then quotient only symmetries proved to preserve the source packet. In particular, do not quotient away the `d=z` arm or either blocker-equals-z arm.

### 5.2 Linear metric relaxation

For each discrete cell introduce the 78 unordered distance variables

```text
x_ij, 0 ≤ i < j < 13.
```

Assert:

- symmetry/zero diagonal by representation;
- positive off-diagonal distances;
- the 858 strict triangle comparisons;
- the 1,430 strict Kalmanson comparisons for the fixed boundary order;
- three independent equalities for each of `C0,C1,K,L` at its named center;
- `K.radius ≠ L.radius`, split into the two strict orders.

The system is homogeneous. Introduce one common slack `ε>0`, scale a feasible solution so `ε=1`, and encode every strict comparison as an integer-coefficient weak inequality with unit margin. Then an infeasible cell has a rational **Farkas certificate** that can be replayed exactly.

For soundness, the first relaxation may omit non-support disequalities. UNSAT of the weaker system is already a valid contradiction. If a cell survives, add exact-class conditions:

- for `K,L`, every nonmember has distance unequal to the named radius, justified by `hnoFive` plus support-card four;
- for `C0,C1`, add nonmember inequalities only if the source adapter proves their supports equal the complete selected classes. A bare `SelectedFourClass` does not by itself justify that strengthening.

The output of this layer should be one of:

```text
EXACT_LRA_UNSAT + independently checked Farkas certificate
EXACT_LRA_SAT   + rational distance model
```

A raw floating or same-solver verdict is not enough.

### 5.3 Planar layer for LRA survivors

Only LRA survivors proceed to PIQD QF_NRA. Use:

- 26 coordinate variables for the 13 boundary points;
- one fixed cyclic order from the finite cell;
- strict convexity via all increasing-triple orientation signs, or an equivalent checked edge-support formulation;
- squared-distance equalities for `C0,C1,K,L`;
- exact non-support inequalities where source-entitled;
- positive and distinct `K/L` squared radii;
- all retained cap-block/interior predicates as signed-area constraints;
- the exact center-alias cell, deletion cell, and support cell.

A SAT model must be read back as exact rationals or algebraic numbers and independently replayed against every source predicate in the cell. It is a local packet witness, not a P97 counterexample unless the omitted global fields are later added.

A QF_NRA UNSAT response remains discovery evidence unless accompanied by a checkable real-algebraic certificate or reduced to a small geometric motif that is formalized in Lean.

No non-PIQD solver should be launched without Adam's explicit per-task approval.

---

## 6. Lean certificate architecture and acyclic imports

A clean dependency graph is:

### Layer A — pure finite theorem

```text
lean/Erdos9796Proof/P97/ATail/
  ThreeRowsFreshOrExactThirteenTight.lean
```

Contains only the generic Finset dichotomy and `ExactThirteenThreeRowTightCover`. It should import no frontier coordinator.

### Layer B — source-rich adapter

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  CardGeThirteenFreshOrTight.lean
```

Imports:

```text
CardGeThirteenUncoveredStrictInterior
CardGeThirteenBiSurvivalAdapter
DRExactThirteenBranchIngress
ThreeRowsFreshOrExactThirteenTight
```

It takes the outer `hcard`, `hdisjoint`, `hnoFive`, `hlarge/profile`, both named A2 rows, and `surface`, and returns:

```text
Nonempty CardGeThirteenFreshBiDeletionPacket
∨ Nonempty CardGeThirteenExactTightCoverPacket.
```

It must retain `d=z∨d∈K`, all sixteen center cases, and the fourth-row `2+1` trace.

### Layer C — finite code

```text
lean/Erdos9796Proof/P97/Census554/
  CardGeThirteenTightCoverFiniteCode.lean
```

Defines the canonical `Fin 13` cell and proves that every source packet maps to at least one enumerated cell. It imports the DR exact-13 boundary code, but not `Rigid221Closure`.

### Layer D — checked certificate ingress

```text
lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
  DRExactThirteenTightCoverCertificateIngress.lean
```

A static CNF/LRAT layer may reuse the architectural pattern of:

```lean
TerminalRupIngress.dimacsUnsatisfiable_of_checkedCompactTerminal
TerminalRupIngress.not_realizes_of_checkedCompactTerminal
```

but a new exact identity/coverage theorem is required for this cell family. Linear metric cells should carry exact Farkas coefficient records and a small generic checker/consumer; generated Lean `linarith` proofs are also acceptable if every cell and coefficient set is pinned and audited.

Only after the certificate checker proves:

```lean
false_of_cardGeThirteenExactTightCover
```

and a separate clean terminal handles the fresh branch should a final coordinator be imported by `Rigid221Closure`. This import direction is acyclic because none of the proposed lower modules imports `Rigid221Closure`.

---

## 7. Adjacent `oppIndex2` grid boundary

Current source-clean producers are:

```lean
Problem97.ExactFourAdjacentGridKalmanson.
  exists_fourHits_radialCyclicOrder_oppIndex2

Problem97.ExactFourAdjacentGridKalmanson.
  exists_fourHits_strict_cross_distance_oppIndex2
```

The available terminal family includes:

```lean
Problem97.ATailTwoRadiusGridNestedEscapeTerminal.false_of_nestedEscape_packet
Problem97.ATailTwoRadiusGridNestedEscapeTerminal.
  false_of_twoRadiusGrid_zeroCut_nestedEscape
```

These do not compose yet. The radial producer orders anonymous grid representatives; the terminal needs explicit blocker-shell members, blocker-center order, and a reflected signed-area packet. The historical zero-cut assembly is `oppIndex1`-specific.

The first genuinely missing theorem is of the following kind:

```lean
exists_blockerShell_grid_order_or_signedPacket_oppIndex2
  (G : S.ExactFourTwoRadiusAdjacentCapGrid S.oppIndex2 r R)
  (P : TwoFourClassesTwoFourShellsDoublePartition ... actual blocker rows ...) :
  ... ConvexCyclicOrder involving O, a grid hit, and the blocker center ...
  -- or directly the signed-area packet consumed by false_of_nestedEscape_packet
```

No current declaration supplies this. The strict cross-distance inequality alone is compatible with exact convex configurations and cannot be a terminal. Therefore option (3) is presently higher-risk than the exact-13 certificate route.

---

## 8. Proven versus conjectural boundary

### Proved/source-clean

- strict-interior uncovered-or-grid split;
- blocker trace bound inside the selected physical-row interior union;
- fresh `q OR exact-13 tight cover` Finset dichotomy;
- survival of `C0,C1,K` under a fresh second deletion;
- pairwise disjoint tight cover in the complementary branch;
- `A2 ≠ z`;
- the sixteen coarse center-placement cases;
- `d=z ∨ d∈K`;
- in the `d≠z` branch, opposite named A2 deletion views after retaining outer row disjointness;
- fourth-row `2+1` / `1+2` full-support trace;
- DR exact-13 finite boundary and cap-betweenness ingress;
- `oppIndex2` radial order and strict cross-distance producer.

### Not proved and must not be assumed

- `b0 ≠ z` or `b1 ≠ z`;
- `d ≠ z`;
- a `2+2+1` strict-interior blocker trace;
- a common-radius five-point TwoDeletion packet;
- a checked terminal from `BiSurvivalCanonicalRows`;
- a Kalmanson contradiction from the three disjoint rows alone;
- a blocker-shell-to-grid cyclic-order bridge;
- exact-13 finite or planar UNSAT.

---

## 9. Recommended immediate work

1. Formalize the pure Finset theorem and the source-rich `fresh OR tight` adapter, but merge them with the finite-code lane so they are not orphan wrappers.
2. Build the deterministic `Fin 13` cell enumerator retaining all sixteen center cases, both `d` branches, both fourth-row trace orientations, and both named A2 classes.
3. Run exact rational Kalmanson/LRA screening and retain Farkas certificates. This is the cheapest possible decisive test.
4. If LRA survivors remain, submit only those cells through governed PIQD QF_NRA and exact replay.
5. Extract and formalize the smallest repeated motif if planar UNSAT is observed. Do not wire a solver receipt directly into `Rigid221Closure` without a checked coverage and certificate ingress.
6. Keep the fresh-bi-deletion and adjacent-grid branches as separate residuals. Neither should be advertised as closed until a source-clean terminal exists.

## Final recommendation

The exact-13 tight-cover branch is the only current route with a fully specifiable, acyclic, proof-producing endgame. Its next milestone should be:

```text
all exact-13 source cells enumerated and authenticated
+ every cell either exact-Farkas UNSAT or exact-replayed planar survivor.
```

That result will either close the tight branch with a checkable certificate or return a concrete local model showing precisely which additional global P97 field is needed. Both outcomes materially de-risk the CardGe13 sorry. The fresh second-deletion and adjacent-grid arms currently stop at honest source-rich packets with no checked terminal.
