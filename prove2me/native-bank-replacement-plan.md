# Plan: replace native certificate banks with general theorems

Date: 2026-09-05. Planning baseline: `fff7305bb6f10ddfc5a9446fe7392541da47d87b`.
Status: package 1 is implemented and undergoing live validation; packages 2–5
remain planned. See the [package-1 audit](../docs/audits/2026-09-05-native-outside-counting.md).

## Objective and boundaries

Replace computational proof steps on the P97/P96 dependency paths with reusable
mathematical arguments, preserving the current theorem statements and hypotheses.
Prioritize replacements that retire whole certificate families. The first small
delivery removes two native cardinality checks using an existing general theorem.

This is a trust-removal and theorem-reuse plan, not a claim to solve either Erdős
problem. Open geometric obligations remain open until separately proved. Changing
`native_decide` to another evaluator, adding a wrapper around a bank, or repeating
checker soundness does not count as the requested mathematical generalization.

Inputs:

- [Native-bank audit](native-bank-audit.md), including exact candidate statements.
- [Independent claim review](native-bank-audit-review.md).
- [Full tracked-source inventory](native-bank-inventory.json) and
  [reproducible scanner](audit_native_banks.py).
- [Existing theorem-bank registry](../docs/general-n-certificate-bank-mining-2026-07-09.md).
- [Active exact-five closure plan](../docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md)
  and the live plans governing any other touched residual.

The inventory found 5,035 native token sites in the main first-party Lean tree.
That is a source census, not a count of reachable proof obligations. Historical
and scratch totals remain separate. This plan does not require rewriting every
archived experiment or changing the repository's approved native-trust policy.

Keep the source repository on its existing Lean/Mathlib pins during mathematical
replacement work. Port completed results separately to the mission's pinned
environment. Prove2Me's documented upload workflow requires core-only axioms;
actual server acceptance of native proofs was not tested. This plan pursues the
stronger proof form regardless, without presenting an untested server restriction
as established behavior.

## Ordered work packages

| Order | Package | Deliverable | Completion condition |
| --- | --- | --- | --- |
| 0 | Establish current dependencies | Per-target native-dependency ledger and owned lanes | Current source/build identities, consumers, and trust boundaries recorded |
| 1 | Replace outside-slice counting | Shared finite-set proof and exact-15/16 adapters | Both named cardinality declarations have core-only proof dependencies; consumers still build |
| 2 | Geometric core coverage | Source-derived adapters to five-point and Kalmanson contradictions | Every retired case has proved antecedents and exhaustive dispatch |
| 3 | Card-eleven terminal reduction | Direct argument for one selected terminal | That terminal's replay subtree leaves its dependency closure |
| 4 | Polynomial family reduction | A symbolic identity family or geometric contradiction | Concrete native identity premises disappear from a named consumer |
| 5 | Integrate and transfer | Audited proof packages linked to the existing private mission | Exact transferred statements and proofs accepted by the server |

Packages 2, 3, and 4 can run as independent bounded research lanes after package 0.
Package 1 is the first implementation delivery. Finish and assess one family-level
pilot in each research lane before expanding it.

### 0. Establish a fresh baseline

1. Read the current repository instructions, closure plans, source imports, and
   bank manifests. Recheck all candidates against current source; the audit's
   cached call graph predates some working-tree changes.
2. Trace both `Problem97.erdos97_rhs` and `Problem96.erdos96_rhs`. P97 is the only
   configured blueprint publish target; check P96 explicitly. Also trace the
   counting, nine-point exclusion, and conditional P97-to-P96 milestone roots:
   some useful results may already be transferable without these banks.
3. For each selected bank, record its actual native proof leaves, immediate
   consumer, exported consumer, source hash, toolchain, and current axiom closure.
   Include generated certificate boundaries omitted from blueprint's detailed
   mining; an absent mined edge is not proof of independence.
4. Classify each candidate as geometric exclusion, combinatorial classification,
   polynomial identity, replay check, or data/encoding agreement. Distinguish
   current consumers from archived and unimported material.
5. Register exact ownership and retained artifacts before edits. Generated work
   belongs under `scratch/runs/<lane-id>/<run-id>/`, with the required checkpoint
   and run manifest. The coordinator alone owns shared lane records and aggregate
   imports; a worker must not rewrite another lane's checkpoint.

**Exit:** a reviewed ledger for the selected pilots. Do not rebuild the entire
repository merely to count source tokens. Use the smallest builds/probes needed
to establish the selected consumer's current state.

