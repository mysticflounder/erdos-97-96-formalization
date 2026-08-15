# Post-run audit

No second CEGAR wave was started.  These are read-only consistency checks over
the completed wave and its frozen artifacts.

- The source-port enumeration before the newer dangerous-p-circle cut produced
  exactly 1,440 pair-overlap-compatible patterns, matching
  `U5AuditLabel.boundedIndexPattern_count`; zero were unclassified by the port
  of `prefilterReason`.
- Full 1,440 reason distribution:
  `unitTriangleOnPCircle=1134`,
  `nontripleEquilateralOnPCircle=216`,
  `equilateralOppositePoint=36`, `equilateralBisector=18`,
  `commonBisectorTriple=18`,
  `equilateralCircumcenterOnPCircle=12`,
  `equilateralOuterPoint=6`.
- Applying the licensed dangerous-p-circle intersection cut leaves 468
  patterns; zero are unclassified.  Their distribution is recorded in
  `RESULTS.md` and `finite_nogoods.json`.
- All eight SHA-256 source snapshots still matched the files on disk after the
  run.  The generated no-good-bank and case-matrix hashes matched the manifest.
- There were 24 primary solver invocations, strictly sequential.  Maximum wall
  time was 0.391 seconds, with zero timeouts and zero nonzero exit codes.
- Sixteen SAT model readbacks (eight SAT cases times two engines) were present;
  all sixteen passed the independent finite checker.
- All solver stderr artifacts were empty.

These checks validate artifact consistency only.  They do not promote the
finite diagnostic to a Euclidean realization, counterexample, universal
statement, or Lean proof closure.
