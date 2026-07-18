#!/usr/bin/env python3
"""Independent replay of exact-six all-center gate schema and metric cuts."""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
from pathlib import Path

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
N = 14
SECOND_APEX = 9
VERTICES = tuple(range(N))
DEFAULT_BANK = (
    HERE.parent
    / "generic-biapex-kalmanson-search"
    / "round2-core-normal-forms"
    / "transported_2k3_bank.json"
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def reflected(
    vertex_count: int,
    schema: tuple[tuple[int, int], ...],
) -> tuple[tuple[int, int], ...]:
    return tuple(sorted(
        (vertex_count - 1 - center, vertex_count - 1 - point)
        for center, point in schema
    ))


def transform_schema(
    record: dict[str, object],
    embedding: tuple[int, ...],
    orientation: str,
) -> tuple[tuple[int, int], ...]:
    vertex_count = int(record["core_vertex_count"])
    if len(embedding) != vertex_count:
        raise AssertionError("embedding arity mismatch")
    if tuple(sorted(embedding)) != embedding or len(set(embedding)) != len(embedding):
        raise AssertionError("embedding is not strictly increasing")
    if any(point not in VERTICES for point in embedding):
        raise AssertionError("embedding vertex outside Fin 14")
    schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
    if orientation == "reverse":
        schema = reflected(vertex_count, schema)
    elif orientation != "forward":
        raise AssertionError(f"unexpected orientation {orientation}")
    return tuple(sorted(
        (embedding[center], embedding[point])
        for center, point in schema
    ))


def complete_application_count(bank: dict[str, object]) -> int:
    applications = set()
    for record in bank["schemas"]:
        vertex_count = int(record["core_vertex_count"])
        for embedding in itertools.combinations(VERTICES, vertex_count):
            for orientation in ("forward", "reverse"):
                applications.add(transform_schema(record, embedding, orientation))
    return len(applications)


def canonical_core_schema(core: tuple[str, ...]) -> dict[str, object] | None:
    if any(name.startswith("apex_shell_") for name in core):
        return None
    vertices = tuple(sorted({
        int(field)
        for name in core
        for field in name.split("_")[1:]
        if field.isdigit()
    }))
    role = {vertex: index for index, vertex in enumerate(vertices)}
    memberships = set()
    for name in core:
        fields = name.split("_")
        if fields[0] != "row":
            continue
        center, left, right = map(int, fields[1:])
        memberships.update(((role[center], role[left]), (role[center], role[right])))
    if not memberships:
        return None
    schema = tuple(sorted(memberships))
    return {
        "core_vertex_count": len(vertices),
        "order_schema": min(schema, reflected(len(vertices), schema)),
        "source_vertices": vertices,
    }


def generalized_application_count(record: dict[str, object]) -> int:
    vertex_count = int(record["core_vertex_count"])
    schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
    applications = set()
    for embedding in itertools.combinations(VERTICES, vertex_count):
        for oriented in (schema, reflected(vertex_count, schema)):
            applications.add(tuple(sorted(
                (embedding[center], embedding[point])
                for center, point in oriented
            )))
    return len(applications)


def edge(left: int, right: int) -> tuple[int, int]:
    return tuple(sorted((left, right)))


def dist(table: dict[tuple[int, int], z3.ArithRef], left: int, right: int):
    if left == right:
        return z3.RealVal(0)
    return table[edge(left, right)]


def named_formula(
    name: str,
    table: dict[tuple[int, int], z3.ArithRef],
) -> z3.BoolRef:
    fields = name.split("_")
    tag = fields[0]
    if tag == "apex" and fields[1] == "shell":
        reference, point = map(int, fields[2:])
        return (
            dist(table, SECOND_APEX, point)
            == dist(table, SECOND_APEX, reference)
        )
    values = tuple(map(int, fields[1:]))
    if tag == "pos":
        left, right = values
        return dist(table, left, right) >= 1
    if tag.startswith("tri"):
        a, b, c = values
        if tag == "tri0":
            return dist(table, a, b) + dist(table, b, c) >= dist(table, a, c) + 1
        if tag == "tri1":
            return dist(table, a, c) + dist(table, b, c) >= dist(table, a, b) + 1
        if tag == "tri2":
            return dist(table, a, b) + dist(table, a, c) >= dist(table, b, c) + 1
    if tag.startswith("kal"):
        a, b, c, d = values
        diagonal = dist(table, a, c) + dist(table, b, d)
        if tag == "kal1":
            return diagonal >= dist(table, a, b) + dist(table, c, d) + 1
        if tag == "kal2":
            return diagonal >= dist(table, a, d) + dist(table, b, c) + 1
    if tag == "row":
        center, reference, point = values
        return dist(table, center, point) == dist(table, center, reference)
    raise AssertionError(f"unrecognized tracked constraint {name}")


def replay_raw_refinement(refinement: dict[str, object]) -> None:
    core = tuple(refinement.get("core", ()))
    if not core:
        raise AssertionError("raw LRA refinement has no replay core")
    table = {
        (left, right): z3.Real(f"d_{left}_{right}")
        for left, right in itertools.combinations(VERTICES, 2)
    }
    solver = z3.Solver()
    solver.add(*(named_formula(name, table) for name in core))
    if solver.check() != z3.unsat:
        raise AssertionError("stored raw metric core is not exact-LRA UNSAT")
    memberships = set()
    for name in core:
        fields = name.split("_")
        if fields[0] == "row":
            center, reference, point = map(int, fields[1:])
            memberships.update(((center, reference), (center, point)))
    stored = {tuple(item) for item in refinement["required_memberships"]}
    if memberships != stored:
        raise AssertionError("raw metric core membership projection drift")
    has_shell = any(name.startswith("apex_shell_") for name in core)
    if bool(refinement["conditioned_on_shell"]) != has_shell:
        raise AssertionError("raw metric shell conditioning drift")


def verify_result(path: Path, bank_path: Path) -> dict[str, object]:
    payload = json.loads(path.read_text(encoding="utf-8"))
    bank = json.loads(bank_path.read_text(encoding="utf-8"))
    if payload.get("schema") != "p97-exact6-allcenter-capaware-gate-v1":
        raise AssertionError("unexpected result schema")
    expected_scope = "EXACT_SIX_MUTUAL_COMPLETE_ROW_SURFACE"
    if payload.get("scope") != expected_scope:
        raise AssertionError("result scope label drift")
    if str(payload["status"]).startswith("SAT_"):
        expected_sat = (
            "SAT_VERIFIED_EXACT6_MUTUAL_RETAINED_SUBSYSTEM_"
            "ABSTRACT_DISTANCE_SHADOW"
        )
        if payload["status"] != expected_sat:
            raise AssertionError("SAT result overstates the retained subsystem")
    if bank.get("schema") != "p97-whole-carrier-kalmanson-transported-schema-bank-v1":
        raise AssertionError("unexpected transported bank schema")
    bank_meta = payload["transported_schema_bank"]
    if bank_meta["sha256"] != sha256(bank_path):
        raise AssertionError("transported bank hash drift")
    if int(bank_meta["schema_count"]) != len(bank["schemas"]):
        raise AssertionError("transported bank schema count drift")

    seen = set()
    for application in payload["transported_schema_cuts"]:
        schema_index = int(application["schema_index"])
        transformed = transform_schema(
            bank["schemas"][schema_index],
            tuple(application["embedding"]),
            str(application["orientation"]),
        )
        stored = tuple(sorted(tuple(item) for item in application["required_memberships"]))
        if transformed != stored or len(stored) != 6:
            raise AssertionError("transported schema application drift")
        if stored in seen:
            raise AssertionError("duplicate transported schema application")
        seen.add(stored)
    if len(seen) != int(payload["transported_schema_cut_count"]):
        raise AssertionError("transported schema cut count drift")

    metric_cuts = payload["metric_core_cuts"]
    if len(metric_cuts) != int(payload["metric_core_cut_count"]):
        raise AssertionError("raw metric core cut count drift")
    for refinement in metric_cuts:
        if refinement["kind"] == "linear_metric_unsat":
            replay_raw_refinement(refinement)

    metric_core_set = {tuple(record["core"]) for record in metric_cuts}
    generalized = payload["generalized_metric_schemas"]
    if len(generalized) != int(payload["generalized_metric_schema_count"]):
        raise AssertionError("generalized metric schema count drift")
    seen_generalized = set()
    for record in generalized:
        source_core = tuple(record["source_core"])
        if source_core not in metric_core_set:
            raise AssertionError("generalized schema source core absent from cut ledger")
        canonical = canonical_core_schema(source_core)
        if canonical is None:
            raise AssertionError("nontransportable core recorded as generalized")
        if int(record["core_vertex_count"]) != canonical["core_vertex_count"]:
            raise AssertionError("generalized core vertex count drift")
        stored_schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
        if stored_schema != canonical["order_schema"]:
            raise AssertionError("generalized membership schema drift")
        key = (record["core_vertex_count"], stored_schema)
        if key in seen_generalized:
            raise AssertionError("duplicate generalized metric schema")
        seen_generalized.add(key)
        if generalized_application_count(record) != int(record["complete_application_count"]):
            raise AssertionError("generalized application count drift")

    closure_count = complete_application_count(bank)
    if closure_count != int(bank_meta["concrete_application_count"]):
        raise AssertionError("complete transported closure count drift")
    learned_meta = payload.get("learned_metric_schema_bank")
    learned_summary = None
    if learned_meta is not None:
        learned_path = Path(learned_meta["path"])
        if sha256(learned_path) != learned_meta["sha256"]:
            raise AssertionError("learned metric schema bank hash drift")
        learned = json.loads(learned_path.read_text(encoding="utf-8"))
        max_k = int(learned_meta["max_vertex_count"])
        selected = [
            record for record in learned["schemas"]
            if int(record["core_vertex_count"]) <= max_k
        ]
        applications = set()
        for record in selected:
            vertex_count = int(record["core_vertex_count"])
            schema = tuple(sorted(tuple(item) for item in record["order_schema"]))
            for embedding in itertools.combinations(VERTICES, vertex_count):
                for oriented in (schema, reflected(vertex_count, schema)):
                    applications.add(tuple(sorted(
                        (embedding[center], embedding[point])
                        for center, point in oriented
                    )))
        if len(selected) != int(learned_meta["selected_schema_count"]):
            raise AssertionError("learned selected schema count drift")
        if len(applications) != int(learned_meta["application_count"]):
            raise AssertionError("learned application union count drift")
        learned_summary = {
            "max_vertex_count": max_k,
            "selected_schema_count": len(selected),
            "application_count": len(applications),
        }
    return {
        "result": str(path),
        "status": payload["status"],
        "scope": payload["scope"],
        "transported_schema_cut_count": len(seen),
        "raw_metric_core_count": len(metric_cuts),
        "generalized_metric_schema_count": len(generalized),
        "full_closure_preloaded": payload["transported_schema_full_closure_preloaded"],
        "complete_application_count": closure_count,
        "learned_metric_schema_bank": learned_summary,
        "all_schema_applications_replayed": True,
        "all_raw_metric_cores_exact_lra_replayed": True,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("results", type=Path, nargs="+")
    parser.add_argument("--bank", type=Path, default=DEFAULT_BANK)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    verified = [verify_result(path, args.bank) for path in args.results]
    output = {
        "schema": "p97-exact6-allcenter-capaware-gate-independent-replay-v1",
        "status": "VERIFIED",
        "bank": str(args.bank.relative_to(ROOT)),
        "bank_sha256": sha256(args.bank),
        "results": verified,
    }
    rendered = json.dumps(output, indent=2, sort_keys=True) + "\n"
    if args.output is not None:
        args.output.write_text(rendered, encoding="utf-8")
    print(rendered, end="")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
