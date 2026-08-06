# Closure assessment

The best route is to treat this theorem as the **source-return specialization** of the retained common-deletion walk, not as another generic Package‑E incidence problem.

The current theorem contains two strict-first-cap sources with reciprocal omissions and source-exact common-deletion packets:

[
x=\texttt{O.kept},\qquad
y=\texttt{O.deleted},\qquad
p=\texttt{S.oppApex1}.
]

If

[
K_x=\operatorname{support}(H.\texttt{selectedAt}\ x),\qquad
K_y=\operatorname{support}(H.\texttt{selectedAt}\ y),
]

then the hypotheses give

[
y\notin K_x,\qquad x\notin K_y,
]

and deletion survival at (p) and at the two distinct actual blockers (b_x,b_y). This is exactly the mutual-omission two-cycle already formalized in the off-spine `RetainedMatchingSourceReturnRadiusSplit` bank. The target currently sits at lines 948–964, and its only displayed consumer is the later normal-form coordinator, so it can safely be moved downward or supplied by imported lower-level lemmas without changing the public API. ([GitHub][1])

My recommended closure architecture is:

[
\boxed{
\text{paired deletion}
\longrightarrow
\text{source-return split}
\longrightarrow
\begin{cases}
\text{joint three-center deletion},\
\text{exact }2\times2\text{ partition}
\end{cases}
\longrightarrow
\text{rich-radius renewal}
\longrightarrow
\text{bounded order/metric terminal}.
}
]

The exact source-return split and its U5 ingress are already source-proved; the real missing mathematics is a global or order-sensitive consumer of the two resulting branches. ([GitHub][2])

---

## 1. Normalize the theorem into explicit geometric data

Use the following local notation throughout the proof:

```lean
let p  := S.oppApex1
let x  := O.kept
let y  := O.deleted
let bx := H.centerAt x O.kept_mem_A
let by := H.centerAt y O.deleted_mem_A
let Kx :=
  (H.selectedAt x O.kept_mem_A).toCriticalFourShell
let Ky :=
  (H.selectedAt y O.deleted_mem_A).toCriticalFourShell
let C := SelectedClass D.A p radius
```

The inherited facts should be normalized immediately into named lemmas:

```lean
have hxy : x ≠ y := O.sources_ne

have hxC : x ∈ C := O.kept_mem_radius
have hyC : y ∈ C := O.deleted_mem_radius

have hxI :
    x ∈ S.capInteriorByIndex S.oppIndex1 :=
  O.kept_mem_capInterior

have hyI :
    y ∈ S.capInteriorByIndex S.oppIndex1 :=
  O.deleted_mem_capInterior

have hy_not_Kx : y ∉ Kx.support := by
  exact
    (cross_deletion_survives_iff_not_mem_selected_support
      H O.kept_mem_A).mp O.packet.survives₂

have hx_not_Ky : x ∉ Ky.support := reverse_omission

have hbx_ne_by : bx ≠ by := by
  simpa [bx, by] using O.packet.actual_blocker_ne_center₂
```

For constructing the walk, `reversePacket` already implies `hx_not_Ky`; the explicit `reverse_omission` hypothesis is therefore best retained as a coherence assertion rather than treated as a separate source of case distinctions. The walk API exposes exactly these two omission facts and the blocker inequality. ([GitHub][3])

Also normalize the all-large context:

```lean
have hpRich :
    ApexRichClassStructure D.A p := by
  simpa [p] using G.apex_rich S.oppIndex1
```

The useful content of `G` is:

* all three closed caps have cardinality at least six;
* every Moser apex has either a six-point class or two distinct K4 radii;
* every canonical blocker center lies in one of the three strict cap interiors;
* a blocker localized in one cap meets every individual rich slice in another cap in at most one point.

Those last two statements are already proved in the target file and are substantially stronger than the original seven-label E9 shadow. ([GitHub][1])

---

# 2. Promote the exact source-return split

Add:

```lean
import Erdos9796Proof.P97.ATail.RetainedMatchingSourceReturnRadiusSplit

open ATailRetainedMatchingSourceReturnRadiusSplit
```

