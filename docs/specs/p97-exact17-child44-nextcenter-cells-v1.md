# Exact-17 Child44 next-center cell contract

This contract replaces serial Child45-style model blocking after Child44's
authenticated `SAT` result.  It is a finite discovery and proof-ingress plan,
not an exact-17 closure claim.

The machine-readable manifest is
`census/p97_search/exact17_child44_nextcenter_cells_v1.json`.  It fixes the
Child44 raw root and producer-manifest identities, the CaDiCaL worker identity,
one deterministic conflict limit, and thirteen signed assumption cells.  Cell
`c` consists only of the positive literal `290 + c`; named order remains free.
The legal centers are `0` through `7` and `12` through `16`.  The four omitted
centers are exactly the old row centers `8`, `9`, `10`, and `11`.

The read-only validator is
`scripts/validate_exact17_child44_nextcenter_cells.py`.  It authenticates the
manifest, producer manifest, and all 291,704,790 bytes of the Child44 root.  It
also checks that the root's clauses involving only variables `290` through
`306` are exactly the one seventeen-way positive choice clause, all 136
pairwise negative clauses, and the four old-center exclusions `-298` through
`-301`: 141 clauses with no missing, extra, or duplicate clause.  The focused
adversarial suite is
`scripts/test_validate_exact17_child44_nextcenter_cells.py`.

## Canonical Child44 fixture

Canonical finalization and a separate Child44-only replayer both checked all
5,848,820 parent clauses.  The custody-final SHA-256 is
`b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa`, the
custody-model file SHA-256 is
`2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a`, and the
canonical assignment/model-check SHA-256 is
`5436c27196fd618ed7641c940fb56cfb7ee20a4e0f2c777c171da8e7c45af819`.
The model selects next center `15` and named order `1`, so
`next-center-15` is the positive production canary.

The mandatory wave-only theorem mine found 99 paired source-checked
two-Kalmanson cancellation occurrences, or 396 clauses if banked.  All belong
to the existing generic family; ten other diagnostic records lack a
`SourceRealization` bridge.  Thus this SAT model is already certified
Kalmanson-infeasible, but it produced no new theorem family and does not
authorize Child45.

## Framework boundary

The shared CEGAR wave engine is currently `STATIC_CNF` only.  This lane must not
create another private custody adapter.  The framework extension should add a
closed `ASSUMPTION_CNF` or `INCREMENTAL_CNF` profile whose identity includes:

- the raw parent root and producer-manifest hashes;
- the ordered signed assumption list;
- cell identifier;
- solver name, binary hash, and protocol version; and
- deterministic conflict limit.

Every solve receipt must additionally bind the session journal identity and
continuity.  PIQD canonicalizes a seeded session's DIMACS bytes, so the raw
parent identity and journal identity are distinct, both required facts.

## Result semantics

A `SAT` cell result is accepted for theorem discovery only after independent
replay of the complete assignment against the raw Child44 CNF, the session
journal, and the cell assumption.  The decoded assignment must pass the
source-semantic checker.  It then receives the complete exact Kalmanson replay:

- linear infeasibility must produce an exactly replayed positive weighted
  Kalmanson certificate before a learned clause is admitted;
- Kalmanson feasibility transfers that model to Euclidean EDM/Ptolemy
  realizability and forbids another Kalmanson-only refinement.

An incremental `UNSAT` result is discovery evidence.  Promotion requires a
static handoff that materializes the exact parent-plus-unit CNF, a fresh
proof-producing solve, independent proof replay, and a named Lean cell theorem.
`UNKNOWN` leaves the cell open and must retain the conflict-limit receipt.

## Public SAT replay seam

The maintained callback is
`census.p97_search.exact17_source_model_replay.replay_child44_assumption_sat`.
Its closed interface accepts only an exact native absolute parent path, a
builtin total 308-literal tuple, one reviewed cell identifier and singleton
assumption, and the fixed Child44 parent SHA-256.  It accepts no callbacks,
alternate variable maps, solver fallbacks, PIQD access, or publication path.

