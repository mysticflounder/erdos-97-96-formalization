# Live-loop certificate-active kernel mining

This is theorem-discovery evidence. For successful rows below, Singular
exposed the nonzero coefficient positions of a lift and internally
replayed the identity. The coefficient polynomials were not retained or
independently replayed, so repeated kernels are candidates for full
certificate extraction, not kernel-checked Lean theorems.

- Selection: `explicit`
- Selected cores: 2
- Successful internal lift replays: 2
- Singular timeout per core: 60.0 s

## Per-core extraction

| Core | Grade | Nominal | Active | Pair | Result | Seconds |
|---|---|---:|---:|---|---|---:|
| `unit-core-654-16` | `unit-ideal` | 5r/16e | 5r/9e | — | `SINGULAR_INTERNAL_LIFT_REPLAY` | 0.02 |
| `unit-core-654-18` | `unit-ideal` | 5r/16e | 5r/9e | — | `SINGULAR_INTERNAL_LIFT_REPLAY` | 0.01 |

## Quotient under injective relabeling

Nontrivial pair-preserving isomorphism classes:

- `unit-core-654-16`, `unit-core-654-18`

No strict active-kernel embedding was found.

## Active row systems

- `unit-core-654-16`: 1:{0,2,8}; 2:{0,1,10,11}; 8:{0,2}; 10:{0,1}; 11:{1,8,10}
- `unit-core-654-18`: 1:{0,2,9}; 2:{0,1,10,11}; 9:{0,2}; 10:{0,1}; 11:{1,9,10}

## Reading

At least one structural collapse occurred. The smallest repeated or covering kernel should now be rerun with full coefficient emission and independent exact replay.
