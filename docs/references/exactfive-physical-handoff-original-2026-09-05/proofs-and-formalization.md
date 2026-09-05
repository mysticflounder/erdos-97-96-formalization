# Exact-five physical residual: circle-power exclusions, admissible-pair selection, and an exact local negative control

**Date:** 2026-09-05  
**Repository:** `mysticflounder/erdos-97-96-formalization`  
**Audited revision:** `50cd6586d101df8c27d4cfc2c11ccc3683ffe803`  
**Status:** The full physical exact-five contradiction is **not closed**. This checkpoint proves additional geometric exclusions in prose, specifies a stronger source-pair selection, and supplies an independently replayed exact local model that refutes an insufficient terminal. The scalar Lean scripts have not been elaborated.

## 1. Current proof boundary

At the audited revision, `P97/ATail/FrontierLiveClosure/Rigid221Closure.lean` still has both direct admissions:

```lean
false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence
```

The source blob remains `77e357f15b4c3bc7278f5af5f53d9c8851bfe315`.

The previous source-controlled second-row refactor remains the preferred first integration step. Its proof draft is included unchanged as `ExactFiveRetainedDoubleDeletion.lean`. It uses the original frontier's simultaneous second-apex deletion witness to select a row omitting both original sources, avoiding the five-incidence choice. Replacing the row requires rebuilding the dependent packet and regenerating its strict fresh source; the old fresh source cannot be reused without a new omission proof.

This is an elimination of an unnecessary proof route, not a proof that every arbitrary five-incidence packet is independently contradictory.

The existing balanced-555 certificate closes the **tight three-row-cover** child. `Balanced555FiniteConfiguration` additionally requires the exact singleton intersection, two disjointness facts, and a literal cover of the carrier minus the deleted source. Cardinality twelve alone does not supply these fields. `Balanced555FiniteUnsat` uses `native_decide` for its checkpoint-zero formula identification, in addition to its checked replay and mirror transport; this handoff does not label that path kernel-only.

## 2. Notation and source hypotheses

Let `O` be the first physical MEC apex, `P` the second, and `U` the surplus apex. Let

\[
C=\operatorname{SelectedClass}(A,O,r),\qquad |C|=5,
\]

and let `I` be the strict interior of the cap opposite `O`.

The original sources `a,d` are distinct members of `C∩I`. The physical second row omits both. A fresh source `z` is outside `C` and the three retained rows. Write

\[
b=\beta(a),\qquad e=\beta(z),
\]

with canonical rows `K_b,K_e`. Both physical apices are fully single-deletion robust. The original oriented packet implies `d,z∉K_b`, and `a∈K_b`.

The double-hit case is

\[
a,d\in K_e.
\]

Existing cap localization, the cap two-hit bound, and the circle-intersection bound give

\[
e\in I,\qquad K_e=\{a,d,z,t\},
\]

where `z,t` lie outside the **closed** first cap. The previously proved radius-drop argument gives `s<r`, where `s` is the radius of `K_e`.

The fact that a source is omitted by a row whose center equals that source still gives a centerwise equidistant witness. It does not make that center a member of the erased carrier. All remaining-center counts must treat that distinction explicitly.

## 3. New theorem: exterior hits are strictly inside the first-apex radius circle

### Statement

Let `q,w∈C∩I` be distinct. Suppose a carrier center `e≠O` satisfies

\[
|eq|=|ew|=s.
\]

If another carrier point `z` is on that circle and outside the closed first cap, then

\[
\boxed{|Oz|<r.}
\]

### Proof

Bisector localization puts `e` in the same strict cap. Ordered-cap one-sided injectivity puts it strictly between `q,w` in cap order.

Apply a Euclidean isometry and, if needed, exchange `q,w`, obtaining

\[
O=(0,0),\quad e=(h,0),\quad q=(u,v),\quad w=(u,-v),
\]

with `h>0` and `v>0`. Equality of the distances at both centers gives the reflected coordinates. Since `e` is between `q,w` in the strict cap and `O` is outside the cap, the ordered-cap subchord side theorem places the two centers on opposite sides of the line `qw`. Thus

