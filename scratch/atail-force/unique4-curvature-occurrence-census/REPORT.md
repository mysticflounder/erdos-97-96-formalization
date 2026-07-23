# Unique-four curvature occurrence census

Date: 2026-07-22

Scope: the twelve stored `n = 11` exact-two Boolean projections and the
current bounded curvature CEGAR continuation.  This lane does not edit
production Lean or shared closure documents, and it makes no
arbitrary-cardinality claim.

## Result

**EXACT FINITE CENSUS:** all twelve stored exact-two projections contain a
four-turn-disjoint selected-row occurrence accepted by the checked scratch
terminal

```lean
Problem97.ATailUniqueFourTurnDisjointOccurrenceScratch
  .false_of_fourTurnDisjointSelectedRowArcs
```

The smallest common coarse schema found by the quotient is:

```text
three selected rows;
one arbitrary carrier-centered global-K4 completion row contributes
both of its outer arcs;
two fixed-blocker-image rows each contribute one outer arc of either side,
cyclically placed between the completion arcs.
```

This fixed-CCW-orientation schema occurs in all 12 records after cyclic re-cut
and renaming of the three centers; it does not use reflection.  The JSON stores one source-faithful
representative from every record, including actual center roles, row supports,
curvature endpoints, and fixed-blocker preimages.

This is deliberately a **coarse occurrence schema**, not one uniform exact
row-incidence theorem.  Exact quotient results are:

| quotient | schemas | common | minimum cover |
|---|---:|---:|---:|
| arc side + center equality | 11 | 7 | 1 |
| plus fixed/global provenance | 81 | 7 | 1 |
| plus exact local row offsets | 2,286 | 0 | 10 |
| offsets plus provenance | 2,320 | 0 | 10 |
| exact rows modulo dihedral action | 2,382 | 0 | 11 |
| exact rows plus provenance | 2,382 | 0 | 11 |

Thus the correct prospective source theorem is an aggregate occurrence
theorem at the selected-row/outer-arc level.  It is not one literal four-row
support pattern.  Center roles, support-point roles, curvature endpoints, and
fixed-blocker preimages vary across the twelve stored representatives; the
replay JSON records them rather than silently promoting any one record's roles
to a common hypothesis.

The quotient table itself also canonicalizes under reflection, so literal
`L`/`R` tokens in its dihedral schemas are diagnostics, not source-orientation
hypotheses.  In the retained CCW orientation, four of the twelve records have
no literal fixed-left/fixed-left representative.

This orientation-invariant three-row schema supersedes the older four-left-row occurrence target.
Repeated-center use is load-bearing: the global completion row supplies both
of its outer arcs.  Reimposing four distinct centers would make the source
producer strictly stronger than the checked consumer requires.

## Fixed blocker image versus global K4

The fixed critical map alone is not a uniform source of the occurrence.
Exactly 8 of the 12 stored records have some four-arc witness using only row
centers in the fixed blocker image.  Four records have none:

- round 1, opposite-cap card 5;
- round 2, opposite-cap card 5;
- round 4, opposite-cap card 4;
- round 5, opposite-cap card 4.

Those four require at least one arbitrary carrier-centered K4 completion row.
The designated smallest source-orientation-invariant schema uses exactly two
fixed-image rows and one global-K4 completion row in every record.  Reusing
both outer arcs of that global row is essential to the three-row reduction;
the outer side selected from either fixed row is not uniform.

The distinction is source-level, not metric.  A fixed-image row comes with a
source selected by the retained `CriticalShellSystem`.  A global completion
center need not be the blocker of any source; it only needs an actual selected
four-point equal-radius row at that carrier center.  The curvature terminal
does not consume blocker-source identities.

## Exact terminal contract

For each of four arcs the terminal consumes:

1. a carrier center;
2. an actual `SelectedFourClass` at that center;
3. one transported outer arc of that row in a common
   `ShellBoundaryIndexing`; and
4. its strict quarter-turn curvature inequality.

After a common cyclic re-cut and period translation, the four open turn
supports must satisfy one of two checked terminal contracts.

The strict-open-window terminal requires:

```text
windowStart <= a1,
b1 - 1 <= a2,
b2 - 1 <= a3,
b3 - 1 <= a4,
b4 - 1 < windowEnd.
```

The exact full-cover companion instead requires:

```text
a1 = periodStart,
b1 - 1 = a2,
b2 - 1 = a3,
b3 - 1 = a4,
b4 - 1 = periodStart + periodLength.
```

The first contract uses the strict curvature budget below `2 * pi`; the
second uses the exact full-period identity and is checked by
`false_of_fourTurnCoveringSelectedRowArcs`.

No distinct-center hypothesis occurs in `FourTurnDisjointSelectedRowArcs`.
The left and right arcs of the same selected row may both be used when their
turn supports are disjoint.  This broader checked contract is what reduces the
smallest common coarse schema to three selected rows and what the CEGAR oracle
uses as its cut gate.

## Corrected curvature CEGAR

[`run_curvature_cegar.py`](run_curvature_cegar.py) runs a fail-closed bounded
loop on the current exact-four outer encoding.

Primary hard-clause policy:

- `n = 11` only;
- exact-two projection and pair minimality enabled;
- strict-cap minimality disabled;
- the planar and source-checked U5 banks retained;
- only the 10 `KERNEL_CHECKED` Kalmanson schemas retained; and
- all 36 pending exact-Farkas Kalmanson entries excluded.

For every Boolean SAT assignment, the exact rational curvature oracle uses
turn variables with

```text
sum turns = 4,  0 < each turn < 2,
left(row) > 1,  right(row) > 1.
```

The full-turn sum and every turn-bound atom stay fixed during minimization.
Only selected-row inequalities may be deleted.  This corrects the invalid
earlier minimizer that was allowed to delete ambient turn positivity.

If the exact ledger is UNSAT, the driver classifies each four-arc proposal as
exactly `STRICT_OPEN_WINDOW` or `FULL_COVER`.  Pairwise-disjoint cyclic masks
which satisfy neither lifted contract are rejected.  It then banks every
inclusion-minimal selected-row center set supporting a checked terminal.  A
smaller center set subsumes its supersets because fixing a center's selected
row fixes both transported outer arcs.  Each center set is blocked together
with its cyclic/reflected row-assignment orbit.  Terminal kind, raw witness
counts, unique and inclusion-minimal center-set counts, representative lifted
arcs, new orbit-cut counts, and a center-set digest are recorded per model.

An UNSAT ledger with no checked four-arc terminal stops fail-closed as
`UNPROVED_CURVATURE_CORE_NO_CHECKED_TERMINAL`; it installs no cut.  A
curvature-SAT model is replayed exactly and stops the loop.  Boolean UNSAT is
not accepted until a fresh CaDiCaL DRAT proof passes `drat-trim` against the
exact terminal CNF.

Every SAT outer assignment is independently replayed by the semantic verifier,
and every recorded curvature-SAT/UNSAT condition and checked terminal witness
is asserted before publication.  Manifests hash-bind the driver, outer encoder,
semantic verifier, planar/U5/Kalmanson banks, stored seed registry, and both
checked Lean consumers.  Output publication is atomic; a nonempty output
directory is refused.  At a round cap the driver rewrites the final CNF after
the last installed refinement and asserts that its DIMACS clause count, the
in-memory clause count, the manifest clause count, and the recorded cut count
agree.

### Batched seed bank

The 12 stored models are recomputed from their exported selected rows rather
than using only their recorded first witness.  Only center sets carrying an
explicit strict-window or full-cover lift are admitted.  The regenerated
seed bank is:

| quantity | value |
|---|---:|
| stored models | 12 |
| inclusion-minimal supporting center sets | 323 |
| strict-open-window minimal sets | 309 |
| full-cover minimal sets | 14 |
| two / three / four-center sets | 30 / 251 / 42 |
| distinct cyclic/reflected row-tuple cuts | 7,051 |

No count from the superseded unclassified mask-only runs is retained.

These cuts are theorem-backed by one of the two checked four-arc terminals.
The stored models were originally discovered under a broader pending bank, but
each cut depends only on the model's explicit selected rows, the exact
curvature ledger, and its named checked terminal; no pending Kalmanson theorem
enters the cut.

