/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U1TwoShortCapReduction
import Erdos9796Proof.P97.OangleBridge

open scoped EuclideanGeometry

/-!
# U2 — Equilateral MEC and two short Apollonius caps in `(m, 4, 4)`

This file states `U2` from `docs/97-uniform-theorem-closure-plan.md`
(Phase 1) in formal Lean.

Upstream prose statement (closure plan lines 180–186):

> **U2.**  In the regime `(m, 4, 4)`, the MEC triangle is equilateral,
> the two short `4`-caps are full distance-`d` classes, and those caps
> lie on 60-degree Apollonius arcs.

The statement decomposes into three sub-claims:

* `U2EquilateralMECTriangle` — the three Moser-triangle side lengths
  coincide whenever `D.IsM44`.
* `U2FullDistanceClasses` — each non-surplus cap is the *full*
  equidistance class at its opposite Moser apex at the common
  MEC-radius `d`.  This is strictly stronger than U1.3
  (`U1EndpointEquality`), which only asserts each cap is *contained*
  in such a class; U2 asserts the reverse containment as well.
* `U2ApolloniusArcs` — each non-surplus cap lies on a 60-degree
  Apollonius arc.  Operationalized against
  `Problem97.OpApolloniusArc` (the inscribed-angle + chord-side
  predicate from `OangleBridge.lean`).

What *is* proved here:

* `u2EquilateralMECTriangle_of_u1EndpointEquality` — the equilateral
  sub-claim chains directly through U1.4 (`u1EquilateralTransfer_proof`).
* `U2Statement` — the combined statement, as a conjunction of the
  three sub-claims.

What is *not* yet proved:

* `U2FullDistanceClasses` — open.  The new content beyond U1.3 is the
  reverse cap containment: K4 at the opposite apex plus
  `cap_arc_midpoint_inequality` should pin the cap as a *full*
  equidistance class.  See closure plan Phase 1 sublemma 5
  (short-cap Apollonius).
* `U2ApolloniusArcs` — operational (statement-level); the load-bearing
  geometric step "each cap-point realises `OpApolloniusArc`" remains
  open as the actual proof obligation.

## Downstream consumers

U3 (`docs/97-u3-short-cap-saturation.md`, closure-plan Phase 2) and
U5 (`docs/97-u5-mode-a-deletion.md`, Phase 4) take U2 as their
geometric frame.  Both can be stated against `U2Statement D` as a
hypothesis without waiting for U2 to be closed.
-/

namespace Problem97

/- ### Sub-lemma signatures -/

/-- **U2 sub-lemma A: equilateral MEC triangle.**

In the `(m, 4, 4)` regime, the three Moser-triangle side lengths coincide.

This is exactly the conclusion of U1.4 (`U1EquilateralTransfer`)
applied at `D.IsM44` and a U1.3 (`U1EndpointEquality`) hypothesis on
`D`. -/
def U2EquilateralMECTriangle (D : CounterexampleData) : Prop :=
  D.IsM44 →
    dist D.packet.triangle.v1 D.packet.triangle.v2 =
      dist D.packet.triangle.v2 D.packet.triangle.v3 ∧
    dist D.packet.triangle.v2 D.packet.triangle.v3 =
      dist D.packet.triangle.v3 D.packet.triangle.v1

/-- **U2 sub-lemma B: each non-surplus cap is a full distance-`d` class.**

In the `(m, 4, 4)` regime, there is a common radius `d` such that each
non-surplus cap equals the *full* set of points of `A` at distance `d`
from its opposite Moser apex.

This strengthens U1.3 (`U1EndpointEquality`) — which gives one
direction of cap-membership ⇒ equidistance — by adding the reverse
direction: every `A`-point at the radius `d` from the apex is already
in the cap.  Geometric content: the K4 property at the opposite apex
plus the cap-arc-midpoint inequality machinery
(`cap_arc_midpoint_inequality_v1/v2/v3`) pin the cap as a *closed*
equidistance class.

The common radius `d` is the MEC side length: per
`U2EquilateralMECTriangle D`, all three Moser sides have length `d`,
so the two non-surplus apices each see the opposite cap at that
common radius. -/
def U2FullDistanceClasses (D : CounterexampleData) : Prop :=
  D.IsM44 →
    ∃ d : ℝ, 0 < d ∧
      D.A.filter (fun x => dist x D.packet.oppApex1 = d) = D.packet.oppCap1 ∧
      D.A.filter (fun x => dist x D.packet.oppApex2 = d) = D.packet.oppCap2

