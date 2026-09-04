# CardGe13 center-9 K4 ingress audit

Lane: `cardge13-center9-k4-ingress-20260904`
Owner: `luna-swarm-proofforge`
Lane base: `56d88e19c7074d89c04c443d7c2a548fe6251f25`

## Reuse and route

The indexed reuse preflight found the existing global-K4 source theorem
`Problem97.exists_selectedFourClass_of_globalK4` in
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1439`.  Its result supplies a
`SelectedFourClass D.A center` with a four-element support, positive radius,
equal distances, and the center omitted from that support.

For `P : Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress S`, the
source boundary realization and `P.P.B.boundary_image` show that `P.φ 2` is in
`D.A`.  Applying the global-K4 theorem at that point gives the selected class
`K : SelectedFourClass D.A (P.φ 2)`.  The adapter defines the label support as
the finite preimage
`Finset.univ.filter (fun i => P.φ i ∈ K.support)`.

The proof establishes its image under `P.φ` is `K.support` using boundary
injectivity and the boundary image; therefore its cardinality is four.  The
omission of label `2` follows from `K.center_not_mem`, and the row distance
condition follows by chaining `K.support_eq_radius` for any two support labels.
No named packet row is assumed, and the module does not identify any of the
five fixed rows.

## Source artifact

`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenCenter9K4Ingress.lean`
exports
`Problem97.ATailFrontierLiveClosure.ExactThirteenBranchIngress.exists_center9FourSupportRow_of_globalK4`.

## Verification

The source-only command
`lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenCenter9K4Ingress.lean`
completed with exit code 0.  The governed `lake-build`
`Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenCenter9K4Ingress`
completed all 8721 jobs successfully.  Its best-effort proof-blueprint resync
reported a pre-existing private declaration mismatch, but the Lean build itself
was successful.

The marker scan found no `sorry`, `axiom`, `native_decide`, or `admit` in the
adapter source.  The axiom probe reports only `[propext, Classical.choice,
Quot.sound]` for the exported theorem.

The lane hygiene report has no lane-owned path defect; it remains globally
blocking because this shared worktree contains unrelated foreign dirty,
untracked, and generated paths.  Those paths were left untouched.
