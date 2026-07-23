# Skeptic audit of the unique-four curvature CEGAR

Date: 2026-07-22

Scope: read-only audit of
`unique4-curvature-occurrence-census/run_curvature_cegar.py`, its stored seed
bank, the two live exact-two manifests, the strict/open-window and cyclic
full-cover Lean consumers, symmetry cuts, terminal replay, and DRAT labeling.
No driver or production Lean file was edited by this audit.

## Verdict

The original mask-only four-arc gate was too broad for the then-only strict
open-window Lean theorem.  The newly added cyclic full-cover theorem repairs
that mathematical gap: pairwise-disjoint cyclic interval supports either omit
a turn and admit a strict common lift, or cover the whole period and meet
exactly.  The current classifier distinguishes these two cases, and both Lean
consumers freshly kernel-check with only `propext`, `Classical.choice`, and
`Quot.sound`.

The two live manifests are not presently tainted by an unsupported four-arc
cut.  They seed the same 323 inclusion-minimal center sets and 7,051 dihedral
row-assignment cuts.  Fourteen recorded seed batches (308 new orbit cuts) use
a `FULL_COVER` representative; nine batches (198 orbit cuts) have no strict
open-window witness on the same center set and genuinely need the new
full-cover consumer.

One dormant branch remains **unsound for a theorem-backed CEGAR claim**:
when scalar QF_LRA is UNSAT but neither checked four-arc terminal occurs, the
driver still installs a `fixed-background_deletion_minimal_row_core` cut.
No Lean theorem or exact Farkas certificate is produced for that cut.  This
branch must fail closed until such a certificate is checked.  It has not been
used by the currently recorded new rounds.

The remaining manifest/replay issues below are integrity or completeness
defects rather than evidence that a current checked-terminal cut is false.

## The full-cover regression

The exact source regression is

```text
scratch/atail-force/unique-arm-whole-carrier-source-audit/
  cegar-exact-two/round_001/opp1_4.result.json
```

Its relevant selected rows are

```text
center 1: {0,2,7,9}
center 3: {2,4,5,9}
center 4: {0,1,8,10}
```

The four cyclic outer arcs are

```text
(1,left)  turns {0,10}
(3,right) turns {6}
(4,left)  turns {7,8,9}
(4,right) turns {1,2,3,4,5}
```

They are pairwise disjoint and cover all eleven turns.  With the common cut at
turn 7, the current classifier returns the exact full-cover lift

```text
(4,left)  [0,4)
(1,left)  [3,6)
(4,right) [5,11)
(3,right) [10,12)
```

Thus every adjacent equation is exact and the final used turn is
`11 = 0 + n`.  This is an instance of

```lean
Problem97.ShellCurvature.false_of_four_turnCovering_quarter_turn_arcs
Problem97.ATailUniqueFourTurnDisjointOccurrenceScratch
  .false_of_fourTurnCoveringSelectedRowArcs
```

It is not an instance of the strict `last_turn_before_end` theorem.

The installed center batch is `{1,3,4}`.  The driver installs all 22 images
under

```text
p |-> (+p + shift) mod 11
p |-> (-p + shift) mod 11
```

applied to both row centers and every support point.  The identity membership
cut is

```text
(1,0) (1,2) (1,7) (1,9)
(3,2) (3,4) (3,5) (3,9)
(4,0) (4,1) (4,8) (4,10)
```

The lexicographically least orbit member is the unreflected shift by 8:

```text
(0,1) (0,2) (0,6) (0,10)
(1,5) (1,7) (1,8) (1,9)
(9,4) (9,6) (9,8) (9,10)
```

Across the twelve stored seeds, the center sets that have no strict witness
and therefore specifically require the full-cover theorem are:

```text
round_001/opp1_4: {1,3,4}, {4,6,7}
round_001/opp1_5: {0,2,3}
round_002/opp1_4: {3,5,6}
round_004/opp1_5: {1,2,5}, {2,3,5}
round_005/opp1_4: {2,3}
round_005/opp1_5: {0,3,4}
round_006/opp1_4: {0,9,10}
```

This is 9 batches and 198 orbit cuts.  Both current profile manifests contain
the same seed bank, so the count applies to both on-disk CNFs.  Under the old
single-terminal contract those 198 cuts were unsupported; under the current
two-terminal contract they are covered by the new kernel-checked theorem.

## The common three-row occurrence survives

The designated common three-row schema does not rely on full cover.
`census_occurrences.py --check` passes, and every one of its twelve stored
representatives has three distinct row centers and normalized final used turn
9 or 10, hence strictly less than the period 11.  The occurrence therefore
remains a valid instance of the strict open-window consumer.

This distinction matters: the full-cover repair validates the extra seed cuts;
it is not needed to preserve the advertised common three-row occurrence.

## Findings that passed audit

- The scalar outer-arc endpoints match the Lean adapter: the left support is
  `range(offsets[1] - 1)` and the right support is
  `range(offsets[2], n - 1)` after the common center rebase.
- Repeated centers are intentional and supported.  A witness may use both the
  left and right arc of one selected row; the Lean packets do not require four
  distinct centers.
- Inclusion-minimality by center set is sound once the witness predicate is
  sound: fixing a selected row at a center fixes both transported outer arcs,
  so a smaller supporting center set subsumes a strict superset.
- The dihedral cut transports centers and all support memberships together.
  Reflection swaps left/right geometry, but the two aggregate terminals are
  orientation invariant.  No cap-role transport is needed by these row-only
  consumers.
