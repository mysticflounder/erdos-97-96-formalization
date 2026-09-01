/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.AbstractRowSystem
import Mathlib.Data.ZMod.Basic
import Mathlib.Tactic

/-!
# The cyclic `{1, 2, 4, 8}` row system

This file begins the formalization of the uniform cyclic incidence obstruction.
It is purely combinatorial and makes no claim of Euclidean realizability.
-/

namespace Problem97
namespace Cyclic1248AbstractRowSystem

variable (n : ℕ)

/-- The translate by `c` of the four offsets `1, 2, 4, 8`. -/
def row (c : ZMod n) : Finset (ZMod n) :=
  {c + 1, c + 2, c + 4, c + 8}

/-- The cyclic row family as a weak abstract row system. -/
def system : AbstractRowSystem (ZMod n) where
  row := row n

/-- The chosen predecessor blocker. -/
def beta (q : ZMod n) : ZMod n :=
  q - 1

theorem mem_row_iff (c x : ZMod n) :
    x ∈ row n c ↔ x = c + 1 ∨ x = c + 2 ∨ x = c + 4 ∨ x = c + 8 := by
  simp [row]

/-- Natural numbers below the modulus have distinct images in `ZMod n`. -/
private theorem natCast_ne_of_lt {a b : ℕ}
    (ha : a < n) (hb : b < n) (hab : a ≠ b) :
    (a : ZMod n) ≠ (b : ZMod n) := by
  intro h
  have hmod : a % n = b % n :=
    (ZMod.natCast_eq_natCast_iff' a b n).mp h
  rw [Nat.mod_eq_of_lt ha, Nat.mod_eq_of_lt hb] at hmod
  exact hab hmod

theorem row_card_eq_four (hn : 9 ≤ n) (c : ZMod n) :
    (row n c).card = 4 := by
  have h12 : (1 : ZMod n) ≠ 2 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 2) (by omega) (by omega) (by omega)
  have h14 : (1 : ZMod n) ≠ 4 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 4) (by omega) (by omega) (by omega)
  have h18 : (1 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 8) (by omega) (by omega) (by omega)
  have h24 : (2 : ZMod n) ≠ 4 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 4) (by omega) (by omega) (by omega)
  have h28 : (2 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 8) (by omega) (by omega) (by omega)
  have h48 : (4 : ZMod n) ≠ 8 :=
    by simpa using
      natCast_ne_of_lt n (a := 4) (b := 8) (by omega) (by omega) (by omega)
  simp [row, h12, h14, h18, h24, h28, h48]

theorem system_rowCardEq (hn : 9 ≤ n) :
    (system n).RowCardEq 4 := by
  intro c
  exact row_card_eq_four n hn c

theorem center_not_mem_row (hn : 9 ≤ n) (c : ZMod n) :
    c ∉ row n c := by
  have h10 : (1 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 0) (by omega) (by omega) (by omega)
  have h20 : (2 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 2) (b := 0) (by omega) (by omega) (by omega)
  have h40 : (4 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 4) (b := 0) (by omega) (by omega) (by omega)
  have h80 : (8 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 8) (b := 0) (by omega) (by omega) (by omega)
  simp [row, h10, h20, h40, h80]

theorem system_centerExcluded (hn : 9 ≤ n) :
    (system n).CenterExcluded := by
  intro c
  exact center_not_mem_row n hn c

theorem beta_ne_self (hn : 9 ≤ n) (q : ZMod n) :
    beta n q ≠ q := by
  have h10 : (1 : ZMod n) ≠ 0 :=
    by simpa using
      natCast_ne_of_lt n (a := 1) (b := 0) (by omega) (by omega) (by omega)
  intro h
  apply h10
  have := congrArg (fun x : ZMod n => q - x) h
  simpa [beta] using this

theorem source_mem_beta_row (q : ZMod n) :
    q ∈ row n (beta n q) := by
  simp [row, beta]

theorem system_hasBlockerSection (hn : 9 ≤ n) :
    (system n).HasBlockerSection (beta n) := by
  intro q
  exact ⟨beta_ne_self n hn q, source_mem_beta_row n q⟩