\[
0<u<h.
\]

The same source-global subchord theorem places every carrier point outside the closed first cap on the `O` side of the chord. It cannot lie on the chord, by convex independence and the distinct carrier points `q,w`. Therefore, writing `z=(x,y)`, we have `x<u`.

The circle equations give

\[
r^2=u^2+v^2,\qquad
(x-h)^2+y^2=(u-h)^2+v^2.
\]

Subtracting yields the exact identity

\[
|Oz|^2-r^2=x^2+y^2-(u^2+v^2)=2h(x-u)<0.
\]

As the radii are nonnegative, `|Oz|<r`. QED.

### Physical consequence

For the double-hit row `K_e={a,d,z,t}`,

\[
|Oz|<r,\qquad |Ot|<r.
\]

The entire support lies in the closed disk about `O` of radius `r`, and the two exterior-cap points lie strictly inside that disk. Consequently the double-hit subcase with `|Oz|≥r` is contradictory.

This does **not** imply `|Oe|<r`. A row-radius decrease and a center-distance decrease are different assertions.

## 4. New theorem: the double-hit disk excludes all three MEC support vertices

### Statement

Under the preceding hypotheses, if `L,R` are the endpoints of the first cap, then

\[
\boxed{|eO|>s,\qquad |eL|>s,\qquad |eR|>s.}
\]

### Proof at the opposite apex

The acute-apex lemma from the previous checkpoint says

\[
\langle q-O,w-O\rangle>0.
\]

In the reflected coordinates above, this is `u²-v²>0`. Hence

\[
\begin{aligned}
|eO|^2-s^2
 &=h^2-((h-u)^2+v^2)\\
 &=2u(h-u)+(u^2-v^2)>0.
\end{aligned}
\]

### Proof at the two cap endpoints

The cap order is `L<q<e<w<R`, after choosing its orientation. The ordered-cap nonacute inequality at `q` gives

\[
\langle L-q,e-q\rangle\le0.
\]

Therefore

\[
|eL|^2
 =|eq|^2+|Lq|^2-2\langle L-q,e-q\rangle
 \ge s^2+|Lq|^2>s^2.
\]

The argument at `w` proves `|eR|²>s²`. QED.

### Closed physical subcase

A fresh source on the supporting triangle cannot belong to a double-hit row through `a,d`. Thus

```text
fresh is a MEC support vertex
+ its actual row contains both original strict-interior sources
→ False.
```

This is a geometric contradiction, not an appeal to an unproved many-center consumer.

## 5. Stronger source selection: a minimum admissible pair is consecutive in the class

This result must be used **upstream**, before fixing the dependent source pair. It does not silently strengthen the arbitrary pair in an existing residual.

Set `J=C∩I`. Consider all ordered distinct pairs `(q,w)∈J×J` whose simultaneous deletion preserves K4 at the robust second apex `P`. This finite family is nonempty by the exact-five interior-frontier construction. Choose a pair minimizing `dist(q,w)` in this family.

### 5.1 Consecutiveness in the strict first-class slice

There is no point `p∈J` strictly between `q,w` in cap order.

For otherwise the cap nonacute inequality for `q,p,w` gives

\[
|qp|^2+|pw|^2\le|qw|^2.
\]

Both subchords are positive, hence each is strictly shorter than `qw`.

Full robustness at `P` after deleting `p` supplies a four-row omitting `p`. The source cap geometry says that distinct strict first-class points have different distances to `P`, so that row cannot contain both `q,w`. It therefore omits one of them. Deleting that omitted endpoint as well as `p` leaves the row intact, producing a shorter admissible pair. This contradicts minimality.

The conclusion is consecutiveness **within `J`**, not within the entire cap or carrier. Non-class points may lie in the gap.

### 5.2 No first-class point can be a second bisector center

If a carrier center `e≠O` bisects the selected pair and `e∈C`, localization and cap order put `e∈J` strictly between `q,w`. This contradicts 5.1. Therefore