/-- Cyclic triple `(vi, vj, vk)` of Moser-triangle vertices for the
60° arc opposite `oppApex1`.  `vi` is the apex (matches `oppApex1`);
`(vj, vk)` is the cyclic rotation of the remaining two vertices,
matching the existing `Problem97.OnArcOpposite vi vj vk` orientation
convention. -/
private def oppArc1Triple {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ℝ² × ℝ² × ℝ² :=
  match S.surplusIdx with
  | ⟨0, _⟩ => (S.triangle.v2, S.triangle.v3, S.triangle.v1)
  | ⟨1, _⟩ => (S.triangle.v3, S.triangle.v1, S.triangle.v2)
  | _      => (S.triangle.v1, S.triangle.v2, S.triangle.v3)

/-- Cyclic triple `(vi, vj, vk)` for the 60° arc opposite `oppApex2`. -/
private def oppArc2Triple {A : Finset ℝ²} (S : SurplusCapPacket A) :
    ℝ² × ℝ² × ℝ² :=
  match S.surplusIdx with
  | ⟨0, _⟩ => (S.triangle.v3, S.triangle.v1, S.triangle.v2)
  | ⟨1, _⟩ => (S.triangle.v1, S.triangle.v2, S.triangle.v3)
  | _      => (S.triangle.v2, S.triangle.v3, S.triangle.v1)

/-- **U2 sub-lemma C: 60-degree Apollonius arcs (chord-side half).**

In the `(m, 4, 4)` regime with equilateral MEC, each non-surplus cap
lies on the 60-degree Apollonius arc through the two adjacent
Moser-triangle vertices, opposite the cap's apex.

**Apex-circle restatement (2026-05-28).** This predicate now carries
only the *chord-side* half — `Problem97.OnArcOpposite vi vj vk P` — for
each cap-point `P`, where `(vi, vj, vk)` is the cyclic triple of
Moser-triangle vertices with apex `vi` matching the cap's opposite apex
(`oppApex1` / `oppApex2`), computed by `oppArc1Triple` / `oppArc2Triple`.

The *distance* half (`dist P vi = d`, on the apex-centred circle of
radius `d`) is supplied separately by `U2FullDistanceClasses` (U2.B).
Together they give `ApexApolloniusArc vi vj vk d P` — the realizable,
apex-centred form. The earlier `OpApolloniusArc` (inscribed-angle /
cospherical) form was *false* for the interior cap-points: it would force
them onto the MEC, but they sit strictly inside the MEC disk (only the two
adjacent Moser vertices lie on both the MEC and the apex circle). See the
2026-05-28 apex-circle decision and `OangleBridge.ApexApolloniusArc`.

Unlike the old form, this statement is now an actual theorem
(`u2ApolloniusArcs_proof`), discharged from `CapTriple.arc_membership`. -/
def U2ApolloniusArcs (D : CounterexampleData) : Prop :=
  D.IsM44 →
    (∀ P ∈ D.packet.oppCap1,
        OnArcOpposite (oppArc1Triple D.packet).1
          (oppArc1Triple D.packet).2.1
          (oppArc1Triple D.packet).2.2 P) ∧
    (∀ P ∈ D.packet.oppCap2,
        OnArcOpposite (oppArc2Triple D.packet).1
          (oppArc2Triple D.packet).2.1
          (oppArc2Triple D.packet).2.2 P)

/-- **U2.C is now proved** (apex-circle restatement, 2026-05-28).

Each non-surplus cap-point lies on the closed arc opposite the cap's
apex, directly from the `CapTriple.arc_membership` invariant (caps are
*defined* as the `A`-points on the closed MEC arc opposite their Moser
vertex). The cap/triple assignment matches `arc_membership` exactly in
each of the three `surplusIdx` branches. No inscribed-angle / cospherical
content is consumed (that was the false-for-caps half). -/
theorem u2ApolloniusArcs_proof (D : CounterexampleData) : U2ApolloniusArcs D := by
  intro _hM44
  have harc := D.packet.partition.arc_membership
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i <;>
    refine ⟨fun P hP => ?_, fun P hP => ?_⟩ <;>
    · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
        oppArc1Triple, oppArc2Triple, hi] at hP ⊢
      first
        | exact ((harc P (D.packet.partition.C1_subset hP)).1).mp hP
        | exact ((harc P (D.packet.partition.C2_subset hP)).2.1).mp hP
        | exact ((harc P (D.packet.partition.C3_subset hP)).2.2).mp hP

/- ### Combined U2 statement -/

/-- **U2 — Equilateral MEC and two short Apollonius caps (formal statement).**

Combined statement of the three U2 sub-lemmas.  Downstream U-steps
(U3 short-cap saturation; U5 Mode A deletion) may consume this as a
single hypothesis. -/
def U2Statement (D : CounterexampleData) : Prop :=
  U2EquilateralMECTriangle D ∧
  U2FullDistanceClasses D ∧
  U2ApolloniusArcs D

