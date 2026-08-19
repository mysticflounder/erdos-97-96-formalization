"""Finite U3 exact-radius ingress layered over the v9 source packet.

This is a diagnostic projection of ``SixSurvivorU3ExactRadiusAuditObstruction``.
It retains the carrier-index, source-link, exact dangerous-radius, bounded-frame,
row-mode, support-cardinality, and dangerous-circle distribution fields.  The
Euclidean equal-distance realization and triple non-collinearity are recorded
as explicit omissions; they are not replaced by Boolean guesses.
"""

from __future__ import annotations

import argparse
import hashlib
import json
from itertools import combinations
from pathlib import Path

import candidate_v9 as v9

SCHEMA = "p97-freshthird-u3-exact-radius-ingress-v10/cnf/v1"
FAMILY = "source_u3_exact_radius_ingress"
SOURCE = (
    "TwoSourceClosure.SixSurvivorExactRowsBoundary"
    ".exists_u3ExactRadiusAuditObstruction; "
    "U3ToU5Terminal.U3FixedTripleAuditFrame; "
    "U3FixedTripleAuditFrame.qDeletedRow_dangerousCircle_distribution; "
    "U3FixedTripleAuditFrame.criticalFourShell_dangerousCircle_distribution"
)
POINT_NAMES = ("q", "p", "t1", "t2", "t3", "u", "a0", "a1")
TRIPLE_NAMES = ("t1", "t2", "t3")
AUDIT_CENTER_NAMES = ("u", "a0", "a1", "t1", "t2", "t3")
ROW_MODES = ("q_deleted", "critical_shell")


