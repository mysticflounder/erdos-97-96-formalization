import Erdos9796Proof.P97.Foundation
import Erdos9796Proof.P97.SmallerCounterexample
import Erdos9796Proof.P97.Cap.Partition

/-!
# Cap-structural packet: Moser triangle, cap triple, surplus cap data

This file is the *structural data layer* used by the U1–U7 surplus-cap
program (see `docs/97-uniform-theorem-closure-plan.md`).  The closure
plan talks freely about

* a minimum-enclosing-circle (MEC) and a *Moser triangle* — three MEC
  boundary vertices `v1, v2, v3 ∈ A`;
* the *three closed caps* `C1, C2, C3` they cut on the convex polygon
  `A` (each `Ci` is the closed chain between `v_{i+1}` and `v_{i+2}`
  not passing through `v_i`, *including* the two endpoints);
* a *surplus cap*: one of the `Ci` with `|Ci| > 4`;
* the regime `(m, 4, 4)`: two caps of size exactly `4` and one cap
  of size `m ≥ 5`.

Mathlib has no general-purpose minimum-enclosing-circle / Moser-cap
infrastructure.  This file does **not** attempt to build that
infrastructure.  Instead it packages exactly the **abstract
combinatorial data** that the U1 prose reduces to, so that downstream
formal arguments can consume the packet without re-deriving its
geometric provenance.  In the "structure-first" pattern flagged on the
blueprint obligation `p97-mec-setup`, this is the structure half;
existence of the data on a real counterexample is a separate
obligation that will eventually instantiate the packet.

Every definition here is purely about `Finset ℝ²` cardinalities,
membership, and the existing `ConvexIndep` / `HasNEquidistantProperty`
predicates.  No geometric content (MEC center, radius, Apollonius
arcs) is asserted at this layer — those data only enter at the
existence step, and at the geometric sub-lemmas of U1.

We use the **closed-cap convention** matching the existing
combinatorial `Problem97.CapPartition` in `CapPartition.lean`: each cap `Ci`
includes its two adjacent Moser-vertex endpoints, so adjacent caps
share an endpoint, every Moser vertex sits in exactly two caps, and
every non-Moser vertex sits in exactly one cap.  The cap-sum identity
in this convention reads

  `|C1| + |C2| + |C3| = |A| + 3`,

which is the identity already proved on `CapPartition`.

## Main definitions

* `Problem97.MoserTriangle A` — a labelled triple of distinct vertices
  of `A`.
* `Problem97.CapTriple A M` — a labelled triple of subsets of `A` in
  the closed-cap convention: each cap contains the two non-opposite
  Moser vertices, caps cover `A`, and every non-Moser vertex lies in
  exactly one cap.
## Main lemmas (PROVEN)

* `CapTriple.toCapPartition` — convert a geometric `CapTriple` to the
  abstract `CapPartition` of `CapPartition.lean`, where the cap-sum
  identity is already proved.
* `CapTriple.cap_sum_identity` — direct consequence:
  `|C1| + |C2| + |C3| = |A| + 3`.
* `CapTriple.exists_surplus_cap_of_card_gt_nine` — pigeonhole on the
  cap triple: if `|A| > 9` then some cap has size `> 4`.

## SurplusCapPacket: moved downstream

The MEC-aware `SurplusCapPacket` (carrying a non-obtuse circumscribed
Moser triangle together with the cap-triple over its structural
projection) is defined in `CapPartitionFromMEC.lean`. The packet
records the geometric promotion data that downstream U1 sub-lemmas
consume through `cap_arc_midpoint_inequality_v{1,2,3}`.

## What is *not* proven here

The genuine geometric content of U1 — that *every* minimal strict-convex
PerVertexK4 counterexample with a surplus cap admits a Moser triangle
in the `(m, 4, 4)` regime — is a sequence of five sub-lemmas which
require MEC / Apollonius geometry that this scaffold does not build.
See `U1TwoShortCapReduction.lean` for the U1 statement and the open
sub-lemmas it depends on.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

/- ### Moser triangle: three labelled vertices of `A` -/

/-- A *Moser triangle* on a `Finset ℝ²` is a labelled triple of
distinct vertices.  At the structural layer no MEC condition is
attached: the U1 prose imposes the MEC-boundary condition only when it
matters (cap monotonicity, equilateral transfer).  The MEC obligation
is recorded directly as part of `SurplusCapPacket` (in
`CapPartitionFromMEC.lean`); this base record is the combinatorial
skeleton. -/
structure MoserTriangle (A : Finset ℝ²) where
  /-- First Moser vertex. -/
  v1 : ℝ²
  /-- Second Moser vertex. -/
  v2 : ℝ²
  /-- Third Moser vertex. -/
  v3 : ℝ²
  /-- All three vertices are in `A`. -/
  v1_mem : v1 ∈ A
  v2_mem : v2 ∈ A
  v3_mem : v3 ∈ A
  /-- The three Moser vertices are pairwise distinct. -/
  v12_ne : v1 ≠ v2
  v13_ne : v1 ≠ v3
  v23_ne : v2 ≠ v3

