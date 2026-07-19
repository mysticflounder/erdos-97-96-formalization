# Source-indexed Lemma 81 producer audit

Date: 2026-07-17

Status: **THE CONSUMER NORMALIZATION IS SOURCE-VALID, BUT THE PRODUCER IS
OPEN.  A REPEATED BLOCKER FIBER AUTOMATICALLY SUPPLIES THE COMPLETE `Z`-ROW
AND `Z` IN THE `W`-ROW.  THE FIRST NON-DEFINITIONAL INCIDENCE IS A RETURN HIT
FROM ONE FIBER SOURCE INTO THE CRITICAL ROW SOURCED BY `Z`; EVEN AFTER SUCH A
HIT, THE ORDER `W < F < P < X < Z` IS A SEPARATE LOAD-BEARING FACT.  NEITHER
`B.secondApex_robust` NOR THE TWO CAP-SIX FIELDS OF `L` CURRENTLY FORCE EITHER
FACT.  NO PRODUCTION `sorry` IS CLOSED.**

No production source, plan document, generated file, `ShellCurvature`,
`surplusM44`, card-five consumer, or protected FA-UNIQ lane was edited.  No
Lean or Lake command was run.  The Lean file in this directory is explicitly
a source draft and has not been elaborated under the active build pause.

## Required theorem-bank preflight

Before proposing this local two-row specialization, the audit checked the
registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` and current 555/654 sections;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed Lean searches were run for the Lemma 81 consumer, critical
shell rows, source return/cross membership, and repeated blocker fibers.  The
search recovers:

- `FivePointCircleIsoscelesOrderBridge.false_of_core_of_ccw`;
- `CriticalShellSystem.selectedAt` and exact full-shell support;
- `FullyDeletionRobustAt.exists_distinct_sources_same_blocker`;
- `FrontierCommonDeletionCriticalFiber`;
- `source_mem_qBlockerShell_of_actualBlocker_eq`; and
- the existing different-pair and same-cap critical-fiber consumers.

It does not recover a theorem forcing the return hit or the Lemma 81 cyclic
placement from the large-cap bi-apex parent.  The legacy banks contain local
metric consumers, not a producer with the current `CriticalShellSystem`
provenance.  The 230/230 555/654 match is consumer coverage on fixed card-12
cores and is not live occurrence evidence on the card-at-least-14 surface.

## Sharper source-indexed normalization

Let

```text
fiber : FrontierCommonDeletionCriticalFiber R
```

be any repeated blocker fiber.  Write

```text
P, X = the two fiber sources, in either orientation
Z    = H.centerAt fiber.source1
W    = H.centerAt Z
Zrow = H.selectedAt fiber.source1   -- centered at Z
Wrow = H.selectedAt Z               -- centered at W
```

Then production already proves all of the following.

1. `P` and `X` are distinct carrier vertices.
2. The two source-indexed rows for the fiber sources have equal centers and
   equal complete supports.
3. `P ∈ Zrow` by own-source membership.
4. `X ∈ Zrow` by support locking for equal blocker centers.
5. `Z ∈ Wrow` by own-source membership at source `Z`.
6. Both rows are exact full ambient filters of cardinality four with positive
   radii.
7. `W ≠ Z`, because the blocker map has no fixed point.
8. A CCW boundary enumeration exists from convex independence once the five
   roles have actually been selected.

Thus the earlier anonymous formulation

```text
Z ∈ row(W),  X ∈ row(W) ∩ row(Z),  P ∈ row(Z)
```

contains only one genuinely new row incidence after source normalization:

```text
X ∈ Wrow.
```

The exact first missing proposition for a fixed critical system is the
scratch definition

```lean
FiberParentReturnHit fiber
```

which expands to

```text
fiber.source1 ∈ H.selectedAt Z  or
fiber.source2 ∈ H.selectedAt Z.
```

Equivalently, after orienting the two sources as `P,X`, the producer needs

```text
X ∈ (H.selectedAt Z Z_mem_A).toCriticalFourShell.support.
```

By production
`cross_deletion_survives_iff_not_mem_selected_support`, this positive
incidence is equivalent to deletion of `X` **failing** to preserve K4 at
`W`.  Current robustness hypotheses say the opposite kind of thing only at
the two physical apices; they say nothing about the arbitrary actual blocker
`W`.

## The order step remains independent

A return hit is not yet a Lemma 81 occurrence.  One must still choose

```text
F ∈ Wrow
```

with five distinct roles in the cyclic order

```text
W < F < P < X < Z.
```

Cardinality four makes an additional `Wrow` member available, but does not
put it in the boundary arc before `P`.  The cap-order bridge consumes the
order once supplied; it does not produce the order from row incidence.

`SourceIndexedLemma81Producer.lean` records the exact packet

```lean
CriticalFiberLemma81Occurrence fiber
```

and a no-`sorry` source draft of

```lean
CriticalFiberLemma81Occurrence.false : False.
```

The adapter uses only:

```text
FrontierCommonDeletionCriticalFiber
  -> source membership + equal-support locking
  -> X ∈ Wrow + F ∈ Wrow + W<F<P<X<Z
  -> WF = WX = WZ and PZ = XZ
  -> FivePointCircleIsoscelesOrderCore.metric_order_incompatibility
  -> False.
