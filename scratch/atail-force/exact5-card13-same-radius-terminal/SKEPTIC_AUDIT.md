# Skeptic audit: exact-five card-13 same-radius ordinal CNF

Date: 2026-07-21

## Verdict

**PROVEN:** No audited clause block has been falsified against the current
production contracts.  The exact-five shell, row-family geometry, fixed-blocker
synchronization, global-cover choices, same-radius synchronization, and ordinal
cancellation constraints are all necessary consequences of the intended live
source configuration.

**PROVEN:** The two CNFs are nevertheless only a **conditional finite
certificate**, not yet a source-faithful Lean proof.  They refute the two
asymmetric source-role orbits *inside an already canonical `(0,4,8)` boundary
frame*.  Boundary placement and reversal-stable Kalmanson transport are now
kernel-checked in scratch.  The common global labeling of all named roles and
row tables, the finite assignment construction, and kernel replay are still
open.

**CONJECTURED:** Once those ingress and replay obligations are formalized, no
additional mathematical hypothesis will be needed for the card-13,
same-radius, asymmetric subcase.  This audit did not prove that aggregate
source-to-CNF theorem.

This is not closure of the exact-five residual or of a production `sorry`.

## Preflight

Before assessing possible replacements or missing facts, the required theorem
bank registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

A focused indexed-corpus search was also run.  The banks contain related
row-slot and metric consumers, but no already packaged source-to-card-13-CNF
bridge that removes the open ingress below.

## Block-by-block audit

### 1. Exact-five shell shape: source-faithful

The encoder requires the complete second-apex class to have five points, to
omit its positive-radius center, to contain all three strict points of the
five-point physical cap, and to have exactly one point in each adjacent closed
cap after the center is removed.

**PROVEN:** This is not an overstrong `3+1+1` assumption.

- `LargeCapUniqueFiveSecondApexRadius.class_card_eq_five` gives the complete
  class cardinality.
- `three_le_capInterior_hits_of_largeCapUniqueFive` gives at least three
  strict physical-cap hits.
- Exact cap cardinality five makes the strict physical part have exactly three
  points, so all three are in the class.
- The production adjacent-cap one-hit theorems bound each of the two remaining
  regions by one.  The cap-role cover and total cardinality then force one hit
  in each region.
- Positive radius excludes `SECOND_APEX` itself.

The clauses saying that represented second-apex four-rows are subsets of this
five-class are also necessary: `profile.unique_K4_radius` identifies the
radius of every K4 row at that apex.

### 2. Cross-family circle and cap clauses: source-faithful

The encoder applies the following constraints to every represented selected
circle row, including rows chosen independently in different families.

**PROVEN:** Supports at two distinct centers intersect in at most two carrier
points.  This is the ordinary two-circle bound.

**PROVEN:** If two common support points are distinct from the two centers,
their boundary positions alternate with the centers.  Equal distances put
both centers on the perpendicular bisector of the common pair.  A
nonalternating placement would put the nearer center inside the triangle
formed by the farther center and the pair, contradicting convex position.
The numeric test in `encode.py` treats the ordinary interval and its wrapped
complement as the two cyclic arcs.

**PROVEN:** A fixed target pair occurs at at most two *distinct carrier
centers*.  All such centers lie on its perpendicular bisector, while convex
independence forbids three carrier points on one line.  The encoder correctly
counts centers rather than row-table instances at one center.

**PROVEN:** Two centers in one indexed cap cannot share a distinct pair
outside that cap.  This is the source content of
`CapSelectedRowCounting.outsidePair_unique_capCenter`; applying it across
independently selected row families is valid because the theorem depends only
on the two circle equalities.

No same-center cross-family intersection restriction is imposed except where
source uniqueness justifies synchronization.  Thus this block was not found
to strengthen the live geometry.

### 3. Fixed blocker image and row synchronization: source-faithful, adapter open

The finite table `m[center]` can be constructed by choosing one K4 four-row at
every carrier center.  At a center in the image of the fixed critical map, it
must instead be the fixed critical shell.

**PROVEN:** A blocker-image center has only one possible ambient K4 radius
class, namely its exact four-point critical shell.  If another K4 radius class
existed, deleting the source blocked at that center would leave it intact;
if it contained the source, its radius would equal the critical radius.  Both
alternatives contradict `CriticalShellSystem.no_qfree` and exactness.

**PROVEN:** Consequently, fixed critical shells belonging to different
sources but having the same center have the same complete support, and every
selected global-cover row at that center equals `m[center]`.

**PROVEN:** Excluding both robust apices from the blocker image is justified:
singleton deletion is K4-robust at those apices, whereas `H.no_qfree` says the
chosen blocker center fails after its source is deleted.

There is not yet one production theorem constructing the whole labeled table
and proving all synchronization clauses at once.  That is an **open packaging
obligation**, not evidence that the clauses are false.

### 4. Two global-cover row families: source-faithful, finite choice open

Each edge of `PhysicalGlobalCrossDeletionStar` says that, at every carrier
center, deletion of at least one edge endpoint leaves a K4 witness.  Choose a
four-row from one surviving witness.  It omits the deleted endpoint, so it
cannot contain both endpoints of that edge.

**PROVEN:** This constructs one row family per edge.  The two choices need not
agree away from the blocker image, and the encoder keeps them independent.

**PROVEN:** At a blocker-image center the unique critical shell itself must
omit at least one edge endpoint; otherwise deleting either endpoint would
destroy the only K4 class, contradicting the global cover.  Therefore the
cover row may be chosen equal to `m[center]`, as the encoder requires.

