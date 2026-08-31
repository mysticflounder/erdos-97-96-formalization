/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Lean

open Lean

namespace P97.CegarLeanDeclarationSerializer

private def jsonObject (fields : List (String × Json)) : Json :=
  Json.mkObj fields

private def jsonArray (values : List Json) : Json :=
  .arr values.toArray

private def levelToJson : Level → Except String Json
  | .zero =>
      pure <| jsonObject [("tag", .str "ZERO")]
  | .succ level => do
      let serialized ← levelToJson level
      pure <| jsonObject [("tag", .str "SUCC"), ("of", serialized)]
  | .max left right => do
      let serializedLeft ← levelToJson left
      let serializedRight ← levelToJson right
      pure <| jsonObject
        [("tag", .str "MAX"), ("left", serializedLeft), ("right", serializedRight)]
  | .imax left right => do
      let serializedLeft ← levelToJson left
      let serializedRight ← levelToJson right
      pure <| jsonObject
        [("tag", .str "IMAX"), ("left", serializedLeft), ("right", serializedRight)]
  | .param name =>
      pure <| jsonObject [("tag", .str "PARAM"), ("name", .str name.toString)]
  | .mvar _ =>
      throw "closedness failure: universe-level metavariable"

private def levelsToJson (levels : List Level) : Except String Json := do
  pure <| jsonArray (← levels.mapM levelToJson)

private def binderInfoToken : BinderInfo → String
  | .default => "DEFAULT"
  | .implicit => "IMPLICIT"
  | .strictImplicit => "STRICT_IMPLICIT"
  | .instImplicit => "INSTANCE_IMPLICIT"

private partial def exprToJson (depth : Nat) : Expr → Except String Json
  | .bvar index =>
      if index < depth then
        pure <| jsonObject [("tag", .str "BVAR"), ("index", toJson index)]
      else
        throw s!"closedness failure: out-of-scope bound variable index {index} at depth {depth}"
  | .fvar _ =>
      throw "closedness failure: free variable"
  | .mvar _ =>
      throw "closedness failure: expression metavariable"
  | .sort level => do
      pure <| jsonObject [("tag", .str "SORT"), ("level", ← levelToJson level)]
  | .const name levels => do
      pure <| jsonObject
        [("tag", .str "CONST"), ("name", .str name.toString),
          ("levels", ← levelsToJson levels)]
  | .app function argument => do
      pure <| jsonObject
        [("tag", .str "APP"), ("function", ← exprToJson depth function),
          ("argument", ← exprToJson depth argument)]
  | .lam binderName binderType body binderInfo => do
      pure <| jsonObject
        [("tag", .str "LAM"), ("binder_name", .str binderName.toString),
          ("binder_info", .str <| binderInfoToken binderInfo),
          ("binder_type", ← exprToJson depth binderType),
          ("body", ← exprToJson (depth + 1) body)]
  | .forallE binderName binderType body binderInfo => do
      pure <| jsonObject
        [("tag", .str "FORALL"), ("binder_name", .str binderName.toString),
          ("binder_info", .str <| binderInfoToken binderInfo),
          ("binder_type", ← exprToJson depth binderType),
          ("body", ← exprToJson (depth + 1) body)]
  | .letE binderName binderType value body nondependent => do
      pure <| jsonObject
        [("tag", .str "LET"), ("binder_name", .str binderName.toString),
          ("binder_type", ← exprToJson depth binderType),
          ("value", ← exprToJson depth value),
          ("body", ← exprToJson (depth + 1) body), ("nondependent", .bool nondependent)]
  | .lit (.natVal value) =>
      pure <| jsonObject [("tag", .str "NAT_LITERAL"), ("value", toJson value)]
  | .lit (.strVal value) =>
      pure <| jsonObject [("tag", .str "STRING_LITERAL"), ("value", .str value)]
  | .mdata _ expression =>
      exprToJson depth expression
  | .proj typeName index structValue => do
      pure <| jsonObject
        [("tag", .str "PROJ"), ("type_name", .str typeName.toString),
          ("index", toJson index), ("structure", ← exprToJson depth structValue)]

private partial def constantDescriptors
    (expression : Expr) : Except String (Array (String × Json)) :=
  match expression with
  | .bvar _ | .lit _ =>
      pure #[]
  | .fvar _ =>
      throw "closedness failure: free variable"
  | .mvar _ =>
      throw "closedness failure: expression metavariable"
  | .sort level => do
      discard <| levelToJson level
      pure #[]
  | .const name levels => do
      let descriptor := jsonObject
        [("name", .str name.toString), ("levels", ← levelsToJson levels)]
      pure #[(descriptor.compress, descriptor)]
  | .app function argument => do
      let functionConstants ← constantDescriptors function
      let argumentConstants ← constantDescriptors argument
      pure <| functionConstants ++ argumentConstants
  | .lam _ binderType body _ | .forallE _ binderType body _ => do
      let binderConstants ← constantDescriptors binderType
      let bodyConstants ← constantDescriptors body
      pure <| binderConstants ++ bodyConstants
  | .letE _ binderType value body _ => do
      let binderConstants ← constantDescriptors binderType
      let valueConstants ← constantDescriptors value
      let bodyConstants ← constantDescriptors body
      pure <| binderConstants ++ valueConstants ++ bodyConstants
  | .mdata _ inner =>
      constantDescriptors inner
  | .proj _ _ structValue =>
      constantDescriptors structValue

