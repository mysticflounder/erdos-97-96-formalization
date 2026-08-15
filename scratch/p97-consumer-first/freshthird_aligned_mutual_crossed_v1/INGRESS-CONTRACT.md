# Ingress contract

## Constructor and orientation

Only the third disjunct at
`TwoSourceFirstFiberCollision.lean:1125-1127` is represented:

```text
FirstFiberCrossedThreeRowExactSupports
  P Pρ Q C.firstSource C.secondSource
  Q.source Q.otherOutsidePoint
```

The two deletion constructors and the reversed crossed constructor are out of
scope.

## Source-to-encoding ledger

| Encoded clause | Lean source | Encoding |
|---|---|---|
| `Q.source`, `Q.otherOutsidePoint`, blocker equality, membership in the first collision shell, both off the first cap, and exact outside pair | `BlockerMultiplicityGeometry.lean:115-157` | role constraints, blocker equality, exact first row, first-cap intersection |
| exact first collision row `{P₁,P₂,Q.source,Q.other}` | `TwoSourceFirstFiberCollision.lean:545-548` | `selectedAt(P₁)` exact set equality |
| exact common row `{C.first,C.second,Q.source,commonFourth}` | `TwoSourceFirstFiberCollision.lean:549-551` | `selectedAt(C.first)` exact set equality |
| exact opposite row `{Pρ₁,Pρ₂,Q.other,oppositeFourth}` | `TwoSourceFirstFiberCollision.lean:552-555` | `selectedAt(Pρ₁)` exact set equality |
| crossed omissions | `TwoSourceFirstFiberCollision.lean:556-562` | `Q.other ∉ row(C.first)` and `Q.source ∉ row(Pρ₁)` |
| fourth points are carrier points and off the first cap | `TwoSourceFirstFiberCollision.lean:563-568` | carrier-index domain and cap exclusions |
| both `C` source rows are exact four-rows and mutually contain the source pair | `TwoSourceCanonicalSurface.lean:110-144` plus mutual-cross-membership ingress and the selected-row cap counting theorem used by the aligned packet | all carrier rows have cardinality four; both mutual incidences; row intersection exactly the `C` pair |
| source rows omit at least one point of each retained pair | `TwoSourceCanonicalSurface.lean:129-130` (`CrossPairDeletionView`) | four deletion-view disjunctions |
| exact-17 cap profile `(8,6,6)` | `TwoSourceClosure.lean:169-180` | closed cap cardinalities and exact CapTriple membership counts |
| distinct `C` blockers in distinct cap interiors, first blocker in `oppIndex1`, and matching row intersects first cap exactly in the `C` pair | `TwoSourceClosure.lean:2138-2166`, direct orientation | blocker/cap variables and exact intersection |
| direct-or-mirror cap blocks and cyclic separation | `TwoSourceClosure.lean:2168-2208`; block definitions at `Census554/CapSelectedGeometry.lean:57-87` | permutation ranks with exactly those strict inequalities and `btw` equivalence |
| shared fourth or two selected-row omission/blocker-equality disjunctions | `TwoSourceClosure.lean:2370-2402` | `commonFourth = oppositeFourth ∨ (commonClause ∧ oppositeClause)` |
| every selected row is a four-element carrier row through its source at a different carrier blocker | `U1CarrierInjection.lean:632-652,1116-1138` | branch-neutral incidence abstraction over all 17 sources |
| both named fourth-point blockers differ from the first collision blocker in the direct orientation | `TwoSourceFirstFiberCollision.lean:605-686` | blocker inequalities used only in the global explicit-Q overlap stage |
| pointwise K4 and actual-blocker unique-four minimality | `CounterexampleData.K4`; `MinimalUniqueFourCover.lean:362-401` | one chosen four-witness row at every carrier center, locked to every selected row whose blocker is that center |
| equal blockers lock supports; distinct centers have at most two common circle points | `SurvivalCover.lean:48-84`; `MinimalUniqueFourCover.lean:410-455` | equal-blocker equality and pairwise two-circle bounds |
| three apex-rich alternatives and their strict-cap slices | `ApexRichClassStructure.lean:45-155`, applied to `T.oppApex1_rich`, `T.oppApex2_rich`, `T.surplusApex_rich` | for each opposite cap: one slice of size at least four, or two disjoint slices of size at least two |
| distinct-cap rich-slice obstruction | `TriApexEndpointRetainedOmission.lean:371-425` | a canonical row whose blocker lies in cap `i` has at most one hit in every active rich slice of cap `j != i` |
| explicit first-row three-overlap obstruction | `FirstFiberOverlapDescent.lean:772-798`, using `firstFiber_shell_eq_explicitFour` | candidate rows with a different blocker have overlap at most two with exactly `{P₁,P₂,Q.source,Q.other}` |

The cap index is normalized to `surplusIdx = 2`, so `oppIndex1 = 0` and
`oppIndex2 = 1`.  This is only a permutation of the three source indices.

## Named-role discipline

The base requires the four requested roles

```text
C.firstSource, C.secondSource, Q.source, Q.otherOutsidePoint
```

to be pairwise distinct.  Other names are identified only when allowed by the
source.  In particular, `commonFourth = oppositeFourth` remains possible,
because the saturation theorem explicitly has that disjunct.

No role is introduced for `ExactFourTwoRadiusAdjacentCapGrid`.  The first
collision row is centered at `H.blockerVertex P.source₁`; an adjacent grid is
apex-centered.  No theorem in this constructor identifies the two families of
radius-side hits.  Therefore any `Q`-to-grid alias is a malformed ingress
request, not a formula clause.  `results.json.schema_rejections` records both
possible `Q` aliases as `REJECTED_UNSOURCED` before solver invocation.

## Intentionally not encoded

The following are not inherited from
`freshthird_six_center_global_k4_v2` and are not present here:

- `V2.BASE`;
- a six-center schema;
- six-center deleted-row or provenance assertions;
- retained-pair cuts not listed above;
- adjacent-grid incidences or `Q`/grid aliases; and
- branch-specific six-center global-K4 encodings.

The local structural lane omits Euclidean distance realization, convexity,
Moser `OnArcOpposite` geometry, and `CriticalShellSystem.no_qfree`.  The global
stage encodes incidence consequences of pointwise K4/minimality and the three
named rich hypotheses, but not simultaneous coordinates, radii, or full
convex arc geometry.  The metric lane adds Euclidean coordinates only for four
named rows.  These lanes are diagnostics, not parts of a claimed full model.

## Global target discipline

The rich-slice target is literally

```text
SelectedClass D.A (S.oppositeVertexByIndex j) r ∩ S.capInteriorByIndex j
```

with the candidate's actual blocker in cap `i` and `i != j`.  Active radii are
anonymous witnesses of the three `T.*_rich` hypotheses; the crossed
constructor supplies no radius names.  The overlap target uses exactly
`{P₁,P₂,Q.source,Q.otherOutsidePoint}`.  Candidates are initially restricted
to the four named vertices requested by the source audit.  Neither target
aliases a Q point with an apex-centered radius hit.

## Malformed controls

The suite negates or contaminates one exact source clause at a time:

- collapse one of the four required distinct roles;
- omit a member of the exact first collision row;
- insert each forbidden crossed point into the wrong exact row;
- put either fourth point in the first cap;
- equate the two `C` blockers;
- put the second blocker in the first strict cap;
- add a third point to the mutual `C`-row intersection;
- add a third first-cap point to the matching source row; and
- negate fourth-point saturation.

Two metric controls contradict one required circle equality or insert one
known off-row point into a named exact circle.
