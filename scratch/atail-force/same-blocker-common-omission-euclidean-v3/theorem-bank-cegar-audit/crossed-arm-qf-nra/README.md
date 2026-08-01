# Fixed-role crossed-arm QF_NRA audit

Date: 2026-08-01

## Outcome

The three-row metric core is realizable for both crossed arms, and remains
realizable after imposing every adjacent positive turn in the survivor's
retained cyclic order.  Both SAT models replay every asserted equality and
inequality exactly in Z3.

The required exact strict-convex cyclic order is **UNKNOWN**, not UNSAT:

| arm | metric | adjacent turns | exact edge order | all-triples order |
| --- | --- | --- | --- | --- |
| `source-at-common` | SAT, 5 ms | SAT, 18.209 s | Z3 timeout; cvc5 timeout | Z3 timeout; cvc5 timeout |
| `other-at-common` | SAT, 6 ms | SAT, 26 ms | Z3 timeout; cvc5 timeout | Z3 timeout; cvc5 timeout |

Each solver call had an independent hard cap of 30 seconds.  `exact edge
order` is the 80-inequality supporting-edge characterization; `all-triples
order` is the redundant 120-inequality characterization.  Their agreement on
timeout does not constitute a mathematical verdict.

Consequently:

- neither crossed arm is excluded;
- no coordinate realization of the exact cyclic-order core has been proved;
- there is no UNSAT core to minimize;
- no universal Lean theorem should be proposed from this run; and
- the first unresolved condition is the nonlocal convex-order surface itself,
  before any omitted MEC/nonobtuse/full-terminal condition can honestly be
  blamed.

The complete pre-run assumption boundary and dimension count are in
[`LEDGER.md`](LEDGER.md); compact machine-readable results are in
[`summary.json`](summary.json).

## Fixed cores

Both cores retain ten points, 20 coordinate variables, and the gauge
`bp=(0,0)`, `P.source1=(1,0)`.  The gauge removes four similarity degrees of
freedom.  Three four-point rows give nine spanning squared-distance equations,
so the nominal post-metric dimension is seven; no algebraic independence claim
is made.

### `source-at-common`

```text
cyclic subsequence: t2, p2, p1, r2, q2, q1, r1, s1, s3, s2
bp=q1: {t2,p1,p2,s2}
bq=r1: {q1,q2,s2,s3}
br=p1: {t2,r1,r2,s1}
```

### `other-at-common`

```text
cyclic subsequence: a1, t1, t3, r1, q1, r2, p1, p2, q2, a3
bp=q1: {t1,t3,p1,p2}
bq=r1: {a1,t3,q1,q2}
br=p1: {t1,r1,r2,a3}
```

Every core also includes 45 pairwise-distinctness inequalities and 15
complementary radius disequalities against retained nonmembers.

## Incremental exact-order audit

Starting from the ten adjacent turns, the batch-one CEGAR runs reached exact
SAT models with 11 active supporting-edge inequalities in both arms.  The next
12-edge query timed out in both Z3 and cvc5:

- `source-at-common` added `orient(t2,p2,r1)>0`, then
  `orient(t2,p2,s1)>0`;
- `other-at-common` added `orient(a1,t1,q1)>0`, then
  `orient(t1,t3,r2)>0`.

These are a **solver hardness frontier**, not an UNSAT core or a theorem.  The
particular edges were selected from the current model's violations; a different
model or order of cuts can expose different edges.

A separately capped floating-point least-squares probe found no feasible seed
in its small budget.  Its failure has no infeasibility value.  The numerical
artifacts are retained only to prevent that attempt from being mistaken for an
exact solver result.

## What would come next

The fidelity-preserving next step is not to add a terminal hypothesis yet.  It
is to improve the exact-order solve, preferably by eliminating the nine row
equalities algebraically or by a certified CAD/interval decomposition of the
seven nominal free dimensions.  Only if the exact ten-point core is SAT should
the audit add, in order:

1. the seven removed carrier points and full-carrier row exactness;
2. the remaining selected rows and q-free/collision-deletion constraints; then
3. MEC/nonobtuse and the full `CounterexampleData`/`noM44` surface.

An exact UNSAT result would instead need a minimized metric/order core and an
independently checkable certificate or a direct algebraic proof before it is a
candidate for Lean formalization.

## Artifacts and reproduction

- `crossed_arm_qf_nra.py`: structural gate, QF_NRA generator, bounded Z3/cvc5
  runner, exact model replay, and incremental edge CEGAR.
- `numerical_seed.py`: explicitly heuristic floating-point probe.
- `self-check.json` and `smoke-results.json`: source mapping and known
  SAT/UNSAT solver checks.
- Each arm directory contains stage JSON, exact SMT2, incremental CEGAR
  artifacts, and the bounded numerical result.

From the repository root:

```bash
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/crossed_arm_qf_nra.py --self-check
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/crossed_arm_qf_nra.py --smoke
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/crossed_arm_qf_nra.py --arm source-at-common --stage edge-convex --timeout-ms 30000
uv run --offline python scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/crossed_arm_qf_nra.py --edge-cegar --arm source-at-common --timeout-ms 30000 --max-checks 4 --batch-size 1 --cegar-output-dir scratch/atail-force/same-blocker-common-omission-euclidean-v3/theorem-bank-cegar-audit/crossed-arm-qf-nra/source-at-common/cegar-batch1
```

This is external bounded evidence only.  No Lean source, project documentation,
build, kernel gate, proof-blueprint state, or axiom surface was changed.
