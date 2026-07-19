# Bi-apex terminal-coupling audit

Date: 2026-07-17

Status: **SOURCE-VERIFIED CONSTRUCTOR AUDIT. The
`matchingSourceReturn` / `jointDeletion` leaf receives the strongest genuinely new consequence from
`B.secondApex_robust`, but no constructor reaches an existing direct-`False`
consumer. The narrowest live residual is a direct branch theorem on the
existing source-return joint-deletion data, the coupled frontier escape, and
`L`; no new packet is proposed. No production `sorry` is closed.**

## Scope and preflight

This audit reads the current production boundary

```lean
N : FrontierCoupledStrictInteriorNormalForm R
```

together with

```lean
B : FrontierBiApexRobustResidual R
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

where the cap-strengthened wrapper `L` is currently a source draft in
`large-opposite-caps-biapex-surface/`. It does not repeat the completed
`RobustSecondApexMinimalDeletion` trichotomy.

Before comparing local row and incidence consumers, the required registries
were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered physical-second-apex
deletion robustness, mutual-omission cycles, source-return U5 rows, three
distinct blocker cycles, `CriticalFiberClosingCore`, `false_of_two_cycle`,
the serial two-circle consumers, and strict-lap nonreturn. The searches
recover the current production consumers and the sibling U5/strict-lap banks,
but no theorem whose hypotheses are supplied by one of the four constructors
plus `B` and `L`.

The relevant negative bank facts are load-bearing:

- the source-return q-critical row meets its dangerous triple in at most one
  point, so the imported two-dangerous-point consumer is not a producer
  target;
- the exact-four source-return arm has the checked
  singleton/pair/forced-absence incidence pattern;
- `u1TwoLargeCapObstruction` still needs its seven named metric equalities;
- `strictLapPacket_nonreturn` first needs a same-cap chain/rank packet; and
- the legacy inventories contain fixed-nine or bounded-local consumers, not
  a current `CriticalShellSystem`-indexed classifier.

## What is common to all four constructors

For every carrier source `q`, `B.secondApex_robust.survives q hq` gives

```lean
HasNEquidistantPointsAt 4 (D.A.erase q) S.oppApex2.
```

This is a deletion-survival existential. It does **not** say that
`S.oppApex2` is equidistant from `q` and another named point, and it does not
put a named pair into a selected row. In particular it cannot be rewritten
into the old shared-radius pair target.

The two fields of `L` add

```lean
6 <= S.oppCap1.card
6 <= S.oppCap2.card
```

and hence `14 <= D.A.card`. They permit fresh carrier choices outside a fixed
four-shell, but they do not determine the new point's actual row, blocker, or
cross incidence. The `frontierEscape` field of `N` retains the original
frontier pair, physical second-apex row, and refined escape, but no production
theorem identifies any strict-interior constructor source with those frontier
roles. Thus that provenance must remain in the branch theorem, but it does not
currently fire a terminal by projection alone.

## Four-constructor audit

| `RetainedStrictInteriorTerminalSurface` constructor | Exact new consequence of `B.secondApex_robust` | Existing direct terminal? |
| --- | --- | --- |
| `localizedCollisionMutualOmission collision commonDeletion cycle` | Both `cycle.collisionSource` and `commonDeletion.fresh` survive deletion at `S.oppApex2`. Together with the two stored packets, each source is deletable at the first apex, the second apex, and the other source's actual blocker. The two sources are distinct strict-first-cap points with distinct actual blockers. | **No.** `CriticalFiberClosingCore.sameCap` needs a second center equidistant from the collision pair, not deletion survival after removing either member. The serial two-circle and ordinal-cycle consumers still need a positive shared pair and boundary placement. |
| `matchingSourceReturn walk outcome` | In the `jointDeletion data ingress` leaf, the one named source `data.source` already survives deletion at the first apex and at both distinct actual blockers; `B` adds the physical second apex. Those four centers are pairwise distinct: first-apex robustness separates both actual blockers from `S.oppApex1`, second-apex robustness separates them from `S.oppApex2`, the walk separates the blockers, and the two Moser apices are distinct. In the exact-four leaf, `B` similarly adds a third q-deleted center to each partner side. | **No. This is the strongest genuinely new branch.** The joint leaf now has one q-critical row and three source-faithful q-deleted rows in addition to its dangerous first-apex triple, but the registered U5 consumers still require named center identifications and cross-support incidences. `CriticalFiberClosingCore` needs an equal-blocker fiber, which this distinct-blocker source return does not supply. |
| `matchingEndpointCriticalFiber walk fiber fresh continuation` | `fresh.J`, both fiber sources, and the walk sources all survive deletion at `S.oppApex2`. On `freshCommonDeletion`, the deleted endpoint `fresh.K` therefore survives at three distinct centers: both physical apices and `H.centerAt fresh.J`. On `crossHit`, robustness adds a q-deleted physical row but no new metric equality on the fiber pair. | **No new terminal.** The `crossHit` leaf is already the constructor closest to closure, but for reasons independent of `B`: it has every non-order field of `OrderedCrossRowCore`. Its first missing field remains the compatible six-role boundary placement. Robustness does not supply that order. The `freshCommonDeletion` leaf still lacks a shared pair between its rows. |
| `matchingThreeDistinctBlockers walk path continuation` | All three walk sources survive deletion at `S.oppApex2`. On `threeStepCycle`, this upgrades every edge of the source-exact three-cycle to survival at both physical apices plus the predecessor's actual blocker. On `crossHit`, it adds physical deletion rows for the three sources while preserving the one positive closing incidence. | **No.** The three actual blockers are pairwise distinct, so there is no critical fiber. `false_of_two_cycle`, the serial two-circle sinks, and the U5 bank all still require a named shared pair/cross row and a compatible cyclic placement. A robust q-deleted row does not provide either. |

### Why `matchingSourceReturn / jointDeletion` wins this comparison

The endpoint `crossHit` leaf remains nearest to an already-proved terminal,
but `B` contributes no load-bearing antecedent there. By contrast, on the
joint source-return leaf it adds a genuinely fourth distinct center at which
the same named source can be deleted while K4 survives. This is stronger than
the two three-center consequences in the collision and endpoint-common-
deletion leaves, and more concentrated than the three-source three-cycle.

It still does not imply a contradiction. The exact first missing positive
fact is a **source-indexed cross-row overlap**, not another deletion packet:
one of the three q-deleted rows must contain the named pair required by an
existing U5, Kalmanson, or two-circle consumer. No current theorem derives
such a membership from deletion robustness.

For the nearest local U5 direction, the first center-confinement fact is
schematically

```lean
H.centerAt data.source
  (mem_selectedClass.mp data.source_mem_radius).1 ∈ ingress.T
