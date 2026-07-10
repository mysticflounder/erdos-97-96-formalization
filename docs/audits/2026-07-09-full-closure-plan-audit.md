<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Audit note: full Problem 97/96 closure plan (2026-07-09)

Audited document:

- `docs/closure-plan-full-spec-2026-07-09.md`

Companion produced by this audit:

- `docs/closure-matrix-2026-07-09.md`

Scope: complete correctness and specification audit against the current source
tree, proof-blueprint source index and last compiled kernel graph, census
artifacts, and the proof-facing supporting documents. The audit also required
the plan to be executable by a lower-level agent: exact input, deliverable,
consumer, dependency, ownership, and acceptance gate wherever the repository
contains enough information to state them.

## Independent verification performed

1. Ran `proof-blueprint index --refresh`, `status`, `spine --max-depth 12`, and
   `symbols --with-sorry`.
2. Read the current statements and local proof holes of all five on-spine
   declarations in `U1LargeCapRouteBTail.lean`,
   `RemovableVertexAxiom/Base.lean`,
   `RemovableVertexAxiom/Continuation.lean`, and
   `RemovableVertexAxiom/PinnedSurplusProducer.lean`.
3. Reconciled the source inventory mechanically: 87 textual proof holes inside
   exactly five declarations, with no off-spine sorried declaration.
4. Mapped the full liveData case tree: three 24-hole orbit families and seven
   terminal center branches.
5. Read the Census554 finite-space, motif-transfer, polynomial-checker,
   certificate-checker, generator, cover, frontier, and bank-writer surfaces;
   incorporated the independent Census554 audit at
   `docs/audits/2026-07-09-census-554-parallel-work-audit.md`.
6. Checked the card-11 cap-profile handoff and existing geometry lemmas needed
   for C1/C2/C4/one-hit: `MultiCenter/CapProfile.lean`,
   `SelectedFourClass`, `Dumitrescu.perpBisector_apex_bound`, and the packet
   one-hit theorems.
7. Read the card-12 gate state, raw logs, current 256-row bank, Candidate-D
   formulation and probe reports, and the prior closure ledger.
8. Checked the multi-center empirical state and the actual Lean boundary in
   `MultiCenter/GeneralN.lean`, `Realization.lean`, and the generated
   representative-surface certificate stack.
9. Re-ran the deterministic Census554 motif-cover suite: all relabeling,
   key-separation, AUTOS-containment, and returned-embedding gates passed.
10. Re-indexed after the parallel agent's final edits and queried
    `Problem97.Census554.motif_transfer_of_supportInjOn`: the new support
    bridge is compiled, sorry-free, and reports only core axioms.
11. Rechecked Markdown whitespace with `git diff --check`.

No Lean build was started by this full-plan audit. At the final recheck,
proof-blueprint reported 12,416 uncommitted Lean paths and a direct git
inventory found 24,170 changed Lean paths including 12,115 untracked
replacements. Other sessions own active spine branches. The source index is in
sync, but the current build fingerprint `5279f6474dd6` has 0/5787 mined
symbols fresh; the five-declaration source inventory is current while the
24/1672 and 28/1680 node counts come from cached mined build
`f241809581e3`. A publication check in this state would not be reproducible.

## Findings and repairs

### P1: The headline kernel state conflated the two publish targets

The plan reported only `28/1680` as a project-wide count. That is the P96
target. The last fully mined graph reports:

- P97: 24/1672 project nodes open;
- P96: 28/1680 project nodes open; and
- the same five source declarations on both spines.

The plan now records both counts, distinguishes the synthetic `sorryAx` kernel
marker from source obligations, gives current source locations, and records 87
textual holes.

### P1: The plan omitted an independent Front-A critical path

The ordering section treated Candidate D as the Front-A open mathematics, but
`u1_largeCap_routeB_tail_liveData_false` contains 79 additional holes. Closing
`DoubleApexOffSurplusSharedRadiusPair` only closes one dependency reached by a
subset of that case tree. It does not discharge the three 24-leaf families or
the seven terminal branches.

The plan and matrix now list liveData as an independent critical cluster and
give every family an exhaustive row and source-line inventory. The final
low-level pass also split LIVE-T1 correctly into six positive
`ht1Row_l1` holes and eighteen negative holes; dispatching one
polarity-uniform lemma would repeat the same overgeneralization error found in
the erased-pin branch.

