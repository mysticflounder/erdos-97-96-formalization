# Repaired FirstNonHit quotient v2 result

Final four-valued verdict: **UNKNOWN** (`UNKNOWN_SOLVER_DISAGREEMENT`). No SAT
survivor, quotient UNSAT, finite coverage, or universal claim is authenticated.

The source gate and all four dual-engine controls passed. The single permitted
wave then produced a raw Python-Z3 `sat` readback in each of the retained,
common, and common-same-blocker arms. Every exact pinned readback was `unsat`
in cvc5. The independent model validator found 25, 19, and 29 violations,
respectively, including duplicate four-support slots and missing source-row
membership.

The cause is authenticated: Python `z3.parse_smt2_string` represents each SMT
assertion carrying `:named label` as `label -> formula`. The executed driver
called `solver.check()` without supplying those labels as assumptions, so its
hard clauses were optional. cvc5's SMT-LIB driver enforced the assertions. The
executed driver hash and all exact inputs/readbacks are preserved in
`POSTMORTEM.json`.

Per the no-escalation and one-wave instructions, the formula was not rerun.
`wave.py` now contains the mechanical assumption fix behind an idempotent
terminal gate, but that repaired path is explicitly unexecuted evidence.

## Case matrix

| Arm | raw Z3 | cvc5 exact pin | independent readback | verdict |
|---|---:|---:|---:|---:|
| retained | SAT (invalid) | UNSAT | invalid, 25 violations | UNKNOWN |
| common | SAT (invalid) | UNSAT | invalid, 19 violations | UNKNOWN |
| common_sameblocker | SAT (invalid) | UNSAT | invalid, 29 violations | UNKNOWN |

No lazy motif no-good was admitted. There is therefore no core to authenticate
and no clause/coverage conclusion. The clause validator passed its independent
positive and corrupted-row controls and confirmed a zero-record bank.

The provisional unary cap-incidence clause written on the invalid SAT branch is
marked retracted in `EXTRACTED-CLAUSE.json`; the authenticated extraction count
is zero. No equality/NRA follow-up or post-wave Lean search was launched.

This lane is the cardinality-independent **FirstNonHit quotient**. It contains
no Twelvefold pinned endpoint, endpoint distance, or pinned-multiplicity work.
An escalated process-table closeout found no remaining wave, Z3, or cvc5
process.

## Fresh v3 replay readiness

The driver fix is present but unexecuted. Its exact Python-Z3 semantics are:
parse the SMT text, add all parsed expressions, recover every `:named` label,
and call `solver.check(*labels)`. A static audit matched each label to one
parsed implication and one catalog entry: retained 197, common 98, and
common-same-blocker 457.

All nine source hashes, six predecessor hashes, three base-formula hashes, the
schema hash, and the source-validation hash rechecked. These inputs are stable
enough for one **fresh-namespace v3** replay under the conditions in
`V3-REPLAY-READINESS.json`. V3 must not resume v2 or import its invalid
readbacks. This is a readiness statement, not a solver verdict.
