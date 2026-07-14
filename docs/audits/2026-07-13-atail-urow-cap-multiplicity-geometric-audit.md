# ATAIL `u`-row cap-multiplicity geometric audit (2026-07-13)

## Scope and evidence labels

This is authorized parallel research on the ATAIL lane.  It audits only the
two geometric fields in
`Problem97.ATAILOutsideSourceScratch.URowCapMultiplicityFields` against the
current hypotheses of
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`.
It does not edit the shared Route-B source, run a Lean build, claim closure of
K-A-PAIR, or change the card-11 or LIVE-T1 lanes.

Claims below use the repository labels:

- **PROVEN:** a current source theorem, or an elementary deduction whose full
  argument is given here;
- **EMPIRICALLY VERIFIED:** exactly replayed inside a stated finite abstraction,
  but not a Euclidean or Lean-kernel model;
- **CONJECTURED:** a precise statement not currently proved or refuted under
  the full live hypotheses; and
- **HEURISTIC:** a research ranking.

The theorem-bank registries required by `AGENTS.md` were checked, as were
indexed Lean searches for critical-shell/cap confinement, same-cap centers,
and outside equal-distance pairs.  The bank contains the needed consumers and
one-sided cap bounds, but no producer for either field audited below.

## Executive verdict

Let

```text
B = {q,t1,t2,t3},
c = rows.uRow.center,
R = rows.uRow.selected.toCriticalFourShell.support.
```

Then the desired statement is

```text
exists k,
  p in cap[k] and c in cap[k] and
  2 <= |R intersect (B minus cap[k])|.
```

The verdict is:

| Field | Full live status | Audit verdict |
|---|---|---|
| a cap containing both `p` and `c` | **CONJECTURED** | Not derivable from any current cap/cardinality theorem. `hNoM44` and `hcard` supply cap sizes, not a relation between these two points. A strengthened `(5,5,5)` finite shadow falsifies this field. |
| two dangerous points of `R` outside that cap | **CONJECTURED** | Not derivable from the two known complement bounds. It forces the two exact circles to have their maximal possible two-point carrier intersection. A strengthened `(4,5,6)` finite shadow and an exact local Euclidean gadget show that the current local row geometry does not force it. |
| combined `URowCapMultiplicityFields` | **CONJECTURED** | No proof and no target-faithful Euclidean countermodel. It remains a possible contradiction route only if new global K4/critical-system/two-large-cap coupling is proved. |

**HEURISTIC recommendation.** Do not treat the fixed supplied `uRow` as the
primary producer until common-system provenance is retained explicitly.  The
actual outer caller constructs `rows` from one `Hcritical`, but the current
K-A-PAIR theorem accepts `rows` and `hcritical` independently.  That interface
erases the only available mechanism by which `hcritical` could constrain this
particular `uRow`.

## 1. Exact source boundary

The scratch audit already proves the following.

1. **PROVEN:** `u` is a carrier point, lies in `R`, and lies outside `B`.
2. **PROVEN:** `c` is a carrier point and `c != p`.
3. **PROVEN:** `|R| = |B| = 4` and `|R intersect B| <= 2`; hence
   `2 <= |R minus B|`.
4. **PROVEN:** `p` belongs to some closed indexed cap and `c` belongs to some
   closed indexed cap.  These witnesses are independent.
5. **PROVEN:** for every cap containing `c`, at most two points of `R` lie in
   the cap, and hence at least two points of `R` lie outside it.
6. **PROVEN:** for every cap containing `p`, at least two points of the exact
   dangerous row `B` lie outside it.

Items 4--6 do not align either the cap witnesses or the two complements.
That is not just a Lean packaging gap: the two alignments are genuinely new
mathematical assertions.

### 1.1 The provenance gap is exact

`CriticalRowPacket` records a source, a carrier center, and an exact
four-point full radius class containing the source.  It does **not** record
the `CriticalShellSystem.no_qfree` deletion-blocker field.  Consequently,
from the K-A-PAIR signature alone, `hcritical` cannot be specialized to
`rows.uRow`.

The outer Route-B caller does construct

```text
Hdepth5Rows = CriticalSourceRows.ofCriticalShellSystem Hcritical ...
```

so the caller has the stronger fact definitionally.  The leaf theorem then
forgets it by passing `Hdepth5Rows` and `Nonempty Hcritical` as independent
arguments.  The exact missing interface hypothesis can be stated in the first
form below; the second, stronger form retains provenance for all five rows:

```text
rows.uRow = CriticalRowPacket.ofCriticalShellSystem Hsys huA
```

or

```text
rows = CriticalSourceRows.ofCriticalShellSystem
  Hsys hqA ht1A ht2A ht3A huA.
