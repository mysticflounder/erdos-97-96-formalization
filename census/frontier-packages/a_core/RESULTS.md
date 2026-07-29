# A-core Layer-1 incidence encoder — results

**v1.2 update (CEGAR iteration 2, spec section 9): see new §6 below** for
the full write-up. Summary: all thirteen new clause families ((E8a)-(E8d),
(E5a)/(E5b), (DEL3), (N8), (FB), (CD4), (CD5), (R1'), and the A1-extension
gamma cap atoms) are implemented; all 8 verdict runs remain SAT; all four
new §9.1 probes (P-DEL3, P-E8, P-FB, P-CD5) are UNSAT with verified DRAT;
G-BASE/G-EXCL/G-SAT still pass (G-SAT's hand-built witness updated for
n=14 and the new atoms). No spec gap was found in this iteration — every
§9/§9.1 clause maps directly onto the existing atom set with no missing or
unimplementable constraint.

**v1.1 update**: the coordinator amended the spec after reviewing this
report — the dangling `(RB2)` tag is now an explicit "row_u(a1)
unconstrained" note (matches what was already implemented, no code change),
and a new **(EQ4) transitivity** schema was added, adopting this report's
finding (§4.4 below): for every label triple whose three pairs all carry eq
atoms, `eq(p,q) ∧ eq(q,r) → eq(p,r)` in all three rotations, uniform over
every such triangle including the `a0` ones (harmless, already emergently
closed) and including gamma's triangles in `base+A1`. Implemented in
`encoding.py` (`_add_eq4_triangle`, called from `_build_eq_consistency` for
the 13-label triangles and from `build_a1_extension` for gamma's four
`{gamma,a0,X}` triangles, X∈{qh,wh,f1,f2} — those are the only gamma-target
pairs that themselves carry a real eq atom). All numbers below are from the
**post-(EQ4) build**; §5 records the before/after delta and the regression
check.

Implements `census/frontier-packages/A-CORE-ENCODING-SPEC.md` (v1.2, section
9 / CEGAR iteration 2 — see §6). Code:
`census/frontier-packages/a_core/{encoding.py,run.py,smoke.py}`. All commands
run from the repo root via `uv run python census/frontier-packages/a_core/...`
(the `a_core` directory has no hyphen, but its parent `frontier-packages`
does, so it cannot be a dotted `-m` package path; `encoding.py` inserts the
repo root onto `sys.path` itself so `census.card_head.sat_encoding` imports
regardless of invocation style).

**Scope label (binding on every verdict below):** an encoder SAT verdict is
an incidence-layer statement only — "the written CNF, restricted to the
clause families this spec approved, has a model." Per the spec's own
framing: UNSAT would mean the package is contradictory at the incidence
layer; **SAT means nothing negative.** None of the SAT verdicts below are a
geometric closure result.

## 0. Encoder size

`base` (section 1-2 minus (DEL2)): **835 variables, 18858 clauses** (was
18792 before (EQ4); +66 = 22 triangles × 3 rotations, no new variables —
(EQ4) is pure clauses over existing eq atoms). `base+A1` adds 177 more
variables (gamma's 6 eq atoms + 5×13 `w_s` atoms + Sinz aux) for 1012
variables, 19204 clauses (was 19126; +12 = gamma's 4 triangles × 3
rotations, on top of the +66 already in the base prefix it inherits). All
solves complete in 0.008-0.05s — nowhere near the 60s timeout budget.

## 1. Smoke gates (spec §6) — run BEFORE the verdict runs, per the
sequencing rule

Command: `uv run python census/frontier-packages/a_core/smoke.py`

| Gate | Verdict | Expected | Pass |
|---|---|---|---|
| G-BASE | SAT | SAT | yes |
| G-EXCL (10/10 pairs) | UNSAT | UNSAT | yes |
| G-SAT (downgrade variant) | SAT | SAT | yes |

`ALL_GATES_PASS = True`. G-BASE did **not** come back UNSAT, so the
"STOP and audit" branch of the sequencing rule was never triggered.

### G-BASE

`base` alone: SAT, 0.017-0.03s. No package context (𝔓/DEL2) is present in
this run.

### G-EXCL — all 10 pairs among {A2,A3,A6,A7,A8}, UNSAT with verified DRAT proofs

| Pair | Verdict | DRAT verified | Clash family |
|---|---|---|---|
| A2×A3 | UNSAT | yes | (BM1) β(u) functional: `b(u,zd)` vs `b(u,v)` |
| A2×A6 | UNSAT | yes | (BM1) β(u) functional: `b(u,zd)` vs `b(u,xv)` |
| A2×A7 | UNSAT | yes | (BM1) β(u) functional: `b(u,zd)` vs `b(u,xv)` |
| A2×A8 | UNSAT | yes | (BM1) β(u) functional: `b(u,zd)` vs `b(u,xv)` |
| A3×A6 | UNSAT | yes | (BM1) β(u) functional: `b(u,v)` vs `b(u,xv)` |
| A3×A7 | UNSAT | yes | (BM1) β(u) functional: `b(u,v)` vs `b(u,xv)` |
| A3×A8 | UNSAT | yes | (BM1) β(u) functional: `b(u,v)` vs `b(u,xv)` |
| A6×A7 | UNSAT | yes | `inO2i(xu)` unit clash: A6 asserts T, A7 asserts F |
| A6×A8 | UNSAT | yes | `inO2i(xu)` unit clash: A6 asserts T, A8 asserts F |
| A7×A8 | UNSAT | yes | `inO2i(v)`/`inO2i(xv)` pattern clash: A7 forces both T (A7.d); A8's (A8.d) clause forbids both T |

A2 and A3 each pin a *different* single β(u) target (`zd`, `v`), so they
clash directly with every other leaf via (BM1)'s exactly-one. A6, A7, A8 all
assert the *same* β(u)=xv target, so (BM1) does not separate them from each
other; those three pairs clash instead on the `inO2i(xu)`/`inO2i(v)`/`inO2i(xv)`
pattern each leaf pins.

### G-SAT

The nominated witness at `scratch/full-local-euclidean-model-complete/`
(read `check_model.py` and `REPORT.md`, both read-only) is a 15-point
construction on named points `O,e,f,a,u,c,d,b,v,j,k,l,i,g,h`, built to test
`CounterexampleData`/`CriticalShellSystem`/tri-apex-robustness, **not** the
rigid221-physical-apex-chain package this encoder implements: it has no
source/frontier-pair/`Cl(a1,r)`-exact-4 structure at all, and its own
REPORT.md concludes `no CriticalShellSystem exists` and
`SurplusCapPacket.hCirc fails` there — i.e. it fails hypotheses this package
assumes hold. No faithful label mapping exists. Per spec §6's documented
fallback, **G-SAT ran the downgrade variant**: a hand-built total assignment
(see `smoke.py::hand_built_assumptions`) fixing every semantically
load-bearing atom —

- generic position: all 35 eq atoms false;
- cap interiors for the six free non-Moser labels: `inO2i(zd,xu,v,xv)=T`,
  `inSig(f1,f2)=T`;
- integer layer `nSig=3, nO1=2, nO2=5` fed in as assumptions, with **`n`
  deliberately left for the solver to derive** from (N1) rather than
  asserted — it came back `n=13` (=3+2+5+3), confirming (N1)'s arithmetic is
  wired correctly;
- S6 arm s6c (consistent with the nSig/nO1/nO2 values above);
- every free `row_u`/`row_v` slot pinned false;
- all eight β(x) targets pinned (`u→xv, v→zd, zd→v, oth→zd, qh→a1, wh→a1,
  xu→OUT, xv→OUT`);
- Δ = {zd, u} (a 2-element deletion set).

Atoms already forced by base's own units (sv, s5a/s5b, CD1's `bs*(zd)`) or
genuinely immaterial (individual non-zd `bs1/bs2/bt1/bt2` entries) were left
for the solver to complete. Verdict: **SAT**, 76 assumption clauses, 0.01-0.02s.

### Required validation checks

- **(S5B)/(S5A) unit-propagates s5a**: verified directly by clause-level
  resolution (not a solver call) — resolving `(s5a ∨ s5b)` against `(¬s5b)`
  removes the falsified literal and leaves exactly the unit clause `(s5a)`.
  `unit_propagates_s5a: true`.
- **(DEL2) present/absent**: the 5 (DEL2) clauses are present (subset check)
  in `base+P` and in every `base+P+A<k>` leaf's clause set, and are absent
  (empty intersection) from `base+A1`'s clause set. Confirmed by direct
  clause-set membership check, not inference.

## 2. Verdict runs (spec §5)

Command: `uv run python census/frontier-packages/a_core/run.py`. Output:
`out/*.cnf`, `out/*.model.json`, `out/manifest.json`.

| Run | Verdict | Vars | Clauses | Wall |
|---|---|---|---|---|
| base | SAT | 835 | 18858 | 0.016s |
| base+P | **SAT** | 835 | 18863 | 0.016s |
| base+P+A2 | SAT | 835 | 18864 | 0.016s |
| base+P+A3 | SAT | 835 | 18866 | 0.016s |
| base+P+A6 | SAT | 835 | 18870 | 0.016s |
| base+P+A7 | SAT | 835 | 18867 | 0.016s |
| base+P+A8 | SAT | 835 | 18866 | 0.016s |
| base+A1 | SAT | 1012 | 19204 | 0.016s |

No verdict flipped (all 8 still SAT). Every run's clause count grew by
exactly the (EQ4) delta described in §0 above and nothing else.

**Package verdict (`base+P`): SAT.** Per the scope label above, this means
the package's Layer-1 incidence content (as approved by the spec) has no
contradiction — it is not a geometric closure statement in either direction.

### Per-run key decoded facts

Format: `inO2i(xu/v/xv)`, β(u) target, true eq atoms, S6 arm, integer layer
(nSig,nO1,nO2,n — always consistent with (N1): n = nSig+nO1+nO2+3), Δ.

- **base**: inO2i(xu,v,xv)=(T,T,T); β(u)=v; eq: none; S6=s6c;
  (3,2,4,12); Δ={u,v,xu,xv,zd} (all five — solver picked the maximal set,
  (DEL2) is absent here so nothing forces this, it's just what CaDiCaL found).
- **base+P**: identical to `base` on every one of these facts (adding
  (DEL2) — already satisfied by `base`'s own Δ={all 5} — did not move the
  witness cadical happened to find). Full grouped decode in §3 below.
- **base+P+A2**: inO2i(xu,v,xv)=(F,F,F); β(u)=**zd** (the leaf's own
  (A2.a) delta); eq: {a0=f1, a0=v, a2=f2, f1=v, qh=xu, wh=xv}; S6=s6c;
  (3,2,4,12); Δ={u,v,xu,xv,zd}.
- **base+P+A3**: inO2i(xu,v,xv)=(T,T,F); β(u)=**v** ((A3.b) target); eq:
  {a0=f1, a0=xv, a2=f2, f1=xv, oth=zd}; S6=s6c; (3,2,4,12);
  Δ={u,v,xu,xv,zd}.
- **base+P+A6**: inO2i(xu,v,xv)=(T,T,T); β(u)=**xv** ((A6.c) target); eq:
  {a0=f1, a0=zd, a2=f2, f1=zd, oth=v}; S6=s6c; (3,2,4,12); Δ={u,v,xu,xv,zd}.
  ((A6.e)'s extra `nO2>=4` is satisfied since nO2=4 already.)
- **base+P+A7**: inO2i(xu,v,xv)=(**F**,T,T); β(u)=**xv** ((A7.a/b)
  target); eq: {a0=f1, a0=xu, a2=f2, f1=xu, oth=v, qh=zd}; S6=s6c;
  (3,2,4,12); Δ={u,v,xu,xv,zd}.
- **base+P+A8**: inO2i(xu,v,xv)=(**F**,T,**F**); β(u)=**xv** ((A8.a/b)
  target); eq: {a0=f1, a0=xu, a2=f2, f1=xu, oth=v, qh=zd}; S6=s6c;
  (3,2,4,12); Δ={u,v,xu,xv,zd}. (Satisfies (A8.d) `¬inO2i(v) ∨ ¬inO2i(xv)`
  via `¬inO2i(xv)`.)
- **base+A1**: β(u)=v; γ's eq atoms: **{γ=qh}** — the only decoded fact
  that changed shape after (EQ4), see §5; S6=s6c; (3,2,4,12); Δ={zd}
  ((DEL2) is absent in this run, so a 1-element Δ is legal, unlike every
  other run).

**All other 7 runs' decoded models (`base`, `base+P`, `base+P+A{2,3,6,7,8}`)
are byte-identical to the pre-(EQ4) build** — same `inO2i`, β(u) target, S6
arm, integer layer, Δ, and (crucially) the same *sets* of true eq atoms.
This is expected: every eq-triangle those five leaf witnesses happened to
touch (all built around a shared `a0` hub, e.g. `{a0,v,f1}` all three true)
was already transitively consistent before (EQ4) existed, confirmed by the
direct probe sweep in §5. Only `base+A1`'s witness moved.

**Caveat on `row_u`/`row_v` values outside the shell group**: in every run
above, `row_u`/`row_v` for `{a0,a1,a2,qh,wh,f1,f2}` (and `oth`/`xu`/`xv`
where not already a unit) are not covered by any base clause — (R1)'s
at-most-4 bound and (R3)'s conditional collapse only reach the pairwise-
distinct shell set `{zd,u,xu,v,xv}`. Whatever CaDiCaL prints there is an
artifact of its search order, not a semantic fact; do not read anything into
it. The values reported above are exactly the ones the base+§4 clauses do
constrain.

## 3. `base+P` decoded model, grouped by atom family

- **Moser / cap interiors**: `moser(a0,a1,a2)=T`, rest F. `inO2i`: u, xu, v,
  xv, oth = T (Σ°=∅ among the labels, O1°={zd,qh,wh}, O2°={u,xu,v,xv,oth}).
  `zd` is the lone O1° member beyond the qh/wh units.
- **cl1 / inT**: `cl1`: qh,wh,f1,f2 = T, rest F (no eq atom made any other
  label coincide with the frontier set in this witness). `inT`: zd,u,xu,v,xv
  = T (units), rest F.
- **Blocker map β**: β(u)=v, β(v)=zd, β(zd)=a0, β(xu)=a0, β(xv)=a0,
  β(oth)=a0, β(qh)=a1, β(wh)=a1. (β(qh)=β(wh)=a1 is forced by (BM4) given
  cl1(qh)=cl1(wh)=T; the rest are free choices respecting (BM1)/(BM5)-(BM9).)
- **CD witness sets**: bs1=bs2=bt1=bt2={f1,f2,qh,wh} — the shell-group
  entries (`zd,u,xu,v,xv`) are all false in this witness, so (CD3)'s
  overlap-≤2 machinery is not exercised here (0 overlap).
- **S5/S6**: s5a=T, s5b=F (forced, see the unit-propagation check above).
  S6 arm = s6c.
- **Integer layer**: nSig=3, nO1=2, nO2=4, n=12 (=3+2+4+3, (N1) holds).
- **Deletion set Δ**: {u, v, xu, xv, zd} — all five (DEL2)'s at-least-two
  is trivially satisfied; nothing forces a minimal Δ, so cadical's default
  witness is the maximal one).
- **eq atoms**: none true (generic-position witness).
- **sv**: all 13 true (unit, (SV1)).

## 4. Spec concerns / ambiguities (quoted verbatim, resolution stated)

1. **Dangling `(RB2)` tag.** Spec §2 "Rows" bullet: *"Units row_u: T on
   u,xu [I_u={u,xu}: Remark+(G1)]; F on v (B6), zd (J3), oth (C8)+(P3), a1?
   no — see (RB2)."* `(RB2)` is never defined anywhere in the spec document.
   Resolution: `row_u(a1)` is left **unconstrained** (no unit added),
   matching the bullet's own literal F-list (`{v,zd,oth}`, which excludes
   a1) rather than guessing at the missing tag's content.

2. **`OUT` in the (BM7)/(BM8)/(BM9) "for each y" schemas.** Spec: *"(BM7)
   (C9): β(source)≠β(other): for each y: ¬b(u,y) ∨ ¬b(oth,y)"* (and
   likewise for (BM8), (BM9)) — "for each y" is not restricted to the 13
   labels, and `b`'s own range is defined as "y ∈ labels ∪ {OUT}". Read
   literally this would also forbid u and oth (or zd and u, zd and v) from
   *both* being unblocked (`b(x,OUT)`) simultaneously — a claim (C9)/(J4)/
   (J5)/(J6)'s prose (about which *point* blocks, not about the "no
   witness" sentinel) does not prove. Resolution: **y ranges over the 13
   labels only, excluding OUT**, for (BM7)/(BM8)/(BM9) — the more
   conservative/sound reading, consistent with (BM6)'s adjacent schema
   which explicitly enumerates a concrete label subset.

