# Detailed closure plan

## Assessment

The theorem is already below the useful combinatorial splitting point. Its parent has reduced the configuration to an exact physical five-class

[
C={u,x_u,\delta,v,x_v},
]

with the class traces forming the directed pentagon

[
u\to x_u\to\delta\to v\to x_v\to u,
]

and with `centerAt u = xv`. The present leaf says that the next blocker

[
c:=\operatorname{centerAt}(x_v)
]

is a carrier point in the strict second-cap interior but is **not** in (C). The other class-valued possibilities for (c) have already been split into the sibling `BlockerDeleted` and `BlockerV` leaves or excluded by the parent. 

I would **not** add another incidence-only case split. The repository’s A-core audit remains satisfiable after its current blocker, deletion, cap, overlap, and equality clauses; the recorded missing ingredient is exact metric or global geometry. Thus, the right architecture is:

1. derive a strong, source-clean geometric normal form for the off-class blocker;
2. package the large-cap consequences into a global deletion/row fan;
3. close that fan through either a new metric cap-order theorem or a bounded exact-geometric certificate.

The first two parts are quite concrete. The actual research gap is the final fan consumer. 

---

## 1. Normalize the leaf immediately

At the top of the proof, introduce short aliases:

```lean
let Hlate := lateFirstApexSystem R
let O := S.oppApex2
let C := SelectedClass D.A O P.rho

let Ku :=
  (Hlate.selectedAt P.u.1 P.u.2).toCriticalFourShell
let Kxu :=
  (Hlate.selectedAt _packet.xu hxuA).toCriticalFourShell
let Kxv :=
  (Hlate.selectedAt _packet.xv hxvA).toCriticalFourShell

let c := Hlate.centerAt _packet.xv hxvA
```

Also use a distinct name such as `del` for `P.jointDeletion.deleted.1`; reserve `d` for the next blocker `centerAt c`.

Extract the following local facts once:

```lean
have huA       : P.u.1 ∈ D.A := P.u.2
have hdelA     : del ∈ D.A := P.jointDeletion.deleted.2
have hcA       : c ∈ D.A := ...
have hOA       : O ∈ D.A := P.surface.ingress.packet.center₂_mem_A

have huClass   : P.u.1 ∈ C := P.huClass
have hxuClass  : _packet.xu ∈ C := ...
have hxvClass  : _packet.xv ∈ C := ...
have hdelClass : del ∈ C := P.jointDeletion.deleted_mem_class
have hvClass   : P.v.1 ∈ C := P.hvClass
```

The packet already stores the exact five-class expression, source-row trace, opposite-row trace, `centerAt u = xv`, and strict interiority of `{u,xu}`. The parent supplies `xv ∈ capInterior`, `c ∈ capInterior`, `c ∉ C`, and the exact class trace bounds for `Kxv` and `Kxu`. 

Prove and retain a distinctness bundle:

```lean
have hu_ne_xu  : P.u.1 ≠ _packet.xu := _packet.xu_ne_u.symm
have hu_ne_xv  : P.u.1 ≠ _packet.xv := ...
have hxu_ne_xv : _packet.xu ≠ _packet.xv := ...
have hc_ne_u   : c ≠ P.u.1 := ...
have hc_ne_xu  : c ≠ _packet.xu := ...
have hc_ne_xv  : c ≠ _packet.xv := ...
have hc_ne_O   : c ≠ O :=
  P.surface.secondApex_robust.centerAt_ne Hlate _packet.xv hxvA
```

The three `c ≠ classPoint` statements follow immediately from `_hblockerNotClass` and membership in (C). This will make all later `simp`, pair-cardinality, and three-point-cap contradictions substantially cleaner.

---

## 2. Prove exact bisector saturation for the edge ({u,x_v})

This is the first decisive local lemma.

Both (O) and (c) are carrier points equidistant from (u) and (x_v):

* (O) is equidistant because (u,x_v\in C);
* (c) is equidistant because `Kxv` contains both `xv` and `u`;
* (O\ne c);
* (u\ne x_v).

