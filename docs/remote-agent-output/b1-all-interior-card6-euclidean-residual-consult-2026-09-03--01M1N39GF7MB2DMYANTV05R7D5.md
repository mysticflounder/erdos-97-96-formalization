# B1 all-interior card-six Euclidean residual consult

Consult: `01M1MRKYRMERK3JNSBEGXPK9VY`

Target:

```lean
Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm
```

Current target location in the audited tree: `ATail/FrontierLiveClosure/TwoDeletionCollision.lean`, around lines 1753–1761. The body remains `sorry`.

## Verdict

**No current source-clean terminal follows in the card-six all-interior live-pair branch. No genuine Euclidean realization of the entire source packet is presently known either. The correct answer is option (iii): a precise semialgebraic feasibility strategy, with a strict distinction between a named-role local projection and a genuine full-carrier source model.**

The tempting same-arc route is not merely missing a lemma. For the active two-point live pair, checked source geometry places the live blocker **inside** the strict second cap and strictly between the two endpoints in the ordered cap. The resulting two-center/equal-chord geometry is the alternating, opposite-side cell. It is compatible with convex Euclidean geometry and points toward a **negative** signed-area product, whereas the clean same-arc terminal requires a positive product.

The other clean terminal, `B1GlobalGapOrClosedTerminal`, is also not produced: the current packet supplies neither a third carrier on the relevant bisector nor a bisector fiber of cardinality at least three, while the available escape witness has row overlap at most two and therefore does not satisfy the universal overlap-at-least-three arm.

The first genuinely missing result is therefore an **ambient occurrence theorem**, not another local order wrapper:

```text
card-six all-interior source packet
  -> noncanonical third joint deletion
     OR B1GlobalGapOrClosedTerminal.
```

No such theorem is currently present or justified by the local Euclidean facts.

---

## 1. What the checked card-six source actually gives

### 1.1 Exact cardinality and roles

`B1PhysicalClassFiveSixNormalForm C` gives:

- no noncanonical third `ExactFourMutualOmissionJointDeletion` for the fixed ambient pair `C.u,C.v`;
- physical-class cardinality five or six;
- exact cover by the two canonical deleted points and the two live-row slices.

In the card-six arm, the new source-clean module from commit `bdf0d8b4e` proves:

```lean
Problem97.ATailFrontierLiveClosure.B1CardSixBoundaryRoleIngress
  .physicalRowChoice_value_image_eq_physicalClass
  .physicalRowChoice_support_card_eq_six
  .physicalRowChoice_boundaryIndex_image_card_eq_six
```

Thus the six named physical roles exhaust the physical radius class and have six distinct boundary indices.

This theorem does **not** prove a fixed quotient of all 16 B1 roles, any of the Wave-6 cross-row aliases, or a fixed cyclic order of the 16 roles.

### 1.2 Only one interior pair is selected

The source theorem

```lean
b1_cardSix_one_pair_subset_secondCapInterior
```

gives a finite choice among the canonical deleted pair, the `u` live slice, and the `v` live slice. It does not say that both live slices are inside the strict second cap.

The branch relevant here is one of the two live-pair cases. Any exact computation must keep the `u` and `v` cases separate, together with the deleted-pair alternative; it must not install a global “both live slices are all-interior” hypothesis.

### 1.3 Geometry of the active live pair

For two distinct active live-slice points in the strict second cap, current checked Lean proves:

- their actual live-row blocker is also in that strict cap;
- its ordered-cap index is strictly between the two endpoint indices;
- the physical apex and live blocker are distinct centers equidistant from the endpoint pair;
- the resulting shared-pair geometry is alternating rather than same-arc.

The relevant source is in `B1WinningSliceOrderOutcome.lean`, including the blocker-inside result around lines 257–276 and the strict-between argument around lines 615–727 in the audited revision.

This is a consistent Euclidean configuration: it is the ordinary convex two-circle/shared-chord separation pattern, not a contradiction.

---

## 2. Why the existing clean terminals do not fire

### 2.1 The same-arc terminal has the wrong sign

The older source-clean adapter

```lean
B1EscapeRowProvenanceStar.sliceSameBoundaryArc_of_subset_secondCapInterior
```

requires:

```text
entire two-point slice ⊆ strict second cap,
live-row blocker ∉ strict second cap.
```

The second premise is unavailable and is opposite to the proved blocker-inside theorem in the active all-interior branch.

Recent clean commits make the issue polynomially exact:

- `d2d559dac`:
  - `cyclicAdjacent_iff_signedArea2_mul_pos`
  - `not_cyclicAdjacent_iff_signedArea2_mul_neg`
- `a6ca6da55`:
  - `B1SliceSignedAreaProductPositive`
  - `b1SliceSameBoundaryArc_iff_signedAreaProductPositive`
- `843bcaaffa`:
  - `B1WinningLiveSliceSignedAreaProductPositive`
  - `b1WinningLiveSliceSameBoundaryArc_iff_signedAreaProductPositive`
  - `false_of_b1WinningLiveSliceSignedAreaProductPositive`

For a selected two-point slice `{p,q}`, physical apex `a`, and live blocker `b`, the relevant polynomial is

```text
signedArea2 p a b * signedArea2 q a b.
```

Positive product is exactly the clean winning-same-arc packet. The all-interior/between geometry is the alternating cell, so the corresponding source branch has negative product after the checked boundary/separation facts are translated through the new bridge.

Therefore a theorem concluding `B1WinningLiveSliceSignedAreaProductPositive C` from the all-interior packet would have the wrong geometric conclusion. The clean polynomial consumer is useful, but this source branch does not produce its antecedent.

### 2.2 `B1GlobalGapOrClosedTerminal` is not produced

The source-clean terminal

```lean
false_of_b1_global_gap_or_closed_terminal
```

accepts `B1GlobalGapOrClosedTerminal`, whose useful arms include:

- a third carrier on the relevant deleted-source bisector;
- a bisector fiber of cardinality at least three;
- a universal escape-row overlap-at-least-three arm.

The current B1 escape construction gives overlap at most two. It does not name the third carrier or the three-point fiber required by the first two arms. Exact card six and the no-third condition do not imply either of those positive ambient incidences.

### 2.3 No-third is negative information

`hnormal.1` excludes a noncanonical third joint deletion for the fixed pair `C.u,C.v`. It does not identify a new carrier, a new row, a third bisector center, or a positive boundary-order occurrence.

This is the central logical boundary: local selected-row equalities plus a negative nonexistence statement do not automatically yield one of the existing positive terminal packets.

---

## 3. Exact missing theorem

The smallest terminal-facing new mathematical statement is a true ambient occurrence dichotomy, not a wrapper around the target:

```lean
theorem b1_cardSix_allInterior_thirdDeletion_or_globalGap
    (C : B1GlobalTransportContext ...)
    (P : B1CardSixLocalRolePacket C)
    (E : B1EscapeRowProvenanceStar C)
    (hsix : (b1PhysicalClass C).card = 6)
    (hactive : -- exactly one u- or v-live pair returned by
               -- b1_cardSix_interior_pair_and_blocker,
               -- including the two interior endpoints,
               -- active blocker, and between/localization data) :
    (∃ third : ExactFourMutualOmissionJointDeletion
          C.R C.rho C.u C.v,
        third.deleted ≠ C.first.deleted ∧
        third.deleted ≠ C.second.deleted)
      ∨ B1GlobalGapOrClosedTerminal C
```

This theorem is **NEW MATHEMATICS / UNPROVED**. If it existed, the current normal form would finish without B2/B3:

```lean
rcases b1_cardSix_allInterior_thirdDeletion_or_globalGap
    C P E hsix hactive with hthird | hgap
· exact (hnormal.1 hthird).elim
· exact false_of_b1_global_gap_or_closed_terminal C hgap
```

The first missing antecedent for present theorem-bank consumers is precisely a positive ambient occurrence: either a noncanonical common deletion or one of the first two global-gap witnesses. No current local cap, isosceles, or exact-cover theorem supplies it.

---

## 4. Why existing computations do not answer the question

### 4.1 Fin-18 endpoint countermodel

The committed Fin-18 negative control is an abstract order/incidence projection. It replaces Euclidean CCW, exact distance rows, and survival semantics with propositions. It soundly refutes endpoint-order-only implications, but it is not a Euclidean source realization.

### 4.2 Fixed Wave-6 quotient profile

