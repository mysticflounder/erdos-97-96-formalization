# Full-parent arbitrary mutual-pair closer audit

Date: 2026-07-18

Status: **THE ARBITRARY MUTUAL-PAIR SIBLING NOW HAS A KERNEL-CHECKED
FULL-PARENT DICHOTOMY, BUT NEITHER ARM IS CURRENTLY FALSE. THE DISTINCT-
BLOCKER ARM PRODUCES TWO SOURCE-FAITHFUL COMMON-DELETION PACKETS FOR THE SAME
DELETED PHYSICAL VERTEX. THE EQUAL-BLOCKER ARM PRODUCES AN ACTUAL PRODUCTION
`FrontierCommonDeletionCriticalFiber`. NO PRODUCTION `sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/global-mutual-pair-closer/`. It does not edit production
Lean, closure documents, generated blueprint state, ShellCurvature, or the
older cycle-edge mutual-omission lanes.

## Exact object audited

The input is the production packet

```lean
M : FullParentExactFiveMutualData L profile
```

whose field

```lean
M.pair : PhysicalActualCriticalMutualOmissionPair H profile
```

is an arbitrary mutually omitting pair of physical exact-five vertices. It
is **not** a `PhysicalActualCriticalMutualOmissionEdge` of a separately chosen
omission cycle. Consequently, the cycle successor identities and the older
cycle-edge global classifier are not silently imported here.

The proof retains the complete parent context:

```text
H, F0, R, B, L, profile, M.continuation, M.pair.
```

In particular, neither the robust bi-apex packet nor the exact-five
continuation is projected away.

## Kernel-checked reduction

### 1. Orient the arbitrary pair using the unused row

`nonempty_fullParentMutualChosenDeletion` proves that one endpoint can be
called `deleted` and the other `partner` so that `deleted` is absent from both

```text
selectedAt partner
selectedAt continuation.unusedRow.unused.point.
```

The first absence is mutual omission. The second follows because the
continuation's unused row meets the five-point physical interior in at most
one point, while the pair endpoints are two distinct physical vertices.

Hence deletion of this one endpoint preserves K4 at four named centers:

```text
S.oppApex1
S.oppApex2
centerAt continuation.unusedRow.unused.point
centerAt partner.
```

The robust parent proves that each actual blocker differs from both physical
apices. The only unresolved collision is equality of the two actual blockers.

### 2. Exhaustive blocker split

`nonempty_fullParentMutualBlockerOutcome` proves

```lean
Nonempty (FullParentMutualBlockerOutcome M)
```

with exactly two constructors.

#### Distinct blockers

`FullParentMutualFourCenterDeletion M` records the four deletion-survival
facts and all required center inequalities. The follow-up theorem

```lean
nonempty_fullParentMutualFourCenterPacketPair
```

packages them as two actual production `CommonDeletionTwoCenterPacket`s for
the same deleted physical vertex:

```text
apexPacket:    centers = oppApex1, oppApex2
blockerPacket: centers = continuation blocker, partner blocker.
```

This is a stronger normal form than a bare four-center existential: both
packets retain the common deletion and source-faithful critical-system
provenance.

#### Equal blockers

`FullParentMutualEqualBlockerShell M` proves that the two selected critical
rows have identical exact support. The common support contains the partner
and unused-row source, omits the chosen deleted endpoint, and the partner is
distinct from both origin-tagged continuation sources.

Most importantly, the structure contains

```lean
criticalFiber : FrontierCommonDeletionCriticalFiber R
```

with its two source identities pinned to

```text
continuation.unusedRow.unused.point
chosen.partner.
```

Thus equal blockers do not merely suggest a critical fiber; they instantiate
the exact production type consumed by `CriticalFiberClosingCore`.

## Why this still is not a direct `False`

### Distinct-blocker arm

The current two-center consumers require positive geometry not present in a
common-deletion packet. The shortest known terminal input is either:

1. two named targets outside one cap which occur in both selected rows of two
   distinct same-cap centers; or
2. a positive cross-row membership together with a compatible cyclic order
   for a Kalmanson/ordered-row consumer.

Deletion survival supplies neither row intersection nor boundary placement.
The older source-return four-center audit reaches the same interface gap:
four pairwise distinct centers at which one source can be deleted are not a
registered terminal without a named positive overlap.

