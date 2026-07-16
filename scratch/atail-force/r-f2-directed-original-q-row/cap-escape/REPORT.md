# Original-q live-heavy cap-escape report

Date: 2026-07-16

Status: **KERNEL-CHECKED SCRATCH REDUCTION. EVERY LIVE-HEAVY ORIGINAL-Q
GENERATED ROW EITHER CLOSES OR HAS A SUPPORT POINT OUTSIDE BOTH THE LIVE ROW
AND `oppCap2`. THIS DOES NOT YET PRODUCE A POINT OUTSIDE THE PHYSICAL MIDDLE
ROW.**

## Scope

This lane owns only:

- `OriginalQCapEscape.lean`;
- `OriginalQMixedConfined.lean`;
- this report.

It changes no production Lean, closure document, proof-blueprint state,
protected file, or unique-row lane.

## Required theorem-bank preflight

Before proving the reduction, I checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md`;
- the current directed original-q bank audit;
- focused `nthdegree docs search --lean` results for strict opposite-cap
  centers with a common outside pair and for q-deleted/q-critical support
  deficits.

The bank contains no automatic named-hit producer. The load-bearing existing
consumer is:

```text
false_of_two_strictOppCap2_rows_common_outside_pair
```

The proof therefore uses only source-forced cardinality and invokes that
consumer in the one q-critical residual where a named hit has actually been
derived.

## Checked theorem surface

### Completed-row cap deficit

```text
ExactGeneratedAt.two_le_fullSupport_sdiff_oppCap2
```

Every completed selected four-row centered in strict `oppCap2` has at least
two support points outside `oppCap2`. This is the existing ordered-cap
intersection bound rewritten as a positive deficit.

### Live-row cap placement

```text
AnchoredF2LiveHeavyReduction.liveCapFacts
```

The two named live-heavy points saturate the retained live row's `oppCap2`
intersection. Consequently:

```text
p is in strictSecondCap
q is not in oppCap2
the retained coherent source is not in oppCap2
```

The last two facts are derived from exact cardinality-two saturation; no
non-Moser hypothesis is silently reintroduced.

### Q-deleted constructor

```text
qDeleted_exists_offLive_offOppCap2
```

For every exact q-deleted row at a source-faithful named center:

```text
exists z,
  z belongs to the generated support
  and z does not belong to {q,t1,t2,t3}
  and z does not belong to oppCap2.
```

If no such point existed, all off-cap support points would be live. Since the
row omits `q` and the two named live points lie in `oppCap2`, every off-cap
support point would have to be the single coherent source. That contradicts
the completed-row two-point cap deficit.

### Q-critical constructor

```text
false_or_qCritical_exists_offLive_offOppCap2
```

The same escape is obtained unless the coherent source belongs to the
generated q-critical support. In that residual, adjoining `q` completes the
generated selected four-row. It and the retained live row have:

```text
distinct strict-oppCap2 centers;
common support points q and coherent source;
both common points outside oppCap2.
```

The checked ordered-cap common-outside-pair theorem then yields `False`.

### Constructor-uniform interface

```text
false_or_exists_offLive_offOppCap2

