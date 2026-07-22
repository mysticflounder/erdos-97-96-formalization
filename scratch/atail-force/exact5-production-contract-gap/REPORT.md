# Exact-five live-contract gap audit

Date: 2026-07-21

Status: **SOURCE AUDIT.  NO LEAN `sorry` IS CLOSED.**

## Question

This audit compares the live production theorem

```lean
Problem97.ATailFrontierLiveClosure
  .false_of_frontierBiApexRobustExactFiveGlobalCoverStarResidual
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (outcome : ExactFiveGlobalCoverStarOutcome Q profile) :
    False
```

with the current exact-five scratch surfaces:

1. `exact5-global-cover-parent-gate`, the source-faithful Boolean outer;
2. `exact5-all-one-card13-card14-gate` and
   `exact5-allone-aggregate-kalmanson-cegar`, which add one common strict
   convex boundary order and exact linear Kalmanson distance constraints;
3. the separate retained-row audit
   `/Users/adam/scratch/full_parent_exact6_search/`
   `EXACT_FIVE_SECOND_CAP_PARENT_ROW_AUDIT.md`, which records the now-checked
   `R.common.packet.B1/B2` physical-hit bridge and its downstream production
   reductions;
4. `exact5-all-one-finite-metric-regression`, the exact abstract-metric
   countermodel to an incidence/minimality/retained-row proof; and
5. `exact5-asymmetric-global-minimality-boundary`, the kernel-checked proof
   that singleton/pair minimality can stutter at the already known blocker.

The first two are the tracked common-order search gates. The third is not a
search gate: it is a source/consumer audit of different rows. The last two are
negative acceptance gates: a proposed theorem must use a fact absent from the
relevant regression.

The labels below have their literal meanings:

- **encoded**: the exact field, or an equivalent finite witness, is present;
- **projected**: only a necessary consequence is present;
- **omitted**: no corresponding constraint is present;
- **consumed-production**: production already turns the field into a sharper
  theorem, so re-proving that projection is not a new target.

SAT/UNSAT results in these tables remain results inside the stated
abstractions, not Lean proofs of the live theorem.

## Ambient data carried implicitly by every input

The important omissions occur before the named structures are opened.

| Source data | Boolean outer | Common-order gate | Finite-metric regression | Production status |
| --- | --- | --- | --- | --- |
| `D.A`, `D.nonempty` | fixed finite labels | fixed finite labels | exact finite carrier | routine |
| `D.convex : ConvexIndep D.A` | cyclic labels plus local alternation/cap-hit consequences | all strict triangle and Kalmanson inequalities for that order | omitted; the metric is deliberately non-Euclidean | common boundary charts and cap-order consequences already exist in production |
| `D.K4` | one chosen four-row in each represented row family at every center | same | complete radius classes checked at every center | represented exactly only by the finite-metric regression |
| the actual `S : SurplusCapPacket D.A` | abstract three-cap label blocks and cardinalities | same | abstract cap sets and cardinalities | **actual MEC disk, MEC-boundary support, nonobtuse support triangle, and cap construction are omitted by every scratch gate** |
| `H.shellAt` | one blocker integer and one selected four-row per source | same row equalities | complete ambient radius classes | Boolean/common-order gates omit full-class exactness |
| `H.no_qfree` | uniqueness synchronization only at centers in the chosen blocker image | same | deletion failure checked against every ambient radius class | full deletion-critical semantics are omitted by the Boolean/common-order gates |

Thus the finite-metric regression and the common-order gate deliberately miss
opposite halves of the live geometry: the regression has the global
critical/deletion data but no planar/MEC realization, while the common-order
gate has strict convex distance inequalities but only a selected-row
projection of the global critical system.

## `F : CriticalPairFrontier D S radius H`

### `F.pair : SurvivorPairRelocationPacket D S radius H`

| Field | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `q`, `w`, `q_mem_A`, `w_mem_A`, `q_ne_w` | encoded as distinct carrier labels | encoded | routine |
| `q_mem_marginal`, `w_mem_marginal` | projected as `q,w` off the surplus cap and co-rowed at `S.oppApex1`; the complete ambient `radius` filter is not represented | encoded as first-apex co-radiality and cap roles | supplies the retained first-apex radius and the exact role domain in `FirstApexShellRolePacket` |
| `q_survives`, `w_survives` at `S.oppApex2` | projected by the selected double-deletion row omitting both points | checked by complete classes | consumed by the common-deletion/frontier normal forms |
| `q_blocker_ne_oppApex2`, `w_blocker_ne_oppApex2` | encoded by excluding both robust apices from every chosen blocker | encoded | subsumed by bi-apex robustness |

