# Results — bounded U3 wave (2026-08-09)

The smoke controls behaved as expected: the known SAT control was SAT in both
Z3 and cvc5, and the contradictory center-alias control was UNSAT in both.

The production wave used 12 configurations: six audit centers
`t0,t1,t2,u,a0,a1` for each alternative.

| alternative | configurations | Z3/cvc5 base | independent validation | proposed property forced? |
|---|---:|---|---|---|
| escape | 6 | SAT / SAT in all 6 | all checks true | none |
| shell | 6 | SAT / SAT in all 6 | all checks true | none |

Escape probes were:

* `escape0` (the escaping point) returns to a named survivor row / canonical
  row;
* the escaping four-point row has a collision of at least three points with a
  survivor row.

Both negated probes remained SAT for every audit center.  Thus this bounded
packet does not force either escape producer.  The exact survivor motif is a
fresh four-point row whose distinguished point is outside the named bounded
support and outside all six survivor rows; the six survivor rows can still
obey pairwise intersection at most two.

Shell probes were:

* at least two points of the critical shell support hit the dangerous triple;
* at least three points hit a named selected row.

Both negated probes remained SAT for every audit center.  The exact survivor
motif is a four-point shell containing q, with at most one dangerous-triple
hit and at most two hits on every named row.  No `ExactOffCircleCore` probe is
promoted: the packet contains no source-entitled `EdgeClosure` producer.

Status: **diagnostic finite SAT, not a closure and not a universal
countermodel**.  No source-entitled CEGAR cut was discovered in this wave.
The missing Lean work is a uniform producer that either forces a canonical
return/collision from the escape skeleton, or supplies shell-to-row/global
incidence and `EdgeClosure` data sufficient for
`false_of_criticalFourShell_exactOffCircleCore`.
