/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Soundness

/-!
# The dead k=4 window universe — certificate bank

The k=4 window universe is the set of admissible equidistance-constraint
classes on four labelled window points `{0,1,2,3}`: a witness (shell) map
`K : {0,1,2,3} → 𝒫(others)` where a centre `c` is *active* when
`|K c| ≥ 2`, imposing that all members of `K c` are equidistant from `c`.
Up to relabelling of the four points (the `S₄` action) there are exactly
**44** admissible classes; of these exactly **10** are dead (`ℂ`-empty
equidistance systems under the similarity gauge `pt0=(0,0)`, `pt1=(1,0)`).

This enumeration and the dead/alive split were re-derived independently and
agree with the dichotomy run's Tier C sweep (`scratch/u12-census-port/`
`dichotomy/`, 44 classes / 10 `C_DEAD`, δ multiset {1,1,1,1,2,2,2,2,3,4}).
Every dead class here has a **base** (equality-only) Nullstellensatz
certificate: `1 ∈ ⟨equidistance generators⟩` over `ℚ`, so no distinctness
(Rabinowitsch) separator is needed — corroborated by the dichotomy's
`base_pinned_empty = true` on all ten.

Variable indices (gauge `pt0=(0,0)`, `pt1=(1,0)`): `x2x=0, x2y=1,
x3x=2, x3y=3`.  Each `def kN_dead_i` is the certificate for one class; the
companion theorem checks `checkCertificate = true` with `native_decide`,
as for the `EndpointCertificate.Patterns` bank.  Kernel-pure `decide` is
infeasible here: `checkCertificate` runs over `Rat`, whose normalization
(`Nat.gcd`, well-founded recursion) does not reduce in the kernel — even
`(1/3 + 2/3 = 1)` gets stuck under `decide`.  Expected audit-cost addition:
`Lean.ofReduceBool` + `Lean.trustCompiler` (bv_decide standard); the
evaluated `checkCertificate` closure is ordinary verified Lean — no
`unsafe`, `@[extern]`, or `@[implemented_by]`.

The module is intentionally UNIMPORTED by the spine: it is the k=4 bank
groundwork for the Candidate-C head split of
`DoubleApexOffSurplusSharedRadiusPairCard12Up`.
-/

namespace Problem97

namespace EndpointCertificate

namespace K4WindowBank

