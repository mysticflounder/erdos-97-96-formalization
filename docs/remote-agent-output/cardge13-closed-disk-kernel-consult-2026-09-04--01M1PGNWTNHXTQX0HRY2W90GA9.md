# Card-at-least-thirteen two-radius leaf: closed-disk kernel audit

**Consult:** `01M1NVJHJ11769F4ZA9HA3E6E7`  
**Target:** `Problem97.ATailFrontierLiveClosure.false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen`  
**Requested source lineage:** `f3a7dbe63` and current descendants  
**Status:** source-clean reduction identified; no end-to-end closure yet

## Verdict

The correct disposition is **B, with a partial C**.

The new closed-disk theorem is a valid, low, kernel-clean terminal for a sharply defined **boundary-shared-pair cell**. However, neither the current exact-card-13 ingress nor its direct/mirror `DRExactThirteenValuation.LabelMap` alternatives force such a cell. In particular:

1. No current direct or mirror DR theorem produces two MEC-boundary row centers `B,P`, a selected row at `B` containing `P,X,Y`, and a selected row at `P` containing the same distinct pair `X,Y`.
2. Direct/mirror orientation and cap-profile data do not determine selected-row supports. The first missing source fact is a row-role/incidence occurrence, not another metric identity.
3. The generic choice `X = R.interior_q`, `Y = R.interior_w`, `P = S.oppApex2` is invalid. `FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior` localizes a carrier center equidistant from that pair to the strict first-opposite interior; the other apex cannot be that center.
4. A current exact abstract direct cell has the first-apex row containing the other apex and two further points, but neither named second-apex row contains that same pair. Thus the row/cardinality/order interface does not imply the disk pattern. This is an interface-level negative control only: its true MEC has only a diameter pair on the boundary and it does not instantiate `SurplusCapPacket`, `CounterexampleData`, or global `D.K4`.
5. A different checked terminal is already latent for one fixed labeled exact-13 cell:
   - `Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress.exists_center9FourSupportRow_of_globalK4`;
   - `Problem97.ATailFrontierLiveClosure.CardGeThirteenCenter9K4RowDomain.false_of_center9_fourSupportRow`.

   The first theorem discharges the global-K4 row at positional center 2/raw center 9. The remaining missing binder is the source-to-finite-row realization `CardGeThirteenCenter9K4RowDomain.FixedFiveRows boundary`. This fixed-cell route is not a proof that every non-disk cell closes.

Accordingly, the next useful work is:

- formalize a small source-clean wrapper from a boundary-shared-pair row occurrence to the closed-disk theorem;
- enumerate the actual direct/mirror **row-incidence cells**, not merely orientation/profile cells;
- emit for each cell either a checked disk occurrence or a checked mapping into an existing fixed finite certificate family.

## 1. Current exact-card-13 ingress

The source-clean exact-cardinality route is:

```text
cardGeThirteenPacket_fresh_or_exactThirteenTight
  → exact cover/card-13 arm
  → ExactThirteenBranchIngress.of_twoRadiusBranch
  → ExactThirteenBoundaryBlocks.of_twoRadiusBranch
  → exists_profile_of_boundaryBlocks
  → direct_labelMap_of_profile_boundaryBlocks_with_boundary
       or
     mirror_labelMap_of_profile_boundaryBlocks_with_boundary.
```

The important declarations are:

```text
Problem97.ATailFrontierLiveClosure.cardGeThirteenPacket_fresh_or_exactThirteenTight
Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress.of_twoRadiusBranch
Problem97.ATailFrontierLiveClosure.ExactThirteenBoundaryBlocks.of_twoRadiusBranch
Problem97.ATailFrontierLiveClosure.exists_profile_of_boundaryBlocks
Problem97.ATailFrontierLiveClosure.DRExactThirteenValuation.direct_labelMap_of_profile_boundaryBlocks_with_boundary
Problem97.ATailFrontierLiveClosure.DRExactThirteenValuation.mirror_labelMap_of_profile_boundaryBlocks_with_boundary
```

