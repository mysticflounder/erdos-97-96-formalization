# Source-entitled audit of the exact-12 off-class survivor

## Scope and snapshot

Read `AGENTS.md`, the production target in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`,
the response document
`docs/solve-prompts/false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker-response-08-05-2026.md`,
and `scratch/pentagon-offclass-exact12-v2/REPORT.md`.

The analyzed `survivor.json` was the iteration-298 snapshot with SHA-256
`751f92ed6840e1a524127430bfd97ea8c4cbd3a4abbdeb6a353eaafc09fa2eca`.
The scratch campaign is shared and had changed during the audit, so all label
claims below refer to that hash.

## What the row-only CEGAR cannot see

`structural_cegar.py` decodes only the twelve chosen supports and passes
`MetricRow(center, support, False)` records to `_formalized_metric_core`; it
does not pass the SAT `blocker_variables`. Thus every learned nogood is a
predicate of the equality cube (and, in the second stage, a compatible cyclic
order), not of the source-to-actual-blocker endomap.

Re-solving `cegar-d0-v2/current.cnf` and decoding with the frozen
`probe.build_case(0, 2)` variable map gives

```text
b = {0:9, 1:5, 2:4, 3:6, 4:6, 5:6,
     6:8, 7:4, 8:7, 9:3, 10:6, 11:5}.
```

The source entitlement `q ∈ K_{b(q)}` holds by construction. Two global
features are invisible to the equality core:

1. **Saturated actual-blocker fiber.** The complete fiber over blocker `6` is
   `{3,4,5,10}`, and the selected support centered at `6` is exactly
   `{3,4,5,10}`. This is not merely a repeated row: all four row members are
   sources whose *actual* blocker is that row's center.
2. **Fan-to-fiber basin.** For the response document's second-cap fan
   `T = oppCap2 \ Kxv`, the current labels give `T = {0,2,7,9}` and
   `b(T) = {9,4,3}`. Every `q ∈ T` reaches the saturated fiber in at most
   two blocker steps: `0→9→3`, `2→4`, `7→4`, `9→3`.
   The endomap also has the source-entitled cycle `6→8→7→4→6`.
   A blocker cycle alone is not an obstruction: production already proves
   that every finite critical-shell system has one.

The stable, reusable CEGAR predicate is therefore **saturated blocker support**,
not the raw four-cycle and not another equality-row pattern.

## Existing source-clean producer to promote first

The exact source-entitled producer already exists and kernel-checks in
`scratch/PentagonOffClassProducerProbe.lean`:

```lean
theorem pentagonOffClass_secondCap_fan_two_offCenter_blockers
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (packet :
      ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket P)
    (hsecond : 6 ≤ S.oppCap2.card)
    (hxuA : packet.xu ∈ D.A)
    (hxvA : packet.xv ∈ D.A)
    (huXvRow :
      P.u.1 ∈ ((lateFirstApexSystem R).selectedAt
        packet.xv hxvA).toCriticalFourShell.support)
    (hdeletedXuRow :
      P.jointDeletion.deleted.1 ∈
        ((lateFirstApexSystem R).selectedAt
          packet.xu hxuA).toCriticalFourShell.support)
    (hvDeletedRow :
      P.v.1 ∈ ((lateFirstApexSystem R).selectedAt
        P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2).toCriticalFourShell.support)
    (hxvInterior : packet.xv ∈ S.capInteriorByIndex S.oppIndex2)
    (hblockerInterior :
      (lateFirstApexSystem R).centerAt packet.xv hxvA ∈
        S.capInteriorByIndex S.oppIndex2) :
    let Hlate := lateFirstApexSystem R
    let Kxv := (Hlate.selectedAt packet.xv hxvA).toCriticalFourShell
    let T := S.capByIndex S.oppIndex2 \ Kxv.support
    let c := Hlate.centerAt packet.xv hxvA
    ∃ q r : CarrierVertex D.A,
      q.1 ∈ T ∧ r.1 ∈ T ∧
        Hlate.centerAt q.1 q.2 ≠ Hlate.centerAt r.1 r.2 ∧
        Hlate.centerAt q.1 q.2 ≠ c ∧
        Hlate.centerAt q.1 q.2 ≠ S.oppApex2 ∧
        Hlate.centerAt r.1 r.2 ≠ c ∧
        Hlate.centerAt r.1 r.2 ≠ S.oppApex2
