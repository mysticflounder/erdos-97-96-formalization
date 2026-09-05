"""Offline affine-relation miner for an exact-13 row table.

The input is only an incidence table.  A row ``(a; b,c,d,e)`` says that the
four distances from ``a`` to its support are equal.  Equalities are closed
through edge identities, but rows never acquire an equality merely because
they share support labels.  The module deliberately has a small, JSON-safe
API: :func:`mine`, :func:`verify`, and :func:`verify_certificate`.
"""

from __future__ import annotations

import argparse
import itertools
import json
import math
import sys
from collections.abc import Iterable, Sequence
from fractions import Fraction
from pathlib import Path
from typing import Any

import sympy as sp

N = 13
LABELS = tuple(range(N))
BASE_NAMES = ("C0", "C1", "K", "L", "T")
EDGE_LIST = tuple(itertools.combinations(LABELS, 2))


def _error(message: str) -> ValueError:
    return ValueError(f"exact13 affine input: {message}")


def _edge(a: int, b: int) -> tuple[int, int]:
    if a == b:
        raise _error("an edge has equal endpoints")
    return (a, b) if a < b else (b, a)


class _DSU:
    def __init__(self, values: Iterable[Any]) -> None:
        self.parent = {value: value for value in values}

    def find(self, value: Any) -> Any:
        parent = self.parent[value]
        if parent != value:
            parent = self.find(parent)
            self.parent[value] = parent
        return parent

    def union(self, left: Any, right: Any) -> None:
        a, b = self.find(left), self.find(right)
        if a != b:
            self.parent[max(a, b)] = min(a, b)


def _support(value: Any, label: str) -> tuple[int, ...]:
    if not isinstance(value, (list, tuple)):
        raise _error(f"{label} support is not an array")
    if len(value) != 4 or any(type(point) is not int for point in value):
        raise _error(f"{label} support must contain four integer labels")
    points = tuple(value)
    if len(set(points)) != 4 or any(point not in LABELS for point in points):
        raise _error(f"{label} support is not four distinct labels in 0..12")
    return tuple(sorted(points))


def _row_object(value: Any, *, default_id: str, default_center: int | None = None) -> dict[str, Any]:
    if isinstance(value, dict):
        center = value.get("center", default_center)
        support = value.get("support")
        row_id = value.get("id", value.get("name", default_id))
    else:
        center, support, row_id = default_center, value, default_id
    if type(center) is not int or center not in LABELS:
        raise _error(f"{default_id} center is not a label in 0..12")
    if default_center is not None and center != default_center:
        raise _error(f"{default_id} center disagrees with its row family")
    if not isinstance(row_id, str) or not row_id:
        raise _error(f"{default_id} row id is not a nonempty string")
    points = _support(support, default_id)
    if center in points:
        raise _error(f"{default_id} contains its center")
    return {"id": row_id, "center": center, "support": list(points)}


def _many_rows(value: Any, *, prefix: str, center: int | None = None) -> list[dict[str, Any]]:
    """Parse one support, one row object, or a list of either."""
    if isinstance(value, dict):
        return [_row_object(value, default_id=prefix, default_center=center)]
    if isinstance(value, (list, tuple)) and len(value) == 4 and all(type(x) is int for x in value):
        return [_row_object(value, default_id=prefix, default_center=center)]
    if not isinstance(value, (list, tuple)) or not value:
        raise _error(f"{prefix} has no rows")
    rows = []
    for index, item in enumerate(value):
        rows.append(_row_object(item, default_id=f"{prefix}#{index}", default_center=center))
    return rows


def normalize_rows(value: Any) -> list[dict[str, Any]]:
    """Normalize a decoded cell, a ``{'rows': ...}`` object, or row records."""
    if isinstance(value, dict) and "roles" in value and "base_rows" in value and "global_rows" in value:
        roles = value["roles"]
        if not isinstance(roles, dict) or type(roles.get("b0")) is not int or type(roles.get("b1")) is not int:
            raise _error("roles must provide integer b0 and b1")
        if roles["b0"] == roles["b1"] or any(x not in LABELS for x in (roles["b0"], roles["b1"])):
            raise _error("b0 and b1 must be distinct labels in 0..12")
        base, globals_by_center = value["base_rows"], value["global_rows"]
        if not isinstance(base, dict) or not isinstance(globals_by_center, dict):
            raise _error("base_rows and global_rows must be objects")
        rows: list[dict[str, Any]] = []
        centers = {"C0": roles["b0"], "C1": roles["b1"], "K": 0, "L": 0, "T": 1}
        for name in BASE_NAMES:
            if name not in base:
                raise _error(f"missing base row {name}")
            rows.extend(_many_rows(base[name], prefix=name, center=centers[name]))
        for center_text, raw in globals_by_center.items():
            try:
                center = int(center_text)
            except (TypeError, ValueError) as exc:
                raise _error(f"global row key {center_text!r} is not an integer") from exc
            if center not in LABELS:
                raise _error("global row center is outside 0..12")
            rows.extend(_many_rows(raw, prefix=f"G{center}", center=center))
        return _unique_rows(rows)

    if isinstance(value, dict) and "sample" in value:
        sample = value["sample"]
        if not isinstance(sample, dict) or "rows" not in sample:
            raise _error("sample object has no rows")
        value = sample["rows"]
    elif isinstance(value, dict) and "rows" in value:
        value = value["rows"]
    if not isinstance(value, (list, tuple)) or not value:
        raise _error("normalized input must contain a nonempty row list")
    rows = []
    for index, item in enumerate(value):
        rows.append(_row_object(item, default_id=f"row#{index}"))
    return _unique_rows(rows)


