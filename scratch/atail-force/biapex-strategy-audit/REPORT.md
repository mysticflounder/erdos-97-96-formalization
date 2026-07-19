# Bi-apex robust strategy audit

Date: 2026-07-17

Status: **KERNEL-CHECKED TWO-OMISSION MULTIPLICITY AND BRANCHWISE ROW
REDUCTIONS; NO EXISTING BANK CONSUMER FIRES ON THE LIVE SURFACE WITHOUT A
NEW GEOMETRIC CROSS-ROW PRODUCER.  THE OLD FIN-12 REGRESSION DOES NOT BLOCK
GENERIC ORDINAL CLOSURE.**

## Question and bank preflight

The audited live endpoint is

```lean
FrontierBiApexRobustResidual parent
```

from production `ATail/PhysicalSecondApexCommonDeletion.lean`.  It retains
the complete `FrontierCommonDeletionParentResidual`, hence the concrete
`CriticalShellSystem`, frontier pair, common-deletion packet, minimality,
cap/MEC data and no-`IsM44` assumption.  Its one new field makes the physical
second apex fully deletion-robust; the parent already proves the same fact at
the first apex.

Before deriving a finite-map consequence, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed-corpus searches covered two omitted blocker values, robust
centers, repeated blocker fibers, two-fiber collision rows, shared outside
pairs and ordinal/Kalmanson cycles.  They recovered the current blocker-map,
cap-center uniqueness, center-rigidity and ordinal-cycle consumers, but no
theorem consuming two robust apex omissions directly.

## New exact consequence of the live endpoint

Each robust apex is absent from the image of the retained blocker endomap by
`FullyDeletionRobustAt.blockerVertex_ne`.  The two omitted values are
distinct.  After choosing the collision forced by omission of the first
apex, a second omission rules out the almost-surjective endpoint in
`second-collision-source-audit`.

`BiApexBlockerMultiplicity.lean` kernel-checks the exact result:

```lean
FrontierBiApexRobustResidual.exists_two_fibers_or_larger_fiber
```

It returns distinct sources `source1, source2` with one common actual blocker
and then exactly the useful positive disjunction:

1. another pair of distinct sources has a common blocker value different
   from the first blocker; or
2. a third source, distinct from `source1, source2`, has the first blocker.

Thus the live endpoint always has either two distinct nontrivial blocker
fibers or one blocker fiber with at least three sources.  The proof is the
sharp finite repair argument: if the displayed double fiber were the only
collision, redirect one source to the first omitted apex.  The repaired
finite endomap is injective and therefore surjective, forcing it to hit the
second omitted apex, contrary to its omission.

This strictly improves the old one-apex collision boundary.  In particular,
the `physical second apex lies in the blocker image` arm of
`collision_or_largerFiber_or_secondApexImage` is impossible here.

## Branchwise row audit

`BiApexBranchwiseTargets.lean` kernel-checks the exact row content of both
multiplicity branches.

### Two-fiber branch

The branch supplies four pairwise cross-distinct sources after orienting the
two fibers:

```text
A-row: C,K
X-row: J,E
A != X.
```

Here `A` and `X` are actual values of `H.blockerVertex`.  The two membership
pairs are not abstract equalities: equal blocker values identify the exact
critical shells, so both named sources lie in the displayed actual rows.

What is *not* supplied is any placement of `A,X,J,C,K` in the cap partition
or any useful cyclic order among them.  Neither fiber is forced onto the
retained first-apex radius.  In particular, the full parent does not yet give
an ambient first-apex row through `J,C`.

### Triple-fiber branch

The branch supplies three distinct sources on one exact four-shell:

```text
A-row: C,K,E.
```

The third same-fiber source cannot play the `J` role of the ordered terminal:
its actual blocker is again `A`, so the supposed second center `X` would
collapse to `A`.

The live carrier has more than nine points while the `A`-shell has exactly
four.  The checked theorem

```text
exists_source_outside_shell_with_distinct_blocker
```

therefore chooses an external source `J` outside that shell.  Its blocker
`X` is automatically different from `A`: if `X = A`, deletion criticality
would force `J` back into the exact `A`-shell.  Thus the triple branch also
reaches

```text
A-row: C,K,E
X-row: J,...
A != X,
```

with the own-row membership of `J` automatic.

### Common normal form

