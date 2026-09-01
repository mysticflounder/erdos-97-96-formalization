# Card18 v2 bridge minimum

This file freezes the minimum source-to-finite bridge still required before a
future Card18 consumer can use this run.  The present runner is a **generic
A-ROW** explorer at `k=4,n=18`; it is not Card18 and supplies none of the
bridge proofs below.

Source revision recorded by the runner: `ac3f31c5fe45c9143af0a7db3d2e28ec4c1c7018`.

1. **Total source rows.** Produce one source row for every source label, rather
   than only rows occurring in a selected packet.
2. **Blocker/row-center packet.** For every source point, provide a blocker and
   row center together with source membership, center distinctness, exact
   cardinality four, carrier containment, and the common-distance statement.
3. **Separate center rows.** Keep blocker-centered and point-centered rows as
   separate source objects.  Their diagonal exclusions have opposite
   orientation and cannot be identified silently.
4. **Exact `labelsOf` transport.** State and prove the exact transport of row
   membership, omitted points, centers, and cardinalities through `labelsOf`.
5. **Source-to-finite theorem.** Construct the finite labelled A-ROW object
   from convex independence plus injective labels, with every hard clause
   discharged from named source hypotheses.
6. **Pair-hit-center input.** Supply the theorem bounding centers that hit a
   fixed pair, or expose a finite quotient carrying precisely the information
   needed for that bound.
7. **SCC orientation.** Freeze the directed edge as `c -> p` exactly when
   `p in S[c]`.  A sink cut for `C` is
   `OR_{c in C, p outside C} x[c,p]`, guarded by
   `MINIMAL-FAITHFUL-CONSEQUENCE`.
8. **Deletion status discipline.** Transport only deletion statuses actually
   present in the source packet.  Absence of a selected status is unknown, not
   the opposite status.

Until all eight items are proved and connected to a named consumer, a checked
UNSAT here is only a fact about its authenticated finite generic A-ROW CNF.
