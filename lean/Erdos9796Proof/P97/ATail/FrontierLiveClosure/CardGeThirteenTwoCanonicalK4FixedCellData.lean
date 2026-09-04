/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ThreeBlockPairRowDomainCertificate

/-!
# Transparent data for the two-canonical-K4 fixed cell

This module transcribes the exact finite data from the 2026-09-04 fixed-cell
bundle with SHA-256
`35e4cead03ce736e2c09d8a3c7bd55166b3dc8af23f89e13fe558ffdeeb2db1b`.
Raw labels are converted to positions in the direct order
`[2, 8, 9, 10, 11, 12, 1, 3, 4, 5, 0, 6, 7]`.

Only transparent supports, endpoints, Kalmanson terms, and routing data live
here.  Equality paths and geometric soundness theorems belong downstream.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenTwoCanonicalK4FixedCellData

open GenericRowNogoodCertificate

abbrev Label := Fin 13

/-- Convert a raw label to its position in the fixed direct cyclic order. -/
def rawToPos : Label → Label :=
  ![10,
    6,
    0,
    7,
    8,
    9,
    11,
    12,
    1,
    2,
    3,
    4,
    5]

/-- Convert a raw four-support to positional coordinates. -/
def rawSupport (a b c d : Label) : Finset Label :=
  {rawToPos a, rawToPos b, rawToPos c, rawToPos d}

/-- Convert one raw ordered quadrilateral into a unit-weight Kalmanson term. -/
def rawTerm (a b c d : Label) (form : KalmansonForm) :
    WeightedKalmansonTerm Label :=
  { quad :=
      { a := rawToPos a
        b := rawToPos b
        c := rawToPos c
        d := rawToPos d }
    form := form
    weight := 1 }

/-- The four fixed, independently tagged source rows. -/
def baseChoices : List (RowChoice Label) :=
  [{ center := rawToPos 6, support := rawSupport 0 1 4 9 },
   { center := rawToPos 0, support := rawSupport 2 8 10 11 },
   { center := rawToPos 7, support := rawSupport 3 5 6 12 },
   { center := rawToPos 1, support := rawSupport 0 6 7 8 }]

/-- The twenty-seven residual center-2 supports, in bundle order. -/
def center2Domain : Fin 27 → Finset Label :=
  ![rawSupport 1 3 7 8,
    rawSupport 1 3 7 10,
    rawSupport 1 3 7 11,
    rawSupport 1 5 7 8,
    rawSupport 1 5 7 10,
    rawSupport 1 5 7 11,
    rawSupport 1 7 8 12,
    rawSupport 1 7 10 12,
    rawSupport 1 7 11 12,
    rawSupport 3 4 7 8,
    rawSupport 3 4 7 10,
    rawSupport 3 4 7 11,
    rawSupport 4 5 7 8,
    rawSupport 4 5 7 10,
    rawSupport 4 5 7 11,
    rawSupport 4 7 8 12,
    rawSupport 4 7 10 12,
    rawSupport 4 7 11 12,
    rawSupport 3 7 8 9,
    rawSupport 3 7 9 10,
    rawSupport 3 7 9 11,
    rawSupport 5 7 8 9,
    rawSupport 5 7 9 10,
    rawSupport 5 7 9 11,
    rawSupport 7 8 9 12,
    rawSupport 7 9 10 12,
    rawSupport 7 9 11 12]

/-- The sixteen residual center-5 supports, in bundle order. -/
def center5Domain : Fin 16 → Finset Label :=
  ![rawSupport 0 3 4 10,
    rawSupport 0 3 4 11,
    rawSupport 0 3 9 10,
    rawSupport 0 3 9 11,
    rawSupport 0 4 10 12,
    rawSupport 0 4 11 12,
    rawSupport 0 9 10 12,
    rawSupport 0 9 11 12,
    rawSupport 3 6 9 10,
    rawSupport 3 6 9 11,
    rawSupport 4 7 10 12,
    rawSupport 4 7 11 12,
    rawSupport 6 9 10 12,
    rawSupport 6 9 11 12,
    rawSupport 7 9 10 12,
    rawSupport 7 9 11 12]

/-- Endpoints for the eighteen center-2 pair certificates, in bundle order. -/
def center2PairEndpoints : Fin 18 → Label × Label :=
  ![(rawToPos 0, rawToPos 1),
    (rawToPos 0, rawToPos 4),
    (rawToPos 0, rawToPos 6),
    (rawToPos 0, rawToPos 7),
    (rawToPos 0, rawToPos 9),
    (rawToPos 1, rawToPos 4),
    (rawToPos 1, rawToPos 9),
    (rawToPos 3, rawToPos 5),
    (rawToPos 3, rawToPos 6),
    (rawToPos 3, rawToPos 12),
    (rawToPos 4, rawToPos 9),
    (rawToPos 5, rawToPos 6),
    (rawToPos 5, rawToPos 12),
    (rawToPos 6, rawToPos 7),
    (rawToPos 6, rawToPos 12),
    (rawToPos 8, rawToPos 10),
    (rawToPos 8, rawToPos 11),
    (rawToPos 10, rawToPos 11)]

