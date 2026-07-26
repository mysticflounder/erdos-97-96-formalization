/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib

/-!
# Authenticated compact-P4 atom bindings

This module has no valuation.  It is an exact typed name table joining the
compact dense variables to source-map atom provenance.  `DirectSourceAdapter`
is deliberately only a later-adapter seam: no instance is constructed here.
-/

namespace Problem97.P4CompactAtomBindingScratch

inductive CompactFamily where
  | membership | radiusEquality | firstApexClass | blockerChoice
  | criticalSupport | rowSupport | outerArc
  deriving Repr, DecidableEq

inductive OuterSide where
  | left | right
  deriving Repr, DecidableEq

/-- Typed source parameters, preserving the parameter roles in the core map. -/
inductive AtomParameters where
  | membership (center point : Nat)
  | radiusEquality (center left right : Nat)
  | firstApexClass (point : Nat)
  | blockerChoice (source center : Nat)
  | criticalSupport (source point : Nat)
  | rowSupport (center point0 point1 point2 point3 : Nat)
  | outerArc (center : Nat) (side : OuterSide) (turnMask : Nat)
  deriving Repr, DecidableEq

structure AtomBinding where
  dense : Nat
  sourceId : Nat
  sourceName : String
  family : CompactFamily
  parameters : AtomParameters
  deriving Repr, DecidableEq

/-- A future `Direct`-source adapter must provide precisely these seven
interpretations.  This is intentionally not a total Boolean valuation. -/
structure DirectSourceAdapter (Direct : Type) where
  membership : Direct → Nat → Nat → Prop
  radiusEquality : Direct → Nat → Nat → Nat → Prop
  firstApexClass : Direct → Nat → Prop
  blockerChoice : Direct → Nat → Nat → Prop
  criticalSupport : Direct → Nat → Nat → Prop
  rowSupport : Direct → Nat → Nat → Nat → Nat → Nat → Prop
  outerArc : Direct → Nat → OuterSide → Nat → Prop

def AtomParameters.interpret {Direct : Type} (adapter : DirectSourceAdapter Direct)
    (source : Direct) : AtomParameters → Prop
  | .membership center point => adapter.membership source center point
  | .radiusEquality center left right => adapter.radiusEquality source center left right
  | .firstApexClass point => adapter.firstApexClass source point
  | .blockerChoice origin center => adapter.blockerChoice source origin center
  | .criticalSupport origin point => adapter.criticalSupport source origin point
  | .rowSupport center p0 p1 p2 p3 => adapter.rowSupport source center p0 p1 p2 p3
  | .outerArc center side mask => adapter.outerArc source center side mask

def AtomBinding.familyMatches : AtomBinding → Bool
  | ⟨_, _, _, .membership, .membership _ _⟩ => true
  | ⟨_, _, _, .radiusEquality, .radiusEquality _ _ _⟩ => true
  | ⟨_, _, _, .firstApexClass, .firstApexClass _⟩ => true
  | ⟨_, _, _, .blockerChoice, .blockerChoice _ _⟩ => true
  | ⟨_, _, _, .criticalSupport, .criticalSupport _ _⟩ => true
  | ⟨_, _, _, .rowSupport, .rowSupport _ _ _ _ _⟩ => true
  | ⟨_, _, _, .outerArc, .outerArc _ _ _⟩ => true
  | _ => false

end Problem97.P4CompactAtomBindingScratch
