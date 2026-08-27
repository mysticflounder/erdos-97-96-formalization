<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# CAP-configuration T0 selection pro-model prompt

Date: 2026-08-27

Purpose: obtain a decision-ready T0 recommendation and complete draft T0
record for independent review. This prompt does not authorize implementation,
PIQD execution, or a solver campaign.

```text
You are conducting a read-only T0 target-selection audit for the P97 PIQD
cap-configuration incidence census in:

/Users/adam/projects/math-projects/erdos-97-96-formalization

Your objective is to produce a decision-ready T0 recommendation and a complete
draft T0 record for independent review. Do not implement anything, edit files,
authorize a run, start PIQD, or run a solver campaign.

A recommendation is not authorization. Do not claim that T0 has passed merely
because you drafted or reviewed it.

## Required preflight

1. Read completely:
   - /Users/adam/projects/math-projects/AGENTS.md
   - the repository-local AGENTS.md
   - docs/plans/2026-08-23-cap-configuration-piqd-census-plan.md
   - docs/runbooks/p97-cap-configuration-ce-search.md
   - docs/specs/p97-piqd-cap-configuration-census-v1.md
   - docs/closure-plan-full-spec-2026-07-09.md
   - docs/computational-closure-plan-2026-07-28.md
   - docs/live-blueprint.md
   - docs/erdos-97-descent-prose-proof-atomic.md

2. Use `nthdegree recall` for recent CAP-census and Rigid221 decisions.

3. Record the current repository HEAD and source/import revision. Treat all
   line numbers and candidate descriptions below as leads to verify against
   the current checkout.

4. Inspect the actual Lean declarations and their transitive consumers. Do not
   rely solely on prose-plan names.

5. Run exactly one bounded theorem-bank reuse preflight for each concrete
   theorem candidate that survives initial screening, as required by the
   repository instructions. Record:
   - search key;
   - candidate;
   - immediate consumer;
   - first missing antecedent or circularity;
   - source/import revision.

Do not run repeated searches with materially identical keys.

## Current known state to verify

The CAP runtime is believed to remain:

`IMPLEMENTED_FIXTURE_ONLY_UNQUALIFIED`

No accepted durable T0, T1a, or T1b record is known to exist. The current
runtime is target-neutral, hard-codes diagnostic fixture semantics, rejects
non-fixture execution, and does not itself authorize live work.

Treat fixture success, SAT/UNSAT rates, PIQD receipts, or a complete diagnostic
manifest as incapable of selecting or passing T0.

Recent Rigid221 refactoring and leaf work may have changed declarations and
consumers. Verify the live source and blueprint rather than assuming the
descriptions below remain current.

## Exact T0 modes

Evaluate exactly these three modes:

1. `COUNTEREXAMPLE_WITNESS`

   A replayed exact assignment, together with every required source predicate,
   must construct a typed source-level geometry and prove the exact theorem
   that refutes the named proposition.

   Termination choices:
   - `EXHAUSTIVE`; or
   - `FIRST_VALID_WITNESS`.

   `FIRST_VALID_WITNESS` may stop only after retaining a checked source-level
   witness theorem. Coverage remains `INCOMPLETE`, and all unattempted cells
   must remain visible.

2. `NEGATIVE_BRANCH_CLOSURE`

   Every source-permitted geometry under the complete T0 hypotheses must map
   into the declared universe, its canonical representative, and every enabled
   encoded atom. Every required negative branch ultimately needs a checked
   certificate or Lean proof.

   Required termination:
   - `EXHAUSTIVE`.

   Solver UNSAT without a checked source bridge and proof/certificate path is
   discovery evidence only.

3. `DIAGNOSTIC_OBSTRUCTION_MINING`

   A predeclared bounded scope may identify candidate lemmas, missing
   predicates, smaller targets, or tractability information.

   It has no theorem-completion state and must remain explicitly off-spine
   unless the active closure plan separately authorizes otherwise.

Also permit a verdict of `DEFER_T0` if no candidate presently has a
source-faithful ingress, meaningful consumer, adequate oracle prospect, or
defensible lift.

## Candidate target families

Evaluate at least the following. You may add a better candidate found in the
current source, but may not silently omit these.

### Option A3: Rigid221 unbounded `card_ge_eighteen` off-class residual

Likely mode:
- `NEGATIVE_BRANCH_CLOSURE`, if a cardinality-independent finite ingress or
  bounded-obstruction lift can be stated;
- otherwise only `DIAGNOSTIC_OBSTRUCTION_MINING`.

Potential benefit:
- strongest direct relevance to the surviving Rigid221 unbounded frontier;
- may feed the `card_ge_seventeen` coordinator and source-heavy pentagon route.

Known risk to verify:
- no source-faithful general-cardinality finite model or certificate may
  currently exist;
- four selected rows need not cover the whole carrier;
- a bounded `n = 18` computation does not close an unbounded `|A| >= 18`
  residual without a proved extraction/lift theorem.

### Option A2: Rigid221 exact-17 / second-cap-cardinality-9 endpoint

Likely mode:
- finite `NEGATIVE_BRANCH_CLOSURE`;
- diagnostic refinement if the source-entitled universe is not yet available.

Potential benefit:
- closes a bounded deleted-row/off-class branch with an immediate live
  consumer.

Known risk to verify:
- the existing coarse or unconditional CNF may be SAT;
- retained assignments marked `source_realizable = false` do not constitute
  counterexamples;
- a refined source-entitled exact-cover obstruction and checked bridge may
  still be missing.

### Options A5/A6: Rigid221 exact-12 physical-radius split

Targets:
- common-deletion missing-incidence arm;
- next-row-only-hit arm.

Likely mode:
- finite `NEGATIVE_BRANCH_CLOSURE`;
- source-tagged diagnostic metric-cell mining if complete ingress is
  unavailable.

Potential benefit:
- exhausts an exact-twelve physical-radius split and may feed current live
  leaves.

Known risks to verify:
- remaining same-side cells, continuation children, source-adapter assumptions,
  and metric coverage;
- incidence-only contradiction is insufficient when the consumer requires
  Euclidean, cyclic-order, cap, or blocker semantics.

### Options A7/A8: Rigid221 continuation leaves

Targets:
- fixed-pair `u`-deletion;
- failed-then-surviving `xv`-deletion.

Likely mode:
- `NEGATIVE_BRANCH_CLOSURE`;
- bounded-cardinality probes are diagnostic unless accompanied by the exact
  source lift.

Potential benefit:
- closes continuation families feeding the Rigid221 root.

Known risks to verify:
- several cap-sensitive continuation arms may remain;
- shared incidence data alone may not force the required contradiction.

### Options A1/A4: named source-heavy blocker leaves

Targets:
- blocker equal to the deleted point;
- blocker centered at `v` and off the physical class.

Likely mode:
- `NEGATIVE_BRANCH_CLOSURE`;
- diagnostic only if reduced to incomplete finite cells.

Potential benefit:
- removes named pentagon continuations and may yield reusable common-circle or
  independent-bisector lemmas.

Known risks to verify:
- a midpoint-cycle, blocker-provenance, or two-independent-bisector theorem may
  be missing;
- one bisector or off-class condition is not automatically sufficient.

### Broad ATAIL, FreshThird, and generic n=10/15/17 surfaces

Evaluate them, but default to `DIAGNOSTIC_OBSTRUCTION_MINING` unless an exact
current source theorem, finite ingress, immediate consumer, and promotion path
can be demonstrated.

Existing incidence tables, token counts, or timed-out full-inequality pilots
are not target authorization.

## Mandatory evaluation criteria

Score every candidate on:

1. Active-spine relevance.
2. Exact qualified Lean source theorem or residual.
3. Immediate consumer and final published consumer.
4. Expected strict reduction of a well-founded frontier measure.
5. Current constructor fan-out.
6. Source-faithful finite ingress.
7. Exhaustiveness or bounded-obstruction lift.
8. Symmetry action and required transport theorem.
9. Atom entitlement in the direction consumed by the conclusion.
10. Exact witness construction, if counterexample mode is proposed.
11. Independent T1a oracle feasibility.
12. Structural-filter and bounded-sample feasibility.
13. Likelihood that results are actionable rather than merely descriptive.
14. Trust and promotion path:
    - exact replay;
    - checked CNF/LRAT where applicable;
    - Lean theorem;
    - accepted axiom/native/compiler boundary;
    - independent verifier.
15. First omitted source antecedent or predicate.
16. Risk of encoding a stronger statement than the source supplies.
17. Risk of proving only a fixed-cardinality special case of an unbounded
    residual.
18. Expected cost relative to the closure benefit.
19. Whether the candidate remains worthwhile if all metric UNSAT results stay
    `UNSAT_DISCOVERY_ONLY`.
20. Whether current Rigid221 refactoring changes the candidate's declaration,
    hypotheses, or consumer.

Use the epistemic labels:

- `PROVEN`
- `EMPIRICALLY_VERIFIED`
- `CONJECTURED`
- `HEURISTIC`
- `UNKNOWN`

Do not upgrade empirical solver evidence into a mathematical claim.

## Complete T0 record requirements

For the recommended candidate, draft every field below. Use `UNKNOWN` or
`MISSING` instead of inventing content.

Mark the record:

`DRAFT_NONNORMATIVE_NOT_AUTHORIZED`

Include:

- proposed target ID;
- exact source/problem locator and digest;
- fully qualified Lean theorem or anchored residual;
- elaborated proposition;
- source/import revision;
- source-manifest digest, if available;
- target mode;
- proposition polarity;
- termination policy;
- exact evidence permitted to stop;
- exact evidence forbidden from stopping the run;
- finite-ingress statement;
- declared universe and cardinality scope;
- immediate Lean consumer;
- final published consumer;
- all hypotheses and quantifiers;
- constants and numerical bounds;
- conclusions that must reach the encoder;
- deliberate semantic deltas;
- required outcome for every representative or branch;
- theorem consequence of every outcome;
- source-to-cell bridge;
- finite-universe/exhaustiveness bridge;
- symmetry-preservation and canonical transport bridges;
- atom-entitlement bridge;
- exact witness-construction bridge, when applicable;
- certificate/Lean promotion bridge for negative branches;
- first omitted antecedent;
- ordered omitted-source-hypothesis inventory;
- ordered omitted-source-predicate inventory;
- omitted encoded-atom inventory;
- claim flags forced false by every omission;
- current coordinator-interface frontier;
- well-founded frontier measure;
- expected strict reduction;
- constructor fan-out before and after the proposed result;
- exact terminal witness theorem and authorized goal/status transition, if
  counterexample mode;
- active-plan authorization required;
- theorem-bank preflight record;
- independent verifier required;
- expected trust/axiom/native/compiler profile;
- T1a oracle requirements implied by this T0;
- hard-stop conditions;
- explicitly forbidden claims;
- unresolved coordinator decisions;
- proposed author, independent reviewer roles, and coordinator acceptance step.

There is not yet a normative machine schema for this record. Present it as a
proposed canonical JSON object plus a human-readable review table. Do not
pretend the schema already exists.

## Required bridge directions

For negative closure, explicitly instantiate:

source-permitted geometry under every T0 hypothesis
-> one declared raw cell
-> one covered canonical representative
-> every enabled encoded atom
-> checked branch contradiction
-> named Lean consumer.

For counterexample mode, explicitly instantiate:

exact replayed assignment
+ every retained source predicate
-> typed source-level geometry
-> exact witness theorem
-> authorized refutation/status transition.

A reverse implication does not substitute for the direction consumed by the
conclusion.

Separate these obligations:

- finite ingress;
- universe exhaustiveness;
- symmetry preservation;
- canonical transport;
- atom entitlement;
- exact replay;
- witness construction;
- certificate checking;
- final-consumer application.

## Claim discipline

Preserve these distinctions:

- a token census says nothing by itself about realizability;
- a canonical manifest does not prove ambient source coverage;
- symmetry validation does not prove preservation of every source predicate;
- PIQD receipts authenticate execution, not mathematical meaning;
- exact rational replay proves only retained encoded atoms;
- omitted source facts remain omitted;
- Z3/cvc5 metric UNSAT is `UNSAT_DISCOVERY_ONLY` without an independently
  checked proof path;
- timeout or unknown is inconclusive;
- complete declared-cell coverage does not prove that the cells exhaust source
  geometry;
- fixed-cardinality closure does not close an unbounded residual without a
  checked lift;
- diagnostic obstruction mining has no theorem-completion state.

## Required output

Produce the following sections:

1. `VERDICT`

   Choose exactly one:
   - `RECOMMEND_T0`
   - `RECOMMEND_DIAGNOSTIC_T0`
   - `DEFER_T0`
   - `BLOCKED_PENDING_COORDINATOR_CHOICE`

   Name one preferred target. Do not answer with several co-equal
   recommendations.

2. `CURRENT EVIDENCE SNAPSHOT`

   Include HEAD, source/import revision, relevant declarations, live consumers,
   and the status of existing CAP packet/runtime artifacts.

3. `OPTION MATRIX`

   Compare every candidate above. Include:
   - mode;
   - active-spine status;
   - consumer;
   - source-ingress status;
   - first omitted antecedent;
   - oracle prospect;
   - lift/promotion prospect;
   - expected frontier reduction;
   - cost/risk;
   - verdict.

4. `WHY THE WINNER WINS`

   Give the strongest argument for the winner and the strongest objection to
   it. Explain why the runner-up was not selected.

5. `DRAFT T0 JSON`

   Supply the complete `DRAFT_NONNORMATIVE_NOT_AUTHORIZED` object. No
   placeholders disguised as facts.

6. `BRANCH-OUTCOME LEDGER`

   Enumerate every branch, required result, allowed evidence, forbidden
   inference, and Lean consequence.

7. `DIRECTIONAL BRIDGE LEDGER`

   State every needed implication and classify it as:
   - existing and checked;
   - existing but insufficient;
   - proposed;
   - missing;
   - circular.

8. `OMISSION AND NON-CLAIM LEDGER`

   Identify every omitted antecedent, predicate, or atom and every claim flag
   that must therefore remain false.

9. `T1a CONSEQUENCES`

   Specify the independent positive, negative, weakened, differential,
   symmetry, and exact-rational controls needed to test this T0. State whether
   `FULL_TARGET_POSITIVE_CONTROL_UNAVAILABLE` applies.

10. `REVIEW AND AUTHORIZATION PLAN`

    State:
    - what an independent mathematical/source reviewer must verify;
    - what an encoding reviewer must verify;
    - what the coordinator alone must accept;
    - what must be machine-hashed and cross-bound;
    - what remains unauthorized after this report.

11. `FIRST BLOCKER AND MINIMAL NEXT ACTION`

    Name the first applicable status or hard-stop code, such as:
    - `BLOCKED_T0`
    - `T1_BLOCKED_NO_ORACLE`
    - `BLOCKED_T1_BINDING`
    - `BLOCKED_IMPLEMENTATION_INCOMPLETE`
    - `BLOCKED_AUTHORIZATION`
    - `PIVOT_REQUIRED`

    Then give the smallest concrete next action that could change that status.

12. `FINAL RECOMMENDATION`

    End with no more than ten lines:
    - selected target;
    - selected mode;
    - termination;
    - expected frontier reduction;
    - first omitted antecedent;
    - T1a feasibility;
    - review needed;
    - authorization needed;
    - go/no-go verdict.

## Hard constraints

- No source edits.
- No solver, PIQD, or daemon run.
- No live authorization.
- No fabricated hashes, declarations, source bridges, reviewers, or acceptance.
- No inference from SAT/UNSAT frequency alone.
- No fixed-cardinality result promoted to an unbounded theorem without a
  checked lift.
- No incidence-only result promoted to metric or Euclidean closure without the
  exact bridge.
- No `complete` verdict that conflates diagnostic coverage with theorem
  completion.
- If the exact elaborated proposition or immediate consumer cannot be
  established, return `BLOCKED_T0`.
```
