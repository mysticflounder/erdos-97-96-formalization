#!/usr/bin/env python3
"""Independent syntactic/model-semantic validator for solver readbacks."""
import re, sys
from pathlib import Path

root = Path(__file__).resolve().parent
case, solver = sys.argv[1:3]
text = (root / "logs" / f"{case}.{solver}.out").read_text()
assert re.search(r"(?m)^sat$", text), "missing exact SAT status"
def val(name):
    m = re.search(r"\(" + re.escape(name) + r"\s+([^()\s]+|\(-\s+\d+\))\)", text)
    assert m, f"missing {name}"
    s = m.group(1)
    if s == "true": return True
    if s == "false": return False
    if s.startswith("(- "): return -int(s[3:-1])
    return int(s)

first, second = val("first_tag"), val("second_tag")
assert 0 <= first <= 1 and 0 <= second <= 3
assert (first == 0) == (val("first_ov") == 4)
assert first == 0 or val("first_ov") <= 2
assert (second == 0) == (val("second_ov") == 4)
assert second == 0 or val("second_ov") <= 2
if second in (2, 3): assert val("second_ov") == 2
assert 0 <= val("first_deleted_q") <= 1 and 0 <= val("second_deleted_q") <= 1
if first == 1: assert not val("first_contains_deleted") and val("first_deletion_survives")
if second == 1: assert not val("second_contains_deleted") and val("second_deletion_survives")
assert 0 <= val("second_source_cap") <= 2 and 0 <= val("second_q_cap") <= 2
if second == 2: assert val("second_source_cap") != val("second_q_cap")
if second == 3: assert val("second_source_cap") == val("second_q_cap") and val("second_internal_q_in_cap")
for i in range(4):
    bits = [val(f"m{i}{j}") for j in range(4)]
    assert bits[i]
    assert val(f"ov{i}") == sum(bits)
    assert 0 <= val(f"cap{i}") <= 2
    if val(f"b{i}") == 0: assert val(f"ov{i}") == 4
    else: assert val(f"ov{i}") <= 2
assert val("b0") == 0 and val("b1") == 0
for i in range(4):
    for j in range(i + 1, 4):
        if val(f"b{i}") == val(f"b{j}"):
            assert all(val(f"m{i}{k}") == val(f"m{j}{k}") for k in range(4))
qb, qd = val("q_boundary"), val("qdist")
assert qb in (0, 1) and 0 <= qd <= 3
assert 2 <= val("qfiber_card") <= 4
if qb == 0:
    assert val("qfiber_card") == 4 and val("qfiber_image_support")
    assert all(val(f"b{i}") == 0 for i in range(4))
else:
    assert val("qfiber_card") <= 3 and not val("qfiber_image_support")
    assert any(val(f"b{i}") != 0 for i in range(4))
    assert val(f"b{qd}") != 0 and val(f"ov{qd}") <= 2
z, w, out = val("repeat_z"), val("repeat_w"), val("repeat_outcome")
assert 0 <= z <= 3 and 0 <= w <= 3 and z != w
assert val(f"cap{z}") == val(f"cap{w}")
arms = [val(f"b{z}") == val(f"b{w}"), val(f"srcincap{z}"), val(f"srcincap{w}"), not val(f"m{z}{w}"), not val(f"m{w}{z}")]
assert 0 <= out <= 4 and arms[out]
assert 0 <= val("ret_location") <= 3
assert not (val("ret_z_eq_q") and val("ret_w_eq_q"))
for side in ("z", "w"):
    assert val(f"ret_{side}_eq_q") == (val(f"ret_{side}_ov") == 4)
    if not val(f"ret_{side}_eq_q"): assert 0 <= val(f"ret_{side}_ov") <= 2
assert not val("ret_z_contains_w") and not val("ret_w_contains_z")
active = case == "common_sameblocker"
assert val("common_helper_active") == active
if active:
    assert first == second == 0
    assert val("qcenter_in_canonical_cap") and val("common_witnesses_distinct")
    assert val("qrow_canonical_cap_count") == 2
    assert all(0 <= val(f"common_w{i}_ov") <= 2 for i in range(4))
    assert all(val(f"common_w{i}_{kind}") for i in range(4) for kind in ("source_in_cap", "off_q", "blocker_ne_q"))
else:
    assert not val("qcenter_in_canonical_cap") and not val("common_witnesses_distinct")
    assert val("qrow_canonical_cap_count") == 0
print(f"VALID {case} {solver}: q_boundary={qb}, repeated=({z},{w},{out}), tags=({first},{second}), common_helper={active}")
