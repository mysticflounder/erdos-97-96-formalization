# Unique-four outer-arc transversal normal form

Date: 2026-07-22

Status: **KERNEL-CHECKED COMBINATORIAL NORMAL FORM; EXACT BOUNDED AUDIT;
NO SOURCE-LEVEL CONSUMER FOUND; NOT AN A-TAIL TERMINAL.**

## Verdict

The complement of the checked shell-curvature terminal has a clean circular
interval normal form:

> If the selected outer-arc family has matching number at most three, then at
> most four boundary-turn indices meet every selected outer arc.

There is also a sharper normal form for the high-coverage two-row subcase:

> If no two selected row instances supply their four mutually disjoint outer
> arcs, then the two-arc unions belonging to the row instances are pairwise
> intersecting.

Both statements are useful descriptions of the residual, but neither is a
closure theorem.  A hit is a **turn index** (a boundary edge position), not a
carrier point.  The exact-two `2+1+1` distribution, the complete-class
two-circle bound, and `R.noM44` currently consume carrier/support/MEC data;
none maps one of these turn hits into that data.

## Kernel-checked line and circle-cut theorem

[`ArcTransversalNormalForm.lean`](ArcTransversalNormalForm.lean) defines a
finite closed line interval and proves:

```lean
exists_three_point_transversal_of_not_hasFourSeparated
    (F : Finset NatClosedInterval)
    (hnoFour : ¬ HasFourSeparated F) :
    ∃ T : Finset ℕ, T.card ≤ 3 ∧ HitsEveryInterval T F
```

The proof is the explicit greedy right-endpoint proof.  Select an interval
`I₁` with least right endpoint `b₁`; discard all intervals containing `b₁`;
repeat for `b₂` and `b₃`.  If an interval remains after the third stage, the
four selected intervals are strictly separated from left to right,
contradicting `hnoFour`.

For a circular family, choose an arbitrary cut turn.  Every arc through the
cut is hit there.  Every arc avoiding the cut becomes one line interval.  Four
separated cut-avoiding intervals would be four pairwise disjoint circular
arcs.  Therefore matching number at most three gives:

```lean
CutArc.exists_four_point_transversal
    (cut : ℕ) (F : Finset CutArc)
    (hnoFour : ¬ HasFourSeparated (awayIntervals F)) :
    ∃ T : Finset ℕ,
      T.card ≤ 4 ∧ ∀ A ∈ F, A.HitBy cut T
```

The fourth point is only the distinguished cut; the other at most three are
the greedy right endpoints.

This is exactly the needed finite circular-interval argument.  It does not
use carrier geometry and therefore makes no unsupported identification of a
turn with a row endpoint or selected support member.

The file formalizes the cut-open normal form itself.  It does not yet import
the shell-curvature modules or provide a source adapter from
`IsSelectedRowOuterArc` into `CutArc`; such an adapter would be bookkeeping,
not a consumer of the resulting transversal.

## Sharper two-row residual

Each selected row supplies two internally disjoint outer arcs `Lᵣ` and `Rᵣ`.
Put

```text
Uᵣ = Lᵣ ∪ Rᵣ.
```

Two row instances supply a broad four-arc terminal precisely when their
unions are disjoint.  Internal disjointness is already known within each row;
disjointness of `Uᵣ` and `Uₛ` is equivalent to all four cross-row
disjointness conditions.

The file formalizes this as `TwoOuterArcRow.fourCrossDisjoint_iff` and proves:

```lean
pairwise_outerUnion_inter_nonempty_of_no_twoRowFourArcMatching
    (row : ι → TwoOuterArcRow α)
    (hno : ¬ HasTwoRowFourArcMatching row)
    {i j : ι} (hij : i ≠ j) :
    ((row i).outerUnion ∩ (row j).outerUnion).Nonempty
```

The indices are row **instances**, not carrier centers.  This matches the
checked terminal: `FourTurnDisjointSelectedRowArcs` does not require distinct
centers, so two different selected rows at one center are not excluded by the
abstraction.

## Exact bounded audit

[`analyze.py`](analyze.py) replays the two-row question against the stored
`n = 11` selected-row payloads.

Among the original twelve exact-two projections:

- 11 have at least one two-row four-arc witness;
- the unique exception is
  `cegar-exact-two/round_001/opp1_5.result.json`; and