/- ### Composition: U2.A from U1.3 -/

/-- **U2 sub-lemma A follows from U1.3 (endpoint-equality).**

`U2EquilateralMECTriangle D` is the conclusion of U1.4
(`U1EquilateralTransfer`), which has been proved via
`u1EquilateralTransfer_proof` from a `U1EndpointEquality D` hypothesis
on `D`. -/
theorem u2EquilateralMECTriangle_of_u1EndpointEquality
    (D : CounterexampleData) (hEE : U1EndpointEquality D) :
    U2EquilateralMECTriangle D := by
  intro hM44
  exact u1EquilateralTransfer_proof D hM44 hEE

/- ### Composition: U2.A from U2.B (U1.3-free route)

The existing `u2EquilateralMECTriangle_of_u1EndpointEquality` routes
U2.A through U1.3 (`U1EndpointEquality`), which the closure plan flags
as a permanently skipped sub-lemma (the U1 fallback path uses only
U1.2, per `dead-ends.md` 2026-05-22 entry on `p97-u1-endpoint-equality`).
The lemma below provides an alternative U1.3-free route: **U2.B
(`U2FullDistanceClasses`) implies U2.A (`U2EquilateralMECTriangle`)**.

The argument is purely combinatorial — no MEC / arc-angle / inscribed
angle content is consumed:

1. `U2.B` produces a common radius `d > 0` and the filter equation
   `D.A.filter (dist · oppApex_i = d) = oppCap_i` for `i = 1, 2`.
2. The `CapTriple` v?_mem_C? fields put two Moser-triangle vertices
   inside each non-surplus cap (closed-cap convention).
3. Forward direction of the filter equation (`x ∈ oppCap_i → x ∈ filter`)
   gives the distance equation `dist v_a oppApex_i = d` for each Moser
   vertex `v_a` membership.
4. Case-split on `surplusIdx : Fin 3` enumerates which Moser vertices
   land in which cap; the four resulting distance equations always
   cover all three Moser-triangle sides (up to `dist_comm`), forcing
   equilateral.