\[
\boxed{e\notin C.}
\]

Equivalently, every second carrier bisector center for this chosen pair is a non-class strict-cap point.

### 5.3 The entire double-hit case disappears when the first closed cap has five points

If the first closed cap has cardinality five, its strict interior has cardinality three. The exact-five first-class interior bound gives `|J|≥3`, so the whole strict interior equals `J`.

Any second carrier bisector center would then belong to `C`, contradicting 5.2. Thus `O` is the **only carrier center** equidistant from the minimizing admissible pair.

In particular:

- no other carrier-centered row can contain both sources;
- the two actual blocker rows mutually omit the other source;
- their actual blockers are distinct;
- no fresh actual row can be a double-hit row.

This closes the double-hit child under this cap-size-five hypothesis after explicit pair reselection. It does not close the omission children.

More generally, a surviving double hit forces `I\C` nonempty. Since `|J|≥3`, the first closed cap then has at least six points. With the robust second-cap and surplus-cap lower bounds, the carrier has at least thirteen points.

### 5.4 Exact source reconstruction requirements

A formalization should:

1. retain an ordered-cap representation of the same first cap;
2. form the finite admissible-pair set and minimize its distance image;
3. prove 5.1 and 5.2 for that pair;
4. use `ExactFiveInteriorCriticalPairFrontier.ofInteriorPair` for the new pair;
5. preserve the original `F`, exact-five radius, minimality, no-M44 and unique-radius fields;
6. prove the new interior-pair first-apex obstruction using `retainedPair_doubleDeletion_obstructsFirstApex`;
7. reclassify the new actual blockers rather than assuming they equal the old ones;
8. in the cap-size-five arm, prove distinctness and both omissions directly as above;
9. rebuild the source-controlled second row and regenerate the strict fresh source.

For larger caps, the new blockers may still coincide at a non-class center. Do not route that branch through an adapter that discards the minimum-pair property and then continue using the property as though it survived.

## 6. The total critical system forces a new MEC-vertex blocker

The following identifies a genuinely global witness missing from the local model below.

A selected circle centered at a carrier point cannot contain all three noncollinear supporting-triangle vertices. If it did, uniqueness of the circle through three noncollinear points would make its center the MEC circumcenter. Nonobtuseness puts that circumcenter in the convex hull of the three vertices. If the carrier center is one of them, center omission already contradicts the claimed row; otherwise convex independence excludes the center from that convex hull.

Hence the retained blocker row `K_b` omits a supporting-triangle vertex `V`. Section 4 says `K_e` omits **every** supporting-triangle vertex.

The full `CriticalShellSystem` supplies

\[
h=\beta(V),\qquad V\in K_h.
\]

If `h=b`, canonical support equality contradicts `V∉K_b`; if `h=e`, it contradicts `V∉K_e`. Both robust physical apices also differ from every actual blocker. Consequently

\[
\boxed{h\notin\{O,P,b,e\}.}
\]

Moreover `V` is strictly outside the small `e` disk, so `K_h` is not confined to that disk.

This is stronger provenance than an arbitrary fifth-center witness: its source is a MEC support vertex. It is **not yet a terminal contradiction**. The missing next theorem must consume this new source-owned row, together with the original rows and global hypotheses, without cycling back to the same admitted physical theorem.

## 7. Exact local negative control with genuine MEC and K4 at every named center

The companion `exact-evidence.md` contains complete rational coordinates, a standalone independent checker, and its reproduced output. No search or construction code is needed to replay the checker.

### 7.1 Verified geometry

The model has thirty distinct rational points. All 840 supporting-edge orientation tests are strictly positive. Every point lies in the unit disk, and exactly `O,L,R` lie on its boundary. Those three form a strictly acute triangle.

There are explicitly checked positive weights on `O,L,R` summing to one and with weighted vector sum zero. For any proposed disk center `J`,

\[
\sum_{V\in\{O,L,R\}}\lambda_V|V-J|^2=1+|J|^2.
\]

