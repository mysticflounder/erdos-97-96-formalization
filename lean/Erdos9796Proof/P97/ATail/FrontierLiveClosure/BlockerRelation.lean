/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Canonical blockers and late blocker choice

`CriticalShellSystem` fixes one blocker center per carrier source before the
useful source pair, radius mode or target cap is known.  Several downstream
arguments then have to re-derive facts that only hold because of that early
choice, or override it after the fact through
`CriticalShellSystem.overrideExactSelectedClass` and
`CriticalShellSystem.overrideAt`.

This module supplies the choice-free surface those arguments actually want:
the *relation* recording every legal blocker of every source, together with a
compatibility constructor that turns the relation back into a total system
once a preference is available.  A combinatorial or geometric argument can
then quantify over the relation and postpone the selection until the branch
it depends on has been identified.

## Contents

* `IsCanonicalBlocker A source center` — the property a center must have to
  be a legal blocker of `source` in `A`: it is a carrier point other than
  `source`, and deleting `source` destroys every four-point same-distance
  witness at it.  `isCanonicalBlocker_centerAt` shows that the chosen center
  of *any* critical shell system has this property, so the predicate is the
  exact requirement `CriticalShellSystem.centerAt` is built to meet.
* `CanonicalBlockerRelation A` — an abstract blocker relation on `A` whose
  `blocks_iff` field makes it agree with `IsCanonicalBlocker` on carrier
  sources, and whose `source_nonempty` field records that every carrier
  source has at least one legal blocker.
* `BlockerPreference R` — an arbitrary preference on top of a relation `R`,
  constrained only by `exists_preferred_or_default`: a carrier source either
  has at least one preferred center that `R` accepts, or has no preferred
  center at all.  The predicate is not pointwise legal: next to that one
  accepted center it may also name centers `R` rejects.  What the field
  guarantees is that *selection* under the preference is legal —
  `preferredCenter` picks a center that is both preferred and accepted by `R`
  whenever any preferred center exists, and never one `R` rejects
  (`isCanonicalBlocker_preferredCenter`, `preferred_preferredCenter`).
* `chooseCriticalShellSystem` — the compatibility adapter.  Given global
  four-point structure it selects, for each source, a preferred legal blocker
  when the preference names one and any legal blocker otherwise, and assembles
  the result into a `CriticalShellSystem`.

## Reading of `ofCriticalShellSystem`

`CanonicalBlockerRelation.ofCriticalShellSystem H` is the *full* canonical
relation of the carrier, not the graph of `H`'s own selections.  The graph of
`H` is generally a strict subrelation of `IsCanonicalBlocker`, so it cannot
satisfy `blocks_iff`; what `H` contributes is `source_nonempty`.  `H`'s
selections re-enter through `BlockerPreference.ofCriticalShellSystem`, and
`chooseCriticalShellSystem_centerAt_ofCriticalShellSystem` then recovers them
exactly.

## Round trip

`CriticalShellSystem` carries no extensionality lemma in this repository, and
none is available: two systems agreeing on every center still carry
independently chosen `CriticalSelectedFourClass` records, whose label fields
need not match.  The round trip is therefore stated pointwise.  It is
pointwise on centers (`chooseCriticalShellSystem_centerAt_ofCriticalShellSystem`)
and, through `selectedAt_support_eq_of_centerAt_eq`, on the exact row supports
as well; only the four label names may differ.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATAILStageOnePrescribedApexDichotomy

/- ## The canonical blocker predicate -/

/-- `center` is a legal blocker of `source` in the carrier `A`: it is a
carrier point distinct from `source`, and after `source` is deleted no
four-point same-distance witness survives at it.

This is exactly the property `CriticalShellSystem.shellAt` is required to
establish for the center it picks, so no system can select a center outside
this predicate; see `isCanonicalBlocker_centerAt`. -/
def IsCanonicalBlocker (A : Finset ℝ²) (source center : ℝ²) : Prop :=
  center ∈ A ∧ center ≠ source ∧
    ¬ HasNEquidistantPointsAt 4 (A.erase source) center

namespace IsCanonicalBlocker

/-- A legal blocker is a carrier point. -/
theorem center_mem {A : Finset ℝ²} {source center : ℝ²}
    (h : IsCanonicalBlocker A source center) : center ∈ A := h.1

/-- A legal blocker is distinct from the source it blocks. -/
theorem ne_source {A : Finset ℝ²} {source center : ℝ²}
    (h : IsCanonicalBlocker A source center) : center ≠ source := h.2.1

