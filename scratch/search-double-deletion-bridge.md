# Double-deletion bridge audit

Target:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_capSource_alignedSingletonRadius_of_secondBlocker_nonbisector`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9447`).

## Verdict

No import-reachable, source-clean theorem currently closes this leaf without a
new geometric/incidence assumption.  The double-deletion facts can be packaged
more sharply, but all clean packages stop before relating the second blocker
or the fresh point `z` to the two named outside points
`Q.source.1`, `Q.otherOutsidePoint`.

The source-clean strengthening with the best exact fit is:

```lean
Problem97.ATAILStageOnePrescribedApexDichotomy.
  double_erase_survives_or_two_disjoint_exact_shells
    {A : Finset ℝ²} {q w center : ℝ²}
    (hcenter : center ∈ A)
    (hqSurvives : HasNEquidistantPointsAt 4 (A.erase q) center)
    (hwSurvives : HasNEquidistantPointsAt 4 (A.erase w) center)
    (hdist : dist center q ≠ dist center w) :
    HasNEquidistantPointsAt 4 ((A.erase q).erase w) center ∨
      ∃ Cq : CriticalSelectedFourClass A q center,
        ∃ Cw : CriticalSelectedFourClass A w center,
          Cq.toCriticalFourShell.radius = dist center q ∧
          Cw.toCriticalFourShell.radius = dist center w ∧
          Disjoint Cq.toCriticalFourShell.support
            Cw.toCriticalFourShell.support
```

Source: `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:397`.
Together with
`FrontierCommonDeletionParentResidual.firstApexFullyDeletionRobust`
(`ATail/OrientedPhysicalApexIngress.lean:291`), the blocked double deletion
packages `x,y` as two disjoint exact first-apex shells.  This adds no
assumption, but only recovers the already-present distinct-radius exact-four
structure; it yields no membership/equidistance involving either `Q` point or
`z`.  Both declarations audit with only `propext`, `Classical.choice`,
`Quot.sound`.

## Other clean candidates and their exact gap

1. Global minimal-deletion extraction:

   ```lean
   Problem97.ATailGlobalMinimalDeletion.
     exists_global_cardMinimal_blocking_subdeletion
       {D} (hmin : D.Minimal) {U}
       (hUsub : U ⊆ D.A) (hUne : U.Nonempty)
       (hremaining : (D.A \ U).Nonempty) :
       ∃ center ∈ D.A \ U, ∃ V,
         V.Nonempty ∧ V ⊆ U ∧
         ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
         ∀ s ∈ V,
           HasNEquidistantPointsAt 4 (D.A \ (V.erase s)) center
   ```

   Source: `ATail/GlobalMinimalDeletion.lean:178`; the radius-pair/core
   refinement is at line 220.  It is source-clean, but for `U = {x,y}` it only
   produces a new blocked center/minimal core.  Survival at the source blocker
   and failure at the first apex are compatible with that conclusion.  It
   supplies no positive incidence with `Q`, `z`, or the singleton cap source.

2. The closest terminal geometry theorem is:

   ```lean
   Problem97.ATailFirstFiberOverlapDescent.
     false_of_firstFiber_twoOutsideHits_of_capCenter
       ...
       (hsourceCenterCap :
         H.centerAt source.1 source.2 ∈ S.capByIndex S.oppIndex1)
       (hcenters : H.centerAt source.1 source.2 ≠
         H.centerAt P.source₁ P.source₁_mem_A)
       (hsourceHit : Q.source.1 ∈ sourceShell.support)
       (hotherHit : Q.otherOutsidePoint ∈ sourceShell.support) :
       False
   ```

   Source: `ATail/FirstFiberOverlapDescent.lean:901`.  It is source-clean, but
   the live hypotheses provide `hcenters` only.  Cap localization of the source
   blocker and both positive support memberships are absent.

3. `cumulative_deletion_blocked_at_source_blocker`
   (`ATail/CriticalPairFrontier.lean:766`) states

   ```lean
   (H : CriticalShellSystem A) (hq : q ∈ A) :
     ¬ HasNEquidistantPointsAt 4
       ((A.erase w).erase q) (H.centerAt q hq)
   ```

   It blocks at the deleted source's selected blocker, not at the first apex.
   There is no center equality making it applicable.  The support/deletion
   equivalence at line 781 likewise only repackages omission.

4. `selectedFourClass_outside_overlap_card_le_one`
   (`ATail/FrontierLiveClosure.lean:7127`) gives an upper bound on off-cap
   support overlap.  It still needs both centers in the cap and does not create
   a positive common hit.

## Theorem-bank, MEC, cap, and Ptolemy audit

- The indexed banks returned only fixed-packet U5 incidence kernels or
  cap-shell intersection upper bounds.  They require absent structures such as
  `U5DangerousTriple`, `U5QDeletedK4Class`, `U5ModeA`, or positive three-point
  overlap.  They do not consume this live packet directly.
- The legacy/source-proved `three_common_equidistant_centers_eq` needs three
  common noncollinear equidistant points and is not imported here.  The live
  data supplies only a two-point chord; `z` is not known to lie on the
  first-apex shell.
- Current MEC results give the standard enclosing-circle boundary/dichotomy
  interfaces but no implication from this double deletion to the missing
  support incidence.
- Ptolemy/cyclic-quadrilateral results require cyclicity or the relevant
  distance equalities first.  Those are precisely the missing facts, so they
  do not avoid a new assumption.

## False positives and trust boundary

`exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions`
(`ATail/FrontierLiveClosure.lean:9996`) is downstream-circular: its coordinator
re-enters the current aligned-singleton/nonbisector leaf.  Its axiom audit
contains `sorryAx`, whereas all clean candidates above do not.

Other apparent joint-deletion/removable-vertex terminals either consume direct
`sorry` closers or require packet hypotheses not available at this leaf.

## First genuinely missing bridge

A sufficient direct producer would prove

```lean
Q.source.1 ∈ secondBlockerShell.support ∧
Q.otherOutsidePoint ∈ secondBlockerShell.support
```

because shell-radius equality immediately contradicts `hsecondNe`.  An
alternative is the three-input package needed by the clean cap-center terminal:
source-blocker cap localization plus both `Q` points in the source shell.
Existing deletion theorems prove omissions, survival, exact cardinalities, and
overlap upper bounds only; none creates either positive-incidence package.

The axiom checks are reproducible with
`scratch/search-double-deletion-axioms.lean`.