/-- Class `k4_dead_00` — witness map `0:[1,2];1:[0,2];2:[0,3];3:[0,1,2]`
    (R = 5, δ = 1, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_00_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_00` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_00_coefficients : List Poly :=
[
[
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(0, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 2)]
],
[
  term ((1 : Rat) / 4) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)]
],
[
  term (2 : Rat) [(1, 2)]
],
[
  term ((-1 : Rat) / 4) [(0, 1)],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 2)],
  term (1 : Rat) [(1, 2), (2, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_00`. -/
def k4_dead_00 : Certificate :=
  { generators := k4_dead_00_generators
    coefficients := k4_dead_00_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_00`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_00_valid : checkCertificate k4_dead_00 = true := by
  native_decide

/-- Class `k4_dead_01` — witness map `0:[1,2];1:[0,3];2:[1,3];3:[0,1,2]`
    (R = 5, δ = 1, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_01_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (1 : Rat) [],
  term (-2 : Rat) [(0, 1)],
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_01` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_01_coefficients : List Poly :=
[
[
  term (1 : Rat) [],
  term ((-3 : Rat) / 4) [(0, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 2)]
],
[
  term ((-1 : Rat) / 4) [],
  term ((-3 : Rat) / 4) [(0, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)]
],
[
  term ((-1 : Rat) / 4) [],
  term (-1 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((-3 : Rat) / 2) [(1, 2)],
  term (1 : Rat) [(1, 2), (2, 1)]
],
[
  term ((1 : Rat) / 2) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)]
]
]

/-- Certificate for dead k=4 class `k4_dead_01`. -/
def k4_dead_01 : Certificate :=
  { generators := k4_dead_01_generators
    coefficients := k4_dead_01_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_01`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_01_valid : checkCertificate k4_dead_01 = true := by
  native_decide

/-- Class `k4_dead_02` — witness map `0:[1,2];1:[2,3];2:[0,1,3];3:[0,2]`
    (R = 5, δ = 1, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_02_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_02` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_02_coefficients : List Poly :=
[
[
  term ((5 : Rat) / 4) [],
  term (-1 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(3, 2)]
],
[
  term ((1 : Rat) / 4) [],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((3 : Rat) / 4) [(2, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(0, 1), (3, 2)],
  term (-1 : Rat) [(1, 1), (2, 1), (3, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(2, 1)],
  term ((1 : Rat) / 2) [(3, 2)]
],
[
  term ((5 : Rat) / 4) [],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((-3 : Rat) / 4) [(2, 1)]
],
[
  term (-1 : Rat) [],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((3 : Rat) / 4) [(2, 1)]
]
]

/-- Certificate for dead k=4 class `k4_dead_02`. -/
def k4_dead_02 : Certificate :=
  { generators := k4_dead_02_generators
    coefficients := k4_dead_02_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_02`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_02_valid : checkCertificate k4_dead_02 = true := by
  native_decide

/-- Class `k4_dead_03` — witness map `1:[0,2];2:[0,1,3];3:[0,1,2]`
    (R = 5, δ = 1, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_03_generators : List Poly :=
[
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_03` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_03_coefficients : List Poly :=
[
[
  term ((5 : Rat) / 4) [],
  term (-1 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 2)]
],
[
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(1, 2)]
],
[
  term ((-1 : Rat) / 4) [(0, 1)],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 2)],
  term (1 : Rat) [(1, 2), (2, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_03`. -/
def k4_dead_03 : Certificate :=
  { generators := k4_dead_03_generators
    coefficients := k4_dead_03_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_03`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_03_valid : checkCertificate k4_dead_03 = true := by
  native_decide

/-- Class `k4_dead_04` — witness map `0:[1,2];1:[0,2];2:[0,1,3];3:[0,1,2]`
    (R = 6, δ = 2, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_04_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_04` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_04_coefficients : List Poly :=
[
[],
[
  term ((5 : Rat) / 4) [],
  term (-1 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 2)]
],
[
  term (-1 : Rat) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(1, 2)]
],
[
  term ((-1 : Rat) / 4) [(0, 1)],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 2)],
  term (1 : Rat) [(1, 2), (2, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_04`. -/
def k4_dead_04 : Certificate :=
  { generators := k4_dead_04_generators
    coefficients := k4_dead_04_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_04`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_04_valid : checkCertificate k4_dead_04 = true := by
  native_decide

/-- Class `k4_dead_05` — witness map `0:[1,2];1:[0,3];2:[0,1,3];3:[0,1,2]`
    (R = 6, δ = 2, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_05_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_05` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_05_coefficients : List Poly :=
[
[],
[
  term ((4 : Rat) / 3) [],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((5 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(0, 1), (3, 2)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((1 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(1, 1), (3, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (3, 2)],
  term ((1 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((2 : Rat) / 3) [(2, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (2 : Rat) [(3, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_05`. -/
def k4_dead_05 : Certificate :=
  { generators := k4_dead_05_generators
    coefficients := k4_dead_05_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_05`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_05_valid : checkCertificate k4_dead_05 = true := by
  native_decide

/-- Class `k4_dead_06` — witness map `0:[1,2];1:[2,3];2:[0,1,3];3:[0,1,2]`
    (R = 6, δ = 2, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_06_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (-2 : Rat) [(0, 1)],
  term (1 : Rat) [(0, 2)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_06` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_06_coefficients : List Poly :=
[
[
  term ((5 : Rat) / 4) [],
  term (-1 : Rat) [(1, 1), (3, 1)],
  term (2 : Rat) [(1, 2)]
],
[],
[
  term ((1 : Rat) / 4) [],
  term ((3 : Rat) / 4) [(0, 1)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)]
],
[
  term (2 : Rat) [(1, 2)]
],
[
  term ((-1 : Rat) / 4) [(0, 1)],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 2)],
  term (1 : Rat) [(1, 2), (2, 1)]
],
[
  term ((1 : Rat) / 4) [],
  term (1 : Rat) [(1, 1), (3, 1)],
  term (-2 : Rat) [(1, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_06`. -/
def k4_dead_06 : Certificate :=
  { generators := k4_dead_06_generators
    coefficients := k4_dead_06_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_06`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_06_valid : checkCertificate k4_dead_06 = true := by
  native_decide

/-- Class `k4_dead_07` — witness map `1:[0,2,3];2:[0,1,3];3:[0,1,2]`
    (R = 6, δ = 2, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_07_generators : List Poly :=
[
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_07` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_07_coefficients : List Poly :=
[
[],
[
  term ((4 : Rat) / 3) [],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((5 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(0, 1), (3, 2)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((1 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(1, 1), (3, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (3, 2)],
  term ((1 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((2 : Rat) / 3) [(2, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (2 : Rat) [(3, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_07`. -/
def k4_dead_07 : Certificate :=
  { generators := k4_dead_07_generators
    coefficients := k4_dead_07_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_07`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_07_valid : checkCertificate k4_dead_07 = true := by
  native_decide

/-- Class `k4_dead_08` — witness map `0:[1,2];1:[0,2,3];2:[0,1,3];3:[0,1,2]`
    (R = 7, δ = 3, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_08_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_08` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_08_coefficients : List Poly :=
[
[],
[],
[
  term ((4 : Rat) / 3) [],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((5 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(0, 1), (3, 2)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((1 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(1, 1), (3, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (3, 2)],
  term ((1 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((2 : Rat) / 3) [(2, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (2 : Rat) [(3, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_08`. -/
def k4_dead_08 : Certificate :=
  { generators := k4_dead_08_generators
    coefficients := k4_dead_08_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_08`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_08_valid : checkCertificate k4_dead_08 = true := by
  native_decide

/-- Class `k4_dead_09` — witness map `0:[1,2,3];1:[0,2,3];2:[0,1,3];3:[0,1,2]`
    (R = 8, δ = 4, kill = `base`).
    Generator polynomials: per active centre `c` with members
    `m₀ < … < mⱼ`, the equidistance differences `d²(c,m₀) − d²(c,mⱼ)`
    in the gauge `pt0=(0,0), pt1=(1,0)`. -/
def k4_dead_09_generators : List Poly :=
[
[
  term (1 : Rat) [],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (1 : Rat) [],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (2 : Rat) [(0, 1)],
  term (-1 : Rat) [(0, 2)],
  term (-1 : Rat) [(1, 2)]
],
[
  term (2 : Rat) [(2, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(0, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(2, 2)],
  term (-1 : Rat) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (2 : Rat) [(2, 1)]
],
[
  term (2 : Rat) [(0, 1), (2, 1)],
  term (-1 : Rat) [(0, 2)],
  term (2 : Rat) [(1, 1), (3, 1)],
  term (-1 : Rat) [(1, 2)]
]
]

/-- Cofactor polynomials for class `k4_dead_09` (`Σ coeff · gen = 1`, exact `ℚ`). -/
def k4_dead_09_coefficients : List Poly :=
[
[],
[],
[],
[
  term ((4 : Rat) / 3) [],
  term ((-1 : Rat) / 3) [(1, 1), (3, 1)],
  term ((5 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(0, 1), (3, 2)],
  term ((-1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((1 : Rat) / 3) [(3, 2)]
],
[
  term (1 : Rat) [(1, 1), (3, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (-1 : Rat) [],
  term (-1 : Rat) [(0, 1), (1, 1), (3, 1)],
  term ((-1 : Rat) / 3) [(0, 1), (3, 2)],
  term ((1 : Rat) / 3) [(1, 1), (2, 1), (3, 1)],
  term ((1 : Rat) / 2) [(1, 1), (3, 1)],
  term ((2 : Rat) / 3) [(2, 1)],
  term ((-5 : Rat) / 3) [(3, 2)]
],
[
  term (2 : Rat) [(3, 2)]
]
]

/-- Certificate for dead k=4 class `k4_dead_09`. -/
def k4_dead_09 : Certificate :=
  { generators := k4_dead_09_generators
    coefficients := k4_dead_09_coefficients }

set_option linter.style.nativeDecide false in
/-- The checker accepts the certificate for class `k4_dead_09`: the
    equality-only Nullstellensatz identity `Σ coeff · gen = 1` holds
    over exact `ℚ`, so the class's equidistance system is `ℂ`-empty. -/
theorem k4_dead_09_valid : checkCertificate k4_dead_09 = true := by
  native_decide

/-- All ten dead k=4 window-class certificates. -/
def k4DeadCertificates : List Certificate :=
  [k4_dead_00,
   k4_dead_01,
   k4_dead_02,
   k4_dead_03,
   k4_dead_04,
   k4_dead_05,
   k4_dead_06,
   k4_dead_07,
   k4_dead_08,
   k4_dead_09]

set_option linter.style.nativeDecide false in
/-- The checker accepts every dead k=4 window-class certificate. -/
theorem k4DeadCertificates_all_valid :
    k4DeadCertificates.all (fun c => checkCertificate c) = true := by
  native_decide

/-- Any valuation zeroing the generators of a certificate in the dead k=4
window bank is contradictory. This is the ambient-cardinality-independent
semantic consumer for the ten checked Nullstellensatz payloads. -/
theorem false_of_mem_k4DeadCertificates
    (ν : Nat → ℝ) {cert : Certificate}
    (hcert : cert ∈ k4DeadCertificates)
    (hgenerators : ∀ g ∈ cert.generators, evalPoly ν g = 0) :
    False :=
  false_of_checkCertificate ν cert
    (List.all_eq_true.mp k4DeadCertificates_all_valid cert hcert)
    hgenerators

end K4WindowBank

end EndpointCertificate

end Problem97
