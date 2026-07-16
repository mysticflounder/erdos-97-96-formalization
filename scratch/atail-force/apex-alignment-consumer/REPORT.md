# Apex-alignment consumer audit

Date: 2026-07-14

Status: **KERNEL-CHECKED FAVORABLE-SYSTEM NORMALIZATION, EXACT TERMINAL
PACKET, AND SHARP DISTINCT-RADIUS PRODUCER EQUIVALENCE; FULL-PARENT
PRODUCTION REMAINS OPEN.**

This lane consumes only the two exact cross outputs
`ApexDoubleCriticalResidual` and `DeletedBlockerApexAlignment` from
`global-source-selection/GlobalSourceSelection.lean`.  It does not use a
generic common-deletion packet, impose a condition on every critical system,
or edit production Lean.

## Exact common content

Both residuals produce the same choice-free object:

```lean
DeletedApexCriticalCertificate O
```

It contains a `CriticalSelectedFourClass` sourced at
`O.survivor.deleted` and centered at `S.oppApex2`, together with

```lean
¬ HasNEquidistantPointsAt 4
    (D.A.erase O.survivor.deleted) S.oppApex2.
```

For `ApexDoubleCriticalResidual`, these are its `deletedCritical`,
`deletedBlocks`, and `source_eq_oppApex2` fields.  For
`DeletedBlockerApexAlignment`, the critical class is the retained system's
actual selected shell, while `blocker_eq_oppApex2` transports both that shell
and `H.no_qfree_at` to the second apex.

The theorem

```lean
DeletedApexCriticalCertificate.shell_support_eq_apexRow
```

proves that this certified shell has exactly the same support as the parent
second-apex row.  This is support equality, not merely equality of one radius.

## Correct quantifier order

The residual does not need to constrain the critical system inherited from
the parent.  After the cross labels are known,

```lean
exists_favorableCrossPacket_of_deletedApexCriticalCertificate
```

uses `CriticalShellSystem.overrideAt` to install the certified shell into any
starting system and rebases the H-independent oriented cross packet to the
new system.  The result has actual-map alignment

```lean
Hfav.centerAt O'.survivor.deleted O'.survivor.deleted_mem_A =
  S.oppApex2
```

and exact selected-support equality with `O'.apexRow`.

Likewise,

```lean
exists_favorableFrontier_of_deletedApexCriticalCertificate
```

rebases a previously selected `CriticalPairFrontier` to that favorable
system.  For `ApexDoubleCriticalResidual`, the stronger theorem

```lean
exists_favorableSystem_of_apexDouble
```

performs two pointwise overrides and simultaneously sends both the deleted
endpoint and old continuation center to `S.oppApex2`.  The distinct-source
proof is exactly `O.survivor.center_ne_deleted`; the second override preserves
the first.  Both selected supports are then forced equal to the parent apex
row.

These theorems validate the choice-after-labels surface used by
`FavorableSystemContinuationContent`.  They do not assert a property of an
arbitrary preselected `H`.

## The h4/h5 audit

The existing prescribed-deletion adapter

```lean
h5_of_prescribed_deletion_criticality
```

does apply to the certificate.  However, with the retained parent apex row as
the selected row, it yields only

```lean
dist S.oppApex2 O.survivor.center =
  dist S.oppApex2 O.survivor.deleted.
```

That equality is already proved by `parentApexPair_radius_eq` directly from
`O.center_mem_apexRow` and `O.deleted_mem_apexRow`; it is present before
either residual is inspected.  Therefore the two residuals do **not** supply
a new h4/h5 metric edge for the current bank.  Treating their prescribed
deletion fields alone as the missing bank producer would double-count the
parent apex-row equality.

The support-level h4/h5 consequence is sharper.  Deletion failure at the apex
forces the deleted endpoint into every selected four-row centered there.  A
row omitting that endpoint would survive the deletion and contradict the
certificate immediately.

## Smallest additional packet

The literal smallest closing hypothesis is K4 survival after deleting the
endpoint at `S.oppApex2`.  The smallest exact row-incidence form is:

```lean
structure DeletedApexOmissionPacket (O) where
  row : SelectedFourClass D.A S.oppApex2
  deleted_not_mem : O.survivor.deleted ∉ row.support
```

The file proves both direct consumers:

```lean
false_of_apexDouble_and_deletedApexOmission
false_of_deletedBlockerAlignment_and_deletedApexOmission
```

No other metric equality, selector identity, finite shadow, or arbitrary-H
assumption is needed once this packet exists.

