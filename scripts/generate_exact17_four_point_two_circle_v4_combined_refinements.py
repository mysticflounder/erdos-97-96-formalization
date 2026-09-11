# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Publish the authenticated combined exact-17 v4 refinement successor.

The production suffix keeps the 236-clause two-Kalmanson bank and appends the
disjoint eight-clause other-core bank.  The eight FourPoint-core clauses are
already present in the two-Kalmanson bank, so this coordinator proves their
containment instead of appending them a second time.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import os
import sys
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

REPO = Path(__file__).resolve().parents[1]
SCRIPTS = REPO / "scripts"
LEAN_DIR = REPO / "lean/Erdos9796Proof/P97/ATail"
LEDGER = (
    REPO / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "refinements-sat-portfolio-v4-20260822/sat-profile-portfolio-v4/artifacts/"
    "candidate-ledger.json"
)
PARENT_BASELINE_CNF = (
    REPO / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
    "preparer-20260822/preparation-v1/artifacts/cells/"
    "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "next-center-02-physical-none/"
    "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
    "next-center-02-physical-none.cnf"
)
LEAN_OUTPUT = (
    LEAN_DIR
    / "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements.lean"
)

LEDGER_SHA256 = "a3f7e3b098e13831684d8c219d0d4e632ff9a1196f5d875e3f1b893f25ffc828"
PARENT_BASELINE_CNF_SHA256 = (
    "24415eae34594b8256f0254fd65793ab32d62909edd84ba85ec09375dab6b59f"
)
PARENT_BASELINE_CNF_BYTES = 346_288_246
PARENT_BASELINE_NUM_VARIABLES = 308
PARENT_BASELINE_TOTAL_CLAUSES = 7_409_522
PARENT_ROOT_CLAUSES = 7_409_516
TWO_K_SUFFIX_CLAUSES = 236
OTHER_CORE_SUFFIX_CLAUSES = 8
FOURPOINT_CORE_CLAUSES = 8
PRODUCTION_SUFFIX_CLAUSES = 244
PRODUCTION_ROOT_CLAUSES = 7_409_760

EXPECTED_CROSS_FAMILY_INTERSECTIONS = {
    "fourpoint_core_and_two_k": 8,
    "fourpoint_core_and_other_core": 0,
    "two_k_and_other_core": 0,
}
EXPECTED_PARENT_EXACT_DUPLICATE_CLAUSES = 0
EXPECTED_PARENT_STRICTLY_SUBSUMED_CLAUSES = 61
EXPECTED_PARENT_STRICT_NEW_CLAUSES = 183
EXPECTED_PARENT_NOVELTY_SHA256 = (
    "4c523553875cf0da883c052e4d286eb24a8448cf2da18fc83e3c94ffcb228997"
)
EXPECTED_LEAN_SHA256 = (
    "37c3700e004b922add7f581cc8c35f6d99586db90632d9e1a03a509786df3086"
)

TWO_K_GENERATOR = (
    SCRIPTS / "generate_exact17_four_point_two_circle_v4_two_kalmanson_refinements.py"
)
OTHER_CORE_GENERATOR = (
    SCRIPTS / "generate_exact17_four_point_two_circle_v4_other_core_refinements.py"
)
FOURPOINT_CORE_GENERATOR = (
    SCRIPTS / "generate_exact17_four_point_two_circle_v4_candidate_refinements.py"
)
TWO_K_LEAN = (
    LEAN_DIR
    / "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements.lean"
)
OTHER_CORE_LEAN = (
    LEAN_DIR
    / "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements.lean"
)
FOURPOINT_CORE_LEAN = (
    LEAN_DIR
    / "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements.lean"
)

EXPECTED_DEPENDENCY_SHA256 = {
    TWO_K_GENERATOR: "1d59e36ef60200faf63d8a20b3fcd2b75911936fac2b7bd89eeac785ebaf893d",
    OTHER_CORE_GENERATOR: "0d10de8f5552364b0d12eeb1ef00f79f294af1d7181306b4b51ba4f763b83701",
    FOURPOINT_CORE_GENERATOR: "7e8b1f39c2c2d31d7c923a5a401e2562511ef434561413682ba9b1cd47bd71eb",
    TWO_K_LEAN: "65c3e6f5a511182ab03dc14fdcfdf7a9bd0491b1c8082b7688e466f0626703f9",
    OTHER_CORE_LEAN: "e32d32c730e18d72c3f28327a3978b3afbca3d537221104b163aaa5dcfd89800",
    FOURPOINT_CORE_LEAN: "c444dc3d27547b74f6a72879fa4a502f05cefc2357d05a7975dedcc21121dc68",
}


