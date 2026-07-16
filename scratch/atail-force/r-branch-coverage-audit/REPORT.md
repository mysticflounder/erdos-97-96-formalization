# R branch-coverage audit

Date: 2026-07-16

Status: **SOURCE-GROUNDED COVERAGE AUDIT. NO PRODUCTION OR PROOF-BLUEPRINT
STATE CHANGED.**

## Verdict

The current support-heavy work is mathematically load-bearing, but it is not
an exhaustive R-lane closure route.

Its deepest current sink applies on the path

```text
resolved coherent R
  -> anchored origin
  -> first center = live center p
  -> common-deletion two-off-live failure
  -> F2 exact cover
  -> support-heavy strict-cell branch
  -> both generated rows q-critical
  -> MetricResidual.
```

That final metric residual is kernel-eliminated. The surviving cross-deletion
arm is not.

Several earlier siblings are still open:

- coherent first center different from `p`;
- the aligned two-off-live positive branch;
- F1;
- F2 live-heavy;
- F2 mixed;
- F3a and F3b;
- reciprocal common deletion after the current coordinator has forgotten the
  reciprocal witness;
- spent common deletion, whose exact apex-to-apex origin has been forgotten;
  and
- multiple nested support-heavy generated-row continuations.

Therefore another theorem only about anchored support-heavy data cannot close
`ResolvedCurrentFirstApexFixedRadiusNormalForm`.

The next branch-complete interface must retain the exact
anchored/reciprocal/spent origin of each common-deletion packet and split
live-center alignment before invoking the F1/F2/F3 classifier.

## Evidence standard

Every implication below is read in the direction of the current Lean
declaration. A theorem that constructs a packet is recorded as a reduction,
not as an eliminator. A theorem is marked as a kernel-checked eliminator only
when its conclusion is `False` on the stated branch.

The existing scratch files record direct Lean 4.27 checks and core-only axiom
closures for the named declarations. This audit did not rerun the full scratch
DAG or a project build.

## 1. Exact resolved coordinator

`ResolvedCurrentFirstApexFixedRadiusNormalForm F` has three top-level arms:

1. the protected first-apex unique-card-four/card-five arm;
2. `ResolvedCoherentFixedSingleRadiusContinuation F`; or
3. an existential `CommonDeletionTwoCenterPacket` from the spent-at-entry
   branch.

The coherent arm has exactly three outputs:

1. an `AnchoredSourceCriticalTransition`;
2. a reciprocal-origin common-deletion packet; or
3. a `SwappedFirstApexUniqueFourFrontier`.

The relevant declarations are:

```text
ResolvedCoherentFixedSingleRadiusContinuation
ResolvedCurrentFirstApexFixedRadiusNormalForm
resolveCoherentFixedSingleRadiusContinuation
resolveCurrentFirstApexFixedRadiusNormalForm
```

in `r-reciprocal-swap-integration/ReciprocalSwapIntegration.lean`.

The swapped reciprocal critical arm is a checked reduction to the separately
owned `FA-UNIQ4` dependency:

```text
reciprocalDirectedCross_commonDeletion_or_swappedFirstApexUniqueFour
```

It is not an R-lane `False` theorem.

## 2. Origin coverage before the failure classifier

| Origin | Exact source-current output | What is eliminated | What remains |
| --- | --- | --- | --- |
| Anchored | `A : AnchoredSourceCriticalTransition R` | `false_of_fixedMarginalTwoRowCoverResidual` eliminates the rigid two-row-cover alternative | `exists_offSurplus_sharedRowSource A` produces `X : RowExternalCommonDeletionSource A`; this is a common-deletion continuation, not `False` |
| Reciprocal | `X : ReciprocalDirectedCrossResidual R` | the prescribed second-apex-critical alternative is routed to swapped `FA-UNIQ4` | the other alternative is `CommonDeletionTwoCenterPacket D H z R.firstCenter S.oppApex2` |
| Spent | `E : FrontierRadiusSpentAtEntry F` | the terminal/cycle return residuals are absorbed into common deletion | `FrontierRadiusSpentAtEntry.exists_commonDeletion` gives the exact packet `CommonDeletionTwoCenterPacket D H F.pair.q S.oppApex1 S.oppApex2` |

