#!/usr/bin/env python3
"""Extract exact Farkas multipliers and order normal forms from round-two cores."""

from __future__ import annotations

import argparse
import json
import math
from collections import Counter, defaultdict
from fractions import Fraction
from pathlib import Path

import z3


Distance = tuple[int, int]


def distance(left: int, right: int) -> Distance | None:
    if left == right:
        return None
    return tuple(sorted((left, right)))


def add_term(vector: dict[Distance, int], left: int, right: int, coefficient: int) -> None:
    edge = distance(left, right)
    if edge is not None:
        vector[edge] = vector.get(edge, 0) + coefficient
        if vector[edge] == 0:
            del vector[edge]


def constraint_vector(name: str) -> tuple[str, dict[Distance, int]]:
    fields = name.split("_")
    kind = fields[0]
    vertices = tuple(map(int, fields[1:]))
    vector: dict[Distance, int] = {}
    if kind in {"kal1", "kal2"}:
        a, b, c, d = vertices
        add_term(vector, a, c, 1)
        add_term(vector, b, d, 1)
        if kind == "kal1":
            add_term(vector, a, b, -1)
            add_term(vector, c, d, -1)
        else:
            add_term(vector, a, d, -1)
            add_term(vector, b, c, -1)
        return "ineq", vector
    if kind == "row":
        center, anchor, point = vertices
        add_term(vector, center, point, 1)
        add_term(vector, center, anchor, -1)
        return "eq", vector
    raise ValueError(f"unsupported constraint {name}")


def is_unsat(names: tuple[str, ...]) -> bool:
    vectors = {name: constraint_vector(name) for name in names}
    edges = sorted({edge for _kind, vector in vectors.values() for edge in vector})
    variables = {edge: z3.Real(f"d_{edge[0]}_{edge[1]}") for edge in edges}
    solver = z3.Solver()
    for name in names:
        kind, vector = vectors[name]
        expression = sum(coefficient * variables[edge] for edge, coefficient in vector.items())
        solver.add(expression >= 1 if kind == "ineq" else expression == 0)
    return solver.check() == z3.unsat


def deletion_minimize(names: tuple[str, ...]) -> tuple[str, ...]:
    answer = list(names)
    changed = True
    while changed:
        changed = False
        for name in tuple(answer):
            candidate = tuple(item for item in answer if item != name)
            if is_unsat(candidate):
                answer = list(candidate)
                changed = True
    return tuple(answer)


def rational(value: z3.RatNumRef) -> Fraction:
    return Fraction(value.numerator_as_long(), value.denominator_as_long())