```

**PROVEN scope statement:** adding this equality would allow facts about the
chosen system row to be transported to `rows.uRow`; it would not by itself
prove either cap-multiplicity field.

## 2. Field one: a common cap for `p` and `c`

### 2.1 What cap coverage actually says

In the closed-cap convention, a non-Moser carrier point lies in exactly one
cap interior and each Moser vertex lies in exactly two caps.  Thus two
arbitrary carrier points need not share a cap: two non-Moser points in
different open cap blocks do not.

The current hypotheses prove only `p in A` and `c in A`; they do not identify
either point with a Moser vertex or put them in the same cyclic block.  The
dangerous circle around `p` and the exact `u`-row circle around `c` likewise do
not impose a cap label on their centers.

### 2.2 `hNoM44` and cardinality do not align the centers

**PROVEN, source-audited.** The usable no-M44 theorem is
`exists_secondLargeCap_of_noM44`.  It produces an index `j != i` with
`5 <= |cap[j]|`.  Together with `hcard` and the cap-sum identity, it restricts
the cap-size profile.  Its conclusion contains neither `p`, `c`, `uRow`, nor
any center/source incidence.

Therefore the current no-M44/cardinality library does not prove

```text
exists k, p in cap[k] and c in cap[k].
```

This is a statement about the current theorem bank, not a formal independence
result from all full hypotheses.  Any future derivation using `hNoM44` must
add a new theorem coupling the two-large-cap profile to blocker-center
placement; the size theorem alone cannot do it.

The stronger cap-containment results found in the bank do not apply:

- `selectedClass_subset_capByIndex_of_endpointRadius` is centered at the
  *opposite Moser apex* and requires both cap endpoints to have the queried
  radius;
- the U2 full-distance-class and non-surplus containment packages assume
  `IsM44`, while this lane assumes that no `IsM44` packet exists; and
- `selectedFourClass_inter_capByIndex_card_le_two` applies to an arbitrary
  row center in a cap, but is only an upper bound after the cap membership has
  already been supplied.

No live hypothesis identifies `c` with an opposite Moser apex or supplies the
two endpoint-radius equalities.

### 2.3 Exact finite-shadow obstruction

**EMPIRICALLY VERIFIED, exact in the encoded incidence/cyclic abstraction.**
The saved `(5,5,5)` Q-C witness has

```text
p = 0,       caps(p) = {O1,O2},
c = 4,       caps(c) = {S},
B = {1,2,3,4},
R = {1,5,6,8}.
```

It contains no common cap for `p` and `c`.  The witness also carries one exact
row at every center, one source-indexed critical-system row at every source,
the five supplied rows, blocker-fiber constraints, the card-12 cap profile,
and Q-C negation.  It omits Euclidean coordinates, full strict-cap geometry,
MEC inequalities, and the unencoded live fields, so it is not a counterexample
to the full theorem.

**Verdict for field one:** **CONJECTURED** under the complete K-A-PAIR
hypotheses, but unsupported by current cap geometry.  The exact new hypothesis
or lemma needed is a center-placement statement, for example

```text
URowCommonCap : exists k, p in cap[k] and c in cap[k].
```

It cannot be replaced by a cap-size profile.

## 3. Field two: two dangerous `u`-row points outside the common cap

Assume a cap `C` containing both `p` and `c` has somehow been found.

### 3.1 Why the two complement bounds do not meet

The ordered-cap theorem gives

```text
|B intersect C| <= 2,     so |B minus C| >= 2,
|R intersect C| <= 2,     so |R minus C| >= 2.
```

The target is the much stronger cross-intersection

```text
2 <= |R intersect (B minus C)|.
```

Let `U = A minus C`.  Inclusion-exclusion gives only

```text
|(R minus C) intersect (B minus C)|
  >= |R minus C| + |B minus C| - |U|.