/-- Deleting the source destroys every four-point same-distance witness at a
legal blocker. -/
theorem no_qfree {A : Finset ℝ²} {source center : ℝ²}
    (h : IsCanonicalBlocker A source center) :
    ¬ HasNEquidistantPointsAt 4 (A.erase source) center := h.2.2

/-- A legal blocker survives the deletion of its source. -/
theorem center_mem_erase {A : Finset ℝ²} {source center : ℝ²}
    (h : IsCanonicalBlocker A source center) : center ∈ A.erase source :=
  Finset.mem_erase.mpr ⟨h.ne_source, h.center_mem⟩

end IsCanonicalBlocker

/-- Every center chosen by a critical shell system is a legal blocker of its
source.  This is the sense in which `IsCanonicalBlocker` is the requirement
`CriticalShellSystem.centerAt` is built to meet. -/
theorem isCanonicalBlocker_centerAt {A : Finset ℝ²}
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A) :
    IsCanonicalBlocker A source (H.centerAt source hsource) := by
  have hmem :=
    Finset.mem_erase.mp
      (H.selectedAt source hsource).toCriticalFourShell.center_mem
  exact ⟨hmem.2, hmem.1, H.no_qfree_at source hsource⟩

/-- Under global four-point structure, a legal blocker carries the exact
critical shell through its source.  This is the passage from the choice-free
predicate back to the row data a `CriticalShellSystem` field demands. -/
theorem nonempty_criticalSelectedFourClass_of_isCanonicalBlocker
    {A : Finset ℝ²} {source center : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (h : IsCanonicalBlocker A source center) :
    Nonempty (CriticalSelectedFourClass A source center) :=
  criticalSelectedFourClass_at_of_no_qfree hK4 h.center_mem h.ne_source
    h.no_qfree

/-- A carrier source that is not removable has at least one legal blocker.
This is the existence statement underlying `CanonicalBlockerRelation`. -/
theorem exists_isCanonicalBlocker {A : Finset ℝ²} {source : ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hsource : source ∈ A)
    (hnrem : ¬ IsRemovableVertex A source) :
    ∃ center : ℝ², IsCanonicalBlocker A source center := by
  obtain ⟨center, ⟨C⟩, hblocked⟩ :=
    exists_criticalSelectedFourClass_and_no_qfree hK4 hsource hnrem
  have hmem := Finset.mem_erase.mp C.toCriticalFourShell.center_mem
  exact ⟨center, hmem.2, hmem.1, hblocked⟩

/- ## The blocker relation -/

/-- All legal blockers of all carrier sources, packaged as an abstract
relation.  `blocks_iff` pins the relation to `IsCanonicalBlocker` on carrier
sources, and `source_nonempty` records that the relation is total there.

Arguments that consume this record never see a selection, so they cannot pick
up a branch that exists only because one particular blocker was chosen
early. -/
structure CanonicalBlockerRelation (A : Finset ℝ²) where
  /-- The recorded blocker relation. -/
  blocks : ℝ² → ℝ² → Prop
  /-- On carrier sources the recorded relation agrees with the canonical
  blocker predicate. -/
  blocks_iff :
    ∀ source center : ℝ², source ∈ A →
      (blocks source center ↔ IsCanonicalBlocker A source center)
  /-- Every carrier source has at least one recorded blocker. -/
  source_nonempty :
    ∀ source : ℝ², source ∈ A → ∃ center : ℝ², blocks source center

namespace CanonicalBlockerRelation

/-- A recorded blocker of a carrier source is a legal blocker. -/
theorem isCanonicalBlocker_of_blocks {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) {source center : ℝ²}
    (hsource : source ∈ A) (h : R.blocks source center) :
    IsCanonicalBlocker A source center :=
  (R.blocks_iff source center hsource).mp h

/-- A legal blocker of a carrier source is recorded by the relation. -/
theorem blocks_of_isCanonicalBlocker {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) {source center : ℝ²}
    (hsource : source ∈ A) (h : IsCanonicalBlocker A source center) :
    R.blocks source center :=
  (R.blocks_iff source center hsource).mpr h

/-- Every blocker relation records the selection of every critical shell
system. -/
theorem blocks_centerAt {A : Finset ℝ²} (R : CanonicalBlockerRelation A)
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A) :
    R.blocks source (H.centerAt source hsource) :=
  R.blocks_of_isCanonicalBlocker hsource
    (isCanonicalBlocker_centerAt H source hsource)

