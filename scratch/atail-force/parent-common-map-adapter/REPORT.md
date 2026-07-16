# Parent common-critical-map adapter

Date: 2026-07-14

Status: **KERNEL-CHECKED PARENT TRANSPORT AND BRANCH NORMAL FORM; ONE
GEOMETRIC LOCALIZATION FIELD STILL OPEN.**

This audit is scratch-only.  It does not edit production Lean, the closure
documents, `SurplusM44`, the user-owned unique-row lane, `(6,5,4)`, or either
census lane.

## Result

The actual outer parent has a strictly stronger and cleaner interface than
K-A-PAIR currently exposes.  Immediately after choosing its concrete
`Hcritical`, the parent can construct, with no new assumption:

1. the five named `CriticalSourceRows` from that exact `Hcritical`;
2. the additional `f2` row from the same exact system;
3. the exact CP-built `leafSurplusPacket`;
4. a positive first-apex K4 radius together with the retained lower bound
   `4 <= card (SelectedClass D.A S.oppApex1 r)`;
5. the production `CriticalPairFrontier D S r Hcritical`; and
6. a branch-complete normal form on its two actual source rows:

   ```text
   dist (centerAt q) q = dist (centerAt q) w
   or
   dist (centerAt w) w = dist (centerAt w) q
   or
   ReciprocalCrossSurvivalPacket.
   ```

The first two arms are the two directed cross-row extensions.  The third arm
records reciprocal cross-deletion survival and every consequence that is
already routine.

The new checked strengthening is that the robust packet is uniform in the
first-apex class cardinality.  It proves that the two actual blockers are:

- distinct from `S.oppApex1`;
- distinct from `S.oppApex2`; and
- distinct from one another.

The earlier scratch transport needed an exact card-five hypothesis to separate
the blockers from the first apex.  That hypothesis is unnecessary.  Cross
survival proves unequal distances from an actual blocker to the two frontier
sources, while the frontier pair is co-radial from `S.oppApex1`; identifying
the blocker with that apex is therefore impossible.

The robust packet also retains:

- both reciprocal support nonmemberships;
- support overlap at most two;
- both cross-radius inequalities; and
- for each erased carrier, the exact surviving selected support and uniqueness
  of its positive K4 radius at the actual blocker.

These facts are all proved.  They do not by themselves contradict the live
geometry.

## Exact gain over the weakened K-A signature

At `U1LargeCapRouteBTail.lean:9535--9545`, the parent chooses one
`Hcritical`, then builds both `Hdepth5Rows` and `Hf2CriticalRow` from it.  At
`9614--9621` those objects are passed separately into the liveData tree.

By contrast, K-A-PAIR at `2517--2562` receives:

- an abstract `rows` argument; and
- an independent `Nonempty (CriticalShellSystem D.A)`.

It does not state that `rows` came from the chosen system, does not retain the
same-system `f2` row, and does not retain a frontier indexed by that system.
`ParentCommonCriticalMapSurface` repairs exactly this transport loss.  Its
`rows_eq` and `f2Row_eq` fields are constructor equalities, and its frontier is
definitionally indexed by the same `Hcritical`.  No selector reconstruction,
override, or favorable-choice assumption is hidden in the bundle.

This gain is real but bookkeeping-only.  The frontier sources are adaptively
chosen off-surplus points and are not automatically one of
`q,t1,t2,t3,u`.  Common provenance does not add the cross-incidence or cap
localization needed to identify them with a named live row.

## Which equality or collision branches close before the robust arm?

The distinctions here matter:

| Branch | Current exact status |
|---|---|
| Prescribed `h4`/`h5` equality with the validated finite-label mapping | It enters the existing `DuplicateCenterCore` or `ExactOffCircleCore` consumer.  This is an immediate terminal once that exact mapping is produced. |
| `f2` source collision such as `t2_t20` | Same-system provenance collapses `f2Row` to the corresponding named row; it does **not** itself give `False`.  The current LIVE collision tree eventually calls K-A, so it is circular and is not used by this adapter. |
| One frontier directed cross equality | It is exactly one cross membership.  It does **not** close without an additional cap-local blocker placement, reciprocal incidence, or another accepted terminal field.  It must not be conflated with the banked `h4`/`h5` equality. |
| Neither frontier cross equality | Both selected rows survive the opposite deletion, yielding the checked `ReciprocalCrossSurvivalPacket`. |

