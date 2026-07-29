# A-core Layer-1 incidence encoding — specification (2026-07-29, v1.4)

Session-1 artifact of `docs/computational-closure-plan-2026-07-28.md` (§4, §5
row 1, §8). Source of truth for the hypotheses:
`docs/solve-prompts/2026-07-27-rigid221-physical-apex-chain.md` §1–§2 (cited
below by tag: (B1)–(B10), (C1)–(C13), (J1)–(J6), (G1)–(G6), (S1)–(S6),
(E1)–(E8), (P1)–(P3), leaf deltas (A2.a)…(A8.d), plus the §2.0 Remark).
Live leaves after refactor `a0f73bc1`: A1, A2, A3, A6, A7, A8 (A4/A5 closed;
A7/A8 renamed `blockerVRow_*`).

**Soundness discipline (binding).** Every clause family below carries the
hypothesis tag that implies it. A clause may only assert what the package
hypotheses prove about the named witnesses. The universe is NOT asserted
complete: no clause says "every point of A is a label". Exactness clauses are
used only where the hypotheses state exact classes ((B9)+(G1) for 𝒯, (E4) for
Cl(a₁,r), cap partition for non-Moser points). Cardinality at-most clauses run
only over pairwise-provably-distinct label sets. Cardinality lower bounds go
only into the integer layer. Omitted hypotheses (§7 below) only weaken UNSAT
prospects, never soundness: UNSAT ⇒ the package is contradictory at the
incidence layer; SAT means nothing negative.

## 1. Point universe (13 labels)

| Label | Denotes | Why it exists |
|---|---|---|
| a0 | surplus-cap apex v_σ | packet S |
| a1 | first opposite apex | packet S |
| a2 | second (physical) apex | packet S |
| zd | z_d | (B8) |
| u  | u (= source under (P3)) | (B5) |
| xu | second member of I_u | (G1), Remark |
| v  | v | (B5) |
| xv | second member of I_v | (G1), Remark |
| oth | other | (C5)–(C8) |
| qh | q̂ | (E7) |
| wh | ŵ | (E7) |
| f1, f2 | remaining two members of Cl(a₁,r) | (E4): Cl(a₁,r) = {qh,wh,f1,f2} |

**Baked pairwise distinctness** (no eq atom; justification):
- a0,a1,a2 pairwise (Moser triangle).
- zd,u,xu,v,xv pairwise ((G1): |I_u|=|I_v|=2 disjoint, z_d in neither;
  u∈I_u, v∈I_v per Remark; xu/xv are the respective second members).
- qh,wh,f1,f2 pairwise ((E4) exact-4 class + (E7) q̂≠ŵ).
- u,oth ∉ {a0,a1,a2} (u,oth ∈ O₂° by (C2),(C7)+(P3); interiors exclude
  Moser vertices). v ≠ a2 ((B3): a₂∉𝒯 ∋ v); v vs a0,a1 is ambiguous —
  eq atoms.
- qh,wh ∉ {u,v?,oth}: qh,wh ∈ O₁° (E7) and O₁°∩O₂°=∅ (cap partition on
  non-Moser points) gives qh,wh ∉ {u,oth}. v ambiguous (v∈O₂° only in A3) —
  eq atom. qh,wh ∉ {a0,a1,a2}: interiors exclude Moser vertices.
- f1,f2 ≠ u ((C3)+(P3): source ∉ Cl(a₁,r)); f1,f2 ≠ a1 (r>0);
  f1,f2 ≠ a2: NOT baked — eq atom.
- oth ≠ u (C5); oth ≠ xu ((C8)+(P3): oth ∉ Row(u) ⊇ I_u ∋ xu).
- a2 ∉ {zd,u,xu,v,xv} ((B3): ρ>0 so a₂∉𝒯).
- a1 ∉ {qh,wh,f1,f2} (r>0 so a₁∉Cl(a₁,r)); a1 ≠ u ((C2): u∈O₂° non-Moser).