### Direct fields of `F`

| Field | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `pair` | as above | as above | as above |
| `firstApexSplit` | only its common-deletion disjunct is represented, through a four-row after deleting `q,w` | checked | the exact-five theorem is already indexed by `R`, so this disjunction has already been resolved |
| `secondApexDouble` | encoded by a selected four-row at `S.oppApex2` omitting `q,w` and lying in the five-class | checked | makes the left disjunct of `secondApexSplit` available |
| `secondApexSplit` | no additional constraint beyond `secondApexDouble` | checked | logically redundant on this branch because `secondApexDouble` is already a field |

## `R : FrontierCommonDeletionParentResidual F`

### Direct fields of `R`

| Field | Boolean outer | Common-order gate | Finite-metric regression | Existing production use |
| --- | --- | --- | --- | --- |
| `minimal` | projected only as strong connectivity of three independently chosen row digraphs | same | exhaustive over every proper nonempty subset | the asymmetric outside-pair minimality route is kernel-checked to stutter; do not retry it |
| `noM44` | omitted | omitted | not meaningful without actual alternative MEC packets | still unused by every scratch decision |
| `carrier_card_gt_nine` | instantiated only at cards 13 and 14 | same | card 13 | the live theorem remains uniform |
| `frontierRadius_class_card_ge_four` | projected by a four-row at the first apex containing `q,w` | equal-distance constraints added | the displayed first-apex class has six points | `nonempty_firstApexShellRolePacket F R` extracts a stronger source-valid packet |
| `common` | projected as the two double-deletion rows and blocker exclusions; the retained q-deleted packet is omitted | same | represented by exact retained rows `B1,B2` | see below |

### `R.common : FrontierCommonDeletionResidual F`

| Field | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `firstApexDouble` | one four-row `b1` at the first apex omitting `q,w` | existence checked by the complete first-apex class | `FirstApexShellRolePacket` gives this row two strict first-opposite-cap hits and the equal-radius-six/disjoint-radius split |
| `packet` | **omitted as a source packet** | encoded by named `B1,B2` | production already proves the physical-row bridge below |

### `R.common.packet : CommonDeletionTwoCenterPacket`

The current Boolean and common-order gates do not contain these retained
q-deleted rows.  Their `b1` row is the first-apex **double-deletion** row, and
their second-apex `m` row is a selected **double-deletion** row; neither is
`R.common.packet.B1` or `B2`.

| Field group | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `q_mem_A`, both center memberships, `centers_ne` | implicit in the fixed labels | encoded | routine |
| `survives1`, `survives2` after deleting only `q` | projected by other rows, but no named witnesses are retained | encoded by `B1,B2` | used to construct the packet |
| both `actual_blocker_ne_center` fields | encoded globally by excluding both apices from the blocker image | encoded | subsumed by robustness |
| `B1`, `row1`, `B1_card` | omitted | encoded with its exact equality class | first-apex physical intersection has cardinality at most one |
| `B2`, `row2`, `B2_card` | omitted | encoded with its exact equality class | `parentSecondRow_subset_physicalClass`; at least two physical hits |
| `overlap_le_two` | an analogous bound exists only for the encoded double-deletion rows | encoded with `|B1 ∩ B2| = 2` | combines with the preceding bounds |

The exact checked consequence is already stronger than the earlier proposed
row-hit producer:

```lean
exists_physicalVertex_mem_parentSecondRow_not_mem_parentFirstRow
  (R : FrontierCommonDeletionParentResidual F)
  (profile : LargeCapUniqueFiveSecondApexRadius D S) :
  ∃ x : PhysicalVertex profile,
    x.1 ∈ R.common.packet.B2 ∧ x.1 ∉ R.common.packet.B1
```

Accordingly, adding only an existential physical anchor is duplicate work.
What the common-order gate is still missing is the two retained row
equalities and their same-live-parent provenance.

This retained-row result must not be conflated with
`FirstApexShellRolePacket`:

- `R.common.packet.B1` and `B2` are rows retained after deleting only `q`, at
  the first and second apices respectively;
