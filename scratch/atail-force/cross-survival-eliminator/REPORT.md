# Cross-survival eliminator audit

Date: 2026-07-14

Status: **KERNEL-CHECKED SHARP ONE-ROW NORMAL FORM; THE ARM REMAINS OPEN.**

This directory studies only the first field of
`FrontierContinuationEliminators`.  It does not edit production Lean,
closure docs, `SurplusM44`, or the user-owned unique-row lane.

## Result

`CrossSurvivalEliminator.lean` orients either disjunct of
`CrossSurvivalOutput` and retains an exact
`SurvivingContinuationRow`.  The resulting row is centered at one strict
`oppCap2` continuation point, omits the other continuation point, and lives
on the original carrier.  The current source proves all of the following.

1. The surviving center differs from the deleted source's chosen blocker.
2. The exact survivor circle meets that chosen critical shell in at most two
   points.  Since both rows have cardinality four, at least two survivor
   points lie outside the critical shell.
3. At most two survivor points lie in `oppCap2`, so at least two lie outside
   that cap.
4. Any two distinct survivor support points outside `oppCap2` have **unequal**
   distances from `S.oppApex1`.
5. Equivalently, every fixed first-apex radius meets the outside-cap survivor
   support in at most one point.

The last fact is the important correction.  The cross-survival row cannot be
turned into the forbidden two-center pair merely by hoping that its two
outside-cap points land in the retained first-apex marginal.  Ordered-cap
geometry proves that such a repeated first-apex radius is impossible.

The aggregate theorem is:

```lean
crossSurvival_oneRow_normalForm
```

It returns one exact survivor with both lower bounds and the uniform
first-apex one-hit theorem.  `false_of_two_firstApexRadius_hits` records the
smallest direct conditional sink: a producer of two outside survivor points
on one first-apex radius would close immediately, but the new one-hit theorem
shows that this condition is precisely contradictory rather than latent in
the row.

## What the full parent context does and does not add

The checked proof uses the full convex/MEC ordered-cap surface carried by
`D` and `S`, the concrete `CriticalPairFrontier`, and its retained
`CriticalShellSystem`.  The parent `hNoM44`, live labels, and cardinal lower
bound currently have no banked theorem that further localizes this arbitrary
survivor support.  In particular, none turns either of the two points outside
the deleted source's critical shell into a named dangerous-triple hit or a
second shared pair.

The first genuinely missing content is therefore **not** another packaging
lemma and **not** a first-apex-radius producer.  It must couple the two escape
points to additional global rows.  The exact weakest terminal shape is a
second distinct `oppCap2` center whose exact row shares two survivor points
outside that cap; `outsidePair_unique_capCenter` then gives `False`.  An
equivalent useful producer may instead place the two critical-shell escape
points into a currently consumed U5 finite packet.

The exact open parent field remains

```lean
∀ (K : FrontierSecondApexRow F)
  (P : TwoContinuationRows (rebasePacket D S) K.row),
  CrossSurvivalOutput P → False
```

No theorem in this directory assumes or proves that field.

## Ranked next directions

1. **Second-row repeated outside pair.**  For the survivor returned by
   `crossSurvival_oneRow_normalForm`, produce a second distinct center in
   `oppCap2` and one exact row there sharing two of the survivor's outside-cap
   support points.  This is the shortest current route to an existing
   kernel-checked terminal.
2. **Critical-shell escape localization.**  Use the two points proved outside
   the deleted source's retained critical shell and place them in a named U5
   dangerous/support packet.  This visibly consumes the common critical map
   and is the closest finite-bank route.
3. **Multi-row equality-core mining.**  Only if the first two producers fail,
   add another globally selected/critical row and mine the resulting equality
   closure.  Further scans of the single survivor row cannot recover a
   repeated first-apex radius because the Lean theorem now excludes it.

## Exact local regression

`verify_local_regression.py` gives an exact integer-coordinate local model of
the one-row interface.  In cyclic hull order the six points are

```text
z1=(0,0), z2=(65,0), e=(63,16), a=(60,25), b=(52,39), O1=(16,63).
```

The ordered cap is the wrapping chain `(O1,z1,z2,e)`, with `z1,z2` in its
strict positions.  After deleting `z2`, the four-point row centered at `z1`
has support `{e,a,b,O1}` and squared radius `4225`.  Its two points outside
the cap are `a,b`, whose squared first-apex radii are exactly `3380` and
`1872`.  Every displayed point is a strict convex-hull vertex.

This is **EMPIRICALLY VERIFIED by exhaustive exact rational arithmetic within
the displayed local interface**.  It is not a `CounterexampleData`: it does
not assert global K4 at every center, a total critical map, a full
`SurplusCapPacket`, or no-`IsM44`.  It therefore establishes sharpness of the
local one-row/radius claim, not a counterexample to A-TAIL.

## Bank preflight

Before deriving the normal form, the required current and archived registries
were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered q-deleted/critical-shell overlap, one-row
support confinement, cap-local outside pairs, and deletion-blocker
separation.  The reusable endpoints are
`SelectedFourClass.inter_card_le_two`,
`actual_blocker_ne_of_deletion_survives`,
`selectedFourClass_inter_capByIndex_card_le_two`, and
`outsidePair_unique_capCenter` through the checked cap-order adapter.  No
current or archived theorem consumes one arbitrary q-deleted row alone.

## Rigor and validation

- **PROVEN:** the exact-row conversion, blocker separation, critical-shell
  overlap bound, two outside-critical-shell points, two outside-cap points,
  and first-apex radius injectivity on those outside-cap points.
- **EMPIRICALLY VERIFIED (exact local abstraction):** the integer-coordinate
  strict-convex regression.
- **CONJECTURED / OPEN:** a parent producer coupling the survivor's escape
  points to a second consumed row or finite U5 packet.
- **HEURISTIC:** prioritize the critical-shell escape pair over further
  single-row mining, because the first-apex marginal route is now proved to
  have the wrong polarity.

The scratch Lean file was checked directly against current source-derived
oleans.  Every printed declaration closes under exactly `propext`,
`Classical.choice`, and `Quot.sound`; there is no `sorryAx`, declared axiom,
`admit`, or `native_decide`.  No full Lake build was run.