Convex position bounds the carrier points on the perpendicular bisector of two distinct carrier points by two. Therefore:

```lean
private theorem pentagonOffClass_xv_u_bisector_eq_pair
    ... :
    D.A.filter
        (fun z => dist z _packet.xv = dist z P.u.1) =
      ({c, O} : Finset ℝ²) := by
  ...
```

The proof should copy the pattern already used by `b1_live_bisectorSet_eq_pair`:

1. apply `Dumitrescu.perpBisector_apex_bound D.convex`;
2. show `c` and `O` belong to the filtered set;
3. show they are distinct;
4. combine the cardinality upper bound with `{c,O} ⊆ filter`.

The B1 module already has both the exact-filter pattern and a terminal consuming any third bisector carrier. 

It would be worthwhile to extract the duplicated argument into a general helper:

```lean
private theorem carrier_bisector_eq_pair_of_two_known
    {a b p q : ℝ²}
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (hpA : p ∈ D.A) (hqA : q ∈ D.A) (hpq : p ≠ q)
    (hpBisects : dist p a = dist p b)
    (hqBisects : dist q a = dist q b) :
    D.A.filter (fun z => dist z a = dist z b) = {p, q}
```

Then prove the corresponding thin terminal:

```lean
private theorem false_of_pentagonOffClass_third_xv_u_bisector
    (z : ℝ²) (hzA : z ∈ D.A)
    (hzNeC : z ≠ c) (hzNeO : z ≠ O)
    (hzEq : dist z _packet.xv = dist z P.u.1) :
    False := by
  have hzFilter : z ∈ D.A.filter ... := Finset.mem_filter.mpr ⟨hzA, hzEq⟩
  rw [pentagonOffClass_xv_u_bisector_eq_pair ...] at hzFilter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzFilter
  exact hzFilter.elim hzNeC hzNeO
```

Also saturate the preceding pentagon edge:

```lean
D.A.filter (fun z => dist z P.u.1 = dist z _packet.xu)
  = {O, _packet.xv}
```

Here (O) bisects (u,x_u) because both lie in (C), while (x_v) bisects them because `centerAt u = xv` and `Ku ∩ C = {u,xu}`. This second saturation will be useful when analyzing the row selected at (c).

---

## 3. Upgrade the `xv` row to an exact second-cap trace

Because (c) lies in the second cap, the generic ordered-cap theorem gives

[
|K_{x_v}\cap\operatorname{cap}_2|\le 2.
]

But (u) and (x_v) are two distinct members of that intersection. Hence:

```lean
private theorem pentagonOffClass_xvRow_secondCap_eq_pair :
    Kxv.support ∩ S.capByIndex S.oppIndex2 =
      {P.u.1, _packet.xv} := by
  ...
```

Similarly, since `centerAt u = xv` and (x_v) lies in the cap,

```lean
private theorem pentagonOffClass_uRow_secondCap_eq_pair :
    Ku.support ∩ S.capByIndex S.oppIndex2 =
      {P.u.1, _packet.xu} := by
  ...
```

The required upper bound is exactly `selectedFourClass_inter_capByIndex_card_le_two`. 

These equalities are stronger than the existing class-trace statements. In particular:

```lean
∀ q ∈ S.capByIndex S.oppIndex2,
  q ≠ P.u.1 →
  q ≠ _packet.xv →
  q ∉ Kxv.support
```

Since `_hsecond : 6 ≤ S.oppCap2.card`, this provides at least four carrier points whose deletion preserves the fixed row `Kxv` at center (c).

---

## 4. Add the missing ordered-cap metric bridge

The repository already proves one-sided distance injectivity on a strict ordered cap. Package its contrapositive into a reusable “equal distances straddle the center” lemma:

```lean
private theorem equalDistance_capPoints_straddle_center
    {m : ℕ} (L : CGN.OrderedCap m)
    (Packet : CGN.MecCapPacket D.A L)
    (Hside : CGN.MinorCapSideHypotheses Packet)
    (Hord : CGN.StrictCapOrder D.A L)
    {i j k : Fin m}
    (hij : i ≠ j) (hik : i ≠ k) (hjk : j ≠ k)
    (heq :
      dist (L.points i) (L.points j) =
        dist (L.points i) (L.points k)) :
    (j < i ∧ i < k) ∨ (k < i ∧ i < j)
```