Thus every enclosing disk has radius at least one; equality forces center zero. The unit circle is genuinely the unique minimum enclosing circle, not just an arbitrary disk containing a local point picture.

The closed cap sizes, indexed by opposite vertex, are

```text
opposite O:  9
opposite R: 13
opposite L: 11.
```

The strict first-class slice has exactly three points `{a,d,v3}`.

### 7.2 Exact source and row roles

Use

```text
first physical apex   O
second physical apex  R
surplus apex          L
retained source       a
deleted source        d
fresh source          z
retained blocker      z
fresh/deleted blocker e.
```

The exact first-apex class is

\[
C=\{v_0,a,d,v_3,v_4\}.
\]

It is the only heavy positive class at `O`, and has exactly five points. The old rows are

```text
K0 = C.erase d                         centered at O
Kb = {a,zrow1,zrow2,zrow3}             centered at z
K2 = {L,Rrow1,Rrow2,Rrow3}             centered at R.
```

All three omit `d,z`; `K2` also omits `a`. The retained source lies in `K0∩Kb`. Deleting `a,d` simultaneously preserves K4 at `R` and destroys it at `O`.

At `e`, the unique heavy positive class is

\[
K_e=\{a,d,z,t\}.
\]

It has exactly four points and radius `s<r`. The two named original sources and center `e` are strict first-cap points, while `z,t` lie outside that closed cap. Both exterior points satisfy the new circle-power conclusion `|Oz|,|Ot|<r`.

At `z`, the unique heavy class is exactly `Kb`. Thus the three named blocking claims hold:

```text
deleting a fails at z;
deleting d fails at e;
deleting z fails at e.
```

The alias `fresh = retained blocker = z` is permitted by the current exact-row packet. It must not be counted as a remaining carrier center after deleting `z`.

### 7.3 Every named point has K4—but this is not a full counterexample

All seven named points

```text
O, L, R, a, d, e, z
```

have K4. In fact `O,L,R,a,d` each have a complete five-point class and are fully single-deletion robust.

This specifically refutes the suggestion that adding only a K4 row **centered at the retained source** to the previous reduced local picture would finish the contradiction. This model has that row and also the analogous row at the deleted source.

However, global K4 fails at the other **23** carrier points. The only unique-four centers are `e,z`; their canonical supports together cover just seven points and omit all three MEC support vertices. Hence the model has no total critical-shell system, and in particular cannot supply the MEC-vertex blocker forced in Section 6.

It is NOT `CounterexampleData`, NOT a minimal counterexample, and NOT a refutation of either full Lean leaf. The global no-M44 field was not certified as a Lean statement. This is an exact counterexample only to the listed local weakening.

### 7.4 A separate closest-pair control

A separate eleven-point rational example has the genuine enclosing-circle geometry, the double-hit row, and a strictly shortest original pair among its three strict first-class points. Its bisector center is outside the first class. Thus shortest-pair geometry alone does not exclude **off-class** bisector centers.

The second-apex robustness/admissibility package is not asserted for that eleven-point example. It does not refute Section 5. The thirty-point model above is not claimed to use a minimizing admissible original pair.

## 8. Exact formalization targets

The included scalar candidate `ExactFiveCirclePowerScalar.lean` proves the algebraic cores, but has not been elaborated:

```lean
circle_power_identity
first_power_eq_of_second_circle
first_radius_sq_lt_of_second_circle_of_chord_side
first_center_outside_second_disk
leg_lt_base_of_nonacute
```

Recommended source-facing targets, all as new theorems rather than assumed fields:

```lean
outsideCap_hit_dist_firstApex_lt_of_interiorPair
supportTriangle_dist_gt_of_interiorPair_circle
exists_minimalAdmissibleInteriorPair
minimalAdmissibleInteriorPair_consecutive_in_class
minimalAdmissibleInteriorPair_bisector_not_mem_class
minimalAdmissibleInteriorPair_no_other_bisector_of_cap_card_five
exists_supportTriangleSource_freshActualBlocker_of_doubleHit
```

