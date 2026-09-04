# Exact-five opposed-turn source adapter

Date: 2026-09-03

Status: one hard exact-grid subcell proved; complementary source cell under
PIQD diagnosis.

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

## Certified residual computation

The PIQD named-core run is authenticated by terminal self-hash
`4401514dff2ce768a97b9b92be0e320ca1b87e2017c70912fbfb2ec1259a646a`.
Z3 returned `UNKNOWN` on representatives 360 and 363.  cvc5 returned `UNSAT`
with an eleven-atom core for representative 360 and a five-atom core for
representative 363.  Exact cells, solver custody, replay checks, and atom labels
are recorded in
`docs/audits/2026-09-03-exactfive-opposed-turn-residual-named-core-postrun.md`.

Two smaller four-hypothesis scalar contradictions were then proved in
`Census554/OpposedTurnResidualOrderCore.lean` and published in commit
`7f7588f2e`.  They are strictly smaller than the returned named cores.  This
made a further solver deletion wave lower value than source realization, so no
additional PIQD run is planned for this residual.

## Residual reuse preflights

One bounded repository Lean-corpus search was run for each concrete scalar
candidate before formalization.  For family 13, the nearest result was
`normalized_threeHalvesLowerCircle_order_incompatibility`; its hypotheses do
not provide the shifted half-plane signs needed by the immediate consumer.
For family 12, the nearest result was `no_adjacent_escape_on_apex_radius`; it
requires extra hypotheses and has a mismatched sign boundary.  In both cases
the immediate consumer is
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`, and the
first missing antecedent is a source-derived order/sign adapter rather than
another scalar inequality.  The searches used the repository corpus indexed
from the September 3 source state; candidates were checked against the source
and imports before the scalar module was committed.

## Revised source route

The exact-grid source packet names enough geometry to avoid both a broad
profile-enumeration certificate and the family-12 arm.  Set
`w := Q.oldInteriorFirst` in `HardSourceSwapExactGridRoles`.  Existing cap-block
indexing gives the direct-or-mirror chain for `w, O, c₂, a`, while the shared
`K₁`/`K₂` pair gives separation of `c₁,c₂` against `a,O`.  A pure finite-order
lemma should split this into exactly two cases:

1. the previously formalized opposed-turn condition for `w`; or
2. the family-13 condition for `w`.

The family-12 computational role `t = e` is not currently available as a Lean
source fact: the source proves that `e` lies in the replacement row and the
strict surplus interior, but not that `e ∈ K₁`.  A proposed coordinate-free
family-12 signature also has a concrete equilateral counterexample, so it must
not be used as an ingress theorem.

The implementation order is therefore:

1. prove the pure `Fin` cyclic-order split;
2. transport its two arms to signed-area products;
3. package the resulting old-opposed-or-family-13 theorem on
   `HardSourceSwapExactGridRoles`;
4. apply the existing opposed-turn consumer or the new coordinate-free
   family-13 kernel; and
5. wire only this source-derived branch into the live five-incidence consumer.

## Immediate scope

The finite cyclic-order split, its signed-area transport, the coordinate-free
family-13 product consumer, and the hard-source wrapper now compile and are
published.  Commit `7bea392c3` proves
`HardSourceSwapExactGridRoles.false_of_fourthIncidence_exactGrid`: in the
fourth-incidence exact-grid branch it closes the subcell where `oppApex2` also
belongs to row zero.  An independent audit found only core axioms in the two
new declarations and confirmed every source-role and sign transport.

That theorem does not cover the complementary source cell.  A bounded indexed
Lean search at worktree revision `7bea392c3`, against the corpus indexed from
`0832ec561`, found no source-clean terminal.  The closest result,
`threeFan_shared_support_intersection_normalForm`, exposes
`oppApex2 ∉ row₀` as a residual.  The direct common-deletion constructor can
package deletion at `oppApex2`, but no current acyclic consumer closes that
self-deletion packet.

The prior opposed-turn mine does not test this complement.  Its retained
predicate requires `c2 ∈ T0`; all six residual profiles therefore lie in the
already handled membership side.  The parent order census contains 2,104
profiles with `c2 ∉ T0`, including 80 authenticated SAT/SAT survivors.
Profile 34 is the first fully determined survivor and has two authenticated
fixed orders, so it is the next diagnostic target.

The next computation is a PIQD-only, fixed-order source QF_NRA wave for profile
34.  Each of its two target cells must carry 13 role classes, 26 coordinates,
four gauge constraints, 13 row equalities, one radius disequality, one
source-strict inequality, and 286 strict signed-area constraints, together
with positive and negative controls.  Any result remains diagnostic until a
Lean source adapter proves that the abstract `T0` row is the live row zero.
