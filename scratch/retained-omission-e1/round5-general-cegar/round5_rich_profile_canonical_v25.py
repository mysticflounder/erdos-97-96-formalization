from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter, defaultdict
from datetime import UTC, datetime
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
POINTS = tuple(range(15))
APICES = (12, 13, 14)
INTERIORS = ((0, 1, 2, 3), (4, 5, 6, 7), (8, 9, 10, 11))
CLOSED_CAPS = (
    (13, 0, 1, 2, 3, 14),
    (14, 4, 5, 6, 7, 12),
    (12, 8, 9, 10, 11, 13),
)
CYCLIC_ORDER = (13, 0, 1, 2, 3, 14, 4, 5, 6, 7, 12, 8, 9, 10, 11)
CASE = {"case_id": "fresh_DDD_k0_d2_f1", "kept": 0, "deleted": 2, "fresh": 1}
SWAPPABLE_CLASS_PAIRS = (1, 2)


def canonical_sha256(value: object) -> str:
    payload = json.dumps(value, sort_keys=True, separators=(",", ":"))
    return hashlib.sha256(payload.encode()).hexdigest()


def file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def _journal_snapshot(path: Path) -> tuple[tuple[str, int, int], ...]:
    return tuple(
        (item.name, item.stat().st_size, item.stat().st_mtime_ns)
        for item in sorted(path.glob("[0-9][0-9][0-9][0-9][0-9][0-9].json"))
    )


def recover_journal(path: Path) -> dict[str, object]:
    before = _journal_snapshot(path)
    records: list[dict[str, object]] = []
    pending: dict[str, dict[str, object]] = {}
    completed: list[dict[str, object]] = []
    proposals: list[dict[str, object]] = []
    previous: str | None = None
    for expected_sequence, (name, _size, _mtime) in enumerate(before):
        record = json.loads((path / name).read_text())
        if record.get("sequence") != expected_sequence:
            raise RuntimeError(f"nonconsecutive journal record {path / name}")
        if record.get("previous_record_sha256") != previous:
            raise RuntimeError(f"journal hash chain mismatch at {path / name}")
        payload = record.get("payload")
        if record.get("payload_sha256") != canonical_sha256(payload):
            raise RuntimeError(f"journal payload hash mismatch at {path / name}")
        authenticated = {
            key: record[key]
            for key in ("sequence", "previous_record_sha256", "payload", "payload_sha256")
        }
        digest = canonical_sha256(authenticated)
        if record.get("record_sha256") != digest:
            raise RuntimeError(f"journal record hash mismatch at {path / name}")
        if not isinstance(payload, dict):
            raise TypeError(f"journal payload is not an object at {path / name}")
        assignment_sha = payload.get("assignment_sha256")
        if not isinstance(assignment_sha, str):
            raise TypeError(f"journal assignment identity missing at {path / name}")
        phase = payload.get("phase")
        if phase == "proposed":
            if assignment_sha in pending:
                raise RuntimeError(f"duplicate pending proposal in {path}")
            pending[assignment_sha] = payload
            proposals.append(payload)
        elif phase == "outcome":
            if assignment_sha not in pending:
                raise RuntimeError(f"outcome without pending proposal in {path}")
            pending.pop(assignment_sha)
            completed.append(payload)
        else:
            raise RuntimeError(f"unknown journal phase at {path / name}: {phase}")
        records.append(record)
        previous = digest
    if _journal_snapshot(path) != before:
        raise RuntimeError(f"live journal changed during authenticated read: {path}")
    return {
        "record_count": len(records),
        "proposal_count": len(proposals),
        "completed_count": len(completed),
        "pending_count": len(pending),
        "head_sha256": previous,
        "proposals": proposals,
    }


def assignment_map(payload: Mapping[str, object]) -> dict[str, bool]:
    assignment = payload.get("assignment")
    if not isinstance(assignment, list):
        raise TypeError("proposal assignment is absent")
    result: dict[str, bool] = {}
    for item in assignment:
        if not isinstance(item, dict) or not isinstance(item.get("bool"), str):
            raise TypeError("invalid assignment item")
        name = item["bool"]
        value = item.get("value")
        if not isinstance(value, bool) or name in result:
            raise TypeError("invalid or duplicate Boolean assignment")
        result[name] = value
    if canonical_sha256(assignment) != payload.get("assignment_sha256"):
        raise RuntimeError("proposal assignment hash mismatch")
    return result


