import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# E-family bank (scratch)

Kernel-checked, `sorry`-free bank theorems for the structural derivations
claimed in `docs/solve-prompts/2026-07-28-e-round1-response.md` (§1, §3, §4,
§5 and "Exact remaining gap"), against the live E leaf

* E1 `Problem97.ATailFrontierLiveClosure.false_of_retainedInteriorDirectedOmission_and_all_low_hits`
  in `Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`.

Every leaf-indexed theorem below carries the E1 binder block

```
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
```

character-for-character, so each statement instantiates verbatim in the leaf
context.  The leaf carries no `_` linter prefixes, so the binder names are kept
as they stand and `linter.unusedVariables` is disabled file-wide instead; that
keeps the block diffable against the leaf.

Nothing here is wired into the production files: these are BANK theorems only.
The E1 `sorry` is untouched and no leaf progress is claimed.

## Note on (E9)

The prompt doc `docs/solve-prompts/2026-07-27-tri-apex-directed-omission.md`
lists the low-hit bound (E9.1) as a hypothesis `hlow`.  In the *current* leaf it
is not a binder at all: it is derivable from the tri-apex richness in `T` plus
the generic two-circle bound (`e1_low_hit` below).  This is exactly §1 of the
response ("the low-hit assumption is not a new source of positive
information").
-/

set_option linter.unusedVariables false

open scoped EuclideanGeometry

namespace Problem97
namespace EPackageBank

open ATailApexRichClassStructure
open ATailCriticalPairFrontier
open ATailDeletionRobustness
open ATailFrontierLiveClosure
open ATailLargeOppositeCapsBiApexSurface
open ATailMinimalUniqueFourCover
open ATailOrientedPhysicalApexIngress
open ATailPhysicalSecondApexCommonDeletion
open ATailRetainedMatchingGeometricReduction

attribute [local instance] Classical.propDecidable

/- ## Packet index helpers

The project copy of the first identity is `private`
(`Erdos9796Proof/P97/ATail/RetainedMatchingGeometricReduction.lean:40`); the
second lives in a deep `CardElevenUniqueFourCertificate` support shard
(`.../Unique4AlignedP5Occurrence/AlignedP5SourceTrace.lean:73`).  Both are
re-derived here with the same proof. -/

/-- The first opposite apex is the indexed Moser vertex of the first opposite
cap index.  Provenance: private `oppApex1_eq_oppositeVertexByIndex_oppIndex1`
in `ATail/RetainedMatchingGeometricReduction.lean`. -/
theorem oppApex1_eq_apexByIndex {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 = S.oppositeVertexByIndex S.oppIndex1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex1, hi]

/-- The second opposite apex is the indexed Moser vertex of the second
opposite cap index.  Provenance: `oppApex2_eq_oppositeVertexByIndex` in
`ATail/CardElevenUniqueFourCertificate/.../AlignedP5SourceTrace.lean`. -/
theorem oppApex2_eq_apexByIndex {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2, SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- The surplus apex is the indexed Moser vertex of the surplus cap index. -/
theorem surplusApex_eq_apexByIndex {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.surplusApex = S.oppositeVertexByIndex S.surplusIdx := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.surplusApex, SurplusCapPacket.oppositeVertexByIndex,
      hi]

/-- Cap-index exhaustion: the three cap indices `{0, 1, 2}` are exactly
`{oppIndex1, oppIndex2, surplusIdx}`, so every indexed Moser vertex is one of
the three named apices. -/
theorem apexByIndex_eq_oppApex1_or_oppApex2_or_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    S.oppositeVertexByIndex i = S.oppApex1 ∨
      S.oppositeVertexByIndex i = S.oppApex2 ∨
        S.oppositeVertexByIndex i = S.surplusApex := by
  rcases hs : S.surplusIdx with ⟨j, hj3⟩
  fin_cases i <;> interval_cases j <;>
    simp [SurplusCapPacket.oppApex1, SurplusCapPacket.oppApex2,
      SurplusCapPacket.surplusApex, SurplusCapPacket.oppositeVertexByIndex, hs]

/- ## Target 2 — §1 tri-apex robustness package

"Rich structure at `(a₁, a₂, a₀)` implies full deletion robustness in either
arm.  Hence no blocker center equals any of the three apices.  This also
separates every blocker row from every apex circle, so the generic two-circle
theorem already gives `|Σ(x) ∩ Γ(vᵢ, r)| ≤ 2`." -/

/-- **§1(a).**  The first opposite apex is fully deletion robust. -/
theorem e1_firstApex_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    FullyDeletionRobustAt D S.oppApex1 :=
  fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex1_rich

/-- **§1(a).**  The second opposite apex is fully deletion robust. -/
theorem e1_secondApex_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    FullyDeletionRobustAt D S.oppApex2 :=
  fullyDeletionRobustAt_of_apexRichClassStructure T.oppApex2_rich

/-- **§1(a).**  The surplus apex is fully deletion robust. -/
theorem e1_surplusApex_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    FullyDeletionRobustAt D S.surplusApex :=
  fullyDeletionRobustAt_of_apexRichClassStructure T.surplusApex_rich

/-- **§1(a), uniform form.**  Every one of the three indexed Moser apices
carries the rich class structure. -/
theorem e1_apexByIndex_rich
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) :
    ApexRichClassStructure D.A (S.oppositeVertexByIndex i) := by
  rcases apexByIndex_eq_oppApex1_or_oppApex2_or_surplusApex S i with
    h | h | h <;> rw [h]
  · exact T.oppApex1_rich
  · exact T.oppApex2_rich
  · exact T.surplusApex_rich

/-- **§1(a), uniform form.**  Every one of the three indexed Moser apices is
fully deletion robust. -/
theorem e1_apexByIndex_robust
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) :
    FullyDeletionRobustAt D (S.oppositeVertexByIndex i) :=
  fullyDeletionRobustAt_of_apexRichClassStructure
    (e1_apexByIndex_rich F R P B L N T i)

