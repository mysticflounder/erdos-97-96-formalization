# Exact13 source-order bridge audit

Lane: `cardge13-exact13-source-order-bridge-20260906`
Owner: `luna-swarm-gap-weaver`

## Scope and reuse preflight

The mandated theorem-bank search was run once for the concrete candidate
`Exact13 source order provider global rows finite candidate predicate` in the
repository Lean corpus.  It found the existing `Exact13Provider` ingress and
related row/candidate ingredients, but no reusable theorem that maps the live
source packets to an exhaustive source-order terminal.  The immediate missing
antecedent is a source-faithful finite candidate predicate retaining provider
identity, both raw labels, and direct/mirror orientation.  The preflight does
not justify identifying the two same-center K/L providers.  The known natural
provider-to-order mapping remains 0/4 and is not treated as closure evidence.

## Source audit

`CardGeThirteenExact13ProviderIngress` supplies the six provider families
(`c0`, `c1`, `k`, `l`, `t`, and one `g` for each admissible global center), the
dispatch-built raw provider pattern, its realization theorem, and positive-row
membership lemmas.  `CardGeThirteenExact13SourceRoleIngress` supplies the
source-role labels and their blocker/first-apex support facts.  The coarse-cell
ingress remains an explicit input rather than being converted into fixed label
pins.  `CardGeThirteenThreeChainTerminal` is source-neutral: it consumes a
three-chain cover and equal-radius uniqueness hypotheses, so it has no direct
source/order mapping for this lane.  The current PIQD scripts encode pinned or
diagnostic global-cell slices; they are not used here because no concrete solver
predicate has yet been shown to be source-entitled end-to-end.

## Bridge API

`CardGeThirteenExact13SourceOrderBridge.lean` defines `Input`, retaining the
live dispatch, coarse signature, and source-role witness. `Input.globalRows`
derives `Exact13GlobalRows` from the source ingress theorem; callers do not supply
arbitrary global rows.  `Candidate` is finite and carries an
`Exact13Provider`, ordered raw labels `first`/`second`, and a Boolean direct or
mirror orientation.  `candidatePredicate` is exactly:

```text
sourceOrderValid ∧ first ≠ second ∧
  first ∈ providerPattern.supportOf provider ∧
  second ∈ providerPattern.supportOf provider
```

`candidateUniverse` filters the complete finite candidate type by that
predicate.  The bridge exposes membership equivalence, a cardinality bound,
provider positive-row conversion, source-role support facts, provider-pattern
realization, and order transport through the source index map.  These are
interface lemmas only; they assert neither a valid certificate nor
unsatisfiability.

## Takeover

Coordinator messages #16431 and #16433 explicitly transferred this lane from
`luna-swarm-radial-otter` to `luna-swarm-gap-weaver`; acknowledgment is #16434.
The checkpoint base `9e2e850a7152f61c68cb8536002b62ec7102a97b`, exact owned paths,
are preserved. Historical run input descriptions are retained in this audit. Hygiene requires the run-manifest owner
to match the transferred checkpoint owner; both are now `luna-swarm-gap-weaver`
and their schema-defined self-hashes were recomputed. The original manifest
self-hash was `fdb11074930ae216cf9a5043ae77e85445ce1ac5076d2843ec2b31056d2ef119`. This handoff was recorded before source
edits. Scope is the existing bridge repair and authorized source-backed conditional
consumer, followed by focused Lean validation; no solver or all-cell closure.

## Completed consumer

`exists_shared_L_blocker_candidates` extracts two distinct labels shared by
L and one blocker, under an explicit valid source orientation. The cover places
`L.erase z` inside the union of the two blocker/L intersections. That erased row
has three members, so one intersection has at least two. Provider tags remain
separate for the two occurrences of the shared pair.