### Information retained by the current resolved type

The three origins are not retained equally.

- The anchored arm keeps `R` and `A`. Its row-external source `X` can be
  reconstructed by `exists_offSurplus_sharedRowSource`.
- The reciprocal common-deletion arm keeps `R`, `z`, and the packet, but drops
  the proof `X : ReciprocalDirectedCrossResidual R` and the exact global
  continuation witness that produced `z`.
- The spent arm keeps only existential `deleted`, `center₁`, and the generic
  packet. It drops `F`, `E`, the identity `deleted = F.pair.q`, and the exact
  first center `S.oppApex1`.

Consequently the current resolved type is origin-positioned but not fully
origin-provenance-preserving. The generic collapse loses still more and is
correctly documented as an audit surface only.

## 3. The live-center alignment gate

The F1/F2/F3 classifier is available only for a packet

```text
C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2.
```

Its first-row identity comes from:

```text
commonDeletion_firstRow_eq_liveBase C :
  C.B₁ = {q,t1,t2,t3}.
```

For a coherent packet the exact alignment criterion is:

```text
W.coherent_source_center_eq_p_iff_mem_dangerousTriple R :
  R.firstCenter = p <->
  R.sourcePair.x ∈ {t1,t2,t3}.
```

The full parent does not force either side.

On the complementary branch:

```text
R.firstCenter != p
```

the only current live-row relation is:

```text
W.coherent_sourceRow_inter_base_card_le_two_of_center_ne_p R :
  card (R.sourceRow.support ∩ {q,t1,t2,t3}) <= 2.
```

There is no current positive-incidence lower bound, F1/F2/F3 specialization,
or branch-specific terminal continuation for this unaligned branch.

This affects the origins as follows:

| Origin | Aligned route | Unaligned route |
| --- | --- | --- |
| Anchored | the shared-row packet can be retyped at `p` and enters the live-row classifier | only the generic shared-row common-deletion packet and the `<= 2` live-row intersection bound are available |
| Reciprocal common deletion | if `R.firstCenter = p`, its packet enters the live-row classifier | if `R.firstCenter != p`, no F1/F2/F3 route exists |
| Spent | the source-current packet is centered at `S.oppApex1`; no equality with `p` is supplied | no live-row classifier applies without that additional equality or a separate apex-to-apex consumer |

Thus the support-heavy pipeline is not even reached by every common-deletion
origin.

## 4. Complete aligned common-deletion split

Assume from here that

```text
C : CommonDeletionTwoCenterPacket D W.H deleted p S.oppApex2.
```

The first split is the two-off-live antecedent:

```text
2 <= card ((((C.B₁ ∪ C.B₂) \ deletedCriticalSupport C) \
  {q,t1,t2,t3})).
```

### Positive two-off-live branch

`successor_or_secondCenterAlignment_of_two_off_live_sources` returns:

1. another off-live common-deletion packet at the same two centers; or
2. an `AlignedPrescribedCriticalPair C 1` at the second center.

Neither output is currently eliminated. The successor has no proved
well-founded descent, and the second-center aligned pair has no current
source-faithful cap/MEC terminal.

Status: **kernel-checked reduction; no terminal continuation**.

### Failure branch

If the two-off-live antecedent fails, `twoOffLive_failure_trichotomy` is
exhaustive and produces:

1. F1, `OneLiveOverlapFailureProfile`;
2. F2, `TwoLiveExactCoverFailureProfile`; or
3. F3, `TwoLiveOneOffFailureProfile`.

`liveSecondApex_failure_refinement` attaches the actual parent cap profile to
all three.

| Failure branch | Exact checked information | Current status |
| --- | --- | --- |
| F1 | `1 live-only + 2 support-only + 1 outside`; deleted support meets live in at most one point; second row has at least two strict-`oppCap2` points | reduction only; no named terminal or branch-specific continuation |
| F2 | exact disjoint `2 live-only + 2 support-only`; full strict-cell trichotomy | reduced further below; not eliminated |
| F3a | `2 live-only + 1 support-only + 1 outside` | reduction only; no named terminal or branch-specific continuation |
| F3b | `1 both + 1 live-only + 1 support-only + 1 outside` | reduction only; no named terminal or branch-specific continuation |

