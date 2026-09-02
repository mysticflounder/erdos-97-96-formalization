/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.AbstractRowSystem

/-!
# Connectivity of abstract row systems

This module treats row membership as a directed edge. A support-minimal finite
row system is strongly connected: the vertices reachable from any fixed source
form a nonempty support-closed set.
-/

namespace Problem97
namespace AbstractRowSystem

variable {α : Type*}

/-- The directed support edge from a row center to one of its row members. -/
def SupportEdge [DecidableEq α] (S : AbstractRowSystem α) (c z : α) : Prop :=
  z ∈ S.row c

/-- Every ordered pair is connected by a possibly empty directed support path. -/
def SupportStronglyConnected [DecidableEq α]
    (S : AbstractRowSystem α) : Prop :=
  ∀ a b, Relation.ReflTransGen S.SupportEdge a b

/-- A finite support-minimal row system is strongly connected. -/
theorem supportStronglyConnected_of_supportMinimal
    [Fintype α] [DecidableEq α] (S : AbstractRowSystem α)
    (hminimal : S.SupportMinimal) : S.SupportStronglyConnected := by
  classical
  intro a b
  let reachable : Finset α :=
    Finset.univ.filter fun z => Relation.ReflTransGen S.SupportEdge a z
  have ha : a ∈ reachable := by
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_univ a, Relation.ReflTransGen.refl⟩
  have hclosed : S.SupportClosed reachable := by
    intro c hc z hz
    have hac : Relation.ReflTransGen S.SupportEdge a c :=
      (Finset.mem_filter.mp hc).2
    exact Finset.mem_filter.mpr
      ⟨Finset.mem_univ z, hac.tail hz⟩
  have huniv : reachable = Finset.univ :=
    hminimal ⟨a, ha⟩ hclosed
  have hb : b ∈ reachable := by
    rw [huniv]
    exact Finset.mem_univ b
  exact (Finset.mem_filter.mp hb).2

end AbstractRowSystem
end Problem97
