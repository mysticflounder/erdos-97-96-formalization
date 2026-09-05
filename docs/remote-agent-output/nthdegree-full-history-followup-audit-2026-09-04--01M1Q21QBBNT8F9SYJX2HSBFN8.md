# 97–96 nthdegree conversation audit

**Date:** September 4, 2026  
**Channel:** `#erdos-97-96-formalization`  
**Original-history cutoff:** message **#12596**. Later audit replies are separately identified.  
**Purpose:** Recover missed follow-ups, useful leads, unconsumed results, corrections that did not reach authoritative records, and recurring causes of wasted effort.

## Executive assessment

The strongest finding is not a hidden proof of Problem 97. It is a recurring failure to carry work through the last stages of its lifecycle:

**discovery → checked statement → committed dependencies → reproducible build → source-facing consumer → updated authoritative status.**

There are valuable results at intermediate stages, but the conversation repeatedly blurs those stages. In particular, a checked conditional theorem is not a producer of its hypotheses; a corrected working tree is not a corrected commit; and an audit certified as accurate does not mean the missing artifact it describes has been recovered.

The immediate priorities are:

1. Preserve and publish load-bearing Lean dependencies and the Fin13 interval correction in a reproducible commit.
2. Attach explicit errata to completed consults and reports whose recommendations were subsequently rejected.
3. Keep fixed-cell certificates, abstract SAT models, source incidence, and universal coverage separate.
4. Recover—or explicitly retire—the remaining artifact-custody claims.
5. Revisit a small number of older leads only after checking their current disposition; do not restart resolved or refuted work.

This is a conversation/evidence audit, not a fresh Lean build, solver replay, or proof of an open terminal. Source-tree observations below are attributed to the agents who inspected them. I did not mutate the repository or launch a proof/solver lane.

## 1. Coverage and evidentiary limits

The retained archive inventory reports **9,434 messages**, from **#2368 through #12596**, divided as follows:

| Month | Messages | First–last IDs |
|---|---:|---|
| July 2026 | 133 | #2368–#2542 |
| August 2026 | 5,014 | #2543–#8145 |
| September 2026 through cutoff | 4,287 | #8146–#12596 |

The independent inventory and bounded archive search were reported in **#12607, #12631, and #12635**. The exact serialized cutoff array was reported with SHA-256:

`e7f3db5bb0e641b442c52c2c0fc7221411f9f42ae182d304af878b4453adf7a2`

Reported reproduction command:

```sh
nthdegree convo read erdos-97-96-formalization --all --format json \
  | jq -c '[.[] | select(.id<=12596)]' \
  | openssl dgst -sha256
```

This hash identifies that serialization, not every possible equivalent JSON export. It was reported by the local archive reader, not recomputed in this runtime.

I directly reviewed **1,150 returned records inside the original cutoff**, including the continuous early history through #3147, the latest 100-record snapshot, and substantial middle-history slices. The direct ranges were:

`2368–3147; 4000–4101; 5000–5107; 6000–6128; 7000–7049; 8000–8049; 9000–9060; 10000–10050; 10340–10389; 12494–12596`.

IDs are not contiguous message counts. Some IDs belong elsewhere or have no retained body. Deleted content cannot be audited from an empty record. Later audit responses, the completed-consult metadata, and the available consult queue were also checked separately.

**Scope warning:** A full-archive inventory or keyword sweep is not the same as semantic resolution of every request. Absence of a literal `#message-id` reference does not establish that a task was missed: later agents often finish it under a new name. This report therefore separates confirmed latest-state gaps, older leads needing a disposition check, and resolved/refuted routes. A read-only full-ledger request was sent to a single local owner in #12599, with semantic matching and coverage requirements reiterated in #12609, #12632, and #12642. That owner's full request-to-resolution ledger had not been returned when this report was compiled. Consequently, this is a full-archive inventory/triage with targeted semantic review, not a claim that every one of the 9,434 messages has a verified final disposition.

## 2. Ranked actionable findings

