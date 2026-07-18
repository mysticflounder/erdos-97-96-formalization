# Full-parent mutual equal-blocker direct-`False` audit

Date: 2026-07-18

Status: **NO DIRECT `FALSE` OBTAINED. KERNEL-CHECKED STATEMENT-SHAPE
OBSTRUCTION. THE CURRENT LARGE-CAP PACKET CANNOT CONSUME `R.noM44`, AND THE
FULL NONLINEAR MEC/CAP GEOMETRY RULES OUT BOTH PHYSICAL APICES AS THE SECOND
PAIR CENTER. THE SMALLEST HONEST GLOBAL INPUT IS EITHER A GENUINELY NEW
RETRIANGULATED `IsM44` PACKET, CONSTRUCTED INSIDE THE DIRECT PROOF, OR NEW
NONLINEAR CAP INTERACTION THAT CONTRADICTS THE EQUAL-BLOCKER SHELL DIRECTLY.
NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/full-parent-mutual-equal-blocker-direct-false/`. It does
not edit production Lean, project docs, proof-blueprint state, git state,
ShellCurvature, or `surplusM44`.

## Target and exact retained context

The requested target was a direct theorem of the shape

```lean
false_of_fullParentMutualEqualBlockerShell
    (Q : FullParentMutualEqualBlockerShell M) : False
```

where

```lean
M : FullParentExactFiveMutualData L profile
```

and the indices of `L` retain the original frontier, bi-apex robustness, both
large opposite-cap bounds, `R.minimal`, `R.noM44`, the actual MEC cap packet,
and one complete critical-shell system.

The audit did not weaken this parent and did not introduce another
conditional packet or third-source existential.

## Required theorem-bank preflight

Before deriving the new statements, the lane checked the registries required
by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered a full-parent
equal-blocker contradiction, same-carrier `IsM44` production, MEC/cap-order
pair centers, and equal-blocker exact-five fibers. No banked theorem closes
this shell directly.

The closest relevant production consumers are:

- `CapSelectedRowCounting.outsidePair_unique_capCenter`, requiring two
  distinct centers in one cap and a common outside pair;
- `isM44Packet_of_capTriple_C1_surplus` and its cyclic variants, requiring a
  concrete non-obtuse circumscribed Moser triangle, its actual `CapTriple`,
  one cap of cardinality greater than four, and the other two caps of
  cardinality exactly four; and
- the existing critical-fiber closing core, which still requires a second
  actual pair center or the larger ordered cross-row packet.

None of these missing antecedents is produced by the equal-blocker shell.

## Kernel-checked results

The Lean artifact is `DirectFalseShapeObstruction.lean`.

### 1. `noM44` is inert on the current support triangle

The theorem

```lean
currentPacket_not_isM44
```

proves `not S.IsM44` directly from `L.firstOppCap_card_ge_six`. This does not
use `R.noM44`: the current physical packet is already visibly outside the
`(m,4,4)` regime.

The companion theorem

```lean
anyM44Packet_ne_currentPacket
```

proves that every hypothetical `IsM44` packet on the same carrier must differ
from `S`. Therefore an eventual use of

```lean
R.noM44 : not (exists T : SurplusCapPacket D.A, T.IsM44)
```

must construct a genuinely different support triangle/cap partition. Merely
reusing `S` or rephrasing its cap-six bounds cannot make `noM44` load-bearing.

The exact ready-made packaging endpoint is
`isM44Packet_of_capTriple_C1_surplus` (or its `C2`/`C3` variants). The missing
mathematics lies before that theorem: build the new MEC support triangle and
prove its `> 4, = 4, = 4` cap counts from the equal-blocker geometry.

### 2. The physical second apex is not a pair center

The exact-five profile says that the continuation's unused source is outside
the selected physical-second-apex radius class, whereas the mutual partner is
a `PhysicalVertex` and is inside that class. The checked theorem

```lean
equalBlocker_physicalSecondApex_dist_ne
```

therefore proves that those two points have unequal distances from
`S.oppApex2`. Its fiber-indexed form is

```lean
equalBlocker_fiber_physicalSecondApex_dist_ne.
```

This consumes the complete exact-five radius filter; it is not a finite-row
or incidence-only deduction.

### 3. The physical first apex is not a pair center

The predecessor full-geometry theorem

```lean
equalBlocker_firstApex_dist_ne
```

uses the actual ordered MEC cap and one-sided distance injectivity to prove
unequal first-apex distances for the same pair.

### 4. The actual common blocker is a pair center

The checked theorem

```lean
equalBlocker_commonBlocker_dist_eq
```

derives equidistance from the source-faithful exact critical support. The
combined theorem

```lean
equalBlocker_namedPairCenter_ledger
```

records the exact three-center ledger:

```text
common critical blocker: equal distances
physical first apex:     unequal distances
physical second apex:    unequal distances
```

Thus neither physical apex supplies the second center required by the
existing two-center terminal. A direct proof must obtain genuinely new global
force; the physical-apex shortcut has the wrong polarity at both ends.

## Why this does not prove `False`

The three-center ledger is geometrically consistent: one point may lie on the
perpendicular bisector of a pair while two other points do not. Likewise,
`not S.IsM44` is consistent with the cap-six bounds and simply repeats what
those bounds already imply.

Consequently the retained fields currently expose no contradiction without
one of the following genuinely global constructions:

1. **Retriangulation route.** Construct a different non-obtuse circumscribed
   Moser triangle on `D.A`, its source-faithful cap partition, and exact
   `> 4, = 4, = 4` cap counts. The existing packaging theorem then yields an
   `IsM44` packet and `R.noM44` closes the branch internally.
2. **Direct nonlinear cap route.** Prove from the full equal-blocker shell,
   actual cap order, full radius filters, and MEC placement that the shell is
   impossible. Such a theorem must add more than selected-row/support
   locking; the exact finite boundary already permits that projection.

The first route identifies the smallest concrete missing global payload
because every post-construction step already exists in production. It should
remain internal to the direct-`False` proof rather than becoming another open
conditional producer interface.

## Validation

The two scratch dependencies were freshly elaborated to isolated temporary
oleans, after which the owned file was checked with:

```bash
cd lean
env LEAN_PATH=/tmp/p97-full-parent-equal-blocker-direct-oleans \
  lake env lean -R .. -M 16384 \
  ../scratch/atail-force/full-parent-mutual-equal-blocker-direct-false/DirectFalseShapeObstruction.lean
```

The focused check exited `0`. Every printed declaration has axiom closure
exactly:

```text
propext
Classical.choice
Quot.sound
```

The Lean source contains no `sorry`, `admit`, custom `axiom`, `unsafe`, or
`native_decide`.

## Epistemic status

- **PROVED / KERNEL-CHECKED:** the current packet is not `IsM44`; every
  hypothetical `IsM44` packet differs from it; the physical second apex has
  unequal distances to the fiber pair; the common blocker has equal
  distances; the combined named-center ledger.
- **PROVED IN THE PREDECESSOR FULL-GEOMETRY LANE:** unequal first-apex
  distances from actual MEC cap-order injectivity.
- **EXACT WITHIN THE EARLIER FINITE ABSTRACTION:** selected-row, blocker-map,
  mutual-omission, and rank constraints alone permit the shell.
- **OPEN:** the genuinely new retriangulation or a direct nonlinear cap
  contradiction.
- **TERMINAL CLOSURE:** none.
- **PRODUCTION `sorry` CLOSED:** none.