- `FirstApexShellRolePacket.retainedRow` is a chosen four-subrow of the
  ambient first-apex frontier-radius class which contains both `q` and `w`;
  and
- `FirstApexShellRolePacket.doubleRow` is a chosen first-apex row after
  deleting both `q` and `w`.

The tracked gate's `b1` denotes the last of these. It is not the parent
packet's `B1` despite the similar name.

## `B`, `Q`, and `profile`

| Source field | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `B.secondApex_robust` | projected by the complete five-class; the first-apex robust consequence is represented only by displayed rows | checked for every singleton deletion at both apices | excludes both apices from the blocker image and produces the cap bounds |
| `Q.firstOppCap_card_ge_six` | instantiated by the fixed cap profile | encoded as cap size six | already a cap bound, not a row occurrence |
| `Q.secondOppCap_card_eq_five` | instantiated exactly | encoded | gives exactly three strict physical points |
| `profile.radius` | one unnamed shell identifier | exact rational radius class | routine |
| `profile.radius_pos` | omitted in B0; distance positivity in LRA | encoded | routine |
| `profile.class_card_eq_five` | encoded as a five-member shell | encoded as the complete class | gives the three-member physical set and the retained-row intersection count |
| `profile.unique_K4_radius` | projected only by synchronizing represented rows at the second apex into the shell; other ambient radii are not quantified | checked over all complete radius classes | `parentSecondRow_subset_physicalClass` and the short-cap terminal consume it |

## `outcome : ExactFiveGlobalCoverStarOutcome Q profile`

### Common star fields

| Field group | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `hub`, `spoke1`, `spoke2`, three inequalities, `physicalVertices_eq` | encoded by the five source-role orbits | encoded | fixes the complete three-vertex physical set |
| `hub_spoke1_cover`, `hub_spoke2_cover` | encoded by two independent selected witness tables at every center | checked as existential complete-class survival at every center | gives negative incidence in every actual critical row; it does not create a terminal positive hit |

### `allRowsOneHit star hall`

| Field | Boolean/common-order status | Finite-metric status | Existing production use |
| --- | --- | --- | --- |
| `star` | encoded | encoded | as above |
| `hall` | encoded at the fixed blocker row of every physical source | encoded with complete critical classes | production derives mutual omission, pairwise distinct physical blockers, and three outside support points per row |

The common-order search adds every represented row equality, strict triangle
and Kalmanson inequality.  It does **not** add the retained q-deleted
`B1/B2` rows, and it does not add the complete source-valid first-apex cap
localization described below.  Its 2,729 card-13 and 1,017 card-14 rejections
are bounded samples, not orbit coverage.

### `spoke1TwoHit` and `spoke2TwoHit`

| `SourceTwoHitNormalForm` field group | Boolean/L1 asymmetric status | Kernel-checked boundary status | Existing production use |
| --- | --- | --- | --- |
| `third`, its two inequalities, `physicalVertices_eq` | encoded by the two asymmetric role orbits | exact in production | routine normalization |
| `third_mem_sourceSupport`, `sourceBlocker_eq_target`, exact physical-cap intersection | encoded | exact in production | forces the actual two-hit row to be centered at the other endpoint |
| `outside1`, `outside2`, `outside_ne`, `outsidePair_eq` | represented by the two remaining support labels | exact in production | names the existing co-radial terminal pair |
| carrier-wide aligned star cover | encoded | exact in production | retained through the orientation |
| first-apex co-radiality of the outside pair | negated in the asymmetric L1 tests | open | `SourceTwoHitNormalForm.false_of_firstApex_coRadial` consumes it immediately |

The asymmetric minimality scratch theorem proves that deleting either named
outside point can already fail at the known physical hub.  Hence neither
`R.minimal` nor a singleton/pair deletion-core rebase is the missing producer.

## Full `FirstApexShellRolePacket` field audit

Production source constructs this packet from `F` and `R`; the live exact-five
terminal can therefore re-extract it even though `outcome` does not store it.
The table checks every packet field against the two current computational
surfaces. “Metric yes” means that the stored finite metric admits a choice of
the existential packet data satisfying that field. It does not mean the
metric is Euclidean or arises from a `SurplusCapPacket`.

