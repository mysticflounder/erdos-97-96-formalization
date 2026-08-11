/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.U3EscapingAuditStep

/-!
# Finite cycles of escaping U3 audit frames

The frame remembers three carrier points, while the remaining fields are
proof data.  Since all three points lie in `D.A`, the frame is finite.  An
escaping step shifts the two auxiliary coordinates and places the fresh
candidate in the first coordinate; this rules out cycles of lengths one,
two, and three.  The final theorem is the finite-orbit residual: an infinite
step sequence contains a genuine step cycle of period at least four.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace U3EscapingAuditCycle

abbrev Frame {D : CounterexampleData} {q p t1 t2 t3 : ℝ²} :=
  U3FixedTripleAuditFrame D q p t1 t2 t3

noncomputable def frameKey
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)) :
    (↥D.A) × ((↥D.A) × ↥D.A) :=
  let hu : F.u ∈ D.A := by
    have hq : F.u ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using
        (Finset.mem_erase.mp F.selected.candidate_mem).2
    exact (Finset.mem_erase.mp hq).2
  let ha0 : F.a0 ∈ D.A := by
    have hq : F.a0 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using
        (Finset.mem_erase.mp F.a0_mem).2
    exact (Finset.mem_erase.mp hq).2
  let ha1 : F.a1 ∈ D.A := by
    have hq : F.a1 ∈ D.A.erase q := by
      simpa [CounterexampleData.skeleton] using
        (Finset.mem_erase.mp F.a1_mem).2
    exact (Finset.mem_erase.mp hq).2
  (⟨F.u, hu⟩, (⟨F.a0, ha0⟩, ⟨F.a1, ha1⟩))

theorem frameKey_injective
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²} :
    Function.Injective (@frameKey D q p t1 t2 t3) := by
  intro F G h
  have hu : F.u = G.u := congrArg (fun z => z.1.1) h
  have ha0 : F.a0 = G.a0 := congrArg (fun z => z.2.1.1) h
  have ha1 : F.a1 = G.a1 := congrArg (fun z => z.2.2.1) h
  cases F
  cases G
  simp_all

instance frame_finite
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²} :
    Finite (Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)) :=
  Finite.of_injective (@frameKey D q p t1 t2 t3) frameKey_injective

theorem step_a0_eq
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : G.a0 = F.u := by
  cases h <;> rfl

theorem step_a1_eq
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : G.a1 = F.a0 := by
  cases h <;> rfl

theorem step_u_fresh
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) :
    G.u ∉ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1 := by
  cases h with
  | qDeleted center hcenter B K hcard y hyB hy hyOff hyOutside =>
      simpa [U3FixedTripleAuditFrame.shiftOfEscape] using hyOutside
  | criticalFourShell center hcenter K y hyK hy hyOff hyOutside =>
      simpa [U3FixedTripleAuditFrame.shiftOfEscape] using hyOutside

/- ## Source-faithful projection of an escaping step -/

/-- The two kinds of exact four-row which can source an escaping audit step. -/
inductive EscapeSourceMode where
  | qDeleted
  | criticalFourShell
  deriving DecidableEq

/-- Typed row provenance for one escaping step.  In the q-deleted arm this
retains the actual selected class and its exact-cardinality proof; in the shell
arm it retains the actual exact critical shell. -/
inductive EscapeSourceRow
    (D : CounterexampleData) (q center : ℝ²) : Type
  | qDeleted
      (support : Finset ℝ²)
      (witness : U5QDeletedK4Class D q center support)
      (support_card : support.card = 4)
  | criticalFourShell
      (witness : CriticalFourShell D.A q center)

namespace EscapeSourceRow

def mode
    {D : CounterexampleData} {q center : ℝ²}
    (R : EscapeSourceRow D q center) : EscapeSourceMode :=
  match R with
  | .qDeleted _ _ _ => .qDeleted
  | .criticalFourShell _ => .criticalFourShell

def support
    {D : CounterexampleData} {q center : ℝ²}
    (R : EscapeSourceRow D q center) : Finset ℝ² :=
  match R with
  | .qDeleted B _ _ => B
  | .criticalFourShell K => K.support

