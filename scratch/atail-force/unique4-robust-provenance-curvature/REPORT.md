# Exact-four robust provenance / curvature audit

Date: 2026-07-22

Status: **SOURCE-CLEAN ROBUST-ARM INGRESS; CYCLIC PLACEMENT NOT PROVED.
THE COLLISION AND PACKED-CORE ARMS NOW RETAIN THEIR ACTUAL RADIUS-CLASS
PROVENANCE THROUGH THE SAME LATE CRITICAL SYSTEM THAT SUPPLIES THE TWO FIXED
ROWS.  THIS SHARD DOES NOT PROVE `TwoCompletionRowMiddleArcPlacement`, DOES
NOT CLOSE THE ROBUST ARM, AND DOES NOT CLOSE A SOURCE `sorry`.**

## Scope

This lane owns only

```text
scratch/atail-force/unique4-robust-provenance-curvature/
```

and deliberately leaves the singleton minimal-core arm to its separate owner.
It starts from the collision and nontrivial packed-core outputs of

```lean
exists_strictCap_collision_or_singletonCore_or_packedCore
```

and tests whether either source-faithful robust output reaches the checked
aggregate consumer

```lean
false_of_twoCompletionRowMiddleArcPlacement
```

without passing through the provenance-erasing
`StrictCapRobustCompletionChoice` packet.

## Required preflight

Before introducing another finite pattern, the bank registries required by
`AGENTS.md` were searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered robust deletion
radius classes, `MinimalDeletionCore` cap packing, two fixed-image rows, and
two-completion-row curvature.  The load-bearing existing declarations found
were:

```lean
exists_strictCap_collision_or_singletonCore_or_packedCore
MinimalDeletionCore.supports_pairwise_disjoint
MinimalDeletionCore.capByIndex_card_ge_six_of_two_sources
CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
selectedClass_inter_capByIndex_card_le_two
false_of_twoCompletionRowMiddleArcPlacement
```

No banked theorem supplies the three cyclic gap inequalities required by the
last consumer.

## Critical source correction: rebase before global deletion

`FixedImageTwoRowIngress R Q` uses the system

```lean
lateFirstApexSystem R.
```

Applying the global deletion trichotomy directly to `R` only proves that the
fresh robust center is omitted from the original frontier system `H`; that
does not imply omission from the late system and cannot prove distinctness
from the two fixed row centers.

The checked construction instead defines

```lean
Rlate := lateFirstApexResidual R
```

and applies the trichotomy to `Rlate`.  Its collision and packed outputs are
therefore omitted by exactly `lateFirstApexSystem R`.  This proves that the
fresh center is distinct from both fixed-image row centers without changing
or reassigning the critical map.

This rebase is load-bearing.  Any later producer that returns to the original
`H` has lost the provenance needed by the curvature route.

## Kernel-checked collision ingress

```lean
CollisionCurvatureIngress R Q
```

retains:

- the complete `FixedImageTwoRowIngress R Q`;
- a fresh carrier center in one strict physical cap;
- the actual nonempty protected deletion set and its minimal restoration
  equations;
- two distinct deleted sources at one radius;
- full singleton-deletion robustness at the fresh center;
- omission of that center from `lateFirstApexSystem R`;
- the actual complete ambient radius class with cardinality at least five;
- two support-distinct four-subsets of that same class.

The theorem

```lean
CollisionCurvatureIngress.fullClass_inter_centerCap_card_le_two
```

adds the checked ordered-cap fact that the **complete ambient class**, not
merely either selected four-subset, has at most two points in the cap that
contains its center.

This is stronger than the previous generic robust-radius choice.  It still
does not determine where the left outer arc of one four-subset and the right
outer arc of another occur relative to the two fixed-image rows.

## Kernel-checked packed-core ingress

```lean
PackedCoreCurvatureIngress R Q
```

retains:

- the same late-system fixed-row and omission data;
- the actual nontrivial `MinimalDeletionCore`;
- its protected deletion set and restoration equations;
- the quantitative cap-complement packing bound;
- two distinct actual core sources.

The definitions

```lean
PackedCoreCurvatureIngress.leftCompletionRow
PackedCoreCurvatureIngress.rightCompletionRow
```

are the actual critical shells indexed by those sources, not arbitrary K4
rows selected after forgetting the core.  The checked theorems prove that
their supports are disjoint and that each meets the fresh center's physical
cap in at most two points.

Again, disjoint support and cap-complement packing are cardinal/incidence
facts.  They do not place the two shell arcs on opposite sides of the two
fixed rows in cyclic boundary order.

## Source split

The warning-clean theorem

```lean
exists_collisionCurvatureIngress_or_singleton_or_packedCoreCurvatureIngress
```

