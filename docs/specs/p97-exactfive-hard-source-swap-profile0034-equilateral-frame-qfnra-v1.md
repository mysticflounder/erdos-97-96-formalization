# Profile 0034 equilateral-frame QF_NRA wave (v1)

## Scope and claim boundary

This Class C successor consumes
`exactfive-hard-source-swap-profile0034-source-gauge-split-qfnra-piqd-20260904/run-0001`.
It authenticates that completed `TARGET_INCONCLUSIVE` run, replays its six
query artifact trees, and pins the committed predecessor producer bytes. It
never resumes, resubmits, or lengthens a predecessor session.

The finite named-role quotient has thirteen profile-0034 equality classes and
two authenticated fixed orders. Universal ingress, source realization,
all-order coverage, and a general-cardinality lift are absent. Every outcome is
theorem-discovery evidence about four authenticated formulas, not a Lean
closure or source-level nonexistence claim.

## Exact coordinate change

The predecessor gauge is `c1 = c000 = (0,0)` and
`O = c001 = (1,0)`. Write each original vertical coordinate as

`y = sqrt(3) * Y`.

For any three points, the original signed determinant is `sqrt(3)` times the
determinant in `(x,Y)` coordinates. Because `sqrt(3) > 0`, the strict sign is
preserved. For any two points, the original squared distance becomes

`dx^2 + 3*dY^2`.

These identities establish both reconstruction directions. Given original
coordinates, set `Y = y/sqrt(3)`; every determinant sign and squared distance
is translated by the identities above. Given frame coordinates, set
`y = sqrt(3)*Y`; the same identities recover the original determinant signs
and squared distances. The focused tests check both polynomial identities
symbolically, including the two coordinate maps.

## Forced apex frame

Let `a = c003`. Two predecessor row equations say

- `dist^2(O,a) = dist^2(O,c1) = 1`, and
- `dist^2(c1,a) = dist^2(c1,O) = 1`.

Writing `a = (x_a,Y_a)` in the new coordinates gives

- `(x_a-1)^2 + 3*Y_a^2 = 1`, and
- `x_a^2 + 3*Y_a^2 = 1`.

Subtracting forces `x_a = 1/2`; substitution then forces
`Y_a^2 = 1/4`. The authenticated order determines the sign:

- `parent-z3-mirror` contains the ordered triple
  `(c000,c003,c001)`, whose determinant is `-Y_a`, so `Y_a=-1/2`;
- `parent-cvc5-direct` contains the ordered triple
  `(c000,c001,c003)`, whose determinant is `Y_a`, so `Y_a=1/2`.

The producer therefore substitutes `c003` completely. The two anchor row
equations are now true by direct rational calculation and are removed from the
emitted equality list:

- row `T0`, other support role `c1`; and
- row `K1`, other support role `a`.

No other row equation is removed.

## Four cells and exact inventory

The existing `lt` and `gt` radius cells remain for both fixed orders. The
source strict inequality `dist^2(e,d) < dist^2(e,a)` remains in every target.

Each target has exactly:

- 20 real coordinate declarations for the ten unfixed classes;
- 0 gauge or frame assertions;
- 286 strict signed-area assertions, retaining metadata for every ordered
  triple, including the now-constant anchor triple;
- 11 emitted source row equalities;
- 1 selected strict radius assertion; and
- 1 source strict-distance assertion.

Thus each target emits 299 assertions after 20 declarations. All distance
expressions use `dx^2 + 3*dY^2`; all area expressions use the determinant in
`(x,Y)` coordinates.

## Custody, controls, and replay

Predecessor authentication binds raw and self hashes for its run manifest,
launch, terminal, current producer, and six results. It replays all adapter
trees and requires every predecessor target to remain `UNKNOWN/UNKNOWN`. The
successor source manifest includes those records, every predecessor result,
the current producer, exact numeral parser, PIQD adapter, this document, and
the authenticated run-0001 failure receipt.

The positive and negative scalar controls retain exact SAT replay and
discovery-only UNSAT checks. Every target uses fresh named PIQD sessions, with
at most four concurrent target workers and a default 60-second solver budget.
No direct solver or fallback path exists.

A SAT answer is accepted only after total rational readback reconstructs
`c000`, `c001`, and `c003`, then checks all 286 determinant signs, all thirteen
source row relations under weighted distance, the selected radius branch, and
the source strict distance. An algebraic solver value that the exact rational
parser cannot represent is rejected as inconclusive. UNSAT remains
`UNSAT_DISCOVERY_ONLY`; `UNKNOWN`, malformed custody, incomplete readback, and
solver disagreement remain inconclusive.

## Failed run-0001 and repaired run-0002

Run-0001 submitted only `control-positive`. Z3 and cvc5 both returned SAT and
passed exact semantic replay. The runner then exited 1 inside
`verify_adapter_tree` because it tried to read the absent Python attribute
`predecessor.frozen_order`. It had not submitted `control-negative` or any of
the four target queries.

The compact receipt at
`docs/audits/2026-09-04-profile0034-equilateral-frame-run0001-failure-receipt.json`
binds the old producer commit and source hash, manifest and launch hashes, the
self-hashed abort record, the positive result, and one aggregate over all 34
positive-control artifacts. Every claim remains false. The full failed tree
was moved without deleting bytes to
`scratch/quarantine/exactfive-hard-source-swap-profile0034-equilateral-frame-qfnra-piqd-20260904-run-0001-aborted`.
It is not an active or resumable run.

Run-0002 owns the repaired launch path. The producer now checks SAT, UNSAT,
UNKNOWN, and receipt-reconciled artifact label families with a local validator;
it has no dependency on an unbound helper attribute. Run-0002 creates fresh
sessions and does not reuse the failed positive-control sessions.

The create-once prelaunch manifest is
`scratch/runs/exactfive-hard-source-swap-profile0034-equilateral-frame-qfnra-piqd-20260904/run-0002/run_manifest.json`.
It repeats the lane checkpoint base and binds current source, the failure
receipt, and predecessor input bytes. It contains no solver output.
