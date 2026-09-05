# Freshness audit of the P97 atomic prose manuscript

Date: 4 September 2026  
Target: `docs/erdos-97-descent-prose-proof-atomic.md` on public `main`  
Scope: read-only documentation/status audit; no repository edits, Lean build, or new mathematical closure claim.

## Verdict

The manuscript is not a fully current operational proof guide. It contains useful later updates, but those updates have not consistently propagated to the surrounding summaries, obligation lists, implementation orders, and source crosswalk. Some contradictions can be established within the manuscript itself. Others appear when its old parent declarations are compared with the currently displayed generated dependency graph.

Its explicit designation as a historical 23 August synthesis is legitimate. Historical counts and dated research proposals should not simply be erased. The problem is that sections inside that historical document still describe themselves as current, and several of those sections disagree with newer passages in the same file.

## Evidence and verification boundary

The audit used the publicly served manuscript, `docs/live-blueprint.md`, the repository README's generated/status sections, `proof-status/obligations.json`, `docs/proof/CURRENT.md`, and the 4 September source-audit reports read directly from the `erdos-97-96-formalization` nthdegree channel.

The displayed generated graph lists **27 open obligations**: 16 Rigid221, one TriApex, seven TwoSource, and three two-deletion obligations. This is an observed generated snapshot, not a new build or axiom audit performed for this report. The registry and graph can retain different declaration names during refactors; equal counts do not establish identical source revisions.

Public browser extraction exposed normalized text offsets rather than trustworthy literal source line numbers. Locations below therefore use section identifiers, distinctive text, and declaration names. A separate local read-only request, nthdegree #12612 with clarification #12634, asked for a pinned HEAD/file identity and literal line mappings. No reply to that request was used to justify this report.

### Evidence keys

- **M** — target manuscript, as served on 4 September.
- **G** — `docs/live-blueprint.md`, displayed graph rooted at `Problem97.erdos97_rhs`, 27 obligations and 22 trusted leaves. These are different counts; the open-node numerator is not an obligation count.
- **R** — `proof-status/obligations.json`, especially the evidence notes for the legacy IDs `P97-OFF-R221-POSTCARDELEVEN` and `P97-OFF-TS-OUTSIDESEEDRESIDUAL`, both marked reachable.
- **README** — current proof-status/generated-authority sections, including the reviewed private-edge manifest and the 27/0 registry summary. Older narrative paragraphs in that README are not treated as independent current proof evidence.
- **N12** — source audits #12513, #12582, #12594: exact-twelve two-radius replay integration and the remaining card-greater-than-twelve terminal.
- **N13** — source/status audits #12548, #12574, #12580, #12585–#12587, #12592: CardGeThirteen producer, occurrence, trust, and uncommitted-work boundaries.
- **NB1** — correction/source audits #12529, #12544–#12545, #12556, #12559, #12564, #12572, #12591, #12593.
- **NA1** — blocker-deleted retrospective #12550.

Channel reports are attributed evidence, not builds independently replayed here. Several audited Lean reports used HEAD `f8dd9c3d445e1dd9b68ca4d4d7e0d81d785690ca`; later reports confirmed unchanged relevant Lean sources at `5434d540c31f76b12014b0371978636c7a650c1c`. Later documentation-only commits were reported. This report does not pretend that all independently fetched `main` pages are a single pinned checkout.

## Confirmed freshness findings

### F01 — The status summary needs an explicit present-day overlay

**Locations:** front matter; contents entries for §§11 and 16; §16.4 snapshot discussion; §16.5.37; §16.7; §17.

The front matter correctly declares a historical 23 August snapshot and quotes a 30 August registry. Elsewhere the document has live-facing counts and language, including the 29-leaf claim in §16.5.37 and the “current” impact ledger in §16.7. These cannot serve as a present-day roster. The displayed repository status is now 27 reachable and no off-spine entries in its registry summary. [M, G, R, README]

**Correction:** preserve dated snapshots, but label their scope consistently. Add one separately dated current-status panel with the measured commit, graph/registry identities, reachability method, and trust boundary. Do not turn the historical 25/6 or 28 into current counts merely by removing their dates. Do not change the present count by subtracting prose-closed subcases.

### F02 — The A3 status contradicts the later A3/A4 closure text

**Locations:** §11/F0; §16.5.A2, especially its final status; §16.5.A3–A4.

The older summary still denies an unbounded transfer for this branch, and A2's final status keeps A3 open. Yet A3 immediately supplies the cardinality-free wedge theorem, and A4 supplies the stronger unsplit BlockerV residual closure, both marked closed on 29 August. [M]

**Correction:** update the older summary and A2 status to acknowledge the later cardinality-free closures. Keep the narrower statement that A2's particular finite argument, by itself, is not the proof of A3. Do not confuse the closed BlockerV route with the still-open BlockerDeleted sibling.

