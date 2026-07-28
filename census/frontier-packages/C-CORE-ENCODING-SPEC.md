# C-core Layer-1 incidence encoding — specification (2026-07-28, v1.0)

Session-2 artifact of `docs/computational-closure-plan-2026-07-28.md` (§5 row
2, §8). Source of truth for the hypotheses:
`docs/solve-prompts/2026-07-27-physical-apex-boundary.md` §1–§2 (tags
(C0)–(C10); leaves C1 `..._physicalApex_sourceNeU` (:5430) and C2
`..._nonphysicalCollision` (:5602)). This spec is a DELTA against
`A-CORE-ENCODING-SPEC.md` v1.2 (the A spec): every A family carries over
unchanged unless amended here. The soundness discipline of the A spec header
is binding verbatim. Implementation: separate package
`census/frontier-packages/c_core/` amortizing `a_core/encoding.py`'s
structure (copy-and-adapt is fine; do NOT import a_core or modify it).

## 1. Tag map (A → C)

| A tag | C tag | Note |
|---|---|---|
| packet S caps/apices | C0 | identical (SurplusCapPacket) |
| H, H⋆, β, Row | C1.1, H′, c′, Σ′ | identical incl. b(x,a1)↔cl1(x) (H′ defining facts, §2.4 end) |
| F chain | C2.1–C2.6 | second-apex split (C2.6) is a DISJUNCTION whose left arm holds via (C2.5) — the exact-4 classes at a₂ are NOT guaranteed |
| (E4)/(E5)/(E7)/(E8) | C3.4/C3.5/C3.7/C3.8 | q̂,ŵ → q_I,w_I (labels qh,wh); Cl(a₁,r) → Γ₁=Γ(a₁,ρ₀) |
| (E3) n>9 | C3.3 | C has NO (B1) n≥12 — integer floor drops to n≥10 |
| (S1)–(S6) | C4.1–C4.6 | identical structure |
| (B3)–(B9), 𝒯 | C5.1–C5.6 | Γ₂=Γ(a₂,ρ); (C5.3) |Γ₂|=5 exact |
| (C1)–(C13) | C6.1–C6.12 | source is NOT u (see §2); (C6.6) other∈Γ₂ AND ∈Ĉ₂° |
| (J1)–(J6) | C7.1–C7.6 | identical CD packets (z*=zd label) |
| (G1)–(G6) | C8.1–C8.6 | identical; D₀=Δ, P=γ |
| 𝔓 (P1–P3) | leaf C1 = C9.1–C9.4 | P=a₂ but u ≠ source (C9.3) — INVERTS A's (P3) |
| A1 leaf | leaf C2 = C10.1–C10.2 | P≠a₂ + explicit COLLISION arm (no MC data given) |

## 2. The source vertex (the load-bearing difference from A)

(C6.10) source∈Σ′(u), (C6.1) source∈Γ₂, so source ∈ Σ′(u)∩Γ₂ = I_u;
(C8.1) |I_u|=2 with u∈I_u (x∈Σ′(x)), so I_u={u,xu} and **source ∈ {u,xu}**.
No 14th label: a selector atom `srcU` ("source=u"; ¬srcU ⟺ source=xu).
Leaf C1's (C9.3) is the unit ¬srcU (source=xu, forced).

Every source-tagged hypothesis becomes a conditional pair
(srcU → Φ[u]) ∧ (¬srcU → Φ[xu]):
- (C6.2) source∈Ĉ₂°: srcU→inO2i(u); ¬srcU→inO2i(xu). NOTE: unlike A,
  inO2i(u) is NOT a unit in C — u is only known in Γ₂.
- (C6.3) c′(source)≠a₁: srcU→¬cl1(u); ¬srcU→¬cl1(xu) [via BM4 this also
  kills b(·,a1); congruence then blocks eq(u,f1)-style coincidences on the
  active arm automatically].
- (C6.8) c′(source)≠c′(other): srcU→(¬b(u,y)∨¬b(oth,y)) per y;
  ¬srcU→(¬b(xu,y)∨¬b(oth,y)) per y.
