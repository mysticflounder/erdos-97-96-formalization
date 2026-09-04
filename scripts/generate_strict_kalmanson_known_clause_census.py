"""Census source-backed strict-Kalmanson blocking-clause families.

The output is bookkeeping for clauses justified by checked Lean sources.  It
does not reconstruct, authenticate, or decompose the missing announced n=11
base bank.
"""

from __future__ import annotations

import argparse
import hashlib
import itertools
import json
import re
from collections.abc import Iterable
from dataclasses import dataclass
from pathlib import Path
from typing import Final

Atom = tuple[int, int]
Clause = tuple[Atom, ...]
Equality = tuple[int, int, int]
EqualityPattern = tuple[Equality, ...]

REPO_ROOT: Final = Path(__file__).resolve().parents[1]
THREE_EQUALITY_SOURCE: Final = Path(
    "lean/Erdos9796Proof/P97/ATail/KalmansonThreeEqualitySchemas.lean"
)
SHARED_PAIR_SOURCE: Final = Path(
    "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean"
)
COMPLEMENTARY_ARC_SOURCE: Final = Path(
    "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/"
    "ComplementaryArcSelectedRowEqualityChain.lean"
)
THREE_SHELL_CLASSIFICATION_DOC: Final = Path(
    "docs/rigid221-three-shell-classification-2026-08-06.md"
)
THREE_SHELL_CLASSIFICATION_JSON: Final = Path(
    "scratch/rigid221-blockerv-exact17-20260806/"
    "three-shell-classification-n6.json"
)
THREE_SHELL_CLASSIFICATION_JSON_SHA256: Final = (
    "7a8bd4b51649a54c76d049e7edb7e8c77beeab575c3f7d31f0dbf328a702909f"
)
THREE_SHELL_CLASSIFICATION_JSON_BYTES: Final = 7_337
RETAINED_N11_SURVIVOR: Final = Path(
    "certificates/p97_strict_kalmanson_n11_survivor.json"
)
ANNOUNCED_N11_BASE_COUNT: Final = 42_504
SCHEMA_VERSION: Final = "p97-strict-kalmanson-known-clause-census/v1"
COMPLEMENTARY_ARC_THEOREM: Final = (
    "Problem97.ComplementaryArcSelectedRowEqualityChain."
    "false_of_complementaryArc_selectedRowEqualityChain"
)

ARITY_BY_WORD: Final = {"four": 4, "five": 5, "six": 6}
THREE_EQUALITY_NAME_RE: Final = re.compile(
    r"^theorem\s+"
    r"(?P<name>false_of_(?P<arity>four|five|six)_ccw_three_shell_equalities_"
    r"(?P<first>[0-9]{3})_(?P<second>[0-9]{3})_(?P<third>[0-9]{3})"
    r"(?P<cyclic>_cyclicShift)?)\b",
    re.MULTILINE,
)

SHARED_PAIR_PATTERNS: Final[tuple[Clause, ...]] = (
    ((0, 2), (0, 3), (1, 2), (1, 3)),
    ((0, 1), (0, 2), (3, 1), (3, 2)),
    ((1, 0), (1, 3), (2, 0), (2, 3)),
    ((2, 0), (2, 1), (3, 0), (3, 1)),
)
SHARED_PAIR_THEOREMS: Final[tuple[str, ...]] = (
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_two_selected_rows_shared_late_pair"
    ),
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_four_ccw_endpoint_centers_bisect_middle_pair"
    ),
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_four_ccw_middle_centers_bisect_endpoint_pair"
    ),
    (
        "Problem97.CapCrossingKalmansonBridge."
        "false_of_four_ccw_late_centers_bisect_early_pair"
    ),
)


@dataclass(frozen=True, order=True)
class ThreeEqualitySchema:
    """One theorem-name-encoded three-equality schema."""

    name: str
    arity: int
    equalities: tuple[str, str, str]
    atoms: Clause


def canonical_clause(atoms: Iterable[Atom]) -> Clause:
    """Return a sorted, duplicate-free tuple of directed membership atoms."""

    return tuple(sorted(set(atoms)))


def _source_path(path: Path) -> Path:
    return path if path.is_absolute() else REPO_ROOT / path


