/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank
import Erdos9796Proof.P97.SurplusCertificate.BankSoundness

/-!
# Exact pinned-bank to singleton relaxed split bridge

This module connects the exact 135-row pinned surplus incidence bank to the
singleton relaxed split certificate bank.  It is a finite alignment layer: exact
bank membership by shadow mask determines an exact row, and each exact row has
a matching singleton relaxed split row whose `exactPids` field is that row pid.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

/-- Boolean membership for a singleton relaxed split row carrying one exact
pinned-bank pid. -/
def containsCertifiedExactPid (pid : String) : List (Row × Certificate) → Bool
  | [] => false
  | rowCert :: rows =>
      if rowCert.1.exactPids = [pid] then
        true
      else
        containsCertifiedExactPid pid rows

/-- Parse the generated relaxed-bank label strings into the exact-bank label
type. -/
def labelOfString : String → Option SurplusCOMPGBank.Label
  | "u" => some .u
  | "v" => some .v
  | "w" => some .w
  | "s1" => some .s1
  | "s2" => some .s2
  | "s3" => some .s3
  | "Pw" => some .Pw
  | "Pu" => some .Pu
  | "Q1" => some .Q1
  | "Q2" => some .Q2
  | _ => none

/-- Boolean check that one relaxed common mask agrees with the corresponding
center mask in an exact row. -/
def commonMaskMatchesExactRow
    (exactRow : SurplusCOMPGBank.Row) (commonMask : CommonMask) : Bool :=
  match labelOfString commonMask.center with
  | some center => commonMask.mask == exactRow.masks.getD center.index 0
  | none => false

/-- Boolean check that every common mask in a relaxed row agrees with the
corresponding center mask in an exact row. -/
def commonMasksMatchExactRow
    (exactRow : SurplusCOMPGBank.Row) (row : Row) : Bool :=
  row.commonMasks.all (commonMaskMatchesExactRow exactRow)

/-- Boolean check that one stored member string is present in a common mask. -/
def commonMaskMemberMatchesMask (commonMask : CommonMask) (member : String) :
    Bool :=
  match labelOfString member with
  | some label => SurplusCOMPGBank.maskHas commonMask.mask label
  | none => false

/-- Boolean check that every stored member string is present in a common mask. -/
def commonMaskMembersMatchMask (commonMask : CommonMask) : Bool :=
  commonMask.members.all (commonMaskMemberMatchesMask commonMask)

private theorem mem_of_containsKey_eq_true {key : List Nat} :
    ∀ {keys : List (List Nat)},
      SurplusCOMPGBank.containsKey key keys = true → key ∈ keys
  | [], hcontains => by
      simp [SurplusCOMPGBank.containsKey] at hcontains
  | head :: tail, hcontains => by
      by_cases hhead : head = key
      · simp [hhead]
      · have htail :
            SurplusCOMPGBank.containsKey key tail = true := by
          simpa [SurplusCOMPGBank.containsKey, hhead] using hcontains
        exact List.mem_cons_of_mem head
          (mem_of_containsKey_eq_true htail)

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

private theorem exists_row_of_shadow_key_mem {key : List Nat}
    (hkey : key ∈ SurplusCOMPGBank.rowShadowKeys) :
    ∃ row : SurplusCOMPGBank.Row,
      row ∈ SurplusCOMPGBank.rows ∧ row.masks = key := by
  unfold SurplusCOMPGBank.rowShadowKeys at hkey
  rcases List.mem_map.mp hkey with ⟨row, hrow, hmask⟩
  exact ⟨row, hrow, by
    simpa [SurplusCOMPGBank.Row.shadowKey] using hmask⟩

private theorem exists_mem_of_containsCertifiedExactPid {pid : String} :
    ∀ {rows : List (Row × Certificate)},
      containsCertifiedExactPid pid rows = true →
        ∃ rowCert : Row × Certificate,
          rowCert ∈ rows ∧ rowCert.1.exactPids = [pid]
  | [], hcontains => by
      simp [containsCertifiedExactPid] at hcontains
  | rowCert :: rows, hcontains => by
      by_cases hpid : rowCert.1.exactPids = [pid]
      · exact ⟨rowCert, by simp, hpid⟩
      · have htail : containsCertifiedExactPid pid rows = true := by
          simpa [containsCertifiedExactPid, hpid] using hcontains
        rcases exists_mem_of_containsCertifiedExactPid htail with
          ⟨found, hfound, hfoundPid⟩
        exact ⟨found, List.mem_cons_of_mem rowCert hfound, hfoundPid⟩