def _sha(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _canon(value: object) -> bytes:
    return (json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n").encode()


def emit(n: int = 17) -> tuple[bytes, bytes, dict[str, object], dict[str, object]]:
    _, base_map_bytes, base_manifest, base_sources = v9.emit(n)
    mapping = json.loads(base_map_bytes)
    variables = list(mapping["variables"])
    rows = list(mapping["clauses"])
    role_to_id = {row["role"]: row["id"] for row in variables}
    next_var = len(variables) + 1
    next_clause = len(rows) + 1
    guard = role_to_id["hingress/common_radius_payload"]
    new_rows: list[dict[str, object]] = []

    def variable(role: str) -> int:
        nonlocal next_var
        if role in role_to_id:
            raise ValueError(f"duplicate v10 variable role: {role}")
        identifier = next_var
        next_var += 1
        role_to_id[role] = identifier
        variables.append({"id": identifier, "role": role})
        return identifier

    def add(role: str, literals: list[int]) -> None:
        nonlocal next_clause
        new_rows.append(
            {"family": FAMILY, "id": next_clause, "literals": literals, "role": role}
        )
        next_clause += 1

    def guarded(role: str, literals: list[int]) -> None:
        add(role, [-guard, *literals])

    def bits(prefix: str) -> list[int]:
        return [role_to_id[f"{prefix}/{i}"] for i in range(n)]

    def exact_one(prefix: str) -> list[int]:
        result = [variable(f"u3/{prefix}/{i}") for i in range(n)]
        guarded(f"u3/{prefix}/at_least_one", result)
        for left, right in combinations(result, 2):
            guarded(f"u3/{prefix}/at_most_one/{left}/{right}", [-left, -right])
        return result

    def exact_k(prefix: str, k: int) -> list[int]:
        result = [variable(f"u3/{prefix}/{i}") for i in range(n)]
        for subset in combinations(result, n - k + 1):
            guarded(
                f"u3/{prefix}/at_least_{k}/{len(subset)}",
                list(subset),
            )
        for subset in combinations(result, k + 1):
            guarded(
                f"u3/{prefix}/at_most_{k}/{len(subset)}",
                [-literal for literal in subset],
            )
        return result

    point = {name: exact_one(f"point/{name}") for name in POINT_NAMES}

    # The U3 deleted point and its actual blocker are transported from the
    # selected common-source side of the v9 one-sided packet.  This is the
    # source relation available in the finite ingress; no arbitrary q/p alias
    # is introduced.
    for orientation, deleted_side, _kept_side in v9.ORIENTATIONS:
        parent = role_to_id[
            f"reduced_payload/source_pair/one_sided_deletion/orientation/{orientation}"
        ]
        source = bits(f"common_source/{deleted_side}")
        blocker = bits(f"common_blocker/{deleted_side}")
        for index in range(n):
            guarded(
                f"u3/source_link/{orientation}/q/{index}",
                [-parent, -source[index], point["q"][index]],
            )
            guarded(
                f"u3/source_link/{orientation}/q_back/{index}",
                [-parent, -point["q"][index], source[index]],
            )
            guarded(
                f"u3/source_link/{orientation}/p/{index}",
                [-parent, -blocker[index], point["p"][index]],
            )
            guarded(
                f"u3/source_link/{orientation}/p_back/{index}",
                [-parent, -point["p"][index], blocker[index]],
            )

    # The U3 frame consists of eight distinct carrier points.  This is exactly
    # the membership/erase content of the frame, without pretending to encode
    # Euclidean non-collinearity.
    for left, right in combinations(POINT_NAMES, 2):
        for index in range(n):
            guarded(
                f"u3/distinct/{left}/{right}/{index}",
                [-point[left][index], -point[right][index]],
            )

    radius = exact_k("dangerous_radius", 3)
    for name in TRIPLE_NAMES:
        for index in range(n):
            guarded(
                f"u3/dangerous_radius/{name}/{index}",
                [-point[name][index], radius[index]],
            )
    for index in range(n):
        guarded(
            f"u3/dangerous_radius/only_triple/{index}",
            [-radius[index], *[point[name][index] for name in TRIPLE_NAMES]],
        )
        for name in ("q", "p", "u", "a0", "a1"):
            guarded(
                f"u3/dangerous_radius/off/{name}/{index}",
                [-point[name][index], -radius[index]],
            )

    # ``insert q {t1,t2,t3}`` and the eight-point bounded support are explicit
    # Boolean projections of the corresponding Finset expressions.
    dangerous_base = [variable(f"u3/dangerous_base/{i}") for i in range(n)]
    for index in range(n):
        for name in ("q", *TRIPLE_NAMES):
            guarded(
                f"u3/dangerous_base/{name}/{index}",
                [-point[name][index], dangerous_base[index]],
            )
        guarded(
            f"u3/dangerous_base/back/{index}",
            [-dangerous_base[index], *[point[name][index] for name in ("q", *TRIPLE_NAMES)]],
        )

    bounded = [variable(f"u3/bounded_support/{i}") for i in range(n)]
    for index in range(n):
        for name in POINT_NAMES:
            guarded(
                f"u3/bounded_support/{name}/{index}",
                [-point[name][index], bounded[index]],
            )
        guarded(
            f"u3/bounded_support/back/{index}",
            [-bounded[index], *[point[name][index] for name in POINT_NAMES]],
        )

    # Each of the six bounded audit centers has an exact four-point source row
    # in one of the two source modes.  The row is a finite support projection;
    # exact equality of metric radius classes is intentionally not fabricated.
    modes: dict[str, dict[str, int]] = {}
    supports: dict[str, list[int]] = {}
    for center_name in AUDIT_CENTER_NAMES:
        modes[center_name] = {
            mode: variable(f"u3/row_mode/{center_name}/{mode}")
            for mode in ROW_MODES
        }
        guarded(
            f"u3/row_mode/{center_name}/exactly_one",
            list(modes[center_name].values()),
        )
        guarded(
            f"u3/row_mode/{center_name}/exclusive",
            [-modes[center_name][ROW_MODES[0]], -modes[center_name][ROW_MODES[1]]],
        )
        supports[center_name] = exact_k(f"row/{center_name}/support", 4)
        for index in range(n):
            # Positive-radius classes do not contain their center.
            guarded(
                f"u3/row/{center_name}/center_absent/{index}",
                [-point[center_name][index], -supports[center_name][index]],
            )
            # A q-deleted class omits q; a critical shell contains q.
            guarded(
                f"u3/row/{center_name}/q_deleted_omits_q/{index}",
                [-modes[center_name]["q_deleted"], -point["q"][index],
                 -supports[center_name][index]],
            )
            guarded(
                f"u3/row/{center_name}/critical_shell_contains_q/{index}",
                [-modes[center_name]["critical_shell"], -point["q"][index],
                 supports[center_name][index]],
            )
            for deleted in range(n):
                for center in range(n):
                    has4 = role_to_id[f"has4/{deleted}/{center}"]
                    guarded(
                        f"u3/row/{center_name}/q_deleted_has4/{deleted}/{center}",
                        [-modes[center_name]["q_deleted"], -point["q"][deleted],
                         -point[center_name][center], has4],
                    )

        # Both source row constructors carry the dangerous-circle distribution:
        # no three of the four row points lie on q's dangerous circle.
        for support_indices in combinations(range(n), 3):
            # The support and dangerous-base literals must refer to the same
            # three carrier indices.  Pairing unrelated triples would forbid
            # every four-point row and is not the source cardinality bound.
            guarded(
                f"u3/row/{center_name}/dangerous_distribution/{support_indices}",
                [
                    *[-supports[center_name][i] for i in support_indices],
                    *[-dangerous_base[i] for i in support_indices],
                ],
            )

    # The target obstruction is existential over the six centers.  A critical
    # shell is already an obstruction; in the q-deleted arm, at least one row
    # point must escape the eight-point support.
    obstruction = {
        name: variable(f"u3/obstruction/{name}") for name in AUDIT_CENTER_NAMES
    }
    guarded("u3/obstruction/exactly_one", list(obstruction.values()))
    for left, right in combinations(AUDIT_CENTER_NAMES, 2):
        guarded(
            f"u3/obstruction/exclusive/{left}/{right}",
            [-obstruction[left], -obstruction[right]],
        )
    for center_name in AUDIT_CENTER_NAMES:
        outside = []
        for index in range(n):
            witness = variable(f"u3/obstruction/{center_name}/outside/{index}")
            outside.append(witness)
            guarded(
                f"u3/obstruction/{center_name}/outside/forward/{index}",
                [-witness, supports[center_name][index], -bounded[index]],
            )
            guarded(
                f"u3/obstruction/{center_name}/outside/back_support/{index}",
                [-supports[center_name][index], bounded[index], witness],
            )
            guarded(
                f"u3/obstruction/{center_name}/outside/back_bound/{index}",
                [-bounded[index], -witness],
            )
        guarded(
            f"u3/obstruction/{center_name}/q_deleted_escape",
            [-obstruction[center_name],
             -modes[center_name]["q_deleted"], *outside],
        )
        # Selecting a critical-shell arm satisfies the existential obstruction.
        guarded(
            f"u3/obstruction/{center_name}/critical_shell_arm",
            [-obstruction[center_name], modes[center_name]["q_deleted"],
             modes[center_name]["critical_shell"]],
        )

    rows.extend(new_rows)
    mapping["variables"] = variables
    mapping["clauses"] = rows
    mapping["schema"] = f"{SCHEMA}/map/v1"
    mapping["provenance"] = {
        "v9_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "source": SOURCE,
        "source_link": "q=selected common source; p=its common blocker",
        "audit_centers": list(AUDIT_CENTER_NAMES),
        "row_modes": list(ROW_MODES),
        "classAt_encoded": False,
        "noncollinear_encoded": False,
        "metric_exact_shell_encoded": False,
        "source_total": False,
    }
    sources = {
        "schema": f"{SCHEMA}/sources/v1",
        "family_sources": {FAMILY: SOURCE},
        "v9_sources_sha256": _sha(_canon(base_sources)),
    }
    cnf_lines = [f"p cnf {len(variables)} {len(rows)}\n"]
    cnf_lines.extend(
        " ".join(str(x) for x in row["literals"]) + " 0\n" for row in rows
    )
    cnf = "".join(cnf_lines).encode()
    manifest = {
        "schema": f"{SCHEMA}/manifest/v1",
        "n": n,
        "source_total": False,
        "variables": len(variables),
        "clauses": len(rows),
        "v9_prefix_cnf_sha256": base_manifest["cnf_sha256"],
        "cnf_sha256": _sha(cnf),
        "map_sha256": _sha(_canon(mapping)),
        "sources_sha256": _sha(_canon(sources)),
        "new_clause_count": len(new_rows),
        "new_variable_count": len(variables) - len(base_map_bytes and json.loads(base_map_bytes)["variables"]),
        "classAt_encoded": False,
        "noncollinear_encoded": False,
        "metric_exact_shell_encoded": False,
        "source_total_claim": False,
    }
    return cnf, _canon(mapping), manifest, sources


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--n", type=int, default=17)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()
    args.output.mkdir(parents=True, exist_ok=True)
    cnf, mapping, manifest, sources = emit(args.n)
    (args.output / "candidate.cnf").write_bytes(cnf)
    (args.output / "candidate.map.json").write_bytes(mapping)
    (args.output / "candidate.sources.json").write_bytes(_canon(sources))
    (args.output / "candidate.manifest.json").write_bytes(_canon(manifest))
    print(json.dumps(manifest, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
