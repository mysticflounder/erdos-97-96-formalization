# N17 FreshThird normalized residual fidelity probe

Date: 2026-08-02.  Scratch-only external Z3 evidence; no production Lean or
plan-document edits.

## Fidelity repairs

`n17_freshthird_incidence_probe.py` now has independent Boolean selectors for
`C.firstSource` and `C.secondSource`, explicit projected C source rows, named
`C_survives_{P,R}` predicates for both `CrossPairDeletionView`s, and positive
`deletion_survives_{Q1,Q2}` predicates guarded by the `sourceRowOmission`
constructor.  The `equalCrossRowCenters` arm is encoded positively: both
cross-row hits and equality of the two C centers are required.

## Commands and results

```text
uv run python n17_freshthird_incidence_probe.py --self-check
PASS (carrier 17, profile 6/8/6, C selectors independent)

uv run python probe_residual_arms.py --timeout-ms 30000
SAT firstNonHit  (2.643s)
SAT secondNonHit (3.017s)
SAT equalCrossRowCenters (2.758s)

uv run python n17_freshthird_incidence_probe.py --run --cyclic-metric --timeout-ms 10000
UNKNOWN (10.077s timeout)

uv run python probe_residual_arms.py --timeout-ms 5000 --cyclic-metric --arm firstNonHit
UNKNOWN (5.032s timeout)
uv run python probe_residual_arms.py --timeout-ms 5000 --cyclic-metric --arm secondNonHit
UNKNOWN (5.032s timeout)
uv run python probe_residual_arms.py --timeout-ms 5000 --cyclic-metric --arm equalCrossRowCenters
UNKNOWN (5.038s timeout)
```

## Artifacts

* `artifacts-n17-generic/20260802T184918Z/result.json`: repaired incidence
  model (SAT; first-non-hit sample).
* `artifacts-n17-generic/arms/all.json`: per-arm incidence census; all three
  normalized residual arms are SAT.
* `artifacts-n17-generic/20260802T184331Z/result.json`: cyclic/metric model
  (UNKNOWN at 10 s).
* `artifacts-n17-generic/arms/firstNonHit-cyclic.json`,
  `secondNonHit-cyclic.json`, `equalCrossRowCenters-cyclic.json`: per-arm
  cyclic runs (all UNKNOWN at 5 s).

The SAT witnesses select C sources `{q1,q2}` (in either order), while Q's
fresh sources can be outside that pair.  In the fixed `(6,8,6)` carrier this
selector set is a directly formalizable finite invariant: indexed-cap
interior minus the four retained collision endpoints is exactly `{q1,q2}`.
The incidence model therefore yields no UNSAT residual arm; the cyclic/metric
refinement did not decide any arm within the bounded timeout.

## Trust boundary

These are bounded n=17, fixed-cap, external Z3 checks.  They omit a full
Euclidean-coordinate realization, arbitrary-cap geometry, Lean ingress, and
universal-n reasoning.  SAT is a concrete model only; UNKNOWN is timeout,
not evidence for satisfiability or contradiction; no result is a Lean kernel
proof or closure of `FreshThirdNormalizedResidualCase`.
