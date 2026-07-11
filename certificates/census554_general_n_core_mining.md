<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Census-554 general-n equality-core mining

Generated `2026-07-11T00:23:37.670731+00:00` from the first `5632` rows of `scratch/census-554/bank.jsonl`.
Snapshot SHA-256: `20623311cb21a68ec2c13270bd9a7637aafd806f16b39aa52795a72ff56134e6`.

This read-only pass closes distance equalities transitively and tests
for four formalized geometric obstructions: duplicate circumcenters,
an equal-K4, an equilateral-bisector collision, and a three-triad
collision. It does not verify polynomial certificates or prove
that the census cover is complete.

This artifact intentionally names an append-only bank prefix; rows
appended later are outside its claimed snapshot.

## Summary

- Bank rows: `5632`; unique pids: `5631`
- Unlabeled motifs: `1670`
- Duplicate-center closure: `1148` rows / `27` motifs
- Equal-K4 closure: `283` rows / `5` motifs
- Equilateral-bisector closure: `1116` rows / `31` motifs
- Three-triad closure: `230` rows / `9` motifs
- Outside all four closures: `2855` rows / `1598` motifs
- Role-labeled orbit instances covered by the four closures: `61029` of `149594` after deduplicating pids

## Frontier check

After row `5154`, the `478`-row tail contains `403` motifs, of which `311` are new versus the prefix.
The newest `132` rows contain `131` motifs, with `131` new versus the earlier bank; `1` hit one of the four closures and `131` lie outside them.
This is evidence against motif-alphabet stabilization, not a theorem
that stabilization is impossible.

## Existing Lean bank

Of the `21` generated `Bank/Pat` modules, `12` are equal-K4 closure instances and `2` are equilateral-bisector instances.
`Census554/Bank/EqualityCore.lean` now contains kernel-checked
structural proofs for every listed instance of those two families. The remaining
modules still require their existing certificates or another sound kernel.

## General-n theorem surface

The theorem layer is formalized across `Census554/EqualityCore.lean`,
`FivePointCollision.lean`, and `ThreeTriadCollision.lean`:

1. `EdgeClosure.sound` transports realized row equalities through finite
   edge-equality closure;
2. `not_realizes_of_duplicateCenterCore` routes a duplicate-center
   closure witness to
   `Problem97.not_dist_eq_three_of_ne`; and
3. `not_realizes_of_equalK4Core` routes an equal-K4 closure witness to
   `Problem97.u5_unit_triangle_on_p_circle_incompatibility`;
4. `not_realizes_of_equilateralBisectorCollisionCore` routes its
   six closure relations to `equilateral_bisector_collision`; and
5. `not_realizes_of_threeTriadCollisionCore` routes its six closure
   equalities to `three_triad_collision`.

The definitions and soundness theorems can quantify over arbitrary finite
label types, so they are genuinely ambient-cardinality independent.
`--lean-out` emits explicit finite paths for the selected bank modules;
the Lean kernel checks those paths without a new geometric axiom.

## Frequent motifs

| rows | status | first pid | last pid | canonical rows |
|---:|---|---|---|---|
| 443 | duplicate-center | `pat_00002` | `pat_05357` | `0:1,2; 1:0,2; 2:0,3; 4:0,1,3` |
| 315 | duplicate-center | `pat_00011` | `pat_05351` | `0:1,2; 1:0,3; 2:0,3,4; 4:1,2` |
| 190 | three-triad | `pat_00187` | `pat_05360` | `0:1,2; 1:0,3; 2:1,3,4; 4:0,1,3` |
| 135 | equal-K4 | `pat_00000` | `pat_05325` | `0:1,2; 1:0,2,3; 3:0,1,2` |
| 123 | equilateral-bisector | `pat_00032` | `pat_05269` | `0:1,2; 1:0,3,4; 3:0,1,2; 4:2,3` |
| 114 | equilateral-bisector | `pat_00061` | `pat_05328` | `0:1,2; 1:0,2,3; 3:0,1,4; 4:0,2` |
| 105 | equilateral-bisector | `pat_00016` | `pat_05262` | `0:1,2; 1:0,2,3; 3:1,2,4; 4:0,1` |
| 99 | equilateral-bisector | `pat_00019` | `pat_05111` | `0:1,2; 1:0,2,3; 3:0,1,4; 4:1,2` |
| 82 | equilateral-bisector | `pat_00303` | `pat_05358` | `0:1,2; 1:0,3,4; 2:1,3; 4:0,1,3` |
| 80 | equilateral-bisector | `pat_00013` | `pat_05312` | `0:1,2; 1:0,3,4; 3:0,1,2; 4:0,2` |
| 75 | equilateral-bisector | `pat_00067` | `pat_05342` | `0:1,2; 1:0,3,4; 2:3,4; 3:0,1,4` |
| 68 | equilateral-bisector | `pat_00014` | `pat_05305` | `0:1,2; 1:0,2,3; 3:1,2,4; 4:0,2` |
