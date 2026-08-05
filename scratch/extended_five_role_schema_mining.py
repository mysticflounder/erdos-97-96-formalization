#!/usr/bin/env python3
"""Exact Kalmanson audit of the live endpoint schema with M and B.

This is diagnostic only.  It checks the current source-backed distance
equalities/nonmemberships against all cyclic insertions of M and B into each
of the two residual five-role orders.  A reported UNSAT result has an exact
positive Kalmanson-gap dependence; a reported SAT result is an exact rational
metric/Kalmanson witness, not automatically an Euclidean witness.
"""

from __future__ import annotations

import json
from itertools import combinations, permutations
from pathlib import Path

from five_role_kalmanson_enumeration import (
    SYSTEMS,
    kalmanson_gaps,
    pair,
    positive_gap_certificate,
    rational_witness,
    vec,
)


def extended_data(name):
    """Return the live equality and nonmembership schema for one branch."""
    if name == "A=J":
        roles = ("O", "A", "C", "X", "K", "M", "B")
        base_equalities = (
            (pair("O", "A"), pair("O", "C")),
            (pair("A", "C"), pair("A", "K")),
            (pair("X", "A"), pair("X", "K")),
        )
        # These are the two exact survivors after adding P1, per the live
        # follow-up (#2940), not the pre-P1 residual pair.
        residuals = ("OAKXC", "OCXKA")
        p = (pair("X", "C"), pair("X", "K"))
    else:
        roles = ("O", "A", "C", "J", "K", "M", "B")
        base_equalities = (
            (pair("O", "J"), pair("O", "C")),
            (pair("A", "C"), pair("A", "K")),
            (pair("C", "J"), pair("C", "K")),
        )
        # These are the two exact survivors after adding P2, per #2940.
        residuals = ("OCAKJ", "OJKAC")
        p = (pair("J", "K"), pair("J", "C"))

    # O-shell contains C, J/M; A-shell contains C/K; B-shell contains C/M.
    # J is A in the first branch, so OJ=OC is already OA=OC there.
    shell_equalities = (
        (pair("O", "C"), pair("O", "M")),
        (pair("B", "C"), pair("B", "M")),
    )
    # M is not in the first source shell; K is not in the second (B) shell.
    nonmemberships = (
        (pair("A", "M"), pair("A", "C")),
        (pair("B", "K"), pair("B", "C")),
    )
    return {
        "roles": roles,
        "equalities": base_equalities + shell_equalities,
        "nonmemberships": nonmemberships,
        "residuals": residuals,
        "predicate": p,
    }


def insert_roles(base, extras):
    """All O-anchored cyclic orders whose projection is ``base``."""
    out = []
    tail_roles = [r for r in base[1:]]
    for tail in permutations(tail_roles + list(extras)):
        if tuple(r for r in tail if r not in extras) == tuple(tail_roles):
            out.append(("O",) + tail)
    return out


def one_sided_nonmembership(pi, left, right, positive):
    coefficient = 1 if positive else -1
    label = f"d{''.join(left)}{'>' if positive else '<'}d{''.join(right)}"
    return label, vec(pi, [(coefficient, *left), (-coefficient, *right)])


def audit_branch(name):
    data = extended_data(name)
    pair_list = list(combinations(sorted(data["roles"]), 2))
    pi = {p: i for i, p in enumerate(pair_list)}
    rows = []

    for base_name in data["residuals"]:
        base = tuple(base_name)
        for order in insert_roles(base, ("M", "B")):
            gaps = kalmanson_gaps(order, pi)
            base_cert = positive_gap_certificate(pi, gaps, data["equalities"])
            if base_cert is not None:
                rows.append({"base": base_name, "order": "".join(order),
                             "baseline": "UNSAT", "cert": base_cert})
                continue

            # A nonmembership is a disjunction of its two strict signs.  A
            # witness for either sign proves that the nonmembership is not
            # entailed by the current linear schema.
            nm_signs = {}
            nm_witnesses = {}
            nm_certs = {}
            for i, (left, right) in enumerate(data["nonmemberships"]):
                sign_results = []
                for positive in (True, False):
                    pred = one_sided_nonmembership(pi, left, right, positive)
                    cert = positive_gap_certificate(
                        pi, gaps + [pred], data["equalities"]
                    )
                    witness = None if cert else rational_witness(
                        pi, gaps + [pred], data["equalities"], triangles=True
                    )
                    sign_results.append({"predicate": pred[0],
                                         "status": ("UNSAT" if cert else
                                                    "SAT" if witness is not None else
                                                    "UNKNOWN"),
                                         "sat": witness is not None,
                                         "witness": witness,
                                         "cert": cert})
                nm_signs[str(i)] = sign_results
                if any(x["sat"] for x in sign_results):
                    nm_witnesses[str(i)] = next(
                        x for x in sign_results if x["sat"]
                    )
                elif all(x["status"] == "UNSAT" for x in sign_results):
                    nm_certs[str(i)] = sign_results

            # Test the proposed positive equality P1/P2, with the actual
            # source-backed nonmemberships retained.
            pleft, pright = data["predicate"]
            proposal = (f"d{''.join(pleft)}=d{''.join(pright)}",
                        vec(pi, [(1, *pleft), (-1, *pright)]))
            # The proposal is an equality, so quotient it with the full
            # source-backed schema.  The separate gap below is retained only
            # to make the positive dependence readable when it is impossible.
            full_proposal_equalities = data["equalities"] + ((pleft, pright),)
            proposal_gaps = gaps
            proposal_cert = positive_gap_certificate(
                pi, proposal_gaps, full_proposal_equalities
            )
            proposal_witness = None if proposal_cert else rational_witness(
                pi, proposal_gaps, full_proposal_equalities, triangles=True
            )

            rows.append({
                "base": base_name,
                "order": "".join(order),
                "baseline": "SAT",
                "nonmembership_signs": nm_signs,
                "nonmembership_witness": nm_witnesses,
                "nonmembership_both_unsat": sorted(nm_certs),
                "proposal": proposal[0],
                "proposal_status": ("UNSAT" if proposal_cert else
                                    "SAT" if proposal_witness is not None else
                                    "UNKNOWN"),
                "proposal_sat": proposal_witness is not None,
                "proposal_witness": proposal_witness,
                "proposal_cert": proposal_cert,
                "pairs": pair_list,
            })
    return data, rows


