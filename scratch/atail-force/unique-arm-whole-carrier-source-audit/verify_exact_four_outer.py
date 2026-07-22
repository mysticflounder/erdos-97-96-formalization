#!/usr/bin/env python3
"""Independent semantic replay of an exact-four projection SAT witness."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def strongly_connected(rows: dict[int, set[int]], n: int) -> bool:
    for start in range(n):
        reached = {start}
        frontier = [start]
        while frontier:
            center = frontier.pop()
            for point in rows[center]:
                if point not in reached:
                    reached.add(point)
                    frontier.append(point)
        if len(reached) != n:
            return False
    return True


def replay_partitions(
    result: dict[str, object], n: int
) -> tuple[dict[int, list[set[int]]], dict[tuple[int, int, int], bool]]:
    true_payload = result["same_distance_true"]
    false_payload = result["same_distance_false"]
    stored_classes = result["radius_classes"]
    partitions: dict[int, list[set[int]]] = {}
    equality: dict[tuple[int, int, int], bool] = {}
    for center in range(n):
        targets = set(range(n)) - {center}
        expected_pairs = {tuple(pair) for pair in itertools.combinations(sorted(targets), 2)}
        true_pairs = {tuple(map(int, pair)) for pair in true_payload[str(center)]}
        false_pairs = {tuple(map(int, pair)) for pair in false_payload[str(center)]}
        require(not (true_pairs & false_pairs), f"center {center} has contradictory equality atoms")
        require(true_pairs | false_pairs == expected_pairs,
                f"center {center} does not explicitly assign every equality atom")
        adjacency = {point: {point} for point in targets}
        for left, right in true_pairs:
            adjacency[left].add(right)
            adjacency[right].add(left)
        unseen = set(targets)
        components: list[set[int]] = []
        while unseen:
            start = min(unseen)
            component: set[int] = set()
            frontier = [start]
            while frontier:
                point = frontier.pop()
                if point in component:
                    continue
                component.add(point)
                frontier.extend(adjacency[point] - component)
            unseen -= component
            components.append(component)
        for component in components:
            for left, right in itertools.combinations(sorted(component), 2):
                require((left, right) in true_pairs,
                        f"center {center} equality atoms are not transitive")
        for left, right in false_pairs:
            require(not any({left, right} <= component for component in components),
                    f"center {center} false atom lies inside an equality class")
        expected_stored = [sorted(component) for component in components]
        require(stored_classes[str(center)] == expected_stored,
                f"center {center} stored classes disagree with explicit atoms")
        partitions[center] = components
        for left, right in expected_pairs:
            equality[center, left, right] = (left, right) in true_pairs
    return partitions, equality


def eq(equality: dict[tuple[int, int, int], bool], center: int, left: int, right: int) -> bool:
    if left == right:
        return True
    require(center not in {left, right}, "attempted to query a positive-radius atom at its center")
    return equality[center, min(left, right), max(left, right)]


def load_planar_bank(path: Path) -> list[tuple[int, tuple[tuple[int, int], ...]]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    require(
        payload.get("schema") == "p97-whole-carrier-planar-membership-schema-bank-v1",
        "unexpected planar bank schema",
    )
    records = payload.get("schemas")
    require(isinstance(records, list), "planar bank schemas is not a list")
    require(int(payload.get("schema_count", -1)) == len(records), "planar bank count mismatch")
    answer = []
    for index, record in enumerate(records):
        k = int(record["active_role_count"])
        memberships = tuple(sorted(tuple(map(int, pair)) for pair in record["memberships"]))
        require(record.get("transport") == "all_injective_role_maps",
                f"schema {index} is not injectively transportable")
        require(len(set(memberships)) == len(memberships),
                f"schema {index} has duplicate memberships")
        require(all(c != p and 0 <= c < k and 0 <= p < k for c, p in memberships),
                f"schema {index} is malformed")
        require(set(range(k)) == {role for pair in memberships for role in pair},
                f"schema {index} has an unused role")
        answer.append((k, memberships))
    return answer


def load_kalmanson_bank(path: Path) -> list[tuple[int, tuple[tuple[int, int], ...]]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    require(payload.get("schema") == "p97-exact-four-kalmanson-order-schema-bank-v1",
            "unexpected Kalmanson bank schema")
    records = payload.get("schemas")
    require(isinstance(records, list), "Kalmanson bank schemas is not a list")
    require(int(payload.get("schema_count", -1)) == len(records),
            "Kalmanson bank count mismatch")
    answer = []
    for index, record in enumerate(records):
        k = int(record["core_vertex_count"])
        schema = tuple(sorted(tuple(map(int, pair)) for pair in record["order_schema"]))
        require(record.get("transport") == "order_preserving_and_reflected_injections",
                f"Kalmanson schema {index} has the wrong transport")
        require(len(set(schema)) == len(schema),
                f"Kalmanson schema {index} has duplicate memberships")
        require(all(c != p and 0 <= c < k and 0 <= p < k for c, p in schema),
                f"Kalmanson schema {index} is malformed")
        answer.append((k, schema))
    return answer


def load_u5_bank(
    path: Path,
) -> list[tuple[int, tuple[tuple[int, int], ...], tuple[tuple[int, int], ...]]]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    require(payload.get("schema") == "p97-exact-four-u5-signed-schema-bank-v1",
            "unexpected U5 bank schema")
    records = payload.get("schemas")
    require(isinstance(records, list), "U5 bank schemas is not a list")
    require(int(payload.get("schema_count", -1)) == len(records), "U5 bank count mismatch")
    answer = []
    for index, record in enumerate(records):
        k = int(record["role_count"])
        positive = tuple(sorted(tuple(map(int, pair)) for pair in record["positive_memberships"]))
        negative = tuple(sorted(tuple(map(int, pair)) for pair in record["negative_memberships"]))
        require(record.get("transport") == "all_injective_role_maps",
                f"U5 schema {index} has the wrong transport")
        require(not (set(positive) & set(negative)), f"U5 schema {index} is contradictory")
        require(len(set(positive)) == len(positive) and len(set(negative)) == len(negative),
                f"U5 schema {index} has duplicate atoms")
        require(all(c != p and 0 <= c < k and 0 <= p < k
                    for c, p in (*positive, *negative)), f"U5 schema {index} is malformed")
        answer.append((k, positive, negative))
    return answer


def verify(
    result: dict[str, object],
    bank_path: Path,
    kalmanson_bank_path: Path,
    u5_bank_path: Path,
    cnf_path: Path,
) -> dict[str, object]:
    require(result.get("encoding_schema") == "p97-late-choice-exact-four-full-partition-v1",
            "unexpected result schema")
    require(result.get("solver_status") == "SAT", "semantic replay requires a SAT result")
    require(bool(result.get("cnf_model_checked")), "encoder did not record a CNF model check")
    require(result.get("cnf_sha256") == sha256(cnf_path), "DIMACS digest mismatch")
    require(result.get("planar_bank_sha256") == sha256(bank_path), "planar bank digest mismatch")
    require(result.get("kalmanson_bank_sha256") == sha256(kalmanson_bank_path),
            "Kalmanson bank digest mismatch")
    require(result.get("u5_bank_sha256") == sha256(u5_bank_path), "U5 bank digest mismatch")

    n = int(result["n"])
    require(n == 11, "prototype replay expects n=11")
    opp1_card = int(result["opp1_card"])
    require(opp1_card in {4, 5}, "invalid first opposite cap size")
    first_apex = 0
    second_apex = 4
    surplus_vertex = 4 + (opp1_card - 2) + 1
    vertices = set(range(n))
    surplus_cap = {0, 1, 2, 3, 4}
    opp1 = set(range(second_apex, surplus_vertex + 1))
    opp2 = {surplus_vertex, *range(surplus_vertex + 1, n), first_apex}
    strict1 = opp1 - {second_apex, surplus_vertex}
    expected_caps = {
        "surplus": sorted(surplus_cap),
        "first_opposite": sorted(opp1),
        "second_opposite": sorted(opp2),
    }
    require(result.get("closed_caps") == expected_caps, "encoded cap metadata mismatch")
    require(len(surplus_cap) == 5 and len(opp1) == opp1_card
            and len(opp2) == 9 - opp1_card, "cap cardinality reconstruction failed")
    require(surplus_cap | opp1 | opp2 == vertices, "caps do not cover the carrier")
    require(surplus_cap & opp1 == {second_apex}, "surplus/opp1 overlap is wrong")
    require(opp1 & opp2 == {surplus_vertex}, "opposite cap overlap is wrong")
    require(opp2 & surplus_cap == {first_apex}, "opp2/surplus overlap is wrong")

    partitions, equality = replay_partitions(result, n)

    rows = {int(center): set(map(int, support))
            for center, support in result["rows"].items()}
    require(set(rows) == vertices, "selected rows do not cover all centers")
    for center, support in rows.items():
        require(len(support) == 4, f"row {center} does not have cardinality four")
        require(support <= vertices, f"row {center} has an out-of-range point")
        require(center not in support, f"row {center} contains its center")
        require(any(support <= component for component in partitions[center]),
                f"row {center} is not contained in one complete radius class")

    # Replay full-class geometry rather than only selected-row projections.
    for left, right in itertools.combinations(range(n), 2):
        for left_class in partitions[left]:
            for right_class in partitions[right]:
                require(len(left_class & right_class) <= 2,
                        f"complete classes at {left},{right} intersect in more than two points")
    for p, q in itertools.combinations(range(n), 2):
        centers = {center for center in range(n) if center not in {p, q}
                   and eq(equality, center, p, q)}
        require(len(centers) <= 2, f"pair {p},{q} occurs at more than two centers")
    for left, right in itertools.combinations(range(n), 2):
        possible = [point for point in range(n) if point not in {left, right}]
        for p, q in itertools.combinations(possible, 2):
            if not (eq(equality, left, p, q) and eq(equality, right, p, q)):
                continue
            alternates = (left < p < right) != (left < q < right)
            require(alternates,
                    f"full shared chord {p},{q} does not alternate with {left},{right}")
    require(strongly_connected(rows, n), "selected-row digraph is not strongly connected")

    exact_class = set(map(int, result["first_apex_exact_class"]))
    require(len(exact_class) == 4, "first-apex class is not exact four")
    require(first_apex not in exact_class, "first apex lies in its positive-radius class")
    require(rows[first_apex] == exact_class, "first-apex selected row differs from the class")
    require(exact_class in partitions[first_apex],
            "first-apex distinguished class is not a complete partition block")
    require(all(component == exact_class or len(component) <= 3
                for component in partitions[first_apex]),
            "first apex has another K4 radius class")
    require(len(exact_class & surplus_cap) <= 1,
            "first-apex class violates the surplus-cap one-hit theorem")
    require(len(exact_class & opp2) <= 1,
            "first-apex class violates the second-opposite-cap one-hit theorem")

    overlay = bool(result.get("strict_cap_minimality_overlay", False))
    witness = result.get("strict_cap_minimality_witness")
    if overlay:
        require(isinstance(witness, dict), "minimality overlay lacks its witness")
        center = int(witness["center"])
        deleted = set(map(int, witness["deleted_set"]))
        triangle = {first_apex, second_apex, surplus_vertex}
        protected = exact_class | triangle
        require(center in vertices, "minimality center is outside the carrier")
        require(center not in protected,
                "minimality center is not fresh from class union triangle")
        require(bool(deleted), "minimality deletion set is empty")
        require(deleted <= protected,
                "minimality deletion set is not protected")
        require(all(len(component - deleted) <= 3 for component in partitions[center]),
                "minimality center retains K4 after deleting V")
        for source in deleted:
            restored_carrier = vertices - (deleted - {source})
            require(any(len(component & restored_carrier) >= 4
                        for component in partitions[center]),
                    f"returning deleted source {source} does not restore K4")
    else:
        require(witness is None, "disabled minimality overlay emitted a witness")

    interior_record = result["strict_cap_pair"]
    iq, iw = int(interior_record["q"]), int(interior_record["w"])
    require(iq != iw, "strict-cap pair is not distinct")
    require({iq, iw} <= strict1, "strict-cap pair is not in the first opposite interior")
    require({iq, iw} <= exact_class, "strict-cap pair is not in the exact class")

    pair_overlay = bool(result.get("pair_minimality_overlay", False))
    pair_witness = result.get("pair_minimality_witness")
    if pair_overlay:
        require(isinstance(pair_witness, dict), "pair minimality overlay lacks its witness")
        center = int(pair_witness["center"])
        deleted = set(map(int, pair_witness["deleted_set"]))
        pair = {iq, iw}
        require(center in vertices - pair,
                "pair minimality center is not a remaining carrier point")
        require(bool(deleted) and deleted <= pair,
                "pair minimality deletion set is not a nonempty pair subset")
        require(len(deleted) in {1, 2},
                "pair minimality deletion set has impossible cardinality")
        require(all(len(component - deleted) <= 3 for component in partitions[center]),
                "pair minimality center retains K4 after deleting V")
        for source in deleted:
            restored_carrier = vertices - (deleted - {source})
            require(any(len(component & restored_carrier) >= 4
                        for component in partitions[center]),
                    f"returning pair source {source} does not restore K4")
    else:
        require(pair_witness is None, "disabled pair minimality overlay emitted a witness")

    retained_record = result["retained_frontier_pair"]
    rq, rw = int(retained_record["q"]), int(retained_record["w"])
    require(rq != rw, "retained frontier pair is not distinct")
    require({rq, rw} <= exact_class, "retained frontier pair is not in the exact class")
    require(not ({rq, rw} & surplus_cap), "retained frontier pair meets the surplus cap")
    second_deleted = set(map(int, result["second_apex_double_deletion_row"]))
    require(len(second_deleted) == 4 and second_deleted <= vertices,
            "second-apex double-deletion row is not a four-subset")
    require(second_apex not in second_deleted,
            "second-apex double-deletion row contains its center")
    require(not ({rq, rw} & second_deleted),
            "second-apex double-deletion row meets the retained pair")
    require(any(second_deleted <= component for component in partitions[second_apex]),
            "second-apex double-deletion row is not contained in one complete class")

    blockers = {int(source): int(center) for source, center in result["blockers"].items()}
    supports = {int(source): set(map(int, support))
                for source, support in result["critical_supports"].items()}
    require(set(blockers) == vertices and set(supports) == vertices,
            "critical system does not cover all sources")
    for source in range(n):
        center = blockers[source]
        support = supports[source]
        require(center in vertices and center != source,
                f"source {source} has an invalid blocker")
        require(len(support) == 4 and support <= vertices,
                f"source {source} has a malformed critical support")
        require(source in support, f"source {source} is absent from its critical support")
        require(center not in support, f"critical support {source} contains its center")
        source_class = next(component for component in partitions[center] if source in component)
        require(support == source_class,
                f"source {source} support is not its complete blocker-radius class")
        require(all(len(component - {source}) <= 3 for component in partitions[center]),
                f"deleting source {source} leaves a K4 class at blocker {center}")
        require(rows[center] == support,
                f"selected completion at blocker {center} differs from source {source}'s support")
        require((center == first_apex) == (source in exact_class),
                f"late first-apex fiber equivalence fails at source {source}")
        if source in exact_class:
            require(support == exact_class,
                    f"class source {source} does not have the exact class support")
    for left, right in itertools.combinations(range(n), 2):
        if blockers[left] == blockers[right]:
            require(supports[left] == supports[right],
                    f"sources {left},{right} share a blocker but not a support")

    for center in range(n):
        if center != first_apex and center not in strict1:
            require(not eq(equality, center, iq, iw),
                    f"full partition at forbidden center {center} equates the strict pair")

    schemas = load_planar_bank(bank_path)
    checked_injections = 0
    checked_schemas = 0
    skipped_schemas = 0
    for k, memberships in schemas:
        if k > n:
            skipped_schemas += 1
            continue
        checked_schemas += 1
        for targets in itertools.permutations(range(n), k):
            checked_injections += 1
            require(
                not all(targets[point] in rows[targets[center]]
                        for center, point in memberships),
                f"planar schema occurs at injective role map {targets}",
            )
    require(int(result["planar_raw_injection_count"]) == checked_injections,
            "encoder/verifier planar injection counts differ")

    kalmanson_schemas = load_kalmanson_bank(kalmanson_bank_path)
    kalmanson_injections = 0
    checked_kalmanson = 0
    skipped_kalmanson = 0
    for k, schema in kalmanson_schemas:
        if k > n:
            skipped_kalmanson += 1
            continue
        checked_kalmanson += 1
        reflected = tuple(sorted((k - 1 - center, k - 1 - point)
                                 for center, point in schema))
        for targets in itertools.combinations(range(n), k):
            for oriented in {schema, reflected}:
                kalmanson_injections += 1
                require(
                    not all(targets[point] in rows[targets[center]]
                            for center, point in oriented),
                    f"Kalmanson order schema occurs at target tuple {targets}",
                )
    require(int(result["kalmanson_embedding_count"]) == kalmanson_injections,
            "encoder/verifier Kalmanson embedding counts differ")

    u5_schemas = load_u5_bank(u5_bank_path)
    u5_injections = 0
    checked_u5 = 0
    skipped_u5 = 0
    for k, positive, negative in u5_schemas:
        if k > n:
            skipped_u5 += 1
            continue
        checked_u5 += 1
        for targets in itertools.permutations(range(n), k):
            u5_injections += 1
            positive_holds = all(targets[point] in rows[targets[center]]
                                 for center, point in positive)
            negative_holds = all(targets[point] not in rows[targets[center]]
                                 for center, point in negative)
            require(not (positive_holds and negative_holds),
                    f"signed U5 schema occurs at role map {targets}")
    require(int(result["u5_embedding_count"]) == u5_injections,
            "encoder/verifier U5 embedding counts differ")

    return {
        "schema": "p97-late-choice-exact-four-full-partition-semantic-replay-v1",
        "status": "VERIFIED_SAT_PROJECTION",
        "source_result_sha256": hashlib.sha256(
            (json.dumps(result, sort_keys=True) + "\n").encode("utf-8")
        ).hexdigest(),
        "cnf_sha256": sha256(cnf_path),
        "planar_bank_sha256": sha256(bank_path),
        "kalmanson_bank_sha256": sha256(kalmanson_bank_path),
        "u5_bank_sha256": sha256(u5_bank_path),
        "n": n,
        "opp1_card": opp1_card,
        "checked_planar_schema_count": checked_schemas,
        "skipped_planar_schema_count": skipped_schemas,
        "checked_planar_injection_count": checked_injections,
        "checked_kalmanson_schema_count": checked_kalmanson,
        "skipped_kalmanson_schema_count": skipped_kalmanson,
        "checked_kalmanson_embedding_count": kalmanson_injections,
        "checked_u5_schema_count": checked_u5,
        "skipped_u5_schema_count": skipped_u5,
        "checked_u5_embedding_count": u5_injections,
        "all_encoded_semantic_constraints_replayed": True,
        "strict_cap_minimality_overlay_replayed": overlay,
        "pair_minimality_overlay_replayed": pair_overlay,
        "claim_scope": (
            "This verifies a SAT witness for the documented finite projection; "
            "it is not a Euclidean realization or a model of every Lean source field."
        ),
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("result", type=Path)
    parser.add_argument("planar_bank", type=Path)
    parser.add_argument("kalmanson_bank", type=Path)
    parser.add_argument("u5_bank", type=Path)
    parser.add_argument("cnf", type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    result = json.loads(args.result.read_text(encoding="utf-8"))
    replay = verify(
        result, args.planar_bank, args.kalmanson_bank, args.u5_bank, args.cnf
    )
    # Hash the actual source result bytes for a stable artifact reference.
    replay["source_result"] = str(args.result)
    replay["source_result_sha256"] = sha256(args.result)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(replay, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(replay, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