The live primary outputs are:

- `exact_two_opp1_4/manifest.json`;
- `exact_two_opp1_5/manifest.json`.

Their terminal status must be read from those manifests.  Until a terminal
artifact exists, the run is **IN PROGRESS**, not coverage.

Each manifest names and hashes both checked source consumers and their
aggregate curvature theorems:

- `false_of_fourTurnDisjointSelectedRowArcs` for `STRICT_OPEN_WINDOW`;
- `false_of_fourTurnCoveringSelectedRowArcs` for `FULL_COVER`.

When a bounded batch reaches its round cap, `--seed-run-dir` replays every
theorem-backed SAT-to-curvature-UNSAT refinement into a separately named
continuation.  The continuation manifest hashes the earlier manifest and every
replayed result and records the number of genuinely new orbit cuts.  This
preserves expensive learned coverage without mixing two run semantics or
calling a round-cap stop a completed census.

## Universal-minimality regression

[`audit_universal_minimality.py`](audit_universal_minimality.py) exhausts all
`2^11 - 2 = 2,046` nonempty proper carrier subsets of the pinned round-20
three-center/no-gap survivor using its full exported `radius_classes`.

**EXACT FINITE REPLAY:** every proper subset has a carrier center with no
four-member radius class inside the subset.  Every ambient center has exactly
one K4-capable class, that class has cardinality four, and it equals the
selected row.  Therefore universal subset-minimality closure does not remove
this survivor and should not be the next local strengthening.

This remains a statement about one exported Boolean projection, not a
Euclidean realization.

## Aligned follow-up

After the kernel-only exact-two primary terminates, the separately labeled
`aligned_ge3`, opposite-cap-card-5 mode tests the source-faithful aligned arm:

- all three strict first-opposite-cap points lie in the exact class;
- the retained frontier pair is identified, as an unordered pair, with the
  strict-cap pair; and
- the existing second-deletion row continues to avoid that pair.

It is a strengthening with its own manifest.  It is not mixed into the
primary exact-two result.

## Replay

Regenerate and check the finite occurrence census:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-curvature-occurrence-census/census_occurrences.py \
  --output \
  scratch/atail-force/unique4-curvature-occurrence-census/census.json

PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-curvature-occurrence-census/census_occurrences.py \
  --output \
  scratch/atail-force/unique4-curvature-occurrence-census/census.json --check
```

Replay the universal-minimality regression:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline python \
  scratch/atail-force/unique4-curvature-occurrence-census/audit_universal_minimality.py \
  --output \
  scratch/atail-force/unique4-curvature-occurrence-census/universal_minimality_round20.json \
  --check
```

Replay the terminal-classification boundary regression:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-curvature-occurrence-census/regression_open_window_gate.py \
  --output \
  scratch/atail-force/unique4-curvature-occurrence-census/open_window_gate_regression.json \
  --check
```

Run one primary profile:

```bash
PYTHONDONTWRITEBYTECODE=1 UV_CACHE_DIR=/tmp/uv-cache-p97 \
  uv run --offline --with z3-solver python \
  scratch/atail-force/unique4-curvature-occurrence-census/run_curvature_cegar.py \
  --mode exact_two --opp1-card 4 --max-rounds 12 --timeout-seconds 600 \
  --output-dir \
  scratch/atail-force/unique4-curvature-occurrence-census/exact_two_opp1_4
```

## Epistemic boundary

- The occurrence counts and quotient statistics are exact for the twelve
  recorded finite artifacts.
- The scalar curvature oracle is exact QF_LRA for each fixed selected-row
  assignment.
- Every banked four-arc cut is explicitly classified against an existing
  checked strict-window or full-cover Lean terminal, but the CEGAR outer is
  still a finite projection.
- Boolean SAT is a projection survivor, not a Problem 97 counterexample.
- Boolean UNSAT, even with DRAT replay, is coverage only for the documented
  `n = 11` encoding and its independently justified hard clauses.
- No result here proves the required source-level occurrence theorem or closes
  an arbitrary-cardinality Lean branch by itself.
