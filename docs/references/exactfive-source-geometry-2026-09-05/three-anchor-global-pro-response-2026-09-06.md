# Exact-five three-anchor consult: sharper mutual bound, exact local control, and the genuine next source

Status: substantive partial answer. I have NOT closed the exception under the complete ordinary/minimum-pair source. I did prove a stronger mutual-return restriction and certify an exact Euclidean model showing that the proposed geometric-only exclusion is false, even with BOTH full V four-classes and genuine local singleton criticality at both mutual centers. The model does not satisfy global K4 or total H and is NOT a P97/full-source counterexample.

The executable exact-arithmetic certificate is delivered and attached in channel message #16675: exactfive-three-anchor-local-control-2026-09-06.md, attachment 01M1VV8BB6FM6B3B8F2R9Z0R8X, 8,788 bytes, SHA-256 15d80b548874d6797a90c7af3a199cd9243a0a7ccf5d315a862f83fec0d5caa0. It uses only Python's standard library. All decisions are exact in Q(sqrt(3)); floating-point numbers are diagnostic output only. No Lean build or solver edit was performed.

## 1. Audit of the supplied note

The upper equilateral placement's affine-combination calculation is correct. Its convex-independence/cap-functional exclusion does not require H reselection or a fresh-source guard. The lower placement's h >= sqrt(3) exclusion is also correct. The V-distance injectivity/bad-pair argument and the >=4-anchor short-admissible-pair argument survive this audit, subject to their stated source guards and minimum-pair custody.

I inspected current source through GitHub, not merely the indexed declaration descriptions:
- FirstApexInteriorPairGeometry.lean, lines 180-365, blob b6266789b7d6bb51d6fd773fe50b0213bf853d4a: strict positive inner product at O, nonpositive inner product at c, and strict radius drop are exposed without freshness/H-override guards.
- MinimalAdmissibleInteriorPair.lean, lines 1-250, blob 5be0f0627065cb0ffb43215ba7685f73fbcfa6e2: minimization is genuinely over admissible pairs, and rebase preserves the same endpoints/minimum; this does not make the minimum a field of every ordinary residual.
- CapInteriorRadiusCounting.lean, blob acc5cb7810e66b5300035b35bdd632e342008d9c: the all-but-two strict-cap count.
- CommonDeletionTwoCenter.lean, lines 1-145, blob 680c264243af9fd15cc2fabb5992f375ba51f5a3: the packet selects four-point supports, not a unique ambient radius at V.
- FrontierLiveClosure/Rigid221Closure.lean, lines 1910-1985, blob 8f4e8746021b3994aba879ce122b07c1bfbd10cc: the common-center eliminator routes through ExactFiveCommonAdaptiveReselection.nonempty_swapped_or_distinct, and sends its distinct outcome back into the distinct exact-five eliminator.

The last point blocks an apparent shortcut: reselecting both endpoint blockers to c and invoking the common-center eliminator is not an independent closure of the current distinct physical case; it can re-enter the unresolved distinct branch. I did not transport the dependent normal form through such a reselection.

## 2. New paper-proved mutual-return inequalities

Keep exactly the supplied mutual hypotheses: q,w are distinct strict first-cap points on O's radius-r class; b is an actual blocker of e in {q,w}; c is an actual blocker center; q,w,b belong to Kc; and c belongs to Kb. Let rho be the common mutual-row radius and L=dist(q,w).

Then the stronger conclusions are

  (2+sqrt(3))*rho^2 < L^2,
  rho < (sqrt(3)-1)*r,
  dist(O,c) < r.

Equivalently, inner(q-c,w-c) < -sqrt(3)*rho^2/2, so angle q-c-w is strictly greater than 150 degrees. These are paper proofs, not kernel-checked declarations. They apply to the ordinary mutual configuration and do not need minimum-pair custody or |I|=3.

Proof. Relabel so e=q and use the note's similarity normalization q=(-1,0), w=(1,0), O=(0,-h), c=(0,k). The existing proof gives 0<k<h and k<=1. The strict positive O-inner product additionally gives h^2-1>0, hence h>1. Write s=sqrt(3). The upper placement is excluded by the supplied proof, leaving

  b=((s*k-1)/2,(k-s)/2), r^2=1+h^2, rho^2=1+k^2.

First k<1/s. Otherwise b_x>=0, 2(1-|b_x|)=3-s*k, and

  (3-s*k)-(s-k)=3-s-(s-1)*k >= 4-2*s > 0.

As h>1, this yields h*(3-s*k)>s-k. Together with -1<b_x<1 and -h<b_y<0, b lies in triangle Oqw, contradicting convex independence.

For k<1/s, b_x<0. Membership of b in closed triangle Oqw is now equivalent to s-k <= h*(1+s*k); the other triangle inequalities already hold. Convex independence excludes boundary membership too. Consequently

  h+(s*h+1)*k < s.

Thus 1<h<s and

  0<k<(s-h)/(1+s*h)<(s-1)/(s+1)=2-s.

It follows that rho^2<1+(2-s)^2=4/(2+s), giving the first inequality since L=2. As r^2>2, rho^2/r^2<4-2*s=(s-1)^2, giving the contraction factor. Finally

  2*h*k+k^2 < 2*s*(2-s)+(2-s)^2=1,

so (h+k)^2<1+h^2, proving dist(O,c)<r. All metric conclusions survive positive similarity. End proof.

This is a stronger geometric restriction, not yet a decreasing-measure proof for dependent source packets. A producer for the next packet would still be required before interpreting the contraction as descent.

## 3. Exact Euclidean local control: the two V four-classes do not suffice

The attached checker constructs 24 exact points in Q(sqrt(3)). Its verified properties are simultaneous, not separate abstract tests:

