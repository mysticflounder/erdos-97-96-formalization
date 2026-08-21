# Repository audit against the 2026-08-20 `dead-ends.md` rewrite

**Date:** 2026-08-20
**Audited document:** `docs/dead-ends.md` at commit `0cec41a9` ("GPT 5.6 pro update 8/20/26", +1082/-699)
**Repository HEAD at audit:** `0bd48364`
**Document's own declared baseline:** `97efba03` (2026-08-19)
**Method:** four parallel read-only lanes (Lean source verification, artifact and
path verification, baseline drift, active-doc contradiction sweep) plus a direct
re-derivation of every inline mathematical argument. No build, solver, or
`#print axioms` run was performed except a fresh `proof-blueprint spine`.

## 1. Verdict

The rewritten registry is in good shape. Its inline mathematics is correct, its
filesystem and artifact claims hold, and nothing committed since its declared
baseline invalidates any entry. **One entry understates its own evidence**
(§7.1). The audit's more consequential output is a set of defects it exposed
**in the repository**, not in the document: two active audit documents assert
conclusions that the registry's own evidence rules bar.

Counts: 20/20 artifact and command claims confirmed; 19 of ~24 checkable Lean
claims confirmed exact with 1 mismatch and 6 correctly-hedged absences; 0 drift
findings against the baseline; 10 contradictions found in active docs, 2 of them
high severity.

## 2. Inline mathematics — all correct

Every argument the document supports with `VERIFIED_INLINE` or `PROSE_CHECKED`
was re-derived.

| Section | Claim | Result |
|---|---|---|
| §2.2 | Perturbed-dodecagon witness; altered turn determinants reduce to `9/10 − √3/2` and `(19 − 9√3)/20` | Exact. Both re-derived symbolically; both positive. Unchanged determinant `1 − √3/2 > 0` also checked. `dist x O = 9/10 < 1`. |
| §2.2 | MEC first-moment bound `(1/3)Σ‖vᵢ−c‖² = 1 + ‖c‖² ≥ 1` | Correct; uses `v1+v2+v3 = 0` and unit norms. |
| §3.9 | `\|A\| ≤ 4\|N\|`, so `\|A\| = 11` gives only `\|N\| ≥ 3` | Correct. |
| §4.2, §7.1 | Quadratic-module evaluation: a checked `z` with all generators nonnegative and `G(z) < 0` rules out that module at every degree | Correct. |
| §6.1 | Collinear Ptolemy example: `\|0−2\|\|1−3\| = 2·2 = 4 = 1·1 + 1·3` | Correct. |
| §8.5 | NEW-3 defect: `{(x,y) : x>0, y=0}` is positive-dimensional and lies in the equality locus `y=0` | Correct; refutes the positive-dimensional-stratum inference. |

The document's evidence discipline also holds internally. Its only `FALSE_EXACT`
(§8.1) rests on the §2.2 witness. Both `CERTIFICATE_CLASS_IMPOSSIBLE` entries
(§4.2, §7.1) are stated conditionally, with the general implication marked
`VERIFIED_INLINE` and the concrete historical instance downgraded to
`REPORTED_RESULT_UNVERIFIED` — consistent with §1.2 and with §11.2's list of
claims retained only as regression leads.

## 3. Findings against `dead-ends.md`

### 3.1 §7.1 evidence tier is stale — `qEqE_oneCosine_crux`

`docs/dead-ends.md:970-973` records `qEqE_oneCosine_crux` as `HISTORICAL_ONLY`
with assessment `REPORTED_RESULT_UNVERIFIED`, on the stated ground that "this
pass did not independently locate or axiom-audit it."

The declaration is at `lean/Erdos9796Proof/P97/N9Endpoint/N4e.lean:1847`, is
fully stated and proved, sits in a file with zero real `sorry` occurrences, and
is consumed at `N4e.lean:1893` and `N4e.lean:1917`. A signs-only variant
`qEqE_oneCosine_crux_of_signs` is at `N4e.lean:1767`.

