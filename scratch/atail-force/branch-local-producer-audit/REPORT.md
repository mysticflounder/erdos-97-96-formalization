# K-A / ATAIL branch-local producer audit

Date: 2026-07-15

Scope: identify the narrowest producer which is actually connected to the
current K-A / ATAIL parent data, after rejecting fixed-card-11/12 extraction
as a uniform route and without assuming that the mined 15-distance core has a
role map into the live rows.

No production Lean file was edited for this audit.  In particular,
`SurplusM44` and `SevenPointTwinFourCircleCollision.lean` were not touched.

## Verdict

There is **no single branch-local producer currently justified by the listed
parent/frontier/continuation fields**.  The current route genuinely splits
into three different missing geometric contents.  Packaging those contents
again as one universal producer would merely rename
`FrontierContinuationEliminators`; it would not make the proof more
tractable.

The smallest named existing-consumer trigger found on the audited routed
surface is, for a cross-survival apex-alignment subarm,

```lean
Nonempty (DeletedApexOmissionPacket O)
```

from
`scratch/atail-force/apex-alignment-consumer/ApexAlignmentConsumer.lean:339`.
It is consumed directly by:

- `false_of_deletedApexCriticalCertificate_and_omission` at line 364;
- `false_of_apexDouble_and_deletedApexOmission` at line 375; and
- `false_of_deletedBlockerAlignment_and_deletedApexOmission` at line 385.

The narrowest coherent *live-parent-shaped* way to produce this packet is not
a new cardinality assertion.  It is a two-field role alignment for one of the
five already retained U1 critical rows:

```lean
∃ source : U1Depth5.CriticalSource,
  let R := rows.rowAt source
  R.center = S.oppApex2 ∧
    O.survivor.deleted ∉
      R.selected.toCriticalFourShell.support
```

This feeds the already proved adapter
`nonempty_deletedApexOmissionPacket_of_criticalRowAlignment` at
`scratch/atail-force/apex-alignment-consumer/DeletedApexOmissionProducer.lean:70`.
It exposes exactly the two facts absent from the live interface: a blocker
center must be identified with the second apex, and its exact selected support
must omit the oriented continuation endpoint.

Epistemic status of this proposed role-alignment theorem: **OPEN / presently
unsupported**.  It is a precise mining target, not a theorem inferred by this
audit.  Moreover, it closes only the two apex-alignment alternatives inside
the cross-survival branch.  It does not close the common-deletion alternatives,
the non-equilateral branch, or the equilateral branch.

## Live source chain and what it actually retains

The current data flow is the following.

| Declaration | Location | Exact useful output | Information it does not retain |
|---|---|---|---|
| `exists_secondLargeCap_of_noM44` | `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2274` | `∃ j, j ≠ i ∧ 5 ≤ (CP.capAt j).card` | No point, row, radius, critical source, or continuation-role map involving `j` |
| `leafSurplusPacket` | same file, line 2328 | A `SurplusCapPacket D.A` whose partition is `CP` and surplus index is `i` | No selected K4 row or coupling to the second-large-cap witness |
| `CriticalPairFrontier` | `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:568` | `pair`, `firstApexSplit`, `secondApexDouble`, `secondApexSplit` | `secondApexDouble` is only K4 after erasing `pair.q,pair.w`; it gives no class of size five and no continuation-endpoint omission |
| `exists_criticalPairFrontier` | same file, line 1223 | Chooses two off-surplus first-apex points `q,w` so their double deletion preserves K4 at `oppApex2` | The choice is made from a first-apex marginal, independently of `CP.capAt j` |
| `exists_criticalPairFrontier_of_K4` | same file, line 1281 | `∃ r>0`, a first-apex selected class of cardinality at least four, and a nonempty frontier | Still no relation to the chosen second large cap |
| `FrontierSecondApexRow` | `scratch/atail-force/frontier-continuation-dispatcher/FrontierContinuationDispatcher.lean:49` | An exact selected four-row at `oppApex2` omitting `F.pair.q` and `F.pair.w` | It need not omit either later continuation endpoint |
| `nonempty_frontierSecondApexRow` | same file, line 59 | Trims the twice-erased K4 witness to the row above | Cardinality is exactly trimmed to four; no fifth point is produced |
| `TwoContinuationRows` | `scratch/atail-force/continuation-geometry-classifier/ContinuationGeometryClassifier.lean:354` | Two distinct strict-`oppCap2` members `z1,z2` of the parent apex row, plus arbitrary global-K4 rows centered at them | No prescribed relation between those rows, `CP.capAt j`, the five live U1 critical rows, or the frontier pair |
| `nonempty_twoContinuationRows` | same file, line 379 | Chooses the two centers by counting and obtains their rows from global K4 | The global-K4 choices are not optimized for a later bank pattern |
| `MetricResidual` / `EquilateralResidual` | same file, lines 631 and 649 | The exact mutual-hit/radius/parent-apex incidence left after easy deletion arms | No third-row or live-source role map |
| `CrossSurvivalOutput` | `scratch/atail-force/frontier-continuation-dispatcher/FrontierContinuationDispatcher.lean:134` | One continuation row survives deletion of the other center, packaged as a q-deleted exact row | This is explicitly not a contradiction packet |
| `RoutedContinuationBranch` | same file, line 159 | `CrossSurvivalOutput ∨ NonEquilateralOutput ∨ EquilateralResidual` | The three arms require different missing content |
| `FrontierContinuationEliminators` | same file, line 284 | Three universal callbacks which would close a frontier | It is an open consumer contract, not a producer theorem |

