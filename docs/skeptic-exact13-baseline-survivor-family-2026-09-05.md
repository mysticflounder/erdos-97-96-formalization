# Math Skeptic Audit: exact13 five-row survivor producer

Target: `scripts/check_exact13_baseline_survivor_family.py` and its new
finite-family claims in matrix section F5.
Date: 2026-09-05 Pacific.
Verdict: CERTIFIED for the finite computational scope only.
Claims audited: 4.

## Summary

The producer and reused finite enumeration were read. The scope is five rows
with fixed K/L/T in one chart. Replay exhausts all 10548 admissible labeled
base/blocker records, retaining 540 without a one/two-form cancellation.
The report is not a feasibility certificate for the full Kalmanson cone and
does not contain a completed all-center row table. No Lean result is claimed.

## Findings

### F1: exhaustive finite family

- Location: target line 5.
- Quote: "Exhaust the K/L/T family of a retained five-row baseline survivor."
- Stated and supported label: EMPIRICALLY VERIFIED, verdict OK.
- Evidence: `enumerate_family(False, core=CORE, rational_pairs=True)` enumerates
  all possible z, C0 four-subsets, complementary C1, distinct blocker pairs,
  and counts all s0/s1/d choices; canonical completions pass `validate_cell`.
- Scope: 180 support partitions, 10548 base/blocker records, 100308
  source-witness-weighted records. K/L/T and direct order remain fixed.

### F2: all residual records retained

- Location: target line 22.
- Quote: "Retain every baseline-surviving base/blocker record, no filler globals."
- Stated and supported label: EMPIRICALLY VERIFIED, verdict OK.
- Evidence: callback receives every classified base/blocker record and retains
  exactly those without a one/two-form exit; report replay recomputes the full
  list, not just its count. Counts are 9746 one-form, 262 two-form, 540 residual.
- Scope: only the five base rows are classified; canonical source witnesses
  represent the other witnesses with identical distance-equality data.

### F3: positive rational pair weights

- Location: target line 42.
- Quote: "Arbitrary positive rational weights via primitive integer rays"
- Stated and supported label: EMPIRICALLY VERIFIED, verdict OK.
- Evidence: `primitive_ray` divides by the positive gcd and retains sign. A
  positive two-vector cancellation requires opposite primitive rays; opposite
  rays supply a positive rational cancellation. The scan detects each pair
  when its later vector is encountered. Zero vectors are tested separately.
- Scope: all 1430 strict forms, at most two nonzero weights. No claim about
  cancellations with three or more forms is made. A separate scan found zero
  additional rejections of the 540 unit-weight survivors using unequal weights.
- Independent audit: a separately rebuilt DSU/form-vector scan checked all
  772200 projected instances (540 times 1430), with zero zero-vectors and
  zero opposite gcd-normalized ray pairs.

### F4: no source or all-center closure

- Location: target lines 7-8.
- Quote: "Survivors here have five rows only. No full-cone, metric, all-center, or live-source survival is asserted."
- Stated and supported label: EMPIRICALLY VERIFIED scope limitation, verdict OK.
- Evidence: survivor records omit global rows; coverage counters remain zero;
  replay rejects a changed all-center or live-source count.

## Weasel words

No automatic proof-context flags in the audited claims.

## Scope conflation

None in the audited claims. The numerical frontier is a finite-interface
frontier, not a reduction of the live P97 proof frontier. The prior seed is
explicitly identified as pre-existing, not a newly discovered configuration.

## Upgrade drift

No general or Lean-formalized assertion was added. Pair-weight coverage is
stronger than the earlier unit-weight test and has new gcd-normalized replay
evidence in this checkpoint.
