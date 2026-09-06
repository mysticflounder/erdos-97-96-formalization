# Math Skeptic Audit: exactfive three-anchor mutual control

**Target**: `scripts/verify_exactfive_three_anchor_mutual_control.py`, `certificates/exactfive_three_anchor_mutual_control_20260906.json`, and source note `docs/references/exactfive-source-geometry-2026-09-05/three-anchor-mutual-local-control-pro-2026-09-06.md`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 9

## Summary

The byte-exact extracted checker replays against the retained 24-point
certificate. Its assertions use exact arithmetic in Q(√3), and approximate
values occur only in diagnostic output and exception text. Independent checks
found 1,000 random Q(√3) sign cases and arithmetic samples consistent with
high-precision evaluation, and all 2,024 cyclically ordered triples have
positive exact orientation.

The checker establishes the finite local control it claims: strict convexity,
an acute MEC triangle with exactly O,V,W on the boundary, strict cap sizes 6,7,8 with
W uniquely largest, exact rich classes at O,V,b,c, actual singleton criticality
at b and c, a bad V pair `{u,q}`, a minimum admissible long pair `{q,w}`, and
failure of global K4 and total H. The source note explicitly excludes a P97
counterexample and a complete physical source. It makes no freshness claim
relating c to an old H(q), so no physical source inference is smuggled into
this finite model.

## Findings

### F1: Scope and source extraction are accurate

- **Location**: source note `:1-9`; checker `:1-3,162-180`
- **Quote**: “This exact 24-point configuration is NOT a P97 counterexample and does NOT satisfy global K4, total H, or the complete physical source.”
- **Stated label**: EMPIRICALLY VERIFIED finite local diagnostic
- **Evidence present**: The checker is byte-identical to the first Python block in the note; the note and certificate both state 24 points and local-only status. Replay stdout is byte-for-byte identical to the retained certificate.
- **Actual label**: EMPIRICALLY VERIFIED on this exact finite configuration.
- **Verdict**: OK
- **Reason**: The evidence has an explicit finite scope and excludes the global and physical conclusions.

### F2: Q(√3) field operations and signs are exact

- **Location**: checker `:9-40`
- **Quote**: “Uses only the Python standard library; all arithmetic is in Q(sqrt(3)).”
- **Stated label**: Exact arithmetic
- **Evidence present**: Addition, multiplication, and division use rational coefficients with the relation `(a+b√3)(c+d√3)=(ac+3bd)+(ad+bc)√3`; division uses the exact norm denominator and rejects zero. The sign routine handles same-sign coefficients directly and opposite signs through `a²−3b²`. A 1,000-case random sign differential test and independent multiplication/division samples agreed with 180-digit mpmath evaluation.
- **Actual label**: EMPIRICALLY VERIFIED exact implementation behavior, with the field formulas justified by elementary algebra.
- **Verdict**: OK
- **Reason**: No floating-point approximation enters any assertion. The only float conversion is `approx`, used for diagnostics.

### F3: Convexity, MEC, acute support, and cap structure are checked

- **Location**: checker `:86-120`; source note `:7`
- **Quote**: “A strict supporting line for every consecutive edge certifies the entire listed cyclic order and strict convex independence, not just local turns.”
- **Stated label**: EMPIRICALLY VERIFIED finite geometry
- **Evidence present**: All 528 consecutive-edge/other-point orientations have positive exact sign. The circumdisk has exact equal squared distances at O,V,W, nonnegative slack everywhere, and zero slack only at those three points. All three support-triangle inner products are positive, the circumcenter lies inside the triangle, and open cap sets partition the 21 non-boundary points with W uniquely largest. An independent replay checks all `C(24,3)=2024` cyclic triples with positive exact orientation.
- **Actual label**: EMPIRICALLY VERIFIED for the named 24-point carrier.
- **Verdict**: OK
- **Reason**: The supporting-edge test is stronger than local-turn checks, while the MEC and cap assertions use exact field signs. The certificate records cap cardinalities O=6, V=7, W=8 and boundary O,V,W.

### F4: Full distance classes at O,V,b,c and the three-anchor set are exact

- **Location**: checker `:122-145`; certificate `rich_rows`, `E`, and `I`
- **Quote**: “assert rich('O')==[E]” and “assert {frozenset(x) for x in rich('V')}=={frozenset(Lu),frozenset(Lq)}”.
- **Stated label**: Exact five-point first class and two rich V classes, with unique rich rows at b,c
- **Evidence present**: Exact distance dictionaries group all points by Q(√3) squared distance. The checker asserts O's sole rich class E of size five, V's two four-classes Lu and Lq, c's unique Kc, b's unique Kb, and no rich rows at the other 20 centers. It also asserts `I=E∩caps[O]={u,q,w}`, `Kc∩caps[O]={q,w}`, c is in O's cap, and b is outside it.
- **Actual label**: EMPIRICALLY VERIFIED exact finite class census.
- **Verdict**: OK
- **Reason**: The class map uses exact field values as keys, so distinct classes cannot be merged by numerical rounding.

