"""
dyadic.py -- outward-rounded dyadic interval arithmetic (TRUSTED CORE).

Per SPEC.md Sec 3.1. Python stdlib only (fractions, math). No floats,
no mpmath. Every arithmetic result is rounded so the lower endpoint
moves DOWN and the upper endpoint moves UP to the nearest multiple of
2**-P (P = precision in bits, default 128), guaranteeing every
DyadicInterval is a sound outer enclosure of the true exact-rational
value of the computation it represents.

This module must not import producer.py or system.py (SPEC.md
"Independence rule", Sec 3.4) -- it is pure, self-contained interval
arithmetic with no knowledge of the FR system.
"""
from __future__ import annotations

from fractions import Fraction
from math import floor, ceil
from typing import Union

Number = Union[int, Fraction]


def round_down(x: Fraction, P: int) -> Fraction:
    """Largest multiple of 2**-P that is <= x. Exact (Fraction*int and
    floor(Fraction) are both exact operations -- no float involved)."""
    scale = 1 << P
    n = floor(x * scale)
    return Fraction(n, scale)


def round_up(x: Fraction, P: int) -> Fraction:
    """Smallest multiple of 2**-P that is >= x. Exact."""
    scale = 1 << P
    n = ceil(x * scale)
    return Fraction(n, scale)


class DyadicInterval:
    """A closed interval [lo, hi] with lo, hi exact Fraction multiples
    of 2**-P, constructed so that for any exact rational value the
    interval is meant to enclose, lo <= value <= hi always holds
    (outward rounding on every operation)."""

    __slots__ = ("lo", "hi", "P")

    def __init__(self, lo, hi, P: int):
        lo = Fraction(lo)
        hi = Fraction(hi)
        if lo > hi:
            raise ValueError(f"invalid interval bounds: lo={lo} > hi={hi}")
        self.P = P
        # Rounding an already-P-aligned endpoint is idempotent, so it
        # is always safe (never incorrect) to round here even if the
        # caller already rounded -- this keeps every code path sound
        # without needing a separate "trust me, already rounded" path.
        self.lo = round_down(lo, P)
        self.hi = round_up(hi, P)

    @classmethod
    def point(cls, value, P: int) -> "DyadicInterval":
        v = Fraction(value)
        return cls(v, v, P)

    def _check_P(self, other: "DyadicInterval") -> None:
        if self.P != other.P:
            raise ValueError(f"precision mismatch: {self.P} vs {other.P}")

    def contains(self, value) -> bool:
        v = Fraction(value)
        return self.lo <= v <= self.hi

    def contains_zero(self) -> bool:
        return self.lo <= 0 <= self.hi

    def width(self) -> Fraction:
        return self.hi - self.lo

    def __add__(self, other) -> "DyadicInterval":
        o = _as_interval(other, self.P)
        self._check_P(o)
        return DyadicInterval(self.lo + o.lo, self.hi + o.hi, self.P)

    __radd__ = __add__

    def __sub__(self, other) -> "DyadicInterval":
        o = _as_interval(other, self.P)
        self._check_P(o)
        return DyadicInterval(self.lo - o.hi, self.hi - o.lo, self.P)

    def __rsub__(self, other) -> "DyadicInterval":
        o = _as_interval(other, self.P)
        return o.__sub__(self)

    def __neg__(self) -> "DyadicInterval":
        return DyadicInterval(-self.hi, -self.lo, self.P)

    def __mul__(self, other) -> "DyadicInterval":
        o = _as_interval(other, self.P)
        self._check_P(o)
        products = (self.lo * o.lo, self.lo * o.hi, self.hi * o.lo, self.hi * o.hi)
        return DyadicInterval(min(products), max(products), self.P)

    __rmul__ = __mul__

    def __repr__(self) -> str:
        return f"[{self.lo}, {self.hi}]@P{self.P}"

    def __eq__(self, other) -> bool:
        if not isinstance(other, DyadicInterval):
            return NotImplemented
        return self.P == other.P and self.lo == other.lo and self.hi == other.hi


def _as_interval(x, P: int) -> DyadicInterval:
    if isinstance(x, DyadicInterval):
        return x
    return DyadicInterval.point(Fraction(x), P)