namespace MoserTriangle

variable {A : Finset ℝ²}

/-- The three Moser vertices, packaged as a `Finset`. -/
noncomputable def verts (M : MoserTriangle A) : Finset ℝ² := {M.v1, M.v2, M.v3}

/-- The Moser-vertex set has cardinality `3`. -/
lemma verts_card (M : MoserTriangle A) : M.verts.card = 3 := by
  classical
  unfold verts
  rw [card_insert_of_notMem, card_insert_of_notMem, card_singleton]
  · simp [M.v23_ne]
  · simp [M.v12_ne, M.v13_ne]

/-- The Moser-vertex set is a subset of `A`. -/
lemma verts_subset (M : MoserTriangle A) : M.verts ⊆ A := by
  classical
  intro x hx
  unfold verts at hx
  rcases mem_insert.mp hx with h | h
  · exact h ▸ M.v1_mem
  · rcases mem_insert.mp h with h | h
    · exact h ▸ M.v2_mem
    · rcases mem_singleton.mp h with h
      exact h ▸ M.v3_mem

end MoserTriangle

/- ### `CapTriple`: closed-cap labelled triple on `A`

Closed-cap convention:

* `Ci` is the closed chain between `v_{i+1}` and `v_{i+2}` not passing
  through `v_i`, *including* its two Moser-vertex endpoints.
* Therefore `v_i ∉ Ci` (opposite apex never in its own opposite cap),
  while `v_{i+1}, v_{i+2} ∈ Ci`.
* Each Moser vertex is in exactly two caps.
* Each non-Moser vertex is in exactly one cap.
* `C1 ∪ C2 ∪ C3 = A`.

This is the exact membership pattern packaged by the combinatorial
`Problem97.CapPartition`; the geometric `CapTriple` just records the
specialization to a Moser-vertex set produced by a `MoserTriangle`. -/

/-- A *cap triple* (closed-cap convention) on `A` with respect to a
Moser triangle `M`. -/
structure CapTriple (A : Finset ℝ²) (M : MoserTriangle A) where
  /-- First cap (closed chain `v2 → v3` not through `v1`). -/
  C1 : Finset ℝ²
  /-- Second cap (closed chain `v3 → v1` not through `v2`). -/
  C2 : Finset ℝ²
  /-- Third cap (closed chain `v1 → v2` not through `v3`). -/
  C3 : Finset ℝ²
  /-- Caps are subsets of `A`. -/
  C1_subset : C1 ⊆ A
  C2_subset : C2 ⊆ A
  C3_subset : C3 ⊆ A
  /-- `v1 ∉ C1`: the opposite apex is *not* in its opposite cap. -/
  v1_notin_C1 : M.v1 ∉ C1
  /-- `v2 ∈ C1`: the cap contains its `v2` endpoint. -/
  v2_mem_C1 : M.v2 ∈ C1
  /-- `v3 ∈ C1`: the cap contains its `v3` endpoint. -/
  v3_mem_C1 : M.v3 ∈ C1
  /-- `v1 ∈ C2`: the cap contains its `v1` endpoint. -/
  v1_mem_C2 : M.v1 ∈ C2
  /-- `v2 ∉ C2`: opposite apex. -/
  v2_notin_C2 : M.v2 ∉ C2
  /-- `v3 ∈ C2`: the cap contains its `v3` endpoint. -/
  v3_mem_C2 : M.v3 ∈ C2
  /-- `v1 ∈ C3`: the cap contains its `v1` endpoint. -/
  v1_mem_C3 : M.v1 ∈ C3
  /-- `v2 ∈ C3`: the cap contains its `v2` endpoint. -/
  v2_mem_C3 : M.v2 ∈ C3
  /-- `v3 ∉ C3`: opposite apex. -/
  v3_notin_C3 : M.v3 ∉ C3
  /-- Non-Moser vertices: each lies in exactly one cap. -/
  nonmoser_in_one : ∀ v ∈ A, v ∉ M.verts →
    (if v ∈ C1 then 1 else 0)
      + (if v ∈ C2 then 1 else 0)
      + (if v ∈ C3 then 1 else 0) = 1
  /-- **Arc-membership invariant.** Each cap is precisely the set of
  `A`-points on the closed MEC arc opposite its Moser vertex, expressed
  via the signed-area chord-separation predicate `OnArcOpposite`. This
  pins caps to arcs without requiring a `CircularOrder` instance, and
  is the load-bearing geometric content needed by the U1 and Dumitrescu
  L5/L7 chains downstream. -/
  arc_membership : ∀ v ∈ A,
    (v ∈ C1 ↔ Problem97.OnArcOpposite M.v1 M.v2 M.v3 v)
    ∧ (v ∈ C2 ↔ Problem97.OnArcOpposite M.v2 M.v3 M.v1 v)
    ∧ (v ∈ C3 ↔ Problem97.OnArcOpposite M.v3 M.v1 M.v2 v)

