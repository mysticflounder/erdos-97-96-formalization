/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Card18ArmCnf

/-!
# Positive controls for the card-eighteen Rigid221 formulas

This module gives each v1 abstract arm one explicit valid packet and uses the checked formula
correspondence to obtain a satisfying assignment. These finite packets are positive controls for
the abstraction; they are not geometric source realizations.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace Rigid221Card18PositiveControls

open Rigid221Card18ArmCnf

/-- The common labels and supports shared by all three positive-control packets. -/
def v1Common : Rigid221Card18AbstractCommonData where
  roles :=
    { physical :=
        { u := 0
          v := 1
          xu := 2
          xv := 3
          deleted := 4 }
      sourceCenters :=
        { source1 := 5
          source2 := 6
          deletedCenter := 7
          actualCenter1 := 8
          actualCenter2 := 9 } }
  selectedXvRow := {0, 3, 10, 11}
  deletedCenterRow := {7, 10, 11, 12}

/-- The bi-survival support data used by the v1 positive control. -/
def v1BiData : Rigid221Card18AbstractBiData where
  uB1 := {1, 2, 3, 4}
  uB2 := {5, 6, 7, 8}
  xvB1 := {0, 1, 2, 4}
  xvB2 := {5, 6, 7, 8}

/-- The U-deletion crossed support data used by the v1 positive control. -/
def v1UData : Rigid221Card18AbstractCrossedData where
  oppApex2 := 13
  K1 := {3, 5, 10, 11}
  K2 := {3, 6, 12, 13}
  BO := {3, 10, 11, 12}

/-- The XV-deletion crossed support data used by the v1 positive control. -/
def v1XvData : Rigid221Card18AbstractCrossedData where
  oppApex2 := 13
  K1 := {0, 5, 10, 11}
  K2 := {0, 6, 12, 13}
  BO := {0, 10, 11, 12}

/-- The explicit v1 bi-survival packet. -/
def v1BiPacket : PacketOfArm .bi := (v1Common, v1BiData)

/-- The explicit v1 U-deletion packet. -/
def v1UPacket : PacketOfArm .u := (v1Common, v1UData)

/-- The explicit v1 XV-deletion packet. -/
def v1XvPacket : PacketOfArm .xv := (v1Common, v1XvData)

/-- The explicit bi-survival packet satisfies every published v1 validity atom. -/
theorem v1BiPacket_valid : PacketOfArm.Valid v1BiPacket := by
  change Rigid221Card18AbstractPacket.Valid (.bi v1Common v1BiData)
  decide

/-- The explicit U-deletion packet satisfies every published v1 validity atom. -/
theorem v1UPacket_valid : PacketOfArm.Valid v1UPacket := by
  change Rigid221Card18AbstractPacket.Valid (.u v1Common v1UData)
  decide

/-- The explicit XV-deletion packet satisfies every published v1 validity atom. -/
theorem v1XvPacket_valid : PacketOfArm.Valid v1XvPacket := by
  change Rigid221Card18AbstractPacket.Valid (.xv v1Common v1XvData)
  decide

/-- The v1 bi-survival validity subtype is inhabited. -/
theorem bi_v1_valid_nonempty : Nonempty {p : PacketOfArm .bi // PacketOfArm.Valid p} :=
  ⟨⟨v1BiPacket, v1BiPacket_valid⟩⟩

/-- The v1 U-deletion validity subtype is inhabited. -/
theorem u_v1_valid_nonempty : Nonempty {p : PacketOfArm .u // PacketOfArm.Valid p} :=
  ⟨⟨v1UPacket, v1UPacket_valid⟩⟩

/-- The v1 XV-deletion validity subtype is inhabited. -/
theorem xv_v1_valid_nonempty : Nonempty {p : PacketOfArm .xv // PacketOfArm.Valid p} :=
  ⟨⟨v1XvPacket, v1XvPacket_valid⟩⟩

/-- The published v1 bi-survival formula has a satisfying assignment. -/
theorem bi_v1_armCnf_sat :
    ∃ sigma : Nat → Bool, Std.Sat.CNF.Sat sigma (armCnf .bi) :=
  (armCnf_sat_iff .bi).mpr bi_v1_valid_nonempty

/-- The published v1 U-deletion formula has a satisfying assignment. -/
theorem u_v1_armCnf_sat :
    ∃ sigma : Nat → Bool, Std.Sat.CNF.Sat sigma (armCnf .u) :=
  (armCnf_sat_iff .u).mpr u_v1_valid_nonempty

/-- The published v1 XV-deletion formula has a satisfying assignment. -/
theorem xv_v1_armCnf_sat :
    ∃ sigma : Nat → Bool, Std.Sat.CNF.Sat sigma (armCnf .xv) :=
  (armCnf_sat_iff .xv).mpr xv_v1_valid_nonempty

#print axioms bi_v1_valid_nonempty
#print axioms u_v1_valid_nonempty
#print axioms xv_v1_valid_nonempty
#print axioms bi_v1_armCnf_sat
#print axioms u_v1_armCnf_sat
#print axioms xv_v1_armCnf_sat

end Rigid221Card18PositiveControls
end ATailFrontierLiveClosure
end Problem97
