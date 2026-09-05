# Exact-five: a uniform closure strategy through anchors, minimality, and checked metric certificates

Date: 2026-09-05.
Audited repository: `mysticflounder/erdos-97-96-formalization`.
Audited revision: `0a51fea446deeae8b6ddd760625e36a22d6c42d4`.

## 0. Status and objective

This is a research strategy, not a proof of the physical terminal. The current physical and five-incidence endpoints still have literal admissions. The preceding handoff contains solver-reported UNSAT for n=12 and all five n=13 cap/rich-class cases, but not independently checked UNSAT certificates or a uniform n>=14 contradiction. No new physical-terminal solver run or Lean build is claimed here.

The proposed change of strategy is to keep the five-point first-apex class fixed and exploit minimality at arbitrary carrier size. Finite computations become a way to discover and certify geometric transitions, not a sequence whose success is mistaken for induction.

Two logical facts make this concrete:

1. Minimality forces every selected four-row system to be strongly connected; the repository already proves this.
2. Rechoosing the four-row at the exact-five apex in all five possible ways forces a directed cycle among the FIVE anchors, where an edge denotes a path through non-anchors. The number of anchor vertices is bounded, but the lengths of those paths are not yet bounded.

The central proposed geometric target is to choose the other rows so that such an anchor return cycle is impossible. A weaker sufficient target is a return relation with a vertex of indegree zero. Neither target is proved in this document. Proving a suitable uniform path barrier or path-compression theorem is the genuine remaining research task.

## 1. Freeze the source contract before further geometric work

Use O for the first physical apex, V for the second, E for the complete first-apex radius class, a for retained, d for deleted, U for the actual blocker of a, and f for the strict fresh source.

Keep these facts explicitly available:

- E has exactly five points, is a positive-radius circle class centered at O, and is the unique rich radius class at O.
- a,d are distinct members of E in the authenticated first opposite-cap interior.
- The original source `R.interior.frontier.secondApexDouble` survives simultaneous deletion of a,d at V. Extract a selected four-row L at V omitting both.
- In the physical endpoint, its selected second row already omits both a,d. The strict fresh source omits all three preserved rows and is distinct from d.
- The row at U is an actual critical row, not an arbitrary equidistant four-subset; its full-class and unique-rich-radius consequences must remain available.
- The distinct blocker identities, global critical-shell system H, convexity, cap order/MEC data, minimality, and no-M44 context remain present.

Pinned source references:

- `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221Closure.lean`, starting around line 1530: current physical terminal and adjacent incidence terminal.
- `.../ATail/FirstApexExactFiveInteriorFrontier.lean`, around lines 325–365: secondApexDouble copied to the public frontier and required by prescribed-pair construction.
- `.../ATail/ExactFiveDistinctThreeCenterContinuation.lean`: orientation, row identities, and strict fresh/tight-cover split.
- `.../GeneralCarrierAbstractRowSystem.lean`: `system_supportMinimal`, `system_supportStronglyConnected`, and source/blocker support adapters.
- `.../AbstractRowSystemConnectivity.lean`: `supportStronglyConnected_of_supportMinimal`.

Compile and integrate the earlier pair-free reselection before deleting the incidence branch. Its new second row can contain the old fresh point: rebuild the fresh witness, do not reuse its omission proof. Do not use the current physical endpoint as a producer or call a dispatcher which eventually calls it again.

The old fourth-incidence equilateral/three-circle radius bounds cannot simply be transplanted here. The physical second row omits a; the old incidence geometry used its membership. Any reuse needs its original guards proved separately.

## 2. Minimality supplies the unbounded mechanism

Choose a selected four-point support W(c) at every carrier center c. Direct an edge c -> x when x is in W(c).

A nonempty set B of carrier points is support-closed if W(c) is contained in B for every c in B. Then every c in B has four equidistant points inside B. Convex independence is inherited by B. Therefore a nonempty proper support-closed B is a smaller counterexample, contradicting D.Minimal.

This is not a new conjecture. The repository already establishes support-minimality and strong connectivity for every faithful choice of selected rows. It also permits prescribed selected classes at named centers. Its blocker-support uniqueness means arbitrary faithful row choices at an actual critical center have the canonical support.

Important limitation: the actual blocker map by itself is not the full dependency graph. To certify a smaller K4 carrier one must preserve four-point witnesses at EVERY retained center. Merely following q -> H(q), finding a cycle of that map, or preserving three distinguished rows does not establish this.

