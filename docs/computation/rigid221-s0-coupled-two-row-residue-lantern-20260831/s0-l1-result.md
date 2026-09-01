# Rigid221 S0 coupled-two-row L1 result

**Outcome:** the displayed prior coordinates remain `ROW_CORE_POSITIVE_CONTROL`
with source status `SOURCE_INVALID`. Separate exact rational witnesses now give
`SAT_EXACT_L1_CAP_TWO_ROW_CORE` for both S0-I and S0-N.
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
2. **L1-S0-I:** `SAT_EXACT_L1_CAP_TWO_ROW_CORE`. A distinct exact 13-role
   realization supplies the physical five-fiber, a non-obtuse three-point MEC
   boundary, cap profile `(5,4,7)`, source cap `J`, and both complete four-rows.
3. **L1-S0-N:** `SAT_EXACT_L1_CAP_TWO_ROW_CORE`. A distinct exact 12-role
   realization supplies the same active L1 fields with cap profile `(5,3,7)`.
4. **First second-row distinction:** none in the exact closed row core. Both
   actual four-fibers and both deletion multiplicity checks pass. The first
   exact obstruction is earlier and independent of the second row: the prior
   carrier is in the MEC diameter branch and has no source `SurplusCapPacket`.
5. **L2 `other` and q/w provenance:** exact first-apex finite geometry replays
   for both witnesses with `other=v`, but no total `CriticalShellSystem` or
   instantiated Lean `ExactFourMutualOmissionSourceContext` is claimed.
6. **First source-faithful boundary:** the modeled carriers do not satisfy the
   ambient global `K4` field required by `CounterexampleData`. Conditionally on
   a genuine ambient extension, the next missing fields are the `uPacket` and
   `vPacket` common-deletion packets.
7. **Smallest exact lemma extracted:** for the displayed seed and extension,
   the midpoint disk of `v,xv` is the MEC and has exactly two boundary carrier
   points; hence no three-distinct-boundary circumscribed Moser triangle exists.
8. **Strongest exact witness and gap:** both true-cap L1 finite cores and both
   L2 first-apex geometric extensions are exact. The missing source interface
   begins with a genuine global-`K4` ambient extension and the total structures
   derived from it; these certificates are not theorem counterexamples.

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

## True-cap repair wave 2

**EMPIRICALLY VERIFIED (finite exact replay).** Independent rational replay
accepts two new source-cap/two-row cores. The S0-I witness has 13 roles, MEC
boundary `{O,delta,xv}`, cap cardinalities `(5,4,7)`, and
`J={cu,cv,u,v,xu}`. The S0-N witness has 12 roles, MEC boundary
`{O,delta,xu}`, cap cardinalities `(5,3,7)`, and
`J={cu,cv,u,v,xv}`. In each witness the physical fiber has cardinality five,
both row fibers have cardinality four, the deletion multiplicity maximum is
three, and all edge/nonincident convexity checks are strictly positive.

The supplied ordered non-obtuse dot list needed one presentation correction:
the dots at the ordered Moser vertices are
`(15488/18769,15488/18769,3281/18769)`. The supplied multiset and every
non-obtuse condition were already correct. The independent verifier derives
all nine cap-endpoint membership booleans from the reconstructed caps.

**EMPIRICALLY VERIFIED (finite L2 geometry only).** Exact first-apex extensions
give cap profiles `(5,7,7)` for S0-I and `(5,6,7)` for S0-N, with the proposed
first fibers and modeled blocker geometry. These records instantiate zero Lean
`ExactFourMutualOmissionSourceContext` fields: they do not supply a total
`CriticalShellSystem`, robust-deletion surface, global `K4`, or
`CounterexampleData`. Their status is therefore
`SAT_EXACT_L2_SOURCE_CONTEXT_GEOMETRIC_CORE`, not a theorem counterexample.

**EMPIRICALLY VERIFIED (finite L3 field geometry only).** Adding the exact
`delta` row gives 19-role S0-I and 18-role S0-N packets with cap profiles
`(5,10,7)` and `(8,6,7)`. Both have exact `delta`-row radius squared
`80656/54389`. Independent replay accepts every named finite geometric
predicate abstracted from joint deletion, the robust surface, and singleton
global deletion. It constructs none of the dependent Lean packets. The absolute
missing prerequisites are `D.K4` and a total all-source
`CriticalShellSystem`. After granting an abstract L3 packet over genuine
`D/H/F/R`, the first still-missing downstream field is
`R.minimal : D.Minimal` at the global card-minimal blocking-subdeletion
producer.

**EMPIRICALLY VERIFIED (finite total-system geometry only).** A 28-role S0-I
extension partitions the carrier into seven pairwise-disjoint complete
four-fibers and supplies a modeled shell assignment and deletion-blocking check
for every source. The exact blocker graph contains
`u→cu→fw→xv→cv→fp→xv` and the 3-cycle `xv→cv→fp→xv`. This demonstrates that
total finite `shellAt`/`no_qfree` geometry and a blocker cycle are consistent.
Only 8 of the 28 carrier points are centers of a four-point radius class, so
global `D.K4` fails. Exact replay corrects two supplied values: the cap profile
is `(8,10,13)`, not `(8,7,16)`, and the retained `Kdelta` row is centered at
`xu`, not `fq`.

