<!-- Provenance: report body produced by the Candidate B embedding-test agent
     (math-prover, 2026-07-06/07, dispatched per D3 formulation report §5.B.iii
     / §7.1); subagent report-file writes to a report.md path are
     guard-blocked, so the orchestrator transcribed the agent's final message
     verbatim below this header. The agent's own in-repo working record is
     STATE.md in this directory; scripts and full solution lists alongside.

     Independent confirmation by the orchestrator (2026-07-07), separate
     logic, in ../independent_check.py (extended for this result):
       - the structural mechanism behind the SAT density — every ring-witness
         point has EXACTLY ONE radius cluster of multiplicity >= 4, that
         cluster has size exactly 4 and equals the committed class (the
         no_qfree / P6 conjunct), and shell coverage is total (P11) —
         verified at 50 digits on W16a/W16b/W20: ALL PASS. Combined with the
         previously verified full-exact-4 classes, general position, full H1,
         and cap admissibility, this independently confirms that every
         (p, q ∈ K(p)∖Moser, u ∉ {p}∪K(p)) triple satisfies the encoded
         conjuncts — the agent's abundance claim.
       - designated exhibit W20 sol#0 hand-traced: K(O0) = {O2, O8, I2, I7}
         = {q} ∪ T exactly; r² = 4sin²(π/5) = chord²(72°) on the unit ring.
       - results JSONs spot-checked (W20: SAT, 1020 solutions, 360 strict,
         0 near-misses) — match the report.
     Consequence folded into docs: with Candidates A and B both falsified,
     the ideal-theoretic uniform shape for the Card12Up tail is closed;
     remaining routes are Candidate C (head split, n ∈ {12,13,14}) and
     Candidate D (convexity-coupled forcing). -->

# Candidate B falsification test — row-fragment (ρ) embedding — VERDICT: B IS FALSE

**Bottom line.** The row fragment ρ embeds in **every** primary witness. All three general-position, full-H1 ring witnesses (W16a, W16b, W20) admit exact-verified simultaneous satisfactions of every equality/exact-count/membership conjunct of ρ, plus the γ shell-covering, in abundance (572, 572, 1020 assignments respectively — every enumerated candidate is a solution; 220/220/360 of them with the strict `q ∈ S ∖ {V,W}` cap condition). Per the dispatch's verdict semantics: **Candidate B is FALSE and the entire ideal-theoretic uniform shape for the Card12Up tail is closed.** The dead-ends entry's "row-decorated remnant (Candidate B, embedding test pending)" is now settled negative, consistent with the report's own poor prognosis (Obstruction B1: witness abundance).

Dead-ends check: the assigned approach is the pending open item of `doubleapex-card12up-uniform-pattern-lemma`, not a recorded dead end. Conventions (Q), (D-msolve) read; no solver-encoding semantics from (D-msolve) were violated (no Gröbner/SMT verdicts used — this is a constructive embedding test).

## 1. Lean definitions (quoted) and encoding

Leaf (`lean/Erdos9796Proof/P97/U1LargeCapRouteBTail.lean:2383`), hypothesis binders quoted:

```
theorem DoubleApexOffSurplusSharedRadiusPair
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {hncol : ¬ Collinear ℝ (D.A : Set ℝ²)}
    (MT : MEC.NonObtuseCircumscribedMoserTriangle D.A D.nonempty hncol)
    (hCirc : ∃ h12 h23 h13, MT.toMoserTriangle.case_split = Or.inl ⟨h12, h23, h13⟩)
    {M : MoserTriangle D.A} (CP : CapTriple D.A M) (i j : Fin 3)
    (rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u)
    (hM : M = MT.toMoserTriangle.toStructural hCirc)
    (hqCap : q ∈ CP.capAt i)
    (hsurplus : 4 < (CP.capAt i).card)
    (hqNonMoser : q ∉ M.verts)
    (hjne : j ≠ i)
    (hj5 : 5 ≤ (CP.capAt j).card)
    (hNoM44 : ¬ (∃ S : SurplusCapPacket D.A, S.IsM44))
    (hcard : 9 < D.A.card)
    (hcritical : Nonempty (CriticalShellSystem D.A))
    (hlocalNoQFree : U3LocalizedNoQFreePacket D q p)
    (hfixed : U3FixedTriplePacket D q p t1 t2 t3)
    (hbase : List.Pairwise (fun x y : ℝ² => x ≠ y) [p, q, t1, t2, t3, u])
    (H : U1LargeCapRouteBTailLiveData D p q t1 t2 t3 u)
    (hcenter : (rows.rowAt U1Depth5.CriticalSource.t2).center = p)
    (hsupport : (rows.rowAt U1Depth5.CriticalSource.t2).selected.toCriticalFourShell.support
        = ({q, t1, t2, t3} : Finset ℝ²)) : ...
```

