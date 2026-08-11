import Erdos9796Proof.P97.RemovableVertexAxiom.RemovableVertexOfLarge

/-!
# Removable-vertex existence for `|A| > 9`

This module is a thin coordinator. The proof is sharded under
`Erdos9796Proof.P97.RemovableVertexAxiom.*` so producer-side development can
build the base and continuation shards without importing the generated
row-zero certificate bank; only the `RemovableVertexOfLarge` composition
shard imports the bank.
-/
