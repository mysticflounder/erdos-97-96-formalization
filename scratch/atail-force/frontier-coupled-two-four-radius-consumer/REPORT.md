# Frontier-coupled two-four-radius consumer

## Result

The final complement from
`oriented-large-physical-radius-ingress` now has a branch-complete checked
consumer.  The theorem is:

```lean
protectedOriginal_or_commonDeletion
    (R : FrontierCoupledPhysicalSecondApexExactTwoFourRadiusResidual D S H) :
    OriginalFrontierUniqueRadiusArm R.frontier ∨
      ∃ deleted center : ℝ²,
        Nonempty (ATailCommonDeletionTwoCenter.CommonDeletionTwoCenterPacket
          D H deleted center S.oppApex2)
```

This is the requested full-parent target, not a theorem on the satisfiable
bare pair of disjoint exact-four rows.  It visibly consumes the retained
first-apex `CriticalPairFrontier` and the same concrete critical-shell system
`H`.

The theorem does **not** claim direct `False`.  Its two outputs are precisely
the two already protected continuations:

1. the original first-apex unique-radius card-four/card-five arm; or
2. a production common-deletion two-center packet at `S.oppApex2`.

Consequently the exact-two-four physical marginal is no longer an ingress
gap.  The remaining work is downstream elimination of these already named
consumer families and parent wiring.

## Proof route

The checked first-apex terminal descent gives three cases:

1. `OriginalFrontierUniqueRadiusArm`;
2. a coherent fixed-radius actual-blocker orbit producing a scratch
   `CommonDeletionTwoCenterPacket`; or
3. `FrontierRadiusSpentAtEntry`.

The spent-at-entry certificate forces double-deletion survival at the first
apex, while `CriticalPairFrontier.secondApexDouble` supplies it at the second
apex.  Therefore either original frontier point is already a common deletion
at the two prescribed opposite apices.

Both non-unique cases were previously packaged in the older
`ATailContinuationBankMatchScratch.CommonDeletionTwoCenterPacket`.  The new
adapter transports its carrier membership, center separation, and two
survival facts through
`ATailCommonDeletionTwoCenter.nonempty_commonDeletionTwoCenterPacket`, so the
result uses the current production packet type.

## Why this does not contradict the survivor bank

The corrected two-row survivor bank only shows that two distinct disjoint
exact-four classes at one center are locally satisfiable.  The present result
does not refute that marginal.  It uses the additional first-apex frontier
and its global terminal-descent invariant, which are absent from those
models.  Thus no additional CEGAR or Kalmanson round is needed to justify this
ingress reduction.

The fields `R.minimal`, `R.noM44`, and `R.physical` are retained for downstream
parent consumers but are not needed by this reduction.  This is stronger than
the planned coupling: the first-apex frontier alone routes the residual to
the protected outputs.

## Fresh-source validation

The two upstream adapters were rebuilt from their current source into a fresh
temporary olean directory before validating the new module:

```text
FixedRadiusOrbitEntryIntegration.lean
FixedSingleRadiusCommonDeletionIntegration.lean
SpentEntryTerminalMutualHitConsumer.lean
FrontierCoupledTwoFourRadiusConsumer.lean
```

Validation command (from `lean/`):

```bash
env LEAN_PATH=/private/tmp/p97-oriented-ingress-consumer-dep:/private/tmp/p97-frontier-coupled-fresh-oleans:/private/tmp/p97-r-orbit-entry-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/frontier-coupled-two-four-radius-consumer/FrontierCoupledTwoFourRadiusConsumer.lean
```

The final axiom checks are:

```text
nonempty_consumedOutcome:
  [propext, Classical.choice, Quot.sound]

protectedOriginal_or_commonDeletion:
  [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, no added axiom, and no use of the protected
`surplusM44` refactor.

## Parent handoff

Import `FrontierCoupledTwoFourRadiusConsumer` after compiling it into the
scratch dependency path, then eliminate
`protectedOriginal_or_commonDeletion R`:

- send `Or.inl` to the existing original FA-UNIQ4/FA-UNIQ5 adapter;
- send `Or.inr` to the production common-deletion continuation.

This replaces the previous statement in the oriented-ingress report that no
checked theorem routed constructor 5.  The authoritative plan docs should
record constructor 5 as **reduced to protected outputs**, not as a live
two-radius producer frontier.
