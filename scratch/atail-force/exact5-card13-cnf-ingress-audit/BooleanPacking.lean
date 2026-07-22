/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Batteries.Data.BitVec.Lemmas
import Mathlib.Tactic

/-!
# Boolean packing for the exact-five card-thirteen certificate

This scratch module constructs the Boolean witnesses used by the generated
card-thirteen circuits.  Its layouts agree exactly with the generated
`rowBit`, `blockerAt`, `shellBit`, and `firstRowBit` accessors.
-/

namespace Problem97
namespace ATailExactFiveCard13CnfIngressScratch

/-- The three `13 × 13` Boolean row families in the generated 507-bit layout. -/
abbrev RowBits := BitVec 507

/-- The thirteen four-bit blocker indices in the generated 52-bit layout. -/
abbrev BlockerBits := BitVec 52

/-- The exact-five second-apex shell in the generated thirteen-bit layout. -/
abbrev ShellBits := BitVec 13

/-- The same-radius first-apex row in the generated thirteen-bit layout. -/
abbrev FirstRowBits := BitVec 13

/-- Read one Boolean row entry using the generated circuit's offsets. -/
abbrev rowBit (rows : RowBits) (family center point : Nat) : Bool :=
  rows.getLsbD (169 * family + 13 * center + point)

/-- Read one four-bit blocker index using the generated circuit's offsets. -/
abbrev blockerAt (blockers : BlockerBits) (source : Nat) : BitVec 4 :=
  blockers.extractLsb' (4 * source) 4

/-- Read one exact-five shell membership bit. -/
abbrev shellBit (shell : ShellBits) (point : Nat) : Bool :=
  shell.getLsbD point

/-- Read one same-radius first-apex-row membership bit. -/
abbrev firstRowBit (row : FirstRowBits) (point : Nat) : Bool :=
  row.getLsbD point

/-- Pack three `13 × 13` row families in family-major, center-major,
point-major order. -/
def packThreeRowFamilies (row : Fin 3 → Fin 13 → Fin 13 → Bool) : RowBits :=
  BitVec.ofFnLE fun bit ↦
    let family : Fin 3 := ⟨bit.val / 169, by omega⟩
    let withinFamily := bit.val % 169
    let center : Fin 13 := ⟨withinFamily / 13, by omega⟩
    let point : Fin 13 := ⟨withinFamily % 13, by omega⟩
    row family center point

/-- `rowBit` exactly recovers the source entry packed at `(family, center, point)`. -/
@[simp]
theorem rowBit_packThreeRowFamilies
    (row : Fin 3 → Fin 13 → Fin 13 → Bool)
    (family : Fin 3) (center point : Fin 13) :
    rowBit (packThreeRowFamilies row) family.val center.val point.val =
      row family center point := by
  unfold rowBit
  rw [packThreeRowFamilies, BitVec.getLsbD_ofFnLE]
  have hpacked : 169 * family.val + 13 * center.val + point.val < 507 := by omega
  rw [dif_pos hpacked]
  have hfamily :
      (169 * family.val + 13 * center.val + point.val) / 169 = family.val := by
    omega
  have hwithin :
      (169 * family.val + 13 * center.val + point.val) % 169 =
        13 * center.val + point.val := by
    omega
  have hcenter : (13 * center.val + point.val) / 13 = center.val := by omega
  have hpoint : (13 * center.val + point.val) % 13 = point.val := by omega
  simp only [hfamily, hwithin, hcenter, hpoint]

/-- Pack thirteen four-bit blocker indices in source-major order. -/
def packThirteenBlockers (blocker : Fin 13 → BitVec 4) : BlockerBits :=
  BitVec.ofFnLE fun bit ↦
    let source : Fin 13 := ⟨bit.val / 4, by omega⟩
    (blocker source).getLsbD (bit.val % 4)

/-- `blockerAt` exactly recovers the source's four-bit blocker index. -/
@[simp]
theorem blockerAt_packThirteenBlockers
    (blocker : Fin 13 → BitVec 4) (source : Fin 13) :
    blockerAt (packThirteenBlockers blocker) source.val = blocker source := by
  apply BitVec.eq_of_getLsbD_eq
  intro bit hbit
  rw [BitVec.getLsbD_extractLsb']
  simp only [hbit, decide_true, Bool.true_and]
  rw [packThirteenBlockers, BitVec.getLsbD_ofFnLE]
  have hpacked : 4 * source.val + bit < 52 := by omega
  rw [dif_pos hpacked]
  have hsource : (4 * source.val + bit) / 4 = source.val := by omega
  have hwithin : (4 * source.val + bit) % 4 = bit := by omega
  simp only [hsource, hwithin]

/-- Pack the exact-five second-apex shell in point order. -/
def packShell (member : Fin 13 → Bool) : ShellBits :=
  BitVec.ofFnLE member

/-- `shellBit` exactly recovers the source shell membership predicate. -/
@[simp]
theorem shellBit_packShell (member : Fin 13 → Bool) (point : Fin 13) :
    shellBit (packShell member) point.val = member point := by
  unfold shellBit
  rw [packShell, BitVec.getLsbD_ofFnLE, dif_pos point.isLt]

/-- Pack the same-radius first-apex row in point order. -/
def packFirstApexRow (member : Fin 13 → Bool) : FirstRowBits :=
  BitVec.ofFnLE member

/-- `firstRowBit` exactly recovers the source row membership predicate. -/
@[simp]
theorem firstRowBit_packFirstApexRow (member : Fin 13 → Bool) (point : Fin 13) :
    firstRowBit (packFirstApexRow member) point.val = member point := by
  unfold firstRowBit
  rw [packFirstApexRow, BitVec.getLsbD_ofFnLE, dif_pos point.isLt]

#print axioms rowBit_packThreeRowFamilies
#print axioms blockerAt_packThirteenBlockers
#print axioms shellBit_packShell
#print axioms firstRowBit_packFirstApexRow

end ATailExactFiveCard13CnfIngressScratch
end Problem97
