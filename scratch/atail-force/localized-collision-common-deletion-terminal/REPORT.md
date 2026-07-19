# Localized collision common-deletion terminal

Date: 2026-07-17

Status: **KERNEL-CHECKED POSITIVE REDUCTION; THE LOCALIZED COLLISION ALWAYS
REACHES A SOURCE-EXACT MUTUAL-OMISSION TWO-CYCLE; DIRECT `False` REMAINS
OPEN.**

This lane owns only
`scratch/atail-force/localized-collision-common-deletion-terminal/`.  It does
not change production, generated files, closure documents, or any protected
lane.

## Result

Let

```lean
R : FrontierCommonDeletionParentResidual F
P : RetainedInteriorBlockerCollision R
L : LocalizedCollisionCommonDeletion P
```

The checked theorem is

```lean
theorem nonempty_localizedCollisionMutualOmissionCycle
    (P : RetainedInteriorBlockerCollision R)
    (L : LocalizedCollisionCommonDeletion P) :
    Nonempty (LocalizedCollisionMutualOmissionCycle P L)
```

The output chooses one of `P.source₁,P.source₂`, calls it
`collisionSource`, and records all of the following.

- `collisionSource` and `L.fresh` are distinct members of the same strict
  first opposite-cap interior.
- The actual blocker of `collisionSource` is the collision's common blocker.
- The two actual blockers are distinct.
- `L.fresh` is absent from the exact critical support at `collisionSource`.
- `collisionSource` is absent from the exact critical support at `L.fresh`.
- Deleting `L.fresh` survives at the first apex and the collision blocker.
- Deleting `collisionSource` survives at the first apex and the fresh
  source's actual blocker.

The last two claims are stored as concrete
`CommonDeletionTwoCenterPacket`s.  This is therefore not an anonymous generic
packet: it is a source-exact mutual-omission period-two edge, with its strict
cap location and collision origin retained.

## Proof

The proof first repackages `P` as the production
`RetainedRadiusCollision`.  This is a definitional/source-faithful adapter:
the common blocker, equal supports, deletion-criticality, retained-radius
memberships, and robust first apex all come from `P`, `H`, and `R`.

Write

```text
A = H.centerAt P.source₁ P.source₁_mem_A
B = H.centerAt L.fresh L.packet.q_mem_A.
```

The stored packet proves `B != A`.  If the exact critical row at `L.fresh`
contained both collision sources, production theorem

```lean
actualRow_center_eq_commonBlocker_of_contains_collisionSources
```

would instead force `B = A`: the first apex and `A` already saturate the
convex-carrier perpendicular-bisector bound for the collision pair.  Hence
the fresh row omits at least one collision source.

The collision's common support is identical at both original sources, so
`L.fresh_not_mem_shell` holds for either possible chosen source.  The two
cross omissions then give the second packet via
`cross_deletion_survives_iff_not_mem_selected_support` and first-apex full
deletion robustness.

## Why this is not yet `False`

No checked consumer in the current banks accepts only this two-cycle.

- The exact-five physical omission-cycle theorems require every cycle source
  to lie in one named exact-five physical radius class.  Here both sources are
  in one strict cap, but `L.fresh` is not known to lie on the retained
  first-apex radius.
- A generic common-deletion or mutual-omission cycle is not contradictory.
  The current exact finite regressions below realize such cycles in their
  stated abstractions.
- Global minimality has the wrong polarity for cumulative deletion: each
  source's own deletion blocks K4 at its actual blocker.  Applying the generic
  global minimal-deletion extractor to the two sources only returns the
  already-banked fresh shared-radius/minimal-core split, not `False`.
- `R.noM44` adds no new cap-size force on this arm.  Production already proves
  the first opposite cap has cardinality at least five from the two collision
  sources plus their common blocker, so the forbidden `(4,4)` alternative is
  already bypassed.

The honest next consumer must therefore retain this collision origin and use
geometry absent from an abstract two-cycle: a full boundary/cap/MEC order
constraint coupling the two actual supports, a source-valid common outside
pair at two distinct cap centers, or another parent-global equality.  It must
not weaken the endpoint back to `CommonDeletionTwoCenterPacket` alone.

### Consumer disposition

| Candidate consumer | Disposition |
|---|---|
| Direct `LocalizedCollisionMutualOmissionCycle -> False` | **OPEN / NOT PRODUCED.** No current theorem has this statement. |
| Exact-five physical omission-cycle closure | **BLOCKED AT THE INTERFACE.** `L.fresh` has no membership in the named exact-five physical class. |
| Minimality or witness-closed cumulative deletion | **REFUTED ROUTE.** Actual-source criticality blocks cumulative K4 rather than preserving it. |
| `outsidePair_unique_capCenter` | **BLOCKED AT THE PRODUCER.** The fresh blocker is not localized to the collision cap and no common two-point off-cap support is produced. |
| Additional `noM44` cap-size split | **NON-LOAD-BEARING.** The collision already makes the first opposite cap have cardinality at least five. |

## Theorem-bank preflight

Before deriving the reduction, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for localized collision common deletions, fresh
  actual blockers, critical rows through both collision sources, strict-cap
  mutual omissions, and source-exact two-center cycles.

The closest indexed hit was the production equality theorem used above.
The sibling U1/U5 banks contain downstream metric/incidence contradiction
consumers, but none supplies the missing full-geometric consumer or accepts
only this two-cycle.  In particular, no hidden general-ambient theorem closes
the branch.

## Validation

The focused production dependency build passed:

```bash
lake-build Erdos9796Proof.P97.ATail.RetainedStrictInteriorParentNormalForm
```

It completed all 8,159 jobs and refreshed the proof-blueprint source/kernel
indexes.  Its warnings are inherited from existing dependencies; this lane
does not edit their sources.

The scratch file was checked directly from `lean/` using the repository's
single-file scratch exception:

```bash
lake env lean -s 65536 \
  ../scratch/atail-force/localized-collision-common-deletion-terminal/\
LocalizedCollisionCommonDeletionTerminal.lean
```

It exits zero.  Both explicit axiom queries report exactly:

```text
propext, Classical.choice, Quot.sound
```

The file contains no `sorry`, `admit`, declaration-level `axiom`,
`native_decide`, or `unsafe` declaration.

The existing regression commands were also replayed:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/common-deletion-consumer/\
successor_cycle_countermodel.py

UV_CACHE_DIR=/tmp/p97-uv-cache uv run --frozen python \
  scratch/atail-force/paired-common-deletion-nonreturn-audit/\
exact_five_paired_cycle_model.py
```

Both return `PASS`, with pinned digests

```text
f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

The first is exact only in its finite symmetric distance-equality/global-K4/
total-critical-shell abstraction.  The second is an exact rational finite
metric with source-faithful exact-five and paired-common-deletion data.
Neither is a Euclidean convex/MEC realization.  They reject a geometry-free
two-cycle closer; they do not refute a consumer that visibly uses the full
parent geometry retained here.
