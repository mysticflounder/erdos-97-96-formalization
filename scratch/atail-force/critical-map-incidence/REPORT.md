# Robust critical-map incidence boundary

Status: **PROVEN LEAN NORMAL FORM + EXACT STRENGTHENED FINITE SHADOW; NOT A
LIVE K-A CLOSURE CLAIM.**

The required theorem-bank registries and indexed Lean corpora were checked
before deriving these statements.  No banked theorem consumes two reciprocal
cross nonmemberships.  The closest U5 and separation consumers require a
positive cross hit, a shared pair, a common blocker, or already-produced
dangerous/cap placement data.

## Lean consequences

`robust_cross_nonmembership.lean` proves without `sorry`:

1. At the actual blocker chosen for `q`, deleting `w` preserves K4 **if and
   only if** `w` is absent from `selectedAt(q).support`.
2. The single reverse cross omission
   `q ∉ selectedAt(w).support` already forces
   `centerAt(q) ≠ centerAt(w)`; reciprocal omission is stronger than needed
   for center separation.
3. Therefore the two exact selected supports overlap in at most two points.

The third result is only an upper bound.  It cannot activate the banked
shared-pair separation core or any U5 positive-incidence consumer.

Direct single-file validation succeeds.  All three printed declarations have
axiom closure exactly `propext`, `Classical.choice`, and `Quot.sound`.

## Exact finite obstruction to an incidence-only producer

`validate_shadow.py --check` independently replays the existing strengthened
card-12 `(5,5,5)` shadow, then selects the following robust packet:

```text
surplus cap       = {0,1,2,3,4}
first apex        = 4
second apex       = 0
q,w               = 10,11
blocker(q),b(w)   = 1,3
selectedAt(q)     = {0,3,8,10}
selectedAt(w)     = {2,4,6,11}
```

The pair is off surplus and co-radial at the first apex.  Deleting either
point preserves K4 at the second apex.  Both cross deletions preserve K4 at
the actual blockers, equivalently both cross memberships are absent.  The
blockers are distinct, lie in the surplus cap, and the two exact supports are
disjoint.  The second-apex distance labels differ, so there is no forbidden
two-apex joint fiber.

The underlying shadow already enforces a total common critical map, exact
four-point full rows, deletion criticality, cap profiles and cyclic order,
one-sided cap injectivity, endpoint one-hit, pairwise row overlap at most two,
cyclic separation for every shared pair, outside-pair uniqueness, and the
dangerous exact row.  Thus reciprocal nonmembership plus the present finite
incidence consequences does not force even one bank-positive antecedent.

This is not a Euclidean counterexample.  It omits coordinate realizability,
actual `ConvexIndep`, MEC/circumscribed-Moser geometry, the full cap predicates,
and the complete no-M44/live-data fields.

## Exact next census

Another support-only or blocker-graph census cannot cross this boundary.  The
next finite search must join the critical map to one shared geometric model.
For each surviving pair it must carry:

- actual point coordinates (or a certified realizable order/metric model);
- one total blocker choice `b(x)` for every carrier source;
- one exact four-point full distance class `S_x` centered at `b(x)`, with
  `x ∈ S_x`, `b(x) ∉ S_x`, and deletion of `x` killing every K4 radius at
  `b(x)`;
- the robust constraints `w ∉ S_q` and `q ∉ S_w`;
- the MEC/Moser/cap placement and no-M44 predicates used by the live leaf;
- motif output for the first consumed alternatives: a positive cross hit,
  a two-point shared support, a common/apex-aligned blocker, or a named U5
  incompatibility antecedent.

The decisive question for that census is not whether the abstract incidence
map exists—it does—but whether it has a realization satisfying the omitted
convex MEC/cap/no-M44 layer.  A realizable survivor is a precise falsifier for
the current producer plan; exhaustive UNSAT with a checkable certificate is
the missing producer theorem's finite core.
