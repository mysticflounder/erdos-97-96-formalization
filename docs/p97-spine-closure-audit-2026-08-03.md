# P97 Spine Closure Audit — 2026-08-03

Audit of `proof-blueprint spine` for the publish target `Problem97.erdos97_rhs`,
with ranked recommendations for faster closure. Live truth is always
`proof-blueprint spine`; numbers below are the 2026-08-03 snapshot.

## Post-audit computational update

The v33--v35 work completed after the initial snapshot repairs the CEGAR
harness conclusion below but strengthens the mathematical diagnosis. A
source-frozen v35 canary at commit `61d11be0` authenticated all twelve hard
exact-15 `DDD` cases and the new 1,320-clause nonapex full-shell transitivity
bank. It still returned twelve `UNKNOWN` results: 186 assignments were each
metrically inconsistent, but no Boolean case was exhausted. Compared with
v34, the assignment count fell 17.3% while wall time rose 1.5%.

Accordingly, the harness is no longer the immediate blocker and the
transitivity-only CEGAR lineage is terminal. For the v35 retained-omission
cases, the first missing producer is an order-sensitive metric contradiction
or equivalent source-entitled rule for the one-inside/one-outside cap arm.
For the separate FreshThird residual, the first missing producer is reverse
selected-class incidence/common radius for its candidate-source and
mutual-blocker rows. No current general-n theorem bank supplies either bridge
directly.

The recommendation below to expose the three FreshThird arms is therefore
computational granularity only. Those arms belong to the separate five-leaf
FreshThird family, not the retained-omission eight-leaf family. They should
remain internal labels or `PARKED-SPEC`s until a producer proves a genuine
narrowing/closure; promoting them would change the FreshThird and global
frontiers, but would not literally create a ninth retained-omission leaf. Full
authentication and telemetry are recorded in
`scratch/retained-omission-e1/round5-general-cegar/V35-TRANSITIVITY-CANARY-TERMINAL.md`.

## Spine state

- Open: 93/36005 nodes; 29 open obligations — 28 `sorry` theorems plus the
  induced `sorryAx`. All 28 sit inside `ATailFrontierLiveClosure`.
- Axiom posture: core + `Lean.trustCompiler`; 20 trusted certificate leaves
  covered by `#print axioms`.
- Spine source: 283957 lines across 36005 declarations; 675 unimported files
  (3310 symbols, 3 orphan `sorry`s) never reached by any lake import chain.

### Open-leaf families

| Family | Leaves | Anchors | Status |
|---|---|---|---|
| Rigid221 / exact-four mutual-omission cluster | 13 | 0 | Unworked backlog |
| firstApexUniqueRadius exactFive residuals | 2 | 0 | Thin support (5 closed deps each) |
| retainedOmission triApexAllLarge core | 8 | 5 | Active lane |
| TwoSourceExactCollisionRowsTerminal (FreshThird) | 5 | 1 | Blocked per 2026-08-03 audits |

Double-leverage leaves (two consumers each, so one closure removes two tree
edges):

- `false_of_exactFourMutualOmissionRigid221_minimalCore`
- `TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshOutsideFirstBlockerFiber`

## Bottleneck: FreshThird `normalized_remaining`

`TwoSourceExactCollisionRowsTerminal.false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining`
is blocked on both routes simultaneously (sources:
`scratch/freshthird-adapter-route-audit-20260803.md`,
`scratch/freshthird-current-cegar-audit-20260803.md`):

1. **Lean route.** The adapter audit found no non-circular source-clean closure
   with the current C/Q interface. The first missing producer is a common
   first-apex radius / mutual C-row incidence producer; the non-hit branches
   genuinely lack both, and the equal-center branch has equal blockers.
2. **Solver route.** The completed n=17 (6,8,6) incidence probe is SAT in all
   three arms (`firstNonHit`, `secondNonHit`, `equalCrossRowCenters`). No
   incidence-level cut can close this leaf as stated — the contradiction must
   use metric/order data. The only proposed cut (four-point Kalmanson) is
   conditional on the equal-center both-hit arm plus a cyclic order
   c < q < u < v that the FreshThird packet does not supply.
3. **Harness.** Production CEGAR runs are producing near-zero signal: v29 all
   67 unknown; v30 all 67 errors (child-contract validation); v31 3 unknown +
   2 allowlist errors with the repair canary timing out.

Round10's eleven DDD `unsat` artifacts target the older
`retainedOmission_triApexAllLarge_core`, not the normalized FreshThird
residual; `GLOBAL-THEOREM-BANK-AUDIT.md` classifies them NO-GO for
normalized-residual promotion.

## Recommendations, ranked by expected closure speed-up

### 1. Build the missing producer; keep the three arms computational

