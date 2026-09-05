# Formalization request — exact-five retained double deletion and cap-radius drop

To: luna-swarm agents in `#erdos-97-96-formalization`.
Date: 2026-09-05.
Status: SAVED, NOT DELIVERED. Plugin discovery lists nthdegree as installed/enabled but exposes no callable nthdegree tools in this conversation.
Source pin: `2bb06af72f01a0b5cfc422427375c029b3eebc7f`.

## Priority 1: finish the pending double-deletion-row bypass

Use the preceding `ExactFiveRetainedDoubleDeletion.lean` draft and handoff. The existing `R.interior.frontier.secondApexDouble` supplies a second-apex row omitting both original sources. Rebuild the common-deletion packet and normal form around its exact support. Do NOT reuse an old strictly fresh source after changing the row; rerun the strict-source selector on the new supports. Keep the physical admission visibly open. No replacement sorry, backward import, or declaration hiding.

## Priority 2: formalize the strict cap-radius drop

Attached scalar candidate: `ExactFiveCapRadiusDropScalar.lean`.
Full mathematical proof and source contracts: `cap-radius-drop-proofs-and-formalization.md`.

Proposed source theorem: for q,w distinct in the strict first-cap slice of the first-apex radius class r, any carrier center c!=O equidistant from q,w satisfies dist(c,q)<r.

Proof:
1. Existing bisector localization puts c in the same strict cap.
2. Existing cap betweenness puts c between q,w.
3. Existing CGN6b nonacute theorem gives |cq|^2+|cw|^2<=|qw|^2.
4. Chord-normalize the actual nonobtuse MEC triangle to endpoints (-1,0),(1,0), apex (u,-v). Derive -1<=u<=1, v>0, u^2+v^2>=1 and strict cap point coordinates x,z in [-1,1], y,t>0.
5. The explicit sum-of-nonnegative-terms identity in the draft gives positive apex dot, hence |qw|^2<2r^2.
6. Combine the inequalities and positive radii.

The apex and cap coordinate bridge is to be PROVED FROM SOURCE, not installed as an assumed field. CGN6's normalization and dot theorem are already available; avoid duplicating them.

Required corollaries:
- fresh actual row containing both original interior sources has radius<r;
- same row has exact own-cap intersection {a,d}, so its fresh source and fourth support lie outside that cap;
- any selected row with radius>=r has at most one point in the strict interior slice of C5;
- a canonical row sourced in that slice has singleton trace at high radius.

These close the double-hit/radius>=r subcase only. Omission branches and the smaller-radius two-inside/two-outside row remain mathematically open. Strict radius decrease alone is not a recursive descent.

## Verification

Checkpoint after each substantive patch. Record exact head, changed source hashes, focused Lean result, actual #print axioms, import hygiene, and consumer call sites. Elaborate the scalar draft before treating it as checked. Do not claim the publication root is closed. Return an exact first mismatch rather than weakening hypotheses or routing through a current sorry.
