# Profile 0034 source-gauge strict-radius-cell QF_NRA wave (v1)

## Scope and claim boundary

This is a Class C follow-up to
`exactfive-hard-source-swap-profile0034-source-qfnra-piqd-20260903/run-0001`.
It authenticates that completed `TARGET_INCONCLUSIVE` run, replays all four
coarse query artifact trees, and pins the current predecessor producer bytes.
It never resumes, resubmits, or lengthens either coarse target.

The finite named-role quotient has thirteen profile-0034 equality classes.
The two fixed orders are the exact SAT-replayed orders retained by the earlier
order census and then bound by the predecessor QF_NRA run. All hard geometric
assertions come from that source ledger. Universal ingress, source realization,
all-order coverage, and a general-cardinality lift are absent. Every outcome is
therefore theorem-discovery evidence about the four authenticated formulas,
never a Lean closure or source-level nonexistence claim.

## Four-cell case matrix

For each fixed order `parent-z3-mirror` and `parent-cvc5-direct`, split

`dist²(c2,O) != dist²(c2,d)`

into the disjoint strict branches

- `dist²(c2,O) < dist²(c2,d)` (`radius-lt`), and
- `dist²(c2,O) > dist²(c2,d)` (`radius-gt`).

The target keys are the Cartesian product of the two order IDs with those two
branch IDs, giving exactly four target formulas. The source inequality
`dist²(e,d) < dist²(e,a)` remains in every target.

## Source gauge and formula inventory

The source profile fixes `class(c1)=c000` and `class(O)=c001`. Before any SMT
command is serialized, the producer substitutes

- `c000 = (0,0)`, and
- `c001 = (1,0)`.

Consequently each target declares exactly the 22 coordinates of
`c002,...,c012`. It declares no coordinates for `c000` or `c001` and emits no
gauge assertions. The substituted expressions are stored in the semantic
system itself, so current-producer replay reconstructs them rather than trusting
the serialized journal.

Each target has this exact inventory:

- 22 real coordinate declarations;
- 0 gauge assertions;
- 286 strict signed-area assertions, one for every order-respecting triple;
- 13 source circle-row equalities;
- 1 selected strict radius-branch assertion; and
- 1 source strict-distance assertion.

The positive and negative scalar controls retain the predecessor lane's
`SAT/SAT` exact-replay and `UNSAT/UNSAT` discovery checks.

## Custody and replay

The predecessor authentication binds raw and self hashes for its run manifest,
launch, terminal, current producer, and four result trees. It replays all
adapter custody trees and requires the two coarse targets to remain
`UNKNOWN/UNKNOWN`. The successor source manifest includes those predecessor
records, every predecessor result, the current producer, the exact numeral
parser, the maintained PIQD adapter, and this specification.

Each later target uses a fresh named PIQD session per solver through the HTTP
adapter. The runner allows at most four concurrent target workers and defaults
to a 60-second solver budget. `UNKNOWN`, timeout, response loss that cannot be
reconciled, malformed custody, incomplete readback, and solver disagreement all
remain inconclusive and add no semantic constraint.

A SAT answer is accepted only after total exact-rational readback reconstructs
the two substituted gauge coordinates and checks all 286 signed areas, all 13
row equalities, the selected strict radius branch, and the source strict
distance. UNSAT remains `UNSAT_DISCOVERY_ONLY`; this QF_NRA lane has no proof
certificate promotion path.

The prelaunch manifest at
`scratch/runs/exactfive-hard-source-swap-profile0034-source-gauge-split-qfnra-piqd-20260904/run-0001/run_manifest.json`
is create-once and binds the checkpoint base, all current sources, and all
predecessor inputs. At preparation time no solver request has been submitted.
