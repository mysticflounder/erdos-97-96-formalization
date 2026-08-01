# FR Lemma 1, pattern P4 — proof draft (2026-07-28)

Companion to `fr-pattern-lemma1.md` (setting, transcription, P1 proof) and
`fr-pattern-p2-proof-draft.md` (P2 proof, toolkit L1–L5, Lemma R). Task:
prove the P4 forbidden-pattern family (2k cells, k ≥ 3, both mirror
variants, subset semantics, general common distance δ > 0), under
convention C2 only. Author: math-prover agent.

**Summary.** Both Figure 4 variants, all k ≥ 3, are PROVEN forbidden
under C2. Variant A follows from a new extremality fact (the antipodal
matching uniquely maximizes total length among perfect matchings of
points in strictly convex position, Lemma E, §6). The source's actual
right-hand variant is the simultaneous row-and-column reversal of A, so
it follows from A by orientation-reversing symmetry (§7A). The original
draft had instead called the column-only reversal "variant B"; that
auxiliary pattern, here renamed B_col, is independently forbidden by a
chain-induction (Proposition C, §§8–10). The resulting corollary (§10)
shows source P4 is forbidden under BOTH orientation conventions. General
δ requires no scaling step (every contradiction is literally kδ<kδ).

Status: AUDITED 2026-07-28 (math-skeptic, sonnet). Verdict NEEDS WORK
on citation grounds only — every geometric/algebraic step traced was
confirmed correct (Lemma M, X, U, E, Proposition C's algebra all
"PROVEN, survives intact"); two citation gaps found and patched same
day: F1 (the restriction-order bracket was reused on non-arc-union
subsets — §9's Lemma M instantiations, the (m−1)-prefix — without a
stated general lemma; patched by adding Lemma R″, §3, and citing it at
each such use) and F2 (the C1/C2 corollary's general-k relabeling
algebra was asserted "by the same algebra" citing only a k=3..6
script; patched by writing out the general-k substitution directly,
§10). At audit time, transcription-confidence honesty
(MODERATE-HIGH, not HIGH) was independently confirmed OK — it was not
silently upgraded before direct source inspection. No mathematical
error, only under-citation, was found in the proof.
The transcription gate was closed on 2026-07-28 by two independent
600 dpi inspections of the original PDF (page 8 / printed p. 88); both
agree on the formulas in §1 and on the printed label k ≥ 3. The source
transcription is therefore HIGH confidence. See §13 for the correction
audit and the separation between source variant B and auxiliary B_col.

---

## 1. What was investigated

P4 (2k cells, k ≥ 3, two mirror variants), from Fig. 4 of Fishburn–Reeds
1992, transcribed in `fr-pattern-lemma1.md` (HIGH confidence after direct
600 dpi inspection of the original PDF, page 8 / printed p. 88):

- rows ρ₁ < ... < ρ_k, columns c₁ < ... < c_k (as a submatrix of the cut
  matrix), k ≥ 3;
- **variant A** cells: row ρᵢ has 1's at c_{k−i} and c_{k−i+1} for
  i = 1..k−1, and the wrap row ρ_k has 1's at c₁ and c_k;
- **source variant B** cells: the wrap row ρ₁ has 1's at c₁ and c_k;
  for i = 2..k, row ρᵢ has 1's at c_{k+1−i} and c_{k+2−i}. This is the
  simultaneous row-and-column reversal of variant A, exactly as drawn
  in the right-hand diagram.
- **auxiliary pattern B_col** (the original draft's mistaken
  transcription): row ρᵢ has 1's at c_i and c_{i+1} for i = 1..k−1,
  and the wrap row ρ_k has 1's at c₁ and c_k. This is only the
  column-index reversal of A. It is not attributed to Figure 4, but
  §§8–10 retain its independently audited proof as an extra result.

Claim to prove (subset semantics): for every k ≥ 3 and each source variant,
there is no strictly convex polygon with cut {A, B}, rows ρ₁ < ... < ρ_k
in A-order and columns c₁ < ... < c_k in B-order, under the C2 hull-order
convention, such that all 2k listed cells are simultaneously equal to one
common distance δ > 0.

## 2. Convention pin (mandatory restatement)

Per `fr-pattern-lemma1.md`'s C2 pin (load-bearing, established by the P2
effort): the restricted hull cyclic order of a P4 occurrence's 2k points,
under C2, is

  **(ρ₁, ρ₂, ..., ρ_k, c_k, c_{k−1}, ..., c₁)**

— rows ascending, then columns descending, closing back to ρ₁. All work
below fixes this hull order. (Justification for adopting C2 specifically
is inherited from the P2 draft §6, not re-derived here: the orchestrator
scan cited in the task found the certified FR 20-gon has zero P4
occurrences under EITHER reading, so P4 alone cannot re-derive the
convention; the pin rests on the P2/P3 evidence and the C1b hull-order
certificate, exactly as stated in the task.)

## 3. Reduction to a bare 2k-point statement (Lemma R, general k)

**Lemma R (reduction, PROVEN — direct generalization of the P2 draft's
Lemma R, same patched bracket).** Under convention C2, variant A (resp.
B) is forbidden in every strictly convex polygon and every cut iff:

