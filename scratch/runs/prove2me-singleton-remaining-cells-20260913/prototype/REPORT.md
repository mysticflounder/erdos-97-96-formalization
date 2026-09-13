# Remaining singleton-cell coverage prototype

This governed run extends the structural compatibility certificate from the
`(s1, 777)` cell to `(s1, 912)` and `(s3, 801)`.

The generator now accepts a `CellSpec` and reproduces the committed `(s1, 777)`
modules byte-for-byte. The new certificates have these sizes:

- `(s1, 912)`: 283 partial states, 282 splits, 10,674 concrete prunes, one
  terminal, 10 Lean modules, and 412,053 source bytes.
- `(s3, 801)`: 855 partial states, 854 splits, 28,909 concrete prunes, one
  terminal, 30 Lean modules, and 1,102,219 source bytes.

The 40 new modules total 1,514,272 bytes. Their path-and-content aggregate
SHA-256 is
`9159abd764d5fd268116a02387d3c9313c6b1c40e2d8914f4a8eb45f448d624f`.
Fresh external generation matches all three repository certificate families
byte-for-byte. Both new roots compile, and their depth-two result classifiers
depend only on `propext`, `Classical.choice`, and `Quot.sound`.