Profile = tuple[tuple[tuple[int, ...], tuple[int, ...]], ...]


def rich_profile(assignment: Mapping[str, bool]) -> Profile:
    profile: list[tuple[tuple[int, ...], tuple[int, ...]]] = []
    for apex_index in range(3):
        classes = []
        for class_index in range(2):
            names = [f"rich_{apex_index}_{class_index}_{point}" for point in POINTS]
            if any(name not in assignment for name in names):
                raise RuntimeError(f"incomplete rich profile {apex_index}/{class_index}")
            classes.append(tuple(point for point, name in zip(POINTS, names) if assignment[name]))
        profile.append((classes[0], classes[1]))
    validate_profile(tuple(profile))
    return tuple(profile)


def validate_profile(profile: Profile) -> None:
    for apex_index, classes in enumerate(profile):
        if any(len(support) != 4 for support in classes):
            raise RuntimeError("DDD rich support does not have cardinality four")
        if any(APICES[apex_index] in support for support in classes):
            raise RuntimeError("rich support contains its own apex")
        if set(classes[0]) & set(classes[1]):
            raise RuntimeError("two rich classes at one apex overlap")
        interior = set(INTERIORS[apex_index])
        if any(len(set(support) & interior) != 2 for support in classes):
            raise RuntimeError("rich support does not meet its own interior twice")
        if (set(classes[0]) | set(classes[1])) & interior != interior:
            raise RuntimeError("rich classes do not partition their own interior")


def orbit(profile: Profile) -> tuple[Profile, ...]:
    members = set()
    for swap_one in (False, True):
        for swap_two in (False, True):
            mutable = list(profile)
            if swap_one:
                mutable[1] = (mutable[1][1], mutable[1][0])
            if swap_two:
                mutable[2] = (mutable[2][1], mutable[2][0])
            members.add(tuple(mutable))
    return tuple(sorted(members))


def canonical_profile(profile: Profile) -> Profile:
    return orbit(profile)[0]


def profile_record(profile: Profile) -> list[dict[str, object]]:
    return [
        {
            "apex_index": apex_index,
            "apex": APICES[apex_index],
            "classes": [list(support) for support in classes],
            "own_interior_parts": [
                sorted(set(support) & set(INTERIORS[apex_index])) for support in classes
            ],
            "outside_own_interior": [
                sorted(set(support) - set(INTERIORS[apex_index])) for support in classes
            ],
        }
        for apex_index, classes in enumerate(profile)
    ]


def point_dihedral_audit() -> dict[str, object]:
    candidates = []
    valid = []
    for orientation in (1, -1):
        for shift in range(15):
            permutation = {
                CYCLIC_ORDER[position]: CYCLIC_ORDER[(shift + orientation * position) % 15]
                for position in range(15)
            }
            candidates.append(permutation)
            if any(permutation[CASE[key]] != CASE[key] for key in ("kept", "deleted", "fresh")):
                continue
            induced = []
            for apex_index in range(3):
                image_interior = {permutation[x] for x in INTERIORS[apex_index]}
                matches = [j for j in range(3) if image_interior == set(INTERIORS[j])]
                if len(matches) != 1 or permutation[APICES[apex_index]] != APICES[matches[0]]:
                    induced = []
                    break
                induced.append(matches[0])
            if sorted(induced) != [0, 1, 2]:
                continue
            if any(
                {permutation[x] for x in CLOSED_CAPS[i]} != set(CLOSED_CAPS[induced[i]])
                for i in range(3)
            ):
                continue
            valid.append(permutation)
    return {
        "candidate_group": "dihedral actions on the exact 15-cycle",
        "candidate_count": len(candidates),
        "case_stabilizer_count": len(valid),
        "case_stabilizer": [
            [permutation[point] for point in POINTS] for permutation in valid
        ],
        "conclusion": "identity only" if len(valid) == 1 else "nontrivial stabilizer",
    }


