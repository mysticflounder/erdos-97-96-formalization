# B1 card-six prescribed-deletion ingress audit

## Scope

This lane answers B1 assignment #11904 from
`@Codex-B1-Sorry-Monitor`.  The owned source is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixPrescribedDeletionIngress.lean`.
The lane checkpoint is
`.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-card-six-prescribed-deletion-20260904.json`.

The source imports only `B1FullGeometricCoupledSource` and
`B1TwoOmittedInteriorPeers`.  It adds no Rigid221, coordinator, open-leaf, or
PIQD dependency and does not assert a contradiction.

## Reuse preflight

The single indexed reuse search for this candidate was:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean "card-six full geometric source equals u prescribed exact-four mutual omission deletion peer outside strict second-cap interior deleted identity dichotomy"
```

The index was at 2026-09-04 11:36 UTC, source revision `@e846707a8`.  The
relevant hits were `TRTF1S` (`exists_two_omittedSecondClassInteriorPeers`),
`WTRCNY` (the card-six source/cross residual), and `7X8S5E` (a downstream
card-six interior-pair result).  None supplies the requested full-geometric
prescribed-deletion ingress, so the new declarations are not duplicate reuse.

## Declarations

`exists_b1CardSix_prescribedDeletion_of_source_eq_and_v_outsideInterior`
takes a `B1GlobalTransportContext C`, its
`B1FullGeometricCoupledSourceResidual G`, the equality
`hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6`,
`hu : G.u = G.source`, and
`hvOutside : G.v.1 ∉ S.capInteriorByIndex S.oppIndex2`.

It converts the source row bound to the stricter source-row/interior bound,
uses `exists_coupled_omittedSecondClassInteriorPeer`, transports the source
omission to the `u` row using `hu`, and calls
`exactFourMutualOmissionJointDeletion_of_prescribed` with
`G.jointDeletion.blockers_ne`.  The result contains a peer distinct from both
`G.source` and `G.v`, in the selected class and strict interior, omitted from
both actual rows, together with a joint deletion `K` satisfying `K.deleted =
peer`, and retains the source-vs-peer blocker inequality
`centerAt G.source ≠ centerAt peer`.

After monitor repair request #11917, this blocker field is present in the
public base theorem conclusion rather than being discarded after the producer
call.

`exists_b1CardSix_prescribedDeletion_with_deleted_dichotomy` is the honest
corollary.  It adds
`K.deleted ≠ G.jointDeletion.deleted ∨ K.deleted =
G.jointDeletion.deleted` without selecting a branch, while retaining the same
source-vs-peer blocker inequality.  The first remaining
consumer premise is therefore the inequality branch (or a downstream proof of
the equality branch's consequences); this lane does not discharge it and does
not claim B1 closure.

No additional equality or coercion premise was needed beyond `hu`.  The card
equality is converted to a lower bound by arithmetic, and the source-row
intersection bound is obtained by a Finset subset argument.

## Verification

The narrow check was:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixPrescribedDeletionIngress.lean
```

It exits successfully.  The governed command

```text
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixPrescribedDeletionIngress
```

also exits 0 and reports
`Built ... B1CardSixPrescribedDeletionIngress (6.2s)` at job 10873/10873 after
the #11917 repair.  The repaired source SHA256 is
`33d741347d8f9717f659f81b670e09b0683f2a35e200d3978210cd7bca237dbc`.
The wrapper's best-effort proof-blueprint resync reports an unrelated indexed
private declaration from `B1CardSixRoleProjectionIngress`; the Lean target
build succeeds independently.

`proof-blueprint axioms` for both public declarations reports only
`propext`, `Classical.choice`, and `Quot.sound`.  The owned source has no
`sorry`, `admit`, custom `axiom`, `unsafe`, `partial`, or `native_decide`
marker.  The owned diff passes `git diff --check`, and the forbidden-import
scan is empty.

The lane-specific hygiene report has no lane problems.  Its global blocking
summary is due to shared foreign dirty paths and generated spill outside this
lane; no foreign path was changed.
