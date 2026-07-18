/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.U1LargeCapRouteBTail

/-!
# Source-faithful reduction of the LIVE-C `t2` row-failure boundary

The theorem in this file keeps the actual production row types and proves that
the three-way metric failure is exactly a three-way omission from the extra
critical row's full support.  This is the strongest uniform local reduction:
the branch contains no positive placement shared by all three arms.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace LiveCT2RowFailureClosureScratch

open U1LargeCapRouteBTailMetricResidualTarget

def IsNamed {D : CounterexampleData} {source : ℝ²}
    (R : U1Depth5.CriticalRowPacket D source) (z : ℝ²) : Prop :=
  z = R.selected.l1 ∨ z = R.selected.l2 ∨
    z = R.selected.l3 ∨ z = R.selected.l4

/-- The exact production `hrowFailure` is equivalent to omission of at least
one of `f5`, `p`, or `q` from the exact extra critical shell. -/
theorem rowFailure_iff_supportOmission
    {D : CounterexampleData} {p q t1 t2 t3 u : ℝ²}
    {rows : U1Depth5.CriticalSourceRows D q t1 t2 t3 u}
    (f2CriticalRow :
      U1Depth5.CriticalRowPacket D
        (rows.pointOfChoice
          { source := U1Depth5.CriticalSource.t2, slot := 0 }))
    (hcenter : f2CriticalRow.center = t2)
    (hpA : p ∈ D.A)
    (hqA : q ∈ D.A) :
    (dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 }) ≠
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∨
      dist t2 p ≠
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 }) ∨
      dist t2 q ≠
        dist t2
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 0 })) ↔
      (¬ IsNamed f2CriticalRow
          (rows.pointOfChoice
            { source := U1Depth5.CriticalSource.t2, slot := 1 })) ∨
        (¬ IsNamed f2CriticalRow p) ∨
        (¬ IsNamed f2CriticalRow q) := by
  let f5 :=
    rows.pointOfChoice
      { source := U1Depth5.CriticalSource.t2, slot := 1 }
  have hf5A : f5 ∈ D.A :=
    rows.pointOfChoice_mem
      { source := U1Depth5.CriticalSource.t2, slot := 1 }
  have hf5Iff :
      dist t2 f5 =
          dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) ↔
        IsNamed f2CriticalRow f5 := by
    simpa [IsNamed] using
      f2CriticalRow_hrow_iff_named f2CriticalRow hcenter hf5A
  have hpIff :
      dist t2 p =
          dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) ↔
        IsNamed f2CriticalRow p := by
    simpa [IsNamed] using
      f2CriticalRow_hrow_iff_named f2CriticalRow hcenter hpA
  have hqIff :
      dist t2 q =
          dist t2
            (rows.pointOfChoice
              { source := U1Depth5.CriticalSource.t2, slot := 0 }) ↔
        IsNamed f2CriticalRow q := by
    simpa [IsNamed] using
      f2CriticalRow_hrow_iff_named f2CriticalRow hcenter hqA
  constructor
  · intro h
    rcases h with h | h | h
    · exact Or.inl (fun hn => h (hf5Iff.mpr hn))
    · exact Or.inr (Or.inl (fun hn => h (hpIff.mpr hn)))
    · exact Or.inr (Or.inr (fun hn => h (hqIff.mpr hn)))
  · intro h
    rcases h with h | h | h
    · exact Or.inl (fun heq => h (hf5Iff.mp heq))
    · exact Or.inr (Or.inl (fun heq => h (hpIff.mp heq)))
    · exact Or.inr (Or.inr (fun heq => h (hqIff.mp heq)))

#print axioms rowFailure_iff_supportOmission

end LiveCT2RowFailureClosureScratch
end Problem97