def parse_three_equality_schemas(
    source: Path = THREE_EQUALITY_SOURCE,
) -> tuple[ThreeEqualitySchema, ...]:
    """Parse the non-duplicate schemas encoded in Lean theorem names."""

    text = _source_path(source).read_text(encoding="utf-8")
    schemas: list[ThreeEqualitySchema] = []
    for match in THREE_EQUALITY_NAME_RE.finditer(text):
        if match.group("cyclic"):
            continue
        arity = ARITY_BY_WORD[match.group("arity")]
        equalities = (
            match.group("first"),
            match.group("second"),
            match.group("third"),
        )
        atoms = canonical_clause(
            (int(code[0]), int(endpoint))
            for code in equalities
            for endpoint in code[1:]
        )
        if any(code[0] in code[1:] or code[1] == code[2] for code in equalities):
            raise ValueError(f"schema {match.group('name')} has a degenerate equality")
        if any(label >= arity for atom in atoms for label in atom):
            raise ValueError(f"schema {match.group('name')} exceeds declared arity")
        if {label for atom in atoms for label in atom} != set(range(arity)):
            raise ValueError(f"schema {match.group('name')} does not use its true arity")
        schemas.append(
            ThreeEqualitySchema(match.group("name"), arity, equalities, atoms)
        )

    names = [schema.name for schema in schemas]
    if len(names) != len(set(names)):
        raise ValueError("duplicate non-cyclic theorem names in schema source")
    return tuple(schemas)


def instantiate_schema(schema: ThreeEqualitySchema, labels: tuple[int, ...]) -> Clause:
    """Map ordered schema roles to one increasing tuple of actual labels."""

    if len(labels) != schema.arity or tuple(sorted(labels)) != labels:
        raise ValueError("schema labels must be a strictly increasing arity-tuple")
    if len(set(labels)) != len(labels):
        raise ValueError("schema labels must be distinct")
    return canonical_clause((labels[a], labels[b]) for a, b in schema.atoms)


def three_equality_clauses(
    n: int, schemas: tuple[ThreeEqualitySchema, ...] | None = None
) -> list[Clause]:
    """Instantiate every source schema over every increasing role assignment."""

    _validate_n(n)
    inventory = parse_three_equality_schemas() if schemas is None else schemas
    return [
        instantiate_schema(schema, labels)
        for schema in inventory
        for labels in itertools.combinations(range(n), schema.arity)
    ]


def canonical_equality(center: int, first: int, second: int) -> Equality:
    """Canonicalize one same-center equality by sorting its target pair."""

    low, high = sorted((first, second))
    return center, low, high


def canonical_equality_pattern(equalities: Iterable[Equality]) -> EqualityPattern:
    """Canonicalize a set of same-center equalities."""

    return tuple(sorted(set(equalities)))


def schema_equality_pattern(schema: ThreeEqualitySchema) -> EqualityPattern:
    """Decode a theorem-name schema as unordered-target equality triples."""

    return canonical_equality_pattern(
        canonical_equality(int(code[0]), int(code[1]), int(code[2]))
        for code in schema.equalities
    )


def rotate_equality_pattern(pattern: EqualityPattern, offset: int) -> EqualityPattern:
    """Apply the orientation-preserving cyclic shift i -> i+offset modulo 6."""

    return canonical_equality_pattern(
        canonical_equality(
            (center + offset) % 6,
            (first + offset) % 6,
            (second + offset) % 6,
        )
        for center, first, second in pattern
    )


def complete_berge_patterns(
    schemas: tuple[ThreeEqualitySchema, ...] | None = None,
) -> tuple[EqualityPattern, ...]:
    """Close the 19 six-role Lean schemas under cyclic shifts modulo six."""

    inventory = parse_three_equality_schemas() if schemas is None else schemas
    patterns = {
        rotate_equality_pattern(schema_equality_pattern(schema), offset)
        for schema in inventory
        if schema.arity == 6
        for offset in range(6)
    }
    return tuple(sorted(patterns))


