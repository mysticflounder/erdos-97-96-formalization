# Exact-five uniform strategy: reviewed results and formalization handoff

Date: 2026-09-05. Requested by Adam: review exact5-uniform-closure-strategy-2026-09-05.md and start the next steps.

## Status

No fatal error was found in the document's first-return reduction, ten-bisector bound, ordering-interval bound, split inverse, or sufficient dual-certificate argument. The original embedded checker and expected output hashes match, and replay reproduces all advertised counts. No physical-terminal closure, Lean build, repository change, or n=12/n=13 UNSAT certificate is claimed.

The document pin is 0a51fea446deeae8b6ddd760625e36a22d6c42d4. The recorded main snapshot was c4ac26b1ea8e08dd74d0e1d4f7bf497c315339ba. Both physical and fiveIncidence terminals still have literal sorry in Rigid221Closure.lean; that file's blob was unchanged, 77e357f15b4c3bc7278f5af5f53d9c8851bfe315. GeneralCarrierAbstractRowSystem.lean was directly inspected at the document pin: support-minimality and strong connectivity quantify over arbitrary faithful selected rows.

## Required clarifications

1. Explicitly prove H(e) != O for each anchor e: E minus {e} is still a four-point positive-radius witness at O after deleting e. Then canonical blocker-support uniqueness and the two-anchor intersection bound give at least three distinct anchor blockers.
2. Use ordinary distances, not squared distances. Establish positive singleton triangle slacks as well as positive nonadjacent-edge Kalmanson slacks. With only nonnegative weights, a nonzero nonnegative dual vector does not alone give strict contradiction.
3. Preserve both omissions when extracting the second-apex row from secondApexDouble. Rebuild the packet and normal form, then regenerate freshness. Do not reuse the old fresh omission proof or import retained-point incidence from the separate five-incidence branch.
4. For a no-incoming-edge contradiction at one chosen anchor e, only the selected row system omitting that e is needed. All five omissions are needed for the stronger all-anchors incoming/cycle conclusion.

## Completed prose theorem A: uniform certificate transport

Let iota:C_m -> C_N be an injective cyclic-order-preserving map, m,N >= 4. Include singleton and nontrivial circular splits, identifying complementary sides. Every large split T restricts either to zero or to a unique small circular split rho(T). Every small split has a preimage: choose its two cut edges in the corresponding two nonempty gaps of the large boundary.

Consequently delta_T restricted by iota is delta_rho(T), or zero. If d_N = sum_T w_T delta_T, then

    d_N restricted by iota = sum_S w'_S delta_S,
    w'_S = sum_{T:rho(T)=S} w_T.

All small weights are positive when all large weights are positive. By the split inverse, the small local slack is exactly the sum of large local slacks in that fiber; this is an identity for arbitrary real weights, not just positive ones.

Let M_m encode named distance equalities in split coordinates. With P[S,T]=1 when rho(T)=S, the embedded equalities have M_N=M_m P. Thus an exact multiplier vector y with z_m=M_m^T y >= 0 and z_m != 0 lifts unchanged:

    z_N = M_N^T y = P^T z_m >= 0, z_N != 0.

Nonzeroness follows from surjectivity of rho. This proves the distance-incidence/order part of strategy Section 5.2 step 4 for arbitrary gap lengths. It does NOT transport full-class cardinality, absence of extra incidences, full-boundary adjacency, authenticated cap membership, minimality, global K4, or exhaustive physical-source coverage. An induced named-point metric need not itself be a counterexample carrier.

## Completed prose theorem B: exact boundary potential

Define Delta_pq(c)=d(c,p)-d(c,q). For four distinct labels in cyclic order p,x,y,q, and forward half-open arcs of EDGE indices,

    Delta_pq(y)-Delta_pq(x)
      = sum_{u in [x,y)} sum_{v in [q,p)} kappa[u,v] > 0.

Proof: expand kappa[u,v]=d(u,v)+d(u+1,v+1)-d(u,v+1)-d(u+1,v) and telescope both sums. All edge pairs are nonadjacent and the arcs are nonempty, so strict Kalmanson gives strict positivity.

