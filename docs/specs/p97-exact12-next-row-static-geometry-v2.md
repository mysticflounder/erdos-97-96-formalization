# Exact-12 nextRow static geometry v2: implementation and promotion contract

Date: 2026-08-10

Status: this historical v2 compiler contract is implemented and has been
superseded by the downstream v17 bank checkpoint recorded below. The current
source theorem, auxiliary valuation, exact CNF binding, and focused regression
are green; terminal UNSAT, aggregate coverage, a general-cardinality lift, and
live `sorry` closure remain open.

## Current v17 checkpoint

The v17 canary returned `SAT_WITNESS_REPLAYED` and was classified
`STRUCTURALLY_UNRESOLVED`. Mandatory theorem mining selected a 24-role,
source-clean apex-first/surplus/second common-five family covering all 48
source orders by common-five. The Lean source theorem and CNF binding are
`ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveCertificate.lean` and
`ExactTwelveRigid221ApexFirstSurplusSecondCommonFiveMembershipFamilyCnf.lean`.
The new bank has 45,277 variables and 643,379 clauses, with DIMACS SHA-256
`18f09d0b8a854cfbe0783c6f84130366dc90011b25ce816eaeb8cdd5b8000ea8`. With
the arm and order suffixes, the final formula has 644,327 clauses and DIMACS
SHA-256
`57bfa7269a86b09ad2f63b5c882145fd3f55b77e31da866b227e2663f48c740b`.
This is theorem-bank refinement, not terminal UNSAT, general-n closure, or
live closure. The source theorem and exact CNF binding pass the governed Lean
build and explicit no-`sorryAx` audit; the 6-test bank suite and 10-test v5
fake-solver runner suite pass, and Ruff is clean. The unknown-variable fallback
is fail-closed on every `FrozenSafeCubeOK` row by a checked center-not-in-row
proof. No successor solve is authorized before this checkpoint is committed
and pushed; publication authorizes at most one canary under the SAT-to-mining /
UNSAT-to-RUP stop rule.

## Closure objective

Close the exact-12 `nextRowOnlyHit` child beneath
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
through a source-faithful finite formula, authenticated proof-producing
terminal solve, and kernel-checked Lean ingress. Version 2 preserves the whole
v1 formula byte contract and appends the generic equilateral-bisector family
exposed by the first v1 canary.

The lane is closed only after all of the following hold:

1. the live geometric source determines a satisfying assignment of every base
   and auxiliary variable;
2. Lean proves every v1 and v2 static clause under that assignment;
3. every dynamic clause has its existing typed source-order consumer;
4. the exact terminal formula has a checked DRAT/RUP proof;
5. the Lean replay formula is definitionally or proved equal to the terminal
   DIMACS clause list;
6. all scheduled exact-12 cells are covered by checked terminal artifacts;
7. the result is wired into the live nextRow child; and
8. a refreshed proof spine and transitive axiom audit certify the landing.

Static compilation, survivor elimination, solver `ITERATION_LIMIT`, green
tests, and a verified terminal proof without the auxiliary valuation bridge do
not close a Lean theorem.

## Why v2 exists

The source/CNF/static replay gates of the first v1 cell-0 canary were green,
but its first model had an
`equality-equilateral-bisector-collision` on five distinct labels. The core
used only four positive selected rows and six paths in row-generated equality
closure. This is not new geometry: the theorem bank already contains

- `Problem97.Census554.EqualityCore.equilateral_bisector_collision`;
- `Problem97.Census554.EqualityCore.not_realizes_of_equilateralBisectorCollisionCore`;
- the Boolean certificate
  `nonempty_equilateralBisectorCollisionCore_of_positiveCheck`; and
- `SourceOrderPositiveNogood.ofEquilateralBisectorCertificate` for the
  heterogeneous terminal-bank consumer.

The generic checker requires `p ≠ a`, `p ≠ x`, and `c ≠ b`, plus equality
closure paths `pa_pb`, `pa_pc`, `pa_ab`, `pa_ax`, `pa_bx`, and `cx_ca`. The v1
canary used five distinct labels, so all side conditions held. Direct source
inspection found no literal `sorry` or `axiom` in this path; transitive
`sorryAx`-freedom still requires the later Lean axiom audit.

Because the theorem is generic and the universe has only twelve labels, v2
compiles the entire family once rather than rediscovering row-choice nogoods
model by model.

## Frozen v2 formula

Python schema:
`p97_rigid221_exact12_next_row_static_geometry.v2`.

