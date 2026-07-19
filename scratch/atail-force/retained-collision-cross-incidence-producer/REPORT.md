# Localized retained-collision continuation

Date: 2026-07-17

Status: **THE LOCALIZED COLLISION DOES NOT NEED THE PROPOSED CROSS-INCIDENCE
PRODUCER. IT UNCONDITIONALLY PRODUCES THE EXISTING FRESH COMMON-DELETION
PACKET. THE REDUCTION IS KERNEL-CHECKED AND HAS NO `sorryAx`. NO PRODUCTION
`sorry` IS CLOSED BY THIS SCRATCH CHECKPOINT ALONE.**

## Scope and bank preflight

This lane owns only
`scratch/atail-force/retained-collision-cross-incidence-producer/`.

Before attempting a new incidence theorem, the lane checked the theorem-bank
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered prescribed-deletion
criticality, blocker/support cross incidence, different-pair Kalmanson
consumers, and pair-preserving four-subpacket reductions. No banked theorem
produces

```lean
K ∈ (H.selectedAt J J_mem_A).toCriticalFourShell.support
```

from a retained blocker collision. The previous different-pair audit also
shows that this incidence by itself leaves five of seven compatible cyclic
order types, all with exact rational strictly convex local realizations.

## Route correction

The strict-interior-first selector supplies, on its collision arm:

- two distinct retained sources in the strict first opposite-cap interior;
- their common actual blocker in that same strict cap interior; and
- the exact collision shell meeting the closed cap in only the two sources.

The common blocker is distinct from each source because a positive critical
shell never contains its center, whereas both sources belong to that shell.
Thus the strict cap interior contains three pairwise-distinct points:

```text
source1, source2, common blocker.
```

Since the closed cap has exactly two more points than its strict interior,
the localized collision cap has cardinality at least five. This conclusion
does not use `noM44` and does not require the other opposite cap to be large.

`LocalizedCollisionCommonDeletion.lean` kernel-checks the generic counting
lemma

```lean
capByIndex_card_ge_five_of_three_distinct_interior
```

and the collision specialization

```lean
firstCap_card_ge_five_of_localizedCollision
```

for a production `RetainedRadiusCollision` whose two sources are localized.
It then proves

```lean
exists_fresh_commonDeletion_of_localizedCollision
```

which chooses a third strict-cap point outside the two-source shell and builds
the already-existing `CommonDeletionTwoCenterPacket` at the first apex and
common blocker.

## Exact integration consequence

In
`scratch/atail-force/retained-collision-five-order-global/StrictInteriorPairSelector.lean`,
the structure `RetainedInteriorBlockerCollision` already exposes all inputs
needed for the same proof:

```lean
P.source₁_mem_capInterior
P.source₂_mem_capInterior
P.sources_ne
P.blocker_mem_capInterior
P.source₂_mem_source₁_shell
P.exists_fresh_commonDeletion
```

The parent integration should first derive that the blocker differs from each
source using `center_not_mem_support`, then apply
`capByIndex_card_ge_five_of_three_distinct_interior` to obtain

```lean
5 ≤ (S.capByIndex S.oppIndex1).card
```

and finally call `P.exists_fresh_commonDeletion`. Consequently:

- `LocalizedCollisionLargeCapOutcome.secondCapResidual` is unnecessary;
- `RetainedInteriorBlockerCollision.nonempty_largeCapOutcome` should become a
  direct fresh-common-deletion theorem; and
- the localized collision arm leaves the different-pair/Kalmanson frontier
  and joins the existing common-deletion frontier.

This is a route reduction, not a complete closure: the downstream consumer of
`CommonDeletionTwoCenterPacket` must still be integrated or closed.

## Validation

The scratch module was elaborated from the `lean/` Lake root with:

```text
lake env lean \
  ../scratch/atail-force/retained-collision-cross-incidence-producer/LocalizedCollisionCommonDeletion.lean
```

The three printed theorem closures are contained in:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, custom axiom, `native_decide`, unsafe declaration,
`sorry`, or `admit` in the Lean module. No production source, plan document,
generated blueprint, `SurplusM44`, shell-curvature file, or adjacent scratch
lane was modified.
