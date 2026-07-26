/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import P4DirectOuterArcFiniteDataChunk000
import P4DirectOuterArcFiniteDataChunk001
import P4DirectOuterArcFiniteDataChunk002
import P4DirectOuterArcFiniteDataChunk003
import P4DirectOuterArcFiniteDataChunk004
import P4DirectOuterArcFiniteDataChunk005
import P4DirectOuterArcFiniteDataChunk006
import P4DirectOuterArcFiniteDataChunk007
import P4DirectOuterArcFiniteDataChunk008
import P4DirectOuterArcFiniteDataChunk009
import P4DirectOuterArcFiniteDataChunk010
import P4DirectOuterArcFiniteDataChunk011
import P4DirectOuterArcFiniteDataChunk012
import P4DirectOuterArcFiniteDataChunk013
import P4DirectOuterArcFiniteDataChunk014
import P4DirectOuterArcFiniteDataChunk015
import P4DirectOuterArcFiniteDataChunk016
import P4DirectOuterArcFiniteDataChunk017
import P4DirectOuterArcFiniteDataChunk018
import P4DirectOuterArcFiniteDataChunk019
import P4DirectOuterArcFiniteDataChunk020
import P4DirectOuterArcFiniteDataChunk021
import P4DirectOuterArcFiniteDataChunk022
import P4DirectOuterArcFiniteDataChunk023
import P4DirectOuterArcFiniteDataChunk024

/-! Generated thin aggregate of the bounded finite-data chunks. -/

namespace Problem97
namespace P4DirectOuterArcAdapterScratch

def directRowArcFiniteDataSha256 : String := "845398403dd0b206c01e1fb57b3f846b902bb541c85d591a1275ffb3aaaccfde"
def directRowArcFiniteDataCount : Nat := 3179

def directRowArcFiniteOccurrences : List DirectRowArcFiniteOccurrence :=
  directRowArcFiniteOccurrencesChunk000 ++
    directRowArcFiniteOccurrencesChunk001 ++
    directRowArcFiniteOccurrencesChunk002 ++
    directRowArcFiniteOccurrencesChunk003 ++
    directRowArcFiniteOccurrencesChunk004 ++
    directRowArcFiniteOccurrencesChunk005 ++
    directRowArcFiniteOccurrencesChunk006 ++
    directRowArcFiniteOccurrencesChunk007 ++
    directRowArcFiniteOccurrencesChunk008 ++
    directRowArcFiniteOccurrencesChunk009 ++
    directRowArcFiniteOccurrencesChunk010 ++
    directRowArcFiniteOccurrencesChunk011 ++
    directRowArcFiniteOccurrencesChunk012 ++
    directRowArcFiniteOccurrencesChunk013 ++
    directRowArcFiniteOccurrencesChunk014 ++
    directRowArcFiniteOccurrencesChunk015 ++
    directRowArcFiniteOccurrencesChunk016 ++
    directRowArcFiniteOccurrencesChunk017 ++
    directRowArcFiniteOccurrencesChunk018 ++
    directRowArcFiniteOccurrencesChunk019 ++
    directRowArcFiniteOccurrencesChunk020 ++
    directRowArcFiniteOccurrencesChunk021 ++
    directRowArcFiniteOccurrencesChunk022 ++
    directRowArcFiniteOccurrencesChunk023 ++
    directRowArcFiniteOccurrencesChunk024

def directRowArcFiniteData : List DirectRowArcFiniteDatum :=
  directRowArcFiniteOccurrences.map (·.datum)

