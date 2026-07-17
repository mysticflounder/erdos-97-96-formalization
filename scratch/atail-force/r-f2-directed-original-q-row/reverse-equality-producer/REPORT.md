# Reverse-equality producer audit

Date: 2026-07-16

Status: **kernel-checked target correction; not a producer and not the
load-bearing generated-successor closure route**.

Owned surface:

- `ReverseEqualityProducer.lean`
- this report

No production file, shared closure document, protected lane, LIVE-Q/C file,
`SurplusM44`, `CriticalPairFrontier`, card-five, or unique-row file was edited.

## Question audited

On the equal-source, non-equilateral, exclusive strict-witness arm, the prior
bank adapter exposed three missing reverse equalities:

1. `dist p V.x = dist p z₂`;
2. `dist p V.x = dist p V.y`;
3. `dist V.y V.x = dist V.y z₁`.

The task was to find a source-faithful producer of those equalities, or a
strictly weaker direct `False` sink, without changing the fixed role map.

## Mandatory bank preflight

The audit inspected all registries required by `AGENTS.md` before deriving a
new local theorem:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` inventory;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The JSON inventories were queried for normalized statements involving the
current five-point metric packet, equal-source rows, reverse-radius
equalities, cap placement, and same-cap incompatibility.  The closest useful
declarations were contradiction consumers, not incidence producers:

- the current import-reachable
  `Problem97.u5_equilateral_opposite_point_metric_incompatibility`;
- sibling same-cap wrong-side consumers requiring a
  `SameCapIncompatibleEdge` packet not present here;
- the current two-circle/cap-order terminals; and
- q-critical singleton-tail consumers with different retained-row inputs.

Focused indexed-corpus searches were also run with
`nthdegree docs search --lean` for:

- `five point equilateral opposite point metric incompatibility reverse equalities`;
- `two continuation rows exclusive witnesses equal source common live center`;
- `dist p x equals dist p y same circle cap strict opposite cap`;
- `dist y x equals dist y z1 selected four shell critical row`;
- `two distinct circle centers exclusive support points strict cap direct contradiction`;
- `equal source generated successor non-equilateral support intersection singleton`.

No bank supplies a source-faithful proof of any missing reverse equality from
the retained full-parent fields.  Re-mining another role map or the already
invalid `StrictOppCap1CommonHit` packet was therefore not pursued.

## Kernel-checked correction

The exact live support is

```text
{q, K.named.x, K.named.y, R.sourcePair.x}.
```

For a carrier point `z` in strict `oppCap1`, the first three alternatives are
excluded:

- `q` lies in the surplus cap;
- `K.named.x` lies in `oppCap2`;
- `K.named.y` lies in `oppCap2`.

Exact row membership then proves:

```lean
dist p z = dist p K.named.y ↔ z = R.sourcePair.x
```

This is formalized as

```lean
strictOppCap1_liveRadius_iff_eq_coherentSource
```

and adapted to the generated continuation row as

```lean
strictWitness_liveRadius_iff_eq_coherentSource.
```

It follows that reverse equalities (1) and (2) already force

```text
V.x = R.sourcePair.x = V.y,
```

contradicting `V.x_ne_y`.  The direct sink is

```lean
false_of_strictWitness_two_liveCenterEqualities.
```

The old three-field packet is discharged by

```lean
false_of_liveCenterReverseEqualities_exactSupport,
```

which deliberately does not use equality (3).

## Exact remaining deficit

This result is a **target correction**, not a producer:

- producing equality (1) is exactly the same as proving
  `V.x = R.sourcePair.x`;
- after equality (1), producing equality (2) is exactly enough to identify
  the other strict witness with the same coherent source and is immediately
  contradictory;
- equality (3) contributes nothing to the contradiction.

Therefore an honest proof cannot derive all three equalities as a realizable
intermediate packet unless it has already proved the parent branch false.
There is no reason to mine a producer for equality (3), and the pair (1)+(2)
should be replaced by a direct branch contradiction if this surface is ever
used again.

No exact Euclidean countermodel of the full parent was claimed or sought in
this bounded audit.  The checked theorem is stronger evidence for the target
decision: the proposed combined producer packet is itself impossible on the
full-parent surface.  The individual identification (1) remains unproved by
the retained fields.

A sibling lane has since identified a more direct companion-membership/cap-
order route for the generated-successor branch.  Accordingly, this file is a
generic theorem-surface audit and should not be wired as the load-bearing
closure route.

## Validation

`ReverseEqualityProducer.lean` was checked directly with Lean 4.27.0 from
`lean/`, using the current scratch olean search path and:

```text
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-reverse-equality-producer-oleans/ReverseEqualityProducer.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/reverse-equality-producer/ReverseEqualityProducer.lean
```

All five printed declarations depend only on:

```text
propext
Classical.choice
Quot.sound
```

The Lean file contains no `sorry`, `admit`, declared axiom, `native_decide`,
or `unsafe`.  No full Lake build was run.