The direct/mirror alternatives provide the exact thirteen-point boundary enumeration, its injectivity/image/CCW properties, a `DRExactThirteenValuation.LabelMap`, and the cap-profile/apex placement attached to the chosen orientation.

They do **not** provide:

- a positional support table for the two late-blocker rows;
- a positional support table for the exact first-apex class;
- a positional support table for `firstRow` and `secondRow`;
- an identification of either late blocker with a Moser/MEC boundary vertex;
- a shared pair between two rows centered at MEC-boundary vertices.

This is why direct versus mirror is not yet the relevant terminal partition. The relevant refinement is direct/mirror **plus an exact row-support cell**.

`CardGeThirteenUncoveredThreeCenterPacket` retains `W : GoodSourceDistinctBlockerCommonDeletion R`, a separate point `z` lying in one named second-apex row and omitted by both late-blocker rows, a third row source-identified with the other named second-apex row, and `Nonempty (ThreeCenterCommonDeletionExactRows ...)`. Note that `W.deleted` is the frontier point and is distinct data from `z`. The three-center packet has exact deleted rows and pairwise-distinct centers, but no boundary-role identification, no two-point common intersection, and no cross-center support membership.

## 2. The exact source-faithful disk route

The new source-independent theorem is in:

```text
lean/Erdos9796Proof/Geometry/TwoInteriorSameBoundaryRadius.lean
```

at commit `2d7e60b6f`, source SHA-256

```text
66fe3c8de669b4a07ed77dfe696f2b70864ec883427a79149df2453d4d6520d6
```

and is named:

```text
false_of_two_interior_same_boundary_radius
```

Its contract is:

```text
B and P lie on the boundary of one closed disk centered at O,
X and Y lie in that closed disk,
X ≠ Y,
BP = BX = BY,
PX = PY
──────────────────────────────
False.
```

The theorem has a standard kernel axiom footprint only: `propext`, `Classical.choice`, and `Quot.sound`.

Let `KB : SelectedFourClass A B` and `KP : SelectedFourClass A P`. The weakest useful occurrence is:

```text
B and P are two distinct boundary vertices of the source MEC;
P ∈ KB.support;
X,Y ∈ KB.support ∩ KP.support;
X ≠ Y.
```

Then `SelectedFourClass.support_eq_radius` gives `BP=BX=BY` and `PX=PY`. The source MEC gives the two boundary equalities and the two closed-disk inequalities, so the new kernel yields `False`.

A low acyclic wrapper should therefore have the shape:

```lean
theorem false_of_mecBoundary_selectedRows_sharedPair
    (S : SurplusCapPacket A)
    (B P X Y : ℝ²)
    (hB_boundary : B is one of S's circumscribed Moser vertices)
    (hP_boundary : P is a distinct circumscribed Moser vertex)
    (KB : SelectedFourClass A B)
    (KP : SelectedFourClass A P)
    (hP_KB : P ∈ KB.support)
    (hX_KB : X ∈ KB.support)
    (hY_KB : Y ∈ KB.support)
    (hX_KP : X ∈ KP.support)
    (hY_KP : Y ∈ KP.support)
    (hXY : X ≠ Y) : False
```

The disk data comes from `S.triangleNonObtuse.toMoserTriangle`, `S.hCirc`, and the defining MEC containment theorem. If projecting those fields is inconvenient, the wrapper can accept the two boundary equalities and two disk inequalities explicitly without weakening the source argument.

### Natural CardGe specialization

Let `T` be the exact first-apex `SelectedFourClass` from `R`, and let `K` be `firstRow` or `secondRow`. The exact disk predicate is:

```text
2 ≤ (T.support ∩ K.support).card
and
(S.oppApex2 ∈ T.support or S.oppApex1 ∈ K.support).
```

