/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Tactic

private abbrev colorAt (bits : BitVec 10) (offset : Nat) : BitVec 2 :=
  bits.extractLsb' offset 2

private abbrev hasDuplicate (bits : BitVec 10) : Bool :=
  colorAt bits 0 == colorAt bits 2 || colorAt bits 0 == colorAt bits 4 ||
  colorAt bits 0 == colorAt bits 6 || colorAt bits 0 == colorAt bits 8 ||
  colorAt bits 2 == colorAt bits 4 || colorAt bits 2 == colorAt bits 6 ||
  colorAt bits 2 == colorAt bits 8 || colorAt bits 4 == colorAt bits 6 ||
  colorAt bits 4 == colorAt bits 8 || colorAt bits 6 == colorAt bits 8

example (bits : BitVec 10) : hasDuplicate bits = true := by
  bv_decide
