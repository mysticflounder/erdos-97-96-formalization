# Provenance: finite-nine Form `b` at `v₁`

The live theorem is `Erdos9796FiniteNine.form_b_v1`, theorem ID
`b6bb5e30-c060-4622-9cea-acaa92a6be0d`. Its exact statement is:

```lean
theorem form_b_v1 {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1
```

The source theorem is
`Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1_proof` in
`lean/Erdos9796Proof/P97/N4d/ExcludesFormBv1.lean`. The normalized source declaration header has
SHA-256 `b600c24284540190c04eb98739da46b851cd12011b3b47b85c1915624355e186`, the
same statement hash recorded by the finite-nine modular cut. The platform theorem changes only
the declaration name and namespace required by Prove2Me; its set parameter, shell hypothesis, and
conclusion are unchanged.

The proof payload starts from the authenticated modular fragment
`submissions/finite-nine-modular/source-fragments/form_b_v1.lean`, SHA-256
`d899a1396d1d9303b35fc6fbfde7d59f4582a0c808316c7e3a943dfc8721925f`. The generator removes
exactly the 21 public declarations already supplied by the published
`Erdos9796FiniteNine_Forms` definition bundle: three witness-class definitions, nine Form
predicates, and nine public exclusion predicates. It retains the private predicate helpers and all
proof declarations.

The preserved fragment predates the Lean 4.33.1 repair commit `275c90653`. The generator applies
the eleven relevant elaboration repairs from that commit: four perpendicular-bisector distance
rewrites, six radius distance rewrites, and one third-vertex radius rewrite. The
`FormBXb2UpperArc` `swapI2` simplification repair was already present in the preserved platform
fragment and is asserted exactly once. All 18 current source files are bound by SHA-256 constants
in `generate.py`; the three changed files are:

- `N9Endpoint/N4e.lean`: `77566bdfe7e3b1b3e944a43713bcf3c5e0b56f53bc93ec7e69bb453f8671be7a`;
- `N4d/FormBLowerForcesV3.lean`: `4221411571130185105e5d957fec2e5479911ccc196c0601a457092e865fa151`;
- `N4d/FormBXb2UpperArc.lean`: `e57b8617b98dfe3d3601b59d25ced1f0d8bd6d25ccc9004560ff4794e956f60d`.

The Form `b` fragment consumes the local namespace and endpoint-shell helper chain that precedes it
in the original submission. The generator therefore authenticates and incorporates the complete
51,853-byte preamble, SHA-256
`73f2fa399452705adc7a6be30960b3571fa8dc479a65caee634646b13b789e6c`, including its original 84
definition, Mathlib, and theorem imports and exact local alias/export tail. It then incorporates the
first 46 stream units, 76,512 bytes with SHA-256
`16861ab310e5d8f68b4c5aaf24e0f88e5ad8775b70793de49c4807bf55cc523f`, from the authenticated full
submission stream, SHA-256
`1f69d9f4f5bec3ad50b648f6dbe728a1e4459cd2bba8f2d38fe2bdfc32218b58`. This preserves the exact
local namespace declarations and dependencies rather than reconstructing a selected helper set.

The collision audit found the public endpoint-shell structure and its eight reducible definitions
in prefix unit 46. The generator removes those nine declarations and omits the unused final
shell-constructor theorem. It removes `HasNEquidistantProperty` from the unit-1 export so the
published Stage-2 abbreviation is the unique local name, while retaining the `At` and `On`
exports. It also removes the 21 public witness-class, Form, and exclusion definitions from the Form
`b` fragment. The three Lean 4.33.1 shell cardinality repairs are applied before concatenation.

The faithful-frame proof also consumes `c1_vertex_same_open_side_as_v3` from stream unit 55. The
generator binds the minimal 19,909-byte unit prefix containing that theorem and its two private
helpers, SHA-256 `21f638f8bd7ad839b6a73ce714c1f3c65fe626b2259c825fee934792f93075d4`,
and inserts it before the faithful-frame unit. The slice stops before the Form-A layout theorem and
does not include either Form-A exclusion proof.

The bounded project-corpus reuse search at source revision `0707e2c26` returned the exact source
theorem as the top theorem hit. Its immediate consumer is this Prove2Me child; after publication,
the finite-nine root consumes the child through the Stage-3 graph. There is no missing antecedent
and no dependency on another open finite-nine child: the payload imports the four published
finite-nine definition bundles, the complete 18-module accepted counting definition frontier, and
20 already-accepted counting theorem nodes.

The generated-source scan rejects `sorry`, `sorryAx`, native reduction, compiler trust,
unsafe/partial code, external implementations, and named axioms. The local Lean 4.33.1 audit
nevertheless reports `[propext, sorryAx, Classical.choice, Quot.sound]` because the imported
Prove2Me theorem mirrors are statement-only `by sorry` stubs. The placeholder is absent from the
generated solution source, but its presence in the local transitive closure prevents a local
core-clean certification. Server verification against the accepted theorem nodes must discharge
that remaining trust boundary.

Server submissions `e79c8662-4da5-4028-a16a-ae1139352bd1` and
`c48a71c4-7c62-4cd8-8fb6-0e12fad9dada` both reached `ERROR` with the sole reported message
`Verification timed out after 300s`. Neither attempt returned a Lean elaboration or kernel
diagnostic rejecting the proof. Since the identical source builds locally, the recorded blocker is
the server time limit for this monolithic payload. Further retries should split the authenticated
support chain into accepted nodes and submit a smaller final `form_b_v1` proof.
