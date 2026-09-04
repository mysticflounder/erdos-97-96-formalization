# Profile 0034 supporting-edge postrun audit

Date: 2026-09-04

Status: process complete; mirror-order Z3 discovery candidate; target campaign
inconclusive.

## Scope

Run `run-0001` tested four authenticated profile-34 radius cells and two
controls through PIQD. Each target has exactly 20 real coordinate declarations,
143 strict supporting-edge assertions, 11 emitted source row equalities, one
strict radius assertion, and one source-strict assertion: 156 assertions and
177 SMT commands.

The original fixed-order target implies this supporting-edge relaxation: each
of its 286 ordered-triple signs supplies the sign used for the matching cyclic
edge and remaining vertex. The reverse direction is not claimed. Exact SAT
replay therefore checks all 286 original signs, all 13 original row equalities,
the radius branch, and the source inequality before accepting a model.

The result concerns only these four formulas. It establishes no source
realization, live-source coverage, all-order elimination, Lean ingress,
theorem, promotion, or live closure; every such claim remains `false`.

## Custody and replay

- Run root:
  `scratch/runs/exactfive-hard-source-swap-profile0034-supporting-edge-qfnra-piqd-20260904/run-0001`.
- Lane base:
  `30393754d3bf84021134553749a168cade04be95`.
- Execution commit:
  `1c79a5bc0ca4ec2e418ccb095963aa56d744ccfd`.
- Run-manifest self-hash:
  `6e469b3048aec1f26e1c94e644adf570752eaea49ee1dd91c60b3605d5ac50c4`.
- Launch self-hash:
  `28547a2032ae396844226c89851524a24f4583b8b2824f445fe658bf1bf12997`.
- Terminal self-hash:
  `db6ec92b4f2047722d3934abdac0d8bd79512768b3dc52b67cbedf71750513a5`.
- Solver custody: Z3 4.17.0,
  `b7a02cb75cccb7f35385c551c10453f32c12da23a7656e24233bc4b25d0f5a9a`;
  cvc5 1.3.3,
  `fae4cef47a4e82e3b37f8928b5cb275c8a86d138a33e49d54a9933a157b57f74`.

The independent artifact audit matched all five source digests and nine input
digests, authenticated the historical execution commit and its bound blobs,
and rebuilt the terminal bytes. The run used 12 distinct fresh PIQD sessions,
one per query and engine. Every session began with zero receipts, performed one
solve, and closed. There was no response loss, reconciliation, partial resume,
target model, named core, proof, or partial stream.

The first runner output and later immutable replay output are byte-identical,
with SHA-256
`d4ebc908ad92e4f4369c23cf8cff3ef79ff3443d133947e48c324a53693a0038`.
The launch requested 60,000 ms. The adapter supplied a 90,000 ms daemon
deadline. The completed lifecycle exposed a stale regression assertion that
required the event directory to remain prelaunch-empty. The test now accepts
either a pristine prelaunch root or a paired, self-hashed launch and terminal;
the focused suite passes 31 tests.

## Results

| Query | Z3 | cvc5 | Result SHA-256 |
|---|---:|---:|---|
| positive control | SAT and replayed, 1 ms | SAT and replayed, 0 ms | `e42993df0dcecbd3cb0e77c43c89f695312f7907895eb5a8edc2a4e43fef5b42` |
| negative control | UNSAT, discovery only, 0 ms | UNSAT, discovery only, 0 ms | `87ddb18b3f98d90b6349166417f3f23da223b04f2896e7b1cd52898ff683576d` |
| mirror order, radius `<` | UNSAT, discovery only, 14,484 ms | UNKNOWN, 90,010 ms | `be1f7d987e3da0cdfe2d3219e4b65fd45990915171fb75af942e1ca5678f7ae3` |
| mirror order, radius `>` | UNSAT, discovery only, 14,487 ms | UNKNOWN, 90,005 ms | `0cd5f030409ca464369af8b7123bd07fd4d75bce020bf7b8f1666e23c2dedf5c` |
| direct order, radius `<` | UNKNOWN, 60,748 ms | UNKNOWN, 90,002 ms | `44cd395e4db75d0bf340710e982d003915a2f21d70703f00bad6c266562a259e` |
| direct order, radius `>` | UNKNOWN, 60,538 ms | UNKNOWN, 90,011 ms | `608ac1a197610163fcf2a7bb1073e30c5d640b94469aa242f4b944778b84c683` |

The controls behaved as specified. Both mirror radius cells produced Z3 UNSAT,
but their unguarded journals have terminal empty cores and cvc5 remained
UNKNOWN. These are concrete discovery candidates only. The direct order remains
open in both radius branches.

## Reuse preflight and next action

Mining only this wave produced one concrete search key: eliminate the mirror
order from a small subset of the 143 edge signs, 11 row equalities, radius
branch, and source inequality. The required Lean-corpus preflight found
`false_of_six_ccw_mirror_interleaving_row_equalities` as the closest bank
theorem. It cannot serve this cell. Under every cyclic rotation, its three
metric centers must map to `c1`, `c2`, and `O`; at least one required
center-to-center row equality is absent. That is the first missing antecedent.

The next run names all 156 assertions in each mirror radius cell with guarded
assumption terms and requests a nonempty Z3 assumption core through PIQD.
Labels bind each core member to its source ledger entry. A returned core is not
minimality evidence and remains discovery-only. Any later minimization must
rerun the selected core and its deletion checks in fresh sessions, with exact
SAT replay for every accepted deletion witness.
