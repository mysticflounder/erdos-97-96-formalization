# Exact-six mutual nonlinear MEC gate

Date: 2026-07-18

Status: **KERNEL-CHECKED TWO-HIT BLOCKER LOCALIZATION.  A TWO-PHYSICAL-HIT
ACTUAL ROW HAS ITS CONCRETE BLOCKER IN THE FOUR-POINT STRICT PHYSICAL CAP;
THE CARD-FOUR ARM LOCALIZES IT TO `physicalVertices`, AND THE CARD-THREE
INTERIOR-UNUSED ARM LOCALIZES IT TO `insert u physicalVertices`.  THE
SOURCE-FAITHFUL ONE-HIT EUCLIDEAN/MEC BRANCH REMAINS BOUNDED-SEARCH UNKNOWN.
NO EXACT WITNESS OR INFEASIBILITY CERTIFICATE WAS OBTAINED, AND NO PRODUCTION
`sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/exact6-mec-nonlinear-gate/`.  It does not edit production
Lean, shared plans, proof-blueprint state, git state, `ShellCurvature`,
`SurplusM44`, or protected finite-certificate work.

## Source-faithful input

The gate starts from the kernel-checked sibling manifest and physical-apex
split:

```text
ExactSixMutualCompleteRowManifest
ExactSixMutualRoleOrbit
physicalVertices_card_eq_three_or_four
adjacentClassHits_card_eq_one_of_physicalVertices_card_eq_three
exists_adjacentClassHit_of_physicalVertices_card_eq_four
```

Only four actual complete rows are represented:

1. the complete exact-five radius filter at `S.oppApex2`;
2. the continuation unused source's actual `H.selectedAt` row;
3. the mutual source's actual `H.selectedAt` row; and
4. the mutual target's actual `H.selectedAt` row.

No anonymous selected row or literal fourteen-row fixture is used.  In
particular, the provisional 15-equality `msolve` unit core from the literal
fixture plays no role in this result.

For the first six source-identity orbits, one card-three geometry can use the
following role maps, where `a,b,c` are the three physical exact-five strict-cap
vertices and the mutual pair is always `(a,b)`:

| Orbit | continuation first | continuation second |
|---|---|---|
| `continuationOrder` | `a` | `b` |
| `reverseContinuationOrder` | `b` | `a` |
| `sharesFirstAtSource` | `a` | `c` |
| `sharesFirstAtTarget` | `b` | `c` |
| `sharesSecondAtSource` | `c` | `a` |
| `sharesSecondAtTarget` | `c` | `b` |

The seventh orbit uses four distinct physical roles.  The numerical scripts
retain these names and the three concrete blockers; changing an orbit only
changes the continuation/source identity map, never the actual row
provenance.

## Exact nonlinear consequence

`ExactSixTwoHitBlockerLocalization.lean` proves:

```lean
actualBlocker_mem_physicalCapInterior_of_two_physical_hits
actualBlocker_mem_physicalVertices_of_card_four_two_hits
actualBlocker_mem_insert_unused_physicalVertices_of_card_three_two_hits
```

The first theorem assumes two distinct points `x,y` of `physicalVertices
profile` belong to the complete actual support

```lean
(H.selectedAt q hqA).toCriticalFourShell.support
```

and proves

```lean
H.centerAt q hqA ∈ S.capInteriorByIndex S.oppIndex2.
```

It uses the actual row radius equalities, the complete physical-apex radius
equalities, the actual blocker's carrier membership, and the production
`commonPhysicalPair_center_mem_secondCapInterior` theorem.  This is the
precise nonlinear/MEC-cap effect which an abstract Kalmanson metric cannot
see.

At exact cap six the strict cap has cardinality four.  Therefore:

- in the card-four physical arm, the blocker is one of the four physical
  vertices; and
- in the card-three arm where the off-class unused sixth point `u` lies in
  the strict cap, the blocker is one of `insert u physicalVertices`.

The theorem does **not** assert that either mutual row has a second physical
hit.  The manifest gives only the upper bounds

```text
mutual source row <= 2 physical hits
mutual target row <= 2 physical hits
unused row        <= 1 physical hit.
```

Thus the result converts every two-hit row into a finite cap-order/alias
case, while leaving the one-hit rows as the genuine continuous nonlinear
surface.

The focused Lean elaboration with warnings as errors exits zero.  All three
printed declarations have axiom closure exactly contained in:

```text
propext, Classical.choice, Quot.sound
```

The file has no `sorry`, `admit`, custom `axiom`, `native_decide`, or `unsafe`
declaration.

## Numerical one-hit searches

The numerical encodings normalize the physical apex to `o=(0,0)`, place the
physical exact-five strict-cap vertices on one circle about `o`, impose the
kernel card-three or card-four completion distribution, and construct every
critical support equality by rotations around its named actual blocker.

The optimization inequalities include:

- one common strict convex cyclic order for every named carrier point;
- a nonobtuse support triangle;
- containment of every named point in its circumdisk/MEC;
- exact six-point physical-cap placement;
- both adjacent closed cap cardinalities at least six;
- pairwise distinct named carrier roles in the tested identity cell;
- exact named exclusions from the physical radius filter and all three
  critical radius filters; and
- a numerical audit that deleting the represented source leaves no named
  fourfold radius at its blocker.

Every represented row reports its hits in all three caps.  When its blocker is
a strict cap-interior point, its own blocker-cap support count is explicitly
bounded by two.  Endpoint sharpening is marked inapplicable in the committed
cells because the represented blockers are strict interiors, not support-
triangle endpoints.

The bounded results were:

| Branch/cell | Budget | Best minimum margin | Verdict |
|---|---:|---:|---|
| card three, fixed one-hit cell | 400 generations, population 12, 24 workers | `-0.0108733878662` | `UNKNOWN_NO_HIT` |
| card four/four-distinct, fixed one-hit cell | 500 generations, population 12, 24 workers | `-0.0240069098211` | `UNKNOWN_NO_HIT` |
| card three, free complementary-cap cell | 1200 generations, population 18, 24 workers | `-0.00194905394483` | `UNKNOWN_NO_HIT` |
| card three, nearest legal cap-hit cell | 1600 generations, population 18, 24 workers | `-0.00787923981249` | `UNKNOWN_NO_HIT` |

The free-cap near-hit put three support targets in two blockers' own caps;
its negative strict-hull margin is the numerical trace of the cap-curvature
obstruction, not a valid candidate.  The nearest legal cell corrected those
row hit counts to at most two and still returned no hit.  None of these runs
is coverage, and no negative margin is evidence of infeasibility.

The earlier paired-row searches are not counted as nonlinear verdicts.  They
assigned the two-hit blockers to complementary caps, exactly the placement
the kernel localization theorem rules out.  Their failure was useful for
discovering the correct theorem split, but it is not an UNSAT result.

### Role-preserving one-hit cell and exact fixed-word probe (2026-07-20)

The older `search_single_physical_hit.py` is a useful one-hit relaxation, but
it does not retain a concrete `ExactSixMutualRoleOrbit`.  The new
`search_card3_continuation_order_one_hit.py` is the first role-preserving
subcell.  It fixes the card-three `continuationOrder` assignment

```text
mutual source = q0, mutual target = q2, unused physical hit = q1,
unused off-class source = u,
```

with actual-row physical intersections exactly `{q0}`, `{q2}`, and `{q1}`.
It checks the two mutual omissions, both unused-row continuation omissions,
and a legal fixed cap assignment with same-blocker-cap support counts `2,2,0`.
The recorded 400-generation/population-12/24-worker run has
`UNKNOWN_NO_HIT`, best minimum margin `-0.005325931709815055`; its closest
point simultaneously presses a lower-cap membership, MEC containment, and a
strict-hull atom.  This is not infeasibility evidence.

`qfnra_card3_continuation_order_one_hit.py` turns a supplied cyclic word of
that exact displayed-role contract into 547 QF_NRA atoms.  It provides a
necessary consistency guard before solver time is interpreted: replaying the
numeric near-miss word is externally exact `UNSAT`, but its four-atom core is
only a cap-order mismatch (`source_x2` was placed on the lower arc despite
its upper-cap assignment).  A cap-consistent canonical word reaches Z3/NLSAT
`UNKNOWN` at 30 seconds.  Neither result eliminates a source-valid cell.

This probe covers only the `(1,1,1)` physical-hit subcase of card-three
`continuationOrder`.  It omits the allowed `(2,1,0)` and `(1,2,0)` hit
distributions, all other role orbits, cap cells and cyclic words, exact
all-center `no_qfree`, full `CriticalShellSystem`, the retained parent packet,
global minimality, and `noM44`.  In particular, broad fixed-word enumeration
must wait for a source-valid coverage/occurrence map; it cannot be promoted to
the mutual-branch proof from a bounded numeric or isolated QF_NRA result.

