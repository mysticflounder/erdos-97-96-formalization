# F2 source-indexed second-apex radius transport audit

## Outcome

The source-indexed audit is settled.

The generic `deleted` in the F2 metric consumer is, after the anchored lift,
the fresh row-external point:

```text
F2 deleted = X.point
```

It is **not** the older coherent point `R.deleted`.

No currently retained parent row realizes the forbidden equality

```text
dist S.oppApex2 X.point = R.secondApexRow.radius.
```

More strongly, the checked F2 metric theorem proves the negation.  Therefore
every selected row at `S.oppApex2` that contains `X.point` has radius
different from `R.secondApexRow.radius` and has selected support disjoint from
`R.secondApexRow.support`.

The smallest valid row-identity producer is now explicit:

```lean
FreshRetainedRadiusTransport X
```

It consists of:

1. a selected row at `S.oppApex2` containing `X.point`; and
2. one actual selected support point common to that row and
   `R.secondApexRow`.

`false_of_freshRetainedRadiusTransport` proves this packet immediately
contradictory with every anchored F2 profile.  Thus a global producer of this
finite incidence packet would close the F2 residual.  The current interfaces
do not produce it.

This scratch lane does not close a production `sorry`.

## Theorem-bank preflight

Before formalizing the transport boundary, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current anchored coherent-R and F2 source files;
- the reciprocal second-apex radius consumer;
- the critical-pair exact-shell constructors;
- the cross-survival parent apex row and apex-omission classifiers; and
- focused `nthdegree docs search --lean` queries for same-center radius
  transport and second-apex card-five consequences.

No banked theorem identifies a parent row containing the anchored
`X.point` with the retained F2 radius.

The direct reusable bank match is:

```lean
firstApex_marginal_inter_secondClass_card_le_one
```

equivalently its underlying kernel:

```lean
U2NonSurplusSqueeze.oppCap2_escape_gen
```

Distinct off-surplus points on one first-apex radius cannot also share a
second-apex radius.

## Exact source-indexed row inventory

### 1. The only stored anchored second-apex row

`CoherentRCommonDeletionPacket.secondApexRow` is selected over:

```text
(D.A.erase R.sourcePair.x).erase R.deleted
```

at `S.oppApex2`.  Therefore its support omits both:

```text
R.sourcePair.x
R.deleted.
```

`RowExternalCommonDeletionSource` additionally records:

```text
X.point ∉ R.secondApexRow.support.
```

The following are not new rows:

```text
R.secondApexRowQDeleted
X.secondRowXDeleted
(alignedSharedRowPacket X hcenter).row₂
```

They copy the same support and the same radius.  The checked theorem
`alignedSharedRowPacket_row₂_radius` records the last radius identity
definitionally.

### 2. The three second-apex survival facts

The facts:

```text
X.survives_secondApex
R.deleted_survives_secondApex
R.source_survives_secondApex
```

do not choose rows containing their deleted labels.  Each is witnessed by
the same retained `R.secondApexRow`, precisely because that support omits the
deleted label.

Consequently these survival proofs provide no containing-row radius
transport.

### 3. Critical rows from prescribed deletion failure

`erase_survives_or_criticalSelectedFourClass_at` constructs a selected
critical shell containing a named point only in the deletion-failure arm.
All three anchored deletions survive at `S.oppApex2`, so this constructor does
not produce a containing row for:

```text
X.point
R.deleted
R.sourcePair.x.
```

The separate
`FreshSurvivingMarginalSource.nonempty_deletedFreshCriticalPairFrontier_or_exactSecondApexShells`
can expose shells through `R.deleted` and a separately chosen fresh point.
It does not identify that fresh point with the anchored row-external
`X.point`, and it supplies no equality with `R.secondApexRow.radius`.

For the actual row-external `X.point`,
`RowExternalCommonDeletionSource.deletedExternal_secondApexDouble` already
proves the double deletion survives on the retained row, and
`deletedExternalCriticalPairFrontier` takes the frontier arm.

### 4. Reciprocal critical row

