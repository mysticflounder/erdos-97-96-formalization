# Exact-five two-hit producer attempt

Date: 2026-07-17

Status: **KERNEL-CHECKED ROUTE CORRECTION; UNCONDITIONAL ORIGIN-TAGGED
TWO-SOURCE COMMON-DELETION OUTPUT PROVED; DIRECT TWO-HIT PACKET IS ALREADY
CONTRADICTORY; NO PRODUCTION `sorry` CLOSED.**

## Scope

This lane owns only
`scratch/atail-force/exact-five-two-hit-producer-attempt/`. It did not edit
production Lean, closure documents, shell-curvature, `surplusM44`, or the
unique-row producer census.

## Bank and corpus preflight

Before deriving a new finite incidence object, the required registries were
checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches included:

```text
nthdegree docs search --lean \
  "unused actual critical row two physical radius hits exact five large cap contradiction"
nthdegree docs search --lean \
  "two circle centers equidistant from two points cap interior selected four support contradiction"
```

The first search found the new production terminal
`false_of_largeCapUniqueFiveTwoHitCriticalRow`; the second found the existing
two-center/cap and selected-row counting kernels. No independent theorem
produces the two cross-incidences.

## Decisive correction

The proposed object

```lean
LargeCapUniqueFiveTwoHitCriticalRow D S profile
```

is not an intermediate packet waiting for a consumer. Production already
proves

```lean
false_of_largeCapUniqueFiveTwoHitCriticalRow :
  LargeCapUniqueFiveTwoHitCriticalRow D S profile -> False.
```

The scratch theorem

```lean
not_nonempty_largeCapUniqueFiveTwoHitCriticalRow
```

records this explicitly. Thus a theorem constructing that packet from the
full exact-five branch would itself be the complete branch contradiction. It
is a valid final proof target, but it should not be described as a routine
row producer or assumed to follow from criticality alone.

## Unconditional complementary output

For an actual

```lean
row : LargeCapUniqueFiveUnusedCriticalRow D S H profile
```

the physical exact-five class has at least three points in the strict second
opposite-cap interior. The checked terminal shows that at most one of those
points belongs to the unused source's actual critical support. Therefore at
least two distinct physical strict-cap points avoid that support.

`ExactFiveTwoHitProducerAttempt.lean` proves:

```lean
physicalInterior_inter_unusedCriticalSupport_card_le_one

nonempty_twoCommonDeletionSources_of_unusedCriticalRow

nonempty_twoCommonDeletionSources_of_largeCapUniqueFive
```

The output

```lean
LargeCapUniqueFiveTwoCommonDeletionSources D S H profile
```

retains, without reselection or anonymous projection:

- the exact unused source and its actual `H.selectedAt` row;
- two distinct deleted points in the physical exact-five strict-cap class;
- nonmembership of both points in that actual critical support;
- K4 survival after deleting either point at the actual blocker;
- K4 survival after deleting either point at the physical second apex; and
- two constructed `CommonDeletionTwoCenterPacket`s with the same ordered
  center pair: the unused source's blocker and `S.oppApex2`.

The helper

```lean
unusedCriticalRow_support_eq_selectedAt
```

also repairs an interface subtlety: `LargeCapUniqueFiveUnusedCriticalRow`
stores a separately named exact row rather than a literal equality to
`H.selectedAt`. Since both exact rows have the same center and contain the
same source, their radii and complete supports agree.

## Proof shape

Write

```text
T = physical exact-five class intersect strict second-cap interior
K = actual critical support at the unused source.
```

Then:

1. production gives `3 <= card T`;
2. two points in `T intersect K` would build the contradictory two-hit
   packet, so `card (T intersect K) <= 1`;
3. finite-set subtraction gives `2 <= card (T \ K)`;
4. choose distinct `first, second` in `T \ K`;
5. `cross_deletion_survives_iff_not_mem_selected_support` gives survival at
   the actual blocker for both deletions;
6. deleting one point from an exact five-point physical class leaves four,
   giving survival at the physical apex; and
7. `nonempty_commonDeletionTwoCenterPacket` packages both deletions with the
   same two centers.

## Exact remaining theorem surface

The exact-five arm no longer needs a separate attempt to manufacture an
impossible two-hit packet. Its unconditional source-valid output is the
two-source origin-tagged common-deletion packet above.

The remaining mathematical work is a consumer which uses the retained
exact-five/cap/origin fields to eliminate or strictly advance

```lean
LargeCapUniqueFiveTwoCommonDeletionSources D S H profile.
```

A consumer of only one generic `CommonDeletionTwoCenterPacket` is known to
permit abstract successor cycles. The new packet is strictly stronger: it
retains two distinct co-radial strict-cap deletion sources, the common center
pair, and the actual unused-source blocker row. Any proposed terminal must
visibly use those fields or another full-parent field. The present result
does not claim that the stronger packet is already contradictory.

Epistemic status:

- two-hit packet nonexistence: **PROVEN**;
- actual-row support equality: **PROVEN**;
- two distinct physical strict-cap omissions: **PROVEN**;
- survival at both common centers for both deletions: **PROVEN**;
- constructed pair of common-deletion packets: **PROVEN**;
- direct `False` consumer for the stronger packet: **OPEN**;
- production `sorry` closed: **NONE**.

## Validation

Focused Lean check from `lean/`:

```bash
lake env lean -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact-five-two-hit-producer-attempt/\
ExactFiveTwoHitProducerAttempt.lean
```

Result: exit `0`, with no Lean warning. Every printed theorem reports exactly:

```text
propext, Classical.choice, Quot.sound
```

The owned Lean file contains no `sorry`, `admit`, declared axiom,
`native_decide`, or `unsafe` declaration; it has no line over 100 characters,
and `git diff --check` is clean.
