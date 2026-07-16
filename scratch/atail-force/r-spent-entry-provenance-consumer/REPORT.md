# Spent-entry original-pair provenance audit

Date: 2026-07-16

Status: **PROVEN scratch reduction; negative for direct closure**

## Question

Does `FrontierRadiusSpentAtEntry` become contradictory if the continuation
retains both original endpoints `q,w` and the same exact first-/second-apex
rows, instead of immediately forgetting each deletion into an anonymous
`CommonDeletionTwoCenterPacket`?

## Bank preflight

The audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` bank;
- all three concise general-n mining reports and their JSON declaration
  inventories;
- current source consumers involving two selected rows, a common outside
  pair, double deletion, and `U5QDeletedK4Class`; and
- indexed Lean searches for:
  - two distinct deleted points preserving the same two exact rows;
  - two selected rows omitting the same pair; and
  - two cap-center rows sharing a common outside pair.

The only directly applicable bank is the ordered-cap consumer
`false_of_two_cap_center_rows_common_outside_pair`, ultimately backed by
`CapSelectedRowCounting.outsidePair_unique_capCenter`. It requires two
distinct common support points outside the cap containing the two row
centers. The spent-entry surface does not produce those two common points.

The large sibling U5 incompatibility bank still requires dangerous-triple and
named row-incidence data absent from this packet. The legacy inventories are
fixed-nine/scalar consumers and do not match this general-n row shape.

## Checked Lean result

`SpentEntryOriginalPairSharedRows.lean` defines
`SpentEntryOriginalPairSharedRows E` and proves:

1. one exact alternate-radius row at `S.oppApex1` and the existing
   `FrontierSecondApexRow F` can be retained simultaneously;
2. both rows omit both original endpoints `F.pair.q` and `F.pair.w`;
3. the alternate first-apex row is disjoint from the original spent-radius
   class;
4. `toCommonDeletionAtQ` and `toCommonDeletionAtW` install exactly the same
   two supports in the two common-deletion packets;
5. the common support of those two rows outside `S.surplusCap` has cardinality
   at most one; and
6. if the total row overlap has cardinality two, it has the exact split
   one point in `S.surplusCap` and one point outside it.

The last two facts are the sharp existing ordered-cap consequence. A producer
forcing two common outside-surplus points would close immediately, but no such
producer is currently present.

The theorem
`SpentEntryOriginalPairSharedRows.to_biApex_two_by_two_survival_normal_form`
then chooses strict pairs in the retained first- and second-apex rows and
feeds them to the existing
`biApex_two_by_two_survival_normal_form`. Its conclusion is exactly the old
common-deletion-or-crossed-critical residual. The original endpoints `q,w`
do not occur in that conclusion.

## Conclusion

This provenance is real but **subsumed for closure purposes**.

Retaining the same two rows improves the anonymous packet to the exact
outside-surplus overlap bound above, but it does not produce `False`, strict
progress, or a new bank match. In particular:

- `q,w` are omitted from both retained rows, so they cannot serve as the
  common pair needed by the ordered-cap sink;
- there is no lower bound of two on the two row supports' intersection; and
- after selecting strict row points, the branch is exactly the already-known
  two-by-two normal form.

Do not continue a separate spent-entry provenance branch unless a later
full-parent theorem supplies one of:

- two distinct common row points outside `S.surplusCap`;
- another condition contradicting the exact one-inside/one-outside overlap;
  or
- named dangerous/live incidences that place the resulting two-by-two normal
  form in an existing U5 incompatibility consumer.

No production sorry closes from this audit.

## Validation

The scratch file was compiled directly because it is outside the Lake source
graph. Its printed axiom closure is exactly:

```text
propext, Classical.choice, Quot.sound
```

No `sorry`, `admit`, or custom axiom occurs in the file.
