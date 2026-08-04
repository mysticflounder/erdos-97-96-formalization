# Tri-apex uniform geometric obstruction analysis

Date: 2026-07-25.

Scope: the exact live package indexed by
`FrontierAllLargeCapsTriApexRobustResidual`, namely
`(F, R, B, L, N, T)`, together with the pointwise unique-four cover now
produced from `R.minimal` and the three strict-cap metric patterns produced
from `T` for
`false_of_frontierAllLargeCapsTriApexUniformMetricResidual`.

No Lean source was edited and no Lean/Lake build was run for this audit.

## Verdict

**CONJECTURED, not proved:** I did not find a noncircular uniform contradiction
from the exact package. The new uniform-metric leaf remains a genuine
mathematical obligation. Exposing minimality's pointwise unique-four cover and
converting each rich apex to an `OppositeCapRichClassInteriorPattern` are the
right witness-preserving refinements, but the missing incompatibility between
those data is still unproved.

**PROVEN logical boundary:** a genuine planar model of the *full* Lean package
would contain

```lean
D : CounterexampleData
```

and therefore a nonempty convex-independent finite planar set satisfying
`HasNEquidistantProperty 4`. With `R.minimal`, it would moreover be a minimal
such set. Producing that model would produce an Erdős-97 counterexample, not
merely show that an interface is weak. No such model is supplied here. It
would be epistemically wrong to call a model omitting `D.K4`, `R.minimal`, or
`H` a compatible model of `(F,R,B,L,N,T)`.

**PROVEN construction, with an EMPIRICALLY VERIFIED exact symbolic census:**
there is a concrete 15-point planar
Reuleaux-boundary configuration satisfying all of the following:

- all three cap sizes are exactly six;
- all three apices have a six-point radius class and are fully
  deletion-robust;
- all three newly exposed strict-cap metric patterns hold in their first arm;
- the apex-triple exclusion holds;
- the numerical non-robust-cover inequality is compatible;
- the same-radius off-surplus pair, both double-deletion witnesses, and the
  two-center q-deleted row geometry retained by `R.common` all have literal
  planar realizations; and
- the MEC has exactly three boundary carrier points and every possible packet has cap multiset
  `(6,6,6)`, so the geometric analogue of `R.noM44` holds.

The same configuration has no exact four-point radius class at any carrier
center and fails global K4 at twelve of its fifteen points. Consequently it
has no `CriticalShellSystem` and cannot satisfy minimality's pointwise
exact-four cover. This is a model of the **K4-erased local planar-metric
projection specified above**, not of the exact Lean package.

The consequence is decisive for route selection:

> Any uniform closure must materially consume global K4 together with
> minimality/critical-shell cover data. Cap sizes, three rich apices, the
> strict-cap metric patterns, rotations, and the original two-row frontier
> geometry do not by themselves form a planar obstruction.

The least discriminator that excludes the local model is not a new
hypothesis. It is the pointwise theorem
`exists_isUniqueFourCenter_of_minimal R.minimal`. The field
`T.notRobustCover_card` is only its union-bound shadow and loses the covering
center, radius, exact support, and membership witness. During this audit that
pointwise theorem was promoted into the live uniform-metric leaf. This is the
least correct upstream interface repair; it is not itself closure. A viable
proof must now couple the exposed cover, or the still stronger named shell map
already present in `H`, to the frontier geometry rather than add another
bounded amount of apex richness.

## Epistemic labels used here

- **PROVEN**: follows from the checked source declarations cited below or from
  the elementary paper argument given here.
- **EMPIRICALLY VERIFIED**: checked by exact symbolic enumeration over
  `Q(√3)`, but not replayed in Lean.
- **CONJECTURED**: a precise possible next theorem with no proof or exhaustive
  validation.
- **HEURISTIC**: route-ranking judgment only.

## Source anchors inspected

The census below was taken from the live 2026-07-25 worktree:

