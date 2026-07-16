# Directed original-q generated-row shape audit

## Scope

This audit owns only this report.  It changes no production Lean, closure
document, proof-blueprint state, protected file, or unique-row lane.

The question is whether the anchored F2 live-heavy/mixed packet forces a
generated original-`q` row at a named center to contain one of:

```text
p
the other named dangerous center
the retained coherent source
```

and, if not, what the weakest source-faithful interface is that can feed an
existing consumer.

## Epistemic labels

- **PROVEN** means kernel-checked in an existing Lean declaration, or an
  immediate finite-set consequence of such declarations whose premises are
  named below.
- **EXACT WITHIN THE LOCAL MODEL** means checked by exact algebra over real
  algebraic numbers, but not a Lean model of `CounterexampleData`.
- **COUNTERMODELED WITHIN THE LOCAL MODEL** means the proposed implication
  fails in that exact algebraic model.  It does not by itself refute a theorem
  using the full cap/MEC/global-critical-system surface.
- **CONJECTURAL** means neither proved nor refuted under the full anchored
  branch hypotheses.

## Theorem-bank and source preflight

The required current and sibling theorem-bank registries were checked, along
with focused indexed Lean searches for:

- original-`q` rows centered at a named dangerous point;
- prescribed support membership in a row selected from global K4;
- q-critical adjacent-center and common-point consumers; and
- two selected rows with a common outside-cap pair.

The load-bearing source declarations are:

```text
U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
U5QCriticalTripleClass.exists_card_three_of_qCritical
OriginalQGeneratedCenterProfile
OriginalQOffLiveGeneratedProfile
U5QCriticalTripleClass.two_triple_points_incompatibility
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
SelectedFourClass.inter_card_le_two
false_of_two_strictOppCap2_rows_common_outside_pair
```

No bank theorem produces the proposed reverse incidence.

## Exact source semantics

### What is automatic

For each named strict dangerous center `z`, the checked
`OriginalQGeneratedCenterProfile` gives:

```text
z ∈ D.A
z ≠ q
z lies in the actual source-q critical row
z lies in strictSecondCap
```

and the exact deletion split:

```text
an original-q q-deleted four-row centered at z
or
an original-q q-critical triple centered at z.
```

The direction of the automatic incidence is therefore:

```text
z ∈ support(source-q critical row centered at p).
```

It is not:

```text
p or another named point ∈ support(generated row centered at z).
```

### Why the two constructors must stay distinct

The q-critical arm comes from the complete radius filter through `q`.  The
filter has exactly three surviving points, so its support is canonical at
that radius.

The q-deleted arm first obtains a radius class with at least four points and
then uses `Finset.exists_subset_card_eq` to trim an arbitrary four-subset.
Consequently, a theorem about membership in *the selected four-subset* is
strictly stronger than the corresponding theorem about membership in the
full radius class.

In particular, statements quantified over every selected q-deleted witness
are selection-sensitive and should not be used as the geometric target.

## Candidate classification

| Candidate | Status | Reason |
| --- | --- | --- |
| Every generated row at `z` contains `p`, the other named center, or the coherent source | **COUNTERMODELED WITHIN THE LOCAL MODEL** | Exact q-critical and q-deleted extensions below avoid all three roles. |
| Global K4 alone produces a selected row with one of those named hits | **CONJECTURAL under the full branch; not source-implied** | The global-K4 theorem chooses a radius class and, in the q-deleted arm, an arbitrary four-subset.  It contains no prescribed-hit conclusion. |
| A q-critical row at a dangerous center contains two points of the dangerous triple | **PROVEN impossible** | `two_triple_points_incompatibility`; equivalently the intersection has cardinality at most one. |
| In live-heavy, a q-critical row at `x` contains the coherent source `r` | **PROVEN conditional terminal** | Completing the row with `q` gives two strict-`oppCap2` rows sharing the outside pair `{q,r}`.  This is already a contradiction, not a neutral producer field. |
| In mixed-q-critical, a q-critical row at `x` contains both `s` and `t` | **PROVEN conditional terminal** | Its completed row and the middle row share the three points `q,s,t`; distinct selected-circle centers cannot have three common support points. |
| One directed incidence uniformly closes live-heavy and both mixed constructors | **COUNTERMODELED as a local-shape claim and unsupported by current consumers** | The shortest existing consumers require different incidences in the different constructors. |

The fourth row uses only checked fields from the live-heavy packet:

```text
live support = {q,x,y,r}
x,y are distinct and lie in strictSecondCap
the live-row intersection with oppCap2 has cardinality exactly two
p lies in strictSecondCap
```

Thus `q,r ∉ oppCap2`.  A completed q-critical generated row at `x`
containing `r` shares the distinct outside points `q,r` with the live row,
and `false_of_two_strictOppCap2_rows_common_outside_pair` applies.

## Exact local countermodels

The existing
`r-f2-three-row-metric-audit/exact_local_model.py` constructs an exact
algebraic three-row model on the parabola

```text
P(u) = (u,u^2)
F(a,b) = dist(P(a),P(b))^2
       = (a-b)^2 * (1 + (a+b)^2).
```

It has exact rows

```text
live    = {q,x,y,r}, centered at p
middle  = {x,y,s,t}
deleted = {deleted,deleted_extra,s,t}
```

with all parameters distinct and every finite set of the parabola points
convex independent.

I extended that exact model in two independent ways at the named center
`x ≈ -4.1504897422`.

