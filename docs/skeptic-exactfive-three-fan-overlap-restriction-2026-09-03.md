# Math Skeptic Audit: exact-five three-fan overlap restriction

**Target**:
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctThreeFanCollision.lean`
and `docs/plans/2026-09-03-exactfive-three-fan-overlap-restriction.md`

**Date**: 2026-09-03

**Verdict**: **CERTIFIED**, for the Lean theorem and its stated conditional
source branch only

**Claims audited**: 6

## Summary

`RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_restriction`
is a kernel-checked pointwise restriction with the stated conclusion. Its case
split and negation handling pass exactly the distinctness facts required by the
previously audited three-fan contradiction. The final continuation constructor
supplies all three positive prefix incidences, so the theorem is directly
applicable there.

An independent scan of the authenticated 2,798-profile branch-four terminal
finds exactly 28 previously unresolved profiles that violate this restriction:
20 have `SAT/SAT` status and eight have `SAT/UNKNOWN` status. This is exhaustive
within that finite alias-profile stream and conditional on realizing its named
rows and alias classes in a live final-constructor packet. It is not a live-source
coverage theorem and does not close the admitted broad endpoint.

## Audited state

- Lane base: `8ea1642c2856ca1d31ea6a5475a0e57ee1dde1bc`.
- Review HEAD: `f5c5f1b4565a54f4b6953dc301253a93490c835c`.
- Lean source hash: `4e0fba47c5bc98c053a2a8c5194beb9cc1e8b7d3`.
- Plan hash: `48d43713689582f930105ee10ef80d35e10f2f19`.
- Toolchain: `leanprover/lean4:v4.27.0`.
- The three imported proof dependencies used here did not change between the
  lane base and review HEAD.

## Findings

### F1: The pointwise conclusion follows from the contradiction adapter

- **Location**: `ExactFiveDistinctThreeFanCollision.lean:72-91`.
- **Quote**: “either the second-apex center is absent from the first row, or
  every point shared by the first and blocker rows belongs to the pair formed
  by the retained point and second-apex center.”
- **Stated label**: implicit PROVEN.
- **Evidence present**: Lean theorem
  `RobustApexFourIncidenceContinuationPacket.threeFan_shared_support_restriction`.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The outer `by_cases` tests precisely
  `c₂ ∈ P.surface.row₀.support`. In the positive case, fixing an arbitrary
  common support `s` and negating `s = a ∨ s = c₂` yields `s ≠ a` and
  `s ≠ c₂`. Line 90 reverses the first inequality to the adapter's required
  `a ≠ s` and passes the second unchanged. The negative case is the left
  disjunct verbatim.

### F2: No hidden geometric premise enters the new proof

- **Location**: `ExactFiveDistinctThreeFanCollision.lean:27-68,84-90`.
- **Stated label**: implicit PROVEN.
- **Evidence present**:
  `RobustApexFourIncidenceContinuationPacket.false_of_threeFan_shared_support`.
- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Reason**: The new theorem delegates only after supplying the adapter's six
  row memberships and two point inequalities. The adapter obtains the six
  distance identities from the three selected rows, derives zero signed area,
  proves the three carrier points distinct, and invokes convex independence.
  No generated order, orientation, cap-block, or solver fact is used.

### F3: Final-constructor applicability is exact but not yet wired

- **Location**:
  `RobustApexFourIncidenceCyclicReduction.lean:86-106`,
  `Rigid221Closure.lean:1556-1578`, and plan lines 20-27.
- **Quote**: “The immediate consumer is the final constructor inside
  `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.”
- **Stated label**: intended consumer claim.
- **Evidence present**: the fourth constructor exposes `hc₁K₀`, `hOK₁`, and
  `hOK₂` at lines 101-104.
- **Actual label**: PROVEN applicability; intended, not current, call edge.
- **Verdict**: OK WITH SCOPE NOTE.
- **Reason**: Those three fields instantiate the new theorem without any
  conversion. The preceding constructor has `O ∉ row₂` instead of `hOK₂`, and
  the first two constructors retain shorter prefixes. The broad theorem still
  has its admitted proof at `Rigid221Closure.lean:1578`; that file neither
  imports this module nor calls the new theorem. Thus “immediate consumer” is
  a precise planned branch consumer, not a current kernel edge.

### F4: The conditional 28-profile count is independently reproduced

