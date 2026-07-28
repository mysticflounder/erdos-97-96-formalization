# E-core Layer-1 encoder — results

Implements `census/frontier-packages/E-ENCODING-SPEC.md` (v1.0). Code:
`census/frontier-packages/e_core/{encoding.py,run.py,smoke.py}`. All
commands run from the repo root via
`uv run python census/frontier-packages/e_core/...` (`encoding.py` inserts
the repo root onto `sys.path` itself so `census.card_head.sat_encoding`
imports regardless of invocation style, matching `a_core`'s convention).

**Scope label (binding on every verdict below):** an encoder SAT verdict is
an incidence-layer statement only — "the written CNF, restricted to the
clause families this spec approved, has a model." Per the spec's own
framing (and the A spec's binding soundness-discipline header, imported by
reference): UNSAT would mean the package is contradictory at the incidence
layer; **SAT means nothing negative.** None of the SAT verdicts below are a
geometric closure result. This package's own spec additionally states the
expected base verdict IS SAT (the 15-point equality shadow satisfies the
counting core) — SAT below is the expected outcome, not a failure.

## 0. Encoder size

`base` (spec sections 1-3 in full — E has one leaf, no leaf deltas/context
block, unlike A-core's 𝔓/A2-A8 structure): **551 variables, 18080
clauses**. `base+dom1` and `base+dom2` each add 1 unit clause (551
variables, 18081 clauses). All solves complete in 0.01-0.07s, nowhere near
the 60s timeout budget.

## 1. Smoke gates (spec §5), run IN ORDER: G-BASE, G-SHADOW, G-PROBES

Command: `uv run python census/frontier-packages/e_core/smoke.py`

| Gate | Verdict | Expected | Pass |
|---|---|---|---|
| G-BASE | SAT | SAT | yes |
| G-SHADOW | SAT | SAT | yes |
| P-EBM3 | UNSAT (DRAT verified) | UNSAT | yes |
| P-ER2 | UNSAT (DRAT verified) | UNSAT | yes |
| P-DOM | UNSAT (DRAT verified) | UNSAT | yes |
| P-EI34 | UNSAT (DRAT verified) | UNSAT | yes |
| P-COVER | UNSAT (DRAT verified) | UNSAT | yes |

`ALL_GATES_PASS = True`. G-BASE did not come back UNSAT, so the A-spec's
"STOP and audit" branch (imported by reference into this spec's soundness
discipline) was never triggered.

### G-BASE

`base` alone: SAT, 0.015s. No shadow assumptions, no dom unit — this is the
"does the raw §1-3 clause ledger have any model at all" check, and it does,
matching the spec's own stated expectation.

### G-SHADOW (the load-bearing gate)

Source: `scratch/triapex-incidence-obstruction/check_model.py`, a 15-point
finite distance-equality/incidence shadow (POINTS 0-14; NONAPICES 0-11;
APICES {12,13,14}; three 4-point STRICT_CAPS; three 6-point RICH_CLASSES
each = one strict cap ∪ the other two apices; 12 four-point SHELLS; a
BLOCKER array assigning each of the 15 points a shell/center). Its own
`findings.md`-equivalent narrative lives in
`docs/solve-prompts/2026-07-28-e-round1-response.md` §"Exhaustive structural
check", which re-derives the same shadow and states it "realizes the main
finite-incidence content simultaneously" (caps, rich classes, exact rows,
source-in-own-row, blocker/apex separation, ≤2 shell intersections, no
proper K4 subcarrier) — i.e. this is the intended, already-audited shadow
for the E package.

**Point-by-point label mapping** (7 E-labels → shadow points; all other
shadow points are unlabeled/free):

| E label | Shadow point | Role in the shadow |
|---|---|---|
| a0 | 12 | apex 0; its rich class Γ(12,r) = STRICT_CAPS[0] ∪ {13,14}, i.e. cap 0 is *opposite* a0 — matches a0's surplus-apex role |
| a1 | 13 | apex 1; Γ(13,r) = STRICT_CAPS[1] ∪ {12,14} = {4,5,6,7,12,14} |
| a2 | 14 | apex 2; Γ(14,r) = STRICT_CAPS[2] ∪ {12,13} = {8,9,10,11,12,13} |
| x1 | 4 | ∈ STRICT_CAPS[1] = C_{i1}° (the cap opposite a1) |
| x2 | 5 | ∈ STRICT_CAPS[1], distinct from x1 |
| qb | 6 | ∈ STRICT_CAPS[1] and ∈ Γ(a1,r) — plays the frontier-pair role |
| wb | 7 | ∈ STRICT_CAPS[1] and ∈ Γ(a1,r), distinct from qb |

`ρ0` is instantiated as the shadow's rich radius `r`, so
`G1 = Γ(a1,ρ0) = {4,5,6,7,12,14}` (size 6) — all four of x1,x2,qb,wb are
literal members of `STRICT_CAPS[1] = {4,5,6,7}`, exhausting it exactly (no
eq-atom coincidence needed among the four; all six eq atoms are asserted
False = generic position).

**Assumption-by-assumption derivation** (every literal in
`smoke.py::shadow_assumptions`, cross-checked against `check_model.py`'s
arrays):

- **eq atoms** (all 6 False): the seven mapped points {4,5,6,7,12,13,14}
  are pairwise-distinct integers — no coincidence chosen.
- **Caps**: `inO1i(qb)=inO1i(wb)=True` — qb=6, wb=7 are literal members of
  `STRICT_CAPS[1]`, the same cap interior as x1,x2 (whose `inO1i` is
  already a hard base unit from (E4.3); qb/wb's placement is *not* a base
  unit and needs this assumption). `¬inSig(qb),¬inSig(wb)` are already
  hard base units.
- **Rows**: `BLOCKER[4]=3` (from `check_model.py`'s `BLOCKER` tuple) →
  `Σ(x1) = SHELLS[3] = {0,4,10,13}`. Among the 7 labels this support
  contains x1=4 (the base unit `row1(x1)=T`) **and a1=13** — so
  `row1(a1)=True` is a genuine (if geometrically unusual) shadow fact, not
  invented; a0=12, a2=14, x2=5, qb=6, wb=7 are all absent, giving
  `row1(a0)=row1(a2)=row1(x2)=row1(qb)=row1(wb)=False`. `BLOCKER[5]=8` →
  `Σ(x2) = SHELLS[8] = {1,5,9,11}`; among the 7 labels only x2=5 itself
  (base unit `row2(x2)=T`) is present, so all other `row2(·)` on tracked
  labels are False.
- **Blocker map**: `BLOCKER[4]=3` (unlabeled) → `b(x1,OUT)=True`;
  `BLOCKER[5]=8` (unlabeled) → `b(x2,OUT)=True`; `BLOCKER[6]=5=x2` → a
  **real labeled incidence** `b(qb,x2)=True`; `BLOCKER[7]=2` (unlabeled) →
  `b(wb,OUT)=True`.
- **Non-robust centers**: `notRob(x2)=True` is already *entailed* by
  (EN1)'s base clause given `b(qb,x2)=True` above (not asserted
  separately — verified: dropping it from the assumption list still gives
  the same SAT verdict with `notRob(x2)` derived True in the decoded
  model). The shadow's `BLOCKER` array additionally shows every one of the
  12 non-apex points (0-11) appears as *some* source's center (the fiber
  set `{BLOCKER[i] : i}` is exactly `{0,...,11}`) — i.e. x1=4 (fibers at
  sources 1 and 8), qb=6 (fiber at source 11), and wb=7 (fiber at source
  3) are *also* non-robust in this concrete model. This is strictly more
  than (EN1) alone derives from the tracked labels (EN1 only sees the one
  `b(qb,x2)` incidence); asserted as `notRob(x1)=notRob(qb)=notRob(wb)=True`
  — a genuine, directly-checkable (not invented) shadow fact, included for
  a maximally faithful total mapping.