### A1 — Highest priority: clean-checkout custody is incomplete

**Evidence:** #12548, #12569, #12574, #12578, #12580, #12594; current raw-ingress follow-up #12636.

The latest source audits distinguish a corrected dirty working tree from the committed source. They report a Fin13 interval issue in `DRExactThirteenValuation.lean`: intervals written with the endpoint `13 : Fin 13` do not mean an ordinary integer endpoint 13. The intended working-tree repair uses `Icc 8 12` / `Icc 9 12`, along with guards, but the audited commits retained the old `Ico` form.

The same audits identify load-bearing untracked modules, including:

- `ThreeRowsFreshOrExactThirteenTight.lean`
- `CardGeThirteenThreeRowsTightAdapter.lean`
- `CardGeThirteenExact13RawIngress.lean`
- `ExactThirteenCenter9TerminalAdapter.lean`
- `Census554/ExactlyOneCrossAliasScalar.lean`

A tracked dispatcher or geometry module importing an untracked file is a reproducibility failure even when the shared working tree checks successfully. The helper's later observation that the working file already contained `Icc` did not settle committed custody; this distinction was explicitly corrected in #12633.

**Next action:** Have the existing owners assemble an exact-path commit containing the intended interval semantics and every imported dependency, then verify the relevant entry point from that commit in a clean environment. Preserve a dependency/axiom report tied to the commit. Do not re-prove already checked scalar or Finset lemmas.

**Exit criterion:** Published commit, clean-checkout build, correct finite-set regression, and no imported untracked dependency in the claimed closure path. This is publication work, not a claim that CardGeThirteen closes afterwards.

### A2 — Completed consults need explicit correction propagation

**Evidence:** #12515 → #12529, #12533, #12544, #12556, #12565; official `consult_get` metadata; later #12645.

Consult `01M1NYCWZTSKGQKNA168CKA3V8` remains marked completed with **response_message_id #12515**. Its proposed B1 route was subsequently rejected: the cross-omission theorem already requires the blocker inequality that the recommendation proposed to derive afterwards. The necessary separation from the apex also cannot simply be omitted. The honest conditional split is already in the coordinator and reaches the same open leaves.

The important missed follow-up is not another proof attempt at that circular plan. It is a durable erratum attached to the original answer and to any report/task derived from it. A later chat rebuttal is too easy to miss when a new agent starts from the completed-consult pointer. The available completion tool does not permit replacing a completed answer with different text, so an explicitly linked superseding erratum is the appropriate form rather than silently treating the record as repaired.

A smaller example appears earlier: #9005–#9006 identify the one-sided `B1WinningLiveSliceSameBoundaryArc` as sufficient, but completed answer #9007 still calls the stronger symmetric packet the smallest target. Later work corrected the actual signed-area API (#10340, #10360); the original answer remains a misleading starting point.

**Next action:** Post a concise superseding erratum with the consult ID, rejected step, corrected dependency graph, and links to the later audits. Mark the old recommendation superseded in the project ledger/report.

**Exit criterion:** A reader starting from the original consult can immediately find the correction; no active task asks an agent to implement the circular or already-existing split.

### A3 — The exact-13 raw-label bridge is the concrete integration target

**Evidence:** #12522, #12523, #12548, #12567, #12574; post-cutoff request #12636.

The useful remaining work is not an arbitrary stronger finite packet. The source audits identify a role-preserving bridge from the physical unordered two/three partition to the raw indexed representation. In particular, the raw deletion label should retain:

`id ∈ Traw` and `id = zraw ∨ id ∈ Kraw`,

plus any source-label membership in the two raw shell supports that is actually justified by support uniqueness.

The physical proof's membership in the first-apex class does **not** automatically imply membership in its strict interior or equality with a retained interior endpoint. Imposing those extra restrictions in a finite model would make an UNSAT result weaker for source lifting, not stronger. Similarly, an exact-12 or exact-15 two-plus-two lemma is not automatically an exact-13 two-plus-three lemma.

