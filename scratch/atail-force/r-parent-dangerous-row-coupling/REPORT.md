# Full-parent dangerous-row coupling

Date: 2026-07-16

## Verdict

Status: **PROVEN sharper parent normal form and negative closure boundary**.

Rebuilding the critical-shell system before selecting the frontier is valid
and useful, but it does **not** close the coherent R arm. The rebuild makes
dangerous-row alignment exact; it does not force that alignment.

The Lean implementation is
`r-parent-dangerous-row-coupling/DangerousRowCoupling.lean`. Direct
compilation succeeds, every printed theorem is free of `sorryAx`, and the
only reported axioms are:

```text
propext
Classical.choice
Quot.sound
```

## Exact live row

The `U1LargeCapRouteBTailLiveData` fields alone prove

```text
SelectedClass D.A p (dist p q) = {q,t1,t2,t3}.
```

This is
`liveData_dangerous_selectedClass_eq_base`. It uses the exact q-deleted
radius class and the dangerous-triple support, rather than importing the
same equality from `hfixed`.

The file then constructs

```text
liveData_dangerousCriticalRow :
  CriticalSelectedFourClass D.A q p
```

with exact support `{q,t1,t2,t3}`. The critical shell itself comes from the
exact live class. The additional fact that deletion of `q` blocks `p` still
comes from `hlocalNoQFree`; exact radius data alone is not a deletion-blocking
certificate.

## Rebuild before frontier extraction

`collapseLiveDangerousBlockers` overrides an arbitrary
`CriticalShellSystem` on the exact live class. The symmetry lemma for an exact
blocked four-class proves that every one of its four points may use `p` as
its blocker.

The key checked equivalence is:

```text
collapseLiveDangerousBlockers_centerAt_eq_p_iff :
  Hcollapsed.centerAt z = p ↔ z ∈ {q,t1,t2,t3}.
```

The reverse implication is the override. The forward implication is also
content-bearing: if `z` were outside the exact class, the complete dangerous
four-row would survive deleting `z`, contradicting the selected blocker's
`no_qfree` field.

On the aligned class, the rebuilt selected row is definitionally locked:

```text
collapseLiveDangerousBlockers_selectedAt_support_eq_base :
  selectedAt(z).support = {q,t1,t2,t3}.
```

`LiveDangerousRetainingSystem` packages the rebuilt system, the explicit
critical row through `q`, the deletion-blocking fact at `q`, and these two
global invariants.

The full parent wrapper

```text
fullParent_extracts_dangerousRetainingFrontier
```

constructs this system first and then invokes
`exists_criticalPairFrontier_of_K4`. Thus every later orbit and coherent-R
packet genuinely uses the dangerous-retaining system; this is not a
post-hoc provenance assertion.

## Exact coherent-R coupling

For every coherent packet over the rebuilt system:

```text
coherent_source_center_eq_p_iff :
  R.firstCenter = p ↔ R.sourcePair.x ∈ {q,t1,t2,t3}.
```

The parent also retains `q ∈ S.surplusCap`, while coherent sources are
off-surplus. Therefore the exact parent-facing form is:

```text
coherent_source_center_eq_p_iff_mem_dangerousTriple :
  R.firstCenter = p ↔ R.sourcePair.x ∈ {t1,t2,t3}.
```

If alignment holds, then:

```text
R.sourceRow.support = {q,t1,t2,t3}
R.deleted ∉ {q,t1,t2,t3}.
```

If alignment does not hold, the two-circle theorem gives only:

```text
|R.sourceRow.support ∩ {q,t1,t2,t3}| ≤ 2.
```

No lower bound follows.

## Anchored fresh successor

The direct wrapper

```text
AnchoredCoupling.exists_fresh_commonDeletionSuccessor_with_liveRow
```

shows that aligned anchored data produces a fresh point `X.point` satisfying:

```text
X.point ∉ {q,t1,t2,t3}
R.sourceRow.support = {q,t1,t2,t3}
CommonDeletionTwoCenterPacket D W.H X.point p S.oppApex2.
```

This is a sharper common-deletion packet with the live dangerous row retained
as its first exact row. It is not contradictory: deleting a point outside the
dangerous row is exactly why K4 at `p` survives.

## Reciprocal directed cross

The reciprocal residual has one additional unconditional consequence:

```text
ReciprocalCoupling.deleted_not_mem_liveDangerousBase :
  R.deleted ∉ {q,t1,t2,t3}.
```

If `deleted` belonged to the dangerous class, its selected row would be the
dangerous row. Since the reciprocal residual places the source in that row,
the source would also belong to the dangerous class. Both blocker centers
would then equal `p`, contradicting the residual's
`blocker_centers_ne` field.

The direct global-boundary specialization is:

```text
ReciprocalCoupling.nonempty_liveRowAlignedGlobalContinuation.
```

Under `R.firstCenter = p`, it retains the full output of
`exists_fresh_commonDeletion_or_secondApexCritical` and additionally proves:

```text
R.sourceRow.support = {q,t1,t2,t3}
z ∉ {q,t1,t2,t3}.
```

The continuation is still exactly:

```text
CommonDeletionTwoCenterPacket D W.H z p S.oppApex2
```

or a prescribed critical shell at `S.oppApex2` whose support is the retained
second-apex row.

## Why the override does not close

The frontier pair is chosen from an off-surplus first-apex marginal by the
second-apex double-deletion theorem. That choice is independent of the
critical-shell system. Rebuilding the system changes the blocker and row
selected **if** a chosen source belongs to the dangerous class; it cannot
make an arbitrary chosen marginal source belong to that class.

The first missing antecedent is therefore exact:

```text
R.sourcePair.x ∈ {t1,t2,t3}
```

equivalently:

```text
R.firstCenter = p.
```

Nothing in the current parent fields or theorem bank forces this. On the
complementary branch, the rebuild supplies only the upper intersection bound
`≤ 2`. A closing live-row theorem would still need positive incidence plus
the relevant cap/order placement, or a different global consumer for the
common-deletion / prescribed-second-apex continuation.

## Bank preflight

The required general-n registries and indexed Lean corpora were checked
before implementing this file. The closest current results are:

- `t2Row_selected_support_eq_dangerous_of_center_p`;
- the exact dangerous-class and q-deleted-radius helpers;
- `CriticalShellSystem.overrideExactSelectedClass`;
- blocker-row uniqueness and two-circle intersection bounds;
- the existing robust-live transport conditional consumer; and
- the anchored and reciprocal global continuation theorems used here.

The U5 residual-bank contradiction remains in the `D.IsM44` regime and
cannot be transported to the live `hNoM44` parent. No banked theorem forces
an arbitrary off-surplus frontier source into `{t1,t2,t3}`.

## Validation

From `lean/`:

```bash
env LEAN_PATH=/tmp/p97-r-orbit-entry-oleans lake env lean \
  -R .. -M 16384 \
  -o /tmp/p97-r-orbit-entry-oleans/DangerousRowCoupling.olean \
  ../scratch/atail-force/r-parent-dangerous-row-coupling/DangerousRowCoupling.lean
```

The command exits successfully.