Thus the only equalities already known to close immediately are the separately
validated prescribed `h4`/`h5` equalities **after** their finite-label/metric
mapping has been supplied.  The actual common parent does not supply that
mapping.  No LIVE-T1/T3/C theorem is used in the scratch proof.

## Single first missing field

For the already-checked U5 localization route, the first and only new content
field after this routine construction is the one-row confinement proposition

```text
exists K2 : SelectedFourClass D.A S.oppApex2,
  K2.support subset
    (Hcritical.selectedAt F.pair.q F.pair.q_mem_A).toCriticalFourShell.support union
    ((D.A.filter (fun x => dist x S.oppApex1 = r)) \ S.surplusCap).
```

This field is deliberately **not** included in
`ParentCommonCriticalMapSurface` or `ReciprocalCrossSurvivalPacket`.
`scratch/atail-force/u5-bounded-support-bridge/OneRowConfinementAdapter.lean`
already kernel-checks that it immediately gives `False`: the two-circle overlap
bound leaves two points of `K2` outside the retained blocker support,
confinement puts both in the off-surplus first-apex marginal, and
`oppCap2_escape_gen` closes.

The confinement producer remains **CONJECTURED / OPEN**.  Calling it the
single missing field is route-specific: it is the smallest checked sufficient
field for this U5 route, not a claim that every possible proof must establish
that exact inclusion.  A different full-geometry theorem may instead return
one of the already consumed card-four/card-five/common-blocker terminals.

## Recommended parent call site

The exact insertion point is immediately after

```lean
rcases hcritical with ⟨Hcritical⟩
```

at `U1LargeCapRouteBTail.lean:9535`, before `Hdepth5Rows`, `Hf2CriticalRow`,
and the LIVE slot split are weakened into separate arguments.  The future
parent proof can destruct
`exists_parentCommonCriticalMapSurface_leafSurplusPacket` there and pass its
single dependent surface to `false_of_twoLargeCaps_commonCriticalMap`.
The second-large-cap witness can be derived inside that future theorem by the
existing `exists_secondLargeCap_of_noM44`; it is not needed for routine
frontier extraction.

## Production recommendation

Promote the small mathematical lemma
`actualBlocker_ne_oppApex1_of_cross_deletion_survives` now (or under the
project's preferred `SurvivorPairRelocationPacket` namespace).  It removes the
unnecessary card-five hypothesis from first-apex blocker separation and is a
direct reusable strengthening of the current frontier API.

Promote `ReciprocalCrossSurvivalPacket` and
`crossEqualityOrReciprocalSurvival` only together with the first production
consumer that uses this exact branch contract.  Until then they are useful
scratch normal forms but would be an unconsumed wrapper layer.

Keep the large `ParentCommonCriticalMapSurface` scratch-only until
`false_of_twoLargeCaps_commonCriticalMap` exists.  At that point either move
the dependent surface beside its consumer or construct it locally at the
parent call site.  Promoting it now would preserve bookkeeping without closing
or shrinking the live obligation.

## Theorem-bank preflight

Before writing the adapter, the required general-n registries and JSON
inventories were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Indexed Lean searches were run for common critical-system provenance,
row-extension/deletion survival, parent frontier extraction, cap-local blocker
confinement, and selected-four-class construction.  The closest reusable
declarations were the production
`cross_deletion_survives_iff_not_mem_selected_support`,
`blocker_dist_ne_of_cross_deletion_survives`,
`selected_support_inter_card_le_two_of_not_mem_other_selected_support`,
`cross_survival_unique_radius_and_exact_support`, and
`exists_criticalPairFrontier_of_K4`.  No bank theorem supplies the displayed
one-row confinement or an equivalent full-geometry closing field.

## Validation

The isolated check from the Lake root was:

```text
lake env lean -M 16384 \
  ../scratch/atail-force/parent-common-map-adapter/ParentCommonMapAdapter.lean
```

It exits zero.  The four printed endpoints have axiom closure exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, named axiom, `native_decide`, or
solver trust step in the file.  No full Lake build was run for this scratch-only
audit.
