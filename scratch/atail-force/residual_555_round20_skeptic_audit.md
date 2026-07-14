# Skeptic audit: round-20 split-bridge core

## Verdict

**CERTIFIED / PASS.**  The exact Euclidean argument, the equality-only
countermodel, the generic Lean core, and the round-20 carrier adapter all pass
independent checking.  Both Lean files elaborate from current source.  Every
printed endpoint has exactly the standard axiom closure
`[propext, Classical.choice, Quot.sound]`, and neither file contains a `sorry`,
`admit`, named `axiom`, or `sorryAx`.

The scope is important: this certifies the round-20 **metric consumer** and its
carrier-pattern adapter.  It does not produce the five rows from the live
ATAIL hypotheses and therefore does not close the live producer theorem.

## Audited surface

- `scratch/atail-force/residual_555_round20_kernel_analysis.md`;
- `scratch/atail-force/seven_point_split_bridge_order_core.lean`;
- `scratch/atail-force/residual_555_round20_general_carrier_adapter.lean`; and
- the pinned round-20 record in
  `scratch/atail-force/common_system_metric_probe.json`.

The checkpoint file hashes to
`6fa370d48226b2f8aab571e9f3bda97a5ed0c1baa9a2caa1be5da971a3b8f426`.
Its round-20 record has assignment hash
`cf430fcdcb5a0f3747822381083882cdc3900f225fb86d32c7807f5704c02a67`,
the five rows stated in the analysis, `formalized_structural_core: null`, and
status `FOUND_NONUNIT_WITHOUT_FORMALIZED_CORE_REAL_FEASIBILITY_UNDECIDED`.

## Mathematical audit

### Equality extraction and orientation

The label map at analysis lines 11--23 is exact for the saved rows:

```text
row 0 -> OA=OC=OD=OE
row 1 -> AO=AC=AU                  (label 7 is unused by the core)
row 2 -> CD=CW
row 3 -> DA=DE=DU
row 4 -> EA=EW                    (labels 7 and 11 are unused by the core)
```

Thus the proposed core consumes exactly nine distance equalities.  In the saved
hull order `(0,9,10,11,1,3,4,5,2,6,7,8)`, the selected five labels occur as
`O,A,D,E,C`; hence `OAC`, `OAD`, `OAE`, and `OEC` have one common orientation.
The analysis correctly warns at lines 438--441 that the repository's
`BoundaryIndexing` lemmas expose that orientation with negative
`signedArea2`.  The adapter must therefore use the reflected negative-sign
consumer, not the positive consumer directly.

### Scalar contradiction

After normalizing `O=(0,0)` and `A=(1,0)`, the derivations at analysis lines
193--361 check as follows.

1. `C=(1/2,h)`, `h^2=3/4`, and `h>0` follow from the two equilateral
   equalities and `OAC>0`.  `D=(x,y)` and `E=(w,z)` are unit vectors with
   `y,z>0`.
2. `DA=DE` gives `x=xw+yz`.  Its two unit-circle solutions for `E` are
   `A` and the reflection of `A` in the line `OD`.  `z>0` excludes `E=A`,
   leaving `w=2*x^2-1` and `z=2*x*y`.
3. `OEC>0` is exactly
   `h*(x^2-y^2)>x*y`.  Since `y,z>0` and `z=2*x*y`, one gets `x,y>0` and
   `x^2>y^2`.
4. If `x<=h`, then `1/4<=y^2<1/2`.  Both sides of the preceding strict
   inequality are positive, so squaring is sound.  The squared gap is
   `((4*y^2-1)*(4*y^2-3))/4<=0`, contradicting strict positivity.  Thus
   `x>h`.
5. The triangle inequality `AU<=AD+DU=2*AD`, together with `AU=1` and
   `AD^2=2-2*x`, gives `x<=7/8`.  Consequently
   `y^2>=15/64>(12/25)^2`, with exact gap `159/40000`, so `y>12/25`.
6. The distance identities
   `EA^2=4*y^2`, `CD^2=2-x-2*h*y`, and
   `CE^2=2-w-2*h*z` are correct.  The bounds used in the analysis are strict:
   `EA>24/25`, `CD<3/5`, and `CE<1/4`.  In particular,
   `h>41/49` has squared margin `479/9604`, while
   `3/50<1/16` has margin `1/400`.
7. Triangle `E,C,W` then gives
   `EA=EW<=EC+CW=EC+CD<17/20<24/25<EA`, the required contradiction.

No inequality is squared without first proving the relevant signs, and both
uses of the triangle inequality have the correct direction.

### Equality-only Gram obstruction

The realization at analysis lines 140--179 genuinely realizes all five full
round-20 row families, not merely the nine-edge subcore.  In addition to the
displayed checks, the shared label
`V=(3/4,sqrt(15)/4)` satisfies both `AV=1` and `EV=2`, so it correctly occupies
label 7 in rows 1 and 4.  The point
`U=((3+sqrt(7))/4,(1+sqrt(7))/4)` satisfies `AU=1` and `DU=sqrt(2)`.

