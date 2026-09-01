# Skeptic audit: Rigid221 S0 coupled-two-row L1 result

## Exact target statement and audited scope

Target: `s0-l1-result.md`, whose headline statement is:

> “principled `ENCODING_BLOCKED` with an exact obstruction to the advertised starting seed.”

The audited scope is the target's seven priority answers, its twelve-role row-core
claims, the two MEC certificates, the source-constraint and role/cell manifests,
the two replay scripts and their focused tests, the retained run record, and the
Lean declarations named by the manifest.  Base HEAD is
`f26de746bc16d15d891c42ad8cfb42876a63ab06`.

## Verdict

**PASS WITH REQUIRED EDITS**

The arithmetic and the finite-carrier MEC obstruction check out.  The report
needs two scope/status edits before it is a fully accurate audit record.

## Claims and evidence

| Target claim | Label | Evidence and audit result |
|---|---|---|
| The twelve listed coordinates realize the physical five-fiber, complete `Ku`/`Kv` fibers, the `2+2+1` traces, strict convexity, and the two modeled deletion multiplicity bounds (target lines 10–14). | EMPIRICALLY VERIFIED | `verify_rigid221_s0_coupled_two_row.py` checks all 12 coordinates, exact closed fibers, all 120 hull orientations, and both post-deletion multiplicity profiles. Independent replay passed; focused tests pass 5/5 and Ruff passes. This is scoped to the listed 12-role carrier, not all source-legal role identifications. |
| The prior 9-role carrier and the 12-role extension have MEC boundary `{v,xv}` with the displayed midpoint and radius (target lines 16–24). | PROVEN; arithmetic EMPIRICALLY VERIFIED | The replay checks every listed slack exactly. The midpoint disk contains every listed role; any disk containing `v,xv` has radius at least half their distance, so the displayed disk is minimal. Equality in the diameter bound fixes its center at the midpoint. |
| The listed carrier cannot supply `SurplusCapPacket.hCirc` (target lines 26–29 and 45–47). | PROVEN for the listed carrier | `PartitionFromMEC.lean:332–343` requires three pairwise-distinct MEC-boundary vertices. The audited certificate has only two boundary roles. The conclusion is conditional on this finite carrier and does not rule out another coordinate realization. |
| Neither L1-S0-I nor L1-S0-N is decided; the prior fixed-order cells are `UNKNOWN_TIMEOUT` (target lines 33–37). | EMPIRICALLY VERIFIED | The retained prior computation record reports both fixed 14-role cells as `UNKNOWN_TIMEOUT`; the current manifests mark all other source-legal orders/overlap/equality cells as unencoded. No SAT or UNSAT claim is made. |
| No Lean or promotion claim is made (target lines 6 and 63–65). | PROVEN as a claim-boundary statement | The run manifest and verifier set `lean_claim`, `promotion_claim`, and both L1 decision booleans to false. The named Lean terminal `false_of_exactFourMutualOmissionRigid221_minimalCore` has a `sorry` body at `Rigid221Placement.lean:543–584`; the computation does not consume it. |

## Required corrections

1. **Separate seed rejection from missing encoding.**  The target says
   “`ENCODING_BLOCKED` with an exact obstruction” (line 3) and assigns that
   status to the prior seed rows (lines 33–37).  The exact two-boundary result
   rejects that seed's source ingress; it is not a missing encoder for that
   seed.  Reserve `ENCODING_BLOCKED` for the still-unencoded source-legal L1
   cells, and add a distinct `SOURCE_INVALID`/`REJECTED` status for the prior
   9- and 12-role seed.  Keep “neither SAT nor UNSAT” for the open L1 cells.

   Smallest gap: the two-point certificate already supplies a complete reason
   that this seed cannot inhabit the `hCirc` field.  No additional computation
   is needed to classify the seed as rejected.

2. **Narrow “singleton deletion obstructions.”**  Target line 12 calls the
   replayed profiles “both named singleton deletion obstructions.”  The script
   checks only the finite positive-distance multiplicity bound.  It does not
   check the source singleton packet's center identity, global deletion set,
   restoration field, or minimal-core geometry; the manifest marks those
   source fields separately (G-02–G-06).  Replace the phrase with
   “both modeled post-deletion multiplicity bounds,” and label it
   EMPIRICALLY VERIFIED.  A source-level singleton theorem claim would require
   those omitted fields and a fresh Lean/source bridge.

## Smallest gaps and hidden-assumption audit

- The row-core artifact enforces all 12 roles distinct and fixes one cyclic
  order.  This is an explicit experimental model, not coverage of legal
  auxiliary overlaps, center placements, endpoint identifications, or all
  cyclic orders; the manifests correctly record those cells as unencoded.
- The phrase “actual cap `J`” is valid only after a source-valid
  `SurplusCapPacket` exists.  For this seed, `hCirc` fails first, so the manual
  wedge cannot define the source cap.
- The finite arithmetic does not prove the global S0 theorem or an L1
  impossibility result.  The target correctly declines both conclusions after
  the two status edits above.

## Explicit label audit

| Item | Allowed label |
|---|---|
| Exact midpoint/MEC obstruction for the displayed 9- and 12-role carriers | PROVEN, with arithmetic EMPIRICALLY VERIFIED |
| Closed fibers, orientations, and deletion profiles in the listed 12-role model | EMPIRICALLY VERIFIED |
| Fixed-order timeout and unencoded-cell inventory | EMPIRICALLY VERIFIED |
| New coordinates supporting a source-valid cap and S0-I or S0-N | CONJECTURED |
| Any extrapolation from this model to all source-legal cells | HEURISTIC |