| Packet field | Tracked common-order gate | Finite-metric regression |
| --- | --- | --- |
| `retainedRadius_pos` | distance positivity only | yes |
| `retainedRow`, `retainedRow_radius` | projected by `m[firstApex]` plus the frontier equality; the chosen row need not preserve the source extractor's strict hits | yes; choose `{q,w,6,7}` inside the six-point first-apex class |
| `q_mem_retainedRow`, `w_mem_retainedRow` | encoded | yes |
| `retained_completion_card_eq_two` | follows from a four-row containing distinct `q,w` | yes |
| the two distinct `retainedInterior` row/cap witnesses | **omitted** | yes; `q,w` themselves are two strict first-opposite-cap points in the regression |
| `retainedRow_role_cover` | projected by the fixed abstract cap partition | yes |
| `q_role`, `w_role` | projected by off-surplus membership | yes; both are strict first-opposite-cap points |
| `one_frontier_source_strict` | **omitted as such** | yes |
| `doubleRadius_pos` | distance positivity only | yes |
| `doubleRow`, `doubleRow_radius` | encoded as `b1` | yes; the only possible support is `{2,6,7,8}` |
| `doubleRow_subset_doubleErase` | encoded by omitting `q,w` | yes |
| the two distinct `doubleInterior` row/cap witnesses | **omitted; indeed the current gate imposes no lower bound on `b1` in the cap opposite the first apex** | **no: the forced row `{2,6,7,8}` meets strict `C1={3,4,5,6}` only in `{6}`** |
| `doubleRow_role_cover` | projected by the fixed abstract cap partition | yes |
| `sameRadius_six` | the LRA sees row equalities, but B0 does not store the implication to a complete six-point class | yes; the ambient first-apex class has six points |
| `distinctRadius_disjoint` | projected by exact row equalities at one center in LRA; not a named B0 radius split | vacuous because the two rows use the same radius |
| `firstApex_double_survives` | encoded by `b1` | yes |
| `secondApex_double_survives` | encoded by `m[secondApex]` | yes |
| four singleton-survival fields at the two apices | projected from the two double-deletion rows | yes |

The reproducible audit is:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run python \
  scratch/atail-force/exact5-production-contract-gap/audit_finite_metric_role_packet.py
```

It confirms that the metric regression realizes every incidence/radius branch
of the packet needed for this comparison except the source-proved
double-deletion strict-cap pair. This is the first known production field
that genuinely cuts that regression.

The reason is geometric, not another arbitrary row axiom. The extractor uses
`doubleErase_selectedClass_capInterior_card_ge_two`, a consequence of the
actual convex/Moser-cap packet, to choose the two row points. The regression
has only abstract cap sets and deliberately does not satisfy this deleted-row
MEC/cap-localization conclusion.

## Smallest source-valid coupling absent from the common-order gate

The smallest raw direct omission is the retained packet
`R.common.packet.B1/B2` with its row equalities and overlap provenance.  It is
already present in the finite-metric regression, so it cannot close by pure
metric/incidence/minimality reasoning.  It is nevertheless the first field
that should be added to the common-order gate, because that gate is the only
current surface that combines the remaining rows with strict convex distance
order.

There is an even sharper **consumed-production** package derived from fields
already present in `F` and `R`:

```lean
nonempty_firstApexShellRolePacket F R :
  Nonempty (FirstApexShellRolePacket F R)
