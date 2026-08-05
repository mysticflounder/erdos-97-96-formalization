# P97 D--E exact-five common-surface audit (2026-08-05)

## Scope and status

This is a read-only audit of the two live, load-bearing production leaves:

* `ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual` (D3); and
* `ATailFrontierLiveClosure.false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual` (D4).

Both remain **unproved** (`sorry`) in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1020-1042`.
They are direct consumers of the exact-five alternatives in
`false_of_originalFrontierUniqueRadiusArm` (`Rigid221Closure.lean:1045-1064`),
which is in turn used by the live critical-pair coordinator
(`FrontierLiveClosure/Coordinator.lean:777-791`).

## Immediate upstream surface

`OriginalFrontierUniqueRadiusArm F` is the conjunction

```lean
((SelectedClass D.A S.oppApex1 radius).card = 4 \/
    (SelectedClass D.A S.oppApex1 radius).card = 5) /\
  ∀ rho, 0 < rho →
    4 ≤ (SelectedClass D.A S.oppApex1 rho).card → rho = radius
```

(`OrientedPhysicalApexIngress.lean:226-233`).  From it, minimality,
no-`M44`, and `9 < D.A.card`, the proven coordinator
`firstApexUniqueRadius_residualCases` produces exactly

```lean
Nonempty ExactFourResidual \/
  Nonempty ExactFiveDistinctCentersResidual \/
    Nonempty ExactFiveCommonCenterResidual.
```

(`FirstApexUniqueRadiusResidual.lean:229-241`).  In the exact-five arm it
first constructs `P : ExactFiveInteriorCriticalPairFrontier D S radius H`.
`P` contains a strict-interior, distinct pair in the exact five-class and
simultaneous second-apex double-deletion survival
(`FirstApexExactFiveInteriorFrontier.lean:336-380`, with the private witness
fields at `:96-106`).

The remaining exact-five split is a literal proved `by_cases` on

```lean
H.centerAt P.frontier.pair.q P.frontier.pair.q_mem_A =
  H.centerAt P.frontier.pair.w P.frontier.pair.w_mem_A.
```

(`FirstApexUniqueRadiusResidual.lean:283-361`).  Equality is sent to D4;
inequality is sent to D3.  Thus this is an exhaustive dichotomy, not an
empirical case classification.

## Exact common hypotheses (the E frame)

The two residual structures have the following field-for-field common prefix
(`FirstApexUniqueRadiusResidual.lean:150-169` and `:184-203`):

1. `D.Minimal` and `¬ ∃ T : SurplusCapPacket D.A, T.IsM44`;
2. `9 < D.A.card`;
3. the selected class at `S.oppApex1` and `radius` has cardinality exactly 5;
4. every positive radius with a selected class of cardinality at least 4 is
   `radius`;
5. full first-apex single-deletion robustness;
6. the original frontier pair has no first-apex `K4` after deleting both
   endpoints;
7. a reselected `ExactFiveInteriorCriticalPairFrontier` (hence a distinct,
   strict-interior pair with second-apex double-deletion survival); and
8. the reselected interior pair likewise has no first-apex `K4` after both
   endpoints are deleted.

The coordinator proves all eight before the center test: robustness is from
the exact five-class (`:268-271`) and both double-deletion obstructions are
derived at `:272-282`.

## What differs after the proved center dichotomy

| leaf | additional field(s) | production source |
|---|---|---|
| D3, distinct centers | `χ(q) ≠ χ(w)` and directed cross-deletion survival: `K4(A\\{w}, χ(q)) \/ K4(A\\{q}, χ(w))` | `FirstApexUniqueRadiusResidual.lean:170-181`; survival is proved by `crossDeletion_survives_of_obstructionCenters_ne` at `:348-361` |
| D4, common center | `χ(q) = χ(w)`, mutual cross-row membership, common center in the strict interior and outside the surplus cap, and no third carrier bisector point apart from `a1` and that center | `FirstApexUniqueRadiusResidual.lean:204-225`; all extras are proved at `:286-347` |

In particular, D3 does **not** carry D4's common-row/bisector rigidity, and
D4 does **not** carry D3's directed survival.  Neither leaf's extra fields
are merely an omitted projection of the other; they are the distinct outputs
of the equality/inequality split.

## Existing fixed-cardinality merger

At `D.A.card = 11`, the two leaves already have genuine proved fixed-card
consumers:

* D3: `false_of_firstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual_of_card_eq_eleven` in `Rigid221Closure.lean:982-1017` creates a common-deletion two-center packet from either directed-survival orientation and closes it.
* D4: `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual_of_card_eq_eleven` in `FiniteN11Frontier.lean:138-162` dispatches all four authenticated shell cases.

`false_of_originalFrontierUniqueRadiusArm_of_card_eq_eleven` already merges
the exact-four, D3, and D4 alternatives under that one hypothesis
(`FiniteN11Frontier.lean:165-186`).  Therefore a proof that the live D3/D4
surface has `D.A.card = 11` would genuinely close both through existing
consumers.  It is not currently an available consequence: the common frame
only supplies `9 < D.A.card`; its source/prompt explicitly treats the general
D3/D4 task as `n ≥ 10`, not a fixed-card task
(`docs/solve-prompts/2026-07-27-post-card-eleven-unique-radius.md:547-549`).

## Earliest meaningful common unproved fact

There is no missing *case split*: equality versus inequality is already
proved exhaustive.  The earliest common fact that could merge D3 and D4 at
general cardinality is a new independently proved **exact-five terminal**
from the shared E frame (equivalently, a theorem that takes the common prefix
and internally performs the existing center-equality split, then proves
`False` in both outcomes).  It must add a real uniform incidence/metric
contradiction; a theorem whose proof simply calls the two current leaves is
only a wrapper and does not advance closure.

The only presently identified smaller common ingress is the additional
fixed-card fact `D.A.card = 11`, which is sufficient but is an external
cardinality collapse rather than a consequence of the current D3/D4 fields.
For the stated general leaves, the first genuine open mathematical producer
is therefore a uniform terminal for the E frame plus its already-proved
center dichotomy, not another coordinator or a refinement of the dichotomy.
