# Math skeptic audit: exact-five three-fan intersection normal form

Date: 2026-09-03

Target namespace:
`Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuationPacket`.
Declaration: `threeFan_shared_support_intersection_normalForm`.

Narrow verdict: **CERTIFIED** for the theorem at the audited source hash and
under its explicit hypotheses. This audit makes no claim that the admitted
exact-five endpoint is closed or that the theorem is on its current call graph.

## Audited state

- Audit lane base: `a5ce524283a484d4d19dffabc01b19b6e113f587`.
- Review HEAD: `aa387b8a0eff35b0faadc3a7ac3e67b528a7ba0b`.
- Source directory:
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure`.
- Source file: `ExactFiveDistinctThreeFanCollision.lean`.
- Source SHA-256:
  `617d5920ae3fa39f6f782e3419642132fe4afa72f416464912ef5f77b18c5d2f`.
- Toolchain: `leanprover/lean4:v4.27.0`, Lean commit
  `db93fe1608548721853390a10cd40580fe7d22ae`.

## Findings

### F1: The conclusion parses as the intended three-way outcome

- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Evidence**: The unparenthesized disjunction at source lines 102-104 parses
  right-associatively as `A ∨ (B ∨ C)`, where:

  - `A` says `c₂` is absent from row 0;
  - `B` says the row-0/row-1 intersection is `{a}`; and
  - `C` says that intersection is `{a, c₂}`.
- **Reason**: The compiled tactic paths confirm this parse. `right; right`
  enters `C`, `right; left` enters `B`, and the last branch proves `A`
  directly.

### F2: Both finite-set identities are proved in both directions

- **Actual label**: PROVEN — Lean-formalized.
- **Verdict**: OK.
- **Evidence**: Source lines 105-136 use `Finset.ext` and explicit membership
  introductions in each branch.
- **Reason**: Under `c₂ ∈ row₀`, the earlier restriction places every common
  point in `{a, c₂}`. If `c₂ ∈ row₁`, the reverse containment uses the packet's
  memberships of `a` and the two case hypotheses for `c₂`, yielding exactly
  `{a, c₂}`. If `c₂ ∉ row₁`, the `c₂` alternative contradicts the common-point
  row-1 membership, while `a` belongs to both rows, yielding exactly `{a}`.
  The proof remains sound if `{a, c₂}` collapses to a singleton; it does not
  silently require `a ≠ c₂`.

### F3: The hypothesis use is exact

- **Actual label**: PROVEN — source and elaboration checked.
- **Verdict**: OK.
- **Evidence**: The public inputs are `P`, `hc₁K₀`, `hOK₁`, and `hOK₂`.
- **Reason**: `P.threeFan_shared_support_restriction hc₁K₀ hOK₁ hOK₂`
  supplies the pointwise upper bound. The proof derives `c₂` membership cases
  locally. `P.surface.a_mem_row₀` and `P.a_mem_row₁` supply the lower bound for
  `a`. No omitted-incidence witness, continuation packet, order fact, solver
  result, or extra distinctness premise enters this theorem.

### F4: Fourth-constructor applicability is exact but not wired

- **Actual label**: PROVEN applicability; absent current call edge.
- **Verdict**: OK WITH SCOPE NOTE.
- **Evidence**:
  `RobustApexFourIncidenceContinuation.firstCenter_not_mem_secondRow` at
  `RobustApexFourIncidenceCyclicReduction.lean:101-106` exposes `hc₁K₀`,
  `hOK₁`, and `hOK₂`, exactly the three incidence inputs above.
- **Reason**: A match on that constructor can apply the theorem without a new
  source premise. The theorem does not use the constructor's `hmissing` or
  common-deletion packet. The current `Rigid221Closure.lean` imports the cyclic
  reduction module but not `ExactFiveDistinctThreeFanCollision`, and its
  `false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence` body
  remains admitted. Thus the theorem narrows the fourth branch only after a
  future explicit import and application; it does not close either surviving
  intersection pattern or any of the first three constructors.

### F5: Kernel and source trust checks are clean for this theorem

- **Actual label**: PROVEN — Lean-formalized under ordinary Lean core trust.
- **Verdict**: OK.
- **Evidence**: A fresh focused single-file `lake env lean` command exited 0
  with no diagnostics.
  A source-exact stdin elaboration followed by `#print axioms` reported only
  `propext`, `Classical.choice`, and `Quot.sound`.
- **Reason**: The transitive theorem closure contains no `sorryAx`. A source
  scan found no `sorry`, named axiom, native reduction, `unsafe`, `partial`,
  `implemented_by`, `extern`, heartbeat override, or linter suppression in the
  audited module.

### F6: Style and prose checks pass

- **Actual label**: EMPIRICALLY VERIFIED — exhaustive scans of the audited
  source file.
- **Verdict**: OK.
- **Evidence**: No source line exceeds 100 characters. The banned mathematical
  prose terms are absent. The docstring's conditional wording matches the
  disjunctive result: the two exact intersection patterns are asserted only in
  the branch where `c₂` lies in row 0.

## Scope boundary

The certified claim is the local three-way finite-set conclusion under the
three retained prefix incidences. No aggregate build, proof-spine refresh, or
publication gate was run. The broad exact-five endpoint remains open, and this
report does not classify abstract solver profiles or live geometric coverage.
