# Full-parent mutual distinct-blocker direct-`False` audit

Date: 2026-07-18

Status: **KERNEL-CHECKED NAMED-CENTER BOUNDARY.  NO DIRECT `False` AND NO
PRODUCTION `sorry` CLOSED.**

## Result

This lane starts from the complete source-faithful surface

```lean
M : FullParentExactFiveMutualData L profile
Q : FullParentMutualFourCenterDeletion M
P : FullParentMutualFourCenterPacketPair Q
```

and retains `M`, `Q`, the robust parent `L`, the concrete
`CriticalShellSystem H`, the unused continuation row, and both
`CommonDeletionTwoCenterPacket`s for the same deleted physical point.

`DistinctBlockerNamedCenterBoundary.lean` proves:

```lean
unusedSource_ne_partner
sourcePair_mem_physicalCap
physicalFirstApex_dist_ne
physicalSecondApex_dist_ne
sourcePair_not_common_to_apexPacket
namedCenter_boundary
currentPacket_not_isM44
```

The geometric content is exact:

1. the continuation unused source and the mutual partner are distinct;
2. both lie in the physical second closed cap;
3. one-sided MEC-cap distance injectivity makes their distances from
   `S.oppApex1` unequal;
4. the exact-five radius filter makes their distances from `S.oppApex2`
   unequal;
5. therefore neither q-deleted row in the physical-apex packet can contain
   both source points; and
6. the two apices, the two actual blockers, and all apex/blocker cross pairs
   have the distinctness asserted by the full-parent packet.

Thus the apex packet is not a hidden provider of the common source pair.  Of
the four centers already named by this branch, only the two actual blockers
could possibly supply the two equal-pair equations needed by the existing
same-cap terminal.  Those equations are exactly the two reciprocal positive
memberships

```text
partner in selectedAt(unused).support
unused  in selectedAt(partner).support.
```

Neither membership is present.  The full-parent packet instead proves that
deleting the chosen physical point preserves K4 at both blockers; that fact
canonically identifies each q-deleted blocker row, but does not put the other
source in it.

## Why this does not prove `False`

The existing terminal

```lean
FullParentMutualSourcePairSameCapCollision.false
```

needs both reciprocal source-row memberships, both blockers in one indexed
closed cap, and both sources outside that cap.  The live four-center packet
supplies none of those six positive fields.  The new theorem rules out trying
to replace either blocker by a physical apex, but negative apex information
does not manufacture the missing blocker incidences or cap placement.

The strongest honest conclusion is therefore a statement-shape boundary,
not a direct contradiction.  A terminal producer must do one of the
following while retaining the full parent:

- produce the complete `FullParentMutualSourcePairSameCapCollision Q` packet;
- produce a different two-point overlap outside a common blocker cap for the
  two canonical blocker rows; or
- prove `False` by a genuinely global nonlinear/minimality argument that does
  not pass through a shared-pair terminal.

Producing only one reciprocal hit is not enough for this particular source
pair, because the checked inequalities show that neither physical apex can
serve as the second pair center.

## Nonlinear MEC/cap-order audit

The ordered-MEC layer is used positively in `physicalFirstApex_dist_ne` via
the production one-sided distance-injectivity theorem.  It gives a strict
separation, not a collision.

The existing exact symbolic cap-local model in
`../cap-local-transport-model/` realizes strict convexity, an exact MEC
triangle, exact cap sizes, no-`M44`, the card-five row, robust second-apex
survival, two distinct exact blockers, and both missing directed cross hits.
It is not a full `CounterexampleData`: all-center K4 and a total critical map
fail at named vertices.  Therefore it blocks a local nonlinear/MEC/cap-order
derivation of either cross hit, while leaving a global K4/total-map coupling
logically open.

The q-deleted-row model in
`../global-mutual-distinct-blocker-terminal/` is source-faithful and has both
canonical blocker rows with intersection of cardinality one and both source
cross incidences false.  It is exact within its finite incidence/cap model,
but is not a Euclidean convex/MEC realization.  Together the two regressions
separate the two obvious incomplete arguments:

