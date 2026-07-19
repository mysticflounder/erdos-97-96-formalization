#!/usr/bin/env python3
"""Independent semantic replay of the saved two-Kalmanson certificate."""

from __future__ import annotations

import argparse
import json
from pathlib import Path


def norm_pair(term: list[int]) -> tuple[int, int]:
    a, b = term
    if a == b:
        raise AssertionError("distance term has repeated endpoint")
    return min(a, b), max(a, b)


class DSU:
    def __init__(self) -> None:
        self.parent: dict[tuple[int, int], tuple[int, int]] = {}

    def find(self, x: tuple[int, int]) -> tuple[int, int]:
        self.parent.setdefault(x, x)
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])
        return self.parent[x]

    def union(self, a: tuple[int, int], b: tuple[int, int]) -> None:
        ra, rb = self.find(a), self.find(b)
        if ra != rb:
            self.parent[max(ra, rb)] = min(ra, rb)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--carrier", required=True, type=Path)
    parser.add_argument("--certificate", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    carrier = json.loads(args.carrier.read_text(encoding="utf-8"))
    cert = json.loads(args.certificate.read_text(encoding="utf-8"))
    rows = {int(k): set(int(v) for v in values) for k, values in carrier["rows"].items()}
    failures: list[str] = []

    roles = cert["cyclic_roles_original"]
    if roles != sorted(roles) or len(roles) != len(set(roles)):
        failures.append("roles are not a strictly increasing cyclic subsequence")
    for center, point in cert["required_memberships_original"]:
        if point not in rows.get(center, set()):
            failures.append(f"missing membership {center}->{point}")

    dsu = DSU()
    for eq in cert["row_equalities"]:
        center = int(eq["center"])
        first, second = [norm_pair(term) for term in eq["terms"]]
        if center not in first or center not in second:
            failures.append(f"row equality at {center} is not center-incident")
        other_first = first[0] if first[1] == center else first[1]
        other_second = second[0] if second[1] == center else second[1]
        if other_first not in rows[center] or other_second not in rows[center]:
            failures.append(f"row equality at {center} is not supported by carrier")
        dsu.union(first, second)

    # Reconstruct the two Kalmanson coefficient rows from the ordered quadruples,
    # independently of the certificate's recorded simplified coefficients.
    reconstructed: list[dict[tuple[int, int], int]] = []
    for inequality in cert["strict_inequalities"]:
        a, b, c, d = inequality["ordered_quadruple"]
        if not a < b < c < d:
            failures.append(f"quadruple {a,b,c,d} is not increasing")
        if inequality["kind"] == "complementary_kalmanson":
            positive = [norm_pair([a, c]), norm_pair([b, d])]
            negative = [norm_pair([a, b]), norm_pair([c, d])]
        elif inequality["kind"] == "kalmanson":
            positive = [norm_pair([a, c]), norm_pair([b, d])]
            negative = [norm_pair([a, d]), norm_pair([b, c])]
        else:
            failures.append(f"unknown inequality kind {inequality['kind']}")
            continue
        coeffs: dict[tuple[int, int], int] = {}
        for term in positive:
            root = dsu.find(term)
            coeffs[root] = coeffs.get(root, 0) + 1
        for term in negative:
            root = dsu.find(term)
            coeffs[root] = coeffs.get(root, 0) - 1
        reconstructed.append({term: coeff for term, coeff in coeffs.items() if coeff})

    summed: dict[tuple[int, int], int] = {}
    for coeffs in reconstructed:
        for term, coeff in coeffs.items():
            summed[term] = summed.get(term, 0) + coeff
    summed = {term: coeff for term, coeff in summed.items() if coeff}
    if summed:
        failures.append(f"Farkas coefficients do not cancel: {summed}")
    if sum(int(item["rhs"]) for item in cert["strict_inequalities"]) != 2:
        failures.append("normalized strict right-hand sides do not sum to two")

    payload = {
        "schema": "p97-two-kalmanson-cycle-verification-v1",
        "status": "VERIFIED" if not failures else "FAILED",
        "failures": failures,
        "checked_membership_count": len(cert["required_memberships_original"]),
        "checked_row_equality_count": len(cert["row_equalities"]),
        "checked_strict_inequality_count": len(reconstructed),
        "summed_coefficient_count": len(summed),
        "summed_rhs": 2,
        "derived_contradiction": "0 >= 2" if not failures else None,
    }
    args.output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"status": payload["status"], "failures": failures}))
    return 0 if not failures else 1


if __name__ == "__main__":
    raise SystemExit(main())