- **CD projections**: the only class coradial about a1 avoiding {qb,a1} in
  this shadow is `Γ(a1,r)\{a1,qb} = {4,5,7,12,14} = {x1,x2,wb,a0,a2}` (5
  points); B₁ must be a genuine 4-subset, so B₁={x1,x2,wb,a0} (excludes
  a2) — `qs1(a0)=qs1(x1)=qs1(x2)=qs1(wb)=True`, `qs1(a2)=False`. The only
  class coradial about a2 avoiding {qb,a2} is
  `Γ(a2,r)\{a2} = {8,9,10,11,12,13}`, of which `{8,9,10,11}` (all
  unlabeled) is already a full 4-subset — B₂ touches none of the 7 labels,
  so `qs2(p)=False` for every tracked label.
- **Arm selectors**: `nG1=6 ∉ {4,5}`, so `e24b` (which would force
  `nG1≤5`) must be False; `e24a=True` satisfies the (ES1) disjunction.
  Each (E8.i) rich-interior pattern holds in arm (a) in this shadow
  (`|Γ(a1,r)∩C1°|=4`, likewise at a2 and a0, all exactly the 4-point
  strict caps) — `e81_a=e82_a=e8s_a=True`, the `_b` arms left as a definite
  False (a single-arm total witness; nothing forces this choice, it just
  makes the assignment fully pinned rather than leaving a live disjunct).