The currently retained full-parent data do not instantiate the packet.  The
only selected row at `S.oppApex2` retained by `CrossSurvivalApexPacket` is
`O.apexRow`, and it contains the deleted endpoint by construction.  The live
U1 rows are not currently identified with the second apex.  Hence the first
honest remaining producer for this sub-branch is:

> identify an already retained exact/global row whose center is
> `S.oppApex2` and whose support omits `O.survivor.deleted`, or equivalently
> prove K4 survival at that apex after the deletion.

This is a role/center alignment problem.  More prescribed-deletion algebra or
another arbitrary critical-system choice cannot produce it.

## Bank preflight

Before proving the adapter, the required current/sibling/legacy bank
registries and JSON inventories were checked, and the indexed Lean corpora
were searched for prescribed deletion, critical-source support equality,
common deletion, and blocker--apex alignment.  The reusable declarations
were:

- `CriticalShellSystem.overrideAt` and its center-preservation lemmas;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `rebaseCriticalPairFrontierSystem`;
- `h5_of_prescribed_deletion_criticality`; and
- the exact residual fields in `GlobalSourceSelection.lean`.

The sibling U1 five-point obstruction and current finite-shadow reports still
require a role-specific selected-row extension.  None of the indexed or
archived declarations maps the oriented continuation apex/deleted labels to
such a row in the full parent telescope.

## Validation and rigor

From `lean/`, `BlockerAlignment.lean` and the source-current consumer were
compiled as deliberate scratch single-file checks, with the already checked
scratch dependency oleans on `LEAN_PATH`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/apex-alignment-consumer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/ApexAlignmentConsumer.olean \
  ../scratch/atail-force/apex-alignment-consumer/ApexAlignmentConsumer.lean
```

The command exited successfully.  Every printed declaration depends only on

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, `admit`, declared axiom, or `native_decide`.

- **PROVEN:** common choice-free certificate; exact support equality;
  favorable sourcewise installation; simultaneous double override; frontier
  and oriented-cross rebasing; redundancy of the h5 equality; and both
  omission-packet consumers.
- **OPEN:** production of `DeletedApexOmissionPacket` (or direct apex deletion
  survival) from the full parent geometry/current bank role map.
- **NOT RUN:** production target build, full `lake-build`, and publication
  gates; this directory is scratch-only.

## Producer follow-up: 2026-07-15

The follow-up artifact
`DeletedApexOmissionProducer.lean` checks the retained frontier rows, the
late-critical-system surface, the live critical-row type, and the exact
radius-class alternative.  The strongest new theorem is

```lean
deletedApexOmission_iff_distinctApexRadiusClass
    (C : DeletedApexCriticalCertificate O) :
  Nonempty (DeletedApexOmissionPacket O) ↔
    Nonempty (DistinctApexRadiusClass O)