## 3. A proved five-anchor return-cycle reduction

### 3.1 Definition

Fix selected rows W(c) for all c != O. Prescribe W(V)=L, and preserve the available actual critical rows. Only the row at O is left variable.

For each e in E, define W_e(O)=E minus {e}, retaining all other W(c). Every W_e is a genuine four-row system on the same carrier.

On the five-element vertex set E define f ->_R e, with f != e, when there is a directed W-path from f to e whose internal vertices avoid E union {O}. Only rows at non-O centers are used, so R is independent of which W_e(O) is selected. These are graph paths, not metric contractions or new equidistant edges.

### 3.2 Claim and proof

Under D.Minimal, every vertex e of R has an incoming edge.

Fix e. Strong connectivity of W_e supplies a directed path from O to e. Choose it simple. Its first successor is an anchor in E minus {e}. Because the path is simple, O is not an internal vertex and e has not occurred earlier. Let f be the LAST anchor before the terminal e. The subpath f,...,e has no internal anchor or O and f != e. It is an incoming R-edge.

Any finite directed graph in which every vertex has an incoming edge contains a directed cycle: keep choosing predecessors, and stop at the first repetition. Since R has five vertices and no loops, it contains a simple directed cycle of length 2,3,4,or 5.

This is a uniform logical reduction valid for every n. It uses all five choices of row at O, not only the source's initial erased row.

### 3.3 What remains to prove

A sufficient geometric theorem would be:

> From the physical source's convex geometry, authenticated cap data, critical rows, and pair-free row L, choose W(c) for c != O such that its first-return relation on E is acyclic.

A weaker sufficient theorem would only produce an e with no incoming R-edge. Either contradicts the preceding minimality consequence.

This target is OPEN. In particular, a cycle with at most five anchor vertices may contain arbitrarily long constituent paths, shared internal vertices, and changing row radii. No bound on its total geometric size follows from the five-anchor count alone. The strategy is incomplete until a path barrier or justified shortening rule handles those features.

## 4. A second uniform reduction: at most ten anchor bisectors

### 4.1 Pair-heavy centers

For distinct e_i,e_j in E, O lies on their perpendicular bisector. A convexly independent carrier has at most two points on a line. Consequently there is at most one carrier center c != O satisfying

    dist(c,e_i) = dist(c,e_j).

There are binomial(5,2)=10 anchor pairs. Thus at most TEN carrier points other than O have any tie among their five distances to E.

At every other center all five anchor distances are distinct. In particular, any same-radius class at such a center meets E in at most one point. This applies to complete classes, not only chosen rows.

A selected circle at a center c != O contains at most two E-points, since two distinct circles cannot share three points. Therefore the five actual blockers H(e), e in E, include at least three distinct centers: equal blockers have one common canonical critical support, which can contain at most two anchors.

These are deductions from the existing perpendicular-bisector/row uniqueness facts, not conclusions from a finite census. Relevant existing interfaces are `system_pairCodegreeLE_two` and `selectedSupports_eq_of_actualBlockers_eq`.

### 4.2 Ordering intervals

Translate O to zero. Since every anchor has the same norm,

    |c-e_i|^2 - |c-e_j|^2 = -2 <c,e_i-e_j>.

Each comparison changes sign on a line through O. Since O is an extreme carrier vertex, the vectors c-O for the other carrier vertices lie in an open half-plane. Their directions follow the boundary order monotonically. A line through O crosses that angular sweep at most once.

Hence the cut boundary has at most eleven tie-free intervals with constant ordering of the five anchor distances, together with at most ten tie vertices. This is a geometric proof of a finite STATE vocabulary (at most 21 nonempty blocks), not a finite CARRIER bound.

### 4.3 Proposed use and warning

Label critical-row transitions by their anchor-order interval, cap, actual-source role, anchor intersections, and relative order. Study minimal return paths in those labels. Look for a monotone potential or a sound way of eliminating repeated intervals, retaining all required metric equalities and guards.

Same interval does not mean same coordinates, radius, or row. It does not justify contracting two centers or deleting intermediate points. A finite-state encoding only closes the proof after its transition and termination/coverage theorems are established. In particular, neither the ten tie centers nor the eleven intervals bounds the number of light centers.

