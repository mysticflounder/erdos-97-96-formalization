# Round-5 v3 global theorem-bank audit

## Scope and headline

Anchor:

```lean
Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core
```

This is the required post-v3 search for a theorem that can pair the newly
banked same-shell strict squared inequality with an equality, a reverse
inequality, a Kalmanson/Ptolemy relation, or a strict cycle forced by either
constructor of `RetainedOmissionAllLargeNormalForm`.

**Result:** no current, sibling `p97-rvol`, legacy, or indexed-corpus theorem
supplies the missing Q-arm relation.  The strongest current near-hit is an
off-spine Kalmanson strict-cycle consumer, but it needs a positive cross-row
membership and a `RetainedRadiusCollision`; neither normalized directed-
omission arm provides those hypotheses.

There is also a stronger computational scope guard: deleting the whole
`same_shell_squared_superadditivity` family from the 284-clause v3 core leaves
that instance `unsat`.  A separate 31-clause `unsat` core uses only cyclic
alternation, exact rich profiles, and global K4.  Thus the new metric theorem
is sound and reusable, but it is not load-bearing for the already closed v3
case.  The v3 result points first toward a Boolean cyclic-alternation/profile
producer, not toward forcing a companion inequality for this particular core.

No production source was edited as part of this audit.  No closure is claimed.

## Banked same-shell theorem

The production module
`lean/Erdos9796Proof/P97/SameShellSuperadditivity.lean` contains:

```lean
theorem Problem97.dist_sq_gt_add_of_same_shell_opposite_sides
    {p x y z : ℝ²} {r : ℝ}
    (hx : dist x p = r) (hy : dist y p = r) (hz : dist z p = r)
    (hopposite : signedArea2 p x z * signedArea2 y x z < 0) :
    dist x z ^ 2 > dist x y ^ 2 + dist y z ^ 2
```

and its ordered-cap specialization:

```lean
theorem Problem97.CGN.sameShell_sqDist_superadditive_of_strictCapOrder
    {A : Finset ℝ²} {m : ℕ} {L : OrderedCap m}
    (hconv : ConvexIndep A)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    (Hord : StrictCapOrder A L)
    {i j k : Fin m} (hij : i < j) (hjk : j < k)
    {p : ℝ²} {r : ℝ}
    (hpA : p ∈ A)
    (hpOff : p ∉ Finset.univ.image L.points)
    (hi : dist (L.points i) p = r)
    (hj : dist (L.points j) p = r)
    (hk : dist (L.points k) p = r) :
    dist (L.points i) (L.points k) ^ 2 >
      dist (L.points i) (L.points j) ^ 2 +
        dist (L.points j) (L.points k) ^ 2
```

Both declarations passed LSP diagnostics and `lean_verify --scan-source` when
banked.  Their transitive axioms were exactly `propext`, `Classical.choice`,
and `Quot.sound`: no `sorryAx`, `Lean.trustCompiler`, or `Lean.ofReduceBool`.

`G.apex_rich i` supplies an application in every six-point rich-class arm:
the cap-interior producer gives at least four same-radius interior points, so
three can be put in strict cap order.  A `4+4` arm gives only two interior
points at each radius and therefore does not by itself instantiate this
three-point theorem.

## Exact normalized Q-arm data

The relevant constructor tails are:

```lean
| pairedCommonDeletion
    (O : OrientedRetainedCommonDeletion P)
    (reverse_omission :
      O.kept ∉
        (H.selectedAt O.deleted O.deleted_mem_A)
          .toCriticalFourShell.support)
    (reversePacket :
      CommonDeletionTwoCenterPacket D H O.kept S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))

| reverseHitFreshCommonDeletion
    (O : OrientedRetainedCommonDeletion P)
    (reverse_mem :
      O.kept ∈
        (H.selectedAt O.deleted O.deleted_mem_A)
          .toCriticalFourShell.support)
    (reverseBlocker_mem_capInterior :
      H.centerAt O.deleted O.deleted_mem_A ∈
        S.capInteriorByIndex S.oppIndex1)
    (reverseShell_inter_cap_eq :
      (H.selectedAt O.deleted O.deleted_mem_A)
          .toCriticalFourShell.support ∩ S.capByIndex S.oppIndex1 =
        {O.kept, O.deleted})
    (fresh : ℝ²)
    (fresh_mem_capInterior :
      fresh ∈ S.capInteriorByIndex S.oppIndex1)
    (fresh_ne_kept : fresh ≠ O.kept)
    (fresh_ne_deleted : fresh ≠ O.deleted)
    (fresh_not_mem_reverseShell :
      fresh ∉
        (H.selectedAt O.deleted O.deleted_mem_A)
          .toCriticalFourShell.support)
    (freshPacket :
      CommonDeletionTwoCenterPacket D H fresh S.oppApex1
        (H.centerAt O.deleted O.deleted_mem_A))
```