Chased definitions, quoted:

```
-- U5GlobalIncidenceBasic.lean:30
structure U5DangerousTriple (D : CounterexampleData) (q p : ℝ²) (T : Finset ℝ²) where
  q_mem : q ∈ D.A
  p_mem : p ∈ D.A
  p_ne_q : p ≠ q
  T_subset : T ⊆ (D.skeleton q).erase p
  T_card : T.card = 3
  T_noncollinear : ¬ Collinear ℝ (T : Set ℝ²)
  q_radius_pos : 0 < dist p q
  T_same_radius : ∀ t ∈ T, dist p t = dist p q

-- U5GlobalIncidenceBasic.lean:65
structure U5SelectedCandidateSkeleton (D : CounterexampleData) (q p : ℝ²) (T : Finset ℝ²) (u : ℝ²) where
  candidate_mem : u ∈ (D.skeleton q).erase p
  candidate_notin_T : u ∉ T

-- U1LargeCapRouteBTail.lean:256
structure U1LargeCapRouteBTailLiveData (D : CounterexampleData) (p q t1 t2 t3 u : ℝ²) : Prop where
  dangerous : U5DangerousTriple D q p ({t1, t2, t3} : Finset ℝ²)
  exactQDeletedRadius :
    (((D.skeleton q).erase p).filter fun y => dist p y = dist p q).card = 3
  selected : U5SelectedCandidateSkeleton D q p ({t1, t2, t3} : Finset ℝ²) u

-- U1CarrierInjection.lean:523
structure CriticalFourShell (A : Finset ℝ²) (q center : ℝ²) where
  center_mem : center ∈ A.erase q
  radius : ℝ
  radius_pos : 0 < radius
  support : Finset ℝ²
  support_eq : support = A.filter fun z => dist center z = radius
  support_card : support.card = 4
  q_mem_support : q ∈ support
-- CriticalSelectedFourClass (:611) extends it with four distinct named labels,
--   support_eq_labels : toCriticalFourShell.support = {l1, l2, l3, l4}

-- U1CarrierInjection.lean:948
structure CriticalShellSystem (A : Finset ℝ²) where
  shellAt : ∀ q : ℝ², q ∈ A → Sigma fun center : ℝ² => CriticalSelectedFourClass A q center

-- U1Depth5Prefix.lean:446, :539, :1502
structure CriticalRowPacket (D : CounterexampleData) (source : Plane) where
  source_mem : source ∈ D.A
  center : Plane
  selected : CriticalSelectedFourClass D.A source center
structure CriticalSourceRows (D : CounterexampleData) (baseQ baseT1 baseT2 baseT3 selectedU : Plane) where
  qRow : CriticalRowPacket D baseQ
  t1Row : CriticalRowPacket D baseT1
  t2Row : CriticalRowPacket D baseT2
  t3Row : CriticalRowPacket D baseT3
  uRow : CriticalRowPacket D selectedU
def rowAt ... | .t2 => R.t2Row  -- etc.; sources are q,t1,t2,t3,u (f1 := u); p has no row

-- U3ToU5DangerousTriple.lean:228 and :32
structure U3LocalizedNoQFreePacket (D : CounterexampleData) (q p : ℝ²) where
  q_mem : q ∈ D.A
  p_mem_skeleton : p ∈ D.skeleton q
  no_qfree : ¬ HasNEquidistantPointsAt 4 ((D.skeleton q).erase p) p
structure U3FixedTriplePacket (D : CounterexampleData) (q p t1 t2 t3 : ℝ²) where
  q_mem : q ∈ D.A;  p_mem : p ∈ D.A
  t1_mem t2_mem t3_mem : tᵢ ∈ (D.skeleton q).erase p
  t1_ne_t2 t1_ne_t3 t2_ne_t3 : tᵢ ≠ tⱼ
  q_radius_pos : 0 < dist p q
  t1_same_radius t2_same_radius t3_same_radius : dist p tᵢ = dist p q

-- U5ModeADeletion.lean:89 ; formal-conjectures ErdosProblems/97.lean:34
def CounterexampleData.skeleton (D) (q) : Finset ℝ² := D.A.erase q
def HasNEquidistantPointsAt (n : ℕ) (A : Finset ℝ²) (p : ℝ²) : Prop :=
  ∃ r : ℝ, r > 0 ∧ (A.filter fun q ↦ dist p q = r).card ≥ n
```

