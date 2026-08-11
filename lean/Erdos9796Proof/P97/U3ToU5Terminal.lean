/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U3ToU5DangerousTriple
import Erdos9796Proof.P97.U5GlobalIncidenceSupport
import Erdos9796Proof.P97.U5FiniteExtraction

/-!
# U3 localized packet to U5 terminal contradiction

This file contains the non-circular terminal adapters from a localized U3
no-q-free packet to the U5 finite-audit output.  The load-bearing U5 input is
explicit: a selected candidate together with audited bounded support, or the
selected-class confined payload that converts to that support.
-/

open scoped EuclideanGeometry

namespace Problem97

/-- U5-facing name for the current native residual refinement candidate.

This is the best theorem-facing replacement shell currently available for
`U5StrictOrderViolation D q p`: it is a proposition only in the native U5
variables `D,q,p`, but expands to the exact local packet consumed by the
U3-to-U5 terminal contradiction. -/
def U5ResidualLocalPayloadCandidate
    (D : CounterexampleData) (q p : ℝ²) : Prop :=
  ∃ (T : Finset ℝ²) (u : ℝ²),
    U5DangerousTriple D q p T ∧
      U5SelectedCandidateSkeleton D q p T u ∧
      (U5SameCircleExport D q p T u ∨
        Nonempty (U5BoundedAuditSupport D q p T u))

/-- Refined 4C surface with the local residual payload shell in place of the
vacuous `U5StrictOrderViolation` placeholder.

This is the current strongest honest theorem-facing replacement target for the
positive-dimensional arm: after fixing the residual center `p`, the open native
content is exactly a q-free four-class at `p` or the local same-circle /
audited-support payload consumed below. -/
def U5_4C_localPayload (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    11 ≤ D.A.card →
    ∀ q ∈ D.packet.surplusCap, ∀ p ∈ D.A,
      muP (D.skeleton q) p = 3 →
      HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
      U5ResidualLocalPayloadCandidate D q p

/-- Refined U5 combined statement with the local residual payload shell in
place of `U5StrictOrderViolation`.

This is the honest theorem-facing replacement surface below the current U5
assembly: the residual branch still carries the same `p` and triple-circle
data, but the open final disjunct is now the local payload shell rather than
the vacuous order-violation placeholder. -/
def U5ModeADeletionLocalPayload (D : CounterexampleData) : Prop :=
  D.IsM44 → U2Statement D → U5ModeA D →
    ∀ q ∈ D.packet.surplusCap,
      IsRemovableVertex D.A q ∨
      ∃ p ∈ D.A,
        p ∉ ({D.packet.triangle.v1, D.packet.triangle.v2,
              D.packet.triangle.v3, q} : Finset ℝ²) ∧
        muP (D.skeleton q) p = 3 ∧
        (∃ r : ℝ, 0 < r ∧ dist p q = r ∧
          (((D.skeleton q).erase p).filter (fun y => dist p y = r)).card = 3) ∧
        ( HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p ∨
          U5ResidualLocalPayloadCandidate D q p )

/-- The refined local-payload U5 statement forgets to the current
`U5ModeADeletion` interface.

This is only a compatibility adapter: since `U5StrictOrderViolation := True`,
any proof of the refined statement also proves the current vacuous statement.
The refined statement is still strictly more informative as a theorem source. -/
theorem U5ModeADeletionLocalPayload.toModeADeletion
    {D : CounterexampleData}
    (h : U5ModeADeletionLocalPayload D) :
    U5ModeADeletion D := by
  intro hM44 hU2 hModeA q hq
  rcases h hM44 hU2 hModeA q hq with hrem | hres
  · exact Or.inl hrem
  · rcases hres with ⟨p, hpA, hpnot, hmu, htriple, hfinal⟩
    refine Or.inr ⟨p, hpA, hpnot, hmu, htriple, ?_⟩
    rcases hfinal with hqfree | hpayload
    · exact Or.inl hqfree
    · exact Or.inr trivial

/-- An audited bounded-support payload at a concrete dangerous triple and
selected candidate realizes the native residual refinement candidate. -/
theorem u5ResidualLocalPayloadCandidate_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    U5ResidualLocalPayloadCandidate D q p :=
  ⟨T, u, htriple, hsel, Or.inr ⟨hsupport⟩⟩

/-- A direct same-circle export at a concrete dangerous triple and selected
candidate realizes the native residual refinement candidate. -/
theorem u5ResidualLocalPayloadCandidate_of_sameCircleExport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsame : U5SameCircleExport D q p T u) :
    U5ResidualLocalPayloadCandidate D q p :=
  ⟨T, u, htriple, hsel, Or.inl hsame⟩

/-- A confined selected-class audit payload also realizes the native residual
refinement candidate, via its audited-support conversion. -/
theorem u5ResidualLocalPayloadCandidate_of_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    U5ResidualLocalPayloadCandidate D q p :=
  u5ResidualLocalPayloadCandidate_of_auditedSupport htriple hsel
    H.toAuditedSupport

