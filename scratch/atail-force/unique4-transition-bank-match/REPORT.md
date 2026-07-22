# Exact-four global-transition theorem-bank match

Date: 2026-07-22

Status: **NO UNCONDITIONAL MATCH TO A CURRENT KERNEL-CHECKED
KALMANSON, U5, OR PLANAR CONSUMER.  THE TRANSITION SUPPLIES AT MOST TWO
CONTROLLED ROW CENTERS ON EVERY ARM, WITH ALL NEW CORE SHELLS CONCENTRIC;
THE FIRST MISSING INPUT IS A GENUINE MULTICENTER ROW-OCCURRENCE THEOREM.**

## Scope

This audit starts from the kernel-checked theorem

```lean
Problem97.ATailUniqueFourGlobalCouplingScratch
  .exists_strictCap_collision_or_singletonCore_or_packedCore
```

for

```lean
R : OriginalUniqueFourResidual F.
```

It asks whether one of the theorem's three outputs already produces the
complete antecedent of any current exact-four Kalmanson, signed-U5, or planar
consumer.  A valid match must:

- work at arbitrary carrier cardinality;
- use rows or complete classes actually supplied by the source theorem;
- preserve the displayed physical cap order; and
- not choose an arbitrary global-K4 row and then assume favorable members.

No production file, shared outer, closure document, or other scratch lane is
changed here.

## Required theorem-bank preflight

Before matching the transition, the following registries and live scratch
adapters were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`;
- `scratch/atail-force/general-n-u5-schema-coverage/schema_catalog.json`;
- `scratch/atail-force/unique4-kalmanson-core-port/
  UniqueFourKalmansonCores.lean`;
- `scratch/atail-force/whole-carrier-planar-rank-cegar/
  WholeCarrierPlanarRankCut.lean`; and
- the selected-row tetrahedron and five-point Kalmanson adapters.

Focused `nthdegree docs search --lean` queries covered the exact transition
name, strict-cap collisions, singleton and packed deletion cores, exact-four
Kalmanson row patterns, and U5 collision patterns.  They returned the known
U5 metric consumers, but no producer that upgrades this transition to a
multicenter occurrence.

The signed-U5 catalog contains 93 normalized schemas from 96 source-proved,
reachable class consumers.  Its checked center histogram is

```text
3 centers:  1 schema
4 centers: 29 schemas
5 centers: 40 schemas
6 centers: 18 schemas
7 centers:  5 schemas.
```

The sole three-center U5 schema is consumed by

```lean
Problem97.ATailTetrahedronBankAdapterScratch
  .false_of_three_selected_classes_tetrahedron.
```

The smallest checked exact-four Kalmanson consumers likewise require three
distinct row centers.  The current planar schema is consumed by

```lean
Problem97.WholeCarrierPlanarRankCut
  .false_of_four_selected_rows_auxBaseCollision
```

and requires four distinct row-center roles and twelve selected-row
memberships.

## What the transition actually controls

Write

```text
P = S.oppApex1
C = SelectedClass D.A P radius
U = C union S.triangle.verts.
```

The parent gives the complete exact-four class `C` at `P`.  The transition
then returns a fresh carrier point `center` in one strict physical cap and a
minimal blocking deletion set `V subset U`.

The controlled row centers are as follows.

| transition arm | source-controlled equal-radius data | distinct controlled row centers |
| --- | --- | ---: |
| collision | the exact class `C` at `P`; one radius class at `center` through the colliding `s,t`, of ambient cardinality at least five | at most 2 |
| singleton core | the exact class `C` at `P`; one exact critical shell at `center` through the sole member of `V` | at most 2, but no common pair is forced |
| packed core | the exact class `C` at `P`; several pairwise-disjoint exact shells, all centered at the same `center` | at most 2, never one center per shell |

The `MinimalDeletionCore.shellAt` index is a deleted **source**, not a row
center.  Every shell in that structure has the same center `center`.
Consequently, two members of a packed core do not supply two row-center roles
for an injective Kalmanson or U5 embedding.

The robust collision and packed outputs also prove that `center` is omitted
from the image of the fixed critical map `H`.  This yields an anonymous
repeated blocker fiber by finite noninjectivity, but it gives neither the
fiber sources' boundary positions nor any prescribed support membership at
their blocker.  It is therefore not a signed row occurrence.

Global K4 can of course choose a selected row at any carrier center.  None of
the transition fields forces the named members of such a row.  Invoking K4
and selecting favorable members would be exactly the arbitrary-row-choice
gap excluded by this audit.

## Consumer-by-consumer result

### Kalmanson consumers: no match

Every current direct exact-four Kalmanson consumer in
`UniqueFourKalmansonCores.lean` has at least three strictly ordered row
centers and explicit cross-row support memberships.  The older five-point
adapter

```lean
false_of_selected_rows_in_five_ccw_order
```

also requires three centers and six prescribed memberships.

The transition supplies the physical cap containing `center`, and hence can
eventually locate named carrier points in a shared boundary order.  It does
not supply the third incidence-bearing row center or the cross memberships
used by any of these consumers.  The packed arm does not repair the deficit:
its multiple shells are concentric rather than rows at multiple centers.

**Result:** no complete Kalmanson antecedent is produced.

### Signed U5 consumers: no match

All 93 normalized U5 schemas require at least three distinct row centers.
The uniquely closest three-center schema is the tetrahedron consumer, whose
local selected-row form needs eight positive incidences among three rows.
Neither the collision class nor a minimal-deletion core supplies a third
row center with the required cross incidences.  The transition also supplies
none of the literal signed nonmembership atoms used by the larger schemas.

The earlier exact-four U5 ingress audit already proves that even the stronger
three-row interface consisting of the exact `P`-row plus arbitrary global-K4
rows at the two named strict-cap points does not force any catalog schema.
The present transition does not improve those two source-indexed rows: its
new shells are centered at `center`, not at the strict-cap sources.

**Result:** no complete signed-U5 antecedent is produced.

### Planar consumer: no match

`false_of_four_selected_rows_auxBaseCollision` requires the four row centers
`p,q,t1,t3` and the displayed twelve-membership schema.  The transition has
at most the exact `P`-row and one `center`-row with controlled members.  It
does not produce the remaining two row centers or the auxiliary chain of
equalities.

**Result:** no complete planar-bank antecedent is produced.

### Existing outside-pair terminal: already exhausted

The transition does meet the two-center geometry of

```lean
Problem97.CapSelectedRowCounting.outsidePair_unique_capCenter
```

only under the extra conditions that the collision sources both lie in `C`,
the fresh center is in a cap adjacent to `P`, and both sources lie outside
that cap.  This is not an open match: the already checked theorem

```lean
Problem97.ATailUniqueFourGlobalCouplingScratch
  .collision_sources_exact_cap_residual
