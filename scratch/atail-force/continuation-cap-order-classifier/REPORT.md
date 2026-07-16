# Continuation cap-order classifier

Date: 2026-07-14

Status: **KERNEL-CHECKED NORMALIZATION/NEGATIVE RESULT; NOT A PRODUCER;
K-A-PAIR REMAINS OPEN.**

## Verdict

Full indexed-cap geometry does sharpen the reciprocal/cyclic continuation
grid, but it does not close it.

`ContinuationCapOrderClassifier.lean` proves two layers.

First, `nonempty_rankSideData` retains the actual `CGN.OrderedCap` supplied by
the MEC packet.  For two distinct centers in one indexed cap and two carrier
points outside that cap it produces:

- ordered center ranks `r < s`;
- the exact identification of those ranked vertices with the two centers;
- strictly negative signed areas for both outside points relative to the
  oriented center chord; and
- strictly positive endpoint-chord projection from the earlier center to the
  later center.

Second, `second_center_separates_outside_pair` consumes that ordered-cap data
through `CapSelectedRowCounting.outsidePair_unique_capCenter`.  If the first
cap center is equidistant from the outside pair, every other distinct center
of the cap has unequal distances to that pair.

Specializing to the two parent apex rows gives:

```text
secondCap_center_separates_firstApex_pair
firstCap_center_separates_secondApex_pair
```

Thus, once a continuation row contains one member of the opposite parent
pair, the other member is not merely omitted from the selected support.  Its
distance from the row center is different from the selected row radius.

The branch-complete consequences are:

```text
forward_metric_exclusions
reciprocal_metric_exclusions
cyclic_metric_exclusions
```

For a reciprocal grid the four forbidden extra entries are exactly

```text
dist second1 first2 = classAtSecond1.radius
dist second2 first1 = classAtSecond2.radius
dist first1 second2 = classAtFirst1.radius
dist first2 second1 = classAtFirst2.radius.
```

For a cyclic grid the last two are exchanged:

```text
dist first1 second1 = classAtFirst1.radius
dist first2 second2 = classAtFirst2.radius.
```

`false_of_reciprocal_one_metric_entry` and
`false_of_cyclic_one_metric_entry` prove that **any one** of the corresponding
four equalities is an immediate contradiction.  These are exact executable
one-entry consumers, not an assertion that a one-entry producer exists.

## Comparison with the previous support classifier

The result is stronger than
`first_strictPair_not_both_mem_secondContinuation` on the arbitrary
`SelectedFourClass` surface.

That previous theorem, together with one known hit, proves only that the
other point is absent from the selected four-element support.  A
`SelectedFourClass` is explicitly an arbitrary selected four-subset and has
no exactness field.  In particular, there is no
`SelectedFourClass.off_row_named_label_forbidden` theorem.

The exact off-row theorem exists on:

```text
CriticalFourShell.off_row_named_label_forbidden
CriticalSelectedFourClass.off_row_named_label_forbidden
CriticalShellSystem.off_row_named_label_forbidden.
```

Therefore support omission plus `off_row_named_label_forbidden` recovers the
same metric inequality only after a continuation row has been identified with
an exact critical shell.  The new cap-order theorem obtains the metric
inequality for an arbitrary global-K4 selected row, without CSS alignment or
exact-shell status.

This is still a normalization/negative result.  It rules out proposed extra
entries; it does not create one.

## No oriented distance inequality

The proof obtains

```text
dist center first != dist center second
```

and therefore the unordered real-order split `<` or `>`.  It does **not**
determine which strict inequality holds.  The names `first1/first2` and
`second1/second2` are chosen without cap-rank orientation, and the currently
available geometry supplies no theorem relating those two label choices to a
fixed sign of the distance difference.

The genuinely oriented facts proved here are instead the chord-side signed
areas and endpoint-chord projection recorded in `RankSideData`.  No current
consumer turns those signs alone into a missing row entry.

## Exact remaining producer field

For a fixed reciprocal or cyclic branch, the remaining one-incidence producer
surface is not vague: it is the explicit four-way disjunction displayed in
`false_of_reciprocal_one_metric_entry` or
`false_of_cyclic_one_metric_entry`.  Producing any one listed equality closes
that branch immediately.

There is no geometric reason in the current API to privilege one corner.  A
representative corner is

```text
dist second1 first2 = classAtSecond1.radius.
```

The kernel theorem proves its negation from cap order and the parent-apex
equality.  Closure therefore requires a separate global argument forcing one
of the four forbidden entries.  Such an argument must use more than selector
totality or the local incidence grid.  The 35-point regression below isolates
all-center global K4 as the first hypothesis absent from the strongest known
cap/MEC/total-CSS model.