```

or the corresponding assertion for one of the two actual blocker centers.
Even this is not sufficient alone: a named bank consumer then still needs its
listed support incidences. It is therefore not honest to introduce that
center statement as a standalone producer packet.

## Narrowest live residual and exact theorem target

Do not add another generic structure. The narrowest source-valid next target
is direct `False` on the existing joint-deletion constructor while retaining
the coupled frontier normal form:

```lean
theorem false_of_largeOppositeCapsBiApex_sourceReturnJointDeletion
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    {B : FrontierBiApexRobustResidual R}
    (L : FrontierLargeOppositeCapsBiApexRobustResidual B)
    (frontier : FrontierCommonDeletionRefinedNormalForm R)
    {walk : RetainedMatchingTwoStepCommonDeletionWalk R}
    (data : RetainedSourceReturnJointDeletion walk)
    (ingress : RetainedSourceReturnJointU5Ingress data) :
    False
```

This is not claimed proved. It is the exact leaf exposed when
`N.strictInterior` matches
`matchingSourceReturn walk (.jointDeletion data ingress)`, while
`N.frontierEscape` supplies `frontier`.

The theorem must visibly consume at least one fact absent from the finite
row/deletion abstraction:

1. a full-filter/MEC/cap-order theorem forcing a named cross-row pair;
2. a boundary-placement theorem routing the resulting pair to an existing
   Kalmanson/two-circle sink; or
3. a direct contradiction from the four distinct deletion-survival centers.

The **first missing fact** is item 1: positive membership of a prescribed
two-point pair in one of the source-exact q-deleted rows. Until that fact is
proved with an immediate named consumer, further U5 packets or another
minimal-deletion trichotomy would only rename the same gap.

## Validation and epistemic status

- **SOURCE-VERIFIED:** the four constructors, their nested leaves, `B`'s
  robustness field, `L`'s two cap bounds, and the coupled frontier field were
  read from the current tree.
- **PROVEN IN EXISTING CHECKED SCRATCH/PRODUCTION:** the robust deletion facts,
  source-return U5 ingress, source-return physical reduction, and
  `RobustSecondApexMinimalDeletion` trichotomy cited above.
- **OPEN:** every direct-`False` consumer in the matrix and the displayed
  joint-deletion theorem.
- **NOT RUN:** Lean/Lake build, Lean elaboration, axiom audit, proof-blueprint,
  production edits, and document edits. The active no-build and ownership
  gates were respected.