def invariant_features(profile: Profile) -> dict[str, object]:
    pair_intersections = {}
    all_cross_intersections = []
    for left in range(3):
        for right in range(left + 1, 3):
            sizes = sorted(
                len(set(profile[left][a]) & set(profile[right][b]))
                for a in range(2) for b in range(2)
            )
            pair_intersections[f"{left}-{right}"] = sizes
            all_cross_intersections.extend(sizes)
    outside_distributions = []
    for apex_index, classes in enumerate(profile):
        rows = []
        for support in classes:
            support_set = set(support)
            rows.append({
                "interior_counts": [len(support_set & set(interior)) for interior in INTERIORS],
                "apex_count": len(support_set & set(APICES)),
            })
        outside_distributions.append(sorted(rows, key=lambda row: canonical_sha256(row)))
    return {
        "cross_apex_intersection_multisets": pair_intersections,
        "every_cross_apex_class_intersection_card_le_two": all(
            size <= 2 for size in all_cross_intersections
        ),
        "class_location_distributions": outside_distributions,
    }


def _discover_inputs() -> tuple[Path, list[tuple[str, Path]]]:
    resume = list(HERE.glob("artifacts-v19-resume1/**/assignment-journal-v19"))
    if len(resume) != 1:
        raise RuntimeError(f"expected one recovered v19 resume journal, found {len(resume)}")
    manifest_path = HERE / "artifacts-v20-production1/manifest-v20.json"
    manifest = json.loads(manifest_path.read_text())
    cube_ids = [cube["cube_id"] for cube in manifest["cubes"]]
    journals = list(HERE.glob("artifacts-v20-production1/**/assignment-journal-v19"))
    by_id: dict[str, Path] = {}
    for path in journals:
        matches = [cube_id for cube_id in cube_ids if cube_id in str(path)]
        if len(matches) != 1 or matches[0] in by_id:
            raise RuntimeError(f"cannot uniquely assign v20 journal {path}")
        by_id[matches[0]] = path
    if set(by_id) != set(cube_ids):
        raise RuntimeError("live v20 journal set does not match manifest")
    return resume[0], [(cube_id, by_id[cube_id]) for cube_id in cube_ids]