- its selected-row outer unions have the two-turn transversal `{1,3}`.

The exception still has the already-recorded broad four-arc terminal: its
first witness uses left arcs at centers `3`, `2`, `0` and a right arc at center
`4`.  Thus it refutes only the two-row strengthening, not the checked broad
terminal.

The two global selected-row packing counterpatterns also lie in the two-row
complement:

| artifact | individual-arc transversal | outer-union transversal | row-pair support intersections of size `> 2` |
|---|---|---|---:|
| `exacttwo-opp1-4-strong.json` | `{1,6,9}` | `{0,5}` | 10 |
| `exacttwo-opp1-5-strong.json` | `{2,7,10}` | `{0,2}` | 18 |

Those two payloads are explicitly only cyclic selected-row abstractions, not
Euclidean realizations.  The final column shows that they already violate the
complete-class two-circle intersection bound, so they do not decide whether
that extra geometry eliminates every no-packing family.

## Consumer audit

### Exact-two `2+1+1`

**Not sufficient.**  Both global counterpatterns impose the exact-two
distribution and still have no four-arc packing and no two-row witness.  They
also carry one strongly connected selected-row graph and an exact rational
scalar-curvature model.  Hence no theorem using only those layers can consume
the transversal.

### Complete-class two-circle bounds

**Potentially excludes selected-row abstractions, but no bridge was found.**
Production proves `SelectedFourClass.inter_card_le_two` and several specialized
forms.  These concern carrier points simultaneously belonging to two selected
supports at distinct centers.  By contrast, membership in an outer-arc
intersection means only that one boundary turn lies between specified cyclic
row positions in both rows.  It supplies no common support point.

The theorem-bank registries and indexed Lean search contain no theorem
transporting a turn-arc transversal into a three-point selected-support
intersection, a common critical-fiber hit, or another existing terminal
antecedent.  The finite models' two-circle violations therefore identify a
missing geometric layer, not an already-available consumer.

### `R.noM44`

**No direct consumption.**  `R.noM44` refutes a complete alternative
`SurplusCapPacket` whose two non-surplus caps both have cardinality four.  The
existing audit `boundary_card_ge_four_of_isM44` shows that any useful
alternative packet must first produce a fourth MEC-boundary vertex.  A set of
turn indices hitting outer arcs gives neither a boundary vertex nor cap
cardinalities, and hence does not construct such a packet.

For the displayed packet, the local cardinality consequence of no-`M44` was
already spent when the second large cap was selected.  No indexed theorem was
found that recovers new selected-support incidence from the global no-`M44`
predicate.

### Universal minimality

The checked universal-minimality theorem says that every nonempty deletion is
hit by all selected rows at one remaining center.  It does not identify a
common boundary turn or convert a turn transversal into a carrier deletion.
The current normal form therefore has no direct minimality consumer either.

## Consequence for closure

This lane should **not** be promoted as the missing unique-four producer.  It
compresses the negative branch but stops one type boundary before every live
terminal:

```text
turn indices
    -- missing geometry -->
carrier/support/MEC incidence
    --> existing contradiction
```

The high-coverage two-row occurrence remains a good search schema: it closes
11 of the 12 stored projections.  The first structural residual is the
pairwise-intersecting two-interval family above, with
round-1/opposite-card-5 as its pinned regression.

A productive next finite experiment would add complete radius partitions and
the distinct-center two-circle restrictions while forbidding a two-row
witness.  Either:

1. exact UNSAT yields a small complete-class occurrence certificate feeding
   the existing broad curvature terminal; or
2. a survivor shows that a genuinely Euclidean/MEC or global-critical-system
   input is still required.

The generic four-point transversal itself should not be used as a closure
milestone unless a theorem is first found that maps a hit turn into the exact
antecedent of an on-spine support or `noM44` consumer.

## Validation

Focused Lean validation passed with warnings treated as errors:

```text
cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-arc-transversal-normal-form/\
ArcTransversalNormalForm.lean
```

Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, declared axiom, `unsafe`, or
`native_decide` escape hatch.

The bounded audit is replayed by:

```text
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/unique4-arc-transversal-normal-form/analyze.py
```

Its status is exact within the named JSON payloads only.