def witness_text(row):
    if row.get("proposal_witness") is None:
        return ""
    return ", ".join(
        f"d{a}{b}={v}" for (a, b), v in zip(row["pairs"], row["proposal_witness"])
    )


def main():
    result = {}
    report = [
        "# Live endpoint schema: extended M/B Kalmanson audit",
        "",
        "The schema includes O-shell C,J,M; A-shell C,K; B-shell C,M;",
        "M not in A-shell; and K not in B-shell. M and B are inserted in",
        "all cyclic positions preserving each named post-P1/P2 residual order.",
        "",
        "SAT means an exact rational distance/Kalmanson witness. It is an",
        "abstract metric witness unless separately Euclidean-validated.",
        "",
    ]
    for name in ("A=J", "X=C"):
        data, rows = audit_branch(name)
        result[name] = {"schema": data, "rows": rows}
        base_sat = [r for r in rows if r["baseline"] == "SAT"]
        proposal_closed = [r for r in base_sat if r["proposal_status"] == "UNSAT"]
        both_nm_unsat = [r for r in base_sat if len(r["nonmembership_both_unsat"]) == 2]
        proposal_sat = [r for r in base_sat if r["proposal_sat"]]
        report.extend([
            f"## {name}", "",
            f"- insertion orders: {len(rows)}",
            f"- baseline SAT: {len(base_sat)}",
            f"- proposed equality UNSAT: {len(proposal_closed)}",
            f"- proposed equality SAT: {len(proposal_sat)}",
            f"- current nonmembership signs both UNSAT: {len(both_nm_unsat)}",
            "",
            "| base | extended order | proposed equality | nonmembership status | witness/core |",
            "|---|---|---|---|---|",
        ])
        for row in rows:
            if row["baseline"] != "SAT":
                report.append(f"| {row['base']} | {row['order']} | baseline UNSAT | - | - |")
                continue
            nm = []
            for i, signs in row["nonmembership_signs"].items():
                nm.append(i + ":" + "/".join(s["status"] for s in signs))
            if row["proposal_status"] == "SAT":
                detail = witness_text(row)
                prop = "SAT"
            elif row["proposal_status"] == "UNSAT":
                labels, coeff = row["proposal_cert"]
                detail = "+".join(f"{c}*{label}" for label, c in zip(labels, coeff)) + " = 0"
                prop = "UNSAT"
            else:
                detail = "no exact witness reconstructed"
                prop = "UNKNOWN"
            report.append(f"| {row['base']} | {row['order']} | {prop} | {'; '.join(nm)} | {detail} |")
        report.append("")

    out_json = Path("scratch/extended_five_role_schema_mining.json")
    out_md = Path("scratch/extended_five_role_schema_mining_report.md")
    out_json.write_text(json.dumps(result, indent=2, default=str) + "\n")
    out_md.write_text("\n".join(report) + "\n")
    print(out_md)
    print(out_json)
    for name in result:
        rows = result[name]["rows"]
        sat = [r for r in rows if r["baseline"] == "SAT"]
        print(name, "rows", len(rows), "baseline_sat", len(sat),
              "proposal_unsat", sum(r["proposal_status"] == "UNSAT" for r in sat),
              "proposal_sat", sum(r["proposal_sat"] for r in sat),
              "both_nm_unsat", sum(len(r["nonmembership_both_unsat"]) == 2 for r in sat))


if __name__ == "__main__":
    main()
