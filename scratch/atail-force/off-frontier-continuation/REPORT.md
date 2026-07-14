# Off-frontier nonalternating continuation: full-live audit

Date: 2026-07-14

## Verdict

The full live K-A surface does not yet yield a closing producer, but the
remaining gap is sharper than the earlier `CriticalPairFrontier` statement.

The global `FaithfulCarrierPattern` and critical-shell provenance are **not**
missing.  From the actual live selected source `u`, the dangerous exact
`p`-row, `D.K4`, `D.convex`, and any
`Hsys : CriticalShellSystem D.A`, the checked scratch theorem
`exists_liveOffFrontierCandidate` constructs:

- an actual blocker center `v = Hsys.centerAt u`, with `v != p`;
- one `FaithfulCarrierPattern F` whose row at `p` is exactly
  `{q,t1,t2,t3}`;
- the exact critical shell as the global row at `v` (automatic from
  `CriticalShellSystem.selectedFourClass_support_eq_shell`); and
- a global convex boundary indexing.

Thus the first missing positive field is an **off-frontier two-hit**:

```text
2 <= |{q,t1,t2,t3} intersect selectedAt(u).support|.
```

The checked upper bound is already `<= 2`, so this is an exact shared pair.
For the four-point sink one must additionally force the forbidden
nonalternating cyclic placement `p,x,y,v`.  The checked proposition
`HasNonalternatingSharedPair` records exactly these two ingredients, and
`false_of_hasNonalternatingSharedPair` returns `False` with only the standard
three core axioms.

The important polarity is that a shared pair by itself is not enough.  On a
convex carrier it must alternate between its two centers.  A closing proof
must therefore derive the contrary placement from a cap/MEC localization, or
return one of the other production ordered cores.

## Full-surface construction

The live selected point satisfies

```text
u in D.A
u notin {q,t1,t2,t3}.
```

For every global critical system, its chosen blocker at `u` differs from `p`.
If it were `p`, the dangerous selected four-class would survive deleting
`u`, contradicting `Hsys.no_qfree_at u`.

Pinning the global faithful row at `p` requires only
`exists_faithfulCarrierPattern_with_classAt D.K4`.  No simultaneous
prescription is needed at `v`: because `v` is a chosen critical blocker,
every selected four-class there is already equal to the chosen exact shell.
This remains true even though the current K-A signature passes `rows` and
`hcritical` independently.

Consequently restoring the outer wrapper's common provenance is worthwhile
for other branches but is not the first missing hypothesis for this branch.

## Exact finite countermodel boundary

`IncidenceCapCountermodel.lean` kernel-checks a `Fin 12` shadow with:

- cap profile `(5,5,5)` and the standard three pairwise vertex overlaps;
- the three caps covering all 12 labels;
- `q` in the chosen surplus cap and outside the three Moser labels;
- one selected four-row at every abstract center;
- every row omitting its center;
- pairwise row intersections of cardinality at most two;
- one common source-to-blocker system with source membership, no fixed
  blocker, same-center support locking, and the distinct-center intersection
  upper bound;
- the dangerous global row at `p`; and
- the live selected source outside that row.

In this shadow:

```text
|selectedAt(u).support intersect dangerousBase| = 1,
p and blocker(u) share no indexed cap,
and no source with blocker != p has two dangerous hits.
```

This is not a Euclidean counterexample and does not encode the MEC disk,
actual distances, exact radius filters, or realizability of the abstract cap
sets.  It proves a precise dependency statement: cap cardinalities,
all-center K4 incidence, common critical provenance, and intersection bounds
do not force the missing two-hit or common-cap placement.  Any proof must
visibly use metric/MEC/cap-order content omitted by the shadow.

## Bank and index preflight

The mandatory bank registries were already checked for this lane.  Additional
indexed searches specific to this packet covered:

```text
second equidistant center nonalternating cyclic order cap exact radius class
two points two centers same side convex carrier selected four class
opposite Moser apex blocker center cap cyclic placement equidistant pair
large cap exact radius class shared pair second center
```

The closest hits remain consumer-side:

- `outsidePair_unique_capCenter`;
- `selectedFourClass_inter_capByIndex_card_le_two`;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `CriticalShellSystem.source_mem_selectedFourClass`;
- the four-point two-circle order core; and
- the already-audited critical-source bisector adapters.

No indexed theorem gives a lower bound of two on the displayed intersection,
places `p` and the blocker in one indexed cap, or forces the two common points
outside that cap.

## First extra hypothesis and next theorem

The smallest fixed-source closing interface is exactly:

```text
exists x != y,
  x,y in {q,t1,t2,t3},
  x,y in selectedAt(u).support,
  and p,x,y,centerAt(u) occur cyclically in that order.
```

For a source chosen adaptively rather than fixed to `u`, replace `u` by an
existential source whose blocker differs from `p`.  The countermodel rules out
deriving even the two-hit part from the finite abstraction for every such
source.

The next content-bearing theorem must therefore use actual geometry to prove
one of:

1. an adaptively chosen off-frontier critical shell has two dangerous hits,
   and a cap/order localization makes those hits nonalternating;
2. a shared pair from another exact live row admits the analogous
   off-frontier continuation; or
3. one of the ArcOvertake, SixPointOrder, or NestedEqualChord alternatives.

Another cardinality-only or provenance-only lemma cannot cross this boundary.

## Validation

From `lean/`:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/off-frontier-continuation/OffFrontierContinuation.lean

lake env lean -M 16384 \
  ../scratch/atail-force/off-frontier-continuation/IncidenceCapCountermodel.lean
```

Both commands exit 0.  Every printed theorem has axiom closure contained in

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, named axiom, or `native_decide` in either file.