> **(H_A)** [resp. **(H_B)**] There do not exist 2k distinct points
> ρ₁,...,ρ_k, c_k,...,c₁ in strictly convex position whose hull cyclic
> order is exactly (ρ₁,...,ρ_k,c_k,...,c₁), realizing variant A's (resp.
> B's) 2k cell-pairs all at one common distance δ > 0.

*Proof.* (⇐) Suppose a strictly convex polygon P with cut {A,B} has a
variant-A (resp. B) occurrence at rows ρ₁,...,ρ_k ∈ A, columns
c₁,...,c_k ∈ B. The 2k points are distinct (rows distinct, columns
distinct, A∩B=∅). Any subset of points in strictly convex position is
again in strictly convex position (extremality inherits: p∉conv(S∖{p})
⟹ p∉conv(S′∖{p}) for S′⊆S; no-3-collinear inherits — P2 draft §3), and
its hull cyclic order is the restriction of the full cyclic order. The
2k points appear as the contiguous block ρ₁,...,ρ_k (A is a contiguous
arc) followed by the contiguous block from B; under C2 the traversal
listing rows increasingly meets columns decreasingly, so the restricted
cycle reads (ρ₁,...,ρ_k,c_k,...,c₁). [**Restriction-order bracket,
patched per the P2 audit (F1): for p,q consecutive-in-the-subset, if p,q
are adjacent in P, L1 gives all other P-vertices — in particular the
other 2k−2 subset points — strictly on one side of line(p,q); if p,q are
non-adjacent in P, consecutive-in-the-subset means one open arc of P
between them contains no subset point, so the other 2k−2 subset points
lie in the other open arc, and L2(iii) gives them strictly on one side
of line(p,q).** Either way the supporting-edge characterization holds
for the subset, so the restriction is a genuine strictly convex 2k-gon
in the stated order.]
All 2k cells equal δ by the occurrence — exactly a configuration
forbidden by (H_A) (resp. (H_B)).

(⇒) A configuration as in (H_A) (resp. (H_B)) is itself a strictly convex
2k-gon; take A={ρ₁,...,ρ_k}, B={c₁,...,c_k} (complementary contiguous
arcs, reading the cycle per C2); the 2k unit cells form variant A (resp.
B) with rows/columns matching the given indices. ∎

Lemma R is cell-set-agnostic (it uses only row/column positions in the
cut, never which cells are constrained), so it applies verbatim to both
variants and to any k. **Consequence:** it suffices to prove (H_A) and
(H_B) as bare-point statements — §4–§9 do exactly this, working
throughout with the hull order (ρ₁,...,ρ_k,c_k,...,c₁) fixed by Lemma R
and never returning to cut-matrix language.

**Lemma R″ (general subset restriction; PATCH F1, math-skeptic audit
2026-07-28).** Let P be a strictly convex polygon and S any nonempty
subset of its vertices (not necessarily a union of contiguous arcs).
Then S is itself in strictly convex position, and its hull cyclic
order is exactly P's cyclic order restricted to S.

*Proof.* Identical to the restriction-order bracket already proved
inside Lemma R's (⇐) direction above, with "the 2k subset points" read
as "S": extremality and no-3-collinear inherit to S exactly as stated
there (P2 draft §3); for p,q consecutive-in-S, the same case split (p,q
adjacent in P ⟹ L1; p,q non-adjacent in P ⟹ one open P-arc between them
is S-empty, giving L2(iii) on the other arc) shows every other point of
S lies strictly on one side of line(p,q), for every consecutive pair —
the supporting-edge characterization for S, independent of whether S
happens to be a union of contiguous P-arcs. ∎

This is the general form of the bracket Lemma R already uses for the
specific two-arc case; §9's Lemma M instantiations (on 4-point subsets
that are not unions of contiguous arcs of the ambient 2k-gon) and the
inductive step's (m−1)-prefix subset both cite Lemma R″, not Lemma R
itself, from here on.

## 4. Cycle structure of variant A (PROVEN, index algebra)

Write the 2k pattern cells as a bipartite graph on {ρ₁,...,ρ_k} ∪
{c₁,...,c_k}. **Claim:** variant A's edge set is the single 2k-cycle

  ρ₁ — c_{k−1} — ρ₂ — c_{k−2} — ρ₃ — ... — ρ_{k−1} — c₁ — ρ_k — c_k — ρ₁.

*Proof.* Each row ρᵢ (i=1..k−1) has degree 2 by construction (cells
c_{k−i}, c_{k−i+1}); row ρ_k has degree 2 (cells c₁, c_k). For columns:
c_j with 2 ≤ j ≤ k−1 receives a 1 from row ρᵢ iff k−i=j (i=k−j) or
k−i+1=j (i=k−j+1); both lie in {1,...,k−1} for 2≤j≤k−1, so deg(c_j)=2,
neighbors ρ_{k−j}, ρ_{k−j+1}. c₁ receives from ρ_{k−1} (k−i=1) and from
the wrap row ρ_k; deg(c₁)=2. c_k receives from ρ₁ (k−i+1=k) and the wrap
row ρ_k; deg(c_k)=2. So the graph is 2-regular bipartite on 2k vertices;
following the shared-column adjacencies ρᵢ–c_{k−i}–ρ_{i+1} for
i=1,...,k−2, then ρ_{k−1}–c₁–ρ_k–c_k–ρ₁, traces exactly one cycle
through all 2k vertices (checked directly against the cell list, no
sub-cycle is possible since every vertex has degree exactly 2 and the
trace above already visits all 2k vertices before closing). ∎