- `P97/U1TwoShortCapReduction.lean`: `CounterexampleData`;
- `P97/U1CarrierInjection.lean`: `CriticalShellSystem`;
- `P97/Cap/PartitionFromMEC.lean`: `SurplusCapPacket`;
- `P97/ATail/CriticalPairFrontier.lean`: `CriticalPairFrontier`;
- `P97/ATail/OrientedPhysicalApexIngress.lean`:
  `FrontierCommonDeletionResidual` and
  `FrontierCommonDeletionParentResidual`;
- `P97/ATail/CommonDeletionTwoCenter.lean`:
  `CommonDeletionTwoCenterPacket`;
- `P97/ATail/PhysicalSecondApexCommonDeletion.lean`:
  `FrontierBiApexRobustResidual`;
- `P97/ATail/LargeOppositeCapsBiApexSurface.lean`:
  `FrontierLargeOppositeCapsBiApexRobustResidual`;
- `P97/ATail/FrontierLiveClosure.lean`: the two all-large residuals and the
  current uniform-metric leaf;
- `P97/ATail/ApexRichClassStructure.lean`: the strict-cap metric pattern; and
- `P97/ATail/MinimalUniqueFourCover.lean`: the pointwise cover theorem.

All paths above are relative to `lean/Erdos9796Proof/`.

## Exact package census

The terminal does not receive merely the five fields of `T`.

### `D`, `S`, and `H`

`D : CounterexampleData` retains:

- `D.A.Nonempty`;
- `ConvexIndep D.A`;
- global `D.K4 : HasNEquidistantProperty 4 D.A`; and
- a `SurplusCapPacket D.A`.

The packet contains an MEC-promoted non-obtuse circumscribed Moser triangle,
the closed-cap partition, and the designated cap of size greater than four.

`H : CriticalShellSystem D.A` chooses, for every source `q ∈ D.A`, a blocker
center and an exact full four-point radius shell containing `q`; deleting `q`
destroys every K4 witness at that chosen center. This is global, source-indexed
data, not an anonymous row-existence statement.

### `F`

`F : CriticalPairFrontier D S radius H` retains two distinct sources `q,w`
which:

- lie on one common positive-radius class about `S.oppApex1`;
- lie outside the surplus cap;
- individually preserve K4 at `S.oppApex2`;
- have blockers different from `S.oppApex2`;
- satisfy the first-apex split;
- preserve K4 at `S.oppApex2` after simultaneous deletion; and
- satisfy the independent second-apex split.

### `R`

`R : FrontierCommonDeletionParentResidual F` retains:

- `R.minimal : D.Minimal`;
- `R.noM44 : ¬ ∃ T : SurplusCapPacket D.A, T.IsM44`;
- `9 < D.A.card`;
- at least four points on the frontier radius at the first apex;
- first-apex K4 after deleting both `q,w`; and
- a `CommonDeletionTwoCenterPacket` for the deleted source `q` at the two
  physical opposite apices.

The common packet contains two distinct centers, q-deleted K4 rows `B₁,B₂`,
each of cardinality four, blocker avoidance at both centers, and
`|(B₁ ∩ B₂)| ≤ 2`.

### `B`, `L`, `N`, and `T`

`B` adds deletion robustness at the second opposite apex; first-apex
robustness follows from `R`.

`L` gives both opposite cap sizes at least six.

`N` gives the surplus cap size at least six. The cap-sum identity therefore
gives only

```text
15 ≤ |D.A|,
```

with no upper bound.

`T` gives:

- rich class structure at all three Moser apices;
- `|D.A| ≤ 4 |notRobustCenters D|`; and
- exclusion of a carrier center whose one positive-radius class contains all
  three apices.

The first rich field is already derivable from `R`; the other two are obtained
from packet rotations. The cardinal field is derivable from `R.minimal`, and
the apex-triple exclusion is packet geometry plus convex independence.

### Live uniform-metric promotion

