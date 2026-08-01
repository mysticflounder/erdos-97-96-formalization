# Projected-static-v2 shell exact algebra: Lean promotion audit — 2026-07-29

## Verdict

**PROVEN — external exact algebra, not Lean.**  The frozen artifact proves that
the displayed 20-edge graph has no pairwise-distinct real realization with all
20 edges at one common length.  The proof normalizes one inner edge, splits the
five equilateral triangles into all `2^5 = 32` orientation branches over
`QQ(sqrt(3))`, and supplies an explicit Nullstellensatz identity for every
branch.  All 32 identities replay in SymPy and Singular.  Strict convexity is
unused:

- `scratch/p97-distinct-distance-lane/phase3_projected_v2_shell_exact_20260729/README.md:17-44`;
- `scratch/p97-distinct-distance-lane/phase3_projected_v2_shell_exact_20260729/README.md:89-96`.

This closes the mathematical target conjectured in
`projected-static-v2-cube19-global-theorem-bank-audit-20260729.md:268-289`,
but it does **not** yet close a Lean theorem.  The artifact's own trust boundary
says that neither the real-to-32 reduction nor the certificates are
kernel-checked.

**PROVEN — theorem-bank negative audit.**  No existing indexed theorem or
named registry consumer directly closes this graph.  The first new Lean bridge
is the exact two-orientation formula for an arbitrary equilateral apex,
followed by mechanical translation of the 32 stored identities.

## Search scope and exact negative result

The required `nthdegree docs search --lean` search was performed first.
Queries covered connected equal-edge propagation, equilateral-triangle
classification, `±60°` rotations, similarity normalization, `sqrt(3)`,
five-bit dihedral orbits, pentagonal antiprisms, and existing P97 collision
kernels.  The closest hits were the local `normSim`/equilateral-hinge
declarations below; no pentagonal-antiprism or five-equilateral-cycle
contradiction appeared.

The prescribed registries were then searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The three JSON inventories contain zero literal pentagonal-antiprism or
five-equilateral-cycle candidates.  A stronger statement-shape audit deduped
all `...metric...incompatibility : False` declarations across the three
inventories:

```text
unique metric contradiction declarations: 129
edge-equality/positivity/distinctness-only declarations: 128
unsupported declarations: 1
graph homomorphism matches into the exact 20-edge shell: 0
```

The matcher allowed role collisions unless an explicit inequality or a
positive-length edge forbade them.  For each distance equality, both involved
pairs had to be shell edges, since the artifact gives no nonedge distance
information.  The sole unsupported declaration is

```text
Problem97.u5_equilateral_circumcenter_on_p_circle_metric_incompatibility
```

because it requires `dist p x ≠ r`; selected rows have `exact = false`, so that
nonedge inequality is unavailable.

An independent injective matcher also found no instance of the local
`equilateral_bisector_collision`, `three_triad_collision`, four
`EquilateralHingeCollisions`, `u5_unit_triangle_on_p_circle_incompatibility`,
or the equilateral opposite/bisector/outer-point kernels.  Thus there is no
existing geometric endpoint hiding behind a relabelling of this common-edge
graph.

This is an exhaustive finite audit of the frozen registries and named local
patterns, not semantic completeness over every possible theorem formulation.

## Reusable Lean ingredients

**PROVEN — kernel checked.**  Live `proof-blueprint axioms` reported exactly

```text
propext, Classical.choice, Quot.sound
```

for each of:

```text
Problem97.normSim_thd
Problem97.Census554.EqualityCore.normSim_equilateralHinge_coordinates
Problem97.Census554.EqualityCore.EdgeClosure.sound
Problem97.Census554.EqualityCore.Realizes.reflectXAxis
```

There is no `sorryAx` in these transitive closures.

The useful declarations are:

- `EqualityCore.lean:53-56`: `Realizes`, carrying row equidistance and
  injectivity;
- `EqualityCore.lean:59-103`: `reflectXAxis`, distance preservation,
  orientation reversal, and realization preservation;
- `EqualityCore.lean:106-129`: `EdgeClosure` and `EdgeClosure.sound`;
- `SimilarityNormalization.lean:72-125`: `normSim`, its distance-scaling law,
  and the two normalized anchors;
- `SimilarityNormalization.lean:136`: `normSim_thd`, selecting
  `(1/2, sqrt(3)/2)` under positive orientation;
- `EquilateralHingeCollisions.lean:26-64`:
  `normalized_equilateralHinge_coordinates` and
  `normSim_equilateralHinge_coordinates`, which already prove the
  orientation-free facts `x = 1/2` and `y^2 = 3/4`.

For the remaining elementary algebra, mathlib already provides
`sq_eq_sq_iff_eq_or_eq_neg`, `Real.sq_sqrt`, `ring_nf`,
`linear_combination`, and `grobner`.  The local hinge file already uses
`ring_nf` plus `grobner` for comparable coordinate contradictions.