3. **(EQ1)'s "any set L of pairwise-baked-distinct labels."** The schema is
   stated generically without pinning L. Resolution: for each label `p` and
   each of the three baked-pairwise-distinct groups (Moser `{a0,a1,a2}`,
   shell `{zd,u,xu,v,xv}`, frontier `{qh,wh,f1,f2}`), use `L = p`'s
   eq-targets intersected with that group — the strongest valid
   instantiation, which subsumes any smaller choice of L.

4. **Missing eq-transitivity family — RESOLVED in spec v1.1, see §5.**
   (Original finding from the pre-v1.1 build, kept for the record:)
   Spec §1 lists exactly three "Consistency schemas over eq atoms": (EQ1)
   at-most-one, (EQ2) exclusion, (EQ3) congruence. No fourth schema asserts
   `eq(p,q) ∧ eq(q,r) → eq(p,r)`. Since `eq` is meant to represent point
   identity (reflexive/symmetric/transitive), this is a real omission.
   There are **22 label-triples** where all three pairwise `eq` atoms
   exist (18 involve `a0`, e.g. `{a0,zd,qh}`, `{a0,v,f1}`; 4 involve `oth`,
   `{v,oth,f1}`, `{v,oth,f2}`, `{xv,oth,f1}`, `{xv,oth,f2}`).
   I directly probed every triangle by forcing each of its three "exactly
   2-of-3 true" rotations as assumptions on top of `base` and solving:
   - The **18 `a0`-triangles are all UNSAT** under every 2-of-3 rotation —
     i.e. genuinely *not* reachable. This is an emergent consequence of
     (EQ3) congruence chained through `a0`'s hard units (in particular
     `inT`/`moser`'s units force enough rigidity that two eq-atoms sharing
     the `a0` hub already pin the third transitively), not of any explicit
     transitivity clause.
   - The **4 `oth`-triangles are all SAT** under every 2-of-3 rotation —
     i.e. genuinely reachable. `oth` carries no comparable hard-unit
     scaffolding, so nothing closes the loop. **This is a real,
     confirmed gap**: e.g. `eq(v,oth)=T, eq(oth,f1)=T, eq(v,f1)=F`
     satisfies every clause in `base` despite being an incoherent "same
     point" claim under an identity reading of `eq`.
   None of the 8 organically-found verdict-run witnesses in §2 happened to
   land on a 2-of-3 pattern (checked directly), so this gap does not taint
   any decoded model reported above — but the CNF as written does not
   universally forbid one. Per the spec's change-control clause
   ("implementer reports the gap rather than improvising"), **no (EQ4)
   transitivity clause was added**; this is reported rather than fixed.