### 1. Replace the exact-15 and exact-16 cardinality computations

Targets:

- `Problem97.BlockerVExactFifteenFourRowCoverage.outsideHits_card_eq_two`.
- `Problem97.BlockerVExactSixteenFourRowCoverage.outsideHits_card_eq_two`.

Reuse `Problem97.ATailBlockerVExactSeventeenSourceNormalForm.outsideSlice_card_eq_two`
from [the exact-17 module](../lean/Erdos9796Proof/P97/ATail/BlockerVExactSeventeenSourceNormalForm.lean).
Its finite-set argument proves: a four-point support with two distinct known cap
members and at most two cap members has two points outside the cap.

1. Verify that declaration's body and trust closure. Inspect import direction.
   Extract the existing argument to a small shared combinatorics module if needed
   to avoid importing a large exact-17 source model or introducing a cycle.
2. Preserve the existing exact-15/16 public signatures and docstrings. Translate
   the Boolean filtered universe to a support finset, and `longLabelBool` to a cap
   finset. Convert the Boolean conjunction bound to an intersection-cardinality
   bound.
3. Prove the two fixed hits are distinct and in that intersection for each row.
4. Prove `outsideLabel` injective and that the image of `outsideHits` is exactly
   the support minus the cap. Use image-cardinality transport to finish.
5. Replace the two native proof bodies. Keep the existing
   `outsidePairOfMembership` and geometric consumers connected. Tiny fixed label
   tables may use kernel-checked finite cases; do not enumerate all row predicates.
6. Build the two modules and the actual affected consumer in
   `ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`. Audit the changed
   declarations' axioms and inspect the consumer graph.

**Exit:** both computations are replaced by the shared counting argument plus
label adapters. The separate exact-15 `exists_metricMotif_of_pairwiseSeparated`
and exact-16 `metricObstructionOccurs_of_pairwiseSeparated` classifiers remain
explicit native dependencies. Do not report the whole banks
or the P97 root as native-free.

### 2. Replace finite geometric cases by structural coverage

Start with these existing source theorems:

- `Census554.FivePointCircleIsoscelesOrderBridge.false_of_two_selected_rows_of_ccw`:
  five ordered vertices W < F < P < X < Z, a W-centred selected row containing
  F,X,Z, and a Z-centred selected row containing P,X cannot coexist.
- The cardinality-independent contradictions in
  `ATail/KalmansonThreeEqualitySchemas.lean` and
  `ATail/KalmansonFourEqualitySchemas.lean`.

1. Select one native classifier or finite case family and its immediate consumer.
   Search the existing indexed Lean corpus once for that concrete hypothesis set.
2. Extract its actual admissibility conditions, including distinctness, radius
   class membership, convexity, cyclic order, and orientation. Preserve them in
   the candidate statement.
3. Match cases to the existing geometric cores. Retain a coverage table containing
   proved matches, unmatched cases, and the first missing antecedent for each.
   Historical coverage of 230 cores is a search lead, not current coverage proof.
4. Prove the order/membership adapters from the source geometry. For the exact-15/16
   classifiers, investigate a combinatorial proof that cyclic separation of the
   four outside pairs forces one of the existing metric motifs.
5. Check proposed generalizations against the existing finite cases and known
   countermodels before investing in a large formalization. A finite successful
   test is supporting evidence only; a counterexample identifies a needed
   hypothesis or ends that candidate.
6. Prove exhaustive coverage for each retired family, or retain a precise residual
   classifier for uncovered cases. Wire the new proof into the original consumer.

**Exit:** at least one finite subfamily is replaced at a real consumer by proved
geometric adapters and exhaustive coverage. An unordered equality match or an
off-spine helper does not satisfy this gate.

**Stop/revise:** if coverage requires an unproved source producer, or a proposed
weaker statement has a counterexample, record the obstruction. Do not move the
same difficulty into a new `sorry` or enlarge the finite search without a new
mathematical constraint.

### 3. Attack one card-eleven terminal

Consumer:
`ATailCardElevenUniqueFourCertificate.false_of_firstApexUniqueRadiusExactFourResidual`.
The coordinator's terminals are direct/reflected P4 exact-two, P5 exact-two, and
aligned-P5. Keep the exact-four, unique-radius, minimality, no-M44, obstruction,
and interior/bisector hypotheses explicit.

1. Choose one terminal by the size of its mathematical interface and availability
   of a small contradictory clause core, not by generated file count alone.
