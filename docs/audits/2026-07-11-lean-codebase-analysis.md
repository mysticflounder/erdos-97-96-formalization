<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Lean codebase analysis (2026-07-11)

Whole-project review of `lean/`: proof-state snapshot, per-obligation closure
assessment, subagent-swarm feasibility, and suboptimal-pattern /
restructuring findings. Evidence: `proof-blueprint` (status/spine/symbols,
index in sync at audit time), direct source reads, and two read-only survey
agents whose load-bearing claims were spot-verified (verification notes
inline). Companion dispatch truth remains
[`closure-matrix-2026-07-09.md`](../closure-matrix-2026-07-09.md) and
[`closure-plan-full-spec-2026-07-09.md`](../closure-plan-full-spec-2026-07-09.md);
where this audit and the live spine disagree, the spine wins.

## 1. Proof-state snapshot

- 1,302 Lean files, ~900,900 lines; ~81% machine-generated certificate banks
  (1,059 files / ~727k lines), ~19% hand-written (241 files / ~174k lines).
- `proof-blueprint status`: index in sync with source; 14,295 symbols;
  0 custom axioms; **5 declarations with `sorry`** (87 textual holes);
  P97 spine 23/1877 open, P96 spine 27/1885 open — both funnel through the
  same five obligations.
- 22 uncommitted Lean files on `four-point-subpacket-reduction` at audit time
  (mined state not reproducible from git until committed — CTRL-GIT).

| Obligation | File:line (holes) | Matrix rating | Anchor owner (date) |
|---|---|---|---|
| `isM44EndpointResidualsExcluded` | `RemovableVertexAxiom/Base.lean:10097,:10119` (2) | OPEN-PROOF (K-B-END) | unowned |
| `isM44NonSurplusContainmentErasedPinTripleResidualsExcluded` | `Continuation.lean:183,:211,:312,:337` (4) | OPEN-PROOF (K-B-ERASE) | 019f300c (2026-07-09) |
| `isM44PinnedSurplusGeneralMResidualsExcluded` | `PinnedSurplusGeneralM.lean:704` (1) | OPEN-RESEARCH (K-B-PIN) | 019f401b (2026-07-10) |
| `U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair` | `U1LargeCapRouteBTail.lean:2702` (1) | OPEN-RESEARCH (K-A-PAIR) | census lane (A11-RUN live) |
| `u1_largeCap_routeB_tail_liveData_false` | `U1LargeCapRouteBTail.lean:3792–5887` (79) | OPEN-RESEARCH (K-A-LIVE) | f1cc942b (2026-07-06) |

## 2. Closure assessment per obligation

**K-B-END is the only obligation that is both fully routed and unowned.**
Plan §B.1 specifies it to signature level: create
`EndpointCertificate/GeometryProducer.lean` with two mirror theorems
producing

```text
∃ shadow,
  endpointShadowInBank xLabel shadow = true ∧
  EndpointMetricShadow pointOf shadow
```

reusing `endpointLeft_residual_exists_endpointShadowInBank_of_mask_interfaces`
(+ right mirror) and the `pointPairClassCount_le_two_of_sameRadius` family;
bank transport must not be rebuilt; the producer must not import `Base.lean`
or any consumer of the obligation. Verified 2026-07-11: the module does not
exist; its named inputs do (`GeometryCoverage.lean`,
`ResidualSoundness.lean`). Open content is real geometry (selection and
confinement of the non-`.v/.w` center classes), not wiring.

**K-B-ERASE**: two of its four holes (`Continuation.lean:312,:337`) assert
`OneSidedSeedCandidateRemainder` local goals that are **FALSE as stated**
(plan §B.3, Boolean counterexample); the prescribed fix is a consumer
refactor onto `ErasedPin{Right,Left}FiniteCandidateOrderedScaffoldFacts`,
not a proof attempt. The other two holes (:183, :211) need a genuine `False`
producer (row-confined classes + Mode A, or a direct surplus-index
contradiction). Owned by anchor 019f300c.