5. **`base+P` = `base` + (DEL2) only.** Spec §4 lists 𝔓 as three
   hypotheses (P1)-(P3), but (P2) is stated to just *be* (BM6) (already an
   unconditional base §2 family) and (P3) is "definitional... already
   reflected in all C-tags above" (i.e. adds nothing). Cross-checked against
   §5's own run-1 definition (`base` = §1-2 minus (DEL2) only, no other
   exclusion) — the two are consistent only if 𝔓's *sole* net addition is
   (DEL2) (γ=a2 activating it). Implemented on that reading; flagged here
   since it is inferred from consistency between two spec passages rather
   than stated as a single explicit rule.

## 5. (EQ4) implementation and regression check (spec v1.1)

Implemented in `encoding.py`: a new `_add_eq4_triangle(e_ab, e_bc, e_ac)`
helper emits all three rotations of the transitivity implication for one
triangle's three edge variables. Called from `_build_eq_consistency` over
every 13-label triple `(p,q,r)` where all three pairwise eq atoms exist (22
triangles → 66 clauses), and from `build_a1_extension` over gamma's four
qualifying triangles `{gamma,a0,X}` for X∈{qh,wh,f1,f2} (12 more clauses;
gamma's other 11 target-pairs — `{a1}×{qh,wh,f1,f2}` and `{qh,wh,f1,f2}`
pairwise — are all baked pairwise distinct among the 13 labels, so they
never carry a real eq atom and don't form a qualifying triangle).

**Regression check** (the specific probe the coordinator asked to verify):
`eq(v,oth) ∧ eq(oth,f1) ∧ ¬eq(v,f1)` under `base` —

| | Before (EQ4) | After (EQ4) |
|---|---|---|
| Verdict | SAT (confirmed in the original report) | **UNSAT, DRAT-verified** |

Also swept **all 22×3 = 66** triangle/rotation combinations directly (not
just the one `oth` probe): every one is now UNSAT under `base`, including
the 18 `a0`-triangles that were already emergently closed before (EQ4) — so
the uniform schema is confirmed harmless there, exactly as the spec's v1.1
note predicts.

**Verdict/model-shape changes**: no run's SAT/UNSAT verdict flipped (§2).
Exactly one decoded model changed shape: `base+A1`'s witness moved from
γ coincident with two targets (`{a0,qh}`, spanning two different baked
groups — legal both before and after (EQ4), since `eq(a0,qh)` itself was
never asserted or forbidden) to γ coincident with one target (`{qh}`) only.
This is CaDiCaL landing on a different point in an unchanged-satisfiable
region, not a soundness effect: forcing γ=a0 and γ=qh together under (EQ4)
would have additionally required `eq(a0,qh)=T` (a real, un-baked-distinct
pair, per (A1.b)'s gamma_targets — no clause anywhere forbids this), so the
old two-target witness was very likely still reachable; the solver simply
found a smaller one first. All 7 other runs' decoded models (`base`,
`base+P`, `base+P+A{2,3,6,7,8}`) are byte-identical before/after — every eq
triangle those witnesses touch was already transitively consistent (all
built around a shared `a0` hub), matching the pre-v1.1 report's own
"0 genuine 2-of-3 violations across all 8 organically-found witnesses"
finding.

## 6. CEGAR iteration 2 (v1.2, spec section 9)

Implements every clause family in spec §9 (promoted from the §7 backlog:
(E8) bisector localization, (E5) radius uniqueness at a₁, (G4)/(G5)
deletion-cardinality content, F-chain/S1 counting content, B-set radii) and
the §9.1 gates/probes. Code: `encoding.py` (new methods `_build_e8a`,
`_build_e8b`, `_build_e8c`, `_build_cd4`, `_build_cd5`, `_build_r1_prime`,
`_build_fb`, `build_del3_clauses`, and the gamma-cap/`(E8d)`/`(E5a)`/`(E5b)`
block inside `build_a1_extension`); `run.py` (threads `(DEL3)` through with
the same 𝔓-only placement mechanics as `(DEL2)`); `smoke.py` (updated
G-SAT witness, new `G-PROBES` gate, new `check_del3_presence`).

Placement, exactly as spec §9.1's closing note states: `(DEL3)` is 𝔓-only
(`base+P` and every `base+P+A<k>` leaf; **not** `base`, **not** `base+A1`);
the gamma cap atoms, `(E8d)`, and `(E5a)`/`(E5b)` are `base+A1`-only
(they need the gamma atoms, which only exist in the A1 extension);
everything else — `(E8a)`, `(E8b)`, `(E8c)`, `(N8)`, `(FB)`, `(CD4)`,
`(CD5)`, `(R1')` — is base-scope (present in all 8 runs).

### 6.1 Per-family clause/variable counts

Measured by instrumenting the build sequence (`_build()` calls each family's
method in isolation and the clause/variable counts are read off before and
after each call).

| Family | Scope | New vars | New clauses |
|---|---|---:|---:|
| (N8) `n>=14` | base | 0 | 14 |
| (E8a) rows×bisector | base | 0 | 24 |
| (E8b) CD B2 sets | base | 0 | 2 |
| (E8c) CD B1 sets | base | 0 | 24 |
| (CD4) center exclusion | base | 0 | 22 |
| (CD5) B-set radius selectors | base | 4 (`rbs1,rbs2,rbt1,rbt2`) | 98 |
| (R1') row_u at-most-4 (2nd set) | base | 20 (Sinz aux, 5 items/bound 4) | 37 |
| (FB) frontier-pair selector | base | 12 (4 `fbar_p` + 8 Sinz aux) | 31 |
| **base subtotal (v1.1 → v1.2)** | | **36** | **252** |
| (DEL3) 𝔓-only at-most-2 | 𝔓-only (stashed) | 10 (Sinz aux, 5 items/bound 2) | 21 |
| gamma cap atoms (A1 ext) | base+A1-only | 4 (`moser_g,inSig_g,inO1i_g,inO2i_g`) | 34 |
| (E8d) A1 MC classes | base+A1-only | 0 | 5 |
| (E5a)/(E5b) A1 radius uniqueness | base+A1-only | 0 | 85 |
| **A1-extension subtotal (v1.1 → v1.2)** | | **4** | **124** |

`(FB)`'s exactly-2 constraint is encoded in the same style as `(DEL2)`
(at-least-one + a per-element "not a singleton" implication, rather than a
raw `C(4,3)` subset-cover clause set) plus a genuine Sinz at-most-2 call —
both are sound, logically equivalent encodings of "exactly 2 of 4"; this is
an encoding-style choice, not a content deviation from spec, matching the
file's existing convention (`(DEL2)` already uses this pattern).

### 6.2 Encoder size, before/after

| | v1.1 | v1.2 | Δ |
|---|---:|---:|---:|
| `base` vars | 835 | 871 | +36 |
| `base` clauses | 18858 | 19110 | +252 |
| `base+A1` vars | 1012 | 1062 | +50 (=36 base + 4 gamma-cap +10 orphaned (DEL3) IDs, see note below) |
| `base+A1` clauses | 19204 | 19580 | +376 (=252 base + 124 A1-ext) |

**`(DEL3)` variable-ID accounting note.** `(DEL3)` must be built strictly
*after* `base`'s own run is recorded (so `base`'s reported var count
excludes its Sinz counter variables) and *before* `base+P`/the leaf runs
(which need its clauses) — see `build_del3_clauses`'s docstring. Because
`base+A1` is architecturally required to run last (`build_a1_extension`
mutates `encoder.cnf` past the frozen `base_clauses` snapshot and must be
the only thing that ever does so), `(DEL3)`'s 10 Sinz auxiliary variables
end up allocated *before* the A1-extension's own variables, so `base+A1`'s
*declared* variable count (1062) is 10 higher than the variables its own
clause set actually references (1052) — those 10 IDs are declared-but-unused
in `base+A1`'s DIMACS header, which CaDiCaL accepts without issue. This is
a bookkeeping artifact of the shared global variable counter, not a
soundness or clause-family-placement issue: `check_del3_presence` (below)
directly confirms `(DEL3)`'s *clauses* are absent from both `base_clauses`
and the A1-extension's clause set by exact set-membership check.

### 6.3 Verdict runs (spec §5, rerun with v1.2)

Command: `uv run python census/frontier-packages/a_core/run.py`.

| Run | Verdict | Vars | Clauses | Wall |
|---|---|---:|---:|---:|
| base | SAT | 871 | 19110 | 0.016s |
| base+P | SAT | 881 | 19136 | 0.016s |
| base+P+A2 | SAT | 881 | 19137 | 0.016s |
| base+P+A3 | SAT | 881 | 19139 | 0.016s |
| base+P+A6 | SAT | 881 | 19143 | 0.016s |
| base+P+A7 | SAT | 881 | 19140 | 0.016s |
| base+P+A8 | SAT | 881 | 19139 | 0.016s |
| base+A1 | SAT | 1062 | 19580 | 0.016s |

**No verdict flipped** — all 8 runs remain SAT (same as v1.1). Per the
scope label in §0 above, SAT is an incidence-layer non-contradiction
statement only, never a geometric closure result.

### 6.4 Smoke gates + probes (spec §9.1)

Command: `uv run python census/frontier-packages/a_core/smoke.py`.
`ALL_GATES_PASS = True`.

| Gate | Verdict | Expected | Pass |
|---|---|---|---|
| G-BASE | SAT | SAT | yes |
| G-EXCL (10/10 pairs) | UNSAT | UNSAT | yes |
| G-SAT (downgrade variant, updated witness) | SAT | SAT | yes |
| G-PROBES (4/4) | UNSAT | UNSAT | yes |

| Probe | Verdict | DRAT verified |
|---|---|---|
| P-DEL3 (`base+P` + `del(zd)∧del(u)∧del(xu)`) | UNSAT | yes |
| P-E8 (`base` + `row_u(qh)∧row_u(wh)∧b(u,a0)`) | UNSAT | yes |
| P-FB (`base` + `eq(f1,zd)∧¬fbar_qh∧¬fbar_wh`) | UNSAT | yes |
| P-CD5 (`base` + `rbs2∧bs2(qh)∧¬eq(qh,zd)∧¬eq(qh,xu)∧¬eq(qh,v)∧¬eq(qh,xv)`) | UNSAT | yes |

`(DEL2)`/`(DEL3)` presence checks (`check_del2_presence`,
`check_del3_presence`, direct clause-set membership, not inference):
`(DEL2)` present in `base+P` and every leaf, absent from `base+A1`;
`(DEL3)` (21 clauses) present in `base+P`/every leaf's extra set, absent
from `base_clauses` and from the A1-extension's clause set — all `True`.
Pre-change SAT-refutability of the probes (the optional §9.1 note) was not
separately checked (none of the four probe assumption sets existed as
named atoms before v1.2, so "was it SAT at v1.1" is vacuous for three of
the four; P-E8's antecedent atoms did exist at v1.1 but nothing in v1.1
forbade `row_u(qh)∧row_u(wh)∧b(u,a0)` together, so it would have been SAT
then — not independently re-verified, since v1.1's CNF is no longer live
in the encoder).

### 6.5 G-SAT witness update

Full rationale is in `smoke.py::hand_built_assumptions`'s docstring;
summary:

- **n: 13 → 14.** `nO2` bumped from 5 to 6 (`nSig=3, nO1=2, nO2=6`); `n`
  is still left for the solver to *derive* via (N1) rather than asserted
  directly (the same "extra wiring check" as v1.1). Solved value:
  `n=14`, confirming (N1) + (N8) both wired correctly.
- **`(FB)` pair: {qh, wh}.** `inSig(qh)=inSig(wh)=F` and
  `inT(qh)=inT(wh)=F` are already *forced* in this witness (via CAP1 +
  the `inO1i(qh)=inO1i(wh)=T` units, and via T1 exactness with all eq
  atoms false), so both of `(FB)`'s universal implications hold by
  construction. `{f1,f2}` was NOT usable: the witness's own
  `inSig(f1)=inSig(f2)=T` assumption (kept from v1.1, needed for (N5))
  directly contradicts `fbar_p → ¬inSig(p)` for `p∈{f1,f2}`.
- **`(CD5)` selectors: all four False** (`rbs1=rbs2=rbt1=rbt2=F`), the
  generic/no-radius-coincidence choice, checked by hand against every
  other atom already fixed in the witness (no contradiction — see the
  docstring for the exact forced-consequence trace).
- **`(E8c)` explicit pin: `bs1(qh)=bs1(wh)=bt1(qh)=bt1(wh)=F`.** Not
  strictly required (the solver would find this on its own — these atoms
  were previously "immaterial"), but pinned explicitly because setting
  both True together is now actually *infeasible* under this witness
  (`bs1(qh)∧bs1(wh)` with `b(u,xv)=T` would force
  `inO1i(xv)∨eq(xv,a1)`, both already forced False) — pinning keeps the
  witness a fully auditable total assignment rather than relying on the
  solver to avoid a corner it was never going to reach.
- `n_assumptions` grew from 76 (v1.1) to 88 (+12: 4 `fbar`, 4 `rb*`, 4
  `bs1/bt1(qh,wh)` pins).

### 6.6 Decoded-model shape changes on SAT runs

The single largest visible effect of v1.2 on the organically-found
witnesses: **`(DEL3)` now pins `|Δ|=2` exactly in every 𝔓 run.** In v1.1,
`base+P` and every `base+P+A<k>` leaf had CaDiCaL land on `Δ={zd,u,xu,v,xv}`
(all five) — nothing forced a smaller set. With `(DEL3)`'s at-most-2
combined with `(DEL2)`'s at-least-two, every 𝔓-scope run's decoded model
now shows exactly two deletion atoms true: `base+P` and all five leaves
(`base+P+A2/A3/A6/A7/A8`) all land on the identical `Δ={u,zd}`. `base` (no
𝔓 context) still shows all five, and `base+A1` (no `(DEL2)`/`(DEL3)`) still
shows the legal single-element `Δ={zd}` — both unchanged in shape from
v1.1.

Every SAT run's `fbar` pair came back `{qh,wh}` (CaDiCaL's default variable
order favors the earliest-declared literal; `{f1,f2}` remains reachable
under different assumptions/branching but was never what the solver found
here). `rbs1,rbs2,rbt1,rbt2` are unconstrained free variables in every run
(nothing forces any of them true or false); `base`, `base+P`, `base+P+A2`,
and `base+A1` all landed on all-four-True, while `base+P+A3` landed on
`{rbs1,rbt2}` True (`rbs2,rbt1` False) and `base+P+A6/A7/A8` landed on
`{rbs1,rbs2,rbt2}` True (`rbt1` False) — exactly the same "artifact of
CaDiCaL's search order, not a semantic fact" caveat already documented for
`row_u`/`row_v` in §2 above; no leaf delta actually forces any rb* value.

