# Rank-3 exact-five five-incidence consult

Consult: `01M1JEJSNZY1VD0JPJ86W15MX1`  
Requested source anchor: `a29989cab`  
Target:
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`

## Executive verdict

**No end-to-end acyclic closure is justified at the current interface.** The proposed second-apex reselection is mathematically sound as a new source-faithful reduction, but it is not an existing theorem. Its generic physical arm still bottoms out at the independent rank-2 sorry `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`, except for a separately produced exact-twelve tight subcase. The hard source-swap arm can be sharpened cleanly, including a valid branch-D proof that the replacement row omits `c1`, but the corrected large-cap/grid split still has no source-clean terminal. Branches A and B remain wholly open; branch C only reduces to a separated-pair or double-omission residual.

The correct current outcome is therefore a **minimal hard-source-swap residual packet plus one falsifiable order/metric experiment**, not a claimed proof of the target.

## Status of the proposed claims

| Claim | Verdict |
|---|---|
| Four-constructor `RobustApexFourIncidenceContinuationPacket`; all-positive arm closed | **PROVED/current Lean** (`af1ddf164`; static audit PASS) |
| `secondRow_crossCenter_metric_exclusive` | **PROVED/current Lean** (`a29989cab`; source-clean, currently unused) |
| Physical-or-hard-source-swap reselection | **Paper-proved / Lean-ready, not currently exported** |
| Hard arm gives full old/replacement classes, distinct radii, disjointness, and all positive classes `< 5` | **Valid, once the avoid-two selector and q-deleted-row conversion are added** |
| Hard arm automatically gives a second common point with the canonical post-`a` first-apex row | **REFUTED**; only `deleted` is forced |
| Branch D forces `c1 ∉ replacement` | **Valid with a new cap-order transport lemma and canonical swapped first-apex row** |
| Branch C gives `separatedPair(O,c2;a,c1)` or `c1` omitted from both c2 rows | **Valid by the same transport, but nonterminal** |
| Two full disjoint c2 classes imply `oppInterior2.card ≥ 5` or exact adjacent-cap grid | **Valid with explicit full-class/positive-radius hypotheses** |
| One class with three interior hits alone implies `oppInterior2.card ≥ 5`, `oppCap2.card ≥ 7`, `A.card ≥ 14` | **REFUTED as stated** |
| Large branch gives `oppCap2.card ≥ 7` | **Valid after combining the other class's baseline two interior hits and closed-cap endpoint facts** |
| Large branch gives `D.A.card ≥ 14` | **Only with a separate `oppCap1.card ≥ 6` premise** |
| Existing source-clean `oppIndex2` strict radial-crossing producer | **Absent**; only the `oppIndex1` API was found |
| Existing source-clean terminal for `dist e d < dist e a` or the large-card arm | **Absent** |

## 1. Source-faithful second-apex reselection

Let

- `a := normalForm.retained`,
- `d := deleted`,
- `c2 := S.oppApex2`,
- `K2 := normalForm.secondApexClass`.

The source already retains `normalForm.secondApex_robust`, the old row's `a ∈ K2.support`, `d ∉ K2.support`, positive radius, and the strict inequality

```text
dist c2 a ≠ dist c2 d.
```

The desired theorem should be introduced in a module below `Rigid221Closure`, for example:

```lean
structure ExactFiveDistinctSecondApexHardSourceSwap
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) : Type where
  replacement : SelectedFourClass D.A S.oppApex2
  old_radius_pos : 0 < N.secondApexClass.radius
  replacement_radius_pos : 0 < replacement.radius
  radii_ne : N.secondApexClass.radius ≠ replacement.radius
  old_full :
    N.secondApexClass.support =
      SelectedClass D.A S.oppApex2 N.secondApexClass.radius
  replacement_full :
    replacement.support =
      SelectedClass D.A S.oppApex2 replacement.radius
  old_class_card :
    (SelectedClass D.A S.oppApex2 N.secondApexClass.radius).card = 4
  replacement_class_card :
    (SelectedClass D.A S.oppApex2 replacement.radius).card = 4
  supports_disjoint :
    Disjoint N.secondApexClass.support replacement.support
  retained_mem_old : N.retained ∈ N.secondApexClass.support
  deleted_not_mem_old : deleted ∉ N.secondApexClass.support
  retained_not_mem_replacement : N.retained ∉ replacement.support
  deleted_mem_replacement : deleted ∈ replacement.support
  every_positive_class_small :
    ∀ ρ, 0 < ρ → (SelectedClass D.A S.oppApex2 ρ).card < 5
