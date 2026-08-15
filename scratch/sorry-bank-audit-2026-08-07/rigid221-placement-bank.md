# Rigid221Placement theorem-bank applicability audit (2026-08-07)

Scope: read-only audit of the five `sorry` declarations in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Placement.lean`.
No build was run.  Search used the scoped corpus
`erdos-97-96-formalization-lean` and the canonical registries
`certificates/p97_rvol_general_n_mining.{md,json}`,
`certificates/erdos97_legacy_general_n_mining.{md,json}`, and
`certificates/erdos_general_theorem_p97_mining.{md,json}`.  Literal registry
searches for `Rigid221`, `BlockerV`, `exact-15/16/17`, `Kalmanson`, and
`orderedCut` produced no registry declaration that matches these leaves.

## Shared reachability and bank status

`Rigid221Placement.lean:7` imports only
`FrontierLiveClosure.TwoDeletionCollision`; it does **not** import
`BlockerVExactFifteenFourRowCoverage`, `BlockerVExactSixteenFourRowCoverage`,
any Kalmanson schema module, or the `ExactTwelveRigid221Ordered*` modules.
Thus those bank declarations are not name/import reachable from the current
consumer.  `TwoDeletionCollision.lean` itself contains three textual `sorry`s
(at lines 149, 699, and 798).  Therefore the imported module closure contains
unresolved obligations; without a declaration-level/kernel axiom audit this
note cannot certify that any candidate is independent of those obligations.

The nearest bank consumers are useful only after a new ingress producer:

* `BlockerVExactFifteenFourRowCoverage.false_of_pairwiseSeparated_realizedRows`
  (`.../BlockerVExactFifteenFourRowCoverage.lean:505-516`) requires
  `ConvexIndep A`, an injective boundary `Fin 15 → ℝ²` enumerating `A`, CCW
  convexity, `PositionEmbedding`, four `RealizesRows`, and
  `PairwiseSeparated`.
* `BlockerVExactSixteenFourRowCoverage.false_of_pairwiseSeparated_realizedRows`
  (`.../BlockerVExactSixteenFourRowCoverage.lean:524-534`) has the same metric
  interface with `Fin 16`, an insertion coordinate, and the exact-sixteen
  separation predicate.  Its imports are the exact-fifteen bank and
  `KalmansonFourEqualitySchemas`; the four/five-equality schemas themselves
  are metric consumers, not placement producers.
* The exact-12 ordered cuts (for example
  `ExactTwelveRigid221OrderedCoreConsumer.false_of_orderedCut_706`,
  `.../ExactTwelveRigid221OrderedCoreConsumer.lean:106-116`, and the later
  `OrderedCoverageCuts.false_of_orderedCut_*` declarations) require
  `row : RowPattern Label`, `Realizes row pointOf`, a
  `FrozenBoundaryOrder`, `FrozenForcedSecondCapOrder`, and explicit equalities
  for seven or more named rows.  None accepts the `P` packet directly.
* The exact-17 material is currently a prose/finite producer-bank record
  (`docs/rigid221-three-shell-classification-2026-08-06.md` and the closure
  plan), not an importable exact-17 coverage theorem.  The record explicitly
  leaves the source-faithful exact-17 coverage/producer bridge open.

All inspected candidate source files have no textual `sorry` or `axiom`; their
transitive dependency closures were not freshly built/audited because this task
was read-only/no-build.

## Five target leaves

### 1. `false_of_exactFourMutualOmissionRigid221_minimalCore`

Location: `Rigid221Placement.lean:543-584`.

Target hypotheses are `12 ≤ D.A.card`, robust exact-four surface, positive
`rho`, a selected class of size at least five and then exactly five, mutually
omitting `u,v`, a `ExactFourMutualOmissionSourceContext`, a rigid global
deletion, `globalDeletion.center ≠ S.oppApex2`, and a concrete
`MinimalDeletionCore`; conclusion `False`.

Classification: **no new applicable hit**.  The exact-15/16 consumers could be
useful downstream metric closers, but the target supplies neither a finite
15/16 boundary enumeration nor `PositionEmbedding`, realized rows, or
pairwise separation.  The exact-12 cuts likewise lack a row pattern/order.
First missing bridge: a source-faithful producer converting the arbitrary global
minimal core and rigid selected supports into a finite boundary placement with
the bank's row incidences (and a cardinality reduction to 12, 15, or 16).

### 2. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerDeleted`

Location: `Rigid221Placement.lean:749-759`.

The only extra input beyond the packaged `P` context is
`centerAt source = jointDeletion.deleted`.  `P` carries `hcard : 12 ≤ card`,
the exact-five physical class, two selected supports, omissions, and the global
deletion center equality, but no global boundary order or finite row realization.

Classification: **no new applicable hit**.  Neither exact-15/16 coverage nor an
exact-12 ordered cut consumes blocker-equality alone.  First missing bridge:
derive a source-faithful row/boundary placement (or a separate geometric
minimal-core contradiction) from the deleted-row identity and all omitted-row
data.  A finite bank can only be used after that producer exists.

### 3. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`

Location: `Rigid221Placement.lean:903-914`.

Inputs are `P`, source blocker equality to `P.v`,
`sourceRowInteriorCount = 2`, and `P.v` in the strict physical second-cap
interior.  The count is only a cardinality of one selected support intersected
with the cap; it is not the four-row `OutsidePair`/`RealizesRows` interface.

Classification: **no new applicable hit** (exact-15/16 Kalmanson consumers are
conditional useful helpers).  The exact-12 ordered consumers need all named
row equalities and a common frozen boundary order, which are absent.  First
missing bridge: lift the heavy source-row count and strict-cap membership to
ordered boundary labels plus enough shell equalities to trigger a banked
Kalmanson motif, or prove a new cardinality-independent row-heavy consumer.

### 4. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_oppositeRowHeavy`

Location: `Rigid221Placement.lean:926-940`.

Inputs are `P`, blocker membership in the `v` selected support intersected with
the physical class, `sourceRowInteriorCount ≠ 2`, and
`oppositeRowInteriorCount = 2`.

Classification: **no new applicable hit**.  These support-membership and
interior-count facts do not imply the finite boundary order, exact cardinality,
or four realized rows required by the exact-15/16 bank; they also do not supply
the explicit exact-12 row equations.  First missing bridge: an order/placement
producer for both selected supports that preserves the two-row heavy shape and
exposes a checked metric motif.

### 5. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerVRow_sparseRows`

Location: `Rigid221Placement.lean:951-965`.

Inputs are the same blocker-`v`-row membership plus both row counts unequal to
two.  This is a cap-shape split, not a metric placement statement.

Classification: **no new applicable hit**.  The prose exact-17 three-shell bank
mentions an exceptional `1+1+1` pattern, but no Lean theorem produces that
pattern from `P`, and the exact-12 ordered cuts remain fixed finite row
equalities rather than a generic sparse-row consumer.  First missing bridge: a
source-faithful sparse-row producer (or universal lift) connecting the two
interior-count inequalities to an ordered three-row/four-row metric
contradiction.

## Bottom line

No exact closer is currently import-reachable or hypothesis-applicable for any
of the five declarations.  The exact-15, exact-16, Kalmanson A--G, and exact-12
ordered-cut files are **useful consumer banks only**.  The common first missing
bridge is a universal/source-faithful placement theorem from the live
`ExactFourRigid221PhysicalApexSourceEqUContext` (or its minimal-core arm) to a
boundary order plus explicit row incidences/equalities.  Exact-17 currently has
the same missing producer, with no Lean coverage theorem to reuse.
