# C-core Layer-1 incidence encoder — results

Implements `census/frontier-packages/C-CORE-ENCODING-SPEC.md` (v1.1), a
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

Version 1.1 promotes C6.9 using the kernel-checked
`Problem97.ATailCriticalPairFrontier.cross_deletion_survives_iff_not_mem_selected_support`
at `lean/Erdos9796Proof/P97/ATail/CriticalPairFrontier.lean:781`. With
`row_src=Σ′(source)`, its two K4-survival alternatives project to
`¬row_src(qh) ∨ ¬row_src(wh)`. The clause is present in exactly the two
physical verdict leaves and absent from the abstract/common `base`.

## 0. Encoder size

| Run | Vars | Clauses |
|---|---:|---:|
| `base` (abstract/common; minus physical C6.9 and (DEL2)/(DEL3)) | 928 | 21690 |
| `base+C1` (base + physical leaf C1 delta) | 938 | 21719 |
| `base+C2` (base + physical leaf C2 extension, built last) | 964 | 21797 |

`base+C2`'s declared 964 is 938+26 (leaf C1's own delta adds 0 new
variables) rather than 928+26=954: (DEL3)'s 10 Sinz auxiliary variables are
allocated once, strictly after `base` is finalized and before either leaf
is built (`run.py` builds `del3_extra` before `base+C1` and reuses the
already-advanced global variable counter for `base+C2`), so those 10 IDs
end up **declared-but-unused** in `base+C2`'s DIMACS header. This is the
same bookkeeping artifact the a_core RESULTS.md documents for `base+A1`
in v1.2 — confirmed harmless (CaDiCaL accepts unused declared variables;
`base+C2` has 107 leaf-extra clauses: the one C6.9 clause references
existing `row_src` variables, while the other 106 clauses only reference
the 26 variables `build_leaf_c2_extension` itself allocates).

The v1.1 C6.9 delta itself added one clause and no variables to each
physical leaf. Separately, the universal-cardinality repair in section 5
adds 8 variables and 1,963 clauses to every verdict. The three verdicts
remain SAT/SAT/SAT. `run.py` does not enumerate all satisfying assignments,
so no total model count is claimed; the refreshed model files are three
single decoded witness artifacts, one per SAT verdict run.