**Encoding** (every conjunct grounded to distances/counts/memberships; full table in STATE.md §1):

| id | conjunct | encoding on a witness point set A |
|---|---|---|
| P1 | hqCap, hsurplus, hjne, hj5, hqNonMoser | q ∉ {U,V,W}; q's cap > 4 with a ≥5 partner (all witness caps ≥ 5, so non-Moser suffices); STRICT variant: q ∈ S∖{V,W} |
| P2 | hbase | six labels pairwise distinct, in A |
| P3 | hfixed same_radius + dangerous.T_same_radius, q_radius_pos | dist p t₁ = dist p t₂ = dist p t₃ = dist p q > 0 |
| P4 | hcenter + hsupport + t2-row `support_eq`/`support_card`/`q_mem_support`/`center_mem`/`radius_pos` | the FULL ambient class {y ∈ A : dist p y = dist p q} is exactly {q,t1,t2,t3} (card 4) |
| P5 | dangerous.T_noncollinear | det(t₁,t₂,t₃) ≠ 0 (automatic for 3 distinct concyclic points — PROVEN — checked anyway) |
| P6 | hlocalNoQFree.no_qfree | every radius over A∖{p,q} has multiplicity ≤ 3 ⟺ p has no second mult-≥4 radius |
| P7 | H.exactQDeletedRadius | #{y ∈ A∖{q,p} : dist p y = dist p q} = 3 (implied by P4) |
| P8 | H.selected | u ∈ A∖{q,p}, u ∉ T (⊆ P2); `dist p u ≠ dist p q` is DERIVED, not a hypothesis — enforced through P4/P6 |
| P9 | q/t1/t3-rows | each source needs some exact-4 full ambient shell through it, center ≠ source; the p-shell of P4 legally serves q, t1, t2, t3 — only `rowAt .t2` is pinned by hcenter/hsupport (PROVEN from the types) |
| P10 | uRow | u needs some exact-4 full ambient shell through it |
| P11 | hcritical (γ) | EVERY z ∈ A lies on an exact-4 full ambient shell centered at some c ≠ z |

