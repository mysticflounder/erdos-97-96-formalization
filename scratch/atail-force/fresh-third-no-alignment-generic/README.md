# Fresh-third blocker fiber with no same-cap cross row

This directory is a source-audited v4 computational frontend for the live
obligation

```lean
Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.
  false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
```

at `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7556`.
It is a named necessary-condition projection only. It is not a finite model of
the carrier, a CEGAR run, an UNSAT result, or Lean closure.

## Files

- `model.py`: quantifier-free Z3 frontend with alias-aware points, a functional
  blocker map, cap membership, uninterpreted distance classes, the local
  tri-apex consequences, four materialized common-deletion packets, and the
  named anti-survival consequence at every represented source and its actual
  blocker.
- `schema.json`: declarative role/row map and explicit omission ledger.
- `self_test.py`: regression checks of the three cap rotations, rich-structure
  disjunctions, and delicate alias behavior.

Run:

```bash
uv run python scratch/atail-force/fresh-third-no-alignment-generic/self_test.py
uv run python scratch/atail-force/fresh-third-no-alignment-generic/model.py \
  --surplus-index 0 --blocker-relation equal --rich-pattern SKK
```

The second command should be read only as a probe that the required blocker
alias remains permitted while choosing the six-point/two-K4/two-K4 Lean
branches in `oppApex1,oppApex2,surplusApex` order. A chosen arm is asserted;
the other arm is not negated.

## Recorded v4 results (2026-07-30)

Here `S` chooses the six-point arm and `K` chooses the two-distinct-K4 arm, in
`oppApex1,oppApex2,surplusApex` order. With `surplus_index = 0`, every literal
branch combination remains satisfiable:

| Pattern | Solver status | Seconds | Artifact |
|---|---:|---:|---|
| `SSS` | SAT | 32.260115 | `v4-SSS.json` |
| `SSK` | SAT | 30.319620 | `v4-SSK.json` |
| `SKS` | SAT | 26.685726 | `v4-SKS.json` |
| `SKK` | SAT | 32.950987 | `v4-SKK.json` |
| `KSS` | SAT | 34.668030 | `v4-KSS.json` |
| `KSK` | SAT | 48.067053 | `v4-KSK.json` |
| `KKS` | SAT | 31.351960 | `v4-KKS.json` |
| `KKK` | SAT | 27.709100 | `v4-KKK.json` |

Thus no rich-structure branch is eliminated by this frontend. The unforced
rich disjunction is SAT under all three blocker-relation probes: `free`
(35.689601 s, `v4-free.json`), `equal` (25.484312 s, `v4-equal.json`), and
`distinct` (35.093366 s, `v4-distinct.json`). In the equal model `bs = bq`,
while neither blocker aliases an apex. The `SSS` rotation probes are also SAT
for `surplus_index = 1` (39.467684 s, `v4-rotation1-SSS.json`) and
`surplus_index = 2` (22.541348 s, `v4-rotation2-SSS.json`).

The v4 regression suite passes all 12 tests in 195.945 seconds. These are SAT
models and implementation checks for a named necessary-condition relaxation;
they neither eliminate a Lean branch nor close the live theorem.

## Exact Lean map