```

and the reduction:

```lean
theorem exactFiveDistinct_secondApex_physical_or_hardSourceSwap
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C) :
    (∃ Kphys : SelectedFourClass D.A S.oppApex2,
      N.retained ∉ Kphys.support ∧ deleted ∉ Kphys.support) ∨
    Nonempty (ExactFiveDistinctSecondApexHardSourceSwap R C N)
```

### Proof outline

1. Apply `N.secondApex_robust` after deleting `a`. Convert the resulting q-deleted exact-four witness into a `SelectedFourClass` `L` centered at `c2`. The q-deleted support omits `a`.
2. Split on `d ∈ L.support`.
   - If false, `L` is the physical witness avoiding both named points.
   - If true, `L.radius = dist c2 d`, while `K2.radius = dist c2 a`; the unequal-distance fact gives distinct radii and hence disjoint selected classes.
3. Under negation of the physical arm, prove every positive c2 class has cardinality `< 5`. If a class had at least five points, unequal distances ensure it contains at most one of `a,d`; deleting both leaves at least four points, from which one selects a `SelectedFourClass` avoiding both.
4. Since the old and replacement supports each have cardinality four and lie in positive selected classes of cardinality at most four, each support equals its full selected class. This gives exact class cardinality four and the full-class equalities.

### First current-source gaps

The mathematical implication is not false; the missing pieces are exported plumbing:

1. no reusable conversion theorem was found from the q-deleted `U5QDeletedK4Class`/robustness witness to a `SelectedFourClass` with a named support omission (a local constructor is straightforward); and
2. no generic exported selector was found of the shape

```lean
5 ≤ (SelectedClass A c ρ).card →
dist c x ≠ dist c y →
∃ K : SelectedFourClass A c,
  K.radius = ρ ∧ x ∉ K.support ∧ y ∉ K.support.
```

These should be proved as source-clean finite-set helpers. The common-deletion packet's arbitrary rows must not be identified with `K0/K1/K2` while doing this construction.

## 2. Physical arm and the rank-2 dependency

The generic physical arm is **not** discharged by the closed exact-twelve tight endpoint.

The acyclic dependency is:

```text
rank-3 five-incidence target
  -> new physical-or-hard-source-swap reduction
     -> physical witness avoiding a and d
        -> rebuild the physical three-center/common-deletion packet
           -> false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
```

`false_of_exactFiveDistinct_threeCenter_distinctFresh_physical` remains an independent rank-2 sorry. Therefore rank 2 is a prerequisite for closing the generic physical branch.

There is a separate conditional subroute:

```text
physical witness
  + D.A.card = 12
  + the exact tight-cover/BalancedTightCoverInvariant producer
  -> false_of_exactFiveDistinct_threeCenter_exactTwelveTightPhysical
