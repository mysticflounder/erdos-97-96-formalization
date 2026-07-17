# Robust two-radius global-minimality audit

Date: 2026-07-16

Status: **KERNEL-CHECKED GLOBAL TRANSITION. MINIMALITY IS LOAD-BEARING, BUT
THE TWO-RADIUS ARM IS NOT YET FALSE. NO PRODUCTION `sorry` IS CLOSED.**

## Exact live input

This lane owns the second arm of the physical-second-apex robust normal form:

```text
6 <= S.oppCap2.card,
firstRow secondRow : SelectedFourClass D.A S.oppApex2,
Disjoint firstRow.support secondRow.support,
FullyDeletionRobustAt D S.oppApex2.
```

The two rows have distinct positive radii in the parent classification.  The
new theorem only needs their support disjointness; distinctness is already
implied by a common support point being impossible.

The local cap/MEC layer is sharp here.  Endpoint one-hit bounds force at
least two strict-`oppCap2` points in each row and hence the lower bound six,
but cap six admits both disjoint four-supports in the exact finite
abstraction.  No additional anonymous selected-four marginal was mined.

## Required bank and corpus preflight

Before deriving the transition, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered two distinct K4
radii, support-disjoint exact classes, deletion-robust centers, cap order,
and source-indexed critical blockers.  The reusable declarations were the
existing cap-one-hit/cardinality reductions, the critical-blocker
common-pair classifier, and the global minimal-deletion extractor.  No banked
consumer directly refutes the cap-at-least-six two-radius state.

## New checked transition

`RobustTwoRadiusGeometry.lean` proves

```lean
exists_secondApexRow_minimalDeletionTransition
```

from the two disjoint physical-apex rows, the retained
`CriticalShellSystem`, full deletion robustness, `D.Minimal`, and the very
weak size condition `4 < D.A.card`.

The proof deletes `firstRow.support` and applies global cardinal minimality.
It obtains a fresh center and a cardinality-minimal nonempty blocking set

```text
V subset firstRow.support.
```

Restoring any one member of `V` restores K4 at that center.  The retained
`secondRow` is disjoint from all of `V`, so it survives deletion of all of
`V` at `S.oppApex2`.  Therefore the fresh blocking center is provably not the
physical second apex.  This is the first place where the two-radius arm is
used essentially rather than merely counted.

The output has two exact cases.

### Same-row collision

If two distinct sources `s,t in V` have the same radius about the fresh
center, then `S.oppApex2` and the fresh center are two distinct carrier
centers bisecting `s,t`.

The total critical map classifies the actual blocker of each endpoint as:

```text
partner deletion survives
or blocker = S.oppApex2
or blocker = fresh center.
```

Both alignment cases are eliminated:

- full deletion robustness excludes every selected blocker from equaling
  `S.oppApex2`; and
- cardinal-minimal restoration excludes the blocker from equaling the fresh
  center, because restoring the partner while the source remains deleted
  supplies a K4 inside `D.A.erase source`, contradicting the chosen blocker.

Thus `SameRowMinimalCollisionTransition` retains the complete source-indexed
positive result:

```text
K4 after deleting t at H.centerAt s,
K4 after deleting s at H.centerAt t.
```

This is stronger than a bare shared-radius pair and is not an anonymous
selected-row pattern.

### No collision

If all source radii at the fresh center are distinct, the existing MUS-style
constructor produces

```text
MinimalDeletionCore D.A V center.
```

The theorem then separates:

- `V.card = 1`, an exact singleton critical shell; or
- `2 <= V.card`, where two pairwise-disjoint exact shells make the **fresh
  center itself fully deletion-robust**.

The latter conclusion is checked by
`fullyDeletionRobustAt_of_nontrivial_minimalDeletionCore` and is a genuine
global continuation of the robust-center state.

## What this establishes about the proof route

Global minimality does supply information absent from the selected-row and
cap-capacity abstractions.  The correct cap-at-least-six route is therefore a
minimal-deletion/critical-map continuation, not another local radius count.

It does **not** yet prove `False`.  The exact remaining consumers are:

1. eliminate `SameRowMinimalCollisionTransition`, i.e. a same-row pair with
   reciprocal actual-blocker deletion survival;
2. consume the singleton exact-core installation; or
3. prove that the fresh robust-center continuation cannot iterate or cycle.

The third item needs a monotone cap-order/MEC measure or a finite-orbit
contradiction.  Merely repeating the extractor would move the robust center
without showing progress.  This is the precise place where cap order should
enter next.  The checked theorem must not be advertised as closure until one
of those consumers lands.

## Required parent interface refactor

`D.Minimal` already exists on the live proof spine.  In
`removableVertexOfLarge_of_nonIsM44`, it is constructed as `hmin` immediately
before `hnoRem` and the concrete critical system are constructed.  The only
production call to

```lean
u1_largeCap_routeB_tail_false
```

currently passes `hnoRem` and `hcritical` but drops `hmin`.

The smallest interface change is:

1. add `(hmin : D.Minimal)` to `u1_largeCap_routeB_tail_false`;
2. pass the existing `hmin` at its sole caller in
   `RemovableVertexAxiom/Continuation.lean`; and
3. call the eventual parent direct-`False` theorem after extracting the
   concrete `Hcritical` but before LIVE-Q/C slot or center enumeration.

No LIVE helper signature needs `hmin` if the parent theorem is called at that
boundary.  No K-A existential should be strengthened with it.  The intended
parent surface is instead approximately:

```lean
false_of_twoLargeCaps_commonCriticalMap
    (hmin : D.Minimal)
    (H : CriticalShellSystem D.A)
    (full parent cap/MEC/no-IsM44 data) : False
```

The parent lane has now implemented the two-file `hmin` threading change.
The K-A and LIVE helper surfaces remain unchanged.

Non-removability cannot reconstruct this input: K4 is not upward-monotone in
its set of centers, so `hnoRem` does not imply the global proper-subset
failure used by the extractor.

## Validation

The owned source was compiled as an isolated scratch module against current
production oleans and the checked scratch dependencies.  The command exited
successfully and wrote:

```text
/private/tmp/p97-robust-two-radius-geometry.olean
```

Both printed declarations have axiom closure exactly:

```text
propext
Classical.choice
Quot.sound
```

The owned directory contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, heartbeat override, or linter suppression.  No
production source, shared closure document, protected file, or
proof-blueprint state was edited, and no full project build was run.