- The kernel-only Kalmanson filter contains exactly the ten entries marked
  `KERNEL_CHECKED`; the corresponding declarations are present in the current
  scratch theorem bank and contain no `sorry`.
- Boolean UNSAT is conservatively labeled pending until a fresh CaDiCaL proof
  is accepted by `drat-trim`.  That proof certifies the exact CNF, not the
  mathematical validity of learned cuts; the latter is why the gate audit is
  still necessary.
- The aligned-mode rebase explicitly identifies the retained pair with the
  strict pair and the terminal replay checks the mode-specific result fields.

## Remaining defects

### 1. Unsupported fallback cut — semantic unsoundness if reached

The `fixed-background_deletion_minimal_row_core` branch turns a Z3 deletion-
minimal QF_LRA core into a Boolean row-assignment cut without a checked Lean
consumer or a stored exact Farkas certificate.  Z3 UNSAT is valid discovery
evidence, but it is not the declared kernel-backed trust rung.

Required behavior: if neither `STRICT_OPEN_WINDOW` nor `FULL_COVER` occurs,
stop with a fail-closed terminal status and preserve the oracle payload.  The
branch may be re-enabled only after emitting and independently checking a
certificate whose hypotheses are exactly the fixed ambient turn constraints
and selected row inequalities used by the cut.

### 2. Round-cap CNF/manifest mismatch — artifact integrity defect

The CNF is written at the start of a round.  If the final permitted SAT round
installs another batch and the loop then exhausts, `final_curvature_core_cut_count`
describes the in-memory post-cut CNF while `final_cnf_sha256` hashes the stale
pre-cut `current.cnf`.

This occurred in the quarantined earlier `opp1_4` run: the written CNF reported
14,795 cuts, while the manifest reported 15,235 after the final 440 cuts.  The
old run directories were removed before this audit finished and are not being
treated as current evidence.

Required behavior: rewrite `current.cnf` after the last installed batch, or
record separate `written_cnf_cut_count` and `next_in_memory_cut_count` fields.
Before finalizing, assert that the CNF metadata count, manifest final count,
and hash all describe the same bytes.

### 3. Replay and provenance are not fully bound

- The SAT oracle records `turn_sum`, turn bounds, and row-margin checks but the
  terminal path does not fail closed by asserting those recorded booleans.
- The field named `source_result_sha256` is a digest of canonical compact JSON,
  not the bytes of `terminal.result.json`.
- The manifest does not bind the driver source, the two Lean terminal source
  files, or every terminal replay artifact by SHA-256.
- Output writes are not atomic and there is no run-directory lock or run ID;
  interrupted or concurrent reuse of one output directory can mix artifacts.

These are incomplete replay semantics, not a demonstrated false result in the
current runs.  They should be fixed before a terminal artifact is promoted to
coverage evidence.

### 4. The committed semantic regression is currently stale

At this audit checkpoint,

```text
regression_open_window_gate.py --check
```

fails because `open_window_gate_regression.json` has not yet been regenerated
for the two-terminal classifier.  The current synthetic full-cover test also
does not use the exact source tuple above.  This is a failing/incomplete gate,
not a silent false pass.

The checkpoint should include both:

1. the exact source-derived `{1,3,4}` tuple, classified only as `FULL_COVER`;
2. a one-turn-gap tuple, classified only as `STRICT_OPEN_WINDOW`.

## Required regression gate before trusting a terminal run

1. Freshly elaborate both aggregate Lean consumers and both selected-row
   wrappers; require no `sorry` and only the three standard axioms above.
2. Recompute all twelve seeds from their source rows.  Require exactly 323
   inclusion-minimal center sets and 7,051 distinct dihedral membership cuts.
3. Require the nine full-cover-only center sets listed above and replay their
   exact meet equations; do not infer full cover from cardinality alone.
4. Run `census_occurrences.py --check` and require all twelve designated common
   three-row representatives to retain strict span less than 11.
5. Disable the certificate-free fixed-background fallback.
6. For a SAT terminal, independently replay the CNF model and exact rational
   turn constraints and assert every stored check before writing `VERIFIED`.
7. For Boolean UNSAT, bind the CNF SHA-256 to the CaDiCaL proof and successful
   `drat-trim` replay, and report only finite-projection UNSAT.
8. At every exit, verify the manifest cut count against the actual final CNF
   metadata and hash.
9. Start from an empty, uniquely named output directory and use atomic writes
   for manifest and terminal artifacts.

## Validation performed

- `census_occurrences.py --check`: pass.
- All 12 designated common representatives: three centers and strict span
  less than 11.
- Recomputed two-terminal seed census: 323 minimal center sets and 7,051
  distinct orbit cuts.
- Recomputed strict-only comparison: 9 full-cover-only batches and 198 cuts.
- Focused Lean check of `TurnDisjointCurvatureTerminal.lean`: pass; both
  aggregate consumers have only `propext`, `Classical.choice`, `Quot.sound`.
- Focused Lean check of `UniqueFourTurnDisjointSourceOccurrence.lean`: pass;
  both selected-row terminal wrappers have the same axiom closure.
- Live manifest snapshot: both modes have the 7,051-cut seed bank;
  `opp1_4` round 1 added 1,056 checked-terminal cuts, while `opp1_5` had not
  yet completed a round.  These are in-progress observations, not terminal
  coverage claims.
