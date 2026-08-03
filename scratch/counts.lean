import Mathlib
lemma no_counts (x y p q u v s w z t m n : Nat)
    (hx : x + y + p + q = 2)
    (hu : u + v + s = 2)
    (hw : w + z + t = 2)
    (hp : p ≤ 1) (hq : q ≤ 1) (hs : s ≤ 1) (ht : t ≤ 1)
    (hm : m ≤ q) (hm' : m ≤ s) (hm'' : q + s ≤ 1 + m)
    (hn : n ≤ p) (hn' : n ≤ t) (hn'' : p + t ≤ 1 + n)
    (h1 : x + u + m ≤ 1)
    (h2 : y + w + n ≤ 1)
    (h3 : v + z ≤ 1) : False := by
  omega
