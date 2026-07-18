# Global mutual favorable-system-choice audit

Date: 2026-07-18

Status: **KERNEL-CHECKED EXACT SELECTOR OBSTRUCTION. THE LATE CRITICAL-SYSTEM
CHOICE ROUTE DOES NOT CLOSE THE EQUAL-BLOCKER ARM. THE SMALLEST LIVE PRODUCER
MUST SUPPLY A THIRD SOURCE, NOT OVERRIDE EITHER MEMBER OF THE EXISTING FIBER.**

## Question

Can the full-parent equal-blocker arm be closed by choosing a favorable
`CriticalShellSystem` late?

The proposed route was:

1. retain the large-opposite-caps parent;
2. use `CriticalSystemRebase` to change its critical-shell system;
3. use global minimal deletion and `overrideAt` to install a favorable row;
4. rebuild the exact-five assembler; and
5. feed the resulting actual row to the existing `sameCap` or `ordered`
   constructor of `CriticalFiberClosingCore`.

The audit tests this route without adding another conditional production
adapter.

## Preflight

The theorem-bank registries required by `AGENTS.md` were checked before the
Lean work:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered favorable critical
systems, `CriticalSystemRebase`, pointwise overrides, minimal-deletion cores,
and same-cap source-faithful rows.  The relevant existing interfaces are:

- `CriticalShellSystem.overrideAt`;
- `CriticalShellSystem.overrideExactSelectedClass`;
- `ATailCriticalSystemRebase.rebaseCriticalPairFrontierSystem`;
- `rebaseFrontierLargeOppositeCapsBiApexRobustResidual`;
- `ATailGlobalMinimalDeletion.exists_fresh_sharedRadiusPair_or_minimalDeletionCore`;
- `CriticalFiberClosingCore.sameCap`; and
- `CriticalFiberClosingCore.ordered`.

No banked theorem chooses a third critical source whose row contains the
fixed equal-blocker fiber pair.

## Checked results

The Lean artifact is `FavorableSystemChoice.lean`.

### 1. The old common shell can be saturated legally

For every member `z` of a chosen exact critical support, deletion of `z`
kills K4 at the same blocker:

```lean
no_deletion_survival_at_blocker_of_mem_selectedSupport
```

Therefore the complete exact class can be installed at all four of its
members using production `overrideExactSelectedClass`:

```lean
saturateCriticalSupportSystem
```

This is the strongest selector change available without first producing a
new critical shell.

### 2. Saturation is a literal center stutter

The checked theorem

```lean
saturateCriticalSupportSystem_centerAt
```

shows that every member of the old support is assigned the old blocker.
Specialized to the equal-blocker arm:

```lean
equalBlocker_saturation_stutters_on_commonSupport
```

Thus saturation creates more source names for the same center.  It does not
create the distinct second center required by `SameCapCollisionPairCore`, and
it cannot fill the distinct `A,X` boundary roles of `OrderedCrossRowCore`.

### 3. Rebase and exact-five rebuilding work, but do not add force

The theorem

```lean
equalBlocker_saturation_rebuilds_relation_but_not_secondCenter
```

uses the production rebase ladder and then invokes the exact-five assembler
at the saturated system.  The rebuilt result is again the existing
mutual-pair/all-reverse split, while every source in the old common support
still maps to the old blocker.

This exposes the quantifier issue precisely.  Rebuilding may choose a new
continuation and a new mutual pair.  There is no theorem relating those new
choices to the old equal-blocker fiber, and saturation itself makes no
progress on that fiber.

### 4. `overrideAt` cannot manufacture pair membership

The checked identity

```lean
overrideAt_selectedSupport_eq_prescribed
```

says that the installed row support is exactly the support of the supplied
`CriticalSelectedFourClass`.  Consequently:

```lean
overrideAt_pairHit_forces_equidistant
overrideAt_misses_pair_of_dist_ne
equalBlocker_lateOverride_pairHit_forces_missingEquality
```

