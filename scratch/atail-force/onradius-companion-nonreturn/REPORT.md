# On-radius companion nonreturn audit

Date: 2026-07-17

Status: **KERNEL-CHECKED PARENT-WIDE FIRST-APEX ROBUSTNESS AND EXACT
SOURCE SPLIT. NEITHER ON-RADIUS CONSTRUCTOR IS TERMINAL. THE THREE-SOURCE
ARM PROVABLY DOES NOT PUT THE FRONTIER COMPANION IN THE STORED PHYSICAL-
SECOND-APEX ROW.**

Scope: the conjunction of
`FrontierRefinedEscapeOutcome.onRadiusSurplusPairedCommonDeletion` and
`FrontierCommonDeletionConsumerNormalForm.normal.directed =
companionCommonDeletion`. This lane edits only
`scratch/atail-force/onradius-companion-nonreturn/`.

## Required theorem-bank preflight

Before deriving a new local incidence or metric packet, this audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- indexed `nthdegree docs search --lean` queries for paired common
  deletions, two-center deletions, shared-radius pairs, cap-center
  uniqueness, and fully deletion-robust apices.

No banked theorem consumes the exact three-origin packet produced here.
The closest checked consumers are:

- `U2NonSurplusSqueeze.oppCap2_escape_gen`, which needs two *off-surplus*
  points sharing both opposite-apex radii;
- `outsidePair_unique_capCenter`, which needs two cap centers and one pair
  outside that cap;
- `frontierDeletionSurvival_or_actualBlocker_eq_knownCenter`, which needs
  the directed cross-membership arm rather than the companion-deletion arm;
  and
- `u1TwoLargeCapObstruction`, which needs its complete seven-equality
  five-point metric packet.

The common-deletion and successor banks do not supply the missing geometric
antecedent. Projecting to another anonymous `CommonDeletionTwoCenterPacket`
would only re-enter the already audited generic recurrence.

## Stronger parent-wide result

`FirstApexRobustness.lean` proves:

```lean
parentResidual_firstApex_fullyDeletionRobust
    (R : FrontierCommonDeletionParentResidual F) :
    FullyDeletionRobustAt D S.oppApex1
```

This does not require the on-radius escape or the directed outcome. It uses
exactly:

1. `R.frontierRadius_class_card_ge_four`;
2. `R.common.firstApexDouble`, the K4 witness after deleting both frontier
   sources;
3. membership of `F.pair.q` and `F.pair.w` in the frontier radius class; and
4. their distinctness.

The proof is exhaustive.

- If the frontier radius class has at least five points, that class survives
  every single deletion.
- Otherwise the retained lower bound makes it exact-card-four. The stored
  double-deletion witness cannot use the frontier radius, since deleting the
  two distinct frontier members would leave only two points. Its different
  radius supplies a second ambient K4 class. For any deletion, either the
  frontier class or the different-radius class is untouched.

The proof does **not** use `R.minimal`, `R.noM44`,
`R.carrier_card_gt_nine`, either selected row in `R.common.packet`, the
on-radius surplus escape, or the directed blocker outcome.

The immediate critical-map consequence is also checked:

```lean
parentResidual_actualBlocker_ne_firstApex
    (R : FrontierCommonDeletionParentResidual F)
    (source : ℝ²) (hsource : source ∈ D.A) :
    H.centerAt source hsource ≠ S.oppApex1
```

Thus the first apex is outside the image of the entire retained critical
map.

## Tightened `ThirdCenterCommonPair` output

On the directed cross-membership arm, the existing total-map classifier
previously returned four alternatives:

```text
q deletion survives at the source blocker
or w deletion survives at the source blocker
or source blocker = first apex
or source blocker = q's actual blocker.
```

The checked theorem

```lean
frontierDeletionSurvival_or_actualBlocker_eq_frontierBlocker
```

uses first-apex robustness to remove the third alternative. Its exact output
is:

```text
q deletion survives at the source blocker
or w deletion survives at the source blocker
or source blocker = q's actual blocker.
```