`base+A1`'s witness: `γ` coincides with `qh` (`eq(gamma,qh)=T`, same as
v1.1's decoded fact), and the new gamma cap atom `inO1i(gamma)=T` is
decoded consistently via congruence with `inO1i(qh)=T` — `inSig(gamma)`
and `inO2i(gamma)` both come back False, matching CAP1's exactly-one.
`Δ={zd}` unchanged.

### 6.7 Spec gaps

None found in this iteration. Every clause in spec §9/§9.1 mapped directly
onto the existing 13-label/CD-domain atom set with no missing constraint
and no unimplementable clause; all four §9.1 probes independently confirm
`(E8a)`, `(DEL3)`, `(FB)`, and `(CD5)` each do real deductive work (UNSAT
under a targeted assumption set that only that family's clauses forbid).
The only implementation-level judgment calls made (DEL3's post-init build
timing, FB's DEL2-style at-least-2 encoding, the G-SAT witness's explicit
`(E8c)` pin) are documented above and in code comments; none required
deviating from or extending the spec's clause content.

## 7. Implementation notes (not ambiguities — decisions with no live spec
choice)

- **Integer layer encoding**: implemented as a direct/"unary" one-hot value
  encoding (`X=i` atoms for i=0..MAXN=24, exactly-one), which the spec's
  "unary/order encoding" phrasing explicitly permits. (N1)'s sum equality
  is a per-combo forward implication; combos whose sum would need
  `n>MAXN` are explicitly **forbidden** (not left open) since `n`'s own
  domain is capped at MAXN and (N1) is a genuine equality — leaving them
  open let an early build land on a degenerate `nSig=nO1=nO2=n=24`
  "witness" that didn't actually satisfy (N1); this was caught (by
  eyeballing a decoded model) and fixed during this implementation session,
  before the reported runs above. No commit has been made; the fix is only
  in the working tree at `census/frontier-packages/a_core/encoding.py`.