`OrientedRetainedCommonDeletion.packet` is a further common-deletion packet
for deleting `O.deleted`, at the first apex and the blocker selected by
`O.kept`.  These packets provide exact *chosen* four-point q-deleted witness
sets, but their `U5QDeletedK4Class` rows do not assert equality with the full
ambient circle class.

### First missing bridge, paired arm

The paired arm gives two negative cross facts:

* `O.deleted ∉` the full critical shell selected at `O.kept`;
* `O.kept ∉` the full critical shell selected at `O.deleted`.

It does not give a positive membership linking either common-deletion packet
row (or the two full blocker shells) to an ordered triple from a rich apex
shell.  To consume the new inequality, the first missing producer is an exact
cross-row equality/reverse inequality on the same three chord variables, or a
positive cross membership that instantiates one of the Kalmanson strict-cycle
schemas below.

### First missing bridge, reverse-hit/fresh arm

Here `reverse_mem` gives the common pair `O.kept,O.deleted` on the reverse
blocker shell, while `fresh_not_mem_reverseShell` is a genuine full-shell
nonmembership.  This localizes incidences but still does not identify a third
ordered point of that shell or relate its chord distances to a rich-shell
triple.  The first missing producer is a positive membership between a fresh
packet row and the reverse/full rich shell, or an exact chord equality making
the new strict sum impossible.  The existing negative omission alone cannot
create that equality.

## Current production consumers

### Four-point Kalmanson equalities

`ATail/CapCrossingKalmanson.lean` contains the exact contradictions

```lean
theorem false_of_four_ccw_endpoint_centers_bisect_middle_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (haeq : dist (boundary ia) (boundary ib) =
      dist (boundary ia) (boundary ic))
    (hdeq : dist (boundary id) (boundary ib) =
      dist (boundary id) (boundary ic)) : False

theorem false_of_four_ccw_middle_centers_bisect_endpoint_pair
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {ia ib ic id : Fin carrier.card}
    (hiab : ia < ib) (hibc : ib < ic) (hicd : ic < id)
    (hbeq : dist (boundary ib) (boundary ia) =
      dist (boundary ib) (boundary id))
    (hceq : dist (boundary ic) (boundary ia) =
      dist (boundary ic) (boundary id)) : False
```

Neither Q constructor supplies both displayed equalities in a certified CCW
quadruple.

### Three-equality Kalmanson schemas

`ATail/KalmansonThreeEqualitySchemas.lean` banks four source-proved schemas.
All have the common hypotheses `ConvexIndep A`, an injective CCW enumeration
whose image is `A`, and strictly increasing listed indices.  Their exact
distance-equality tails are:

```lean
false_of_six_ccw_three_shell_equalities_013_412_523:
  d(0,1)=d(0,3) → d(4,1)=d(4,2) → d(5,2)=d(5,3) → False

false_of_six_ccw_three_shell_equalities_012_325_415:
  d(0,1)=d(0,2) → d(3,2)=d(3,5) → d(4,1)=d(4,5) → False

false_of_five_ccw_three_shell_equalities_012_124_314:
  d(0,1)=d(0,2) → d(1,2)=d(1,4) → d(3,1)=d(3,4) → False

false_of_six_ccw_three_shell_equalities_013_235_415:
  d(0,1)=d(0,3) → d(2,3)=d(2,5) → d(4,1)=d(4,5) → False
```