## 5. Turn arithmetic conflicts into small exact certificates

The prior handoff defines local Kalmanson slacks kappa[p,q] for nonadjacent boundary edges and local triangle slacks tau[j]. An explicit inverse strengthens their use.

For n>=4, for each singleton {j}, let delta_{j}(x,y)=1 exactly when the singleton separates x,y. For each unordered pair of nonadjacent cyclic edges p,q, let S_{p,q} be either side of the associated contiguous split and let delta_{p,q} be its separation indicator. Then

    d(x,y) = (1/2) sum_j tau[j] delta_j(x,y)
           + (1/2) sum_{p,q} kappa[p,q] delta_{p,q}(x,y).

All sums include one representative of each split. There are n singleton splits and n(n-3)/2 nontrivial splits, totaling n(n-1)/2.

Proof: on a split metric delta_S, the local slack corresponding to S is 2, and every other local slack is 0. There are as many split metrics as off-diagonal entries of a symmetric zero-diagonal array. Thus the square analysis/synthesis matrices are inverse up to the factor 2. This proves the displayed identity for every such array. Positivity of the slacks gives positive split weights.

The circular-split description of Kalmanson metrics is classical; see Jonathan Terhorst, *The Kalmanson Complex*, arXiv:1102.3177. The displayed inverse and the checks below are supplied to make the proposed implementation explicit, not as a novelty claim about the cone.

### 5.1 Certificate format

Let w be the vector of positive split weights. A row equality d(c,p)=d(c,q) becomes a homogeneous integer row equation in w whose coefficients belong to {-1,0,1}. Collect the chosen equations as M w=0.

An independently checkable infeasibility certificate is a rational vector y such that

    z = transpose(M) y >= 0 componentwise,
    z != 0.

Indeed,

    0 = y^T M w = z^T w > 0.

The verifier only checks exact rational/integer arithmetic, the row-geometry bridge, and strict positivity. It need not trust the search program. General linear inequalities can also be retained with sign-restricted multipliers; disequalities require their genuine Boolean/sign guards rather than being silently treated as equations.

The theorem-of-alternatives perspective is standard; the proof of the sufficient certificate above is self-contained. A reference for the surrounding theory is Saunders and Schneider, *Applications of the Gordan–Stiemke Theorem in Combinatorial Matrix Theory*, SIAM Review.

### 5.2 Discovery workflow

For each arithmetic conflict from the existing small models:

1. Extract a rational certificate and minimize its selected incidence premises.
2. Relabel the points by cyclic order, anchor identity, and authenticated cap/source roles.
3. Re-express long index blocks as sums of positive local slacks.
4. Prove an ordered-embedding theorem: extra vertices in the gaps do not invalidate the guard or its metric contradiction.
5. Test whether the same conflict rules out a proposed return-path transition or cycle, at arbitrary path lengths via proved identities.

A small certificate is not an all-n proof. The remaining obligation is to prove that EVERY physical source forces at least one applicable guard, or to prove a uniform path invariant directly. Also, a SAT distance relaxation may be non-Euclidean; its role is to refute an overstrong Kalmanson-only lemma, not to refute the physical terminal.

If a candidate transition survives the linear relaxation, inspect exactly which planar fact is missing. Add source-backed circle, signed-area, or enclosing-circle data only to that targeted configuration. Do not transplant the old fourth-incidence equilateral assumptions into the physical branch.

### 5.3 Certification of the existing n=12,13 evidence

Use the same machinery for a concrete finite deliverable: each learned arithmetic clause carries a checked multiplier certificate and all its guards. A Boolean master records row sizes, cap constraints, and the exact source alternatives. A checked propositional replay establishes exhaustion after adding only certified clauses.

The mixed SMT formula cannot be certified by feeding its status ledger to a Boolean checker. Equally, one arithmetic contradiction for one chosen row assignment does not cover all assignments. The semantic bridge and exhaustive Boolean replay are mandatory. The first acceptance test should be one complete n=12 formula, not a larger uncertified run.

## 6. Ranked execution plan and decision gates

### Lane A: source and dependency hygiene

For luna-swarm: compile pair-free extraction/reselection, prove exact support preservation and fresh reconstruction, replace the incidence dispatcher without a dependency cycle, and audit the resulting theorem dependencies. Treat imports or consumers of other admitted leaves explicitly; a changed sorry count is not a clean proof certificate.