- **Gamma's own (EQ1) closure (A1 run only)**: the spec's A1 leaf-delta
  entry does not mention an (EQ1) analog for γ's 6 eq atoms, and an early
  build let γ coincide with **all six** of `{a0,a1,qh,wh,f1,f2}`
  simultaneously — including both of the baked-pairwise-distinct pair
  `{a0,a1}` and all four of the baked-pairwise-distinct `{qh,wh,f1,f2}` at
  once, which is not a model of anything. Fixed by applying the same
  (EQ1) at-most-one schema (restricted to γ's targets intersected with the
  Moser and frontier groups) that the 13 original labels already get. This
  is the same schema, not a new clause family, applied to a label the A1
  leaf table introduces but for which the spec did not spell out the
  closure explicitly.

## 8. CEGAR iteration 3 (v1.3, 2026-07-28)

### 8.1 Refinement

The source-context hypothesis `(C6)` explicitly states
`other ∈ 𝒯`. Versions through v1.2 omitted that fact, and all eight
v1.2 decoded models exploited the omission by setting `inT(oth)=F`.
The v1.3 base adds the single source-tagged unit `inT(oth)`. Together
with (T1) exactness, every model must choose exactly one of
`eq(oth,zd)`, `eq(oth,v)`, or `eq(oth,xv)`.

