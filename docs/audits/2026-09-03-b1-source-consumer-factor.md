# B1 source-consumer factor audit

Date: 2026-09-03

## Result

The five/six normal form now has a kernel-clean reducer with two explicit
consumer arguments:

`false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpoint`.

It obtains the existing `B1FiveSixWaveIngress`, invokes
`b1_escapeSourceContext_or_goodCanonicalDeletionEndpoint`, and dispatches the
two resulting packets.  The theorem introduces no `sorry` and makes no new
geometric claim.  Focused full-file Lean elaboration passed; the only reported
warning is a pre-existing unnecessary `simpa` at line 1210.

The two obligations are:

1. `B1EscapeSourceContext C → False`;
2. for every retained wave `W`,
   `B1GoodCanonicalDeletionEndpointResidual C W.escape → False`.

The original target remains open until both consumers are supplied.  This
factor is not presented as closure; it prevents the broad cardinality packet
from concealing the actual missing global conclusion.

## Lean trace

`B1PhysicalClassFiveSixNormalForm` retains only the no-third-deletion clause,
physical-class cardinality five or six, and the cover by the two canonical
deletions and two live slices.  It does not retain outside-first-apex-fiber or
retained singleton-deletion survival.

The named escape source is carried by `B1EscapeWitness` and then
`B1EscapeRowProvenanceStar`.  The latter adds live-slice membership and cross
omission, but not the two global facts.  `B1EscapeSourceContext` adds exactly
those facts and preserves source/live-row orientation.

The earliest existing producer of outside-fiber membership together with q/w
survival is
`exists_interiorPairGoodOutsideSource_mem_secondClassInterior`.  It selects a
good source independently of the named escape.  The checked global split
`b1_escapeSourceContext_or_goodCanonicalDeletionEndpoint` handles the possible
coincidence with a canonical deletion rather than discarding it.

The nearest neutral order dispatcher,
`false_of_b1WinningSliceOrderOutcome`, still asks its caller to provide an
escape-source consumer.  No noncircular theorem with that conclusion exists in
the current import cone.  The source-to-exact-four adapter produces another
joint-deletion context, but the resulting deletion belongs to a fresh pair;
the no-third clause in the B1 normal form concerns the original `C.u,C.v`
pair, so it cannot consume that packet directly.

The exact-card-18 labeled projection is noncomputable and explicitly provides
no external bytes or solver encoding.  The Q1/Q2 numeric sources contain only
generic row systems, and Q2 removes labels without an authenticated inverse
role map.  Retained q/w provenance therefore cannot be reconstructed from
those artifacts.

## Current mathematical frontier

The card-five fresh-role lemmas now provide exact identities and singleton
opposite slices.  The card-six path retains two-point slices.  In both cases,
the missing fact is a boundary placement tying the newly generated
source/blocker configuration to either a winning same-arc pair or an existing
closed collision theorem.  The two open four-center leaves in
`TwoDeletionCollision.lean` are not used as consumers here.

A Pro consult was requested as `01M1M60EKC8XC6X5NYBJM4MFEA` to identify the
smallest sound source-level closure theorem or confirm the irreducible
boundary-order antecedent.