```

Here `DistinctApexRadiusClass O` is a positive radius `rho` with

```lean
4 ≤ (SelectedClass D.A S.oppApex2 rho).card
rho ≠ O.apexRow.radius.
```

This is a proved **iff**, not only a sufficient condition.  Its useful
producer direction is constructive: trim four points at the distinct radius;
the deleted endpoint cannot lie there because it already lies at the parent
row's radius.  For the converse, the critical certificate makes the parent
radius class the full exact four-point class, so a same-radius selected row
cannot omit the endpoint.

The direct closing consumer is

```lean
false_of_deletedApexCriticalCertificate_and_distinctApexRadiusClass
```

Thus the sharp mining target is not specifically a five-point class.  It is
either:

1. any second four-capable radius at `S.oppApex2`; or
2. an already retained row with center role `S.oppApex2` and support omitting
   the oriented deleted endpoint.

The second interface is packaged as `ApexOmissionRoleAlignment`.  The
live-row specialization

```lean
nonempty_deletedApexOmissionPacket_of_criticalRowAlignment
```

shows the exact two fields a source-indexed U1 critical row would have to
supply: its blocker center equals `S.oppApex2`, and its exact support omits
the continuation endpoint.

### Retained-row audit

No currently retained row instantiates either producer.

- `O.apexRow` has the correct center but contains
  `O.survivor.deleted` by `O.deleted_mem_apexRow`.
- `O.survivor.row` omits the deleted endpoint, proved by
  `deleted_not_mem_survivorRow`, but its center is provably not the apex:
  `survivorCenter_ne_oppApex2`.  The reason is structural, not a missing
  inequality: the continuation center is itself in `O.apexRow.support`, and
  a selected row never contains its center.
- On the H-independent late-system surface, both continuation centers have
  the same wrong-center polarity.  This is kernel-checked as
  `geometricContinuation_centers_ne_oppApex2`.
- The frontier's `secondApexDouble` gives only a radius class of cardinality
  at least four after erasing `F.pair.q,F.pair.w`.  The selected continuation
  labels are taken from that class, while the dispatch proves each is
  different from both erased frontier sources.  Therefore the known
  `q,w` omissions cannot be relabeled as omission of the oriented deleted
  continuation point.
- The five live source-indexed U1 rows are blocker-centered.  Their interface
  gives neither a blocker-center equality with `S.oppApex2` nor a role map
  excluding the new continuation label from the selected support.

The exact quantitative strengthening of `secondApexDouble` is also proved:

```lean
nonempty_deletedApexOmissionPacket_of_twiceErased_apexClass_card_ge_five
```

If its twice-erased radius class had cardinality at least five, it would lift
and close immediately.  The present field has threshold four, so this is a
genuine missing fact rather than an adapter gap.

Under the certificate, the file further proves

```lean
parentApexRadiusClass_card_eq_four_of_certificate
apexRow_support_eq_parent_of_certificate
```

The first says the full class at the retained radius has exactly four
members.  The second says every selected four-row centered at the apex has
the same support as `O.apexRow`.  Consequently another same-radius selector
choice cannot create the omission; a new radius or a contradictory role
alignment is required.

### No-`IsM44` and bank audit

The no-`IsM44` theorem `exists_secondLargeCap_of_noM44` supplies only

```lean
5 ≤ (CP.capAt j).card
```

for a second cap.  It has no selected-radius, center-role, or row-support
field.  Existing finite-profile checks permit an exact four-point
second-apex radius class in the live card-12 profiles, so cap cardinality
cannot be silently promoted to the distinct-radius producer.

The required current, sibling, and legacy registries were rechecked, along
with focused `nthdegree docs search --lean` queries.  The closest sibling
families are the C5D3B same-radius/deleted-K4 adapters and the
`U2NonSurplusSqueeze.oppApex2_*` exact-radius theorems.  The former use a
different dangerous-skeleton packet, and the latter require positive
`D.IsM44`; neither yields the live no-`IsM44` center/radius alignment.  The
two legacy inventories contain no targeted second-apex/deleted-radius match.

### Exact local regression

`DeletedApexOmissionIncidenceCountermodel.lean` is a kernel-checked finite
incidence regression.  It simultaneously realizes:

- an exact four-point apex class containing the two continuation labels and
  omitting both frontier sources;
- all four continuation-versus-frontier inequalities;
- a continuation row which omits the deleted label but has a non-apex
  center;
- a five-point abstract second cap and five live blocker-center roles, none
  equal to the apex; and
- no distinct four-capable apex radius and no four-point subset of the
  critical class omitting the deleted label.

This is **exact within the stated finite-incidence abstraction**.  It is not
a Euclidean `CounterexampleData`, does not encode convexity/MEC/global K4, and
is not a counterexample to the full parent theorem.  Its purpose is to guard
against deriving the producer from only the local row/cardinality interface;
a successful full-parent proof must visibly use additional geometry.

### Follow-up validation

Both follow-up files pass direct scratch checks.  The producer was checked
with the source-current dependency oleans:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/apex-alignment-consumer \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/DeletedApexOmissionProducer.olean \
  ../scratch/atail-force/apex-alignment-consumer/DeletedApexOmissionProducer.lean
```

The regression was checked with:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/apex-alignment-consumer/\
DeletedApexOmissionIncidenceCountermodel.lean
```

Both commands exit zero.  Every printed declaration depends only on
`propext`, `Classical.choice`, and `Quot.sound` (some finite regression
theorems need a strict subset of those).  There is no `sorryAx`, `admit`,
declared axiom, or `native_decide`.

- **PROVEN:** the iff with a distinct four-capable apex radius; the direct
  distinct-radius terminal; the critical/live-row role adapter; the
  five-point and twice-erased-five sufficient producers; the retained-row
  wrong-center/wrong-support audit; and exactness/uniqueness of the parent
  apex radius class under the certificate.
- **EMPIRICALLY/FINITELY GUARDED:** the local retained interface plus a
  five-point cap does not force a second radius or role alignment, exact
  within the finite-incidence shadow.
- **OPEN:** derive `DistinctApexRadiusClass O` or
  `ApexOmissionRoleAlignment O` from the full convex/MEC/no-`IsM44` parent
  geometry.