/-- The native residual refinement candidate can be stated using the smaller
confined-payload presentation instead of audited support. -/
theorem u5ResidualLocalPayloadCandidate_iff_sameCircleOrConfinedK4AuditPayload
    {D : CounterexampleData} {q p : ℝ²} :
    U5ResidualLocalPayloadCandidate D q p ↔
      ∃ (T : Finset ℝ²) (u : ℝ²),
        U5DangerousTriple D q p T ∧
          U5SelectedCandidateSkeleton D q p T u ∧
          (U5SameCircleExport D q p T u ∨
            Nonempty (U5ConfinedK4AuditPayload D q p T u)) := by
  constructor
  · rintro ⟨T, u, htriple, hsel, hout⟩
    rcases hout with hsame | haudit
    · exact ⟨T, u, htriple, hsel, Or.inl hsame⟩
    · rcases haudit with ⟨H⟩
      exact ⟨T, u, htriple, hsel, Or.inr ⟨U5ConfinedK4AuditPayload.ofAudit H⟩⟩
  · rintro ⟨T, u, htriple, hsel, hout⟩
    rcases hout with hsame | hconf
    · exact u5ResidualLocalPayloadCandidate_of_sameCircleExport
        htriple hsel hsame
    · rcases hconf with ⟨H⟩
      exact u5ResidualLocalPayloadCandidate_of_confinedK4AuditPayload
        htriple hsel H

namespace U5DangerousTriple

/-- In a configuration with more than nine points, a dangerous triple leaves at
least one q-deleted, center-erased point outside its three-point carrier. -/
theorem exists_selectedCandidateSkeleton_of_card_gt_nine
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    (htriple : U5DangerousTriple D q p T)
    (hcard : 9 < D.A.card) :
    ∃ u : ℝ², U5SelectedCandidateSkeleton D q p T u := by
  classical
  let S : Finset ℝ² := (D.skeleton q).erase p
  let R : Finset ℝ² := S \ T
  have hAcard : 10 ≤ D.A.card := by
    omega
  have hp_mem_erase_q : p ∈ D.A.erase q :=
    Finset.mem_erase.mpr ⟨htriple.p_ne_q, htriple.p_mem⟩
  have hS_card : 8 ≤ S.card := by
    have hqcard : (D.A.erase q).card = D.A.card - 1 :=
      Finset.card_erase_of_mem htriple.q_mem
    have hpcard :
        ((D.A.erase q).erase p).card = (D.A.erase q).card - 1 :=
      Finset.card_erase_of_mem hp_mem_erase_q
    have hS_eq : S = (D.A.erase q).erase p := by
      simp [S, CounterexampleData.skeleton]
    rw [hS_eq, hpcard, hqcard]
    omega
  have hR_card : 5 ≤ R.card := by
    have hinter : T ∩ S = T := Finset.inter_eq_left.mpr htriple.T_subset
    have hcardR : R.card = S.card - T.card := by
      calc
        R.card = (S \ T).card := rfl
        _ = S.card - (T ∩ S).card := by rw [Finset.card_sdiff]
        _ = S.card - T.card := by rw [hinter]
    rw [hcardR, htriple.T_card]
    omega
  have hR_pos : 0 < R.card := by omega
  rcases Finset.card_pos.mp hR_pos with ⟨u, huR⟩
  exact
    ⟨u,
      { candidate_mem := (Finset.mem_sdiff.mp huR).1
        candidate_notin_T := (Finset.mem_sdiff.mp huR).2 }⟩

/-- In an `(m,4,4)` configuration, a dangerous triple leaves at least one
q-deleted, center-erased point outside its three-point carrier. -/
theorem exists_selectedCandidateSkeleton_of_isM44
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    (hM44 : D.IsM44)
    (htriple : U5DangerousTriple D q p T) :
    ∃ u : ℝ², U5SelectedCandidateSkeleton D q p T u := by
  have hcard_gt : 9 < D.A.card := by
    have hsurplus := CounterexampleData.IsM44.surplus_card_ge_five hM44
    have hcard := card_eq_of_isM44 hM44
    omega
  exact htriple.exists_selectedCandidateSkeleton_of_card_gt_nine hcard_gt

end U5DangerousTriple

/-- The bounded six-label frame surrounding a localized fixed triple.

The dangerous triple, selected candidate, and two auxiliary points are all
explicit.  Exactness of the localized radius class forces the three new points
off that circle.  No q-deleted K4 confinement or Mode A input is included. -/
structure U3FixedTripleAuditFrame
    (D : CounterexampleData) (q p t1 t2 t3 : ℝ²) where
  u : ℝ²
  a0 : ℝ²
  a1 : ℝ²
  dangerous : U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²)
  selected :
    U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u
  selected_off_circle : dist p u ≠ dist p q
  a0_mem : a0 ∈ (D.skeleton q).erase p
  a1_mem : a1 ∈ (D.skeleton q).erase p
  a0_notin_base : a0 ∉ insert u ({t1, t2, t3} : Finset ℝ²)
  a1_notin_base :
    a1 ∉ insert u (insert a0 ({t1, t2, t3} : Finset ℝ²))
  a0_off_circle : dist p a0 ≠ dist p q
  a1_off_circle : dist p a1 ≠ dist p q