- In the first directional-incidence arm take `B=S.oppApex1`, `P=S.oppApex2`.
- In the second reverse the roles.

Its exact negation is:

```text
(T.support ∩ K.support).card ≤ 1
or
(S.oppApex2 ∉ T.support and S.oppApex1 ∉ K.support).
```

No current source theorem produces the positive arm.

## 3. Why the frontier pair `q,w` cannot be used generically

The exact first-apex class contains the distinct points `R.interior_q` and `R.interior_w`. If a row centered at `S.oppApex2` contained both, that apex would be a carrier bisector center for the first-apex interior pair. The checked theorem

```text
Problem97.FirstApexInteriorPairGeometry.bisectorCenter_mem_firstApexInterior
```

puts such a center in the strict first-opposite interior, which excludes the other apex. Thus the most obvious pair is unavailable by source theorem. Only cell-specific mixed pairs involving another member of the first-apex four-class, or a different boundary-centered row, remain possible.

## 4. No current direct/mirror cell is source-proved disk-ready

The literal answer to the cell question is:

> **No direct or mirror DR exact-13 cell is currently proved in Lean to force the complete disk-ready role pattern.**

The direct/mirror label maps classify boundary order and cap roles, not selected-row supports. A profile/orientation cell alone cannot imply the five required support memberships.

The current exact direct-order relaxation has a row cell with

```text
T@A1 = {A2,x1,x2,t},
```

while neither named `A2` row contains both `x1,x2`. The obvious assignment `B=A1`, `P=A2`, `X=x1`, `Y=x2` therefore fails at `{x1,x2} ⊆ K_A2.support`. A two-point intersection may occur with a late-blocker row, but that blocker is not identified with a source MEC-boundary vertex.

This is not a full source counterexample. Exact coordinate replay found that the true MEC of the thirteen-point control has boundary exactly a diameter pair, so the first full-source failure is already `S.triangleNonObtuse`/`S.hCirc`; there is no three-distinct-vertex circumscribed Moser triangle. The control also lacks full `CounterexampleData`, global `D.K4`, and the complete source shell/frontier package.

It proves only that direct/mirror order, exact row/cardinality data, and the first-apex class do not force the disk-ready incidence pattern.

## 5. Exact residual split

The source-clean CardGe producers expose four kinds of residual:

1. row overlap among the three exact deleted rows;
2. a fresh carrier point outside their support union;
3. an exact-card-13 tight cover;
4. an `oppIndex2` adjacent two-radius grid.

The overlap arm currently gives only one shared point and an upper bound of two. Existing shared-pair terminals need a second point plus order/nonalternation.

The fresh arm gives a fourth selected row by deletion survival/global K4, but no checked terminal without further cross-incidences/order.

The adjacent-grid arm has order infrastructure but no source-rich contradiction from the bare grid packet.

In the exact-card-13 branch, after `ExactThirteenBranchIngress.of_twoRadiusBranch`, split direct/mirror and then, for each `K∈{firstRow,secondRow}`, split `DiskReady(T,K)` versus its exact negation:

```text
DIRECT:
  DiskReady(T,firstRow)
  or DiskReady(T,secondRow)
  or DirectNonDisk

MIRROR:
  DiskReady(T,firstRow)
  or DiskReady(T,secondRow)
  or MirrorNonDisk.
```

Every disk-ready arm closes through the proposed wrapper. The nondisk arms retain the precise sparse/crossless alternatives and require finite classification.

## 6. Current fixed-cell nondisk terminal

A source-clean global-K4 ingress is committed as `b7a752333`:

```text
Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress.exists_center9FourSupportRow_of_globalK4
```

It constructs the positional-center-2/raw-center-9 four-support row from `D.K4`, proving card four, center omission, and equal row distances.

The validated fixed-cell theorem is:

```text
Problem97.ATailFrontierLiveClosure.CardGeThirteenCenter9K4RowDomain.false_of_center9_fourSupportRow
```

