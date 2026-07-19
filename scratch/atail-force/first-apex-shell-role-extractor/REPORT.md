# First-apex shell-role extractor

Date: 2026-07-17

Status: **PROVEN IN SCRATCH. THE FULL `FirstApexShellRolePacket` IS
SOURCE-FAITHFULLY EXTRACTABLE FROM THE ORIGINAL `F0` AND `R`. THIS REMOVES
THE PACKET-PRODUCER GAP, BUT DOES NOT IDENTIFY `F0` WITH THE FRESH FRONTIER
STORED BY AN EXACT-FIVE CYCLE RESIDUAL.**

This lane owns only
`scratch/atail-force/first-apex-shell-role-extractor/`. It does not edit
production Lean, proof-blueprint state, plans, other scratch lanes, or git.

## Result

`FirstApexShellRoleExtractor.lean` proves, without `sorry`:

```lean
theorem nonempty_firstApexShellRolePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    (F0 : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F0) :
    Nonempty (FirstApexShellRolePacket F0 R)
```

The result stays indexed by the actual original frontier. It does not mention
an exact-five residual and therefore cannot smuggle in an equality between
two independently constructed frontiers.

## Required search

The lane read the theorem-bank registries required by `AGENTS.md` and ran
indexed Lean searches for:

- the retained first-apex double-deletion row;
- the first-apex exact-radius cap cover and adjacent-cap one-hit bound;
- four-point subpacket preservation; and
- the first-apex fully deletion-robust consequence.

The closest production hits were exactly the dependencies used below. No
banked theorem already stated the packet extractor.

## Construction and dependencies

The retained row is built from:

- `R.frontierRadius_class_card_ge_four`;
- `SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_two`; and
- `FiniteEndpointShell.exists_fourSubpacket_preserving_of_selected_card_ge_four`.

The preserved seed is
`{F0.pair.q, F0.pair.w, retainedInterior₁, retainedInterior₂}`. Its cardinality
is at most four even when an interior witness equals a frontier source. The
selected subrow consequently contains both frontier sources and two distinct
strict-interior witnesses; its complement outside `{q,w}` has card two.

The exact frontier-source role split uses a local `CounterexampleData` with
the same carrier, convexity, K4 hypothesis, and the supplied packet `S`:

- `U2NonSurplusSqueeze.oppApex1_exactRadiusClass_cover` gives the three-way
  role cover;
- the frontier marginal facts remove the surplus alternative; and
- `U2NonSurplusSqueeze.oppApex1_otherCap_one_hit` prevents both distinct
  frontier sources from lying in `S.oppCap2`.

The double-deletion row starts from `R.common.firstApexDouble`. The proof does
not incorrectly apply convex independence to the erased carrier. Instead it
restricts the ambient one-hit bounds to the erased radius class:

- `leftAdjacentCap_at_opposite_card_le_one_of_convexIndep`;
- `rightAdjacentCap_at_opposite_card_le_one_of_convexIndep`; and
- `selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps`.

Thus at least two erased-class members lie in the first opposite-cap
interior. A four-point subpacket preserving those two is lifted back to an
ambient `SelectedFourClass`, while its support remains a subset of
`(D.A.erase q).erase w`.

The radius split is proved directly:

- if the two row radii agree, `{q,w} ∪ doubleRow.support` has card six and is
  contained in the ambient retained radius class;
- if they differ, a common support member would equate the two radii, so the
  selected supports are disjoint.

The survival fields are the exact parent facts:

- `R.common.firstApexDouble` and `F0.secondApexDouble` for double deletion;
- `R.firstApexFullyDeletionRobust` for the two first-apex single deletions;
  and
- `F0.pair.q_survives`, `F0.pair.w_survives` for the second apex.

## Validation

Because the packet and extractor are scratch modules rather than Lake
targets, the existing packet was compiled to a temporary `.olean`, then the
extractor was checked as a single file:

```text
lake env lean -R ../scratch/atail-force/first-apex-shell-role-audit \
  -DwarningAsError=true \
  -o /private/tmp/first-apex-shell-role-extractor-olean/FirstApexShellRolePacket.olean \
  -i /private/tmp/first-apex-shell-role-extractor-olean/FirstApexShellRolePacket.ilean \
  ../scratch/atail-force/first-apex-shell-role-audit/FirstApexShellRolePacket.lean

LEAN_PATH=/private/tmp/first-apex-shell-role-extractor-olean \
  lake env lean -DwarningAsError=true \
  ../scratch/atail-force/first-apex-shell-role-extractor/FirstApexShellRoleExtractor.lean
```

Both commands exited successfully. The theorem's printed axiom closure is:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorry`, `admit`, named axiom, `native_decide`, or generated
solver trust boundary in the lane.

## Effect on the parent-coupled cycle route

This is genuine adapter progress. Any closer with the source-faithful shape

```lean
∀ P : FirstApexShellRolePacket F0 R,
  ... actual cycle hypotheses ... → False
```

can now be invoked from `F0,R` by choosing
`(nonempty_firstApexShellRolePacket F0 R).some`.

It does **not** close the period-three branch. The next target must still be
stated on the actual parent-coupled cycle, using `K := E.cycle`. In
particular, the proof must not require `E.frontier = F0`; the first-apex rows
belong to `F0,R`, while the reverse-cycle data belong to `E.cycle`.