Start with the complete v1 extension:

- 66 unordered metric edges;
- 2,145 edge-equality relation variables;
- 18,240 selected-row implications;
- 137,280 transitivity clauses; and
- 7,920 duplicate-center clauses.

For each ordered five-tuple of pairwise distinct labels `(p,a,b,c,x)`, append
one six-literal clause negating simultaneous truth of

```text
eq(pa,pb), eq(pa,pc), eq(pa,ab),
eq(pa,ax), eq(pa,bx), eq(cx,ca).
```

There are `12P5 = 95,040` tuples and 95,040 unique clauses. Version 2 adds no
variables. For cell 0 the frozen materialization is:

- final variables: 44,875;
- final clauses: 626,939;
- v2 clause-delta SHA-256:
  `dc07e3eff4dc21b32d38e4ca8e1225e90210db62ce306e615b01f969fa4bbb9b`;
- final DIMACS SHA-256:
  `c720f44cfd99ad25c01d1dcd1bee62d213c608983e66d04e751958fd94d421dd`.

All clause generation is deterministic and checks count, uniqueness, literal
arity, relation-variable range, and single installation.

## Soundness and replay valuations

Python differential replay uses the minimal equivalence closure generated by
the selected rows. The v2 delta is satisfied exactly when no compiled
distinct-label equilateral-bisector core occurs in that closure. The preserved
v1 canary satisfies all v1 clauses and falsifies a v2 clause; a non-equilateral
preserved witness satisfies both layers.

The eventual Lean ingress uses actual squared-distance equality for the
relation variables. Selected rows prove the row implications, equality proves
transitivity, the duplicate-center theorem proves the v1 obstruction clauses,
and the equilateral-bisector theorem proves every v2 obstruction clause. The
existing certificate theorem proves individual positive-row nogoods; it does
not yet constitute the whole-formula auxiliary-valuation theorem. That bridge
is a mandatory promotion artifact.

## Runner isolation and trust boundary

The fresh runner schemas are:

- run: `p97_rigid221_exact12_next_row_static_geometry_cegar_run.v2`;
- job: `p97_rigid221_exact12_next_row_static_geometry_cegar_job.v2`;
- cut: `p97_rigid221_exact12_next_row_static_geometry_source_order_cut.v2`;
- survivor: `p97_rigid221_exact12_next_row_static_geometry_survivor.v2`.

Its source manifest binds both static compilers, the detector, the generic Lean
certificate, the geometric kernel, and the existing nextRow consumer. Only
cuts from the live-attested 57-entry source-order bank may be appended
dynamically. A duplicate-center or equilateral-bisector hit after SAT replay is
`STATIC_GEOMETRY_INVARIANT_FAILED`; every other structural stage is recorded
but not admitted. The terminal consumer remains null and terminal promotion
status remains `AWAITING_LEAN_STATIC_AUXILIARY_VALUATION` until the Lean bridge
exists. Historical v1 and older runner artifacts are never resumed or mutated.

## Historical v2 execution sequence

This sequence governed the v2 handoff. Later authenticated bank versions retain
the same one-canary stop discipline; the current frontier is the v17 checkpoint
above.

1. **Done:** compile all 95,040 clauses with frozen counts and cell-0 hashes.
2. **Done:** upgrade the fresh runner and source inventory without changing v1.
3. **Done:** differential-test the former canary and a preserved non-equilateral
   witness; focused result is 19 tests plus 12 subtests.
4. Run one fresh authenticated cell-0 canary.
5. If SAT survives, immediately run a general theorem-bank search on the first
   core. Add another static family only when its exact source theorem,
   side conditions, and Lean consumer are identified.
6. If terminal UNSAT appears, rerun the byte-identical formula with proof
   tracing, verify DRAT/RUP, and begin the whole-formula Lean valuation bridge.
7. Expand to the authorized twelve cells only after the one-cell contract and
   theorem-family audit are green.
8. Wire checked all-cell coverage to the live exact-12 nextRow child, then
   refresh the proof spine and transitive axiom report.

## Stop and pivot conditions

Stop computation and produce a theorem when the first survivor depends on a
stage without a source-clean generic consumer, the same untyped predicate
recurs, any source or formula hash drifts, or proof-producing replay disagrees
with discovery. Do not compensate for a missing producer by increasing the
iteration budget.

The exact-12 campaign remains separate from the `card ≥ 13` children. Those
still require a uniform source-level missing-incidence producer or a proved
bounded-core lift; exact-12 UNSAT alone cannot close them.
