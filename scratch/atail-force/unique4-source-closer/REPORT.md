# Exact-four source closer audit

Date: 2026-07-22

Scope: scratch-only audit of the source-valid route from
`OriginalUniqueFourResidual` toward a direct contradiction.

## Theorem-bank preflight

Before deriving the producer, the required Problem 97 bank preflight was
performed against:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpus via `nthdegree docs search --lean`.

No existing theorem was found that consumes an exact-four first-apex
residual together with either a robust physical second apex or a retained
swapped exact-four packet.  The reusable bank components used below are the
critical-support/deletion equivalence, blocker-fiber lemmas, two-circle
intersection bound, common-deletion constructor, and physical-second-apex
split.

## Result

The following producer chain is **PROVEN in Lean** in
`ExactFourSurvivalCover.lean`:

1. Rebase to the late critical system whose first-apex blocker fiber is
   exactly the ambient four-point first-apex class.
2. Among sources outside that fiber, call a source bad if neither retained
   singleton deletion preserves K4 at its actual blocker.
3. Every bad source's complete critical support contains both retained
   points `F.pair.q` and `F.pair.w`.
4. All bad sources have the same blocker.  Otherwise that pair's
   perpendicular bisector would contain the first physical apex and two
   distinct actual blockers, contradicting the convex two-point
   perpendicular-bisector bound.
5. The common bad-source support meets the exact first-apex class in exactly
   the retained pair.  Two selected four-classes with distinct centers meet
   in at most two points, while both retained points lie in the
   intersection.  Therefore only two support points remain outside the
   first-apex class.
6. Every bad source lies in those two remaining support positions, so the
   bad-source set has cardinality at most two.
7. The exact-four residual has carrier cardinality at least eleven.  Removing
   the four-source late first-apex fiber leaves at least seven sources, hence
   at least five good sources.
8. Five good sources contain two with distinct actual blockers.  At least one
   of those blockers differs from the physical second apex.  At that source,
   either deletion of `q` or deletion of `w` survives; the same deletion also
   survives at the physical second apex by `F.secondApexDouble`.
9. The existing constructor therefore yields a source-faithful
   `CommonDeletionTwoCenterPacket` at an actual late blocker and the physical
   second apex.

This is strictly stronger than the generic source-fiber bound: the complete
exact-four support and the retained pair improve the bad-source bound from
four to two.

## Checked declarations

- `bad_source_blockers_eq`
- `badOutsideSources_card_le_two`
- `seven_le_outsideFirstApexFiber_card`
- `five_le_goodOutsideSources_card`
- `nonempty_exactFourPhysicalCommonDeletionIngress`
- `nonempty_exactFourPhysicalConsumerOutcome`

All six declarations kernel-check with:

```text
propext, Classical.choice, Quot.sound
```

No declaration reaches `sorryAx`.

The focused check was run from `lean/` with:

```bash
LEAN_PATH="../scratch/atail-force/unique4-source-closer:\
../scratch/atail-force/unique4-late-choice-terminal:\
../scratch/atail-force/unique4-uniform-route-audit:\
../scratch/atail-force/unique-arm-route-audit:\
../scratch/atail-force/unique-row-producer:\
../scratch/atail-force/card-five-interior-critical-frontier:\
../scratch/atail-force/card-five-interior-bisector-localization:$LEAN_PATH" \
lake env lean --root=.. -DwarningAsError=true \
  -o ../scratch/atail-force/unique4-source-closer/ExactFourSurvivalCover.olean \
  ../scratch/atail-force/unique4-source-closer/ExactFourSurvivalCover.lean
```

## Existing-consumer audit

`nonempty_exactFourPhysicalConsumerOutcome` retains the original residual and
the new common-deletion ingress, then applies the existing physical
second-apex consumer.  Its exhaustive output is:

1. `FullyDeletionRobustAt D S.oppApex2`; or
2. `SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)`.

Neither output is currently terminal.

- The robust output cannot feed
  `false_of_frontierBiApexRobustResidual`: that theorem requires a
  `FrontierCommonDeletionParentResidual` whose first physical apex is fully
  deletion-robust.  Exact four has the opposite polarity, and
  `firstApex_not_fullyDeletionRobustAt` proves this explicitly.
- The swapped output can be sent back to the protected unique-four
  dispatcher, but doing so is a recursive return to the same open
  mathematical obligation.  The new information is the retained original
  exact-four residual and common-deletion ingress; discarding those fields
  would erase the progress proved here.

## First honest missing terminal

The smallest accurate aggregate target is:

```lean
theorem false_of_exactFourPhysicalConsumerOutcome
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (O : ExactFourPhysicalConsumerOutcome R) :
    False
```

Its two genuine mathematical leaves are:

```lean
OriginalUniqueFourResidual F
  + ExactFourPhysicalCommonDeletionIngress R
  + FullyDeletionRobustAt D S.oppApex2
  -> False
```

and

```lean
OriginalUniqueFourResidual F
  + ExactFourPhysicalCommonDeletionIngress R
  + SwappedFirstApexUniqueFourFrontier D S (lateFirstApexSystem R)
  -> False
```

The second leaf must visibly consume both the original and swapped
exact-four packets (or establish a strict descent); simply invoking the live
unique-four closer again is not progress.

## Status labels

- **PROVEN:** the sharpened bad-source bound `≤ 2`.
- **PROVEN:** at least five good sources.
- **PROVEN:** existence of the physical common-deletion ingress.
- **PROVEN:** the robust-or-swapped exact consumer split with all new parent
  data retained.
- **UNRESOLVED:** a direct terminal for either enriched output arm.
- **NOT CLAIMED:** closure of `false_of_originalUniqueFourResidual` or the
  live exact-four `sorry`.
- **NO SOURCE CLOSURE:** this scratch checkpoint closes no production
  `sorry`; it proves a new aggregate producer and isolates its first
  nonterminal consumer boundary.