**K-B-PIN / K-A-PAIR / K-A-LIVE**: OPEN-RESEARCH. The missing content is one
shared shape — a metric core, strict cyclic-rank descent, or rowwise
confinement that the current incidence interface provably does not force
(2026-07-10 probe audit). The 79 K-A-LIVE holes are case leaves of one
enumeration; filling them one at a time is not a viable route because every
leaf needs the same missing contradiction. The census-554 A11 route is the
active attack on the Card-11 side.

## 3. Subagent-swarm feasibility

Assessment: a wide swarm of generic sorry-fillers is not productive here.

- 82 of 87 holes are OPEN-RESEARCH content (no known mechanism); 2 more are
  false as stated and must not be attempted.
- Three of four sorry-bearing files are anchored to other sessions
  (CTRL-OWN: one owner per file; anchors are 1–5 days old — staleness is an
  Adam decision, not an agent decision). {{NEEDS_ADAM_INPUT}}
- Builds must be serialized (CTRL-GRAPH); the ~96 GB build tree makes
  worktree-per-agent isolation impractical, so swarm throughput collapses to
  one build lane.

Productive subagent uses:

1. One focused lane on K-B-END (draft producer module → prove side
   conditions → spine-diff verify). The only swarm-shaped work that shrinks
   the spine and is free to take.
2. The ERASE P2 consumer refactor — well-scoped engineering, but requires
   resolving anchor 019f300c first.