theorem support_card
    {D : CounterexampleData} {q center : ℝ²}
    (R : EscapeSourceRow D q center) : R.support.card = 4 := by
  cases R with
  | qDeleted B K hcard => exact hcard
  | criticalFourShell K => exact K.support_card

theorem q_mem_support_iff
    {D : CounterexampleData} {q center : ℝ²}
    (R : EscapeSourceRow D q center) :
    q ∈ R.support ↔ R.mode = .criticalFourShell := by
  cases R with
  | qDeleted B K hcard => simp [support, mode, K.q_not_mem]
  | criticalFourShell K => simp [support, mode, K.q_mem_support]

end EscapeSourceRow

/-- The data-bearing part of the source of an escaping step. -/
structure EscapeSourceData
    (D : CounterexampleData) (q : ℝ²) where
  center : ℝ²
  row : EscapeSourceRow D q center

namespace EscapeSourceData

def mode
    {D : CounterexampleData} {q : ℝ²}
    (S : EscapeSourceData D q) : EscapeSourceMode :=
  S.row.mode

def support
    {D : CounterexampleData} {q : ℝ²}
    (S : EscapeSourceData D q) : Finset ℝ² :=
  S.row.support

theorem support_card
    {D : CounterexampleData} {q : ℝ²}
    (S : EscapeSourceData D q) : S.support.card = 4 :=
  S.row.support_card

end EscapeSourceData

/-- A typed source row is attached to a particular step when its center is one
of that frame's six audit centers, the successor's new point belongs to the
row, and the row satisfies the source-proved dangerous-circle distribution.

The `U3EscapingAuditStep` kept alongside this relation retains the selected,
off-circle, freshness, and exact `shiftOfEscape` facts. -/
structure IsEscapeSourceFor
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F G : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3))
    (S : EscapeSourceData D q) : Prop where
  center_mem : S.center ∈ U5BoundedAuditCenters D q p
    ({t1, t2, t3} : Finset ℝ²) F.u F.a0 F.a1
  target_mem : G.u ∈ S.support
  dangerous_overlap :
    (S.support ∩ insert q ({t1, t2, t3} : Finset ℝ²)).card ≤ 2
  two_off_dangerous_circle :
    2 ≤ (S.support \ insert q ({t1, t2, t3} : Finset ℝ²)).card

/-- Every source-faithful escaping step projects to a typed exact-four source
packet without forgetting its center, target incidence, or distribution. -/
theorem step_exists_escapeSourceData
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) :
    ∃ S : EscapeSourceData D q, IsEscapeSourceFor F G S := by
  cases h with
  | qDeleted center hcenter B K hcard y hyB hy hyOff hyOutside =>
      refine ⟨⟨center, .qDeleted B K hcard⟩, hcenter, ?_, ?_, ?_⟩
      · simpa [EscapeSourceData.support, EscapeSourceRow.support,
          U3FixedTripleAuditFrame.shiftOfEscape] using hyB
      · simpa [EscapeSourceData.support, EscapeSourceRow.support] using
          (F.qDeletedRow_dangerousCircle_distribution hcenter K hcard).1
      · simpa [EscapeSourceData.support, EscapeSourceRow.support] using
          (F.qDeletedRow_dangerousCircle_distribution hcenter K hcard).2
  | criticalFourShell center hcenter K y hyK hy hyOff hyOutside =>
      refine ⟨⟨center, .criticalFourShell K⟩, hcenter, ?_, ?_, ?_⟩
      · simpa [EscapeSourceData.support, EscapeSourceRow.support,
          U3FixedTripleAuditFrame.shiftOfEscape] using hyK
      · simpa [EscapeSourceData.support, EscapeSourceRow.support] using
          (F.criticalFourShell_dangerousCircle_distribution hcenter K).1
      · simpa [EscapeSourceData.support, EscapeSourceRow.support] using
          (F.criticalFourShell_dangerousCircle_distribution hcenter K).2

theorem step_u_ne_u
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : G.u ≠ F.u := by
  intro heq
  apply step_u_fresh h
  rw [heq]
  simp [U5BoundedSupport]

