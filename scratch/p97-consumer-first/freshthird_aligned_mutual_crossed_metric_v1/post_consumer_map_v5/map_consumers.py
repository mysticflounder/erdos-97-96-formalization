"""Enumerate exact consumer role maps against the closure-clean v4 survivor."""

from __future__ import annotations

import hashlib
import itertools
import json
from collections import defaultdict, deque
from pathlib import Path
from typing import Any

HERE = Path(__file__).resolve().parent
REPO = HERE.parents[3]
V4 = HERE.parent / "post_exact_off_circle_cut_v4"
ASSIGNMENT_PATH = V4 / "generated" / "post_exact_off_circle_cut_v4_assignment.json"
OUTPUT_PATH = HERE / "mapping.json"
V4_SOURCE_MAP_PATH = V4 / "source-map.json"

LIVE_SOURCE_SLICES = {
    "faithful_carrier_pattern": (
        "lean/Erdos9796Proof/P97/U1CarrierInjection.lean",
        "1492-1503",
    ),
    "general_carrier_bridge": (
        "lean/Erdos9796Proof/P97/Census554/GeneralCarrierBridge.lean",
        "62-70,109-137",
    ),
    "equality_core": (
        "lean/Erdos9796Proof/P97/Census554/EqualityCore.lean",
        "104-128",
    ),
    "five_row_consumer": (
        "lean/Erdos9796Proof/P97/Census554/FiveRowCircleIntersectionGeometry.lean",
        "78-92,303-317",
    ),
    "seven_point_consumer": (
        "lean/Erdos9796Proof/P97/Census554/SevenPointOrbitCollision.lean",
        "89-103",
    ),
    "boundary_blocks": (
        "lean/Erdos9796Proof/P97/Census554/CapSelectedGeometry.lean",
        "59-87",
    ),
    "mutual_boundary_packet": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceClosure.lean",
        "2172-2207",
    ),
    "canonical_surface": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceCanonicalSurface.lean",
        "138-144",
    ),
    "retained_consumer_packet": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdRetainedProducer.lean",
        "710-715,868-883",
    ),
    "retained_radii": (
        "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFreshThirdFiber.lean",
        "1131-1136",
    ),
}

FIVE_FIELDS = (
    ("OA_OC", "O", "A", "O", "C"),
    ("OA_OD", "O", "A", "O", "D"),
    ("OA_OE", "O", "A", "O", "E"),
    ("OA_AC", "O", "A", "A", "C"),
    ("DA_DX5", "D", "A", "D", "X5"),
    ("OA_EX5", "O", "A", "E", "X5"),
    ("OA_AX6", "O", "A", "A", "X6"),
    ("DA_DX6", "D", "A", "D", "X6"),
    ("CD_CX9", "C", "D", "C", "X9"),
    ("OA_EX9", "O", "A", "E", "X9"),
)

FIVE_SIGNS = (
    ("OAC", "O", "A", "C"),
    ("OAD", "O", "A", "D"),
    ("OAE", "O", "A", "E"),
    ("ODE", "O", "D", "E"),
    ("ODC", "O", "D", "C"),
    ("OEC", "O", "E", "C"),
)

SEVEN_FIELDS = (
    ("OA_OB", "O", "A", "O", "B"),
    ("OA_OC", "O", "A", "O", "C"),
    ("AO_AB", "A", "O", "A", "B"),
    ("AO_AV", "A", "O", "A", "V"),
    ("AO_AW", "A", "O", "A", "W"),
    ("BC_BU", "B", "C", "B", "U"),
    ("BC_BV", "B", "C", "B", "V"),
    ("CA_CV", "C", "A", "C", "V"),
    ("UC_UW", "U", "C", "U", "W"),
    ("VA_VU", "V", "A", "V", "U"),
    ("VA_VW", "V", "A", "V", "W"),
    ("WO_WB", "W", "O", "W", "B"),
    ("WO_WU", "W", "O", "W", "U"),
)

FIVE_THEOREM_FIELDS = {
    "OA_OC": ["ha", "hc"],
    "OA_OD": ["ha", "hd"],
    "OA_OE": ["ha", "he"],
    "OA_AC": ["ha", "hac"],
    "DA_DX5": ["hd5"],
    "OA_EX5": ["ha", "he5"],
    "OA_AX6": ["ha", "ha6"],
    "DA_DX6": ["hd6"],
    "CD_CX9": ["hc9"],
    "OA_EX9": ["ha", "he9"],
}

FIVE_SIGN_FIELDS = {name: f"h{name}" for name, *_ in FIVE_SIGNS}

SEVEN_THEOREM_FIELDS = {name: f"h{name}" for name, *_ in SEVEN_FIELDS}


class UnionFind:
    def __init__(self, items: list[tuple[int, int]]) -> None:
        self.parent = {item: item for item in items}

    def find(self, item: tuple[int, int]) -> tuple[int, int]:
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            nxt = self.parent[item]
            self.parent[item] = root
            item = nxt
        return root

    def union(self, left: tuple[int, int], right: tuple[int, int]) -> None:
        left_root = self.find(left)
        right_root = self.find(right)
        if left_root != right_root:
            self.parent[right_root] = left_root


def edge(a: int, b: int) -> tuple[int, int]:
    return (a, b) if a <= b else (b, a)


def load_assignment() -> dict[str, Any]:
    return json.loads(ASSIGNMENT_PATH.read_text())


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def live_source_snapshot() -> dict[str, dict[str, str]]:
    return {
        name: {
            "file": relative,
            "lines": lines,
            "sha256": sha256_file(REPO / relative),
        }
        for name, (relative, lines) in LIVE_SOURCE_SLICES.items()
    }