`ReciprocalDirectedCrossResidual.exists_fresh_commonDeletion_or_secondApexCritical`
can produce a critical shell whose support equals
`R.secondApexRow.support`.  Its source `z` is explicitly outside the fixed
first-apex class.  The three audited named points are all in that fixed
class, so this `z` is none of them.

This is a real retained-radius critical row, but it does not transport any of
the three named sources.

### 5. Cross-survival parent apex row

`CrossSurvivalApexPacket.apexRow` is a genuine selected row at
`S.oppApex2` containing its own oriented continuation center and deleted
endpoint.

There is no current adapter that:

- identifies either endpoint with the anchored `X.point`;
- identifies the packet with the coherent-R/F2 packet; or
- equates `O.apexRow.radius` with `R.secondApexRow.radius`.

Moreover, the anchored three named points have pairwise-distinct
second-apex distances.  Therefore one selected second-apex row cannot
contain any two of them.  An attempted role alignment sending both
cross-survival endpoints to two anchored names is already impossible.

## Kernel-checked transport boundary

`F2SecondApexRadiusTransport.lean` proves:

### Generic same-center dichotomy

```lean
sameCenter_radius_eq_or_support_disjoint
```

For selected rows at one center, possibly over different ambient carriers:

```text
same radius OR disjoint selected supports.
```

`namedDistance_eq_retainedRadius_or_support_disjoint` adds a named point in
the first row:

```text
named point lies at retained radius OR row supports are disjoint.
```

`namedDistance_eq_retainedRadius_of_common_hit` chooses the first arm from
one common selected support point.

### Exact F2 polarity

```lean
fresh_off_retained_secondApex_radius
```

proves:

```text
dist S.oppApex2 X.point ≠ R.secondApexRow.radius.
```

Hence:

```lean
fresh_containingRow_radius_ne_retained
fresh_containingRow_disjoint_retained
```

prove that every selected row containing `X.point` lies at a distinct radius
and is selected-support-disjoint from the retained row.

This is the precise negative answer to the parent-row test: no currently
coexisting containing row can realize the forbidden middle radius.

### Pairwise named-radius separation

```lean
named_secondApex_distances_pairwise_ne
```

proves the three distances:

```text
dist S.oppApex2 X.point
dist S.oppApex2 R.deleted
dist S.oppApex2 R.sourcePair.x
```

are pairwise distinct.

The direct row consequences are:

```lean
no_secondApexRow_contains_fresh_and_currentDeleted
no_secondApexRow_contains_fresh_and_coherentSource
no_secondApexRow_contains_currentDeleted_and_coherentSource
```

### Exact status of the other two names

For a selected row containing `R.deleted` or `R.sourcePair.x`, the current
surface gives only:

```text
retained-radius hit OR support-disjointness.
```

Neither arm is selected by current provenance.

If either omitted point nevertheless lies at the retained radius, the full
ambient selected class has cardinality at least five:

```lean
currentDeleted_on_retained_radius_forces_card_five
coherentSource_on_retained_radius_forces_card_five
```

These are structural consequences, not contradictions.  The two hits cannot
hold simultaneously:

```lean
not_both_currentDeleted_and_coherentSource_on_retained_radius
```

## Exact missing producer relation

For the F2 route, the missing relation is not “support omission implies a
distance inequality” and not an anonymous same-center row.

It is exactly one of:

```text
1. FreshRetainedRadiusTransport X

or equivalently

2. a selected row K at S.oppApex2 with
     X.point ∈ K.support
   and
     K.radius = R.secondApexRow.radius.
```

The common-hit form is preferable for mining because it preserves row
identity and uses only finite incidence data.  Any producer of it closes the
F2 residual immediately.

The current `CrossSurvivalApexPacket` is not such a producer until a theorem
aligns its source with `X.point` and its selected row with the retained F2
radius.  No such theorem was found.

## Validation

The file was checked directly with Lean 4.27 from `lean/`, using only
already checked scratch dependency oleans and a temporary output:

```bash
env LEAN_PATH=/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-three-row-metric-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-second-apex-radius-transport-oleans/F2SecondApexRadiusTransport.olean \
  ../scratch/atail-force/r-f2-second-apex-radius-transport/F2SecondApexRadiusTransport.lean
```

It exited `0`.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.  No full build was run.