theorem step_u_ne_a0
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : G.u ≠ F.a0 := by
  intro heq
  apply step_u_fresh h
  rw [heq]
  simp [U5BoundedSupport]

theorem step_u_ne_a1
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : G.u ≠ F.a1 := by
  intro heq
  apply step_u_fresh h
  rw [heq]
  simp [U5BoundedSupport]

theorem step_not_eq
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (h : U3EscapingAuditStep F G) : F ≠ G := by
  intro hFG
  have hfresh := step_u_fresh h
  have ha0 := step_a0_eq h
  have hmem : F.a0 ∈ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
      F.u F.a0 F.a1 := by
    simp [U5BoundedSupport]
  have hu : G.u = F.u := (congrArg U3FixedTripleAuditFrame.u hFG).symm
  have ha0eq : G.a0 = F.a0 := (congrArg U3FixedTripleAuditFrame.a0 hFG).symm
  have hgu : G.u = F.a0 := by
    calc
      G.u = F.u := hu
      _ = G.a0 := ha0.symm
      _ = F.a0 := ha0eq
  apply hfresh
  rw [hgu]
  exact hmem

theorem no_two_cycle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G H : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (hFG : U3EscapingAuditStep F G)
    (hGH : U3EscapingAuditStep G H) : F ≠ H := by
  intro hFH
  have hfresh := step_u_fresh hFG
  have hmem : F.a0 ∈ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
      F.u F.a0 F.a1 := by
    simp [U5BoundedSupport]
  have hgu : G.u = F.a0 := by
    calc
      G.u = H.a0 := (step_a0_eq hGH).symm
      _ = F.a0 := (congrArg U3FixedTripleAuditFrame.a0 hFH).symm
  apply hfresh
  rw [hgu]
  exact hmem

theorem no_three_cycle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F G H K : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (hFG : U3EscapingAuditStep F G)
    (hGH : U3EscapingAuditStep G H)
    (hHK : U3EscapingAuditStep H K) : F ≠ K := by
  intro hFK
  have hfresh := step_u_fresh hFG
  have hmem : F.a1 ∈ U5BoundedSupport D q p ({t1, t2, t3} : Finset ℝ²)
      F.u F.a0 F.a1 := by
    simp [U5BoundedSupport]
  have hgu : G.u = F.a1 := by
    calc
      G.u = H.a0 := (step_a0_eq hGH).symm
      _ = K.a1 := (step_a1_eq hHK).symm
      _ = F.a1 := (congrArg U3FixedTripleAuditFrame.a1 hFK).symm
  apply hfresh
  rw [hgu]
  exact hmem

theorem no_short_collision
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)}
    (hstep : ∀ n, U3EscapingAuditStep (s n) (s (n + 1))) :
    ∀ i j, i < j → j - i ≤ 3 → s i ≠ s j := by
  intro i j hij hsmall hs
  have hcases : j - i = 1 ∨ j - i = 2 ∨ j - i = 3 := by
    omega
  rcases hcases with h1 | h23
  · have hj : j = i + 1 := by omega
    exact step_not_eq (hstep i) (by simpa [hj] using hs)
  rcases h23 with h2 | h3
  · have hj : j = i + 2 := by omega
    have hstep2 : U3EscapingAuditStep (s (i + 1)) (s (i + 2)) := by
      convert hstep (i + 1) using 1
    exact no_two_cycle (hstep i) hstep2 (by simpa [hj] using hs)
  · have hj : j = i + 3 := by omega
    have hstep2 : U3EscapingAuditStep (s (i + 1)) (s (i + 2)) := by
      convert hstep (i + 1) using 1
    have hstep3 : U3EscapingAuditStep (s (i + 2)) (s (i + 3)) := by
      convert hstep (i + 2) using 1
    exact no_three_cycle (hstep i) hstep2 hstep3 (by simpa [hj] using hs)

/- ## Source packets along a finite step cycle -/

/-- The three moving audit centers in a frame. -/
noncomputable def rollingCenters
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)) : Finset ℝ² :=
  {F.u, F.a0, F.a1}

