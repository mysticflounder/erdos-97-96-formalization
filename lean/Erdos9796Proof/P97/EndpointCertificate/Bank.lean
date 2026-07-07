/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowBank
import Erdos9796Proof.P97.EndpointCertificate.Patterns.All

/-!
# Endpoint certificate bank

This module aligns the finite endpoint shadow rows with the generated algebraic
certificate aggregate.  It does not assert certificate soundness; it provides the
single ordered row/certificate surface consumed by the endpoint residual bridge.
-/

namespace Problem97

namespace EndpointCertificate

namespace Bank

abbrev Row := ShadowBank.EndpointRow
abbrev Certificate := Patterns.VerifiedCertificate

/-- Endpoint shadow rows paired with their generated algebraic certificates. -/
def certifiedEndpointRows : List (Row × Certificate) :=
  ShadowBank.allEndpointRows.zip Patterns.allEndpointCertificates

private theorem list_all_eq_true_of_mem
    {α : Type _} {p : α → Bool} {a : α} :
    ∀ {items : List α}, items.all p = true → a ∈ items → p a = true
  | [], _hall, hmem => by
      cases hmem
  | head :: tail, hall, hmem => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      simp only [List.mem_cons] at hmem
      rcases hmem with rfl | htail
      · exact hall.1
      · exact list_all_eq_true_of_mem hall.2 htail

private theorem mem_of_containsEntry_eq_true
    {entry : ShadowBank.Label × List Nat} :
    ∀ {entries : List (ShadowBank.Label × List Nat)},
      ShadowBank.containsEntry entry entries = true → entry ∈ entries
  | [], hcontains => by
      simp [ShadowBank.containsEntry] at hcontains
  | head :: tail, hcontains => by
      by_cases hhead : head = entry
      · simp [hhead]
      · have htail :
            ShadowBank.containsEntry entry tail = true := by
          simpa [ShadowBank.containsEntry, hhead] using hcontains
        exact List.mem_cons_of_mem head
          (mem_of_containsEntry_eq_true htail)

private theorem allPairCertificatesChecked :
    ∀ rows : List (Row × Certificate),
      rows.all (fun rowCert => rowCert.2.check) = true
  | [] => rfl
  | rowCert :: rows => by
      simp only [List.all_cons, Bool.and_eq_true,
        Patterns.VerifiedCertificate.check]
      exact ⟨rowCert.2.valid, by
        simpa [Patterns.VerifiedCertificate.check] using
          allPairCertificatesChecked rows⟩

set_option linter.style.nativeDecide false in
/-- The paired endpoint bank contains all 117 generated rows. -/
theorem certifiedEndpointRows_length : certifiedEndpointRows.length = 117 := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The finite shadow rows and generated certificates have the same row-id
order. -/
theorem allEndpointRowIds_match_certificates :
    ShadowBank.allEndpointRows.map (fun row => row.id) =
      Patterns.allEndpointCertificates.map (fun cert => cert.id) := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The paired endpoint bank has the same `(escapee, masks)` keys as the finite
shadow-row bank. -/
theorem certifiedEndpointRows_entries :
    certifiedEndpointRows.map
      (fun rowCert => (rowCert.1.escapee, rowCert.1.masks)) =
      ShadowBank.endpointRowEntries := by
  native_decide

set_option linter.style.nativeDecide false in
/-- The paired endpoint bank is id-aligned at every row. -/
theorem certifiedEndpointRows_ids_match :
    certifiedEndpointRows.all (fun rowCert => rowCert.1.id == rowCert.2.id) =
      true := by
  native_decide

/-- Every certificate in the paired endpoint bank has its checker proof. -/
theorem certifiedEndpointRows_certificates_checked :
    certifiedEndpointRows.all (fun rowCert => rowCert.2.check) = true :=
  allPairCertificatesChecked certifiedEndpointRows

set_option linter.style.nativeDecide false in
/-- Every finite shadow row in the paired endpoint bank satisfies the endpoint
shadow contract. -/
theorem certifiedEndpointRows_shadows_valid :
    certifiedEndpointRows.all
      (fun rowCert =>
        ShadowBank.endpointShadowOK rowCert.1.escapee rowCert.1.toShadow) =
      true := by
  native_decide

/-- Boolean endpoint row-bank membership determines a checked row/certificate
pair in the paired endpoint bank. -/
theorem exists_certifiedEndpointRow_of_endpointShadowInBank
    {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true) :
    ∃ rowCert : Row × Certificate,
      rowCert ∈ certifiedEndpointRows ∧
        rowCert.1.escapee = escapee ∧
        rowCert.1.masks = shadow.masks ∧
        rowCert.2.check = true := by
  have hcontains :
      ShadowBank.containsEntry (escapee, shadow.masks)
        ShadowBank.endpointRowEntries = true := by
    have hparts :
        shadow.hasTenMasks = true ∧
          ShadowBank.containsEntry (escapee, shadow.masks)
            ShadowBank.endpointRowEntries = true := by
      simpa [ShadowBank.endpointShadowInBank] using hin
    exact hparts.2
  have hmemEntry :
      (escapee, shadow.masks) ∈ ShadowBank.endpointRowEntries :=
    mem_of_containsEntry_eq_true hcontains
  rw [← certifiedEndpointRows_entries] at hmemEntry
  rcases List.mem_map.mp hmemEntry with ⟨rowCert, hrowCert, hkey⟩
  refine ⟨rowCert, hrowCert, ?_, ?_, ?_⟩
  · exact (congrArg Prod.fst hkey)
  · exact (congrArg Prod.snd hkey)
  · exact list_all_eq_true_of_mem
      (α := Row × Certificate)
      (p := fun rowCert => rowCert.2.check)
      (a := rowCert)
      certifiedEndpointRows_certificates_checked hrowCert

/-- Boolean endpoint row-bank membership determines an id-aligned checked
row/certificate pair in the paired endpoint bank. -/
theorem exists_alignedCertifiedEndpointRow_of_endpointShadowInBank
    {escapee : ShadowBank.Label} {shadow : ShadowBank.Shadow}
    (hin : ShadowBank.endpointShadowInBank escapee shadow = true) :
    ∃ rowCert : Row × Certificate,
      rowCert ∈ certifiedEndpointRows ∧
        rowCert.1.escapee = escapee ∧
        rowCert.1.masks = shadow.masks ∧
        rowCert.1.id = rowCert.2.id ∧
        rowCert.2.check = true := by
  rcases exists_certifiedEndpointRow_of_endpointShadowInBank hin with
    ⟨rowCert, hrowCert, hescapee, hmasks, hcheck⟩
  have hidsBool : (rowCert.1.id == rowCert.2.id) = true :=
    list_all_eq_true_of_mem
      (α := Row × Certificate)
      (p := fun rowCert => rowCert.1.id == rowCert.2.id)
      (a := rowCert)
      certifiedEndpointRows_ids_match hrowCert
  exact ⟨rowCert, hrowCert, hescapee, hmasks, beq_iff_eq.mp hidsBool,
    hcheck⟩

end Bank

end EndpointCertificate

end Problem97
