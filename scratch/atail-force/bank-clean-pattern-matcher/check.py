#!/usr/bin/env python3
"""Replay the exact 15-equality bank-clean pattern on corrected CEGAR shadows.

This is scratch discovery infrastructure.  A match is bankable only after the
named Lean consumer is kernel checked and wired into the production matcher.
"""

from __future__ import annotations

import hashlib
import importlib.util
import itertools
import json
from pathlib import Path
import sys
from types import ModuleType
from typing import Iterable, Sequence

import z3


HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[2]
CHECKPOINT = (
    HERE.parent / "robust-all-center-marco" / "bank_cegar_checkpoint.json"
)
SURFACE_SOURCE = HERE.parent / "robust-all-center-cegar" / "search.py"

EXPECTED_CHECKPOINT_SHA256 = (
    "b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9"
)
EXPECTED_ROW_SHA256 = (
    "f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66"
)

if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from census.global_confinement import metric_realizability_probe as metric  # noqa: E402


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_module(path: Path, name: str) -> ModuleType:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot import {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def labels_in(mask: int) -> Iterable[int]:
    while mask:
        bit = mask & -mask
        yield bit.bit_length() - 1
        mask ^= bit


def bank_clean_15_core(
    rows: Sequence[metric.MetricRow], n: int
) -> dict[str, int] | None:
    """Find the nine-role equality pattern proved by the scratch consumer.

    Only the two anchor roles ``O`` and ``A`` must differ.  Every other role
    may alias, matching the Lean theorem's hypothesis surface.
    """

    closure = metric._row_equality_closure(n, rows)
    roots, circle_masks = metric._closure_circle_index(closure, n)
    labels = tuple(range(n))

    def same_circle(center: int, *points: int) -> bool:
        return all(
            roots[center][point] == roots[center][points[0]]
            for point in points[1:]
        )

    for o in labels:
        for a in labels:
            if o == a:
                continue
            for e in labels_in(circle_masks[o][a]):
                a_circle = circle_masks[a][o]
                for g in labels_in(a_circle):
                    x_mask_from_g = circle_masks[g][e]
                    for k in labels_in(a_circle):
                        if not same_circle(k, o, g):
                            continue
                        x_mask = x_mask_from_g & circle_masks[g][k]
                        for x in labels_in(x_mask):
                            x_circle = circle_masks[x][g]
                            for z in labels_in(x_circle):
                                if not same_circle(z, a, g):
                                    continue
                                y_mask = circle_masks[z][a] & circle_masks[k][o]
                                for y in labels_in(y_mask):
                                    if not same_circle(y, o, x, z):
                                        continue
                                    for f in labels_in(x_circle):
                                        if same_circle(f, a, z, k):
                                            return {
                                                "O": o,
                                                "A": a,
                                                "E": e,
                                                "G": g,
                                                "K": k,
                                                "X": x,
                                                "Z": z,
                                                "Y": y,
                                                "F": f,
                                            }
    return None


def bank_clean_15_core_z3_direct(
    rows: Sequence[metric.MetricRow], n: int
) -> dict[str, int] | None:
    """Independent Z3 check against direct selected-row containment."""

    names = ("O", "A", "E", "G", "K", "X", "Z", "Y", "F")
    role = {name: z3.Int(f"role_{name}") for name in names}
    solver = z3.Solver()
    for variable in role.values():
        solver.add(0 <= variable, variable < n)
    solver.add(role["O"] != role["A"])

    groups = (
        ("O", ("A", "E")),
        ("A", ("O", "G", "K")),
        ("X", ("Z", "G", "F")),
        ("Y", ("O", "X", "Z")),
        ("Z", ("A", "Y", "G")),
        ("G", ("X", "E", "K")),
        ("K", ("O", "Y", "G")),
        ("F", ("A", "Z", "K")),
    )
    for center_name, points in groups:
        alternatives = []
        for row in rows:
            alternatives.append(
                z3.And(
                    role[center_name] == row.center,
                    *(
                        z3.Or(*(role[point_name] == point for point in row.support))
                        for point_name in points
                    ),
                )
            )
        solver.add(z3.Or(*alternatives))

    if solver.check() != z3.sat:
        return None
    model = solver.model()
    return {name: model.eval(variable).as_long() for name, variable in role.items()}


def rows_from_record(
    record: dict[str, object], by_name: dict[str, int]
) -> tuple[metric.MetricRow, ...]:
    answer = []
    for row in record["rows"]:  # type: ignore[index]
        assert isinstance(row, dict)
        center = by_name[str(row["center"])]
        support = tuple(sorted(by_name[str(name)] for name in row["support"]))
        answer.append(metric.MetricRow(center, support, exact=False))
    return tuple(sorted(answer, key=lambda item: item.center))


def rows_with_ambient_first_apex(
    record: dict[str, object],
    by_name: dict[str, int],
    surface_module: ModuleType,
) -> tuple[metric.MetricRow, ...]:
    """Reconstruct the corrected metric semantics used by bank CEGAR.

    The selected four-subset at ``O`` is replaced by the actual ambient
    five-point first-apex radius class.  The other thirteen selected rows are
    retained.  This is exactly the distinction which repaired the old seed.
    """

    selected = rows_from_record(record, by_name)
    first_apex = by_name[surface_module.FIRST_APEX]
    ambient_support = tuple(
        sorted(by_name[name] for name in surface_module.FIRST_APEX_CLASS)
    )
    return (
        metric.MetricRow(first_apex, ambient_support, exact=True),
        *(row for row in selected if row.center != first_apex),
    )


def mec_straddling_embeddings(
    rows: Sequence[metric.MetricRow],
    n: int,
    order: Sequence[int],
    moser_vertices: Sequence[int],
) -> tuple[int, int, int, dict[tuple[int, int, int, int], int]]:
    """Count the production ``MECStraddlingRowCore`` embeddings.

    Every permutation of the three nonobtuse MEC boundary vertices is
    allowed.  The equality skeleton requires the four edges ``oa``, ``ap``,
    ``os``, ``sx``, and ``sy`` to have one closure root.  A production
    consumer fires only when all four cyclic signs agree, either positively
    for ``Geometry`` or negatively for ``NegativeGeometry``.

    Returns ``(raw equality skeletons, positive, negative, signature counts)``.
    Degenerate triples have sign zero and therefore cannot be accepted.
    """

    closure = metric._row_equality_closure(n, rows)
    roots, _ = metric._closure_circle_index(closure, n)
    cyclic_order = tuple(order)
    position = {point: index for index, point in enumerate(cyclic_order)}

    def same_edge_class(
        left_a: int, left_b: int, right_a: int, right_b: int
    ) -> bool:
        return roots[left_a][left_b] == roots[right_a][right_b]

    def cyclic_sign(a: int, b: int, c: int) -> int:
        if len({a, b, c}) != 3:
            return 0
        size = len(cyclic_order)
        ab = (position[b] - position[a]) % size
        ac = (position[c] - position[a]) % size
        return 1 if ab < ac else -1

    raw = 0
    positive = 0
    negative = 0
    signatures: dict[tuple[int, int, int, int], int] = {}
    for o, a, p in itertools.permutations(tuple(moser_vertices)):
        if not same_edge_class(o, a, a, p):
            continue
        for s, x, y in itertools.product(cyclic_order, repeat=3):
            if not (
                same_edge_class(o, a, o, s)
                and same_edge_class(o, a, s, x)
                and same_edge_class(o, a, s, y)
            ):
                continue
            raw += 1
            signature = (
                cyclic_sign(o, a, p),
                cyclic_sign(o, a, s),
                cyclic_sign(o, x, s),
                cyclic_sign(o, s, y),
            )
            signatures[signature] = signatures.get(signature, 0) + 1
            if signature == (1, 1, 1, 1):
                positive += 1
            elif signature == (-1, -1, -1, -1):
                negative += 1
    return raw, positive, negative, signatures


def main() -> int:
    if sha256(CHECKPOINT) != EXPECTED_CHECKPOINT_SHA256:
        raise RuntimeError("canonical corrected checkpoint drift")
    payload = json.loads(CHECKPOINT.read_text(encoding="utf-8"))
    if payload["status"] != "SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW":
        raise RuntimeError("checkpoint is no longer the terminal bank-clean state")
    if len(payload["structural_survivors"]) != 101:
        raise RuntimeError("corrected survivor count drift")
    if payload["witness"]["row_assignment_sha256"] != EXPECTED_ROW_SHA256:
        raise RuntimeError("terminal row hash drift")

    surface_module = load_module(SURFACE_SOURCE, "p97_bank_clean_pattern_surface")
    surface = surface_module.Surface()
    by_name = {str(name): int(label) for name, label in surface.by_name.items()}
    by_label = {int(label): str(name) for label, name in surface.by_label.items()}

    hits = []
    mec_hits = []
    mec_positive = 0
    mec_negative = 0
    terminal_mec_raw = None
    terminal_mec_signatures: dict[tuple[int, int, int, int], int] | None = None
    cyclic_order = tuple(
        by_name[name] for name in surface_module.HULL_NAMES
    )
    moser_vertices = tuple(by_name[name] for name in ("O", "A", "C"))
    for index, survivor in enumerate(payload["structural_survivors"]):
        rows = rows_from_record(survivor, by_name)
        match = bank_clean_15_core(rows, 14)
        if match is not None:
            hits.append(
                {
                    "survivor_index": index,
                    "iteration": survivor["iteration"],
                    "mapping": {role: by_label[label] for role, label in match.items()},
                }
            )
        metric_rows = rows_with_ambient_first_apex(
            survivor, by_name, surface_module
        )
        raw, positive, negative, signatures = mec_straddling_embeddings(
            metric_rows, 14, cyclic_order, moser_vertices
        )
        if positive or negative:
            mec_hits.append(index)
        mec_positive += positive
        mec_negative += negative
        if index == 100:
            terminal_mec_raw = raw
            terminal_mec_signatures = signatures

    expected = {
        "O": "O",
        "A": "A",
        "E": "E",
        "G": "G",
        "K": "K",
        "X": "X",
        "Z": "Z",
        "Y": "Y",
        "F": "F",
    }
    terminal_hits = [item for item in hits if item["survivor_index"] == 100]
    if len(terminal_hits) != 1 or terminal_hits[0]["mapping"] != expected:
        raise RuntimeError(f"terminal pattern replay mismatch: {terminal_hits}")

    terminal_rows = rows_from_record(payload["structural_survivors"][100], by_name)
    negative_rows = rows_from_record(payload["structural_survivors"][0], by_name)
    if bank_clean_15_core_z3_direct(terminal_rows, 14) is None:
        raise RuntimeError("independent Z3 encoding missed the terminal pattern")
    if bank_clean_15_core_z3_direct(negative_rows, 14) is not None:
        raise RuntimeError("independent Z3 encoding matched negative survivor 0")

    expected_mec_hits = [
        *range(21), 23, 26, 27, 28, 30, 32, 38, 39, 61, 62, 65, 66, 71,
        85, 93,
    ]
    if mec_hits != expected_mec_hits:
        raise RuntimeError(f"MEC straddling hit set drift: {mec_hits}")
    if (mec_positive, mec_negative) != (378, 384):
        raise RuntimeError(
            "MEC straddling orientation counts drift: "
            f"{mec_positive} positive, {mec_negative} negative"
        )
    if terminal_mec_raw != 220 or terminal_mec_signatures is None:
        raise RuntimeError(
            f"terminal MEC equality-skeleton count drift: {terminal_mec_raw}"
        )
    if terminal_mec_signatures.get((1, 1, 1, -1)) != 35:
        raise RuntimeError("terminal positive near-miss signature drift")
    if terminal_mec_signatures.get((-1, -1, -1, 1)) != 26:
        raise RuntimeError("terminal reflected near-miss signature drift")

    print(
        json.dumps(
            {
                "status": "PASS",
                "epistemic_status": "MATCHER_READY_LEAN_CONSUMER_PENDING",
                "survivors_checked": 101,
                "pattern_hit_count": len(hits),
                "terminal_mapping": expected,
                "hit_indices": [item["survivor_index"] for item in hits],
                "independent_z3_smoke": {
                    "terminal_100": "SAT",
                    "negative_0": "UNSAT",
                },
                "mec_straddling_production_preflight": {
                    "shadow_hit_count": len(mec_hits),
                    "hit_indices": mec_hits,
                    "positive_embeddings": mec_positive,
                    "negative_embeddings": mec_negative,
                    "terminal_100_raw_equality_skeletons": terminal_mec_raw,
                    "terminal_100_oriented_embeddings": 0,
                },
            },
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
