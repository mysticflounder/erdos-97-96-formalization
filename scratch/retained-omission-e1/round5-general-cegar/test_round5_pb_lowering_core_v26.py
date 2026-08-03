import z3

import round5_cegar_v17 as v17
import round5_pb_lowering_core_v26 as v26


def test_exact_weighted_pb_lowering_is_clause_only_and_zero_theory():
    xs = [z3.Bool(f"x{i}") for i in range(5)]
    r = z3.Real("r")
    source = [z3.PbGe([(r >= 0, 1)] + [(x, 1) for x in xs], 3)]
    lowered, mappings, audit = v26.lower_pb_atoms(source, group_index=0, group_name="smoke")
    assert len(mappings) == 1
    assert mappings[0]["auxiliaries"]
    assert audit["post_audit"]["accepted"] is True
    assert v17.logic_audit(lowered)["pb_nodes"] == 0

    assert mappings[0]["child_proxies"]
    for extra in (z3.And(r < 0, *xs), z3.And(r < 0, *(z3.Not(x) for x in xs))):
        original = z3.Solver(); original.add(*source, extra)
        replay = z3.Solver(); replay.add(*lowered, extra)
        assert original.check() == replay.check()


def test_unmapped_auxiliary_gate_and_hashes_are_deterministic():
    xs = [z3.Bool(f"y{i}") for i in range(4)]
    first = v26.lower_pb_atoms([z3.PbEq([(x, 1) for x in xs], 2)], group_index=3, group_name="g")
    second = v26.lower_pb_atoms([z3.PbEq([(x, 1) for x in xs], 2)], group_index=3, group_name="g")
    assert first[1] == second[1]
    assert first[2]["lowered_sha256"] == second[2]["lowered_sha256"]
    mapped = {name for record in first[1] for name in record["auxiliaries"]}
    present = {name for name in v26.bool_constants(first[0]) if name.startswith("v26_aux_")}
    assert mapped == present


def test_authenticated_weighted_shape_rewrites_before_pb2bv():
    xs = [z3.Bool(f"w{i}") for i in range(14)]
    atom = z3.PbGe([(x, 1) for x in xs[:13]] + [(xs[13], 2)], 13)
    lowered, mappings, audit = v26.lower_pb_atoms([atom], group_index=4, group_name="weighted")
    assert mappings[0]["pb_sha256"] == v26.expression_sha256((atom,))
    assert audit["post_audit"]["accepted"] is True
    assert v17.logic_audit(lowered)["pb_nodes"] == 0
