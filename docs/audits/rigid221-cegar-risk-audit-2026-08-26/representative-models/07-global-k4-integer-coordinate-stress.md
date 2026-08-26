# Integer-coordinate blocker-graph stress construction

**Classification:** EMPIRICALLY VERIFIED partial Euclidean construction.
**Artifact:** `scratch/atail-force/blocker_graph/euclidean_countermodel.py`
**Artifact SHA-256:** `0d5f0da94588e752c418b735437bd110de3f38adf1bb7ee129fac9761f798a97`

The exact integer-coordinate `n=33` construction has global K4,
deletion-minimality, genuine blocker cycles, and an injective two-apex distance
map. It protects the audit against overclaiming from blocker-graph structure.

Exact coordinates (with apices `(3,4)` and `(5,1)`) are:

```text
(0,0) (0,1) (0,5) (0,6) (1,0) (1,1) (1,3) (1,4) (1,5) (1,6)
(2,2) (2,3) (2,4) (2,5) (3,1) (3,2) (3,3) (3,4) (3,5)
(4,1) (4,2) (4,3) (4,4) (5,0) (5,1) (5,2) (5,3) (5,5) (5,6)
(6,0) (6,1) (6,5) (6,6)
```

**Fails:** convexity and the Moser/cap/source packet. It is neither a large
Rigid221 residual nor a P97 counterexample.
