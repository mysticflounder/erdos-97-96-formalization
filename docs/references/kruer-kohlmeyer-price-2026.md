# Kruer, Kohlmeyer, and Price (2026)

**Status:** ✅ Verified

## Citation

Liam Kruer, Jensen Kohlmeyer, and Liam Price, “Unit distances in convex polygons,” manuscript with a Lean 4 formalization, 2026. Source revision `0e98f5f9bdaf36007e3eb405cbefe2eda778a9b2`.

## Fetched from

Local supplied copy: `submissions/negative-resolution-20260913/upstream/96-97.pdf`, copied to `docs/references/kruer-kohlmeyer-price-2026.pdf`. The seven-page PDF was read with `pdftotext`; the accompanying `96-97.tex` was read end-to-end. PDF SHA-256: `0aa734bee7dd050157f6423b5869e78ea469406c81a91f64e1f97c5b38d5c818`.

## Verification

- Authors: ✅ The PDF title page gives “Liam Kruer, Jensen Kohlmeyer, and Liam Price,” in that order. The source also has `\author{Liam Kruer}`, `\author{Jensen Kohlmeyer}`, and `\author{Liam Price}`.
- Title: ✅ “Unit distances in convex polygons,” matching the PDF and `96-97.tex`.
- Venue and year: ✅ The source presents this as a 2026 manuscript with a Lean 4 formalization; no journal, DOI, or arXiv identifier is stated. The year is taken from the local upstream README citation metadata and the 2026 source snapshot.
- Result claims: ✅ Theorem 1.1 (PDF p. 1) gives the simultaneous lower bound `min{δ₁(P), u(P)/n} ≥ 1/4 log log n − C log log log n` for every sufficiently large `n`. Corollary 1.2 (PDF p. 1) states `U_c(n) = Ω(n log log n)` and arbitrarily large fixed minimum unit-distance degree at every sufficiently large cardinality. Its proof explicitly says taking `k = 4` disproves Problem 97. Proposition 4.3 (PDF p. 6) gives the prescribed-cardinality construction, and Corollary 4.4 (PDF p. 7) records the explicit `3432·2^36036` vertex bound for the `k = 4` counterexample.

## Issues found

None for the citation metadata or the three result claims recorded above. No publication venue or persistent identifier was added because the supplied source does not provide one. This verification record does not certify an independent prose audit of the manuscript’s mathematical proof.