**Eq atoms** `eq(p,q)` for every unordered pair NOT baked distinct above.
Explicit list: {qh,wh}×{zd,xu,xv,v}; {f1,f2}×{zd,xu,xv,v,oth,a0,a2};
oth×{zd,v,xv}; {a0,a1}×{zd,xu,xv}; a0×{qh,wh}; v×{a0,a1}.
(If implementation finds another unproven pair, ADD an eq atom rather than
baking distinctness — flag it in the report.)

Consistency schemas over eq atoms:
- (EQ1) at-most-one: for label p and any set L of pairwise-baked-distinct
  labels, at most one of {eq(p,l) : l∈L} is true.
- (EQ2) exclusion: if p,q baked distinct and l has eq atoms to both,
  ¬eq(p,l) ∨ ¬eq(q,l).
- (EQ3) congruence: eq(p,q) → (Φ(p) ↔ Φ(q)) for every unary atom family Φ
  below, and for beta: eq(p,q) → (b(p,y) ↔ b(q,y)) and (b(x,p) ↔ b(x,q)).
- (EQ4) transitivity (v1.1 — added after the implementation report showed
  the gap is reachable for the four triangles involving oth, e.g.
  eq(v,oth) ∧ eq(oth,f1) ∧ ¬eq(v,f1) was SAT under base): for every label
  triple p,q,r whose three pairs all carry eq atoms,
  eq(p,q) ∧ eq(q,r) → eq(p,r), instantiated in all three rotations.
  Uniform over all such triangles (the a0-triangles are emergently closed
  by (EQ3) unit chains but the uniform schema is harmless). Required
  before any Layer-2 incidence-type enumeration: without it, spurious
  eq-patterns inflate the type census.

## 2. Atom families and unit values

All families range over the 13 labels unless restricted.

**Cap interiors** `inSig(p), inO1i(p), inO2i(p)` (strict interiors Σ°, O₁°,
O₂°) and `moser(p)`:
- moser(a0)=moser(a1)=moser(a2)=T; for p with eq atoms to a Moser label,
  moser(p) ↔ ⋁ eq(p, aᵢ); else moser(p)=F.
- (CAP1) partition [packet S: every non-Moser point in exactly one cap]:
  ¬moser(p) → exactly-one(inSig(p), inO1i(p), inO2i(p)).
- (CAP2) moser(p) → ¬inSig(p) ∧ ¬inO1i(p) ∧ ¬inO2i(p) [interiors exclude
  Moser vertices].
- Units: inO2i(u)=T (C2)+(P3); inO2i(oth)=T (C7); inO1i(qh)=inO1i(wh)=T (E7).

**Frontier class** `cl1(p)` (p ∈ Cl(a₁,r)):
- Units: cl1(qh)=cl1(wh)=cl1(f1)=cl1(f2)=T (E4)+(E7); cl1(a1)=F (r>0);
  cl1(u)=F (C3)+(P3).
- (CL1) exactness [E4]: for every other label p:
  cl1(p) → eq(p,qh) ∨ eq(p,wh) ∨ eq(p,f1) ∨ eq(p,f2) (only over p's
  existing eq atoms; if p has no eq atom to any of the four, cl1(p)=F).

**Physical class** `inT(p)` (p ∈ 𝒯 = Cl(a₂,ρ)):
- Units: inT(zd)=inT(u)=inT(xu)=inT(v)=inT(xv)=T
  (G1)+Remark; **inT(oth)=T (C6)**; inT(a2)=F (B3).
- (T1) exactness [(B9)+(G1)]: for every other label p: inT(p) →
  ⋁ eq(p,t) over t ∈ {zd,u,xu,v,xv} with an existing eq atom (else inT(p)=F).

