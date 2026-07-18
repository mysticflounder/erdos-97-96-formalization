# Prose-backup match against the period-three A-TAIL surface

Date: 2026-07-17

Backup audited:

```text
/opt/nfs/front-a-closure-backup-20260718T025149Z/
```

Live target:

```lean
false_of_periodThree_allReverse_firstApexRows
    (P : FirstApexShellRolePacket F0 R)
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hperiod : K.period = 3)
    (hreverse : AllReverseMembership K) : False
```

Status: **THE BACKUP DOES NOT CONTAIN THE PERIOD-THREE CLOSER. LEMMAS 223
AND 230 MATCH EVERY ACTUAL REVERSE ROW EXACTLY, BUT THEY REPRODUCE THE
ALREADY-CHECKED STRADDLING ORDER. THE ROUND-13 PAIR-REUSE HANDOFF ADDS ONE
REAL ROLE-DOMAIN REFINEMENT: EVERY REVERSE CRITICAL ROW OMITS
`S.oppApex2`, SO ITS TWO OUTSIDE TARGETS LIE IN THE TWO COMPLEMENTARY OPEN
BLOCKS' UNION (NOT NECESSARILY ONE IN EACH). THIS IS A USEFUL PRODUCER, NOT
`False`. LEMMA 202/COROLLARY 203 AND
LEMMA 237 STILL MISS POSITIVE CROSS-ROW INCIDENCE OR A MUCH STRONGER
ALL-EXACT-TRANSVERSE ROW POPULATION. NO PRODUCTION `sorry` IS CLOSED.**

This lane changed only this report. It did not run Lean or Lake and did not
edit production source, shared closure documents, proof-blueprint state,
`ShellCurvature`, `SurplusM44`, protected census files, or git state.

## 1. Required reuse preflight

Before classifying any backup result as a new local contradiction, this audit
checked the theorem-bank registries required by `AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered two-owner chord
alternation, a shell through the opposite MEC vertex, the six-point
shell/bisector obstruction, same-block pair localization, and exact-A
boundary-coordinate injectivity. No indexed Lean declaration supplies the
new prose lemmas or the missing period-three T0/T1-to-reverse-row incidence.
The nearest current facts remain:

- `nonempty_reverseRowCapStraddle` in checked scratch;
- `CapSelectedRowCounting.outsidePair_unique_capCenter`;
- the strict Kalmanson inequalities in `CapCrossingKalmanson`; and
- the already-mined U5 incidence consumers in the required banks.

The backup contains no `.lean` file. Its geometric lemmas are therefore
pen-and-paper inputs for formalization, not declarations importable by the
current consumer. Its finite exclusions are exact within their stated search
domains, but likewise are not kernel proofs.

## 2. Exact live normalization

For one cycle index `i`, abbreviate

```text
O  = S.oppApex2
x  = (K.source i).1
y  = (K.source (K.successorIndex i)).1
c  = reverseRowCenter K i
Qi = the exact critical support at c sourced by y
Ei = reverseOutsidePair K i.
```

Production and checked scratch give:

```text
x,y are distinct strict points of cap S.oppIndex2,
dist O x = dist O y,
c != O,
c is a strict point of the same cap,
dist c x = dist c y,
Qi intersect physicalCap = {x,y},
Qi \ physicalCap = Ei,
|Qi| = 4, and |Ei| = 2.
```

The three rows share one actual cap order. `P` independently supplies the
two selected first-apex rows T0 and T1, but it supplies no identity or
incidence between their supports and any `Qi` or `Ei`.

## 3. Immediate exact matches

### 3.1 Lemma 223: exact, but already present as straddling

Lemma 223 says that two distinct centers owning one target pair alternate
with that pair on the convex boundary. Apply it with

```text
p = O, q = c, target pair = {x,y}.
```

Every hypothesis is already available: the physical exact-five circle gives
the equality at `O`, and the all-reverse critical row gives the equality at
`c`. Hence the owner chord `O--c` alternates with `x--y`. Since `O` is the
opposite distinguished vertex and `x,y,c` lie in the open physical block,
this puts `c` strictly between `x` and `y`.

Epistemic status:

- backup Lemma 223: **PROVEN in prose and independently audited**;
- application to the live row: **exact source-role match**;
- Lean availability of the backup lemma: **none**;
- mathematical novelty for this lane: **duplicate** of the checked scratch
  `nonempty_reverseRowCapStraddle` argument, which currently derives the same
  order from one-sided cap-distance injectivity.

It has no T0/T1 conclusion and does not imply `False`.

### 3.2 Lemma 230: exact, but again only a local order producer

Lemma 230 specializes Lemma 223 to a target pair in one open block and an
outside owner. With the same roles, `O` is the outside owner and `c` is the
second owner. It gives

```text
x < c < y  or  y < c < x
```

inside the physical cap. There is no missing field for this application.
The first missing field for closure occurs *after* it: the theorem does not
relate `Ei` to T0, T1, or another reverse outside pair. Thus it constructs the
common-order row straddle but cannot consume the three rows jointly.

### 3.3 Round-13 pair-reuse handoff: one new exact role refinement

The pair-reuse handoff from
`docs/closure-round13-pair-reuse-handoff.md` applies to exactly the same
roles, now using that `Qi` is the whole four-point radius class at `c`.
It yields:

1. `c` lies between `x` and `y`;
2. `O` is not in `Qi`;
3. the other two points of `Qi` lie in the union of the two complementary
   open blocks; and
4. `Qi` is an A-type row whose own-cap fronts are exactly `x,y`.

Items 1 and the exact `2+2` cardinality were already available. Items 2--4
are the useful new normal form. In Lean-facing notation the smallest new
producer is approximately

```lean
theorem physicalApex_not_mem_reverseCriticalSupport
    (K : PhysicalActualCriticalOmissionCycle H profile)
    (hreverse : AllReverseMembership K)
    (i : Fin K.period) :
    S.oppApex2 ∉ reverseCriticalSupport K i
