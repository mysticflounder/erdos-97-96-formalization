# Rigid221 S0 literal-blocker-`v` midpoint-core control audit

## Status

**EXACT-ARITHMETIC POSITIVE CONTROL; EMPIRICALLY CORROBORATED.** The reduced
56-assertion package has two exact rational realizations, one for each allowed
named cap order.  Fresh PiQD/Z3 sessions also return SAT.  This is not a proof
about every B3 source realization.

## What was checked

- Fraction arithmetic verifies role distinctness, the common positive
  five-circle radius, the unit MEC disk, the exact closed `C3` membership,
  equal distances from `v`, and the two strict directed turns.
- The deterministic SMT-LIB emitter is parsed back by Z3 and rejects a
  deliberately contradictory `False` mutation.
- A direct local Z3 check reports SAT for each emitted cell.
- One fresh PiQD/Z3 session per cell reports `INITIAL_SAT`, then closes after
  its one receipt.  The forward session is
  `0c9c460f-095a-4d48-833b-0bff98ae007c` (6 ms); the reverse session is
  `abb0cf82-d987-431e-94ca-6309acc2f1de` (5 ms).
- Contract tests run the forward formula in two separate Python processes with
  different hash seeds.  This guards the durable formula bytes against an
  unordered collection traversal.  `PHYSICAL` is an ordered tuple for that
  reason.

The focused test suite has six tests and Ruff reports no issue.

## Encoding repair before the recorded PiQD runs

The first PiQD assertion attempt was rejected before solving because Z3's
SMT-LIB export wrote squared distances with `^` and a real exponent.  The
worker reported that spelling as an unknown real operator.  No solver result
or receipt from that malformed input is evidence.  The emitter now expands a
square as an explicit product, and the test suite rejects `(^ ` in durable
formula bytes.  Only the post-repair source, candidate, and receipts listed in
the specification are retained as evidence.

## Result and proof boundary

The first source-directed midpoint relation alone does not create a geometric
contradiction within this core.  A route that tries to close B3 from only this
edge is therefore ruled out for the stated shell.

The B3 source packet still needs a second compatible strict-cap relation from
the opposite row or a next blocker.  The existing ordered-cap cycle terminal
needs three equal-distance/betweenness links, while this control contains only
one.  No Lean source was changed because the positive control supplies no new
source implication.

## Scope exclusions

The control leaves out actual source membership, the full rows, mutual
omission, exact deletion counts, the complete carrier, and the literal
`centerAt(source) = v` assertion.  Its SAT outcome cannot be generalized to
the source packet without separately proving that those omitted facts do not
matter; no such claim is made here.

## Evidence retained

The two run manifests retain the source and specification digests.  Each PiQD
cell retains its direct-emitter report, query-free source, normalized
candidate, driver event record, and necessity ledger under its declared
generated root.  Pre-determinism and pre-portability local trial outputs were
quarantined below the corresponding `tmp/` directory and are not durable
evidence.
