/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13OrderTransport
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ProviderRowNogoodCertificate

/-!
# Checked exact-thirteen three-form provider probe

This module records one concrete positional certificate from the authenticated
direct cell-0 event at
`scratch/runs/cardge13-exact13-three-form-batch-20260905/run-0002/`.
The source event has SHA-256
`a9fc0d0196d84fda94f87f06d1d194d2a8f139d7a6ea2d1a80f6ad45feac960a`.

The certificate deliberately reverses the event's diagonal-to-side paths into
the side-to-diagonal direction required by `WeightedKalmansonTerm`, transports
raw labels through the direct second-opposite positional map, retains all
provider tags, and inserts explicit edge flips around center-first row steps.
It is an executable checker probe, not a live-cell coverage theorem.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13ThreeFormCheckProbe

open DRExactThirteenValuation
open GenericRowNogoodCertificate
open ProviderRowNogoodCertificate

/-- The raw-label-to-position map for the direct second-opposite chart used by
the authenticated cell-0 event. -/
def directPosition : Fin 13 → Fin 13 :=
  directIndex .secondOpposite

/-- A two-label positional support obtained from raw labels. -/
def directPair (first second : Fin 13) : Finset (Fin 13) :=
  {directPosition first, directPosition second}

/-- Probe-local provider tags. Keeping these separate from centers records
which source row justifies each checker step, including the two tags at raw
center zero. -/
inductive ProbeProvider where
  | c0
  | c1
  | k
  | l
  | t
  | g (center : Fin 13)
deriving DecidableEq, Repr

/-- The minimal provider pattern needed by the representative certificate.
Unused providers have empty support; the two blocker centers remain distinct
from the global provider tags at those raw labels. -/
def representativePattern : ProviderRowPattern ProbeProvider (Fin 13) where
  centerOf
    | .c0 => directPosition 9
    | .c1 => directPosition 12
    | .k => directPosition 0
    | .l => directPosition 0
    | .t => directPosition 1
    | .g center => directPosition center
  supportOf
    | .c0 => ∅
    | .c1 => directPair 3 1
    | .k => directPair 5 7
    | .l => directPair 8 11
    | .t => directPair 12 6
    | .g center =>
        match center.val with
        | 2 => directPair 11 7
        | 3 => directPair 12 5
        | 5 => directPair 3 2
        | 6 => directPair 1 0
        | 8 => directPair 2 6
        | 11 => directPair 0 8
        | _ => ∅

/-- The provider tags used by the representative certificate. -/
def representativeProviders : List ProbeProvider :=
  [ .g 8
  , .k
  , .g 2
  , .g 6
  , .t
  , .c1
  , .g 3
  , .g 5
  , .g 11
  , .l
  ]

/-- One full minimal support choice for a used provider. -/
def representativeChoice
    (provider : ProbeProvider) :
    ProviderRowChoice ProbeProvider (Fin 13) :=
  { provider := provider
    support := representativePattern.supportOf provider }

/-- The positive provider choices used to check all six equality paths. -/
def representativeChoices :
    List (ProviderRowChoice ProbeProvider (Fin 13)) :=
  representativeProviders.map representativeChoice

/-- The first reversed path, from the third term's first side to the first
term's first diagonal. -/
def path0 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 2, directPosition 8)
    steps :=
      [ .flip (directPosition 2) (directPosition 8)
      , .row (.g 8) (directPosition 2) (directPosition 6)
      ]
    last := (directPosition 8, directPosition 6) }

/-- The second reversed path, from the third term's second side to the first
term's second diagonal. -/
def path1 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 5, directPosition 0)
    steps :=
      [ .flip (directPosition 5) (directPosition 0)
      , .row .k (directPosition 5) (directPosition 7)
      ]
    last := (directPosition 0, directPosition 7) }

/-- The third reversed path, from the second term's outer side to its first
diagonal. -/
def path2 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 2, directPosition 7)
    steps :=
      [ .row (.g 2) (directPosition 7) (directPosition 11) ]
    last := (directPosition 2, directPosition 11) }

/-- The fourth pairing is already the same oriented positional edge. -/
def path3 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 8, directPosition 7)
    steps := []
    last := (directPosition 8, directPosition 7) }

/-- The fifth reversed path crosses five tagged provider rows. -/
def path4 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 0, directPosition 6)
    steps :=
      [ .flip (directPosition 0) (directPosition 6)
      , .row (.g 6) (directPosition 0) (directPosition 1)
      , .flip (directPosition 6) (directPosition 1)
      , .row .t (directPosition 6) (directPosition 12)
      , .flip (directPosition 1) (directPosition 12)
      , .row .c1 (directPosition 1) (directPosition 3)
      , .flip (directPosition 12) (directPosition 3)
      , .row (.g 3) (directPosition 12) (directPosition 5)
      , .flip (directPosition 3) (directPosition 5)
      , .row (.g 5) (directPosition 3) (directPosition 2)
      , .flip (directPosition 5) (directPosition 2)
      ]
    last := (directPosition 2, directPosition 5) }

/-- The sixth reversed path uses the distinct global-eleven and retained-L
provider tags at the common second-apex center. -/
def path5 : ProviderClosurePathData ProbeProvider (Fin 13) :=
  { first := (directPosition 8, directPosition 11)
    steps :=
      [ .flip (directPosition 8) (directPosition 11)
      , .row (.g 11) (directPosition 8) (directPosition 0)
      , .flip (directPosition 11) (directPosition 0)
      , .row .l (directPosition 11) (directPosition 8)
      , .flip (directPosition 0) (directPosition 8)
      ]
    last := (directPosition 8, directPosition 0) }

/-- The three unit-weight Kalmanson terms and six multiplicity-preserving
side-to-diagonal provider paths from the representative artifact row. -/
def representativeData :
    ProviderWeightedKalmansonCancellationData ProbeProvider 13 :=
  { terms :=
      [ { quad := ⟨directPosition 8, directPosition 0,
            directPosition 6, directPosition 7⟩
          form := .innerOuter
          weight := 1 }
      , { quad := ⟨directPosition 2, directPosition 8,
            directPosition 11, directPosition 7⟩
          form := .innerOuter
          weight := 1 }
      , { quad := ⟨directPosition 2, directPosition 8,
            directPosition 5, directPosition 0⟩
          form := .adjacentSides
          weight := 1 }
      ]
    pairings :=
      [ { left := path0.first, right := path0.last, path := path0 }
      , { left := path1.first, right := path1.last, path := path1 }
      , { left := path2.first, right := path2.last, path := path2 }
      , { left := path3.first, right := path3.last, path := path3 }
      , { left := path4.first, right := path4.last, path := path4 }
      , { left := path5.first, right := path5.last, path := path5 }
      ] }

/-- Every recorded provider choice is a positive subrow of the concrete probe
pattern. -/
theorem representativeChoices_positive :
    ProviderPositiveRowsMatch representativePattern representativeChoices := by
  intro choice hchoice
  rcases List.mem_map.mp hchoice with ⟨provider, _hprovider, rfl⟩
  exact fun _ hx => hx

/-- The concrete three-form provider certificate passes the kernel-reduced
executable checker. -/
theorem representativeData_check :
    representativeData.check representativeChoices representativePattern = true := by
  decide

/-- The checked representative certificate satisfies the proposition-level
validity predicate used by the provider contradiction theorem. -/
theorem representativeData_valid :
    representativeData.Valid representativeChoices representativePattern :=
  representativeData.valid_of_check representativeChoices representativePattern
    representativeData_check

end CardGeThirteenExact13ThreeFormCheckProbe
end ATailFrontierLiveClosure
end Problem97
