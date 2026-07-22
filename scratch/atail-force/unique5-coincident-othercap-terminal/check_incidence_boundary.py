#!/usr/bin/env python3
"""Exact finite-incidence regression for the coincident-blocker off-cap arms.

This deliberately checks only the cap-partition and selected-support surface
listed in REPORT.md.  It is not a Euclidean or CounterexampleData model.
"""

from __future__ import annotations

import argparse
import hashlib
import json


def check_mode(mode: str) -> dict[str, object]:
    assert mode in {"surplus", "second_opposite"}

    vertices = {"O", "U", "V"}
    first_interior = {"q", "w", "f", "u", "v", "c"}
    surplus_interior = {"a", "d", "h"}
    second_interior = {"b", "e", "g"}
    if mode == "surplus":
        surplus_interior.add("x")
        fresh_shell = {"f", "b", "e", "g"}
    else:
        second_interior.add("x")
        fresh_shell = {"f", "a", "d", "h"}

    first_cap = {"U", "V"} | first_interior
    surplus_cap = {"O", "U"} | surplus_interior
    second_cap = {"V", "O"} | second_interior
    caps = {
        "first": first_cap,
        "surplus": surplus_cap,
        "second_opposite": second_cap,
    }
    carrier = vertices | first_interior | surplus_interior | second_interior

    exact_five = {"q", "w", "f", "u", "v"}
    common_shell = {"q", "w", "a", "b"}

    # Exact displayed cap partition: strict interiors are pairwise disjoint;
    # triangle vertices have precisely the two endpoint memberships.
    strict_parts = [first_interior, surplus_interior, second_interior]
    for i, left in enumerate(strict_parts):
        for right in strict_parts[i + 1 :]:
            assert left.isdisjoint(right)
    assert set().union(*caps.values()) == carrier
    assert first_cap & surplus_cap == {"U"}
    assert first_cap & second_cap == {"V"}
    assert surplus_cap & second_cap == {"O"}

    # Unique-five coincident-blocker incidence surface.
    assert len(exact_five) == 5
    assert {"q", "w", "f"} <= exact_five & first_interior
    assert len(common_shell) == 4
    assert common_shell & first_cap == {"q", "w"}
    assert len(fresh_shell) == 4 and "f" in fresh_shell
    assert fresh_shell & exact_five == {"f"}
    assert {"q", "w"}.isdisjoint(fresh_shell)

    # The fifth class source is omitted by both supports and realizes the
    # marginal joint-deletion choice.
    assert "v" not in common_shell | fresh_shell

    blocker_cap = caps[mode]
    assert "c" in first_interior and "x" in blocker_cap
    assert all(not ({"c", "x"} <= cap) for cap in caps.values())

    # O and x share the other cap, while every exact-five source lies outside
    # it.  The model records the only incidence pattern compatible with the
    # ordered-cap uniqueness consequence: the x-shell has one class hit.
    assert {"O", "x"} <= blocker_cap
    assert exact_five.isdisjoint(blocker_cap)

    same_cap_with_fresh_blocker_available = any(
        {"c", "x"} <= cap and {"q", "w"}.isdisjoint(cap)
        for cap in caps.values()
    )
    same_cap_with_first_apex_available = any(
        {"c", "O"} <= cap and {"q", "w"}.isdisjoint(cap)
        for cap in caps.values()
    )
    ordered_cross_hit_available = bool({"q", "w"} & fresh_shell)
    assert not same_cap_with_fresh_blocker_available
    assert not same_cap_with_first_apex_available
    assert not ordered_cross_hit_available

    # The displayed packet itself is not M44: its two non-surplus caps are
    # the first and second-opposite caps, neither both card four.
    cap_cards = {name: len(cap) for name, cap in caps.items()}
    assert not (cap_cards["first"] == 4 and cap_cards["second_opposite"] == 4)

    return {
        "mode": mode,
        "carrier_card": len(carrier),
        "cap_cards": cap_cards,
        "exact_five": sorted(exact_five),
        "common_shell": sorted(common_shell),
        "fresh_shell": sorted(fresh_shell),
        "fresh_shell_exact_five_intersection": sorted(fresh_shell & exact_five),
        "joint_deletion_source": "v",
        "same_cap_with_fresh_blocker_available":
            same_cap_with_fresh_blocker_available,
        "same_cap_with_first_apex_available": same_cap_with_first_apex_available,
        "ordered_cross_hit_available": ordered_cross_hit_available,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    if not args.check:
        parser.error("pass --check")

    result = {
        "scope": "exact finite incidence and cap partition; not Euclidean",
        "modes": [check_mode("surplus"), check_mode("second_opposite")],
    }
    payload = json.dumps(result, sort_keys=True, separators=(",", ":"))
    digest = hashlib.sha256(payload.encode()).hexdigest()
    print(f"PASS: {digest}")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
