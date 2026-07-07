/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.Foundation

/-!
# Endpoint certificate variables

This module records the column order used by the endpoint certificate
polynomials.
-/

open scoped EuclideanGeometry

namespace Problem97

namespace EndpointCertificate

namespace Variables

/-- The named variables in the endpoint certificate polynomial ring. -/
inductive EndpointVar where
  | ux | uy
  | s1x | s1y
  | s2x | s2y
  | s3x | s3y
  | pwx | pwy
  | pux | puy
  | q1x | q1y
  | q2x | q2y
  | tau
deriving DecidableEq, Repr

/-- Numeric column index used by the generated endpoint certificates. -/
def EndpointVar.index : EndpointVar → Nat
  | .ux => 0
  | .uy => 1
  | .s1x => 2
  | .s1y => 3
  | .s2x => 4
  | .s2y => 5
  | .s3x => 6
  | .s3y => 7
  | .pwx => 8
  | .pwy => 9
  | .pux => 10
  | .puy => 11
  | .q1x => 12
  | .q1y => 13
  | .q2x => 14
  | .q2y => 15
  | .tau => 16

/-- Evaluate a named endpoint variable against geometric point data. -/
def EndpointVar.eval
    (u s1 s2 s3 pw pu q1 q2 : ℝ²) (tau : ℝ) : EndpointVar → ℝ
  | .ux => u 0
  | .uy => u 1
  | .s1x => s1 0
  | .s1y => s1 1
  | .s2x => s2 0
  | .s2y => s2 1
  | .s3x => s3 0
  | .s3y => s3 1
  | .pwx => pw 0
  | .pwy => pw 1
  | .pux => pu 0
  | .puy => pu 1
  | .q1x => q1 0
  | .q1y => q1 1
  | .q2x => q2 0
  | .q2y => q2 1
  | .tau => tau

/-- The real variable assignment for endpoint certificate evaluation.  Indices
outside the generated 17-column ring are sent to zero. -/
def assignment
    (u s1 s2 s3 pw pu q1 q2 : ℝ²) (tau : ℝ) : Nat → ℝ
  | 0 => u 0
  | 1 => u 1
  | 2 => s1 0
  | 3 => s1 1
  | 4 => s2 0
  | 5 => s2 1
  | 6 => s3 0
  | 7 => s3 1
  | 8 => pw 0
  | 9 => pw 1
  | 10 => pu 0
  | 11 => pu 1
  | 12 => q1 0
  | 13 => q1 1
  | 14 => q2 0
  | 15 => q2 1
  | 16 => tau
  | _ => 0

@[simp] theorem assignment_index
    (u s1 s2 s3 pw pu q1 q2 : ℝ²) (tau : ℝ) (v : EndpointVar) :
    assignment u s1 s2 s3 pw pu q1 q2 tau v.index =
      v.eval u s1 s2 s3 pw pu q1 q2 tau := by
  cases v <;> rfl

end Variables

end EndpointCertificate

end Problem97
