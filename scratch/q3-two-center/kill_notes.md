# Q3 kill mechanisms and forcings — proofs

Vocabulary per formulation.md §1. Gauge V = (0,0), W = (1,0), U above the
axis, O = (1/2, ω) with ω ≥ 0 (non-obtuseness at U, K-notes convention),
R² = 1/4 + ω². Strict cap signs (D-probe formulation 2.2) give, for
interior points: intS ⟹ y < 0; intO1 ⟹ y > 0; intO2 ⟹ y > 0 (each
interior point is strictly on its opposite vertex's side of the chord VW,
and U is strictly above).

## K-Q3-1. Double cross-identification kill (PROVEN)

**Claim.** No |A| ≥ 12 leaf configuration has vertex classes K(V), K(W)
with BOTH identifications: a point z₁ ∈ intO2 ∩ K(V) ∩ K(W) and a point
z₂ ∈ intO1 ∩ K(V) ∩ K(W) (classes `*_o2i_o1i*`, any a-slots).

*Proof.* z₁, z₂ ∈ K(V) ∩ K(W) means both lie on the circle C_V (center V,
radius² ρV²) and on C_W (center W, radius² ρW²). V ≠ W, so C_V ∩ C_W has
at most two points, and the two circles' centers lie on the x-axis, so
the intersection is symmetric across it: the two points are (x₀, ±y₀)
with x₀ = (ρV² − ρW² + 1)/2. z₁ ≠ z₂ (they are interior points of
different caps, and caps partition non-Moser points), so
{z₁, z₂} = {(x₀, y₀), (x₀, −y₀)} with y₀ ≠ 0 — one strictly above the
axis, one strictly below. But z₁ ∈ intO2 forces z₁_y > 0 and z₂ ∈ intO1
forces z₂_y > 0 (cap signs above). Contradiction. ∎

Constraints used: the four radius equalities and the two strict cap-sign
conditions vs the chord VW — all leaf-implied; no disk, no order, no
non-obtuseness. The kill transfers verbatim to every |A| ≥ 12
configuration exhibiting the joint type.

## F-Q3-2. Mirror-pair forcing for two shared members (PROVEN)

Same argument, general form: if |K(V) ∩ K(W)| = 2, the two shared members
are EXACTLY the mirror pair (x₀, ±y₀) across the chord line VW. Casework
over the (mirror-reduced) location pairs the enumeration admits:

- **{U, shared s-point}** (classes `VsU_WsU_sshared`-type): the s-point is
  forced to be z = (U_x, −U_y). Disk: d²(z,O) = d²(U,O) + 4·U_y·ω =
  R² + 4·U_y·ω, and U_y > 0, ω ≥ 0, so z is inside the closed disk iff
  **ω = 0** — the frame is FORCED right-angled at U (O on the chord VW,
  R² = 1/4, U on the Thales circle over VW), with z on the boundary
  circle. Not a kill: a forcing to the non-obtuse boundary. Realizations
  must be constructed on the Thales frame.
- **{o2-ident, o1-ident}**: KILLED — K-Q3-1.
- **{shared s-point, o2-ident}** (and mirror with o1): consistent — forces
  z_o2 = (z_s_x, −z_s_y) exactly (S below, O2 above). Factory constructs
  the pair as exact mirrors.
- **{U, o2-ident}** and **{U, o1-ident}**: not enumerable — slot conflict
  (U-sharing needs b-slots = U on both sides; an o2/o1-ident needs that
  side's b-slot = interior point). Nothing to prove.
- Three or more shared members: excluded by C2 (≤ 2), and independently by
  |C_V ∩ C_W| ≤ 2 with the mirror-pair structure.

## Machine cross-checks

- K-Q3-1 sub-system (V, W, z₁, z₂, radius equalities, the two chord-VW
  sign conditions only) → z3 must return unsat fast; kept in runs/.
- F-Q3-2 {U, s}-case: full-window witness on the Thales frame (ω = 0)
  verifies exactly; perturbing ω to 1/100 with the same shared structure
  must fail the disk constraint on z (checked in the factory's exact
  screen).