This is a real residual-arm reduction. It is not by itself a contradiction,
and it applies to the cross-membership sibling rather than to the assigned
companion-deletion constructor.

## Exact assigned-branch packet

`nonempty_onRadiusDirectedCompanionSourceSplit` retains the full parent,
frontier, critical map, normal-form equality, directed-constructor equality,
paired surplus/marginal deletion, and frontier-companion deletion. The
constructed `OnRadiusDirectedCompanionPacket` records:

- full deletion robustness at `S.oppApex1`;
- the surplus escape, marginal hit, and frontier companion as common-
  deletion origins for the same centers
  `S.oppApex1` and `H.centerAt F.pair.q`;
- all three sources outside `q`'s exact actual critical shell;
- the frontier deleted source, companion, marginal hit, and surplus escape
  on the same first-apex radius where applicable; and
- the physical-second-apex equality between the surplus escape and marginal
  hit from the stored row `R.common.packet.B₂`.

Only one source coincidence remains:

```text
hit.point = F.pair.w
or
hit.point ≠ F.pair.w.
```

In the second arm, the escape, hit, and companion are three pairwise distinct
common-deletion sources. The other pairwise inequalities follow from the
surplus/off-surplus origins and the existing frontier/source fields.

## Why neither constructor closes

### `hit.point = F.pair.w`

The surplus escape and frontier companion share both opposite-apex radii:
the first equality is the on-radius arm and the second is their common
membership in `B₂`. But the escape lies **in** the surplus cap while the
companion lies outside it. Therefore
`U2NonSurplusSqueeze.oppCap2_escape_gen` does not apply; its contradiction
requires both points outside the surplus cap. This is the allowed mixed-side
reflection configuration, not K-A-PAIR.

### `hit.point ≠ F.pair.w`

The marginal hit and frontier companion are distinct off-surplus points and
share the first-apex radius. However the checked theorem

```lean
companion_not_mem_secondRow_of_hit_ne_companion
```

proves

```text
F.pair.w ∉ R.common.packet.B₂.
```

Reason: `B₂` meets the off-surplus first-apex marginal in at most one point,
and the marginal hit already occupies that intersection. Consequently the
retained physical-second-apex row cannot supply the missing equality between
the hit and companion. A K-A-style consumer would need a new, independently
derived second-apex equality or another direct geometric contradiction.

The directed companion-deletion packet only says that deleting
`F.pair.w` preserves K4 at the first apex and at `q`'s actual blocker. It
does not put `F.pair.w` on the physical-second-apex row and does not imply a
physical-second-apex distance equality.

## Smallest production promotion

The smallest load-bearing production promotion is only:

```lean
parentResidual_firstApex_fullyDeletionRobust
```

It belongs next to `FrontierCommonDeletionParentResidual` or in a direct
successor module. `parentResidual_actualBlocker_ne_firstApex` is then a
one-line corollary of the existing
`FullyDeletionRobustAt.centerAt_ne`. The tightened ThirdCenter theorem is a
useful second promotion only if the cross-membership sibling remains in the
active normal form.

Do **not** promote `OnRadiusDirectedCompanionPacket` as a new production
obligation unless its immediate consumer is introduced at the same time.
It is an exact audit boundary, but neither constructor is currently terminal.

The next honest mathematical target on this assigned arm is one of:

1. a source-derived physical-second-apex equality for the two off-surplus
   sources that does not come from `B₂`;
2. a direct consumer of the mixed-side two-apex reflection pair in the
   coincidence arm, visibly using the third common-deletion source or full
   critical map; or
3. a consumer of the parent-wide robust first apex after a source-faithful
   non-surplus packet reorientation.

## Validation

Focused check from `lean/`:

```bash
lake env lean -M 16384 \
  ../scratch/atail-force/onradius-companion-nonreturn/\
FirstApexRobustness.lean
```

Result: pass. There is no `sorry`, `admit`, declared `axiom`,
`native_decide`, or `unsafe` declaration in the owned directory.

Every printed theorem depends on exactly:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`.