The route-level conclusion is unaffected: the downstream row producer is still
blocked on the separate `hAElt` refutation, which §7.3 documents correctly and
which `N4e.lean:6511-6519` independently confirms as "REFUTED... DEAD LEMMA".

**Recommended action:** upgrade the §7.1 crux sub-entry from `HISTORICAL_ONLY` to
`LEAN_DECLARATION_PRESENT`, keeping the route assessment unchanged. The same
cheap upgrade is available for several other §3.1 names that are trivially
locatable in current source.

### 3.2 No other mismatch

Six declarations named in the document are absent from `lean/`
(`c5d1c0_angle_v2_obtuse`, `c5c4a2_qstar_on_O_side`, `c5c4b3_angle_v2_obtuse`,
`c5c3c_angle_v2_obtuse`, `exactClassA`, and `D14` as an identifier). In every
case the document already labels the entry historical or unlocated, so the
absence corroborates its hedging rather than contradicting it.

All five claimed-absent `p97-rvol` scratch directories (`scratch/u13_equidist/`,
`scratch/u13_buildB/`, `scratch/u13_global/`, `scratch/u13_combo/`,
`scripts/u1k3-metric-certs/`) are genuinely absent from the working tree, from
`git log --all`, and from all six worktrees under
`scratch/rigid221-sourceheavy-anchor/`. They were never copied into this
repository, so none is cheaply restorable to upgrade its entry.

Load-bearing source claims were confirmed exact: `OnArcOpposite`
(`Foundation.lean:83-84`) is the signed-area product §2.2 quotes;
`capInteriorByIndex` (`Cap/PartitionFromMEC.lean:496-501`) is the two-endpoint
erasure with no radial content; `u2FullDistanceClasses_of_capContainment`
(`U2SqueezePort.lean:511`) takes the containment premise as an explicit
hypothesis and does not derive it, exactly as §3.1 states;
`N8a3AdjacentCapDistanceStrict` and both exports
`n8a3_of_capCoordChain`/`n8a3_of_capCoordChainRev`
(`U2/OneHitMonotone.lean:161-169`, `:288-296`) are proved with the
vocabulary-bridge gap named in the module docstring, matching §3.3 and §4.4.

### 3.3 No baseline drift

Twenty commits separate `97efba03` from `0bd48364`, touching 89 files
(+17659/-922), dominated by new `BlockerVExactSeventeen*` modules and
FreshThird/U3 CEGAR work. Keyword scans of `dead-ends.md` for every route name
those commits touch — `FreshThird`, `Rigid221`, `exact17`, `exact12`, `Child46`,
`cocircular`, `pentagon`, `LeanSatIr` — return zero hits. The registry covers the
older U-series / N4d / c5d / b1a1M generation; current work sits in a later
namespace it does not discuss. No entry is invalidated.

## 4. Findings against the repository

### 4.1 HIGH — a closed-leaf claim contradicted by live source

`docs/audits/2026-08-17-spine-leverage-analysis-and-roadmap.md:34` states:

> `false_of_crossBlockerCoincidence`: **CLOSED** (verified via `proof-blueprint`)

Ground truth:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean:136`
  is a literal `sorry`, in both the working tree and the committed HEAD version.
- A fresh `proof-blueprint spine` lists
  `Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal.false_of_crossBlockerCoincidence  [sorry]`
  among its 37 open obligations. The tool cited as verification reports the
  opposite of the claim.
- The sibling audit
  `docs/audits/2026-08-17-false-of-cross-blocker-coincidence-audit.md:12-16`
  describes an attempted `by` proof and states it "still does not have confirmed
  kernel closure in this checkout", reporting deterministic heartbeat and
  `isDefEq` timeouts. That attempt is not what is in the tree now.

This matters beyond bookkeeping: the roadmap's whole execution sequence
(`:88`) is built on this leaf being closed. The same document is also internally
inconsistent about its own totals — `:6` says 34 effective, `:21-24` sum to 34,
`:49-52` sum to 31, and the live spine says 36.

This is precisely the failure mode `dead-ends.md:285` warns about: `proof-blueprint
spine` "reports reachability and open obligations; it is not a substitute for
`#print axioms` on an individual theorem", and `dead-ends.md:288` adds that a
recorded status "never substitutes for a current import-graph or axiom check."

