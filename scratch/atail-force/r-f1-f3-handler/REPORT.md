# F1/F3 source-faithful handler report

Status: kernel-checked scratch reduction.  Under the parent fact
`5 ≤ S.oppCap2.card`, both F1 and F3 now route to protected swapped
`FA-UNIQ4`, protected swapped `FA-UNIQ5`, or the exact residual
`6 ≤ S.oppCap2.card`.  No unconditional F1/F3 `False` is claimed.

Owned files:

- `scratch/atail-force/r-f1-f3-handler/F1F3Handler.lean`
- `scratch/atail-force/r-f1-f3-handler/F1F3OutcomeReduction.lean`
- this report.

The lane starts from the checked aligned constructors in
`OriginTaggedCoordinator.lean` and keeps the actual named row roles:

- F1 carrier: `C.B₂ ∩ deletedCriticalSupport C`, where
  `deletedCriticalSupport C` is the retained `CriticalShellSystem` row at the
  actual deleted source;
- F3 carrier: `C.B₂ ∩ {q,t1,t2,t3}`, the retained live dangerous row;
- common cap data: `SecondApexRowCapProfile S C`.

No anonymous support shadow is mined here.

## Mandatory preflight

Checked before theorem development:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md` and JSON;
- `certificates/erdos97_legacy_general_n_mining.md` and JSON;
- `certificates/erdos_general_theorem_p97_mining.md` and JSON;
- indexed Lean searches via `nthdegree docs search --lean` for aligned
  common-deletion, F1/F3, same-cap, live-row, actual-blocker, and strict-cap
  closures.

Result:

- no banked direct-`False` theorem has the complete F1/F3 parent roles;
- the prescribed-critical outcome already has the exact checked consumer
  `secondApexCritical_reorients_to_firstApexUniqueFour`;
- `RTwoOffLiveHandler.lean` already contains the exact successor
  radius classifier `OffLiveCommonDeletionSuccessor.ofPacket`;
- `CapFiveApexRigidity.lean` supplies the cap-five class bound, unique-radius
  theorem, and the cap-at-least-six consequence for two distinct K4 radii;
- the nearby mutual-bisector consumer is not applicable: it requires mutual
  cross-membership, whereas two prescribed critical sources at a common
  center give mutual omission.

Thus the useful existing sinks are the swapped `FA-UNIQ4` frontier, the
cap-five rigidity theorems, and
`false_of_sameCap_outsidePair_twoCenters`; no anonymous bank pattern is
needed.

## Exact field map

| Aligned input | Mathematical role | Current use |
| --- | --- | --- |
| `C.row₂` | exact row at `S.oppApex2` after deleting the actual source | second equal-radius center |
| `cap.strict_second_cap_card_ge_two` | at least two `C.B₂` points in strict `oppCap2` | strict-role trichotomy |
| `cap.global_K4_on_strict` | global K4 at each strict point | retained; no role-faithful immediate consumer found |
| F1 `inter_support_card = 2` | exactly two points shared with the deleted source's real critical row | F1 carrier |
| F3 `inter_live_card = 2` | exactly two points shared with the retained live row | F3 carrier |
| F1/F3 `outsideBoth_card = 1` | unique `C.B₂` point outside both the live row and deleted critical support | uniform fresh-source producer |
| `W.H.selectedAt deleted C.q_mem_A` | actual blocker row for F1 | first equal-radius center and blocker localization |
| `W.liveRow` | actual live row for F3 | first equal-radius center and live-center localization |
| origin tag | anchored / reciprocal / spent provenance | audited below; no field is discarded by the packet statements |

## Uniform checked producer

Both F1 and F3 now kernel-check to the same exact, origin-retaining output:

```text
unique outside-both point in C.B₂
  -> actual FreshCriticalSource in retained H
  -> source is off the live row
  -> deletion survives at p
  -> either
       a new CommonDeletionTwoCenterPacket at that exact source, or
       PrescribedCriticalAt source oppApex2
         with support exactly C.B₂
```

Lean declarations:

- `SingleOutsideSourceTransition`;
- `SingleOutsideSourceOutcome`;
- `SingleOutsideSourceProducer`;
- `f1SingleOutsideSourceProducer`;
- `f3SingleOutsideSourceProducer`;
- `originAware_f1SingleOutsideSourceTransition`;
- `originAware_f3SingleOutsideSourceTransition`.

The second-apex-critical arm is a prescribed shell suitable for the existing
late-override infrastructure.  It is not claimed to be the original
`W.H.centerAt` choice.  The fresh source itself and its actual blocker remain
those of the retained `CriticalShellSystem`.

This is the common immediate-consumer packet exposed by F1 and F3.  The
critical outcome is now fully consumed by the swapped `FA-UNIQ4` theorem.
The successor is classified and routed as described below.

## Exact outcome reduction

`F1F3OutcomeReduction.lean` proves:

```text
F1/F3 unique outside source
  -> prescribed critical at oppApex2
       -> fresh swapped FA-UNIQ4 frontier
     or successor common deletion
       -> same radius, ambient class card >= 5
          or
          alternate radius, selected supports disjoint,
          strict-row union card >= 4, oppCap2.card >= 6
