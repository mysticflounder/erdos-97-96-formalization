# Current-frontier import-and-wire audit

Date: 2026-07-26

Scope: read-only comparison of the current production obligations in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean` against the
cardinality-at-least-fourteen, cap-redesignation, and exact-five gate scratch
artifacts requested for this audit.

## Verdict

**No checked scratch theorem in the audited set is an import-and-wire closure
of a current production `sorry` in `FrontierLiveClosure.lean`.**

There are three distinct reasons:

1. The cap-redesignation theorem is the only exact theorem-statement match, but
   it matches an already checked, non-`sorry` production theorem. The scratch
   copy is stale against the current unique-radius interface and fails a fresh
   compile. Even after the one mechanical interface repair, the proof calls
   `false_of_originalFrontierUniqueRadiusArm`, whose current axiom closure
   contains `sorryAx`.
2. The faithful-carrier escape theorems freshly compile without `sorryAx`, but
   their conclusions are strictly weaker than every current `False` obligation:
   they produce one escaping row, or identify the row at an existing blocker.
   They do not produce the missing critical-fiber alignment or a contradiction.
3. The exact-five all-one card-13/card-14 gate contains no Lean theorem. Its
   checked solver cores are exact only within the recorded finite encodings,
   while all relevant coverage runs remain `UNKNOWN`; there is no source-level
   coverage theorem or reduction from either live exact-five residual.

## Current production frontier

The current file has six textual `sorry`s:

| Line | Production obligation |
|---:|---|
| 76 | `false_of_exactFourPostCardElevenRobustSurface` |
| 106 | `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome` |
| 202 | `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` |
| 213 | `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` |
| 615 | `false_of_localizedCollisionMutualOmissionCycle_exactTwo_and_all_low_hits` |
| 700 | `false_of_retainedInteriorDirectedOmission_and_all_low_hits` |

None of the audited scratch declarations has the exact statement of any of
these six obligations.

The two exact-five obligations consume, respectively:

- a `FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F`,
  including a fixed-`H` exact-five interior frontier, distinct selected
  obstruction centers, and directed cross-deletion survival; or
- a `FirstApexUniqueRadiusExactFiveCommonObstructionCenterResidual F`,
  including a fixed-`H` exact-five interior frontier, a common selected
  obstruction center, mutual cross-membership, its cap location, and the
  no-third-carrier-bisector condition.

The all-one gate does not construct either structure and proves no implication
from either structure to its finite encoding.

## Candidate-by-candidate statement audit

### Cap redesignation

Scratch declaration:

`ATailCardGe14GlobalOccurrence.false_of_exactFiveSecondCap_via_firstOppCapRedesignation`

Its statement is exactly:

```lean
(F : CriticalPairFrontier D S radius H)
(R : FrontierCommonDeletionParentResidual F)
(B : FrontierBiApexRobustResidual R)
(Q : FrontierBiApexRobustExactFiveSecondCapResidual B) :
False
```

This matches the already promoted production declaration
`ATailFrontierLiveClosure.false_of_frontierBiApexRobustExactFiveSecondCapResidual`
at line 285. It does **not** match either live first-apex exact-five residual
obligation at lines 202 and 213.

Fresh compilation of the scratch file currently exits 1. At line 108 it passes
the obsolete argument `hfreshFour` where the current
`false_of_originalFrontierUniqueRadiusArm` interface expects
`OriginalFrontierUniqueRadiusArm freshFrontier`. The promoted production proof
already uses the current interface.

More importantly, the route is not independent. Both the scratch proof and the
promoted production proof dispatch the redesigned fresh frontier through
`false_of_originalFrontierUniqueRadiusArm`. Fresh `#print axioms` on the current
production declarations gives:

```text
false_of_originalFrontierUniqueRadiusArm:
  [propext, sorryAx, Classical.choice, Lean.ofReduceBool,
   Lean.trustCompiler, Quot.sound]

false_of_frontierBiApexRobustExactFiveSecondCapResidual:
  [propext, sorryAx, Classical.choice, Lean.ofReduceBool,
   Lean.trustCompiler, Quot.sound]
```

The `sorryAx` is load-bearing: `false_of_originalFrontierUniqueRadiusArm`
dispatches to the two live exact-five `sorry` leaves and to the exact-four route,
which reaches the two live exact-four `sorry` leaves. Thus this is a checked
coordinator modulo the current frontier, not an independent closure of it.

Fresh compile log:
`cap-redesignation-fresh-compile.log`.

### Canonical `(5,6,5)` faithful-row escape

Scratch declaration:

`ATailCardGe14FaithfulCarrierEscapeScratch.exists_faithfulRow_escape_from_canonical565_of_card_ge_fourteen`

