# Continuation theorem-bank match

Date: 2026-07-14

Scope: scratch-only search for an existing theorem that consumes the live
second-apex continuation data:

- distinct `z₁ z₂` in
  `oppCap2 \ (surplusCap ∪ oppCap1)`;
- `z₁,z₂` lie in one selected four-class centered at `oppApex2`;
- globally supplied rows
  `K₁ : SelectedFourClass D.A z₁` and
  `K₂ : SelectedFourClass D.A z₂`; and
- one common `CriticalShellSystem D.A`.

## Fresh symmetric-selector update

This section supersedes the earlier broad recommendation to seek an arbitrary
common outside pair.  With the corrected selectors, the two first-apex points
are genuinely strict:

```text
a,b ∈ row(oppApex1) ∩
  (oppCap1 \ (surplusCap ∪ oppCap2)).
```

The old finite-analyzer label `first_outside_o2` included Moser endpoint `2`;
that larger set is not the theorem-facing selector used here.

For two strict second-cap centers `z₁,z₂`, every continuation row omits at
least one of `a,b`.  The 2-by-2 deletion grid is now kernel-normalized as:

```lean
Nonempty (CommonDeletionTwoCenterPacket D H a z₁ z₂) ∨
Nonempty (CommonDeletionTwoCenterPacket D H b z₁ z₂) ∨
Nonempty (CrossedCriticalNormalForm D H K₁ a b z₁ z₂) ∨
Nonempty (CrossedCriticalNormalForm D H K₁ b a z₁ z₂)
```

The same-column arms give two exact q-deleted U5 rows for one deletion.  The
genuinely residual arm is alternating: at `z₁`, one deletion survives and
the other blocks; at `z₂`, the choices reverse.  Each blocked arm gives an
exact `CriticalSelectedFourClass`, and ordered-cap uniqueness forces the
blocked critical row to omit the other first-apex source.

All of this is **PROVEN in checked scratch**, not a proposed classifier:

- `nonempty_crossedCriticalNormalForm`;
- `biApex_two_by_two_survival_normal_form`;
- `nonempty_commonDeletionTwoCenterPacket`; and
- `biApex_three_center_two_deletion_coupling`.

The three-center theorem is slightly stronger than the 2-by-2 display: among
`oppApex2,z₁,z₂`, one of the two deletions survives at two distinct
centers.  It still does not produce a dangerous-triple payload or the named
cross incidences consumed by a U5 terminal.

### Equilateral residual: a stronger forced-alternation theorem

If both continuation rows contain `oppApex2` (in particular, in the
`EquilateralResidual` arm), a strict first-cap hit in one row is forced to be
absent from the other.  The compiled theorem is:

```lean
theorem common_secondApex_forces_strictOppCap1_cross_omissions
    ...
    (hO₂R₁ : oppApex2 ∈ R₁.support)
    (hO₂R₂ : oppApex2 ∈ R₂.support)
    (haR₁ : a ∈ R₁.support)
    (hbR₂ : b ∈ R₂.support) :
    a ∉ R₂.support ∧ b ∉ R₁.support
```

This is the exact FourPoint/two-circle match.  For example, if `a` also lay
in `R₂`, the two circles centered at `z₁,z₂` would share the two outside
points `a,oppApex2`.  In the cap-index orientation `z₁ < z₂`, strict cap
order gives the exact signs

```text
signedArea2 a        z₁ z₂ < 0
signedArea2 oppApex2 z₁ z₂ < 0,
```

up to simultaneous sign reversal when the center order is reversed.  Hence
their product is positive, exactly the premise of
`FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side`.  The scratch
proof calls the still narrower
`CapSelectedRowCounting.outsidePair_unique_capCenter` directly.  Therefore
the FourPoint core closes every shared-hit branch, but it cannot close the
true alternating arm: that arm is precisely missing its second two-circle
equality closure.

### Nearest equality-core shape: five-point hinge cycle (diagnostic only)

In `EquilateralResidual`, use the label map

```text
A = z₁,  B = z₂,  H = oppApex2,  D = a,  C = b.
```

The residual plus alternating hits prove the first four of the seven
equalities in `Census554.EqualityCore.five_point_hinge_cycle_collision`:

```text
AB = AD = AH
BA = BC = BH.
```

Exactly three tail equalities remain:

```text
dist b z₁       = dist b a
dist a z₂       = dist a oppApex2
dist oppApex2 b = dist oppApex2 a.
```

