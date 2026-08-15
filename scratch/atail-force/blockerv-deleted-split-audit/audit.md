# `BlockerV / vRowBlockerDeleted` split audit

Date: 2026-08-06

## Verdict

Split on whether the actual blocker of the **deleted-point row** lies in the
physical five-class:

```lean
by_cases hcenterDeletedClass :
    (lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
        P.jointDeletion.deleted.2 ∈
      SelectedClass D.A S.oppApex2 P.rho
```

This is a source-proved exhaustive binary split.  Its on-class branch is
source-closable in full.  Its only live child is the off-class branch.  Thus
the active coordinator frontier changes from one coarse leaf to one strictly
narrower leaf; it does not increase active fan-out.

## Current provenance and consumer

- The live declaration is
  `false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted`
  at `Rigid221SourceHeavy.lean:3810`; its body is the `sorry` at line 3823.
- Its data are `ExactFourRigid221PentagonBlockerVResidual` at lines 3507--3573
  plus `centerAt v = deleted` at lines 3818--3821.
- The only direct source consumer is the parent pentagon coordinator at lines
  4013--4015.  The parent already proves the split which selects this leaf.

The residual fixes the five row edges

```text
u -- xu -- deleted -- v -- xv -- u
```

and the three consecutive actual blockers

```text
centerAt u  = xv
centerAt xv = v
centerAt v  = deleted.
```

It also gives the deleted-row edge `{deleted,v}`, the exclusions of
`u,xu,xv` from that row, and an exact five-class cover.

## Source producer before the split

From `Q` and `hcenterV`, the parent can source-prove both:

```lean
P.jointDeletion.deleted.1 ∈ S.capInteriorByIndex S.oppIndex2

(lateFirstApexSystem R).centerAt P.jointDeletion.deleted.1
    P.jointDeletion.deleted.2 ∈
  S.capInteriorByIndex S.oppIndex2
```

Both are applications of
`commonPhysicalPair_center_mem_secondCapInterior`:

1. use the `v`-row pair `{v,xv}` and `centerAt v = deleted` to localize
   `deleted`;
2. use the deleted-row pair `{deleted,v}` to localize `centerAt deleted`.

Every carrier/class/distinctness premise is already in `Q`, `packet`, or the
critical-shell invariants.  The scratch proof constructs both localizations.

## Proposed child declarations

The on-class child is a proved private helper, not a new obligation:

```lean
private theorem false_of_..._vRowBlockerDeleted_deletedRowBlockerClass
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV : centerAt P.v.1 P.v.2 = P.jointDeletion.deleted.1)
    (hcenterDeletedClass :
      centerAt P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ∈
        SelectedClass D.A S.oppApex2 P.rho) : False
```

The sole active child should expose the source-produced interior fact:

```lean
theorem false_of_..._vRowBlockerDeleted_deletedRowBlockerOffClass
    (Q : ExactFourRigid221PentagonBlockerVResidual P packet)
    (hcenterV : centerAt P.v.1 P.v.2 = P.jointDeletion.deleted.1)
    (hcenterDeletedInterior :
      centerAt P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (hcenterDeletedOffClass :
      centerAt P.jointDeletion.deleted.1 P.jointDeletion.deleted.2 ∉
        SelectedClass D.A S.oppApex2 P.rho) : False := by
  sorry
```

The parent proves `hcenterDeletedInterior`, performs the `by_cases`, calls the
proved on-class helper in the positive arm, and calls this child in the
negative arm.  No conditional closer package or off-spine proposition-valued
producer is needed.

## On-class subarms and consumers

Write `c = centerAt deleted`.  `Q.hclassFive c hcenterDeletedClass` is the
source-proved exhaustive five-way refinement.

| Equality | Closure | Status |
|---|---|---|
| `c = u` | Existing ordered-cap three-successive-bisector cycle, using blockers `v`, `deleted`, `u` on edges `{xv,u}`, `{v,xv}`, `{deleted,v}` | directly closed |
| `c = xu` | Four-successive-bisector ordered-cap cycle on `u,xu,deleted,v,xv` | directly closed by the scratch kernel |
| `c = deleted` | `centerAt_ne_source` for the deleted row | existing direct consumer |
| `c = v` | `CriticalFourShell.center_not_mem_support`, since `v` is in the deleted row | existing direct consumer |
| `c = xv` | The `deleted` and `xv` betweenness constraints for the same edge `{deleted,v}` are mutually impossible | directly closed by two calls to `index_strictly_between_of_equidistant` |

The `c = xu` arm needs a small reusable four-cycle lemma.  It is not an
additional mathematical obligation: `FourCycleKernel.lean:16` proves it from
four calls to the existing ordered-cap theorem and `omega`.  The full on-class
closure is proved at `FourCycleKernel.lean:96`.

## Narrowing measure and frontier accounting

- Before: one active theorem with `Q` and `centerAt v = deleted`.
- Split producer: excluded middle on class membership of `centerAt deleted`.
- Positive child: adds membership in the exact five-class and is fully closed.
- Negative child: adds strict-cap-interior localization and non-membership in
  the exact physical five-class.
- Immediate constructor fan-out: `2` logical arms, `1` active child.
- Active obligation count: `1 -> 1`, with strictly stronger hypotheses.
- The child remains directly consumed by the original theorem, which remains
  directly consumed by the parent pentagon coordinator.  No orphan is created.

## Arms with no known consumer

Only the off-class strict-interior blocker of the deleted row has no known
consumer.

The general-n certificate-bank document and the current mining registries were
checked before selecting this discriminator.  The closest registered U5 and
equality-core consumers require an equilateral/radius coincidence, duplicate
centres on the same three points, equal-K4, or a specified three-triad pattern.
The current deleted-row blocker data produce none of those hypotheses.  The U1
five-point residual likewise needs its own seven equalities and inequality.
No registry entry directly consumes this off-class blocker.

## Verification

`FourCycleKernel.lean` was checked with Lean from the `lean/` project:

```text
lake env lean ../scratch/atail-force/blockerv-deleted-split-audit/FourCycleKernel.lean
exit 0
```

Both the four-cycle kernel and the complete on-class closure have axiom lists

```text
[propext, Classical.choice, Quot.sound]
```

and do not depend on `sorryAx`.  No production file was edited.
