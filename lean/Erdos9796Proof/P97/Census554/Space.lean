import Erdos9796Proof.P97.Census554.MotifTransfer

/-!
# Census-554 finite candidate space (closure plan A.2 step 1)

Decidable Lean mirror of the (5,5,4) |A|=11 census candidate space
(`scratch/census-554/census554_lib.py`, whose header records the labeled
profile and the necessity-audited constraint port):

* labels: `U=0`, `V=1`, `W=2`; caps `S={1..5}`, `O1={0,2,6,7,8}`,
  `O2={0,1,9,10}`;
* `C1`: `|K_p| = 4`, `p ∉ K_p` at every center;
* one-hit at the opposite apices `V`, `W` only;
* `C2`: `|K_p ∩ K_q| ≤ 2` for `p ≠ q`;
* `C4`: each unordered point pair lies in at most 2 classes.

Encoding validation (solver policy): the per-center candidate-class counts
are kernel-`decide`d below against the Python ground truth
`[len(L.candidates(p)) for p in range(11)] = [210,43,16,210,…,210]`.

Necessity citations for each clause at the leaf (which existing Lean lemma
makes the clause sound to impose) are collected at plan step A.2.1
{{NEEDS_RESEARCH}}; this file only fixes the decidable mirror.
-/

namespace Problem97
namespace Census554

/-- Surplus apex `U` (Moser vertex opposite the designated surplus cap). -/
def apexU : Fin 11 := 0

/-- Opposite apex `V` (its opposite cap `O1` is the second 5-cap). -/
def apexV : Fin 11 := 1

/-- Opposite apex `W` (its opposite cap `O2` is the 4-cap). -/
def apexW : Fin 11 := 2

/-- Surplus cap `S = {1,2,3,4,5}` (contains `V`,`W`; interior `{3,4,5}`). -/
def capS : Finset (Fin 11) := {1, 2, 3, 4, 5}

/-- Second 5-cap `O1 = {0,2,6,7,8}` (contains `U`,`W`; interior `{6,7,8}`). -/
def capO1 : Finset (Fin 11) := {0, 2, 6, 7, 8}

/-- 4-cap `O2 = {0,1,9,10}` (contains `U`,`V`; interior `{9,10}`). -/
def capO2 : Finset (Fin 11) := {0, 1, 9, 10}

/-- One-hit predicate at the opposite apices, exact port of
`census554_lib.onehit_ok`: the class of `V` meets `S∖{V}` and `O2∖{V}` at
most once each; the class of `W` meets `S∖{W}` and `O1∖{W}` at most once
each.  Centers other than `V`,`W` are unconstrained (one-hit is proven only
at the opposite apices, per the census header). -/
def OnehitOk (p : Fin 11) (K : Finset (Fin 11)) : Prop :=
  (p = apexV →
    (K ∩ capS.erase apexV).card ≤ 1 ∧ (K ∩ capO2.erase apexV).card ≤ 1) ∧
  (p = apexW →
    (K ∩ capS.erase apexW).card ≤ 1 ∧ (K ∩ capO1.erase apexW).card ≤ 1)

instance (p : Fin 11) (K : Finset (Fin 11)) : Decidable (OnehitOk p K) := by
  unfold OnehitOk; infer_instance

/-- `C1` + one-hit candidate class at center `p`: a 4-element class avoiding
`p` and satisfying one-hit.  Mirrors `census554_lib.candidates`. -/
def IsCandidateClass (p : Fin 11) (K : Finset (Fin 11)) : Prop :=
  K.card = 4 ∧ p ∉ K ∧ OnehitOk p K

instance (p : Fin 11) (K : Finset (Fin 11)) :
    Decidable (IsCandidateClass p K) := by
  unfold IsCandidateClass; infer_instance

/-- The finite set of candidate classes at center `p`. -/
def candidateClasses (p : Fin 11) : Finset (Finset (Fin 11)) :=
  ((Finset.univ : Finset (Fin 11)).powersetCard 4).filter
    fun K => p ∉ K ∧ OnehitOk p K

theorem mem_candidateClasses {p : Fin 11} {K : Finset (Fin 11)} :
    K ∈ candidateClasses p ↔ IsCandidateClass p K := by
  simp only [candidateClasses, Finset.mem_filter, Finset.mem_powersetCard,
    IsCandidateClass]
  exact ⟨fun h => ⟨h.1.2, h.2.1, h.2.2⟩, fun h => ⟨⟨Finset.subset_univ _, h.1⟩, h.2.1, h.2.2⟩⟩

/-- A complete cube: one class per center.  Mirrors the census cube rows. -/
abbrev Cube := Fin 11 → Finset (Fin 11)

/-- Full constraint check for a cube, exact port of
`census554_lib.cube_ok`: `C1`+one-hit at every center, `C2`
(`|K_p ∩ K_q| ≤ 2` for `p ≠ q`), and `C4` (each unordered pair of points
lies in at most 2 classes). -/
def CubeOk (κ : Cube) : Prop :=
  (∀ p, IsCandidateClass p (κ p)) ∧
  (∀ p q, p ≠ q → (κ p ∩ κ q).card ≤ 2) ∧
  (∀ a b : Fin 11, a ≠ b →
    ((Finset.univ : Finset (Fin 11)).filter
      fun p => a ∈ κ p ∧ b ∈ κ p).card ≤ 2)

instance (κ : Cube) : Decidable (CubeOk κ) := by
  unfold CubeOk; infer_instance

-- Encoding smoke anchors, kernel-`decide`d against the Python ground truth
-- `[len(census554_lib.candidates(p)) for p in range(11)]`:
-- unconstrained center `U=0` (`C(10,4) = 210`), apex `V=1` (43), apex `W=2`
-- (16), generic interior center (210).
set_option maxRecDepth 100000 in
example : (candidateClasses 0).card = 210 := by decide

set_option maxRecDepth 100000 in
example : (candidateClasses 1).card = 43 := by decide

set_option maxRecDepth 100000 in
example : (candidateClasses 2).card = 16 := by decide

set_option maxRecDepth 100000 in
example : (candidateClasses 7).card = 210 := by decide

end Census554
end Problem97
