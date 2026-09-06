# Exact-five one-hit global-preservation audit

Date: 2026-09-05

Lane: `exactfive-onehit-global-preservation-20260905`

Base commit: `9e2e850a7152f61c68cb8536002b62ec7102a97b`

## Scope

The one-hit shell reselection already proved that `CriticalShellSystem.overrideAt`
leaves every source other than the retained endpoint unchanged.  The earlier
public transition theorem kept only the omitted endpoint's instance of that
fact.  This checkpoint retains the universal fact through both orientations of
the minimum-pair transition.

No new mathematical hypothesis is introduced.  The new fields and conjuncts
are projections of the `hother` proof returned by
`exists_reselection_of_mem_support`.

## Lean changes

- `exists_reselection_of_one_hit` now returns the center equality at every
  source distinct from the retained endpoint.
- `QOmittedWHitReselection` and `WOmittedQHitReselection` retain that equality
  as `other_center_eq`.
- Both `nonempty_reselected_minimalDistinct_*` theorems and both package
  constructors thread the existing proof into the public structures.
- `QOmittedWHitReselection.old_center_eq_of_new_center_eq` and its symmetric
  counterpart transport an alleged post-reselection blocker return, away from
  the retained endpoint, to the corresponding equality in the old shell
  system.

The impact audit found no structure literals or destructuring consumers outside
`ExactFiveOneHitShellReselection.lean`; downstream uses require no edit.

## Consequence and remaining obstruction

This checkpoint makes the global preservation fact available to the no-return
argument.  If a non-retained source maps to the old retained blocker after
reselection, the new helper proves that it already mapped to that blocker in
the old system.

This does not prove no-return.  The remaining step must exhaust the old blocker
fiber or exhibit enough distinct old sources in that fiber to contradict the
known fiber bound.  Current one-hit data supplies too few forced preimages for
that contradiction.

## Validation

- Lean language-server diagnostics for
  `ExactFiveOneHitShellReselection.lean`: no errors.
- Focused `lake env lean` compilation: exit 0.
- Marker scan: no `sorry` or `#print axioms` in the owned Lean source.
- Adversarial read-only review: no correctness blocker, orientation error,
  dependent-proof mismatch, or external consumer edit found; one underspecified
  docstring was corrected before commit.
- Sparse worktree hygiene report: zero lane issues; repository-wide foreign
  dirty and untracked paths remain outside this lane.
