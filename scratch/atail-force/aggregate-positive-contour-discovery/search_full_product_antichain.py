#!/usr/bin/env python3
"""Exact bounded CEGAR search for a full product-box antichain.

The outer object is a cyclic row table ``S(c)`` with exactly four nonself
targets at every center, selected-pair alternation, and a strongly connected
selected digraph.  A table is a counterexample to the proposed circular
product-box comparability theorem when every equal-target-multiplicity fiber
is an antichain under the circular interval outward-crossing profiles.

The inner exact Z3 query searches for two assignments with equal target
multiplicities and a nonzero coordinatewise one-signed profile difference.
Each found pair contributes the sound outer cut saying that not all of its
changed-center row incidences may coexist.  A surviving table is replayed by
complete ``4^n`` assignment enumeration before it is serialized.

This is theorem-discovery support only.  SAT witnesses are exactly replayed;
UNSAT remains external solver evidence for the encoded finite bound.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import math
import os
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import uuid
from collections import defaultdict
from collections.abc import Iterable, Mapping, Sequence
from pathlib import Path

import z3


Arc = tuple[int, int]
Assignment = tuple[int, ...]
Profile = tuple[int, ...]
Rows = dict[int, tuple[int, ...]]


def circular_intervals(n: int) -> tuple[frozenset[int], ...]:
    """Nontrivial circular intervals modulo complement."""

    return tuple(
        frozenset(range(left + 1, right + 1))
        for left in range(n)
        for right in range(left + 2, n)
        if not (left == 0 and right == n - 1)
    )


def outward_profile(
    intervals: Sequence[frozenset[int]], assignment: Assignment
) -> Profile:
    return tuple(
        sum(center in interval and target not in interval
            for center, target in enumerate(assignment))
        for interval in intervals
    )


def target_multiplicities(n: int, assignment: Assignment) -> tuple[int, ...]:
    counts = [0] * n
    for target in assignment:
        counts[target] += 1
    return tuple(counts)


def comparable_strict(left: Profile, right: Profile) -> bool:
    if left == right:
        return False
    return all(a <= b for a, b in zip(left, right, strict=True)) or all(
        b <= a for a, b in zip(left, right, strict=True)
    )


def alternating_partition(
    center_left: int, center_right: int, target_left: int, target_right: int
) -> bool:
    ordered = sorted((center_left, center_right, target_left, target_right))
    if len(set(ordered)) != 4:
        return False
    center_set = {center_left, center_right}
    return {ordered[0], ordered[2]} == center_set or {
        ordered[1], ordered[3]
    } == center_set


def verify_rows(n: int, rows: Mapping[int, Sequence[int]]) -> None:
    assert set(rows) == set(range(n))
    for center, row in rows.items():
        assert len(row) == 4
        assert len(set(row)) == 4
        assert center not in row
        assert all(0 <= target < n for target in row)

    for center_left, center_right in itertools.combinations(range(n), 2):
        shared = sorted(set(rows[center_left]) & set(rows[center_right]))
        for target_left, target_right in itertools.combinations(shared, 2):
            assert alternating_partition(
                center_left, center_right, target_left, target_right
            )

    def reachable(reverse: bool) -> set[int]:
        seen = {0}
        stack = [0]
        while stack:
            vertex = stack.pop()
            neighbors: Iterable[int]
            if reverse:
                neighbors = (
                    source for source, row in rows.items() if vertex in row
                )
            else:
                neighbors = rows[vertex]
            for neighbor in neighbors:
                if neighbor not in seen:
                    seen.add(neighbor)
                    stack.append(neighbor)
        return seen

    assert len(reachable(False)) == n
    assert len(reachable(True)) == n


def changed_support(left: Assignment, right: Assignment) -> frozenset[Arc]:
    return frozenset(
        (center, target)
        for center, (left_target, right_target) in enumerate(
            zip(left, right, strict=True)
        )
        if left_target != right_target
        for target in (left_target, right_target)
    )


def make_cut_certificate(
    n: int,
    intervals: Sequence[frozenset[int]],
    left: Assignment,
    right: Assignment,
) -> dict[str, object]:
    changed = {
        center: (left_target, right_target)
        for center, (left_target, right_target) in enumerate(
            zip(left, right, strict=True)
        )
        if left_target != right_target
    }
    left_counts = [0] * n
    right_counts = [0] * n
    for left_target, right_target in changed.values():
        left_counts[left_target] += 1
        right_counts[right_target] += 1
    assert left_counts == right_counts

    difference = tuple(
        sum(
            center in interval and left_target not in interval
            for center, (left_target, _right_target) in changed.items()
        )
        - sum(
            center in interval and right_target not in interval
            for center, (_left_target, right_target) in changed.items()
        )
        for interval in intervals
    )
    assert difference != (0,) * len(intervals)
    assert all(value >= 0 for value in difference) or all(
        value <= 0 for value in difference
    )
    return {
        "changed_rows": [
            [center, left_target, right_target]
            for center, (left_target, right_target) in sorted(changed.items())
        ],
        "profile_difference": list(difference),
        "support": [list(arc) for arc in sorted(changed_support(left, right))],
    }


def verify_cut_certificate(
    n: int,
    intervals: Sequence[frozenset[int]],
    certificate: Mapping[str, object],
) -> frozenset[Arc]:
    changed_rows = certificate["changed_rows"]
    assert isinstance(changed_rows, list)
    left = [-1] * n
    right = [-1] * n
    seen_centers: set[int] = set()
    for raw in changed_rows:
        assert isinstance(raw, list) and len(raw) == 3
        center, left_target, right_target = map(int, raw)
        assert 0 <= center < n
        assert 0 <= left_target < n and 0 <= right_target < n
        assert center not in (left_target, right_target)
        assert left_target != right_target
        assert center not in seen_centers
        seen_centers.add(center)
        left[center] = left_target
        right[center] = right_target
    assert seen_centers

    left_counts = [0] * n
    right_counts = [0] * n
    for center in seen_centers:
        left_counts[left[center]] += 1
        right_counts[right[center]] += 1
    assert left_counts == right_counts
    difference = tuple(
        sum(
            center in interval and left[center] not in interval
            for center in seen_centers
        )
        - sum(
            center in interval and right[center] not in interval
            for center in seen_centers
        )
        for interval in intervals
    )
    assert difference == tuple(map(int, certificate["profile_difference"]))  # type: ignore[arg-type]
    assert difference != (0,) * len(intervals)
    assert all(value >= 0 for value in difference) or all(
        value <= 0 for value in difference
    )
    support = frozenset(
        (center, target)
        for center in seen_centers
        for target in (left[center], right[center])
    )
    assert support == frozenset(
        tuple(map(int, raw)) for raw in certificate["support"]  # type: ignore[arg-type]
    )
    return support


def verify_pair(
    n: int,
    rows: Mapping[int, Sequence[int]],
    intervals: Sequence[frozenset[int]],
    left: Assignment,
    right: Assignment,
) -> dict[str, object]:
    assert left != right
    assert all(left[c] in rows[c] and right[c] in rows[c] for c in range(n))
    left_multiplicity = target_multiplicities(n, left)
    right_multiplicity = target_multiplicities(n, right)
    assert left_multiplicity == right_multiplicity
    left_profile = outward_profile(intervals, left)
    right_profile = outward_profile(intervals, right)
    assert comparable_strict(left_profile, right_profile)
    difference = tuple(
        a - b for a, b in zip(left_profile, right_profile, strict=True)
    )
    return {
        "left": list(left),
        "right": list(right),
        "target_multiplicity": list(left_multiplicity),
        "left_profile": list(left_profile),
        "right_profile": list(right_profile),
        "profile_difference": list(difference),
        "changed_support": [list(arc) for arc in sorted(changed_support(left, right))],
    }


class ProductAntichainSearch:
    def __init__(self, n: int, seed: int) -> None:
        self.n = n
        self.intervals = circular_intervals(n)
        self.outer = z3.Solver()
        self.outer.set(random_seed=seed)
        self.member = {
            (center, point): z3.Bool(f"m_{center}_{point}")
            for center in range(n)
            for point in range(n)
            if point != center
        }
        self.alternation_clause_count = 0
        self.connectivity_clause_count = 0
        self.learned_supports: set[frozenset[Arc]] = set()
        self.cut_certificates: list[dict[str, object]] = []
        self._add_outer_surface()

    def _add_outer_surface(self) -> None:
        n = self.n
        for center in range(n):
            self.outer.add(
                z3.PbEq(
                    [
                        (self.member[center, point], 1)
                        for point in range(n)
                        if point != center
                    ],
                    4,
                )
            )

        for quadruple in itertools.combinations(range(n), 4):
            a, b, c, d = quadruple
            alternating = {frozenset((a, c)), frozenset((b, d))}
            vertices = frozenset(quadruple)
            for centers_tuple in itertools.combinations(quadruple, 2):
                centers = frozenset(centers_tuple)
                if centers in alternating:
                    continue
                targets = vertices - centers
                center_left, center_right = sorted(centers)
                target_left, target_right = sorted(targets)
                self.outer.add(
                    z3.Or(
                        z3.Not(self.member[center_left, target_left]),
                        z3.Not(self.member[center_left, target_right]),
                        z3.Not(self.member[center_right, target_left]),
                        z3.Not(self.member[center_right, target_right]),
                    )
                )
                self.alternation_clause_count += 1

        vertices = tuple(range(n))
        for size in range(1, n):
            for tail in itertools.combinations(vertices[1:], size - 1):
                subset = frozenset((0, *tail))
                if len(subset) == n:
                    continue
                complement = frozenset(vertices) - subset
                self.outer.add(
                    z3.Or(
                        [
                            self.member[source, target]
                            for source in subset
                            for target in complement
                        ]
                    ),
                    z3.Or(
                        [
                            self.member[source, target]
                            for source in complement
                            for target in subset
                        ]
                    ),
                )
                self.connectivity_clause_count += 2

    def decode_rows(self, model: z3.ModelRef) -> Rows:
        rows = {
            center: tuple(
                point
                for point in range(self.n)
                if point != center
                and z3.is_true(
                    model.eval(self.member[center, point], model_completion=True)
                )
            )
            for center in range(self.n)
        }
        verify_rows(self.n, rows)
        return rows

    def add_support_cut(
        self, support: frozenset[Arc], certificate: dict[str, object]
    ) -> bool:
        assert support == verify_cut_certificate(
            self.n, self.intervals, certificate
        )
        if support in self.learned_supports:
            return False
        assert support
        self.outer.add(z3.Or([z3.Not(self.member[arc]) for arc in support]))
        self.learned_supports.add(support)
        self.cut_certificates.append(certificate)
        return True

    def find_pair_batch(
        self,
        rows: Rows,
        *,
        limit: int,
        timeout_ms: int,
    ) -> tuple[str, list[dict[str, object]], str | None]:
        n = self.n
        solver = z3.Solver()
        solver.set(timeout=timeout_ms, random_seed=0)
        left = {
            (center, target): z3.Bool(f"left_{center}_{target}")
            for center in range(n)
            for target in rows[center]
        }
        right = {
            (center, target): z3.Bool(f"right_{center}_{target}")
            for center in range(n)
            for target in rows[center]
        }
        for center in range(n):
            solver.add(
                z3.PbEq([(left[center, target], 1) for target in rows[center]], 1),
                z3.PbEq([(right[center, target], 1) for target in rows[center]], 1),
            )
        for target in range(n):
            solver.add(
                z3.Sum(
                    [
                        z3.If(left[center, target], 1, 0)
                        for center in range(n)
                        if target in rows[center]
                    ]
                )
                == z3.Sum(
                    [
                        z3.If(right[center, target], 1, 0)
                        for center in range(n)
                        if target in rows[center]
                    ]
                )
            )

        differences: list[z3.ArithRef] = []
        for interval in self.intervals:
            left_crossing = z3.Sum(
                [
                    z3.If(left[center, target], 1, 0)
                    for center in interval
                    for target in rows[center]
                    if target not in interval
                ]
            )
            right_crossing = z3.Sum(
                [
                    z3.If(right[center, target], 1, 0)
                    for center in interval
                    for target in rows[center]
                    if target not in interval
                ]
            )
            difference = left_crossing - right_crossing
            solver.add(difference >= 0)
            differences.append(difference)
        solver.add(z3.Sum(differences) >= 1)

        found: list[dict[str, object]] = []
        seen_supports: set[frozenset[Arc]] = set()
        while len(found) < limit:
            status = solver.check()
            if status == z3.unsat:
                return "UNSAT", found, None
            if status == z3.unknown:
                return "UNKNOWN", found, solver.reason_unknown()
            model = solver.model()
            left_assignment = tuple(
                next(
                    target
                    for target in rows[center]
                    if z3.is_true(
                        model.eval(left[center, target], model_completion=True)
                    )
                )
                for center in range(n)
            )
            right_assignment = tuple(
                next(
                    target
                    for target in rows[center]
                    if z3.is_true(
                        model.eval(right[center, target], model_completion=True)
                    )
                )
                for center in range(n)
            )
            record = verify_pair(
                n,
                rows,
                self.intervals,
                left_assignment,
                right_assignment,
            )
            support = changed_support(left_assignment, right_assignment)
            assert support
            record["cut_certificate"] = make_cut_certificate(
                n, self.intervals, left_assignment, right_assignment
            )
            if support not in seen_supports:
                seen_supports.add(support)
                record["support_size"] = len(support)
                found.append(record)

            same_support_conditions: list[z3.BoolRef] = []
            for center in range(n):
                left_target = left_assignment[center]
                right_target = right_assignment[center]
                if left_target == right_target:
                    same_support_conditions.append(
                        z3.Or(
                            [
                                z3.And(left[center, target], right[center, target])
                                for target in rows[center]
                            ]
                        )
                    )
                else:
                    same_support_conditions.append(
                        z3.Or(
                            z3.And(
                                left[center, left_target],
                                right[center, right_target],
                            ),
                            z3.And(
                                left[center, right_target],
                                right[center, left_target],
                            ),
                        )
                    )
            solver.add(z3.Not(z3.And(same_support_conditions)))
        return "BATCH_LIMIT", found, None


def exhaustive_replay(
    n: int, rows: Rows, intervals: Sequence[frozenset[int]]
) -> dict[str, object]:
    groups: dict[
        tuple[int, ...], dict[Profile, Assignment]
    ] = defaultdict(dict)
    assignment_count = 0
    pair_comparisons = 0
    for assignment in itertools.product(*(rows[center] for center in range(n))):
        assignment_count += 1
        multiplicity = target_multiplicities(n, assignment)
        profile = outward_profile(intervals, assignment)
        for previous_profile, previous_assignment in groups[multiplicity].items():
            pair_comparisons += 1
            if comparable_strict(profile, previous_profile):
                return {
                    "status": "COMPARABLE_PAIR_FOUND",
                    "assignment_count_before_hit": assignment_count,
                    "pair_comparisons_before_hit": pair_comparisons,
                    "pair": verify_pair(
                        n,
                        rows,
                        intervals,
                        assignment,
                        previous_assignment,
                    ),
                }
        groups[multiplicity].setdefault(profile, assignment)
    return {
        "status": "FULL_PRODUCT_ANTICHAIN_VERIFIED",
        "assignment_count": assignment_count,
        "expected_assignment_count": 4**n,
        "multiplicity_fiber_count": len(groups),
        "distinct_profile_count": sum(len(profiles) for profiles in groups.values()),
        "pair_comparisons": pair_comparisons,
    }


def canonical_sha256(value: object) -> str:
    encoded = json.dumps(value, sort_keys=True, separators=(",", ":")).encode()
    return hashlib.sha256(encoded).hexdigest()


def atomic_write_json(path: Path, payload: Mapping[str, object]) -> None:
    """Atomically replace an explicitly requested JSON artifact."""

    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_name(f".{path.name}.{os.getpid()}.tmp")
    try:
        temporary.write_text(
            json.dumps(payload, indent=2, sort_keys=True, default=str) + "\n",
            encoding="utf-8",
        )
        temporary.replace(path)
    finally:
        temporary.unlink(missing_ok=True)


def support_bank_sha256(supports: Iterable[frozenset[Arc]]) -> str:
    canonical = [
        [list(arc) for arc in sorted(support)]
        for support in sorted(supports, key=lambda item: (len(item), sorted(item)))
    ]
    return canonical_sha256(canonical)


def inclusion_minimal_supports(
    supports: Iterable[frozenset[Arc]],
) -> tuple[frozenset[Arc], ...]:
    """Return deterministic inclusion-minimal supports in near-linear practice.

    Accepted supports are processed by increasing cardinality.  Supports of
    size at least three are indexed by their first three arc ordinals.  If an
    accepted support ``A`` is contained in a query ``B``, that canonical
    triple occurs among the triples of ``B``; exact integer-bitset inclusion
    then confirms the witness.  This avoids a quadratic scan of the full bank.
    """

    unique = set(supports)
    if any(not support for support in unique):
        raise ValueError("learned support cuts must be nonempty")
    ordered = sorted(unique, key=lambda item: (len(item), tuple(sorted(item))))
    arc_position = {
        arc: index
        for index, arc in enumerate(sorted({arc for support in ordered for arc in support}))
    }
    accepted: list[frozenset[Arc]] = []
    short_masks: list[int] = []
    triple_index: dict[tuple[int, int, int], list[int]] = defaultdict(list)

    for support in ordered:
        ordinals = tuple(sorted(arc_position[arc] for arc in support))
        mask = sum(1 << ordinal for ordinal in ordinals)
        subsumed = any(candidate & mask == candidate for candidate in short_masks)
        if not subsumed and len(ordinals) >= 3:
            for triple in itertools.combinations(ordinals, 3):
                if any(
                    candidate & mask == candidate
                    for candidate in triple_index.get(triple, ())
                ):
                    subsumed = True
                    break
        if subsumed:
            continue
        accepted.append(support)
        if len(ordinals) < 3:
            short_masks.append(mask)
        else:
            triple_index[ordinals[:3]].append(mask)

    return tuple(accepted)


def learned_support_summary(
    search: ProductAntichainSearch,
) -> tuple[tuple[frozenset[Arc], ...], dict[str, object]]:
    full = tuple(search.learned_supports)
    emitted = inclusion_minimal_supports(full)
    return emitted, {
        "full_learned_cut_count": len(full),
        "emitted_minimal_cut_count": len(emitted),
        "subsumed_cut_count": len(full) - len(emitted),
        "full_support_bank_sha256": support_bank_sha256(full),
        "emitted_support_bank_sha256": support_bank_sha256(emitted),
    }


def dimacs_clauses(
    search: ProductAntichainSearch,
) -> tuple[dict[Arc, int], list[list[int]], dict[str, object]]:
    n = search.n
    variable = {
        arc: index
        for index, arc in enumerate(sorted(search.member), start=1)
    }
    clauses: list[list[int]] = []

    for center in range(n):
        row_variables = [variable[center, target] for target in range(n) if target != center]
        # Exactly four: no five true and no four false among n-1 variables.
        clauses.extend([-literal for literal in chosen] for chosen in itertools.combinations(row_variables, 5))
        clauses.extend(list(chosen) for chosen in itertools.combinations(row_variables, n - 4))

    for quadruple in itertools.combinations(range(n), 4):
        a, b, c, d = quadruple
        alternating = {frozenset((a, c)), frozenset((b, d))}
        vertices = frozenset(quadruple)
        for centers_tuple in itertools.combinations(quadruple, 2):
            centers = frozenset(centers_tuple)
            if centers in alternating:
                continue
            targets = vertices - centers
            center_left, center_right = sorted(centers)
            target_left, target_right = sorted(targets)
            clauses.append(
                [
                    -variable[center_left, target_left],
                    -variable[center_left, target_right],
                    -variable[center_right, target_left],
                    -variable[center_right, target_right],
                ]
            )

    vertices = tuple(range(n))
    for size in range(1, n):
        for tail in itertools.combinations(vertices[1:], size - 1):
            subset = frozenset((0, *tail))
            if len(subset) == n:
                continue
            complement = frozenset(vertices) - subset
            clauses.append(
                [
                    variable[source, target]
                    for source in subset
                    for target in complement
                ]
            )
            clauses.append(
                [
                    variable[source, target]
                    for source in complement
                    for target in subset
                ]
            )

    emitted_supports, cut_summary = learned_support_summary(search)
    clauses.extend(
        [-variable[arc] for arc in sorted(support)]
        for support in emitted_supports
    )
    assert all(clause for clause in clauses)
    return variable, clauses, cut_summary


def render_dimacs(
    search: ProductAntichainSearch,
) -> tuple[dict[Arc, int], list[list[int]], bytes, dict[str, object]]:
    variable, clauses, cut_summary = dimacs_clauses(search)
    lines = [f"p cnf {len(variable)} {len(clauses)}"]
    lines.extend(" ".join(map(str, clause)) + " 0" for clause in clauses)
    rendered = ("\n".join(lines) + "\n").encode("ascii")
    return variable, clauses, rendered, cut_summary


def write_dimacs(path: Path, search: ProductAntichainSearch) -> dict[str, object]:
    variable, clauses, rendered, cut_summary = render_dimacs(search)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_bytes(rendered)
    return {
        "path": str(path),
        "variable_count": len(variable),
        "clause_count": len(clauses),
        "sha256": hashlib.sha256(rendered).hexdigest(),
        **cut_summary,
    }


def http_bytes(
    url: str,
    *,
    method: str = "GET",
    data: bytes | None = None,
    headers: Mapping[str, str] | None = None,
    timeout: float = 30,
) -> bytes:
    request = urllib.request.Request(
        url,
        data=data,
        headers=dict(headers or {}),
        method=method,
    )
    try:
        with urllib.request.urlopen(request, timeout=timeout) as response:
            return response.read()
    except urllib.error.HTTPError as error:
        body = error.read().decode("utf-8", errors="replace")
        raise RuntimeError(f"piqd HTTP {error.code} for {url}: {body}") from error
    except urllib.error.URLError as error:
        raise RuntimeError(f"piqd request failed for {url}: {error}") from error


def http_json(
    url: str,
    *,
    method: str = "GET",
    data: bytes | None = None,
    headers: Mapping[str, str] | None = None,
    timeout: float = 30,
) -> dict[str, object]:
    decoded = json.loads(
        http_bytes(
            url,
            method=method,
            data=data,
            headers=headers,
            timeout=timeout,
        )
    )
    if not isinstance(decoded, dict):
        raise ValueError(f"piqd returned non-object JSON for {url}")
    return decoded


def multipart_body(
    parts: Sequence[tuple[str, str | None, str, bytes]],
) -> tuple[bytes, str]:
    boundary = "p97-product-antichain-" + uuid.uuid4().hex
    chunks: list[bytes] = []
    for name, filename, content_type, payload in parts:
        chunks.append(f"--{boundary}\r\n".encode())
        disposition = f'Content-Disposition: form-data; name="{name}"'
        if filename is not None:
            disposition += f'; filename="{filename}"'
        chunks.append((disposition + "\r\n").encode())
        chunks.append(f"Content-Type: {content_type}\r\n\r\n".encode())
        chunks.append(payload)
        chunks.append(b"\r\n")
    chunks.append(f"--{boundary}--\r\n".encode())
    return b"".join(chunks), boundary


def decode_piqd_rows(
    search: ProductAntichainSearch,
    variable: Mapping[Arc, int],
    clauses: Sequence[Sequence[int]],
    raw_assignment: object,
) -> Rows:
    """Fail closed unless piqd supplied a complete, clause-valid outer model."""

    if not isinstance(raw_assignment, list) or not all(
        isinstance(literal, int) for literal in raw_assignment
    ):
        raise ValueError("piqd returned a malformed signed assignment")
    values: dict[int, bool] = {}
    for literal in raw_assignment:
        if literal == 0:
            continue
        index = abs(literal)
        if not 1 <= index <= len(variable):
            raise ValueError(f"piqd model variable out of range: {index}")
        value = literal > 0
        if index in values and values[index] != value:
            raise ValueError(f"piqd model assigns variable {index} twice")
        values[index] = value
    missing = sorted(set(range(1, len(variable) + 1)) - set(values))
    if missing:
        raise ValueError(
            f"piqd model is incomplete: {len(missing)} variables missing; "
            f"first={missing[:8]}"
        )

    def literal_true(literal: int) -> bool:
        return values[abs(literal)] == (literal > 0)

    for clause_index, clause in enumerate(clauses):
        if not any(literal_true(literal) for literal in clause):
            raise ValueError(f"piqd model falsifies DIMACS clause {clause_index}")

    rows: Rows = {
        center: tuple(
            target
            for target in range(search.n)
            if target != center and values[variable[center, target]]
        )
        for center in range(search.n)
    }
    verify_rows(search.n, rows)
    return rows


def solve_outer_piqd(
    search: ProductAntichainSearch,
    *,
    base_url: str,
    timeout_ms: int,
    poll_seconds: float,
) -> tuple[str, Rows | None, dict[str, object]]:
    """Solve the current exact outer CNF through piqd's raw-DIMACS lane."""

    started = time.monotonic()
    variable, clauses, cnf_bytes, cut_summary = render_dimacs(search)
    cnf_hash = hashlib.sha256(cnf_bytes).hexdigest()
    timeout_seconds = max(1, math.ceil(timeout_ms / 1000))
    meta = {
        "backend": "cadical",
        "solver_profile": "sat",
        "timeout_s": timeout_seconds,
        "project": "erdos-97-96-product-antichain",
    }
    manifest = {
        "schema": "p97-product-antichain-outer-cnf-v1",
        "n": search.n,
        "variable_count": len(variable),
        "clause_count": len(clauses),
        "learned_cut_count": len(search.learned_supports),
        "cut_certificate_bank_sha256": canonical_sha256(search.cut_certificates),
        "cnf_sha256": cnf_hash,
        **cut_summary,
    }
    meta_bytes = (
        json.dumps(meta, sort_keys=True, separators=(",", ":")).encode() + b"\n"
    )
    manifest_bytes = (
        json.dumps(manifest, sort_keys=True, separators=(",", ":")).encode()
        + b"\n"
    )
    body, boundary = multipart_body(
        (
            ("cnf", "product-antichain.cnf", "application/octet-stream", cnf_bytes),
            ("meta", None, "application/json", meta_bytes),
            ("manifest", None, "application/json", manifest_bytes),
        )
    )
    metadata: dict[str, object] = {
        "backend": "piqd/cadical",
        "cnf_sha256": cnf_hash,
        "variable_count": len(variable),
        "clause_count": len(clauses),
        **cut_summary,
    }
    try:
        base = base_url.rstrip("/")
        prepared = http_json(
            base + "/jobs/prepare-cnf",
            method="POST",
            data=body,
            headers={"Content-Type": f"multipart/form-data; boundary={boundary}"},
            timeout=max(30, min(timeout_seconds, 120)),
        )
        if prepared.get("cnf_blob_hash") != cnf_hash:
            raise ValueError("piqd prepare-cnf hash differs from submitted CNF")
        if int(prepared.get("num_vars", -1)) != len(variable):
            raise ValueError("piqd prepare-cnf variable count differs from DIMACS")
        if int(prepared.get("num_clauses", -1)) != len(clauses):
            raise ValueError("piqd prepare-cnf clause count differs from DIMACS")
        job_id = str(prepared["job_id"])
        metadata.update(
            {
                "job_id": job_id,
                "existing": prepared.get("existing"),
                "identity_hash": prepared.get("identity_hash"),
            }
        )
        status_url = base + "/jobs/" + urllib.parse.quote(job_id, safe="")
        status = http_json(status_url)
        if status.get("status") == "prepared":
            confirm_url = (
                base
                + "/jobs/confirm?"
                + urllib.parse.urlencode({"job_id": job_id})
            )
            http_json(confirm_url, method="POST", data=b"")
        elif status.get("status") not in {"confirmed", "running", "completed"}:
            raise RuntimeError(
                f"piqd job {job_id} has unusable status {status.get('status')}"
            )

        deadline = time.monotonic() + timeout_seconds + 5
        while True:
            status = http_json(status_url)
            if status.get("status") in {"completed", "failed"}:
                break
            if time.monotonic() >= deadline:
                metadata.update(
                    {
                        "elapsed_seconds": time.monotonic() - started,
                        "reason": "piqd_supervisor_timeout",
                        "piqd_status": status.get("status"),
                    }
                )
                return "UNKNOWN", None, metadata
            time.sleep(poll_seconds)

        metadata.update(
            {
                "elapsed_seconds": time.monotonic() - started,
                "piqd_status": status.get("status"),
                "piqd_result": status.get("result"),
                "piqd_wall_ms": status.get("wall_ms"),
            }
        )
        result = status.get("result")
        if status.get("status") != "completed" or result not in {"SAT", "UNSAT"}:
            metadata["reason"] = "piqd_no_terminal_verdict"
            return "UNKNOWN", None, metadata
        if result == "UNSAT":
            return "UNSAT", None, metadata

        model = http_json(status_url + "/model", timeout=60)
        rows = decode_piqd_rows(search, variable, clauses, model.get("assignment"))
        metadata["model_num_assigned"] = model.get("num_assigned")
        metadata["model_exact_replay"] = "ALL_CLAUSES_AND_ROWS_PASS"
        return "SAT", rows, metadata
    except (KeyError, RuntimeError, TypeError, ValueError) as error:
        metadata.update(
            {
                "elapsed_seconds": time.monotonic() - started,
                "reason": "piqd_protocol_or_model_failure",
                "detail": str(error),
            }
        )
        return "UNKNOWN", None, metadata


