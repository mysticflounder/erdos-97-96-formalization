# Reverse-mixed critical-radius consumer report

Date: 2026-07-15

## Scope

This scratch lane tests whether the newly available deleted-apex
omission/distinct-radius pattern closes the reverse-mixed residual.  It owns
only `scratch/atail-force/reverse-mixed-radius-consumer/`; it does not edit the
production tree, shared closure docs, `SurplusM44`, or the unique-row lane.

## Preflight

Before proving a new radius lemma, the required theorem-bank registries were
searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered critical deletion,
exact shells, distinct radii, cap/MEC rigidity, reverse-mixed two-center
packets, and the U5 q-critical kernels.  The closest existing results were
the apex-specific equivalence in `DeletedApexOmissionProducer.lean`, the
critical-shell exact-support API, the cap-five opposite-apex rigidity family,
and the two U5 q-critical incidence incompatibilities.  None has the missing
blocker-center/cap-role incidences required here.

## Kernel-checked result

`CriticalShellRadiusConsumer.lean` proves a center- and source-generic version
of the deleted-apex pattern.

- `criticalShellOmission_iff_distinctRadiusClass`: for any exact critical
  four-shell through `source` at `center`, a selected four-row at `center`
  omitting `source` exists iff a positive K4-capable radius different from the
  shell radius exists.
- `criticalShellRadiusRigidity_of_blocked`: if deleting `source` blocks K4 at
  `center`, neither object exists and every positive four-capable radius at
  that center is the shell radius.
- `nonempty_reverseMixedApexShellReduction_with_radiusRigidity`: attaches the
  generic packet to the late-chosen shell in the five-way reverse-mixed
  reduction.
- `fullParent_installed_reverseMixedRadiusBoundary`: consumes the actual
  circumscribed-MEC/cap/no-`IsM44` wrapper and returns both (i) a second cap of
  cardinality at least five and (ii) the late-installed reverse-mixed shell,
  its five-way reduction, and its exact radius rigidity.

The full-parent theorem is a reduction, not `False`.  Its two outputs are
still parallel facts.

Compared with `deletedApexOmission_iff_distinctApexRadiusClass`, this is not a
new geometric mechanism.  It is the same exact-support/radius-rigidity
producer with the apex-specific packet fields removed, so it can be reused
uniformly at each of the four aligned blocker centers.  The genuinely new
content is only that uniform interface and its checked composition with the
reverse-mixed/full-parent reduction.

## Exact remaining producer

At the selected reverse-mixed blocker center, produce any one of the following
equivalent data:

1. a selected four-row omitting the common apex;
2. a positive four-capable radius different from the critical-shell radius;
3. survival of K4 after deleting the common apex.

Any of these immediately contradicts the already-recorded deletion failure.
The current parent supplies none of them.

The apparent nearby banks do not silently fill this field:

- The cap-five theorems control radii centered at a Moser apex opposite the
  relevant cap.  The reverse-mixed critical shells are centered at blockers
  `x`, `u`, `y`, or `v`; no current theorem identifies any such blocker with
  the required opposite-apex role.
- The two U5 q-critical kernels need additional cross-incidence: a shared
  non-source point together with adjacency of the two blocker centers, or a
  second common triple point.  The reverse-mixed packet records neither.
- No-`IsM44` produces a second large cap but no theorem localizes four points
  of one radius at a selected reverse-mixed blocker.

Choosing continuation rows adaptively can make a blocked prescribed-apex
shell coincide with a selected row in a routed configuration.  This is an
operational proof target only.  Once a dispatch exists, switching between
chosen and all-branch outer surfaces does not create additional mathematical
force, so no logical weakening or closure claim is made here.

## Regression boundary

The pinned exact `Q(sqrt(3))` reverse-mixed regression still realizes all four
aligned blocker cases (`x`, `u`, `y`, `v`) in its stated partial abstraction.
It confirms that cap-side separation supplies only the opposite-side
inequality; the same-side candidate may equal the blocker.  Its scope is
exact symbolic geometry plus a finite incidence/`oppCap2`-side shadow, not a
full `CounterexampleData`, MEC, global-K4, or total critical-system model.

Therefore the local reverse-mixed incidence/radius object has reached a stable
producer boundary.  More rounds over the same object cannot manufacture the
missing parent localization theorem.

## Validation

Focused Lean check from `lean/`:

```text
LEAN_PATH=/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-mixed-parent-coupling:../scratch/atail-force/full-geometry-producer \
  lake env lean \
  -R ../scratch/atail-force/reverse-mixed-radius-consumer \
  -M 16384 \
  -o /private/tmp/p97-joint-transition-oleans/CriticalShellRadiusConsumer.olean \
  ../scratch/atail-force/reverse-mixed-radius-consumer/CriticalShellRadiusConsumer.lean
```

Result: success.  Every printed theorem dependency is exactly
`[propext, Classical.choice, Quot.sound]`.

Pinned regression:

```text
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/mixed-parent-coupling/verify_cap_quotient_regression.py
```

Result: success for all four aligned blocker cases.