| Frontend data | Lean source |
|---|---|
| `v1,v2,v3`, `cap_mem`, cyclic closed-cap endpoint pattern | `Cap/Structure.lean:143`; `Cap/PartitionFromMEC.lean:463` |
| `opp_index1 = surplus+1`, `opp_index2 = surplus+2` modulo 3 | `Cap/PartitionFromMEC.lean:521` |
| `p1,p2 -> bp`, `r1,r2 -> br`; four pairwise-disjoint sources in the first opposite strict interior | `ATail/RetainedStrictInteriorPairSelector.lean:69`; section hypotheses at `FrontierLiveClosure.lean:7401` |
| apex rows `{p1,p2,pf3,pf4}` and `{r1,r2,rf3,rf4}`, distinct radii, exact strict-interior intersections | `FrontierLiveClosure.lean:7408-7422` |
| selected critical rows at `bp` and `br` | equal-blocker collision data plus `U1CarrierInjection.lean:1079` |
| at each of `oppApex1`, `oppApex2`, and `surplusApex`: a positive six-point selected class OR two distinct positive selected classes of cardinality at least four | the literal definition of `ApexRichClassStructure`, `ApexRichClassStructure.lean:50-53`; fields `T.oppApex1_rich`, `T.oppApex2_rich`, `T.surplusApex_rich`, `FrontierLiveClosure.lean:6582-6590` |
| no represented blocker is any of `v1,v2,v3` | the three `FullyDeletionRobustAt.blockerVertex_ne` consequences, `DeletionRobustness.lean:153`, instantiated at `FrontierLiveClosure.lean:10970-10984` |
| no represented center sees all three apices at one positive radius | `T.no_center_covers_all_apices`, `FrontierLiveClosure.lean:6597` |
| `LPρ` fresh `r1`, `LP` fresh `p1`; the selected MP collision sources, blocker identities, freshness, and both directed omissions | `LocalizedCollisionCommonDeletion`, `RetainedStrictInteriorPairSelector.lean:423`; `LocalizedCollisionMutualOmissionCycle`, `LocalizedCollisionMutualOmissionCycle.lean:131` |
| the four MP nested two-center packets, including two q-deleted cardinality-four witness rows and overlap at most two in each | `CommonDeletionTwoCenterPacket`, `CommonDeletionTwoCenter.lean:29` |
| cap source `source -> bs`, first-opposite strict interior, fresh from all four sources, exact selected row | `CapSourceThirdCanonicalRowWitness`, `FrontierLiveClosure.lean:7457` |
| two OR omissions from the cap-source row | the proved `CrossPairDeletionView.omits` projection, `TwoCollisionGlobalProducer.lean:527` |
| distinct `q1,q2`, common functional blocker `bq`, freshness from all four sources, mutual critical-shell incidence | `FreshThirdBlockerFiber`, `BlockerMultiplicityGeometry.lean:70` |
| after deleting any represented source alias class, at most three distinct named points survive on any positive radius about its actual functional blocker | `CriticalShellSystem.no_qfree` / `no_qfree_at`, `U1CarrierInjection.lean:1010,1036`; the special override instance for `q2,bq` occurs at `FrontierLiveClosure.lean:10433` |
| three literal `NOT(AND(...))` cap cases | `FreshThirdSameCapCrossRowAlignment` and its negation, `FrontierLiveClosure.lean:7481,7560` |

The all-large inherited branch is represented only by six distinct named
witnesses in each cap; the cap-source hypothesis strengthens the first
opposite cap to eight. These witnesses express lower-bound consequences, not a
claim that the named quotient is the whole cap.

The localized-cycle projection now keeps the source choice on each side:
`mpr_source = p1 ∨ mpr_source = p2` and
`mp_source = r1 ∨ mp_source = r2`. Consequently both directed omission fields
remain visible, including the choice-dependent omissions
`mpr_source ∉ Pρ-critical-row` and `mp_source ∉ P-critical-row`.

## Producer and packet audit

The live producer chain is:

```text
exists_secondRadiusInterior_localizedCycle
  -> exists_three_hit_of_two_exactFourInteriorTwo_distinctRadiusBlockerCollisions
  -> exists_three_hit_of_two_collisionRows_capCross_normalForm
  -> exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows
  -> false_of_capSource_freshThirdBlockerFiber
  -> false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow
```

The two calls at `FrontierLiveClosure.lean:11386-11389` produce `LPρ, MPρ`
and the swapped `LP, MP`; the target wrapper is invoked at line 11026.
The exact stored surfaces are:

- `T : FrontierAllLargeCapsTriApexRobustResidual N`
  (`FrontierLiveClosure.lean:6574`): `oppApex1_rich`,
  `oppApex2_rich`, `surplusApex_rich`, `notRobustCover_card`, and
  `no_center_covers_all_apices`. Its production literal is assembled from
  three rotated rich-class facts and `uniqueFourCover_of_triApexRobust` at
  `FrontierLiveClosure.lean:12126-12167`.
- Each of `LPρ, LP : LocalizedCollisionCommonDeletion`
  (`RetainedStrictInteriorPairSelector.lean:423`) stores `fresh`,
  `fresh_mem_capInterior`, `fresh_ne_source₁`, `fresh_ne_source₂`,
  `fresh_not_mem_shell`, and a `packet`.
- Each of `MPρ, MP : LocalizedCollisionMutualOmissionCycle`
  (`LocalizedCollisionMutualOmissionCycle.lean:131`) stores a collision source,
  its carrier and cap-interior memberships, its choice from the collision pair,
  freshness, blocker equality, both directed shell omissions, blocker
  inequality, and the two common-deletion packets.