/-- The canonical relation on a carrier whose sources are known to have legal
blockers. -/
def ofExistsBlocker (A : Finset ℝ²)
    (h : ∀ source : ℝ², source ∈ A →
      ∃ center : ℝ², IsCanonicalBlocker A source center) :
    CanonicalBlockerRelation A where
  blocks := IsCanonicalBlocker A
  blocks_iff := fun _ _ _ => Iff.rfl
  source_nonempty := h

/-- The blocker relation supplied by a critical shell system.

This is the full canonical relation of the carrier: `blocks` is
`IsCanonicalBlocker A` itself, not the graph of `H`'s own selections, since
`blocks_iff` leaves no other reading.  What the system supplies is
`source_nonempty`.  `H`'s selections are recovered through
`BlockerPreference.ofCriticalShellSystem`. -/
def ofCriticalShellSystem {A : Finset ℝ²} (H : CriticalShellSystem A) :
    CanonicalBlockerRelation A :=
  ofExistsBlocker A fun source hsource =>
    ⟨H.centerAt source hsource, isCanonicalBlocker_centerAt H source hsource⟩

/-- The blocker relation of a carrier with no removable vertex.  This is the
choice-free counterpart of `exists_criticalShellSystem`: it stops at the
relation instead of selecting one center per source. -/
def ofNoRemovableVertex {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hnoRem : ∀ q : ℝ², ¬ IsRemovableVertex A q) :
    CanonicalBlockerRelation A :=
  ofExistsBlocker A fun source hsource =>
    exists_isCanonicalBlocker hK4 hsource (hnoRem source)

/-- The relation of a critical shell system accepts a center exactly when
that center is a legal blocker. -/
theorem ofCriticalShellSystem_blocks {A : Finset ℝ²}
    (H : CriticalShellSystem A) (source center : ℝ²) :
    (ofCriticalShellSystem H).blocks source center ↔
      IsCanonicalBlocker A source center := Iff.rfl

end CanonicalBlockerRelation

/- ## Preferences and the late selection -/

/-- A preference over the blockers recorded by `R`.

The only constraint is `exists_preferred_or_default`: on a carrier source the
preference either names a center that `R` already accepts, or names no center
at all.  A preference can therefore express a branch-specific wish without
being able to force an illegal center. -/
structure BlockerPreference {A : Finset ℝ²} (R : CanonicalBlockerRelation A)
    where
  /-- The preferred centers of each source. -/
  preferred : ℝ² → ℝ² → Prop
  /-- A carrier source either has a preferred center that `R` accepts, or has
  no preferred center at all. -/
  exists_preferred_or_default :
    ∀ source : ℝ², source ∈ A →
      (∃ center : ℝ², preferred source center ∧ R.blocks source center) ∨
        ∀ center : ℝ², ¬ preferred source center

namespace BlockerPreference

/-- The preference that names nothing.  Selecting under it takes an arbitrary
legal blocker at every source, reproducing the historical behaviour of
`exists_criticalShellSystem`. -/
def unconstrained {A : Finset ℝ²} (R : CanonicalBlockerRelation A) :
    BlockerPreference R where
  preferred := fun _ _ => False
  exists_preferred_or_default := fun _ _ => Or.inr fun _ => not_false

/-- The preference that names, at each carrier source, the center a given
critical shell system already selected.  Every such center is legal, so the
`exists_preferred_or_default` obligation is discharged by
`isCanonicalBlocker_centerAt`. -/
def ofCriticalShellSystem {A : Finset ℝ²} (R : CanonicalBlockerRelation A)
    (H : CriticalShellSystem A) : BlockerPreference R where
  preferred := fun source center =>
    ∃ hsource : source ∈ A, center = H.centerAt source hsource
  exists_preferred_or_default := fun source hsource =>
    Or.inl ⟨H.centerAt source hsource, ⟨hsource, rfl⟩,
      R.blocks_centerAt H source hsource⟩

