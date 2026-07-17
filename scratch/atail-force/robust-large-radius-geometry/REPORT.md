# Robust large-radius geometry checkpoint

Date: 2026-07-16

Status: **kernel-checked global reduction; direct `False` not yet proved**.

Owned lane:

- `scratch/atail-force/robust-large-radius-geometry/`

No production source, closure-plan document, proof-blueprint state, or sibling
scratch lane was changed.

## Exact live input

This lane studies the first remaining arm of the robust physical-second-apex
classifier on the full parent surface:

- `6 ≤ S.oppCap2.card`;
- `0 < radius`;
- `5 ≤ (SelectedClass D.A S.oppApex2 radius).card`;
- the retained `CriticalShellSystem D.A`;
- global cardinality minimality `D.Minimal`;
- and the inherited non-M44/cap data.

The scratch structure `RobustLargeRadiusParentSurface` retains those fields.
The proof uses global minimality and the full ambient radius filter.  It does
not replace them by selected-four marginals and does not target either
`HasCriticalDeletionAt` or `centerAt = S.oppApex2`, which are negations of
robustness rather than valid intermediate producers.

## Bank and documentation preflight

Before proving a new transition, the lane checked the required registries:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also queried the indexed Lean corpus with `nthdegree docs search --lean`
for variants of:

- deletion-robust centers and five-point radius classes;
- cap/MEC bounds for a large opposite cap;
- global minimal blocking subdeletions;
- common-deletion two-center packets; and
- shared bisector/critical-shell pairs.

No banked theorem directly contradicts the cap-at-least-six large-radius
arm.  The load-bearing reusable declarations are instead:

- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`;
- `exists_global_cardMinimal_blocking_subdeletion`;
- `criticalSelectedFourClass_at_of_no_qfree`;
- `cross_deletion_survives_iff_not_mem_selected_support`; and
- `nonempty_commonDeletionTwoCenterPacket`.

The read-only checkpoint
`scratch/atail-force/global-minimal-deletion-core/` was also inspected.  Its
minimal-cardinality deletion extractor supplies exactly the global coupling
that the production tail currently discards.

## Checked theorem

The main theorem is:

```lean
theorem nonempty_minimalDeletionOutcome_of_largeSecondApexRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (H : CriticalShellSystem D.A)
    (F : RobustLargeRadiusParentSurface D S) :
    Nonempty (RobustLargeRadiusMinimalDeletionOutcome
      D S H F.radius)
```

It chooses two distinct points `a,b` from

```lean
SelectedClass D.A S.oppApex2 F.radius ∩
  S.capInteriorByIndex S.oppIndex2
```

and applies global minimality to `U = {a,b}`.  A nonempty
cardinality-minimal blocking subdeletion `V ⊆ U` has cardinality one or two.
The checked result is the following exact trichotomy.

### 1. Existing common-deletion packet

For some deleted point and a fresh center distinct from the physical apex,
the proof constructs

```lean
CommonDeletionTwoCenterPacket
  D H deleted freshCenter S.oppApex2
```

This is already the expected input of the common-deletion continuation lane.
It arises whenever the singleton critical shell omits the other chosen point,
or whenever a two-point core has a blocker distinct from the physical apex.

### 2. Large-cap exact unique-five profile

If the two-point core is blocked at the physical apex itself, then:

- the given ambient radius class has cardinality exactly five; and
- every positive radius supporting K4 at the physical apex equals the given
  radius.

This is packaged as `LargeCapUniqueFiveSecondApexRadius`.

This outcome must **not** be identified with the existing closed cap-five
swapped terminal.  The present branch assumes `6 ≤ S.oppCap2.card`, so an
exact five-point radius class can sit inside a larger opposite cap.  It is a
new, narrower large-cap residual.

### 3. Shared fresh critical pair

For distinct strict opposite-cap points `source, partner` on the same
physical-apex radius, the proof constructs a fresh center and an exact
`CriticalSelectedFourClass` through both points.  It proves:

- deleting `source` blocks K4 at the fresh center;
- deleting `partner` also blocks K4 at the fresh center;
- deleting either point preserves K4 at the physical apex; and
- the fresh center is not the physical apex.

This is packaged as `SharedCriticalPairAtLargeSecondApex`.  It is stronger
than a selected-row incidence statement: it records full exact-shell support,
two deletion failures, two physical-apex survivals, strict cap-interior
placement, and the shared physical radius.

## Kernel validation

The isolated scratch file elaborates successfully against the current
production build and checked scratch dependencies.  The final axiom report is:

```text
nonempty_minimalDeletionOutcome_of_largeSecondApexRadius
  depends on axioms: [propext, Classical.choice, Quot.sound]
```

There is no `sorryAx` dependency.

The validation command used the current Lean 4.27 project environment and the
already-checked olean directories for the global-minimality and continuation
scratch predecessors:

```bash
cd lean
LEAN_PATH=/private/tmp/p97-root-global-minimal-deletion-verify:\
/private/tmp/p97-global-minimal-deletion-core-oleans:\
/private/tmp/p97-joint-transition-oleans:\
../scratch/atail-force/global-minimal-deletion-core:\
../scratch/atail-force/continuation-bank-match \
  lake env lean \
  ../scratch/atail-force/robust-large-radius-geometry/RobustLargeRadiusGeometry.lean
```

## Production interface correction

The load-bearing upstream fact is already available in
`RemovableVertexAxiom/Continuation.lean`: the wrapper constructs

```lean
have hmin : D.Minimal := ...
have hnoRem := D.not_isRemovableVertex_of_minimal hmin
have hcritical := D.exists_criticalShellSystem_of_minimal hmin
```

immediately before calling `u1_largeCap_routeB_tail_false`.  The current tail
receives only `hnoRem` and `hcritical`, thereby discarding the stronger common
provenance.

The minimal interface refactor is therefore:

1. add `(hmin : D.Minimal)` to `u1_largeCap_routeB_tail_false`;
2. pass the already-constructed `hmin` from `Continuation.lean`;
3. thread `hmin` through the non-M44/two-large-cap parent theorem; and
4. invoke this transition before LIVE slot or center enumeration.

For a low-risk first patch, the existing `hnoRem` and `hcritical` arguments can
remain in place.  They can be derived internally from `hmin` later; removing
them is not required to expose the new reduction.

### Post-checkpoint integration

The parent lane has now applied this minimal refactor: the tail accepts
`hmin : D.Minimal`, and the sole caller passes its existing proof.  No
K-A-PAIR or LIVE helper signature was changed.

## Remaining mathematical frontier

This checkpoint does not close the large-radius arm by itself.  It replaces
one broad local-geometry search with two sharply specified residual consumers,
plus the existing common-deletion route:

1. consume `CommonDeletionTwoCenterPacket` using the current continuation DAG;
2. rule out `LargeCapUniqueFiveSecondApexRadius` using the unused sixth cap
   point together with cap order/full-filter geometry; and
3. rule out `SharedCriticalPairAtLargeSecondApex` using the two exact deletion
   blockers plus cap order, or transport it to an existing immediate sink.

These are the correct objects for the next proof search.  Further mining of
selected-four marginals or attempts to prove physical-apex criticality would
discard the global information that made this reduction possible.