- **Integer layer**: `nSig=nO1=nO2=4` (each strict cap has exactly 4
  interior points) — `n` is left to be *derived* via (EI1) rather than
  asserted, and the decoded model confirms `n=15`. `nN=12` (all 12
  non-apex points, matching the `notRob` facts above), `nG1=6`
  (`|Γ(a1,r)|`), `nG1O1=4` (`|Γ(a1,r)∩C1°|`) are asserted directly — no
  base clause pins their exact values, only inequalities.

**Left genuinely free** (no assumption, per spec's "leave unmappable
families free" instruction): `g1(a0)`, `g1(a2)` (spec: "NO exactness" for
g1 — no clause exists to pin these even though the shadow's `a0,a2` do lie
on `Γ(a1,ρ0)` under this choice of ρ0; asserting them would be harmless but
is not required by any clause, so left to the solver; orchestrator
validation re-ran the gate with `g1(a0)=g1(a2)=T` asserted — still SAT),
`dom1`, `dom2`
(both `¬row1(x2)` and `¬row2(x1)` already hold unconditionally in this
witness, so the (E4.5) disjunction is satisfiable by either, both, or a
solver-chosen single arm — the decoded model below shows the solver picked
both True).

**Decoded G-SHADOW model** (`out/smoke/g_shadow.model.json`, non-integer
true atoms):

```
b(qb,x2)  b(wb,OUT)  b(x1,OUT)  b(x2,OUT)
dom1  dom2
e24a  e81_a  e82_a  e8s_a
g1(a0)  g1(a2)  g1(qb)  g1(wb)  g1(x1)  g1(x2)
inO1i(qb)  inO1i(wb)  inO1i(x1)  inO1i(x2)
moser(a0)  moser(a1)  moser(a2)
notRob(qb)  notRob(wb)  notRob(x1)  notRob(x2)
qs1(a0)  qs1(wb)  qs1(x1)  qs1(x2)
row1(a1)  row1(x1)  row2(x2)
```

