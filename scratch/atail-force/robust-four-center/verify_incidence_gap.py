"""Exact audit of the robust four-center incidence gap.

This reuses the pinned 33-point integer carrier from the blocker-graph audit.
It searches for a pair with the metric part of the robust packet:

* one carrier apex is equidistant from the two sources;
* the two chosen deletion blockers are distinct and have reciprocal cross
  omissions, so deleting the other source preserves K4 there;
* one second carrier center retains K4 after either source deletion; and
* both exact blocker shells supply off-source support points.

The checker then verifies that no off-source point in either blocker shell is
equidistant from the source pair.  Hence global K4 at all those support points
does not force even one selected global row to contain the pair.  This is a
falsifier only for that incidence implication: the carrier is non-convex and
has no live MEC/cap/no-IsM44 packet.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
from pathlib import Path


Point = tuple[int, int]

HERE = Path(__file__).resolve().parent
BASE_PATH = HERE.parent / "blocker_graph" / "euclidean_countermodel.py"

SPEC = {
    "version": 1,
    "requirements": [
        "global K4",
        "exact deletion-critical four-shell at each actual blocker",
        "reciprocal cross-deletion survival",
        "distinct first apex, second apex, and two actual blockers",
        "first-apex source-pair class has cardinality five",
        "second-apex K4 survives simultaneous source deletion",
        "global K4 at every off-source blocker-shell support point",
        "no off-source support point is equidistant from the source pair",
    ],
}
EXPECTED_AUDIT_SHA256 = (
    "9369233cf210d17dea60e6126e4ef87a5ee47c7d31fc6994a30071a8f6b4963f"
)


def load_base():
    spec = importlib.util.spec_from_file_location(
        "atail_blocker_graph_euclidean_countermodel", BASE_PATH
    )
    assert spec is not None and spec.loader is not None
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def max_class_card(base, center: Point, carrier: frozenset[Point]) -> int:
    return max(
        map(len, base.distance_classes(center, carrier).values()), default=0
    )


def check() -> dict[str, object]:
    base = load_base()
    base_result = base.check()
    assert base_result["status"] == "PASS"
    carrier = frozenset(base.A)

    blocker: dict[Point, Point] = {}
    shell: dict[Point, frozenset[Point]] = {}
    for source in base.A:
        center = base.blocker_candidates(source, carrier)[0]
        _radius, support = base.chosen_shell(source, center, carrier)
        blocker[source] = center
        shell[source] = support

    witnesses: list[dict[str, object]] = []
    for q in base.A:
        for w in base.A:
            if q >= w:
                continue
            cq, cw = blocker[q], blocker[w]
            sq, sw = shell[q], shell[w]
            if w in sq or q in sw or cq == cw:
                continue

            q_off = sorted(sq - {q, w})
            w_off = sorted(sw - {q, w})
            if not q_off or not w_off:
                continue
            all_off = set(q_off) | set(w_off)
            if any(base.sqdist(z, q) == base.sqdist(z, w) for z in all_off):
                continue

            first_apices = sorted(
                o
                for o in carrier - {q, w, cq, cw}
                if base.sqdist(o, q) == base.sqdist(o, w)
                and len(
                    base.distance_classes(o, carrier)[base.sqdist(o, q)]
                )
                == 5
            )
            if not first_apices:
                continue

            second_apices = sorted(
                o
                for o in carrier - {q, w, cq, cw}
                if o not in first_apices
                and max_class_card(base, o, carrier - {q, w}) >= 4
            )
            if not second_apices:
                continue

            distinct_off_pairs = [
                (zq, zw) for zq in q_off for zw in w_off if zq != zw
            ]
            if not distinct_off_pairs:
                continue

            # Global K4 is present at every off-shell point, but unequal
            # source distances make pair containment impossible for every
            # selected same-radius class at those centers.
            assert all(max_class_card(base, z, carrier) >= 4 for z in all_off)
            assert all(
                base.sqdist(z, q) != base.sqdist(z, w) for z in all_off
            )
            assert max_class_card(base, cq, carrier - {q}) < 4
            assert max_class_card(base, cw, carrier - {w}) < 4
            assert max_class_card(base, cq, carrier - {w}) >= 4
            assert max_class_card(base, cw, carrier - {q}) >= 4
            assert (
                len(
                    base.distance_classes(first_apices[0], carrier)[
                        base.sqdist(first_apices[0], q)
                    ]
                )
                == 5
            )
            assert (
                max_class_card(base, second_apices[0], carrier - {q, w}) >= 4
            )
            assert len({first_apices[0], second_apices[0], cq, cw}) == 4

            witnesses.append(
                {
                    "q": q,
                    "w": w,
                    "first_apex": first_apices[0],
                    "second_apex": second_apices[0],
                    "q_blocker": cq,
                    "w_blocker": cw,
                    "q_shell": sorted(sq),
                    "w_shell": sorted(sw),
                    "q_off_support": q_off,
                    "w_off_support": w_off,
                    "distinct_off_support_pair": distinct_off_pairs[0],
                }
            )

    assert witnesses
    witness = witnesses[0]
    payload = {
        "spec": SPEC,
        "base_construction_sha256": base_result["construction_sha256"],
        "witness": witness,
    }
    audit_sha256 = hashlib.sha256(
        json.dumps(payload, sort_keys=True, separators=(",", ":")).encode()
    ).hexdigest()
    assert audit_sha256 == EXPECTED_AUDIT_SHA256

    return {
        "status": "PASS",
        "trust_boundary": (
            "exhaustive exact integer arithmetic in Python; not Lean-kernel checked"
        ),
        "base_construction_sha256": base_result["construction_sha256"],
        "audit_sha256": audit_sha256,
        "spec": SPEC,
        "robust_metric_witness_count": len(witnesses),
        "witness": witness,
        "verified": {
            "global_k4": True,
            "distinct_actual_blockers": True,
            "reciprocal_cross_deletion_survival": True,
            "first_apex_pair_equidistance": True,
            "first_apex_pair_class_card_five": True,
            "second_apex_single_deletion_survival": True,
            "second_apex_double_deletion_survival": True,
            "global_k4_at_every_off_support_point": True,
            "no_off_support_center_equidistant_from_pair": True,
        },
        "convex_independent": False,
        "omitted_live_layer": [
            "ConvexIndep",
            "MEC/nonobtuse circumscribed Moser packet",
            "surplus-cap placement",
            "no-IsM44",
        ],
    }


if __name__ == "__main__":
    print(json.dumps(check(), indent=2, sort_keys=True))
