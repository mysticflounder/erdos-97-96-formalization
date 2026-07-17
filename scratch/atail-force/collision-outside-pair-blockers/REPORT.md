# Collision outside-pair blocker audit

Date: 2026-07-17

Status: **KERNEL-CHECKED BOUNDED NEGATIVE REDUCTION. THE OUTSIDE-PAIR
ACTUAL-BLOCKER ROUTE IS NOT A LOAD-BEARING CONSUMER OF THE ROBUST COLLISION.
NO PRODUCTION `sorry` IS CLOSED.**

## Bank and indexed-corpus preflight

Before deriving the reduction, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for common blockers, outside-pair cap
uniqueness, source-indexed rows, and ordinal/Kalmanson shell equalities. The
relevant existing endpoints were:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- `CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`;
- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`; and
- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`.

No bank theorem converts the chosen blockers of the two anonymous outside
points into either a same-cap second bisector center or the pinned `O/A/X`
three-row packet.

## Load-bearing correction

For any exact four-point selected row centered at a carrier point, every
indexed cap containing the center contains at most two row points. Therefore
that row has at least two points outside the cap. This extraction does not use
the robust blocker collision, the two collision sources, or their prescribed
deletion criticality.

Consequently `RobustCollisionCapOutsidePair` is a valid geometric packet, but
it is not by itself evidence that the collision advances the parent proof.
The collision sources must remain named through any proposed consumer.

## Checked source-faithful split

`CollisionOutsidePairBlockers.lean` retains two distinct sources in one fiber
of the concrete `CriticalShellSystem` and proves:

1. the common exact shell contains both collision sources;
2. for every cap containing the common blocker, at least two common-shell
   points lie outside the cap;
3. if either collision source lies outside that cap, the outside pair can be
   chosen to contain that source, and its chosen blocker is already the common
   blocker; and
4. only if both collision sources lie inside the cap are both extracted
   outside points guaranteed to be fresh relative to both sources.

Thus the one- or two-source-outside branches supply no new second center from
the collision sources' own chosen blockers. The only branch where two new
chosen blockers can even be inspected is the both-sources-inside branch.

## Exact actual-blocker residual

For any extracted outside pair `x,y`, the checked theorem

```lean
CollisionCapOutsidePair.actualBlockerPairOutcome_total
```

gives the exhaustive outcome:

1. `centerAt(x) = commonBlocker`; or
2. `centerAt(y) = commonBlocker`; or
3. `centerAt(x)` is outside the common blocker's cap and its exact row
   contains `y`; or
4. `centerAt(y)` is outside that cap and its exact row contains `x`; or
5. the two chosen rows mutually omit the opposite outside point.

The proof uses `outsidePair_unique_capCenter` to eliminate exactly the branch
where a distinct chosen blocker lies in the same cap and bisects the outside
pair. Hence the actual blocker map cannot manufacture the desired same-cap
second center: any cross-row center that is genuinely new is forced **outside**
the cap, while the remaining branch is mutual omission.

This residual also does not yield the pinned `O/A/X` terminal. It supplies at
most one cross membership, with no robust-apex row memberships or six-role
cyclic placement. The mutual-omission branch supplies the opposite polarity.

## Verdict

The actual blockers of the two outside points do not close the robust
collision. The route is useful only as a negative classifier:

- a collision source outside the cap is pinned back to the existing common
  blocker;
- a genuinely distinct cross-bisector chosen blocker is expelled from the
  cap; and
- otherwise the chosen rows mutually omit the pair.

Do not promote the generic outside-pair extraction or recurse on this
classifier as a new closure lane. A load-bearing successor still has to use
full parent cap/MEC/order data to consume the **outside-cap cross-center**
residual, or directly prove the already-registered ordered `O/A/X` support
packet. The present audit establishes neither.

## Validation and scope

The owned scratch file elaborates with no `sorry`, `admit`, custom axiom,
`native_decide`, or unsafe declaration. Every printed public result closes
over exactly:

```text
propext
Classical.choice
Quot.sound
```

Only files under
`scratch/atail-force/collision-outside-pair-blockers/` were created. No
production file, plan doc, generated blueprint, protected unique-row artifact,
`SurplusM44`, or shell-curvature file was modified.
