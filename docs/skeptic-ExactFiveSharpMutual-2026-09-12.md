# Math Skeptic Audit: ExactFiveSharpMutual

Target: `ExactFiveMutualReturnChord.lean`, `MutualSelectedRowChord.lean`,
and the new guarded consumer in `FrontierLiveClosure/Rigid221Closure.lean`.
Date: 2026-09-12. Verdict: CERTIFIED for the three bounded claims below.
Claims audited: 3 — normalized height, selected-row radius, guarded exclusion.

## Summary

The three claims have clean live Lean checks, core-axiom-only dependency
audits, and independent semantic review. Scope is the bounded mutual-row
radius theorem and its guarded consumer, not the P97 root.

## Claim and source custody

Let O be the first opposite apex and let distinct q,w belong to its
selected radius-r class and strict first cap. Let Kc and Kb be actual
selected four-classes centered at c and b, with c in A and c distinct
from O. Assume q,w,b belong to Kc and q,c belong to Kb. The Lean-formalized
conclusion is

ρ < (√3 − 1)r, where ρ is the radius of Kc.

The incidences remain explicit hypotheses. No theorem in this lane
asserts that arbitrary endpoint and fresh blocker rows are mutual.
The conclusion requires neither a minimum pair nor four interior anchors.

The normalized proof extends `ExactFiveMutualReturnChord.lean`; its
source adapter is
`MutualSelectedRowChord.radius_lt_sqrt_three_sub_one_mul_of_mutual_selectedRows`.
The original short-chord theorem and its public signature are preserved.

## Mathematical checks

The first-apex strict-cap inner-product theorem gives outer normalized
height h > 1. The new bisector center has height 0 < k ≤ 1 on the
other side of the endpoint chord. These facts come from the actual
source geometry, not from an assumed short endpoint chord.

The equal-radius incidences force two equilateral placements of b.
The upper placement contradicts cap separation or convex independence.
In the lower placement, k ≥ 1/√3 places b in the closed triangle Oqw,
contradicting convex independence. For k < 1/√3, the Lean proof writes b
as an affine combination of q,c,O. The coefficients at q and O are
positive, so the coefficient at c must be negative. This gives
h + (√3h + 1)k < √3 and hence k < 2 − √3. Squaring this positive bound yields

1 + k² < 2(√3 − 1)².

The outer normalized squared radius is 1 + h² > 2; similarity scaling
then gives the claimed strict radius inequality. No numerical oracle,
finite search, or external solver certificate is used in this argument.

This follows the geometric argument in the
[sharp mutual and third-anchor note](audits/2026-09-06-exactfive-sharp-mutual-third-anchor.md).
Source SHA-256:
`2af6aca01482aead3c6a4e557d4152684eb6af6dda9b492fd1fe4485127ef482`.
Only the radius inequality is being promoted here. That note's other
two sharp metric conclusions are not claimed as new Lean declarations.

## Immediate consumer and exhaustive fallback

The private root helper
`false_of_exactFiveDistinct_mutualDoubleHit_highRadius` in
`FrontierLiveClosure/Rigid221Closure.lean` uses the actual fresh row and
the normal form's old blocker row. The retained endpoint is q or w;
both orientations are handled explicitly. Full first-apex deletion
robustness supplies c distinct from O.

The initially distinct, minimum-custody both-hit dispatch retains the
four-interior mutual consumer, then splits on both cross-incidences
and ρ ≥ (√3 − 1)r. The positive branch consumes the new inequality.
The complement branch retains the previous physical terminal. The helper
itself does not need minimum custody, but this integration does not claim
to change dispatch paths that lack that witness.

Mutual rows below the new threshold, non-mutual rows, one-hit and zero-hit
rows, and the separate common-center route remain open. A strict
radius bound alone does not construct a fresh dependent source packet
or prove that repeated reselection terminates.

## Reuse preflight

Candidate: sharp mutual selected-row radius bound. Immediate consumer:
the explicit high-radius guard described above. Indexed search of
`erdos-97-96-formalization-lean` for
`mutual blocker sharp bound sqrt three radius angle 150` returned
common-center collision theorems, not this metric bound. The index
reported source revision `b6f88697b` and 2026-09-12 17:18 UTC freshness.
The missing result was the sharp inequality under the actual row
incidences; no returned collision theorem supplies it.

A separate bounded non-mutual audit found that the existing double-hit
producer gives endpoint hits, cardinality lower bounds, and an omitted
triangle vertex, but neither cross-incidence. One-hit reselection does
not consume a both-hit row. This is a missing-antecedent finding, not a
refutation of the non-mutual route.