2. Map the selected clauses back to radius partitions, cyclic separation, mutual
   transport, and Kalmanson/other geometric statements. Separate these from ledger
   membership, index bounds, and checkpoint encoding.
3. Attempt a direct contradiction from a smaller set of source-owned hypotheses.
   Any solver-derived core must retain a checked mapping to the Lean statements.
4. Prove that contradiction and replace the selected terminal's certificate call.
   Verify that its replay subtree is no longer reachable from that consumer.

**Exit:** one terminal loses its native replay dependency without stronger
assumptions or new proof holes. General RUP checker soundness already exists and
does not count as progress here. Ledger construction improvements may be useful,
but record them as proof engineering rather than new geometry.

### 4. Find shared polynomial identities or geometric contradictions

Scope: `EndpointCertificate/Patterns`, `SurplusCertificate/RelaxedSplit`, and
`SurplusCertificate/RowZeros`, starting with a small representative family.

1. Group payloads by generator structure, coordinate symmetries, and shared
   coefficient/factor patterns. Keep rule/mask alignment separate from the
   polynomial identity itself.
2. State a candidate symbolic identity with explicit parameters and assumptions.
   Prove its coefficient-generation invariant or derive a geometric contradiction
   that makes those payloads unnecessary.
3. Supply the actual geometric zero and mask hypotheses at the existing consumer.
   Existing evaluation-zero and checker-soundness lemmas can support the proof,
   but their concrete success premises must also be discharged without native
   evaluation.
4. Pilot the result on every case in the selected family, retaining exceptions
   explicitly. Only expand after the family-level argument compiles and audits.

**Exit:** the selected family's native identity/alignment premises disappear from
a named consumer. A theorem of the form “if the checker succeeds, then False” is
already available and is not a replacement.

**Stop/revise:** if no useful parameterized invariant emerges, record which
coefficient or mask facts remain instance-specific. Kernel-checkable certificate
replay can be assessed separately as a fallback; keep it distinct from this
plan's mathematical extraction work.

### 5. Integrate, audit, and transfer incrementally

For each completed replacement:

1. Build the smallest changed targets using the governed `lake-build` workflow,
   followed by the actual aggregate consumer. Avoid edits to a running build's
   source graph. Use isolated single-file probes only under the permitted audit
   exceptions.
2. Check exact statement fidelity, imports, and transitive axioms. For transferable
   proved results require only `propext`, `Classical.choice`, and `Quot.sound`;
   no `sorryAx`, native-computation axioms, or hidden external assumptions.
3. Refresh source/kernel evidence and inspect both relevant export roots. Preserve
   known open obligations; run the full publication gate only when appropriate,
   without interpreting existing open roots as closed.
4. If an edited module belongs to a frozen bank source manifest, re-mine and
   refreeze the affected chain and require its verify walk to pass. Regenerate
   applicable Lean-ingress binding records when their authenticated bytes change.
5. Obtain an independent review of mathematical fidelity, consumer reachability,
   build evidence, and trust. Update the affected live closure records, then stage
   exact owned paths, pass the hygiene gate, commit, and push.
6. Port the finished dependency slice in the separate Prove2Me environment. Check
   its current pin, preserve statements, and obtain fresh read-backs where the
   contribution workflow requires them. Submit actual proofs to the existing
   private mission `1061a384-cdea-43b4-adb5-273627ea45a0`; verify server receipts.
   Update transfer notices only for accepted results. Do not create a duplicate
   mission or change its visibility as part of this work.

## Progress accounting and handoff

Keep a ledger per replacement: exact declaration, assumptions, source hash,
original native leaves, replacement theorem, immediate/exported consumer,
remaining obligations, build/axiom evidence, independent review, and transfer
receipt if applicable.

Measure trust-removal progress by native proof sites actually eliminated from
the selected compiled dependency slice and by certificate subtrees retired.
Track source token totals only as diagnostics. Removing two sites may leave the
same two native axiom names at the root because other sites still use them.
Report this as a local trust improvement, not headline proof closure.

If a lane changes a mathematical obligation, use the active closure plan's
well-founded measure and show strict reduction at its named residual, with
exhaustive dispatch. Do not create orphan lemmas or uncovered `sorry` obligations.

At each family-level pilot, decide whether to expand, refine one missing
antecedent, or stop that candidate. Assign disjoint source paths to parallel
workers; keep a separate reviewer and one owner for shared imports/manifests.
No reliable end-to-end duration is known: package 1 is bounded implementation,
while packages 2–4 contain open mathematical work.