For `s=CD=sqrt(2-sqrt(3))`, circles `(C,s)` and `(E,2)` intersect in two
points because `|2-s|<CE=sqrt(3)<2+s`; either supplies `W` with
`CW=CD` and `EW=EA`.  The remaining labels can be chosen distinctly on their
infinite circles.  All equality facts and all planar Gram determinants
therefore vanish in an actual planar realization with positive non-anchor
norms.  This proves that an equality-only U5-style ideal cannot contain a
nonzero target having nonnegative coefficients on such norm monomials.  It
does **not** rule out an ordered Positivstellensatz certificate, and the
analysis correctly limits the negative claim to the homogeneous U5 shape.

## Lean and adapter audit

### Generic core

The current `seven_point_split_bridge_order_core.lean` source passes a
hypothesis-by-hypothesis audit.

- Lines 35--58 transport distance-square and signed-area facts through
  `normSim`; the area scaling factor is strictly positive because `O != A`.
- Lines 63--223 implement the scalar argument without dividing by a possibly
  zero coordinate.  In particular, lines 85--115 derive the reflected
  `E`-branch from `z>0`, and lines 129--161 establish `h<x` only after proving
  both sides of the squared inequality positive.
- Lines 227--378 map each of the nine metric assumptions into normalized
  coordinates.  Lines 320--349 instantiate triangle `A,D,U` and derive
  `x<=7/8`; lines 372--378 instantiate triangle `E,C,W` and close with the
  three strict metric bounds.
- Lines 380--423 expose exactly the nine required `EdgeClosure` facts and use
  `EdgeClosure.sound` for every one.  The label inequality is transported by
  `Realizes.injective`, rather than assumed at the metric-point level.
- Lines 425--452 reflect both the realization and all four orientation signs;
  no sign is dropped.

An independent direct-Lean replay gives exit `0` and exact axiom output
`[propext, Classical.choice, Quot.sound]` for the normalized bound theorem,
the metric theorem, `false_of_core`, and `false_of_core_of_neg`.  A textual
scan finds no `sorry`, `admit`, named `axiom`, or `sorryAx`.

### Round-20 adapter

The adapter also passes its exact antecedent audit.

- Lines 27--99 define the five-label cyclic subsequence and derive precisely
  `OAC`, `OAD`, `OAE`, and `OEC`.  The boundary bridge correctly returns
  negative `signedArea2`, matching the reflected core consumer.
- Lines 103--125 request only the fourteen row-membership facts needed to
  produce the nine equality closures: four at `O`, three at `A`, three at
  `D`, two at `C`, and two at `E`, with `O` at the `A` row counted once.
  This matches the saved rows exactly.
- Lines 129--185 translate each membership through `mem_rowPattern_iff`.
  `OA_AC` is legitimately obtained by flipping `OA` to `AO` and composing
  it with the `A`-row equality `AO=AC`; the other eight fields are direct row
  closures.
- Lines 189--201 pass the four boundary signs to
  `false_of_core_of_neg` in the theorem's exact argument order.  No exact-row
  exclusion, unused label, or unproduced geometric fact is smuggled in.

Independent elaboration gives exit `0`; `FiveRowSupportData.toCore` and
`false_of_five_rows_and_cyclic_subsequence` both print exactly
`[propext, Classical.choice, Quot.sound]`.

## Validation record

The narrow out-of-tree checks were run from `lean/` under the direct-single-file
exception:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/seven_point_split_bridge_order_core.lean

lake env lean -M 16384 -R ../scratch/atail-force \
  -o ../scratch/atail-force/seven_point_split_bridge_order_core.olean \
  -i ../scratch/atail-force/seven_point_split_bridge_order_core.ilean \
  ../scratch/atail-force/seven_point_split_bridge_order_core.lean

BASE_LEAN_PATH="$(lake env printenv LEAN_PATH)"
lake env env LEAN_PATH="../scratch/atail-force:${BASE_LEAN_PATH}" \
  lean -M 16384 \
  ../scratch/atail-force/residual_555_round20_general_carrier_adapter.lean
```

All three Lean commands exited `0`.  The four core endpoints and two adapter endpoints
all reported exactly `[propext, Classical.choice, Quot.sound]`; there was no
`sorryAx`.  A final textual source scan over both Lean files returned no match
for `sorry`, `admit`, declared `axiom`, or `sorryAx`.  The temporary scratch
`.olean` and `.ilean` required by the adapter import were removed after replay.

The audited source hashes are:

```text
efcf689628d8f67ffa2bb196654602171c7e4f949143ca34492258efb6657c61  seven_point_split_bridge_order_core.lean
f9ddbb06d75a9eb6d44ddece366ba612d583b7e6432ac2f7eb3b930ffa518816  residual_555_round20_general_carrier_adapter.lean
```
