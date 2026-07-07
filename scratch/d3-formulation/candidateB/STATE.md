# Candidate B falsification — row-fragment (ρ) embedding test — STATE

Workstream D3 closure plan §7; task = report.md §5.B(iii).
Verdict semantics: exact-verified embedding in ANY admissible witness ⇒ Candidate B FALSE.

## 1. Lean grounding (chased to metric/count primitives)

Leaf: `DoubleApexOffSurplusSharedRadiusPair`, `lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`.
`D.skeleton q = D.A.erase q` (U5ModeADeletion.lean:89).
`HasNEquidistantPointsAt n A p := ∃ r > 0, (A.filter fun q ↦ dist p q = r).card ≥ n`
(formal-conjectures ErdosProblems/97.lean:34).

ρ-conjuncts extracted (labels p,q,t1,t2,t3,u; A = witness point set; Moser = {U,V,W}; S = surplus cap):

| id | source (Lean) | grounded form |
|----|----|----|
| P1 | hqCap+hsurplus+hjne+hj5+hqNonMoser | q ∉ {U,V,W}; q's cap card > 4 and ∃ other cap ≥ 5 (all witness caps ≥ 5 ⟹ q non-Moser suffices). STRICT variant per report §5.B(i): q ∈ S ∖ {V,W} |
| P2 | hbase (List.Pairwise ≠) | p,q,t1,t2,t3,u pairwise distinct, all ∈ A |
| P3 | hfixed.{t*_same_radius,q_radius_pos} + H.dangerous.T_same_radius | dist p t1 = dist p t2 = dist p t3 = dist p q > 0 |
| P4 | hsupport + rows.rowAt(t2).selected.toCriticalFourShell.{support_eq,support_card,q_mem_support,center_mem,radius_pos} + hcenter | {y ∈ A : dist p y = dist p q} = {q,t1,t2,t3} exactly (full ambient class, card 4) |
| P5 | H.dangerous.T_noncollinear | {t1,t2,t3} not collinear (auto for 3 distinct concyclic pts; checked anyway) |
| P6 | hlocalNoQFree.no_qfree | ∀ r′: #{y ∈ A∖{p,q} : dist p y = r′} ≤ 3 ⟺ p has NO mult-≥4 radius other than dist p q (and that one has mult exactly 4 = P4) |
| P7 | H.exactQDeletedRadius | #{y ∈ A∖{q,p} : dist p y = dist p q} = 3 — implied by P4 |
| P8 | H.selected (U5SelectedCandidateSkeleton) | u ∈ A∖{q,p}, u ∉ {t1,t2,t3} (⊆ P2); NOTE dist p u ≠ dist p q is DERIVED (selected_off_circle), not a hypothesis — enforced via P4/P6 |
| P9 | rows: q/t1/t3-rows (CriticalRowPacket) | each source needs SOME exact-4 full ambient shell through it centered at another A-point; the p-shell of P4 legally serves all of q,t1,t2,t3 (only rowAt .t2 is pinned by hcenter/hsupport) |
| P10 | rows.uRow | u needs SOME exact-4 full ambient shell through it (center ≠ u) |
| P11 | hcritical : Nonempty (CriticalShellSystem D.A) = γ | EVERY z ∈ A has an exact-4 full ambient shell through it centered at some c ≠ z |

DISCREPANCY FLAG: P6 (no_qfree, from hlocalNoQFree) is carried by the leaf and by report
§5.B(ii) ("verbatim transport … hlocalNoQFree") but is ABSENT from the §5.B(i) itemized
summary of ρ and from the dispatch prompt's parenthetical list. It is exact-count-shaped and
is enforced here. Also enforced: P11 (γ) as a witness-global condition (part of (κ,γ,ρ)).

Out of scope for pattern-level B (inequality/order-shaped, per report §5.B(ii)):
ConvexIndep, MEC/NonObtuseCircumscribedMoserTriangle, hCirc, CapTriple geometry, hNoM44
(witnesses have all caps ≥ 5), signedArea/chord-separation. Witness-level facts checked:
|A| > 9, A not all collinear, K4-at-every-point, committed classes = recomputed exact-4 classes.

## 2. Arithmetic