Relevant implemented names recorded by the manuscript:

```text
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowBlockerDeleted_deletedRowBlockerOffClass_wedge
false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonBlockerV_vRowCircleWedge
```

### F03 — The TriApex work order still asks for already completed D2 work

**Locations:** §16.5.D10; compare §16.5.D11 and §11/F1.

D10 still makes D2 formalization the first remaining step and forecasts a two-to-one-to-zero root transition. D11 and the earlier F1 summary already mark D2 kernel-clean. The current graph retains one TriApex residual, not two. [M, G, README]

**Correction:** remove D2 from the remaining implementation queue. Keep it as a completed milestone and reusable theorem. Direct remaining work to the explicit five-survive/one-fail D1 residual and its missing geometric inputs.

### F04 — The final TriApex ledger and crosswalk resurrect the old nine-root frontier

**Locations:** §16.7, rows for D8 and the other eight TriApex leaves; §17, the D1–D9 live-leaf description.

These entries conflict with the one-root account already given in §16.5.D and D11. D3–D9 are compatibility/source-clean routes into D1, not independent live terminal obligations. [M, G, README]

**Correction:** map historical D1–D9 names to the current single residual:

```text
Problem97.ATailFrontierLiveClosure.
  false_of_pairedCommonDeletion_fiveSurviveOneFail_triApexAllLarge_core
```

D11 already has this target. Propagate that correct information outward rather than rewriting the whole TriApex discussion as though it had never been updated.

### F05 — C3 misses the exact-twelve versus card-at-least-thirteen split

**Locations:** §16.5.C3; §16.7 and §17.

C3 still presents `false_of_exactFourPostCardElevenTwoRadiusBranch` as the undivided open endpoint. The current graph instead exposes its `_cardGeThirteen` child, and the source audits identify the exact-twelve arm as discharged through the replay-backed clause-unsatisfiability route. The parent remains transitively open because of the larger-cardinality child. [M, G, N12]

**Correction:** record two separate branches:

- Exact twelve in this two-radius branch: closed through the project's approved native certificate boundary.
- `12 < D.A.card`: `false_of_exactFourPostCardElevenTwoRadiusBranch_cardGeThirteen` remains open.

Use the manuscript's certificate-aware status vocabulary. Do not describe the clause-identity computation as pure core reduction, and do not infer that every twelve-point P97 case is closed: the separate A5/A6 exact-twelve source-heavy leaves still appear in G.

### F06 — The old off-spine exclusion is no longer a safe reachability claim

**Locations:** §16.5.C introductory paragraph; §0.2 reachability-authority guidance; old off-spine accounting.

The C introduction excludes `false_of_exactFiveDistinct_biApexRobust_postCardEleven` on the basis of an older graph. R explicitly records its public-to-private consumer path and marks it reachable. R similarly promotes the TwoSource pinned-endpoint outside-seed residual. The newer G additionally exposes the refined distinctFresh physical/five-incidence leaves. [M, R, G, README]

**Correction:** replace the exclusion with a dated historical note plus the current dependency/migration map. The audit procedure must include the reviewed private-edge manifest and theorem-level axiom evidence, not only a public graph that may omit private helper edges. A legacy ID containing `OFF` is not a current reachability classification.

### F07 — The Rigid221Closure roster and source crosswalk need the newer distinct-fresh branches

**Locations:** §16.5.C's five-leaf heading/list; §16.7; §17.

The current graph explicitly lists these two open descendants:

```text
false_of_exactFiveDistinct_threeCenter_distinctFresh_physical
false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence
```

The old five-leaf C organization does not give a current one-to-one leaf map. [M, G]

**Correction:** regenerate the C roster from the selected audit revision and give each old parent a mapping to its actual current residuals. Keep the common-obstruction reduction already documented in C5: that section correctly records its 31 August source-clean reduction and downstream openness. It should not be reinstated as an independent literal sorry.

### F08 — A7 points at the old missing-incidence boundary

**Locations:** §16.5.A7; §16.7; §17's A7/CD10 mapping.

The manuscript's target ends in `uDeletion_fixedPhysicalPair_missingIncidence`. G's live target ends in `uDeletion_fixedPhysicalPair_outsideThreeRows`. [M, G]

**Correction:** explain the intervening reduction and identify the outside-three-rows residual as the currently exposed obligation. Preserve the five-tag/common-deletion discussion as upstream reasoning where valid, but do not assign an agent the old parent as though it were still the literal hole. Confirm the exact source-level wrapper/body at the pinned revision when applying the edit; a graph-name change alone is not a proof that the whole old branch closed.

### F09 — F2 has incompatible live counts and an incomplete present-day obligation map

