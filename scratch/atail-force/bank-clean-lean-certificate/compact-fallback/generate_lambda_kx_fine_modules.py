#!/usr/bin/env python3
"""Emit a hard-capped, fine-module replay of the exact lambda Kx certificate.

The earlier product modules still made Lean retain a multi-megabyte snapshot
tree before checking any algebra.  This generator gives every proof-DAG node
three independently bounded layers:

* public bucket definitions, greedily packed into family-part modules;
* a tiny family aggregate module;
* public merge identities, greedily packed into a dependency chain, followed
  by a tiny zero theorem.

Leaf zero modules contain only one bounded cofactor chunk and its generator
hypothesis.  A tiny terminal module turns the root zero theorem into ``Kx = 0``
and the generic double-reflection contradiction.  Every rendered module,
including imports and prelude commands, is checked against hard byte and
top-level-command caps before any file is written.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Mapping, Sequence


HERE = Path(__file__).resolve().parent
COARSE_GENERATOR = HERE / "generate_lambda_kx_bucketed_modules.py"
OUTPUT_DIR = HERE / "LambdaKxFine"
MANIFEST = HERE / "LambdaKxFine.manifest.json"

EXPECTED_COARSE_GENERATOR_SHA256 = (
    "a75220cdeb56c571588333ce728767321fe323b240394538638f942ca8af751b"
)
MODULE_PREFIX = "LambdaKxFine"
MODULE_NAMESPACE = "Problem97.ATailBankCleanLambdaKxFine"

# These are hard caps over the complete rendered source, not estimates over
# payload commands.  The margin below one decimal MB is intentional.
MAX_MODULE_SOURCE_BYTES = 900_000
MAX_MODULE_COMMANDS = 450
MAX_COMMAND_BYTES = 16_384


def file_sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        while block := stream.read(1024 * 1024):
            digest.update(block)
    return digest.hexdigest()


def bytes_sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def load_coarse_generator():
    actual = file_sha256(COARSE_GENERATOR)
    if actual != EXPECTED_COARSE_GENERATOR_SHA256:
        raise ValueError(
            "coarse module generator drift: expected "
            f"{EXPECTED_COARSE_GENERATOR_SHA256}, found {actual}"
        )
    spec = importlib.util.spec_from_file_location(
        "lambda_kx_coarse_helpers_for_fine_modules", COARSE_GENERATOR
    )
    if spec is None or spec.loader is None:
        raise RuntimeError(f"cannot load helpers from {COARSE_GENERATOR}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


M = load_coarse_generator()
B = M.B
OLD = M.OLD
MICRO = M.MICRO
Plan = M.Plan
SparsePolynomial = M.SparsePolynomial


@dataclass(frozen=True)
class Block:
    label: str
    text: str

    @property
    def command_bytes(self) -> int:
        return len((self.text.rstrip() + "\n").encode("utf-8"))


@dataclass(frozen=True)
class Artifact:
    module: str
    relative_file: str
    dependencies: tuple[str, ...]
    kind: str
    node_id: int | None
    source: bytes
    command_count: int
    max_command_bytes: int

    def manifest_record(self) -> dict[str, object]:
        return {
            "module": self.module,
            "file": self.relative_file,
            "dependencies": list(self.dependencies),
            "kind": self.kind,
            "node_id": self.node_id,
            "source_bytes": len(self.source),
            "source_sha256": bytes_sha256(self.source),
            "command_count": self.command_count,
            "max_command_bytes": self.max_command_bytes,
        }


def module_name(stem: str) -> str:
    return f"{MODULE_PREFIX}.{stem}"


def node_stem(node_id: int) -> str:
    return f"N{node_id:03d}"


def node_family_module(node_id: int) -> str:
    return module_name(f"{node_stem(node_id)}Family")


def node_zero_module(node_id: int) -> str:
    return module_name(f"{node_stem(node_id)}Zero")


def normalize_block(label: str, text: str) -> Block:
    block = Block(label, text.rstrip())
    if block.command_bytes > MAX_COMMAND_BYTES:
        raise ValueError(
            f"command {label} is {block.command_bytes} bytes; cap is {MAX_COMMAND_BYTES}"
        )
    return block


def prelude_blocks(imports: Sequence[str], title: str) -> list[Block | str]:
    answer: list[Block | str] = [
        normalize_block(f"import:{name}", f"import {name}") for name in imports
    ]
    answer.extend(
        (
            f"/-! {title} -/",
            normalize_block("namespace", f"namespace {MODULE_NAMESPACE}"),
            normalize_block("option:maxHeartbeats", "set_option maxHeartbeats 80000000"),
            normalize_block("option:maxRecDepth", "set_option maxRecDepth 100000"),
            normalize_block("option:unused", "set_option linter.unusedVariables false"),
            normalize_block("noncomputable", "noncomputable section"),
        )
    )
    return answer


def render_source(
    imports: Sequence[str], title: str, payload: Sequence[Block], *,
    scan: bool = True,
) -> tuple[bytes, int, int]:
    rendered_blocks = prelude_blocks(imports, title)
    rendered_blocks.extend(payload)
    rendered_blocks.extend(
        (
            normalize_block("section:end", "end"),
            normalize_block("namespace:end", f"end {MODULE_NAMESPACE}"),
        )
    )
    strings = [
        item.text if isinstance(item, Block) else item.rstrip()
        for item in rendered_blocks
    ]
    source = ("\n\n".join(strings) + "\n").encode("utf-8")
    commands = [item for item in rendered_blocks if isinstance(item, Block)]
    command_count = len(commands)
    max_command = max((item.command_bytes for item in commands), default=0)
    if scan:
        B.source_scan(source)
    if len(source) > MAX_MODULE_SOURCE_BYTES:
        raise ValueError(
            f"rendered module has {len(source)} bytes; cap is {MAX_MODULE_SOURCE_BYTES}"
        )
    if command_count > MAX_MODULE_COMMANDS:
        raise ValueError(
            f"rendered module has {command_count} commands; cap is {MAX_MODULE_COMMANDS}"
        )
    if max_command > MAX_COMMAND_BYTES:
        raise ValueError("rendered module command cap drift")
    return source, command_count, max_command


def make_artifact(
    *,
    stem: str,
    dependencies: Sequence[str],
    kind: str,
    node_id: int | None,
    title: str,
    payload: Sequence[Block],
    validate_source: bool = True,
) -> Artifact:
    source, command_count, max_command = render_source(
        dependencies, title, payload, scan=validate_source
    )
    return Artifact(
        module=module_name(stem),
        relative_file=f"{stem}.lean",
        dependencies=tuple(dependencies),
        kind=kind,
        node_id=node_id,
        source=source,
        command_count=command_count,
        max_command_bytes=max_command,
    )


def pack_artifacts(
    *,
    stem_prefix: str,
    initial_dependencies: Sequence[str],
    chained: bool,
    kind: str,
    node_id: int,
    title: str,
    blocks: Sequence[Block],
) -> list[Artifact]:
    """Greedily pack commands with exact full-source cap checks."""

    if not blocks:
        return []
    answer: list[Artifact] = []
    current: list[Block] = []
    shard_index = 0

    def dependencies() -> tuple[str, ...]:
        if chained and answer:
            return (answer[-1].module,)
        return tuple(initial_dependencies)

    def stem() -> str:
        return f"{stem_prefix}{shard_index:02d}"

    for block in blocks:
        trial = [*current, block]
        try:
            make_artifact(
                stem=stem(),
                dependencies=dependencies(),
                kind=kind,
                node_id=node_id,
                title=f"{title}, shard {shard_index}.",
                payload=trial,
                validate_source=False,
            )
        except ValueError:
            if not current:
                raise
            answer.append(
                make_artifact(
                    stem=stem(),
                    dependencies=dependencies(),
                    kind=kind,
                    node_id=node_id,
                    title=f"{title}, shard {shard_index}.",
                    payload=current,
                )
            )
            shard_index += 1
            current = [block]
            # Fail immediately if a fresh shard cannot hold this command.
            make_artifact(
                stem=stem(),
                dependencies=dependencies(),
                kind=kind,
                node_id=node_id,
                title=f"{title}, shard {shard_index}.",
                payload=current,
                validate_source=False,
            )
        else:
            current = trial
    if current:
        answer.append(
            make_artifact(
                stem=stem(),
                dependencies=dependencies(),
                kind=kind,
                node_id=node_id,
                title=f"{title}, shard {shard_index}.",
                payload=current,
            )
        )
    return answer


def family_for_node(plan: Plan, node_id: int) -> B.BucketFamily:
    node = plan.nodes[node_id]
    prefix = f"lambdaKxFineNode{node_id}"
    bucket_polynomials = plan.node_bucket_polynomials[node_id]
    part_names = tuple(
        None if not polynomial else f"{prefix}Part{bucket_index}"
        for bucket_index, polynomial in enumerate(bucket_polynomials)
    )
    aggregate_names = {
        shape.key: (
            f"{prefix}Value"
            if shape.key == plan.aggregate_root_key
            else f"{prefix}AggL{shape.level}Part{shape.index}"
        )
        for shape in plan.aggregate_shape
    }
    return B.BucketFamily(
        node_id=node_id,
        prefix=prefix,
        polynomial=node.polynomial,
        buckets=bucket_polynomials,
        part_names=part_names,
        aggregate_names=aggregate_names,
        root_name=aggregate_names[plan.aggregate_root_key],
    )


def family_definition_blocks(
    plan: Plan, node_id: int
) -> tuple[list[Block], list[Block], B.BucketFamily]:
    family = family_for_node(plan, node_id)
    variables = plan.variables
    binder = f"({' '.join(variables)} : ℝ)"
    part_blocks: list[Block] = []
    for bucket_index, polynomial in enumerate(family.buckets):
        name = family.part_names[bucket_index]
        if name is None:
            continue
        expression = OLD.render_polynomial(polynomial, variables)
        if len(polynomial) > B.MAX_BUCKET_ATOMS:
            raise ValueError(f"node {node_id} bucket atom cap drift")
        if len(expression.encode("utf-8")) > B.MAX_BUCKET_EXPRESSION_BYTES:
            raise ValueError(f"node {node_id} bucket expression cap drift")
        part_blocks.append(
            normalize_block(
                f"definition:{name}",
                f"@[simp] def {name} {binder} : ℝ :=\n  {expression}",
            )
        )

    aggregate_blocks: list[Block] = []
    for shape in plan.aggregate_shape:
        name = family.aggregate_names[shape.key]
        calls = [B.key_call(family, child, variables) for child in shape.child_keys]
        aggregate_blocks.append(
            normalize_block(
                f"definition:{name}",
                f"@[simp] def {name} {binder} : ℝ :=\n  {MICRO.balanced_sum(calls)}",
            )
        )
    return part_blocks, aggregate_blocks, family


def blocks_from_writer(writer, *, make_public: bool = False) -> list[Block]:
    if len(writer.blocks) != len(writer.commands):
        raise ValueError("helper writer block/command accounting drift")
    answer = []
    for raw, record in zip(writer.blocks, writer.commands, strict=True):
        text = raw.rstrip()
        if make_public:
            text = text.replace("private theorem ", "theorem ", 1)
            # Some bucket identities become reflexive after the public
            # definitions are unfolded.  Keep the normalizer valid whether
            # `simp only` closes the goal or leaves polynomial arithmetic.
            text = text.replace("]\n  ring", "] <;> ring")
        answer.append(normalize_block(str(record["label"]), text))
    return answer


def zero_hypothesis_lines(plan: Plan, generators: Sequence[int]) -> list[str]:
    return [
        f"    (h{plan.names[index]} : {plan.generators[index]} = 0)"
        for index in generators
    ]


def zero_hypothesis_arguments(plan: Plan, generators: Sequence[int]) -> str:
    return " ".join(f"h{plan.names[index]}" for index in generators)


def emit_leaf_zero_artifact(
    plan: Plan,
    node_id: int,
    family: B.BucketFamily,
    chunk_by_id: Mapping[int, object],
) -> Artifact:
    node = plan.nodes[node_id]
    if not node.is_leaf or node.chunk_id is None:
        raise ValueError("leaf zero requested for an internal node")
    chunk = chunk_by_id[node.chunk_id]
    generator_index = chunk.generator_index
    writer = MICRO.CommandWriter()
    cofactor = MICRO.emit_polynomial_family(
        writer,
        prefix=f"lambdaKxFineCofactor{chunk.chunk_id}",
        polynomial=chunk.cofactor,
        variables=plan.variables,
    )
    blocks = blocks_from_writer(writer)
    arguments = " ".join(plan.variables)
    binder = f"({arguments} : ℝ)"
    theorem_name = f"lambdaKxFineNode{node_id}Zero"
    hname = f"h{plan.names[generator_index]}"
    theorem = "\n".join(
        (
            f"theorem {theorem_name} {binder}",
            f"    ({hname} : {plan.generators[generator_index]} = 0) :",
            f"    {B.declaration_call(family.root_name, plan.variables)} = 0 := by",
            "  linear_combination",
            "    (norm := (simp ["
            + family.root_name
            + ", "
            + cofactor.aggregate
            + "]; ring))",
            f"    ({B.declaration_call(cofactor.aggregate, plan.variables)}) * {hname}",
        )
    )
    blocks.extend(
        (
            normalize_block(f"theorem:{theorem_name}", theorem),
            normalize_block("axioms", f"#print axioms {theorem_name}"),
            normalize_block(
                "progress",
                f'#eval IO.println "lambda Kx fine leaf {node_id}: checked"',
            ),
        )
    )
    return make_artifact(
        stem=f"{node_stem(node_id)}Zero",
        dependencies=(node_family_module(node_id),),
        kind="leaf-zero",
        node_id=node_id,
        title=f"Leaf-zero certificate for lambda Kx node {node_id}.",
        payload=blocks,
    )


def merge_identity_blocks(
    plan: Plan,
    node_id: int,
    families: Mapping[int, B.BucketFamily],
) -> tuple[list[Block], str]:
    node = plan.nodes[node_id]
    if node.is_leaf or node.left_id is None or node.right_id is None:
        raise ValueError("merge identity requested for a leaf")
    writer = MICRO.CommandWriter()
    theorem_name, _record = B.emit_merge_identity(
        writer,
        node=node,
        parent=families[node_id],
        left=families[node.left_id],
        right=families[node.right_id],
        aggregate_shape=plan.aggregate_shape,
        variables=plan.variables,
    )
    return blocks_from_writer(writer, make_public=True), theorem_name


def emit_internal_zero_artifact(
    plan: Plan,
    node_id: int,
    merge_module: str,
    merge_theorem: str,
    families: Mapping[int, B.BucketFamily],
    node_generators: Mapping[int, tuple[int, ...]],
) -> Artifact:
    node = plan.nodes[node_id]
    if node.left_id is None or node.right_id is None:
        raise ValueError("internal zero requested without children")
    generators = node_generators[node_id]
    left_generators = node_generators[node.left_id]
    right_generators = node_generators[node.right_id]
    arguments = " ".join(plan.variables)
    binder = f"({arguments} : ℝ)"
    theorem_name = f"lambdaKxFineNode{node_id}Zero"
    left_theorem = f"lambdaKxFineNode{node.left_id}Zero"
    right_theorem = f"lambdaKxFineNode{node.right_id}Zero"
    left_hypotheses = zero_hypothesis_arguments(plan, left_generators)
    right_hypotheses = zero_hypothesis_arguments(plan, right_generators)
    left_call = f"{left_theorem} {arguments}"
    right_call = f"{right_theorem} {arguments}"
    if left_hypotheses:
        left_call += f" {left_hypotheses}"
    if right_hypotheses:
        right_call += f" {right_hypotheses}"
    theorem = "\n".join(
        (
            f"theorem {theorem_name} {binder}",
            *zero_hypothesis_lines(plan, generators),
            f"    : {B.declaration_call(families[node_id].root_name, plan.variables)} = 0 := by",
            f"  have hleft := {left_call}",
            f"  have hright := {right_call}",
            f"  rw [{merge_theorem} {arguments}, hleft, hright]",
            "  norm_num",
        )
    )
    blocks = [
        normalize_block(f"theorem:{theorem_name}", theorem),
        normalize_block("axioms", f"#print axioms {theorem_name}"),
        normalize_block(
            "progress",
            f'#eval IO.println "lambda Kx fine node {node_id}: checked"',
        ),
    ]
    return make_artifact(
        stem=f"{node_stem(node_id)}Zero",
        dependencies=(
            merge_module,
            node_zero_module(node.left_id),
            node_zero_module(node.right_id),
        ),
        kind="merge-zero",
        node_id=node_id,
        title=f"Zero propagation for lambda Kx merge node {node_id}.",
        payload=blocks,
    )


def terminal_artifact(
    plan: Plan,
    families: Mapping[int, B.BucketFamily],
    node_generators: Mapping[int, tuple[int, ...]],
) -> Artifact:
    variables = plan.variables
    arguments = " ".join(variables)
    hypotheses = zero_hypothesis_lines(plan, range(len(plan.generators)))
    hypothesis_arguments = zero_hypothesis_arguments(
        plan, range(len(plan.generators))
    )
    root_zero = f"lambdaKxFineNode{plan.root_id}Zero"
    kx = "\n".join(
        (
            "theorem lambda_kx_zero",
            f"    ({arguments} : ℝ)",
            *hypotheses,
            "    : Kx = 0 := by",
            f"  have hroot := {root_zero} {arguments} {hypothesis_arguments}",
            f"  simpa [{families[plan.root_id].root_name}] using hroot",
        )
    )
    incompatible = "\n".join(
        (
            "theorem generic_double_reflection_lambda_incompatible",
            f"    ({arguments} : ℝ)",
            *hypotheses,
            "    : False := by",
            f"  have hKx : Kx = 0 := lambda_kx_zero {arguments} {hypothesis_arguments}",
            "  have hKy : Ky = 0 := by",
            "    nlinarith [sq_nonneg Ky]",
            "  have hGXK0 : Xx ^ 2 + Xy ^ 2 = 0 := by",
            "    simpa [hKx, hKy] using hGXK",
            "  have hXx : Xx = 0 := by",
            "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
            "  have hXy : Xy = 0 := by",
            "    nlinarith [sq_nonneg Xx, sq_nonneg Xy]",
            "  have hXZ0 : Zx ^ 2 + Zy ^ 2 = 0 := by",
            "    simpa [hKx, hXx, hXy] using hXZ",
            "  have hZx : Zx = 0 := by",
            "    nlinarith [sq_nonneg Zx, sq_nonneg Zy]",
            "  have hZAG0 : -2 * Zx + 1 = 0 := by",
            "    simpa [hKx, hKy] using hZAG",
            "  nlinarith",
        )
    )
    blocks = [
        normalize_block("progress:start", '#eval IO.println "lambda Kx fine terminal: root imported"'),
        normalize_block("theorem:lambda_kx_zero", kx),
        normalize_block("theorem:incompatible", incompatible),
        normalize_block("axioms:kx", "#print axioms lambda_kx_zero"),
        normalize_block(
            "axioms:incompatible",
            "#print axioms generic_double_reflection_lambda_incompatible",
        ),
        normalize_block("progress:end", '#eval IO.println "lambda Kx fine terminal: checked"'),
    ]
    if node_generators[plan.root_id] != tuple(range(len(plan.generators))):
        raise ValueError("root generator coverage drift")
    return make_artifact(
        stem="Terminal",
        dependencies=(node_zero_module(plan.root_id),),
        kind="terminal",
        node_id=plan.root_id,
        title="Tiny terminal for the exact lambda Kx certificate.",
        payload=blocks,
    )


def append_artifacts(
    target: list[Artifact], additions: Iterable[Artifact]
) -> None:
    seen = {artifact.module for artifact in target}
    for artifact in additions:
        if artifact.module in seen:
            raise ValueError(f"duplicate generated module {artifact.module}")
        missing = [dep for dep in artifact.dependencies if dep not in seen]
        if missing:
            raise ValueError(
                f"module {artifact.module} precedes dependencies {missing}"
            )
        target.append(artifact)
        seen.add(artifact.module)


def build() -> tuple[list[Artifact], dict[str, object]]:
    plan = M.build_plan()
    artifacts: list[Artifact] = []
    prelude = make_artifact(
        stem="Prelude",
        dependencies=("Mathlib",),
        kind="prelude",
        node_id=None,
        title="Shared import boundary for the fine lambda Kx replay.",
        payload=(),
    )
    # Mathlib is external to the generated DAG, so install Prelude manually.
    artifacts.append(prelude)

    chunk_by_id = {chunk.chunk_id: chunk for chunk in plan.chunks}
    families: dict[int, B.BucketFamily] = {}
    node_generators: dict[int, tuple[int, ...]] = {}

    for node_id in plan.topo:
        node = plan.nodes[node_id]
        part_blocks, aggregate_blocks, family = family_definition_blocks(
            plan, node_id
        )
        families[node_id] = family
        part_shards = pack_artifacts(
            stem_prefix=f"{node_stem(node_id)}FamilyPart",
            initial_dependencies=(module_name("Prelude"),),
            chained=False,
            kind="family-parts",
            node_id=node_id,
            title=f"Bucket definitions for lambda Kx node {node_id}",
            blocks=part_blocks,
        )
        append_artifacts(artifacts, part_shards)
        family_dependencies = tuple(
            shard.module for shard in part_shards
        ) or (module_name("Prelude"),)
        family_artifact = make_artifact(
            stem=f"{node_stem(node_id)}Family",
            dependencies=family_dependencies,
            kind="family-aggregate",
            node_id=node_id,
            title=f"Bucket aggregate for lambda Kx node {node_id}.",
            payload=aggregate_blocks,
        )
        append_artifacts(artifacts, (family_artifact,))

        if node.is_leaf:
            if node.generator_index is None:
                raise ValueError("leaf lost generator index")
            node_generators[node_id] = (node.generator_index,)
            zero_artifact = emit_leaf_zero_artifact(
                plan, node_id, family, chunk_by_id
            )
            append_artifacts(artifacts, (zero_artifact,))
            continue

        if node.left_id is None or node.right_id is None:
            raise ValueError("internal node lost child")
        node_generators[node_id] = tuple(
            sorted(
                set(node_generators[node.left_id])
                | set(node_generators[node.right_id])
            )
        )
        merge_blocks, merge_theorem = merge_identity_blocks(
            plan, node_id, families
        )
        merge_shards = pack_artifacts(
            stem_prefix=f"{node_stem(node_id)}MergePart",
            initial_dependencies=(
                node_family_module(node_id),
                node_family_module(node.left_id),
                node_family_module(node.right_id),
            ),
            chained=True,
            kind="merge-identity",
            node_id=node_id,
            title=f"Bucket merge identities for lambda Kx node {node_id}",
            blocks=merge_blocks,
        )
        if not merge_shards:
            raise ValueError("internal node emitted no merge identity")
        append_artifacts(artifacts, merge_shards)
        zero_artifact = emit_internal_zero_artifact(
            plan,
            node_id,
            merge_shards[-1].module,
            merge_theorem,
            families,
            node_generators,
        )
        append_artifacts(artifacts, (zero_artifact,))

    terminal = terminal_artifact(plan, families, node_generators)
    append_artifacts(artifacts, (terminal,))

    records = [artifact.manifest_record() for artifact in artifacts]
    manifest = {
        "schema": "p97-bank-clean-lambda-kx-fine-modules-v1",
        "generator_sha256": file_sha256(Path(__file__)),
        "coarse_generator_sha256": EXPECTED_COARSE_GENERATOR_SHA256,
        "bucketed_generator_sha256": M.EXPECTED_BUCKETED_GENERATOR_SHA256,
        "input_certificate_sha256": OLD.EXPECTED_CERTIFICATE_SHA256,
        "input_content_sha256": OLD.EXPECTED_CONTENT_SHA256,
        "exact_external_replay": True,
        "target": "Kx",
        "namespace": MODULE_NAMESPACE,
        "module_prefix": MODULE_PREFIX,
        "hard_caps": {
            "rendered_module_source_bytes": MAX_MODULE_SOURCE_BYTES,
            "top_level_commands": MAX_MODULE_COMMANDS,
            "single_command_bytes": MAX_COMMAND_BYTES,
            "overflow_allowed": False,
        },
        "bucket_stats": plan.bucket_stats,
        "chunk_count": len(plan.chunks),
        "node_count": len(plan.nodes),
        "root_node_id": plan.root_id,
        "terminal_module": terminal.module,
        "topological_order": [artifact.module for artifact in artifacts],
        "modules": records,
        "total_source_bytes": sum(len(artifact.source) for artifact in artifacts),
        "max_module_source_bytes": max(len(artifact.source) for artifact in artifacts),
        "total_command_count": sum(artifact.command_count for artifact in artifacts),
        "max_module_command_count": max(artifact.command_count for artifact in artifacts),
        "max_command_bytes": max(artifact.max_command_bytes for artifact in artifacts),
        "epistemic_status": (
            "exact deterministic hard-capped Lean source; kernel build pending"
        ),
    }
    return artifacts, manifest


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--check", action="store_true")
    arguments = parser.parse_args()
    artifacts, manifest = build()
    manifest_bytes = (
        json.dumps(manifest, indent=2, sort_keys=True) + "\n"
    ).encode("utf-8")
    expected_files = {artifact.relative_file for artifact in artifacts}

    if arguments.check:
        actual_files = (
            {str(path.relative_to(OUTPUT_DIR)) for path in OUTPUT_DIR.glob("*.lean")}
            if OUTPUT_DIR.exists()
            else set()
        )
        if actual_files != expected_files:
            raise SystemExit(
                "generated module set drift: expected "
                f"{len(expected_files)}, found {len(actual_files)}"
            )
        for artifact in artifacts:
            path = OUTPUT_DIR / artifact.relative_file
            if path.read_bytes() != artifact.source:
                raise SystemExit(f"generated module drift: {path}")
        if MANIFEST.read_bytes() != manifest_bytes:
            raise SystemExit(f"generated module manifest drift: {MANIFEST}")
        print("fine lambda Kx module generation check: PASS")
        print("modules", len(artifacts))
        print("max module bytes", manifest["max_module_source_bytes"])
        print("max module commands", manifest["max_module_command_count"])
        print("max command bytes", manifest["max_command_bytes"])
        return

    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    for artifact in artifacts:
        (OUTPUT_DIR / artifact.relative_file).write_bytes(artifact.source)
    MANIFEST.write_bytes(manifest_bytes)
    print(MANIFEST)
    print("modules", len(artifacts))
    print("total bytes", manifest["total_source_bytes"])
    print("max module bytes", manifest["max_module_source_bytes"])
    print("max module commands", manifest["max_module_command_count"])
    print("max command bytes", manifest["max_command_bytes"])


if __name__ == "__main__":
    main()