This freshly compiles. Its axiom closure is exactly:

```text
[propext, Classical.choice, Quot.sound]
```

It assumes `14 ≤ D.A.card` and an exact-five second-cap residual and concludes
the existence of:

- a canonical `(5,6,5)` skeleton;
- a `FaithfulCarrierPattern`;
- one selected row center in the canonical carrier; and
- one support point outside that carrier, localized to one of two cap
  interiors.

This is source-clean evidence but not a `False` theorem. It does not identify
the escaping row with an actual selected row of the fixed critical system `H`
at the required critical-fiber center, place both sources of one production
fiber into a second row, or provide the distinct second center needed by a
closing core. No current production `sorry` accepts this existential statement.

Fresh compile log:
`canonical-escape-fresh-compile.log`.

### Faithful escape / critical-fiber boundary

The two production-typed scratch helpers

- `faithfulRow_at_commonBlocker_eq_fiberShell`; and
- `fiberSources_mem_faithfulRow_at_commonBlocker`

freshly compile with axiom closure exactly
`[propext, Classical.choice, Quot.sound]`.

They show that the faithful row at the fiber's common blocker is precisely the
already existing selected critical shell. Consequently, they supply both
sources only at the old blocker center, not at a distinct second center.

The same file's fourteen-label `IncidenceShadow` theorems also freshly compile
with only the standard axioms. They give a countermodel to the desired
incidence-only inference: the shadow has the cap partition, four-point
source-faithful rows, a repeated three-source blocker fiber, and canonical
escape, while proving `no_distinct_row_contains_fiber_pair`. This shadow does
not assert Euclidean realization, MEC geometry, deletion minimality, or a full
`CounterexampleData`; it is obstruction evidence, not a production theorem.

Fresh compile log:
`fiber-boundary-fresh-compile.log`.

### Nonlinear escape geometry

`cardge14-nonlinear-escape-geometry/REPORT.md` records a bounded regression and
explicitly labels the needed terminal-producing contracts
`CONJECTURAL / OPEN`. Its own conclusion is that MEC/cap localization alone
does not supply the missing aggregate occurrence theorem coupling an escape
row to the production critical fiber. It contains no importable Lean theorem
closing a current obligation.

### Exact-five all-one card-13/card-14 gate

`exact5-all-one-card13-card14-gate` contains reports, Python programs, and JSON
checkpoints, but no `.lean` declaration.

The reported evidence is:

- card 13: 2,729 stored cores replay as exact-LRA `UNSAT`, but orbit coverage is
  `UNKNOWN / wall budget` or `UNKNOWN / B0 timeout`;
- card 14 profiles `(5,7,5)` and `(6,6,5)`: every checked candidate is ordinal
  `UNSAT`, but every orbit's coverage remains `UNKNOWN`;
- role-complete unspecialized search: bounded cores followed by `UNKNOWN`;
- the Boolean `UNSAT` result under `g0 = g1 = m` uses a specialization that is
  not a source consequence;
- the isolated source-valid first-apex two-hit cut is `SAT` in all four checked
  card-13 orbits.

Accordingly, this is exact-within-model or bounded-search evidence, not a
coverage theorem, a kernel-checked result, or a proof of either live exact-five
residual. It closes no Lean `sorry`.

## Import reachability

No production Lean file imports any of the audited scratch paths or refers to
their declaration names. The cap-redesignation argument has already been
copied into production under the line-285 theorem; the remaining scratch
theorems have no exact consumer among the six live obligations.

## Trust conclusion

| Artifact | Fresh status | `sorryAx` | Closes a current `sorry`? |
|---|---|---:|---:|
| Scratch cap-redesignation theorem | compile error against current interface | would inherit it through `false_of_originalFrontierUniqueRadiusArm` | No; exact match is already non-`sorry` production theorem |
| Promoted production cap-redesignation theorem | checked | yes | No; coordinator depends on current frontier |
| Canonical faithful-row escape | checked | no | No; conclusion too weak |
| Faithful-row/fiber helpers | checked | no | No; identify only the old blocker row |
| Fourteen-label incidence shadow | checked within abstraction | no | No; negative compatibility evidence |
| Nonlinear escape geometry | regression/report | n/a | No; required contracts open |
| Card-13/card-14 all-one gate | external bounded/exact-within-model evidence | n/a | No; no coverage theorem or Lean ingress |

The highest-leverage missing bridge remains a source-level aggregate occurrence
theorem aligning a card-at-least-fourteen escape row with the actual fixed-`H`
production critical fiber (or directly producing a closing core). The current
artifacts deliberately do not establish that bridge.