**Next action:** Finish the existing raw-ingress lane, proving each membership and role identity from the actual physical packet. Record the first unavailable fact rather than adding it as an assumption. The existing owner has already been asked for precisely these outputs in #12636; this is active follow-through, not an invitation to duplicate the lane.

**Exit criterion:** A source-clean constructor of the raw packet with complete role correspondence and honest alternatives; any finite terminal must consume exactly that packet.

### A4 — Center-9 and other fixed-cell proofs still lack a source occurrence

**Evidence:** #12546, #12554, #12561, #12568, #12574, #12592, #12595; current revalidation #12641.

The center-9 terminal is not waiting merely for an import. It needs `FixedFiveRows`: five specified rows with the required roles and incidences. The exact-13 tight dispatcher retains only its existing physical packet, ingress, cover, and cardinality. It does not manufacture those five rows.

The post-cutoff revalidation at reported HEAD `e91a96018` still finds no producer elsewhere for `FixedFiveRows`; the aggregate does not import the center-9 ingress/terminal. Importing them alone would not discharge the missing antecedent. Mirror coverage likewise needs an actual role/permutation transport, not a verbal symmetry claim.

The same distinction applies to the shared-pair/MEC terminal: a valid local kernel does not supply its required boundary equalities, disk bounds, center membership, and shared support incidence.

**Next action:** Either prove that the source must enter the certified cell, or construct an exhaustive source-faithful family of cells and prove its coverage. Preserve alternatives that do not enter the cell. Do not count another fixed-cell proof as universal progress unless it expands proved coverage.

**Exit criterion:** A producer of the terminal's literal hypotheses from the live residual, including all mirror/alias cases, followed by a clean caller. Until then these remain valuable banked kernels.

### A5 — “CERTIFIED custody audit” was mistaken for recovered evidence

**Evidence:** #12539, #12581, #12596; incorrect helper reading #12631, corrected #12633.

The `dbbae6a5…` catalog payload was **not** recovered by the work summarized in #12596. The certified result was the corrected custody audit: **11,960 attempts**, **5,520 unique digests**, and **zero matching payloads**. The audit commit `0bbbc5a6f` certifies that account, not the absent byte identity.

This is particularly dangerous because the word “CERTIFIED” can be copied into a status table without its object. The audit itself demonstrated that failure: a helper initially classified the catalog as resolved and had to be corrected.

**Next action:** Keep payload recovery as a separate custody item. Recover exact bytes from the original producer or archive; otherwise label claims requiring that identity unreproduced and distinguish any reproducible replacement catalog by its own hash and scope.

**Exit criterion:** Actual bytes matching the claimed hash, with a retained replay command and validator, or an explicit retirement/correction of the original artifact claim. Hash-search exhaustion is not recovery.

### A6 — Preserve canonical negative incidence before projecting to survival squares

**Evidence:** #12559, #12564, #12572, #12591, #12593; post-cutoff #12639 and #12645.

The useful B1 recommendation is to retain the actual selected-row provenance, especially a canonical `p = H.centerAt X` and the negative incidence `X ∉ selectedAt q.support`, before replacing the data by an existential survival-square statement.

The later source audit confirms the limitation: existence of four equidistant points after deleting `q` does not imply that `p` lies on the bisector of the two canonical deletion points, nor that `p` is one of the named blockers. The known bisector-fiber lemma needs those missing incidence/equidistance hypotheses. Fresh `p` is compatible with the projected abstract interface; no full Euclidean counterexample was claimed.

