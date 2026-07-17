# Actual-frontier Kalmanson match audit

Date: 2026-07-16

Status: **CHECKED CONDITIONAL ACTUAL-ROLE TERMINAL; NO UNCONDITIONAL LIVE
MATCH. THE CURRENT FRONTIER DOES NOT SUPPLY CROSS MEMBERSHIP AND THE REQUIRED
BOUNDARY ORDER SIMULTANEOUSLY.**

This lane is isolated to
`scratch/atail-force/frontier-kalmanson-match/`. It does not change production
Lean, the closure plan, or any census/bank artifact.

## Result

`FrontierKalmansonMatch.lean` instantiates the four-point ordinal Kalmanson
consumer with actual `CriticalPairFrontier` names. For

```text
O = S.oppApex1
B = H.centerAt P.q P.q_mem_A
q = P.q
w = P.w
```

the frontier marginal always gives

```text
dist O q = dist O w.
```

If the selected critical row sourced at `q` contains `w`, it also gives

```text
dist B q = dist B w.
```

The checked theorem

```text
false_of_crossMembership_and_adjacentCentersOrder
```

proves that these equalities are incompatible with one shared CCW boundary
order

```text
O < B < q < w.
```

The proof invokes the production ordinal bridge
`CapCrossingKalmansonBridge.dist_lt_of_ccw_of_dist_diagonal_eq_side`, which
forces `dist B q < dist B w`, then contradicts the critical-row equality.

This is a genuine actual-role consumer, not an `E/Y` census relabeling. It is
conditional and closes no production `sorry` by itself.

## Exact live match

The strongest actual pair packet exports the following fields.

| Needed fact | Live source | Status |
| --- | --- | --- |
| `q,w in D.A` | `P.q_mem_A`, `P.w_mem_A` | **PRESENT** |
| `q != w` | `P.q_ne_w` | **PRESENT** |
| `dist O q = dist O w` | `q_mem_marginal`, `w_mem_marginal` | **PRESENT** |
| selected row at `q` | `H.selectedAt P.q P.q_mem_A` | **PRESENT** |
| that row contains `q` | `q_mem_support` | **PRESENT** |
| that row contains `w` | cross-membership arm of the frontier dichotomy | **BRANCH-CONDITIONAL** |
| one CCW boundary of `D.A` | convex-position boundary machinery | **DERIVABLE** |
| directed order `O < B < q < w` | no frontier field or parent adapter | **ABSENT** |

The answer to the match question is therefore **no**: no current live arm
simultaneously supplies the selected-row cross membership and the adjacent
four-role order consumed by the checked theorem.

## Why the missing order must not be promoted as a positive producer

Production already proves

```text
signedArea_product_neg_of_cross_membership
```

and packages it in

```text
card_five_cross_deletion_survives_or_cross_oppositeSide.
```

On the cross-membership arm, `q` and `w` lie on opposite strict sides of the
chord `O--B` (after the standard center-separation hypothesis, which the
card-five arm supplies). Thus the four points have the alternating
two-center/two-source geometry. The adjacent order `O < B < q < w` is a
forbidden order detected by the new terminal, not a fact that should be
mined from the live branch.

On the other arm,

```text
HasNEquidistantPointsAt 4 (D.A.erase P.w) B
```

holds instead. That arm does not give `w` in the row at `q`, so it does not
give the second pair equality consumed by the four-point theorem.

Consequently the route cannot be repaired by asking for the absent adjacent
order. Doing so would target an impossible packet whose immediate consumer
already refutes it.

## Parent rows do not fill the gap

The strongest inspected parent surface was
`OriginalQOutsideMiddleSuccessorParentSurface`. Its
`LiveDangerousRetainingSystem` retains a physical row centered at the parent
point `p` with support `{q_original,t1,t2,t3}`. Rows obtained by support
transport within that dangerous base have the same physical center and
support; they are not independent Kalmanson row centers.