```

together with the resulting open-block localization of
`reverseOutsidePair K i`.

This follows in the prose stack from Lemma 11: a circle centered in the open
cap and passing through the opposite MEC vertex contains at most one point
of that cap, while `Qi` already contains the two distinct cap points `x,y`.
Corollary 12 and `|Qi| = 4` then put the other two targets in the complementary
open blocks.

This is a genuine refinement of the current quotient. In
`period-three-first-apex-kalmanson/decide_quotient.py`, the physical apex
label `1` is currently allowed in `eligible_outside`. It should be forbidden
in any repaired source quotient. However, this refinement does not close the
linear surface. The already-displayed `rho = r`, `IO` SAT representative in
`t0-t1-reverse-occurrence-audit/REPORT.md` uses

```text
{7,9}, {6,9}, {3,6}
```

as its three reverse outside pairs. None contains label `1`, and every pair
already has one point in each complementary private block. Therefore at
least that recorded finite CSS/K4/minimality representative survives the new
role restriction. It still omits the full source-complete Kalmanson/Euclidean
coupling recorded by its owning report.

Epistemic status:

- round-13 handoff: **PROVEN in prose from Lemmas 11, 12, 26, and 230**;
- live role match: **exact**;
- Lean-importable result: **none yet**;
- closure strength: **producer only**.

## 4. Plausible-looking matches which still fail

### 4.1 Lemma 202: no P/K shared incidence

Lemma 202 rejects six cyclically ordered points

```text
b, a, t, c, w, q
```

when `a` owns `{t,c,w}`, `b` owns `{c,q}`, and
`angle q w t <= pi/2`.

A tempting hybrid assignment makes `a` a reverse blocker and takes three of
`{x,y} union Ei` as `{t,c,w}`, while `b = S.oppApex1` uses T0 or T1 for the
second equality. The first absent field is already decisive:

```text
some reverse-row target belongs to T0.support or T1.support.
```

`P` and `K` are independent retained surfaces and provide no such positive
cross-row incidence. Even after adding one, the exact six-point cyclic order
and the nonobtuse angle at the selected reverse target `w` remain unproved.
H4 controls a distinguished MEC angle; it does not bound an arbitrary target
angle in Lemma 202.

Classification: **PROVEN prose consumer; no immediate producer match**.

### 4.2 Corollary 203: the reverse rows have the wrong type

Corollary 203 requires a later through-opposite row containing the opposite
MEC vertex `w`, an own-cap target `t`, and a cross target `c`, plus an earlier
row sharing `c` and carrying the required backward front.

The round-13 match above proves the opposite fact for every reverse row:

```text
S.oppApex2 ∉ Qi.
```

Thus no `Qi` can serve as Corollary 203's through-opposite first row relative
to the physical cap. T0 and T1 are centered at the first apex rather than at
an open-block source, so they do not fill that role either.

The first missing field is not bookkeeping but a genuinely additional
through-opposite row sharing a cross target with one of the named rows. No
such row is present in `P + K + hperiod + hreverse`.

Classification: **PROVEN prose consumer; direct reverse-row instantiation
is excluded by the new A-type normal form**.

### 4.3 Lemma 237 and Corollary 238: exact-A population absent

Lemma 237 assumes an entire contiguous source block

```text
a1, ..., am
```

in which every source has an exact transverse A row

```text
{Li, Ri, b_beta_i, c_gamma_i},
```

with one cross target in each complementary block, plus the full Lemma-132
supplier obstruction and two-owner alternation. It then proves boundary
coordinate injectivity for the first and last source rows.

The period-three packet has only three named reverse blocker rows. The
round-13 handoff makes each row A-type, but it does **not** force its two
outside targets to split one per complementary block, does not identify the
three blockers as every source in one contiguous block, and does not provide
the Lemma-132 supplier package.

The first missing field is the exact-transverse split

```text
|Ei ∩ B_j| = 1 and |Ei ∩ B_k| = 1
```

for every row to which the exact-A machinery is to apply. Even that would
still leave the whole-block population and boundary-source hypotheses.

Classification: **PROVEN prose theorem; no live role match**.

### 4.4 Total-11/12/13 exact-A exclusions

Propositions 232--235 and Corollary 236 are exact finite exclusions only for
the all-exact-transverse-A pairwise core at total block-center sizes 11--13.
They are not statements about three selected cycle rows and do not classify
mixed A/B/dense rows or arbitrary cardinality.

The first missing antecedent is the same global row classifier/population:
every block center must carry the exact transverse A packet used by the
finite domains. No cardinality split can be applied before that producer is
proved. These results are **finite verified within their encoded domains**,
not Lean-importable and not period-three coverage.

## 5. Round-12/13 scope guards relevant to route choice

The later round documents strengthen the negative routing conclusion:

- `closure-round12-dense-pair-localization.md` proves that a second owner, if
  present, localizes inside the target interval, but gives an infinite
  abstract critical-cover family in which every prescribed dense pair has
  only one owner.
- `closure-round13-one-owner-dense-geometry.md` gives exact rational strict
  convex/MEC/cap examples with a one-owner dense row. Local cap/MEC geometry
  at one row therefore cannot manufacture pair reuse.
- `closure-round13-h3-blocker-attachment.md` proves a cap-local blocker normal
  form, but its application first needs a deletion blocker localized to that
  cap. The period-three cycle instead records survival for the relevant
  successor deletion at the current blocker; it does not supply the required
  predecessor-closed cap deletion component.
- the completion matrix explicitly leaves O17, O18, and O19 open. The prose
  project has not eliminated arbitrary mixed/dense sink components and has
  not proved the H1--H7 nonexistence theorem.

In particular, these scope guards rule out treating Lemma 223/230 as a route
to a new repeated reverse outside pair. The physical apex already supplies a
second owner only for the *adjacent in-cap source pair*. Nothing here forces
two reverse rows, or a reverse row and T0/T1, to share an outside pair.

## 6. Exact handoff to the live period-three work

The backup changes the next source quotient in one precise way:

```text
for every reverse edge i,
  S.oppApex2 is not a reverse outside target, and
  reverseOutsidePair(i) lies in the union of the two complementary open blocks.