### 8.2 Smoke gates

All gates pass:

- G-BASE remains SAT.
- New G-C6 (`base ∧ ¬inT(oth)`) is UNSAT, DRAT verified.
- G-EXCL remains 10/10 UNSAT, every DRAT verified.
- Revised G-SAT is SAT. It uses the coherent alias `oth=zd`, changes
  `β(v)` from `zd` to `OUT`, and sets `β(oth)=β(zd)=v`; this respects
  target/source congruence, (BM1), and (BM2).
- All four v1.2 probes remain UNSAT, every DRAT verified.

### 8.3 Package verdicts

| Run | Verdict | Variables | Clauses | Wall time |
|---|---:|---:|---:|---:|
| base | SAT | 871 | 19,111 | 0.017 s |
| base+P | SAT | 881 | 19,137 | 0.016 s |
| base+P+A2 | SAT | 881 | 19,138 | 0.016 s |
| base+P+A3 | SAT | 881 | 19,140 | 0.016 s |
| base+P+A6 | SAT | 881 | 19,144 | 0.016 s |
| base+P+A7 | SAT | 881 | 19,141 | 0.016 s |
| base+P+A8 | SAT | 881 | 19,140 | 0.016 s |
| base+A1 | SAT | 1,062 | 19,581 | 0.017 s |

