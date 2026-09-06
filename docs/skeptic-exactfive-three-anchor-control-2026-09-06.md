# Math Skeptic Audit: exactfive three-anchor control

**Target**: `scripts/verify_exactfive_three_anchor_control.py`, `certificates/exactfive_three_anchor_control_20260906.json`, `docs/audits/2026-09-06-exactfive-three-anchor-control.md`, and plan section `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:302-347`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 11

## Summary

The retained replay passes and supports finite interval evidence for the named
15-point configuration. The interval operations, Machin bounds, Taylor
enclosures, convex-hull checks, MEC checks, cap counts, radius-class checks,
and the 13 non-rich-center overlap bounds survived focused differential tests.
The final verifier also computes singleton robustness and all three interior
pair deletion outcomes, so the bad-pair and minimum-admissible-pair fields are
derived checks rather than constants.

The status and scope exclusions correctly avoid presenting this as a Lean
proof, a global K4 configuration, or a total critical-shell construction. The
updated proof note's barycentric MEC argument, exact identity labels, and
no-M44 deduction are mathematically aligned with the final inward-shifted
construction. Plan section 3c records the control as finite evidence and keeps
the full physical closure open.

## Findings

### F1: Finite scope is stated accurately

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:4-8`, `certificates/exactfive_three_anchor_control_20260906.json:172,129-135`
- **Quote**: “This is finite computational evidence, not a Lean proof or a global-K4 model.”
- **Stated label**: EMPIRICALLY VERIFIED
- **Evidence present**: Replay of the verifier against the retained certificate; the certificate records 15 points and explicit exclusions for global K4, total `CriticalShellSystem`, global minimality, Lean proof, and physical terminal reduction.
- **Actual label**: EMPIRICALLY VERIFIED on this exact 15-point construction.
- **Verdict**: OK
- **Reason**: The script and certificate give an explicit finite scope and do not claim a general theorem.

### F2: Dyadic interval arithmetic is outward rounded

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:35-71`
- **Quote**: “All decisions use integer endpoints in units of 2**-160.”
- **Stated label**: EMPIRICALLY VERIFIED interval bounds
- **Evidence present**: `rational` uses floor/ceiling endpoint conversion; multiplication enumerates all four endpoint products; division rejects a denominator containing zero and enumerates endpoint quotients. A 2,000-case exact-rational differential probe covering negative products and both signs of nonzero denominators found no containment failure.
- **Actual label**: EMPIRICALLY VERIFIED implementation behavior, with the endpoint formulas mathematically sound.
- **Verdict**: OK
- **Reason**: Python floor division supplies a lower floor for negative values, `ceildiv` supplies an upper ceiling for positive denominators, and monotonicity on a denominator interval of one sign makes endpoint enumeration sufficient.

### F3: Machin and Taylor enclosures are sound for the used angles

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:84-112`
- **Quote**: “Alternating series: consecutive partial sums bracket arctan(1/n).”
- **Stated label**: EMPIRICALLY VERIFIED trigonometric enclosures
- **Evidence present**: The 100-term alternating partial sum uses the next term with denominator `201*n**201`; Machin's identity is applied with 5 and 239. The Taylor loops contain all terms through degree 139 for sine and 138 for cosine, and use the generic remainder bounds `4**140/140!` and `4**139/139!` under `|x| < 4`. The computed PI interval contains high-precision π and lies below 4. A 220-digit mpmath differential check for representative negative, reduced, boundary, and fractional angles found every sine/cosine interval containing the reference value.
- **Actual label**: EMPIRICALLY VERIFIED numerical enclosure for the finite inputs, resting on the stated alternating-series and Taylor-remainder facts.
- **Verdict**: OK
- **Reason**: The next omitted alternating term and the Taylor theorem degree bounds are used with outward rational rounding; no floating-point value enters a decision.

### F4: Convexity, disk custody, acute triangle, and (5,8,5) caps are checked

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:176-220`
- **Quote**: “All other disk inclusions, including P,Q,R, are strict.”
- **Stated label**: EMPIRICALLY VERIFIED finite geometry
- **Evidence present**: A floating-point centroid angle only proposes an order; every edge/other-point determinant is then required to have a strictly positive dyadic lower endpoint. The script checks strict inclusion of all 12 non-boundary points in the circumdisk, positive inner products at O,V,W, strict cap side signs, and cap interiors `(3,6,3)`, giving closed cap cardinalities `(5,8,5)`. P,Q,R are constructed by an inward factor `999/1000`, so they are strictly inside the disk; O,V,W boundary equalities follow from the circumcenter formula.
- **Actual label**: EMPIRICALLY VERIFIED for the named construction, with analytic exact-boundary identities.
- **Verdict**: OK
- **Reason**: The floating-point order cannot turn a failed exact determinant into a pass; it can only select which exact order is tested. All inequality decisions use integer endpoints, and strict margins are retained.