The profile `0123456789897978` / type `4840` uses the quotient aliases

```text
[Bc,uL,vL], [Bu,c0,vR], [Bv,c1,uR].
```

Current source audits show these are not globally forced. The general 16-role packet has only 78 proved disequalities and admits 94,381 labeled partitions, or 7,287 orbits under the certified completion swaps and `u↔v`. The selected ten-class profile is one empirical orbit.

Consequently a fixed ten-class QF_NRA result cannot establish the source theorem.

### 4.3 Existing prelaunch packet

The governed prelaunch lane produced source/audit artifacts but deliberately did not launch a solver:

```text
.codex/worktree-checkpoints/
  b1-all-interior-card6-qfnra-prelaunch-20260903.json

docs/audits/
  2026-09-03-b1-all-interior-card6-qfnra-prelaunch.md

scratch/runs/b1-all-interior-card6-qfnra-prelaunch-20260903/run-0001/
  PROFILE.json
  SOURCE-MAP.json
  SMT2-JOURNAL.smt2
  REPORT.md
  run_manifest.json
```

Recorded hashes:

```text
run manifest  a3a694d2881b2acce0111f649bc39a67f63b12b968ae3a87ab2255878d6b615e
checkpoint    a63022797f037f185028c595ee3cacde712e8f3ac9ace9c1c2c65e04de1081c4
PROFILE       0d2deed49397bb7d14e06e789f680b83130181d205036b07c4871d0be892af95
SOURCE-MAP    5d5bc0ff8b16218e7cfa51e0438ad6d94a2e3e6eb090e11741028c1bf725c4b2
SMT2-JOURNAL  f586edf0cab541bc23e6ffad8010064b0d4bf97242d4a1eb320760eef3dd7acf
```

Verdict remains `PRELAUNCH BLOCKED / NOT CERTIFIED`. There is no PIQD session, solver result, model, receipt, or source realization.

---

## 5. Precise semialgebraic falsification strategy

There are two different encodings, with different logical strength. They must not be conflated.

## 5.1 Named-role local core

This is the correct cheap falsifier for any proposed theorem that uses only the named B1 geometry.

### Roles

Use the 16 source roles

```text
A2,
Bc, Bu, Bv,
d1, d2, u0, u1, v0, v1,
c0, c1, uL, uR, vL, vR.
```

Do not fix a quotient. Give every role its own coordinate pair `X_r=(x_r,y_r)` and permit all aliases not forbidden by the 78 proved disequalities.

When the escape/survival data is used, add explicit witness roles for:

```text
escape source,
escape blocker,
four surviving support points,
retained deletion,
and any second-apex replacement row actually invoked.
```

### Convex independence with free aliases

For every role `r`, introduce a normal vector `n_r`. For every pair `r,s`, assert

```text
X_r = X_s
OR
dot(n_r, X_r) > dot(n_r, X_s).
```

The guard must be **coordinate equality**, not syntactic role equality.

This is source-backed by commit `e393aa0cb`:

```lean
Problem97.ConvexIndep.exists_strict_supportingFunctional
```

Together with `ConvexIndep.mono` and the Riesz representation theorem, it is the exact finite supporting-functional formulation of convex independence for the set of distinct named coordinate values.

### Metric rows

Write

```text
d2(i,j) := (x_i-x_j)^2 + (y_i-y_j)^2.
```

Encode all positive source rows as squared-distance equalities with positive squared radius:

- the six physical-class points at `A2`;
- the common row centered at `Bc`;
- the `u` live row centered at `Bu`;
- the `v` live row centered at `Bv`;
- the explicit escape/survival rows added as witnesses.

Use the actual B1 role packet rather than the Wave-6 ten-class aliases.

### Active all-interior branch

Split into the source alternatives. For the chosen `u` or `v` live pair `{p,q}` with blocker `b`, encode:

```text
p,q in strict second cap,
b in strict second cap,
b strictly between p and q in the chosen ordered-cap cell,
d2(A2,p)=d2(A2,q),
d2(b,p)=d2(b,q),
signedArea2 p A2 b * signedArea2 q A2 b < 0.
```

The last inequality is the exact polynomial negation of the winning same-arc packet for this two-point slice.

### What a SAT result means

