"""Exact finite-metric boundary for the frontier common-deletion surface.

This adapts the pinned paired-common-deletion rational metric by enlarging one
distinguished radius class from five to six points.  The resulting finite
metric has a robust first-apex frontier pair, double-deletion survival at both
apices, a total source-exact critical map, and the new source-faithful common
deletion packet.  It is not a Euclidean/minimal-counterexample model.
"""

from __future__ import annotations

from collections import defaultdict
from fractions import Fraction
import hashlib
import json
from pathlib import Path
import runpy


ROOT = Path(__file__).resolve().parents[3]
MODEL_PATH = (
    ROOT
    / "scratch/atail-force/paired-common-deletion-nonreturn-audit"
    / "exact_five_paired_cycle_model.py"
)
EXPECTED_SOURCE_SHA256 = (
    "b38e9cba4fd07f2623f3004954ebe2e73505854f5e935cb03dc442d03273a95e"
)


def source_sha256() -> str:
    return hashlib.sha256(MODEL_PATH.read_bytes()).hexdigest()


def main() -> None:
    assert source_sha256() == EXPECTED_SOURCE_SHA256
    loaded = runpy.run_path(str(MODEL_PATH))
    env = loaded["radius_classes"].__globals__

    # Distinguished frontier/common-deletion roles.
    first_apex = env["PHYSICAL_CENTER"]
    second_apex = env["ACTUAL_UNUSED_BLOCKER"]
    q, w = env["FIRST_SOURCE"], env["SECOND_SOURCE"]
    first_class = frozenset({q, w, 3, 5, 8, 9})
    second_class = env["UNUSED_SHELL"]
    surplus_cap = frozenset({first_apex, second_apex, 4, 6, 7})

    # Make the first-apex class robust under deleting q and w together, then
    # rebuild the exact rational distance-label table.
    env["PHYSICAL_CLASS"] = first_class
    env["POSITIVE_LABELS"] = env["positive_labels"]()
    env["LABEL_INDEX"] = {
        label: index for index, label in enumerate(env["POSITIVE_LABELS"])
    }

    vertices = env["VERTICES"]
    distance = env["distance"]
    exact_classes_at = env["exact_classes_at"]
    radius_classes = env["radius_classes"]
    blocker = env["blocker"]
    critical_shell = env["critical_shell"]

    # Exact rational metric and exact declared radius filters.
    for x in vertices:
        for y in vertices:
            assert distance(x, y) == distance(y, x)
            if x == y:
                assert distance(x, y) == 0
            else:
                assert 1 <= distance(x, y) < Fraction(3, 2)
            for z in vertices:
                assert distance(x, z) <= distance(x, y) + distance(y, z)
        assert set(exact_classes_at(x)) == set(radius_classes(x))

    # Global K4 and a total source-exact deletion-critical map.
    for source in vertices:
        shell = critical_shell(source)
        center = blocker(source)
        assert len(shell) == 4
        assert source in shell
        assert center != source
        assert exact_classes_at(center, frozenset({source})) == ()

    # Frontier pair: one off-surplus first-apex marginal, unequal second-apex
    # radii, and double-deletion survival at both apices.
    assert q != w
    assert q in first_class and w in first_class
    assert q not in surplus_cap and w not in surplus_cap
    assert distance(first_apex, q) == distance(first_apex, w)
    assert distance(second_apex, q) != distance(second_apex, w)
    assert any(
        len(row) >= 4
        for row in exact_classes_at(first_apex, frozenset({q, w}))
    )
    assert any(
        len(row) >= 4
        for row in exact_classes_at(second_apex, frozenset({q, w}))
    )
    assert blocker(q) != second_apex
    assert blocker(w) != second_apex

    # Source-faithful common deletion at q and the two opposite apices.
    first_row = frozenset({w, 3, 5, 8})
    second_row = second_class
    assert first_row <= first_class - {q}
    assert second_row in exact_classes_at(second_apex, frozenset({q}))
    assert len(first_row) == 4 and len(second_row) == 4
    assert len(first_row & second_row) <= 2
    assert blocker(q) not in {first_apex, second_apex}

    # Exact checked conclusion of the Lean lane.
    marginal = first_class - surplus_cap
    q_actual_support = critical_shell(q)
    assert len(second_row & marginal) <= 1
    assert len(second_row & q_actual_support) <= 2
    escapes = second_row - marginal - q_actual_support
    assert escapes
    for point in escapes:
        assert exact_classes_at(blocker(q), frozenset({point}))

    payload = {
        "carrier_card": len(vertices),
        "common_row_overlap": len(first_row & second_row),
        "escape_count": len(escapes),
        "first_apex_class_card": len(first_class),
        "first_apex_double_deletion_survives": True,
        "global_k4": True,
        "second_apex_double_deletion_survives": True,
        "second_row_marginal_hits": len(second_row & marginal),
        "second_row_q_actual_support_hits": len(
            second_row & q_actual_support
        ),
        "source_model_sha256": EXPECTED_SOURCE_SHA256,
        "status": "PASS_EXACT_FINITE_METRIC_INTERFACE_ONLY",
        "total_critical_map": True,
    }
    digest = hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    print(json.dumps({**payload, "payload_sha256": digest}, sort_keys=True))


if __name__ == "__main__":
    main()
