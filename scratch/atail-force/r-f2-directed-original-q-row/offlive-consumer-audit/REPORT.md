# Original-q off-live generated-row consumer audit

Date: 2026-07-16

Status: **NO DIRECT BANK MATCH FROM THE TWO-OFF-LIVE CARDINALITY FACT
ALONE. THE OLD TWO-OFF-LIVE HANDLER IS INCOMPATIBLE WITH THE EXACT F2
SURFACE. THE SOURCE-IMPLIED REFINEMENT IS AN EXACT
OUTSIDE-MIDDLE-SUCCESSOR / BOTH-SUPPORT-ONLY-HITS SPLIT; IN LIVE-HEAVY,
EXACT SUPPORT COUNTING MAKES THE CONFINED BOTH-HIT ARM TERMINAL (NOT YET
PACKAGED AS LEAN IN THIS AUDIT).**

## Scope

This audit owns only this report. It changes no Lean source, production
module, closure document, proof-blueprint state, protected file, or
unique-row lane.

The input under audit is the checked theorem:

```lean
two_le_exactGeneratedAt_support_sdiff_live
```

and its live-heavy/mixed wrappers in:

```text
scratch/atail-force/r-f2-directed-original-q-row/
  OriginalQOffLiveDeficit.lean
```

For an exact original-`q` generated row `G` centered at a named dangerous
point `z`, it proves:

```text
2 <= card (G.support \ {q,t1,t2,t3}).
```

The source, center, q-deleted/q-critical constructor, and actual generated
support are retained.

## Required theorem-bank preflight

Before classifying consumers, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- the current U5 incidence kernels;
- the existing F2 bank-match, generated-escape, cross-survival, and
  common-deletion reports; and
- focused `nthdegree docs search --lean` queries for two common outside
  points, q-critical dangerous-center rows, q-deleted tetrahedra,
  prescribed-deletion criticality, and the two-large-cap metric
  obstruction.

The closest checked consumers are:

```text
false_of_two_strictOppCap2_rows_common_outside_pair
U5QCriticalTripleClass.two_triple_points_incompatibility
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility
secondApexCritical_reorients_to_firstApexUniqueFour
```

The closest sibling-only q-deleted consumer is:

```text
U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
```

No banked theorem consumes merely two anonymous generated support points
outside the live row.

## What the checked producer does and does not give

The two-off-live conclusion immediately supplies two distinct points
`a,b` with:

```text
a,b in G.support
a,b notin {q,t1,t2,t3}
a != b
a,b in D.A
dist z a = dist z b.
```

It does **not** supply:

```text
a or b in the retained middle row C.B2
a or b outside oppCap2
a or b in another generated row
a or b in the fixed first-apex radius class
deletion criticality at the physical second apex
p, the other dangerous center, or the coherent source in G.support.
```

Support omission is not a metric inequality, and the two points cannot be
silently substituted into another independently selected four-row.

## The old two-off-live handler is the wrong consumer

The existing handler

```lean
successor_or_secondCenterAlignment_of_two_off_live_sources
```

requires:

```text
2 <= card ((((C.B1 union C.B2) \ deletedCriticalSupport C) \ live)).
```

The live-heavy and mixed branches are already inside
`TwoLiveExactCoverSecondApexProfile`. Its exact-cover fields say:

```text
C.B1 = live
C.B2 subset live union deletedCriticalSupport C
outsideBothCell C.B2 live (deletedCriticalSupport C) has card 0.
```

Therefore:

```text
(((C.B1 union C.B2) \ deletedCriticalSupport C) \ live) = empty.
```

This is an immediate finite-set consequence of the checked profile. Thus the
new generated off-live pair cannot be turned into the old antecedent by
renaming points or by asserting marginal membership:

- if a generated off-live point lies in `C.B2`, exact cover places it in
  `deletedCriticalSupport C`, so it is not fresh;
- if it does not lie in `C.B2`, it lies outside `C.B1 union C.B2`, so it is
  not a `FreshCriticalSource C`.

The old two-off-live branch should not be the integration target.

## Exact consumer matrix

### 0. Pair-level continuation classifier: no extra off-live condition

The concurrently checked scratch theorem

```text
OriginalQGeneratedPair.cross_survival_or_metricResidual
```

already turns the two live-heavy original-`q` generated rows into:

```text
cross-deletion survival at x
or
cross-deletion survival at y
or
TwoContinuationRows.MetricResidual.
```

It requires no named hit and does not use the two-off-live cardinality field;
the exact generated rows themselves are enough for this classification.

Status: **SOURCE-PROVED SCRATCH CLASSIFICATION, but not a contradiction.**