def build_closure(
    data: dict[str, Any],
) -> tuple[
    dict[tuple[int, int], tuple[int, int]],
    dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]],
]:
    n = data["n"]
    items = [edge(i, j) for i in range(n) for j in range(i, n)]
    union_find = UnionFind(items)
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]] = (
        defaultdict(list)
    )

    selected_by_center: dict[int, list[int]] = defaultdict(list)
    blockers = data["blockers"]
    for source, support in enumerate(data["selected_rows"]):
        center = blockers[source]
        if sorted(support) == sorted(data["point_k4_rows"][center]):
            selected_by_center[center].append(source)

    for center, support in enumerate(data["point_k4_rows"]):
        base = edge(center, support[0])
        for point in support[1:]:
            other = edge(center, point)
            evidence = {
                "kind": "chosen_classAt_row_equality",
                "center": center,
                "members": [support[0], point],
                "support": support,
                "also_blocker_locked_for_sources": selected_by_center.get(center, []),
                "lean": [
                    "Problem97.FaithfulCarrierPattern.classAt",
                    "Problem97.Census554.GeneralCarrierBridge.rowPattern",
                    "Problem97.Census554.GeneralCarrierBridge.realizes",
                ],
            }
            union_find.union(base, other)
            adjacency[base].append((other, evidence))
            adjacency[other].append((base, evidence))

    components = {item: union_find.find(item) for item in items}
    return components, adjacency


def closure_equal(
    components: dict[tuple[int, int], tuple[int, int]],
    a: int,
    b: int,
    c: int,
    d: int,
) -> bool:
    return components[edge(a, b)] == components[edge(c, d)]


def path_witness(
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]],
    start: tuple[int, int],
    goal: tuple[int, int],
) -> list[dict[str, Any]] | None:
    if start == goal:
        return []
    queue = deque([start])
    previous: dict[tuple[int, int], tuple[tuple[int, int], dict[str, Any]] | None] = {
        start: None
    }
    while queue:
        current = queue.popleft()
        for nxt, evidence in adjacency[current]:
            if nxt in previous:
                continue
            previous[nxt] = (current, evidence)
            if nxt == goal:
                queue.clear()
                break
            queue.append(nxt)
    if goal not in previous:
        return None
    steps: list[dict[str, Any]] = []
    current = goal
    while current != start:
        item = previous[current]
        assert item is not None
        prior, evidence = item
        steps.append(
            {
                "from_edge": list(prior),
                "to_edge": list(current),
                "evidence": evidence,
            }
        )
        current = prior
    steps.reverse()
    return steps


def transitive_closure(n: int, relations: set[tuple[int, int]]) -> list[list[bool]]:
    reach = [[False] * n for _ in range(n)]
    for left, right in relations:
        reach[left][right] = True
    for middle in range(n):
        for left in range(n):
            if not reach[left][middle]:
                continue
            for right in range(n):
                reach[left][right] = reach[left][right] or reach[middle][right]
    assert not any(reach[index][index] for index in range(n))
    return reach


def boundary_order_arms(data: dict[str, Any], branch: str) -> list[list[list[bool]]]:
    """The two packet-entitled posets in one direct/mirror boundary branch."""
    roles = data["roles"]
    apex0 = roles["apex0"]
    apex1 = roles["apex1"]
    apex2 = roles["apex2"]
    endpoints = {
        0: {apex1, apex2},
        1: {apex2, apex0},
        2: {apex0, apex1},
    }
    interiors = [set(data["caps"][index]) - endpoints[index] for index in range(3)]
    if branch == "direct":
        groups = [
            {apex2},
            interiors[1],
            {apex0},
            interiors[2],
            {apex1},
            interiors[0],
        ]
    elif branch == "mirror":
        groups = [
            {apex2},
            interiors[0],
            {apex1},
            interiors[2],
            {apex0},
            interiors[1],
        ]
    else:
        raise ValueError(branch)
    assert set().union(*groups) == set(range(data["n"]))
    assert sum(len(group) for group in groups) == data["n"]

    base_relations = {
        (left, right)
        for earlier, group in enumerate(groups)
        for later in range(earlier + 1, len(groups))
        for left in group
        for right in groups[later]
    }
    c1 = roles["c_first"]
    c2 = roles["c_second"]
    blocker1 = data["blockers"][c1]
    blocker2 = data["blockers"][c2]
    assert blocker1 in interiors[0]
    assert blocker2 in interiors[data["second_blocker_cap"]]
    assert c1 in interiors[0]
    assert c2 in interiors[0]
    assert data["second_blocker_cap"] != 0

    # The sources and blocker1 share interior block 0, while blocker2 lies in
    # a different globally ordered cap block.  Therefore the packet's btw
    # equivalence is exactly the disjunction that c1/c2 straddle blocker1.
    separation_arms = (
        {(c1, blocker1), (blocker1, c2)},
        {(c2, blocker1), (blocker1, c1)},
    )
    return [
        transitive_closure(data["n"], base_relations | extra)
        for extra in separation_arms
    ]


def triple_polarity(
    reach: list[list[bool]], first: int, second: int, third: int
) -> str | None:
    if len({first, second, third}) != 3:
        return None
    points = (first, second, third)
    ordered = sorted(
        points,
        key=lambda point: sum(reach[other][point] for other in points),
    )
    if not (reach[ordered[0]][ordered[1]] and reach[ordered[1]][ordered[2]]):
        return None
    negative_orders = {
        tuple(ordered),
        (ordered[1], ordered[2], ordered[0]),
        (ordered[2], ordered[0], ordered[1]),
    }
    return "negative" if points in negative_orders else "positive"


