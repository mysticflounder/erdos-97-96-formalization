#!/usr/bin/env python3
"""Revalidate and close the current corrected survivor stream ordinally.

The input checkpoint's MARCO cuts and producer-bank annotations are ignored.
Only its raw row/blocker assignments are replayed against the current
``robust-all-center-cegar`` surface and verifier.  The resulting validated
records are then checked for:

* the direct two-row shared-middle-pair schema;
* cycles using the two orientations already represented by production
  ``ATailOrdinalKalmansonCycle``; and
* orientation-complete ordinal cycles, as a regression cross-check.

Every saved cycle is independently replayed as an integer Farkas sum after
quotienting unordered distance terms by selected-row equalities.  Exact LRA
is deliberately reserved for ordinal residuals.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict, deque
from dataclasses import dataclass
import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from typing import Any, Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CURRENT_CHECKPOINT = (
    ROOT / "scratch/atail-force/kalmanson-bank-cegar/coverage_checkpoint.json"
)
OLD_101_CHECKPOINT = (
    ROOT / "scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json"
)
STALE_ROUND_TWO = (
    ROOT / "census/atail_force/producer_pattern_census_round2_checkpoint.json"
)
ROBUST_SEARCH = (
    ROOT / "scratch/atail-force/robust-all-center-cegar/search.py"
)
DEFAULT_VALIDATED = HERE / "validated_survivors.json"
DEFAULT_COVERAGE = HERE / "coverage.json"

EXPECTED_CURRENT_SHA256 = (
    "9cb50339e32eeff34171a706edaec58ac26e21a5b9b1466ef2864e2bd6a7f652"
)
EXPECTED_OLD_101_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
EXPECTED_ORDER = (
    "O", "t1", "I", "F", "A", "X", "Y", "Z", "D", "J", "E", "C", "G", "K"
)

Edge = tuple[str, str]


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def canonical_sha256(value: object) -> str:
    rendered = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(rendered.encode()).hexdigest()


def atomic_json(path: Path, value: object) -> None:
    rendered = json.dumps(value, indent=2, sort_keys=True) + "\n"
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(rendered, encoding="utf-8")
    temporary.replace(path)


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
        if self.parent[value] != value:
            self.parent[value] = self.find(self.parent[value])
        return self.parent[value]

    def union(self, left: int, right: int) -> None:
        left = self.find(left)
        right = self.find(right)
        if left != right:
            self.parent[right] = left


@dataclass(frozen=True)
class Inequality:
    kind: str
    quadruple: tuple[str, str, str, str]
    left: tuple[Edge, Edge]
    right: tuple[Edge, Edge]


@dataclass(frozen=True)
class Step:
    smaller: int
    larger: int
    inequality: Inequality
    left_index: int
    right_index: int
    row_center: str
    constructor: str

    def key(self) -> tuple[object, ...]:
        return (
            self.constructor,
            self.inequality.quadruple,
            self.row_center,
            self.left_index,
            self.right_index,
            self.smaller,
            self.larger,
        )


CONSTRUCTOR = {
    ("K1", 0, 0): "k1CancelA",
    ("K1", 1, 0): "k1CancelB",
    ("K1", 0, 1): "k1CancelC",
    ("K1", 1, 1): "k1CancelD",
    ("K2", 0, 0): "k2CancelA",
    ("K2", 1, 1): "k2CancelB",
    ("K2", 0, 1): "k2CancelC",
    ("K2", 1, 0): "k2CancelD",
}
PRODUCTION_CONSTRUCTORS = frozenset({"k1CancelC", "k2CancelA"})


class EqualitySystem:
    def __init__(self, rows: Sequence[Mapping[str, object]]) -> None:
        self.order = EXPECTED_ORDER
        self.position = {label: index for index, label in enumerate(self.order)}
        self.edges = tuple(itertools.combinations(self.order, 2))
        self.edge_index = {edge: index for index, edge in enumerate(self.edges)}
        self.rows = {
            str(row["center"]): tuple(str(x) for x in row["support"])
            for row in rows
        }
        if set(self.rows) != set(self.order):
            raise ValueError("row-center carrier mismatch")

        quotient = DSU(len(self.edges))
        direct: dict[frozenset[int], set[str]] = defaultdict(set)
        for center, support in sorted(self.rows.items()):
            if len(support) != 4 or len(set(support)) != 4 or center in support:
                raise ValueError(f"invalid selected row at {center}")
            ids = [self.edge_id(center, point) for point in support]
            for edge_id in ids[1:]:
                quotient.union(ids[0], edge_id)
            for left, right in itertools.combinations(ids, 2):
                direct[frozenset({left, right})].add(center)

        raw_components: dict[int, list[int]] = defaultdict(list)
        for edge_id in range(len(self.edges)):
            raw_components[quotient.find(edge_id)].append(edge_id)
        self.components = tuple(sorted(
            (tuple(sorted(items)) for items in raw_components.values()),
            key=lambda items: items[0],
        ))
        self.edge_class = [0] * len(self.edges)
        for class_id, items in enumerate(self.components):
            for edge_id in items:
                self.edge_class[edge_id] = class_id
        self.direct = {
            pair: tuple(sorted(centers)) for pair, centers in direct.items()
        }

    def edge(self, left: str, right: str) -> Edge:
        if left == right:
            raise ValueError("distance edge has equal endpoints")
        return ((left, right) if self.position[left] < self.position[right]
                else (right, left))

    def edge_id(self, left: str, right: str) -> int:
        return self.edge_index[self.edge(left, right)]

    def class_of(self, edge: Edge) -> int:
        return self.edge_class[self.edge_id(*edge)]

    def representative(self, class_id: int) -> Edge:
        return self.edges[self.components[class_id][0]]

    def class_edges(self, class_id: int) -> tuple[Edge, ...]:
        return tuple(self.edges[index] for index in self.components[class_id])

    def direct_centers(self, left: Edge, right: Edge) -> tuple[str, ...]:
        return self.direct.get(
            frozenset({self.edge_id(*left), self.edge_id(*right)}), ()
        )

    def equality_path(self, left: Edge, right: Edge) -> list[dict[str, object]]:
        start = self.edge_id(*left)
        target = self.edge_id(*right)
        if self.edge_class[start] != self.edge_class[target]:
            raise ValueError("equality path crosses classes")
        if start == target:
            return []
        adjacency: dict[int, list[tuple[int, str]]] = defaultdict(list)
        for pair, centers in self.direct.items():
            ends = tuple(pair)
            if len(ends) != 2:
                continue
            a, b = ends
            for center in centers:
                adjacency[a].append((b, center))
                adjacency[b].append((a, center))
        parent: dict[int, tuple[int, str] | None] = {start: None}
        pending: deque[int] = deque([start])
        while pending and target not in parent:
            current = pending.popleft()
            for neighbor, center in sorted(adjacency[current]):
                if neighbor not in parent:
                    parent[neighbor] = (current, center)
                    pending.append(neighbor)
        if target not in parent:
            raise AssertionError("quotient equality lacks selected-row path")
        result = []
        cursor = target
        while cursor != start:
            previous = parent[cursor]
            assert previous is not None
            prior, center = previous
            result.append({
                "left_edge": list(self.edges[prior]),
                "right_edge": list(self.edges[cursor]),
                "row_center": center,
                "row_support": list(self.rows[center]),
            })
            cursor = prior
        return list(reversed(result))


def inequalities(system: EqualitySystem) -> Iterable[Inequality]:
    for indices in itertools.combinations(range(len(system.order)), 4):
        a, b, c, d = (system.order[index] for index in indices)
        left = (system.edge(a, c), system.edge(b, d))
        yield Inequality(
            "K1", (a, b, c, d), left,
            (system.edge(a, b), system.edge(c, d)),
        )
        yield Inequality(
            "K2", (a, b, c, d), left,
            (system.edge(a, d), system.edge(b, c)),
        )


def reduced(system: EqualitySystem, inequality: Inequality) -> dict[int, int]:
    coefficients: dict[int, int] = defaultdict(int)
    for edge in inequality.left:
        coefficients[system.class_of(edge)] += 1
    for edge in inequality.right:
        coefficients[system.class_of(edge)] -= 1
    return {key: value for key, value in coefficients.items() if value}


def strict_steps(system: EqualitySystem) -> dict[tuple[int, int], Step]:
    result: dict[tuple[int, int], Step] = {}
    for inequality in inequalities(system):
        for left_index in (0, 1):
            for right_index in (0, 1):
                centers = system.direct_centers(
                    inequality.left[left_index], inequality.right[right_index]
                )
                if not centers:
                    continue
                smaller = system.class_of(inequality.right[1 - right_index])
                larger = system.class_of(inequality.left[1 - left_index])
                constructor = CONSTRUCTOR[
                    (inequality.kind, left_index, right_index)
                ]
                expected_center = inequality.quadruple[
                    {"k1CancelA": 0, "k1CancelB": 1, "k1CancelC": 2,
                     "k1CancelD": 3, "k2CancelA": 0, "k2CancelB": 1,
                     "k2CancelC": 2, "k2CancelD": 3}[constructor]
                ]
                if expected_center not in centers:
                    raise AssertionError("cancellation center/orientation mismatch")
                step = Step(
                    smaller, larger, inequality, left_index, right_index,
                    expected_center, constructor,
                )
                expected = {} if smaller == larger else {smaller: -1, larger: 1}
                if reduced(system, inequality) != expected:
                    raise AssertionError("ordinal reduction has extra terms")
                key = (smaller, larger)
                step_score = (
                    step.constructor not in PRODUCTION_CONSTRUCTORS,
                    step.key(),
                )
                old_score = (
                    result[key].constructor not in PRODUCTION_CONSTRUCTORS,
                    result[key].key(),
                ) if key in result else None
                if old_score is None or step_score < old_score:
                    result[key] = step
    return result


def shortest_cycle(
    relations: Mapping[tuple[int, int], Step]
) -> tuple[Step, ...] | None:
    loops = tuple((step,) for (a, b), step in relations.items() if a == b)
    if loops:
        return min(loops, key=lambda cycle: cycle[0].key())
    pairs = []
    for (a, b), step in relations.items():
        reverse = relations.get((b, a))
        if reverse is not None and a < b:
            pairs.append((step, reverse))
    if pairs:
        return min(pairs, key=lambda cycle: tuple(step.key() for step in cycle))

    adjacency: dict[int, list[tuple[int, Step]]] = defaultdict(list)
    for (source, target), step in relations.items():
        adjacency[source].append((target, step))
    for source in adjacency:
        adjacency[source].sort(key=lambda item: (item[0], item[1].key()))
    best: tuple[Step, ...] | None = None
    for start in sorted(adjacency):
        parent: dict[int, tuple[int, Step] | None] = {start: None}
        pending: deque[int] = deque([start])
        while pending:
            current = pending.popleft()
            for target, step in adjacency[current]:
                if target == start:
                    reversed_path = [step]
                    cursor = current
                    while cursor != start:
                        previous = parent[cursor]
                        assert previous is not None
                        cursor, prior_step = previous
                        reversed_path.append(prior_step)
                    candidate = tuple(reversed(reversed_path))
                    if best is None or len(candidate) < len(best):
                        best = candidate
                    pending.clear()
                    break
                if target not in parent:
                    parent[target] = (current, step)
                    pending.append(target)
    return best


def direct_shared_middle_hits(system: EqualitySystem) -> list[dict[str, object]]:
    hits = []
    for ia, ib, ic, id in itertools.combinations(range(len(system.order)), 4):
        a, b, c, d = (system.order[index] for index in (ia, ib, ic, id))
        if {b, c} <= set(system.rows[a]) and {b, c} <= set(system.rows[d]):
            hits.append({
                "quadruple": [a, b, c, d],
                "endpoint_rows": [a, d],
                "shared_middle_pair": [b, c],
            })
    return hits


def cycle_json(system: EqualitySystem, cycle: Sequence[Step]) -> dict[str, object]:
    coefficient_sum: dict[int, int] = defaultdict(int)
    steps = []
    links = []
    for index, step in enumerate(cycle):
        for variable, coefficient in reduced(system, step.inequality).items():
            coefficient_sum[variable] += coefficient
        cancelled_left = step.inequality.left[step.left_index]
        cancelled_right = step.inequality.right[step.right_index]
        remaining_left = step.inequality.left[1 - step.left_index]
        remaining_right = step.inequality.right[1 - step.right_index]
        steps.append({
            "constructor": step.constructor,
            "inequality": step.inequality.kind,
            "cyclic_quadruple": list(step.inequality.quadruple),
            "row_center": step.row_center,
            "row_support": list(system.rows[step.row_center]),
            "cancelled_left_edge": list(cancelled_left),
            "cancelled_right_edge": list(cancelled_right),
            "remaining_left_edge": list(remaining_left),
            "remaining_right_edge": list(remaining_right),
            "smaller_class": step.smaller,
            "larger_class": step.larger,
        })
        following = cycle[(index + 1) % len(cycle)]
        next_right = following.inequality.right[1 - following.right_index]
        links.append({
            "from_edge": list(remaining_left),
            "to_edge": list(next_right),
            "selected_row_equality_path": system.equality_path(
                remaining_left, next_right
            ),
        })
    nonzero = {key: value for key, value in coefficient_sum.items() if value}
    if nonzero:
        raise AssertionError(f"integer Farkas replay failed: {nonzero}")
    if any(
        step.larger != cycle[(index + 1) % len(cycle)].smaller
        for index, step in enumerate(cycle)
    ):
        raise AssertionError("cycle endpoints do not compose")
    return {
        "length": len(cycle),
        "constructor_word": [step.constructor for step in cycle],
        "steps": steps,
        "links": links,
        "integer_farkas_replay": {
            "multipliers": [1] * len(cycle),
            "summed_coefficients": {},
            "normalized_rhs": len(cycle),
            "contradiction": f"0 >= {len(cycle)}",
            "status": "PASS",
        },
    }


def dihedral_surface_automorphisms(robust: Any) -> list[dict[str, object]]:
    caps = (robust.SURPLUS_CAP, robust.OPP_CAP_1, robust.OPP_CAP_2)
    fixed = {robust.FIRST_APEX, robust.SECOND_APEX, robust.Q, robust.W}
    order = EXPECTED_ORDER
    answer = []
    for reflected in (False, True):
        for shift in range(len(order)):
            image_indices = [
                ((shift - index) % len(order) if reflected
                 else (shift + index) % len(order))
                for index in range(len(order))
            ]
            mapping = dict(zip(order, (order[index] for index in image_indices)))
            if any(mapping[label] != label for label in fixed):
                continue
            if any({mapping[label] for label in cap} != set(cap) for cap in caps):
                continue
            if {mapping[label] for label in robust.FIRST_APEX_CLASS} != set(
                robust.FIRST_APEX_CLASS
            ):
                continue
            answer.append({"reflected": reflected, "shift": shift, "map": mapping})
    return answer


def normalized_named_rows(
    rows: Sequence[Mapping[str, object]]
) -> list[dict[str, object]]:
    position = {label: index for index, label in enumerate(EXPECTED_ORDER)}
    return [
        {
            "center": str(row["center"]),
            "support": sorted((str(x) for x in row["support"]), key=position.get),
            "candidate_index": int(row["candidate_index"]),
            "exact_from_blocker_image": bool(row["exact_from_blocker_image"]),
        }
        for row in sorted(rows, key=lambda row: position[str(row["center"])])
    ]


def run() -> tuple[dict[str, object], dict[str, object]]:
    checkpoint_sha = file_sha256(CURRENT_CHECKPOINT)
    if checkpoint_sha != EXPECTED_CURRENT_SHA256:
        raise RuntimeError(
            f"current checkpoint hash drift: {checkpoint_sha}; update pin explicitly"
        )
    if file_sha256(OLD_101_CHECKPOINT) != EXPECTED_OLD_101_SHA256:
        raise RuntimeError("old 101-prefix checkpoint hash drift")
    payload = json.loads(CURRENT_CHECKPOINT.read_text(encoding="utf-8"))
    old_payload = json.loads(OLD_101_CHECKPOINT.read_text(encoding="utf-8"))
    survivors = payload["structural_survivors"]
    old_survivors = old_payload["structural_survivors"]
    if survivors[:101] != old_survivors:
        raise RuntimeError("reported 101 are not the exact current-stream prefix")
    if len(survivors) != 143:
        raise RuntimeError("current stream count drift")

    current_source_hashes = {
        relative: file_sha256(ROOT / relative)
        for relative in sorted(payload["source_sha256"])
    }
    if current_source_hashes != payload["source_sha256"]:
        raise RuntimeError("authoritative checkpoint source hash drift")

    robust = load_module(ROBUST_SEARCH, "p97_current_survivor_surface")
    if tuple(robust.HULL_NAMES) != EXPECTED_ORDER:
        raise RuntimeError("current cyclic-order drift")
    surface = robust.Surface()
    automorphisms = dihedral_surface_automorphisms(robust)
    if len(automorphisms) != 1 or automorphisms[0]["map"] != dict(
        zip(EXPECTED_ORDER, EXPECTED_ORDER)
    ):
        raise RuntimeError("distinguished surface gained a nontrivial symmetry")

    validated_records = []
    coverage_records = []
    production_lengths: Counter[int] = Counter()
    complete_lengths: Counter[int] = Counter()
    constructor_words: Counter[tuple[str, ...]] = Counter()
    constructor_steps: Counter[str] = Counter()
    direct_hit_records = 0
    seen_pairs: dict[tuple[str, str], int] = {}
    duplicates = []

    for ordinal, survivor in enumerate(survivors, start=1):
        stored_rows = survivor["rows"]
        stored_blockers = survivor["blockers"]
        if canonical_sha256(stored_rows) != survivor["row_assignment_sha256"]:
            raise RuntimeError(f"row hash drift at record {ordinal}")
        if canonical_sha256(stored_blockers) != survivor["blocker_assignment_sha256"]:
            raise RuntimeError(f"blocker hash drift at record {ordinal}")

        blockers = {
            surface.by_name[source]: surface.by_name[center]
            for source, center in stored_blockers.items()
        }
        exact_centers = set(blockers.values())
        lean_rows = []
        for row in stored_rows:
            center = surface.by_name[row["center"]]
            support = frozenset(surface.by_name[label] for label in row["support"])
            candidate_index = int(row["candidate_index"])
            if support != surface.candidates[center][candidate_index]:
                raise RuntimeError(f"candidate/support drift at record {ordinal}")
            expected_exact = center in exact_centers
            if bool(row["exact_from_blocker_image"]) != expected_exact:
                raise RuntimeError(f"blocker exactness drift at record {ordinal}")
            lean_rows.append(robust.shadow.ClassRow(
                f"current-replay:{center}", center, support, exact=expected_exact
            ))
        ok, reason = surface.verify_model(tuple(lean_rows), blockers)
        if not ok:
            raise RuntimeError(f"current structural replay {ordinal} failed: {reason}")

        rows = normalized_named_rows(stored_rows)
        system = EqualitySystem(rows)
        direct_hits = direct_shared_middle_hits(system)
        direct_hit_records += bool(direct_hits)
        relations = strict_steps(system)
        complete_cycle = shortest_cycle(relations)
        production_relations = {
            pair: step for pair, step in relations.items()
            if step.constructor in PRODUCTION_CONSTRUCTORS
        }
        production_cycle = shortest_cycle(production_relations)
        if complete_cycle is None or production_cycle is None:
            raise RuntimeError(f"ordinal residual at record {ordinal}")
        complete_lengths[len(complete_cycle)] += 1
        production_lengths[len(production_cycle)] += 1
        production_json = cycle_json(system, production_cycle)
        complete_json = cycle_json(system, complete_cycle)
        word = tuple(production_json["constructor_word"])
        constructor_words[word] += 1
        constructor_steps.update(word)

        pair_hash = (
            survivor["row_assignment_sha256"],
            survivor["blocker_assignment_sha256"],
        )
        duplicate_of = seen_pairs.get(pair_hash)
        if duplicate_of is None:
            seen_pairs[pair_hash] = ordinal
        else:
            duplicates.append({"record": ordinal, "duplicate_of": duplicate_of})
        normalized_blockers = {
            source: stored_blockers[source]
            for source in EXPECTED_ORDER
        }
        validated_records.append({
            "record": ordinal,
            "iteration": survivor["iteration"],
            "row_assignment_sha256": survivor["row_assignment_sha256"],
            "blocker_assignment_sha256": survivor["blocker_assignment_sha256"],
            "duplicate_of": duplicate_of,
            "rows": rows,
            "blockers": normalized_blockers,
            "current_surface_verify_model": "PASS",
        })
        coverage_records.append({
            "record": ordinal,
            "row_assignment_sha256": survivor["row_assignment_sha256"],
            "direct_shared_middle_pair_hits": direct_hits,
            "production_cycle": production_json,
            "orientation_complete_shortest_cycle": complete_json,
        })

    validated = {
        "schema": "p97-atail-current-validated-survivor-stream-v1",
        "epistemic_status": (
            "EXACT_REPLAY_OF_STORED_FIXED_14_ROLE_ASSIGNMENTS_AGAINST_CURRENT_"
            "STRUCTURAL_VERIFIER; NOT_LIVE_PARENT_COVERAGE"
        ),
        "source_checkpoint": {
            "path": str(CURRENT_CHECKPOINT.relative_to(ROOT)),
            "sha256": checkpoint_sha,
            "status": payload["status"],
            "stored_records": len(survivors),
            "unique_row_blocker_assignments": len(seen_pairs),
            "source_sha256": current_source_hashes,
        },
        "reported_101_prefix": {
            "path": str(OLD_101_CHECKPOINT.relative_to(ROOT)),
            "sha256": EXPECTED_OLD_101_SHA256,
            "exact_prefix_of_current_stream": True,
        },
        "excluded_artifacts": [{
            "path": str(STALE_ROUND_TWO.relative_to(ROOT)),
            "sha256": file_sha256(STALE_ROUND_TWO),
            "reason": "known stale selection-id round-two checkpoint; not read",
        }],
        "ignored_checkpoint_fields": [
            "bank_cuts", "selected_row_bank_matches",
            "blocker_exact_only_matches", "producer-bank minimality",
        ],
        "surface": {
            "profile": list(robust.PROFILE),
            "cyclic_order": list(EXPECTED_ORDER),
            "surplus_cap": sorted(robust.SURPLUS_CAP),
            "opposite_cap_1": sorted(robust.OPP_CAP_1),
            "opposite_cap_2": sorted(robust.OPP_CAP_2),
            "first_apex_full_radius_class": sorted(robust.FIRST_APEX_CLASS),
            "distinguished_dihedral_automorphisms": automorphisms,
            "symmetry_conclusion": "identity only",
        },
        "duplicates": duplicates,
        "records": validated_records,
    }

    coverage = {
        "schema": "p97-atail-current-survivor-ordinal-kalmanson-coverage-v1",
        "epistemic_status": {
            "finite_result": "EXACT_WITHIN_VALIDATED_FIXED_14_ROLE_STREAM",
            "lean_consumer": "KERNEL_CHECKED_GENERIC_CONSUMER",
            "parent_extraction": "NOT_PROVED",
            "full_linear_phase": "NOT_RUN_NO_ORDINAL_RESIDUALS",
        },
        "validated_survivors_sha256": canonical_sha256(validated),
        "encoding": {
            "distance_terms": "unordered boundary pairs",
            "row_equalities": "four center-to-support terms per selected row",
            "strict_inequalities": "both Kalmanson inequalities per increasing quadruple",
            "production_step_constructors": sorted(PRODUCTION_CONSTRUCTORS),
            "production_consumer": (
                "Problem97.ATailOrdinalKalmansonCycle.false_of_transGen_cycle"
            ),
            "equality_links": "explicit selected-row paths between quotient terms",
            "certificate": "unit integer Farkas sum of strict cycle",
        },
        "summary": {
            "stored_records": len(survivors),
            "unique_records": len(seen_pairs),
            "reported_101_prefix_records": 101,
            "current_surface_replays": len(validated_records),
            "direct_shared_middle_pair_records": direct_hit_records,
            "production_ordinal_killed": sum(production_lengths.values()),
            "production_ordinal_residuals": len(survivors) - sum(production_lengths.values()),
            "production_cycle_length_distribution": {
                str(length): count for length, count in sorted(production_lengths.items())
            },
            "orientation_complete_cycle_length_distribution": {
                str(length): count for length, count in sorted(complete_lengths.items())
            },
            "production_constructor_word_distribution": {
                "+".join(word): count for word, count in sorted(constructor_words.items())
            },
            "production_constructor_step_distribution": dict(sorted(constructor_steps.items())),
            "exact_lra_records_run": 0,
            "exact_lra_reason": "ordinal residual set empty",
        },
        "records": coverage_records,
    }
    return validated, coverage


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--validated", type=Path, default=DEFAULT_VALIDATED)
    parser.add_argument("--coverage", type=Path, default=DEFAULT_COVERAGE)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    validated, coverage = run()
    if args.check:
        if json.loads(args.validated.read_text(encoding="utf-8")) != validated:
            raise SystemExit("validated survivor artifact drift")
        if json.loads(args.coverage.read_text(encoding="utf-8")) != coverage:
            raise SystemExit("coverage artifact drift")
    else:
        atomic_json(args.validated, validated)
        atomic_json(args.coverage, coverage)
    print(json.dumps(coverage["summary"], sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