**The two alternating matchings.** A 2k-cycle's edges split into two
disjoint perfect matchings by taking alternate edges. Tracing the cycle
above and alternating:

  M1 = {(ρᵢ, c_{k−i}) : i = 1,...,k−1} ∪ {(ρ_k, c_k)}
  M2 = {(ρᵢ, c_{k−i+1}) : i = 1,...,k}

(M2's formula is uniform in i; M1's has a seam at i=k. Verified directly:
for i=1,...,k, M1∪M2 reproduces exactly the 2k listed cells, each cell in
exactly one of M1, M2, confirmed by matching against the row-by-row cell
list.) Since every cell has length δ by hypothesis, **total(M1) = kδ and
total(M2) = kδ.**

## 5. Hull-position crossing structure of M1, M2 (variant A)

Number hull positions 1,...,2k along (ρ₁,...,ρ_k,c_k,...,c₁): position(ρᵢ)
= i; position(c_m) = 2k+1−m (so c_k ↦ k+1, ..., c₁ ↦ 2k). Two chords
{a,b}, {c,d} (positions, a<b, c<d) **cross** iff a<c<b<d or c<a<d<b
(purely combinatorial in the cyclic order, independent of actual point
placement, given the polygon is convex).

**M2 is the antipodal matching.** position(ρᵢ)=i, position(c_{k−i+1}) =
2k+1−(k−i+1) = k+i. So M2 pairs position i with position i+k for every
i=1,...,k — i.e., M2 pairs each point with the point k steps away in the
2k-cycle of hull positions ("diameters" of the hull cycle).

**M1 is not.** position(c_{k−i}) = 2k+1−(k−i) = k+1+i for i=1,...,k−1
(pairing i with i+k+1), and the last pair is (k,k+1) (adjacent
positions). This is a strictly different pairing from M2's (e.g. the pair
containing position k is (k,2k) in M2 vs (k,k+1) in M1) — in particular
M1 ≠ M2 as edge sets (already clear since M1, M2 partition the 2k cycle
edges and k ≥ 3 > 0 gives both nonempty and disjoint).

## 6. The matching-extremality lemma (PROVEN, general — not δ-specific)

**Lemma M (quadrilateral inequality).** Let P, Q, R, S be four points in
strictly convex position with this cyclic order. Then
|PR| + |QS| > |PQ| + |RS| and |PR| + |QS| > |QR| + |SP| (strict).

*Proof.* Apply Lemma L2 (P2 draft §4) to the strictly convex "polygon"
PQRS (n=4, non-adjacent pairs are exactly the two diagonals {P,R} and
{Q,S}). L2(iii) applied to {Q,S} (non-adjacent): the two open boundary
arcs between Q and S — namely {P} and {R}, the only remaining vertices —
lie strictly on opposite open sides of line(Q,S); so P, R are strictly
separated by line(Q,S). Parametrize the open segment (P,R) (⊆ int K by
L2(ii) applied to the non-adjacent pair {P,R}); the signed distance to
line(Q,S) is continuous along it and changes sign (P, R on opposite
sides), so by the intermediate value theorem it vanishes at some
X ∈ (P,R), i.e. X ∈ line(Q,S). Since X ∈ (P,R) ⊆ int K and, by L2(ii)
applied to {Q,S}, line(Q,S) ∩ K = [Q,S], X ∈ [Q,S]; X ∈ int K excludes
the endpoints Q, S, so X ∈ (Q,S) strictly. So X is a single point lying
strictly between P,R on PR and strictly between Q,S on QS, and
X ∉ {P,Q,R,S}. So |PR|=|PX|+|XR|, |QS|=|QX|+|XS|. X ∉ line(P,Q) (else P,Q,X collinear;
since X ∈ line(P,R), this would put P,Q,R,X collinear, forcing P,Q,R
collinear, excluded by strict convexity), so triangle PXQ is
non-degenerate and the triangle inequality is strict: |PQ| < |PX|+|XQ|.
Likewise |RS| < |RX|+|XS|. Adding: |PQ|+|RS| < |PX|+|XQ|+|RX|+|XS| =
(|PX|+|XR|)+(|QX|+|XS|) = |PR|+|QS|. The second inequality is symmetric
(swap the roles via Q,R,S,P in place of P,Q,R,S — same X). ∎

**Lemma X (uncrossing move).** Let M be a perfect matching of 2k points
in strictly convex position, and suppose two edges {a,b}, {c,d} ∈ M do
not cross (in the hull cyclic order). Let P,Q,R,S be {a,b,c,d} listed in
hull cyclic order. Then M′ := (M ∖ {{a,b},{c,d}}) ∪ {{P,R},{Q,S}} is a
perfect matching of the same 2k points with total(M′) > total(M).

*Proof.* Since {a,b},{c,d} don't cross, as a pairing of {P,Q,R,S} they
equal either {PQ,RS} or {QR,SP} (the two non-crossing pairings; {PR,QS}
is the crossing one, so {a,b},{c,d} — not crossing — cannot equal it).
Either way, Lemma M gives |PR|+|QS| > |{a,b}|+|{c,d}|. M′ agrees with M
outside {a,b,c,d} and replaces those two edges by {PR,QS}; the total
strictly increases by the excess just shown, and M′ is a valid perfect
matching (still exactly one edge per point). ∎