The Q arms supply some same-center equalities inside each row, but not the
positive cross incidences needed to identify the three row equalities with
one of these cyclic patterns.

### Generic ordinal strict-cycle consumer

`ATail/OrdinalKalmansonCycle.lean` contains:

```lean
theorem false_of_transGen_cycle
    {carrier : Finset ℝ²} (hcarrier : ConvexIndep carrier)
    {boundary : Fin carrier.card → ℝ²}
    (hboundary_injective : Function.Injective boundary)
    (hboundary_image : Finset.univ.image boundary = carrier)
    (hboundary_ccw : EuclideanGeometry.IsCcwConvexPolygon boundary)
    {kappa : Type*} {value : kappa → ℝ} {start : kappa}
    (cycle : Relation.TransGen
      (SelectedRowOrdinalComparison boundary value) start start) : False
```

This is the correct terminal after a directed strict comparison cycle has
been produced.  Neither Q arm currently produces even one complete cycle.

### Closest off-spine positive-incidence consumer

`ATail/RetainedCollisionDifferentPairConsumer.lean` is explicitly
`COMPAT-ONLY/BANK` and has no current importer.  Its useful surface is:

```lean
structure OrderedDifferentPairCrossHit (Q : RetainedRadiusCollision) where
  fresh : FreshFirstApexRowPoint Q
  J_mem_A : fresh.J ∈ D.A
  K_mem_J_shell :
    fresh.K ∈
      (H.selectedAt fresh.J J_mem_A).toCriticalFourShell.support
  -- a certified six-point CCW order O < J < C < A < X < K

theorem OrderedDifferentPairCrossHit.false
    (P : OrderedDifferentPairCrossHit Q) : False

structure AlternateOrderedDifferentPairCrossHit
    (Q : RetainedRadiusCollision) where
  fresh : FreshFirstApexRowPoint Q
  J_mem_A : fresh.J ∈ D.A
  K_mem_J_shell :
    fresh.K ∈
      (H.selectedAt fresh.J J_mem_A).toCriticalFourShell.support
  -- a certified six-point CCW order O < C < J < X < A < K

theorem AlternateOrderedDifferentPairCrossHit.false
    (P : AlternateOrderedDifferentPairCrossHit Q) : False
```

The proofs form respectively `AC < AJ < AC` and `JX < CX < JX` from strict
Kalmanson inequalities.  This is a genuine closing consumer once
`K_mem_J_shell` and the order packet are available.  It does not accept the
anchored `RetainedInteriorDirectedOmission`, which is the distinct-blocker
matching arm rather than `RetainedRadiusCollision`.  Its load-bearing missing
hypothesis is the same positive cross-row membership identified above.

### Squared-equality/radical-axis adapters

`U5GlobalIncidenceBasic.lean` includes:

```lean
theorem u5SameCircleExport_of_dist_sq_eq
    {D : CounterexampleData} {q p t u : ℝ²} {T : Finset ℝ²}
    (hsel : U5SelectedCandidateSkeleton D q p T u)
    (ht_radius : dist p t = dist p q)
    (hsq : dist p u ^ 2 = dist p t ^ 2) :
    U5SameCircleExport D q p T u

theorem dist_sq_eq_of_affine_circle_eq {p t u : ℝ²}
    (haff : 2 * inner ℝ p (u - t) = norm u ^ 2 - norm t ^ 2) :
    dist p u ^ 2 = dist p t ^ 2

theorem radical_axis_eq_of_dist_sq_eqs {q p t u : ℝ²}
    (hq : dist q u ^ 2 = dist q t ^ 2)
    (hp : dist p u ^ 2 = dist p t ^ 2) :
    inner ℝ (p - q) (u - t) = 0
```

These transport an already proved equality or affine radical-axis equation.
The Q normal form provides neither the affine equation nor the second squared
equality required to manufacture the missing cross hit.

## Ptolemy search

No P97 production module uses a Ptolemy theorem.  Mathlib has the exact
consumer