/-- **§1(b).**  No blocker center of the critical-shell system equals any
Moser apex: "no blocker center equals any of the three apices". -/
theorem e1_center_ne_apexByIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (z : ℝ²) (hz : z ∈ D.A) :
    H.centerAt z hz ≠ S.oppositeVertexByIndex i :=
  (e1_apexByIndex_robust F R P B L N T i).centerAt_ne H z hz

/-- **§1(b), triangle form.**  No blocker center equals a Moser triangle
vertex. -/
theorem e1_center_ne_triangleVertex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (z : ℝ²) (hz : z ∈ D.A) :
    H.centerAt z hz ≠ S.triangle.v1 ∧ H.centerAt z hz ≠ S.triangle.v2 ∧
      H.centerAt z hz ≠ S.triangle.v3 := by
  refine ⟨?_, ?_, ?_⟩
  · simpa [SurplusCapPacket.oppositeVertexByIndex] using
      e1_center_ne_apexByIndex F R P B L N T 0 z hz
  · simpa [SurplusCapPacket.oppositeVertexByIndex] using
      e1_center_ne_apexByIndex F R P B L N T 1 z hz
  · simpa [SurplusCapPacket.oppositeVertexByIndex] using
      e1_center_ne_apexByIndex F R P B L N T 2 z hz

/-- **§1(c), generic two-circle bound.**  Every blocker row meets every
apex circle in at most two points.  This is the row/apex-circle bound
`|Σ(x) ∩ Γ(vᵢ, r)| ≤ 2` of §1, with `r` an arbitrary real. -/
theorem e1_row_inter_apexClass_card_le_two
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (x : ℝ²) (hx : x ∈ D.A) (r : ℝ) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      SelectedClass D.A (S.oppositeVertexByIndex i) r).card ≤ 2 :=
  criticalShell_inter_selectedClass_card_le_two_of_apexRich H x hx
    (e1_apexByIndex_rich F R P B L N T i) r

/-- **§1(c), cap-restricted form — (E9.1) derived, not assumed.**  For every
cap index, every carrier source and every real radius,
`|Σ(x) ∩ (Γ(vᵢ, r) ∩ Cᵢ°)| ≤ 2`.  The prompt doc lists this as hypothesis
`hlow`; over the live E1 binders it is a theorem. -/
theorem e1_low_hit
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (x : ℝ²) (hx : x ∈ D.A) (r : ℝ) :
    ((H.selectedAt x hx).toCriticalFourShell.support ∩
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)).card ≤ 2 :=
  criticalShell_inter_oppositeCapClassInterior_card_le_two_of_apexRich S i H x hx
    (e1_apexByIndex_rich F R P B L N T i) r