### P1: The Census554 contradiction boundary was still under-specified

The earlier plan named `CubeOk`, dead patterns, and cover checking but did not
state the geometric realization object connecting them. A purely combinatorial
`CubeOk kappa` cannot imply `False`; combinatorially valid but geometrically
dead cubes are the objects being censused.

The repaired plan requires separate theorem surfaces:

- `coverCore_covers`, a combinatorial existence theorem for an embedded bank
  motif; and
- `not_realizesCube_of_coverCore`, which additionally consumes a geometric
  `RealizesCube` predicate and applies certificate deadness plus
  `motif_transfer`.

The geometry bridge is decomposed into a card-11 labeling, selected-four-class
cube, C1/C2, C4, one-hit, and final `CubeOk` proof. The final reusable consumer
is `false_of_cardEleven_twoLargeCaps`.

During the final recheck the parallel agent completed the previously open
support-only relabeling bridge as
`exists_injective_extension` and `motif_transfer_of_supportInjOn`. The plan
and matrix now mark that sub-obligation DONE and use the actual theorem rather
than retaining a proposed `completeSupportEmbedding` target.

### P1: The Census554 route replayed too much work before knowing the cover

The plan projected fleet-wide certificate replay and heavy-tail shrinking
before identifying which motifs a terminal cover actually consumes. That can
spend roughly 150 CPU-hours on light certificates and much more on the heavy
tail even if most rows are absent from a compact checked cover.

The repaired order freezes and checks the cover first, extracts the distinct
pattern IDs used by that witness, and generates/replays only that cover core.
Heavy-certificate work is required only for heavy patterns that survive core
extraction.

### P1: Front-B “producer” language was not executable

The previous B section grouped seven local holes under broad confinement
language. It did not state the exact existential or contradiction each hole
must produce.

The repaired plan and matrix split:

- endpoint left/right: an in-bank shadow plus `EndpointMetricShadow`;
- pinned right/left: `supportClass` satisfying
  `PinnedSurplusSupportClasses`;
- erased direct surplus-opposite/surplus-interior: two explicit `False`
  producers from already available U5 data; and
- erased non-surplus right/left: side-specific ordered-scaffold producers.

The plan also records that the current broad `hrightCandidate` and
`hleftCandidate` local assertions are false as general lemmas, so an agent is
not dispatched to prove an impossible statement.

### P1: Multi-center work was misclassified as a direct closure queue

The multi-center section itself said it does not feed Front B, yet it lived
inside Front B and the ordering section scheduled “T2 then T1” as bounded
closure work. The source shows that abstract LOCAL persistence is already
proved from `ProfileStepExtends`; what remains is concrete geometric surface
instantiation, geometric LOCAL-to-GLOBAL completion, and an actual consumer
into a current spine leaf. No such consumer is stated today.

The material now lives in a cross-cutting OFF-SPINE RESEARCH section. The
matrix forbids adding a `sorry` there until `MC-CONSUMER` has an exact statement
and a current spine consumer.

### P2: The card-12–14 head was overstated

The plan called the head “closable in principle by census extension.” Current
evidence does not support that as a route:

- only labeled profile (6,5,4) was run to depth;
- its `all` cut set includes a CONJECTURED exclusion;
- (5,6,4) and (5,5,5) were not run to depth;
- the measured run showed no convergence; and
- no covering mechanism is known.

The plan now labels Candidate C CONJECTURED and makes a head census an explicit
decision row with predeclared resource and nonconvergence stops. More dead
samples do not authorize a card-at-least-15 split; a checked cover does. The
final matrix enumerates all 3 labeled n=12, 6 labeled n=13, and 10 labeled
n=14 profiles, plus the geometric-necessity and consumer gates that the earlier
“analogous n=13/14” wording hid.

### P2: Candidate D lacked the probe’s actionable boundary

The old text stopped at obstructions D1–D3. The completed probe has sharper
facts: `m <= 2`, vertex-pair packets have `s = 0`, `s = 2` is straddle-only,
13/19 minimal-window types are realizable, and per-type kills do not compose.
The next finite gates are specifically `SUB2-H` and the Q3 two-center sweep.