def build_order_entitlements(
    data: dict[str, Any],
) -> dict[str, dict[tuple[int, int, int], str | None]]:
    result = {}
    for branch in ("direct", "mirror"):
        arms = boundary_order_arms(data, branch)
        table = {}
        for triple in itertools.permutations(range(data["n"]), 3):
            polarities = [triple_polarity(reach, *triple) for reach in arms]
            table[triple] = (
                polarities[0]
                if polarities[0] is not None and len(set(polarities)) == 1
                else None
            )
        result[branch] = table
    return result


def entitlement_counts(
    entitlements: dict[str, dict[tuple[int, int, int], str | None]],
) -> dict[str, dict[str, int]]:
    return {
        branch: {
            polarity: sum(value == polarity for value in table.values())
            for polarity in ("positive", "negative")
        }
        | {"not_forced": sum(value is None for value in table.values())}
        for branch, table in entitlements.items()
    }


def sign_satisfied(
    table: dict[tuple[int, int, int], str | None],
    mapping: dict[str, int],
    polarity: str,
) -> dict[str, bool]:
    return {
        name: table[(mapping[first], mapping[second], mapping[third])] == polarity
        for name, first, second, third in FIVE_SIGNS
    }


def equality_matrix(
    fields: tuple[tuple[str, str, str, str, str], ...],
    mapping: dict[str, int],
    components: dict[tuple[int, int], tuple[int, int]],
) -> dict[str, bool]:
    return {
        name: closure_equal(
            components,
            mapping[a],
            mapping[b],
            mapping[c],
            mapping[d],
        )
        for name, a, b, c, d in fields
    }


def five_aux_domains(
    base: dict[str, int],
    components: dict[tuple[int, int], tuple[int, int]],
    n: int,
) -> tuple[list[int], list[int], list[int]]:
    o, a, c, d, e = (base[name] for name in ("O", "A", "C", "D", "E"))
    x5 = [
        x
        for x in range(n)
        if closure_equal(components, d, a, d, x)
        and closure_equal(components, o, a, e, x)
    ]
    x6 = [
        x
        for x in range(n)
        if closure_equal(components, o, a, a, x)
        and closure_equal(components, d, a, d, x)
    ]
    x9 = [
        x
        for x in range(n)
        if closure_equal(components, c, d, c, x)
        and closure_equal(components, o, a, e, x)
    ]
    return x5, x6, x9


def five_best_aux(
    base: dict[str, int],
    components: dict[tuple[int, int], tuple[int, int]],
    n: int,
) -> tuple[int, dict[str, int], dict[str, bool]]:
    best_score = 0
    best_map: dict[str, int] = {}
    best_matrix: dict[str, bool] = {}
    for role, pair in (
        ("X5", FIVE_FIELDS[4:6]),
        ("X6", FIVE_FIELDS[6:8]),
        ("X9", FIVE_FIELDS[8:10]),
    ):
        local_best = -1
        local_x = 0
        local_matrix: dict[str, bool] = {}
        for x in range(n):
            candidate = base | {role: x}
            matrix = equality_matrix(pair, candidate, components)
            score = sum(matrix.values())
            if score > local_best:
                local_best = score
                local_x = x
                local_matrix = matrix
        best_score += local_best
        best_map[role] = local_x
        best_matrix.update(local_matrix)
    return best_score, best_map, best_matrix


def five_best_aux_injective(
    base: dict[str, int],
    components: dict[tuple[int, int], tuple[int, int]],
    n: int,
) -> tuple[int, dict[str, int], dict[str, bool]]:
    """Optimize the three auxiliary roles subject to full role injectivity."""
    remaining = set(range(n)) - set(base.values())
    scored: dict[str, list[tuple[int, int, dict[str, bool]]]] = {}
    for role, pair in (
        ("X5", FIVE_FIELDS[4:6]),
        ("X6", FIVE_FIELDS[6:8]),
        ("X9", FIVE_FIELDS[8:10]),
    ):
        choices = []
        for value in remaining:
            matrix = equality_matrix(pair, base | {role: value}, components)
            choices.append((sum(matrix.values()), value, matrix))
        choices.sort(key=lambda item: (-item[0], item[1]))
        # With three roles, an optimal injective assignment always occurs in
        # each role's top three score-tied positions after deterministic sort.
        scored[role] = choices[:3]

    best_score = -1
    best_map: dict[str, int] = {}
    best_matrix: dict[str, bool] = {}
    for x5, x6, x9 in itertools.product(scored["X5"], scored["X6"], scored["X9"]):
        values = (x5[1], x6[1], x9[1])
        if len(set(values)) != 3:
            continue
        score = x5[0] + x6[0] + x9[0]
        if score > best_score:
            best_score = score
            best_map = {"X5": x5[1], "X6": x6[1], "X9": x9[1]}
            best_matrix = x5[2] | x6[2] | x9[2]
    return best_score, best_map, best_matrix