The conditional adapter
`false_of_alternating_equilateral_of_three_hinge_tail_equalities` is
kernel-checked and consumes precisely those three premises.  It invokes the
current, importable five-point hinge theorem and proves `False` from
`z₁ ≠ z₂`.

This core is not the narrowest terminal after all.  Its third tail equality

```text
dist oppApex2 b = dist oppApex2 a
```

already closes by itself.  The kernel-checked adapter
`false_of_firstApex_strict_pair_equidistant_at_secondApex` applies the current
`U2NonSurplusSqueeze.oppCap2_escape_gen`: the first-apex row already makes
`a,b` equidistant from `oppApex1`, and two non-surplus points cannot be
equidistant from both opposite apices.  Consequently the full hinge cycle is
a useful equality ledger, but attempting to produce all three tails is
dominated by the existing two-apex reflection terminal.

### Reverse-row and cyclic-orientation audit

Neither symmetric reverse alternating orientation forces a hinge tail.
Writing `row(a),row(b)` for the reverse continuation rows:

- reciprocal alternation gives `z₁ ∈ row(a)` and `z₂ ∈ row(b)`;
  these merely repeat the already known spoke edges `a-z₁` and `b-z₂`;
- cyclic alternation gives `z₂ ∈ row(a)` and `z₁ ∈ row(b)`;
  these name the left edges of the first two tails, but do not give the
  required companion hits `oppApex2 ∈ row(a)` or `a ∈ row(b)`.

The parent rows add only

```text
dist oppApex1 a = dist oppApex1 b
dist oppApex2 z₁ = dist oppApex2 z₂.
```

They do not connect either of the first two tail edge pairs.  Transposing the
forward one-hit pattern or reversing the cyclic order only relabels this
audit.

`tail_equality_closure.py` computes the exact transitive closure of the named
edge equalities for reciprocal and cyclic reverse grids.  In both cases all
three tail queries remain in different closure classes:

```text
reciprocal  False False False
cyclic      False False False
```

This is a precise independence result for the current row-equality interface:
a one-hit row has only one named radius edge and therefore contributes no
new equality between named edges.  CSS alignment changes omissions into
deletion-survival facts; it does not add a second named support hit.

### Exact local metric/strict-convex regression

`verify_exact_local_regression.py` gives a complementary exact model in
`Q(sqrt(3))` of every named metric equality and local strict-convex sign used
above, while falsifying all three tails.  The points are

```text
z₁ = (0,0)
z₂ = (1,0)
O₂ = (1/2,-sqrt(3)/2)
a  = (51/149,-140/149)
b  = (1/25,-7/25)
O₁ = (1759/1490,-233/1490).
```

Exactly,

```text
|z₁-z₂|² = |z₁-O₂|² = |z₂-O₂|²
           = |z₁-a|² = |z₂-b|² = 1,
|O₁-a|² = |O₁-b|².
```

All six points are vertices in cyclic order
`z₁,b,a,O₂,O₁,z₂`; the script certifies that every other point is
strictly on the same side of each oriented hull edge.  In particular the two
selected pairs are adjacent hull pairs and satisfy the required strict
same-side signs.  The three squared tail differences are

```text
-1663/3725,
-51/149 + (140/149)*sqrt(3),
-2301/3725 + (2457/3725)*sqrt(3),
```

all nonzero (the verifier uses the rational certificate
`1.732 < sqrt(3) < 1.733`).

Evidence boundary: this is **exact within the named local metric and strict
convexity abstraction**.  It is not a `CounterexampleData`, does not assert
global K4 for the six points, and does not model the untouched M44 layer.  It
therefore rules out a derivation from the displayed local equalities/order
alone, not a derivation using some genuinely new global coupling theorem.

### Audit of the other geometry banks