set_option linter.style.nativeDecide false in
/-- Every exact pinned-bank row has a singleton relaxed split certificate row
whose `exactPids` field is exactly that row pid. -/
theorem exactRows_all_have_certifiedRelaxedSplit :
    SurplusCOMPGBank.rows.all
      (fun row =>
        containsCertifiedExactPid row.pid certifiedRelaxedSplitRows) = true := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Every singleton relaxed split row carrying an exact pinned-bank pid records
common masks that agree with that exact row's center masks. -/
theorem exactRows_certifiedRelaxedSplit_commonMasks_match :
    SurplusCOMPGBank.rows.all
      (fun exactRow =>
        certifiedRelaxedSplitRows.all
          (fun rowCert =>
            if rowCert.1.exactPids = [exactRow.pid] then
              commonMasksMatchExactRow exactRow rowCert.1
            else
              true)) = true := by
  native_decide

set_option linter.style.nativeDecide false in
/-- Every generated common mask stores only member strings whose corresponding
label bits are present in the mask. -/
theorem certifiedRelaxedSplitRows_commonMask_members_match :
    certifiedRelaxedSplitRows.all
      (fun rowCert =>
        rowCert.1.commonMasks.all commonMaskMembersMatchMask) = true := by
  native_decide

/-- Exact pinned-bank membership determines a matching singleton relaxed split
certificate row. -/
theorem exists_certifiedRelaxedSplitRow_of_shadowInBank
    {shadow : SurplusCOMPGBank.Shadow}
    (hin : SurplusCOMPGBank.shadowInBank shadow = true) :
    ∃ exactRow : SurplusCOMPGBank.Row,
    ∃ rowCert : Row × Certificate,
      exactRow ∈ SurplusCOMPGBank.rows ∧
        exactRow.masks = shadow.masks ∧
        rowCert ∈ certifiedRelaxedSplitRows ∧
        rowCert.1.exactPids = [exactRow.pid] ∧
        rowCert.2.check = true := by
  have hcontains :
      SurplusCOMPGBank.containsKey shadow.masks
        SurplusCOMPGBank.rowShadowKeys = true := by
    have hparts :
        shadow.hasTenMasks = true ∧
          SurplusCOMPGBank.containsKey shadow.masks
            SurplusCOMPGBank.rowShadowKeys = true := by
      simpa [SurplusCOMPGBank.shadowInBank] using hin
    exact hparts.2
  have hkey : shadow.masks ∈ SurplusCOMPGBank.rowShadowKeys :=
    mem_of_containsKey_eq_true hcontains
  rcases exists_row_of_shadow_key_mem hkey with ⟨exactRow, hrow, hmasks⟩
  have hrowHasCert :
      containsCertifiedExactPid exactRow.pid certifiedRelaxedSplitRows = true :=
    list_all_eq_true_of_mem
      (p := fun row : SurplusCOMPGBank.Row =>
        containsCertifiedExactPid row.pid certifiedRelaxedSplitRows)
      (a := exactRow)
      (items := SurplusCOMPGBank.rows)
      exactRows_all_have_certifiedRelaxedSplit hrow
  rcases exists_mem_of_containsCertifiedExactPid hrowHasCert with
    ⟨rowCert, hrowCert, hpid⟩
  have hcheck : rowCert.2.check = true :=
    list_all_eq_true_of_mem
      (p := fun rowCert : Row × Certificate => rowCert.2.check)
      (a := rowCert)
      (items := certifiedRelaxedSplitRows)
      certifiedRelaxedSplitRows_certificates_checked hrowCert
  exact ⟨exactRow, rowCert, hrow, hmasks, hrowCert, hpid, hcheck⟩

