# Exact-five profile-0034 residual boundary indices

Date: 2026-09-04

## Governed context

- Lane: `exactfive-profile0034-residual-boundary-indices-20260904`.
- Base commit: `997355253c469b2da9be8261eb1cbfbd6b8d8fa0`.
- Lean root: `lean/`; toolchain: `leanprover/lean4:v4.27.0`.
- Publish target: `Problem97.erdos97_rhs`.
- Active plan: the “Profile-0034 seven-turn refinement” section of
  `docs/plans/2026-09-01-rigid221-exactfive-distinct-three-center.md`.

## Theorem

The new declaration is
`Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs_with_boundary_indices`.
Given the normal form, robust four-incidence packet, and the positive source
memberships `blocker ∈ row₀` and `oppApex1 ∈ row₁`, it returns `p,q,s,t`, the
two support equalities and residual freshness clauses from
`exists_first_two_support_residual_pairs`, together with
`ip,iq,is,it : Fin P.boundaryIndexing.n` satisfying

```text
boundary ip = p,  boundary iq = q,  boundary is = s,  boundary it = t.
```

The four indices are obtained from labels
`⟨p, hpA⟩`, `⟨q, hqA⟩`, `⟨s, hsA⟩`, and `⟨t, htA⟩` using the exact support
membership proofs and `BoundaryIndexing.indexOf`; each boundary equality is
then `BoundaryIndexing.point_eq`. No index ordering or cross-row distinctness
is asserted.

## Consumer and remaining antecedent

The intended immediate consumer is the finite point-selection and boundary-order
classifier that supplies the ordered witnesses for
`RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder`.
That classifier is not implemented here. Its first missing antecedent remains
the finite exhaustive boundary-order split (including complementary placements)
for the four residual points and the named source roles. The helper is therefore
not wired to `Rigid221Closure` and does not close
`false_of_exactFiveDistinct_threeCenter_distinctFresh_fiveIncidence`.

## Verification and trust

Focused checking:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
exit 0, no diagnostics
```

A temporary in-module `#check`/`#print axioms` probe reported the declaration
depends only on `propext`, `Classical.choice`, and `Quot.sound`. The probe was
removed afterward. The edited source has no `sorry`, custom axiom, native or
unsafe declaration, and this lane makes no closure or promotion claim.

## Worktree hygiene

The checkpoint is
`.codex/worktree-checkpoints/exactfive-profile0034-residual-boundary-indices-20260904.json`.
Shared-worktree foreign dirty paths were left untouched; no files were staged,
committed, or pushed.