- local Euclidean/MEC/cap geometry does not force a cross hit; and
- total-row incidence bookkeeping without Euclidean geometry does not force
  a common pair.

No exact full convex/MEC/all-center-K4/total-critical-map counterexample is
claimed.

## `noM44` audit

`currentPacket_not_isM44` proves that the displayed packet is already not an
`IsM44` packet because its first opposite cap has cardinality at least six.
Consequently the parent's quantified `noM44` field can add force only through
a different MEC support triangle and cap partition.  Applying it to the
current `S` is inert and cannot yield either reciprocal row membership.

## Global minimality audit

The production minimal-deletion extractor has already been tested on the
analogous fixed critical-fiber surface.  It can stutter at an existing actual
blocker with a singleton deletion core.  Hence merely invoking `R.minimal` on
the unused/partner pair does not select a fresh blocker, cap placement, or
cross membership.

Separately, the selected-witness connectivity theorem is already exact: every
chosen witness digraph on a minimal carrier is strongly connected.  The
corrected 101-survivor structural bank already satisfies full one-seed row
closure, so this removes zero survivors.  A useful minimality argument here
must therefore be metric-enriched and must prove progress along the chosen
path, rather than reapplying the existential deletion-core theorem or pure
row reachability.

## Full unused-continuation provenance audit

The unused source is not anonymous in this proof:

- its carrier membership comes from
  `M.continuation.unusedRow.source_mem_A`;
- its physical-cap placement comes from
  `M.continuation.unusedRow.unused.point_mem_capByIndex`;
- its exclusion from the exact-five second-apex class comes from
  `point_not_mem_radiusClass`; and
- its actual blocker and complete selected support remain indexed by the
  same `H` used for the partner.

Those fields are sufficient to prove the two apex exclusions.  They do not
relate the unused support positively to the partner, and total-map provenance
alone only says that both exact rows exist.  The first genuinely new positive
fact on this exact source-pair route remains the reciprocal cross-row
incidence packet, together with compatible blocker/source cap placement.

## Theorem-bank preflight

Before theorem development, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered four-center common
deletion, mutual exact-five source pairs, shared outside pairs, global
minimality, and source-indexed critical rows.  The closest banked consumers
were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `ATailTwoCenterCapLocalization.false_of_two_cap_centers_equidistant_outside_pair`;
- `FullParentMutualSourcePairSameCapCollision.false`;
- the U5 class-level incidence incompatibility families; and
- `u1TwoLargeCapObstruction`.

Every hit consumes positive cross-row equality or common-pair incidence.
None derives that incidence from the two common-deletion packets.  No banked
direct-`False` theorem matched the complete `M/Q/P` surface.

## Validation

The scratch dependencies and the owned module were elaborated to temporary
oleans.  The final focused check was:

```bash
cd lean
LEAN_PATH=/tmp/p97-distinct-direct-oleans \
  lake env lean -DwarningAsError=true -R .. \
  -o /tmp/p97-distinct-direct-oleans/DistinctBlockerNamedCenterBoundary.olean \
  ../scratch/atail-force/full-parent-mutual-distinct-blocker-direct-false/\
DistinctBlockerNamedCenterBoundary.lean
```

It exits zero.  Every printed declaration closes over exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `sorry`, `admit`, `native_decide`, or
`unsafe` declaration in the Lean file.  No production Lean, plan document,
protected lane, or git state was edited.

## Closure status

- Four named centers and source-faithful packet pair: **RETAINED**.
- Physical-apex common-pair shortcut: **PROVED IMPOSSIBLE**.
- Current-packet use of `noM44`: **PROVED INERT**.
- Reciprocal blocker-row cross memberships: **MISSING**.
- Compatible common-cap/source-outside placement: **MISSING**.
- Direct full-parent distinct-blocker contradiction: **OPEN**.
- Production `sorry` closed: **none**.
