# Source map

## Tested implication

The wave projects the branch reached after the source-faithful fan has already
produced two distinct row sources `z,w` with one actual blocker `b`.  It tests
whether the live local geometry, cap memberships, and endpoint order force a
cap-alignment fact that is not present in that branch's conclusion.

| Source | Source-entitled fact | Wave representation |
|---|---|---|
| `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:400-414` | A `SelectedFourClass` has four distinct carrier witnesses on a positive-radius circle, excluding its center. | `Row={ra,rb,w,z}` about `c`, radius squared `25/16`; exact support and positivity are checked. |
| `lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1116-1138` | An actual selected critical shell is a full four-point ambient radius class and deletion at its source blocks every four-point radius class at that center. | The common blocker shell is the full class `K={z,w,ka,kb}` about `b`; exact distance histograms after deleting `z` or `w` have maximum multiplicity three. |
| `lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean:47-55` | Equal actual blockers give equal exact selected supports. | The sources `z,w` both map to `b`; `selected_z` and `selected_w` are definitionally the same exact class `K`. |
| `lean/Erdos9796Proof/P97/Foundation.lean:78-84` | `OnArcOpposite` is the signed-area chord-separation predicate. | Every membership in `C1,C2,C3` is asserted in SMT using the same polynomial predicate and recomputed with exact fractions. |
| `lean/Erdos9796Proof/P97/Cap/Structure.lean:161-204` | A `CapTriple` uses the closed opposite arcs of a Moser triangle. | The Moser triangle is `(v1,v2,v3)=(x,ka,ra)` and all cap classifications are checked, including endpoint overlap and one-cap membership for non-Moser vertices. |
| `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:332-354` | A `SurplusCapPacket` carries a non-obtuse circumscribed MEC triangle and a cap of size greater than four. | Exact MEC center/radius, containment, triangle boundary equalities, non-obtuse dot products, and `|C1|=5` are checked. |
| `lean/Erdos9796Proof/P97/Cap/PartitionFromMEC.lean:466-471,496-501` | Indexed closed caps and strict interiors. | Zero-based `blockerCap=0`, `oppIndex1=1`, `rowCap=2`; `b` is in strict `C1`, `y2` in strict `C2`, and `c` in strict `C3`. |
| `lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean:62-70` | A boundary indexing is an injective CCW enumeration of all carrier vertices. | The eleven exact points have the strict CCW order `x,y2,y1,ra,rb,w,b,ka,kb,z,c`; every other point is strictly left of every directed boundary edge. |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:153-160` | At the endpoint, the center lies in `rowCap`, the selected row has at most two inside and at least two outside, and one deleted endpoint is absent. | `c in C3`; `Row ∩ C3={z}` and `Row\C3={ra,rb,w}`; canonical source `y1` is absent from `Row`. |
| `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:70-89` and target hypotheses `hnames`, `hrowCenter` | The selected endpoint is one of the two FreshThird sources; their common blocker supplies the separately order-named fresh center. | The local order projection designates `qOutside=id=c` and `qBetween=rb`; its fresh center is the separate point `kb`.  The carrier-wide Q-shells are outside this isolated implication and are not claimed. |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean:524-548` | Four possible strict endpoint order arms, with the selected endpoint named. | Arm 4 is realized: `y2 < y1 < rb < kb < c`, with `sourceCenter=y2`, `canonicalSource=y1`, `qBetween=rb`, `freshCenter=kb`, `qOutside=id=c`. |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TriApexEndpointRetainedOmission.lean:988-1007` | In the `center != blocker` fan arm, the row/blocker-support intersection has card at most two; the blocker is strict-cap localized and deletion-blocking. | `c != b`, `Row ∩ K={z,w}`, `b` is strict in `C1`, and deletion at either repeated-blocker source leaves no four-point radius at `b`. |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:4689-4705` | The derived repeated-cap outcome provides two row points, a shared strict blocker cap, and either equal blockers or a cross-deletion row. | The equal-blocker arm is selected with `z,w,b,C1`. |
| `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdResidual.lean:4781-4890` | The live consumer stops after constructing the fan and mutual outcomes. | This wave tests only the proposed missing cap-alignment step after that point. |

## Equality interpretation

The source-entitled equality is equality of the two blocker-selected supports
for `z` and `w`, via
`selectedSupports_eq_of_actualBlockers_eq`.  It is not equality of the endpoint
row support with the blocker support.  In the `c != b` fan arm the source says
their intersection has card at most two.  The witness makes it exactly two:

```text
Row = {ra, rb, w, z}
K_z = K_w = {ka, kb, w, z}
Row ∩ K_z = {w, z}
```

Adding `Row = K_z` would contradict the source branch itself and would not be
a source-entitled strengthening.

## Intentionally unencoded global context

This local wave does not construct all fields of `CounterexampleData`, a
carrier-wide `CriticalShellSystem`, the complete frontier/collision structures,
the seed and multiplicity hypotheses, or the full `hterminal` disjunction.
Those clauses are not premises of the isolated proposed alignment implication.
Consequently, this is a full countermodel to that local implication, not a
countermodel to the enclosing Lean theorem or to Problem 97.