The two survival arms are continuation outputs. The existing
both-q-critical metric sink is tied to the old deleted source and its
anchored cap-order separation, so it does not automatically discharge the
new original-`q` residual. Thus this classifier is the weakest current
live-heavy routing interface, but an additional source-faithful consumer is
still required after the split.

### 1. Live-heavy q-critical: one coherent-source radius equality

Let the live dangerous triple be:

```text
{x,y,r}
```

where `r` is the retained coherent source. In live-heavy:

```text
p,x,y in strictSecondCap
live support = {q,x,y,r}
live support intersect oppCap2 = {x,y}
q,r notin oppCap2.
```

A generated q-critical row at `x` or `y` becomes a selected four-row after
adjoining `q`. Therefore the single branch-specific condition:

```text
r in generated q-critical support
```

is already terminal. It implies:

```text
dist z r = dist z q
```

The generated row and the live row have distinct
strict-`oppCap2` centers and share the distinct outside pair `{q,r}`.
`false_of_two_strictOppCap2_rows_common_outside_pair` gives `False`.

The converse is not available from the retained `ExactGeneratedAt` fields:
its q-critical arm stores a selected three-point support and its radius
equalities, but not the original no-K4 proof or a full radius-filter
equality. If later code targets the metric equality first, it must retain
enough prescribed-deletion criticality to recover support membership.

Status: **PROVEN conditional terminal.**

This is the weakest named live-heavy q-critical sink found. It is not a
neutral producer field.

### 2. Two live-heavy q-critical rows: one shared off-cap point

If both generated rows at `x,y` are q-critical, both completed rows already
contain the outside point `q`. Hence the additional condition:

```text
exists a,
  a in Gx.support
  and a in Gy.support
  and a notin oppCap2
```

is enough for the same ordered-cap consumer. The second common outside point
is automatically `q`.

Status: **exact direct-consumer interface, not source-implied.**

For q-critical/q-deleted or q-deleted/q-deleted pairs, `q` is absent from at
least one selected row, so two shared outside-cap points are needed.

### 3. Mixed q-critical: both named support-only hits

In the mixed q-critical middle-row arm, the completed retained row is:

```text
{q,x,s,t}
```

centered at the physical second apex. A new q-critical row centered at `x`
already contains `q` after completion. The two conditions:

```text
s in generated q-critical support
t in generated q-critical support
```

imply the corresponding distance equalities and make the two selected
circles share `q,s,t`. Distinct centers cannot have three common circle
points. The distance equalities alone are not interchangeable with selected
support membership unless the original q-criticality/full-radius provenance
is retained.

Status: **PROVEN conditional terminal.**

One of these incidences alone is not a current terminal.

### 4. Q-critical dangerous-triple two-hit consumer

`U5QCriticalTripleClass.two_triple_points_incompatibility` would consume two
dangerous-triple hits. That target is already impossible:

```text
card (generated q-critical support intersect dangerous triple) <= 1.
```

Status: **PROVEN impossible. Do not mine this antecedent.**

### 5. Adjacent and third-common q-critical consumers

For live-heavy q-critical rows `Gx,Gy`, the adjacent-center theorem needs:

```text
p in Gx
p in Gy
and (y in Gx or x in Gy).
```

The third-common theorem needs:

```text
p in Gx
p in Gy
r in Gx
r in Gy.
```

These are respectively three- and four-incidence deficits. They are valid
conditional terminals, but they are not weaker than the one coherent-source
hit above.

### 6. Q-deleted tetrahedron

The sibling theorem

```text
U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility
```

needs five directed incidences across the two generated q-deleted rows after
using the retained middle row as the third exact class.

For q-deleted rows, these conditions should be stated first as membership in
the **complete radius classes**, not membership in an arbitrary selected
four-subset. Only after the prescribed points are known to lie in one full
class should a four-subset containing them be selected.

Status: **source-proved sibling consumer, not locally import-reachable, with a
five-incidence deficit.**

### 7. Physical-second-apex criticality

For any generated off-live point `a`, deleting `a` preserves the live row at
`p`. If deleting `a` is critical at the physical second apex:

```text
not HasNEquidistantPointsAt 4 (D.A.erase a) S.oppApex2,
```

then one prescribed critical shell at that apex feeds:

```lean
secondApexCritical_reorients_to_firstApexUniqueFour.
```

Status: **one source-faithful negative-K4 condition reaches the existing
swapped `FA-UNIQ4` frontier.**

If deletion instead survives at the physical second apex, it produces a new
common-deletion packet rather than `False`.

### 8. `u1TwoLargeCapObstruction`

One generated row supplies only its own equal-radius equations. The banked
five-point obstruction requires seven equalities across several centers.
The current finite-bank audit found one- or two-equality deficits only after
much richer fixed-shadow assignments; the anonymous off-live pair does not
provide those cross-row equalities.

