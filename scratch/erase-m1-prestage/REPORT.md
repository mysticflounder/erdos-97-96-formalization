# ERASE M1 pre-stage: Python replica of the native classifier DFS over the card-11 seed domain

Date: 2026-07-12. Branch `four-point-subpacket-reduction`.
Design basis: `scratch/erase-classifier-design/DESIGN.md` (section 6, M1 optional
pre-stage under the build freeze).

**Tier: EMPIRICAL, replica-based. This run licenses NO Lean claim.** It is a
decision-value experiment on risk R2 ("the searches may not all kill"): a
surviving tree would mean the committed detector suite does not close ERASE and
transport work must not start. The Lean-side M1 `#eval` gate (post-freeze) and
the `native_decide` cells (M3) remain mandatory; nothing here substitutes for
them.

## Headline

**ALL KILLED (EMPIRICAL): 4680 / 4680 searches over the full ERASE card-11
seed domain terminate with every branch killed by the committed detector
suite.** Zero survivors, zero node-cap hits, zero gate failures, full domain
coverage (no sampling, no truncation). On this EMPIRICAL evidence, the R2
STOP condition did not trigger, and the M2+ transport work is not blocked by
any known failing cell.

## 1. Smoke test (mandatory encoding validation) — PASS

`run_smoke.py` -> `smoke_test_results.json`. All five checks passed:

| check | result |
|---|---|
| S1 role-bank codes: regenerated `pairCodes` (55) / `tripleCodes` (165) vs the Lean literals parsed from `Census554/CapSelectedBVRoleBank.lean` | PASS (set equality) |
| S2 `candidateRows` sizes: centers 1-2: 15, 3-6: 96, 7-10: 203, center 0 pre-deleted-gate: 79 (DESIGN section 2.2 figures) | PASS |
| S3 literal vs optimized detector cores, 2000 random closures | PASS (0 mismatches) |
| S4 endpoint 64-placement gate (`EndpointPlacementDispatch.lean`) | **PASS 64/64 killed** |
| S5 pinned 12-placement gate (`CapSelectedNativePlacements.lean`) | **PASS 12/12 killed** |

S4/S5 reproduce 76 committed kernel-checked `native_decide` theorems through
the **same parametric code path the main run uses**: the replica's
`erased_placement_check(c0, support, deleted)` evaluated at c0 = 1 is
definitionally the committed `placementCheck` / `endpointLeftPlacementCheck`
shape and at c0 = 2 the committed `endpointRightPlacementCheck` shape (same
variable-center lists, same c0-keyed off-circle detector — the R4 fork is
exercised at both committed literals). Combined smoke volume: ~2.3M DFS nodes.

## 2. Main run — domain and coverage

Domain enumerated exactly per DESIGN.md section 1.2 (verified counts):

| family | c0 | seed supports | deleted choices | searches |
|---|---|---|---|---|
| P2 | 7, 8, 9, 10 | 191 per center (localCandidateOK + pin in intS) | 4 (intS) | 3056 |
| P4-S | 3, 4, 5, 6 | 90 per center (localCandidateOK + intS pin != c0) | 4 (intS) | 1440 |
| P4-U | 0 | 79 (localCandidateOK at center 0) | deleted in s & intS (center-0 gate) | 184 |
| total | | **1203 seed placements** (matches DESIGN grand total) | | **4680** (<= 4812 bound) |

This is the superset domain (no per-row signature dispatch, deleted
unrestricted within the gate), so any landed row subset of the pending
`ErasedPinRowResiduals.lean` redraft is covered. The P2 seeds span 21
`(m, own, l, r)` signature shapes (per-signature tallies in
`analysis_summary.txt` / `cells.jsonl`), a superset of the 13 hole signatures
anticipated by DESIGN section 2.1.

Coverage: **4680/4680 recorded, 0 missing, 0 duplicates** (`analyze_cells.py`).
Runtime: 248 s wall on 24 workers (~1.6 CPU-hours), 26.8M DFS nodes.
Node cap 3,000,000 per search — never hit (max observed 41,767).

## 3. Verdicts

| family | killed | survived | capped (UNDECIDED) | gate_false |
|---|---|---|---|---|
| P2 | 3056 | 0 | 0 | 0 |
| P4-S | 1440 | 0 | 0 | 0 |
| P4-U | 184 | 0 | 0 | 0 |

No cell is UNDECIDED: no detector was approximated or skipped, and no search
was truncated. 656 searches (368 P2, 288 P4-S) are killed at setup by an
initially empty restricted domain (0 nodes); all others by the detector suite.

## 4. Distributions (killed searches)

Nodes per search: min 0, median 4116, p90 12,968, p99 28,201, max 41,767
(P4-U c0=0). Per-family medians: P2 2.8-4.1k, P4-S 4.6-5.0k, P4-U 7.9k.

