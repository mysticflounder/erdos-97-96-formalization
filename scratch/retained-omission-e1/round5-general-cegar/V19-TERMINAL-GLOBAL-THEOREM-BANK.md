# v19 terminal global theorem-bank audit

Date: 2026-08-02

Production artifact audited:

`artifacts-v19-production1/20260802T153331.017335Z-case-pid34172`

Live theorem target:

`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

This is the mandatory post-wave global theorem-bank checkpoint.  It is an
artifact, source, and registry audit.  No Lean/Lake build or kernel audit was
run, and no claim below promotes external solver evidence to a Lean theorem.

## Verdict

- **NO-GO — no new general theorem or admissible generalized CEGAR cut was
  discovered.**  All 190 assignments were rejected by the primary QF_LRA
  check and its independent normalized replay, but every admitted blocker is
  the complete 825-literal point assignment.  The terminal bank contains no
  smaller core or parametric family.
- **NO-GO — no finite coverage claim.**  The terminal status is `unknown`, the
  one-hour wall-clock budget was exhausted, and the Boolean master was not
  proved UNSAT.
- **NO-GO — no direct bridge into the live theorem.**  The encoding is the
  exact-`n = 15`, DDD normalized slice.  The live theorem is general in the
  carrier cardinality, and v19 did not produce the missing positive
  cross-cap incidence or a proof reducing the live residual to this finite
  slice.
- **GO — retain the terminal assignments as authenticated discovery data.**
  They expose a small observed selector surface and justify targeted search,
  but the observed relations are not master entailments and therefore are not
  theorem-bank entries.

## Terminal status and trust boundary

| Field | Audited value |
|---|---:|
| Case | `fresh_DDD_k0_d2_f1` |
| Status / complete | `unknown` / `false` |
| Reason | `v19_wall_clock_budget_exhausted` |
| Case elapsed | 3632.762651 s |
| Semantic Booleans / trackers | 825 / 26 |
| Completed assignments / blockers | 190 / 190 |
| Journal records / pending | 380 / 0 |
| Generalized blockers | 0 |
| Full point blockers | 190 |
| Boolean prepass | `sat_no_cut`; 1 model; 70,785 candidates; 0 learned cuts |
| Static equality-triangle cuts | 15,684 |

The journal chain, assignment hashes, full-check hashes, blocker hashes, and
all 825-literal projected cores were checked by
`v19_terminal_assignment_census.py`.  The recorded source contract also pins
all eight Lean source files used by the encoder.

This establishes authenticated, reproducible **external Z3/QF_LRA evidence**
for the encoded finite slice.  It is not a proof-producing solver certificate,
not a Lean proof, and not kernel closure of the live target.

Key hashes:

| Item | SHA-256 |
|---|---|
| Summary | `327dd9f3df4d4bc36b77bc1866eae8933abf083e4c017899ebead6f9602796b9` |
| Result | `8e1a13271686fb558dc71d95db127afef06a9ba3f2cf28808fe9a30f04c8178a` |
| Trace | `4efb1aeb01866d7cea7347271a7ea4778fb95478f0812fe95c6df84b0e97959f` |
| Journal head | `218151c6b377c854883a22c8cc0e429fb159b4d9048d8707371203538226a35f` |
| Frozen full formula | `bce451bab18921a6c0d0d29d5307c8aab59be1c1fc937d991c6b40a8d7ca2720` |
| Initial / final master | `2e2b3a53116bdfaefd76956a6c3e6de095283f54fe017383dae795b53fa5d915` / `fad5a5b2831f03efe387a796891462e3bf6a690ae3f3b73b609d148e68a20f6b` |
| Cumulative blockers | `0c781b1b179eca9a149129a15a92b3ebfd3045122a6727319a841c4ae516b2aa` |

## What the 190 assignments say

The authenticated terminal census found 802 invariant and 23 varying
semantic Booleans.  On the **observed sample**, the varying surface factors as:

- six complementary blocker choices;
- one three-way blocker choice;
- one two-way apex-14 K4 choice.

This gives an observed upper envelope of `2^6 * 3 * 2 = 384` selector cells;
190 distinct factor keys occurred.

This is not a universal reduction.  The earlier 21-variable basin was fully
exhausted locally and then escaped at iteration 160, when
`block_13_11` / `block_13_4` first flipped.  Consequently neither the 802
invariants nor the 384-cell factorization may be admitted without a separate
master-entailment proof.

## Mandatory global theorem-bank routing

The current-project Lean corpus and the registries named in `AGENTS.md` were
checked against the terminal data.

| Candidate family | Existing bank / live consumer | v19 disposition |
|---|---|---|
| Equality-core / unit-triangle contradictions | `Problem97.not_dist_eq_three_of_ne`, `u5_unit_triangle_on_p_circle_incompatibility`, `Census554.EqualityCore.equilateral_bisector_collision`, `three_triad_collision` | **Reuse if a producer appears; no hit.** v19 produced zero generalized equality cores. |
| Circle-power rank and unique possible matching | `CirclePowerMatrix.powerMatrix_rank_le_four`, `false_of_powerMatrix_unique_possible_matching` | **Already admitted; no hit.** The Boolean prepass found no full-shell power cut, and no terminal blocker has the required zero/nonzero pattern certificate. |
| Pair/triple center multiplicity | v19 hard constraints `pair_center_multiplicity` (105) and `triple_center_multiplicity` (455); global `pinnedMultiplicity` equivalences | **Already encoded; no stronger cut.** The global pinned-multiplicity interface does not by itself produce a new local Q/G incidence. |
| CND, Kalmanson, same-shell superadditivity | Existing metric kernels and v19 hard constraints | **Already encoded; no extractable core.** Earlier projected raw-metric checks did not yield a small certified core. |
| U1 row-slot, endpoint, and surplus banks | General-`n` contradiction consumers in the sibling/legacy registries | **Producer gap unchanged.** Q/G does not place a live row into the required bank surface. |
| Six-pair skew-Bollobas, angular-midpoint, Miquel/bundle motifs | Phase-3 motif census | **No hit.** The authenticated Phase-3 census found zero skew and zero Miquel candidates; its connected support graph is only a prefilter and carries no midpoint equations. |
| C-F midpoint-line sign lemma | Unformalized mathematical lead | **PARKED research lead.** Current Q/G lacks the exact two-chord incidence/orientation surface needed to consume it. |

## Best remaining theorem target

The bank audit does identify the right shape of the missing producer, but v19
does not prove it.  `FrontierLiveClosure` already proves an existential
critical shell whose intersection with an appropriate *other* rich cap slice
has cardinality at most one:

`exists_criticalShell_center_with_otherRichCapSlice_card_le_one`.

The useful complementary theorem would derive, from `R`, `Q`, and `G`, a
critical shell and distinct rich cap slice with at least two hits.  That would
feed the existing localization/at-most-one consumer and close the core.  The
v19 encoding already imposes the at-most-one side
(`critical_row_cross_cap_rich_slice_one_hit`); its 190 point blockers provide
no lower-bound producer.  Therefore this is a direct universal geometry target,
not a theorem extracted from the terminal CEGAR bank.

## Live resume (not part of the terminal audit)

A source-frozen resume from the authenticated 190-blocker summary was launched
under `artifacts-v19-resume1` with a two-hour wall-clock budget and nice level
`+10`.  At the 2026-08-02 status snapshot it had completed 30 further UNSAT
assignment checks and had iteration 30 in flight.  Every completed resumed
blocker inspected was again the full 825-literal point blocker.  The live round
therefore raises the rejection count but has not changed this theorem-bank
verdict.

## Reproduction

From `scratch/retained-omission-e1/round5-general-cegar`:

```bash
uv run python -m py_compile v19_terminal_assignment_census.py
uv run python v19_terminal_assignment_census.py \
  --summary artifacts-v19-production1/20260802T153331.017335Z-case-pid34172/summary.json \
  > v19-terminal-assignment-census.json
```

The census output explicitly labels all selector relations empirical rather
than Lean/kernel theorems.