theorem directRowArcFiniteOccurrences_batch_valid :
    directRowArcFiniteOccurrences.length = directRowArcFiniteDataCount ∧
      ∀ occurrence ∈ directRowArcFiniteOccurrences, occurrence.datum.Valid := by
  constructor
  · simp only [directRowArcFiniteOccurrences, List.length_append,
      directRowArcFiniteOccurrencesChunk000_batch_valid.1,
      directRowArcFiniteOccurrencesChunk001_batch_valid.1,
      directRowArcFiniteOccurrencesChunk002_batch_valid.1,
      directRowArcFiniteOccurrencesChunk003_batch_valid.1,
      directRowArcFiniteOccurrencesChunk004_batch_valid.1,
      directRowArcFiniteOccurrencesChunk005_batch_valid.1,
      directRowArcFiniteOccurrencesChunk006_batch_valid.1,
      directRowArcFiniteOccurrencesChunk007_batch_valid.1,
      directRowArcFiniteOccurrencesChunk008_batch_valid.1,
      directRowArcFiniteOccurrencesChunk009_batch_valid.1,
      directRowArcFiniteOccurrencesChunk010_batch_valid.1,
      directRowArcFiniteOccurrencesChunk011_batch_valid.1,
      directRowArcFiniteOccurrencesChunk012_batch_valid.1,
      directRowArcFiniteOccurrencesChunk013_batch_valid.1,
      directRowArcFiniteOccurrencesChunk014_batch_valid.1,
      directRowArcFiniteOccurrencesChunk015_batch_valid.1,
      directRowArcFiniteOccurrencesChunk016_batch_valid.1,
      directRowArcFiniteOccurrencesChunk017_batch_valid.1,
      directRowArcFiniteOccurrencesChunk018_batch_valid.1,
      directRowArcFiniteOccurrencesChunk019_batch_valid.1,
      directRowArcFiniteOccurrencesChunk020_batch_valid.1,
      directRowArcFiniteOccurrencesChunk021_batch_valid.1,
      directRowArcFiniteOccurrencesChunk022_batch_valid.1,
      directRowArcFiniteOccurrencesChunk023_batch_valid.1,
      directRowArcFiniteOccurrencesChunk024_batch_valid.1,
      directRowArcFiniteDataCount]
  · rw [directRowArcFiniteOccurrences]
    have h001 := List.forall_mem_append.2
      ⟨directRowArcFiniteOccurrencesChunk000_batch_valid.2, directRowArcFiniteOccurrencesChunk001_batch_valid.2⟩
    have h002 := List.forall_mem_append.2
      ⟨h001, directRowArcFiniteOccurrencesChunk002_batch_valid.2⟩
    have h003 := List.forall_mem_append.2
      ⟨h002, directRowArcFiniteOccurrencesChunk003_batch_valid.2⟩
    have h004 := List.forall_mem_append.2
      ⟨h003, directRowArcFiniteOccurrencesChunk004_batch_valid.2⟩
    have h005 := List.forall_mem_append.2
      ⟨h004, directRowArcFiniteOccurrencesChunk005_batch_valid.2⟩
    have h006 := List.forall_mem_append.2
      ⟨h005, directRowArcFiniteOccurrencesChunk006_batch_valid.2⟩
    have h007 := List.forall_mem_append.2
      ⟨h006, directRowArcFiniteOccurrencesChunk007_batch_valid.2⟩
    have h008 := List.forall_mem_append.2
      ⟨h007, directRowArcFiniteOccurrencesChunk008_batch_valid.2⟩
    have h009 := List.forall_mem_append.2
      ⟨h008, directRowArcFiniteOccurrencesChunk009_batch_valid.2⟩
    have h010 := List.forall_mem_append.2
      ⟨h009, directRowArcFiniteOccurrencesChunk010_batch_valid.2⟩
    have h011 := List.forall_mem_append.2
      ⟨h010, directRowArcFiniteOccurrencesChunk011_batch_valid.2⟩
    have h012 := List.forall_mem_append.2
      ⟨h011, directRowArcFiniteOccurrencesChunk012_batch_valid.2⟩
    have h013 := List.forall_mem_append.2
      ⟨h012, directRowArcFiniteOccurrencesChunk013_batch_valid.2⟩
    have h014 := List.forall_mem_append.2
      ⟨h013, directRowArcFiniteOccurrencesChunk014_batch_valid.2⟩
    have h015 := List.forall_mem_append.2
      ⟨h014, directRowArcFiniteOccurrencesChunk015_batch_valid.2⟩
    have h016 := List.forall_mem_append.2
      ⟨h015, directRowArcFiniteOccurrencesChunk016_batch_valid.2⟩
    have h017 := List.forall_mem_append.2
      ⟨h016, directRowArcFiniteOccurrencesChunk017_batch_valid.2⟩
    have h018 := List.forall_mem_append.2
      ⟨h017, directRowArcFiniteOccurrencesChunk018_batch_valid.2⟩
    have h019 := List.forall_mem_append.2
      ⟨h018, directRowArcFiniteOccurrencesChunk019_batch_valid.2⟩
    have h020 := List.forall_mem_append.2
      ⟨h019, directRowArcFiniteOccurrencesChunk020_batch_valid.2⟩
    have h021 := List.forall_mem_append.2
      ⟨h020, directRowArcFiniteOccurrencesChunk021_batch_valid.2⟩
    have h022 := List.forall_mem_append.2
      ⟨h021, directRowArcFiniteOccurrencesChunk022_batch_valid.2⟩
    have h023 := List.forall_mem_append.2
      ⟨h022, directRowArcFiniteOccurrencesChunk023_batch_valid.2⟩
    have h024 := List.forall_mem_append.2
      ⟨h023, directRowArcFiniteOccurrencesChunk024_batch_valid.2⟩
    exact h024

theorem directRowArcFiniteData_batch_valid :
    directRowArcFiniteData.length = directRowArcFiniteDataCount ∧
      ∀ datum ∈ directRowArcFiniteData, datum.Valid := by
  rw [directRowArcFiniteData]
  constructor
  · simpa using directRowArcFiniteOccurrences_batch_valid.1
  · intro datum hdatum
    rcases List.mem_map.mp hdatum with ⟨occurrence, hoccurrence, rfl⟩
    exact directRowArcFiniteOccurrences_batch_valid.2 occurrence hoccurrence

#print axioms directRowArcFiniteOccurrences_batch_valid
#print axioms directRowArcFiniteData_batch_valid

end P4DirectOuterArcAdapterScratch
end Problem97