def restore_resume(
    path: Path, search: ProductAntichainSearch
) -> list[dict[str, object]]:
    """Replay every banked cut before accepting a checkpoint or final artifact."""

    source = json.loads(path.read_text(encoding="utf-8"))
    if not isinstance(source, dict):
        raise ValueError("resume artifact must be a JSON object")
    if int(source.get("n", -1)) != search.n:
        raise ValueError("resume artifact n does not match --n")
    raw_certificates = source.get("cut_certificates")
    raw_iterations = source.get("iteration_log")
    if not isinstance(raw_certificates, list) or not isinstance(raw_iterations, list):
        raise ValueError("resume artifact lacks cut_certificates or iteration_log")

    for raw_certificate in raw_certificates:
        if not isinstance(raw_certificate, dict):
            raise ValueError("resume cut certificate must be a JSON object")
        certificate = dict(raw_certificate)
        support = verify_cut_certificate(
            search.n,
            search.intervals,
            certificate,
        )
        if not search.add_support_cut(support, certificate):
            raise ValueError("resume artifact contains a duplicate support cut")

    expected_hash = source.get("cut_certificate_bank_sha256")
    actual_hash = canonical_sha256(search.cut_certificates)
    if expected_hash is not None and expected_hash != actual_hash:
        raise ValueError("resume cut certificate bank hash mismatch")
    if source.get("learned_comparable_support_cuts") not in {
        None,
        len(search.learned_supports),
    }:
        raise ValueError("resume cut count mismatch")

    iterations: list[dict[str, object]] = []
    for raw_iteration in raw_iterations:
        if not isinstance(raw_iteration, dict):
            raise ValueError("resume iteration record must be a JSON object")
        iterations.append(dict(raw_iteration))
    if len(iterations) != int(source.get("iterations_completed", len(iterations))):
        raise ValueError("resume iteration count mismatch")
    return iterations


