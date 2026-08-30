# B1 equal-blocker continuation lane

Date: 2026-08-29

Target:
`Problem97.ATailFrontierLiveClosure.b1_globalGapOrClosedTerminal_of_counterexample`

Immediate consumer:
`Problem97.ATailFrontierLiveClosure.false_of_twoDeletionOutcome`

Publish root: `Problem97.erdos97_rhs`

## Authority and diagnosis

This lane follows revision 4 of
`docs/plans/2026-08-18-b-family-closure-plan.md` and §§16.5.I4–I12 of
`docs/erdos-97-descent-prose-proof-atomic.md`.

The old positive terminal is not supplied by the local B1 geometry.  Its first
two arms contradict the exact two-point carrier bisector, and its universal
overlap arm contradicts the source-clean small-overlap escape.  The accepted
research route therefore retains the escape and continues at its actual
blocker.

The bounded project-index search at source revision
`863808affad1dd4eaf7773ca1cac8785e2da06e6` found the existing B1 normal form,
bisector saturation, escape, common-deletion constructors, and private
four-in-five split, but no theorem closing the resulting global continuation.

## Source-clean reduction

`EqualBlockerContinuation.lean` formalizes the following producer chain:

1. `B1EscapeWitness` retains the strict-cap escaped source, survival at the
   common blocker, both blocker inequalities, and the at-most-two row overlap.
2. `b1_escapeRow_crossOmission` proves that the escape row omits at least one
   of the two original deleted sources.  If it contained both, its carrier
   blocker would lie in the saturated pair consisting of the common blocker
   and physical apex, contradicting the two retained inequalities.
3. `B1EscapeCrossDeletionPacket` chooses that omitted source and constructs a
   `CommonDeletionTwoCenterPacket` at the escape blocker and physical apex.
4. `B1ContinuationCase` records exactly nine continuations: two collisions of
   the escape blocker with an original live-source blocker, three identities
   for the chosen deleted source, and four bidirectional survival pairs.
5. `b1ContinuationCase_of_counterexample` produces a packet and one of those
   cases from every `B1GlobalTransportContext`.

None of these declarations contains the desired contradiction as data.

The producer and its import into `TwoDeletionCollision.lean` passed the
governed targeted build at proof-blueprint build `25a34db6bca0`.  The new
module contributes no `sorry` and the old target remains the sole B1 leaf.

## Frontier measure

The reduction is accepted only if the local producer compiles without
`sorry`, and any later spine rewrite retains exactly one open global consumer.
The refinement measure is the tuple

```text
(unnamed escape/deletion packet, unsplit blocker collisions,
 unsplit four-point-row alternatives, open global consumers).
```

At the old leaf this is `(1, 2, 7, 1)`.  After the producer is connected to a
single continuation consumer it is `(0, 0, 0, 1)`.  This is a strict decrease
in producer ambiguity even though the global mathematical consumer remains.
Adding a second live `sorry`, or replacing the old leaf without the exhaustive
producer, does not satisfy this measure.

## Remaining obligation

The honest global consumer has the shape

```lean
theorem false_of_b1ContinuationCase
    (C : B1GlobalTransportContext ...)
    (P : B1EscapeCrossDeletionPacket C)
    (case : B1ContinuationCase C P) : False
```

It must use information not consumed by the local B1 normal form: global cap
order, first-apex fiber provenance, a well-founded blocker transition, or a
faithful metric endpoint.  Current producer-side narrowing in `B1Live.lean`
is admissible input, but none of its alternatives is presently a
contradiction.

Independent constructor audits found no local closure hidden in the nine
cases.  The two escape-blocker collisions identify complete selected
supports but supply no opposing membership.  The three deleted-source
identities agree with selected-shell center exclusion rather than contradict
it.  The four survival pairs lack the joint-deletion provenance required by
the existing distinct-blocker terminal consumers.

The historical `ExactFourMutualOmissionSourceContext` is available before the
generic two-deletion wrapper and is discarded when `TwoDeletionIngress` is
constructed.  Retaining it is mechanically possible through a separate
enriched entry point, but a binder-by-binder audit showed that it closes none
of the nine cases by itself: the escape source and chosen deletion are not
identified with the historical `source` and `other`, and the required
survival centers do not align.  Re-entering the earlier joint-deletion
theorem would be circular.

The old target will be source-closed only in the same change that installs and
registers this single narrower consumer.  Until then the old `sorry` remains
the sole live B1 leaf.

## Verification gates

```bash
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.EqualBlockerContinuation
lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoDeletionCollision
proof-blueprint refs --refresh
proof-blueprint spine
proof-blueprint axioms Problem97.erdos97_rhs
uv run python scripts/check_worktree_hygiene.py report --lane b1-global-continuation-20260829
```

Before promotion, refresh the obligation registry, factorization pin, current
F3 authority records, and generated frontier surfaces.  Historical receipts
remain immutable.
