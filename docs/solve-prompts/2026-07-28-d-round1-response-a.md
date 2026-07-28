# D round-1 response A (deep thinker, 2026-07-28)

Response to `2026-07-27-post-card-eleven-unique-radius.md` (D package, leaves D1–D4 in
`FrontierLiveClosure.lean`). First of two independent runs; the second is
`2026-07-28-d-round1-response-b.md`. Math delimiters preserved verbatim from the
transcript (mangled `(...)`/`[...]` style). No leaf resolved; bankable content:
unique-four-center lemma, D1 swapped common-deletion construction + 2×2-split residual,
D2 protected-pair structure, D3 three-center packet, D4 shared-row normal form.

---

I did **not** obtain a complete Branch-A proof or Branch-B certificate for any of D1–D4. Consequently, I did not replace any of the four `sorry` bodies, and no kernel-checked Lean patch is being claimed. This falls short of the attached prompt's return contract, which requires complete resolution of at least one leaf.

The source audit did confirm that the attached mathematical unpacking faithfully represents the four theorem interfaces: there is no omitted enclosing hypothesis or immediately applicable contradiction hidden in their declarations. The current source still contains the four stated `sorry` bodies.

## Strongest fully rigorous lemma obtained

Let (x\in A), let (c=\chi(x)), and let

[
R_x=\Lambda(c,r_x),\qquad |R_x|=4,\qquad x\in R_x,
]

with

[
\neg K_4(A\setminus{x},c).
]

Then:

[
\forall s>0,\quad |\Lambda(c,s)|\ge4\Longrightarrow s=r_x.
\tag{1}
]

Thus (c) is automatically a **unique-four center**, even though uniqueness is not an explicit field of `CriticalShellSystem`.

Indeed, suppose (s>0) and (|\Lambda(c,s)|\ge4). If (s\ne r_x), then (x\notin\Lambda(c,s)), because (d(c,x)=r_x). The entire (s)-row therefore remains after deleting (x), contradicting
(\neg K_4(A\setminus{x},c)). Hence (s=r_x), and the corresponding full row is the exact four-point row (R_x).

A useful exact corollary is

[
K_4(A\setminus{y},c)
\quad\Longleftrightarrow\quad
y\notin R_x.
\tag{2}
]

For the reverse implication, (R_x) simply survives. For the forward implication, if (y\in R_x), deleting (y) leaves only three points at the unique possible K₄ radius, while (1) rules out every other radius.

This lemma is directly formalizable from the existing shell fields and elementary `Finset.erase` cardinality facts.

## D3: exact reduction obtained

Write

[
q=\tilde q,\qquad w=\tilde w,\qquad
b_q=\chi(q),\qquad b_w=\chi(w).
]

Consider the first branch of D3.2:

[
K_4(A\setminus{w},b_q).
]

By (2),

[
w\notin R_q.
\tag{3}
]

The same deletion (A\setminus{w}) preserves K₄ at three pairwise-distinct carrier centers:

[
a_1,\qquad a_2,\qquad b_q.
\tag{4}
]

The three survivals follow respectively from:

* E6 directly;
* E8, since the K₄ witness in (A\setminus{q,w}) also lies in (A\setminus{w});
* D3.2.

They are pairwise distinct. Certainly (a_1\ne a_2). If (b_q=a_1), the no-survival condition for deleting (q) at (b_q) contradicts E6. If (b_q=a_2), it contradicts the singleton survival at (a_2) obtained from E8.

Moreover, (w)'s selected obstruction center (b_w) is different from all three centers in (4):

[
b_w\ne a_1,\qquad b_w\ne a_2,\qquad b_w\ne b_q.
\tag{5}
]

The first two inequalities follow by comparing E6/E8 with the no-survival condition for (w), and the third is D3.1.

Thus either disjunct of D3.2 produces the following symmetric normal form:

> There is one deleted point whose deletion preserves K₄ at three pairwise-distinct carrier centers, while its selected obstruction center is a fourth carrier center distinct from all three.

It also produces three explicit four-point rows in the deleted carrier:

* the exact first-apex row (U\setminus{w}), where (U=\Lambda(a_1,\hat\rho));
* an (a_2)-row avoiding both (q,w);
* (R_q), which contains (q) and omits (w).

The three centers are distinct, so every pair of these rows has intersection cardinality at most two.

This does not itself contradict minimality: the fourth center (b_w) witnesses at least one failure in (A\setminus{w}), exactly as minimality requires. The remaining D3 gap is therefore the following precise statement:

> Prove that the exact-five cap geometry, no-((m,4,4)) condition, and the three-center deleted-row packet above force either every carrier center to survive the deletion, an alternative ((m,4,4)) packet, or another stated contradiction.

I found no noncircular proof of that statement.

## D4: exact shared-row normal form

Let

[
b=\chi(\tilde q)=\chi(\tilde w).
]

Because (\tilde w\in R_{\tilde q}) and (\tilde q\in R_{\tilde w}),

[
d(b,\tilde q)=r_{\tilde q}
=d(b,\tilde w)=r_{\tilde w}.
]

Consequently,