/-- The system preference names exactly one center at each carrier source. -/
theorem ofCriticalShellSystem_unique {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (H : CriticalShellSystem A)
    {source : ℝ²} (hsource : source ∈ A) (center : ℝ²)
    (h : (ofCriticalShellSystem R H).preferred source center) :
    center = H.centerAt source hsource := h.choose_spec

end BlockerPreference

namespace CanonicalBlockerRelation

/-- At every carrier source there is a recorded blocker that is preferred
whenever any preferred blocker exists at all.  This is the selection step,
isolated from the shell data it will later be packaged with. -/
theorem exists_preferred_blocker {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    ∃ center : ℝ², R.blocks source center ∧
      ((∃ c : ℝ², pref.preferred source c ∧ R.blocks source c) →
        pref.preferred source center) := by
  classical
  by_cases h : ∃ c : ℝ², pref.preferred source c ∧ R.blocks source c
  · exact ⟨h.choose, h.choose_spec.2, fun _ => h.choose_spec.1⟩
  · exact ⟨(R.source_nonempty source hsource).choose,
      (R.source_nonempty source hsource).choose_spec, fun hc => absurd hc h⟩

/-- The center selected at a carrier source: a preferred legal blocker when
the preference names one, and an arbitrary legal blocker otherwise. -/
noncomputable def preferredCenter {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) : ℝ² :=
  (R.exists_preferred_blocker pref source hsource).choose

/-- The selected center is a recorded blocker. -/
theorem blocks_preferredCenter {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    R.blocks source (R.preferredCenter pref source hsource) :=
  (R.exists_preferred_blocker pref source hsource).choose_spec.1

/-- The selected center is a legal blocker. -/
theorem isCanonicalBlocker_preferredCenter {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    IsCanonicalBlocker A source (R.preferredCenter pref source hsource) :=
  R.isCanonicalBlocker_of_blocks hsource
    (R.blocks_preferredCenter pref source hsource)

/-- If the preference names any center at a carrier source, the selected
center is one of the named ones.  The `exists_preferred_or_default` field is
what upgrades a bare preference into a legal one here. -/
theorem preferred_preferredCenter {A : Finset ℝ²}
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A)
    (hex : ∃ c : ℝ², pref.preferred source c) :
    pref.preferred source (R.preferredCenter pref source hsource) := by
  rcases pref.exists_preferred_or_default source hsource with hgood | hnone
  · exact (R.exists_preferred_blocker pref source hsource).choose_spec.2 hgood
  · obtain ⟨c, hc⟩ := hex
    exact absurd hc (hnone c)

end CanonicalBlockerRelation

/-- The compatibility adapter: turn a blocker relation and a preference into a
total critical shell system, selecting each source's center only now.

Global four-point structure supplies the exact row at every selected center
through `nonempty_criticalSelectedFourClass_of_isCanonicalBlocker`, so the
selection carries all the data a `CriticalShellSystem` field needs. -/
noncomputable def chooseCriticalShellSystem {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R) :
    CriticalShellSystem A where
  shellAt := fun q hq =>
    ⟨R.preferredCenter pref q hq,
      Classical.choice
        (nonempty_criticalSelectedFourClass_of_isCanonicalBlocker hK4
          (R.isCanonicalBlocker_preferredCenter pref q hq))⟩
  no_qfree := fun q hq =>
    (R.isCanonicalBlocker_preferredCenter pref q hq).no_qfree

/-- The assembled system selects exactly the center the relation and
preference produced. -/
theorem chooseCriticalShellSystem_centerAt {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    (chooseCriticalShellSystem hK4 R pref).centerAt source hsource =
      R.preferredCenter pref source hsource := rfl

/- ## Round trip -/

/-- Round trip, first half: every center the adapter selects is recorded by
the relation it was built from. -/
theorem chooseCriticalShellSystem_blocks {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    R.blocks source
      ((chooseCriticalShellSystem hK4 R pref).centerAt source hsource) :=
  R.blocks_preferredCenter pref source hsource

/-- Every center the adapter selects is a legal blocker of its source. -/
theorem isCanonicalBlocker_chooseCriticalShellSystem_centerAt
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    (source : ℝ²) (hsource : source ∈ A) :
    IsCanonicalBlocker A source
      ((chooseCriticalShellSystem hK4 R pref).centerAt source hsource) :=
  R.isCanonicalBlocker_preferredCenter pref source hsource

/-- A preference that names a unique center at a carrier source pins the
adapter's selection to that center. -/
theorem chooseCriticalShellSystem_centerAt_eq {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) (pref : BlockerPreference R)
    {source center : ℝ²} (hsource : source ∈ A)
    (hpref : pref.preferred source center)
    (huniq : ∀ c : ℝ², pref.preferred source c → c = center) :
    (chooseCriticalShellSystem hK4 R pref).centerAt source hsource = center :=
  huniq _ (R.preferred_preferredCenter pref source hsource ⟨center, hpref⟩)

/-- Round trip, second half: selecting from a system's own relation under the
preference for that system's own centers returns those centers.

Stated pointwise on `centerAt`, because `CriticalShellSystem` carries no
extensionality lemma and none is available: the two systems still hold
independently chosen label records. -/
theorem chooseCriticalShellSystem_centerAt_ofCriticalShellSystem
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A) :
    (chooseCriticalShellSystem hK4 (CanonicalBlockerRelation.ofCriticalShellSystem H)
        (BlockerPreference.ofCriticalShellSystem
          (CanonicalBlockerRelation.ofCriticalShellSystem H) H)).centerAt
      source hsource = H.centerAt source hsource :=
  chooseCriticalShellSystem_centerAt_eq hK4 _ _ hsource ⟨hsource, rfl⟩
    fun _ hc =>
      BlockerPreference.ofCriticalShellSystem_unique _ H hsource _ hc

/-- Two critical shell systems that select the same center at a source select
the same exact row support there.  Both supports are the whole ambient radius
class of that center through that source, so they cannot differ; only the four
label names may. -/
theorem selectedAt_support_eq_of_centerAt_eq {A : Finset ℝ²}
    (H H' : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A)
    (hcenter : H'.centerAt source hsource = H.centerAt source hsource) :
    (H'.selectedAt source hsource).toCriticalFourShell.support =
      (H.selectedAt source hsource).toCriticalFourShell.support := by
  have hr' :
      (H'.selectedAt source hsource).toCriticalFourShell.radius =
        dist (H'.centerAt source hsource) source :=
    ((H'.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      source
      (H'.selectedAt source hsource).toCriticalFourShell.q_mem_support).symm
  have hr :
      (H.selectedAt source hsource).toCriticalFourShell.radius =
        dist (H.centerAt source hsource) source :=
    ((H.selectedAt source hsource).toCriticalFourShell.support_eq_radius
      source
      (H.selectedAt source hsource).toCriticalFourShell.q_mem_support).symm
  rw [(H'.selectedAt source hsource).toCriticalFourShell.support_eq,
    (H.selectedAt source hsource).toCriticalFourShell.support_eq, hr, hr',
    hcenter]

/-- Round trip on rows: selecting from a system's own relation under the
preference for that system's own centers returns that system's exact row
support at every source. -/
theorem chooseCriticalShellSystem_support_ofCriticalShellSystem
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (H : CriticalShellSystem A) (source : ℝ²) (hsource : source ∈ A) :
    ((chooseCriticalShellSystem hK4
          (CanonicalBlockerRelation.ofCriticalShellSystem H)
          (BlockerPreference.ofCriticalShellSystem
            (CanonicalBlockerRelation.ofCriticalShellSystem H) H)).selectedAt
        source hsource).toCriticalFourShell.support =
      (H.selectedAt source hsource).toCriticalFourShell.support :=
  selectedAt_support_eq_of_centerAt_eq H _ source hsource
    (chooseCriticalShellSystem_centerAt_ofCriticalShellSystem hK4 H source
      hsource)

/- ## Compatibility with the historical producer -/

/-- A blocker relation together with global four-point structure produces a
total critical shell system.  The preference is left unconstrained, so this is
the arbitrary early choice made explicit and confined to one place. -/
theorem nonempty_criticalShellSystem_of_canonicalBlockerRelation
    {A : Finset ℝ²} (hK4 : HasNEquidistantProperty 4 A)
    (R : CanonicalBlockerRelation A) : Nonempty (CriticalShellSystem A) :=
  ⟨chooseCriticalShellSystem hK4 R (BlockerPreference.unconstrained R)⟩

/-- The historical producer `exists_criticalShellSystem`, factored through the
blocker relation: a carrier with no removable vertex has a blocker relation,
and the adapter turns it into a total system. -/
theorem nonempty_criticalShellSystem_of_no_removable {A : Finset ℝ²}
    (hK4 : HasNEquidistantProperty 4 A)
    (hnoRem : ∀ q : ℝ², ¬ IsRemovableVertex A q) :
    Nonempty (CriticalShellSystem A) :=
  nonempty_criticalShellSystem_of_canonicalBlockerRelation hK4
    (CanonicalBlockerRelation.ofNoRemovableVertex hK4 hnoRem)

/-- Counterexample-data form: a minimal datum supplies the blocker relation of
its carrier. -/
def canonicalBlockerRelation_of_minimal {D : CounterexampleData}
    (hmin : D.Minimal) : CanonicalBlockerRelation D.A :=
  CanonicalBlockerRelation.ofNoRemovableVertex D.K4
    (CounterexampleData.not_isRemovableVertex_of_minimal hmin)

end ATailFrontierLiveClosure
end Problem97