| Bank consumer | Current/importable | What the alternating equilateral arm supplies | Exact missing data |
|---|---|---|---|
| `FourPointTwoCircleBisectorOrderCore.false_of_core_of_same_side` | yes | one common point `oppApex2`; same-side signs for every strict outside point | a second point common to both continuation circles; a shared `a` or `b` closes immediately and is now formally excluded |
| `ConvexRhombusCore.false_of_core` / `_of_neg` | yes | natural map `a=z₁,b=z₂,c=oppApex2,d=a,equilateral-hit y=b` gives the base hinge and two spokes | `oppApex2-a` and `oppApex2-b` at the hinge radius, a point `x` at that radius from both `a,z₁`, plus four remaining signed-area premises |
| `EqualityCore.five_point_hinge_cycle_collision` | yes | 4/7 equalities | three displayed tails, but the third tail alone already fires `oppCap2_escape_gen`; the hinge is diagnostic rather than a minimal target |
| `SixPointTwoCircleArcOvertakeOrderCore` | yes | an equilateral hinge and, after naming the fourth member of `R₁`, the five equalities centered at `z₁` | a second selected row giving `DA=DE=DF`, and six signs `OAC,OAD,OAE,OEC,OEF,EFC`, all with one common polarity |
| `SixPointNestedCenterOrderCore` | yes | the equilateral prefix `OA=OC=AC` and `OA=OD=OE` from one continuation row | three tail-row equality closures and five common-polarity signs |
| `SixPointCircleChainOrderCore` | yes | the same equilateral/one-row prefix | four tail closures and four common-polarity signs |
| equality-only six-point collision cores | yes | at most the equilateral prefix and two spokes | each public core needs 9 equality closures; no label map fills the remaining tail network from current incidences |
| U5 equilateral kernels | yes | an equilateral triangle at `z₁,z₂,oppApex2` | they require a dangerous center equidistant from three triple points and/or 2--4 further q-deleted/critical rows with named incidences; the continuation triangle is not a `U5DangerousTriple` by itself |

For `ConvexRhombusCore`, the exact six required positive signs are
`abc, abd, bcy, xda, cxy, xyd`; `_of_neg` requires all six negative.  Strict
cap order supplies a common sign only for triples using the moving cap chord
`z₁,z₂` and points known outside that cap.  It does not supply the four
mixed signs involving `x,a,b,oppApex2`, so orientation transport is not the
only gap; the metric core is also incomplete.

The closest U5 equilateral consumers remain:

- `u5_equilateral_opposite_point_incompatibility`;
- `u5_equilateral_bisector_incompatibility`;
- `u5_equilateral_circumcenter_on_p_circle_incompatibility`;
- `u5_equilateral_outer_point_incompatibility`; and
- `U5QCriticalTripleClass.qcritical_equilateral_bridge_incompatibility`.

All require a dangerous-radius center through three named points before their
equilateral subpattern begins.  No current theorem turns
`(z₁,z₂,oppApex2)` into that dangerous-triple interface.  The indexed
endpoint theorem `pEqC_row_impossible_of_equilateral` is also not an adapter:
it is specialized to `FiniteEndpointShell`, needs `q ∈ I2`, two specific
triangle-distance equalities, and the strict length chain `hsmall,hlong`.

### Current conclusion for the alternating arm

There is no direct bank terminal from the corrected strict selectors plus
`z₁/z₂` cross membership or `EquilateralResidual` alone.  What is now
proved is sharper:

1. shared strict first-cap hits are impossible;
2. the equilateral branch is therefore forced into genuine alternation; and
3. neither reciprocal nor cyclic reverse one-hit rows force any of the three
   hinge tails; and
4. the third hinge tail is itself a one-premise two-apex terminal.

The next producer must add a genuinely new second named hit/global coupling.
If it yields `dist oppApex2 a = dist oppApex2 b`, closure is immediate.  The
current parent rows, reverse one-hit rows, CSS omissions, and equilateral
prefix do not yield it or either of the other tails.

### Pinned scratch evidence

```text
ContinuationBankMatch.lean
8b561d45961199db206f7d685c5f9a36cec41d7aa24dd517a723d608035c2881

tail_equality_closure.py
cb556e35970fa69274c4441aaa3038d235cb3b4051b01576b9e057e242abe247

verify_exact_local_regression.py
b5cd3a5fd77e21369ad311eee952439391573124cdfabf58758cfb4cbabd8465

find_local_regression.py
8496c04b97bbb3df4e56453f8f16f9d88b1b1ca308e78f65d63cbf005306d488
```

`find_local_regression.py` is exploratory search only.  The durable negative
evidence is the exact verifier, whose omissions are explicit: no global K4,
no total CSS, no full surplus/M44 packet, and no claim that the six-point set
is a Problem 97 counterexample.  The Lean file is the positive kernel-checked
surface; the equality-closure script is exact only for the named-row incidence
interface described above.

## Historical broad continuation audit

No theorem in the three required external registries, the current source, or
the indexed Lean corpus closes from exactly those premises.

The narrowest direct bank sink is current and importable:

```lean
Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter
```

