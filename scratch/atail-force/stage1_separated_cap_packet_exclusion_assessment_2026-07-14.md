# ATAIL Stage-I separated-cap packet exclusion assessment

Date: 2026-07-14

## Verdict

Neither surviving packet in
`stage1_separated_cap_geometry_boundary.lean` is currently excluded by an
existing theorem under the published K-A-PAIR binders.

In particular, no kernel-checkable proof was found for either

```text
URowDistinctInteriorCapPlacement -> False
URowOppositeEndpointInteriorPairFields -> False.
```

No new Lean file was created.  The bounded task called for a Lean declaration
only if one of those implications could actually be proved; adding a
conditional wrapper would not reduce the open proof.

This is a negative reuse result, not a proof that the full live hypotheses are
consistent.  The full K-A-PAIR theorem remains **CONJECTURED**.  What is
established below is the exact first missing antecedent at every nearby checked
consumer.

## Required bank preflight

The registries required by `AGENTS.md` were checked before this assessment:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches covered distinct strict-cap interiors, opposite-Moser
endpoint classes, full critical filters, cross-cap edges, escaped Moser-cap
Forms A/B/C, same-cap outside pairs, and perpendicular-bisector consumers.
The relevant reusable declarations are:

- `Dumitrescu.isCrossCapEdge_of_distinct_caps` and
  `Dumitrescu.cross_cap_edge_good`;
- `SurplusCapPacket.moserCapCoreSelectorAt`;
- `SurplusCapPacket.moserCapFormsAt_of_convexIndep`;
- `SurplusCapPacket.capInterior_pair_dist_ne_rightOuter_of_selectedClass`
  and its left-outer analogue;
- `SelectedFourClass.inter_card_le_two`;
- `Dumitrescu.perpBisector_apex_bound`; and
- `Problem97.eq_of_equidistant_three_noncollinear`.

None is an exclusion theorem for either live packet.  Most importantly, the
Moser-cap Form A/B/C declarations only classify an escaped short-cap class.
`MoserCapExcludesFormAAt`, `MoserCapExcludesFormBAt`, and
`MoserCapExcludesFormCAt` are hypotheses/interfaces, not proved consumers.
The concrete non-surplus form bank is assembled in the `IsM44` regime, whereas
K-A-PAIR assumes `hNoM44`.

## Audit of the actual K-A-PAIR binders

The binders unused by the cap classification do not silently supply the
missing metric link:

| Binder | What it adds | Why it does not close either packet |
|---|---|---|
| `hqCap`, `hqNonMoser` | Locates `q` in the strict interior of the chosen surplus cap. | It does not place `rows.uRow.center` or identify any second row-circle incidence. |
| `hjne`, `hj5`, `hNoM44` | Gives a second cap of cardinality at least five and excludes the `(m,4,4)` profile. | These are cap-cardinality facts, with no center or radius-class equality. |
| `hcard` | Gives only `9 < D.A.card`. | No local incidence follows. |
| `hfixed`, `hcenter`, `hsupport`, `H` | Makes `{q,t1,t2,t3}` the exact positive-radius class at `p` and puts `u` off that circle. | It gives no guaranteed member of the intersection with the exact `u`-row circle. |
| `hcritical` | Supplies some global critical-shell system. | The published `rows` argument is independent of that witness, so no blocker-fiber equality is available. |
| `hlocalNoQFree` | Says the `p`-class does not survive deletion of `q`. | This is already represented by the exact dangerous triple and creates no cross-center equality. |
| `hbase` | Supplies label inequalities. | It supplies no metric or cap coupling. |

Thus no-`M44` is useful only for cardinality on this surface.  It cannot turn a
different-cap placement into a common-cap placement, and it cannot put an
additional carrier center on a perpendicular bisector.

## Packet A: strict interiors of distinct caps

The packet gives two carrier centers `p,c` in strict interiors of different
caps.  The cross-cap theorems can classify `{p,c}` as a good/cross-cap edge
after the remaining membership cases are supplied, but "good edge" is a
counting classification, not a contradiction.

Let

```text
B = {q,t1,t2,t3}
R = rows.uRow.selected.toCriticalFourShell.support.
```

The exact filters and center separation give the upper bound

```text
|B intersect R| <= 2
```

through `SelectedFourClass.inter_card_le_two`.  They give no positive lower
bound on this intersection.  Distinct-cap membership and MEC containment do
not add a distance equality between the two circles.

There is a sharper import-reachable consumer than the full arc-overtake
route.  Put

```text
a = t1, b = t2, d = t3,
x = p, y = rows.uRow.center.
```

The fixed-triple packet supplies

```text
dist p t1 = dist p t2
dist p t1 = dist p t3,
```

and `MEC.signedArea2_ne_zero_of_three_dist_eq` supplies
`signedArea2 t1 t2 t3 != 0`.  Since the separated-cap packet gives
`p != rows.uRow.center`,
`Problem97.eq_of_equidistant_three_noncollinear` would immediately contradict
the packet if one could produce only

```text
dist rows.uRow.center t1 = dist rows.uRow.center t2
dist rows.uRow.center t1 = dist rows.uRow.center t3.
```

