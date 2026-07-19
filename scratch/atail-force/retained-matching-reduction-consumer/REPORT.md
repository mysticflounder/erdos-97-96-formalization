# Retained matching reduction consumer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED SOURCE-FAITHFUL REDUCTION; MATCHING ARM NOT CLOSED**

This lane owns only
`scratch/atail-force/retained-matching-reduction-consumer/`.  It starts from
production `ATail/RetainedMatchingGeometricReduction.lean` and does not edit
production Lean or planning documents.

## Required theorem-bank preflight

Before introducing the new source/cap coupling, the audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the current production and scratch common-deletion, cap-order,
  Kalmanson, exact-five, and critical-row surfaces.

Focused indexed searches included:

```text
two strict opposite cap sources common deletion two centers opposite cap cardinality at least five contradiction
two points same cap equal radius at apex distinct blockers directed omission common deletion
common deletion two center exact rows large cap convex boundary order
strict cap sources directed omission selected critical shells
one way critical source incidence blocker localized same cap common deletion
two common deletion packets shared apex different blockers strict cap sources
critical row through two same cap points blocker same cap exact intersection two
source critical shell cap intersection exactly pair fresh common deletion
```

The closest useful bank theorems are:

- `cross_deletion_survives_iff_not_mem_selected_support`;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `Dumitrescu.perpBisector_apex_bound`;
- the generic `CommonDeletionTwoCenterPacket` expansion/cycle normal forms;
- `U5QCriticalTripleClass.two_triple_points_incompatibility`; and
- the ordinal Kalmanson consumers.

No indexed theorem makes the production geometric reduction contradictory.
The common-deletion expansion is applicable but nonterminal; its exact finite
regressions already prohibit a geometry-free termination claim.  The U5 and
Kalmanson sinks require additional named row incidences or one shared boundary
cycle not produced by the current packet.  The seven equalities required by
`u1TwoLargeCapObstruction` are likewise not projections of this reduction.

## The checked normalization

The production packet stores

```text
omission : RetainedInteriorDirectedOmission R
commonDeletion : RetainedInteriorCommonDeletion omission
oppositeLargeCap : card(cap1) >= 5 or card(cap2) >= 5.
```

`nonempty_orientedRetainedCommonDeletion` normalizes either constructor to

```text
kept, deleted in the complete retained first-apex class;
kept, deleted in strict cap1 interior;
blocker(kept) != blocker(deleted);
CommonDeletionTwoCenterPacket deleted O blocker(kept);
deleted notin selectedAt(kept).support.
```

Here `O = S.oppApex1`.  The last field is not trusted from the earlier
choice proof: it is rederived from the stored packet's survival at
`blocker(kept)` using the exact critical-shell equivalence.  Thus the
orientation remains source-valid even when the packet is consumed through
its public type alone.

## Exact reverse-coupling split

`nonempty_retainedReverseCouplingOutcome` splits on the one remaining actual
cross incidence.

### Reverse hit

If

```text
kept in selectedAt(deleted).support,
```

then `O` and `blocker(deleted)` bisect the same two strict-cap sources.
The first-apex cap-localization theorem proved in this lane gives

```text
blocker(deleted) in strict cap1 interior.
```

Ordered-cap row counting then forces the full exact support statement

```text
selectedAt(deleted).support intersect cap1 = {kept, deleted}.
```

This is stronger than a generic one-way incidence: the blocker is an actual
source-indexed center, and the complete critical shell has no further point
in that cap.

The theorem

```text
actualRow_center_eq_reverseBlocker_of_reverseHit
```

also proves that every actual critical row containing both retained sources
has center exactly `blocker(deleted)`.  The first apex and that blocker
already exhaust the convex-carrier perpendicular bisector.  Therefore a
distinct third actual center through the pair is an impossible producer
target, not a missing routine incidence.

### Reverse omission

If

```text
kept notin selectedAt(deleted).support,
```

exact criticality gives survival after deleting `kept` at
`blocker(deleted)`.  First-apex full deletion robustness gives simultaneous
survival at `O`, so the lane constructs the reverse packet

```text
CommonDeletionTwoCenterPacket kept O blocker(deleted).
```

Together with the original packet, this is a genuinely source-faithful
paired common-deletion residual with two strict-cap origins and two distinct
actual blockers.

## The large-cap disjunction is now consumed

On the reverse-hit arm, if the cap containing the two retained sources is
the large cap, then its strict interior has at least three points.  Since the
reverse critical shell meets that cap exactly in `{kept, deleted}`, a third
strict-cap point `fresh` lies outside the shell.  The checked theorem

```text
exists_fresh_firstCap_commonDeletion_of_reverseHit
```

constructs

```text
CommonDeletionTwoCenterPacket fresh O blocker(deleted).
```

The parent-facing theorem

```text
nonempty_retainedMatchingLargeCapConsumerOutcome
```

therefore gives exactly three source-valid outcomes:

1. **paired common deletion:** both directed source omissions are present;
2. **first-cap fresh common deletion:** the reverse hit is localized and the
   first cap's cardinality produces a third strict-cap deletion origin; or
3. **second-cap localized reverse hit:** the reverse blocker is localized in
   the first cap and its shell-cap intersection is exactly the source pair,
   while only the *other* opposite cap is known large.

This is the narrowest checked use of all three production ingredients.  In
particular, the large-cap disjunction is no longer carried as an inert field:
its first-cap arm renews the common deletion immediately.

## What remains open

No constructor above is currently `False`.

- The two common-deletion constructors reach the existing expansion and
  periodic-orbit normal forms, but current exact finite regressions admit
  recurrence.  A terminal theorem must use one shared cap/MEC/order object
  across the source-exact orbit or produce a named bank incidence.
- The second-cap localized reverse-hit arm is the only branch which does not
  immediately renew a common deletion.  It requires a real coupling from the
  large *other* cap to the localized first-cap row.  Neither cap cardinality
  alone nor a third actual center through the retained pair can provide it;
  the latter center is proved equal to the existing reverse blocker.

The next honest theorem boundary is thus a consumer for
`RetainedMatchingLargeCapConsumerOutcome`, with the common-deletion arms
handled by a provenance-preserving global cycle theorem and the final arm
handled by a cross-cap/Kalmanson or full-filter/MEC coupling.  Mining another
anonymous two-center packet, another third center through the same pair, or
a geometry-free rank would target an already-exhausted surface.

## Validation

The Lean artifact is
`RetainedMatchingReductionConsumer.lean` in this directory.  It was
elaborated directly against the current project environment and exited 0.
Every printed public theorem closes over exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorry`, `admit`, declaration-level `axiom`, `native_decide`, or
solver-generated trust boundary in the file.  No production `sorry` is
closed by this scratch reduction.
