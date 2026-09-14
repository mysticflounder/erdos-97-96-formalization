"""Retained card-six alias and exact structural screen for B1 Wave 6.

This module enumerates the source-audited 16-role equality surface, quotients
only by the installed order-16 symmetry, and applies exact unordered-edge
closure checks.  Its metric mode is a bounded five-orbit QF_NRA canary, not a
full survivor launch.  Card-five trace branches are outside this contract.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import shutil
import subprocess
import time
from collections.abc import Iterable, Iterator, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

SCHEMA = "b1-wave6-card6-alias-screen/v1"
ORBIT_SCHEMA = "b1-wave6-card6-alias-orbit/v1"
ROOT = Path("scratch/runs/b1-normalform-order-20260831/wave-6")
ARTIFACTS = ROOT / "artifacts"
EVENTS = ROOT / "events"
RESULT_PATH = ARTIFACTS / "b1-wave6-card6-alias-screen-result.json"
ORBITS_PATH = ARTIFACTS / "alias-orbits.jsonl"
PHASE0_EVENT_PATH = EVENTS / "phase0-census.json"
STRUCTURAL_EVENT_PATH = EVENTS / "exact-structural-screen.json"
SOURCE_COPY_PATH = ARTIFACTS / "executed-source" / Path(__file__).name
CHECKSUMS_PATH = ARTIFACTS / "SHA256SUMS"
CANARY_V1_ROOT = ARTIFACTS / "metric-canary"
CANARY_ROOT = ARTIFACTS / "metric-canary-v2"
CANARY_RESULT_PATH = CANARY_ROOT / "result.json"
CANARY_CASES_PATH = CANARY_ROOT / "cases.jsonl"
CANARY_EVENT_PATH = EVENTS / "metric-canary-v2.json"
CANARY_SOURCE_COPY_PATH = CANARY_ROOT / "executed-source" / Path(__file__).name
CANARY_CHECKSUMS_PATH = CANARY_ROOT / "SHA256SUMS"

ROLES = (
    "A",
    "d1",
    "d2",
    "u0",
    "u1",
    "v0",
    "v1",
    "Bc",
    "Bu",
    "Bv",
    "c0",
    "c1",
    "uL",
    "uR",
    "vL",
    "vR",
)
ROLE_INDEX = {role: index for index, role in enumerate(ROLES)}
PHYSICAL = ("d1", "d2", "u0", "u1", "v0", "v1")
PHYSICAL_ORDER = PHYSICAL
BLOCKERS = ("Bc", "Bu", "Bv")
COMPLETIONS = ("c0", "c1", "uL", "uR", "vL", "vR")
ROWS = (
    ("Bc", ("d1", "d2", "c0", "c1")),
    ("Bu", ("u0", "u1", "uL", "uR")),
    ("Bv", ("v0", "v1", "vL", "vR")),
)
CIRCLE_FAMILIES = (("A", PHYSICAL), *ROWS)
LOCAL_ROW_SCHEMAS = (
    ("Bc", "d1", "d2", "c0", "c1"),
    ("Bu", "u0", "u1", "uL", "uR"),
    ("Bv", "v0", "v1", "vL", "vR"),
)

EXPECTED = {
    "inequality_edges": 78,
    "symmetry_order": 16,
    "partitions": 94_381,
    "orbits": 7_287,
    "duplicate_center_partition_hits": 11_776,
    "duplicate_center_orbit_hits": 829,
    "duplicate_center_survivor_partitions": 82_605,
    "duplicate_center_survivor_orbits": 6_458,
    "duplicate_center_survivor_digest": (
        "c97af327af7f63dd7f9a1dfb0006a889193ee9eede56c79b290da8e5c77d93cf"
    ),
}

ENDPOINT_SHADOW_PREMISES = frozenset(
    {
        "common_A_unit_circle",
        "strict_convex_position",
        "directed_local_order_A_P_B_Q",
        "pair_bisector_center",
        "distinct_physical_K6",
        "consecutive_physical_endpoint_pair",
    }
)

SIX_POINT_FIVE_KERNELS = {
    "SixPointFiveCircleCollisionCoreA": (
        ("OA_OB", "O", "A", "B"),
        ("AO_AB", "A", "O", "B"),
        ("AO_AC", "A", "O", "C"),
        ("AO_AE", "A", "O", "E"),
        ("CB_CE", "C", "B", "E"),
        ("CB_CF", "C", "B", "F"),
        ("EO_EC", "E", "O", "C"),
        ("EO_EF", "E", "O", "F"),
        ("FO_FA", "F", "O", "A"),
    ),
    "SixPointFiveCircleCollisionCoreB": (
        ("AO_AB", "A", "O", "B"),
        ("AO_AE", "A", "O", "E"),
        ("BO_BA", "B", "O", "A"),
        ("BO_BC", "B", "O", "C"),
        ("BO_BF", "B", "O", "F"),
        ("EO_EB", "E", "O", "B"),
        ("CO_CF", "C", "O", "F"),
        ("FA_FE", "F", "A", "E"),
        ("FA_FC", "F", "A", "C"),
    ),
    "SixPointFiveCircleCollisionCoreC": (
        ("AO_AB", "A", "O", "B"),
        ("AO_AE", "A", "O", "E"),
        ("AO_AC", "A", "O", "C"),
        ("BO_BA", "B", "O", "A"),
        ("BO_BF", "B", "O", "F"),
        ("EB_EC", "E", "B", "C"),
        ("EB_EF", "E", "B", "F"),
        ("CO_CE", "C", "O", "E"),
        ("FA_FE", "F", "A", "E"),
    ),
}


def canonical_json_bytes(value: Any) -> bytes:
    return (
        json.dumps(
            value,
            ensure_ascii=True,
            sort_keys=True,
            separators=(",", ":"),
        ).encode("utf-8")
        + b"\n"
    )


def sha256_bytes(value: bytes) -> str:
    return hashlib.sha256(value).hexdigest()


def sha256_path(path: Path) -> str:
    return sha256_bytes(path.read_bytes())


def build_inequality_edges() -> tuple[tuple[int, int], ...]:
    edges: set[tuple[int, int]] = set()

    def add(first: str, second: str) -> None:
        left, right = sorted((ROLE_INDEX[first], ROLE_INDEX[second]))
        assert left != right
        edges.add((left, right))

    for first, second in itertools.combinations(PHYSICAL, 2):
        add(first, second)
    for role in (*PHYSICAL, *BLOCKERS):
        add("A", role)
    for first, second in itertools.combinations(BLOCKERS, 2):
        add(first, second)
    for completion in COMPLETIONS:
        for physical in PHYSICAL:
            add(completion, physical)
    for blocker, supports in ROWS:
        for completion in supports[2:]:
            add(completion, blocker)
        for physical in supports[:2]:
            add(blocker, physical)
        add(supports[2], supports[3])
    result = tuple(sorted(edges))
    assert len(result) == EXPECTED["inequality_edges"]
    return result


INEQUALITY_EDGES = build_inequality_edges()
INEQUALITY_PREDECESSORS = tuple(
    frozenset(left for left, right in INEQUALITY_EDGES if right == index)
    for index in range(len(ROLES))
)


def normalize_rgs(labels: Sequence[int]) -> tuple[int, ...]:
    relabel: dict[int, int] = {}
    result = []
    for label in labels:
        if label not in relabel:
            relabel[label] = len(relabel)
        result.append(relabel[label])
    return tuple(result)


def rgs_token(labels: Sequence[int]) -> str:
    digits = "0123456789abcdef"
    normalized = normalize_rgs(labels)
    assert max(normalized, default=0) < len(digits)
    return "".join(digits[label] for label in normalized)


def enumerate_partitions() -> Iterator[tuple[int, ...]]:
    labels = [-1] * len(ROLES)
    blocks: list[list[int]] = []

    def visit(index: int) -> Iterator[tuple[int, ...]]:
        if index == len(ROLES):
            yield tuple(labels)
            return
        forbidden = INEQUALITY_PREDECESSORS[index]
        for block_index, members in enumerate(blocks):
            if any(member in forbidden for member in members):
                continue
            labels[index] = block_index
            members.append(index)
            yield from visit(index + 1)
            members.pop()
        labels[index] = len(blocks)
        blocks.append([index])
        yield from visit(index + 1)
        blocks.pop()
        labels[index] = -1

    yield from visit(0)


Permutation = tuple[int, ...]


def named_swap(*pairs: tuple[str, str]) -> Permutation:
    result = list(range(len(ROLES)))
    for left, right in pairs:
        left_index = ROLE_INDEX[left]
        right_index = ROLE_INDEX[right]
        result[left_index], result[right_index] = right_index, left_index
    return tuple(result)


SYMMETRY_GENERATORS = (
    named_swap(("c0", "c1")),
    named_swap(("uL", "uR")),
    named_swap(("vL", "vR")),
    named_swap(
        ("u0", "v0"),
        ("u1", "v1"),
        ("Bu", "Bv"),
        ("uL", "vL"),
        ("uR", "vR"),
    ),
)


def compose(first: Permutation, second: Permutation) -> Permutation:
    return tuple(first[second[index]] for index in range(len(ROLES)))


def symmetry_group() -> tuple[Permutation, ...]:
    identity = tuple(range(len(ROLES)))
    group = {identity}
    frontier = [identity]
    while frontier:
        current = frontier.pop()
        for generator in SYMMETRY_GENERATORS:
            candidate = compose(generator, current)
            if candidate not in group:
                group.add(candidate)
                frontier.append(candidate)
    result = tuple(sorted(group))
    assert len(result) == EXPECTED["symmetry_order"]
    return result


SYMMETRY_GROUP = symmetry_group()


def act(labels: Sequence[int], permutation: Permutation) -> tuple[int, ...]:
    moved = [-1] * len(ROLES)
    for old_index, label in enumerate(labels):
        moved[permutation[old_index]] = label
    return normalize_rgs(moved)


def orbit_images(labels: Sequence[int]) -> tuple[tuple[int, ...], ...]:
    return tuple(sorted({act(labels, permutation) for permutation in SYMMETRY_GROUP}))


def canonical_orbit(labels: Sequence[int]) -> tuple[int, ...]:
    return min(orbit_images(labels))


class DisjointSet:
    def __init__(self, size: int):
        self.parent = list(range(size))
        self.rank = [0] * size

    def find(self, item: int) -> int:
        while self.parent[item] != item:
            self.parent[item] = self.parent[self.parent[item]]
            item = self.parent[item]
        return item

    def union(self, left: int, right: int) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root == right_root:
            return
        if self.rank[left_root] < self.rank[right_root]:
            left_root, right_root = right_root, left_root
        self.parent[right_root] = left_root
        if self.rank[left_root] == self.rank[right_root]:
            self.rank[left_root] += 1


@dataclass(frozen=True)
class EdgeClosure:
    class_count: int
    pairs: tuple[tuple[int, int], ...]
    pair_index: dict[tuple[int, int], int]
    dsu: DisjointSet
    family_roots: tuple[tuple[str, int, frozenset[int]], ...]

    def root(self, first: int, second: int) -> int:
        edge = tuple(sorted((first, second)))
        return self.dsu.find(self.pair_index[edge])


def quotient_class(labels: Sequence[int], role: str) -> int:
    return labels[ROLE_INDEX[role]]


def edge_closure(labels: Sequence[int]) -> EdgeClosure:
    class_count = max(labels) + 1
    pairs = tuple(
        (first, second)
        for first in range(class_count)
        for second in range(first, class_count)
    )
    pair_index = {pair: index for index, pair in enumerate(pairs)}
    dsu = DisjointSet(len(pairs))
    family_edges: list[tuple[str, int, frozenset[int], tuple[int, ...]]] = []
    for center_role, support_roles in CIRCLE_FAMILIES:
        center = quotient_class(labels, center_role)
        supports = frozenset(quotient_class(labels, role) for role in support_roles)
        edges = tuple(
            pair_index[tuple(sorted((center, support)))] for support in supports
        )
        assert edges
        for edge in edges[1:]:
            dsu.union(edges[0], edge)
        family_edges.append((center_role, center, supports, edges))
    family_roots = tuple(
        (center_role, center, supports)
        for center_role, center, supports, _edges in family_edges
    )
    return EdgeClosure(class_count, pairs, pair_index, dsu, family_roots)


def local_words() -> tuple[tuple[str, ...], ...]:
    words = []
    for tail in itertools.permutations(("x", "B", "y", "L", "R")):
        if tail.index("x") < tail.index("B") < tail.index("y"):
            words.append(("A", *tail))
    result = tuple(sorted(words))
    assert len(result) == 20
    return result


LOCAL_WORDS = local_words()


def mapped_local_sequence(
    labels: Sequence[int],
    word: Sequence[str],
    row: tuple[str, str, str, str, str],
) -> tuple[int, ...]:
    blocker, first, second, left, right = row
    mapping = {
        "A": "A",
        "x": first,
        "B": blocker,
        "y": second,
        "L": left,
        "R": right,
    }
    return tuple(quotient_class(labels, mapping[role]) for role in word)


Reachability = tuple[int, ...]


def add_precedence_edge(
    reachability: Reachability, first: int, second: int
) -> Reachability | None:
    if first == second or ((reachability[second] >> first) & 1):
        return None
    descendants = reachability[second] | (1 << second)
    if reachability[first] & descendants == descendants:
        return reachability
    result = list(reachability)
    predecessors = [
        index
        for index in range(len(result))
        if index == first or ((reachability[index] >> first) & 1)
    ]
    for predecessor in predecessors:
        result[predecessor] |= descendants
    return tuple(result)


def add_precedence_sequence(
    reachability: Reachability, sequence: Sequence[int]
) -> Reachability | None:
    result: Reachability | None = reachability
    for first, second in itertools.pairwise(sequence):
        assert result is not None
        result = add_precedence_edge(result, first, second)
        if result is None:
            return None
    return result


def local_order_mask(labels: Sequence[int]) -> tuple[int, int, str, str]:
    """Return feasible count, little-endian mask bytes, and two digests."""
    class_count = max(labels) + 1
    empty = (0,) * class_count
    mapped = tuple(
        tuple(mapped_local_sequence(labels, word, row) for word in LOCAL_WORDS)
        for row in LOCAL_ROW_SCHEMAS
    )
    mask = 0
    feasible = 0
    first_states = [add_precedence_sequence(empty, sequence) for sequence in mapped[0]]
    for first_index, first_state in enumerate(first_states):
        if first_state is None:
            continue
        for second_index, second_sequence in enumerate(mapped[1]):
            second_state = add_precedence_sequence(first_state, second_sequence)
            if second_state is None:
                continue
            for third_index, third_sequence in enumerate(mapped[2]):
                if add_precedence_sequence(second_state, third_sequence) is None:
                    continue
                bit = (first_index * 20 + second_index) * 20 + third_index
                mask |= 1 << bit
                feasible += 1
    mask_bytes = mask.to_bytes(1000, "little")
    return feasible, mask, mask_bytes.hex(), sha256_bytes(mask_bytes)


def decode_type_index(index: int) -> tuple[int, int, int]:
    assert 0 <= index < 8_000
    first, remainder = divmod(index, 400)
    second, third = divmod(remainder, 20)
    return first, second, third


def deterministic_topological_order(reachability: Reachability) -> tuple[int, ...]:
    remaining = set(range(len(reachability)))
    result: list[int] = []
    while remaining:
        available = [
            item
            for item in remaining
            if all(
                item == predecessor
                or not ((reachability[predecessor] >> item) & 1)
                for predecessor in remaining
            )
        ]
        assert available
        selected = min(available)
        remaining.remove(selected)
        result.append(selected)
    return tuple(result)


def metric_order_choice(
    labels: Sequence[int], mask_hex_le: str
) -> tuple[int, tuple[int, int, int], tuple[int, ...]] | None:
    """Pick the first row-type triple compatible with the physical base order."""
    mask = int.from_bytes(bytes.fromhex(mask_hex_le), "little")
    class_count = max(labels) + 1
    base = add_precedence_sequence(
        (0,) * class_count,
        tuple(quotient_class(labels, role) for role in ("A", *PHYSICAL_ORDER)),
    )
    assert base is not None
    while mask:
        least_bit = mask & -mask
        type_index = least_bit.bit_length() - 1
        indices = decode_type_index(type_index)
        state: Reachability | None = base
        for row, word_index in zip(LOCAL_ROW_SCHEMAS, indices, strict=True):
            assert state is not None
            state = add_precedence_sequence(
                state, mapped_local_sequence(labels, LOCAL_WORDS[word_index], row)
            )
            if state is None:
                break
        if state is not None:
            return type_index, indices, deterministic_topological_order(state)
        mask ^= least_bit
    return None


def class_members(labels: Sequence[int]) -> tuple[tuple[str, ...], ...]:
    members = [[] for _ in range(max(labels) + 1)]
    for role, label in zip(ROLES, labels, strict=True):
        members[label].append(role)
    return tuple(tuple(group) for group in members)


def qf_nra_problem(
    labels: Sequence[int], boundary_order: Sequence[int]
) -> tuple[Any, tuple[Any, ...], dict[str, Any]]:
    """Build the exact quotient-coordinate problem and its encoded/omitted ledger."""
    import z3

    class_count = max(labels) + 1
    points = tuple(
        (z3.Real(f"x_{index}"), z3.Real(f"y_{index}"))
        for index in range(class_count)
    )

    def distance_sq(first: int, second: int) -> Any:
        dx = points[first][0] - points[second][0]
        dy = points[first][1] - points[second][1]
        return dx * dx + dy * dy

    def area(first: int, second: int, third: int) -> Any:
        return (points[second][0] - points[first][0]) * (
            points[third][1] - points[first][1]
        ) - (points[second][1] - points[first][1]) * (
            points[third][0] - points[first][0]
        )

    solver = z3.SolverFor("QF_NRA")
    assertion_blocks: dict[str, int] = {}

    def add_block(name: str, assertions: Sequence[Any]) -> None:
        solver.add(*assertions)
        assertion_blocks[name] = len(assertions)

    a_class = quotient_class(labels, "A")
    d1_class = quotient_class(labels, "d1")
    add_block(
        "gauge",
        (
            points[a_class][0] == 0,
            points[a_class][1] == 0,
            points[d1_class][0] == 1,
            points[d1_class][1] == 0,
        ),
    )
    add_block(
        "quotient_class_distinctness",
        tuple(
            distance_sq(first, second) > 0
            for first, second in itertools.combinations(range(class_count), 2)
        ),
    )
    add_block(
        "strict_convex_boundary_order",
        tuple(
            area(boundary_order[first], boundary_order[second], boundary_order[third])
            > 0
            for first, second, third in itertools.combinations(
                range(class_count), 3
            )
        ),
    )
    physical_classes = {
        quotient_class(labels, role) for role in PHYSICAL
    }
    common_circle = []
    for point_class in range(class_count):
        equality = distance_sq(a_class, point_class) == 1
        common_circle.append(
            equality if point_class in physical_classes else z3.Not(equality)
        )
    add_block("exact_common_unit_circle_support", tuple(common_circle))

    row_circle: list[Any] = []
    bisectors: list[Any] = []
    for blocker_role, support_roles in ROWS:
        blocker = quotient_class(labels, blocker_role)
        first = quotient_class(labels, support_roles[0])
        second = quotient_class(labels, support_roles[1])
        support_classes = {
            quotient_class(labels, role) for role in support_roles
        }
        radius = distance_sq(blocker, first)
        row_circle.append(radius > 0)
        bisector_classes = {a_class, blocker}
        for point_class in range(class_count):
            circle_equality = distance_sq(blocker, point_class) == radius
            row_circle.append(
                circle_equality
                if point_class in support_classes
                else z3.Not(circle_equality)
            )
            bisector_equality = (
                distance_sq(point_class, first)
                == distance_sq(point_class, second)
            )
            bisectors.append(
                bisector_equality
                if point_class in bisector_classes
                else z3.Not(bisector_equality)
            )
    add_block("exact_four_row_circle_supports", tuple(row_circle))
    add_block("exact_endpoint_bisector_supports", tuple(bisectors))
    variables = tuple(coordinate for point in points for coordinate in point)
    ledger = {
        "logic": "QF_NRA",
        "coordinate_quotient_classes": class_count,
        "boundary_order_classes": list(boundary_order),
        "boundary_order_roles": [list(class_members(labels)[item]) for item in boundary_order],
        "assertion_blocks": assertion_blocks,
        "assertion_count": sum(assertion_blocks.values()),
        "encoded": [
            "exact alias quotient with distinct quotient-class coordinates",
            "A=(0,0), d1=(1,0) Euclidean gauge",
            "strict convexity in one source-compatible boundary order",
            "exact common unit-circle support",
            "three exact-four row-circle supports",
            "exact A/blocker endpoint-bisector supports",
        ],
        "omitted": [
            "other feasible local-order triples for the same alias orbit",
            "all non-canary structural survivor orbits",
        ],
        "claim_boundary": (
            "one deterministic order leaf only; SAT is a candidate realization, "
            "UNSAT does not classify the orbit"
        ),
    }
    return solver, variables, ledger


def smt2_source(solver: Any) -> str:
    return f"(set-logic QF_NRA)\n{solver.sexpr()}\n(check-sat)\n"


def run_smt_engine(engine: str, source: str, timeout_seconds: int) -> dict[str, Any]:
    executable = shutil.which(engine)
    if executable is None:
        return {"status": "unavailable", "returncode": None, "elapsed_seconds": 0}
    command = (
        [executable, "-smt2", "-in", f"-T:{timeout_seconds}"]
        if engine == "z3"
        else [
            executable,
            "--lang=smt2",
            "--nl-cov",
            f"--tlimit-per={timeout_seconds * 1000}",
        ]
    )
    started = time.monotonic()
    try:
        process = subprocess.run(
            command,
            input=source,
            text=True,
            capture_output=True,
            check=False,
            timeout=timeout_seconds + 5,
        )
    except subprocess.TimeoutExpired as error:
        return {
            "status": "timeout",
            "returncode": None,
            "elapsed_seconds": round(time.monotonic() - started, 6),
            "stdout": error.stdout or "",
            "stderr": error.stderr or "",
        }
    lines = [line.strip() for line in process.stdout.splitlines() if line.strip()]
    combined_output = f"{process.stdout}\n{process.stderr}".lower()
    verdict = next(
        (line for line in lines if line in {"sat", "unsat", "unknown", "timeout"}),
        None,
    )
    status = "error" if "error" in combined_output else (verdict or "error")
    return {
        "status": status,
        "returncode": process.returncode,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "stdout": process.stdout,
        "stderr": process.stderr,
        "command": [Path(command[0]).name, *command[1:]],
    }


def exact_z3_model_substitution(
    solver: Any, variables: Sequence[Any], timeout_seconds: int
) -> dict[str, Any]:
    import z3

    solver.set(timeout=timeout_seconds * 1000)
    verdict = solver.check()
    if verdict != z3.sat:
        return {"status": str(verdict), "performed": False}
    model = solver.model()
    failed = []
    for index, assertion in enumerate(solver.assertions()):
        if not z3.is_true(model.eval(assertion, model_completion=True)):
            failed.append(index)
    values = {
        str(variable): str(model.eval(variable, model_completion=True))
        for variable in variables
    }
    return {
        "status": "pass" if not failed else "fail",
        "performed": True,
        "exact_z3_values": values,
        "assertions_checked": len(solver.assertions()),
        "failed_assertion_indices": failed,
        "method": "exact Z3 algebraic model evaluation against fresh assertions",
    }


def malformed_smt_controls(timeout_seconds: int = 5) -> dict[str, Any]:
    malformed = "(set-logic QF_NRA)\n(assert (= 0))\n(check-sat)\n"
    controls = {}
    for engine in ("z3", "cvc5"):
        receipt = run_smt_engine(engine, malformed, timeout_seconds)
        text = f"{receipt.get('stdout', '')}\n{receipt.get('stderr', '')}".lower()
        controls[engine] = {
            "status": receipt["status"],
            "returncode": receipt["returncode"],
            "passed": receipt["status"] not in {"sat", "unsat"} and "error" in text,
        }
    return controls


def duplicate_center_witness(
    labels: Sequence[int],
) -> dict[str, Any] | None:
    closure = edge_closure(labels)
    points = range(closure.class_count)
    for first_center in points:
        for second_center in range(first_center + 1, closure.class_count):
            buckets: dict[tuple[int, int], list[int]] = {}
            for point in points:
                signature = (
                    closure.root(first_center, point),
                    closure.root(second_center, point),
                )
                buckets.setdefault(signature, []).append(point)
            for signature, common_points in sorted(buckets.items()):
                if len(common_points) >= 3:
                    return {
                        "centers": [first_center, second_center],
                        "points": common_points[:3],
                        "closure_roots": list(signature),
                    }
    return None


def exact_edge_conflict(labels: Sequence[int]) -> dict[str, Any] | None:
    closure = edge_closure(labels)
    for center_role, center, supports in closure.family_roots:
        positive_root = closure.root(center, min(supports))
        for point in range(closure.class_count):
            if point in supports:
                continue
            if closure.root(center, point) == positive_root:
                return {
                    "center_role": center_role,
                    "center_class": center,
                    "off_support_class": point,
                    "positive_support_classes": sorted(supports),
                    "closure_root": positive_root,
                }
    return None


def six_point_five_witness(
    labels: Sequence[int],
    kernel: str,
    *,
    closure: EdgeClosure | None = None,
    relation_indexes: tuple[
        dict[tuple[int, int], frozenset[int]],
        dict[tuple[int, int], frozenset[int]],
    ]
    | None = None,
) -> dict[str, Any] | None:
    """Search one installed SixPointFive core field-for-field.

    The only explicit inequality in each installed Lean structure is hAE.
    Variables other than A and E therefore may denote the same quotient label.
    """
    constraints = SIX_POINT_FIVE_KERNELS[kernel]
    if closure is None:
        closure = edge_closure(labels)
    variables = ("O", "A", "B", "C", "E", "F")
    assignment: dict[str, int] = {}
    points = tuple(range(closure.class_count))

    def same(center: int, first: int, second: int) -> bool:
        return closure.root(center, first) == closure.root(center, second)

    if relation_indexes is None:
        same_centers = {
            (first, second): frozenset(
                center for center in points if same(center, first, second)
            )
            for first in points
            for second in points
        }
        same_points = {
            (center, first): frozenset(
                second for second in points if same(center, first, second)
            )
            for center in points
            for first in points
        }
    else:
        same_centers, same_points = relation_indexes
    degrees = {
        variable: sum(
            variable in (center, first, second)
            for _field, center, first, second in constraints
        )
        for variable in variables
    }

    def candidates(variable: str) -> tuple[int, ...]:
        allowed = set(points)
        if variable == "A" and "E" in assignment:
            allowed.discard(assignment["E"])
        if variable == "E" and "A" in assignment:
            allowed.discard(assignment["A"])
        for _field, center_name, first_name, second_name in constraints:
            names = (center_name, first_name, second_name)
            if variable not in names:
                continue
            if center_name == variable:
                if first_name in assignment and second_name in assignment:
                    allowed.intersection_update(
                        same_centers[(assignment[first_name], assignment[second_name])]
                    )
            elif center_name in assignment:
                other_name = second_name if first_name == variable else first_name
                if other_name in assignment:
                    allowed.intersection_update(
                        same_points[(assignment[center_name], assignment[other_name])]
                    )
        return tuple(sorted(allowed))

    def fully_assigned_constraints_hold() -> bool:
        if "A" in assignment and "E" in assignment and assignment["A"] == assignment["E"]:
            return False
        return all(
            same(assignment[center], assignment[first], assignment[second])
            for _field, center, first, second in constraints
            if center in assignment and first in assignment and second in assignment
        )

    def search() -> bool:
        if len(assignment) == len(variables):
            return fully_assigned_constraints_hold()
        domains = [
            (candidates(variable), variable)
            for variable in variables
            if variable not in assignment
        ]
        domain, variable = min(
            domains,
            key=lambda item: (len(item[0]), -degrees[item[1]], item[1]),
        )
        for value in domain:
            assignment[variable] = value
            if fully_assigned_constraints_hold() and search():
                return True
            del assignment[variable]
        return False

    if not search():
        return None
    return {
        "kernel": kernel,
        "embedding_policy": "FIELD_EXACT_NONINJECTIVE_ALLOWED",
        "assignment": {variable: assignment[variable] for variable in variables},
        "hAE": assignment["A"] != assignment["E"],
        "fields": {
            field: {
                "left": [assignment[center], assignment[first]],
                "right": [assignment[center], assignment[second]],
                "closure_root": closure.root(
                    assignment[center], assignment[first]
                ),
            }
            for field, center, first, second in constraints
        },
    }


def installed_kernel_hits(labels: Sequence[int]) -> tuple[dict[str, Any], ...]:
    closure = edge_closure(labels)
    points = tuple(range(closure.class_count))

    def same(center: int, first: int, second: int) -> bool:
        return closure.root(center, first) == closure.root(center, second)

    relation_indexes = (
        {
            (first, second): frozenset(
                center for center in points if same(center, first, second)
            )
            for first in points
            for second in points
        },
        {
            (center, first): frozenset(
                second for second in points if same(center, first, second)
            )
            for center in points
            for first in points
        },
    )
    return tuple(
        witness
        for kernel in SIX_POINT_FIVE_KERNELS
        if (
            witness := six_point_five_witness(
                labels,
                kernel,
                closure=closure,
                relation_indexes=relation_indexes,
            )
        )
        is not None
    )


def token_representative_digest(
    tokens: Iterable[str], *, trailing_newline: bool = True
) -> str:
    body = "\n".join(sorted(tokens)).encode("ascii")
    if trailing_newline:
        body += b"\n"
    return sha256_bytes(body)


def csv_rgs_representative_digest(labels_rows: Iterable[Sequence[int]]) -> str:
    """Digest sorted RGS rows as comma-separated decimal integers plus newlines."""
    rows = sorted(tuple(labels) for labels in labels_rows)
    serialized = [",".join(str(label) for label in labels) for labels in rows]
    return sha256_bytes(("\n".join(serialized) + "\n").encode("ascii"))


@dataclass(frozen=True)
class OrbitRecord:
    labels: tuple[int, ...]
    token: str
    orbit_size: int
    duplicate_center: dict[str, Any] | None
    exact_edge_conflict: dict[str, Any] | None
    endpoint_shadow_conflict: dict[str, Any] | None
    installed_kernel_hits: tuple[dict[str, Any], ...]
    local_order_feasible_count: int | None
    local_order_mask_hex_le: str | None
    local_order_mask_sha256: str | None

    def json(self) -> dict[str, Any]:
        return {
            "schema": ORBIT_SCHEMA,
            "rgs": self.token,
            "labels": list(self.labels),
            "class_count": max(self.labels) + 1,
            "orbit_size": self.orbit_size,
            "duplicate_center": self.duplicate_center,
            "exact_edge_conflict": self.exact_edge_conflict,
            "endpoint_shadow_conflict": self.endpoint_shadow_conflict,
            "installed_kernel_hits": list(self.installed_kernel_hits),
            "local_order": None
            if self.local_order_feasible_count is None
            else {
                "type_triples": 8000,
                "feasible_count": self.local_order_feasible_count,
                "mask_encoding": "8000_BITS_LITTLE_ENDIAN_HEX",
                "mask_hex": self.local_order_mask_hex_le,
                "mask_sha256": self.local_order_mask_sha256,
            },
        }


def endpoint_shadow_witness(
    labels: Sequence[int],
    available_premises: frozenset[str] = ENDPOINT_SHADOW_PREMISES,
) -> dict[str, Any] | None:
    """Reject a blocker aliased to a foreign physical outside its endpoint arc.

    Under the named card-six metric packet, strict convexity and the common
    A-circle give B = k(P + Q), k > 1/2.  If B is itself a physical-class
    point, its direction lies strictly between P and Q on their open minor
    arc.  Every named row pair is consecutive in PHYSICAL_ORDER, so no foreign
    physical role can occupy that interval.  The returned receipt states every
    premise used; callers must not reuse this filter outside that packet.
    """
    if not ENDPOINT_SHADOW_PREMISES.issubset(available_premises):
        return None
    physical_class_role = {
        quotient_class(labels, role): role for role in PHYSICAL_ORDER
    }
    for blocker, support_roles in ROWS:
        blocker_class = quotient_class(labels, blocker)
        aliased_physical = physical_class_role.get(blocker_class)
        if aliased_physical is None:
            continue
        first, second = support_roles[:2]
        if aliased_physical in (first, second):
            # The 78-edge schema already excludes this branch.
            continue
        first_index = PHYSICAL_ORDER.index(first)
        second_index = PHYSICAL_ORDER.index(second)
        assert second_index == first_index + 1
        return {
            "blocker": blocker,
            "blocker_class": blocker_class,
            "aliased_physical": aliased_physical,
            "endpoint_pair": [first, second],
            "physical_order": list(PHYSICAL_ORDER),
            "open_interval_roles": [],
            "premise_status": {
                premise: premise in available_premises
                for premise in sorted(ENDPOINT_SHADOW_PREMISES)
            },
            "rule": "UNIT_BLOCKER_LIES_IN_OPEN_MINOR_ENDPOINT_ARC",
        }
    return None


def census() -> tuple[dict[str, Any], tuple[OrbitRecord, ...]]:
    representatives: dict[tuple[int, ...], None] = {}
    partition_count = 0
    for partition in enumerate_partitions():
        partition_count += 1
        representatives.setdefault(canonical_orbit(partition), None)
    assert partition_count == EXPECTED["partitions"]
    assert len(representatives) == EXPECTED["orbits"]

    records = []
    for labels in sorted(representatives):
        duplicate_center = duplicate_center_witness(labels)
        edge_conflict = exact_edge_conflict(labels)
        shadow_conflict = endpoint_shadow_witness(labels)
        kernel_hits = installed_kernel_hits(labels)
        local_order: tuple[int, int, str, str] | None = None
        if (
            duplicate_center is None
            and not kernel_hits
            and edge_conflict is None
            and shadow_conflict is None
        ):
            local_order = local_order_mask(labels)
        records.append(
            OrbitRecord(
                labels=labels,
                token=rgs_token(labels),
                orbit_size=len(orbit_images(labels)),
                duplicate_center=duplicate_center,
                exact_edge_conflict=edge_conflict,
                endpoint_shadow_conflict=shadow_conflict,
                installed_kernel_hits=kernel_hits,
                local_order_feasible_count=None if local_order is None else local_order[0],
                local_order_mask_hex_le=None if local_order is None else local_order[2],
                local_order_mask_sha256=None if local_order is None else local_order[3],
            )
        )
    assert sum(record.orbit_size for record in records) == partition_count
    duplicate_hits = [record for record in records if record.duplicate_center]
    duplicate_survivors = [record for record in records if not record.duplicate_center]
    duplicate_partition_hits = sum(record.orbit_size for record in duplicate_hits)
    duplicate_survivor_partitions = sum(
        record.orbit_size for record in duplicate_survivors
    )
    survivor_token_digest = token_representative_digest(
        record.token for record in duplicate_survivors
    )
    survivor_csv_digest = csv_rgs_representative_digest(
        record.labels for record in duplicate_survivors
    )

    assert len(duplicate_hits) == EXPECTED["duplicate_center_orbit_hits"]
    assert duplicate_partition_hits == EXPECTED["duplicate_center_partition_hits"]
    assert len(duplicate_survivors) == EXPECTED["duplicate_center_survivor_orbits"]
    assert (
        duplicate_survivor_partitions
        == EXPECTED["duplicate_center_survivor_partitions"]
    )
    assert survivor_csv_digest == EXPECTED["duplicate_center_survivor_digest"]

    kernel_hit_records = [record for record in records if record.installed_kernel_hits]
    kernel_hits_after_duplicate = [
        record for record in duplicate_survivors if record.installed_kernel_hits
    ]
    structural_kernel_survivors = [
        record for record in duplicate_survivors if not record.installed_kernel_hits
    ]
    duplicate_or_kernel_hits = [
        record
        for record in records
        if record.duplicate_center or record.installed_kernel_hits
    ]

    edge_hits = [
        record
        for record in structural_kernel_survivors
        if record.exact_edge_conflict
    ]
    exact_survivors = [
        record
        for record in structural_kernel_survivors
        if not record.exact_edge_conflict
    ]
    shadow_hits = [
        record for record in exact_survivors if record.endpoint_shadow_conflict
    ]
    shadow_survivors = [
        record for record in exact_survivors if not record.endpoint_shadow_conflict
    ]
    order_hits = [
        record
        for record in shadow_survivors
        if record.local_order_feasible_count == 0
    ]
    order_survivors = [
        record
        for record in shadow_survivors
        if record.local_order_feasible_count is not None
        and record.local_order_feasible_count > 0
    ]
    summary = {
        "schema": SCHEMA,
        "scope": {
            "physical_class_cardinality": 6,
            "card_five": "OUT_OF_SCOPE_SEPARATE_LANE",
            "roles": list(ROLES),
            "role_count": len(ROLES),
        },
        "spec": {
            "inequality_edges": len(INEQUALITY_EDGES),
            "inequality_edge_digest": sha256_bytes(
                canonical_json_bytes(
                    [[ROLES[left], ROLES[right]] for left, right in INEQUALITY_EDGES]
                )
            ),
            "symmetry_order": len(SYMMETRY_GROUP),
            "symmetry_generators": len(SYMMETRY_GENERATORS),
            "centered_edges": "UNORDERED_QUOTIENT_CLASS_PAIRS",
            "installed_kernels": [
                "DuplicateCenterCore",
                *SIX_POINT_FIVE_KERNELS,
            ],
        },
        "phase0": {
            "partitions": partition_count,
            "orbits": len(records),
            "orbit_size_sum": sum(record.orbit_size for record in records),
        },
        "duplicate_center": {
            "partition_hits": duplicate_partition_hits,
            "orbit_hits": len(duplicate_hits),
            "survivor_partitions": duplicate_survivor_partitions,
            "survivor_orbits": len(duplicate_survivors),
            "survivor_digest_csv_decimal_rgs_newline_v1": survivor_csv_digest,
            "survivor_digest_hex_rgs_newline_v1": survivor_token_digest,
        },
        "six_point_five_installed_kernels": {
            "translation": "FIELD_FOR_FIELD_FROM_INSTALLED_LEAN_STRUCTURES",
            "explicit_inequalities": ["hAE"],
            "matcher_policy": "FIELD_EXACT_NONINJECTIVE_CORE_LABELS_ALLOWED",
            "partition_hits": sum(record.orbit_size for record in kernel_hit_records),
            "orbit_hits": len(kernel_hit_records),
            "partition_hits_after_duplicate_center": sum(
                record.orbit_size for record in kernel_hits_after_duplicate
            ),
            "orbit_hits_after_duplicate_center": len(kernel_hits_after_duplicate),
            "duplicate_center_or_kernel_partition_hits": sum(
                record.orbit_size for record in duplicate_or_kernel_hits
            ),
            "duplicate_center_or_kernel_orbit_hits": len(duplicate_or_kernel_hits),
            "survivor_partitions": sum(
                record.orbit_size for record in structural_kernel_survivors
            ),
            "survivor_orbits": len(structural_kernel_survivors),
            "survivor_digest_hex_rgs_newline_v1": token_representative_digest(
                record.token for record in structural_kernel_survivors
            ),
            "survivor_digest_csv_decimal_rgs_newline_v1": (
                csv_rgs_representative_digest(
                    record.labels for record in structural_kernel_survivors
                )
            ),
            "representative_hits": [
                {
                    "rgs": record.token,
                    "orbit_size": record.orbit_size,
                    "duplicate_center": record.duplicate_center is not None,
                    "hits": list(record.installed_kernel_hits),
                }
                for record in kernel_hit_records[:3]
            ],
            "kernels": {
                kernel: {
                    "fields": [field for field, _center, _first, _second in constraints],
                    "field_equations": [
                        {
                            "field": field,
                            "center": center,
                            "first": first,
                            "second": second,
                            "equation": f"edge({center},{first})=edge({center},{second})",
                        }
                        for field, center, first, second in constraints
                    ],
                    "partition_hits": sum(
                        record.orbit_size
                        for record in records
                        if any(
                            hit["kernel"] == kernel
                            for hit in record.installed_kernel_hits
                        )
                    ),
                    "orbit_hits": sum(
                        1
                        for record in records
                        if any(
                            hit["kernel"] == kernel
                            for hit in record.installed_kernel_hits
                        )
                    ),
                    "partition_hits_after_duplicate_center": sum(
                        record.orbit_size
                        for record in duplicate_survivors
                        if any(
                            hit["kernel"] == kernel
                            for hit in record.installed_kernel_hits
                        )
                    ),
                    "orbit_hits_after_duplicate_center": sum(
                        1
                        for record in duplicate_survivors
                        if any(
                            hit["kernel"] == kernel
                            for hit in record.installed_kernel_hits
                        )
                    ),
                }
                for kernel, constraints in SIX_POINT_FIVE_KERNELS.items()
            },
        },
        "exact_edge_closure": {
            "partition_hits_after_installed_kernels": sum(
                record.orbit_size for record in edge_hits
            ),
            "orbit_hits_after_installed_kernels": len(edge_hits),
            "survivor_partitions": sum(
                record.orbit_size for record in exact_survivors
            ),
            "survivor_orbits": len(exact_survivors),
            "survivor_digest_hex_rgs_newline_v1": token_representative_digest(
                record.token for record in exact_survivors
            ),
            "survivor_digest_csv_decimal_rgs_newline_v1": (
                csv_rgs_representative_digest(record.labels for record in exact_survivors)
            ),
        },
        "endpoint_shadow": {
            "contract": "HYPOTHESIS_TAGGED_CARD_SIX_NAMED_METRIC_PACKET",
            "partition_hits_after_exact_edge_closure": sum(
                record.orbit_size for record in shadow_hits
            ),
            "orbit_hits_after_exact_edge_closure": len(shadow_hits),
            "survivor_partitions": sum(
                record.orbit_size for record in shadow_survivors
            ),
            "survivor_orbits": len(shadow_survivors),
            "survivor_digest_hex_rgs_newline_v1": token_representative_digest(
                record.token for record in shadow_survivors
            ),
            "survivor_digest_csv_decimal_rgs_newline_v1": (
                csv_rgs_representative_digest(record.labels for record in shadow_survivors)
            ),
            "representative_rejections": [
                {
                    "rgs": record.token,
                    "orbit_size": record.orbit_size,
                    "witness": record.endpoint_shadow_conflict,
                }
                for record in shadow_hits[:3]
            ],
            "no_premise_no_prune_control": all(
                endpoint_shadow_witness(record.labels, frozenset()) is None
                for record in shadow_hits[:32]
            ),
        },
        "local_order": {
            "local_words_per_row": len(LOCAL_WORDS),
            "type_triples_per_orbit": len(LOCAL_WORDS) ** len(LOCAL_ROW_SCHEMAS),
            "orientation": "SOURCE_DIRECTED_A_X_B_Y_NO_REFLECTION_QUOTIENT",
            "algorithm": "MEMOIZED_TRANSITIVE_CLOSURE_OVER_QUOTIENT_CLASSES",
            "partition_hits_after_endpoint_shadow": sum(
                record.orbit_size for record in order_hits
            ),
            "orbit_hits_after_endpoint_shadow": len(order_hits),
            "survivor_partitions": sum(
                record.orbit_size for record in order_survivors
            ),
            "survivor_orbits": len(order_survivors),
            "survivor_digest_hex_rgs_newline_v1": token_representative_digest(
                record.token for record in order_survivors
            ),
            "survivor_digest_csv_decimal_rgs_newline_v1": (
                csv_rgs_representative_digest(record.labels for record in order_survivors)
            ),
            "minimum_feasible_type_triples": min(
                record.local_order_feasible_count for record in order_survivors
            ),
            "maximum_feasible_type_triples": max(
                record.local_order_feasible_count for record in order_survivors
            ),
            "total_feasible_type_triples_over_orbits": sum(
                record.local_order_feasible_count for record in order_survivors
            ),
        },
        "metric_realization": "NOT_STARTED_STRUCTURAL_FREEZE_REQUIRED",
        "promotion_status": "CARD_SIX_DIAGNOSTIC_ONLY",
    }
    return summary, tuple(records)


def metric_canary_selection(
    records: Sequence[OrbitRecord],
) -> tuple[tuple[str, OrbitRecord, tuple[int, tuple[int, int, int], tuple[int, ...]]], ...]:
    compatible = [
        (record, choice)
        for record in records
        if record.local_order_feasible_count is not None
        and record.local_order_feasible_count > 0
        and record.local_order_mask_hex_le is not None
        and (choice := metric_order_choice(record.labels, record.local_order_mask_hex_le))
        is not None
    ]
    assert compatible
    selectors = (
        (
            "minimum_class_count",
            min(
                compatible,
                key=lambda item: (
                    max(item[0].labels) + 1,
                    item[0].local_order_feasible_count,
                    item[0].token,
                ),
            ),
        ),
        (
            "maximum_class_count",
            max(
                compatible,
                key=lambda item: (
                    max(item[0].labels) + 1,
                    -item[0].local_order_feasible_count,
                    tuple(-value for value in item[0].labels),
                ),
            ),
        ),
        (
            "minimum_feasible_type_count",
            min(
                compatible,
                key=lambda item: (
                    item[0].local_order_feasible_count,
                    max(item[0].labels) + 1,
                    item[0].token,
                ),
            ),
        ),
        (
            "maximum_feasible_type_count",
            max(
                compatible,
                key=lambda item: (
                    item[0].local_order_feasible_count,
                    -(max(item[0].labels) + 1),
                    tuple(-value for value in item[0].labels),
                ),
            ),
        ),
    )
    by_shape = sorted(
        compatible,
        key=lambda item: (
            max(item[0].labels) + 1,
            tuple(sorted(len(group) for group in class_members(item[0].labels))),
            item[0].local_order_feasible_count,
            item[0].token,
        ),
    )
    proposed = (*selectors, ("median_structural_shape", by_shape[len(by_shape) // 2]))
    selected: list[
        tuple[str, OrbitRecord, tuple[int, tuple[int, int, int], tuple[int, ...]]]
    ] = []
    seen = set()
    for reason, (record, choice) in proposed:
        if record.token in seen:
            continue
        seen.add(record.token)
        selected.append((reason, record, choice))
    for record, choice in by_shape:
        if len(selected) == 5:
            break
        if record.token not in seen:
            seen.add(record.token)
            selected.append(("deterministic_distinct_shape_fill", record, choice))
    assert len(selected) == 5
    return tuple(selected)


def solver_smoke_controls(timeout_seconds: int = 5) -> dict[str, Any]:
    cases = {
        "known_sat": (
            (
                "(set-logic QF_NRA)\n(declare-fun x () Real)\n"
                "(assert (= (* x x) 1))\n(check-sat)\n"
            ),
            "sat",
        ),
        "known_unsat": (
            (
                "(set-logic QF_NRA)\n(declare-fun x () Real)\n"
                "(assert (> x 0))\n(assert (< x 0))\n(check-sat)\n"
            ),
            "unsat",
        ),
    }
    return {
        engine: {
            name: {
                "expected": expected,
                "observed": (receipt := run_smt_engine(
                    engine, source, timeout_seconds
                ))["status"],
                "passed": receipt["status"] == expected,
            }
            for name, (source, expected) in cases.items()
        }
        for engine in ("z3", "cvc5")
    }


def solver_provenance() -> dict[str, Any]:
    result = {}
    for engine in ("z3", "cvc5"):
        executable = shutil.which(engine)
        if executable is None:
            result[engine] = {"available": False}
            continue
        version = subprocess.run(
            [executable, "--version"],
            text=True,
            capture_output=True,
            check=False,
            timeout=5,
        )
        result[engine] = {
            "available": True,
            "path": executable,
            "binary_sha256": sha256_path(Path(executable)),
            "version_first_line": version.stdout.splitlines()[0],
        }
    return result


def metric_canary_documents(timeout_seconds: int) -> dict[Path, bytes]:
    _summary, records = census()
    selection = metric_canary_selection(records)
    case_records = []
    documents: dict[Path, bytes] = {}
    for reason, record, choice in selection:
        type_index, type_indices, boundary_order = choice
        solver, variables, ledger = qf_nra_problem(record.labels, boundary_order)
        source = smt2_source(solver)
        z3_receipt = run_smt_engine("z3", source, timeout_seconds)
        cvc5_receipt = run_smt_engine("cvc5", source, timeout_seconds)
        substitution = (
            exact_z3_model_substitution(solver, variables, timeout_seconds)
            if z3_receipt["status"] == "sat"
            else {
                "performed": False,
                "status": "not-applicable",
                "reason": f"z3 CLI status was {z3_receipt['status']}",
            }
        )
        case_id = f"{record.token}-type-{type_index:04d}"
        smt_path = CANARY_ROOT / "cases" / f"{case_id}.smt2"
        receipt_path = CANARY_ROOT / "cases" / f"{case_id}.receipt.json"
        case = {
            "schema": "b1-wave6-card6-qf-nra-canary-case/v1",
            "case_id": case_id,
            "selection_reason": reason,
            "rgs": record.token,
            "orbit_size": record.orbit_size,
            "class_count": max(record.labels) + 1,
            "class_members": [list(group) for group in class_members(record.labels)],
            "structural_feasible_type_count": record.local_order_feasible_count,
            "selected_type_index": type_index,
            "selected_local_word_indices": list(type_indices),
            "selected_local_words": [
                "".join(LOCAL_WORDS[index]) for index in type_indices
            ],
            "smt2_path": smt_path.as_posix(),
            "smt2_sha256": sha256_bytes(source.encode("utf-8")),
            "timeout_seconds_per_solver": timeout_seconds,
            "ledger": ledger,
            "z3": z3_receipt,
            "cvc5": cvc5_receipt,
            "cross_engine_status_agrees": z3_receipt["status"]
            == cvc5_receipt["status"],
            "exact_sat_model_substitution": substitution,
            "claim_status": "DIAGNOSTIC_CANARY_ORDER_LEAF_ONLY",
        }
        documents[smt_path] = source.encode("utf-8")
        documents[receipt_path] = canonical_json_bytes(case)
        case_records.append(case)

    smoke = solver_smoke_controls()
    malformed = malformed_smt_controls()
    result = {
        "schema": "b1-wave6-card6-qf-nra-canary-result/v1",
        "scope": {
            "physical_class_cardinality": 6,
            "card_five": "OUT_OF_SCOPE_SEPARATE_LANE",
            "structural_survivor_orbits": 134,
            "structural_survivor_partitions": 1_609,
            "canary_orbits": 5,
            "full_launch": "NOT_STARTED",
        },
        "supersedes": {
            "path": CANARY_V1_ROOT.as_posix(),
            "reason": (
                "v1 preserved raw solver outputs but mislabeled Z3 literal timeout "
                "and did not fail closed on parse-error-plus-sat output"
            ),
        },
        "selection": "DETERMINISTIC_STRUCTURAL_SHAPE_EXTREMES_AND_MEDIAN",
        "solver_provenance": solver_provenance(),
        "smoke_controls": smoke,
        "malformed_smt_controls": malformed,
        "all_controls_pass": all(
            control["passed"]
            for engine_controls in smoke.values()
            for control in engine_controls.values()
        )
        and all(control["passed"] for control in malformed.values()),
        "cases": case_records,
        "verdict_policy": {
            "timeout_or_unknown": "NO_VERDICT",
            "sat": "CANDIDATE_UNTIL_EXACT_SUBSTITUTION_AND_ENCODING_AUDIT",
            "unsat": "ORDER_LEAF_ONLY_AND_UNCERTIFIED",
        },
    }
    event = {
        "schema": "b1-wave6-card6-qf-nra-canary-event/v1",
        "result_sha256": sha256_bytes(canonical_json_bytes(result)),
        "case_statuses": [
            {
                "case_id": case["case_id"],
                "z3": case["z3"]["status"],
                "cvc5": case["cvc5"]["status"],
                "substitution": case["exact_sat_model_substitution"]["status"],
            }
            for case in case_records
        ],
        "full_launch": "NOT_STARTED",
    }
    documents[CANARY_RESULT_PATH] = canonical_json_bytes(result)
    documents[CANARY_CASES_PATH] = b"".join(
        canonical_json_bytes(case) for case in case_records
    )
    documents[CANARY_EVENT_PATH] = canonical_json_bytes(event)
    documents[CANARY_SOURCE_COPY_PATH] = Path(__file__).read_bytes()
    checksum_lines = [
        f"{sha256_bytes(content)}  {path.as_posix()}"
        for path, content in sorted(documents.items(), key=lambda item: item[0].as_posix())
    ]
    documents[CANARY_CHECKSUMS_PATH] = (
        "\n".join(checksum_lines) + "\n"
    ).encode("ascii")
    return documents


def orbit_jsonl(records: Sequence[OrbitRecord]) -> bytes:
    return b"".join(canonical_json_bytes(record.json()) for record in records)


def output_documents() -> dict[Path, bytes]:
    summary, records = census()
    phase0 = {
        "schema": "b1-wave6-card6-phase0-event/v1",
        "phase0": summary["phase0"],
        "spec": summary["spec"],
    }
    structural = {
        "schema": "b1-wave6-card6-exact-structural-event/v1",
        "duplicate_center": summary["duplicate_center"],
        "six_point_five_installed_kernels": summary[
            "six_point_five_installed_kernels"
        ],
        "exact_edge_closure": summary["exact_edge_closure"],
        "endpoint_shadow": summary["endpoint_shadow"],
        "local_order": summary["local_order"],
        "metric_realization": summary["metric_realization"],
    }
    source = (
        SOURCE_COPY_PATH.read_bytes()
        if SOURCE_COPY_PATH.exists()
        else Path(__file__).read_bytes()
    )
    documents = {
        RESULT_PATH: canonical_json_bytes(summary),
        ORBITS_PATH: orbit_jsonl(records),
        PHASE0_EVENT_PATH: canonical_json_bytes(phase0),
        STRUCTURAL_EVENT_PATH: canonical_json_bytes(structural),
        SOURCE_COPY_PATH: source,
    }
    checksum_lines = [
        f"{sha256_bytes(content)}  {path.as_posix()}"
        for path, content in sorted(documents.items(), key=lambda item: item[0].as_posix())
    ]
    documents[CHECKSUMS_PATH] = ("\n".join(checksum_lines) + "\n").encode("ascii")
    return documents


def remap_root(path: Path, root: Path) -> Path:
    relative = path.relative_to(ROOT)
    return root / relative


def write_documents(
    documents: dict[Path, bytes], *, root: Path, overwrite: bool
) -> None:
    targets = {remap_root(path, root): content for path, content in documents.items()}
    existing = [path for path in targets if path.exists()]
    if existing and not overwrite:
        listed = ", ".join(path.as_posix() for path in sorted(existing))
        raise FileExistsError(f"refusing to overwrite existing outputs: {listed}")
    for path, content in targets.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(content)


def verify_documents(documents: dict[Path, bytes], *, root: Path) -> None:
    mismatches = []
    for path, expected in documents.items():
        target = remap_root(path, root)
        if not target.exists():
            mismatches.append(f"missing:{target}")
        elif target.read_bytes() != expected:
            mismatches.append(f"mismatch:{target}")
    if mismatches:
        raise AssertionError("; ".join(mismatches))


def verify_checksum_ledger(ledger_path: Path, *, root: Path) -> None:
    target_ledger = remap_root(ledger_path, root)
    assert target_ledger.exists(), f"missing:{target_ledger}"
    mismatches = []
    for line in target_ledger.read_text(encoding="ascii").splitlines():
        expected, relative = line.split("  ", 1)
        target = remap_root(Path(relative), root)
        if not target.exists():
            mismatches.append(f"missing:{target}")
        elif sha256_path(target) != expected:
            mismatches.append(f"mismatch:{target}")
    if mismatches:
        raise AssertionError("; ".join(mismatches))


def refuse_existing_canary(*, root: Path) -> None:
    target = remap_root(CANARY_ROOT, root)
    event = remap_root(CANARY_EVENT_PATH, root)
    existing = [path for path in (target, event) if path.exists()]
    if existing:
        listed = ", ".join(path.as_posix() for path in existing)
        raise FileExistsError(
            f"refusing metric solver calls because canary outputs exist: {listed}"
        )


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output-root", type=Path, default=ROOT)
    parser.add_argument("--verify-only", action="store_true")
    parser.add_argument("--metric-canary", action="store_true")
    parser.add_argument("--verify-metric-canary-only", action="store_true")
    parser.add_argument("--timeout-seconds", type=int, default=15)
    parser.add_argument("--overwrite", action="store_true")
    return parser.parse_args()


def main() -> None:
    args = parse_args()
    selected_modes = sum(
        (args.verify_only, args.metric_canary, args.verify_metric_canary_only)
    )
    if selected_modes > 1:
        raise ValueError("select at most one execution mode")
    if args.timeout_seconds < 1 or args.timeout_seconds > 120:
        raise ValueError("timeout must be between 1 and 120 seconds")
    if args.verify_metric_canary_only:
        verify_checksum_ledger(CANARY_CHECKSUMS_PATH, root=args.output_root)
        print(
            json.dumps(
                {"status": "PASS", "mode": "verify-metric-canary-only"},
                sort_keys=True,
            )
        )
        return
    if args.metric_canary:
        if not args.overwrite:
            refuse_existing_canary(root=args.output_root)
        documents = metric_canary_documents(args.timeout_seconds)
        write_documents(documents, root=args.output_root, overwrite=args.overwrite)
        print(
            json.dumps(
                {
                    "status": "PASS",
                    "mode": "metric-canary",
                    "output_root": args.output_root.as_posix(),
                    "files": len(documents),
                },
                sort_keys=True,
            )
        )
        return
    documents = output_documents()
    if args.verify_only:
        verify_documents(documents, root=args.output_root)
        print(json.dumps({"status": "PASS", "mode": "verify-only"}, sort_keys=True))
        return
    write_documents(documents, root=args.output_root, overwrite=args.overwrite)
    print(
        json.dumps(
            {
                "status": "PASS",
                "mode": "write",
                "output_root": args.output_root.as_posix(),
                "files": len(documents),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