```

Every circumscribed cap has the other two closed caps of size at least four,
so the relevant cap complements have ample capacity.  On the card-12 profiles
the complement sizes are `6`, `7`, or `8`; the lower bound obtained from
`2 + 2` is therefore nonpositive.  Even the endpoint improvement to three
outside points does not uniformly force a two-point intersection.  The global
ordered-cap pair count has the same slack: the proved total lower is `27`,
while the summed pair capacities are `63` and `64` on the two card-12
profiles.

There is a second structural warning.  `SelectedFourClass.inter_card_le_two`
already proves

```text
|R intersect B| <= 2
```

because `c != p`.  Hence the requested field forces

```text
|R intersect B| = 2.
```

In geometric language, the exact circles centered at `p` and `c` must realize
both of their possible carrier intersection points, and both intersections
must lie outside the common cap.  This is maximal circle overlap, not a mild
consequence of having two independent exact four-point rows.

### 3.2 Exact finite-shadow obstruction

**EMPIRICALLY VERIFIED, exact in the encoded incidence/cyclic abstraction.**
The saved `(4,5,6)` witness isolates the second failure:

```text
p = 0,       caps(p) = {O1,O2},
c = 1,       caps(c) = {O2,S},
common cap = O2,
B = {1,3,4,5},
R = {0,2,5,6},
B minus O2 = {3,4,5},
R intersect (B minus O2) = {5}.
```

Thus the common-cap field holds but the required multiplicity is one, not two.
The same fail-closed limitations as in section 2.3 apply.

### 3.3 Exact local Euclidean obstruction

**PROVEN as an elementary seven-point Euclidean construction.**  Put

```text
a = sqrt(3)/2,   d = 1-a,
P = (0,0),       C = (1,0),
X = (1/2,a),
A+ = (a,1/2),    A- = (a,-1/2),
U+ = (d,1/2),    U- = (d,-1/2).
```

Take

```text
B = {C,X,A+,A-},
R = {P,X,U+,U-}.
```

Every point of `B` is at distance one from `P`, and every point of `R` is at
distance one from `C`.  The other two points have squared distance
`2-sqrt(3) != 1` from the opposite center, so these are exact radius classes
inside the seven-point set.  Moreover

```text
B intersect R = {X}.
```

The cyclic order

```text
P, U-, A-, C, A+, X, U+
```

has strictly positive consecutive turns, so the seven points are in strict
convex position.  Taking `u = U+` gives `u in R`, `u notin B`, and
`dist P u != 1`.  Set `q = C` and assign `t1,t2,t3` to `X,A+,A-`; these three
points are noncollinear.  This supplies the local dangerous exact-radius data,
and after deleting `q`, only three points of `B` remain on the `P`-circle.

This gadget does **not** satisfy the global `CounterexampleData.K4` property,
the card bound, a full critical-shell system, or the two-large-cap/MEC packet.
It is therefore not a live counterexample.  It proves the narrower and useful
obstruction: strict convexity, exact full filters, source membership,
off-dangerous selection, and the two local circles do not force two common
support points.  Any successful proof must visibly use omitted global
information.

**Verdict for field two:** **CONJECTURED** under the complete K-A-PAIR
hypotheses.  The smallest currently checked sufficient addition is

```text
R minus B subset C,
```

namely `URowCommonCapOffDangerousConfinement`.  More minimally, one can assume
the desired two-point overlap directly.  No banked full-filter theorem
produces either statement for an arbitrary carrier center `c`.

## 4. Conditional proof sketch with the exact missing hypotheses

There is a complete proof once the real missing data are stated explicitly.
This is the honest proof sketch; every step except production of the two new
fields is already represented by checked Lean declarations.

1. Retain `Hsys` and identify `rows.uRow` with the row selected by `Hsys` at
   source `u`.
2. Produce a cap `C = cap[k]` containing both `p` and `c`.
3. Prove the confinement `R minus B subset C`.
4. Since `c in C`, ordered-cap one-sided injectivity gives
   `2 <= |R minus C|`.
5. Confinement says every point of `R` outside `C` must belong to `B`; hence
   `R minus C` injects into `R intersect (B minus C)`, giving the required
   cardinality at least two.
6. The dangerous exact row gives equality of distances from `p` to those two
   points; the `u` row gives equality from `c`.
7. Since `p` and `c` are distinct centers in the same strict ordered cap and
   both points lie outside it, `outsidePair_unique_capCenter` gives `False`.

Steps 4--7 are **PROVEN**.  Steps 2--3 are exactly the open geometric content.
Step 1 is available at the outer caller but missing from the current theorem
signature.

## 5. Precise falsification specification

Before investing in a Lean proof of the fixed-`uRow` statement, run two
separate target-faithful searches rather than one combined Q-C query.

### Query C1: common-cap placement

Seek a model of the complete K-A-PAIR antecedents with

```text
forall k, p in cap[k] -> c notin cap[k].
```

### Query C2: dangerous overlap conditional on a common cap

Seek a model of the complete antecedents with at least one common cap and

```text
forall k,
  p in cap[k] and c in cap[k] ->
  |R intersect (B minus cap[k])| <= 1.
