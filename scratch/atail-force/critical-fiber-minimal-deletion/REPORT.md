# Critical-fiber minimal-deletion audit

Date: 2026-07-17

Status: **KERNEL-CHECKED BOUNDED REDUCTION AND STUTTER REGRESSION. GLOBAL
MINIMAL DELETION DOES NOT CLOSE OR SHARPEN THE FIXED CRITICAL-FIBER ARM
WITHOUT A NEW CENTER-SELECTION PRINCIPLE.**

## Question

Start with the production packet

```lean
R : FrontierCommonDeletionParentResidual F
G : FrontierCommonDeletionCriticalFiber R
```

and apply `R.minimal` through the production `ATail.GlobalMinimalDeletion`
theorems to either:

1. the two collision sources `{G.source₁.1, G.source₂.1}`; or
2. the whole common exact four-point support.

The audit must retain `R`, `G`, and hence both literal facts

```lean
G.source₁_deletion_critical
G.source₂_deletion_critical
```

rather than weakening to an anonymous `CommonDeletionTwoCenterPacket`.

## Bank preflight

Before adding the scratch statements, the registries required by `AGENTS.md`
were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered two deletion-critical
sources at one blocker, pair deletion, minimal deletion cores, multiple
critical blockers for one source, and mutual critical-source bisectors.

The exact reusable extractor is already production:

```lean
ATailGlobalMinimalDeletion
  .exists_global_cardMinimal_blocking_subdeletion
ATailGlobalMinimalDeletion
  .exists_fresh_sharedRadiusPair_or_minimalDeletionCore
```

No registered theorem consumes the fixed same-blocker/two-critical-source
packet as an antecedent to `False`.  This agrees with the current
`critical-fiber-consumer-match` audit: the available terminals still require
a second same-cap bisector center or a complete ordered cross-row packet.

## Checked positive reduction

`CriticalFiberMinimalDeletion.lean` defines two packet types indexed by the
full `R` and `G`:

```lean
CriticalFiberMinimalDeletionPacket R G deletionSet
CriticalFiberDeletionCorePacket R G deletionSet
```

The first retains a cardinal-minimal blocking deletion and restoration of K4
after restoring any deleted source.  The second retains the stronger
shared-radius-collision-or-`MinimalDeletionCore` split.

Production minimality gives both pair-deletion packets:

```lean
exists_pairMinimalDeletionPacket
exists_pairDeletionCorePacket
```

The pair has only three possible nonempty deleted subsets.  The checked
classifier proves that if the selected center is the old common blocker,
the two-source subset is impossible: restoring either source would leave the
other prescribed critical deletion.  Therefore:

```lean
pairMinimalDeletion_at_commonBlocker_stutters
```

returns exactly

```text
deleted = {source₁}  or  deleted = {source₂}.
```

The complete checked reduction is:

```lean
exists_pairMinimalDeletion_stutter_or_distinctCenter
```

It gives either one of those two old singleton deletions at the old blocker,
or a genuinely distinct center.  This is the strongest unconditional bounded
split obtained from this application.

## Decisive stutter regression

The common blocker is a carrier point and is outside both source points.  At
that center:

- deleting `source₁` blocks K4 by
  `G.source₁_deletion_critical`;
- deleting `source₂` blocks K4 by
  `G.source₂_deletion_critical`; and
- restoring the singleton gives ambient K4 by `D.K4`.

The file constructs both stronger extractor outputs literally:

```lean
source₁PairDeletionStutter
source₂PairDeletionStutter
```

Each returns the old common blocker, a singleton deletion, and a singleton
`MinimalDeletionCore` whose shell is extensionally the already available
critical radius class.  Thus the existential global extractor is allowed to
choose an output with no new blocker, incidence, cap placement, or metric
relation.

Enlarging the deletion universe to the whole common exact support does not
help.  The checked term

```lean
source₁CommonSupportDeletionStutter
```

instantiates the same collision/core output there: the blocker is outside its
own support and the singleton `{source₁}` remains a valid minimal core.

This is a regression about the theorem interface, not a Euclidean
countermodel to the parent.  It proves that no argument which merely invokes
the current existential global-deletion theorem on either natural deletion
set can force novel provenance.

## Consequence for the closure route

This lane closes no production `sorry` and does not sharpen either the
`BothOff` or `RowHit` critical-fiber arm.  The “distinct center” side would be
useful only after an additional theorem forces it and then supplies one of
the already audited terminal packets:

1. the new center and old common blocker lie in one cap while the collision
   pair lies outside it; or
2. the new critical row supplies the cross memberships and boundary order
   needed by the Kalmanson consumer.

The missing ingredient is therefore a **selection/progress theorem** that
excludes the old common blocker (or proves a monotone finite-orbit invariant
under singleton critical-system overrides).  Cardinal minimality alone has
no such preference.  Reapplying the extractor without that invariant is
formally permitted to return the same singleton shell forever.

## Validation

Focused direct check from `lean/`:

```bash
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/critical-fiber-minimal-deletion/CriticalFiberMinimalDeletion.lean
```

Result: exit `0`.  Every printed declaration has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, custom axiom, `unsafe`, or `native_decide` in
the scratch Lean file.  No production or plan document was edited.