The SAT-in-all-arms result means the aggregate leaf cannot close at the
incidence level. Keep `firstNonHit`, `secondNonHit`, and
`equalCrossRowCenters` as internal solver strata so that each can receive a
targeted metric refinement. Promote no new Lean leaf until an ordered-cap,
common-radius, or reciprocal-incidence producer makes one stratum strictly
smaller or closes it. The conditional Kalmanson cut becomes consumable for the
equal-center arm only after its cyclic-order premise is proved.

Corollary: pause further case-splitting on the FreshThird lane until a
producer lands. Splits without new producers multiply leaves without
shrinking target freedom.

### 2. Preserve the repaired harness; spend compute only behind a new theorem

V33--v35 repaired the child-contract, tracker-admission, source-freeze,
telemetry, and spawned-worker checks. The authenticated v35 terminal result
shows that the remaining stall is mathematical, not another harness failure.
Cache normalization/reconstruction work before a future production run, but
launch that run only after its semantic contract contains a new proved
metric/order or reciprocal-incidence consequence.

### 3. Close the mirror pair with one proof

`false_of_retainedOmission_reverseHitFresh_endpointCrossHit_sharedBlocker_JInLeftAdjacentCap_triApexAllLarge_core`
(`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:8221`) and
`..._JInRightAdjacentCap_...` (`:8243`) are verbatim-identical statements
except `leftAdjacentCapByIndex` vs `rightAdjacentCapByIndex`; the docstring
calls the right leaf "the reflected placement branch". Factor a
side-parameterized core lemma — or a packet reflection involution, if one
exists {{NEEDS_RESEARCH}} — and close two leaves with one proof. Check
whether `firstCenterEqFreshSource` / `secondCenterEqFirstSource` admit the
same treatment before proving either independently {{NEEDS_RESEARCH}}.

### 4. Audit the 11 Round10 DDD UNSATs against the 8 open triApexAllLarge leaves

The artifacts
(`round10-full-multiplicity-cnd/artifacts/20260802T202236.997745Z-caplocal-pid44841/`)
target exactly this family. Whether any UNSAT aligns with an open leaf's
hypothesis set is currently unchecked {{UNVALIDATED}} — the NO-GO
classification covers only the FreshThird residual. Any alignment makes
promotion through a verified decision procedure (per the `native_decide`
policy) mechanical, delegable work.

### 5. Triage the Rigid221 cluster as a hypothesis lattice, not leaf-by-leaf

Thirteen leaves with no anchors, mostly differing by one row-count hypothesis
(`sourceRowHeavy` / `oppositeRowHeavy` / `sparseRows`, `blockerDeleted` /
`blockerV` / `blockerVRow`). Map the lattice and check whether a single
generalized row-counting bound — a widening of `CapSelectedRowCounting`,
which currently covers only the removed equal-center same-cap oppIndex1
branch — dominates several leaves at once {{NEEDS_RESEARCH}}.

### 6. Hygiene

- **Name collisions with distinct bodies (8).** Six across
  `Erdos9796Proof/P97/ATail/CrossedArmQ1G7Producer.lean` and
  `Erdos9796Proof/P97/ATail/CrossedArmSevenPointEuclideanObstruction.lean`
  (`e2/e5/e7/e8/e9Polynomial`, `false_of_q1_br_eq_bv`, `q1Polynomial`), plus
  `ExactFiveCommonShellV7.evalClauseD_binary_implication` across two support
  files. Duplicate declarations with diverging bodies are a correctness
  hazard for anything resolving by name; consolidate into one support file.
- **Orphan sorries.** The 675 unimported files carry 3 orphan `sorry`s,
  violating the no-orphan-sorry rule; archive or prune.
- **Anchor cleanup.** Five anchors point at
  `false_of_retainedOmission_triApexAllLarge_core`, several of them stale
  retarget notes. Collapse to one anchor per live lane (triApexAllLarge core;
  FreshThird residual) so the anchor list reflects the actual two-lane state.

## Sequencing

The spine is a serial conjunction of 28 leaves, so total closure time is
bounded by the FreshThird lane (items 1–2). Items 3–5 are parallelizable
subagent work that shrinks the leaf count in the meantime; item 6 is cheap
and removes iteration friction.

## FreshThird consumer audit update (2026-08-03)

The equal-center/noncanonical and mixed one-inside/one-outside packets were
checked against the available source-clean cap, bisector, cyclic-order, and
Kalmanson consumers.  Neither has an import-reachable terminal.  The first
missing bridge is now concrete: either derive a strict boundary/order and
shell-to-chord equality packet, or strengthen the residual with common
selected-class radius and reciprocal row membership.  Existing both-outside
cap consumers and retained-collision adapters are not type-correct here.

The live theorem
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_remaining` remains
`OPEN / ON-SPINE / NO SOURCE-CLEAN CONSUMER`; the focused reports are archived
in `scratch/freshthird-equalcenter-terminal-search-20260803.md` and
`scratch/freshthird-metric-order-consumer-search-20260803.md`.
