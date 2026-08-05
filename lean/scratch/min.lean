import Erdos9796Proof.P97.ATail.FrontierLiveClosure
structure Foo (α : Type*) where
  K : Finset α
  K2 : Finset α
  a : α
#check Foo.K2
example {α} (x : Foo α) : x.a ∉ x.K2 := by simp