It closes if the two continuation rows share two distinct support points
outside `oppCap2`.  The compiled scratch adapter is:

```lean
theorem false_of_two_strictOppCap2_rows_common_outside_pair
    (D : CounterexampleData)
    {z₁ z₂ a b : ℝ²}
    (K₁ : SelectedFourClass D.A z₁)
    (K₂ : SelectedFourClass D.A z₂)
    (hz₁Strict :
      z₁ ∈ D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hz₂Strict :
      z₂ ∈ D.packet.oppCap2 \
        (D.packet.surplusCap ∪ D.packet.oppCap1))
    (hzne : z₁ ≠ z₂)
    (ha₁ : a ∈ K₁.support) (hb₁ : b ∈ K₁.support)
    (ha₂ : a ∈ K₂.support) (hb₂ : b ∈ K₂.support)
    (haOutside : a ∉ D.packet.oppCap2)
    (hbOutside : b ∉ D.packet.oppCap2)
    (hab : a ≠ b) : False
```

This is in `ContinuationBankMatch.lean`.  Direct Lean validation passed:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/continuation-bank-match/ContinuationBankMatch.lean

exit 0
```

Every printed scratch declaration, including both fresh normal forms and both
alternating-arm adapters, has only the ordinary project axioms reported by
`#print axioms`: `propext`, `Classical.choice`, and `Quot.sound`.

### Historical broad missing producer (not the alternating target)

The sufficient coupling premise can be written without naming the witnesses:

```lean
2 ≤ (((K₁.support ∩ K₂.support) \ D.packet.oppCap2).card)
```

This is the narrowest missing input to the compiled adapter.  It is a
**sufficient target**, not something established by the current packet.

The bank does prove each row separately has at least two points outside the
cap:

```lean
2 ≤ (K₁.support \ D.packet.oppCap2).card
2 ≤ (K₂.support \ D.packet.oppCap2).card
```

That follows from
`selectedFourClass_inter_capByIndex_card_le_two` and support cardinality four.
It does not imply that the two outside pairs overlap.  In fact the same
ordered-cap sink gives the sharp currently available upper bound

```lean
(((K₁.support ∩ K₂.support) \ D.packet.oppCap2).card) ≤ 1.
```

Thus another round of merely producing arbitrary global rows will not close
this branch.  The next producer must force cross-row incidence, a common
outside pair, or a stronger classified configuration that one of the U5
consumers recognizes.

## Current theorem-bank matches

### 1. Ordered-cap outside-pair uniqueness: direct adapter, one missing fact

Current source:
`lean/Erdos9796Proof/P97/CapSelectedRowCounting.lean:283`.

```lean
theorem outsidePair_unique_capCenter
    {A : Finset ℝ²} {m : ℕ} {L : CGN.OrderedCap m}
    (hconv : ConvexIndep A) (Hord : CGN.StrictCapOrder A L)
    (hmem : ∀ t : Fin m, L.points t ∈ A)
    {r s : Fin m} (hrs : r < s) {a b : ℝ²}
    (haA : a ∈ A) (hbA : b ∈ A)
    (haOutside : a ∉ Finset.univ.image L.points)
    (hbOutside : b ∉ Finset.univ.image L.points)
    (hab : a ≠ b)
    (hra : dist (L.points r) a = dist (L.points r) b)
    (hsa : dist (L.points s) a = dist (L.points s) b) : False
```

Import reachability: **current and directly importable** through
`Erdos9796Proof.P97.CapSelectedRowCounting`.

Missing premise from the continuation: two distinct `a,b` in
`K₁.support ∩ K₂.support` outside `oppCap2`.

### 2. Generic two-circle rigidity: current, but needs three common points

Current source:
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:479`.

```lean
theorem SelectedFourClass.inter_card_le_two
    (Kx : SelectedFourClass A x) (Ky : SelectedFourClass A y)
    (hxy : x ≠ y) :
    (Kx.support ∩ Ky.support).card ≤ 2
```

The underlying metric kernel is current at
`lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:129`:

```lean
theorem eq_of_equidistant_three_noncollinear
    (harea : signedArea2 a b c ≠ 0)
    (hxab : dist x a = dist x b)
    (hxac : dist x a = dist x c)
    (hyab : dist y a = dist y b)
    (hyac : dist y a = dist y c) : x = y
```

Import reachability: **current**.  Missing premise: three common support
points.  This is strictly stronger than the two-outside-point requirement of
the ordered-cap sink.

### 3. Faithful-carrier aggregation: current, nonclosing

Current source:
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1585`.