- Strict convex independence, with all 528 supporting-edge determinants strictly positive. An additional replay checked all 2024 ordered triples in the supplied cyclic order.
- An acute support triangle O,V,W, all points in its circumdisk, exactly O,V,W on its boundary, and the circle center strictly inside the triangle. Thus this disk is genuinely the MEC: the positive barycentric average of squared distances to any alternative center is the displayed radius squared plus that center's squared displacement.
- Strict cap cardinalities opposite O,V,W are 6,7,8, respectively; closed cardinalities are 8,9,10. W's opposite cap is the unique largest cap, so O,V have the intended non-surplus geometric roles. This certifies the geometric profile, NOT all fields of CounterexampleData/noM44 or a complete SurplusCapPacket.
- O has exactly one rich class E={aL,aR,q,u,w}, of cardinality five. Its strict first-cap slice is exactly I={u,q,w}, with two E-points outside.
- V has exactly two rich full classes, Lq={q,Q1,Q2,Q3} and Lu={u,U1,U2,U3}, each cardinality four. Singleton deletion is robust at O and V.
- {u,q} is the unique bad short I-pair. Both {q,w} and {u,w} preserve K4 at V, and dist(q,w)=2<dist(u,w). Here r^2=13/4<4. Thus {q,w} really is the minimum admissible pair and really is long.
- c has the UNIQUE FULL rich four-class Kc={q,w,b,d}, and b has the UNIQUE FULL rich four-class Kb={w,c,B1,B2}. The mutual incidences b in Kc, c in Kb, and w in both are exact. Both centers have actual singleton criticality at every member of their respective row. This is not a restored-carrier/subset surrogate.

Base coordinates are

  O=(0,-3/2), q=(-1,0), w=(1,0), c=(0,1/50),
  V=(207/200,-239/10000), W=(-207/200,-239/10000),
  b=((1-sqrt(3)/50)/2,(1/50-sqrt(3))/2).

Here b is the lower placement attached to isolated endpoint w; rho^2=2501/2500. All remaining coordinates are defined explicitly by rational rotations and a tiny outward parabola in the delivered checker. Replaying that checker is sufficient; there is no absent search program needed to reconstruct the witness.

Crucial limitation: the ONLY rich centers are O,V,b,c. The other 20 centers have no K4 class. Global K4 is false, total H is impossible, and D.Minimal/the original full physical normal form are not established. In particular u has no actual blocker: the only nonrobust rich centers are b,c, and neither row contains u. The symbol d in Kc is just a row point, not H(u).

Therefore convexity/MEC geometry + the five-class + both V four-classes + minimum-admissible long pair + mutual local criticality do NOT by themselves exclude the exception. This is a rigorous control against omitting global hypotheses, not a refutation of the full requested theorem.

## 4. A genuine full-source producer and the exact remaining traces

There is a specific next actual object that the local model lacks but the full source supplies. Write I={u,q,w} with bad pair {u,q} and chosen minimum admissible pair {q,w}. Let

  d0=H(u), with its unique full actual four-row Kd0.

This requires no H override and no new choice principle beyond the existing total H. Then d0 is distinct from O,V,b,c:

1. It differs from O,V because they are fully singleton-deletion robust.
2. It differs from c because Kc intersect E={q,w}, so u is absent from c's unique rich row.
3. It differs from b. Kb already contains its endpoint e in {q,w}. If u were also in Kb, the two-interior-point localization would put b in the strict first cap, contradicting the mutual geometry that places b outside the closed first cap. The same argument excludes the other endpoint, so Kb intersect I={e}.

Kd0 cannot contain both q and w: otherwise its circle and O's circle share three distinct noncollinear points u,q,w, forcing d0=O. Thus the source-entitled exhaustive trace alternatives are exactly

  Kd0 intersect I = {u}, {u,q}, or {u,w}.

In the {u,q} arm, raw pair geometry applies even though {u,q} is bad for V joint deletion. It puts d0 in the strict first cap and Kd0 intersect closed C1={u,q}; if sigma is its radius, 2*sigma^2 <= dist(u,q)^2. The center c is omitted from Kd0 because c is another first-cap point and is not an E-point. Analogous pair geometry applies in the {u,w} arm. These are actual rows centered at d0, not rows centered at H(d0).

What I have NOT proved is a contradiction in all three trace arms. The first missing incidence step is now concrete: exclude the singleton trace {u}, or force an additional authentic row incidence in that arm, and supply actual consumers for the two pair traces. Merely repeating the N-cut does not force those incidences. No dependency transport or global closure follows from this trace producer alone.

## 5. Coverage and formalization recommendation

The original short-pair mutual exclusion remains valid. The >=4-anchor min-pair route remains valid with retained custody. The new 150-degree/radius-contraction inequalities strengthen every ordinary mutual double-hit case. The 24-point control rules out the purely geometric three-anchor shortcut. The total-H third-anchor trace producer is proved, but its residual trace consumers remain open.

Zero/one interior-hit cases, non-mutual returns, the full three-anchor exception, and unconditional exact-five closure are NOT resolved here. No finite-n certificate is being promoted to a uniform proof.

Concrete tasks for luna-swarm: formalize the normalized inequality h+(sqrt(3)*h+1)*k<sqrt(3), its three invariant metric consequences, and the H(u) distinct-center/three-trace producer under the original guards. Keep the local checker as a regression control against a consumer that silently drops global K4 or total H. Do not add admissions or claim terminal closure.

The full local report, including derivations, source blob references, the executable checker, and successful replay notes, is exactfive-consult-2026-09-06.md, SHA-256 926e2e3d6ba0b40a05177a22afd07614148e6ad8c43027a465e7a573641ef65a. The remotely delivered certificate is the separately hashed file attached to #16675 above.