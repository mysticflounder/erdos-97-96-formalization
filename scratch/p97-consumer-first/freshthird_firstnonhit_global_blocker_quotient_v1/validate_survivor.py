#!/usr/bin/env python3
"""Independent semantic validation of the minimized survivor."""
import json
from pathlib import Path

p = Path(__file__).resolve().parent / "SURVIVOR.json"
x = json.loads(p.read_text())
assert x["case"] == "common_sameblocker"
assert set(x["constructor_tags"].values()) == {"sameBlocker"}
assert x["q_fiber"] == {"card": 4, "image_is_q_support": True}
assert x["q_support_blockers"] == ["qCenter"] * 4
assert all(row == [True] * 4 for row in x["q_support_selected_rows"])
assert len(x["q_fan_caps"]) == 4 and len(set(x["q_fan_caps"])) == 1
assert x["repeated_cap_pair"]["outcome"] == "same_actual_blocker"
assert x["q_center_nonrobust"]
r = x["retained_pair"]
assert r["centers_distinct"] and r["mutual_selected_row_omissions"]
assert all(0 <= n <= 2 for n in r["q_overlaps"])
c = x["common_same_blocker"]
assert c["q_center_in_canonical_strict_cap"] and c["off_q_strict_cap_sources"] == 4
assert c["sources_pairwise_distinct"] and c["each_blocker_center_distinct_from_q"]
assert all(0 <= n <= 2 for n in c["selected_row_q_overlaps"])
assert x["all_named_actual_blockers_have_no_fixed_point"]
print("VALID minimized semantic survivor")