```lean
EuclideanGeometry.mul_dist_add_mul_dist_eq_mul_dist_of_cospherical
    {a b c d p : P}
    (h : Cospherical ({a,b,c,d} : Set P))
    (hapc : angle a p c = pi)
    (hbpd : angle b p d = pi) :
    dist a b * dist c d + dist b c * dist d a =
      dist a c * dist b d
```

at `Mathlib/Geometry/Euclidean/Sphere/Ptolemy.lean`.  Besides cosphericality,
it requires a line-intersection point with two straight-angle hypotheses.
Neither Q arm supplies those angle hypotheses.  Its unsquared multiplicative
identity also does not directly reverse the new additive squared inequality.

## Sibling and legacy registries

The required search covered:

* `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`;
* `certificates/erdos_general_theorem_p97_mining.{md,json}`;
* the indexed Lean corpus via `nthdegree docs search --lean`.

There are zero registry declarations matching Ptolemy, same-shell
superadditivity, an equal-sum reverse, or a Q-arm strict-cycle producer.  The
closest source-proved and source-reachable entries are:

```lean
Problem97.u5SameCircleExport_of_dist_sq_eq
  (hsel : U5SelectedCandidateSkeleton D q p T u)
  (ht_radius : dist p t = dist p q)
  (hsq : dist p u ^ 2 = dist p t ^ 2) :
  U5SameCircleExport D q p T u

Problem97.pointChord_strictMono_of_angle_lt_radius
  (hr : 0 < r)
  (hx : dist x c = r) (hy : dist y c = r) (hz : dist z c = r)
  (hxy : angle x c z < angle y c z) :
  dist x z < dist y z

Problem97.dist_sq_lt_dist_sq_of_inner_nonpos
  (hinner : inner ℝ (a-b) (c-b) <= 0) (hbc : b != c) :
  dist a b ^ 2 < dist a c ^ 2

Problem97.dist_sq_eq_coord_diff_sq_of_orthonormal_origin
  -- orthonormal-coordinate hypotheses
  : dist p q ^ 2 = (px-qx)^2 + (py-qy)^2
```

All are registry-classified `source-proved` and `source_reachable=true`.
These statuses are discovery/source evidence, not a fresh kernel audit in the
current checkout.  The first theorem is already present locally.  The others
produce monotonicity or coordinate rewrites only after additional geometric
hypotheses; Q does not provide those hypotheses.

## Bounded 5x5 power-matrix preflight

The corrected unique-possible-matching criterion is already banked in
`Census554/CirclePowerMatrix.lean`:

```lean
powerMatrix_rank_le_four
powerMatrix_det_fin_five
PermutationPossible
PermutationCertifiedNonzero
det_ne_zero_of_unique_possible_matching
false_of_powerMatrix_unique_possible_matching
```

The existing exhaustive named-surface audit was rerun from
`scratch/retained-omission-e1/power-rank-q-arms/audit_power_patterns.py`.
It correctly treats an unknown as possible, and reports:

| Q arm | 5x5 certificates | largest certified unique minor | 4x4 row-difference certificates |
|---|---:|---:|---:|
| paired | 0 | 3 | 0 |
| reverse-hit/fresh | 0 | 2 | 0 |

The full-versus-subset distinction is decisive:

* `H.selectedAt source ... .toCriticalFourShell` is a full ambient radius
  class, via `CriticalFourShell.support_eq`;
* the frontier `SelectedClass D.A S.oppApex1 radius` is also a full filtered
  ambient class;
* `CommonDeletionTwoCenterPacket.B1/B2` with `row1/row2 :
  U5QDeletedK4Class ...` are chosen four-point q-deleted witnesses, not full
  ambient classes.  Nonmembership in `B1` or `B2` is therefore not a certified
  nonzero power.

The available normalizers identify each packet second row with a full critical
shell in these Q constructors, but the apex-centered first rows remain chosen
subsets.  On the strongest sound paired matrix, the full rows `K,D,F` give a
nonsingular 3x3 minor on columns `k,d,a`; the apex rows `F,A1,A2` each have
only the apex `a` as a certified-nonzero neighbor.  Hall already fails for a
5x5 certified matching.  The fresh arm is weaker and tops out at 2x2.

