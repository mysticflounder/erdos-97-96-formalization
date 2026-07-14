# `(5,5,5)` rounds 7--23: order-family and certificate-bank synthesis

Date: 2026-07-13

> **Superseded replay note.** This document records the historical
> pre-subsumption round trace.  The later checked
> `SixPointTwoCircleArcOvertakeOrderCore` subsumes archived rounds 10--28 with
> one six-point, three-row cyclic-order theorem.  After its matcher was
> integrated, the clean `(5,5,5)` replay has nineteen cuts and the first
> uncovered shadow is round 19, digest
> `ef90d3234ee6a42eaebe1728d27a771812e33262b8b098c457f295ef5314d96d`.
> The live conditional producer is already written in
> `live_arc_overtake_producer.lean`; the remaining proof obligation is the
> MEC/cap/full-filter/no-M44 forcing lemma for its second aligned dangerous
> hit, not another round-specific consumer.

## Executive verdict

There is a useful general theorem here, but it is not one theorem uniformly
parameterizing all of rounds 7--23.

The strongest immediate reuse is a **four-label two-circle same-side order
core**:

> If two distinct points `u,y` are equidistant from each of two centers
> `q,v`, then `u,y` are reflections across the line `qv`; consequently they
> cannot lie strictly on the same side of that line.

The analytic theorem already exists in current source as
`Problem97.twoCircle_sameSide_reflection_false` in
`P97/U2/WitnessReflectionKernel.lean`.  The indexed `erdos-97-96-lean`
corpus also exposes the still-closer cyclic-order wrapper
`c5b4c_crossSide_contradiction` in
`Erdos9796Proof.P97.U2C5b4cClosure` at indexed commit `830e6f5`.  That wrapper
is not present in this checkout, so it is evidence/recovery material, not a
current import.

Round 23 instantiates the public analytic kernel exactly:

```text
q = O = 0,  v = F = 5,  u = D = 3,  y = E = 4,
OD = OE,    FD = FE,
cyclic subsequence O,A,D,E,F.
```

Only rows `R0,R3,R4` are needed.  Thus round 23 is not a new analytic
real-feasibility problem at the consumer level once the order fact is used;
it is a missing generic
`EdgeClosure`/boundary-order adapter and matcher.  The same core also occurs
in rounds 10--13, so this is repeated structure rather than a one-off patch.

For rounds 14--22, the honest higher-level synthesis is a common five-point
spine with three genuinely different extension types (nested center, one
circle-chain bridge, and two split bridges).  A tagged alternative interface
would be useful packaging, but the exact residual incidence graphs and the
needed equality edges show that it would not be a new single geometric
theorem.  In particular, the round-20--22 split-bridge theorem is already
generic in the placement of its two bridge labels; it should not be weakened
back into three walking-label cases.

## Epistemic labels and scope

- **CURRENT-SOURCE LEAN THEOREM:** a declaration present in this checkout.
  No Lean command was run in this bounded synthesis.
- **SCRATCH KERNEL-VALIDATED:** a scratch theorem whose existing independent
  audit records successful elaboration and the standard axiom closure.  This
  synthesis did not rerun that audit.
- **INDEXED SOURCE CANDIDATE:** a theorem returned by the indexed Lean corpus
  but absent from this checkout.  It is not treated as a current import or as
  freshly kernel-audited here.
- **EXACT FINITE COMPUTATION:** deterministic calculation on the pinned JSON
  rows, their unordered-edge equality closure, and the fixed cyclic order.
- **EMPIRICAL CHECKPOINT FACT:** a fact about this one saved finite-shadow run.
- **CONJECTURED PACKAGING:** a proposed interface or matcher not implemented
  here.

The checkpoint labels itself
`FINITE_NECESSARY_CONDITION_SHADOW_ONLY`.  In particular it records
`target_faithful = false`, `producer_proved = false`,
`lean_critical_shell_system_constructed = false`, and
`real_feasibility_decided = false`.  Finding a monotone metric cut does not
produce the required live rows and does not close the live ATAIL theorem.

## Required bank and index preflight

Before proposing a new theorem, this synthesis checked the required registry
and all three external-bank inventories:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially
  **Sibling `p97-rvol` banks**;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Those manifests contain many general-ambient U5 incidence consumers, the
unimported U1 source-unit consumers, and legacy local metric/scalar kernels,
but no single statement matching all of the order families below.  In
particular, the legacy chord primitives are useful ingredients, not a hidden
all-round classifier.

The indexed-corpus preflight included these searches:

```text
nthdegree docs search --lean "six point circle chain order equal chord cyclic bridge placement"
nthdegree docs search --lean "walking label nested equal chord two circle order wrap"
nthdegree docs search --lean "cyclic order equal chord network parameterized transport chain"
nthdegree docs search --lean "seven point split bridge order core equal distances"
nthdegree docs search --lean "bisector separates equidistant four points convex cyclic order same side boundary chord"
nthdegree docs search --lean "twoCircle_sameSide_reflection_false"
nthdegree docs search --lean --name c5b4c_crossSide_contradiction "c5b4c_crossSide_contradiction"
```

The decisive hits were:

1. **CURRENT-SOURCE LEAN THEOREM:**
   `Problem97.twoCircle_sameSide_reflection_false` in
   `P97/U2/WitnessReflectionKernel.lean`.  Its source proves the reflection
   contradiction from four distance equalities, distinctness of the two
   intersections, and two same-side signs.
2. **INDEXED SOURCE CANDIDATE:**
   `c5b4c_crossSide_contradiction`, module
   `Erdos9796Proof.P97.U2C5b4cClosure`, source line 77, indexed at commit
   `830e6f5`.  Its indexed statement is already a CCW-boundary-order adapter
   around the same two-circle reflection engine.
3. The local private theorem `bisector_separates` in
   `N4d/FormAEndpointPairKill.lean` proves the same separation fact, but it is
   private.  It need not be exposed: the public U2 theorem is sufficient.
4. `EqualityCore.PerpBisectorCore` is public but is not this core: it requires
   **three** distinct labels on one perpendicular bisector and uses convex
   independence to exclude their collinearity.  Round 23 supplies only the
   two common-circle points `D,E`; its contradiction is order-sensitive.

This preflight changes the recommended work from “prove a new round-23
geometry theorem” to “add/recover a thin generic equality/order adapter.”

## Pinned evidence

The read-only calculations use:

```text
861d4a41141a26c0f6a1afb4fefe52156813c6890ad5eb3bc4b3a084d6b30ee9  common_system_metric_probe.json
29a2dbd08de7eefc0a3088271dde8ba80025c385f319bf1b0edb464863e1bfe9  common_system_metric_probe.py
797fa50bb8db388d677b0f07aa939712981728fa48f0e880c4cd3ab622a4aa8f  test_common_system_metric_probe.py
efcf689628d8f67ffa2bb196654602171c7e4f949143ca34492258efb6657c61  seven_point_split_bridge_order_core.lean
```

The `(5,5,5)` seed reconstructs:

```text
hull order = (0,9,10,11,1,3,4,5,2,6,7,8)
S interior  = {3,4,5}
O1 interior = {6,7,8}
O2 interior = {9,10,11}
p=0, q=3, t1=2, t2=1, t3=4, u=5
```

The saved case has 23 accepted cuts in rounds 0--22.  Round 23 is the first
uncovered record and has status
`FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED`; its full
equality ideal is `CROSSCHECKED_NONUNIT`, not `UNIT` and not a real
realizability verdict.

## Exact residual and accepted-cut ledger, rounds 7--23

Write `W = {8,9,10}` and let `w` walk through `W`.  From round 10 onward the
first four full residual rows are fixed:

```text
R0 = 0:{1,2,3,4}
R1 = 1:{0,2,6,7}
R2 = 2:{3,8,9,10}
R3 = 3:{1,4,5,6}
```

The exact grouped comparison is:

| rounds | remaining full row(s) | accepted rows | accepted consumer | exact role of walking label |
|---|---|---|---|---|
| 7--9 | four-row system with `3:{0,5,w,11}` instead of the later `R3`; no center-4 row | all 4 | `SixPointTwoCircleOrderCore` | full row pattern walks; the ordered matcher's chosen `P,Q` witness is not equivariant in all three rounds |
| 10--12 | `R4=4:{0,1,w,11}` | `R0,R1,R4` | `ExactOffCircleCore` | `w` is surplus to the accepted exact-off witness |
| 13 | `R4=4:{0,3,5,11}` | `R0,R1,R4` | `NestedEqualChordCore` | singleton transition; no `W` label in `R4` |
| 14--16 | `R4=4:{0,5,w,11}` | `R0,R1,R3,R4` | `SixPointNestedCenterOrderCore`, fixed `O,A,D,E,X,C = 0,1,3,4,5,2` | `w` is not a core role; `R2` is deleted by minimization |
| 17--19 | `R4=4:{1,2,w,11}` | all 5 | normal circle-chain at 17, wrap-order circle-chain at 18--19 | `Y=w`; equality graph is identical, while `Y` crosses the cyclic cut at `O` |
| 20--22 | `R4=4:{1,7,w,11}` | all 5 | `SevenPointSplitBridgeOrderCore`, `U=6,W=w` | theorem already permits `U,W` anywhere off the ordered spine |
| 23 | `R4=4:{2,3,5,11}` | none in the saved matcher | none saved | no label from `W` occurs in `R4` |

