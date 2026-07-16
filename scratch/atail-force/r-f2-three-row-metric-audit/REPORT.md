# F2 three-row metric audit

## Outcome

The three-row metric core is **not contradictory by itself**.  An externally
exact algebraic model realizes the three circle rows, their `2-2` incidence
pattern, pairwise-distinct centers, and convex independence.

The source-faithful Lean packet nevertheless has a very small exact closure
boundary:

```lean
dist S.oppApex2 deleted = C.row₂.radius
```

This one scalar equality contradicts every F2 profile, before the
live-heavy/support-heavy/mixed strict-cell split.

The checked consumer is:

```lean
false_of_twoLiveExactCover_deleted_middle_radius_hit
```

No current theorem-bank declaration or sibling scratch result produces that
equality for the actual F2 second row.  The next useful producer search is
therefore a **source-indexed second-apex radius transport**, not another
anonymous three-row incidence census.

This lane does not close a production `sorry`.

## Scope and notation

The source object is the checked interface
`r-f2-three-row-chain/F2ThreeRowChain.lean`.  Write:

```text
L = {q,t1,t2,t3}
B = C.B₂
K = deletedCriticalSupport C

a = S.oppApex2
c = W.H.centerAt deleted C.q_mem_A.
```

The roles are retained exactly:

- `L` is the full critical shell centered at `p`;
- `B` is the selected q-deleted row centered at `a`; and
- `K` is the full critical shell at the actual deleted-source blocker `c`.

No row, source, blocker, or center is replaced by an anonymous audit object.

## Theorem-bank preflight

Before deriving the metric consequences, this lane checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- current `U5GlobalIncidenceBasic`, `U5GlobalIncidenceSupport`, and
  `U5GlobalIncidenceKernels`;
- the direct F2 U5 role audit in `r-f2-u5-bank-match`;
- the fixed-class/residual and terminal metric sibling audits; and
- focused `nthdegree docs search --lean` queries for a deleted-source
  second-row radius hit and for the three-common-point center-collapse
  kernel.

The direct bank match is:

```lean
Problem97.eq_of_equidistant_three_noncollinear
```

Two distinct centers cannot be equidistant from the same three
noncollinear ambient points.  Convex independence supplies noncollinearity
for any three distinct points of `D.A`.

The searches found no import-reachable producer of

```text
dist a deleted = C.row₂.radius.
```

## Guaranteed source-faithful facts

For named live-only witnesses `x,y` and support-only witnesses `s,t`, the
chain guarantees:

```text
x,y ∈ B ∩ L
x,y ∉ K
x,y ∈ strictSecondCap S
x,y ∈ {t1,t2,t3}

s,t ∈ B ∩ K
s,t ∉ L

x ≠ y
s ≠ t
every live/support cross-pair is distinct

p ≠ a
c ≠ p
c ≠ a.
```

It also retains:

```text
q ∈ S.surplusCap
p ∈ strictSecondCap S
deleted ∈ K
deleted ∉ L
deleted ∉ B
global K4 at every point of B ∩ strictSecondCap S
the exact q-deleted/q-critical split at each such strict point.
```

The guaranteed metric equalities are:

```text
dist p x = dist p y

dist a x = dist a y
dist a x = dist a s
dist a x = dist a t

dist c s = dist c t.
```

`named_metric_equalities` proves these equations directly from the retained
rows.

## Kernel-checked metric consequences

### Any third live-shell hit is impossible

`liveShell_third_point_off_middle_radius` proves:

```lean
z ∈ L →
x ≠ z →
y ≠ z →
dist a z ≠ C.row₂.radius.
```

Otherwise `x,y,z` are three distinct ambient points equidistant from both
`p` and `a`, forcing `p = a`.

### Any third deleted-shell hit is impossible

`deletedSupport_third_point_off_middle_radius` proves:

```lean
z ∈ K →
s ≠ z →
t ≠ z →
dist a z ≠ C.row₂.radius.
```

Otherwise `s,t,z` force `c = a`.

### The deleted source is canonically off the middle radius

The important strengthening is independent of the strict-cell split:

```lean
deleted_off_middle_radius_of_two_deletedSupport_hits
```

requires only two distinct points of `B ∩ K`.  Since every exact F2 profile
already proves

```text
card (B ∩ K) = 2,
```

`twoLiveExactCover_deleted_off_middle_radius` gives:

```lean
dist a deleted ≠ C.row₂.radius.
```

The contradiction consumer

```lean
false_of_twoLiveExactCover_deleted_middle_radius_hit
```

therefore closes **all three strict-cell arms** from the single opposite
equality.

This is the main structural conclusion of the audit: for this metric route,
the live-heavy/support-heavy/mixed split is downstream noise.  The right
mining object is the unsplit F2 packet plus source-indexed second-apex radius
provenance.

## Comparison across the three strict-cell arms

### Live-heavy

The two `B ∩ L` points are strict, so both outer/middle circle pairs are
visible.  The live shell saturates its current `oppCap2` two-hit bound.  The
metric audit adds that its other two points are necessarily off the middle
radius.

### Support-heavy

The two `B ∩ K` points are strict.  The support-heavy reduction places `c`
in strict `oppCap2` and proves:

```text
card (K ∩ S.oppCap2) = 2.
```

That is again saturation, not contradiction.  The branch-uniform deleted
radius theorem uses the same two common points but does not need their cap
placement.

### Mixed

Only one live-only and one support-only point are strict, so neither
same-cap two-point argument is available on its own.  Nevertheless
`card (B ∩ K) = 2` remains true, so the deleted-radius consumer is unchanged.

Thus no additional CEGAR split over strict-cell placement is needed for this
particular producer target.

## Bank and sibling comparison

