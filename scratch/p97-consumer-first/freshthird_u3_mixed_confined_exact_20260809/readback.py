#!/usr/bin/env python3
"""Independent structural readback for enumerate_u3_packet.py output."""
import itertools, json, pathlib, sys

LABELS = ("p", "q", "u", "a0", "a1", "t1", "t2", "t3")
CENTERS = ("u", "a0", "a1", "t1", "t2", "t3")
CIRCLE = {"q", "t1", "t2", "t3"}

def check_row(mode, center, row):
    s = set(row["support"])
    assert len(s) == 4 and len(s) == len(row["support"])
    assert set(row["support"]) <= set(LABELS) and center not in s
    assert len(s & CIRCLE) <= 2 and len(s - CIRCLE) >= 2
    if mode == "Q":
        assert "q" not in s
        assert row["closure"] is None
    else:
        assert "q" in s
        assert row["closure"] == {x: (x in s) for x in LABELS}

def readback(path):
    data = json.loads(path.read_text())
    assert tuple(data["labels"]) == LABELS and tuple(data["centers"]) == CENTERS
    assert data["totals"]["mode_assignments"] == 64
    sat = tuples = 0
    for row in data["mode_rows"]:
        modes = row["modes"]
        assert len(modes) == 6 and set(modes) <= {"Q", "S"}
        assert row["z3"] in {"sat", "unsat"}
        assert row["cvc5"] in {"sat", "unsat"}
        if row["models"]:
            sat += 1
            assert row["z3"] == row["cvc5"] == "sat"
        else:
            assert row["z3"] == row["cvc5"] == "unsat"
        tuples += row["models"]
        for model in row["examples"]:
            assert len(model) == 6
            for i, support in enumerate(model):
                check_row(modes[i], CENTERS[i], support)
            for i, j in itertools.combinations(range(6), 2):
                assert len(set(model[i]["support"]) & set(model[j]["support"])) <= 2
    assert sat == data["totals"]["sat_assignments"]
    assert tuples == data["totals"]["support_tuples"]
    print(json.dumps({"readback": "PASS", "sat_assignments": sat,
                      "support_tuples": tuples}, sort_keys=True))

if __name__ == "__main__":
    readback(pathlib.Path(sys.argv[1] if len(sys.argv) > 1 else "results.json"))
