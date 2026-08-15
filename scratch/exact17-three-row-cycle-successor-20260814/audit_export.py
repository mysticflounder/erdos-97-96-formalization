"""Independent byte/semantics audit of the Lean-owned three-row-cycle root."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
PARENT = ROOT / "scratch/exact17-lean-to-sat/exact17-forty-seventh-root-forty-sixth-model-refinements.cnf"
CHILD = Path(__file__).with_name("root.cnf")
SOURCE = ROOT / "scratch/exact17-child46-production-8205802e/source-semantic-replay.json"

ORDERS = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
TEMPLATES = (
    ((0, 1), (0, 2), (3, 2), (3, 5), (4, 1), (4, 5)),
    ((0, 1), (0, 2), (4, 1), (4, 3), (5, 2), (5, 3)),
    ((0, 1), (0, 3), (4, 1), (4, 2), (5, 2), (5, 3)),
)
EXPECTED_PARENT_SHA256 = "106a8f682212cb76281b01fb834f6244e6013767a1edad207c77179a187e75b2"
EXPECTED_PARENT_CLAUSES = 5_848_864
EXPECTED_SUFFIX_CLAUSES = 891_072
EXPECTED_CHILD_CLAUSES = EXPECTED_PARENT_CLAUSES + EXPECTED_SUFFIX_CLAUSES


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def placed(order: int, reverse: bool, cut: int, offset: int) -> int:
    position = (cut - offset if reverse else cut + offset) % 17
    return ORDERS[order][position]


def lean_sublists_len(items: tuple[int, ...], length: int):
    """Match Lean `List.sublistsLen`: omit the head block before using it."""
    if length == 0:
        yield ()
    elif items:
        yield from lean_sublists_len(items[1:], length)
        for tail in lean_sublists_len(items[1:], length - 1):
            yield (items[0], *tail)


def clauses():
    for template in TEMPLATES:
        for order in (0, 1):
            for reverse in (False, True):
                for cut in range(17):
                    for offsets in lean_sublists_len(tuple(range(1, 17)), 5):
                        positions = (0, *offsets)
                        hits = tuple(
                            (
                                placed(order, reverse, cut, positions[center]),
                                placed(order, reverse, cut, positions[point]),
                            )
                            for center, point in template
                        )
                        literals = (-(307 + order),) + tuple(
                            -(1 + center * 17 + point) for center, point in hits
                        )
                        yield order, hits, literals


def main() -> None:
    if sha256(PARENT) != EXPECTED_PARENT_SHA256:
        raise SystemExit("parent SHA-256 mismatch")

    with PARENT.open("rb") as parent, CHILD.open("rb") as child:
        parent_header = parent.readline()
        child_header = child.readline()
        if parent_header != b"p cnf 308 5848864\n":
            raise SystemExit(f"bad parent header: {parent_header!r}")
        if child_header != b"p cnf 308 6739936\n":
            raise SystemExit(f"bad child header: {child_header!r}")
        while True:
            block = parent.read(1 << 20)
            if not block:
                break
            if child.read(len(block)) != block:
                raise SystemExit("child body is not an exact parent-body prefix")

        source = json.loads(SOURCE.read_text()) ["source_model"]
        rows = tuple(frozenset(row) for row in source["rows"])
        selected_order = source["named_order"]
        cut_count = 0
        first_cut: list[int] | None = None
        emitted = 0
        for order, hits, literals in clauses():
            emitted += 1
            expected = (" ".join(map(str, literals)) + " 0\n").encode()
            actual = child.readline()
            if actual != expected:
                raise SystemExit(
                    f"suffix mismatch at clause {emitted}: expected {expected!r}, got {actual!r}"
                )
            clause_true = order != selected_order or any(point not in rows[center] for center, point in hits)
            if not clause_true:
                cut_count += 1
                if first_cut is None:
                    first_cut = list(literals)
        if emitted != EXPECTED_SUFFIX_CLAUSES:
            raise SystemExit(f"wrong suffix count: {emitted}")
        if child.read(1):
            raise SystemExit("unexpected bytes after audited suffix")
        if cut_count == 0:
            raise SystemExit("new suffix does not reject the authenticated Child46 source model")

    report = {
        "schema": "p97-exact17-three-row-cycle-export-audit/v1",
        "status": "PASS",
        "parent_sha256": EXPECTED_PARENT_SHA256,
        "child_sha256": sha256(CHILD),
        "parent_clauses": EXPECTED_PARENT_CLAUSES,
        "suffix_clauses": emitted,
        "child_clauses": EXPECTED_CHILD_CLAUSES,
        "authenticated_child46_model_cut_count": cut_count,
        "first_cut_clause": first_cut,
    }
    print(json.dumps(report, sort_keys=True))


if __name__ == "__main__":
    main()