def farkas_multipliers(names: tuple[str, ...]) -> dict[str, Fraction]:
    vectors = {name: constraint_vector(name) for name in names}
    inequalities = [name for name in names if vectors[name][0] == "ineq"]
    equalities = [name for name in names if vectors[name][0] == "eq"]
    edges = sorted({edge for _kind, vector in vectors.values() for edge in vector})

    weights = {name: z3.Real(f"w_{index}") for index, name in enumerate(names)}
    solver = z3.Solver()
    for name in inequalities:
        solver.add(weights[name] >= 0)
    solver.add(sum(weights[name] for name in inequalities) == 1)
    for edge in edges:
        solver.add(
            sum(weights[name] * vectors[name][1].get(edge, 0) for name in names) == 0
        )
    if solver.check() != z3.sat:
        raise RuntimeError(f"no Farkas multipliers for {names}")
    model = solver.model()
    result = {name: rational(model.eval(weights[name], model_completion=True)) for name in names}
    if any(result[name] <= 0 for name in inequalities):
        raise RuntimeError(f"nonminimal or zero-weight inequality in {names}: {result}")

    denominators = [value.denominator for value in result.values()]
    common = math.lcm(*denominators)
    integers = {name: int(value * common) for name, value in result.items()}
    divisor = math.gcd(*(abs(value) for value in integers.values() if value != 0))
    primitive = {name: Fraction(value // divisor) for name, value in integers.items()}
    total: dict[Distance, Fraction] = defaultdict(Fraction)
    for name, multiplier in primitive.items():
        for edge, coefficient in vectors[name][1].items():
            total[edge] += multiplier * coefficient
    residue = {edge: coefficient for edge, coefficient in total.items() if coefficient != 0}
    if residue:
        raise RuntimeError(f"nonzero exact Farkas residue for {names}: {residue}")
    return primitive


def used_vertices(names: tuple[str, ...]) -> tuple[int, ...]:
    return tuple(sorted({int(field) for name in names for field in name.split("_")[1:]}))


def relabel_name(name: str, role: dict[int, int]) -> str:
    fields = name.split("_")
    kind = fields[0]
    vertices = tuple(role[int(field)] for field in fields[1:])
    if kind == "row":
        center, left, right = vertices
        left, right = sorted((left, right))
        vertices = (center, left, right)
    return "_".join((kind, *(str(vertex) for vertex in vertices)))


def reflected_name(name: str, vertex_count: int) -> str:
    fields = name.split("_")
    kind = fields[0]
    mapped = tuple(vertex_count - 1 - int(field) for field in fields[1:])
    if kind in {"kal1", "kal2"}:
        mapped = tuple(reversed(mapped))
    else:
        center, left, right = mapped
        mapped = (center, *sorted((left, right)))
    return "_".join((kind, *(str(vertex) for vertex in mapped)))


def normalized_form(
    names: tuple[str, ...], multipliers: dict[str, Fraction]
) -> tuple[tuple[str, int], ...]:
    vertices = used_vertices(names)
    role = {vertex: index for index, vertex in enumerate(vertices)}
    direct = tuple(sorted((relabel_name(name, role), int(multipliers[name])) for name in names))
    reflected = tuple(
        sorted((reflected_name(name, len(vertices)), coefficient) for name, coefficient in direct)
    )
    return min(direct, reflected)


def load_cores(input_dir: Path) -> list[dict[str, object]]:
    records: list[dict[str, object]] = []
    for path in sorted(input_dir.glob("*.json")):
        if path.name.endswith(".summary.json") or path.name == "manifest.json":
            continue
        payload = json.loads(path.read_text(encoding="utf-8"))
        for refinement in payload.get("refinements", []):
            if refinement.get("kind") != "FULL_LRA":
                continue
            records.append(
                {
                    "source": path.name,
                    "attempt": refinement["attempt"],
                    "n": payload["n"],
                    "second_apex": payload["omitted_apices"][1],
                    "raw_names": tuple(refinement["metric_core"]),
                }
            )
    return records


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input_dir", type=Path)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()

    records = load_cores(args.input_dir)
    forms: dict[tuple[tuple[str, int], ...], list[int]] = defaultdict(list)
    output_records: list[dict[str, object]] = []
    for index, record in enumerate(records):
        minimized = deletion_minimize(record["raw_names"])
        multipliers = farkas_multipliers(minimized)
        form = normalized_form(minimized, multipliers)
        forms[form].append(index)
        output_records.append(
            {
                **record,
                "raw_names": list(record["raw_names"]),
                "minimized_names": list(minimized),
                "multipliers": {name: str(value) for name, value in multipliers.items()},
                "vertex_count": len(used_vertices(minimized)),
                "inequality_count": sum(name.startswith("kal") for name in minimized),
                "row_equality_count": sum(name.startswith("row") for name in minimized),
                "normal_form": [[name, coefficient] for name, coefficient in form],
            }
        )

    form_records = []
    for form, indices in sorted(forms.items(), key=lambda item: (-len(item[1]), item[0])):
        form_records.append(
            {
                "frequency": len(indices),
                "record_indices": indices,
                "vertex_count": len(
                    {
                        int(field)
                        for name, _coefficient in form
                        for field in name.split("_")[1:]
                    }
                ),
                "inequality_count": sum(name.startswith("kal") for name, _ in form),
                "row_equality_count": sum(name.startswith("row") for name, _ in form),
                "constraints": [[name, coefficient] for name, coefficient in form],
            }
        )

    summary = {
        "schema": "p97-round2-full-lra-normal-forms-v1",
        "core_count": len(records),
        "normal_form_count": len(forms),
        "all_raw_cores_deletion_minimal": all(
            tuple(item["raw_names"]) == tuple(item["minimized_names"])
            for item in output_records
        ),
        "all_primitive_certificates_exactly_cancel": True,
        "size_distribution": {
            f"{size[0]}ineq/{size[1]}row": count
            for size, count in Counter(
                (item["inequality_count"], item["row_equality_count"])
                for item in output_records
            ).items()
        },
        "forms": form_records,
        "records": output_records,
    }
    serialized = json.dumps(summary, indent=2, sort_keys=True) + "\n"
    if args.output is None:
        print(serialized, end="")
    else:
        args.output.write_text(serialized, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
