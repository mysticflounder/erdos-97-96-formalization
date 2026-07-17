# Survival-cover theorem-bank match

## Outcome

This lane has source-clean, kernel-checked card-at-least-fourteen producers.
The stronger, load-bearing form is:

```text
anchored double-deletion surface
  + first-apex class is not exact card four
  + directed cross hit w in selectedAt(q)
  + 14 <= A.card
  -> some deleted point d in {q,w}
  -> one retained carrier source outside the known q-blocker fiber
  -> its actual blocker c differs from the physical second apex
  -> deletion of d preserves K4 at c and at S.oppApex2
  -> Nonempty (CommonDeletionTwoCenterPacket D H d c S.oppApex2)
```

It is proved by
`exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`.
The earlier generic form is retained as an intermediate theorem:

```text
anchored double-deletion surface
  + first-apex class is not exact card four
  + directed cross hit w in selectedAt(q)
  + 14 <= A.card
  -> some deleted point d in {q,w}
  -> two retained carrier sources outside the known q-blocker fiber
  -> distinct actual blocker centers c1 != c2
  -> deletion of d preserves K4 at both c1 and c2
  -> Nonempty (CommonDeletionTwoCenterPacket D H d c1 c2)
```

That intermediate theorem is
`exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen` in
`SurvivalCoverBankMatch.lean`.  Its conclusion retains both source vertices,
their outside-fiber facts, the two actual centers, the common deletion, and the
fact that the deletion is one of the anchored frontier points.

Both the generic and physical-second-apex forms are **PROVEN**.  The latter
closes the physical-alignment producer gap: the second center is no longer an
anonymous actual blocker.  It is not a terminal contradiction and does not
close a production `sorry` by itself.

## Why card fourteen is sufficient

The selected critical support at the known blocker has cardinality four, so
the source fiber of that blocker has cardinality at most four.  Hence
`14 <= A.card` leaves at least ten carrier sources outside that fiber.

Color each outside source by whether deletion of `q` survives at its actual
blocker.  The anchored deletion cover proves that a source of the other color
survives deletion of `w`.  One of the two colors contains at least five
sources.

Every actual-blocker source fiber has cardinality at most four: equal actual
centers force equality of the source-indexed exact supports, and every source
belongs to its own four-point support.  Therefore five same-color sources
contain two with distinct actual blockers.  Those two rows construct the
common-deletion packet directly.

The general fiber statement was already present as
`Problem97.CriticalShellSystem.centerFiber_card_le_four` in
`scratch/atail-force/critical_system_fiber_count.lean`.  The local file proves
the bounded form `actualBlockerFiber_card_le_four` from the support-locking
lemma already needed by this adapter, avoiding another scratch import.

## Additional kernel-checked consequences

The file also proves:

- `seven_le_sources_outside_qBlockerFiber`: card at least eleven leaves seven
  sources outside the known blocker fiber;
- `exists_distinct_sameCap_sameDeletionSurvival_sources`: seven sources in the
  six boxes `survival color x chosen closed cap` give two distinct same-color
  sources in one closed cap;
- `ten_le_sources_outside_qBlockerFiber`: card at least fourteen leaves ten
  outside-fiber sources;
- `seven_le_nonMoser_sources_outside_qBlockerFiber`: deleting the at most three
  Moser vertices leaves seven non-Moser outside-fiber sources;
- `exists_unique_capInteriorByIndex_of_mem_not_mem_triangle_verts`: every
  non-Moser carrier point has a unique strict cap-interior index;
- `exists_distinct_sameCapInterior_sameDeletionSurvival_sources`: at card at
  least fourteen, two distinct same-color outside-fiber sources lie in one
  strict cap interior;
- `selectedSupports_eq_of_actualBlockers_eq`: equal actual blockers in one
  concrete critical system have identical exact selected support; and
- `commonDeletionPacket_or_sameSupportPair_of_sameDeletionSurvival`: two
  same-deletion sources either have distinct centers and give the existing
  common-deletion packet, or have one center and both lie in its exact
  four-point support; and
- `exists_sourceFaithful_secondApexCommonDeletionPacket_of_card_ge_fourteen`:
  one distinct actual blocker can be paired with the physical second apex,
  because both frontier deletions already survive at `S.oppApex2`.

The stronger common-deletion theorem supersedes the proposed three-state
frontier-mask pigeonhole for the immediate card-at-least-fourteen target.  A
mask collision would retain finer `q/w` support membership, but would not by
itself force distinct centers or a terminal consumer.

## Theorem-bank preflight

The required registries were checked before proving a new adapter:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`; and
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

Focused `nthdegree docs search --lean` queries covered common deletion,
same-cap blockers, Kalmanson/cap order, strong connectivity, two-circle sinks,
and U5 source-indexed consumers.

The exact matches and deficits are:

- `CommonDeletionTwoCenterPacket` and
  `nonempty_commonDeletionTwoCenterPacket` are the exact generic adapter once
  two distinct centers survive one deletion.  The new card-fourteen theorem
  now produces that packet unconditionally on its stated surface.
- The strengthened theorem supplies `S.oppApex2` as the second center.  It
  therefore bypasses the previously open physical-alignment problem.
- The generic common-deletion bank remains nonterminal and admits genuine
  successor cycles, but the physical-second-apex packet has a separate uniform
  consumer in `../common-deletion-uniform-consumer/`: it reduces directly to
  `FullyDeletionRobustAt D S.oppApex2` or swapped `FA-UNIQ4`.
- `outsidePair_unique_capCenter` needs two centers in one ordered cap and two
  shared support points outside it.  Same-cap placement of the *sources* does
  not place their blocker centers or supply a common outside pair.
- The legacy `SameCapIncompatibleEdge` family assumes a center and source in
  one ordered cap plus an endpoint-radius equality.  The live survival cover
  supplies neither blocker-center cap placement nor that equality; this is the
  mismatch recorded in
  `docs/audits/2026-07-13-atail-legacy-samecap-blocker-audit.md`.
- Kalmanson and two-circle terminals need named cyclic roles and cross-row
  equalities.  Strong connectivity supplies witness reachability but no such
  metric alignment.  The U5 consumers require named support/incidence or
  confinement fields absent from a generic common-deletion packet.

## Exact remaining deficit

The producer and physical alignment are no longer missing.  The checked
uniform consumer reduces the entire card-at-least-fourteen surface to exactly:

1. a direct consumer of `FullyDeletionRobustAt D S.oppApex2`; or
2. the protected swapped `FA-UNIQ4` direct-`False` theorem.

The old generic successor recursion, origin-tagged R branch tree, anonymous row
masks, and further unaligned common-deletion packets are not load-bearing for
this primary route.  They remain useful regressions and secondary evidence,
but they should not receive new closure work unless the physical route fails.

## Validation

From `lean/`:

```bash
env LEAN_PATH="/tmp/p97-anchored-double-deletion-oleans:\
/private/tmp/p97-joint-transition-oleans:$(lake env printenv LEAN_PATH)" \
  lean -R .. -M 16384 \
  ../scratch/atail-force/survival-cover-bank-match/SurvivalCoverBankMatch.lean
```

The check completed with no errors or warnings.  Every printed declaration
reports only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` dependency.  No production file, `docs/` file,
proof-blueprint state, or protected lane was edited.