The imported module depends only on the lower `RetainedMatchingCommonDeletionCycle` module, so it is structurally suitable to become an on-spine dependency. Its current `COMPAT-ONLY/BANK` status merely means no publish-spine consumer imports it yet. ([GitHub][2])

Define the walk, preferably as a reusable theorem or private definition:

```lean
private noncomputable def pairedCommonDeletion_sourceReturnWalk
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : FrontierCommonDeletionParentResidual F)
    {P : RetainedInteriorDirectedOmission R}
    (O : OrientedRetainedCommonDeletion P)
    (reversePacket :
      CommonDeletionTwoCenterPacket
        D H O.kept S.oppApex1
          (H.centerAt O.deleted O.deleted_mem_A)) :
    RetainedMatchingTwoStepCommonDeletionWalk R :=
{
  first := O.kept
  second := O.deleted
  next := O.kept

  first_mem_A := O.kept_mem_A
  second_mem_A := O.deleted_mem_A
  next_mem_A := O.kept_mem_A

  first_ne_second := O.sources_ne
  second_ne_next := O.sources_ne.symm

  first_mem_radius := O.kept_mem_radius
  second_mem_radius := O.deleted_mem_radius

  first_mem_capInterior := O.kept_mem_capInterior
  second_mem_capInterior := O.deleted_mem_capInterior

  firstPacket := O.packet
  secondPacket := reversePacket

  nextLocation := .sourceReturn rfl
}
```

This is the same construction already used by the generic large-cap outcome adapter. ([GitHub][3])

Then the top of the eventual proof becomes:

```lean
  let W :=
    pairedCommonDeletion_sourceReturnWalk R O reversePacket

  rcases nonempty_sourceReturnRadiusOutcome W rfl with ⟨outcome⟩

  cases outcome with
  | jointDeletion J =>
      ...
  | exactFourPartition E =>
      ...
```

The split is exact:

### `jointDeletion J`

There is a point (q\in C), distinct from (x,y), lying outside both (K_x) and (K_y). Deleting (q) preserves K4 at

[
p,\quad b_x,\quad b_y.
]

The bank also constructs the corresponding U5 surface: the dangerous first-apex triple, the two (q)-deleted blocker rows, and (q)'s actual critical row. ([GitHub][2])

### `exactFourPartition E`

The retained class has exactly four points, and

[
K_x\cap C={x,a},\qquad
K_y\cap C={y,b},
]

where the two pairs are disjoint and cover (C). This exact complementary (2\times2) partition is already packaged with named partners and all required inequalities. ([GitHub][2])

This should be the first production landing. It replaces the opaque paired leaf by a mathematically canonical two-case dispatcher, but it should **not** be committed as two new `sorry` leaves. Develop the consumers in scratch or as private lemmas and wire them only once at least one branch is source-clean.

---

# 3. Build the missing global producer: a twelve-point rich witness frame

The original Package‑E abstraction was satisfiable because it tracked only seven named points; it explicitly omitted the nondegenerate E9 low-hit family, the rich-class witnesses, the full survival conjuncts, and carrier-wide minimality. ([GitHub][4])

The appropriate source-level replacement is a finite but **cardinality-free** rich witness frame.

For each cap index (i), apply

```lean
oppositeCapRichClassInteriorPattern_of_apexRichClassStructure
```

to `G.apex_rich i`. This gives one of:

```text
S6:   four points in one strict-cap radius slice;
D44:  two points in each of two distinct strict-cap radius slices.
```

The theorem deliberately preserves the radius tags because collapsing the two alternatives to a bare cardinality statement loses the metric information needed downstream. ([GitHub][5])

Choose exactly four witnesses (T_i) per cap:

* in the S6 arm, choose four from the single slice;
* in the D44 arm, choose two from each of the two slices and take their union.

Distinct radii at the same center give disjoint selected classes, and distinct strict cap interiors are disjoint. Therefore

[
T=T_0\cup T_1\cup T_2
]

has exactly twelve points.

Now

[
|K_x\cup K_y|\le 8,
]

so