```

The current gate represents its retained first-apex row and double-deletion
row only as bare equal-distance supports.  It omits the following proved
parts of the packet:

- each row has two distinct points in the strict cap opposite
  `S.oppApex1`;
- the frontier points have the exact `oppCap2`/strict-`oppCap1` role domain,
  with at least one in the strict first opposite cap; and
- equal radii give at least six points in one complete first-apex class,
  while unequal radii make the two selected supports disjoint.

This is the smallest currently identified source-valid strengthening that
can be intersected with the exact Kalmanson gate without importing the whole
nonlinear MEC coordinate system.  **It is not proved sufficient.**  The
finite-metric regression does **not** realize the packet: its forced
first-apex double-deletion row has only one strict first-opposite-cap hit.
Thus the exact two-hit field is a genuine new cut, not a repackaging of the
regression. Whether that cut plus common planar convex order reaches a
terminal is untested.

Direct import-reachability checking from the current
`ATail/FrontierLiveClosure.lean` import root shows that
`nonempty_firstApexShellRolePacket`,
`false_of_shortCap_at_largeCapUniqueFiveApex`, and
`false_of_criticalFiberClosingCore` are not presently in that module's import
closure.  They are source-clean production declarations, not hidden new
obligations; an implementation of the theorem below must add their production
modules to the import list before wiring the proof.

## Highest-leverage next theorem

The next theorem should be a terminal producer, not another normal-form
adapter.  The narrow all-one target is:

```lean
theorem closingCore_or_shortCap_of_exactFive_allRowsOneHit
    (F : CriticalPairFrontier D S radius H)
    (R : FrontierCommonDeletionParentResidual F)
    (B : FrontierBiApexRobustResidual R)
    (Q : FrontierBiApexRobustExactFiveSecondCapResidual B)
    (profile : LargeCapUniqueFiveSecondApexRadius D S)
    (star : PhysicalGlobalCrossDeletionStar profile)
    (hall : AllPhysicalActualCriticalRowsOneHit H profile) :
    Nonempty (CriticalFiberClosingCore R) ∨
      ∃ (T : SurplusCapPacket D.A) (i : Fin 3),
        T.oppositeVertexByIndex i = S.oppApex2 ∧
          (T.capByIndex i).card = 4
```

**CONJECTURED.**  No proof or exhaustive source coverage is claimed.

This is preferable to an `IsM44`-only output.  Its second disjunct feeds the
already-proved

```lean
ATailLargeCapUniqueFiveShortCapTerminal
  .false_of_shortCap_at_largeCapUniqueFiveApex
```

directly and needs only one alternative exact-four cap at the unique-five
apex.  The first disjunct feeds
`false_of_criticalFiberClosingCore` directly.  A proof should begin by
extracting `FirstApexShellRolePacket F R` and the already-proved physical
member of `B2 \ B1`; it must then use their equal-distance rows in one common
convex boundary order.  If those data do not force either terminal, the next
escalation is actual MEC disk/boundary geometry from `S`, not another local
row or minimal-deletion lemma.

Before attempting this whole theorem, the focused falsification/terminal test
should add the following **minimal exact source-field delta** to the existing
common-order gate:

```text
there exist distinct u,v such that
  u,v are in b1,
  u,v are in S.capInteriorByIndex S.oppIndex1,
  and b1 omits q,w.
```

All other inputs for this first test remain exactly those already present in
the gate: `b1` is a four-point first-apex equal-distance row, `q,w` are the
retained frontier pair, and the common strict convex order fixes the physical
cap interval. Equivalently the added finite constraint is

```text
2 <= card(b1 ∩ strictFirstOppositeCap).
```

This field is **PROVEN SOURCE-VALID** through
`nonempty_firstApexShellRolePacket`; it is **NOT PROVED SUFFICIENT** for a
closing core or a short-cap packet. The focused run should ask whether every
all-one candidate satisfying this delta already realizes an existing
`CriticalFiberClosingCore` antecedent or the exact short-cap exchange. If it
remains SAT, preserve the model and add no broader conjectural field until
the model has been audited against the remaining role-packet clauses.

The isolated test has now been run on the card-13 `asymmetricSourceLeft`
outer and all three all-one outers with the corrected shell cross-family
geometry. Every case is **SAT, independently verifier-clean within that
finite necessary-condition shadow**:

| Orbit | `b1` strict first-opposite hits | Connectivity cuts |
| --- | --- | ---: |
| `asymmetricSourceLeft` | `{10,11}` | 0 |
| `allOneHitHubLeft` | `{10,12}` | 0 |
| `allOneHitHubMiddle` | `{9,10}` | 0 |
| `allOneHitHubRight` | `{10,12}` | 0 |

This does not refute the source field; the outer remains a relaxation. It
does prove that the two-hit delta alone is not an incidence-level terminal,
including on any all-one source-role orbit. The next focused test must use
the complete card-13 same-radius/distinct-radius normal form in the common
strict order, not merely the two-hit lower bound.

The exact next gate contract is the following two-arm split. Here `I` is the
four-point strict first-opposite-cap interior, `T0` is the gate's chosen
first-apex frontier row `m[firstApex]`, and `T1` is its double-deletion row
`b1`.

```text
same-radius arm:
  C = T1 ∪ {q,w}
  card(C) = 6
  I ⊆ C
  every point of C has one common first-apex distance
  no carrier point outside C has that distance

