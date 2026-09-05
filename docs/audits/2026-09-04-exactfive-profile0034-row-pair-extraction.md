# Exact-five profile 0034 support-pair extraction

Date: 2026-09-04

## Governed context

- Lane: `exactfive-profile0034-row-pair-extraction-20260904`.
- Base commit: `f436dca02b64b95f570cbc2b73c3e88341216f47`.
- Lean root: `lean/`; toolchain: `leanprover/lean4:v4.27.0`.
- Publish target: `Problem97.erdos97_rhs`.
- Active plan: the “Profile-0034 seven-turn refinement” section of
  `docs/plans/2026-09-01-rigid221-exactfive-distinct-three-center.md`.
- Intended immediate consumer: the finite point-selection and boundary-order split
  leading to
  `RobustApexFourIncidenceContinuationPacket.false_of_profile0034_boundaryOrder`.

This lane names the two unnamed members in each of the first two four-point
supports. It does not construct the boundary-order split and is not yet wired to
the publish spine.

## Theorem

The new declaration is
`Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs`:

```lean
theorem RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FirstApexUniqueRadiusExactFiveDistinctObstructionCentersResidual F}
    {deleted blocker : ℝ²}
    {C : CommonDeletionTwoCenterPacket D H deleted blocker S.oppApex2}
    (N : ExactFiveDistinctThreeCenterNormalForm R C)
    (P : RobustApexFourIncidenceContinuationPacket
      D H S.oppApex1 blocker S.oppApex2 N.retained
        N.firstApexClass.support
        N.blockerClass.support
        N.secondApexClass.support)
    (hblockerK₀ : blocker ∈ P.surface.row₀.support)
    (hOK₁ : S.oppApex1 ∈ P.surface.row₁.support) :
    ∃ p q s t : ℝ²,
      P.surface.row₀.support = {N.retained, blocker, p, q} ∧
      P.surface.row₁.support = {S.oppApex1, N.retained, s, t} ∧
      p ≠ q ∧
      p ∉ ({N.retained, blocker} : Finset ℝ²) ∧
      q ∉ ({N.retained, blocker} : Finset ℝ²) ∧
      s ≠ t ∧
      s ∉ ({S.oppApex1, N.retained} : Finset ℝ²) ∧
      t ∉ ({S.oppApex1, N.retained} : Finset ℝ²)
```

The residual freshness clauses strengthen the requested pairwise inequalities:
each of `p,q` is distinct from `N.retained,blocker`, and each of `s,t` is
distinct from `S.oppApex1,N.retained`. The two named members in each support are
distinct because the other support records one as its center and excludes its
center from its own support.

## Reuse preflight

The concrete search key was a cardinality-four support containing two known
distinct points, with the extracted pair intended for the profile-0034
boundary-order adapter, at base commit
`f436dca02b64b95f570cbc2b73c3e88341216f47`.

The in-project search found no packet-level support enumerator. The closest
declarations were:

- `exists_distinct_support_points_with_same_blockerCap`, which requires an
  additional source-faithful deletion fan and does not enumerate the support;
- `eq_pair_of_card_le_two`, which can identify a set after two distinct members
  have already been supplied, but does not produce those members.

The proof instead reuses `Finset.card_erase_of_mem`, `Finset.card_eq_two`, and
`Finset.insert_erase`. After erasing the two named points, the selected-support
cardinality field proves that the residual support has cardinality two. The
first missing antecedent beyond this theorem remains the finite boundary-order
case split; there is no circular appeal to the profile-0034 obstruction.

## Verification and trust

Focused checking from `lean/`:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/ExactFiveDistinctProfile0034SourceAdapter.lean
exit 0, no output
```

A temporary `#print axioms` command in the checked source, removed immediately
after the run, reported:

```text
'Problem97.ATailFrontierLiveClosure.RobustApexFourIncidenceContinuationPacket.exists_first_two_support_residual_pairs' depends on axioms: [propext,
 Classical.choice,
 Quot.sound]
```

The edited source contains no `sorry`, declared axiom, native reduction,
unsafe/partial declaration, implementation redirection, external binding, or
heartbeat/linter override. The source SHA-256 is
`87e868403b9cbe4776760ad98842d76bbb12a175567ad083694bb49f06d50e7c`.

The read-only reviewer lane `row_pair_proof_audit` independently inspected the
statement and proof and repeated the focused Lean check with no diagnostics or
semantic issues. This remains a local helper candidate rather than a promoted
result because the finite boundary-order consumer and publication-spine wiring
are outside this lane.

## Worktree hygiene

The lane report accepted the checkpoint and found zero lane issues. Its summary
still reported `blocking: true` for the shared worktree because it observed 12
foreign dirty paths and thousands of unrelated untracked/generated entries. No
foreign path was modified, staged, or cleaned by this lane.
