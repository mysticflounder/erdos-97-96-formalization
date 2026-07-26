/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4P4CriticalSupportOccurrenceBridge.Residual78Core
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate.Support.Unique4ExactTwoSchemaDecoder.ExactTwoSchemaDecoder

/-!
# Six residual p4 CEGAR occurrences

The six compact clauses in this package are source-core occurrences of the
executable p4 template.  This file records their role packets in the compact
ten-slot row numbering; `CegarFamilies` supplies the source semantics.
-/

namespace Problem97
namespace P4Cegar6OccurrenceBridgeScratch

open ATailUniqueFourExactTwoSchemaDecoderScratch
open P4CriticalSupportOccurrenceBridgeScratch

/-- The two source orientations used by the residual CEGAR occurrences. -/
inductive Orientation where
  | forward
  | reflected
  deriving DecidableEq, Repr

/-- The six exact source-core occurrences retained by compact clauses
`19043` through `19048`. -/
inductive CegarSlot where
  | reflected48600
  | reflected48601
  | reflected48602
  | reflected48603
  | forward48604
  | forward48605
  deriving DecidableEq, Repr

def slotSourceCore : CegarSlot → Nat
  | .reflected48600 => 48600
  | .reflected48601 => 48601
  | .reflected48602 => 48602
  | .reflected48603 => 48603
  | .forward48604 => 48604
  | .forward48605 => 48605

def slotCompactClause : CegarSlot → Nat
  | .reflected48600 => 19043
  | .reflected48601 => 19044
  | .reflected48602 => 19045
  | .reflected48603 => 19046
  | .forward48604 => 19047
  | .forward48605 => 19048

/-- Clause positions in the terminal source CNF, retained for provenance
cross-checking only. -/
def slotTerminalClause : CegarSlot → Nat
  | .reflected48600 => 2765382
  | .reflected48601 => 2765384
  | .reflected48602 => 2765386
  | .reflected48603 => 2765388
  | .forward48604 => 2765395
  | .forward48605 => 2765401

def slotOrientation : CegarSlot → Orientation
  | .reflected48600 | .reflected48601 | .reflected48602 | .reflected48603 => .reflected
  | .forward48604 | .forward48605 => .forward

/-- The ten target labels recorded in the source-core provenance map. -/
def slotSourceTargets : CegarSlot → List Label
  | .reflected48600 => [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
  | .reflected48601 => [0, 1, 2, 3, 4, 5, 6, 7, 8, 10]
  | .reflected48602 => [0, 1, 2, 3, 4, 5, 6, 7, 9, 10]
  | .reflected48603 => [0, 1, 2, 3, 4, 5, 6, 8, 9, 10]
  | .forward48604 => [0, 1, 2, 3, 5, 6, 7, 8, 9, 10]
  | .forward48605 => [0, 2, 3, 4, 5, 6, 7, 8, 9, 10]

/-- The eight ordered roles selected by each source occurrence. -/
def slotOrderedEight : CegarSlot → OrderedEight
  | .reflected48600 => ⟨0, 1, 2, 5, 6, 7, 8, 9, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩
  | .reflected48601 => ⟨0, 1, 2, 5, 6, 7, 8, 10, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩
  | .reflected48602 => ⟨0, 1, 2, 5, 6, 7, 9, 10, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩
  | .reflected48603 => ⟨0, 1, 2, 5, 6, 8, 9, 10, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩
  | .forward48604 => ⟨0, 1, 2, 3, 5, 6, 9, 10, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩
  | .forward48605 => ⟨0, 2, 3, 4, 5, 6, 9, 10, by decide, by decide, by decide,
      by decide, by decide, by decide, by decide⟩

def slotSchema (slot : CegarSlot) : List Membership :=
  match slotOrientation slot with
  | .forward => p4FourEndpointK2Schema
  | .reflected => reflectSchema 8 p4FourEndpointK2Schema

/-- The compact row literals demanded by one oriented p4 occurrence. -/
def schemaLits (slot : CegarSlot) : List Int :=
  (slotSchema slot).map fun membership =>
    -((rowVariable (rolePoint (slotOrderedEight slot).values membership.1)
      (rolePoint (slotOrderedEight slot).values membership.2) : Nat) : Int)

structure CegarEntry where
  slot : CegarSlot
  clause : List Int

/-- The generated compact clause contains every literal required by its
source p4 occurrence. -/
def entryWF (entry : CegarEntry) : Bool :=
  P5OccurrenceBridgeScratch.litsSubset (schemaLits entry.slot) entry.clause

end P4Cegar6OccurrenceBridgeScratch
end Problem97
