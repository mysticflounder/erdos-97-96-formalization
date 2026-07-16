# Deleted-source pair-row boundary

## Scope

This lane audited the proposed structural producer:

```text
∃ Q : SelectedFourClass D.A X.point,
  s ∈ Q.support ∧ t ∈ Q.support
```

for the two named support-heavy points `s,t` in the validated
`AnchoredSupportHeavyCoupling`.

It owns only:

```text
scratch/atail-force/r-f2-deleted-source-pair-row/
```

No production source, closure document, proof-blueprint state, protected
scratch lane, or `SurplusM44` file was changed.

## Theorem-bank preflight

Before deriving a new row or incidence theorem, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for:
  - a selected four-class centered at `X.point` containing two prescribed
    critical-support points;
  - an equal-distance pair at a prescribed center;
  - a critical-shell-system or fixed-history row containing both points; and
  - the global-K4 row extractor at a specified carrier point.

The indexed search found the generic producer:

```text
exists_selectedFourClass_of_globalK4
```

and generic cap/row counting theorems, but no theorem prescribing both named
points in the row selected at `X.point`.

The source-current search found the more important fact already present in
the validated coupling:

```text
AnchoredSupportHeavyCoupling.deletedSource_separates_supportPair :
  dist X.point s ≠ dist X.point t
```

This inequality comes from
`firstCap_center_separates_secondApex_pair`, not from selected-support
nonmembership.

## Decisive classification

The proposed row is incompatible with the validated local packet.

The anchored support-heavy packet places:

```text
X.point ∈ strict oppCap1
s,t ∈ strict oppCap2
s,t ∈ the retained second-apex row
s ≠ t.
```

Therefore cap order gives:

```text
dist X.point s ≠ dist X.point t.
```

But any `SelectedFourClass D.A X.point` containing both `s` and `t` would
give:

```text
dist X.point s = Q.radius = dist X.point t,
```

which is contradictory.

This is stronger than a mere missing-field observation: the complete
validated local interface proves the negation of the requested row.

Logically, a future theorem could still close the branch by deriving this
forbidden row from additional global hypotheses. Such a result would be a
contradiction theorem, not an ordinary row-construction theorem. The audit
below shows that none of the currently exposed source interfaces supplies
that additional implication.

## Formalized boundary

`DeletedSourcePairRowBoundary.lean` proves:

```text
t ∉ SelectedClass D.A X.point (dist X.point s)
s ∉ SelectedClass D.A X.point (dist X.point t)
```

and, for every selected four-class `Q` centered at `X.point`:

```text
card ({s,t} ∩ Q.support) ≤ 1
s ∉ Q.support ∨ t ∉ Q.support
```

It also proves the quantified negation:

```text
¬ ∃ Q : SelectedFourClass D.A X.point,
    s ∈ Q.support ∧ t ∈ Q.support.
```

## Source-current producer audit

### Global K4

`X.point_mem_A` and `D.K4` do produce:

```text
∃ Q : SelectedFourClass D.A X.point, True.
```

The new theorems sharpen the actual output:

```text
∃ Q : SelectedFourClass D.A X.point,
  card ({s,t} ∩ Q.support) ≤ 1
```

and:

```text
∃ Q : SelectedFourClass D.A X.point,
  s ∉ Q.support ∨ t ∉ Q.support.
```

Thus global K4 supplies an `X.point`-centered row, but every possible such
row necessarily omits at least one named point. Global K4 by itself cannot
be used as the proposed pair-row producer.

### `FixedSingleRadiusTerminalHistory`

The fixed-history interface stores:

- a terminal carrier and its inclusion in the ambient carrier;
- a robust paired-erasure history;
- membership of erased points in one fixed first-apex radius class; and
- a terminal K4 witness at `S.oppApex2`.

It has no row centered at `X.point` and no support-incidence field involving
both `s,t`. Its first-apex data concerns `S.oppApex1`; its surviving K4 data
concerns `S.oppApex2`. Those are already represented in the coupling and do
not alter the strict cap-order inequality at `X.point`.

### `CriticalShellSystem` and the retained critical map

For source `X.point`, the retained map gives:

```text
W.H.selectedAt X.point ...
```

whose center is:

```text
W.H.centerAt X.point ...
```

not `X.point`. This is the actual blocker row. Both `s,t` belong to that
critical shell, so it gives equality at the actual blocker, exactly as the
coupling records.

A different source could in principle have retained blocker center equal to
`X.point`. The new theorem covers that case:

```text
criticalShellRow_inter_namedPair_card_le_one
```

If:

```text
W.H.centerAt source hsource = X.point,
```

then the exact retained critical shell at that source meets `{s,t}` in at
most one point. Hence no entry of the retained critical map can produce the
forbidden pair row either.

### Parent provenance

`CoherentRCommonDeletionPacket`, `AnchoredSourceCriticalTransition`,
`RowExternalCommonDeletionSource`, and
`AnchoredProvenanceF2NormalForm` preserve:

- the fixed first-apex class of `X.point`;
- its exclusion from the retained first and second rows;
- survival after deleting `X.point` at the retained first center and second
  apex;
- the actual blocker critical shell through `X.point`; and
- the exact source/deletion/row provenance.

The aligned common-deletion packet uses `X.point` as the deleted source.
Its row centers are the retained first center and `S.oppApex2`, not
`X.point`. Parent provenance therefore exposes no missing `X.point`-centered
incidence, and the cap-order theorem shows that adding both incidences would
be inconsistent.

### MEC/cap order

This is the decisive interface.

The strict-cap placement plus the retained second-apex row proves:

```text
dist X.point s ≠ dist X.point t.
```

It does not merely fail to prove the proposed equality. It refutes it.

## Consequence for the closure route

The deleted-source pair row must not be described as an ordinary structural
output of global K4, the fixed history, the retained critical map, or parent
provenance:

```text
dist X.point s = dist X.point t
```

and:

```text
∃ Q : SelectedFourClass D.A X.point,
  s ∈ Q.support ∧ t ∈ Q.support
```

are both incompatible with the current validated local packet.

They may remain a *conditional closing target* only if a genuinely new
global theorem is expected to derive the forbidden equality and thereby
prove `False`. No source-current theorem found in this audit does so.

The exact positive data still available are:

```text
dist S.oppApex2 s = dist S.oppApex2 t
dist (actual blocker at X.point) s =
  dist (actual blocker at X.point) t
dist X.point s ≠ dist X.point t.
```

The source-current next route should therefore use the two genuine equality
centers together with the separating source, or attack a generated-row
incidence/placement branch. It should not assume that a third equality center
at `X.point` follows from the existing row-selection interfaces.

No production `sorry` closes in this lane.

## Validation

The authoritative project toolchain is:

```text
leanprover/lean4:v4.27.0
```

The bounded direct check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-anchored-supportheavy-coupling-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-supportheavy-deleted-cap-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$(lake env printenv LEAN_PATH)" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-deleted-source-pair-row-oleans/DeletedSourcePairRowBoundary.olean \
  ../scratch/atail-force/r-f2-deleted-source-pair-row/DeletedSourcePairRowBoundary.lean
```

It exited successfully.

Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`. No full build was run.
