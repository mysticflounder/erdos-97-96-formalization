# First-apex robust global-consumer audit

Date: 2026-07-17

Status: **KERNEL-CHECKED GLOBAL BLOCKER-FIBER COLLISION. NONTERMINAL. NO
PRODUCTION `sorry` IS CLOSED.**

## Question

Assume the concurrently developed source-faithful theorem

```lean
FrontierCommonDeletionParentResidual F
  -> FullyDeletionRobustAt D S.oppApex1
```

What is the strongest unconditional consequence of combining this robustness
with the retained global `CriticalShellSystem`? In particular, does it already
produce a cap/order, Kalmanson, outside-pair, or shell-curvature contradiction?

## Required theorem-bank preflight

Before deriving the finite blocker-map consequence, this lane checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the sibling
  `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also ran indexed Lean searches for omitted blocker-map image points,
equal-blocker fibers, common exact shells, cap-order outside pairs, and
Kalmanson consumers.

The useful current inputs are already local:

- `FullyDeletionRobustAt.centerAt_ne`;
- `CriticalShellSystem.blockerVertex` and `blockerVertex_ne`;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `CriticalShellSystem.no_qfree_at`; and
- finite endomap injectivity/surjectivity equivalence.

The closest banked terminals still require named metric equalities or several
row incidences. In particular, `u1TwoLargeCapObstruction` requires seven
specific equalities and the U1 source-unit consumers require their full named
slot packets. An anonymous equal-blocker fiber does not produce those fields.

## Exact proved reduction

`FirstApexRobustGlobalConsumer.lean` proves the following chain.

### 1. Robustness excludes the apex from the blocker image

For every carrier source `z`,

```lean
H.centerAt z hz != S.oppApex1.
```

Equivalently, the carrier subtype vertex represented by `S.oppApex1` is not in
the image of

```lean
H.blockerVertex : CarrierVertex D.A -> CarrierVertex D.A.
```

This is not a new criticality hypothesis. It is the direct contrapositive of
the critical-shell fact `H.no_qfree_at`: if a source mapped to the robust apex,
deleting that source would both preserve and destroy K4 at the same center.

### 2. A finite self-map missing one carrier value is noninjective

The blocker map is an endomap of a finite type. If it were injective it would
be surjective, contradicting omission of the first apex. Hence there exist two
distinct carrier sources `source1` and `source2` such that

```lean
H.blockerVertex source1 = H.blockerVertex source2.
```

This collision is stronger than the generic `exists_blocker_cycle`: it is
forced specifically by first-apex robustness and witnesses the failure of
blocker-map injectivity. The generic cycle theorem alone does not imply a
collision, since a fixed-point-free permutation may consist entirely of
cycles.

### 3. Equal-blocker rigidity gives one common exact critical shell

The theorem

```lean
nonempty_firstApexRobustGlobalBlockerNormalForm
```

packages the collision with all consequences available from the retained
critical system:

- the two source points are distinct;
- their common blocker is a carrier point different from the first apex and
  from both sources;
- their chosen rows have the same center;
- their chosen rows have the same positive radius;
- their chosen rows have the same exact support of cardinality four;
- both distinct sources lie in that common support; and
- deleting either source destroys every K4 witness at the common blocker.

Thus the honest global endpoint is a **two-source critical blocker fiber in one
exact four-point radius shell**. This is real proof progress relative to the
coarse robust projection, but it is not `False`.

## Exact terminal-match audit

### `outsidePair_unique_capCenter`: no direct match

That theorem needs:

1. two distinct points outside one ordered cap;
2. two distinct centers inside that cap; and
3. both centers equidistant from the outside pair.

The collision normal form supplies one center equidistant from its two source
points. It supplies neither a cap placement for those sources nor a second
same-cap center equidistant from them. In particular, it does **not** say the
two collision sources lie on the retained first-apex radius. Therefore the
first apex cannot be inserted as the second center.

This differs from the original frontier pair `F.pair.q,w`: those points are
known to be co-radial at `S.oppApex1`, which is why a row containing that
specific pair localizes its blocker outside the surplus cap. The pigeonhole
collision is anonymous and need not be the frontier pair.

### Kalmanson strict-cycle consumers: no direct match

`false_of_selected_rows_in_five_ccw_order` needs three selected rows, five
explicitly ordered boundary roles, and six named support incidences. The
global normal form supplies one exact row and two named members.

Likewise, `ATailOrdinalKalmansonCycle.false_of_transGen_cycle` consumes a cycle
of **strict-distance comparisons**. A cycle of the blocker endomap is a cycle
of source-to-center assignments, not a cycle of ordinal comparisons. No
current theorem turns a blocker edge into a Kalmanson comparison without
additional boundary roles and a second shell equality.

Consequently, iterating `H.blockerVertex` is not a substitute for producing
the missing ordered metric packet.

### Shell curvature: local premise only, not a terminal

The common exact support does give one center with four equidistant boundary
targets. After a valid cyclic-order lift, this is the local equal-radius input
shape of `two_sided_quarter_turn_separation_of_equal_radius`.

It still does not close the branch:

- the current parent surface does not construct the required compatible
  finite `CounterclockwiseAngleChart` window from this anonymous shell;
- the collision normal form does not place the four support points into the
  named endpoint/middle roles used by a downstream packing argument; and
- the shell-curvature result is an inequality producer, not a contradiction.

The current closure documents already mark the chart/consumer continuation as
blocked. Even after that interface is repaired, one anonymous four-shell is
available from global K4 at every center, so the new critical-fiber provenance
must be used by the final consumer; discarding it would erase the only new
information.

### Curvature and cap-counting terminals: no current match

Cap one-hit and cap-interior radius bounds can limit how many members of the
common shell lie in a cap containing its center. They do not supply a second
center, a repeated outside pair, or a contradiction for a single exact
four-shell. The previously proved blocker-fiber upper bound `<= 4` is also
compatible with the newly forced fiber of size at least two.

## Strongest honest next theorem

The next consumer must use the **critical provenance of both colliding
sources**, not merely the existence of their common selected shell. A minimal
useful strengthening is one of:

1. localize the collision sources to the retained frontier radius, making the
   first apex the second equidistant center and enabling the ordered-cap
   outside-pair theorem;
2. localize the common blocker and both sources into explicit cap/boundary
   roles and produce a second selected row that completes a Kalmanson strict
   cycle; or
3. prove a source-indexed shell-curvature packing theorem in which deletion
   criticality at **both** sources supplies the missing second shell or
   complementary curvature budget.

Without one of these extra geometric couplings, the exact normal form is
compatible with a finite blocker graph consisting of an indegree-zero robust
apex, a nontrivial fiber elsewhere, and ordinary cycles. Further blocker-map
iteration alone is therefore not a closure route.

## Validation

The owned source contains no `sorry`, `admit`, declared `axiom`,
`native_decide`, `unsafe`, heartbeat override, or linter suppression. Narrow
compilation succeeded:

```text
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/first-apex-robust-global-consumer/\
FirstApexRobustGlobalConsumer.lean
```

The three printed theorem closures are identical:

```text
propext
Classical.choice
Quot.sound
```

No production file, closure document, blueprint artifact, or other scratch
lane was edited.
