# FreshThird configured-branch call-6 independent replay (2026-08-08)

Classification: exact fixed-input solver replay; no universal coverage and no
Lean closure.

- Input: `freshthird_cross_row_kalmanson_universal_20260808.call6.core.smt2`
- SHA-256: `f05cc2958df24414d69e835887096cd1d392d759c7bc5790783d0ef0f08f6174`
- Input size: 2,467,036 bytes; 37,124 lines
- Prior result: Z3 `unsat`; cvc5 timeout after 120 seconds
- Independent replay: cvc5 portfolio with four jobs and a 600,000 ms wall
  limit
- Replay result: timeout

The core therefore remains unverified under the two-solver authentication
policy.  It must not be blocked, promoted, or described as a certified metric
cut.  The preserved input makes later replay reproducible without relying on
the mutable `freshthird_cross_deletion_metric_cegar_20260808.core.smt2` path.