Two details matter:

- The accepted round-13 cut is `NestedEqualChordCore`, even though the first
  full-residual scan records `ExactOffCircleCore`.  The table reports the
  actual minimized accepted cut.
- The accepted round-14--16 cuts have four rows, not five: the common `R2`
  walking-block row is irrelevant to `SixPointNestedCenterOrderCore`.

The full checkpoint identities are:

```text
round  assignment_sha256                                                 accepted_row_set_sha256
7      b6dea0b54a611bed67a49862a4264b06eed12efbf31f35a2e4cb154c1fb7a8ce  22c2f312f2a1825cefe0a1680a3b04d921959f3ba31f9f240f8cbbab3cdbcc64
8      d0a8e02f8a9d8fd882f7d8e6234e42055a8aab6ed53c9fd176aab2b4602a98e8  42a521b72bd42180426d426754672a2e06b6a694e272f05dbbba4fba853fbefe
9      2849d2bcf05ee01656a020360e0f0883713c4748782630e92597a0cc17a2ea74  91676d67f7e28b27c3a3b9dfe4b02e91ef3df9dc4dc08e8976fbf07c4716f95a
10     a48f53fcc24b4a6856838fc858da2dc5c082a5d876aabf5508f61261fdb12d26  ac50fb8b5b0bd62e0839515b9ea1660ab22ee21750b5235455b3dc24f177fdc1
11     8c0866ad340734c907d28b8276c6b28d49c12aa3cb7735d0161f30e504437f5b  25eb99862f3e2d69bb35c1f5222015ce32de909de05ac38d23dbd0b47a8bbb24
12     7d0eef60f5c75f8ee306b1b4565d9b95ead91ca7fe37a6abff5a1ef391a0914d  cc03b892725f8135ad7c2cf60661b9c768ca0882bfe8f2f1118fd71e7403f30c
13     d2132634bc16876a2a517bca0d9ee7d357a8326927daaa21310546a5163dcf34  ed987bf5f878f484f33bd4a53b09ad4964700ff490589f6c6534ae40fd25271f
14     8ae8d4701ed9f6fcff7aa521d5cc46564ae327871d64a2c819d9f2104aaa5ecf  84e12b418bc4dcebc63cef38be6b874f538a9df07b0e14574990d00226d7ba9c
15     12126e7755f2b03fa29ce85526a6145c0a68d7989f14d8688eb585d7b0e225f8  4e0dcf6605770a78626397f4966745cff95ec316dcc84928ef6e5114522c2268
16     4f08e3ea7d57c0a91e0518c32368eeb75c09f04ae7c15aec43dfeded79d1c156  dd8a4920a6fc845cb3470b52d73c43ce6d40a8ac74bb84fede627a7e9d0c9232
17     5ed077d946a2fb072906666e1714d7f7d73efc1fcb665f4c1974c250fcca7c89  8cc1512a94fe64078f22a147f6082645fcd733cccbce18a3f2e35882be361e3c
18     5dac7824ce5ab4dd7c6f18e2fb3c88306d64dc2cefe1bce2d3d696b8ad4e49f8  1287c4b104c815e1b00dd0c565f1373623969bd75455b303ad29508e6c95aba1
19     928146519a285356977edf1a8d0f3c665354f374069841d37d6338c3a9777db2  b6ccd1a15955b37b226a921d7d099b4f2fb089644e3f22c2fabf9f7211bd2186
20     cf430fcdcb5a0f3747822381083882cdc3900f225fb86d32c7807f5704c02a67  56459b5a096b51c978ceda8b47ad98c5cfe4de47f4c82fde5a2f1c2b44520051
21     f61b61bbc5d2e588f560c0bdf48c70121385b20e9ef52a6a3f04cc701af55250  99574d5fab7dbb6b7d14266c8336a835cc2fd15d7e764382c380338c63dbb206
22     ac6cb1b6360a767b99b9de594e86f5cbd854fd639b06503056d9d130e94d8d7b  22206243859aff20b201242d4cad3f6bcbfbd92166d17f4d41414a74f607effe
23     d1c0773c0013f2e241949a3c8abed8025a18bcd02507af284df00df9be4e5971  -
```

## What repetition proves, and what it does not

### Exact within-block isomorphisms

As row-centered hypergraphs on labels `0,...,11`, each walking block is
exactly isomorphic under permutations of `W` fixing every other label:

```text
7 -> 8, 10 -> 11, 14 -> 15, 17 -> 18, 20 -> 21: swap 8 and 9
7 -> 9, 10 -> 12, 14 -> 16, 17 -> 19, 20 -> 22: swap 8 and 10
```

These permutations carry both the full row set and the corresponding
minimized row set to its partner.  This is an exact finite fact, not a visual
similarity.

They do **not** preserve the fixed hull order.  Therefore an ordered matcher's
chosen witness need not transport equivariantly.  The clearest example is
rounds 17--19: the equality core is the same after relabeling, but `Y=8` lies
immediately before the cyclic cut at `O`, while `Y=9,10` lie immediately after
it.  That is why the saved consumers split into normal and wrap order.

### Cross-block non-isomorphism

The key block representatives are not one row pattern with a bridge label in
different places.  Canonicalizing the directed incidence graph induced on
row centers gives different exact invariants for the full residuals:

```text
round  canonical center-incidence form
14     ((0,(1)),(1,(0,2,3,4)),(2,(0,3)),(3,(1,4)),(4,(2)))
17     ((0,(1)),(1,(2,3)),(2,(0,3)),(3,(0,4)),(4,(0,1,2,3)))
20     ((0,(1)),(1,(2,3)),(2,(0,1,3,4)),(3,(4)),(4,(0,1)))
23     ((0,(1)),(1,(2,3)),(2,(0,1)),(3,(0,4)),(4,(0,1,2,3)))
```

A row-centered hypergraph isomorphism would induce an isomorphism of these
center graphs, so the differing canonical forms prove non-isomorphism.  The
accepted cuts reinforce the distinction: rounds 14--16 use four rows, while
17--22 use five; the five-row center graphs for 17 and 20 are different.

Thus “one cyclic equal-chord network parameterized only by bridge placement”
would overstate the evidence.  The blocks have different antecedent graphs.

## The common five-point spine and its honest extensions

For rounds 10--23, put

```text
O=0, A=1, C=2, D=3, E=4, F=5, U=6.
```

Rows `R0,R1,R3` provide the common closure spine

```text
OA = OC = AC = OD = OE,
DA = DE.
```

The order-sensitive families add genuinely different data:

1. **Nested-center extension, rounds 14--16.**  With `X=F`, add
   `DX=DA` and `EX=EO`, and use cyclic order `O,A,D,E,X,C`.
2. **Circle-chain extension, rounds 17--19.**  With `Y=w`, add
   `EA=EC=EY` and `CY=CD`.  The equality graph is uniform; the order has two
   sectors, `O,A,D,E,C,Y` at round 17 and `O,Y,A,D,E,C` at rounds 18--19.
3. **Split-bridge extension, rounds 20--22.**  With `U=6,W=w`, add
   `DU=DA`, `AU=AO`, `CW=CD`, and `EW=EA`.  Only the spine order
   `O,A,D,E,C` matters; `U,W` may occur anywhere else.

The split-bridge statement is already formulated at exactly the right level
in `scratch/atail-force/seven_point_split_bridge_order_core.lean`.  The
existing skeptic audit records successful elaboration and standard axioms for
the source hash pinned above.  This is **SCRATCH KERNEL-VALIDATED**, not yet a
production theorem in this synthesis.

The circle-chain normal/wrap pair can honestly be packaged behind an order
alternative such as `YPlacement.tail | YPlacement.wrap`, dispatching to the
two consumers.  Likewise, a `FiveSpineExtension` tagged sum could dispatch to
nested-center, circle-chain, and split-bridge cores.  Both would reduce
interface repetition, but neither is a stronger common geometric theorem.

Round 7--9's two-circle core is farther away:

```text
cyclic A,P,Q,B,D,C;
AB=AC=AD=BC, CD=CP, DA=DQ.
```

It shares the broad “ordered equal-chord network” theme, not the exact
five-spine equality graph.

## The hidden four-point reflection family

### Generic core suggested by the bank

The minimal reusable `EdgeClosure` interface should be approximately:

```text
q, v, u, y : label
u != y
EdgeClosure R (q,u) (q,y)
EdgeClosure R (v,u) (v,y)
0 < signedArea2 u q v * signedArea2 y q v
```

Under a realization, the two closures give
`dist u q = dist y q` and `dist u v = dist y v`.  The current public theorem
`twoCircle_sameSide_reflection_false` then closes the core.  One can use
`apex=u`: the displayed same-side product gives the second sign required by
that theorem and implies the nonzero square needed for the first.

This proposed `FourPointTwoCircleSameSideCore` is **CONJECTURED PACKAGING**,
not new mathematics.  A boundary-order adapter should produce its strict sign
from a cyclic subsequence with `u,y` on the same open arc between `q,v`.

