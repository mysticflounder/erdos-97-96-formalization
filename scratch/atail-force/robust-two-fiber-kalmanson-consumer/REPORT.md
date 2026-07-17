# Robust two-fiber ordinal/Kalmanson consumer

Date: 2026-07-17

Status: **KERNEL-CHECKED GENERIC TERMINAL; LIVE MULTI-FIBER PRODUCER STILL
MISSING. NO PRODUCTION `sorry` IS CLOSED.**

## Bank and indexed-corpus preflight

Before deriving the terminal, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran `nthdegree docs search --lean` queries for ordered selected rows,
strict distance cycles, blocker fibers, and the exact `O,A,X` support pattern.
The searches found the current production Kalmanson bridge, generic ordinal
cycle consumer, and older U5 strict-order kernels, but no theorem with the
six-role support pattern proved here. The closest production geometric
terminal,

```text
CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities
```

uses a different five-point order and different three shell equalities.

## Exact generic terminal

`RobustTwoFiberKalmansonConsumer.lean` introduces

```lean
OrderedRobustTwoFiberKalmansonCore
```

with six boundary roles in the order

```text
O < A < X < J < C < K
```

and exactly the following selected-row incidences:

```text
O-row: J, C     giving OJ = OC
A-row: C, K     giving AC = AK
X-row: J, K     giving XJ = XK.
```

No full support equality, radius name, blocker-map equation, cap role, or
unused shell point is assumed.

The first cyclic quadruple `O,A,J,C` and the `O`-row give

```text
AJ < AC.
```

The second cyclic quadruple `A,X,J,K` satisfies

```text
XJ + AK < AJ + XK.
```

The `X`-row cancels `XJ = XK`, giving `AK < AJ`; the `A`-row then transports
this to `AC < AJ`. The two strict comparisons contradict asymmetry.

The terminal is

```lean
false_of_ordered_robust_twoFiberKalmansonCore
```

and is source-`sorry`-free.

## Match to the pinned `O,A,X` core

The fixed fourteen-role shadow has the three rows

```text
O-row: A,C,D,E,J
A-row: C,G,K,O
X-row: F,J,K,Y.
```

The generic terminal retains only `J,C` from the first row, `C,K` from the
second, and `J,K` from the third. It is therefore an exact Lean consumer of
the inclusion-minimal finite certificate rather than a restatement of all
fourteen roles.

There is one important quantifier correction. In the blocker-map reading,
`C` and `K` are two sources in the nontrivial `A`-fiber. The `X`-fiber is also
nontrivial in the pinned shadow, but its multiplicity is not itself used by
the strict-cycle proof. What is used is the exact `X`-row containing both its
source `J` and the cross-fiber source `K`.

Consequently:

> A robust-apex row plus two anonymous nontrivial blocker fibers does not yet
> instantiate this terminal. The live producer must also prove the displayed
> cyclic placement and the cross-support incidence `K ∈ X-row` (up to a
> cyclic relabeling of the six roles).

This is the smallest honest producer boundary exposed by the pinned core.
The already-proved one-fiber blocker collision supplies neither a second
ordered fiber nor the cross-support incidence.

## Relation to the generic ordinal consumer

The first comparison is the existing
`dist_lt_of_ccw_of_dist_diagonal_eq_side` ordinal cancellation. The second
comparison cancels a row centered at the **second** vertex of the cyclic
quadruple. The current `SelectedRowOrdinalComparison` constructors cover rows
centered at the first or third vertex, so they do not directly encode this
orientation. The scratch terminal therefore invokes the underlying
`dist_add_dist_lt_diagonal_sum_of_ccw` theorem and performs the exact
`linarith` cancellation.

If this route is promoted, either this direct six-role terminal can move to
production unchanged, or `SelectedRowOrdinalComparison` can gain the missing
second-vertex orientation first. That API extension is optional; it is not a
mathematical blocker.

## Validation

Focused elaboration from the Lake root succeeded with:

```text
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/robust-two-fiber-kalmanson-consumer/\
RobustTwoFiberKalmansonConsumer.lean
```

All three printed declarations have axiom closure exactly:

```text
propext
Classical.choice
Quot.sound
```

Only files under
`scratch/atail-force/robust-two-fiber-kalmanson-consumer/` were created.
