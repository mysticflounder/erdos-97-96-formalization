/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.N9Endpoint.Closure

/-!
# Exact declaration graph for the finite-nine publication packet

This read-only extractor emits one JSON object per declaration in the import closure of
`Problem97.FiniteN9Closure`.  It is specialized to the Lean 4.33.1 Prove2Me migration tree.
The output is written to stdout so the caller chooses the retained evidence path.
-/

open Lean

run_meta do
  let env ← getEnv
  let projectPrefix := `Erdos9796Proof
  let isProjectModule : Name → Bool := fun moduleName => projectPrefix.isPrefixOf moduleName
  let moduleNames := env.header.moduleNames
  let moduleFor? : Name → Option Name := fun name =>
    match env.getModuleIdxFor? name with
    | some index => moduleNames[index.toNat]?
    | none => none
  let keep : Name → Bool := fun name =>
    !name.isInternal || (privateToUserName? name).isSome
  let mut lines : Array String := #[]
  for (name, constantInfo) in env.constants.toList do
    unless keep name do continue
    let some moduleName := moduleFor? name | continue
    unless isProjectModule moduleName do continue
    let kind := match constantInfo with
      | .thmInfo _ => "theorem"
      | .defnInfo _ => "def"
      | .axiomInfo _ => "axiom"
      | .opaqueInfo _ => "opaque"
      | .inductInfo _ => "inductive"
      | .ctorInfo _ => "ctor"
      | .recInfo _ => "rec"
      | .quotInfo _ => "quot"
    let usedInType := constantInfo.type.getUsedConstants
    let usedInValue := match constantInfo with
      | .thmInfo theoremInfo => theoremInfo.value.getUsedConstants
      | .defnInfo definitionInfo => definitionInfo.value.getUsedConstants
      | .opaqueInfo opaqueInfo => opaqueInfo.value.getUsedConstants
      | _ => #[]
    let collect (seed : Array Name) : Std.HashSet Name := Id.run do
      let mut dependencies : Std.HashSet Name := {}
      let mut visited : Std.HashSet Name := {}
      let mut work := seed.toList
      while h : work ≠ [] do
        let dependency := work.head h
        work := work.tail
        if dependency == name || visited.contains dependency then continue
        visited := visited.insert dependency
        let some dependencyModule := moduleFor? dependency | continue
        unless isProjectModule dependencyModule do continue
        if keep dependency then
          dependencies := dependencies.insert dependency
        else
          match env.find? dependency with
          | some dependencyInfo =>
            let more := dependencyInfo.type.getUsedConstants ++ (match dependencyInfo with
              | .thmInfo theoremInfo => theoremInfo.value.getUsedConstants
              | .defnInfo definitionInfo => definitionInfo.value.getUsedConstants
              | _ => #[])
            work := more.toList ++ work
          | none => pure ()
      return dependencies
    let typeDependencies := collect usedInType
    let valueDependencies := collect usedInValue
    let range ← findDeclarationRanges? name
    let (startLine, endLine) := match range with
      | some declarationRange =>
        (declarationRange.range.pos.line, declarationRange.range.endPos.line)
      | none => (0, 0)
    let isPrivate := (privateToUserName? name).isSome
    let userName := (privateToUserName? name).getD name
    let isInstance ← Lean.Meta.isInstance name
    let renderDependencies (dependencies : Std.HashSet Name) : Json :=
      toJson (dependencies.toList.map (fun dependency => dependency.toString))
    let typeJson := renderDependencies typeDependencies
    let valueJson := renderDependencies valueDependencies
    let declarationJson := Json.mkObj [
      ("name", toJson name.toString),
      ("module", toJson moduleName.toString),
      ("kind", toJson kind),
      ("isPrivate", toJson isPrivate),
      ("isInstance", toJson isInstance),
      ("userName", toJson userName.toString),
      ("startLine", toJson startLine),
      ("endLine", toJson endLine),
      ("typeDeps", typeJson),
      ("valueDeps", valueJson)
    ]
    lines := lines.push declarationJson.compress
  for line in lines do
    IO.println line
