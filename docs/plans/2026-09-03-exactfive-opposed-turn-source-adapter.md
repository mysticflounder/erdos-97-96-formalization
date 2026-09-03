# Exact-five opposed-turn source adapter

Date: 2026-09-03

Status: implementation checkpoint.

## Purpose

The profile-282 selected-formula run exposed a four-fact geometric
obstruction, now formalized as
`Census554.EqualityCore.twoEquilateralCircle_opposedTurns_false`.  The next
source-facing step is to derive its distance hypotheses from the selected-row
packet rather than restating them at each eventual profile consumer.

## Adapter boundary

`RobustApexFourIncidenceContinuationPacket.false_of_secondRowPoint_opposedTurns`
uses the source roles

```text
B = c₁       O = robust row center       A = a
Q = c₂       v = a further row₂ point
```

The packet and five explicit support memberships provide every distance
hypothesis.  The adapter keeps both strict signed-area products explicit.
Those signs require profile-specific boundary-index relations and must not be
inferred from the formula census without a separate Lean ingress and coverage
proof.

The role `B` is the profile-local `c₁`/`K1` center.  It is `U` in profile 282
only because that profile identifies `c₁` and `U`.

## Reuse preflight

One bounded repository Lean-corpus search was run for the packet-level
opposed-turn adapter at worktree revision `ce312b111`; the index revision was
`8526f8e37`.  No existing adapter was found.  The nearest result,
`RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_intersection_normalForm`,
needs an additional point in `row₀ ∩ row₁` and does not supply the required
circle/order contradiction.

## Immediate scope

Only the fourth continuation constructor supplies `c₁ ∈ row₀`, `O ∈ row₁`,
and `O ∈ row₂`.  Even there, live source wiring still needs:

- `c₂ ∈ row₀`, arising in the computational profiles from the `c₂ = p` or
  `c₂ = q` alias;
- a named additional member of `row₂`;
- boundary-index facts proving both strict signed-area products; and
- a checked coverage bridge from the hard source-swap exact-grid packet to
  the profile family.

The authenticated formula mine has six nonmatching cells, one in each of
profiles 360, 363, 376, 467, 470, and 483.  In those cells `c₂`, `u`, and `v`
lie on the same side of the directed `c₁,O` line, so this adapter cannot reject
them.  A further geometric obstruction is required before broad source
wiring.  The admitted five-incidence endpoint remains unchanged.