/- ## Target 1b — the three-hit terminal consumer (§4)

"The exact missing terminal witness would have the form … because `hlow` would
immediately contradict it."  Over the live binders `hlow` is `e1_low_hit`. -/

/-- **§4 terminal consumer, indexed form.**  Three hits of one rich
apex-circle-inside-its-strict-cap in a single blocker row are impossible. -/
theorem e1_false_of_three_hits
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (x : ℝ²) (hx : x ∈ D.A) (r : ℝ)
    (hthree :
      3 ≤ ((H.selectedAt x hx).toCriticalFourShell.support ∩
        (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i)).card) :
    False := by
  have hle := e1_low_hit F R P B L N T i x hx r
  omega

/-- **§4 terminal consumer, response's displayed witness form.**  The
existential displayed in §4 of the response — with the `ApexRichClassStructure`
conjunct kept verbatim even though it is derivable here — refutes the E1
binder bundle. -/
theorem e1_false_of_threeHitWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hwitness :
      ∃ i : Fin 3, ∃ x : ℝ², ∃ hx : x ∈ D.A, ∃ r : ℝ,
        ApexRichClassStructure D.A (S.oppositeVertexByIndex i) ∧
          3 ≤
            ((H.selectedAt x hx).toCriticalFourShell.support ∩
              (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
                S.capInteriorByIndex i)).card) :
    False := by
  obtain ⟨i, x, hx, r, -, hthree⟩ := hwitness
  exact e1_false_of_three_hits F R P B L N T i x hx r hthree

/- ## Target 1a — the weak-form consumer ("Exact remaining gap")

"A weaker but still potentially closing form would force, for some same-rich-cap
pair `(p, q)`, `¬K4(A ∖ {q}, c(p))` while simultaneously forcing
`c(p) ∉ Cᵢ°`; failure gives two hits, and two-hit localization would place the
center inside the cap, yielding a contradiction."

The exact hypothesis shape the mechanism needs, stated honestly:

* `p ≠ q`, and **both** `p` and `q` must lie in the *same* slice
  `Γ(vᵢ, r) ∩ Cᵢ°` — same apex, same radius, both in the strict cap interior;
* `hblocked : ¬K4(A ∖ {q}, c(p))` — the *failure* direction, which is exactly
  the polarity the packet `P` does **not** supply (§2 of the response);
* `houtside : c(p) ∉ Cᵢ°`.

Richness at `vᵢ` and the unique-four property of `c(p)` are **not** extra
hypotheses: both are derivable over the E1 binders. -/

/-- **Two hits from a cross-deletion failure.**  If deleting `q` blocks `p`'s
own blocker, then `q` lies in `p`'s row, so `p`'s row meets the common slice in
at least two points.  Generic in the carrier and the slice. -/
theorem two_hits_of_cross_deletion_blocked
    {A : Finset ℝ²} (H : CriticalShellSystem A) (Slice : Finset ℝ²)
    {p q : ℝ²} (hpA : p ∈ A)
    (hpSlice : p ∈ Slice) (hqSlice : q ∈ Slice) (hpq : p ≠ q)
    (hblocked : ¬ HasNEquidistantPointsAt 4 (A.erase q) (H.centerAt p hpA)) :
    2 ≤ ((H.selectedAt p hpA).toCriticalFourShell.support ∩ Slice).card := by
  classical
  have hqRow : q ∈ (H.selectedAt p hpA).toCriticalFourShell.support := by
    by_contra hq
    exact hblocked
      ((cross_deletion_survives_iff_not_mem_selected_support H hpA).mpr hq)
  have hpair :
      ({p, q} : Finset ℝ²) ⊆
        (H.selectedAt p hpA).toCriticalFourShell.support ∩ Slice := by
    rw [Finset.insert_subset_iff, Finset.singleton_subset_iff]
    exact ⟨Finset.mem_inter.mpr
        ⟨(H.selectedAt p hpA).toCriticalFourShell.q_mem_support, hpSlice⟩,
      Finset.mem_inter.mpr ⟨hqRow, hqSlice⟩⟩
  simpa [hpq] using Finset.card_le_card hpair