3. Research fan-out (math-professor/math-prover) on the OPEN-RESEARCH shape
   ("does (≥5,≥5,4) + center-K4 + critical shell force the double-apex
   pair?") — output is analysis and candidate lemma statements, not closed
   sorries.

## 4. Suboptimal patterns and restructuring findings

Ordered by leverage. None of these shrinks a spine sorry; under spine
discipline they are justified only where they de-risk imminent closure work
(P1, P5) or land in generator scripts. Line-diff counts below were produced
by a survey agent via direct reads/diffs and spot-checked; unmarked counts
were not independently re-derived. {{NEEDS_PROOF}} applies to exact counts
only, not to the existence of each pattern (verified).

### P1 — `u1_largeCap_routeB_tail_liveData_false` (restructure before filling)

2,368-line theorem (`U1LargeCapRouteBTail.lean:3525–5893`); the `hcenter_p`
branch is ~2,194 lines at 16 nesting levels; five sibling branches
(:5876–5887) are bare sorries that would each replicate it (~6×
duplication if filled as-is). A 7–15-line "`lN ∈ {t1,t2,t3}`, eliminate
collisions" block is repeated ~72× to hand-enumerate bijections
{l2,l3,l4}→{t1,t2,t3} (representative :3745–3809). Fix: one permutation
lemma (3-element Finset equality + pairwise-ne ⇒ the 6 ordered assignments)
plus extraction of each center branch into a named helper. Also
`capProfile_eq_554_of_card_eq_eleven` / `capInteriorProfile_eq_332_...`
(:2158–2413): 9 `fin_cases` branches identical modulo cap permutation.
File is anchored (f1cc942b) — a note for that lane's owner.

### P2 — Systemic left/right mirror duplication; `Side` parameter exists but is dead

~40 mirrored lemma pairs: `SurplusCOMPGBankGeometry.lean` payload family
(:13056–13249 vs :14194–14387 — 20/194 lines differ after Right→Left swap),
`RemovableVertexAxiom/Base.lean` (82 Left- vs 82 Right-named declarations,
duplicated interface layer :1001–1264), `PinnedSurplusGeneralM.lean`
(:476–627). `ErasedPinCountRows.lean:18` already defines the needed `Side`
type and is imported by nothing. Side-indexing is worth ~3–4k lines in
COMPG alone. Caveat: the `Base.lean` hull-order pair (:167–654) is not a
textual mirror (interval vs reverse-interval lemmas); it needs a small
oriented-interval abstraction.

### P3 — Three coupled row families (~9k lines → ~1.5–2k)

The same 28 count rows drive `false_of_SIDE_rowNNNN_finiteCandidateFacts`
(`Base.lean:2771–5450`, 20/101 lines differ between rows),
`SIDE_rowNNNN_exists_erasedPinRowSeed_privateMask`
(`SurplusCOMPGBankGeometry.lean:6057–9506`), and
`IsM44.SIDE_rowNNNN_selectedClass_eq_*` (`SurplusM44Packet.lean:7924–9950`;
24 instances share a ~45-line prologue). A Side×Row combinator taking the
row's seed-existence and pointClasses facts as hypotheses reduces each
instance to ~10 lines.

### P4–P6 — Localized cleanups (~600 lines combined)

- `SurplusM44Packet.lean:4057–4241`: 45 pairwise inequalities enumerated by
  hand where 3 group facts + `List.pairwise_append` suffice (~30 lines).
- `Continuation.lean:107–546`: the obligation is one ~400-line inline
  `have hfiniteResidualRows`; extracting it as a standalone theorem gives
  the four holes addressable names (interacts with the ERASE consumer
  refactor — coordinate with anchor 019f300c).
- `simp only [Finset.mem_insert, Finset.mem_singleton]` verbatim 130+×
  across core files → local simp set per section.
- `EqualityCore.lean`: two 9–10× repeated micro-patterns
  (injectivity-lift, `EdgeClosure.sound` in `dist` form) → two one-line
  helpers. File otherwise clean.

### P7 — Monolith files have clean shard seams

`SurplusCOMPGBankGeometry.lean` (16,385), `SurplusM44Packet.lean` (12,309),
`Base.lean` (10,123) each have one namespace, zero sections. Seams (Base):
Statement abbrevs :51–999 / payload interfaces :1001–2136 / centerClass +
mask lemmas :2137–2770 / 28-row family :2771–5450 / erased-pin scaffolds
:5752–6350 / hull-order + rest. `lean-shard` tooling fits. COMPG's
Label/mask bit algebra (~:90–560) is geometry-independent and could be its
own module.

### P8 — Generated partition and orphans

- 136 `RowZeros` files are one proof template modulo cert-id/pid; ~130 EpQ
  coordinators re-emit identical `native_decide` tails. Any collapse
  belongs in the generator scripts, weighed against the 30-min/16 GB
  per-worker elaboration caps that motivated sharding.
- `All.lean` umbrellas are the main build amplifiers (one import pulls a
  whole `native_decide` family; 758 files use `native_decide`).
- Orphan sweep: most unimported modules are deliberately staged
  (`Census554/Bank/*` = A11-GEN replay modules awaiting a real UNSAT core;
  unimported `Census554/{FourRowPerpBisector,SeparationBridge,…}` = live
  census work, untracked at audit time). Genuinely unreferenced:
  `P97/K4WindowBank.lean` and
  `MultiCenter/Certificate/ProfileClassCompletion.lean` — adjudicate
  (wire in or delete). {{NEEDS_ADAM_INPUT}}
- No dead private lemmas found in the hand-written core files.

### P9 — Doc drift

`Erdos9796Proof.lean:10` claims the build checks "down to the single
remaining `sorry` (`Problem97.RemovableVertexOfLarge`)" — there are five
sorried declarations and that symbol is not one of them.

## 5. Action order (one lane at a time)

1. **K-B-END lane**: create `EndpointCertificate/GeometryProducer.lean` per
   plan §B.1; acceptance = both `Base.lean` holes gone and the obligation
   leaves the `proof-blueprint spine` open list.
2. **P9**: fix the root-module comment (one line).
3. **ERASE P2 consumer refactor** (`Continuation.lean:312,:337` route) —
   blocked on anchor 019f300c staleness. {{NEEDS_ADAM_INPUT}}
4. **P1 restructure** of the liveData theorem — blocked on anchor f1cc942b
   staleness. {{NEEDS_ADAM_INPUT}}
5. **P2+P3 Side×Row refactor checkpoint** — batch after the anchored lanes
   settle; use `lean-shard` for P7 seams in the same pass.
6. **P4–P6 localized cleanups** — opportunistic, alongside whichever file is
   already open for on-spine work.
7. **P8 orphan adjudication + generator-side template collapse** — requires
   the elaboration-cap measurements from A11-CERT-BENCH before changing
   shard granularity.
