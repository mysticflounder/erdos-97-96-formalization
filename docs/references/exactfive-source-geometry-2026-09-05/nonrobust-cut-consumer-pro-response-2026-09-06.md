Verdict: the new nonrobust-center cut is valid. I have not obtained terminal closure. I derived a row-level consumer that avoids changing H, an additional globally forced first-circle incidence, and a strict exclusion in the old-center mutual-return case. The first missing geometric implication is now identifiable as a concrete intersection lower bound, not actual criticality or the escape theorem.

Notation: let C1 be the closed first cap, I=E∩(strict first-cap interior), T=S.triangle.verts (the three supporting vertices), M=A\N, and
  Safe={x∈A : x∈C1 or x∈T or r≤dist(O,x)}.
Retain X=N\{bq,bw}. For c∈N write Kc for its unique full ambient four-class and rho_c for its positive radius. I use the pasted ordinary R and the pasted physical/normal-form signatures, not a minimum-pair residual. In particular I use only |I|≥3, not E⊆C1.

1. The geometry can be applied to Kc WITHOUT overriding H.

For a cut witness c∈X, its already-proved properties give c∈A, c≠O,V,bq,bw, and a selected four-class Kc. Suppose temporarily that q,w∈Kc. The existing geometric proofs establish the following directly for this center and row:
  c∈strict C1;
  rho_c<r;
  Kc∩C1={q,w};
  Kc∩T=∅;
  for every z∈Kc\C1, dist(O,z)<r.
Consequently, writing Kc={q,w,x,y} with four distinct members,
  x,y∉C1, x,y∉T, dist(O,x),dist(O,y)<r,
and in particular
  Kc∩E={q,w},
  Kc∩Safe={q,w}.                                      (1)

This does not require the cut source t to be fresh, and it does not require a new critical-shell system or a rebased frontier. In the inspected proof of actualFreshBlocker_doubleHit_sourceConsequences, H is used to obtain center membership, center≠O, and the equal-distance equations. Those facts are already available for c,Kc. Apply bisectorCenter_mem_firstApexInterior, bisectorCenter_radius_lt_of_selected_pair, and the selected-row cap bound directly. The exterior-point and triangle-omission proofs likewise use the raw center and row distance equations. This removes the rebase obstacle for THESE LOCAL CONCLUSIONS ONLY; it does not reconstruct a physical normal form for another H.

The same primitive argument works for any two distinct authenticated members of I supplied in a selected row: the row has precisely those two safe members. Merely knowing that a point belongs to E is not enough to authenticate it as an interior point.

2. What the no-safe-outside-U CASE actually gives.

Assume Safe⊆U as an explicit case, not as an additional global premise. If the crossing row contains q,w, its CENTER is safe by c∈C1, so
  c∈U.                                                (2)
Thus center location in U is no longer missing in the double-hit subcase.

However, (1) says the row has no NEW safe source: its only safe members are q,w. For the crossing witness t∈Kc\X:
  • if t∈E or t∈Safe, then t=q or t=w;
  • otherwise t is one of x,y and is unsafe;
  • t may still belong to U. Unsafe does not imply outside U.
In particular, robustness of t does not make it safe. Nor does (2), a statement about the CENTER, turn any member of its row into a safe or strict-fresh source. This directly addresses the proposed no-safe test: no-safe supplies a center placement after double hit, not the pair incidence before double hit, and not a third safe row member after it.

If the complementary case Safe\U≠∅ holds, the already-known safe strict-fresh argument excludes double hit for that source's actual row. It still leaves the zero-hit and the two one-hit alternatives. I have not converted either safety case into a terminal contradiction.

3. A further unconditional incidence that really does follow from the global source.

Let Bq=K_bq and Bw=K_bw, whether or not Bw is one of the three selected rows in U. Since bq,bw≠O, each of their circles meets the first circle E in at most two points. This is the elementary distinct-circles argument: subtracting their squared distance equations puts their common points on a line, which meets the nondegenerate O-circle in at most two points. Therefore
  |E\(Bq∪Bw)|≥5−2−2=1.
