/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.MultiCenter.Realization

/-!
# Multi-center typed class certificate decoder

This module is the small hand-written decoder for generated multi-center class
certificate rows.  Generated banks store raw mask/count data decoded from the
JSON class keys; this file interprets those rows as actual `JointClass` values.
-/

namespace Problem97
namespace MultiCenter
namespace Certificate

/-- Raw finite data decoded from one L2 class key.

The `counts` list has 21 entries in this order:
`S[1..7]`, `O1[1..7]`, `O2[1..7]`. -/
structure RawClassRow where
  id : Nat
  firstN : Nat
  lastN : Nat
  participantsMask : Nat
  moser0 : Nat
  moser1 : Nat
  moser2 : Nat
  counts : List Nat
  deriving Repr, DecidableEq

namespace RawClassRow

/-- The bit assigned to a Moser vertex in raw masks. -/
def vertexBit (v : MoserVertex) : Nat :=
  2 ^ v.val

/-- Whether raw mask `mask` contains vertex `v`. -/
def maskContains (mask : Nat) (v : MoserVertex) : Bool :=
  decide (((mask / vertexBit v) % 2) = 1)

/-- Decode a raw three-bit mask as a finite set of Moser vertices. -/
def maskToFinset (mask : Nat) : Finset MoserVertex :=
  (Finset.univ : Finset MoserVertex).filter (fun v => maskContains mask v = true)

/-- Encode a finite set of Moser vertices as a raw three-bit mask. -/
def finsetMask (mask : Finset MoserVertex) : Nat :=
  mask.sum vertexBit

/-- Offset of a cap's seven mask-count entries in `RawClassRow.counts`. -/
def capOffset : JointCap -> Nat
  | .S => 0
  | .O1 => 7
  | .O2 => 14

/-- Raw count for cap `cap` and encoded mask `mask`. -/
def countAtMask (row : RawClassRow) (cap : JointCap) (mask : Nat) : Nat :=
  if 1 ≤ mask ∧ mask ≤ 7 then
    row.counts.getD (capOffset cap + (mask - 1)) 0
  else
    0

/-- Raw count for cap `cap` and finite-set mask `mask`. -/
def countAt (row : RawClassRow) (cap : JointCap)
    (mask : Finset MoserVertex) : Nat :=
  row.countAtMask cap (finsetMask mask)

/-- Decode the three raw Moser masks. -/
def moserMaskAt (row : RawClassRow) : MoserVertex -> Finset MoserVertex
  | ⟨0, _⟩ => maskToFinset row.moser0
  | ⟨1, _⟩ => maskToFinset row.moser1
  | ⟨2, _⟩ => maskToFinset row.moser2

/-- Interpret a raw certificate row as a semantic `JointClass`. -/
def toJointClass (row : RawClassRow) : JointClass where
  layer := .L2
  participants := maskToFinset row.participantsMask
  moserMask := row.moserMaskAt
  capCounts := row.countAt

/-- Basic structural well-formedness of the raw row relative to a terminal
loaded `n`.  This is intentionally a cheap check over the generated data;
semantic LOCAL facts are checked by the trusted checker and later bridge
layers. -/
def structuralOKAt (terminalN : Nat) (row : RawClassRow) : Bool :=
  decide (row.firstN ≤ row.lastN) &&
    decide (row.lastN = terminalN) &&
      (row.participantsMask == 7) &&
        decide (row.moser0 < 8) &&
          decide (row.moser1 < 8) &&
            decide (row.moser2 < 8) &&
              (row.counts.length == 21) &&
                row.counts.all (fun count => decide (count ≤ 4))

/-- Structural well-formedness for the current L2 certificate terminal row. -/
def structuralOK (row : RawClassRow) : Bool :=
  row.structuralOKAt 32

end RawClassRow

end Certificate
end MultiCenter
end Problem97
