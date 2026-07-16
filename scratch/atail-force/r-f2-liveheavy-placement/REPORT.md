# F2 live-heavy placement audit

## Scope

This scratch lane audited the proposed F2 live-heavy placement producer on the
complete dangerous-retaining full-parent surface:

```text
TwoLiveExactCoverSecondApexProfile
+ at least two live-only points in strictSecondCap
⇒ p ∈ surplusCap ∪ oppCap1.
```

No production file, closure document, or proof-blueprint state was changed.

## Theorem-bank preflight

Before proving new cap or incidence facts, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for second-apex placement,
  dangerous retained rows, removable centers, strict-cap hits, and
  prescribed-deletion criticality.

The closest banked statements do not supply the required role-faithful
producer:

- `partnerApex_center_removable_of_u3` requires `IsM44`, U2, minimality,
  short-cap saturation, and a named U5 class.  The parent surface here assumes
  `¬ ∃ S, S.IsM44`.
- The general cap-selected-row theorem supplies only
  `card (row ∩ cap) ≤ 2`.
- `exists_removableVertex_of_twoLargeCaps` is downstream of the still-open
  `DoubleApexOffSurplusSharedRadiusPair` declaration and is therefore circular
  for this closure lane.

No bank theorem proved either the proposed adjacent-cap placement or the
one-hit strengthening isolated below.

## Kernel-checked result

The file `F2LiveHeavyPlacementAudit.lean` proves the opposite cap localization.

### 1. Exact cap coverage

`mem_strictSecondCap_of_mem_A_of_not_mem_adjacentCaps` proves:

```text
x ∈ A
x ∉ surplusCap
x ∉ oppCap1
-----------------
x ∈ oppCap2 \ (surplusCap ∪ oppCap1).
```

The proof checks all three values of `surplusIdx`.  A Moser-triangle vertex
cannot survive the two cap exclusions, and `CapTriple.nonmoser_in_one` then
places the point in the remaining cap.

### 2. The F2 live-heavy center lies in strict `oppCap2`

`twoLiveExactCover_two_liveStrict_forces_p_mem_strictSecondCap` combines:

- the already checked same-cap conclusion
  `p ∉ surplusCap ∧ p ∉ oppCap1`;
- `p ∈ D.A`, from the retained live critical shell; and
- exact three-cap coverage.

It concludes:

```text
p ∈ strictSecondCap S.
```

Thus the proposed statement

```text
p ∈ S.surplusCap ∪ S.oppCap1
```

is not a passive placement lemma.  Proving it under the full hypotheses would
amount to proving that the entire F2 live-heavy branch is inconsistent.

This audit does **not** establish that the full-parent/F2 branch is consistent:
an inconsistent hypothesis set implies both placements.  It establishes the
correct local direction and shows that any contradiction must use an
additional global parent consequence, rather than cap coverage alone.

### 3. The existing cap bound is exactly saturated

`twoLiveExactCover_two_liveStrict_saturates_oppCap2` proves:

```text
card (W.liveRow.support ∩ S.oppCap2) = 2.
```

The lower bound comes from the two live-only strict points.  The upper bound is
exactly
`CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two`,
because the live center is in `oppCap2`.

So the existing incidence theorem does not contradict this arm; it is sharp
on it.

### 4. Complete parent trace

`fullParent_extracts_F2_liveHeavy_strictOppCap2_saturation` consumes the full
dangerous-retaining parent signature through
`fullParent_extracts_dangerousRetainingCurrentNormalForm`.  In particular it
retains:

- the actual second-large-cap witness `j ≠ i` with cap cardinality at least
  five;
- the rebuilt `LiveDangerousRetainingSystem W`;
- `q ∈ S.surplusCap`; and
- every original MEC, cap, no-M44, no-removability, critical-system, fixed-row,
  and live-data hypothesis needed by that extractor.

For the extracted `W`, every subsequent exact F2 live-heavy common-deletion
packet satisfies both:

```text
p ∈ strictSecondCap S
card (W.liveRow.support ∩ S.oppCap2) = 2.
```

This avoids replacing the actual packet with `D.packet`, inventing cap roles,
or selecting an unrelated critical-shell system.

## Exact missing producer

The smallest direct closure field exposed by this audit is:

```text
under the complete retained parent and the actual F2 packet,
card (W.liveRow.support ∩ S.oppCap2) ≤ 1.
```

`false_of_twoLiveExactCover_two_liveStrict_of_oppCap2_card_le_one` proves that
this one inequality immediately contradicts the checked equality `= 2`.

A stronger but less targeted sufficient field is:

```text
p ∉ S.oppCap2.
```

`false_of_twoLiveExactCover_two_liveStrict_of_p_not_mem_oppCap2` installs that
consumer as well.

Neither fact is currently present in the theorem banks or exposed by a parent
field.  A valid producer must connect the global hypotheses—most plausibly
the prescribed-deletion critical map, no-removability, fixed-triple metric
data, or second-large-cap geometry—to the **actual** retained live row and
actual `oppCap2` intersection.  Reapplying the generic cap-cardinality theorem
cannot help because its bound is already attained.

## Closure status

This lane does not close a production `sorry`.  It corrects the proposed proof
shape and leaves one exact producer target:

```text
full parent + actual F2 provenance
⇒ card (live row ∩ oppCap2) ≤ 1.
```

If that theorem is false, the next useful artifact is a source-faithful
finite/cap countermodel retaining the prescribed critical map and
no-removability interface.  A placement-only cap census is insufficient.

## Validation

The deliberate single-file check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:$BASE_LEAN_PATH" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-liveheavy-placement-oleans/F2LiveHeavyPlacementAudit.olean \
  ../scratch/atail-force/r-f2-liveheavy-placement/F2LiveHeavyPlacementAudit.lean
```

It exited successfully.  Every printed theorem depends only on:

```text
propext
Classical.choice
Quot.sound
```

None depends on `sorryAx`.  No full `lake-build` was run.