/-- A finite segment of escaping steps together with one exact source packet
for every step.  Keeping `step` is important: it retains all freshness,
off-circle, selected-candidate, and exact-shift facts which are not duplicated
in the compact source projection. -/
structure FiniteCycleSourcePacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3))
    (i period : ℕ) : Type where
  step : ∀ k : Fin period,
    U3EscapingAuditStep (s (i + (k : ℕ))) (s (i + (k : ℕ) + 1))
  source : Fin period → EscapeSourceData D q
  source_for : ∀ k : Fin period,
    IsEscapeSourceFor (s (i + (k : ℕ))) (s (i + (k : ℕ) + 1)) (source k)

/-- Every finite source-faithful step segment admits a typed source packet. -/
theorem exists_finiteCycleSourcePacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    {i period : ℕ}
    (hstep : ∀ k, k < period →
      U3EscapingAuditStep (s (i + k)) (s (i + k + 1))) :
    Nonempty (FiniteCycleSourcePacket s i period) := by
  classical
  have hexists : ∀ k : Fin period,
      ∃ S : EscapeSourceData D q,
        IsEscapeSourceFor (s (i + (k : ℕ)))
          (s (i + (k : ℕ) + 1)) S := by
    intro k
    exact step_exists_escapeSourceData (hstep k k.isLt)
  choose source hsource using hexists
  exact ⟨{
    step := fun k => hstep k k.isLt
    source := source
    source_for := hsource
  }⟩

namespace FiniteCycleSourcePacket

/-- Either some step is sourced at one of its three rolling centers, or two
different steps reuse one fixed dangerous-circle center.

This is the strongest unconditional pigeonhole consequence of a cycle source
packet: there are at least four source rows but only three fixed centers.  It
does not claim that the repeated-center rows share a support point or a mode. -/
theorem movingCenter_or_repeatedFixedCenter
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    {i period : ℕ}
    (P : FiniteCycleSourcePacket s i period)
    (hperiod : 4 ≤ period) :
    (∃ k : Fin period,
        (P.source k).center ∈ rollingCenters (s (i + (k : ℕ)))) ∨
      ∃ k l : Fin period,
        k ≠ l ∧
          (P.source k).center = (P.source l).center ∧
          (P.source k).center ∈ ({t1, t2, t3} : Finset ℝ²) := by
  classical
  by_cases hmoving : ∃ k : Fin period,
      (P.source k).center ∈ rollingCenters (s (i + (k : ℕ)))
  · exact Or.inl hmoving
  · right
    have hfixed : ∀ k : Fin period,
        (P.source k).center ∈ ({t1, t2, t3} : Finset ℝ²) := by
      intro k
      have hcenter := (P.source_for k).center_mem
      rw [U5BoundedAuditCenters] at hcenter
      rcases Finset.mem_insert.mp hcenter with hu | hcenter
      · exfalso
        apply hmoving
        exact ⟨k, by simp [rollingCenters, hu]⟩
      rcases Finset.mem_insert.mp hcenter with ha0 | hcenter
      · exfalso
        apply hmoving
        exact ⟨k, by simp [rollingCenters, ha0]⟩
      rcases Finset.mem_insert.mp hcenter with ha1 | hT
      · exfalso
        apply hmoving
        exact ⟨k, by simp [rollingCenters, ha1]⟩
      · exact hT
    by_contra hcollision
    let f : Fin period → ↑({t1, t2, t3} : Finset ℝ²) :=
      fun k => ⟨(P.source k).center, hfixed k⟩
    have hinjective : Function.Injective f := by
      intro k l hkl
      by_contra hne
      apply hcollision
      refine ⟨k, l, hne, ?_, hfixed k⟩
      exact congrArg Subtype.val hkl
    have hcard := Fintype.card_le_of_injective f hinjective
    have hTcard : Fintype.card ↑({t1, t2, t3} : Finset ℝ²) = 3 := by
      simpa using (s i).dangerous.T_card
    have : period ≤ 3 := by
      simpa [hTcard] using hcard
    omega

end FiniteCycleSourcePacket

