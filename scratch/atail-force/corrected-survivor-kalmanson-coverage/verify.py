#!/usr/bin/env python3
"""Independent semantic replay of current survivor coverage artifacts."""

from __future__ import annotations

from collections import Counter, defaultdict
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
VALIDATED = HERE / "validated_survivors.json"
COVERAGE = HERE / "coverage.json"
CHECKPOINT = ROOT / "scratch/atail-force/kalmanson-bank-cegar/coverage_checkpoint.json"
ROBUST_SEARCH = ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
ORDER = (
    "O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K"
)
EXPECTED_CHECKPOINT_SHA256 = (
    "9cb50339e32eeff34171a706edaec58ac26e21a5b9b1466ef2864e2bd6a7f652"
)
ALLOWED_CONSTRUCTORS = frozenset({"k1CancelC", "k2CancelA"})


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    rendered = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(rendered.encode()).hexdigest()


def load_module(path: Path, name: str) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


class DSU:
    def __init__(self, size: int) -> None:
        self.parent = list(range(size))

    def find(self, value: int) -> int:
        while self.parent[value] != value:
            self.parent[value] = self.parent[self.parent[value]]
            value = self.parent[value]
        return value

    def union(self, left: int, right: int) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[right] = left


class Quotient:
    def __init__(self, rows: Sequence[Mapping[str, object]]) -> None:
        self.position = {label: index for index, label in enumerate(ORDER)}
        self.edges = tuple(itertools.combinations(ORDER, 2))
        self.edge_index = {edge: index for index, edge in enumerate(self.edges)}
        self.supports = {
            str(row["center"]): set(str(x) for x in row["support"])
            for row in rows
        }
        quotient = DSU(len(self.edges))
        for center, support in self.supports.items():
            ids = [self.edge_id(center, point) for point in support]
            for edge_id in ids[1:]:
                quotient.union(ids[0], edge_id)
        components: dict[int, list[int]] = defaultdict(list)
        for index in range(len(self.edges)):
            components[quotient.find(index)].append(index)
        ordered = sorted(
            (tuple(sorted(items)) for items in components.values()),
            key=lambda items: items[0],
        )
        self.classes = [0] * len(self.edges)
        for class_id, items in enumerate(ordered):
            for index in items:
                self.classes[index] = class_id

    def edge(self, endpoints: Sequence[str]) -> tuple[str, str]:
        left, right = endpoints
        return ((left, right) if self.position[left] < self.position[right]
                else (right, left))

    def edge_id(self, left: str, right: str) -> int:
        return self.edge_index[self.edge((left, right))]

    def class_of(self, endpoints: Sequence[str]) -> int:
        return self.classes[self.edge_index[self.edge(endpoints)]]


def expected_terms(kind: str, quadruple: Sequence[str]) -> tuple[list[list[str]], list[list[str]]]:
    a, b, c, d = quadruple
    left = [[a, c], [b, d]]
    if kind == "K1":
        return left, [[a, b], [c, d]]
    if kind == "K2":
        return left, [[a, d], [b, c]]
    raise AssertionError("unknown inequality")


def row_proves_equality(
    quotient: Quotient, center: str, left: Sequence[str], right: Sequence[str]
) -> None:
    left = quotient.edge(left)
    right = quotient.edge(right)
    if center not in left or center not in right:
        raise AssertionError("cited equality edges do not share row center")
    left_other = left[0] if left[1] == center else left[1]
    right_other = right[0] if right[1] == center else right[1]
    if {left_other, right_other} - quotient.supports[center]:
        raise AssertionError("cited row support does not prove equality")


def direct_shared_middle_count(quotient: Quotient) -> int:
    count = 0
    for ia, ib, ic, id in itertools.combinations(range(len(ORDER)), 4):
        a, b, c, d = (ORDER[index] for index in (ia, ib, ic, id))
        count += int(
            {b, c} <= quotient.supports[a]
            and {b, c} <= quotient.supports[d]
        )
    return count