```

It also supplies a clean prose proof of the row-straddling packet already
drafted in scratch. The implementation-worthy order is therefore:

1. formalize the general shell-through-opposite-MEC-vertex exclusion
   (backup Lemma 11), or a narrowly scoped reverse-row specialization;
2. derive `physicalApex_not_mem_reverseCriticalSupport` and the open-block
   outside-pair localization;
3. incorporate those constraints into the source-complete period-three
   role/identity quotient; and
4. continue the actual shared-order Kalmanson/Euclidean decision.

This does not alter the terminal theorem. The first genuinely new closure
field remains a joint metric incompatibility among T0, T1, and all three
actual reverse rows, or a positive P/K incidence strong enough to instantiate
a checked terminal such as Lemma 202. The backup supplies neither.

## 7. Epistemic ledger

| Result | Status in backup | Match to live target | Lean-importable now | Closure effect |
| --- | --- | --- | --- | --- |
| Lemma 202 | PROVEN prose; independently derived; exact QF_LRA support | Missing P/K shared incidence, order, and angle | No | None yet |
| Corollary 203 | PROVEN prose; independently audited | Reverse rows have the opposite A-type/apex-omitting role | No | None |
| Lemma 223 | PROVEN prose; independently audited | Exact on every reverse edge | No; equivalent straddle is checked scratch | Duplicate producer |
| Lemma 230 | PROVEN prose; independently audited | Exact on every reverse edge | No; equivalent straddle is checked scratch | Duplicate producer |
| Round-13 pair-reuse handoff | PROVEN prose | Exact on every reverse edge | No | New apex-exclusion/open-block producer |
| Lemma 237 / Corollary 238 | PROVEN prose; independently audited | All-exact-transverse population absent | No | None |
| Propositions 232--235 / Corollary 236 | Exact finite DFS/DRAT where stated | Wrong population and bounded totals | No | Scope-only |
| O17--O19 | UNPROVEN | These contain the global closure | No | Confirms no completed proof |

Validation performed: source inspection, theorem-bank registry search,
focused indexed Lean search, and hypothesis-by-hypothesis role matching. No
Lean/Lake build, solver replay, proof-blueprint mutation, or axiom audit was
run.
