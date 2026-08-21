# Exact-12 surplus-S3 / role-cycling closure-gap measurement (2026-08-20)

Status: EMPIRICAL throughout, exhaustive within the stated abstractions.
This is agreed action 1 of
`docs/exact12-v24-survivor-structural-analysis-2026-08-16.md`, S3 residue:
the Klein widening was measured 2026-08-16 and the surplus-S3 shape was
flagged `{{NEEDS_RESEARCH}}`.  This measurement covers the full
role-reassignment widening, which contains every S3 cycle, so the S3
question is answered as a labeled slice of a complete measurement.

Script: `scratch/rigid221-sourceheavy-anchor/core-pair/measure_s3_role_cycling_gap.py`
(read-only).  Harness validated against the frozen center-exchange bank
pins widened=19,612 / strict=15,588 / delta_realizable=2,546 before any
measurement ran.  Survivor input: the v26 canary workdir
`scratch/runs/exact12-rigid221-all-order-common-five/canary-v14-20260818/artifacts/workdir/survivor.json`
(job `7f45a3e4…`, classification `UNADMITTED_STRUCTURAL_SURVIVOR`).

## Part 1 — no orientation widening can block the v26 survivor

For each of the 8 realized common-five instances the v26 mine classified
unoriented, take every role reassignment of its five labels that passes
the side conditions AND whose membership rows hold in the survivor cube.
A widened family blocks the conjunction of its variants' memberships, so
membership-valid variants are exactly the variants such a family could
use against this model.  Findings, exhaustive over all 120 permutations
per instance and all 48 canonical orders:

1. Every instance has exactly 2 membership-valid variants: the base
   assignment and its x<->y twin.  No a<->b image, no S3 cycle, and no
   other reassignment has its rows realized in the survivor.
2. Every instance fails orientation at 12 or 24 of the 48 orders (four
   instances at 12, four at 24), split evenly between direct and mirror
   orientations.
3. Instances coverable by any role-cycling widening: **0 of 8**.

Consequence: no per-order orientation-disjunction widening of the
common-five shape — Klein, surplus-S3, or any other subgroup of role
permutations of the realized labels — can block the v26 survivor.  The
survivor does not escape through an uncovered symmetry class of a
coverable pattern; it escapes because its realized memberships support
only the 2-variant family, and that family is genuinely unorientable on
a quarter to a half of the deck.  This closes the v24 prediction for
v26: the a<->b Klein branch was refuted for v25 on 2026-08-16, and the
surplus-S3 branch is now refuted for v26.

## Part 2 — the S3 gap class is real, and it is the entire gap

Over all C(12,5) = 792 unordered five-label sets, count the sets that
are fully-widened orientable at all 48 orders (variants restricted to
side-condition-valid assignments with realizable rows on the frozen
candidate surface) while no assignment in the orbit is admissible for
the per-pattern orientation families (strict, center-exchange — the
same convention as the 2026-08-16 Klein measurement; the installed
chain also holds label-class-scoped membership families this filter
does not replay, so this is an upper bound on the true uncovered gap):

- gap five-label sets: **36 of 792**;
- surplus-S3 slice (sets containing all of {3, 4, 5}): **36 of 36**.

The gap class is exactly the sets containing the full surplus triple
(C(9,2) = 36), and nothing else.  The predicted surplus-S3 class exists
and is the only fully-widened gap class.  The v26 survivor holds no
instance of it: none of its 8 realized instances' label sets contains
all of {3, 4, 5}.

## Reading

The two parts together sharpen the strategic picture from the
2026-08-20 constraint audit.  A 23rd orientation-family bank targeting
the S3 class would install clauses the current survivor never touches
(part 2), and no orientation family of any symmetry class can touch it
(part 1).  Within the common-five vocabulary the remaining leverage is
not orientation widening; it is either a genuinely different certificate
vocabulary or the geometric residue named by CD12.

Not established here: anything about models other than the one v26
survivor; whether a non-orientation (membership-only or multi-instance)
family could block it; terminal UNSAT; aggregate arm coverage.
