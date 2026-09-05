# B1 card-six good-canonical producer audit

**Console request:** channel message `#10380`  
**Lane:** read-only; no source writes, solver calls, or live-sorry edits  
**Relevant committed consumer:** `843bcaaffa014925a3d129d2bbdc37440b132ae7`  
**Relevant endpoint negative control:** `0f564afde`

## Question audited

Can the current card-six data

```lean
C : B1GlobalTransportContext ...
W : B1FiveSixWaveIngress C
P : B1CardSixLocalRolePacket C
R : B1GoodCanonicalDeletionEndpointResidual C W.escape
```

honestly produce

```lean
B1WinningLiveSliceSignedAreaProductPositive C ∨
  Nonempty (B1EscapeSourceContext C)
```

without a new geometric/source theorem?

## Verdict

**No.** The requested disjunction is not derivable from the currently exported fields. The two arms fail for different, precise reasons:

1. `R.endpoint` is an order packet for the **canonical deletion pair and common blocker**. `B1WinningLiveSliceSignedAreaProductPositive C` is a sign packet for one of the **u/v live two-point slices and that live row's actual blocker**. No current field identifies those cuts or transports the canonical endpoint order to a live-slice signed-area product.
2. `B1EscapeSourceContext` needs outside-first-apex-fiber membership and retained q-or-w deletion survival for the **actual source of `W.escape`**. `R.good` carries source-rich facts for the good canonical source/common-blocker branch, not for `W.escape.source`; `R.omittedPeer` has no identity with that source and carries neither required field.

Therefore an implementation of the requested theorem would have to assume or prove genuinely new mathematics. A wrapper around the present endpoint residual would be false as a reduction.

## 1. Exact card-six live slice

The card-six packet gives both

```lean
(b1USlice C).card = 2
(b1VSlice C).card = 2
```

and their disjointness. The wave escape source lies in one of those slices. After choosing that branch, the active data have the schematic form

```lean
row     = C.u or C.v
slice   = b1USlice C or b1VSlice C
source  = W.escape.escape.source
mate    = the unique other point of slice
blocker = blockerLabel (lateFirstApexSystem C.R) row.1 row.2
slice   = {source.1, mate.1}
```

The existing two-point endpoint producer retains exactly this row/source/mate/slice packet and returns either:

```text
mate lies in a left/right adjacent cap,
```

or

```text
blocker is linearly between source and mate in the retained boundary order.
```

Those are not same-arc or signed-product conclusions.

## 2. What the signed-area consumer requires

Commit `843bcaaffa` adds the kernel-clean packet

```lean
B1WinningLiveSliceSignedAreaProductPositive C
```

with one global `BoundaryIndexing` and either:

```text
uSlice.card = 2 and the two u-slice signed-area factors have positive product,
```

or the analogous v-slice statement. The module supplies an iff bridge to

```lean
B1WinningLiveSliceSameBoundaryArc C
```

and a contradiction theorem requiring only the signed-product packet. Its axiom closure is `[propext, Classical.choice, Quot.sound]`.

Thus card six already supplies the cardinality half. The missing input is exactly the sign/same-side fact for the live cut `(S.oppApex2, liveBlocker)`.

The nearest current adapter,

```lean
sliceSameBoundaryArc_of_subset_secondCapInterior
```

requires the whole live slice in the strict second-cap interior and the relevant blocker outside that cap. It does not apply to the adjacent-mate arm, and in the all-interior endpoint branch the source audit instead localizes the live blocker inside the cap. The two-point endpoint theorem `b1EscapeSliceEndpointOrderResidual_of_twoPoint` gives adjacent-cap-or-blocker-between only; it cannot be used as a positivity bridge.

## 3. Why the good canonical endpoint does not supply the sign

`B1GoodCanonicalDeletionEndpointResidual` refines `B1GoodCanonicalDeletionResidual`. Its endpoint alternatives concern:

```text
the other canonical deletion lying in a left/right adjacent cap,
```

or

```text
the common blocker lying between the two canonical deleted endpoints.
```

Its omitted-peer data identify a noncanonical live peer omitted from the canonical source row, with a distinct actual blocker. They do not identify:

- that peer with `W.escape.source` or the unique mate of the active card-six slice;
- the canonical common blocker with the active u/v live blocker;
- the canonical deletion pair with either full u/v live slice.

Consequently the canonical endpoint order cannot be substituted into the live signed-area product.

## 4. Finite order counterpattern

The committed endpoint-order negative-control lane `0f564afde` formalizes that the retained order/incidence packet can satisfy all live-pair separation and blocker-between facts while both live same-arc bits fail.

A representative cyclic order used in the audited family is

```text
s < d1 < Bc < d2 < u0 < v0 < o1 < Bu < u1 < A
  < v1 < Bv < c0 < c1 < uL < uR < vL < vR.
```

Take:

```text
A       = physical second apex,
uSlice  = {u0,u1},
source  = u0 in the strict second-cap interior,
mate    = u1 in an adjacent cap,
Bu      = the u-row blocker.
```

Then the adjacent-cap endpoint arm holds, but relative to the cut `(A,Bu)` the two endpoint bits differ:

```text
btw A Bu u0 = false,
btw A Bu u1 = true.
```

Hence the same-boundary-arc predicate and signed-area-product positivity both fail. The canonical endpoint atoms can be assigned on the disjoint deleted pair because the current structure has no identity connecting them to `u0,u1,Bu`.

This is an order/incidence negative control, not a full Euclidean `B1GlobalTransportContext`; it is decisive only against deriving positivity from the exported endpoint/order packet.

## 5. Escape-source-context arm

The current neutral constructor

```lean
b1EscapeSourceContext_of_star
```

has the escape-row provenance already present in the wave star and asks for the two missing source-rich inputs:

```lean
W.escape.source ∈ outsideFirstApexFiber C.R
```

and

```lean
HasNEquidistantPointsAt 4
  (D.A.erase C.R.interior_q)
  ((lateFirstApexSystem C.R).centerAt W.escape.source.1 W.escape.source.2)
∨
HasNEquidistantPointsAt 4
  (D.A.erase C.R.interior_w)
  ((lateFirstApexSystem C.R).centerAt W.escape.source.1 W.escape.source.2).
```

Equivalently, `b1EscapeSourceContext_of_normalForm_sourceData` requires the complete six-field packet: second-class membership, strict-second-cap membership, inequality with both canonical deletions, outside-first-apex-fiber membership, and retained q/w survival. The wave/star supplies the row/class/interior part; the missing load-bearing fields are outside membership and retained survival for this exact source.

`R.good` does not fill them. Its survival fact belongs to the canonical good-source/common-blocker construction. `R.omittedPeer` has no equality with `W.escape.source` and no retained-deletion survival field. The named-u/v split

```lean
b1_live_both_interior_outside_or_firstApexClass_split
```

also does not solve the requested theorem: it classifies `C.u` and `C.v`, while no current field synchronizes the selected surviving u/v source with the arbitrary source carried by `W.escape`. Its asymmetric first-apex-class arms remain genuine residuals.

## 6. Reuse preflight

The exact-candidate source preflight found only the following near matches:

- `b1EscapeSliceEndpointOrderResidual_of_twoPoint`: produces adjacent-cap mate or blocker-between; no sign conclusion.
- `sliceSameBoundaryArc_of_subset_secondCapInterior`: needs whole-slice containment and blocker outside; current branches do not supply both.
- `b1_live_both_interior_outside_or_firstApexClass_split`: can produce outside/survival for a named u/v source in one arm, but lacks the identity to `W.escape.source` and leaves two asymmetric cross cases.
- `false_of_b1WinningSliceOrderOutcome`: explicitly requires an external consumer for every `B1EscapeSourceContext`; it cannot close the source arm.

No current theorem transports `R.endpoint` into the live signed-product packet or transports `R.good` into source facts for `W.escape.source`.

## 7. Import and circularity boundary

A future honest producer may live in a new module importing:

```text
B1LiveSignedAreaConsumer
B1WinningSliceOrderOutcome
B1FiveSixWaveIngress
```

and may then be imported by `TwoDeletionCollision`. It must not import `Rigid221Closure` backward. It also cannot use:

- `false_of_b1PhysicalClassFiveSixNormalForm`, which is the live target;
- the two open four-center leaves;
- `false_of_b1WinningSliceOrderOutcome` without independently closing its `B1EscapeSourceContext` consumer.

The committed signed-area consumer remains source-clean but has no producer/importer on the live path.

## 8. Smallest honest next source theorem

The requested disjunction is too strong for the supplied inputs. The smallest honest source advance is at the earlier source-selection boundary, not at `R.endpoint`.

The source-clean narrowing currently being pursued is schematically:

```lean
Nonempty (B1EscapeSourceContext C)
∨ (C.u ∈ interiorPairBadOutsideSources C.R ∧
    C.v.1 ∈ SelectedClass D.A S.oppApex1 C.radius)
∨ (C.u.1 ∈ SelectedClass D.A S.oppApex1 C.radius ∧
    C.v ∈ interiorPairBadOutsideSources C.R).
```

It preserves the exact named source whose outside/survival facts are proved and isolates the two asymmetric cross arms instead of pretending they imply the signed live arc. This is strictly stronger progress than another endpoint wrapper.

For the signed-area branch, the first genuinely missing geometric theorem is a live-row-specific global cut-placement statement forcing the two endpoints to the same side of `(S.oppApex2, liveBlocker)`. For the escape branch, the first missing source theorem is an identity/provenance bridge tying `W.escape.source` to the named u/v source for which outside-first-apex-fiber membership and retained q/w survival are available.

## Final answer to request #10380

```text
NO HONEST PROOF FROM C + cardSix P + good-canonical endpoint R.

Card six supplies the active two-point u/v slices, but not the positive sign.
R supplies order for the canonical deletion pair/common blocker, not the active
live pair/blocker. The endpoint negative control realizes the retained order
packet with both live same-arc bits false. The alternative escape-context arm
is missing outside-first-apex-fiber and retained q/w survival for the exact
W.escape source; R carries those facts for a different canonical provenance.
The correct next work is the upstream named-source residual split, not a new
wrapper around R.endpoint.
```