During this audit the live worktree promoted the `sorry` to
`false_of_frontierAllLargeCapsTriApexUniformMetricResidual`. It additionally
receives

```lean
(hpointwiseUniqueFourCover :
  ∀ x ∈ D.A, ∃ p : ℝ², ∃ r : ℝ,
    p ≠ x ∧ IsUniqueFourCenter D.A p ∧
    0 < r ∧ (SelectedClass D.A p r).card = 4 ∧
    x ∈ SelectedClass D.A p r)
(hfirst   : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
(hsecond  : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
(hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx)
```

The live caller supplies the cover from
`exists_isUniqueFourCenter_of_minimal R.minimal` and supplies each metric
pattern from the corresponding rich field. The metric pattern's alternatives
are:

1. four strict-cap points on one apex-centered circle; or
2. two strict-cap points on each of two distinct apex-centered circles.

These are useful witnesses, but they add no assumption beyond `T`. The
explicit model below satisfies the first alternative at every apex, so these
three metric fields alone cannot be the missing obstruction. The pointwise
cover is exactly where that model fails. The concurrent source wiring was not
rebuilt in this audit; this paragraph records current source structure, not a
fresh clean-build claim.

## A concrete K4-erased planar model

### Exact coordinates

Let

```text
a₀ = (0, √3/2),    a₁ = (-1/2, 0),    a₂ = (1/2, 0),
g  = (0, √3/6).
```

The `aᵢ` form an equilateral triangle of side one and centroid/circumcenter
`g`. Let `R` be rotation through `2π/3` about `g`, chosen so that
`R(a₀)=a₁`.

For

```text
t ∈ {-5, -4, 4, 5}
```

put

```text
x_t = a₀ + ( 2t/(1+t²), (1-t²)/(1+t²) ).
```

The offset has norm one. These four points lie in the interior of the minor
unit-circle arc centered at `a₀` and joining `a₁` to `a₂`. Define

```text
A = {a₀,a₁,a₂} ∪ {R^j(x_t) | j ∈ {0,1,2}, t ∈ {-5,-4,4,5}}.
```

Thus `|A|=15`, with four selected interior points on each boundary arc of the
Reuleaux triangle

```text
W = closedBall(a₀,1) ∩ closedBall(a₁,1) ∩ closedBall(a₂,1).
```

### Convex independence, MEC, and caps

**PROVEN.** The intersection `W` is strictly convex: an open segment between
two distinct points of `W` lies in the interior of each unit disk and hence in
the interior of their intersection. Every selected point lies on `∂W`, so
every selected point is extreme. Therefore `A` is convex independent.

For a point `a₀+u` on the arc centered at `a₀`, with `|u|=1`, one has

```text
|a₀ + u - g|² = 4/3 + (2/√3) u_y.
```

On the relevant minor arc,

```text
-1 ≤ u_y ≤ -√3/2,
```

so the squared distance to `g` is at most `1/3`, with equality only at the two
endpoints `a₁,a₂`. Rotating gives the same statement on the other arcs.
Consequently the circle centered at `g` with radius `1/√3` is the MEC of `A`,
and its only carrier points are `a₀,a₁,a₂`: the displayed calculation gives
containment, while for every proposed center `c`,

```text
Σᵢ |c-aᵢ|² = 3|c-g|² + 1,
```

so at least one apex has squared distance at least `1/3`. Thus the equilateral
triple itself has minimum enclosing radius `1/√3`.

Every circumscribed MEC Moser triangle therefore uses precisely these three
vertices, up to permutation. The cap opposite `aᵢ` consists of the other two
vertices plus the four interior points on the unit arc centered at `aᵢ`.
Hence every cap has cardinality six. In particular every possible surplus
packet has cap multiset `(6,6,6)` and cannot be `IsM44`.

### Richness and the strict-cap patterns

**PROVEN.** For each `i`, the exact radius-one class at center `aᵢ` is

