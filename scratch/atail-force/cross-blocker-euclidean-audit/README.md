# Cross-blocker Euclidean projection audit

## Result

All `4 × 3 = 12` `CrossBlockerCoincidence ×
GeometricMultiplicityResidual` branches have an explicit rational-coordinate
witness for the named Euclidean projection encoded here.  The verdict is
`EXACT_RATIONAL_WITNESS`: every equality and disequality is checked by exact
`fractions.Fraction` substitution, with no floating-point or nonlinear-solver
trust boundary.

This is **not** a witness for the complete Lean hypotheses and is not evidence
against `false_of_crossBlockerCoincidence`.  It establishes only that the
encoded named-coordinate consequences are jointly consistent in every branch.
Any contradiction must use omitted global structure or a further geometric
consequence of it.

## Live-source map

The audit was distilled directly from:

- `RetainedInteriorBlockerCollision`, including two distinct sources, their
  common first-apex radius, and their common blocker:
  `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:69`.
- `CrossBlockerCoincidence`, the four aliases `A=b1`, `A=b2`, `B=a1`,
  `B=a2`:
  `lean/Erdos9796Proof/P97/ATail/TwoCollisionGlobalProducer.lean:480`.
- the three residual packet structures:
  `lean/Erdos9796Proof/P97/ATail/BlockerMultiplicityGeometry.lean:70`,
  `:115`, and `:161`.
- the exact live terminal parameters, including distinct radii, disjoint
  source pairs, distinct blockers, the two localized cycles, and the retained
  residual:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:7401` and `:7452`.
- the localized common-deletion nonmembership and mutual-omission fields:
  `lean/Erdos9796Proof/P97/ATail/RetainedStrictInteriorPairSelector.lean:423`
  and
  `lean/Erdos9796Proof/P97/ATail/LocalizedCollisionMutualOmissionCycle.lean:131`.

Notation:

- `O = S.oppApex1`;
- `a1,a2 = P.source₁,P.source₂`;
- `b1,b2 = Pρ.source₁,Pρ.source₂`;
- `A,B` are the corresponding common blocker centers;
- `C,t1,t2` are the fresh-third blocker and its sources;
- `x,o` are the outside-fiber source and other outside point.

## Encoded ledger

Each branch checks:

1. `|O-a1|² = |O-a2|² > 0` and
   `|O-b1|² = |O-b2|² > 0`, with the two squared radii unequal.
2. `a1 ≠ a2`, `b1 ≠ b2`, all four sources pairwise distinct, `A ≠ B`,
   and `A,B ≠ O`.
3. `a1,a2 ∈ row(A)` and `b1,b2 ∈ row(B)`, with positive row radii and
   the appropriate center aliases for each source.
4. The selected coincidence alias.
5. `b1 ∉ row(A)` and `a1 ∉ row(B)`, as forced by
   `hLPρ`, `hLP` and the localized packets.  The witnesses satisfy the
   stronger statement that both endpoints of either pair avoid the opposite
   row, so either legal `collisionSource` choice in each cycle works.
6. Residual-specific data:
   - `third`: fresh distinct `t1,t2`, common blocker `C ≠ A,B`, and
     `t1,t2 ∈ row(C)`;
   - `outside-first`: fresh distinct `x,o` and
     `a1,a2,x,o ∈ row(A)`, with `center(x)=A`;
   - `outside-second`: the symmetric four memberships in `row(B)`.
7. Exact-four capacity against all modeled carrier coordinates: every modeled
   point at a modeled row radius (and at either first-apex radius) is
   enumerated, and no class contains more than four distinct named
   coordinates.  In the outside residuals, the four forced row points exhaust
   the corresponding modeled row.

The cap/non-cap fields are used only for their forced named distinctness
consequences; no affine cap realization is asserted.

## Omitted ledger

The probe does not construct or check:

- a complete `CounterexampleData`, convex independence, or the Problem 97
  global distance condition;
- a `SurplusCapPacket`, ordered-cap geometry, cap cardinalities, or the exact
  cap-intersection equations;
- complete four-point supports and unnamed filler points for every exact
  selected class;
- `CriticalShellSystem.no_qfree`, common-deletion K4 packets, deletion
  robustness, minimality, `noM44`, or the tri-apex residual `T`;
- shells for every other carrier source or transitive consequences of those
  global objects.

Consequently, `EXACT_RATIONAL_WITNESS` means “consistent in this explicitly
listed projection,” not “the Lean theorem assumptions are consistent” and not
“a counterexample exists.”

## Reproduction

```bash
uv run scratch/atail-force/cross-blocker-euclidean-audit/exact_12_branch_witnesses.py
```

Generated artifacts:

- `results.md`: compact `4 × 3` result table;
- `results.json`: every rational coordinate, radius, modeled row occupancy,
  alias, check count, and failure list.