The proof is finite linear-order reasoning: use totality and eliminate the two same-side possibilities with `CGN.oneSidedDistanceInjective_of_mecCapPacket`. That injectivity is already what underlies the cap row cardinality theorem. 

Instantiate it twice:

1. `xv` is equidistant from `u` and `xu`;
2. `c` is equidistant from `u` and `xv`.

After choosing one orientation of the second cap, these force exactly:

[
u<c<x_v<x_u
]

or its reversal

[
x_u<x_v<c<u.
]

Suggested result:

```lean
private theorem pentagonOffClass_forced_secondCap_order :
    (iu < ic ∧ ic < ixv ∧ ixv < ixu) ∨
    (ixu < ixv ∧ ixv < ic ∧ ic < iu)
```

This is the first genuine metric clause missing from the A-core incidence abstraction. It is probably not itself a contradiction—the local kite-shaped configuration may be geometrically realizable—but it sharply fixes the only useful relative order of the four known strict-interior points.

---

## 5. Reselect at the off-class blocker

Now define its own actual row:

```lean
let d := Hlate.centerAt c hcA
let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell
```

Collect:

```lean
have hdA : d ∈ D.A := Finset.mem_of_mem_erase Kc.center_mem
have hdNeC : d ≠ c := by
  intro h
  rw [h] at Kc.center_not_mem_support
  exact Kc.center_not_mem_support Kc.q_mem_support

have hdNeO : d ≠ O :=
  P.surface.secondApex_robust.centerAt_ne Hlate c hcA
```

The generic two-circle theorem gives:

```lean
have hKcClass :
    (Kc.support ∩ C).card ≤ 2 :=
  actualLateRow_secondClass_card_le_two
    R P.surface ⟨c, hcA⟩
```

That theorem applies to an arbitrary carrier source, not merely a source lying in the physical class. 

Since (|C|=5), at least three physical-class points are omitted from `Kc`:

```lean
have hthreeOmitted :
    3 ≤ (C \ Kc.support).card := by
  rw [Finset.card_sdiff]
  ...
  omega
```

### A useful immediate strengthening

Prove that `Kc` cannot contain two members of the strict-interior triple

[
I={u,x_u,x_v}.
]

Indeed, suppose distinct (a,b\in I) both belong to `Kc`.

* (d) and (O) are equidistant from (a,b);
* (d\ne O);
* (a,b) are strict second-cap interior points;
* two-center localization therefore places (d) in the second cap;
* `Kc` then contains the three distinct cap points (c,a,b);
* but a selected four-class centered in the cap has at most two cap members.

Package this as:

```lean
private theorem pentagonOffClass_Kc_strictTriple_card_le_one :
    (Kc.support ∩ {P.u.1, _packet.xu, _packet.xv}).card ≤ 1
```

This improves the raw class-intersection bound significantly:

* at least two of `u`, `xu`, `xv` are omitted from `Kc`;
* if `Kc ∩ C` has cardinality two, at least one of those two points is `del` or `v`.

The same two-center localization mechanism is already used in the source to place (c) in the strict cap. 

---

## 6. Construct two fixed-center deletion fans

This is, in my view, the strongest global package naturally available from this leaf.

### Fan A: cap deletions survive at (c) and (O)

For every

[
q\in\operatorname{oppCap}_2\setminus{u,x_v},
]

the exact cap trace of `Kxv` gives (q\notin K_{x_v}). Therefore deleting (q) preserves K4 at center (c). Full robustness of (O) preserves K4 there as well.

Thus:

```lean
∀ q ∈ S.oppCap2,
  q ≠ P.u.1 →
  q ≠ _packet.xv →
  HasNEquidistantPointsAt 4 (D.A.erase q) c ∧
  HasNEquidistantPointsAt 4 (D.A.erase q) O
```