Deliverable: an accurately typed physical root, with the original simultaneous-deletion and actual critical-shell data visibly retained.

### Lane B: certificate and algebra infrastructure

Formalize the split inverse and the exact multiplier checker. Certify the small-interior classification and then the compact n=12 case, followed by the five n=13 cases. Export the smallest geometry-sensitive conflicts for Lane C.

Deliverable: checked finite exclusions and reusable local metric lemmas, not another collection of solver verdicts.

### Lane C: the actual uniform proof

Start with the return-cycle theorem and the ten-bisector/eleven-interval lemmas. They are independent of a guessed cardinality cutoff. Preserve the physical row L, the anchor source labels, and actual critical rows in the transition analysis.

The first hard milestone is a proved no-return cut, monotone return-path potential, or shortening lemma with explicit hypotheses. Candidate state-identification and metric inequalities should be attacked with countermodel tests BEFORE being assigned as formalization facts.

Success means a proof that applies for arbitrary carrier cardinality. Discovery of a local cycle merely changes the required invariant; it does not justify discarding the source condition or declaring a broad pattern bank complete.

### Gates

- Do not begin another broad n-by-n census just because the preceding one succeeded.
- Do not claim finite-kernel coverage because only five anchors or finitely many sign intervals occur.
- Do not infer a deletable point from preserved apex rows. In a minimal counterexample every singleton already has a blocker.
- Do not identify a bare hard-swap record with the stronger negative guard discarded by its producer.
- Do not claim terminal closure from uncompiled files, unchecked arithmetic proofs, or a dependency on the physical theorem itself.

## 7. An explicit fallback that would also close the proof

If a uniform return barrier is not available, a different acceptable theorem is a GENUINE bounded-reduction result: every full physical packet either contradicts a local source-backed lemma or produces a physical/minimal obstruction with a proved explicit cardinality bound N.

Only after such a theorem supplies N is a census through N an exhaustive closure strategy. There is currently no justified choice of N, no proof that N=13 suffices, and no argument that arbitrary subsequences preserve K4. The ten-bisector bound alone is not such a bounded-reduction theorem.

A proper support-closed subset is an immediate contradiction by minimality, so it need not preserve the special physical normal form. This can make a geometric cut argument easier than a packet-preserving descent. But its K4 property at all retained centers must actually be proved.

## 8. Completion criteria

The physical terminal is closed only when a kernel-checked proof of its full quantified statement remains, with no unproved producer or relevant admitted dependency hidden behind the new interface. Full exact-five accounting additionally needs the incidence reduction integrated, the already separate tight-cover case audited, and any other independent endpoint dependencies clearly classified.

The preferred return-cycle route could close all cardinalities directly; the n=12,13 certificates are useful validation and fallback assets, not logically indispensable to a successful uniform theorem. The alternate bounded-reduction route requires both the bound and every finite case under it.

The strategy has rigorous source, graph, and anchor-geometry reductions. It does not yet have the decisive geometric return-path theorem. That is the place to concentrate research effort rather than treating all remaining work as mechanical formalization.

## 9. Checks performed in this strategy pass

The embedded standard-library checker verifies 2,296 split-inverse coefficient identities for n=4,...,24 and exhaustively tests the first-return implication on 65,536 small abstract directed graphs. The proof is the argument in Sections 3 and 5, not inference from these finite tests.

The graph regression uses three anchors, one apex, and one non-anchor so that all non-apex edges can be enumerated. It checks 165,888 successful omitted-anchor reachability implications; 29,346 graphs are strongly connected for every omitted-anchor choice, and each has the required return cycle. It is a combinatorial regression, not a geometric physical-source census.

A two-equation toy multiplier certificate is also checked. It is not a certificate for n=12,n=13,or the open terminal. No new endpoint closure, compiled Lean file, repo patch, or nthdegree assignment is claimed.

### Embedded file: `check_strategy.py`

Bytes: 3298
SHA-256: `fb8f3419b6cf8bb5c49c934aaf658a84c920334b0ad878d71f39e1dccde7df9f`

