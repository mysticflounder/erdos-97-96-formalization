# B1 card-six complete-carrier PointConfiguration ledger

- Lane: `luna-swarm-slice-ingress-b1-card6-pointconfig-20260904`
- Assignment: follow-up to monitor message `#10691` for B1 assignment `#9780`
- Checkpoint: `.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-card6-pointconfig-20260904.json`
- Run manifest: `scratch/runs/luna-swarm-slice-ingress-b1-card6-pointconfig-20260904/run-0001/run_manifest.json`
- Lane base: `2e27a45cee12d2e7c0249dbf1b7e5124402ea4ea`
- Working-tree head observed for this audit: `03912489fe67f3911de3bfbe7a67b2dc10d46ebe`

## Decision

No PIQD session or solver job was launched.  The corrected producer plan is
source-shaped and can carry `hnormal`, `hsix`, and `E` while they remain in
scope, but the first exact-row semantic predicate is not supplied by the
current public B1 ingress.  The stop predicate is the omitted-carrier
exclusion needed to turn the `commonRowChoice` positive subset into an exact
row over the complete carrier:

```text
for every carrier point z outside commonRowChoice.support,
dist Bc.1 z.1 ≠ sourceRadius Bc
```

The public source theorem supplies inclusion in the radius row, not this
negative statement.  The corresponding exact-row exclusions for the other
three choices must also be supplied before emitting exact `PointConfiguration`
constraints.  A positive-radius constraint remains source-backed and is
retained in the ledger below.

## Complete-carrier native plan

The native input is planned as `PointConfiguration/v1` with these bindings:

1. `boundary.points` is the complete carrier enumerated by
   `E.boundary.boundary`, in its source-certified counterclockwise order.  The
   `BoundaryIndexing` fields `boundary_image`, `boundary_injective`,
   `boundary_ccw`, `index_injective`, and `point_eq` are the source bridge.
2. The physical role bindings are `physicalApex`, `d1`, `d2`, `u0`, `u1`,
   `v0`, and `v1`.  The theorem
   `physicalRowChoice_value_image_eq_physicalClass` binds their image to the
   selected physical class; with `hnormal` and `hsix`, the two cardinality
   theorems bind six physical labels and six boundary indices.
3. The source-role bindings are `Bc`, `Bu`, `Bv`, `c0`, `c1`, `uL`, `uR`,
   `vL`, and `vR`, together with the six physical bindings.  Role names are
   not treated as distinct points.  A role alias is retained as an alias
   unless a Lean equality or inequality source fact justifies a branch.
4. The source branches are source-labeled branches for `hnormal`, `hsix`,
   the winning live-slice disjunction, `cap_blocks`, and `cross_omission`.
   They carry no newly invented geometry.  The enriched producer must consume
   these hypotheses directly rather than reconstructing erased proofs from
   `B1FiveSixWaveIngress.cardSix`.
5. The four public row choices are
   `physicalRowChoice`, `commonRowChoice`, `uRowChoice`, and `vRowChoice`.
   `positiveRowsMatch_sourceRowChoices` gives each support as a subset of its
   full-carrier metric row.  `mem_sourceMetricRows_iff` supplies the radius
   equality for a support member, and `realizes_sourceMetricRows` supplies
   the canonical injective carrier realization.  These are the source-backed
   positive row constraints.
6. No ten-class fixed profile and no numeric coordinate gauge is emitted.
   Native free coordinates may choose their generic rigid-motion normalization,
   while the boundary list and source role ledger remain the semantic inputs.

## Source coverage

| Planned fact | Source status | Source witness |
|---|---|---|
| Complete carrier and cyclic order | available | `B1EscapeRowProvenanceStar.boundary` and `BoundaryIndexing` |
| Six physical roles lie in the selected class | available | `physicalRowChoice_value_image_eq_physicalClass` |
| Six physical support labels and boundary indices | available on `hnormal`, `hsix` | `physicalRowChoice_support_card_eq_six`; `physicalRowChoice_boundaryIndex_image_card_eq_six` |
| Positive physical/common/u/v radius rows | available | `positiveRowsMatch_sourceRowChoices`; `mem_sourceMetricRows_iff` |
| Canonical injective point realization | available | `realizes_sourceMetricRows` |
| Alias-polymorphic role ledger | available as a representation rule | no global injectivity is asserted; source equalities remain branch data |
| Winning-slice, cap-block, and deletion branches | available as source branches | fields of `B1EscapeRowProvenanceStar` |
| Exact common row over the complete carrier | missing | omitted-carrier `≠` constraints are not exported by the positive-row theorem |
| Exact u and v rows over the complete carrier | missing pending the same closure | positive inclusion alone does not exclude other carrier points |
| Ten quotient classes in the old fixed order | missing and intentionally dropped | no source certificate fixes that ten-class order or its aliases |
| All-six-role strict-cap interior strengthening | missing | card-six ingress exposes a live-slice disjunction and one-pair cap facts, not an all-six interior certificate |

## Launch gate

The ledger is intentionally prelaunch.  The first unsupported predicate is
the `commonRowChoice` omitted-carrier exclusion recorded above.  Until a
public Lean theorem or a new source-bound adapter proves it, an exact-row
constraint would overstate the source.  Therefore no payload, PIQD session,
QF_NRA formula, or solver result is claimed by this lane.

The old `SMT2-JOURNAL.smt2` and its fixed ten-class profile remain audit
inputs only; their numeric gauge and quotient ordering are not reused.