/-- A common mask in a matched singleton relaxed split row is the corresponding
center mask from the exact pinned-bank row. -/
theorem commonMask_mask_eq_exactRow_centerMask
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask} {center : SurplusCOMPGBank.Label}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center) :
    commonMask.mask = exactRow.masks.getD center.index 0 := by
  have hrowAll :
      certifiedRelaxedSplitRows.all
        (fun rowCert =>
          if rowCert.1.exactPids = [exactRow.pid] then
            commonMasksMatchExactRow exactRow rowCert.1
          else
            true) = true :=
    list_all_eq_true_of_mem
      (p := fun exactRow : SurplusCOMPGBank.Row =>
        certifiedRelaxedSplitRows.all
          (fun rowCert =>
            if rowCert.1.exactPids = [exactRow.pid] then
              commonMasksMatchExactRow exactRow rowCert.1
            else
              true))
      (a := exactRow)
      (items := SurplusCOMPGBank.rows)
      exactRows_certifiedRelaxedSplit_commonMasks_match hrow
  have hrowCertAll :
      (if rowCert.1.exactPids = [exactRow.pid] then
          commonMasksMatchExactRow exactRow rowCert.1
        else
          true) = true :=
    list_all_eq_true_of_mem
      (p := fun rowCert : Row × Certificate =>
        if rowCert.1.exactPids = [exactRow.pid] then
          commonMasksMatchExactRow exactRow rowCert.1
        else
          true)
      (a := rowCert)
      (items := certifiedRelaxedSplitRows)
      hrowAll hrowCert
  have hcommonAll : commonMasksMatchExactRow exactRow rowCert.1 = true := by
    simpa [hpid] using hrowCertAll
  have hcommonCheck : commonMaskMatchesExactRow exactRow commonMask = true :=
    list_all_eq_true_of_mem
      (p := commonMaskMatchesExactRow exactRow)
      (a := commonMask)
      (items := rowCert.1.commonMasks)
      hcommonAll hcommon
  have hbeq :
      (commonMask.mask == exactRow.masks.getD center.index 0) = true := by
    simpa [commonMaskMatchesExactRow, hcenter] using hcommonCheck
  exact beq_iff_eq.mp hbeq

/-- A common mask in a matched singleton relaxed split row is the corresponding
center mask from the exact shadow. -/
theorem commonMask_mask_eq_shadow_centerMask
    {shadow : SurplusCOMPGBank.Shadow}
    {exactRow : SurplusCOMPGBank.Row} {rowCert : Row × Certificate}
    {commonMask : CommonMask} {center : SurplusCOMPGBank.Label}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hmasks : exactRow.masks = shadow.masks)
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hpid : rowCert.1.exactPids = [exactRow.pid])
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hcenter : labelOfString commonMask.center = some center) :
    commonMask.mask = shadow.centerMask center := by
  calc
    commonMask.mask = exactRow.masks.getD center.index 0 :=
      commonMask_mask_eq_exactRow_centerMask hrow hrowCert hpid hcommon hcenter
    _ = shadow.masks.getD center.index 0 := by rw [hmasks]
    _ = shadow.centerMask center := rfl

/-- A stored member string in a generated common mask determines the
corresponding finite mask bit. -/
theorem maskHas_commonMask_of_memberString
    {rowCert : Row × Certificate} {commonMask : CommonMask}
    {member : String} {label : SurplusCOMPGBank.Label}
    (hrowCert : rowCert ∈ certifiedRelaxedSplitRows)
    (hcommon : commonMask ∈ rowCert.1.commonMasks)
    (hmember : member ∈ commonMask.members)
    (hlabel : labelOfString member = some label) :
    SurplusCOMPGBank.maskHas commonMask.mask label = true := by
  have hrowAll :
      rowCert.1.commonMasks.all commonMaskMembersMatchMask = true :=
    list_all_eq_true_of_mem
      (p := fun rowCert : Row × Certificate =>
        rowCert.1.commonMasks.all commonMaskMembersMatchMask)
      (a := rowCert)
      (items := certifiedRelaxedSplitRows)
      certifiedRelaxedSplitRows_commonMask_members_match hrowCert
  have hcommonAll : commonMaskMembersMatchMask commonMask = true :=
    list_all_eq_true_of_mem
      (p := commonMaskMembersMatchMask)
      (a := commonMask)
      (items := rowCert.1.commonMasks)
      hrowAll hcommon
  have hmemberCheck :
      commonMaskMemberMatchesMask commonMask member = true :=
    list_all_eq_true_of_mem
      (p := commonMaskMemberMatchesMask commonMask)
      (a := member)
      (items := commonMask.members)
      hcommonAll hmember
  simpa [commonMaskMemberMatchesMask, hlabel] using hmemberCheck

