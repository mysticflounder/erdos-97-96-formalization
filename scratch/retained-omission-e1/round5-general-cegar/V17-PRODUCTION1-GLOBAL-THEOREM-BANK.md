# v17 production1 global theorem-bank audit

Date: 2026-08-02

Artifact audited:

`scratch/retained-omission-e1/round5-general-cegar/artifacts-v17-production1/20260802T142433.875648Z-case-pid61508`

This was a source-and-artifact-only post-round audit. No Lean, Lake, solver,
generator, or test command was run.

## Verdict

- **GO — theorem reuse for all 45 equality-closure blockers.** They are
  instances of the already-source-proved generic
  `Problem97.Census554.EqualityCore.ExactOffCircleCore` / `EdgeClosure.sound`
  interface. No new equality-chain theorem family should be added.
- **NO-GO — universal cut admission.** The run was incomplete (`unknown`, wall
  clock exhausted), the Boolean prepass found no cut, and the remaining 19
  blockers are authenticated complete assignments rather than generalized
  cores. They do not justify a universal cut or a finite cover.
- **NO-GO — source-bridge admission into the live theorem.** The live target
  does not assume the exact-`n = 15`, `(6,6,6)` profile used by the encoding,
  and the artifact does not produce the missing live geometric incidence or an
  exhaustive reduction to the encoded assignments.

Thus v17 production1 supplies reusable external evidence and confirms that the
generic equality bank is the right terminal interface. It does **not** close
`false_of_retainedOmission_triApexAllLarge_core`, reduce its coordinator
frontier, or support a new load-bearing Lean theorem.

## Artifact authentication and terminal status

The run has one case, `fresh_DDD_k0_d2_f1`, targeting
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
Its declared scope is only the normalized exact-`n = 15`, `(6,6,6)` cap-profile
slice.

| Field | Audited value |
|---|---|
| Solver recorded by artifact | Z3 4.15.3, seed 97, one thread |
| Case result | `unknown` |
| Complete | `false` |
| Incomplete reason | `v17_wall_clock_budget_exhausted` |
| Case / aggregate elapsed | 626.270612458 s / 628.246660000179 s |
| Semantic Booleans / trackers | 825 / 26 |
| Assignment checks / authenticated blockers | 64 / 64 |
| Equality-closure raw-replay blockers | 45 |
| Fixed-assignment normalized-full-replay blockers | 19 |
| Boolean prepass | `sat_no_cut`; 1 model, 70,785 candidates, 0 cuts |
| Full-case UNSAT established | `false` |
| Terminal claim | none |

The 825 semantic Booleans are 225 `block`, 225 `critical_row`, 225 `k4`,
90 `rich`, and 15 each of `oriented_B1`, `oriented_B2`, `fresh_B1`, and
`fresh_B2`.

The recorded source/schema contract was compared with the current files. Every
listed current SHA-256 matched its recorded value. The artifact members named
in the result also matched their recorded hashes.

### Driver, schema, and artifact hashes