Status: **not a direct consumer of this producer.**

## Exact source-implied outside-middle / both-hit split

The correct refinement uses the exact F2 cells, not an unsupported cap
placement for the support-only points.

For live-heavy:

```text
C.B2 = {x,y,s,t}
C.B2 \ live = {s,t}
card (C.B2 \ live) = 2
s != t.
```

The same cell statement holds in the named mixed packet, with its own
`x,y,s,t`. For any original-`q` generated profile, write:

```text
O = G.support \ live.
```

The checked producer gives `2 <= O.card`. There are exactly two cases.

### A. A generated off-live point lies outside the middle row

```text
exists a,
  a in G.support
  and a notin live
  and a notin C.B2.
```

Deleting `a` preserves:

- the exact live row at `p`, because `a` is off live; and
- the exact retained middle row at `S.oppApex2`, because `a` is off `C.B2`.

Generated-support membership supplies `a in D.A`. Together with the retained
center inequality, this constructs:

```text
Nonempty
  (CommonDeletionTwoCenterPacket D W.H a p S.oppApex2).
```

This is a genuine source-faithful continuation.

### B. Every generated off-live point lies in the middle row

If `O subset C.B2`, then:

```text
O subset C.B2 \ live = {s,t}.
```

Since `2 <= O.card` and `{s,t}` has cardinality two:

```text
O = {s,t}
s in G.support
t in G.support.
```

Thus the exact alternative is:

```text
new common-deletion successor
or
both named support-only points s,t lie in the generated support.
```

Status: **SOURCE-IMPLIED by a finite argument from checked Lean fields, but
not yet packaged as its own Lean declaration in this audit.**

The second arm has different consumers by constructor:

- **mixed q-critical:** already `False`, because the completed generated row
  and retained middle row share `q,s,t`;
- **live-heavy q-critical:** the exact support-card and omission fields force
  one more named live hit, and the resulting two subcases are both terminal;
- **live-heavy q-deleted:** the same counting forces both remaining named
  live hits, yielding a three-common-points terminal;
- **mixed q-deleted:** likewise not terminal from the current bank.

This split is strictly sharper and safer than demanding a named
`p / other center / coherent source` hit. It also explains exactly where the
mixed q-critical branch closes and where a new geometric producer is still
needed.

### Live-heavy confinement is terminal after exact counting

The preceding live-heavy bullets require one further finite argument; the
bare statement `s,t ∈ G.support` understates what the retained exact row
already forces.

Fix the generated center `x`; the `y`-centered statement is symmetric. In
live-heavy:

```text
live = {q,x,y,r}
middle = {x,y,s,t}
O = G.support \ live = {s,t}
q notin G.support
x notin G.support
```

The last omission is the selected row's center omission. Therefore every
remaining support point lies in `{y,r}`.

If `G` is q-critical, `G.support.card = 3`. Since it already contains the
distinct pair `s,t`, its third point is exactly one of `y,r`:

```text
G.support = {s,t,y}
or
G.support = {s,t,r}.
```

- In the `y` arm, the generated `x`-circle and the retained
  second-apex circle share the three distinct points `y,s,t`; their centers
  are distinct because `x` belongs to the retained row support.
- In the `r` arm, adjoining `q` completes the q-critical row, and the
  generated row and live row share the outside pair `q,r`. Their distinct
  strict-`oppCap2` centers feed
  `false_of_two_strictOppCap2_rows_common_outside_pair`.

If `G` is q-deleted, `G.support.card = 4`. The same containment and omissions
force:

```text
G.support = {s,t,y,r}.
```

The generated `x`-circle and retained second-apex circle again share the
three distinct points `y,s,t`, so this arm is contradictory.

Consequently the source-faithful live-heavy refinement is stronger than the
generic split:

```text
an off-live generated point lies outside the middle row
or
False.
```

For integration, the cleanest theorem can expose the first arm
unconditionally: split on outside-middle existence and eliminate the
confined case by the contradiction above. Its payload should be exactly:

```text
exists a,
  a in G.support
  and a notin live
  and a notin middle.
```

That witness feeds the common-deletion packet constructor without adding a
new incidence conjecture.

Status: **SOURCE-IMPLIED, BUT NOT FORMALIZED AS A LEAN DECLARATION IN THIS
AUDIT.** The counting uses only the checked support cardinality, deleted
source omission, row-center omission, and the exact live/middle support
equalities. The terminal step uses checked two-circle/ordered-cap geometry.
Until this finite split and its two terminal adapters kernel-check together,
it should not be reported as a closed Lean branch.

## Why the new continuation is not yet closure

`RCommonDeletionOrigin` currently has only:

```text
anchored
reciprocal
spent.
```

It has no constructor for a source obtained from an original-`q` generated
row. The new common-deletion packet therefore cannot simply be inserted into
the current origin-tagged DAG without retaining:

```text
the original source q
the named generated center z
the exact q-deleted/q-critical constructor
the full radius class
the chosen off-live/outside-middle point
the old packet and new packet.
```

Moreover, a generic `CommonDeletionTwoCenterPacket` is not terminal. The
existing exact successor-cycle regression refutes geometry-free termination
of repeated common-deletion expansion. Integration needs either:

1. a new generated-source origin with a genuine monotone measure; or
2. a direct coupling of the generated-source successor to cap/MEC/order or
   the global critical map before recursion.

Creating the packet without one of these consumers is progress, but it does
not close a production `sorry`.

## Countermodel and overstrength boundaries

### Named-hit disjunction

The exact local algebraic model in the sibling shape audit extends the
source-faithful three-row geometry at a named center `x` with:

- an exact original-`q` q-critical row; and
- an exact q-free q-deleted four-row;

both avoiding:

```text
p
the other dangerous center y
the coherent source r.
```

Status: **COUNTERMODELED WITHIN AN EXACT LOCAL ALGEBRAIC MODEL, not a full
`CounterexampleData` model.**

Thus a uniform producer:

```text
p in G.support or y in G.support or r in G.support
```

cannot be derived from the local exact-row equations, convex independence,
and current incidence pattern alone. A valid theorem must visibly consume
additional cap/MEC/order or global critical-map information.

This does not refute the live-heavy confinement argument above: a model
avoiding `y,r` cannot lie in the confined arm once the exact off-live count
and middle-cell equality are imposed. It belongs to the outside-middle
successor side of that split.

### Q-deleted selected-support membership

The q-deleted constructor obtains a full radius class of cardinality at least
four and then trims an arbitrary four-subset. A prescribed point may belong
to the full radius class while being omitted from the chosen subset.

Status: **SELECTION-SENSITIVE / OVERSTRONG AS A UNIVERSAL SELECTED-SUPPORT
TARGET.**

The producer should target full-radius membership first.

### Shared generated pair

The two-off-live cardinality theorem alone permits the two live-heavy
generated supports to use disjoint anonymous off-live points. It also permits
both generated supports to avoid the retained marginal.

Status: **COUNTERMODELED WITHIN THE EXACT FINITE-INCIDENCE PROJECTION; not a
Euclidean or full-parent countermodel.**

Therefore no common pair, named hit, or marginal placement should be inferred
from the cardinality result.

### Generic successor termination

The existing 24-vertex successor-cycle regression satisfies the stated
finite common-deletion abstraction and has a genuine periodic successor
orbit.

Status: **COUNTERMODELED WITHIN THE FINITE COMMON-DELETION ABSTRACTION; not a
full geometric countermodel.**

Any termination theorem must consume geometric/provenance data omitted by
that model.

## Recommended next implementation order

1. **Use the pair-level continuation classifier as the live-heavy baseline.**
   It needs no extra named incidence; its remaining obligations are the two
   cross-survival consumers and the original-`q` metric-residual sink.

2. **Formalize the sharpened live-heavy split.** First prove the generic
   outside-middle-successor / both-support-only-hits split, then consume
   support cardinality plus deleted-source/center omission to close the
   confined live-heavy arm. The surviving live-heavy output is therefore an
   outside-middle common-deletion successor, not an unresolved both-hit arm.

3. **Close the mixed q-critical both-hit arm immediately** with the
   three-common-points consumer.

4. **Package the outside-middle common-deletion packet with generated-source
   provenance.** Do not route it through the old two-off-live handler.

5. **Give that new origin an immediate geometric consumer or monotone
   measure.** A bare recursive packet is not closure.

6. **For the remaining both-hit arms, retain the raw full radius class and
   add only the first branch-specific incidence or cap role consumed by a
   named terminal.**

7. **For q-deleted arms, retain the raw full radius class and state all
   prescribed hits there before selecting a four-row.**

8. **Do not mine** a uniform `p / other center / coherent source` selected-hit
   disjunction, two dangerous hits in one q-critical support, or support
   omission as a distance inequality.

## Validation boundary

This lane adds only a Markdown audit. No Lean build was run.

All claims labeled **PROVEN conditional terminal** cite existing checked Lean
consumers. The outside-middle / both-hit split is explicitly labeled
source-implied but not yet packaged in Lean. The sharpened live-heavy
confined-arm contradiction is likewise an audited source argument, not yet a
kernel-checked declaration. Countermodels are scoped to the exact
abstractions they actually validate and are not presented as counterexamples
to the full K-A parent.
