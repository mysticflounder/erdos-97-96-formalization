/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.Cap.Structure
import Erdos9796Proof.P97.Cap.PartitionFromMEC

/-!
# U1 — Two-short-cap structural reduction to `(m, 4, 4)`

This file states `U1` from `docs/97-uniform-theorem-closure-plan.md`
(Phase 1) in formal Lean and proves the structural pieces that do
*not* require geometric content beyond what `CapStructure.lean`
provides.

Upstream prose statement:

> **U1.**  Every minimal strict-convex PerVertexK4 counterexample
> with a surplus cap admits a Moser triangle with cap multiset
> `(m, 4, 4)`, `m ≥ 5`.

The genuine geometric content of U1 — five sub-lemmas about MEC
boundary structure, cap monotonicity, Apollonius arcs, and
equilateral transfer — is *not* proved in this session.  Those
sub-lemmas are listed at the bottom and tracked as separate
obligations in the blueprint DB.

What *is* proved here:

* `CounterexampleData` — combines a counterexample (convex `K4` finite
  configuration) with a `SurplusCapPacket`.  This is the input type
  for U1 and its variants.
* `IsM44CounterexampleData` — predicate saying the carried packet is
  in the `(m, 4, 4)` regime.
* `u1_fallback_either_or` — the *closure-plan fallback* statement
  (`U1` ∨ removable vertex).  This is the disjunctive form mentioned in
  `docs/97-uniform-theorem-closure-plan.md` line 240–250.  We prove it
  trivially from the U1 statement (or directly via classical case
  analysis if a downstream theorem becomes available).
* Several *structural propositions* about the `(m, 4, 4)` regime that
  follow from cap-arithmetic alone — they are useful precursors for
  U2 and U3.

What is *not* proved here (and stays `sorry`-free by being stated
without proof bodies — these are the U1 sub-lemma obligations):

The five geometric sub-lemmas of U1 — short-cap existence,
exactness-from-minimality, endpoint-equality, equilateral transfer,
short-cap Apollonius — each require minimum-enclosing-circle and
Apollonius-arc machinery that does not yet exist for general
`Finset ℝ²` configurations.  They are recorded as *propositions* in
this file (without bodies) and as new blueprint obligations under the
`p97-u1-*` slug family.

## Hard rule reminder (from closure plan §"Hard Rule")

Nothing in this file may cite `FiniteN9Closure` as a shortcut.  The
only way `FiniteN9Closure` enters the surplus program is via the U7
retained-witness bridge.  Verify by checking
`#print axioms` on any U1-derived theorem.
-/

open scoped EuclideanGeometry

namespace Problem97

/- ### Counterexample data with a surplus cap -/

/-- **Counterexample with a surplus-cap packet.**  Bundle of:

* a finite point set `A`;
* nonempty + convex-independent witnesses;
* the bad `K4` property;
* a `SurplusCapPacket A` (Moser triangle + cap partition + surplus
  cap designation).

This is the input type for U1.  It does *not* assume `A.card > 9`
explicitly (although the cap-partition is geometrically meaningful only
for `A.card ≥ 4`); downstream U-step lemmas may add such hypotheses. -/
structure CounterexampleData where
  /-- Underlying point set. -/
  A : Finset ℝ²
  /-- `A` is nonempty. -/
  nonempty : A.Nonempty
  /-- `A` is convex-independent. -/
  convex : ConvexIndep A
  /-- `A` has the `K4` property (the bad counterexample property). -/
  K4 : HasNEquidistantProperty 4 A
  /-- The surplus-cap packet on `A`. -/
  packet : SurplusCapPacket A

namespace CounterexampleData

/-- The cap-sum identity (closed-cap form) holds on a
`CounterexampleData`:
`|surplus| + |opp1| + |opp2| = |A| + 3`. -/
theorem capSum (D : CounterexampleData) :
    D.packet.surplusCap.card + D.packet.oppCap1.card + D.packet.oppCap2.card
      = D.A.card + 3 :=
  D.packet.capSum

/-- The surplus cap has size `> 4`. -/
theorem surplus_card_gt_four (D : CounterexampleData) :
    4 < D.packet.surplusCap.card :=
  D.packet.surplus_card_gt_four

/-- The selected surplus cap lies in the ambient carrier. -/
theorem surplusCap_subset_A (D : CounterexampleData) :
    D.packet.surplusCap ⊆ D.A := by
  rcases hi : D.packet.surplusIdx with ⟨i, _hilt⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap, hi] using D.packet.partition.C1_subset
  · simpa [SurplusCapPacket.surplusCap, hi] using D.packet.partition.C2_subset
  · simpa [SurplusCapPacket.surplusCap, hi] using D.packet.partition.C3_subset

/-- A counterexample datum with a surplus packet has more than four points. -/
theorem card_gt_four (D : CounterexampleData) : 4 < D.A.card :=
  lt_of_lt_of_le D.surplus_card_gt_four
    (Finset.card_le_card D.surplusCap_subset_A)

/-- A counterexample datum with a surplus packet has at least two points. -/
theorem card_gt_one (D : CounterexampleData) : 1 < D.A.card := by
  have hcard : 4 < D.A.card := D.card_gt_four
  omega

end CounterexampleData