def five_optimal_aux_examples(
    base: dict[str, int],
    base_matrix: dict[str, bool],
    polarity: str,
    branch: str,
    signs: dict[str, bool],
    components: dict[tuple[int, int], tuple[int, int]],
    n: int,
    target_score: int,
    injective: bool,
) -> dict[tuple[str, ...], dict[str, Any]]:
    """One exact witness for every missing-field set at target score."""
    choices: dict[str, list[tuple[int, dict[str, bool], int]]] = {}
    unavailable = set(base.values()) if injective else set()
    for role, pair in (
        ("X5", FIVE_FIELDS[4:6]),
        ("X6", FIVE_FIELDS[6:8]),
        ("X9", FIVE_FIELDS[8:10]),
    ):
        choices[role] = []
        for value in range(n):
            if value in unavailable:
                continue
            matrix = equality_matrix(pair, base | {role: value}, components)
            choices[role].append((value, matrix, sum(matrix.values())))

    examples: dict[tuple[str, ...], dict[str, Any]] = {}
    for x5, x6, x9 in itertools.product(choices["X5"], choices["X6"], choices["X9"]):
        values = (x5[0], x6[0], x9[0])
        if injective and len(set(values)) != 3:
            continue
        matrix = base_matrix | x5[1] | x6[1] | x9[1]
        if sum(matrix.values()) != target_score:
            continue
        missing = tuple(sorted(name for name, value in matrix.items() if not value))
        examples.setdefault(
            missing,
            {
                "polarity": polarity,
                "branch": branch,
                "mapping": base | {"X5": x5[0], "X6": x6[0], "X9": x9[0]},
                "equalities": matrix,
                "signs": signs,
            },
        )
    return examples


def enumerate_five(
    data: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
    entitlements: dict[str, dict[tuple[int, int, int], str | None]],
) -> dict[str, Any]:
    n = data["n"]
    roles = ("O", "A", "C", "D", "E")
    full_theorem: list[dict[str, Any]] = []
    full_injective: list[dict[str, Any]] = []
    compressed: list[dict[str, Any]] = []
    best_score = -1
    best_examples: list[dict[str, Any]] = []
    best_missing_examples: dict[tuple[str, ...], dict[str, Any]] = {}
    best_injective_score = -1
    best_injective_examples: list[dict[str, Any]] = []
    best_injective_missing_examples: dict[tuple[str, ...], dict[str, Any]] = {}
    polarity_base_counts = {
        f"{branch}_{polarity}": 0
        for branch in ("direct", "mirror")
        for polarity in ("positive", "negative")
    }

    for values in itertools.permutations(range(n), len(roles)):
        base = dict(zip(roles, values, strict=True))
        for branch, polarity in itertools.product(
            ("direct", "mirror"), ("positive", "negative")
        ):
            signs = sign_satisfied(entitlements[branch], base, polarity)
            if not all(signs.values()):
                continue
            polarity_base_counts[f"{branch}_{polarity}"] += 1
            base_matrix = equality_matrix(FIVE_FIELDS[:4], base, components)
            aux_score, aux_map, aux_matrix = five_best_aux(base, components, n)
            score = sum(base_matrix.values()) + aux_score
            if score > best_score:
                best_score = score
                example = {
                    "polarity": polarity,
                    "branch": branch,
                    "mapping": base | aux_map,
                    "equalities": base_matrix | aux_matrix,
                    "signs": signs,
                }
                best_examples = [example]
                best_missing_examples = five_optimal_aux_examples(
                    base,
                    base_matrix,
                    polarity,
                    branch,
                    signs,
                    components,
                    n,
                    score,
                    injective=False,
                )
            elif score == best_score and len(best_examples) < 20:
                example = {
                    "polarity": polarity,
                    "branch": branch,
                    "mapping": base | aux_map,
                    "equalities": base_matrix | aux_matrix,
                    "signs": signs,
                }
                best_examples.append(example)
                best_missing_examples.update(
                    {
                        key: value
                        for key, value in five_optimal_aux_examples(
                            base,
                            base_matrix,
                            polarity,
                            branch,
                            signs,
                            components,
                            n,
                            score,
                            injective=False,
                        ).items()
                        if key not in best_missing_examples
                    }
                )
            elif score == best_score:
                best_missing_examples.update(
                    {
                        key: value
                        for key, value in five_optimal_aux_examples(
                            base,
                            base_matrix,
                            polarity,
                            branch,
                            signs,
                            components,
                            n,
                            score,
                            injective=False,
                        ).items()
                        if key not in best_missing_examples
                    }
                )

            injective_aux_score, injective_aux_map, injective_aux_matrix = (
                five_best_aux_injective(base, components, n)
            )
            injective_score = sum(base_matrix.values()) + injective_aux_score
            injective_example = {
                "polarity": polarity,
                "branch": branch,
                "mapping": base | injective_aux_map,
                "equalities": base_matrix | injective_aux_matrix,
                "signs": signs,
            }
            if injective_score > best_injective_score:
                best_injective_score = injective_score
                best_injective_examples = [injective_example]
                best_injective_missing_examples = five_optimal_aux_examples(
                    base,
                    base_matrix,
                    polarity,
                    branch,
                    signs,
                    components,
                    n,
                    injective_score,
                    injective=True,
                )
            elif (
                injective_score == best_injective_score
                and len(best_injective_examples) < 20
            ):
                best_injective_examples.append(injective_example)
                best_injective_missing_examples.update(
                    {
                        key: value
                        for key, value in five_optimal_aux_examples(
                            base,
                            base_matrix,
                            polarity,
                            branch,
                            signs,
                            components,
                            n,
                            injective_score,
                            injective=True,
                        ).items()
                        if key not in best_injective_missing_examples
                    }
                )
            elif injective_score == best_injective_score:
                best_injective_missing_examples.update(
                    {
                        key: value
                        for key, value in five_optimal_aux_examples(
                            base,
                            base_matrix,
                            polarity,
                            branch,
                            signs,
                            components,
                            n,
                            injective_score,
                            injective=True,
                        ).items()
                        if key not in best_injective_missing_examples
                    }
                )

            if not all(base_matrix.values()):
                continue
            x5s, x6s, x9s = five_aux_domains(base, components, n)
            if not (x5s and x6s and x9s):
                continue
            compressed.append(
                {
                    "branch": branch,
                    "polarity": polarity,
                    "base": base,
                    "domains": {"X5": x5s, "X6": x6s, "X9": x9s},
                }
            )
            for x5, x6, x9 in itertools.product(x5s, x6s, x9s):
                mapping = base | {"X5": x5, "X6": x6, "X9": x9}
                full_theorem.append(
                    {"branch": branch, "polarity": polarity, "mapping": mapping}
                )
                if len(set(mapping.values())) == len(mapping):
                    full_injective.append(
                        {"branch": branch, "polarity": polarity, "mapping": mapping}
                    )

    return {
        "consumer": (
            "Problem97.Census554.FiveRowCircleIntersectionGeometry."
            "false_of_five_row_metric_data[_neg]"
        ),
        "role_distinctness": {
            "theorem_faithful": "O != A; strict signs force O,A,C,D,E pairwise distinct",
            "injective_audit": "all eight role labels pairwise distinct",
        },
        "polarity_base_counts": polarity_base_counts,
        "full_mapping_count_theorem_faithful": len(full_theorem),
        "full_mapping_count_injective": len(full_injective),
        "full_mappings_theorem_faithful": full_theorem,
        "full_mappings_injective": full_injective,
        "full_mapping_compressed_domains": compressed,
        "best_equality_score_out_of_10_after_all_six_signs": best_score,
        "best_examples": best_examples,
        "minimal_missing_sets_theorem_faithful": [
            {"missing_fields": list(missing), "example": example}
            for missing, example in sorted(best_missing_examples.items())
        ],
        "best_injective_equality_score_out_of_10_after_all_six_signs": (
            best_injective_score
        ),
        "best_injective_examples": best_injective_examples,
        "minimal_missing_sets_injective": [
            {"missing_fields": list(missing), "example": example}
            for missing, example in sorted(best_injective_missing_examples.items())
        ],
    }