These are now matrix rows marked OPEN-RESEARCH. Neither is represented as a
known proof route, and solver timeouts are not promoted to theorem status.

### P2: The plan had no reproducible publication precondition

The current source index is synchronized, but the kernel snapshot is not
reproducible from git while the generated tree is uncommitted. The prior plan
also omitted ownership and same-project build serialization from its dispatch
rules.

The plan and matrix now require ownership refresh, generated-tree
adjudication, one serialized full build, reference refresh, axiom audit,
zero-sorry checks, and finally `verify-publish` against the same HEAD.

### P2: Census outcome handling and permanence were not dispatch-complete

The first matrix draft treated the live run as if it would eventually produce
UNSAT. The current process instead stopped without a terminal marker near
iteration 1154, and the pipeline also admits ALIVE, zero-certified failure,
and bounded-stop outcomes. The supported scripts, bank, generator, and smoke
test are now tracked, but remain in provisional `scratch/`; the smoke test also
depends on ignored local cert payloads and does not pass from a clean checkout.

The final matrix adds a permanent `census/census_554/` migration, separate
driver and transaction locks, an independently checked terminal-artifact gate,
bank normalization, and an explicit outcome-decision row. Only the UNSAT
outcome unlocks cover freezing and replay.

### P2: Session-size estimates were unsupported

The blanket “1–3 focused sessions” estimate covered unknown cover size,
multi-hour generated Lean checks, 79 liveData holes, and open geometric
producers. It was not evidence-based. The estimate and the claim that every
bounded item is useful under every route have been removed. Dispatch is now
dependency-based and each row owns a measurable gate.

### P3: Several citations and locations were stale or ambiguous

Repairs include current lines for all five source declarations, the correct
`Cap/PartitionFromMEC.lean` path, explicit card-12 raw logs instead of an
incorrect STATE line citation for the no-convergence result, and clarification
that the leaf-1 export pair has one hole while leaf 2 separately has 79.

## Residual risks

### Mitigation checkpoint (2026-07-09 19:40 PDT)

Several engineering risks below have since been reduced: permanent
Census554 lease/transaction/terminal/audit modules and self-contained tests
exist; the proof-gated terminal path emits DRAT, core CNF, and LRAT; the first
bank-independent geometry theorem builds; and fixed-head 12--14 profile lists
have executable Python tests plus Lean arithmetic exhaustiveness theorems.
The active census process predates the lifetime-lease and terminal imports, so
those operational guarantees become authoritative only after restart or an
explicit re-publication pass.

1. **No complete theorem route exists for four open-math clusters:** the
   Front-A shared-radius tail, Front-A liveData families, endpoint/pinned
   confinement, and erased-pin P2/P4 confinement.
2. **Census554 has no terminal result and is active under pre-mitigation
   process state.** At 19:40 PDT file evidence reached iteration 1240 with
   5,444 raw bank rows. Even a solver UNSAT is not downstream evidence until
   the new proof-gated publisher and frozen-cover checks pass.
3. **The generated-certificate worktree is highly volatile.** Matrix line
   numbers and ownership must be refreshed before dispatch, although theorem
   names and hole-family identities are stable.
4. **Census554 migration and frozen replay remain incomplete.** The permanent
   package now contains the frontier-driver lease, atomic recoverable
   transaction, proof-checked completion publisher, structural auditor, and
   self-contained fixtures. Runtime driver/miner/verifier/generator, changing
   bank, and bulk certs have not moved; the current process has not loaded the
   new lease/terminal code; exact frozen-bank replay has not run.
5. **The closure matrix is as agent-complete as the known mechanisms allow.**
   OPEN-RESEARCH rows deliberately name exact outputs and falsified shortcuts,
   but they cannot prescribe a proof mechanism that the project does not yet
   have.

## Verdict

Before repair, the closure plan was not safe to dispatch wholesale: it
under-counted the card-11 bridge, omitted the independent liveData critical
path, mixed off-spine research into direct closure work, and left Front-B
producers too vague for implementation.

After repair, the plan is accurate at the audited snapshot and the closure
matrix is a complete dispatch register for the current five source obligations,
their 87 textual holes, conditional census outcomes, finite-route prerequisites,
optional research gates, and final publication checks. This does not mean the
theorem has a known complete route; the remaining open-mathematics clusters are
now stated without hiding that fact.