```python
from collections import Counter
from itertools import combinations
import json

def add(v,e,a):
    if e[0]==e[1]: return
    e=tuple(sorted(e)); v[e]+=a
    if not v[e]: del v[e]

def split_basis_check(n):
    # Each listed linear form is TWICE the corresponding split weight.
    forms=[]
    for j in range(n):
        v=Counter()
        add(v,((j-1)%n,j),1);add(v,(j,(j+1)%n),1)
        add(v,((j-1)%n,(j+1)%n),-1)
        forms.append(({j},v))
    for p,q in combinations(range(n),2):
        if (p+1)%n==q or (q+1)%n==p: continue
        v=Counter()
        add(v,(p,q),1);add(v,((p+1)%n,(q+1)%n),1)
        add(v,(p,(q+1)%n),-1);add(v,((p+1)%n,q),-1)
        forms.append((set(range(p+1,q+1)),v))
    assert len(forms)==n*(n-1)//2
    for i,j in combinations(range(n),2):
        v=Counter()
        for s,form in forms:
            if (i in s)!=(j in s):
                for e,a in form.items(): add(v,e,a)
        assert dict(v)=={(i,j):2},(n,i,j,v)
    return n*(n-1)//2

def reachable(start,adj,allowed=None):
    found={start};stack=[start]
    while stack:
        for v in adj[stack.pop()]:
            if (allowed is None or v in allowed) and v not in found:
                found.add(v);stack.append(v)
    return found

# Exhaustive abstract regression: O=0, three anchors=1,2,3, one non-anchor=4.
# All off-diagonal edges at centers other than O are freely chosen.
# The first-return implication is independent of geometric/K4 assumptions.
free_edges=[(u,v) for u in range(1,5) for v in range(5) if u!=v]
anchors={1,2,3};qualifying=0;witnesses=0
for mask in range(1<<len(free_edges)):
    adj=[set() for _ in range(5)]
    for k,(u,v) in enumerate(free_edges):
        if (mask>>k)&1: adj[u].add(v)
    ret={a:set() for a in anchors}
    for a in anchors:
        ret[a] |= adj[a]&anchors-{a}
        if 4 in adj[a]: ret[a] |= adj[4]&anchors-{a}
    incoming={b for a in anchors for b in ret[a]}
    for missing in anchors:
        adj[0]=anchors-{missing}
        reaches=reachable(0,adj)
        if missing in reaches:
            assert missing in incoming
            witnesses+=1
    strong_all=True
    for missing in anchors:
        adj[0]=anchors-{missing}
        if any(len(reachable(v,adj))!=5 for v in range(5)):
            strong_all=False;break
    if strong_all:
        qualifying+=1
        assert incoming==anchors
        # No self-loop; an incoming edge at every anchor forces a cycle.
        cycle=False
        for a in anchors:
            for b in ret[a]:
                if a in reachable(b,ret): cycle=True
        assert cycle

# Direct checks of the rational-dual criterion. These are toy matrices,
# not certificates for the open physical endpoint.
M=[[-1,1,1], [1,-1,0]]
y=[1,1]
z=[sum(y[i]*M[i][j] for i in range(2)) for j in range(3)]
assert z==[0,0,1]
report={
 'split_inverse_n_range':[4,24],
 'split_inverse_coefficient_identities':sum(split_basis_check(n) for n in range(4,25)),
 'abstract_graphs_checked':1<<len(free_edges),
 'omitted_anchor_reachability_implications':witnesses,
 'all_omissions_strongly_connected_graphs':qualifying,
 'dual_toy_certificate':{'matrix':M,'multipliers':y,'column_sums':z},
 'status':'Exact regression checks only; not a physical-terminal proof or an UNSAT certificate.'
}
print(json.dumps(report,indent=2))

```

### Embedded file: `check_strategy_output.json`

Bytes: 594
SHA-256: `1a00f6308d8b9d8517cf7eb726757822d4dd7b6c7cdc9a2340074e023e0c38ef`

```json
{
  "split_inverse_n_range": [
    4,
    24
  ],
  "split_inverse_coefficient_identities": 2296,
  "abstract_graphs_checked": 65536,
  "omitted_anchor_reachability_implications": 165888,
  "all_omissions_strongly_connected_graphs": 29346,
  "dual_toy_certificate": {
    "matrix": [
      [
        -1,
        1,
        1
      ],
      [
        1,
        -1,
        0
      ]
    ],
    "multipliers": [
      1,
      1
    ],
    "column_sums": [
      0,
      0,
      1
    ]
  },
  "status": "Exact regression checks only; not a physical-terminal proof or an UNSAT certificate."
}

```