A SAT model for this named core is a genuine Euclidean countermodel to any proposed **local** lemma that uses only these encoded fields—for example, a claim that blocker-inside/between geometry forces positive signed-area product.

It is **not** a countermodel to `false_of_b1PhysicalClassFiveSixNormalForm`, because the following ambient obligations are absent:

- exact no-fifth-point claims for radius classes over all of `D.A`;
- `hnormal.noThird` over every possible ambient joint-deletion witness;
- negation of every global-terminal witness over the ambient carrier;
- global K4/minimality/critical-shell semantics for unnamed carrier points.

## 5.2 Genuine full-carrier encoding `F_N`

A genuine source-level countermodel search must fix a carrier cardinality `N`, name every carrier point, and unroll all finite quantifiers.

No current source theorem fixes or bounds `N` for this residual. Therefore `F_N` is a falsification family: SAT for any one `N` refutes the claimed theorem, while UNSAT for a few values does not prove the arbitrary-cardinality result.

### Carrier and boundary

Introduce carrier points

```text
P_0,...,P_{N-1} : ℝ²
```

with pairwise disequality. For each `P_i`, introduce a strict supporting normal `n_i` and assert

```text
dot(n_i, P_i-P_j) > 0    for every j ≠ i.
```

This directly encodes `ConvexIndep A` for the complete finite carrier.

Represent the source role map by one-hot Boolean selectors

```text
role(r)=i.
```

Impose exactly the proved role disequalities and allow every other alias.

For source cap and boundary data, either:

1. enumerate cyclic order cells externally and impose positive orientation for every increasing triple in the selected order; or
2. encode a permutation by one-hot Boolean selectors and use `ite`-selected coordinates.

Choose the three Moser/MEC vertices, impose the source disk/boundary/nonobtuse constraints, and define the three cap blocks as the corresponding cyclic intervals. This makes strict second-cap membership and ordered-cap betweenness literal rather than abstract Boolean atoms.

### Exact physical class

Introduce `rho2>0` and Booleans `phys_i` with

```text
phys_i ↔ d2(A2,P_i)=rho2,
sum_i phys_i = 6.
```

Require the value image of

```text
{d1,d2,u0,u1,v0,v1}
```

to be exactly the `phys_i` set. This is the semantic lowering of the clean `B1CardSixBoundaryRoleIngress` theorem.

For every nonmember, assert `d2(A2,P_i) ≠ rho2`; this is the ambient exact-class condition missing from the 16-role projection.

### Critical shell system

For every carrier source `P_i`, introduce:

- a one-hot actual blocker `beta(i)`;
- a four-element support selector `S_i`;
- a positive squared radius `r_i`.

Assert:

```text
P_i ∈ S_i,
beta(i) ∉ S_i,
|S_i|=4,
d2(beta(i),p)=r_i for every p∈S_i.
```

Encode the exact `CriticalShellSystem` center/source and selected-row fields. Add the complete `CounterexampleData.K4` selectors required by the literal source definition rather than assuming that the B1 named rows exhaust the global K4 data.

### `no_qfree_at`

For each source `P_i`, finitely unroll

```text
¬ HasNEquidistantPointsAt 4 (A.erase P_i) (beta(i)).
```

For every four-subset `T` of the eligible carrier points after deletion, assert that the four squared distances from `beta(i)` are not all equal. Equivalently:

```text
OR over p,q∈T of d2(beta(i),p) ≠ d2(beta(i),q).
```

This is quantifier-free after `N` is fixed.

### Full deletion robustness at the physical apex

For every deleted carrier point `P_i`, introduce a four-support selector witnessing

```text
HasNEquidistantPointsAt 4 (A.erase P_i) A2.
```

All support points are distinct, omit the deleted point and center as required, and have one positive common squared radius.

### Exact B1 contexts

Instantiate, field by field:

- the two canonical joint-deletion packets;
- equal canonical blockers;
- live slices and their exact intersections with the physical class;
- the escape witness and its source deletion survival;
- overlap-at-most-two;
- direct/mirror cap blocks;
- the selected active all-interior pair and blocker-between data.

Every `Nonempty` row or deletion-survival field must be represented by explicit selected support variables, not by a Boolean placeholder.

### Exact no-third condition

