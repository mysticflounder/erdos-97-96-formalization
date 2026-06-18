import Erdos9796Proof.P97.N9Endpoint.N4e
import Erdos9796Proof.P97.N4d.BisectorKill
import Erdos9796Proof.P97.N4d.FaithfulFrame
import Erdos9796Proof.P97.N4d.Qa2Cover

/-!
# `N4d-bB1` (`x = b₂`, `A ∈ S(B)`) producer

This module lands the theorem-facing scaffold for the Form-`b`, `x = b₂`,
`A ∈ S(B)` branch from spec W2.

What is already banked here:

* local restatements of the private selector packets from
  `N9EndpointN4e.lean`, so downstream modules can talk about this branch
  directly;
* the exact-packet reduction
  `S(v₂) = {a₂, b₂, v₃, v₁}` via the existing `I₂`-swap reuse;
* the `q' = A` (`v₁`) row re-closure;
* the swapped `q' = E` (`b₂`) twin, routed through the existing
  `q' = a₂` exact-packet closer on the swapped `I₂` names.

The only remaining gap is the hard upper-arc non-witness row
`q' = C` (`a₂`), left behind one explicit `SORRY-GATE` exactly as approved in
the W2 goal change.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97
namespace FiniteEndpointShell

/-- Local restatement of the `v₂`-selector `q = v₁` packet from
`N9EndpointN4e.lean`. -/
def SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  T.card = 4 ∧
    S.I2 ⊆ T ∧
      ∃ p : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
            T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)

/-- Local restatement of the `v₃`-selector split packet from
`N9EndpointN4e.lean`. -/
def SelectorV3SplitPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  T.card = 4 ∧
    S.I3 ⊆ T ∧
      ((∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
            T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
              T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
        (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
            T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
              T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
        ∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
            T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
              T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))

/-- Local restatement of the `q' = A` (`v₁`) `v₃`-selector packet. -/
def SelectorV3Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)

/-- Local restatement of the `q' = C` (`a₂`) `v₃`-selector packet. -/
def SelectorV3Qa2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  S.I3 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)

/-- Local restatement of the `q' = E` (`b₂`) `v₃`-selector packet. -/
def SelectorV3Qb2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  S.I3 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)

/-- Local restatement of the `x = a₂` Form-`b` packet. -/
def FormBv1A2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.a2 : ℝ²) ∈ S.I2 ∧
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
      S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)

/-- Local restatement of the `x = a₂`, `A ∈ S(B)` branch packet. -/
def FormBv1A2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1A2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s

/-- Local restatement of the `x = b₂` Form-`b` packet. -/
def FormBv1B2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.b2 : ℝ²) ∈ S.I2 ∧
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
      S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)

/-- Local restatement of the full `x = b₂`, `A ∈ S(B)` branch packet. -/
def FormBv1B2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1B2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s

/-- Spec-default `x = b₂` pin at `v₁`. -/
def Xb2Pin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ _ : (Z.b2 : ℝ²) ∈ S.I2,
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)

/-- Spec-default `A ∈ S(B)` pin at `v₂`. -/
def AInSBPin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  0 < s ∧ SelectorV2Qv1Packet S Z s

/-- Swap the two `I₂` names locally, mirroring the reusable `N9EndpointN4e`
relabeling helper. -/
private def ZeroDefectCapLayout.swapI2
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.b2
  b2 := Z.a2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := Z.hI1
  hI2 := by
    ext x
    constructor <;> intro hx <;> simpa [Z.hI2, or_comm] using hx
  hI3 := Z.hI3

/-- Any same-radius `v₁`-class of size at least four has positive radius. -/
private theorem witnessClassAt_v1_radius_pos_of_card_ge_four
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card) :
    0 < r := by
  have hpos : 0 < (S.witnessClassAt_v1 r).card := by
    omega
  obtain ⟨x, hx⟩ := Finset.card_pos.mp hpos
  have hr_nonneg : 0 ≤ r := by
    have hxdist : dist S.triangle.v1 x = r := (Finset.mem_filter.mp hx).2
    have : 0 ≤ dist S.triangle.v1 x := dist_nonneg
    linarith
  by_contra hnot
  have hr0 : r = 0 := by
    linarith
  have hsubset :
      S.witnessClassAt_v1 r ⊆ ({S.triangle.v1} : Finset ℝ²) := by
    intro y hy
    have hydist : dist S.triangle.v1 y = r := (Finset.mem_filter.mp hy).2
    have hy0 : dist S.triangle.v1 y = 0 := by
      simpa [hr0] using hydist
    have hy_eq : y = S.triangle.v1 := by
      have : S.triangle.v1 = y := dist_eq_zero.mp hy0
      simpa using this.symm
    simp [hy_eq]
  have hcard_le :
      (S.witnessClassAt_v1 r).card ≤ ({S.triangle.v1} : Finset ℝ²).card :=
    Finset.card_le_card hsubset
  have : (S.witnessClassAt_v1 r).card ≤ 1 := by
    simpa using hcard_le
  omega