The source-faithful named seed for a subsequent global-K4 completion has raw
sharp envelope `|B|≤20`. A physical five-class must be represented in
`FaithfulCarrierPattern` by a compatible four-subset. If
`oppApex1=cv` or `oppApex1=cdelta`, compatibility forces the aliased prescribed
rows to coincide and sharpens the envelope to
`|B|≤15-|Ku∩Kv|`. The proper-subset branch yields an actual selected row
centered at some `a∈B` with a support point `z∉B`; it forces no further center
exclusion or cross-incidence.

The first `B=A` CEGAR wave checked three structurally valid S0-N support
signatures in one frozen 18-role label/alias/order cell. All three relaxed
incidence/order formulas returned cvc5 UNSAT. These are exact-signature
enumeration blocks only: the formulas omit the retained MEC, caps, `J`, endpoint
geometry, and complete physical-center exclusions, and the wave provides
neither exhaustive coverage nor bounded UNSAT.

## Completion matrix

| Obligation | Statement | Label | Status | Evidence |
|---|---|---|---|---|
| O1 | The listed twelve roles satisfy the closed row core. | EMPIRICALLY VERIFIED | 🟡 row-core positive control | Exact producer and independent verifier; this is not a source cap model. |
| O2 | The displayed midpoint disk encloses both listed carriers with boundary `{v,xv}`. | EMPIRICALLY VERIFIED | 🟡 partial | Exact rational slacks in both MEC records. |
| O3 | O2 implies that neither listed carrier supplies `SurplusCapPacket.hCirc`. | PROVEN (pen-and-paper) | ✅ done | Diameter lower bound plus the three-distinct-boundary source field. |
| O4 | A different finite carrier supplies every active L1 cap/two-row field for S0-I and S0-N. | EMPIRICALLY VERIFIED | ✅ done | Separate exact witnesses and independent replay. |
| O5 | Every source-legal equality/order/overlap cell is encoded. | CONJECTURED | ⬜ open | Remaining cells are `ENCODING_BLOCKED`. |
| O6 | Either finite witness extends to a genuine global-`K4` `CounterexampleData`, `D.Minimal`, and total shell system. | CONJECTURED | ⬜ open | Finite L3 packet geometry replays, but no ambient global structure is supplied. |
| O7 | Total modeled critical-shell geometry is itself inconsistent with the S0-I finite packet. | EMPIRICALLY REFUTED | ✅ exact model | A 28-role seven-block model replays every finite shell assignment and deletion blocker. |
| O8 | The named rows plus global K4 close within the sharp `|B|≤20` endpoint or force a source-faithful escape. | CONJECTURED | 🟡 residual frozen | `B=A` needs bounded all-center K4 CEGAR; `B≠A` gives only the authenticated escape row. |
| O9 | The first three all-center support signatures in one fixed S0-N `B=A` cell are metrically realizable in the relaxed incidence/order model. | EMPIRICALLY REFUTED | 🟡 scoped blocks | Three cvc5 UNSAT receipts; no coverage or source-level impossibility claim. |

The finite-core satisfiability statements are **EMPIRICALLY VERIFIED**. Any
theorem-level or genuine-source-context conclusion remains **CONJECTURED**
because O5 and O6 are open. The rejection of the two displayed prior seeds is
also **EMPIRICALLY VERIFIED** overall; its logical MEC step is PROVEN from the
externally replayed arithmetic premise.

## Evidence

- `solver/prior-seed-row-core.json` records the exact coordinates, fibers,
  orientation margin, and deletion profiles.
- `solver/prior-seed-mec-obstruction.json` records both exact MEC certificates
  and the source-field obstruction.
- `solver/verify_rigid221_s0_coupled_two_row.py` independently reconstructs all
  rational values and rejects coordinate, slack, and status mutations.
- `solver/s0-true-cap-wave2-witnesses.json` and
  `solver/s0-true-cap-wave2-l2-witnesses.json` retain the exact wave-2
  certificates; their independent verifiers reconstruct the arithmetic and
  reject endpoint, anchor, coordinate, and scope mutations.
- `solver/s0-true-cap-wave2-l3-witnesses.json` retains both field-level finite
  L3 packets; its independent verifier rejects row, overlap, robustness,
  cap-growth, singleton-restoration, and scope-upgrade mutations.
- `solver/s0-total-critical-system-wave1-model.json` retains the corrected
  28-role total-system geometry; its verifier rejects partition, assignment,
  deletion-blocker, orbit, census, discrepancy, and scope mutations.

The result is not a counterexample to the Lean theorem, not L1 UNSAT, and not a
promotion artifact. It rejects the requested starting seed and narrows the next
construction problem to a source-valid MEC/cap realization.
