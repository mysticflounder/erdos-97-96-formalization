# B1 card-six two-omitted-interior-peers audit

## Scope

This lane answers B1 assignment #11841 and its follow-up #11849 from
`@Codex-B1-Sorry-Monitor`.  The owned Lean source is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1TwoOmittedInteriorPeers.lean`.
The lane checkpoint is
`.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-two-omitted-interior-peers-20260904.json`.

The module imports only `Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion`.
It contains no `Rigid221Closure`, `Coordinator`, open-leaf, or PIQD dependency.

## Reuse preflight

The one indexed reuse search for this theorem candidate was:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean "two distinct strict second-cap interior peers both omitted from one actual late row source selected class card six blocker inequality selectedSupports_eq_of_actualBlockers_eq"
```

The index was at 2026-09-04 10:51 UTC, source revision `@c88c0a0c3`.  Relevant
hits were `BJ1959` (`interiorPairBad_secondClassInterior_card_le_one`),
`VAW09H` (`actualLateRow_secondClass_card_le_two`), and `N41JRF`
(`interiorPairBad_source_blockers_eq`).  `7X8S5E` and `AK2BGA` are downstream
B1 consumers rather than reusable producers.  The Rigid221 hit `BWHF0E` was
excluded by the assignment scope.  No indexed theorem supplied the requested
card-six two-peer producer, so this module is a new source-clean declaration.

The proof reuses the cap-interior cardinality lemma
`SurplusCapPacket.selectedClass_capInteriorByIndex_card_ge_card_sub_two` and
the source-side producer `exists_omittedSecondClassInteriorPeer` only as
mathematical guidance; the new theorem proves the two-peer cardinality step
directly.  The private apex/index equality needed to transport the indexed
bound is reproduced locally because the imported source theorem keeps its copy
private.

## Declarations

`exists_two_omittedSecondClassInteriorPeers` assumes:

- `R : OriginalUniqueFourResidual F`;
- a carrier source `source`;
- `0 < rho`;
- `6 ≤ (SelectedClass D.A S.oppApex2 rho).card`; and
- the source actual late row meets the selected physical class intersected
  with `S.capInteriorByIndex S.oppIndex2` in at most two points.

It returns two distinct `CarrierVertex D.A` values, both distinct from
`source`, both in the selected physical class and strict second-cap interior,
both omitted from the source actual late row, and each with an actual blocker
different from the source actual blocker.  The blocker conclusions use
`ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq`.

`exists_coupled_omittedSecondClassInteriorPeer` is the immediate neutral
corollary requested in #11849.  In addition to the producer premises it needs:

- `hvClass : v.1 ∈ SelectedClass D.A S.oppApex2 rho`;
- `hvNotInterior : v.1 ∉ S.capInteriorByIndex S.oppIndex2`; and
- the endpoint row/physical-class intersection bound `hvRowCross ≤ 2`.

No additional blocker-equality premise is needed.  The endpoint row contains
its own selected vertex, while both produced peers are strict-interior points,
so they differ from `v`; a three-point subset argument rules out both peers
being in the endpoint row.  The returned peer is distinct from both `source`
and `v`, lies in the physical class and strict interior, is omitted from both
actual rows, and has the source-vs-peer blocker inequality.

The immediate downstream consumer is the `u = source`, `v` not strict-interior
branch: with the row-v intersection bound at most two, this corollary supplies
the coupled omitted peer.  These declarations do not close B1 and do not
establish the remaining global consumer hypotheses.

## Verification

The narrow check from the Lean project root was:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1TwoOmittedInteriorPeers.lean
```

It exits successfully with no errors or warnings after the repair.  The
governed target build was then run through
`lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1TwoOmittedInteriorPeers`.
It built the target successfully at job 8708/8708.  The wrapper's subsequent
best-effort proof-blueprint resync failed on an unrelated pre-existing private
indexed declaration from `B1CardSixRoleProjectionIngress`; this did not affect
the Lean target build.  No lock file was removed or modified.

`proof-blueprint axioms` for both declarations reports exactly
`propext`, `Classical.choice`, and `Quot.sound`.  A literal scan of the owned
source reports no `sorry`, `admit`, or custom `axiom` marker.

The source was checked for forbidden imports/markers and the owned diff was
checked with `git diff --check`.  The lane-specific hygiene report has zero
problems; its global `blocking` flag reflects shared foreign dirty paths and
unregistered generated trees outside this lane's ownership.
