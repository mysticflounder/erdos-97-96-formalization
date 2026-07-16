# R spent-at-entry parent audit

Date: 2026-07-15

## Result

The `FrontierRadiusSpentAtEntry` arm is now normalized, but it is not a
contradiction at unrestricted carrier cardinality.

The kernel-checked scratch integration is
`scratch/atail-force/r-full-parent-entry/SpentEntryAlternateRadiusDescent.lean`.
It proves all of the following.

- The twice-erased carrier admits a terminal descent at the one named
  `alternateRadius`.
- Prepending the original frontier pair gives a robust history on the full
  ambient carrier.
- Every ambient erased point is either `F.pair.q`, `F.pair.w`, or a member of
  the ambient selected class at `alternateRadius`.
- The two original frontier points are not members of that alternate class.
- Starting from any post-entry erased point reconstructs an actual-blocker
  orbit whose initial robust pair has exactly `alternateRadius`.
- A source-exact minimal cycle has the branch-complete split
  `SpentEntryCycleHitsOriginalPair F K` or every canonical cycle source lies
  in the alternate selected class.
- At every canonical cycle source, at least two points of the actual critical
  row are off the alternate selected class.  Every such point is either
  retained by the terminal carrier or is one of `F.pair.q`, `F.pair.w`.

The named first residual is therefore
`SpentEntryCycleHitsOriginalPair`: a canonical actual-blocker source returns
to one of the two original frontier endpoints.  On the complementary arm,
the only weakening of the existing fixed-radius row residual is the explicit
two-point exceptional set `{F.pair.q, F.pair.w}`.

## Full-geometry split

The spent-entry packet itself exhibits two distinct positive K4 radii at
`S.oppApex1`: the original frontier radius on the ambient carrier and the
alternate radius on the twice-erased carrier.  Monotonicity restores the
second K4 class to the ambient carrier.  Applying
`oppositeVertex_distinct_K4_radii_force_cap_card_ge_six` proves

```text
6 <= (S.capByIndex S.oppIndex1).card.
```

Consequently spent-at-entry is impossible on an orientation whose first
opposite cap has cardinality four or five.  The existing full-geometry bank
proves that through ambient cardinality thirteen at least one non-surplus cap
has cardinality four or five.  A fresh frontier may therefore be oriented at
that small cap and its spent arm is excluded.

This does not eliminate spent-at-entry from the unrestricted full parent.
That parent supplies `9 < D.A.card`, not `D.A.card <= 13`.  In particular,
the existing two-apex capacity theorem identifies cardinality fourteen as the
first range in which two large opposite caps are compatible with the cap-sum
bookkeeping.  Same-pair transport across an apex swap is already known to be
impossible; the small-cap route must reconstruct a fresh oriented frontier.

## Preflight

The required theorem-bank registries and indexed Lean corpus were searched
for spent-entry, alternate-radius, radius-switch, and carrier-successor
producers.  No banked theorem supplied a stronger same-pair successor or an
unrestricted-cardinality contradiction.  The nearest reusable results were
the existing critical-pair frontier constructors, the fixed-radius terminal
descent, the source-exact actual-blocker cycle, and the cap-four/card-five
apex-radius rigidity theorem used above.

## Remaining producer boundary

For the general large-cardinality parent, closure now needs one of these
genuinely stronger facts.

1. Exclude `SpentEntryCycleHitsOriginalPair`, and exclude the two original
   frontier points from the off-alternate critical-row residuals; or
2. provide a geometric consumer which derives a contradiction from the
   two-phase packet directly; or
3. prove a small-opposite-cap or ambient-cardinality-at-most-thirteen bound
   from additional hypotheses not currently present in the full parent.

The smallest currently exposed cycle-level missing field is exception
avoidance: the actual-blocker cycle and its relevant off-alternate row points
must avoid `{F.pair.q, F.pair.w}`.  Without it, promoting the post-entry
history to a full-carrier `FixedSingleRadiusTerminalHistory` would be false,
because the two prepended points are provably off the alternate radius.

## Validation

`CapFiveApexRigidity.lean` and
`SpentEntryAlternateRadiusDescent.lean` were freshly compiled to isolated
oleans.  Every printed declaration depends only on `propext`,
`Classical.choice`, and `Quot.sound`; no `sorryAx` occurs.

