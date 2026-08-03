# FreshThird current CEGAR/artifact audit (2026-08-03)

Scope: read-only inspection of existing scratch artifacts. No solver rerun,
Lean edit, or certificate replay was performed.

## Completed bounded FreshThird residual probes

The repaired n=17 `(6,8,6)` incidence probe is complete but **SAT**, not a
residual closure:

* `round5-general-cegar/artifacts-n17-generic/arms/all.json` records
  `firstNonHit = SAT`, `secondNonHit = SAT`, and
  `equalCrossRowCenters = SAT`.
* `round5-general-cegar/N17-FRESH-THIRD-FIDELITY-PROBE-ROUND5.md` records the
  same three SAT results (2.643s, 3.017s, 2.758s). Its cyclic/metric reruns
  are all `UNKNOWN` (10s global; 5s per arm).
* `round5-general-cegar/N17-FRESH-THIRD-INCIDENCE-ROUND1.md` independently
  records all three residual modes SAT at 30s.

These are fixed-profile external incidence models; they omit arbitrary-n
geometry, full Euclidean realization, and Lean ingress. They provide no
UNSAT cut or theorem closure.

## Current v31/v29 CEGAR status

* `freshthird-cegar-v31-20260802.md` focused tests pass (`9 passed, 7
  subtests`), but the retry artifact
  `round5-general-cegar/artifacts-v31-reverse-hit-two-center-acute/20260803T035819.291975Z-retry-pid6710/`
  has only 3 `unknown` results and 2 `error` results (frozen formula tracker
  allowlist mismatch); no `sat` or `unsat` result.
* `freshthird-cegar-allowlist-repair-20260802.md` reports focused tests pass
  (`10 passed, 7 subtests`), while
  `round5-general-cegar/artifacts-v31-allowlist-repair-canary/20260803T041533.473037Z-retry-pid88456/`
  timed out at the shell wall bound before any durable case result. It has no
  SAT/UNSAT claim.
* The source retry
  `round5-general-cegar/artifacts-v29-c-full-nonapex-shell/20260802T210119.317640Z-retry-pid32065/summary.json`
  is `complete=false`, `counts={"unknown":67}`. The v30 production retry
  `round5-general-cegar/artifacts-v30-production2/20260802T223925.167839Z-retry-pid61925/summary.json`
  is `complete=false`, `counts={"error":67}` due child-contract validation;
  neither is a completed residual round.

## Universal incidence/metric cut check

No universal cut applying to the normalized residual was found. The closest
proposal is documented in `freshthird-kalmanson-audit.md`: a conditional
four-point Kalmanson cut for `equalCrossRowCenters` **only**, guarded by an
extra cyclic order `c < q < u < v` that the FreshThird packet does not supply;
it explicitly does not touch `firstNonHit` or `secondNonHit`. The global bank
audit `freshthird-global-bank-v31-20260802.md` and branch audit
`freshthird-residual-branch-audit-20260803.md` find no source-clean
FreshThird/normalized-residual consumer. The live leaf remains `sorry`.

For context, Round10's eleven DDD `unsat` files under
`round10-full-multiplicity-cnd/artifacts/20260802T202236.997745Z-caplocal-pid44841/`
target the older `retainedOmission_triApexAllLarge_core`, not the normalized
FreshThird residual; `GLOBAL-THEOREM-BANK-AUDIT.md` classifies them as external
solver evidence and **NO-GO** for normalized-residual promotion.

## Verdict

There is a completed bounded residual probe, but it is SAT in all three arms;
the current full CEGAR retries are interrupted/unknown/error; and no universal
incidence or metric cut currently applies to the normalized residual.
