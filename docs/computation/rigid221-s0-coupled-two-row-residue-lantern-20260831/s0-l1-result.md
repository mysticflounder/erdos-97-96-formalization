# Rigid221 S0 coupled-two-row L1 result

**Outcome:** `ROW_CORE_POSITIVE_CONTROL` for the displayed coordinates, with
source status `SOURCE_INVALID`; S0-I and S0-N are separately `OPEN`.
**Base HEAD:** `f26de746bc16d15d891c42ad8cfb42876a63ab06`
**Trust:** exact external `Fraction` replay; no solver verdict and no Lean claim

## Exact target

Determine whether the prior single-row S0 coordinate seed extends by the
opposite pair `{v,xv}` and its actual closed-carrier row `Kv`, or exhibit the
first exact obstruction to using that seed in the source L1 packet.

## Main result

**EMPIRICALLY VERIFIED (finite exact replay; row-core positive control only).**
The known twelve-role extension
realizes the physical five-fiber, both complete four-point row fibers, the rigid
`2+2+1` intersections, mutual omissions, all 120 strict convexity checks, and
both modeled post-deletion multiplicity bounds. Thus adding `{v,xv}` and `Kv`
does not create a contradiction in this closed row core.

**EMPIRICALLY VERIFIED (finite exact replay).** The prior nine-role seed and the
known coupled-row extension have the following enclosing-disk certificate:

```text
center = (3526/6749,-215/6749),
radius² = 4900/6749,
boundary = {v,xv}.
```

Every other listed carrier role has strictly positive enclosure slack.

**PROVEN (pen-and-paper, conditional on the exact replayed arithmetic).** Any
disk containing `v` and `xv` has radius at least half their distance. The
displayed midpoint disk has that radius and contains every listed carrier role,
so it is a minimum enclosing disk and its carrier boundary is `{v,xv}`.
`SurplusCapPacket.hCirc` requires three pairwise-distinct MEC-boundary vertices.
Neither listed carrier can inhabit that field, so neither defines the source
cap `J`. The manual wedge label on the old artifact cannot decide S0-I.

## Priority-question answers

1. **Prior seed and extension:** `ROW_CORE_POSITIVE_CONTROL`, with source status
   `SOURCE_INVALID`. Their two-point MEC boundary prevents construction of
   `SurplusCapPacket.hCirc`; the manual cap is not valid.
2. **L1-S0-I:** `OPEN`. The fixed twelve-role cell is
   `UNSAT_FIXED_CELL_EXACT` at the MEC ingress, and the bounded
   coordinate-preserving repair grid produced no non-obtuse boundary triple.
   The previous fixed fourteen-role cell ended `UNKNOWN_TIMEOUT`; other legal
   cells remain unencoded.
3. **L1-S0-N:** `OPEN` for the same reasons. The fixed twelve-role rejection
   applies before the S0 split, but no exact S0-N witness or source-exhaustive
   contradiction is available.
4. **First second-row distinction:** none in the exact closed row core. Both
   actual four-fibers and both deletion multiplicity checks pass. The first
   exact obstruction is earlier and independent of the second row: the prior
   carrier is in the MEC diameter branch and has no source `SurplusCapPacket`.
5. **L2 `other` and q/w provenance:** not reached. The L1 ingress obstruction
   prevents upgrading the old seed, and no different L1 witness exists yet.
6. **First L3 killer:** not reached.
7. **Smallest exact lemma extracted:** for the displayed seed and extension,
   the midpoint disk of `v,xv` is the MEC and has exactly two boundary carrier
   points; hence no three-distinct-boundary circumscribed Moser triangle exists.
8. **Strongest exact witness and gap:** the twelve-role row-core witness is
   exact. The missing source interface is a different coordinate realization
   supporting `SurplusCapPacket.hCirc`, the rotated surplus cap, and actual
   S0-I or S0-N membership, followed by legal equality/order coverage.

## True-cap repair wave 1

**EMPIRICALLY VERIFIED (finite exact replay).** In the fixed twelve-role cell,
`hCirc` fails first because the MEC boundary has cardinality two (`TC-02`).
Independently, conditional on the physical assignment `O = S.oppApex2`, the
single minimized source consequence `TC-03` is refuted by the exact positive
MEC slack `3051/6749` at `O`. Both fixed-cell S0 branches therefore have status
`UNSAT_FIXED_CELL_EXACT` before membership in `J` is reached.

**EMPIRICALLY VERIFIED (finite exact grid exhaustion).** A bounded rational
repair family preserving all twelve coordinates and adding at most two
Moser-only roles produced zero non-obtuse three-point MEC boundaries containing
`O`. This is not an unrestricted contradiction: coordinate deformations,
other rational or algebraic centers, S0-I, and S0-N remain open. The standalone
wave verifier reports `VERIFIED_SCOPED_OBSTRUCTION` and reconstructs no
`SAT_EXACT` witness.

## Completion matrix

| Obligation | Statement | Label | Status | Evidence |
|---|---|---|---|---|
| O1 | The listed twelve roles satisfy the closed row core. | EMPIRICALLY VERIFIED | 🟡 row-core positive control | Exact producer and independent verifier; this is not a source cap model. |
| O2 | The displayed midpoint disk encloses both listed carriers with boundary `{v,xv}`. | EMPIRICALLY VERIFIED | 🟡 partial | Exact rational slacks in both MEC records. |
| O3 | O2 implies that neither listed carrier supplies `SurplusCapPacket.hCirc`. | PROVEN (pen-and-paper) | ✅ done | Diameter lower bound plus the three-distinct-boundary source field. |
| O4 | A different source-valid carrier decides S0-I or S0-N. | CONJECTURED | ⬜ open | No witness or source-exhaustive contradiction. |
| O5 | Every source-legal equality/order/overlap cell is encoded. | CONJECTURED | ⬜ open | Remaining cells are `ENCODING_BLOCKED`. |

Any global L1 conclusion remains **CONJECTURED** because O4 and O5 are open.
The rejection of the two displayed seeds is **EMPIRICALLY VERIFIED** overall;
its logical MEC step is PROVEN from the externally replayed arithmetic premise.

## Evidence

- `solver/prior-seed-row-core.json` records the exact coordinates, fibers,
  orientation margin, and deletion profiles.
- `solver/prior-seed-mec-obstruction.json` records both exact MEC certificates
  and the source-field obstruction.
- `solver/verify_rigid221_s0_coupled_two_row.py` independently reconstructs all
  rational values and rejects coordinate, slack, and status mutations.
- The focused suite has five passing tests and Ruff reports no findings.

The result is not a counterexample to the Lean theorem, not L1 UNSAT, and not a
promotion artifact. It rejects the requested starting seed and narrows the next
construction problem to a source-valid MEC/cap realization.