In fact the extra second/triple-fiber multiplicity is not needed to obtain
the smallest consumer-facing seed.  From the first collision row alone and
the carrier-cardinality bound, the checked theorem

```text
FrontierBiApexRobustResidual.nonempty_distinctBlockerRowSeed
```

produces `A-row: C,K` and an external source `J` with actual blocker `X != A`.
The second omission contributes additional same-row partners, but it does not
produce the missing cross incidence.  This is important for strategy: the
two multiplicity branches unify before the geometric bottleneck rather than
requiring separate consumers.

The full retained parent does supply a global CCW boundary indexing and an
exhaustive classification of each carrier point as a Moser vertex or a strict
cap-interior point.  It does **not** choose favorable cap placements for the
newly selected `A,X,J,C,K`.  The existing cap projection can choose a cap
containing a blocker and two anonymous outside points of its row, but cannot
identify those points with the collision sources.

## Existing consumer match

No current bank consumer accepts only the resulting multiplicity packet.

### Ordinal/Kalmanson terminal

The closest and shortest terminal is the kernel-checked

```text
false_of_ordered_robust_twoFiberKalmansonCore
```

from `robust-two-fiber-kalmanson-consumer`.  Up to cyclic relabeling it needs

```text
boundary order: O < A < X < J < C < K
O-row: J,C
A-row: C,K
X-row: J,K.
```

The common row seed automatically supplies `A-row: C,K`, the actual center
`X = H.centerAt J`, and the own-row membership `J in X-row`.  Once a favorable
cyclic placement and an ambient first-apex equality `OJ = OC` have been
produced, the **single smallest missing actual critical-row membership** is

```text
K in (H.selectedAt J).support.
```

The symmetric orientation may instead ask for `C` in that row.  This statement
is the same in the two-fiber and triple-fiber arms; in the triple arm one may
choose the target from `C,K,E` adaptively.

There are nevertheless two independent geometric gaps before that membership
closes the live endpoint:

1. an ambient first-apex row through `J,C`, or the weaker metric equality
   `OJ = OC`; and
2. a cyclic order compatible with the ordered Kalmanson terminal (up to
   rotation/reflection).

Neither is present on the raw multiplicity surface.  Therefore the honest
next theorem is a geometric packet producing these facts together with the
one cross membership, not merely the isolated membership.

The generic production consumer

```text
ATailOrdinalKalmansonCycle.false_of_transGen_cycle
```

requires additional care.  Its two constructors encode one-row ordinal
comparisons.  The specialized six-role consumer derives its reverse inequality
from a full linear Kalmanson inequality plus the `A`-row equality, so it is not
automatically an instance of the current `TransGen` relation.  A direct cycle
certificate is valid when the selected rows create one-row comparisons whose
distance terms close after equality normalization; otherwise the checked
specialized terminal remains the correct interface.

### Other nearby terminals

- `outsidePair_unique_capCenter` still needs two distinct centers in one
  indexed cap bisecting the same outside pair.  Two blocker fibers give two
  rows, not a common pair across those rows.
- `eq_of_equidistant_three_noncollinear` still needs a third point common to
  two distinct-center rows.  Fiber multiplicity gives three points on one
  row only.
- `u1TwoLargeCapObstruction` and the U5 source-unit families still need their
  complete named cross-incidence packets.  The multiplicity disjunction does
  not identify those roles.
- The robust minimal-deletion trichotomy remains valid but is a longer route:
  its collision, multicore and installed-singleton arms each still need a
  consumer.  The bi-apex multiplicity theorem is unconditional and should be
  used before opening that three-way fallback.

## Smallest immediate consumer-facing theorem

The next load-bearing theorem should not be another endomap or fiber-count
lemma.  The finite layer is now exhausted sharply.  The smallest honest
consumer-facing statement is:

```text
FrontierBiApexRobustResidual parent
  -> either an actual ordinal cycle after equality normalization,
     or the ordered three-row Kalmanson core already consumed by
     CriticalFiberClosingCore.OrderedCrossRowCore.false.
```

Formally, its output should be exactly a nonempty
`Relation.TransGen (SelectedRowOrdinalComparison boundary value) start start`
for a global CCW boundary enumeration when the one-row comparison language is
sufficient, or a small disjunction of specialized six-role packets consumed
immediately by the checked linear Kalmanson terminal.  Do not insert another
unconsumed producer structure between this theorem and `False`.

