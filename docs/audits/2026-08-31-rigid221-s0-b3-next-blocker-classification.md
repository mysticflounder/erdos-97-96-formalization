# Rigid221 S0 B3 next-blocker classification boundary

**Date:** 2026-08-31
**Lane:** `rigid221-s0-b3-next-blocker-classification-20260831`
**Base:** `3973a7d52b50a447af947e46adb35c33f97a101b`
**Status:** conditional source fact elaborated in scratch; no production Lean declaration

## Question

The B3 plan asks for the actual blocker of the `v`-indexed row to be split
into physical placements and an off-class case.  Does the live B3 context
already place that blocker in the physical second-apex class?

The intended eventual consumer remains
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`
in `Rigid221Placement.lean:903`.  The active B3 plan identifies this next
blocker relation as the missing connection from the source-row midpoint to a
closed order cycle (`docs/erdos-97-descent-prose-proof-atomic.md:8080-8089`).

## Checked conditional classification

Write

```text
c_v = centerAt(v),
C   = SelectedClass(A, oppApex2, rho),
Iu  = selectedAt(u).support ∩ C,
Iv  = selectedAt(v).support ∩ C.
```

The scratch check proves the following source-faithful conditional fact:

```text
c_v ∈ C
  → ∃ xu, xu ≠ u ∧ Iu = {u, xu} ∧
      (c_v = deleted ∨ c_v = u ∨ c_v = xu).
```

The proof uses only the live rigid cover
`C = insert deleted (Iu ∪ Iv)`, the exact cardinality `Iu.card = 2`, and the
fact that a selected row's center is absent from that row's support.  Since
`c_v ∉ Iv`, every physical-class placement of `c_v` is in the displayed
three-way list.

The elaborated check is retained at
`scratch/runs/rigid221-s0-b3-next-blocker-classification-20260831/lean-verify-v1/NextBlockerClassificationCheck.lean`.
Its receipt records a successful single-file Lean elaboration in 6.11 seconds.

## Missing B3 antecedent

The B3 interface does **not** provide `c_v ∈ C`:

- `P.jointDeletion.vPacket` records that `c_v` is a carrier point and that
  deleting `deleted` preserves a four-point witness at `c_v`
  (`JointDeletion/Types.lean:42-72`).
- Canonical blocker semantics make `c_v` distinct from `v` and rule out a
  four-point witness after deleting `v`; they do not attach `c_v` to `C`.
- The source-row-heavy hypotheses localize the source blocker `v`, not the
  actual blocker of the `v`-indexed row.

Thus the conditional classification is a precise boundary, not a B3 closure.
Adding it as a production helper now would create an unwired interface: B3
lacks the condition that starts the classification, and none of the three
physical placements has a current direct terminal.

## Consequence

The next productive source theorem must construct a physical-class or
off-class placement for `centerAt(v)` from canonical-blocker and
common-deletion data.  A cardinality-only refinement is insufficient: the
existing peer/deleted/opposite-row analysis already stops at a second-cap
lower bound of six and has no literal-blocker B3 upper-bound consumer.  The
downstream `Rigid221SourceRowCapBetweenness` module cannot be imported for
this purpose because it already imports `Rigid221Placement`.

No PiQD run was launched for this audit.  The checked statement is a Lean
source-interface condition, and no new source-faithful finite formula follows
until the missing placement producer is identified.

## Validation boundary

This is author-verified scratch evidence only.  It has no source change,
no production consumer, no final-consumer axiom audit, and no promotion claim.
