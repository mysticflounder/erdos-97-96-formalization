# Round 2 global theorem-bank audit (FreshThird)

Date: 2026-08-02
Scope: read-only audit; no Lean/Lake build, solver replay, or production edit.

## Round result and refactor frontier

`artifacts-n17-generic/20260802T111521Z/result.json` reports
`status = SAT` for schema `p97-freshthird-n17-generic-incidence-v2`,
`n = 17`, cap profile `(6,8,6)`, and `cyclic_metric = true` (12,855 ms).
The model explicitly omits coordinates/QF_NRA geometry, Lean ingress, and a
universal-`n` quantifier; its trust boundary is
`external_solver_only = true`, `lean_kernel_proof = false`,
`universal_n_claim = false`.  Thus this round supplies no UNSAT cut or Lean
producer.

The current refactor plan
(`docs/false_of_capSourceThirdCanonicalRowSurface_refactor-plan-07-31-2026.md`)
still names
`false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` as a
load-bearing leaf.  In the live source it starts at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9738` and contains
`sorry` at line 9747.  The checked routers
`freshThirdNormalizedResidualCase_of_crossRowResidual`,
`nonempty_freshThirdCapSourceInteraction_of_noAlignment`, and
`false_of_two_freshThirdCrossRowHits_distinctCenters` do not prove the strict
residual.  The exact equal-center row/omission data is positive packet data,
not a contradiction.

## Registry search

Commands:

```text
jq '[.. | strings | select(test("FreshThird|normalized_residual|twoCapSources"))] | length' certificates/{p97_rvol_general_n_mining,erdos97_legacy_general_n_mining,erdos_general_theorem_p97_mining}.json
```

All three counts are `0`; there is no exact-name or normalized-string bank
entry for this residual producer.

The concise registry summaries classify the available material as follows:

* `p97_rvol_general_n_mining`: 2,148 candidate instances (2,143
  source-proved, 5 source-`sorry`), 500 source-proved novel `False`
  consumers (481 RVOL-reachable, 19 unimported).  The only directly similar
  named bank is the U1 two-large-cap material below; the 18 generated U1
  source-unit consumers are fixed row-slot packets, not FreshThird data.
* `erdos97_legacy_general_n_mining`: 285 candidates, all source-proved,
  39 contradiction consumers, and zero ambient-`n` declarations.  Its
  candidates are N9/fixed-local geometry or scalar certificates, not a
  cap-source/deletion producer.
* `erdos_general_theorem_p97_mining`: 297 candidates, all source-proved,
  38 contradiction consumers, and zero ambient-`n` declarations.  It has the
  same fixed N9 geometry limitation and no FreshThird packet.

The only plausible stronger-but-non-generic candidates found in the RVOL
registry are:

* `Problem97.U1LargeCapRouteBTailMetricResidualTarget.false_of_twoLargeCaps_pCentered_t2Source`,
  `lean/RVOL/P97/U1LargeCapRouteBTail.lean:2499` (source-proved and
  RVOL-reachable), which requires `MoserTriangle`, `CapTriple`, and a
  `U1Depth5.CriticalSourceRows`/fixed t2 slot.  FreshThird's two source
  interactions and normalized residual do not furnish that U1 packet.
* `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`,
  `lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77` (source-proved but
  unimported), a five-point fixed metric contradiction with seven explicit
  distance equalities.  No adapter from `FreshThirdNormalizedResidualCase`
  supplies those hypotheses; unimported status also prevents it from being a
  live producer.

The five p97-rvol source-`sorry` candidates are unrelated U3/U1/U2 residual
targets (including `DoubleApexOffSurplusSharedRadiusPair` and
`u1_large_cap_routeB_tail_liveData_false`), not a FreshThird bridge.

## Indexed Lean search

Command:

```text
nthdegree docs search --lean --agentic "cyclic metric FreshThird normalized residual producer"
```

The agentic result says no theorem explicitly named for a cyclic-metric
FreshThird producer.  Handles and source checks:

* `C10P03` →
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual` at
  `FrontierLiveClosure.lean:9738` (the live `sorry` leaf).
* `6CX111` → checked
  `false_of_freshThird_sameCapCrossRowAlignment` at `:8097`.
* `TSZFC5` → `FreshThirdCrossRowHit` abbrev at `:9127`.

The search also reports only current FreshThird declarations and unrelated
generic U1/U5 consumers; no source-clean incidence/metric placement producer
is indexed.  `nthdegree docs show <handle> --lean --source` was used for the
paths and theorem bodies above.

## Verdict

**NO-GO for bank reuse or closure.**  The n=17 cyclic/metric SAT artifact is
bounded external diagnostic evidence, not a theorem.  The three registries
contain no FreshThird/normalized-residual/two-cap-source declaration; the
stronger U1 candidates are either fixed-packet mismatches or unimported.  The
live normalized-residual `sorry` therefore remains an open proof obligation.
No transitive kernel-checked producer exists in this audit, so no closure
claim is made.