### F5: Actual singleton criticality is established at b and c

- **Location**: checker `:146-172`; source note `:5,161-172`
- **Quote**: “Actual single-deletion criticality at b and c is verified for each row member, not merely advertised as a selected four-subset.”
- **Stated label**: EMPIRICALLY VERIFIED actual local blocker rows
- **Evidence present**: For each member of Kb and Kc, the checker verifies that after deleting that member no distance class at the same center has size at least four. It identifies exactly O,V,b,c as rich centers, then exactly b,c as non-robust four-row centers, and verifies neither actual row contains u.
- **Actual label**: EMPIRICALLY VERIFIED finite singleton criticality.
- **Verdict**: OK
- **Reason**: The test quantifies over all row members and all ambient classes at each selected center, so it checks actual criticality rather than selected-subset membership alone.

### F6: The bad pair and minimum admissible long pair are correctly derived

- **Location**: checker `:135-155,157-160`; certificate fields `V_bad_pair`, `minimum_admissible_pair`, `r_squared`, `chord_qw_squared`
- **Quote**: “assert not V_survives({'u','q'})” and “assert V_survives({'q','w'}) and V_survives({'u','w'})”.
- **Stated label**: EMPIRICALLY VERIFIED bad pair and minimum admissible pair
- **Evidence present**: E∩cap[O] is exactly `{u,q,w}`. Deleting u,q destroys both V four-classes; deleting q,w or u,w preserves one. The exact comparisons give `r²=13/4`, `dist(q,w)²=4>r²`, `dist(u,w)>dist(q,w)`, and `dist(u,q)<r`.
- **Actual label**: EMPIRICALLY VERIFIED finite pair control.
- **Verdict**: OK
- **Reason**: All three unordered anchor pairs are covered by explicit deletion-survival assertions and exact distance comparisons; q,w is the shortest surviving pair and is long.

### F7: Global K4 failure, total-H failure, and missing H(u) are accurately bounded

- **Location**: checker `:155-180`; source note `:5-7`
- **Quote**: “The remaining centers have no rich row. In particular no actual blocker of u exists: its only rich incidence is at fully single-deletion-robust V.”
- **Stated label**: EMPIRICALLY VERIFIED non-global local diagnostic
- **Evidence present**: Only O,V,b,c have rich classes; O and V survive every singleton deletion, while b,c are actual non-robust rows. The certificate records `global_K4=false`, `total_H_possible=false`, and `missing_actual_blocker_for_third_anchor='u'`.
- **Actual label**: EMPIRICALLY VERIFIED finite failure of global K4 and total H.
- **Verdict**: OK
- **Reason**: Twenty centers lack any rich class, O and V supply no singleton-critical row, and no actual row contains u. These facts preclude a total actual critical-shell system for this carrier.

### F8: The physical-source guard is preserved

- **Location**: source note `:5-9`; checker `:157-172`
- **Quote**: “does NOT satisfy ... the complete physical source.”
- **Stated label**: Explicit non-claim about physical source and freshness
- **Evidence present**: The source note provides no old H(q), no source assignment, no global minimality, and no assertion that c is strictly fresh relative to an old row. The checker only establishes local criticality of rows at b and c and the absence of an actual row for u.
- **Actual label**: Correctly scope-bounded finite evidence.
- **Verdict**: OK
- **Reason**: The model cannot justify a physical `c`-freshness inference, and the note does not make one. No complete physical packet or Lean promotion is claimed.

### F9: The source note's evidence labels are accurate

- **Location**: source note `:7-9,173-192`
- **Quote**: “The executed checker passed all 528 strict supporting-edge tests and all class, disk, deletion, cap, and non-globality checks.”
- **Stated label**: Exact arithmetic finite control, with approximate diagnostics
- **Evidence present**: The retained script and certificate replay exactly; the note identifies the standard-library checker, exact Q(√3) arithmetic, 24-point scope, and local-only status.
- **Actual label**: EMPIRICALLY VERIFIED finite control.
- **Verdict**: OK
- **Reason**: The note does not conflate diagnostics with assertions or finite evidence with a global theorem. The consult identifier and report hash are provenance metadata, not mathematical proof claims.

## Weasel words

No automatic proof-context weasel words were found in the checker or source
note. The word “certifies” occurs in a comment describing the supporting-edge
criterion whose exact assertions are present.

## Scope conflation

The source explicitly separates local exact geometry from global K4, total H,
the complete physical source, and P97 counterexample status. No scope
conflation remains.

## Lean sorry graph

Not applicable. This lane contains a Python checker and a source note only; no
Lean promotion is claimed.

## Upgrade drift

No stronger formal or global label is introduced. The note and certificate stay
within EMPIRICALLY VERIFIED finite-control scope.

## Required before CERTIFIED

None for this finite-control audit. Any physical use still requires separately
authenticated source assignments, freshness/row transport, global K4, total H,
and Lean ingress evidence.
