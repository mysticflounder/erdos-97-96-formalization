# Exact-five card-13 all-one-hit orbit normalization

Date: 2026-07-22

Status: **PROVEN IN ISOLATED SCRATCH LEAN. NO FINITE CONTRADICTION AND NO
SOURCE `sorry` CLOSED.**

## Result

[`ExactFiveCard13AllOneOrbitNormalization.lean`](./ExactFiveCard13AllOneOrbitNormalization.lean)
proves the source-level boundary normalization, the required three-way CNF
ingress packet, and a separate optional two-mode role quotient.

### Boundary frame

```lean
nonempty_canonicalAllOneBoundaryFrame
```

From the live exact-five residual `Q`, its unique-five profile, and
`D.A.card = 13`, this theorem constructs a common `Fin 13` carrier labeling
whose named apices are at `0`, `4`, and `8`, and whose strict physical
second-cap set is exactly the image of indices `{1,2,3}`.

The frame also carries both strict Kalmanson inequalities for every increasing
quadruple in this exact labeling.

The proof consumes the existing two-way CCW apex placement.  It keeps the
direct placement unchanged and applies the existing zero-cut cyclic reversal
to the reverse placement.  It does not use a two-hit row.

### Three-way CNF ingress packet

```lean
nonempty_canonicalAllOneThreeWayCnfPacket
```

This is the certificate-facing result.  It keeps the original canonical
cyclic frame unchanged and classifies the hub into exactly the three orbits
used by the encoder:

| Lean orbit | Encoder orbit | hub | `g0` spoke | `g1` spoke |
| --- | --- | ---: | ---: | ---: |
| `hubLeft` | `allOneHitHubLeft` | 1 | 2 | 3 |
| `hubMiddle` | `allOneHitHubMiddle` | 2 | 1 | 3 |
| `hubRight` | `allOneHitHubRight` | 3 | 1 | 2 |

The packet constructs a selected ambient four-row at every carrier center for
each cover edge.  `cover₀` is always aligned with the displayed `g0` spoke and
`cover₁` with the displayed `g1` spoke.  Because the source star's names
`spoke₁` and `spoke₂` are arbitrary, `cover_alignment` records whether these
two independent source families are used directly or swapped.  They are never
identified or forced to share a row.

The packet also preserves the fixed-`H` actual selected support at every
original boundary label and proves its one-hit property at indices `1,2,3`
from the supplied `hall` hypothesis.

### Optional role-only quotient

```lean
nonempty_canonicalAllOneHubOrbitPacket
```

Starting from `Q`, `profile`, a genuine
`PhysicalGlobalCrossDeletionStar profile`, the actual fixed-system hypothesis
`AllPhysicalActualCriticalRowsOneHit H profile`, and `D.A.card = 13`, this
constructs an optional packet with two role modes:

- `middle`: the hub is canonical index `2`, and the spokes are indices
  `{1,3}`;
- `extreme`: the hub is canonical index `1`, and the spokes are indices
  `{2,3}`.

If the hub initially occupies boundary index `3`, the constructor uses the
explicit role reflection

```lean
Equiv.swap (1 : Fin 13) 3
```

to move it to index `1`.  An initial hub at `1` or `2` uses the identity.

The packet preserves source provenance:

- `actualSupport i` is definitionally the support selected by the original
  fixed `CriticalShellSystem H` at the transported carrier point;
- every strict physical source row still has exactly one physical hit by the
  supplied `hall` hypothesis;
- `hub_spoke₁_cover` and `hub_spoke₂_cover` are the two original, independent
  global-cover families from `star`, evaluated at the transported center;
- the spokes are identified as a set, so no unjustified ordering or equality
  between the two cover families is introduced.

## Boundary-order discipline

The `1 ↔ 3` map is deliberately named a **physical-role reflection**.  It
fixes all other carrier labels and is not asserted to preserve increasing
cyclic boundary order.  The packet therefore retains both:

- `boundary`, the actual boundary-normalized labeling; and
- `reindex`, the identity-or-reflection map used for the role labels.

This two-mode packet is **not** the CNF ingress.  The three-way packet above
uses `boundary.boundaryPoint` directly, retains all three left/middle/right
orbits, and consumes `boundary.strictKalmanson` without any `1 ↔ 3` relabeling.
Any future use of the optional role quotient must transport metric/order
assertions through its explicit map; it must not treat its `point` function as
a fresh increasing boundary enumeration.

## Validation

From `lean/`, with the already checked boundary-normalization olean on
`LEAN_PATH`:

```bash
LEAN_PATH=../scratch/atail-force/exact5-card13-cnf-ingress-audit \
  lake env lean -DwarningAsError=true -R .. \
  -o /tmp/exact5-card13-all-one-orbit-normalization/ExactFiveCard13AllOneOrbitNormalization.olean \
  -i /tmp/exact5-card13-all-one-orbit-normalization/ExactFiveCard13AllOneOrbitNormalization.ilean \
  ../scratch/atail-force/exact5-card13-all-one-orbit-normalization/ExactFiveCard13AllOneOrbitNormalization.lean
```

Result: pass.

The printed axiom closure of the boundary constructor, optional role
constructor, three-way CNF constructor, and fixed-`H` support projection is
exactly:

```text
[propext, Classical.choice, Quot.sound]
```

There is no `sorryAx`, `sorry`, `admit`, `native_decide`, `unsafe`, or custom
axiom in this module.

## What remains

This closes the label/orbit-normalization prerequisite only.  It does not
by itself prove the all-one source configuration contradictory.  The finite
side is now complete: the retained 7,256-assertion source projection has
kernel-checked LRAT endpoints for the left, middle, and right cells.  The next
consumer must accept the three-way packet and the semantic source ingress,
prove the corresponding packed Boolean assertions from their geometric
fields, and apply the matching verified endpoint.  Three cover-edge omission
assertions are orbit-specific; they must be discharged in their actual
left/middle/right roles rather than transported by literal identity.

Until that consumer exists, no production `sorry` is closed by this result.
