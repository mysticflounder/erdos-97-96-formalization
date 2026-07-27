# P4 direct total-valuation preflight

## Result

**Build-free classification: conditionally feasible after two authenticated
ingress repairs; not composable as currently materialized.** The compact
manifest fixes 19,048 clauses and 2,557 dense variables. Its source map gives
each dense variable exactly one of the seven semantic families below, so a
single direct valuation is the right architecture. This is only a plan for a
theorem conditional on `Q : DirectSource ...`; `nonempty_directSource_or_mirrorPacket`
is a direct-or-mirror disjunction, not a global direct-branch witness.

No Lean build was run. This report records static source/ledger inspection;
it does not close P4, production replay, or source-to-CNF satisfaction.

## One valuation

Generate an authenticated `binding : Fin 2557 -> CompactAtom` from
`p4.input-core-map.json` plus the manifest's `dense_variable_renaming.old_to_new`,
with a totality/uniqueness theorem. Define

```
directVal Q i := interpCompactAtom Q (binding i)
```

where `interpCompactAtom` has exactly these cases:

| compact family (variables) | direct meaning / existing interface |
|---|---|
| `selected_row_membership` (110) | `membershipVal Q.curvature : MembershipAtom -> Prop`; bridge it to `rowMem Q.packet.core directIndex` |
| `complete_radius_equality` (495) | `radiusEq Q.packet.core directIndex` |
| `first_apex_class` (11) | `classHit Q.packet.core directIndex` |
| `blocker_choice` (21) | `blockerVal Q.packet.core directIndex` |
| `critical_support` (68) | `criticalSupportVal Q.packet.core directIndex` |
| `row_support` (1,716) | `rowSupportVal Q.curvature : RowSupportAtom -> Prop` |
| `outer_arc` (136) | `outerArcVal Q.curvature : OuterArcAtom -> Prop` |

The first three core predicates are in
`unique4-exact-two-source-bridge/IndexedSource/IndexedSourceValuation.lean`
(`directIndex`, `rowMem`, `radiusEq`, `classHit`). The blocker/support
predicates and the mixed five-family contract are in
`unique4-p4-critical-support-occurrence-bridge/Core.lean` and `Families.lean`
(`blockerVal`, `criticalSupportVal`, `interpAtom`, `ValAgreement`). Relevant
source implications include `blockerVal_zero_iff`,
`classHit_of_criticalSupportVal`, `criticalSupportVal_of_classHits`,
`criticalSupportVal_of_blockerVal_rowMem`,
`criticalSupportVal_of_blockerVal_radiusEq`, and
`radiusEq_zero_of_classHits`.

`P4DirectOuterArcAdapter.lean` supplies the remaining three meanings and
direct clause theorems: `membershipVal`, `rowSupportVal`, `outerArcVal`,
`direct_memberships_imply_row_pattern`,
`direct_row_pattern_implies_outer_arc`, and
`direct_no_four_turn_disjoint_outer_arcs`. Its curvature source is made from
the same `ExactTwoBoundaryCore` (`P5CurvatureSource.ofExactTwoBoundaryCore` in
`P5RetainedOuterArcMasks.lean`), hence these are compatible semantic layers,
not competing geometries.

## Clause coverage shape

The manifest partitions the 19,048 clauses as follows: direct outer families
10,614 = 1,265 membership-to-row + 3,179 row-to-arc + 6,170 four-arc; generic
core families 6,311 = 3,218 radius partition + 441 row/radius + 392 mutual
triangle + 981 row-at-least-four + 1,279 cyclic; critical-support 121;
first-apex 30; exact-two 4; cap residual 55; Kalmanson 1,907; CEGAR 6.

Existing generic source theorems are in
`unique4-p4-source-bridge/P4GenericFamilies.lean`; its radius-partition
occurrence transport is in `unique4-p4-radius-partition-occurrence-bridge/`.
The existing critical `ValAgreement` is useful semantic evidence but **cannot
be used at raw variable numbers**: `GeneratedData.lean` defines its native
namespace as `rowVariable = 1 + ...`, `radiusVariable = 111 + ...`, etc.,
whereas the compact map renames old source variable 2 (`m_0_1`) to dense
variable 1. Every old bridge therefore needs a proved renaming transport to
`binding`, or regenerated compact occurrences.

## First obligations, in order

1. Materialize `CompactAtom`, `binding`, and a literal transport theorem from
   the authenticated 2,557-entry renaming. Prove the membership bridge
   `membershipVal Q.curvature <-> rowMem Q.packet.core directIndex` by
   unfolding `selectedRowSupport`/the core curvature construction.
2. For every occurrence bridge, prove its displayed variable/atom pair is
   `binding`; use that to construct the relevant `ValAgreement` from
   `directVal`. In particular, add a compact occurrence sidecar for the
   existing 3,179 `DirectRowArcFiniteDatum` entries: its current
   `P4DirectOuterArcFinite.lean` schema has no compact-variable binding.
3. Regenerate the four-arc sidecar before attempting a global theorem (detail
   below), then transport the generic/critical/cap/Kalmanson/CEGAR blocks into
   the common dense namespace. Only after these per-family transports can a
   clause-index partition compose `forall c in compactLedgerClauses,
   clauseSat directVal c`.

## Current four-arc blocker

`MembershipRowOccurrences.lean` is globally promising: its generator maps
each core signed literal to its dense literal and then emits source-terminal
order; its theorem `allMembershipRowOccurrences_sat` needs one total
`DirectOuterValAgreement`.

`FourArcOccurrences.lean` deliberately exposes only a local
`DirectFourArcOccurrenceAgreement`. The reason is a generator defect, not an
intrinsic occurrence-variable issue: `four_arc_generate.py` takes
`ledger["dense_literals"]` (core order) and zips it with terminal-order arcs.
The ledger preserves core order. A static audit of all 6,170 records / 24,680
literal slots found 120 outer dense variables, of which **111 acquire multiple
arc meanings** (maximum 82); e.g. dense 712 globally means
`outer_arc(0,left,{0})` but is also paired with `outer_arc(6,left,{5})`.

Recompute each terminal signed literal through `old_to_new` before the zip,
as the membership materializer does. The same audit then has 120 variables,
**zero** conflicting meanings, and maximum one meaning per variable. Thus the
required repair is a deterministic re-materialization plus a global four-arc
agreement theorem; do not rely on the present local agreements for a total
valuation.

## Inputs inspected

- `unique4-exact-two-core-map/p4.input-core-map.json`
- `unique4-exact-two-core-map/generated/p4-seed0-compact/p4-seed0-compact-manifest.json`
  and `p4-seed0-compact-occurrences.jsonl`
- `unique4-p4-direct-outer-occurrence-bridge/MembershipRowOccurrences.lean`,
  `FourArcOccurrences.lean`, and `four_arc_generate.py`
- source/critical/generic paths named above.

The indexed Lean corpus was searched first for the P4 direct-valuation and
seven-family names; it provided no already-composed compact direct valuation.