| Item | SHA-256 |
|---|---|
| v17 script | `64b4523db0e823b088f4670f7c224fe8ef6501f95d367acfd05207e6d13f3c25` |
| v17 schema | `5b6bae22692991cffa5a9e3a49d35eac43d6033ef013e6a3c8e0801e534dfd53` |
| v16 script / schema | `b4643c3ae82046dc4497eadbb3c34d10c59ceaf17b015fa5d1bb678f24085c3d` / `8abbdc85fc331425683601a71a55b0bfddcd010e24426113d9116f298a3f6e9a` |
| v15 script / schema | `35e5a85cae57034708c6f58edab2883eacbc62422f050a6f06e9aea2887c8822` / `54dc8e54fb86f024deaae5ea60a7f2f46f31fd08e5ccc794b4398cf3b211a262` |
| v14 script / schema | `7ca615a837c7bbc11d121658d30c4f1555c6c37bf7df7c1b54145ddb1822f33c` / `19934fa7e4b16b0b8f6993a515015a86eb1ef65f2be8c8ae24986df12125e417` |
| v13 script / schema | `45470dd8282be615c90a3a324306e35d73452dbd281473d377b3a26415345849` / `763d55a7bd5ec75e6a67505804a8243589efbaedede48b491692e6abc4a18f45` |
| v12 script / schema | `8da7127a36dafdbce667edcd44ebef0db62eb2245ad832f373817c4bc28df1c9` / `db25ceb76e903cc57b14a9b9baab84228b63188c7e9994b9f21deed0c5be2bf7` |
| v8 script / schema | `e0c98be80b2729cf50ee1d9da6c081fc4db2095e66abfb3c85abfbf5799b7162` / `b21de5183f74b80b4463c5fde1a3ccbbbfc49b55c58f11950605db86823fbaf0` |
| v9 miner | `f0bcb74f5117cd0fc47e524fc222e7c1a435bc8a85785f7e4dbbc504f35cc25e` |
| focused-test source | `d7430ce18b4713acec7b4247a60f733c2c618b9fd9ee509e03a3ef89e9c2f415` |
| focused-test log | `6dcbf76d398f24ff70c30180db32ed1e5cd6e588dd24a8d9e0a162fde2c20529` |
| `uv.lock` | `a942a01001ddeeb51124fc84740bc6ae5b6221fdda605a83509a3cff1bef399c` |
| initial / final master formula | `2cb8ce640dd9e4f0c4aeb74c60a964d652a47771ce556f7f2f191d7e3509b710` / `f0be95e2aa21106e79966209a416e55425c380147990a2ef3d15906a1ac20353` |
| frozen full formula | `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720` |
| Boolean prepass JSON | `6218165e9c5773948364733788efece650a412a28b04ef25a6c937b6e4b51b3f` |
| CEGAR trace JSON | `3a1db91ce821365ca41b2293d2517b826ef53192e526a01473f663011e7006c7` |
| Boolean master gzip | `c6e9d0bbd01fe58c6bff51ccf79a62a795c6ed6df27d8662e4556541672e0c4e` |
| Frozen full gzip | `bd79c431795181447c24e8c00d13ebf163f878124122fdce2a85932b12d658a2` |

### Lean source-contract hashes

| Contract role | Path | SHA-256 |
|---|---|---|
| circle-power matrix | `lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean` | `95c472f2384f9100049eed0b8d7361ddbe5d05ab72503e20b15949d6c6b81497` |
| critical-shell system | `lean/Erdos9796Proof/P97/U1CarrierInjection.lean` | `deb69ae2ef2ab63cd0737d0e0f28268734523696fd9f045853ac3683d4823293` |
| exact-fifteen apex profile | `lean/Erdos9796Proof/P97/ATail/ExactFifteenApexProfile.lean` | `2f5bbeef6e7731e6a8052a72b526d3cf11bed874ed59574eb923ff43bdb5e9cc` |
| four-point squared CND | `lean/Erdos9796Proof/P97/Foundation.lean` | `a391c93c43d33614d2c04166d97d6a5d88b750a5691b6c682233c1d1c9de9bd3` |
| live target | `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` | `ca0a4d33259f78ed2acdd75dac404116c41319e7eb2384a8ae9d5a539c4e53ee` |
| same-shell superadditivity | `lean/Erdos9796Proof/P97/SameShellSuperadditivity.lean` | `c4851c89b672132603fc7473ab1104cffd9237a602d326f4f75f108ded56a124` |
| second-apex packet | `lean/Erdos9796Proof/P97/ATail/PhysicalSecondApexCommonDeletion.lean` | `98da3a4bbf8a6b70f5068d2faef8105216936edc6077d75e08910acfbab02dc3` |
| triple-center uniqueness | `lean/Erdos9796Proof/P97/N4d/SmallSReductions.lean` | `af3345fb5d0e302eba2da8410392fbc292b6e66b7cd5e3c527196406bf80dcad` |

These matches authenticate what code and sources produced the saved evidence;
they do not convert external solver replay into kernel-checked Lean proof.

## Complete 64-blocker classification

### A. Equality-closure raw replays: iterations 0–44 (45 blockers)

Every blocker in this lane was generalized and independently replayed UNSAT
against the raw formula. Each is a concrete equality graph path from an edge
known to be in an exact radius row to the edge of a label asserted outside
that row. Edge reversal is included. The theorem shape is therefore exactly:

1. an exact row (`ExactAt`);
2. an included label and an excluded label;
3. an `EdgeClosure` chain identifying their center-to-label distances; and
4. contradiction by `false_of_exactAt_of_exactOffCircleCore`.

There are 37 activated critical-row targets and 8 exact-rich-row targets. The
following disjoint clusters account for all iterations 0–44. `T` and `F` are
the numbers of positive and negative literals of each Boolean family in the
minimal replay core.

| Count | Core size and family signature | Iterations |
|---:|---|---|
| 13 | 7: `block T1; critical_row T1/F1; k4 T4` | 8, 10–13, 25–31, 35 |
| 8 | 8: `block T1; critical_row T1/F1; k4 T3; rich T2` | 4–7, 21–24 |
| 5 | 8: `block T1; critical_row T1/F1; k4 T5` | 0, 2, 3, 14, 20 |
| 5 | 8: `block T1; critical_row T1/F1; k4 T2; rich T3` | 15–19 |
| 5 | 7: `k4 T5; rich T1/F1` | 1, 9, 32, 41, 43 |
| 4 | 9: `block T1; critical_row T1/F1; k4 T4; rich T2` | 37–40 |
| 1 | 9: `k4 T7; rich T1/F1` | 42 |
| 1 | 9: `block T1; critical_row T1/F1; k4 T6` | 36 |
| 1 | 8: `k4 T6; rich T1/F1` | 33 |
| 1 | 8: `k4 T3; rich T1/F4` | 34 |
| 1 | 12: `block T1; critical_row T1/F1; k4 T4; rich T5` | 44 |

The seven signatures containing `block` sum to the 37 critical-row cases; the
four signatures without `block` sum to the 8 rich-row cases. Mixed
`k4`/`rich` paths change only the concrete path, not the theorem shape.

### B. Fixed complete-assignment replays: iterations 45–63 (19 blockers)

Every blocker here has core size 825: the complete semantic assignment. None
was generalized. After fixing the assignment, 658 pseudo-Boolean nodes were
normalized into an audited QF_LRA formula with 39,448 assertions; an
independent normalized-full replay returned UNSAT. The tracker core is empty
with status `not_requested_after_assumption_lane_timed_out`. Consequently the
artifact identifies no responsible subset of geometric or metric constraints.

All 19 assignments share this true-cardinality profile:

`block=15, critical_row=32, k4=60, rich=24, oriented_B1=4,
oriented_B2=4, fresh_B1=4, fresh_B2=4`.

They are identical on all families except `block` and `k4`. There are 10
distinct `block` projections and 2 distinct `k4` projections. Nine blocker
projections occur with both K4 projections, and one occurs only with the base
K4 projection: 19 distinct pairs, hence 19 distinct full-assignment hashes.
The audit-local projection clustering is:

| Block projection | Base K4 iteration | Alternate K4 iteration |
|---|---:|---:|
| B0 | 54 | 58 |
| B1 | 53 | 57 |
| B2 | 56 | 60 |
| B3 | 55 | 59 |
| B4 | 61 | 63 |
| B5 | 47 | 48 |
| B6 | 45 | 46 |
| B7 | 62 | — |
| B8 | 51 | 52 |
| B9 | 49 | 50 |

The labels B0–B9 are local canonical equality classes of the full `block`
projection; they assert no geometric orbit equivalence.

