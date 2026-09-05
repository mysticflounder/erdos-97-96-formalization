# B1 card-six distinct-deletion or v-row-saturation audit

## Scope

This lane answers B1 assignment #11939 from
`@Codex-B1-Sorry-Monitor`.  The owned source is
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixDistinctDeletionOrVRowSaturation.lean`.
The lane checkpoint is
`.codex/worktree-checkpoints/luna-swarm-slice-ingress-b1-card-six-distinct-deletion-or-v-row-saturation-20260904.json`.

The source imports only `B1FullGeometricCoupledSource` and
`B1TwoOmittedInteriorPeers`.  It remains a source-faithful producer boundary:
it does not import a contradiction consumer, assert `False`, or add a
conditional wrapper around the requested alternative.

## Reuse preflight

The one indexed reuse search for this concrete candidate was:

```text
nthdegree docs search --corpus erdos-97-96-formalization-lean "card-six source-omitted interior peers distinct deletion or v-row saturation exact intersection existing deleted mate blocker inequalities"
```

The index reported revision `@e846707a8` at 2026-09-04 11:56 UTC.  The
relevant hits were `TRTF1S` and `Z756AW` for the two-peer producer,
`3PC76K` for the lower-level card-six live-pair split, and the immediately
preceding prescribed-deletion ingress.  No existing theorem supplies this
typed v-row saturation residual.  The immediate consumer is a future B1
equality-case/saturation argument; its first missing premise is a theorem
that consumes the exact `v`-row intersection and retained blocker fields to
derive the required deletion inequality or terminal contradiction.  This
module deliberately leaves that consumer premise open.

## Declaration and proof boundary

`B1CardSixVRowSaturationResidual C G` is the named typed residual required by
the monitor.  Its 17 fields are the mate distinctness, class and strict
interior memberships, source/u/v row incidences, exact v-row intersection,
and the two source-versus-peer blocker inequalities.  The theorem
`exists_b1CardSix_distinctDeletion_or_vRowSaturation` takes
`hsix : (SelectedClass D.A S.oppApex2 C.rho).card = 6`, `hu : G.u =
G.source`, and `hvOutside : G.v.1 ∉ S.capInteriorByIndex S.oppIndex2`.

It invokes `exists_two_omittedSecondClassInteriorPeers` to obtain two
distinct source-omitted strict-interior peers with their individual
source-versus-peer blocker inequalities.  The `v` row contains `v` itself,
and its physical-class intersection has cardinality at most two, so at least
one peer is omitted from that row.  If an omitted peer differs from
`G.jointDeletion.deleted`,
`exactFourMutualOmissionJointDeletion_of_prescribed` constructs the distinct
deletion branch using `G.jointDeletion.blockers_ne`.

In the remaining case, the omitted peer is the existing deleted point and the
other peer is the saturation mate.  The resulting
`Nonempty (B1CardSixVRowSaturationResidual C G)` retains the mate's
distinctness from source, `v`, and the existing deletion; class and strict
interior membership for both points; omission from both source and `u` rows;
omission of the existing deletion from the `v` row; mate membership in the
`v` row; the exact equality
`b1FullGeometricActualRow C G.v ∩ SelectedClass D.A S.oppApex2 C.rho =
{G.v.1, mate.1}`; and both source-versus-deleted and source-versus-mate
blocker inequalities.  No incidence obtained from the producer is discarded.

## Verification

The narrow check was:

```text
lake env lean Erdos9796Proof/P97/ATail/FrontierLiveClosure/B1CardSixDistinctDeletionOrVRowSaturation.lean
```

It exits 0.  The governed target command was:

```text
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1CardSixDistinctDeletionOrVRowSaturation
```

It exits 0 and reports the target built at job 10873/10873 in 7.5 seconds.
The wrapper's best-effort proof-blueprint resync reports the known unrelated
private indexed declaration from `B1CardSixRoleProjectionIngress`; the target
Lean build itself succeeds.

The publication-target `#check` probes for both the named structure and the
theorem, followed by `#print axioms`, exit 0.  The structure-producing public
theorem depends only on `propext`, `Classical.choice`, and `Quot.sound`.  The
owned source has no `sorry`, `admit`, custom `axiom`, `unsafe`, `partial`, or
`native_decide` marker.  Its imports are the two modules named above, and its
owned diff passes `git diff --check`.  The final source SHA256 is
`3e5f2ac672abfcd7b2bdae39d825534d01f4d714bb1ea6fc66ee5f417a3dd903`.

The lane checkpoint manifest is self-authenticating and uses base head
`e846707a8a319fd097dbb4282773d001b3520c00`.  Lane hygiene reports no lane
ownership problem; the global report remains blocked only by shared foreign
dirty/unregistered paths already present in the worktree.  No foreign path was
modified, and this lane does not stage, commit, or push.