**Why this is a clean addition.** U2.B is the U1.3-free target the
closure plan currently lacks a proof for; once U2.B closes (via the
arc-angle parametrization + cap-arc-thales gap noted in
`docs/97-uniform-theorem-closure-plan.md` lines 238–266), U2.A follows
immediately via this lemma. The lemma is `O(70)` lines of pure
case-analysis with no axiom dependencies beyond the trivial input
hypothesis. -/
theorem u2EquilateralMECTriangle_of_u2FullDistanceClasses
    (D : CounterexampleData) (hFD : U2FullDistanceClasses D) :
    U2EquilateralMECTriangle D := by
  intro hM44
  obtain ⟨d, _hdpos, hfilt1, hfilt2⟩ := hFD hM44
  set CP := D.packet.partition
  set v1 := D.packet.triangle.v1
  set v2 := D.packet.triangle.v2
  set v3 := D.packet.triangle.v3
  rcases hi : D.packet.surplusIdx with ⟨i, hilt⟩
  interval_cases i
  · -- surplusIdx = 0: oppApex1 = v2, oppCap1 = C2; oppApex2 = v3, oppCap2 = C3.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at hfilt1 hfilt2
    have hv1_in_f1 : v1 ∈ D.A.filter (fun x => dist x v2 = d) := by
      rw [hfilt1]; exact CP.v1_mem_C2
    have hv3_in_f1 : v3 ∈ D.A.filter (fun x => dist x v2 = d) := by
      rw [hfilt1]; exact CP.v3_mem_C2
    have hv1_in_f2 : v1 ∈ D.A.filter (fun x => dist x v3 = d) := by
      rw [hfilt2]; exact CP.v1_mem_C3
    have hv2_in_f2 : v2 ∈ D.A.filter (fun x => dist x v3 = d) := by
      rw [hfilt2]; exact CP.v2_mem_C3
    have d12 : dist v1 v2 = d := (Finset.mem_filter.mp hv1_in_f1).2
    have _d32 : dist v3 v2 = d := (Finset.mem_filter.mp hv3_in_f1).2
    have d13 : dist v1 v3 = d := (Finset.mem_filter.mp hv1_in_f2).2
    have d23 : dist v2 v3 = d := (Finset.mem_filter.mp hv2_in_f2).2
    refine ⟨?_, ?_⟩
    · rw [d12, ← d23]
    · rw [d23, ← d13, dist_comm]
  · -- surplusIdx = 1: oppApex1 = v3, oppCap1 = C3; oppApex2 = v1, oppCap2 = C1.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at hfilt1 hfilt2
    have hv1_in_f1 : v1 ∈ D.A.filter (fun x => dist x v3 = d) := by
      rw [hfilt1]; exact CP.v1_mem_C3
    have hv2_in_f1 : v2 ∈ D.A.filter (fun x => dist x v3 = d) := by
      rw [hfilt1]; exact CP.v2_mem_C3
    have hv2_in_f2 : v2 ∈ D.A.filter (fun x => dist x v1 = d) := by
      rw [hfilt2]; exact CP.v2_mem_C1
    have hv3_in_f2 : v3 ∈ D.A.filter (fun x => dist x v1 = d) := by
      rw [hfilt2]; exact CP.v3_mem_C1
    have _d13 : dist v1 v3 = d := (Finset.mem_filter.mp hv1_in_f1).2
    have d23 : dist v2 v3 = d := (Finset.mem_filter.mp hv2_in_f1).2
    have d21 : dist v2 v1 = d := (Finset.mem_filter.mp hv2_in_f2).2
    have d31 : dist v3 v1 = d := (Finset.mem_filter.mp hv3_in_f2).2
    have d12 : dist v1 v2 = d := by rw [dist_comm]; exact d21
    refine ⟨?_, ?_⟩
    · rw [d12, ← d23]
    · rw [d23, ← d31, dist_comm]
  · -- surplusIdx = 2: oppApex1 = v1, oppCap1 = C1; oppApex2 = v2, oppCap2 = C2.
    simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2, hi] at hfilt1 hfilt2
    have hv2_in_f1 : v2 ∈ D.A.filter (fun x => dist x v1 = d) := by
      rw [hfilt1]; exact CP.v2_mem_C1
    have hv3_in_f1 : v3 ∈ D.A.filter (fun x => dist x v1 = d) := by
      rw [hfilt1]; exact CP.v3_mem_C1
    have hv1_in_f2 : v1 ∈ D.A.filter (fun x => dist x v2 = d) := by
      rw [hfilt2]; exact CP.v1_mem_C2
    have hv3_in_f2 : v3 ∈ D.A.filter (fun x => dist x v2 = d) := by
      rw [hfilt2]; exact CP.v3_mem_C2
    have _d21 : dist v2 v1 = d := (Finset.mem_filter.mp hv2_in_f1).2
    have d31 : dist v3 v1 = d := (Finset.mem_filter.mp hv3_in_f1).2
    have d12 : dist v1 v2 = d := (Finset.mem_filter.mp hv1_in_f2).2
    have d32 : dist v3 v2 = d := (Finset.mem_filter.mp hv3_in_f2).2
    have d23 : dist v2 v3 = d := by rw [dist_comm]; exact d32
    have d13 : dist v1 v3 = d := by rw [dist_comm]; exact d31
    refine ⟨?_, ?_⟩
    · rw [d12, ← d23]
    · rw [d23, ← d13, dist_comm]

/-- **Assemble `U2Statement` from the two load-bearing geometric subpackages.**

Once the full-distance-class theorem `U2.B` and the Apollonius-arc theorem
`U2.C` are available, the equilateral MEC conclusion `U2.A` is automatic by
`u2EquilateralMECTriangle_of_u2FullDistanceClasses`.  This packages that
theorem-facing assembly for downstream U3/U5 consumers.

Superseded by `u2Statement_of_u2FullDistanceClasses`: since the
apex-circle restatement (2026-05-28) made `U2.C` an unconditional theorem
(`u2ApolloniusArcs_proof`), the `hArc` hypothesis is redundant. Kept for
back-compatibility with any caller still threading `U2ApolloniusArcs`. -/
theorem u2Statement_of_u2FullDistanceClasses_and_u2ApolloniusArcs
    (D : CounterexampleData) (hFD : U2FullDistanceClasses D)
    (hArc : U2ApolloniusArcs D) :
    U2Statement D := by
  exact ⟨u2EquilateralMECTriangle_of_u2FullDistanceClasses D hFD, hFD, hArc⟩

/-- **Assemble `U2Statement` from `U2.B` alone** (apex-circle restatement,
2026-05-28).

`U2.C` (`U2ApolloniusArcs`) is now an unconditional theorem
(`u2ApolloniusArcs_proof`), so it no longer needs to be carried as a
hypothesis: `U2FullDistanceClasses` (U2.B) by itself yields the full
`U2Statement`. Downstream constructors should prefer this form. -/
theorem u2Statement_of_u2FullDistanceClasses
    (D : CounterexampleData) (hFD : U2FullDistanceClasses D) :
    U2Statement D :=
  ⟨u2EquilateralMECTriangle_of_u2FullDistanceClasses D hFD, hFD,
    u2ApolloniusArcs_proof D⟩

end Problem97