### 4.1a Follow-up — the "closed" proof recovered, and why it does not work

Added 2026-08-20 after tracing the history behind §4.1.

**Provenance.** The four-branch proof was never committed. It survives only as an
unreferenced git blob, now pinned against garbage collection at

```bash
git cat-file blob refs/recovered/crossblocker-proof-20260817 > /tmp/recovered.lean
```

That blob is the whole 3020-line module; the theorem body is 2917 lines over four
cases (`H.centerAt P.source₁ = Pρ.source₁`, `= Pρ.source₂`, and the two mirrored
`Pρ` cases), with zero `sorry`. `git log -L` over the theorem shows the committed
text has been `sorry` since the module was created in `9feb86f6`, so no
intermediate closed state ever entered history. No stash holds it. The other
dangling blobs carrying this file are all earlier `sorry` versions, and the four
untracked `lean/**/TestCross*.lean` and `lean/test_cross.lean` probes are
`aesop` one-liners, not the proof.

**The refactoring in flight.** The uncommitted working-tree diff on
`TwoSourceCanonicalSurface.lean` adds two `private` helpers at `:50` and `:59`,
and both map onto the recovered text: `oppApex1_mem_A_local` because the proof
calls `oppApex1_mem_A S` four times while that lemma is `private` in nine other
ATail modules and therefore out of scope here, and `collision_btw_sep` factoring
the three repeated `SurplusCOMPGBank.btw_sep` applications out of the case
bodies. Neither helper is referenced yet.

**The defect.** The 2026-08-17 audit read the build failure as performance —
"deterministic heartbeats/timeouts ... a termination/performance failure in
checking, not an explicit `sorry`" — and recommended rewriting the timeout-prone
steps. That diagnosis appears to be wrong.

Case 1 ends by deriving `False` from `hbtw` and `hbtw_sep`:

- `hbtw := QP.alternates_between_firstApex_and_commonBlocker B`, stated at
  `CriticalFiberRetainedRadiusSelector.lean:285-292` as
  `btw (idx O) (idx (H.blockerVertex Q.fiber.source₁)) (idx Q.fiber.source₁) ↔ ¬ btw (idx O) (idx …) (idx Q.fiber.source₂)`.
- `hbtw_sep := SurplusCOMPGBank.btw_sep …` instantiated at `i = idx O`,
  `j = idx A`, `a = idx source₁`, `b = idx source₂`.

Because `QP := RetainedRadiusCollision.ofSources source₁ source₂ …`, these are
the same proposition — `alternates_between_firstApex_and_commonBlocker` is itself
proved by that exact `btw_sep` application, with the same `O`, `A`, `hA_ne_O`,
`hsource₂_ne_O` scaffolding. Two proofs of one `X ↔ ¬Y` are satisfiable at
`X` true and `Y` false, so no contradiction follows, and the endgame is
correspondingly a self-referential `by_contra` tangle. On this reading the
`whnf`/`isDefEq` heartbeat is the elaborator failing to unify an unprovable
goal, not a slow but valid proof.

Two independent signs point the same way:

- `hresidual : GeometricMultiplicityResidual P Pρ` is used **zero** times across
  all four cases — finding 3 of the 2026-08-17 audit. Were the proof sound, the
  leaf would hold without the residual hypothesis at all, a materially stronger
  claim than the leaf makes.
- Case 1 derives the genuinely contradictory material — `hsurvives`, `hblocked`
  from `H.no_qfree_at`, and `hblockerNe` — and then discards all three. Each name
  occurs exactly once, at its own definition. The argument assembles the right
  ingredients and abandons them for the alternation identity.

**Status of this sub-finding:** source-level reading only. No `lake build` was
run and no `#check` was performed, so the unsoundness is argued from the cited
statements rather than from the elaborator. That is enough to redirect the
follow-up, not enough to call the branch refuted.