```

uses the terminal to eliminate precisely that case.  Endpoint one-hit then
shows that the surviving adjacent-cap case has exactly one collision source
inside and one outside the cap.  The other surviving collision cases are:

1. `center` lies in the cap physically opposite `P`; or
2. at least one deleted collision source is a protected Moser vertex outside
   the exact class `C`.

Thus the only direct two-center terminal has already contributed all the
force it can.  Treating it as a still-available closure route would repeat an
eliminated subcase.

The exact-four wrapper

```lean
Problem97.ATailUniqueFourSurplusPairProducerScratch
  .false_of_existsSurplusFirstApexClassPairCenter
```

uses the same outside-pair geometry.  It additionally requires the fresh
center to lie in the surplus cap and two collision points to lie outside that
cap.  The surviving adjacent-cap classification has one point inside, while
the other collision arms do not supply this packet.  It therefore adds no
unconsumed transition case.

### Third common-pair terminal: no match

The checked theorem

```lean
Problem97.ATailThirdCenterCommonPairScratch
  .false_of_thirdActualCenter_selectedRow_contains_frontierPair
```

requires a genuinely third actual blocker row through one fixed pair after
two distinct pair centers are known.  A collision subcase can supply two
centers for its own pair when both deleted sources lie in `C`; the transition
does not supply a third actual row through that pair.  The repeated fiber
obtained from robust-center omission has no prescribed pair memberships, so
it cannot fill this antecedent.

## Exact first missing source field

There is no missing cardinality bound and no missing conversion from a full
radius class to a selected row.  The first absent datum is **multicenter
incidence occurrence**:

> From one of the transition outputs, produce a genuinely third
> incidence-bearing carrier center (a fourth for the planar schema), together
> with the exact selected-row memberships of one existing kernel-checked
> Kalmanson/U5/planar schema and the required physical cyclic order.

This must be proved for an actual source-controlled row (for example an
actual fixed critical shell or a complete class forced by a deletion), not
for an arbitrary witness chosen from `D.K4`.

Equivalently, the useful next theorem is an occurrence/coverage theorem over
the transition residuals:

```text
collision or singleton-core or packed-core
  -> checked multicenter schema occurrence
     or a separately named MEC/no-M44 residual.
```

The second disjunct is necessary because the transition's cap-packing output
may constrain cap sizes without forcing any local row pattern.  A theorem
which merely returns another selected row with unspecified support would not
advance this interface.

No new Lean structure is introduced here.  None of the three branch-local
deficits has a complete immediate consumer, so packaging it would be another
conditional adapter rather than closure work.

## Focused validation

The current transition file and the complete current
`UniqueFourKalmansonCores.lean` file were freshly elaborated with
`-DwarningAsError=true`.  The planar and tetrahedron consumers were also
freshly elaborated against their checked dependencies.  The printed axiom
closure of every cited theorem is exactly

```text
propext
Classical.choice
Quot.sound
```

No Lean file was added in this lane because the audit found no source-valid
producer/consumer composition to formalize.

## Epistemic status

- **PROVEN / KERNEL-CHECKED INPUT:**
  `exists_strictCap_collision_or_singletonCore_or_packedCore` and
  `collision_sources_exact_cap_residual`.
- **SOURCE-CATALOG VERIFIED:** 96 source-proved/reachable U5 consumers and 93
  normalized signed schemas, all needing at least three distinct centers.
- **KERNEL-CHECKED CONSUMERS:** the cited Kalmanson, tetrahedron, planar, and
  outside-pair theorems.
- **PROVEN INTERFACE MISMATCH:** no branch output itself contains the distinct
  row centers and support memberships of any cited bank consumer; the sole
  direct outside-pair subcase is already eliminated by the checked collision
  classification.
- **OPEN:** whether the full `OriginalUniqueFourResidual` hypotheses imply a
  uniform multicenter bank occurrence or instead force a new MEC/no-M44
  residual.  This audit does not claim a logical countermodel to that stronger
  global statement.