namespace CapTriple

variable {A : Finset ℝ²} {M : MoserTriangle A}

/-- The Moser-vertex membership pattern derived from the
`v?_mem_C?`/`v?_notin_C?` fields: each Moser vertex is in exactly
two of the three caps. -/
lemma moser_in_two (CP : CapTriple A M) :
    ∀ v ∈ M.verts,
    (if v ∈ CP.C1 then 1 else 0)
      + (if v ∈ CP.C2 then 1 else 0)
      + (if v ∈ CP.C3 then 1 else 0) = 2 := by
  classical
  intro v hv
  unfold MoserTriangle.verts at hv
  rcases mem_insert.mp hv with rfl | h
  · -- v = M.v1
    simp [CP.v1_notin_C1, CP.v1_mem_C2, CP.v1_mem_C3]
  · rcases mem_insert.mp h with rfl | h
    · -- v = M.v2
      simp [CP.v2_mem_C1, CP.v2_notin_C2, CP.v2_mem_C3]
    · -- v = M.v3
      rcases mem_singleton.mp h with rfl
      simp [CP.v3_mem_C1, CP.v3_mem_C2, CP.v3_notin_C3]

/-- Convert a geometric `CapTriple` to the abstract combinatorial
`CapPartition` defined in `CapPartition.lean`. -/
noncomputable def toCapPartition (CP : CapTriple A M) :
    Problem97.CapPartition A M.verts where
  C1 := CP.C1
  C2 := CP.C2
  C3 := CP.C3
  M_card := M.verts_card
  M_sub := M.verts_subset
  C1_sub := CP.C1_subset
  C2_sub := CP.C2_subset
  C3_sub := CP.C3_subset
  moser_in_two := CP.moser_in_two
  nonmoser_in_one := CP.nonmoser_in_one

/-- **Cap-sum identity (closed-cap form).**  For any cap triple of `A`,
`|C1| + |C2| + |C3| = |A| + 3`.

Direct from `Problem97.CapPartition.cap_sum_identity` via
`toCapPartition`. -/
theorem cap_sum_identity (CP : CapTriple A M) :
    CP.C1.card + CP.C2.card + CP.C3.card = A.card + 3 :=
  Problem97.cap_sum_identity (cp := CP.toCapPartition)

end CapTriple

/-- **Pigeonhole on the cap-sum identity (closed-cap form).**  If a
`CapTriple` exists on `A` and `|A| > 9`, then some cap has size `> 4`.

This is the formal counterpart of the `n > 9 ⇒ |Ci| > 4` step in the
surplus-cap argument. -/
theorem CapTriple.exists_surplus_cap_of_card_gt_nine
    {A : Finset ℝ²} {M : MoserTriangle A} (CP : CapTriple A M)
    (hcard : 9 < A.card) :
    ∃ i : Fin 3, 4 <
      (match i with
        | ⟨0, _⟩ => CP.C1
        | ⟨1, _⟩ => CP.C2
        | _      => CP.C3).card := by
  classical
  by_contra hall
  push_neg at hall
  -- Each `hall ⟨i, _⟩` reduces to `Ci.card ≤ 4` after the `match` unfolds.
  have h1 : CP.C1.card ≤ 4 := hall ⟨0, by decide⟩
  have h2 : CP.C2.card ≤ 4 := hall ⟨1, by decide⟩
  have h3 : CP.C3.card ≤ 4 := hall ⟨2, by decide⟩
  have hsum := CP.cap_sum_identity
  omega

end Problem97

/-! Note: `SurplusCapPacket`, its derived selectors `surplusCap`,
`oppCap1`, `oppCap2`, the `capSum` lemma, the existence theorem
`CapTriple.toSurplusCapPacket_of_card_gt_nine`, and the `(m, 4, 4)`
regime predicate `IsM44` (with its consequences) have been moved
downstream into `Erdos9796Proof.P97.CapPartitionFromMEC`, where the
MEC promotion data (a `MEC.NonObtuseCircumscribedMoserTriangle` and
its circumscribed-case-split witness) can be carried directly inside
the packet. This is the prerequisite for downstream U1 sub-lemmas to
apply `cap_arc_midpoint_inequality_v{1,2,3}` without manual MEC
construction. -/
