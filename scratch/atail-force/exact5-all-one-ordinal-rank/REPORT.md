# Exact-five card-13 all-one ordinal-rank decision

Date: 2026-07-22

Status: **ALL THREE FULL GENERATED CNFS ARE DRAT-VERIFIED UNSAT.  A
7,256-ASSERTION SOURCE PROJECTION HAS ALSO BEEN REBUILT IN ALL THREE ORBITS AND
EACH EXACT LEAN-EMITTED CNF HAS A KERNEL-CHECKED LRAT ENDPOINT.  SOURCE BOOLEAN
COMPOSITION REMAINS; NO LIVE DECLARATION IS CLOSED YET.**

## Decision

`all_one_ordinal_rank.py` combines the card-13 B0 parent projection with one
shared ordinal rank for every unordered carrier distance.  Every represented
selected row and the complete exact-five second-apex shell contribute guarded
rank equalities.  For every cyclic quadruple, cancellation in either strict
Kalmanson inequality contributes the corresponding strict rank comparison.

The three physical-hub orbits are all UNSAT:

| Orbit | CNF variables | CNF clauses | CaDiCaL time | DRAT check |
| --- | ---: | ---: | ---: | --- |
| `allOneHitHubLeft` | 54,851 | 409,442 | 207.19 s | `VERIFIED` in 89.75 s |
| `allOneHitHubMiddle` | 54,874 | 410,309 | 286.13 s | `VERIFIED` in 132.59 s |
| `allOneHitHubRight` | 54,897 | 411,083 | 238.06 s | `VERIFIED` in 116.18 s |

The exact CNF hashes are recorded in `*.cnf.json`, the solver verdicts and
proof hashes in `*.cadical.json`, and the independent checks in
`*.drat-check.json`.  Each `*.drat-trim.log` contains `s VERIFIED`.

`trim_to_lrat.py` also emitted checked core CNFs and LRAT files:

| Orbit | Core clauses | Core CNF | LRAT |
| --- | ---: | ---: | ---: |
| left | 74,115 | 1.54 MiB | 314.4 MiB |
| middle | 85,334 | 1.76 MiB | 433.2 MiB |
| right | 76,239 | 1.58 MiB | 399.4 MiB |

These are usable replay inputs, but they are larger than the asymmetric
card-13 certificates.  The next reduction should therefore select a smaller
core at the 45,865 source-assertion level before generating the Lean circuit;
the Tseitin clause cores are not a substitute for that source-level audit.

`extract_source_core.py` tested the direct Z3 assumption-core route for 600
seconds per orbit.  All three results are `UNKNOWN` with reason `canceled`;
the exact bounded outcomes are saved as `left.source-core.json`,
`middle.source-core.json`, and `right.source-core.json`.  No source core was
returned.  This is a solver limitation, not evidence against the verified
CNF refutations.

The subsequent guarded-DIMACS route succeeded. A default CaDiCaL run on the
middle guarded formula returned `UNSAT`, and `drat-trim` independently
verified the 1.17 GB proof. Its backward clause core retains 7,256 of the
45,865 positive source markers:

| Source family | Retained | Available |
| --- | ---: | ---: |
| base parent/geometry | 1,952 | 37,361 |
| rank bounds | 76 | 78 |
| selected-row rank equalities | 810 | 2,640 |
| exact-five shell rank equalities | 18 | 66 |
| Kalmanson cancellation | 4,400 | 5,720 |

`middle.source-core.from-drat.json` records the source indices and exact
expressions. `transport_source_core.py` rebuilds the same indices in the left
and right encoders without pretending that source-index transport preserves
a verdict. Each transported core was instead emitted independently through
the Lean `BVLogicalExpr` generator. All three resulting exact Lean CNFs are
UNSAT, and their direct LRAT certificates now pass the authoritative Lean 4.27
kernel checker. Thus the 7,256-assertion projection has been independently
validated at the actual formal endpoint, not merely inferred from the guarded
clause core.

This supersedes the earlier bounded `UNKNOWN` status for the monolithic Z3
QF_FD runs and the non-covering literal CEGAR bank.  It does not retroactively
turn either of those earlier runs into a proof.

### Optional guarded-core refinement

The 7,256 retained source assertions were also re-encoded as a marker-guarded
subset CNF with 46,623 variables and 229,868 clauses (SHA-256
`c5bd2e92d81b20d901168a6c8e5e7e2afd6efe4b3a9f67d8252c4f699efdd7a4`).
Two proof-producing CaDiCaL runs (default and `--unsat --seed=22`) each
returned `UNKNOWN` at 1,800 seconds.  A search-only portfolio with seeds
`1, 7, 13, 29, 41, 53, 67, 83` likewise returned eight bounded `UNKNOWN`
results at 1,200 seconds each.  No SAT result or smaller guarded core was
obtained.  These are solver-budget outcomes only; they neither weaken nor
replace the three kernel-checked 7,256-assertion endpoints.