[
R_{\tilde q}=R_{\tilde w}
=\Lambda\bigl(b,d(b,\tilde q)\bigr)=:K,
\qquad |K|=4.
\tag{6}
]

By the unique-four lemma, this is the only K₄ row centered at (b).

Since (b\in\Gamma_1^\circ\subseteq\Gamma_1), the ordered-cap row bound applies to (K). Both (\tilde q,\tilde w) lie in (K\cap\Gamma_1^\circ), so

[
K\cap\Gamma_1={\tilde q,\tilde w}.
\tag{7}
]

The other two points of (K) therefore lie outside (\Gamma_1).

D4.5 then gives the exact perpendicular-bisector census

[
A\cap\operatorname{Bis}(\tilde q,\tilde w)={a_1,b}.
\tag{8}
]

I checked that (6)–(8) are not, by themselves, incompatible with convex independence: the corresponding local circle-and-bisector picture has convex planar realizations. Any D4 proof must materially use the global K₄/minimality or no-((m,4,4)) fields. The precise remaining gap is:

> From E together with (6)–(8), force a third carrier point on the perpendicular bisector, construct a forbidden alternative packet, or construct a smaller convex-independent K₄ carrier.

No such implication was completed.

## D2: mutual unique-row structure

Let

[
U=\Lambda(a_1,\hat\rho),\qquad
V=\Lambda(a_2,r').
]

Both are exact four-point rows, and each is the unique K₄ row at its center.

The original frontier's double survival at (a_2) forces

[
q_F,w_F\notin V.
\tag{9}
]

Otherwise deleting (q_F,w_F) would remove a member of the only four-point K₄ row at (a_2), leaving at most three points there.

Similarly, the swapped frontier's double survival at (a_1) forces

[
q',w'\notin U.
\tag{10}
]

Thus the two protected pairs point in opposite directions:

[
q_F,w_F\in U\setminus V,\qquad
q',w'\in V\setminus U.
\tag{11}
]

Since (a_1\ne a_2), the two-circle intersection bound gives

[
|U\cap V|\le2.
\tag{12}
]

The ingress witness row centered at (a_2) must equal (V): it is a four-element subset of a positive (a_2)-row, and the unique-radius field and (|V|=4) leave no other possibility. Likewise, the ingress row at (c_1=\chi^*(u)) is the unique critical row at (c_1), and its intersection with (V) has cardinality at most two because (c_1\ne a_2).

Therefore D2 has been reduced, without weakening, to three exact four-point rows:

[
U\text{ at }a_1,\qquad
V\text{ at }a_2,\qquad
R_u\text{ at }c_1,
]

where (U,V) carry the mutually protected pairs (11), and (R_u\cap V) has at most two points.

The missing step is to make the swapped cap roles and no-((m,4,4)) field contradict that three-row incidence pattern. Reapplying the existing frontier dispatcher merely returns to the same unique-radius family and is circular.

## D1: sharp unresolved occupancy case

Let (U=\Lambda(a_1,\hat\rho)), and let (X,Y) be the two disjoint exact four-point rows centered at (a_2).

The interior pair (p,p'\in U\cap\Gamma_1^\circ) occupies two points of (U) outside (\Gamma_2^\circ). Hence

[
|U\cap\Gamma_2^\circ|\le2.
\tag{13}
]

Choose two strict-(\Gamma_2) points from each of (X) and (Y). Since the rows are disjoint, these are four distinct points. By (13), at least two of them lie outside (U).

If one row contains two such outside-(U) points, deleting that pair preserves:

* (U), and therefore K₄ at (a_1);
* the other (a_2)-row, and therefore K₄ at (a_2).

This produces a genuine swapped common-deletion pair.

The only occupancy case not covered by that construction is the rigid (2\times2) split:

[
|X\cap\Gamma_2^\circ|
=|Y\cap\Gamma_2^\circ|=2,
]

and each of (X,Y) has exactly one of those two points in (U) and exactly one outside (U). In that case,

[
|U\cap\Gamma_2^\circ|=2,
]

and the four points of (U) are precisely the two given (\Gamma_1^\circ) points together with one (\Gamma_2^\circ) point from each of (X,Y).

The remaining D1 gap is to rule out this split using the ingress, bisector localization, minimality, or no-((m,4,4)); alternatively, the swapped common-deletion construction in the nonsplit case needs a noncircular terminal theorem.

## Final status

| Leaf | Status       | Strongest result |
| ---- | ------------ | ---------------- |
| D1   | Not resolved | Reduced to the exact (2\times2) strict-cap split, apart from a swapped common-deletion branch |
| D2   | Not resolved | Two mutually protected unique four-rows (U,V), with opposite pairs outside the other row and (|U\cap V|\le2); ingress supplies a third exact row |
| D3   | Not resolved | One deletion preserves three pairwise-distinct centers while its selected blocker is a fourth distinct center |
| D4   | Not resolved | A shared unique exact-four row meeting (\Gamma_1) exactly in ({\tilde q,\tilde w}), with exactly two carrier bisector points (a_1,b) |

No exact Branch-B certificate was found. The local coordinate models considered do not satisfy the global K₄ property, the complete critical-shell table, and minimality, so none qualifies as a route-killing certificate under the attached specification.