**Salvageable.** The two extracted helpers and the per-case setup — boundary
indexing, the `RetainedRadiusCollision.ofSources` construction, `hfirstApexEq`
and `hcommonBlockerEq` — look like real work. What needs replacing is the
endgame of all four cases, with an argument that actually consumes
`hsurvives`/`hblocked`/`hblockerNe` and the unused `hresidual`.

**Consequence for §4.1's recommended action:** correcting the roadmap line is
still first, but the perf-hardening follow-up in
`docs/audits/2026-08-17-false-of-cross-blocker-coincidence-audit.md`
("rewrite the timeout-prone steps ... to avoid heartbeat blowups") should be
withdrawn before anyone spends time on it.

### 4.2 HIGH-MED — floating-point evidence carrying a universal method claim

`docs/audits/2026-08-16-firstnonhit-l5-named-fragment-realization.md:82-88`
concludes:

> The leaf **cannot** be closed by any named-point argument, including the
> shell-curvature packing route ..., the Lemma 37 budgets, cap counting,
> bisector uniqueness, or any finite extension by further named rows. Every such
> hypothesis set is satisfied by an explicit convex polygon.
> Local carrier projections and SAT waves over named rows are **guaranteed** to
> be satisfiable for this leaf.

Its own witness is floating-point: the same document records "bisection to 1e-18
in the curve parameter" (`:70-71`), "classes are exact to 1e-9" (`:56`), and a
minimum cross product of `2.5e-7` with minimum exterior turn `0.095` degrees
(`:37`).

Two registry rules bar this. `dead-ends.md:260` (§2.3): "Use exact rational or
algebraic literals. A floating-point model with small residuals is not an exact
realization." And `dead-ends.md:1612` (§11.4): "the conclusion does not quantify
over a larger method family than the evidence."

This is load-bearing — it is the stated reason local SAT waves were stopped on
the live `false_of_freshThird_firstNonHit` leaf.
`docs/audits/2026-08-17-freshthird-branch-audit-and-capacity-analysis.md:27`
then restates the float artifact as "**confirmed**" and adds a further universal
solver-family conclusion.

**Recommended action:** re-derive the witness over exact rationals or algebraic
numbers, or downgrade both documents to `NUMERICAL_EVIDENCE_ONLY` and reopen the
SAT-wave decision that rests on them.

### 4.3 MED — final verdicts on unreplayed repository artifacts

- `docs/closure-plan-full-spec-2026-07-09.md:5443-5444` asserts "Card ≥ 15 ('the
  tail') — the relaxed pattern-cover statement is **FALSIFIED**", citing
  `scratch/d3-formulation/report.md`. `dead-ends.md:1501` (§10.10) permits an
  upgrade to `FALSE_IN_RECORDED_RELAXATION` "only after the exact formulas and
  witnesses are replayed under a pinned checker." The plan is correct about
  scope — it notes the witnesses are nonconvex and do not refute the
  `ConvexIndep` leaf — but the verdict outruns the evidence tier.
- `docs/closure-plan-full-spec-2026-07-09.md:5462` and
  `docs/audits/2026-07-09-full-closure-plan-audit.md:192` flatly assert "13/19
  decorated minimal-window types are realizable", which §10.11 holds at
  `REPORTED_RESULT_UNVERIFIED` pending replay. `census/candidate_d_probe/` exists
  with the described `STATE.md` and witness JSON, but no replay receipt was
  located.

### 4.4 MED — banned equivalence vocabulary

`dead-ends.md:326` (§3.1) requires that "a claimed equivalence requires explicit
Lean implications in both directions with the same objects and hypotheses", and
§2.1:154 bars writing an unproved `≡`. Three active documents assert
bidirectionality that source does not supply:

- `docs/audits/2026-08-17-freshthird-branch-audit-and-capacity-analysis.md:22-23`
  — "**Kernel Equivalence**: `false_of_freshThird_firstNonHit` is
  **interderivable** with Level-5"
- `docs/audits/2026-08-16-l5-named-fragment-realizability.md:7` — "**structurally
  equivalent** to the level-5 theorem"