namespace U3FixedTripleAuditFrame

/-- Every center in the bounded frame has the exact global-K4 deletion
dichotomy: a four-point q-deleted class or a three-point q-critical class.
This does not assert bounded-support confinement of the selected class. -/
theorem auditCenter_qDeleted_or_qCritical
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1) :
    (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧ B.card = 4) ∨
      ∃ B : Finset ℝ²,
        Nonempty (U5QCriticalTripleClass D q x B) ∧ B.card = 3 := by
  have hxSkeleton : x ∈ D.skeleton q :=
    H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem hx
  rcases U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
      H.dangerous.q_mem hxSkeleton with hdeleted | hcritical
  · exact Or.inl hdeleted
  · exact Or.inr
      (U5QCriticalTripleClass.exists_card_three_of_qCritical hcritical)

/-- Exact-shell form of the audit-center deletion dichotomy.  In the critical
arm this retains equality with the full ambient four-point radius class,
rather than packaging only the three surviving deleted points. -/
theorem auditCenter_qDeleted_or_criticalFourShell
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1) :
    (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧ B.card = 4) ∨
      Nonempty (CriticalFourShell D.A q x) := by
  have hxSkeleton : x ∈ D.skeleton q :=
    H.dangerous.audit_center_mem_skeleton H.selected H.a0_mem H.a1_mem hx
  rcases U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
      H.dangerous.q_mem hxSkeleton with hdeleted | hcritical
  · exact Or.inl hdeleted
  · exact Or.inr
      (U5QCriticalTripleClass.exists_criticalFourShell_of_qCritical
        H.dangerous.q_mem hxSkeleton hcritical)

/-- Rowwise form of `auditCenter_qDeleted_or_qCritical` for the entire bounded
audit center set. -/
theorem auditCenters_qDeleted_or_qCritical
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1,
      (∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x B) ∧ B.card = 4) ∨
        ∃ B : Finset ℝ²,
          Nonempty (U5QCriticalTripleClass D q x B) ∧ B.card = 3 := by
  intro x hx
  exact H.auditCenter_qDeleted_or_qCritical hx

/-- Rowwise exact-shell form of
`auditCenter_qDeleted_or_criticalFourShell`. -/
theorem auditCenters_qDeleted_or_criticalFourShell
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1,
      (∃ B : Finset ℝ²,
        Nonempty (U5QDeletedK4Class D q x B) ∧ B.card = 4) ∨
        Nonempty (CriticalFourShell D.A q x) := by
  intro x hx
  exact H.auditCenter_qDeleted_or_criticalFourShell hx

/-- Every one of the six bounded audit centers is distinct from the dangerous
circle center `p`. -/
theorem auditCenter_ne_dangerousCenter
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1) :
    x ≠ p := by
  rw [U5BoundedAuditCenters] at hx
  rcases Finset.mem_insert.mp hx with rfl | hx
  · exact (Finset.mem_erase.mp H.selected.candidate_mem).1
  rcases Finset.mem_insert.mp hx with rfl | hx
  · exact (Finset.mem_erase.mp H.a0_mem).1
  rcases Finset.mem_insert.mp hx with rfl | hxT
  · exact (Finset.mem_erase.mp H.a1_mem).1
  · exact (Finset.mem_erase.mp (H.dangerous.T_subset hxT)).1

