# ATAIL Stage-I focused scratch validation

Date: 2026-07-14

## Scope and serialization

The three deferred scratch checks were run only after the repository's active
`lake-build Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6AFirstPart1Native`
completed, its lock disappeared, and `lsof` showed no remaining `lake` or
`lean` process with the project Lake root as its working directory.  The
checks were then run serially with a 16 GiB Lean memory cap.

These files are deliberately unimported scratch modules.  Their successful
direct-file checks establish current elaboration and the printed declaration
axiom closures; they do not change the production proof spine or close
K-A-PAIR.

## Three-dangerous-point sink

Command, from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/stage1_three_dangerous_equidistant_sink.lean
```

Result: exit 0.  All four printed endpoints have exactly
`[propext, Classical.choice, Quot.sound]`:

- `false_of_fixedTriple_secondCenter_two_equalities`;
- `false_of_fixedTriple_secondCenter_q_t1_t3_equalities`;
- `false_of_fixedTriple_mem_uRow_support`; and
- `false_of_fixedTriple_q_t1_t3_mem_uRow_support`.

Source SHA-256:
`b7b6b50fa9eb69880cc64dbcefb53d945170740123a0a3b34e1acd17d602d8bb`.

## Critical-map geometry

Command, from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/stage1_critical_map_geometry_2026-07-14.lean
```

Result: exit 0.  The full repaired module elaborates.  Printed closures are:

- `centerFiberIn_capByIndex_card_le_two`:
  `[propext, Classical.choice, Quot.sound]`;
- `sourcesIn_capByIndex_card_le_two_mul_inside_add_four_mul_outside`:
  `[propext, Classical.choice, Quot.sound]`;
- `capByIndex_card_le_two_add_four_mul_complement_of_unique_inside_center`:
  `[propext, Classical.choice, Quot.sound]`;
- `one_inside_center_capacity`: `[propext, Quot.sound]`; and
- `card_twelve_cap_four_to_six_not_mixed_capacity_threshold`:
  `[propext, Classical.choice, Quot.sound]`.

Source SHA-256:
`d2d7d1bc265ba9e524e3ac3222b99332fbf04f363a02d26eacf46ae56bdeb38c`.

## Short-output incidence countermodel

The target imports another scratch module.  To avoid creating build products
in the repository, the dependency was compiled with the scratch directory as
its module root and its olean written to a fresh `/tmp` directory.  The target
was then checked with that directory prepended to the Lake-provided
`LEAN_PATH`.

Dependency result: exit 0.  Its four printed declarations have only the
standard core closure; one uses all of
`[propext, Classical.choice, Quot.sound]`, while the other three use the
subset `[propext, Quot.sound]`.

Target result: exit 0.  Both printed endpoints have exactly
`[propext, Classical.choice, Quot.sound]`:

- `supplied_rows_have_common_provenance_with_p_hit`; and
- `both_short_outputs_with_no_dangerous_support_hit`.

Target source SHA-256:
`ff6537354ae2d511bbf07dfaaf053d0a903fe729f18cc3f75f05854881c81fea`.

## Verdict

All three deferred sources are now **CHECKED-SCRATCH**.  No printed endpoint
depends on `sorryAx` or a custom axiom.  This validates the consumer
reductions, the negative critical-map capacity result, and the finite
incidence dependency countermodel.  It does not produce either missing
dangerous equality, `OppApex2InBlockerImage`, or `ApexAlignedTwoHit`; the live
K-A-PAIR theorem remains open.

## Prescribed-apex deletion dichotomy

Command, from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/stage1_prescribed_apex_deleted_k4_dichotomy.lean
```

Result: exit 0 after repairing declaration-scope decidability, the pinned
`Finset.erase_right_comm` name, cap-interior arithmetic reuse, and explicit
`SelectedClass`/critical-support rewrites.  All 27 printed endpoints have
axiom closure exactly `[propext, Classical.choice, Quot.sound]`; none contains
`sorryAx` or a custom axiom.

Source SHA-256:
`47929b843557e396df7fdab0428f18426f8220f4081770a36e2d6835300fd771`.

## Finite minimal-deletion core

Command, from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/stage1_minimal_deletion_core.lean
```

Result: exit 0 after replacing two malformed lambda arrows and reusing the
same checked cap-interior/support normalization.  All five printed endpoints
have axiom closure exactly `[propext, Classical.choice, Quot.sound]`; none
contains `sorryAx` or a custom axiom.

Source SHA-256:
`0194f5ebee9a866eb1816f3a6f855dbfbdf8003f19718ea0e1da4cb0a36a94dc`.

## Apex-flip cycle boundary

The exact finite-shadow checker also passes:

```bash
UV_CACHE_DIR=.uv-cache uv run python \
  scratch/atail-force/stage1_apex_flip_cycle_countermodel_2026-07-14.py
```

It verifies a forced `{1,2} -> {6,7} -> {1,2}` cycle at the current abstract
full-filter interface.  This is exact within the 12-vertex symmetric
distance-label/cap shadow, not a Euclidean/convex/MEC counterexample.  Its
source SHA-256 is
`7886379b1b8b2f5f863c1ccae2c88806f6eb8befbdb8cc315f112e28e4411527`.

The new sources are therefore **CHECKED-SCRATCH**, but K-A-PAIR remains open.
The first positive missing theorem is a one-step bi-apex alternative on the
same twice-erased carrier; cumulative survival would make remaining-carrier
cardinality strictly decrease, while the shell arm still needs its own
cap/order/critical-row consumer.