**Rows** `row_u(p), row_v(p)` (p ∈ Row(u), p ∈ Row(v)):
- Units row_u: T on u,xu [I_u={u,xu}: Remark+(G1)]; F on v (B6), zd (J3),
  oth (C8)+(P3). row_u(a1) is left UNCONSTRAINED — no hypothesis excludes
  a₁ ∈ Row(u). (v1.1: this replaces a dangling (RB2) reference; the
  implementation's literal reading was correct.)
- Units row_v: T on v,xv; F on u (B6), zd (J3).
- (R1) at-most-4 [critical shell rows are exact-4]: over the pairwise
  distinct set {zd,u,xu,v,xv} count row_u ≤ 4; likewise row_v. (Cheap;
  subsumed by units here but kept as schema for CEGAR extensions.)
- (R2) I_u/I_v exactness inside 𝒯 [(G1)]: for T-labels t:
  row_u(t)∧inT(t) already fixed by units; nothing further.
- (R3) cl1-row collapse [H⋆ pattern: x∈Cl(a₁,r) → Row(x)=Cl(a₁,r)]:
  cl1(v) → (row_v(p) ↔ cl1(p)) for all p. Same schema for any tracked row
  owner (u: moot since cl1(u)=F).

**Blocker map** `b(x,y)`, x ∈ {u,v,zd,xu,xv,oth,qh,wh}, y ∈ labels ∪ {OUT}:
- (BM1) exactly-one over y [β functional].
- (BM2) ¬b(x,x) [shell system: c(x)≠x]; under eq: eq(p,q) → ¬b(p,q).
- (BM3) ¬b(x,a2) for all x [Remark: (S2)+blocking give β(x)≠a₂ for every x];
  also ¬b(x,y) for y with eq(y,a2) (congruence handles).
- (BM4) H⋆ pattern [established fact: β(x)=a₁ ↔ x∈Cl(a₁,r)]:
  b(x,a1) ↔ cl1(x). In particular b(qh,a1)=b(wh,a1)=T, and for x with
  cl1(x)=F: ¬b(x,a1).
- (BM5) center not in own row [row radius > 0]: b(u,y) → ¬row_u(y);
  b(v,y) → ¬row_v(y).
- (BM6) (P2): b(u,y) for some y with inT(y): clause ⋁_{t∈{zd,v,xv}} b(u,t)
  [(P2)+(BM2: not u)+(row_u(xu) with (BM5)) — justify: β(u)∈𝒯,
  β(u)≠u, β(u)∉Row(u)∋xu].
- (BM7) (C9): β(source)≠β(other): for each y: ¬b(u,y) ∨ ¬b(oth,y)
  (with eq congruence).
- (BM8) (J4): ¬b(u,y) ∨ ¬b(v,y) for each y.
- (BM9) CD-packet consequences [(J5),(J6)]: b(zd,y) → y ≠ β(u)-target and
  ¬b(zd,a2): encode β(z_d)≠β(u) as ¬b(zd,y) ∨ ¬b(u,y) per y, and
  β(z_d)≠β(v) likewise; ¬b(zd,a2) already in (BM3).

**Survival atoms** `sv(p)` (K4(A∖{p}; a₂)) — opaque:
- (SV1) all units T for every label p [(S2) full deletion robustness at a₂].

**Deletion set** `del(p)` over p ∈ {zd,u,xu,v,xv} (Δ ⊆ 𝒯 by (G3)):
- (DEL1) at-least-one [(G3): Δ≠∅].
- (DEL2) at-least-two [(G4) with (S2)/(SV1): a singleton Δ={s} would make
  ¬K4(A∖{s};γ) with γ=a₂ under (P1) contradict (S2). Under the A1 run
  (γ≠a₂) DROP this clause — tag it 𝔓-only.]
- |Δ|≤5 auto (5 labels).

**CD witness sets** `bs1(p), bs2(p)` (B₁,B₂ of the (J5) packet CD(z_d;β(u),a₂))
over p ∈ {zd,u,xu,v,xv,qh,wh,f1,f2} — projections only:
- (CD1) ¬bs1(zd), ¬bs2(zd) [z∉Bᵢ].
- (CD2) at-most-4 for bs1 and bs2 over the distinct set {zd,u,xu,v,xv}
  [(J5): |Bᵢ|=4] and separately over {qh,wh,f1,f2}.
- (CD3) overlap ≤ 2 [(J5)]: over {zd,u,xu,v,xv}: at-most-2 of
  (bs1(p) ∧ bs2(p)) via product atoms.
- (Same trio for the (J6) packet: `bt1, bt2` — identical schemas.)

**S5 radius-classification arms** `s5a, s5b`:
- (S5A) s5a ∨ s5b [(S5)].
- (S5B) ¬s5b [(S5)(b) requires NO t with |Cl(a₂,t)|≥5, but (B9) gives
  |Cl(a₂,ρ)|=5, ρ>0 (B3)]. — This is a deliberate seed-level deduction;
  keep both clauses so the solver derives s5a (sanity: unit-propagates).

**Integer layer** (unary/order encoding, bound MAXN=24):
vars nSig, nO1, nO2 (strict-interior cardinalities |Σ°|,|O₁°|,|O₂°|), n.
- (N1) n = nSig + nO1 + nO2 + 3 [cap partition: non-Moser points split among
  the three interiors; 3 Moser vertices].
- (N2) n ≥ 12 (B1).
- (N3) nO1 ≥ 2 [(S3): |O₁|≥4, closed cap contains exactly 2 Moser vertices].
- (N4) nO2 ≥ 3 [(S4): |O₂|≥5].
- (N5) surplus: nSig ≥ 3 [packet S: |Σ|>4].
- (N6) S6 arms [S6]: s6a ∨ s6b ∨ s6c with
  s6a → nSig ≥ 4; s6b → (nSig = 3 ∧ nO1 ≥ 3); s6c → (nSig = 3 ∧ nO1 = 2 ∧
  nO2 ≥ 4). (The arithmetic identities inside (S6)(b),(c) are equivalent to
  (N1) given the stated cap sizes — implied, not extra.)
- (N7) membership→count lower links: nO2 ≥ |{t ∈ {zd,u,xu,v,xv} : inO2i(t)}|
  (the five are pairwise distinct; encode with the order-encoding: for each
  k, if ≥k of the five inO2i atoms true then nO2 ≥ k). Likewise
  nO1 ≥ 2 from qh,wh (constant, subsumed by (N3)); do NOT link ambiguous
  labels (oth, f1, f2) into counts.

## 3. Derived-count observations (for the report, not extra clauses)

N_u = |I_u∩O₂°| = 1 + [inO2i(xu)] (u∈O₂° unit). N_v = [inO2i(v)] + [inO2i(xv)].
So: N_u=2 ↔ inO2i(xu); N_u≠2 ↔ ¬inO2i(xu); N_v=2 ↔ inO2i(v)∧inO2i(xv).
(C4) |Row(source)∩(𝒯∩O₂°)| ≤ 2 is subsumed (I_u has only 2 members).

## 4. Context block 𝔓 and leaf deltas (unit/short clauses)

𝔓 [(P1)–(P3)]: γ=a₂ (activates (DEL2)); (P2) = (BM6); (P3) is definitional
(u IS source; already reflected in all C-tags above).

| Leaf | Delta clauses |
|---|---|
| A2 | b(u,zd) [(A2.a)] |
| A3 | b(u,v); inO2i(xu) [N_u=2, (A3.b)]; inO2i(v) [(A3.c)] |
| A6 | b(u,xv) [(A6.c): β(source)=x_v]; inO2i(xu) [(A6.c): {u,xu}⊆O₂°]; inO2i(xv) [(A6.d)]; nO2 ≥ 4 [(A6.e): |O₂|≥6]; s6-arms re-asserted [(A6.g), already global] |
| A7 | b(u,xv) [(A7.a,b): β(source)∈I_v∖{v} = {xv}]; ¬inO2i(xu) [(A7.c)]; inO2i(v); inO2i(xv) [(A7.d)] |
| A8 | b(u,xv) [(A8.a,b)]; ¬inO2i(xu) [(A8.c)]; ¬inO2i(v) ∨ ¬inO2i(xv) [(A8.d)] |
| A1 | separate run: drop (DEL2); no 𝔓 units; γ is a fresh label with eq atoms to a0, a1, qh, wh, f1, f2 (γ∈A∖𝒯 (G2) bakes distinctness from the five 𝒯 labels and from oth (C6); γ≠a₂ (A1.a); coincidence with Cl(a₁,r) members or other Moser vertices is not excluded); MC [(A1.b)]: per s∈Δ (del(s)) a full ambient class W_s at γ — encode as row-like atoms w_zd, w_u, w_xu, w_v, w_xv over the 13 labels with: del(s) → w_s(s) [s∈W_s]; pairwise disjoint: del(s)∧del(t) → ¬(w_s(p)∧w_t(p)); at-most-4 per w_s over the distinct T set and over {qh,wh,f1,f2} [|W_s|=4]; γ∉W_s [t_s>0] — skip via label absence. |

Note A6's (A6.c) literal set equalities I_u={u,xu}, I_v={v,xv} are already
the universe's definition — no new clause.

## 5. Runs and expected artifacts

Directory: `census/frontier-packages/a_core/`. Implementation reuses
`census/card_head/sat_encoding.py` (`CNF`, `at_most_sinz`, `solve_cadical`).

1. `base`: 𝔅 clauses only (§1–§2 families minus (DEL2)).
2. `base+P`: add 𝔓 (this is the shared A2–A8 context) — THE package verdict.
3. `base+P+A<k>` for k ∈ {2,3,6,7,8}; `base+A1` for A1.

Record per run: SAT/UNSAT, #vars, #clauses, wall time, and for SAT runs the
decoded model (atom assignments by family); for UNSAT runs keep the DIMACS in
`out/` and a DRAT proof if the `solve_cadical` API supports proof capture (if
it does not, note that in the report — do NOT modify `census/card_head/`;
proofs become mandatory only at Lean-replay time, sessions 4+). All runs also
dumped as a single `manifest.json`.

## 6. Smoke gates (must pass before the verdict is believed)

- **G-SAT (witness)**: build the incidence assignment of the 15-point witness
  `scratch/full-local-euclidean-model-complete/` (read `check_model.py` and
  its REPORT for the realized classes) restricted to the layers it realizes:
  map its four 4-point classes onto row/cl1 atoms and its cap data onto
  interiors where the witness provides them; leave unrealized layers free.
  Assert as assumptions on top of `base`; expect SAT. Failure ⇒ encoding
  over-constraint bug; report the failing core.
  If the witness's structure cannot be faithfully mapped onto this package's
  named labels (it was built for a different package), downgrade G-SAT to:
  hand-build a total assignment satisfying every §2 family by construction
  (document it in the report) and check SAT with it as assumptions. State
  clearly which variant ran.
- **G-EXCL (delta exclusivity)**: for every pair among {A2,A3,A6,A7,A8},
  `base+P+delta_i+delta_j` must be UNSAT (they disagree on b(u,·) or on the
  inO2i(xu)/inO2i(v)/inO2i(xv) pattern). All 10 pairs.
- **G-BASE**: `base` alone is expected SAT. If it is UNSAT, STOP: do not
  report a package verdict; audit the clause ledger family-by-family against
  this spec (most likely an implementation bug), and only escalate to me
  with the DRAT core if the audit finds no bug.

## 7. Omitted hypotheses (CEGAR backlog — sound to omit)

Still omitted after iteration 3 (§10): (S1) ingress packet beyond (N8)/(FB)
(the CD(z*;·,·) packet's own witness sets are unlabeled); F-chain labels
q̄,w̄ as first-class points beyond the (FB) selector; (E1) minimality; (E2)
no-(m,4,4); (E6) beyond the (BM4) pattern (at this layer E6 only re-derives
E5-shaped content — no independent atoms exist for K4(A∖{x};a₁));
S5(b)'s inner 4-set structure (moot — s5b refuted). C10 is no longer
omitted: its exact full-distance-class projection is promoted in §11.
Discharged with NO content at this layer: (G6) — under 𝔓 (γ=a₂)
its first arm is automatic (any two Δ-members are coradial about a₂ at ρ);
under A1, (A1.b) grants the MC arm outright.

## 8. Change control

This spec is the auditable soundness ledger (plan §2.1). Implementation must
not add clause families beyond it; if a needed constraint is missing, the
implementer reports the gap rather than improvising. Deviations = spec edit
first (by the orchestrating session), then code.

## 9. CEGAR iteration 2 (v1.2, 2026-07-28) — refinement families

Promoted from the §7 backlog: (E8) bisector localization, (E5) radius
uniqueness at a₁, (G4)/(G5) deletion-cardinality content, F-chain/S1
counting content, B-set radii. Every family below carries its implying
hypothesis tag; the soundness discipline of the header applies unchanged.
K₄ semantics used throughout (source doc §1): K₄(X;p) ⟺ ∃t>0 with
≥4 points of X at distance t from p.

**(E8a) rows × bisector [E8 + row coradiality].** Row(x) is coradial about
β(x) at positive radius. If q̂,ŵ ∈ Row(x) then β(x) is equidistant from
q̂,ŵ; by (E8) either β(x)=a₁ or β(x)∈O₁°. For x ∈ {u,v} and every label
y ≠ a1: row_x(qh) ∧ row_x(wh) ∧ b(x,y) → inO1i(y) ∨ eq(y,a1), the eq(y,a1)
escape only where that atom exists (y ∈ {zd,xu,xv,v}); no clause for y=a1
or y=OUT (sound omissions — E8 says nothing when the center IS a₁, and OUT
centers are unlabeled). Note y=a0 instances propagate to False via
inO1i(a0)=F (CAP2): a Moser center ≠ a₁ cannot lie in O₁°.

**(E8b) CD B₂ sets [E8 + (J5)/(J6) + CAP2].** B₂ is coradial about a₂;
a₂ ≠ a₁ (Moser) and a₂ ∉ O₁° (interiors exclude Moser vertices), so q̂,ŵ
cannot both lie in a B₂: ¬bs2(qh) ∨ ¬bs2(wh); ¬bt2(qh) ∨ ¬bt2(wh).

**(E8c) CD B₁ sets [E8 + (J5)/(J6)].** B₁ of (J5) is coradial about β(u),
of (J6) about β(v). Same schema as (E8a) with bs1/bt1 as the trigger:
bs1(qh) ∧ bs1(wh) ∧ b(u,y) → inO1i(y) ∨ eq(y,a1) (same y-range discipline);
bt1(qh) ∧ bt1(wh) ∧ b(v,y) → likewise.

**(E8d) A1 MC classes [E8 + (A1.b); needs the v1.2 gamma cap atoms].**
W_s is coradial about γ: del(s) ∧ w_s(qh) ∧ w_s(wh) → inO1i_g ∨ eq(gamma,a1).

**(E5a/E5b) A1 radius uniqueness [E5 + (E4) + (A1.b)].** Under eq(gamma,a1)
each W_s = Cl(γ,d(γ,s)) is a full ambient 4-class about a₁, so (E5) forces
d(γ,s)=r and W_s = Cl(a₁,r) = {q̂,ŵ,f1,f2} exactly. Per s ∈ {zd,u,xu,v,xv}:
- (E5a) eq(gamma,a1) ∧ del(s) ∧ w_s(p) → cl1(p), every label p;
- (E5b) eq(gamma,a1) ∧ del(s) → w_s(qh) ∧ w_s(wh) ∧ w_s(f1) ∧ w_s(f2).
(Derived for free by propagation: del(s)→w_s(s) + (E5a) gives cl1(s), so
eq(gamma,a1) → ¬del(u) (cl1(u)=F); two deleted sources make their W-sets
share qh, violating MC disjointness — so |Δ|=1 under eq(gamma,a1).)

**(DEL3) 𝔓-only deletion cap [(G3)+(G4)+(G5)+(B9)+(P1)].** For s∈Δ the
(G5) witness class W (≥4 points of A∖(Δ∖{s}) coradial about γ=a₂) must
contain s — otherwise W ⊆ A∖Δ contradicts (G4). Hence its radius is
d(a₂,s)=ρ and W ⊆ 𝒯∖(Δ∖{s}), so 5−(|Δ|−1) ≥ 4, i.e. |Δ| ≤ 2: at-most-2
over the five del atoms. With (DEL2): |Δ|=2 exactly in every 𝔓 run.
Tag 𝔓-only (the argument needs γ=a₂; DROP in the A1 run like (DEL2)).

**(N8) F-chain count [F + (B9) + (B3)].** The F chain fixes two exact
ambient 4-classes at a₂ (through q̄,w̄) with disjoint supports; their sizes
(4,4) differ from |𝒯|=5, so their radii differ from ρ and from each other —
three pairwise-disjoint classes about a₂ of sizes 5+4+4, all at positive
radii (a 4-point class cannot have radius 0), so a₂ is in none: n ≥ 14.

**(FB) frontier-pair selector [F + (E4)].** q̄,w̄ ∈ {x∈A : d(x,a₁)=r}∖Σ =
Cl(a₁,r)∖Σ, q̄≠w̄, and Cl(a₁,r) = {qh,wh,f1,f2} (E4 universe): atoms
fbar_p, p ∈ {qh,wh,f1,f2}, exactly-2 true (at-least-2 + Sinz at-most-2).
Per selected p: fbar_p → ¬inSig(p) [q̄ ∉ Σ ⊇ Σ°]; fbar_p → ¬inT(p) [q̄'s
a₂-class has exactly 4 points ≠ 5 = |𝒯|, so d(a₂,q̄) ≠ ρ]; for p ∈ {f1,f2}
only (the atoms exist): fbar_p → ¬eq(p,a2) [d(a₂,q̄) > 0]. No fbar↔a0
clause: whether v_σ ∈ Σ (closed) is not established — do not encode it.

**(CD4) center exclusion [CD definition: B_i ⊆ A∖{z,c_i}].**
b(u,y) → ¬bs1(y) and b(v,y) → ¬bt1(y) for y in the CD domain
{zd,u,xu,v,xv,qh,wh,f1,f2}; for the a₂-centered sets: ¬bs2(p) ∨ ¬eq(p,a2)
and ¬bt2(p) ∨ ¬eq(p,a2) for p ∈ {f1,f2} (the only domain labels with an
eq atom to a2).

**(CD5) B-set radius selectors [CD definition + row/𝒯 exactness].** Fresh
atoms rbs1, rbs2, rbt1, rbt2 ("the B-set's radius equals the comparison
class's radius"). Two coradial sets about the same center either share
their radius or are disjoint; when the radii agree, a 4-point coradial set
inside a 4-point full class IS that class, and inside 𝒯∖{z_d} (B₂ case:
|B₂|=4, z_d ∉ B₂, |𝒯∖{z_d}|=4) is exactly {u,xu,v,xv}. Over the CD domain:
- rbs1 → (bs1(p) ↔ row_u(p)); ¬rbs1 → ¬(bs1(p) ∧ row_u(p)).
- rbt1 → (bt1(p) ↔ row_v(p)); ¬rbt1 → ¬(bt1(p) ∧ row_v(p)).
- rbs2 → (bs2(p) → inT(p)) and rbs2 → bs2(u) ∧ bs2(xu) ∧ bs2(v) ∧ bs2(xv);
  ¬rbs2 → (bs2(p) → ¬inT(p)). Likewise rbt2 for bt2.
(T1 exactness then converts rbs2 ∧ bs2(qh) into an eq-disjunction
automatically; no bespoke clause.)

**(R1') row_u at-most-4 over a second distinct set [row exactness].**
{u,qh,wh,f1,f2} is pairwise baked distinct (u vs all four: (C3)+(P3) and
O₁°/O₂° separation; the four class members pairwise: (E4)+(E7)) — add
at-most-4 of row_u over it. No analogous valid 5-set exists for row_v
(v/oth vs the class members carry eq atoms) — none added.

**(A1 ext v1.2) gamma cap atoms.** New atoms inSig_g, inO1i_g, inO2i_g,
moser_g with: moser_g ↔ eq(gamma,a0) ∨ eq(gamma,a1) [γ's only possible
Moser coincidences]; ¬moser_g → exactly-one of the three cap atoms (CAP1);
moser_g → none of them (CAP2); congruence eq(gamma,t) → (Φ_g ↔ Φ(t)) for
t ∈ {qh,wh,f1,f2} and each cap family Φ. No inT_g atom: γ ∉ 𝒯 is (G2),
definitional. γ is NOT linked into the integer layer (it may coincide with
a labeled point; counting it would double-count — sound omission).

### 9.1 Iteration-2 gates and probes

- G-BASE, G-EXCL, G-SAT rerun as in §6. The hand-built G-SAT assignment
  must be updated for (N8) (its derived n was 13; bump an unlabeled-point
  interior count so n=14) and extended to assign the new atoms (fbar pair
  choice, rb* selectors, gamma caps) consistently; document the choices.
- P-DEL3: base+P + del(zd) ∧ del(u) ∧ del(xu) → UNSAT (DRAT).
- P-E8: base + row_u(qh) ∧ row_u(wh) ∧ b(u,a0) → UNSAT (DRAT).
- P-FB: base + eq(f1,zd) ∧ ¬fbar_qh ∧ ¬fbar_wh → UNSAT (DRAT)
  [forces {q̄,w̄}={f1,f2}; eq(f1,zd) → inT(f1) by (EQ3), fbar_f1 → ¬inT(f1)].
- P-CD5: base + rbs2 ∧ bs2(qh) ∧ ¬eq(qh,zd) ∧ ¬eq(qh,xu) ∧ ¬eq(qh,v) ∧
  ¬eq(qh,xv) → UNSAT (DRAT) [bs2(qh) → inT(qh) → T1 eq-disjunction, all
  denied].
- Each probe should also be checked SAT-refutable pre-change where cheap
  (i.e. note in RESULTS whether it was SAT at v1.1) — not mandatory.
- Verdict reruns: all 8 runs of §5 with the new families (DEL3 in the 𝔓
  runs only; E5/E8d/gamma-caps in base+A1 only; everything else in base).
  Record SAT/UNSAT + counts as before; decoded-model diffs for SAT runs.

## 10. CEGAR iteration 3 (v1.3, 2026-07-28) — source-context repair

The v1.2 base omitted the explicit source hypothesis `(C6)`
`other ∈ 𝒯`. Add the base unit `inT(oth)`. With (T1) exactness this
forces

`eq(oth,zd) ∨ eq(oth,v) ∨ eq(oth,xv)`.

This is a source-mandated repair, not a learned or symmetry-breaking
clause. Labels may coincide, so no particular disjunct is asserted.

### 10.1 Iteration-3 gates

- **G-C6:** `base ∧ ¬inT(oth)` must be UNSAT with a verified DRAT proof.
- Rerun G-BASE, G-EXCL, the four v1.2 probes, and every §5 verdict.
- Revise G-SAT away from all-equalities-false generic position. A valid
  auditable choice is `eq(oth,zd)=T`, with blocker targets chosen
  consistently under source/target congruence and (BM2); the positive
  gate must remain SAT.

## 11. C10 full-distance-class projection (v1.4, 2026-07-29)

The physical context identifies `u` with `source` by (P3). For a
`CriticalShellSystem`, the kernel-checked theorem

`Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`

states that, at a source blocker, a four-point equidistant class survives
deletion of `w` exactly when `w` is absent from the selected exact critical
four-shell support. Applying it to the `qh` and `wh` alternatives in (C10)
projects those alternatives respectively to

`¬row_u(qh)` and `¬row_u(wh)`.

Thus the whole C10 disjunction projects exactly—not merely as a necessary
weakening—to the single clause

`¬row_u(qh) ∨ ¬row_u(wh)`.

Tag this clause **physical/P3-only**. It is present in `base+P` and every
`base+P+A<k>` leaf, but absent from `base` and `base+A1`, where `u` is not
identified with the source. The projection allocates no new atom.

### 11.1 C10 gate

- The pre-C10 physical cube
  `row_u(qh) ∧ row_u(wh)` must be SAT, showing the new result is not
  inherited from an older clause family.
- With C10 added, that same cube must be UNSAT with a verified DRAT proof.
- Each individual omission branch remains admitted:
  `¬row_u(qh) ∧ row_u(wh)` is SAT and
  `row_u(qh) ∧ ¬row_u(wh)` is SAT.