`Input.positionalPattern` transports the actual provider supports through
`I.P.idx`; `positionalEdgeChoice` transports both candidate endpoints through
the same map. `positionalEdgeChoices_positive_of_predicates` proves positivity
for any list of entitled candidates, including the two shared-pair occurrences.
`positionalPattern_realizes` ties those rows to the source boundary map.

`false_of_checked_positional_candidates` consumes a list of entitled candidates,
`ProviderWeightedKalmansonCancellationData`, and the explicit premise that its
check returns true. It applies the existing checked cancellation theorem to the
boundary's image set, with convex independence and counterclockwise order from
`I.P.boundaryEnumeration`. No equality to a separate ambient set is needed.
There is no certificate construction, all-cell coverage, aggregate import, or
unconditional terminal theorem in this lane. The candidate filter uses classical
noncomputable decision and is not an executable enumeration receipt.

## Verification

Focused command, run from `lean/`:

```text
lake env lean -M 16384 Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SourceOrderBridge.lean
```

Result: `LEAN-EXIT=0`. Execution HEAD was
`2c677e73476d420d05537f5605a839609c662dd8`; this is distinct from the retained
lane base. No full build was run. The seven `#print axioms` probes in the source
all returned exactly `[propext, Classical.choice, Quot.sound]`.
The log remains a reproducible runtime artifact under the registered run root;
the command, exit receipt, hashes, and axiom results are recorded here durably.

Source SHA-256: `22a8ac1daafd4a5c649cfd3e44dcd9c2c1320d999787c7926b6e638f8c8e1033`.

Log SHA-256: `fca0576e340eab391d5b38b188ed8943c26592d9f1f445f0cc50d1397b05a020`.

## Math-skeptic audit

**Target**: `CardGeThirteenExact13SourceOrderBridge.lean` and the claims above.
**Date**: 2026-09-06.
**Verdict**: CERTIFIED for the seven conditional claims below.
**Claims audited**: 7. All labels mean PROVEN, Lean-formalized, for the stated
hypotheses; none means global proof closure.

| Claim / declaration | Evidence and scope | Verdict |
| --- | --- | --- |
| `mem_candidateUniverse_iff` | The finite filter is exactly `candidatePredicate`; no certificate sufficiency is asserted. | OK |
| `providerPattern_realizes` | Dispatch-built supports realize the source raw-label map. | OK |
| `exists_shared_L_blocker_candidates` | Under `sourceOrderValid`, one blocker and L share distinct labels, producing two positive choices. | OK |
| `positionalEdgeChoice_positive_of_predicate` | Entitled endpoints remain in the corresponding image support. | OK |
| `positionalEdgeChoices_positive_of_predicates` | The preceding property extends to every member of a mapped list. | OK |
| `positionalPattern_realizes` | The transported supports realize the source positional boundary. | OK |
| `false_of_checked_positional_candidates` | Contradiction requires explicit certificate data and a successful check for that exact pattern/list. | OK |

All seven declarations compiled and their transitive axiom probes contain no
`sorryAx`, custom axiom, or `Lean.ofReduceBool`. No native or external solver
evidence is used for these claims. The source's remaining finite-type, support,
and order-interface lemmas compile in the same check; they were not separately
included in the seven axiom probes.

The main scope risk is treating candidate positivity as a successful certificate
or universal coverage. The theorem statements and this audit keep those
obligations separate. No unsupported upgrade to terminal closure is made.

## Run-manifest repair

The inherited manifest contained a prose `theorem-bank-preflight` entry where
the schema requires a file path and SHA-256. Its original value was:
“Exact13Provider nearest indexed result; no existing full source-order terminal”.
The repaired input map authenticates this audit, which records that preflight.
Source digests were recaptured after the successful focused run. Changed entries:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SourceOrderBridge.lean`: previous `3853771d86fcd305b39ef47d6ed9ac484bb20dc3cd2d227a845bc93d908774ae`; checked `22a8ac1daafd4a5c649cfd3e44dcd9c2c1320d999787c7926b6e638f8c8e1033`.
