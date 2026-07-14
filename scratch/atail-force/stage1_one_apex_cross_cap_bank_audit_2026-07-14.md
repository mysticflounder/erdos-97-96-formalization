# ATAIL Stage-I one-apex cross-cap bank audit

Date: 2026-07-14

## Verdict

The sharpened short-cap construction is a genuinely smaller **producer
target**, but it is not a new consumer.

For either short non-surplus cap, it yields two distinct carrier points off
the surplus cap which lie on one common opposite-apex circle.  One point is
in the short cap's strict interior and the other is the selector's unique hit
in the other non-surplus cap.  The existing private-reflection theorems close
this packet as soon as the two points are proved equidistant from the other
opposite apex.

Thus the remaining producer has exactly one metric field:

```text
dist e otherOppositeApex = dist y otherOppositeApex.
```

Equivalently, it may put `e` and `y` in one exact selected class centered at
that other apex.  No theorem found in the required banks produces this field
from the short-cap selector, cap order, one-hit bounds, or reflection geometry.

This is not a restatement of the generic marginal boundary.  The cross-cap
specialization identifies a canonical pair in the live dangerous or `u`-row
shell and reduces the desired live coupling to one equality.  On the other
hand, generic geometry proves that the other-apex distance is injective on
every fixed one-apex radius class off the surplus cap.  Consequently the new
equality cannot be a pure cap-geometric consequence: it must use additional
global dangerous/`u`-row coupling, and when produced it immediately yields the
contradiction.

No Lean declaration was added.  A theorem taking the missing equality as a
hypothesis would only wrap an existing source-proved reflection theorem and
would not reduce the open proof.

## Exact symmetric specializations

Let `S : SurplusCapPacket A`, let `k` be a non-surplus cap index with
`(S.capByIndex k).card = 4`, and let `T` be a positive-radius selected class
at `S.oppositeVertexByIndex k` with cardinality at least four.
`moserSelectorShapeAt_of_convexIndep` makes `T` an exact four-class, contains
the whole two-point strict interior of cap `k`, and gives singleton
intersections with both adjacent closed caps.

The intended K-A specialization chooses:

- `y` in `S.capInteriorByIndex k`;
- `e` as the singleton hit on the adjacent side which is the *other*
  non-surplus cap; and
- the already-extracted private-set/off-surplus facts for `e` and `y`.

There are exactly two orientations.

| Short cap | First circle | Cross-cap point | Existing sink | Sole missing field |
|---|---|---|---|---|
| `k = S.oppIndex1` | center `S.oppApex1` | `e` is the left-adjacent singleton; `leftAdjacentCapByIndex_oppIndex1_eq_capByIndex_oppIndex2` identifies its cap | `S.leftPrivateSecondHit_reflection_false` | `dist e S.oppApex2 = dist y S.oppApex2`, using `rightOuterVertexByIndex_oppIndex1_eq_oppositeVertexByIndex_oppIndex2` |
| `k = S.oppIndex2` | center `S.oppApex2` | `e` is the right-adjacent singleton; `rightAdjacentCapByIndex_oppIndex2_eq_capByIndex_oppIndex1` identifies its cap | `S.rightPrivateSecondHit_reflection_false` | `dist e S.oppApex1 = dist y S.oppApex1`, using `leftOuterVertexByIndex_oppIndex2_eq_oppositeVertexByIndex_oppIndex1` |

This covers both **short non-surplus orientations**.  It does not cover a
branch in which the relevant facing cap has cardinality at least five, since
the exact selector shape is derived from cap cardinality four.

## Exact premise-mismatch table

