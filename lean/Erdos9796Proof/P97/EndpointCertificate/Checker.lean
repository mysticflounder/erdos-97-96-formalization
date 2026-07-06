/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Mathlib.Data.Rat.Defs

/-!
# Endpoint certificate checker

This module defines the small symbolic polynomial checker used by the endpoint
certificate artifacts.  It verifies identities over exact rational coefficients;
it does not encode any geometric endpoint facts by itself.
-/

namespace Problem97

namespace EndpointCertificate

/-- A sparse polynomial term with a rational coefficient and a sparse monomial.

The monomial list stores `(variable index, exponent)` pairs.  Checker operations
canonicalize monomials before comparing terms. -/
structure Term where
  coeff : Rat
  monom : List (Nat × Nat)
deriving DecidableEq, Repr

/-- A sparse rational polynomial. -/
abbrev Poly := List Term

/-- A Nullstellensatz-style polynomial identity certificate. -/
structure Certificate where
  generators : List Poly
  coefficients : List Poly
deriving Repr

/-- Construct a sparse polynomial term. -/
def term (coeff : Rat) (monom : List (Nat × Nat)) : Term :=
  { coeff, monom }

/-- Insert or add one exponent into a sorted sparse monomial. -/
private def addExponent (i e : Nat) : List (Nat × Nat) → List (Nat × Nat)
  | [] => if e = 0 then [] else [(i, e)]
  | p :: ps =>
      match compare i p.1 with
      | .lt => if e = 0 then p :: ps else (i, e) :: p :: ps
      | .eq =>
          let e' := e + p.2
          if e' = 0 then ps else (i, e') :: ps
      | .gt => p :: addExponent i e ps

/-- Canonicalize a sparse monomial. -/
private def normalizeMonom : List (Nat × Nat) → List (Nat × Nat)
  | [] => []
  | p :: ps => addExponent p.1 p.2 (normalizeMonom ps)

/-- Multiply sparse monomials. -/
private def mulMonom (a b : List (Nat × Nat)) : List (Nat × Nat) :=
  b.foldl (fun acc p => addExponent p.1 p.2 acc) (normalizeMonom a)

/-- Lexicographic comparison on sparse monomial entries. -/
private def cmpPair (a b : Nat × Nat) : Ordering :=
  match compare a.1 b.1 with
  | .eq => compare a.2 b.2
  | ord => ord

/-- Lexicographic comparison on canonical sparse monomials. -/
private def cmpMonom : List (Nat × Nat) → List (Nat × Nat) → Ordering
  | [], [] => .eq
  | [], _ :: _ => .lt
  | _ :: _, [] => .gt
  | a :: as, b :: bs =>
      match cmpPair a b with
      | .eq => cmpMonom as bs
      | ord => ord

/-- Insert a canonical term into a canonical polynomial. -/
private def insertTerm (t : Term) : Poly → Poly
  | [] => if t.coeff = 0 then [] else [t]
  | u :: us =>
      if t.coeff = 0 then
        u :: us
      else
        match cmpMonom t.monom u.monom with
        | .lt => t :: u :: us
        | .eq =>
            let coeff := t.coeff + u.coeff
            if coeff = 0 then us else { coeff, monom := u.monom } :: us
        | .gt => u :: insertTerm t us

/-- Canonicalize a sparse term. -/
private def normalizeTerm (t : Term) : Term :=
  { coeff := t.coeff, monom := normalizeMonom t.monom }

/-- Canonicalize a sparse polynomial by merging equal monomials and removing
zero coefficients. -/
def normalizePoly (p : Poly) : Poly :=
  p.foldl (fun acc t => insertTerm (normalizeTerm t) acc) []

/-- Decide whether a sparse monomial is in canonical form. -/
private def isNormalizedMonom : List (Nat × Nat) → Bool
  | [] => true
  | p :: [] => p.2 != 0
  | p :: q :: ps =>
      p.2 != 0 && decide (compare p.1 q.1 = .lt) && isNormalizedMonom (q :: ps)

/-- Decide whether a sparse polynomial is in canonical form. -/
private def isNormalizedPoly : Poly → Bool
  | [] => true
  | t :: ts =>
      t.coeff != 0 && isNormalizedMonom t.monom &&
        go t.monom ts
where
  go (prev : List (Nat × Nat)) : Poly → Bool
    | [] => true
    | t :: ts =>
        t.coeff != 0 && isNormalizedMonom t.monom &&
          decide (cmpMonom prev t.monom = .lt) && go t.monom ts

/-- Merge canonical sparse rational polynomials. -/
private def addCanon : Poly → Poly → Poly
  | [], q => q
  | p, [] => p
  | a :: as, b :: bs =>
      match cmpMonom a.monom b.monom with
      | .lt => a :: addCanon as (b :: bs)
      | .eq =>
          let coeff := a.coeff + b.coeff
          if coeff = 0 then
            addCanon as bs
          else
            { coeff, monom := a.monom } :: addCanon as bs
      | .gt => b :: addCanon (a :: as) bs

/-- Add sparse rational polynomials. -/
def addPoly (p q : Poly) : Poly :=
  addCanon (normalizePoly p) (normalizePoly q)

/-- Multiply sparse terms. -/
private def mulTerm (a b : Term) : Term :=
  { coeff := a.coeff * b.coeff, monom := mulMonom a.monom b.monom }

/-- Multiply a canonical polynomial by one canonical term. -/
private def mulTermPoly (a : Term) (q : Poly) : Poly :=
  normalizePoly (q.map (fun b => mulTerm a b))

/-- Multiply canonical sparse rational polynomials. -/
private def mulCanon (p q : Poly) : Poly :=
  p.foldl (fun acc a => addCanon acc (mulTermPoly a q)) []

/-- Multiply sparse rational polynomials. -/
def mulPoly (p q : Poly) : Poly :=
  mulCanon (normalizePoly p) (normalizePoly q)

/-- Sum pairwise products of coefficient and generator polynomials. -/
private def sumProductsCanon : List Poly → List Poly → Option Poly
  | [], [] => some []
  | g :: gs, c :: cs =>
      match sumProductsCanon gs cs with
      | some acc => some (addCanon (mulCanon c g) acc)
      | none => none
  | _, _ => none

/-- The constant polynomial `1`. -/
def onePoly : Poly :=
  [term 1 []]

/-- Sum a list of canonical sparse rational polynomials. -/
private def sumCanonProducts (products : List Poly) : Poly :=
  products.foldl addCanon []

/-- Check a list of emitted product polynomials sums to `1`.

This is the second-stage checker needed by internally sharded certificates:
large certificates can prove per-generator product identities separately, then
use this checker to verify the final product sum. -/
def checkProductSumEq (products : List Poly) (target : Poly) : Bool :=
  if products.all isNormalizedPoly && isNormalizedPoly target then
    decide (sumCanonProducts products = target)
  else
    false

/-- Check a list of emitted product polynomials sums to `1`. -/
def checkProductSum (products : List Poly) : Bool :=
  checkProductSumEq products onePoly

/-- Check the certificate identity `sum_i coefficients[i] * generators[i] = 1`.

The checker returns `false` if the generator and coefficient lists have
different lengths. -/
def checkCertificate (cert : Certificate) : Bool :=
  if cert.generators.all isNormalizedPoly && cert.coefficients.all isNormalizedPoly then
    match sumProductsCanon cert.generators cert.coefficients with
    | some p => decide (p = onePoly)
    | none => false
  else
    false

end EndpointCertificate

end Problem97