- **Location**:
  `scratch/runs/exactfive-hard-source-swap-order-piqd-r2-20260902/run-0001/`
  and `exactfive_hard_source_swap_grid.py:232-249,573-735`.
- **Stated label**: conditional finite-profile elimination.
- **Evidence present**: authenticated terminal
  `6baab84ed88abc816965447f9b4f5ce90f62a7c90c8c4e777aa6496e6e62d9e2`
  and the repository's exact terminal verifier.
- **Actual label**: EMPIRICALLY VERIFIED — exhaustive within the authenticated
  2,798-profile alias abstraction; the per-profile contradiction is PROVEN
  after a live packet realizes the named row and alias data.
- **Verdict**: OK WITH SCOPE NOTE.
- **Reason**: The audit recomputed the launch and terminal self-hashes, matched
  the current 2,798-profile stream to every launch profile hash, and ran
  `verify_terminal_directory` on all 28 relevant profile directories. The
  finite predicate was:
  (1) the class of `c₂` contains `p` or `q`, putting `c₂` in row `T0`; and
  (2) a `p/q` class is also an `s/t` class distinct from the `c₂` class,
  supplying a common `T0/K1` point distinct from `c₂`. Profile validation keeps
  `a` distinct from every `p/q` and `s/t` role, so this point lies outside
  `{a,c₂}`. Exactly 20 such profiles are `SAT/SAT` and eight are `SAT/UNKNOWN`.
  Their indices are
  `1687, 1697, 1700, 1710, 1713, 1716, 1717, 2000, 2010, 2013, 2023, 2026,
  2029, 2030, 2279, 2289, 2292, 2302, 2305, 2308, 2309, 2592, 2602, 2605,
  2615, 2618, 2621, 2622`.

  Another 108 profiles have the same motif but were already `UNSAT/UNSAT`, so
  28 is the exact newly excluded unresolved count, not the total motif count.
  The immutable solver terminal itself remains unchanged.

### F5: Trust closure is clean for the audited theorem

- **Location**: the new theorem at
  `ExactFiveDistinctThreeFanCollision.lean:72`.
- **Stated label**: Lean-formalized PROVEN.
- **Evidence present**: fresh focused elaboration and transitive axiom query.
- **Actual label**: PROVEN — Lean-formalized, under ordinary Lean core trust.
- **Verdict**: OK.
- **Reason**: `lake env lean -M 16384` elaborated the source in 6.03 seconds
  with exit 0 and no diagnostics. `#print axioms` reports only `propext`,
  `Classical.choice`, and `Quot.sound` for both the new theorem and its
  contradiction adapter. A source scan found no `sorry`, named axiom, native
  reduction, `unsafe`, `partial`, `implemented_by`, or `extern`, and no line
  exceeds 100 characters.

### F6: The plan's broad-closure boundary is accurate

- **Location**: plan lines 29-33.
- **Quote**: “It does not close the three earlier missing-incidence
  constructors, prove the remaining condition contradictory, or by itself
  remove the broad admitted endpoint.”
- **Stated label**: open-boundary claim.
- **Evidence present**: the theorem's disjunctive conclusion and the admitted
  broad theorem at `Rigid221Closure.lean:1578`.
- **Actual label**: PROVEN bookkeeping statement about current source.
- **Verdict**: OK.
- **Reason**: The theorem narrows only the fourth constructor. Neither side of
  its resulting disjunction is currently contradictory, and the other three
  continuation constructors are untouched.

## Weasel words

None found in the audited plan claims.

## Scope conflation

None, provided the 28-profile result is always stated as an exact count inside
the authenticated alias abstraction and conditional on a live named-row lift.
It must not be reported as 28 live geometric branches closed.

## Lean sorry graph

The audited theorem and its adapter have no `sorryAx` dependency. The intended
broad consumer remains admitted and no aggregate/spine refresh was run for this
standalone module. This checkpoint therefore makes no publication or broad
endpoint-closure claim.

## Upgrade drift

None. The stronger conditional restriction is accompanied by a new checked
theorem. The finite count is separately labeled and replayed at its exact scope.

## Required before broad endpoint closure

The coordinator still needs to import and apply this theorem in the fourth
continuation case, then derive a contradiction from both remaining alternatives
or split them into strictly narrower on-path obligations. Aggregate build,
fresh kernel-graph/spine checks, final-consumer axiom audit, and the publication
gate remain outstanding.