The current theorem-bank audit found no direct consumer for any anonymous
F1/F2/F3 packet. Existing U5 consumers require named audit, cap, center, or
directed-incidence roles not supplied by these profiles.

## 5. Complete F2 strict-cell split

`resolvedF2StrictCellNormalForm` is exhaustive within F2:

```text
F2StrictCellBranch.liveHeavy
F2StrictCellBranch.supportHeavy
F2StrictCellBranch.mixed.
```

### F2 live-heavy

`SourceFaithfulF2ThreeRowChain` records the actual three-row `2-2` chain:

```text
card (C.B₂ ∩ live) = 2
card (C.B₂ ∩ deletedCriticalSupport C) = 2
card (live ∩ deletedCriticalSupport C) <= 1
card (C.B₂ ∩ live ∩ deletedCriticalSupport C) = 0.
```

It additionally proves that the live center lies in strict `oppCap2` and the
live row saturates the current cap bound:

```text
card (live row ∩ oppCap2) = 2.
```

Global K4 supplies a q-deleted/q-critical split at each strict middle-row
point, but no current bank theorem consumes the resulting roles.

Status: **kernel-checked reduction only; no current terminal continuation**.

### F2 mixed

`F2MixedOneLiveOneSupportBoundary` records exactly one strict live-only point
and one distinct strict support-only point.

The two-point same-cap arguments used by the heavy branches are unavailable,
and no U5 or terminal role is attached to either point.

Status: **kernel-checked reduction only; no current continuation beyond the
generic packet**.

### F2 support-heavy

This is the most developed F2 branch.

For every aligned support-heavy packet, independently of anchored origin:

1. `F2SupportHeavyReduction` places the actual deleted-source blocker in
   strict `oppCap2` and proves exact two-hit cap saturation.
2. `F2SupportHeavyK4FourWay` gives the exact four generated-row combinations:
   q-deleted/q-deleted, q-deleted/q-critical, q-critical/q-deleted, or
   q-critical/q-critical.
3. `ExactGeneratedAt.exists_genuineEscape` proves that every generated row,
   in either constructor, has a support point outside both the deleted
   dangerous triple and `oppCap2`.
4. `false_of_qCritical_noEscape` is a genuine kernel-checked eliminator of
   the q-critical boundary-absorption subcase.

The constructor-uniform escape is a reduction, not a contradiction. Its
live-role classifier leaves:

- an off-live/off-middle escape;
- `q`; or
- one of `t1,t2,t3`.

No current theorem eliminates all these roles.

Anchored origin adds stronger facts:

- the actual fresh deleted source `X.point` lies in strict `oppCap1`;
- the two support-heavy points lie in strict `oppCap2`;
- the pair is equidistant from `S.oppApex2` and the actual blocker at
  `X.point`;
- the pair is not equidistant from `X.point`; and
- every selected row centered at `X.point` meets the pair in at most one
  point.

In the anchored both-q-critical generated constructor,
`false_of_bothQCritical_metricResidual` is a genuine kernel-checked
eliminator. It leaves:

```text
cross_survival_of_bothQCritical
```

whose conclusion is one of the two cross-deletion-survival arms. No current
theorem eliminates either arm.

The remaining support-heavy endpoints are:

| Nested support-heavy branch | Status |
| --- | --- |
| q-deleted/q-deleted | constructs a new same-deletion common-deletion packet; no strict progress or terminal |
| q-deleted/q-critical | generated escape and generic cross-survival-or-metric classification only |
| q-critical/q-deleted | generated escape and generic cross-survival-or-metric classification only |
| q-critical/q-critical, no-escape | **kernel-eliminated** by `false_of_qCritical_noEscape` at either generated row |
| anchored q-critical/q-critical, metric residual | **kernel-eliminated** by `false_of_bothQCritical_metricResidual` |
| anchored q-critical/q-critical, cross survival | open continuation |
| generated escape off-live | one useful off-live point, but no second point required by the existing two-off-live consumer |
| generated escape on `q` or another live label | one named directed incidence only; no current bank terminal |

