# `sorry` obligation and promotion policy recommendations

Date: 2026-07-25.

Status: historical policy decision implemented 2026-07-25. The
`PROMOTION-PENDING` post-card-eleven note and source census below describe the
2026-07-25 snapshot, not the current frontier. The generated live blueprint
was not edited by hand.

## Decision

Change the promotion criterion.

The project should continue to reject named local axioms, orphan `sorry`s,
cosmetic theorem fan-out, and conditional wrappers reported as proof progress.
It should stop treating a non-increasing production-`sorry` count as a promotion
gate.

A stable decomposition should be promoted when it makes the aggregate
mathematical frontier strictly more tractable and every new leaf is consumed by
the publish spine. Promotion may temporarily increase the number of direct
`sorry` declarations.

The written discipline at that snapshot was mostly sound. The defect was the gap between
that discipline and the de facto promotion rule. That gap has encouraged open
work to be represented by proposition-valued `def`s, higher-order contradiction
arguments, `...Closers` structures, or prose-only obligations. Those forms avoid
`sorryAx`, but they also make genuine open leaves invisible to the kernel-mined
proof graph.

## Audit-baseline evidence (2026-07-25)

The live source and corpus-wide `proof-blueprint symbols --with-sorry` census
at the audit baseline agreed on two direct production `sorry` declarations:

1. `false_of_originalFrontierUniqueRadiusArm`
   (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:43`);
2. `false_of_frontierAllLargeCapsTriApexRobustResidual`
   (`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:326`).

Target reachability must be checked separately on refreshed
`proof-blueprint spine` output for both publish targets. The corpus-wide symbol
census is not a substitute for that check.

The count of two was a correct direct-source census for that snapshot, but it is not the full
coordinator-interface frontier. The checked post-card-eleven unique-arm
coordinator exposes three named contradiction functions:

- exact-four large-card refined outcome to `False`;
- exact-five distinct-blocker physical-second outcome to `False`;
- exact-five coincident-blocker U5 ingress outcome to `False`.

See
`scratch/atail-force/unique-arm-post-card11-coordinator/PostCardElevenRefinedCoordinator.lean:78-92`.
The exact-four outcome itself has robust and coupled-swapped constructors at
lines 46-53. Including the independent all-large arm, the chosen coordinator
boundary therefore has four named contradiction obligations and five immediate
top-level cases.

This is a selected interface boundary, not an intrinsic smallest frontier.
`ExactFourPostCardElevenRobustContinuation` has five constructors
(`ExactFourRobustLargeRadiusContinuation.lean:637-681`), and
`OriginalUniqueFiveDistinctPhysicalSecondOutcome` has two
(`UniqueFiveDistinctPhysicalSecondApexSplit.lean:119-126`). Any status report
must name the chosen granularity rather than presenting one count as canonical.

This mismatch matters because the refined coordinator is axiom-clean only by
accepting the three open contradiction functions as data. Those functions must
be recorded in the coordinator-interface frontier, but they do not satisfy the
loud Lean-obligation gate and receive no closure credit. The theorem at lines
96-114 is useful as an exact interface audit, but it does not prove any of those
functions.

Three older production patterns show the same policy pressure more starkly:

- `U1TwoShortCapReduction.lean:318-327` calls five proposition-valued `def`s
  “currently open obligations” specifically because they have no theorem body
  and no `sorry`.
- `U5ModeADeletion.lean:63-81` calls seven `def`s open obligations and omits
  their composition because an open proof is said to be forbidden by project
  policy.
- `WitnessPacketInterface.lean:24-37` leaves production steps prose-only and
  does not state their antecedents.

These are not loud Lean obligations. Although declarations and referenced
definitions can be indexed and can occur in the kernel dependency graph, these
forms are not represented as open `sorryAx` obligations or as publish-spine
obligation nodes.

There are also two compatibility-wrapper warnings:

- `FrontierLiveClosure.lean:95-105` retains
  `ExactFiveGlobalCoverStarOutcome` in an exported interface but deliberately
  does not use its contents.
- `FrontierCoupledStrictInteriorNormalForm.lean:57-74` proves a contradiction
  only after receiving contradiction functions for both branches. The module is
  currently unimported.

Both can be legitimate migration or interface-audit artifacts. Neither should
receive mathematical progress credit.

## Exact policy changes

### 1. Add a repository-level obligation and promotion rule

**Where:** append the following section to `CLAUDE.md` after the existing
theorem-bank section. `AGENTS.md` is a symlink to `CLAUDE.md`, so this single
edit updates both agent entry points.

**Text to add:**

```markdown
## Proof obligations and promotion

Represent every active in-project proof obligation loudly in Lean. An active
obligation must be a theorem with an explicit mathematical statement and
`sorry`, transitively consumed by a publish target. Do not hide active
obligations solely as proposition-valued `def`s, structure fields,
higher-order contradiction arguments, or prose-only steps.

It is permitted to replace one load-bearing `sorry` by several load-bearing
leaf `sorry`s when all of the following hold:

1. a kernel-checked producer or case split proves that the new leaves
   collectively cover the parent;
2. the change records an auditable narrowing measure for each leaf, such as
   strictly stronger hypotheses, a smaller cardinality range, or a decrease in
   another stated well-founded complexity measure; stronger hypotheses count
   only when the parent proves them for that branch;
3. every leaf is wired to the parent and a publish target in the same change;
4. the split is acyclic and does not call the parent after erasing data;
5. the leaf statements are stable enough to be the next direct proof targets;
6. superseded outcome, adapter, or closer interfaces are removed, made private,
   or explicitly classified as compatibility-only; and
7. the change records the coordinator-interface frontier before and after,
   including the chosen granularity and immediate constructor fan-out, not only
   the raw `sorry` count.

Do not introduce orphan or off-spine `sorry`s. Exploratory specifications that
are not ready for promotion must be marked `PARKED-SPEC` and must not be called
current obligations or proof progress.

A conditional theorem that assumes the missing contradiction, a
`...Closers` package, or an outcome enumerator is bookkeeping until it either
eliminates a case or feeds a proved terminal. A source-clean wrapper does not by
itself count as closure. Such assumptions and fields must still be listed in the
coordinator-interface frontier even though they do not satisfy the loud
Lean-obligation gate.
```

### 2. Make aggregate tractability the active-plan promotion gate

**Where:** in
`docs/closure-plan-full-spec-2026-07-09.md`, insert a new subsection immediately
after “Authority and snapshot protocol” (after current lines 24-37).

**Text to add:**

```markdown
### Obligation-frontier and promotion protocol

Track two frontiers separately:

- the direct kernel frontier: declarations containing `sorry` on a publish
  spine; and
- the coordinator-interface frontier: every open contradiction assumption
  required by the selected checked coordinator, reported at an explicitly
  chosen granularity together with its immediate constructor fan-out.

Promotion is judged by aggregate tractability, not by a non-increasing direct
`sorry` count. A stable checked decomposition may replace one parent `sorry`
with multiple on-spine leaf `sorry`s when a kernel-checked exhaustive producer
or case split covers the parent, every leaf has a recorded auditable narrowing
measure, and all leaves are consumed by the parent. Proposition-valued `def`s,
contradiction-function parameters, and `...Closers` fields must be listed when
the selected coordinator depends on them, but they do not satisfy the loud
Lean-obligation gate and receive no closure credit.

Every frontier-changing checkpoint must report:

1. direct `sorry` symbols before and after;
2. coordinator-interface obligations before and after, including the chosen
   granularity and immediate constructor fan-out;
3. statements proved;
4. statements bypassed or retired rather than proved;
5. new leaves introduced and the measure by which each is narrower;
6. import and publish-spine reachability; and
7. full root axiom closure, including approved native-computation trust.
```

**Also change:** the “Current inventory” section at current lines 39-60 should
carry both counts. For the present state it should say:

```text
Direct kernel frontier: 2 declarations / 2 textual holes.
Selected coordinator-interface frontier: 4 named contradiction obligations.
At this chosen boundary the exact-four obligation has 2 constructors, for 5
immediate cases total. These are not claimed to be irreducible terminals: the
robust continuation has 5 constructors and the exact-five distinct outcome has
2.
```

This is a status change and must be made together with the matrix update below,
as required by the plan's own change-control rule at lines 9122-9130.

### 3. Add an executable promotion gate to the closure matrix

**Where:** make three changes in
`docs/closure-matrix-2026-07-09.md`.

First, add these statuses to the vocabulary table after `OPEN-PRODUCER`:

```markdown
| DONE-REDUCTION | A checked, source-faithful split strictly narrows the parent; its selected child obligations remain open. |
| PROMOTION-PENDING | A checked candidate decomposition is not yet imported on the publish spine; it receives no closure credit. |
| OPEN-INTERMEDIATE | A stable load-bearing contradiction statement on the publish spine, deliberately retained above a known finer case split. |
| OPEN-TERMINAL | A stable load-bearing contradiction statement selected as a direct proof target, with no deferred checked case split beneath it. |
| COMPAT-ONLY | An adapter or exported wrapper retained for migration; it receives no proof-progress credit. |
| PARKED-SPEC | An off-spine exploratory proposition or prose target; it is not a current proof obligation. |
```

Second, add separate preflight and post-promotion rows under “Control and
publication gates”:

```markdown
| CTRL-PROMOTE-PREFLIGHT | REQUIRED BEFORE SOURCE PROMOTION | Staged candidate decomposition and intended production consumer | Verify a kernel-checked exhaustive producer/case split; record the narrowing measure for every proposed leaf; audit circularity, complete transitive dependencies, import cost, namespace migration, and superseded interfaces; record direct and coordinator-interface frontier deltas. | This gate is evaluated on the staged candidate and import plan. It does not require an unimported candidate already to appear on the publish spine. |
| CTRL-PROMOTE-POST | REQUIRED AFTER SOURCE PROMOTION | Promoted decomposition and publish target | Verify every new leaf is imported and visible on refreshed publish spines; run focused and root builds, both publish-root axiom audits, and publication verification. | Promotion may increase the direct `sorry` count. It fails if any intended active leaf remains represented only as a `def`, function parameter, `...Closers` field, prose step, or unimported theorem. |
```

Third, do not overwrite the whole `K-A-UNIQUE-DISPATCH` row while the generated
certificate-ingress substatuses remain owned by active p5 work. Reconcile those
substatuses with their owner first. Then add a narrower
`K-A-UNIQUE-POST11` row for the post-card-eleven coordinator and classify it
`PROMOTION-PENDING`, with the four unique-arm coordinator obligations listed
explicitly:

- exact-four robust continuation;
- exact-four coupled-swapped surface;
- exact-five distinct physical-second outcome;
- exact-five coincident U5 ingress outcome.

Use this row shape:

```markdown
| K-A-UNIQUE-POST11 | PROMOTION-PENDING | `scratch/atail-force/unique-arm-post-card11-coordinator/PostCardElevenRefinedCoordinator.lean` plus its audited transitive dependency closure; intended consumer `false_of_originalFrontierUniqueRadiusArm` | Run `CTRL-PROMOTE-PREFLIGHT`; promote a checked exhaustive producer and four explicit on-spine intermediate contradiction obligations; prove the parent by dispatch; then run `CTRL-PROMOTE-POST`. No new conditional closer is an accepted deliverable. | The selected boundary has four named obligations and five immediate cases; finer constructor fan-out remains recorded. The scratch coordinator receives no closure credit until promotion and postcondition checks pass. |
```

The acceptance column should require `CTRL-PROMOTE-PREFLIGHT`, followed by
promotion and `CTRL-PROMOTE-POST`. Only then should the row become
`DONE-REDUCTION; OPEN-INTERMEDIATE`. It should require either proofs of those
obligations or their promotion as on-spine `sorry`s, and explicitly say that
another conditional closer layer is not an accepted deliverable. Existing
K-A certificate substatuses remain authoritative until separately reconciled.

### 4. Remove stale hard-coded obligation counts

**Where:** update the comment at `.blueprint.toml:13-17`.

Replace the historical “57 sorry-carrying symbols” paragraph with:

```toml
# P97 primary; P96 is the sibling publish target. Both currently inherit the
# same open proof frontier. Counts are deliberately not hard-coded here:
# query `proof-blueprint symbols --with-sorry` for the corpus census, and
# refresh refs plus both publish-target spines for reachability before reporting
# or publishing.
```

**Where:** rewrite `README.md:7-15` and `README.md:57-95`.

The README currently reports the retired 12-symbol/32-hole LIVE frontier. It
should instead report the two direct production holes, name both, and separately
state that the unique arm has a finer checked scratch reduction which is not yet
the production kernel frontier. The rewrite must distinguish “bypassed/retired”
from “individually proved” for the former LIVE leaves.

Do not edit `docs/live-blueprint.md` manually. Refresh it only through the
authoritative CLI after source promotion.

### 5. Promote the stable unique-arm decomposition as a deliberate intermediate boundary

**Where:** start from the refined coordinator and robust-cap directories:

```text
scratch/atail-force/unique-arm-post-card11-coordinator/
scratch/atail-force/unique4-robust-cap-expansion/
```

Do not assume that moving only those directories or one coordinator file is
sufficient. Before promotion, audit the complete transitive dependency closure.
The current coordinator reaches scratch modules including the unique4 n=11
source lift and source closer, unique5 distinct hybrid terminal, unique5
coincident direct-false lane, unique4 swapped terminal, and robust/successor
dependencies. Record which declarations are promoted, reused from production,
or left behind; replace basename-local scratch imports with qualified production
imports; and migrate scratch namespaces deliberately.

After that audit and a focused Lean 4.27 build, place the production surface in
a module such as:

```text
lean/Erdos9796Proof/P97/ATail/OriginalUniqueRadiusArmPostCardEleven.lean
```

The source-clean data types, cap/cardinality reductions, and exhaustive producer
theorems should be promoted without `sorry`. As the first corrected-policy
promotion, represent the selected coordinator boundary by four explicit,
load-bearing theorems:

```lean
theorem false_of_exactFourPostCardElevenRobustContinuation ... : False := by
  sorry

theorem false_of_coupledSwappedExactFourSurface ... : False := by
  sorry

theorem false_of_originalUniqueFiveDistinctPhysicalSecondOutcome ... : False := by
  sorry

theorem false_of_coincidentBlockerU5IngressOutcome ... : False := by
  sorry
```

`false_of_originalFrontierUniqueRadiusArm` should become a thin, proved
coordinator that dispatches to these four obligations. These four are deliberate
intermediate on-spine boundaries, not claimed to be irreducible terminals: two
of their input outcome types have further constructor fan-out. The net direct
production frontier would then be five `sorry` declarations: these four plus the
independent all-large-caps obligation. That is a more faithful
coordinator-level frontier than the current count of two, not a claim that five
is the canonical smallest leaf count.

After promotion:

- remove `OriginalUniqueRadiusArmPostCardElevenRefinedClosers`, or retain it
  privately as a test-only interface with `COMPAT-ONLY` status;
- do not add another `Outcome`, `Continuation`, `NormalForm`, or `Closers` layer
  unless it eliminates a branch or proves a new quantitative invariant; and
- refresh proof-blueprint so the four obligations, rather than only their
  parent, are visible on the publish spine.

After this first promotion, split a multi-constructor outcome further only when
the terminal statements are stable, the exhaustive case split is checked, and
the recorded narrowing measures show an aggregate tractability improvement.

The current three-radius cap lemma exists only at
`scratch/run-tmp/three_radius_cap_ge_eight_agent_20260725.lean:18-26` and is not
imported. Its integration is a promotion blocker only if it changes one of the
four proposed boundary statements or its exhaustive producer; otherwise it
should proceed independently. Promotion should not wait until all four open
proofs are complete.

### 6. Classify hidden historical specifications instead of converting them blindly

**Where:** audit and relabel:

- `lean/Erdos9796Proof/P97/U1TwoShortCapReduction.lean:318-327`;
- `lean/Erdos9796Proof/P97/U5ModeADeletion.lean:63-81`; and
- `lean/Erdos9796Proof/P97/WitnessPacketInterface.lean:24-37`.

For each proposition:

1. if it is on the selected current route and its statement is faithful, promote
   it to a theorem with `sorry` and wire it to the publish spine;
2. otherwise keep it as a definition/specification but label it
   `PARKED-SPEC`, remove the phrase “current/open obligation,” and name the
   condition that would reactivate it.

Do not add off-spine `sorry`s to these legacy files merely to make them loud.
The point is faithful classification, not maximizing the count.

### 7. Retire compatibility surfaces that no longer carry information

**Where:** for
`false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual` at
`FrontierLiveClosure.lean:95-105`, first simplify the already-existing minimal
theorem
`false_of_frontierBiApexRobustExactFiveSecondCapProfile` at lines 123-134 so it
executes the current redesignation proof directly instead of constructing an
outcome only to call the legacy theorem. Then migrate callers and make the old
exported global-cover-star signature deprecated/private, or remove it once
reference-free. An argument assigned only to `let _outcome := outcome` must not
remain the advertised mathematical interface.

**Where:** classify
`ATail/FrontierCoupledStrictInteriorNormalForm.lean` as `COMPAT-ONLY`, `BANK`, or
`ARCHIVE` unless it acquires an imported production consumer. Its
`false_of_frontierCoupledStrictInteriorConsumers` theorem is an interface
assembler, not a terminal.

**Where:** remove the superseded commented implementation and stale milestone
text in `U1LargeCapRouteBTail.lean` after confirming the replacement route is
the only imported consumer. Preserve historical prose in an archive document,
not as a multi-thousand-line commented production block.

### 8. Require a frontier-delta report for every promotion

**Where:** add this template to the closure plan immediately before “Change
control,” and require it in handoffs that change the theorem frontier:

```markdown
### Obligation-frontier delta

- Publish target:
- Direct `sorry` symbols before / after:
- Coordinator-interface obligations before / after:
- Chosen interface granularity and immediate constructor fan-out:
- Proved in this change:
- Bypassed or retired, not proved:
- New load-bearing leaves:
- Kernel-checked exhaustive producer/case split:
- Auditable narrowing measure for each new leaf:
- Immediate consumer and refreshed spine path:
- Transitive dependency, import-cost, and namespace-migration audit:
- Superseded interfaces removed or classified:
- Focused build:
- `#print axioms Problem97.erdos97_rhs`:
- `#print axioms Problem96.erdos96_rhs`:
- `proof-blueprint symbols --with-sorry` corpus census:
- Refreshed `proof-blueprint` refs and both publish-target spines:
- `proof-blueprint verify-publish`:
```

## What should not change

Keep the following rules:

- use `sorry`, not a named axiom, for an in-project unproved theorem;
- reject orphan and off-spine placeholders;
- require exact source-to-consumer field maps and circularity checks;
- distinguish a checked reduction, external solver evidence, kernel replay, and
  production closure;
- audit actual axiom closure, including `Lean.trustCompiler`;
- require a named consumer and acceptance gate before a row is `DONE`;
- never edit the generated live blueprint by hand; and
- do not count a successful build, an outcome enumerator, or a conditional
  consumer as a closed theorem.

These rules are protecting the project. The needed correction is to make loud,
load-bearing decomposition easier to promote than axiom-clean obligation
relocation.

## Recommended rollout order

1. Add the repository-level rule to `CLAUDE.md`/`AGENTS.md`.
2. Add `CTRL-PROMOTE-PREFLIGHT`, `CTRL-PROMOTE-POST`, the new statuses, and the
   frontier-delta template to the plan and matrix.
3. Correct stale counts in `.blueprint.toml`, the README, the plan, and the
   matrix.
4. Reconcile the actively owned K-A certificate substatuses, audit the complete
   transitive dependency/import closure, and determine whether the unimported
   three-radius lemma changes the proposed boundary statements.
5. Freeze and promote the four explicit intermediate unique-arm obligations;
   make the parent theorem a proved coordinator.
6. Refresh/build/audit the new spine.
7. Classify the older hidden specifications and retire unused compatibility
   surfaces.

This order changes the policy before it changes the proof graph, then uses the
current unique-arm lane as the first test of the corrected promotion gate.

## Implementation outcome

Implemented on 2026-07-25:

- repository policy now permits a temporary increase in direct theorem holes
  only for checked, exhaustive, narrowing, on-spine, acyclic decompositions;
- the closure plan and matrix define the promotion gates, new status vocabulary,
  and obligation-frontier delta;
- `.blueprint.toml`, the README, plan, and matrix report the two current direct
  theorem holes rather than historical aggregate counts;
- the post-card-eleven boundary has a durable preflight audit at
  `docs/audits/2026-07-25-unique-arm-post11-promotion-preflight.md`;
- the post-card-eleven coordinator was **not** promoted: its retained graph
  reaches a `U1LargeCapRouteBTail -> FrontierLiveClosure` import cycle and has
  unresolved basename imports, so the next step is an acyclic source-clean
  extraction;
- `U1TwoShortCapReduction`, `U5ModeADeletion`,
  `WitnessPacketInterface`, and
  `ATail/FrontierCoupledStrictInteriorNormalForm` now distinguish
  `PARKED-SPEC`, `COMPAT-ONLY/BANK`, and active infrastructure;
- obsolete exact-five exported wrappers were removed and the redesignation
  proof now calls the unique arm directly;
- 6,036 lines of retired Route-B commented implementation plus two final
  commented wrappers were removed from production source, with unique
  historical payloads preserved under
  `docs/archive/2026-07-25-u1-route-b-tail-retired/`; and
- `docs/live-blueprint.md` remained generated-only.

The production obligation frontier therefore remains two direct theorem holes.
The cleanup and policy changes improve visibility and promotion discipline but
close neither theorem.
