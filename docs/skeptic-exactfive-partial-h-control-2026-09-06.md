# Math Skeptic Audit: exactfive partial-H control

**Target**: `docs/audits/2026-09-06-exactfive-partial-h-control.md`,
`scripts/verify_exactfive_partial_h_control.py`, and
`certificates/exactfive_partial_h_control_20260906.json`, plus §3d of
`docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 10

## Summary

The retained 44-point checker replays successfully with exact Q(√3)
arithmetic. Captured stdout is byte-for-byte identical to the retained
certificate: 6,933 bytes, SHA-256
`d825ba9faac0ffbefa34629b86e665f1789e96934b16e45f145453175f06cca9`.
An independent replay recomputed all `C(44,3) = 13244` cyclic triples and
found 13244 positive orientations. It independently rebuilt all 44 ambient
distance maps, recovering exactly the seven rich centers and every row in the
note. The partial assignment is valid, 18 sources are covered by actual
singleton-critical rows, and 26 have no actual blocker.

The note correctly labels the result as finite empirical evidence. It
separates the partial blocker assignment from a total `CriticalShellSystem`,
records the missing global K4 and total-H hypotheses, and states that the
singleton row gives no radius-decrease conclusion. The added selected-row
mapping is stated as a finite counterpart of source fields, with production
structures explicitly marked absent. No global theorem, physical-source
counterexample, Lean declaration, or closure is claimed.

## Findings

### F1: Scope and labels are accurate

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:5-26`
- **Quote**: “This is a partial function on five sources, not the production `CriticalShellSystem` on the whole carrier.”
- **Stated label**: EMPIRICALLY VERIFIED finite exact-arithmetic evidence
- **Evidence present**: The checker and certificate identify 44 points, finite row data, `global_K4: false`, `total_H_possible: false`, and `original_physical_source_instantiated: false`. The independent replay agrees.
- **Actual label**: EMPIRICALLY VERIFIED on one explicit 44-point carrier.
- **Verdict**: OK
- **Reason**: The note does not promote the partial assignment to a total source or a general result.

### F2: Parent authentication and byte-exact replay are sound

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:28-34`; checker `scripts/verify_exactfive_partial_h_control.py:14-18`
- **Quote**: “After adding points, the new checker recomputes every ambient distance class and every supporting edge.”
- **Stated label**: Authenticated finite construction
- **Evidence present**: The checker asserts the parent SHA-256
  `1c3445ba21fdebc2c2ac9d3f77333b7bae630ed2e6c0e26ad523b92227faf542`,
  recomputes the enlarged carrier, and replays byte-for-byte against the
  certificate with zero stderr.
- **Actual label**: EMPIRICALLY VERIFIED authenticated replay.
- **Verdict**: OK
- **Reason**: The dependency pin and retained output both validate.

### F3: The 44-point carrier preserves convexity, MEC, and cap structure

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:36-62`; checker `:66-86`
- **Quote**: “The strict cap counts are 6,17,18; the closed counts are 8,19,20. W remains uniquely surplus.”
- **Stated label**: EMPIRICALLY VERIFIED finite geometry
- **Evidence present**: The checker asserts 1,848 strict supporting-edge inequalities, exact nonnegative disk slack, boundary `{O,V,W}`, cap sizes `{O:6,V:17,W:18}`, and partition of all non-boundary points. Independent recomputation gives 13,244 positive cyclic orientations, unique coordinates, the same MEC boundary, and nonnegative slack.
- **Actual label**: EMPIRICALLY VERIFIED for this 44-point carrier.
- **Verdict**: OK
- **Reason**: The exact finite checks support the stated convex carrier and unchanged enclosing disk.

### F4: The complete ambient rich-row census and singleton criticality are correct

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:64-81`; checker `:88-119`
- **Quote**: “All five assigned blockers above use these full classes on the 44-point carrier.”
- **Stated label**: EMPIRICALLY VERIFIED full-row control
- **Evidence present**: Independent distance maps recover exactly the rich centers `O,V,b,c,w,d0,d1` and exactly the rows listed in the table. The actual four-row centers are exactly `b,c,w,d0,d1`; deleting every member of each row destroys K4 at its center.
- **Actual label**: EMPIRICALLY VERIFIED complete finite ambient census and singleton criticality.
- **Verdict**: OK
- **Reason**: The checker quantifies over all ambient classes after enlargement, so the displayed rows are not selected subsets of larger classes.

### F5: The displayed partial H assignment and freshness condition are established

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:12-20,76-81`; checker `:120-128`
- **Quote**: “H(q)=d1, H(w)=b, H(b)=c, H(c)=b, H(u)=d0.”
- **Stated label**: EMPIRICALLY VERIFIED partial source assignment
- **Evidence present**: The independent row census confirms each source is in its assigned center’s unique actual four-row, each source differs from its assigned center, `H(q) ≠ H(w)`, `H(b)=c`, `H(c)=b`, and `c` differs from both endpoint assignments. The certificate records `partial_H` and `c_fresh_relative_partial_endpoint_assignment: true`. The revised note distinguishes fresh center `c` from fresh source `b` and records `H(b)=c`.
- **Actual label**: EMPIRICALLY VERIFIED on five named sources only.
- **Verdict**: OK
- **Reason**: The note explicitly limits this to a partial function and states that it is not a production total shell system.