- Every nested `CommonDeletionTwoCenterPacket`
  (`CommonDeletionTwoCenter.lean:29`) stores source/center memberships,
  distinct centers, two deletion-survival facts, exclusion of the actual
  blocker from both centers, two exact q-deleted K4 rows with cardinality four,
  and support overlap at most two.

Version 4 projects all of the mathematical fields of the four packets nested
in `MPρ` and `MP`. The `MPρ.freshPacket` and `MP.freshPacket` shapes also
witness the proposition-level existence of `LPρ.packet` and `LP.packet` after
the encoded blocker equalities: their `q`, first center, and second center are
the same. The frontend does not assert identity between independently stored
Lean structure values.

For each packet, the two named four-point supports encode:

- four quotient-distinct carrier points;
- exclusion of the deleted source and of that row's center;
- one positive common distance class;
- the two deletion-survival fields, using those same four witnesses; and
- quotient support intersection of cardinality at most two.

This is intentionally not a carrier-wide exact-row assertion.
`U5QDeletedK4Class` only says that its chosen `B` lies in the doubly deleted
skeleton, has at least four elements, and lies on one positive radius. The
packet's `B_card = 4` makes the chosen support exactly four; it does not exclude
additional carrier points at that radius.

## Alias discipline

There is deliberately no assertion `bq != bs`. The Lean hypotheses permit

```lean
H.blockerVertex Q.source₁ = H.blockerVertex source
```

and then the center-distinct conjunct of every positive alignment packet is
false. There is also no unsupported assertion that `source` differs from
`q1` or `q2`. `blocker_of` is a function of the point quotient, so forcing
`source = q1` correctly forces `bs = bq`.

The no-alignment hypothesis is not split into a guessed row miss or cap miss.
For each `capIndex : Fin 3`, the model asserts the literal negation of the
seven-conjunct packet:

1. `bq` is in the cap;
2. `bs` is in the cap;
3. `bs != bq`;
4. `q1` is off the cap;
5. `q2` is off the cap;
6. `q1` lies on the cap-source row;
7. `q2` lies on the cap-source row.

## Metric and trust boundary

The frontend retains only distance equality information justified directly by
the rows: symmetry, zero/separation on the named quotient, equal Moser-triangle
side classes, exact-four selected-row incidence over named occurrences, and
chosen four-point packet witnesses. It has no point order, triangle inequality,
convexity, circular order, arc predicate, Kalmanson inequality, or coordinate
realization.

Exact-four row exclusion quantifies over the named quotient `W`, not all of
`D.A`. The anti-survival family is also a named projection. For every
represented source `q`, its center is the alias-aware term `blocker_of(q)`,
which need not itself have a named occurrence. At every represented positive
radius about that center, each named point surviving deletion of the `q` alias
class must equal one of three existential point-valued slots keyed by
`(q,radius)`. This is exactly the finite at-most-three condition on the named
quotient, not a Euclidean coloring hypothesis.

For an actual blocker term with no separate named occurrence, v4 adds diagonal
zero and outgoing zero/separation against every named point. It does not add
the unused reverse-direction symmetry equations for such unnamed blockers;
symmetry remains exact on every pair of named roles. This is a deliberate
solver-facing weakening and is listed in `schema.json`.

All three rich-apex structures are now materialized as their literal
six-point-or-two-K4 disjunctions. Each lower bound is represented by chosen
distinct carrier witnesses at one or two nonzero distance classes; it is not
an assertion that the named quotient exhausts the selected class. The proved
`blockerVertex_ne` consequences remain separately projected.

The first remaining field of `T` is `T.notRobustCover_card`. It is deliberately
unencoded because it is carrier-global and refers to the full unnamed carrier
and `notRobustCenters`. The derived opposite-cap interior patterns and
two-circle critical-shell intersection bounds, all unnamed carrier points,
other carrier-wide K4 facts, Euclidean realizability, and full
minimality/no-M44 data also remain outside the frontend.
`T.no_center_covers_all_apices` is projected only at represented centers.
`schema.json` records the full omission ledger.

A `SAT` response means only that this relaxation survives. An `UNSAT` response
would concern only the frontend and would still require an independent
source-fidelity audit and a kernel-checked Lean proof before any theorem-level
claim.
