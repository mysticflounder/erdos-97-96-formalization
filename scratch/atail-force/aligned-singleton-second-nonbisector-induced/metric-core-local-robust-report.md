# Fresh local-robust checkpoint-survivor metric core

Result: **UNSAT**. The fresh outer model has 19 ordered alias classes; the complete quotient QF_LRA system tracks 10813 relations. Z3's assumption core greedily shrinks to **3 relations**.

## Core relations

- `R00009` `true_row_equality`: D0_6(C0={a0,z3,e2}, C6={r1,be}) = D0_2(C0={a0,z3,e2}, C2={r4})
  Named row: center `a0`, roles `r1` and `r4`.
- `R00126` `true_row_equality`: D6_14(C6={r1,be}, C14={bz}) = D2_14(C2={r4}, C14={bz})
  Named row: center `bz`, roles `be` and `r4`.
- `R03431` `strict_kalmanson`: D0_2(C0={a0,z3,e2}, C2={r4}) + D6_14(C6={r1,be}, C14={bz}) < D0_6(C0={a0,z3,e2}, C6={r1,be}) + D2_14(C2={r4}, C14={bz})
  Ordered classes: C0={a0,z3,e2}; C2={r4}; C6={r1,be}; C14={bz}; side `adjacent_pairs`.

The two row equalities identify the two corresponding Kalmanson terms, so its strict inequality reduces exactly to the same sum being less than itself.

## Replay and scope

- Loaded and validated 1985 cuts (9925 literals); ignored stale checkpoint keys: `metadata, stats`.
- Complete-system replay: `UNSAT`; core-alone replay: `UNSAT`; every one-relation deletion replayed `SAT`.
- Core hash: `70d6b0b2d9f68358e888742878f0b025ebaa832a4e929bbfba6337485450d71b`. Checkpoint hash: `f16824fcd25606d5e80d40fe8e26cab67a3ad63f9a42fe217c02432f2e75c4a1`. Encoder hash: `7c0cb525420cfd4d3de4a9bd9fd13f63e7868890b04e4316f3016195e7db9de7`.
- Trust boundary: exact QF_LRA solver evidence for this fresh checkpoint survivor, not the original run's terminal model, a minimum-cardinality core, a general theorem, a Farkas certificate, or a kernel-checked proof.
