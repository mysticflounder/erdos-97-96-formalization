"""Phase-1 census node model for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 1 exactly.  A node
is ``(n, k, S)``: labels ``0..n-1``, ``S : label -> frozenset[label]``
total, every point carries a class.  Definitional invariants (enforced at
construction; a rejection is not "pruning"):

  (D1) ``p not in S[p]`` for all p.
  (D2) ``|S[p]| >= k`` for all p.

Semantics: ``S[p]`` is a chosen witness class of ">= k points equidistant
from p" -- all of ``S[p]`` lies on one circle centered at p.  NO blocker
map in the Phase-1 node -- blocker-derived structure is Phase 2, pending a
separate admission audit (spec section 1).

A node is immutable and exposes a stable content digest (sha256 of a
normalized serialization).
"""

from __future__ import annotations

import hashlib
from dataclasses import dataclass
from types import MappingProxyType
from typing import Iterable, Mapping, Sequence

__all__ = ["NodeInvariantError", "Node"]


class NodeInvariantError(ValueError):
    """Raised when a proposed (n, k, S) triple violates (D1) or (D2).

    Per spec section 1: invariant violations are rejected at construction;
    this is a definitional rejection, never a "pruning" event (pruning is
    the rule engine's job -- see ``rules.py``).
    """


@dataclass(frozen=True)
class Node:
    """An immutable Phase-1 census node ``(n, k, S)``.

    ``shells`` is the primary representation: ``shells[p] == S[p]`` for
    label ``p`` in ``0..n-1``.  The dict-keyed view required by the spec
    ("S: label -> frozenset[label]") is available via the ``S`` property.
    """

    n: int
    k: int
    shells: tuple[frozenset[int], ...]

    def __post_init__(self) -> None:
        if self.n < 0:
            raise NodeInvariantError(f"n must be nonnegative, got {self.n}")
        if self.k < 0:
            raise NodeInvariantError(f"k must be nonnegative, got {self.k}")
        normalized = tuple(frozenset(shell) for shell in self.shells)
        if len(normalized) != self.n:
            raise NodeInvariantError(
                "S must be total over labels 0.."
                f"{self.n - 1}; got {len(normalized)} entries for n={self.n}"
            )
        for p, shell in enumerate(normalized):
            out_of_range = sorted(q for q in shell if not (0 <= q < self.n))
            if out_of_range:
                raise NodeInvariantError(
                    f"S[{p}] contains labels outside 0..{self.n - 1}: {out_of_range}"
                )
            if p in shell:  # (D1)
                raise NodeInvariantError(f"(D1) violated: {p} in S[{p}]")
            if len(shell) < self.k:  # (D2)
                raise NodeInvariantError(
                    f"(D2) violated: |S[{p}]| = {len(shell)} < k = {self.k}"
                )
        object.__setattr__(self, "shells", normalized)

    @classmethod
    def from_mapping(cls, n: int, k: int, S: Mapping[int, Iterable[int]]) -> "Node":
        """Construct from the spec's literal ``S: label -> frozenset[label]`` shape."""

        if set(S.keys()) != set(range(n)):
            raise NodeInvariantError(
                f"S must be total over labels 0..{n - 1}; got keys {sorted(S.keys())}"
            )
        return cls(n=n, k=k, shells=tuple(S[p] for p in range(n)))

    @property
    def S(self) -> Mapping[int, frozenset[int]]:
        """Read-only dict-keyed view of the shell assignment."""

        return MappingProxyType({p: shell for p, shell in enumerate(self.shells)})

    def shell(self, p: int) -> frozenset[int]:
        return self.shells[p]

    def _serialize(self) -> str:
        """Deterministic normalized serialization used for the content digest."""

        parts = [f"n={self.n}", f"k={self.k}"]
        for p, shell in enumerate(self.shells):
            parts.append(f"S[{p}]={sorted(shell)}")
        return "|".join(parts)

    def digest(self) -> str:
        """sha256 hex digest of the normalized serialization."""

        return hashlib.sha256(self._serialize().encode("utf-8")).hexdigest()


def relabel(node: Node, perm: Sequence[int]) -> Node:
    """Apply a label permutation to ``node`` and return the relabeled node.

    ``perm[p]`` is the new label assigned to the point currently labeled
    ``p`` (so ``perm`` is a bijection on ``range(node.n)``).  Used by the
    canonicalization gates (spec section 2, "canonical(pi . node)").
    """

    n = node.n
    if sorted(perm) != list(range(n)):
        raise NodeInvariantError(
            f"perm must be a permutation of 0..{n - 1}; got {list(perm)}"
        )
    new_shells: list[frozenset[int] | None] = [None] * n
    for p in range(n):
        new_shells[perm[p]] = frozenset(perm[q] for q in node.shells[p])
    return Node(n=n, k=node.k, shells=tuple(new_shells))  # type: ignore[arg-type]
