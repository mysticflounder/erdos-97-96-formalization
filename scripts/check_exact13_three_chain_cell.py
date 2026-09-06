# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under GPL-3.0-or-later as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Integer replay of the conditional three-chain cell in nthdegree #16061.

This is not a source-to-order classifier. It checks nine chain links and all
495 possible four-supports at pivot 10 under explicitly fixed rows/order.
No solver is invoked. The short-cancellation census is independent of the
chain pigeonhole enumeration.
"""

import argparse
import itertools
import json
from collections import Counter
from pathlib import Path

import cardge13_exact13_global_source_cell_csp_piqd as base

PIVOT = 10
ORDER = tuple(range(13))
CHAINS = ((7, 6, 5, 4), (11, 12, 0), (9, 8, 1, 2, 3))
MINIMAL_ROWS = (
    ("S", 4, (0, 11, 12)),
    ("D", 7, (1, 2, 3, 10)),
    ("K", 0, (4, 5, 6, 7)),
    ("L", 0, (8, 9, 10)),
)
FULL_ROWS = (
    ("S", 4, (0, 8, 11, 12)),
    ("D", 7, (1, 2, 3, 10)),
    ("K", 0, (4, 5, 6, 7)),
    ("L", 0, (3, 8, 9, 10)),
)
LINK_FORMS = (
    ((0, 6, 7, 10, 0),),
    ((0, 5, 6, 10, 0),),
    ((0, 4, 5, 10, 0),),
    ((4, 10, 11, 12, 1),),
    ((0, 4, 10, 12, 0),),
    ((0, 8, 9, 10, 0),),
    ((0, 1, 7, 10, 1), (0, 7, 8, 10, 0)),
    ((1, 2, 7, 10, 1),),
    ((2, 3, 7, 10, 1),),
)


def require(condition, message):
    """Fail closed, including under Python optimization."""
    if not condition:
        raise ValueError(message)


def form_vector(form):
    """Return an unprojected strict crossing-minus-uncrossed vector."""
    result = Counter(form["positive"])
    result.subtract(form["negative"])
    return {edge: value for edge, value in result.items() if value}


def project(vector, roots):
    """Substitute row-equality classes using signed integer arithmetic."""
    result = Counter()
    for edge, value in vector.items():
        result[roots[edge]] += value
    return tuple(sorted((edge, value) for edge, value in result.items() if value))


def check_links(rows=MINIMAL_ROWS, chains=CHAINS, links=LINK_FORMS):
    """Check the exact nine strict comparisons and the three-chain cover."""
    covered = [point for chain in chains for point in chain]
    require(sorted(covered) == [i for i in ORDER if i != PIVOT], "chains do not partition other labels")
    pairs = [(a, b) for chain in chains for a, b in itertools.pairwise(chain)]
    require(len(pairs) == len(links), "wrong number of chain links")
    roots = base.edge_roots_for_rows(rows)
    forms = {form["form"]: form for form in base.kalmanson_forms(ORDER)}
    for (left, right), ids in zip(pairs, links, strict=True):
        require(bool(ids) and all(i in forms for i in ids), "invalid strict form identifier")
        vector = Counter()
        for form_id in ids:
            vector.update(form_vector(forms[form_id]))
        target = {base.distance_edge(PIVOT, right): 1, base.distance_edge(PIVOT, left): -1}
        require(project(vector, roots) == project(target, roots), "chain link does not replay")
        require(bool(project(target, roots)), "base rows already identify a strict pair")
    return len(pairs)


def scan(rows=MINIMAL_ROWS):
    """Exhaust all pivot supports and replay a one/two-form zero certificate."""
    forms = base.kalmanson_forms(ORDER)
    raw_vectors = tuple(form_vector(form) for form in forms)
    chain_index = {point: i for i, chain in enumerate(CHAINS) for point in chain}
    certificates = []
    counts = Counter()
    for support in itertools.combinations([i for i in ORDER if i != PIVOT], 4):
        require(len({chain_index[i] for i in support}) < 4, "pigeonhole cover failed")
        roots = base.edge_roots_for_rows((*rows, ("R", PIVOT, support)))
        projected = [project(vector, roots) for vector in raw_vectors]
        ids = None
        if () in projected:
            ids = (projected.index(()),)
        else:
            by_vector = {vector: i for i, vector in enumerate(projected)}
            for i, vector in enumerate(projected):
                opposite = tuple((edge, -value) for edge, value in vector)
                if opposite in by_vector:
                    ids = (i, by_vector[opposite])
                    break
        require(ids is not None, f"no short cancellation for {support}")
        total = Counter()
        for i in ids:
            total.update(raw_vectors[i])
        require(not project(total, roots), "cancellation replay failed")
        counts[len(ids)] += 1
        certificates.append({"support": support, "forms": [forms[i]["form"] for i in ids]})
    require(len(certificates) == 495, "incomplete support census")
    return {"one_form": counts[1], "two_form": counts[2], "covered": len(certificates), "certificates": certificates}


def build_report():
    """Produce a finite conditional certificate, retaining all 495 exits."""
    links = check_links()
    result = scan()
    return {
        "schema": "exact13-three-chain-cell/v1",
        "scope": "Fixed order and four named rows only; no source occurrence or all-cell coverage claim.",
        "source": "nthdegree erdos-97-96-formalization #16061",
        "order": ORDER,
        "pivot": PIVOT,
        "minimal_rows": MINIMAL_ROWS,
        "full_rows": FULL_ROWS,
        "chains": CHAINS,
        "link_forms": LINK_FORMS,
        "checked_chain_links": links,
        "strict_form_instances_in_links": sum(map(len, LINK_FORMS)),
        "certificate_rows": "minimal_rows",
        "mirror_checked": check_mirror(),
        **result,
    }


def check_mirror():
    """Check that reversing the cyclic order preserves all signed gap vectors."""
    direct = {tuple(sorted(form_vector(f).items())) for f in base.kalmanson_forms(ORDER)}
    mirror = {tuple(sorted(form_vector(f).items())) for f in base.kalmanson_forms(ORDER[::-1])}
    require(direct == mirror and len(direct) == 1430, "mirror form family mismatch")
    return True


def verify_report(report):
    """Replay stored certificates and exact coverage without trusting counts."""
    expected_spec = {
        "order": ORDER, "pivot": PIVOT, "minimal_rows": MINIMAL_ROWS,
        "full_rows": FULL_ROWS, "chains": CHAINS, "link_forms": LINK_FORMS,
        "certificate_rows": "minimal_rows", "checked_chain_links": 9,
        "strict_form_instances_in_links": 10, "mirror_checked": True,
    }
    for key, value in expected_spec.items():
        require(report.get(key) == json.loads(json.dumps(value)), f"specification mismatch: {key}")
    require(report.get("schema") == "exact13-three-chain-cell/v1", "wrong schema")
    check_links()
    check_mirror()
    forms = {form["form"]: form for form in base.kalmanson_forms(ORDER)}
    expected = set(itertools.combinations([i for i in ORDER if i != PIVOT], 4))
    found = set()
    counts = Counter()
    for cert in report["certificates"]:
        support = tuple(cert["support"])
        require(support in expected and support not in found, "invalid or duplicate support")
        require(len(cert["forms"]) in (1, 2), "invalid positive weight support")
        roots = base.edge_roots_for_rows((*MINIMAL_ROWS, ("R", PIVOT, support)))
        total = Counter()
        for raw_id in cert["forms"]:
            form_id = tuple(raw_id)
            require(form_id in forms, "unknown strict form")
            total.update(form_vector(forms[form_id]))
        require(not project(total, roots), "stored cancellation failed")
        found.add(support)
        counts[len(cert["forms"])] += 1
    require(found == expected, "coverage is incomplete")
    require(report.get("covered") == 495, "wrong coverage count")
    require(report.get("one_form") == counts[1], "wrong one-form count")
    require(report.get("two_form") == counts[2], "wrong two-form count")
    return True


def main():
    """Print bounded counts, optionally retain the full generated certificate."""
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--output", type=Path)
    parser.add_argument("--verify", type=Path, help="check a retained certificate instead of regenerating")
    args = parser.parse_args()
    require(not (args.output and args.verify), "choose generation or replay")
    report = json.loads(args.verify.read_text()) if args.verify else build_report()
    verify_report(json.loads(json.dumps(report)))
    if args.output:
        require(not args.output.exists(), "refusing to overwrite existing certificate")
        args.output.write_text(json.dumps(report, sort_keys=True, separators=(",", ":")) + "\n")
    print(json.dumps({key: report[key] for key in ("covered", "one_form", "two_form", "checked_chain_links", "strict_form_instances_in_links")}))


if __name__ == "__main__":
    main()