- `docs/audits/2026-08-16-firstnonhit-l5-named-fragment-realization.md` §4a — "a
  proof of level 5 is **required and sufficient**"

The cited bridge `TwoSourceFreshCanonicalOverride.false_of_freshCanonicalRowOverride`
(`:389-404`) concludes `False` from hypotheses: one direction only. The
"required and sufficient" phrasing is a separate slip — a hypothesis-subset
relation yields sufficiency, not necessity. This also violates the project rule
in `math-projects/CLAUDE.md` banning "equivalent" in proof prose.

### 4.5 LOW-MED — `dead-ends-audit-response.md` now reads as a live directive

`docs/dead-ends-audit-response.md:444-461` prescribes a "Recommended rewrite of
`dead-ends.md`" using a vocabulary table (`FORMALLY_CLOSED`, `OFF_SPINE`,
`EQUIVALENT_TO_FULL_PROBLEM`, `STALE`, `CONJECTURED`,
`REOPEN_WITH_NEW_COUPLING`) that the actual rewrite did not adopt; §1 of that
document still quotes pre-rewrite text as the current error. The rewrite has
happened under different labels, so the response doc now points readers at
retired vocabulary — and `EQUIVALENT_TO_FULL_PROBLEM` uses the banned word.

**Recommended action:** mark the response document superseded by `0cec41a9`.

### 4.6 LOW — retired vocabulary still in use

- `docs/computational-closure-plan-2026-07-28.md:6452` and `:6849` use "(Q)" as a
  live descriptor of current residual content; §2.1:139 retains "(Q)" only as a
  cross-reference. Naming drift only, no unproved equivalence asserted.
- `docs/closure-plan-full-spec-2026-07-09.md:6794` calls LIVE-Q/C "separate
  on-spine obligations"; the live spine's 36 leaves are all
  `ATailFrontierLiveClosure.*`. Mitigated — the sentence is tagged as a dated
  2026-07-14 cursor state, and `docs/closure-matrix-2026-07-09.md:82` already
  records the surface as retired.
- `docs/erdos-97-descent-prose-proof-atomic.md:1450-1452` states a "negative
  methodological result" quantified over "local circle incidences, small
  cardinality inequalities, and strict convexity". Its G2 witness is
  exact-rational so the claim is close to defensible for the tested feature
  language, but the sentence is broader than the witnesses.

## 5. Repository hygiene defects exposed by the audit

1. **Dangling source pointer.** `lean/Erdos9796Proof/P97/OangleBridge.lean:184`
   cites a `{{NEEDS_RESEARCH}}` marker at `U3ShortCapSaturation.lean:114`. No
   such file exists anywhere in `lean/`. This corroborates §8.7's classification
   of that object as historical.
2. **Dangling README link.** `README.md:203` links to
   `docs/audits/2026-08-17-spine-leverage-analysis-and-roadmap.md`, which has
   never been committed to any branch. A clean checkout at either the baseline or
   HEAD has a dead link. Four sibling `docs/audits/2026-08-1[6-8]*.md` files are
   likewise untracked. Given §4.1 above, committing the roadmap unmodified would
   publish an incorrect closure claim; correct it first.
3. **Stale committed `docs/live-blueprint.md`.** The committed copy is from
   2026-08-05 (`open: 93/36003`, 29 obligations) and disagrees with README's own
   committed figures (`126/36264`, 37 obligations). The working-tree copy is
   fresh (`126/37290`). `dead-ends.md:23` already warns this file is a generated
   snapshot and not an independent authority; this confirms the warning
   empirically.