Integer layer: `n=15, nSig=4, nO1=4, nO2=4, nN=12, nG1=6, nG1O1=4` —
exactly the values asserted or derived above; `n=15` is *derived*
(matches the spec's stated expectation "n=15" verbatim), confirming (EI1)
is wired correctly. All other atoms not listed are False (including every
`eq(·,·)`, `e24b`, `e8*_b`, every unlisted `row1/row2`, every unlisted
`qs1/qs2`, `moser(qb)`/`moser(wb)` [both eq(·,a0) are False]).

**Independent regression check** (not a formal spec probe, verifying the
spec's "Derived n≥15" claim in §3): `base + (n≤14 via unary negation)` is
UNSAT with a verified DRAT proof — confirming (EI1)+(EI2) alone,
*without* the shadow assumptions, already force n≥15 in every base model.

### G-PROBES

Command produces `out/smoke/g_probe_<name>.{cnf,drat}` for each; all five
verified UNSAT with `drat-trim`.

| Probe | Assumption | Verdict | DRAT |
|---|---|---|---|
| P-EBM3 | `base + b(x1,a1)` | UNSAT | verified |
| P-ER2 | `base + row1(a0) & row1(a1) & row1(a2)` | UNSAT | verified |
| P-DOM | `base + ¬dom1 & ¬dom2` | UNSAT | verified |
| P-EI34 | `base + e24b & e81_a & (nG1O1≤3)` | UNSAT | verified |
| P-COVER | `base + (n≥16) & (nN≤3)` | UNSAT | verified |

P-EI34's `nG1O1≤3` is asserted via `EEncoder.le_clauses`, banning every
unary value 4..24 directly (not a Sinz counter — the integer layer is
already a direct one-hot/exactly-one encoding, so "≤3" is just "ban the 21
values above 3"). P-COVER's `n≥16` similarly bans values 0..15 via
`EEncoder.ge_clauses`; combined with the base `n≤4·nN` clause and `nN≤3`,
`n≥16 > 4·3=12` is a direct arithmetic contradiction, exactly as the spec's
own justification for P-COVER states.

### (EQ4) no-triangle verification (spec §1)

The spec explicitly asks to "verify whether any label triple has all three
eq atoms; if none, the schema is a documented no-op." The E package's six
eq atoms form two disjoint stars — `{eq(x1,qb),eq(x1,wb),eq(x2,qb),
eq(x2,wb)}` (a bipartite K₂,₂ between {x1,x2} and {qb,wb}) and
`{eq(qb,a0),eq(wb,a0)}` (a star at a0) — sharing only the vertices qb,wb,
with **no** third edge closing any triangle (there is no `eq(x1,x2)`, no
`eq(qb,wb)`, no `eq(x1,a0)`/`eq(x2,a0)`). `encoding.py`'s `_build_eq_
consistency` runs the generic (EQ4) triangle-search loop over all
`C(7,3)=35` label triples anyway (structural parity with the A spec's
schema, and a live regression check rather than a hand-argued claim); it
finds **0** triangles and emits **0** clauses
(`encoder.eq4_triangles_found == 0`, checked directly by `smoke.py`'s
`check_eq4_no_triangle`). **Confirmed: (EQ4) is a no-op for this package.**

## 2. Verdict runs (spec §4)

Command: `uv run python census/frontier-packages/e_core/run.py`

| Run | Verdict | Vars | Clauses | Wall |
|---|---|---:|---:|---:|
| base | SAT | 551 | 18080 | 0.015s |
| base+dom1 | SAT | 551 | 18081 | 0.015s |
| base+dom2 | SAT | 551 | 18081 | 0.015s |

All three SAT, matching the spec's stated expectation (base is "the
package verdict run" — E has one leaf, no deltas). The two arm-isolation
runs confirm neither `dom1` nor `dom2` alone is contradictory with the rest
of the base clause set (an UNSAT arm would have been "a real one-arm
kill" per spec §4 — neither arm kills).

### Decoded models (arbitrary CaDiCaL witnesses, unconstrained beyond the
run's own unit)

`base` (`out/base.model.json`), non-integer true atoms:

```
b(qb,x2)  b(wb,x2)  b(x1,x2)  b(x2,OUT)
dom1
e24a  e24b  e81_a  e81_b  e82_a  e82_b  e8s_a  e8s_b
eq(a0,qb)  eq(wb,x1)
g1(a0)  g1(a2)  g1(qb)  g1(wb)  g1(x1)  g1(x2)
inO1i(wb)  inO1i(x1)  inO1i(x2)
moser(a0)  moser(a1)  moser(a2)  moser(qb)
notRob(wb)  notRob(x1)  notRob(x2)
qs1(a0)  qs1(a2)  qs1(wb)  qs1(x1)  qs1(x2)
qs2(a0)  qs2(a1)  qs2(wb)  qs2(x1)  qs2(x2)
row1(a0)  row1(a1)  row1(qb)  row1(wb)  row1(x1)
row2(a0)  row2(a1)  row2(qb)  row2(wb)  row2(x1)
```

Sanity note: this witness sets `eq(a0,qb)=True` (a0 coincides with qb) and
`eq(wb,x1)=True` (wb coincides with x1) — both are logically permitted
coincidences under the base clauses alone (no shadow assumptions pin
generic position here) and correctly trigger (EQ3) congruence
(`moser(qb)=True` follows from `eq(qb,a0)` + `moser(a0)=True`, visible
above). This is an arbitrary satisfying assignment, included only to show
the base run is non-degenerate; the audited, hand-derived witness is
G-SHADOW above.

`base+dom1` differs from `base` only in forcing `dom1=True` (already true
in the arbitrary `base` witness above, so CaDiCaL reused a structurally
similar model, additionally setting `row1(x2)=False` — consistent with
`dom1 → ¬row1(x2)`, though row1(x2) was already absent/False in the base
witness too). `base+dom2` forces `dom2=True` and correspondingly keeps
`row2(x1)` False (`row1(x2)=True` appears instead, unconstrained by dom2).
Full JSON: `out/base+dom1.model.json`, `out/base+dom2.model.json`.

## 3. Per-family clause/variable counts

Measured by instrumenting the build sequence (each `_build_*` method's
before/after variable and clause counts).

| Family (spec tag) | Method | New vars | New clauses |
|---|---|---:|---:|
| eq atoms (§1) | `_build_eq` | 6 | 0 |
| moser(p) | `_build_moser` | 7 | 9 |
| (CAP1)/(CAP2) + units | `_build_cap` | 21 | 53 |
| g1(p) (frontier class) | `_build_g1` | 7 | 5 |
| row1/row2 + (ER1)/(ER2) | `_build_rows` | 54 | 78 |
| dom1/dom2 (E4.5) | `_build_dom` | 2 | 3 |
| b(x,y) + (BM1)/(BM2)/(EBM3)/(EBM4)/(EBM5) | `_build_blocker` | 64 | 139 |
| notRob(p) + (EN1) | `_build_notrob` | 7 | 31 |
| qs1/qs2 (CD projections) | `_build_cd` | 14 | 8 |
| (ES1)/(ES2) arm atoms | `_build_arms` | 8 | 4 |
| integer layer (EI1-EI5) | `_build_integers` | 351 | 17509 |
| (EQ1)-(EQ4) consistency | `_build_eq_consistency` | 10 | 241 |
| **Total** | | **551** | **18080** |

The integer layer dominates the clause count: seven `MAXN=24` (25-value)
unary/one-hot variables, each needing its own Sinz exactly-one encoding,
plus (EI1)'s full `25×25×25` combinatorial cube (the same discipline
`a_core`'s (N1) uses, and for the identical reason — see that file's
comment: closing the "overflow" half of the equality, not just the forward
implication) and (EI3)'s two `25×25` inequality grids (`n≤4·nN`, `nN≤n`).
`a_core`'s own base run has a comparable total (18858 clauses) from only
four integer vars (`nSig,nO1,nO2,n`) versus E's seven — the dominant cost
in both encoders is the `MAXN=24` unary/one-hot machinery itself (each var
independently needs its own ~24-clause Sinz exactly-one plus its role in
the equality/inequality grids), not the label-family clause count.

## 4. Spec concerns / ambiguities

### 4.1 (EBM4) y-domain — AMBIGUITY, resolved by A-spec precedent

Spec line (verbatim): `"(EBM4) [(E4.4)]: ¬b(x1,y) ∨ ¬b(x2,y) per y."` The
range of `y` is not restricted in the text, which formally includes `OUT`
(`b(x,OUT)` = "x has no blocker among the 7 labels"). (E4.4) proves only
`c(x1) ≠ c(x2)` as **witness points** in A; both blockers being unlabeled
simultaneously (`b(x1,OUT) ∧ b(x2,OUT)`, which is exactly what the
G-SHADOW witness above uses) is not excluded by that fact and would be an
unsound over-constraint if encoded. The A spec's own implementation
(`a_core/encoding.py`, `_build_blocker`) resolved the **identical**
ambiguity for its (BM7)/(BM8)/(BM9) — "for each y" with the same formal
OUT-inclusion issue — to LABELS only, logged as an AMBIGUITY comment.
`e_core/encoding.py::_build_blocker` applies the same resolution here:
`y` ranges over the 7 LABELS only, excluding OUT. Confirmed sound and
necessary: the G-SHADOW witness (`b(x1,OUT)=b(x2,OUT)=True`
simultaneously) would be **unsatisfiable** under the unrestricted (`y`
includes OUT) reading, since that reading would directly forbid
`b(x1,OUT) ∧ b(x2,OUT)` — and this witness is a real, hypothesis-faithful
shadow instantiation, not a constructed edge case.

### 4.2 CD projections (qs1/qs2) carry no cardinality clause — spec characteristic, not a gap

Unlike the A spec's (CD2) (`|B_i|=4` via at-most-4 Sinz over a tracked
pairwise-baked-distinct domain), the E spec's CD-projection paragraph gives
**only** `¬qs1(a1)`, `¬qs2(a2)`, eq congruence, and the at-most-2 product
bound over `{x1,x2}` — no clause anywhere pins `|B1|` or `|B2|` to any
particular size, even though a pairwise-baked-distinct 5-set
`{a0,a1,a2,x1,x2}` exists in `QS_DOMAIN` that *could* have carried an
analogous at-most-4 clause (mirroring `a_core`'s CD2 over its
`SHELL_GROUP`). The spec's own framing — `"Thin — tagged for honesty,
near-zero pruning expected"` — reads as a deliberate author choice, not an
omission needing repair; per the "no improvised clause families" change-
control rule, `encoding.py` implements exactly what §2's CD-projections
paragraph states and nothing more. Flagged here as a documented spec
characteristic rather than a blocking gap. (Confirmed empirically: the
`qs1(a2)` assumption in G-SHADOW had to be asserted *explicitly* by the
implementer's chosen B₁={x1,x2,wb,a0}; without it, the atom is genuinely
free and CaDiCaL initially set `qs1(a2)=True` too — a harmless 5-element
`qs1` true-set, since no clause bounds its size.)

### 4.3 (E9) low-hit — confirmed NOT encoded, per spec

Spec §3: `"(E9) low-hit: ... NOT encoded; this is the honest boundary of
Layer 1 and the first CEGAR target ... Record in backlog."` No `(E9)`
clause exists anywhere in `encoding.py` — confirmed by inspection (no
atom family references "hit counts" or class-member labels for G1 beyond
the four g1 units). This is spec-mandated, not an implementation gap.

## 5. Backlog (spec §6, restated for this package)

Sound omissions carried forward from the spec's own change-control
section, none encoded here:

- (E9) low-hit beyond the four degenerate g1-unit instances — needs
  class-member labels for G1 (first CEGAR target if this package is
  refined further).
- (E4.5)'s K4-survival conjuncts (no projection at this layer).
- (E3.5)/(E2.2)/(E2.5) K4 facts about unlabeled witnesses.
- (E3.1) minimality; (E3.2) noM44.
- (E6.1)-(E6.3) beyond their use in (EBM3) (rich-structure witnesses are
  unlabeled).
- (E7) items 2-3 beyond (EBM3) (functional-cover structure is Layer-2).

## 6. Implementation notes (decisions with no live spec ambiguity)

- **(EI4)'s conjunctive trigger.** `e24b ∧ e81_a → nG1O1≥4` needs a
  two-literal antecedent; `_build_integers` introduces one AND-helper atom
  (`and_e24b_e81a`) exactly as `a_core`'s (CD3) introduces `and_*` atoms
  for its overlap-bound antecedents — a standard CNF technique, not a
  content deviation.
- **(ES1)'s `nG1≤5` half** is deferred from `_build_arms` (which only
  creates `e24a`/`e24b` and asserts the disjunction) to `_build_integers`
  (after the `nG1` integer variable exists) — a pure build-ordering
  detail, both halves of (ES1) are present in `base`.
- **P-EI34/P-COVER's integer-layer assumptions** use `EEncoder.ge_clauses`/
  `le_clauses`, small helpers mirroring `a_core`'s `_ge_clauses` (ban
  values below a threshold / above a bound in the one-hot integer
  encoding) without mutating `self.cnf` — needed because these are
  probe-only assumptions, not base clauses.