**Lemma U (uniqueness of the totally-crossing matching).** Label 2k
points in hull cyclic order 1,...,2k. If M is a perfect matching in which
every two edges cross, then M = M* := {(i, i+k) : i = 1,...,k} (indices
mod 2k), the antipodal matching.

*Proof.* Fix any point p with M-partner q. The chord {p,q} splits the
remaining 2k−2 points into two open cyclic arcs, sizes a and b with
a+b = 2k−2. Every other edge of M crosses {p,q} (hypothesis), i.e., has
one endpoint in each arc; since M restricted to the other 2k−2 points is
a perfect matching using only such "one-per-arc" edges, this restricted
matching pairs the a points of one arc bijectively with the b points of
the other, forcing a = b = k−1. The arc sizes are determined by the
cyclic gap: a = (q−p−1) mod 2k = k−1 forces q ≡ p+k (mod 2k). As p was
an arbitrary point of M, every point's partner is itself+k, i.e. M = M*.

∎

**Lemma E (extremality, PROVEN).** Among all perfect matchings of 2k
points in strictly convex position, M* (antipodal) is the unique
maximum-total-length matching: total(M) < total(M*) for every perfect
matching M ≠ M*.

*Proof.* Finitely many perfect matchings exist on 2k points, so a
maximum-total matching M_max exists. If M_max had a non-crossing pair of
edges, Lemma X would produce a strictly heavier matching, contradicting
maximality; so every two edges of M_max cross, and Lemma U gives
M_max = M*. This shows total(M) ≤ total(M*) for all M. For strictness:
if some M ≠ M* also attained total(M) = total(M*) (the max), the same
argument (M attains the max ⟹ M is totally crossing ⟹ M = M* by Lemma U)
forces M = M*, contradiction. So every M ≠ M* is strictly below the max. ∎

Lemma E depends only on the hull cyclic order (a combinatorial datum) and
strict convexity — not on the specific point positions, and not on any
distance hypothesis. It applies to any labeled 2k points in strictly
convex position, in particular to the six/eight/ten-point (etc.)
configurations arising from Lemma R (§3).

## 7. Variant A forbidden for all k ≥ 3 (PROVEN, general δ)

By §5, M2 = M* (antipodal) and M1 ≠ M2 = M*. Lemma E (with M := M1)
gives total(M1) < total(M2), strictly. But §4 gives total(M1) = kδ =
total(M2). So kδ < kδ — false for any δ (in particular for δ > 0, but the
contradiction does not even need δ > 0: it is immediate from kδ < kδ).
Hence **no strictly convex 2k-gon in hull order (ρ₁,...,ρ_k,c_k,...,c₁)
realizes variant A's 2k unit cells simultaneously at one common
distance**, for any k ≥ 3 (in fact any k ≥ 2 — see remark below) and any
δ > 0.

**Remark (k = 2 consistency / bonus).** The same argument runs verbatim
at k = 2 (2k = 4 points, hull order ρ₁,ρ₂,c₂,c₁): M2 = {(ρ₁,c₂),(ρ₂,c₁)}
is the antipodal pair of the quadrilateral (positions (1,3),(2,4)), M1 =
{(ρ₁,c₁),(ρ₂,c₂)} is one of the two non-crossing pairs (positions
(1,4),(2,3), the two hull-adjacent chords). Lemma E reduces immediately
to a single application of Lemma M. Since P1 is exactly the k = 2 case of
this cycle shape (task statement, and directly verified: k=2's cell list
{(ρ1,c1),(ρ1,c2),(ρ2,c1),(ρ2,c2)} is all 4 cells = K₂,₂ = P1), **this
gives a second, independent, and shorter proof of the already-admitted
P1** — a consistency check on the toolkit, not a replacement of the
admitted P1 proof (out of scope here; P1 remains admitted on its own
proof per the ledger).

## 7A. Source variant B forbidden by simultaneous-reversal symmetry (PROVEN)

Suppose the source right-hand pattern is realized under C2, with hull
order

  **(ρ₁,...,ρ_k,c_k,...,c₁).**

Reverse the traversal orientation and start at ρ_k. The same cyclically
ordered point set is then listed

  **(ρ_k,...,ρ₁,c₁,...,c_k).**

Put ρ′ᵢ := ρ_{k+1−i} and c′ⱼ := c_{k+1−j}. The last display is exactly

  **(ρ′₁,...,ρ′_k,c′_k,...,c′₁),**

so C2 is preserved. Under this simultaneous relabeling, the source
variant-B cell set becomes variant A's cell set: its wrap pair
`(ρ₁,c₁),(ρ₁,c_k)` becomes `(ρ′_k,c′_k),(ρ′_k,c′₁)`, and for
`2 ≤ i ≤ k`, writing `i′=k+1−i` (so `1 ≤ i′ ≤ k−1`), the pair
`c_{k+1−i},c_{k+2−i}` becomes `c′_{k−i′},c′_{k−i′+1}` on row ρ′ᵢ′.
Distances and strict convexity are unchanged. This would therefore give
a variant-A realization under C2, contradicting §7.

Thus the actual right-hand Figure 4 pattern is forbidden for every
k ≥ 3 and common δ > 0.

## 8. Auxiliary B_col: cell structure and the two matchings (PROVEN, index algebra)

