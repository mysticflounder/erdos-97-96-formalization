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

from itertools import permutations as _permutations
from typing import Any, Sequence

from node import Node

__all__ = ["canonical", "canonical_perms", "canonical_annotated"]


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


# ---------------------------------------------------------------------------
# Phase-2 additions (PHASE2-SPEC.md section 3).  ``canonical()`` above is
# untouched -- byte-for-byte compatible, per spec.  ``canonical_perms``
# reuses the exact same ``_refine`` / ``_individualize`` / ``_leaf_certificate``
# helpers via a parallel recursion (``_search_all``) that collects every
# leaf coloring reaching the running-minimum certificate, instead of only
# the certificate itself (``_search`` above keeps only the certificate).
# ---------------------------------------------------------------------------


def _search_all(
    n: int, shells: tuple[frozenset[int], ...], colors: tuple[int, ...]
) -> tuple[tuple[tuple[int, ...], ...], list[tuple[int, ...]]]:
    """Same recursion as ``_search``, but returns ``(best_cert,
    best_labelings)`` where ``best_labelings`` is every discrete leaf
    coloring reaching ``best_cert`` (reset whenever a strictly smaller
    certificate is found), per spec section 3."""

    colors = _refine(n, shells, colors)
    if _is_discrete(colors):
        return _leaf_certificate(n, shells, colors), [colors]
    counts: dict[int, int] = {}
    for c in colors:
        counts[c] = counts.get(c, 0) + 1
    target_color = min(c for c, count in counts.items() if count > 1)
    candidates = [p for p in range(n) if colors[p] == target_color]
    best_cert: tuple[tuple[int, ...], ...] | None = None
    best_labelings: list[tuple[int, ...]] = []
    for p in candidates:
        child_colors = _individualize(n, colors, target_color, p)
        cert, labelings = _search_all(n, shells, child_colors)
        if best_cert is None or cert < best_cert:
            best_cert = cert
            best_labelings = list(labelings)
        elif cert == best_cert:
            best_labelings.extend(labelings)
    assert best_cert is not None
    return best_cert, best_labelings


def canonical_perms(node: Node) -> tuple[tuple[int, ...], ...]:
    """ALL discrete leaf colorings of the ``_search`` tree whose
    certificate equals the minimal certificate (spec section 3).  Each
    returned labeling maps ``label -> canonical position`` (the same
    convention as ``node.relabel``'s ``perm`` argument), so
    ``canonical_perms(node)[i]`` is directly usable with
    ``node.relabel``.  Deduplicated and sorted for determinism.

    Performance caveat (spec section 3): can be large for highly
    symmetric nodes; acceptable at Phase-2 (control/seed) scale.  No
    automorphism pruning is added here.
    """

    n = node.n
    if n == 0:
        return ((),)
    shells = node.shells
    initial = _rerank(tuple(len(shell) for shell in shells))
    _best_cert, labelings = _search_all(n, shells, initial)
    return tuple(sorted(set(labelings)))


_S3: tuple[tuple[int, int, int], ...] = tuple(_permutations(range(3)))  # type: ignore[assignment]


def canonical_annotated(anode: Any) -> tuple[Any, ...]:
    """Relabeling-invariant canonical form of an ``AnnotatedNode`` (spec
    section 3):

      - Node part: ``canonical(anode.node)`` as today.
      - Blocker part (if present): ``min`` over sigma in
        ``canonical_perms`` of the tuple
        ``(sigma(c(sigma^-1(0))), ..., sigma(c(sigma^-1(n-1))))``.
      - Cap part (if present): ``min`` over sigma in ``canonical_perms``
        AND tau in S3 (cap-index permutations) of the tuple over
        canonical positions i of ``("M", tau(j))`` if
        ``sigma^-1(i)`` is the Moser vertex ``m_j``, else
        ``("f", tau(f(sigma^-1(i))))``.

    ``anode`` is duck-typed (``node``, ``blocker``, ``caps`` attributes)
    to avoid a hard import-time dependency from ``canonical.py`` on
    ``annotations.py``.
    """

    node = anode.node
    node_part = canonical(node)
    n = node.n
    perms = canonical_perms(node)

    if anode.blocker is not None:
        c = anode.blocker.c
        best_blocker: tuple[int, ...] | None = None
        for sigma in perms:
            order = [0] * n
            for p in range(n):
                order[sigma[p]] = p
            transported = tuple(sigma[c[order[i]]] for i in range(n))
            if best_blocker is None or transported < best_blocker:
                best_blocker = transported
        blocker_part: tuple[str, Any] = ("blocker", best_blocker)
    else:
        blocker_part = ("blocker", None)

    if anode.caps is not None:
        moser = anode.caps.sorted_moser()
        m_index = {m: j for j, m in enumerate(moser)}
        f = anode.caps.f
        best_caps: tuple[tuple[str, int], ...] | None = None
        for sigma in perms:
            order = [0] * n
            for p in range(n):
                order[sigma[p]] = p
            for tau in _S3:
                entry = []
                for i in range(n):
                    p = order[i]
                    if p in m_index:
                        entry.append(("M", tau[m_index[p]]))
                    else:
                        entry.append(("f", tau[f[p]]))
                entry_t = tuple(entry)
                if best_caps is None or entry_t < best_caps:
                    best_caps = entry_t
        caps_part: tuple[str, Any] = ("caps", best_caps)
    else:
        caps_part = ("caps", None)

    return (node_part, blocker_part, caps_part)
