"""Phase-1/2 cell descriptors for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 4 and
``census/p97_search/PHASE2-SPEC.md`` section 1.  A cell is
``(k, n, profile | FRAMELESS, exact)`` where ``profile`` is a multiset of
three closed cap sizes summing to ``n + 3`` (census-554 is exactly the
cell ``(4, 11, (5, 5, 4))``, per the design doc's cap-profile frame).
FRAMELESS cells carry no profile constraint (used at k != 4 per design
doc section 5, since the three-cap frame is only proved complete under
the K4 hypothesis).

Phase-2 tightening (PHASE2-SPEC.md section 1): a profiled cell
(``profile is not None``) now additionally requires ``k == 4`` and
``n > 9`` -- the cap-profile frame
(``Problem97.MEC.nonempty_surplusCapPacket_of_K4``,
``lean/Erdos9796Proof/P97/CapBridgeFromK4.lean:98``) is proved only
under K4 with ``9 < A.card``.  A k=4, n=9 run must use a FRAMELESS cell.

``exact`` (Phase-2, PHASE2-SPEC.md section 1): in an exact cell every
node admitted must satisfy ``|S[p]| == k`` for all p -- checked by the
iterator at admission, NOT by changing the Node D1/D2 invariants (those
stay "at least k" per PHASE1-SPEC.md section 1).  Completeness note:
exact-k census is WLOG-complete for existence questions -- any
equidistant class of size >= k contains one of size exactly k, and
every ADMITTED rule in this bank is monotone under shrinking shells
(R-CIRC2: intersections only shrink; R-FIBER4: stated relative to the
chosen S).  Exactness is a reduction, not a hypothesis; it is recorded
in the iterator manifest as ``exact: true``, never as a hypothesis tag.

No cell is "run" in Phase 1 -- descriptors and ``profiles_for`` plus its
unit test are the only Phase-1 deliverables here.  Phase 2 adds the
production iterator (``iterate.py``) that actually runs cells.
"""

from __future__ import annotations

from dataclasses import dataclass

__all__ = ["CellError", "FRAMELESS", "Cell", "profiles_for"]


class CellError(ValueError):
    """Raised for malformed cell descriptors."""


# Sentinel: no profile constraint applies at this cell (k != 4).
FRAMELESS = None


@dataclass(frozen=True)
class Cell:
    k: int
    n: int
    profile: tuple[int, int, int] | None  # sorted ascending, or FRAMELESS
    exact: bool = False

    def __post_init__(self) -> None:
        if self.k < 0:
            raise CellError(f"k must be nonnegative, got {self.k}")
        if self.n < 0:
            raise CellError(f"n must be nonnegative, got {self.n}")
        if self.profile is None:
            return
        if len(self.profile) != 3:
            raise CellError(f"profile must be a triple of cap sizes, got {self.profile}")
        if tuple(sorted(self.profile)) != tuple(self.profile):
            raise CellError(f"profile must be stored sorted ascending, got {self.profile}")
        if any(size < 1 for size in self.profile):
            raise CellError(f"profile cap sizes must be positive, got {self.profile}")
        if sum(self.profile) != self.n + 3:
            raise CellError(
                f"profile {self.profile} must sum to n + 3 = {self.n + 3}"
            )
        # Phase-2 tightening (PHASE2-SPEC.md section 1): the cap-profile
        # frame (Problem97.MEC.nonempty_surplusCapPacket_of_K4) is proved
        # only under k=4, n>9 -- a profiled cell outside that range would
        # publish a claim with no frame theorem behind it.
        if self.k != 4:
            raise CellError(
                f"profiled cells require k == 4 (the cap-profile frame is "
                f"K4-specific), got k={self.k}"
            )
        if self.n <= 9:
            raise CellError(
                f"profiled cells require n > 9 (the frame theorem's "
                f"9 < A.card hypothesis), got n={self.n}"
            )

    @property
    def frame_hypotheses(self) -> "frozenset[str]":
        """Hypotheses of the cap-profile frame theorem itself.

        PHASE2-SPEC.md section 1: these attach to every claim about a
        profiled cell, whether or not any rule fires -- restricting
        enumeration to profile cells USES the frame
        (``Problem97.MEC.nonempty_surplusCapPacket_of_K4``).  FRAMELESS
        cells use no frame, hence the empty set.
        """

        if self.profile is None:
            return frozenset()
        return frozenset({"k=4", "convex", "n>9"})


def profiles_for(n: int, min_cap: int) -> tuple[tuple[int, int, int], ...]:
    """Enumerate unordered closed-cap-size triples summing to ``n + 3``
    with every part >= ``min_cap``.

    Each triple is returned sorted ascending; the overall result is
    sorted and deduplicated.  Spec section 4 example: ``profiles_for(11,
    4)`` must include ``(5, 5, 4)`` (as the sorted triple ``(4, 5, 5)``)
    -- the census-554 cell.
    """

    if n < 0:
        raise CellError(f"n must be nonnegative, got {n}")
    if min_cap < 1:
        raise CellError(f"min_cap must be positive, got {min_cap}")
    total = n + 3
    results: set[tuple[int, int, int]] = set()
    for a in range(min_cap, total + 1):
        if 3 * a > total:
            break
        for b in range(a, total + 1):
            c = total - a - b
            if c < b:
                break
            if c < min_cap:
                continue
            results.add((a, b, c))
    return tuple(sorted(results))