private def sortedUniqueDescriptors (items : Array (String × Json)) : Array Json := Id.run do
  let sorted := items.qsort fun left right => left.1 < right.1
  let mut previous? : Option String := none
  let mut result := #[]
  for item in sorted do
    let isDuplicate := previous?.any fun previous => previous == item.1
    unless isDuplicate do
      result := result.push item.2
      previous? := some item.1
  return result

private def sortedUniqueStrings (items : Array String) : Array String := Id.run do
  let sorted := items.qsort (· < ·)
  let mut previous? : Option String := none
  let mut result := #[]
  for item in sorted do
    let isDuplicate := previous?.any fun previous => previous == item
    unless isDuplicate do
      result := result.push item
      previous? := some item
  return result

private partial def hypothesesToJson (expression : Expr) : Except String (Array Json) :=
  go expression 0 0 #[]
where
  go (current : Expr) (depth index : Nat) (result : Array Json) : Except String (Array Json) :=
    match current with
    | .mdata _ inner =>
        go inner depth index result
    | .forallE binderName binderType body binderInfo => do
        let hypothesis := jsonObject
          [("index", toJson index), ("binder_name", .str binderName.toString),
            ("binder_info", .str <| binderInfoToken binderInfo),
            ("type", ← exprToJson depth binderType)]
        go body (depth + 1) (index + 1) (result.push hypothesis)
    | _ =>
        pure result

private def declarationKind : ConstantInfo → String
  | .axiomInfo _ => "AXIOM"
  | .defnInfo _ => "DEFINITION"
  | .thmInfo _ => "THEOREM"
  | .opaqueInfo _ => "OPAQUE"
  | .quotInfo _ => "QUOTIENT"
  | .inductInfo _ => "INDUCTIVE"
  | .ctorInfo _ => "CONSTRUCTOR"
  | .recInfo _ => "RECURSOR"

private def parseCanonicalName (role value : String) : Except String Name :=
  let name := value.toName
  if name.isAnonymous || name.toString != value then
    throw s!"name failure: {role} is not a canonical Lean name: {value}"
  else
    pure name

private def buildExport
    (registryId importModule qualifiedName : String) (env : Environment) : Except String Json := do
  let declarationName ← parseCanonicalName "qualified declaration name" qualifiedName
  let some info := env.find? declarationName
    | throw s!"name failure: declaration not found exactly: {qualifiedName}"
  let some moduleIndex := env.getModuleIdxFor? declarationName
    | throw s!"name failure: defining module unavailable for: {qualifiedName}"
  let some definingModule := env.header.moduleNames[moduleIndex.toNat]?
    | throw s!"name failure: invalid defining-module index for: {qualifiedName}"
  let elaboratedType ← exprToJson 0 info.type
  let constants := sortedUniqueDescriptors (← constantDescriptors info.type)
  let hypotheses ← hypothesesToJson info.type
  let imports := sortedUniqueStrings <| env.header.moduleNames.map Name.toString
  let universeParameters := info.levelParams.toArray.map fun name => Json.str name.toString
  pure <| jsonObject
    [("schema", .str "p97-cegar-lean-declaration-export/v1"),
      ("registry_id", .str registryId), ("import_module", .str importModule),
      ("qualified_name", .str qualifiedName), ("defining_module", .str definingModule.toString),
      ("declaration_kind", .str <| declarationKind info), ("is_unsafe", .bool info.isUnsafe),
      ("is_partial", .bool info.isPartial), ("universe_parameters", .arr universeParameters),
      ("elaborated_type", elaboratedType), ("hypotheses", .arr hypotheses),
      ("constants", .arr constants), ("imports", toJson imports)]

private def importEnvironment
    (moduleName : Name) (importModule : String) : IO (Except String Environment) := do
  try
    return .ok (← Lean.importModules #[{ module := moduleName }] {} (trustLevel := 0))
  catch error =>
    return .error s!"import failure for {importModule}: {error}"

private def exportDeclaration
    (registryId importModule qualifiedName : String) : ExceptT String IO Json := do
  let moduleName ←
    match parseCanonicalName "import module" importModule with
    | .ok name => pure name
    | .error message => throw message
  let env ← importEnvironment moduleName importModule
  match buildExport registryId importModule qualifiedName env with
  | .ok output => pure output
  | .error message => throw message

private def reportFailure (message : String) : IO UInt32 := do
  IO.eprintln s!"cegar_lean_declaration_serializer: {message}"
  pure 1

end P97.CegarLeanDeclarationSerializer

def main (args : List String) : IO UInt32 := do
  match args with
  | [registryId, importModule, qualifiedName] =>
      match ← P97.CegarLeanDeclarationSerializer.exportDeclaration
          registryId importModule qualifiedName |>.run with
      | .ok output =>
          IO.print (output.compress ++ "\n")
          pure 0
      | .error message =>
          P97.CegarLeanDeclarationSerializer.reportFailure message
  | _ =>
      P97.CegarLeanDeclarationSerializer.reportFailure
        "arity failure: expected <registry-id> <import-module> <qualified-name>"