/-- An exact q-deleted four-row at any bounded U3 audit center has at most two
points on the dangerous circle and therefore at least two points off it. -/
theorem qDeletedRow_dangerousCircle_distribution
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²} {B : Finset ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1)
    (K : U5QDeletedK4Class D q x B)
    (hcard : B.card = 4) :
    (B ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card ≤ 2 ∧
      2 ≤ (B \ insert q ({t1, t2, t3} : Finset ℝ²)).card := by
  classical
  have hinter :
      (B ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card ≤ 2 :=
    U5QDeletedK4Class.inter_dangerous_p_circle_card_le_two
      H.dangerous K (H.auditCenter_ne_dangerousCenter hx)
  have hsplit := Finset.card_inter_add_card_sdiff B
    (insert q ({t1, t2, t3} : Finset ℝ²))
  exact ⟨hinter, by omega⟩

/-- An exact critical four-shell at any bounded U3 audit center has at most two
points on the dangerous circle and therefore at least two points off it. -/
theorem criticalFourShell_dangerousCircle_distribution
    {D : CounterexampleData} {q p t1 t2 t3 x : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hx : x ∈ U5BoundedAuditCenters D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (K : CriticalFourShell D.A q x) :
    (K.support ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card ≤ 2 ∧
      2 ≤ (K.support \ insert q
        ({t1, t2, t3} : Finset ℝ²)).card := by
  exact ⟨K.inter_dangerous_p_circle_card_le_two H.dangerous
      (H.auditCenter_ne_dangerousCenter hx),
    K.two_le_sdiff_dangerous_p_circle_card H.dangerous
      (H.auditCenter_ne_dangerousCenter hx)⟩

/-- The exact remaining producer at a fixed-triple audit frame: every bounded
audit row has an exact q-deleted four-class contained in the bounded support. -/
def RowwiseConfinedQDeletedClasses
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) : Prop :=
  ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1,
    ∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧
        B.card = 4 ∧
        B ⊆ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1

/-- Rowwise confined q-deleted classes at a fixed-triple frame assemble the
audited finite bad pattern and are therefore impossible.  This terminal
consumer uses neither `U2Statement` nor `U5ModeA`. -/
theorem false_of_rowwiseConfinedQDeletedClasses
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hclasses : H.RowwiseConfinedQDeletedClasses) : False := by
  let payload :
      U5ConfinedK4AuditPayload D q p ({t1, t2, t3} : Finset ℝ²) H.u :=
    U5ConfinedK4AuditPayload.of_auxAndClasses
      H.a0_mem H.a1_mem H.a0_notin_base H.a1_notin_base
      H.a0_off_circle H.a1_off_circle hclasses
  let audited :
      U5BoundedAuditSupport D q p ({t1, t2, t3} : Finset ℝ²) H.u :=
    payload.toAuditedSupport
  exact U5AuditLabel.false_of_auditedBadPattern
    { dangerous := H.dangerous
      selected := H.selected
      audited_support := audited
      not_same_radius := H.selected_off_circle }

/-- Every fixed-triple audit exposes a concrete next-row obstruction: either
an exact q-deleted four-class leaves the bounded support, or one audit center
has an ambient critical shell through the deleted point.

This is the constructive content of the checked bounded consumer.  It does
not assert that repeated escapes return to a bounded support. -/
theorem exists_qDeleted_escape_or_criticalFourShell
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) :
    ∃ x ∈ U5BoundedAuditCenters D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1,
      (∃ (B : Finset ℝ²) (z : ℝ²),
        Nonempty (U5QDeletedK4Class D q x B) ∧
          B.card = 4 ∧
          z ∈ B ∧
          z ∉ U5BoundedSupport D q p
            ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1) ∨
        Nonempty (CriticalFourShell D.A q x) := by
  classical
  by_contra hnone
  apply H.false_of_rowwiseConfinedQDeletedClasses
  intro x hx
  rcases H.auditCenter_qDeleted_or_criticalFourShell hx with
    hdeleted | hcritical
  · rcases hdeleted with ⟨B, hclass, hcard⟩
    refine ⟨B, hclass, hcard, ?_⟩
    by_contra hnotSubset
    rcases Finset.not_subset.mp hnotSubset with ⟨z, hzB, hzOutside⟩
    exact hnone ⟨x, hx, Or.inl ⟨B, z, hclass, hcard, hzB, hzOutside⟩⟩
  · exact False.elim (hnone ⟨x, hx, Or.inr hcritical⟩)

/-- Shift a U3 audit frame by inserting a new escaping candidate and retaining
the two most recent off-circle candidates as auxiliaries. -/
noncomputable def shiftOfEscape
    {D : CounterexampleData} {q p t1 t2 t3 y : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hy : U5SelectedCandidateSkeleton D q p
      ({t1, t2, t3} : Finset ℝ²) y)
    (hyOff : dist p y ≠ dist p q)
    (hyOutside : y ∉ U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1) :
    U3FixedTripleAuditFrame D q p t1 t2 t3 where
  u := y
  a0 := H.u
  a1 := H.a0
  dangerous := H.dangerous
  selected := hy
  selected_off_circle := hyOff
  a0_mem := H.selected.candidate_mem
  a1_mem := H.a0_mem
  a0_notin_base := by
    intro hu
    rw [Finset.mem_insert] at hu
    rcases hu with huy | huT
    · apply hyOutside
      subst y
      simp [U5BoundedSupport]
    · exact H.selected.candidate_notin_T huT
  a1_notin_base := by
    intro ha0
    simp only [Finset.mem_insert] at ha0
    rcases ha0 with ha0y | ha0u | ha0T
    · apply hyOutside
      subst y
      simp [U5BoundedSupport]
    · exact H.a0_notin_base (by simp [ha0u])
    · apply H.a0_notin_base
      exact Finset.mem_insert.mpr (Or.inr (by
        simpa only [Finset.mem_insert] using ha0T))
  a0_off_circle := H.selected_off_circle
  a1_off_circle := H.a0_off_circle

/-- A critical-shell escape produces a shifted U3 audit frame. -/
theorem exists_shift_of_criticalFourShell_escape
    {D : CounterexampleData} {q p t1 t2 t3 center y : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (K : CriticalFourShell D.A q center)
    (hyK : y ∈ K.support)
    (hyOutside : y ∉ U5BoundedSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    Nonempty (U3FixedTripleAuditFrame D q p t1 t2 t3) := by
  rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
      K hyK hyOutside hexact with ⟨hy, hyOff⟩
  exact ⟨H.shiftOfEscape hy hyOff hyOutside⟩

/-- Every exact-radius U3 frame either advances to a frame whose distinguished
candidate escapes the old bounded support, or exposes a critical shell wholly
confined to that support. This removes the anonymous q-deleted escape arm
without claiming that iterated frame shifts cannot cycle. -/
theorem exists_escaping_shift_or_confinedCriticalFourShell
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    (∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1) ∨
      ∃ x, x ∈ U5BoundedAuditCenters D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 ∧
        ∃ K : CriticalFourShell D.A q x,
          K.support ⊆ U5BoundedSupport D q p
            ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1 := by
  classical
  rcases H.exists_qDeleted_escape_or_criticalFourShell with
    ⟨x, hx, hescape | hshell⟩
  · rcases hescape with ⟨B, y, ⟨K⟩, _hcard, hyB, hyOutside⟩
    rcases H.dangerous.candidate_of_not_mem_boundedSupport
        K hyB hyOutside hexact with ⟨hy, hyOff⟩
    let F' := H.shiftOfEscape hy hyOff hyOutside
    exact Or.inl ⟨F', by
      simpa [F', shiftOfEscape] using hyOutside⟩
  · rcases hshell with ⟨K⟩
    by_cases hconf : K.support ⊆ U5BoundedSupport D q p
        ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
    · exact Or.inr ⟨x, hx, K, hconf⟩
    · rcases Finset.not_subset.mp hconf with ⟨y, hyK, hyOutside⟩
      rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
          K hyK hyOutside hexact with ⟨hy, hyOff⟩
      let F' := H.shiftOfEscape hy hyOff hyOutside
      exact Or.inl ⟨F', by
        simpa [F', shiftOfEscape] using hyOutside⟩

/-- At every center in the bounded U3 audit, either an exact q-deleted row or
an ambient critical four-shell is confined to the current bounded support. -/
def MixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3) : Prop :=
  ∀ x ∈ U5BoundedAuditCenters D q p ({t1, t2, t3} : Finset ℝ²)
      H.u H.a0 H.a1,
    (∃ B : Finset ℝ²,
      Nonempty (U5QDeletedK4Class D q x B) ∧
        B.card = 4 ∧
        B ⊆ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1) ∨
      ∃ K : CriticalFourShell D.A q x,
        K.support ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1

/-- A mixed confined U3 audit projects to the existing q-allowed eight-label
audit interface.

This is a general-cardinality projection: the eight labels name a bounded
subconfiguration of the ambient carrier.  Critical shells are converted to
q-allowed exact-four classes, while q-deleted classes merely forget their
q-free field.  The constructor tag is intentionally forgotten here. -/
theorem MixedConfinedAuditPacket.nonempty_qAllowedAuditSupport
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {H : U3FixedTripleAuditFrame D q p t1 t2 t3}
    (hmixed : H.MixedConfinedAuditPacket) :
    Nonempty (U5QAllowedAuditSupport D q p
      ({t1, t2, t3} : Finset ℝ²) H.u) := by
  classical
  let T : Finset ℝ² := {t1, t2, t3}
  have hexists :
      ∀ x (hx : x ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1),
        Nonempty (Σ B : Finset ℝ²,
          Subtype fun _K : Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T H.u H.a0 H.a1 =>
              B.card = 4) := by
    intro x hx
    rcases hmixed x (by simpa [T] using hx) with
      ⟨B, ⟨K⟩, hcard, hconf⟩ | ⟨K, hconf⟩
    · refine ⟨⟨B, ⟨⟨K.toQAllowedK4Class, ?_⟩, hcard⟩⟩⟩
      intro y hy
      exact Finset.mem_insert.mpr (Or.inr (hconf hy))
    · refine ⟨⟨K.support, ⟨⟨K.toU5QAllowedK4Class, ?_⟩, K.support_card⟩⟩⟩
      intro y hy
      exact Finset.mem_insert.mpr (Or.inr (hconf hy))
  let picked := fun x hx => Classical.choice (hexists x hx)
  let classes :
      ∀ x (hx : x ∈ U5BoundedAuditCenters D q p T H.u H.a0 H.a1),
        Σ B : Finset ℝ²,
          Subtype fun _K : U5QAllowedK4Class D x B =>
            B ⊆ U5QAllowedBoundedSupport D q p T H.u H.a0 H.a1 :=
    fun x hx => ⟨(picked x hx).1, (picked x hx).2.1⟩
  refine ⟨U5QAllowedAuditSupport.of_selectedClasses
    H.a0 H.a1 H.a0_mem H.a1_mem ?_ ?_
    H.a0_off_circle H.a1_off_circle classes ?_⟩
  · simpa [T] using H.a0_notin_base
  · simpa [T] using H.a1_notin_base
  · intro x hx
    exact (picked x hx).2.2

/-- An exact-radius U3 frame either shifts beyond its current bounded support,
or all six audited centers admit a confined q-deleted/critical-shell row.

This is finite ingress for the mixed-row census, not a contradiction: a
critical shell contains `q` and therefore does not directly populate the
existing q-deleted bounded-support consumer. -/
theorem exists_escaping_shift_or_mixedConfinedAuditPacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (H : U3FixedTripleAuditFrame D q p t1 t2 t3)
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    (∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
      F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
        H.u H.a0 H.a1) ∨
      H.MixedConfinedAuditPacket := by
  classical
  by_cases hescape :
      ∃ F' : U3FixedTripleAuditFrame D q p t1 t2 t3,
        F'.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
          H.u H.a0 H.a1
  · exact Or.inl hescape
  · refine Or.inr ?_
    intro x hx
    rcases H.auditCenter_qDeleted_or_criticalFourShell hx with
      hdeleted | hshell
    · rcases hdeleted with ⟨B, hclass, hcard⟩
      by_cases hconf : B ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
      · exact Or.inl ⟨B, hclass, hcard, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyB, hyOutside⟩
        rcases hclass with ⟨K⟩
        rcases H.dangerous.candidate_of_not_mem_boundedSupport
            K hyB hyOutside hexact with ⟨hy, hyOff⟩
        let F' := H.shiftOfEscape hy hyOff hyOutside
        exact False.elim (hescape ⟨F', by
          simpa [F', shiftOfEscape] using hyOutside⟩)
    · rcases hshell with ⟨K⟩
      by_cases hconf : K.support ⊆ U5BoundedSupport D q p
          ({t1, t2, t3} : Finset ℝ²) H.u H.a0 H.a1
      · exact Or.inr ⟨K, hconf⟩
      · rcases Finset.not_subset.mp hconf with ⟨y, hyK, hyOutside⟩
        rcases H.dangerous.candidate_of_criticalFourShell_not_mem_boundedSupport
            K hyK hyOutside hexact with ⟨hy, hyOff⟩
        let F' := H.shiftOfEscape hy hyOff hyOutside
        exact False.elim (hescape ⟨F', by
          simpa [F', shiftOfEscape] using hyOutside⟩)

end U3FixedTripleAuditFrame

namespace U3LocalizedNoQFreePacket

/-- The exact local U5 residual payload candidate at a fixed center `p`.

This is the weakest theorem-facing native packet currently visible below
`U5ModeADeletion`: a localized no-q-free packet at `p`, a concrete dangerous
triple, a selected candidate outside that triple, and the final local U5
payload disjunct `same-circle OR audited support`. -/
def localSameCircleOrAuditedSupport
    (D : CounterexampleData) (q p : ℝ²) : Prop :=
  ∃ (T : Finset ℝ²) (u : ℝ²),
    U5DangerousTriple D q p T ∧
      U5SelectedCandidateSkeleton D q p T u ∧
      (U5SameCircleExport D q p T u ∨
        Nonempty (U5BoundedAuditSupport D q p T u))

/-- Any dangerous triple at a localized no-q-free center is the entire
q-deleted radius class at radius `dist p q`; otherwise that radius class would
give a q-free K4 witness, contradicting the localized packet. -/
theorem exact_radius_class_card_eq_three_of_dangerousTriple
    {D : CounterexampleData} {q p : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (htriple : U5DangerousTriple D q p T) :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3 := by
  let C : Finset ℝ² := ((D.skeleton q).erase p).filter
    fun y => dist p y = dist p q
  have hT_subset_C : T ⊆ C := by
    intro x hx
    exact Finset.mem_filter.mpr
      ⟨htriple.T_subset hx, htriple.T_same_radius x hx⟩
  have hthree_le : 3 ≤ C.card := by
    have hle := Finset.card_le_card hT_subset_C
    have hTcard : T.card = 3 := htriple.T_card
    omega
  have hnot_four : ¬ 4 ≤ C.card := by
    intro hfour
    exact P.no_qfree
      ⟨dist p q, htriple.q_radius_pos, by simpa [C] using hfour⟩
  have hle_three : C.card ≤ 3 := by
    omega
  exact le_antisymm hle_three hthree_le

/-- The fixed U3 triple is the entire q-deleted radius class at radius
`dist p q`; otherwise it would give a q-free K4 witness, contradicting the
localized packet. -/
theorem exact_radius_class_card_eq_three
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (F : U3FixedTriplePacket D q p t1 t2 t3) :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3 :=
  P.exact_radius_class_card_eq_three_of_dangerousTriple
    (u5DangerousTriple_of_u3FixedTriplePacket F)

/-- At a localized no-q-free center, every selected skeleton candidate outside
a dangerous triple is off the dangerous circle. -/
theorem selected_off_circle_of_dangerousTriple
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u) :
    dist p u ≠ dist p q :=
  htriple.selected_off_circle_of_exact hsel
    (P.exact_radius_class_card_eq_three_of_dangerousTriple htriple)

/-- A localized fixed triple in a configuration with more than nine points
supplies the complete bounded audit frame before rowwise q-deleted K4
confinement is imposed. -/
theorem exists_fixedTripleAuditFrame_of_card_gt_nine
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (F : U3FixedTriplePacket D q p t1 t2 t3)
    (hcard : 9 < D.A.card) :
    Nonempty (U3FixedTripleAuditFrame D q p t1 t2 t3) := by
  let htriple :
      U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²) :=
    u5DangerousTriple_of_u3FixedTriplePacket F
  rcases htriple.exists_selectedCandidateSkeleton_of_card_gt_nine hcard with
    ⟨u, hselected⟩
  have hexact := P.exact_radius_class_card_eq_three F
  have huoff := P.selected_off_circle_of_dangerousTriple htriple hselected
  rcases htriple.exists_two_off_circle_aux_of_card_gt_nine hcard hselected hexact with
    ⟨a0, a1, ha0mem, ha1mem, ha0not, ha1not, ha0off, ha1off⟩
  exact
    ⟨{ u := u
       a0 := a0
       a1 := a1
       dangerous := htriple
       selected := hselected
       selected_off_circle := huoff
       a0_mem := ha0mem
       a1_mem := ha1mem
       a0_notin_base := ha0not
       a1_notin_base := ha1not
       a0_off_circle := ha0off
       a1_off_circle := ha1off }⟩

/-- Compatibility form of `exists_fixedTripleAuditFrame_of_card_gt_nine` for
an `(m,4,4)` configuration. -/
theorem exists_fixedTripleAuditFrame
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (F : U3FixedTriplePacket D q p t1 t2 t3)
    (hM44 : D.IsM44) :
    Nonempty (U3FixedTripleAuditFrame D q p t1 t2 t3) := by
  have hcard : 9 < D.A.card := by
    have hsurplus := CounterexampleData.IsM44.surplus_card_ge_five hM44
    have hcard_eq := card_eq_of_isM44 hM44
    omega
  exact P.exists_fixedTripleAuditFrame_of_card_gt_nine F hcard

/-- At a localized no-q-free center, a selected skeleton candidate cannot also
be a same-circle export. -/
theorem not_sameCircleExport_of_dangerousTriple
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u) :
    ¬ U5SameCircleExport D q p T u := by
  intro hsame
  exact (P.selected_off_circle_of_dangerousTriple htriple hsel) hsame.2

/-- At a localized no-q-free center, the native local residual shell has no
live same-circle branch.  It is equivalent to producing audited bounded
support for the selected candidate. -/
theorem localSameCircleOrAuditedSupport_iff_auditedSupport
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p) :
    localSameCircleOrAuditedSupport D q p ↔
      ∃ (T : Finset ℝ²) (u : ℝ²),
        U5DangerousTriple D q p T ∧
          U5SelectedCandidateSkeleton D q p T u ∧
          Nonempty (U5BoundedAuditSupport D q p T u) := by
  constructor
  · rintro ⟨T, u, htriple, hsel, hout⟩
    rcases hout with hsame | hsupport
    · exact False.elim
        ((P.not_sameCircleExport_of_dangerousTriple htriple hsel) hsame)
    · exact ⟨T, u, htriple, hsel, hsupport⟩
  · rintro ⟨T, u, htriple, hsel, hsupport⟩
    exact ⟨T, u, htriple, hsel, Or.inr hsupport⟩

/-- A same-circle selected candidate would itself be a q-free fourth witness,
contradicting the localized no-q-free packet. -/
theorem false_of_sameCircleExport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsame : U5SameCircleExport D q p T u) :
    False :=
  P.no_qfree
    (u5QFreeWitness_hasNEquidistantPointsAt htriple
      { selected := hsel
        same_circle := hsame })

/-- Audited bounded U5 support forces a q-free fourth witness by the finite
audit, contradicting the localized no-q-free packet. -/
theorem false_of_auditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hsupport : U5BoundedAuditSupport D q p T u) :
    False :=
  P.no_qfree
    (u5AuditedSupport_hasNEquidistantPointsAt
      hM44 hU2 hModeA htriple hsel hsupport)

/-- The exact local U5 terminal payload shape is contradictory.

For a localized no-q-free packet, once a selected candidate is fixed, either
same-circle export or actual audited support already closes the branch.  This
is the theorem-facing consumer for any refinement of `U5StrictOrderViolation`
that is expressed in the native `q,p,T,u` variables. -/
theorem false_of_sameCircleOrAuditedSupport
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (hout : U5SameCircleExport D q p T u ∨
      Nonempty (U5BoundedAuditSupport D q p T u)) :
    False := by
  rcases hout with hsame | hsupport
  · exact P.false_of_sameCircleExport htriple hsel hsame
  · rcases hsupport with ⟨hsupport⟩
    exact P.false_of_auditedSupport hM44 hU2 hModeA htriple hsel hsupport

/-- The named local residual payload candidate is contradictory.

This packages the current best refinement target for `U5StrictOrderViolation`
into a single proposition over the native U5 variables `q,p`. -/
theorem false_of_localSameCircleOrAuditedSupport
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (hpayload : localSameCircleOrAuditedSupport D q p) :
    False := by
  rcases (P.localSameCircleOrAuditedSupport_iff_auditedSupport.mp hpayload) with
    ⟨T, u, htriple, hsel, hsupport⟩
  rcases hsupport with ⟨hsupport⟩
  exact P.false_of_auditedSupport hM44 hU2 hModeA htriple hsel hsupport

/-- A selected-class confined payload is enough for the same terminal
contradiction, via its audited-support conversion. -/
theorem false_of_confinedK4AuditPayload
    {D : CounterexampleData} {q p u : ℝ²} {T : Finset ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (htriple : U5DangerousTriple D q p T)
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (H : U5ConfinedK4AuditPayload D q p T u) :
    False :=
  P.no_qfree
    (u5ConfinedK4AuditPayload_hasNEquidistantPointsAt
      hM44 hU2 hModeA htriple hsel H)

/-- Fixed-triple convenience form of `false_of_auditedSupport`. -/
theorem false_of_fixedTriple_auditedSupport
    {D : CounterexampleData} {q p t1 t2 t3 u : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (F : U3FixedTriplePacket D q p t1 t2 t3)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (hsel :
      U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u)
    (hsupport : U5BoundedAuditSupport D q p ({t1, t2, t3} : Finset ℝ²) u) :
    False :=
  P.false_of_auditedSupport hM44 hU2 hModeA
    (u5DangerousTriple_of_u3FixedTriplePacket F) hsel hsupport

end U3LocalizedNoQFreePacket

/-- At a localized no-q-free center, `U5ResidualLocalPayloadCandidate` reduces
to audited bounded support; the same-circle disjunct is impossible there. -/
theorem u5ResidualLocalPayloadCandidate_iff_auditedSupport_of_noQFree
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p) :
    U5ResidualLocalPayloadCandidate D q p ↔
      ∃ (T : Finset ℝ²) (u : ℝ²),
        U5DangerousTriple D q p T ∧
          U5SelectedCandidateSkeleton D q p T u ∧
          Nonempty (U5BoundedAuditSupport D q p T u) := by
  simpa [U5ResidualLocalPayloadCandidate,
    U3LocalizedNoQFreePacket.localSameCircleOrAuditedSupport] using
    P.localSameCircleOrAuditedSupport_iff_auditedSupport

/-- At a localized no-q-free center, the residual payload candidate is also
equivalent to the weaker confined selected-class payload presentation. -/
theorem u5ResidualLocalPayloadCandidate_iff_confinedK4AuditPayload_of_noQFree
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p) :
    U5ResidualLocalPayloadCandidate D q p ↔
      ∃ (T : Finset ℝ²) (u : ℝ²),
        U5DangerousTriple D q p T ∧
          U5SelectedCandidateSkeleton D q p T u ∧
          Nonempty (U5ConfinedK4AuditPayload D q p T u) := by
  constructor
  · intro hpayload
    rcases (u5ResidualLocalPayloadCandidate_iff_auditedSupport_of_noQFree P).mp
        hpayload with
      ⟨T, u, htriple, hsel, hsupport⟩
    rcases hsupport with ⟨hsupport⟩
    exact ⟨T, u, htriple, hsel, ⟨U5ConfinedK4AuditPayload.ofAudit hsupport⟩⟩
  · rintro ⟨T, u, htriple, hsel, hpayload⟩
    rcases hpayload with ⟨H⟩
    exact u5ResidualLocalPayloadCandidate_of_confinedK4AuditPayload
      htriple hsel H

/-- The U5-facing residual refinement candidate is contradictory at a localized
no-q-free center. -/
theorem false_of_u5ResidualLocalPayloadCandidate
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (hpayload : U5ResidualLocalPayloadCandidate D q p) :
    False := by
  simpa [U5ResidualLocalPayloadCandidate,
    U3LocalizedNoQFreePacket.localSameCircleOrAuditedSupport] using
    P.false_of_localSameCircleOrAuditedSupport hM44 hU2 hModeA hpayload

/-- The smaller native residual shell using confined payload instead of
audited support is already contradictory at a localized no-q-free center. -/
theorem false_of_sameCircleOrConfinedK4AuditPayload
    {D : CounterexampleData} {q p : ℝ²}
    (P : U3LocalizedNoQFreePacket D q p)
    (hM44 : D.IsM44) (hU2 : U2Statement D) (hModeA : U5ModeA D)
    (hpayload :
      ∃ (T : Finset ℝ²) (u : ℝ²),
        U5DangerousTriple D q p T ∧
          U5SelectedCandidateSkeleton D q p T u ∧
          (U5SameCircleExport D q p T u ∨
            Nonempty (U5ConfinedK4AuditPayload D q p T u))) :
    False :=
  false_of_u5ResidualLocalPayloadCandidate P hM44 hU2 hModeA
    ((u5ResidualLocalPayloadCandidate_iff_sameCircleOrConfinedK4AuditPayload).2
      hpayload)

end Problem97