def seven_constraint_holds(
    components: dict[tuple[int, int], tuple[int, int]],
    mapping: dict[str, int],
    field: tuple[str, str, str, str, str],
) -> bool:
    _, a, b, c, d = field
    return closure_equal(components, mapping[a], mapping[b], mapping[c], mapping[d])


def field_edge_sides(
    data: dict[str, Any],
    mapping: dict[str, int],
    field: tuple[str, str, str, str, str],
) -> dict[str, Any]:
    """Expand one consumer equality into its literal carrier metric equation."""
    name, a, b, c, d = field
    aliases: dict[int, list[str]] = defaultdict(list)
    for source_name, index in data["roles"].items():
        aliases[int(index)].append(source_name)

    def point(role: str) -> dict[str, Any]:
        index = mapping[role]
        names = sorted(aliases[index])
        label = names[0] if names else f"carrier_index_{index}"
        return {
            "consumer_role": role,
            "carrier_index": index,
            "assignment_source_labels": names,
            "display_source_label": label,
        }

    def side(first_role: str, second_role: str) -> dict[str, Any]:
        first = point(first_role)
        second = point(second_role)
        return {
            "roles": [first_role, second_role],
            "carrier_edge": [first["carrier_index"], second["carrier_index"]],
            "source_points": [first, second],
            "diagonal": first["carrier_index"] == second["carrier_index"],
            "indexed_metric": (
                f"dist(carrier[{first['carrier_index']}], "
                f"carrier[{second['carrier_index']}])"
            ),
            "source_labeled_metric": (
                f"dist({first['display_source_label']}@{first['carrier_index']}, "
                f"{second['display_source_label']}@{second['carrier_index']})"
            ),
        }

    left = side(a, b)
    right = side(c, d)
    return {
        "field": name,
        "theorem_hypothesis": SEVEN_THEOREM_FIELDS[name],
        "left": left,
        "right": right,
        "both_sides_non_diagonal": not left["diagonal"] and not right["diagonal"],
        "exact_indexed_equation": (
            f"{left['indexed_metric']} = {right['indexed_metric']}"
        ),
        "exact_source_labeled_equation": (
            f"{left['source_labeled_metric']} = {right['source_labeled_metric']}"
        ),
    }


def missing_fields_are_consumer_viable(
    data: dict[str, Any],
    mapping: dict[str, int],
    missing: tuple[tuple[str, str, str, str, str], ...],
) -> bool:
    """Fail closed if an omitted equality compares against a self edge."""
    return all(
        field_edge_sides(data, mapping, field)["both_sides_non_diagonal"]
        for field in missing
    )


def build_seven_support_index(
    components: dict[tuple[int, int], tuple[int, int]], n: int
) -> dict[str, dict[str, Any]]:
    """Precompute every projection of each three-role equality relation."""
    result: dict[str, dict[str, Any]] = {}
    for field in SEVEN_FIELDS:
        name = field[0]
        roles = tuple(dict.fromkeys(field[1:]))
        projections = {mask: set() for mask in range(1 << len(roles))}
        for values in itertools.product(range(n), repeat=len(roles)):
            trial = dict(zip(roles, values, strict=True))
            if not seven_constraint_holds(components, trial, field):
                continue
            for mask, rows in projections.items():
                rows.add(
                    tuple(
                        value
                        for index, value in enumerate(values)
                        if mask & (1 << index)
                    )
                )
        result[name] = {"roles": roles, "projections": projections}
    return result