theorem beta_bijective : Function.Bijective (beta n) := by
  constructor
  · intro a b h
    have := congrArg (fun x : ZMod n => x + 1) h
    simpa [beta] using this
  · intro q
    refine ⟨q + 1, ?_⟩
    simp [beta]

private def IsOffset (a : ℕ) : Prop :=
  a = 1 ∨ a = 2 ∨ a = 4 ∨ a = 8

private theorem mem_row_iff_exists_offset (c x : ZMod n) :
    x ∈ row n c ↔
      ∃ a : ℕ, IsOffset a ∧ x = c + (a : ZMod n) := by
  rw [mem_row_iff]
  constructor
  · rintro (hx | hx | hx | hx)
    · exact ⟨1, Or.inl rfl, by simpa using hx⟩
    · exact ⟨2, Or.inr (Or.inl rfl), by simpa using hx⟩
    · exact ⟨4, Or.inr (Or.inr (Or.inl rfl)), by simpa using hx⟩
    · exact ⟨8, Or.inr (Or.inr (Or.inr rfl)), by simpa using hx⟩
  · rintro ⟨a, ha, rfl⟩
    rcases ha with rfl | rfl | rfl | rfl
    · exact Or.inl (by simp)
    · exact Or.inr (Or.inl (by simp))
    · exact Or.inr (Or.inr (Or.inl (by simp)))
    · exact Or.inr (Or.inr (Or.inr (by simp)))

private theorem offset_bounds {a : ℕ} (ha : IsOffset a) :
    (1 : ℤ) ≤ a ∧ (a : ℤ) ≤ 8 := by
  rcases ha with rfl | rfl | rfl | rfl <;> norm_num