The parallel three-anchor pair-trace investigation likewise found no
immediate contradiction consumer. A smaller row radius does not supply a
shorter admissible anchor pair: joint-deletion admissibility is a separate
obligation. No new third-anchor deduction is promoted by this lane, and
failure to find a consumer does not refute a full-source argument.

## Verification record

- Live LSP checking of both changed proof modules returned no diagnostics.
- Live LSP checking of the entire edited `Rigid221Closure.lean` returned
  success, no errors, no failed dependencies, and ten existing warnings.
- `lean_verify` for the three named claims below returned exactly
  `propext`, `Classical.choice`, and `Quot.sound`, with no warnings.
- The normalized lemma has a local 400000-heartbeat budget for its two
  affine placement cases. The final polynomial steps use explicit small
  hypothesis sets. This changes elaboration resources, not proof trust.
- The attempted two-module `lake-build` exited on a live foreign build
  lock before compiling either target. The owner was notified in project
  conversation message 17265. No concurrent raw Lean compile was run.
  Validation here is the permitted live LSP path, not a successful build.
- No full project build, solver/certificate production, or headline
  publication gate is claimed.

Toolchain: `leanprover/lean4:v4.33.1`; mathlib revision
`0df444a360eaa60ab8c11dca51a86af692955474` from `lean/lake-manifest.json`.
Lane base: `b6f88697bd39487ff8b0d7cef4a8478abfc290dc`.
Intended final consumer: `Problem97.erdos97_rhs`; open physical anchor:
`Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_threeCenter_distinctFresh_physical`.
Reachability of the new helper does not certify that admitted final consumer.

## Findings

### F1: Normalized height bound

Location: `lean/Erdos9796Proof/P97/ATail/ExactFiveMutualReturnChord.lean:199`.
Quote: `k < 2 - s := by`.
Evidence: `Problem97.ExactFiveMutualReturnChord.normalized_mutual_return_height_lt`,
live Lean check and three-core-axiom audit. Actual label: PROVEN,
Lean-formalized, under the displayed geometric and affine hypotheses.
Verdict: OK. Independent review found no extra minimum or cardinality
hypothesis in the argument.

### F2: Actual selected-row radius bound

Location: `lean/Erdos9796Proof/P97/ATail/MutualSelectedRowChord.lean:478`.
Quote: `Kc.radius < (Real.sqrt 3 - 1) * r := by`.
Evidence: `Problem97.MutualSelectedRowChord.radius_lt_sqrt_three_sub_one_mul_of_mutual_selectedRows`,
live Lean check and three-core-axiom audit. Actual label: PROVEN,
Lean-formalized. Verdict: OK. Both mutual incidences and the actual
strict-interior pair remain explicit; similarity scaling preserves
the intended radius comparison.

### F3: Guarded root exclusion

Location: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean:1815`.
Quote: `(H.selectedAt fresh hfreshA).toCriticalFourShell.radius) : False := by`.
Evidence: `Problem97.ATailFrontierLiveClosure.false_of_exactFiveDistinct_mutualDoubleHit_highRadius`,
live Lean check and three-core-axiom audit. Actual label: PROVEN,
Lean-formalized. Verdict: OK. The exhaustive dispatch supplies the two
cross-incidences and high-radius guard; both retained-endpoint orientations
are handled. Independent review confirmed that the complement still
uses the prior physical terminal.

## Scope conflation and Lean sorry graph

No new `sorry`, named axiom, or `native_decide` was added. The four literal
root sorries remain at lines 120, 453, 1384, and 1709. The broader
`false_of_originalFrontierUniqueRadiusArm` audit still reports 3961 axiom
names: the three standard axioms, `sorryAx`, and 3957 names containing
`_native.`. That unchanged count is not certification of those computations
or of the headline theorem. The new consumer is certified only under its
guard, not by inheriting the enclosing admitted proof's conclusion.

## Upgrade drift and required broader work

The plan upgrades only the sharp radius bound and its guarded integration
from paper geometry to Lean-formalized proof. The source-checked
declarations and independent semantic review support that upgrade.
The other sharp metrics, remaining physical cases, and termination remain
outside this certification. No prohibited proof-context wording was found
in the new claims; the review's complement-branch clarification is applied.

## Audited source bytes

SHA-256 before the scoped commit:

```text
ExactFiveMutualReturnChord.lean b13cd281bec4bc579b7d3505e4f0325601c8a7cb9b5cac510d95e1433e249151
MutualSelectedRowChord.lean 974b0da1d48e07c257a21453f0982e03ec2952accc7dc646471adee95da3a7db
FrontierLiveClosure/Rigid221Closure.lean 70573e1623eada0dffd35edee8ee4d36ffaf244ec49f5117339ef565fe6d0d45
```