4. **README spine size figures are one snapshot behind.** README records
   `open: 126/36264` and `291224 line(s) ... across 36264 decl(s)`; a fresh run
   reports `126/37290` and `320179 line(s) ... across 37290 decl(s)`. The **leaf
   count is not stale** — README's `open obligations (37): -- 36 sorry-carrying
   leaves + the sorryAx node itself` (`README.md:184`) is exactly consistent with
   the live spine and with the 36-leaf cluster table at `README.md:220`. Only the
   decl and line totals drifted, across roughly 19 new modules.
5. **Scratch Lean files shadow spine declarations.** A fresh `proof-blueprint
   spine` emits 27 `⚠` blocks covering roughly 83 declarations with "2 distinct
   bodies across 2 files". The shadowing files are four untracked probes:
   `scratch/exact_twelve_branch_equivariance_probe.lean`,
   `scratch/exact_twelve_placement_orbit_probe.lean`,
   `scratch/firstnonhit-retained-escape-math/RetainedEscape.lean`,
   `scratch/freshthird-firstnonhit-qfiber-three/QFiberThreeBoundary.lean`.
   This bears directly on the registry's verification model, which is "locate the
   declaration by name": a name search can land on the scratch body instead of
   the spine body.
6. **The registry is not wired into agent instructions.** `CLAUDE.md` contains
   zero references to `dead-ends.md`, so its "do not retry" force depends on an
   agent independently discovering it. `README.md:885` additionally describes it
   as "the don't-repeat log for **closed** proof routes", which mischaracterizes
   it — most entries are explicitly not closed, and §1 opens by saying a route is
   barred only to the extent stated in its **Exact scope** field.

## 6. Method limits

No solver artifact was replayed, no `lake build` was run, and no `#print axioms`
was executed; kernel-closure figures quoted from other audits are taken as
reported. `docs/computational-closure-plan-2026-07-28.md` (14,770 lines and
being actively written during the audit, so its line numbers are volatile) was
grepped for every registry topic and read at its `(Q)` sites, not end to end.
`docs/closure-matrix-2026-07-09.md` was read at header and LIVE-Q/K-A rows only.
Not swept: `docs/archive/`, `docs/census/`, `docs/multi-center/`, `docs/notes/`,
`docs/references/`, and most of `docs/solve-prompts/`. The claim that
`SharedCirclePointForcesV3` "uses a unit-radius equilateral coincidence absent
from the historical b2 rows" (§7.4) could not be pinned to a specific historical
proof site and is left unconfirmed in either direction.

## 7. Recommended actions, in priority order

1. Correct `docs/audits/2026-08-17-spine-leverage-analysis-and-roadmap.md:34`
   and re-derive its execution sequence; reconcile its three conflicting leaf
   totals against the live spine. Do this before committing the file, since
   `README.md:203` already links to it. Live counts for that reconciliation, from
   a fresh `proof-blueprint spine`: 36 leaves total — Cluster A 6 (the table's
   figure is right, the section heading's 5 is not), Cluster B 9, Cluster C 18,
   Cluster D 3. The header's "34 effective" and the cluster table's 13 for
   Cluster C are both stale.
1a. Withdraw the perf-hardening follow-up in
   `docs/audits/2026-08-17-false-of-cross-blocker-coincidence-audit.md`; per
   §4.1a the build failure is very likely an unprovable goal, not a heartbeat
   budget. Preserve the recovered attempt at
   `refs/recovered/crossblocker-proof-20260817` before any `git gc`.
2. Re-derive the 2026-08-16 realization witness over exact rationals, or
   downgrade both dependent audits to `NUMERICAL_EVIDENCE_ONLY` and reopen the
   SAT-wave decision.
3. Replace "interderivable" / "structurally equivalent" / "required and
   sufficient" in the three FreshThird audits with the exact direction each
   bridge establishes.
4. Upgrade the §7.1 `qEqE_oneCosine_crux` evidence tier to
   `LEAN_DECLARATION_PRESENT`, and sweep §3.1 for the same cheap upgrades.
5. Downgrade the two final verdicts in §4.3 to unreplayed status, or produce the
   replay receipts.
6. Mark `docs/dead-ends-audit-response.md` superseded.
7. Repository hygiene: fix the `OangleBridge.lean:184` pointer; regenerate the
   committed `docs/live-blueprint.md`; refresh README's spine size figures; move
   or rename the four shadowing scratch `.lean` probes.
8. Add a `dead-ends.md` pointer to `CLAUDE.md` and correct the README's
   "closed proof routes" description.