### F5: MEC boundary and M44 checks cover the final construction

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:222-249`, `certificates/exactfive_three_anchor_control_20260906.json:2-9,97-109`
- **Quote**: “Exhaust all triples of the exactly three MEC-boundary points.”
- **Stated label**: EMPIRICALLY VERIFIED boundary-support census
- **Evidence present**: The strict disk test identifies O,V,W as the only boundary points, and the exhaustive combination over that three-point boundary checks its sole triple. The triangle is acute, has closed-cap counts `[5,8,5]`, contains V and W, and has fewer than two size-4 caps. The certificate records one checked nonobtuse supporting triangle and no M44 supporting triangle.
- **Actual label**: EMPIRICALLY VERIFIED on the final 15-point carrier.
- **Verdict**: OK
- **Reason**: With P,Q,R moved strictly inside, the boundary triple enumeration is exhaustive for the current construction. No claim about a different boundary set is retained.

### F6: O's exact five-class, V's two four-classes, and the 13 other-center bounds are supported

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:251-271`, `certificates/exactfive_three_anchor_control_20260906.json:33-53,112-127`
- **Quote**: “Identity is supplied by the construction; interval overlap is only a consistency check of its encoding.”
- **Stated label**: EMPIRICALLY VERIFIED exact radius-class control
- **Evidence present**: The construction gives O's unit class `{V,W,a,u,v}` and V's classes `{u,b1,b2,b3}` and `{v,c1,c2,c3}` through the listed circle identities. Interval separation excludes nonmembers and separates the two V radii. `max_overlap` uses closed-interval endpoint ordering (starts before ends at equal endpoints), and the source now asserts `<= 2` for every non-rich center: W,a,u,v,b1,b2,b3,c1,c2,c3,P,Q,R.
- **Actual label**: EMPIRICALLY VERIFIED for the finite carrier, with exact equalities supplied analytically by the displayed parametrizations.
- **Verdict**: OK
- **Reason**: If four exact distances were equal, their enclosing intervals would share that value and produce overlap at least four. The rich classes are handled separately by their exact identities; the strengthened assertion records the observed two-hit upper bound.

