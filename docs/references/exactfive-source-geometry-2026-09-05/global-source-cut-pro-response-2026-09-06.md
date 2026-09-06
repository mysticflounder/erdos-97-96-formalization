## Result

I worked through the proposed global cut. I did not obtain False or a well-founded continuation, and I am not proposing another admitted producer. There are two concrete findings: an exact characterization of the minimal deletion's ambient radius classes, and a source-entitled alias showing why this particular outside-center witness need not be new. The former rules out promoting a multi-point minimal deletion core to an ambient actual blocker.

These are pen-and-paper deductions from the pasted hypotheses, not newly compiled Lean results. I used all five pasted source excerpts: the physical terminal, ordinary distinct residual, normal form, global blocking-subdeletion producer, and shared-radius/core fork, with the supplied digests. I also read the previous safe-selector report preserved in this conversation. A bounded indexed search returned MinimalDeletionCore declaration documentation at index commit ff86aa4d, including shellAt_selectedClass_eq, but not the declaration bodies. GitHub/source fetch was unavailable. Consequently I do not claim a fresh repository or kernel pin, an import audit of unseen bodies, or verification of the supplied file digests against repository bytes.

### Source qualification

The pasted R fields put q,w in the strict first-cap slice, but do not visibly assert that every point of E lies in that slice. Earlier source material gives at least three interior points, which is different. I have requested the full-containment declaration and do NOT use E entirely contained in that cap below. Nor do I substitute minimum-pair evidence for R.minimal.

## 1. The globally entitled cut, with exact data custody

Write a=N.retained, b=the retained blocker center, U=E union B union L, and W=A\U. The original strict-fresh source gives W nonempty: it omits E.erase d, is not d, and omits B and L. U is nonempty, is contained in A, and |U|<=12, since |E|=5, |B|=|L|=4 and a belongs to E intersect B.

Apply exists_global_cardMinimal_blocking_subdeletion R.minimal with precisely this U. Obtain z in W and a nonempty J subset U such that K4 at z fails on A\J and is restored on A\(J.erase s) for each s in J. This is a valid use of GLOBAL cardinal minimality. It does not require or produce a shortest chord.

The global-K4 premise on A is used for restoration and to ensure there are ambient rich classes. The carriers A\(J.erase s) are not asserted to satisfy GLOBAL K4. Hence they cannot be passed to the smaller-counterexample machinery merely because K4 holds at z.

## 2. Exact radial normal form of ANY such minimal deletion — proved on paper

For rho>0 put C_rho={x in A: dist(z,x)=rho}, and put D_rho=J intersect C_rho. Let Lambda={dist(z,s):s in J}. Since z is outside J, all members of Lambda are positive.

Then:

(1) For every rho in Lambda, |C_rho\J|=3 and |C_rho|=3+|D_rho|.

(2) Lambda is EXACTLY the set of ambient radii with at least four points. Every other positive-radius class has at most three points.

(3) Consequently the union of all ambient rich classes has cardinality |J|+3|Lambda|. In particular |J|+3|Lambda|<=|A|-1, because z is in none of these positive-radius classes.

Proof of (1): fix s in J and use its restoring K4 witness. Relative to A\J, restoring s adds exactly one point. Its witnessing radius must therefore be dist(z,s); otherwise that same four-point witness existed before restoration. The class on A\J has at most three points because J blocks every positive radius, and after adding s has at least four. Thus it had exactly three. Adding all points of J at that radius proves the ambient formula.

Proof of (2): each radius hit by J is rich by (1). Conversely an ambient rich class disjoint from J would survive the deletion, contradiction. Thus it contains some s in J and its radius belongs to Lambda. The disjointness of distinct radius classes gives (3).

This removes an ambiguity in the restoring-radius formulation: the restoring radius is not an arbitrary independent choice. It is forced to be dist(z,s).

## 3. Exhaustive treatment of singleton, shared-radius, and distinct-radius branches

### J={s}

There is exactly one ambient rich radius and its full class has exactly four points, three besides s. Deleting s destroys K4 at z, so z is an actual critical center for source s in the ambient carrier.

This permits a suitable override at s, but does NOT say the originally chosen H.centerAt s is z. It also says nothing about whether s is q, w, another anchor, or a point of B/L. Thus an endpoint-reselection API is not applicable without its incidence and orientation hypotheses.

### |J|>=2 and some shared radius

Some ambient class has at least five points, by (1). Therefore z is fully single-deletion robust. In fact this conclusion also holds in every remaining |J|>=2 case.

### |J|>=2 and all radii distinct

There are exactly |J| pairwise disjoint ambient rich classes, each with four points. Their full-class status is consistent with the indexed documentation of MinimalDeletionCore.shellAt_selectedClass_eq. Any singleton deletion affects at most one of these classes, so another survives. Again z is fully single-deletion robust.

Thus the actual sharp dichotomy is:

* |J|=1: z has one unique rich four-class and is singly critical;
* |J|>=2: z is fully single-deletion robust.

For the second arm, for ANY total critical shell H' on A and ANY source x in A, H'.centerAt x cannot equal z. Otherwise robustness at z contradicts H'.no_qfree_at x. This is a direct use of TOTAL critical shells.

