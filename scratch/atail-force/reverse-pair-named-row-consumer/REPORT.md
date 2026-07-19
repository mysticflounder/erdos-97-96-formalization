# Reverse-pair named-row consumer

Date: 2026-07-19

Status: **KERNEL-CHECKED CONSUMER; PRODUCER OCCURRENCE STILL OPEN.**

`ReversePairNamedRowConsumer.lean` proves the exact named-row terminal needed
by the all-reverse parent audit.  If either the retained first-apex row or the
double-deletion first-apex row shares at least two points with one transition
reverse outside pair, those two points are co-radial from the first apex by
the row equality.  The existing
`false_of_transitionReverseOutsidePair_coRadial_firstApex` theorem then closes
the branch.

This does not assert that such an intersection exists.  The remaining
producer target is now sharply stated as a source-faithful T0/T1-to-reverse
row occurrence theorem, retaining the complete `FullParentExactFiveAllReverseData`
packet.  Abstract Kalmanson rows and pair marginals are insufficient, as
recorded by the existing exact countermodel audits.

Validation:

```text
cd lean && lake env lean ../scratch/atail-force/reverse-pair-named-row-consumer/ReversePairNamedRowConsumer.lean
```

The focused elaboration exits 0 with no warnings.  The two public declarations
report only `propext`, `Classical.choice`, and `Quot.sound`.