```

Lean declarations:

- `reduceSingleOutsideSourceOutcome`;
- `successor_alternateRadius_oppCap2_card_ge_six`;
- `singleOutsideSuccessorGeometry`;
- `successor_sameRadiusOverflow_of_oppCap2_card_le_five`.

The successor source remains the exact `FreshCriticalSource` produced from
the F1/F3 outside-both cell.  Its successor packet is built at that source;
no representative is reselected.

## Cap-five endpoint

The cap-five successor is no longer an R-lane residual.

`successor_of_oppCap2_card_eq_five_reorients_to_FAUNIQ5` constructs a fresh
fixed-surplus swap frontier with:

- swapped first apex equal to the physical `S.oppApex2`;
- swapped first cap equal to `S.oppCap2`;
- exact ambient first-apex class cardinality five;
- uniqueness of the positive radius supporting at least four points;
- failure of the double deletion at the fresh frontier pair.

These fields are packaged as
`SwappedFirstApexUniqueFiveFrontier`, the exact analogue of the existing
`SwappedFirstApexUniqueFourFrontier`.  The double-deletion proof uses the
fact that deleting both frontier points from the unique five-point class
leaves only three points at the only possible K4 radius.

Consequently:

```text
5 <= oppCap2.card + successor
  -> swapped FA-UNIQ5
     or 6 <= oppCap2.card.
```

This is `successor_FAUNIQ5_or_oppCap2_card_ge_six`.

The complete source-retaining endpoints are:

- `singleOutsideSourceProducer_protectedOrLargeCapOutcome`;
- `f1SingleOutsideProtectedOrLargeCapOutcome`;
- `f3SingleOutsideProtectedOrLargeCapOutcome`.

They return exactly one of:

1. swapped `FA-UNIQ4`, retaining the prescribed critical shell and its
   support equality with `C.B₂`;
2. swapped `FA-UNIQ5`, retaining the exact successor;
3. `6 ≤ S.oppCap2.card`, retaining the exact successor and its radius
   geometry.

## Checked strict-role shape

For either named two-point carrier, the two or more strict `C.B₂` points
split into exactly one of:

1. two strict points in the named carrier;
2. two strict points in its `C.B₂` complement;
3. exactly one strict point in each.

The source-faithful heavy-arm consequences are:

- F1 shared-heavy forces the actual deleted-source blocker into strict
  `oppCap2`;
- F3 shared-heavy forces the retained live center `p` into strict `oppCap2`.

For the spent origin, aligned means `p = S.oppApex1`.  Since
`S.oppApex1 ∈ S.surplusCap`, the F3 shared-heavy arm is contradictory.

Lean declarations:

- `F1StrictRoleNormalForm`;
- `F3StrictRoleNormalForm`;
- `f1StrictRoleNormalForm`;
- `f3StrictRoleNormalForm`;
- `false_of_f3_liveShared_strict_of_p_eq_oppApex1`.

## First missing antecedents

The cap profile alone does not force the strict witnesses into the named
carrier.  The remaining exact residuals are therefore:

- F1 complement-heavy: two strict points in
  `C.B₂ \ deletedCriticalSupport C`;
- F1 mixed: one strict point shared with the deleted critical row and one
  outside it;
- F3 complement-heavy: two strict points in
  `C.B₂ \ {q,t1,t2,t3}`;
- F3 mixed: one strict live-row point and one strict non-live point.

The strict-role complement/mixed placements remain open if this local
trichotomy is attacked directly.  The stronger uniform producer now bypasses
them:

- its critical outcome is protected `FA-UNIQ4`;
- its cap-five successor is protected `FA-UNIQ5`;
- only the cap-at-least-six successor remains in the R lane.

Therefore the next local theorem, if needed, must consume the exact retained
successor under `6 ≤ S.oppCap2.card`, or the parent must exclude that cap
size from its global cardinality/cap split.  More F1/F3 support-cardinality
mining is not the missing ingredient.

### Origin audit

- Anchored: the fresh source is off the surplus cap and comes from the
  anchored transition, but no retained field currently places its actual
  blocker or the `C.B₂` complement.
- Reciprocal: the directed-cross signed-area fact concerns the earlier
  reciprocal deleted source's blocker, whereas the common-deletion source is
  `G.z`; no checked transport identifies those blockers.
- Spent: alignment fixes the live center to `oppApex1`, closing only the F3
  shared-heavy arm.  The complement-heavy and mixed arms remain realizable at
  the current interface.

No production, proof-blueprint, closure-doc, or protected-lane file was
modified, and no full `lake build` was run.

## Validation

Focused direct Lean validation:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f1-f3-handler-oleans/F1F3Handler.olean \
  ../scratch/atail-force/r-f1-f3-handler/F1F3Handler.lean
```

Result: exit 0.

Outcome-reduction validation:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f1-f3-handler-oleans:/private/tmp/p97-r-two-off-live-handler-oleans:/private/tmp/p97-r-f2-second-apex-radius-transport-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-three-row-metric-oleans:/private/tmp/p97-r-origin-tagged-coordinator-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-root-failure-parent-lift:/private/tmp/p97-r-failure-parent-lift-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-r-reciprocal-swap-reduction-oleans:/private/tmp/p97-r-collapse-lean427-current-pb2jam3_:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-joint-transition-oleans" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f1-f3-handler-oleans/F1F3OutcomeReduction.olean \
  ../scratch/atail-force/r-f1-f3-handler/F1F3OutcomeReduction.lean
```

Result: exit 0.

All printed declarations close with only:

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

No printed declaration reaches `sorryAx`.