In particular, the four-shells supplied by a multi-source core cannot be treated as ambient actual-blocker shells at z. Their full ambient radius classes may indeed have size four, but with two or more such radii z is not a blocker for any singleton deletion. Restored-carrier criticality and ambient source criticality are different assertions.

No new Moser apex follows in the shared-radius arm: z is just a carrier point, not shown to be an MEC-boundary support vertex. Neither a valid new SurplusCapPacket nor an exact-five/unique-rich-radius residual follows. Even a numerical radius decrease, if obtained separately, would not solve this state-transport problem.

## 4. The outside witness can already be the OLD blocker — a concrete source-entitled obstruction

The definition W=A\(E union B union L) removes SUPPORTS, not the three centers O,b,V. Neither the normal form nor the three-row packet says those centers lie in U.

In the case b notin U, the existing source already supplies a completely valid output of the global producer:

    z=b,  J={a}.

Indeed b belongs to A\U; a belongs to B subset U; orientation identifies b with the actual blocker H(a); H.no_qfree_at a says deleting a kills K4 at b; and restoring a leaves A itself, where D.K4 holds. All premises of the returned minimal-deletion witness hold. No new row, radius, center, or decrease has been obtained.

Likewise, when O notin U one may take z=O and any two distinct members of E as J: the unique rich five-class becomes three after both are deleted and four when either is restored. This is the already-known exact-five obstruction, not a fresh exact-five state. V is not excluded as an outside center either.

These are conditional source-entitled aliases, not fabricated Euclidean countermodels and not claims that the physical source is realizable. They show exactly why the producer's conclusion does not enforce newness.

One can exclude these aliases by deleting U union {O,b,V} instead, but existence of a remaining point then needs proof. The available bound on that union is at most 15, so |A|>=16 is sufficient; no such uniform lower bound is present in this leaf. This repair revives a cardinality fork and still provides no contradiction in either arm.

## 5. What the complementary inside escape does add

Apply the stated all-selected-rows escape theorem to U. Its center c lies in U and every selected four-row at c has a member outside U.

It follows rigorously that c differs from O,b,V: each of those centers has a known selected four-row contained in U (respectively E.erase d, B, L). This gives a genuinely different ROW CENTER on the inside of the cut. It does not prove c is an actual blocker.

Choose any selected row K at c using D.K4. The escape theorem supplies t in K.support\U. But its t need not be the z from the outside deletion theorem; its c need not be H.centerAt t; and its support need not contain any particular s in J. Total H gives a critical row containing t at H(t), not a theorem identifying that row with K. Such an identification would require that c actually blocks deletion of t, which is not supplied by the universal-escape property.

The two global theorems therefore provide oppositely directed dependencies across the cut, not a synchronized metric configuration. Even synchronized opposite dependencies would not by themselves contradict strict convexity: one still needs the actual ordered equalities and applicable geometric guards.

## 6. Testing the negation of the safe-selector case

Assume, as an explicit CASE hypothesis, that no safe point lies outside U. Then every point of W lies outside the first closed cap and the supporting triangle, and strictly inside the O-radius-r circle. In particular O,V lie in U, excluding those two aliases; the b alias is not excluded by that statement alone.

A further genuine geometric restriction follows from the previously inspected commonPhysicalPair_center_mem_capInteriorByIndex theorem in ATail/TwoCenterCapLocalization.lean: for z in W, a circle centered at z cannot contain two distinct points of E's strict first-cap slice. Otherwise O and z bisect that pair and the source theorem puts z in the very cap it was assumed to avoid.

This does NOT eliminate the shared-radius branch. Its s,t may lie in B/L, or elsewhere in E outside the authenticated interior slice; J need not contain q,w or any two interior anchors. It also does not eliminate the singleton or distinct-radius branches. The three residual companions in each restoring class need not lie outside U; they are only outside J. Replacing A\J by A\U at that step reverses the required containment and is invalid.

The known actual-fresh double-hit lemmas concern the row centered at H(z), whereas the global deletion data concern radius classes centered at z. Applying them directly to the latter changes the center role. A double hit by a row at z would have the cap-localization consumer above, but the deletion producer does not supply that double hit.

## 7. Precise remaining obstruction and acceptance boundary

The first missing mathematical bridge after these globally entitled steps is source/metric synchronization: force an applicable ordered pair-incidence or another geometric forbidden pattern in the actual crossing rows, rather than merely a rich radius at an arbitrary outside center. In the no-safe case the most immediate available contradiction requires two authenticated first-cap class points on a restoring circle centered at z; no pasted field forces that occurrence, and the singleton branch has no pair to offer. In the inside-escape approach the missing precursor is an actual criticality/row identity tying c and its escaped source to the outside deletion data.

A proposed bridge must handle the old-center aliases and singleton J, not only co-radial pairs. A multi-source core cannot supply an ambient actual center because the robustness theorem in Section 3 proves the opposite. No current pasted consumer closes those gaps.

I have not established a strict measure: shrinking A to a restored carrier does not preserve global K4, a new rich center is not a valid rebased cap state, and the two cut directions do not provide monotone radii or a path-shortening rule. Small cardinalities and longer return cycles therefore remain unresolved. The proof above is an exact analysis of this proposed global instantiation, not terminal closure or claimed proof-spine reduction. No repository edits, builds, solver launches, or new sorries are recommended on its strength.