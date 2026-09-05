"""Check one retained row-table affine collision; not a branch coverage checker."""

import itertools
import json
import sys
from pathlib import Path


def check(data):
    n = data["sample"]["n"]
    rows = data["sample"]["rows"]
    parent = {edge: edge for edge in itertools.combinations(range(n), 2)}

    def edge(a, b):
        return tuple(sorted((a, b)))

    def root(e):
        while parent[e] != e:
            e = parent[e]
        return e

    by_center = {}
    for row in rows:
        a, support = row["center"], row["support"]
        assert 0 <= a < n and len(set(support)) == 4 and a not in support
        assert all(0 <= b < n for b in support)
        by_center.setdefault(a, []).append(set(support))
        for b in support[1:]:
            parent[root(edge(a, b))] = root(edge(a, support[0]))

    relations = set()
    for a, b in itertools.combinations(range(n), 2):
        for x, y in itertools.combinations([i for i in range(n) if i not in (a, b)], 2):
            if len({root(edge(i, j)) for i in (a, b) for j in (x, y)}) == 1:
                v = tuple(int(i in (a, b)) - int(i in (x, y)) for i in range(n))
                relations.add(min(v, tuple(-z for z in v)))

    cert = data["collision_certificate"]
    result = [0] * n
    for term in cert["terms"]:
        v = tuple(term["relation"])
        assert v in relations
        for i, value in enumerate(v):
            result[i] += term["coefficient"] * value
    assert result == cert["result"]
    support = [i for i, value in enumerate(result) if value]
    assert len(support) == 2 and sum(result) == 0

    def hit(a, labels):
        return any(set(labels) <= row for row in by_center.get(a, []))

    motifs = sum(
        hit(a, (b, c, d, e)) and hit(c, (a, b, d)) and hit(e, (a, d))
        for a, b, c, d, e in itertools.permutations(range(n), 5)
    )
    observed = {
        "rows": len(rows),
        "equality_components": len({root(e) for e in parent}),
        "affine_relations": len(relations),
        "nine_hit_motifs": motifs,
        "collision_labels": support,
    }
    assert observed == data["expected"]
    return observed


if __name__ == "__main__":
    if not __debug__:
        raise SystemExit("Run without -O: this finite checker uses assertions")
    path = Path(sys.argv[1]) if len(sys.argv) > 1 else Path(
        "docs/audits/2026-09-05-wave6-live-transfer.json"
    )
    print(json.dumps(check(json.loads(path.read_text())), sort_keys=True))