## Source-fidelity audit

The encoded implications are necessary consequences of the current source
surface:

1. Exact card 13 has the canonical `(5,6,5)` boundary placement with strict
   physical points labeled `1,2,3`, first apex `4`, and second apex `8`.
2. The hub of `PhysicalGlobalCrossDeletionStar` is one of `1,2,3`; these are
   exactly the left, middle, and right orbit files.  The two cover tables are
   kept independent away from the fixed blocker image.
3. `AllPhysicalActualCriticalRowsOneHit` supplies the one-physical-hit actual
   blocker rows represented by the all-one orbit constraints.
4. The main row table, both cover-row tables, complete exact-five shell,
   frontier pair, and retained first-apex double-deletion row are the same
   source-faithful semantic objects used by the audited card-13 parent gate.
5. A genuine source configuration can assign each of the 78 distance atoms
   its ordinal among the distinct real distances.  Seven bits and the bound
   `< 78` suffice.  Selected co-radial points receive equal ranks, and strict
   Kalmanson cancellation gives exactly the encoded unsigned rank comparison.

The generated formula is actually weaker than the documented B0 surface in
one useful respect.  `Outer.solve` adds selected-row strong-connectivity cuts
only after decoding a model.  `all_one_ordinal_rank.build` copies the initial
`Outer` assertions and therefore includes no connectivity cut for `m`, `g0`,
or `g1`.  UNSAT of this weaker formula remains sound and makes those omitted
minimality consequences unnecessary for this decision.

Two possible engineering reductions were audited but deliberately not added
to the verified v1 artifacts:

- `frontier_q < frontier_w` is an exact automorphism of this projected formula
  because every encoded occurrence of `q` and `w` is symmetric, even though
  the production source gives `q` a distinguished name.
- strong connectivity can be stated directly by all 8,190 nonempty proper
  outgoing cuts for each of `m`, `g0`, and `g1` (24,570 cuts total).

Both are source-valid for satisfiability checking, but neither is needed:
the unstrengthened formulas already have verified refutations.  Preserving the
exact v1 CNFs avoids invalidating their hashes and certificates.

## Epistemic boundary and next step

What is established now is:

> **DRAT-VERIFIED EXTERNAL RESULT.** Each of the three generated propositional
> CNFs is UNSAT, and every source configuration satisfying the audited finite
> projection and ordinal-rank consequences would have produced a model of one
> of them.

In addition, the retained 7,256 source assertions have been rebuilt in the
left, middle, and right orbits, compiled by Lean's verified
`BVLogicalExpr -> AIG -> CNF` path, and refuted by LRAT certificates accepted
by the authoritative Lean 4.27 kernel.  Those three finite endpoints contain
no `sorryAx`.

What is not yet established is the source-level geometric contradiction. The
semantic ingress supplies the actual rows, blocker map, exact-five shell,
frontier roles, first-apex row, ranks, and Kalmanson inequalities. The complete
generated adapter inventory contains 1,952 base assertions and 5,304
rank/Kalmanson assertions, for 7,256/7,256 obligations. The middle source
composition is kernel-checked through all 114 chunks; its final contradiction
has no `sorryAx`. The remaining closure path is therefore:

1. transport the three orbit-specific cover assertions and compose the left
   and right kernel endpoints; and
2. dispatch on the original-frame three-way hub-orbit packet.

The newer guarded-subset runs may reduce certificate size, but they are an
optional engineering refinement rather than a prerequisite for this proof
route.

This result addresses only the all-one arm at exact card 13.  The separate
asymmetric distinct-radius arm and card-at-least-14 branch remain independent
closure obligations.

## Reproduction

The three CNFs were exported with `bitblast_all_one_cnf.py`, solved with
`run_cadical.py`, and checked with:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/exact5-all-one-ordinal-rank/check_drat.py \
  --cnf scratch/atail-force/exact5-all-one-ordinal-rank/left.cnf \
  --proof scratch/atail-force/exact5-all-one-ordinal-rank/left.drat \
  --log scratch/atail-force/exact5-all-one-ordinal-rank/left.drat-trim.log \
  --output scratch/atail-force/exact5-all-one-ordinal-rank/left.drat-check.json
```

Use `middle` and `right` in place of `left` for the other two orbits.
