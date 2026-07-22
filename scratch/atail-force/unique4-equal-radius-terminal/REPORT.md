# Exact-four equal-radius terminal audit

Date: 2026-07-22

Status: **KERNEL-CHECKED ONE-CENTER TERMINAL PREFIX.  THE COMPLETE
FRESH-CENTER CLASS MEETS THE FIRST OPPOSITE CAP IN EXACTLY THE RETAINED
PAIR, AND A FOUR-SUBPACKET PRESERVING THAT PAIR HAS EXACTLY TWO POINTS
OUTSIDE THE CAP.  A SECOND FIRST-CAP CENTER THROUGH THOSE TWO OUTSIDE
POINTS IS IMPOSSIBLE.  THE CURRENT SOURCE DOES NOT FORCE SUCH A SECOND
CENTER, SO THIS SHARD DOES NOT YET CLOSE THE EQUAL-RADIUS ARM OR A SOURCE
`sorry`.**

## Scope and input

This lane owns only

```text
scratch/atail-force/unique4-equal-radius-terminal/
```

and starts from the equal-radius arm of

```lean
equalRadius_pair_collision_normalForm
```

in

```text
scratch/atail-force/unique4-strict-pair-minimality/
  UniqueFourStrictPairMinimality.lean
```

The source gives a fresh carrier center in the strict interior of the first
opposite cap, the retained pair `q,w` on one complete radius class at that
center, cardinality at least five for that complete class, and full
single-deletion robustness at the fresh center.

## Required bank preflight

Before deriving another row or incidence contradiction, this audit checked
the registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-corpus searches covered robust fresh centers, exact-five
profiles, pair-preserving rows, outside-pair terminals, Kalmanson/U5
consumers, and MEC/no-`IsM44` consumers.  The load-bearing existing results
are:

```lean
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
CapSelectedRowCounting.outsidePair_unique_capCenter
FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four
```

No indexed theorem supplies the missing second center or an immediate
contradiction from the present equal-radius normal form.

## Kernel-checked producer

`UniqueFourEqualRadiusTerminal.lean` proves the reusable bound

```lean
selectedClass_inter_capByIndex_card_le_two
```

for any positive ambient radius class of cardinality at least four whose
center lies in an indexed physical cap.  The proof extends a hypothetical
three-point cap intersection to a selected four-row and applies the existing
ordered-cap row bound.

Applied to the fresh-center class, this gives

```lean
equalRadius_ambientClass_inter_firstCap_eq_pair
```

whose conclusion is exactly

```lean
SelectedClass D.A P.center (dist P.center R.interior_q) ∩
    S.capByIndex S.oppIndex1 =
  {R.interior_q, R.interior_w}.
```

Because the complete class has cardinality at least five,

```lean
three_le_equalRadius_ambientClass_sdiff_firstCap
```

also proves that at least three members of that class lie outside the first
opposite cap.

The theorem

```lean
nonempty_equalRadiusPairOutsideRow
```

then chooses a four-subpacket preserving `q,w`.  Its output

```lean
EqualRadiusPairOutsideRow P
```

contains:

- a selected four-row centered at the fresh center;
- the fresh center's first-cap membership and full deletion robustness;
- `q,w` in the selected row;
- exact equality of the row's cap intersection with `{q,w}`;
- two distinct carrier points `outside₁,outside₂` outside the cap;
- exact equality of the row's cap complement with
  `{outside₁,outside₂}`; and
- equal fresh-center distances to the outside pair.

This is the exact one-center prefix of
`CapSelectedRowCounting.outsidePair_unique_capCenter`, rather than another
bare cardinality lower bound.

## Existing terminal reached conditionally

The theorem

```lean
false_of_secondFirstCapCenter_bisecting_outsidePair
```

feeds the extracted packet to
`CapSelectedRowCounting.outsidePair_unique_capCenter`.  It proves `False`
from exactly one additional geometric input:

```lean
secondCenter ∈ S.capByIndex S.oppIndex1
secondCenter ≠ P.center
dist secondCenter outside₁ = dist secondCenter outside₂
```

Full deletion robustness makes the distinctness automatic for every actual
critical center.  Consequently

```lean
not_both_outsidePoints_mem_actualRow_of_center_mem_firstCap
```

proves that no selected row of any legal `CriticalShellSystem` whose center
lies in the first cap can contain both extracted outside points.

All six declarations compile with `-DwarningAsError=true`.  Their reported
axiom closure is only:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` in this shard.

## Why the other existing terminal families do not match

### Exact-five / cap-order

The fresh center is an arbitrary strict first-cap carrier point, not a
physical Moser apex.  Its complete class is known only to have cardinality
at least five, not exact cardinality five with a unique apex-radius profile.
The exact-five cap-first terminals therefore cannot be instantiated.

### Same-cap outside-pair

This is the closest match.  The current shard supplies the first cap center,
the outside pair, and the first equality.  The terminal still needs a second
distinct center in the same cap with the same equality.  No present parent
field supplies it.

### Kalmanson / U5

Those consumers require several source-indexed row centers and positive
cross-row incidences.  The equal-radius normal form supplies one fresh center
and one selected row, so it does not reach their ingress.

### MEC / no-`IsM44`

The normal form places the fresh center in a physical cap but provides no
new MEC boundary vertex and no alternative support-triangle cap counts.
The exact regression in

```text
scratch/atail-force/unique4-mec-terminal/
  verify_boundary_ingress_not_m44.py
```

already shows that even bare boundary ingress does not force an alternative
`IsM44` packet.  A cap-counted retriangulation remains additional geometry.

## Regression gate against an overstrong occurrence claim

The kernel-checked finite model in

```text
scratch/atail-force/same-cap-bisector-producer-audit/
  LiveRowsFiniteBoundary.lean
```

contains robust five-class data, omitted blocker image, a common outside
pair, live selected rows, and global row closure, while proving

```lean
no_second_center_through_live_outsidePair_checked
no_live_source_supplies_second_center_checked
```

for the represented center family.  This is an exact finite-incidence
regression, not a Euclidean realization of the full parent.  It nevertheless
rules out deriving the missing second-center occurrence from the currently
abstracted incidence and cardinality fields alone.  Any valid occurrence
theorem must visibly consume additional full-source geometry, global
minimality, or cap/MEC order.

## Exact next missing producer

For `Q : EqualRadiusPairOutsideRow P`, the direct source-indexed occurrence
target is:

```lean
∃ (H' : CriticalShellSystem D.A) (source : ℝ²)
    (hsource : source ∈ D.A),
  H'.centerAt source hsource ∈ S.capByIndex S.oppIndex1 ∧
  Q.outside₁ ∈
    (H'.selectedAt source hsource).toCriticalFourShell.support ∧
  Q.outside₂ ∈
    (H'.selectedAt source hsource).toCriticalFourShell.support.
```

The new negative theorem consumes this occurrence directly: robustness says
the actual center differs from `P.center`, the selected-row metric supplies
the second equality, and ordered-cap uniqueness gives `False`.

This target is deliberately an occurrence theorem, not another conditional
consumer.  If the full source cannot force that row, the alternative route
must instead provide a complete cap-counted MEC retriangulation.  Nothing in
the current shard proves either continuation, so the equal-radius arm remains
open.

## Validation

From `lean/`:

```bash
lake env sh -c \
  'LEAN_PATH=/tmp:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:$LEAN_PATH \
   exec lean -DwarningAsError=true \
   -R ../scratch/atail-force/unique4-equal-radius-terminal \
   ../scratch/atail-force/unique4-equal-radius-terminal/UniqueFourEqualRadiusTerminal.lean'
```

Result: **PASS**.