is the source-faithful trichotomy.  It passes the singleton core through
unchanged and does not claim robustness there.  On the other two arms it
returns the packets above without erasing the witnesses that distinguish
large-class collision from distinct-shell packing.

The reported axiom closure of the source split and representative geometric
consequences is exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx` in this shard.

## Corrected fixed-`n = 11` audit

`audit_robust_curvature.py` starts from the complete-radius outer projection
and adds the actual collision or packed-core normal form.  A first version was
discarded because the shared outer omitted already-proved displayed-cap row
bounds.  No output from that version is used as evidence.

The corrected audit adds and independently replays:

1. every selected row centered in a displayed closed cap has at most two
   support points in that cap; and
2. a selected row centered at a support-triangle endpoint has at most one
   support point in either incident cap.

These are finite translations of the checked ordered-cap theorems, not new
assumptions.  The corrected first-round statuses are stored compactly in
[`corrected_first_round_status.json`](corrected_first_round_status.json):

| cap profile | robust arm | result |
|---:|---|---|
| 4 | collision | bare CaDiCaL `UNSAT` in 505.03 s |
| 5 | collision | `UNKNOWN` at 600 s |
| 4 | packed core | `UNKNOWN` at 600 s |
| 5 | packed core | `UNKNOWN` at 600 s |

The first result is **solver evidence only**: it has no DRAT replay and is
restricted to this fixed finite projection.  It is not a Lean proof and not
an arbitrary-cardinality collision theorem.  Each `UNKNOWN` means unresolved
under the stated budget, not SAT and not a survivor.

Raw CNFs, solver logs, and obsolete run directories are ignored and must not
be staged.  The script now hash-binds all source files and theorem banks for
future checkpoints.

The four `*_corrected_v1` directories were produced by the pre-hash-bound
harness and are intentionally **not** `--check` targets; their legacy minimal
manifests do not contain `profile`, `mode`, or source hashes.  Only the compact
status table above is retained from them.  Future v2 manifests produced by the
current script carry the complete hash boundary and are the only manifests
accepted by `--check`.

## Full-linear Kalmanson warning

Shell-turn feasibility is weaker than the tracked full abstract-distance
Kalmanson system in

```text
scratch/atail-force/generic-biapex-kalmanson-search/cegar.py::metric_check
```

The installed center/member schema bank is also not complete for the latest
corrected survivors.  Therefore no future SAT endpoint from this lane may be
called a survivor until it passes the full-linear checker.

There is an additional interface hazard specific to this lane:

- collision exposes several four-subsets at one center;
- packed core exposes two distinct-radius rows at one center.

A map `center -> support` silently drops one of those row instances.  A valid
full-linear adapter must give every concrete row its own identity and assert
its three equal-distance equations separately.  A schema stated only as
`(center, point)` memberships can be used here only after an explicit choice
of concrete row instances has been made and checked.

The audit now implements exactly that row-instance lift while reusing the
tracked checker's distance variables and constraint construction.  It runs
the full-linear oracle before shell-turn curvature and stops, rather than
banking a literal cut, when a model is killed.  The checker source is included
in the run hash boundary.

As a smoke gate, the explicit-row adapter was run on both corrected direct
overlay assignments.  It reproduced the independently reported small cores:

```text
profile 4 dependency centers: {0,1,3}
profile 5 dependency centers: {0,1,2,10}
```

Both statuses were full-linear `UNSAT`.  This smoke result is bounded solver
evidence for those supplied row tables, not a Lean certificate and not a
statement about the robust arms.

## Exact missing implications

The existing terminal would close either robust arm from the following
order-sensitive outputs:

### Collision

Use the fresh collision center, one actual four-subset for the left completion
row, the other for the right completion row, and prove:

```text
left-completion left arc  <=  fixed row 1 arc
fixed row 1 arc           <=  fixed row 2 arc
fixed row 2 arc           <=  right-completion right arc.
```

### Packed core

Use the two actual core shells as the two completion rows and prove the same
three inequalities.

Neither support distinctness, support disjointness, late-system omission,
full robustness, nor cap-complement packing currently proves these cyclic
placements.  The first useful new theorem must be an order-sensitive
strengthening that visibly consumes the collision source pair or the two
minimal-core source identities.  Another bare row-choice theorem would only
restate data now already source-closed.

## Validation

With the required scratch dependencies compiled into a temporary module
directory, from `lean/`:

```bash
lake env bash -c '
  export LEAN_PATH=/tmp/unique4-robust-prov-modules:$LEAN_PATH
  lean -R .. -DwarningAsError=true \
    -o /tmp/unique4-robust-prov-modules/RobustProvenanceCurvature.olean \
    ../scratch/atail-force/unique4-robust-provenance-curvature/RobustProvenanceCurvature.lean
'
```

Result: **PASS**.