```

The last endpoint is closed, but the extra tight-cover invariant is not a consequence of the bare physical witness in the current theorem bank. Thus it cannot replace the rank-2 consumer for arbitrary carrier cardinality. Do not rewrite the rank-3 target merely to call the rank-2 sorry; close rank 2 first or leave the rank-3 source reduction as an independent proved theorem.

## 3. Branch-D replacement omission and the correct separated-pair transport

The local countermodel showing that the replacement row may meet the canonical post-`a` first-apex row only in `d` does **not** refute `c1 ∉ L`; it already realizes `c1 ∉ L`. It refutes only an unconditional second-shared-point assertion.

The branch-D omission proof is valid after two source-faithful constructions:

1. Construct the canonical first-apex selected four-row after deleting `a`:

```text
Orow.support = insert d (K0.support.erase a),
```

where the underlying exact-five O-circle is the one whose deletion-`d` row is `K0`. In branch D, `d,c1 ∈ Orow.support`.
2. Choose one zero-cut complete boundary indexing from
   `Problem97.Census554.ZeroCutBoundaryIndexing.exists_with_capBlocks S`.
   Since `a,d ∈ S.oppInterior1` and the cut endpoints `O,c2` are outside that strict cap interval, direct/mirror cap blocks imply that `a` and `d` have the same `btw` bit across the cut `(O,c2)`.

The pure order helper should be factored into the low-level cyclic-pair module:

```lean
theorem separatedPair_congr_left_of_cyclicAdjacent
    {n : ℕ} {i j p p' q : Fin n}
    (hadj : cyclicAdjacent i j p p') :
    separatedPair i j p q ↔ separatedPair i j p' q := by
  -- unfold `cyclicAdjacent`, `separatedPair`; rewrite the first `btw` bit
```

Equivalently, avoid the `cyclicAdjacent` wrapper and assume directly

```lean
SurplusCOMPGBank.btw i j p ↔ SurplusCOMPGBank.btw i j p'.
```

A source-facing cap adapter is then:

```lean
theorem oppInterior1_cyclicAdjacent_across_oppApex1_oppApex2
    (B : BoundaryIndexing D.A)
    (hblocks : DirectBoundaryBlocks ... ∨ MirrorBoundaryBlocks ...)
    (ha : a ∈ S.oppInterior1)
    (hd : d ∈ S.oppInterior1) :
    cyclicAdjacent
      (B.indexOf ⟨S.oppApex1, ...⟩)
      (B.indexOf ⟨S.oppApex2, ...⟩)
      (B.indexOf ⟨a, ...⟩)
      (B.indexOf ⟨d, ...⟩).
```

Do not import the later B1 order module backward into Rigid221. The generic proof pattern currently visible there—`BoundaryOrderConvex` plus `cyclicAdjacent_of_boundaryOrderConvex_of_endpoints_not_mem`—should be factored to an import-safe cap/cyclic-order module, or the direct/mirror block inequalities can prove the adapter locally.

Now assume for contradiction `c1 ∈ L.support`.

- `Orow` and `L` share the pair `{d,c1}`. The existing
  `Problem97.ATailFrontierLiveClosure.selectedFourClasses_shared_pair_separated`
  gives

```text
separatedPair(index O, index c2; index d, index c1).
```

- Transport `d` to `a` using the cap-adjacency helper, obtaining

```text
separatedPair(index O, index c2; index a, index c1).
```

- Branch D has `a,O ∈ K1.support ∩ K2.support`, so the same existing theorem gives

```text
separatedPair(index c1, index c2; index a, index O).
```

- These are exactly the two rotated cuts rejected by the existing
  `separatedPair_rotated_incompatible`.

Therefore `c1 ∉ L.support`.

This is **paper-proved / Lean-ready**, not currently a complete exported theorem. The new obligations are the canonical swapped first-apex row and the cap-order transport; the separated-pair contradiction itself is already present and source-clean.

### Branch C

The same argument yields the proposed nonterminal split:

```text
separatedPair(index O,index c2;index a,index c1)
  OR
(c1 ∉ K2.support AND c1 ∉ L.support).
```

Indeed, membership in `K2` gives the separated pair from `K0,K2`; membership in `L` gives it from `Orow,L` followed by transport. If neither membership holds, obtain the double omission. No current theorem consumes either result to close branch C.

## 4. Correct large-interior versus exact-grid split

The valid theorem requires **two full positive-radius classes at `c2`**, not merely two arbitrary selected supports:

```lean
theorem two_full_secondApex_classes_largeInterior_or_grid
    (K L : SelectedFourClass D.A S.oppApex2)
    (hKpos : 0 < K.radius)
    (hLpos : 0 < L.radius)
    (hradii : K.radius ≠ L.radius)
    (hKfull : K.support = SelectedClass D.A S.oppApex2 K.radius)
    (hLfull : L.support = SelectedClass D.A S.oppApex2 L.radius)
    (hKcard : (SelectedClass D.A S.oppApex2 K.radius).card = 4)
    (hLcard : (SelectedClass D.A S.oppApex2 L.radius).card = 4) :
    5 ≤ (S.capInteriorByIndex S.oppIndex2).card ∨
    S.ExactFourTwoRadiusAdjacentCapGrid
      S.oppIndex2 K.radius L.radius
```

`Disjoint K.support L.support` may be supplied explicitly or derived from `hradii` and the two full-class equalities.

### Proof

- Public cap counting gives at least two own-interior hits in each full four-class. A usable public statement is the generic selected-class bound
  `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_card_sub_two`
  (`CapInteriorRadiusCounting.lean`, reported near line 84).
- If either class has at least three own-interior hits, disjointness plus the other class's baseline two hits gives at least five distinct points in `oppInterior2`.
- Otherwise both intersections have cardinality exactly two. The selected-class outside-interior part lies in the two adjacent caps, and each adjacent-cap intersection has cardinality at most one. Since two points remain outside the interior, each class has exactly one left-adjacent and one right-adjacent hit, which is precisely the two-radius adjacent grid.

The private helpers

- `selectedFourClass_capInteriorByIndex_card_ge_two`, and
- `selectedFourClass_inter_capByIndex_card_le_one`

were found private in `Balanced555FiniteConfiguration.lean`. Do not depend on them across modules. Either use the public selected-class counting/adjacent-cap bounds or promote generic wrappers to an import-safe module.

### Correct consequences

From the large branch:

```text
oppInterior2.card ≥ 5.
```

Using the closed-cap decomposition and its two distinct endpoints outside the strict interior gives

```text
oppCap2.card ≥ 7.
```

However

```text
D.A.card ≥ 14
```

does **not** follow from this split alone. The audited carrier theorem is
`carrier_card_ge_fourteen_of_both_opposite_caps_ge_six`; it additionally requires

```text
oppCap1.card ≥ 6.
```

Unless that premise is separately produced from `R`/the caller, the honest large residual is `oppInterior2.card ≥ 5` (and hence `oppCap2.card ≥ 7`), not `D.A.card ≥ 14`.

### `oppIndex2` grid roles

The cap-side identities are correct:

- `leftAdjacentCapByIndex_oppIndex2_eq_surplusCap`,
- `rightAdjacentCapByIndex_oppIndex2_eq_oppCap1`.

To identify the four hits as old-left `O`, old-right `a`, replacement-left `e`, replacement-right `d`, one must explicitly supply:

- old/replacement full-class cardinality four;
- positive distinct radii;
- `O ∈ K.support`, `a ∈ K.support`, `d ∈ L.support`;
- `O ∈ surplusCap`, `a,d ∈ oppCap1` (preferably strict `oppInterior1`);
- singleton/cardinality facts for each adjacent cell; and
- `d ∉ surplusCap` or an equivalent cap-disjointness fact to ensure the replacement-left hit `e` is not `d`.

The grid object itself does not name the representatives; extract its `FourHits` data and identify the witnesses using the singleton intersections.

The desired symmetric producer

```text
exists_fourHits_strict_cross_distance_oppIndex2
```

is not present. The bank only exposes the analogous `oppIndex1` route. After proving the symmetric theorem, the grid order gives

```text
dist O a + dist e d < dist O d + dist e a.
```

The exact-five O-circle gives `dist O a = dist O d`, hence

```text
dist e d < dist e a.
```

This inequality is a valid output, not a contradiction by itself.

## 5. Terminal search

No source-clean, import-acyclic terminal was found for either the strict inequality or the large-interior branch.

Important near misses:

- `U5QDeletedK4Class.three_exact_classes_tetrahedron_incompatibility` requires all five center incidences. The four-constructor continuation records exactly one missing incidence, so it cannot be applied.
- `balancedTightCover_secondRow_inter_secondInterior_card_ge_two` is available only after constructing `BalancedTightCoverInvariant` in the exact-twelve tight branch.
- `ConvexPerpendicularBisectorSides.false_of_three_distinct_equidistant_carriers` requires a third distinct carrier center equidistant from the relevant pair; branch D supplies only the two known centers.
- Generic Kalmanson consumers require additional ordered roles and row equalities. The single derived comparison `dist e d < dist e a` is geometrically consistent and has no opposite comparison in the current packet.
- The tempting `false_of_exactFiveDistinct_biApexRobust_postCardEleven` route is circular through `false_of_exactFiveDistinct_threeCenterNormalForm` and this target.
- Common-deletion packets, MEC/cap localization, and `CriticalShellSystem` survival facts do not currently provide a strict source-swap potential or a reverse comparison.
- `card ≥ 14` is not itself a contradiction at this target, and in any case its first-cap premise is not part of the corrected split.

Thus the source-heavy information needed for a terminal is presently discarded or unconnected: a complete cyclic order/equality certificate, an MEC/minimality obstruction, or a monotone blocker/source potential.

## 6. Highest-leverage falsifiable experiment

Run a **complete hard-source-swap exact-grid order/equality census**, first for branch D and then for branch C. This is cheaper and more decisive than immediately attempting nonlinear coordinates.

### Precise statement under test

> Every complete convex boundary order satisfying the branch-D hard-source-swap exact-grid cap blocks and the five source-faithful circle-row equalities contains a strict Kalmanson/equality cancellation.

Equivalently, test satisfiability of the negation: a boundary order and positive edge-distance variables satisfying all row equalities and all applicable strict Kalmanson inequalities.

### Named residual roles

At minimum retain:

```text
centers: O, c1, c2
canonical points: a, d, e
first-apex exact-five extras: p, q
middle-row extras: s, t
old c2 interior hits: u, v
replacement c2 interior hits: x, y
```

Rows/equalities:

```text
T0 at O:       {a,d,c1,p,q}        (exact five-radius class)
K0=T0\{d}:    {a,c1,p,q}
Orow=T0\{a}:  {d,c1,p,q}
K1 at c1:     {O,a,s,t}
K2 at c2:     {O,a,u,v}
L  at c2:     {d,e,x,y}, with radius(L) ≠ radius(K2)
```

Retain branch-D omissions `c1 ∉ K2`, the proved candidate `c1 ∉ L`, full-class/disjointness, all named distinctness, and the direct/mirror cap blocks:

```text
a,d in oppInterior1;
O,e in the surplus adjacent cell;
u,v,x,y in oppInterior2.
```

### Solver layers

1. Enumerate all direct/mirror cyclic orders compatible with the cap blocks and role distinctness.
2. Union-find all distance symbols identified by the five circle rows.
3. Generate every strict K1/K2 Kalmanson inequality allowed by each order. Reduce by the equality closure.
4. Use the existing unit-comparison cycle miner where possible; send remaining multi-term constraints to exact rational LP/Farkas.
5. For any survivor, add rank-two Euclidean distance-matrix/Cayley-Menger and orientation constraints in QF_NRA. Only after that add finite `CriticalShellSystem` blocker/minimality/no-qfree constraints.

### Controls

- **Positive SAT control:** omit the cap-block/cyclic placement layer and recover the known local Euclidean/set source-swap model whose `Orow ∩ L = {d}`. This checks that the encoding has not smuggled in the desired contradiction.
- **Order-only control:** use a regular convex polygon with unconstrained row equalities to verify the Kalmanson orientation/sign convention.
- **UNSAT control:** insert a known three-row/two-K2 selected-row cycle from the theorem bank and require the miner to recover its exact cancellation.

### Interpretation

- **UNSAT in every cap-order cell:** extract the smallest common equality/Kalmanson certificate and formalize it through `GenericRowNogoodCertificate.WeightedKalmansonCancellationData` or a small generic selected-row theorem. This would provide a genuine source-clean terminal for the grid branch.
- **SAT order/equality survivor:** this falsifies every proof using only full-class incidence, cap blocks, circle equalities, and Kalmanson order. The surviving model becomes a durable counterexample to that route; the next experiment must add MEC/minimality/blocker provenance.
- **SAT even after planar/convex and source constraints:** the proposed grid-closure route itself is false.
- **UNSAT only after source/MEC constraints:** minimize the extra constraints; that minimal unsatisfiable core is the correct new geometric theorem to formalize.

## 7. Ranked implementation sequence

1. **Finite source plumbing.** Add source-clean q-deleted-row-to-`SelectedFourClass` conversion and the five-point avoid-two selector. Prove `exactFiveDistinct_secondApex_physical_or_hardSourceSwap` without changing the target proof.
2. **Close rank 2.** Prove `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`. Do not merely make the rank-3 sorry call this existing sorry.
3. **Import-safe cap/order bridge.** Factor the generic boundary-convex/cyclic-adjacency lemma to a low module; add `separatedPair_congr_left_of_cyclicAdjacent` and the `oppInterior1` adapter.
4. **Canonical swapped first-apex row.** Construct `Orow = T0.erase a`; prove branch-D `c1 ∉ L` and the branch-C separated-pair/double-omission split.
5. **Correct cap split.** Prove the two-full-class `oppInterior2.card ≥ 5 ∨ ExactFourTwoRadiusAdjacentCapGrid` theorem. Promote private helpers only if the public selected-class bounds are insufficient. Keep `card ≥ 14` conditional on a separately proved first-cap bound.
6. **Symmetric grid API.** Add the source-clean `oppIndex2` four-hit/radial-crossing theorem and derive `dist e d < dist e a` with exact role identification.
7. **Run the falsifiable grid census before inventing a terminal.** Formalize only a certificate or a theorem suggested by the minimized UNSAT core. Preserve any SAT survivor as a countermodel artifact.
8. **Treat A/B/C explicitly.** The target may be closed only after source-clean consumers exist for A, B, both C residuals, and both D large/grid residuals. Do not hide these in a wrapper or a new sorry.
9. **Finally rewrite the target.** Only after all arms have proved consumers should `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` become the exhaustive dispatcher.

## Minimal final residual packet

The smallest honest unified residual is a hard source-swap packet retaining the original source context rather than another local row wrapper:

```lean
structure ExactFiveDistinctFiveIncidenceHardSourceSwapResidual
    (R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F)
    {deleted center : ℝ²}
    (C : CommonDeletionTwoCenterPacket D H deleted center S.oppApex2)
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (fresh : ℝ²)
    (rows : ThreeCenterCommonDeletionExactRows ...)
    (P : RobustApexFourIncidenceContinuationPacket ...) : Type where
  replacement : SelectedFourClass D.A S.oppApex2
  old_full : N.secondApexClass.support =
    SelectedClass D.A S.oppApex2 N.secondApexClass.radius
  replacement_full : replacement.support =
    SelectedClass D.A S.oppApex2 replacement.radius
  old_card_four : (SelectedClass ... N.secondApexClass.radius).card = 4
  replacement_card_four : (SelectedClass ... replacement.radius).card = 4
  old_radius_pos : 0 < N.secondApexClass.radius
  replacement_radius_pos : 0 < replacement.radius
  radii_ne : N.secondApexClass.radius ≠ replacement.radius
  supports_disjoint : Disjoint N.secondApexClass.support replacement.support
  retained_not_mem_replacement : N.retained ∉ replacement.support
  deleted_mem_replacement : deleted ∈ replacement.support
  every_positive_secondApex_class_small :
    ∀ ρ, 0 < ρ → (SelectedClass D.A S.oppApex2 ρ).card < 5
```

The old row's retained/deleted incidences and all cap/MEC provenance remain derivable from `N`, `R`, and `C`; duplicating them as packet fields is optional. Derived refinements—branch-D `c1 ∉ replacement`, the C split, large/grid, and the strict cross-distance—should be theorems about this packet, not constructor assumptions.

## Final status language

```text
OPEN — verified source-faithful reduction, no acyclic terminal.

The five-incidence leaf reduces to an independent rank-2 physical branch or
an exact hard second-apex source swap. In the hard arm the two c2 classes are
full, disjoint, positive, and distinct-radius; branch D also forces the
replacement row to omit c1 once the strict-cap cyclic transport is retained.
Two full classes give either at least five second-cap-interior points or an
exact oppIndex2 adjacent grid, but no current source-clean theorem closes the
large arm or contradicts the grid comparison dist e d < dist e a. Branches A
and B remain open, and branch C remains nonterminal. The next decisive step is
a complete cap-order/Kalmanson satisfiability census of the hard grid packet.
```
