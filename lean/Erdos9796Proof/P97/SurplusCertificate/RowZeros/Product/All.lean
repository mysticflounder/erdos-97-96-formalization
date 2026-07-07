/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R002UeqvR002YNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003NY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R003UeqvR003YY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R005UeqvR005NNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R005UeqvR005NNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R005UeqvR005NYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R005UeqvR005YNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R006UeqvR006
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R007UeqvR007NY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NNNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NNNNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NNNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYYNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009NYYYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YNNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R009UeqvR009YYYNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R010UeqvR010NYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R010UeqvR010NYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R010UeqvR010YNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R010UeqvR010YY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R011UeqvR011NNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R011UeqvR011NNNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R011UeqvR011YYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013NNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013NNYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013NYYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YNNN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YNNY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYNYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYN
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R013UeqvR013YYYY
import Erdos9796Proof.P97.SurplusCertificate.RowZeros.Product.R014UeqvR014YY

/-!
# Product-sum relaxed split row-zero aggregate

This generated module imports the row-zero proofs for product-sum singleton
relaxed split surplus certificate payloads.
-/

set_option linter.style.longLine false

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

namespace Bank

namespace RowZeros

namespace Product

/-- Certificate ids covered by product-sum relaxed split row-zero modules. -/
def productSumRowZeroCertificateIds : List String :=
[
  "R002:u=v:R002YNYN",
  "R003:u=v:R003NN",
  "R003:u=v:R003NY",
  "R003:u=v:R003YY",
  "R005:u=v:R005NNNN",
  "R005:u=v:R005NNY",
  "R005:u=v:R005NYN",
  "R005:u=v:R005YNY",
  "R006:u=v:R006",
  "R007:u=v:R007NY",
  "R009:u=v:R009NNNNN",
  "R009:u=v:R009NNNNY",
  "R009:u=v:R009NNNYN",
  "R009:u=v:R009NYNYN",
  "R009:u=v:R009NYYNY",
  "R009:u=v:R009NYYYY",
  "R009:u=v:R009YNNNN",
  "R009:u=v:R009YYYNN",
  "R010:u=v:R010NYN",
  "R010:u=v:R010NYY",
  "R010:u=v:R010YNN",
  "R010:u=v:R010YY",
  "R011:u=v:R011NNNN",
  "R011:u=v:R011NNNY",
  "R011:u=v:R011YYY",
  "R013:u=v:R013NNYN",
  "R013:u=v:R013NNYY",
  "R013:u=v:R013NYYN",
  "R013:u=v:R013YNNN",
  "R013:u=v:R013YNNY",
  "R013:u=v:R013YYNYN",
  "R013:u=v:R013YYYN",
  "R013:u=v:R013YYYY",
  "R014:u=v:R014YY"
]

set_option linter.style.nativeDecide false in
/-- Number of product-sum relaxed split row-zero modules emitted. -/
theorem productSumRowZeroCertificateIds_length :
    productSumRowZeroCertificateIds.length = 34 := by
  native_decide

end Product

end RowZeros

end Bank

end RelaxedSplit

end SurplusCertificate

end Problem97