private theorem offset_gap_injective {a b a' b' : ℕ}
    (ha : IsOffset a) (hb : IsOffset b)
    (ha' : IsOffset a') (hb' : IsOffset b')
    (hab : a ≠ b) (hab' : a' ≠ b')
    (hgap : (b : ℤ) - a = (b' : ℤ) - a') :
    a = a' ∧ b = b' := by
  rcases ha with rfl | rfl | rfl | rfl <;>
    rcases hb with rfl | rfl | rfl | rfl <;>
    rcases ha' with rfl | rfl | rfl | rfl <;>
    rcases hb' with rfl | rfl | rfl | rfl
  all_goals omega

private theorem intCast_eq_of_bounded_gaps (hn : 15 ≤ n)
    {z w : ℤ} (hzLower : -7 ≤ z) (hzUpper : z ≤ 7)
    (hwLower : -7 ≤ w) (hwUpper : w ≤ 7)
    (hcast : (z : ZMod n) = (w : ZMod n)) : z = w := by
  have hdvd : (n : ℤ) ∣ w - z :=
    (ZMod.intCast_eq_intCast_iff_dvd_sub z w n).mp hcast
  have habs : |w - z| < (n : ℤ) := by
    rw [abs_lt]
    constructor <;> omega
  have hzero : w - z = 0 := Int.eq_zero_of_abs_lt_dvd hdvd habs
  omega

private theorem cast_gap_eq_center_sub {c d x : ZMod n} {a b : ℕ}
    (hxa : x = c + (a : ZMod n))
    (hxb : x = d + (b : ZMod n)) :
    (((b : ℤ) - a : ℤ) : ZMod n) = c - d := by
  have hx : c + (a : ZMod n) = d + (b : ZMod n) := hxa.symm.trans hxb
  rw [Int.cast_sub, Int.cast_natCast, Int.cast_natCast]
  calc
    (b : ZMod n) - a =
        (d + (b : ZMod n)) - (d + (a : ZMod n)) := by abel
    _ = (c + (a : ZMod n)) - (d + (a : ZMod n)) := by rw [← hx]
    _ = c - d := by abel

private theorem cast_gap_eq_point_sub {c x y : ZMod n} {a b : ℕ}
    (hxa : x = c + (a : ZMod n))
    (hyb : y = c + (b : ZMod n)) :
    (((b : ℤ) - a : ℤ) : ZMod n) = y - x := by
  rw [Int.cast_sub, Int.cast_natCast, Int.cast_natCast]
  calc
    (b : ZMod n) - a =
        (c + (b : ZMod n)) - (c + (a : ZMod n)) := by abel
    _ = y - x := by rw [← hyb, ← hxa]

/-- Above modulus fourteen, two distinct cyclic rows meet in at most one
point. -/
theorem row_inter_card_le_one (hn : 15 ≤ n) {c d : ZMod n} (hcd : c ≠ d) :
    ((row n c) ∩ (row n d)).card ≤ 1 := by
  rw [Finset.card_le_one_iff]
  intro x y hx hy
  rcases Finset.mem_inter.mp hx with ⟨hxc, hxd⟩
  rcases Finset.mem_inter.mp hy with ⟨hyc, hyd⟩
  rcases (mem_row_iff_exists_offset n c x).mp hxc with ⟨a, ha, hxa⟩
  rcases (mem_row_iff_exists_offset n d x).mp hxd with ⟨b, hb, hxb⟩
  rcases (mem_row_iff_exists_offset n c y).mp hyc with ⟨a', ha', hya⟩
  rcases (mem_row_iff_exists_offset n d y).mp hyd with ⟨b', hb', hyb⟩
  have hab : a ≠ b := by
    intro hab
    subst b
    apply hcd
    apply add_right_cancel (b := (a : ZMod n))
    exact hxa.symm.trans hxb
  have hab' : a' ≠ b' := by
    intro hab'
    subst b'
    apply hcd
    apply add_right_cancel (b := (a' : ZMod n))
    exact hya.symm.trans hyb
  have haBounds := offset_bounds ha
  have hbBounds := offset_bounds hb
  have ha'Bounds := offset_bounds ha'
  have hb'Bounds := offset_bounds hb'
  have hcast :
      ((((b : ℤ) - a : ℤ) : ZMod n)) =
        (((b' : ℤ) - a' : ℤ) : ZMod n) :=
    (cast_gap_eq_center_sub n hxa hxb).trans
      (cast_gap_eq_center_sub n hya hyb).symm
  have hgap : (b : ℤ) - a = (b' : ℤ) - a' :=
    intCast_eq_of_bounded_gaps n hn
      (by omega) (by omega) (by omega) (by omega) hcast
  have haa' : a = a' :=
    (offset_gap_injective ha hb ha' hb' hab hab' hgap).1
  calc
    x = c + (a : ZMod n) := hxa
    _ = c + (a' : ZMod n) := by rw [haa']
    _ = y := hya.symm

theorem system_rowInterCardLE_one (hn : 15 ≤ n) :
    (system n).RowInterCardLE 1 := by
  intro c d hcd
  exact row_inter_card_le_one n hn hcd

/-- Above modulus fourteen, a distinct point-pair lies in at most one cyclic
row. -/
theorem pairCodegree_le_one [NeZero n] (hn : 15 ≤ n)
    {x y : ZMod n} (hxy : x ≠ y) :
    (system n).pairCodegree x y ≤ 1 := by
  rw [AbstractRowSystem.pairCodegree, Finset.card_le_one_iff]
  intro c d hc hd
  rcases Finset.mem_filter.mp hc with ⟨_, hxc, hyc⟩
  rcases Finset.mem_filter.mp hd with ⟨_, hxd, hyd⟩
  rcases (mem_row_iff_exists_offset n c x).mp hxc with ⟨a, ha, hxa⟩
  rcases (mem_row_iff_exists_offset n c y).mp hyc with ⟨b, hb, hyb⟩
  rcases (mem_row_iff_exists_offset n d x).mp hxd with ⟨a', ha', hxa'⟩
  rcases (mem_row_iff_exists_offset n d y).mp hyd with ⟨b', hb', hyb'⟩
  have hab : a ≠ b := by
    intro hab
    subst b
    apply hxy
    exact hxa.trans hyb.symm
  have hab' : a' ≠ b' := by
    intro hab'
    subst b'
    apply hxy
    exact hxa'.trans hyb'.symm
  have haBounds := offset_bounds ha
  have hbBounds := offset_bounds hb
  have ha'Bounds := offset_bounds ha'
  have hb'Bounds := offset_bounds hb'
  have hcast :
      ((((b : ℤ) - a : ℤ) : ZMod n)) =
        (((b' : ℤ) - a' : ℤ) : ZMod n) :=
    (cast_gap_eq_point_sub n hxa hyb).trans
      (cast_gap_eq_point_sub n hxa' hyb').symm
  have hgap : (b : ℤ) - a = (b' : ℤ) - a' :=
    intCast_eq_of_bounded_gaps n hn
      (by omega) (by omega) (by omega) (by omega) hcast
  have haa' : a = a' :=
    (offset_gap_injective ha hb ha' hb' hab hab' hgap).1
  apply add_right_cancel (b := (a : ZMod n))
  calc
    c + (a : ZMod n) = x := hxa.symm
    _ = d + (a' : ZMod n) := hxa'
    _ = d + (a : ZMod n) := by rw [haa']

theorem system_pairCodegreeLE_one [NeZero n] (hn : 15 ≤ n) :
    (system n).PairCodegreeLE 1 := by
  intro x y hxy
  exact pairCodegree_le_one n hn hxy

private theorem three_bounded_congruent_gaps (hn : 9 ≤ n)
    {u v w : ℤ}
    (huLower : -7 ≤ u) (huUpper : u ≤ 7)
    (hvLower : -7 ≤ v) (hvUpper : v ≤ 7)
    (hwLower : -7 ≤ w) (hwUpper : w ≤ 7)
    (huvCast : (u : ZMod n) = (v : ZMod n))
    (huwCast : (u : ZMod n) = (w : ZMod n)) :
    u = v ∨ u = w ∨ v = w := by
  by_contra hpairs
  have huv : u ≠ v := fun h => hpairs (Or.inl h)
  have huw : u ≠ w := fun h => hpairs (Or.inr (Or.inl h))
  have hvw : v ≠ w := fun h => hpairs (Or.inr (Or.inr h))
  have hvwCast : (v : ZMod n) = (w : ZMod n) :=
    huvCast.symm.trans huwCast
  have hnPos : (0 : ℤ) < n := by omega
  have hsep : ∀ {p q : ℤ},
      (p : ZMod n) = (q : ZMod n) → p < q → (n : ℤ) + p ≤ q := by
    intro p q hpqCast hpq
    exact (Int.le_add_iff_lt_of_dvd_sub hnPos
      ((ZMod.intCast_eq_intCast_iff_dvd_sub p q n).mp hpqCast)).2 hpq
  rcases lt_or_gt_of_ne huv with huvLt | hvuLt
  · rcases lt_or_gt_of_ne hvw with hvwLt | hwvLt
    · have hs₁ := hsep huvCast huvLt
      have hs₂ := hsep hvwCast hvwLt
      omega
    · rcases lt_or_gt_of_ne huw with huwLt | hwuLt
      · have hs₁ := hsep huwCast huwLt
        have hs₂ := hsep hvwCast.symm hwvLt
        omega
      · have hs₁ := hsep huwCast.symm hwuLt
        have hs₂ := hsep huvCast huvLt
        omega
  · rcases lt_or_gt_of_ne huw with huwLt | hwuLt
    · have hs₁ := hsep huvCast.symm hvuLt
      have hs₂ := hsep huwCast huwLt
      omega
    · rcases lt_or_gt_of_ne hvw with hvwLt | hwvLt
      · have hs₁ := hsep hvwCast hvwLt
        have hs₂ := hsep huwCast.symm hwuLt
        omega
      · have hs₁ := hsep hvwCast.symm hwvLt
        have hs₂ := hsep huvCast.symm hvuLt
        omega

/-- For every modulus at least nine, distinct cyclic rows meet in at most two
points. -/
theorem row_inter_card_le_two (hn : 9 ≤ n) {c d : ZMod n} (hcd : c ≠ d) :
    ((row n c) ∩ (row n d)).card ≤ 2 := by
  by_contra hcard
  have hthree : 2 < ((row n c) ∩ (row n d)).card := by omega
  rw [Finset.two_lt_card_iff] at hthree
  rcases hthree with ⟨x, y, z, hx, hy, hz, hxy, hxz, hyz⟩
  rcases Finset.mem_inter.mp hx with ⟨hxc, hxd⟩
  rcases Finset.mem_inter.mp hy with ⟨hyc, hyd⟩
  rcases Finset.mem_inter.mp hz with ⟨hzc, hzd⟩
  rcases (mem_row_iff_exists_offset n c x).mp hxc with ⟨ax, hax, hxax⟩
  rcases (mem_row_iff_exists_offset n d x).mp hxd with ⟨bx, hbx, hxbx⟩
  rcases (mem_row_iff_exists_offset n c y).mp hyc with ⟨ay, hay, hyay⟩
  rcases (mem_row_iff_exists_offset n d y).mp hyd with
    ⟨byOff, hbyOff, hybyOff⟩
  rcases (mem_row_iff_exists_offset n c z).mp hzc with ⟨az, haz, hzaz⟩
  rcases (mem_row_iff_exists_offset n d z).mp hzd with ⟨bz, hbz, hzbz⟩
  have haxbx : ax ≠ bx := by
    intro h
    subst bx
    apply hcd
    exact add_right_cancel (hxax.symm.trans hxbx)
  have hayby : ay ≠ byOff := by
    intro h
    subst byOff
    apply hcd
    exact add_right_cancel (hyay.symm.trans hybyOff)
  have hazbz : az ≠ bz := by
    intro h
    subst bz
    apply hcd
    exact add_right_cancel (hzaz.symm.trans hzbz)
  have haxBounds := offset_bounds hax
  have hbxBounds := offset_bounds hbx
  have hayBounds := offset_bounds hay
  have hbyBounds := offset_bounds hbyOff
  have hazBounds := offset_bounds haz
  have hbzBounds := offset_bounds hbz
  have hxGap := cast_gap_eq_center_sub n hxax hxbx
  have hyGap := cast_gap_eq_center_sub n hyay hybyOff
  have hzGap := cast_gap_eq_center_sub n hzaz hzbz
  have hpairs := three_bounded_congruent_gaps n hn
    (u := (bx : ℤ) - ax) (v := (byOff : ℤ) - ay) (w := (bz : ℤ) - az)
    (by omega) (by omega) (by omega) (by omega) (by omega) (by omega)
    (hxGap.trans hyGap.symm) (hxGap.trans hzGap.symm)
  rcases hpairs with hxyGap | hxzGap | hyzGap
  · have hOffsets :=
      offset_gap_injective hax hbx hay hbyOff haxbx hayby hxyGap
    apply hxy
    calc
      x = c + (ax : ZMod n) := hxax
      _ = c + (ay : ZMod n) := by rw [hOffsets.1]
      _ = y := hyay.symm
  · have hOffsets :=
      offset_gap_injective hax hbx haz hbz haxbx hazbz hxzGap
    apply hxz
    calc
      x = c + (ax : ZMod n) := hxax
      _ = c + (az : ZMod n) := by rw [hOffsets.1]
      _ = z := hzaz.symm
  · have hOffsets :=
      offset_gap_injective hay hbyOff haz hbz hayby hazbz hyzGap
    apply hyz
    calc
      y = c + (ay : ZMod n) := hyay
      _ = c + (az : ZMod n) := by rw [hOffsets.1]
      _ = z := hzaz.symm

theorem system_rowInterCardLE_two (hn : 9 ≤ n) :
    (system n).RowInterCardLE 2 := by
  intro c d hcd
  exact row_inter_card_le_two n hn hcd

/-- For every modulus at least nine, a distinct point-pair occurs together in
at most two cyclic rows. -/
theorem pairCodegree_le_two [NeZero n] (hn : 9 ≤ n)
    {x y : ZMod n} (hxy : x ≠ y) :
    (system n).pairCodegree x y ≤ 2 := by
  by_contra hcard
  have hthree : 2 < (system n).pairCodegree x y := by omega
  rw [AbstractRowSystem.pairCodegree, Finset.two_lt_card_iff] at hthree
  rcases hthree with ⟨c, d, e, hc, hd, he, hcd, hce, hde⟩
  rcases Finset.mem_filter.mp hc with ⟨_, hxc, hyc⟩
  rcases Finset.mem_filter.mp hd with ⟨_, hxd, hyd⟩
  rcases Finset.mem_filter.mp he with ⟨_, hxe, hye⟩
  rcases (mem_row_iff_exists_offset n c x).mp hxc with ⟨ac, hac, hxac⟩
  rcases (mem_row_iff_exists_offset n c y).mp hyc with ⟨bc, hbc, hybc⟩
  rcases (mem_row_iff_exists_offset n d x).mp hxd with ⟨ad, had, hxad⟩
  rcases (mem_row_iff_exists_offset n d y).mp hyd with ⟨bd, hbd, hybd⟩
  rcases (mem_row_iff_exists_offset n e x).mp hxe with ⟨ae, hae, hxae⟩
  rcases (mem_row_iff_exists_offset n e y).mp hye with ⟨be, hbe, hybe⟩
  have hacbc : ac ≠ bc := by
    intro h
    subst bc
    exact hxy (hxac.trans hybc.symm)
  have hadbd : ad ≠ bd := by
    intro h
    subst bd
    exact hxy (hxad.trans hybd.symm)
  have haebe : ae ≠ be := by
    intro h
    subst be
    exact hxy (hxae.trans hybe.symm)
  have hacBounds := offset_bounds hac
  have hbcBounds := offset_bounds hbc
  have hadBounds := offset_bounds had
  have hbdBounds := offset_bounds hbd
  have haeBounds := offset_bounds hae
  have hbeBounds := offset_bounds hbe
  have hcGap := cast_gap_eq_point_sub n hxac hybc
  have hdGap := cast_gap_eq_point_sub n hxad hybd
  have heGap := cast_gap_eq_point_sub n hxae hybe
  have hpairs := three_bounded_congruent_gaps n hn
    (u := (bc : ℤ) - ac) (v := (bd : ℤ) - ad) (w := (be : ℤ) - ae)
    (by omega) (by omega) (by omega) (by omega) (by omega) (by omega)
    (hcGap.trans hdGap.symm) (hcGap.trans heGap.symm)
  rcases hpairs with hcdGap | hceGap | hdeGap
  · have hOffsets :=
      offset_gap_injective hac hbc had hbd hacbc hadbd hcdGap
    apply hcd
    apply add_right_cancel (b := (ac : ZMod n))
    calc
      c + (ac : ZMod n) = x := hxac.symm
      _ = d + (ad : ZMod n) := hxad
      _ = d + (ac : ZMod n) := by rw [hOffsets.1]
  · have hOffsets :=
      offset_gap_injective hac hbc hae hbe hacbc haebe hceGap
    apply hce
    apply add_right_cancel (b := (ac : ZMod n))
    calc
      c + (ac : ZMod n) = x := hxac.symm
      _ = e + (ae : ZMod n) := hxae
      _ = e + (ac : ZMod n) := by rw [hOffsets.1]
  · have hOffsets :=
      offset_gap_injective had hbd hae hbe hadbd haebe hdeGap
    apply hde
    apply add_right_cancel (b := (ad : ZMod n))
    calc
      d + (ad : ZMod n) = x := hxad.symm
      _ = e + (ae : ZMod n) := hxae
      _ = e + (ad : ZMod n) := by rw [hOffsets.1]

theorem system_pairCodegreeLE_two [NeZero n] (hn : 9 ≤ n) :
    (system n).PairCodegreeLE 2 := by
  intro x y hxy
  exact pairCodegree_le_two n hn hxy

/-- The `+1` edge forces every nonempty support-closed set to contain the
whole cyclic carrier. -/
theorem system_supportMinimal [NeZero n] :
    (system n).SupportMinimal := by
  intro T hT hclosed
  apply Finset.eq_univ_of_forall
  intro x
  rcases hT with ⟨c, hc⟩
  have hstep (y : ZMod n) (hy : y ∈ T) : y + 1 ∈ T := by
    apply hclosed hy
    simp [system, row]
  have hiter : ∀ k : ℕ, c + (k : ZMod n) ∈ T := by
    intro k
    induction k with
    | zero => simpa using hc
    | succ k ih =>
        have hnext := hstep (c + (k : ZMod n)) ih
        simpa [Nat.cast_succ, add_assoc] using hnext
  have hx := hiter (x - c).val
  simpa [ZMod.natCast_zmod_val] using hx

end Cyclic1248AbstractRowSystem
end Problem97
