# Collision equality-arm audit

## Verdict

None of the four equality alternatives in
`Problem97.ATailFrontierLiveClosure.
exists_three_hit_or_collision_crossHit_of_two_sourceExactCollisionRows`
can yield its corresponding requested cross-row membership from the stated
local data.  Lean checks the exact opposite in all four cases.

For a critical shell selected at `x`, its center
`H.centerAt x hx` is not in its support
(`CriticalFourShell.center_not_mem_support`).  Each equality arm identifies
the proposed cross-hit point with exactly that excluded center:

| Equality arm | Requested conclusion | Checked consequence |
|---|---|---|
| `center(P.source₁) = Pρ.source₁` | `Pρ.source₁ ∈ shell(P.source₁)` | `Pρ.source₁ ∉ shell(P.source₁)` |
| `center(P.source₁) = Pρ.source₂` | `Pρ.source₂ ∈ shell(P.source₁)` | `Pρ.source₂ ∉ shell(P.source₁)` |
| `center(Pρ.source₁) = P.source₁` | `P.source₁ ∈ shell(Pρ.source₁)` | `P.source₁ ∉ shell(Pρ.source₁)` |
| `center(Pρ.source₁) = P.source₂` | `P.source₂ ∈ shell(Pρ.source₁)` | `P.source₂ ∉ shell(Pρ.source₁)` |

These are the four theorems named `*_eq_source*_implies_not_mem` in
`CollisionEqualityArms.lean`.

## Localized packet and cycle data

The nearby q-deleted support adapter does not reverse this obstruction.
After reproducing the private adapter in scratch,
`commonDeletionRows_imply_source₁_cross_omissions` checks that the
blocker-centered `row₂` supports are the canonical selected shells and that
their deleted fresh sources are omitted:

```text
Pρ.source₁ ∉ shell(P.source₁)
P.source₁  ∉ shell(Pρ.source₁).
```

Likewise,
`mutualOmissionCycles_record_cross_omissions` directly packages the four
negative membership fields stored in `MPρ` and `MP`.  Thus
`LocalizedCollisionCommonDeletion` and
`LocalizedCollisionMutualOmissionCycle` supply further omissions, not any
positive cross-row membership.

## Exact missing fact

To prove a requested membership in an equality arm, one must first derive
`False` from that equality plus the remaining global hypotheses and then use
ex falso.  The exact missing fact is therefore an equality-arm contradiction
producer (presumably using the global tri-apex residual `T` or additional
geometry).  No field of `LPρ`, `MPρ`, `LP`, or `MP`, and no blocker-centered
q-deleted support identification, provides such a contradiction.

Equivalently, the equality alternatives cannot be treated as positive
cross-incidences: syntactically they point to the centers of the requested
shells, and those centers are definitionally excluded from support.

## Validation

From the Lake root `lean/`:

```bash
lake env lean ../scratch/collision-equality-arms/CollisionEqualityArms.lean
```

The command exits `0`.  All six scratch theorems have only the standard
axioms `propext`, `Classical.choice`, and `Quot.sound`; the file contains no
`sorry`.  No production file was edited.
