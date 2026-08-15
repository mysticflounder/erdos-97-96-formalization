# FreshThird normalized-residual consumer audit (2026-08-05)

Anchor:
`Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`

Status: **open; no existing source-clean consumer fits the full residual**.

## Checked interfaces

The audit checked the current source-clean consumers and producers in:

- `TwoSourceFreshThirdFiber.lean`;
- `TwoSourceFreshThirdResidual.lean`;
- `TwoSourceCanonicalSurface.lean`;
- `TwoSourceClosure.lean`; and
- `TwoSourceRetainedMinimalCore.lean`.

The following are genuine consumers, but their ingress contracts are stronger
than the anchored residual:

- `false_of_freshThird_sameCapCrossRowAlignment` consumes a cap-wide
  alignment packet;
- `false_of_freshThirdEqualCenter_sameCapOppIndex` consumes the equal-center
  exact-row packet with the interaction cap equal to `oppIndex1`;
- `false_of_commonRadius_equalCenters_noncanonicalSameCap_packet` consumes a
  `CommonRadiusTwoCapSourceThirdCanonicalRowSurface` and common first-apex
  radius memberships;
- the first-fiber/deletion consumers require C-to-C reverse row membership,
  common-radius membership, and/or a retained minimal deletion core.

No theorem currently derives those stronger premises from
`FreshThirdNormalizedResidualRemainingCase`.

## Branch audit

### `firstNonHit` and `secondNonHit`

The non-hit packet is either:

1. `sameBlocker`, which gives equal center/support with the fresh fiber row;
   or
2. `sourceRowOmission`, which gives survival after deleting one fresh endpoint.

The cap-wide alignment consumer would close these, but the residual contains
neither the common-cap placement nor the requirement that both fresh endpoints
are outside that cap.  The omission packet also does not provide reverse
membership of the cap source in the fresh rows.  Thus neither the deletion
survival nor same-blocker data feeds an existing terminal.

### `equalCrossRowCenters`

The equal-center and two cross-row hits do produce a checked exact four-point
row and common collision-endpoint omission.  The canonical-cap arm is closed
by `false_of_freshThirdEqualCenter_sameCapOppIndex`.

The remaining two shapes are:

- two `distinctBlockersDifferentCaps` interactions; or
- two `sameCapWithInternalFiberSource` interactions with a noncanonical cap.

The existing residual coordinator intentionally recurses on exactly these two
shapes.  Cap-interior uniqueness only shows that the two occurrences use the
same source/fresh cap indices; it does not contradict the two noncanonical
interactions.  The exact-row and omission packets do not supply common-radius
membership at `oppIndex1`, C-to-C mutual cross-membership, or an order-sensitive
metric consumer.

## Required next producer

One of the following source-level producers is needed before the anchor can be
closed:

1. **Cap-wide alignment:** derive `FreshThirdSameCapCrossRowAlignment` for at
   least one non-hit source (or derive a stronger universal alternative that
   makes the two non-hit branches impossible).
2. **Common-radius/reverse-membership:** lift the generic C packet to a
   `CommonRadiusTwoCapSourceThirdCanonicalRowSurface`, including first-apex
   membership, or prove the C-to-Q/C-to-C reverse row incidences required by an
   existing deletion consumer.
3. **Order-sensitive consumer:** consume the existing
   `freshThird_canonicalDifferentCap_*` boundary packet with a theorem that
   rules out the two noncanonical equal-center configurations.

The current finite certificates and coordinator wrappers do not provide any of
these universal ingress or consumer theorems, so they do not close the anchor.

## New source-clean packet (2026-08-06)

`freshThirdEqualCenter_sourceFreshSupport_inter_eq_pair_of_hits` now packages
the equal-center/two-hit branch as the exact support intersection
`sourceShell ∩ freshShell = {Q.source₁.1, Q.source₂.1}`.  Its proof is
source-clean: it reuses the exact-four-row packet and the selected-four-class
intersection bound, with the endpoint-cardinality lower bound supplied by
`Q.sources_ne`.

This is a sharper producer for the equal-center branch, but it is not itself a
terminal consumer.  The only current equal-center consumer still requires the
interaction cap to be canonical (`oppIndex1`); the noncanonical distinct-cap
and internal-fiber-source shapes remain open.  In particular, the new equality
does not manufacture reverse row membership, common-radius data, or a
cap-wide alignment packet, so the anchored residual sorry remains open.

## Import-reachability closure check (2026-08-06)

The equal-center packet and its endpoint-omission producers were searched by
declaration name, signature, and semantic terms across the indexed Lean
corpus and the current import graph.  No source-clean consumer currently
accepts the packet together with `IsM44`/no-`(m,4,4)`, Kalmanson, cyclic-order,
or reverse-membership data.  The Kalmanson declaration found downstream
belongs to a different crossed-three-row `sorry` leaf and cannot be used
upstream without creating an import cycle.

Therefore the next admissible closure step is a single source-level bridge,
not another packet:

1. prove a third cross-row incidence (the closest existing consumer is the
   five-ccw/two-selected-rows terminal), or
2. prove a direct order/metric contradiction for the two noncanonical
   equal-center shapes.

The `firstNonHit`/`secondNonHit` arms still need cap-wide alignment,
common-radius plus reverse-membership ingress, or an equivalent direct
contradiction.  A bounded certificate, wrapper, or recursion through the
anchor remains non-closure.