### Q-critical extension

For the circle through `q`, the exact polynomial

```text
F(x,v) - F(x,q)
```

has its four real roots in the disjoint rational intervals

```text
(-5.89,-5.88)
(-0.37,-0.36)
(0.61,0.63)       -- the exact root q
(5.63,5.64).
```

The three non-`q` roots are approximately:

```text
-5.88610329
-0.36671120
 5.63406819.
```

They avoid the exact parameters for:

```text
p ≈ 3.19521834
y ≈ -0.97197990
r ≈ 4.50372333
```

and all other points of the base model.  Adding those three roots therefore
gives an exact original-`q` q-critical row centered at `x` whose support
contains none of `p`, `y`, or `r`.

### Q-deleted extension

For the positive-radius circle through `P(0)`, the exact polynomial

```text
F(x,v) - F(x,0)
```

has exactly four real roots:

```text
one in (-5.91,-5.90)
0
one in (0.24,0.25)
one in (5.65,5.66).
```

Numerically they are:

```text
-5.90415828
 0
 0.24859685
 5.65556143.
```

All four avoid `q,p,y,r` and every other base parameter.  They give an exact
q-free four-row centered at `x` with none of the proposed named hits.

The new root intervals are disjoint from the four exact roots of each
existing live/middle/deleted circle, so adjoining either extension does not
change those existing exact classes.

These checks are exact algebraic sign/root-count checks, not floating-point
evidence.  Their trust boundary remains important:

```text
EXACT WITHIN THE LOCAL ALGEBRAIC MODEL
not a Lean proof
not a full CounterexampleData model
no cap/MEC/global-K4/total critical-system realization
```

They nevertheless rule out deriving the named-hit disjunction from the
three-row metric equations, convex independence, exact row cardinalities,
and the local incidence pattern alone.  Any valid full theorem must visibly
use additional global geometry.

## Existing consumers by branch

### Live-heavy, q-critical

The shortest conditional terminal is:

```text
coherent source r belongs to the q-critical support at x
```

or symmetrically at `y`.  This is one radius-class hit and then immediate
`False` by the common-outside-pair theorem.

The adjacent-center U5 consumer is longer.  For q-critical supports `Gx,Gy`
it needs:

```text
p ∈ Gx
p ∈ Gy
y ∈ Gx or x ∈ Gy.
```

### Mixed with q-critical middle row

The middle row is the completed class `{q,x,s,t}` centered at `oppApex2`.
A new q-critical row centered at `x` closes if:

```text
s ∈ Gx
t ∈ Gx.
```

One of these hits alone is not a current terminal.

### Q-deleted branches

The selected-class tetrahedron consumer requires five directed incidences
across two generated q-deleted rows.  A single generated-row hit does not
feed it.  Moreover, because q-deleted supports are trimmed subsets, the
geometric target should first establish the required points in the same full
radius class and only then select a four-row containing them.

There is therefore no truthful one-incidence interface that closes all
live-heavy/mixed arms.

## Weakest realizability-safe interface

The safe next interface is not a positive named-hit disjunction.  It is a
source-faithful **full-radius outcome** retaining:

```text
original deleted source q
named center z
the raw 4A constructor
the radius r
the complete radius filter at z
cap placement of z
actual critical-system/source provenance
```

For the q-deleted arm, retain the full filter and its lower bound before
choosing a four-subset.  For the q-critical arm, retain equality with the
complete three-point q-radius filter.

The genuinely new geometric producer should then be stated as the smallest
branch-specific distance equality needed by a named consumer:

```text
live-heavy q-critical:
  dist x r = dist x q

mixed q-critical:
  dist x s = dist x q
  dist x t = dist x q

q-deleted tetrahedron arm:
  the required named points lie in the relevant full radius classes
```

Membership in a selected support should be derived afterward by a
prescribed-point subset-selection lemma.  This avoids making an arbitrary
choice function carry mathematical content.

If one theorem must cover every live/mixed constructor, the honest target is
a direct parent contradiction:

```text
whole anchored live/mixed packet + raw full-radius outcomes -> False
```

not an existential packet asserting an incidence that the local geometry
does not force.

## Validation

The existing exact model script was rerun with the repository's `uv`
workflow and exited successfully:

```text
EXTERNALLY EXACT ALGEBRAIC CHECK: PASS
```

For the q-critical extension, exact algebraic comparisons gave endpoint
sign changes on the three non-`q` intervals:

```text
(-5.89,-5.88): - to +
(-0.37,-0.36): + to -
( 5.63, 5.64): - to +
```

and `q` is an exact fourth root in `(0.61,0.63)`.

For the q-deleted extension, exact comparisons gave:

```text
(-5.91,-5.90): + to -
( 0.24, 0.25): + to -
( 5.65, 5.66): - to +
```

together with the exact fourth root `0`.  The polynomial residuals at
`q,p,y,r` were all exactly nonzero.

No Lean build was needed because this lane adds only a Markdown audit and
makes no Lean declaration.

## Recommendation

Do not implement the proposed uniform one-hit producer as written.

The next proof lane should:

1. replace the selected-row target with a raw full-radius outcome;
2. split live-heavy q-critical, mixed q-critical, and q-deleted constructors;
3. target the branch-specific distance equalities above; and
4. require every proof to visibly consume cap/MEC/order or global
   critical-map information absent from the exact local countermodels.

This is the smallest interface that preserves realizability and still has a
direct route into existing consumers.
