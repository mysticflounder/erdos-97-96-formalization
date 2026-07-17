# One-collision / cross-row source audit

Date: 2026-07-17

Status: **KERNEL-CHECKED ALMOST-SURJECTIVE CRITICAL-ROW PATTERN AND STRONG
CONNECTIVITY; KERNEL-CHECKED NO-CROSS-ROW REGRESSION; NONTERMINAL. A SECOND
COLLISION FIBER IS NOT THE PRODUCER TARGET.**

## Corrected question

The formalized ordinal terminal in
`../robust-two-fiber-kalmanson-consumer/` corrects the earlier description of
the `O,A,X` core.  The terminal does **not** use multiplicity of the `X`
blocker fiber.  It uses exactly

```text
cyclic order: O < A < X < J < C < K
O-row: J,C
A-row: C,K
X-row: J,K.
```

Here `A` is the common blocker of the already-forced collision sources
`C,K`.  The center `X` may be an ordinary carrier center with an ordinary
selected row.  Consequently this audit treats a second nontrivial blocker
fiber as a discarded overstrong target and asks instead whether the full
parent, cap order, or strong selected-row connectivity forces the displayed
cross-row triangle.

## Required theorem-bank preflight

Before adding the scratch reductions, this lane checked the registries
required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed `nthdegree docs search --lean` queries covered equal blocker fibers,
almost-surjective blocker maps, faithful carrier patterns, selected-witness
connectivity, outside-pair uniqueness, and the exact `O,A,X,J,C,K` ordinal
packet.  They found the current production blocker-map, carrier-closure, and
Kalmanson stacks but no theorem producing `J,K` in one row from a selected-row
path.

## What the parent exports unconditionally

`SecondCollisionSourceAudit.lean` proves

```lean
FrontierCommonDeletionParentResidual.
  nonempty_collisionAndRobustRowPrefix
```

in this scratch namespace.  It packages:

- distinct sources `C,K` with the same actual blocker `A`;
- the actual `A`-row, containing both `C` and `K`; and
- an arbitrary selected row at the robust first apex `O`.

The `A`-row fields are automatic from equal-blocker exact-support locking.
The `O`-row has **no exported membership identifying either collision source
with one of its points**.

This answers the requested `O`-row check precisely:

- the terminal memberships `C,J in O-row` are not present in the parent;
- `J` alone is not a difficult incidence, since any selected `O`-row has four
  points and one may name a member;
- the load-bearing missing fact is that a collision source `C` belongs to the
  same `O`-row, followed by a choice of `J` with the required later order and
  `X`-row incidence.

The collision is anonymous.  Neither first-apex robustness nor the finite
pigeonhole argument puts `C` or `K` on the retained first-apex radius.  This
agrees with the checked off/on-radius trichotomy in
`../robust-collision-cap-localization/`.

## Useful almost-surjective consequence

There is a genuine positive theorem on the exact-single-double-fiber arm.
The finite repair lemma

```lean
exists_preimage_of_unique_collision_and_omission
```

replaces one member of the unique double fiber by the omitted robust value.
The repaired finite endomap is injective and therefore surjective.  Hence the
original blocker map hits every carrier vertex except `O`.

The live specialization is stronger than a graph-count observation:

```lean
FrontierCommonDeletionParentResidual.
  exists_criticalRowsOffFirstApexPattern
```

constructs a `FaithfulCarrierPattern` whose row at every center other than
`O` is an actual selected row of the retained `CriticalShellSystem`.  Only
the `O` row is chosen from ambient global K4.  In particular, on this arm the
physical second apex has an actual critical-row preimage.

The companion theorem

```lean
FrontierCommonDeletionParentResidual.
  exists_stronglyConnectedCriticalPattern
```

applies `D.Minimal` and kernel-checks that this almost-critical selected-row
digraph is strongly connected.  Thus the source-valid conclusion is:

```text
from every carrier point, there is a directed selected-row path to every
other carrier point;
all path rows away from O are actual rows of H.
```

This does not say that one path row contains two prescribed vertices.  A
path gives consecutive incidences `v_(i+1) in row(v_i)`; the terminal needs
the nonconsecutive pair `J,K` in one common `X` row.

The more general checked trichotomy says that after choosing the forced
`A` collision, either another blocker center has a nontrivial fiber, the
`A` fiber has a third source, or the physical second apex lies in the blocker
image.  This is a classification aid, not the closure target.

## Exact finite regression

`SecondCollisionFiniteBoundary.lean` gives a kernel-checked `Fin 12` row and
blocker abstraction.  It is not a Euclidean counterexample and does not model
the full cap/MEC surface.  It simultaneously retains:

- a total fixed-point-free blocker map omitting the robust apex;
- exactly one nontrivial blocker fiber, the double fiber `C,K -> A`;
- source membership and exact support locking on blocker fibers;
- one selected card-four row at every center;
- a card-five robust first-apex class;
- explicit first- and second-apex four-classes surviving deletion of the two
  frontier labels; and
- the full finite minimality consequence that every nonempty row-closed
  subset is the whole carrier.

The regression deliberately supplies more of the terminal prefix than the
live parent currently does:

```text
O-row contains C,J
A-row contains C,K.
```

Nevertheless the checked theorem

```lean
no_crossRow_completion_checked
```

shows that **no** other represented center has a row containing `J,K`.
Therefore even the corrected one-collision prefix plus full selected-row
closure/strong connectivity does not force the ordinary `X` row.

The model omits metric and cap-order realizability, so it does not prove that
the full Euclidean parent avoids the packet.  It does prove that blocker-map
multiplicity, exact-row incidence, and minimality reachability alone are the
wrong abstraction.  Since the `X`-row pair is absent before assigning an
order, adding an abstract cyclic order cannot activate the terminal; the next
producer must use geometric cap/MEC/order information to create the pair.

## Exact remaining producer

The load-bearing target is now a one-collision cross-row theorem, up to cyclic
relabeling:

1. choose a collision source `C` lying with another point `J` in one selected
   row at the robust apex `O`;
2. retain the common collision row at `A`, which already contains `C,K`;
3. produce any distinct carrier center `X` whose selected row contains
   `J,K`; and
4. prove the six roles occur in the cyclic order consumed by the formalized
   Kalmanson terminal.

Steps 1 and 3 are the mathematical producer.  Step 4 is a placement/orientation
adapter once the points exist.  Strong connectivity alone cannot replace
step 3, and no second blocker-fiber multiplicity assumption belongs in the
target.

## Validation

Focused elaboration succeeded:

```text
cd lean
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/second-collision-source-audit/\
SecondCollisionSourceAudit.lean

lake env lean -R .. -M 16384 -s 65536 \
  ../scratch/atail-force/second-collision-source-audit/\
SecondCollisionFiniteBoundary.lean
```

Every printed theorem uses only `propext`, `Classical.choice`, and
`Quot.sound` as applicable.  The finite exhaustive row-closure check uses a
localized `maxHeartbeats 2000000`; no theorem uses `sorry`, `admit`, a
declared axiom, `native_decide`, or unsafe code.

No production Lean, plan document, generated blueprint, protected unique-row
artifact, `SurplusM44`, or shell-curvature file was edited.
