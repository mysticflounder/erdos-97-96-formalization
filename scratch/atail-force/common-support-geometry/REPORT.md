# Common-support geometry audit

## Decision

The proposed first producer

```lean
∃ f, f ∈ P.row₁.support ∧ f ∈ P.row₂.support
```

is not a local consequence of the strict metric hinge.  A common selected
point must be an ambient equilateral apex over the chord `P.z₁ P.z₂`, and
the current `SelectedFourClass` interface then has a second, independent
selection problem: its support is an arbitrary four-subset of a radius class,
not the whole class.

This audit does **not** refute the theorem under the entire live parent.  The
exact regression below omits a load-bearing MEC-to-cap/apex binding and global
K4/criticality.  It does show that any proof from the full parent must visibly
use those omitted hypotheses to do two things:

1. put an equilateral apex of `P.z₁ P.z₂` in the carrier; and
2. force that apex into both particular selected supports.

No checked bank theorem supplies either step.  Therefore common-support-first
is operationally overstrong as the next standalone producer unless a new
global-K4/critical-incidence theorem is found.  It should not be treated as a
consequence of MEC cap order alone.

## Kernel-checked characterization

`CommonSupportGeometry.lean` proves:

- `nativeEquilateralApex_of_commonSupport`: every common native support point
  lies in `D.A`, is distinct from both centers, and has all three distances
  
  ```text
  dist f z₁ = dist f z₂ = dist z₁ z₂;
  ```

- `exists_nativeEquilateralApex_of_commonSupport`: common-support
  nonemptiness produces such an ambient equilateral apex;
- `native_supports_disjoint_of_no_equilateralApex`: if the carrier has no
  such apex, the selected supports are disjoint; and
- `commonSupport_of_nativeEquilateralApex_of_radiusSaturated`: the converse
  holds if both selected rows contain every ambient point at their chosen
  radius.

The last hypothesis is intentionally named `RadiusSaturated`.  It is absent
from `SelectedFourClass`.  Global K4 gives existence of at least four points
at some radius; it does not make an arbitrary selected four-subset saturated.

All four declarations compile with kernel closure exactly among

```text
propext, Classical.choice, Quot.sound
```

and none depends on `sorryAx`.

## Exact strict-arm regression

`verify_strict_arm_regression.py` checks an explicit sixteen-point rational
configuration.  Exactly, not numerically, it has:

- sixteen distinct points in strict convex position;
- a parent four-point circle at `O2` containing `z1,z2,kL,kR`;
- two mutual native radius-one rows centered at `z1,z2`, unequal to the
  parent radius and omitting `O2`;
- zero selected-row overlap;
- exclusive strict metric-hinge witnesses `x=a1`, `y=b1`, with own-center
  squared distance `1` and cross-center squared distance `2/5`;
- a structural cap shadow of sizes `(5,8,6)`, failure of `(m,4,4)`, strict
  second-cap placement of `z1,z2`, strict first-cap placement of `a1,b1`, and
  zero surplus hits in both selected rows;
- an exact MEC disk centered at `(1/2,-1/6)` with squared radius `5/18`, whose
  boundary is exactly `{z1,z2,a1,b1}` and which has the non-obtuse boundary
  triple `z1,z2,a1`; and
- an explicit failure of radius saturation: `U` is an ambient radius-one
  point at `z1` but is omitted by the selected row at `z1`.

The regression deliberately reports the binding it does **not** satisfy.  The
structural triangle giving the strict cap shadow has live second opposite
apex `U`, whereas the parent row is centered at `O2`; that structural triangle
is not the MEC-promoted triangle.  The carrier also fails global K4 at thirteen
named points and carries no total `CriticalShellSystem` or no-removability
proof.  Hence this is an exact regression against local metric/cap/MEC pieces
considered separately, not a `CounterexampleData` model and not a
counterexample to a producer that genuinely consumes the omitted bindings.

## Bank and indexed-search result

The required registries and JSON inventories were checked before introducing
the characterization:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches covered two selected rows with common support,
mutual incidence, strict witnesses, and the two-large-cap obstruction.  The
nearest results remain upper bounds or consumers:

- `SelectedFourClass.inter_card_le_two` bounds overlap from above;
- `u2_sharedBase_strictWitness_elim` assumes three common circle points;
- the C5D3B common-row theorems assume specialized packet/profile data not
  produced by the live parent; and
- `u1TwoLargeCapObstruction` consumes a common point plus three reverse
  equalities.

The existing `CriticalShellSystem.selectedFourClass_support_eq_shell` gives
full-shell locking only after a continuation center is identified as the
chosen blocker of a source.  No live theorem makes either `P.z₁` or `P.z₂`
such a blocker in a way that saturates the two native rows.

## Validation

From `lean/`:

```bash
LEAN_PATH=/tmp/p97-joint-transition-oleans:/tmp/p97-mixed-parent-coupling \
  lake env lean \
  -R ../scratch/atail-force/common-support-geometry \
  -M 16384 \
  -o /tmp/p97-joint-transition-oleans/CommonSupportGeometry.olean \
  ../scratch/atail-force/common-support-geometry/CommonSupportGeometry.lean
```

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/common-support-geometry/verify_strict_arm_regression.py
```

Both checks pass.
