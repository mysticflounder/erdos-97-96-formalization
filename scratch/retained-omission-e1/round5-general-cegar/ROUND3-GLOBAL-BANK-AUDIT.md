# Round 3 FreshThird global theorem-bank audit

Date: 2026-08-02
Scope: source/census audit only. No production Lean edits and no Lake/build
or solver invocation.

## Inputs and commands

- `sed -n '1,220p' scratch/retained-omission-e1/round5-general-cegar/N17-CONVEX-FIVE-POINT-CORE-ROUND3.md`
- `sed -n '1,260p' scratch/retained-omission-e1/round5-general-cegar/artifacts-n17-convex-core-cegar/20260802T112745Z/result.json`
- `sed -n '1,180p;240,330p' docs/false_of_capSource_freshThirdBlockerFiber_without_sameCapCrossRow_refactor_plan_2026-07-31.md`
- `rg -in 'freshthird|convex.?five|five.?point|normalized.?residual|cyclic|orientation|metric.?equality|n.?17|general.?n' certificates/{p97_rvol_general_n_mining,erdos97_legacy_general_n_mining,erdos_general_theorem_p97_mining}.{json,md}`
- `jq -r '.candidate_declarations[] | select((.fq_name+" "+(.statement//"")) | test("FreshThird|ConvexFivePointCore|normalized_residual|fivePointCore";"i"))'` on each of the three JSON registries.
- `nthdegree docs search --lean --agentic "FreshThird ConvexFivePointCore normalized residual adapter source-clean producer"`
- `nthdegree docs show D54ZQ9 --lean`, `V0DAFY`, `NDFKG7`, `YQTKKS`, and `C10P03` (with `--source` where needed).

## Round3 artifact classification

`N17-CONVEX-FIVE-POINT-CORE-ROUND3.md` and `.../20260802T112745Z/result.json`
record `n=17`, cap profile `(6,8,6)`, five SAT rounds, 323 learned cuts,
`remaining_observed_violations=0`, and `status=SAT`. The trust boundary is
`external_solver_only=true`, `lean_kernel_proof=false`,
`universal_n_claim=false`, and `qf_nra_coordinates=false`. The cyclic positions
are an order abstraction, not a `Realizes` witness. This is diagnostic CEGAR
data, not a contradiction certificate or a producer for the live residual.

## Live source frontier

- Load-bearing live leaf: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9738-9747`,
  `false_of_twoCapSources_freshThirdBlockerFiber_normalized_residual`, concludes
  `False` from the two normalized interactions and
  `FreshThirdNormalizedResidualCase`, and ends in `by sorry`.
- Source-clean normalization (`:9526-9606`) is only a constructor/data
  normalizer; it does not prove the residual false.
- Source-clean three-center producer
  `false_of_two_freshThirdCrossRowHits_distinctCenters` (`:9434-9519`) and
  same-cap terminal `false_of_freshThird_sameCapCrossRowAlignment`
  (`:8097-8146`) remove their respective arms.
- `false_of_twoCapSources_freshThirdBlockerFiber_residual` (`:11163-11198`),
  `..._core` (`:11207-11229`),
  `..._freshThirdBlockerFiber` (`:11236-11271`), and
  `false_of_capSource_freshThirdBlockerFiber` (`:11278-11298`) are wrappers or
  coordinators whose normalized branch reaches the `:9738` sorry.
  The former-interface adapter (`:11304-11322`) likewise has no independent
  proof.
- The current refactor plan explicitly says the open core should become a
  positive interaction normal form and leave one load-bearing core theorem;
  it does not claim that theorem is proved.

## Theorem-bank registry result

Exact-name/statement search for `FreshThird`, `ConvexFivePointCore`,
`normalized_residual`, and `fivePointCore` returned **zero candidates in each
of the three requested JSON registries**. No source-clean adapter matching the
live normalized residual, cyclic/metric-equality core, or an `n>=17` classifier
was found.

Relevant near-misses (source-proved in the census, but not matching the live
interface) are:

- Sibling `p97-rvol`: `Problem97.SelectedFourClass.inter_card_le_two`,
  `lean/RVOL/P97/U1CarrierInjection.lean:455` (also present locally by shape),
  plus `Problem97.U5QAllowedK4Class.inter_card_le_two`,
  `lean/RVOL/P97/U5GlobalIncidenceSupport.lean:410`. These are two-circle
  intersection bounds used by the source normalizer, not residual terminals.
- Sibling `p97-rvol` has 18 unimported U1 row-slot contradiction consumers and
  one unimported `Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`
  (`lean/RVOL/P97/U1TwoLargeCapObstruction.lean:77`), listed in
  `certificates/p97_rvol_general_n_mining.md`. They are fixed source-unit
  packets, not FreshThird/general-n producers.
- Legacy registries contain only fixed-N9 packets. Exact source paths include
  `lean/N9Geometry.lean:127,140,176`
  (`n9Point_four_radon_*_false`),
  `lean/N9Dim0FiniteRowObstructions.lean:263`, and the
  `lean/N9Msolve1457*` direct-infeasible/final-gap contradiction files. Both
  legacy JSON summaries report `ambient-n: 0`; their 98 metric-point and
  scalar candidates are N9-local/fixed packets, not an `n>=17` classifier.
- The `erdos-general-theorem` registry likewise reports `ambient-n: 0` and
  has no exact FreshThird/ConvexFivePointCore candidate. Its N9 paths are the
  same fixed-local families (`lean/N9Geometry.lean`,
  `lean/N9Msolve1457*.lean`, `lean/N9PairLedgerRowPayloadRemainder.lean`).

The p97-rvol census labels candidates `source-proved`, which is a source-level
no-`sorry` classification, not a transitive kernel/axiom audit. The local
`SelectedFourClass.inter_card_le_two` and the two source-clean FreshThird
producers above are therefore useful transitive ingredients only; no
transitive kernel-checked producer closing `:9738` was established here.

## `nthdegree docs` hits

The required natural-language search returned no single declaration combining
all requested concepts. Verified hits were:

- `D54ZQ9`: `false_of_twoCapSources_freshThirdBlockerFiber_residual` (strict
  residual coordinator; normalized branch delegates to the open leaf).
- `V0DAFY`: `false_of_twoCapSources_freshThirdBlockerFiber_core` (source-clean
  three-center arm removal, then strict residual).
- `NDFKG7`: `convexFivePointCore_sound` (finite detector soundness only).
- `YQTKKS`: `false_of_convexFivePointCore_patternCode` (finite pattern-code
  impossibility, requiring a `CanonicalLabeling`/`FaithfulCarrierPattern`; no
  FreshThird normalized-residual adapter).
- `C10P03`: exact source of the live normalized residual theorem, ending in
  `sorry` at `FrontierLiveClosure.lean:9738-9747`.

## Verdict

**NO-GO.** Round3's 323 SAT cuts are external diagnostic artifacts, and all
three theorem-bank registries lack a source-clean producer or adapter matching
the live FreshThird normalized residual, cyclic/metric-equality core, or an
`n>=17`/general-n classifier. The only matching local theorem is the open
`sorry` at `FrontierLiveClosure.lean:9738`; no closure claim is justified.