Choose e in this difference. Total H gives an actual blocker d=H(e). Since e is in neither old blocker row, d≠bq,bw; nonrobustness also gives d≠O,V. Thus
  there is a new actual center d∈X whose row meets E.   (3)
This is stronger than having no first-circle incidence whatsoever. It does NOT prove that e∈I: the uncovered member could be one of the at most two non-interior members of E. It also does not prove that d is the escaping center from the N-cut, or that its row contains two first-circle points.

For completeness, a different fully justified cut makes the cost of combining these facts explicit. Define N_E={d∈N : Kd∩E≠∅}. Covering the five E-points, with at most two per center, gives |N_E|≥3. Hence Y=N_E\{bq,bw} is nonempty, and is proper because O∉N. Minimality applied to Y supplies an escaping actual row centered at d∈Y, so this escaping row meets E. But its escaping source can now be (i) robust, (ii) an old blocker center, OR (iii) a nonrobust center t with Kt∩E=∅. The extra third category is not eliminated. This alternative cut does not supply the original three-way source conclusion plus an interior pair for free. I am not proposing it as closure or as another wrapper implementation.

4. Robust-source arm of the original N-cut.

Suppose t∈M. Actual criticality at c is already established, but robustness concerns radius classes CENTERED AT t, not incidences in Kc.

If Kc contains q,w, (1) gives the exact alternatives:
  (a) t=q or t=w, possibly a robust endpoint; or
  (b) t is one of the two unsafe exterior members.
Case (a) cannot be treated as a fresh source, and overriding H(t) would change a consumed endpoint choice. Case (b) supplies no t∉U. Even in the no-safe case, an unsafe robust point can lie in B∪L. Neither alternative is a contradiction.

If Kc omits q or w, the q,w-specific double-hit geometry has not been triggered. The possibilities are neither endpoint, q only, or w only. A further authenticated interior pair in such a row could trigger the more general primitive geometry, but the cut does not provide one. I have no elimination of these omission branches from the pasted global/physical data.

5. Old-blocker-source arm: distinguish an edge from a mutual return.

Let e∈{q,w}, b=H(e), and suppose the cut source is t=b, so b∈Kc. We already have e∈Kb. This supplies
  dist(c,b)=rho_c,   dist(b,e)=rho_b.
It does NOT supply c∈Kb, which would require the new equality
  dist(b,c)=rho_b.
In particular, one old-center source does not itself give a two-center cycle or any order between rho_b and rho_c. Following H(c) would concern another row; it cannot be substituted for Kc.

There is, however, a concrete strict case exclusion once the actual reverse incidence IS present:

  If q,w∈Kc, b∈Kc, and c∈Kb, then
     rho_c=rho_b<r,
     {b,c,e} is an equilateral triangle,
     c∉E.                                             (4)

Proof. The two mutual incidences imply rho_c=dist(c,b)=rho_b. Since e belongs to both rows, all three sides of b,c,e have this same positive length. Suppose c∈E. The double-hit geometry puts c in the strict first cap, while e is already an authenticated interior E-point. The center b is equidistant from c and e, and O is also equidistant from them. Since b∈A and b≠O, commonPhysicalPair_center_mem_capInteriorByIndex places b in the strict first cap. But b∈Kc and Kc∩C1={q,w}; because H(e)≠e, b must be the other endpoint f. Thus c,q,w form an equilateral triangle and all belong to the same O-circle. The unique circumcenter of this nondegenerate equilateral triangle is its centroid, so O lies in conv{c,q,w}, contradicting convex independence of A. This proves c∉E, including the possible alias b=f; no four-label distinctness assumption was silently used.

This is a paper-level strict case elimination, not a terminal theorem. In the no-safe case, (2) and (4) further give
  c∈(B∪L)\E.