- (C6.9): OMITTED (K4-at-c′(source) content, same no-sound-projection
  reasoning as A's (C10) — record in backlog).
- (C6.12) u=source ∨ u∉Σ′(source): ¬srcU→¬row_src(u).

**Row of source** `row_src(p)` (Σ′(source)) — a third row family over the
13 labels:
- srcU → (row_src(p) ↔ row_u(p)) for every p.
- srcU→row_src(u); ¬srcU→row_src(xu) [x∈Σ′(x)].
- Units (unconditional, from source-tagged hypotheses): row_src(oth)=F
  (C6.7); row_src(v)=F (C6.11).
- (R1-src) at-most-4 over {zd,u,xu,v,xv} [|Σ′|=4].
- (CS4) [(C6.4)]: product atoms m_t := row_src(t)∧inO2i(t) for the five
  pairwise-distinct T-labels t; at-most-2 of the five m_t. (Sound: all five
  T-labels are in Γ₂, so each m_t certifies membership in
  Σ′(source)∩(Γ₂∩Ĉ₂°), which (C6.4) bounds by 2. Labels coincident with a
  T-label are covered by congruence.)
- (E8a-src) [(C3.8)]: row_src(qh)∧row_src(wh)∧srcU∧b(u,y) → inO1i(y)
  [∨ eq(y,a1) where the atom exists]; same with ¬srcU∧b(xu,y). Same
  y-range discipline as A's (E8a) (skip y=a1, no OUT clause).

## 3. Universe amendments

Same 13 labels (zd:=z*, oth:=other, qh:=q_I, wh:=w_I; f1,f2 = the other two
Γ₁ members). Baked-distinctness changes vs A (all others carry over):
- u vs {a0,a1}: NOT baked (A used u∈O₂°, unconditional there) — ADD eq
  atoms eq(u,a0), eq(u,a1).
- u vs {qh,wh,f1,f2}: NOT baked (same reason) — ADD eq atoms.
- oth vs u: NOT baked ((C6.5) is other≠source, not other≠u) — ADD eq atom
  eq(oth,u); conditional exclusion srcU→¬eq(oth,u) [(C6.5)].
- oth vs xu: STILL baked — (C6.7) oth∉Σ′(source) while xu∈Σ′(source) on
  BOTH selector arms (srcU: xu∈Σ′(u); ¬srcU: xu∈Σ′(xu)).
- Everything else as in A (incl. qh/wh/f1/f2 vs zd,xu,xv,v eq atoms,
  {a0,a1}×{zd,xu,xv}, v×{a0,a1}, oth×{zd,v,xv}, {f1,f2}×{a0,a2}).
- (EQ1)–(EQ4) schemas apply to the enlarged eq-atom set unchanged.

Unit changes vs A:
- inO2i(u): NOT a unit (conditional, §2). inO2i(oth)=T (C6.6) ✓ stays.
- inO1i(qh)=inO1i(wh)=T (C3.7) ✓ stays. cl1 units ✓ stay ((C3.4)+(C3.7)).
- cl1(u)=F becomes CONDITIONAL (srcU→¬cl1(u), §2) — do not assert the
  unconditional unit.
- **inT(oth)=T** [(C6.6) other∈Γ₂] — T1 exactness then forces
  eq(oth,zd)∨eq(oth,u)∨eq(oth,v)∨eq(oth,xv) (xu excluded: baked). (A-core
  NOTE: A's (C6) also gives inT(oth)=T but A's encoder never asserts it —
  logged as A iteration-3 backlog, do NOT fix a_core in this work order.)
- row_u/row_v units: as in A EXCEPT row_u(oth)=F now follows only from
  (C6.7) via srcU... it does NOT — (C6.7) is about Σ′(source). Under ¬srcU
  there is no hypothesis putting oth outside Σ′(u): leave row_u(oth)
  UNCONSTRAINED; row_src(oth)=F is the sound unit. row_u(zd)=row_v(zd)=F
  (C7.3) ✓ stay; row_u(v)=row_v(u)=F (C5.6) ✓ stay.

## 4. Families carried over / dropped

Carried unchanged (same tags, C-justifications): CAP1/CAP2, CL1, T1, R1,
R3, BM1–BM5, BM7 (via §2 conditionals), BM8 [(C7.4)], BM9 [(C7.5)/(C7.6)],
SV1 [(C4.2)], DEL1 [(C8.3)], CD1–CD3, CD4, CD5 (rbs1 aligns bs1 with
row_u — (C7.5)'s B₁ is coradial about c′(u), NOT about c′(source)),
E8a (for row_u/row_v), E8b, E8c, S5 arms with s5b refuted [(C4.5)(ii) vs
(C5.3) |Γ₂|=5], N1, N3–N7 (N-tags per C4/C0), EQ1–EQ4.

NOT carried — (BM6) [ruling on implementer flag, 2026-07-28]: A's
β(u)∈𝒯 clause encodes (P2), a 𝔓-packet fact of A's source doc; the C
doc has no analogue (its blocker facts are `source_other_blockers_ne` →
BM7-via-§2 and (C7.4) → BM8). Carrying it would be unsound, not merely
aggressive. Deliberate omission, confirmed.

Amended:
- N2 → n ≥ 10 [(C3.3) 9<|A|; C has no n≥12].
- (N8) n≥14: DROPPED — its A-derivation needs the F-chain exact-4 classes,
  which (C2.6) does not guarantee (left disjunct discharged by (C2.5)).
- (FB): keep the exactly-2 selector over {qh,wh,f1,f2} and fbar_p→¬inSig(p)
  [(C2.1): q̄,w̄ ∈ Γ₁∖sC, Γ₁ = the four labels by (C3.4)]. DROP
  fbar_p→¬inT(p) and fbar_p→¬eq(p,a2) (both needed the exact-4 a₂-classes).
- (R1′): DROPPED for row_u ({u,qh,wh,f1,f2} is no longer pairwise baked
  distinct — u carries eq atoms to all four in C). No replacement set
  exists; note it.
- (DEL2): leaf-C1-only [(C9.1) P=a₂ + (C4.2), same singleton argument].
- (DEL3): leaf-C1-only [(C8.4)+(C8.5)+(C5.3)+(C9.1), A's derivation
  verbatim: the restoration witness must contain its re-added point, hence
  lives in Γ₂ at radius ρ; 5−(|D₀|−1) ≥ 4 gives |D₀|≤2].

## 5. Leaf deltas

**Leaf C1** (P=a₂): units ¬srcU [(C9.3), so source=xu]; (DEL2)+(DEL3);
placement [(C9.4), subsumes (C9.2)]: b(xu,zd) ∨ b(xu,u) ∨ b(xu,v) ∨
b(xu,xv). (b(xu,xu) is excluded by BM2, matching c′(source)≠source.)

**Leaf C2** (P≠a₂): the A1-run mechanics carry over — P is a fresh label
built last, mutating the CNF past the frozen base (same call-ordering
contract as A's gamma):
- P∈A∖Γ₂ (C8.2) bakes distinctness from the five T-labels and from oth
  (oth∈Γ₂ by (C6.6)); P≠a₂ (C10.1); eq atoms P×{a0,a1,qh,wh,f1,f2} with
  the (EQ1)-per-baked-group and (EQ4)-triangle schemas as in A's gamma.
- Gamma-style cap atoms inSig_P/inO1i_P/inO2i_P/moser_P (A spec §9,
  A1 ext v1.2 pattern, verbatim).
- NO w_s families: (C10.2) selects the collision arm; the MC core is NOT
  given data in this leaf (sound omission of the unexercised right arm).
- **(COL) collision family** [(C10.2)]: atoms col(s,t) over the 10
  unordered T-label pairs; ⋁ col(s,t) (at-least-one); col(s,t) →
  del(s) ∧ del(t). No distinctness clause needed (T-labels are baked
  pairwise distinct).
- **(COL-E8)** [(C3.8)]: a collision pair coincident with {q_I,w_I} puts P
  on their bisector: col(s,t) ∧ eq(s,qh) ∧ eq(t,wh) → inO1i_P ∨ eq(P,a1),
  instantiated for every (s,t, orientation) where both eq atoms exist.
- **(E5C) restoration radius capture** [(C8.4)+(C8.5)+(C3.5)]: for each
  T-label s: eq(P,a1) ∧ del(s) → cl1(s). Derivation: the (C8.5) witness
  class for s must contain s (else it survives A∖D₀ against (C8.4)), so
  its radius is d(P,s) and |Γ(P,d(P,s))| ≥ 4; with P=a₁, (C3.5) forces
  d(P,s)=ρ₀, i.e. s ∈ Γ₁. (This is A's (E5a) rebuilt WITHOUT the MC data —
  the restoration witness replaces W_s.)
- DEL1 only (no DEL2/DEL3 — both need P=a₂).

## 6. Runs

1. `base`: (C0)–(C8) families (§3–§4, minus DEL2/DEL3).
2. `base+C1`: base + leaf C1 delta — a package verdict run.
3. `base+C2`: base + leaf C2 delta (built last) — a package verdict run.

There is no shared-𝔓 run; the two leaves are the two verdicts. Artifacts,
manifest, decoded models as in the A spec §5.

## 7. Smoke gates

- G-BASE: `base` SAT expected. Same STOP discipline as A on UNSAT.
- G-SAT: hand-built total assignment (A spec §6 downgrade variant is the
  DEFAULT here — the 15-point witness maps even less directly onto C);
  document every pick, n=10 floor is fine.
- G-EXCL analog: `base+C1's ¬srcU` vs `srcU` unit — base + srcU + (C9.4
  placement clause) must be checkable; minimum: base+C1 delta + srcU must
  be UNSAT (C1 forces ¬srcU). Also base+C1 + del-triple UNSAT (DEL3 gate,
  = A's P-DEL3 pattern).
- P-SRC: base + ¬srcU + row_src(u) → UNSAT [(C6.12)].
- P-COL: base+C2 + ¬col(s,t) for all 10 pairs → UNSAT [(COL)
  at-least-one].
- P-E5C: base+C2 + eq(P,a1) + del(u) + srcU → UNSAT [E5C gives cl1(u),
  §2 gives srcU→¬cl1(u)].
- P-E8-src: base + row_src(qh) ∧ row_src(wh) ∧ srcU ∧ b(u,a0) → UNSAT.
All UNSAT probes with verified DRAT.

## 8. Change control

Identical to the A spec §8: this spec is the clause ledger; gaps are
reported, not improvised. Deviations = spec edit first (orchestrator),
then code.

## 9. Backlog (sound omissions)

(C6.9) source K4-survival disjunction (no projection); (C2.4)/(C2.6)
frontier splits beyond (FB) (the retained disjuncts are K4 facts about
unlabeled witnesses); (C3.1) minimality; (C3.2) noM44; (C8.6) right arm
in leaf C2 (MC not given); A-core iteration-3 note: inT(oth)=T missing
in a_core (same fact IS asserted here).