```text
{a_j, a_k} ∪ {four interior points on the arc centered at aᵢ},
```

where `{i,j,k}={0,1,2}`. It has cardinality six. Points on either other
interior arc lie strictly inside `closedBall(aᵢ,1)`, so there are no additional
radius-one points.

It follows immediately that:

- every apex has `ApexRichClassStructure` in the six-point arm;
- deleting any one carrier point leaves at least five of these six points, so
  every apex is fully deletion-robust; and
- the intersection of the radius-one class with the strict interior of its
  opposite cap has exactly the four selected arc-interior points.

Thus all three `OppositeCapRichClassInteriorPattern` hypotheses hold in their
first arm.

### Literal `q,w` and two-row frontier geometry

Designate the cap opposite `a₀` as surplus, so the two physical opposite
apices can be named `a₁,a₂`. Let

```text
q = R(x_{-5}),    w = R(x_{-4}).
```

Both are distinct interior points of the unit arc centered at `a₁`. Therefore:

- `q,w ∈ A \ surplusCap`;
- `dist a₁ q = dist a₁ w = 1`;
- deleting both leaves exactly four points on the radius-one class at `a₁`;
- neither point belongs to the radius-one class at `a₂`, so deleting either or
  both leaves all six points of that class; and
- the first- and second-apex splits can both take their K4-survival arms.

After deleting `q`, the radius-one class at `a₁` has five points, so choose any
four as `B₁`. The radius-one class at `a₂` still has six points, so choose any
four as `B₂`. The two unit circles centered at `a₁,a₂` meet in two points, but
only `a₀` of those two points belongs to `A`. Hence these rows can be chosen
with

```text
|(B₁ ∩ B₂)| ≤ 1,
```

which is stronger than the common packet's required bound.

This realizes the physical pair, both double-deletion witnesses, and both
q-deleted row supports in the genuine Euclidean plane. It does **not** realize
the `H`-indexed blocker fields.

### Cover shadow and apex-triple exclusion

**PROVEN.** Any point equidistant from the three noncollinear apices is their
circumcenter `g`. Since `g ∉ A`, no carrier center has one radius class
containing all three apices.

**EMPIRICALLY VERIFIED exactly over `Q(√3)`.** The three apices have maximum
equal-distance multiplicity six. Every one of the twelve arc-interior centers
has maximum equal-distance multiplicity two. Therefore the three apices are
deletion-robust and the other twelve points are not, giving the compatible
numerical shadow

```text
15 ≤ 4 · 12.
```

This demonstrates why `T.notRobustCover_card` is too lossy: its inequality can
hold even when there is no exact-four covering class at any carrier center.

### Exact symbolic enumeration

The coordinates above lie in `Q(√3)`. Exact SymPy simplification of every
squared distance gave:

```text
points                 15 distinct points
MEC boundary indices   [0, 1, 2]
cap 0                  [1, 2, 3, 4, 5, 6]
cap 1                  [0, 2, 7, 8, 9, 10]
cap 2                  [0, 1, 11, 12, 13, 14]
unit classes           exactly the same three six-element lists
max multiplicities     [6, 6, 6, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2]
exact-four carrier centers []
```

This finite algebraic check is classified **EMPIRICALLY VERIFIED**, not
kernel-proved.

### Exact failure boundary

The construction fails precisely where a real proof now has to work:

1. `D.K4` fails at all twelve arc-interior centers.
2. There is no exact four-point radius class at any carrier center.
3. Therefore no `CriticalSelectedFourClass` exists and no
   `CriticalShellSystem A` can be constructed.
4. There is no pointwise unique-four cover, so the positive content of
   `R.minimal` is absent.

This is why it is not a compatible model of the exact package. It is also why
the local cap/radius/frontier projection is not enough.

## The least derived discriminator and the repair already made

The target already receives the following proved theorem through `R.minimal`:

