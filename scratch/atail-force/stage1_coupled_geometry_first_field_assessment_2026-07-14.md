# ATAIL Stage-I coupled geometry: first-field assessment

Date: 2026-07-14

## Verdict

Neither sharp separated-cap arm currently produces its first
closure-relevant cross-row field.

For the distinct-interior arm, the first target

```text
c := rows.uRow.center
dist c q = dist c t1
```

is exactly the assertion that `c` lies on the perpendicular bisector of
`q,t1`.  The live cap data locate `p` and `c` in different strict cap
interiors, but they do not put `q,t1` in a common ordered chain relative to
`c`, give either signed half-plane inequality, or put either point in the
exact `u`-row.  No banked theorem supplies the equality.

For the opposite-endpoint arm, the packet produces a same-shell interior
pair, but common `CriticalShellSystem` provenance supplies only diagonal
source incidence.  It does not prove

```text
y ∈ (H.selectedAt x hxA).toCriticalFourShell.support.
```

Short facing caps already have a useful but weaker named output:
`oppositeEndpoint_largeCap_or_crossRowIncidence` proves either the facing cap
has cardinality at least five or the opposite-endpoint shell contains the
other live center.  That output is not an antecedent of a current
contradiction consumer.  Large facing caps retain no analogous label
localization.

No Lean declaration was added: a conditional restatement would not produce
the missing geometry, and no unconditional first field was proved.

## Required theorem-bank preflight

Before the proof attempt, the current tree and all registries required by
`AGENTS.md` were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries covered strict interiors of
distinct Moser caps, opposite-endpoint selected classes, critical-row sources
in facing cap interiors, convex perpendicular-bisector order, and nonobtuse
MEC source localization.  The closest results were
`moserCapCoreSelectorAt`,
`four_le_selectedClass_erase_of_exact_cap_of_capInterior_ne`,
`N8b_endpoint_pair_split`,
`convex_order_implies_perpBisector_side`, and
`N8a3AdjacentCapDistanceStrict`.  None has the required source-localization or
cross-row conclusion.

This is an exhaustive statement about the named registries and searches, not
an independence result for every possible composition of the full Euclidean
hypotheses.

## Actual geometric inventory

The following are the geometry fields which really reach the sharp frontier.

| Input family | Live consequence | What it does not say |
|---|---|---|
| `CounterexampleData.convex` plus the cap partition | Distinct strict cap interiors are disjoint; `capInteriorByIndex_ne_of_mem_of_mem_ne` separates their points. | No radial equality at an unrelated center and no critical-row incidence. |
| Circumscribed nonobtuse MEC/Moser packet plus global K4 | The three closed caps cover the carrier; all three caps have cardinality at least four. | No named dangerous label is assigned to the facing cap, except `q` in the chosen surplus cap from `hqCap` and `hqNonMoser`. |
| `hNoM44` | `exists_secondLargeCap_of_noM44` gives a second cap of cardinality at least five. | It gives no membership of `p`, `c`, `t2`, `u`, or a selected-row point in that second cap. |
| Moser-opposite selected-class geometry | `selectedClass_capInteriorByIndex_card_ge_two` gives two strict-interior shell points. | The two points are existential and label-blind.  It does not identify the deleted source among them. |
| Short-cap selector | `moserCapCoreSelectorAt` contains the whole two-point strict interior in the exact four-class and gives adjacent one-hit bounds. | It applies only at cap cardinality four and does not determine the common system's blocker row at either interior point. |
| Endpoint reflection geometry | `capInterior_pair_dist_ne_rightOuter_of_selectedClass` and its left analogue exclude both outer Moser endpoints as additional bisector centers. | These are inequalities of the opposite polarity from the desired new bisector equality. |
| Ordered-cap monotonicity interface | `N8a3AdjacentCapDistanceStrict` would make distances strictly monotone along a supplied adjacent chain. | The interface is itself open in general, its chain/localization premises are absent here, and its conclusion proves inequality rather than the target equality. |
| Convex perpendicular-bisector half-plane lemma | `convex_order_implies_perpBisector_side` turns an existing bisector equality and a `Wbtw` premise into one signed half-plane inequality. | The sharp packet supplies neither `Wbtw` nor the starting equality, and one sign cannot imply equality. |
| Exact common critical system | The source belongs to its own selected support; equal chosen blocker centers have equal supports. | The separated packet gives distinct known blocker centers `centerAt(t2)=p` and `centerAt(u)=c`, so same-center support locking does not couple the two rows. |

The banked cap-arc midpoint inequalities have the same limitation: they are
one-sided local metric inequalities for two points already known to be in a
cap.  They neither place `c` on the perpendicular bisector of `q,t1` nor put
an endpoint-pair member in the row sourced at the other member.

## Arm I: distinct strict-cap interiors

The arm supplies indices `kp,kc` with

```text
p ∈ S.capInteriorByIndex kp
c ∈ S.capInteriorByIndex kc
kp ≠ kc.
```

