# Problem 97 B1 consult: route after full MEC elimination

**Consult:** `01M1KN4B72QCVYTQQ0SG039DFS`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`  
**Verdict:** do not extend the timeout on the fully eliminated cubic system. Return to the one-height quadratic gauge, isolate the three completion-row/disk blocks, and add deletion-survival provenance only after the static geometry has been classified.

## Executive recommendation

The single highest-leverage route is:

```text
one-height Cartesian MEC gauge
+ shared-A-radius radical-axis rewrites
+ completion-row/disk block isolation
+ source-rich retained-deletion row only on surviving cells.
```

Do **not** make tangent-half-angle coordinates or eliminated blocker centers the primary decision procedure. Both reduce variable count but raise the important mixed row/convexity equations from degree two to degree four or worse.

A new exact rational 12-point control proves that the nonobtuse MEC triangle, six common-radius A-points, all three paired blocker equalities, disk containment, direct cyclic order, and strict convexity are jointly satisfiable. Therefore the bare MEC/physical/blocker core is not the contradiction. The remaining static candidate is the interaction of the six row-completion points/full four-point blocker rows; after that, the first genuinely new source input is retained q/w deletion survival.

## 1. `disk_apexCircle_iff_halfplane` does not apply to the six A-row points

The kernel-clean theorem has the form

```lean
Problem97.disk_apexCircle_iff_halfplane
    (P v₂ v₃ O : ℝ²) (R : ℝ)
    (hR : 0 ≤ R)
    (hP : ‖P - v₂‖ = ‖v₃ - v₂‖)
    (hv₃ : ‖v₃ - O‖ = R) :
    ‖P - O‖ ≤ R ↔
      inner ℝ (P - v₃) (v₂ - O) ≤ 0
```

With `(v₂,v₃)=(A,s)`, applying it to `xᵢ` requires

```text
dist A xᵢ = dist A s.
```

The authenticated row is

```text
A -> {x0,x1,x2,x3,x4,x5}.
```

Its five equality atoms synchronize the six `dist A xᵢ` values with one another. The support does not contain `s`, and the stated packet has no equality identifying the A-row radius with `dist A s`. Therefore the theorem has no nontrivial application to `x0..x5`. It applies to `P=s` only tautologically unless an additional radius-coincidence branch is proved.

This is not a minor technicality. The exact rational control delivered as file `01M1M0GZVX9YMDX2G5XNNNP4A2` has a common A-row radius different from `dist A s` while satisfying the full 12-point MEC/convex/pair core.

A split on `A-row radius = dist A s` would simplify one branch but is not source-forced and leaves the unequal-radius branch untouched. It should not be the main route.

### Correct replacement: a shared-radius radical-axis lemma

Keep the MEC height variable. In the gauge

```text
A=(0,0),  s=(1,0),  MEC center=(1/2,m),
MEC radius²=1/4+m²,
```

if `P=(x,y)` has the same A-radius as an anchor `X=(x₀,y₀)`, then

```text
P is in the MEC disk
iff
x₀²+y₀² - x - 2*m*y ≤ 0.
```

A Lean-ready scalar statement is:

```lean
theorem gauge_commonRadius_disk_sq_iff_radicalHalfplane
    (x y x₀ y₀ m : ℝ)
    (hsame : x^2 + y^2 = x₀^2 + y₀^2) :
    ((x - (1/2 : ℝ))^2 + (y - m)^2 ≤ (1/4 : ℝ) + m^2 ↔
      x₀^2 + y₀^2 - x - 2*m*y ≤ 0) := by
  nlinarith