def analyze() -> dict[str, object]:
    v22_path = HERE / "v22-blocker-minimization-pilot.json"
    v22 = json.loads(v22_path.read_text())
    fixes = v22["candidate_fixes"]
    if len(fixes) != 55 or canonical_sha256(fixes) != v22["candidate_fixes_sha256"]:
        raise RuntimeError("v22 55-fix blocker authentication failed")
    fix_names = [fix["bool"] for fix in fixes]
    if len(set(fix_names)) != 55 or any(not name.startswith("rich_") for name in fix_names):
        raise RuntimeError("v22 candidate is not a distinct rich-only 55-fix blocker")
    fix_target = {fix["bool"]: fix["value"] for fix in fixes}

    resume, cubes = _discover_inputs()
    sources = [("v19-resume", resume), *cubes]
    recovered = []
    occurrences = []
    raw_formula_hashes = set()
    for source_id, path in sources:
        state = recover_journal(path)
        recovered.append({
            "source_id": source_id,
            "path": str(path.relative_to(HERE)),
            **{key: state[key] for key in (
                "record_count", "proposal_count", "completed_count", "pending_count", "head_sha256"
            )},
        })
        previous_rep = None
        for ordinal, payload in enumerate(state["proposals"]):
            assignment = assignment_map(payload)
            raw_formula_hashes.add(payload.get("frozen_full_formula_sha256"))
            profile = rich_profile(assignment)
            rep = canonical_profile(profile)
            rep_id = canonical_sha256(profile_record(rep))[:16]
            raw_id = canonical_sha256(profile_record(profile))[:16]
            mismatch = sum(assignment[name] != fix_target[name] for name in fix_names)
            occurrences.append({
                "source_id": source_id,
                "ordinal": ordinal,
                "assignment_sha256": payload["assignment_sha256"],
                "raw_id": raw_id,
                "rep_id": rep_id,
                "profile": profile,
                "rep": rep,
                "mismatch": mismatch,
                "previous_rep_id": previous_rep,
            })
            previous_rep = rep_id
    if raw_formula_hashes != {v22["raw_full_formula_sha256"]}:
        raise RuntimeError(f"journal raw-formula identities differ from v22: {raw_formula_hashes}")

    reps: dict[str, Profile] = {}
    for item in occurrences:
        reps[item["rep_id"]] = item["rep"]
    rep_rows = []
    for rep_id in sorted(reps):
        profile = reps[rep_id]
        covered = [item for item in occurrences if item["rep_id"] == rep_id]
        by_source = Counter(item["source_id"] for item in covered)
        assignments = {item["assignment_sha256"] for item in covered}
        raw_members = {item["raw_id"] for item in covered}
        rep_rows.append({
            "rep_id": rep_id,
            "orbit_size_under_valid_class_swaps": len(orbit(profile)),
            "representative": profile_record(profile),
            "coverage": {
                "proposal_occurrences": len(covered),
                "unique_complete_assignments": len(assignments),
                "observed_raw_orbit_members": len(raw_members),
                "by_source": dict(sorted(by_source.items())),
                "v22_mismatch_histogram": dict(sorted(Counter(item["mismatch"] for item in covered).items())),
            },
            "features": invariant_features(profile),
        })

    transition_counts = Counter(
        (item["previous_rep_id"], item["rep_id"])
        for item in occurrences if item["previous_rep_id"] is not None
    )
    feature_values: dict[str, Counter[str]] = defaultdict(Counter)
    for row in rep_rows:
        for key, value in row["features"].items():
            feature_values[key][json.dumps(value, sort_keys=True, separators=(",", ":"))] += 1
    feature_summary = {
        key: {
            "distinct_value_count": len(values),
            "common_to_all_representatives": len(values) == 1,
            "values": [{"value": json.loads(value), "representative_count": count} for value, count in values.items()],
        }
        for key, values in sorted(feature_values.items())
    }

    source_summary = []
    for source in recovered:
        source_items = [item for item in occurrences if item["source_id"] == source["source_id"]]
        source_summary.append({
            **source,
            "distinct_full_raw_profiles": len({item["raw_id"] for item in source_items}),
            "distinct_canonical_orbits": len({item["rep_id"] for item in source_items}),
            "v22_mismatch_histogram": dict(sorted(Counter(item["mismatch"] for item in source_items).items())),
            "transition_count": max(0, len(source_items) - 1),
            "orbit_self_transition_count": sum(
                item["previous_rep_id"] == item["rep_id"] for item in source_items if item["previous_rep_id"] is not None
            ),
        })

    return {
        "schema_version": 25,
        "kind": "v25-rich-profile-canonicalization-analysis",
        "snapshot_completed_utc": datetime.now(UTC).isoformat(),
        "production_launched": False,
        "solver_invoked": False,
        "lean_invoked": False,
        "case": CASE,
        "trust_boundary": "authenticated external journal evidence and source-level symmetry audit; no solver replay, Lean theorem, or kernel ingress",
        "v22_blocker": {
            "path": v22_path.name,
            "file_sha256": file_sha256(v22_path),
            "fix_count": len(fixes),
            "candidate_fixes_sha256": v22["candidate_fixes_sha256"],
            "raw_full_formula_sha256": v22["raw_full_formula_sha256"],
            "coordinate_scope": "asymmetric 55-variable projection only; canonicalization uses all 90 rich support bits",
        },
        "symmetry_audit": {
            "point_labels": point_dihedral_audit(),
            "class_labels": {
                "group": "independent class swaps at apex indices 1 and 2",
                "group_order": 4,
                "apex_index_0_swap_excluded": "normal form names rich[0,0] as first_frontier",
                "v22_projection_not_group_invariant": True,
            },
        },
        "coverage": {
            "source_count": len(sources),
            "proposal_occurrences": len(occurrences),
            "unique_complete_assignments": len({item["assignment_sha256"] for item in occurrences}),
            "distinct_full_raw_profiles": len({item["raw_id"] for item in occurrences}),
            "distinct_canonical_orbits": len(reps),
            "v22_mismatch_histogram": dict(sorted(Counter(item["mismatch"] for item in occurrences).items())),
            "sources": source_summary,
        },
        "transitions": {
            "directed_orbit_transitions": [
                {"from": left, "to": right, "count": count}
                for (left, right), count in sorted(transition_counts.items())
            ],
            "total": sum(transition_counts.values()),
            "self": sum(count for (left, right), count in transition_counts.items() if left == right),
            "changed": sum(count for (left, right), count in transition_counts.items() if left != right),
        },
        "common_pattern_tests": feature_summary,
        "orbit_representatives": rep_rows,
    }


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", type=Path, default=HERE / "v25-rich-profile-canonicalization.json")
    args = parser.parse_args(argv)
    result = analyze()
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(json.dumps({
        "output": str(args.output),
        "proposals": result["coverage"]["proposal_occurrences"],
        "raw_profiles": result["coverage"]["distinct_full_raw_profiles"],
        "orbits": result["coverage"]["distinct_canonical_orbits"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
