# ERASE-P4-U/S route scoping (2026-07-12)

> **Status update (2026-07-13):** both scoped P4 branches are closed and pushed
> in commit `652fdfcb`. P4-U and the 128-leaf P4-S fleet are kernel-connected
> through their semantic closure theorems; the exact-pin ERASE target is
> 0/1376 open. Route comparisons below are historical design evidence.

Read-only prover-agent scoping of the two direct surplus erased-pin holes
(`Continuation.lean:183` ERASE-P4-U, `:211` ERASE-P4-S) inside
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`.
Dead-ends check: no ERASE-P4 entry; Clusters 1 ("(Q)", "U2.B ≡ U5-t1") and 6
("u5-mode-a-deletion") bear directly. Stray finding: the `sorry` at
`U5ModeADeletion.lean:81` is inside a module docstring, not a live tactic.

## Hypothesis inventory at the holes

Ambient (both holes): `A hne hconv hK4 hgt hMin S hM44`, the four residual
exclusions `hend1 hend2 hpin1 hpin2`, and
`hcontain : S.NonSurplusMoserCapContainment` (NO surplus-index containment).
Derived in scope: `D : CounterexampleData`, `hDmin`, `hDU2 : U2Statement D`,
`U5DangerousTriple` + `U5SelectedCandidateSkeleton` + exact-count + two
off-circle auxiliaries (`Continuation.lean:150-211`). Assemblable on the
spot: the full `U3FixedTripleAuditFrame` (`U3ToU5Terminal.lean:208`) and
`A.card ∈ {10, 11}` via `surplus_card_le_six_of_convexIndep_K4`
(`CapSelectedRowCounting.lean:765`) — the general-m tail collapses to
m ∈ {5,6}. The proof picks `x` arbitrarily (`Continuation.lean:121`);
choice-of-`x` freedom exists but cannot close the holes alone (intS=3-type
rows pin every admissible `x` at the same center).

## Route A (row-confined classes + Mode A)

Consumer chain to `False` fully committed:
`U3FixedTripleAuditFrame.false_of_rowwiseConfinedQDeletedClasses`
(`U3ToU5Terminal.lean:310`) → `false_of_auditedBadPattern`
(`U5FiniteExtraction.lean:1983`); the A1 variant needs NO Mode A and no U2.
Sole missing input: `RowwiseConfinedQDeletedClasses` (`U3ToU5Terminal.lean:296`)
— six exact x-deleted 4-classes confined to the 8-point support. Zero
producers tree-wide; the dead-ends file identifies exactly this confinement
(`confined_class_exists`) with the consolidated open incompatibility (Q),
whose recorded levers (SOS/Positivstellensatz, free-frame SMT, order-type,
isosceles counting, monovariant descents, topological trapping) are all
closed — do not re-attempt them for this producer. `U5ModeA` also has zero
producers, but is unnecessary (A1).

## Route B (direct surplus-index contradiction)

Template exists (`Base.lean:9290/:9329` non-surplus siblings; index-generic
count decomposition `selectedCount_groupSum_eq_four_of_card`,
`SurplusM44Packet.lean:6812`). Decisive obstruction (PROVEN, constructive,
2026-07-07 row-truth probe, `scratch/erased-pin-row-truth/STATE.md`, gates
G0-G2 passed, independent exact re-verification): exact-rational (5,4,4)
card-10 witnesses (`SO_t2_PuQ1`, `SI_c-s1_Q2vPu`) satisfy ALL FIVE ambient
inputs + `ConvexIndep` + `IsM44` + minimality-at-card-10 and realize both
pins. Hence no sound direct cut exists over the five-input local surface —
`hK4` (K4-everywhere) is load-bearing. The erased-pin bank
(`ErasedPinFixedSeedDFS.lean`) cannot close the holes as-is: its bridge
consumes card-4 ten-label masks at every non-v/w center (same (Q)-flavor
confinement), and at m = 6 violates the matrix's three-surplus-label
constraint.

## Verdicts

**Both holes OPEN-RESEARCH** (concurring with the matrix). Routes A and B
converge: A's rowwise confinement and B's K4-everywhere finite classifier
are the same mathematical content — (Q)-flavor multi-center incidence
closure. The only non-dead-ended instrument in this project is census-style
finite closure at the forced cards {10, 11} (a third classifier instance
alongside K-B-PIN's `CapSelectedNativeClosureSound` and the K-B-END-GENERAL
endpoint lane). CTRL-BANK-PREFLIGHT swept: no existing bank theorem closes
either hole (101 U5-adjacent matches are consumers of the missing payloads
or non-surplus-center closures).

Deciding experiments (dependency-ordered; pre-planned as matrix
ERASE-P3-MAP/-SWEEP, OPTIONAL tier):
1. ERASE-P3-MAP — deterministic map from surplus-side erased-pin shapes at
   card 10/11 to census-554 class codes; validate encoding against the 30
   stored row-truth witnesses (must map to alive/SAT classes).
2. ERASE-P3-SWEEP — CONJECTURED-tier sweep: do existing PROVEN cuts (or one
   new cut) separate every surviving surplus-side pattern under full
   per-center class assignments (where hK4 enters)?
3. If separating: third card-11 classifier lane (canonical labeling →
   incidence conjuncts → native closure soundness → two source consumers),
   card-10 branch via a ten-label sibling of `GeometryProducer.lean`.
   Carries the audited native_decide axiom boundary.
4. Cheap informative probe: attempt exact-rational K4 extension of
   `SO_t2_PuQ1` (expected NO-WITNESS; EMPIRICAL only).

{{NEEDS_ADAM_INPUT}} — committing to the P3 diagnostic lane (and thence a
third classifier instance) is a plan-level decision; note the convergence
with ERASE-P2's missing per-row geometric content
(`docs/audits/2026-07-11-erase-p2-remainder-blocker-audit.md`): all four
K-B-ERASE holes appear to funnel into the same finite-closure instrument.