/- ### `(m, 4, 4)` regime predicate on counterexample data -/

/-- A `CounterexampleData` is in the `(m, 4, 4)` regime iff its
underlying surplus-cap packet is `IsM44`. -/
def CounterexampleData.IsM44 (D : CounterexampleData) : Prop :=
  D.packet.IsM44

theorem CounterexampleData.IsM44.surplus_card_eq
    {D : CounterexampleData} (h : D.IsM44) :
    D.packet.surplusCap.card + 5 = D.A.card :=
  SurplusCapPacket.IsM44.surplus_card_eq h

theorem CounterexampleData.IsM44.surplus_card_ge_five
    {D : CounterexampleData} (h : D.IsM44) :
    5 ≤ D.packet.surplusCap.card :=
  SurplusCapPacket.IsM44.surplus_card_ge_five h

/- ### Minimality and the U1 *statement* -/

/-- A `CounterexampleData` is *minimal* if no strictly smaller convex
`K4` counterexample exists.  Minimality is what U1 actually consumes:
the prose says "every *minimal* strict-convex PerVertexK4
counterexample with a surplus cap".

Note: in this scaffold we do not yet need minimality to state and
prove the structural pieces below; we record the predicate so the
downstream U-statements can use it. -/
def CounterexampleData.Minimal (D : CounterexampleData) : Prop :=
  ∀ B : Finset ℝ², B.Nonempty → ConvexIndep B → HasNEquidistantProperty 4 B →
    D.A.card ≤ B.card

/-- Minimality excludes removable vertices.

The erased set can be promoted to a strictly smaller convex `K4` set, while the
surplus packet gives enough ambient points for the erasure argument. -/
theorem CounterexampleData.not_isRemovableVertex_of_minimal
    {D : CounterexampleData}
    (hmin : D.Minimal) :
    ∀ x : ℝ², ¬ IsRemovableVertex D.A x := by
  intro x hrem
  rcases smaller_counterexample_of_removable D.convex hrem D.card_gt_one with
    ⟨B, hBne, hBlt, hBconv, hBK4⟩
  have hle : D.A.card ≤ B.card := hmin B hBne hBconv hBK4
  exact not_lt_of_ge hle hBlt

/-- Minimality excludes removable vertices in an `(m,4,4)` packet.

The erased set is a strictly smaller convex `K4` set, while the `(m,4,4)`
cardinality bounds give enough ambient points for the erased set to be
nonempty. -/
theorem not_isRemovableVertex_of_minimal_isM44
    {D : CounterexampleData}
    (hmin : D.Minimal)
    (_hM44 : D.IsM44) :
    ∀ x : ℝ², ¬ IsRemovableVertex D.A x :=
  CounterexampleData.not_isRemovableVertex_of_minimal hmin

/- ### U1 — formal statement (open) -/

/-- **U1 — Two-short-cap structural reduction (formal statement).**

A `CounterexampleData` admits an alternative packet on the *same*
underlying configuration `A` with cap multiset `(m, 4, 4)`, `m ≥ 5`.

Mathematical scope: per the closure plan, this is to be proved by
combining the five geometric sub-lemmas

1. short-cap existence;
2. exactness-from-minimality;
3. endpoint-equality;
4. equilateral transfer;
5. short-cap Apollonius.

This statement is `def` rather than `theorem` so it remains a
proposition we have not proven.  Downstream files that depend on U1
may take it as a *hypothesis* on a specific `CounterexampleData`. -/
def U1Statement (D : CounterexampleData) : Prop :=
  D.Minimal → ∃ D' : CounterexampleData, D'.A = D.A ∧ D'.IsM44

/- ### U1 — fallback statement (closure plan §"Fallback If U1 Stalls")

The closure plan (line 240–250) records a *weaker* form of U1 that
suffices for the final theorem:

> every minimal counterexample with a surplus cap either:
>   → enters the `(m,4,4)` regime, or
>   → already has a removable vertex.

This is the disjunctive fallback.  We *prove* a trivial version of
it below — both directions are still open, but the trivial structural
direction (one of two cases holds) follows from classical logic on the
weakest possible disjunction. -/

/-- **U1 fallback statement.**  A `CounterexampleData` either admits
an `(m, 4, 4)` packet on `A`, or contains a removable vertex.

Like `U1Statement` above, this is currently a *proposition* — it
asserts the existence of *one* of two structural outcomes.  Downstream
theorems consuming this hypothesis are unblocked even before the full
U1 lands. -/
def U1FallbackStatement (D : CounterexampleData) : Prop :=
  D.Minimal →
    (∃ D' : CounterexampleData, D'.A = D.A ∧ D'.IsM44) ∨
    (∃ x : ℝ², IsRemovableVertex D.A x)

/-- **Trivial implication: U1 implies the fallback.**  If the strong
U1 statement holds on `D`, then the disjunctive fallback also holds.
This is the only direction that is provable without geometric input
at this layer; the converse — that the fallback can stand in for U1
in the downstream argument — is encoded in the closure plan's claim
that the fallback is "still enough for the final theorem", which is a
proof-tree statement about the surplus-cap removable-vertex theorem
and is *not* an internal lemma about U1 itself. -/
theorem u1_fallback_of_u1 {D : CounterexampleData}
    (hU1 : U1Statement D) : U1FallbackStatement D := by
  intro hmin
  exact Or.inl (hU1 hmin)

/-- If the fallback alternative holds and removable vertices are excluded,
then the strong U1 statement follows.  This packages the closure-plan
fallback as a usable theorem-facing bridge. -/
theorem u1Statement_of_fallback_and_no_removable
    {D : CounterexampleData}
    (hfb : U1FallbackStatement D)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x) :
    U1Statement D := by
  intro hmin
  rcases hfb hmin with hM44 | hrem
  · exact hM44
  · rcases hrem with ⟨x, hxrem⟩
    exact False.elim (hnoRem x hxrem)