def checkpoint_payload(
    search: ProductAntichainSearch,
    iterations: Sequence[Mapping[str, object]],
    *,
    seed: int,
    outer_solver: str,
    elapsed_seconds: float,
    terminal: Mapping[str, object] | None = None,
) -> dict[str, object]:
    payload: dict[str, object] = {
        "schema": "p97-full-four-row-product-antichain-checkpoint-v1",
        "epistemic_status": "RESUMABLE_EXACT_CUT_BANK_EXTERNAL_OUTER_ORACLE",
        "n": search.n,
        "seed": seed,
        "outer_solver": outer_solver,
        "iterations_completed": len(iterations),
        "learned_comparable_support_cuts": len(search.learned_supports),
        "cut_certificate_bank_sha256": canonical_sha256(search.cut_certificates),
        "cut_certificates": search.cut_certificates,
        "iteration_log": list(iterations),
        "elapsed_seconds_current_run": elapsed_seconds,
    }
    if terminal is not None:
        payload["terminal"] = dict(terminal)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, required=True)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--solver-timeout-ms", type=int, default=60_000)
    parser.add_argument("--max-iterations", type=int, default=10_000)
    parser.add_argument("--batch-cuts", type=int, default=64)
    parser.add_argument("--seed", type=int, default=0)
    parser.add_argument(
        "--outer-solver",
        choices=("z3", "piqd"),
        default="z3",
        help="outer row-table oracle (default: z3)",
    )
    parser.add_argument("--piqd-base-url", default="http://127.0.0.1:7272")
    parser.add_argument("--piqd-poll-seconds", type=float, default=0.25)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--dimacs-output", type=Path)
    parser.add_argument(
        "--checkpoint-output",
        type=Path,
        help="atomically refreshed resumable cut-bank artifact",
    )
    parser.add_argument(
        "--resume",
        type=Path,
        help="replay cuts and iteration log from a checkpoint or final artifact",
    )
    args = parser.parse_args()
    if args.n < 5:
        raise ValueError("n must be at least five")
    if args.timeout_seconds <= 0 or args.solver_timeout_ms <= 0:
        raise ValueError("timeouts must be positive")
    if args.max_iterations <= 0 or args.batch_cuts <= 0:
        raise ValueError("budgets must be positive")
    if args.piqd_poll_seconds <= 0:
        raise ValueError("--piqd-poll-seconds must be positive")

    started = time.monotonic()
    search = ProductAntichainSearch(args.n, args.seed)
    iterations = (
        restore_resume(args.resume, search) if args.resume is not None else []
    )
    terminal: dict[str, object]

    for iteration in range(len(iterations) + 1, args.max_iterations + 1):
        elapsed = time.monotonic() - started
        remaining_ms = int((args.timeout_seconds - elapsed) * 1000)
        if remaining_ms <= 0:
            terminal = {"status": "WALL_BUDGET"}
            break
        outer_timeout_ms = min(args.solver_timeout_ms, remaining_ms)
        outer_oracle: dict[str, object]
        rows: Rows | None
        if args.outer_solver == "z3":
            search.outer.set(timeout=outer_timeout_ms)
            checked = search.outer.check()
            outer_status = str(checked).upper()
            outer_oracle = {"backend": "z3"}
            rows = (
                search.decode_rows(search.outer.model())
                if checked == z3.sat
                else None
            )
            if checked != z3.sat:
                outer_oracle["solver_statistics"] = str(search.outer.statistics())
            if checked == z3.unknown:
                outer_oracle["reason"] = search.outer.reason_unknown()
        else:
            outer_status, rows, outer_oracle = solve_outer_piqd(
                search,
                base_url=args.piqd_base_url,
                timeout_ms=outer_timeout_ms,
                poll_seconds=args.piqd_poll_seconds,
            )

        if outer_status == "UNSAT":
            terminal = {
                "status": (
                    "EXHAUSTIVE_SMALL_N_UNSAT_EXTERNAL_Z3"
                    if args.outer_solver == "z3"
                    else "EXHAUSTIVE_SMALL_N_UNSAT_EXTERNAL_PIQD_CADICAL"
                ),
                "outer_oracle": outer_oracle,
            }
            break
        if outer_status == "UNKNOWN":
            terminal = {
                "status": "OUTER_UNKNOWN",
                "reason": outer_oracle.get("reason"),
                "outer_oracle": outer_oracle,
            }
            break
        if outer_status != "SAT" or rows is None:
            raise AssertionError(f"unexpected outer oracle status: {outer_status}")

        remaining_ms = int((args.timeout_seconds - (time.monotonic() - started)) * 1000)
        if remaining_ms <= 0:
            terminal = {"status": "WALL_BUDGET", "last_rows": rows}
            break
        inner_status, pair_records, reason = search.find_pair_batch(
            rows,
            limit=args.batch_cuts,
            timeout_ms=min(args.solver_timeout_ms, remaining_ms),
        )
        added = 0
        for record in pair_records:
            support = frozenset(
                tuple(arc) for arc in record["changed_support"]  # type: ignore[arg-type]
            )
            certificate = record["cut_certificate"]
            assert isinstance(certificate, dict)
            added += search.add_support_cut(support, certificate)
        iteration_record = {
            "iteration": iteration,
            "outer_rows_sha256": canonical_sha256(rows),
            "inner_status": inner_status,
            "pairs_found": len(pair_records),
            "cuts_added": added,
            "total_cuts": len(search.learned_supports),
            "outer_oracle": outer_oracle,
            "smallest_support": min(
                (int(record["support_size"]) for record in pair_records),
                default=None,
            ),
            "largest_support": max(
                (int(record["support_size"]) for record in pair_records),
                default=None,
            ),
        }
        iterations.append(iteration_record)
        print(
            json.dumps({"event": "iteration", **iteration_record}, sort_keys=True),
            file=sys.stderr,
            flush=True,
        )
        if args.checkpoint_output is not None:
            atomic_write_json(
                args.checkpoint_output,
                checkpoint_payload(
                    search,
                    iterations,
                    seed=args.seed,
                    outer_solver=args.outer_solver,
                    elapsed_seconds=time.monotonic() - started,
                ),
            )
        if inner_status == "UNKNOWN":
            terminal = {
                "status": "INNER_UNKNOWN",
                "reason": reason,
                "rows": rows,
            }
            break
        if not pair_records:
            replay = exhaustive_replay(args.n, rows, search.intervals)
            if replay["status"] != "FULL_PRODUCT_ANTICHAIN_VERIFIED":
                terminal = {
                    "status": "INVARIANT_FAILURE",
                    "reason": "inner UNSAT disagrees with exhaustive replay",
                    "rows": rows,
                    "replay": replay,
                }
            else:
                row_payload = {str(center): list(row) for center, row in rows.items()}
                terminal = {
                    "status": "REPLAYED_FULL_PRODUCT_ANTICHAIN_COUNTEREXAMPLE",
                    "rows": row_payload,
                    "rows_sha256": canonical_sha256(row_payload),
                    "replay": replay,
                }
            break
        if added == 0:
            terminal = {
                "status": "INVARIANT_FAILURE",
                "reason": "comparable pairs produced no new outer cut",
                "rows": rows,
            }
            break
    else:
        terminal = {"status": "MAX_ITERATIONS"}

    print(
        json.dumps(
            {
                "event": "terminal",
                "elapsed_seconds": time.monotonic() - started,
                **terminal,
            },
            sort_keys=True,
            default=str,
        ),
        file=sys.stderr,
        flush=True,
    )

    if args.checkpoint_output is not None:
        atomic_write_json(
            args.checkpoint_output,
            checkpoint_payload(
                search,
                iterations,
                seed=args.seed,
                outer_solver=args.outer_solver,
                elapsed_seconds=time.monotonic() - started,
                terminal=terminal,
            ),
        )

    dimacs = (
        write_dimacs(args.dimacs_output, search)
        if args.dimacs_output is not None
        else None
    )
    payload = {
        "schema": "p97-full-four-row-product-antichain-cegar-v1",
        "epistemic_status": (
            "EXACT_REPLAY_IF_COUNTEREXAMPLE_EXTERNAL_Z3_IF_UNSAT"
            if args.outer_solver == "z3"
            else "EXACT_REPLAY_IF_COUNTEREXAMPLE_EXTERNAL_PIQD_CADICAL_IF_UNSAT"
        ),
        "n": args.n,
        "seed": args.seed,
        "outer_solver": args.outer_solver,
        "resumed_from": str(args.resume) if args.resume is not None else None,
        "strong_connectivity": True,
        "pair_alternation": True,
        "row_cardinality": 4,
        "interval_count": len(search.intervals),
        "alternation_clause_count": search.alternation_clause_count,
        "connectivity_clause_count": search.connectivity_clause_count,
        "iterations_completed": len(iterations),
        "learned_comparable_support_cuts": len(search.learned_supports),
        "cut_certificate_bank_sha256": canonical_sha256(search.cut_certificates),
        "cut_certificates": search.cut_certificates,
        "dimacs": dimacs,
        "elapsed_seconds": time.monotonic() - started,
        "iteration_log": iterations,
        "terminal": terminal,
    }
    if args.output is not None:
        atomic_write_json(args.output, payload)
        print(
            json.dumps(
                {
                    "artifact": str(args.output),
                    "iterations_completed": len(iterations),
                    "learned_comparable_support_cuts": len(search.learned_supports),
                    "n": args.n,
                    "terminal_status": terminal["status"],
                },
                sort_keys=True,
            )
        )
    else:
        print(json.dumps(payload, indent=2, sort_keys=True) + "\n", end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