/-- **Weak-form consumer, indexed form ("Exact remaining gap").**  A
same-rich-cap pair `p ≠ q` on one apex circle inside one strict cap interior,
for which the cross deletion at `q` *fails* to preserve K4 at `c(p)` while
`c(p)` stays outside that cap interior, refutes the E1 binder bundle. -/
theorem e1_false_of_capPair_crossDeletionBlocked_of_center_outside
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (r : ℝ) (p q : ℝ²) (hpA : p ∈ D.A) (hpq : p ≠ q)
    (hp :
      p ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hq :
      q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
    (hblocked :
      ¬ HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt p hpA))
    (houtside : H.centerAt p hpA ∉ S.capInteriorByIndex i) :
    False := by
  have htwo :=
    two_hits_of_cross_deletion_blocked H
      (SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
        S.capInteriorByIndex i)
      hpA hp hq hpq hblocked
  exact houtside
    (criticalShellCenter_mem_capInteriorByIndex_of_two_hits hpA
      (e1_apexByIndex_rich F R P B L N T i)
      (isUniqueFourCenter_centerAt H p hpA) htwo)

/-- **Weak-form consumer, existential form.**  The producer statement named in
the response's "Exact remaining gap" section, in the shape a future positive
incidence producer would have to deliver. -/
theorem e1_false_of_weakFormWitness
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hwitness :
      ∃ i : Fin 3, ∃ r : ℝ, ∃ p q : ℝ², ∃ hpA : p ∈ D.A,
        p ≠ q ∧
        p ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i ∧
        q ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r ∩
          S.capInteriorByIndex i ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase q) (H.centerAt p hpA) ∧
        H.centerAt p hpA ∉ S.capInteriorByIndex i) :
    False := by
  obtain ⟨i, r, p, q, hpA, hpq, hp, hq, hblocked, houtside⟩ := hwitness
  exact e1_false_of_capPair_crossDeletionBlocked_of_center_outside
    F R P B L N T i r p q hpA hpq hp hq hblocked houtside

/-- **The E4 pair is a same-rich-cap pair.**  Both directed-omission sources lie
in the single slice `Γ(v_{i₁}, ρ₀) ∩ C_{i₁}°`, i.e. they satisfy exactly the
positional hypotheses of the weak-form consumer above. -/
theorem e1_sources_mem_commonSlice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    P.source₁ ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1 ∧
      P.source₂ ∈
        SelectedClass D.A (S.oppositeVertexByIndex S.oppIndex1) radius ∩
          S.capInteriorByIndex S.oppIndex1 := by
  rw [← oppApex1_eq_apexByIndex S]
  exact
    ⟨Finset.mem_inter.mpr ⟨P.source₁_mem_radius, P.source₁_mem_capInterior⟩,
      Finset.mem_inter.mpr ⟨P.source₂_mem_radius, P.source₂_mem_capInterior⟩⟩

/-- **Weak-form consumer, instantiated at the E4 packet pair.**  Both
orientations.  Everything the consumer needs is already present in `P` except
the two boldface hypotheses: cross-deletion *failure* at the partner and the
blocker staying *outside* the strict first cap. -/
theorem e1_packetPair_weakForm_consumer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    (¬ HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt P.source₁ P.source₁_mem_A) →
        H.centerAt P.source₁ P.source₁_mem_A ∉
          S.capInteriorByIndex S.oppIndex1 →
        False) ∧
      (¬ HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt P.source₂ P.source₂_mem_A) →
        H.centerAt P.source₂ P.source₂_mem_A ∉
          S.capInteriorByIndex S.oppIndex1 →
        False) := by
  obtain ⟨hs₁, hs₂⟩ := e1_sources_mem_commonSlice F R P B L N T
  exact
    ⟨fun hblocked houtside =>
        e1_false_of_capPair_crossDeletionBlocked_of_center_outside F R P B L N T
          S.oppIndex1 radius P.source₁ P.source₂ P.source₁_mem_A P.sources_ne
          hs₁ hs₂ hblocked houtside,
      fun hblocked houtside =>
        e1_false_of_capPair_crossDeletionBlocked_of_center_outside F R P B L N T
          S.oppIndex1 radius P.source₂ P.source₁ P.source₂_mem_A
          P.sources_ne.symm hs₂ hs₁ hblocked houtside⟩

