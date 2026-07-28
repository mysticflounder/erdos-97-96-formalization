# C-core Layer-1 incidence encoder — results

Implements `census/frontier-packages/C-CORE-ENCODING-SPEC.md` (v1.0), a
DELTA spec against `A-CORE-ENCODING-SPEC.md` (v1.2). Code:
`census/frontier-packages/c_core/{encoding.py,run.py,smoke.py}`, copy-and-
adapted from `a_core`'s files per the spec's own instruction ("do NOT
import a_core or modify it"). All commands run from the repo root via
`uv run python census/frontier-packages/c_core/...`.

**Scope label (binding on every verdict below, per the A spec header
incorporated by reference):** an encoder SAT verdict is an incidence-layer
statement only — "the written CNF, restricted to the clause families this
spec approved, has a model." UNSAT would mean the package is contradictory
at the incidence layer; **SAT means nothing negative.** None of the SAT
verdicts below are a geometric closure result.

## 0. Encoder size

| Run | Vars | Clauses |
|---|---:|---:|
| `base` ((C0)-(C8), minus (DEL2)/(DEL3)) | 920 | 19727 |
| `base+C1` (base + leaf C1 delta) | 930 | 19755 |
| `base+C2` (base + leaf C2 extension, built last) | 956 | 19833 |

`base+C2`'s declared 956 is 930+26 (leaf C1's own delta adds 0 new
variables) rather than 920+26=946: (DEL3)'s 10 Sinz auxiliary variables are
allocated once, strictly after `base` is finalized and before either leaf
is built (`run.py` builds `del3_extra` before `base+C1` and reuses the
already-advanced global variable counter for `base+C2`), so those 10 IDs
end up **declared-but-unused** in `base+C2`'s DIMACS header. This is the
same bookkeeping artifact the a_core RESULTS.md documents for `base+A1`
in v1.2 — confirmed harmless (CaDiCaL accepts unused declared variables;
`base+C2`'s own 106 leaf-extra clauses only ever reference the 26 variables
`build_leaf_c2_extension` itself allocates).

All solves complete in 0.016-0.017s, nowhere near the 60s timeout budget.

## 1. Base family clause/variable breakdown

