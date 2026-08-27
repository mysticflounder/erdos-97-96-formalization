# P97 Rigid221 card-18 labeled enrichment contract (v1)

**Status: ALL LABELED-ENRICHMENT PUBLICATION GATES COMPLETE.**

Lane: `rigid221-card18-labeled-enrichment-v1-20260827`.

Lane base: `24138603d086bfa3b21f9596d3e0a728da2a2eb9`.

## 1. Purpose and reviewed order

The crossed-incidence projection and predicate-coverage v2 checkpoint close
the exact twelve-row missing-incidence bookkeeping requested by the 2026-08-27
review. Before the pure finite `Rigid221Card18AbstractPacket.Valid` boundary,
the same review requests three further source-derived exports:

1. the selected `xv` row and the two stored sources outside it;
2. the physical exact-five class, the selected row at `deletedCenter`, the
   deleted-center off-class fact, and their intersection-cardinality bound;
3. the actual blocker label and two center-separation facts for each
   common-deletion packet in the bi-survival arm.

`Rigid221Card18LabeledEnrichment` supplies exactly this bounded prerequisite.
It is a new off-spine module. It does not edit the already frozen finite-data,
labeled-projection, crossed-incidence, or custody roots and therefore does not
invalidate their historical receipts.

No new custody layer is created here. The next proof-facing boundary is the
pure finite abstraction and its source-to-valid-packet theorem.

## 2. Reuse preflight

The bounded current-project Lean-corpus search for a Rigid221 card-eighteen
finite packet found the existing finite-data, labeled-projection, and
crossed-incidence modules, but no pure abstract packet or equivalent common
enrichment record.

The immediate consumer is `Rigid221Card18AbstractPacket.Valid`. The first
missing antecedents for its reviewed stronger surface were exactly the three
groups listed above. The producers are already present in the imported source:

- `Rigid221ExactCardEighteenSource.source₁Outside` and `source₂Outside`;
- `ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket.physical_class`;
- `ExactFourRigid221PhysicalApexSourceEqUContext.hclassFive`;
- `Rigid221ExactCardEighteenSource.hcenterDeletedOffClass` and
  `hnextRowPhysicalHits`;
- `CommonDeletionTwoCenterPacket.actual_blocker_ne_center₁` and
  `actual_blocker_ne_center₂` for each endpoint deletion; and
- `packet.blocker_eq_xv`, `P.huSource`, and `Q.hblockerEqV`, which identify the
  two actual blockers with the already labeled roles `xv` and `v`.

The reuse is acyclic. The imported direct-sorry declarations in
`Rigid221SourceHeavy` are contradiction consumers, not dependencies of these
constructors; the declaration-level axiom audit below is the governing check.

## 3. Common labeled enrichment

`Rigid221CommonLabeledEnrichment source roles` stores only labels and labeled
supports derived from an existing exact-card-eighteen source and its role map.

### 3.1 Selected `xv` row

`selectedXvRow` is a `LabeledFourSupport` for the exact critical-four support
selected at `source.packet.xv`. It carries exact cardinality four and exact
geometric origin through the existing labeled-support interface. The record
also exports:

- `xv_mem_selectedXvRow`;
- `u_mem_selectedXvRow`;
- `source1_not_mem_selectedXvRow`; and
- `source2_not_mem_selectedXvRow`.

The two negative fields are transported directly from the stored source
outside-row witnesses. No distinctness or nonmembership is inferred from a
Python validator.

### 3.2 Physical exact-five class

`physicalFive` is exactly

```text
labelsOf source.carrier (SelectedClass D.A S.oppApex2 source.P.rho).
```

The record proves both `physicalFive.card = 5` and the exact labeled identity

```text
physicalFive = {deleted, u, xu, v, xv}.
```

The cardinality comes from `P.hclassFive`; the identity is the transport of
`packet.physical_class` through the injective stored carrier labeling. This
does not add the stronger physical-five distinctness assumptions used by the
historical Python packet as caller-supplied input.

### 3.3 Deleted-center row

`deletedCenterRow` is the exact four-point selected support at the role whose
point is the actual center selected from the joint-deletion source. The record
exports:

- `deletedCenter_mem_deletedCenterRow`;
- `deletedCenter_not_mem_physicalFive`; and
- `(deletedCenterRow.labels ∩ physicalFive).card ≤ 1`.

The last theorem transports `source.hnextRowPhysicalHits` through
`labelsOf_inter_eq` and `labelsOf_card_eq`. It is not a geometric
reconstruction or a fresh counting assumption.

## 4. Bi-survival blocker enrichment

`Rigid221BothDeletionsLabeledEnrichment` retains the complete existing
`Rigid221BothDeletionsLabeledData` plus the common enrichment. It names two
finite blocker fields:

- the actual blocker for deletion of `u`, proved equal to `roles.xv` using
  `P.huSource` and `packet.blocker_eq_xv`;
- the actual blocker for deletion of `xv`, proved equal to `roles.v` using
  `Q.hblockerEqV`.

Each field is linked back to its exact geometric `centerAt` point and is proved
distinct from both `actualCenter1` and `actualCenter2`. The four inequalities
come only from the corresponding `CommonDeletionTwoCenterPacket` fields.

In particular, the second blocker is not a fresh role and must not be claimed
distinct from `v`; it is exactly `v`.

## 5. Total enriched alternative

`Rigid221ExactCardEighteenEnrichedAlternative` preserves the three canonical
arms:

- `bi` retains the bi-survival blocker enrichment;
- `u` retains its complete crossed-incidence projection and common
  enrichment; and
- `xv` retains its complete crossed-incidence projection and common
  enrichment.

`rigid221ExactCardEighteenIncidenceAlternativeToEnriched` is constructor-total
and only attaches the source-derived fields above. It does not invoke the
source existence theorem or an open contradiction leaf.

## 6. Trust and nonclaims

The target module contains no `sorry`, `admit`, added axiom, `native_decide`,
`run_tac`, `Lean.ofReduceBool`, direct `Classical.choice`, or direct
`Classical.choose`.

This checkpoint does not provide or authorize:

- canonical external bytes or a source-witness serializer;
- Python/Lean semantic equivalence;
- a solver formula, CNF, model, UNSAT certificate, or checked correspondence;
- a finite exhaustive theorem;
- a general-cardinality lift from `18 ≤ D.A.card`; or
- a canary run.

Historical predicate-coverage manifests remain immutable. A later isolated
coverage refresh may mark only the newly emitted finite facts; it may not turn
source entitlement, hard-clause admission, serializer, solver, or canary flags
on.

## 7. Acceptance gates and evidence

This checkpoint is publishable only after:

1. the governed target build succeeds;
2. the focused forbidden-mechanism scan is clean;
3. declaration-level axiom reports for the common constructor, bi constructor,
   and total conversion contain no `sorryAx` or native/external evidence;
4. independent review checks exact source identities, support selection,
   intersection transport, blocker association, and nonclaims; and
5. exact-path staged hygiene passes.

On 2026-08-27, the governed build completed all 11,032 jobs. The three printed
axiom reports contain only `propext`, `Classical.choice`, and `Quot.sound`,
inherited through the imported source chain. The module is 18,989 bytes with
SHA-256 `62e2d79bb56e7f87c7b5aa56398485fc547033ba369a2affe50fc8698b8b1bec`.
The focused forbidden-mechanism scan, whitespace check, and 100-column check
are clean.

Independent review returned **GO** for the exact selected-`xv` support and
outside facts, physical-class/card transport, deleted-center support and
intersection transport, both blocker identities and all four separations,
constructor-total arm association, and every nonclaim. It found no false
distinctness, circularity, forbidden mechanism, or overclaim. Exact-path
staged hygiene then passed with zero lane issues and no blocking staged path.

## 8. Next boundary

After this bounded enrichment and its isolated coverage refresh, define the
pure arm-indexed `Rigid221Card18AbstractPacket` with no real points, radii,
dependent geometric rows, or arbitrary source labeling object in its state.
Its decidable `Valid` predicate must include only proved finite consequences,
and `source_to_abstract_packet` must map every source alternative to a valid
packet. A search or SAT result remains diagnostic until a checked
`Valid`-to-formula correspondence and certificate path exists.
