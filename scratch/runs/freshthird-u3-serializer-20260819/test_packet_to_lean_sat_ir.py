"""Differential and semantic checks for the source-arm packet serializer."""

from __future__ import annotations

import importlib.util
from pathlib import Path

ROOT = Path(__file__).parent
spec = importlib.util.spec_from_file_location("packet_to_ir", ROOT / "packet_to_lean_sat_ir.py")
assert spec and spec.loader
module = importlib.util.module_from_spec(spec)
spec.loader.exec_module(module)


def packet(arm: str) -> dict:
    roles = {
        "q": 0, "p": 1, "t1": 2, "t2": 3, "t3": 4,
        "u": 5, "a0": 6, "a1": 7, "x": 8,
    }
    row = [1, 5, 6, 8]
    if arm == "qDeleted":
        roles["z"] = 8
    else:
        row = [0, 1, 5, 8]
    return {
        "schema": module.PACKET_SCHEMA,
        "arm": arm,
        "carrier_card": 17,
        "roles": roles,
        "dangerous": [0, 2, 3, 4],
        "exact_radius": [2, 3, 4],
        "bounded": list(range(8)),
        "row": row,
    }


def eval_expr(expr, env, domains):
    tag, value = next(iter(expr.items()))
    if tag == "Const":
        return value
    if tag == "Var":
        return env[value]
    if tag == "Lit":
        return value["value"]
    if tag == "App":
        fn = value["fn"]
        args = tuple(eval_expr(arg, env, domains) for arg in value["args"])
        return env["functions"][(fn, args)]
    if tag == "Eq":
        return eval_expr(value[0], env, domains) == eval_expr(value[1], env, domains)
    if tag == "Not":
        return not eval_expr(value, env, domains)
    if tag == "And":
        return eval_expr(value[0], env, domains) and eval_expr(value[1], env, domains)
    if tag == "Or":
        return eval_expr(value[0], env, domains) or eval_expr(value[1], env, domains)
    if tag == "Imp":
        return (not eval_expr(value[0], env, domains)) or eval_expr(value[1], env, domains)
    if tag == "Forall":
        domain = domains[value["domain"]]
        return all(eval_expr(value["body"], {**env, value["var"]: item}, domains) for item in domain)
    raise AssertionError(f"unexpected IR tag {tag}")


def function_env(p):
    out = {}
    for name, index in p["roles"].items():
        fn = "source_x" if name == "x" else "point_" + name
        out[(fn, ())] = index
    out.update({
        ("dangerous_base", (slot,)): value for slot, value in enumerate(p["dangerous"])
    })
    out.update({
        ("exact_radius", (slot,)): value for slot, value in enumerate(p["exact_radius"])
    })
    out.update({
        ("bounded_support", (slot,)): value for slot, value in enumerate(p["bounded"])
    })
    out.update({
        ("source_row", (slot,)): value for slot, value in enumerate(p["row"])
    })
    if p["arm"] == "qDeleted":
        out[("source_z", ())] = p["roles"]["z"]
    return out


def assert_pinned_formula_accepts(p):
    exported = module.packet_to_ir(p)
    domains = {item["name"]: range(item["card"]) for item in exported["domains"]}
    env = {"functions": function_env(p)}
    assert eval_expr(exported["formula"], env, domains)
    assert exported["source"]["source_arm"] == p["arm"]
    assert exported["source"]["packet_sha256"] == module.packet_sha256(p)
    assert exported["source"]["coverage"]["required_packet_fields"][-1] == "row"
    assert p["arm"] in exported["source"]["coverage"]["arm_checks"]


def test_q_deleted_packet_replays():
    assert_pinned_formula_accepts(packet("qDeleted"))


def test_critical_shell_packet_replays_without_z_table():
    p = packet("criticalShell")
    exported = module.packet_to_ir(p)
    assert_pinned_formula_accepts(p)
    assert not any(item["name"] == "source_z" for item in exported["functions"])


def test_arm_specific_ingress_checks_are_rejected():
    p = packet("qDeleted")
    p["row"] = [0, 1, 5, 8]
    try:
        module.validate_packet(p)
    except ValueError as error:
        assert "qDeleted row must omit q" in str(error)
    else:
        raise AssertionError("qDeleted packet with q in row was accepted")

    p = packet("criticalShell")
    p["row"] = [1, 5, 6, 8]
    try:
        module.validate_packet(p)
    except ValueError as error:
        assert "criticalShell row must contain q" in str(error)
    else:
        raise AssertionError("criticalShell packet without q in row was accepted")


def test_row_dangerous_bound_is_checked_before_serialization():
    p = packet("criticalShell")
    p["row"] = [0, 2, 3, 8]
    try:
        module.packet_to_ir(p)
    except ValueError as error:
        assert "at most two" in str(error)
    else:
        raise AssertionError("three dangerous row points were accepted")


def test_output_is_deterministic():
    p = packet("qDeleted")
    assert module.packet_to_ir(p) == module.packet_to_ir(dict(p))