### F7: Singleton robustness and all three interior pair outcomes are checked

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:279-305`, `certificates/exactfive_three_anchor_control_20260906.json:55-89,150-157`
- **Quote**: “assert short_pairs == bad_pairs == [[\"u\", \"v\"]]”.
- **Stated label**: EMPIRICALLY VERIFIED unique bad pair and minimum admissible pair
- **Evidence present**: The script enumerates every singleton deletion for O and V, computes all three unordered pairs in the strict O-cap intersection, records V-class sizes after each deletion, tests V K4 survival, tests each chord against the O-radius, and computes the minimum among the two surviving admissible pairs. The certificate records `(3,4)` and `(4,3)` for the two admissible pairs and `(3,3)` for `{u,v}`.
- **Actual label**: EMPIRICALLY VERIFIED on the named finite class data.
- **Verdict**: OK
- **Reason**: The bad pair and admissible pairs are generated by explicit finite assertions. The ambient non-rich classes have already been bounded above by two (in particular, below four), so deletion cannot create an omitted K4 class.

### F8: Global and Lean proof boundaries are accurate

- **Location**: `scripts/verify_exactfive_three_anchor_control.py:307-334`, `certificates/exactfive_three_anchor_control_20260906.json:129-135,172`
- **Quote**: “PASS: finite interval-verified local control; global K4 fails”.
- **Stated label**: Finite local result with explicit exclusions
- **Evidence present**: The script identifies 13 non-rich centers with multiplicity at most two and records exclusions for global K4, total critical-shell data, global minimality, Lean proof, and physical terminal reduction.
- **Actual label**: EMPIRICALLY VERIFIED local obstruction/control only.
- **Verdict**: OK
- **Reason**: The output does not promote the finite configuration to a global counterexample or a proof of the exact-five theorem.

### F9: The analytic MEC uniqueness and no-M44 argument are sound

- **Location**: `docs/audits/2026-09-06-exactfive-three-anchor-control.md:85-122`
- **Quote**: “For any candidate disk center Z, the weighted average of the three squared distances to O,V,W is ‖C‖² + ‖Z−C‖².”
- **Stated label**: PROVEN, pen-and-paper for MEC uniqueness and no-M44; EMPIRICALLY VERIFIED for strict disk/cap inputs
- **Evidence present**: The note gives positive weights `λO = cos(80)/(1+cos(80))` and `λV = λW = 1/(2(1+cos(80)))`, whose barycenter is C. The weighted-square identity yields the lower bound and equality condition for every enclosing disk. The verifier checks O,V,W boundary identities, all other points strictly inside, and the sole boundary triple's `(5,8,5)` caps.
- **Actual label**: PROVEN pen-and-paper for the lower-bound/uniqueness deduction, conditional on the verified finite inclusions; finite empirical evidence for the coordinate inequalities.
- **Verdict**: OK
- **Reason**: The weights are positive because cos(80°)>0, sum to one, and give C. The weighted identity implies every enclosing disk has radius at least ‖C‖ and equality only at center C. Since only O,V,W are on that disk boundary, any eligible nonobtuse support triangle uses those three vertices, so its cap counts are `(5,8,5)` and cannot be M44.

### F10: Evidence labels and source custody in the proof note are accurate

- **Location**: `docs/audits/2026-09-06-exactfive-three-anchor-control.md:18-28,124-162,181-202`
- **Quote**: “Evidence status: EMPIRICALLY VERIFIED, finite interval control.”
- **Stated label**: Mixed finite computational evidence, pen-and-paper identities, and explicit non-claims
- **Evidence present**: The note identifies the verifier and retained certificate, states the 15-point scope, distinguishes exact trigonometric identities from interval inequalities, and its final table separates PROVEN pen-and-paper deductions, EMPIRICALLY VERIFIED finite checks, and unclaimed global contradiction.
- **Actual label**: Correctly mixed and scope-bounded.
- **Verdict**: OK
- **Reason**: The note does not promote the finite construction to a Lean result, a global K4 countermodel, or an exact-five contradiction. The notation mapping between note names `(p,q,x_i,y_i)` and verifier names `(u,v,b_i,c_i)` is explicit, so the source coordinates and certificate fields are aligned.

### F11: Plan section 3c uses the control at the correct proof boundary

- **Location**: `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:302-347`
- **Quote**: “These are finite interval-verified properties with explicit circle identities; no Lean promotion is claimed.”
- **Stated label**: Finite diagnostic/control input to the open physical proof
- **Evidence present**: The plan records the short-pair implication audit, the three-anchor control, failure of global K4 at the other thirteen centers, absence of actual critical rows/total H, and the need for additional global hypotheses or a long-pair consumer.
- **Actual label**: Correctly scoped finite obstruction/control.
- **Verdict**: OK
- **Reason**: The paragraph uses the control to reject local-premise sufficiency while preserving the distinction between this finite configuration and the missing full-source physical closure. It does not claim that the control refutes the conditional cap-five consumer.

## Weasel words

No automatic proof-context weasel word was found in the target script or
certificate. The source comments identify finite checks and exact construction
identities without unsupported proof shortcuts.

## Scope conflation

The script and proof note distinguish finite interval evidence, pen-and-paper
identities, Lean proof, and global K4 data. Plan 3c preserves the same scope
boundary. No material scope conflation remains in the final bytes.

## Lean sorry graph

Not applicable. The target is Python plus a JSON certificate and claims no Lean
promotion.

## Upgrade drift

No base-commit upgrade was supplied for these target files. The current labels
remain finite computational evidence or explicitly cited pen-and-paper
deductions rather than a stronger formal or general label.

## Required before CERTIFIED

None for this finite audit. Any future use in a global proof still requires the
excluded global K4, total critical-shell, minimality, and Lean ingress evidence.
