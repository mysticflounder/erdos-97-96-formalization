# Rigid221 S0 B3 exact-five factorization v1

**Status:** bounded PiQD discovery contract; no source-universal or Lean closure claim

## Objective

This contract locates the first hard constraint block in the exact-five branch of
`false_of_exactFourMutualOmissionRigid221_physicalApex_sourceEqU_blockerV_sourceRowHeavy`.
It factors the existing 1,020-assertion fixed-cell formula into append-only prefixes.

The historical formula remains a byte-regression target only. Its strict-cap order
contains `v,u,xu`, whereas the proved source betweenness puts `v` strictly between `u`
and `xu`. Active cells therefore use the two source-consistent orders `u,v,xu` and
`xu,v,u`.

## Assertion blocks

| Index | Block | Assertions | Clause class | Entitlement |
| ---: | --- | ---: | --- | --- |
| 0 | `gauge` | 9 | `ASSUMPTION_CONTROL` | fixed rational Moser control |
| 1 | `role-distinctness` | 78 | `ASSUMPTION_CONTROL` | fixed named-carrier control |
| 2 | `physical-fiber` | 13 | `ROOT_STATIC` | source data plus finite closure |
| 3 | `source-fiber` | 13 | `ROOT_STATIC` | source data plus finite closure |
| 4 | `opposite-fiber` | 13 | `ROOT_STATIC` | source data plus finite closure |
| 5 | `moser-disk` | 19 | `ASSUMPTION_CONTROL` | fixed normalization control |
| 6 | `cyclic-order` | 143 | `ASSUMPTION_CONTROL` | source-consistent fixed order |
| 7 | `exact-cap` | 72 | `ASSUMPTION_CONTROL` | selected exact-five branch and fixed cap |
| 8 | `source-deletion-multiplicity` | 330 | `ROOT_STATIC` | modeled source-facing consequence |
| 9 | `opposite-deletion-multiplicity` | 330 | `ROOT_STATIC` | modeled source-facing consequence |

The cumulative assertion counts are
`9,87,100,113,126,145,288,360,690,1020`.

Blocks 0 through 5 do not depend on the selected cyclic order and are emitted once.
Blocks 6 through 9 are emitted for both source-consistent order cells, producing
fourteen non-duplicate formulas.

## Encoded and omitted ledger

`scripts/rigid221_s0_b3_exactfive_factorization.py` records, for every cell:

- the exact included and omitted block names;
- assertion count, byte length, and SHA-256 digest;
- the chosen order cell;
- the clause class and entitlement of every block; and
- the named B3 consumer.

Every cell continues to omit:

- coverage over all Moser normalizations and cyclic orders;
- source realization of SAT assignments;
- strict-cap placement of `xv` or `centerAt(v)`;
- a q/w residual omitted from the v-indexed row; and
- Lean ingress and certificate replay.

No omitted statement may be inferred from a solver verdict.

## Static and solver gates

Before any PiQD run, the producer must pass all of these checks without invoking a
solver backend:

1. every block emits its pinned assertion count;
2. the complete historical order has byte-identical query-free SMT-LIB2;
3. the complete forward and reverse orders match the existing midpoint-order probe;
4. every emitted file parses as QF_NRA with the expected assertion count; and
5. no pseudo-Boolean operator appears.

Solver calls use fresh PiQD SMT sessions only. The first wave runs all fourteen cells
with one bounded timeout and at most twenty concurrent workers. UNKNOWN cells are
split or cross-checked; their timeout is not increased as the primary response.

## Verdict scope

- `SAT` means only that the exact encoded prefix is satisfiable. It requires model
  replay before being described as an encoding witness.
- `UNSAT` concerns the authenticated formula bytes. It requires independent replay
  before any block is treated as a mathematical obstruction.
- `UNKNOWN` is inconclusive and admits no clause.

The first status transition between consecutive prefixes is the discovery output.
Any proposed Lean lemma must map only to sourced assertions in a minimized decisive
core and must retain the B3 theorem above as its immediate consumer.
