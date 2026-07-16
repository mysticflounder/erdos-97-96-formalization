# A-TAIL joint transition core

Status: **kernel-green scratch composition; the eliminator remains unproved.**

This directory does not claim A-TAIL or K-A-PAIR closure.  It pins the
strongest joint state currently produced by the live theorem bank and names
the one genuinely new theorem needed to eliminate the equilateral
continuation arm.

## Result

[`JointTransitionCore.lean`](./JointTransitionCore.lean) proves, with no
`sorry`, `admit`, declared axiom, or `native_decide`:

1. `rebasePacket D S` replaces `D.packet` by the parent-local
   `S := leafSurplusPacket` while preserving `A`, `nonempty`, `convex`, and
   `K4` definitionally.  No hypothesis `D.packet = S` is used.
2. `thirdRowTransition_of_live_profile` composes the total third-row normal
   form with the retained-critical-map classifier:
   - `LowHit`; or
   - exact `{x, S.oppApex2}`, with blocker classification supplied by the
     carriers `Kb` and `P.rowY` at centers `b,y`; or
   - exact `{y, S.oppApex2}`, with blocker classification supplied by the
     carriers `Kb` and `P.rowX` at centers `b,x`.
3. `jointTransitionPacket_of_divergent_rows` derives both transition states
   and both exact q-deleted four-row certificates for divergent outside
   witnesses `u,v`.
4. `exists_jointTransitionPacket_of_equilateralResidual` composes the
   continuation-geometry `EquilateralResidual` with global K4 and produces
   the complete paired packet automatically.
5. `false_of_equilateralResidual_of_jointTransitionCoreEliminator` verifies
   that the explicit missing producer closes the equilateral residual.

The exact missing datum is:

```lean
abbrev JointTransitionCoreEliminator
    (D : CounterexampleData) (S : SurplusCapPacket D.A)
    (H : CriticalShellSystem D.A) : Prop :=
  ∀ {K : SelectedFourClass D.A S.oppApex2}
      (C : TwoContinuationRows (rebasePacket D S) K)
      (h : C.EquilateralResidual)
      {u v : ℝ²}
      (Ku : SelectedFourClass D.A u)
      (Kv : SelectedFourClass D.A v),
    JointTransitionPacket D S H (equilateralRowsOfResidual C h) Ku Kv → False
```

This is a `Prop` abbreviation, not a theorem or an axiom.  A future proof is
expected to use the full parent MEC/cap/no-M44 geometry to construct this
function.

## Sufficiency audit

The current hypotheses **suffice to produce the joint finite state** once the
equilateral continuation residual has been reached.  They **do not suffice,
through any currently banked theorem, to eliminate it**.

The obstruction is not another isolated two-hit lemma:

- both apex-pair profiles are locally realizable and must remain live;
- each endpoint blocker still has a deletion-survival arm as well as the two
  known-center alignment arms;
- each generated row supplies a q-deleted four-row, but the two rows may
  choose different deleted anchors; and
- no banked consumer turns those facts for one row, or their present pair,
  into `False`.

The new theorem therefore has to couple the two complete transition states.
It must consume the shared retained `CriticalShellSystem`, the cap placement
of `x,y,u,v`, and whichever full parent geometry distinguishes the otherwise
realizable local profiles.  Proving a geometry-free statement of the form
`D,S,H → False`, or declaring either apex-pair profile impossible, would be
overstrong.

## Exact-audit signal (discovery evidence only)

An exact `ℚ(√3)` joint-profile audit currently leaves only the mixed
assignment `b = xa, c = ya` strictly convex in the live-compatible root
model.  In that audit:

- the two same-profile assignments close through three distinct
  perpendicular-bisector centers; and
- the crossed assignment `b = ya, c = xa` is collinear.

This is theorem-discovery evidence, **not a Lean theorem and not a closure
claim**.  It suggests that the first Lean producer attempt should split the
paired apex-profile arms into these four assignments, reuse
`Dumitrescu.perpBisector_apex_bound` for the same-profile cases, use the
ambient noncollinearity/convex-independence fact for the crossed case, and
focus new geometry on the single surviving mixed orientation.

## Parent dataflow boundary

`ParentFalseSurface.lean` remains the correct final wiring surface:
`CommonCriticalMapClosingProducer` is called after the concrete
`CriticalPairFrontier D S r Hcritical` has been constructed and before the
old LIVE slot split.

The four named files alone do **not** construct the bridge

```text
CriticalPairFrontier
  → TwoContinuationRows
  → EquilateralResidual (or another already-closed branch).
```

`ContinuationGeometryClassifier.lean` supplies `TwoContinuationRows` and its
metric classifier, and this scratch file checks the composition from its
`EquilateralResidual` arm onward.  Parent closure still needs the surrounding
frontier/metric branch dispatcher as well as the new joint eliminator.  The
joint eliminator by itself is therefore a sub-branch producer, not yet a proof
of `CommonCriticalMapClosingProducer`.

## Bank preflight

Before defining the interface, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Targeted `nthdegree docs search --lean` queries were also run for common
deleted anchors, two q-deleted rows, blocker survival/known bisector centers,
and equilateral continuation profiles.  The reusable hits are already the
ingredients composed here:

- `U5QDeletedK4Class.inter_card_le_two`;
- `U5QDeletedK4Class.exists_card_four_of_hasNEquidistantPointsAt_skeleton`;
- `cross_deletion_survives_iff_not_mem_selected_support`;
- the `CriticalPairFrontier` blocker-center equalities; and
- `Dumitrescu.perpBisector_apex_bound`.

No indexed theorem closes two arbitrary common-anchor q-deleted rows or the
paired surviving apex-profile/blocker states.  The endpoint-specific
`pEqC_row_impossible_of_equilateral` requires the finite endpoint shell and
strict side-length hypotheses absent here, so it is not a valid producer for
this lane.

## Standalone validation

Because these scratch files are not Lake library modules, each dependency was
compiled to temporary oleans under `/tmp/p97-joint-transition-oleans`, then
the joint module was checked with that directory on `LEAN_PATH`.  The final
command was:

```bash
cd lean
LEAN_PATH=/tmp/p97-joint-transition-oleans lake env lean \
  -R ../scratch/atail-force/joint-transition-core -M 16384 \
  -o /tmp/p97-joint-transition-oleans/JointTransitionCore.olean \
  ../scratch/atail-force/joint-transition-core/JointTransitionCore.lean
```

The check exits `0`.  Every exported proof reports only the accepted core
axioms `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` appears.