/-- A finite generated check over the exact row bank gives a concrete mask bit
for any variable exact row with the matching pid. -/
theorem maskHas_exactRow_of_pid
    {exactRow : SurplusCOMPGBank.Row}
    {pid : String} {center label : SurplusCOMPGBank.Label}
    (hrow : exactRow ∈ SurplusCOMPGBank.rows)
    (hpid : exactRow.pid = pid)
    (hall :
      SurplusCOMPGBank.rows.all
        (fun row =>
          if row.pid = pid then
            SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) label
          else true) = true) :
    SurplusCOMPGBank.maskHas
      (exactRow.masks.getD center.index 0) label = true := by
  have hrowAll :=
    list_all_eq_true_of_mem
      (p := fun row : SurplusCOMPGBank.Row =>
        if row.pid = pid then
          SurplusCOMPGBank.maskHas (row.masks.getD center.index 0) label
        else true)
      (a := exactRow)
      (items := SurplusCOMPGBank.rows)
      hall hrow
  simpa [hpid] using hrowAll

/-- Exact pinned-bank membership is inconsistent once the matching singleton
relaxed split certificate payload has its semantic zero-evaluation condition. -/
theorem false_of_shadowInBank_of_payload_zeros
    (ν : Nat → ℝ) {shadow : SurplusCOMPGBank.Shadow}
    (hin : SurplusCOMPGBank.shadowInBank shadow = true)
    (hzeros : ∀ exactRow : SurplusCOMPGBank.Row,
      ∀ rowCert : Row × Certificate,
        exactRow ∈ SurplusCOMPGBank.rows →
          exactRow.masks = shadow.masks →
            rowCert ∈ certifiedRelaxedSplitRows →
              rowCert.1.exactPids = [exactRow.pid] →
                rowCert.2.payload.evaluationZeros ν) :
    False := by
  rcases exists_certifiedRelaxedSplitRow_of_shadowInBank hin with
    ⟨exactRow, rowCert, hrow, hmasks, hrowCert, hpid, _hcheck⟩
  exact Problem97.SurplusCertificate.RelaxedSplit.false_of_verifiedCertificate
    ν rowCert.2 (hzeros exactRow rowCert hrow hmasks hrowCert hpid)

/-- Exact pinned-bank membership is inconsistent once the matching singleton
relaxed split certificate payload has some semantic zero-evaluation
assignment.  This row-local form is needed for Rabinowitsch rows, whose `tau`
assignment depends on the row separator pair. -/
theorem false_of_shadowInBank_of_exists_payload_zeros
    {shadow : SurplusCOMPGBank.Shadow}
    (hin : SurplusCOMPGBank.shadowInBank shadow = true)
    (hzeros : ∀ exactRow : SurplusCOMPGBank.Row,
      ∀ rowCert : Row × Certificate,
        exactRow ∈ SurplusCOMPGBank.rows →
          exactRow.masks = shadow.masks →
            rowCert ∈ certifiedRelaxedSplitRows →
              rowCert.1.exactPids = [exactRow.pid] →
                ∃ ν : Nat → ℝ, rowCert.2.payload.evaluationZeros ν) :
    False := by
  rcases exists_certifiedRelaxedSplitRow_of_shadowInBank hin with
    ⟨exactRow, rowCert, hrow, hmasks, hrowCert, hpid, _hcheck⟩
  rcases hzeros exactRow rowCert hrow hmasks hrowCert hpid with ⟨ν, hzero⟩
  exact Problem97.SurplusCertificate.RelaxedSplit.false_of_verifiedCertificate
    ν rowCert.2 hzero

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