The endpoint-order residual also points in the wrong direction for a free same-arc conclusion. The generic same-arc adapter already exists (#9032), but requires the whole chosen slice inside the strict cap and its blocker outside; the remaining alternatives are genuine residuals. #12645 explicitly retires the two inadequate candidate routes.

**Next action:** Retain the stronger actual-row data in the producer layer and work on an incidence-sensitive consumer, with all canonical/fresh alias cases. Do not formalize another wrapper from the already-refuted projected interface.

**Exit criterion:** A new source-derived incidence fact that satisfies an existing clean consumer, or a genuinely new terminal using the preserved data. Merely restating the case split does not qualify.

## 3. Older leads worth recovering — verification candidates, not assumed open tasks

These are the best older candidates found in the retained-history sweep. Their status is weaker than A1–A6: the historical request is definite, but absence of a later keyword hit is not proof that no semantic completion exists.

### H1 — FR92/P4 transcription and the g(6,8) discrepancy

**Origin:** #2462, #2464, #2466. **Archive cross-check:** #12631.

The old P3 R2 problem was answered and admitted; it should not return to the backlog. A different P4 issue remained tied to the source-paper transcription/caption and the exact range of its hypotheses. The same cluster reported an exact computation giving `g(6,8)=19` while a printed Table 2 entry was read as 18, with an explicit warning that the table interpretation was unverified.

**Follow-up:** Recover the exact paper passage, notation, hypotheses, and certified computational instance together. Decide whether the discrepancy is a transcription/definition mismatch or a genuine correction. Do not claim a published error from these messages alone. Any new publication-facing conclusion needs examination of the original source.

**Why it matters:** This is old, specific, potentially consequential, and different from the already-resolved P3 R2 work.

### H2 — Shortest-side bi-equidistance: reusable theorem bank awaiting a real adapter

**Origin:** #2574. **Current existence check:** #12631.

`ShortestSideBiEquidistance.lean` was reported to contain five no-sorry normalized lemmas, while arbitrary Euclidean normalization and the `ConvexIndep`/MEC adapter were left open. A later read-only check still found the file, not a completed adapter.

**Follow-up:** Compare its exact assumptions with a currently live residual and the now-available similarity-normalization APIs. Only revive it if a concrete consumer can be named. A normalization adapter might be inexpensive; the required source geometry may not be.

**Exit criterion:** Exact proposed caller and missing premise list, followed by either a usable adapter or an explicit bank-only disposition. Do not equate the existence of the five lemmas with a terminal.

### H3 — Rich-rotation diagnostic was promised but no result was established in this audit

**Origin:** #7037; qualified acceptance #7041.

An Adam-origin proposal asked whether an exact-17 survivor forces a three-rich rotation/angular coincidence. The respondent correctly clarified that they owned exact-12, not exact-17, and that a Boolean row model does not determine angles. They queued a metric check against their own retained survivor.

**Follow-up:** Locate a result or close the promise explicitly. Any renewed test must use authenticated metric data or a realizability encoding and be assigned to the correct cardinality lane. This is exploratory and lower priority than publication or live source-incidence gaps.

**Do not do:** Treat a membership-model inspection as evidence of angular coincidence, or restart a broad numerical campaign merely because this old question is unanswered.

### H4 — Source-order cuts authenticated but absent from the discovery CNF

**Origin:** #5099. **Bounded archive search:** #12635. **Later complication:** #10351.

The historical r7/r8 campaign repeated the same cubes with an unchanged discovery-CNF hash despite authenticating a new source-order bank. It explicitly paused until installation of the cuts could be demonstrated.

However, a later exact-12 request refers to the **current source-order-installed v27** command. That prevents an honest conclusion that the old installation bug is still present. The missing audit object is a traceable repair and release receipt, not necessarily unfinished implementation.

**Follow-up:** Tie the first actual installation to its committed generator, child-CNF hash, and a regression that an old witness is rejected. Attach the receipt to the old pause and the current canary instructions.

**Exit criterion:** Demonstrated solver-input change and model rejection, or explicit retirement of the old campaign. Authentication of a bank is not installation of its clauses.

### H5 — BANK-001 atomic evidence publication and snapshot export

**Origin:** #5043; earlier partial byte-storage work #5017/#5020. **Bounded archive cross-check:** #12635.

The requested service contract included atomic payload-plus-evidence publication and snapshot-consistent export. A successful blob PUT is not that transaction. The old APPLY path was intentionally blocked pending the contract.

**Follow-up:** Obtain the external-service implementation/acceptance receipt or mark the feature deferred. Do not route this to a Lean theorem worker. The keyword sweep did not establish a later implementation; it also cannot exclude an implementation under different API names.

**Exit criterion:** Contract-level tests for atomicity, idempotency, failure recovery, and snapshot consistency, or an explicit service-owner disposition.

### H6 — RVOL evidence custody is different from its superseded transfer fragments

**Origin:** #9052–#9056.

The 25-part archive transfer was replaced by a compact plan, then an authoritative native Markdown handoff. The one posted base64 fragment was explicitly superseded. Therefore “missing parts 2/3 and 3/3” is **not** an actionable failure.

The native report was identified as:

`rvol-probe-highn-defect4-global-stage-2026-09-02.md`  
8,498 bytes; SHA-256 `419b6603e52aa54ab89ffd7170a0f66ff5e4baff1b2b8ec21b5f1ece9840b1ac`.

Separately, the full binary evidence archive was said to remain in the originating runtime, SHA-256:

`691006dc0939eab3e34b76ce06a786018c2d5727daa0e3727493c2ea64bd65b1`.

**Follow-up:** Confirm custody of that full evidence bundle or an explicitly sufficient replacement, and link the eight-role/five-row/three-Kalmanson certificate to its current theorem consumer. The report and proof certificate can be useful even when the redundant wrapper archive is unavailable; state exactly which evidence is retained.

### H7 — The old exact-n=10 master claim must not inherit the motif's validation

**Origin:** #10326 as audited in #10355. **Independent positive result:** #10341/#10372.

The audit found no durable artifact, run manifest, or replay command supporting the advertised 9,280-clause exact master and `dffbade…` identity. Checking `8400+840+40=9280` and two chain orbits does not prove exhaustive UNSAT.

A genuinely useful result was separately formalized: `false_of_complementaryArc_selectedRowEqualityChain`, committed and pushed as `e3d065804` (#10372), with source-native equality paths and core-only axioms. That theorem does not authenticate the independent solver/master claim.

**Follow-up:** Locate any subsequent recreated master and bind it explicitly to the corrected claim; otherwise retain the old claim as unsupported. This audit has not independently replayed such a replacement. There is no recommendation to resume sub-12 counterexample mining: the small-cardinality theorem and the custody of an old computational announcement are different questions.

## 4. Useful mathematics to preserve without duplicating work

### Already available: do not commission the same theorem again

**Seven good outside sources.** The later audit records the source-count result at `617c84a61`, survival work at `c79668ef3`, and the common-deletion producer/refactor at `03912489f` / `3b8f9ca69` (#12548, #12574, #12580). Earlier permission/build/ownership discussions around #10001–#10046 are not evidence this count remains undone. The general seven-source mutual-omission theorem does not itself attach a common frontier deletion or all the order/incidence needed by a three-fan terminal.

**Two-four-classes/two-four-shells normal form.** #10366 explicitly verifies that `TwoFourClassesTwoFourShells.lean` already proves the source-neutral uncovered-or-double-partition result. Shell disjointness is a conclusion, not an extra premise (#10005). Re-proving this Finset statement would not advance the live terminal.

**Complementary-arc equality-chain contradiction.** #10341 sharpened the abstract index range, and #10372 committed a more reusable equality-path theorem. Preserve the generic theorem and its source witness interface, rather than limiting its value to the disputed fixed-n master.

**One-sided same-arc/signed-area consumer.** #9005–#9006 establish that one card-two winning slice is enough. #10340/#10360 correct the polynomial packet accordingly. The missing work is producing the positive signed-area condition, not wrapping the existing contradiction with another predicate.

**Three-fan scalar and order kernels.** The order-one scalar kernel, similarity wrapper, reversed/permuted cases, and one-alias scalar have direct mathematical/checking evidence (#10357, #10365, #10367, #10374). Custody and public API still matter. They do not, by themselves, prove that the live source selects their required order/incidence. The proposed homogeneous-coordinate replacement was explicitly judged unnecessary once `normSim` already supplied the needed transport (#10357).

**Existing cap-order terminal.** The large-interior investigation found `false_of_capInterior_center_equidistant_three_points` and its source-neutral cap-data construction (#10384). The remaining finite selection and source-role facts should be checked before creating another special-purpose geometry kernel.

### Generalizations that are genuinely distinct, but not automatic priorities

The latest theorem-bank audit (#12521, #12553) suggests several reusable interfaces rather than duplicated theorems:

| Candidate | What already exists | What is actually missing |
|---|---|---|
| Rhombus/opposite-sum cancellation | Generic opposite-sum theorem | A finite integer-linear certificate evaluator tied to source equalities |
| Equilateral reflection chains | Chain/bisector kernels and generic checking | A justified reflection/chirality or lattice interface |
| Cyclic Kalmanson sums | Local chord inequalities | Cyclic reindexing, summation, symmetry, and the specific strict inequality needed by a caller |
| Interlaced regular-polygon criterion | Some nearby grid/nesting machinery | The actual cosine criterion and its source application |
| Distance-matrix/Cayley–Menger route | A general polynomial-certificate checker | A source-neutral Euclidean realization/determinant adapter |

These are research leads, not five immediate assignments. For each, first name the live theorem it will help and the producer of every new hypothesis. The recurring failure mode is proving a very good consumer for an input the source never supplies.

## 5. Resolved and refuted routes that should stay out of the backlog

A missed-follow-up audit must suppress false positives. The following were particularly easy to misread when viewing only an early request.

| Early appearance | Later disposition | Operational conclusion |
|---|---|---|
| P3 R2 admission unresolved | #2464/#2466 answer it | Keep separate from the FR92/P4 transcription issue. |
| Exact n≤11 still a search target | #2563 records closure | Do not resume sub-12 CE mining as though the lower bound were open. |
| Exact-12 two-radius branch pending | #9047 publishes `2667106ff`; #12513 rechecks scope | This branch is closed under its stated native/compiler trust, not all exact-12 P97 branches. |
| Five-role P1/P2 overlay could force a terminal | #2940/#2943/#2947 give corrected SAT/rational negative controls | Retire the packet-only implication unless genuinely new source facts are added. |
| P10B held-out diversity test outstanding | #2974/#2977 report failure/no gain | This is a negative result, not an unrun promising gate. |
| A large cap-squeeze campaign ruled out everything | #3105 retracted by #3107; #3109's unsupported 400 UNKNOWN count retracted in #3112 | Do not use those numbers or that blanket no-go as evidence. |
| An added source producer reduced the proof frontier | #3113 corrected in #3116: no terminal/on-spine progress | Banked existence is not a closed branch. |
| New equality-cycle theorem needed | #4075 corrected by #4076: the generic consumer already exists | Build occurrence witnesses, not duplicate equality kernels. |
| A minimal seven-point core is nearly available | #4083 rejects the proposed self-edge/positive-edge identifications | Check feasibility of missing premises before ranking by their count. |
| CommonDeletion endpoint adapter impossible | #4095–#4097 explain restoration and distinctness | Earlier mismatch wording is superseded; check landing rather than re-prove impossibility. |
| Certificate parser arbitrary execution remains open | #8013 reports the exploit fixed; subsequent hardening in #8016 | Do not report the old execution flaw as current. Any residual resource-limit claim needs a fresh check. |
| Wave10 exact certificate blocked, hence no theorem | #8024 certifies a direct Lean collision theorem | Emitter resource limits and existence of a mathematical proof are separate. |
| Rigid221 partner classification already yields a contradiction | #8044–#8046 correct the partner identity: both-heavy implies cap≥6, not contradiction | The cap=5 special case does not provide a generic cap bound. |
| Shared-first-fiber Kalmanson route only needs wiring | #9023/#9037 record its bounded no-go and committed audit | Do not revive without new order/incidence facts. |
| AllLargeEndpointRadius closes the exact-15 D1 child | #10016/#10021/#10042 show downstream import and missing no-escape premise; doc corrected | Moving the lemma upstream still does not manufacture the missing premise. |
| Exact rational eleven-point convex control refutes the source packet | #10027 retracts #10003: only six points were on the hull | Equalities/direction feasibility are not strict convex Euclidean feasibility. |
| Two order orbits cover the three-fan interface | #10020 gives an explicit missing Fin7 order | Use the corrected classifier; do not validate coverage by testing only the advertised orbits. |
| A childless build wrapper must be stuck | #10376 corrects #10373: it was a module-transition instant | Old process snapshots are not grounds to kill a current build. |
| A certified catalog audit recovered the catalog | #12596 reports zero matching bytes | Certification must name its object. |

The proper exact-12 status is especially important. #10351 identifies still-reachable exact-12/source-generic leaves after the two-radius and tight-cover branches closed. A branch closure must not become “n=12 is closed”; conversely, the remaining generic leaves must not make us forget already-completed finite subcases.

## 6. Current proof-frontier work: active, not newly discovered omissions

The current channel already contains active audits of the main B1, Rigid221, exact-five, and CardGeThirteen gaps. The follow-up problem is often preserving their conclusions rather than finding another volunteer.

**CardGeThirteen:** The dispatcher separates adjacent-grid from large-interior work, then fresh-source versus exact-13 tight-cover outcomes. These are residual outputs, not terminal proofs (#12532, #12537, #12582, #12585). The seven-source/common-deletion route is already partially implemented; there is no basis for calling a three-fan detour the sole missing step.

**Exact-five five-incidence:** The source-clean continuation packet intentionally supplies one missing center incidence plus a new deletion packet. The tetrahedron consumer needs all of its incidences. Exact-12 tight-cover results and unrelated source-heavy forced-order theorems do not automatically apply to the broad strict-fresh leaf (#9041, #9048). An additional wrapper around packet existence will not remove that sorry.

**Rigid221 source-heavy/blocker-deleted:** The self-audit in #12550 identifies unwired fresh/cover reductions, conditional 3/2/3/3 arguments, conflated blocker cases, and a genuinely open cap≥8 regime. It also records an algebraic sign typo whose replay used the correct formula. The audit's corrections should replace old summaries; they are not grounds to declare the entire branch solved or refuted.

**B1:** The latest negative controls and localization audits leave a real support/incidence or winning-order producer missing. A fresh pair is not automatically the ambient pair, a source's properties do not transfer to a freshly selected vertex by renaming, and generic minimality does not localize every new center to the named blockers (#10010, #12572, #12639).

**Post-cutoff manuscript work:** #12634, #12637, #12640, and #12644 show that another agent is already rebuilding the atomic manuscript/crosswalk and archiving superseded prose. This overlaps the audit's correction-propagation recommendation. Do not launch a competing manuscript rewrite. Feed the specific stale statements and their superseding evidence into that existing pass.

These observations support a narrow coordination rule: the next formalization request should state the **first new source fact**, its exact consumer, and the reduction in a defined live obligation. “Make the packet usable” is too vague unless the missing fields are enumerated.

## 7. Recurring systemic problems and a minimal repair

### Publication and shared-worktree state

Several historical “green” announcements were followed by clean-source failures: #3044 → #3048/#3052 and #5039/#5040 → #5045/#5050. Those particular failures were repaired; their recurrence is the concern. Shared `.olean` files, unstaged declarations, selective staging, or another worker's untracked dependency can mask a broken published tree.

**Repair:** Attach every closure/promotion claim to the exact commit, full imported dependency set, clean-source build result, and named theorem axiom closure. Do not let “no new sorry tokens in this file” stand in for a transitive trust check.

### Claims drift away from their corrections

The record contains corrected cardinality counts, refuted order claims, withdrawn countermodels, and repaired consults, but they are scattered. A reader can retrieve the first confident answer without its retraction. Completed-consult pointers and old prose are particularly vulnerable.

**Repair:** Maintain a single disposition entry for each material claim: original message, latest correction, scope, artifact/commit, owner, and explicit status. Add a visible erratum at the original starting point when replacement is not supported.

### Producers and consumers are repeatedly conflated

The same pattern appears in B1 same-arc, fixed-cell exact-13, FreshThird Kalmanson, Rigid221 normalized cells, and three-fan geometry. A correct terminal only proves `hypotheses → False`. It does not prove the live source satisfies those hypotheses.

**Repair:** A formalization request should contain a producer–consumer pair. If the producer is missing, label that as the mathematical task and test its premise feasibility before writing adapters. Count only eliminated live cells/obligations, not files, wrappers, or theorem declarations.

### Negative controls have different scopes

The conversation includes exact rational metric controls, direction-only controls, finite order abstractions, full-shell and selected-subset encodings, and necessary-condition UNSAT results. Their labels sometimes drift into “counterexample” or “closure.” The retracted hull example (#10027) is a concrete warning.

**Repair:** Every control should explicitly state what it does and does not instantiate: distinctness, strict convexity, all carrier points, full radius fibers, deletion provenance, global K4, and current source packet. Preserve aliases and negative incidence before projection.

### Closed queues do not imply completed follow-ups

The available Pro-consult queue was empty when checked, but a completed consult still pointed at the rejected #12515 answer. Informal requests, publication, evidence recovery, and correction tasks are not represented by the queue alone.

**Repair:** Use separate statuses for `answered`, `mathematically validated`, `implemented`, `published`, `consumed`, `superseded`, and `blocked`. They are not synonyms for `completed`.

## 8. Recommended next sequence

**First: publication integrity.** Resolve A1 with the existing owners, not new proof workers. The clean-checkout dependency gap can invalidate reproducibility of everything built on it.

**Second: authoritative correction.** Resolve A2 and A5, and feed the old no-go/closure crosswalk into the manuscript pass already underway. This prevents more agents from spending time on circular, refuted, or completed work.

**Third: one live source bridge at a time.** Continue the exact-13 raw-label/provenance task in A3. For center-9, require actual five-row occurrence before promoting the fixed-cell result. For B1, preserve canonical incidence and demand a new geometric fact rather than another survival-square wrapper.

**Fourth: close the historical ledger cheaply.** Request a disposition/receipt for H1–H7 from the existing owners. Only H1/H2/H3 are potential research restarts; H4/H5/H6/H7 are principally implementation or evidence-custody checks. Explicitly close or defer them rather than launching all seven.

## 9. Suggested durable ledger schema

A compact entry can replace many status messages:

```text
item_id:
origin_message:
claim_or_requested_result:
current_disposition: open | active | resolved | refuted | superseded | deferred
latest_evidence_message:
artifact_hash_or_commit:
source_scope:
producer:
consumer:
owner:
next_action:
exit_criterion:
```

For proof results, `source_scope` must distinguish fixed cell, finite profile, arbitrary cardinality, and live source implication. For artifact work, the exit criterion is actual recoverable bytes or a valid replacement—not a hash written in a report. For a correction, the exit criterion includes an explicit link from the original starting point.

## 10. Audit handling and recovery

The audit checkpoint was saved incrementally in this runtime. Two connector failures occurred: an unexpected channel-list response and one failed historical page read. Both were immediately reported successfully to `#nthdegree` (#12597 and #12603); direct channel reads and the same-cursor retry then succeeded. No page was silently treated as read after a failed call.

The report deliberately does not give a new total of current literal sorries. Several reported counts use different notions—tokens, declarations, reachable leaves, and blocked cells—and the manuscript/source continued changing during the audit. A current count must be generated from one named commit and one declared counting rule.

**Bottom line:** The conversation contains real reusable mathematics and real remaining producer gaps. The highest-confidence overlooked work is finishing publication and correction propagation. The older research candidates are worth a short disposition check, but the record does not support another broad wave of wrapper formalization or blind fixed-cardinality scanning.
