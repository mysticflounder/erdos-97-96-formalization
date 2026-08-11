/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SourceOrderTerminalBankConsumer
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericPerpBisectorNogoodCertificate

/-!
# Static-convex source-order cuts for exact-twelve Rigid221 jobs

This adapter deliberately sits outside the hash-pinned source-order terminal
bank consumer.  It packages the convex perpendicular-bisector contradiction as
the same typed positive-row cut interface without changing old bank sources or
journal attestations.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace SourceOrderTerminalBankConsumer

open Census554.EqualityCore
open GenericRowNogoodCertificate
open TerminalBankConsumer

/-- Package a perpendicular-bisector core as a typed positive-row cut.  Unlike
the realization-only terminals, this constructor deliberately consumes the
convexity hypothesis carried by the source-order terminal boundary. -/
def SourceOrderPositiveNogood.ofPerpBisectorCore
    (choices : List (RowChoice Label))
    (coreOf :
      ∀ {row : RowPattern Label},
        PositiveRowsMatch row choices → PerpBisectorCore row) :
    SourceOrderPositiveNogood where
  choices := choices
  refutes := by
    classical
    intro row pointOf hreal _order _hforced hconv hpositive
    exact false_of_convexIndep_of_perpBisectorCore hreal hconv
      (fun x => Finset.mem_image.mpr ⟨x, Finset.mem_univ x, rfl⟩)
      (coreOf hpositive)

/-- Package one checked positive-row perpendicular-bisector certificate as a
typed learned cut. -/
def SourceOrderPositiveNogood.ofPerpBisectorCertificate
    (choices : List (RowChoice Label))
    (data : PerpBisectorData Label)
    (hcheck : data.check choices = true) : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofPerpBisectorCore choices fun hrows =>
    (nonempty_perpBisectorCore_of_positiveCheck hrows data hcheck).some

end SourceOrderTerminalBankConsumer
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