/-- **§2, the polarity mismatch, in checkable form.**  The surviving
orientation's row meets the source pair in exactly *one* point — its own
source.  The two-hit localizer needs `2 ≤ …`, so it cannot be applied to the
directed-omission edge itself: "available from `P`: cross deletion survives /
partner omitted; needed by localizer: cross deletion fails / partner lies in
row". -/
theorem e1_omission_row_hits_pair_card_eq_one
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    ((H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∩
          ({P.source₁, P.source₂} : Finset ℝ²)).card = 1 ∨
      ((H.selectedAt P.source₂ P.source₂_mem_A).toCriticalFourShell.support ∩
          ({P.source₁, P.source₂} : Finset ℝ²)).card = 1 := by
  classical
  have key :
      ∀ (a b : ℝ²) (ha : a ∈ D.A),
        a ≠ b →
        b ∉ (H.selectedAt a ha).toCriticalFourShell.support →
        ((H.selectedAt a ha).toCriticalFourShell.support ∩
          ({a, b} : Finset ℝ²)).card = 1 := by
    intro a b ha hab hbRow
    have hset :
        (H.selectedAt a ha).toCriticalFourShell.support ∩
          ({a, b} : Finset ℝ²) = {a} := by
      ext z
      simp only [Finset.mem_inter, Finset.mem_insert, Finset.mem_singleton]
      constructor
      · rintro ⟨hzRow, hz | hz⟩
        · exact hz
        · exact absurd (by rwa [hz] at hzRow) hbRow
      · intro hz
        refine ⟨?_, Or.inl hz⟩
        rw [hz]
        exact (H.selectedAt a ha).toCriticalFourShell.q_mem_support
    rw [hset, Finset.card_singleton]
  rcases P.directed_omission with ⟨hnot, -⟩ | ⟨hnot, -⟩
  · exact Or.inl
      (key P.source₁ P.source₂ P.source₁_mem_A P.sources_ne hnot)
  · refine Or.inr ?_
    have hpair : ({P.source₁, P.source₂} : Finset ℝ²) =
        ({P.source₂, P.source₁} : Finset ℝ²) := Finset.pair_comm _ _
    rw [hpair]
    exact key P.source₂ P.source₁ P.source₂_mem_A P.sources_ne.symm hnot

/- ## Target 3 — §3 mutual cross-membership impossibility

"Because `u` and `v` lie on the same `a₁`-circle, `a₁` lies on the perpendicular
bisector of `uv`.  If both cross-memberships held … then both `c(u)` and `c(v)`
would also lie on that bisector.  Convex independence gives the carrier
perpendicular-bisector bound of at most two carrier points.  Since
`a₁, c(u), c(v) ∈ A` and the blocker centers are distinct from `a₁`, this is
impossible." -/

/-- **§3.**  For a pair `u ≠ v` on one indexed-apex circle with distinct
blockers, mutual cross-membership of the two blocker rows is impossible.  The
apex index is arbitrary, so this holds at all three apices, not only at `a₁`. -/
theorem e1_not_mutual_cross_membership
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (r : ℝ) (u v : ℝ²) (huA : u ∈ D.A) (hvA : v ∈ D.A)
    (huv : u ≠ v)
    (hu : u ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r)
    (hv : v ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r)
    (hblockers : H.centerAt u huA ≠ H.centerAt v hvA) :
    ¬ (v ∈ (H.selectedAt u huA).toCriticalFourShell.support ∧
        u ∈ (H.selectedAt v hvA).toCriticalFourShell.support) := by
  classical
  rintro ⟨hvu, huv'⟩
  have hoA : S.oppositeVertexByIndex i ∈ D.A := S.oppositeVertexByIndex_mem i
  have hcuA : H.centerAt u huA ∈ D.A :=
    Finset.mem_of_mem_erase (H.selectedAt u huA).toCriticalFourShell.center_mem
  have hcvA : H.centerAt v hvA ∈ D.A :=
    Finset.mem_of_mem_erase (H.selectedAt v hvA).toCriticalFourShell.center_mem
  have hcuNe : H.centerAt u huA ≠ S.oppositeVertexByIndex i :=
    e1_center_ne_apexByIndex F R P B L N T i u huA
  have hcvNe : H.centerAt v hvA ≠ S.oppositeVertexByIndex i :=
    e1_center_ne_apexByIndex F R P B L N T i v hvA
  have hoEq :
      dist (S.oppositeVertexByIndex i) u = dist (S.oppositeVertexByIndex i) v :=
    (mem_selectedClass.mp hu).2.trans (mem_selectedClass.mp hv).2.symm
  have hcuEq : dist (H.centerAt u huA) u = dist (H.centerAt u huA) v :=
    ((H.selectedAt u huA).toCriticalFourShell.support_eq_radius u
      (H.selectedAt u huA).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt u huA).toCriticalFourShell.support_eq_radius v hvu).symm
  have hcvEq : dist (H.centerAt v hvA) u = dist (H.centerAt v hvA) v :=
    ((H.selectedAt v hvA).toCriticalFourShell.support_eq_radius u huv').trans
      ((H.selectedAt v hvA).toCriticalFourShell.support_eq_radius v
        (H.selectedAt v hvA).toCriticalFourShell.q_mem_support).symm
  have hbound := Dumitrescu.perpBisector_apex_bound D.convex huA hvA huv
  have hthree : 2 < (D.A.filter (fun z => dist z u = dist z v)).card := by
    rw [Finset.two_lt_card]
    exact ⟨S.oppositeVertexByIndex i, Finset.mem_filter.mpr ⟨hoA, hoEq⟩,
      H.centerAt u huA, Finset.mem_filter.mpr ⟨hcuA, hcuEq⟩,
      H.centerAt v hvA, Finset.mem_filter.mpr ⟨hcvA, hcvEq⟩,
      fun h => hcuNe h.symm, fun h => hcvNe h.symm, hblockers⟩
  omega

/-- **§3, producer form — "at least one directed omission".**  For a pair
`u ≠ v` on one indexed-apex circle with distinct blockers, at least one of the
two cross deletions omits its partner and therefore survives.  This is exactly
the statement that the distinct-blocker branch "naturally yields an omission
rather than a concentration". -/
theorem e1_directed_omission_of_sameApexCircle
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) (r : ℝ) (u v : ℝ²) (huA : u ∈ D.A) (hvA : v ∈ D.A)
    (huv : u ≠ v)
    (hu : u ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r)
    (hv : v ∈ SelectedClass D.A (S.oppositeVertexByIndex i) r)
    (hblockers : H.centerAt u huA ≠ H.centerAt v hvA) :
    (v ∉ (H.selectedAt u huA).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase v) (H.centerAt u huA)) ∨
      (u ∉ (H.selectedAt v hvA).toCriticalFourShell.support ∧
        HasNEquidistantPointsAt 4 (D.A.erase u) (H.centerAt v hvA)) := by
  classical
  by_cases hvu : v ∈ (H.selectedAt u huA).toCriticalFourShell.support
  · have huv' : u ∉ (H.selectedAt v hvA).toCriticalFourShell.support := by
      intro huv'
      exact e1_not_mutual_cross_membership F R P B L N T i r u v huA hvA huv
        hu hv hblockers ⟨hvu, huv'⟩
    exact Or.inr ⟨huv',
      (cross_deletion_survives_iff_not_mem_selected_support H hvA).mpr huv'⟩
  · exact Or.inl ⟨hvu,
      (cross_deletion_survives_iff_not_mem_selected_support H huA).mpr hvu⟩

