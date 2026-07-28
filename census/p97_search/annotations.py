"""Phase-2 node annotations for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE2-SPEC.md`` section 2 exactly:
``BlockerAnnotation`` (section 2.1), ``CapAnnotation`` (section 2.2), and
``AnnotatedNode`` (section 2.3).

Both annotation kinds enforce their definitional invariant AT
CONSTRUCTION (rejection, not pruning -- same discipline as ``node.py``'s
(D1)/(D2)).
"""

from __future__ import annotations

import hashlib
from dataclasses import dataclass
from types import MappingProxyType
from typing import Mapping

from node import Node

__all__ = [
    "AnnotationError",
    "BlockerAnnotation",
    "CapAnnotation",
    "AnnotatedNode",
]


class AnnotationError(ValueError):
    """Raised when a proposed annotation violates its definitional
    invariant at construction: (B1) for ``BlockerAnnotation``, the
    ``(M, f)`` shape constraints for ``CapAnnotation``.  Mirrors
    ``NodeInvariantError`` -- a rejection, never "pruning" (spec section
    2)."""


@dataclass(frozen=True)
class BlockerAnnotation:
    """A total map ``c: labels -> labels`` over a node ``(n, k, S)``.

    Definitional invariant, enforced at construction (spec section 2.1):

      (B1) ``x in S[c(x)]`` for every label x.

    ``c(x) != x`` is NOT stored -- it is derivable from (B1) + (D1):
    ``x in S[c(x)]`` while ``c(x) not in S[c(x)]`` by (D1), so
    ``c(x) == x`` would force ``x in S[x]``, contradicting (D1).

    Semantics note (spec section 2.1): ``c(x)`` is a chosen center whose
    witness shell contains x.  The geometric "blocker" interpretation and
    the EXISTENCE of such a total map for real configurations are NOT
    established here -- see PHASE2-SPEC.md section 4.1's cell-mode
    caveat: a cell run in blocker-annotated mode publishes claims
    conditional on annotation existence, and that existence lemma is
    {{NEEDS_PROOF}}.
    """

    node: Node
    c: tuple[int, ...]  # c[x] is the chosen center label for label x

    def __post_init__(self) -> None:
        n = self.node.n
        c = tuple(self.c)
        object.__setattr__(self, "c", c)
        if len(c) != n:
            raise AnnotationError(
                f"c must be total over labels 0..{n - 1}; got {len(c)} entries"
            )
        for x, cx in enumerate(c):
            if not (0 <= cx < n):
                raise AnnotationError(f"c[{x}] = {cx} out of range 0..{n - 1}")
            if x not in self.node.shell(cx):  # (B1)
                raise AnnotationError(
                    f"(B1) violated: label {x} not in S[c({x})] = S[{cx}] = "
                    f"{sorted(self.node.shell(cx))}"
                )

    @classmethod
    def from_mapping(cls, node: Node, c: Mapping[int, int]) -> "BlockerAnnotation":
        if set(c.keys()) != set(range(node.n)):
            raise AnnotationError(
                f"c must be total over labels 0..{node.n - 1}; got keys "
                f"{sorted(c.keys())}"
            )
        return cls(node=node, c=tuple(c[x] for x in range(node.n)))

    def fibers(self) -> dict[int, frozenset[int]]:
        """``fiber(d) = {x : c(x) = d}`` for every label d (empty fibers
        included, per spec section 2.1)."""

        result: dict[int, set[int]] = {d: set() for d in range(self.node.n)}
        for x, cx in enumerate(self.c):
            result[cx].add(x)
        return {d: frozenset(members) for d, members in result.items()}

    def digest_part(self) -> str:
        """Deterministic fragment used by ``AnnotatedNode.digest``."""

        return "c=" + ",".join(str(v) for v in self.c)