class PromotionError(ValueError):
    """The combined successor inputs or novelty census drifted."""


def sha256_bytes(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode()


def _load_module(name: str, path: Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise PromotionError(f"cannot load authenticated dependency {path.name}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def authenticate_dependencies() -> None:
    for path, expected_sha256 in EXPECTED_DEPENDENCY_SHA256.items():
        if not path.is_file() or path.is_symlink():
            raise PromotionError(
                f"authenticated dependency is unavailable: {path.name}"
            )
        if sha256_bytes(path.read_bytes()) != expected_sha256:
            raise PromotionError(f"authenticated dependency hash drifted: {path.name}")


authenticate_dependencies()
TWO_K = _load_module("exact17_v4_combined_two_k", TWO_K_GENERATOR)
OTHER_CORE = _load_module("exact17_v4_combined_other_core", OTHER_CORE_GENERATOR)
FOURPOINT_CORE = _load_module(
    "exact17_v4_combined_fourpoint_core", FOURPOINT_CORE_GENERATOR
)


@dataclass(frozen=True)
class CombinedInputs:
    two_k_suffix: tuple[tuple[int, ...], ...]
    other_core_suffix: tuple[tuple[int, ...], ...]
    fourpoint_core_suffix: tuple[tuple[int, ...], ...]
    production_suffix: tuple[tuple[int, ...], ...]


@dataclass(frozen=True)
class ParentNovelty:
    exact_duplicate_multiplicities: tuple[int, ...]
    strict_subsumer_multiplicities: tuple[int, ...]

    @property
    def exact_duplicate_clause_count(self) -> int:
        return sum(count > 0 for count in self.exact_duplicate_multiplicities)

    @property
    def strictly_subsumed_clause_count(self) -> int:
        return sum(count > 0 for count in self.strict_subsumer_multiplicities)

    @property
    def strict_new_clause_count(self) -> int:
        return sum(
            exact == 0 and strict == 0
            for exact, strict in zip(
                self.exact_duplicate_multiplicities,
                self.strict_subsumer_multiplicities,
                strict=True,
            )
        )

    @property
    def census_sha256(self) -> str:
        return sha256_bytes(
            canonical_json_bytes(
                {
                    "exact_duplicate_multiplicities": self.exact_duplicate_multiplicities,
                    "strict_subsumer_multiplicities": self.strict_subsumer_multiplicities,
                }
            )
        )


def load_authenticated_inputs(ledger_path: Path = LEDGER) -> CombinedInputs:
    authenticate_dependencies()
    if ledger_path.is_symlink() or not ledger_path.is_file():
        raise PromotionError("candidate ledger is not a regular file")
    if ledger_path.resolve() != LEDGER.resolve():
        raise PromotionError("candidate ledger path drifted")
    raw = ledger_path.read_bytes()
    if sha256_bytes(raw) != LEDGER_SHA256:
        raise PromotionError("candidate ledger byte hash drifted")
    ledger: Mapping[str, Any] = FOURPOINT_CORE.strict_json(raw)

    two_k_occurrences = TWO_K.validate_ledger(ledger)
    OTHER_CORE.validate_ledger(ledger)
    fourpoint_candidates = FOURPOINT_CORE.validate_ledger(ledger)
    two_k_suffix = TWO_K.render_dimacs_suffix(two_k_occurrences)
    other_core_suffix = OTHER_CORE.dimacs_suffix_clauses()
    fourpoint_core_suffix = FOURPOINT_CORE.render_dimacs_suffix(fourpoint_candidates)
    production_suffix = two_k_suffix + other_core_suffix

    if (
        len(two_k_suffix) != TWO_K_SUFFIX_CLAUSES
        or len(other_core_suffix) != OTHER_CORE_SUFFIX_CLAUSES
        or len(fourpoint_core_suffix) != FOURPOINT_CORE_CLAUSES
        or len(production_suffix) != PRODUCTION_SUFFIX_CLAUSES
        or len(set(production_suffix)) != PRODUCTION_SUFFIX_CLAUSES
    ):
        raise PromotionError("combined suffix cardinality or uniqueness drifted")
    two_k_set = set(two_k_suffix)
    other_core_set = set(other_core_suffix)
    fourpoint_core_set = set(fourpoint_core_suffix)
    observed_intersections = {
        "fourpoint_core_and_two_k": len(fourpoint_core_set & two_k_set),
        "fourpoint_core_and_other_core": len(fourpoint_core_set & other_core_set),
        "two_k_and_other_core": len(two_k_set & other_core_set),
    }
    if observed_intersections != EXPECTED_CROSS_FAMILY_INTERSECTIONS:
        raise PromotionError("cross-family clause intersection census drifted")
    if not fourpoint_core_set <= set(production_suffix):
        raise PromotionError("FourPoint-core clauses escaped the production suffix")
    return CombinedInputs(
        two_k_suffix=two_k_suffix,
        other_core_suffix=other_core_suffix,
        fourpoint_core_suffix=fourpoint_core_suffix,
        production_suffix=production_suffix,
    )


def classify_parent_prefix_novelty(
    parent_cnf: Path,
    suffix: Sequence[tuple[int, ...]],
    *,
    expected_sha256: str,
    expected_bytes: int,
    expected_num_variables: int,
    expected_total_clauses: int,
    parent_prefix_clauses: int,
) -> ParentNovelty:
    """Authenticate a whole DIMACS artifact and census only its parent prefix."""

    if not parent_cnf.is_file() or parent_cnf.is_symlink():
        raise PromotionError("parent baseline DIMACS is not a regular file")
    if parent_cnf.stat().st_size != expected_bytes:
        raise PromotionError("parent baseline DIMACS byte length drifted")
    target_sets = tuple(frozenset(clause) for clause in suffix)
    if any(
        len(clause) != len(target)
        for clause, target in zip(suffix, target_sets, strict=True)
    ):
        raise PromotionError("production suffix contains a repeated literal")
    literal_masks: dict[int, int] = {}
    for index, clause in enumerate(target_sets):
        bit = 1 << index
        for literal in clause:
            literal_masks[literal] = literal_masks.get(literal, 0) | bit
    exact = [0] * len(suffix)
    strict = [0] * len(suffix)
    digest = hashlib.sha256()
    header_seen = False
    physical_clause_count = 0
    all_targets_mask = (1 << len(suffix)) - 1
    with parent_cnf.open("rb") as handle:
        for raw_line in handle:
            digest.update(raw_line)
            stripped = raw_line.strip()
            if not stripped or stripped.startswith(b"c"):
                continue
            if stripped.startswith(b"p"):
                if header_seen or physical_clause_count:
                    raise PromotionError(
                        "parent baseline DIMACS header placement drifted"
                    )
                fields = stripped.split()
                if fields != [
                    b"p",
                    b"cnf",
                    str(expected_num_variables).encode(),
                    str(expected_total_clauses).encode(),
                ]:
                    raise PromotionError("parent baseline DIMACS header drifted")
                header_seen = True
                continue
            if not header_seen:
                raise PromotionError("parent baseline DIMACS clause precedes header")
            fields = stripped.split()
            if not fields or fields[-1] != b"0" or b"0" in fields[:-1]:
                raise PromotionError("parent baseline DIMACS clause is malformed")
            try:
                literals = tuple(int(field) for field in fields[:-1])
            except ValueError as error:
                raise PromotionError(
                    "parent baseline DIMACS clause contains a non-integer literal"
                ) from error
            if any(
                literal == 0 or abs(literal) > expected_num_variables
                for literal in literals
            ):
                raise PromotionError("parent baseline DIMACS literal is out of range")
            physical_clause_count += 1
            if physical_clause_count > parent_prefix_clauses:
                continue
            literal_set = frozenset(literals)
            mask = all_targets_mask
            for literal in literal_set:
                mask &= literal_masks.get(literal, 0)
                if mask == 0:
                    break
            while mask:
                low_bit = mask & -mask
                index = low_bit.bit_length() - 1
                if len(literal_set) == len(target_sets[index]):
                    exact[index] += 1
                elif len(literal_set) < len(target_sets[index]):
                    strict[index] += 1
                mask ^= low_bit
    if not header_seen:
        raise PromotionError("parent baseline DIMACS header is missing")
    if physical_clause_count != expected_total_clauses:
        raise PromotionError("parent baseline DIMACS physical clause count drifted")
    if parent_prefix_clauses > physical_clause_count:
        raise PromotionError("parent baseline DIMACS ended before the parent prefix")
    if digest.hexdigest() != expected_sha256:
        raise PromotionError("parent baseline DIMACS byte hash drifted")
    return ParentNovelty(tuple(exact), tuple(strict))


def verify_authenticated_parent_novelty(inputs: CombinedInputs) -> ParentNovelty:
    expected_path = (
        REPO
        / "scratch/runs/exact17-canary-perp-bisector-survivor-four-point-two-circle-"
        "preparer-20260822/preparation-v1/artifacts/cells/"
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none/"
        "canary-perp-bisector-survivor-four-point-two-circle-refinements-"
        "next-center-02-physical-none.cnf"
    )
    try:
        path_matches = PARENT_BASELINE_CNF.resolve(
            strict=True
        ) == expected_path.resolve(strict=True)
    except FileNotFoundError as error:
        raise PromotionError("parent baseline DIMACS path is unavailable") from error
    if not path_matches:
        raise PromotionError("parent baseline DIMACS path drifted")
    novelty = classify_parent_prefix_novelty(
        PARENT_BASELINE_CNF,
        inputs.production_suffix,
        expected_sha256=PARENT_BASELINE_CNF_SHA256,
        expected_bytes=PARENT_BASELINE_CNF_BYTES,
        expected_num_variables=PARENT_BASELINE_NUM_VARIABLES,
        expected_total_clauses=PARENT_BASELINE_TOTAL_CLAUSES,
        parent_prefix_clauses=PARENT_ROOT_CLAUSES,
    )
    if (
        novelty.exact_duplicate_clause_count != EXPECTED_PARENT_EXACT_DUPLICATE_CLAUSES
        or novelty.strictly_subsumed_clause_count
        != EXPECTED_PARENT_STRICTLY_SUBSUMED_CLAUSES
        or novelty.strict_new_clause_count != EXPECTED_PARENT_STRICT_NEW_CLAUSES
    ):
        raise PromotionError("parent prefix aggregate novelty census drifted")
    if EXPECTED_PARENT_NOVELTY_SHA256 and (
        novelty.census_sha256 != EXPECTED_PARENT_NOVELTY_SHA256
    ):
        raise PromotionError("parent prefix per-clause novelty census drifted")
    return novelty


LEAN_SOURCE = r"""/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the LICENSE file.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements
import Erdos9796Proof.P97.ATail.BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements
import Erdos9796Proof.P97.ListCNF

/-!
# Combined source-valid exact-seventeen v4 refinement successor

The production suffix is the duplicate-free union of the 236 two-Kalmanson
clauses and the eight other-core clauses.  The separately banked eight
FourPoint-core clauses are already contained in the two-Kalmanson family.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements

open ATailBlockerVExactSeventeenSourceNormalForm
open ATailBlockerVExactSeventeenSourceCnf
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4TwoKalmansonRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4OtherCoreRefinements
open ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CoreRefinements

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements def. -/
def fourPointTwoCircleV4CombinedRefinementClauses : ListCNF Atom :=
  v4TwoKalmansonRefinementClauses ++
    fourPointTwoCircleV4OtherCoreRefinementClauses

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem fourPointTwoCircleV4CombinedRefinementClauses_length :
    fourPointTwoCircleV4CombinedRefinementClauses.length = 244 := by
  simp [fourPointTwoCircleV4CombinedRefinementClauses,
    v4TwoKalmansonRefinementClauses_length,
    fourPointTwoCircleV4OtherCoreRefinementClauses_length]

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem fourPointTwoCircleV4CombinedRefinementClauses_nodup :
    fourPointTwoCircleV4CombinedRefinementClauses.Nodup := by
  native_decide

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem fourPointTwoCircleV4CoreRefinementClauses_subset_combined :
    ∀ clause ∈ fourPointTwoCircleV4CoreRefinementClauses,
      clause ∈ fourPointTwoCircleV4CombinedRefinementClauses := by
  native_decide

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A) :
    ∀ clause ∈ fourPointTwoCircleV4CombinedRefinementClauses,
      Std.Sat.CNF.Clause.eval (sourceAssign source.model) clause = true := by
  intro clause hclause
  rcases List.mem_append.mp hclause with htwoK | hother
  · exact sourceAssign_v4TwoKalmansonRefinementClauses source clause htwoK
  · exact sourceAssign_fourPointTwoCircleV4OtherCoreRefinementClauses
      source clause hother

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements def. -/
def canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf :
    ListCNF Atom :=
  canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf ++
    fourPointTwoCircleV4CombinedRefinementClauses

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf_length :
    canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf.length =
      7409760 := by
  simp [canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf,
    canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf_length,
    fourPointTwoCircleV4CombinedRefinementClauses_length]

/-- P97 ATail BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements theorem. -/
theorem sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf
    {A : Finset (EuclideanSpace ℝ (Fin 2))} (source : SourceRealization A)
    (horder : source.model.order = 0) :
    ListCNF.eval (sourceAssign source.model)
      canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf = true := by
  rw [ListCNF.eval, List.all_eq_true]
  intro clause hclause
  rcases List.mem_append.mp hclause with hparent | hsuffix
  · have hparentEval :=
      sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleRefinementCnf
        source horder
    rw [ListCNF.eval, List.all_eq_true] at hparentEval
    exact hparentEval clause hparent
  · exact sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
      source clause hsuffix

#print axioms fourPointTwoCircleV4CombinedRefinementClauses_nodup
#print axioms fourPointTwoCircleV4CoreRefinementClauses_subset_combined
#print axioms sourceAssign_fourPointTwoCircleV4CombinedRefinementClauses
#print axioms sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinementCnf

end ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircleV4CombinedRefinements
end Problem97
"""


def render_lean(inputs: CombinedInputs) -> str:
    if len(inputs.production_suffix) != PRODUCTION_SUFFIX_CLAUSES:
        raise PromotionError("combined suffix drifted before Lean rendering")
    if (
        EXPECTED_LEAN_SHA256
        and sha256_bytes(LEAN_SOURCE.encode()) != EXPECTED_LEAN_SHA256
    ):
        raise PromotionError("rendered Lean hash drifted")
    return LEAN_SOURCE


def write_text_once(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() or path.is_symlink():
        raise FileExistsError(f"immutable publication target exists: {path}")
    descriptor, staged_name = tempfile.mkstemp(
        prefix=f".{path.name}.stage-", dir=path.parent
    )
    staged = Path(staged_name)
    try:
        with os.fdopen(descriptor, "wb") as handle:
            handle.write(content.encode())
            handle.flush()
            os.fsync(handle.fileno())
        os.link(staged, path)
        directory = os.open(path.parent, os.O_RDONLY)
        try:
            os.fsync(directory)
        finally:
            os.close(directory)
    finally:
        staged.unlink(missing_ok=True)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--candidate-ledger", type=Path, default=LEDGER)
    parser.add_argument("--lean-output", type=Path, default=LEAN_OUTPUT)
    parser.add_argument("--check", action="store_true")
    args = parser.parse_args()
    inputs = load_authenticated_inputs(args.candidate_ledger)
    novelty = verify_authenticated_parent_novelty(inputs)
    rendered = render_lean(inputs)
    if args.check:
        if not args.lean_output.is_file() or args.lean_output.read_text() != rendered:
            raise PromotionError("checked Lean output drifted")
        action = "PASS"
    else:
        write_text_once(args.lean_output, rendered)
        action = "generated"
    print(
        f"{action} {args.lean_output}: {PRODUCTION_SUFFIX_CLAUSES} production clauses, "
        f"{PRODUCTION_ROOT_CLAUSES} root clauses; parent exact="
        f"{novelty.exact_duplicate_clause_count}, strict-subsumed="
        f"{novelty.strictly_subsumed_clause_count}, strict-new="
        f"{novelty.strict_new_clause_count}; census-sha256={novelty.census_sha256}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