There is also no source-provenance equation identifying

```text
frontier.pair.q
```

with the separately named parent `q_original`, `t1`, `t2`, or `t3`. These
binders therefore cannot be conflated to import the parent row into the
frontier pair.

The frontier's `secondApexDouble` and `SecondApexSplit` record K4 existence or
two exact shells at the second apex, but neither arm names a selected row
containing both frontier points. In the double-shell arm the two sources are
at different second-apex radii, so those shells specifically do not provide a
common-pair row.

## Five-point terminal audit

The production theorem

```text
false_of_selected_rows_in_five_ccw_order
```

consumes one boundary order `O < A < Y < E < C` and three selected rows with
six named incidences:

```text
Y-row: O,E
O-row: E,C
A-row: C,O.
```

No source-valid assignment of those roles was found in the live frontier or
the strongest parent surface. In particular:

- the frontier points are only known to lie in an off-surplus marginal, not
  both in the strict first-opposite-cap interior;
- the arbitrary retained `frontier.pair.q` is not identified with a parent
  row label;
- the frontier does not export the `O`- and `A`-row incidences; and
- global K4 supplies some row at a named center but does not force the named
  support points required by the terminal.

The earlier `kalmanson-parent-order-adapter` correctly proves a two-arm order
dichotomy for two strict first-opposite-cap points. It does not create the
two named points or the six row memberships, and the asymmetric terminal
roles cannot be silently swapped to choose the favorable arm.

## Minimal source-valid continuation

There is no justified smaller *Kalmanson-specific* producer on the present
surface. The next theorem must add a genuinely source-indexed row incidence,
not another anonymous support pattern.

Two legitimate targets have immediate checked consumers:

1. **Third-center common-pair row.** On the cross-membership arm, `O` and the
   actual blocker `B` are already two centers equidistant from `q,w`. Produce
   an actual selected row at a named third center `z`, distinct from both,
   whose support contains `q,w`. The perpendicular-bisector apex bound then
   closes directly. This is the smaller source-indexed producer, although its
   immediate sink is not Kalmanson.
2. **Complete actual-role five-point packet.** Produce named `E,Y`, their
   directed cap order (or both order arms with a consumer for each), and the
   three actual selected rows with the six memberships listed above. That
   maps directly to the checked five-point Kalmanson terminal. A packet that
   supplies only cap membership or only an unlabeled row is insufficient.

The corrected search object must be one of these complete antecedents, or a
formal coverage theorem showing that every live frontier maps to a checked
terminal. Literal `555/654` support cores without such a source map do not
advance this closure boundary.

## Bank and indexed-corpus preflight

Before deriving the theorem, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Four `nthdegree docs search --lean` queries covered strict Kalmanson shell
cycles, `CriticalPairFrontier` support/radius facts, shared-critical-map
two-large-cap cycles, and five-point/three-shell contradictions. They found
the existing production bridge and consumers, but no theorem producing the
missing actual source names, row memberships, or order from the current
frontier.

## Validation

Focused compile from `lean/`:

```bash
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/frontier-kalmanson-match/FrontierKalmansonMatch.lean
```

Result: success against the production
`Erdos9796Proof.P97.ATail.CapCrossingKalmanson` import. Every displayed
theorem reports exactly:

```text
[propext, Classical.choice, Quot.sound]
```

No theorem in the scratch module depends on `sorryAx` or a custom axiom.

## Epistemic status

- Conditional four-point actual-role terminal: **PROVEN / KERNEL-CHECKED**.
- Frontier and strongest-parent binder audit: **SOURCE-VERIFIED**.
- Absence of a matching theorem in the listed banks/indexed corpora:
  **SEARCH-VERIFIED WITHIN THOSE CORPORA**.
- Unconditional Kalmanson closure from the current live frontier: **BLOCKED
  AT THE SOURCE-INDEXED ROW/ORDER PRODUCER**.
- Production `sorry` closed by this lane: **NONE**.
