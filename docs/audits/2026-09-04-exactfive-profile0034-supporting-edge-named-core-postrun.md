# Profile 0034 named-core postrun audit

Date: 2026-09-04

Status: controls passed; both guarded targets returned `UNKNOWN`; no named core
was obtained.

## Scope

Run `run-0002` tested two controls followed by the two mirror-order radius
branches through PIQD and Z3. Each target guarded all 156 source assertions:
143 supporting-edge signs, 11 source row equalities, one radius branch, and one
source-strict assertion. The solve request activated all 156 guards.

Every theorem, source-realization, Lean-ingress, promotion, live-closure, and
core-minimality claim remains `false`. This run supplies performance and search
guidance only.

## Custody

- Run root:
  `scratch/runs/exactfive-hard-source-swap-profile0034-supporting-edge-named-core-piqd-20260904/run-0002`.
- Lane base:
  `a9a6426bb4045b2d2b61abd36b1ee47adb1678fc`.
- Execution commit:
  `a750983f44a1251f672a58d40dc5e3f6c743f247`.
- Run-manifest self-hash:
  `e6bd8f347c2272d8f457d74779dc8fd119265f91e981d2507493afcc8860cc70`.
- Run-manifest file hash:
  `718d094af3585ca0b29468faf92f35d1cc747055acc69b6ea02be0663376c4cb`.
- Launch self-hash:
  `ead97eaa0d76268285600bc08e949a494770160540e4dd388884616defb38267`.
- Launch file hash:
  `89388e1360f489bd793e06da23908f3aabe417a1a767d9e9b2c54a5015fceb2a`.

The positive and negative control trees were published and pass complete local
replay. Both target transactions closed their PIQD sessions, then failed the
required `UNSAT` guard before publication. The root therefore contains the
immutable launch, two authenticated control trees, two empty adapter
tombstones, and no terminal event. It is an incomplete launched root and must
never be resumed.

The two target rows below come from closed daemon receipt journals. Their
request identifiers, session identifiers, status, solve time, assumption
count, and receipt hashes were checked independently. These receipts are
forensic evidence, not repo-contained target artifacts and not a terminal
campaign result.

## Results

| Query | Status | Solve time | Core |
|---|---:|---:|---:|
| positive control | SAT and replayed | 1 ms | none requested |
| negative control | UNSAT, discovery only | 0 ms | both control guards |
| mirror order, radius `<` | UNKNOWN | 66,524 ms | absent |
| mirror order, radius `>` | UNKNOWN | 61,530 ms | absent |

For radius `<`, request
`acdc5521-1f08-5197-9d87-0206afd4449e` used session
`3a5a865a-9cb6-4a8d-bb55-48d584c208aa`; its receipt-journal hash is
`032923ead0faf1b078b19397328a8a23dd07b177f07cc47fb0f2c819c031478c`.
For radius `>`, request
`b4af024e-c3b1-5e22-bbc3-877cf4cae584` used session
`d68c4a48-32d3-433c-b996-94f345c83cd2`; its receipt-journal hash is
`fe57cbf23f4addfac78e4f38cac9bab811b3f1b80bce0dc6c922ef93b24b7fb6`.

The unguarded parent formulas returned Z3 `UNSAT` in about 14.5 seconds per
branch. Activating 156 Boolean implication guards changed both target outcomes
to `UNKNOWN` beyond 60 seconds. Lengthening this campaign would test the same
coarse encoding and is not justified by the observed data.

## Wave mine and next action

This wave produced no concrete mathematical lemma candidate, so it does not
trigger another Lean-corpus theorem search. Its new information is an encoding
obstruction: all-atom assumption guarding hides the fast unguarded Z3 route.

The next campaign must use a fresh run identifier. It will keep candidate
formulas unguarded and submit bounded deletion cells through fresh PIQD
sessions. Initial cells should remove natural source-ledger groups while
retaining exact SAT replay for any accepted witness. Only successful deletion
tests may narrow the candidate; `UNKNOWN` leaves the tested group unresolved.