```lean
theorem exists_isUniqueFourCenter_of_minimal
    {D : CounterexampleData} (hmin : D.Minimal)
    {x : ℝ²} (hx : x ∈ D.A) :
    ∃ p : ℝ², ∃ r : ℝ,
      p ≠ x ∧ IsUniqueFourCenter D.A p ∧
      0 < r ∧
      (SelectedClass D.A p r).card = 4 ∧
      x ∈ SelectedClass D.A p r
```

Thus the terminal may safely start with:

```lean
have hcover :
    ∀ x : ℝ², x ∈ D.A →
      ∃ p : ℝ², ∃ r : ℝ,
        p ≠ x ∧ IsUniqueFourCenter D.A p ∧
        0 < r ∧
        (SelectedClass D.A p r).card = 4 ∧
        x ∈ SelectedClass D.A p r :=
  fun x hx => exists_isUniqueFourCenter_of_minimal R.minimal hx
```

This is the least already-derived fact that excludes the Reuleaux model. It
retains strictly more useful information than

```lean
D.A.card ≤ 4 * (notRobustCenters D).card.
```

The still stronger source-faithful form is already in `H`:

```lean
H.shellAt q hq
H.no_qfree q hq
```

These give a named exact shell through every source and certify that its
chosen center is a genuine blocker.

No new residual field is mathematically required to recover these facts. The
current uniform-metric leaf now takes the pointwise cover explicitly, with its
caller deriving it from `R.minimal`; adding it to `T` as a stored field would
be redundant. This is the least upstream repair supported by the obstruction
analysis. The remaining proof obligation is to combine that cover with the
tri-apex/frontier geometry.

## What the elementary two-circle bound does, and does not, give

The imported theorem
`SelectedFourClass.inter_card_le_two` says that selected classes at two
distinct centers overlap in at most two points.

Consequently, if a six-point apex circle is covered by exact-four classes at
other centers, at least three distinct unique-four centers are required. A
formalizable local statement has the following shape:

```lean
theorem six_class_requires_three_uniqueFour_centers
    {A : Finset ℝ²} {a : ℝ²} {r : ℝ}
    (hr : 0 < r)
    (hsix : 6 ≤ (SelectedClass A a r).card)
    (U : Finset ℝ²)
    (hU : ∀ p ∈ U, IsUniqueFourCenter A p)
    (ha : ∀ p ∈ U, p ≠ a)
    (hcover :
      SelectedClass A a r ⊆
        U.biUnion (fun p => uniqueFourClass A p)) :
    3 ≤ U.card
```

Likewise, the two-radius rich arm forces only two covering centers by this
argument: one exact-four circle can meet each of the two apex circles in two
points. Across three apices these are still bounded demands. They do not
contradict a carrier of unbounded cardinality.

This explains both facts at once:

- exposing the radii is better than collapsing them to cap cardinalities; but
- pairwise circle-intersection counting alone cannot provide uniform closure.

## The actual missing bridge

The clean decomposition is:

1. **PROVEN producer:** minimality covers every carrier source by a
   unique-four class.
2. **CONJECTURED geometric anti-cover:** the all-large tri-apex frontier data
   prevent those unique-four classes from covering the whole carrier.
3. Combine the two statements to obtain `False`.

A precise direct target is:

```lean
theorem exists_source_outside_uniqueFour_cover
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (N : FrontierAllLargeCapsBiApexRobustResidual L)
    (T : FrontierAllLargeCapsTriApexRobustResidual N)
    (hfirst : OppositeCapRichClassInteriorPattern D.A S S.oppIndex1)
    (hsecond : OppositeCapRichClassInteriorPattern D.A S S.oppIndex2)
    (hsurplus : OppositeCapRichClassInteriorPattern D.A S S.surplusIdx) :
    ∃ x ∈ D.A, ∀ p ∈ D.A,
      IsUniqueFourCenter D.A p →
      x ∉ uniqueFourClass D.A p
```

