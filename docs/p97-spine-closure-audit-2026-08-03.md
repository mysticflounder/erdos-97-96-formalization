# P97 Spine Closure Audit — 2026-08-03

Audit of `proof-blueprint spine` for the publish target `Problem97.erdos97_rhs`,
with ranked recommendations for faster closure. Live truth is always
`proof-blueprint spine`; numbers below are the 2026-08-03 snapshot.

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

### 1. Split `normalized_remaining` into its three arms; build the cyclic-order producer

The SAT-in-all-arms result means the aggregate leaf cannot close at the
incidence level. The arm split (`firstNonHit` / `secondNonHit` /
`equalCrossRowCenters`) is the narrowing the promotion rules require, and it
makes the conditional Kalmanson cut consumable for the equal-center arm as
soon as an ordered-cap / cyclic-order producer lands. The non-hit arms then
get targeted metric-refinement probes instead of one aggregate probe.

Corollary: pause further case-splitting on the FreshThird lane until a
producer lands. Splits without new producers multiply leaves without
shrinking target freedom.

### 2. Fix the CEGAR harness before spending more solver compute

Three consecutive runs (v29/v30/v31) burned full iterations for almost no
information. The child-contract validation errors and allowlist errors are
harness defects, not math. Repair them (and the repair-canary timeout) before
launching another production round.

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
