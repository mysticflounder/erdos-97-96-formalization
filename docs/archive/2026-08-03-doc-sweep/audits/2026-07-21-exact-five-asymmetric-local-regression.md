# Exact-five asymmetric local regression — 2026-07-21

## Status

**EMPIRICALLY VERIFIED NUMERICAL REGRESSION.** This is not an exact Lean
model, an interval certificate, or a Problem 97 counterexample.

The purpose of the fixture is narrower: it shows that strict convexity, the
MEC packet, an exact-five physical cap, the asymmetric two-hit critical row,
the `(6,5,6)` cap sizes, and absence of an alternative short-cap packet are
locally compatible. Therefore those fields alone cannot prove the live
exact-five contradiction.

## Coordinates

The following points occur in counterclockwise hull order:

| label | x | y |
|---|---:|---:|
| `O2` | 1.0000000000000000 | 0 |
| `p1` | 0.7052762162741274 | 0.22829894384613567 |
| `p2` | 0.4104980151739708 | 0.45652760267292924 |
| `u` | 0.11566539669952991 | 0.6846859764803807 |
| `e+` | -0.2773465252069356 | 0.9587569597075448 |
| `A` | -0.2821222614326753 | 0.9593784600480215 |
| `s` | -0.2913100057340823 | 0.9398656937759412 |
| `h` | -0.5971315078120170 | 0 |
| `t` | -0.2913100057340823 | -0.9398656937759412 |
| `B` | -0.2821222614326753 | -0.9593784600480215 |
| `e-` | -0.2773465252069356 | -0.9587569597075448 |
| `v` | 0.11566539669952991 | -0.6846859764803807 |
| `p2-` | 0.4104980151739708 | -0.45652760267292924 |
| `p1-` | 0.7052762162741274 | -0.22829894384613567 |

## Verified margins and incidences

- Every consecutive oriented cross product is positive; the minimum is
  approximately `3.3138e-05`.
- `O2`, `A`, and `B` have norm one. Every other point has norm strictly below
  one; the largest is approximately `0.9980661`. Thus the unit disk is the
  MEC and these are the only carrier points on its boundary.
- The support-triangle central arcs are approximately `1.5810`, `3.1212`, and
  `1.5810`, all at most `pi`. Its closed cap sizes are `(6,5,6)`.
- The cap opposite `O2` is exactly `{A,s,h,t,B}`. With only the three displayed
  MEC-boundary points, there is no alternative support triangle and therefore
  no alternative four-cap packet in this fixture.
- At radius `1.597131507812017`, the complete `O2` class is exactly
  `E = {e+,s,h,t,e-}`.
- At radius `0.9883695227343545`, the complete `h` class is exactly
  `K = {u,s,t,v}`. Thus `h` is a valid deletion blocker for `s`, lies strictly
  between `s` and `t` in the physical-cap order, and realizes the asymmetric
  normal form.
- Only `O2` and `h` have a radius class of cardinality at least four.

## Consequence for the closure route

The fixture deliberately fails all-center K4, a total critical-shell system,
minimality, first-apex robustness, and the first-apex frontier packet. Any
proof of the live asymmetric occurrence must therefore visibly consume at
least one of those global fields. More cap-order refinement of the single
row, MEC localization alone, or `noM44` alone cannot close it.
