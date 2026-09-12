# Math Skeptic Audit: exact-five minimum-pair dispatch

**Target**: the minimum-pair dispatch changes in
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`.
**Date**: 2026-09-12 UTC.
**Verdict**: NEEDS WORK for physical closure; ACCEPT conditional integration.
**Claims audited**: 5, limited to this change and its active-plan description.

## Scope and provenance

The user authorized preserving the initially distinct branch's minimum-pair
evidence and applying the existing closed-cap-five double-hit exclusion.
The source contract is the active exact-five physical/uniform closure plan,
sections 2 and 3. The ordinary physical theorem's statement is unchanged.
No new theorem admission, native computation, import, or external assumption
was introduced. The common-center route is unchanged.

- Base revision: `adaa7f34b2f6e45de2ba9823e3f06727dc733807`.
- Baseline source SHA-256:
  `9e18f9cb80d05cc093af0644debfe6c9f03d4f78c62ade057d4777dc3bc21462`.
- Reviewed source SHA-256:
  `7d9f54a5e662ad6468b653f8dd079f2d0f2099a1f2aa1e8ba54acf7f3aad2ca9`.
- Toolchain: `leanprover/lean4:v4.33.1`.
- Independent source reviewer: Avicenna,
  session `01a093b3-7121-7ea3-98e6-c3e16dee8918`.

The immediate root is `false_of_originalFrontierUniqueRadiusArm`; the
project's eventual publish target remains `Problem97.erdos97_rhs`.
The verification below checks the edited coordinator, not a new project-wide
publication build or kernel-spine refresh.

## Findings

### F1: Minimum-pair identity survives the initially distinct dispatch

- Location: `Rigid221Closure.lean:2090`, and the three internal helpers
  ending in `with_minimumPair`.
- Quote: `some ⟨hdistinct.some.minimalPair, hdistinct.some.source_eq⟩`.
- Evidence: the witness has type `Option {M // M.frontier = R.interior}`.
  It passes through the directed deletion and second-row replacement without
  changing `R.interior`. Reconstruction of `Rmin` at line 1799 typechecks.
- Verdict: OK, checked interface preservation. Compatibility callers use
  `none`; this code asserts no minimum-pair transport after common-center
  adaptive reselection.

### F2: The large-cap outcome retains both hits and excludes cap five

- Location: `Rigid221Closure.lean:1581`, especially lines 1626 and 1640.
- Quote: `exact Or.inl ⟨hcapSix, hq, hw, hcard, hwitness⟩`.
- Claim: under the minimum-aware source and normal form, the exhaustive
  fresh-row split returns either both endpoint hits with closed-cap size at
  least six, carrier size at least thirteen, and the triangle witness; or
  one of the two one-hit reselection records; or both omissions.
- Evidence: live Lean verification of
  `exactFiveDistinct_threeCenter_distinctFresh_minimal_transitionCases_with_hits`
  reports exactly `propext`, `Classical.choice`, and `Quot.sound`.
  The cap-five contradiction at line 1630 passes the actual minimum pair,
  `source_eq`, second-apex robustness, closed-cap cardinality, and both hits
  to `false_of_actualFreshBlocker_doubleHit_of_minimalPair_capFive`.
- Actual label: PROVEN, Lean-formalized, for this conditional split.
- Verdict: OK. Five points in the radius class alone do not meet the
  closed-cap-cardinality hypothesis.

### F3: The stronger split does not close a remaining physical outcome

- Location: `Rigid221Closure.lean:1808`.
- Quote: `all_goals` followed by
  `false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
- Evidence: every remaining arm still calls the original physical admission.
  The new branch facts remain in the local proof context but are not consumed
  by a geometric contradiction. The public transition theorem deliberately
  projects its original, weaker return type for compatibility.
- Actual label: the physical contradiction remains CONJECTURED/open.
- Verdict: no closure or kernel-frontier-reduction claim is supported.
  The cap-five combination is excluded from the stronger split's large arm;
  the entire double-hit arm is not eliminated.

### F4: Public interfaces and admissions are preserved

- Evidence: extracted public theorem signatures and all declaration docstrings
  compare identically with the base revision. The four literal `sorry`
  occurrences remain; no new admission was added.
- Verdict: OK, checked source/interface bookkeeping. This is not a proof of
  the admitted statements.

### F5: The full root remains admitted and inherits native evidence

- Evidence: fresh live verification of
  `Problem97.ATailFrontierLiveClosure.false_of_originalFrontierUniqueRadiusArm`
  reports `sorryAx`, the three standard axioms, and 3,957 generated names
  containing `_native.` (3,961 returned axiom names in total).
- Verdict: NEEDS WORK. This audit does not certify the inherited native
  implementations or promote the root. The stronger split's three-axiom
  result must not be presented as the root's trust result.

## Validation

- Full edited-file Lean LSP check: success, no partial elaboration, the same
  11 baseline diagnostics, and no new errors or warnings.
- Focused file check from `lean/`:
  `lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`
  exited 0, retaining only the existing warning classes.
- Live resolved references include the stronger split's call from the
  physical dispatcher at line 1805 and the minimum-aware residual's call
  from the root at line 2090.
- Public-signature and docstring comparisons against the base revision are
  empty; `git diff --check` passes.
- Independent source review accepts the conditional integration and requires
  the F3 qualification. Compilation and axiom probes were performed by the
  implementing agent; no independent publication verification is claimed.

## Required before physical closure

Supply checked geometric consumers for the larger-cap and omission outcomes,
and separately justify minimum-pair custody through common-center reselection.
The original physical admission must cease to be a dependency of the completed
route before that route can be called closed. A fresh aggregate/kernel-spine
and trust audit remains necessary for any later publication claim.