def classification_complete_berge_patterns(
    source: Path = THREE_SHELL_CLASSIFICATION_JSON,
) -> tuple[EqualityPattern, ...]:
    """Load and canonicalize the exact classifier's 40 six-role patterns."""

    raw = _source_path(source).read_bytes()
    actual_sha256 = hashlib.sha256(raw).hexdigest()
    if actual_sha256 != THREE_SHELL_CLASSIFICATION_JSON_SHA256:
        raise ValueError(
            "classification JSON SHA-256 mismatch: "
            f"expected {THREE_SHELL_CLASSIFICATION_JSON_SHA256}, "
            f"got {actual_sha256}"
        )
    if len(raw) != THREE_SHELL_CLASSIFICATION_JSON_BYTES:
        raise ValueError(
            "classification JSON byte-count mismatch: "
            f"expected {THREE_SHELL_CLASSIFICATION_JSON_BYTES}, got {len(raw)}"
        )
    payload = json.loads(raw.decode("utf-8"))
    patterns = tuple(
        sorted(
            {
                canonical_equality_pattern(
                    canonical_equality(center, first, second)
                    for center, first, second in raw_pattern
                )
                for raw_pattern in payload["irreducible_unsat_patterns"]
            }
        )
    )
    if payload["irreducible_unsat_count_in_shard"] != len(patterns):
        raise ValueError("classification count does not match its distinct patterns")
    return patterns


def complete_berge_rotation_orbits(
    patterns: tuple[EqualityPattern, ...] | None = None,
) -> tuple[tuple[EqualityPattern, ...], ...]:
    """Partition the semantic complete-Berge patterns into cyclic orbits."""

    remaining = set(complete_berge_patterns() if patterns is None else patterns)
    orbits: list[tuple[EqualityPattern, ...]] = []
    while remaining:
        seed = min(remaining)
        orbit = tuple(sorted({rotate_equality_pattern(seed, t) for t in range(6)}))
        if not set(orbit) <= remaining:
            raise ValueError("pattern collection is not closed under cyclic shifts")
        remaining.difference_update(orbit)
        orbits.append(orbit)
    return tuple(orbits)


def equality_pattern_clause(pattern: EqualityPattern) -> Clause:
    """Translate equality triples to their required directed memberships."""

    return canonical_clause(
        (center, target)
        for center, first, second in pattern
        for target in (first, second)
    )


def instantiate_complete_berge_pattern(
    pattern: EqualityPattern, labels: tuple[int, ...]
) -> Clause:
    """Instantiate a six-role pattern on one increasing six-subset."""

    if len(labels) != 6 or tuple(sorted(labels)) != labels or len(set(labels)) != 6:
        raise ValueError("complete-Berge labels must be a strictly increasing six-tuple")
    return canonical_clause(
        (labels[center], labels[target])
        for center, target in equality_pattern_clause(pattern)
    )


def complete_berge_clauses(
    n: int, patterns: tuple[EqualityPattern, ...] | None = None
) -> list[Clause]:
    """Instantiate each semantic complete-Berge pattern on each six-subset."""

    _validate_n(n)
    inventory = complete_berge_patterns() if patterns is None else patterns
    return [
        instantiate_complete_berge_pattern(pattern, labels)
        for labels in itertools.combinations(range(n), 6)
        for pattern in inventory
    ]


def shared_pair_clauses(n: int) -> list[Clause]:
    """Instantiate the four canonical shared-pair obstructions on quadruples."""

    _validate_n(n)
    return [
        canonical_clause((labels[a], labels[b]) for a, b in pattern)
        for labels in itertools.combinations(range(n), 4)
        for pattern in SHARED_PAIR_PATTERNS
    ]


def complementary_arc_template(n: int, r: int) -> Clause:
    """Return the canonical complementary-arc atom set M(n,r), for r=2 or 3."""

    _validate_n(n)
    if r not in (2, 3):
        raise ValueError("the source-backed census uses only r=2 and r=3")
    atoms: set[Atom] = {
        (0, r),
        (0, n - 1),
        (1, 0),
        (1, r + 1),
        (n - 1, 0),
        (n - 1, n - 2),
    }
    for k in range(r + 1, n - 1):
        atoms.add((k, k - 1))
        atoms.add((k, k + 1))
    return canonical_clause(atoms)


def transform_clause(clause: Clause, n: int, *, offset: int, reflect: bool) -> Clause:
    """Apply g(i)=i+offset or g(i)=offset-i modulo n to both atom labels."""

    def image(label: int) -> int:
        return (offset - label if reflect else label + offset) % n

    return canonical_clause((image(center), image(member)) for center, member in clause)


def complementary_arc_orbit(n: int, r: int) -> dict[str, list[Clause]]:
    """Return rotations and reflections as separately labelled orbit slices."""

    template = complementary_arc_template(n, r)
    return {
        "rotations": [
            transform_clause(template, n, offset=offset, reflect=False)
            for offset in range(n)
        ],
        "reflections": [
            transform_clause(template, n, offset=offset, reflect=True)
            for offset in range(n)
        ],
    }