All solves complete in 0.017-0.018s, nowhere near the 60s timeout budget.

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
| integer layer (N1-N7, N2 amended, N8 dropped) | 211 | 17948 | carried+amended |
| (EQ1)-(EQ4) consistency, enlarged eq set | 76 | 2411 | carried, row_src added to (EQ3) |
| (E8a) rows x bisector (x in {u,v}) | 0 | 24 | carried |
| (E8a-src) rows x bisector (row_src) | 0 | 24 | section 2, new |
| (E8b) CD B2 sets | 0 | 2 | carried |
| (E8c) CD B1 sets | 0 | 24 | carried |
| (CD4) center exclusion | 0 | 22 | carried |
| (CD5) B-set radius selectors | 4 | 98 | carried, rbs1 keys off row_u (confirmed) |
| (R1') row_u at-most-4 2nd set | -- | -- | **DROPPED** (no replacement set exists) |
| (FB) frontier-pair selector | 12 | 25 | amended: 2 of 3 implications dropped |
| **base total** | **928** | **21690** | |

Sanity check: `_build_integers`' 17,948 clauses are dominated by (N1)'s
full `(OVERFLOW+1)^3 = 26^3 = 17,576`-clause abstract cube. The remaining
372 clauses are the four 26-way exactly-one declarations plus
N2/N3/N4/N5/N7 and the S6 arms. This is exactly 1,963 clauses and 8
variables above the old bounded integer layer: 1,951 new N1 cube clauses,
four GE25 atoms, four extra Sinz auxiliaries, and 12 extra Sinz clauses.

### Leaf C1 delta (29 clauses, 10 new vars — the 10 are (DEL3)'s Sinz aux)

| Piece | Clauses | Tag |
|---|---:|---|
| unit `~srcU` | 1 | (C9.3) |
| (DEL2) at-least-two | 5 | leaf-C1-only |
| (DEL3) at-most-two (10 new Sinz aux vars) | 21 | leaf-C1-only |
| placement `b(xu,zd) v b(xu,u) v b(xu,v) v b(xu,xv)` | 1 | (C9.4), subsumes (C9.2) |
| `¬row_src(qh) ∨ ¬row_src(wh)` | 1 | (C6.9), v1.1 |
| **total** | **29** | |

### Leaf C2 delta (107 clauses, 26 new vars — built last)

| Piece | New vars | Clauses | Tag |
|---|---:|---:|---|
| `¬row_src(qh) ∨ ¬row_src(wh)` | 0 | 1 | (C6.9), v1.1 |
| P's 6 eq atoms (`eq(P,{a0,a1,qh,wh,f1,f2})`) | 6 | 0 | (C8.2)+eq-target list |
| (EQ1) at-most-1, P vs MOSER_GROUP (Sinz, 2 items) | 2 | 4 | consistency |
| (EQ1) at-most-1, P vs FRONTIER_GROUP (Sinz, 4 items) | 4 | 10 | consistency |
| (EQ4) transitivity, 4 `{P,a0,X}` triangles x 3 rotations | 0 | 12 | consistency |
| gamma-style cap atoms `moser_P/inSig_P/inO1i_P/inO2i_P` | 4 | 34 | A spec section 9 pattern, verbatim |
| (COL) collision family (10 pairs) | 10 | 21 | (C10.2) |
| (COL-E8) bisector-coincidence instances (10 pairs x 2 orientations) | 0 | 20 | (C3.8) |
| (E5C) restoration radius capture (5 T-labels) | 0 | 5 | (C8.4)+(C8.5)+(C3.5) |
| **total** | **26** | **107** | |

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
| G-OVERFLOW (`nSig=24,nO1=2,nO2=3`) | SAT with `nGE25` | SAT with `nGE25` | yes |
| G-EXCL analog: `base+C1 + srcU` | UNSAT (DRAT verified) | UNSAT | yes |
| G-EXCL analog: `base+C1 + del(zd)&del(u)&del(xu)` (DEL3 gate) | UNSAT (DRAT verified) | UNSAT | yes |
| G-C69 (both physical leaves) | all 8 branch variants as expected | mixed | yes |

G-C69 first asserts that the C6.9 clause
`¬row_src(qh) ∨ ¬row_src(wh)` occurs zero times in `base` and exactly once
in each of the C1 and C2 deltas. For each leaf independently:

| Variant | C1 | C2 |
|---|---|---|
| pre-C6.9 branch + both memberships | SAT | SAT |
| current branch + both memberships | UNSAT (DRAT verified) | UNSAT (DRAT verified) |
| current branch + qh omitted, wh retained | SAT | SAT |
| current branch + wh omitted, qh retained | SAT | SAT |

Thus C6.9 removes exactly the double-membership corner exercised by this
gate; neither individual survival alternative is accidentally excluded by
the other encoded physical-branch rules.

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

Verdict: **SAT**, 113 assumption clauses, 0.020s.

## 3. Verdict runs (spec section 6)

Command: `uv run python census/frontier-packages/c_core/run.py`. Output:
`out/*.cnf`, `out/*.model.json`, `out/manifest.json`.

| Run | Verdict | Vars | Clauses | Wall |
|---|---|---:|---:|---:|
| `base` | **SAT** | 928 | 21690 | 0.018s |
| `base+C1` | **SAT** | 938 | 21719 | 0.018s |
| `base+C2` | **SAT** | 964 | 21797 | 0.018s |

Unlike A, there is no shared-context run (C spec section 6: "the two
leaves ARE the two verdicts"). Both leaf verdicts (`base+C1`, `base+C2`)
are SAT — per the scope label above, this means each leaf's Layer-1
incidence content (as approved by the spec) has no contradiction; it is
**not** a geometric closure statement in either direction.

### Per-run decoded facts (organic CaDiCaL witnesses, no assumptions)

All three refreshed *organic* witnesses (found by CaDiCaL with zero
assumptions, not the hand-built G-SAT one) select `srcU=False`,
`eq(oth,zd)=True`, S6 arm `s6a`, and the GE25 bucket for each of
`nSig,nO1,nO2,n`. The latter is a legal saturated abstraction choice, not
a claim that the four concrete cardinalities equal 25. It represents, for
example, concrete inputs all at least 25 together with their correspondingly
larger concrete sum.

- **`base`**: `Delta={xv}`; all eight blocker-map sources use `OUT` except
  `qh->a1` and `wh->a1`.
- **`base+C1`**: `Delta={v,xv}` (exactly two, as required by
  (DEL2)+(DEL3)); the only blocker-map difference from `base` is `xu->xv`.
  Here `srcU=False` is forced by leaf C1's (C9.3) unit.
- **`base+C2`**: `Delta={v,xv}` and `col(v,xv)=True`; every other `col`
  atom is false. Its blocker map matches `base`. No P-equality atom is true;
  `inO2i(P)=True` discharges P's cap classification.

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

## 5. Universal-cardinality overflow repair (2026-08-04)

The integer layer now has exact buckets `0,...,24` plus a `GE25` bucket for
each of `nSig`, `nO1`, `nO2`, and `n`. A concrete value maps to its exact
bucket through 24 and to `GE25` thereafter. For (N1), an exact input sum at
most 24 selects the corresponding exact `n`; a larger exact sum or any
overflow input selects `nGE25`. Consequently every concrete nonnegative
cap-partition tuple satisfying `n = nSig + nO1 + nO2 + 3` has an abstract
valuation. The encoder no longer assumes `n <= 24`.

Threshold clauses remain exact for every threshold at most 25: `X >= t`
excludes precisely the exact buckets below `t` and retains `GE25`. Requests
for a threshold above 25 now raise `EncodingError` rather than silently
claiming an unsupported comparison. Exact-value clauses accept only
`0,...,24`; `GE25` is never misread as the exact value 25.

The new `G-OVERFLOW` regression fixes
`(nSig,nO1,nO2)=(24,2,3)`, representing concrete `n=32`, and verifies SAT
with `nGE25=true`. All smoke gates pass, including all previously recorded
UNSAT gates with DRAT verification. The refreshed production census is:

| Run | Verdict | Variables | Clauses |
|---|---:|---:|---:|
| base | SAT | 928 | 21,690 |
| base+C1 | SAT | 938 | 21,719 |
| base+C2 | SAT | 964 | 21,797 |

This repairs the universal ingress scope but supplies no contradiction:
every C-core verdict remains SAT. Neither physical C leaf is closed, and
the CNF/DRAT smoke results remain local clause-family regression evidence,
not Lean promotion or geometric realization.