By Lemma R (§3), it suffices to rule out (H_B_col): 2k points in strictly
convex position, hull order (ρ₁,...,ρ_k,c_k,...,c₁), with B_col's 2k
cell-pairs — row ρᵢ (i=1..k−1) paired with c_i, c_{i+1}; wrap row ρ_k
paired with c₁, c_k — all equal to δ.

**Direct restatement.** Using cyclic column indexing c_{k+1} := c₁, the
2k constraints are exactly: |ρᵢ c_i| = |ρᵢ c_{i+1}| = δ for every
i = 1,...,k. (Check: for i<k this is literally the row-ρᵢ cells; for
i=k, c_i=c_k and c_{i+1}=c_{k+1}=c₁ are the wrap row's cells c_k, c₁.)
So **every ρᵢ is equidistant (=δ) from the cyclically-consecutive pair
c_i, c_{i+1}.**

As in §4, split the bipartite 2k-cycle into two alternating matchings —
here transparently, since each row's two cells are literally "same
index" and "next index":

  M1 = {(ρᵢ, cᵢ) : i = 1,...,k}          ("aligned")
  M2 = {(ρᵢ, c_{i+1}) : i = 1,...,k}      ("shifted"; c_{k+1} := c₁)

(These are disjoint — (ρᵢ,c_i)=(ρⱼ,c_{j+1}) would need i=j and i≡j+1
(mod k), impossible for k≥2 — and their union is exactly the 2k cells, so
they are the two alternating matchings of the cycle traced in the same
way as §4.) As before, total(M1) = total(M2) = kδ trivially (k cells
each, all length δ).

**Crossing structure differs sharply from variant A.** Using hull
positions (§5: position(ρᵢ)=i, position(c_m)=2k+1−m), M1 pairs position
i with 2k+1−i for every i=1,...,k — the reflection i ↦ 2k+1−i across the
axis through the midpoints of hull edges (ρ_k,c_k) and (c₁,ρ₁). A direct
check (as in §5, comparing arcs) shows this reflection matching is
**fully non-crossing** (nested): for i<j≤k, both j and 2k+1−j lie in the
open arc (i, 2k+1−i), so chord j is nested inside chord i, for every
pair. M2 (positions (i,2k−i) for i<k, (k,2k) for i=k) is neither fully
crossing nor fully non-crossing (EMPIRICALLY confirmed for k=3: its
"long" chord (k,2k) crosses all k−1 other M2 chords, which are
themselves mutually nested) — so **Lemma E does not apply directly to
either matching** here; a different argument is needed (§9).

## 9. The chain-induction lemma (PROVEN, general — not δ-specific)

**Proposition C.** Let m ≥ 2, and let ρ₁,...,ρ_m, c₁,...,c_m be 2m
points in strictly convex position with hull cyclic order
(ρ₁,...,ρ_m,c_m,...,c₁). Define

  F_m := Σ_{i=1}^{m−1} |ρᵢ c_{i+1}| + |ρ_m c₁|,     N_m := Σ_{i=1}^{m} |ρᵢ cᵢ|.

Then F_m > N_m, strictly.

*Proof, by induction on m.*

**Base case m=2.** F_2 = |ρ₁c₂| + |ρ₂c₁|, N_2 = |ρ₁c₁| + |ρ₂c₂|. The
4-point subset {ρ₁,ρ₂,c₁,c₂} is generally NOT a union of contiguous
ambient arcs (for k>2, ρ₃,...,ρ_k,c₃,...,c_k sit between c₂ and ρ₁), so
its hull order (ρ₁,ρ₂,c₂,c₁) is given by Lemma R″ (§3, PATCH F1), not
asserted; with Lemma M's labels
P=ρ₁,Q=ρ₂,R=c₂,S=c₁: F_2 = |PR|+|QS| (the crossing pairing) and
N_2 = |ρ₁c₁|+|ρ₂c₂| = |PS|+|QR| (one of the two non-crossing pairings).
Lemma M gives |PR|+|QS| > |PS|+|QR|, i.e. F_2 > N_2 directly.

**Inductive step (m ≥ 3), assuming Proposition C for m−1.** The
sub-collection ρ₁,...,ρ_{m−1}, c₁,...,c_{m−1} (2m−2 of the given points)
is NOT a union of contiguous arcs of the ambient 2k-gon in general (the
omitted points ρ_m,...,ρ_k,c_m,...,c_k sit strictly between c_{m−1} and
ρ₁ in the hull cycle), so this step cites Lemma R″ (§3, PATCH F1), not
Lemma R itself: by Lemma R″, the sub-collection is in strictly convex
position with hull order equal to the ambient order restricted to it,
which is exactly (ρ₁,...,ρ_{m−1}, c_{m−1},...,c₁) — i.e. exactly the
hypothesis of Proposition C at parameter m−1, on genuine sub-points of
the given configuration. So F_{m−1}, N_{m−1} (as defined by the SAME
formulas, parameter m−1) are meaningful real numbers computed from
these sub-points, and the induction hypothesis applies to them.

Splitting off the last term of each defining sum:

  F_m = Σ_{i=1}^{m−2}|ρᵢc_{i+1}| + |ρ_{m−1}c_m| + |ρ_mc₁|
      = [F_{m−1} − |ρ_{m−1}c₁|] + |ρ_{m−1}c_m| + |ρ_mc₁|
  N_m = Σ_{i=1}^{m−1}|ρᵢcᵢ| + |ρ_mc_m| = N_{m−1} + |ρ_mc_m|

(using F_{m−1} = Σ_{i=1}^{m−2}|ρᵢc_{i+1}| + |ρ_{m−1}c₁| directly from the
definition at parameter m−1). Subtracting:

  (F_m − N_m) − (F_{m−1} − N_{m−1})
    = |ρ_{m−1}c_m| + |ρ_mc₁| − |ρ_{m−1}c₁| − |ρ_mc_m|.

Apply Lemma M to the four points {ρ_{m−1}, ρ_m, c₁, c_m}, hull order
(ρ_{m−1},ρ_m,c_m,c₁) — again a non-arc-union subset in general, so this
hull order is given by Lemma R″ (§3, PATCH F1); labels
P=ρ_{m−1},Q=ρ_m,R=c_m,S=c₁:

  |PR| + |QS| > |PS| + |QR|
  |ρ_{m−1}c_m| + |ρ_mc₁| > |ρ_{m−1}c₁| + |ρ_mc_m|.

This is exactly the statement that the right-hand side above is > 0:

  (F_m − N_m) − (F_{m−1} − N_{m−1}) > 0,  i.e.  F_m − N_m > F_{m−1} − N_{m−1}.

By the induction hypothesis F_{m−1} − N_{m−1} > 0, so F_m − N_m > 0. ∎

Proposition C uses no distance hypothesis (δ nowhere appears) — it is a
pure fact about strictly convex position, exactly parallel in role to
Lemma E for variant A, established here by induction instead of a single
extremal characterization.

## 10. Auxiliary B_col forbidden for all k ≥ 3 (PROVEN, general δ)

By §8, M1 = {(ρᵢ,cᵢ)} has total(M1) = N_k and M2 = {(ρᵢ,c_{i+1})} has
total(M2) = F_k, in Proposition C's notation (k in place of m). Since the
hull order of the given 2k points is exactly Proposition C's hypothesis
(Lemma R, §3), Proposition C gives F_k > N_k strictly, i.e.
total(M2) > total(M1). But §8 gives total(M1) = kδ = total(M2). So
kδ < kδ — contradiction, for any δ. Hence **no strictly convex 2k-gon in
hull order (ρ₁,...,ρ_k,c_k,...,c₁) realizes B_col's 2k unit cells
simultaneously at one common distance**, for any k ≥ 2 (Proposition C's
base case is k=2, so this holds already there; in particular for every
k ≥ 3) and any δ > 0.

**Remark (k=2 consistency).** As with variant A, the k=2 case reduces to
a single Lemma M application (Proposition C's base case IS this
application), consistent with B_col's own k=2 cell list also being
all 4 cells of K₂,₂ = P1 (B_col's formula at k=2: row ρ₁ has cells
c₁,c₂; wrap row ρ₂ has cells c₁,c₂ — identical to variant A's k=2 list).

**Corollary (C1/C2 convention-independence, PROVEN).** Variant A,
source variant B, and auxiliary B_col are forbidden under EITHER
hull-order convention, not just C2. *Proof.* First relabel
c′ⱼ := c_{k+1−j} (j=1,...,k) — a bijective renaming of the k
column-points, no geometric content; equivalently c_j = c′_{k+1−j}.

**General-k cell-set computation (PATCH F2, math-skeptic audit
2026-07-28 — closes the citation gap left by relying on the k=3..6
script alone).** For i = 1,...,k−1, variant A's row ρᵢ has cells at
c_{k−i}, c_{k−i+1}; substituting c_j = c′_{k+1−j}:

  c_{k−i} = c′_{k+1−(k−i)} = c′_{i+1},    c_{k−i+1} = c′_{k+1−(k−i+1)} = c′_i.

So row ρᵢ's cells, in c′-terms, are {c′_i, c′_{i+1}} — exactly variant
B's own row-ρᵢ cells (§1: c_i, c_{i+1}, here in c′-notation). For the
wrap row ρ_k, variant A has cells c₁, c_k; substituting:

  c₁ = c′_{k+1−1} = c′_k,    c_k = c′_{k+1−k} = c′_1.

So the wrap row's cells become {c′_1, c′_k} — exactly B_col's own
wrap-row cells. This is the general-k algebra for every i and every
k ≥ 3 (the k=3,...,6 script, `p4_c1_corollary_check.py`, checks these
same four substitutions numerically as a redundant sanity check, not
as the only evidence).

**Hull-order transform.** The hull order (ρ₁,...,ρ_k,c₁,...,c_k) — C1,
both indices ascending — rewritten via c_j = c′_{k+1−j} lists the
column block as c′_k, c′_{k−1},...,c′_1 (j ascending 1→k gives
k+1−j descending k→1), i.e. (ρ₁,...,ρ_k,c′_k,...,c′_1) — exactly C2.

So **"variant A under C1" and "B_col under C2" are the identical
abstract realizability question**, just under different names for the
column points; §10 proves the latter forbidden, hence the former is
forbidden too. By the symmetric relabeling (swap the roles of A, B),
**"B_col under C1" = "variant A under C2"**, proven forbidden in §7.
Thus A and B_col are forbidden under both conventions. Finally, the
simultaneous-reversal argument of §7A preserves either convention and
maps source variant B to A. Hence both actual Figure 4 variants are
forbidden under both C1 and C2. ∎

This explains, rather than merely being consistent with, the
orchestrator's finding that the certified FR 20-gon shows zero P4
occurrences under both the native C2 and the column-reversed C1 readings
(task's "ORCHESTRATOR-SUPPLIED EVIDENCE" paragraph): no realizable
configuration exists under either convention, for any convex polygon, so
in particular none exists in that specific 20-gon. **This is specific to
P4** — it is not evidence that convention-independence holds generally;
P2 is the standing counterexample (variant A of P2 IS realizable under
C1: `fr-pattern-p2-proof-draft.md` §6, Proposition 2), and P1/P3's
C1-behavior is not addressed here.

## 11. Numerical checks performed (all EMPIRICALLY VERIFIED, finite scope)

Scripts persisted at
`/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/5dfab928-f645-438d-8e17-30fae9784b75/scratchpad/`
(session scratchpad; not committed): `p4_matching_probe.py` (initial,
radial-perturbation generator), `p4_matching_probe2.py` (final, Valtr
random-convex-polygon construction — vectors summing to zero sorted by
angle, guaranteed convex by construction, no rejection sampling),
`p4_induction_check.py` (Proposition C chain check), `p4_c1_corollary_check.py`
(exact index-algebra check for the C1/C2 corollary above, k=3,...,6, all
match). All checks probe the
PURE convex-position crossing/length comparison (total(M2) vs total(M1),
or F_m vs N_m) — they do not construct any δ-equidistant configuration
(none exists, per §7/§10), only test the auxiliary geometric inequality
that the proofs rely on.

1. **Main comparison, A and auxiliary B_col, k=3,...,8,10,12**
   (`p4_matching_probe2.py`,
   Valtr construction, 250 independent random strictly-convex 2k-gons per
   (k, variant), 4000 trials total): **total(M2) > total(M1) in every
   single trial, zero exceptions, zero ties**, at every tested k for both
   patterns. Minimum observed margin across all runs ≈ 0.023 (k=3,
   B_col); no trend toward zero as k grows (min margins stay in the
   0.03–0.4 range through k=12, consistent with §6/§9's inequalities
   being strict with no degenerate limit forced by the combinatorics
   alone — unlike the P2 precedent where the analogous margin infimum
   was exactly 0).
2. **Proposition C's inductive chain directly** (`p4_induction_check.py`,
   500 trials, k drawn uniformly in {3,...,7}, radial-perturbation
   generator): for every trial, F_m − N_m is BOTH strictly positive AND
   strictly increasing in m for m = 2,...,k on the same point set (the
   two claims Proposition C's proof establishes) — 500/500, zero
   violations, worst-case margin 0.00021 (a near-degenerate but still
   strictly positive sample, not a counterexample).
3. **The inductive-step Lemma M instance in isolation**
   (`p4_induction_check.py`, second block, 300 trials, k uniform in
   {3,...,7}, m uniform in {3,...,k}): the specific inequality
   |ρ_{m−1}c_m| + |ρ_mc₁| > |ρ_{m−1}c₁| + |ρ_mc_m| used in §9's inductive
   step — 300/300 held, worst margin 0.063.
4. **Earlier exploratory probe** (`p4_matching_probe.py`, radial
   perturbation generator, two runs at k up to 6 and 5 respectively
   before generator slowness at larger k motivated the switch to Valtr):
   consistent with the above, M2>M1 in all 2,480 successful trials across
   both tested patterns, zero exceptions, before the script was superseded.

No configuration in any of the ~4,800 trials of the two final scripts
(`p4_matching_probe2.py` + `p4_induction_check.py`), nor in the 2,480
exploratory trials, violated total(M2)>total(M1) or Proposition C's
chain — consistent with, but not a substitute for, the pen-and-paper
proofs of §6/§7 (variant A, exact) and §9/§10 (B_col, exact).

## 12. Structural assumptions used (stated explicitly)

- **Strict convexity** (no three vertices collinear) is used essentially
  throughout: in Lemma M (existence and non-degeneracy of the diagonal
  intersection X, and the strict triangle inequalities at X); in Lemma R
  and Proposition C's inductive step (subset-of-strictly-convex is
  strictly convex, hull order restricts — both cited from the P2 draft's
  §3/L1/L2 machinery); and implicitly in every citation of L1/L2(iii)
  (adjacent/non-adjacent separation). No degenerate (collinear or
  coincident) configurations are covered by this draft.
- **No finiteness beyond the 2k named points.** The ambient polygon may
  have any number of vertices n ≥ 2k (only the 2k pattern points and
  their hull sub-order are used, via Lemma R); Lemma E, Lemma M, and
  Proposition C are statements about exactly 2k (or 2m ≤ 2k, in the
  induction) points and do not reference the rest of the polygon.
- **General δ requires no scaling step**, unlike the P2 draft's Theorem 1
  (which fixed δ=1 by similarity before proceeding). Here every
  contradiction is of the literal form kδ < kδ (§7, §10), which is false
  regardless of the specific value of δ — no similarity-rescaling
  argument is needed to pass from "some δ > 0" to "δ = 1" before the
  proof goes through. No coordinate frame, gauge, or normalization is fixed
  anywhere in §5–§10: the entire argument (Lemma M, X, U, E, Proposition
  C) is coordinate-free (synthetic convex geometry plus the ordinary
  triangle inequality), unlike P2's Theorem 1, which used an explicit
  trigonometric coordinate frame.
- **The cut's contiguous-arc structure** is used only through Lemma R
  (§3) — after that, both proofs concern only the 2k (or 2m) named
  points and their hull cyclic order.
- **The C2 convention is a hypothesis inherited from the task**, not
  re-derived here (§2); §10's Corollary shows P4 does not in fact need
  it (both variants also fail under C1), but this was discovered, not
  assumed in advance.

## 13. Honest gap list

- **Source transcription correction (closed, HIGH confidence).** Two
  independent 600 dpi inspections of
  `/opt/nfs/1-s2.0-092577219290026O-main.pdf`, PDF page 8 / printed
  p. 88, agree that Figure 4 says `k ≥ 3`, that the left diagram is A,
  and that the right diagram is the simultaneous row-and-column
  reversal stated in §1. The original column-only formula was therefore
  mislabeled. It is retained only as auxiliary B_col because its audited
  proof is valid; §7A supplies the short symmetry proof for the actual
  source variant B. This closes the former transcription gate without
  transferring B_col's source attribution.
- **The route to B_col's proof was not a direct generalization of
  variant A's (documented for future provers, dead-end-file style).**
  Lemma E (antipodal matching = unique max) does NOT apply to either of
  B_col's two matchings — neither is totally crossing (§8, checked
  directly: M1 is fully NON-crossing, M2 is a mix of k−1 mutually-nested
  chords plus one chord crossing all of them). An attempt to force the
  comparison via a single telescoping sum of quadrilateral inequalities
  over consecutive pairs (comparing {(ρᵢ,cᵢ),(ρᵢ₊₁,cᵢ₊₁)} against
  {(ρᵢ,cᵢ₊₁),(ρᵢ₊₁,cᵢ)} for each i, then summing over i) does NOT close:
  the sum introduces an uncancelled auxiliary term
  Σᵢ|ρᵢ₊₁cᵢ| with no independent bound. **Do not re-attempt this specific
  telescoping.** The working technique (Proposition C, §9) instead
  compares F_m, N_m across a genuine chain of SUB-configurations
  (m = 2,...,k, each a real subset of the given points with its own valid
  hull order via Lemma R), splitting off exactly one term from each
  defining sum per step — this is what makes the single Lemma M
  application at each step close cleanly.
- **No exact rational/algebraic witness was produced or attempted for
  any near-realizable configuration**, unlike the P2 draft's §6 (which
  built and exactly certified a genuine C1 realization of its variant
  A). This draft found no realizable case for P4 in either convention
  (§10's Corollary), so there is no positive witness to certify — only
  the negative numerical margins of §11, which stay bounded away from 0
  as k grows (unlike P2's C2 infeasibility, whose margin supremum was
  exactly 0 in a degenerate limit). This asymmetry (P4 apparently
  "more robustly" forbidden than P2's forbidden direction) is noted but
  not explained; no claim is made about it beyond the empirical
  observation in §11 item 1.
- **Lemma M, X, U, E, and Proposition C are new to this draft** (not
  inherited from P1/P2). They were independently audited line-by-line
  on 2026-07-28; the audit found only the two citation gaps recorded in
  the header, both patched the same day.

## 14. What next (ranked)

1. ~~**Adversarial audit (math-skeptic)**~~ — DONE 2026-07-28. Verdict
   NEEDS WORK on citation grounds only (F1, F2); no error found in any
   of (a)-(d); both findings patched same day. See the file-header
   status block.
2. ~~**Re-verify the P4 transcription against the original Fig. 4
   image**~~ — DONE 2026-07-28, independently twice at 600 dpi. The
   corrected formulas are in §1 and the source-pattern symmetry proof
   is §7A. The transcription gate is closed at HIGH confidence.
3. **P3's R2 row-case** — the remaining open item on the lane's other
   pattern (`fr-pattern-lemma1.md` ledger; P3's R1/R3 sub-family is
   already PROVEN+AUDITED and admitted as R-P3). The chain-induction
   technique of Proposition C (§9) may transfer: R2's cell structure
   (`(r_a,c₁),(r_a,c_k),(r_b,c₁),(r_c,c₂),(r_d,c₂),(r_d,c_h)` with the
   crossed row order `r_a<r_c<r_b<r_d`) is not a clean 2k-cycle and
   would need its own reduction before any toolkit reuse.
4. **Reusable artifact.** Lemma M/X/U/E (crossing-implies-heavier, unique
   antipodal maximum) and Proposition C (chain-induction via one
   quadrilateral swap per step) are both general facts about points in
   strictly convex position, independent of any distance hypothesis;
   consider extracting them as a lemma-bank entry for future same-
   distance-cut pruning rules, alongside the P2 draft's wedge-plus-
   isosceles mechanism.

---

**Status: the actual Figure 4 variants A and B, all k ≥ 3 and general δ,
plus auxiliary B_col and the C1/C2 corollary, are PROVEN + AUDITED
2026-07-28** (math-skeptic;
findings F1/F2, both citation gaps not errors, patched same day —
Lemma R″ added §3, general-k algebra written out §10). Self-contained
modulo the cited P2-draft toolkit (L1, L2) and the task's
transcription/convention pins. **Proof and HIGH-confidence source
transcription now satisfy the R-P4 admission gate.**