There are at least four such (q).

For each one, construct:

```lean
Nonempty (CommonDeletionTwoCenterPacket D Hlate q c O)
```

using `nonempty_commonDeletionTwoCenterPacket`. The packet additionally records that the actual blocker of (q) is neither (c) nor (O), exact four-point rows at both centers, and overlap at most two. 

### Fan B: physical-class deletions survive at (d) and (O)

For every

[
q\in C\setminus K_c,
]

deleting (q) preserves `Kc` at (d), and robustness preserves K4 at (O). Therefore:

```lean
∀ q ∈ C \ Kc.support,
  HasNEquidistantPointsAt 4 (D.A.erase q) d ∧
  HasNEquidistantPointsAt 4 (D.A.erase q) O
```

There are at least three such (q), producing at least three packets

```lean
CommonDeletionTwoCenterPacket D Hlate q d O
```

with the same two centers (d,O).

These two fans are global information that the current named-local A-core encoding does not represent: one fixed row at (c) survives a four-source cap family, and a second fixed row at (d) survives a three-source physical-class family.

I would define a temporary scratch structure containing precisely:

```lean
structure PentagonOffClassFan where
  c d : ℝ²
  c_mem_A : c ∈ D.A
  d_mem_A : d ∈ D.A
  c_ne_O : c ≠ O
  d_ne_O : d ≠ O
  d_ne_c : d ≠ c

  xv_u_bisector :
    D.A.filter (fun z => dist z xv = dist z u) = {c, O}

  xvRow_cap :
    Kxv.support ∩ S.oppCap2 = {u, xv}

  cRow_class_card :
    (Kc.support ∩ C).card ≤ 2

  cRow_strictTriple_card :
    (Kc.support ∩ {u, xu, xv}).card ≤ 1

  forced_order : ...

  capDeletionFan : ...
  classDeletionFan : ...
```

Do not promote `false_of_PentagonOffClassFan` as another production `sorry`; develop its consumer in scratch until it is source-clean.

---

## 7. Add the pair-deletion survival classifier

The saturated ({u,x_v})-bisector gives a useful universal classifier.

For any carrier source (t), if both deletions of (u) and (x_v) fail at `centerAt t`, the selected row at (t) contains both (u) and (x_v). Its center is therefore a carrier point on their perpendicular bisector, hence equals (O) or (c).

* Equality with (O) is excluded by full robustness.
* Equality with (c=\operatorname{centerAt}(x_v)) forces the support at (t) to equal `Kxv.support`.
* Consequently, if (t\notin Kxv.support), equality with (c) is also impossible because every selected row contains its source.

So prove:

```lean
private theorem pentagonOffClass_u_or_xv_deletion_survives
    {t : ℝ²} (htA : t ∈ D.A)
    (htNot : t ∉ Kxv.support) :
    HasNEquidistantPointsAt 4 (D.A.erase P.u.1)
      (Hlate.centerAt t htA) ∨
    HasNEquidistantPointsAt 4 (D.A.erase _packet.xv)
      (Hlate.centerAt t htA)
```

The repository already has both ingredients:

* failure of two deletions is equivalent to both points lying in the selected support;
* equal actual blockers force equality of selected supports. 

Combining this with the exact cap trace colors every point of

[
\operatorname{oppCap}_2\setminus{u,x_v}
]

by survival of the (u)-deletion or the (x_v)-deletion. This is a more useful global object than another case split on whether a particular named class point lies in a particular row.

---

## 8. The final producer: recommended order of attack

### Route A — ordered-cap plus crossed-fan closure

This is the route I would try first.

Split on

```lean
P.surface.capGrowth
```

rather than treating `_hsecond` as the only cardinal input. The `secondOpposite` growth arm gives the exact carrier budget

[
|\operatorname{oppCap}_2|+6=|A|,
]

while the first-opposite and surplus growth arms carry different exact budgets. It would be unsound to infer the six-point complement merely from `_hsecond`; derive the complement cardinality separately in each growth arm. 