/- ## Target 4 — §5 plumbing

"Deleting `v` preserves K4 at all three apices, by tri-apex robustness; and at
`c(u)`, by the directed omission.  But deletion of `v` destroys K4 at its own
blocker `c(v)` …  Thus minimality supplies no immediate removable-vertex
contradiction." -/

/-- **§5(a).**  Deleting a carrier point destroys K4 at that point's own
blocker.  Immediate from the blocking clause of the critical-shell system. -/
theorem e1_deletion_blocks_own_blocker
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (v : ℝ²) (hv : v ∈ D.A) :
    ¬ HasNEquidistantPointsAt 4 (D.A.erase v) (H.centerAt v hv) :=
  H.no_qfree_at v hv

/-- **§5(b).**  The complete deletion profile of the omitted source: whichever
orientation of `P.directed_omission` holds, deleting the omitted source
preserves K4 at all three Moser apices and at the *partner's* blocker, and
destroys K4 at the omitted source's *own* blocker.  So no single-deletion
removable-vertex contradiction is available at those five centers. -/
theorem e1_omission_deletion_profile
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    (HasNEquidistantPointsAt 4 (D.A.erase P.source₂) S.oppApex1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂) S.oppApex2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂) S.surplusApex ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt P.source₁ P.source₁_mem_A) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.source₂)
          (H.centerAt P.source₂ P.source₂_mem_A)) ∨
      (HasNEquidistantPointsAt 4 (D.A.erase P.source₁) S.oppApex1 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) S.oppApex2 ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁) S.surplusApex ∧
        HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt P.source₂ P.source₂_mem_A) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A.erase P.source₁)
          (H.centerAt P.source₁ P.source₁_mem_A)) := by
  rcases P.directed_omission with ⟨-, hsurvive⟩ | ⟨-, hsurvive⟩
  · exact Or.inl
      ⟨(e1_firstApex_robust F R P B L N T).survives P.source₂ P.source₂_mem_A,
        (e1_secondApex_robust F R P B L N T).survives P.source₂ P.source₂_mem_A,
        (e1_surplusApex_robust F R P B L N T).survives P.source₂
          P.source₂_mem_A,
        hsurvive, H.no_qfree_at P.source₂ P.source₂_mem_A⟩
  · exact Or.inr
      ⟨(e1_firstApex_robust F R P B L N T).survives P.source₁ P.source₁_mem_A,
        (e1_secondApex_robust F R P B L N T).survives P.source₁ P.source₁_mem_A,
        (e1_surplusApex_robust F R P B L N T).survives P.source₁
          P.source₁_mem_A,
        hsurvive, H.no_qfree_at P.source₁ P.source₁_mem_A⟩