For every carrier point `z`, define a quantifier-free Boolean macro `JD(z)` that is true exactly when `z` supplies the literal

```lean
ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v
```

packet. This includes:

- `z` in the physical class;
- `z ≠ C.u,C.v`;
- omission from both actual source rows;
- distinct source blockers;
- the required K4/common-deletion survivals at both blockers and at `A2`.

Each `HasNEquidistantPointsAt 4` subpredicate is a finite disjunction over four-subsets of the fully named carrier.

Then assert

```text
for every z:
  JD(z) -> (z=d1 OR z=d2).
```

This is the literal finite lowering of `hnormal.noThird`. It cannot be soundly expressed using only the 16 named roles because the four-point survivor rows may use unnamed ambient points.

### Negation of `B1GlobalGapOrClosedTerminal`

Compile the literal constructors of `B1GlobalGapOrClosedTerminal` into finite Boolean/polynomial macros over the complete carrier and assert the negation of every constructor:

- no eligible third carrier on the specified bisector;
- no eligible bisector fiber of cardinality at least three;
- retain the concrete escape row of overlap at most two, refuting the universal overlap-at-least-three arm.

Do not replace these with an informal “no extra point” flag. Every carrier point is named, so the first two negations can be exhaustively expanded.

### Falsification target

Finally assert the selected all-interior live-pair branch and the negative signed-area product, together with every structure field above.

A satisfying assignment, with exact replay, would be a genuine Euclidean model of the corrected B1 residual at cardinality `N`. It would refute any proposed clean terminal from the stated packet.

---

## 6. Validation rules

### SAT

SAT is meaningful only if all of the following are retained:

1. total carrier coordinate readback;
2. exact rational or algebraic replay of every polynomial assertion;
3. one-hot role/blocker/support/cardinality replay;
4. reconstruction of every Lean structure field named in the source manifest;
5. exhaustive replay of `no_qfree`, no-third, and global-terminal negations;
6. source hashes and an immutable run manifest.

The maintained PIQD/PIQC SMT backend can express QF_NRA and replay rational/Z3 algebraic models. The missing object is the source compiler and full-carrier ledger, not a solver backend.

### UNSAT

An SMT UNSAT result is formula-scoped discovery, not a Lean theorem. The current SMT session lane supplies no independently checkable real-algebraic UNSAT certificate comparable to DRAT/LRAT. Moreover, UNSAT for one fixed `N` does not cover arbitrary cardinality.

Promotion would require either:

- a checked symbolic/Lean proof extracted from the UNSAT core; or
- a source theorem reducing every configuration to one of finitely many checked `N`/order cases.

No such cardinality bound or hereditary subcarrier reduction is currently available.

---

## 7. Recommended next action

1. **Do not launch the fixed ten-class Wave-6 profile as the source answer.** Its cross-row aliases and fixed order are one diagnostic orbit, not source-forced.
2. Build a new source compiler around the free-alias role map and the clean supporting-functional/signed-area bridges.
3. Run a named-role SAT canary first. This cheaply falsifies local signed-area or cap-order claims and validates the compiler.
4. Only then instantiate `F_N` with a completely named carrier and exact ambient semantics. Start with the smallest `N` permitted by the source constraints, but record that there is no proven upper bound.
5. Treat SAT as a countermodel only after full exact replay; treat UNKNOWN or fixed-`N` UNSAT as no theorem.
6. In parallel, attack the genuine mathematical gap directly: prove or refute the ambient dichotomy

```text
noncanonical third joint deletion OR B1GlobalGapOrClosedTerminal.
```

That is the first theorem which would actually close the all-interior card-six residual with existing clean consumers.

## Final status

- **Clean terminal from current packet:** not found.
- **Blocker-outside/same-arc route:** source-incompatible in this branch.
- **Current signed-area state:** active all-interior pair is the negative-product/alternating cell; the positive-product consumer is clean but not produced.
- **Genuine full Euclidean source countermodel:** not known.
- **Existing prelaunch solver result:** none; prelaunch only.
- **Precise falsification route:** parameterized full-carrier `F_N` above.
- **First missing antecedent:** a positive ambient occurrence yielding either a noncanonical joint deletion or one of the first two `B1GlobalGapOrClosedTerminal` arms.