```

The coordinate-free version follows by expanding

```text
‖P-M‖² ≤ ‖A-M‖²
```

and replacing `‖P-A‖²` by the common row radius.

This rewrite is valid for all six A-row points without relating their radius to `s`. Using one existing A-row point as the anchor adds no variable. It does not change the maximum degree of the one-height system—still quadratic—but removes six point-specific square sums from the disk inequalities and exposes one shared radical half-plane.

After full elimination of `m`, the corresponding inequality becomes cubic again. Thus the correct trade is one extra scalar variable for degree two, not zero MEC variables at degree three.

## 2. Algebraic formulation comparison

### A. One-height Cartesian formulation — recommended

Keep the 36 point coordinates and one MEC-height scalar `m`; substitute the gauge coordinates rather than solving `m=(u²-u+v²)/(2v)` into every disk atom.

Properties:

```text
maximum degree: 2
new denominator guards: none
row equalities: quadratic differences, already supported
convexity: quadratic signed areas
MEC disks: quadratic; six A-row disks use the shared-radius rewrite
replay burden: current exact rational polynomial replay
```

The prior one-height all-atom run was UNKNOWN, but it did not exploit completion/disk isolation or the common-radius radical-axis normal form. This remains the best decision language.

### B. Tangent-half-angle parameters — SAT-search fallback only

Because the directed hull edge is `A -> s`, strict convexity puts all later vertices in the corresponding open half-plane. For the six A-row points one can use one upper-semicircle chart rather than six independent chart splits:

```text
xᵢ = r*(1-tᵢ²)/(1+tᵢ²),
yᵢ = 2*r*tᵢ/(1+tᵢ²),
0 < t₀ < ... < t₅.
```

This replaces twelve physical coordinates by `r,t₀,...,t₅`, reducing the free-variable count by about five. The denominators `1+tᵢ²` are automatically positive over `ℝ`.

The cost is decisive:

- blocker equidistance on a physical pair becomes cubic after cancellation;
- completion-point versus physical-point row equations become quartic after clearing denominators;
- mixed physical/completion convexity determinants reach degree four or higher;
- exact replay must preserve rational functions and cleared-denominator provenance.

Use this only as an exact rational **witness generator**. A found rational witness would decisively refute the static MEC/full-row route. It is a poor primary UNSAT encoding.

### C. Eliminating blocker-row centers — reject

The row radii are already eliminated by squared-distance differences. Eliminating the three blocker centers removes six variables but requires solving two perpendicular-bisector equations per center. The denominators are 2-by-2 orientation determinants; substitution produces:

```text
four-point concyclicity determinants of degree 4,
disk/order conditions of degree about 5–6,
nonzero/sign guards for each determinant.
```

The centers are themselves carrier vertices constrained by convexity and the MEC disk, so this substitution is especially expensive. It is inferior to keeping the center coordinates.

### D. Gram/chord formulation — diagnostic only

Distance equalities and nonobtuse constraints become linear in Gram/EDM variables, but planarity requires rank at most two, PSD constraints, and orientation data. The variable count grows dramatically and no current exact PIQD replay path turns the resulting SDP/rank system into a smaller proof problem.

## 3. Source-rich split

The direct/mirror orientation, the mixed physical pair, and the adjacent-cap mate are already frozen in the current 18-label cell. Blocker localization is also already represented and is known to saturate rather than contradict the local cap bound. Splitting on these again will not add information.

The strongest missing source input is the retained-deletion part of `B1EscapeSourceContext`:

```text
source is outside the first-apex fibre,
and its actual blocker survives deletion of q or deletion of w.
```

The current source has clean splits such as

```text
b1_escapeSourceContext_or_goodCanonicalDeletionEndpoint
```

and the first-class/bad-source variants. The first-class and bad arms have no clean terminal and add mostly negative classification data. The `B1EscapeSourceContext` arm is different: it supplies a new exact four-point row after a named deletion, which can interact with the three existing blocker rows.

The first source-facing packet worth adding—only after the static row-completion test—is a concrete retained-row extraction:

```lean
structure B1RetainedDeletionRowPacket (P : B1EscapeSourceContext C) where
  deleted : ℝ²
  deleted_eq_q_or_w :
    deleted = C.R.interior_q ∨ deleted = C.R.interior_w
  row : SelectedFourClass (D.A.erase deleted)
    ((lateFirstApexSystem C.R).centerAt P.source.1 P.source.2)
  source_ne_deleted : P.source.1 ≠ deleted
  -- lifted ambient support membership, named omissions, and boundary labels