As written this is almost equivalent to the live terminal because `R` still
contains `minimal`. It counts as a useful decomposition only if its proof does
not use `R.minimal`. For an enforced noncircular interface, split off a
geometric parent containing `R.noM44`, the cardinal lower bound, the frontier
radius, and `R.common`, but not `R.minimal`, and prove the anti-cover theorem
from that surface plus global K4/H and the metric patterns.

The stronger purely cardinal sufficient condition

```lean
4 * (D.A.filter fun p => IsUniqueFourCenter D.A p).card < D.A.card
```

would also close against the proved cover bound. It is **CONJECTURED** and is
probably too strong to be the first target: it asks for more than one uncovered
source, while a source-specific blocker contradiction would suffice.

## Circularity audit

1. It is circular to use
   `false_of_frontierAllLargeCapsTriApexRobustResidual`, the new uniform metric
   leaf, or any caller downstream of them to prove the uniform metric leaf.
2. Packet rotation alone is not a contradiction. The three strict-cap
   patterns are consequences of `T`, and the Reuleaux construction satisfies
   all three.
3. The fresh rotated frontiers and common-deletion parents used by the caller
   contain more data than the rich propositions eventually retained. Threading
   those witnesses forward would be noncircular relative to the tri-apex leaf,
   but their dispatch currently also relies on the separate open
   `false_of_originalFrontierUniqueRadiusArm` route. They must not be described
   as a closed producer while those sibling leaves remain open.
4. The Reuleaux construction is not a counterexample and not a model of
   `D`, `H`, or `R.minimal`.
5. The exact symbolic enumeration is theorem-discovery evidence, not a Lean
   proof.
6. A fixed-cardinality SAT/SMT result, an abstract distance model, or an LRA
   UNSAT subcase is not a uniform planar proof unless the encoding includes
   Euclidean realizability, MEC/cap data, global K4, minimality, `H`, and all
   frontier fields and is then lifted to every cardinality.

## Ranked “what next”

### 1. Consume `H` and the pointwise cover on a named finite source set

**HEURISTIC, highest leverage.** Start with the sources already named by the
package:

```text
F.pair.q, F.pair.w,
the three apex-rich strict-cap witness sets,
and the exact supports selected by H at those sources.
```

For each source, expose its chosen blocker and exact shell. Search for one
source whose shell is incompatible with the original two-center rows and the
three apex-circle patterns. This is source-specific, uniform in `|A|`, and
uses the precise datum absent from the Reuleaux model.

The desired endpoint is one explicit uncovered source, not another lower bound
on the number of rich apices.

### 2. Retain the fresh rotated frontier witnesses

**HEURISTIC.** The two rotations currently keep only the conclusions
`oppApex2_rich` and `surplusApex_rich`. They existentially discard fresh
sources, radii, double-deletion witnesses, and common two-center rows.

If the original frontier plus one or both rotated frontiers create competing
two-circle/order constraints, package those witnesses in a stronger residual
and prove a cross-packet incompatibility. Audit the dependency on the open
unique-radius sibling leaves explicitly.

### 3. Test the anti-cover statement before promoting it

**HEURISTIC.** Extend the existing finite search at the least profile
`(6,6,6)` to include:

- global K4 at every center;
- the pointwise unique-four cover or the full `H` blocker map;
- exact row membership, not selected subsets only;
- `R.noM44`;
- the original `q,w` and both common rows; and
- the three strict-cap metric patterns.

A SAT result is only a model of that encoding; an UNSAT result is only
theorem-discovery evidence until checked and lifted uniformly. The purpose is
to learn which cross-incidence lemma to prove, not to relabel the terminal
closed.

### 4. Do not spend the next cycle on bounded richness or cap arithmetic

**PROVEN negative scope.** The Reuleaux model already realizes:

- profile `(6,6,6)`;
- all three six-point rich arms;
- all three four-point strict-cap patterns;
- the physical `q,w` double-deletion rows; and
- the sharp two-circle intersection behavior.