| Candidate theorem or family | Premises supplied by the sharpened packet | Exact missing premise or disposition |
|---|---|---|
| `SurplusCapPacket.leftPrivateSecondHit_reflection_false` | For `k=oppIndex1`: `e,y` belong to the same selected class at the first apex; `e` is in the left private adjacent piece; `y` is in the own strict interior | Only equality of the two distances to `rightOuterVertexByIndex k`, i.e. to `oppApex2` |
| `SurplusCapPacket.rightPrivateSecondHit_reflection_false` | Symmetrically for `k=oppIndex2` | Only equality of the two distances to `leftOuterVertexByIndex k`, i.e. to `oppApex1` |
| `U2NonSurplusSqueeze.oppCap2_escape_gen` | Carrier membership, distinctness, both points off the surplus cap, and equality at one opposite apex | Only equality at the other opposite apex; this is the orientation-free version of the two private sinks |
| `doubleApexJointFiber_sdiff_surplus_card_le_one` | Both points lie in one one-apex marginal off the surplus cap | A common second-apex radius.  Rather than creating it, this theorem proves that two distinct such points cannot have one |
| `U2NonSurplusSqueeze.oppApex1_otherCap_one_hit` and `oppApex2_otherCap_one_hit` | The chosen cross point is the unique hit of the one-apex class in the other non-surplus cap | No premise is missing, but the conclusion is only cardinality at most one.  The selector's singleton realizes the bound, so there is no contradiction |
| `twoCircle_sameSide_reflection_false_of_not_mem_capByIndex` | Two distinct carrier points outside the relevant cap and the first common circle | The second pair of circle equalities, again exactly the other-apex equality |
| `capInterior_pair_dist_ne_rightOuter_of_selectedClass` and left analogue | The own-interior point and the first selected class | These require **both** points to be in the own strict interior.  The selector point `e` is in the other non-surplus cap.  Their conclusion is inequality, not the desired equality |
| `convex_order_implies_perpBisector_side` | No relevant order field | It requires the bisector equality as an input as well as `Wbtw`, and concludes only one half-plane sign.  It cannot produce the equality |
| `N8a3AdjacentCapDistanceStrict` and its realization theorems | The cap packet supplies neither an ordered-chain witness for this pair nor support containment in such a chain | With those premises it proves strict distance monotonicity, hence inequality, not equality |
| `Problem97.u2_sharedBase_family_contradiction` | Two distinct points in one selected class | It additionally needs both points in a second selected class and a third point common to both classes which is noncollinear with them.  This is strictly stronger than the one equality needed by the reflection sink |
| `U2NonSurplusSqueeze.no_oppCap2_escape` | A one-apex selected class and a point in the other cap | It requires `D.IsM44`; the live K-A branch assumes no `M44`.  The short-cap fact for only one non-surplus cap does not provide the missing global `(m,4,4)` profile |
| `U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction` | One equal-distance pair can be mapped into one of its circle fields | It requires seven explicit distance equalities plus a center inequality.  The cap selector supplies no completion of that pattern |
| The 18 U1 row-slot contradiction consumers | The pair is labeled by cap pieces and one exact shell | They require an explicit `RowSlotLabelPacket` or the corresponding complete row-slot incidence fields.  Cap membership does not assign those slots |
| The 96 U5 incidence-incompatibility families | Carrier and cap membership only | They require several explicit source/support incidences.  The one-apex shell gives its diagonal incidences but no second-source incidence at the other apex |
| Legacy finite-`N9` scalar/Radon consumers | At most the first equal-radius relation | Their fixed-size scalar and order premises are absent, and none exports an ambient cap/apex producer |

## Why the bank result has the opposite polarity

The checked scratch theorem
`doubleApexJointFiber_sdiff_surplus_card_le_one` is proved directly from
`oppCap2_escape_gen`:

```text
card {x in A ∖ surplusCap |
  dist x oppApex1 = r and dist x oppApex2 = rho} <= 1.
```

Fixing the first radius therefore makes the map

```text
x |-> dist x otherOppositeApex
```

injective on the off-surplus carrier points in that marginal.  Since `e != y`,
the existing geometry gives

```text
dist e otherOppositeApex != dist y otherOppositeApex.
```

The short cross-cap placement is extra localization inside this same
marginal; it does not invalidate the injectivity theorem.  A successful live
producer must therefore derive the opposite equality from additional global
row data, thereby creating the contradiction.  Searching for a cap-order or
perpendicular-bisector theorem which independently forces equality is the
wrong polarity.

## Required theorem-bank preflight

The audit checked every registry required by `AGENTS.md` before assessing the
candidate:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted indexed searches with `nthdegree docs search --lean` covered the
exact private-reflection declarations, opposite-apex one-hit bounds,
two-circle same-side reflection, cap-interior outer-distance inequalities,
convex perpendicular-bisector order, ordered adjacent-cap monotonicity, shared
selected classes, row-slot consumers, and support-incidence consumers.  The
JSON inventories were also queried by normalized statement shape for
`oppApex`, cap, selected-class, and distance-equality premises.

The closest sibling theorem is
`Problem97.u2_sharedBase_family_contradiction`; it consumes two common points
and a third noncollinear common point rather than producing the second common
radius.  `no_oppCap2_escape` is unusable in the no-`M44` branch.  The U1/U5
families consume already-classified row or incidence patterns and do not
classify this pair into one.

This is an exhaustive result for the required registries and the targeted
indexed searches, not an independence proof for arbitrary compositions of
all live hypotheses.

## Smallest useful next theorem

The next theorem should be a producer over the **live dangerous/`u`-row
coupling**, not a new reflection wrapper.  In either orientation its useful
conclusion is one of:

```text
dist e otherOppositeApex = dist y otherOppositeApex
```

or

```text
exists rho,
  e in SelectedClass A otherOppositeApex rho and
  y in SelectedClass A otherOppositeApex rho.
```

The cross-cap selector has already reduced the consumer side to this one
field.  Any proposed producer should be rejected if it uses only cap order,
one-hit, or one-apex shell facts, because those facts lie on the injective
side of the existing reflection theorem.  It must expose a genuine second
incidence from `hfixed`/`hsupport`/the common critical-row data (or an
equivalent global coupling field).

Epistemic status:

- **PROVEN in current source:** the private reflection sinks, the generic
  two-apex reflection sink, the selector shape, the cap-index orientation
  identities, and the one-hit bounds;
- **CHECKED scratch consequence:** joint fibers off the surplus cap have
  cardinality at most one;
- **NOT PRODUCED:** the one other-apex equality for the canonical cross-cap
  pair;
- **CONJECTURAL:** that the full live K-A hypotheses force that equality (or a
  different closing alternate).