**Locations:** §11/F2; §16.5.E–H; embedded checkpoint 36; §16.7.

The manuscript alternates between a six-leaf F2 lineage and eight live F2 declarations. The displayed G has seven TwoSource obligations, including the reachable pinned-endpoint outside-seed residual. That residual is mentioned in the preferred-choice patch instructions, but it is not reconciled into a single current roster. [M, G, R]

**Correction:** distinguish historical raw/source lineages, current publication-reachable declarations, and the proposed semantic Root A/Root B organization. Keep the first-cap-preferred and all-blockers reductions explicitly conditional until their source integration and reachability are established; do not count prose bypasses as removed Lean obligations.

### F10 — F3/B1's first live hole has moved

**Locations:** §16.5.I0; its B1 continuation discussion; §16.7; §17.

I0's first unresolved name is `b1_globalGapOrClosedTerminal_of_counterexample`. In G that name is an intermediate node above the open

```text
false_of_b1PhysicalClassFiveSixNormalForm
```

The other two F3/two-deletion collision and survival-square leaves remain present. Thus “three open obligations” can still be correct while the first declaration name and its mathematical interface are stale. [M, G, NB1]

**Correction:** describe the current physical-class-five/six normal form, its exact-five/card-six branches, and the missing source-faithful geometric consumers. Retain the old B1 name as a wrapper in the migration table, not the terminal task.

## Recent source-boundary corrections worth adding as an explicit addendum

These are update candidates grounded in the September channel audits. They are not claims that every old manuscript sentence already contains the corresponding error, nor are they proof promotions.

### A1 / BlockerDeleted

The 4 September retrospective rejects the circular five-cycle shortcut, says the fresh/cover trichotomy was not integrated into `Rigid221SourceHeavy`, and limits the `13 <= |A| <= 15` restriction to the cover arm. The cap-seven analysis is not an exhaustive reduction of all larger caps. The open BlockerDeleted branch must not inherit the BlockerV closure. [NA1]

Add these restrictions next to A1's proposed cycle program and label any new cardinality/fiber profile by its exact hypotheses.

### CardGeThirteen

The current producer progress is substantial but nonterminal. Record the good-source count/common-frontier-deletion results, the large-interior/grid split, and the strict-interior three-row packets separately from their still-missing consumers. The fixed-cell center-9 bank requires a source-faithful fixed-row occurrence packet; a global K4 existential alone does not provide it. All-center CEGAR was reported at an iteration limit, not as exhaustive UNSAT. [N13]

At the audited local revision, the Fin 13 interval repair and several raw/tight ingress files were uncommitted or untracked. Any text incorporating them must say so. Do not silently promote focused working-tree success to clean-checkout reachability.

The important statement-level guardrails are: preserve the unordered 2+3 split; do not confuse a row centered at a source with its blocker-centered critical row; do not infer deleted-point membership in the strict first interior from first-apex-class membership; and do not infer arbitrary source/blocker inequalities from omitted-row membership. [N13]

### B1 / Two-deletion

The attempted proof of distinct deleted-source blockers from cross omission was circular: the cited cross-omission theorem already takes that blocker inequality as input. Distinct deleted vertices alone do not prove distinct blockers. [NB1]

The manuscript's I13 already assumes the inequality first; that passage should be retained. The useful update is a warning against reversing this dependency and a current account of the alias/fresh canonical-blocker split. That refinement and the cap-order packets still do not supply a general same-boundary-arc or fresh-center terminal. [NB1]

## Material that should not be falsely marked obsolete or closed

The following qualifications survived this audit:

- C5 already records the 31 August common-obstruction source-clean reduction and its downstream dependencies.
- A3/A4 and D11 contain later correct status updates; the surrounding stale summaries, not those updates, need repair.
- I32 and §16.6.4 already reject the unsupported recursive `JointCapCover` interface. Earlier proposal sections may need more visible local warnings, but the correction is present.
- The manuscript distinguishes native/certificate trust from ordinary core axioms. Preserve that distinction when adding exact-twelve progress.
- The manuscript does not claim that P97 is proved. The current displayed graph continues to contain open obligations.

## Recommended editorial repair

First repair F02–F06: they can misdirect proof work or misstate the live boundary. Then synchronize the concrete target names in F07–F10. Finally add the separately dated September source-boundary addendum.

A small status-layer refactor is preferable to appending another unintegrated checkpoint. Keep the mathematical development and dated historical narrative, but maintain one current table with: old name, current residual, source file, measured commit, pure-core/native/conditional trust, publication reachability, first missing premise, and evidence. All implementation orders and the final crosswalk should derive from that table.

A completed edit should be checked against a single pinned source revision and its generated graph/registry, with private-edge and axiom coverage. No proof status should be upgraded merely because prose, a packet producer, or a fixed-cell certificate has been added.