```lean
theorem exists_faithfulCarrierPattern_with_two_classes
    (hK4 : HasNEquidistantProperty 4 A)
    (hc₁ : c₁ ∈ A) (hc₂ : c₂ ∈ A) (hcne : c₁ ≠ c₂)
    (K₁ : SelectedFourClass A c₁) (K₂ : SelectedFourClass A c₂) :
    ∃ F : FaithfulCarrierPattern A,
      (F.classAt c₁ hc₁).support = K₁.support ∧
      (F.classAt c₂ hc₂).support = K₂.support
```

This feeds `orderedCap_outsidePairCount_sum_le` and
`orderedCap_card_add_four_le_choose_outside` in
`CapSelectedRowCounting.lean:351,579`.  Those theorems inject the outside pair
of every cap row into the set of outside pairs.  At the live cardinal range
their upper bound is not contradictory; a producer still has to force pair
reuse or a stronger placement restriction.

### 4. Sibling U1 five-point obstruction: exact metric sink, much too many
missing equalities

Sibling source:
`/Users/adam/projects/math-projects/p97-rvol/lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`.

```lean
theorem
  Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction
    (a c d e f : ℝ²) (hac : a ≠ c)
    (h1 : dist c a = dist c d)
    (h2 : dist c a = dist c f)
    (h3 : dist d c = dist d e)
    (h4 : dist d c = dist d f)
    (h5 : dist f a = dist f d)
    (h6 : dist f a = dist f e)
    (h7 : dist e a = dist e c) : False
```

Registry status: `source-proved`, `source_reachable: false`, no current exact
name or module basename.  The continuation supplies only the parent-row
equality at `oppApex2`; it does not supply a mapping that establishes all
seven cross-row equalities.

### 5. Sibling same-cap push/rank/lap interface: consumers, not producers

Sibling source:
`/Users/adam/projects/math-projects/p97-rvol/lean/RVOL/P97/WitnessLapInterface.lean:88`.

```lean
structure SameCapIncompatibleEdge {m : ℕ}
    (A : Finset ℝ²) (L : CGN.OrderedCap m) where
  hm : 2 ≤ m
  ix ip : Fin m
  used : CapEndpoint
  mem_pts : ∀ t, L.points t ∈ A
  endpoint_radius_eq :
    dist (L.points ip) (L.points ix) =
      dist (L.points ip) (L.points (used.idx hm))
```

The same module has:

```lean
theorem strictLapPacket_nonreturn (P : StrictLapPacket) : False

theorem rank_drop (hm : 2 ≤ m)
    (h : RankInterval hm iy v ⊂ RankInterval hm ix u) :
    rank hm iy v < rank hm ix u
```

`U1kSourcePushout.lean:70,95` has:

```lean
theorem source_pushout_right
    (e : SameCapIncompatibleEdge A L)
    (M : CGN.MinorCapChainModel L)
    (hused : e.used = CapEndpoint.right)
    (hx_lt : e.ix < CGN.lastIndex e.hm)
    (hp_ne : e.ip ≠ CGN.lastIndex e.hm)
    (hpx_ne : e.ip ≠ e.ix) :
    e.ip ∈ RankInterval e.hm e.ix CapEndpoint.right

theorem source_pushout_left
    (e : SameCapIncompatibleEdge A L)
    (M : CGN.MinorCapChainModel L)
    (hused : e.used = CapEndpoint.left)
    (hx_gt : CGN.firstIndex e.hm < e.ix)
    (hp_ne : e.ip ≠ CGN.firstIndex e.hm)
    (hpx_ne : e.ip ≠ e.ix) :
    e.ip ∈ RankInterval e.hm e.ix CapEndpoint.left
```

Registry status: both source modules are sibling-source reachable;
`WitnessLapInterface` has no current module basename, and the named edge,
push, rank, and packet declarations are absent from current production source.

Missing premises are structural: a selected endpoint, its radius equality,
a minor-cap chain model, an actual strict rank-interval containment, or a
preassembled three-step strict lap.  None is produced by two arbitrary global
rows.

### 6. Current U5 q-deletion classifier: feasible normalization, no terminal

The current U5 bank can normalize a global row relative to a deleted point:

```lean
theorem U5QDeletedK4Class.exists_card_four_or_qCritical_of_globalK4
    (hq : q ∈ D.A) (hcenter : center ∈ D.skeleton q) :
    (∃ B, Nonempty (U5QDeletedK4Class D q center B) ∧ B.card = 4) ∨
    ∃ r, 0 < r ∧ dist center q = r ∧
      ((((D.skeleton q).erase center).filter
        fun y => dist center y = r).card = 3)
```

Current source:
`lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean:430`.

The parent four-class can be used to name a dangerous triple containing
`z₁,z₂`, after choosing the fourth parent support point as `q`.  Applying
the classifier to the two continuation centers gives a finite four-way split:
deleted/deleted, deleted/q-critical, q-critical/deleted, or
q-critical/q-critical.

The closest current terminal consumers are:

```lean
U5QCriticalTripleClass.two_triple_points_incompatibility
U5QCriticalTripleClass.two_triple_centers_adjacent_incompatibility
U5QCriticalTripleClass.two_triple_centers_third_common_incompatibility
```

They are current in `U5GlobalIncidenceSupport.lean:197` and
`U5GlobalIncidenceKernels.lean:377,421` (the sibling registry also marks their
source modules reachable).  Their missing premises are respectively:

- two named dangerous-triple points in one q-critical row;
- the parent center in both q-critical rows plus a directed cross incidence;
- the parent center in both rows plus a shared third dangerous-triple point.

The sibling-only
`qcritical_exact_selected_double_bisector_incompatibility` requires three
q-critical rows and still more named cross incidences.  Therefore the U5
classifier is a viable next adapter surface, but classification alone does not
close.

### 7. Legacy center-rigidity theorem: fixed `N9Point`, superseded

Both legacy inventories expose
`Problem97.three_common_equidistant_centers_eq` in `N9Geometry.lean`
(`source-proved`, source reachable).  It is stated for the legacy `N9Point`
type and again needs three common noncollinear points.  The current
`eq_of_equidistant_three_noncollinear` is the cleaner general-ℝ² replacement.

No other candidate in either legacy inventory accepts the live continuation
shape.

## Why the common critical-shell system does not fill the gap

`CriticalShellSystem A` chooses, for every source `q`, a blocker center
`H.centerAt q hq` and a critical row
`H.selectedAt q hq` centered at that blocker.  The globally selected
continuation rows `K₁` and `K₂` are centered at `z₁` and `z₂` themselves.

There is no field equating `Kᵢ` with a row chosen by `H`, no cross-source
coherence field, and no incidence statement placing one continuation source
or a common outside pair in both rows.  Merely carrying the same `H` beside
the two global rows therefore adds no premise usable by the direct bank sinks.

## Registry and indexed-corpus coverage

Required registries inspected in full:

| Inventory | candidate declarations | normalized groups |
|---|---:|---:|
| `p97_rvol_general_n_mining.json` | 2,148 | 1,994 |
| `erdos97_legacy_general_n_mining.json` | 285 | 233 |
| `erdos_general_theorem_p97_mining.json` | 297 | 244 |

The corresponding three markdown summaries and
`docs/general-n-certificate-bank-mining-2026-07-09.md` were also checked.

Targeted `nthdegree docs search --lean` searches covered:

- two distinct same-cap centers with selected four-classes;
- common-radius classes at two centers;
- shared outside pair / unique cap center;
- critical-shell global-row reciprocal incidence;
- three common equidistant points / center uniqueness;
- strict opposite-cap global-K4 continuations;
- same-cap incompatible edges and endpoint radius equalities;
- strict-lap rank intervals; and
- dangerous-triple construction from a selected four-class.

The indexed results returned the current theorems listed above and the same
sibling U5/same-cap interfaces; they did not reveal a hidden direct producer.

## Historical broad recommendation (superseded)

The smallest useful next theorem is not another arbitrary-row existence
statement.  It should establish one of these, in preference order:

1. **Common outside pair:**
   `2 ≤ (((K₁.support ∩ K₂.support) \ oppCap2).card)`; this feeds the
   compiled adapter and closes immediately.
2. **U5 cross-incidence payload:** classify both rows relative to a parent
   support deletion and prove the exact incidences needed by one of the three
   current U5 terminals.
3. **Faithful-carrier pair collision:** prove that the live cap/cardinality
   constraints force two cap rows to choose the same outside pair; then apply
   `outsidePair_unique_capCenter`.

Option 1 is the narrowest interface.  Whether it is derivable is the actual
geometric/combinatorial question; the existing continuation and common
critical-shell system do not by themselves imply it.