It therefore proves `p != c`, which is already enough for the downstream
two-equality contradiction once the equalities are produced.  It supplies no
incidence between

```text
B = {q,t1,t2,t3}
R = rows.uRow.selected.toCriticalFourShell.support.
```

In fact, support intersection rigidity gives only the upper bound
`|B ∩ R| <= 2`; it gives no positive hit.  Common provenance adds `u ∈ R`,
not a member of `B ∩ R`.

The exact scalar form of the first target is

```text
inner (c - midpoint q t1) (t1 - q) = 0.
```

Thus the smallest order formulation is the pair of opposite weak signs

```text
inner (c - midpoint q t1) (t1 - q) <= 0
inner (c - midpoint q t1) (t1 - q) >= 0.
```

Neither sign is live.  Supplying both is equivalent to supplying the desired
distance equality, so this reformulation does not hide a smaller proved
lemma.  The available strict ordered-cap theorem, if its missing localization
and monotonicity were supplied for `q,t1`, would instead prove
`dist c q != dist c t1`.

Consequently the minimal additional geometric fact on this arm remains the
perpendicular-bisector boundary itself (or one of the already named stronger
support incidences `q,t1 ∈ R`).  No current convex/MEC/cap/no-`M44` theorem
produces it.

## Arm II: opposite endpoint and an interior pair

There are two symmetric subarms.

### Dangerous endpoint

Here

```text
c ∈ I_k
p = oppositeVertexByIndex k
x,y ∈ B ∩ I_k
x != y.
```

The exact `t2` row is the dangerous row:

```text
H.centerAt t2 = p
(H.selectedAt t2).support = B.
```

If one separately assumed `t2 ∈ I_k`, the two-point lower bound would let one
rechoose the pair as `x=t2` and a distinct `y∈B∩I_k`, proving the literal
incidence `y∈H.selectedAt x`.  This localization is not live.  More
importantly, it is not a closure-relevant replacement: it also forces
`H.centerAt x=p`, equal to the already-known endpoint bisector center.  It
therefore cannot supply the three pairwise-distinct centers required by the
checked triple-bisector sink.

When the facing cap is short, the stronger selector proves `c∈B`.  This is
the first arm of `URowOppositeEndpointLargeOrCrossRowIncidence`.  It still
does not put another member of `B∩I_k` in the common row sourced at `c`, and
it has no current named consumer.

### `u`-row endpoint

Here

```text
p ∈ I_k
c = oppositeVertexByIndex k
x,y ∈ R ∩ I_k
x != y.
```

The common row has `u∈R` and `H.centerAt u=c`.  Assuming `u∈I_k` would again
allow the pair to be rechosen as `x=u` and yield the literal first incidence
`y∈H.selectedAt x`.  That localization is not live and again duplicates the
known endpoint center, so it cannot feed the triple-bisector contradiction.

For a short facing cap, the selector instead proves `p∈R`, the second arm of
`URowOppositeEndpointLargeOrCrossRowIncidence`.  This yields the metric
equality `dist c p = dist c u`, but no current Stage-I consumer closes from
that single equality.

### First useful missing field

The first *consumable* endpoint field must therefore retain a genuinely new
blocker center:

```text
∃ x y,
  x,y are the endpoint interior pair ∧
  y ∈ (H.selectedAt x hxA).support ∧
  H.centerAt x hxA != c0,
```

where `c0` is `p` in the dangerous-endpoint arm and `c` in the `u`-row
endpoint arm.  The symmetric incidence and a second distinct blocker center
remain downstream, but this display isolates the first useful field.  No
current cap order, MEC inequality, short-cap selector, or no-`M44`
cardinality theorem proves it.

## Closure consequence

The geometric lane is not waiting for another raw cap census or a higher
cardinality threshold.  It needs a theorem that couples the chosen critical
map to the cap order:

- on the distinct-interior arm, a signed/order argument landing exactly on
  the `q,t1` perpendicular-bisector boundary at `c`; or
- on the endpoint arm, a cross-source selected-shell incidence whose blocker
  center is distinct from the already-known endpoint center.

The short-cap cross-row outputs should be preserved as a separate branch, but
they are not yet named consumed alternates.  The large-cap branches require
new coupling content, not more applications of existing cardinality bounds.

## Epistemic ledger

- **PROVEN in the current source:** every inventory item above, the sharp arm
  packets, and the short-cap large-or-cross-row split.
- **PROVEN by direct logical reduction:** source-in-facing-interior would give
  a literal first incidence, but only at the already-known endpoint center.
- **NOT PRODUCED:** `dist c q = dist c t1`, a useful reciprocal endpoint
  incidence, or a named contradiction alternate.
- **NOT CLAIMED:** independence from the full Euclidean K-A-PAIR hypotheses.
- **OPEN-PROOF:** coupling convex/MEC cap order to the chosen common critical
  map strongly enough to produce the first useful cross-row field.
