"""Phase-1 cell descriptors for the P97 counterexample search lane.

Implements ``census/p97_search/PHASE1-SPEC.md`` section 4.  A cell is
``(k, n, profile | FRAMELESS)`` where ``profile`` is a multiset of three
closed cap sizes summing to ``n + 3`` (census-554 is exactly the cell
``(4, 11, (5, 5, 4))``, per the design doc's cap-profile frame).
FRAMELESS cells carry no profile constraint (used at k != 4 per design
doc section 5, since the three-cap frame is only proved complete under
the K4 hypothesis).

No cell is "run" in Phase 1 -- descriptors and ``profiles_for`` plus its
unit test are the only deliverables here.
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
