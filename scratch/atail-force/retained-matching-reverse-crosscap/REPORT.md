# Retained matching reverse cross-cap audit

## Outcome

The production `secondCapLocalizedReverseHit` arm is **not** a separate
cross-cap/Kalmanson residual.  It already produces another source-valid
`CommonDeletionTwoCenterPacket`.

The kernel-checked reduction is:

```text
reverse critical shell K has card 4
K intersect first opposite cap = {kept, deleted}
second opposite cap has card at least 5
  -> its strict interior has card at least 3
  -> exactly two points of K lie outside the first cap
  -> some strict second-cap point fresh is not in K
  -> deleting fresh preserves K4 at the reverse blocker
  -> parent first-apex robustness preserves K4 at the first apex
  -> CommonDeletionTwoCenterPacket fresh firstApex reverseBlocker
```

This needs no cyclic-order inequality.  It uses the complete four-point
critical shell, the exact first-cap intersection, disjoint cap interiors,
the second-cap cardinality, and the retained parent's first-apex deletion
robustness.

The file `RetainedMatchingReverseCrossCap.lean` proves:

- `exists_fresh_secondCap_commonDeletion_of_reverseHit`;
- `exists_commonDeletionPacket_of_largeCapConsumerOutcome`, normalizing all
  three production large-cap outcomes to a common-deletion packet; and
- `exists_commonDeletionPacket_of_matchingReduction`, normalizing the entire
  production retained-matching reduction without a remaining cap-side split.

All three declarations report exactly:

```text
propext, Classical.choice, Quot.sound
```

No `sorry`, `admit`, `axiom`, `native_decide`, or `unsafe` declaration is
introduced.

## Consequence for the closure route

The matching branch should no longer be documented as

```text
paired common deletion | fresh first-cap common deletion |
special second-cap cross/Kalmanson residual.
```

Its exact normal form is simply:

```text
retained blocker matching -> source-valid common deletion
```

The remaining consumer is therefore the already-identified
provenance-preserving common-deletion termination theorem.  A
`CommonDeletionTwoCenterPacket` is not itself contradictory.  Existing
scratch work proves its successor-or-aligned-critical-pair expansion, and an
exact finite regression realizes a nontrivial successor cycle in the
geometry-free distance-equality abstraction.  Any terminal theorem must use
the live cap/MEC/source provenance (or another global parent field); generic
finite recursion is a rejected target.

## Theorem-bank preflight

Before deriving the reduction, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed Lean searches for convex Kalmanson/cross-cap shell equalities and
  reverse-blocker/common-deletion consumers.

The indexed search found the existing production
`ATail/CapCrossingKalmanson.lean` bridge and the current retained matching
modules.  No banked contradiction consumes only the localized reverse-hit
fields.  The finite U1/U5 banks require named row-slot incidence packets that
these fields do not supply.  The direct cardinality reduction above is both
stronger and cheaper than introducing such an adapter.

## Countermodel gate

The existing exact finite common-deletion regression was replayed:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/common-deletion-consumer/successor_cycle_countermodel.py
```

It passed with digest

```text
f586212ef23e3575234e613ba764cc6481f13ba0d387008a89ef8378e5a2986b
```

and the genuine successor cycle `1 -> 4 -> 8 -> 1`.  Its scope is the exact
finite symmetric distance-equality/global-K4/total-critical-shell
abstraction; it is not Euclidean, convex, MEC, cap-ordered, or a
`CounterexampleData` realization.  It is therefore a regression gate against
claiming that the new common-deletion normal form is already `False`, not a
counterexample to a future full-geometric consumer.

## Validation

The scratch module is outside the Lake module graph, so the repository-root
`lake-build` wrapper rejected it as an unknown module source.  The direct
single-file exception was run from `lean/`:

```bash
lake env lean -s 65536 \
  ../scratch/atail-force/retained-matching-reverse-crosscap/\
RetainedMatchingReverseCrossCap.lean
```

It exited successfully and printed the core-only axiom closures above.  No
production file, plan document, generated blueprint, or protected lane was
edited.