## First missing Lean bridge

**CONJECTURED — minimal stable bridge.**  Introduce the two linear rotations
`rot60` and `rotNeg60` on `ℝ²`, then prove:

```lean
theorem equilateral_apex_eq_rot60_or_rotNeg60
    {a b u : ℝ²}
    (hab : a ≠ b)
    (hau : dist a b = dist a u)
    (hbu : dist b a = dist b u) :
    u = a + rot60 (b - a) ∨
    u = a + rotNeg60 (b - a)
```

The shortest proof route is to reuse
`normSim_equilateralHinge_coordinates`, establish
`(sqrt 3 / 2)^2 = 3/4` using `Real.sq_sqrt`, split with
`sq_eq_sq_iff_eq_or_eq_neg`, and unfold/invert the explicit `normSim`
coordinates.  This is precisely the elementary bridge that the exact artifact
records but does not formalize.

The row-equality side is already routine: encode the displayed shell as a
`RowPattern (Fin 10)` and use explicit `EdgeClosure` chains to put all 20 edges
in the class of `(5,7)`.  Injectivity makes that reference length positive.
Applying `normSim (p 5) (p 7)` supplies the artifact's unit anchor.

## Recommended theorem surface

Keep the graph theorem independent of strict convexity:

```lean
theorem false_of_projectedV2Shell_commonDistance
    (p : Fin 10 → ℝ²)
    (hinj : Function.Injective p)
    (hedge : ∀ e ∈ projectedV2ShellEdges,
      dist (p e.1) (p e.2) = dist (p 5) (p 7)) :
    False

theorem not_realizes_projectedV2Shell
    {p : Fin 10 → ℝ²}
    (hreal : EqualityCore.Realizes projectedV2ShellPattern p) :
    False
```

The first theorem is the graph-specific geometric terminal.  The second is a
thin, kernel-checked `EdgeClosure.sound` adapter to the live row-pattern
interface.  This keeps the exact theorem honest: pairwise distinctness and the
20 common edge lengths are sufficient; no convex order, cap annotation, or
nonedge inequality is used.

The minimal project import is

```lean
import Erdos9796Proof.P97.Census554.EquilateralHingeCollisions
```

which already reaches `EqualityCore` and `SimilarityNormalization`.  A direct
certificate module can stay over `ℝ` with a local parameter
`a : ℝ` and hypothesis `a^2 = 3`; there is no need to construct a quadratic
number field inside Lean.

## Direct 32 branches versus symmetry

**PROVEN — finite orbit count.**  The graph audit reports automorphism-group
size ten, with the inner and outer pentagons as its two vertex orbits.
The five sign words have:

```text
D5 orbits:                         8
D5 plus global sign complement:   4
```

Mathlib has generic support:

- `DihedralGroup 5`, its `Fintype` instance, and cardinality theorem in
  `Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`;
- `MulAction.orbit` in
  `Mathlib/GroupTheory/GroupAction/Defs.lean`.

However, no project theorem supplies the required action on the five branch
signs, equivariance of the normalized polynomial system, or transport of a
Nullstellensatz identity along that action.  A graph rotation also moves the
chosen anchor `z0 = (1,0)`, so it requires renormalization before it acts on
the stored six variables.  `Realizes.reflectXAxis` makes the global
sign-complement half plausible and preserves the chosen horizontal anchor,
but certificate equivariance is still absent.

**CONJECTURED — promotion choice.**  Direct replay of all 32 certificates is
safer than reducing to four orbits.  The complete certificate JSON is only
118,040 bytes (2,119–4,909 bytes per branch), and every branch is independently
banked and replayed.  The direct route adds no new group-action or
renormalization proof obligation.  A later refactor may pair complementary
branches by `reflectXAxis`, but that should follow kernel closure rather than
block it.

## Suggested promotion order

1. Prove the orientation dichotomy/formula above.
2. Formalize the shell edge set and explicit equality-closure adapter.
3. Normalize `(p 5,p 7)` and derive five Boolean sign choices.
4. Translate the nine branch generators over `ℝ` with `a^2 = 3`.
5. Replay the 32 explicit identities as source-clean leaf theorems, then close
   the five-way sign coordinator by cases.
6. Wire `not_realizes_projectedV2Shell` to the actual survivor-row producer and
   run a transitive axiom check on the publish consumer.

Until step 6, the result remains an external exact certificate plus a
promotion plan, not a theorem-level P97 closure.

## Trust boundary

- The nonrealizability result and all 32 identities are exact external proofs,
  independently replayed in two symbolic engines.
- The theorem-bank matcher and four-orbit count are exhaustive finite
  computations, not Lean theorems.
- Kernel closure is claimed only for the four reusable declarations explicitly
  checked above.
- No Lean source, generator, exact artifact, or manifest was changed.  No git
  operation was run; this report is the audit's only workspace addition.
