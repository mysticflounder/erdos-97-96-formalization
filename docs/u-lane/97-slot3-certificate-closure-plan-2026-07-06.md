<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Slot-3 U-lane certificate closure plan (2026-07-06)

This records the current formalization-repo plan for closing the imported
p97-rvol U1 route-B tail work.  The goal is not to extend the imported local
case split.  The goal is to consume the certificate/metric closure surfaces that
actually sit on the `Problem97.erdos97_rhs` spine.

## Current state

The p97-rvol route-B tail import has already landed in this repo.  The two
copies of `U1LargeCapRouteBTail.lean` are semantically identical apart from
module/import names:

- this repo: `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean`
- source repo: `../p97-rvol/lean/RVOL/P97/U1LargeCapRouteBTail.lean`

The July 5 CP-side rewire is already present here:

- `U1LargeCapRouteBTailMetricResidualTarget.leafSurplusPacket`
- `U1LargeCapRouteBTailMetricResidualTarget.U2NonSurplusSqueeze.oppCap2_escape_gen`
- `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`

`lake-build Erdos9796Proof.P97.RemovableVertexAxiom` succeeds as of this note.
The expected warnings are the live `sorry` declarations.

`proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false
--max-depth 4` reports the current anchor as open with exactly two U1
obligations:

1. `Problem97.u1_largeCap_routeB_tail_liveData_false`
2. `Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`

`proof-blueprint spine Problem97.erdos97_rhs --max-depth 6` reports the publish
spine open through those two slot-3 obligations plus the three slot-2
certificate/census obligations in `RemovableVertexAxiom.lean`:

1. `Problem97.isM44EndpointResidualsExcluded`
2. `Problem97.isM44PinnedSurplusResidualsExcluded`
3. `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`

The two `U2OppCap2Escape.lean` sorries remain off the current publish spine and
must not be treated as live slot-3 closure work unless they are explicitly wired
back into the spine.

## What is already closed

The non-`IsM44` descent adapter is in the right shape:

```lean
Problem97.removableVertexOfLarge_of_nonIsM44 :
  NonIsM44DescentStatement
```

It is config-level, not packet-level.  It builds `CounterexampleData` on the
carrier `A`, derives minimality/no-removable/critical-shell data from the
strong-induction hypothesis, discharges the exact-pair cap-triple branch using
`¬ ∃ S : SurplusCapPacket A, S.IsM44`, and calls
`u1_largeCap_routeB_tail_false` on the non-exact surplus branch.

The double-apex downstream kill is also closed once the residual pair exists:
`oppCap2_escape_gen` turns two off-surplus carrier points that are co-radial from
both packet apices into `False`.

The remaining content of `DoubleApexOffSurplusSharedRadiusPair` is therefore the
metric/certificate claim that the two-large-cap leaf hypotheses force such a
pair, or are themselves inconsistent.

## Non-goals

Do not copy more code from `../p97-rvol` for `U1LargeCapRouteBTail.lean`; the
source and imported files are already aligned.

Do not close the direct `sorry`s in `u1_largeCap_routeB_tail_liveData_false` by
adding more local equality-case wrappers.  The p97-rvol notes classify those
branches as SAT under the finite core vocabulary unless real large-cap,
cap-arc, no-collision, or metric certificate content is added.

Do not introduce new theorem families that merely restate
`DoubleApexOffSurplusSharedRadiusPair`.  A new lemma only counts if it is wired
into the spine and either proves a certificate fact, rules out a finite family,
or strictly narrows the residual.

## Closure workstream A: slot-3 double-apex residual

Target:

```lean
Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair
```

Current proof-facing shape:

1. `leafSurplusPacket` constructs the packet used by the residual from the live
   cap-triple binders, so the `CP.capAt i` large-cap leverage and the
   reflection kill now talk about the same packet.
2. `DoubleApexOffSurplusSharedRadiusPair` asks for two distinct carrier points
   outside that packet's surplus cap, co-radial from both opposite apices.
3. `exists_removableVertex_of_twoLargeCaps` obtains that pair and immediately
   applies `oppCap2_escape_gen`, so a proof of the residual closes the
   `false_of_center_p_t2_t20` subtree.

Concrete plan:

1. Port the p97-rvol metric-census tooling into this repo only when it produces
   a proof artifact or a spine-consuming theorem.  The relevant source artifacts
   are under
   `../p97-rvol/scratch/u1_2_faithful/twolargecap_core/`, especially
   `u12_metric.py`, `certify_globalcount_table.py`, and the
   `u12_metric_sample100_verdicts.jsonl`/global-count certificate outputs.
2. Build the exact constrained census for the `(5,5,4)` two-large-cap slice.
   The needed result is an exhaustive canonical family, not another sampled
   verdict.
3. For each canonical no-double-apex cube, emit a Lean-checkable certificate in
   the existing polynomial-certificate style.  Reuse the
   `EndpointCertificate.Checker` schema only if the generated systems match its
   equality-certificate interface; otherwise add a parallel checker with the
   same exact-rational identity discipline.
4. Add one on-spine theorem, consumed directly by
   `DoubleApexOffSurplusSharedRadiusPair`, that maps the leaf hypotheses into
   the finite census family and applies the certificate row.
