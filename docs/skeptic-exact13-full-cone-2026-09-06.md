# Math Skeptic Audit: exact-13 five-row full cone

Target: `docs/plans/2026-09-05-exact13-quotient-classification-matrix.md`, F6;
`docs/audits/2026-09-06-exact13-full-cone.json`;
`scripts/solve_exact13_quotient_cones.py`.
Date: 2026-09-06.
Verdict: CERTIFIED for the stated finite five-row scope.
Claims audited: 4.

## Findings

### F1: complete finite coverage

- Location: matrix:233.
- Quote: "EMPIRICALLY VERIFIED: all 540 F5 records are classified using all 1,430 strict Kalmanson forms, with the five named rows as the only equalities."
- Stated and supported label: EMPIRICALLY VERIFIED.
- Evidence: pinned F5 input, 270 distinct labelled equality maps, exactly two
  records per group; complete replay checks unique group IDs, exact input-index
  lists and a non-null certificate for every group.
- Verdict: OK for this finite input, not a source-complete universe.

### F2: distance and cancellation counts

- Location: matrix:241–243.
- Quote: "Rational values with every projected gap at least 1".
- Stated and supported label: EMPIRICALLY VERIFIED.
- Evidence: 234 distance and 36 cancellation certificates replayed using exact
  fractions. Distance gaps are crossing minus uncrossed. Cancellation weights
  are nonnegative, sum to one, and have exactly zero projected sum. There are
  468 feasible and 72 excluded records, zero undecided and zero uncovered
  records within F5. No bare UNSAT result supplies a certificate.
- Verdict: OK, including the independent replay receipt below.

### F3: no further cancellation on a feasible unchanged quotient

- Location: matrix:251.
- Quote: "For each feasible quotient, any nonzero nonnegative combination of its strict forms evaluates positively on the retained witness, so it cannot be the zero form."
- Supported label: PROVEN, pen-and-paper conditional algebra.
- Evidence: if each f_i(x) ≥ 1 and λ_i ≥ 0 with some λ_i > 0, then
  (Σ λ_i f_i)(x) ≥ Σ λ_i > 0. A zero form evaluates to zero at x.
- Verdict: OK. This conclusion uses exactly the quotient certified by x;
  it does not persist automatically after adding new equalities.

### F4: scope boundary

- Location: matrix:257.
- Quote: "No all-center survivor, Euclidean realization, live-source occurrence, or general-n conclusion is asserted."
- Supported label: EMPIRICALLY VERIFIED description of the tested scope.
- Evidence: only C0, C1, K, L, T supply row equalities. No global rows,
  coordinates, positivity or triangle constraints are encoded. The report
  scopes its exits to five-row quotients and authenticates the retained input.
- Verdict: OK. No original all-center conjecture is refuted here.

## Reproduction and trust boundary

```bash
uv run --no-cache python -B scripts/solve_exact13_quotient_cones.py --verify docs/audits/2026-09-06-exact13-full-cone.json --require-complete
```

The durable report SHA-256 is
`d5fa74e8a52a9c6bebca28155a1bf190b6b9253f234fb53728c4a10c94f2ac3d`.
Its input SHA-256 is
`4e2c1ff2ce9ec35a51c83f8609d73ce122ffd3b16ce9d4f9787a32557723436c`.

PIQD discovery used Z3; local Z3 use only constructs and serializes formulas.
Exact replay does not call a solver. Feasible and contradictory controls
passed through PIQD. Negative tests reject approximate values, zero gaps,
invalid weights and incomplete coverage. Unsupported readback syntax fails
closed. Per-query runtime records retain query bytes, producer snapshots,
solver readbacks and receipt journals; those discovery logs are not required
for mathematical certificate replay.

The 36 retained cancellation supports have sizes 4–21; nine use unequal
weights. These are producer-selected supports, not minimum-size certificates.
Mining this wave yields no general-n theorem claim or new Lean candidate.

## Scope conflation and upgrade drift

No finite-to-general or five-row-to-all-center upgrade is accepted. F5's
one/two-form residual status is refined only by new F6 certificates. The
live-source coverage obligation remains open. No Lean files were edited or
compiled; no kernel-checked promotion is asserted.

## Independent replay receipt

The read-only `cone_exact_audit` worker independently reconstructed the DSU
and all 1,430 forms without importing the producer's replay routines. Its
final audit checked all 270 groups and all 540 index assignments, reporting
234 distance and 36 cancellation certificates with zero errors. Minimum
distance gap was exactly 1; distance numerators used at most seven bits.
It independently confirmed the cancellation support-size distribution and
the 27 uniform / 9 nonuniform weight split.

All 306 production query records and three smoke records passed independent
query SHA, archived producer SHA, normalized journal SHA/bytes/command-count,
receipt status/result-digest and SAT-value-hash binding checks. Four early
records predate the inline receipt-binding assertion; these passed the same
offline audit. The two archived producer versions remain separate and are
not represented as runs of the later publication adapter.

The local new and prior regression suite passed 34 tests; Ruff passed.
No additional action is required to support the stated finite labels.
Global completion and source coverage remain open research obligations,
not gaps in the narrower certificate census.