/-- Kalmanson terms for the eighteen center-2 pair certificates. -/
def center2PairTerms : Fin 18 → List (WeightedKalmansonTerm Label) :=
  ![[rawTerm 2 1 0 6 .adjacentSides],
    [rawTerm 2 4 0 6 .adjacentSides],
    [rawTerm 2 1 0 6 .innerOuter],
    [rawTerm 2 1 0 7 .innerOuter],
    [rawTerm 2 9 0 6 .adjacentSides],
    [rawTerm 2 1 4 6 .adjacentSides],
    [rawTerm 2 9 1 6 .adjacentSides],
    [rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 3 6 7 .adjacentSides],
    [rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 9 4 6 .adjacentSides],
    [rawTerm 2 5 6 7 .adjacentSides],
    [rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 1 6 7 .innerOuter],
    [rawTerm 2 12 6 7 .adjacentSides],
    [rawTerm 2 8 10 0 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides]]

/-- Endpoints for the twenty-seven center-5 pair certificates, in bundle order. -/
def center5PairEndpoints : Fin 27 → Label × Label :=
  ![(rawToPos 0, rawToPos 2),
    (rawToPos 0, rawToPos 6),
    (rawToPos 0, rawToPos 7),
    (rawToPos 0, rawToPos 8),
    (rawToPos 1, rawToPos 2),
    (rawToPos 1, rawToPos 4),
    (rawToPos 1, rawToPos 6),
    (rawToPos 1, rawToPos 7),
    (rawToPos 1, rawToPos 8),
    (rawToPos 1, rawToPos 9),
    (rawToPos 1, rawToPos 10),
    (rawToPos 1, rawToPos 11),
    (rawToPos 2, rawToPos 6),
    (rawToPos 2, rawToPos 7),
    (rawToPos 2, rawToPos 8),
    (rawToPos 2, rawToPos 10),
    (rawToPos 2, rawToPos 11),
    (rawToPos 3, rawToPos 7),
    (rawToPos 3, rawToPos 12),
    (rawToPos 4, rawToPos 6),
    (rawToPos 4, rawToPos 9),
    (rawToPos 6, rawToPos 7),
    (rawToPos 6, rawToPos 8),
    (rawToPos 7, rawToPos 8),
    (rawToPos 8, rawToPos 10),
    (rawToPos 8, rawToPos 11),
    (rawToPos 10, rawToPos 11)]

/-- Kalmanson terms for the twenty-seven center-5 pair certificates. -/
def center5PairTerms : Fin 27 → List (WeightedKalmansonTerm Label) :=
  ![[rawTerm 2 1 5 0 .adjacentSides,
      rawTerm 2 8 1 0 .innerOuter],
    [rawTerm 1 5 0 6 .innerOuter],
    [rawTerm 1 5 0 7 .innerOuter],
    [rawTerm 8 1 5 0 .adjacentSides],
    [rawTerm 2 1 5 0 .innerOuter,
      rawTerm 8 1 0 6 .adjacentSides],
    [rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 1 5 0 6 .adjacentSides],
    [rawTerm 1 5 0 6 .adjacentSides,
      rawTerm 1 5 6 7 .innerOuter],
    [rawTerm 8 1 0 6 .adjacentSides,
      rawTerm 8 1 5 0 .innerOuter],
    [rawTerm 9 1 5 6 .innerOuter],
    [rawTerm 10 1 5 0 .innerOuter,
      rawTerm 8 1 0 6 .adjacentSides],
    [rawTerm 11 1 5 0 .innerOuter,
      rawTerm 8 1 0 6 .adjacentSides],
    [rawTerm 2 1 5 6 .adjacentSides,
      rawTerm 2 8 1 0 .innerOuter],
    [rawTerm 2 1 5 7 .adjacentSides,
      rawTerm 2 8 1 0 .innerOuter],
    [rawTerm 2 8 5 0 .innerOuter],
    [rawTerm 2 10 5 0 .innerOuter],
    [rawTerm 2 11 5 0 .innerOuter],
    [rawTerm 1 3 5 7 .innerOuter,
      rawTerm 1 5 6 7 .adjacentSides],
    [rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 1 4 5 6 .innerOuter,
      rawTerm 1 5 0 6 .adjacentSides],
    [rawTerm 9 4 5 6 .innerOuter],
    [rawTerm 1 5 6 7 .innerOuter],
    [rawTerm 8 1 5 6 .adjacentSides],
    [rawTerm 8 1 5 7 .adjacentSides],
    [rawTerm 8 10 5 0 .innerOuter],
    [rawTerm 8 11 5 0 .innerOuter],
    [rawTerm 10 11 5 0 .innerOuter]]