[
\left|T\setminus(K_x\cup K_y)\right|\ge4.
]

This is a particularly useful theorem to formalize:

```lean
structure PairedTriApexRichEscapeFrame
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    (x y : ℝ²)
    (hx : x ∈ D.A) (hy : y ∈ D.A) where

  witnesses : Finset ℝ²
  witnesses_card : witnesses.card = 4
  witnesses_subset_A : witnesses ⊆ D.A

  outside_firstShell :
    witnesses ∩
      (H.selectedAt x hx).toCriticalFourShell.support = ∅

  outside_secondShell :
    witnesses ∩
      (H.selectedAt y hy).toCriticalFourShell.support = ∅

  rich_tag :
    ∀ q ∈ witnesses,
      ∃ i : Fin 3, ∃ r : ℝ,
        0 < r ∧
        q ∈ SelectedClass D.A
          (S.oppositeVertexByIndex i) r ∩
            S.capInteriorByIndex i
```

Add derived fields or lemmas, rather than storing redundant proof terms:

```lean
theorem PairedTriApexRichEscapeFrame.survives_firstBlocker ...
theorem PairedTriApexRichEscapeFrame.survives_secondBlocker ...
theorem PairedTriApexRichEscapeFrame.survives_apex ...
theorem PairedTriApexRichEscapeFrame.actualBlocker_ne_fixedCenters ...
theorem PairedTriApexRichEscapeFrame.actualBlocker_capLocation ...
```

For every (q) in the frame:

* (q\notin K_x,K_y), so deleting (q) preserves K4 at (b_x,b_y);
* all three Moser apices are fully deletion robust, so deletion preserves K4 at all three apices;
* (q)'s actual blocker is therefore distinct from all five fixed centers;
* that actual blocker lies in one strict cap and obeys the cross-cap one-hit rule.

This is precisely the kind of unlabeled survival/global information missing from the SAT abstraction. It should be preserved as a four-source packet, not collapsed immediately to one arbitrarily chosen witness.

---

# 4. Extract a generic two-shell selected-row escape theorem

There is already an endpoint-specific theorem saying that the union of two four-point shells has cardinality at most eight, while the all-large carrier has at least fifteen points, so minimality forces a selected row centered in that seed to escape the seed. The source also has a refinement distinguishing a fully robust center from an actual critical obstruction. ([GitHub][1])

Its proof should be extracted to a residual-independent theorem:

```lean
theorem exists_selectedRow_escape_twoCriticalShellSeed
    {D : CounterexampleData}
    {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    (G : TriApexAllLargeContext D S)
    {x y : ℝ²}
    (hx : x ∈ D.A) (hy : y ∈ D.A) :
    ∃ center : ℝ²,
      center ∈
        (H.selectedAt x hx).toCriticalFourShell.support ∪
        (H.selectedAt y hy).toCriticalFourShell.support ∧
      ∃ K : SelectedFourClass D.A center,
        ∃ z ∈ K.support,
          z ∉
            (H.selectedAt x hx).toCriticalFourShell.support ∪
            (H.selectedAt y hy).toCriticalFourShell.support
```

The stronger version should retain the quantifier order used in the current universal selected-row work:

```lean
∃ center ∈ seed,
  ∀ K : SelectedFourClass D.A center,
    ∃ z ∈ K.support, z ∉ seed ∧ ...
```

or, for finite enumeration,

```lean
∀ prescribed simultaneous selected-row choices on seed,
  ∃ center ∈ seed, the prescribed row at center escapes seed.
```

This polarity is load-bearing. A theorem that merely chooses a convenient row existentially is too weak for a sound finite obstruction, because a physical six-point radius can contain several selected four-subsets. The current project audit explicitly warns against treating a selected support as the entire physical class. ([GitHub][6])

This generic escape theorem and the four rich witnesses should be the two principal global inputs to both source-return branches.

---

# 5. High-leverage arithmetic gate

Before developing a new metric terminal, attempt one narrowly scoped adapter to `RichApexCoverCount.lean`.

That file already contains an `omega` contradiction whose documentation says the only missing step is an adapter producing eight decomposition equalities and cut inequalities. ([GitHub][7])

