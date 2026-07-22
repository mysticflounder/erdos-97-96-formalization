# Exact-five distinct-blocker hybrid terminal audit

Date: 2026-07-22

## Result

The exact-five distinct-blocker residual is **not yet proved false**.  It does,
however, have a stronger source-faithful reduction than the previous local
row view exposed.

The checked theorem

```lean
physicalSecondApex_split
    (R : OriginalUniqueFiveDistinctBlockersResidual F) :
    OriginalUniqueFiveDistinctPhysicalSecondOutcome R
```

has exactly two constructors:

1. `biApexRobust`: the complete exact-five residual is retained, the physical
   second apex is fully deletion-robust, both opposite caps have cardinality
   at least five, and `12 ≤ D.A.card`;
2. `swappedUniqueFour`: a production
   `SwappedFirstApexUniqueFourFrontier D S H`.

This is not a finite-pattern or selected-row extrapolation.  It uses the full
carrier, the fixed critical system `H`, the production physical second apex,
and the actual directed deletion-survival field stored in the residual.

## Checked derivation

Write `P := R.base.interior.frontier.pair`.  The T5 field gives one of

```lean
K4 (D.A.erase P.w) at H.centerAt P.q
K4 (D.A.erase P.q) at H.centerAt P.w.
```

The production frontier independently stores

```lean
P.w_survives : K4 (D.A.erase P.w) at S.oppApex2
P.q_survives : K4 (D.A.erase P.q) at S.oppApex2
```

and proves that the corresponding actual blocker is distinct from
`S.oppApex2`.  Therefore either orientation constructs a genuine
`CommonDeletionTwoCenterPacket` for the same deleted source.  The proof then
immediately invokes

```lean
physicalSecondApex_commonDeletion_robust_or_critical
```

rather than banking another unconsumed row packet.  Its critical arm is
immediately fed to

```lean
physicalSecondCritical_reorients_to_swappedUniqueFour.
```

The robust arm retains `R`.  Exact cardinality five at the first apex gives
at least three members in the strict first-cap interior, hence
`5 ≤ S.oppCap1.card`.  Physical-second-apex robustness gives
`5 ≤ S.oppCap2.card`.  Together with `4 < S.surplusCap.card` and `S.capSum`,
this gives `12 ≤ D.A.card`.

## Kernel gate

Command, from `lean/`:

```bash
LEAN_PATH="../scratch/atail-force/unique5-distinct-hybrid-terminal:../scratch/atail-force/unique-arm-route-audit:../scratch/atail-force/unique-row-producer:.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/unique5-distinct-hybrid-terminal/UniqueFiveDistinctPhysicalSecondApexSplit.lean
```

Result: success.  The reported axiom closures for both
`firstOppCap_card_ge_five` and `physicalSecondApex_split` are exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There are no `sorry` declarations in the new Lean file.

## Why this does not yet close the leaf

No non-circular production theorem currently consumes either final branch to
`False`.

The swapped exact-four frontier is the already identified exact-four leaf.
Calling `false_of_originalFrontierUniqueRadiusArm` on it would recurse through
the theorem currently being proved, so it is not an independent terminal.

On the robust arm, redesignating or swapping the displayed packet only
permutes the same three physical caps.  A fresh common-deletion frontier can
increase a cap lower bound, but no checked theorem supplies a strictly
decreasing invariant, an alternative `IsM44` packet, or a terminal critical
fiber.  The existing exact-five production closure in `FrontierLiveClosure`
also returns to `false_of_originalFrontierUniqueRadiusArm` after
redesignation, so using it here would be circular.

## First exact missing source theorem

After the existing exact-four leaf is handled, the first remaining theorem
for this branch is:

```lean
theorem false_of_originalUniqueFiveDistinctBiApexRobustResidual
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFiveDistinctBlockersResidual F)
    (B : OriginalUniqueFiveDistinctBiApexRobustResidual R) :
    False
```

This statement retains all of the data that a valid proof must use:

- the whole carrier and convex/MEC packet;
- `D.Minimal` and the no-`IsM44` hypothesis through `R.base`;
- the fixed critical map `H`;
- the exact-five complete first-apex class and its unique-radius property;
- the strict-interior retained pair and its double-deletion failure;
- distinct actual blockers and the directed cross-deletion survival; and
- full singleton-deletion robustness at both physical apices.

The current fields imply cap sizes at least `(5,5,5)` and carrier cardinality
at least twelve, but they do **not** presently imply a short alternative cap,
a same-cap second center, a cross-incidence terminal, or a strict cap/MEC
descent.  Any next producer should target one of those existing terminal
antecedents directly; another local row adapter would not advance closure.

## Files

- `UniqueFiveDistinctPhysicalSecondApexSplit.lean`: checked reduction and
  robust residual.
- `REPORT.md`: this audit.
