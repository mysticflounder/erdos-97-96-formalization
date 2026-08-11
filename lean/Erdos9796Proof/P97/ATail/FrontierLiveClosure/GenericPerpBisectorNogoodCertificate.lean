/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

/-!
# Generic perpendicular-bisector certificates

This module provides the source-facing checker for three equality paths that
place three distinct labels on the perpendicular bisector of the same two
distinct foci.  Its row hypotheses are positive: the certificate lists only
the source-row incidences used by the stored equality paths.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace GenericRowNogoodCertificate

open Census554.EqualityCore

/-- Three equality paths and the distinctness conditions of a
    perpendicular-bisector core. -/
structure PerpBisectorData (α : Type*) where
  a : α
  b : α
  p : α
  q : α
  r : α
  pa_pb : ClosurePathData α
  qa_qb : ClosurePathData α
  ra_rb : ClosurePathData α
deriving DecidableEq

/-- Boolean validation of the named distinctness conditions and equality
    paths.  The path endpoints are fixed by the target core. -/
def PerpBisectorData.check {α : Type*} [DecidableEq α]
    (choices : List (RowChoice α)) (data : PerpBisectorData α) : Bool :=
  decide (data.a ≠ data.b ∧ data.p ≠ data.q ∧
    data.p ≠ data.r ∧ data.q ≠ data.r) &&
    checkPath choices data.pa_pb (data.p, data.a) (data.p, data.b) &&
    checkPath choices data.qa_qb (data.q, data.a) (data.q, data.b) &&
    checkPath choices data.ra_rb (data.r, data.a) (data.r, data.b)

/-- A positively source-matching checked certificate produces the equality
    core consumed by the convex perpendicular-bisector theorem. -/
theorem nonempty_perpBisectorCore_of_positiveCheck
    {α : Type*} [DecidableEq α] {P : RowPattern α}
    {choices : List (RowChoice α)} (hrows : PositiveRowsMatch P choices)
    (data : PerpBisectorData α) (hcheck : data.check choices = true) :
    Nonempty (PerpBisectorCore P) := by
  simp only [PerpBisectorData.check, Bool.and_eq_true] at hcheck
  rcases hcheck with ⟨⟨⟨hinequalities, hpa_pb⟩, hqa_qb⟩, hra_rb⟩
  have hne : data.a ≠ data.b ∧ data.p ≠ data.q ∧
      data.p ≠ data.r ∧ data.q ≠ data.r :=
    of_decide_eq_true hinequalities
  exact ⟨{
    a := data.a
    b := data.b
    p := data.p
    q := data.q
    r := data.r
    hab := hne.1
    hpq := hne.2.1
    hpr := hne.2.2.1
    hqr := hne.2.2.2
    pa_pb := edgeClosure_of_checkPath_positive hrows data.pa_pb hpa_pb
    qa_qb := edgeClosure_of_checkPath_positive hrows data.qa_qb hqa_qb
    ra_rb := edgeClosure_of_checkPath_positive hrows data.ra_rb hra_rb }⟩

end GenericRowNogoodCertificate
end ATailFrontierLiveClosure
end Problem97
