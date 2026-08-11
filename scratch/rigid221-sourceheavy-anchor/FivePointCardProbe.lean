import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceSafeIngress

example {α : Type} [DecidableEq α] (a b c d e : α)
    (hab : a ≠ b) (hac : a ≠ c) (had : a ≠ d) (hae : a ≠ e)
    (hbc : b ≠ c) (hbd : b ≠ d) (hbe : b ≠ e)
    (hcd : c ≠ d) (hce : c ≠ e) (hde : d ≠ e) :
    ({a, b, c, d, e} : Finset α).card = 5 := by
  simp [hab, hac, had, hae, hbc, hbd, hbe, hcd, hce, hde,
    Ne.symm hab, Ne.symm hac, Ne.symm had, Ne.symm hae,
    Ne.symm hbc, Ne.symm hbd, Ne.symm hbe,
    Ne.symm hcd, Ne.symm hce, Ne.symm hde]
