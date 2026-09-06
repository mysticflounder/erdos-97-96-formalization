# Selected-four-class one-boundary intersection

Lane: `selected-four-class-one-boundary-intersection-20260906`

Base head: `3a86fc5616d90a2d75e5e382c243337a47e352e8`

## Scope

This lane adds the low-import public helper
`Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex` in
`lean/Erdos9796Proof/P97/SelectedFourClassOneBoundaryIntersection.lean`.
It packages the existing checked point-equality theorem
`Erdos9796Proof.Geometry.eq_of_one_boundary_same_radius_pair` into a
cardinality bound for two selected four-classes.  The enclosing-disk
containment, center support, boundary-apex equality, and apex-membership
guard remain explicit.  No exact-thirteen source packet, cover, finite key,
or terminal contradiction is asserted.

The focused probe is
`lean/Erdos9796Proof/P97/SelectedFourClassOneBoundaryIntersectionTest.lean`.

## Validation

Validation is intentionally limited to the owned module and probe.  The
governed target command is:

```text
lake-build Erdos9796Proof.P97.SelectedFourClassOneBoundaryIntersection
```

The probe command is:

```text
lake env lean Erdos9796Proof/P97/SelectedFourClassOneBoundaryIntersectionTest.lean
```

The target build exited `0` after 8028 jobs.  Its build log is:

```text
lean/.lake/lake-build-logs/4718-1788710073581005000.log
```

The focused probe also exited `0` and printed:

```text
'Problem97.SelectedFourClass.inter_card_le_one_of_mem_boundary_apex' depends on axioms: [propext,
 Classical.choice, Quot.sound]
```

The build wrapper's best-effort proof-blueprint resync was not fully green: a
pre-existing private declaration was absent from the imported environment.
The source index refresh completed, and this unrelated graph-cache warning
does not affect the successful target build or focused probe.  This receipt
does not claim aggregate spine reachability or a terminal contradiction.