The proof must visibly use the cap/MEC/cyclic placement retained in `parent`
to turn the guaranteed multi-fiber-or-triple-fiber normal form into a
cross-row equality.  Totality of the blocker map, support locking, and
minimality connectivity alone cannot do that.

## Fin-12 regression correction

`BiApexFiniteBoundary.lean` is a kernel-checked `Fin 12` row/blocker model.
It is not a Euclidean counterexample.  It simultaneously retains:

- two distinct blocker-image omissions, representing both robust apices;
- two deletion-robust five-point classes;
- the parent first- and second-apex double-deletion classes;
- a total fixed-point-free blocker map with exactly two double fibers;
- exact four-point support locking for every blocker source;
- one selected four-row at every represented carrier center;
- the first collision row and even the missing robust-row prefix
  `O-row: C,J`; and
- the full finite consequence that every nonempty row-closed subset is the
  whole carrier.

The earlier narrow check

```lean
no_ordered_crossRow_completion_checked
```

proves that no other represented row contains the particular pair `J,K` used
by the specialized six-role terminal.  That narrow negative remains correct.

It does **not** block a generic ordinal-cycle theorem.  The pinned exact
checker `analyze_full_ordinal.py` first reproduces the raw endpoint-pair graph:

```text
57 used distance terms
53 directed SelectedRowOrdinalComparison edges
no raw directed cycle.
```

That raw check is insufficient because the comparison type permits one named
term to represent different endpoint pairs once selected-row equalities prove
their distances equal.  After quotienting by all represented row equalities,
the model has an immediate strict loop.  The smallest witness is already

```text
boundary order: 0 < 1 < 2 < 3
row 0 contains 2,3  ->  d(1,2) < d(1,3)
row 1 contains 2,3  ->  d(1,2) = d(1,3).
```

`full_ordinal_strict_loop_incidence_checked` verifies those four incidences by
kernel reduction, and `false_of_nested_rows_full_ordinal_loop` constructs the
corresponding one-edge `SelectedRowOrdinalComparison` cycle and feeds it to
production `false_of_transGen_cycle`.

Therefore this particular `Fin 12` model is a regression only against
geometry-free derivations of the *named specialized cross row*.  It must not
be cited against a full cap/order/ordinal producer: its complete represented
row system is already incompatible with convex realization.

## Strategy verdict

The bi-apex endpoint is better than the previously audited one-apex robust
surface: it guarantees multi-fiber structure and removes the
almost-surjective critical-map branch.  It does **not** yet match a banked
contradiction.  The shortest source-valid route is now:

```text
FrontierBiApexRobustResidual
  -> two-fiber-or-larger-fiber critical-map normal form       [proved]
  -> collision row + distinct-blocker continuation source     [proved here]
  -> cap/order + ambient-row + one cross-hit terminal packet  [one missing theorem]
  -> False                                                    [already production]
```

Broad all-center row mining, another marginal radius classification, and
another deletion-core decomposition are not the next step.  The missing
theorem is one geometric cross-row cycle producer on the full retained parent
surface.  The corrected finite audit means generic ordinal closure remains a
live route; it was not refuted by the old `Fin 12` model.

## Validation

The production dependency was rebuilt successfully with:

```text
lake-build Erdos9796Proof.P97.ATail.PhysicalSecondApexCommonDeletion
lake-build Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
```

The focused scratch checks were:

```text
cd lean
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-biapex-blocker-multiplicity.olean \
  ../scratch/atail-force/biapex-strategy-audit/BiApexBlockerMultiplicity.lean
lake env lean -R .. -M 16384 -s 65536 \
  -o /private/tmp/p97-biapex-finite-boundary.olean \
  ../scratch/atail-force/biapex-strategy-audit/BiApexFiniteBoundary.lean
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-biapex-branchwise-targets.olean \
  ../scratch/atail-force/biapex-strategy-audit/BiApexBranchwiseTargets.lean
UV_CACHE_DIR=.uv-cache uv run \
  scratch/atail-force/biapex-strategy-audit/analyze_full_ordinal.py
```

The three scratch Lean files compile without `sorry`, `admit`, a declared
axiom, `native_decide`, or unsafe code.  The printed axiom closure of every
new theorem is limited to the standard core axioms as applicable:

```text
propext
Classical.choice
Quot.sound
```

No production file, shared plan document, protected FA-UNIQ artifact,
`surplusM44`, or shell-curvature file was edited.
