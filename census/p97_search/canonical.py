"""Exact canonicalization for Phase-1 census nodes.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 2.  ``canonical``
must be a relabeling invariant: for every permutation pi of labels,
``canonical(relabel(node, pi)) == canonical(node)``, and nodes in
distinct isomorphism classes must map to distinct canonical forms
("over-merging distinct classes is a completeness bug -- treated as a
soundness bug for the non-existence branch," per spec).

ALGORITHM (individualization-refinement, exhaustive branch-on-ties -- no
automorphism pruning, so the result is exact rather than heuristic):

1. Color each point initially by ``|S[p]|`` (a cheap relabeling-invariant
   split that typically shrinks the search).
2. Iteratively refine colors to a fixed point: a point's new color is a
   function of its own color plus the sorted multiset of colors of its
   out-neighbors (``S[p]``) and in-neighbors (points q with ``p in
   S[q]``) -- ``S`` is directed, so both directions are needed to see the
   full structure.  This is a Weisfeiler-Leman-style refinement; it is
   NOT claimed to be exact on its own (color refinement alone can fail to
   separate some non-isomorphic structures, e.g. certain regular graphs).
3. If the stable partition is discrete (every point its own color), the
   colors ARE an explicit bijective labeling; serialize the node under
   that labeling as a leaf certificate.
4. Otherwise, pick the smallest color value that still has more than one
   member (a selection rule computed purely from the current partition,
   hence itself relabeling-invariant) and branch: individualize each
   point in that cell in turn (give it a fresh distinguishing color),
   re-refine, and recurse.  Return the lexicographically smallest leaf
   certificate reached over ALL branches.

Because step 4 branches over every point in the tied cell rather than
selecting one, correctness does not depend on how good the refinement in
step 2 is -- in the degenerate case where refinement never splits
anything, this reduces to (a smarter search order for) trying every
permutation, which is exact by construction.  Refinement is purely a
branching-factor optimization.  Two independent gates check this
against a brute-force permutation oracle (G-CANON-1, G-CANON-2).
"""

from __future__ import annotations

from typing import Any, Sequence

from node import Node

__all__ = ["canonical"]


def _rerank(sigs: Sequence[Any]) -> tuple[int, ...]:
    """Map arbitrary comparable per-point signatures to compact 0..m-1
    integers, preserving sort order (equal signatures get equal ranks)."""

    uniq = sorted(set(sigs))
    rank = {sig: i for i, sig in enumerate(uniq)}
    return tuple(rank[sig] for sig in sigs)


def _refine(
    n: int, shells: tuple[frozenset[int], ...], colors: tuple[int, ...]
) -> tuple[int, ...]:
    current = colors
    while True:
        sigs = []
        for p in range(n):
            out_sig = tuple(sorted(current[q] for q in shells[p]))
            in_sig = tuple(sorted(current[q] for q in range(n) if p in shells[q]))
            sigs.append((current[p], out_sig, in_sig))
        new_current = _rerank(sigs)
        if new_current == current:
            return current
        current = new_current


def _is_discrete(colors: tuple[int, ...]) -> bool:
    return len(set(colors)) == len(colors)


def _leaf_certificate(
    n: int, shells: tuple[frozenset[int], ...], colors: tuple[int, ...]
) -> tuple[tuple[int, ...], ...]:
    """``colors`` is discrete: colors[p] is p's canonical position 0..n-1."""

    order: list[int] = [0] * n
    for p in range(n):
        order[colors[p]] = p
    cert = []
    for i in range(n):
        p = order[i]
        cert.append(tuple(sorted(colors[q] for q in shells[p])))
    return tuple(cert)


def _individualize(
    n: int, colors: tuple[int, ...], target_color: int, chosen: int
) -> tuple[int, ...]:
    """Split ``target_color``'s cell: ``chosen`` becomes its own color,
    sorting immediately before the rest of that cell."""

    keys = [
        (colors[p], 0 if p == chosen else 1)
        for p in range(n)
    ]
    return _rerank(keys)


def _search(
    n: int, shells: tuple[frozenset[int], ...], colors: tuple[int, ...]
) -> tuple[tuple[int, ...], ...]:
    colors = _refine(n, shells, colors)
    if _is_discrete(colors):
        return _leaf_certificate(n, shells, colors)
    counts: dict[int, int] = {}
    for c in colors:
        counts[c] = counts.get(c, 0) + 1
    target_color = min(c for c, count in counts.items() if count > 1)
    candidates = [p for p in range(n) if colors[p] == target_color]
    best: tuple[tuple[int, ...], ...] | None = None
    for p in candidates:
        child_colors = _individualize(n, colors, target_color, p)
        cert = _search(n, shells, child_colors)
        if best is None or cert < best:
            best = cert
    assert best is not None
    return best


def canonical(node: Node) -> tuple[Any, ...]:
    """Exact relabeling-invariant canonical form of ``node``.

    Returns ``(k, n, cert)`` where ``cert`` is a tuple of length n; entry
    ``i`` is the sorted tuple of canonical positions of the out-neighbors
    of the point placed at canonical position ``i``.
    """

    n = node.n
    if n == 0:
        return (node.k, 0, ())
    shells = node.shells
    initial = _rerank(tuple(len(shell) for shell in shells))
    cert = _search(n, shells, initial)
    return (node.k, n, cert)