Rotating these facts or adding any fixed number of further distinguished rich
centers supplies only bounded information while `|A|` is unbounded. A viable
cardinality route would need a carrier-scale estimate such as a strict
anti-cover inequality, not another constant harvest.

### 5. The finite equality shadow does not force concentration

**EMPIRICALLY VERIFIED finite obstruction; no planar/MEC claim.** The checker
at `scratch/triapex-incidence-obstruction/check_model.py` gives a 15-vertex
distance-equality/incidence model with:

- three disjoint four-point strict caps and three six-point rich classes;
- twelve four-point critical shells covering all vertices through a blocker
  map whose fibers have size at most two;
- shell--shell and shell--rich-class intersections of size at most two;
- no shell containing all three distinguished apices; and
- no proper nonempty carrier retaining the per-center K4 equality property.

The checker closes the prescribed distance equalities transitively, including
the shared apex--apex edges; checks that the resulting apex classes are still
exactly the prescribed six-point classes; and then exhaustively checks all
proper subcarriers. Thus the existing cover/fiber/intersection/minimality
shadow alone does not imply a shell meeting one strict opposite rich cap in
three points.
Any proof of that concentration must use information omitted from this model,
such as planar Euclidean realizability together with the MEC/cap/frontier
geometry. The model is realizable as an abstract equality pattern in high
dimension; it is not asserted to satisfy the full Lean residual or to embed in
the plane.

### 6. The first usable planar refinement is a two-hit localization

**PROVEN at the existing first-apex interface; not yet a concentration
producer.** If one canonical critical shell contains two distinct points of
one first-apex radius class inside the strict first opposite cap, then its
blocker center lies in that same strict cap.  The proof is the existing
`FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior`: richness
separates the blocker from the apex, and ordered-cap outside-pair uniqueness
excludes every other cap.

This sharpens the remaining low-intersection case but does not close it.  No
current theorem puts two selected members of a rich pattern into one named
`H.selectedAt` shell.  Thus the next genuinely new statement is an
anti-matching/cross-incidence lemma for the canonical blocker assignment,
using the retained sources `F.pair.q`, `F.pair.w`, the three rich strict-cap
patterns, and the packet's ordered-cap/MEC data.

`CapSelectedRowCounting.orderedCap_outsidePairCount_sum_le` does not supply
that bridge directly.  It counts outside pairs in a `FaithfulCarrierPattern`
whose rows are indexed by their centers.  The live `CriticalShellSystem` is
indexed instead by deleted sources, and the residual contains no identification
between those two choices.  Even after choosing a faithful pattern from global
K4, the inequality neither produces a repeated canonical blocker nor attaches
a rich pair to one canonical shell.

## Final classification

- Uniform contradiction from exact `(F,R,B,L,N,T)`: **CONJECTURED / OPEN**.
- Genuine compatible model of the full package: **NOT PROVIDED**; providing
  one would give an Erdős-97 counterexample.
- Explicit planar model of the specified K4-erased local metric projection:
  **PROVEN construction with EMPIRICALLY VERIFIED exact distance census**.
- Sufficiency of the K4-erased geometric/cardinality projection of `T` plus
  the three strict-cap patterns, without minimality/H/global K4:
  **REFUTED by that local model**.
- Pointwise unique-four cover from `R.minimal`: **PROVEN and already
  available**.
- Promotion of the cover and the two-circle upper bound into the uniform
  metric closer: **TARGET-BUILD VERIFIED**. The remaining transitive
  obligation is the explicit on-spine concentration theorem
  `exists_criticalShell_oppositeCapClassInterior_card_ge_three_of_frontierAllLargeCapsTriApex`.
- Best next bridge: prove that concentration theorem from the planar
  MEC/cap/frontier fields of the exact residual, beginning with the
  anti-matching step isolated above: **CONJECTURED / OPEN**. The verified
  finite obstruction rules out presenting its counting/incidence shadow alone
  as sufficient.