## Equality ideal, inequalities, and full-parent boundary

The epistemic split is:

### Equality ideal

- **Exactly imposed by parameterization in the numerical scripts:** the
  physical-apex row equalities and all support equalities of the three actual
  source-indexed rows.
- **Numerically audited:** every other named point is off those four radii.
- **Not decided algebraically:** the coordinate equality ideal together with
  a fixed strict cap cell.  No `msolve`, Singular, CAD, SOS, or
  Positivstellensatz certificate is claimed here.

### Ordered/MEC inequalities

- **Kernel-checked consequence:** two physical hits localize the actual
  blocker to the strict physical cap.
- **Bounded numerical only:** feasibility of the named one-hit coordinate
  cells with strict hull, cap placement, and MEC inequalities.
- **Not coverage:** the scripts do not enumerate every blocker alias,
  completion identity, or cyclic cap cell.

### Full-parent hypotheses deliberately absent from the searches

- global K4 at every unrepresented center;
- a total `CriticalShellSystem` beyond the three displayed actual rows;
- the retained first-apex frontier and bi-apex robustness packet beyond the
  blocker/apex inequalities explicitly encoded;
- global deletion minimality / strong connectivity; and
- quantified `noM44`.

Therefore a future exact coordinate witness would refute only a local
four-row nonlinear implication, not the full parent theorem.  Conversely, an
UNSAT certificate for one fixed cell would eliminate only that cell unless a
kernel occurrence theorem covered all identities and cap orders.

## Correct next gate

Blindly increasing the differential-evolution budget is no longer the right
primary move.  The next source-faithful gate should:

1. split each mutual row into one-hit versus two-hit;
2. replace every two-hit blocker by the finite four-position localization
   above, then enumerate its legal alias and strict-between order cases;
3. enumerate the one-hit blocker caps and private-completion cap counts while
   enforcing the cap-local row bound before coordinate solving;
4. encode each fixed cyclic word as QF_NRA with free planar coordinates,
   exact squared-distance equalities, oriented-edge strict convexity, a
   circumcenter/MEC variable block, and the nonobtuse support-triangle
   inequalities;
5. reconstruct and independently substitute any SAT witness using exact
   rational or algebraic coordinates; and
6. treat UNSAT as closure progress only with an exact algebraic certificate
   plus a checked occurrence theorem covering the corresponding live cell.

The finite localization is a genuine reduction of the nonlinear gate.  It is
not yet a direct `False`, and the one-hit branch is still the live geometric
unknown.

## Artifacts

- `ExactSixTwoHitBlockerLocalization.lean`: kernel-checked nonlinear
  localization and exact-six finite-set refinements.
- `search_single_physical_hit.py`: initial card-three fixed one-hit cell.
- `search_four_physical.py`: initial card-four/four-distinct fixed one-hit
  cell.
- `search_card3_one_hit_free_caps.py`: free complementary-cap card-three
  discovery search.
- `search_card3_one_hit_near_cell.py`: nearest legal cap-hit cell.
- `search_card3_continuation_order_one_hit.py`: role-preserving card-three
  `continuationOrder` `(1,1,1)` one-hit subcell with named constraint logging.
- `qfnra_card3_continuation_order_one_hit.py`: exact QF_NRA check for one
  supplied cyclic word of that subcell.
- `search_card3_role_orbit_pairs.py` and
  `search_card4_four_distinct_pairs.py`: diagnostic paired-row searches whose
  invalid complementary-cap blocker premise led to the checked localization
  theorem.
- `search_three_physical.py`: superseded initial two-physical-hit prototype;
  retained only as a diagnostic predecessor and not used for any verdict.

## Closure effect

- **PROVED / KERNEL-CHECKED:** source-faithful two-hit blocker localization and
  exact-six finite alias sets.
- **BOUNDED NUMERICAL UNKNOWN:** tested one-hit strict-convex/MEC cells.
- **EXTERNALLY EXACT CELL CHECKS:** one invalid near-miss word is rejected by
  cap order alone; one cap-consistent word is QF_NRA `UNKNOWN` at 30 seconds.
- **NOT PROVED:** Euclidean/MEC infeasibility of any complete source-role
  orbit, or an exact local countermodel.
- **PRODUCTION `sorry` CLOSED:** none.
