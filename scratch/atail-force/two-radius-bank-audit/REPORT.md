# Two-radius bank audit

## Result

There is **no axiom-clean checked theorem** in the current production tree,
registered theorem banks, or searched scratch artifacts which sends either

- `ExactFourTwoRadiusNoFiveNormalForm`, or
- the production
  `ATailOrientedPhysicalApexIngress.FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual`

to `False`.

There is, however, an exact statement-compatible production route for the
second type:

```lean
false_of_criticalPairFrontier
  R.frontier
  R.minimal
  R.noM44
  (by
    have hfourteen := R.physical.carrier_card_ge_fourteen
    omega)
  R.frontierRadius_class_card_ge_four
```

`TwoRadiusBankAudit.lean` checks this adapter against the current production
source.  Its axiom print is:

```text
[propext, sorryAx, Classical.choice, Lean.ofReduceBool,
 Lean.trustCompiler, Quot.sound]
```

Thus the production coupled residual has **no missing field** for the current
frontier closer: its card-at-least-fourteen field supplies the closer's
`9 < D.A.card` premise.  The missing item is trust closure of the frontier
closer's existing proof leaves, not a stronger card threshold or another
two-radius ingress field.

## Exact source facts

- The production physical residual includes `14 ≤ D.A.card`, full deletion
  robustness at `S.oppApex2`, two distinct positive radii, two exact-card-four
  selected classes, selected-four rows, and disjoint supports:
  `lean/Erdos9796Proof/P97/ATail/OrientedPhysicalApexIngress.lean:176`.
- Its coupled wrapper additionally carries `D.Minimal`, no `IsM44`, a positive
  first-apex frontier radius, a first-apex class of cardinality at least four,
  and the corresponding `CriticalPairFrontier`:
  `OrientedPhysicalApexIngress.lean:213`.
- `false_of_criticalPairFrontier` asks for exactly that frontier, minimality,
  no `IsM44`, card greater than nine, and the first-apex class lower bound:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:987`.
- Current `proof-blueprint axioms` reports `sorryAx` for
  `false_of_criticalPairFrontier`,
  `false_of_originalFrontierUniqueRadiusArm`, and
  `false_of_frontierCommonDeletionPhysicalSecondApex`.

The live `sorryAx` enters through already-loud frontier leaves.  Examples
include:

- post-card-eleven robust exact four:
  `FrontierLiveClosure.lean:76`;
- swapped protected exact four:
  `FrontierLiveClosure.lean:106`;
- exact-five distinct/common obstruction centers:
  `FrontierLiveClosure.lean:202` and `:213`;
- the all-large-caps low-hit terminal:
  `FrontierLiveClosure.lean:700`.

## `ExactFourTwoRadiusNoFiveNormalForm`

The exact type occurs only in its scratch definition, its axiom-clean
producer, and as the `normalForm` field of
`ExactFourTwoDistinctRadiiContinuation`:

- definition:
  `scratch/atail-force/unique4-robust-cap-expansion/ExactFourTwoRadiusSuccessorNormalForm.lean:592`;
- producer:
  `ExactFourTwoRadiusSuccessorNormalForm.lean:634`;
- continuation field:
  `scratch/atail-force/unique4-robust-cap-expansion/ExactFourRobustLargeRadiusContinuation.lean:204`.

Fresh import of the current olean reports only
`[propext, Classical.choice, Quot.sound]` for
`nonempty_exactFourTwoRadiusNoFiveNormalForm`.  No occurrence consumes the
normal form to `False`.

The precise missing data for a direct consumer of the normal form is the
full parent coupling: the normal-form type itself does not carry the
`CriticalPairFrontier`, `D.Minimal`, no-`IsM44`, first-apex rich-class bound,
or a large-first-cap branch.  The later continuation supplies these through
its parent `OriginalUniqueFourResidual` and only constructs a coupled residual
on its `coupledLarge` first-cap profile; the exact-four and exact-five
first-cap profiles remain separate outputs.

## Closest scratch match and import boundary

`scratch/atail-force/frontier-coupled-two-four-radius-consumer/FrontierCoupledTwoFourRadiusConsumer.lean:99`
proves

```lean
OriginalFrontierUniqueRadiusArm R.frontier ∨
  ∃ deleted center,
    Nonempty (CommonDeletionTwoCenterPacket
      D H deleted center S.oppApex2)
```

and its report records a standard-axiom-only validation.  It is not a
`False` theorem.  More importantly, it consumes the duplicate scratch type

```text
Problem97.ATailOrientedLargePhysicalRadiusIngressScratch.
  FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual
```

from `OrientedLargePhysicalRadiusIngress.lean:189`, not the production type
in namespace `ATailOrientedPhysicalApexIngress`.  No adapter or production
import of this scratch consumer was found.

Its common-deletion output is also weaker than
`FrontierCommonDeletionParentResidual`: it has arbitrary `deleted` and
`center`, whereas the parent residual requires deletion of
`F.pair.q`, centers exactly `S.oppApex1` and `S.oppApex2`, and the retained
`firstApexDouble` witness
(`OrientedPhysicalApexIngress.lean:238`).  The generic packet's best checked
scratch reduction is only
`FullyDeletionRobustAt D S.oppApex2 ∨
 SwappedFirstApexUniqueFourFrontier D S H`, not `False`
(`common-deletion-uniform-consumer/CommonDeletionUniformConsumer.lean:189`).

## Bank search

The indexed Lean corpus and all three required registries were searched:

- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- `docs/general-n-certificate-bank-mining-2026-07-09.md`.

No declaration mentions either exact type, and no registered `False`
declaration has a compatible statement shape.  The U5 incidence
incompatibilities require named row/carrier incidence packets not present in
either residual, while the general exact-four/same-radius lemmas are positive
decompositions rather than terminals.

## Verification artifacts

- `TwoRadiusBankAudit.lean`: current-source exact adapter and axiom print.
- `lean-output.txt`: successful elaboration plus the `sorryAx` dependency.
- `ExactFourNoFiveTrustAudit.lean` and
  `exact-four-no-five-lean-output.txt`: current-oLean producer axiom check.