**Discrepancy flags** (conjuncts the report's §5.B(i) summary / dispatch parenthetical omitted):
1. **`no_qfree` (P6)** — carried by the leaf via `hlocalNoQFree` and by report §5.B(ii)'s "verbatim transport (… hlocalNoQFree …)", but absent from the §5.B(i) itemization and the dispatch's conjunct list. It is exact-count-shaped and binding (it rejected 1 candidate p in tri15 and 2 in tri16; mult-5 rejects fired 5 and 4 times there). Enforced throughout.
2. **`T_noncollinear` (P5)** — not named in either summary; automatic for concyclic triples but part of `U5DangerousTriple`. Enforced and exact-checked.
3. Formulation note: of the "five exact-4 rows", four are bare existence (only the t2-row is pinned); a single p-shell legally witnesses the q/t1/t2/t3 rows, so ρ needs only two distinct shells (p's class + one through u) beyond γ.
4. The "two full-H1-relevant lattice witnesses": t1_results.json rec2 and t1b_results.json rec2 are byte-identical in subset and labeling — one distinct sq7x7 witness, tested from both files.
5. sq7x7 is **not general position** (its U,V,W = (2,2),(2,3),(2,4) are collinear), so it falsifies only Γ-free variants of B; the rings are the decisive falsifiers at the full (Δ·Γ·E) level.

## 2. Smoke gate (mandatory, run first) — ALL PASS

Planted 8-point rational "double wheel" (two mutually-covering exact-4 circles) with synthetic caps; ρ embeds by design. Searcher found SAT with 15 solutions including the specific planted assignment p=(0,0), q=(0,1) strict (PASS). Mutilations: **V1** (delete (2,0)) → UNSAT, γ fails at 3 points, u-row reject fired (PASS); **V2** (add (3/5,4/5) cocircular, breaking P4-exactness) → UNSAT, `p_mult5_class` reject fired, γ fails (PASS); **V3** (add (−1,±1), giving p₁ a second mult-4 radius) → p₁ correctly rejected by the P6/no_qfree path while SAT persists via p₂ (PASS); **V4** (S = {V,W}) → strict-UNSAT/loose-SAT split correct (PASS). Both search directions and each reject path validated. Label: EMPIRICALLY VERIFIED (executions logged in STATE.md §4).

## 3. Per-witness verdict table

| target | n | caps | B-admissible (full-H1 κ + general position) | γ (P11) | enumerated | solutions (strict) | verdict |
|---|---|---|---|---|---|---|---|
| **W16a** t9_wit_m8_1.4534 | 16 | (7,6,6) | YES | TOTAL | 572 | **572 (220)** | **SAT** |
| **W16b** t9_wit_m8_2.2853 | 16 | (7,7,5) | YES | TOTAL | 572 | **572 (220)** | **SAT** |
| **W20** t9_wit_m10_0.6180 | 20 | (8,8,7) | YES | TOTAL | 1020 | **1020 (360)** | **SAT** |
| sq7x7 n16 (t1 rec2 ≡ t1b rec2) | 16 | (7,6,6) | full H1 yes; NOT general position | TOTAL | 572 | 572 (220) | SAT — kills Γ-free variants only |
| tri15 = W15 (diagnostic; fails full H1 at U) | 15 | (6,6,6) | NO | TOTAL | 290 | 290 (80) | SAT under census-H1 reading only |
| tri16 (diagnostic; fails full H1 at U) | 16 | (7,6,6) | NO | **FAILS** at (1,3),(5,1) | 374 | 312 ρ-only | SAT_ρ_only — γ fails, so not a falsifier under any reading |

No UNSAT verdict occurred on any admissible target, so no UNSAT margin is owed. Near-miss guard window (1e-45, 1e-6): **empty everywhere**. Robustness margins (d² scale): min inter-radius gap 0.1589 / 0.4736 / 0.0605 (rings), 1 (integer lattices); min pairwise d² 0.4268 / 0.5858 / 0.1459; min exactness (E-separator) margin 1.4142 / 1.4142 / 0.1459; all triples exactly noncollinear on the rings (560/560, 560/560, 1140/1140; min |det| 0.0795 / 0.2368 / 0.0489 — matches the report's independent check).

**Designated exhibits** (each independently exact-verified):
- W16a sol#1 (p,q,T,u all non-Moser): p=O0=(1,0), q=O2=(0,1) ∈ S∖{V,W}, T={O6,I1,I6}, u=O3; r²=2; the full class of p at r² = 2 is exactly {q,t1,t2,t3}.
- W16b sol#66 (all non-Moser): p=O1, q=I1 ∈ S∖{V,W}, T={O3,O7,I0}, u=O0; r²=2.
- W20 sol#0: p=O0, q=O2 ∈ S∖{V,W}, T={O8,I2,I7}, u=O1; r² = 4sin²(π/5) = 2−2cos(2π/5).
- sq16 sol#22 (pure integers): p=(1,1), q=(0,3) ∈ S∖{V,W}, T={(2,3),(3,0),(3,2)}, u=(1,5); r²=5; profile of p has max multiplicity 3 off the class; γ total.
- tri15 strict sol: p=(0,3), q=(2,0) ∈ S, T={(2,4),(3,1),(3,2)}, u=(1,2); r²=7 in the lattice form di²+di·dj+dj².

**Why SAT is so dense (structural, PROVEN on the verified data):** in each ring witness every point has exactly one mult-≥4 radius, it is exactly 4 (the engineered class), and coverage is total; so every (p, q ∈ K(p)∖Moser, u ∉ {p}∪K(p)) triple satisfies all of P1–P11 — the rejects row is all zeros.

## 4. Soundness and exhaustiveness

- **Arithmetic.** Primary layer: exact ℚ-basis tower fields (stdlib Fraction) — W16a/b: ℚ(√2, √(2+√2), b) with b² = 2cb+1; W20: ℚ(√5, √(10−2√5)) with b = 1/φ rational in √5; lattices: integers. The reduction identities are true identities of ℝ, so vector-equality proves value-equality. Disequalities: numeric mirror (Decimal prec 90 / sympy 80-digit) with cluster threshold 1e-45 and near-miss guard — window empty on every target, worst margin 0.0489, i.e. ~39 orders above the guard ceiling.
- **Independent exact re-verification (mandated before claiming SAT).** `sympy_verify.py` rebuilds coordinates from scratch in sympy and PROVES every equality conjunct by `minimal_polynomial(diff) == x`: all 48 (W16a), 48 (W16b), 60 (W20) class equalities (covering the t2-row, all reused rows, the u-shell, and every γ-shell), plus the p-profile within-cluster equalities (8/8/10), coverage totality, no_qfree cluster structure, T-determinant margins, strict cap membership. All PASS. Lattice exhibits re-verified in a separate plain-integer code path. Committed class maps recomputed and matched: 16/16, 16/16, 20/20, 16/16 (tri: 10/15 and 12/16 exact-4; the rest are committed selected 4-subsets of larger classes, consistent with `exact4_variant:false`).
- **Exhaustiveness.** Complete, no truncation, no timeouts. After propagation the entire freedom of ρ is (p; its forced unique 4-class C; q ∈ C∖Moser; u ∉ {p}∪C): all such triples enumerated (counts in the table). t₁,t₂,t₃ within C∖{q} is a proven symmetry of every ρ-conjunct; non-t2 row-shell choices beyond existence are immaterial (nothing else references them); u-row/γ existence checked over ALL exact-4 full shells, committed or not. Raw ordered 6-label space for scale: ~5.8M (n=16) / ~27.9M (n=20) ordered 6-tuples.

## 5. Rigor labels

- Definition extraction and conjunct encoding: **PROVEN** (verbatim source; every reference chased to distances/counts/memberships).
- Row-reuse legality and t-permutation symmetry: **PROVEN** (from the Lean types; only `rowAt .t2` is pinned).
- Equality conjuncts of all designated embeddings, all class equalities, γ-coverage, no_qfree cluster equalities: **PROVEN** (sympy minimal_polynomial exact decisions + independent field-layer identities; lattice cases pure integer arithmetic).
- Disequality/exactness/noncollinearity conjuncts on the rings: **EMPIRICALLY VERIFIED at 80-digit precision** with worst margin 0.0489 (d²/det scale) and an empty (1e-45, 1e-6) near-miss window; on the lattices **PROVEN** (integer comparisons). No claim rests on float64.
- Verdict "Candidate B is FALSE": **PROVEN** modulo the preceding line's numeric-margin certification of disequalities (three independent witnesses; equality side fully proven; margins are 10⁻² scale, not borderline). Each ring realization is a real point of V(I(κ,ρ)) at which every Δ/Γ/E separator is nonzero, hence 1 ∉ I(κ,ρ) : (Δ·Γ·E)^∞ at n=16 (twice) and n=20.
- "Every enumerated assignment is a solution" (the density observation): **EMPIRICALLY VERIFIED** on the five SAT targets.
- No finiteness or structural assumption beyond the witnesses themselves is used; the Lean leaf (with `ConvexIndep`) is untouched by this result — the falsification is pattern-level, exactly as scoped in the dead-ends entry.

## 6. Artifacts

All under `/Users/adam/projects/math-projects/erdos-97-96-formalization/scratch/d3-formulation/candidateB/` (the only directory written):
- `STATE.md` — encoding table, smoke log, verdict table, margins, exhibits, exhaustiveness.
- `embed_search.py` — exact-field searcher + smoke battery (`smoke` subcommand reproduces the gate).
- `sympy_verify.py` — independent exact re-verifier (minimal_polynomial decisions).
- `results_W16a.json`, `results_W16b.json`, `results_W20.json`, `results_sq16_t1.json`, `results_sq16_t1b.json`, `results_tri15_t1.json`, `results_tri16_t1.json` — full solution lists, reject diagnostics, near-miss tables (all empty), coverage data.

Inputs read (unmodified): `scratch/d3-formulation/{report.md, t9_wit_*.json, t1_results.json, t1b_results.json}`, `docs/dead-ends.md`, and the Lean sources cited above.

**What next (ranked):** (1) fold this verdict into the dead-ends entry (`doubleapex-card12up-uniform-pattern-lemma`): the row-decorated remnant is closed; the banked falsifiers now also carry exact-verified ρ+γ embeddings, so any future uniform proposal must be convexity-coupled (Candidate D vocabulary) — orchestrator edit, since this test was repo-read-only. (2) The report's §7 item 2 split decision (close the 12–14 head via Candidate C, name the card-≥15 residual) is now the only pattern-level move left standing. (3) No further embedding tests are warranted: with every enumerated assignment a solution on all admissible witnesses, additional witnesses would only re-confirm.