| Iteration | Complete-assignment SHA-256 |
|---:|---|
| 45 | `774897b65ffa4f4acbfa170fd9539bf9d85d52c4c6cc8fb12f7ca2671eb6b28c` |
| 46 | `4c240655c51d8afed63daaab7d54a7cd1f3a48b96d7d86d1a7de5915f84ec5f1` |
| 47 | `70f768c5864345ec95b4d70b10968e25fdd2a8ec01b152747098e5ff468738a1` |
| 48 | `ef566b4026bfd2336bfa16e495ec798ab68241c6d3a9fd485bca0feffe399085` |
| 49 | `a95db853b5952601b1d9aa5857d1573ebcce610d229ea2711b1504297a670740` |
| 50 | `4756f50c903b7f92107aba73afcabbdaf90d01c51f78c4c4637b828e1b7a5019` |
| 51 | `ad6608895aceb631a56a3fac0e7af862ba7217b3b3bd0b4df5eebe64e3ecfefb` |
| 52 | `5984f08004e7dcfbe1f17260147c71de03d787d05e5d63f779f5322edbad9e3e` |
| 53 | `2d52d796f07bd9a479d047f521106e79a441154078b7957d81619584bc1e46a9` |
| 54 | `618d137fb1ab3ee46df0d382baca448434abd33602c9d0b84be9ea0e09f84675` |
| 55 | `971bca676c13df7f09ec5815a7c8857e08f788e2e0572048c66b5f793c55bc78` |
| 56 | `f038cebc2bd6b8b155b9f99c9c6a9c62d8e7044286f4c03f5c80a2436f699241` |
| 57 | `eae87485f287c3a04bbda8c377a46d15fea6408e2c8a08f9f6bf1529535d2237` |
| 58 | `dbb96c80efa48fa090a5a8ea56c139e7da9e12de53b71713c987daa437a21249` |
| 59 | `9d70da5e19f9570581f671c98920d106d9f7ae7784e8caa4be9a57446771d6b3` |
| 60 | `2d01ec137605f0ba5e01a7be5f53873cecda4fb96b8f55b07a54466321928ffd` |
| 61 | `7adb4e11fc221597a38660032cfdb763b478482f06c7d45cf8c44fa7ea0884ca` |
| 62 | `04273315cff523d642b31d73f8170ad51b77e22aa96c353c91e0d698521c1987` |
| 63 | `661a0331cdb05e889e9b67b0ce734a3828593856738d7903ca3d932f3038a1f2` |

This family is one assignment-profile cluster, not 19 theorem candidates.
Without projected cores it has no stable mathematical antecedent list and
cannot be compared soundly to a theorem bank at finer granularity.

## Mandatory theorem-bank audit

The mandated registries were checked before the corpus searches:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and `.json`;
- `certificates/erdos97_legacy_general_n_mining.md` and `.json`; and
- `certificates/erdos_general_theorem_p97_mining.md` and `.json`.

### Exact hit: generic equality closure

`lean/Erdos9796Proof/P97/Census554/EqualityCore.lean` already defines the
ambient-cardinality-independent `EdgeClosure`, proves `EdgeClosure.sound`, and
packages the terminal as `ExactOffCircleCore` and
`false_of_exactAt_of_exactOffCircleCore`.
`lean/Erdos9796Proof/P97/Census554/ExactShellBridge.lean` supplies the
critical-four-shell consumer
`false_of_criticalFourShell_exactOffCircleCore`, while
`lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean` supplies
`exactAt_blocker` for its canonical blocker row.

The one Lean-corpus query for this genuinely distinct candidate returned these
current-project declarations as the top relevant exact hits. This confirms the
registry result: all 45 short cores are bank instances, not new theorem shapes.

What the equality bank intentionally does not provide is the live witness
finder: it does not prove from `R`, `Q`, and `G` that some exact live row has the
required included/excluded labels and equality path.

### Near hit only: U5 q-critical auxiliary radius-chain family

The sibling `p97-rvol` census contains 96 source-proved class-level U5
incompatibility families, backed by 88 metric-point and 112 scalar-algebra
kernels. The closest named family is
`U5QCriticalTripleClass.qcritical_exact_selected_selected_qcritical_aux_radius_chain_incompatibility`
with metric kernel
`u5_qcritical_exact_selected_selected_qcritical_aux_radius_chain_metric_incompatibility`.
The one corpus query for this distinct radius-chain candidate returned both the
sibling declaration and current-project U5 relatives.

This is **not** an admission match. Its hypotheses name a q-critical/exact
selected-selected/auxiliary common-radius incidence chain on concrete points.
No v17 fixed-assignment blocker projects such a chain, and no theorem derives
that chain from the live `R`, `Q`, `G` hypotheses. Using it now would insert the
missing producer as an assumption.

