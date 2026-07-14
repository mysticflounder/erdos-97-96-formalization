# ATAIL Stage-I prescribed-apex deletion assessment

Date: 2026-07-14

## Authorization and ownership

Adam authorized this ATAIL work as genuine parallel closure research,
including proof-local analysis files, scratch Lean, theorem-bank searches,
bounded theorem discovery, and closure-document synchronization.  The work
does not take ownership of the concurrently edited
`U1LargeCapRouteBTail.lean`, LIVE-T1, or card-11 production sources.

## Exact result

The source in
`stage1_prescribed_apex_deleted_k4_dichotomy.lean` now implements the
prescribed-center deletion split required by the full-filter route.

For a three-point off-surplus marginal

```text
T_r = {x in A | dist x oppApex1 = r} \ surplusCap,
```

the reflection sink proves that at most one `q in T_r` can have deletion
blocked at `oppApex2`.  Two blocked sources would lie in one exact critical
shell at that apex, hence share both opposite-apex radii, contradicting
`oppCap2_escape_gen`.  Therefore at least two sources survive deletion at
`oppApex2`.

The scratch structure `SurvivorPairRelocationPacket` records two such sources
`q,w`, their common first-apex radius, distinctness, individual deletion
survival at the second apex, and the fact that their actual common-system
blockers are not that apex.

Their second-apex radii are distinct.  Consequently:

```text
K4 survives after deleting both q,w
OR
there are two disjoint ambient exact four-shells at oppApex2,
one through q and one through w.
```

In the shell arm, the banked convex one-hit theorem puts at least two points
of each shell in the strict interior of `oppCap2`.  Disjointness gives four
strict-interior points, hence

```text
6 <= |oppCap2|,
12 <= |A|.
```

At exact card 12, all cap-sum inequalities are equalities and the oriented
profile is

```text
(|surplusCap|, |oppCap1|, |oppCap2|) = (5,4,6).
```

Thus the shell arm is impossible at card 11.  At card 12 it lands in the
labeled `(5,6,4)` AHEAD profile; that profile was deliberately unmeasured and
is not covered by the historical nonterminal `654_all` run.

## Robust survivor arm

The double-deletion-survival arm is not terminal.  A K4 radius in
`A.erase q |>.erase w` has at most one surplus-cap point, so it contains at
least three off-surplus points at one fixed `oppApex2` radius.  The symmetric
blocked-source bound says at most one of those deletions can block K4 at
`oppApex1`.  Hence two fresh points survive deletion at the first apex.

This is an apex flip:

```text
two survivors on one first-apex marginal
  -> either two disjoint shells / cap growth,
     or a fresh survivor pair on a second-apex marginal.
```

The flip is positive structural progress but is not closure.  Repeated
survivor arms can cycle unless a later theorem supplies a monotone quantity,
a blocked finite deletion core, or a cap/order/critical-row coupling that
consumes one of the surviving full classes.

This is not merely a proof-search concern.  The exact checker
`stage1_apex_flip_cycle_countermodel_2026-07-14.py` specializes the existing
12-vertex blocker-graph shadow with closed cap profile `(5,5,5)` and verifies
both full-filter covers, both adjacent one-hit bounds, all-center exact K4,
deletion blockers, a common blocker system, singleton joint fibers, and the
forced alternation

```text
{1,2} -> {6,7} -> {1,2}.
```

The first class realizes the exact `2 + 1 + 1` branch, while the second has
three strict-own-cap points, so neither output of the class split is monotone.
The checker passes under

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/stage1_apex_flip_cycle_countermodel_2026-07-14.py
```

with source SHA-256
`7886379b1b8b2f5f863c1ccae2c88806f6eb8befbdb8cc315f112e28e4411527`.
This is exact within the finite symmetric distance-label abstraction, not a
Euclidean/convex/MEC counterexample.

The precise loss is deletion history.  The mirrored theorem proves survival
in `A.erase x` and `A.erase y`, not in
`((A.erase q).erase w).erase x` and
`((A.erase q).erase w).erase y`.  The first useful positive theorem is
therefore a one-step bi-apex alternative: robust survival at `oppApex2`
forces K4 at `oppApex1` on the same twice-erased carrier, or immediately
produces a named shell/cap/order/critical-row sink.  Only after that bridge can
the survivor theorem be strengthened to cumulative erasure and iterated with
the strictly decreasing remaining-carrier cardinality.

The optional exact-class refinement is also recorded.  For a twice-erased K4
class `T` and

```text
I = oppCap2 \ (surplusCap union oppCap1),
```

either `3 <= |T intersect I|`, or `T` has exactly four points distributed as
`2 + 1 + 1` across `I`, `surplusCap`, and `oppCap1`.  This is a
`MoserSubpacketSelectorShapeAt`-type output, not the stronger full
`MoserSelectorShapeAt`; no banked contradiction consumes it without an
additional other-apex equality or row incidence.

## MUS-style generalization

`stage1_minimal_deletion_core.lean` formalizes the deletion-based MUS
generalization.  If a finite set `U` has pairwise distinct prescribed-center
radii, deleting all of `U` blocks K4, and restoring any one member restores
K4, then every `s in U` has its own exact ambient four-shell.  Those shells
are pairwise disjoint.  Any two core members already force the corresponding
closed cap to have cardinality at least six.

The mathematical all-members bound is

```text
2 * |U| + 2 <= |opposite cap|,
2 * |U| + 8 <= |A|.
```

The current scratch source kernelizes the shell family and the two-member
cap-six consequence.  The all-members finite-sum bound and extraction of a
minimal blocked subset from an arbitrary blocked deletion set remain useful
follow-ups, not prerequisites for validating the current source.

## Theorem-bank verdict

The required local registries and indexed Lean searches were checked before
the new statements were written.  Reused inputs include:

- `selectedClass_erase_witness_or_exact_erased_pin`;
- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`;
- `oppApex2_exactRadiusClass_cover`;
- `oppApex2_surplusCap_one_hit` and
  `oppApex2_otherCap_one_hit`;
- `U2NonSurplusSqueeze.oppCap2_escape_gen`; and
- `U1OppositeCapLowerBounds.capTriple_caps_card_ge_four`.

No banked consumer closes the robust apex-flip class, the two same-center
disjoint-shell packet, or the resulting card-12 `(5,4,6)` oriented profile.
The closest metric/order cores require cross-incidence or orientation data
not produced here.

## Epistemic and validation status

- **PROVEN / CHECKED-SCRATCH:** the prescribed-center split,
  blocked-at-most-one argument, survivor normal form, cap-growth arithmetic,
  robust-class split, mirrored survivor extraction, and generic minimal-core
  construction.  Direct checks from `lean/` exit 0 for both scratch modules;
  every printed endpoint depends only on `propext`, `Classical.choice`, and
  `Quot.sound`, with no `sorryAx`.  Source SHA-256 values are
  `47929b843557e396df7fdab0428f18426f8220f4081770a36e2d6835300fd771`
  for the prescribed-apex module and
  `0194f5ebee9a866eb1816f3a6f855dbfbdf8003f19718ea0e1da4cb0a36a94dc`
  for the minimal-core module.
- **NOT CLAIMED:** closure of K-A-PAIR, coverage of card 11 or the AHEAD
  `(5,6,4)` profile, a terminating survivor iteration, or removal of any
  production `sorry`.