def complementary_arc_clauses(n: int) -> list[Clause]:
    """Return the r=2,3 rotation and reflection bookkeeping clauses."""

    clauses: list[Clause] = []
    for r in (2, 3):
        orbit = complementary_arc_orbit(n, r)
        clauses.extend(orbit["rotations"])
        clauses.extend(orbit["reflections"])
    return clauses


def clause_is_present(clause: Clause, rows: list[list[int]]) -> bool:
    """Test whether every directed atom in a no-good occurs in the row table."""

    present = {
        (center, member)
        for center, members in enumerate(rows)
        for member in members
    }
    return set(clause) <= present


def matched_clauses(clauses: set[Clause], rows: list[list[int]]) -> list[Clause]:
    """Return known clauses wholly present in a row assignment."""

    return sorted(clause for clause in clauses if clause_is_present(clause, rows))


def _family_summary(raw: list[Clause], claim_scope: str, source: Path) -> dict[str, object]:
    distinct = set(raw)
    return {
        "claim_scope": claim_scope,
        "source_path": str(source),
        "raw_count": len(raw),
        "distinct_count": len(distinct),
        "within_family_duplicate_count": len(raw) - len(distinct),
    }


def _schema_record(schema: ThreeEqualitySchema) -> dict[str, object]:
    return {
        "name": schema.name,
        "arity": schema.arity,
        "equalities": list(schema.equalities),
        "atoms_by_role": [list(atom) for atom in schema.atoms],
    }


