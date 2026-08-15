# Exact-card-12 pentagon off-class metric probe — 2026-08-06

## Verdict

There is **no UNSAT result** and no universal closure.

| layer | result | meaning |
|---|---|---|
| Existing `../pentagon-offclass-model` | **SAT incidence** | Its own 12-label incidence abstraction verifies, but it is not an exact instance of the active Lean packet. |
| This directory's bounded metric core | **SAT local metric core** | An explicit rational planar witness satisfies every item in the ENCODED ledger below. |
| Unpinned `probe.smt2` | **Z3 SAT; cvc5 UNKNOWN (30 s timeout)** | Z3 found the semialgebraic conjunction feasible. cvc5's timeout is not a verdict. |
| Witness-pinned `probe.smt2` | **Z3 SAT; cvc5 SAT** | Both engines accept the exact rational witness after all coordinates are pinned. Independent `Fraction` replay checks the source-level predicates. |
| Exact-card-12 active Lean anchor | **UNKNOWN** | The omitted cap, convexity, K4, deletion, and completeness data are load-bearing. |

The constructive SAT result says that the physical five-circle, the two named
fixed-center shells, exact local bisector filters, and the proposed forced
four-point order do **not** contradict one another at cardinality 12. It does
not construct a `CounterexampleData`, refute the Lean theorem, or discharge its
`sorry`.

## Source audit and scope

The active target is
`false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
in `Rigid221SourceHeavy.lean:3591-3663`. Its context has only
`12 ≤ D.A.card` (`Rigid221Placement.lean:705-745`), so **exact card 12 is a
specialized residue introduced by this probe**, not the target's current
cardinality hypothesis.

The exact source-heavy packet (`Rigid221SourceHeavy.lean:52-79`) supplies:

- physical class `C = {u,xu,deleted,v,xv}`;
- `row(u) ∩ C = {u,xu}` and `row(v) ∩ C = {v,xv}`;
- actual blocker of `row(u)` equal to `xv`;
- `u,xu` in the strict second-cap interior.

The target additionally supplies `u ∈ row(xv)`, blocker `c = centerAt(xv)` in
the strict second-cap interior, `c ∉ C`, and the class-trace bounds for
`row(xv)` and `row(xu)` (`Rigid221SourceHeavy.lean:3599-3661`).

The deep-thinker response proposes two further derived APIs, but they are not
currently hypotheses or proved declarations in the live source:

- exact carrier-bisector saturation for `{u,xv}` (`response...md:90-145`);
- the forced second-cap order `u<c<xv<xu` or its reversal, after adding a
  `CGN.MecCapPacket`, `MinorCapSideHypotheses`, and `StrictCapOrder`
  (`response...md:199-253`).

This probe tests one orientation of that proposed local order. It does not
pretend that two turn signs and a projection chain replay the full Lean
`CGN.StrictCapOrder` structure.

## Why the existing incidence model is only a seed

`verify.py` reads `../pentagon-offclass-model/model.json` and confirms these
three exact-anchor mismatches:

| datum | existing model | exact Lean packet |
|---|---|---|
| `row(u) ∩ C` | `{u,xv}` | `{u,xu}` |
| `row(v) ∩ C` | `{v,deleted}` | `{v,xv}` |
| blocker of `row(u)` | `xu` | `xv` |

The old model remains a valid **SAT incidence** result for its documented
abstraction and provides the twelve labels. It is not a countermodel to the
exact pentagon anchor and its row supports were not copied into the metric
encoding.

## ENCODED ledger

All polynomial checks are over exact squared distances.

1. Exactly twelve pairwise-distinct named rational carrier points.
2. Gauge `O=h=(0,0)`, `rho²=1`, `xv=(1,0)`.
3. Exact finite physical filter among the twelve points:
   `dist²(O,q)=1` iff `q∈{u,xu,deleted,v,xv}`.
4. Exact finite shell centered at `xv`:
   `{q : dist²(xv,q)=dist²(xv,u)}={u,xu,e,f}` with radius squared `4/5`.
   This realizes the exact source row and blocker identity.
5. Exact finite shell centered at off-class `c`:
   `{q : dist²(c,q)=dist²(c,u)}={u,xv,a,b}` with radius squared `2/5`.
6. `c` is outside the physical class/circle.
7. Exact carrier bisectors in the twelve-point universe:
   `Bis(u,xu)={O,xv}` and `Bis(u,xv)={O,c}`. The second is the proposed
   deep-thinker saturation; the first is its analogous physical/source-edge
   saturation.
8. One orientation of the proposed order, certified by projection along
   `u→xu`: `0 < 8/25 < 32/25 < 64/25`, plus consecutive signed turns
   `-2/5 < 0` and `-2/25 < 0`.

The SMT formula is an unpinned QF_NRA search problem. The JSON coordinates are
not asserted there by default. `solver_check.py` separately appends coordinate
equalities in memory for a cross-engine pinned replay.

## OMITTED ledger

These omissions are why the full anchor remains **UNKNOWN**:

- `D.convex : ConvexIndep D.A` for all twelve points;
- the global `HasNEquidistantProperty 4 D.A`, hence all unnamed selected rows;
- full exact rows and actual blockers at `xu`, `deleted`, `v`, and `c`;
- the `SurplusCapPacket`, Moser triangle, MEC disk/side data, cap partition,
  `_hsecond : 6 ≤ S.oppCap2.card`, and exact interior memberships;
- full `CGN.StrictCapOrder.subchord_open_side_iff_A`; the local projection and
  turn certificate is only a geometric realization of the four-point order;
- fixed-center deletion fans, cap-complement budget, outside-pair uniqueness,
  no-`M44`, frontier/minimality, and robust-surface consumers;
- a finite-slot completeness theorem relating this chosen 12-label
  specialization to every exact-card-12 Lean configuration.

In particular, SAT here is not a Euclidean counterexample to K4. Conversely,
even an UNSAT result for this file would not imply the Lean theorem without a
proved completeness reduction and a checked certificate boundary.

## Exact witness

Coordinates are in `witness.json`. The essential named points are

```text
O=h=(0,0)       xv=(1,0)
u=(3/5,4/5)     xu=(3/5,-4/5)
c=(6/5,3/5)
```

The remaining seven rational points complete the physical circle and the two
exact four-point shells. `verify.py` recomputes every equality, inequality,
finite filter, and distinctness condition using `fractions.Fraction`; it also
rejects three targeted witness mutations.

## Replay

From the repository root:

```bash
uv run python scratch/pentagon-offclass-model/verify.py
uv run python scratch/pentagon-offclass-metric/verify.py
uv run python scratch/pentagon-offclass-metric/solver_check.py
```

Observed with Z3 4.17.0 and cvc5 1.3.3:

```text
SAT: explicit 12-point incidence model verified
SAT_LOCAL_METRIC_CORE: exact rational witness replayed
z3-search: SAT
cvc5-search: UNKNOWN_TIMEOUT (the replay script uses 20 seconds; the audit also timed out at 30 seconds)
z3-pinned-replay: SAT
cvc5-pinned-replay: SAT
```
