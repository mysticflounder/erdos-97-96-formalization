# Exact six-distinct cap-local model

The all-six-distinct local geometry is feasible.

Take the nine rational (in fact integral) points

| label | coordinate |
|---|---|
| `O` | `(0,0)` |
| `L` | `(10,-1)` |
| `a` | `(25,0)` |
| `u` | `(36,15)` |
| `c` | `(36,27)` |
| `d` | `(34,34)` |
| `v` | `(15,36)` |
| `b` | `(7,24)` |
| `R` | `(1,10)` |

Their counterclockwise boundary order is

```text
O, L, a, u, c, d, v, b, R.
```

Thus the open boundary cap from endpoint `L` to endpoint `R`, avoiding
`O`, consists of

```text
a, u, c, d, v, b.
```

In particular it contains `a,c,b` and `u,d,v` in the required orders, and
all six roles are distinct strict-cap-interior vertices.

The exact squared-distance identities are

```text
|Oa|^2 = |Ob|^2 = 625,
|Ou|^2 = |Ov|^2 = 1521,       (625 != 1521)
|ca|^2 = |cb|^2 = 850,
|du|^2 = |dv|^2 = 365.
```

The checker verifies strict convexity by the stronger supporting-line
criterion: for every directed edge in the displayed counterclockwise order,
every nonincident point has strictly positive cross product with that edge.
The smallest of all these exact determinants is `24`.

Run:

```bash
uv run python scratch/local-six-distinct-cap-model/check_model.py
```

As a harmless extra, the endpoint triangle `O,L,R` is right isosceles:
its squared side lengths are `101,101,202`.  This artifact establishes only
the requested local Euclidean/cyclic-order feasibility.  It does **not**
claim the full production `SurplusCapPacket` fields (circumscribed MEC,
global K4/common-CSS, deletion minimality, and so on).