The two legacy registries contain the source-proved
`Problem97.three_common_equidistant_centers_eq`, but that is not a v17 blocker
shape. Its live role is already covered by the stronger current source-contract
lemma `Problem97.eq_of_dist_eq_three_of_pairwise_ne`.

No corpus query was issued for the 19 fixed assignments: without a projected
UNSAT core they do not determine a mathematical theorem statement, so treating
them as 19 candidate theorems would be spurious.

## Universal-cut and source-bridge admission

### Universal cut: rejected

A sound universal cut would need an antecedent expressed in live semantic
relations and a proof that every assignment satisfying that antecedent is
impossible. The 45 equality blockers do have such a terminal theorem shape,
but the artifact supplies only 45 witnessed instances and no proof that every
remaining Boolean assignment realizes one. The Boolean prepass explicitly
learned zero cuts. The other 19 blockers forbid only their exact 825-literal
assignments. The run then exhausted its wall-clock budget.

Therefore neither “some equality core occurs” nor the disjunction of these 64
blockers is an admitted universal cut.

### Source bridge: rejected

The live target at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7231` assumes only:

- `R : FrontierCommonDeletionParentResidual F`;
- `Q : RetainedOmissionAllLargeNormalForm P`; and
- `G : TriApexAllLargeContext D S`.

It does not assume `D.A.card = 15`, cap-cardinality equalities `(6,6,6)`, an
exact finite labeling, or the complete DDD apex-profile alternatives used in
the encoded slice.

The exact missing live hypotheses/producers are:

1. **Equality-terminal producer.** From `R`, `Q`, and `G`, produce an actual
   exact row, a member label, an excluded label, and an `EdgeClosure` path
   identifying their center distances — equivalently, produce an
   `ExactOffCircleCore` for a row whose `ExactAt` proof is available. For the
   canonical critical blocker row, `GeneralCarrierBridge.exactAt_blocker`
   supplies only the `ExactAt` half, not the off-circle closure witness.
2. **Positive cross-cap incidence producer.** The live source proves
   `exists_criticalShell_center_with_otherRichCapSlice_card_le_one` at line
   7208, based on `criticalShell_inter_otherRichCapSlice_card_le_one` at line
   6686. Closure through that route still needs, for the selected critical
   shell and some distinct rich cap/radius slice, a live lower bound of at
   least two points. No such “other-cap rich double-hit” follows presently
   from `R`, `Q`, and `G`.
3. **Exact-15 reduction, if the finite route is retained.** Prove from the live
   branch (not assume) `D.A.card = 15`, all three cap cards equal six, the D4+D4
   profile exhaustion at each D apex, and the exact global-K4/packet-B1 profile
   compatibility; construct a faithful 15-label realization of every encoded
   Boolean and metric constraint; and prove an exhaustive terminal cover of
   all resulting assignments.
4. **Projected metric antecedent for the 19 full blockers.** Extract a replayed
   minimal tracker/constraint core and translate it to named geometric
   hypotheses before proposing any U5 or scalar-bank consumer. The present
   empty/not-requested tracker cores do not identify which inequality family
   caused UNSAT.

These are producer gaps, not missing generic contradiction consumers. Adding a
conditional closer that assumes any of them would be bookkeeping, not closure.

## Trust boundary

- **Authenticated external evidence:** recorded inputs and artifacts match the
  current hash contract; 45 generalized raw equality cores and 19 complete
  fixed assignments have recorded independent UNSAT replays.
- **Not a certificate proof:** the saved Z3 replays are not DRAT/LRAT proofs and
  were not checked by Lean's kernel.
- **Source-level theorem-bank audit:** the relevant Lean declarations were read
  as source, and the registries classify the cited bank entries as
  source-proved/reachable. This audit did not freshly compile them.
- **No transitive axiom claim:** no Lean/Lake/proof-blueprint axiom or
  `sorryAx` gate was run. In particular, the live target itself remains a
  load-bearing `sorry`.
- **Incomplete search:** `unknown` plus 64 blockers is not a proof of UNSAT,
  exhaustive enumeration, or universal coverage.

Final gate: **GO only for reusing the existing equality-core interface and for
targeting the missing live producer. NO-GO for universal-cut admission,
source-bridge promotion, or any claim of Lean/kernel closure.**
