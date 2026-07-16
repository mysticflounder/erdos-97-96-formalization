# Named terminal-hit metric and swap audit

Date: 2026-07-16

Status: **KERNEL-CHECKED SOURCE-FAITHFUL AUDIT; THE NAMED TERMINAL HIT
ROUTES TO FRESH COMMON DELETION OR SWAPPED `FA-UNIQ4`; NON-LOAD-BEARING
AFTER THE GENERAL ANCHORED-TRANSITION COLLAPSE.**

## Scope

This lane used only the source-faithful terminal packet and its named
`terminalSecondRowHit`. It did not edit production Lean, closure docs,
proof-blueprint state, or protected producer lanes.

The inspected source data were:

- the retained `LeastPositiveTerminalHitPredecessor`;
- the original double-erased terminal second-apex row;
- the coherent source row and total critical system;
- the named terminal marginal points; and
- the live dangerous-center alignment fields.

## Theorem-bank preflight

Before proving new local statements, this lane searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran targeted `nthdegree docs search --lean` queries for:

- terminal second-row hits and least-positive predecessors;
- source-circle equality and dangerous-triple placement;
- ordered-cap/MEC localization;
- residual/source-row theorem-name matches; and
- reciprocal critical-center swap and unique-radius continuations.

No banked theorem directly supplied the requested source-circle equality or
dangerous-triple placement. The relevant reusable material was instead the
existing global deletion split and reciprocal swap reduction.

## Exact metric and placement findings

The requested source-circle equality is not a plausible local producer from
this residual. The checked theorem

```text
terminalSecondRowHit_ne_sourceRow_radius
```

proves the opposite:

```text
dist firstCenter terminalSecondRowHit ≠ sourceRow.radius.
```

Likewise, in the aligned live-dangerous branch,

```text
aligned_terminalSecondRowHit_not_mem_dangerousBase
```

puts the named hit outside `{q, t1, t2, t3}`. The other retained terminal
endpoint, not the named second-row hit, is the point forced into
`{t1, t2, t3}`.

The strongest positive localization proved in this file is:

- the two erased robust endpoints and three retained terminal marginal points
  form five distinct off-surplus points on one first-apex fiber;
- second-apex distance is injective on those five points;
- at least four of them lie in strict `oppCap1`;
- the named hit lies in the original double-erased second-apex row;
- it lies outside the coherent source row; and
- if its chosen total-critical-map center is not `oppApex2`, that chosen
  shell meets the terminal row in at most two points.

In the aligned live branch, the named hit's chosen critical center is also
different from `p`.

## Decisive named-hit routing

Let

```text
z := terminalSecondRowHit.
```

Because `z` is outside the coherent source row, deleting `z` preserves K4 at
the coherent first center. Apply global K4 at the physical second apex:

1. If deleting `z` also preserves K4 at `oppApex2`, then `z` is a fresh
   `CommonDeletionTwoCenterPacket` at the two coherent centers.
2. Otherwise a `CriticalSelectedFourClass D.A z oppApex2` exists. Its support
   is exactly the original double-erased terminal row, and the existing
   fixed-surplus swap reduction sends it directly to
   `SwappedFirstApexUniqueFourFrontier`.

This is formalized by:

```text
terminalSecondRowHit_commonDeletion_or_secondApexCritical
terminalSecondRowHit_commonDeletion_or_swappedFirstApexUniqueFour
```

The file also records the terminal-specific wrapper:

```text
sourceFaithfulTerminalAnchored_commonDeletion_or_swappedFirstApexUniqueFour
```

which resolves either the retained row-external point or the exact
three-point fallback.

## Load-bearing status

These theorems close the terminal-only producer question: no source-circle
equality or dangerous-base membership is needed to route the named hit.

They are nevertheless **non-load-bearing in the final coordinator**. A
stronger provenance-independent observation is now available: every anchored
transition already produces a `RowExternalCommonDeletionSource`, hence a
`CommonDeletionTwoCenterPacket`, without splitting terminal versus cycle
provenance. The parent lane is integrating that higher-level collapse.

This file should therefore remain a source-faithful regression/audit artifact,
not a reason to keep mining terminal metric equality.

## Validation

From `lean/`:

```bash
env LEAN_PATH=/private/tmp/p97-r-terminal-source-faithful-oleans:/private/tmp/p97-r-terminal-cap-row-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-terminal-named-metric-oleans/TerminalNamedMetricLocalization.olean \
  ../scratch/atail-force/r-terminal-named-metric-attack/TerminalNamedMetricLocalization.lean
```

The command exited `0`. Every printed declaration depends only on:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`.