### F6: The first-apex, minimum-pair, and mutual local data are preserved

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:80-87`; checker `:97-111`
- **Quote**: “The exact distance comparison makes `{q,w}` the minimum surviving pair, and its chord exceeds r.”
- **Stated label**: EMPIRICALLY VERIFIED finite pair control
- **Evidence present**: Independent checks recover `I={u,q,w}`, failure of V survival after deleting `{u,q}`, survival after deleting `{q,w}` and `{u,w}`, `dist(q,w)>r`, and `dist(q,w)<dist(u,w)`. The endpoint K4 row at `w` and mutual rows at `b,c` remain in the complete census.
- **Actual label**: EMPIRICALLY VERIFIED for the explicit carrier.
- **Verdict**: OK
- **Reason**: All three pairs in `I` are accounted for, with exact distance comparisons.

### F7: The singleton third-anchor trace and radius comparison are correctly bounded

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:89-91`; checker `:120-124,146-149`
- **Quote**: “The row at d0 meets I in exactly `{u}` ... and `dist(d0,u)² > r²`. Its radius therefore exceeds r. This finite control does not justify a radius decrease from the singleton trace alone.”
- **Stated label**: EMPIRICALLY VERIFIED finite singleton trace
- **Evidence present**: Independent checks give `actual[d0] ∩ I = {u}`, `d0` distinct from `O,V,b,c`, and positive exact sign for `d2(d0,u)-r²` (checker `:146-149`). The certificate records `third_anchor_trace: ["u"]` and `third_anchor_row_radius_exceeds_r: true`.
- **Actual label**: EMPIRICALLY VERIFIED finite trace and radius comparison; no descent theorem.
- **Verdict**: OK
- **Reason**: The note states the measured inequality and explicitly refuses the unsupported radius-decrease inference.

### F8: Global and total-source failures are accurately reported

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:124-145`; checker `:150-153,176-180`
- **Quote**: “The remaining 26 points have no actual blocker.”
- **Stated label**: EMPIRICALLY VERIFIED finite obstruction to total H
- **Evidence present**: Independent union of all five actual singleton-critical four-rows covers exactly 18 sources and leaves 26 (checker `:150-153`); the missing set includes `O,V,W,d0,d1`. The certificate lists 37 centers failing K4, `total_H_possible: false`, and `original_physical_source_instantiated: false` (`:176-180`).
- **Actual label**: EMPIRICALLY VERIFIED finite failure of global K4 and total H on this carrier.
- **Verdict**: OK
- **Reason**: The note correctly says the partial assignment cannot extend on this carrier and leaves the ordinary source requirements open. It makes no global closure claim.

### F9: The local selected-row mapping is checked and correctly scoped

- **Location**: `docs/audits/2026-09-06-exactfive-partial-h-control.md:93-122`; checker `:125-145,169-175`
- **Quote**: “These are finite counterparts of selected-row fields, not production objects.”
- **Stated label**: EMPIRICALLY VERIFIED finite selected-row counterpart
- **Evidence present**: The independent recomputation confirms `B0=E\{q}` at `O`, `B1=Kb` at `b`, and `B2=Lu` at `V` are four-member equal-radius rows; all omit `q,b`; `w` belongs exactly to `B0,B1`; and `|B1∩B2|=0≤2`. It confirms retained rows `E\{w}` at `O` and `Lq` at `V`, both omitting `w`, with overlap one and deletion survival. The partial blockers are `H(q)=d1`, `H(w)=b`, and fresh source `b` has actual blocker `H(b)=c`; the certificate records `production_structures_instantiated: false`.
- **Actual label**: EMPIRICALLY VERIFIED finite selected-row mapping only.
- **Verdict**: OK
- **Reason**: The mapping checks equal-radius, source omission, deletion survival, overlap, and center-role guards while explicitly declining to instantiate production source structures. The fresh source `b` is not conflated with its blocker center `c`.

### F10: The active plan paragraph matches the certified finite evidence

- **Location**: `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:382-393`
- **Quote**: “These finite selected-row facts do not instantiate production structures: global K4 fails at 37 centers and 26 sources lack any actual blocker.”
- **Stated label**: Planning statement based on finite empirical evidence
- **Evidence present**: The paragraph’s blocker assignments, singleton trace, radius comparison, selected-row mapping, 37 K4 failures, and 26 missing sources match the audited note and regenerated certificate. Its final sentence keeps the missing global source requirements open.
- **Actual label**: EMPIRICALLY VERIFIED finite control summarized in the plan; no closure claim.
- **Verdict**: OK
- **Reason**: The paragraph preserves the distinction between local selected-row counterparts and production physical structures, and it does not add a stronger mathematical label.

## Weasel words

No automatic proof-context weasel words or banned prose uses of “equivalent”
were found in the target note or checker.

## Scope conflation

No scope conflation remains. The note and plan distinguish the finite
partial-H assignment from a total source, global K4, cardinality minimality,
physical closure, and Lean formalization. They also state that the pair-trace
and singleton-trace consumers remain open.

## Lean sorry graph

Not applicable. This checkpoint contains a Python checker, a JSON certificate,
and prose; it claims no Lean theorem or promotion.

## Upgrade drift

No stronger label is introduced. The 44-point output remains finite empirical
evidence, and the checker’s summary explicitly records that no original
physical source is instantiated.

## Required before CERTIFIED

None for this finite local audit. Any use in the global or physical proof still
requires total H, global K4, cardinality/minimality custody, source assignment,
and any required Lean ingress evidence.
