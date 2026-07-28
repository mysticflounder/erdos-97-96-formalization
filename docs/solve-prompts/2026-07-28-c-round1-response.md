# C round-1 response (deep thinker, 2026-07-28)

Response to `2026-07-27-physical-apex-boundary.md` (C package, leaves C1
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU` and C2
`false_of_exactFourMutualOmissionRigid221_nonphysicalCollision` in
`FrontierLiveClosure.lean`). Math delimiters preserved verbatim. No leaf resolved;
bankable content: |D₀|=2, unique K4 radius at a₂, apex-witness exactification,
five-point collision class, full robustness at P, mutual omission of the collision
pair, placement census.

---

## Result

I did **not** obtain a complete Branch A contradiction or a complete Branch B realization for either leaf. I therefore cannot honestly claim that either Lean `sorry` has been resolved. The current repository version I inspected still contains the direct `sorry` bodies for both requested declarations.

The following are the strongest complete consequences I established from the attached hypothesis lists. They substantially normalize both leaves, but they do not satisfy the prompt's return contract by themselves.

## Leaf C1: exact structure of the physical-apex deletion

Put

[
C:=\Gamma(a_2,\rho),\qquad D:=D_0.
]

Thus (|C|=5), (D\neq\varnothing), (D\subseteq C), deleting (D) blocks (a_2), and restoring any (s\in D) restores K4 at (a_2).

### Lemma C1.1: (\lvert D\rvert=2)

First, (|D|\neq1). If (D={s}), then the radius-(\rho) class after deleting (D) is (C\setminus{s}), which has four points. This contradicts

[
\neg K4(A\setminus D,a_2).
]

Now fix (s\in D). Restoration gives a positive radius (r_s) carrying at least four points of

[
A\setminus(D\setminus{s})
]

around (a_2). This restored class must contain (s): otherwise all its points would also survive deletion of the whole of (D), contradicting blocking.

Since (s\in C),

[
r_s=d(a_2,s)=\rho.
]

Consequently the restored radius-(\rho) class is exactly

[
C\setminus(D\setminus{s}),
]

whose cardinality is

[
5-(|D|-1)=6-|D|.
]

Restoration requires this to be at least four, so (|D|\le2). Together with (|D|\ge2),

[
\boxed{|D_0|=2}.
]

### Lemma C1.2: (\rho) is the unique K4 radius at (a_2)

Suppose (r>0) and

[
4\le |\Gamma(a_2,r)|.
]

If (r\neq\rho), then the two classes at the same center are disjoint:

[
\Gamma(a_2,r)\cap C=\varnothing.
]

Because (D\subseteq C), deletion of (D) leaves the entire (r)-class untouched. It would therefore still supply four equidistant points at (a_2), contradicting blocking. Hence

[
\boxed{\forall r>0,\quad
4\le|\Gamma(a_2,r)|\Longrightarrow r=\rho}.
]

Thus the physical apex has exactly one K4 radius, and its complete class has cardinality five.

### Lemma C1.3: exactification of every apex-side deleted witness

For (z\in C), any four-point equidistant witness at (a_2) inside (A\setminus{z}) must be

[
\boxed{C\setminus{z}}.
]

Indeed, Lemma C1.2 forces its radius to be (\rho), while (C\setminus{z}) itself has exactly four points.

In particular, the (a_2)-side four-sets in the two joint-deletion certificates of (C7.5) and (C7.6) are both the same set:

[
C\setminus{z^\star}.
]

The overlap inequalities in those certificates are therefore saturated by the rigid two-point row traces:

[
B_u\cap(C\setminus{z^\star})=I_u,\qquad
B_v\cap(C\setminus{z^\star})=I_v.
]

### Remaining C1 normal form

Using the proved normal-form theorem already present in the source, the hypothesis (u\neq\mathrm{source}) gives

[
I_u={\mathrm{source},u},
]

and the source row meets (I_u) only at `source`. The three actual blockers belonging to `source`, (u), and (v) are pairwise distinct.

Writing (z=z^\star) and (I_v={v,x}), the physical class is the disjoint decomposition

[
C={z}\sqcup{\mathrm{source},u}\sqcup{v,x}.
]

The source blocker (b=c'(\mathrm{source})) is confined by (C9.4) to

[
b=z,\qquad b=u,\qquad\text{or}\qquad b\in{v,x}.
]

The source row contains `source`, omits (u) and (v), has at most two points in (C), and does not contain its center (b).

I was not able to eliminate all four resulting placements (b=z,u,v,x). In particular, the exact-two deletion result does not constrain which two members of (C) form (D_0): once (a_2) has a unique five-point class, every two-element subset of (C) has precisely the blocking/restoration behavior required by (C8.4)–(C8.5).

## Leaf C2: exact collision circle and mutual omission

Let

[
P:=\texttt{globalDeletion.center},\qquad
C:=\Gamma(a_2,\rho).
]

Choose the collision points (s,t\in D_0) from (C10.2), and set

[
r:=d(P,s)=d(P,t),\qquad K:=\Gamma(P,r).
]

Because (P\notin C) while (s\in C), (P\neq s), so (r>0).

### Lemma C2.1: the collision class has exactly five points

Restore (s). A K4 witness at (P) in

[
A\setminus(D_0\setminus{s})
]

must contain (s); otherwise it would also survive deletion of all of (D_0), contradicting blocking.

Its radius is therefore (d(P,s)=r). The restored set contains at least four members of (K), while (t) has been deleted there. Adding (t) back gives

[
|K|\ge5.
]

The circles centered at (P) and (a_2) have distinct centers. Hence the two-circle bound gives

[
|K\cap C|\le2.
]

Since (s,t\in K\cap C) and (s\neq t),

[
K\cap C={s,t}.
]

As (D_0\subseteq C), it follows that

[
K\cap D_0={s,t}.
]

After deleting all of (D_0), the radius-(r) class has (|K|-2) remaining points. Blocking at (P) implies (|K|-2\le3), and therefore (|K|\le5). Thus

[
\boxed{|K|=5},\qquad
\boxed{K\cap C=K\cap D_0={s,t}}.
]

So the collision is not merely an equality of two distances: it produces a second complete five-point circle class, centered at (P), which meets the physical class in exactly the collision pair.

### Lemma C2.2: (P) is fully deletion-robust

A five-point positive-radius class loses at most one member under any singleton deletion. Therefore

[
\boxed{\forall x\in A,\quad K4(A\setminus{x},P)}.
]

The project's proved blocker interface says that a fully deletion-robust center cannot be an actual critical-shell blocker; equivalently, every late blocker is distinct from (P). The same applies to the already robust physical apex (a_2).

Thus, for every (x\in A),

[
c'(x)\neq P,\qquad c'(x)\neq a_2.
]

### Lemma C2.3: (P\neq a_1)

If (P=a_1), then (K) would be a positive-radius K4 class at (a_1) of cardinality five. Hypothesis (C3.5) would force its radius to be the unique first-apex radius (\rho_0), but (C3.4) says that complete class has exactly four members. Hence

[
\boxed{P\neq a_1}.
]

Consequently (P,a_1,a_2) are three distinct carrier points.

### Lemma C2.4: no late row contains both collision points

Suppose some late row (\Sigma'(x)), centered at (b=c'(x)), contained both (s) and (t). Then

[
d(b,s)=d(b,t).
]

But also

[
d(a_2,s)=d(a_2,t)=\rho
]

and

[
d(P,s)=d(P,t)=r.
]

The centers (a_2,P,b) are three distinct carrier points: (P\neq a_2) is (C10.1), while Lemma C2.2 gives (b\neq a_2,P). They would all lie on the perpendicular bisector of the distinct carrier pair (s,t), contradicting the bound of at most two carrier bisector centers. Therefore

[
\boxed{\forall x\in A,\quad
{s,t}\nsubseteq\Sigma'(x)}.
]

In particular,

[
t\notin\Sigma'(s),\qquad
s\notin\Sigma'(t).
]

Thus the collision pair is itself a mutually omitted pair for the late system.

Their blockers are distinct. If (c'(s)=c'(t)), equality of actual blockers forces equality of their complete selected supports. Since each source lies in its own support, that common support would contain both (s) and (t), contradicting the preceding result. Hence

[
\boxed{c'(s)\neq c'(t)}.
]

### Lemma C2.5: collision placement in the rigid partition

The collision pair cannot be the two members of (I_u), because (\Sigma'(u)) contains every member of (I_u). Similarly, it cannot be the two members of (I_v). Therefore, relative to

[
C={z^\star}\sqcup I_u\sqcup I_v,
]

the pair ({s,t}) must be either:

[
\text{one point from }I_u\text{ and one from }I_v,
]

or

[
z^\star\text{ together with a point of }I_u\cup I_v.
]

These are the only remaining collision placements.

### Exact remaining C2 gap

The bisector argument closes every case in which a canonical late row is forced to contain both (s) and (t). What remains unproved is that the cross-row/singleton placements above necessarily produce such a row, or otherwise contradict the cap, minimality, ingress, or certificate data.

The local geometry alone does not supply that implication: two distinct carrier centers can support two five-point circles with exactly a two-point intersection while all the displayed points remain in convex position. Therefore a complete proof must make essential additional use of the blocker/certificate system, the cap ordering, or global minimality; the two-circle and perpendicular-bisector bounds alone do not finish C2.

## Repository consequence

The most useful immediate formalization targets are therefore:

1. a C1 helper proving `globalDeletion.deleted.card = 2`;
2. a C1 helper proving uniqueness of the K4 radius at `S.oppApex2`;
3. a C2 helper constructing the exact five-point collision class;
4. a C2 helper proving full deletion robustness at `globalDeletion.center`;
5. a C2 helper proving that the collision points mutually omit one another's late rows and have distinct blockers.

Those lemmas are complete mathematical consequences of the stated interfaces, but the final contradiction required for either target theorem remains unresolved.
