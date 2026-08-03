# n=17 ConvexFivePointCore CEGAR — round 3

Date: 2026-08-02

## Route

The lazy wrapper `n17_convex_core_cegar.py` imports the repaired n=17
`(6,8,6)` probe with its cyclic/metric layer.  On each SAT model it detects
five distinct labels carrying the four exact radius equalities

```text
E(x,a,b), E(y,a,b), E(c,b,x), E(c,b,y)
```

and blocks only the model when the cyclic-order proxy gives the same strict
orientation to `(a,x,b)` and `(b,c,y)`.  This is the finite analogue of the
source-clean `Census554.ConvexFivePointCore.false_of_core_of_common_orientation`
consumer.  The wrapper learns cuts lazily rather than materializing all
five-tuples up front.

## Result

Run record:
`artifacts-n17-convex-core-cegar/20260802T112745Z/result.json`.

The replay reached `SAT` after five solver rounds:

| round | status | orientation-core cuts |
|---:|:---:|---:|
| 0 | SAT | 84 |
| 1 | SAT | 175 |
| 2 | SAT | 48 |
| 3 | SAT | 16 |
| 4 | SAT | 0 |

Total learned cuts: 323.  Elapsed time: 19,084 ms.  The final model has no
observed violating core under the bounded detector, but it remains a finite
SAT shadow.

## Trust boundary

The result is `external_solver_only = true`; `lean_kernel_proof = false`,
`universal_n_claim = false`, and `qf_nra_coordinates = false`.  The cyclic
positions are an order abstraction, not a `Realizes` witness, and the replay
does not prove that every live residual packet reaches one of these cores.
Consequently the 323 cuts are diagnostic CEGAR data only: they are not a
production theorem, a universal certificate, or closure of the live
normalized-residual `sorry`.  A fresh global theorem-bank audit is required
before using this round to choose the next route.