Keep the pure geometry module upstream of `Rigid221Closure`. For the first target retain the global subchord side conclusion, not just a cap-local order on the three named points. For the minimum-pair targets retain the actual admissibility predicate and the second-apex witness. For the last target use the *total* canonical system `H`; an existential local circle at `a,d,z` is insufficient.

## 9. Source/API crosswalk

Current status was checked in `Rigid221Closure.lean` at the pinned revision. Certificate scope and trust were checked in:

```text
FrontierLiveClosure/Balanced555FiniteConfiguration.lean
FrontierLiveClosure/Balanced555FiniteFormula.lean
FrontierLiveClosure/Balanced555FiniteUnsat.lean.
```

The following cap and canonical-row APIs were inspected in the preceding pinned-source work and are the intended bridge targets. Reconfirm their current signatures during elaboration:

```text
FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
CGN.index_strictly_between_of_equidistant
CGN.CGN6b_nonacute_of_minorCapChainModel
CGN.StrictCapOrder.subchord_open_side_iff_A
CGN.CGN6norm_minorCapChainModel_of_mecCapPacket
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
firstApex_marginal_inter_secondClass_card_le_one
FirstApexExactFiveInteriorFrontier.ExactFiveInteriorCriticalPairFrontier.ofInteriorPair
FirstApexUniqueRadiusResidual.retainedPair_doubleDeletion_obstructsFirstApex
ATailMinimalUniqueFourCover.isUniqueFourCenter_centerAt
ATailMinimalUniqueFourCover.source_mem_uniqueFourClass_centerAt
selectedSupports_eq_of_actualBlockers_eq.
```

## 10. Remaining mathematics, not hidden implementation work

After the source-controlled-row refactor, the physical strict-fresh contradiction remains open.

The geometric work here eliminates:

- double-hit rows of radius at least `r` (previous checkpoint);
- double-hit rows whose fresh source has first-apex distance at least `r`;
- double-hit rows whose fresh source is a MEC support vertex;
- after minimum-admissible-pair reselection, double-hit rows on the first-cap-cardinality-five child.

The surviving double-hit child has an inner fresh source, an off-class strict-cap blocker, and at least six points in the first cap under the minimum-pair normalization. The total critical system forces additional rows through supporting-triangle vertices. A source-complete terminal for those rows is still missing. The one-hit and zero-hit/omission children also remain open.

No infinite descent has been proved. Strict decrease of one row radius does not, by itself, reconstruct the same source configuration at that radius. Do not substitute a new admitted `False` theorem for this missing renewal/terminal argument.

## 11. Delivery and verification

No repository files were modified. No local Lean/Lake executable is available, and direct container downloads failed DNS. There was no fresh project build, axiom printout, or live-spine regeneration. The included Lean files are proof-script candidates, not checked theorems.

Nthdegree is listed as installed and enabled, but discovery in this conversation still provides no callable nthdegree namespace. The formalization request is saved in this bundle and was **not delivered**. No posting ID exists for this request.

The exact numeric checks are independently replayable. The bundle manifest hashes the delivered files. The file `exact-evidence.md` also hashes the embedded coordinate and checker payloads so that extraction can be verified before execution.

## 12. Acceptance and rejection tests

Accept a new producer only after focused elaboration and a transitive axiom audit. Keep approved native certificate trust separate from the expected source-clean small-lemma trust. A coordinator still depending on the physical admission is not axiom-clean merely because its new producer is.

Reject any patch that:

- interprets the thirty-point model as global K4 or as a total `H`;
- says all named K4 rows alone rule out the small double hit;
- strengthens class consecutiveness to whole-carrier consecutiveness;
- silently changes the source pair or reuses freshness after reselection;
- assumes the minimum pair's blockers remain the old blockers;
- invokes the balanced-555 certificate from cardinality twelve alone;
- counts an erased source-center as a remaining carrier center;
- calls radius decrease a descent without proving a renewal theorem;
- describes the new MEC-vertex blocker as a contradiction by itself;
- claims full exact-five closure before the physical and omission consumers are proved.
