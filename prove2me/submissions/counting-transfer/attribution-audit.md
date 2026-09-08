# Counting-milestone attribution audit

The publication metadata distinguishes mathematical provenance from ownership
of the Lean artifacts.

- The mission description and root proof explanation credit Dumitrescu's 2006
  isosceles-count route.
- Nodes implementing the cap-witness refinements identify
  Nivasch--Pach--Pinchasi--Zerbib (2013) where the source documentation makes
  that connection.
- Nodes that merely live in a `Dumitrescu` namespace are not automatically
  attributed to Dumitrescu. Project-specific definitions, transport lemmas,
  minimum-enclosing-circle infrastructure, and exact Lean interfaces are
  labeled as local formalization work.
- CGN/circumscribed assembly nodes are described as such rather than assigned
  to an individual paper without source support.
- Every paper attribution is qualified as mathematical provenance. The Lean
  declarations and proofs are the project's own formalization, and the papers
  were not imported as machine-checked proofs.

The theorem-level audit is encoded in `metadata.json` and its three reviewed
batch files. The governing prose source is
`docs/97-rvol-full-prose-proof-2026-07-13.md`, especially Part I and its
bibliography.

