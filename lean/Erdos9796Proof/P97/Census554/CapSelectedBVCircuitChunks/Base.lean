/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

namespace Problem97.Census554.CapSelectedBVCircuit

abbrev RowBits := BitVec 121
abbrev ColorBits := BitVec 847

abbrev rowBit (rows : RowBits) (center point : Nat) : Bool :=
  rows.getLsbD (11 * center + point)

abbrev edgeColor (colors : ColorBits) (left right : Nat) : BitVec 7 :=
  colors.extractLsb' (7 * (11 * left + right)) 7

end Problem97.Census554.CapSelectedBVCircuit
