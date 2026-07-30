#!/usr/bin/env python3
"""Numerical sanity probe for the five residual two-circle cyclic words.

This is diagnostic only.  It samples the exact normalized two-circle family:

* A=(0,0), D=(1,0);
* B=(1/2,b), with C points on B's lower A-D circle arc;
* F=(1/2,-g), with E points on F's major D-A circle arc.

It then tests whether the requested labelled order is strictly convex.
"""

from itertools import combinations
from math import atan2, cos, hypot, pi, sin, sqrt
from random import Random


WORDS = ("CCFEE", "CFCEE", "ECCFE", "ECFCE", "EECCF")
RNG = Random(0x9796)


def area(p, q, r):
    return (q[0] - p[0]) * (r[1] - p[1]) - (
        q[1] - p[1]
    ) * (r[0] - p[0])


def strictly_clockwise(points, tolerance=1e-10):
    return all(
        area(points[i], points[j], points[k]) < -tolerance
        for i, j, k in combinations(range(len(points)), 3)
    )


def sample_instance(word):
    b = 10 ** RNG.uniform(-1.3, 0.8)
    g = 10 ** RNG.uniform(-1.3, 0.8)

    cxs = sorted(
        (RNG.uniform(0.001, 0.999), RNG.uniform(0.001, 0.999)),
        reverse=True,
    )
    rb = hypot(0.5, b)
    cs = [
        (x, b - sqrt(max(0.0, rb * rb - (x - 0.5) ** 2)))
        for x in cxs
    ]

    alpha = atan2(g, 0.5)
    ethetas = sorted(
        (
            RNG.uniform(-pi - alpha + 0.001, alpha - 0.001),
            RNG.uniform(-pi - alpha + 0.001, alpha - 0.001),
        ),
        reverse=True,
    )
    rf = hypot(0.5, g)
    es = [
        (0.5 + rf * cos(theta), -g + rf * sin(theta))
        for theta in ethetas
    ]

    next_index = {"C": 0, "E": 0}
    tail = []
    for role in word:
        if role == "F":
            tail.append((0.5, -g))
        else:
            family = cs if role == "C" else es
            tail.append(family[next_index[role]])
            next_index[role] += 1
    return [(0.0, 0.0), (0.5, b), (1.0, 0.0), *tail], (b, g, cs, es)


for residual_word in WORDS:
    witness = None
    for _ in range(250_000):
        points, parameters = sample_instance(residual_word)
        if strictly_clockwise(points):
            witness = parameters
            break
    print(residual_word, "NUMERIC_WITNESS" if witness else "NONE_SAMPLED", witness)