| Candidate | Result |
|---|---|
| `eq_of_equidistant_three_noncollinear` | **Direct kernel match.** It is the only geometric incompatibility needed once a third hit is named. |
| `two_circle_third_point_eq` / common-bisector kernels | Same underlying geometry, but with extra endpoint or audit roles. The generic kernel is already sufficient. |
| Direct F2 q-critical pair bank | **Role deficit.** The checked pair has only one surviving common point and lacks the required center/triple incidences. |
| Same-cap outside-pair and cap-count kernels | They localize `p` or `c` and prove sharp two-hit saturation. They do not create a third radius hit. |
| Fixed-class/residual consumers | **Wrong circle.** Their fixed class is centered at `oppApex1`, whereas the missing equality is at `oppApex2`. |
| `AnchoredProvenanceF2NormalForm.second_row_on_retained_radius` | Records the radius of points already in the retained second row; it does not put `deleted` on that radius. |
| Coherent `secondApexRow` | It is selected after deleting `deleted` and explicitly omits it. Omission from a selected subset does not imply off-radius, but it also supplies no on-radius equality. |
| `GlobalSourceSelection` / `DeletedApexOmissionProducer` parent apex row | A related parent row contains its deleted endpoint and hence has radius `dist oppApex2 deleted`. It is a different source packet/row. The missing adapter is equality of that parent radius with the actual F2 `C.row₂.radius`. |
| Terminal second-apex equality consumer | Uses equality of the source/deleted distances, not equality of `C.row₂.radius` with the deleted distance; its own audit marks that equality overstrong on its residual. |

The smallest useful extra named relation is therefore exactly:

```text
F2 deleted-middle-radius hit:
  dist S.oppApex2 deleted = C.row₂.radius
```

An equivalent producer may expose:

```text
C.row₂.radius = parentSecondApexRow.radius
```

together with the already source-faithful fact:

```text
parentSecondApexRow.radius = dist S.oppApex2 deleted.
```

What must not be substituted is an unrelated selected row at the same center
without a theorem identifying its radius.

## Exact local realizability certificate

`exact_local_model.py` gives an externally exact algebraic realization of
the bare row/incidence core on the parabola:

```text
P(u) = (u,u²).
```

It chooses exact real algebraic parameters with approximate values:

```text
x               = -4.150489742248871...
deleted         = -3.070480903400971...
a               = -3
deleted_extra   = -2.051988734130967...
y               = -0.971979895283067...
q               =  0.618746304833692...
s               =  1.397438790904101...
c               =  2.804781663775403...
p               =  3.195218336224597...
t               =  3.725030846627837...
live_extra      =  4.503723332698246...
```

The three exact supports are:

```text
L = {q, x, y, live_extra}, centered at p
B = {x, y, s, t},          centered at a
K = {deleted, deleted_extra, s, t}, centered at c.
```

Their squared radii are:

```text
L: 103.199749502351395...
B: 69
K: 36.955596067346695...
```

The script checks exact polynomial factorizations in the algebraic number
field generated by the unique root

```text
sigma ∈ (5.12,5.13)
```

of:

```text
sigma^6 - 34 sigma^4 + 205 sigma^2 - 36 = 0.
```

It also checks exact disjoint rational isolating intervals for all eleven
parameters.  Consequently:

```text
B ∩ L = {x,y}
B ∩ K = {s,t}
L ∩ K = ∅
```

and all centers/support points are distinct.

Every finite set of distinct parabola points is convex independent: the
tangent at `P(uᵢ)` strictly separates it from `P(uⱼ)` because the vertical
gap is `(uⱼ-uᵢ)² > 0`.

This is an **externally exact algebraic check**, not a Lean proof and not a
model of all `CounterexampleData` fields.  It intentionally does not encode:

- the MEC cap partition;
- global K4 at every ambient point;
- the full retained critical map; or
- the q-deleted/q-critical split at the generated strict centers.

It therefore proves only that no contradiction can be mined from the bare
three-row metric/incidence core plus convex independence.

In the model:

```text
dist a deleted ≠ middle radius,
```

with middle-circle polynomial residual approximately:

```text
-68.811974271343923.
```

## Recommended next producer

Do not mine another anonymous three-row shadow.  Mine or prove the
source-indexed radius transport:

```lean
dist S.oppApex2 deleted = C.row₂.radius
```

on the actual coherent F2 packet, or equivalently:

1. retain the parent second-apex row that contains `deleted`;
2. identify its center and source with the F2 packet;
3. prove its radius equals `C.row₂.radius`; and
4. call
   `false_of_twoLiveExactCover_deleted_middle_radius_hit`.

If the parent surface instead proves that the two radii are distinct, that is
also decisive: this third-hit route should be abandoned in favor of the
distinct-radius continuation already exposed by the apex-omission
classifiers.

## Validation

The authoritative `lean/lean-toolchain` currently pins:

```text
leanprover/lean4:v4.27.0
```

and:

```text
lake env lean --version
```

reported Lean `4.27.0`.

The deliberate single-file validation used the already checked scratch
dependency oleans and wrote only a temporary output:

```bash
cd lean
env LEAN_PATH=/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans:./.lake/build/lib/lean \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-three-row-metric-oleans/F2ThreeRowMetricAudit.olean \
  ../scratch/atail-force/r-f2-three-row-metric-audit/F2ThreeRowMetricAudit.lean
```

It exited `0`.  Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.

The exact algebraic check was:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache \
  uv run --no-project python \
  scratch/atail-force/r-f2-three-row-metric-audit/exact_local_model.py
```

It exited `0` with:

```text
EXTERNALLY EXACT ALGEBRAIC CHECK: PASS
```

No full Lake build, production edit, closure-doc edit, proof-blueprint
mutation, or other scratch-lane edit was performed.