The choice independence is formalized in
`scratch/atail-force/chosen-tuple-selector/ChosenTupleSelector.lean:61` by
`chosenParentContent_iff_independent_cap_and_continuation`: the chosen second
large-cap witness and the chosen closing continuation factor as independent
data in the current type.  Therefore `hj5` cannot silently be used as if it
constrained `F`, `K`, `z1`, `z2`, `row1`, or `row2`.  Any proof using that cap
must add and prove an explicit role map.

The live target itself remains the direct `sorry` at
`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2517`,
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`.
Its conclusion is already incompatible with the proved escape theorem, so a
"producer" of its conclusion is logically a proof of the leaf contradiction,
not a neutral positive construction.

## Required theorem-bank preflight

The following registries were checked before proposing the role-alignment
target:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and its JSON companion;
- `certificates/erdos97_legacy_general_n_mining.md` and its JSON companion;
- `certificates/erdos_general_theorem_p97_mining.md` and its JSON companion.

All three exhaustive JSON inventories were searched over declaration names,
normalized statements, and source paths for apex, radius, deletion,
continuation, common-deletion, and prescribed-pair shapes.

The closest sibling theorem is
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.u1TwoLargeCapObstruction`,
listed at `certificates/p97_rvol_general_n_mining.md:97`.  It consumes one
inequality and seven named distance equalities.  It does not produce the
missing role assignment or any of those equalities from the live frontier.
The registry itself records that a completeness/producer theorem remains
necessary.  The 18 source-unit contradiction consumers are likewise sinks:
they require a row-slot placement/equality producer.

The sibling C5D3B families are not a match.  Their usable statements consume
foreign `IsM44`, dangerous-skeleton, payload, or audit-support interfaces;
the live branch is the no-`IsM44` frontier.  The U2 apex-radius/escape
families similarly require `D.IsM44` or already-known endpoint equalities.
Neither legacy inventory contains a theorem with the needed second-apex
center-role plus continuation-endpoint omission.

Four focused indexed-corpus searches were rerun:

```text
critical pair frontier cross deletion survival second apex radius selected class
non-equilateral continuation strict opposite cap common hit two selected rows
equilateral continuation low hit reverse mixed critical shell
common deletion two center prescribed pair successor critical sources
```

The index timestamp reported by `nthdegree docs search --lean` was
2026-07-15 19:12 UTC.  The closest hits were the already used
`exists_criticalPairFrontier_of_K4`, adjacent-one-hit U2 lemmas,
`pEqC_row_impossible_of_equilateral`, and generic prescribed-deletion
criticality.  No hit supplies the role alignment above, a universal strict
common hit, a joint equilateral elimination, or common-deletion termination.

Preflight result: **NEGATIVE, exact for the indexed registries and queries**.
This is not a mathematical nonexistence theorem about all possible future
lemmas; it means no currently indexed/banked declaration discharges the live
producer.

## Branch audit

### 1. Cross survival

`crossSurvival_commonDeletion_or_apexCriticalAlignment` at
`scratch/atail-force/global-source-selection/GlobalSourceSelection.lean:1045`
is the sharpest checked normal form.  Every `CrossSurvivalOutput` yields a
`CrossSurvivalApexPacket O` and then one of:

1. a `CommonDeletionTwoCenterPacket` tied to a global escape source;
2. an `ApexDoubleCriticalResidual O`;
3. another `CommonDeletionTwoCenterPacket` tied to the relocated deleted
   blocker; or
4. a `DeletedBlockerApexAlignment O`.

The two alignment residuals both reduce to the choice-free
`DeletedApexCriticalCertificate O`:

- structure at `ApexAlignmentConsumer.lean:62`;
- `deletedApexCriticalCertificate_of_apexDouble` at line 94; and
- `deletedApexCriticalCertificate_of_blockerAlignment` at line 107.

The certificate says that deletion of `O.survivor.deleted` blocks K4 at
`S.oppApex2`.  Therefore an apex row omitting precisely that endpoint is the
smallest terminal packet.  The consumer is immediate and already proved.

The exact retained-row polarity explains why this packet is absent:

- `O.apexRow` has the correct center but contains the deleted endpoint;
- `O.survivor.exactRow` omits the deleted endpoint but is centered at the
  other continuation point, not at `S.oppApex2`;
- the frontier row omits `F.pair.q,w`, not the later oriented continuation
  endpoint; and
- the five live U1 critical rows expose neither blocker-center equality with
  `S.oppApex2` nor support omission of that endpoint.

The sharp alternative normalization is `DistinctApexRadiusClass O` at
`DeletedApexOmissionProducer.lean:116`.  Under a critical certificate,
`deletedApexOmission_iff_distinctApexRadiusClass` at line 382 proves that a
deleted-apex omission exists iff a second K4-capable radius exists at the
second apex.  This does not make a second-radius producer available:

- `parentApexRadiusClass_card_eq_four_of_certificate` at line 294 shows the
  parent radius class is exactly four under the residual;
- `secondApexDouble` supplies only cardinality at least four, not five;
- `oppositeVertex_distinct_K4_radii_force_cap_card_ge_six` at
  `scratch/atail-force/full-geometry-producer/CapFiveApexRigidity.lean:319`
  rules out a second radius at a cap of cardinality at most five; and
- the general parent has no upper-cardinality bound.  At cardinality fourteen
  and above, the small-cap shortcut need not exist, as recorded by
  `both_opposite_apices_distinct_K4_radii_force_card_ge_fourteen` at line 436.

Thus `DistinctApexRadiusClass` is equivalent to the terminal packet on this
subbranch, not a quantity hidden in the current frontier.

The common-deletion alternatives remain genuinely separate.
`alignedPrescribedPair_or_successorCycle` at
`scratch/atail-force/common-deletion-consumer/CommonDeletionSuccessorCycle.lean:212`
gives either an aligned prescribed pair or a period-at-least-two successor
cycle.  A repeated abstract successor source does not identify row supports
or radii.  The finite regression in that lane realizes a genuine cycle inside
its stated equality abstraction.  Consequently no geometry-free finite
termination theorem can close these alternatives.

Conclusion for cross survival: the role-alignment theorem above is the
narrowest coherent missing producer for the two apex-alignment subarms, but
there is **no one-packet producer covering the whole cross-survival arm**.

### 2. Non-equilateral continuation

The smallest existing sink is
`false_of_nonEquilateral_of_strictOppCap1CommonHit` at
`scratch/atail-force/non-equilateral-continuation/NonEquilateralContinuation.lean:292`.
It consumes
`StrictOppCap1CommonHit P` from line 279.

However the proposed universal producer

```text
NonEquilateralOutput H P -> StrictOppCap1CommonHit P
```

has already failed the choice-order/interface audit.  The strongest checked
conclusion is a support dichotomy: one native continuation row is
surplus-heavy, or the rows have distinct mutually exclusive strict-`oppCap1`
witnesses.  The stored exact rational configuration has disjoint local rows;
it is not a full `CounterexampleData`, but it is a valid guard against a proof
which uses only the local row/cap interface.

Mapping this arm into `u1TwoLargeCapObstruction` still requires a common native
point and multiple reverse-row equalities.  Those are separate incidence
packages, not a one-field consequence of `MetricResidual`.

Conclusion for the non-equilateral arm: no smaller forced producer is
currently known.  A universal strict-common-hit theorem is **REJECTED at the
local interface**; any renewed theorem must visibly consume additional
full-parent geometry and the selected-choice order.

### 3. Equilateral continuation

The exact consumer surface is `JointTransitionCoreEliminator` at
`scratch/atail-force/joint-transition-core/JointTransitionCore.lean:288`,
used by
`false_of_equilateralResidual_of_jointTransitionCoreEliminator` at line 301.
It is a function eliminating every constructed `JointTransitionPacket`, not
a small omitted incidence field.

