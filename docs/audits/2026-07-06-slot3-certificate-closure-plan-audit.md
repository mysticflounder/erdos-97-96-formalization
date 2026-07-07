<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Plan audit: 97-slot3-certificate-closure-plan-2026-07-06.md (2026-07-06)

Audited document:
`docs/u-lane/97-slot3-certificate-closure-plan-2026-07-06.md` (536 lines at
snapshot). Snapshot caveat: the file carries uncommitted working-tree
modifications from active agent sessions. Companion audits:
[`2026-07-06-four-point-subpacket-plan-audit.md`](2026-07-06-four-point-subpacket-plan-audit.md)
and
[`2026-07-06-frontier-missed-angle-analysis.md`](2026-07-06-frontier-missed-angle-analysis.md).

Scope of the plan: the two slot-3 obligations —
`DoubleApexOffSurplusSharedRadiusPair` (workstream A) and
`u1_largeCap_routeB_tail_liveData_false` (workstream B) — plus workstream C,
which is the slot-2 certificate wiring (endpoint, pinned surplus, erased-pin
triples).

## Artifact verification performed for this audit

| Claim in plan | Check | Result |
|---|---|---|
| workstream C step 1 complete: `Patterns.All` builds incl. sharded `EpQ1008` | olean present | VERIFIED-BUILT (proves a past build, not currency vs sources) |
| endpoint soundness stack builds (`Bank`, `AggregateSoundness`, `BankSoundness`, `ShadowSearchShards.All`, `RowZeros.Direct.All`) | oleans present | VERIFIED-BUILT |
| "next endpoint step is product-sum row-zero transport" | build dir | STALE — `RowZeros/Product/All.olean` already exists; the tree is ahead of the plan's log |
| pinned relaxed-split aggregate builds (`RelaxedSplit.All`, 135 singleton certs) | olean + file count | VERIFIED-BUILT / VERIFIED (135 JSONs) |
| 3 slot-2 + 2 slot-3 obligations on the publish spine | spine state verified live earlier on 2026-07-06 (`RemovableVertexAxiom.lean`: 3 sorries; `U1LargeCapRouteBTail.lean`: 81 textual, 2 named obligations) | VERIFIED at audit time |

Not re-verified: the rvol-side provenance claims (source repo is frozen
historical as of 2026-07-06) and the Singular verdicts behind the certificate
JSONs.

## Strengths

**S1. The non-goals section and workstream B's progress definition are the
strongest scoping text in either plan.** "A new lemma only counts if it is
wired into the spine and either proves a certificate fact, rules out a finite
family, or strictly narrows the residual"; workstream B's three admissible
moves (close a sorry with a named surface / replace several sorries by one
strictly narrower residual / delete branch freedom). These match the project's
spine discipline exactly and are stated where an executing agent will read
them.

**S2. Correct refusals.** The plan refuses certificate hunts on the liveData
equality leaves (SAT under the finite core vocabulary — consistent with
missed-angle F5), refuses further rvol code copying, and conditions any new
checker on the generated systems not fitting `EndpointCertificate.Checker`'s
equality interface (consistent with the refactorization audit's reuse
finding).

**S3. The workstream C endpoint log tracks a genuinely converging pipeline**,
with each layer named and its build recorded: shadow bank → geometry bridge →
DFS coverage shards → aggregate/bank soundness → variables/polynomial
geometry → metric shadow → generator zeros → direct row zeros. The remaining
gap to `isM44EndpointResidualsExcluded` is stated narrowly (product-sum row
zeros + final wiring).

## Findings

**SP1 (highest). The plan's completion endpoint is unreachable from the
plan's own content, and the missing track has no owner anywhere.** The stated
completion endpoint is `verify-publish` passing, i.e. all five obligations
closed. But: workstream A still frames the |A| > 11 gate as an open either/or
("handle |A| > 11 or prove a reduction to the (5,5,4) slice"), not
incorporating the |A| = 12 minimal-core census (recorded 2026-07-06: finite
bank dead at |A| ≥ 12 — hundreds of non-flattening core classes; only the
uniform metric-rigidity route remains; see missed-angle §0a/F3). Workstream B
is correctly parked pending a producer surface. So the two obligations that
actually block full closure — DoubleApex at |A| ≥ 12 and liveData — have no
active route in this plan, and the uniform-rigidity track (missed-angle
attack-order item 5, with two cheap first steps: the literature scan and the
sparsity-invariant separation test over mined cores) appears in neither active
plan. Recommendation: add a workstream D (uniform-rigidity) with those two
first steps, or record explicitly that obligations 4–5 closure is out of
scope of all active plans pending a dispatch decision. Absent that, the plans
converge to: slot-2 closed, |A| = 11 slice closed, proof stalled with zero
agents on the remaining content.

**SP2. Internal tension in the pinned plan steps: the prose says relaxed
vocabulary, the numbered steps apply the exact-bank consumers.** Step 2 says
the general-m route "should target the relaxed singleton split vocabulary,
not the exact 135-row completion masks," but steps 3–4 then apply
`isValidPinnedFragment_shadowOfPointClasses_of_mask_interfaces_pinned_v` and
`pinnedSurplusCOMPGBankBridge`, and step 6's `ExactBridge` matches by exact
pid — all of which presuppose exact ten-mask faithfulness, i.e. m = 5. As
written, an agent following the numbered steps lands on the m = 5 path while
believing it is executing the general-m route. Recommendation: restate the
steps per m-regime (m = 5: exact bank as-is; m ≥ 6: relaxed submask facts
produced directly from the payload, or a pre-named general-m residual). Same
substance as companion audit FP1, seen from the plan-text side.

**SP3. Workstream C duplicates the four-point plan's endpoint/pinned status,
and the copies have drifted** (companion audit FP2 records the instances:
`EpQ1008` OPEN-vs-landed between the plans; `RowZeros/Product` built but
logged as "next" here). One owner per obligation; cross-reference the other
doc instead of restating.

**SP4. The census WLOG caution is missing from workstream A.** The
missed-angle analysis flags that the two 5-caps are not symmetric in the leaf
(q ∈ capAt i designates the surplus cap), so census canonicalization must
respect the surplus designation. Workstream A step 2 ("build the exact
constrained census … an exhaustive canonical family") is exactly where a
symmetric canonicalization would silently under-enumerate. One sentence in
the plan prevents it; also re-validate the encoding against the known
(5,5,4) sampled verdicts before trusting the exhaustive run (per solver
policy: smoke-test first).

**SP5. The verification checklist is currently a dead letter with no
substitute stated.** The plan correctly says not to run the blueprint spine
commands while the miner is being repaired, but gives no interim gate.
Recommendation: state it — `lake-build` per touched root plus
`proof-blueprint axioms <target>` (live kernel query; needs no mined graph)
for both publish targets, until the PHASE10 miner fix lands.

## Verdict

Workstreams B and C are correctly scoped and (for C-endpoint) close to their
finish line; the refusals are right. The plan's defect is strategic, not
tactical: it cites a completion endpoint that its workstreams cannot reach,
the one route believed to cover |A| ≥ 12 is dispatched nowhere, and the
pinned steps as numbered quietly execute the m = 5 path. Fix the plan text
(SP1, SP2, SP4, SP5) before more agent-sessions are spent, and decide the
uniform-rigidity dispatch explicitly.