def solve_seven_subset(
    data: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
    support_index: dict[str, dict[str, Any]],
    n: int,
    required: tuple[tuple[str, str, str, str, str], ...],
    missing: tuple[tuple[str, str, str, str, str], ...],
    injective: bool,
    require_missing_non_diagonal: bool,
) -> dict[str, int] | None:
    """Finite-domain CSP for a selected subset of the 13 orbit equalities."""
    roles = ("O", "A", "B", "V", "W", "U", "C")
    domains = range(n)

    def partial_possible(mapping: dict[str, int]) -> bool:
        if "O" in mapping and "A" in mapping and mapping["O"] == mapping["A"]:
            return False
        if require_missing_non_diagonal:
            for _, a, b, c, d in missing:
                for first, second in ((a, b), (c, d)):
                    if (
                        first in mapping
                        and second in mapping
                        and mapping[first] == mapping[second]
                    ):
                        return False
        for field in required:
            relation = support_index[field[0]]
            involved = relation["roles"]
            mask = sum(
                1 << index for index, role in enumerate(involved) if role in mapping
            )
            projected = tuple(role for role in involved if role in mapping)
            values = tuple(mapping[role] for role in projected)
            if values not in relation["projections"][mask]:
                return False
        return True

    def dfs(mapping: dict[str, int]) -> dict[str, int] | None:
        if len(mapping) == len(roles):
            if require_missing_non_diagonal and not missing_fields_are_consumer_viable(
                data, mapping, missing
            ):
                return None
            return mapping.copy()
        best_role: str | None = None
        best_values: list[int] | None = None
        for role in roles:
            if role in mapping:
                continue
            viable_values = []
            for value in domains:
                if injective and value in mapping.values():
                    continue
                mapping[role] = value
                if partial_possible(mapping):
                    viable_values.append(value)
                del mapping[role]
            if not viable_values:
                return None
            if best_values is None or len(viable_values) < len(best_values):
                best_role = role
                best_values = viable_values
        assert best_role is not None and best_values is not None
        for value in best_values:
            mapping[best_role] = value
            answer = dfs(mapping)
            if answer is not None:
                return answer
            del mapping[best_role]
        return None

    return dfs({})


def seven_minimal_missing_sets(
    data: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
    support_index: dict[str, dict[str, Any]],
    n: int,
    injective: bool,
    require_missing_non_diagonal: bool,
) -> tuple[int, list[dict[str, Any]]]:
    for missing_count in range(len(SEVEN_FIELDS) + 1):
        results = []
        for missing_indices in itertools.combinations(
            range(len(SEVEN_FIELDS)), missing_count
        ):
            missing_set = set(missing_indices)
            required = tuple(
                field
                for index, field in enumerate(SEVEN_FIELDS)
                if index not in missing_set
            )
            missing = tuple(SEVEN_FIELDS[index] for index in missing_indices)
            mapping = solve_seven_subset(
                data,
                components,
                support_index,
                n,
                required,
                missing,
                injective=injective,
                require_missing_non_diagonal=require_missing_non_diagonal,
            )
            if mapping is None:
                continue
            matrix = equality_matrix(SEVEN_FIELDS, mapping, components)
            results.append(
                {
                    "omitted_fields": [
                        SEVEN_FIELDS[index][0] for index in missing_indices
                    ],
                    "mapping": mapping,
                    "actual_equalities": matrix,
                }
            )
        if results:
            return missing_count, results
    raise AssertionError("empty constraint set must be satisfiable")


def enumerate_seven(
    data: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
) -> dict[str, Any]:
    n = data["n"]
    support_index = build_seven_support_index(components, n)
    full_theorem: list[dict[str, int]] = []
    full_injective: list[dict[str, int]] = []

    for o in range(n):
        for a in range(n):
            if o == a:
                continue
            base_component = components[edge(o, a)]
            b_domain = [
                b
                for b in range(n)
                if components[edge(o, b)] == base_component
                and components[edge(a, b)] == base_component
            ]
            c_domain = [c for c in range(n) if components[edge(o, c)] == base_component]
            for b in b_domain:
                for c in c_domain:
                    bc_component = components[edge(b, c)]
                    ca_component = components[edge(c, a)]
                    v_domain = [
                        v
                        for v in range(n)
                        if components[edge(a, v)] == base_component
                        and components[edge(b, v)] == bc_component
                        and components[edge(c, v)] == ca_component
                    ]
                    for v in v_domain:
                        va_component = components[edge(v, a)]
                        u_domain = [
                            u
                            for u in range(n)
                            if components[edge(b, u)] == bc_component
                            and components[edge(v, u)] == va_component
                        ]
                        for u in u_domain:
                            uc_component = components[edge(u, c)]
                            w_domain = [
                                w
                                for w in range(n)
                                if components[edge(a, w)] == base_component
                                and components[edge(v, w)] == va_component
                                and components[edge(u, w)] == uc_component
                                and components[edge(w, b)] == components[edge(w, o)]
                                and components[edge(w, u)] == components[edge(w, o)]
                            ]
                            for w in w_domain:
                                mapping = {
                                    "O": o,
                                    "A": a,
                                    "B": b,
                                    "C": c,
                                    "U": u,
                                    "V": v,
                                    "W": w,
                                }
                                assert all(
                                    equality_matrix(
                                        SEVEN_FIELDS, mapping, components
                                    ).values()
                                )
                                full_theorem.append(mapping)
                                if len(set(mapping.values())) == len(mapping):
                                    full_injective.append(mapping)

    theorem_missing_count, theorem_near = seven_minimal_missing_sets(
        data,
        components,
        support_index,
        n,
        injective=False,
        require_missing_non_diagonal=False,
    )
    viable_missing_count, viable_near = seven_minimal_missing_sets(
        data,
        components,
        support_index,
        n,
        injective=False,
        require_missing_non_diagonal=True,
    )
    injective_missing_count, injective_near = seven_minimal_missing_sets(
        data,
        components,
        support_index,
        n,
        injective=True,
        require_missing_non_diagonal=True,
    )
    return {
        "consumer": (
            "Problem97.Census554.SevenPointOrbitCollision.seven_point_orbit_collision"
        ),
        "role_distinctness": {
            "theorem_faithful": "O != A only",
            "injective_audit": "all seven role labels pairwise distinct",
        },
        "full_mapping_count_theorem_faithful": len(full_theorem),
        "full_mapping_count_injective": len(full_injective),
        "full_mappings_theorem_faithful": full_theorem,
        "full_mappings_injective": full_injective,
        "minimum_omitted_premises_theorem_faithful": theorem_missing_count,
        "minimal_omission_sets_theorem_faithful": theorem_near,
        "viability_filter": (
            "every omitted equality must have two non-diagonal carrier-edge "
            "sides under the role assignment"
        ),
        "viability_scope": (
            "necessary consumer eligibility only; it does not assert simultaneous "
            "Euclidean metric realizability of the omitted equations"
        ),
        "minimum_omitted_premises_viable_theorem_faithful": viable_missing_count,
        "minimal_omission_sets_viable_theorem_faithful": viable_near,
        "minimum_omitted_premises_injective": injective_missing_count,
        "minimal_omission_sets_injective": injective_near,
    }