The checked exact-profile reductions leave low-hit and reverse-mixed cases.
The indexed theorem `pEqC_row_impossible_of_equilateral` is for a different
named endpoint packet and does not accept the current joint transition.
Likewise, obtaining one forbidden tail equality would close an individual
profile, but no current row or critical-system field produces that equality.

Conclusion for the equilateral arm: no smaller coherent producer was found.
Calling the whole `JointTransitionCoreEliminator` a producer simply restates
the open branch.

## Exact proposed theorem boundary

If this subbranch is pursued, the smallest honest declaration should expose
the role coupling rather than assert a mysterious new row.  Schematically:

```lean
def HasLiveCriticalRowApexOmissionAlignment
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (S : SurplusCapPacket D.A)
    (O : CrossSurvivalApexPacket D S H) : Prop :=
  ∃ source : U1Depth5.CriticalSource,
    let R := rows.rowAt source
    R.center = S.oppApex2 ∧
      O.survivor.deleted ∉
        R.selected.toCriticalFourShell.support
```

The corresponding producer theorem would need the **full parent** hypotheses
and one of the two apex-alignment residuals, not merely `F`, `K`, and `P`:

```lean
theorem hasLiveCriticalRowApexOmissionAlignment_of_apexResidual
    (/* full MEC, CP, no-M44, no-removable, live-row hypotheses */)
    (O : CrossSurvivalApexPacket D S H)
    (hresidual :
      Nonempty (ApexDoubleCriticalResidual O) ∨
      Nonempty (DeletedBlockerApexAlignment O)) :
    HasLiveCriticalRowApexOmissionAlignment rows S O
```

Once proved, the existing adapter and consumers make the proof mechanical.
But because either residual gives a `DeletedApexCriticalCertificate`, this
theorem is already equivalent to eliminating that residual.  It must not be
advertised as routine row selection.

Status: **CONJECTURED / OPEN**.  No bank hit, current field projection, or
validated regression supports it yet.  The incidence countermodel recorded in
`apex-alignment-consumer/DeletedApexOmissionIncidenceCountermodel.lean`
simultaneously realizes the local retained roles while assigning none of five
abstract blocker centers to the apex.  That model is exact only in its finite
incidence abstraction and is not a Euclidean counterexample; it establishes
that any proof must visibly use geometry absent from the present local packet.

## Epistemic ledger

- **PROVEN (existing Lean declarations):** the source chain, routed branch,
  cross-survival normal form, certificate conversions, omission consumers,
  role-alignment adapter, distinct-radius equivalence, parent-radius
  cardinality four under the certificate, cap-five rigidity, and the
  common-deletion successor dichotomy.
- **EXACT WITHIN STATED FINITE ABSTRACTIONS:** the incidence countermodel
  guarding the deleted-apex role interface and the common-deletion successor
  cycle regression.  Neither is a full Euclidean `CounterexampleData` model.
- **REJECTED AS AN INTERFACE-ONLY THEOREM:** arbitrary non-equilateral rows
  force a strict-`oppCap1` common hit; current frontier K4 forces a fifth
  second-apex point; cap cardinality alone aliases a live critical blocker to
  `oppApex2`; and abstract common-deletion iteration must terminate at an
  aligned pair.
- **OPEN:** the live critical-row/apex/omission role alignment, elimination of
  the common-deletion alternatives with full geometry, the remaining
  non-equilateral support arms, and the equilateral joint transition.
- **NOT ESTABLISHED:** a role map from the 15-distance bank core into the live
  `F/K/P/rows` data.  Until such a map is proved, the core is a theorem-discovery
  lead rather than a producer.

This audit did not run a new Lean build: it is a source/interface audit of
already checked artifacts.  No new theorem is claimed proved here.

## Recommended next move

Do not add another universal `CommonCriticalMapClosingProducer`-shaped wrapper.
Select the realized continuation branch first.  If the selected branch is an
apex alignment, mine or prove exactly the two-field live-row role alignment
above.  If it is a common-deletion branch, preserve the concrete source and
cap provenance and attack that branch separately.  Non-equilateral and
equilateral outputs should retain their existing, different residual
interfaces.

This keeps the next theorem honest: it either supplies a previously absent
role map and immediately activates a checked consumer, or it fails against a
named regression without disturbing the other branches.