The feasibility target should be:

```lean
theorem pairedCommonDeletion_richApexCountData
    (R ...)
    (O ...)
    (reversePacket ...)
    (G ...) :
    ∃ x y p q u v s w z t m n : Nat,
      x + y + p + q = 2 ∧
      u + v + s = 2 ∧
      w + z + t = 2 ∧
      q + s ≤ 1 + m ∧
      p + t ≤ 1 + n ∧
      x + u + m ≤ 1 ∧
      y + w + n ≤ 1 ∧
      v + z ≤ 1
```

Then closure is simply:

```lean
rcases pairedCommonDeletion_richApexCountData ... with
  ⟨x, y, p, q, u, v, s, w, z, t, m, n,
    hx, hu, hw, hm, hn, h01, h02, h12⟩

exact richApexCountContradiction
  x y p q u v s w z t m n
  hx hu hw hm hn h01 h02 h12
```

This should be treated as a **feasibility gate**, not as the assumed solution:

* attempt to source all eight inequalities from the two-shell partition, rich slices, and cross-cap one-hit lemmas;
* if one or two inequalities fail, record exactly which geometric relation is missing;
* do not add an unjustified count clause or restart broad SAT.

If this adapter works, it is by far the shortest closure. If it fails, the failed cut will identify the exact order-sensitive producer needed by the metric route.

---

# 6. Joint-deletion branch

For

```lean
| jointDeletion J =>
```

retain both the radius outcome and its U5 ingress:

```lean
rcases J.nonempty_u5Ingress with ⟨U⟩
```

The existing ingress gives:

* a dangerous triple at (p) on the retained radius;
* a (q)-deleted K4 row at (b_x);
* a (q)-deleted K4 row at (b_y);
* the actual (q)-critical row at (b_q).

This is valuable data, but it is not itself a contradiction. The project’s analogous deletion-survival routes fail exactly when one assumes that several surviving rows are confined to a small support without a theorem proving that confinement. ([GitHub][2])

The next structure should therefore preserve all row provenance:

```lean
structure PairedJointDeletionMetricFrame
    (J : RetainedSourceReturnJointDeletion W) where

  u5 : RetainedSourceReturnJointU5Ingress J

  actualBlockerCap : Fin 3
  actualBlocker_mem_cap :
    H.centerAt J.source (...) ∈
      S.capInteriorByIndex actualBlockerCap

  richEscape :
    PairedTriApexRichEscapeFrame G W.first W.second
      W.first_mem_A W.second_mem_A

  seedEscape :
    SelectedRowEscapeTwoCriticalShellSeed G
      W.first W.second
```

The desired producer is not “some extra row”; it should return one of two **consumable** signatures:

```lean
inductive PairedJointDeletionClosingIngress
  | existingU5Terminal
      (data : <exact positive-incidence ingress of an existing U5 kernel>)
  | nonalternatingSharedPair
      (data : PairedNonalternatingSharedPair)
  | capLocalOutsideOverlap
      (data : PairedOutsideOverlapContradiction)
```

The useful nonalternating packet should name:

```text
center c,
selected row K at c,
two distinct points u,v shared with one of the fixed rows,
the two equal-radius relations,
and equality of the two `btw p c` truth values.
```

Two distinct centers may share two points only in the alternating boundary order. Thus merely proving a two-point overlap is not enough; the source producer must also prove nonalternation, or prove that both shared points lie outside a cap where the existing outside-overlap bound applies. This is exactly the lesson from the current v35 audit. ([GitHub][6])

A good implementation order for this branch is:

1. Materialize the U5 ingress.
2. Localize (b_q) to one cap.
3. Case on whether (b_q) is in the source cap or an adjacent cap.
4. Apply the generic prescribed-row escape theorem to (K_x\cup K_y).
5. Show that an escaping row either:

   * has a nonalternating pair with one fixed shell;
   * has two points in a forbidden outside-cap region;
   * or generates a strict `btw` relation.
6. In the last case, iterate over the finitely many seed centers and derive a `btw` cycle.