```

This is proof-producing **only after** the occurrence packet exists.  The
scratch adapter itself does not prove the missing producer and has not been
elaborated during the build pause.

## Why the live extra fields do not currently force it

### `B.secondApex_robust`

Production uses second-apex robustness to omit the physical second apex from
the blocker image and strengthen multiplicity to two nontrivial fibers or one
larger fiber.  It does not connect a repeated fiber source to the critical
row sourced by that fiber's blocker.  More sources in `Zrow` do not imply
that any source returns into `Wrow`.

The retained physical second-apex row also cannot provide the missing row:
it is a q-deleted selected row centered at the physical apex, not the exact
actual row `H.selectedAt Z`; it has no source identity tying it to the chosen
fiber.

### `L.firstOppCap_card_ge_six` and `L.secondOppCap_card_ge_six`

The cap-six bounds imply `14 ≤ D.A.card` and supply room/cap-local upper
bounds.  They do not force two exact radius filters to meet.  In particular,
two four-point rows in a carrier of cardinality at least fourteen can be
disjoint, and the cap-chain bounds are upper bounds on own-cap hits rather
than lower bounds on cross-row overlap.

Once the roles exist, cap order can decide whether the Lemma 81 order holds.
The two size inequalities alone neither select a favorable repeated fiber
nor force the return hit or the required five-role placement.

Therefore a valid producer must visibly use additional full geometry/global
data, such as simultaneous Euclidean realization of the full filters,
MEC/non-obtuse placement, shell-curvature coupled to a second row, global
minimality, or `noM44`.  An incidence-only proof from multiplicity plus cap
sizes is not supported by the current theorem surface.

## Exact finite regression of the normalization

`check_fiber_parent_return_fixture.py` reuses the frozen card-14 `(5,6,6)`
incidence/order fixture from the prior Lemma 81 audit and checks the normalized
repeated-fiber construction.  Replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/source-indexed-lemma81-producer/\
  check_fiber_parent_return_fixture.py
```

The exact output is:

```text
PASS: source-indexed repeated-fiber normalization
repeated_fibers={2: [3, 5], 3: [4, 6]}
fiber_parent_return_hits={2: [], 3: [6]}
return_hit_F_candidates=[(2, 5, 4, 6, 3), (2, 13, 4, 6, 3)]
ordered_W_F_P_X_Z_occurrences=[]
```

So this abstraction contains one genuine fiber-parent return hit and two
ways to choose `F`, but neither choice has the Lemma 81 order.  This shows
concretely that even the normalized positive row skeleton does not make the
order step bookkeeping.

Rigor boundary: this is **EXACT WITHIN THE FINITE INCIDENCE/ORDER
ABSTRACTION**.  It is not a Euclidean or full-filter realization and does not
refute a producer from the complete live geometric surface.

## Recommended theorem target

Do not require Lemma 81 occurrence from the arbitrary initial critical map.
The honest internal target, if this route is pursued, is a late-system choice:

```text
exists Hfav,
  exists fiber : FrontierCommonDeletionCriticalFiber (rebase R Hfav),
    CriticalFiberLemma81Occurrence fiber.
```

The public theorem should remain direct:

```lean
false_of_largeOppositeCapsBiApexRobust L : False.
```

The late-system producer must establish both the return incidence and the
five-role placement.  If the new `ShellCurvature` work cannot force those
facts, a different direct contradiction is preferable to introducing another
unproved occurrence wrapper.

## Bottom line

This audit reduces the row part of Lemma 81 to one exact positive incidence,
not three: a repeated fiber source must return into the critical row sourced
by its common blocker.  Production supplies every other row membership.
However, the cyclic placement is still a second real theorem.  Neither
second-apex robustness nor the large-cap bounds currently supplies either
missing fact, so this route has a complete consumer but no proof-producing
producer from `L` yet.
