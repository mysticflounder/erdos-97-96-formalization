# Exact 15-point cyclic-order kernel mine

Exhausted **13824 = 4!^3** cap-compatible cyclic orders. The checked families kill **13824** orders; **0 survive**.

## Family counts

Counts overlap; each row means that at least one concrete instance of that schema fires.

| Family | Candidate role patterns | Orders killed |
|---|---:|---:|
| `two_triple_raw_equalities` | 864 | 13472 |
| `sparse_raw_equalities` | 864 | 13824 |
| `sparse_two_selected_rows` | 256 | 13824 |
| `kalmanson_two_selected_rows` | 80 | 13824 |

## Witnesses

- `two_triple_raw_equalities`: roles `[1, 4, 5, 6, 9, 0]` in order `[13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11]`.
- `sparse_raw_equalities`: roles `[0, 1, 4, 6, 8, 9]` in order `[13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11]`.
- `sparse_two_selected_rows`: roles `[0, 1, 4, 6, 8, 9]` in order `[13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11]`.
- `kalmanson_two_selected_rows`: roles `[2, 6, 7, 11]` in order `[13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11]`.

## Finite pattern cover

Status: **minimum**; size 2; elementary lower bound 2. The largest single-pattern coverage is 6912 orders, and the two listed cover patterns overlap on 0 orders.

- `kalmanson_two_selected_rows` roles `[2, 6, 7, 11]` covers 6912 orders.
- `kalmanson_two_selected_rows` roles `[6, 1, 14, 7]` covers 6912 orders.

## Sources

- `scratch/triapex-incidence-obstruction/check_model.py`: SHA-256 `c777ebed73e3028c5bbb39664be93ad5f2f35469a3c72027a42204e52d6136f7`
- `lean/Erdos9796Proof/P97/ATail/TwoTripleRowSixPointEuclideanObstruction.lean`: SHA-256 `91bc2d5e71d3ecc7cc57634853913d7c88382cb8a8784549cb6bd1da62a79a62`
- `lean/Erdos9796Proof/P97/ATail/SixPointSparseEuclideanObstruction.lean`: SHA-256 `a6d35435cc34c1927a0a40ccd647464a9ec3b76b03fe2625dc934289b28be56a`
- `lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean`: SHA-256 `0c82bf6d9b30b4d6db0b705f998128277a94a78bb16a873a15599f87f28b8497`
- `scratch/retained-omission-e1/order-kernel-miner/mine_orders.py`: SHA-256 `f868cc6eedc020983ab7f7dea5a890eacc83645494aee0ad7425698ac1a735ac`
- `scratch/retained-omission-e1/order-kernel-miner/pyproject.toml`: SHA-256 `85c3cd6b02b9aa2752bd6174f23e0b80407fdec682089907ea79733964e077f9`

## Epistemic scope

**EMPIRICALLY VERIFIED by exhaustive exact finite enumeration.** This run checks only the stated equality/order abstraction. It did not run Lean/Lake and does not establish a planar realization, convex/MEC hypotheses, or production proof closure.

The raw-equality families may use equalities induced by any of the 12 shell rows or 3 rich rows. The selected-row families use only the 12 full shell rows, exactly matching their membership-bearing hypotheses.
