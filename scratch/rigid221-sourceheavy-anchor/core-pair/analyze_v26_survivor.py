"""Derive the v26 survivor structural statistics from the authenticated cubes.

Read-only diagnostic.  Recomputes, independently of the mine, every number
quoted in docs/exact12-v26-survivor-structural-analysis-2026-08-20.md:

  * per-label support degree, pairwise support-intersection histogram, and
    per-block spread, for each of the v24/v25/v26 survivors;
  * reciprocal containment pairs and triangles;
  * the v24 -> v25 -> v26 row delta and the frozen anchor star;
  * that both v26 covering cores appear in the survivor's own unoriented
    instance list, under the classifier's `x < y` serialization.

Cross-check: the degree / mutual-pair / triangle figures printed here are
also reported by the mine itself in
`all_order_mining_summary.json -> structural_diagnostics.reciprocal_containment`.
The two are computed by different code and must agree.
"""

from __future__ import annotations

import json
from collections import Counter
from itertools import combinations
from pathlib import Path

V26_WORKDIR = Path(
    "scratch/runs/exact12-rigid221-all-order-common-five/canary-v14-20260818"
    "/artifacts/workdir"
)
WAVES = {
    "v24": Path("scratch/arm-static-cell6-v24-live-5fc7ade0-20260815/survivor.json"),
    "v25": Path("scratch/arm-static-cell6-v25-live-898fbd78-20260816/survivor.json"),
    "v26": V26_WORKDIR / "survivor.json",
}

BLOCKS = {
    "anchor": (0, 1, 2),
    "surplus": (3, 4, 5),
    "second": (6, 7, 8, 9),
    "first-opp": (10, 11),
}
BLOCK_OF = {lab: name for name, labs in BLOCKS.items() for lab in labs}

Cube = dict[int, set[int]]


def load(path: Path) -> tuple[Cube, dict]:
    payload = json.loads(path.read_text())
    cube = {int(k): set(v) for k, v in payload["cube"].items()}
    return cube, payload


def mutual_pairs(cube: Cube) -> list[tuple[int, int]]:
    return [
        (i, j)
        for i, j in combinations(sorted(cube), 2)
        if j in cube[i] and i in cube[j]
    ]


def mutual_triangles(cube: Cube) -> list[tuple[int, ...]]:
    return [
        t
        for t in combinations(sorted(cube), 3)
        if all(b in cube[a] and a in cube[b] for a, b in combinations(t, 2))
    ]


def report(tag: str, cube: Cube, payload: dict) -> None:
    print(f"===== {tag} survivor =====")
    cert = payload.get("structural_certificate", {})
    print(
        f"classification: {payload.get('classification')} | "
        f"cell {payload.get('arm_cell_index')} | stage {cert.get('stage')} | "
        f"certificate core {cert.get('core')}"
    )

    deg = Counter()
    for supp in cube.values():
        deg.update(supp)
    print(
        "support degree:",
        {k: deg[k] for k in sorted(deg, key=lambda l: (-deg[l], l))},
    )

    inter = Counter()
    for i, j in combinations(sorted(cube), 2):
        inter[len(cube[i] & cube[j])] += 1
    print("pairwise |supp(i) & supp(j)| histogram:", dict(sorted(inter.items())))

    spread = Counter()
    for supp in cube.values():
        spread[max(Counter(BLOCK_OF[l] for l in supp).values())] += 1
    print("max-labels-from-one-block histogram:", dict(sorted(spread.items())))

    pairs = mutual_pairs(cube)
    print(f"reciprocal containment pairs ({len(pairs)}):", pairs)
    print("reciprocal containment triangles:", mutual_triangles(cube))
    print()


def deltas(cubes: dict[str, Cube]) -> None:
    print("===== row deltas =====")
    for a, b in (("v24", "v25"), ("v25", "v26")):
        moved = [c for c in sorted(cubes[b]) if cubes[a][c] != cubes[b][c]]
        same = [c for c in sorted(cubes[b]) if cubes[a][c] == cubes[b][c]]
        print(f"{a} -> {b}: {len(moved)} moved {moved} | {len(same)} unchanged {same}")
        print(
            "   moved by block:",
            dict(Counter(BLOCK_OF[c] for c in moved)),
            "| unchanged by block:",
            dict(Counter(BLOCK_OF[c] for c in same)),
        )
        for c in moved:
            print(
                f"   center {c:>2} ({BLOCK_OF[c]}): "
                f"{sorted(cubes[a][c])} -> {sorted(cubes[b][c])}"
            )
    print()

    print("===== the frozen anchor star =====")
    frozen = [
        c
        for c in sorted(cubes["v26"])
        if cubes["v24"][c] == cubes["v25"][c] == cubes["v26"][c]
    ]
    print(
        f"rows identical across all three waves ({len(frozen)}):",
        frozen,
        dict(Counter(BLOCK_OF[c] for c in frozen)),
    )
    for tag, cube in cubes.items():
        holders = sorted(c for c, s in cube.items() if 0 in s)
        star = sorted({0, *holders})
        print(
            f"   {tag}: supp(0) = {sorted(cube[0])} | "
            f"centers containing label 0: {holders} | closed star: {star}"
        )
        assert star == frozen, f"{tag}: closed star {star} != frozen set {frozen}"
    print("   CHECK OK: the frozen set is exactly {0} u {c : 0 in supp(c)}")
    print()


def core_checks() -> None:
    print("===== v26 covering cores vs the unoriented instance list =====")
    summary = json.loads((V26_WORKDIR / "all_order_mining_summary.json").read_text())
    diag = summary["structural_diagnostics"]["rule_shape_classification"]
    unoriented = {tuple(i["instance"]) for i in diag["instances"]["unoriented"]}

    label_sets = []
    for profile in summary["certificate"]["core_profiles"]:
        core = profile["core"]
        a, b, c, x, y = (core[k] for k in ("a", "b", "c", "x", "y"))
        lo, hi = (x, y) if x < y else (y, x)  # classifier serializes with x < y
        key = (a, b, c, lo, hi)
        labels = sorted({a, b, c, x, y})
        label_sets.append(set(labels))
        print(
            f"   core (a,b,c,x,y)=({a},{b},{c},{x},{y}) -> normalized {key} | "
            f"in unoriented: {key in unoriented} | five-label set {labels} | "
            f"orders {profile['order_count']}"
        )
        assert key in unoriented, f"core {key} absent from the unoriented list"

    print("   shared labels:", sorted(label_sets[0] & label_sets[1]))
    print("   symmetric difference:", sorted(label_sets[0] ^ label_sets[1]))
    print("   installed rule-shape counts:", diag["counts"])
    print("   CHECK OK: both covering cores are realized unoriented instances")


def main() -> None:
    cubes = {}
    for tag, path in WAVES.items():
        cube, payload = load(path)
        cubes[tag] = cube
        report(tag, cube, payload)
    deltas(cubes)
    core_checks()


if __name__ == "__main__":
    main()
