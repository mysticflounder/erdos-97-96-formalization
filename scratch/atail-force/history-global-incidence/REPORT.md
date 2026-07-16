# History/global-incidence audit

Date: 2026-07-14

Status: **FINITE INCIDENCE PRODUCER REFUTED; PRESCRIBED BLOCKER ROUTING STILL
MISSING; CARD-12 EXACT-ROW ROBUST BRANCH HAS A CONDITIONAL COUNTING CLOSURE.**

## Strongest definitive result

`HistoryGlobalIncidenceCountermodel.lean` kernel-checks a pinned card-12
finite shadow with all of the following fields simultaneously:

- the `(5,5,5)` cap profile and saved convex boundary order;
- one four-row at every carrier center, center omission, and the pairwise
  two-circle intersection upper bound;
- a total source-to-blocker map, source membership, nonfixed blockers,
  same-center support locking, and the finite deletion-critical row drop;
- the off-surplus first-apex history pair `{6,7}`;
- a second-apex four-row disjoint from `{6,7}`, hence surviving deletion of
  both points; and
- the history pair itself chosen as a mutual blocker cycle `6 -> 7 -> 6`.

Nevertheless:

- no recorded center other than the first apex contains both `6` and `7`;
- the two history sources have distinct blocker centers and neither critical
  support contains the mate center;
- every directly shared pair has the cyclic alternation demanded by the
  generic separation consumer; and
- the current formalized equality/order core matcher finds no core.

Thus paired history plus all-center rows, total critical provenance, and even
a chosen mutual source/blocker two-cycle do **not** force a second row through
the history pair at the finite incidence layer.

This is exact only within the stated finite abstraction.  It is not a
Euclidean counterexample.  The pinned exact algebra oracle reports
`NO_NORMALIZED_COMPLEX_OR_REAL_EQUALITY_REALIZATION` for this row system, with
the full equality ideal independently returning `UNIT` in both msolve orders
and Singular.

## Prescribed h4/h5 blocker alignment

The banked U1 obstruction needs a choice-invariant deletion failure, not an
arbitrary critical blocker:

- h5: `not K4 (A.erase d) at f`; or
- h4: `not K4 (A.erase f) at d`.

Global K4 then forces the omitted endpoint into the already selected exact row
at that prescribed center.  The descent packet does not export either form.
It gives first-apex terminal loss after a *double* deletion on a reduced
carrier, and second-apex K4 *survival* after that double deletion.  Its paired
history records only mate involution and common first-apex radius.

Shard zero makes the failure concrete.  Its closest U1 assignment is
`(a,c,d,e,f)=(9,7,6,8,11)` and misses h4 only.  The h4 adapter would need
source `11` to be critical at center `6`.  Instead the exact center-six row
contains `7`, omits `11`, retains all four points after deleting `11`, and the
chosen blocker of `11` is not `6`.  This opposite survival statement is
kernel-checked as `banked_h4_prescribed_center_deletion_survives`.

Therefore the missing producer is now precise:

> route the relevant U1 endpoint source to the prescribed near-match center,
> or prove the corresponding prescribed-center deletion failure directly.

A reduced-carrier-to-ambient lift by itself does not establish that routing.

## Exact near-match/history audit

Scanning every injective U1 role assignment in the current 23 pinned
survivors gives the following interaction with an off-surplus pair on the
first-apex row:

- no h4-only missing pair is such a history pair;
- h5-only alignment occurs in shards `10,13,14,15`, always at the second apex,
  where the descent supplies survival rather than deletion failure; and
- in two-edge h5+h7 residuals, a history pair can align one missing edge in
  several cases, but the two missing pairs share the role `a`, so a paired
  erasure history cannot supply both as two distinct mate pairs.

This is exhaustive within the pinned fixed-placement 23-shard abstraction,
not a live coverage theorem.

## Nontrivial-descent strict-pair lead

The current `PairedErasureHistory` surface does **not** by itself guarantee a
genuinely new strict-opposite-cap pair.  It records neither nontrivial descent,
strict-cap membership, nor inequality of a history radius from the terminal
radius.  A same-radius class of ambient cardinality at least six remains an
unexcluded mechanism unless ambient exactness is supplied.

There is, however, a clean conditional card-12 closure.  The strict interior
of `oppCap1` has three points.  Two distinct first-apex radius classes are
disjoint, while the existing cap bounds put at least two strict points in each
K4 class.  Two disjoint two-point subsets cannot fit in a three-point set.
The generic combinatorial endpoint

```text
no_two_disjoint_two_point_subsets_of_three_point_set
```

is kernel-checked.  Consequently, if the nontrivial descent is started from an
**ambient exact** first-apex four-class and its robust successor is lifted to a
distinct ambient radius class, the robust branch is impossible.  This explains
why adding any new strict pair kills the stale 23 exact-row shadows.

It does not yet close the live general branch: global K4 supplies a selected
four-subset, not ambient exactness at the first apex, and the current history
packet does not supply the required prescribed critical shell there.  The
immediate-terminal branch is also separate.

## Validation

From the repository root:

```bash
PYTHONPATH=. UV_CACHE_DIR=/tmp/uv-cache-atail \
  uv run python scratch/atail-force/history-global-incidence/check.py
```

From `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/history-global-incidence/HistoryGlobalIncidenceCountermodel.lean
```

Both commands exit zero.  Every printed Lean theorem has axiom closure
contained in `propext`, `Classical.choice`, and `Quot.sound`.  There is no
`sorry`, `admit`, named axiom, or `native_decide`.