distinct-radius arm:
  T0 ∩ T1 = ∅
  card(T0 ∩ I) = card(T1 ∩ I) = 2
  (T0 ∩ I) ∪ (T1 ∩ I) = I
  T0 and T1 have distinct first-apex radii
  T0 and T1 are each complete ambient exact-four classes
```

The final line means more than four selected equalities: for each `Ti`, every
carrier point outside `Ti` must be constrained not to have `Ti`'s radius.
Those disequalities may be represented by Boolean LRA disjunctions or signed
subcases, but they must not be silently inferred from selected-row omission.
This is the smallest current source contract that both cuts the stale metric
regression and survives the isolated-two-hit SAT audit. Its sufficiency for a
terminal remains **CONJECTURED / UNTESTED**.

## Bank preflight

The required current and legacy registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- all three Markdown/JSON certificate censuses named in `AGENTS.md`; and
- focused `nthdegree docs search --lean` queries for exact-five one-hit
  closure, critical-fiber occurrence, alternative short caps, and shared-pair
  two-center contradictions.

The banks contain the existing local contradiction consumers, including
two-center shared-pair, Kalmanson/order, and source-unit kernels.  They do not
contain an occurrence theorem constructing `CriticalFiberClosingCore R`, a
short-cap packet at `S.oppApex2`, or the asymmetric first-apex co-radial pair
from this full live parent.  Re-proving another local consumer is therefore
not justified.

## Adversarial review of the card-13 first-apex normal form

The scratch file

```text
scratch/atail-force/exact5-first-apex-card13-normal-form/
  ExactFiveFirstApexCard13NormalForm.lean
```

was checked both semantically against the production definitions and by an
exact Lean invocation. All four declarations elaborate; their printed axiom
closures contain only `propext`, `Classical.choice`, and `Quot.sound`.

Verdict: **PROVEN SOURCE-VALID. No selected/complete-class overclaim was
found.** The exact scope is:

1. `cap_cards_eq_five_six_five` uses the closed-cap identity
   `|S|+|C1|+|C2|=|A|+3`, exact card 13, surplus card at least five,
   first-opposite card at least six, and second-opposite card exactly five.
   These force `(5,6,5)`; there is no hidden assumption that the three caps
   are disjoint.
2. In the same-radius arm, `P.sameRadius_six` gives a lower bound of six on
   the **complete ambient** first-apex class. The four-point strict-cap size
   and the production adjacent-cap one-hit bounds give an upper bound of six.
   Hence the ambient class has exactly six points and its intersection with
   the strict cap is all four strict points. This conclusion is about
   `SelectedClass D.A ...`, not either selected four-row.
3. In the distinct-radius arm, the theorem uses only
   `P.retainedRow.support` and `P.doubleRow.support`. Their intersections with
   the four-point strict interior are disjoint and each contains the two
   packet-selected interior witnesses, so each intersection has cardinality
   two and their union is the strict interior. It does **not** claim that the
   two complete ambient radius classes partition the cap, or that the two
   selected rows exhaust either complete class.

The later strengthening
`firstApex_distinctRadius_rows_are_exactClasses` is also **PROVEN
SOURCE-VALID**. Its stronger conclusion does not make the preceding selected-
row argument circular:

- complete classes at `radius` and `P.doubleRadius` are disjoint because a
  common point would identify the two distance values, contradicting
  `hdistinct`;
- each complete class has at least two strict-interior points because it
  contains the corresponding selected row and its packet witnesses;
- disjointness inside the four-point strict interior forces each complete
  class to have exactly two interior points;
- the adjacent-cap one-hit bound gives at most two further points outside the
  strict interior, hence each complete class has cardinality at most four;
  and
- each class contains its selected four-row, so both have cardinality at
  least four and the inclusions are equalities.

Thus, specifically on the distinct-radius card-13 arm, both selected rows are
indeed their complete ambient exact-four classes. The theorem still does not
claim that the union of those two complete classes is the carrier: only their
strict-interior portions partition that cap interior. The fifth declaration
also passes exact Lean checking with the same standard axiom closure.

The scope boundaries are load-bearing: the saturation and partition
conclusions require `D.A.card = 13`; they do not follow from card at least 13.
They are normal forms, not contradictions. In particular, neither theorem by
itself constructs a `CriticalFiberClosingCore` or an alternative short-cap
packet.
