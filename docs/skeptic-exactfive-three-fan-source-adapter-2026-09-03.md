# Skeptic audit: exact-five three-fan source adapter

Date: 2026-09-03

Verdict: **CERTIFIED**, for the stated conditional source subcase only. The
adapter is a kernel-checked consequence of its hypotheses, and the plan keeps
the broad endpoint open. It is not yet wired to that endpoint.

## Audited state

- Lean source:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctThreeFanCollision.lean`,
  SHA-256 `5f044dfcdec706b07a036f85a49a628c073b5c798ec6b691d76912b99454ef17`.
- Plan: `docs/plans/2026-09-03-exactfive-three-fan-source-adapter.md`,
  SHA-256 `703ae2bc2402d9696a29797fd8c2e70fc8928e369c44dd3a3240e0cbe9fe7ab2`.
- Lane base: `510233b07db60713e32dca6589f38b1d57c43f68`.
- Review HEAD: `7cdcaef62409b62c92acdc94b4874731918dbfd5`.
- Toolchain: Lean 4.27.0, commit
  `db93fe1608548721853390a10cd40580fe7d22ae`.

No audited dependency named below changed between the lane base and review
HEAD.

## Claim audit

### C1. Row memberships yield exactly the six required distances: certified

The plan says at lines 15--20:

> The packet supplies the retained point in all three rows. The adapter also
> takes explicit first-apex memberships in the blocker and second-apex rows.

The source maps every membership through the radius of its own row:

- lines 39--41: `a,c₁ ∈ row₀` gives `dist O a = dist O c₁`;
- lines 42--44: `s,a ∈ row₀` gives `dist O s = dist O a`;
- lines 45--47: `c₂,a ∈ row₀` gives `dist O c₂ = dist O a`;
- lines 48--50: `a,O ∈ row₁` gives `dist c₁ a = dist c₁ O`;
- lines 51--53: `s,O ∈ row₁` gives `dist c₁ s = dist c₁ O`;
- lines 54--56: `O,a ∈ row₂` gives `dist c₂ O = dist c₂ a`.

Here `a ∈ row₀` is `surface.a_mem_row₀`, while `a ∈ row₁,row₂` are the
packet fields `a_mem_row₁` and `a_mem_row₂`. No support-name equality or
generated profile alias is smuggled into these steps.

### C2. The three-fan theorem and convexity receive the right data: certified

Lines 57--60 instantiate
`threeFan_signedArea2_eq_zero_of_distinct` with
`B=c₁`, `O=O`, `A=a`, `S=s`, and `Q=c₂`. Its three distinctness inputs are
supplied as follows:

- `c₁ ≠ O` from `surface.O_ne_c₁.symm`;
- `a ≠ s` from the explicit hypothesis `ha_ne_s`;
- `c₁ ≠ c₂` from `surface.c₁_ne_c₂`.

The resulting statement is exactly `signedArea2 s O c₂ = 0`. Lines 61--68
then provide `s,O,c₂ ∈ D.A`; derive `s ≠ O` from the first row's
`center_not_mem`; use the explicit `s ≠ c₂` and structural `O ≠ c₂`; convert
zero signed area to collinearity; and apply
`ConvexIndep.not_three_collinear` in the same point order. There is no missing
distinctness or carrier-membership premise.

### C3. Final-constructor availability: certified and precisely limited

The plan says at lines 15--18:

> these are retained by the final continuation constructor but are not fields
> of the packet itself.

In `RobustApexFourIncidenceCyclicReduction.lean:101`, the constructor
`firstCenter_not_mem_secondRow` exposes all three adapter prefix inputs
`hc₁K₀`, `hOK₁`, and `hOK₂`. The preceding constructor exposes `hOK₁` but has
`O ∉ row₂` instead of `hOK₂`; the first two constructors expose still shorter
prefixes. Thus a case split on `incidence.continuation` makes both `hOK₁` and
`hOK₂` available only in the final branch, exactly as the plan states.

The final constructor's `c₁ ∉ row₂` fact and common-deletion packet are not
used by this adapter. That is harmless strengthening of the caller context,
not a hidden assumption in the theorem.

### C4. Exact missing source producer: identified

Specializing the broad endpoint's packet at
`Rigid221Closure.lean:1571--1576`, the final continuation branch still does not
provide:

```text
S.oppApex2 ∈ incidence.surface.row₀.support

∃ s,
  s ∈ incidence.surface.row₀.support ∧
  s ∈ incidence.surface.row₁.support ∧
  normalForm.retained ≠ s ∧
  s ≠ S.oppApex2
```

The packet provides only the retained point as a common support of the first
two rows; that point cannot serve as `s` because the adapter requires it to be
distinct from the retained point. Neither the packet fields nor any of the
four continuation constructors produce the second-apex membership in the
first row or this second shared support. These are the first missing
antecedents for live wiring.

### C5. Broad-closure boundary: certified

The plan says at lines 42--45:

> It does not prove that the subcase holds in every continuation constructor,
> classify the complementary source positions, or close the broad endpoint by
> itself.

That boundary is accurate. The broad theorem
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` still has
its admitted proof at `Rigid221Closure.lean:1578`. No current Lean module
imports this new adapter, and no current declaration calls
`false_of_threeFan_shared_support`. The plan's “immediate consumer” at lines
33--34 is therefore an intended branch consumer, not a present call-graph
edge. This checkpoint proves one conditional incidence subcase and causes no
measured spine reduction by itself.

## Validation evidence

- Focused source elaboration with `lake env lean` on
  `Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctThreeFanCollision.lean`:
  exit 0 in 5.46 seconds with no diagnostics.
- A second elaboration with `#print axioms` appended through standard input:
  the adapter depends only on `propext`, `Classical.choice`, and `Quot.sound`.
- The source scan found no `sorry`, `sorryAx`, named `axiom`, native reduction,
  `unsafe`, `implemented_by`, `extern`, or `partial`; no line exceeds 100
  characters.

No aggregate build, fresh proof-spine refresh, or publication gate was run.
Those gates become relevant only after a source split supplies the two missing
antecedents and a real consumer imports and applies this adapter.
