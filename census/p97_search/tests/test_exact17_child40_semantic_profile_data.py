from __future__ import annotations

from pathlib import Path

from census.p97_search.cegar_wave_semantic_profiles import parse_profile_bytes

PROFILE_PATH = (
    Path(__file__).parents[1]
    / "waves"
    / "exact17"
    / "child40"
    / "semantic-profile.json"
)


def test_child40_declarative_profile_is_canonical_and_retained() -> None:
    profile = parse_profile_bytes(PROFILE_PATH.read_bytes())
    assert profile.validator == "exact17-child40"
    assert profile.control == {
        "clauses": 5_847_584,
        "cnf_sha256": "555d1d2facedc1cc3ea7a5bae31649b55e65fc2d14e8ad6e0742a023f9969034",
        "domain_kind": "STATIC_CNF",
        "query_polarity": "SAT_MEANS_COUNTEREXAMPLE",
        "variables": 308,
    }
    assert profile.payload["cleanup"] == {
        "cleanup_eligible": False,
        "lifecycle": "RETAIN",
    }
    assert profile.payload["contract"]["parent"] == {
        "clauses": 5_847_388,
        "sha256": "989348e8a0d2288df6a80f36e56ed4e5771ef250dc10f4d4aeeb991a571a8a8a",
        "variables": 308,
    }
    assert profile.payload["contract"]["ordered_suffix_sha256"] == (
        "e34111b179caf00ed0e04c3f28d17fd670d7a2291a9761a09f0d6984bdf19be5"
    )
    assert profile.payload["contract"]["artifact_roles"] == [
        "child_cnf",
        "daemon_build_receipt",
        "export_receipt",
        "ingress_manifest",
        "lean_export",
        "lean_root",
        "model",
        "parent_cnf",
        "parent_manifest",
    ]
