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

## K-Q3-3. Shared-apex + shared-S kill (PROVEN)

**Claim.** No |A| ≥ 12 leaf configuration has U ∈ K(V) ∩ K(W) together
with a shared intS member z ∈ intS ∩ K(V) ∩ K(W) (class
`VsU_WsU_sshared`, the only mirror-reduced class with isv=shared,
bv=U, bw=U).

*Proof.* U, z ∈ K(V) ∩ K(W), so by F-Q3-2 they are the mirror pair
across the chord line VW: z = (U_x, −U_y), and the {U, shared-s} disk
computation forces ω = 0 — the Thales frame (O on VW, U on the circle
with diameter VW, so ∠VUW = 90°). U ∈ K(V) gives ρV² = ‖U−V‖². Now
∠VUW = 90° means U−V ⊥ chord WU, i.e. U is the foot of the
perpendicular from V onto the line through W, U. Writing any point of
the closed half-plane H beyond that chord (the side containing cap O1,
not containing V) as p = q + t·n with q on the line, t ≥ 0, and
n = (U−V)/‖U−V‖ the unit normal into H:
‖p−V‖² = ‖q−V‖² + 2t‖U−V‖ + t² ≥ ‖U−V‖²,
with equality iff q = U and t = 0, i.e. p = U. So every point of cap O1
other than the corner U is strictly farther than ‖U−V‖ from V. But H1
gives |K(V) ∩ intO1| ≥ 2 (here γ_V = 2), and each such member has
distance exactly ρV = ‖U−V‖ from V with intO1 ∌ U. Contradiction. ∎

Constraints used: radius equalities, strict cap signs (for the F-Q3-2
mirror pair), I-DISK on z, I-OBT (ω ≥ 0), and the H1 count — no ORDER
constraints, so the full falsifier-gate check applies. Machine
cross-check: z3 unsat on the subsystem with even a SINGLE intO1 member
of K(V) (check_kq33.py), i.e. the kill does not need the full γ count.

## K-Q3-5. Shared-S kill — ALL isv=shared classes (PROVEN, hand + lemma-level z3)

**Claim.** No |A| ≥ 12 leaf configuration has a shared member
z ∈ intS ∩ K(V) ∩ K(W). This kills every isv='shared' class (9 of the
87, subsuming K-Q3-3's class).

*Proof.* Let M = (1/2, 0) be the midpoint of VW and O = (1/2, ω),
ω ≥ 0 (I-OBT). For z ∈ intS: z_y < 0 (cap sign) and ‖z−O‖² ≤ R²
(I-DISK), so ‖z−M‖² = ‖z−O‖² + 2ω·z_y − ω² ≤ R² − ω² = 1/4, and by the
parallelogram identity
  ρV² + ρW² = ‖z−V‖² + ‖z−W‖² = 2‖z−M‖² + 1/2 ≤ 1.
H1 gives K(V) a member p ∈ intO1 (γ_V ≥ 2): p strictly beyond chord WU
forces ρV = ‖p−V‖ > dist(V, line WU) = uy/‖WU‖ =: dV; symmetrically
ρW > dW := uy/‖UV‖. But dV² + dW² ≥ 1 for every nonobtuse frame:
with a = ‖WU‖, b = ‖UV‖, uy = ab·sin U and ab·cos U = ux² − ux + uy²,
  dV² + dW² ≥ 1 ⟺ (a²+b²)·sin²U ≥ 1 ⟺ cos U·(2ab·sin²U − cos U) ≥ 0,
and cos U ≥ 0 (I-OBT at U) while ab·(2ab·sin²U − cos U) =
2uy² − (ux²−ux+uy²) = uy² + ux(1−ux) ≥ 0 (I-OBT at V, W ⟺ ux ∈ [0,1]).
So ρV² + ρW² > dV² + dW² ≥ 1 ≥ ρV² + ρW². Contradiction. ∎

Constraints used: E-MEC, radius equalities, I-DISK on z, I-OBT (all
three corners), strict cap signs, H1 counts — no ORDER constraints, so
the full falsifier-gate check applies. Machine cross-check: the full
3-aux-point subsystem is z3-unknown (300 s, check_kq35.py); the proof
is instead machine-checked lemma-by-lemma (check_kq35_lemmas.py, all
UNSAT on the negations): L1 sum bound ρV²+ρW² ≤ 1 on intS (E-MEC +
I-OBT + I-DISK + cap sign), L2 dV²+dW² ≥ 1 for nonobtuse frames
(division-free form), L3/L3′ strict cap-interior lower bounds
‖p−V‖²·‖WU‖² > uy² and mirror. The chaining L1+L2+L3+L3′ ⟹ ⊥ is
linear arithmetic over the radius equalities.

## Machine cross-checks

- K-Q3-1 sub-system (V, W, z₁, z₂, radius equalities, the two chord-VW
  sign conditions only) → z3 must return unsat fast; kept in runs/.
- K-Q3-3 sub-system (check_kq33.py: E-MEC, forced radii rv2 = ‖UV‖²,
  rw2 = ‖UW‖², shared z on both circles, ONE p in intO1 on the V-circle,
  I-OBT, I-DISK, strict cap signs) → z3 unsat.
- F-Q3-2 {U, s}-case: full-window witness on the Thales frame (ω = 0)
  verifies exactly; perturbing ω to 1/100 with the same shared structure
  must fail the disk constraint on z (checked in the factory's exact
  screen).
- K-Q3-5 lemmas (check_kq35_lemmas.py): L1, L2, L3, L3′ each z3-unsat
  on the negation (QF_NRA, division-free). Full subsystem
  (check_kq35.py) remains z3-unknown — superseded by the lemma checks.
