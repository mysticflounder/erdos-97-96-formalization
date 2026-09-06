# Math Skeptic Audit: pinned exact-13 global completion

Target: `docs/plans/2026-09-05-exact13-quotient-classification-matrix.md`, G1/G2/G3;
`docs/audits/2026-09-06-exact13-global-completion.json`;
`scripts/solve_exact13_global_completion.py`.
Date: 2026-09-06.
Verdict: CERTIFIED for the stated fixed-family scope; not source coverage or general-n closure.
Claims audited: 6.

## Findings

### F1: outcome and finite coverage

- Location: matrix:271.
- Quote: "EMPIRICALLY VERIFIED solver outcomes, not certified exclusions: all 234 completion systems returned UNSAT through PIQD/Z3, with no UNKNOWN result."
- Stated and supported label: EMPIRICALLY VERIFIED solver outcomes.
- Evidence: all 234 retained query/receipt chains report UNSAT. Independent
  DSU and active-center reconstruction covers exactly 468 distinct F6 records,
  two per group, with no duplicate index or missing group.
- Verdict: OK. No checked UNSAT certificate is claimed for these queries.

### F2: specialized fixed-base encoding

- Location: matrix:277.
- Quote: "The specialized query uses 78 real distances, nine real radii and 108 Boolean support selectors."
- Stated and supported label: EMPIRICALLY VERIFIED encoding description.
- Evidence: independent code/serialization audit confirms 15 base equality
  links, 1,430 strict gaps, nine real-valued ITE cardinality assertions and
  108 selection-to-radius implications: 1,562 assertions and 1,758 commands.
  Supports exclude their center; every missing center selects exactly four
  of twelve labels. No metric or Euclidean constraint is encoded.
- Verdict: OK. The nine missing centers and the base quotient are fixed for
  each query. No symmetry or source-occurrence premise is inferred.

### F3: controls and SAT acceptance boundary

- Location: matrix:286.
- Quote: "SAT acceptance requires exact distance replay, recovery of four-point equal-distance supports and finite-cell validation; solver Boolean model text alone is not accepted."
- Stated and supported label: EMPIRICALLY VERIFIED implementation and controls.
- Evidence: the replayer checks all five rows and all strict gaps, reconstructs
  four-point fibers from exact numeric distances, and invokes the finite-cell
  validator for full-center inputs. Record 0 base-only SAT passed independent
  replay of all 78 values. Record 1 base-only UNSAT agrees with its independently
  replayed 12-form cancellation from F6.
- Verdict: OK. The controls do not constitute an all-center SAT witness.

### F4: partial exact local exclusions

- Location: matrix:303.
- Quote: "EMPIRICALLY VERIFIED finite exclusions: 37 completion systems, covering 74 records, have a missing center at which every one of the 495 four-supports forces a one- or two-form strict Kalmanson cancellation."
- Stated and supported label: EMPIRICALLY VERIFIED finite exclusions.
- Evidence: the separate G2 artifact retains 18,315 certificates, partitioned
  into 17,222 one-form and 1,093 two-form cancellations. The checker verifies
  the active center, canonical complete support list, input-group mapping,
  positive integer weights and exact zero projected residual.
- Verdict: OK under the separately audited G2 replay, not from G1 UNSAT.

### F5: implication from exhausted center to no completion

- Location: matrix:330.
- Quote: "The exclusion argument is conditional and finite: any completion must select one of those 495 supports at the certified center."
- Supported label: PROVEN, pen-and-paper conditional argument.
- Evidence: a completion chooses four distinct non-center labels at that
  center. Its certificate has positive weights on strict positive gaps and
  zero projected weighted sum. Row equalities force the same weighted sum
  of actual gaps to be zero, contradicting positivity.
- Verdict: OK. The argument uses a verified exhaustive support list for that
  fixed base; it asserts no source occurrence or general-n theorem.

### F6: later census supersedes the open certification frontier

- Location: matrix, G3 combined-coverage table.
- Quote: "Total exactly excluded" (234 systems / 468 records).
- Stated and supported label: EMPIRICALLY VERIFIED exact finite closure.
- Evidence: the later independently audited census at `6cde0412c` closes the
  other 197 systems: 195 two-center and two third-center entries. Current
  reconciliation authenticated its report self-hash
  `ef178a1be870dd983c273a1254c99183dbf51e6b9954b9f507fa9272dd3f925c`
  and its source/input pins; all six census tests passed. Full reconstruction
  was already audited in `docs/audits/2026-09-06-exact13-two-center-census.md`
  and was not repeated for this documentation reconciliation.
- Verdict: OK. G2's historical partial counts remain accurate for that run,
  but are not the current combined frontier. The cumulative 10,548-record
  fixed-family exclusion adds F5's 10,008 baseline exclusions, F6's 72
  additional exclusions and these 468 completion exclusions. No stronger
  source universe or general-n claim follows from this addition.

## Independent evidence audit

The read-only `cone_exact_audit` worker reported 3,135 checks and zero errors:
234 group mappings, 468 indices, all 234 production query/producer hashes,
normalized receipt journal hashes/bytes/command counts, empty assumptions,
requested value names, result digests and both control chains. It invoked no
solver. This audits the recorded outcomes and their inputs, not a hidden
proof of UNSAT.

The report SHA-256 is
`aacf7d18b2fa4d856719ca344917c0c3ff324307b807155cbf05c56913dbe2ad`.
The report verifier rejects duplicate or mis-mapped entries and reports
uncovered groups explicitly. It does not certify UNSAT.

All 22 tests passed: seven global-completion, twelve preceding cone and three
obstruction tests. Ruff passed. No Lean was edited, built or promoted.

G2 preserves its original producer fingerprint as provenance. A later checker
replays its exact certificates, using cached raw forms for one-form checks;
the producer fingerprint is not a trust premise of that replay. All external
mathematical helper and input fingerprints remain pinned. The report is
partial: 62 processed systems include 37 exhausted entries, 24 producer
diagnostics without a short local obstruction and one time-limit entry.
Only exhausted entries supply exclusion certificates; 197 systems remain
uncertified by G2.

The independent G2 audit reconstructed all forms and DSUs without importing
the obstruction checker. It reported 78,001 checks, zero mathematical/replay
errors, all 18,315 cancellations valid, and all 234 group mappings consistent.
It confirmed the 37/74 exact-exclusion counts and the remaining 197/394 scope.
Its only provenance observation was the retained producer self-pin predating
the later checker-only changes, as described above; all external pins match.

## Scope conflation and upgrade drift

G1 adds the nine missing rows, but its solver UNSAT results are not promoted
to certified exclusions. G2 separately certifies only the 37 exhausted-center
systems; G3 supplies the remaining exact certificates. No all-exact-13,
all-source or general-n result is asserted. A
short-test survivor is not a full-cone or all-center survivor.