### Exact scan of rounds 7--23

A deterministic scan enumerated all four distinct labels, compared the two
distance pairs in the full transitive row-equality closure, and tested whether
the two common points occupy the same open arc between the centers in the
fixed cyclic order.  It found this core in exactly these rounds:

| rounds | centers | common points | one minimal row subset | status relative to saved cut |
|---|---|---|---|---|
| 10--12 | `q=0,v=1` | `u=2,y=4` | `R0,R1,R4` | same three rows as saved exact-off cut; removes reliance on exactness |
| 13 | `q=0,v=5` | `u=3,y=4` | `R0,R3,R4` | alternate three-row cut; saved cut instead uses `R0,R1,R4` and nested chords |
| 23 | `q=0,v=5` | `u=3,y=4` | `R0,R3,R4` | missing saved matcher/core |

The table gives one minimal representative per listed family; rounds 10--13
also have symmetric or closure-redundant full-residual witnesses.

No such hit occurs in rounds 7--9 or 14--22.  This is why the reflection core
is a real repeated generalization but not a universal replacement for the
other order consumers.

### Exact round-23 closure

Round 23 has:

```text
R0 = 0:{1,2,3,4}
R1 = 1:{0,2,6,7}
R2 = 2:{3,8,9,10}
R3 = 3:{1,4,5,6}
R4 = 4:{2,3,5,11}
```

Its non-singleton unordered-distance closure classes are exactly:

```text
{01,02,03,04,12,16,17}
{13,24,34,35,36,45,4·11}
{23,28,29,2·10}
```

Therefore:

```text
OD = OE                         from R0,
DF = DE = EF                   from R3 and R4 through the shared edge DE.
```

The hull order contains the subsequence `O,A,D,E,F`.  Hence `D,E` are on the
same strict side of chord `OF` (with `A` available as a reference apex), in
direct conflict with the two-circle reflection theorem.

The three-row core uses only:

```text
D,E in row O;
E,F in row D;
D,F in row E.
```

Every other membership and both rows `R1,R2` are irrelevant.  In particular,
round 13 and round 23 have the same core even though their `R4` rows differ by
the unused support label `0` versus `2`.

### Where round 23 really breaks the walking schemas

Round 23's `R4={2,3,5,11}` contains no member of `W={8,9,10}`.  Thus it breaks
the literal walking form `R4={fixed pair,w,11}` and cannot instantiate:

- circle-chain: it lacks a shared `Y` giving both `EY=EA=EC` and `CY=CD`;
- split bridge: it has `CD=CW` for `W in W` from `R2`, but lacks `EA=EW` for
  every such `W`;
- nested center: it does not give `EO=EX` for the needed `X`.

That is a break in the **chosen family parameterization**, not a break in the
certificate bank.  Round 23 moves to the smaller two-circle same-side family.

## Strongest honest theorem/interface recommendations

In priority order:

1. **Recover or add a production four-point equality/order wrapper.**  Prefer
   a generic `EdgeClosure` core around current
   `twoCircle_sameSide_reflection_false`.  The indexed
   `c5b4c_crossSide_contradiction` is the first source to inspect before
   writing even that thin wrapper from scratch.
2. **Add a monotone matcher and round-23 regression.**  On the pinned residual
   it should return the three-row cut `R0,R3,R4`.  It should also detect the
   exact alternate hits in rounds 10--13.
3. **Keep the split-bridge theorem placement-generic.**  Rounds 20--22 are one
   theorem instance with arbitrary off-spine `U,W`, not three theorems and not
   a card-12-only enumeration.
4. **Optionally consolidate circle-chain order packaging.**  A two-constructor
   normal/wrap order interface is honest because the equality core is
   identical.  It is not needed for round 23.
5. **Do not introduce one mega “cyclic equal-chord network” theorem.**  A
   tagged `MetricCoreAlternative`-style sum is reasonable library packaging;
   cross-block row incidence and equality requirements do not support a
   single bridge-placement hypothesis.  `GeneralCarrierBridge` already shows
   the appropriate precedent for such a disjunctive consumer interface.
6. **Keep producer status separate.**  Even after the round-23 finite-shadow
   cut is formalized and accepted, ATAIL closure still needs the live theorem
   that produces the relevant exact rows/order packet for every target case.

## Validation performed

This synthesis made no Lean, matcher, checkpoint, production, or shared-doc
edits.  It used only read-only JSON/source inspection, theorem-bank/index
search, hash checks, equality-closure calculations, within-block relabeling
checks, center-incidence canonicalization, and the four-label same-side scan.
