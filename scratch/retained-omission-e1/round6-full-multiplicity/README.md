# Round 6 full-multiplicity target probe

This is an external, exact-`n = 15` relaxation for
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`.
It imports the frozen schema-v3 encoder and changes one semantic point:
every chosen non-apex K4 radius is represented by its full equality class,
with cardinality at least four, rather than by an arbitrary four-subset.

The constraint is sound for a P97 counterexample.  Results remain external Z3
evidence and do not close the universal Lean theorem.  Each run records hashes
of this wrapper, the frozen base encoder, its schema, the lock file, and every
emitted SMT encoding.
