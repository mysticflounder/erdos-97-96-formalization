# Results

## Terminal verdict

`UNKNOWN`.

- Known-SAT control: Z3 SAT, cvc5 SAT; the explicit rational witness was also
  checked directly, with minimum squared separation 1 and K0 radius squared 1.
- Malformed-UNSAT control: Z3 UNSAT, cvc5 UNSAT.
- Stage 1, exact 13-row packet: Z3 timed out at 30 seconds; cvc5 `--nl-cov`
  reported interruption by its 30-second internal timeout.
- The independently generated Z3 and cvc5 stage-1 SMT-LIB files are
  byte-identical (SHA-256
  `62c3f013c1310e2c95e686060f5e1fcbc94019641edd0b1c60b02f7c7f165338`).
- Stage 2 was not launched because no exact source-backed boundary/cap-order
  assumption was supplied. No relaxation cut was admitted.

The naïve algebra count is 30 geometric DOF after the similarity gauge and 39
row equalities, a deficit of nine if the equations were independent. The dual
timeout gives no evidence of SAT or UNSAT; timeout escalation is forbidden for
this canary.

## Authentication and claim boundary

No stage-1 model was returned, so there is no model readback to authenticate.
The controls do authenticate the encoder's positive and malformed-negative
paths. This run does not establish a P97 counterexample, a universal theorem,
a Lean result, or a finite-to-universal lift.

## Wave-data-only general theorem mine

Reviewed only this canary's controls and terminal solver records. There is no
survivor, minimized UNSAT core, recurring pattern, or invariant from which to
state a general theorem. The only stable observation is computational: this
single 39-equality system is unresolved by both selected QF_NRA engines at the
fixed 30-second budget. No theorem-bank or prior-wave search was performed.