def _unique_rows(rows: list[dict[str, Any]]) -> list[dict[str, Any]]:
    seen: set[str] = set()
    for row in rows:
        if row["id"] in seen:
            raise _error(f"duplicate row id {row['id']!r}")
        seen.add(row["id"])
    return rows


def _closure(rows: Sequence[dict[str, Any]]) -> tuple[_DSU, dict[tuple[int, int], list[dict[str, Any]]]]:
    dsu = _DSU(EDGE_LIST)
    atoms: dict[tuple[int, int], list[dict[str, Any]]] = {edge: [] for edge in EDGE_LIST}
    for row in rows:
        center = row["center"]
        edges = [_edge(center, point) for point in row["support"]]
        anchor = edges[0]
        for edge in edges[1:]:
            dsu.union(anchor, edge)
        for edge in edges:
            atoms[edge].append(row)
    return dsu, atoms


def _relation_records(rows: Sequence[dict[str, Any]], dsu: _DSU) -> list[dict[str, Any]]:
    found: dict[tuple[int, ...], dict[str, Any]] = {}
    for four in itertools.combinations(LABELS, 4):
        for left in itertools.combinations(four, 2):
            right = tuple(point for point in four if point not in left)
            if left > right:
                continue
            cross = [_edge(a, x) for a in left for x in right]
            if len({dsu.find(edge) for edge in cross}) != 1:
                continue
            vector = tuple((1 if index in left else -1 if index in right else 0) for index in LABELS)
            canonical = min(vector, tuple(-x for x in vector))
            if canonical in found:
                continue
            positive = [index for index, coefficient in enumerate(canonical) if coefficient == 1]
            negative = [index for index, coefficient in enumerate(canonical) if coefficient == -1]
            found[canonical] = {
                "vector": list(canonical),
                "positive": positive,
                "negative": negative,
                "cross_edges": [list(edge) for edge in cross],
                "supporting_row_ids": [row["id"] for row in rows],
                "supporting_atoms": [dict(row) for row in rows],
            }
    return [found[key] for key in sorted(found)]


