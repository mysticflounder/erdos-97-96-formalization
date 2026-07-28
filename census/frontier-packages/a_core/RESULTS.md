# A-core Layer-1 incidence encoder — results

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

Implements `census/frontier-packages/A-CORE-ENCODING-SPEC.md` (v1.1). Code:
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

## 6. Implementation notes (not ambiguities — decisions with no live spec
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