/-- A finite cycle of length at least four has a source-faithful packet, and
that packet satisfies the moving-center/repeated-fixed-center dichotomy. -/
theorem movingCenter_or_repeatedFixedCenter
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    {i period : ℕ}
    (hperiod : 4 ≤ period)
    (hstep : ∀ k, k < period →
      U3EscapingAuditStep (s (i + k)) (s (i + k + 1))) :
    ∃ P : FiniteCycleSourcePacket s i period,
      (∃ k : Fin period,
          (P.source k).center ∈ rollingCenters (s (i + (k : ℕ)))) ∨
        ∃ k l : Fin period,
          k ≠ l ∧
            (P.source k).center = (P.source l).center ∧
            (P.source k).center ∈ ({t1, t2, t3} : Finset ℝ²) := by
  obtain ⟨P⟩ := exists_finiteCycleSourcePacket hstep
  exact ⟨P, P.movingCenter_or_repeatedFixedCenter hperiod⟩

/-- A source-faithful four-cycle written without modular indexing.  Each edge
is still an actual `U3EscapingAuditStep`, hence retains its exact row or shell
constructor and exact `shiftOfEscape` target. -/
structure FourCyclePacket
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F0 F1 F2 F3 : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)) : Prop where
  step01 : U3EscapingAuditStep F0 F1
  step12 : U3EscapingAuditStep F1 F2
  step23 : U3EscapingAuditStep F2 F3
  step30 : U3EscapingAuditStep F3 F0

namespace FourCyclePacket

/-- The four moving points of a four-cycle are pairwise distinct.  This is
exactly the freshness supplied by the first three rolling-window shifts. -/
theorem u_vertices_card_four
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {F0 F1 F2 F3 : Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    (P : FourCyclePacket F0 F1 F2 F3) :
    ({F0.u, F1.u, F2.u, F3.u} : Finset ℝ²).card = 4 := by
  have h10 : F1.u ≠ F0.u := step_u_ne_u P.step01
  have h21 : F2.u ≠ F1.u := step_u_ne_u P.step12
  have h20 : F2.u ≠ F0.u := by
    intro heq
    apply step_u_ne_a0 P.step12
    calc
      F2.u = F0.u := heq
      _ = F1.a0 := (step_a0_eq P.step01).symm
  have h32 : F3.u ≠ F2.u := step_u_ne_u P.step23
  have h31 : F3.u ≠ F1.u := by
    intro heq
    apply step_u_ne_a0 P.step23
    calc
      F3.u = F1.u := heq
      _ = F2.a0 := (step_a0_eq P.step12).symm
  have h30 : F3.u ≠ F0.u := by
    intro heq
    apply step_u_ne_a1 P.step23
    calc
      F3.u = F0.u := heq
      _ = F1.a0 := (step_a0_eq P.step01).symm
      _ = F2.a1 := (step_a1_eq P.step12).symm
  exact Finset.card_eq_four.mpr
    ⟨F0.u, F1.u, F2.u, F3.u, h10.symm, h20.symm, h30.symm,
      h21.symm, h31.symm, h32.symm, rfl⟩

end FourCyclePacket

/-- A period-four return in a step segment yields the explicit source-faithful
four-cycle packet. -/
theorem fourCyclePacket_of_return
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    {i : ℕ}
    (hreturn : s (i + 4) = s i)
    (hstep : ∀ k, k < 4 →
      U3EscapingAuditStep (s (i + k)) (s (i + k + 1))) :
    FourCyclePacket (s i) (s (i + 1)) (s (i + 2)) (s (i + 3)) := by
  have h01 : U3EscapingAuditStep (s i) (s (i + 1)) := by
    simpa using hstep 0 (by omega)
  have h12 : U3EscapingAuditStep (s (i + 1)) (s (i + 2)) := by
    simpa using hstep 1 (by omega)
  have h23 : U3EscapingAuditStep (s (i + 2)) (s (i + 3)) := by
    simpa using hstep 2 (by omega)
  have h34 : U3EscapingAuditStep (s (i + 3)) (s (i + 4)) := by
    simpa using hstep 3 (by omega)
  exact ⟨h01, h12, h23, by simpa [hreturn] using h34⟩

/-- In particular, a period-four return contains exactly four distinct moving
vertices. -/
theorem periodFour_u_vertices_card
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    {s : ℕ → Frame (D := D) (q := q) (p := p)
      (t1 := t1) (t2 := t2) (t3 := t3)}
    {i : ℕ}
    (hreturn : s (i + 4) = s i)
    (hstep : ∀ k, k < 4 →
      U3EscapingAuditStep (s (i + k)) (s (i + k + 1))) :
    ({(s i).u, (s (i + 1)).u, (s (i + 2)).u, (s (i + 3)).u} :
      Finset ℝ²).card = 4 :=
  (fourCyclePacket_of_return hreturn hstep).u_vertices_card_four

theorem exists_step_cycle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (s : ℕ → Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3))
    (hstep : ∀ n, U3EscapingAuditStep (s n) (s (n + 1))) :
    ∃ i period, 4 ≤ period ∧ s (i + period) = s i ∧
      ∀ k, k < period →
        U3EscapingAuditStep (s (i + k)) (s (i + k + 1)) := by
  have hcollision : ∃ i j, i < j ∧ s i = s j := by
    obtain ⟨i, j, hne, heq⟩ := Finite.exists_ne_map_eq_of_infinite s
    rcases lt_or_gt_of_ne hne with hij | hji
    · exact ⟨i, j, hij, heq⟩
    · exact ⟨j, i, hji, heq.symm⟩
  obtain ⟨i, j, hij, heq⟩ := hcollision
  have hperiod : 4 ≤ j - i := by
    by_contra hnot
    have hsmall : j - i ≤ 3 := by omega
    exact no_short_collision hstep i j hij hsmall heq
  refine ⟨i, j - i, hperiod, ?_, ?_⟩
  · simpa [Nat.add_sub_of_le (Nat.le_of_lt hij)] using heq.symm
  · intro k hk
    exact hstep (i + k)

