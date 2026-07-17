# Robust collision / second-shell audit

Date: 2026-07-17

Status: **KERNEL-CHECKED COMMON-DELETION PRODUCER; KERNEL-CHECKED FINITE
REGRESSION; NONTERMINAL; NO PRODUCTION `sorry` CLOSED.**

## Question and bank preflight

Starting from the first-apex robust blocker-fiber collision, test whether
global K4, minimality, and the retained `CriticalShellSystem` force a second
shell, a repeated pair at another center, a prescribed common deletion, or
`False`.

Before deriving a new consequence, this lane checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered equal blocker fibers,
exact critical supports, blocker-center deletion, second shells, repeated
pairs, and `CommonDeletionTwoCenterPacket`. No banked theorem supplied the
missing second center or a direct contradiction. The reusable inputs are the
current production facts `FullyDeletionRobustAt.centerAt_ne`,
`selectedFourClass_survives_erase_of_not_mem`,
`CriticalShellSystem.selectedFourClass_support_eq_shell`, and
`nonempty_commonDeletionTwoCenterPacket`.

## Checked positive result

`RobustCollisionSecondShell.lean` proves the sharper theorem

```lean
nonempty_commonDeletionTwoCenterPacket_at_actualBlocker_of_robust
```

The equal-blocker collision is stronger than necessary. Given

```lean
R : FullyDeletionRobustAt D robustCenter
H : CriticalShellSystem D.A
source : CriticalShellSystem.CarrierVertex D.A
```

and `robustCenter ∈ D.A`, put

```text
c := H.centerAt source.1 source.2.
```

Then deleting `c` preserves K4 at both distinct centers `c` and
`robustCenter`:

- the exact critical shell at `c` has positive radius, so it omits `c` and
  survives erasing `c`;
- full robustness supplies survival at `robustCenter`; and
- robustness excludes `robustCenter` from the blocker-map image, so
  `c != robustCenter`.

Hence there is a checked packet

```lean
CommonDeletionTwoCenterPacket D H c c robustCenter.
```

The strengthened theorem

```lean
exists_commonDeletionTwoCenterPacket_at_actualBlocker_aligned
```

chooses the packet so its first q-deleted row is exactly the source's ambient
critical support. Applied to either member of the collision fiber, this keeps
the original collision pair visible in the row centered at `c`.

This is a genuine producer, but it is not a contradiction. It returns the
robust branch to the already-known common-deletion surface with the blocker
center itself as the deleted point.

## Exact second-shell boundary

The same file checks

```lean
selectedFourClass_support_eq_actualCriticalSupport.
```

Every selected four-class at `c` is locked to the source's exact critical
support. Therefore there is no genuinely different selected four-point shell
at the same blocker center. A useful second-shell continuation must move to a
different center.

The current fields do **not** force such a center. In particular, they do not
force a second center whose selected row contains both collision sources, so
they do not force a repeated outside pair.

## Finite regression gate

`RobustCollisionFiniteBoundary.lean` gives a kernel-checked `Fin 12` model of
the represented finite surface. It simultaneously retains:

- a total fixed-point-free source-to-blocker map;
- a blocker-map image omission at a card-five deletion-robust center;
- two distinct sources in one exact card-four common-blocker support;
- source membership, deletion criticality, and same-blocker support locking;
- a selected four-row at every center;
- the full selected-row closure consequence of minimality; and
- the checked blocker-center common deletion above.

Yet it proves

```lean
no_second_center_through_collision_pair_checked
```

so no other represented center contains both collision sources. This is an
exact regression inside the displayed finite abstraction, not a Euclidean
counterexample and not a model of the full Lean parent. It rules out deriving
the missing second center from blocker-map incidence, exact-row locking,
card-five robustness, and selected-row minimality closure alone.

The stronger missing input must therefore be geometric or source-localizing:
for example, a cap/MEC/order theorem placing the anonymous collision pair on
a second known radius, or a theorem forcing another explicitly located center
through that pair. More blocker-map iteration or another selected row at the
same common blocker cannot provide it.

## Validation

Both owned Lean files compile without `sorry`, `admit`, custom axioms,
`native_decide`, or unsafe code. The theorem closures printed by Lean use only

```text
propext, Classical.choice, Quot.sound
```

as applicable. The finite closure theorem required Lean's larger thread stack:

```text
lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/robust-collision-second-shell/RobustCollisionFiniteBoundary.lean
```

No production file, closure document, proof-blueprint state, protected
unique-row file, `surplusM44`, or shell-curvature refactor was modified.