def attach_witnesses(
    result: dict[str, Any],
    fields: tuple[tuple[str, str, str, str, str], ...],
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]],
) -> None:
    for key in ("full_mappings_theorem_faithful", "full_mappings_injective"):
        for item in result[key]:
            mapping = item.get("mapping", item)
            item["equality_witnesses"] = {
                name: path_witness(
                    adjacency,
                    edge(mapping[a], mapping[b]),
                    edge(mapping[c], mapping[d]),
                )
                for name, a, b, c, d in fields
            }


def annotate_example(
    example: dict[str, Any],
    fields: tuple[tuple[str, str, str, str, str], ...],
    components: dict[tuple[int, int], tuple[int, int]],
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]],
    entitlements: dict[str, dict[tuple[int, int, int], str | None]] | None = None,
) -> None:
    mapping = example["mapping"]
    example["equality_details"] = {}
    for name, a, b, c, d in fields:
        left = edge(mapping[a], mapping[b])
        right = edge(mapping[c], mapping[d])
        equal = components[left] == components[right]
        example["equality_details"][name] = {
            "left_edge": list(left),
            "right_edge": list(right),
            "left_component": list(components[left]),
            "right_component": list(components[right]),
            "source_entitled": equal,
            "path": path_witness(adjacency, left, right) if equal else None,
        }
    if entitlements is not None:
        branch = example["branch"]
        polarity = example["polarity"]
        example["sign_details"] = {
            name: {
                "role_triple": [a, b, c],
                "point_triple": [mapping[a], mapping[b], mapping[c]],
                "branch": branch,
                "required_polarity": polarity,
                "packet_entitled_polarity": entitlements[branch][
                    (mapping[a], mapping[b], mapping[c])
                ],
                "source_entitled": (
                    entitlements[branch][(mapping[a], mapping[b], mapping[c])]
                    == polarity
                ),
                "source": (
                    "FreshThirdAlignedMutualBlockerBoundaryPacket direct/mirror "
                    "block field + btw equivalence; BoundaryIndexing.boundary_ccw; "
                    "hneg_of_ccw; signedArea2 cyclic/antisymmetric identities"
                ),
            }
            for name, a, b, c in FIVE_SIGNS
        }


def annotate_near_mappings(
    data: dict[str, Any],
    five: dict[str, Any],
    seven: dict[str, Any],
    components: dict[tuple[int, int], tuple[int, int]],
    adjacency: dict[tuple[int, int], list[tuple[tuple[int, int], dict[str, Any]]]],
    entitlements: dict[str, dict[tuple[int, int, int], str | None]],
) -> None:
    for key in (
        "minimal_missing_sets_theorem_faithful",
        "minimal_missing_sets_injective",
    ):
        for item in five[key]:
            annotate_example(
                item["example"],
                FIVE_FIELDS,
                components,
                adjacency,
                entitlements=entitlements,
            )
    if "minimal_omission_sets_theorem_faithful" not in seven:
        return
    for key in (
        "minimal_omission_sets_theorem_faithful",
        "minimal_omission_sets_viable_theorem_faithful",
        "minimal_omission_sets_injective",
    ):
        for item in seven[key]:
            annotate_example(item, SEVEN_FIELDS, components, adjacency)
            missing_names = set(item["omitted_fields"])
            missing_fields = tuple(
                field for field in SEVEN_FIELDS if field[0] in missing_names
            )
            equations = [
                field_edge_sides(data, item["mapping"], field)
                for field in missing_fields
            ]
            viable = all(row["both_sides_non_diagonal"] for row in equations)
            item["omitted_metric_equations"] = equations
            item["consumer_viability"] = {
                "criterion": seven["viability_filter"],
                "scope": seven["viability_scope"],
                "all_missing_fields_have_two_non_diagonal_sides": viable,
                "classification": (
                    "CONSUMER_ELIGIBLE_MAPPING_FRONTIER"
                    if viable
                    else "FORMALLY_MINIMAL_BUT_CONSUMER_INFEASIBLE"
                ),
                "reason": (
                    "every omitted theorem equality compares two distinct-point "
                    "carrier edges"
                    if viable
                    else "at least one omitted theorem equality compares a "
                    "nonzero distinct-point edge with a diagonal self edge"
                ),
                "infeasibility_provenance": (
                    []
                    if viable
                    else [
                        "Problem97.Census554.GeneralCarrierBridge.realizes.injective",
                        "dist_self",
                        "dist_pos.mpr",
                    ]
                ),
            }


