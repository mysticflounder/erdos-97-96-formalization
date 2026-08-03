# Phase-3 100-survivor UNIT-system Lean audit (2026-08-01)

## Verdict

Both equality systems are banked as exact Lean unit-ideal contradictions, and both now have source-clean conditional geometric consumers. The live transitive axiom boundary is

`propext`, `Classical.choice`, `Lean.ofReduceBool`, `Lean.trustCompiler`, `Quot.sound`.

There is no `sorryAx` in the checked dependency closure. The non-kernel boundary is `native_decide` / the trusted Lean compiler. What remains absent is a positive Lean coverage producer: no declaration proves that the frozen survivor records (one versus 99), or all relevant Phase-3 cases, instantiate either geometric collision core.

## Exact systems and terminals

| External system | Frozen multiplicity | Lean terminal | Source |
|---|---:|---|---|
| `system-00-48c65d6d0dda` | 1 | `Problem97.Phase3SurvivorSingularSystem00.false_of_facts_eval_zero (nu : Nat -> Real) (hfacts : forall f in facts, eval nu f = 0) : False` | `lean/Erdos9796Proof/P97/Phase3SurvivorSingularSystem00.lean:1392` |
| `system-01-208c2305f405` | 99 | `Problem97.Phase3SurvivorSingularSystem01.false_of_facts_eval_zero (nu : Nat -> Real) (hfacts : forall f in facts, eval nu f = 0) : False` | `lean/Erdos9796Proof/P97/Phase3SurvivorSingularSystem01.lean:807` |

Each module imports `Erdos9796Proof.P97.U5GramCertPoly`, contains 30 exact generated `SparsePoly` facts, proves the cofactor-index audit and normalized unit-ideal checker by `native_decide`, and hands the result to `false_of_unitIdealCertCheckerNormalized`. The embedded payload/source/metric-row hashes agree with the saved certificate manifests:

- System00: rows `48c65d6d0ddaec5117a01416949882a0b3cb18b4a22a030d03938cfb234b53ca`, source `a946e94e...`, payload `7dca48ce...` (`System00.lean:20-22`).
- System01: rows `208c2305f4050b3fd37d0d70a6daee27e3575970f7686d1767ba1f34df0dc5b7`, source `804c3c6e...`, payload `fb7e260b...` (`System01.lean:20-22`).

LSP `lean_verify` on both exact terminal FQNs returned the five axioms above and no warnings. Full-file LSP diagnostics returned no items and no failed dependencies. LSP references for each terminal total 1 (the declaration itself): downstream code reuses its exported `facts` and `cofactors`, not the terminal theorem by name.

## Import and conditional-consumer paths

Ingress-only path:

`System00 + System01 -> Phase3SurvivorSingularCertificates -> Phase3MetricCertificateBank`.

- `Phase3SurvivorSingularCertificates.lean:6-15` imports both systems and explicitly disclaims coverage/P97 closure.
- `Phase3MetricCertificateBank.lean:7-22` records the 1/99 interpretation and explicitly says the imports do not prove that all 100 survivors satisfy either system.
- No other Lean source imports `Phase3MetricCertificateBank`.

Newer conditional geometric path:

`System00/System01 -> Census554.FiniteRowAlgebraicCollisions -> Census554.AlgebraicRowCollisionBank -> Census554.GeneralCarrierBridge`.

- System01 data is reduced to its 17 nonzero-cofactor facts (`FiniteRowAlgebraicCollisions.lean:54-74`) and feeds
  `Problem97.Census554.EqualityCore.not_realizes_of_eightCenterSeventeenEqualityCollisionCore`
  (`:158`).
- System00 data is reduced to its 26 nonzero-cofactor facts (`:330-351`) and feeds
  `Problem97.Census554.EqualityCore.not_realizes_of_tenCenterTwentySixEqualityCollisionCore`
  (`:463`).
- `Problem97.Census554.EqualityCore.not_realizes_of_algebraicRowCollisionAlternative`
  consumes those two public obstruction theorems (`AlgebraicRowCollisionBank.lean:39-57`).
- `Problem97.Census554.GeneralCarrierBridge.false_of_metricCoreAlternative`
  consumes that bank in its final algebraic branch (`GeneralCarrierBridge.lean:279-348`).

LSP references confirm exactly declaration plus the next consumer for each geometric theorem, and exactly declaration plus `GeneralCarrierBridge` for the algebraic-bank theorem. LSP `lean_verify` on both geometric theorems, the algebraic-bank theorem, and `false_of_metricCoreAlternative` returned the same five-axiom boundary with no source-scan warnings. Diagnostics for `FiniteRowAlgebraicCollisions` succeed with only three expected `native_decide` linter warnings; `AlgebraicRowCollisionBank` is diagnostics-clean.

This is a real transitive contradiction consumer, but it is conditional on being given an `EightCenterSeventeenEqualityCollisionCore` or `TenCenterTwentySixEqualityCollisionCore`. A source-wide search finds no constructor/producer use of either core outside its definition and inclusion in the disjunctive bank.

## What the 1/99 evidence proves

The saved external audit manifest
`scratch/p97-distinct-distance-lane/phase3_survivor_singular_2_20260729/manifest.json`
records:

- source `survivors.jsonl` has 100 records;
- deduplication key is `metric_rows_sha256`, with provenance retained;
- exactly two unique systems;
- System00 has first survivor index 0 and multiplicity 1;
- System01 has first survivor index 1 and multiplicity 99.

The certificate manifest
`scratch/p97-distinct-distance-lane/phase3_survivor_singular_cert_2_20260729/manifest.json`
records exact fresh-process QQ replay PASS for both identities. Its scope correctly says `phase3_completeness_claimed: false` and `p97_closure_claimed: false`. Its historical `lean_kernel_checked: false` describes that external artifact, not the current Lean ingress verified above.

Thus the 1/99 partition is exact saved-artifact evidence, not a Lean theorem. It also covers only the frozen 100-record survivor file, not phase-wide enumeration completeness.

## First missing bridges

1. **Row-to-core producer (first local gap).** Prove in Lean that a row pattern with the System00 metric-row fingerprint yields `TenCenterTwentySixEqualityCollisionCore`, and that System01 yields `EightCenterSeventeenEqualityCollisionCore` (or prove an equivalent structural theorem avoiding hashes).
2. **Frozen-100 coverage.** Formalize that every one of the 100 saved survivor records has one of those two row systems and therefore supplies the corresponding disjunct of `AlgebraicRowCollisionAlternative`. The JSON hash dedup/provenance check is not this theorem.
3. **Phase-wide coverage.** Prove that every live Phase-3 case reaches the frozen survivor set or an already-proved alternative. Neither certificate ingress nor the 100-record fixture establishes this.
4. **Publish connection.** Feed the produced alternative to `false_of_metricCoreAlternative` and onward to the intended P97 publish target, with its full transitive axiom audit.

The actionable stopping point is (1): the exact negative algebra is already banked; the missing positive raw producer is the row-incidence-to-core construction, not another unit certificate wrapper.

## Registry and verification boundary

The exact systems are registered locally by `Phase3SurvivorSingularCertificates`, `Phase3MetricCertificateBank`, and `census/p97_search/PHASE3-RESULTS.md:146-160`. Targeted searches of the prescribed sibling/legacy/general-n theorem-bank registries found no entry for either FQN or row hash; those registries do not supply the missing producer.

No Lake/build, solver, generator, or external replay was run. Verification was current-source Lean LSP only because concurrent build PGID 76883 owns the dependency graph. No tracked file was edited; this report is under `scratch/`.