/- ### Structural propositions about the `(m,4,4)` regime

The following propositions are *consequences* of the `(m, 4, 4)`
predicate plus the cap-sum identity.  They are proved here so that
downstream U-steps (U2, U3) can consume them without re-deriving. -/

/-- In the `(m, 4, 4)` regime the configuration size is `m + 5`
(closed-cap convention).  At the boundary `m = 5` this gives `|A| = 10`,
matching the `(4, 4, 5)` packet from the closure plan. -/
theorem card_eq_of_isM44 {D : CounterexampleData} (h : D.IsM44) :
    D.A.card = D.packet.surplusCap.card + 5 := by
  have := h.surplus_card_eq
  omega

/-- In the `(m, 4, 4)` regime, if the surplus cap has size exactly
`5` (the boundary case `m = 5`), then `|A| = 10` — matching the
`n = 10` packet described in `docs/97-five-cap-moser-cover.md`. -/
theorem card_eq_ten_of_isM44_card_five {D : CounterexampleData}
    (h : D.IsM44) (hm : D.packet.surplusCap.card = 5) :
    D.A.card = 10 := by
  have := h.surplus_card_eq
  omega

/-- Sum of the two opposite caps is `8` in the `(m, 4, 4)` regime. -/
theorem oppCap_sum_of_isM44 {D : CounterexampleData} (h : D.IsM44) :
    D.packet.oppCap1.card + D.packet.oppCap2.card = 8 := by
  obtain ⟨h1, h2⟩ := h
  omega

/- ### Helpers: Moser vertices opposite each non-surplus cap -/