The finite computation, if needed, should enumerate only these bounded cyclic-order relations after the source theorem has produced them. It should not re-enumerate the old seven-label incidence abstraction.

---

# 7. Exact-four branch: use richness to force a second radius

This branch has a much sharper source-level continuation than the current plan records.

Assume:

```lean
| exactFourPartition E =>
```

so

```lean
E.class_card_eq_four :
  C.card = 4
```

and (K_x,K_y) partition (C) into two disjoint pairs.

Because (p) is rich, there must be another radius (\rho\ne\texttt{radius}) with at least four carrier points:

```lean
theorem exists_otherRichClass_of_exactFour_and_apexRich
    (hC4 : C.card = 4)
    (hrich : ApexRichClassStructure D.A p) :
    ∃ ρ : ℝ,
      0 < ρ ∧
      ρ ≠ radius ∧
      4 ≤ (SelectedClass D.A p ρ).card
```

The proof is immediate from the two richness arms:

* in the six-point arm, its radius cannot be `radius`, because (C) has cardinality four;
* in the two-radius arm, at least one of the two distinct radii differs from `radius`.

Let

[
C'=\operatorname{SelectedClass}(A,p,\rho).
]

Since (p) is fully deletion robust and (b_x,b_y\ne p), each critical shell meets (C') in at most two points. This bound is already banked for every radius class at a rich apex. ([GitHub][5])

Now split:

```lean
by_cases hcover :
  C' ⊆ Kx.support ∪ Ky.support
```

## 7.1. There is a point outside both shells

If `¬ hcover`, choose

[
z\in C'\setminus(K_x\cup K_y).
]

Because (\rho\ne\texttt{radius}), (z\notin C). Therefore deletion of (z) preserves K4 at:

* (p), using the intact exact-four class (C);
* (b_x), using (K_x);
* (b_y), using (K_y).

Package this as a radius-independent three-center deletion surface:

```lean
structure PairedOffRadiusJointDeletion where
  source : ℝ²
  source_mem_otherRadius : source ∈ C'
  source_not_mem_originalRadius : source ∉ C

  source_not_mem_firstShell : source ∉ Kx.support
  source_not_mem_secondShell : source ∉ Ky.support

  physicalRow :
    U5QDeletedK4Class D source p C

  firstBlockerRow :
    U5QDeletedK4Class D source bx Kx.support

  secondBlockerRow :
    U5QDeletedK4Class D source by Ky.support
```

This is not literally `RetainedSourceReturnJointDeletion`, because the source is not on the original retained radius, but it has the same three-center deletion-survival core and stronger intact-class provenance.

The joint and off-radius joint cases can then feed a common five-center global consumer.

## 7.2. The other class is covered by the two shells

If

[
C'\subseteq K_x\cup K_y,
]

then

[
|C'|
\le |K_x\cap C'|+|K_y\cap C'|
\le 2+2=4.
]

Since (|C'|\ge4), all inequalities are equalities. Consequently:

[
|C'|=4,
]

[
|K_x\cap C'|=|K_y\cap C'|=2,
]

and the two intersections are disjoint and cover (C').

This produces a second exact (2\times2) partition:

```lean
structure PairedSourceReturnTwoRadiusGrid
    (E : RetainedSourceReturnExactFourPartition W) where

  otherRadius : ℝ
  otherRadius_pos : 0 < otherRadius
  radius_ne : otherRadius ≠ radius

  otherClass_card_eq_four :
    (SelectedClass D.A S.oppApex1 otherRadius).card = 4

  firstOtherHits_card_eq_two : ...
  secondOtherHits_card_eq_two : ...
  otherHits_disjoint : ...
  otherHits_union_eq_class : ...
```

This is the most important new reduction in the plan:

> The exact-four branch either renews to a point whose deletion survives at the three fixed centers, or it produces two concentric exact-four (p)-classes, each partitioned into complementary pairs by the same two critical shells.

Unlike an exact-15 classifier, this reduction is valid for every carrier cardinality.

---

# 8. The actual hard terminal: a two-radius/two-shell grid plus global escape

The local grid alone should not be assumed contradictory. Several nearby local circle/order configurations have exact rational convex realizations; the project’s audit has repeatedly shown that named local metric data can be realizable even though the full global hypotheses are not. ([GitHub][6])

The terminal should therefore retain:

1. the two exact (p)-centered radius classes (C,C');
2. their complementary pair partitions by (K_x,K_y);
3. cap-interior membership of every named point;
4. cap locations of (b_x,b_y);
5. the global prescribed-row escape from (K_x\cup K_y);
6. at least one rich witness or deletion-survival point outside both shells.

Call this:

```lean
structure PairedSourceReturnSaturatedGridEscape where
  grid : PairedSourceReturnTwoRadiusGrid E
  richEscape : PairedTriApexRichEscapeFrame ...
  selectedRowEscape : ...
```

The metric proof should use the same architecture already successful in `reverseHit_twoCenter_sqdist_acute`:

1. prove a cyclic-order or `btw` statement from cap geometry;
2. convert it to a signed-area product sign;
3. combine the sign with the two equal-distance relations;
4. obtain a strict squared-distance inequality;
5. assemble two or more such inequalities into a cycle and close with `nlinarith`.

The existing reverse-hit theorem is an exact model: it first produces the order placement, then derives two strict squared-distance inequalities from the equal-radius relations. ([GitHub][1])

For the grid, the underlying geometric fact is particularly structured. For a fixed blocker (b_x):

* (K_x\cap C) lies on the radical axis of the (p)-circle (C) and the (b_x)-circle (K_x);
* (K_x\cap C') lies on a parallel radical axis, because both axes are perpendicular to the line (pb_x);
* the same holds for (b_y).

Thus the two complementary pairings induce two parallel-chord systems across the two (p)-radii. The cap order determines which pairings alternate. The hard “one-inside/one-outside” arm is precisely the case in which the required nonalternation is not visible from incidence alone.

The main new theorem should have a narrow geometric statement, for example:

```lean
theorem false_of_pairedTwoRadiusGrid_with_globalEscape
    (grid : PairedSourceReturnTwoRadiusGrid E)
    (escape : PairedGridSelectedRowEscape grid)
    (capData : PairedGridCapPlacement grid) :
    False
```

Internally, aim for lemmas such as:

```lean
exists_pairedGrid_cgnOrder_of_splitInteriorPartners

pairedGrid_firstShell_sqdist_inequality

pairedGrid_secondShell_sqdist_inequality

false_of_pairedGrid_sqdist_cycle
```

The final algebraic theorem should take only explicit distance equalities and strict inequalities. Keep all cap and selected-row reasoning out of that final kernel.

---

# 9. Role of exact cardinality fifteen

Exact-15 remains useful as a regression and theorem-mining environment, but it must not be the logical bridge for this universal theorem.

The all-large context gives only the general floor (15\le |A|); an exact-15 certificate does not cover larger carriers without a separately proved bounded-obstruction or descent theorem. The repository’s current plan records this distinction explicitly. ([GitHub][6])

The existing theorem

```lean
endpointFresh_d44_deletedRows_of_card_eq_fifteen
```

is still an excellent template. It shows how, at exact 15 and cap size six, q-deleted first-apex rows are forced onto the two rich classes and how a selected four-support can be proved equal to a full physical exact-four class. ([GitHub][1])

For this paired branch, create an analogous regression lemma:

```lean
pairedSourceReturn_d44_deletedRows_of_card_eq_fifteen
```

It should verify that the abstract two-radius grid agrees with the exact-15 profile and with the existing computational labels. But production closure should use the cardinality-free “other rich radius → outside point or second exact partition” theorem above.

---

# 10. File and declaration-order plan

The target currently occurs before many useful global escape and exact-profile lemmas in `TriApexEndpointRetainedOmission.lean`. Its only shown use is the later coordinator. ([GitHub][1])

There are two viable layouts.

## Minimal-change layout

1. Add the source-return split import.
2. Remove the current theorem body at line 948.
3. Reinsert the theorem, unchanged in name and signature, immediately before `false_of_retainedOmission_triApexAllLarge_core`.
4. Put the new private producer lemmas between the context definitions and the relocated theorem.

This avoids a larger refactor and gives the theorem access to all earlier declarations.

## Cleaner modular layout

Extract these already-general declarations into:

```text
ATail/TriApexAllLargeContext.lean
```

* `FrontierAllLargeCapsTriApexRobustResidual`;
* `TriApexAllLargeContext`;
* its residual constructor;
* blocker cap localization;
* cross-cap one-hit;
* global K4/source-faithful cover;
* the generic two-shell escape theorem.

Then add:

```text
ATail/PairedCommonDeletionNormalization.lean
ATail/PairedCommonDeletionRichEscape.lean
ATail/PairedCommonDeletionTwoRadiusGrid.lean
ATail/PairedCommonDeletionMetricTerminal.lean
```

and let `TriApexEndpointRetainedOmission.lean` become the coordinator.

I would use the minimal-change layout until the terminal closes, then extract the stable producer layer. A premature context refactor adds build risk without reducing the mathematical uncertainty.

---

# 11. Recommended patch sequence

## Patch 1 — source-return promotion

Land, without any new `sorry`:

* import of `RetainedMatchingSourceReturnRadiusSplit`;
* `pairedCommonDeletion_sourceReturnWalk`;
* a theorem returning `RetainedSourceReturnRadiusOutcome`;
* checks that `reverse_omission` agrees with the second packet’s derived omission.

This is low-risk and should be almost mechanical.

## Patch 2 — rich witness and generic seed escape

Land:

* exact four-witness selection for every rich cap;
* twelve-point union and four-point outside-two-shell bound;
* deletion survival at the three apices and two blockers;
* actual-blocker separation and cap localization;
* generic two-shell selected-row escape.

These are counting, `Finset`, and existing deletion-robustness arguments. They directly restore the global information omitted by Package E.

## Patch 3 — exact-four renewal

Land:

```lean
exists_otherRichClass_of_exactFour_and_apexRich
```

and the exhaustive outcome:

```lean
inductive PairedExactFourRichRenewalOutcome
  | offRadiusJointDeletion ...
  | secondExactPartition ...
```

This should also be mostly source-level cardinality work.

## Patch 4 — arithmetic adapter gate

Attempt to derive the eight hypotheses of `richApexCountContradiction`.

* If successful, the leaf closes here.
* If unsuccessful, preserve the failed inequality as the formal specification of the missing metric producer.

Do not add assumptions to make the adapter succeed.

## Patch 5 — bounded order model

Encode only:

* the two exact radius classes;
* the two shell partitions;
* cap tags;
* blocker cap locations;
* prescribed selected rows at the at-most-eight seed centers;
* one escaping point per required row;
* `btw`/alternation relations.

This is a small bounded cyclic-order problem, independent of the total carrier cardinality.

For every surviving order:

* run exact rational or QF_NRA realization;
* retain exact witnesses for satisfiable local cases;
* mine a signed-area or squared-distance certificate for infeasible cases.

The current broad transitivity-only CEGAR lane has reached its useful limit; the repository’s own audit says the next refinement must be order-sensitive or come from another source-entitled global producer. ([GitHub][6])

## Patch 6 — metric terminal and wiring

Formalize the small metric kernel and reduce both radius outcomes to it. The final theorem should resemble:

```lean
theorem false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
    ...
    : False := by
  let W :=
    pairedCommonDeletion_sourceReturnWalk R O reversePacket

  rcases nonempty_sourceReturnRadiusOutcome W rfl with ⟨outcome⟩

  cases outcome with
  | jointDeletion J =>
      exact
        false_of_pairedSourceReturn_jointDeletion_triApexAllLarge
          R O W J G

  | exactFourPartition E =>
      rcases
          nonempty_pairedExactFourRichRenewalOutcome
            R O W E G with
        ⟨renewal⟩

      cases renewal with
      | offRadiusJointDeletion J =>
          exact
            false_of_pairedSourceReturn_offRadiusJointDeletion_triApexAllLarge
              R O W E J G

      | secondExactPartition grid =>
          exact
            false_of_pairedSourceReturn_saturatedGrid_triApexAllLarge
              R O W E grid G
```

The three branch consumers can remain private if they have no independent downstream use.

---

# 12. Approaches to avoid

Several routes are especially likely to waste effort here.

**Do not use `G.notRobustCover_card` as an upper bound.** It says

[
|A|\le4|\operatorname{notRobustCenters}(D)|,
]

so it forces many non-robust centers; it does not give `notRobustCenters.card ≤ 3`.

**Do not rerun the seven-point Package‑E abstraction.** That encoding explicitly has no nontrivial E9 instances and omits the survival/minimality geometry now needed. Its SAT result is expected and does not diagnose this paired branch further. ([GitHub][4])

**Do not identify selected four-supports with full physical radius classes.** That is valid only after an exact-cardinality/support-equality proof. In an S6 profile there can be several selected four-subsets of the same physical class.

**Do not promote packet omission to arbitrary full-shell nonmembership.** Use only the exact q-deleted row or canonical-shell equality supplied by the corresponding packet theorem.

**Do not call an existing U5 contradiction merely because U5 ingress exists.** The known consumers generally require an additional positive incidence, shared pair, or bounded-support confinement. The ingress itself only packages the rows.

**Do not reduce only to exact 15.** The target is uniform for every (15\le |A|).

**Do not recursively build another all-large frontier at the renewed radius.** That risks circularity unless accompanied by a strict well-founded measure. The other-rich-radius split should instead produce the bounded off-radius deletion or two-radius grid directly.

**Do not split this leaf into more public `sorry` declarations.** The source-return split is useful because its branches are structurally exact, but the repository already warns that further fan-out without closing a child is bookkeeping rather than progress. ([GitHub][6])

---

# 13. Closure gates

The leaf should count as closed only after all of the following pass:

```bash
cd lean
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean
```

Then audit:

```lean
#print axioms
  Problem97.ATailFrontierLiveClosure
    .false_of_retainedOmission_pairedCommonDeletion_triApexAllLarge_core
```

The result must not contain `sorryAx`.

Also run:

* the full serialized project build;
* refreshed `proof-blueprint` reference and publish-spine checks;
* a source search confirming no new `sorry` was introduced;
* exact-15 regression against the D44 row-assignment lemmas;
* explicit audits that every selected-support/full-class equality used in the proof has a source theorem;
* certificate replay and exact verifier checks for any computationally mined metric kernel.

---

# Bottom line

The strongest concrete route is:

1. **Promote the already-proved source-return radius split.**
2. **Build the twelve-point rich witness/five-center survival frame.**
3. **In the exact-four branch, use apex richness to force another radius and prove the exhaustive “outside both shells or second exact (2\times2) partition” reduction.**
4. **Attempt the existing eight-inequality `omega` adapter.**
5. **If that does not close, solve only the resulting bounded two-radius/two-shell order problem, augmented by the generic selected-row escape.**

I am highly confident in steps 1–3 as source-level reductions. The genuine research bottleneck is the final producer proving a nonalternating shared pair, a forbidden cap-local overlap, or an equivalent strict distance/order cycle in the saturated grid. That is a much narrower and more faithful target than the current broad Package‑E incidence model.

[1]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean"
[2]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingSourceReturnRadiusSplit.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingSourceReturnRadiusSplit.lean"
[3]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingCommonDeletionCycle.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RetainedMatchingCommonDeletionCycle.lean"
[4]: https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/census/frontier-packages/E-ENCODING-SPEC.md "https://github.com/mysticflounder/erdos-97-96-formalization/blob/main/census/frontier-packages/E-ENCODING-SPEC.md"
[5]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/ApexRichClassStructure.lean"
[6]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/computational-closure-plan-2026-07-28.md "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/docs/computational-closure-plan-2026-07-28.md"
[7]: https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RichApexCoverCount.lean "https://raw.githubusercontent.com/mysticflounder/erdos-97-96-formalization/main/lean/Erdos9796Proof/P97/ATail/RichApexCoverCount.lean"