Every run gained exactly one clause and no variables. The decoded
alias choices are: `oth=zd` for base, base+P, A1, and A3;
`oth=xv` for A2; and `oth=v` for A6, A7, and A8. These choices are
solver witnesses, not derived geometric facts.

**Terminal status:** all six A leaves remain **OPEN**. The repair
strictly narrows the incidence models and removes a source-invalid
escape, but it does not close the A package. The next A refinement
must use additional source structure or move these alias types to
exact metric realization/nonrealizability; SAT alone is not evidence
of a geometric realization.

## 9. C10 full-distance-class projection (2026-07-29)

### 9.1 Provenance and scope

The new physical-context clause is

`¬row_u(qh) ∨ ¬row_u(wh)`.

Its branch provenance is the kernel-checked theorem
`Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
(`CriticalPairFrontier.lean:781`): deletion survival at a source blocker is
equivalent to omission from the selected exact critical four-shell support.
After (P3) identifies `u` with the source, the two C10 alternatives project
respectively to `¬row_u(qh)` and `¬row_u(wh)`. The clause is therefore
included in `base+P` and every physical A leaf, and excluded from `base`
and `base+A1`.

### 9.2 Focused regression

The focused G-C10 gate passed:

| Variant | Expected | Verdict | Proof |
|---|---:|---:|---:|
| pre-C10: `row_u(qh) ∧ row_u(wh)` | SAT | SAT | — |
| with C10: `row_u(qh) ∧ row_u(wh)` | UNSAT | UNSAT | DRAT verified |
| `¬row_u(qh) ∧ row_u(wh)` | SAT | SAT | — |
| `row_u(qh) ∧ ¬row_u(wh)` | SAT | SAT | — |

The scope/shape check also passed: exactly one C10 clause, present in
`base+P` and all five physical leaf clause sets, absent from base and A1.

### 9.3 Package verdicts

An artifact-isolated rerun (temporary output directory) gave:

| Run | Verdict | Variables | Clauses |
|---|---:|---:|---:|
| base | SAT | 871 | 19,111 |
| base+P | SAT | 881 | 19,138 |
| base+P+A2 | SAT | 881 | 19,139 |
| base+P+A3 | SAT | 881 | 19,141 |
| base+P+A6 | SAT | 881 | 19,145 |
| base+P+A7 | SAT | 881 | 19,142 |
| base+P+A8 | SAT | 881 | 19,141 |
| base+A1 | SAT | 1,062 | 19,581 |

Only physical runs gain the one C10 clause; no run gains a variable.

**Trust boundary:** the Lean equivalence supplies kernel-checked provenance
for the branch projection. Clause wiring and the reported SAT/UNSAT outcomes
remain diagnostic Python/CNF evidence; they do not constitute Lean closure
or metric realization. All six A leaves remain **OPEN**.