For the retained blocker b, whose row is B, a mutual return already means c∈B, so the surviving return lies in B\E. For the other old blocker, the reverse row is its own actual row Bw or Bq, not automatically B.

Even after (4), a mutual return has EQUAL actual radii, not a strict descent from one actual row to the other. The fact that both are below r does not establish a decreasing iteration or a new surplus-cap packet. If c∉Kb, the reverse metric equality is still missing and there is no two-center cycle to consume.

In the double-hit old-source arm, (1) also warns against identifying all old centers with exterior points: an old center can equal the opposite endpoint. If b is not q or w, then it is indeed an unsafe exterior member. In particular, for the retained blocker, b∉E and b∉B; hence if that non-alias b lies in U, it lies in L. This is a legitimate further support incidence, but not an exclusion.

6. Exact first missing implication and remaining cases.

For the proposed two-authenticated-interior-points route, the first missing line is an INTERSECTION LOWER BOUND for a usable escaping row:
  choose c∈N\{bq,bw}, t∈Kc\(N\{bq,bw}) with
  |Kc∩I|≥2.                                          (G)
The N-cut proves the c,t quantifiers but no such lower bound. The geometric count (3) proves a new actual row with an E-point, not two I-points and not necessarily the same crossing row. The corrected |I|≥3 does not bridge either gap. This is precisely where my attempted geometric consumer first stops; I am not asserting (G) is false under the complete physical hypotheses, and I have no full-source counterexample.

Moreover, proving (G) alone would not finish the safe-source route: the two-interior-point geometry says that the ONLY safe row members are those two interior points. To obtain a contradiction via safety one must also derive a safe row member different from that pair. The present source alternatives (robust or an old center) do not do this. Equivalently, a successful version of this route must force a third safe incidence, or eliminate the exactly-two-safe-member row by another geometric argument. This is not supplied by Safe⊆U, which only places safe points in a finite union.

The current branches therefore remain: zero/one authenticated-interior incidence; double hit with a robust endpoint source; double hit with an unsafe robust source (inside or outside U); old-center source without reverse row membership; and old-center source with reverse membership, now restricted by (4). In the designated q,w analysis, neither/q-only/w-only are all still open unless another authenticated interior pair is separately produced. No-safe and safe-outside-U are both cases, not global assumptions. The exact-twelve tight endpoint is not closed by these deductions either.

Source/provenance. I used the three pasted source excerpts for the physical contract. I also actually read the geometry files at GitHub revision 8e6f754f72a5c421a1c5c59308ee4bdd77f6913b: TwoCenterCapLocalization.lean lines 115–191, and ExactFiveDistinctPhysicalFreshRowRadiusDrop.lean lines 80–265 and 299–553. The latter has blob SHA dac0c0c14de0070b9237bc133162e0616f887f40; the former a4d4a8ef4c6b546276b497a363e8f9b4722c3c24. The key inspected declarations are commonPhysicalPair_center_mem_capInteriorByIndex, actualFreshBlocker_doubleHit_sourceConsequences, actualFreshBlocker_doubleHit_exteriorPoint_dist_firstApex_lt, and actualFreshBlocker_doubleHit_supportTriangle_omission. I also read the one-boundary reflected-pair theorem in TwoInteriorSameBoundaryRadius.lean; I have not used an unguarded one-boundary intersection bound in these deductions. Message #16616 supplied a corroborating guard audit. These are pinned source reads, not a claim about the latest uncommitted working tree. No files were edited, no build or solver was run, and (4) is not claimed Lean-checked.

Bottom line: actual criticality and the N-cut are repaired; local row geometry does not require rebasing H; double-hit centers are in U in the no-safe case; mutual old-center returns cannot have their new center in E. The still-missing consumer begins with producing the requisite interior incidences, and the surviving equal-radius return does not yet supply descent or terminal closure.