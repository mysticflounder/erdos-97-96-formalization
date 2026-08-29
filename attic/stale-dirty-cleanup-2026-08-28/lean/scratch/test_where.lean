axiom P : Nat → Prop

 theorem t (n:Nat) : P n := by
  exact u n
where
  theorem u (m:Nat) : P m := by
    admit