## Regression gates

### Exact six-point local model

The existing exact `Q(sqrt(3))` verifier was replayed successfully:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/continuation-bank-match/verify_exact_local_regression.py
```

It retains the strict-convex hull order

```text
z1, b, a, O2, O1, z2
```

and the local equalities

```text
|z1-z2|^2 = |z1-O2|^2 = |z2-O2|^2 = 1
|z1-a|^2 = 1
|z2-b|^2 = 1
|O1-a|^2 = |O1-b|^2.
```

It also respects the new forward metric exclusions:

```text
|z1-b|^2 = 2/25 != 1
|z2-a|^2 = 29204/22201 != 1.
```

Hence local strict convexity and the named alternating equalities do not force
an extra entry.  This six-point object is not a `CounterexampleData`: it does
not supply the full MEC/cap packet, four-point selected rows at every named
center, total criticality, or all-center global K4.

### Exact 35-point cap/MEC/total-CSS model

The stronger exact symbolic verifier was also replayed successfully:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/global-critical-continuation/verify_total_css_completion.py
```

It reports `PASS` for a 35-point strict-convex carrier with:

- the full MEC and cap partition, with cap cards `(8, 11, 19)`;
- no `IsM44` packet in any MEC permutation;
- the local robust continuation configuration; and
- a total `CriticalShellSystem`.

It retains the failed direct two-hit target and no required support center
bisects the prescribed pair.  It is excluded from the live hypotheses exactly
because all-center global K4 fails.  In particular, the continuation centers
`G` and `K` have no four-point distance class.  Thus it cannot instantiate the
four selected continuation-row fields of `FourCenterGrid`.

This regression identifies the load-bearing layer precisely: cap order,
MEC, strict convexity, no-M44, and total CSS still do not produce the extra
entry; the missing producer must exploit the interaction with all-center K4.

## Current census qualification

The finalized second-apex joint-fiber checkpoint supersedes the older
11-shadow bank-status claim.  Its current complete producer-bank scan leaves
six clean fixed-card-12 shadows, with shard IDs

```text
0, 1, 2, 3, 16, 20.
```

All six complete row systems generate the unit ideal over `QQ` in Singular
and msolve in both variable orders.  However, none of the 13 strict-pair
targets in the 11 saved shadows is obtained by transitive row-equality
closure.  This is exact-CAS theorem-discovery evidence, not a Lean producer or
an arbitrary-cardinality coverage theorem.

The relevant checkpoint is
`scratch/atail-force/second-apex-joint-fiber/checkpoint.json`, SHA-256
`db3570b41ed944af37b8316847d3a5e2a2091808e202bf5b2b71d4b516c90203`.

## Bank preflight

Before proving the classifier, the current, sibling `p97-rvol`, legacy
`erdos/97`, and older `erdos-general-theorem/97` registries were checked in
both their concise Markdown and exhaustive JSON forms.  Focused nthdegree
Lean searches covered ordered-cap distance injection, equidistant centers,
perpendicular bisectors, one-row confinement, cap projection, signed-area
products, and outside-pair support.  The closest current sink was
`outsidePair_unique_capCenter`; no existing bank theorem produces a forbidden
extra grid entry.

One misleading search hit was also resolved: the theorem named
`convex_order_implies_perpBisector_side` assumes a `Wbtw` premise.  No current
bridge derives that premise from the ambient polygon/cap order in this grid.

## Kernel validation

The direct bounded validation was run from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/continuation-cap-order-classifier/ContinuationCapOrderClassifier.lean
```

It exited successfully in 13.8 seconds.  The file contains no `sorry`,
`admit`, `native_decide`, or declared axiom.  Every public `#print axioms`
probe reports exactly:

```text
propext, Classical.choice, Quot.sound.
```

The validated Lean file SHA-256 is
`b103de6c843021c7b5cb68cf1cac25a9e701eb9ff80fdf6db8664d3fcc860c7c`.

## Rigor boundary

- **Kernel proved:** ranked cap-center data, strict same-side signs, positive
  chord projection, pair-distance separation, reciprocal/cyclic metric
  exclusions, and both one-entry consumers.
- **Exact symbolic regression:** the six-point and 35-point verifiers replayed
  successfully; neither result is a Lean countermodel.
- **Exact-CAS within a pinned finite abstraction:** all six current-bank-clean
  card-12 row ideals are unit in three exact solver runs.
- **Not proved:** an oriented `<` versus `>` distance comparison, a producer
  of any forbidden metric entry, arbitrary-cardinality finite-core extraction,
  or K-A-PAIR closure.