def main() -> None:
    data = load_assignment()
    components, adjacency = build_closure(data)
    entitlements = build_order_entitlements(data)
    five = enumerate_five(data, components, entitlements)
    if five["full_mapping_count_theorem_faithful"] == 0:
        seven = enumerate_seven(data, components)
    else:
        seven = {
            "status": "not_run_by_consumer_first_order",
            "reason": "a full five-row map exists",
        }
    attach_witnesses(five, FIVE_FIELDS, adjacency)
    if "full_mappings_theorem_faithful" in seven:
        attach_witnesses(seven, SEVEN_FIELDS, adjacency)
    annotate_near_mappings(data, five, seven, components, adjacency, entitlements)
    output = {
        "schema": "freshthird-post-consumer-map-v5-3",
        "input": {
            "assignment": str(ASSIGNMENT_PATH.relative_to(HERE.parents[3])),
            "assignment_sha256": sha256_file(ASSIGNMENT_PATH),
            "v4_source_map": str(V4_SOURCE_MAP_PATH.relative_to(REPO)),
            "v4_source_map_sha256": sha256_file(V4_SOURCE_MAP_PATH),
            "scope": "exact17/direct-crossed closure-clean v4 survivor",
            "boundary_order_source": (
                "live direct/mirror block inequalities and mutual-packet btw "
                "equivalence; the v4 numeric rank and every metric coordinate "
                "proposal are deliberately ignored"
            ),
            "row_source": (
                "only v4 point_k4_rows, each the chosen "
                "FaithfulCarrierPattern.classAt row"
            ),
        },
        "provenance": {
            "live_source_slices": live_source_snapshot(),
            "signed_area_entitlement_counts": entitlement_counts(entitlements),
            "row_equalities": [
                "Problem97.FaithfulCarrierPattern.classAt",
                "Problem97.Census554.GeneralCarrierBridge.rowPattern",
                "Problem97.Census554.GeneralCarrierBridge.realizes",
                "Problem97.Census554.EqualityCore.EdgeClosure",
            ],
            "carrier_distinctness": [
                "Problem97.Census554.GeneralCarrierBridge.realizes.injective",
                "dist_self",
                "dist_pos.mpr",
            ],
            "boundary_signs": [
                "Problem97.Census554.CapSelectedGeometry.DirectBoundaryBlocks",
                "Problem97.Census554.CapSelectedGeometry.MirrorBoundaryBlocks",
                (
                    "Problem97.ATailFrontierLiveClosure."
                    "FreshThirdAlignedMutualBlockerBoundaryPacket."
                    "c1_btw_blockers_iff_not_c2"
                ),
                "Problem97.Census554.GeneralCarrierBridge.BoundaryIndexing.boundary_ccw",
                "Problem97.ConvexCyclicOrder.hneg_of_ccw",
                "signedArea2 cyclic invariance and antisymmetry",
            ],
            "boundary_packet": [
                (
                    "Problem97.ATailFrontierLiveClosure."
                    "FreshThirdAlignedMutualBlockerBoundaryPacket"
                ),
                (
                    "Problem97.ATailFrontierLiveClosure."
                    "freshThird_alignedMutualBlockerBoundaryPacket"
                ),
            ],
        },
        "consumer_signatures": {
            "five_row_equalities": [list(field) for field in FIVE_FIELDS],
            "five_row_signs": [list(field) for field in FIVE_SIGNS],
            "seven_point_equalities": [list(field) for field in SEVEN_FIELDS],
            "five_row_theorem_hypotheses": FIVE_THEOREM_FIELDS,
            "five_row_sign_hypotheses": FIVE_SIGN_FIELDS,
            "five_row_radius_positivity": (
                "hr is obtained with r := dist O A from a strict signed-area "
                "hypothesis, hence O != A, and dist_pos.mpr"
            ),
            "seven_point_theorem_hypotheses": SEVEN_THEOREM_FIELDS,
        },
        "five_row": five,
        "seven_point": seven,
        "smt": {
            "status": "not_run",
            "reason": (
                "corrected consumer-first stop: neither exact live consumer "
                "signature has a full source-entitled role mapping; the formal "
                "SevenPoint min-two maps are diagonal-degenerate, and the viable "
                "frontiers are mapping audits only"
            ),
        },
    }
    OUTPUT_PATH.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "five_full_theorem": five["full_mapping_count_theorem_faithful"],
                "five_full_injective": five["full_mapping_count_injective"],
                "five_best_score": five[
                    "best_equality_score_out_of_10_after_all_six_signs"
                ],
                "seven_full_theorem": seven.get("full_mapping_count_theorem_faithful"),
                "seven_full_injective": seven.get("full_mapping_count_injective"),
                "seven_formal_missing": seven.get(
                    "minimum_omitted_premises_theorem_faithful"
                ),
                "seven_viable_missing": seven.get(
                    "minimum_omitted_premises_viable_theorem_faithful"
                ),
                "seven_injective_missing": seven.get(
                    "minimum_omitted_premises_injective"
                ),
            },
            sort_keys=True,
        )
    )


if __name__ == "__main__":
    main()