5. After each row-family milestone, run:

   ```bash
   cd lean && lake-build Erdos9796Proof.P97.U1LargeCapRouteBTail
   proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false --max-depth 4
   ```

Open uniformity gate:

The finite-bank route must either handle `|A| > 11` or prove a reduction from
the general two-large-cap leaf to the `(5,5,4)` slice.  K4 is not known to be
downward-hereditary, so this cannot be assumed.

## Closure workstream B: live-data branch count

Target:

```lean
Problem97.u1_largeCap_routeB_tail_liveData_false
```

The direct `sorry`s inside this theorem are still on-spine.  However, the
current p97-rvol plan says the older equality leaves are not closed by raw
branch enumeration.  They need one of:

- a real collision/no-collision producer consumed by the branch;
- large-cap/cap-arc provenance that makes the equality cube inconsistent;
- a metric certificate theorem that the branch calls; or
- a stronger packet-label-centered surface that avoids the known no-collision
  conflict.

Acceptable progress in this workstream is narrowly defined:

1. Close a direct `sorry` with an existing named theorem or certificate surface.
2. Replace several direct `sorry`s by one strictly narrower on-spine residual.
3. Delete branch freedom by adding a proved case split whose branches are all
   either closed or consumed by a named residual.

Do not add a helper theorem unless the same change wires it into
`u1_largeCap_routeB_tail_liveData_false`.

## Closure workstream C: sibling certificate-bank obligations

These are not inside the current U1 anchor, but they are on the same
`erdos97_rhs` publish spine and use the certificate infrastructure already in
this repo.

### Endpoint residuals

Target:

```lean
Problem97.isM44EndpointResidualsExcluded
```

Existing artifacts:

- `certificates/endpoint/*.json` contains the 117 endpoint certificates.
- `Erdos9796Proof.P97.EndpointCertificate.Checker` is the pure certificate
  checker.
- Generated Lean modules under
  `Erdos9796Proof.P97.EndpointCertificate.Patterns` expose row facts.

Plan:

1. Confirm every row module builds, especially the sharded `EpQ1008` row.
2. Prove the faithfulness bridge from
   `SurplusCapPacket.EndpointEscapeLeftAt` /
   `SurplusCapPacket.EndpointEscapeRightAt` to one of the 117 certified
   endpoint patterns.
3. Wire the bridge into `isM44EndpointResidualsExcluded`.

### Pinned surplus residuals

Target:

```lean
Problem97.isM44PinnedSurplusResidualsExcluded
```

Existing artifacts:

- `certificates/surplus/pinned_surplus_comp_g_bank.json`
- `Erdos9796Proof.P97.SurplusCOMPGBank`
- `Erdos9796Proof.P97.SurplusCOMPGBankDFS`
- `Erdos9796Proof.P97.SurplusCOMPGBankGeometry`

Closed interfaces already available:

- `pinnedRightSurplusResidual_exists_candidateMasks_vw`
- `pinnedLeftSurplusResidual_exists_candidateMasks_vw`
- `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`
- `pinnedSurplusCOMPGBankBridge`

Plan:

1. From each formal pinned residual, construct the ten-label geometric model and
   `shadowOfPointClasses`.
2. Prove the remaining geometric mask/prefix facts for centers not already
   covered by the pinned `.v` and exact `.w` mask equalities.
3. Apply
   `isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v`.
4. Apply `pinnedSurplusCOMPGBankBridge`.
5. Add the COMP-G metric verdict boundary: either Lean-checkable certificates
   for the bank rows, or a deliberately documented external-certificate
   boundary.  The current incidence bank alone is not a metric contradiction.

### Erased-pin triple residuals

Target:

```lean
Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded
```

Plan:

1. Use the existing exact-pin adapters in `RemovableVertexAxiom.lean`; do not
   bypass them.
2. Prove the U5-style three-point residual exclusions for the categorized
   survivors:
   - surplus-opposite Moser vertex;
   - surplus-cap strict interiors;
   - both non-surplus strict-interior families.
3. Let the closed adapters convert triple residual exclusions into exact-pin
   exclusions, erased-set selected-class witnesses, and finally
   `IsRemovableVertex`.

## Verification checklist

After any Lean change in this plan:

```bash
cd lean && lake-build Erdos9796Proof.P97.RemovableVertexAxiom
proof-blueprint spine Problem97.u1_largeCap_routeB_tail_liveData_false --max-depth 4
proof-blueprint spine Problem97.erdos97_rhs --max-depth 6
proof-blueprint axioms Problem97.erdos97_rhs
```

Expected endpoint before full closure:

- `lake-build` succeeds.
- `u1_largeCap_routeB_tail_liveData_false` reports fewer open U1 obligations, or
  the same count with a strictly narrower on-spine residual.
- `erdos97_rhs` reports fewer open obligations.
- No new off-spine `sorry` is introduced by the active work.

Completion endpoint:

- `proof-blueprint spine Problem97.erdos97_rhs` is kernel-complete under the
  approved axiom set.
- `proof-blueprint verify-publish` passes.
