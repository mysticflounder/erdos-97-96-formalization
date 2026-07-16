# Original-q q-critical cross-survival sink match

Date: 2026-07-16

Status: **kernel-checked full-parent adapter; source-clean; no contradiction and
no production `sorry` closure.**

Lean artifact:
`QCriticalCrossSinkMatch.lean`

## Question

Can either disjunct of

```text
OriginalQOutsideMiddleParentContext.cross_survival_of_qCritical_qCritical
```

be consumed by the existing cross-survival lanes without inventing support
identifications?

Yes, but only as an exact nonterminal normal form.  The strongest checked
unconditional sink is the global source-selection endpoint already developed
above `CrossSurvivalEliminator`; it is not either conditional `False` theorem
from `r-f2-cross-survival-sink`.

## Bank preflight

Before adding the adapter, the mandated registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`; and
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

The indexed Lean corpora were searched with `nthdegree docs search --lean`
for cross-deletion survival, q-deleted survivor rows, common outside-cap
pairs, and q-critical/q-deleted class incompatibilities.  The only direct
production hit was the critical-map relocation family in
`ATail/CriticalPairFrontier`; that family requires a
`SurvivorPairRelocationPacket` on one retained first-apex marginal and does not
accept the live-heavy `x,y` pair.  The U5 contradiction banks require further
named row incidences.  No banked theorem turns deletion survival into support
membership in the independently selected survivor.

## Exact interface mismatch

The new continuation theorem returns only

```text
HasNEquidistantPointsAt 4 (D.A.erase y) x
or
HasNEquidistantPointsAt 4 (D.A.erase x) y.
```

`nonempty_qDeletedFourRow_of_survival` chooses an exact four-row witnessing
that survival.  Its support is not definitionally the original generated row
at the same center.

Consequently the conditional terminals in
`r-f2-cross-survival-sink` cannot be reused by renaming fields.  Their
essential inputs are memberships in the independently selected survivor.  In
the present original-`q` setting, the left orientation would need exactly:

```text
q in survivor.support
and
some a != q outside oppCap2 in both survivor.support and the generated row at y.
```

The right orientation needs the symmetric two fields.  Neither membership is
implied by deletion survival.  In particular, selected-support omission is
not promoted to a metric or cap fact.

## Proven adapter

The new file proves four reusable steps.

1. `crossSurvivalOutput_of_two_arm_survival` packages either raw survival with
   its exact q-deleted row.
2. `nonempty_crossSurvivalApexPacket_of_crossSurvivalOutput` retains the
   original second-apex row without requiring the unrelated
   `CriticalPairFrontier` parameters used by the older adapter.
3. `existingCrossSinkNormalForm` applies the strongest checked global
   source-selection sink.
4. The full-parent theorem

   ```text
   OriginalQOutsideMiddleParentContext.
     qCritical_qCritical_existingCrossSinkNormalForm
   ```

   discharges `q != leafPacket.oppApex2` from the existing parent fact and
   reaches that normal form directly.

The exact output is an oriented `CrossSurvivalApexPacket` plus one of:

1. a fresh global escape source and a `CommonDeletionTwoCenterPacket` for the
   original deleted point;
2. a fresh global escape source and a `CommonDeletionTwoCenterPacket` for the
   old survivor center;
3. `ApexDoubleCriticalResidual`;
4. a relocated-blocker `CommonDeletionTwoCenterPacket`; or
5. `DeletedBlockerApexAlignment`.

This is strictly stronger than the one-row cardinality normal form and avoids
the unsupported survivor/generated-row identification.  It is still not
`False`.

## Remaining consumer boundary

There are two sound next routes.

- Eliminate the generic common-deletion packets using additional retained
  parent incidence or metric data.
- Feed `ApexDoubleCriticalResidual` or `DeletedBlockerApexAlignment` into the
  paired prescribed-deletion h4/h5 terminal together with its remaining
  row/anchor incidences.

If the direct ordered-cap terminal is pursued instead, the first missing
survivor field is `q in survivor.support`; after that, one still needs a
second non-`q` common outside-cap point with the opposite generated row.  A
support-equality theorem would be stronger than necessary and is not
justified by the current extraction.

## Validation

The source-current file was checked with Lean 4.27.0 from `lean/`, using the
existing scratch olean directories and emitting:

```text
/private/tmp/p97-r-f2-original-q-qcritical-cross-sink-match-oleans/
  QCriticalCrossSinkMatch.olean
```

All five local `#print axioms` checks report exactly:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, declared axiom, `native_decide`, or
`unsafe`.  No full Lake build was run.

## Bottom line

The two q-critical cross-survival arms now enter the strongest existing
source-faithful sink at the full parent.  This advances the checked proof
surface, but it does not close K-A-PAIR: the remaining work is endpoint
consumption, not another cross-survival reclassification or finite-pattern
mining pass.
