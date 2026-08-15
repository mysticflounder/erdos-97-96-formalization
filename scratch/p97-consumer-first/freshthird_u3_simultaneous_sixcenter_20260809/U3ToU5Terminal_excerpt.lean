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