Exact layer: hand-rolled ℚ-basis tower fields (stdlib Fraction), reduction identities:
- W16a: s²=2, t²=2+s, b² = 2·c₃·b + 1, c₃ = cos(3π/8) = t(s−1)/2
- W16b: s²=2, t²=2+s, b² = 2·c₁·b + 1, c₁ = cos(π/8) = t/2
- W20: u²=5, w²=10−2u, b = (u−1)/2 (= 1/φ)
- tri lattice: r3²=3; sq lattice: ℚ
Identities are true of the reals ⟹ vector-equal ⇒ value-equal (PROVEN direction).
Numeric mirror: Decimal prec 90 (>60 sig digits). Decision procedure per comparison:
vectors equal → EQUAL; vectors differ ∧ |Δ|num > 1e-6 → DIFFERENT; else NEAR-MISS →
sympy minimal_polynomial adjudication (guards against unfaithful basis). Cluster
threshold 1e-45 asserted within groups. Claimed SAT ⇒ independent sympy exact
re-verification of every equality conjunct + dets.

## 3. Smoke gate

Planted V0: 8-pt rational "double wheel" p1=(0,0), p2=(1,0), ring1={(1,0),(0,1),(−1,0),(0,−1)}
(exact-4 class of p1), ring2={(0,0),(2,0),(1,1),(1,−1)} (exact-4 class of p2); labels
U=(−1,0), V=(0,−1), W=(1,−1); S={V,W,(0,1),(1,0)}, O1={W,U,(2,0)}, O2={V,U,(0,0),(1,1)}.
Expected SAT incl. strict (q=(0,1) or (1,0) ∈ S∖{V,W}), γ total.
- V1 (drop (2,0)): kills u-row and γ → expected UNSAT.
- V2 (add (3/5,4/5) on p1's circle): breaks P4-exactness at p1, γ at 4 pts → expected UNSAT.
- V3 (add (−1,±1)): p1 gains 2nd mult-4 radius → p1 rejected by P6; expected SAT via p2 (loose-only).
- V4 (V0 with S={V,W}, O1={W,U,(0,1),(1,0),(2,0)}, O2={V,U,(0,0),(1,1)}): strict-UNSAT, loose-SAT.

## 4. Results

### Smoke gate (embed_search.py smoke) — ALL PASS
- V0 planted: SAT, 15 sols (6 strict), planted assignment p=(0,0), q=(0,1) strict FOUND; γ TOTAL.
- V1 drop (2,0): UNSAT; γ fails at 3 pts; u_none_covered=2. PASS.
- V2 add (3/5,4/5) cocircular: UNSAT; p_mult5_class reject fired; γ fails at 5 pts. PASS.
- V3 add (−1,±1): SAT via p2 only; p1 rejected by no_qfree (second ≥4 radius). PASS.
- V4 S={V,W}: SAT loose-only, strict=0. PASS.
Both directions validated: planted SAT found; one-conjunct mutilations UNSAT with
correct per-conjunct reject attribution; no_qfree path exercised positively+negatively.

### Witness verdicts (ρ ∧ γ embedding; exhaustive over (p, 4-class, q, u) after propagation)

| target | n | caps | admissible for B (full-H1 κ, general position) | γ | (p,q,u) enum | sols (strict q∈S∖{V,W}) | verdict | exact verification |
|---|---|---|---|---|---|---|---|---|
| W16a t9_wit_m8_1.4534 | 16 | (7,6,6) | YES | TOTAL | 572 | 572 (220) | **SAT** | sympy minpoly PASS (sol#1) |
| W16b t9_wit_m8_2.2853 | 16 | (7,7,5) | YES | TOTAL | 572 | 572 (220) | **SAT** | sympy minpoly PASS (sol#66) |
| W20 t9_wit_m10_0.6180 | 20 | (8,8,7) | YES | TOTAL | 1020 | 1020 (360) | **SAT** | sympy minpoly PASS (sol#0) |
| sq7x7 n16 (t1 rec2 = t1b rec2, identical) | 16 | (7,6,6) | full H1 YES; NOT general position (Γ-separator vanishes: e.g. U,V,W collinear) | TOTAL | 572 | 572 (220) | SAT (kills only Γ-free variants) | independent integer arith PASS (sol#22) |
| tri15 = W15 (t1 rec0) | 15 | (6,6,6) | NO (fails full H1 at U; 33 collinear triples) — diagnostic | TOTAL | 290 | 290 (80) | SAT (census-H1, Γ-free reading only) | independent integer arith PASS |
| tri16 (t1 rec1) | 16 | (7,6,6) | NO (fails full H1 at U) — diagnostic | FAILS at (1,3),(5,1) | 374 | 312 ρ-only | SAT_rho_only — γ fails, so even relaxed reading not falsified | n/a |

Near-misses in (1e-45, 1e-6): NONE anywhere. Committed classes recomputed+matched:
16/16, 16/16, 20/20 (rings), 16/16 (sq); tri: 10/15, 12/16 exact-4 (rest are selected
4-subsets of ≥4 classes — exact4_variant:false as committed; searcher recomputes true shells).

### Separator nonvanishing at the ring realizations (exact, all-pairs/all-triples sweeps)
- W16a: 560 triples, 0 exact-collinear, min|det| = 0.0794708…; min pairwise d² = 0.4268447…
- W16b: 560 triples, 0 exact-collinear, min|det| = 0.2368128…; min pairwise d² = 0.5857864…
- W20: 1140 triples, 0 exact-collinear, min|det| = 0.0489434…; min pairwise d² = 0.1458980…
- Exactness margins (E separators), min over ALL classes/non-members: 1.4142…, 1.4142…, 0.14589…
- min inter-radius gap in any center profile: 0.15894 / 0.47362 / 0.06049 (d² units)
⟹ at each ring realization every Δ/Γ/E separator is nonzero and every generator of
I(κ,ρ) vanishes ⟹ 1 ∉ I(κ,ρ) : (Δ·Γ·E)^∞. Candidate B statement FALSE at n=16 (×2), n=20.

### Designated exhibits (independently exact-verified)
- W16a sol#1 (all-non-Moser): p=O0=(1,0), q=O2=(0,1) ∈ S∖{V,W}, T={O6, I1, I6}, u=O3;
  r² = 2; t2-row = full p-class {q,t1,t2,t3}; u-shell center O3-class… (see results_W16a.json).
- W16b sol#66 (all-non-Moser): p=O1, q=I1 ∈ S∖{V,W}, T={O3,O7,I0}, u=O0.
- W20 sol#0: p=O0, q=O2 ∈ S∖{V,W}, T={O8,I2,I7}, u=O1; r² = 2−2cos(2π/5) = 4sin²(π/5).
- sq16 sol#22 (integers): p=(1,1), q=(0,3) ∈ S∖{V,W}, T={(2,3),(3,0),(3,2)}, u=(1,5), r²=5;
  full class of (1,1) at d²=5 is exactly {(0,3),(2,3),(3,0),(3,2)}; profile max mult 3 elsewhere.
- tri15 strict sol: p=(0,3), q=(2,0) ∈ S, T={(2,4),(3,1),(3,2)}, u=(1,2), r²=7 (lattice form).

### Exhaustiveness
Raw ordered 6-label space: n⁶-ish (~5.8M ordered 6-tuples at n=16; 27.9M at n=20). After
constraint propagation the free choices are exactly (p; its unique mult-≥4 radius class C,
forced; q ∈ C∖Moser; u ∉ {p}∪C): search enumerated ALL of them (572/572/1020/572/290/374
triples; zero truncation, zero timeouts). t1,t2,t3 assignment within C∖{q} is a proven
symmetry (all ρ-conjuncts symmetric in t1,t2,t3; only the SET enters hsupport/hfixed/H);
q/t1/t3/t2-row shell choices beyond existence are immaterial (only rowAt .t2 is pinned by
hcenter/hsupport; p-shell serves all four legally); u-row/γ existence checked over ALL
exact-4 full shells (committed and non-committed). Search COMPLETE on every target.

### Verdict
Candidate B (report §5.B) is **FALSE**: exact-verified row-fragment embeddings exist in all
three general-position full-H1 ring witnesses (and in the sq16 full-H1 lattice witness for
Γ-free variants). Per the dispatch verdict semantics, the entire ideal-theoretic uniform
shape for the Card12Up tail is closed.