/-- **§5(c).**  The cover bound is a *lower* bound on the number of non-robust
centers: `⌈|A| / 4⌉ ≤ |𝒩|`.  It is not an upper bound that would force row
concentration. -/
theorem e1_notRobustCenters_card_ge
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N) :
    (D.A.card + 3) / 4 ≤ (notRobustCenters D).card := by
  have hcover := T.notRobustCover_card
  omega

/-- **§5(c), apex exclusion.**  None of the three Moser apices is a non-robust
center, so the cover bound's `𝒩` avoids all three. -/
theorem e1_apices_not_mem_notRobustCenters
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (P : RetainedInteriorDirectedOmission R)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (i : Fin 3) :
    S.oppositeVertexByIndex i ∉ notRobustCenters D := by
  intro hmem
  exact (Finset.mem_filter.mp hmem).2 (e1_apexByIndex_robust F R P B L N T i)

#print axioms oppApex1_eq_apexByIndex
#print axioms oppApex2_eq_apexByIndex
#print axioms surplusApex_eq_apexByIndex
#print axioms apexByIndex_eq_oppApex1_or_oppApex2_or_surplusApex
#print axioms e1_firstApex_robust
#print axioms e1_secondApex_robust
#print axioms e1_surplusApex_robust
#print axioms e1_apexByIndex_rich
#print axioms e1_apexByIndex_robust
#print axioms e1_center_ne_apexByIndex
#print axioms e1_center_ne_triangleVertex
#print axioms e1_row_inter_apexClass_card_le_two
#print axioms e1_low_hit
#print axioms e1_false_of_three_hits
#print axioms e1_false_of_threeHitWitness
#print axioms two_hits_of_cross_deletion_blocked
#print axioms e1_false_of_capPair_crossDeletionBlocked_of_center_outside
#print axioms e1_false_of_weakFormWitness
#print axioms e1_sources_mem_commonSlice
#print axioms e1_packetPair_weakForm_consumer
#print axioms e1_omission_row_hits_pair_card_eq_one
#print axioms e1_not_mutual_cross_membership
#print axioms e1_directed_omission_of_sameApexCircle
#print axioms e1_deletion_blocks_own_blocker
#print axioms e1_omission_deletion_profile
#print axioms e1_notRobustCenters_card_ge
#print axioms e1_apices_not_mem_notRobustCenters

end EPackageBank
end Problem97