def build_census(n: int = 11) -> dict[str, object]:
    """Build a JSON-ready census of the four locally source-backed families."""

    _validate_n(n)
    schemas = parse_three_equality_schemas()
    schema_raw = three_equality_clauses(n, schemas)
    berge_patterns = complete_berge_patterns(schemas)
    classifier_patterns = classification_complete_berge_patterns()
    if berge_patterns != classifier_patterns:
        raise ValueError(
            "cyclic closure of six-role Lean schemas disagrees with classifier JSON"
        )
    berge_orbits = complete_berge_rotation_orbits(berge_patterns)
    berge_raw = complete_berge_clauses(n, berge_patterns)
    shared_raw = shared_pair_clauses(n)
    arc_raw = complementary_arc_clauses(n)
    family_sets = {
        "three_equality_schemas": set(schema_raw),
        "complete_berge": set(berge_raw),
        "shared_pair_nonalternation": set(shared_raw),
        "complementary_arc": set(arc_raw),
    }
    union = set().union(*family_sets.values())
    pairs = list(itertools.combinations(family_sets, 2))
    pairwise_overlaps = {
        f"{left}__{right}": len(family_sets[left] & family_sets[right])
        for left, right in pairs
    }
    schema_by_arity = {
        str(arity): sum(schema.arity == arity for schema in schemas)
        for arity in (4, 5, 6)
    }
    arc_orbits: dict[str, object] = {}
    for r in (2, 3):
        orbit = complementary_arc_orbit(n, r)
        all_orbit = orbit["rotations"] + orbit["reflections"]
        arc_orbits[str(r)] = {
            "template_atoms": [list(atom) for atom in complementary_arc_template(n, r)],
            "template_atom_count": len(complementary_arc_template(n, r)),
            "rotation_raw_count": len(orbit["rotations"]),
            "rotation_distinct_count": len(set(orbit["rotations"])),
            "rotation_claim_scope": (
                "theorem-backed bookkeeping via the generic complementary-arc "
                "selected-row equality-chain theorem"
            ),
            "reflection_raw_count": len(orbit["reflections"]),
            "reflection_distinct_count": len(set(orbit["reflections"])),
            "reflection_claim_scope": (
                "bookkeeping only; requires an orientation-reversal adapter and "
                "is not promoted proof coverage"
            ),
            "combined_distinct_count": len(set(all_orbit)),
        }

    families = {
        "three_equality_schemas": {
            **_family_summary(
                schema_raw,
                (
                    "all non-cyclicShift theorem-name schemas in the cited source; "
                    "this family is not labelled complete Berge"
                ),
                THREE_EQUALITY_SOURCE,
            ),
            "schema_count": len(schemas),
            "schema_count_by_arity": schema_by_arity,
            "expected_raw_count_formula": "4*C(n,4)+17*C(n,5)+19*C(n,6)",
            "inventory": [_schema_record(schema) for schema in schemas],
        },
        "complete_berge": {
            **_family_summary(
                berge_raw,
                (
                    "authenticated semantic family of 40 full-support six-role "
                    "equality patterns; primitive producer encoding and original "
                    "bank serialization remain unauthenticated"
                ),
                THREE_EQUALITY_SOURCE,
            ),
            "pattern_count": len(berge_patterns),
            "rotation_orbit_count": len(berge_orbits),
            "rotation_orbit_sizes": [len(orbit) for orbit in berge_orbits],
            "rotation_orbit_representatives": [
                [list(equality) for equality in orbit[0]] for orbit in berge_orbits
            ],
            "expected_raw_count_formula": "40*C(n,6)",
            "classification_document_path": str(THREE_SHELL_CLASSIFICATION_DOC),
            "classification_json_path": str(THREE_SHELL_CLASSIFICATION_JSON),
            "classification_json_sha256": THREE_SHELL_CLASSIFICATION_JSON_SHA256,
            "classification_json_bytes": THREE_SHELL_CLASSIFICATION_JSON_BYTES,
            "provenance_scope": (
                "Lean cyclic-shift closure agrees exactly with the classifier's "
                "canonical semantic equality patterns; this does not recover the "
                "missing bank's primitive encoding or byte serialization"
            ),
            "patterns_by_role": [
                [list(equality) for equality in pattern] for pattern in berge_patterns
            ],
        },
        "shared_pair_nonalternation": {
            **_family_summary(
                shared_raw,
                "four checked increasing-quadruple shared-pair patterns",
                SHARED_PAIR_SOURCE,
            ),
            "patterns_by_role": [
                [list(atom) for atom in pattern] for pattern in SHARED_PAIR_PATTERNS
            ],
            "source_theorems_by_pattern": list(SHARED_PAIR_THEOREMS),
        },
        "complementary_arc": {
            **_family_summary(
                arc_raw,
                (
                    "r=2,3 cyclic rotations are generic-theorem bookkeeping; "
                    "reflections remain adapter-required bookkeeping"
                ),
                COMPLEMENTARY_ARC_SOURCE,
            ),
            "orbits": arc_orbits,
            "source_theorem": COMPLEMENTARY_ARC_THEOREM,
        },
    }
    baseline_family_sets = {
        "complete_berge": family_sets["complete_berge"],
        "shared_pair_nonalternation": family_sets["shared_pair_nonalternation"],
        "complementary_arc": family_sets["complementary_arc"],
    }
    baseline_union = set().union(*baseline_family_sets.values())
    baseline_raw_count = sum(len(clauses) for clauses in baseline_family_sets.values())
    baseline_ledger: dict[str, object] = {
        "family_distinct_counts": {
            name: len(clauses) for name, clauses in baseline_family_sets.items()
        },
        "raw_count": baseline_raw_count,
        "distinct_count": len(baseline_union),
        "known_overlap_count": baseline_raw_count - len(baseline_union),
        "claim_scope": (
            "reconstructs the semantic patterns and counts of the complete-Berge, "
            "shared-pair nonalternation, and complementary-arc baseline families; "
            "it does not recover the original primitive encoding, byte order, or "
            "reflected-arc Lean transport"
        ),
    }
    if n == 11:
        baseline_ledger["announced_count"] = ANNOUNCED_N11_BASE_COUNT
        baseline_ledger["arithmetic_remainder"] = (
            ANNOUNCED_N11_BASE_COUNT - len(baseline_union)
        )

    survivor: dict[str, object] | None = None
    if n == 11 and _source_path(RETAINED_N11_SURVIVOR).is_file():
        payload = json.loads(
            _source_path(RETAINED_N11_SURVIVOR).read_text(encoding="utf-8")
        )
        hits = matched_clauses(union, payload["rows"])
        survivor = {
            "source_path": str(RETAINED_N11_SURVIVOR),
            "matched_known_clause_count": len(hits),
            "matched_known_clauses": [
                [list(atom) for atom in clause] for clause in hits
            ],
        }

    result: dict[str, object] = {
        "schema": SCHEMA_VERSION,
        "n": n,
        "atom_semantics": "directed membership pair [center,member]",
        "claim_scope": (
            "source-backed clause census only; no solver was invoked and no "
            "UNSAT conclusion is made"
        ),
        "missing_base_provenance": (
            "This census is NOT authenticated as a subset or decomposition of "
            "the missing announced base bank."
        ),
        "families": families,
        "announced_baseline_semantic_reconstruction": baseline_ledger,
        "union": {
            "raw_count": (
                len(schema_raw) + len(berge_raw) + len(shared_raw) + len(arc_raw)
            ),
            "distinct_count": len(union),
            "known_overlap_count": (
                len(schema_raw)
                + len(berge_raw)
                + len(shared_raw)
                + len(arc_raw)
                - len(union)
            ),
            "pairwise_overlap_counts": pairwise_overlaps,
            "claim_scope": (
                "expanded distinct union of all four census families; it is not "
                "authenticated as contained in or as a decomposition of the "
                "missing announced base bank"
            ),
        },
        "retained_survivor": survivor,
    }
    if n == 11:
        result["announced_n11_base_comparison"] = {
            "announced_count": ANNOUNCED_N11_BASE_COUNT,
            "known_union_count": len(union),
            "arithmetic_difference": ANNOUNCED_N11_BASE_COUNT - len(union),
            "claim_scope": (
                "arithmetic comparison only; it does not assert containment, "
                "completeness, or a decomposition of the missing bank"
            ),
        }
    return result