/-- Combine the spec-default `x = b₂` pin with `IsFormB_v1`. -/
private theorem formBv1B2Packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r) (hxb2 : Xb2Pin S Z r) :
    FormBv1B2Packet S Z r := by
  rcases hB with ⟨_, _, _, hv2eq⟩
  rcases hxb2 with ⟨hb2I2, hb2eq⟩
  exact ⟨hb2I2, hb2eq, hv2eq⟩

/-- Combine the two spec-default pins into the full branch packet. -/
private theorem formBv1B2SelectorV2Qv1Packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r) (hxb2 : Xb2Pin S Z r)
    (hAinSB : AInSBPin S Z s) :
    FormBv1B2SelectorV2Qv1Packet S Z r s := by
  rcases hAinSB with ⟨hs, hselector⟩
  exact ⟨S.formBv1B2Packet_of_pins Z hB hxb2, hs, hselector⟩

/-- Re-expose the exact-packet upgrade
`S(v₂) = {a₂, b₂, v₃, v₁}` from the local branch pins. -/
private theorem selectorShape_v2_q_eq_v1_exact_packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s) :
    S.witnessClassAt_v2 s =
      insert Z.a2
        (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  have hr := S.witnessClassAt_v1_radius_pos_of_card_ge_four hcard
  have hbranch := S.formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hlocal :
      FormBv1B2SelectorV2Qv1Packet S Z r s →
        S.witnessClassAt_v2 s =
          insert Z.a2
            (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    dsimp [FormBv1B2SelectorV2Qv1Packet, FormBv1B2Packet, SelectorV2Qv1Packet]
    exact S.selectorShape_v2_q_eq_v1_exact_packet_of_b2
      (Z := Z) (r := r) (s := s) hr hcard
  exact hlocal hbranch

/-- Re-close the `q' = A` row from the local branch pins. -/
private theorem selectorShape_v3_q_eq_v1_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qv1Packet S Z t) :
    False := by
  have hbranch := S.formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hexact := S.selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  have hlocal :
      FormBv1B2SelectorV2Qv1Packet S Z r s →
        S.witnessClassAt_v2 s =
          insert Z.a2
            (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
          SelectorV3Qv1Packet S Z t →
            False := by
    dsimp [FormBv1B2SelectorV2Qv1Packet, FormBv1B2Packet]
    dsimp [SelectorV2Qv1Packet, SelectorV3Qv1Packet]
    exact S.selectorShape_v3_q_eq_v1_impossible_of_b2_exact_packet
      (Z := Z) (r := r) (s := s) (t := t)
  exact hlocal hbranch hexact hpacket

/-- The W2 non-witness upper-arc `q' = a₂` row in the exact `x = b₂`,
`A ∈ S(B)` packet is impossible.

Closed by `S.a3_k4_cover` (`N4dQa2Cover.lean`): the shell's per-vertex K4
demand at the cap-`C₃` interior point `a₃` is unsatisfiable.  Nine
branch-independent `bisectorKill` dead pairs cover all `C(8,4) = 70` candidate
4-subsets of the other eight named points, so the `circle(a₃, r)` class cannot
reach the four members K4 requires.  The kill consumes only `hexact` and the
`hbranch` C₃-pin + `hcard`; `hpacket` (the `q'=a₂` selector content) is not
needed — the `a₃` row needs only one empty point. -/
private theorem selectorShape_v3_q_eq_a2_nonwitness_upperArc_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2
        (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  -- `hpacket` (the `q'=a₂` selector content) is carried for interface symmetry
  -- with the sibling rows but is not consumed: the `a₃` row needs only one
  -- empty point, which `a₃`'s own K4 demand already forbids.
  let _ := hpacket
  -- W2 `q'=a₂` non-witness row — `a₃`'s own K4 demand kills it.
  --
  -- PROVEN ON PAPER (3 independent ways): the joint-K4 census
  --   docs/n-lane/97-n4d-qeqe-spec-b-jointK4-census-2026-06-10.md,
  --   the hand-proofs  …-residual-handproofs-2026-06-10.md (§3 lemma + §4),
  --   the falsification …-falsification-2026-06-10.md (§5 full cover).
  -- The analytic spine is the banked, kernel-checked
  --   `Problem97.bisectorKill` (Erdos9796Proof/P97/N4dBisectorKill.lean).
  --
  -- The cover is now formalized in `Erdos9796Proof/P97/N4dQa2Cover.lean` as
  --   `S.a3_k4_cover`: the per-vertex K4 demand at the cap-`C₃` interior point
  --   `a₃` is unsatisfiable.  Nine branch-independent dead pairs — six on
  --   `circle(v₂,1)` (`{v₁,a₂},{v₃,a₂},{v₁,b₂},{v₃,b₂},{a₂,b₂},{v₁,v₃}`) and
  --   three on `circle(v₁,1)` (`{a₁,b₁},{v₂,a₁},{v₂,b₁}`) — cover all
  --   `C(8,4) = 70` candidate 4-subsets of the other eight named points, so no
  --   p-branch dispatch is needed.  Each pair is killed by `bisectorKill`.
  --
  -- The cover consumes only `hexact` (v₂-anchor frame + `circle(v₂,1)` pins)
  -- and the `hbranch` C₃-pin + `hcard` (v₁-anchor frame + `circle(v₁,1)` pins);
  -- `hpacket` (the `q'=a₂` selector content) is not needed for the `a₃` kill —
  -- the `a₃` row needs only one empty point, and `a₃`'s own K4 demand suffices.
  exact S.a3_k4_cover Z hbranch.1.2.2 hcard hexact

/-- Route the single remaining hard W2 row through the explicit `SORRY-GATE`. -/
private theorem selectorShape_v3_q_eq_a2_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  have hbranch := S.formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hexact := S.selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  exact S.selectorShape_v3_q_eq_a2_nonwitness_upperArc_impossible
    Z hbranch hcard hexact hpacket

/-- The `q' = b₂` row is the swapped `I₂` twin of the already-closed
`q' = a₂` exact-packet row. -/
private theorem selectorShape_v3_q_eq_b2_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qb2Packet S Z t) :
    False := by
  have hbranch0 := S.formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  rcases hbranch0 with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hselector⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S Z.swapI2 r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet] using hselector
  have hexact := S.selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  have hswap :
      S.witnessClassAt_v2 s =
        insert Z.swapI2.a2
          (insert Z.swapI2.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    ext x
    simp [ZeroDefectCapLayout.swapI2, hexact, Finset.mem_insert]
    simp [or_left_comm]
  have hpacket' : SelectorV3Qa2Packet S Z.swapI2 t := by
    simpa [SelectorV3Qa2Packet, SelectorV3Qb2Packet, ZeroDefectCapLayout.swapI2]
      using hpacket
  have hlocal :
      FormBv1A2SelectorV2Qv1Packet S Z.swapI2 r s →
        S.witnessClassAt_v2 s =
          insert Z.swapI2.a2
            (insert Z.swapI2.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
          SelectorV3Qa2Packet S Z.swapI2 t →
            False := by
    dsimp [FormBv1A2SelectorV2Qv1Packet, FormBv1A2Packet]
    dsimp [SelectorV2Qv1Packet, SelectorV3Qa2Packet]
    exact S.selectorShape_v3_q_eq_a2_impossible_of_exact_packet
      (Z := Z.swapI2) (r := r) (s := s) (t := t)
  exact hlocal hbranch' hswap hpacket'

/-- Repackage the public `v₃`-selector split theorem in the local packet
language used by this W2 file. -/
private theorem selectorShape_v3_split_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ t : ℝ, 0 < t ∧ SelectorV3SplitPacket S Z t := by
  rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit⟩
  exact ⟨t, ht, by simpa [SelectorV3SplitPacket] using hsplit⟩

/-- `N4d-bB1`: the `x = b₂`, `A ∈ S(B)` branch is impossible.

The extra cardinality hypothesis is the minimal public assumption needed to
recover the exact packet `S(v₂) = {a₂, b₂, v₃, v₁}` from the existing
`N9EndpointN4e` machinery. -/
theorem n4d_bB1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r)
    (hAinSB : AInSBPin S Z s) :
    False := by
  rcases S.selectorShape_v3_split_local Z with ⟨t, _, hsplit⟩
  rcases hsplit with ⟨_, hI3sub, hcases⟩
  rcases hcases with hqv1 | hrest
  · have hpacket : SelectorV3Qv1Packet S Z t := by
      dsimp [SelectorV3Qv1Packet]
      exact hqv1
    exact S.selectorShape_v3_q_eq_v1_impossible_of_pins
      Z hB hcard hxb2 hAinSB hpacket
  rcases hrest with hqa2 | hqb2
  · have hpacket : SelectorV3Qa2Packet S Z t := by
      dsimp [SelectorV3Qa2Packet]
      exact ⟨hI3sub, hqa2⟩
    exact S.selectorShape_v3_q_eq_a2_impossible_of_pins
      Z hB hcard hxb2 hAinSB hpacket
  have hpacket : SelectorV3Qb2Packet S Z t := by
    dsimp [SelectorV3Qb2Packet]
    exact ⟨hI3sub, hqb2⟩
  exact S.selectorShape_v3_q_eq_b2_impossible_of_pins
    Z hB hcard hxb2 hAinSB hpacket

end FiniteEndpointShell
end Problem97
