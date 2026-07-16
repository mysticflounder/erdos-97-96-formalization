# Parent transport extraction audit

Date: 2026-07-14

Status: **CHECKED TRANSPORT; CONTENT-BEARING GEOMETRY STILL OPEN.**

This audit owns only `scratch/atail-force/parent-transport-extraction/`.
It does not edit the production U1 tail, `SurplusM44Packet`, the existing
unique-row scratch lane, closure documents, or git.

## Verdict

The parent common-system construction can retain all selector provenance, but
it cannot *produce* the choice-invariant unique-row witness by bookkeeping.
The exact split is:

1. **Transport is solved.** If the critical-pair frontier is extracted while
   the parent's concrete `Hcritical` is still in scope, the resulting
   `CriticalPairFrontier D S r Hcritical` keeps the actual selected rows and
   blockers definitionally tied to that system.
2. **Choice-invariant conversion is solved.** On the card-five arm, a single
   directed cross hit whose actual blocker lies in the surplus cap immediately
   yields the choice-invariant critical-blocker witness. Card five itself
   proves the blocker differs from the first apex.
3. **Production is not solved.** Neither the parent constructor nor any
   current bank theorem supplies the directed cross hit or the blocker
   localization. Pointwise override proves that an arbitrary retained system
   can select any certified blocker, so provenance cannot force a favorable
   row.
4. **The robust packet is easier to retain, but harder to close.** It requires
   no linkage to the five named live rows. On the two-direction robust/card-five
   arm the same system already yields two distinct actual blockers, both
   separated from both opposite apices. No current consumer contradicts this
   four-center packet. Card 11 reaches the robust arm, so this is the first
   content-bearing theorem to attack even though unique-row transport is
   cleaner.

## Exact live-boundary map

The open theorem
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
in `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2517` receives:

- the MEC/nonobtuse packet (`MT`, `hCirc`) and cap triple (`CP`, `i`, `j`,
  `hM`);
- the large-cap facts (`hqCap`, `hsurplus`, `hjne`, `hj5`) and
  `hqNonMoser`;
- `hNoM44`, `9 < D.A.card`, global `D.K4`, and `D.convex` through `D`;
- five abstract critical rows;
- an **independent** `Nonempty (CriticalShellSystem D.A)`;
- the localized no-q-free packet, fixed dangerous triple, base-six
  distinctness, and live selected candidate; and
- a `p`-centered `t2` row with support `{q,t1,t2,t3}`.

It does **not** receive `hnoRem`, the concrete system which built `rows`, the
fact that `rows = CriticalSourceRows.ofCriticalShellSystem Hcritical ...`, or
the common-system `f2CriticalRow`.

The stronger outer caller
`u1_largeCap_routeB_tail_false` at `U1LargeCapRouteBTail.lean:9451` still has
all of these. At lines 9535--9544 it chooses one `Hcritical`, then defines both

```text
Hdepth5Rows := CriticalSourceRows.ofCriticalShellSystem Hcritical ...
Hf2CriticalRow := CriticalRowPacket.ofCriticalShellSystem Hcritical ...
```

The call to `u1_largeCap_routeB_tail_liveData_false` at lines 9616--9622 passes
the system, five rows, and sixth row as separate arguments. The leaf signature
at line 8011 retains only two partial comparison maps. The later
`false_of_center_p_t2_t20` branch therefore knows the dangerous support, but
the weakened K-A chain no longer states the constructor identity.

This loss is avoidable: call frontier extraction before the live slot split or
thread an explicit dependent packet. It is not the mathematical obstruction.

## Checked scratch results

`ParentTransportExtraction.lean` contains six no-`sorry` theorems.

### Parent provenance and selector dependence

`parent_t2_row_provenance` proves definitionally that the parent's rebuilt
`t2` row is `Hcritical.selectedAt t2` at `Hcritical.centerAt t2`.

`parent_common_system_can_select_certified_t2_blocker` proves the converse
warning: given any certified critical shell for `t2`,
`CriticalShellSystem.overrideAt` followed by the same parent row constructor
builds a common system whose live `t2` row uses exactly that center and support.
Thus no theorem using only the constructor relationship can show that an
arbitrary chosen row is non-apex, cap-local, or cross-incident.

### Frontier retained before provenance loss

`parent_system_retains_criticalPairFrontier` specializes the production
extractor to the exact `Hcritical` in scope:

```text
exists r > 0, Nonempty (CriticalPairFrontier D S r Hcritical).
```

There is no need to reconstruct or identify a selector after the pair is
chosen if the parent is refactored at this point.

### Choice-invariant unique-row extraction

The two orientation lemmas

```text
choiceInvariantBlocker_of_cardFive_left_capLocalCross
choiceInvariantBlocker_of_cardFive_right_capLocalCross
```

show that, for the retained frontier pair in the exact card-five branch, the
following is sufficient:

```text
(w in selectedAt(q).support and centerAt(q) in S.surplusCap)
or
(q in selectedAt(w).support and centerAt(w) in S.surplusCap).
```

Each direction produces a selector-independent existential consisting of the
source, center, exact critical shell, deletion-blocker certificate, surplus-cap
localization, non-apex separation, and both pair memberships. This is exactly
the content named `CardFiveDistinctCapLocalCrossHypothesis` in the existing
unique-row scratch lane. The new proof confirms that the favorable row can be
converted before provenance loss; it does not derive that row.

### Robust four-center extraction

`RobustFourCenterPacket` retains, for the same pair and same system:

- K4 after deleting `w` at `centerAt(q)`;
- K4 after deleting `q` at `centerAt(w)`;
- both blockers distinct from `S.oppApex1` (card-five deletion survival);
- both blockers distinct from `S.oppApex2` (the production relocation packet);
  and
- the two blockers distinct from one another (otherwise one cross-survival
  contradicts deletion criticality at the other source).

`robustFourCenterPacket_of_cardFive` constructs this packet without referring
to the five named rows. This is the cleanest parent-level transport target.

## Existing-consumer map

The retained unique-row outputs already have checked consumers:

- card four: `false_of_existsSurplusPairCriticalBlocker` in
  `scratch/atail-force/card_four_parent_boundary.lean`, by ordered-cap
  outside-pair center uniqueness;
- card five, distinct blockers:
  `false_of_frontier_cardFive_distinct_capLocalCross` in
  `scratch/atail-force/unique-row-producer/card_five_distinct_cap_local_producer.lean`;
- card five, common blocker:
  `false_of_residual_member_class_contains_common_pair` in
  `scratch/atail-force/coincident_blocker_four_shell_classifier.lean` once a
  residual member's global selected class contains the common pair; and
- any cross hit plus a positive same-side placement:
  production
  `SurvivorPairRelocationPacket.false_of_w_mem_selectedAt_q_of_sameSide`.

The robust packet matches none of them. In fact robust survival has the
opposite polarity to a directed cross hit by
`cross_deletion_survives_iff_not_mem_selected_support`. Also
`SurvivorPairRelocationPacket.oppApex2_dist_ne` rules out using this same pair
as the requested two-apex co-radial pair.

## Exact missing geometric lemmas

### Unique-row branch

The smallest existing-consumer-facing statement is exactly:

```text
CardFiveDistinctCapLocalCrossHypothesis P
```

for the card-five/distinct-blocker frontier pair `P`. It must be proved from
MEC/cap order, the full exact filters, global K4, and the retained source-indexed
critical map. Common provenance alone cannot prove either conjunct.

For card four, the correct statement remains the selector-independent
`ExistsSurplusPairCriticalBlocker S S.oppApex1 P.q P.w`; no assertion about
every arbitrary `H.centerAt` is sound.

### Robust branch

The honest next theorem is a direct four-center/global coupling, not another
transport wrapper. Its minimal direct form is provisionally:

```text
false_of_cardFive_robustFourCenterPacket
  (hNoM44 : not (exists S' : SurplusCapPacket D.A, S'.IsM44))
  (hr : 0 < r)
  (hcard : card (SelectedClass D.A S.oppApex1 r) = 5)
  (R : RobustFourCenterPacket P) : False
```

This is **CONJECTURED**, not established by this audit. A constructive variant
may instead return a new/mirrored frontier pair satisfying one of the three
accepted unique-row outputs, but a bare apex flip is insufficient. The proof
must use genuinely global four-center incidence or MEC/cap/full-filter
geometry; the existing three-center localization countermodel rules out a
pure blocker-location argument.

Because card 11 is forced into robust second-apex double-deletion survival, a
unique-row-only theorem cannot close the live spine. The robust coupling is
therefore the priority content lemma. Once it is proved, the checked
choice-invariant adapters give the clean wiring for the remaining unique-row
arms.

## Validation

No Lake build was run. The isolated direct Lean check was:

```text
cd lean
lake env lean -M 16384 \
  ../scratch/atail-force/parent-transport-extraction/ParentTransportExtraction.lean
```

It exited `0`. Every printed endpoint depends on exactly:

```text
propext, Classical.choice, Quot.sound
```

There is no `sorryAx`, custom axiom, `sorry`, `admit`, or `native_decide` in
the scratch file.

## Theorem-bank preflight

The mandated general-n registries and JSON inventories were checked, followed
by indexed searches for common-system unique rows, blocker-row provenance,
choice-invariant critical blockers, cap-local cross incidence, and robust
four-center packets. The closest hits were the current
`blocker_row_support_eq_shell`, `source_mem_blocker_row`,
`actual_blocker_ne_of_deletion_survives`, and the already-known conditional
consumer surfaces. None produces the cap-local directed cross hit or a robust
four-center contradiction from the live hypotheses.