If the installed row contains both fiber sources, its center was already
equidistant from them.  If the proposed center separates the sources, the
installed row necessarily misses at least one source.  The override API is a
selector, not a producer of the missing cross-row equality.

### 5. Nontrivial minimal-deletion cores cannot be installed pointwise

For distinct members of a `MinimalDeletionCore`, the second member's disjoint
exact four-shell survives deletion of the first:

```lean
minimalDeletionCore_survives_erase_of_other_source
minimalDeletionCore_no_pointwise_override_of_other_source
```

Therefore a core with at least two sources cannot satisfy the blocker premise
required by `overrideAt` at any one core member.  Only the singleton-core arm
can reach the pointwise override API.

The production global-minimal-deletion theorem is tied directly to this
obstruction by:

```lean
equalBlocker_globalMinimalDeletion_pairSelectorSplit
```

For deletion universe equal to the two fiber sources, it returns exactly:

1. a center already co-radial on the two sources; or
2. a singleton minimal-deletion core; or
3. a nontrivial core with an explicit surviving other shell, hence no legal
   pointwise override at the proposed center.

The first arm still lacks actual-critical-row provenance and cap/order data.

### 6. A new singleton override destroys the old fiber

The decisive source-indexed obstruction is:

```lean
equalBlocker_override_source₁_newCenter_breaks_fiber
equalBlocker_override_source₂_newCenter_breaks_fiber
```

The global pair-deletion bridge can only return a singleton source drawn from
the two old fiber sources.  If that source is overridden to a genuinely new
center, its blocker ceases to equal the other source's blocker.  Hence the old
`FrontierCommonDeletionCriticalFiber` is destroyed.

There are therefore only two possibilities for these singleton overrides:

- install the old common blocker, which stutters; or
- install a new blocker, which destroys the fiber that the terminal was meant
  to close.

Rebasing the geometric parent does not change this fact.  It transports the
parent, not the old critical-fiber witness across a modified blocker map.

## Terminal verdict

No direct `False`, `CriticalFiberClosingCore.sameCap`, or
`CriticalFiberClosingCore.ordered` was obtained.

The late-system-choice route based on deleting the two fiber sources is now
**blocked by a proved selector obstruction**, not merely unfinished:

- saturation preserves the fiber but has no distinct second center;
- a nontrivial minimal core cannot be installed;
- a singleton new-center override can be installed only at a fiber source and
  destroys the fiber; and
- rebuilding the assembler changes the output witnesses without a progress
  invariant relating them to the old fiber.

## Smallest missing theorem

The next producer must choose a genuinely third source `J`, distinct from both
fiber sources, while preserving the complete parent and current fiber.  For a
same-cap closure it must prove:

```text
J ∈ D.A
J ≠ source₁
J ≠ source₂
source₁, source₂ ∈ selectedAt J
centerAt J ≠ commonBlocker
∃ capIndex,
  commonBlocker ∈ capByIndex capIndex ∧
  centerAt J ∈ capByIndex capIndex ∧
  source₁ ∉ capByIndex capIndex ∧
  source₂ ∉ capByIndex capIndex
```

Those fields construct the existing `SameCapCollisionPairCore` immediately.
The ordered alternative remains the previously identified third-source row
plus compatible six-role cyclic order.

Crucially, neither `CriticalSystemRebase` nor global minimal deletion on the
two fiber sources can produce this third `J`.  A future route needs a global
third-source selection theorem or a direct parent contradiction; another
pointwise override of the current pair cannot close the branch.

## Validation

The predecessor scratch module and this file were freshly elaborated from
`lean/` with a temporary scratch olean path.  The final focused check exited
`0`.

Every printed declaration has axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

The Lean source contains no `sorry`, `admit`, custom `axiom`, `unsafe`, or
`native_decide`, and has no lines over 100 characters.  No production Lean,
docs, proof-blueprint state, or git state was modified.
