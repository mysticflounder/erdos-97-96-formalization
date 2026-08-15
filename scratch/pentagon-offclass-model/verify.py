#!/usr/bin/env python3
"""Replay the exact finite incidence semantics documented in REPORT.md."""

from __future__ import annotations

import copy
import json
from collections import Counter
from pathlib import Path


MODEL_PATH = Path(__file__).with_name("model.json")


def errors(model: dict) -> list[str]:
    out: list[str] = []
    universe_list = model["universe"]
    universe = set(universe_list)
    cls = set(model["class"])
    rows = {source: set(row) for source, row in model["rows"].items()}
    blocker = model["blocker"]
    named = model["named"]

    if len(universe_list) != 12 or len(universe) != 12:
        out.append("universe is not exactly 12 distinct points")
    if len(cls) != 5 or not cls <= universe:
        out.append("class is not exactly 5 carrier points")
    if set(rows) != universe:
        out.append("there is not exactly one selected row for every source")
    if set(blocker) != universe or not set(blocker.values()) <= universe:
        out.append("blocker is not a total carrier-valued map")

    for source in universe & set(rows):
        row = rows[source]
        if len(row) != 4 or not row <= universe:
            out.append(f"row[{source}] is not a 4-subset of the carrier")
        if source not in row:
            out.append(f"row[{source}] does not contain its source")
        if len(row & cls) > 2:
            out.append(f"row[{source}] meets the class in more than 2 points")

    # Natural positive-radius shell fact. It is stronger than the user's list,
    # so satisfying it cannot be responsible for a spurious countermodel.
    for source in universe & set(rows) & set(blocker):
        if blocker[source] in rows[source]:
            out.append(f"blocker[{source}] lies in its own support")

    sources = list(universe & set(rows) & set(blocker))
    for i, source in enumerate(sources):
        for other in sources[i + 1 :]:
            if blocker[source] == blocker[other] and rows[source] != rows[other]:
                out.append(
                    f"equal blocker at {source},{other} has unequal supports"
                )
    for point, count in Counter(blocker.values()).items():
        if count > 4:
            out.append(f"blocker fiber at {point} has size {count} > 4")

    u = named["u"]
    xu = named["xu"]
    deleted = named["deleted"]
    v = named["v"]
    xv = named["xv"]
    c = named["xv_blocker"]
    if rows.get(xv, set()) & cls != {xv, u}:
        out.append("xv-row class trace is not exactly {xv,u}")
    if rows.get(xu, set()) & cls != {xu, deleted}:
        out.append("xu-row class trace is not exactly {xu,deleted}")
    deleted_row = rows.get(deleted, set())
    if v not in deleted_row:
        out.append("deleted-row does not contain v")
    for omitted in (u, xu, xv):
        if omitted in deleted_row:
            out.append(f"deleted-row does not omit {omitted}")
    if blocker.get(xv) != c:
        out.append("the named c is not the xv-row blocker")
    if c in cls:
        out.append("the named xv-row blocker c lies in the class")

    xv_row = rows.get(xv, set())
    for source in universe - xv_row:
        row = rows.get(source, set())
        if u in row and xv in row:
            out.append(
                f"outside source {source} has a row containing both u and xv"
            )
    return out


def mutate(model: dict, mutation: str) -> dict:
    bad = copy.deepcopy(model)
    if mutation == "class-size":
        bad["class"].append("c")
    elif mutation == "row-size":
        bad["rows"]["c"].pop()
    elif mutation == "source-membership":
        bad["rows"]["c"] = ["xu", "e", "g", "h"]
    elif mutation == "class-cap":
        bad["rows"]["c"] = ["c", "u", "xu", "deleted"]
    elif mutation == "xv-trace":
        bad["rows"]["xv"] = ["xv", "xu", "a", "b"]
    elif mutation == "xu-trace":
        bad["rows"]["xu"] = ["xu", "c", "e", "f"]
    elif mutation == "deleted-row":
        bad["rows"]["deleted"] = ["deleted", "u", "g", "h"]
    elif mutation == "blocker-off-class":
        bad["named"]["xv_blocker"] = "xu"
        bad["blocker"]["xv"] = "xu"
    elif mutation == "equal-blocker-support":
        bad["blocker"]["u"] = bad["blocker"]["xv"]
    elif mutation == "blocker-fiber":
        for source in ["u", "xu", "deleted", "v", "xv"]:
            bad["blocker"][source] = "c"
    elif mutation == "outside-omission":
        bad["rows"]["c"] = ["c", "u", "xv", "e"]
    elif mutation == "blocker-in-support":
        bad["rows"]["c"] = ["c", "v", "e", "g"]
    else:
        raise ValueError(mutation)
    return bad


def main() -> None:
    model = json.loads(MODEL_PATH.read_text())
    found = errors(model)
    if found:
        raise SystemExit("MODEL INVALID:\n" + "\n".join(found))

    mutations = {
        "class-size": "class is not exactly 5",
        "row-size": "is not a 4-subset",
        "source-membership": "does not contain its source",
        "class-cap": "meets the class in more than 2",
        "xv-trace": "xv-row class trace",
        "xu-trace": "xu-row class trace",
        "deleted-row": "deleted-row",
        "blocker-off-class": "lies in the class",
        "equal-blocker-support": "equal blocker",
        "blocker-fiber": "has size 5 > 4",
        "outside-omission": "outside source c",
        "blocker-in-support": "lies in its own support",
    }
    missed = []
    for name, expected in mutations.items():
        mutation_errors = errors(mutate(model, name))
        if not any(expected in error for error in mutation_errors):
            missed.append(name)
    if missed:
        raise SystemExit("SMOKE TEST FAILED TO REJECT: " + ", ".join(missed))

    fibers = Counter(model["blocker"].values())
    print("SAT: explicit 12-point incidence model verified")
    print(f"rows={len(model['rows'])}; row_size=4; class_size={len(model['class'])}")
    print(f"max_class_trace={max(len(set(r) & set(model['class'])) for r in model['rows'].values())}")
    print(f"max_blocker_fiber={max(fibers.values())}")
    print(f"smoke_mutations_rejected={len(mutations)}/{len(mutations)}")


if __name__ == "__main__":
    main()