```

For either query, target-faithful means all of the following are checked:

- exact real coordinates and strict cyclic convexity;
- the normalized circumscribed MEC, non-obtuse triangle, and signed-area cap
  membership, not only a fixed cyclic word;
- the full global K4 property;
- exact radius-class disequalities for every critical row used;
- a source-indexed `CriticalShellSystem`, including the deletion no-qfree
  condition, not only a blocker map;
- the complete fixed-triple, localized no-qfree, and live selected-candidate
  fields;
- the two-large-cap hypotheses and the actual no-`IsM44` condition, not only
  a selected cap-size profile; and
- either (a) the theorem's current independent `rows`/`hcritical` signature or
  (b) the stronger caller-faithful equality tying `rows` to the same system.

The distinction between (a) and (b) is diagnostic.  A model of (a) but not
(b) identifies interface overgeneralization; a model of (b) falsifies the
fixed-`uRow` producer at the actual caller.  An incidence SAT witness, a
nonunit equality ideal, or failure of numerical optimization is not a verdict.

## 6. Circularity and fidelity checks

Any attempted proof must satisfy all of these.

1. Do not use `outsidePair_unique_capCenter`,
   `DangerousRowSameCapSecondCenter.false`, `oppCap2_escape_gen`, or K-A-PAIR
   itself to produce either field.  They are consumers.
2. Do not identify `rows.uRow` with a row of an arbitrary witness of
   `hcritical` without the explicit provenance equality from section 1.1.
3. Do not use an `IsM44` containment theorem under `hNoM44`; the assumptions
   point in opposite directions.
4. Do not turn `exists_secondLargeCap_of_noM44` into point placement.  It is a
   cardinality theorem only.
5. Do not infer a lower bound on `|R intersect B|` from the two independent
   lower bounds on `|R minus C|` and `|B minus C|`.
6. Do not replace exact full-radius-class disequalities with a selected
   four-subset, and do not promote the finite shadows to Euclidean models.
7. If a proof is stated only for `12 <= |A|`, keep the separate card-11
   consumer and live split explicit.

## 7. Ranked next actions

1. **PROVEN interface prerequisite:** retain common-system provenance at the
   K-A leaf.  Thread `Hsys` and the equality
   `rows = CriticalSourceRows.ofCriticalShellSystem Hsys ...`, or state the
   producer directly for `Hsys.selectedAt`.  Without this, `hcritical` cannot
   constrain the fixed `uRow`.
2. **Highest-value falsification:** run the C1 and C2 target-faithful queries
   separately.  The existing `(5,5,5)` and `(4,5,6)` shadows already isolate
   the respective failures, so a combined search obscures which geometric
   ingredient is active.
3. **Preferred theorem shape:** search for a source-flexible system row,
   `exists source k, ...`, rather than insisting on source `u`.  The consumer
   needs one second center and one dangerous outside pair; it does not care
   which deletion source produced the row.
4. **Only after C1:** investigate `R minus B subset C` or a weaker two-hit
   lemma using full blocker provenance and cap order.  No-M44/cardinality alone
   should not be revisited for this purpose.
5. **Pivot condition:** if a caller-faithful exact model satisfies C1 or C2
   negation, retire `URowCapMultiplicityFields` as the primary route and move
   to `HasGlobalNestedPairProducer` or the compact selected-K4 producer.  Do
   not repair the fixed-row claim with ad hoc placement assumptions.

## Final assessment

**PROVEN:** current geometry reaches the separate cap witnesses and separate
outside-cardinality bounds, and the conditional same-cap contradiction is
complete.

**CONJECTURED:** neither common-cap placement nor maximal dangerous overlap is
forced by the complete K-A hypotheses.  No-M44 and cardinality do not supply
the missing alignment.

**HEURISTIC:** the fixed `uRow` formulation is probably narrower than the
natural global theorem.  The most credible continuation is to preserve the
actual common `Hcritical` provenance and seek *some* source-indexed shell with
the required cap/overlap fields.  The existing evidence does not justify
claiming that the supplied `u` row itself must be that shell.
