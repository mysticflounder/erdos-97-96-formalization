# Third-center common-pair producer audit

Date: 2026-07-16

Status: **SOURCE-FAITHFUL SATURATION CLASSIFIER KERNEL-CHECKED; POSITIVE
THIRD-CENTER PRODUCER BLOCKED.**

## Verdict

The proposed third-center object is not an intermediate geometric witness.
It is already an impossible terminal.

On a directed cross-membership arm, let

```text
O = S.oppApex1
B = H.centerAt P.q P.q_mem_A.
```

The frontier marginal makes `O` equidistant from `P.q,P.w`, and the cross hit

```text
P.w in support (H.selectedAt P.q P.q_mem_A)
```

makes `B` equidistant from the same pair.  Once `B != O`, convex independence
and `Dumitrescu.perpBisector_apex_bound` forbid every third carrier center on
that perpendicular bisector.  Therefore any theorem producing a genuinely
third actual selected row containing `P.q,P.w` proves `False` immediately.

Global K4 and the retained total `CriticalShellSystem` do not themselves
select such a row.  The source-faithful consequence is instead a survival /
alignment classifier for every source of the critical map.

## Kernel-checked boundary

`ThirdCenterCommonPair.lean` imports only production
`ATail.CriticalPairFrontier` and proves without `sorry`:

```text
false_of_thirdActualCenter_selectedRow_contains_frontierPair
```

If a source's actual blocker is distinct from both `O` and `B`, its selected
critical row cannot contain both frontier points.

```text
not_exists_thirdActualCenter_selectedRow_contains_frontierPair
```

This is the existential terminal form: there is no genuinely third actual
center with a source-indexed selected row through the frontier pair.

```text
both_frontierDeletions_blocked_iff_selectedRow_contains_pair
```

At an arbitrary source `s`, the following are equivalent:

```text
deleting P.q blocks K4 at H.centerAt(s)
and deleting P.w blocks K4 at H.centerAt(s)

<->

the selected critical row sourced at s contains both P.q and P.w.
```

Thus the exact missing producer can be stated without row-slot terminology:
find a source whose actual blocker is distinct from `O,B` and at which both
frontier-source deletions fail.

```text
frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
```

For every source of the retained total critical map, its actual blocker
satisfies at least one of:

1. K4 survives deletion of `P.q` there;
2. K4 survives deletion of `P.w` there;
3. the blocker is `O`;
4. the blocker is `B`.

Finally,

```text
cardFour_or_frontierDeletionSurvival_or_actualBlocker_eq_knownCenter
```

applies directly to the full `CriticalPairFrontier`.  On the cross-membership
arm it proves the same classifier for every source, with one exact escape:

```text
card (SelectedClass D.A O r) = 4.
```

The robust first-apex arm and the exact-card-five arm both make deletion of
`P.q` survive at `O`, hence force `B != O`; the exact-card-four arm does not.

Every printed theorem has axiom closure exactly

```text
propext, Classical.choice, Quot.sound.
```

## Exact missing antecedent

Outside the FA-UNIQ4 escape, closing by this route requires a theorem of the
following shape:

```text
exists source in D.A,
  H.centerAt(source) != O
  and H.centerAt(source) != B
  and not K4(D.A erase P.q, H.centerAt(source))
  and not K4(D.A erase P.w, H.centerAt(source)).
```

Equivalently, by the checked iff, it requires a genuinely third actual
selected row containing both frontier points.  Neither global K4 nor totality
of `H` has the needed polarity: global K4 provides a row at every center,
while the desired statement requires **two prescribed deletion failures at
one actual blocker**.  `CriticalShellSystem.no_qfree_at` supplies failure only
for that row's own source, not for the independently chosen frontier sources.

The unanchored `CriticalShellSystem.exists_blocker_cycle` also does not help:
it supplies no orbit point at which both frontier deletions fail and no
alignment of the orbit with `P.q,P.w`, either blocker shell, or a cap.

Cap order is downstream of the missing incidence.  It can localize a center
already known to bisect the pair, but it cannot make an arbitrary global row
contain the prescribed pair.  The saturation theorem itself needs no cap
order once the two row memberships are present.

## Countermodel boundary

There is no claimed counterexample to the full parent theorem or to global
K4 plus a total `CriticalShellSystem`.

The exact local regression in

```text
scratch/atail-force/robust-four-center/
  verify_strict_convex_local_gap.py
```

does, however, rule out the naive local producer.  Its 29-point exact
strict-convex model retains the MEC/non-obtuse Moser triangle, cap partition,
no-`IsM44`, the card-five first-apex row, second-apex double-deletion row,
both actual robust blocker shells, and K4 at every off-source support point
of those shells.  None of the six such support centers is equidistant from
the frontier pair.  Hence cap order plus all currently localized K4 rows does
not produce the desired third center.

That model deliberately omits all-center K4 and a total critical-shell map,
so it is an exact countermodel only to the local/support-point inference, not
to the full remaining closure statement.  The genuinely untested layer is
exactly the anchored all-center K4/total-map theorem displayed above.

## Bank and indexed-corpus preflight

Before formalizing the classifier, the required current, sibling, legacy,
and older-general registries were searched, together with indexed Lean
queries for three common-pair centers, selected rows through a prescribed
pair, and perpendicular-bisector contradictions.

The relevant existing endpoints were:

- `Dumitrescu.perpBisector_apex_bound`;
- `Census554.CapSelectedCarrierBridge.pairCenterCount_patternCode`;
- `Census554.GeneralCarrierBridge.source_mem_blocker_row`;
- `CriticalShellSystem.selectedFourClass_support_eq_shell`;
- `ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`;
- `ATailCriticalPairFrontier.blocker_centers_eq_of_*_of_mutual_cross_membership`;
  and
- sibling `u5_common_bisector_triple_incompatibility`.

These are sinks, exact-row transport, or membership/survival classifiers.
None produces two prescribed frontier hits at a genuinely third source-indexed
actual center.  The closest prior scratch boundary is
`robust-four-center/`, which already found global rows at blocker-shell
support points but no prescribed pair incidence.

## Validation

Focused direct elaboration from `lean/`:

```bash
lake env lean -R .. -M 16384 \
  ../scratch/atail-force/third-center-common-pair/ThirdCenterCommonPair.lean
```

Result: exit zero.  No production Lean, closure doc, proof-blueprint state,
unique-row/654 artifact, `SurplusM44`, `SevenPointTwinFourCircleCollision`,
`CriticalPairFrontier`, `docs/live-blueprint.md`, or
`card_five_cap_or_mutual_consumer.lean` was modified.

## Epistemic status

- Third-center terminal and total-map classifier: **PROVEN / KERNEL-CHECKED**.
- Registry/corpus absence of a positive producer: **SEARCH-VERIFIED WITHIN
  THE LISTED CORPORA**.
- Local strict-convex support-point falsifier: **EXACTLY VERIFIED WITHIN ITS
  STATED PARTIAL ABSTRACTION** (existing artifact, not rerun here).
- Unconditional full-parent third-center production: **OPEN / BLOCKED AT THE
  ANCHORED DOUBLE-DELETION-FAILURE PRODUCER**.
- Production `sorry` closed by this lane: **NONE**.