def verify_cycle(
    quotient: Quotient, cycle: Mapping[str, object]
) -> tuple[int, tuple[str, ...]]:
    steps = cycle["steps"]
    links = cycle["links"]
    assert isinstance(steps, list) and isinstance(links, list)
    if len(steps) != cycle["length"] or len(links) != len(steps):
        raise AssertionError("cycle length drift")
    coefficient_sum: dict[int, int] = defaultdict(int)
    strict_pairs = []
    constructors = []
    remaining_left_edges = []
    remaining_right_edges = []
    for step in steps:
        constructor = str(step["constructor"])
        if constructor not in ALLOWED_CONSTRUCTORS:
            raise AssertionError("cycle uses non-production constructor")
        constructors.append(constructor)
        quadruple = list(step["cyclic_quadruple"])
        if [quotient.position[x] for x in quadruple] != sorted(
            quotient.position[x] for x in quadruple
        ):
            raise AssertionError("quadruple is not increasing")
        expected_left, expected_right = expected_terms(str(step["inequality"]), quadruple)
        cancelled_left = list(step["cancelled_left_edge"])
        cancelled_right = list(step["cancelled_right_edge"])
        remaining_left = list(step["remaining_left_edge"])
        remaining_right = list(step["remaining_right_edge"])
        if quotient.edge(cancelled_left) not in [quotient.edge(x) for x in expected_left]:
            raise AssertionError("cancelled left term drift")
        if quotient.edge(cancelled_right) not in [quotient.edge(x) for x in expected_right]:
            raise AssertionError("cancelled right term drift")
        if quotient.edge(remaining_left) not in [quotient.edge(x) for x in expected_left]:
            raise AssertionError("remaining left term drift")
        if quotient.edge(remaining_right) not in [quotient.edge(x) for x in expected_right]:
            raise AssertionError("remaining right term drift")
        row_proves_equality(
            quotient, str(step["row_center"]), cancelled_left, cancelled_right
        )
        if quotient.class_of(cancelled_left) != quotient.class_of(cancelled_right):
            raise AssertionError("cancelled terms differ in equality quotient")
        smaller = quotient.class_of(remaining_right)
        larger = quotient.class_of(remaining_left)
        if smaller != step["smaller_class"] or larger != step["larger_class"]:
            raise AssertionError("stored strict classes drift")
        strict_pairs.append((smaller, larger))
        remaining_left_edges.append(remaining_left)
        remaining_right_edges.append(remaining_right)
        for edge in expected_left:
            coefficient_sum[quotient.class_of(edge)] += 1
        for edge in expected_right:
            coefficient_sum[quotient.class_of(edge)] -= 1

        if constructor == "k1CancelC":
            if str(step["inequality"]) != "K1" or str(step["row_center"]) != quadruple[2]:
                raise AssertionError("k1CancelC orientation drift")
        elif constructor == "k2CancelA":
            if str(step["inequality"]) != "K2" or str(step["row_center"]) != quadruple[0]:
                raise AssertionError("k2CancelA orientation drift")

    if any(
        strict_pairs[index][1] != strict_pairs[(index + 1) % len(strict_pairs)][0]
        for index in range(len(strict_pairs))
    ):
        raise AssertionError("strict comparisons do not compose cyclically")
    if {key: value for key, value in coefficient_sum.items() if value}:
        raise AssertionError("integer Farkas coefficients do not cancel")

    for index, link in enumerate(links):
        if quotient.edge(link["from_edge"]) != quotient.edge(remaining_left_edges[index]):
            raise AssertionError("link source edge drift")
        following = (index + 1) % len(links)
        if quotient.edge(link["to_edge"]) != quotient.edge(remaining_right_edges[following]):
            raise AssertionError("link target edge drift")
        cursor = quotient.edge(link["from_edge"])
        for equality in link["selected_row_equality_path"]:
            if quotient.edge(equality["left_edge"]) != cursor:
                raise AssertionError("equality path is discontinuous")
            row_proves_equality(
                quotient, str(equality["row_center"]),
                equality["left_edge"], equality["right_edge"],
            )
            cursor = quotient.edge(equality["right_edge"])
        if cursor != quotient.edge(link["to_edge"]):
            raise AssertionError("equality path misses target")

    replay = cycle["integer_farkas_replay"]
    if replay != {
        "multipliers": [1] * len(steps),
        "summed_coefficients": {},
        "normalized_rhs": len(steps),
        "contradiction": f"0 >= {len(steps)}",
        "status": "PASS",
    }:
        raise AssertionError("stored Farkas replay drift")
    return len(steps), tuple(constructors)