/- The stable finite-orbit residual consumed by boundary adapters. -/

abbrev MixedOrStepCycle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F0 : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3)) :
    Prop :=
  (∃ F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
      F.MixedConfinedAuditPacket) ∨
    ∃ s : ℕ → Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
      s 0 = F0 ∧
      (∀ n, U3EscapingAuditStep (s n) (s (n + 1))) ∧
      ∃ i period, 4 ≤ period ∧ s (i + period) = s i ∧
        ∀ k, k < period →
          U3EscapingAuditStep (s (i + k)) (s (i + k + 1))

theorem exists_mixed_or_step_cycle
    {D : CounterexampleData} {q p t1 t2 t3 : ℝ²}
    (F0 : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3))
    (hexact :
      (((D.skeleton q).erase p).filter fun z => dist p z = dist p q).card = 3) :
    MixedOrStepCycle F0 := by
  classical
  by_cases hmixed :
      ∃ F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
        F.MixedConfinedAuditPacket
  · exact Or.inl hmixed
  · right
    have hnomixed : ∀ F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
        ¬ F.MixedConfinedAuditPacket := by
      intro F hF
      exact hmixed ⟨F, hF⟩
    have hsuccess : ∀ F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
        ∃ G : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
          U3EscapingAuditStep F G := by
      intro F
      rcases U3FixedTripleAuditFrame.exists_escapingAuditStep_or_mixedConfinedAuditPacket
          F hexact with hstep | hconfined
      · exact hstep
      · exact False.elim (hnomixed F hconfined)
    let next : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3) →
        Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3) :=
      fun F => Classical.choose (hsuccess F)
    have hnext : ∀ F : Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3),
        U3EscapingAuditStep F (next F) := by
      intro F
      exact Classical.choose_spec (hsuccess F)
    let s : ℕ → Frame (D := D) (q := q) (p := p) (t1 := t1) (t2 := t2) (t3 := t3) :=
      fun n => (next^[n]) F0
    have hs0 : s 0 = F0 := by
      simp [s]
    have hsstep : ∀ n, U3EscapingAuditStep (s n) (s (n + 1)) := by
      intro n
      have h := hnext ((next^[n]) F0)
      simpa [s, Function.iterate_succ_apply'] using h
    obtain ⟨i, period, hperiod, hreturn, hcycle⟩ := exists_step_cycle s hsstep
    exact ⟨s, hs0, hsstep, i, period, hperiod, hreturn, hcycle⟩

end U3EscapingAuditCycle
end Problem97