/-- The sixty-three distinct joint certificate term lists, in bundle order. -/
def jointTerms : Fin 63 → List (WeightedKalmansonTerm Label) :=
  ![[rawTerm 2 10 12 5 .adjacentSides],
    [rawTerm 2 10 3 5 .adjacentSides],
    [rawTerm 2 10 4 5 .adjacentSides],
    [rawTerm 2 11 12 5 .adjacentSides],
    [rawTerm 2 11 3 5 .adjacentSides],
    [rawTerm 2 11 4 5 .adjacentSides],
    [rawTerm 2 12 4 5 .adjacentSides],
    [rawTerm 2 12 5 7 .innerOuter],
    [rawTerm 2 3 4 5 .adjacentSides],
    [rawTerm 2 9 10 5 .adjacentSides],
    [rawTerm 2 9 11 5 .adjacentSides],
    [rawTerm 2 9 12 5 .adjacentSides],
    [rawTerm 2 9 3 5 .adjacentSides],
    [rawTerm 2 10 1 5 .adjacentSides,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 3 5 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 4 5 .adjacentSides],
    [rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 10 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 11 1 5 .adjacentSides,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 11 3 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 11 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 11 4 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 12 5 .adjacentSides],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 3 5 .adjacentSides],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 4 5 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 3 5 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 4 5 .adjacentSides],
    [rawTerm 2 9 10 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 9 10 5 .adjacentSides,
      rawTerm 2 10 11 0 .adjacentSides],
    [rawTerm 2 9 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 9 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 9 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 9 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 1 5 .adjacentSides,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 10 11 0 .adjacentSides,
      rawTerm 2 11 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 11 1 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 11 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides,
      rawTerm 10 11 5 0 .innerOuter],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 1 5 .adjacentSides,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 8 10 0 .adjacentSides,
      rawTerm 2 10 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 1 5 .adjacentSides,
      rawTerm 1 4 5 6 .innerOuter],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 12 3 5 7 .innerOuter],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 3 7 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 12 5 .adjacentSides,
      rawTerm 2 12 5 7 .adjacentSides],
    [rawTerm 2 8 11 0 .adjacentSides,
      rawTerm 2 11 3 5 .adjacentSides,
      rawTerm 2 3 5 7 .adjacentSides],
    [rawTerm 2 8 9 0 .adjacentSides,
      rawTerm 9 10 0 6 .innerOuter,
      rawTerm 10 4 5 6 .innerOuter],
    [rawTerm 2 8 9 0 .adjacentSides,
      rawTerm 9 11 0 6 .innerOuter,
      rawTerm 11 4 5 6 .innerOuter]]

/-- Route each residual support pair to its joint certificate. -/
def jointRoute : Fin 27 → Fin 16 → Fin 63 :=
  ![![30, 33, 30, 33, 53, 58, 53, 58, 30, 33, 53, 58, 53, 58, 53, 58],
    ![1, 15, 1, 15, 18, 43, 18, 43, 1, 15, 18, 43, 18, 43, 18, 43],
    ![26, 4, 26, 4, 48, 24, 48, 24, 26, 4, 48, 24, 48, 24, 48, 24],
    ![51, 56, 55, 60, 54, 59, 54, 59, 55, 60, 7, 7, 54, 59, 7, 7],
    ![13, 41, 20, 45, 19, 44, 19, 44, 20, 45, 7, 7, 19, 44, 7, 7],
    ![46, 21, 50, 27, 49, 25, 49, 25, 50, 27, 7, 7, 49, 25, 7, 7],
    ![52, 57, 52, 57, 29, 32, 29, 32, 52, 57, 29, 32, 29, 32, 29, 32],
    ![17, 42, 17, 42, 0, 14, 0, 14, 17, 42, 0, 14, 0, 14, 0, 14],
    ![47, 23, 47, 23, 22, 3, 22, 3, 47, 23, 22, 3, 22, 3, 22, 3],
    ![8, 8, 30, 33, 31, 34, 53, 58, 30, 33, 31, 34, 53, 58, 53, 58],
    ![1, 8, 1, 15, 2, 16, 18, 43, 1, 15, 2, 16, 18, 43, 18, 43],
    ![8, 4, 26, 4, 28, 5, 48, 24, 26, 4, 28, 5, 48, 24, 48, 24],
    ![31, 34, 55, 60, 31, 34, 54, 59, 55, 60, 7, 7, 54, 59, 7, 7],
    ![2, 16, 20, 45, 2, 16, 19, 44, 20, 45, 2, 7, 19, 44, 7, 7],
    ![28, 5, 50, 27, 28, 5, 49, 25, 50, 27, 7, 5, 49, 25, 7, 7],
    ![31, 34, 52, 57, 6, 6, 29, 32, 52, 57, 6, 6, 29, 32, 29, 32],
    ![2, 16, 17, 42, 0, 6, 0, 14, 17, 42, 0, 6, 0, 14, 0, 14],
    ![28, 5, 47, 23, 6, 3, 22, 3, 47, 23, 6, 3, 22, 3, 22, 3],
    ![30, 33, 12, 12, 61, 62, 38, 38, 12, 12, 61, 62, 38, 38, 38, 38],
    ![1, 15, 9, 12, 18, 43, 9, 35, 9, 12, 18, 43, 9, 35, 9, 35],
    ![26, 4, 12, 10, 48, 24, 36, 10, 12, 10, 48, 24, 36, 10, 36, 10],
    ![61, 62, 40, 40, 61, 62, 39, 39, 40, 40, 7, 7, 39, 39, 7, 7],
    ![20, 45, 9, 35, 19, 44, 9, 35, 9, 35, 7, 7, 9, 35, 9, 7],
    ![50, 27, 36, 10, 49, 25, 36, 10, 36, 10, 7, 7, 36, 10, 7, 10],
    ![61, 62, 37, 37, 29, 32, 11, 11, 37, 37, 29, 32, 11, 11, 11, 11],
    ![17, 42, 9, 35, 0, 14, 9, 11, 9, 35, 0, 14, 9, 11, 9, 11],
    ![47, 23, 36, 10, 22, 3, 11, 10, 36, 10, 22, 3, 11, 10, 11, 10]]