def main() -> int:
    if file_sha256(CHECKPOINT) != EXPECTED_CHECKPOINT_SHA256:
        raise SystemExit("current checkpoint hash drift")
    validated = json.loads(VALIDATED.read_text(encoding="utf-8"))
    coverage = json.loads(COVERAGE.read_text(encoding="utf-8"))
    checkpoint = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    if coverage["validated_survivors_sha256"] != canonical_sha256(validated):
        raise SystemExit("coverage/validated binding drift")
    if not (
        len(validated["records"]) == len(coverage["records"]) == 143
    ):
        raise SystemExit("record count drift")

    robust = load_module(ROBUST_SEARCH, "p97_independent_survivor_verify")
    surface = robust.Surface()
    lengths: Counter[int] = Counter()
    words: Counter[tuple[str, ...]] = Counter()
    direct_hits = 0
    for ordinal, (record, certificate, raw) in enumerate(zip(
        validated["records"], coverage["records"], checkpoint["structural_survivors"]
    ), start=1):
        if record["record"] != ordinal or certificate["record"] != ordinal:
            raise SystemExit("record ordinal drift")
        if record["row_assignment_sha256"] != raw["row_assignment_sha256"]:
            raise SystemExit("row hash binding drift")
        if record["blocker_assignment_sha256"] != raw["blocker_assignment_sha256"]:
            raise SystemExit("blocker hash binding drift")

        blockers = {
            surface.by_name[source]: surface.by_name[center]
            for source, center in record["blockers"].items()
        }
        exact_centers = set(blockers.values())
        lean_rows = []
        for row in record["rows"]:
            center = surface.by_name[row["center"]]
            support = frozenset(surface.by_name[x] for x in row["support"])
            index = int(row["candidate_index"])
            if support != surface.candidates[center][index]:
                raise SystemExit("current candidate/support replay drift")
            if bool(row["exact_from_blocker_image"]) != (center in exact_centers):
                raise SystemExit("current blocker exactness replay drift")
            lean_rows.append(robust.shadow.ClassRow(
                f"independent:{center}", center, support,
                exact=center in exact_centers,
            ))
        ok, reason = surface.verify_model(tuple(lean_rows), blockers)
        if not ok:
            raise SystemExit(f"current structural replay failed: {reason}")

        quotient = Quotient(record["rows"])
        direct_hits += direct_shared_middle_count(quotient)
        length, word = verify_cycle(quotient, certificate["production_cycle"])
        lengths[length] += 1
        words[word] += 1

    summary = coverage["summary"]
    if not (direct_hits == summary["direct_shared_middle_pair_records"] == 0):
        raise SystemExit("direct shared-pair count drift")
    if {str(k): v for k, v in sorted(lengths.items())} != summary[
        "production_cycle_length_distribution"
    ]:
        raise SystemExit("cycle length distribution drift")
    if {"+".join(k): v for k, v in sorted(words.items())} != summary[
        "production_constructor_word_distribution"
    ]:
        raise SystemExit("constructor word distribution drift")
    if not (sum(lengths.values()) == summary["production_ordinal_killed"] == 143):
        raise SystemExit("production coverage count drift")
    if summary["production_ordinal_residuals"] != 0:
        raise SystemExit("unexpected ordinal residual")
    print(json.dumps({
        "checkpoint_sha256": EXPECTED_CHECKPOINT_SHA256,
        "current_surface_replays": 143,
        "direct_shared_middle_pair_hits": direct_hits,
        "production_cycles_replayed": sum(lengths.values()),
        "cycle_length_distribution": dict(sorted(lengths.items())),
        "integer_farkas_replays": sum(lengths.values()),
        "status": "PASS",
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