```

This is the verbatim statement at lines 1022ff with only the `_probe` suffix
removed. Its axiom audit is `[propext, Classical.choice, Quot.sound]`.

**Direct consumer:**
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
supplies every hypothesis directly. The producer should be invoked before any
new finite-pattern split. It does not itself close the leaf: no proved terminal
currently consumes merely two distinct off-`{c,O}` blockers in this fan.

## Reusable generic saturation producer

The survivor suggests promoting the inclusion already proved inside
`ATailSurvivalCover.actualBlockerFiber_card_le_four` to the following exact
general theorem:

```lean
theorem actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (anchor : CriticalShellSystem.CarrierVertex A)
    (hcard : (actualBlockerFiber H anchor).card = 4) :
    (actualBlockerFiber H anchor).image (fun source ↦ source.1) =
      (H.selectedAt anchor.1 anchor.2).toCriticalFourShell.support
```

This is a checked-consequence candidate, not a new mathematical obligation:
the existing proof already establishes the left-to-right inclusion; subtype
projection is injective; and both sides then have cardinality four.

**Direct consumers:**

- `pentagonOffClass_secondCap_fan_actualBlocker_not_constant_probe`, whose
  `hTsub`/`hTeq` block is the target-specific version of this argument;
- any source-sensitive CEGAR replay theorem that turns a four-source equal
  blocker assignment into exact support equality;
- the proposed basin obstruction below.

The card-eleven first-apex specialization
`lateFirstApex_actualBlockerFiber_points_eq_class` already exists, but it is
special to the canonical first-apex class and does not cover the survivor's
off-apex blocker `6`.

## Predicate for the next CEGAR split

The exact source-entitled predicate that distinguishes this survivor is:

```lean
noncomputable def feedsSaturatedActualBlockerFiber
    {A : Finset ℝ²} (H : CriticalShellSystem A) (T : Finset ℝ²) : Prop :=
  ∃ anchor : CriticalShellSystem.CarrierVertex A,
    (actualBlockerFiber H anchor).card = 4 ∧
      ∀ q : CriticalShellSystem.CarrierVertex A, q.1 ∈ T →
        H.blockerVertex q ∈ actualBlockerFiber H anchor ∨
          H.blockerVertex (H.blockerVertex q) ∈
            actualBlockerFiber H anchor
```

For this snapshot take `anchor = 3`; its actual blocker is `6`, its fiber is
`{3,4,5,10}`, and the four fan paths listed above prove the predicate.

`PARKED-SPEC`: a terminal of the form

```lean
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_
  pentagonOffClassBlocker_feedsSaturatedFiber
```

should take exactly the production off-class target's hypotheses plus
`feedsSaturatedActualBlockerFiber Hlate T` and conclude `False`. Its direct
consumer would be the production off-class target after a checked branch split.
This is the branch that excludes the present survivor, but it is not yet a
proved theorem and must not be counted as closure.

## Bank and consumer audit

- The three required general-n registries contain no actual-blocker-fiber or
  saturated-support terminal. The sibling `p97-rvol` registry's only textual
  blocker/`centerAt` match is `off_row_named_label_forbidden`; the legacy and
  older-general registries have none.
- Lean-corpus searches found the generic APIs
  `selectedSupports_eq_of_actualBlockers_eq`,
  `actualBlockerFiber_card_le_four`, and
  `exists_pair_distinct_actualBlockers_of_five_le_card`, plus the special
  first-apex exact-fiber theorem. None forbids the saturated off-apex fiber.
- The U5 theorem banks consume bounded selected-class incidence patterns, not
  the source-to-blocker endomap, so row-cube matching is insufficient.
- `false_of_twoDistinctExactFourMutualOmissionJointDeletions_blockerCollision`
  and the four-center common-deletion terminals are not valid closure
  consumers here: they require stronger joint-deletion interfaces and retain
  `sorry` obligations.

## Recommendation

Promote the already-proved two-off-center fan producer and the generic
card-four saturation lemma. Then make `feedsSaturatedActualBlockerFiber` the
next source-sensitive CEGAR predicate. Do not spend another iteration learning
only equality-row nogoods: the current survivor's distinguishing information
is in the blocker variables that the detector discards.
