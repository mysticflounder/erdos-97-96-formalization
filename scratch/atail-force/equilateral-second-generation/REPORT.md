# Equilateral second-generation classifier

Date: 2026-07-14

Status: **KERNEL-CHECKED NORMAL FORM AND OVERSTRENGTH AUDIT; NOT A TERMINAL;
K-A-PAIR REMAINS OPEN.**

## Verdict

One further use of global K4 at a divergent outside witness does produce a
small, fixed-label, bank-ready packet.  It does **not** force a contradiction.

Write

```text
x = z1
y = z2
a = oppApex2
```

and let `Kx`, `Ky` be the two continuation rows.  In the equilateral residual,

```text
y,a in Kx
x,a in Ky.
```

Choose `b in Ky.support`; for the intended application, `b` is the divergent
outside witness omitted by `Kx`.  Then

```text
member_row_three_anchor_deletion_survival
```

proves the exact disjunction

```text
K4 survives at b after deleting y
or K4 survives at b after deleting x
or K4 survives at b after deleting a.
```

The proof uses global K4 visibly.  If deleting `y` already survives, that is
the first branch.  Otherwise the exact `y`-critical shell at `b` exists.  If
that shell also contains both `x` and `a`, the three rows `Kx`, `Ky`, and the
critical shell instantiate the checked tetrahedron adapter and give `False`.
Hence the shell omits `x` or `a`, and deleting the omitted anchor preserves
its four-point class.

The structure

```text
ThreeAnchorDeletedK4Row D x y a b
```

packages the survivor as an exact `U5QDeletedK4Class` with deleted point one
of `{x,y,a}`.  The producer theorems are

```text
nonempty_member_row_threeAnchorDeletedK4Row
nonempty_paired_threeAnchorDeletedK4Rows
```

The paired theorem applies the construction at one chosen member of each
continuation row.  In particular it applies at both divergent outside
witnesses.

## Exact hit-profile classifier

The same tetrahedron adapter gives the exact classification when a selected
row `Kb` centered at `b` hits at least two equilateral anchors:

```text
exact_two_hit_profile_of_pair_hit
```

The three-hit profile

```text
{x,y,a}
```

is impossible.  Before using boundary order, the only exact two-hit profiles
are

```text
{x,y}, {x,a}, {y,a}.
```

The two-circle reflection kernel eliminates `{x,y}` once the cap-contiguity
bridge supplies

```text
0 < signedArea2 x a b * signedArea2 y a b.
```

This is exposed without overclaim in

```text
apex_pair_profiles_of_pair_hit_and_xy_sameSide.
```

Its conclusion retains exactly

```text
{x,a} or {y,a}.
```

The current scratch file deliberately takes the signed-area product as an
explicit premise.  The geometric reason it is available is that `x,y` form
one contiguous boundary block in `oppCap2`, while `a,b` lie outside that cap.
A production use should connect this through the existing boundary-index/cap
interval API rather than silently treating it as definitional.

## The proposed stronger target is false

It is not sound to claim that all two-hit profiles die, or that every new row
must omit at least two of the three anchors.

`verify_two_hit_profiles.py` checks exact `Q(sqrt(3))` coordinates for all
three named two-hit metric profiles.  The two profiles left by cap order are
strictly convex and have the two compatible complementary boundary orders:

```text
{x,a}: x,y,a,b
{y,a}: x,y,b,a.
```

The `{x,y}` local profile is also strictly convex, but its order separates
`x,y`; that is exactly why the live cap block excludes it.

Therefore the honest 0/1/2/3-hit classifier is:

1. zero-hit and one-hit profiles remain;
2. three hits are impossible by the tetrahedron terminal;
3. two hits reduce, after cap order, to `{x,a}` or `{y,a}`;
4. neither surviving apex-pair profile is uniformly contradictory from the
   named local metric and convex-order data.

The exact-coordinate audit is a **local named-point regression**, not a Lean
counterexample and not a `CounterexampleData`.  It does not supply four
witnesses at every center, total criticality, the MEC/cap packet, no-M44, or
global K4.  Its role is to prevent promotion of a locally false two-hit
elimination target.

## What the older two-row critical classifier adds

The same file also kernel-checks

```text
deletion_survives_or_two_oppositeRow_deletions_survive
paired_divergent_second_generation.
```

If the prescribed source deletion blocks at a divergent witness, the new
critical shell and the opposite continuation row share the source and have
distinct centers.  The two-circle intersection bound leaves at least two
members of the opposite row outside the critical shell.  Deleting each of
those members preserves K4 at the new center, and both survivors are packaged
as exact q-deleted U5 rows.  A retained `CriticalShellSystem` additionally
shows that both corresponding actual blockers differ from the new center.

This result is stronger in quantity but weaker in label control: the two
omitted opposite-row members are not identified with fixed anchors.  The
tetrahedron route is complementary because it gives one deletion from the
fixed set `{x,y,a}`.

## Bank and MEC audit

The banked tetrahedron kernel is the first direct terminal reached by the
second generation.  The complement supplies only one exact q-deleted row at
each generated center; no checked bank consumer closes from one such row
alone.

The previously suggested `MECStraddlingRowCore` map does not close this arm.
With `o=a`, `a'=x`, and `p=s=y`, the equal-distance skeleton is available, as
are the MEC-disk premises and the equilateral nonobtuse premise.  The missing
live fields are:

- MEC-boundary membership of both `x` and `y`; and
- the required common-polarity straddling signs for the two residual support
  points of the continuation row.

Using actual Moser boundary vertices repairs the boundary fields but loses the
equilateral equality skeleton.  This is a pinned interface deficit, not a
route to `False`.

## Next finite lift

There is a plausible next **combinatorial** use of the checked producer, but it
is not claimed here as closed.  Each continuation support consists of the two
named anchors plus two remaining members.  Applying the fixed-anchor producer
to all four remaining-member occurrences gives four rows colored by one of
three deleted anchors.  If the four centers are distinct, pigeonhole yields
two distinct exact rows with a common deletion.  If the two remaining-member
sets overlap, the overlap is a second common point of the continuation rows;
the already-proved outside-pair terminal removes the outside-cap case, leaving
a special shared-inside-cap branch.  This is the narrow next interface to
formalize; it is not evidence that either branch already closes.

## Validation

From `lean/`:

```bash
lake env lean \
  ../scratch/atail-force/equilateral-second-generation/EquilateralSecondGeneration.lean
```

exits successfully.  Every public `#print axioms` probe reports exactly

```text
propext, Classical.choice, Quot.sound.
```

The exact local profile audit is:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/equilateral-second-generation/verify_two_hit_profiles.py
```

and prints `PASS` for `{x,y}`, `{x,a}`, and `{y,a}`.

The scratch directory contains no `sorry`, `admit`, declared axiom, or
`native_decide`.