## 6. Why support-heavy is load-bearing but non-exhaustive

It is load-bearing because:

- it is one of the three exhaustive F2 strict-cell outputs;
- it has produced real eliminators, not merely renamings:
  q-critical boundary absorption and the anchored both-q-critical metric
  residual are impossible;
- it retains actual source, blocker, cap, row, and generated-support roles;
  and
- it exposes a genuine uniform generated escape for both K4 constructors.

It is non-exhaustive because it covers neither:

1. the unique-radius top branch;
2. the reciprocal critical-to-`FA-UNIQ4` dependency;
3. coherent first-center misalignment;
4. the spent apex-to-apex common-deletion origin;
5. the aligned two-off-live positive branch;
6. F1;
7. F3a or F3b;
8. F2 live-heavy;
9. F2 mixed; nor
10. every generated continuation inside F2 support-heavy.

The deepest anchored coupling also cannot be applied to the current
reciprocal common-deletion arm because the resolved type dropped the
`ReciprocalDirectedCrossResidual` witness, or to the spent arm because that
origin was projected to a generic existential packet.

## 7. Required next branch-complete interface

The next interface should not be another anonymous
`CommonDeletionTwoCenterPacket -> False` theorem. The existing exact
successor-cycle regression already rules out that geometry-free shape.

First strengthen the producer boundary to an origin-tagged common-deletion
type. Schematic shape:

```lean
inductive OriginTaggedRCommonDeletion ... : Type
  | anchored
      (R : CoherentRCommonDeletionPacket ...)
      (A : AnchoredSourceCriticalTransition R)
      (X : RowExternalCommonDeletionSource A)
      (hXOff : X.point ∉ S.surplusCap)
      ...
  | reciprocal
      (R : CoherentRCommonDeletionPacket ...)
      (X : ReciprocalDirectedCrossResidual R)
      (z : ℝ²)
      (G : exact common-deletion arm produced by
        X.exists_fresh_commonDeletion_or_secondApexCritical)
      ...
  | spent
      (E : FrontierRadiusSpentAtEntry F)
      (C : CommonDeletionTwoCenterPacket
        D W.H F.pair.q S.oppApex1 S.oppApex2)
      ...
```

The actual declaration may package witnesses in structures instead of
constructor fields, but it must retain the displayed source identities and
implication evidence.

Then the missing R theorem should have the direct branch-complete shape:

```lean
theorem false_of_originTaggedRCommonDeletion
    (parent : DangerousRetainingFullParentContext ...)
    (O : OriginTaggedRCommonDeletion parent) :
    False
```

Its proof coverage must visibly include:

1. anchored, reciprocal, and spent origins;
2. for coherent origins, `firstCenter = p` and `firstCenter != p`;
3. on the aligned branch, the two-off-live positive output and its failure;
4. F1, F2, and F3;
5. inside F2, live-heavy, support-heavy, and mixed; and
6. the remaining support-heavy generated cross-survival/metric outputs.

The coordinator-level theorem can then consume:

- this origin-tagged R eliminator;
- the protected original `FA-UNIQ4`/`FA-UNIQ5` eliminators; and
- the swap-stable `FA-UNIQ4` eliminator for reciprocal criticality.

This interface prevents a future search from reporting success on one aligned
anchored leaf as if it covered the full resolved normal form.

## 8. Theorem-bank preflight

The required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused indexed searches covered:

- origin-tagged common-deletion elimination;
- two-off-live second-center alignment;
- F1/F2/F3 terminal consumers;
- support-heavy generated escape; and
- generated cross-survival.

No banked theorem supplied the proposed branch-complete consumer. The closest
declarations remain terminal U5 incompatibilities whose named center, cap,
audit, or directed-incidence antecedents are absent from at least one matrix
row.

## 9. Machine-readable companion

`matrix.json` records the same coverage classification with the statuses:

```text
eliminated
routed
reduced
open_no_current_continuation
protected_dependency
```