```

The `HasNEquidistantPointsAt 4` field already contains the mathematical witness; the new producer should preserve the selected support, deletion choice, and boundary labels in one packet. It should land only together with the finite/metric consumer described below, not as another unconsumed wrapper.

Canonical-deletion identities are most useful in the card-five refinements and are not the leading exact-card-six/MEC split. A first-apex-class membership split adds one circle equality but still has no clean contradiction. Retained survival is the smallest branch that adds a genuinely new full row.

## 4. Exact negative control

The file

```text
b1-post-mec-exact-rational-12point-core-2026-09-03.md
nthdegree file ID: 01M1M0GZVX9YMDX2G5XNNNP4A2
SHA-256: 559c056bb3079e6f4fda80a62b7c79c89ac6ba52b7a873663192b9cae7a415fa
```

constructs exact rational points in cyclic order

```text
A,s,x0,b0,x1,x2,x3,b1,b2,x4,o1,x5
```

with:

- a nonobtuse circumscriptive MEC triangle `(A,s,o1)`;
- all twelve points in its closed disk;
- six common-radius A-points;
- all three paired blocker equalities;
- all `C(12,3)=220` cyclic orientation determinants strictly positive.

Thus no computation should be spent asking whether the bare MEC/six-circle/three-pair core is feasible. It is exactly feasible. The first static unresolved layer is the six completion points and their three full four-point rows.

The current component experiment is consistent with this boundary:

- disk-only full 18-label system: UNKNOWN at `190/478/478`;
- nonobtuse-only: raw exact-metric SAT, but algebraic root objects are not accepted by the rational-only endpoint replay; later stages UNKNOWN.

The raw algebraic SAT is diagnostic only. Extending algebraic replay is a separate infrastructure project: Z3 and cvc5 use different algebraic syntaxes, and cvc5 cannot currently replay its own algebraic model through the generic PIQD path. Do not weaken the acceptance policy or build an ad hoc parser merely to promote this run.

## 5. Three bounded computational queries

### Query 1 — primary: quadratic disk/completion block isolation

Use the one-height Cartesian system and the shared-radius radical-axis rewrite. Keep all 18 labels, all row equalities, direct cyclic order, distinctness, and nonobtuse constraints. Treat the nontrivial disk atoms as five authenticated blocks:

```text
D_X  = {x0,x1,x2,x3,x4,x5}
D_B  = {b0,b1,b2}
D_0  = {c00,c01}
D_1  = {c10,c11}
D_2  = {c20,c21}
```

The disk atoms for `A,s,o1` are reconstructed boundary consequences and need not be solver assertions.

Run one immutable balanced batch, with no timeout extension on UNKNOWN:

```text
D_X ∪ D_B,
D_X ∪ D_B ∪ D_i             for i=0,1,2,
FULL \ D_i                   for i=0,1,2.
```

This is seven fixed masks in one governed query family.

Interpretation:

- `UNSAT` for any mask is a valid contradiction for the full cell and identifies a small disk/full-row core suitable for Lean.
- accepted exact SAT for all three `FULL \ D_i` masks shows that every two-completion-block subsystem is realizable; only the simultaneous three-row interaction can be terminal.
- accepted exact SAT for `FULL` would refute all static MEC/full-row routes and force use of deletion/minimality provenance.
- UNKNOWN remains inconclusive; do not resubmit the same mask at a longer identical timeout.

Use the exact 12-point model above as the positive semantic control for the `D_X ∪ D_B` geometry after deleting completion labels.

### Query 2 — full-row isolation: three 16-label relaxations

Construct three induced source-order systems by omitting one completion pair and its two completion equalities, while retaining the corresponding blocker and its paired physical equality:

```text
omit {c00,c01},
omit {c10,c11},
omit {c20,c21}.
```

Each system retains the nonobtuse MEC triangle, all remaining disk atoms, strict convexity, the six A-row equalities, and the two surviving full blocker rows.

Interpretation:

- `UNSAT` for one relaxation proves the full 18-label cell impossible and yields a theorem involving at most two full blocker rows plus one paired blocker.
- accepted SAT for all three proves that no proper two-full-row subsystem closes; a static proof must use all three completed rows simultaneously.
- if rational SAT is difficult but raw algebraic SAT appears, retain it as diagnostic and use the tangent/rational parameterization only to search for an exact witness—never as an UNSAT claim.

### Query 3 — source-rich CEGAR: retained q/w row

Run this only on static survivors or the smallest unresolved static cell.

Split the `B1EscapeSourceContext` survival field into its two named cases:

```text
q-deletion survival,
w-deletion survival.
```

For each case:

1. enumerate the surviving four-support choices at the finite incidence/order level;
2. enforce deletion omission, source membership, row cardinality, existing row-intersection bounds, and all source-clean Kalmanson/same-arc no-goods;
3. send only the finite survivors to the one-height QF_NRA system with the new row instantiated.

Interpretation:

- exhaustive UNSAT in both deletion cases closes the `B1EscapeSourceContext` branch and exposes a finite occurrence theorem;
- accepted SAT shows retained survival alone is not the missing global antecedent;
- a small set of survivors identifies the next exact source fact—typically first-apex-class membership, a blocker-cap location, or another deletion row—without enlarging the central B1 interface speculatively.

## Final ranking

1. **Implement the shared-radius radical-axis lemma and run Query 1.** This directly targets the disk family now known to cause the solver transition, while preserving a quadratic system.
2. **Run Query 2 if Query 1 does not expose a core.** It determines whether the simultaneous third full row is mathematically load-bearing.
3. **Only then add the retained q/w row through a source packet and run Query 3.** This is the smallest omitted global antecedent that adds new positive geometry.

Do not prioritize longer timeouts, full tangent-angle substitution, blocker-center elimination, or the unsupported application of `disk_apexCircle_iff_halfplane` to the six A-row points.