@dataclass(frozen=True)
class CapAnnotation:
    """``(M, f)`` over a node ``(n, k, S)`` (spec section 2.2):

      - ``M``: a frozenset of exactly 3 labels (Moser vertices).
      - ``f``: a total map ``(labels \\ M) -> {0, 1, 2}``.

    Closed caps are DERIVED, matching the closed-cap convention of
    ``lean/Erdos9796Proof/P97/Cap/Structure.lean`` (``CapTriple``, lines
    143-204): cap i excludes exactly the i-th Moser vertex and contains
    the other two.  Concretely, fix ``m0 < m1 < m2`` the sorted elements
    of M; ``closed_cap(i) = f^-1(i) union (M \\ {m_i})``.  By
    construction the closed sizes sum to ``(n - 3) + 6 = n + 3`` --
    matching ``Problem97.cap_sum_identity``
    (``lean/Erdos9796Proof/P97/Cap/Partition.lean:86``); this is
    asserted in gate G-CAP-ANN, not at runtime (spec section 2.2).
    """

    node: Node
    M: frozenset[int]
    f: Mapping[int, int]

    def __post_init__(self) -> None:
        n = self.node.n
        M = frozenset(self.M)
        object.__setattr__(self, "M", M)
        if len(M) != 3:
            raise AnnotationError(f"M must have exactly 3 labels, got {sorted(M)}")
        for m in M:
            if not (0 <= m < n):
                raise AnnotationError(f"Moser vertex {m} out of range 0..{n - 1}")
        non_moser = frozenset(range(n)) - M
        f_map = dict(self.f)
        if frozenset(f_map.keys()) != non_moser:
            raise AnnotationError(
                f"f must be total over labels \\ M = {sorted(non_moser)}; got "
                f"keys {sorted(f_map.keys())}"
            )
        for x, val in f_map.items():
            if val not in (0, 1, 2):
                raise AnnotationError(f"f[{x}] = {val} not in {{0, 1, 2}}")
        object.__setattr__(self, "f", MappingProxyType(f_map))

    def sorted_moser(self) -> tuple[int, int, int]:
        m0, m1, m2 = sorted(self.M)
        return (m0, m1, m2)

    def closed_cap(self, i: int) -> frozenset[int]:
        """cap ``i`` (0, 1, or 2): excludes ``m_i``, contains the other two
        Moser vertices plus every non-Moser label ``x`` with ``f(x) == i``."""

        if i not in (0, 1, 2):
            raise AnnotationError(f"cap index must be 0, 1, or 2, got {i}")
        moser = self.sorted_moser()
        others = frozenset(moser) - {moser[i]}
        f_members = frozenset(x for x, val in self.f.items() if val == i)
        return f_members | others

    def closed_profile(self) -> tuple[int, int, int]:
        """Sorted-ascending closed cap sizes (spec section 2.2)."""

        sizes = tuple(len(self.closed_cap(i)) for i in range(3))
        return tuple(sorted(sizes))

    def digest_part(self) -> str:
        moser = self.sorted_moser()
        f_items = ",".join(f"{x}:{self.f[x]}" for x in sorted(self.f))
        return f"M={moser}|f={f_items}"


@dataclass(frozen=True)
class AnnotatedNode:
    """``(node, blocker | None, caps | None)`` (spec section 2.3):
    immutable, either annotation optional, content digest extending the
    node digest."""

    node: Node
    blocker: BlockerAnnotation | None = None
    caps: CapAnnotation | None = None

    def __post_init__(self) -> None:
        if self.blocker is not None and self.blocker.node.digest() != self.node.digest():
            raise AnnotationError(
                "AnnotatedNode: blocker annotation was built over a different node"
            )
        if self.caps is not None and self.caps.node.digest() != self.node.digest():
            raise AnnotationError(
                "AnnotatedNode: cap annotation was built over a different node"
            )

    def digest(self) -> str:
        """sha256 hex digest extending the underlying node's digest with
        the annotation content (spec section 2.3)."""

        parts = [self.node.digest()]
        parts.append(
            "blocker=" + (self.blocker.digest_part() if self.blocker is not None else "None")
        )
        parts.append(
            "caps=" + (self.caps.digest_part() if self.caps is not None else "None")
        )
        return hashlib.sha256("|".join(parts).encode("utf-8")).hexdigest()
