# Lean handoff: the t=8 endpoint four-row packet

## Conditional theorem

For an endpoint-A2 reflection order with eight outside labels, collapse the endpoint A2 triples. The ordered cap then has m = choose(8,2)-4 = 24 owner rows. Consider rows C0, C1, C2, and C22, whose outside blocks are respectively the low endpoint triple, the first middle root, the second middle root, and the final middle root. Assume the exact endpoint/interior cap-hit cardinalities, opposite-side interior hits, pair-codegree <= 2, row-intersection <= 2, and shared-pair boundary alternation.

The lifted chord-direction system is impossible for every such reflection order and every legal hit assignment.

A dynamic-programming quotient compresses all 243,877,920 reflection orders into 22 local types. Sixteen types (174,317,286 words) already close from C0,C1,C22. The remaining six types (indices 2,5,8,14,17,20; 69,560,634 words) close after adding C2.

## Exact bank

The generated bank contains 258 three-row and 906 four-row cyclic patterns, for 1,164 exact integer Farkas certificates. A producer-independent verifier reconstructs all types and assignments and verifies:

- structural base triples: 221,193;
- triple-certified: 193,941;
- base-triple survivors: 27,252;
- structural C2 extensions: 646,424;
- four-row certified: 646,424;
- uncovered: 0.

Certificate support sizes are 7–25 (median 12) in the three-row bank and 7–38 (median 16) in the four-row bank.

## Geometry/API needed

Use a real lifted chord chart with, for i<j<k,

  theta(i,j) < theta(i,k) < theta(j,k) < theta(i,j)+pi.

Use the three lifted isosceles identities:

  first apex:  2 theta(j,k) = theta(i,j)+theta(i,k)+pi;
  middle apex: 2 theta(i,k) = theta(i,j)+theta(j,k);
  last apex:   theta(i,k)+theta(j,k) = 2 theta(i,j)+pi.

The middle-apex real-lift wrapper is the smallest missing API. After those identities are public, add one generic integer Farkas consumer for nonnegative strict-inequality weights and signed equality weights with exact coefficient cancellation.

## Source-ingress warning

Current source does not identify RetainedMatchingEndpointContinuation.nonempty_endpointFreshFirstApexRowSource / E.rowHit.row with numeric ordinal C2. An order-0 location scan shows that an arbitrary nonendpoint fourth row is insufficient: exact strict survivors occur at interior rows C8, C13, and C18; C23 also survives. Thus a source theorem must locate the continuation row in an early/banked packet position, not merely prove that another nonendpoint row exists.

## Sharpness

At t=9, local type 3 with roots (0,3),(0,4),(5,8) represents 1,208,143,502,280 reflection orders and admits a structurally legal C0,C1,C2,C30 packet with an exact rational lifted-direction solution of margin 1/1000. The t=8 theorem is cardinality-specific.

## Promotion order

1. Export/generalize first, middle, and last lifted isosceles identities.
2. Add the generic integer chord-direction Farkas consumer.
3. Prove source role ingress from E.rowHit.row to a banked t=8 packet.
4. Import the generated t=8 certificate bank only after ingress.
5. Keep the t=9 strict survivor as a regression test against overgeneralization.
