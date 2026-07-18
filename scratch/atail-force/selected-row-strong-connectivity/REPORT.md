# Selected-row strong-connectivity cut

Date: 2026-07-18

Status: **KERNEL-CHECKED AGGREGATE MINIMALITY CUT; NO TERMINAL CLOSURE.**

This scratch lane formalizes the global-minimality premise used by the
source-faithful exact-six total-surface search.  It owns only this directory
and does not edit production Lean, the closure documents, or protected lanes.

The intended theorem is:

```lean
exists_selectedRow_escape_of_minimal
```

For an arbitrary selected four-point equal-radius row at every carrier
center, every nonempty proper carrier subset contains a center whose selected
row has a target outside that subset.  This is exactly the no-proper-sink cut
for the selected witness digraph; on a finite graph it is equivalent to
strong connectivity.

The statement is more general than a fixed `CriticalShellSystem`: it applies
to any simultaneous choice of K4 witness rows.  The proof uses only global
cardinal minimality.  If a proper nonempty subset contained every selected
target of all of its centers, those rows would give the four-equidistant
property on the subset, contradicting minimality.

The theorem-bank registries required by `AGENTS.md` and a focused
`nthdegree docs search --lean` query were checked before adding the lemma.  No
existing declaration of this no-proper-sink selected-row statement was found.

No terminal closure is claimed.  This lemma validates one aggregate premise
of the active all-center gate; it does not show that the remaining total
surface is infeasible.

Focused validation passed with warnings treated as errors:

```text
cd lean
lake env lean -R .. -M 16384 -DwarningAsError=true \
  ../scratch/atail-force/selected-row-strong-connectivity/\
SelectedRowStrongConnectivity.lean
```

The printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

The source contains no `sorry`, `admit`, custom axiom, `unsafe`, or
`native_decide` escape hatch.
