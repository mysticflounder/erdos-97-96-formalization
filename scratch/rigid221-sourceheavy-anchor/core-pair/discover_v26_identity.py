"""Discover the v26 canary formula identity without editing pins.

The canary asserts its frozen identity inside materialization.  This harness
replaces each pinned constant with a sentinel that compares equal to anything,
records what the canary actually computes, and prints it.  It writes nothing.
"""

from __future__ import annotations

from pathlib import Path

from census.card_head import exact12_next_row_arm_static_canary as canary

REPO = Path("/Users/adam/projects/math-projects/erdos-97-96-formalization")


class AnyValue:
    """Compares equal to every value, so no pinned identity check can fail."""

    def __eq__(self, other: object) -> bool:
        return True

    def __ne__(self, other: object) -> bool:
        return False

    def __hash__(self) -> int:
        return 0

    def __repr__(self) -> str:
        return "<any>"


observed: list[tuple[int, int, str]] = []
real_cnf_sha256 = canary._cnf_sha256


def recording_cnf_sha256(instance):  # type: ignore[no-untyped-def]
    digest = real_cnf_sha256(instance)
    observed.append((instance.cnf.n_variables, len(instance.cnf.clauses), digest))
    return digest


for name in (
    "EXPECTED_PREFIX_VARIABLES",
    "EXPECTED_PREFIX_CLAUSES",
    "EXPECTED_PREFIX_DIMACS_SHA256",
    "EXPECTED_POST_ARM_CLAUSES",
    "EXPECTED_POST_ARM_DIMACS_SHA256",
    "EXPECTED_FINAL_CLAUSES",
    "EXPECTED_FINAL_DIMACS_SHA256",
):
    setattr(canary, name, AnyValue())
canary._cnf_sha256 = recording_cnf_sha256

canary.materialize_arm_static_canary(REPO)

labels = ("prefix", "post_arm", "final")
for label, (variables, clauses, digest) in zip(labels, observed, strict=False):
    print(f"{label:9s} variables={variables} clauses={clauses} sha256={digest}")
if len(observed) != 3:
    print(f"WARNING: expected 3 recorded formulas, saw {len(observed)}")