**PROVEN:** The final ordinal CNF does not contain the lazy strong-connectivity
cuts used by older search drivers.  Their absence weakens the finite formula
and cannot be the cause of UNSAT.

The simultaneous finite choice and reindexing of these two families remains
part of the open source-to-assignment theorem.

### 5. Same-radius exact-six and cover synchronization: source-faithful

At card thirteen the production residual gives cap cards `(5,6,5)`.  In the
same-radius arm, the checked scratch theorems
`firstApex_class_card_eq_six_of_sameRadius` and
`firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius` show that the
complete first-apex class has exactly six points and contains all four strict
points of the six-point first opposite cap.

**PROVEN:** The encoder's union of `m[FIRST_APEX]` and `b1` is exactly that
six-class.  The double-deletion row omits the two frontier sources, while
`m[FIRST_APEX]` contains them; hence the union contains six distinct points.
Both four-rows lie in the common ambient class, whose cardinality is six.

**PROVEN:** Any represented K4 row at the first apex that meets this complete
class has the same radius, so every point of the row belongs to the class.
The implication used to synchronize the two global-cover rows is therefore
necessary.  A disjoint row is allowed by the implication, although current
source uniqueness in fact rules out any other K4 radius.  The encoding is thus
no stronger than the source here.

### 6. Rank construction and Kalmanson cancellation: source-faithful, Lean bridge open

There are 78 unordered distance atoms on thirteen carrier points.  An actual
configuration can assign each atom the ordinal rank of its real distance
among the at most 78 distinct values, using values `0` through `77`; seven
bits and the bound `rank < 78` suffice.

**PROVEN:** Every encoded row equality and complete-shell equality becomes a
rank equality under this assignment.

**PROVEN:** For cyclically ordered `a<b<c<d`, the crossing diagonals satisfy

```text
d(a,c) + d(b,d) > d(a,b) + d(c,d)
d(a,c) + d(b,d) > d(a,d) + d(b,c).
```

If one positive term equals one negative term, cancellation gives the strict
comparison asserted by `UGT` for the remaining ranks.  Reversal of the cyclic
order preserves the crossing pairing and both inequalities.

The formula permits unrelated atoms to receive the same rank, but that is a
relaxation, not an overstrengthening: the source configuration supplies the
injective-by-distance-value assignment above.

The aggregate rank assignment and clause proof are not yet implemented in
Lean.  Z3's tactic export is an external equisatisfiable reduction, not the
missing kernel source map.

### 7. Direct/mirror exhaustiveness: conditional ingress, not established by the artifacts

The artifact names encode only

```text
direct  = asymmetricSourceLeft  (source, blocker, third) = (1,2,3)
mirror  = asymmetricSourceRight (source, blocker, third) = (3,2,1)
```

inside the same fixed cap frame with apices `(0,4,8)`.

**PROVEN:** Once the physical cap is canonically labeled `0,1,2,3,4` and the
source row's blocker strictly separates its source and third physical point,
these are the only two role orbits.  This is exactly the finite statement
`fin5_straddling_interior_orbits`.

**PROVEN:** The current ambient boundary theorem has two raw CCW placements:
`(0,4,8)` and `(0,5,9)`.  The two existing CNFs do not separately encode those
two placements.  Reflection `i |-> -i mod 13` maps the second placement and
all three cap blocks to the canonical constants, but reverses the supplied
CCW order.

**PROVEN:** The Kalmanson mathematics survives this reflection, and the
scratch theorem
`strictKalmanson_pair_reverseCyclicIndex13` now kernel-checks exactly this
claim.  Given an injective CCW `phi : Fin 13 -> ℝ²` with image the carrier,
it defines `psi i = phi (reverseCyclicIndex13 i)` and proves both strict
Kalmanson inequalities for every `a < b < c < d` in the reflected labels.  It
does not incorrectly assert that `psi` is CCW.  Its recorded axiom closure is
only `propext`, `Classical.choice`, and `Quot.sound`.

What remains open is transport of the full source packet--including cap
roles, the asymmetric straddling data, blocker table, and both cover
tables--through the same reflection and into one common canonical labeling.

Therefore `direct` plus `mirror` is **not yet a proved exhaustive ingress from
the live parent**, but chirality is no longer the obstruction.  Exhaustiveness
is conditional only on the remaining common-label role/table transport and
source-assignment construction.

## External certificate status

**PROVEN by artifact/hash inspection:** The present metadata hashes match
the current `asymmetric_ordinal_rank.py`, `bitblast_ordinal_cnf.py`, base
`encode.py`, and both DIMACS files.  `drat-trim` records `s VERIFIED` for the
two original CNF/DRAT pairs.

**PROVEN:** This establishes external UNSAT of the emitted DIMACS formulas,
not a Lean theorem about the source residual.  The Z3 source-formula-to-CNF
transformation and the LRAT proof have not been replayed by a Lean kernel
checker.

## Acceptance gate

The finite result becomes source-faithful only after all of the following are
kernel checked:

1. one canonical-frame packet combining the checked direct/reverse boundary
   placements, checked reversal-stable Kalmanson inequalities, and cap blocks;
2. global-index transport of the asymmetric straddling normal form and all
   named row roles to the two encoded role orbits;
3. construction of the fixed row table, both independent cover tables, exact
   shell, first-apex double row, and ordinal ranks from the live source; and
4. proof that this assignment satisfies the exact finite formula consumed by
   a kernel-accepted certificate replay.

Until then, the correct status is:

> **Externally DRAT-verified UNSAT within a source-motivated finite model;
> conditional on an unproved source-to-CNF ingress; not unsound on any audited
> block; no production closure.**