/-- The raw-label positional conversion is injective. -/
theorem rawToPos_injective : Function.Injective rawToPos := by
  decide

/-- Every fixed base support has four elements. -/
theorem baseChoices_support_card :
    ∀ choice ∈ baseChoices, choice.support.card = 4 := by
  decide

/-- Every center-2 residual support has four elements. -/
theorem center2Domain_support_card :
    ∀ index, (center2Domain index).card = 4 := by
  decide

/-- Every center-5 residual support has four elements. -/
theorem center5Domain_support_card :
    ∀ index, (center5Domain index).card = 4 := by
  decide

/-- Every center-2 pair certificate contains exactly one Kalmanson term. -/
theorem center2PairTerms_expected_length :
    ∀ index, (center2PairTerms index).length = 1 := by
  decide

private def center5PairExpectedLength : Fin 27 → Nat :=
  ![2, 1, 1, 1, 2, 1, 1, 2, 2, 1, 2, 2, 2, 2, 1, 1,
    1, 2, 1, 2, 1, 1, 1, 1, 1, 1, 1]

/-- The center-5 pair term-list lengths agree with the bundle. -/
theorem center5PairTerms_expected_length :
    ∀ index, (center5PairTerms index).length = center5PairExpectedLength index := by
  decide

private def jointExpectedLength : Fin 63 → Nat :=
  ![1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
    2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3,
    3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3]

/-- The joint term-list lengths agree with the bundle. -/
theorem jointTerms_expected_length :
    ∀ index, (jointTerms index).length = jointExpectedLength index := by
  decide

set_option maxRecDepth 100000 in
/-- Every center-2 pair term is a valid positive ordered Kalmanson term. -/
theorem center2PairTerms_check :
    ∀ index, (center2PairTerms index).all WeightedKalmansonTerm.check = true := by
  decide

set_option maxRecDepth 100000 in
/-- Every center-5 pair term is a valid positive ordered Kalmanson term. -/
theorem center5PairTerms_check :
    ∀ index, (center5PairTerms index).all WeightedKalmansonTerm.check = true := by
  decide

set_option maxRecDepth 100000 in
/-- Every joint-bank term is a valid positive ordered Kalmanson term. -/
theorem jointTerms_check :
    ∀ index, (jointTerms index).all WeightedKalmansonTerm.check = true := by
  decide

/-- Every route entry lies below the sixty-three-entry bank bound. -/
theorem jointRoute_in_range :
    ∀ index2 index5, (jointRoute index2 index5).val < 63 := by
  decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
-- Ordinary reduction enumerates the complete `Fin 27 × Fin 16` route table.
/-- Every one of the sixty-three joint certificates is used by the route table. -/
theorem jointRoute_all_used :
    ∀ certificate : Fin 63,
      ∃ index2 : Fin 27, ∃ index5 : Fin 16,
        jointRoute index2 index5 = certificate := by
  decide

end CardGeThirteenTwoCanonicalK4FixedCellData
end ATailFrontierLiveClosure
end Problem97