The callback streams and evaluates all 5,848,820 clauses without loading the
291 MB root into memory.  It then inverts the Lean atom map and independently
checks every `SourceModel` field.  Its Kalmanson stage constructs all 4,760
strict atoms modulo the selected-row equality closure.  In-process Z3 may
propose rational data, but is not an authority: the standalone
`verify_exact17_kalmanson_proposal` function imports and calls no solver.  It
replays a feasible witness using exact `Fraction` arithmetic, or clears and
checks nonnegative Farkas weights before calling
`producer_bank.certify_weighted_kalmanson_cancellation`.
The standalone verifier establishes only this exact metric classification for
its structurally checked decoded object; production source custody still
requires the combined callback.  `KALMANSON_FEASIBLE` likewise means only that
the quotient-distance variables satisfy the Kalmanson system.  It makes no
triangle, EDM, coordinate, or Euclidean-realizability claim.

An end-to-end replay of the canonical Child44 `next-center-15` fixture passed
all parent clauses and source predicates.  It returned
`LINEARLY_INFEASIBLE` with two positive terms.  The source-model SHA-256 is
`60f04afd571ffc7de346c14f4c243bbdcc16dc78bea864994763943355439588`, the
complete Kalmanson-system SHA-256 is
`6d77cb8563c76af4445d3da73d6892ee44c24b898b931211852200dd29236c77`, the
exact weighted-evidence SHA-256 is
`61187759cbf51ddae1371e9e8755ce5cb27de42cf426ef24f7daa6cc867c9c6f`, and the
closed replay-result SHA-256 is
`d995b8cb5b8b3599c3f2902fea6a546c207e07da7f5f7dcf63a766543a15f10d`.
These hashes authenticate the replay implementation's current output; they do
not close a cell or authorize a learned clause without the shared campaign's
separate source-clause admission step.

That admission step is now banked in
`BlockerVExactSeventeenFortyFourthModelRefinements.lean`.  The exact replay
reduces the canonical model to the two weight-one Kalmanson terms
`innerOuter (0,1,2,11)` and `adjacentSides (0,2,8,12)` in selected-order
coordinates.  One checked `CancellationOccurrence` records the five required
row equalities and emits four guarded clauses (two named orders times two
orientations).  Its source-assignment theorem extends the authenticated
Child44 root from 5,848,820 to 5,848,824 clauses.  A direct Boolean replay
confirms that the order-one/forward clause rejects the authenticated Child44
assignment.  This is a source-valid model refinement, not a cell verdict: the
extended root still requires export, custody validation, and a fresh solve.

## Coverage and terminal composition

The source theorem candidate `legalNextCenterLabels` is the explicit
duplicate-free thirteen-element complement of the old centers.
`SourceModel.nextCenter_mem_legalNextCenterLabels` supplies the source-total
coverage ingress.  It is now banked in
`BlockerVExactSeventeenSourceNormalForm.lean`; LSP diagnostics and the targeted
module build pass.  Its literal axiom closure is `propext`,
`Classical.choice`, and `Quot.sound`.

The terminal coordinator may close exact 17 only after every one of the
thirteen cells has an independently replayed static `UNSAT` theorem.  It cases
on the source model's checked next-center membership and applies the
corresponding cell theorem.  Counts of SAT models, learned clauses, or timed-out
cells do not substitute for this coverage.

## Canary result

Session `8d9b5463-5ebf-4707-bdc7-3367af9cb530` tested assumptions `290` and
`307` and returned `UNKNOWN` at 1,200,000 ms.  This was a strict two-literal
subcell used to qualify plumbing, not one of the thirteen production cells.  It
showed that short serial wall-clock sweeps are not useful and that session
canonicalization must be authenticated explicitly.  The first framework canary
should instead use the manifest's deterministic conflict budget across a small
parallel subset, including cell `next-center-15`, which is the canonical
Child44 positive fixture.
