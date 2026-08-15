# Results

## Duplicate-gate result

**STOPPED before encoding or solver execution.**  Direct source verification
found that the two requested new declarations are disconnected from Q:

- the three-location theorem returns only a retained `SelectedClass` pair and
  its deletion/cap facts;
- the opposite-adjacent theorem only identifies that retained selected class
  with `{P.source₁,P.source₂,z,w}`;
- neither statement mentions `Q`, `FreshThirdBlockerFiber`, Q's selected shell,
  or Q's actual center;
- the general fan theorem is universally quantified over an arbitrary
  `SelectedFourClass`, so it does not create the missing FreshThird edge.

The v2 quotient is therefore stronger than v1 only as a detached retained-fan
packet.  It is **not stronger as a test of the live first-non-hit consumer**.
The only source-faithful conclusion available is that the bridge remains
missing.  The query has no honest SAT/UNSAT status in this package.

No Z3, cvc5, exact readback, malformed control, Lean build, commit, NRA, or
second CEGAR wave was run.
