# FreshThird first-nonhit: same-blocker × same-blocker exact-17 probe

This directory contains one bounded, source-mapped frozen-assignment probe
for the retained hard packet
`data.sameBlocker × secondInteraction.sameBlocker`. It uses the exact-17
cap profile `(8, 6, 6)`, shared-coordinate Euclidean constraints, global
K4 witness rows, actual-blocker unique-four exactness, cap boundary order,
retained two-arm D44 radius data, and the exact Q/C shared row.

The incidence proposal is SAT and independently passes the local validator.
The metric replay is SAT through the geometry and cap stages, then jointly
UNSAT at `rich_radius_pattern` under Z3 and cvc5. A group-level minimization
also finds UNSAT from only `k4_witness_equalities + rich_radius_pattern`
(97 clauses). A direct five-atom subcore shows what this means: the frozen K4
support at one apex crosses two declared distinct rich-radius arms. The live
packet does not force that support choice or cross-arm incidence. This is
therefore a rejection of one exact-17 assignment, not an exhaustive
source-faithful encoding. It has no cardinality-independent Lean lift and
closes no theorem.

The source-valid SAT gauge control is replayed in exact rational arithmetic.
Four malformed controls are UNSAT under both solver CLIs. Timeouts at the
larger nonlinear intermediate stages are recorded as such; they are not
interpreted as UNSAT.
