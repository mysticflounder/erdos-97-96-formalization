#!/usr/bin/env python3
"""Independent exact replay for the exact-six integrated CEGAR artifacts.

This verifier deliberately does not import ``exact_cegar.py``,
``integrated_milp.py``, or the structural encoder.  It checks the local
mathematical implication represented by every metric cut, and it separately
replays the pure-membership seed duals from their decoded sparse rows.

It does *not* certify the structural encoder's correspondence with the Lean
parent surface.  A terminal publication verifier must additionally rebuild
the terminal CNF, compare it byte-for-byte with the solved CNF, and replay the
DRAT proof.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import defaultdict
from fractions import Fraction
from pathlib import Path
from typing import Iterable


KAL_RE = re.compile(r"kal([12])_(\d+)_(\d+)_(\d+)_(\d+)\Z")
ROW_RE = re.compile(r"row_(\d+)_(\d+)_(\d+)\Z")
SHELL_RE = re.compile(r"shell_(\d+)_(\d+)_(\d+)\Z")
NONNEG_RE = re.compile(r"nonneg_(\d+)_(\d+)\Z")
POSITIVE_RE = re.compile(r"positive_(\d+)_(\d+)\Z")
MEMBER_RE = re.compile(r"member_(\d+)_(\d+)\Z")
DIST_RE = re.compile(r"d_(\d+)_(\d+)\Z")


def require_int(value: object, context: str) -> int:
    if type(value) is not int:
        raise ValueError(f"{context}: expected integer, got {value!r}")
    return value


def require_vertex(value: int, n: int, context: str) -> int:
    if not 0 <= value < n:
        raise ValueError(f"{context}: vertex {value} is outside [0,{n})")
    return value


def edge(left: int, right: int) -> tuple[int, int]:
    if left == right:
        raise ValueError(f"distance loop d({left},{right})")
    return (left, right) if left < right else (right, left)


def add_scaled(
    target: dict[object, Fraction],
    source: dict[object, int | Fraction],
    scale: int | Fraction,
) -> None:
    factor = Fraction(scale)
    for variable, coefficient in source.items():
        target[variable] += factor * Fraction(coefficient)


def independent_cut_constraint(
    name: str, n: int, apex: int
) -> tuple[str, dict[tuple[int, int], int], set[tuple[int, int]], set[int]]:
    match = KAL_RE.fullmatch(name)
    if match:
        which = int(match.group(1))
        a, b, c, d = (require_vertex(int(raw), n, name) for raw in match.groups()[1:])
        if not a < b < c < d:
            raise ValueError(f"{name}: Kalmanson vertices are not in cyclic cut order")
        result: dict[tuple[int, int], int] = defaultdict(int)
        result[edge(a, c)] += 1
        result[edge(b, d)] += 1
        if which == 1:
            result[edge(a, b)] -= 1
            result[edge(c, d)] -= 1
        else:
            result[edge(a, d)] -= 1
            result[edge(b, c)] -= 1
        return "strict", dict(result), set(), set()

    match = ROW_RE.fullmatch(name)
    if match:
        center, reference, point = (
            require_vertex(int(raw), n, name) for raw in match.groups()
        )
        if len({center, reference, point}) != 3:
            raise ValueError(f"{name}: row equality requires three distinct vertices")
        return (
            "equality",
            {edge(center, point): 1, edge(center, reference): -1},
            {(center, reference), (center, point)},
            set(),
        )

    match = SHELL_RE.fullmatch(name)
    if match:
        center, reference, point = (
            require_vertex(int(raw), n, name) for raw in match.groups()
        )
        if center != apex:
            raise ValueError(f"{name}: shell center is not the fixed second apex {apex}")
        if len({center, reference, point}) != 3:
            raise ValueError(f"{name}: shell equality requires three distinct vertices")
        return (
            "equality",
            {edge(center, point): 1, edge(center, reference): -1},
            set(),
            {reference, point},
        )

    match = NONNEG_RE.fullmatch(name)
    if match:
        left, right = (require_vertex(int(raw), n, name) for raw in match.groups())
        if not left < right:
            raise ValueError(f"{name}: nonnegative-distance edge is not canonical")
        return "nonnegative", {edge(left, right): 1}, set(), set()

    match = POSITIVE_RE.fullmatch(name)
    if match:
        left, right = (require_vertex(int(raw), n, name) for raw in match.groups())
        if not left < right:
            raise ValueError(f"{name}: positive-distance edge is not canonical")
        return "positive", {edge(left, right): 1}, set(), set()

    raise ValueError(f"unknown cut constraint {name!r}")


def verify_cut(cut: object, n: int, apex: int, context: str) -> dict[str, object]:
    if not isinstance(cut, dict):
        raise ValueError(f"{context}: cut is not an object")
    if cut.get("schema") != "p97-exact6-integrated-exact-kalmanson-cut-v1":
        raise ValueError(f"{context}: unexpected cut schema")
    if cut.get("exact_vector_cancellation") is not True:
        raise ValueError(f"{context}: exact cancellation flag is not true")

    constraints = cut.get("constraints")
    if not isinstance(constraints, list) or not constraints:
        raise ValueError(f"{context}: constraints must be a nonempty list")
    total: dict[object, Fraction] = defaultdict(Fraction)
    strict_weight = 0
    positive_weight = 0
    memberships: set[tuple[int, int]] = set()
    shell_endpoints: set[int] = set()
    seen_names: set[str] = set()
    for index, item in enumerate(constraints):
        if not isinstance(item, dict):
            raise ValueError(f"{context}: constraint {index} is not an object")
        name = item.get("name")
        if not isinstance(name, str):
            raise ValueError(f"{context}: constraint {index} has no string name")
        if name in seen_names:
            raise ValueError(f"{context}: duplicate constraint name {name}")
        seen_names.add(name)
        multiplier = require_int(item.get("multiplier"), f"{context}:{name}:multiplier")
        if multiplier == 0:
            raise ValueError(f"{context}:{name}: zero multiplier")
        kind, coefficients, row_memberships, used_shell = independent_cut_constraint(
            name, n, apex
        )
        if kind == "strict":
            if multiplier <= 0:
                raise ValueError(f"{context}:{name}: strict multiplier is not positive")
            strict_weight += multiplier
        elif kind in {"nonnegative", "positive"}:
            if multiplier < 0:
                raise ValueError(f"{context}:{name}: distance lower-bound multiplier is negative")
            if kind == "positive":
                positive_weight += multiplier
        add_scaled(total, coefficients, multiplier)
        memberships.update(row_memberships)
        shell_endpoints.update(used_shell)

    residual = {str(key): str(value) for key, value in total.items() if value}
    if residual:
        raise ValueError(f"{context}: nonzero exact vector residual {residual}")
    if strict_weight <= 0:
        raise ValueError(f"{context}: no positive strict inequality weight")
    if require_int(cut.get("strict_weight_sum"), f"{context}:strict_weight_sum") != strict_weight:
        raise ValueError(f"{context}: strict-weight sum mismatch")

    raw_memberships = cut.get("required_memberships")
    if not isinstance(raw_memberships, list):
        raise ValueError(f"{context}: required_memberships is not a list")
    parsed_memberships: list[tuple[int, int]] = []
    for index, pair in enumerate(raw_memberships):
        if not isinstance(pair, list) or len(pair) != 2:
            raise ValueError(f"{context}: malformed membership {index}")
        center = require_vertex(require_int(pair[0], context), n, context)
        point = require_vertex(require_int(pair[1], context), n, context)
        if center == point:
            raise ValueError(f"{context}: self-membership in antecedent")
        parsed_memberships.append((center, point))
    if parsed_memberships != sorted(set(parsed_memberships)):
        raise ValueError(f"{context}: memberships are not canonical and duplicate-free")
    if set(parsed_memberships) != memberships:
        raise ValueError(f"{context}: row equality antecedent does not match memberships")

    raw_shell = cut.get("conditioned_shell")
    if shell_endpoints:
        if not isinstance(raw_shell, list) or len(raw_shell) != 5:
            raise ValueError(f"{context}: shell equality lacks an exact-five condition")
        shell = [
            require_vertex(require_int(value, context), n, context) for value in raw_shell
        ]
        if shell != sorted(set(shell)) or apex in shell:
            raise ValueError(f"{context}: conditioned shell is not a canonical apex-free five-set")
        if not shell_endpoints <= set(shell):
            raise ValueError(f"{context}: used shell equality is not implied by conditioned shell")
    elif raw_shell is not None:
        raise ValueError(f"{context}: unused shell condition would not match producer policy")

    core_size = require_int(cut.get("initial_unsat_core_size"), f"{context}:core_size")
    if core_size < len(constraints):
        raise ValueError(f"{context}: filtered constraint support exceeds initial core")
    return {
        "id": cut.get("id"),
        "constraint_count": len(constraints),
        "membership_count": len(parsed_memberships),
        "shell_conditioned": bool(shell_endpoints),
        "positive_constraint_count": sum(
            item["name"].startswith("positive_") for item in constraints
        ),
        "positive_weight_sum": positive_weight,
        "total_positive_rhs_weight": strict_weight + positive_weight,
    }


def parse_sparse_terms(raw_terms: object, n: int, context: str) -> dict[str, int]:
    if not isinstance(raw_terms, list) or not raw_terms:
        raise ValueError(f"{context}: sparse terms are empty or malformed")
    result: dict[str, int] = {}
    for item in raw_terms:
        if not isinstance(item, list) or len(item) != 2 or not isinstance(item[0], str):
            raise ValueError(f"{context}: malformed sparse term {item!r}")
        name = item[0]
        coefficient = require_int(item[1], f"{context}:{name}")
        if coefficient == 0 or name in result:
            raise ValueError(f"{context}: zero or duplicate sparse term {name}")
        member = MEMBER_RE.fullmatch(name)
        distance = DIST_RE.fullmatch(name)
        if member:
            center, point = (require_vertex(int(raw), n, name) for raw in member.groups())
            if center == point:
                raise ValueError(f"{context}: self-membership term")
        elif distance:
            left, right = (require_vertex(int(raw), n, name) for raw in distance.groups())
            if not left < right:
                raise ValueError(f"{context}: noncanonical distance term {name}")
        elif name != "epsilon":
            raise ValueError(f"{context}: unknown sparse variable {name}")
        result[name] = coefficient
    return result


def distance_name(left: int, right: int) -> str:
    a, b = edge(left, right)
    return f"d_{a}_{b}"


def is_guarded_row_upper(terms: dict[str, int], rhs: int, n: int) -> bool:
    if rhs != 2 or "epsilon" in terms:
        return False
    members = []
    distances = []
    for name, coefficient in terms.items():
        match = MEMBER_RE.fullmatch(name)
        if match:
            if coefficient != 1:
                return False
            members.append(tuple(map(int, match.groups())))
            continue
        match = DIST_RE.fullmatch(name)
        if match:
            distances.append((name, coefficient))
            continue
        return False
    if len(members) != 2 or len(distances) != 2:
        return False
    (center_a, point_a), (center_b, point_b) = members
    if center_a != center_b or point_a == point_b:
        return False
    expected_names = {
        distance_name(center_a, point_a),
        distance_name(center_a, point_b),
    }
    return (
        {name for name, _ in distances} == expected_names
        and {coefficient for _, coefficient in distances} == {-1, 1}
        and sum(coefficient for _, coefficient in distances) == 0
    )


def negated_kalmanson_rows(n: int) -> set[tuple[tuple[str, int], ...]]:
    rows: set[tuple[tuple[str, int], ...]] = set()
    for a in range(n):
        for b in range(a + 1, n):
            for c in range(b + 1, n):
                for d in range(c + 1, n):
                    common = {
                        distance_name(a, c): -1,
                        distance_name(b, d): -1,
                        "epsilon": 1,
                    }
                    first = dict(common)
                    first[distance_name(a, b)] = 1
                    first[distance_name(c, d)] = 1
                    second = dict(common)
                    second[distance_name(a, d)] = 1
                    second[distance_name(b, c)] = 1
                    rows.add(tuple(sorted(first.items())))
                    rows.add(tuple(sorted(second.items())))
    return rows


def verify_seed(seed: object, n: int, context: str) -> dict[str, object]:
    if not isinstance(seed, dict):
        raise ValueError(f"{context}: seed is not an object")
    if seed.get("schema") != "p97-exact6-integrated-fixed-leaf-dual-probe-v1":
        raise ValueError(f"{context}: unexpected seed schema")
    if seed.get("metric_profile") != "kalmanson-only":
        raise ValueError(f"{context}: seed is not a Kalmanson-only certificate")

    certificate = seed.get("certificate")
    decoded = seed.get("decoded_dual_support")
    if not isinstance(certificate, dict) or not isinstance(decoded, dict):
        raise ValueError(f"{context}: missing certificate or decoded support")
    if certificate.get("equality_marginals") != [] or certificate.get("upper_bound_marginals") != []:
        raise ValueError(f"{context}: seed is not a pure lower-bound antecedent dual")

    raw_inequalities = decoded.get("inequalities")
    if not isinstance(raw_inequalities, list) or not raw_inequalities:
        raise ValueError(f"{context}: decoded inequality support is empty")
    expected_kal = negated_kalmanson_rows(n)
    stationarity: dict[str, Fraction] = defaultdict(Fraction)
    stationarity["epsilon"] = Fraction(-1)
    dual_objective = Fraction(0)
    decoded_certificate_rows: list[list[object]] = []
    for item_index, item in enumerate(raw_inequalities):
        if not isinstance(item, dict):
            raise ValueError(f"{context}: inequality {item_index} is malformed")
        converted_index = require_int(item.get("converted_index"), context)
        multiplier = Fraction(str(item.get("multiplier")))
        if multiplier >= 0:
            raise ValueError(f"{context}: inequality dual multiplier is not negative")
        rhs = require_int(item.get("rhs"), context)
        terms = parse_sparse_terms(item.get("terms"), n, context)
        sense = item.get("sense")
        if sense == "upper":
            if not is_guarded_row_upper(terms, rhs, n):
                raise ValueError(f"{context}: unsupported or malformed guarded row")
        elif sense == "negated_lower":
            if rhs != 0 or tuple(sorted(terms.items())) not in expected_kal:
                raise ValueError(f"{context}: unsupported or malformed strict Kalmanson row")
        else:
            raise ValueError(f"{context}: unsupported inequality sense {sense!r}")
        for variable, coefficient in terms.items():
            stationarity[variable] -= multiplier * coefficient
        dual_objective += multiplier * rhs
        decoded_certificate_rows.append([converted_index, str(multiplier)])

    if certificate.get("inequality_marginals") != decoded_certificate_rows:
        raise ValueError(f"{context}: sparse inequality certificate disagrees with decoding")

    antecedent = decoded.get("antecedent_true_literals")
    if not isinstance(antecedent, list) or not antecedent:
        raise ValueError(f"{context}: empty seed antecedent")
    lower_certificate: list[list[object]] = []
    names: list[str] = []
    columns: list[int] = []
    for item in antecedent:
        if not isinstance(item, dict) or not isinstance(item.get("name"), str):
            raise ValueError(f"{context}: malformed antecedent item")
        name = item["name"]
        match = MEMBER_RE.fullmatch(name)
        if not match:
            raise ValueError(f"{context}: non-membership antecedent {name}")
        center, point = (require_vertex(int(raw), n, name) for raw in match.groups())
        if center == point:
            raise ValueError(f"{context}: self-membership antecedent")
        column = require_int(item.get("column"), context)
        if column != center * n + point:
            raise ValueError(f"{context}: membership name/column mismatch for {name}")
        multiplier = Fraction(str(item.get("multiplier")))
        if multiplier <= 0:
            raise ValueError(f"{context}: lower-bound multiplier is not positive")
        stationarity[name] -= multiplier
        dual_objective += multiplier
        lower_certificate.append([column, str(multiplier)])
        names.append(name)
        columns.append(column)
    if len(names) != len(set(names)):
        raise ValueError(f"{context}: duplicate membership in seed antecedent")
    if certificate.get("lower_bound_marginals") != lower_certificate:
        raise ValueError(f"{context}: sparse lower-bound certificate disagrees with decoding")
    if decoded.get("antecedent_is_true_boolean_support") is not True:
        raise ValueError(f"{context}: producer did not mark antecedent as true support")
    expected_nogood = [f"not {name}" for name in names]
    if decoded.get("nogood_clause") != expected_nogood:
        raise ValueError(f"{context}: decoded nogood clause mismatch")
    fixed_true = seed.get("fixed_boolean_true_columns")
    if not isinstance(fixed_true, list) or not set(columns) <= set(fixed_true):
        raise ValueError(f"{context}: antecedent was not true at the source fixed leaf")

    residual = {name: str(value) for name, value in stationarity.items() if value}
    if residual:
        raise ValueError(f"{context}: exact seed stationarity residual {residual}")
    if dual_objective != 0:
        raise ValueError(f"{context}: exact seed dual objective is {dual_objective}, not zero")
    return {
        "orbit": seed.get("orbit"),
        "antecedent_count": len(names),
        "inequality_count": len(raw_inequalities),
    }


def parse_rational(value: object, context: str) -> Fraction:
    if not isinstance(value, str):
        raise ValueError(f"{context}: exact rational must be stored as a string")
    try:
        return Fraction(value)
    except (ValueError, ZeroDivisionError) as error:
        raise ValueError(f"{context}: malformed exact rational {value!r}") from error


def strongly_connected(rows: dict[int, tuple[int, ...]], vertices: tuple[int, ...]) -> bool:
    for start in vertices:
        reached = {start}
        pending = [start]
        while pending:
            center = pending.pop()
            for point in rows[center]:
                if point not in reached:
                    reached.add(point)
                    pending.append(point)
        if len(reached) != len(vertices):
            return False
    return True


def verify_alive(alive: object, n: int, apex: int, context: str) -> dict[str, object]:
    """Replay an ALIVE artifact from exact rationals and displayed structure.

    This covers every named semantic block used by the current structural
    encoder, rather than trusting the producer's Boolean replay flag.  It does
    not assert Euclidean realizability, MEC geometry, or Lean closure.
    """
    if n != 14 or apex != 9:
        raise ValueError(f"{context}: structural ALIVE replay is pinned to n=14, apex=9")
    if not isinstance(alive, dict):
        raise ValueError(f"{context}: ALIVE artifact is not an object")
    if alive.get("schema") != "p97-exact6-integrated-exact-kalmanson-alive-v1":
        raise ValueError(f"{context}: unexpected ALIVE schema")
    distance_lower_bound = require_int(alive.get("distance_lower_bound_used"), context)
    if distance_lower_bound not in {0, 1}:
        raise ValueError(f"{context}: unsupported distance lower bound")
    expected_status = (
        "EXACT_POSITIVE_KALMANSON_LINEAR_SHADOW_ALIVE_"
        if distance_lower_bound == 1
        else "EXACT_NONNEGATIVE_KALMANSON_BOUNDARY_SHADOW_ALIVE_"
    ) + "NOT_EUCLIDEAN_NOT_LIVE_LEAN_CLOSURE"
    if alive.get("epistemic_status") != expected_status:
        raise ValueError(f"{context}: ALIVE epistemic status does not match its oracle")
    orbit = alive.get("orbit")
    orbits = {
        "continuationOrder",
        "reverseContinuationOrder",
        "sharesFirstAtSource",
        "sharesFirstAtTarget",
        "sharesSecondAtSource",
        "sharesSecondAtTarget",
        "fourDistinct",
    }
    if orbit not in orbits:
        raise ValueError(f"{context}: unknown role orbit {orbit!r}")

    vertices = tuple(range(n))
    raw_table = alive.get("distance_table")
    if not isinstance(raw_table, dict):
        raise ValueError(f"{context}: missing exact distance table")
    expected_keys = {f"{left},{right}" for left in vertices for right in range(left + 1, n)}
    if set(raw_table) != expected_keys:
        raise ValueError(f"{context}: distance table is not the complete canonical pair table")
    distances = {
        tuple(map(int, key.split(","))): parse_rational(value, f"{context}:{key}")
        for key, value in raw_table.items()
    }

    def dist(left: int, right: int) -> Fraction:
        return distances[edge(left, right)]

    minimum = min(distances.values())
    if minimum < distance_lower_bound:
        raise ValueError(
            f"{context}: distance lower bound {distance_lower_bound} fails at {minimum}"
        )
    exact_strict_replay = minimum >= 1
    if alive.get("strict_positivity_replay") is not exact_strict_replay:
        raise ValueError(f"{context}: producer positivity replay flag is not exact")
    if parse_rational(alive.get("minimum_distance"), context) != minimum:
        raise ValueError(f"{context}: recorded minimum distance is not exact")
    minimum_kalmanson_slack: Fraction | None = None
    for a in vertices:
        for b in range(a + 1, n):
            for c in range(b + 1, n):
                for d in range(c + 1, n):
                    diagonal = dist(a, c) + dist(b, d)
                    slacks = (
                        diagonal - dist(a, b) - dist(c, d),
                        diagonal - dist(a, d) - dist(b, c),
                    )
                    for slack in slacks:
                        if slack < 1:
                            raise ValueError(
                                f"{context}: Kalmanson normalization fails at {(a,b,c,d)}: {slack}"
                            )
                        minimum_kalmanson_slack = (
                            slack
                            if minimum_kalmanson_slack is None
                            else min(minimum_kalmanson_slack, slack)
                        )

    raw_rows = alive.get("rows")
    if not isinstance(raw_rows, dict) or set(raw_rows) != {str(v) for v in vertices}:
        raise ValueError(f"{context}: row table does not have exactly all centers")
    rows: dict[int, tuple[int, ...]] = {}
    for center in vertices:
        raw_support = raw_rows[str(center)]
        if not isinstance(raw_support, list) or len(raw_support) != 4:
            raise ValueError(f"{context}: row {center} is not an exact four-set")
        support = tuple(require_vertex(require_int(p, context), n, context) for p in raw_support)
        if len(set(support)) != 4 or center in support:
            raise ValueError(f"{context}: row {center} is not a distinct off-center four-set")
        reference = support[0]
        if any(dist(center, point) != dist(center, reference) for point in support[1:]):
            raise ValueError(f"{context}: row {center} is not exactly equidistant")
        rows[center] = support

    raw_shell = alive.get("shell")
    if not isinstance(raw_shell, list) or len(raw_shell) != 5:
        raise ValueError(f"{context}: shell is not an exact five-set")
    shell = tuple(require_vertex(require_int(p, context), n, context) for p in raw_shell)
    if len(set(shell)) != 5 or apex in shell:
        raise ValueError(f"{context}: shell is not distinct and apex-free")
    shell_reference = shell[0]
    if any(dist(apex, point) != dist(apex, shell_reference) for point in shell[1:]):
        raise ValueError(f"{context}: second-apex shell is not exactly equidistant")

    # Independently replay the named semantic structural blocks of encode.py.
    row_sets = {center: set(support) for center, support in rows.items()}
    for left in vertices:
        for right in range(left + 1, n):
            shared = row_sets[left] & row_sets[right]
            if len(shared) > 2:
                raise ValueError(f"{context}: center-pair intersection bound fails")
            if len(shared) == 2:
                inside = [left < point < right for point in shared]
                if inside[0] == inside[1]:
                    raise ValueError(f"{context}: perpendicular-bisector alternation fails")
    for first in vertices:
        for second in range(first + 1, n):
            centers = sum(first in row_sets[c] and second in row_sets[c] for c in vertices)
            if centers > 2:
                raise ValueError(f"{context}: target-pair center multiplicity fails")

    surplus = {5, 6, 7, 8, 9}
    opposite = {9, 10, 11, 12, 13, 0}
    physical_cap = {0, 1, 2, 3, 4, 5}
    physical = {1, 2, 3, 4}
    caps = ((surplus, {5, 9}), (opposite, {9, 0}), (physical_cap, {0, 5}))
    for cap, endpoints in caps:
        for center in cap:
            if len(row_sets[center] & cap) > 2:
                raise ValueError(f"{context}: cap-local row bound fails")
        for center in endpoints:
            if len(row_sets[center] & cap) > 1:
                raise ValueError(f"{context}: cap-endpoint row bound fails")
        outside = set(vertices) - cap
        for left in cap:
            for right in cap:
                if left < right and len(row_sets[left] & row_sets[right] & outside) > 1:
                    raise ValueError(f"{context}: cross-cap equal-pair injectivity fails")

    shell_set = set(shell)
    if orbit == "fourDistinct":
        if not physical <= shell_set:
            raise ValueError(f"{context}: fourDistinct shell distribution fails")
    elif len(shell_set & physical) < 3:
        raise ValueError(f"{context}: physical shell distribution fails")
    if len(shell_set & surplus) > 1 or len(shell_set & opposite) > 1:
        raise ValueError(f"{context}: adjacent-cap shell hit bound fails")
    for point in physical:
        if point not in shell_set and not shell_set & surplus:
            raise ValueError(f"{context}: surplus shell distribution implication fails")
        if point not in shell_set and not shell_set & opposite:
            raise ValueError(f"{context}: opposite shell distribution implication fails")
    if not row_sets[apex] <= shell_set:
        raise ValueError(f"{context}: apex selected row is not contained in shell")
    for center in vertices:
        if center == apex:
            continue
        shared = shell_set & row_sets[center]
        for left in shared:
            for right in shared:
                if left < right and left not in {center, apex} and right not in {center, apex}:
                    if (left < center < right) == (left < apex < right):
                        raise ValueError(f"{context}: shell/selected-row alternation fails")

    raw_roles = alive.get("roles")
    if not isinstance(raw_roles, dict):
        raise ValueError(f"{context}: missing named roles")
    role_names = {"first", "second", "source", "target", "unused"}
    if set(raw_roles) != role_names:
        raise ValueError(f"{context}: role table has the wrong keys")
    roles = {name: require_vertex(require_int(raw_roles[name], context), n, context) for name in role_names}
    if any(roles[name] not in physical or roles[name] not in shell_set for name in ("first", "second", "source", "target")):
        raise ValueError(f"{context}: named physical role restriction fails")
    if roles["first"] == roles["second"] or roles["source"] == roles["target"]:
        raise ValueError(f"{context}: base role inequality fails")
    first, second, source, target = (roles[name] for name in ("first", "second", "source", "target"))
    orbit_ok = {
        "continuationOrder": source == first and target == second,
        "reverseContinuationOrder": source == second and target == first,
        "sharesFirstAtSource": source == first and target != second,
        "sharesFirstAtTarget": target == first and source != second,
        "sharesSecondAtSource": source == second and target not in {first, second},
        "sharesSecondAtTarget": target == second and source not in {first, second},
        "fourDistinct": len({first, second, source, target}) == 4,
    }[orbit]
    if not orbit_ok:
        raise ValueError(f"{context}: declared role orbit fails")
    if roles["unused"] not in physical_cap or roles["unused"] in shell_set:
        raise ValueError(f"{context}: unused role restriction fails")

    raw_blockers = alive.get("blockers")
    if not isinstance(raw_blockers, dict) or set(raw_blockers) != {str(v) for v in vertices}:
        raise ValueError(f"{context}: blocker map is not total")
    blockers = {
        source_vertex: require_vertex(
            require_int(raw_blockers[str(source_vertex)], context), n, context
        )
        for source_vertex in vertices
    }
    for source_vertex, center in blockers.items():
        if center in {source_vertex, 5, apex} or source_vertex not in row_sets[center]:
            raise ValueError(f"{context}: blocker-map source incidence fails")
    unused_center = blockers[roles["unused"]]
    if first in row_sets[unused_center] or second in row_sets[unused_center]:
        raise ValueError(f"{context}: unused critical-row omission fails")
    if len(row_sets[unused_center] & shell_set & physical) > 1:
        raise ValueError(f"{context}: unused critical-row physical hit bound fails")
    source_center = blockers[source]
    target_center = blockers[target]
    if target in row_sets[source_center] or source in row_sets[target_center] or source_center == target_center:
        raise ValueError(f"{context}: mutual critical-row packet fails")
    for physical_source in physical & shell_set:
        if len(row_sets[blockers[physical_source]] & shell_set & physical) > 2:
            raise ValueError(f"{context}: physical-source critical-row hit bound fails")
    if not strongly_connected(rows, vertices):
        raise ValueError(f"{context}: selected-row digraph is not strongly connected")

    return {
        "orbit": orbit,
        "minimum_distance": str(minimum),
        "minimum_kalmanson_slack": str(minimum_kalmanson_slack),
        "distance_lower_bound_used": distance_lower_bound,
        "shadow_kind": (
            "STRICT_POSITIVE_ABSTRACT_SHADOW"
            if exact_strict_replay
            else "NONNEGATIVE_BOUNDARY_SHADOW"
        ),
        "row_count": len(rows),
    }


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def read_jsonl_snapshot(path: Path) -> tuple[list[object], str]:
    data = path.read_bytes()
    if data and not data.endswith(b"\n"):
        raise ValueError(f"{path}: append-only bank snapshot ends with a partial line")
    records = [json.loads(line) for line in data.decode("utf-8").splitlines() if line]
    return records, sha256_bytes(data)


def self_test(n: int, apex: int) -> None:
    valid = {
        "schema": "p97-exact6-integrated-exact-kalmanson-cut-v1",
        "id": "independent-verifier-smoke",
        "constraints": [
            {"name": "kal1_0_1_2_3", "multiplier": 1},
            {"name": "row_0_1_2", "multiplier": -1},
            {"name": "row_3_1_2", "multiplier": 1},
        ],
        "strict_weight_sum": 1,
        "required_memberships": [[0, 1], [0, 2], [3, 1], [3, 2]],
        "conditioned_shell": None,
        "exact_vector_cancellation": True,
        "initial_unsat_core_size": 3,
    }
    verify_cut(valid, n, apex, "self-test-valid")
    invalid = json.loads(json.dumps(valid))
    invalid["constraints"][0]["name"] = "kal1_1_0_2_3"
    try:
        verify_cut(invalid, n, apex, "self-test-invalid")
    except ValueError:
        pass
    else:
        raise ValueError("self-test failed to reject a non-cyclic Kalmanson name")

    # A boundary Kalmanson shadow with zero side distances remains SAT after
    # translating every distance by one.  This is the regression gate for the
    # fact that pairwise positivity does not strengthen this translation-
    # invariant abstract surface.
    boundary = {
        (0, 1): Fraction(0),
        (0, 2): Fraction(1),
        (0, 3): Fraction(0),
        (1, 2): Fraction(0),
        (1, 3): Fraction(1),
        (2, 3): Fraction(0),
    }
    shifted = {pair: value + 1 for pair, value in boundary.items()}
    for table, lower in ((boundary, 0), (shifted, 1)):
        if min(table.values()) < lower:
            raise ValueError("translation smoke failed its distance lower bound")
        diagonal = table[(0, 2)] + table[(1, 3)]
        if diagonal - table[(0, 1)] - table[(2, 3)] < 1:
            raise ValueError("translation smoke failed first Kalmanson inequality")
        if diagonal - table[(0, 3)] - table[(1, 2)] < 1:
            raise ValueError("translation smoke failed second Kalmanson inequality")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--bank", action="append", default=[], type=Path)
    parser.add_argument("--seed", action="append", default=[], type=Path)
    parser.add_argument("--alive", action="append", default=[], type=Path)
    parser.add_argument("--n", type=int, default=14)
    parser.add_argument("--apex", type=int, default=9)
    parser.add_argument("--self-test", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.n < 4 or not 0 <= args.apex < args.n:
        raise SystemExit("invalid n/apex")
    if args.self_test:
        self_test(args.n, args.apex)

    summary: dict[str, object] = {
        "schema": "p97-exact6-integrated-cegar-independent-audit-v1",
        "n": args.n,
        "second_apex": args.apex,
        "banks": [],
        "seeds": [],
        "alive_witnesses": [],
    }
    total_cuts = 0
    total_shell = 0
    total_positive_constraints = 0
    total_positive_weight = 0
    for path in args.bank:
        records, digest = read_jsonl_snapshot(path)
        seen_ids: set[object] = set()
        shell_count = 0
        positive_constraint_count = 0
        positive_weight = 0
        for index, record in enumerate(records, 1):
            checked = verify_cut(record, args.n, args.apex, f"{path}:{index}")
            if checked["id"] in seen_ids:
                raise ValueError(f"{path}:{index}: duplicate cut id {checked['id']!r}")
            seen_ids.add(checked["id"])
            shell_count += int(checked["shell_conditioned"])
            positive_constraint_count += int(checked["positive_constraint_count"])
            positive_weight += int(checked["positive_weight_sum"])
        total_cuts += len(records)
        total_shell += shell_count
        total_positive_constraints += positive_constraint_count
        total_positive_weight += positive_weight
        summary["banks"].append({  # type: ignore[union-attr]
            "path": str(path),
            "sha256": digest,
            "cut_count": len(records),
            "shell_conditioned_count": shell_count,
            "positive_constraint_count": positive_constraint_count,
            "positive_weight_sum": positive_weight,
        })

    for path in args.seed:
        data = path.read_bytes()
        checked = verify_seed(json.loads(data), args.n, str(path))
        summary["seeds"].append({  # type: ignore[union-attr]
            "path": str(path),
            "sha256": sha256_bytes(data),
            **checked,
        })
    for path in args.alive:
        data = path.read_bytes()
        checked = verify_alive(json.loads(data), args.n, args.apex, str(path))
        summary["alive_witnesses"].append({  # type: ignore[union-attr]
            "path": str(path),
            "sha256": sha256_bytes(data),
            **checked,
        })
    summary["total_verified_cuts"] = total_cuts
    summary["total_shell_conditioned_cuts"] = total_shell
    summary["total_positive_constraints_in_cuts"] = total_positive_constraints
    summary["total_positive_weight_in_cuts"] = total_positive_weight
    summary["total_verified_seeds"] = len(args.seed)
    summary["total_verified_alive_witnesses"] = len(args.alive)
    summary["verdict"] = "INDEPENDENT_EXACT_LOCAL_CUT_REPLAY_PASS"
    rendered = json.dumps(summary, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")


if __name__ == "__main__":
    main()
