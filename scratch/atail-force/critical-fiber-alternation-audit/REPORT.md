# Retained-radius cyclic-alternation audit

## Verdict

**UNSAT for the withdrawn first `Fin 12` candidate on the exact shared-pair
alternation surface.**  `RetainedRadiusAlternationUnsat.lean` freezes that
pre-repair row system and proves that it admits no cyclic order compatible
with all displayed row equalities plus the full retained first-apex radius
equality.

The current repaired regression in
`critical-fiber-closing-core-selector/RetainedRadiusInjectiveFiniteBoundary.lean`
uses a different row system and kernel-checks both pairwise overlap at most
two and every generated shared-pair alternation.  This audit must not be read
as rejecting that repaired object.

This is an exhaustive theorem about the displayed finite object, proved in
Lean.  It is not yet a proof that every injective retained-radius blocker
matching is impossible.

The defect is even more direct than the order formulation: the object violates
the already-production theorem
`ATailFirstApexCriticalFiberRow.criticalShell_inter_frontierRadiusClass_card_le_two`.
For retained source `0`, the blocker is center `1`, and

```text
globalRow 1 ∩ retainedRadiusClass = {0,6,7}.
```

Thus the intersection has cardinality three where the live Euclidean frontier
proves it has cardinality at most two.  The alternation proof below is an
independent exact-order replay of the same three-common-point defect, not a
new live geometric ingredient.

## Bank check

Before formalizing the adapter, the required registries were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpora were also searched with `nthdegree docs search
--lean`.  The bank already contains the stronger Euclidean endpoint
`Problem97.eq_of_equidistant_three_noncollinear`, and the general cyclic-order
bridge is already `Problem97.SurplusCOMPGBank.btw_sep`.  No new metric theorem
was needed.  The owned Lean file only packages the smallest alternation
terminal and the concrete finite adapter.

## Minimal core

The full twelve-row system is unnecessary.  The contradiction uses only:

1. center `1`'s row contains `0`, `6`, and `7`;
2. the full retained radius at center `4` contains `0`, `6`, and `7`; and
3. the three exact shared-pair separation constraints for pairs
   `{0,6}`, `{0,7}`, and `{6,7}` across centers `1` and `4`.

Let `P`, `Q`, and `R` say respectively that `0`, `6`, and `7` lie strictly
between centers `1` and `4` in a chosen linear cut.  Exact separation gives

```text
P iff not Q,
P iff not R,
Q iff not R.
```

The first two make `Q` and `R` equal, while the third makes them opposite.
This is the minimal three-constraint parity core.

## Lean artifacts

`RetainedRadiusAlternationUnsat.lean` proves:

- `displayed_row_violates_twoCircle_card_gate`, the concrete cardinality-three
  failure of the current production gate;
- `false_of_three_pairwise_alternations`, the minimal propositional terminal;
- `no_injective_alternationSound`, the concrete `Fin 12` UNSAT theorem; and
- `false_of_three_common_equidistant_points`, a geometry-level adapter that
  applies `SurplusCOMPGBank.btw_sep` three times.

The last theorem makes the exact dependency explicit: convex CCW boundary
order plus three common equidistant points at distinct centers is already
contradictory.

## Consequence for the live selector

The withdrawn finite object does not support the claim that the injective
matching arm survives the current production surface.  It survived the
represented blocker/row/minimality predicates only because it omitted
`criticalShell_inter_frontierRadiusClass_card_le_two`; it then also fails the
equivalent three-point cyclic-order check.

This does **not** close the live matching arm.  A general producer would still
have to show that an arbitrary injective retained-radius blocker matching
forces either:

- a three-point intersection between a critical blocker shell and the
  retained first-apex radius class; or
- another finite family of shared-pair constraints with an UNSAT alternation
  core.

The route correction applied after this audit was:

1. add the existing shell/radius intersection-cardinality gate to every future
   finite matching regression;
2. add cyclic separation for the remaining legal two-point intersections;
3. mine the abstract injective matching surface only after both gates pass.

The repaired current object now passes both gates and remains only a finite
abstraction, not a Euclidean realization.  The frozen object in this audit
must not be treated as evidence of geometric feasibility for the live
matching arm.