def _integerize(values: Sequence[sp.Rational]) -> list[int]:
    rationals = [Fraction(int(x.p), int(x.q)) if isinstance(x, sp.Rational) else Fraction(x) for x in values]
    denominator = 1
    for value in rationals:
        denominator = math.lcm(denominator, value.denominator)
    integers = [value.numerator * (denominator // value.denominator) for value in rationals]
    divisor = 0
    for value in integers:
        divisor = math.gcd(divisor, abs(value))
    return [value // divisor for value in integers] if divisor else integers


def _sparse_certificate(vectors: list[list[int]], size: int) -> dict[str, Any] | None:
    """Find one sparse span vector.

    The support-2 search is complete: the nullspace of the outside
    projection is exactly the span intersection with each candidate pair.
    The support-3 search returns a basis witness when one has a three-point
    image; absence is therefore reported as ``no_certificate_found`` rather
    than as a claim that no collinearity exists.
    """
    if not vectors:
        return None
    matrix = sp.Matrix(vectors)  # relation rows
    transposed = matrix.T
    for support in itertools.combinations(LABELS, size):
        outside = [index for index in LABELS if index not in support]
        projection = transposed[outside, :]
        for nullvector in projection.nullspace():
            result_q = transposed * nullvector
            if any(result_q[index] != 0 for index in outside):
                continue
            if sum(result_q) != 0 or sum(result_q[index] != 0 for index in support) != size:
                continue
            coefficients = _integerize(list(nullvector))
            result = [sum(coefficients[row] * vectors[row][index] for row in range(len(vectors))) for index in LABELS]
            if [index for index, value in enumerate(result) if value] != list(support):
                continue
            first = next(value for value in result if value)
            if first < 0:
                coefficients = [-value for value in coefficients]
                result = [-value for value in result]
            terms = [
                {"relation_index": index, "coefficient": coefficient, "relation": vectors[index]}
                for index, coefficient in enumerate(coefficients)
                if coefficient
            ]
            return {
                "kind": "collision" if size == 2 else "collinearity",
                "support": list(support),
                "coefficients": coefficients,
                "result": result,
                "terms": terms,
            }
    return None


def mine(cell: Any) -> dict[str, Any]:
    """Mine rhombi and the first sparse span certificates from ``cell``."""
    rows = normalize_rows(cell)
    dsu, _atoms = _closure(rows)
    relations = _relation_records(rows, dsu)
    vectors = [record["vector"] for record in relations]
    collision = _sparse_certificate(vectors, 2)
    collinearity = _sparse_certificate(vectors, 3)
    components = len({dsu.find(edge) for edge in EDGE_LIST})
    result = {
        "schema": "exact13-affine-mine/v1",
        "labels": list(LABELS),
        "rows": rows,
        "row_count": len(rows),
        "edge_count": len(EDGE_LIST),
        "equality_components": components,
        "relations": relations,
        "affine_relation_count": len(relations),
        "collision": collision,
        "collinearity": collinearity,
        "collision_status": "found" if collision is not None else "no_certificate_found",
        "collinearity_status": "found" if collinearity is not None else "no_certificate_found",
    }
    verify(result)
    return result


def _check_certificate(certificate: Any, vectors: Sequence[Sequence[int]], rows: Sequence[dict[str, Any]] | None = None) -> None:
    if certificate is None:
        return
    if not isinstance(certificate, dict):
        raise _error("sparse certificate is not an object")
    coefficients = certificate.get("coefficients")
    result = certificate.get("result")
    terms = certificate.get("terms")
    support = certificate.get("support")
    if not isinstance(coefficients, list) or len(coefficients) != len(vectors) or any(type(x) is not int for x in coefficients):
        raise _error("certificate coefficients are malformed")
    if not isinstance(result, list) or len(result) != N or any(type(x) is not int for x in result):
        raise _error("certificate result is malformed")
    if not isinstance(support, list) or len(support) not in (2, 3) or any(type(x) is not int for x in support):
        raise _error("certificate support is malformed")
    if len(set(support)) != len(support) or any(x not in LABELS for x in support):
        raise _error("certificate support labels are malformed")
    expected = [sum(coefficients[row] * vectors[row][index] for row in range(len(vectors))) for index in LABELS]
    if expected != result or [index for index, value in enumerate(result) if value] != sorted(support):
        raise _error("certificate integer combination does not match its result")
    if sum(result) != 0 or not all(result[index] for index in support):
        raise _error("certificate is not a nonzero affine sparse vector")
    if not isinstance(terms, list):
        raise _error("certificate terms are missing")
    seen: set[int] = set()
    for term in terms:
        if not isinstance(term, dict) or type(term.get("relation_index")) is not int or type(term.get("coefficient")) is not int:
            raise _error("certificate term is malformed")
        index, coefficient = term["relation_index"], term["coefficient"]
        if index < 0 or index >= len(vectors) or not coefficient or index in seen:
            raise _error("certificate term index or coefficient is invalid")
        if coefficient != coefficients[index] or term.get("relation") != list(vectors[index]):
            raise _error("certificate term relation does not match mined relation")
        seen.add(index)
    if seen != {index for index, coefficient in enumerate(coefficients) if coefficient}:
        raise _error("certificate terms do not cover its coefficients")
    if rows is not None and "supporting_atoms" in certificate:
        _validate_atoms(certificate["supporting_atoms"], rows)


def _validate_atoms(atoms: Any, rows: Sequence[dict[str, Any]]) -> None:
    if not isinstance(atoms, list):
        raise _error("supporting atoms are not an array")
    by_id = {row["id"]: row for row in rows}
    for atom in atoms:
        if not isinstance(atom, dict) or set(atom) != {"id", "center", "support"}:
            raise _error("malformed supporting row atom")
        normalized = _row_object(atom, default_id=str(atom.get("id")))
        if normalized["id"] not in by_id or normalized != by_id[normalized["id"]]:
            raise _error("supporting row atom is not an input row")


def verify_certificate(certificate: Any, relations: Sequence[dict[str, Any]] | Sequence[Sequence[int]], rows: Sequence[dict[str, Any]] | None = None) -> bool:
    """Verify arithmetic of one sparse certificate; use :func:`verify` for geometry."""
    vectors = [record["vector"] if isinstance(record, dict) else list(record) for record in relations]
    if any(len(vector) != N or any(type(x) is not int for x in vector) for vector in vectors):
        raise _error("relation vectors are malformed")
    _check_certificate(certificate, vectors, rows)
    return True


def verify(result: dict[str, Any]) -> bool:
    """Rebuild row closure and verify every rhombus and sparse certificate."""
    if not isinstance(result, dict) or result.get("schema") != "exact13-affine-mine/v1":
        raise _error("mine result schema is invalid")
    rows = normalize_rows(result.get("rows"))
    dsu, _atoms = _closure(rows)
    expected_relations = _relation_records(rows, dsu)
    relations = result.get("relations")
    if not isinstance(relations, list):
        raise _error("relations are missing")
    if [record.get("vector") if isinstance(record, dict) else None for record in relations] != [record["vector"] for record in expected_relations]:
        raise _error("relations are incomplete, duplicated, or out of order")
    expected_components = len({dsu.find(edge) for edge in EDGE_LIST})
    if (
        result.get("labels") != list(LABELS)
        or result.get("row_count") != len(rows)
        or result.get("edge_count") != len(EDGE_LIST)
        or result.get("equality_components") != expected_components
        or result.get("affine_relation_count") != len(relations)
    ):
        raise _error("mine summary counts or labels are inconsistent")
    row_ids = {row["id"] for row in rows}
    for record, expected in zip(relations, expected_relations):
        if not isinstance(record, dict) or not isinstance(record.get("vector"), list):
            raise _error("malformed affine relation")
        vector = record["vector"]
        if len(vector) != N or any(type(x) is not int for x in vector) or sorted(abs(x) for x in vector) != [0] * 9 + [1] * 4:
            raise _error("relation vector is not a four-label rhombus")
        key = tuple(vector)
        if key != min(key, tuple(-x for x in key)):
            raise _error("relation signs are duplicated or noncanonical")
        positive = [index for index, value in enumerate(vector) if value == 1]
        negative = [index for index, value in enumerate(vector) if value == -1]
        if record.get("positive") != positive or record.get("negative") != negative:
            raise _error("relation labels do not match its vector")
        expected_cross = {_edge(a, x) for a in positive for x in negative}
        raw_cross = record.get("cross_edges")
        try:
            cross = {_edge(edge[0], edge[1]) for edge in raw_cross}
        except (TypeError, IndexError, KeyError):
            raise _error("relation cross-edge metadata is malformed") from None
        if cross != expected_cross or len(cross) != 4:
            raise _error("relation cross-edge metadata disagrees with its vector")
        if any(dsu.find(edge) != dsu.find(next(iter(expected_cross))) for edge in expected_cross):
            raise _error("relation rhombus is not supported by rebuilt closure")
        ids = record.get("supporting_row_ids")
        atoms = record.get("supporting_atoms")
        if not isinstance(ids, list) or len(set(ids)) != len(ids) or set(ids) != row_ids:
            raise _error("relation supporting row ids are malformed")
        _validate_atoms(atoms, rows)
        if set(ids) != {atom["id"] for atom in atoms}:
            raise _error("relation row ids and supporting atoms disagree")
        if record.get("cross_edges") != expected.get("cross_edges"):
            raise _error("relation cross-edge ordering is not canonical")
    vectors = [record["vector"] for record in relations]
    for name in ("collision", "collinearity"):
        certificate = result.get(name)
        status = result.get(f"{name}_status")
        expected_status = "found" if certificate is not None else "no_certificate_found"
        if status != expected_status:
            raise _error(f"{name} certificate status is inconsistent")
        if certificate is not None and certificate.get("kind") != name:
            raise _error(f"{name} certificate kind is invalid")
        _check_certificate(certificate, vectors, rows)
    return True


def _load(path: Path) -> Any:
    try:
        value = json.loads(path.read_text())
    except (OSError, json.JSONDecodeError) as exc:
        raise _error(f"cannot read JSON input: {exc}") from exc
    if isinstance(value, dict) and isinstance(value.get("decoded_sat_models"), list):
        cells = [entry["cell"] for entry in value["decoded_sat_models"] if isinstance(entry, dict) and isinstance(entry.get("cell"), dict)]
        if not cells:
            raise _error("decoded_sat_models has no cells")
        return {"cells": [mine(cell) for cell in cells]}
    return mine(value)


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path)
    parser.add_argument("--output", type=Path, help="retain the full JSON mine at this path")
    args = parser.parse_args(argv)
    output = _load(args.input)
    if args.output is not None:
        args.output.write_text(json.dumps(output, sort_keys=True, separators=(",", ":")) + "\n")
    values = output["cells"] if isinstance(output, dict) and "cells" in output else [output]
    summary = [
        {
            "row_count": value["row_count"],
            "equality_components": value["equality_components"],
            "affine_relation_count": value["affine_relation_count"],
            "collision_status": value["collision_status"],
            "collinearity_status": value["collinearity_status"],
            "collision": value["collision"],
            "collinearity": value["collinearity"],
        }
        for value in values
    ]
    json.dump({"schema": "exact13-affine-mine-summary/v1", "cells": summary}, sys.stdout, sort_keys=True, separators=(",", ":"))
    sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