Prefix-kill events by detector (Lean short-circuit order, 10.72M events;
18.78M additional empty-domain prunes):

| detector | events | share |
|---|---|---|
| duplicateCenterCore | 4,225,123 | 39.4% |
| convexFivePointCore | 3,193,743 | 29.8% |
| perpendicularBisectorCore | 2,434,557 | 22.7% |
| exact off-circle (parametric c0) | 865,178 | 8.1% |

All four detectors are load-bearing; in particular the **parametric-c0
off-circle fork (R4) fires 865k times at the ERASE seed centers**, so the
fork is not dead code and a wrong-literal fork would have been observable.

Kill depth (assigned rows incl. seed): mass at depths 6-8 (min 3, max 11);
608 kills occur at depth 11, i.e. only at the full 11-row assignment — the
trees genuinely need the entire search depth in places, consistent with R2's
"expect deep trees, no count-only shortcut".

## 5. What this licenses / does not license

- **EMPIRICAL only.** The replica is Python, not the Lean closure; nothing
  here is kernel-checked. The M1 `#eval` gate and the M3 `native_decide`
  placement shards must still be run post-freeze; they are the only artifacts
  with proof value.
- What it supports, at EMPIRICAL tier: the committed detector suite
  (duplicate-center / parametric exact-off-circle / perpendicular-bisector /
  convex-five-point over the `hK4` equality closure) kills every tree in the
  full ERASE card-11 seed superset domain. The R2 STOP condition did not
  trigger; there is no known failing cell to route to cut research
  (ERASE-P3-SWEEP), and M2+ transport work is not blocked by this experiment.
- Fidelity evidence, in decreasing strength: (i) 76 committed `native_decide`
  theorems reproduced end-to-end through the identical parametric code path;
  (ii) literal-vs-optimized detector cross-check (2000 closures, S3);
  (iii) an independent line-by-line read of the replica against the two Lean
  sources (see section 6). None of this is a proof of replica correctness; a
  semantic divergence that only manifests on ERASE-specific seeds and not on
  the 76 smoke placements would not be caught by (i).
- No approximations: all arithmetic is Python int/bool (the committed
  classifier is purely combinatorial — Nat masks + union-find; no rational or
  floating-point quantity exists in the decision path, so "exact arithmetic
  only" is satisfied trivially). No detector was skipped; `convexRhombusCore`
  is not part of the committed `hasPrefixCore` chain and is correspondingly
  absent here.
- Card-10 is out of scope by design (DESIGN sections 1.3, 4.2, 4.3): this
  experiment says nothing about the ten-label bank lane or the card-10 P4
  bank extension (M8/M9).
- The domain is the DESIGN 1.2 superset keyed to the current (provisional)
  hole surface; if the landed `ErasedPinRowResiduals.lean` rows need seeds
  outside it (different pivot for `deleted`, centers outside
  {0} + intS + intO1 + intO2), those would be new cells (R5).

## 6. Replica deviations from literal Lean structure

Four deliberate, equivalence-argued deviations (D1-D4, documented at the code
sites in `replica.py`): incremental `restrictDomain` filtering, row-local
`pairBoundOK` iteration, assert-instead-of-recompute for the redundant
expansion-time `compatibleWith` (asserted in smoke debug mode, never fired),
and root-group detector scans instead of code-list scans (cross-checked in
S3). An independent subagent audit compared the replica line-by-line against
`Census554/CapSelectedNativeClassifier.lean` and
`EndpointCertificate/EndpointNativeClassifier.lean`, re-fuzzed the optimized
cores against its own from-scratch transcription (thousands of trials per
group), and specifically hunted for inequality, iteration-order, fuel/depth,
find?-order, and loop-edge discrepancies. Verdict: **FAITHFUL, zero
mismatches**; D1-D4 equivalence arguments validated. Two non-blocking
observations were returned (an imprecise union-find comment, since fixed, and
a degenerate-input note about `mask_of` vs Lean's power-sum row construction
that provably cannot change any verdict: colliding labels gate to false on
both sides); neither affects any reachable verdict.

## 7. Files

- `replica.py` — exact replica library (parametric `erasedPlacementCheckAt`).
- `run_smoke.py` / `smoke_test_results.json` / `smoke_stdout.log` — encoding
  validation (S1-S5).
- `run_main.py` / `cells.jsonl` — main run driver and per-search records
  (family, c0, support, deleted, buckets/sig, verdict, nodes, kill depths,
  detector attribution, timing); resumable via key `family|c0|mask|deleted`.
- `analyze_cells.py` / `analysis_summary.txt` / `main_run.log` — coverage and
  distribution summaries.