def compact_census_summary(census: dict[str, object]) -> dict[str, object]:
    """Remove pattern inventories while retaining the audit-relevant aggregate."""

    families = census["families"]
    assert isinstance(families, dict)
    mixed = families["three_equality_schemas"]
    berge = families["complete_berge"]
    shared = families["shared_pair_nonalternation"]
    arc = families["complementary_arc"]
    assert all(isinstance(family, dict) for family in (mixed, berge, shared, arc))

    def common(family: dict[str, object]) -> dict[str, object]:
        return {
            key: family[key]
            for key in (
                "source_path",
                "claim_scope",
                "raw_count",
                "distinct_count",
                "within_family_duplicate_count",
            )
        }

    compact_families = {
        "three_equality_schemas": {
            **common(mixed),
            "schema_count": mixed["schema_count"],
            "schema_count_by_arity": mixed["schema_count_by_arity"],
            "expected_raw_count_formula": mixed["expected_raw_count_formula"],
        },
        "complete_berge": {
            **common(berge),
            "pattern_count": berge["pattern_count"],
            "rotation_orbit_count": berge["rotation_orbit_count"],
            "rotation_orbit_sizes": berge["rotation_orbit_sizes"],
            "expected_raw_count_formula": berge["expected_raw_count_formula"],
            "classification_document_path": berge["classification_document_path"],
            "classification_json_path": berge["classification_json_path"],
            "classification_json_sha256": berge["classification_json_sha256"],
            "classification_json_bytes": berge["classification_json_bytes"],
            "provenance_scope": berge["provenance_scope"],
        },
        "shared_pair_nonalternation": common(shared),
        "complementary_arc": {
            **common(arc),
            "source_theorem": arc["source_theorem"],
            "orbits": {
                r: {
                    key: orbit[key]
                    for key in (
                        "template_atom_count",
                        "rotation_raw_count",
                        "rotation_distinct_count",
                        "rotation_claim_scope",
                        "reflection_raw_count",
                        "reflection_distinct_count",
                        "reflection_claim_scope",
                        "combined_distinct_count",
                    )
                }
                for r, orbit in arc["orbits"].items()
            },
        },
    }
    survivor = census["retained_survivor"]
    compact_survivor = None
    if survivor is not None:
        assert isinstance(survivor, dict)
        compact_survivor = {
            "source_path": survivor["source_path"],
            "matched_known_clause_count": survivor["matched_known_clause_count"],
        }
    summary = {
        key: census[key]
        for key in (
            "schema",
            "n",
            "atom_semantics",
            "claim_scope",
            "missing_base_provenance",
            "announced_baseline_semantic_reconstruction",
            "union",
        )
    }
    summary["families"] = compact_families
    summary["retained_survivor"] = compact_survivor
    if "announced_n11_base_comparison" in census:
        summary["announced_n11_base_comparison"] = census[
            "announced_n11_base_comparison"
        ]
    return summary


def _validate_n(n: int) -> None:
    if isinstance(n, bool) or not isinstance(n, int) or n < 6:
        raise ValueError("n must be an integer at least 6")


def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n", type=int, default=11, help="vertex count (default: 11)")
    args = parser.parse_args()
    print(
        json.dumps(
            compact_census_summary(build_census(args.n)),
            sort_keys=True,
            separators=(",", ":"),
        )
    )


if __name__ == "__main__":
    main()