The exact missing producer for this arm is therefore a full-parent theorem
which consumes `L`, both packet rows, and convex/MEC order to produce one of
those terminal positive incidences. Another deletion packet would not advance
the branch.

### Equal-blocker arm

The production `CriticalFiberClosingCore` has two terminal constructors.
The new fiber does not yet supply either one.

For `sameCap`, the first missing input is a source-faithful second center:
both fiber sources must lie outside one cap containing the common blocker and
another distinct center, and that second center must be either the first apex
with equal distances to the sources or an actual `centerAt J` whose selected
row contains both sources.

For `ordered`, the first missing positive input is

```lean
K_mem_J_shell
```

for a source `J`, together with the robust first-apex equality and one
compatible six-role cyclic boundary placement. Equal support of the two
fiber rows does not create this third row.

The exact finite regression in
`critical-fiber-closing-core-samecap/REPORT.md` realizes the current
source-fiber/support-locking surface while excluding any permitted
source-faithful second center. Its status is exact within that finite
abstraction, not a Euclidean `CounterexampleData` model. It prevents treating
the bare critical fiber as a terminal theorem.

## Common-deletion and late-system verdicts

The common-deletion normal form is useful and genuinely stronger:

- distinct blockers give two concrete two-center packets for one deletion;
- equal blockers give a production critical fiber.

It does not by itself close either arm.

Choosing a favorable critical system late also does not close this fixed
packet. `M.pair` and `M.continuation` were generated from the same `H`; changing
`H` after constructing `M` changes the rows, blockers, omission relation, and
continuation. A valid late-choice route must choose `H` first and then rerun
the full assembler while retaining `R`, `B`, and `L`. The dichotomy proved
here applies to whichever `H` is chosen, but no current theorem says some
choice of `H` forces a terminal constructor.

## Relation to the older cycle-edge work

The older `exact-five-mutual-omission-closure` and
`exact-five-mutual-global-cap-consumer` lanes start from a cycle edge and can
use successor/cycle provenance to classify a larger family of actual
blockers. Their exact rational finite-metric regression has digest

```text
db4d45278e5f412212fbef2f5903959a831ef952434ee892642d7f5f779242aa
```

and realizes the crossed-survival/common-deletion surface without the missing
positive shared pair. It is exact within its rational finite-metric model but
is not Euclidean, convex/MEC, or a `CounterexampleData` realization.

That regression is supporting evidence for the consumer gap; it is not used
to transfer cycle-edge fields onto this arbitrary pair.

## Theorem-bank preflight

Before proving the reduction, this lane checked all registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered arbitrary exact-five
mutual pairs, common deletion at three/four centers, critical fibers,
`CriticalFiberClosingCore`, and source-faithful same-cap/ordered consumers.

The nearest reusable declarations are:

- `nonempty_commonDeletionTwoCenterPacket`;
- `CriticalFiberClosingCore` and its direct-`False` theorem;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- the same-cap source-faithful normalization in checked scratch; and
- the older cycle-edge mutual normal forms.

No indexed theorem consumes only the new four-center packet pair, and no
indexed theorem derives either `CriticalFiberClosingCore` constructor from a
bare `FrontierCommonDeletionCriticalFiber`.

## Validation and epistemic status

The owned Lean file was elaborated against the current Lake environment:

```bash
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/global-mutual-pair-closer/GlobalMutualPairCloser.lean
```

The three printed endpoints depend only on:

```text
propext
Classical.choice
Quot.sound
```

The file contains no `sorry`, `admit`, declared axiom, `native_decide`, or
unsafe declaration.

- **PROVED / KERNEL-CHECKED:** the chosen-deletion orientation, exhaustive
  distinct/equal blocker split, two common-deletion packets in the distinct
  arm, and production critical fiber in the equal arm.
- **SOURCE-VERIFIED:** the listed `CriticalFiberClosingCore` interface
  mismatches and prior exact regression boundaries.
- **OPEN:** a terminal positive incidence/order producer for the distinct arm,
  and a source-faithful `sameCap` or `ordered` core for the equal arm.
- **PRODUCTION `sorry` CLOSED:** none.