It checks all 495 possible supports through 29 transparent one/two/three-form Kalmanson cancellation families, using ordinary kernel reduction and standard axioms only.

The remaining binder is exactly:

```text
hfixed : CardGeThirteenCenter9K4RowDomain.FixedFiveRows boundary.
```

`LabelMap` and `CardGeThirteenUncoveredThreeCenterPacket` do not construct this positional five-row realization. A center-wise PIQD scan confirms the fixed nature of the terminal: raw center 9 is UNSAT/UNSAT, while all other raw centers have replayed SAT/SAT support rows. No arbitrary-center relabeling is justified.

## 7. Next checked lemma and PIQD enumeration

First formalize the low-risk geometric wrapper `false_of_mecBoundary_selectedRows_sharedPair` in a module below `Rigid221Closure`. Its import direction is acyclic:

```text
Geometry/TwoInteriorSameBoundaryRadius
→ P97/ATail boundary-shared-pair adapter
→ exact-13 cell consumer
→ Rigid221Closure.
```

The substantive missing theorem is a source occurrence classifier, not another geometric inequality. It should map the actual first-apex, second-apex, and late-blocker rows through the direct/mirror `LabelMap` and return one of:

```text
DiskReadyCell
or a proved FixedFiveRows cell
or an explicit remaining exact-13 cell.
```

Do not assert `DiskReady ∨ FixedFiveRows` until the finite enumeration proves completeness.

The next PIQD task should enumerate every source-admissible direct/mirror row-support cell, bind all actual row centers to positional labels, and test the exact combinatorial predicate

```text
P ∈ row(B), X,Y ∈ row(B), X,Y ∈ row(P), X≠Y,
```

with `B,P` restricted to genuine MEC/Moser boundary roles. It should reject the generic `q,w` map via `bisectorCenter_mem_firstApexInterior`, tag every disk-ready witness, test nondisk cells against `FixedFiveRows`, and preserve complete role/support tables and canonical hashes for remaining cells. The Lean result needed is an occurrence/coverage table, not merely SAT statuses.

## Status table

| Claim | Status |
|---|---|
| Closed-disk obstruction | **PROVED**, source-neutral, standard axioms |
| Exact-card-13 direct/mirror boundary ingress | **PROVED** |
| `q,w` as generic other-apex shared pair | **REFUTED by source theorem** |
| Direct/mirror profile alone forces disk-ready rows | **NO** |
| Any current direct/mirror cell is Lean-proved disk-ready | **NO** |
| Abstract direct exact row cell avoids disk-ready incidence | **VERIFIED finite negative control** |
| That control realizes full `SurplusCapPacket`/`CounterexampleData` | **NO** |
| Global-K4 row at fixed raw center 9 | **PROVED** |
| Fixed center-9 cell contradiction | **KERNEL-CHECKED in validated source** |
| Source produces `FixedFiveRows` | **OPEN; first fixed-cell binder** |
| Full CardGe13 leaf closed | **OPEN** |

## Final conclusion

The closed-disk theorem is the terminal for a precise subcell:

```text
two source-MEC boundary row centers
+ a directional center hit
+ a two-point shared support.
```

No present direct/mirror DR exact-13 theorem forces that subcell, and the exact first-apex pair `q,w` is specifically unavailable at the other apex. The correct continuation is:

```text
direct/mirror
→ disk-ready incidence cell          → closed-disk contradiction
→ fixed five-row center-9 cell       → global-K4/Kalmanson contradiction
→ remaining exact source cells       → finite enumeration/certificate work.
```

The first useful proof to add is the small boundary-shared-pair wrapper. The first substantive source obligation is the direct/mirror row-role classifier, equivalently the missing disk-occurrence/`FixedFiveRows` ingress. Importing the kernel into `Rigid221Closure` before that classifier exists would be cosmetic rather than a reduction of the live sorry.