OriginalQOffLiveGeneratedProfile.false_or_exists_offLive_offOppCap2
```

These package the exact per-center result:

```text
False
or
exists a generated support point outside both the live row and oppCap2.
```

## Exact remaining boundary

The new point is not proved outside:

```text
(alignedSharedRowPacket X hcenter).B2.
```

In the live-heavy normal form, the two support-only middle-row labels need
not lie in strict `oppCap2`. Therefore an off-live, off-`oppCap2` generated
point can still be one of those physical middle-row labels.

Accordingly this result does **not** yet imply:

- survival after deleting that point at the physical second apex;
- a `CommonDeletionTwoCenterPacket`;
- the existing two-off-live successor; or
- closure of K-A-PAIR.

The next strengthening must either derive a point outside the physical
middle row, or close the confined-support residual by comparing the generated
selected row with that physical row. That comparison is constructor-sensitive:

- q-deleted: three common physical-row points would contradict
  `SelectedFourClass.inter_card_le_two`;
- q-critical: the third live hit is either the other named physical-row
  point, giving the same three-point contradiction, or the coherent source,
  giving the checked common-outside-pair contradiction.

`OriginalQMixedConfined.lean` now performs this comparison for the mixed
boundary. The analogous live-heavy comparison is not claimed here.

## Mixed-boundary confined classifier

The existing outside-middle split says that a checked mixed generated profile
either gives a genuine common-deletion successor or forces both `N.s` and
`N.t` into the generated support.

The companion theorem

```text
false_or_nonempty_mixedConfinedResidual
```

classifies the latter case against:

```text
AnchoredF2MixedOriginalQBranch
```

and the exact constructor of the generated row.

### Closed constructor cells

The physical-q-critical/generated-q-critical cell closes unconditionally.
The completed physical and generated selected rows have the three distinct
common points:

```text
q, N.s, N.t.
```

In either physical-q-deleted cell, a generated hit at `N.y` also closes:

```text
N.y, N.s, N.t
```

are three distinct common points. Both closures use the source-current
`SelectedFourClass.inter_card_le_two` theorem.

### Exact honest residuals

`MixedConfinedResidual` has exactly three constructors:

1. physical q-critical / generated q-deleted, retaining both `s,t` hits;
2. physical q-deleted / generated q-deleted, retaining both hits and
   `N.y ∉ generated.support`;
3. physical q-deleted / generated q-critical, retaining both hits and
   `N.y ∉ generated.support`.

The first residual has exactly the source-forced common pair `s,t`; neither
`q` nor the generated center `x` can supply a third generated-support hit.
The other two residuals explicitly record the missing third physical-row
hit. No ordered-cap sink currently applies automatically to these
two-common-point configurations.

The complete mixed route surface is:

```text
outsideMiddleSuccessor_or_false_or_mixedConfinedResidual
```

with conclusion:

```text
outside-middle common-deletion successor
or False
or one of the three exact residuals.
```

## Validation

The focused repository-pinned check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-original-q-offlive-oleans:/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-original-q-cap-escape-oleans/OriginalQCapEscape.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/cap-escape/OriginalQCapEscape.lean
```

It exited successfully. Every printed declaration depends only on:

```text
propext
Classical.choice
Quot.sound
```

There is no `sorryAx`, `sorry`, `admit`, or declared axiom in this lane. No
full `lake-build` was run.

The focused mixed-boundary check was:

```bash
cd lean
env LEAN_PATH="/private/tmp/p97-r-f2-original-q-outside-middle-oleans:/private/tmp/p97-r-f2-original-q-offlive-oleans:/private/tmp/p97-r-f2-original-q-source-extraction-oleans:/private/tmp/p97-r-f2-generated-escape-placement-oleans:/private/tmp/p97-r-f2-three-row-bank-deficits-oleans:/private/tmp/p97-r-f2-supportheavy-k4-split-oleans:/private/tmp/p97-r-f2-live-mixed-handler-root-oleans:/private/tmp/p97-r-f2-anchored-provenance-lift-oleans:/private/tmp/p97-r-f2-strict-cell-normal-form-oleans:/private/tmp/p97-r-f2-three-row-chain-oleans:/private/tmp/p97-r-f2-supportheavy-reduction-oleans:/private/tmp/p97-r-f2-liveheavy-placement-oleans:/private/tmp/p97-r-two-off-live-oleans:/private/tmp/p97-r-orbit-entry-oleans:/private/tmp/p97-r-live-common-deletion-oleans:/private/tmp/p97-joint-transition-oleans:/private/tmp/p97-r-failure-parent-lift-oleans:./.lake/build/lib/lean" \
  lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-r-f2-original-q-mixed-confined-oleans/OriginalQMixedConfined.olean \
  ../scratch/atail-force/r-f2-directed-original-q-row/cap-escape/OriginalQMixedConfined.lean
```

It also exited successfully. Its three printed declarations have the same
core-three axiom closure.
