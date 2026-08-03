# V14 terminal authentication

Date: 2026-08-02

Target:
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`

Run:
`artifacts-v14-canary/20260802T113737.684691Z-v11-16-replay-pid37291`

## Terminal result

- The pinned selection contains exactly 16 case IDs, and the result-directory
  case-ID set is identical.
- All 16 Boolean prepasses returned `sat_no_cut`.
- All 16 full QF_NRA calls returned `unknown`, with reason `canceled`, at the
  configured 600000 ms timeout.
- Every result has `complete = false`, correctly recording that no case reached
  a model or proof terminal.
- The driver exited and wrote `summary.json`; elapsed wall time was
  1233.3447091251146 seconds.
- No power-pattern cut was learned in any case.

This round therefore supplies neither a counterexample nor an UNSAT
certificate.  It is an authenticated negative mining result, not a closure.

## Frozen-source and artifact audit

- v14 script SHA-256:
  `7ca615a837c7bbc11d121658d30c4f1555c6c37bf7df7c1b54145ddb1822f33c`
- schema SHA-256:
  `19934fa7e4b16b0b8f6993a515015a86eb1ef65f2be8c8ae24986df12125e417`
- exact-fifteen Lean source SHA-256:
  `2f5bbeef6e7731e6a8052a72b526d3cf11bed874ed59574eb923ff43bdb5e9cc`
- All seven recorded source-contract hashes match the current frozen files.
- All 48 referenced saved artifacts (Boolean encoding, full encoding, and cut
  ledger for each of 16 cases) match their recorded SHA-256 values.
- The pinned source-selection manifest hash matches, and its 16 case IDs equal
  the result set with empty symmetric difference.

## Constraint accounting

- Boolean timeout: 30000 ms.
- Full timeout: 600000 ms.
- Candidate cap: 2000000; learned-cut cap: 256.
- The new packet-B1/profile family contributed 2 assertions in each of the 12
  D-profile cases and 30 assertions in each of the 4 S-profile cases.
- It did not make any of the 16 Boolean shadows inconsistent.

## Consequence

Do not repeat v14 unchanged or merely increase its nonlinear timeout.  The next
round needs a new proved metric/global consequence or a materially different
decomposition of the surviving Boolean models.