Delta increases on the open p-to-q arc and decreases on its complement. If O is tied to p,q, no other tie lies on the open complementary arc containing O. On the boundary cut at O, any other tie lies strictly between p,q and is unique. Three anchors tied at a non-O center are impossible, since consecutive anchor pairs would force that center into disjoint open intervals.

Thus five anchors give at most ten tie centers and at most eleven constant strict-order intervals (at most 21 blocks including tie vertices) already in the strict-Kalmanson ordinary-metric relaxation. These sign constraints are preprocessing, not new planar information. Numerical Delta is NOT globally monotone along the entire O-cut order, and this theorem does NOT give monotonicity along arbitrary selected-row paths.

## Concrete exact certificate and controls

For cyclic p,x,y,q, take E_x=d(x,p)-d(x,q)=0 and E_y=d(y,p)-d(y,q)=0. Then -E_x+E_y=kappa[1,3]>0. With canonical split masks [2,6,14,4,12,8], the incidence matrix is

    M = [[0,0,1,0,-1,-1], [0,0,1,0,1,-1]],
    y = [-1,1], M^T y = [0,0,0,0,2,0].

Positive-control weights [1,1,2,1,1,1] give equation values [0,2]: a single equality is feasible. This is a local metric certificate, not an authenticated full-physical-source leaf.

A squared-distance rejection control uses the strictly convex quadrilateral (0,0),(1,0),(3,1),(4,3), whose squared kappa[0,2] is 10+18-25-5=-2. All eight supporting-edge determinants are positive.

A graph-only shortcut counterexample has 23 vertices, O=0, anchors {1,5,9,13,17}, groups G_a={a,a+1,a+2,a+3}, hub h=21, branch b=22. For v in G_a set W(v)=(G_a minus {v}) union {h}; W(h)={O,b,1,5}; W(b)={9,13,17,h}; W_e(O)=E minus {e}. Every row has four points and excludes its center; all five omitted-anchor graphs are strongly connected; the first-return relation is complete and loopless. No simple carrier cycle contains two anchors, because leaving each leaf group passes through h. Enumeration finds 245 simple cycles per omission and maximum one anchor per cycle. This graph violates the geometric row-intersection bound: W(1) intersection W(2)={3,4,21}. It is NOT a Euclidean or physical countermodel.

## Executed exact checks

The new standard-library checker rebuilds matrices from incidence triples and uses exact arithmetic. Successful counts: 52,078 split-duality entries; 104,477 restriction-slack identities; 7,842 cyclic embeddings; 11,628 potential identities; 5,148 lifted certificates; seven rejection controls. Original replay: 2,296 split-inverse identities; 65,536 abstract graphs; 165,888 reachability implications; 29,346 all-omission strongly connected graphs. These are regressions supporting the supplied proofs, not finite evidence of all-n physical closure.

## Integration targets for luna-swarm

Coordinate ownership before edits; no takeover of existing exact-five/exact13 lanes is requested. The first production adapter remains exact support extraction inside the double-erased carrier, followed by packet reconstruction and fresh regeneration. Independently formalize circular-split restriction/surjectivity, slack aggregation, the exact multiplier checker and ordered-embedding theorem, then the rectangular potential identity and its tie consequences. Keep ordinary-distance, injectivity, cyclic-order, and strict-positivity guards explicit.

The remaining research obligation is source-backed control of selected-row paths: a no-return cut, a path potential, or a valid shortening theorem. Boundary monotonicity alone is not that theorem. No broad n-by-n census or guessed finite cutoff is proposed.

## Artifact custody

The complete 11-file archive is exact5-uniform-review-2026-09-05.tar.gz, 18,864 bytes, SHA-256 4f01e770d002a9c88b2ff45778e3f7dd36bf8258acfbde70784164c550ce67aa. It contains the full review/proofs, both checkers and outputs, three checkpoints, README, manifest and verifier. All manifest entries and archived member bytes were checked. The archive remains available to Adam in this conversation's sandbox.

The first archive delivery failed with INVALID_CONTENT because my submitted base64 payload was corrupted. This was reported successfully to #nthdegree as message 15565; it is not evidence of a backend defect. This smaller UTF-8 handoff is a separate delivery, not a claim that the archive was transferred.