For each growth arm:

1. use the ordered-cap outside-pair injection to associate each cap center with a distinct outside support pair;
2. seed that injection with the exact outside pairs of `Ku` and `Kxv`;
3. use the forced order (u<c<x_v<x_u) to constrain where the two rows’ outside supports can occur;
4. combine the cap-deletion coloring with the actual-blocker fiber bound;
5. when two actual blockers coincide, use `selectedSupports_eq_of_actualBlockers_eq`;
6. force either:

   * a third carrier point on the ((u,x_v))-bisector;
   * a selected row with three points in the second cap;
   * two distinct prescribed joint deletions;
   * or an `IsM44` packet contradicting the retained no-`M44` hypothesis.

The ordered-cap library already supplies the two essential counting ingredients: a selected row centered in the cap has at most two cap points, and distinct cap centers cannot use the same pair of outside points. 

The most desirable endpoint is a third ((u,x_v))-bisector point, because the terminal from §2 is immediate. The next-best endpoint is two distinct prescribed joint deletions: the neighboring source-heavy proof already closes its sixth-class-point configurations exactly this way. 

### Route B — fixed-center common-deletion family theorem

If the ordered-cap count does not close all small profiles, prove a reusable theorem of the following form:

```lean
theorem false_of_three_physicalClass_commonDeletions_at_fixed_centers
    (hCcard : C.card = 5)
    (hKdC : (Kd.support ∩ C).card ≤ 2)
    (q₁ q₂ q₃ : ℝ²)
    (hqDistinct : ...)
    (hqClass : ∀ i, qᵢ ∈ C)
    (hqNotKd : ∀ i, qᵢ ∉ Kd.support)
    (packets :
      ∀ i, CommonDeletionTwoCenterPacket D Hlate qᵢ d O)
    (orderedData : ...)
    (minimalityData : ...)
    (noM44 : ...) :
    False
```

The single-packet reduction currently yields “robust at the physical apex or a critical shell.” In this leaf the robust arm is already known, so applying that theorem independently to each packet will be largely tautological. The new theorem must compare the **family** of packets: their fixed first row, the three different deleted class points, and their second-apex rows. 

The likely family argument is:

1. choose the physical (O)-row canonically as (C\setminus{q_i});
2. show the first row is always `Kc` or `Kxv` by selected-class uniqueness at a fixed critical center;
3. compare the three overlaps with the fixed row;
4. force either a five-point radius class at the nonphysical center or two disjoint K4 classes there;
5. obtain a new fully deletion-robust interior center;
6. feed the resulting three-center robustness into the retained frontier/minimality/no-`M44` data.

The existing common-deletion module already exposes canonical-row equality when a packet center equals a named critical blocker, making this comparison source-faithful. 

### Route C — bounded exact-geometric certificate

If Routes A and B leave a finite range of cap sizes or support-pair patterns, then use computation only after proving a sound finite reduction.

The finite state must include more than incidence:

* the forced cap order;
* signed orientation/convexity clauses;
* squared-distance equalities for all selected rows;
* the exact physical circle centered at (O);
* the off-class inequality for (c);
* the two fixed-center deletion fans;
* the exact cap-complement budget from the relevant growth arm;
* outside-pair uniqueness.

First run an exact witness search. A satisfying geometric witness means the proposed local metric lemma is false and more global deletion data must be added. An UNSAT result is useful only after the finite-slot completeness theorem is proved and the certificate is replayed through the project’s accepted checker boundary. This avoids repeating the current A-core situation, where SAT is only an incidence witness and is explicitly not a Euclidean realization or a Lean closure. 

---

## 9. Suggested final proof shape

Once the hard producer is available, the production theorem should become mostly normalization:

```lean
theorem false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker
    ... :
    False := by
  classical

  let Hlate := lateFirstApexSystem R
  let O := S.oppApex2
  let C := SelectedClass D.A O P.rho
  let Kxv :=
    (Hlate.selectedAt _packet.xv hxvA).toCriticalFourShell
  let c := Hlate.centerAt _packet.xv hxvA

  have hcA : c ∈ D.A := ...
  have hbisector :
      D.A.filter (fun z => dist z _packet.xv = dist z P.u.1) =
        {c, O} :=
    pentagonOffClass_xv_u_bisector_eq_pair ...

  have hcapTrace :
      Kxv.support ∩ S.oppCap2 = {P.u.1, _packet.xv} :=
    pentagonOffClass_xvRow_secondCap_eq_pair ...

  have horder :=
    pentagonOffClass_forced_secondCap_order ...

  let d := Hlate.centerAt c hcA
  let Kc := (Hlate.selectedAt c hcA).toCriticalFourShell

  have hKcClass :
      (Kc.support ∩ C).card ≤ 2 :=
    actualLateRow_secondClass_card_le_two
      R P.surface ⟨c, hcA⟩

  have hKcStrict :
      (Kc.support ∩ {P.u.1, _packet.xu, _packet.xv}).card ≤ 1 :=
    pentagonOffClass_Kc_strictTriple_card_le_one ...

  have hcapFan := pentagonOffClass_capDeletionFan ...
  have hclassFan := pentagonOffClass_classDeletionFan ...

  exact false_of_pentagonOffClassFan
    P _packet hbisector hcapTrace horder
      hKcClass hKcStrict hcapFan hclassFan
```

The target theorem should not itself contain the large finite case analysis. Keep the hard consumer separately testable and reusable by the `BlockerDeleted` and `BlockerV` siblings where possible.

---

## 10. Routes to avoid

Do not route this leaf through `false_of_exactFourMutualOmissionRigid221_minimalCore` or a blocker-collision theorem that still carries its own `sorry`; that merely moves the production gap.

Do not try to obtain two distinct joint deletions solely from the abstract five-cycle. In an exact (C_5), pairs of rows can have only one available common class deletion, so the successful nearby sixth-point construction does not automatically transfer to the off-class point.

Do not use `_hsecond` to assume the `ExactFourSecondOppositeCapGrowth` budget. The large-second-cap constructor retains the entire `P.surface.capGrowth` trichotomy; it must be split explicitly. 

Do not add another Boolean incidence clause and expect the A-core SAT result to flip. The missing bridge must expose real order, distance, convexity, minimality, or a genuinely global family of rows. 

---

## 11. Implementation order

The safest patch sequence is:

1. exact ((u,x_v))-bisector saturation;
2. exact `Kxv` and `Ku` second-cap traces;
3. generic equal-distance-straddles-center lemma;
4. forced order of `u,c,xv,xu`;
5. reselect at `c` and prove the two class-intersection bounds;
6. construct the two deletion fans;
7. prove the universal `u`-or-`xv` deletion-survival classifier;
8. develop the crossed-fan consumer in scratch;
9. wire the thin target theorem;
10. generalize any shared consumer to the `BlockerDeleted` and `BlockerV` leaves.

Steps 1–7 should all be source-clean and useful even if the first attempted global consumer fails. They substantially narrow the remaining mathematical gap without introducing another placeholder.

For validation, compile the focused module first, then run the repository’s serialized full build:

```bash
cd lean
lake env lean \
  Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean

cd ..
./scripts/lake-build.sh
```

The repository pins Lean 4.27.0 and its dependency revisions and explicitly advises against `lake update`. After closing the leaf, add a small audit file containing:

```lean
#print axioms
  Problem97.ATailFrontierLiveClosure
    .false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker
```

and verify that `sorryAx` is absent and that the proof has not silently delegated to either open sibling. ([GitHub][1])

**My strongest recommendation is therefore:** make the exact bisector, exact cap traces, forced four-point order, and the two fixed-center deletion fans the permanent local API; then target a single crossed-fan global theorem whose conclusion is either a third bisector carrier or two distinct prescribed joint deletions. That is the smallest closure architecture aligned with both the live Lean data and the repository’s computational audit.

[1]: https://github.com/mysticflounder/erdos-97-96-formalization "GitHub - mysticflounder/erdos-97-96-formalization · GitHub"