The first missing power-matrix producer is consequently an **ambient
off-circle fact**, not a chosen-subset omission: at least two of `F,A1,A2`
must receive certified nonzero power at two distinct named non-apex columns.
A complete determinant certificate then also needs enough positive full-circle
memberships to force uniqueness among all possible matchings.  The current Q
normal form supports neither requirement.

Full details and the two sound status matrices remain in
`scratch/retained-omission-e1/power-rank-q-arms/REPORT.md`.

## v3 family ablation

`scratch/retained-omission-e1/round5-core-mining/v3-family-deletions.json`
records a baseline 284-clause tracked core.  Removing each entire family gives:

| removed family | removed clauses | status without family |
|---|---:|---|
| cyclic alternation | 11 | UNSAT |
| distinct-circle overlap | 1 | UNSAT |
| exact rich profiles | 60 | SAT |
| global K4 | 32 | SAT |
| no-all-apex-shell | 2 | UNSAT |
| positive squared distances | 8 | UNSAT |
| **same-shell squared superadditivity** | **11** | **UNSAT** |
| squared-distance equality transport | 11 | UNSAT |
| strict Kalmanson | 148 | SAT |

This is an exhaustive solver result for this fixed v3 abstraction, not a Lean
proof of the geometric theorem.  It proves only that the tracked same-shell
family is redundant for that one UNSAT instance.

More sharply,
`scratch/retained-omission-e1/round5-core-mining/v3-combinatorial-core.json`
contains a 31-clause UNSAT core with exactly:

* 9 cyclic-alternation cuts;
* 18 exact-rich-profile constraints;
* 4 global-K4 constraints.

No squared-distance, equality-transport, or same-shell-superadditivity clause
occurs in that core.  Cyclic alternation is itself geometrically justified by
Kalmanson/circle crossing, but the extracted core is still external Z3
discovery evidence until its producer and finite contradiction are banked in
Lean.

## Import reachability and trust boundary

`SameShellSuperadditivity.lean` imports only:

```text
P97.CircumcenterSide
P97.ConvexIndepHelpers
P97.Moser.NonDeg
P97.CGN.CGN
```

Its static transitive import closure contains no `ATail` module and no path
back to `ATail.FrontierLiveClosure`.  A direct import at
`ATail/FrontierLiveClosure.lean` is therefore cycle-safe and is the minimal
safe point while only the anchored core consumes the theorem.  The current
working tree already contains that direct import as a concurrent uncommitted
edit; this audit did not add or alter it.

A fresh whole-tree recheck is presently blocked by a concurrent, unrelated
cycle through

```text
WitnessPacketInterface -> U2.OneHitBound -> U2.OneHitMonotone ->
U2.OneHitRealization -> N8... -> N9Endpoint.Closure ->
UniversalProblem97 -> PinnedMultiplicity -> WitnessPacketInterface.
```

Accordingly, trust is classified as follows:

| artifact | status |
|---|---|
| the two new same-shell theorems | source-clean and previously freshly axiom-audited; standard axioms only |
| current Kalmanson consumers | source-proved current Lean; no fresh audit in this pass because of the unrelated import cycle |
| sibling/legacy candidates | registry `source-proved`, `source_reachable=true`; not freshly rebuilt here |
| v3 cores and ablations | exact external Z3 evidence for the stated finite abstraction; not Lean closure |
| anchored core | still an explicit load-bearing `sorry`; not closed |

## Strategic conclusion

Do not spend the next anchored round trying to make the new same-shell
inequality close the already UNSAT v3 core.  The finite evidence says that
case closes before that family is used.  The best next theorem target exposed
by this audit is a Q/G **positive cyclic cross-incidence or cyclic-alternation
producer** which feeds either:

1. the 31-clause combinatorial core after a small audited finite checker; or
2. the existing Kalmanson strict-cycle bank (`OrderedDifferentPairCrossHit`,
   its alternate, or `false_of_transGen_cycle`).

If a power-matrix route is pursued in parallel, its first obligation is the
ambient off-circle/radius-separation producer above.  A complement fact about a
chosen common-deletion four-subset is not enough.