Measured by instrumenting the `_build()` call sequence (each family
method's variable/clause counts read off before and after its call, same
technique a_core's RESULTS.md section 6.1 uses).

| Family (build order) | New vars | New clauses | Spec tag(s) |
|---|---:|---:|---|
| eq atoms (42 pairs: A's 35 + 7 new `u`/`oth` pairs) | 42 | 0 | section 3 |
| srcU selector | 1 | 0 | section 2 |
| moser(p) | 13 | 29 | carried |
| (CAP1)/(CAP2) + cap units | 39 | 94 | carried, units amended |
| (CL1) frontier class | 13 | 14 | carried, cl1(u) unit removed |
| (T1) physical class | 13 | 15 | carried, inT(oth)=T NEW unit |
| rows row_u/row_v (R1,R3) | 66 | 108 | carried, row_u(oth) unit removed |
| del(p) atoms + (DEL1) | 5 | 1 | carried |
| blocker map (BM1-BM5,BM8,BM9) | 224 | 477 | carried; BM6 DROPPED; BM7 moved to source-context |
| source-context (srcU-conditional pairs C6.2/.3/.5/.8/.12, row_src, R1-src, CS4) | 48 | 135 | section 2, all new |
| sv(p) (SV1) | 13 | 13 | carried |
| CD witness sets (CD1-CD3) | 146 | 224 | carried |
| S5-analog arms | 2 | 2 | carried |
| integer layer (N1-N7, N2 amended, N8 dropped) | 203 | 15985 | carried+amended |
| (EQ1)-(EQ4) consistency, enlarged eq set | 76 | 2411 | carried, row_src added to (EQ3) |
| (E8a) rows x bisector (x in {u,v}) | 0 | 24 | carried |
| (E8a-src) rows x bisector (row_src) | 0 | 24 | section 2, new |
| (E8b) CD B2 sets | 0 | 2 | carried |
| (E8c) CD B1 sets | 0 | 24 | carried |
| (CD4) center exclusion | 0 | 22 | carried |
| (CD5) B-set radius selectors | 4 | 98 | carried, rbs1 keys off row_u (confirmed) |
| (R1') row_u at-most-4 2nd set | -- | -- | **DROPPED** (no replacement set exists) |
| (FB) frontier-pair selector | 12 | 25 | amended: 2 of 3 implications dropped |
| **base total** | **920** | **19727** | |

Sanity check: `_build_integers`' 15985 clauses is dominated by (N1)'s full
`(MAXN+1)^3 = 25^3 = 15625`-clause cube (unchanged encoding style from A);
hand-recomputing every sub-family (int-var declarations, N2/N3/N4/N5/N7,
S6 arms) from first principles reproduces 15985 exactly, confirming no
stray clauses.

### Leaf C1 delta (28 clauses, 10 new vars — the 10 are (DEL3)'s Sinz aux)

| Piece | Clauses | Tag |
|---|---:|---|
| unit `~srcU` | 1 | (C9.3) |
| (DEL2) at-least-two | 5 | leaf-C1-only |
| (DEL3) at-most-two (10 new Sinz aux vars) | 21 | leaf-C1-only |
| placement `b(xu,zd) v b(xu,u) v b(xu,v) v b(xu,xv)` | 1 | (C9.4), subsumes (C9.2) |
| **total** | **28** | |

### Leaf C2 delta (106 clauses, 26 new vars — built last)

| Piece | New vars | Clauses | Tag |
|---|---:|---:|---|
| P's 6 eq atoms (`eq(P,{a0,a1,qh,wh,f1,f2})`) | 6 | 0 | (C8.2)+eq-target list |
| (EQ1) at-most-1, P vs MOSER_GROUP (Sinz, 2 items) | 2 | 4 | consistency |
| (EQ1) at-most-1, P vs FRONTIER_GROUP (Sinz, 4 items) | 4 | 10 | consistency |
| (EQ4) transitivity, 4 `{P,a0,X}` triangles x 3 rotations | 0 | 12 | consistency |
| gamma-style cap atoms `moser_P/inSig_P/inO1i_P/inO2i_P` | 4 | 34 | A spec section 9 pattern, verbatim |
| (COL) collision family (10 pairs) | 10 | 21 | (C10.2) |
| (COL-E8) bisector-coincidence instances (10 pairs x 2 orientations) | 0 | 20 | (C3.8) |
| (E5C) restoration radius capture (5 T-labels) | 0 | 5 | (C8.4)+(C8.5)+(C3.5) |
| **total** | **26** | **106** | |

Every one of the 10 (COL-E8) pairs had **both** orientations instantiable
(20, not fewer): `u` now carries eq atoms to both `qh` and `wh` (the new C
section-3 `u`-vs-frontier group), so all five SHELL_GROUP labels have eq
atoms to both `qh` and `wh`, unlike A where `u` was excluded.

## 2. Smoke gates and probes (spec section 7)

Command: `uv run python census/frontier-packages/c_core/smoke.py`.
`ALL_GATES_PASS = True`.

| Gate | Verdict | Expected | Pass |
|---|---|---|---|
| G-BASE | SAT | SAT | yes |
| G-SAT (hand-built total assignment) | SAT | SAT | yes |
| G-EXCL analog: `base+C1 + srcU` | UNSAT (DRAT verified) | UNSAT | yes |
| G-EXCL analog: `base+C1 + del(zd)&del(u)&del(xu)` (DEL3 gate) | UNSAT (DRAT verified) | UNSAT | yes |

| Probe | Assertion | Verdict | DRAT verified |
|---|---|---|---|
| P-SRC | `base + ~srcU + row_src(u)` | UNSAT | yes |
| P-COL | `base+C2 + ~col(s,t)` for all 10 pairs | UNSAT | yes |
| P-E5C | `base+C2 + eq(P,a1) + del(u) + srcU` | UNSAT | yes |
| P-E8-src | `base + row_src(qh) & row_src(wh) & srcU & b(u,a0)` | UNSAT | yes |

G-BASE came back SAT (not UNSAT), so the "STOP and audit family-by-family"
branch of the spec's sequencing rule was never triggered.

### G-SAT witness (hand-built total assignment; spec section 7's default
for C — the 15-point witness from A's package "maps even less directly
onto C" and was not attempted)

**A genuine finding, not a bug, surfaced while building this witness.**
The first attempt (generic position: every eq atom false, `srcU=True`,
a small blocker-target cycle `u->xv, v->zd, zd->v, oth->zd, xv/xu->OUT`)
came back **UNSAT**. Delta-debugging (`drat-trim -c` core extraction, full
trace in the implementation session) reduced the conflict to a 4-literal
core — `b(v,zd) & b(zd,v) & b(oth,zd) & b(xv,OUT)` alone, against `base`,
is UNSAT — and traced it to a real structural fact: the new C-only unit
`inT(oth)=T` [(C6.6)], combined with (T1) exactness, **forces**
`eq(oth,zd) v eq(oth,u) v eq(oth,v) v eq(oth,xv)` to hold in *every* model
of `base` (`oth` vs `xu` stays baked distinct, so `xu` is not an escape).
Each of the four disjuncts, under that first witness's specific blocker
choices, independently collided with (BM1)'s exactly-one via (EQ3)'s
blocker-congruence (each candidate coincidence partner already had an
*incoming* edge from some other center in the chosen cycle, forcing `oth`
to receive that same edge too — impossible under exactly-one). This is not
an encoding bug: it is a sound, spec-licensed consequence of `inT(oth)=T`
that a generic-position witness must actually satisfy, unlike in A (where
`inT(oth)=T` exists as a hypothesis fact but a_core's encoder never asserts
it as a unit — logged as an A iteration-3 backlog item, per the C spec's
own section 9 backlog note).

The final, SAT witness instead discharges the same forced disjunction via
`eq(oth,u)=True` with `srcU=False` (so (C6.5)'s `srcU -> ~eq(oth,u)`
exclusion does not fire), and picks every other blocker target so that
`oth`'s entire blocker pattern can consistently mirror `u`'s (no other
center's edge points at `u`, so the (EQ3) congruence this coincidence
forces has no collision). Full pin list and per-atom justification is in
`smoke.py::hand_built_assumptions`'s docstring; summary of the
non-obvious/forced (not freely chosen) pins:

- `srcU=False` (source=`xu`) — required so (C6.5)'s conditional exclusion
  does not block `eq(oth,u)`.
- `eq(oth,u)=True` — the only coincidence choice compatible with the
  blocker-target chain below (see above).
- `inO2i(u)=True` — a free choice under `srcU=False` (only `inO2i(xu)` is
  forced), but *required* by `eq(oth,u)`'s (EQ3) congruence against
  `inO2i(oth)=T` [unit].
- `row_u(oth)=True` — **forced** (not the generic "every free slot false"
  default) by (EQ3) congruence with `eq(oth,u)=T` against `row_u(u)=T`
  [unit, `I_u={u,xu}`].
- `b(oth,v)=True` — **forced** to equal `b(u,v)`'s target exactly: (EQ3)'s
  "both endpoints in B_DOMAIN" congruence branch requires `oth`'s entire
  blocker pattern to mirror `u`'s.
- `bs1(qh)=bs1(wh)=bt1(qh)=bt1(wh)=False` — explicit (E8c) pin, same
  reasoning as A's witness (avoids a genuinely infeasible corner given the
  fixed `b(u,v)`/`b(v,zd)` targets).
- Integer layer `nSig=3, nO1=2, nO2=6` fed in as assumptions, `n` left for
  the solver to *derive* via (N1) — came back `n=14`, well above the
  amended `N2` floor `n>=10`.

Verdict: **SAT**, 113 assumption clauses, 0.016s.

## 3. Verdict runs (spec section 6)

Command: `uv run python census/frontier-packages/c_core/run.py`. Output:
`out/*.cnf`, `out/*.model.json`, `out/manifest.json`.

| Run | Verdict | Vars | Clauses | Wall |
|---|---|---:|---:|---:|
| `base` | **SAT** | 920 | 19727 | 0.017s |
| `base+C1` | **SAT** | 930 | 19755 | 0.017s |
| `base+C2` | **SAT** | 956 | 19833 | 0.016s |

Unlike A, there is no shared-context run (C spec section 6: "the two
leaves ARE the two verdicts"). Both leaf verdicts (`base+C1`, `base+C2`)
are SAT — per the scope label above, this means each leaf's Layer-1
incidence content (as approved by the spec) has no contradiction; it is
**not** a geometric closure statement in either direction.

### Per-run decoded facts (organic CaDiCaL witnesses, no assumptions)

All three runs' *organic* witnesses (found by CaDiCaL with zero
assumptions, not the hand-built G-SAT one) independently landed on the
**same** forced-coincidence fact discovered above: `eq(oth,v)=True` in
every run (confirming it is a real, solver-independent consequence of
`inT(oth)=T`, reachable via a *different* coincidence choice — `v`, not
`u` — than the hand-built G-SAT witness used; both are valid, the forced
disjunction just has multiple satisfying branches).

- **`base`**: `srcU=False`; `Delta={u,v,xu,xv,zd}` (all five — `base`
  carries no (DEL2)/(DEL3), nothing forces a smaller set, same
  "artifact of search order" caveat A documents for its own base run);
  `eq`: `{a0=u, a0=f1, a2=f2, f1=u, oth=v, qh=xv}` (transitively closed:
  `a0=u=f1` is one coincidence cluster, `oth=v` is the forced one, `a2=f2`
  and `qh=xv` are independent); `inO2i(xu,v,oth)=T` (others F); `cl1(u)=T`
  (u coincides with `f1`, a frontier label, so `cl1(u)` derives True via
  (CL1) exactness — **not** forced False here since `srcU=False` in this
  organic witness, so the `srcU`-conditional `cl1(u)` unit never fires);
  S6 arm `s6c`; integer layer `(nSig,nO1,nO2,n)=(3,2,4,12)`; `b`:
  `u->a1, v->OUT, zd->xu, xu->zd, xv->a1, oth->OUT, qh->a1, wh->a1`
  (`b(u,a1)`/`b(xv,a1)` are forced by (BM4) since `cl1(u)=cl1(xv)=T` here
  — `xv` coincides with `qh`, a frontier label).
- **`base+C1`**: identical to `base` on every one of the facts above
  *except* `Delta`, which collapses to `{u,zd}` (exactly 2, confirming
  (DEL2)+(DEL3) are both doing real work: at-least-2 and at-most-2 pin it
  exactly, same effect A's (DEL2)/(DEL3) have on its `base+P`-shaped runs).
  `srcU=False` here is **forced** (leaf C1's own (C9.3) unit), not
  incidental.
- **`base+C2`**: identical to `base` on every §1-§8 fact, **plus** the new
  leaf-C2 atoms: `eq(P,a0)=eq(P,f1)=True` (P joins the same `{a0,u,f1}`
  coincidence cluster `base`'s own witness already had, extending it
  rather than creating a new one — legal, no clause forbids `P` coinciding
  with a target `u` already coincides with); `Delta={u,v,xu,xv,zd}` (all
  five — leaf C2 carries no (DEL2)/(DEL3) either, same as `base`); **all
  10 `col(s,t)` atoms True** (consistent since `Delta`=all five means
  `del(s)&del(t)` already holds for every pair — CaDiCaL's default
  branching, not a forced fact; (COL)'s own at-least-one only needs one).

**Caveat on `row_u`/`row_v`/`row_src` values outside the atoms actually
constrained by a base clause** (carried verbatim from A's RESULTS.md
caveat, now extended to `row_src`): whatever CaDiCaL prints for the free
slots is an artifact of its search order, not a semantic fact.

## 4. Spec concerns / gaps found

1. **`(BM6)` has no C analogue and is silently dropped — the one place
   this implementation had to make a judgment call about an *absent*
   entry rather than an explicit amendment.** A's `(BM6)` (`b(u,y)` for
   some `y in {zd,v,xv}` with `inT(y)`) is justified by A's leaf-shared
   context hypothesis `(P2)`. The C spec's tag map (section 1) sends A's
   `𝔓 (P1-P3)` to `"leaf C1 = C9.1-C9.4"` **only** — there is no C
   hypothesis restated for both leaves (or even leaf C1 alone) with
   `(P2)`'s content (`C9.1-C9.4` says nothing like "`beta(u)` in
   `{zd,v,xv}`"). C spec section 4's "Carried unchanged" list explicitly
   enumerates `BM1-BM5, BM7, BM8, BM9` and **omits** `BM6`. Per the shared
   soundness discipline ("omitted hypotheses only weaken UNSAT prospects,
   never soundness"), this implementation **did not add `(BM6)`** to
   `base` — flagging this for the orchestrator/spec-author to confirm the
   omission is intentional (vs. an oversight in the C spec's section-4
   enumeration) rather than silently reproducing A's clause on a guess.
2. **`inT(oth)=T` + (T1) exactness forces a genuine point-coincidence for
   `oth` in every model of `base`** (`eq(oth,zd) v eq(oth,u) v eq(oth,v) v
   eq(oth,xv)` — `oth` vs `xu` stays baked distinct, so there is no
   escape). This is not a spec defect — it is a sound consequence of the
   C spec's own explicit new unit (section 3: "`inT(oth)=T` \[(C6.6)\]")
   combined with the carried-over (T1) family — but it is a materially
   new base-layer fact relative to A (whose `a_core` never asserts this
   unit at all, a separate documented A-iteration-3 gap per the C spec's
   own section 9 backlog note). Reported here since it took real
   delta-debugging to surface (see section 2 above) and is exactly the
   kind of interaction the spec's soundness discipline says to report
   rather than silently work around.
3. No other missing, unsound, or unimplementable clause was found. Every
   clause in C spec sections 2-5 mapped directly onto either a carried A
   atom/family or a newly-declared atom family, with no ambiguity
   requiring an unlicensed choice beyond item 1 above. The two inherited
   A-side judgment calls (row_u(a1) left unconstrained per A's resolved
   `(RB2)` note; `(BM7)`/`(BM8)`/`(BM9)`'s `"for each y"` resolved to the
   13 LABELS excluding `OUT`) were carried over unchanged and re-verified
   to still apply correctly under the enlarged eq-atom / srcU-conditional
   machinery (traced explicitly in `encoding.py` comments at each carry
   point).