These two equalities are therefore the smallest checked equality-producer
target.  Exactness of the `u`-row class gives equalities only after membership
of `t1,t2,t3` in that class; the current packet supplies no such membership.

The first missing antecedent for the larger checked arc-overtake route is a
cross-row incidence producer: it must place the `u`-row center in the dangerous
four-class, force two named dangerous members of `R`, and align the relevant
critical `p`-source row.  The independent cyclic-order field is still needed
after that.  Equivalently, a different consumer would need its own explicit
equality/order packet.  The distinct-cap hypothesis alone supplies none of
these fields.

The existing `stage1_common_cap_incidence_countermodel.lean` remains the
finite field-map for this failure: it realizes all currently extracted
cap-cardinality, coverage, and selected-row intersection facts with the two
centers separated.  It is not a Euclidean counterexample and makes no claim
about the omitted full K4/MEC geometry.

## Packet B: the opposite-Moser endpoint interior pair

This packet is sharper than the earlier large-or-short split.  It gives
distinct `x,y` in the facing strict cap such that the opposite Moser endpoint
is equidistant from `x,y`.  It also proves

```text
dist x rightOuter != dist y rightOuter
dist x leftOuter  != dist y leftOuter.
```

Those inequalities have the opposite polarity from the available two-circle
reflection consumers.  In particular, neither named outer endpoint can be a
second center on the perpendicular bisector of `x,y`.

The closest unconditional consumer is
`Dumitrescu.perpBisector_apex_bound`.  One carrier center on the bisector is
already present (the opposite endpoint).  Its exact missing antecedent is two
additional pairwise-distinct carrier centers `a,b` satisfying

```text
dist a x = dist a y
dist b x = dist b y.
```

The current fields produce neither one; the two most natural candidates are
explicitly ruled out by the outer-distance inequalities.  All-center K4 only
produces some four-point class at each outer endpoint and does not say that
that class contains this particular pair.

The uniform two-equality consumer from Packet A applies here as well: this
packet also separates `p` from `rows.uRow.center`, while `hfixed` makes
`t1,t2,t3` a noncollinear equal-radius triple at `p`.  Thus the same two
`rows.uRow.center` equalities displayed above would close Packet B without
constructing two further endpoint-bisector centers.  The endpoint fields do
not produce either equality.

The short-facing-cap refinement does not help.  It classifies the dangerous
shell into the existing Moser-cap Form A/B/C surface (and `hqCap` can identify
which adjacent side contains `q`), but the form-exclusion fields are still
unproved inputs.  If the facing cap has cardinality at least five, even that
finite form classification is unavailable.

## Exact rational local witness for the endpoint geometry

The endpoint equality, exact four-point shell, and surplus-cap geometry are
compatible with strict convexity and the circumscribed-MEC disk.  Take the
seven-point carrier consisting of

```text
P = (0,2),  L = (-1,0),  R = (1,0),
x1 = (-1/2,-1/4),
x2 = (-9/202,-123/404),
x3 = ( 9/202,-123/404),
x4 = ( 1/2,-1/4).
```

These points occur in strict convex order, `PLR` is acute, and its circumcenter
is `(0,3/4)` with squared radius `25/16`.  All four `xj` lie strictly inside
that disk and on the strict cap side opposite `P`.  The corresponding closed
cap contains `L,R,x1,x2,x3,x4`, hence has cardinality six, and the full
positive-radius class at `P` is exactly `{x1,x2,x3,x4}`.  Exact squared
distances include

```text
|P-xj|^2 = 85/16 for j=1,2,3,4,
|L-x1|^2 = 5/16,   |L-x4|^2 = 37/16,
|R-x1|^2 = 37/16,  |R-x4|^2 = 5/16.
```

Thus the endpoint exact shell together with both outer inequalities is a
genuine geometric configuration, not a latent contradiction.  This witness
does not satisfy the full live global-K4/all-row/no-`M44` surface and is not a
counterexample to K-A-PAIR; it isolates the extra global coupling that a proof
must use.

## Next load-bearing theorem

The smallest uniform next producer is the two-equality bridge

```text
either separated-cap packet
  -> dist rows.uRow.center t1 = dist rows.uRow.center t2
     and
     dist rows.uRow.center t1 = dist rows.uRow.center t3.
```

Together with `hfixed`, this is consumed directly by
`Problem97.eq_of_equidistant_three_noncollinear` and the already-proved center
separation.  If those two equalities are not the natural output of the global
K4 provenance, the next honest producer must instead target one of these
larger packet-specific interfaces:

```text
URowDistinctInteriorCapPlacement
  -> LiveArcOvertakeStageOneFields (plus the checked order field)
     or another already-consumed equality/order packet

URowOppositeEndpointInteriorPairFields
  -> two additional carrier bisector centers
     or another already-consumed equality/order packet.
```

Another cap lower bound, another individual cap witness, or another
classification-only wrapper will not exclude either packet.

Epistemic labels:

- **PROVEN:** the cited current Lean consequences and consumer-polarity maps;
- **EXACT LOCAL WITNESS:** the rational endpoint/MEC calculation above;
- **NOT CLAIMED:** consistency of the full K-A-PAIR hypotheses; and
- **CONJECTURED:** one of the missing cross-row/global-K4 couplings closes each
  packet.