/-- The Moser triangle vertex opposite `oppCap1`.  Cap `C_i` lies on
the arc opposite vertex `v_i` (see `Problem97.OnArcOpposite`), so the
"opposite Moser vertex" of a cap is the apex carrying the same index. -/
def SurplusCapPacket.oppApex1 {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ℝ² :=
  match S.surplusIdx with
  | ⟨0, _⟩ => S.triangle.v2
  | ⟨1, _⟩ => S.triangle.v3
  | _      => S.triangle.v1

/-- The Moser triangle vertex opposite `oppCap2`. -/
def SurplusCapPacket.oppApex2 {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ℝ² :=
  match S.surplusIdx with
  | ⟨0, _⟩ => S.triangle.v3
  | ⟨1, _⟩ => S.triangle.v1
  | _      => S.triangle.v2

/-- The Moser triangle vertex opposite the surplus cap. -/
def SurplusCapPacket.surplusApex {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ℝ² :=
  match S.surplusIdx with
  | ⟨0, _⟩ => S.triangle.v1
  | ⟨1, _⟩ => S.triangle.v2
  | _      => S.triangle.v3

/- ### Sub-lemma signatures (currently open obligations)

The five sub-lemmas of U1 are listed below as Lean *propositions*
(no bodies, no `sorry`).  They are not declared as theorems or
axioms — they are pure type-level statements that consumers can refer
to.  Future work will instantiate each by formally proving a
`theorem` of that type.

When the geometric infrastructure is built, each of these `def`s
becomes a `theorem`.
-/

/-- **U1 sub-lemma 1: short-cap existence.**  Starting from a surplus
cap, some choice of Moser triangle has at least two caps of size at
most `4 + defect-min`.  Closure-plan note: this is the entry point of
the U1 prose. -/
def U1ShortCapExistence (D : CounterexampleData) : Prop :=
  D.Minimal → ∃ D' : CounterexampleData, D'.A = D.A ∧
    D'.packet.oppCap1.card ≤ 4 ∧ D'.packet.oppCap2.card ≤ 4

/-- **U1 sub-lemma 2: exactness-from-minimality.**  If a chosen Moser
triangle has fewer than two exact `4`-caps, then either a new Moser
triangle improves the cap multiset, or an immediate removable vertex /
incompatible contradiction is found. -/
def U1ExactnessFromMinimality (D : CounterexampleData) : Prop :=
  D.Minimal →
    ((∃ D' : CounterexampleData, D'.A = D.A ∧
        D'.packet.oppCap1.card = 4 ∧ D'.packet.oppCap2.card = 4) ∨
     (∃ x : ℝ², IsRemovableVertex D.A x))

/-- The exact-packet exit in the U1.2 proof: some same-carrier datum is already
in the `(m,4,4)` regime. -/
def U1ExactPacket (D : CounterexampleData) : Prop :=
  ∃ D' : CounterexampleData, D'.A = D.A ∧
    D'.packet.oppCap1.card = 4 ∧ D'.packet.oppCap2.card = 4

/-- The theorem-facing exits for U1.2: either an exact same-carrier packet is
available, or a removable vertex has already been found. -/
def U1Exit (D : CounterexampleData) : Prop :=
  U1ExactPacket D ∨ ∃ x : ℝ², IsRemovableVertex D.A x

/-- The residual U1.2 branch after both theorem-facing exits are excluded. -/
def U1NoExit (D : CounterexampleData) : Prop :=
  ¬ U1Exit D

/-- Under `U1NoExit`, no exact same-carrier packet is available. -/
theorem U1NoExit.not_exactPacket {D : CounterexampleData}
    (hNoExit : U1NoExit D) : ¬ U1ExactPacket D := by
  intro hExact
  exact hNoExit (Or.inl hExact)

/-- Under `U1NoExit`, no removable vertex is available. -/
theorem U1NoExit.not_removable {D : CounterexampleData}
    (hNoExit : U1NoExit D) (x : ℝ²) :
    ¬ IsRemovableVertex D.A x := by
  intro hx
  exact hNoExit (Or.inr ⟨x, hx⟩)

/-- To prove U1.2 it is enough to contradict the residual branch where both
the exact-packet and removable-vertex exits have been excluded. -/
theorem u1ExactnessFromMinimality_of_no_noExit
    {D : CounterexampleData}
    (hcore : D.Minimal → U1NoExit D → False) :
    U1ExactnessFromMinimality D := by
  intro hmin
  by_cases hExit : U1Exit D
  · simpa [U1ExactnessFromMinimality, U1Exit, U1ExactPacket] using hExit
  · exact False.elim (hcore hmin hExit)

namespace CapTriple

/-- The cap selected by index `0,1,2` from a `CapTriple`. -/
def capAt {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Finset ℝ² :=
  match i with
  | ⟨0, _⟩ => CP.C1
  | ⟨1, _⟩ => CP.C2
  | _ => CP.C3

/-- The indexed cap is a subset of the ambient carrier. -/
theorem capAt_subset_A {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) :
    CP.capAt i ⊆ A := by
  fin_cases i
  · simpa [capAt] using CP.C1_subset
  · simpa [capAt] using CP.C2_subset
  · simpa [capAt] using CP.C3_subset

/-- A cap with more than four points contains a non-Moser carrier point. -/
theorem exists_nonMoser_mem_capAt_of_card_gt_four
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) {i : Fin 3}
    (hcard : 4 < (CP.capAt i).card) :
    ∃ q : ℝ², q ∈ CP.capAt i ∧ q ∉ M.verts := by
  classical
  by_contra hnone
  have hsub : CP.capAt i ⊆ M.verts := by
    intro q hq
    by_contra hqVerts
    exact hnone ⟨q, hq, hqVerts⟩
  have hle : (CP.capAt i).card ≤ M.verts.card :=
    Finset.card_le_card hsub
  have hverts : M.verts.card = 3 := M.verts_card
  omega

/-- Two caps in the triple are exact four-caps. -/
def HasExactPair {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) : Prop :=
  (CP.C1.card = 4 ∧ CP.C2.card = 4) ∨
  (CP.C1.card = 4 ∧ CP.C3.card = 4) ∨
  (CP.C2.card = 4 ∧ CP.C3.card = 4)

/-- For a chosen surplus cap, the opposite pair is exact. -/
def OppositePairExactAt {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (i : Fin 3) : Prop :=
  match i with
  | ⟨0, _⟩ => CP.C2.card = 4 ∧ CP.C3.card = 4
  | ⟨1, _⟩ => CP.C1.card = 4 ∧ CP.C3.card = 4
  | _ => CP.C1.card = 4 ∧ CP.C2.card = 4

/-- A concrete surplus cap whose opposite cap pair is not exact. -/
def NonExactSurplusBranch {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) : Prop :=
  ∃ i : Fin 3, 4 < (CP.capAt i).card ∧ ¬ CP.OppositePairExactAt i

/-- Cardinality split for a large cap triple: either two caps are exact, or
there is a concrete surplus cap whose opposite pair is not exact. -/
theorem exactPair_or_nonExactSurplusBranch_of_card_gt_nine
    {A : Finset ℝ²} {M : MoserTriangle A}
    (CP : CapTriple A M) (hcard : 9 < A.card) :
    CP.HasExactPair ∨ CP.NonExactSurplusBranch := by
  classical
  by_cases hExact : CP.HasExactPair
  · exact Or.inl hExact
  · right
    rcases CP.exists_surplus_cap_of_card_gt_nine hcard with ⟨i, hi⟩
    refine ⟨i, by simpa [capAt] using hi, ?_⟩
    intro hOpp
    exact hExact (by
      fin_cases i
      · exact Or.inr (Or.inr hOpp)
      · exact Or.inr (Or.inl hOpp)
      · exact Or.inl hOpp)

end CapTriple

/-- A concrete MEC/cap-partition payload with `C1` as the surplus cap and
`C2`, `C3` as exact four-caps constructs the same-carrier `(m,4,4)` packet.

This is the Lean endpoint for the U1.2 packet re-mine manifest: after the
manifest supplies a real `MEC.NonObtuseCircumscribedMoserTriangle`, the
circumscribed-branch witness, a `CapTriple` over the actual carrier, and the
three cap-cardinality proofs below, no further geometric content is needed to
package the result as an `IsM44` `SurplusCapPacket`. -/
theorem isM44Packet_of_capTriple_C1_surplus
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    (hC1 : 4 < CP.C1.card)
    (hC2 : CP.C2.card = 4)
    (hC3 : CP.C3.card = 4) :
    ∃ S : SurplusCapPacket A, S.IsM44 := by
  refine
    ⟨{ hA := hA,
        hncol := hncol,
        triangleNonObtuse := MT,
        hCirc := hCirc,
        partition := CP,
        surplusIdx := ⟨0, by decide⟩,
        surplus := ?_ },
      ?_⟩
  · simpa using hC1
  · constructor
    · simpa [SurplusCapPacket.oppCap1] using hC2
    · simpa [SurplusCapPacket.oppCap2] using hC3

/-- A concrete MEC/cap-partition payload with `C2` as the surplus cap and
`C1`, `C3` as exact four-caps constructs the same-carrier `(m,4,4)` packet. -/
theorem isM44Packet_of_capTriple_C2_surplus
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    (hC2 : 4 < CP.C2.card)
    (hC1 : CP.C1.card = 4)
    (hC3 : CP.C3.card = 4) :
    ∃ S : SurplusCapPacket A, S.IsM44 := by
  refine
    ⟨{ hA := hA,
        hncol := hncol,
        triangleNonObtuse := MT,
        hCirc := hCirc,
        partition := CP,
        surplusIdx := ⟨1, by decide⟩,
        surplus := ?_ },
      ?_⟩
  · simpa using hC2
  · constructor
    · simpa [SurplusCapPacket.oppCap1] using hC3
    · simpa [SurplusCapPacket.oppCap2] using hC1

/-- A concrete MEC/cap-partition payload with `C3` as the surplus cap and
`C1`, `C2` as exact four-caps constructs the same-carrier `(m,4,4)` packet. -/
theorem isM44Packet_of_capTriple_C3_surplus
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    (hC3 : 4 < CP.C3.card)
    (hC1 : CP.C1.card = 4)
    (hC2 : CP.C2.card = 4) :
    ∃ S : SurplusCapPacket A, S.IsM44 := by
  refine
    ⟨{ hA := hA,
        hncol := hncol,
        triangleNonObtuse := MT,
        hCirc := hCirc,
        partition := CP,
        surplusIdx := ⟨2, by decide⟩,
        surplus := ?_ },
      ?_⟩
  · simpa using hC3
  · constructor
    · simpa [SurplusCapPacket.oppCap1] using hC1
    · simpa [SurplusCapPacket.oppCap2] using hC2

/-- Variant of `isM44Packet_of_capTriple_C1_surplus` where the surplus bound
for `C1` is derived from the closed-cap sum identity.

For the U1.2 card-sum lane, the ambient hypothesis `9 < A.card` together with
the two exact opposite-cap cardinalities is enough to invoke this bridge;
`4 < C1.card` is then pure cap arithmetic. -/
theorem isM44Packet_of_capTriple_C2C3_exact_of_card_gt_nine
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    (hcard : 9 < A.card)
    (hC2 : CP.C2.card = 4)
    (hC3 : CP.C3.card = 4) :
    ∃ S : SurplusCapPacket A, S.IsM44 := by
  have hsum := CP.cap_sum_identity
  have hC1 : 4 < CP.C1.card := by
    omega
  exact isM44Packet_of_capTriple_C1_surplus MT hCirc CP hC1 hC2 hC3

/-- Orientation-free variant: if any two caps in a cap triple are exact
four-caps, then `9 < |A|` makes the remaining cap the surplus cap and yields
the same-carrier `(m,4,4)` packet. -/
theorem isM44Packet_of_capTriple_two_exact_of_card_gt_nine
    {A : Finset ℝ²} {hA : A.Nonempty}
    {hncol : ¬ Collinear ℝ (A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle A hA hncol)
    (hCirc : ∃ h12 h23 h13,
      MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    (CP : CapTriple A (MT.toMoserTriangle.toStructural hCirc))
    (hcard : 9 < A.card)
    (hexact :
      (CP.C1.card = 4 ∧ CP.C2.card = 4) ∨
      (CP.C1.card = 4 ∧ CP.C3.card = 4) ∨
      (CP.C2.card = 4 ∧ CP.C3.card = 4)) :
    ∃ S : SurplusCapPacket A, S.IsM44 := by
  have hsum := CP.cap_sum_identity
  rcases hexact with h12 | h13 | h23
  · have hC3 : 4 < CP.C3.card := by omega
    exact isM44Packet_of_capTriple_C3_surplus MT hCirc CP hC3 h12.1 h12.2
  · have hC2 : 4 < CP.C2.card := by omega
    exact isM44Packet_of_capTriple_C2_surplus MT hCirc CP hC2 h13.1 h13.2
  · have hC1 : 4 < CP.C1.card := by omega
    exact isM44Packet_of_capTriple_C1_surplus MT hCirc CP hC1 h23.1 h23.2

/-- A same-carrier `(m,4,4)` surplus-cap packet supplies the exactness branch
of `U1ExactnessFromMinimality`.

This is the theorem-facing packaging used by the U1.2 re-mine route: the
remaining bridge only has to construct an `IsM44` `SurplusCapPacket` on the
current carrier.  The surrounding `CounterexampleData` fields are inherited
from the original datum. -/
theorem exactnessBranch_of_isM44_packet {D : CounterexampleData}
    (hpacket : ∃ S : SurplusCapPacket D.A, S.IsM44) :
    ∃ D' : CounterexampleData, D'.A = D.A ∧
      D'.packet.oppCap1.card = 4 ∧ D'.packet.oppCap2.card = 4 := by
  rcases hpacket with ⟨S, hM44⟩
  refine
    ⟨{ A := D.A,
        nonempty := D.nonempty,
        convex := D.convex,
        K4 := D.K4,
        packet := S },
      rfl, ?_, ?_⟩
  · exact hM44.1
  · exact hM44.2

/-- Under `U1NoExit`, no same-carrier `(m,4,4)` surplus-cap packet is
available. -/
theorem U1NoExit.not_isM44_packet {D : CounterexampleData}
    (hNoExit : U1NoExit D) :
    ¬ ∃ S : SurplusCapPacket D.A, S.IsM44 := by
  intro hPacket
  exact hNoExit.not_exactPacket (exactnessBranch_of_isM44_packet hPacket)

/-- **U1 sub-lemma 3: endpoint-equality.**  In any exact `4`-cap, the
opposite Moser-triangle vertex sees the full cap at one common radius:
in the `(m, 4, 4)` regime there exist radii `r₁, r₂` such that every
point of `oppCap1` lies at distance `r₁` from `oppApex1` and every
point of `oppCap2` lies at distance `r₂` from `oppApex2`.  Geometric
content: each exact-4 cap is circumscribed by a circle centered at
its opposite Moser apex.

**Closure-plan note.**  U1.3 is *not* on the U1 fallback path: the
fallback (`U1FallbackStatement`, derived via `u1_fallback_of_exactness`)
requires only U1.2 (`U1ExactnessFromMinimality`).  U1.3 is therefore
load-bearing only for the *strong* U1 statement, which the closure
plan flags as optional.  See `docs/97-uniform-theorem-closure-plan.md`
lines 240–250 ("Fallback If U1 Stalls"). -/
def U1EndpointEquality (D : CounterexampleData) : Prop :=
  D.IsM44 →
    ∃ r₁ r₂ : ℝ,
      (∀ a ∈ D.packet.oppCap1, dist a D.packet.oppApex1 = r₁) ∧
      (∀ a ∈ D.packet.oppCap2, dist a D.packet.oppApex2 = r₂)

/-- **U1 sub-lemma 4: equilateral transfer.**  Two exact short caps
force the Moser triangle equilateral: given `D.IsM44` and the
endpoint-equality hypothesis on `D`, the three Moser-triangle side
lengths coincide. -/
def U1EquilateralTransfer (D : CounterexampleData) : Prop :=
  D.IsM44 → U1EndpointEquality D →
    dist D.packet.triangle.v1 D.packet.triangle.v2 =
      dist D.packet.triangle.v2 D.packet.triangle.v3 ∧
    dist D.packet.triangle.v2 D.packet.triangle.v3 =
      dist D.packet.triangle.v3 D.packet.triangle.v1

/-- **Proof of U1.4 (equilateral transfer) from U1.3.**

Case-split on `D.packet.surplusIdx : Fin 3`.  In each case the two
opposite caps contain two distinct Moser-triangle vertices each (closed
cap convention from `CapTriple.v?_mem_C?` fields), and the corresponding
opposite apex carries the cap's common K4-radius (per
`U1EndpointEquality`).  Specializing `h1` and `h2` to those Moser-vertex
endpoints produces equalities between Moser-triangle side lengths and
the radii `r₁, r₂`; transitivity together with `dist_comm` collapses
them into the two equilateral-transfer conclusions.

No new geometric input beyond `U1EndpointEquality D` and the cap-triple
membership invariants is needed. -/
theorem u1EquilateralTransfer_proof (D : CounterexampleData) :
    U1EquilateralTransfer D := by
  intro hM44 hEE
  obtain ⟨r₁, r₂, h1, h2⟩ := hEE hM44
  -- Cap-triple field projection.
  set CP := D.packet.partition
  -- Case-split on `surplusIdx`.  In each case, unfold `oppCap1`,
  -- `oppCap2`, `oppApex1`, `oppApex2` and feed the right Moser-vertex
  -- memberships from `CP` to `h1`, `h2`.
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · -- surplusIdx = ⟨0, _⟩: oppCap1 = C2, oppCap2 = C3,
    -- oppApex1 = v2, oppApex2 = v3.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at h1 h2
    have d12 : dist D.packet.triangle.v1 D.packet.triangle.v2 = r₁ :=
      h1 D.packet.triangle.v1 CP.v1_mem_C2
    have d32 : dist D.packet.triangle.v3 D.packet.triangle.v2 = r₁ :=
      h1 D.packet.triangle.v3 CP.v3_mem_C2
    have d13 : dist D.packet.triangle.v1 D.packet.triangle.v3 = r₂ :=
      h2 D.packet.triangle.v1 CP.v1_mem_C3
    have d23 : dist D.packet.triangle.v2 D.packet.triangle.v3 = r₂ :=
      h2 D.packet.triangle.v2 CP.v2_mem_C3
    -- `d32` gives `dist v2 v3 = r₁` after `dist_comm`.
    have d23_r1 : dist D.packet.triangle.v2 D.packet.triangle.v3 = r₁ := by
      rw [dist_comm]; exact d32
    refine ⟨?_, ?_⟩
    · -- dist v1 v2 = dist v2 v3 : both equal r₁.
      rw [d12, d23_r1]
    · -- dist v2 v3 = dist v3 v1 : r₁ = r₂ via d23 vs d23_r1; then dist_comm.
      have hrr : r₁ = r₂ := by rw [← d23_r1, d23]
      rw [d23_r1, hrr, dist_comm]; exact d13.symm
  · -- surplusIdx = ⟨1, _⟩: oppCap1 = C3, oppCap2 = C1,
    -- oppApex1 = v3, oppApex2 = v1.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at h1 h2
    have d13 : dist D.packet.triangle.v1 D.packet.triangle.v3 = r₁ :=
      h1 D.packet.triangle.v1 CP.v1_mem_C3
    have d23 : dist D.packet.triangle.v2 D.packet.triangle.v3 = r₁ :=
      h1 D.packet.triangle.v2 CP.v2_mem_C3
    have d21 : dist D.packet.triangle.v2 D.packet.triangle.v1 = r₂ :=
      h2 D.packet.triangle.v2 CP.v2_mem_C1
    have d31 : dist D.packet.triangle.v3 D.packet.triangle.v1 = r₂ :=
      h2 D.packet.triangle.v3 CP.v3_mem_C1
    have d12_r2 : dist D.packet.triangle.v1 D.packet.triangle.v2 = r₂ := by
      rw [dist_comm]; exact d21
    have d31_r1 : dist D.packet.triangle.v3 D.packet.triangle.v1 = r₁ := by
      rw [dist_comm]; exact d13
    have hrr : r₁ = r₂ := by rw [← d31_r1, d31]
    refine ⟨?_, ?_⟩
    · -- dist v1 v2 = dist v2 v3 : v1 v2 = r₂ = r₁ = v2 v3.
      rw [d12_r2, ← hrr, d23]
    · -- dist v2 v3 = dist v3 v1 : both equal r₁.
      rw [d23, d31_r1]
  · -- surplusIdx = ⟨2, _⟩: oppCap1 = C1, oppCap2 = C2,
    -- oppApex1 = v1, oppApex2 = v2.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at h1 h2
    have d21 : dist D.packet.triangle.v2 D.packet.triangle.v1 = r₁ :=
      h1 D.packet.triangle.v2 CP.v2_mem_C1
    have d31 : dist D.packet.triangle.v3 D.packet.triangle.v1 = r₁ :=
      h1 D.packet.triangle.v3 CP.v3_mem_C1
    have d12 : dist D.packet.triangle.v1 D.packet.triangle.v2 = r₂ :=
      h2 D.packet.triangle.v1 CP.v1_mem_C2
    have d32 : dist D.packet.triangle.v3 D.packet.triangle.v2 = r₂ :=
      h2 D.packet.triangle.v3 CP.v3_mem_C2
    have d12_r1 : dist D.packet.triangle.v1 D.packet.triangle.v2 = r₁ := by
      rw [dist_comm]; exact d21
    have d23_r2 : dist D.packet.triangle.v2 D.packet.triangle.v3 = r₂ := by
      rw [dist_comm]; exact d32
    have hrr : r₁ = r₂ := by rw [← d12_r1, d12]
    refine ⟨?_, ?_⟩
    · -- dist v1 v2 = dist v2 v3 : v1 v2 = r₁ = r₂ = v2 v3.
      rw [d12_r1, hrr, ← d23_r2]
    · -- dist v2 v3 = dist v3 v1 : v2 v3 = r₂ = r₁ = v3 v1.
      rw [d23_r2, ← hrr, ← d31]

/-- **U1 sub-lemma 5: short-cap Apollonius (loose form).**  Each
exact short cap lies on a single circle: there exist `(c₁, r₁)` and
`(c₂, r₂)` such that `oppCap1` lies on the circle `(c₁, r₁)` and
`oppCap2` on `(c₂, r₂)`.  The full geometric content is that these
centers are the `60`-degree Apollonius arc centers (reflections of
the Moser apex across each chord on the equilateral case forced by
`U1EquilateralTransfer`), which requires Mathlib `oangle` vocabulary
to state precisely; the loose common-circle form here is the weakest
version that downstream consumers will eventually rely on, and will
be strengthened to the Apollonius form once `oangle` is wired in.

**Hypothesis chain:** takes `U1EndpointEquality D` (not
`U1EquilateralTransfer D`) because the loose common-circle conclusion
follows from per-apex equidistance alone, without the equilateral
upgrade.  Once oangle is wired in and the statement is tightened to
the proper Apollonius form (specific reflected-apex centers, radius
= side / √3), the hypothesis should be upgraded to
`U1EquilateralTransfer D`.

{{NEEDS_UPDATE}}: tighten to inscribed-angle / specific-center form
when Mathlib `oangle` vocabulary is integrated, and re-take
`U1EquilateralTransfer D` as the hypothesis at that point. -/
def U1ShortCapApollonius (D : CounterexampleData) : Prop :=
  D.IsM44 → U1EndpointEquality D →
    (∃ (c₁ : ℝ²) (r₁ : ℝ), ∀ a ∈ D.packet.oppCap1, dist a c₁ = r₁) ∧
    (∃ (c₂ : ℝ²) (r₂ : ℝ), ∀ a ∈ D.packet.oppCap2, dist a c₂ = r₂)

/-- **Proof of U1 sub-lemma 5 (loose form) from U1.3.**  Trivial:
the per-apex equidistance witnesses of `U1EndpointEquality D` are
exactly the loose-form common-circle witnesses, with center
`oppApex_i` and radius `r_i`. -/
theorem u1ShortCapApollonius_of_u1EndpointEquality
    (D : CounterexampleData) :
    U1ShortCapApollonius D := by
  intro hM44 hEE
  obtain ⟨r₁, r₂, h1, h2⟩ := hEE hM44
  exact ⟨⟨D.packet.oppApex1, r₁, h1⟩, ⟨D.packet.oppApex2, r₂, h2⟩⟩

/-- `U1EndpointEquality` already packages both theorem-facing consequences
that survive in the current scaffold: the equilateral transfer and the loose
short-cap Apollonius-circle form. -/
theorem u1Geometry_of_u1EndpointEquality
    (D : CounterexampleData) :
    U1EquilateralTransfer D ∧ U1ShortCapApollonius D := by
  exact ⟨u1EquilateralTransfer_proof D,
    u1ShortCapApollonius_of_u1EndpointEquality D⟩

/- ### Composition lemma: U1 from its sub-lemmas

We *cannot* yet prove U1 because sub-lemmas 1 and 2 are unresolved.
What we *can* state is:  if U1ShortCapExistence and
U1ExactnessFromMinimality both hold on `D`, then either the U1
fallback alternatives hold, *or* `D` admits a packet whose opposite
caps both have size exactly `4`, which is the structural target of U1.

The "equality target" is `IsM44` modulo the surplus-cap designation
remaining consistent.  Below we prove the cleanest such composition
in fallback form. -/

/-- **From sub-lemmas 1 + 2 to the U1 fallback.**

If sub-lemma 2 (exactness-from-minimality) holds on `D`, then the
U1 fallback holds on `D` in its alternative form:
either some Moser-triangle data is in the `(m, 4, 4)` regime, or a
removable vertex exists.

(Sub-lemma 1, short-cap existence, would be needed to refine the first
alternative to use the *original* surplus cap; with sub-lemma 2 alone
we only get *some* Moser triangle with two exact `4`-caps.)

This is a *clean* trivial composition — it shows the closure plan's
fallback statement is a logical projection of sub-lemma 2, modulo the
need to identify the surplus cap.

The proof goes by case analysis on the output of sub-lemma 2: if
removable, done; if `(m, 4, 4)` exists, output it as the first
disjunct of the fallback. -/
theorem u1_fallback_of_exactness
    {D : CounterexampleData}
    (h2 : U1ExactnessFromMinimality D) : U1FallbackStatement D := by
  intro hmin
  rcases h2 hmin with ⟨D', hAeq, hC2, hC3⟩ | hrem
  · -- We have a packet with both opposite caps of size exactly 4.
    -- That is precisely `IsM44`.
    refine Or.inl ⟨D', hAeq, ?_⟩
    exact ⟨hC2, hC3⟩
  · exact Or.inr hrem

/-- If the exactness-from-minimality branch is available and `D.A` has no
removable vertex, then the `(m, 4, 4)` alternative must occur. This is the
theorem-facing form of the U1 fallback when downstream code has already ruled
out the removable-vertex exit. -/
theorem exists_isM44_of_exactness_of_no_removable
    {D : CounterexampleData}
    (h2 : U1ExactnessFromMinimality D)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x)
    (hmin : D.Minimal) :
    ∃ D' : CounterexampleData, D'.A = D.A ∧ D'.IsM44 := by
  rcases h2 hmin with ⟨D', hAeq, hC2, hC3⟩ | hrem
  · exact ⟨D', hAeq, ⟨hC2, hC3⟩⟩
  · rcases hrem with ⟨x, hxrem⟩
    exact False.elim (hnoRem x hxrem)

/-- Packaging the previous lemma at the statement level: if removable
vertices are excluded a priori, `U1ExactnessFromMinimality` is already enough
to produce the strong `U1Statement`. -/
theorem u1Statement_of_exactness_of_no_removable
    {D : CounterexampleData}
    (h2 : U1ExactnessFromMinimality D)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x) :
    U1Statement D := by
  intro hmin
  exact exists_isM44_of_exactness_of_no_removable h2 hnoRem hmin

/-- If exactness-from-minimality is available and removable vertices are
excluded, then the fallback statement is enough to recover the strong U1
statement. -/
theorem u1FallbackStatement_of_exactness_and_no_removable
    {D : CounterexampleData}
    (h2 : U1ExactnessFromMinimality D)
    (hnoRem : ∀ x : ℝ², ¬ IsRemovableVertex D.A x) :
    U1FallbackStatement D := by
  intro hmin
  exact Or.inl
    ((u1Statement_of_exactness_of_no_removable h2 hnoRem) hmin)

end Problem97
